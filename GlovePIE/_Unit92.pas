//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit92;

interface

uses
  SysUtils, Classes;

type
  TIdStackBSDBase = class(TIdStack)
  published
    procedure WSGetSockOpt(ASocket:Cardinal; Alevel:Integer; var AOptlen:Integer; AOptval:PAnsiChar; AOptname:Integer);//005A3CF0
    procedure SetBlocking(ASocket:Cardinal; ABlocking:Boolean);//005A3CF8
    procedure WSSocket(AFamily:Integer; AStruct:Integer; AOverlapped:Boolean; AProtocol:Integer);//005A3CE8
    //procedure RecvFrom(ASocket:Cardinal; var ABuffer:?; var VIPVersion:TIdIPVersion; var VPort:Word; var VIP:string; AFlags:Integer; ALength:Integer);//005A3CD8
    //procedure WSSendTo(ASocket:Cardinal; ABuffer:?; AIPVersion:TIdIPVersion; APort:Word; AIP:string; AFlags:Integer; ABufferLength:Integer);//005A3CE0
    procedure WouldBlock(AResult:Integer);//005A3D00
    procedure DropMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);//005A434C
    procedure AddMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);//005A438C
    procedure SetLoopBack(AHandle:Cardinal; AValue:Boolean; AIPVersion:TIdIPVersion);//005A4430
    function NewSocketHandle(ASocketType:Integer; AProtocol:Integer; AOverlapped:Boolean; AIPVersion:TIdIPVersion):Cardinal;//005A41CC
    procedure SetMulticastTTL(AHandle:Cardinal; AValue:Byte; AIPVersion:TIdIPVersion);//005A43CC
    procedure Send(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer);//005A427C
    procedure ReceiveFrom(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes; var VIP:UnicodeString; var VPort:TIdPort; var VIPVersion:TIdIPVersion);//005A42B8
    procedure Receive(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes);//005A424C
    constructor Create();//005A4210
    procedure CheckIPVersionSupport(AIPVersion:TIdIPVersion);//005A3CB8
    procedure SendTo(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer; const AIP:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);//005A42FC
    procedure WSGetServByName(AServiceName:string);//005A3CC8
    procedure WSGetServByPort(APortNumber:Word);//005A3CD0
    //procedure TranslateStringToTInAddr(AIP:string; var AInAddr:?; AIPVersion:TIdIPVersion);//005A4094
    procedure SetSocketOption(ASocket:Cardinal; Alevel:Integer; Aoptlen:Integer; Aoptval:PAnsiChar; Aoptname:Integer);//005A3CC0
    //function TranslateTInAddrToString(var AInAddr:?; AIPVersion:TIdIPVersion):string;//005A3F40
  public
    constructor Create(); virtual;//v14//005A4210
    function NewSocketHandle(ASocketType:Integer; AProtocol:Integer; AOverlapped:Boolean; AIPVersion:TIdIPVersion):Cardinal; virtual;//v50//005A41CC
    procedure Receive(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes); virtual;//v6C//005A424C
    procedure Send(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer); virtual;//v70//005A427C
    procedure ReceiveFrom(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes; var VIP:UnicodeString; var VPort:TIdPort; var VIPVersion:TIdIPVersion); virtual;//v74//005A42B8
    procedure SendTo(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer; const AIP:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion); virtual;//v78//005A42FC
    procedure SetMulticastTTL(AHandle:Cardinal; AValue:Byte; AIPVersion:TIdIPVersion); virtual;//v84//005A43CC
    procedure SetLoopBack(AHandle:Cardinal; AValue:Boolean; AIPVersion:TIdIPVersion); virtual;//v88//005A4430
    procedure DropMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string); virtual;//v8C//005A434C
    procedure AddMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string); virtual;//v90//005A438C
    procedure MembershipSockOpt(AHandle:TIdStackSocketHandle; const AGroupIP:UnicodeString; const ALocalIP:UnicodeString; const ASockOpt:Integer; const AIPVersion:TIdIPVersion);//005A4494
  end;
  EIdInvalidServiceName = class(EIdException)
  end;
  EIdStackInitializationFailed = class(EIdStackError)
  end;
  EIdStackSetSizeExceeded = class(EIdStackError)
  end;
  EIdIPv6Unavailable = class(EIdException)
  end;
  TIdSocketListWindows = class(TIdSocketList)
  published
    procedure SetFDSet(var VSet:TFDSet);//005A6B3C
    procedure GetFDSet(var VSet:TFDSet);//005A6B90
    function Select(AReadList:TIdSocketList; AWriteList:TIdSocketList; ATimeout:Integer; AExceptList:TIdSocketList):Boolean;//005A6A9C
    function SelectReadList(var VSocketList:TIdSocketList; ATimeout:Integer):Boolean;//005A6A20
    function SelectRead(ATimeout:Integer):Boolean;//005A697C
    function ContainsSocket(AHandle:Cardinal):Boolean;//005A66EC
    procedure Remove(AHandle:Cardinal);//005A6848
    procedure Add(AHandle:Cardinal);//005A65F0
    function Count:Integer;//005A6744
    function Clone:TIdSocketList;//005A6C14
    procedure Clear;//005A66A4
  public
    FFDSet:TFDSet;//f8
    function GetItem(AIndex:Integer):TIdStackSocketHandle; virtual;//v0//005A6790
    procedure Add(AHandle:Cardinal); virtual;//v8//005A65F0
    function Clone:TIdSocketList; virtual;//vC//005A6C14
    function Count:Integer; virtual;//v10//005A6744
    procedure Remove(AHandle:Cardinal); virtual;//v14//005A6848
    procedure Clear; virtual;//v18//005A66A4
    function ContainsSocket(AHandle:Cardinal):Boolean; virtual;//v1C//005A66EC
    function Select(AReadList:TIdSocketList; AWriteList:TIdSocketList; ATimeout:Integer; AExceptList:TIdSocketList):Boolean; virtual;//v20//005A6A9C
    function SelectRead(ATimeout:Integer):Boolean; virtual;//v24//005A697C
    function SelectReadList(var VSocketList:TIdSocketList; ATimeout:Integer):Boolean; virtual;//v28//005A6A20
    function FDSelect(AReadSet:PFDSet; AWriteSet:PFDSet; AExceptSet:PFDSet; const ATimeout:Integer):Boolean;//005A69B4
  end;
  TIdStackWindows = class(TIdStackBSDBase)
  published
    destructor Destroy();//005A5860
    constructor Create();//005A57C0
    procedure GetPeerName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);//005A6F58
    procedure Disconnect(ASocket:Cardinal);//005A7054
    procedure Connect(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);//005A6EA4
    procedure WSSetLastError(AErr:Integer);//005A5FD8
    function WSGetLastError:Integer;//005A5FCC
    procedure Bind(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);//005A5994
    procedure WSGetSockOpt(ASocket:Cardinal; Alevel:Integer; var AOptlen:Integer; AOptval:PAnsiChar; AOptname:Integer);//005A65BC
    function CheckIPVersionSupport(AIPVersion:TIdIPVersion):Boolean;//005A76B0
    function SupportsIPv6:Boolean;//005A70F0
    procedure AddLocalAddressesToList(AAddresses:TStrings);//005A62BC
    //procedure WriteChecksum(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//005A7264
    function IOControl(s:Cardinal; cmd:Cardinal; var arg:Cardinal):Integer;//005A7190
    procedure GetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);//005A70B0
    procedure GetSocketName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);//005A64C0
    procedure SetSocketOption(ASocket:Cardinal; Alevel:Integer; Aoptlen:Integer; Aoptval:PAnsiChar; Aoptname:Integer);//005A707C
    procedure SetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);//005A5F98
    function NetworkToHost(AValue:Cardinal):Cardinal;//005A6210
    function NetworkToHost(AValue:Word):Word;//005A61F8
    procedure SetBlocking(ASocket:Cardinal; ABlocking:Boolean);//005A6BE4
    function NetworkToHost(AValue:Int64):Int64;//005A626C
    procedure Listen(ASocket:Cardinal; ABackLog:Integer);//005A5CC4
    function HostToNetwork(AValue:Word):Word;//005A61EC
    function Accept(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word):Cardinal;//005A5888
    function HostToNetwork(AValue:Int64):Int64;//005A621C
    function HostToNetwork(AValue:Cardinal):Cardinal;//005A6204
    //procedure WSSendTo(ASocket:Cardinal; ABuffer:?; AIPVersion:TIdIPVersion; APort:Word; AIP:string; AFlags:Integer; ABufferLength:Integer);//005A5E40
    procedure ReceiveMsg(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes; APkt:TIdPacketInfo);//005A73F4
    function WSTranslateSocketErrorMsg(AErr:Integer):string;//005A68D8
    function WSSocket(AFamily:Integer; AStruct:Integer; AOverlapped:Boolean; AProtocol:Integer):Cardinal;//005A5FE4
    //function RecvFrom(ASocket:Cardinal; var VBuffer:?; var VIPVersion:TIdIPVersion; var VPort:Word; var VIP:string; AFlags:Integer; ALength:Integer):Integer;//005A5D04
    function HostByAddress(AAddress:string; AIPVersion:TIdIPVersion):string;//005A5A5C
    function WouldBlock(AResult:Integer):Boolean;//005A6CB0
    function WSGetServByPort(APortNumber:Word):TStrings;//005A6108
    function WSGetServByName(AServiceName:string):Word;//005A6014
  public
    destructor Destroy(); virtual;//005A5860
    function HostByName(const AHostName:UnicodeString; const AIPVersion:TIdIPVersion):UnicodeString; virtual;//v0//005A6CD8
    function ReadHostName:UnicodeString; virtual;//v4//005A5C54
    function Accept(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word):Cardinal; virtual;//v8//005A5888
    procedure Bind(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word); virtual;//vC//005A5994
    procedure Connect(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word); virtual;//v10//005A6EA4
    constructor Create(); virtual;//v14//005A57C0
    procedure Disconnect(ASocket:Cardinal); virtual;//v18//005A7054
    function IOControl(s:Cardinal; cmd:Cardinal; var arg:Cardinal):Integer; virtual;//v1C//005A7190
    procedure GetPeerName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word); virtual;//v20//005A6F58
    procedure GetSocketName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word); virtual;//v24//005A64C0
    function HostByAddress(AAddress:string; AIPVersion:TIdIPVersion):string; virtual;//v28//005A5A5C
    function HostToNetwork(AValue:Word):Word; virtual;//v2C//005A61EC
    function HostToNetwork(AValue:Cardinal):Cardinal; virtual;//v30//005A6204
    function HostToNetwork(AValue:Int64):Int64; virtual;//v34//005A621C
    procedure Listen(ASocket:Cardinal; ABackLog:Integer); virtual;//v3C//005A5CC4
    function WSGetLastError:Integer; virtual;//v40//005A5FCC
    procedure WSSetLastError(AErr:Integer); virtual;//v44//005A5FD8
    function WSTranslateSocketErrorMsg(AErr:Integer):string; virtual;//v48//005A68D8
    function NetworkToHost(AValue:Word):Word; virtual;//v54//005A61F8
    function NetworkToHost(AValue:Cardinal):Cardinal; virtual;//v58//005A6210
    function NetworkToHost(AValue:Int64):Int64; virtual;//v5C//005A626C
    procedure GetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer); virtual;//v64//005A70B0
    procedure SetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer); virtual;//v68//005A5F98
    procedure ReceiveMsg(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes; APkt:TIdPacketInfo); virtual;//v7C//005A73F4
    function SupportsIPv6:Boolean; virtual;//v80//005A70F0
    //procedure WriteChecksum(?:?; ?:?; ?:?; ?:?; ?:?; ?:?); virtual;//v98//005A7264
    procedure AddLocalAddressesToList(AAddresses:TStrings); virtual;//v9C//005A62BC
    function HostToNetwork(AValue:LongWord):LongWord; virtual;//vA0//005A5A50
    function WSRecv(ASocket:TIdStackSocketHandle; var ABuffer:void ; const ABufferLength:Integer; const AFlags:Integer):Integer; virtual;//vA4//005A5CE8
    function WSSend(ASocket:TIdStackSocketHandle; const ABuffer:void ; const ABufferLength:Integer; const AFlags:Integer):Integer; virtual;//vA8//005A5E10
    function WSShutdown(ASocket:TIdStackSocketHandle; AHow:Integer):Integer; virtual;//vAC//005A64B4
    function CheckIPVersionSupport(AIPVersion:TIdIPVersion):Boolean; virtual;//vB0//005A76B0
    procedure SetSocketOption(ASocket:Cardinal; Alevel:Integer; Aoptlen:Integer; Aoptval:PAnsiChar; Aoptname:Integer); virtual;//vB4//005A707C
    function WSGetServByName(AServiceName:string):Word; virtual;//vB8//005A6014
    function WSGetServByPort(APortNumber:Word):TStrings; virtual;//vBC//005A6108
    //function RecvFrom(ASocket:Cardinal; var VBuffer:?; var VIPVersion:TIdIPVersion; var VPort:Word; var VIP:string; AFlags:Integer; ALength:Integer):Integer; virtual;//vC0//005A5D04
    //procedure WSSendTo(ASocket:Cardinal; ABuffer:?; AIPVersion:TIdIPVersion; APort:Word; AIP:string; AFlags:Integer; ABufferLength:Integer); virtual;//vC4//005A5E40
    function WSSocket(AFamily:Integer; AStruct:Integer; AOverlapped:Boolean; AProtocol:Integer):Cardinal; virtual;//vC8//005A5FE4
    procedure WSGetSockOpt(ASocket:Cardinal; Alevel:Integer; var AOptlen:Integer; AOptval:PAnsiChar; AOptname:Integer); virtual;//vCC//005A65BC
    procedure SetBlocking(ASocket:Cardinal; ABlocking:Boolean); virtual;//vD0//005A6BE4
    function WouldBlock(AResult:Integer):Boolean; virtual;//vD4//005A6CB0
    procedure WSQuerryIPv6Route(ASocket:TIdStackSocketHandle; const AIP:UnicodeString; const APort:Word; var VSource:void ; var VDest:void );//005A71A8
  end;
    function HostToNetwork(AValue:LongWord):LongWord;//005A5A50
    function ReadHostName:UnicodeString;//005A5C54
    function WSRecv(ASocket:TIdStackSocketHandle; var ABuffer:void ; const ABufferLength:Integer; const AFlags:Integer):Integer;//005A5CE8
    function WSSend(ASocket:TIdStackSocketHandle; const ABuffer:void ; const ABufferLength:Integer; const AFlags:Integer):Integer;//005A5E10
    function WSShutdown(ASocket:TIdStackSocketHandle; AHow:Integer):Integer;//005A64B4
    function GetItem(AIndex:Integer):TIdStackSocketHandle;//005A6790
    procedure ReadSet(AList:TIdSocketList; var ASet:TFDSet; var APSet:PFDSet);//005A6A7C
    function HostByName(const AHostName:UnicodeString; const AIPVersion:TIdIPVersion):UnicodeString;//005A6CD8
    //procedure sub_005A72BC(?:TIdStackWindows; ?:?; ?:?; ?:?; ?:?; ?:?);//005A72BC
    function ServeFile(ASocket:TIdStackSocketHandle; const AFileName:UnicodeString):Int64;//005A76F0

implementation

//005A3CB8
procedure TIdStackBSDBase.CheckIPVersionSupport(AIPVersion:TIdIPVersion);
begin
{*
>005A3CB8    jmp         @AbstractError
*}
end;

//005A3CC0
procedure TIdStackBSDBase.SetSocketOption(ASocket:Cardinal; Alevel:Integer; Aoptlen:Integer; Aoptval:PAnsiChar; Aoptname:Integer);
begin
{*
>005A3CC0    jmp         @AbstractError
*}
end;

//005A3CC8
procedure TIdStackBSDBase.WSGetServByName(AServiceName:string);
begin
{*
>005A3CC8    jmp         @AbstractError
*}
end;

//005A3CD0
procedure TIdStackBSDBase.WSGetServByPort(APortNumber:Word);
begin
{*
>005A3CD0    jmp         @AbstractError
*}
end;

//005A3CD8
{*procedure TIdStackBSDBase.RecvFrom(ASocket:Cardinal; var ABuffer:?; var VIPVersion:TIdIPVersion; var VPort:Word; var VIP:string; AFlags:Integer; ALength:Integer);
begin
>005A3CD8    jmp         @AbstractError
end;*}

//005A3CE0
{*procedure TIdStackBSDBase.WSSendTo(ASocket:Cardinal; ABuffer:?; AIPVersion:TIdIPVersion; APort:Word; AIP:string; AFlags:Integer; ABufferLength:Integer);
begin
>005A3CE0    jmp         @AbstractError
end;*}

//005A3CE8
procedure TIdStackBSDBase.WSSocket(AFamily:Integer; AStruct:Integer; AOverlapped:Boolean; AProtocol:Integer);
begin
{*
>005A3CE8    jmp         @AbstractError
*}
end;

//005A3CF0
procedure TIdStackBSDBase.WSGetSockOpt(ASocket:Cardinal; Alevel:Integer; var AOptlen:Integer; AOptval:PAnsiChar; AOptname:Integer);
begin
{*
>005A3CF0    jmp         @AbstractError
*}
end;

//005A3CF8
procedure TIdStackBSDBase.SetBlocking(ASocket:Cardinal; ABlocking:Boolean);
begin
{*
>005A3CF8    jmp         @AbstractError
*}
end;

//005A3D00
procedure TIdStackBSDBase.WouldBlock(AResult:Integer);
begin
{*
>005A3D00    jmp         @AbstractError
*}
end;

//005A3F40
{*function TIdStackBSDBase.TranslateTInAddrToString(var AInAddr:?; AIPVersion:TIdIPVersion):string;
begin
 005A3F40    push        ebp
 005A3F41    mov         ebp,esp
 005A3F43    push        0
 005A3F45    push        0
 005A3F47    push        0
 005A3F49    push        0
 005A3F4B    push        0
 005A3F4D    push        0
 005A3F4F    push        0
 005A3F51    push        0
 005A3F53    push        ebx
 005A3F54    push        esi
 005A3F55    push        edi
 005A3F56    mov         dword ptr [ebp-8],edx
 005A3F59    mov         dword ptr [ebp-4],eax
 005A3F5C    mov         esi,dword ptr [ebp+8]
 005A3F5F    xor         eax,eax
 005A3F61    push        ebp
 005A3F62    push        5A4063
 005A3F67    push        dword ptr fs:[eax]
 005A3F6A    mov         dword ptr fs:[eax],esp
 005A3F6D    sub         cl,1
>005A3F70    jb          005A3F79
>005A3F72    je          005A3FDD
>005A3F74    jmp         005A4040
 005A3F79    mov         eax,dword ptr [ebp-8]
 005A3F7C    movzx       eax,byte ptr [eax]
 005A3F7F    lea         edx,[ebp-0C]
 005A3F82    call        IntToStr
 005A3F87    push        dword ptr [ebp-0C]
 005A3F8A    push        5A4080;'.'
 005A3F8F    mov         eax,dword ptr [ebp-8]
 005A3F92    movzx       eax,byte ptr [eax+1]
 005A3F96    lea         edx,[ebp-10]
 005A3F99    call        IntToStr
 005A3F9E    push        dword ptr [ebp-10]
 005A3FA1    push        5A4080;'.'
 005A3FA6    mov         eax,dword ptr [ebp-8]
 005A3FA9    movzx       eax,byte ptr [eax+2]
 005A3FAD    lea         edx,[ebp-14]
 005A3FB0    call        IntToStr
 005A3FB5    push        dword ptr [ebp-14]
 005A3FB8    push        5A4080;'.'
 005A3FBD    mov         eax,dword ptr [ebp-8]
 005A3FC0    movzx       eax,byte ptr [eax+3]
 005A3FC4    lea         edx,[ebp-18]
 005A3FC7    call        IntToStr
 005A3FCC    push        dword ptr [ebp-18]
 005A3FCF    mov         eax,esi
 005A3FD1    mov         edx,7
 005A3FD6    call        @UStrCatN
>005A3FDB    jmp         005A4048
 005A3FDD    mov         eax,esi
 005A3FDF    call        @UStrClr
 005A3FE4    mov         edi,8
 005A3FE9    mov         ebx,dword ptr [ebp-8]
 005A3FEC    push        dword ptr [esi]
 005A3FEE    movzx       edx,word ptr [ebx]
 005A3FF1    mov         eax,dword ptr [ebp-4]
 005A3FF4    mov         ecx,dword ptr [eax]
 005A3FF6    call        dword ptr [ecx+54]
 005A3FF9    movzx       eax,ax
 005A3FFC    lea         ecx,[ebp-1C]
 005A3FFF    mov         edx,1
 005A4004    call        IntToHex
 005A4009    push        dword ptr [ebp-1C]
 005A400C    push        5A4090;':'
 005A4011    mov         eax,esi
 005A4013    mov         edx,3
 005A4018    call        @UStrCatN
 005A401D    add         ebx,2
 005A4020    dec         edi
>005A4021    jne         005A3FEC
 005A4023    mov         eax,dword ptr [esi]
 005A4025    mov         dword ptr [ebp-20],eax
 005A4028    mov         eax,dword ptr [ebp-20]
 005A402B    test        eax,eax
>005A402D    je          005A4034
 005A402F    sub         eax,4
 005A4032    mov         eax,dword ptr [eax]
 005A4034    mov         edx,eax
 005A4036    dec         edx
 005A4037    mov         eax,esi
 005A4039    call        @UStrSetLength
>005A403E    jmp         005A4048
 005A4040    mov         eax,dword ptr [ebp-4]
 005A4043    call        TIdStack.IPVersionUnsupported
 005A4048    xor         eax,eax
 005A404A    pop         edx
 005A404B    pop         ecx
 005A404C    pop         ecx
 005A404D    mov         dword ptr fs:[eax],edx
 005A4050    push        5A406A
 005A4055    lea         eax,[ebp-1C]
 005A4058    mov         edx,5
 005A405D    call        @UStrArrayClr
 005A4062    ret
>005A4063    jmp         @HandleFinally
>005A4068    jmp         005A4055
 005A406A    pop         edi
 005A406B    pop         esi
 005A406C    pop         ebx
 005A406D    mov         esp,ebp
 005A406F    pop         ebp
 005A4070    ret         4
end;*}

//005A4094
{*procedure TIdStackBSDBase.TranslateStringToTInAddr(AIP:string; var AInAddr:?; AIPVersion:TIdIPVersion);
begin
 005A4094    push        ebp
 005A4095    mov         ebp,esp
 005A4097    add         esp,0FFFFFFCC
 005A409A    push        ebx
 005A409B    push        esi
 005A409C    push        edi
 005A409D    xor         ebx,ebx
 005A409F    mov         dword ptr [ebp-24],ebx
 005A40A2    mov         dword ptr [ebp-20],ebx
 005A40A5    mov         dword ptr [ebp-1C],ebx
 005A40A8    mov         dword ptr [ebp-18],ebx
 005A40AB    mov         dword ptr [ebp-4],ebx
 005A40AE    mov         ebx,ecx
 005A40B0    mov         edi,edx
 005A40B2    mov         esi,eax
 005A40B4    xor         eax,eax
 005A40B6    push        ebp
 005A40B7    push        5A41AC
 005A40BC    push        dword ptr fs:[eax]
 005A40BF    mov         dword ptr fs:[eax],esp
 005A40C2    movzx       eax,byte ptr [ebp+8]
 005A40C6    sub         al,1
>005A40C8    jb          005A40D5
>005A40CA    je          005A4160
>005A40D0    jmp         005A4182
 005A40D5    lea         eax,[ebp-4]
 005A40D8    mov         edx,edi
 005A40DA    call        @UStrLAsg
 005A40DF    push        1
 005A40E1    lea         eax,[ebp-18]
 005A40E4    push        eax
 005A40E5    lea         eax,[ebp-4]
 005A40E8    mov         cl,1
 005A40EA    mov         edx,5A41C8;'.'
 005A40EF    call        Fetch
 005A40F4    mov         eax,dword ptr [ebp-18]
 005A40F7    call        IndyStrToInt
 005A40FC    mov         byte ptr [ebx],al
 005A40FE    push        1
 005A4100    lea         eax,[ebp-1C]
 005A4103    push        eax
 005A4104    lea         eax,[ebp-4]
 005A4107    mov         cl,1
 005A4109    mov         edx,5A41C8;'.'
 005A410E    call        Fetch
 005A4113    mov         eax,dword ptr [ebp-1C]
 005A4116    call        IndyStrToInt
 005A411B    mov         byte ptr [ebx+1],al
 005A411E    push        1
 005A4120    lea         eax,[ebp-20]
 005A4123    push        eax
 005A4124    lea         eax,[ebp-4]
 005A4127    mov         cl,1
 005A4129    mov         edx,5A41C8;'.'
 005A412E    call        Fetch
 005A4133    mov         eax,dword ptr [ebp-20]
 005A4136    call        IndyStrToInt
 005A413B    mov         byte ptr [ebx+2],al
 005A413E    push        1
 005A4140    lea         eax,[ebp-24]
 005A4143    push        eax
 005A4144    lea         eax,[ebp-4]
 005A4147    mov         cl,1
 005A4149    mov         edx,5A41C8;'.'
 005A414E    call        Fetch
 005A4153    mov         eax,dword ptr [ebp-24]
 005A4156    call        IndyStrToInt
 005A415B    mov         byte ptr [ebx+3],al
>005A415E    jmp         005A4189
 005A4160    lea         edx,[ebp-14]
 005A4163    mov         eax,edi
 005A4165    call        IPv6ToIdIPv6Address
 005A416A    lea         ecx,[ebp-34]
 005A416D    lea         edx,[ebp-14]
 005A4170    mov         eax,esi
 005A4172    mov         esi,dword ptr [eax]
 005A4174    call        dword ptr [esi+38]
 005A4177    lea         esi,[ebp-34]
 005A417A    mov         edi,ebx
 005A417C    movs        dword ptr [edi],dword ptr [esi]
 005A417D    movs        dword ptr [edi],dword ptr [esi]
 005A417E    movs        dword ptr [edi],dword ptr [esi]
 005A417F    movs        dword ptr [edi],dword ptr [esi]
>005A4180    jmp         005A4189
 005A4182    mov         eax,esi
 005A4184    call        TIdStack.IPVersionUnsupported
 005A4189    xor         eax,eax
 005A418B    pop         edx
 005A418C    pop         ecx
 005A418D    pop         ecx
 005A418E    mov         dword ptr fs:[eax],edx
 005A4191    push        5A41B3
 005A4196    lea         eax,[ebp-24]
 005A4199    mov         edx,4
 005A419E    call        @UStrArrayClr
 005A41A3    lea         eax,[ebp-4]
 005A41A6    call        @UStrClr
 005A41AB    ret
>005A41AC    jmp         @HandleFinally
>005A41B1    jmp         005A4196
 005A41B3    pop         edi
 005A41B4    pop         esi
 005A41B5    pop         ebx
 005A41B6    mov         esp,ebp
 005A41B8    pop         ebp
 005A41B9    ret         4
end;*}

//005A41CC
function TIdStackBSDBase.NewSocketHandle(ASocketType:Integer; AProtocol:Integer; AOverlapped:Boolean; AIPVersion:TIdIPVersion):Cardinal;
begin
{*
 005A41CC    push        ebp
 005A41CD    mov         ebp,esp
 005A41CF    push        ecx
 005A41D0    push        ebx
 005A41D1    push        esi
 005A41D2    mov         dword ptr [ebp-4],ecx
 005A41D5    mov         ebx,eax
 005A41D7    mov         eax,dword ptr [ebp-4]
 005A41DA    push        eax
 005A41DB    movzx       eax,byte ptr [ebp+8]
 005A41DF    push        eax
 005A41E0    movzx       eax,byte ptr [ebp+0C]
 005A41E4    mov         eax,dword ptr [eax*4+789EBC]
 005A41EB    mov         ecx,edx
 005A41ED    mov         edx,ebx
 005A41EF    xchg        eax,edx
 005A41F0    mov         esi,dword ptr [eax]
 005A41F2    call        dword ptr [esi+0C8]
 005A41F8    mov         esi,eax
 005A41FA    cmp         esi,0FFFFFFFF
>005A41FD    jne         005A4206
 005A41FF    mov         eax,ebx
 005A4201    call        TIdStack.RaiseLastSocketError
 005A4206    mov         eax,esi
 005A4208    pop         esi
 005A4209    pop         ebx
 005A420A    pop         ecx
 005A420B    pop         ebp
 005A420C    ret         8
*}
end;

//005A4210
constructor TIdStackBSDBase.Create();
begin
{*
 005A4210    push        ebx
 005A4211    push        esi
 005A4212    test        dl,dl
>005A4214    je          005A421E
 005A4216    add         esp,0FFFFFFF0
 005A4219    call        @ClassCreate
 005A421E    mov         ebx,edx
 005A4220    mov         esi,eax
 005A4222    xor         edx,edx
 005A4224    mov         eax,esi
 005A4226    call        TIdStack.Create
 005A422B    mov         dword ptr ds:[789EB8],esi
 005A4231    mov         eax,esi
 005A4233    test        bl,bl
>005A4235    je          005A4246
 005A4237    call        @AfterConstruction
 005A423C    pop         dword ptr fs:[0]
 005A4243    add         esp,0C
 005A4246    mov         eax,esi
 005A4248    pop         esi
 005A4249    pop         ebx
 005A424A    ret
*}
end;

//005A424C
procedure TIdStackBSDBase.Receive(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes);
begin
{*
 005A424C    push        ebx
 005A424D    push        esi
 005A424E    push        edi
 005A424F    mov         esi,ecx
 005A4251    mov         edi,edx
 005A4253    mov         ebx,eax
 005A4255    mov         eax,dword ptr [esi]
 005A4257    call        @DynArrayLength
 005A425C    push        eax
 005A425D    push        0
 005A425F    mov         ecx,dword ptr [esi]
 005A4261    mov         edx,edi
 005A4263    mov         eax,ebx
 005A4265    mov         esi,dword ptr [eax]
 005A4267    call        dword ptr [esi+0A4]
 005A426D    mov         edx,eax
 005A426F    mov         eax,ebx
 005A4271    call        TIdStack.CheckForSocketError
 005A4276    pop         edi
 005A4277    pop         esi
 005A4278    pop         ebx
 005A4279    ret
*}
end;

//005A427C
procedure TIdStackBSDBase.Send(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer);
begin
{*
 005A427C    push        ebp
 005A427D    mov         ebp,esp
 005A427F    push        ecx
 005A4280    push        ebx
 005A4281    push        esi
 005A4282    mov         esi,ecx
 005A4284    mov         dword ptr [ebp-4],edx
 005A4287    mov         ebx,eax
 005A4289    mov         ecx,dword ptr [ebp+0C]
 005A428C    mov         edx,dword ptr [ebp+8]
 005A428F    mov         eax,esi
 005A4291    call        IndyLength
 005A4296    test        eax,eax
>005A4298    jle         005A42B0
 005A429A    push        eax
 005A429B    push        0
 005A429D    mov         eax,dword ptr [ebp+0C]
 005A42A0    lea         ecx,[esi+eax]
 005A42A3    mov         edx,dword ptr [ebp-4]
 005A42A6    mov         eax,ebx
 005A42A8    mov         ebx,dword ptr [eax]
 005A42AA    call        dword ptr [ebx+0A8]
 005A42B0    pop         esi
 005A42B1    pop         ebx
 005A42B2    pop         ecx
 005A42B3    pop         ebp
 005A42B4    ret         8
*}
end;

//005A42B8
procedure TIdStackBSDBase.ReceiveFrom(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes; var VIP:UnicodeString; var VPort:TIdPort; var VIPVersion:TIdIPVersion);
begin
{*
 005A42B8    push        ebp
 005A42B9    mov         ebp,esp
 005A42BB    push        ecx
 005A42BC    push        ebx
 005A42BD    push        esi
 005A42BE    mov         esi,ecx
 005A42C0    mov         dword ptr [ebp-4],edx
 005A42C3    mov         ebx,eax
 005A42C5    mov         eax,dword ptr [esi]
 005A42C7    call        @DynArrayLength
 005A42CC    push        eax
 005A42CD    push        0
 005A42CF    mov         eax,dword ptr [ebp+10]
 005A42D2    push        eax
 005A42D3    mov         eax,dword ptr [ebp+0C]
 005A42D6    push        eax
 005A42D7    mov         eax,dword ptr [ebp+8]
 005A42DA    push        eax
 005A42DB    mov         ecx,dword ptr [esi]
 005A42DD    mov         edx,dword ptr [ebp-4]
 005A42E0    mov         eax,ebx
 005A42E2    mov         esi,dword ptr [eax]
 005A42E4    call        dword ptr [esi+0C0]
 005A42EA    mov         edx,eax
 005A42EC    mov         eax,ebx
 005A42EE    call        TIdStack.CheckForSocketError
 005A42F3    pop         esi
 005A42F4    pop         ebx
 005A42F5    pop         ecx
 005A42F6    pop         ebp
 005A42F7    ret         0C
*}
end;

//005A42FC
procedure TIdStackBSDBase.SendTo(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer; const AIP:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);
begin
{*
 005A42FC    push        ebp
 005A42FD    mov         ebp,esp
 005A42FF    push        ecx
 005A4300    push        ebx
 005A4301    push        esi
 005A4302    push        edi
 005A4303    mov         edi,ecx
 005A4305    mov         dword ptr [ebp-4],edx
 005A4308    mov         esi,eax
 005A430A    mov         ecx,dword ptr [ebp+18]
 005A430D    mov         edx,dword ptr [ebp+14]
 005A4310    mov         eax,edi
 005A4312    call        IndyLength
 005A4317    mov         ebx,eax
 005A4319    test        ebx,ebx
>005A431B    jle         005A4341
 005A431D    push        ebx
 005A431E    push        0
 005A4320    mov         eax,dword ptr [ebp+10]
 005A4323    push        eax
 005A4324    movzx       eax,word ptr [ebp+0C]
 005A4328    push        eax
 005A4329    movzx       eax,byte ptr [ebp+8]
 005A432D    push        eax
 005A432E    mov         eax,dword ptr [ebp+18]
 005A4331    lea         ecx,[edi+eax]
 005A4334    mov         edx,dword ptr [ebp-4]
 005A4337    mov         eax,esi
 005A4339    mov         esi,dword ptr [eax]
 005A433B    call        dword ptr [esi+0C4]
 005A4341    mov         eax,ebx
 005A4343    pop         edi
 005A4344    pop         esi
 005A4345    pop         ebx
 005A4346    pop         ecx
 005A4347    pop         ebp
 005A4348    ret         14
*}
end;

//005A434C
procedure TIdStackBSDBase.DropMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);
begin
{*
 005A434C    push        ebp
 005A434D    mov         ebp,esp
 005A434F    push        ecx
 005A4350    push        ebx
 005A4351    push        esi
 005A4352    push        edi
 005A4353    mov         dword ptr [ebp-4],ecx
 005A4356    mov         edi,edx
 005A4358    mov         esi,eax
 005A435A    mov         ebx,dword ptr [ebp+8]
 005A435D    mov         eax,dword ptr [ebp+0C]
 005A4360    push        eax
 005A4361    test        bl,bl
 005A4363    sete        al
 005A4366    mov         ecx,0D
 005A436B    mov         edx,0D
 005A4370    call        iif
 005A4375    push        eax
 005A4376    push        ebx
 005A4377    mov         ecx,dword ptr [ebp-4]
 005A437A    mov         edx,edi
 005A437C    mov         eax,esi
 005A437E    call        TIdStackBSDBase.MembershipSockOpt
 005A4383    pop         edi
 005A4384    pop         esi
 005A4385    pop         ebx
 005A4386    pop         ecx
 005A4387    pop         ebp
 005A4388    ret         8
*}
end;

//005A438C
procedure TIdStackBSDBase.AddMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);
begin
{*
 005A438C    push        ebp
 005A438D    mov         ebp,esp
 005A438F    push        ecx
 005A4390    push        ebx
 005A4391    push        esi
 005A4392    push        edi
 005A4393    mov         dword ptr [ebp-4],ecx
 005A4396    mov         edi,edx
 005A4398    mov         esi,eax
 005A439A    mov         ebx,dword ptr [ebp+8]
 005A439D    mov         eax,dword ptr [ebp+0C]
 005A43A0    push        eax
 005A43A1    test        bl,bl
 005A43A3    sete        al
 005A43A6    mov         ecx,0C
 005A43AB    mov         edx,0C
 005A43B0    call        iif
 005A43B5    push        eax
 005A43B6    push        ebx
 005A43B7    mov         ecx,dword ptr [ebp-4]
 005A43BA    mov         edx,edi
 005A43BC    mov         eax,esi
 005A43BE    call        TIdStackBSDBase.MembershipSockOpt
 005A43C3    pop         edi
 005A43C4    pop         esi
 005A43C5    pop         ebx
 005A43C6    pop         ecx
 005A43C7    pop         ebp
 005A43C8    ret         8
*}
end;

//005A43CC
procedure TIdStackBSDBase.SetMulticastTTL(AHandle:Cardinal; AValue:Byte; AIPVersion:TIdIPVersion);
begin
{*
 005A43CC    push        ebp
 005A43CD    mov         ebp,esp
 005A43CF    add         esp,0FFFFFFF8
 005A43D2    push        ebx
 005A43D3    push        esi
 005A43D4    push        edi
 005A43D5    mov         byte ptr [ebp-1],cl
 005A43D8    mov         edi,edx
 005A43DA    movzx       edx,byte ptr [ebp+8]
 005A43DE    sub         dl,1
>005A43E1    jb          005A43E7
>005A43E3    je          005A43F0
>005A43E5    jmp         005A43FC
 005A43E7    xor         ebx,ebx
 005A43E9    mov         esi,0A
>005A43EE    jmp         005A4405
 005A43F0    mov         ebx,29
 005A43F5    mov         esi,0A
>005A43FA    jmp         005A4405
 005A43FC    xor         ebx,ebx
 005A43FE    xor         esi,esi
 005A4400    call        TIdStack.IPVersionUnsupported
 005A4405    movzx       eax,byte ptr [ebp-1]
 005A4409    mov         dword ptr [ebp-8],eax
 005A440C    push        esi
 005A440D    lea         eax,[ebp-8]
 005A4410    push        eax
 005A4411    push        4
 005A4413    mov         ecx,ebx
 005A4415    mov         edx,edi
 005A4417    mov         eax,[00789EB8]
 005A441C    mov         ebx,dword ptr [eax]
 005A441E    call        dword ptr [ebx+0B4]
 005A4424    pop         edi
 005A4425    pop         esi
 005A4426    pop         ebx
 005A4427    pop         ecx
 005A4428    pop         ecx
 005A4429    pop         ebp
 005A442A    ret         4
*}
end;

//005A4430
procedure TIdStackBSDBase.SetLoopBack(AHandle:Cardinal; AValue:Boolean; AIPVersion:TIdIPVersion);
begin
{*
 005A4430    push        ebp
 005A4431    mov         ebp,esp
 005A4433    add         esp,0FFFFFFF8
 005A4436    push        ebx
 005A4437    push        esi
 005A4438    push        edi
 005A4439    mov         byte ptr [ebp-1],cl
 005A443C    mov         edi,edx
 005A443E    movzx       edx,byte ptr [ebp+8]
 005A4442    sub         dl,1
>005A4445    jb          005A444B
>005A4447    je          005A4454
>005A4449    jmp         005A4460
 005A444B    xor         ebx,ebx
 005A444D    mov         esi,0B
>005A4452    jmp         005A4469
 005A4454    mov         ebx,29
 005A4459    mov         esi,0B
>005A445E    jmp         005A4469
 005A4460    xor         ebx,ebx
 005A4462    xor         esi,esi
 005A4464    call        TIdStack.IPVersionUnsupported
 005A4469    movzx       eax,byte ptr [ebp-1]
 005A446D    mov         dword ptr [ebp-8],eax
 005A4470    push        esi
 005A4471    lea         eax,[ebp-8]
 005A4474    push        eax
 005A4475    push        4
 005A4477    mov         ecx,ebx
 005A4479    mov         edx,edi
 005A447B    mov         eax,[00789EB8]
 005A4480    mov         ebx,dword ptr [eax]
 005A4482    call        dword ptr [ebx+0B4]
 005A4488    pop         edi
 005A4489    pop         esi
 005A448A    pop         ebx
 005A448B    pop         ecx
 005A448C    pop         ecx
 005A448D    pop         ebp
 005A448E    ret         4
*}
end;

//005A4494
procedure TIdStackBSDBase.MembershipSockOpt(AHandle:TIdStackSocketHandle; const AGroupIP:UnicodeString; const ALocalIP:UnicodeString; const ASockOpt:Integer; const AIPVersion:TIdIPVersion);
begin
{*
 005A4494    push        ebp
 005A4495    mov         ebp,esp
 005A4497    add         esp,0FFFFFFE4
 005A449A    push        ebx
 005A449B    push        esi
 005A449C    push        edi
 005A449D    mov         esi,ecx
 005A449F    mov         edi,edx
 005A44A1    mov         ebx,eax
 005A44A3    movzx       eax,byte ptr [ebp+8]
 005A44A7    sub         al,1
>005A44A9    jb          005A44B2
>005A44AB    je          005A4503
>005A44AD    jmp         005A4546
 005A44B2    mov         edx,esi
 005A44B4    mov         eax,ebx
 005A44B6    call        TIdStack.IsValidIPv4MulticastGroup
 005A44BB    test        al,al
>005A44BD    je          005A454D
 005A44C3    push        0
 005A44C5    lea         ecx,[ebp-8]
 005A44C8    mov         edx,esi
 005A44CA    mov         eax,[00789EB8]
 005A44CF    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A44D4    push        0
 005A44D6    lea         ecx,[ebp-4]
 005A44D9    mov         edx,dword ptr [ebp+10]
 005A44DC    mov         eax,[00789EB8]
 005A44E1    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A44E6    mov         eax,dword ptr [ebp+0C]
 005A44E9    push        eax
 005A44EA    lea         eax,[ebp-8]
 005A44ED    push        eax
 005A44EE    push        8
 005A44F0    xor         ecx,ecx
 005A44F2    mov         edx,edi
 005A44F4    mov         eax,[00789EB8]
 005A44F9    mov         ebx,dword ptr [eax]
 005A44FB    call        dword ptr [ebx+0B4]
>005A4501    jmp         005A454D
 005A4503    mov         edx,esi
 005A4505    mov         eax,ebx
 005A4507    call        TIdStack.IsValidIPv6MulticastGroup
 005A450C    test        al,al
>005A450E    je          005A454D
 005A4510    push        1
 005A4512    lea         ecx,[ebp-1C]
 005A4515    mov         edx,esi
 005A4517    mov         eax,[00789EB8]
 005A451C    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A4521    xor         eax,eax
 005A4523    mov         dword ptr [ebp-0C],eax
 005A4526    mov         eax,dword ptr [ebp+0C]
 005A4529    push        eax
 005A452A    lea         eax,[ebp-1C]
 005A452D    push        eax
 005A452E    push        14
 005A4530    mov         ecx,29
 005A4535    mov         edx,edi
 005A4537    mov         eax,[00789EB8]
 005A453C    mov         ebx,dword ptr [eax]
 005A453E    call        dword ptr [ebx+0B4]
>005A4544    jmp         005A454D
 005A4546    mov         eax,ebx
 005A4548    call        TIdStack.IPVersionUnsupported
 005A454D    pop         edi
 005A454E    pop         esi
 005A454F    pop         ebx
 005A4550    mov         esp,ebp
 005A4552    pop         ebp
 005A4553    ret         0C
*}
end;

//005A57C0
constructor TIdStackWindows.Create();
begin
{*
 005A57C0    push        ebp
 005A57C1    mov         ebp,esp
 005A57C3    push        ebx
 005A57C4    push        esi
 005A57C5    push        edi
 005A57C6    test        dl,dl
>005A57C8    je          005A57D2
 005A57CA    add         esp,0FFFFFFF0
 005A57CD    call        @ClassCreate
 005A57D2    mov         ebx,edx
 005A57D4    mov         esi,eax
 005A57D6    xor         edx,edx
 005A57D8    mov         eax,esi
 005A57DA    call        TIdStackBSDBase.Create
 005A57DF    cmp         byte ptr ds:[789EC8],0;gvar_00789EC8
>005A57E6    jne         005A583D
 005A57E8    xor         eax,eax
 005A57EA    push        ebp
 005A57EB    push        5A580A
 005A57F0    push        dword ptr fs:[eax]
 005A57F3    mov         dword ptr fs:[eax],esp
 005A57F6    call        InitializeWinSock
 005A57FB    call        InitLibrary
 005A5800    xor         eax,eax
 005A5802    pop         edx
 005A5803    pop         ecx
 005A5804    pop         ecx
 005A5805    mov         dword ptr fs:[eax],edx
>005A5808    jmp         005A5836
>005A580A    jmp         @HandleOnException
 005A580F    dd          1
 005A5813    dd          00418C04;Exception
 005A5817    dd          005A581B
 005A581B    mov         ebx,eax
 005A581D    mov         ecx,dword ptr [ebx+4]
 005A5820    mov         dl,1
 005A5822    mov         eax,[005A3DC0];EIdStackInitializationFailed
 005A5827    call        EIdException.Create
 005A582C    call        @RaiseExcept
 005A5831    call        @DoneExcept
 005A5836    mov         byte ptr ds:[789EC8],1;gvar_00789EC8
 005A583D    mov         dword ptr ds:[789EC4],esi
 005A5843    mov         eax,esi
 005A5845    test        bl,bl
>005A5847    je          005A5858
 005A5849    call        @AfterConstruction
 005A584E    pop         dword ptr fs:[0]
 005A5855    add         esp,0C
 005A5858    mov         eax,esi
 005A585A    pop         edi
 005A585B    pop         esi
 005A585C    pop         ebx
 005A585D    pop         ebp
 005A585E    ret
*}
end;

//005A5860
destructor TIdStackWindows.Destroy();
begin
{*
 005A5860    push        ebx
 005A5861    push        esi
 005A5862    call        @BeforeDestruction
 005A5867    mov         ebx,edx
 005A5869    mov         esi,eax
 005A586B    mov         edx,ebx
 005A586D    and         dl,0FC
 005A5870    mov         eax,esi
 005A5872    call        TIdStack.Destroy
 005A5877    test        bl,bl
>005A5879    jle         005A5882
 005A587B    mov         eax,esi
 005A587D    call        @ClassDestroy
 005A5882    pop         esi
 005A5883    pop         ebx
 005A5884    ret
*}
end;

//005A5888
function TIdStackWindows.Accept(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word):Cardinal;
begin
{*
 005A5888    push        ebp
 005A5889    mov         ebp,esp
 005A588B    add         esp,0FFFFFFD4
 005A588E    push        ebx
 005A588F    push        esi
 005A5890    push        edi
 005A5891    xor         ebx,ebx
 005A5893    mov         dword ptr [ebp-2C],ebx
 005A5896    mov         dword ptr [ebp-28],ebx
 005A5899    mov         dword ptr [ebp-4],ecx
 005A589C    mov         esi,eax
 005A589E    xor         eax,eax
 005A58A0    push        ebp
 005A58A1    push        5A5982
 005A58A6    push        dword ptr fs:[eax]
 005A58A9    mov         dword ptr fs:[eax],esp
 005A58AC    mov         dword ptr [ebp-8],1C
 005A58B3    lea         eax,[ebp-8]
 005A58B6    push        eax
 005A58B7    lea         eax,[ebp-24]
 005A58BA    push        eax
 005A58BB    push        edx
 005A58BC    mov         eax,[0078CE24]
 005A58C1    mov         eax,dword ptr [eax]
 005A58C3    call        eax
 005A58C5    mov         ebx,eax
 005A58C7    cmp         ebx,0FFFFFFFF
>005A58CA    je          005A5967
 005A58D0    movzx       eax,word ptr [ebp-24]
 005A58D4    sub         ax,2
>005A58D8    je          005A58E2
 005A58DA    sub         ax,15
>005A58DE    je          005A591C
>005A58E0    jmp         005A5953
 005A58E2    lea         edi,[ebp-24]
 005A58E5    lea         eax,[ebp-28]
 005A58E8    push        eax
 005A58E9    lea         edx,[edi+4]
 005A58EC    xor         ecx,ecx
 005A58EE    mov         eax,esi
 005A58F0    call        TIdStackBSDBase.TranslateTInAddrToString
 005A58F5    mov         edx,dword ptr [ebp-28]
 005A58F8    mov         eax,dword ptr [ebp-4]
 005A58FB    call        @UStrAsg
 005A5900    movzx       eax,word ptr [edi+2]
 005A5904    push        eax
 005A5905    mov         eax,[0078D0E0]
 005A590A    mov         eax,dword ptr [eax]
 005A590C    call        eax
 005A590E    mov         edx,dword ptr [ebp+0C]
 005A5911    mov         word ptr [edx],ax
 005A5914    mov         eax,dword ptr [ebp+8]
 005A5917    mov         byte ptr [eax],0
>005A591A    jmp         005A5967
 005A591C    lea         eax,[ebp-2C]
 005A591F    push        eax
 005A5920    lea         edx,[ebp-1C]
 005A5923    mov         cl,1
 005A5925    mov         eax,esi
 005A5927    call        TIdStackBSDBase.TranslateTInAddrToString
 005A592C    mov         edx,dword ptr [ebp-2C]
 005A592F    mov         eax,dword ptr [ebp-4]
 005A5932    call        @UStrAsg
 005A5937    movzx       eax,word ptr [ebp-22]
 005A593B    push        eax
 005A593C    mov         eax,[0078D0E0]
 005A5941    mov         eax,dword ptr [eax]
 005A5943    call        eax
 005A5945    mov         edx,dword ptr [ebp+0C]
 005A5948    mov         word ptr [edx],ax
 005A594B    mov         eax,dword ptr [ebp+8]
 005A594E    mov         byte ptr [eax],1
>005A5951    jmp         005A5967
 005A5953    push        ebx
 005A5954    mov         eax,[0078DA64]
 005A5959    mov         eax,dword ptr [eax]
 005A595B    call        eax
 005A595D    or          ebx,0FFFFFFFF
 005A5960    mov         eax,esi
 005A5962    call        TIdStack.IPVersionUnsupported
 005A5967    xor         eax,eax
 005A5969    pop         edx
 005A596A    pop         ecx
 005A596B    pop         ecx
 005A596C    mov         dword ptr fs:[eax],edx
 005A596F    push        5A5989
 005A5974    lea         eax,[ebp-2C]
 005A5977    mov         edx,2
 005A597C    call        @UStrArrayClr
 005A5981    ret
>005A5982    jmp         @HandleFinally
>005A5987    jmp         005A5974
 005A5989    mov         eax,ebx
 005A598B    pop         edi
 005A598C    pop         esi
 005A598D    pop         ebx
 005A598E    mov         esp,ebp
 005A5990    pop         ebp
 005A5991    ret         8
*}
end;

//005A5994
procedure TIdStackWindows.Bind(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
 005A5994    push        ebp
 005A5995    mov         ebp,esp
 005A5997    add         esp,0FFFFFFE0
 005A599A    push        ebx
 005A599B    push        esi
 005A599C    push        edi
 005A599D    mov         edi,ecx
 005A599F    mov         dword ptr [ebp-4],edx
 005A59A2    mov         ebx,eax
 005A59A4    lea         eax,[ebp-20]
 005A59A7    xor         ecx,ecx
 005A59A9    mov         edx,1C
 005A59AE    call        @FillChar
 005A59B3    movzx       eax,byte ptr [ebp+8]
 005A59B7    sub         al,1
>005A59B9    jb          005A59BF
>005A59BB    je          005A59F2
>005A59BD    jmp         005A5A23
 005A59BF    lea         esi,[ebp-20]
 005A59C2    mov         word ptr [esi],2
 005A59C7    test        edi,edi
>005A59C9    je          005A59D9
 005A59CB    push        0
 005A59CD    lea         ecx,[esi+4]
 005A59D0    mov         edx,edi
 005A59D2    mov         eax,ebx
 005A59D4    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A59D9    movzx       eax,word ptr [ebp+0C]
 005A59DD    push        eax
 005A59DE    mov         eax,[0078D0DC]
 005A59E3    mov         eax,dword ptr [eax]
 005A59E5    call        eax
 005A59E7    mov         word ptr [esi+2],ax
 005A59EB    mov         esi,10
>005A59F0    jmp         005A5A2C
 005A59F2    mov         word ptr [ebp-20],17
 005A59F8    test        edi,edi
>005A59FA    je          005A5A0A
 005A59FC    push        1
 005A59FE    lea         ecx,[ebp-18]
 005A5A01    mov         edx,edi
 005A5A03    mov         eax,ebx
 005A5A05    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A5A0A    movzx       eax,word ptr [ebp+0C]
 005A5A0E    push        eax
 005A5A0F    mov         eax,[0078D0DC]
 005A5A14    mov         eax,dword ptr [eax]
 005A5A16    call        eax
 005A5A18    mov         word ptr [ebp-1E],ax
 005A5A1C    mov         esi,1C
>005A5A21    jmp         005A5A2C
 005A5A23    xor         esi,esi
 005A5A25    mov         eax,ebx
 005A5A27    call        TIdStack.IPVersionUnsupported
 005A5A2C    push        esi
 005A5A2D    lea         eax,[ebp-20]
 005A5A30    push        eax
 005A5A31    mov         eax,dword ptr [ebp-4]
 005A5A34    push        eax
 005A5A35    mov         eax,[0078D060]
 005A5A3A    mov         eax,dword ptr [eax]
 005A5A3C    call        eax
 005A5A3E    mov         edx,eax
 005A5A40    mov         eax,ebx
 005A5A42    call        TIdStack.CheckForSocketError
 005A5A47    pop         edi
 005A5A48    pop         esi
 005A5A49    pop         ebx
 005A5A4A    mov         esp,ebp
 005A5A4C    pop         ebp
 005A5A4D    ret         8
*}
end;

//005A5A50
function TIdStackWindows.HostToNetwork(AValue:LongWord):LongWord;
begin
{*
 005A5A50    push        edx
 005A5A51    mov         eax,[0078DA64]
 005A5A56    mov         eax,dword ptr [eax]
 005A5A58    call        eax
 005A5A5A    ret
*}
end;

//005A5A5C
function TIdStackWindows.HostByAddress(AAddress:string; AIPVersion:TIdIPVersion):string;
begin
{*
 005A5A5C    push        ebp
 005A5A5D    mov         ebp,esp
 005A5A5F    add         esp,0FFFFFFCC
 005A5A62    push        ebx
 005A5A63    push        esi
 005A5A64    push        edi
 005A5A65    xor         ebx,ebx
 005A5A67    mov         dword ptr [ebp-34],ebx
 005A5A6A    mov         dword ptr [ebp-4],ebx
 005A5A6D    mov         ebx,ecx
 005A5A6F    mov         dword ptr [ebp-8],edx
 005A5A72    mov         edi,eax
 005A5A74    mov         esi,dword ptr [ebp+8]
 005A5A77    xor         eax,eax
 005A5A79    push        ebp
 005A5A7A    push        5A5C41
 005A5A7F    push        dword ptr fs:[eax]
 005A5A82    mov         dword ptr fs:[eax],esp
 005A5A85    mov         eax,[0078D7F4]
 005A5A8A    cmp         byte ptr [eax],0
>005A5A8D    jne         005A5B27
 005A5A93    sub         bl,1
>005A5A96    jb          005A5A9C
>005A5A98    je          005A5AF5
>005A5A9A    jmp         005A5B1B
 005A5A9C    lea         eax,[ebp-4]
 005A5A9F    mov         edx,dword ptr [ebp-8]
 005A5AA2    mov         ecx,0
 005A5AA7    call        @LStrFromUStr
 005A5AAC    mov         eax,dword ptr [ebp-4]
 005A5AAF    call        @LStrToPChar
 005A5AB4    push        eax
 005A5AB5    mov         eax,[0078CCD0]
 005A5ABA    mov         eax,dword ptr [eax]
 005A5ABC    call        eax
 005A5ABE    mov         dword ptr [ebp-0C],eax
 005A5AC1    push        2
 005A5AC3    push        20
 005A5AC5    lea         eax,[ebp-0C]
 005A5AC8    push        eax
 005A5AC9    mov         eax,[0078D774]
 005A5ACE    mov         eax,dword ptr [eax]
 005A5AD0    call        eax
 005A5AD2    mov         ebx,eax
 005A5AD4    test        ebx,ebx
>005A5AD6    jne         005A5AE7
 005A5AD8    or          edx,0FFFFFFFF
 005A5ADB    mov         eax,edi
 005A5ADD    call        TIdStack.CheckForSocketError
>005A5AE2    jmp         005A5C23
 005A5AE7    mov         eax,esi
 005A5AE9    mov         edx,dword ptr [ebx]
 005A5AEB    call        @UStrFromPChar
>005A5AF0    jmp         005A5C23
 005A5AF5    lea         edx,[ebp-34]
 005A5AF8    mov         eax,[0078D768];^SResString659:TResStringRec
 005A5AFD    call        LoadResString
 005A5B02    mov         ecx,dword ptr [ebp-34]
 005A5B05    mov         dl,1
 005A5B07    mov         eax,[005A4558];EIdIPv6Unavailable
 005A5B0C    call        EIdException.Create
 005A5B11    call        @RaiseExcept
>005A5B16    jmp         005A5C23
 005A5B1B    mov         eax,edi
 005A5B1D    call        TIdStack.IPVersionUnsupported
>005A5B22    jmp         005A5C23
 005A5B27    mov         eax,ebx
 005A5B29    sub         al,2
>005A5B2B    jb          005A5B34
 005A5B2D    mov         eax,edi
 005A5B2F    call        TIdStack.IPVersionUnsupported
 005A5B34    lea         eax,[ebp-30]
 005A5B37    xor         ecx,ecx
 005A5B39    mov         edx,20
 005A5B3E    call        @FillChar
 005A5B43    movzx       eax,bl
 005A5B46    mov         edx,dword ptr ds:[78D518]
 005A5B4C    mov         eax,dword ptr [edx+eax*4]
 005A5B4F    mov         dword ptr [ebp-2C],eax
 005A5B52    mov         dword ptr [ebp-28],1
 005A5B59    mov         dword ptr [ebp-30],2
 005A5B60    xor         eax,eax
 005A5B62    mov         dword ptr [ebp-10],eax
 005A5B65    lea         eax,[ebp-10]
 005A5B68    push        eax
 005A5B69    lea         eax,[ebp-30]
 005A5B6C    push        eax
 005A5B6D    push        0
 005A5B6F    mov         eax,dword ptr [ebp-8]
 005A5B72    call        @UStrToPWChar
 005A5B77    push        eax
 005A5B78    mov         eax,[0078D7DC]
 005A5B7D    mov         eax,dword ptr [eax]
 005A5B7F    call        eax
 005A5B81    mov         ebx,eax
 005A5B83    test        ebx,ebx
>005A5B85    je          005A5B97
 005A5B87    mov         eax,ebx
 005A5B89    call        gaiErrorToWsaError
 005A5B8E    mov         edx,eax
 005A5B90    mov         eax,edi
 005A5B92    mov         ecx,dword ptr [eax]
 005A5B94    call        dword ptr [ecx+4C]
 005A5B97    xor         eax,eax
 005A5B99    push        ebp
 005A5B9A    push        5A5C1C
 005A5B9F    push        dword ptr fs:[eax]
 005A5BA2    mov         dword ptr fs:[eax],esp
 005A5BA5    mov         eax,esi
 005A5BA7    mov         edx,401
 005A5BAC    call        @UStrSetLength
 005A5BB1    push        4
 005A5BB3    push        0
 005A5BB5    push        0
 005A5BB7    push        401
 005A5BBC    mov         eax,dword ptr [esi]
 005A5BBE    call        @UStrToPWChar
 005A5BC3    push        eax
 005A5BC4    mov         eax,dword ptr [ebp-10]
 005A5BC7    mov         eax,dword ptr [eax+10]
 005A5BCA    push        eax
 005A5BCB    mov         eax,dword ptr [ebp-10]
 005A5BCE    mov         eax,dword ptr [eax+18]
 005A5BD1    push        eax
 005A5BD2    mov         eax,[0078D26C]
 005A5BD7    mov         eax,dword ptr [eax]
 005A5BD9    call        eax
 005A5BDB    mov         ebx,eax
 005A5BDD    test        ebx,ebx
>005A5BDF    je          005A5BF1
 005A5BE1    mov         eax,ebx
 005A5BE3    call        gaiErrorToWsaError
 005A5BE8    mov         edx,eax
 005A5BEA    mov         eax,edi
 005A5BEC    mov         ecx,dword ptr [eax]
 005A5BEE    call        dword ptr [ecx+4C]
 005A5BF1    mov         eax,dword ptr [esi]
 005A5BF3    call        @UStrToPWChar
 005A5BF8    mov         edx,eax
 005A5BFA    mov         eax,esi
 005A5BFC    call        @UStrFromPWChar
 005A5C01    xor         eax,eax
 005A5C03    pop         edx
 005A5C04    pop         ecx
 005A5C05    pop         ecx
 005A5C06    mov         dword ptr fs:[eax],edx
 005A5C09    push        5A5C23
 005A5C0E    mov         eax,dword ptr [ebp-10]
 005A5C11    push        eax
 005A5C12    mov         eax,[0078D290]
 005A5C17    mov         eax,dword ptr [eax]
 005A5C19    call        eax
 005A5C1B    ret
>005A5C1C    jmp         @HandleFinally
>005A5C21    jmp         005A5C0E
 005A5C23    xor         eax,eax
 005A5C25    pop         edx
 005A5C26    pop         ecx
 005A5C27    pop         ecx
 005A5C28    mov         dword ptr fs:[eax],edx
 005A5C2B    push        5A5C48
 005A5C30    lea         eax,[ebp-34]
 005A5C33    call        @UStrClr
 005A5C38    lea         eax,[ebp-4]
 005A5C3B    call        @LStrClr
 005A5C40    ret
>005A5C41    jmp         @HandleFinally
>005A5C46    jmp         005A5C30
 005A5C48    pop         edi
 005A5C49    pop         esi
 005A5C4A    pop         ebx
 005A5C4B    mov         esp,ebp
 005A5C4D    pop         ebp
 005A5C4E    ret         4
*}
end;

//005A5C54
function TIdStackWindows.ReadHostName:UnicodeString;
begin
{*
 005A5C54    push        ebp
 005A5C55    mov         ebp,esp
 005A5C57    push        0
 005A5C59    push        ebx
 005A5C5A    mov         ebx,edx
 005A5C5C    xor         eax,eax
 005A5C5E    push        ebp
 005A5C5F    push        5A5CB7
 005A5C64    push        dword ptr fs:[eax]
 005A5C67    mov         dword ptr fs:[eax],esp
 005A5C6A    lea         eax,[ebp-4]
 005A5C6D    xor         ecx,ecx
 005A5C6F    mov         edx,0FA
 005A5C74    call        @LStrSetLength
 005A5C79    push        0FA
 005A5C7E    mov         eax,dword ptr [ebp-4]
 005A5C81    call        @LStrToPChar
 005A5C86    push        eax
 005A5C87    mov         eax,[0078DA84]
 005A5C8C    mov         eax,dword ptr [eax]
 005A5C8E    call        eax
 005A5C90    mov         eax,dword ptr [ebp-4]
 005A5C93    call        @LStrToPChar
 005A5C98    mov         edx,eax
 005A5C9A    mov         eax,ebx
 005A5C9C    call        @UStrFromPChar
 005A5CA1    xor         eax,eax
 005A5CA3    pop         edx
 005A5CA4    pop         ecx
 005A5CA5    pop         ecx
 005A5CA6    mov         dword ptr fs:[eax],edx
 005A5CA9    push        5A5CBE
 005A5CAE    lea         eax,[ebp-4]
 005A5CB1    call        @LStrClr
 005A5CB6    ret
>005A5CB7    jmp         @HandleFinally
>005A5CBC    jmp         005A5CAE
 005A5CBE    pop         ebx
 005A5CBF    pop         ecx
 005A5CC0    pop         ebp
 005A5CC1    ret
*}
end;

//005A5CC4
procedure TIdStackWindows.Listen(ASocket:Cardinal; ABackLog:Integer);
begin
{*
 005A5CC4    push        ebx
 005A5CC5    push        esi
 005A5CC6    push        edi
 005A5CC7    mov         edi,ecx
 005A5CC9    mov         esi,edx
 005A5CCB    mov         ebx,eax
 005A5CCD    push        edi
 005A5CCE    push        esi
 005A5CCF    mov         eax,[0078D338]
 005A5CD4    mov         eax,dword ptr [eax]
 005A5CD6    call        eax
 005A5CD8    mov         edx,eax
 005A5CDA    mov         eax,ebx
 005A5CDC    call        TIdStack.CheckForSocketError
 005A5CE1    pop         edi
 005A5CE2    pop         esi
 005A5CE3    pop         ebx
 005A5CE4    ret
*}
end;

//005A5CE8
function TIdStackWindows.WSRecv(ASocket:TIdStackSocketHandle; var ABuffer:void ; const ABufferLength:Integer; const AFlags:Integer):Integer;
begin
{*
 005A5CE8    push        ebp
 005A5CE9    mov         ebp,esp
 005A5CEB    mov         eax,dword ptr [ebp+8]
 005A5CEE    push        eax
 005A5CEF    mov         eax,dword ptr [ebp+0C]
 005A5CF2    push        eax
 005A5CF3    push        ecx
 005A5CF4    push        edx
 005A5CF5    mov         eax,[0078D1CC]
 005A5CFA    mov         eax,dword ptr [eax]
 005A5CFC    call        eax
 005A5CFE    pop         ebp
 005A5CFF    ret         8
*}
end;

//005A5D04
{*function TIdStackWindows.RecvFrom(ASocket:Cardinal; var VBuffer:?; var VIPVersion:TIdIPVersion; var VPort:Word; var VIP:string; AFlags:Integer; ALength:Integer):Integer;
begin
 005A5D04    push        ebp
 005A5D05    mov         ebp,esp
 005A5D07    add         esp,0FFFFFFD4
 005A5D0A    push        ebx
 005A5D0B    push        esi
 005A5D0C    push        edi
 005A5D0D    xor         ebx,ebx
 005A5D0F    mov         dword ptr [ebp-2C],ebx
 005A5D12    mov         dword ptr [ebp-28],ebx
 005A5D15    mov         dword ptr [ebp-4],ecx
 005A5D18    mov         esi,eax
 005A5D1A    xor         eax,eax
 005A5D1C    push        ebp
 005A5D1D    push        5A5DFC
 005A5D22    push        dword ptr fs:[eax]
 005A5D25    mov         dword ptr fs:[eax],esp
 005A5D28    mov         dword ptr [ebp-8],1C
 005A5D2F    lea         eax,[ebp-8]
 005A5D32    push        eax
 005A5D33    lea         eax,[ebp-24]
 005A5D36    push        eax
 005A5D37    mov         eax,dword ptr [ebp+14]
 005A5D3A    push        eax
 005A5D3B    mov         eax,dword ptr [ebp+18]
 005A5D3E    push        eax
 005A5D3F    mov         eax,dword ptr [ebp-4]
 005A5D42    push        eax
 005A5D43    push        edx
 005A5D44    mov         eax,[0078D34C]
 005A5D49    mov         eax,dword ptr [eax]
 005A5D4B    call        eax
 005A5D4D    mov         ebx,eax
 005A5D4F    test        ebx,ebx
>005A5D51    jl          005A5DE1
 005A5D57    movzx       eax,word ptr [ebp-24]
 005A5D5B    sub         ax,2
>005A5D5F    je          005A5D69
 005A5D61    sub         ax,15
>005A5D65    je          005A5DA3
>005A5D67    jmp         005A5DDA
 005A5D69    lea         edi,[ebp-24]
 005A5D6C    lea         eax,[ebp-28]
 005A5D6F    push        eax
 005A5D70    lea         edx,[edi+4]
 005A5D73    xor         ecx,ecx
 005A5D75    mov         eax,esi
 005A5D77    call        TIdStackBSDBase.TranslateTInAddrToString
 005A5D7C    mov         edx,dword ptr [ebp-28]
 005A5D7F    mov         eax,dword ptr [ebp+10]
 005A5D82    call        @UStrAsg
 005A5D87    movzx       eax,word ptr [edi+2]
 005A5D8B    push        eax
 005A5D8C    mov         eax,[0078D0E0]
 005A5D91    mov         eax,dword ptr [eax]
 005A5D93    call        eax
 005A5D95    mov         edx,dword ptr [ebp+0C]
 005A5D98    mov         word ptr [edx],ax
 005A5D9B    mov         eax,dword ptr [ebp+8]
 005A5D9E    mov         byte ptr [eax],0
>005A5DA1    jmp         005A5DE1
 005A5DA3    lea         eax,[ebp-2C]
 005A5DA6    push        eax
 005A5DA7    lea         edx,[ebp-1C]
 005A5DAA    mov         cl,1
 005A5DAC    mov         eax,esi
 005A5DAE    call        TIdStackBSDBase.TranslateTInAddrToString
 005A5DB3    mov         edx,dword ptr [ebp-2C]
 005A5DB6    mov         eax,dword ptr [ebp+10]
 005A5DB9    call        @UStrAsg
 005A5DBE    movzx       eax,word ptr [ebp-22]
 005A5DC2    push        eax
 005A5DC3    mov         eax,[0078D0E0]
 005A5DC8    mov         eax,dword ptr [eax]
 005A5DCA    call        eax
 005A5DCC    mov         edx,dword ptr [ebp+0C]
 005A5DCF    mov         word ptr [edx],ax
 005A5DD2    mov         eax,dword ptr [ebp+8]
 005A5DD5    mov         byte ptr [eax],1
>005A5DD8    jmp         005A5DE1
 005A5DDA    mov         eax,esi
 005A5DDC    call        TIdStack.IPVersionUnsupported
 005A5DE1    xor         eax,eax
 005A5DE3    pop         edx
 005A5DE4    pop         ecx
 005A5DE5    pop         ecx
 005A5DE6    mov         dword ptr fs:[eax],edx
 005A5DE9    push        5A5E03
 005A5DEE    lea         eax,[ebp-2C]
 005A5DF1    mov         edx,2
 005A5DF6    call        @UStrArrayClr
 005A5DFB    ret
>005A5DFC    jmp         @HandleFinally
>005A5E01    jmp         005A5DEE
 005A5E03    mov         eax,ebx
 005A5E05    pop         edi
 005A5E06    pop         esi
 005A5E07    pop         ebx
 005A5E08    mov         esp,ebp
 005A5E0A    pop         ebp
 005A5E0B    ret         14
end;*}

//005A5E10
function TIdStackWindows.WSSend(ASocket:TIdStackSocketHandle; const ABuffer:void ; const ABufferLength:Integer; const AFlags:Integer):Integer;
begin
{*
 005A5E10    push        ebp
 005A5E11    mov         ebp,esp
 005A5E13    push        ebx
 005A5E14    push        esi
 005A5E15    push        edi
 005A5E16    mov         edi,ecx
 005A5E18    mov         esi,edx
 005A5E1A    mov         ebx,eax
 005A5E1C    mov         eax,dword ptr [ebp+8]
 005A5E1F    push        eax
 005A5E20    mov         eax,dword ptr [ebp+0C]
 005A5E23    push        eax
 005A5E24    push        edi
 005A5E25    push        esi
 005A5E26    mov         eax,[0078D040]
 005A5E2B    mov         eax,dword ptr [eax]
 005A5E2D    call        eax
 005A5E2F    mov         edx,eax
 005A5E31    mov         eax,ebx
 005A5E33    call        TIdStack.CheckForSocketError
 005A5E38    pop         edi
 005A5E39    pop         esi
 005A5E3A    pop         ebx
 005A5E3B    pop         ebp
 005A5E3C    ret         8
*}
end;

//005A5E40
{*procedure TIdStackWindows.WSSendTo(ASocket:Cardinal; ABuffer:?; AIPVersion:TIdIPVersion; APort:Word; AIP:string; AFlags:Integer; ABufferLength:Integer);
begin
 005A5E40    push        ebp
 005A5E41    mov         ebp,esp
 005A5E43    add         esp,0FFFFFFD4
 005A5E46    push        ebx
 005A5E47    push        esi
 005A5E48    push        edi
 005A5E49    xor         ebx,ebx
 005A5E4B    mov         dword ptr [ebp-2C],ebx
 005A5E4E    mov         dword ptr [ebp-28],ebx
 005A5E51    mov         dword ptr [ebp-8],ecx
 005A5E54    mov         dword ptr [ebp-4],edx
 005A5E57    mov         esi,eax
 005A5E59    mov         edi,dword ptr [ebp+18]
 005A5E5C    xor         eax,eax
 005A5E5E    push        ebp
 005A5E5F    push        5A5F88
 005A5E64    push        dword ptr fs:[eax]
 005A5E67    mov         dword ptr fs:[eax],esp
 005A5E6A    lea         eax,[ebp-24]
 005A5E6D    xor         ecx,ecx
 005A5E6F    mov         edx,1C
 005A5E74    call        @FillChar
 005A5E79    movzx       eax,byte ptr [ebp+8]
 005A5E7D    sub         al,1
>005A5E7F    jb          005A5E85
>005A5E81    je          005A5EB5
>005A5E83    jmp         005A5EE3
 005A5E85    lea         ebx,[ebp-24]
 005A5E88    mov         word ptr [ebx],2
 005A5E8D    push        0
 005A5E8F    lea         ecx,[ebx+4]
 005A5E92    mov         edx,dword ptr [ebp+10]
 005A5E95    mov         eax,esi
 005A5E97    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A5E9C    movzx       eax,word ptr [ebp+0C]
 005A5EA0    push        eax
 005A5EA1    mov         eax,[0078D0DC]
 005A5EA6    mov         eax,dword ptr [eax]
 005A5EA8    call        eax
 005A5EAA    mov         word ptr [ebx+2],ax
 005A5EAE    mov         ebx,10
>005A5EB3    jmp         005A5EEC
 005A5EB5    mov         word ptr [ebp-24],17
 005A5EBB    push        1
 005A5EBD    lea         ecx,[ebp-1C]
 005A5EC0    mov         edx,dword ptr [ebp+10]
 005A5EC3    mov         eax,esi
 005A5EC5    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A5ECA    movzx       eax,word ptr [ebp+0C]
 005A5ECE    push        eax
 005A5ECF    mov         eax,[0078D0DC]
 005A5ED4    mov         eax,dword ptr [eax]
 005A5ED6    call        eax
 005A5ED8    mov         word ptr [ebp-22],ax
 005A5EDC    mov         ebx,1C
>005A5EE1    jmp         005A5EEC
 005A5EE3    xor         ebx,ebx
 005A5EE5    mov         eax,esi
 005A5EE7    call        TIdStack.IPVersionUnsupported
 005A5EEC    push        ebx
 005A5EED    lea         eax,[ebp-24]
 005A5EF0    push        eax
 005A5EF1    mov         eax,dword ptr [ebp+14]
 005A5EF4    push        eax
 005A5EF5    push        edi
 005A5EF6    mov         eax,dword ptr [ebp-8]
 005A5EF9    push        eax
 005A5EFA    mov         eax,dword ptr [ebp-4]
 005A5EFD    push        eax
 005A5EFE    mov         eax,[0078D03C]
 005A5F03    mov         eax,dword ptr [eax]
 005A5F05    call        eax
 005A5F07    mov         ebx,eax
 005A5F09    cmp         ebx,0FFFFFFFF
>005A5F0C    jne         005A5F48
 005A5F0E    mov         eax,esi
 005A5F10    mov         edx,dword ptr [eax]
 005A5F12    call        dword ptr [edx+40]
 005A5F15    cmp         eax,2738
>005A5F1A    jne         005A5F3F
 005A5F1C    lea         edx,[ebp-28]
 005A5F1F    mov         eax,[0078D2A8];^SResString663:TResStringRec
 005A5F24    call        LoadResString
 005A5F29    mov         ecx,dword ptr [ebp-28]
 005A5F2C    mov         dl,1
 005A5F2E    mov         eax,[0059654C];EIdPackageSizeTooBig
 005A5F33    call        EIdException.Create
 005A5F38    call        @RaiseExcept
>005A5F3D    jmp         005A5F6D
 005A5F3F    mov         eax,esi
 005A5F41    call        TIdStack.RaiseLastSocketError
>005A5F46    jmp         005A5F6D
 005A5F48    cmp         edi,ebx
>005A5F4A    je          005A5F6D
 005A5F4C    lea         edx,[ebp-2C]
 005A5F4F    mov         eax,[0078D8B0];^SResString662:TResStringRec
 005A5F54    call        LoadResString
 005A5F59    mov         ecx,dword ptr [ebp-2C]
 005A5F5C    mov         dl,1
 005A5F5E    mov         eax,[00596600];EIdNotAllBytesSent
 005A5F63    call        EIdException.Create
 005A5F68    call        @RaiseExcept
 005A5F6D    xor         eax,eax
 005A5F6F    pop         edx
 005A5F70    pop         ecx
 005A5F71    pop         ecx
 005A5F72    mov         dword ptr fs:[eax],edx
 005A5F75    push        5A5F8F
 005A5F7A    lea         eax,[ebp-2C]
 005A5F7D    mov         edx,2
 005A5F82    call        @UStrArrayClr
 005A5F87    ret
>005A5F88    jmp         @HandleFinally
>005A5F8D    jmp         005A5F7A
 005A5F8F    pop         edi
 005A5F90    pop         esi
 005A5F91    pop         ebx
 005A5F92    mov         esp,ebp
 005A5F94    pop         ebp
 005A5F95    ret         14
end;*}

//005A5F98
procedure TIdStackWindows.SetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);
begin
{*
 005A5F98    push        ebp
 005A5F99    mov         ebp,esp
 005A5F9B    push        ebx
 005A5F9C    push        esi
 005A5F9D    push        edi
 005A5F9E    mov         edi,ecx
 005A5FA0    mov         esi,edx
 005A5FA2    mov         ebx,eax
 005A5FA4    push        4
 005A5FA6    lea         eax,[ebp+8]
 005A5FA9    push        eax
 005A5FAA    mov         eax,dword ptr [ebp+0C]
 005A5FAD    push        eax
 005A5FAE    push        edi
 005A5FAF    push        esi
 005A5FB0    mov         eax,[0078CED8]
 005A5FB5    mov         eax,dword ptr [eax]
 005A5FB7    call        eax
 005A5FB9    mov         edx,eax
 005A5FBB    mov         eax,ebx
 005A5FBD    call        TIdStack.CheckForSocketError
 005A5FC2    pop         edi
 005A5FC3    pop         esi
 005A5FC4    pop         ebx
 005A5FC5    pop         ebp
 005A5FC6    ret         8
*}
end;

//005A5FCC
function TIdStackWindows.WSGetLastError:Integer;
begin
{*
 005A5FCC    mov         eax,[0078D970]
 005A5FD1    mov         eax,dword ptr [eax]
 005A5FD3    call        eax
 005A5FD5    ret
*}
end;

//005A5FD8
procedure TIdStackWindows.WSSetLastError(AErr:Integer);
begin
{*
 005A5FD8    push        edx
 005A5FD9    mov         eax,[0078D1B0]
 005A5FDE    mov         eax,dword ptr [eax]
 005A5FE0    call        eax
 005A5FE2    ret
*}
end;

//005A5FE4
function TIdStackWindows.WSSocket(AFamily:Integer; AStruct:Integer; AOverlapped:Boolean; AProtocol:Integer):Cardinal;
begin
{*
 005A5FE4    push        ebp
 005A5FE5    mov         ebp,esp
 005A5FE7    mov         eax,dword ptr [ebp+0C]
 005A5FEA    cmp         byte ptr [ebp+8],0
>005A5FEE    je          005A6004
 005A5FF0    push        1
 005A5FF2    push        0
 005A5FF4    push        0
 005A5FF6    push        eax
 005A5FF7    push        ecx
 005A5FF8    push        edx
 005A5FF9    mov         eax,[0078CB38]
 005A5FFE    mov         eax,dword ptr [eax]
 005A6000    call        eax
>005A6002    jmp         005A6010
 005A6004    push        eax
 005A6005    push        ecx
 005A6006    push        edx
 005A6007    mov         eax,[0078CE9C]
 005A600C    mov         eax,dword ptr [eax]
 005A600E    call        eax
 005A6010    pop         ebp
 005A6011    ret         8
*}
end;

//005A6014
function TIdStackWindows.WSGetServByName(AServiceName:string):Word;
begin
{*
 005A6014    push        ebp
 005A6015    mov         ebp,esp
 005A6017    add         esp,0FFFFFFEC
 005A601A    push        ebx
 005A601B    push        esi
 005A601C    push        edi
 005A601D    xor         ecx,ecx
 005A601F    mov         dword ptr [ebp-14],ecx
 005A6022    mov         dword ptr [ebp-4],ecx
 005A6025    mov         dword ptr [ebp-8],edx
 005A6028    xor         eax,eax
 005A602A    push        ebp
 005A602B    push        5A60F7
 005A6030    push        dword ptr fs:[eax]
 005A6033    mov         dword ptr fs:[eax],esp
 005A6036    lea         eax,[ebp-4]
 005A6039    mov         edx,dword ptr [ebp-8]
 005A603C    mov         ecx,0
 005A6041    call        @LStrFromUStr
 005A6046    push        0
 005A6048    mov         eax,dword ptr [ebp-4]
 005A604B    call        @LStrToPChar
 005A6050    push        eax
 005A6051    mov         eax,[0078CF08]
 005A6056    mov         eax,dword ptr [eax]
 005A6058    call        eax
 005A605A    test        eax,eax
>005A605C    je          005A6070
 005A605E    movzx       eax,word ptr [eax+8]
 005A6062    push        eax
 005A6063    mov         eax,[0078D0E0]
 005A6068    mov         eax,dword ptr [eax]
 005A606A    call        eax
 005A606C    mov         ebx,eax
>005A606E    jmp         005A60D9
 005A6070    xor         eax,eax
 005A6072    push        ebp
 005A6073    push        5A6092
 005A6078    push        dword ptr fs:[eax]
 005A607B    mov         dword ptr fs:[eax],esp
 005A607E    mov         eax,dword ptr [ebp-8]
 005A6081    call        IndyStrToInt
 005A6086    mov         ebx,eax
 005A6088    xor         eax,eax
 005A608A    pop         edx
 005A608B    pop         ecx
 005A608C    pop         ecx
 005A608D    mov         dword ptr fs:[eax],edx
>005A6090    jmp         005A60D9
>005A6092    jmp         @HandleOnException
 005A6097    dd          1
 005A609B    dd          0041A0BC;EConvertError
 005A609F    dd          005A60A3
 005A60A3    mov         eax,dword ptr [ebp-8]
 005A60A6    mov         dword ptr [ebp-10],eax
 005A60A9    mov         byte ptr [ebp-0C],11
 005A60AD    lea         eax,[ebp-10]
 005A60B0    push        eax
 005A60B1    push        0
 005A60B3    lea         edx,[ebp-14]
 005A60B6    mov         eax,[0078D534];^SResString658:TResStringRec
 005A60BB    call        LoadResString
 005A60C0    mov         ecx,dword ptr [ebp-14]
 005A60C3    mov         dl,1
 005A60C5    mov         eax,[005A3D08];EIdInvalidServiceName
 005A60CA    call        Exception.CreateFmt
 005A60CF    call        @RaiseExcept
 005A60D4    call        @DoneExcept
 005A60D9    xor         eax,eax
 005A60DB    pop         edx
 005A60DC    pop         ecx
 005A60DD    pop         ecx
 005A60DE    mov         dword ptr fs:[eax],edx
 005A60E1    push        5A60FE
 005A60E6    lea         eax,[ebp-14]
 005A60E9    call        @UStrClr
 005A60EE    lea         eax,[ebp-4]
 005A60F1    call        @LStrClr
 005A60F6    ret
>005A60F7    jmp         @HandleFinally
>005A60FC    jmp         005A60E6
 005A60FE    mov         eax,ebx
 005A6100    pop         edi
 005A6101    pop         esi
 005A6102    pop         ebx
 005A6103    mov         esp,ebp
 005A6105    pop         ebp
 005A6106    ret
*}
end;

//005A6108
function TIdStackWindows.WSGetServByPort(APortNumber:Word):TStrings;
begin
{*
 005A6108    push        ebp
 005A6109    mov         ebp,esp
 005A610B    push        0
 005A610D    push        0
 005A610F    push        0
 005A6111    push        ebx
 005A6112    push        esi
 005A6113    push        edi
 005A6114    mov         ebx,edx
 005A6116    xor         eax,eax
 005A6118    push        ebp
 005A6119    push        5A61DA
 005A611E    push        dword ptr fs:[eax]
 005A6121    mov         dword ptr fs:[eax],esp
 005A6124    mov         dl,1
 005A6126    mov         eax,[0043C7BC];TStringList
 005A612B    call        TStringList.Create
 005A6130    mov         dword ptr [ebp-4],eax
 005A6133    xor         edx,edx
 005A6135    push        ebp
 005A6136    push        5A61A3
 005A613B    push        dword ptr fs:[edx]
 005A613E    mov         dword ptr fs:[edx],esp
 005A6141    push        0
 005A6143    push        ebx
 005A6144    mov         eax,[0078D0DC]
 005A6149    mov         eax,dword ptr [eax]
 005A614B    call        eax
 005A614D    movzx       eax,ax
 005A6150    push        eax
 005A6151    mov         eax,[0078D8C0]
 005A6156    mov         eax,dword ptr [eax]
 005A6158    call        eax
 005A615A    mov         esi,eax
 005A615C    test        esi,esi
>005A615E    je          005A6199
 005A6160    lea         eax,[ebp-8]
 005A6163    mov         edx,dword ptr [esi]
 005A6165    call        @UStrFromPChar
 005A616A    mov         edx,dword ptr [ebp-8]
 005A616D    mov         eax,dword ptr [ebp-4]
 005A6170    mov         ecx,dword ptr [eax]
 005A6172    call        dword ptr [ecx+38]
 005A6175    xor         ebx,ebx
 005A6177    mov         esi,dword ptr [esi+4]
>005A617A    jmp         005A6192
 005A617C    lea         eax,[ebp-0C]
 005A617F    mov         edx,edi
 005A6181    call        @UStrFromPChar
 005A6186    mov         edx,dword ptr [ebp-0C]
 005A6189    mov         eax,dword ptr [ebp-4]
 005A618C    mov         ecx,dword ptr [eax]
 005A618E    call        dword ptr [ecx+38]
 005A6191    inc         ebx
 005A6192    mov         edi,dword ptr [esi+ebx*4]
 005A6195    test        edi,edi
>005A6197    jne         005A617C
 005A6199    xor         eax,eax
 005A619B    pop         edx
 005A619C    pop         ecx
 005A619D    pop         ecx
 005A619E    mov         dword ptr fs:[eax],edx
>005A61A1    jmp         005A61BF
>005A61A3    jmp         @HandleAnyException
 005A61A8    mov         eax,dword ptr [ebp-4]
 005A61AB    xor         edx,edx
 005A61AD    mov         dword ptr [ebp-4],edx
 005A61B0    call        TObject.Free
 005A61B5    call        @RaiseAgain
 005A61BA    call        @DoneExcept
 005A61BF    xor         eax,eax
 005A61C1    pop         edx
 005A61C2    pop         ecx
 005A61C3    pop         ecx
 005A61C4    mov         dword ptr fs:[eax],edx
 005A61C7    push        5A61E1
 005A61CC    lea         eax,[ebp-0C]
 005A61CF    mov         edx,2
 005A61D4    call        @UStrArrayClr
 005A61D9    ret
>005A61DA    jmp         @HandleFinally
>005A61DF    jmp         005A61CC
 005A61E1    mov         eax,dword ptr [ebp-4]
 005A61E4    pop         edi
 005A61E5    pop         esi
 005A61E6    pop         ebx
 005A61E7    mov         esp,ebp
 005A61E9    pop         ebp
 005A61EA    ret
*}
end;

//005A61EC
function TIdStackWindows.HostToNetwork(AValue:Word):Word;
begin
{*
 005A61EC    push        edx
 005A61ED    mov         eax,[0078D0DC]
 005A61F2    mov         eax,dword ptr [eax]
 005A61F4    call        eax
 005A61F6    ret
*}
end;

//005A61F8
function TIdStackWindows.NetworkToHost(AValue:Word):Word;
begin
{*
 005A61F8    push        edx
 005A61F9    mov         eax,[0078D0E0]
 005A61FE    mov         eax,dword ptr [eax]
 005A6200    call        eax
 005A6202    ret
*}
end;

//005A6204
function TIdStackWindows.HostToNetwork(AValue:Cardinal):Cardinal;
begin
{*
 005A6204    push        edx
 005A6205    mov         eax,[0078DA70]
 005A620A    mov         eax,dword ptr [eax]
 005A620C    call        eax
 005A620E    ret
*}
end;

//005A6210
function TIdStackWindows.NetworkToHost(AValue:Cardinal):Cardinal;
begin
{*
 005A6210    push        edx
 005A6211    mov         eax,[0078DA6C]
 005A6216    mov         eax,dword ptr [eax]
 005A6218    call        eax
 005A621A    ret
*}
end;

//005A621C
function TIdStackWindows.HostToNetwork(AValue:Int64):Int64;
begin
{*
 005A621C    push        ebp
 005A621D    mov         ebp,esp
 005A621F    add         esp,0FFFFFFF0
 005A6222    push        ebx
 005A6223    mov         eax,dword ptr [ebp+8]
 005A6226    mov         dword ptr [ebp-10],eax
 005A6229    mov         eax,dword ptr [ebp+0C]
 005A622C    mov         dword ptr [ebp-0C],eax
 005A622F    mov         eax,dword ptr [ebp-0C]
 005A6232    push        eax
 005A6233    mov         eax,[0078DA70]
 005A6238    mov         eax,dword ptr [eax]
 005A623A    call        eax
 005A623C    mov         ebx,eax
 005A623E    mov         eax,dword ptr [ebp-10]
 005A6241    push        eax
 005A6242    mov         eax,[0078DA70]
 005A6247    mov         eax,dword ptr [eax]
 005A6249    call        eax
 005A624B    mov         dword ptr [ebp-0C],eax
 005A624E    mov         dword ptr [ebp-10],ebx
 005A6251    mov         eax,dword ptr [ebp-10]
 005A6254    mov         dword ptr [ebp-8],eax
 005A6257    mov         eax,dword ptr [ebp-0C]
 005A625A    mov         dword ptr [ebp-4],eax
 005A625D    mov         eax,dword ptr [ebp-8]
 005A6260    mov         edx,dword ptr [ebp-4]
 005A6263    pop         ebx
 005A6264    mov         esp,ebp
 005A6266    pop         ebp
 005A6267    ret         8
*}
end;

//005A626C
function TIdStackWindows.NetworkToHost(AValue:Int64):Int64;
begin
{*
 005A626C    push        ebp
 005A626D    mov         ebp,esp
 005A626F    add         esp,0FFFFFFF0
 005A6272    push        ebx
 005A6273    mov         eax,dword ptr [ebp+8]
 005A6276    mov         dword ptr [ebp-10],eax
 005A6279    mov         eax,dword ptr [ebp+0C]
 005A627C    mov         dword ptr [ebp-0C],eax
 005A627F    mov         eax,dword ptr [ebp-0C]
 005A6282    push        eax
 005A6283    mov         eax,[0078DA6C]
 005A6288    mov         eax,dword ptr [eax]
 005A628A    call        eax
 005A628C    mov         ebx,eax
 005A628E    mov         eax,dword ptr [ebp-10]
 005A6291    push        eax
 005A6292    mov         eax,[0078DA6C]
 005A6297    mov         eax,dword ptr [eax]
 005A6299    call        eax
 005A629B    mov         dword ptr [ebp-0C],eax
 005A629E    mov         dword ptr [ebp-10],ebx
 005A62A1    mov         eax,dword ptr [ebp-10]
 005A62A4    mov         dword ptr [ebp-8],eax
 005A62A7    mov         eax,dword ptr [ebp-0C]
 005A62AA    mov         dword ptr [ebp-4],eax
 005A62AD    mov         eax,dword ptr [ebp-8]
 005A62B0    mov         edx,dword ptr [ebp-4]
 005A62B3    pop         ebx
 005A62B4    mov         esp,ebp
 005A62B6    pop         ebp
 005A62B7    ret         8
*}
end;

//005A62BC
procedure TIdStackWindows.AddLocalAddressesToList(AAddresses:TStrings);
begin
{*
 005A62BC    push        ebp
 005A62BD    mov         ebp,esp
 005A62BF    add         esp,0FFFFFFC4
 005A62C2    push        ebx
 005A62C3    push        esi
 005A62C4    xor         ecx,ecx
 005A62C6    mov         dword ptr [ebp-3C],ecx
 005A62C9    mov         dword ptr [ebp-38],ecx
 005A62CC    mov         dword ptr [ebp-4],ecx
 005A62CF    mov         dword ptr [ebp-8],ecx
 005A62D2    mov         dword ptr [ebp-0C],edx
 005A62D5    mov         esi,eax
 005A62D7    xor         eax,eax
 005A62D9    push        ebp
 005A62DA    push        5A64A6
 005A62DF    push        dword ptr fs:[eax]
 005A62E2    mov         dword ptr fs:[eax],esp
 005A62E5    lea         edx,[ebp-4]
 005A62E8    mov         eax,esi
 005A62EA    mov         ecx,dword ptr [eax]
 005A62EC    call        dword ptr [ecx+4]
 005A62EF    mov         eax,[0078D7F4]
 005A62F4    cmp         byte ptr [eax],0
>005A62F7    jne         005A639C
 005A62FD    lea         eax,[ebp-8]
 005A6300    mov         edx,dword ptr [ebp-4]
 005A6303    mov         ecx,0
 005A6308    call        @LStrFromUStr
 005A630D    mov         eax,dword ptr [ebp-8]
 005A6310    call        @LStrToPChar
 005A6315    push        eax
 005A6316    mov         eax,[0078D1FC]
 005A631B    mov         eax,dword ptr [eax]
 005A631D    call        eax
 005A631F    mov         ebx,eax
 005A6321    test        ebx,ebx
>005A6323    jne         005A632C
 005A6325    mov         eax,esi
 005A6327    call        TIdStack.RaiseLastSocketError
 005A632C    mov         eax,dword ptr [ebx+0C]
 005A632F    mov         dword ptr [ebp-10],eax
 005A6332    xor         ebx,ebx
 005A6334    mov         eax,dword ptr [ebp-10]
 005A6337    cmp         dword ptr [eax+ebx*4],0
>005A633B    je          005A647B
 005A6341    mov         eax,dword ptr [ebp-0C]
 005A6344    call        TStrings.BeginUpdate
 005A6349    xor         eax,eax
 005A634B    push        ebp
 005A634C    push        5A6395
 005A6351    push        dword ptr fs:[eax]
 005A6354    mov         dword ptr fs:[eax],esp
 005A6357    lea         eax,[ebp-38]
 005A635A    push        eax
 005A635B    mov         eax,dword ptr [ebp-10]
 005A635E    mov         edx,dword ptr [eax+ebx*4]
 005A6361    xor         ecx,ecx
 005A6363    mov         eax,esi
 005A6365    call        TIdStackBSDBase.TranslateTInAddrToString
 005A636A    mov         edx,dword ptr [ebp-38]
 005A636D    mov         eax,dword ptr [ebp-0C]
 005A6370    mov         ecx,dword ptr [eax]
 005A6372    call        dword ptr [ecx+38]
 005A6375    inc         ebx
 005A6376    mov         eax,dword ptr [ebp-10]
 005A6379    cmp         dword ptr [eax+ebx*4],0
>005A637D    jne         005A6357
 005A637F    xor         eax,eax
 005A6381    pop         edx
 005A6382    pop         ecx
 005A6383    pop         ecx
 005A6384    mov         dword ptr fs:[eax],edx
 005A6387    push        5A647B
 005A638C    mov         eax,dword ptr [ebp-0C]
 005A638F    call        TStrings.EndUpdate
 005A6394    ret
>005A6395    jmp         @HandleFinally
>005A639A    jmp         005A638C
 005A639C    lea         eax,[ebp-34]
 005A639F    xor         ecx,ecx
 005A63A1    mov         edx,20
 005A63A6    call        @FillChar
 005A63AB    mov         dword ptr [ebp-30],2
 005A63B2    mov         dword ptr [ebp-2C],1
 005A63B9    xor         eax,eax
 005A63BB    mov         dword ptr [ebp-14],eax
 005A63BE    lea         eax,[ebp-14]
 005A63C1    push        eax
 005A63C2    lea         eax,[ebp-34]
 005A63C5    push        eax
 005A63C6    push        0
 005A63C8    mov         eax,dword ptr [ebp-4]
 005A63CB    call        @UStrToPWChar
 005A63D0    push        eax
 005A63D1    mov         eax,[0078D7DC]
 005A63D6    mov         eax,dword ptr [eax]
 005A63D8    call        eax
 005A63DA    mov         ebx,eax
 005A63DC    test        ebx,ebx
>005A63DE    je          005A63F0
 005A63E0    mov         eax,ebx
 005A63E2    call        gaiErrorToWsaError
 005A63E7    mov         edx,eax
 005A63E9    mov         eax,esi
 005A63EB    mov         ecx,dword ptr [eax]
 005A63ED    call        dword ptr [ecx+4C]
 005A63F0    xor         eax,eax
 005A63F2    push        ebp
 005A63F3    push        5A6474
 005A63F8    push        dword ptr fs:[eax]
 005A63FB    mov         dword ptr fs:[eax],esp
 005A63FE    mov         eax,dword ptr [ebp-0C]
 005A6401    call        TStrings.BeginUpdate
 005A6406    xor         eax,eax
 005A6408    push        ebp
 005A6409    push        5A6452
 005A640E    push        dword ptr fs:[eax]
 005A6411    mov         dword ptr fs:[eax],esp
 005A6414    mov         ebx,dword ptr [ebp-14]
 005A6417    lea         eax,[ebp-3C]
 005A641A    push        eax
 005A641B    mov         eax,dword ptr [ebx+18]
 005A641E    lea         edx,[eax+4]
 005A6421    xor         ecx,ecx
 005A6423    mov         eax,esi
 005A6425    call        TIdStackBSDBase.TranslateTInAddrToString
 005A642A    mov         edx,dword ptr [ebp-3C]
 005A642D    mov         eax,dword ptr [ebp-0C]
 005A6430    mov         ecx,dword ptr [eax]
 005A6432    call        dword ptr [ecx+38]
 005A6435    mov         ebx,dword ptr [ebx+1C]
 005A6438    test        ebx,ebx
>005A643A    jne         005A6417
 005A643C    xor         eax,eax
 005A643E    pop         edx
 005A643F    pop         ecx
 005A6440    pop         ecx
 005A6441    mov         dword ptr fs:[eax],edx
 005A6444    push        5A6459
 005A6449    mov         eax,dword ptr [ebp-0C]
 005A644C    call        TStrings.EndUpdate
 005A6451    ret
>005A6452    jmp         @HandleFinally
>005A6457    jmp         005A6449
 005A6459    xor         eax,eax
 005A645B    pop         edx
 005A645C    pop         ecx
 005A645D    pop         ecx
 005A645E    mov         dword ptr fs:[eax],edx
 005A6461    push        5A647B
 005A6466    mov         eax,dword ptr [ebp-14]
 005A6469    push        eax
 005A646A    mov         eax,[0078D290]
 005A646F    mov         eax,dword ptr [eax]
 005A6471    call        eax
 005A6473    ret
>005A6474    jmp         @HandleFinally
>005A6479    jmp         005A6466
 005A647B    xor         eax,eax
 005A647D    pop         edx
 005A647E    pop         ecx
 005A647F    pop         ecx
 005A6480    mov         dword ptr fs:[eax],edx
 005A6483    push        5A64AD
 005A6488    lea         eax,[ebp-3C]
 005A648B    mov         edx,2
 005A6490    call        @UStrArrayClr
 005A6495    lea         eax,[ebp-8]
 005A6498    call        @LStrClr
 005A649D    lea         eax,[ebp-4]
 005A64A0    call        @UStrClr
 005A64A5    ret
>005A64A6    jmp         @HandleFinally
>005A64AB    jmp         005A6488
 005A64AD    pop         esi
 005A64AE    pop         ebx
 005A64AF    mov         esp,ebp
 005A64B1    pop         ebp
 005A64B2    ret
*}
end;

//005A64B4
function TIdStackWindows.WSShutdown(ASocket:TIdStackSocketHandle; AHow:Integer):Integer;
begin
{*
 005A64B4    push        ecx
 005A64B5    push        edx
 005A64B6    mov         eax,[0078CBAC]
 005A64BB    mov         eax,dword ptr [eax]
 005A64BD    call        eax
 005A64BF    ret
*}
end;

//005A64C0
procedure TIdStackWindows.GetSocketName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);
begin
{*
 005A64C0    push        ebp
 005A64C1    mov         ebp,esp
 005A64C3    add         esp,0FFFFFFD8
 005A64C6    push        ebx
 005A64C7    push        esi
 005A64C8    push        edi
 005A64C9    xor         ebx,ebx
 005A64CB    mov         dword ptr [ebp-28],ebx
 005A64CE    mov         dword ptr [ebp-24],ebx
 005A64D1    mov         edi,ecx
 005A64D3    mov         esi,edx
 005A64D5    mov         ebx,eax
 005A64D7    xor         eax,eax
 005A64D9    push        ebp
 005A64DA    push        5A65AA
 005A64DF    push        dword ptr fs:[eax]
 005A64E2    mov         dword ptr fs:[eax],esp
 005A64E5    mov         dword ptr [ebp-4],1C
 005A64EC    lea         eax,[ebp-4]
 005A64EF    push        eax
 005A64F0    lea         eax,[ebp-20]
 005A64F3    push        eax
 005A64F4    push        esi
 005A64F5    mov         eax,[0078CC90]
 005A64FA    mov         eax,dword ptr [eax]
 005A64FC    call        eax
 005A64FE    mov         edx,eax
 005A6500    mov         eax,ebx
 005A6502    call        TIdStack.CheckForSocketError
 005A6507    movzx       eax,word ptr [ebp-20]
 005A650B    sub         ax,2
>005A650F    je          005A6519
 005A6511    sub         ax,15
>005A6515    je          005A6552
>005A6517    jmp         005A6588
 005A6519    lea         esi,[ebp-20]
 005A651C    lea         eax,[ebp-24]
 005A651F    push        eax
 005A6520    lea         edx,[esi+4]
 005A6523    xor         ecx,ecx
 005A6525    mov         eax,ebx
 005A6527    call        TIdStackBSDBase.TranslateTInAddrToString
 005A652C    mov         edx,dword ptr [ebp-24]
 005A652F    mov         eax,edi
 005A6531    call        @UStrAsg
 005A6536    movzx       eax,word ptr [esi+2]
 005A653A    push        eax
 005A653B    mov         eax,[0078D0E0]
 005A6540    mov         eax,dword ptr [eax]
 005A6542    call        eax
 005A6544    mov         edx,dword ptr [ebp+0C]
 005A6547    mov         word ptr [edx],ax
 005A654A    mov         eax,dword ptr [ebp+8]
 005A654D    mov         byte ptr [eax],0
>005A6550    jmp         005A658F
 005A6552    lea         eax,[ebp-28]
 005A6555    push        eax
 005A6556    lea         edx,[ebp-18]
 005A6559    mov         cl,1
 005A655B    mov         eax,ebx
 005A655D    call        TIdStackBSDBase.TranslateTInAddrToString
 005A6562    mov         edx,dword ptr [ebp-28]
 005A6565    mov         eax,edi
 005A6567    call        @UStrAsg
 005A656C    movzx       eax,word ptr [ebp-1E]
 005A6570    push        eax
 005A6571    mov         eax,[0078D0E0]
 005A6576    mov         eax,dword ptr [eax]
 005A6578    call        eax
 005A657A    mov         edx,dword ptr [ebp+0C]
 005A657D    mov         word ptr [edx],ax
 005A6580    mov         eax,dword ptr [ebp+8]
 005A6583    mov         byte ptr [eax],1
>005A6586    jmp         005A658F
 005A6588    mov         eax,ebx
 005A658A    call        TIdStack.IPVersionUnsupported
 005A658F    xor         eax,eax
 005A6591    pop         edx
 005A6592    pop         ecx
 005A6593    pop         ecx
 005A6594    mov         dword ptr fs:[eax],edx
 005A6597    push        5A65B1
 005A659C    lea         eax,[ebp-28]
 005A659F    mov         edx,2
 005A65A4    call        @UStrArrayClr
 005A65A9    ret
>005A65AA    jmp         @HandleFinally
>005A65AF    jmp         005A659C
 005A65B1    pop         edi
 005A65B2    pop         esi
 005A65B3    pop         ebx
 005A65B4    mov         esp,ebp
 005A65B6    pop         ebp
 005A65B7    ret         8
*}
end;

//005A65BC
procedure TIdStackWindows.WSGetSockOpt(ASocket:Cardinal; Alevel:Integer; var AOptlen:Integer; AOptval:PAnsiChar; AOptname:Integer);
begin
{*
 005A65BC    push        ebp
 005A65BD    mov         ebp,esp
 005A65BF    push        ebx
 005A65C0    push        esi
 005A65C1    push        edi
 005A65C2    mov         edi,ecx
 005A65C4    mov         esi,edx
 005A65C6    mov         ebx,eax
 005A65C8    mov         eax,dword ptr [ebp+8]
 005A65CB    push        eax
 005A65CC    mov         eax,dword ptr [ebp+0C]
 005A65CF    push        eax
 005A65D0    mov         eax,dword ptr [ebp+10]
 005A65D3    push        eax
 005A65D4    push        edi
 005A65D5    push        esi
 005A65D6    mov         eax,[0078D694]
 005A65DB    mov         eax,dword ptr [eax]
 005A65DD    call        eax
 005A65DF    mov         edx,eax
 005A65E1    mov         eax,ebx
 005A65E3    call        TIdStack.CheckForSocketError
 005A65E8    pop         edi
 005A65E9    pop         esi
 005A65EA    pop         ebx
 005A65EB    pop         ebp
 005A65EC    ret         0C
*}
end;

//005A65F0
procedure TIdSocketListWindows.Add(AHandle:Cardinal);
begin
{*
 005A65F0    push        ebp
 005A65F1    mov         ebp,esp
 005A65F3    add         esp,0FFFFFFF8
 005A65F6    push        ebx
 005A65F7    xor         ecx,ecx
 005A65F9    mov         dword ptr [ebp-8],ecx
 005A65FC    mov         ebx,edx
 005A65FE    mov         dword ptr [ebp-4],eax
 005A6601    xor         eax,eax
 005A6603    push        ebp
 005A6604    push        5A6695
 005A6609    push        dword ptr fs:[eax]
 005A660C    mov         dword ptr fs:[eax],esp
 005A660F    mov         eax,dword ptr [ebp-4]
 005A6612    call        TIdSocketList.Lock
 005A6617    xor         eax,eax
 005A6619    push        ebp
 005A661A    push        5A6678
 005A661F    push        dword ptr fs:[eax]
 005A6622    mov         dword ptr fs:[eax],esp
 005A6625    mov         eax,dword ptr [ebp-4]
 005A6628    cmp         dword ptr [eax+8],40
>005A662C    jb          005A664F
 005A662E    lea         edx,[ebp-8]
 005A6631    mov         eax,[0078CCF0];^SResString664:TResStringRec
 005A6636    call        LoadResString
 005A663B    mov         ecx,dword ptr [ebp-8]
 005A663E    mov         dl,1
 005A6640    mov         eax,[005A3E88];EIdStackSetSizeExceeded
 005A6645    call        EIdException.Create
 005A664A    call        @RaiseExcept
 005A664F    mov         eax,dword ptr [ebp-4]
 005A6652    mov         eax,dword ptr [eax+8]
 005A6655    mov         edx,dword ptr [ebp-4]
 005A6658    mov         dword ptr [edx+eax*4+0C],ebx
 005A665C    mov         eax,dword ptr [ebp-4]
 005A665F    inc         dword ptr [eax+8]
 005A6662    xor         eax,eax
 005A6664    pop         edx
 005A6665    pop         ecx
 005A6666    pop         ecx
 005A6667    mov         dword ptr fs:[eax],edx
 005A666A    push        5A667F
 005A666F    mov         eax,dword ptr [ebp-4]
 005A6672    call        TIdSocketList.Unlock
 005A6677    ret
>005A6678    jmp         @HandleFinally
>005A667D    jmp         005A666F
 005A667F    xor         eax,eax
 005A6681    pop         edx
 005A6682    pop         ecx
 005A6683    pop         ecx
 005A6684    mov         dword ptr fs:[eax],edx
 005A6687    push        5A669C
 005A668C    lea         eax,[ebp-8]
 005A668F    call        @UStrClr
 005A6694    ret
>005A6695    jmp         @HandleFinally
>005A669A    jmp         005A668C
 005A669C    pop         ebx
 005A669D    pop         ecx
 005A669E    pop         ecx
 005A669F    pop         ebp
 005A66A0    ret
*}
end;

//005A66A4
procedure TIdSocketListWindows.Clear;
begin
{*
 005A66A4    push        ebp
 005A66A5    mov         ebp,esp
 005A66A7    push        ecx
 005A66A8    mov         dword ptr [ebp-4],eax
 005A66AB    mov         eax,dword ptr [ebp-4]
 005A66AE    call        TIdSocketList.Lock
 005A66B3    xor         eax,eax
 005A66B5    push        ebp
 005A66B6    push        5A66E2
 005A66BB    push        dword ptr fs:[eax]
 005A66BE    mov         dword ptr fs:[eax],esp
 005A66C1    mov         eax,dword ptr [ebp-4]
 005A66C4    add         eax,8
 005A66C7    call        FD_ZERO
 005A66CC    xor         eax,eax
 005A66CE    pop         edx
 005A66CF    pop         ecx
 005A66D0    pop         ecx
 005A66D1    mov         dword ptr fs:[eax],edx
 005A66D4    push        5A66E9
 005A66D9    mov         eax,dword ptr [ebp-4]
 005A66DC    call        TIdSocketList.Unlock
 005A66E1    ret
>005A66E2    jmp         @HandleFinally
>005A66E7    jmp         005A66D9
 005A66E9    pop         ecx
 005A66EA    pop         ebp
 005A66EB    ret
*}
end;

//005A66EC
function TIdSocketListWindows.ContainsSocket(AHandle:Cardinal):Boolean;
begin
{*
 005A66EC    push        ebp
 005A66ED    mov         ebp,esp
 005A66EF    add         esp,0FFFFFFF8
 005A66F2    push        ebx
 005A66F3    mov         ebx,edx
 005A66F5    mov         dword ptr [ebp-4],eax
 005A66F8    mov         eax,dword ptr [ebp-4]
 005A66FB    call        TIdSocketList.Lock
 005A6700    xor         eax,eax
 005A6702    push        ebp
 005A6703    push        5A6734
 005A6708    push        dword ptr fs:[eax]
 005A670B    mov         dword ptr fs:[eax],esp
 005A670E    mov         eax,dword ptr [ebp-4]
 005A6711    lea         edx,[eax+8]
 005A6714    mov         eax,ebx
 005A6716    call        FD_ISSET
 005A671B    mov         byte ptr [ebp-5],al
 005A671E    xor         eax,eax
 005A6720    pop         edx
 005A6721    pop         ecx
 005A6722    pop         ecx
 005A6723    mov         dword ptr fs:[eax],edx
 005A6726    push        5A673B
 005A672B    mov         eax,dword ptr [ebp-4]
 005A672E    call        TIdSocketList.Unlock
 005A6733    ret
>005A6734    jmp         @HandleFinally
>005A6739    jmp         005A672B
 005A673B    movzx       eax,byte ptr [ebp-5]
 005A673F    pop         ebx
 005A6740    pop         ecx
 005A6741    pop         ecx
 005A6742    pop         ebp
 005A6743    ret
*}
end;

//005A6744
function TIdSocketListWindows.Count:Integer;
begin
{*
 005A6744    push        ebp
 005A6745    mov         ebp,esp
 005A6747    add         esp,0FFFFFFF8
 005A674A    mov         dword ptr [ebp-4],eax
 005A674D    mov         eax,dword ptr [ebp-4]
 005A6750    call        TIdSocketList.Lock
 005A6755    xor         eax,eax
 005A6757    push        ebp
 005A6758    push        5A6782
 005A675D    push        dword ptr fs:[eax]
 005A6760    mov         dword ptr fs:[eax],esp
 005A6763    mov         eax,dword ptr [ebp-4]
 005A6766    mov         eax,dword ptr [eax+8]
 005A6769    mov         dword ptr [ebp-8],eax
 005A676C    xor         eax,eax
 005A676E    pop         edx
 005A676F    pop         ecx
 005A6770    pop         ecx
 005A6771    mov         dword ptr fs:[eax],edx
 005A6774    push        5A6789
 005A6779    mov         eax,dword ptr [ebp-4]
 005A677C    call        TIdSocketList.Unlock
 005A6781    ret
>005A6782    jmp         @HandleFinally
>005A6787    jmp         005A6779
 005A6789    mov         eax,dword ptr [ebp-8]
 005A678C    pop         ecx
 005A678D    pop         ecx
 005A678E    pop         ebp
 005A678F    ret
*}
end;

//005A6790
function TIdSocketListWindows.GetItem(AIndex:Integer):TIdStackSocketHandle;
begin
{*
 005A6790    push        ebp
 005A6791    mov         ebp,esp
 005A6793    add         esp,0FFFFFFF4
 005A6796    push        ebx
 005A6797    xor         ecx,ecx
 005A6799    mov         dword ptr [ebp-0C],ecx
 005A679C    mov         ebx,edx
 005A679E    mov         dword ptr [ebp-4],eax
 005A67A1    xor         eax,eax
 005A67A3    push        ebp
 005A67A4    push        5A6838
 005A67A9    push        dword ptr fs:[eax]
 005A67AC    mov         dword ptr fs:[eax],esp
 005A67AF    xor         eax,eax
 005A67B1    mov         dword ptr [ebp-8],eax
 005A67B4    mov         eax,dword ptr [ebp-4]
 005A67B7    call        TIdSocketList.Lock
 005A67BC    xor         eax,eax
 005A67BE    push        ebp
 005A67BF    push        5A681B
 005A67C4    push        dword ptr fs:[eax]
 005A67C7    mov         dword ptr fs:[eax],esp
 005A67CA    test        ebx,ebx
>005A67CC    jl          005A67E4
 005A67CE    mov         eax,dword ptr [ebp-4]
 005A67D1    mov         eax,dword ptr [eax+8]
 005A67D4    cmp         eax,ebx
>005A67D6    jbe         005A67E4
 005A67D8    mov         eax,dword ptr [ebp-4]
 005A67DB    mov         eax,dword ptr [eax+ebx*4+0C]
 005A67DF    mov         dword ptr [ebp-8],eax
>005A67E2    jmp         005A6805
 005A67E4    lea         edx,[ebp-0C]
 005A67E7    mov         eax,[0078CCF0];^SResString664:TResStringRec
 005A67EC    call        LoadResString
 005A67F1    mov         ecx,dword ptr [ebp-0C]
 005A67F4    mov         dl,1
 005A67F6    mov         eax,[005A3E88];EIdStackSetSizeExceeded
 005A67FB    call        EIdException.Create
 005A6800    call        @RaiseExcept
 005A6805    xor         eax,eax
 005A6807    pop         edx
 005A6808    pop         ecx
 005A6809    pop         ecx
 005A680A    mov         dword ptr fs:[eax],edx
 005A680D    push        5A6822
 005A6812    mov         eax,dword ptr [ebp-4]
 005A6815    call        TIdSocketList.Unlock
 005A681A    ret
>005A681B    jmp         @HandleFinally
>005A6820    jmp         005A6812
 005A6822    xor         eax,eax
 005A6824    pop         edx
 005A6825    pop         ecx
 005A6826    pop         ecx
 005A6827    mov         dword ptr fs:[eax],edx
 005A682A    push        5A683F
 005A682F    lea         eax,[ebp-0C]
 005A6832    call        @UStrClr
 005A6837    ret
>005A6838    jmp         @HandleFinally
>005A683D    jmp         005A682F
 005A683F    mov         eax,dword ptr [ebp-8]
 005A6842    pop         ebx
 005A6843    mov         esp,ebp
 005A6845    pop         ebp
 005A6846    ret
*}
end;

//005A6848
procedure TIdSocketListWindows.Remove(AHandle:Cardinal);
begin
{*
 005A6848    push        ebp
 005A6849    mov         ebp,esp
 005A684B    push        ecx
 005A684C    push        ebx
 005A684D    mov         ebx,edx
 005A684F    mov         dword ptr [ebp-4],eax
 005A6852    mov         eax,dword ptr [ebp-4]
 005A6855    call        TIdSocketList.Lock
 005A685A    xor         ecx,ecx
 005A685C    push        ebp
 005A685D    push        5A68CA
 005A6862    push        dword ptr fs:[ecx]
 005A6865    mov         dword ptr fs:[ecx],esp
 005A6868    mov         eax,dword ptr [ebp-4]
 005A686B    mov         eax,dword ptr [eax+8]
 005A686E    test        eax,eax
>005A6870    jbe         005A68B4
 005A6872    mov         edx,eax
 005A6874    dec         edx
 005A6875    test        edx,edx
>005A6877    jl          005A68B4
 005A6879    inc         edx
 005A687A    xor         eax,eax
 005A687C    mov         ecx,dword ptr [ebp-4]
 005A687F    cmp         ebx,dword ptr [ecx+eax*4+0C]
>005A6883    jne         005A68B0
 005A6885    mov         edx,dword ptr [ebp-4]
 005A6888    dec         dword ptr [edx+8]
 005A688B    mov         edx,dword ptr [ebp-4]
 005A688E    mov         edx,dword ptr [edx+8]
 005A6891    mov         ecx,dword ptr [ebp-4]
 005A6894    mov         edx,dword ptr [ecx+edx*4+0C]
 005A6898    mov         ecx,dword ptr [ebp-4]
 005A689B    mov         dword ptr [ecx+eax*4+0C],edx
 005A689F    mov         edx,dword ptr [ebp-4]
 005A68A2    mov         edx,dword ptr [edx+8]
 005A68A5    mov         ecx,dword ptr [ebp-4]
 005A68A8    xor         ebx,ebx
 005A68AA    mov         dword ptr [ecx+edx*4+0C],ebx
>005A68AE    jmp         005A68B4
 005A68B0    inc         eax
 005A68B1    dec         edx
>005A68B2    jne         005A687C
 005A68B4    xor         eax,eax
 005A68B6    pop         edx
 005A68B7    pop         ecx
 005A68B8    pop         ecx
 005A68B9    mov         dword ptr fs:[eax],edx
 005A68BC    push        5A68D1
 005A68C1    mov         eax,dword ptr [ebp-4]
 005A68C4    call        TIdSocketList.Unlock
 005A68C9    ret
>005A68CA    jmp         @HandleFinally
>005A68CF    jmp         005A68C1
 005A68D1    pop         ebx
 005A68D2    pop         ecx
 005A68D3    pop         ebp
 005A68D4    ret
*}
end;

//005A68D8
function TIdStackWindows.WSTranslateSocketErrorMsg(AErr:Integer):string;
begin
{*
 005A68D8    push        ebp
 005A68D9    mov         ebp,esp
 005A68DB    add         esp,0FFFFFFE8
 005A68DE    push        ebx
 005A68DF    push        esi
 005A68E0    push        edi
 005A68E1    xor         ebx,ebx
 005A68E3    mov         dword ptr [ebp-14],ebx
 005A68E6    mov         dword ptr [ebp-18],ebx
 005A68E9    mov         edi,ecx
 005A68EB    mov         ebx,edx
 005A68ED    mov         esi,eax
 005A68EF    xor         eax,eax
 005A68F1    push        ebp
 005A68F2    push        5A696B
 005A68F7    push        dword ptr fs:[eax]
 005A68FA    mov         dword ptr fs:[eax],esp
 005A68FD    cmp         ebx,2AF9
>005A6903    jne         005A6945
 005A6905    push        edi
 005A6906    mov         dword ptr [ebp-10],ebx
 005A6909    mov         byte ptr [ebp-0C],0
 005A690D    lea         edx,[ebp-14]
 005A6910    mov         eax,[0078CEDC];^SResString649:TResStringRec
 005A6915    call        LoadResString
 005A691A    mov         eax,dword ptr [ebp-14]
 005A691D    mov         dword ptr [ebp-8],eax
 005A6920    mov         byte ptr [ebp-4],11
 005A6924    lea         eax,[ebp-10]
 005A6927    push        eax
 005A6928    lea         edx,[ebp-18]
 005A692B    mov         eax,[0078CBC0];^SResString610:TResStringRec
 005A6930    call        LoadResString
 005A6935    mov         eax,dword ptr [ebp-18]
 005A6938    mov         ecx,1
 005A693D    pop         edx
 005A693E    call        IndyFormat
>005A6943    jmp         005A6950
 005A6945    mov         ecx,edi
 005A6947    mov         edx,ebx
 005A6949    mov         eax,esi
 005A694B    call        TIdStack.WSTranslateSocketErrorMsg
 005A6950    xor         eax,eax
 005A6952    pop         edx
 005A6953    pop         ecx
 005A6954    pop         ecx
 005A6955    mov         dword ptr fs:[eax],edx
 005A6958    push        5A6972
 005A695D    lea         eax,[ebp-18]
 005A6960    mov         edx,2
 005A6965    call        @UStrArrayClr
 005A696A    ret
>005A696B    jmp         @HandleFinally
>005A6970    jmp         005A695D
 005A6972    pop         edi
 005A6973    pop         esi
 005A6974    pop         ebx
 005A6975    mov         esp,ebp
 005A6977    pop         ebp
 005A6978    ret
*}
end;

//005A697C
function TIdSocketListWindows.SelectRead(ATimeout:Integer):Boolean;
begin
{*
 005A697C    push        ebx
 005A697D    push        esi
 005A697E    add         esp,0FFFFFEFC
 005A6984    mov         esi,edx
 005A6986    mov         ebx,eax
 005A6988    mov         edx,esp
 005A698A    mov         eax,ebx
 005A698C    call        TIdSocketListWindows.GetFDSet
 005A6991    push        0
 005A6993    push        esi
 005A6994    lea         edx,[esp+8]
 005A6998    xor         ecx,ecx
 005A699A    mov         eax,dword ptr [ebx]
 005A699C    call        TIdSocketListWindows.FDSelect
 005A69A1    cmp         dword ptr [esp],0
 005A69A5    seta        al
 005A69A8    add         esp,104
 005A69AE    pop         esi
 005A69AF    pop         ebx
 005A69B0    ret
*}
end;

//005A69B4
function TIdSocketListWindows.FDSelect(AReadSet:PFDSet; AWriteSet:PFDSet; AExceptSet:PFDSet; const ATimeout:Integer):Boolean;
begin
{*
 005A69B4    push        ebp
 005A69B5    mov         ebp,esp
 005A69B7    add         esp,0FFFFFFF8
 005A69BA    push        ebx
 005A69BB    push        esi
 005A69BC    push        edi
 005A69BD    mov         esi,edx
 005A69BF    mov         ebx,dword ptr [ebp+8]
 005A69C2    cmp         ebx,0FFFFFFFE
>005A69C5    jne         005A69CB
 005A69C7    xor         eax,eax
>005A69C9    jmp         005A69EE
 005A69CB    mov         eax,ebx
 005A69CD    mov         edi,3E8
 005A69D2    cdq
 005A69D3    idiv        eax,edi
 005A69D5    mov         dword ptr [ebp-8],eax
 005A69D8    mov         eax,ebx
 005A69DA    mov         ebx,3E8
 005A69DF    cdq
 005A69E0    idiv        eax,ebx
 005A69E2    imul        eax,edx,3E8
 005A69E8    mov         dword ptr [ebp-4],eax
 005A69EB    lea         eax,[ebp-8]
 005A69EE    push        eax
 005A69EF    mov         eax,dword ptr [ebp+0C]
 005A69F2    push        eax
 005A69F3    push        ecx
 005A69F4    push        esi
 005A69F5    push        0
 005A69F7    mov         eax,[0078DB4C]
 005A69FC    mov         eax,dword ptr [eax]
 005A69FE    call        eax
 005A6A00    mov         ebx,eax
 005A6A02    mov         eax,[0078CD84]
 005A6A07    mov         eax,dword ptr [eax]
 005A6A09    mov         edx,ebx
 005A6A0B    call        TIdStack.CheckForSocketError
 005A6A10    test        eax,eax
 005A6A12    setg        al
 005A6A15    pop         edi
 005A6A16    pop         esi
 005A6A17    pop         ebx
 005A6A18    pop         ecx
 005A6A19    pop         ecx
 005A6A1A    pop         ebp
 005A6A1B    ret         8
*}
end;

//005A6A20
function TIdSocketListWindows.SelectReadList(var VSocketList:TIdSocketList; ATimeout:Integer):Boolean;
begin
{*
 005A6A20    push        ebx
 005A6A21    push        esi
 005A6A22    push        edi
 005A6A23    add         esp,0FFFFFEFC
 005A6A29    mov         edi,ecx
 005A6A2B    mov         esi,edx
 005A6A2D    mov         ebx,eax
 005A6A2F    mov         edx,esp
 005A6A31    mov         eax,ebx
 005A6A33    call        TIdSocketListWindows.GetFDSet
 005A6A38    push        0
 005A6A3A    push        edi
 005A6A3B    lea         edx,[esp+8]
 005A6A3F    xor         ecx,ecx
 005A6A41    mov         eax,dword ptr [ebx]
 005A6A43    call        TIdSocketListWindows.FDSelect
 005A6A48    cmp         dword ptr [esp],0
 005A6A4C    seta        bl
 005A6A4F    test        bl,bl
>005A6A51    je          005A6A6D
 005A6A53    cmp         dword ptr [esi],0
>005A6A56    jne         005A6A64
 005A6A58    mov         eax,[005A7B3C];TIdSocketList
 005A6A5D    call        TIdSocketList.CreateSocketList
 005A6A62    mov         dword ptr [esi],eax
 005A6A64    mov         edx,esp
 005A6A66    mov         eax,dword ptr [esi]
 005A6A68    call        TIdSocketListWindows.SetFDSet
 005A6A6D    mov         eax,ebx
 005A6A6F    add         esp,104
 005A6A75    pop         edi
 005A6A76    pop         esi
 005A6A77    pop         ebx
 005A6A78    ret
*}
end;

//005A6A7C
procedure ReadSet(AList:TIdSocketList; var ASet:TFDSet; var APSet:PFDSet);
begin
{*
 005A6A7C    push        ebx
 005A6A7D    push        esi
 005A6A7E    mov         esi,ecx
 005A6A80    mov         ebx,edx
 005A6A82    test        eax,eax
>005A6A84    je          005A6A92
 005A6A86    mov         edx,ebx
 005A6A88    call        TIdSocketListWindows.GetFDSet
 005A6A8D    mov         dword ptr [esi],ebx
 005A6A8F    pop         esi
 005A6A90    pop         ebx
 005A6A91    ret
 005A6A92    xor         eax,eax
 005A6A94    mov         dword ptr [esi],eax
 005A6A96    pop         esi
 005A6A97    pop         ebx
 005A6A98    ret
*}
end;

//005A6A9C
function TIdSocketListWindows.Select(AReadList:TIdSocketList; AWriteList:TIdSocketList; ATimeout:Integer; AExceptList:TIdSocketList):Boolean;
begin
{*
 005A6A9C    push        ebp
 005A6A9D    mov         ebp,esp
 005A6A9F    add         esp,0FFFFFCE0
 005A6AA5    push        ebx
 005A6AA6    push        esi
 005A6AA7    push        edi
 005A6AA8    mov         esi,ecx
 005A6AAA    mov         ebx,edx
 005A6AAC    mov         dword ptr [ebp-4],eax
 005A6AAF    mov         edi,dword ptr [ebp+0C]
 005A6AB2    lea         ecx,[ebp-0C]
 005A6AB5    lea         edx,[ebp-118]
 005A6ABB    mov         eax,ebx
 005A6ABD    call        ReadSet
 005A6AC2    lea         ecx,[ebp-10]
 005A6AC5    lea         edx,[ebp-21C]
 005A6ACB    mov         eax,esi
 005A6ACD    call        ReadSet
 005A6AD2    lea         ecx,[ebp-14]
 005A6AD5    lea         edx,[ebp-320]
 005A6ADB    mov         eax,edi
 005A6ADD    call        ReadSet
 005A6AE2    mov         eax,dword ptr [ebp-14]
 005A6AE5    push        eax
 005A6AE6    mov         eax,dword ptr [ebp+8]
 005A6AE9    push        eax
 005A6AEA    mov         ecx,dword ptr [ebp-10]
 005A6AED    mov         edx,dword ptr [ebp-0C]
 005A6AF0    mov         eax,dword ptr [ebp-4]
 005A6AF3    call        TIdSocketListWindows.FDSelect
 005A6AF8    mov         byte ptr [ebp-5],al
 005A6AFB    test        ebx,ebx
>005A6AFD    je          005A6B0C
 005A6AFF    lea         edx,[ebp-118]
 005A6B05    mov         eax,ebx
 005A6B07    call        TIdSocketListWindows.SetFDSet
 005A6B0C    test        esi,esi
>005A6B0E    je          005A6B1D
 005A6B10    lea         edx,[ebp-21C]
 005A6B16    mov         eax,esi
 005A6B18    call        TIdSocketListWindows.SetFDSet
 005A6B1D    test        edi,edi
>005A6B1F    je          005A6B2E
 005A6B21    lea         edx,[ebp-320]
 005A6B27    mov         eax,edi
 005A6B29    call        TIdSocketListWindows.SetFDSet
 005A6B2E    movzx       eax,byte ptr [ebp-5]
 005A6B32    pop         edi
 005A6B33    pop         esi
 005A6B34    pop         ebx
 005A6B35    mov         esp,ebp
 005A6B37    pop         ebp
 005A6B38    ret         8
*}
end;

//005A6B3C
procedure TIdSocketListWindows.SetFDSet(var VSet:TFDSet);
begin
{*
 005A6B3C    push        ebp
 005A6B3D    mov         ebp,esp
 005A6B3F    push        ecx
 005A6B40    push        ebx
 005A6B41    push        esi
 005A6B42    push        edi
 005A6B43    mov         ebx,edx
 005A6B45    mov         dword ptr [ebp-4],eax
 005A6B48    mov         eax,dword ptr [ebp-4]
 005A6B4B    call        TIdSocketList.Lock
 005A6B50    xor         eax,eax
 005A6B52    push        ebp
 005A6B53    push        5A6B83
 005A6B58    push        dword ptr fs:[eax]
 005A6B5B    mov         dword ptr fs:[eax],esp
 005A6B5E    mov         eax,dword ptr [ebp-4]
 005A6B61    mov         esi,ebx
 005A6B63    lea         edi,[eax+8]
 005A6B66    mov         ecx,41
 005A6B6B    rep movs    dword ptr [edi],dword ptr [esi]
 005A6B6D    xor         eax,eax
 005A6B6F    pop         edx
 005A6B70    pop         ecx
 005A6B71    pop         ecx
 005A6B72    mov         dword ptr fs:[eax],edx
 005A6B75    push        5A6B8A
 005A6B7A    mov         eax,dword ptr [ebp-4]
 005A6B7D    call        TIdSocketList.Unlock
 005A6B82    ret
>005A6B83    jmp         @HandleFinally
>005A6B88    jmp         005A6B7A
 005A6B8A    pop         edi
 005A6B8B    pop         esi
 005A6B8C    pop         ebx
 005A6B8D    pop         ecx
 005A6B8E    pop         ebp
 005A6B8F    ret
*}
end;

//005A6B90
procedure TIdSocketListWindows.GetFDSet(var VSet:TFDSet);
begin
{*
 005A6B90    push        ebp
 005A6B91    mov         ebp,esp
 005A6B93    push        ecx
 005A6B94    push        ebx
 005A6B95    push        esi
 005A6B96    push        edi
 005A6B97    mov         ebx,edx
 005A6B99    mov         dword ptr [ebp-4],eax
 005A6B9C    mov         eax,dword ptr [ebp-4]
 005A6B9F    call        TIdSocketList.Lock
 005A6BA4    xor         eax,eax
 005A6BA6    push        ebp
 005A6BA7    push        5A6BD7
 005A6BAC    push        dword ptr fs:[eax]
 005A6BAF    mov         dword ptr fs:[eax],esp
 005A6BB2    mov         eax,dword ptr [ebp-4]
 005A6BB5    lea         esi,[eax+8]
 005A6BB8    mov         edi,ebx
 005A6BBA    mov         ecx,41
 005A6BBF    rep movs    dword ptr [edi],dword ptr [esi]
 005A6BC1    xor         eax,eax
 005A6BC3    pop         edx
 005A6BC4    pop         ecx
 005A6BC5    pop         ecx
 005A6BC6    mov         dword ptr fs:[eax],edx
 005A6BC9    push        5A6BDE
 005A6BCE    mov         eax,dword ptr [ebp-4]
 005A6BD1    call        TIdSocketList.Unlock
 005A6BD6    ret
>005A6BD7    jmp         @HandleFinally
>005A6BDC    jmp         005A6BCE
 005A6BDE    pop         edi
 005A6BDF    pop         esi
 005A6BE0    pop         ebx
 005A6BE1    pop         ecx
 005A6BE2    pop         ebp
 005A6BE3    ret
*}
end;

//005A6BE4
procedure TIdStackWindows.SetBlocking(ASocket:Cardinal; ABlocking:Boolean);
begin
{*
 005A6BE4    push        ebx
 005A6BE5    push        esi
 005A6BE6    push        ecx
 005A6BE7    mov         esi,edx
 005A6BE9    mov         ebx,eax
 005A6BEB    xor         cl,1
 005A6BEE    movzx       eax,cl
 005A6BF1    mov         dword ptr [esp],eax
 005A6BF4    push        esp
 005A6BF5    push        8004667E
 005A6BFA    push        esi
 005A6BFB    mov         eax,[0078D944]
 005A6C00    mov         eax,dword ptr [eax]
 005A6C02    call        eax
 005A6C04    mov         edx,eax
 005A6C06    mov         eax,ebx
 005A6C08    call        TIdStack.CheckForSocketError
 005A6C0D    pop         edx
 005A6C0E    pop         esi
 005A6C0F    pop         ebx
 005A6C10    ret
*}
end;

//005A6C14
function TIdSocketListWindows.Clone:TIdSocketList;
begin
{*
 005A6C14    push        ebp
 005A6C15    mov         ebp,esp
 005A6C17    add         esp,0FFFFFFF8
 005A6C1A    push        ebx
 005A6C1B    push        esi
 005A6C1C    push        edi
 005A6C1D    mov         dword ptr [ebp-4],eax
 005A6C20    mov         dl,1
 005A6C22    mov         eax,[005A4608];TIdSocketListWindows
 005A6C27    call        TIdSocketList.Create
 005A6C2C    mov         dword ptr [ebp-8],eax
 005A6C2F    xor         edx,edx
 005A6C31    push        ebp
 005A6C32    push        5A6C88
 005A6C37    push        dword ptr fs:[edx]
 005A6C3A    mov         dword ptr fs:[edx],esp
 005A6C3D    mov         eax,dword ptr [ebp-4]
 005A6C40    call        TIdSocketList.Lock
 005A6C45    xor         eax,eax
 005A6C47    push        ebp
 005A6C48    push        5A6C77
 005A6C4D    push        dword ptr fs:[eax]
 005A6C50    mov         dword ptr fs:[eax],esp
 005A6C53    mov         eax,dword ptr [ebp-4]
 005A6C56    lea         edx,[eax+8]
 005A6C59    mov         eax,dword ptr [ebp-8]
 005A6C5C    call        TIdSocketListWindows.SetFDSet
 005A6C61    xor         eax,eax
 005A6C63    pop         edx
 005A6C64    pop         ecx
 005A6C65    pop         ecx
 005A6C66    mov         dword ptr fs:[eax],edx
 005A6C69    push        5A6C7E
 005A6C6E    mov         eax,dword ptr [ebp-4]
 005A6C71    call        TIdSocketList.Unlock
 005A6C76    ret
>005A6C77    jmp         @HandleFinally
>005A6C7C    jmp         005A6C6E
 005A6C7E    xor         eax,eax
 005A6C80    pop         edx
 005A6C81    pop         ecx
 005A6C82    pop         ecx
 005A6C83    mov         dword ptr fs:[eax],edx
>005A6C86    jmp         005A6CA4
>005A6C88    jmp         @HandleAnyException
 005A6C8D    mov         eax,dword ptr [ebp-8]
 005A6C90    xor         edx,edx
 005A6C92    mov         dword ptr [ebp-8],edx
 005A6C95    call        TObject.Free
 005A6C9A    call        @RaiseAgain
 005A6C9F    call        @DoneExcept
 005A6CA4    mov         eax,dword ptr [ebp-8]
 005A6CA7    pop         edi
 005A6CA8    pop         esi
 005A6CA9    pop         ebx
 005A6CAA    pop         ecx
 005A6CAB    pop         ecx
 005A6CAC    pop         ebp
 005A6CAD    ret
*}
end;

//005A6CB0
function TIdStackWindows.WouldBlock(AResult:Integer):Boolean;
begin
{*
 005A6CB0    push        ebx
 005A6CB1    push        esi
 005A6CB2    push        ecx
 005A6CB3    mov         esi,edx
 005A6CB5    mov         ebx,eax
 005A6CB7    push        0
 005A6CB9    mov         dword ptr [esp+4],2733
 005A6CC1    lea         ecx,[esp+4]
 005A6CC5    mov         edx,esi
 005A6CC7    mov         eax,ebx
 005A6CC9    call        TIdStack.CheckForSocketError
 005A6CCE    test        eax,eax
 005A6CD0    setne       al
 005A6CD3    pop         edx
 005A6CD4    pop         esi
 005A6CD5    pop         ebx
 005A6CD6    ret
*}
end;

//005A6CD8
function TIdStackWindows.HostByName(const AHostName:UnicodeString; const AIPVersion:TIdIPVersion):UnicodeString;
begin
{*
 005A6CD8    push        ebp
 005A6CD9    mov         ebp,esp
 005A6CDB    add         esp,0FFFFFFD0
 005A6CDE    push        ebx
 005A6CDF    push        esi
 005A6CE0    push        edi
 005A6CE1    xor         ebx,ebx
 005A6CE3    mov         dword ptr [ebp-30],ebx
 005A6CE6    mov         dword ptr [ebp-4],ebx
 005A6CE9    mov         ebx,ecx
 005A6CEB    mov         edi,edx
 005A6CED    mov         esi,eax
 005A6CEF    xor         eax,eax
 005A6CF1    push        ebp
 005A6CF2    push        5A6E94
 005A6CF7    push        dword ptr fs:[eax]
 005A6CFA    mov         dword ptr fs:[eax],esp
 005A6CFD    mov         eax,[0078D7F4]
 005A6D02    cmp         byte ptr [eax],0
>005A6D05    jne         005A6DAC
 005A6D0B    sub         bl,1
>005A6D0E    jb          005A6D17
>005A6D10    je          005A6D7A
>005A6D12    jmp         005A6DA0
 005A6D17    lea         eax,[ebp-4]
 005A6D1A    mov         edx,edi
 005A6D1C    mov         ecx,0
 005A6D21    call        @LStrFromUStr
 005A6D26    mov         eax,dword ptr [ebp-4]
 005A6D29    call        @LStrToPChar
 005A6D2E    push        eax
 005A6D2F    mov         eax,[0078D1FC]
 005A6D34    mov         eax,dword ptr [eax]
 005A6D36    call        eax
 005A6D38    mov         ebx,eax
 005A6D3A    test        ebx,ebx
>005A6D3C    jne         005A6D45
 005A6D3E    mov         eax,esi
 005A6D40    call        TIdStack.RaiseLastSocketError
 005A6D45    mov         eax,dword ptr [ebx+0C]
 005A6D48    mov         eax,dword ptr [eax]
 005A6D4A    movzx       edx,byte ptr [eax]
 005A6D4D    mov         byte ptr [ebp-8],dl
 005A6D50    movzx       edx,byte ptr [eax+1]
 005A6D54    mov         byte ptr [ebp-7],dl
 005A6D57    movzx       edx,byte ptr [eax+2]
 005A6D5B    mov         byte ptr [ebp-6],dl
 005A6D5E    movzx       eax,byte ptr [eax+3]
 005A6D62    mov         byte ptr [ebp-5],al
 005A6D65    mov         eax,dword ptr [ebp+8]
 005A6D68    push        eax
 005A6D69    lea         edx,[ebp-8]
 005A6D6C    xor         ecx,ecx
 005A6D6E    mov         eax,esi
 005A6D70    call        TIdStackBSDBase.TranslateTInAddrToString
>005A6D75    jmp         005A6E76
 005A6D7A    lea         edx,[ebp-30]
 005A6D7D    mov         eax,[0078D768];^SResString659:TResStringRec
 005A6D82    call        LoadResString
 005A6D87    mov         ecx,dword ptr [ebp-30]
 005A6D8A    mov         dl,1
 005A6D8C    mov         eax,[005A4558];EIdIPv6Unavailable
 005A6D91    call        EIdException.Create
 005A6D96    call        @RaiseExcept
>005A6D9B    jmp         005A6E76
 005A6DA0    mov         eax,esi
 005A6DA2    call        TIdStack.IPVersionUnsupported
>005A6DA7    jmp         005A6E76
 005A6DAC    mov         eax,ebx
 005A6DAE    sub         al,2
>005A6DB0    jb          005A6DB9
 005A6DB2    mov         eax,esi
 005A6DB4    call        TIdStack.IPVersionUnsupported
 005A6DB9    lea         eax,[ebp-2C]
 005A6DBC    xor         ecx,ecx
 005A6DBE    mov         edx,20
 005A6DC3    call        @FillChar
 005A6DC8    movzx       eax,bl
 005A6DCB    mov         edx,dword ptr ds:[78D518]
 005A6DD1    mov         eax,dword ptr [edx+eax*4]
 005A6DD4    mov         dword ptr [ebp-28],eax
 005A6DD7    mov         dword ptr [ebp-24],1
 005A6DDE    xor         eax,eax
 005A6DE0    mov         dword ptr [ebp-0C],eax
 005A6DE3    lea         eax,[ebp-0C]
 005A6DE6    push        eax
 005A6DE7    lea         eax,[ebp-2C]
 005A6DEA    push        eax
 005A6DEB    push        0
 005A6DED    mov         eax,edi
 005A6DEF    call        @UStrToPWChar
 005A6DF4    push        eax
 005A6DF5    mov         eax,[0078D7DC]
 005A6DFA    mov         eax,dword ptr [eax]
 005A6DFC    call        eax
 005A6DFE    mov         edi,eax
 005A6E00    test        edi,edi
>005A6E02    je          005A6E14
 005A6E04    mov         eax,edi
 005A6E06    call        gaiErrorToWsaError
 005A6E0B    mov         edx,eax
 005A6E0D    mov         eax,esi
 005A6E0F    mov         ecx,dword ptr [eax]
 005A6E11    call        dword ptr [ecx+4C]
 005A6E14    xor         eax,eax
 005A6E16    push        ebp
 005A6E17    push        5A6E6F
 005A6E1C    push        dword ptr fs:[eax]
 005A6E1F    mov         dword ptr fs:[eax],esp
 005A6E22    test        bl,bl
>005A6E24    jne         005A6E3E
 005A6E26    mov         eax,dword ptr [ebp+8]
 005A6E29    push        eax
 005A6E2A    mov         eax,dword ptr [ebp-0C]
 005A6E2D    mov         eax,dword ptr [eax+18]
 005A6E30    lea         edx,[eax+4]
 005A6E33    mov         ecx,ebx
 005A6E35    mov         eax,esi
 005A6E37    call        TIdStackBSDBase.TranslateTInAddrToString
>005A6E3C    jmp         005A6E54
 005A6E3E    mov         eax,dword ptr [ebp+8]
 005A6E41    push        eax
 005A6E42    mov         eax,dword ptr [ebp-0C]
 005A6E45    mov         eax,dword ptr [eax+18]
 005A6E48    lea         edx,[eax+8]
 005A6E4B    mov         ecx,ebx
 005A6E4D    mov         eax,esi
 005A6E4F    call        TIdStackBSDBase.TranslateTInAddrToString
 005A6E54    xor         eax,eax
 005A6E56    pop         edx
 005A6E57    pop         ecx
 005A6E58    pop         ecx
 005A6E59    mov         dword ptr fs:[eax],edx
 005A6E5C    push        5A6E76
 005A6E61    mov         eax,dword ptr [ebp-0C]
 005A6E64    push        eax
 005A6E65    mov         eax,[0078D290]
 005A6E6A    mov         eax,dword ptr [eax]
 005A6E6C    call        eax
 005A6E6E    ret
>005A6E6F    jmp         @HandleFinally
>005A6E74    jmp         005A6E61
 005A6E76    xor         eax,eax
 005A6E78    pop         edx
 005A6E79    pop         ecx
 005A6E7A    pop         ecx
 005A6E7B    mov         dword ptr fs:[eax],edx
 005A6E7E    push        5A6E9B
 005A6E83    lea         eax,[ebp-30]
 005A6E86    call        @UStrClr
 005A6E8B    lea         eax,[ebp-4]
 005A6E8E    call        @LStrClr
 005A6E93    ret
>005A6E94    jmp         @HandleFinally
>005A6E99    jmp         005A6E83
 005A6E9B    pop         edi
 005A6E9C    pop         esi
 005A6E9D    pop         ebx
 005A6E9E    mov         esp,ebp
 005A6EA0    pop         ebp
 005A6EA1    ret         4
*}
end;

//005A6EA4
procedure TIdStackWindows.Connect(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
 005A6EA4    push        ebp
 005A6EA5    mov         ebp,esp
 005A6EA7    add         esp,0FFFFFFE0
 005A6EAA    push        ebx
 005A6EAB    push        esi
 005A6EAC    push        edi
 005A6EAD    mov         dword ptr [ebp-4],ecx
 005A6EB0    mov         edi,edx
 005A6EB2    mov         ebx,eax
 005A6EB4    lea         eax,[ebp-20]
 005A6EB7    xor         ecx,ecx
 005A6EB9    mov         edx,1C
 005A6EBE    call        @FillChar
 005A6EC3    movzx       eax,byte ptr [ebp+8]
 005A6EC7    sub         al,1
>005A6EC9    jb          005A6ECF
>005A6ECB    je          005A6EFF
>005A6ECD    jmp         005A6F2D
 005A6ECF    lea         esi,[ebp-20]
 005A6ED2    mov         word ptr [esi],2
 005A6ED7    push        0
 005A6ED9    lea         ecx,[esi+4]
 005A6EDC    mov         edx,dword ptr [ebp-4]
 005A6EDF    mov         eax,ebx
 005A6EE1    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A6EE6    movzx       eax,word ptr [ebp+0C]
 005A6EEA    push        eax
 005A6EEB    mov         eax,[0078D0DC]
 005A6EF0    mov         eax,dword ptr [eax]
 005A6EF2    call        eax
 005A6EF4    mov         word ptr [esi+2],ax
 005A6EF8    mov         esi,10
>005A6EFD    jmp         005A6F36
 005A6EFF    mov         word ptr [ebp-20],17
 005A6F05    push        1
 005A6F07    lea         ecx,[ebp-18]
 005A6F0A    mov         edx,dword ptr [ebp-4]
 005A6F0D    mov         eax,ebx
 005A6F0F    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A6F14    movzx       eax,word ptr [ebp+0C]
 005A6F18    push        eax
 005A6F19    mov         eax,[0078D0DC]
 005A6F1E    mov         eax,dword ptr [eax]
 005A6F20    call        eax
 005A6F22    mov         word ptr [ebp-1E],ax
 005A6F26    mov         esi,1C
>005A6F2B    jmp         005A6F36
 005A6F2D    xor         esi,esi
 005A6F2F    mov         eax,ebx
 005A6F31    call        TIdStack.IPVersionUnsupported
 005A6F36    push        esi
 005A6F37    lea         eax,[ebp-20]
 005A6F3A    push        eax
 005A6F3B    push        edi
 005A6F3C    mov         eax,[0078CBFC]
 005A6F41    mov         eax,dword ptr [eax]
 005A6F43    call        eax
 005A6F45    mov         edx,eax
 005A6F47    mov         eax,ebx
 005A6F49    call        TIdStack.CheckForSocketError
 005A6F4E    pop         edi
 005A6F4F    pop         esi
 005A6F50    pop         ebx
 005A6F51    mov         esp,ebp
 005A6F53    pop         ebp
 005A6F54    ret         8
*}
end;

//005A6F58
procedure TIdStackWindows.GetPeerName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);
begin
{*
 005A6F58    push        ebp
 005A6F59    mov         ebp,esp
 005A6F5B    add         esp,0FFFFFFD8
 005A6F5E    push        ebx
 005A6F5F    push        esi
 005A6F60    push        edi
 005A6F61    xor         ebx,ebx
 005A6F63    mov         dword ptr [ebp-28],ebx
 005A6F66    mov         dword ptr [ebp-24],ebx
 005A6F69    mov         edi,ecx
 005A6F6B    mov         esi,edx
 005A6F6D    mov         ebx,eax
 005A6F6F    xor         eax,eax
 005A6F71    push        ebp
 005A6F72    push        5A7042
 005A6F77    push        dword ptr fs:[eax]
 005A6F7A    mov         dword ptr fs:[eax],esp
 005A6F7D    mov         dword ptr [ebp-4],1C
 005A6F84    lea         eax,[ebp-4]
 005A6F87    push        eax
 005A6F88    lea         eax,[ebp-20]
 005A6F8B    push        eax
 005A6F8C    push        esi
 005A6F8D    mov         eax,[0078CD78]
 005A6F92    mov         eax,dword ptr [eax]
 005A6F94    call        eax
 005A6F96    mov         edx,eax
 005A6F98    mov         eax,ebx
 005A6F9A    call        TIdStack.CheckForSocketError
 005A6F9F    movzx       eax,word ptr [ebp-20]
 005A6FA3    sub         ax,2
>005A6FA7    je          005A6FB1
 005A6FA9    sub         ax,15
>005A6FAD    je          005A6FEA
>005A6FAF    jmp         005A7020
 005A6FB1    lea         esi,[ebp-20]
 005A6FB4    lea         eax,[ebp-24]
 005A6FB7    push        eax
 005A6FB8    lea         edx,[esi+4]
 005A6FBB    xor         ecx,ecx
 005A6FBD    mov         eax,ebx
 005A6FBF    call        TIdStackBSDBase.TranslateTInAddrToString
 005A6FC4    mov         edx,dword ptr [ebp-24]
 005A6FC7    mov         eax,edi
 005A6FC9    call        @UStrAsg
 005A6FCE    movzx       eax,word ptr [esi+2]
 005A6FD2    push        eax
 005A6FD3    mov         eax,[0078D0E0]
 005A6FD8    mov         eax,dword ptr [eax]
 005A6FDA    call        eax
 005A6FDC    mov         edx,dword ptr [ebp+0C]
 005A6FDF    mov         word ptr [edx],ax
 005A6FE2    mov         eax,dword ptr [ebp+8]
 005A6FE5    mov         byte ptr [eax],0
>005A6FE8    jmp         005A7027
 005A6FEA    lea         eax,[ebp-28]
 005A6FED    push        eax
 005A6FEE    lea         edx,[ebp-18]
 005A6FF1    mov         cl,1
 005A6FF3    mov         eax,ebx
 005A6FF5    call        TIdStackBSDBase.TranslateTInAddrToString
 005A6FFA    mov         edx,dword ptr [ebp-28]
 005A6FFD    mov         eax,edi
 005A6FFF    call        @UStrAsg
 005A7004    movzx       eax,word ptr [ebp-1E]
 005A7008    push        eax
 005A7009    mov         eax,[0078D0E0]
 005A700E    mov         eax,dword ptr [eax]
 005A7010    call        eax
 005A7012    mov         edx,dword ptr [ebp+0C]
 005A7015    mov         word ptr [edx],ax
 005A7018    mov         eax,dword ptr [ebp+8]
 005A701B    mov         byte ptr [eax],1
>005A701E    jmp         005A7027
 005A7020    mov         eax,ebx
 005A7022    call        TIdStack.IPVersionUnsupported
 005A7027    xor         eax,eax
 005A7029    pop         edx
 005A702A    pop         ecx
 005A702B    pop         ecx
 005A702C    mov         dword ptr fs:[eax],edx
 005A702F    push        5A7049
 005A7034    lea         eax,[ebp-28]
 005A7037    mov         edx,2
 005A703C    call        @UStrArrayClr
 005A7041    ret
>005A7042    jmp         @HandleFinally
>005A7047    jmp         005A7034
 005A7049    pop         edi
 005A704A    pop         esi
 005A704B    pop         ebx
 005A704C    mov         esp,ebp
 005A704E    pop         ebp
 005A704F    ret         8
*}
end;

//005A7054
procedure TIdStackWindows.Disconnect(ASocket:Cardinal);
begin
{*
 005A7054    push        ebx
 005A7055    push        esi
 005A7056    push        edi
 005A7057    mov         esi,edx
 005A7059    mov         ebx,eax
 005A705B    mov         ecx,1
 005A7060    mov         edx,esi
 005A7062    mov         eax,ebx
 005A7064    mov         edi,dword ptr [eax]
 005A7066    call        dword ptr [edi+0AC]
 005A706C    mov         edx,esi
 005A706E    mov         eax,ebx
 005A7070    mov         ecx,dword ptr [eax]
 005A7072    call        dword ptr [ecx+0A0]
 005A7078    pop         edi
 005A7079    pop         esi
 005A707A    pop         ebx
 005A707B    ret
*}
end;

//005A707C
procedure TIdStackWindows.SetSocketOption(ASocket:Cardinal; Alevel:Integer; Aoptlen:Integer; Aoptval:PAnsiChar; Aoptname:Integer);
begin
{*
 005A707C    push        ebp
 005A707D    mov         ebp,esp
 005A707F    push        ebx
 005A7080    push        esi
 005A7081    push        edi
 005A7082    mov         edi,ecx
 005A7084    mov         esi,edx
 005A7086    mov         ebx,eax
 005A7088    mov         eax,dword ptr [ebp+8]
 005A708B    push        eax
 005A708C    mov         eax,dword ptr [ebp+0C]
 005A708F    push        eax
 005A7090    mov         eax,dword ptr [ebp+10]
 005A7093    push        eax
 005A7094    push        edi
 005A7095    push        esi
 005A7096    mov         eax,[0078CED8]
 005A709B    mov         eax,dword ptr [eax]
 005A709D    call        eax
 005A709F    mov         edx,eax
 005A70A1    mov         eax,ebx
 005A70A3    call        TIdStack.CheckForSocketError
 005A70A8    pop         edi
 005A70A9    pop         esi
 005A70AA    pop         ebx
 005A70AB    pop         ebp
 005A70AC    ret         0C
*}
end;

//005A70B0
procedure TIdStackWindows.GetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);
begin
{*
 005A70B0    push        ebp
 005A70B1    mov         ebp,esp
 005A70B3    add         esp,0FFFFFFF4
 005A70B6    push        ebx
 005A70B7    push        esi
 005A70B8    push        edi
 005A70B9    mov         dword ptr [ebp-4],ecx
 005A70BC    mov         esi,eax
 005A70BE    lea         edi,[ebp-0C]
 005A70C1    mov         dword ptr [ebp-8],4
 005A70C8    mov         eax,dword ptr [ebp+0C]
 005A70CB    push        eax
 005A70CC    push        edi
 005A70CD    lea         eax,[ebp-8]
 005A70D0    push        eax
 005A70D1    mov         ecx,dword ptr [ebp-4]
 005A70D4    mov         eax,esi
 005A70D6    mov         ebx,dword ptr [eax]
 005A70D8    call        dword ptr [ebx+0CC]
 005A70DE    mov         eax,dword ptr [ebp+8]
 005A70E1    mov         edx,dword ptr [ebp-0C]
 005A70E4    mov         dword ptr [eax],edx
 005A70E6    pop         edi
 005A70E7    pop         esi
 005A70E8    pop         ebx
 005A70E9    mov         esp,ebp
 005A70EB    pop         ebp
 005A70EC    ret         8
*}
end;

//005A70F0
function TIdStackWindows.SupportsIPv6:Boolean;
begin
{*
 005A70F0    push        ebp
 005A70F1    mov         ebp,esp
 005A70F3    add         esp,0FFFFFFF4
 005A70F6    push        ebx
 005A70F7    mov         byte ptr [ebp-1],0
 005A70FB    xor         eax,eax
 005A70FD    mov         dword ptr [ebp-8],eax
 005A7100    lea         eax,[ebp-8]
 005A7103    push        eax
 005A7104    push        0
 005A7106    push        0
 005A7108    mov         eax,[0078D5D0]
 005A710D    mov         eax,dword ptr [eax]
 005A710F    call        eax
 005A7111    inc         eax
>005A7112    jne         005A7185
 005A7114    cmp         dword ptr [ebp-8],0
>005A7118    jbe         005A7185
 005A711A    mov         eax,dword ptr [ebp-8]
 005A711D    call        @GetMem
 005A7122    mov         dword ptr [ebp-0C],eax
 005A7125    xor         ebx,ebx
 005A7127    push        ebp
 005A7128    push        5A717E
 005A712D    push        dword ptr fs:[ebx]
 005A7130    mov         dword ptr fs:[ebx],esp
 005A7133    lea         eax,[ebp-8]
 005A7136    push        eax
 005A7137    mov         eax,dword ptr [ebp-0C]
 005A713A    push        eax
 005A713B    push        0
 005A713D    mov         eax,[0078D5D0]
 005A7142    mov         eax,dword ptr [eax]
 005A7144    call        eax
 005A7146    test        eax,eax
>005A7148    jle         005A7168
 005A714A    mov         edx,dword ptr [ebp-0C]
 005A714D    dec         eax
 005A714E    test        eax,eax
>005A7150    jl          005A7168
 005A7152    inc         eax
 005A7153    cmp         dword ptr [edx+4C],17
>005A7157    jne         005A715F
 005A7159    mov         byte ptr [ebp-1],1
>005A715D    jmp         005A7168
 005A715F    add         edx,274
 005A7165    dec         eax
>005A7166    jne         005A7153
 005A7168    xor         eax,eax
 005A716A    pop         edx
 005A716B    pop         ecx
 005A716C    pop         ecx
 005A716D    mov         dword ptr fs:[eax],edx
 005A7170    push        5A7185
 005A7175    mov         eax,dword ptr [ebp-0C]
 005A7178    call        @FreeMem
 005A717D    ret
>005A717E    jmp         @HandleFinally
>005A7183    jmp         005A7175
 005A7185    movzx       eax,byte ptr [ebp-1]
 005A7189    pop         ebx
 005A718A    mov         esp,ebp
 005A718C    pop         ebp
 005A718D    ret
*}
end;

//005A7190
function TIdStackWindows.IOControl(s:Cardinal; cmd:Cardinal; var arg:Cardinal):Integer;
begin
{*
 005A7190    push        ebp
 005A7191    mov         ebp,esp
 005A7193    mov         eax,dword ptr [ebp+8]
 005A7196    push        eax
 005A7197    push        ecx
 005A7198    push        edx
 005A7199    mov         eax,[0078D944]
 005A719E    mov         eax,dword ptr [eax]
 005A71A0    call        eax
 005A71A2    pop         ebp
 005A71A3    ret         4
*}
end;

//005A71A8
procedure TIdStackWindows.WSQuerryIPv6Route(ASocket:TIdStackSocketHandle; const AIP:UnicodeString; const APort:Word; var VSource:void ; var VDest:void );
begin
{*
 005A71A8    push        ebp
 005A71A9    mov         ebp,esp
 005A71AB    add         esp,0FFFFFF60
 005A71B1    push        ebx
 005A71B2    push        esi
 005A71B3    push        edi
 005A71B4    mov         esi,ecx
 005A71B6    mov         edi,edx
 005A71B8    mov         ebx,eax
 005A71BA    lea         eax,[ebp-0A0]
 005A71C0    xor         ecx,ecx
 005A71C2    mov         edx,1C
 005A71C7    call        @FillChar
 005A71CC    mov         word ptr [ebp-0A0],17
 005A71D5    push        1
 005A71D7    lea         ecx,[ebp-98]
 005A71DD    mov         edx,esi
 005A71DF    mov         eax,ebx
 005A71E1    call        TIdStackBSDBase.TranslateStringToTInAddr
 005A71E6    mov         edx,dword ptr [ebp+8]
 005A71E9    lea         eax,[ebp-98]
 005A71EF    mov         ecx,10
 005A71F4    call        Move
 005A71F9    movzx       eax,word ptr [ebp+10]
 005A71FD    push        eax
 005A71FE    mov         eax,[0078D0DC]
 005A7203    mov         eax,dword ptr [eax]
 005A7205    call        eax
 005A7207    mov         word ptr [ebp-9E],ax
 005A720E    lea         esi,[ebp-84]
 005A7214    push        0
 005A7216    push        0
 005A7218    lea         eax,[ebp-4]
 005A721B    push        eax
 005A721C    push        80
 005A7221    lea         eax,[ebp-84]
 005A7227    push        eax
 005A7228    push        1C
 005A722A    lea         eax,[ebp-0A0]
 005A7230    push        eax
 005A7231    push        0C8000014
 005A7236    push        edi
 005A7237    mov         eax,[0078D25C]
 005A723C    mov         eax,dword ptr [eax]
 005A723E    call        eax
 005A7240    mov         edx,eax
 005A7242    mov         eax,ebx
 005A7244    call        TIdStack.CheckForSocketError
 005A7249    mov         edx,dword ptr [ebp+0C]
 005A724C    lea         eax,[esi+8]
 005A724F    mov         ecx,10
 005A7254    call        Move
 005A7259    pop         edi
 005A725A    pop         esi
 005A725B    pop         ebx
 005A725C    mov         esp,ebp
 005A725E    pop         ebp
 005A725F    ret         0C
*}
end;

//005A7264
{*procedure TIdStackWindows.WriteChecksum(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005A7264    push        ebp
 005A7265    mov         ebp,esp
 005A7267    push        ebx
 005A7268    push        esi
 005A7269    mov         esi,ecx
 005A726B    mov         ebx,eax
 005A726D    movzx       eax,byte ptr [ebp+8]
 005A7271    sub         al,1
>005A7273    jb          005A7279
>005A7275    je          005A7296
>005A7277    jmp         005A72AE
 005A7279    mov         edx,dword ptr [esi]
 005A727B    mov         eax,ebx
 005A727D    mov         ecx,dword ptr [eax]
 005A727F    call        dword ptr [ecx+94];TIdStack.CalcCheckSum
 005A7285    call        00597344
 005A728A    mov         edx,esi
 005A728C    mov         ecx,dword ptr [ebp+14]
 005A728F    call        CopyTIdShort
>005A7294    jmp         005A72B5
 005A7296    mov         eax,dword ptr [ebp+14]
 005A7299    push        eax
 005A729A    mov         eax,dword ptr [ebp+10]
 005A729D    push        eax
 005A729E    movzx       eax,word ptr [ebp+0C]
 005A72A2    push        eax
 005A72A3    mov         ecx,esi
 005A72A5    mov         eax,ebx
 005A72A7    call        005A72BC
>005A72AC    jmp         005A72B5
 005A72AE    mov         eax,ebx
 005A72B0    call        TIdStack.IPVersionUnsupported
 005A72B5    pop         esi
 005A72B6    pop         ebx
 005A72B7    pop         ebp
 005A72B8    ret         10
end;*}

//005A72BC
{*procedure sub_005A72BC(?:TIdStackWindows; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005A72BC    push        ebp
 005A72BD    mov         ebp,esp
 005A72BF    add         esp,0FFFFFFD4
 005A72C2    push        ebx
 005A72C3    push        esi
 005A72C4    push        edi
 005A72C5    xor         ebx,ebx
 005A72C7    mov         dword ptr [ebp-4],ebx
 005A72CA    mov         esi,ecx
 005A72CC    mov         dword ptr [ebp-8],edx
 005A72CF    mov         edi,eax
 005A72D1    xor         eax,eax
 005A72D3    push        ebp
 005A72D4    push        5A73E4
 005A72D9    push        dword ptr fs:[eax]
 005A72DC    mov         dword ptr fs:[eax],esp
 005A72DF    movzx       eax,word ptr [ebp+8]
 005A72E3    push        eax
 005A72E4    lea         eax,[ebp-1C]
 005A72E7    push        eax
 005A72E8    lea         eax,[ebp-2C]
 005A72EB    push        eax
 005A72EC    mov         ecx,dword ptr [ebp+0C]
 005A72EF    mov         edx,dword ptr [ebp-8]
 005A72F2    mov         eax,edi
 005A72F4    call        TIdStackWindows.WSQuerryIPv6Route
 005A72F9    mov         eax,dword ptr [esi]
 005A72FB    call        @DynArrayLength
 005A7300    add         eax,28
 005A7303    push        eax
 005A7304    lea         eax,[ebp-4]
 005A7307    mov         ecx,1
 005A730C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005A7312    call        @DynArraySetLength
 005A7317    add         esp,4
 005A731A    mov         edx,dword ptr [ebp-4]
 005A731D    lea         eax,[ebp-1C]
 005A7320    mov         ecx,1C
 005A7325    call        Move
 005A732A    mov         ebx,1C
 005A732F    mov         eax,dword ptr [ebp-4]
 005A7332    lea         edx,[eax+ebx]
 005A7335    lea         eax,[ebp-2C]
 005A7338    mov         ecx,1C
 005A733D    call        Move
 005A7342    add         ebx,1C
 005A7345    mov         eax,dword ptr [esi]
 005A7347    call        @DynArrayLength
 005A734C    mov         dword ptr [ebp-0C],eax
 005A734F    mov         eax,[0078D940];^gvar_00789ED0
 005A7354    mov         eax,dword ptr [eax]
 005A7356    mov         edx,dword ptr [ebp-0C]
 005A7359    mov         ecx,dword ptr [eax]
 005A735B    call        dword ptr [ecx+30]
 005A735E    lea         edx,[ebp-4]
 005A7361    mov         ecx,ebx
 005A7363    call        CopyTIdLongWord
 005A7368    add         ebx,4
 005A736B    mov         eax,dword ptr [ebp-4]
 005A736E    add         eax,ebx
 005A7370    xor         ecx,ecx
 005A7372    mov         edx,3
 005A7377    call        @FillChar
 005A737C    add         ebx,3
 005A737F    mov         eax,dword ptr [ebp-4]
 005A7382    mov         byte ptr [eax+ebx],3A
 005A7386    inc         ebx
 005A7387    mov         eax,dword ptr [esi]
 005A7389    mov         byte ptr [eax+2],0
 005A738D    mov         eax,dword ptr [esi]
 005A738F    mov         byte ptr [eax+3],0
 005A7393    push        ebx
 005A7394    mov         eax,dword ptr [esi]
 005A7396    call        @DynArrayLength
 005A739B    push        eax
 005A739C    lea         ecx,[ebp-4]
 005A739F    mov         eax,dword ptr [esi]
 005A73A1    xor         edx,edx
 005A73A3    call        CopyTIdBytes
 005A73A8    mov         edx,dword ptr [ebp-4]
 005A73AB    mov         eax,edi
 005A73AD    mov         ecx,dword ptr [eax]
 005A73AF    call        dword ptr [ecx+94];TIdStack.CalcCheckSum
 005A73B5    mov         ebx,eax
 005A73B7    mov         eax,ebx
 005A73B9    call        00597344
 005A73BE    mov         edx,esi
 005A73C0    mov         ecx,dword ptr [ebp+10]
 005A73C3    call        CopyTIdShort
 005A73C8    xor         eax,eax
 005A73CA    pop         edx
 005A73CB    pop         ecx
 005A73CC    pop         ecx
 005A73CD    mov         dword ptr fs:[eax],edx
 005A73D0    push        5A73EB
 005A73D5    lea         eax,[ebp-4]
 005A73D8    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005A73DE    call        @DynArrayClear
 005A73E3    ret
>005A73E4    jmp         @HandleFinally
>005A73E9    jmp         005A73D5
 005A73EB    pop         edi
 005A73EC    pop         esi
 005A73ED    pop         ebx
 005A73EE    mov         esp,ebp
 005A73F0    pop         ebp
 005A73F1    ret         0C
end;*}

//005A73F4
procedure TIdStackWindows.ReceiveMsg(ASocket:TIdStackSocketHandle; var VBuffer:TIdBytes; APkt:TIdPacketInfo);
begin
{*
 005A73F4    push        ebp
 005A73F5    mov         ebp,esp
 005A73F7    add         esp,0FFFFFF98
 005A73FA    push        ebx
 005A73FB    push        esi
 005A73FC    push        edi
 005A73FD    xor         ebx,ebx
 005A73FF    mov         dword ptr [ebp-68],ebx
 005A7402    mov         dword ptr [ebp-64],ebx
 005A7405    mov         dword ptr [ebp-60],ebx
 005A7408    mov         dword ptr [ebp-5C],ebx
 005A740B    mov         dword ptr [ebp-4],ebx
 005A740E    mov         dword ptr [ebp-8],ebx
 005A7411    mov         ebx,ecx
 005A7413    mov         dword ptr [ebp-10],edx
 005A7416    mov         dword ptr [ebp-0C],eax
 005A7419    mov         esi,dword ptr [ebp+8]
 005A741C    xor         eax,eax
 005A741E    push        ebp
 005A741F    push        5A769D
 005A7424    push        dword ptr fs:[eax]
 005A7427    mov         dword ptr fs:[eax],esp
 005A742A    mov         eax,[0078D080];^gvar_00784C80
 005A742F    cmp         dword ptr [eax],5
>005A7432    jg          005A7450
 005A7434    mov         eax,[0078D080];^gvar_00784C80
 005A7439    cmp         dword ptr [eax],5
>005A743C    jne         005A761B
 005A7442    mov         eax,[0078D6F0];^gvar_00784C84
 005A7447    cmp         dword ptr [eax],1
>005A744A    jl          005A761B
 005A7450    mov         eax,dword ptr [ebx]
 005A7452    call        @DynArrayLength
 005A7457    call        WSA_CMSG_LEN
 005A745C    call        WSA_CMSG_LEN
 005A7461    mov         edi,eax
 005A7463    push        edi
 005A7464    lea         eax,[ebp-8]
 005A7467    mov         ecx,1
 005A746C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005A7472    call        @DynArraySetLength
 005A7477    add         esp,4
 005A747A    mov         eax,dword ptr [ebx]
 005A747C    call        @DynArrayLength
 005A7481    mov         dword ptr [ebp-1F],eax
 005A7484    mov         eax,dword ptr [ebx]
 005A7486    mov         dword ptr [ebp-1B],eax
 005A7489    lea         eax,[ebp-57]
 005A748C    xor         ecx,ecx
 005A748E    mov         edx,1C
 005A7493    call        @FillChar
 005A7498    lea         eax,[ebp-1F]
 005A749B    mov         dword ptr [ebp-4F],eax
 005A749E    mov         dword ptr [ebp-4B],1
 005A74A5    mov         dword ptr [ebp-47],edi
 005A74A8    mov         eax,dword ptr [ebp-8]
 005A74AB    mov         dword ptr [ebp-43],eax
 005A74AE    lea         eax,[ebp-3B]
 005A74B1    mov         dword ptr [ebp-57],eax
 005A74B4    mov         dword ptr [ebp-53],1C
 005A74BB    push        0
 005A74BD    push        0
 005A74BF    lea         eax,[ebp-14]
 005A74C2    push        eax
 005A74C3    lea         eax,[ebp-57]
 005A74C6    push        eax
 005A74C7    mov         eax,dword ptr [ebp-10]
 005A74CA    push        eax
 005A74CB    mov         eax,[0078CD08]
 005A74D0    mov         eax,dword ptr [eax]
 005A74D2    call        eax
 005A74D4    mov         edx,eax
 005A74D6    mov         eax,dword ptr [ebp-0C]
 005A74D9    call        TIdStack.CheckForSocketError
 005A74DE    mov         eax,esi
 005A74E0    call        TIdPacketInfo.Reset
 005A74E5    movzx       eax,word ptr [ebp-3B]
 005A74E9    sub         ax,2
>005A74ED    je          005A74F7
 005A74EF    sub         ax,15
>005A74F3    je          005A752E
>005A74F5    jmp         005A7562
 005A74F7    lea         ebx,[ebp-3B]
 005A74FA    lea         eax,[ebp-5C]
 005A74FD    push        eax
 005A74FE    lea         edx,[ebx+4]
 005A7501    xor         ecx,ecx
 005A7503    mov         eax,dword ptr [ebp-0C]
 005A7506    call        TIdStackBSDBase.TranslateTInAddrToString
 005A750B    mov         edx,dword ptr [ebp-5C]
 005A750E    lea         eax,[esi+4]
 005A7511    call        @UStrAsg
 005A7516    movzx       eax,word ptr [ebx+2]
 005A751A    push        eax
 005A751B    mov         eax,[0078D0E0]
 005A7520    mov         eax,dword ptr [eax]
 005A7522    call        eax
 005A7524    mov         word ptr [esi+8],ax
 005A7528    mov         byte ptr [esi+10],0
>005A752C    jmp         005A756F
 005A752E    lea         eax,[ebp-60]
 005A7531    push        eax
 005A7532    lea         edx,[ebp-33]
 005A7535    mov         cl,1
 005A7537    mov         eax,dword ptr [ebp-0C]
 005A753A    call        TIdStackBSDBase.TranslateTInAddrToString
 005A753F    mov         edx,dword ptr [ebp-60]
 005A7542    lea         eax,[esi+4]
 005A7545    call        @UStrAsg
 005A754A    movzx       eax,word ptr [ebp-39]
 005A754E    push        eax
 005A754F    mov         eax,[0078D0E0]
 005A7554    mov         eax,dword ptr [eax]
 005A7556    call        eax
 005A7558    mov         word ptr [esi+8],ax
 005A755C    mov         byte ptr [esi+10],1
>005A7560    jmp         005A756F
 005A7562    xor         eax,eax
 005A7564    mov         dword ptr [ebp-14],eax
 005A7567    mov         eax,dword ptr [ebp-0C]
 005A756A    call        TIdStack.IPVersionUnsupported
 005A756F    xor         ebx,ebx
 005A7571    lea         eax,[ebp-57]
 005A7574    mov         edx,ebx
 005A7576    call        WSA_CMSG_NXTHDR
 005A757B    mov         ebx,eax
 005A757D    test        ebx,ebx
>005A757F    je          005A766C
 005A7585    mov         eax,dword ptr [ebx+8]
 005A7588    sub         eax,13
>005A758B    je          005A7594
 005A758D    sub         eax,2
>005A7590    je          005A7609
>005A7592    jmp         005A7571
 005A7594    movzx       eax,word ptr [ebp-3B]
 005A7598    sub         ax,2
>005A759C    je          005A75A6
 005A759E    sub         ax,15
>005A75A2    je          005A75D6
>005A75A4    jmp         005A7571
 005A75A6    mov         eax,ebx
 005A75A8    call        WSA_CMSG_DATA
 005A75AD    mov         edi,eax
 005A75AF    lea         eax,[ebp-64]
 005A75B2    push        eax
 005A75B3    mov         edx,edi
 005A75B5    xor         ecx,ecx
 005A75B7    mov         eax,dword ptr [ebp-0C]
 005A75BA    call        TIdStackBSDBase.TranslateTInAddrToString
 005A75BF    mov         edx,dword ptr [ebp-64]
 005A75C2    lea         eax,[esi+14]
 005A75C5    call        @UStrAsg
 005A75CA    mov         eax,dword ptr [edi+4]
 005A75CD    mov         dword ptr [esi+1C],eax
 005A75D0    mov         byte ptr [esi+20],0
>005A75D4    jmp         005A7571
 005A75D6    mov         eax,ebx
 005A75D8    call        WSA_CMSG_DATA
 005A75DD    mov         edi,eax
 005A75DF    lea         eax,[ebp-68]
 005A75E2    push        eax
 005A75E3    mov         edx,edi
 005A75E5    mov         cl,1
 005A75E7    mov         eax,dword ptr [ebp-0C]
 005A75EA    call        TIdStackBSDBase.TranslateTInAddrToString
 005A75EF    mov         edx,dword ptr [ebp-68]
 005A75F2    lea         eax,[esi+14]
 005A75F5    call        @UStrAsg
 005A75FA    mov         eax,dword ptr [edi+10]
 005A75FD    mov         dword ptr [esi+1C],eax
 005A7600    mov         byte ptr [esi+20],1
>005A7604    jmp         005A7571
 005A7609    mov         eax,ebx
 005A760B    call        WSA_CMSG_DATA
 005A7610    movzx       eax,byte ptr [eax]
 005A7613    mov         byte ptr [esi+21],al
>005A7616    jmp         005A7571
 005A761B    mov         eax,dword ptr [ebx]
 005A761D    call        @DynArrayLength
 005A7622    push        eax
 005A7623    push        0
 005A7625    lea         eax,[ebp-4]
 005A7628    push        eax
 005A7629    lea         eax,[ebp-16]
 005A762C    push        eax
 005A762D    lea         eax,[ebp-17]
 005A7630    push        eax
 005A7631    mov         ecx,ebx
 005A7633    mov         edx,dword ptr [ebp-10]
 005A7636    mov         eax,dword ptr [ebp-0C]
 005A7639    mov         ebx,dword ptr [eax]
 005A763B    call        dword ptr [ebx+0C0]
 005A7641    mov         dword ptr [ebp-14],eax
 005A7644    mov         eax,esi
 005A7646    call        TIdPacketInfo.Reset
 005A764B    lea         eax,[esi+4]
 005A764E    mov         edx,dword ptr [ebp-4]
 005A7651    call        @UStrAsg
 005A7656    movzx       eax,word ptr [ebp-16]
 005A765A    mov         word ptr [esi+8],ax
 005A765E    movzx       eax,byte ptr [ebp-17]
 005A7662    mov         byte ptr [esi+10],al
 005A7665    movzx       eax,byte ptr [ebp-17]
 005A7669    mov         byte ptr [esi+20],al
 005A766C    xor         eax,eax
 005A766E    pop         edx
 005A766F    pop         ecx
 005A7670    pop         ecx
 005A7671    mov         dword ptr fs:[eax],edx
 005A7674    push        5A76A4
 005A7679    lea         eax,[ebp-68]
 005A767C    mov         edx,4
 005A7681    call        @UStrArrayClr
 005A7686    lea         eax,[ebp-8]
 005A7689    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005A768F    call        @DynArrayClear
 005A7694    lea         eax,[ebp-4]
 005A7697    call        @UStrClr
 005A769C    ret
>005A769D    jmp         @HandleFinally
>005A76A2    jmp         005A7679
 005A76A4    mov         eax,dword ptr [ebp-14]
 005A76A7    pop         edi
 005A76A8    pop         esi
 005A76A9    pop         ebx
 005A76AA    mov         esp,ebp
 005A76AC    pop         ebp
 005A76AD    ret         4
*}
end;

//005A76B0
function TIdStackWindows.CheckIPVersionSupport(AIPVersion:TIdIPVersion):Boolean;
begin
{*
 005A76B0    push        ebx
 005A76B1    push        esi
 005A76B2    mov         esi,eax
 005A76B4    push        0
 005A76B6    push        0
 005A76B8    movzx       eax,dl
 005A76BB    mov         edx,dword ptr ds:[78D518]
 005A76C1    mov         edx,dword ptr [edx+eax*4]
 005A76C4    mov         ecx,1
 005A76C9    mov         eax,esi
 005A76CB    mov         ebx,dword ptr [eax]
 005A76CD    call        dword ptr [ebx+0C8]
 005A76D3    cmp         eax,0FFFFFFFF
 005A76D6    setne       bl
 005A76D9    test        bl,bl
>005A76DB    je          005A76E9
 005A76DD    mov         edx,eax
 005A76DF    mov         eax,esi
 005A76E1    mov         ecx,dword ptr [eax]
 005A76E3    call        dword ptr [ecx+0A0]
 005A76E9    mov         eax,ebx
 005A76EB    pop         esi
 005A76EC    pop         ebx
 005A76ED    ret
*}
end;

//005A76F0
function ServeFile(ASocket:TIdStackSocketHandle; const AFileName:UnicodeString):Int64;
begin
{*
 005A76F0    push        ebp
 005A76F1    mov         ebp,esp
 005A76F3    add         esp,0FFFFFFE8
 005A76F6    push        ebx
 005A76F7    push        esi
 005A76F8    mov         ebx,edx
 005A76FA    mov         esi,eax
 005A76FC    mov         dword ptr [ebp-8],0
 005A7703    mov         dword ptr [ebp-4],0
 005A770A    push        0
 005A770C    push        8000080
 005A7711    push        3
 005A7713    push        0
 005A7715    push        1
 005A7717    push        80000000
 005A771C    mov         eax,ebx
 005A771E    call        @UStrToPWChar
 005A7723    push        eax
 005A7724    call        kernel32.CreateFileW
 005A7729    mov         dword ptr [ebp-0C],eax
 005A772C    cmp         dword ptr [ebp-0C],0FFFFFFFF
>005A7730    je          005A77D2
 005A7736    xor         eax,eax
 005A7738    push        ebp
 005A7739    push        5A77CB
 005A773E    push        dword ptr fs:[eax]
 005A7741    mov         dword ptr fs:[eax],esp
 005A7744    push        0
 005A7746    push        0
 005A7748    push        0
 005A774A    push        0
 005A774C    push        0
 005A774E    mov         eax,dword ptr [ebp-0C]
 005A7751    push        eax
 005A7752    push        esi
 005A7753    mov         eax,[0078D38C]
 005A7758    mov         eax,dword ptr [eax]
 005A775A    call        eax
 005A775C    test        eax,eax
>005A775E    je          005A77B4
 005A7760    cmp         dword ptr ds:[789ECC],0
>005A7767    je          005A7782
 005A7769    lea         eax,[ebp-18]
 005A776C    push        eax
 005A776D    mov         eax,dword ptr [ebp-0C]
 005A7770    push        eax
 005A7771    call        dword ptr ds:[789ECC]
 005A7777    test        eax,eax
>005A7779    jne         005A77A8
 005A777B    call        @TryFinallyExit
>005A7780    jmp         005A77D2
 005A7782    lea         eax,[ebp-14]
 005A7785    push        eax
 005A7786    mov         eax,dword ptr [ebp-0C]
 005A7789    push        eax
 005A778A    call        kernel32.GetFileSize
 005A778F    mov         dword ptr [ebp-18],eax
 005A7792    cmp         dword ptr [ebp-18],0FFFFFFFF
>005A7796    jne         005A77A8
 005A7798    call        kernel32.GetLastError
 005A779D    test        eax,eax
>005A779F    je          005A77A8
 005A77A1    call        @TryFinallyExit
>005A77A6    jmp         005A77D2
 005A77A8    mov         eax,dword ptr [ebp-18]
 005A77AB    mov         dword ptr [ebp-8],eax
 005A77AE    mov         eax,dword ptr [ebp-14]
 005A77B1    mov         dword ptr [ebp-4],eax
 005A77B4    xor         eax,eax
 005A77B6    pop         edx
 005A77B7    pop         ecx
 005A77B8    pop         ecx
 005A77B9    mov         dword ptr fs:[eax],edx
 005A77BC    push        5A77D2
 005A77C1    mov         eax,dword ptr [ebp-0C]
 005A77C4    push        eax
 005A77C5    call        kernel32.CloseHandle
 005A77CA    ret
>005A77CB    jmp         @HandleFinally
>005A77D0    jmp         005A77C1
 005A77D2    mov         eax,dword ptr [ebp-8]
 005A77D5    mov         edx,dword ptr [ebp-4]
 005A77D8    pop         esi
 005A77D9    pop         ebx
 005A77DA    mov         esp,ebp
 005A77DC    pop         ebp
 005A77DD    ret
*}
end;

Initialization
//0078159C
{*
 0078159C    sub         dword ptr ds:[8155BC],1
>007815A3    jae         007815E8
 007815A5    mov         byte ptr ds:[789EC8],0;gvar_00789EC8
 007815AC    mov         eax,[0078D164];^GSocketListClass:TIdSocketListClass
 007815B1    mov         edx,dword ptr ds:[5A4608];TIdSocketListWindows
 007815B7    mov         dword ptr [eax],edx
 007815B9    mov         eax,[0078DB58];^gvar_00784C7C
 007815BE    cmp         dword ptr [eax],2
>007815C1    jne         007815E8
 007815C3    push        7815EC
 007815C8    push        781608
 007815CD    call        kernel32.GetModuleHandleW
 007815D2    push        eax
 007815D3    call        GetProcAddress
 007815D8    mov         [00789ECC],eax
 007815DD    mov         eax,[0078D454]
 007815E2    mov         dword ptr [eax],5A76F0;ServeFile:Int64
 007815E8    ret
*}
Finalization
end.