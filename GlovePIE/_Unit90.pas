//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit90;

interface

uses
  SysUtils, Classes;

type
  TIdInitializerComponent = class(TComponent)
  published
    constructor Create;//00599FB0
    constructor Create();//00599F70
  public
    constructor Create; virtual;//v2C//00599FB0
    procedure InitComponent; virtual;//v34//00599FEC
    function GetIsLoading:Boolean;//00599FF0
    function GetIsDesignTime:Boolean;//00599FF8
  end;
  TIdBaseComponent = class(TIdInitializerComponent)
  published
    constructor Create;//0059A000
    function GetIndyVersion:UnicodeString;//0059A038
  end;
  EIdWinsockStubError = class(EIdException)
  published
    constructor Build(AWin32Error:DWORD; const ATitle:UnicodeString; AArgs:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//0059A3C4
  public
    FWin32Error:Cardinal;//f18
    FWin32ErrorMessage:string;//f1C
    FTitle:string;//f20
  end;
  TFDSet = TFDSet = record//size=104
fd_count:Cardinal;//f0
fd_array:?;//f4
end;;
    procedure InitComponent;//00599FEC
    function WinsockHandle:THandle;//0059A264
    function Winsock2Loaded:Boolean;//0059A26C
    procedure InitializeWinSock;//0059A278
    procedure UninitializeWinSock;//0059A384
    function FixupStubEx(hSocket:PtrUInt; const AName:UnicodeString; const AGuid:TGUID):Pointer;//0059A4D0
    function Stub_WSAStartup(const wVersionRequired:Word; var WSData:WSADATA):Integer; stdcall;//0059A56C
    function Stub_WSACleanup:Integer; stdcall;//0059A684
    function Stub_accept(const s:PtrUInt; AAddr:PSOCKADDR; addrlen:PInteger):PtrUInt; stdcall;//0059A790
    function Stub_bind(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer):Integer; stdcall;//0059A8A4
    function Stub_closesocket(const s:PtrUInt):Integer; stdcall;//0059A9B4
    function Stub_connect(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer):Integer; stdcall;//0059AAC8
    function Stub_ioctlsocket(const s:PtrUInt; const cmd:DWORD; var arg:DWORD):Integer; stdcall;//0059ABDC
    function Stub_getpeername(const s:PtrUInt; const name:PSOCKADDR; var namelen:Integer):Integer; stdcall;//0059ACF8
    function Stub_getsockname(const s:PtrUInt; const name:PSOCKADDR; var namelen:Integer):Integer; stdcall;//0059AE14
    function Stub_getsockopt(const s:PtrUInt; const level:Integer; const optname:Integer; optval:PAnsiChar; var optlen:Integer):Integer; stdcall;//0059AF30
    function Stub_htonl(hostlong:DWORD):DWORD; stdcall;//0059B054
    function Stub_htons(hostshort:Word):Word; stdcall;//0059B15C
    function Stub_inet_addr(cp:PAnsiChar):DWORD; stdcall;//0059B264
    function Stub_inet_ntoa(inaddr:in_addr):PAnsiChar; stdcall;//0059B374
    function Stub_listen(const s:PtrUInt; backlog:Integer):Integer; stdcall;//0059B480
    function Stub_ntohl(netlong:DWORD):DWORD; stdcall;//0059B590
    function Stub_ntohs(netshort:Word):Word; stdcall;//0059B698
    function Stub_recv(const s:PtrUInt; var Buf:void ; len:Integer; flags:Integer):Integer; stdcall;//0059B7A0
    function Stub_recvfrom(const s:PtrUInt; var Buf:void ; len:Integer; flags:Integer; from:PSOCKADDR; fromlen:PInteger):Integer; stdcall;//0059B8B4
    function Stub_select(nfds:Integer; readfds:PFDSet; writefds:PFDSet; exceptfds:PFDSet; timeout:PTimeVal):Integer; stdcall;//0059B9D8
    function Stub_send(const s:PtrUInt; const Buf:void ; len:Integer; flags:Integer):Integer; stdcall;//0059BAF4
    function Stub_sendto(const s:PtrUInt; const Buf:void ; const len:Integer; const flags:Integer; const addrto:PSOCKADDR; const tolen:Integer):Integer; stdcall;//0059BC08
    function Stub_setsockopt(const s:PtrUInt; const level:Integer; const optname:Integer; optval:PAnsiChar; const optlen:Integer):Integer; stdcall;//0059BD28
    function Stub_shutdown(const s:PtrUInt; const how:Integer):Integer; stdcall;//0059BE4C
    function Stub_socket(const af:Integer; const istruct:Integer; const protocol:Integer):PtrUInt; stdcall;//0059BF60
    function Stub_gethostbyaddr(AAddr:Pointer; const len:Integer; const addrtype:Integer):PHostEnt; stdcall;//0059C074
    function Stub_gethostbyname(name:PAnsiChar):PHostEnt; stdcall;//0059C194
    function Stub_gethostname(name:PAnsiChar; len:Integer):Integer; stdcall;//0059C2AC
    function Stub_getservbyport(const port:Integer; const proto:PAnsiChar):PServEnt; stdcall;//0059C3C4
    function Stub_getservbyname(const name:PAnsiChar; const proto:PAnsiChar):PServEnt; stdcall;//0059C4E0
    function Stub_getprotobynumber(const proto:Integer):PProtoEnt; stdcall;//0059C5FC
    function Stub_getprotobyname(const name:PAnsiChar):PProtoEnt; stdcall;//0059C71C
    procedure Stub_WSASetLastError(const iError:Integer); stdcall;//0059C838
    function Stub_WSAGetLastError:Integer; stdcall;//0059C950
    function Stub_WSAIsBlocking:BOOL; stdcall;//0059CA64
    function Stub_WSAUnhookBlockingHook:Integer; stdcall;//0059CB74
    function Stub_WSASetBlockingHook(lpBlockFunc:TFarProc):TFarProc; stdcall;//0059CC94
    function Stub_WSACancelBlockingCall:Integer; stdcall;//0059CDB8
    function Stub_WSAAsyncGetServByName(HWindow:HWND; wMsg:DWORD; name:PAnsiChar; proto:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;//0059CED8
    function Stub_WSAAsyncGetServByPort(HWindow:HWND; wMsg:DWORD; port:DWORD; proto:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;//0059D014
    function Stub_WSAAsyncGetProtoByName(HWindow:HWND; wMsg:DWORD; name:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;//0059D150
    function Stub_WSAAsyncGetProtoByNumber(HWindow:HWND; wMsg:DWORD; number:Integer; buf:PAnsiChar; buflen:Integer):THandle; stdcall;//0059D28C
    function Stub_WSAAsyncGetHostByName(HWindow:HWND; wMsg:DWORD; name:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;//0059D3CC
    function Stub_WSAAsyncGetHostByAddr(HWindow:HWND; wMsg:DWORD; AAddr:PAnsiChar; len:Integer; istruct:Integer; buf:PAnsiChar; buflen:Integer):THandle; stdcall;//0059D504
    function Stub_WSACancelAsyncRequest(hAsyncTaskHandle:THandle):Integer; stdcall;//0059D644
    function Stub_WSAAsyncSelect(const s:PtrUInt; HWindow:HWND; wMsg:DWORD; lEvent:LongInt):Integer; stdcall;//0059D76C
    function Stub___WSAFDIsSet(const s:PtrUInt; var FDSet:TFDSet):BOOL; stdcall;//0059D894
    function Stub_WSAAccept(const s:PtrUInt; AAddr:PSOCKADDR; addrlen:PInteger; lpfnCondition:LPCONDITIONPROC; const dwCallbackData:DWORD):PtrUInt; stdcall;//0059D9B0
    function Stub_WSACloseEvent(const hEvent:THandle):WordBool; stdcall;//0059DAD0
    function Stub_WSAConnect(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer; lpCallerData:PWSABuf; lpCalleeData:PWSABuf; lpSQOS:PQOS; lpGQOS:PQOS):Integer; stdcall;//0059DBE8
    function Stub_WSACreateEvent:THandle; stdcall;//0059DD14
    function Stub_WSADuplicateSocketA(const s:PtrUInt; const dwProcessId:DWORD; lpProtocolInfo:PWSAProtocol_InfoA):Integer; stdcall;//0059DE28
    function Stub_WSADuplicateSocketW(const s:PtrUInt; const dwProcessId:DWORD; lpProtocolInfo:PWSAProtocol_InfoW):Integer; stdcall;//0059DF54
    function Stub_WSADuplicateSocket(const s:PtrUInt; const dwProcessId:DWORD; lpProtocolInfo:PWSAProtocol_InfoW):Integer; stdcall;//0059E080
    function Stub_WSAEnumNetworkEvents(const s:PtrUInt; const hEventObject:THandle; lpNetworkEvents:PWSANetworkEvents):Integer; stdcall;//0059E1AC
    function Stub_WSAEnumProtocolsA(lpiProtocols:PInteger; lpProtocolBuffer:PWSAProtocol_InfoA; var lpdwBufferLength:DWORD):Integer; stdcall;//0059E2DC
    function Stub_WSAEnumProtocolsW(lpiProtocols:PInteger; lpProtocolBuffer:PWSAProtocol_InfoW; var lpdwBufferLength:DWORD):Integer; stdcall;//0059E404
    function Stub_WSAEnumProtocols(lpiProtocols:PInteger; lpProtocolBuffer:PWSAProtocol_InfoW; var lpdwBufferLength:DWORD):Integer; stdcall;//0059E52C
    function Stub_WSAEventSelect(const s:PtrUInt; const hEventObject:THandle; lNetworkEvents:LongInt):Integer; stdcall;//0059E654
    function Stub_WSAGetOverlappedResult(const s:PtrUInt; AOverlapped:Pointer; lpcbTransfer:LPDWORD; fWait:BOOL; var lpdwFlags:DWORD):WordBool; stdcall;//0059E778
    function Stub_WSAGetQOSByName(const s:PtrUInt; lpQOSName:PWSABuf; lpQOS:PQOS):WordBool; stdcall;//0059E8B4
    function Stub_WSAHtonl(const s:PtrUInt; hostlong:DWORD; var lpnetlong:DWORD):Integer; stdcall;//0059E9D8
    function Stub_WSAHtons(const s:PtrUInt; hostshort:Word; var lpnetshort:Word):Integer; stdcall;//0059EAF0
    function Stub_WSAIoctl(const s:PtrUInt; dwIoControlCode:DWORD; lpvInBuffer:Pointer; cbInBuffer:DWORD; lpvOutBuffer:Pointer; cbOutBuffer:DWORD; lpcbBytesReturned:LPDWORD; AOverlapped:Pointer; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//0059EC08
    function Stub_WSAJoinLeaf(const s:PtrUInt; name:PSOCKADDR; namelen:Integer; lpCallerData:PWSABuf; lpCalleeData:PWSABuf; lpSQOS:PQOS; lpGQOS:PQOS; dwFlags:DWORD):PtrUInt; stdcall;//0059ED38
    function Stub_WSANtohl(const s:PtrUInt; netlong:DWORD; var lphostlong:DWORD):Integer; stdcall;//0059EE68
    function Stub_WSANtohs(const s:PtrUInt; netshort:Word; var lphostshort:Word):Integer; stdcall;//0059EF80
    function Stub_WSARecv(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesRecvd:DWORD; var lpFlags:DWORD; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//0059F098
    function Stub_WSARecvDisconnect(const s:PtrUInt; lpInboundDisconnectData:PWSABuf):Integer; stdcall;//0059F1BC
    function Stub_WSARecvFrom(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesRecvd:DWORD; var lpFlags:DWORD; lpFrom:PSOCKADDR; lpFromlen:PInteger; AOverlapped:Pointer; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//0059F2E0
    function Stub_WSAResetEvent(hEvent:THandle):WordBool; stdcall;//0059F414
    function Stub_WSASend(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesSent:DWORD; dwFlags:DWORD; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//0059F52C
    function Stub_WSASendDisconnect(const s:PtrUInt; lpOutboundDisconnectData:PWSABuf):Integer; stdcall;//0059F650
    function Stub_WSASendTo(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesSent:DWORD; dwFlags:DWORD; lpTo:PSOCKADDR; iTolen:Integer; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//0059F774
    function Stub_WSASetEvent(hEvent:THandle):WordBool; stdcall;//0059F8A4
    function Stub_WSASocketA(af:Integer; iType:Integer; protocol:Integer; lpProtocolInfo:PWSAProtocol_InfoA; g:DWORD; dwFlags:DWORD):PtrUInt; stdcall;//0059F9B8
    function Stub_WSASocketW(af:Integer; iType:Integer; protocol:Integer; lpProtocolInfo:PWSAProtocol_InfoW; g:DWORD; dwFlags:DWORD):PtrUInt; stdcall;//0059FAE0
    function Stub_WSASocket(af:Integer; iType:Integer; protocol:Integer; lpProtocolInfo:PWSAProtocol_InfoW; g:DWORD; dwFlags:DWORD):PtrUInt; stdcall;//0059FC08
    function Stub_WSAWaitForMultipleEvents(cEvents:DWORD; lphEvents:PWSAEVENT; fWaitAll:LongBool; dwTimeout:DWORD; fAlertable:LongBool):DWORD; stdcall;//0059FD30
    function Stub_WSAAddressToStringA(lpsaAddress:PSOCKADDR; const dwAddressLength:DWORD; const lpProtocolInfo:PWSAProtocol_InfoA; const lpszAddressString:PAnsiChar; var lpdwAddressStringLength:DWORD):Integer; stdcall;//0059FE70
    function Stub_WSAAddressToStringW(lpsaAddress:PSOCKADDR; const dwAddressLength:DWORD; const lpProtocolInfo:PWSAProtocol_InfoW; const lpszAddressString:PWideChar; var lpdwAddressStringLength:DWORD):Integer; stdcall;//0059FFA4
    function Stub_WSAAddressToString(lpsaAddress:PSOCKADDR; const dwAddressLength:DWORD; const lpProtocolInfo:PWSAProtocol_InfoW; const lpszAddressString:PWideChar; var lpdwAddressStringLength:DWORD):Integer; stdcall;//005A00D8
    function Stub_WSAStringToAddressA(const AddressString:PAnsiChar; const AddressFamily:Integer; const lpProtocolInfo:PWSAProtocol_InfoA; var lpAddress:sockaddr_in; var lpAddressLength:Integer):Integer; stdcall;//005A020C
    function Stub_WSAStringToAddressW(const AddressString:PWideChar; const AddressFamily:Integer; const lpProtocolInfo:PWSAProtocol_InfoW; var lpAddress:sockaddr_in; var lpAddressLength:Integer):Integer; stdcall;//005A0340
    function Stub_WSAStringToAddress(const AddressString:PWideChar; const AddressFamily:Integer; const lpProtocolInfo:PWSAProtocol_InfoW; var lpAddress:sockaddr_in; var lpAddressLength:Integer):Integer; stdcall;//005A0474
    function Stub_WSALookupServiceBeginA(var qsRestrictions:WSAQUERYSETA; const dwControlFlags:DWORD; var hLookup:THandle):Integer; stdcall;//005A05A8
    function Stub_WSALookupServiceBeginW(var qsRestrictions:WSAQUERYSETW; const dwControlFlags:DWORD; var hLookup:THandle):Integer; stdcall;//005A06DC
    function Stub_WSALookupServiceBegin(var qsRestrictions:WSAQUERYSETW; const dwControlFlags:DWORD; var hLookup:THandle):Integer; stdcall;//005A0810
    function Stub_WSALookupServiceNextA(const hLookup:THandle; const dwControlFlags:DWORD; var dwBufferLength:DWORD; lpqsResults:PWSAQUERYSETA):Integer; stdcall;//005A0944
    function Stub_WSALookupServiceNextW(const hLookup:THandle; const dwControlFlags:DWORD; var dwBufferLength:DWORD; lpqsResults:PWSAQUERYSETW):Integer; stdcall;//005A0A78
    function Stub_WSALookupServiceNext(const hLookup:THandle; const dwControlFlags:DWORD; var dwBufferLength:DWORD; lpqsResults:PWSAQUERYSETW):Integer; stdcall;//005A0BAC
    function Stub_WSALookupServiceEnd(const hLookup:THandle):Integer; stdcall;//005A0CE0
    function Stub_WSANSPIoctl(const hLookup:THandle; const dwControlCode:DWORD; lpvInBuffer:Pointer; var cbInBuffer:DWORD; lpvOutBuffer:Pointer; var cbOutBuffer:DWORD; var lpcbBytesReturned:DWORD; lpCompletion:PWSACOMPLETION):Integer; stdcall;//005A0E04
    function Stub_WSAInstallServiceClassA(const lpServiceClassInfo:PWSASERVICECLASSINFOA):Integer; stdcall;//005A0F34
    function Stub_WSAInstallServiceClassW(const lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;//005A1060
    function Stub_WSAInstallServiceClass(const lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;//005A118C
    function Stub_WSARemoveServiceClass(const lpServiceClassId:PGUID):Integer; stdcall;//005A12B8
    function Stub_WSAGetServiceClassInfoA(const lpProviderId:PGUID; const lpServiceClassId:PGUID; var lpdwBufSize:DWORD; lpServiceClassInfo:PWSASERVICECLASSINFOA):Integer; stdcall;//005A13E0
    function Stub_WSAGetServiceClassInfoW(const lpProviderId:PGUID; const lpServiceClassId:PGUID; var lpdwBufSize:DWORD; lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;//005A1518
    function Stub_WSAGetServiceClassInfo(const lpProviderId:PGUID; const lpServiceClassId:PGUID; var lpdwBufSize:DWORD; lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;//005A1650
    function Stub_WSAEnumNameSpaceProvidersA(var lpdwBufferLength:DWORD; const lpnspBuffer:PWSANAMESPACE_INFOA):Integer; stdcall;//005A1788
    function Stub_WSAEnumNameSpaceProvidersW(var lpdwBufferLength:DWORD; const lpnspBuffer:PWSANAMESPACE_INFOW):Integer; stdcall;//005A18C0
    function Stub_WSAEnumNameSpaceProviders(var lpdwBufferLength:DWORD; const lpnspBuffer:PWSANAMESPACE_INFOW):Integer; stdcall;//005A19F8
    function Stub_WSAGetServiceClassNameByClassIdA(const lpServiceClassId:PGUID; lpszServiceClassName:PAnsiChar; var lpdwBufferLength:DWORD):Integer; stdcall;//005A1B30
    function Stub_WSAGetServiceClassNameByClassIdW(const lpServiceClassId:PGUID; lpszServiceClassName:PWideChar; var lpdwBufferLength:DWORD):Integer; stdcall;//005A1C78
    function Stub_WSAGetServiceClassNameByClassId(const lpServiceClassId:PGUID; lpszServiceClassName:PWideChar; var lpdwBufferLength:DWORD):Integer; stdcall;//005A1DC0
    function Stub_WSASetServiceA(const lpqsRegInfo:PWSAQUERYSETA; const essoperation:WSAESETSERVICEOP; const dwControlFlags:DWORD):Integer; stdcall;//005A1F08
    function Stub_WSASetServiceW(const lpqsRegInfo:PWSAQUERYSETW; const essoperation:WSAESETSERVICEOP; const dwControlFlags:DWORD):Integer; stdcall;//005A202C
    function Stub_WSASetService(const lpqsRegInfo:PWSAQUERYSETW; const essoperation:WSAESETSERVICEOP; const dwControlFlags:DWORD):Integer; stdcall;//005A2150
    function Stub_WSAProviderConfigChange(var lpNotificationHandle:THandle; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//005A2274
    function Stub_TransmitFile(hSocket:PtrUInt; hFile:THandle; nNumberOfBytesToWrite:DWORD; nNumberOfBytesPerSend:DWORD; lpOverlapped:POverlapped; lpTransmitBuffers:PTransmitFileBuffers; dwReserved:DWORD):BOOL; stdcall;//005A23A8
    function Stub_AcceptEx(sListenSocket:PtrUInt; sAcceptSocket:PtrUInt; lpOutputBuffer:Pointer; dwReceiveDataLength:DWORD; dwLocalAddressLength:DWORD; dwRemoteAddressLength:DWORD; var lpdwBytesReceived:DWORD; lpOverlapped:POverlapped):BOOL; stdcall;//005A2414
    function Stub_WSARecvEx(s:PtrUInt; var buf:void ; len:Integer; var flags:Integer):Integer; stdcall;//005A24C8
    function Stub_ConnectEx(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer; lpSendBuffer:Pointer; dwSendDataLength:DWORD; var lpdwBytesSent:DWORD; lpOverlapped:PWSAOverlapped):BOOL; stdcall;//005A2668
    function Stub_DisconnectEx(const s:PtrUInt; AOverlapped:Pointer; const dwFlags:DWORD; const dwReserved:DWORD):BOOL; stdcall;//005A26CC
    function Stub_WSARecvMsg(const s:PtrUInt; lpMsg:PWSAMSG; var lpNumberOfBytesRecvd:DWORD; AOverlapped:Pointer; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//005A272C
    function Stub_TransmitPackets(s:PtrUInt; lpPacketArray:PTRANSMIT_PACKETS_ELEMENT; nElementCount:DWORD; nSendSize:DWORD; lpOverlapped:PWSAOverlapped; dwFlags:DWORD):BOOL; stdcall;//005A278C
    function Stub_WSASendMsg(const s:PtrUInt; lpMsg:PWSAMSG; const dwFlags:DWORD; var lpNumberOfBytesSent:DWORD; lpOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;//005A27F8
    function Stub_WSAPoll(fdarray:PWSAPOLLFD; const nfds:DWORD; const timeout:Integer):Integer; stdcall;//005A285C
    procedure InitializeStubs;//005A28AC
    function FD_ISSET(ASocket:PtrUInt; var FDSet:TFDSet):Boolean;//005A2D54
    procedure FD_ZERO(var FDSet:TFDSet);//005A2D6C
    function WSA_CMSGHDR_ALIGN(const Alength:PtrUInt):PtrUInt;//005A2D74
    function WSA_CMSG_NXTHDR(const msg:PWSAMSG; const cmsg:PWSACMSGHDR):PWSACMSGHDR;//005A2D84
    function WSA_CMSG_DATA(const cmsg:PWSACMSGHDR):PByte;//005A2DC8
    function WSA_CMSG_LEN(const Alength:PtrUInt):PtrUInt;//005A2DCC

implementation

//00599F70
constructor TIdInitializerComponent.Create();
begin
{*
 00599F70    push        ebx
 00599F71    push        esi
 00599F72    test        dl,dl
>00599F74    je          00599F7E
 00599F76    add         esp,0FFFFFFF0
 00599F79    call        @ClassCreate
 00599F7E    mov         ebx,edx
 00599F80    mov         esi,eax
 00599F82    xor         ecx,ecx
 00599F84    xor         edx,edx
 00599F86    mov         eax,esi
 00599F88    call        TComponent.Create
 00599F8D    mov         eax,esi
 00599F8F    mov         edx,dword ptr [eax]
 00599F91    call        dword ptr [edx+34]
 00599F94    mov         eax,esi
 00599F96    test        bl,bl
>00599F98    je          00599FA9
 00599F9A    call        @AfterConstruction
 00599F9F    pop         dword ptr fs:[0]
 00599FA6    add         esp,0C
 00599FA9    mov         eax,esi
 00599FAB    pop         esi
 00599FAC    pop         ebx
 00599FAD    ret
*}
end;

//00599FB0
constructor TIdInitializerComponent.Create;
begin
{*
 00599FB0    push        ebx
 00599FB1    push        esi
 00599FB2    test        dl,dl
>00599FB4    je          00599FBE
 00599FB6    add         esp,0FFFFFFF0
 00599FB9    call        @ClassCreate
 00599FBE    mov         ebx,edx
 00599FC0    mov         esi,eax
 00599FC2    xor         edx,edx
 00599FC4    mov         eax,esi
 00599FC6    call        TComponent.Create
 00599FCB    mov         eax,esi
 00599FCD    mov         edx,dword ptr [eax]
 00599FCF    call        dword ptr [edx+34]
 00599FD2    mov         eax,esi
 00599FD4    test        bl,bl
>00599FD6    je          00599FE7
 00599FD8    call        @AfterConstruction
 00599FDD    pop         dword ptr fs:[0]
 00599FE4    add         esp,0C
 00599FE7    mov         eax,esi
 00599FE9    pop         esi
 00599FEA    pop         ebx
 00599FEB    ret
*}
end;

//00599FEC
procedure TIdInitializerComponent.InitComponent;
begin
{*
 00599FEC    ret
*}
end;

//00599FF0
function TIdInitializerComponent.GetIsLoading:Boolean;
begin
{*
 00599FF0    test        byte ptr [eax+1C],1
 00599FF4    setne       al
 00599FF7    ret
*}
end;

//00599FF8
function TIdInitializerComponent.GetIsDesignTime:Boolean;
begin
{*
 00599FF8    test        byte ptr [eax+1C],10
 00599FFC    setne       al
 00599FFF    ret
*}
end;

//0059A000
constructor TIdBaseComponent.Create;
begin
{*
 0059A000    push        ebx
 0059A001    push        esi
 0059A002    test        dl,dl
>0059A004    je          0059A00E
 0059A006    add         esp,0FFFFFFF0
 0059A009    call        @ClassCreate
 0059A00E    mov         ebx,edx
 0059A010    mov         esi,eax
 0059A012    xor         edx,edx
 0059A014    mov         eax,esi
 0059A016    call        TIdInitializerComponent.Create
 0059A01B    mov         eax,esi
 0059A01D    test        bl,bl
>0059A01F    je          0059A030
 0059A021    call        @AfterConstruction
 0059A026    pop         dword ptr fs:[0]
 0059A02D    add         esp,0C
 0059A030    mov         eax,esi
 0059A032    pop         esi
 0059A033    pop         ebx
 0059A034    ret
*}
end;

//0059A038
function TIdBaseComponent.GetIndyVersion:UnicodeString;
begin
{*
 0059A038    push        ebx
 0059A039    mov         ebx,edx
 0059A03B    mov         eax,ebx
 0059A03D    mov         edx,59A058;'10.5.7'
 0059A042    call        @UStrAsg
 0059A047    pop         ebx
 0059A048    ret
*}
end;

//0059A264
function WinsockHandle:THandle;
begin
{*
 0059A264    mov         eax,[00789E68]
 0059A269    ret
*}
end;

//0059A26C
function Winsock2Loaded:Boolean;
begin
{*
 0059A26C    cmp         dword ptr ds:[789E68],0
 0059A273    setne       al
 0059A276    ret
*}
end;

//0059A278
procedure InitializeWinSock;
begin
{*
 0059A278    push        ebp
 0059A279    mov         ebp,esp
 0059A27B    add         esp,0FFFFFE64
 0059A281    push        ebx
 0059A282    xor         eax,eax
 0059A284    mov         dword ptr [ebp-194],eax
 0059A28A    xor         eax,eax
 0059A28C    push        ebp
 0059A28D    push        59A353
 0059A292    push        dword ptr fs:[eax]
 0059A295    mov         dword ptr fs:[eax],esp
 0059A298    cmp         dword ptr ds:[789E68],0
>0059A29F    jne         0059A33A
 0059A2A5    mov         edx,8000
 0059A2AA    mov         eax,59A36C;'WS2_32.DLL'
 0059A2AF    call        SafeLoadLibrary
 0059A2B4    mov         [00789E68],eax
 0059A2B9    cmp         dword ptr ds:[789E68],0
>0059A2C0    je          0059A2EE
 0059A2C2    lea         eax,[ebp-18E]
 0059A2C8    push        eax
 0059A2C9    push        202
 0059A2CE    call        dword ptr ds:[789C88]
 0059A2D4    mov         ebx,eax
 0059A2D6    test        ebx,ebx
>0059A2D8    je          0059A33A
 0059A2DA    mov         eax,[00789E68]
 0059A2DF    push        eax
 0059A2E0    call        kernel32.FreeLibrary
 0059A2E5    xor         eax,eax
 0059A2E7    mov         [00789E68],eax
>0059A2EC    jmp         0059A2F5
 0059A2EE    call        kernel32.GetLastError
 0059A2F3    mov         ebx,eax
 0059A2F5    lea         edx,[ebp-194]
 0059A2FB    mov         eax,[0078D538];^SResString603:TResStringRec
 0059A300    call        LoadResString
 0059A305    mov         eax,dword ptr [ebp-194]
 0059A30B    push        eax
 0059A30C    mov         eax,59A36C;'WS2_32.DLL'
 0059A311    mov         dword ptr [ebp-19C],eax
 0059A317    mov         byte ptr [ebp-198],11
 0059A31E    lea         eax,[ebp-19C]
 0059A324    push        eax
 0059A325    push        0
 0059A327    mov         ecx,ebx
 0059A329    mov         dl,1
 0059A32B    mov         eax,[0059A068];EIdWinsockStubError
 0059A330    call        EIdWinsockStubError.Build
 0059A335    call        @RaiseExcept
 0059A33A    xor         eax,eax
 0059A33C    pop         edx
 0059A33D    pop         ecx
 0059A33E    pop         ecx
 0059A33F    mov         dword ptr fs:[eax],edx
 0059A342    push        59A35A
 0059A347    lea         eax,[ebp-194]
 0059A34D    call        @UStrClr
 0059A352    ret
>0059A353    jmp         @HandleFinally
>0059A358    jmp         0059A347
 0059A35A    pop         ebx
 0059A35B    mov         esp,ebp
 0059A35D    pop         ebp
 0059A35E    ret
*}
end;

//0059A384
procedure UninitializeWinSock;
begin
{*
 0059A384    cmp         dword ptr ds:[789E6C],0
>0059A38B    je          0059A39F
 0059A38D    mov         eax,[00789E6C]
 0059A392    push        eax
 0059A393    call        kernel32.FreeLibrary
 0059A398    xor         eax,eax
 0059A39A    mov         [00789E6C],eax
 0059A39F    cmp         dword ptr ds:[789E68],0
>0059A3A6    je          0059A3C0
 0059A3A8    call        dword ptr ds:[789C8C]
 0059A3AE    mov         eax,[00789E68]
 0059A3B3    push        eax
 0059A3B4    call        kernel32.FreeLibrary
 0059A3B9    xor         eax,eax
 0059A3BB    mov         [00789E68],eax
 0059A3C0    ret
*}
end;

//0059A3C4
constructor EIdWinsockStubError.Build(AWin32Error:DWORD; const ATitle:UnicodeString; AArgs:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 0059A3C4    push        ebp
 0059A3C5    mov         ebp,esp
 0059A3C7    push        0
 0059A3C9    push        0
 0059A3CB    push        0
 0059A3CD    push        ebx
 0059A3CE    push        esi
 0059A3CF    push        edi
 0059A3D0    test        dl,dl
>0059A3D2    je          0059A3DC
 0059A3D4    add         esp,0FFFFFFF0
 0059A3D7    call        @ClassCreate
 0059A3DC    mov         ebx,dword ptr [ebp+0C]
 0059A3DF    mov         esi,dword ptr [ebp+8]
 0059A3E2    add         esi,esi
 0059A3E4    inc         esi
 0059A3E5    test        esi,esi
>0059A3E7    js          0059A3F0
 0059A3E9    mov         edi,dword ptr [ebx+esi*4]
 0059A3EC    dec         esi
 0059A3ED    push        edi
>0059A3EE    jns         0059A3E9
 0059A3F0    mov         dword ptr [ebp+0C],esp
 0059A3F3    mov         esi,ecx
 0059A3F5    mov         ebx,edx
 0059A3F7    mov         edi,eax
 0059A3F9    xor         eax,eax
 0059A3FB    push        ebp
 0059A3FC    push        59A48D
 0059A401    push        dword ptr fs:[eax]
 0059A404    mov         dword ptr fs:[eax],esp
 0059A407    lea         eax,[ebp-4]
 0059A40A    push        eax
 0059A40B    mov         edx,dword ptr [ebp+0C]
 0059A40E    mov         ecx,dword ptr [ebp+8]
 0059A411    mov         eax,dword ptr [ebp+10]
 0059A414    call        IndyFormat
 0059A419    mov         edx,dword ptr [ebp-4]
 0059A41C    lea         eax,[edi+20]
 0059A41F    call        @UStrAsg
 0059A424    mov         dword ptr [edi+18],esi
 0059A427    test        esi,esi
>0059A429    jne         0059A439
 0059A42B    mov         ecx,dword ptr [edi+20]
 0059A42E    xor         edx,edx
 0059A430    mov         eax,edi
 0059A432    call        EIdException.Create
>0059A437    jmp         0059A472
 0059A439    lea         edx,[ebp-8]
 0059A43C    mov         eax,esi
 0059A43E    call        SysErrorMessage
 0059A443    mov         edx,dword ptr [ebp-8]
 0059A446    lea         eax,[edi+1C]
 0059A449    call        @UStrAsg
 0059A44E    push        dword ptr [edi+20]
 0059A451    push        59A4C8;': '
 0059A456    push        dword ptr [edi+1C]
 0059A459    lea         eax,[ebp-0C]
 0059A45C    mov         edx,3
 0059A461    call        @UStrCatN
 0059A466    mov         ecx,dword ptr [ebp-0C]
 0059A469    xor         edx,edx
 0059A46B    mov         eax,edi
 0059A46D    call        EIdException.Create
 0059A472    xor         eax,eax
 0059A474    pop         edx
 0059A475    pop         ecx
 0059A476    pop         ecx
 0059A477    mov         dword ptr fs:[eax],edx
 0059A47A    push        59A494
 0059A47F    lea         eax,[ebp-0C]
 0059A482    mov         edx,3
 0059A487    call        @UStrArrayClr
 0059A48C    ret
>0059A48D    jmp         @HandleFinally
>0059A492    jmp         0059A47F
 0059A494    mov         eax,edi
 0059A496    test        bl,bl
>0059A498    je          0059A4A8
 0059A49A    call        @AfterConstruction
 0059A49F    mov         eax,dword ptr [ebp-28]
 0059A4A2    mov         fs:[00000000],eax
 0059A4A8    mov         eax,edi
 0059A4AA    mov         edi,dword ptr [ebp-18]
 0059A4AD    mov         esi,dword ptr [ebp-14]
 0059A4B0    mov         ebx,dword ptr [ebp-10]
 0059A4B3    mov         esp,ebp
 0059A4B5    pop         ebp
 0059A4B6    ret         0C
*}
end;

//0059A4D0
function FixupStubEx(hSocket:PtrUInt; const AName:UnicodeString; const AGuid:TGUID):Pointer;
begin
{*
 0059A4D0    push        ebp
 0059A4D1    mov         ebp,esp
 0059A4D3    add         esp,0FFFFFFEC
 0059A4D6    push        ebx
 0059A4D7    xor         ebx,ebx
 0059A4D9    mov         dword ptr [ebp-0C],ebx
 0059A4DC    mov         ebx,edx
 0059A4DE    xor         edx,edx
 0059A4E0    push        ebp
 0059A4E1    push        59A55A
 0059A4E6    push        dword ptr fs:[edx]
 0059A4E9    mov         dword ptr fs:[edx],esp
 0059A4EC    push        0
 0059A4EE    push        0
 0059A4F0    lea         edx,[ebp-8]
 0059A4F3    push        edx
 0059A4F4    push        4
 0059A4F6    lea         edx,[ebp-4]
 0059A4F9    push        edx
 0059A4FA    push        10
 0059A4FC    push        ecx
 0059A4FD    push        0C8000006
 0059A502    push        eax
 0059A503    call        dword ptr ds:[789DB4]
 0059A509    test        eax,eax
>0059A50B    je          0059A544
 0059A50D    lea         edx,[ebp-0C]
 0059A510    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A515    call        LoadResString
 0059A51A    mov         eax,dword ptr [ebp-0C]
 0059A51D    push        eax
 0059A51E    mov         dword ptr [ebp-14],ebx
 0059A521    mov         byte ptr [ebp-10],11
 0059A525    lea         eax,[ebp-14]
 0059A528    push        eax
 0059A529    push        0
 0059A52B    call        dword ptr ds:[789D0C]
 0059A531    mov         ecx,eax
 0059A533    mov         dl,1
 0059A535    mov         eax,[0059A068];EIdWinsockStubError
 0059A53A    call        EIdWinsockStubError.Build
 0059A53F    call        @RaiseExcept
 0059A544    xor         eax,eax
 0059A546    pop         edx
 0059A547    pop         ecx
 0059A548    pop         ecx
 0059A549    mov         dword ptr fs:[eax],edx
 0059A54C    push        59A561
 0059A551    lea         eax,[ebp-0C]
 0059A554    call        @UStrClr
 0059A559    ret
>0059A55A    jmp         @HandleFinally
>0059A55F    jmp         0059A551
 0059A561    mov         eax,dword ptr [ebp-4]
 0059A564    pop         ebx
 0059A565    mov         esp,ebp
 0059A567    pop         ebp
 0059A568    ret
*}
end;

//0059A56C
function Stub_WSAStartup(const wVersionRequired:Word; var WSData:WSADATA):Integer; stdcall;
begin
{*
 0059A56C    push        ebp
 0059A56D    mov         ebp,esp
 0059A56F    add         esp,0FFFFFFF0
 0059A572    push        ebx
 0059A573    xor         eax,eax
 0059A575    mov         dword ptr [ebp-10],eax
 0059A578    mov         dword ptr [ebp-4],eax
 0059A57B    xor         eax,eax
 0059A57D    push        ebp
 0059A57E    push        59A64E
 0059A583    push        dword ptr fs:[eax]
 0059A586    mov         dword ptr fs:[eax],esp
 0059A589    mov         ebx,dword ptr ds:[789E68]
 0059A58F    test        ebx,ebx
>0059A591    jne         0059A5CC
 0059A593    lea         edx,[ebp-4]
 0059A596    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A59B    call        LoadResString
 0059A5A0    mov         eax,dword ptr [ebp-4]
 0059A5A3    push        eax
 0059A5A4    mov         eax,59A66C;'WSAStartup'
 0059A5A9    mov         dword ptr [ebp-0C],eax
 0059A5AC    mov         byte ptr [ebp-8],11
 0059A5B0    lea         eax,[ebp-0C]
 0059A5B3    push        eax
 0059A5B4    push        0
 0059A5B6    mov         ecx,276D
 0059A5BB    mov         dl,1
 0059A5BD    mov         eax,[0059A068];EIdWinsockStubError
 0059A5C2    call        EIdWinsockStubError.Build
 0059A5C7    call        @RaiseExcept
 0059A5CC    mov         eax,59A66C;'WSAStartup'
 0059A5D1    call        @UStrToPWChar
 0059A5D6    push        eax
 0059A5D7    push        ebx
 0059A5D8    call        GetProcAddress
 0059A5DD    test        eax,eax
>0059A5DF    jne         0059A61A
 0059A5E1    lea         edx,[ebp-10]
 0059A5E4    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A5E9    call        LoadResString
 0059A5EE    mov         eax,dword ptr [ebp-10]
 0059A5F1    push        eax
 0059A5F2    mov         eax,59A66C;'WSAStartup'
 0059A5F7    mov         dword ptr [ebp-0C],eax
 0059A5FA    mov         byte ptr [ebp-8],11
 0059A5FE    lea         eax,[ebp-0C]
 0059A601    push        eax
 0059A602    push        0
 0059A604    mov         ecx,2726
 0059A609    mov         dl,1
 0059A60B    mov         eax,[0059A068];EIdWinsockStubError
 0059A610    call        EIdWinsockStubError.Build
 0059A615    call        @RaiseExcept
 0059A61A    mov         [00789C88],eax
 0059A61F    mov         eax,dword ptr [ebp+0C]
 0059A622    push        eax
 0059A623    movzx       eax,word ptr [ebp+8]
 0059A627    push        eax
 0059A628    call        dword ptr ds:[789C88]
 0059A62E    mov         ebx,eax
 0059A630    xor         eax,eax
 0059A632    pop         edx
 0059A633    pop         ecx
 0059A634    pop         ecx
 0059A635    mov         dword ptr fs:[eax],edx
 0059A638    push        59A655
 0059A63D    lea         eax,[ebp-10]
 0059A640    call        @UStrClr
 0059A645    lea         eax,[ebp-4]
 0059A648    call        @UStrClr
 0059A64D    ret
>0059A64E    jmp         @HandleFinally
>0059A653    jmp         0059A63D
 0059A655    mov         eax,ebx
 0059A657    pop         ebx
 0059A658    mov         esp,ebp
 0059A65A    pop         ebp
 0059A65B    ret         8
*}
end;

//0059A684
function Stub_WSACleanup:Integer; stdcall;
begin
{*
 0059A684    push        ebp
 0059A685    mov         ebp,esp
 0059A687    add         esp,0FFFFFFF0
 0059A68A    push        ebx
 0059A68B    xor         eax,eax
 0059A68D    mov         dword ptr [ebp-10],eax
 0059A690    mov         dword ptr [ebp-4],eax
 0059A693    xor         eax,eax
 0059A695    push        ebp
 0059A696    push        59A75D
 0059A69B    push        dword ptr fs:[eax]
 0059A69E    mov         dword ptr fs:[eax],esp
 0059A6A1    mov         ebx,dword ptr ds:[789E68]
 0059A6A7    test        ebx,ebx
>0059A6A9    jne         0059A6E4
 0059A6AB    lea         edx,[ebp-4]
 0059A6AE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A6B3    call        LoadResString
 0059A6B8    mov         eax,dword ptr [ebp-4]
 0059A6BB    push        eax
 0059A6BC    mov         eax,59A778;'WSACleanup'
 0059A6C1    mov         dword ptr [ebp-0C],eax
 0059A6C4    mov         byte ptr [ebp-8],11
 0059A6C8    lea         eax,[ebp-0C]
 0059A6CB    push        eax
 0059A6CC    push        0
 0059A6CE    mov         ecx,276D
 0059A6D3    mov         dl,1
 0059A6D5    mov         eax,[0059A068];EIdWinsockStubError
 0059A6DA    call        EIdWinsockStubError.Build
 0059A6DF    call        @RaiseExcept
 0059A6E4    mov         eax,59A778;'WSACleanup'
 0059A6E9    call        @UStrToPWChar
 0059A6EE    push        eax
 0059A6EF    push        ebx
 0059A6F0    call        GetProcAddress
 0059A6F5    test        eax,eax
>0059A6F7    jne         0059A732
 0059A6F9    lea         edx,[ebp-10]
 0059A6FC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A701    call        LoadResString
 0059A706    mov         eax,dword ptr [ebp-10]
 0059A709    push        eax
 0059A70A    mov         eax,59A778;'WSACleanup'
 0059A70F    mov         dword ptr [ebp-0C],eax
 0059A712    mov         byte ptr [ebp-8],11
 0059A716    lea         eax,[ebp-0C]
 0059A719    push        eax
 0059A71A    push        0
 0059A71C    mov         ecx,2726
 0059A721    mov         dl,1
 0059A723    mov         eax,[0059A068];EIdWinsockStubError
 0059A728    call        EIdWinsockStubError.Build
 0059A72D    call        @RaiseExcept
 0059A732    mov         [00789C8C],eax
 0059A737    call        dword ptr ds:[789C8C]
 0059A73D    mov         ebx,eax
 0059A73F    xor         eax,eax
 0059A741    pop         edx
 0059A742    pop         ecx
 0059A743    pop         ecx
 0059A744    mov         dword ptr fs:[eax],edx
 0059A747    push        59A764
 0059A74C    lea         eax,[ebp-10]
 0059A74F    call        @UStrClr
 0059A754    lea         eax,[ebp-4]
 0059A757    call        @UStrClr
 0059A75C    ret
>0059A75D    jmp         @HandleFinally
>0059A762    jmp         0059A74C
 0059A764    mov         eax,ebx
 0059A766    pop         ebx
 0059A767    mov         esp,ebp
 0059A769    pop         ebp
 0059A76A    ret
*}
end;

//0059A790
function Stub_accept(const s:PtrUInt; AAddr:PSOCKADDR; addrlen:PInteger):PtrUInt; stdcall;
begin
{*
 0059A790    push        ebp
 0059A791    mov         ebp,esp
 0059A793    add         esp,0FFFFFFF0
 0059A796    push        ebx
 0059A797    xor         eax,eax
 0059A799    mov         dword ptr [ebp-10],eax
 0059A79C    mov         dword ptr [ebp-4],eax
 0059A79F    xor         eax,eax
 0059A7A1    push        ebp
 0059A7A2    push        59A875
 0059A7A7    push        dword ptr fs:[eax]
 0059A7AA    mov         dword ptr fs:[eax],esp
 0059A7AD    mov         ebx,dword ptr ds:[789E68]
 0059A7B3    test        ebx,ebx
>0059A7B5    jne         0059A7F0
 0059A7B7    lea         edx,[ebp-4]
 0059A7BA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A7BF    call        LoadResString
 0059A7C4    mov         eax,dword ptr [ebp-4]
 0059A7C7    push        eax
 0059A7C8    mov         eax,59A894;'accept'
 0059A7CD    mov         dword ptr [ebp-0C],eax
 0059A7D0    mov         byte ptr [ebp-8],11
 0059A7D4    lea         eax,[ebp-0C]
 0059A7D7    push        eax
 0059A7D8    push        0
 0059A7DA    mov         ecx,276D
 0059A7DF    mov         dl,1
 0059A7E1    mov         eax,[0059A068];EIdWinsockStubError
 0059A7E6    call        EIdWinsockStubError.Build
 0059A7EB    call        @RaiseExcept
 0059A7F0    mov         eax,59A894;'accept'
 0059A7F5    call        @UStrToPWChar
 0059A7FA    push        eax
 0059A7FB    push        ebx
 0059A7FC    call        GetProcAddress
 0059A801    test        eax,eax
>0059A803    jne         0059A83E
 0059A805    lea         edx,[ebp-10]
 0059A808    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A80D    call        LoadResString
 0059A812    mov         eax,dword ptr [ebp-10]
 0059A815    push        eax
 0059A816    mov         eax,59A894;'accept'
 0059A81B    mov         dword ptr [ebp-0C],eax
 0059A81E    mov         byte ptr [ebp-8],11
 0059A822    lea         eax,[ebp-0C]
 0059A825    push        eax
 0059A826    push        0
 0059A828    mov         ecx,2726
 0059A82D    mov         dl,1
 0059A82F    mov         eax,[0059A068];EIdWinsockStubError
 0059A834    call        EIdWinsockStubError.Build
 0059A839    call        @RaiseExcept
 0059A83E    mov         [00789C90],eax
 0059A843    mov         eax,dword ptr [ebp+10]
 0059A846    push        eax
 0059A847    mov         eax,dword ptr [ebp+0C]
 0059A84A    push        eax
 0059A84B    mov         eax,dword ptr [ebp+8]
 0059A84E    push        eax
 0059A84F    call        dword ptr ds:[789C90]
 0059A855    mov         ebx,eax
 0059A857    xor         eax,eax
 0059A859    pop         edx
 0059A85A    pop         ecx
 0059A85B    pop         ecx
 0059A85C    mov         dword ptr fs:[eax],edx
 0059A85F    push        59A87C
 0059A864    lea         eax,[ebp-10]
 0059A867    call        @UStrClr
 0059A86C    lea         eax,[ebp-4]
 0059A86F    call        @UStrClr
 0059A874    ret
>0059A875    jmp         @HandleFinally
>0059A87A    jmp         0059A864
 0059A87C    mov         eax,ebx
 0059A87E    pop         ebx
 0059A87F    mov         esp,ebp
 0059A881    pop         ebp
 0059A882    ret         0C
*}
end;

//0059A8A4
function Stub_bind(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer):Integer; stdcall;
begin
{*
 0059A8A4    push        ebp
 0059A8A5    mov         ebp,esp
 0059A8A7    add         esp,0FFFFFFF0
 0059A8AA    push        ebx
 0059A8AB    xor         eax,eax
 0059A8AD    mov         dword ptr [ebp-10],eax
 0059A8B0    mov         dword ptr [ebp-4],eax
 0059A8B3    xor         eax,eax
 0059A8B5    push        ebp
 0059A8B6    push        59A989
 0059A8BB    push        dword ptr fs:[eax]
 0059A8BE    mov         dword ptr fs:[eax],esp
 0059A8C1    mov         ebx,dword ptr ds:[789E68]
 0059A8C7    test        ebx,ebx
>0059A8C9    jne         0059A904
 0059A8CB    lea         edx,[ebp-4]
 0059A8CE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A8D3    call        LoadResString
 0059A8D8    mov         eax,dword ptr [ebp-4]
 0059A8DB    push        eax
 0059A8DC    mov         eax,59A9A8;'bind'
 0059A8E1    mov         dword ptr [ebp-0C],eax
 0059A8E4    mov         byte ptr [ebp-8],11
 0059A8E8    lea         eax,[ebp-0C]
 0059A8EB    push        eax
 0059A8EC    push        0
 0059A8EE    mov         ecx,276D
 0059A8F3    mov         dl,1
 0059A8F5    mov         eax,[0059A068];EIdWinsockStubError
 0059A8FA    call        EIdWinsockStubError.Build
 0059A8FF    call        @RaiseExcept
 0059A904    mov         eax,59A9A8;'bind'
 0059A909    call        @UStrToPWChar
 0059A90E    push        eax
 0059A90F    push        ebx
 0059A910    call        GetProcAddress
 0059A915    test        eax,eax
>0059A917    jne         0059A952
 0059A919    lea         edx,[ebp-10]
 0059A91C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A921    call        LoadResString
 0059A926    mov         eax,dword ptr [ebp-10]
 0059A929    push        eax
 0059A92A    mov         eax,59A9A8;'bind'
 0059A92F    mov         dword ptr [ebp-0C],eax
 0059A932    mov         byte ptr [ebp-8],11
 0059A936    lea         eax,[ebp-0C]
 0059A939    push        eax
 0059A93A    push        0
 0059A93C    mov         ecx,2726
 0059A941    mov         dl,1
 0059A943    mov         eax,[0059A068];EIdWinsockStubError
 0059A948    call        EIdWinsockStubError.Build
 0059A94D    call        @RaiseExcept
 0059A952    mov         [00789C94],eax
 0059A957    mov         eax,dword ptr [ebp+10]
 0059A95A    push        eax
 0059A95B    mov         eax,dword ptr [ebp+0C]
 0059A95E    push        eax
 0059A95F    mov         eax,dword ptr [ebp+8]
 0059A962    push        eax
 0059A963    call        dword ptr ds:[789C94]
 0059A969    mov         ebx,eax
 0059A96B    xor         eax,eax
 0059A96D    pop         edx
 0059A96E    pop         ecx
 0059A96F    pop         ecx
 0059A970    mov         dword ptr fs:[eax],edx
 0059A973    push        59A990
 0059A978    lea         eax,[ebp-10]
 0059A97B    call        @UStrClr
 0059A980    lea         eax,[ebp-4]
 0059A983    call        @UStrClr
 0059A988    ret
>0059A989    jmp         @HandleFinally
>0059A98E    jmp         0059A978
 0059A990    mov         eax,ebx
 0059A992    pop         ebx
 0059A993    mov         esp,ebp
 0059A995    pop         ebp
 0059A996    ret         0C
*}
end;

//0059A9B4
function Stub_closesocket(const s:PtrUInt):Integer; stdcall;
begin
{*
 0059A9B4    push        ebp
 0059A9B5    mov         ebp,esp
 0059A9B7    add         esp,0FFFFFFF0
 0059A9BA    push        ebx
 0059A9BB    xor         eax,eax
 0059A9BD    mov         dword ptr [ebp-10],eax
 0059A9C0    mov         dword ptr [ebp-4],eax
 0059A9C3    xor         eax,eax
 0059A9C5    push        ebp
 0059A9C6    push        59AA91
 0059A9CB    push        dword ptr fs:[eax]
 0059A9CE    mov         dword ptr fs:[eax],esp
 0059A9D1    mov         ebx,dword ptr ds:[789E68]
 0059A9D7    test        ebx,ebx
>0059A9D9    jne         0059AA14
 0059A9DB    lea         edx,[ebp-4]
 0059A9DE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059A9E3    call        LoadResString
 0059A9E8    mov         eax,dword ptr [ebp-4]
 0059A9EB    push        eax
 0059A9EC    mov         eax,59AAB0;'closesocket'
 0059A9F1    mov         dword ptr [ebp-0C],eax
 0059A9F4    mov         byte ptr [ebp-8],11
 0059A9F8    lea         eax,[ebp-0C]
 0059A9FB    push        eax
 0059A9FC    push        0
 0059A9FE    mov         ecx,276D
 0059AA03    mov         dl,1
 0059AA05    mov         eax,[0059A068];EIdWinsockStubError
 0059AA0A    call        EIdWinsockStubError.Build
 0059AA0F    call        @RaiseExcept
 0059AA14    mov         eax,59AAB0;'closesocket'
 0059AA19    call        @UStrToPWChar
 0059AA1E    push        eax
 0059AA1F    push        ebx
 0059AA20    call        GetProcAddress
 0059AA25    test        eax,eax
>0059AA27    jne         0059AA62
 0059AA29    lea         edx,[ebp-10]
 0059AA2C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AA31    call        LoadResString
 0059AA36    mov         eax,dword ptr [ebp-10]
 0059AA39    push        eax
 0059AA3A    mov         eax,59AAB0;'closesocket'
 0059AA3F    mov         dword ptr [ebp-0C],eax
 0059AA42    mov         byte ptr [ebp-8],11
 0059AA46    lea         eax,[ebp-0C]
 0059AA49    push        eax
 0059AA4A    push        0
 0059AA4C    mov         ecx,2726
 0059AA51    mov         dl,1
 0059AA53    mov         eax,[0059A068];EIdWinsockStubError
 0059AA58    call        EIdWinsockStubError.Build
 0059AA5D    call        @RaiseExcept
 0059AA62    mov         [00789C98],eax
 0059AA67    mov         eax,dword ptr [ebp+8]
 0059AA6A    push        eax
 0059AA6B    call        dword ptr ds:[789C98]
 0059AA71    mov         ebx,eax
 0059AA73    xor         eax,eax
 0059AA75    pop         edx
 0059AA76    pop         ecx
 0059AA77    pop         ecx
 0059AA78    mov         dword ptr fs:[eax],edx
 0059AA7B    push        59AA98
 0059AA80    lea         eax,[ebp-10]
 0059AA83    call        @UStrClr
 0059AA88    lea         eax,[ebp-4]
 0059AA8B    call        @UStrClr
 0059AA90    ret
>0059AA91    jmp         @HandleFinally
>0059AA96    jmp         0059AA80
 0059AA98    mov         eax,ebx
 0059AA9A    pop         ebx
 0059AA9B    mov         esp,ebp
 0059AA9D    pop         ebp
 0059AA9E    ret         4
*}
end;

//0059AAC8
function Stub_connect(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer):Integer; stdcall;
begin
{*
 0059AAC8    push        ebp
 0059AAC9    mov         ebp,esp
 0059AACB    add         esp,0FFFFFFF0
 0059AACE    push        ebx
 0059AACF    xor         eax,eax
 0059AAD1    mov         dword ptr [ebp-10],eax
 0059AAD4    mov         dword ptr [ebp-4],eax
 0059AAD7    xor         eax,eax
 0059AAD9    push        ebp
 0059AADA    push        59ABAD
 0059AADF    push        dword ptr fs:[eax]
 0059AAE2    mov         dword ptr fs:[eax],esp
 0059AAE5    mov         ebx,dword ptr ds:[789E68]
 0059AAEB    test        ebx,ebx
>0059AAED    jne         0059AB28
 0059AAEF    lea         edx,[ebp-4]
 0059AAF2    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AAF7    call        LoadResString
 0059AAFC    mov         eax,dword ptr [ebp-4]
 0059AAFF    push        eax
 0059AB00    mov         eax,59ABCC;'connect'
 0059AB05    mov         dword ptr [ebp-0C],eax
 0059AB08    mov         byte ptr [ebp-8],11
 0059AB0C    lea         eax,[ebp-0C]
 0059AB0F    push        eax
 0059AB10    push        0
 0059AB12    mov         ecx,276D
 0059AB17    mov         dl,1
 0059AB19    mov         eax,[0059A068];EIdWinsockStubError
 0059AB1E    call        EIdWinsockStubError.Build
 0059AB23    call        @RaiseExcept
 0059AB28    mov         eax,59ABCC;'connect'
 0059AB2D    call        @UStrToPWChar
 0059AB32    push        eax
 0059AB33    push        ebx
 0059AB34    call        GetProcAddress
 0059AB39    test        eax,eax
>0059AB3B    jne         0059AB76
 0059AB3D    lea         edx,[ebp-10]
 0059AB40    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AB45    call        LoadResString
 0059AB4A    mov         eax,dword ptr [ebp-10]
 0059AB4D    push        eax
 0059AB4E    mov         eax,59ABCC;'connect'
 0059AB53    mov         dword ptr [ebp-0C],eax
 0059AB56    mov         byte ptr [ebp-8],11
 0059AB5A    lea         eax,[ebp-0C]
 0059AB5D    push        eax
 0059AB5E    push        0
 0059AB60    mov         ecx,2726
 0059AB65    mov         dl,1
 0059AB67    mov         eax,[0059A068];EIdWinsockStubError
 0059AB6C    call        EIdWinsockStubError.Build
 0059AB71    call        @RaiseExcept
 0059AB76    mov         [00789C9C],eax
 0059AB7B    mov         eax,dword ptr [ebp+10]
 0059AB7E    push        eax
 0059AB7F    mov         eax,dword ptr [ebp+0C]
 0059AB82    push        eax
 0059AB83    mov         eax,dword ptr [ebp+8]
 0059AB86    push        eax
 0059AB87    call        dword ptr ds:[789C9C]
 0059AB8D    mov         ebx,eax
 0059AB8F    xor         eax,eax
 0059AB91    pop         edx
 0059AB92    pop         ecx
 0059AB93    pop         ecx
 0059AB94    mov         dword ptr fs:[eax],edx
 0059AB97    push        59ABB4
 0059AB9C    lea         eax,[ebp-10]
 0059AB9F    call        @UStrClr
 0059ABA4    lea         eax,[ebp-4]
 0059ABA7    call        @UStrClr
 0059ABAC    ret
>0059ABAD    jmp         @HandleFinally
>0059ABB2    jmp         0059AB9C
 0059ABB4    mov         eax,ebx
 0059ABB6    pop         ebx
 0059ABB7    mov         esp,ebp
 0059ABB9    pop         ebp
 0059ABBA    ret         0C
*}
end;

//0059ABDC
function Stub_ioctlsocket(const s:PtrUInt; const cmd:DWORD; var arg:DWORD):Integer; stdcall;
begin
{*
 0059ABDC    push        ebp
 0059ABDD    mov         ebp,esp
 0059ABDF    add         esp,0FFFFFFF0
 0059ABE2    push        ebx
 0059ABE3    xor         eax,eax
 0059ABE5    mov         dword ptr [ebp-10],eax
 0059ABE8    mov         dword ptr [ebp-4],eax
 0059ABEB    xor         eax,eax
 0059ABED    push        ebp
 0059ABEE    push        59ACC1
 0059ABF3    push        dword ptr fs:[eax]
 0059ABF6    mov         dword ptr fs:[eax],esp
 0059ABF9    mov         ebx,dword ptr ds:[789E68]
 0059ABFF    test        ebx,ebx
>0059AC01    jne         0059AC3C
 0059AC03    lea         edx,[ebp-4]
 0059AC06    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AC0B    call        LoadResString
 0059AC10    mov         eax,dword ptr [ebp-4]
 0059AC13    push        eax
 0059AC14    mov         eax,59ACE0;'ioctlsocket'
 0059AC19    mov         dword ptr [ebp-0C],eax
 0059AC1C    mov         byte ptr [ebp-8],11
 0059AC20    lea         eax,[ebp-0C]
 0059AC23    push        eax
 0059AC24    push        0
 0059AC26    mov         ecx,276D
 0059AC2B    mov         dl,1
 0059AC2D    mov         eax,[0059A068];EIdWinsockStubError
 0059AC32    call        EIdWinsockStubError.Build
 0059AC37    call        @RaiseExcept
 0059AC3C    mov         eax,59ACE0;'ioctlsocket'
 0059AC41    call        @UStrToPWChar
 0059AC46    push        eax
 0059AC47    push        ebx
 0059AC48    call        GetProcAddress
 0059AC4D    test        eax,eax
>0059AC4F    jne         0059AC8A
 0059AC51    lea         edx,[ebp-10]
 0059AC54    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AC59    call        LoadResString
 0059AC5E    mov         eax,dword ptr [ebp-10]
 0059AC61    push        eax
 0059AC62    mov         eax,59ACE0;'ioctlsocket'
 0059AC67    mov         dword ptr [ebp-0C],eax
 0059AC6A    mov         byte ptr [ebp-8],11
 0059AC6E    lea         eax,[ebp-0C]
 0059AC71    push        eax
 0059AC72    push        0
 0059AC74    mov         ecx,2726
 0059AC79    mov         dl,1
 0059AC7B    mov         eax,[0059A068];EIdWinsockStubError
 0059AC80    call        EIdWinsockStubError.Build
 0059AC85    call        @RaiseExcept
 0059AC8A    mov         [00789CA0],eax
 0059AC8F    mov         eax,dword ptr [ebp+10]
 0059AC92    push        eax
 0059AC93    mov         eax,dword ptr [ebp+0C]
 0059AC96    push        eax
 0059AC97    mov         eax,dword ptr [ebp+8]
 0059AC9A    push        eax
 0059AC9B    call        dword ptr ds:[789CA0]
 0059ACA1    mov         ebx,eax
 0059ACA3    xor         eax,eax
 0059ACA5    pop         edx
 0059ACA6    pop         ecx
 0059ACA7    pop         ecx
 0059ACA8    mov         dword ptr fs:[eax],edx
 0059ACAB    push        59ACC8
 0059ACB0    lea         eax,[ebp-10]
 0059ACB3    call        @UStrClr
 0059ACB8    lea         eax,[ebp-4]
 0059ACBB    call        @UStrClr
 0059ACC0    ret
>0059ACC1    jmp         @HandleFinally
>0059ACC6    jmp         0059ACB0
 0059ACC8    mov         eax,ebx
 0059ACCA    pop         ebx
 0059ACCB    mov         esp,ebp
 0059ACCD    pop         ebp
 0059ACCE    ret         0C
*}
end;

//0059ACF8
function Stub_getpeername(const s:PtrUInt; const name:PSOCKADDR; var namelen:Integer):Integer; stdcall;
begin
{*
 0059ACF8    push        ebp
 0059ACF9    mov         ebp,esp
 0059ACFB    add         esp,0FFFFFFF0
 0059ACFE    push        ebx
 0059ACFF    xor         eax,eax
 0059AD01    mov         dword ptr [ebp-10],eax
 0059AD04    mov         dword ptr [ebp-4],eax
 0059AD07    xor         eax,eax
 0059AD09    push        ebp
 0059AD0A    push        59ADDD
 0059AD0F    push        dword ptr fs:[eax]
 0059AD12    mov         dword ptr fs:[eax],esp
 0059AD15    mov         ebx,dword ptr ds:[789E68]
 0059AD1B    test        ebx,ebx
>0059AD1D    jne         0059AD58
 0059AD1F    lea         edx,[ebp-4]
 0059AD22    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AD27    call        LoadResString
 0059AD2C    mov         eax,dword ptr [ebp-4]
 0059AD2F    push        eax
 0059AD30    mov         eax,59ADFC;'getpeername'
 0059AD35    mov         dword ptr [ebp-0C],eax
 0059AD38    mov         byte ptr [ebp-8],11
 0059AD3C    lea         eax,[ebp-0C]
 0059AD3F    push        eax
 0059AD40    push        0
 0059AD42    mov         ecx,276D
 0059AD47    mov         dl,1
 0059AD49    mov         eax,[0059A068];EIdWinsockStubError
 0059AD4E    call        EIdWinsockStubError.Build
 0059AD53    call        @RaiseExcept
 0059AD58    mov         eax,59ADFC;'getpeername'
 0059AD5D    call        @UStrToPWChar
 0059AD62    push        eax
 0059AD63    push        ebx
 0059AD64    call        GetProcAddress
 0059AD69    test        eax,eax
>0059AD6B    jne         0059ADA6
 0059AD6D    lea         edx,[ebp-10]
 0059AD70    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AD75    call        LoadResString
 0059AD7A    mov         eax,dword ptr [ebp-10]
 0059AD7D    push        eax
 0059AD7E    mov         eax,59ADFC;'getpeername'
 0059AD83    mov         dword ptr [ebp-0C],eax
 0059AD86    mov         byte ptr [ebp-8],11
 0059AD8A    lea         eax,[ebp-0C]
 0059AD8D    push        eax
 0059AD8E    push        0
 0059AD90    mov         ecx,2726
 0059AD95    mov         dl,1
 0059AD97    mov         eax,[0059A068];EIdWinsockStubError
 0059AD9C    call        EIdWinsockStubError.Build
 0059ADA1    call        @RaiseExcept
 0059ADA6    mov         [00789CA4],eax
 0059ADAB    mov         eax,dword ptr [ebp+10]
 0059ADAE    push        eax
 0059ADAF    mov         eax,dword ptr [ebp+0C]
 0059ADB2    push        eax
 0059ADB3    mov         eax,dword ptr [ebp+8]
 0059ADB6    push        eax
 0059ADB7    call        dword ptr ds:[789CA4]
 0059ADBD    mov         ebx,eax
 0059ADBF    xor         eax,eax
 0059ADC1    pop         edx
 0059ADC2    pop         ecx
 0059ADC3    pop         ecx
 0059ADC4    mov         dword ptr fs:[eax],edx
 0059ADC7    push        59ADE4
 0059ADCC    lea         eax,[ebp-10]
 0059ADCF    call        @UStrClr
 0059ADD4    lea         eax,[ebp-4]
 0059ADD7    call        @UStrClr
 0059ADDC    ret
>0059ADDD    jmp         @HandleFinally
>0059ADE2    jmp         0059ADCC
 0059ADE4    mov         eax,ebx
 0059ADE6    pop         ebx
 0059ADE7    mov         esp,ebp
 0059ADE9    pop         ebp
 0059ADEA    ret         0C
*}
end;

//0059AE14
function Stub_getsockname(const s:PtrUInt; const name:PSOCKADDR; var namelen:Integer):Integer; stdcall;
begin
{*
 0059AE14    push        ebp
 0059AE15    mov         ebp,esp
 0059AE17    add         esp,0FFFFFFF0
 0059AE1A    push        ebx
 0059AE1B    xor         eax,eax
 0059AE1D    mov         dword ptr [ebp-10],eax
 0059AE20    mov         dword ptr [ebp-4],eax
 0059AE23    xor         eax,eax
 0059AE25    push        ebp
 0059AE26    push        59AEF9
 0059AE2B    push        dword ptr fs:[eax]
 0059AE2E    mov         dword ptr fs:[eax],esp
 0059AE31    mov         ebx,dword ptr ds:[789E68]
 0059AE37    test        ebx,ebx
>0059AE39    jne         0059AE74
 0059AE3B    lea         edx,[ebp-4]
 0059AE3E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AE43    call        LoadResString
 0059AE48    mov         eax,dword ptr [ebp-4]
 0059AE4B    push        eax
 0059AE4C    mov         eax,59AF18;'getsockname'
 0059AE51    mov         dword ptr [ebp-0C],eax
 0059AE54    mov         byte ptr [ebp-8],11
 0059AE58    lea         eax,[ebp-0C]
 0059AE5B    push        eax
 0059AE5C    push        0
 0059AE5E    mov         ecx,276D
 0059AE63    mov         dl,1
 0059AE65    mov         eax,[0059A068];EIdWinsockStubError
 0059AE6A    call        EIdWinsockStubError.Build
 0059AE6F    call        @RaiseExcept
 0059AE74    mov         eax,59AF18;'getsockname'
 0059AE79    call        @UStrToPWChar
 0059AE7E    push        eax
 0059AE7F    push        ebx
 0059AE80    call        GetProcAddress
 0059AE85    test        eax,eax
>0059AE87    jne         0059AEC2
 0059AE89    lea         edx,[ebp-10]
 0059AE8C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AE91    call        LoadResString
 0059AE96    mov         eax,dword ptr [ebp-10]
 0059AE99    push        eax
 0059AE9A    mov         eax,59AF18;'getsockname'
 0059AE9F    mov         dword ptr [ebp-0C],eax
 0059AEA2    mov         byte ptr [ebp-8],11
 0059AEA6    lea         eax,[ebp-0C]
 0059AEA9    push        eax
 0059AEAA    push        0
 0059AEAC    mov         ecx,2726
 0059AEB1    mov         dl,1
 0059AEB3    mov         eax,[0059A068];EIdWinsockStubError
 0059AEB8    call        EIdWinsockStubError.Build
 0059AEBD    call        @RaiseExcept
 0059AEC2    mov         [00789CA8],eax
 0059AEC7    mov         eax,dword ptr [ebp+10]
 0059AECA    push        eax
 0059AECB    mov         eax,dword ptr [ebp+0C]
 0059AECE    push        eax
 0059AECF    mov         eax,dword ptr [ebp+8]
 0059AED2    push        eax
 0059AED3    call        dword ptr ds:[789CA8]
 0059AED9    mov         ebx,eax
 0059AEDB    xor         eax,eax
 0059AEDD    pop         edx
 0059AEDE    pop         ecx
 0059AEDF    pop         ecx
 0059AEE0    mov         dword ptr fs:[eax],edx
 0059AEE3    push        59AF00
 0059AEE8    lea         eax,[ebp-10]
 0059AEEB    call        @UStrClr
 0059AEF0    lea         eax,[ebp-4]
 0059AEF3    call        @UStrClr
 0059AEF8    ret
>0059AEF9    jmp         @HandleFinally
>0059AEFE    jmp         0059AEE8
 0059AF00    mov         eax,ebx
 0059AF02    pop         ebx
 0059AF03    mov         esp,ebp
 0059AF05    pop         ebp
 0059AF06    ret         0C
*}
end;

//0059AF30
function Stub_getsockopt(const s:PtrUInt; const level:Integer; const optname:Integer; optval:PAnsiChar; var optlen:Integer):Integer; stdcall;
begin
{*
 0059AF30    push        ebp
 0059AF31    mov         ebp,esp
 0059AF33    add         esp,0FFFFFFF0
 0059AF36    push        ebx
 0059AF37    xor         eax,eax
 0059AF39    mov         dword ptr [ebp-10],eax
 0059AF3C    mov         dword ptr [ebp-4],eax
 0059AF3F    xor         eax,eax
 0059AF41    push        ebp
 0059AF42    push        59B01D
 0059AF47    push        dword ptr fs:[eax]
 0059AF4A    mov         dword ptr fs:[eax],esp
 0059AF4D    mov         ebx,dword ptr ds:[789E68]
 0059AF53    test        ebx,ebx
>0059AF55    jne         0059AF90
 0059AF57    lea         edx,[ebp-4]
 0059AF5A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AF5F    call        LoadResString
 0059AF64    mov         eax,dword ptr [ebp-4]
 0059AF67    push        eax
 0059AF68    mov         eax,59B03C;'getsockopt'
 0059AF6D    mov         dword ptr [ebp-0C],eax
 0059AF70    mov         byte ptr [ebp-8],11
 0059AF74    lea         eax,[ebp-0C]
 0059AF77    push        eax
 0059AF78    push        0
 0059AF7A    mov         ecx,276D
 0059AF7F    mov         dl,1
 0059AF81    mov         eax,[0059A068];EIdWinsockStubError
 0059AF86    call        EIdWinsockStubError.Build
 0059AF8B    call        @RaiseExcept
 0059AF90    mov         eax,59B03C;'getsockopt'
 0059AF95    call        @UStrToPWChar
 0059AF9A    push        eax
 0059AF9B    push        ebx
 0059AF9C    call        GetProcAddress
 0059AFA1    test        eax,eax
>0059AFA3    jne         0059AFDE
 0059AFA5    lea         edx,[ebp-10]
 0059AFA8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059AFAD    call        LoadResString
 0059AFB2    mov         eax,dword ptr [ebp-10]
 0059AFB5    push        eax
 0059AFB6    mov         eax,59B03C;'getsockopt'
 0059AFBB    mov         dword ptr [ebp-0C],eax
 0059AFBE    mov         byte ptr [ebp-8],11
 0059AFC2    lea         eax,[ebp-0C]
 0059AFC5    push        eax
 0059AFC6    push        0
 0059AFC8    mov         ecx,2726
 0059AFCD    mov         dl,1
 0059AFCF    mov         eax,[0059A068];EIdWinsockStubError
 0059AFD4    call        EIdWinsockStubError.Build
 0059AFD9    call        @RaiseExcept
 0059AFDE    mov         [00789CAC],eax
 0059AFE3    mov         eax,dword ptr [ebp+18]
 0059AFE6    push        eax
 0059AFE7    mov         eax,dword ptr [ebp+14]
 0059AFEA    push        eax
 0059AFEB    mov         eax,dword ptr [ebp+10]
 0059AFEE    push        eax
 0059AFEF    mov         eax,dword ptr [ebp+0C]
 0059AFF2    push        eax
 0059AFF3    mov         eax,dword ptr [ebp+8]
 0059AFF6    push        eax
 0059AFF7    call        dword ptr ds:[789CAC]
 0059AFFD    mov         ebx,eax
 0059AFFF    xor         eax,eax
 0059B001    pop         edx
 0059B002    pop         ecx
 0059B003    pop         ecx
 0059B004    mov         dword ptr fs:[eax],edx
 0059B007    push        59B024
 0059B00C    lea         eax,[ebp-10]
 0059B00F    call        @UStrClr
 0059B014    lea         eax,[ebp-4]
 0059B017    call        @UStrClr
 0059B01C    ret
>0059B01D    jmp         @HandleFinally
>0059B022    jmp         0059B00C
 0059B024    mov         eax,ebx
 0059B026    pop         ebx
 0059B027    mov         esp,ebp
 0059B029    pop         ebp
 0059B02A    ret         14
*}
end;

//0059B054
function Stub_htonl(hostlong:DWORD):DWORD; stdcall;
begin
{*
 0059B054    push        ebp
 0059B055    mov         ebp,esp
 0059B057    add         esp,0FFFFFFF0
 0059B05A    push        ebx
 0059B05B    xor         eax,eax
 0059B05D    mov         dword ptr [ebp-10],eax
 0059B060    mov         dword ptr [ebp-4],eax
 0059B063    xor         eax,eax
 0059B065    push        ebp
 0059B066    push        59B131
 0059B06B    push        dword ptr fs:[eax]
 0059B06E    mov         dword ptr fs:[eax],esp
 0059B071    mov         ebx,dword ptr ds:[789E68]
 0059B077    test        ebx,ebx
>0059B079    jne         0059B0B4
 0059B07B    lea         edx,[ebp-4]
 0059B07E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B083    call        LoadResString
 0059B088    mov         eax,dword ptr [ebp-4]
 0059B08B    push        eax
 0059B08C    mov         eax,59B150;'htonl'
 0059B091    mov         dword ptr [ebp-0C],eax
 0059B094    mov         byte ptr [ebp-8],11
 0059B098    lea         eax,[ebp-0C]
 0059B09B    push        eax
 0059B09C    push        0
 0059B09E    mov         ecx,276D
 0059B0A3    mov         dl,1
 0059B0A5    mov         eax,[0059A068];EIdWinsockStubError
 0059B0AA    call        EIdWinsockStubError.Build
 0059B0AF    call        @RaiseExcept
 0059B0B4    mov         eax,59B150;'htonl'
 0059B0B9    call        @UStrToPWChar
 0059B0BE    push        eax
 0059B0BF    push        ebx
 0059B0C0    call        GetProcAddress
 0059B0C5    test        eax,eax
>0059B0C7    jne         0059B102
 0059B0C9    lea         edx,[ebp-10]
 0059B0CC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B0D1    call        LoadResString
 0059B0D6    mov         eax,dword ptr [ebp-10]
 0059B0D9    push        eax
 0059B0DA    mov         eax,59B150;'htonl'
 0059B0DF    mov         dword ptr [ebp-0C],eax
 0059B0E2    mov         byte ptr [ebp-8],11
 0059B0E6    lea         eax,[ebp-0C]
 0059B0E9    push        eax
 0059B0EA    push        0
 0059B0EC    mov         ecx,2726
 0059B0F1    mov         dl,1
 0059B0F3    mov         eax,[0059A068];EIdWinsockStubError
 0059B0F8    call        EIdWinsockStubError.Build
 0059B0FD    call        @RaiseExcept
 0059B102    mov         [00789CB0],eax
 0059B107    mov         eax,dword ptr [ebp+8]
 0059B10A    push        eax
 0059B10B    call        dword ptr ds:[789CB0]
 0059B111    mov         ebx,eax
 0059B113    xor         eax,eax
 0059B115    pop         edx
 0059B116    pop         ecx
 0059B117    pop         ecx
 0059B118    mov         dword ptr fs:[eax],edx
 0059B11B    push        59B138
 0059B120    lea         eax,[ebp-10]
 0059B123    call        @UStrClr
 0059B128    lea         eax,[ebp-4]
 0059B12B    call        @UStrClr
 0059B130    ret
>0059B131    jmp         @HandleFinally
>0059B136    jmp         0059B120
 0059B138    mov         eax,ebx
 0059B13A    pop         ebx
 0059B13B    mov         esp,ebp
 0059B13D    pop         ebp
 0059B13E    ret         4
*}
end;

//0059B15C
function Stub_htons(hostshort:Word):Word; stdcall;
begin
{*
 0059B15C    push        ebp
 0059B15D    mov         ebp,esp
 0059B15F    add         esp,0FFFFFFF0
 0059B162    push        ebx
 0059B163    xor         eax,eax
 0059B165    mov         dword ptr [ebp-10],eax
 0059B168    mov         dword ptr [ebp-4],eax
 0059B16B    xor         eax,eax
 0059B16D    push        ebp
 0059B16E    push        59B23A
 0059B173    push        dword ptr fs:[eax]
 0059B176    mov         dword ptr fs:[eax],esp
 0059B179    mov         ebx,dword ptr ds:[789E68]
 0059B17F    test        ebx,ebx
>0059B181    jne         0059B1BC
 0059B183    lea         edx,[ebp-4]
 0059B186    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B18B    call        LoadResString
 0059B190    mov         eax,dword ptr [ebp-4]
 0059B193    push        eax
 0059B194    mov         eax,59B258;'htons'
 0059B199    mov         dword ptr [ebp-0C],eax
 0059B19C    mov         byte ptr [ebp-8],11
 0059B1A0    lea         eax,[ebp-0C]
 0059B1A3    push        eax
 0059B1A4    push        0
 0059B1A6    mov         ecx,276D
 0059B1AB    mov         dl,1
 0059B1AD    mov         eax,[0059A068];EIdWinsockStubError
 0059B1B2    call        EIdWinsockStubError.Build
 0059B1B7    call        @RaiseExcept
 0059B1BC    mov         eax,59B258;'htons'
 0059B1C1    call        @UStrToPWChar
 0059B1C6    push        eax
 0059B1C7    push        ebx
 0059B1C8    call        GetProcAddress
 0059B1CD    test        eax,eax
>0059B1CF    jne         0059B20A
 0059B1D1    lea         edx,[ebp-10]
 0059B1D4    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B1D9    call        LoadResString
 0059B1DE    mov         eax,dword ptr [ebp-10]
 0059B1E1    push        eax
 0059B1E2    mov         eax,59B258;'htons'
 0059B1E7    mov         dword ptr [ebp-0C],eax
 0059B1EA    mov         byte ptr [ebp-8],11
 0059B1EE    lea         eax,[ebp-0C]
 0059B1F1    push        eax
 0059B1F2    push        0
 0059B1F4    mov         ecx,2726
 0059B1F9    mov         dl,1
 0059B1FB    mov         eax,[0059A068];EIdWinsockStubError
 0059B200    call        EIdWinsockStubError.Build
 0059B205    call        @RaiseExcept
 0059B20A    mov         [00789CB4],eax
 0059B20F    movzx       eax,word ptr [ebp+8]
 0059B213    push        eax
 0059B214    call        dword ptr ds:[789CB4]
 0059B21A    mov         ebx,eax
 0059B21C    xor         eax,eax
 0059B21E    pop         edx
 0059B21F    pop         ecx
 0059B220    pop         ecx
 0059B221    mov         dword ptr fs:[eax],edx
 0059B224    push        59B241
 0059B229    lea         eax,[ebp-10]
 0059B22C    call        @UStrClr
 0059B231    lea         eax,[ebp-4]
 0059B234    call        @UStrClr
 0059B239    ret
>0059B23A    jmp         @HandleFinally
>0059B23F    jmp         0059B229
 0059B241    mov         eax,ebx
 0059B243    pop         ebx
 0059B244    mov         esp,ebp
 0059B246    pop         ebp
 0059B247    ret         4
*}
end;

//0059B264
function Stub_inet_addr(cp:PAnsiChar):DWORD; stdcall;
begin
{*
 0059B264    push        ebp
 0059B265    mov         ebp,esp
 0059B267    add         esp,0FFFFFFF0
 0059B26A    push        ebx
 0059B26B    xor         eax,eax
 0059B26D    mov         dword ptr [ebp-10],eax
 0059B270    mov         dword ptr [ebp-4],eax
 0059B273    xor         eax,eax
 0059B275    push        ebp
 0059B276    push        59B341
 0059B27B    push        dword ptr fs:[eax]
 0059B27E    mov         dword ptr fs:[eax],esp
 0059B281    mov         ebx,dword ptr ds:[789E68]
 0059B287    test        ebx,ebx
>0059B289    jne         0059B2C4
 0059B28B    lea         edx,[ebp-4]
 0059B28E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B293    call        LoadResString
 0059B298    mov         eax,dword ptr [ebp-4]
 0059B29B    push        eax
 0059B29C    mov         eax,59B360;'inet_addr'
 0059B2A1    mov         dword ptr [ebp-0C],eax
 0059B2A4    mov         byte ptr [ebp-8],11
 0059B2A8    lea         eax,[ebp-0C]
 0059B2AB    push        eax
 0059B2AC    push        0
 0059B2AE    mov         ecx,276D
 0059B2B3    mov         dl,1
 0059B2B5    mov         eax,[0059A068];EIdWinsockStubError
 0059B2BA    call        EIdWinsockStubError.Build
 0059B2BF    call        @RaiseExcept
 0059B2C4    mov         eax,59B360;'inet_addr'
 0059B2C9    call        @UStrToPWChar
 0059B2CE    push        eax
 0059B2CF    push        ebx
 0059B2D0    call        GetProcAddress
 0059B2D5    test        eax,eax
>0059B2D7    jne         0059B312
 0059B2D9    lea         edx,[ebp-10]
 0059B2DC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B2E1    call        LoadResString
 0059B2E6    mov         eax,dword ptr [ebp-10]
 0059B2E9    push        eax
 0059B2EA    mov         eax,59B360;'inet_addr'
 0059B2EF    mov         dword ptr [ebp-0C],eax
 0059B2F2    mov         byte ptr [ebp-8],11
 0059B2F6    lea         eax,[ebp-0C]
 0059B2F9    push        eax
 0059B2FA    push        0
 0059B2FC    mov         ecx,2726
 0059B301    mov         dl,1
 0059B303    mov         eax,[0059A068];EIdWinsockStubError
 0059B308    call        EIdWinsockStubError.Build
 0059B30D    call        @RaiseExcept
 0059B312    mov         [00789CB8],eax
 0059B317    mov         eax,dword ptr [ebp+8]
 0059B31A    push        eax
 0059B31B    call        dword ptr ds:[789CB8]
 0059B321    mov         ebx,eax
 0059B323    xor         eax,eax
 0059B325    pop         edx
 0059B326    pop         ecx
 0059B327    pop         ecx
 0059B328    mov         dword ptr fs:[eax],edx
 0059B32B    push        59B348
 0059B330    lea         eax,[ebp-10]
 0059B333    call        @UStrClr
 0059B338    lea         eax,[ebp-4]
 0059B33B    call        @UStrClr
 0059B340    ret
>0059B341    jmp         @HandleFinally
>0059B346    jmp         0059B330
 0059B348    mov         eax,ebx
 0059B34A    pop         ebx
 0059B34B    mov         esp,ebp
 0059B34D    pop         ebp
 0059B34E    ret         4
*}
end;

//0059B374
function Stub_inet_ntoa(inaddr:in_addr):PAnsiChar; stdcall;
begin
{*
 0059B374    push        ebp
 0059B375    mov         ebp,esp
 0059B377    add         esp,0FFFFFFF0
 0059B37A    push        ebx
 0059B37B    xor         eax,eax
 0059B37D    mov         dword ptr [ebp-10],eax
 0059B380    mov         dword ptr [ebp-4],eax
 0059B383    xor         eax,eax
 0059B385    push        ebp
 0059B386    push        59B450
 0059B38B    push        dword ptr fs:[eax]
 0059B38E    mov         dword ptr fs:[eax],esp
 0059B391    mov         ebx,dword ptr ds:[789E68]
 0059B397    test        ebx,ebx
>0059B399    jne         0059B3D4
 0059B39B    lea         edx,[ebp-4]
 0059B39E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B3A3    call        LoadResString
 0059B3A8    mov         eax,dword ptr [ebp-4]
 0059B3AB    push        eax
 0059B3AC    mov         eax,59B46C;'inet_ntoa'
 0059B3B1    mov         dword ptr [ebp-0C],eax
 0059B3B4    mov         byte ptr [ebp-8],11
 0059B3B8    lea         eax,[ebp-0C]
 0059B3BB    push        eax
 0059B3BC    push        0
 0059B3BE    mov         ecx,276D
 0059B3C3    mov         dl,1
 0059B3C5    mov         eax,[0059A068];EIdWinsockStubError
 0059B3CA    call        EIdWinsockStubError.Build
 0059B3CF    call        @RaiseExcept
 0059B3D4    mov         eax,59B46C;'inet_ntoa'
 0059B3D9    call        @UStrToPWChar
 0059B3DE    push        eax
 0059B3DF    push        ebx
 0059B3E0    call        GetProcAddress
 0059B3E5    test        eax,eax
>0059B3E7    jne         0059B422
 0059B3E9    lea         edx,[ebp-10]
 0059B3EC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B3F1    call        LoadResString
 0059B3F6    mov         eax,dword ptr [ebp-10]
 0059B3F9    push        eax
 0059B3FA    mov         eax,59B46C;'inet_ntoa'
 0059B3FF    mov         dword ptr [ebp-0C],eax
 0059B402    mov         byte ptr [ebp-8],11
 0059B406    lea         eax,[ebp-0C]
 0059B409    push        eax
 0059B40A    push        0
 0059B40C    mov         ecx,2726
 0059B411    mov         dl,1
 0059B413    mov         eax,[0059A068];EIdWinsockStubError
 0059B418    call        EIdWinsockStubError.Build
 0059B41D    call        @RaiseExcept
 0059B422    mov         [00789CBC],eax
 0059B427    push        dword ptr [ebp+8]
 0059B42A    call        dword ptr ds:[789CBC]
 0059B430    mov         ebx,eax
 0059B432    xor         eax,eax
 0059B434    pop         edx
 0059B435    pop         ecx
 0059B436    pop         ecx
 0059B437    mov         dword ptr fs:[eax],edx
 0059B43A    push        59B457
 0059B43F    lea         eax,[ebp-10]
 0059B442    call        @UStrClr
 0059B447    lea         eax,[ebp-4]
 0059B44A    call        @UStrClr
 0059B44F    ret
>0059B450    jmp         @HandleFinally
>0059B455    jmp         0059B43F
 0059B457    mov         eax,ebx
 0059B459    pop         ebx
 0059B45A    mov         esp,ebp
 0059B45C    pop         ebp
 0059B45D    ret         4
*}
end;

//0059B480
function Stub_listen(const s:PtrUInt; backlog:Integer):Integer; stdcall;
begin
{*
 0059B480    push        ebp
 0059B481    mov         ebp,esp
 0059B483    add         esp,0FFFFFFF0
 0059B486    push        ebx
 0059B487    xor         eax,eax
 0059B489    mov         dword ptr [ebp-10],eax
 0059B48C    mov         dword ptr [ebp-4],eax
 0059B48F    xor         eax,eax
 0059B491    push        ebp
 0059B492    push        59B561
 0059B497    push        dword ptr fs:[eax]
 0059B49A    mov         dword ptr fs:[eax],esp
 0059B49D    mov         ebx,dword ptr ds:[789E68]
 0059B4A3    test        ebx,ebx
>0059B4A5    jne         0059B4E0
 0059B4A7    lea         edx,[ebp-4]
 0059B4AA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B4AF    call        LoadResString
 0059B4B4    mov         eax,dword ptr [ebp-4]
 0059B4B7    push        eax
 0059B4B8    mov         eax,59B580;'listen'
 0059B4BD    mov         dword ptr [ebp-0C],eax
 0059B4C0    mov         byte ptr [ebp-8],11
 0059B4C4    lea         eax,[ebp-0C]
 0059B4C7    push        eax
 0059B4C8    push        0
 0059B4CA    mov         ecx,276D
 0059B4CF    mov         dl,1
 0059B4D1    mov         eax,[0059A068];EIdWinsockStubError
 0059B4D6    call        EIdWinsockStubError.Build
 0059B4DB    call        @RaiseExcept
 0059B4E0    mov         eax,59B580;'listen'
 0059B4E5    call        @UStrToPWChar
 0059B4EA    push        eax
 0059B4EB    push        ebx
 0059B4EC    call        GetProcAddress
 0059B4F1    test        eax,eax
>0059B4F3    jne         0059B52E
 0059B4F5    lea         edx,[ebp-10]
 0059B4F8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B4FD    call        LoadResString
 0059B502    mov         eax,dword ptr [ebp-10]
 0059B505    push        eax
 0059B506    mov         eax,59B580;'listen'
 0059B50B    mov         dword ptr [ebp-0C],eax
 0059B50E    mov         byte ptr [ebp-8],11
 0059B512    lea         eax,[ebp-0C]
 0059B515    push        eax
 0059B516    push        0
 0059B518    mov         ecx,2726
 0059B51D    mov         dl,1
 0059B51F    mov         eax,[0059A068];EIdWinsockStubError
 0059B524    call        EIdWinsockStubError.Build
 0059B529    call        @RaiseExcept
 0059B52E    mov         [00789CC0],eax
 0059B533    mov         eax,dword ptr [ebp+0C]
 0059B536    push        eax
 0059B537    mov         eax,dword ptr [ebp+8]
 0059B53A    push        eax
 0059B53B    call        dword ptr ds:[789CC0]
 0059B541    mov         ebx,eax
 0059B543    xor         eax,eax
 0059B545    pop         edx
 0059B546    pop         ecx
 0059B547    pop         ecx
 0059B548    mov         dword ptr fs:[eax],edx
 0059B54B    push        59B568
 0059B550    lea         eax,[ebp-10]
 0059B553    call        @UStrClr
 0059B558    lea         eax,[ebp-4]
 0059B55B    call        @UStrClr
 0059B560    ret
>0059B561    jmp         @HandleFinally
>0059B566    jmp         0059B550
 0059B568    mov         eax,ebx
 0059B56A    pop         ebx
 0059B56B    mov         esp,ebp
 0059B56D    pop         ebp
 0059B56E    ret         8
*}
end;

//0059B590
function Stub_ntohl(netlong:DWORD):DWORD; stdcall;
begin
{*
 0059B590    push        ebp
 0059B591    mov         ebp,esp
 0059B593    add         esp,0FFFFFFF0
 0059B596    push        ebx
 0059B597    xor         eax,eax
 0059B599    mov         dword ptr [ebp-10],eax
 0059B59C    mov         dword ptr [ebp-4],eax
 0059B59F    xor         eax,eax
 0059B5A1    push        ebp
 0059B5A2    push        59B66D
 0059B5A7    push        dword ptr fs:[eax]
 0059B5AA    mov         dword ptr fs:[eax],esp
 0059B5AD    mov         ebx,dword ptr ds:[789E68]
 0059B5B3    test        ebx,ebx
>0059B5B5    jne         0059B5F0
 0059B5B7    lea         edx,[ebp-4]
 0059B5BA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B5BF    call        LoadResString
 0059B5C4    mov         eax,dword ptr [ebp-4]
 0059B5C7    push        eax
 0059B5C8    mov         eax,59B68C;'ntohl'
 0059B5CD    mov         dword ptr [ebp-0C],eax
 0059B5D0    mov         byte ptr [ebp-8],11
 0059B5D4    lea         eax,[ebp-0C]
 0059B5D7    push        eax
 0059B5D8    push        0
 0059B5DA    mov         ecx,276D
 0059B5DF    mov         dl,1
 0059B5E1    mov         eax,[0059A068];EIdWinsockStubError
 0059B5E6    call        EIdWinsockStubError.Build
 0059B5EB    call        @RaiseExcept
 0059B5F0    mov         eax,59B68C;'ntohl'
 0059B5F5    call        @UStrToPWChar
 0059B5FA    push        eax
 0059B5FB    push        ebx
 0059B5FC    call        GetProcAddress
 0059B601    test        eax,eax
>0059B603    jne         0059B63E
 0059B605    lea         edx,[ebp-10]
 0059B608    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B60D    call        LoadResString
 0059B612    mov         eax,dword ptr [ebp-10]
 0059B615    push        eax
 0059B616    mov         eax,59B68C;'ntohl'
 0059B61B    mov         dword ptr [ebp-0C],eax
 0059B61E    mov         byte ptr [ebp-8],11
 0059B622    lea         eax,[ebp-0C]
 0059B625    push        eax
 0059B626    push        0
 0059B628    mov         ecx,2726
 0059B62D    mov         dl,1
 0059B62F    mov         eax,[0059A068];EIdWinsockStubError
 0059B634    call        EIdWinsockStubError.Build
 0059B639    call        @RaiseExcept
 0059B63E    mov         [00789CC4],eax
 0059B643    mov         eax,dword ptr [ebp+8]
 0059B646    push        eax
 0059B647    call        dword ptr ds:[789CC4]
 0059B64D    mov         ebx,eax
 0059B64F    xor         eax,eax
 0059B651    pop         edx
 0059B652    pop         ecx
 0059B653    pop         ecx
 0059B654    mov         dword ptr fs:[eax],edx
 0059B657    push        59B674
 0059B65C    lea         eax,[ebp-10]
 0059B65F    call        @UStrClr
 0059B664    lea         eax,[ebp-4]
 0059B667    call        @UStrClr
 0059B66C    ret
>0059B66D    jmp         @HandleFinally
>0059B672    jmp         0059B65C
 0059B674    mov         eax,ebx
 0059B676    pop         ebx
 0059B677    mov         esp,ebp
 0059B679    pop         ebp
 0059B67A    ret         4
*}
end;

//0059B698
function Stub_ntohs(netshort:Word):Word; stdcall;
begin
{*
 0059B698    push        ebp
 0059B699    mov         ebp,esp
 0059B69B    add         esp,0FFFFFFF0
 0059B69E    push        ebx
 0059B69F    xor         eax,eax
 0059B6A1    mov         dword ptr [ebp-10],eax
 0059B6A4    mov         dword ptr [ebp-4],eax
 0059B6A7    xor         eax,eax
 0059B6A9    push        ebp
 0059B6AA    push        59B776
 0059B6AF    push        dword ptr fs:[eax]
 0059B6B2    mov         dword ptr fs:[eax],esp
 0059B6B5    mov         ebx,dword ptr ds:[789E68]
 0059B6BB    test        ebx,ebx
>0059B6BD    jne         0059B6F8
 0059B6BF    lea         edx,[ebp-4]
 0059B6C2    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B6C7    call        LoadResString
 0059B6CC    mov         eax,dword ptr [ebp-4]
 0059B6CF    push        eax
 0059B6D0    mov         eax,59B794;'ntohs'
 0059B6D5    mov         dword ptr [ebp-0C],eax
 0059B6D8    mov         byte ptr [ebp-8],11
 0059B6DC    lea         eax,[ebp-0C]
 0059B6DF    push        eax
 0059B6E0    push        0
 0059B6E2    mov         ecx,276D
 0059B6E7    mov         dl,1
 0059B6E9    mov         eax,[0059A068];EIdWinsockStubError
 0059B6EE    call        EIdWinsockStubError.Build
 0059B6F3    call        @RaiseExcept
 0059B6F8    mov         eax,59B794;'ntohs'
 0059B6FD    call        @UStrToPWChar
 0059B702    push        eax
 0059B703    push        ebx
 0059B704    call        GetProcAddress
 0059B709    test        eax,eax
>0059B70B    jne         0059B746
 0059B70D    lea         edx,[ebp-10]
 0059B710    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B715    call        LoadResString
 0059B71A    mov         eax,dword ptr [ebp-10]
 0059B71D    push        eax
 0059B71E    mov         eax,59B794;'ntohs'
 0059B723    mov         dword ptr [ebp-0C],eax
 0059B726    mov         byte ptr [ebp-8],11
 0059B72A    lea         eax,[ebp-0C]
 0059B72D    push        eax
 0059B72E    push        0
 0059B730    mov         ecx,2726
 0059B735    mov         dl,1
 0059B737    mov         eax,[0059A068];EIdWinsockStubError
 0059B73C    call        EIdWinsockStubError.Build
 0059B741    call        @RaiseExcept
 0059B746    mov         [00789CC8],eax
 0059B74B    movzx       eax,word ptr [ebp+8]
 0059B74F    push        eax
 0059B750    call        dword ptr ds:[789CC8]
 0059B756    mov         ebx,eax
 0059B758    xor         eax,eax
 0059B75A    pop         edx
 0059B75B    pop         ecx
 0059B75C    pop         ecx
 0059B75D    mov         dword ptr fs:[eax],edx
 0059B760    push        59B77D
 0059B765    lea         eax,[ebp-10]
 0059B768    call        @UStrClr
 0059B76D    lea         eax,[ebp-4]
 0059B770    call        @UStrClr
 0059B775    ret
>0059B776    jmp         @HandleFinally
>0059B77B    jmp         0059B765
 0059B77D    mov         eax,ebx
 0059B77F    pop         ebx
 0059B780    mov         esp,ebp
 0059B782    pop         ebp
 0059B783    ret         4
*}
end;

//0059B7A0
function Stub_recv(const s:PtrUInt; var Buf:void ; len:Integer; flags:Integer):Integer; stdcall;
begin
{*
 0059B7A0    push        ebp
 0059B7A1    mov         ebp,esp
 0059B7A3    add         esp,0FFFFFFF0
 0059B7A6    push        ebx
 0059B7A7    xor         eax,eax
 0059B7A9    mov         dword ptr [ebp-10],eax
 0059B7AC    mov         dword ptr [ebp-4],eax
 0059B7AF    xor         eax,eax
 0059B7B1    push        ebp
 0059B7B2    push        59B889
 0059B7B7    push        dword ptr fs:[eax]
 0059B7BA    mov         dword ptr fs:[eax],esp
 0059B7BD    mov         ebx,dword ptr ds:[789E68]
 0059B7C3    test        ebx,ebx
>0059B7C5    jne         0059B800
 0059B7C7    lea         edx,[ebp-4]
 0059B7CA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B7CF    call        LoadResString
 0059B7D4    mov         eax,dword ptr [ebp-4]
 0059B7D7    push        eax
 0059B7D8    mov         eax,59B8A8;'recv'
 0059B7DD    mov         dword ptr [ebp-0C],eax
 0059B7E0    mov         byte ptr [ebp-8],11
 0059B7E4    lea         eax,[ebp-0C]
 0059B7E7    push        eax
 0059B7E8    push        0
 0059B7EA    mov         ecx,276D
 0059B7EF    mov         dl,1
 0059B7F1    mov         eax,[0059A068];EIdWinsockStubError
 0059B7F6    call        EIdWinsockStubError.Build
 0059B7FB    call        @RaiseExcept
 0059B800    mov         eax,59B8A8;'recv'
 0059B805    call        @UStrToPWChar
 0059B80A    push        eax
 0059B80B    push        ebx
 0059B80C    call        GetProcAddress
 0059B811    test        eax,eax
>0059B813    jne         0059B84E
 0059B815    lea         edx,[ebp-10]
 0059B818    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B81D    call        LoadResString
 0059B822    mov         eax,dword ptr [ebp-10]
 0059B825    push        eax
 0059B826    mov         eax,59B8A8;'recv'
 0059B82B    mov         dword ptr [ebp-0C],eax
 0059B82E    mov         byte ptr [ebp-8],11
 0059B832    lea         eax,[ebp-0C]
 0059B835    push        eax
 0059B836    push        0
 0059B838    mov         ecx,2726
 0059B83D    mov         dl,1
 0059B83F    mov         eax,[0059A068];EIdWinsockStubError
 0059B844    call        EIdWinsockStubError.Build
 0059B849    call        @RaiseExcept
 0059B84E    mov         [00789CCC],eax
 0059B853    mov         eax,dword ptr [ebp+14]
 0059B856    push        eax
 0059B857    mov         eax,dword ptr [ebp+10]
 0059B85A    push        eax
 0059B85B    mov         eax,dword ptr [ebp+0C]
 0059B85E    push        eax
 0059B85F    mov         eax,dword ptr [ebp+8]
 0059B862    push        eax
 0059B863    call        dword ptr ds:[789CCC]
 0059B869    mov         ebx,eax
 0059B86B    xor         eax,eax
 0059B86D    pop         edx
 0059B86E    pop         ecx
 0059B86F    pop         ecx
 0059B870    mov         dword ptr fs:[eax],edx
 0059B873    push        59B890
 0059B878    lea         eax,[ebp-10]
 0059B87B    call        @UStrClr
 0059B880    lea         eax,[ebp-4]
 0059B883    call        @UStrClr
 0059B888    ret
>0059B889    jmp         @HandleFinally
>0059B88E    jmp         0059B878
 0059B890    mov         eax,ebx
 0059B892    pop         ebx
 0059B893    mov         esp,ebp
 0059B895    pop         ebp
 0059B896    ret         10
*}
end;

//0059B8B4
function Stub_recvfrom(const s:PtrUInt; var Buf:void ; len:Integer; flags:Integer; from:PSOCKADDR; fromlen:PInteger):Integer; stdcall;
begin
{*
 0059B8B4    push        ebp
 0059B8B5    mov         ebp,esp
 0059B8B7    add         esp,0FFFFFFF0
 0059B8BA    push        ebx
 0059B8BB    xor         eax,eax
 0059B8BD    mov         dword ptr [ebp-10],eax
 0059B8C0    mov         dword ptr [ebp-4],eax
 0059B8C3    xor         eax,eax
 0059B8C5    push        ebp
 0059B8C6    push        59B9A5
 0059B8CB    push        dword ptr fs:[eax]
 0059B8CE    mov         dword ptr fs:[eax],esp
 0059B8D1    mov         ebx,dword ptr ds:[789E68]
 0059B8D7    test        ebx,ebx
>0059B8D9    jne         0059B914
 0059B8DB    lea         edx,[ebp-4]
 0059B8DE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B8E3    call        LoadResString
 0059B8E8    mov         eax,dword ptr [ebp-4]
 0059B8EB    push        eax
 0059B8EC    mov         eax,59B9C4;'recvfrom'
 0059B8F1    mov         dword ptr [ebp-0C],eax
 0059B8F4    mov         byte ptr [ebp-8],11
 0059B8F8    lea         eax,[ebp-0C]
 0059B8FB    push        eax
 0059B8FC    push        0
 0059B8FE    mov         ecx,276D
 0059B903    mov         dl,1
 0059B905    mov         eax,[0059A068];EIdWinsockStubError
 0059B90A    call        EIdWinsockStubError.Build
 0059B90F    call        @RaiseExcept
 0059B914    mov         eax,59B9C4;'recvfrom'
 0059B919    call        @UStrToPWChar
 0059B91E    push        eax
 0059B91F    push        ebx
 0059B920    call        GetProcAddress
 0059B925    test        eax,eax
>0059B927    jne         0059B962
 0059B929    lea         edx,[ebp-10]
 0059B92C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059B931    call        LoadResString
 0059B936    mov         eax,dword ptr [ebp-10]
 0059B939    push        eax
 0059B93A    mov         eax,59B9C4;'recvfrom'
 0059B93F    mov         dword ptr [ebp-0C],eax
 0059B942    mov         byte ptr [ebp-8],11
 0059B946    lea         eax,[ebp-0C]
 0059B949    push        eax
 0059B94A    push        0
 0059B94C    mov         ecx,2726
 0059B951    mov         dl,1
 0059B953    mov         eax,[0059A068];EIdWinsockStubError
 0059B958    call        EIdWinsockStubError.Build
 0059B95D    call        @RaiseExcept
 0059B962    mov         [00789CD0],eax
 0059B967    mov         eax,dword ptr [ebp+1C]
 0059B96A    push        eax
 0059B96B    mov         eax,dword ptr [ebp+18]
 0059B96E    push        eax
 0059B96F    mov         eax,dword ptr [ebp+14]
 0059B972    push        eax
 0059B973    mov         eax,dword ptr [ebp+10]
 0059B976    push        eax
 0059B977    mov         eax,dword ptr [ebp+0C]
 0059B97A    push        eax
 0059B97B    mov         eax,dword ptr [ebp+8]
 0059B97E    push        eax
 0059B97F    call        dword ptr ds:[789CD0]
 0059B985    mov         ebx,eax
 0059B987    xor         eax,eax
 0059B989    pop         edx
 0059B98A    pop         ecx
 0059B98B    pop         ecx
 0059B98C    mov         dword ptr fs:[eax],edx
 0059B98F    push        59B9AC
 0059B994    lea         eax,[ebp-10]
 0059B997    call        @UStrClr
 0059B99C    lea         eax,[ebp-4]
 0059B99F    call        @UStrClr
 0059B9A4    ret
>0059B9A5    jmp         @HandleFinally
>0059B9AA    jmp         0059B994
 0059B9AC    mov         eax,ebx
 0059B9AE    pop         ebx
 0059B9AF    mov         esp,ebp
 0059B9B1    pop         ebp
 0059B9B2    ret         18
*}
end;

//0059B9D8
function Stub_select(nfds:Integer; readfds:PFDSet; writefds:PFDSet; exceptfds:PFDSet; timeout:PTimeVal):Integer; stdcall;
begin
{*
 0059B9D8    push        ebp
 0059B9D9    mov         ebp,esp
 0059B9DB    add         esp,0FFFFFFF0
 0059B9DE    push        ebx
 0059B9DF    xor         eax,eax
 0059B9E1    mov         dword ptr [ebp-10],eax
 0059B9E4    mov         dword ptr [ebp-4],eax
 0059B9E7    xor         eax,eax
 0059B9E9    push        ebp
 0059B9EA    push        59BAC5
 0059B9EF    push        dword ptr fs:[eax]
 0059B9F2    mov         dword ptr fs:[eax],esp
 0059B9F5    mov         ebx,dword ptr ds:[789E68]
 0059B9FB    test        ebx,ebx
>0059B9FD    jne         0059BA38
 0059B9FF    lea         edx,[ebp-4]
 0059BA02    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BA07    call        LoadResString
 0059BA0C    mov         eax,dword ptr [ebp-4]
 0059BA0F    push        eax
 0059BA10    mov         eax,59BAE4;'select'
 0059BA15    mov         dword ptr [ebp-0C],eax
 0059BA18    mov         byte ptr [ebp-8],11
 0059BA1C    lea         eax,[ebp-0C]
 0059BA1F    push        eax
 0059BA20    push        0
 0059BA22    mov         ecx,276D
 0059BA27    mov         dl,1
 0059BA29    mov         eax,[0059A068];EIdWinsockStubError
 0059BA2E    call        EIdWinsockStubError.Build
 0059BA33    call        @RaiseExcept
 0059BA38    mov         eax,59BAE4;'select'
 0059BA3D    call        @UStrToPWChar
 0059BA42    push        eax
 0059BA43    push        ebx
 0059BA44    call        GetProcAddress
 0059BA49    test        eax,eax
>0059BA4B    jne         0059BA86
 0059BA4D    lea         edx,[ebp-10]
 0059BA50    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BA55    call        LoadResString
 0059BA5A    mov         eax,dword ptr [ebp-10]
 0059BA5D    push        eax
 0059BA5E    mov         eax,59BAE4;'select'
 0059BA63    mov         dword ptr [ebp-0C],eax
 0059BA66    mov         byte ptr [ebp-8],11
 0059BA6A    lea         eax,[ebp-0C]
 0059BA6D    push        eax
 0059BA6E    push        0
 0059BA70    mov         ecx,2726
 0059BA75    mov         dl,1
 0059BA77    mov         eax,[0059A068];EIdWinsockStubError
 0059BA7C    call        EIdWinsockStubError.Build
 0059BA81    call        @RaiseExcept
 0059BA86    mov         [00789CD4],eax
 0059BA8B    mov         eax,dword ptr [ebp+18]
 0059BA8E    push        eax
 0059BA8F    mov         eax,dword ptr [ebp+14]
 0059BA92    push        eax
 0059BA93    mov         eax,dword ptr [ebp+10]
 0059BA96    push        eax
 0059BA97    mov         eax,dword ptr [ebp+0C]
 0059BA9A    push        eax
 0059BA9B    mov         eax,dword ptr [ebp+8]
 0059BA9E    push        eax
 0059BA9F    call        dword ptr ds:[789CD4]
 0059BAA5    mov         ebx,eax
 0059BAA7    xor         eax,eax
 0059BAA9    pop         edx
 0059BAAA    pop         ecx
 0059BAAB    pop         ecx
 0059BAAC    mov         dword ptr fs:[eax],edx
 0059BAAF    push        59BACC
 0059BAB4    lea         eax,[ebp-10]
 0059BAB7    call        @UStrClr
 0059BABC    lea         eax,[ebp-4]
 0059BABF    call        @UStrClr
 0059BAC4    ret
>0059BAC5    jmp         @HandleFinally
>0059BACA    jmp         0059BAB4
 0059BACC    mov         eax,ebx
 0059BACE    pop         ebx
 0059BACF    mov         esp,ebp
 0059BAD1    pop         ebp
 0059BAD2    ret         14
*}
end;

//0059BAF4
function Stub_send(const s:PtrUInt; const Buf:void ; len:Integer; flags:Integer):Integer; stdcall;
begin
{*
 0059BAF4    push        ebp
 0059BAF5    mov         ebp,esp
 0059BAF7    add         esp,0FFFFFFF0
 0059BAFA    push        ebx
 0059BAFB    xor         eax,eax
 0059BAFD    mov         dword ptr [ebp-10],eax
 0059BB00    mov         dword ptr [ebp-4],eax
 0059BB03    xor         eax,eax
 0059BB05    push        ebp
 0059BB06    push        59BBDD
 0059BB0B    push        dword ptr fs:[eax]
 0059BB0E    mov         dword ptr fs:[eax],esp
 0059BB11    mov         ebx,dword ptr ds:[789E68]
 0059BB17    test        ebx,ebx
>0059BB19    jne         0059BB54
 0059BB1B    lea         edx,[ebp-4]
 0059BB1E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BB23    call        LoadResString
 0059BB28    mov         eax,dword ptr [ebp-4]
 0059BB2B    push        eax
 0059BB2C    mov         eax,59BBFC;'send'
 0059BB31    mov         dword ptr [ebp-0C],eax
 0059BB34    mov         byte ptr [ebp-8],11
 0059BB38    lea         eax,[ebp-0C]
 0059BB3B    push        eax
 0059BB3C    push        0
 0059BB3E    mov         ecx,276D
 0059BB43    mov         dl,1
 0059BB45    mov         eax,[0059A068];EIdWinsockStubError
 0059BB4A    call        EIdWinsockStubError.Build
 0059BB4F    call        @RaiseExcept
 0059BB54    mov         eax,59BBFC;'send'
 0059BB59    call        @UStrToPWChar
 0059BB5E    push        eax
 0059BB5F    push        ebx
 0059BB60    call        GetProcAddress
 0059BB65    test        eax,eax
>0059BB67    jne         0059BBA2
 0059BB69    lea         edx,[ebp-10]
 0059BB6C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BB71    call        LoadResString
 0059BB76    mov         eax,dword ptr [ebp-10]
 0059BB79    push        eax
 0059BB7A    mov         eax,59BBFC;'send'
 0059BB7F    mov         dword ptr [ebp-0C],eax
 0059BB82    mov         byte ptr [ebp-8],11
 0059BB86    lea         eax,[ebp-0C]
 0059BB89    push        eax
 0059BB8A    push        0
 0059BB8C    mov         ecx,2726
 0059BB91    mov         dl,1
 0059BB93    mov         eax,[0059A068];EIdWinsockStubError
 0059BB98    call        EIdWinsockStubError.Build
 0059BB9D    call        @RaiseExcept
 0059BBA2    mov         [00789CD8],eax
 0059BBA7    mov         eax,dword ptr [ebp+14]
 0059BBAA    push        eax
 0059BBAB    mov         eax,dword ptr [ebp+10]
 0059BBAE    push        eax
 0059BBAF    mov         eax,dword ptr [ebp+0C]
 0059BBB2    push        eax
 0059BBB3    mov         eax,dword ptr [ebp+8]
 0059BBB6    push        eax
 0059BBB7    call        dword ptr ds:[789CD8]
 0059BBBD    mov         ebx,eax
 0059BBBF    xor         eax,eax
 0059BBC1    pop         edx
 0059BBC2    pop         ecx
 0059BBC3    pop         ecx
 0059BBC4    mov         dword ptr fs:[eax],edx
 0059BBC7    push        59BBE4
 0059BBCC    lea         eax,[ebp-10]
 0059BBCF    call        @UStrClr
 0059BBD4    lea         eax,[ebp-4]
 0059BBD7    call        @UStrClr
 0059BBDC    ret
>0059BBDD    jmp         @HandleFinally
>0059BBE2    jmp         0059BBCC
 0059BBE4    mov         eax,ebx
 0059BBE6    pop         ebx
 0059BBE7    mov         esp,ebp
 0059BBE9    pop         ebp
 0059BBEA    ret         10
*}
end;

//0059BC08
function Stub_sendto(const s:PtrUInt; const Buf:void ; const len:Integer; const flags:Integer; const addrto:PSOCKADDR; const tolen:Integer):Integer; stdcall;
begin
{*
 0059BC08    push        ebp
 0059BC09    mov         ebp,esp
 0059BC0B    add         esp,0FFFFFFF0
 0059BC0E    push        ebx
 0059BC0F    xor         eax,eax
 0059BC11    mov         dword ptr [ebp-10],eax
 0059BC14    mov         dword ptr [ebp-4],eax
 0059BC17    xor         eax,eax
 0059BC19    push        ebp
 0059BC1A    push        59BCF9
 0059BC1F    push        dword ptr fs:[eax]
 0059BC22    mov         dword ptr fs:[eax],esp
 0059BC25    mov         ebx,dword ptr ds:[789E68]
 0059BC2B    test        ebx,ebx
>0059BC2D    jne         0059BC68
 0059BC2F    lea         edx,[ebp-4]
 0059BC32    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BC37    call        LoadResString
 0059BC3C    mov         eax,dword ptr [ebp-4]
 0059BC3F    push        eax
 0059BC40    mov         eax,59BD18;'sendto'
 0059BC45    mov         dword ptr [ebp-0C],eax
 0059BC48    mov         byte ptr [ebp-8],11
 0059BC4C    lea         eax,[ebp-0C]
 0059BC4F    push        eax
 0059BC50    push        0
 0059BC52    mov         ecx,276D
 0059BC57    mov         dl,1
 0059BC59    mov         eax,[0059A068];EIdWinsockStubError
 0059BC5E    call        EIdWinsockStubError.Build
 0059BC63    call        @RaiseExcept
 0059BC68    mov         eax,59BD18;'sendto'
 0059BC6D    call        @UStrToPWChar
 0059BC72    push        eax
 0059BC73    push        ebx
 0059BC74    call        GetProcAddress
 0059BC79    test        eax,eax
>0059BC7B    jne         0059BCB6
 0059BC7D    lea         edx,[ebp-10]
 0059BC80    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BC85    call        LoadResString
 0059BC8A    mov         eax,dword ptr [ebp-10]
 0059BC8D    push        eax
 0059BC8E    mov         eax,59BD18;'sendto'
 0059BC93    mov         dword ptr [ebp-0C],eax
 0059BC96    mov         byte ptr [ebp-8],11
 0059BC9A    lea         eax,[ebp-0C]
 0059BC9D    push        eax
 0059BC9E    push        0
 0059BCA0    mov         ecx,2726
 0059BCA5    mov         dl,1
 0059BCA7    mov         eax,[0059A068];EIdWinsockStubError
 0059BCAC    call        EIdWinsockStubError.Build
 0059BCB1    call        @RaiseExcept
 0059BCB6    mov         [00789CDC],eax
 0059BCBB    mov         eax,dword ptr [ebp+1C]
 0059BCBE    push        eax
 0059BCBF    mov         eax,dword ptr [ebp+18]
 0059BCC2    push        eax
 0059BCC3    mov         eax,dword ptr [ebp+14]
 0059BCC6    push        eax
 0059BCC7    mov         eax,dword ptr [ebp+10]
 0059BCCA    push        eax
 0059BCCB    mov         eax,dword ptr [ebp+0C]
 0059BCCE    push        eax
 0059BCCF    mov         eax,dword ptr [ebp+8]
 0059BCD2    push        eax
 0059BCD3    call        dword ptr ds:[789CDC]
 0059BCD9    mov         ebx,eax
 0059BCDB    xor         eax,eax
 0059BCDD    pop         edx
 0059BCDE    pop         ecx
 0059BCDF    pop         ecx
 0059BCE0    mov         dword ptr fs:[eax],edx
 0059BCE3    push        59BD00
 0059BCE8    lea         eax,[ebp-10]
 0059BCEB    call        @UStrClr
 0059BCF0    lea         eax,[ebp-4]
 0059BCF3    call        @UStrClr
 0059BCF8    ret
>0059BCF9    jmp         @HandleFinally
>0059BCFE    jmp         0059BCE8
 0059BD00    mov         eax,ebx
 0059BD02    pop         ebx
 0059BD03    mov         esp,ebp
 0059BD05    pop         ebp
 0059BD06    ret         18
*}
end;

//0059BD28
function Stub_setsockopt(const s:PtrUInt; const level:Integer; const optname:Integer; optval:PAnsiChar; const optlen:Integer):Integer; stdcall;
begin
{*
 0059BD28    push        ebp
 0059BD29    mov         ebp,esp
 0059BD2B    add         esp,0FFFFFFF0
 0059BD2E    push        ebx
 0059BD2F    xor         eax,eax
 0059BD31    mov         dword ptr [ebp-10],eax
 0059BD34    mov         dword ptr [ebp-4],eax
 0059BD37    xor         eax,eax
 0059BD39    push        ebp
 0059BD3A    push        59BE15
 0059BD3F    push        dword ptr fs:[eax]
 0059BD42    mov         dword ptr fs:[eax],esp
 0059BD45    mov         ebx,dword ptr ds:[789E68]
 0059BD4B    test        ebx,ebx
>0059BD4D    jne         0059BD88
 0059BD4F    lea         edx,[ebp-4]
 0059BD52    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BD57    call        LoadResString
 0059BD5C    mov         eax,dword ptr [ebp-4]
 0059BD5F    push        eax
 0059BD60    mov         eax,59BE34;'setsockopt'
 0059BD65    mov         dword ptr [ebp-0C],eax
 0059BD68    mov         byte ptr [ebp-8],11
 0059BD6C    lea         eax,[ebp-0C]
 0059BD6F    push        eax
 0059BD70    push        0
 0059BD72    mov         ecx,276D
 0059BD77    mov         dl,1
 0059BD79    mov         eax,[0059A068];EIdWinsockStubError
 0059BD7E    call        EIdWinsockStubError.Build
 0059BD83    call        @RaiseExcept
 0059BD88    mov         eax,59BE34;'setsockopt'
 0059BD8D    call        @UStrToPWChar
 0059BD92    push        eax
 0059BD93    push        ebx
 0059BD94    call        GetProcAddress
 0059BD99    test        eax,eax
>0059BD9B    jne         0059BDD6
 0059BD9D    lea         edx,[ebp-10]
 0059BDA0    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BDA5    call        LoadResString
 0059BDAA    mov         eax,dword ptr [ebp-10]
 0059BDAD    push        eax
 0059BDAE    mov         eax,59BE34;'setsockopt'
 0059BDB3    mov         dword ptr [ebp-0C],eax
 0059BDB6    mov         byte ptr [ebp-8],11
 0059BDBA    lea         eax,[ebp-0C]
 0059BDBD    push        eax
 0059BDBE    push        0
 0059BDC0    mov         ecx,2726
 0059BDC5    mov         dl,1
 0059BDC7    mov         eax,[0059A068];EIdWinsockStubError
 0059BDCC    call        EIdWinsockStubError.Build
 0059BDD1    call        @RaiseExcept
 0059BDD6    mov         [00789CE0],eax
 0059BDDB    mov         eax,dword ptr [ebp+18]
 0059BDDE    push        eax
 0059BDDF    mov         eax,dword ptr [ebp+14]
 0059BDE2    push        eax
 0059BDE3    mov         eax,dword ptr [ebp+10]
 0059BDE6    push        eax
 0059BDE7    mov         eax,dword ptr [ebp+0C]
 0059BDEA    push        eax
 0059BDEB    mov         eax,dword ptr [ebp+8]
 0059BDEE    push        eax
 0059BDEF    call        dword ptr ds:[789CE0]
 0059BDF5    mov         ebx,eax
 0059BDF7    xor         eax,eax
 0059BDF9    pop         edx
 0059BDFA    pop         ecx
 0059BDFB    pop         ecx
 0059BDFC    mov         dword ptr fs:[eax],edx
 0059BDFF    push        59BE1C
 0059BE04    lea         eax,[ebp-10]
 0059BE07    call        @UStrClr
 0059BE0C    lea         eax,[ebp-4]
 0059BE0F    call        @UStrClr
 0059BE14    ret
>0059BE15    jmp         @HandleFinally
>0059BE1A    jmp         0059BE04
 0059BE1C    mov         eax,ebx
 0059BE1E    pop         ebx
 0059BE1F    mov         esp,ebp
 0059BE21    pop         ebp
 0059BE22    ret         14
*}
end;

//0059BE4C
function Stub_shutdown(const s:PtrUInt; const how:Integer):Integer; stdcall;
begin
{*
 0059BE4C    push        ebp
 0059BE4D    mov         ebp,esp
 0059BE4F    add         esp,0FFFFFFF0
 0059BE52    push        ebx
 0059BE53    xor         eax,eax
 0059BE55    mov         dword ptr [ebp-10],eax
 0059BE58    mov         dword ptr [ebp-4],eax
 0059BE5B    xor         eax,eax
 0059BE5D    push        ebp
 0059BE5E    push        59BF2D
 0059BE63    push        dword ptr fs:[eax]
 0059BE66    mov         dword ptr fs:[eax],esp
 0059BE69    mov         ebx,dword ptr ds:[789E68]
 0059BE6F    test        ebx,ebx
>0059BE71    jne         0059BEAC
 0059BE73    lea         edx,[ebp-4]
 0059BE76    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BE7B    call        LoadResString
 0059BE80    mov         eax,dword ptr [ebp-4]
 0059BE83    push        eax
 0059BE84    mov         eax,59BF4C;'shutdown'
 0059BE89    mov         dword ptr [ebp-0C],eax
 0059BE8C    mov         byte ptr [ebp-8],11
 0059BE90    lea         eax,[ebp-0C]
 0059BE93    push        eax
 0059BE94    push        0
 0059BE96    mov         ecx,276D
 0059BE9B    mov         dl,1
 0059BE9D    mov         eax,[0059A068];EIdWinsockStubError
 0059BEA2    call        EIdWinsockStubError.Build
 0059BEA7    call        @RaiseExcept
 0059BEAC    mov         eax,59BF4C;'shutdown'
 0059BEB1    call        @UStrToPWChar
 0059BEB6    push        eax
 0059BEB7    push        ebx
 0059BEB8    call        GetProcAddress
 0059BEBD    test        eax,eax
>0059BEBF    jne         0059BEFA
 0059BEC1    lea         edx,[ebp-10]
 0059BEC4    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BEC9    call        LoadResString
 0059BECE    mov         eax,dword ptr [ebp-10]
 0059BED1    push        eax
 0059BED2    mov         eax,59BF4C;'shutdown'
 0059BED7    mov         dword ptr [ebp-0C],eax
 0059BEDA    mov         byte ptr [ebp-8],11
 0059BEDE    lea         eax,[ebp-0C]
 0059BEE1    push        eax
 0059BEE2    push        0
 0059BEE4    mov         ecx,2726
 0059BEE9    mov         dl,1
 0059BEEB    mov         eax,[0059A068];EIdWinsockStubError
 0059BEF0    call        EIdWinsockStubError.Build
 0059BEF5    call        @RaiseExcept
 0059BEFA    mov         [00789CE4],eax
 0059BEFF    mov         eax,dword ptr [ebp+0C]
 0059BF02    push        eax
 0059BF03    mov         eax,dword ptr [ebp+8]
 0059BF06    push        eax
 0059BF07    call        dword ptr ds:[789CE4]
 0059BF0D    mov         ebx,eax
 0059BF0F    xor         eax,eax
 0059BF11    pop         edx
 0059BF12    pop         ecx
 0059BF13    pop         ecx
 0059BF14    mov         dword ptr fs:[eax],edx
 0059BF17    push        59BF34
 0059BF1C    lea         eax,[ebp-10]
 0059BF1F    call        @UStrClr
 0059BF24    lea         eax,[ebp-4]
 0059BF27    call        @UStrClr
 0059BF2C    ret
>0059BF2D    jmp         @HandleFinally
>0059BF32    jmp         0059BF1C
 0059BF34    mov         eax,ebx
 0059BF36    pop         ebx
 0059BF37    mov         esp,ebp
 0059BF39    pop         ebp
 0059BF3A    ret         8
*}
end;

//0059BF60
function Stub_socket(const af:Integer; const istruct:Integer; const protocol:Integer):PtrUInt; stdcall;
begin
{*
 0059BF60    push        ebp
 0059BF61    mov         ebp,esp
 0059BF63    add         esp,0FFFFFFF0
 0059BF66    push        ebx
 0059BF67    xor         eax,eax
 0059BF69    mov         dword ptr [ebp-10],eax
 0059BF6C    mov         dword ptr [ebp-4],eax
 0059BF6F    xor         eax,eax
 0059BF71    push        ebp
 0059BF72    push        59C045
 0059BF77    push        dword ptr fs:[eax]
 0059BF7A    mov         dword ptr fs:[eax],esp
 0059BF7D    mov         ebx,dword ptr ds:[789E68]
 0059BF83    test        ebx,ebx
>0059BF85    jne         0059BFC0
 0059BF87    lea         edx,[ebp-4]
 0059BF8A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BF8F    call        LoadResString
 0059BF94    mov         eax,dword ptr [ebp-4]
 0059BF97    push        eax
 0059BF98    mov         eax,59C064;'socket'
 0059BF9D    mov         dword ptr [ebp-0C],eax
 0059BFA0    mov         byte ptr [ebp-8],11
 0059BFA4    lea         eax,[ebp-0C]
 0059BFA7    push        eax
 0059BFA8    push        0
 0059BFAA    mov         ecx,276D
 0059BFAF    mov         dl,1
 0059BFB1    mov         eax,[0059A068];EIdWinsockStubError
 0059BFB6    call        EIdWinsockStubError.Build
 0059BFBB    call        @RaiseExcept
 0059BFC0    mov         eax,59C064;'socket'
 0059BFC5    call        @UStrToPWChar
 0059BFCA    push        eax
 0059BFCB    push        ebx
 0059BFCC    call        GetProcAddress
 0059BFD1    test        eax,eax
>0059BFD3    jne         0059C00E
 0059BFD5    lea         edx,[ebp-10]
 0059BFD8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059BFDD    call        LoadResString
 0059BFE2    mov         eax,dword ptr [ebp-10]
 0059BFE5    push        eax
 0059BFE6    mov         eax,59C064;'socket'
 0059BFEB    mov         dword ptr [ebp-0C],eax
 0059BFEE    mov         byte ptr [ebp-8],11
 0059BFF2    lea         eax,[ebp-0C]
 0059BFF5    push        eax
 0059BFF6    push        0
 0059BFF8    mov         ecx,2726
 0059BFFD    mov         dl,1
 0059BFFF    mov         eax,[0059A068];EIdWinsockStubError
 0059C004    call        EIdWinsockStubError.Build
 0059C009    call        @RaiseExcept
 0059C00E    mov         [00789CE8],eax
 0059C013    mov         eax,dword ptr [ebp+10]
 0059C016    push        eax
 0059C017    mov         eax,dword ptr [ebp+0C]
 0059C01A    push        eax
 0059C01B    mov         eax,dword ptr [ebp+8]
 0059C01E    push        eax
 0059C01F    call        dword ptr ds:[789CE8]
 0059C025    mov         ebx,eax
 0059C027    xor         eax,eax
 0059C029    pop         edx
 0059C02A    pop         ecx
 0059C02B    pop         ecx
 0059C02C    mov         dword ptr fs:[eax],edx
 0059C02F    push        59C04C
 0059C034    lea         eax,[ebp-10]
 0059C037    call        @UStrClr
 0059C03C    lea         eax,[ebp-4]
 0059C03F    call        @UStrClr
 0059C044    ret
>0059C045    jmp         @HandleFinally
>0059C04A    jmp         0059C034
 0059C04C    mov         eax,ebx
 0059C04E    pop         ebx
 0059C04F    mov         esp,ebp
 0059C051    pop         ebp
 0059C052    ret         0C
*}
end;

//0059C074
function Stub_gethostbyaddr(AAddr:Pointer; const len:Integer; const addrtype:Integer):PHostEnt; stdcall;
begin
{*
 0059C074    push        ebp
 0059C075    mov         ebp,esp
 0059C077    add         esp,0FFFFFFF0
 0059C07A    push        ebx
 0059C07B    xor         eax,eax
 0059C07D    mov         dword ptr [ebp-10],eax
 0059C080    mov         dword ptr [ebp-4],eax
 0059C083    xor         eax,eax
 0059C085    push        ebp
 0059C086    push        59C159
 0059C08B    push        dword ptr fs:[eax]
 0059C08E    mov         dword ptr fs:[eax],esp
 0059C091    mov         ebx,dword ptr ds:[789E68]
 0059C097    test        ebx,ebx
>0059C099    jne         0059C0D4
 0059C09B    lea         edx,[ebp-4]
 0059C09E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C0A3    call        LoadResString
 0059C0A8    mov         eax,dword ptr [ebp-4]
 0059C0AB    push        eax
 0059C0AC    mov         eax,59C178;'gethostbyaddr'
 0059C0B1    mov         dword ptr [ebp-0C],eax
 0059C0B4    mov         byte ptr [ebp-8],11
 0059C0B8    lea         eax,[ebp-0C]
 0059C0BB    push        eax
 0059C0BC    push        0
 0059C0BE    mov         ecx,276D
 0059C0C3    mov         dl,1
 0059C0C5    mov         eax,[0059A068];EIdWinsockStubError
 0059C0CA    call        EIdWinsockStubError.Build
 0059C0CF    call        @RaiseExcept
 0059C0D4    mov         eax,59C178;'gethostbyaddr'
 0059C0D9    call        @UStrToPWChar
 0059C0DE    push        eax
 0059C0DF    push        ebx
 0059C0E0    call        GetProcAddress
 0059C0E5    test        eax,eax
>0059C0E7    jne         0059C122
 0059C0E9    lea         edx,[ebp-10]
 0059C0EC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C0F1    call        LoadResString
 0059C0F6    mov         eax,dword ptr [ebp-10]
 0059C0F9    push        eax
 0059C0FA    mov         eax,59C178;'gethostbyaddr'
 0059C0FF    mov         dword ptr [ebp-0C],eax
 0059C102    mov         byte ptr [ebp-8],11
 0059C106    lea         eax,[ebp-0C]
 0059C109    push        eax
 0059C10A    push        0
 0059C10C    mov         ecx,2726
 0059C111    mov         dl,1
 0059C113    mov         eax,[0059A068];EIdWinsockStubError
 0059C118    call        EIdWinsockStubError.Build
 0059C11D    call        @RaiseExcept
 0059C122    mov         [00789CEC],eax
 0059C127    mov         eax,dword ptr [ebp+10]
 0059C12A    push        eax
 0059C12B    mov         eax,dword ptr [ebp+0C]
 0059C12E    push        eax
 0059C12F    mov         eax,dword ptr [ebp+8]
 0059C132    push        eax
 0059C133    call        dword ptr ds:[789CEC]
 0059C139    mov         ebx,eax
 0059C13B    xor         eax,eax
 0059C13D    pop         edx
 0059C13E    pop         ecx
 0059C13F    pop         ecx
 0059C140    mov         dword ptr fs:[eax],edx
 0059C143    push        59C160
 0059C148    lea         eax,[ebp-10]
 0059C14B    call        @UStrClr
 0059C150    lea         eax,[ebp-4]
 0059C153    call        @UStrClr
 0059C158    ret
>0059C159    jmp         @HandleFinally
>0059C15E    jmp         0059C148
 0059C160    mov         eax,ebx
 0059C162    pop         ebx
 0059C163    mov         esp,ebp
 0059C165    pop         ebp
 0059C166    ret         0C
*}
end;

//0059C194
function Stub_gethostbyname(name:PAnsiChar):PHostEnt; stdcall;
begin
{*
 0059C194    push        ebp
 0059C195    mov         ebp,esp
 0059C197    add         esp,0FFFFFFF0
 0059C19A    push        ebx
 0059C19B    xor         eax,eax
 0059C19D    mov         dword ptr [ebp-10],eax
 0059C1A0    mov         dword ptr [ebp-4],eax
 0059C1A3    xor         eax,eax
 0059C1A5    push        ebp
 0059C1A6    push        59C271
 0059C1AB    push        dword ptr fs:[eax]
 0059C1AE    mov         dword ptr fs:[eax],esp
 0059C1B1    mov         ebx,dword ptr ds:[789E68]
 0059C1B7    test        ebx,ebx
>0059C1B9    jne         0059C1F4
 0059C1BB    lea         edx,[ebp-4]
 0059C1BE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C1C3    call        LoadResString
 0059C1C8    mov         eax,dword ptr [ebp-4]
 0059C1CB    push        eax
 0059C1CC    mov         eax,59C290;'gethostbyname'
 0059C1D1    mov         dword ptr [ebp-0C],eax
 0059C1D4    mov         byte ptr [ebp-8],11
 0059C1D8    lea         eax,[ebp-0C]
 0059C1DB    push        eax
 0059C1DC    push        0
 0059C1DE    mov         ecx,276D
 0059C1E3    mov         dl,1
 0059C1E5    mov         eax,[0059A068];EIdWinsockStubError
 0059C1EA    call        EIdWinsockStubError.Build
 0059C1EF    call        @RaiseExcept
 0059C1F4    mov         eax,59C290;'gethostbyname'
 0059C1F9    call        @UStrToPWChar
 0059C1FE    push        eax
 0059C1FF    push        ebx
 0059C200    call        GetProcAddress
 0059C205    test        eax,eax
>0059C207    jne         0059C242
 0059C209    lea         edx,[ebp-10]
 0059C20C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C211    call        LoadResString
 0059C216    mov         eax,dword ptr [ebp-10]
 0059C219    push        eax
 0059C21A    mov         eax,59C290;'gethostbyname'
 0059C21F    mov         dword ptr [ebp-0C],eax
 0059C222    mov         byte ptr [ebp-8],11
 0059C226    lea         eax,[ebp-0C]
 0059C229    push        eax
 0059C22A    push        0
 0059C22C    mov         ecx,2726
 0059C231    mov         dl,1
 0059C233    mov         eax,[0059A068];EIdWinsockStubError
 0059C238    call        EIdWinsockStubError.Build
 0059C23D    call        @RaiseExcept
 0059C242    mov         [00789CF0],eax
 0059C247    mov         eax,dword ptr [ebp+8]
 0059C24A    push        eax
 0059C24B    call        dword ptr ds:[789CF0]
 0059C251    mov         ebx,eax
 0059C253    xor         eax,eax
 0059C255    pop         edx
 0059C256    pop         ecx
 0059C257    pop         ecx
 0059C258    mov         dword ptr fs:[eax],edx
 0059C25B    push        59C278
 0059C260    lea         eax,[ebp-10]
 0059C263    call        @UStrClr
 0059C268    lea         eax,[ebp-4]
 0059C26B    call        @UStrClr
 0059C270    ret
>0059C271    jmp         @HandleFinally
>0059C276    jmp         0059C260
 0059C278    mov         eax,ebx
 0059C27A    pop         ebx
 0059C27B    mov         esp,ebp
 0059C27D    pop         ebp
 0059C27E    ret         4
*}
end;

//0059C2AC
function Stub_gethostname(name:PAnsiChar; len:Integer):Integer; stdcall;
begin
{*
 0059C2AC    push        ebp
 0059C2AD    mov         ebp,esp
 0059C2AF    add         esp,0FFFFFFF0
 0059C2B2    push        ebx
 0059C2B3    xor         eax,eax
 0059C2B5    mov         dword ptr [ebp-10],eax
 0059C2B8    mov         dword ptr [ebp-4],eax
 0059C2BB    xor         eax,eax
 0059C2BD    push        ebp
 0059C2BE    push        59C38D
 0059C2C3    push        dword ptr fs:[eax]
 0059C2C6    mov         dword ptr fs:[eax],esp
 0059C2C9    mov         ebx,dword ptr ds:[789E68]
 0059C2CF    test        ebx,ebx
>0059C2D1    jne         0059C30C
 0059C2D3    lea         edx,[ebp-4]
 0059C2D6    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C2DB    call        LoadResString
 0059C2E0    mov         eax,dword ptr [ebp-4]
 0059C2E3    push        eax
 0059C2E4    mov         eax,59C3AC;'gethostname'
 0059C2E9    mov         dword ptr [ebp-0C],eax
 0059C2EC    mov         byte ptr [ebp-8],11
 0059C2F0    lea         eax,[ebp-0C]
 0059C2F3    push        eax
 0059C2F4    push        0
 0059C2F6    mov         ecx,276D
 0059C2FB    mov         dl,1
 0059C2FD    mov         eax,[0059A068];EIdWinsockStubError
 0059C302    call        EIdWinsockStubError.Build
 0059C307    call        @RaiseExcept
 0059C30C    mov         eax,59C3AC;'gethostname'
 0059C311    call        @UStrToPWChar
 0059C316    push        eax
 0059C317    push        ebx
 0059C318    call        GetProcAddress
 0059C31D    test        eax,eax
>0059C31F    jne         0059C35A
 0059C321    lea         edx,[ebp-10]
 0059C324    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C329    call        LoadResString
 0059C32E    mov         eax,dword ptr [ebp-10]
 0059C331    push        eax
 0059C332    mov         eax,59C3AC;'gethostname'
 0059C337    mov         dword ptr [ebp-0C],eax
 0059C33A    mov         byte ptr [ebp-8],11
 0059C33E    lea         eax,[ebp-0C]
 0059C341    push        eax
 0059C342    push        0
 0059C344    mov         ecx,2726
 0059C349    mov         dl,1
 0059C34B    mov         eax,[0059A068];EIdWinsockStubError
 0059C350    call        EIdWinsockStubError.Build
 0059C355    call        @RaiseExcept
 0059C35A    mov         [00789CF4],eax
 0059C35F    mov         eax,dword ptr [ebp+0C]
 0059C362    push        eax
 0059C363    mov         eax,dword ptr [ebp+8]
 0059C366    push        eax
 0059C367    call        dword ptr ds:[789CF4]
 0059C36D    mov         ebx,eax
 0059C36F    xor         eax,eax
 0059C371    pop         edx
 0059C372    pop         ecx
 0059C373    pop         ecx
 0059C374    mov         dword ptr fs:[eax],edx
 0059C377    push        59C394
 0059C37C    lea         eax,[ebp-10]
 0059C37F    call        @UStrClr
 0059C384    lea         eax,[ebp-4]
 0059C387    call        @UStrClr
 0059C38C    ret
>0059C38D    jmp         @HandleFinally
>0059C392    jmp         0059C37C
 0059C394    mov         eax,ebx
 0059C396    pop         ebx
 0059C397    mov         esp,ebp
 0059C399    pop         ebp
 0059C39A    ret         8
*}
end;

//0059C3C4
function Stub_getservbyport(const port:Integer; const proto:PAnsiChar):PServEnt; stdcall;
begin
{*
 0059C3C4    push        ebp
 0059C3C5    mov         ebp,esp
 0059C3C7    add         esp,0FFFFFFF0
 0059C3CA    push        ebx
 0059C3CB    xor         eax,eax
 0059C3CD    mov         dword ptr [ebp-10],eax
 0059C3D0    mov         dword ptr [ebp-4],eax
 0059C3D3    xor         eax,eax
 0059C3D5    push        ebp
 0059C3D6    push        59C4A5
 0059C3DB    push        dword ptr fs:[eax]
 0059C3DE    mov         dword ptr fs:[eax],esp
 0059C3E1    mov         ebx,dword ptr ds:[789E68]
 0059C3E7    test        ebx,ebx
>0059C3E9    jne         0059C424
 0059C3EB    lea         edx,[ebp-4]
 0059C3EE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C3F3    call        LoadResString
 0059C3F8    mov         eax,dword ptr [ebp-4]
 0059C3FB    push        eax
 0059C3FC    mov         eax,59C4C4;'getservbyport'
 0059C401    mov         dword ptr [ebp-0C],eax
 0059C404    mov         byte ptr [ebp-8],11
 0059C408    lea         eax,[ebp-0C]
 0059C40B    push        eax
 0059C40C    push        0
 0059C40E    mov         ecx,276D
 0059C413    mov         dl,1
 0059C415    mov         eax,[0059A068];EIdWinsockStubError
 0059C41A    call        EIdWinsockStubError.Build
 0059C41F    call        @RaiseExcept
 0059C424    mov         eax,59C4C4;'getservbyport'
 0059C429    call        @UStrToPWChar
 0059C42E    push        eax
 0059C42F    push        ebx
 0059C430    call        GetProcAddress
 0059C435    test        eax,eax
>0059C437    jne         0059C472
 0059C439    lea         edx,[ebp-10]
 0059C43C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C441    call        LoadResString
 0059C446    mov         eax,dword ptr [ebp-10]
 0059C449    push        eax
 0059C44A    mov         eax,59C4C4;'getservbyport'
 0059C44F    mov         dword ptr [ebp-0C],eax
 0059C452    mov         byte ptr [ebp-8],11
 0059C456    lea         eax,[ebp-0C]
 0059C459    push        eax
 0059C45A    push        0
 0059C45C    mov         ecx,2726
 0059C461    mov         dl,1
 0059C463    mov         eax,[0059A068];EIdWinsockStubError
 0059C468    call        EIdWinsockStubError.Build
 0059C46D    call        @RaiseExcept
 0059C472    mov         [00789CF8],eax
 0059C477    mov         eax,dword ptr [ebp+0C]
 0059C47A    push        eax
 0059C47B    mov         eax,dword ptr [ebp+8]
 0059C47E    push        eax
 0059C47F    call        dword ptr ds:[789CF8]
 0059C485    mov         ebx,eax
 0059C487    xor         eax,eax
 0059C489    pop         edx
 0059C48A    pop         ecx
 0059C48B    pop         ecx
 0059C48C    mov         dword ptr fs:[eax],edx
 0059C48F    push        59C4AC
 0059C494    lea         eax,[ebp-10]
 0059C497    call        @UStrClr
 0059C49C    lea         eax,[ebp-4]
 0059C49F    call        @UStrClr
 0059C4A4    ret
>0059C4A5    jmp         @HandleFinally
>0059C4AA    jmp         0059C494
 0059C4AC    mov         eax,ebx
 0059C4AE    pop         ebx
 0059C4AF    mov         esp,ebp
 0059C4B1    pop         ebp
 0059C4B2    ret         8
*}
end;

//0059C4E0
function Stub_getservbyname(const name:PAnsiChar; const proto:PAnsiChar):PServEnt; stdcall;
begin
{*
 0059C4E0    push        ebp
 0059C4E1    mov         ebp,esp
 0059C4E3    add         esp,0FFFFFFF0
 0059C4E6    push        ebx
 0059C4E7    xor         eax,eax
 0059C4E9    mov         dword ptr [ebp-10],eax
 0059C4EC    mov         dword ptr [ebp-4],eax
 0059C4EF    xor         eax,eax
 0059C4F1    push        ebp
 0059C4F2    push        59C5C1
 0059C4F7    push        dword ptr fs:[eax]
 0059C4FA    mov         dword ptr fs:[eax],esp
 0059C4FD    mov         ebx,dword ptr ds:[789E68]
 0059C503    test        ebx,ebx
>0059C505    jne         0059C540
 0059C507    lea         edx,[ebp-4]
 0059C50A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C50F    call        LoadResString
 0059C514    mov         eax,dword ptr [ebp-4]
 0059C517    push        eax
 0059C518    mov         eax,59C5E0;'getservbyname'
 0059C51D    mov         dword ptr [ebp-0C],eax
 0059C520    mov         byte ptr [ebp-8],11
 0059C524    lea         eax,[ebp-0C]
 0059C527    push        eax
 0059C528    push        0
 0059C52A    mov         ecx,276D
 0059C52F    mov         dl,1
 0059C531    mov         eax,[0059A068];EIdWinsockStubError
 0059C536    call        EIdWinsockStubError.Build
 0059C53B    call        @RaiseExcept
 0059C540    mov         eax,59C5E0;'getservbyname'
 0059C545    call        @UStrToPWChar
 0059C54A    push        eax
 0059C54B    push        ebx
 0059C54C    call        GetProcAddress
 0059C551    test        eax,eax
>0059C553    jne         0059C58E
 0059C555    lea         edx,[ebp-10]
 0059C558    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C55D    call        LoadResString
 0059C562    mov         eax,dword ptr [ebp-10]
 0059C565    push        eax
 0059C566    mov         eax,59C5E0;'getservbyname'
 0059C56B    mov         dword ptr [ebp-0C],eax
 0059C56E    mov         byte ptr [ebp-8],11
 0059C572    lea         eax,[ebp-0C]
 0059C575    push        eax
 0059C576    push        0
 0059C578    mov         ecx,2726
 0059C57D    mov         dl,1
 0059C57F    mov         eax,[0059A068];EIdWinsockStubError
 0059C584    call        EIdWinsockStubError.Build
 0059C589    call        @RaiseExcept
 0059C58E    mov         [00789CFC],eax
 0059C593    mov         eax,dword ptr [ebp+0C]
 0059C596    push        eax
 0059C597    mov         eax,dword ptr [ebp+8]
 0059C59A    push        eax
 0059C59B    call        dword ptr ds:[789CFC]
 0059C5A1    mov         ebx,eax
 0059C5A3    xor         eax,eax
 0059C5A5    pop         edx
 0059C5A6    pop         ecx
 0059C5A7    pop         ecx
 0059C5A8    mov         dword ptr fs:[eax],edx
 0059C5AB    push        59C5C8
 0059C5B0    lea         eax,[ebp-10]
 0059C5B3    call        @UStrClr
 0059C5B8    lea         eax,[ebp-4]
 0059C5BB    call        @UStrClr
 0059C5C0    ret
>0059C5C1    jmp         @HandleFinally
>0059C5C6    jmp         0059C5B0
 0059C5C8    mov         eax,ebx
 0059C5CA    pop         ebx
 0059C5CB    mov         esp,ebp
 0059C5CD    pop         ebp
 0059C5CE    ret         8
*}
end;

//0059C5FC
function Stub_getprotobynumber(const proto:Integer):PProtoEnt; stdcall;
begin
{*
 0059C5FC    push        ebp
 0059C5FD    mov         ebp,esp
 0059C5FF    add         esp,0FFFFFFF0
 0059C602    push        ebx
 0059C603    xor         eax,eax
 0059C605    mov         dword ptr [ebp-10],eax
 0059C608    mov         dword ptr [ebp-4],eax
 0059C60B    xor         eax,eax
 0059C60D    push        ebp
 0059C60E    push        59C6D9
 0059C613    push        dword ptr fs:[eax]
 0059C616    mov         dword ptr fs:[eax],esp
 0059C619    mov         ebx,dword ptr ds:[789E68]
 0059C61F    test        ebx,ebx
>0059C621    jne         0059C65C
 0059C623    lea         edx,[ebp-4]
 0059C626    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C62B    call        LoadResString
 0059C630    mov         eax,dword ptr [ebp-4]
 0059C633    push        eax
 0059C634    mov         eax,59C6F8;'getprotobynumber'
 0059C639    mov         dword ptr [ebp-0C],eax
 0059C63C    mov         byte ptr [ebp-8],11
 0059C640    lea         eax,[ebp-0C]
 0059C643    push        eax
 0059C644    push        0
 0059C646    mov         ecx,276D
 0059C64B    mov         dl,1
 0059C64D    mov         eax,[0059A068];EIdWinsockStubError
 0059C652    call        EIdWinsockStubError.Build
 0059C657    call        @RaiseExcept
 0059C65C    mov         eax,59C6F8;'getprotobynumber'
 0059C661    call        @UStrToPWChar
 0059C666    push        eax
 0059C667    push        ebx
 0059C668    call        GetProcAddress
 0059C66D    test        eax,eax
>0059C66F    jne         0059C6AA
 0059C671    lea         edx,[ebp-10]
 0059C674    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C679    call        LoadResString
 0059C67E    mov         eax,dword ptr [ebp-10]
 0059C681    push        eax
 0059C682    mov         eax,59C6F8;'getprotobynumber'
 0059C687    mov         dword ptr [ebp-0C],eax
 0059C68A    mov         byte ptr [ebp-8],11
 0059C68E    lea         eax,[ebp-0C]
 0059C691    push        eax
 0059C692    push        0
 0059C694    mov         ecx,2726
 0059C699    mov         dl,1
 0059C69B    mov         eax,[0059A068];EIdWinsockStubError
 0059C6A0    call        EIdWinsockStubError.Build
 0059C6A5    call        @RaiseExcept
 0059C6AA    mov         [00789D00],eax
 0059C6AF    mov         eax,dword ptr [ebp+8]
 0059C6B2    push        eax
 0059C6B3    call        dword ptr ds:[789D00]
 0059C6B9    mov         ebx,eax
 0059C6BB    xor         eax,eax
 0059C6BD    pop         edx
 0059C6BE    pop         ecx
 0059C6BF    pop         ecx
 0059C6C0    mov         dword ptr fs:[eax],edx
 0059C6C3    push        59C6E0
 0059C6C8    lea         eax,[ebp-10]
 0059C6CB    call        @UStrClr
 0059C6D0    lea         eax,[ebp-4]
 0059C6D3    call        @UStrClr
 0059C6D8    ret
>0059C6D9    jmp         @HandleFinally
>0059C6DE    jmp         0059C6C8
 0059C6E0    mov         eax,ebx
 0059C6E2    pop         ebx
 0059C6E3    mov         esp,ebp
 0059C6E5    pop         ebp
 0059C6E6    ret         4
*}
end;

//0059C71C
function Stub_getprotobyname(const name:PAnsiChar):PProtoEnt; stdcall;
begin
{*
 0059C71C    push        ebp
 0059C71D    mov         ebp,esp
 0059C71F    add         esp,0FFFFFFF0
 0059C722    push        ebx
 0059C723    xor         eax,eax
 0059C725    mov         dword ptr [ebp-10],eax
 0059C728    mov         dword ptr [ebp-4],eax
 0059C72B    xor         eax,eax
 0059C72D    push        ebp
 0059C72E    push        59C7F9
 0059C733    push        dword ptr fs:[eax]
 0059C736    mov         dword ptr fs:[eax],esp
 0059C739    mov         ebx,dword ptr ds:[789E68]
 0059C73F    test        ebx,ebx
>0059C741    jne         0059C77C
 0059C743    lea         edx,[ebp-4]
 0059C746    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C74B    call        LoadResString
 0059C750    mov         eax,dword ptr [ebp-4]
 0059C753    push        eax
 0059C754    mov         eax,59C818;'getprotobyname'
 0059C759    mov         dword ptr [ebp-0C],eax
 0059C75C    mov         byte ptr [ebp-8],11
 0059C760    lea         eax,[ebp-0C]
 0059C763    push        eax
 0059C764    push        0
 0059C766    mov         ecx,276D
 0059C76B    mov         dl,1
 0059C76D    mov         eax,[0059A068];EIdWinsockStubError
 0059C772    call        EIdWinsockStubError.Build
 0059C777    call        @RaiseExcept
 0059C77C    mov         eax,59C818;'getprotobyname'
 0059C781    call        @UStrToPWChar
 0059C786    push        eax
 0059C787    push        ebx
 0059C788    call        GetProcAddress
 0059C78D    test        eax,eax
>0059C78F    jne         0059C7CA
 0059C791    lea         edx,[ebp-10]
 0059C794    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C799    call        LoadResString
 0059C79E    mov         eax,dword ptr [ebp-10]
 0059C7A1    push        eax
 0059C7A2    mov         eax,59C818;'getprotobyname'
 0059C7A7    mov         dword ptr [ebp-0C],eax
 0059C7AA    mov         byte ptr [ebp-8],11
 0059C7AE    lea         eax,[ebp-0C]
 0059C7B1    push        eax
 0059C7B2    push        0
 0059C7B4    mov         ecx,2726
 0059C7B9    mov         dl,1
 0059C7BB    mov         eax,[0059A068];EIdWinsockStubError
 0059C7C0    call        EIdWinsockStubError.Build
 0059C7C5    call        @RaiseExcept
 0059C7CA    mov         [00789D04],eax
 0059C7CF    mov         eax,dword ptr [ebp+8]
 0059C7D2    push        eax
 0059C7D3    call        dword ptr ds:[789D04]
 0059C7D9    mov         ebx,eax
 0059C7DB    xor         eax,eax
 0059C7DD    pop         edx
 0059C7DE    pop         ecx
 0059C7DF    pop         ecx
 0059C7E0    mov         dword ptr fs:[eax],edx
 0059C7E3    push        59C800
 0059C7E8    lea         eax,[ebp-10]
 0059C7EB    call        @UStrClr
 0059C7F0    lea         eax,[ebp-4]
 0059C7F3    call        @UStrClr
 0059C7F8    ret
>0059C7F9    jmp         @HandleFinally
>0059C7FE    jmp         0059C7E8
 0059C800    mov         eax,ebx
 0059C802    pop         ebx
 0059C803    mov         esp,ebp
 0059C805    pop         ebp
 0059C806    ret         4
*}
end;

//0059C838
procedure Stub_WSASetLastError(const iError:Integer); stdcall;
begin
{*
 0059C838    push        ebp
 0059C839    mov         ebp,esp
 0059C83B    add         esp,0FFFFFFF0
 0059C83E    push        ebx
 0059C83F    xor         eax,eax
 0059C841    mov         dword ptr [ebp-10],eax
 0059C844    mov         dword ptr [ebp-4],eax
 0059C847    xor         eax,eax
 0059C849    push        ebp
 0059C84A    push        59C913
 0059C84F    push        dword ptr fs:[eax]
 0059C852    mov         dword ptr fs:[eax],esp
 0059C855    mov         ebx,dword ptr ds:[789E68]
 0059C85B    test        ebx,ebx
>0059C85D    jne         0059C898
 0059C85F    lea         edx,[ebp-4]
 0059C862    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C867    call        LoadResString
 0059C86C    mov         eax,dword ptr [ebp-4]
 0059C86F    push        eax
 0059C870    mov         eax,59C930;'WSASetLastError'
 0059C875    mov         dword ptr [ebp-0C],eax
 0059C878    mov         byte ptr [ebp-8],11
 0059C87C    lea         eax,[ebp-0C]
 0059C87F    push        eax
 0059C880    push        0
 0059C882    mov         ecx,276D
 0059C887    mov         dl,1
 0059C889    mov         eax,[0059A068];EIdWinsockStubError
 0059C88E    call        EIdWinsockStubError.Build
 0059C893    call        @RaiseExcept
 0059C898    mov         eax,59C930;'WSASetLastError'
 0059C89D    call        @UStrToPWChar
 0059C8A2    push        eax
 0059C8A3    push        ebx
 0059C8A4    call        GetProcAddress
 0059C8A9    test        eax,eax
>0059C8AB    jne         0059C8E6
 0059C8AD    lea         edx,[ebp-10]
 0059C8B0    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C8B5    call        LoadResString
 0059C8BA    mov         eax,dword ptr [ebp-10]
 0059C8BD    push        eax
 0059C8BE    mov         eax,59C930;'WSASetLastError'
 0059C8C3    mov         dword ptr [ebp-0C],eax
 0059C8C6    mov         byte ptr [ebp-8],11
 0059C8CA    lea         eax,[ebp-0C]
 0059C8CD    push        eax
 0059C8CE    push        0
 0059C8D0    mov         ecx,2726
 0059C8D5    mov         dl,1
 0059C8D7    mov         eax,[0059A068];EIdWinsockStubError
 0059C8DC    call        EIdWinsockStubError.Build
 0059C8E1    call        @RaiseExcept
 0059C8E6    mov         [00789D08],eax
 0059C8EB    mov         eax,dword ptr [ebp+8]
 0059C8EE    push        eax
 0059C8EF    call        dword ptr ds:[789D08]
 0059C8F5    xor         eax,eax
 0059C8F7    pop         edx
 0059C8F8    pop         ecx
 0059C8F9    pop         ecx
 0059C8FA    mov         dword ptr fs:[eax],edx
 0059C8FD    push        59C91A
 0059C902    lea         eax,[ebp-10]
 0059C905    call        @UStrClr
 0059C90A    lea         eax,[ebp-4]
 0059C90D    call        @UStrClr
 0059C912    ret
>0059C913    jmp         @HandleFinally
>0059C918    jmp         0059C902
 0059C91A    pop         ebx
 0059C91B    mov         esp,ebp
 0059C91D    pop         ebp
 0059C91E    ret         4
*}
end;

//0059C950
function Stub_WSAGetLastError:Integer; stdcall;
begin
{*
 0059C950    push        ebp
 0059C951    mov         ebp,esp
 0059C953    add         esp,0FFFFFFF0
 0059C956    push        ebx
 0059C957    xor         eax,eax
 0059C959    mov         dword ptr [ebp-10],eax
 0059C95C    mov         dword ptr [ebp-4],eax
 0059C95F    xor         eax,eax
 0059C961    push        ebp
 0059C962    push        59CA29
 0059C967    push        dword ptr fs:[eax]
 0059C96A    mov         dword ptr fs:[eax],esp
 0059C96D    mov         ebx,dword ptr ds:[789E68]
 0059C973    test        ebx,ebx
>0059C975    jne         0059C9B0
 0059C977    lea         edx,[ebp-4]
 0059C97A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C97F    call        LoadResString
 0059C984    mov         eax,dword ptr [ebp-4]
 0059C987    push        eax
 0059C988    mov         eax,59CA44;'WSAGetLastError'
 0059C98D    mov         dword ptr [ebp-0C],eax
 0059C990    mov         byte ptr [ebp-8],11
 0059C994    lea         eax,[ebp-0C]
 0059C997    push        eax
 0059C998    push        0
 0059C99A    mov         ecx,276D
 0059C99F    mov         dl,1
 0059C9A1    mov         eax,[0059A068];EIdWinsockStubError
 0059C9A6    call        EIdWinsockStubError.Build
 0059C9AB    call        @RaiseExcept
 0059C9B0    mov         eax,59CA44;'WSAGetLastError'
 0059C9B5    call        @UStrToPWChar
 0059C9BA    push        eax
 0059C9BB    push        ebx
 0059C9BC    call        GetProcAddress
 0059C9C1    test        eax,eax
>0059C9C3    jne         0059C9FE
 0059C9C5    lea         edx,[ebp-10]
 0059C9C8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059C9CD    call        LoadResString
 0059C9D2    mov         eax,dword ptr [ebp-10]
 0059C9D5    push        eax
 0059C9D6    mov         eax,59CA44;'WSAGetLastError'
 0059C9DB    mov         dword ptr [ebp-0C],eax
 0059C9DE    mov         byte ptr [ebp-8],11
 0059C9E2    lea         eax,[ebp-0C]
 0059C9E5    push        eax
 0059C9E6    push        0
 0059C9E8    mov         ecx,2726
 0059C9ED    mov         dl,1
 0059C9EF    mov         eax,[0059A068];EIdWinsockStubError
 0059C9F4    call        EIdWinsockStubError.Build
 0059C9F9    call        @RaiseExcept
 0059C9FE    mov         [00789D0C],eax
 0059CA03    call        dword ptr ds:[789D0C]
 0059CA09    mov         ebx,eax
 0059CA0B    xor         eax,eax
 0059CA0D    pop         edx
 0059CA0E    pop         ecx
 0059CA0F    pop         ecx
 0059CA10    mov         dword ptr fs:[eax],edx
 0059CA13    push        59CA30
 0059CA18    lea         eax,[ebp-10]
 0059CA1B    call        @UStrClr
 0059CA20    lea         eax,[ebp-4]
 0059CA23    call        @UStrClr
 0059CA28    ret
>0059CA29    jmp         @HandleFinally
>0059CA2E    jmp         0059CA18
 0059CA30    mov         eax,ebx
 0059CA32    pop         ebx
 0059CA33    mov         esp,ebp
 0059CA35    pop         ebp
 0059CA36    ret
*}
end;

//0059CA64
function Stub_WSAIsBlocking:BOOL; stdcall;
begin
{*
 0059CA64    push        ebp
 0059CA65    mov         ebp,esp
 0059CA67    add         esp,0FFFFFFF0
 0059CA6A    push        ebx
 0059CA6B    xor         eax,eax
 0059CA6D    mov         dword ptr [ebp-10],eax
 0059CA70    mov         dword ptr [ebp-4],eax
 0059CA73    xor         eax,eax
 0059CA75    push        ebp
 0059CA76    push        59CB3D
 0059CA7B    push        dword ptr fs:[eax]
 0059CA7E    mov         dword ptr fs:[eax],esp
 0059CA81    mov         ebx,dword ptr ds:[789E68]
 0059CA87    test        ebx,ebx
>0059CA89    jne         0059CAC4
 0059CA8B    lea         edx,[ebp-4]
 0059CA8E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CA93    call        LoadResString
 0059CA98    mov         eax,dword ptr [ebp-4]
 0059CA9B    push        eax
 0059CA9C    mov         eax,59CB58;'WSAIsBlocking'
 0059CAA1    mov         dword ptr [ebp-0C],eax
 0059CAA4    mov         byte ptr [ebp-8],11
 0059CAA8    lea         eax,[ebp-0C]
 0059CAAB    push        eax
 0059CAAC    push        0
 0059CAAE    mov         ecx,276D
 0059CAB3    mov         dl,1
 0059CAB5    mov         eax,[0059A068];EIdWinsockStubError
 0059CABA    call        EIdWinsockStubError.Build
 0059CABF    call        @RaiseExcept
 0059CAC4    mov         eax,59CB58;'WSAIsBlocking'
 0059CAC9    call        @UStrToPWChar
 0059CACE    push        eax
 0059CACF    push        ebx
 0059CAD0    call        GetProcAddress
 0059CAD5    test        eax,eax
>0059CAD7    jne         0059CB12
 0059CAD9    lea         edx,[ebp-10]
 0059CADC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CAE1    call        LoadResString
 0059CAE6    mov         eax,dword ptr [ebp-10]
 0059CAE9    push        eax
 0059CAEA    mov         eax,59CB58;'WSAIsBlocking'
 0059CAEF    mov         dword ptr [ebp-0C],eax
 0059CAF2    mov         byte ptr [ebp-8],11
 0059CAF6    lea         eax,[ebp-0C]
 0059CAF9    push        eax
 0059CAFA    push        0
 0059CAFC    mov         ecx,2726
 0059CB01    mov         dl,1
 0059CB03    mov         eax,[0059A068];EIdWinsockStubError
 0059CB08    call        EIdWinsockStubError.Build
 0059CB0D    call        @RaiseExcept
 0059CB12    mov         [00789D10],eax
 0059CB17    call        dword ptr ds:[789D10]
 0059CB1D    mov         ebx,eax
 0059CB1F    xor         eax,eax
 0059CB21    pop         edx
 0059CB22    pop         ecx
 0059CB23    pop         ecx
 0059CB24    mov         dword ptr fs:[eax],edx
 0059CB27    push        59CB44
 0059CB2C    lea         eax,[ebp-10]
 0059CB2F    call        @UStrClr
 0059CB34    lea         eax,[ebp-4]
 0059CB37    call        @UStrClr
 0059CB3C    ret
>0059CB3D    jmp         @HandleFinally
>0059CB42    jmp         0059CB2C
 0059CB44    mov         eax,ebx
 0059CB46    pop         ebx
 0059CB47    mov         esp,ebp
 0059CB49    pop         ebp
 0059CB4A    ret
*}
end;

//0059CB74
function Stub_WSAUnhookBlockingHook:Integer; stdcall;
begin
{*
 0059CB74    push        ebp
 0059CB75    mov         ebp,esp
 0059CB77    add         esp,0FFFFFFF0
 0059CB7A    push        ebx
 0059CB7B    xor         eax,eax
 0059CB7D    mov         dword ptr [ebp-10],eax
 0059CB80    mov         dword ptr [ebp-4],eax
 0059CB83    xor         eax,eax
 0059CB85    push        ebp
 0059CB86    push        59CC4D
 0059CB8B    push        dword ptr fs:[eax]
 0059CB8E    mov         dword ptr fs:[eax],esp
 0059CB91    mov         ebx,dword ptr ds:[789E68]
 0059CB97    test        ebx,ebx
>0059CB99    jne         0059CBD4
 0059CB9B    lea         edx,[ebp-4]
 0059CB9E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CBA3    call        LoadResString
 0059CBA8    mov         eax,dword ptr [ebp-4]
 0059CBAB    push        eax
 0059CBAC    mov         eax,59CC68;'WSAUnhookBlockingHook'
 0059CBB1    mov         dword ptr [ebp-0C],eax
 0059CBB4    mov         byte ptr [ebp-8],11
 0059CBB8    lea         eax,[ebp-0C]
 0059CBBB    push        eax
 0059CBBC    push        0
 0059CBBE    mov         ecx,276D
 0059CBC3    mov         dl,1
 0059CBC5    mov         eax,[0059A068];EIdWinsockStubError
 0059CBCA    call        EIdWinsockStubError.Build
 0059CBCF    call        @RaiseExcept
 0059CBD4    mov         eax,59CC68;'WSAUnhookBlockingHook'
 0059CBD9    call        @UStrToPWChar
 0059CBDE    push        eax
 0059CBDF    push        ebx
 0059CBE0    call        GetProcAddress
 0059CBE5    test        eax,eax
>0059CBE7    jne         0059CC22
 0059CBE9    lea         edx,[ebp-10]
 0059CBEC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CBF1    call        LoadResString
 0059CBF6    mov         eax,dword ptr [ebp-10]
 0059CBF9    push        eax
 0059CBFA    mov         eax,59CC68;'WSAUnhookBlockingHook'
 0059CBFF    mov         dword ptr [ebp-0C],eax
 0059CC02    mov         byte ptr [ebp-8],11
 0059CC06    lea         eax,[ebp-0C]
 0059CC09    push        eax
 0059CC0A    push        0
 0059CC0C    mov         ecx,2726
 0059CC11    mov         dl,1
 0059CC13    mov         eax,[0059A068];EIdWinsockStubError
 0059CC18    call        EIdWinsockStubError.Build
 0059CC1D    call        @RaiseExcept
 0059CC22    mov         [00789D14],eax
 0059CC27    call        dword ptr ds:[789D14]
 0059CC2D    mov         ebx,eax
 0059CC2F    xor         eax,eax
 0059CC31    pop         edx
 0059CC32    pop         ecx
 0059CC33    pop         ecx
 0059CC34    mov         dword ptr fs:[eax],edx
 0059CC37    push        59CC54
 0059CC3C    lea         eax,[ebp-10]
 0059CC3F    call        @UStrClr
 0059CC44    lea         eax,[ebp-4]
 0059CC47    call        @UStrClr
 0059CC4C    ret
>0059CC4D    jmp         @HandleFinally
>0059CC52    jmp         0059CC3C
 0059CC54    mov         eax,ebx
 0059CC56    pop         ebx
 0059CC57    mov         esp,ebp
 0059CC59    pop         ebp
 0059CC5A    ret
*}
end;

//0059CC94
function Stub_WSASetBlockingHook(lpBlockFunc:TFarProc):TFarProc; stdcall;
begin
{*
 0059CC94    push        ebp
 0059CC95    mov         ebp,esp
 0059CC97    add         esp,0FFFFFFF0
 0059CC9A    push        ebx
 0059CC9B    xor         eax,eax
 0059CC9D    mov         dword ptr [ebp-10],eax
 0059CCA0    mov         dword ptr [ebp-4],eax
 0059CCA3    xor         eax,eax
 0059CCA5    push        ebp
 0059CCA6    push        59CD71
 0059CCAB    push        dword ptr fs:[eax]
 0059CCAE    mov         dword ptr fs:[eax],esp
 0059CCB1    mov         ebx,dword ptr ds:[789E68]
 0059CCB7    test        ebx,ebx
>0059CCB9    jne         0059CCF4
 0059CCBB    lea         edx,[ebp-4]
 0059CCBE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CCC3    call        LoadResString
 0059CCC8    mov         eax,dword ptr [ebp-4]
 0059CCCB    push        eax
 0059CCCC    mov         eax,59CD90;'WSASetBlockingHook'
 0059CCD1    mov         dword ptr [ebp-0C],eax
 0059CCD4    mov         byte ptr [ebp-8],11
 0059CCD8    lea         eax,[ebp-0C]
 0059CCDB    push        eax
 0059CCDC    push        0
 0059CCDE    mov         ecx,276D
 0059CCE3    mov         dl,1
 0059CCE5    mov         eax,[0059A068];EIdWinsockStubError
 0059CCEA    call        EIdWinsockStubError.Build
 0059CCEF    call        @RaiseExcept
 0059CCF4    mov         eax,59CD90;'WSASetBlockingHook'
 0059CCF9    call        @UStrToPWChar
 0059CCFE    push        eax
 0059CCFF    push        ebx
 0059CD00    call        GetProcAddress
 0059CD05    test        eax,eax
>0059CD07    jne         0059CD42
 0059CD09    lea         edx,[ebp-10]
 0059CD0C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CD11    call        LoadResString
 0059CD16    mov         eax,dword ptr [ebp-10]
 0059CD19    push        eax
 0059CD1A    mov         eax,59CD90;'WSASetBlockingHook'
 0059CD1F    mov         dword ptr [ebp-0C],eax
 0059CD22    mov         byte ptr [ebp-8],11
 0059CD26    lea         eax,[ebp-0C]
 0059CD29    push        eax
 0059CD2A    push        0
 0059CD2C    mov         ecx,2726
 0059CD31    mov         dl,1
 0059CD33    mov         eax,[0059A068];EIdWinsockStubError
 0059CD38    call        EIdWinsockStubError.Build
 0059CD3D    call        @RaiseExcept
 0059CD42    mov         [00789D18],eax
 0059CD47    mov         eax,dword ptr [ebp+8]
 0059CD4A    push        eax
 0059CD4B    call        dword ptr ds:[789D18]
 0059CD51    mov         ebx,eax
 0059CD53    xor         eax,eax
 0059CD55    pop         edx
 0059CD56    pop         ecx
 0059CD57    pop         ecx
 0059CD58    mov         dword ptr fs:[eax],edx
 0059CD5B    push        59CD78
 0059CD60    lea         eax,[ebp-10]
 0059CD63    call        @UStrClr
 0059CD68    lea         eax,[ebp-4]
 0059CD6B    call        @UStrClr
 0059CD70    ret
>0059CD71    jmp         @HandleFinally
>0059CD76    jmp         0059CD60
 0059CD78    mov         eax,ebx
 0059CD7A    pop         ebx
 0059CD7B    mov         esp,ebp
 0059CD7D    pop         ebp
 0059CD7E    ret         4
*}
end;

//0059CDB8
function Stub_WSACancelBlockingCall:Integer; stdcall;
begin
{*
 0059CDB8    push        ebp
 0059CDB9    mov         ebp,esp
 0059CDBB    add         esp,0FFFFFFF0
 0059CDBE    push        ebx
 0059CDBF    xor         eax,eax
 0059CDC1    mov         dword ptr [ebp-10],eax
 0059CDC4    mov         dword ptr [ebp-4],eax
 0059CDC7    xor         eax,eax
 0059CDC9    push        ebp
 0059CDCA    push        59CE91
 0059CDCF    push        dword ptr fs:[eax]
 0059CDD2    mov         dword ptr fs:[eax],esp
 0059CDD5    mov         ebx,dword ptr ds:[789E68]
 0059CDDB    test        ebx,ebx
>0059CDDD    jne         0059CE18
 0059CDDF    lea         edx,[ebp-4]
 0059CDE2    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CDE7    call        LoadResString
 0059CDEC    mov         eax,dword ptr [ebp-4]
 0059CDEF    push        eax
 0059CDF0    mov         eax,59CEAC;'WSACancelBlockingCall'
 0059CDF5    mov         dword ptr [ebp-0C],eax
 0059CDF8    mov         byte ptr [ebp-8],11
 0059CDFC    lea         eax,[ebp-0C]
 0059CDFF    push        eax
 0059CE00    push        0
 0059CE02    mov         ecx,276D
 0059CE07    mov         dl,1
 0059CE09    mov         eax,[0059A068];EIdWinsockStubError
 0059CE0E    call        EIdWinsockStubError.Build
 0059CE13    call        @RaiseExcept
 0059CE18    mov         eax,59CEAC;'WSACancelBlockingCall'
 0059CE1D    call        @UStrToPWChar
 0059CE22    push        eax
 0059CE23    push        ebx
 0059CE24    call        GetProcAddress
 0059CE29    test        eax,eax
>0059CE2B    jne         0059CE66
 0059CE2D    lea         edx,[ebp-10]
 0059CE30    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CE35    call        LoadResString
 0059CE3A    mov         eax,dword ptr [ebp-10]
 0059CE3D    push        eax
 0059CE3E    mov         eax,59CEAC;'WSACancelBlockingCall'
 0059CE43    mov         dword ptr [ebp-0C],eax
 0059CE46    mov         byte ptr [ebp-8],11
 0059CE4A    lea         eax,[ebp-0C]
 0059CE4D    push        eax
 0059CE4E    push        0
 0059CE50    mov         ecx,2726
 0059CE55    mov         dl,1
 0059CE57    mov         eax,[0059A068];EIdWinsockStubError
 0059CE5C    call        EIdWinsockStubError.Build
 0059CE61    call        @RaiseExcept
 0059CE66    mov         [00789D1C],eax
 0059CE6B    call        dword ptr ds:[789D1C]
 0059CE71    mov         ebx,eax
 0059CE73    xor         eax,eax
 0059CE75    pop         edx
 0059CE76    pop         ecx
 0059CE77    pop         ecx
 0059CE78    mov         dword ptr fs:[eax],edx
 0059CE7B    push        59CE98
 0059CE80    lea         eax,[ebp-10]
 0059CE83    call        @UStrClr
 0059CE88    lea         eax,[ebp-4]
 0059CE8B    call        @UStrClr
 0059CE90    ret
>0059CE91    jmp         @HandleFinally
>0059CE96    jmp         0059CE80
 0059CE98    mov         eax,ebx
 0059CE9A    pop         ebx
 0059CE9B    mov         esp,ebp
 0059CE9D    pop         ebp
 0059CE9E    ret
*}
end;

//0059CED8
function Stub_WSAAsyncGetServByName(HWindow:HWND; wMsg:DWORD; name:PAnsiChar; proto:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;
begin
{*
 0059CED8    push        ebp
 0059CED9    mov         ebp,esp
 0059CEDB    add         esp,0FFFFFFF0
 0059CEDE    push        ebx
 0059CEDF    xor         eax,eax
 0059CEE1    mov         dword ptr [ebp-10],eax
 0059CEE4    mov         dword ptr [ebp-4],eax
 0059CEE7    xor         eax,eax
 0059CEE9    push        ebp
 0059CEEA    push        59CFC9
 0059CEEF    push        dword ptr fs:[eax]
 0059CEF2    mov         dword ptr fs:[eax],esp
 0059CEF5    mov         ebx,dword ptr ds:[789E68]
 0059CEFB    test        ebx,ebx
>0059CEFD    jne         0059CF38
 0059CEFF    lea         edx,[ebp-4]
 0059CF02    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CF07    call        LoadResString
 0059CF0C    mov         eax,dword ptr [ebp-4]
 0059CF0F    push        eax
 0059CF10    mov         eax,59CFE8;'WSAAsyncGetServByName'
 0059CF15    mov         dword ptr [ebp-0C],eax
 0059CF18    mov         byte ptr [ebp-8],11
 0059CF1C    lea         eax,[ebp-0C]
 0059CF1F    push        eax
 0059CF20    push        0
 0059CF22    mov         ecx,276D
 0059CF27    mov         dl,1
 0059CF29    mov         eax,[0059A068];EIdWinsockStubError
 0059CF2E    call        EIdWinsockStubError.Build
 0059CF33    call        @RaiseExcept
 0059CF38    mov         eax,59CFE8;'WSAAsyncGetServByName'
 0059CF3D    call        @UStrToPWChar
 0059CF42    push        eax
 0059CF43    push        ebx
 0059CF44    call        GetProcAddress
 0059CF49    test        eax,eax
>0059CF4B    jne         0059CF86
 0059CF4D    lea         edx,[ebp-10]
 0059CF50    mov         eax,[0078D780];^SResString602:TResStringRec
 0059CF55    call        LoadResString
 0059CF5A    mov         eax,dword ptr [ebp-10]
 0059CF5D    push        eax
 0059CF5E    mov         eax,59CFE8;'WSAAsyncGetServByName'
 0059CF63    mov         dword ptr [ebp-0C],eax
 0059CF66    mov         byte ptr [ebp-8],11
 0059CF6A    lea         eax,[ebp-0C]
 0059CF6D    push        eax
 0059CF6E    push        0
 0059CF70    mov         ecx,2726
 0059CF75    mov         dl,1
 0059CF77    mov         eax,[0059A068];EIdWinsockStubError
 0059CF7C    call        EIdWinsockStubError.Build
 0059CF81    call        @RaiseExcept
 0059CF86    mov         [00789D20],eax
 0059CF8B    mov         eax,dword ptr [ebp+1C]
 0059CF8E    push        eax
 0059CF8F    mov         eax,dword ptr [ebp+18]
 0059CF92    push        eax
 0059CF93    mov         eax,dword ptr [ebp+14]
 0059CF96    push        eax
 0059CF97    mov         eax,dword ptr [ebp+10]
 0059CF9A    push        eax
 0059CF9B    mov         eax,dword ptr [ebp+0C]
 0059CF9E    push        eax
 0059CF9F    mov         eax,dword ptr [ebp+8]
 0059CFA2    push        eax
 0059CFA3    call        dword ptr ds:[789D20]
 0059CFA9    mov         ebx,eax
 0059CFAB    xor         eax,eax
 0059CFAD    pop         edx
 0059CFAE    pop         ecx
 0059CFAF    pop         ecx
 0059CFB0    mov         dword ptr fs:[eax],edx
 0059CFB3    push        59CFD0
 0059CFB8    lea         eax,[ebp-10]
 0059CFBB    call        @UStrClr
 0059CFC0    lea         eax,[ebp-4]
 0059CFC3    call        @UStrClr
 0059CFC8    ret
>0059CFC9    jmp         @HandleFinally
>0059CFCE    jmp         0059CFB8
 0059CFD0    mov         eax,ebx
 0059CFD2    pop         ebx
 0059CFD3    mov         esp,ebp
 0059CFD5    pop         ebp
 0059CFD6    ret         18
*}
end;

//0059D014
function Stub_WSAAsyncGetServByPort(HWindow:HWND; wMsg:DWORD; port:DWORD; proto:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;
begin
{*
 0059D014    push        ebp
 0059D015    mov         ebp,esp
 0059D017    add         esp,0FFFFFFF0
 0059D01A    push        ebx
 0059D01B    xor         eax,eax
 0059D01D    mov         dword ptr [ebp-10],eax
 0059D020    mov         dword ptr [ebp-4],eax
 0059D023    xor         eax,eax
 0059D025    push        ebp
 0059D026    push        59D105
 0059D02B    push        dword ptr fs:[eax]
 0059D02E    mov         dword ptr fs:[eax],esp
 0059D031    mov         ebx,dword ptr ds:[789E68]
 0059D037    test        ebx,ebx
>0059D039    jne         0059D074
 0059D03B    lea         edx,[ebp-4]
 0059D03E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D043    call        LoadResString
 0059D048    mov         eax,dword ptr [ebp-4]
 0059D04B    push        eax
 0059D04C    mov         eax,59D124;'WSAAsyncGetServByPort'
 0059D051    mov         dword ptr [ebp-0C],eax
 0059D054    mov         byte ptr [ebp-8],11
 0059D058    lea         eax,[ebp-0C]
 0059D05B    push        eax
 0059D05C    push        0
 0059D05E    mov         ecx,276D
 0059D063    mov         dl,1
 0059D065    mov         eax,[0059A068];EIdWinsockStubError
 0059D06A    call        EIdWinsockStubError.Build
 0059D06F    call        @RaiseExcept
 0059D074    mov         eax,59D124;'WSAAsyncGetServByPort'
 0059D079    call        @UStrToPWChar
 0059D07E    push        eax
 0059D07F    push        ebx
 0059D080    call        GetProcAddress
 0059D085    test        eax,eax
>0059D087    jne         0059D0C2
 0059D089    lea         edx,[ebp-10]
 0059D08C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D091    call        LoadResString
 0059D096    mov         eax,dword ptr [ebp-10]
 0059D099    push        eax
 0059D09A    mov         eax,59D124;'WSAAsyncGetServByPort'
 0059D09F    mov         dword ptr [ebp-0C],eax
 0059D0A2    mov         byte ptr [ebp-8],11
 0059D0A6    lea         eax,[ebp-0C]
 0059D0A9    push        eax
 0059D0AA    push        0
 0059D0AC    mov         ecx,2726
 0059D0B1    mov         dl,1
 0059D0B3    mov         eax,[0059A068];EIdWinsockStubError
 0059D0B8    call        EIdWinsockStubError.Build
 0059D0BD    call        @RaiseExcept
 0059D0C2    mov         [00789D24],eax
 0059D0C7    mov         eax,dword ptr [ebp+1C]
 0059D0CA    push        eax
 0059D0CB    mov         eax,dword ptr [ebp+18]
 0059D0CE    push        eax
 0059D0CF    mov         eax,dword ptr [ebp+14]
 0059D0D2    push        eax
 0059D0D3    mov         eax,dword ptr [ebp+10]
 0059D0D6    push        eax
 0059D0D7    mov         eax,dword ptr [ebp+0C]
 0059D0DA    push        eax
 0059D0DB    mov         eax,dword ptr [ebp+8]
 0059D0DE    push        eax
 0059D0DF    call        dword ptr ds:[789D24]
 0059D0E5    mov         ebx,eax
 0059D0E7    xor         eax,eax
 0059D0E9    pop         edx
 0059D0EA    pop         ecx
 0059D0EB    pop         ecx
 0059D0EC    mov         dword ptr fs:[eax],edx
 0059D0EF    push        59D10C
 0059D0F4    lea         eax,[ebp-10]
 0059D0F7    call        @UStrClr
 0059D0FC    lea         eax,[ebp-4]
 0059D0FF    call        @UStrClr
 0059D104    ret
>0059D105    jmp         @HandleFinally
>0059D10A    jmp         0059D0F4
 0059D10C    mov         eax,ebx
 0059D10E    pop         ebx
 0059D10F    mov         esp,ebp
 0059D111    pop         ebp
 0059D112    ret         18
*}
end;

//0059D150
function Stub_WSAAsyncGetProtoByName(HWindow:HWND; wMsg:DWORD; name:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;
begin
{*
 0059D150    push        ebp
 0059D151    mov         ebp,esp
 0059D153    add         esp,0FFFFFFF0
 0059D156    push        ebx
 0059D157    xor         eax,eax
 0059D159    mov         dword ptr [ebp-10],eax
 0059D15C    mov         dword ptr [ebp-4],eax
 0059D15F    xor         eax,eax
 0059D161    push        ebp
 0059D162    push        59D23D
 0059D167    push        dword ptr fs:[eax]
 0059D16A    mov         dword ptr fs:[eax],esp
 0059D16D    mov         ebx,dword ptr ds:[789E68]
 0059D173    test        ebx,ebx
>0059D175    jne         0059D1B0
 0059D177    lea         edx,[ebp-4]
 0059D17A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D17F    call        LoadResString
 0059D184    mov         eax,dword ptr [ebp-4]
 0059D187    push        eax
 0059D188    mov         eax,59D25C;'WSAAsyncGetProtoByName'
 0059D18D    mov         dword ptr [ebp-0C],eax
 0059D190    mov         byte ptr [ebp-8],11
 0059D194    lea         eax,[ebp-0C]
 0059D197    push        eax
 0059D198    push        0
 0059D19A    mov         ecx,276D
 0059D19F    mov         dl,1
 0059D1A1    mov         eax,[0059A068];EIdWinsockStubError
 0059D1A6    call        EIdWinsockStubError.Build
 0059D1AB    call        @RaiseExcept
 0059D1B0    mov         eax,59D25C;'WSAAsyncGetProtoByName'
 0059D1B5    call        @UStrToPWChar
 0059D1BA    push        eax
 0059D1BB    push        ebx
 0059D1BC    call        GetProcAddress
 0059D1C1    test        eax,eax
>0059D1C3    jne         0059D1FE
 0059D1C5    lea         edx,[ebp-10]
 0059D1C8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D1CD    call        LoadResString
 0059D1D2    mov         eax,dword ptr [ebp-10]
 0059D1D5    push        eax
 0059D1D6    mov         eax,59D25C;'WSAAsyncGetProtoByName'
 0059D1DB    mov         dword ptr [ebp-0C],eax
 0059D1DE    mov         byte ptr [ebp-8],11
 0059D1E2    lea         eax,[ebp-0C]
 0059D1E5    push        eax
 0059D1E6    push        0
 0059D1E8    mov         ecx,2726
 0059D1ED    mov         dl,1
 0059D1EF    mov         eax,[0059A068];EIdWinsockStubError
 0059D1F4    call        EIdWinsockStubError.Build
 0059D1F9    call        @RaiseExcept
 0059D1FE    mov         [00789D28],eax
 0059D203    mov         eax,dword ptr [ebp+18]
 0059D206    push        eax
 0059D207    mov         eax,dword ptr [ebp+14]
 0059D20A    push        eax
 0059D20B    mov         eax,dword ptr [ebp+10]
 0059D20E    push        eax
 0059D20F    mov         eax,dword ptr [ebp+0C]
 0059D212    push        eax
 0059D213    mov         eax,dword ptr [ebp+8]
 0059D216    push        eax
 0059D217    call        dword ptr ds:[789D28]
 0059D21D    mov         ebx,eax
 0059D21F    xor         eax,eax
 0059D221    pop         edx
 0059D222    pop         ecx
 0059D223    pop         ecx
 0059D224    mov         dword ptr fs:[eax],edx
 0059D227    push        59D244
 0059D22C    lea         eax,[ebp-10]
 0059D22F    call        @UStrClr
 0059D234    lea         eax,[ebp-4]
 0059D237    call        @UStrClr
 0059D23C    ret
>0059D23D    jmp         @HandleFinally
>0059D242    jmp         0059D22C
 0059D244    mov         eax,ebx
 0059D246    pop         ebx
 0059D247    mov         esp,ebp
 0059D249    pop         ebp
 0059D24A    ret         14
*}
end;

//0059D28C
function Stub_WSAAsyncGetProtoByNumber(HWindow:HWND; wMsg:DWORD; number:Integer; buf:PAnsiChar; buflen:Integer):THandle; stdcall;
begin
{*
 0059D28C    push        ebp
 0059D28D    mov         ebp,esp
 0059D28F    add         esp,0FFFFFFF0
 0059D292    push        ebx
 0059D293    xor         eax,eax
 0059D295    mov         dword ptr [ebp-10],eax
 0059D298    mov         dword ptr [ebp-4],eax
 0059D29B    xor         eax,eax
 0059D29D    push        ebp
 0059D29E    push        59D379
 0059D2A3    push        dword ptr fs:[eax]
 0059D2A6    mov         dword ptr fs:[eax],esp
 0059D2A9    mov         ebx,dword ptr ds:[789E68]
 0059D2AF    test        ebx,ebx
>0059D2B1    jne         0059D2EC
 0059D2B3    lea         edx,[ebp-4]
 0059D2B6    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D2BB    call        LoadResString
 0059D2C0    mov         eax,dword ptr [ebp-4]
 0059D2C3    push        eax
 0059D2C4    mov         eax,59D398;'WSAAsyncGetProtoByNumber'
 0059D2C9    mov         dword ptr [ebp-0C],eax
 0059D2CC    mov         byte ptr [ebp-8],11
 0059D2D0    lea         eax,[ebp-0C]
 0059D2D3    push        eax
 0059D2D4    push        0
 0059D2D6    mov         ecx,276D
 0059D2DB    mov         dl,1
 0059D2DD    mov         eax,[0059A068];EIdWinsockStubError
 0059D2E2    call        EIdWinsockStubError.Build
 0059D2E7    call        @RaiseExcept
 0059D2EC    mov         eax,59D398;'WSAAsyncGetProtoByNumber'
 0059D2F1    call        @UStrToPWChar
 0059D2F6    push        eax
 0059D2F7    push        ebx
 0059D2F8    call        GetProcAddress
 0059D2FD    test        eax,eax
>0059D2FF    jne         0059D33A
 0059D301    lea         edx,[ebp-10]
 0059D304    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D309    call        LoadResString
 0059D30E    mov         eax,dword ptr [ebp-10]
 0059D311    push        eax
 0059D312    mov         eax,59D398;'WSAAsyncGetProtoByNumber'
 0059D317    mov         dword ptr [ebp-0C],eax
 0059D31A    mov         byte ptr [ebp-8],11
 0059D31E    lea         eax,[ebp-0C]
 0059D321    push        eax
 0059D322    push        0
 0059D324    mov         ecx,2726
 0059D329    mov         dl,1
 0059D32B    mov         eax,[0059A068];EIdWinsockStubError
 0059D330    call        EIdWinsockStubError.Build
 0059D335    call        @RaiseExcept
 0059D33A    mov         [00789D2C],eax
 0059D33F    mov         eax,dword ptr [ebp+18]
 0059D342    push        eax
 0059D343    mov         eax,dword ptr [ebp+14]
 0059D346    push        eax
 0059D347    mov         eax,dword ptr [ebp+10]
 0059D34A    push        eax
 0059D34B    mov         eax,dword ptr [ebp+0C]
 0059D34E    push        eax
 0059D34F    mov         eax,dword ptr [ebp+8]
 0059D352    push        eax
 0059D353    call        dword ptr ds:[789D2C]
 0059D359    mov         ebx,eax
 0059D35B    xor         eax,eax
 0059D35D    pop         edx
 0059D35E    pop         ecx
 0059D35F    pop         ecx
 0059D360    mov         dword ptr fs:[eax],edx
 0059D363    push        59D380
 0059D368    lea         eax,[ebp-10]
 0059D36B    call        @UStrClr
 0059D370    lea         eax,[ebp-4]
 0059D373    call        @UStrClr
 0059D378    ret
>0059D379    jmp         @HandleFinally
>0059D37E    jmp         0059D368
 0059D380    mov         eax,ebx
 0059D382    pop         ebx
 0059D383    mov         esp,ebp
 0059D385    pop         ebp
 0059D386    ret         14
*}
end;

//0059D3CC
function Stub_WSAAsyncGetHostByName(HWindow:HWND; wMsg:DWORD; name:PAnsiChar; buf:PAnsiChar; buflen:Integer):THandle; stdcall;
begin
{*
 0059D3CC    push        ebp
 0059D3CD    mov         ebp,esp
 0059D3CF    add         esp,0FFFFFFF0
 0059D3D2    push        ebx
 0059D3D3    xor         eax,eax
 0059D3D5    mov         dword ptr [ebp-10],eax
 0059D3D8    mov         dword ptr [ebp-4],eax
 0059D3DB    xor         eax,eax
 0059D3DD    push        ebp
 0059D3DE    push        59D4B9
 0059D3E3    push        dword ptr fs:[eax]
 0059D3E6    mov         dword ptr fs:[eax],esp
 0059D3E9    mov         ebx,dword ptr ds:[789E68]
 0059D3EF    test        ebx,ebx
>0059D3F1    jne         0059D42C
 0059D3F3    lea         edx,[ebp-4]
 0059D3F6    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D3FB    call        LoadResString
 0059D400    mov         eax,dword ptr [ebp-4]
 0059D403    push        eax
 0059D404    mov         eax,59D4D8;'WSAAsyncGetHostByName'
 0059D409    mov         dword ptr [ebp-0C],eax
 0059D40C    mov         byte ptr [ebp-8],11
 0059D410    lea         eax,[ebp-0C]
 0059D413    push        eax
 0059D414    push        0
 0059D416    mov         ecx,276D
 0059D41B    mov         dl,1
 0059D41D    mov         eax,[0059A068];EIdWinsockStubError
 0059D422    call        EIdWinsockStubError.Build
 0059D427    call        @RaiseExcept
 0059D42C    mov         eax,59D4D8;'WSAAsyncGetHostByName'
 0059D431    call        @UStrToPWChar
 0059D436    push        eax
 0059D437    push        ebx
 0059D438    call        GetProcAddress
 0059D43D    test        eax,eax
>0059D43F    jne         0059D47A
 0059D441    lea         edx,[ebp-10]
 0059D444    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D449    call        LoadResString
 0059D44E    mov         eax,dword ptr [ebp-10]
 0059D451    push        eax
 0059D452    mov         eax,59D4D8;'WSAAsyncGetHostByName'
 0059D457    mov         dword ptr [ebp-0C],eax
 0059D45A    mov         byte ptr [ebp-8],11
 0059D45E    lea         eax,[ebp-0C]
 0059D461    push        eax
 0059D462    push        0
 0059D464    mov         ecx,2726
 0059D469    mov         dl,1
 0059D46B    mov         eax,[0059A068];EIdWinsockStubError
 0059D470    call        EIdWinsockStubError.Build
 0059D475    call        @RaiseExcept
 0059D47A    mov         [00789D30],eax
 0059D47F    mov         eax,dword ptr [ebp+18]
 0059D482    push        eax
 0059D483    mov         eax,dword ptr [ebp+14]
 0059D486    push        eax
 0059D487    mov         eax,dword ptr [ebp+10]
 0059D48A    push        eax
 0059D48B    mov         eax,dword ptr [ebp+0C]
 0059D48E    push        eax
 0059D48F    mov         eax,dword ptr [ebp+8]
 0059D492    push        eax
 0059D493    call        dword ptr ds:[789D30]
 0059D499    mov         ebx,eax
 0059D49B    xor         eax,eax
 0059D49D    pop         edx
 0059D49E    pop         ecx
 0059D49F    pop         ecx
 0059D4A0    mov         dword ptr fs:[eax],edx
 0059D4A3    push        59D4C0
 0059D4A8    lea         eax,[ebp-10]
 0059D4AB    call        @UStrClr
 0059D4B0    lea         eax,[ebp-4]
 0059D4B3    call        @UStrClr
 0059D4B8    ret
>0059D4B9    jmp         @HandleFinally
>0059D4BE    jmp         0059D4A8
 0059D4C0    mov         eax,ebx
 0059D4C2    pop         ebx
 0059D4C3    mov         esp,ebp
 0059D4C5    pop         ebp
 0059D4C6    ret         14
*}
end;

//0059D504
function Stub_WSAAsyncGetHostByAddr(HWindow:HWND; wMsg:DWORD; AAddr:PAnsiChar; len:Integer; istruct:Integer; buf:PAnsiChar; buflen:Integer):THandle; stdcall;
begin
{*
 0059D504    push        ebp
 0059D505    mov         ebp,esp
 0059D507    add         esp,0FFFFFFF0
 0059D50A    push        ebx
 0059D50B    xor         eax,eax
 0059D50D    mov         dword ptr [ebp-10],eax
 0059D510    mov         dword ptr [ebp-4],eax
 0059D513    xor         eax,eax
 0059D515    push        ebp
 0059D516    push        59D5F9
 0059D51B    push        dword ptr fs:[eax]
 0059D51E    mov         dword ptr fs:[eax],esp
 0059D521    mov         ebx,dword ptr ds:[789E68]
 0059D527    test        ebx,ebx
>0059D529    jne         0059D564
 0059D52B    lea         edx,[ebp-4]
 0059D52E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D533    call        LoadResString
 0059D538    mov         eax,dword ptr [ebp-4]
 0059D53B    push        eax
 0059D53C    mov         eax,59D618;'WSAAsyncGetHostByAddr'
 0059D541    mov         dword ptr [ebp-0C],eax
 0059D544    mov         byte ptr [ebp-8],11
 0059D548    lea         eax,[ebp-0C]
 0059D54B    push        eax
 0059D54C    push        0
 0059D54E    mov         ecx,276D
 0059D553    mov         dl,1
 0059D555    mov         eax,[0059A068];EIdWinsockStubError
 0059D55A    call        EIdWinsockStubError.Build
 0059D55F    call        @RaiseExcept
 0059D564    mov         eax,59D618;'WSAAsyncGetHostByAddr'
 0059D569    call        @UStrToPWChar
 0059D56E    push        eax
 0059D56F    push        ebx
 0059D570    call        GetProcAddress
 0059D575    test        eax,eax
>0059D577    jne         0059D5B2
 0059D579    lea         edx,[ebp-10]
 0059D57C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D581    call        LoadResString
 0059D586    mov         eax,dword ptr [ebp-10]
 0059D589    push        eax
 0059D58A    mov         eax,59D618;'WSAAsyncGetHostByAddr'
 0059D58F    mov         dword ptr [ebp-0C],eax
 0059D592    mov         byte ptr [ebp-8],11
 0059D596    lea         eax,[ebp-0C]
 0059D599    push        eax
 0059D59A    push        0
 0059D59C    mov         ecx,2726
 0059D5A1    mov         dl,1
 0059D5A3    mov         eax,[0059A068];EIdWinsockStubError
 0059D5A8    call        EIdWinsockStubError.Build
 0059D5AD    call        @RaiseExcept
 0059D5B2    mov         [00789D34],eax
 0059D5B7    mov         eax,dword ptr [ebp+20]
 0059D5BA    push        eax
 0059D5BB    mov         eax,dword ptr [ebp+1C]
 0059D5BE    push        eax
 0059D5BF    mov         eax,dword ptr [ebp+18]
 0059D5C2    push        eax
 0059D5C3    mov         eax,dword ptr [ebp+14]
 0059D5C6    push        eax
 0059D5C7    mov         eax,dword ptr [ebp+10]
 0059D5CA    push        eax
 0059D5CB    mov         eax,dword ptr [ebp+0C]
 0059D5CE    push        eax
 0059D5CF    mov         eax,dword ptr [ebp+8]
 0059D5D2    push        eax
 0059D5D3    call        dword ptr ds:[789D34]
 0059D5D9    mov         ebx,eax
 0059D5DB    xor         eax,eax
 0059D5DD    pop         edx
 0059D5DE    pop         ecx
 0059D5DF    pop         ecx
 0059D5E0    mov         dword ptr fs:[eax],edx
 0059D5E3    push        59D600
 0059D5E8    lea         eax,[ebp-10]
 0059D5EB    call        @UStrClr
 0059D5F0    lea         eax,[ebp-4]
 0059D5F3    call        @UStrClr
 0059D5F8    ret
>0059D5F9    jmp         @HandleFinally
>0059D5FE    jmp         0059D5E8
 0059D600    mov         eax,ebx
 0059D602    pop         ebx
 0059D603    mov         esp,ebp
 0059D605    pop         ebp
 0059D606    ret         1C
*}
end;

//0059D644
function Stub_WSACancelAsyncRequest(hAsyncTaskHandle:THandle):Integer; stdcall;
begin
{*
 0059D644    push        ebp
 0059D645    mov         ebp,esp
 0059D647    add         esp,0FFFFFFF0
 0059D64A    push        ebx
 0059D64B    xor         eax,eax
 0059D64D    mov         dword ptr [ebp-10],eax
 0059D650    mov         dword ptr [ebp-4],eax
 0059D653    xor         eax,eax
 0059D655    push        ebp
 0059D656    push        59D721
 0059D65B    push        dword ptr fs:[eax]
 0059D65E    mov         dword ptr fs:[eax],esp
 0059D661    mov         ebx,dword ptr ds:[789E68]
 0059D667    test        ebx,ebx
>0059D669    jne         0059D6A4
 0059D66B    lea         edx,[ebp-4]
 0059D66E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D673    call        LoadResString
 0059D678    mov         eax,dword ptr [ebp-4]
 0059D67B    push        eax
 0059D67C    mov         eax,59D740;'WSACancelAsyncRequest'
 0059D681    mov         dword ptr [ebp-0C],eax
 0059D684    mov         byte ptr [ebp-8],11
 0059D688    lea         eax,[ebp-0C]
 0059D68B    push        eax
 0059D68C    push        0
 0059D68E    mov         ecx,276D
 0059D693    mov         dl,1
 0059D695    mov         eax,[0059A068];EIdWinsockStubError
 0059D69A    call        EIdWinsockStubError.Build
 0059D69F    call        @RaiseExcept
 0059D6A4    mov         eax,59D740;'WSACancelAsyncRequest'
 0059D6A9    call        @UStrToPWChar
 0059D6AE    push        eax
 0059D6AF    push        ebx
 0059D6B0    call        GetProcAddress
 0059D6B5    test        eax,eax
>0059D6B7    jne         0059D6F2
 0059D6B9    lea         edx,[ebp-10]
 0059D6BC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D6C1    call        LoadResString
 0059D6C6    mov         eax,dword ptr [ebp-10]
 0059D6C9    push        eax
 0059D6CA    mov         eax,59D740;'WSACancelAsyncRequest'
 0059D6CF    mov         dword ptr [ebp-0C],eax
 0059D6D2    mov         byte ptr [ebp-8],11
 0059D6D6    lea         eax,[ebp-0C]
 0059D6D9    push        eax
 0059D6DA    push        0
 0059D6DC    mov         ecx,2726
 0059D6E1    mov         dl,1
 0059D6E3    mov         eax,[0059A068];EIdWinsockStubError
 0059D6E8    call        EIdWinsockStubError.Build
 0059D6ED    call        @RaiseExcept
 0059D6F2    mov         [00789D38],eax
 0059D6F7    mov         eax,dword ptr [ebp+8]
 0059D6FA    push        eax
 0059D6FB    call        dword ptr ds:[789D38]
 0059D701    mov         ebx,eax
 0059D703    xor         eax,eax
 0059D705    pop         edx
 0059D706    pop         ecx
 0059D707    pop         ecx
 0059D708    mov         dword ptr fs:[eax],edx
 0059D70B    push        59D728
 0059D710    lea         eax,[ebp-10]
 0059D713    call        @UStrClr
 0059D718    lea         eax,[ebp-4]
 0059D71B    call        @UStrClr
 0059D720    ret
>0059D721    jmp         @HandleFinally
>0059D726    jmp         0059D710
 0059D728    mov         eax,ebx
 0059D72A    pop         ebx
 0059D72B    mov         esp,ebp
 0059D72D    pop         ebp
 0059D72E    ret         4
*}
end;

//0059D76C
function Stub_WSAAsyncSelect(const s:PtrUInt; HWindow:HWND; wMsg:DWORD; lEvent:LongInt):Integer; stdcall;
begin
{*
 0059D76C    push        ebp
 0059D76D    mov         ebp,esp
 0059D76F    add         esp,0FFFFFFF0
 0059D772    push        ebx
 0059D773    xor         eax,eax
 0059D775    mov         dword ptr [ebp-10],eax
 0059D778    mov         dword ptr [ebp-4],eax
 0059D77B    xor         eax,eax
 0059D77D    push        ebp
 0059D77E    push        59D855
 0059D783    push        dword ptr fs:[eax]
 0059D786    mov         dword ptr fs:[eax],esp
 0059D789    mov         ebx,dword ptr ds:[789E68]
 0059D78F    test        ebx,ebx
>0059D791    jne         0059D7CC
 0059D793    lea         edx,[ebp-4]
 0059D796    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D79B    call        LoadResString
 0059D7A0    mov         eax,dword ptr [ebp-4]
 0059D7A3    push        eax
 0059D7A4    mov         eax,59D874;'WSAAsyncSelect'
 0059D7A9    mov         dword ptr [ebp-0C],eax
 0059D7AC    mov         byte ptr [ebp-8],11
 0059D7B0    lea         eax,[ebp-0C]
 0059D7B3    push        eax
 0059D7B4    push        0
 0059D7B6    mov         ecx,276D
 0059D7BB    mov         dl,1
 0059D7BD    mov         eax,[0059A068];EIdWinsockStubError
 0059D7C2    call        EIdWinsockStubError.Build
 0059D7C7    call        @RaiseExcept
 0059D7CC    mov         eax,59D874;'WSAAsyncSelect'
 0059D7D1    call        @UStrToPWChar
 0059D7D6    push        eax
 0059D7D7    push        ebx
 0059D7D8    call        GetProcAddress
 0059D7DD    test        eax,eax
>0059D7DF    jne         0059D81A
 0059D7E1    lea         edx,[ebp-10]
 0059D7E4    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D7E9    call        LoadResString
 0059D7EE    mov         eax,dword ptr [ebp-10]
 0059D7F1    push        eax
 0059D7F2    mov         eax,59D874;'WSAAsyncSelect'
 0059D7F7    mov         dword ptr [ebp-0C],eax
 0059D7FA    mov         byte ptr [ebp-8],11
 0059D7FE    lea         eax,[ebp-0C]
 0059D801    push        eax
 0059D802    push        0
 0059D804    mov         ecx,2726
 0059D809    mov         dl,1
 0059D80B    mov         eax,[0059A068];EIdWinsockStubError
 0059D810    call        EIdWinsockStubError.Build
 0059D815    call        @RaiseExcept
 0059D81A    mov         [00789D3C],eax
 0059D81F    mov         eax,dword ptr [ebp+14]
 0059D822    push        eax
 0059D823    mov         eax,dword ptr [ebp+10]
 0059D826    push        eax
 0059D827    mov         eax,dword ptr [ebp+0C]
 0059D82A    push        eax
 0059D82B    mov         eax,dword ptr [ebp+8]
 0059D82E    push        eax
 0059D82F    call        dword ptr ds:[789D3C]
 0059D835    mov         ebx,eax
 0059D837    xor         eax,eax
 0059D839    pop         edx
 0059D83A    pop         ecx
 0059D83B    pop         ecx
 0059D83C    mov         dword ptr fs:[eax],edx
 0059D83F    push        59D85C
 0059D844    lea         eax,[ebp-10]
 0059D847    call        @UStrClr
 0059D84C    lea         eax,[ebp-4]
 0059D84F    call        @UStrClr
 0059D854    ret
>0059D855    jmp         @HandleFinally
>0059D85A    jmp         0059D844
 0059D85C    mov         eax,ebx
 0059D85E    pop         ebx
 0059D85F    mov         esp,ebp
 0059D861    pop         ebp
 0059D862    ret         10
*}
end;

//0059D894
function Stub___WSAFDIsSet(const s:PtrUInt; var FDSet:TFDSet):BOOL; stdcall;
begin
{*
 0059D894    push        ebp
 0059D895    mov         ebp,esp
 0059D897    add         esp,0FFFFFFF0
 0059D89A    push        ebx
 0059D89B    xor         eax,eax
 0059D89D    mov         dword ptr [ebp-10],eax
 0059D8A0    mov         dword ptr [ebp-4],eax
 0059D8A3    xor         eax,eax
 0059D8A5    push        ebp
 0059D8A6    push        59D975
 0059D8AB    push        dword ptr fs:[eax]
 0059D8AE    mov         dword ptr fs:[eax],esp
 0059D8B1    mov         ebx,dword ptr ds:[789E68]
 0059D8B7    test        ebx,ebx
>0059D8B9    jne         0059D8F4
 0059D8BB    lea         edx,[ebp-4]
 0059D8BE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D8C3    call        LoadResString
 0059D8C8    mov         eax,dword ptr [ebp-4]
 0059D8CB    push        eax
 0059D8CC    mov         eax,59D994;'__WSAFDIsSet'
 0059D8D1    mov         dword ptr [ebp-0C],eax
 0059D8D4    mov         byte ptr [ebp-8],11
 0059D8D8    lea         eax,[ebp-0C]
 0059D8DB    push        eax
 0059D8DC    push        0
 0059D8DE    mov         ecx,276D
 0059D8E3    mov         dl,1
 0059D8E5    mov         eax,[0059A068];EIdWinsockStubError
 0059D8EA    call        EIdWinsockStubError.Build
 0059D8EF    call        @RaiseExcept
 0059D8F4    mov         eax,59D994;'__WSAFDIsSet'
 0059D8F9    call        @UStrToPWChar
 0059D8FE    push        eax
 0059D8FF    push        ebx
 0059D900    call        GetProcAddress
 0059D905    test        eax,eax
>0059D907    jne         0059D942
 0059D909    lea         edx,[ebp-10]
 0059D90C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D911    call        LoadResString
 0059D916    mov         eax,dword ptr [ebp-10]
 0059D919    push        eax
 0059D91A    mov         eax,59D994;'__WSAFDIsSet'
 0059D91F    mov         dword ptr [ebp-0C],eax
 0059D922    mov         byte ptr [ebp-8],11
 0059D926    lea         eax,[ebp-0C]
 0059D929    push        eax
 0059D92A    push        0
 0059D92C    mov         ecx,2726
 0059D931    mov         dl,1
 0059D933    mov         eax,[0059A068];EIdWinsockStubError
 0059D938    call        EIdWinsockStubError.Build
 0059D93D    call        @RaiseExcept
 0059D942    mov         [00789D40],eax
 0059D947    mov         eax,dword ptr [ebp+0C]
 0059D94A    push        eax
 0059D94B    mov         eax,dword ptr [ebp+8]
 0059D94E    push        eax
 0059D94F    call        dword ptr ds:[789D40]
 0059D955    mov         ebx,eax
 0059D957    xor         eax,eax
 0059D959    pop         edx
 0059D95A    pop         ecx
 0059D95B    pop         ecx
 0059D95C    mov         dword ptr fs:[eax],edx
 0059D95F    push        59D97C
 0059D964    lea         eax,[ebp-10]
 0059D967    call        @UStrClr
 0059D96C    lea         eax,[ebp-4]
 0059D96F    call        @UStrClr
 0059D974    ret
>0059D975    jmp         @HandleFinally
>0059D97A    jmp         0059D964
 0059D97C    mov         eax,ebx
 0059D97E    pop         ebx
 0059D97F    mov         esp,ebp
 0059D981    pop         ebp
 0059D982    ret         8
*}
end;

//0059D9B0
function Stub_WSAAccept(const s:PtrUInt; AAddr:PSOCKADDR; addrlen:PInteger; lpfnCondition:LPCONDITIONPROC; const dwCallbackData:DWORD):PtrUInt; stdcall;
begin
{*
 0059D9B0    push        ebp
 0059D9B1    mov         ebp,esp
 0059D9B3    add         esp,0FFFFFFF0
 0059D9B6    push        ebx
 0059D9B7    xor         eax,eax
 0059D9B9    mov         dword ptr [ebp-10],eax
 0059D9BC    mov         dword ptr [ebp-4],eax
 0059D9BF    xor         eax,eax
 0059D9C1    push        ebp
 0059D9C2    push        59DA9D
 0059D9C7    push        dword ptr fs:[eax]
 0059D9CA    mov         dword ptr fs:[eax],esp
 0059D9CD    mov         ebx,dword ptr ds:[789E68]
 0059D9D3    test        ebx,ebx
>0059D9D5    jne         0059DA10
 0059D9D7    lea         edx,[ebp-4]
 0059D9DA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059D9DF    call        LoadResString
 0059D9E4    mov         eax,dword ptr [ebp-4]
 0059D9E7    push        eax
 0059D9E8    mov         eax,59DABC;'WSAAccept'
 0059D9ED    mov         dword ptr [ebp-0C],eax
 0059D9F0    mov         byte ptr [ebp-8],11
 0059D9F4    lea         eax,[ebp-0C]
 0059D9F7    push        eax
 0059D9F8    push        0
 0059D9FA    mov         ecx,276D
 0059D9FF    mov         dl,1
 0059DA01    mov         eax,[0059A068];EIdWinsockStubError
 0059DA06    call        EIdWinsockStubError.Build
 0059DA0B    call        @RaiseExcept
 0059DA10    mov         eax,59DABC;'WSAAccept'
 0059DA15    call        @UStrToPWChar
 0059DA1A    push        eax
 0059DA1B    push        ebx
 0059DA1C    call        GetProcAddress
 0059DA21    test        eax,eax
>0059DA23    jne         0059DA5E
 0059DA25    lea         edx,[ebp-10]
 0059DA28    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DA2D    call        LoadResString
 0059DA32    mov         eax,dword ptr [ebp-10]
 0059DA35    push        eax
 0059DA36    mov         eax,59DABC;'WSAAccept'
 0059DA3B    mov         dword ptr [ebp-0C],eax
 0059DA3E    mov         byte ptr [ebp-8],11
 0059DA42    lea         eax,[ebp-0C]
 0059DA45    push        eax
 0059DA46    push        0
 0059DA48    mov         ecx,2726
 0059DA4D    mov         dl,1
 0059DA4F    mov         eax,[0059A068];EIdWinsockStubError
 0059DA54    call        EIdWinsockStubError.Build
 0059DA59    call        @RaiseExcept
 0059DA5E    mov         [00789D44],eax
 0059DA63    mov         eax,dword ptr [ebp+18]
 0059DA66    push        eax
 0059DA67    mov         eax,dword ptr [ebp+14]
 0059DA6A    push        eax
 0059DA6B    mov         eax,dword ptr [ebp+10]
 0059DA6E    push        eax
 0059DA6F    mov         eax,dword ptr [ebp+0C]
 0059DA72    push        eax
 0059DA73    mov         eax,dword ptr [ebp+8]
 0059DA76    push        eax
 0059DA77    call        dword ptr ds:[789D44]
 0059DA7D    mov         ebx,eax
 0059DA7F    xor         eax,eax
 0059DA81    pop         edx
 0059DA82    pop         ecx
 0059DA83    pop         ecx
 0059DA84    mov         dword ptr fs:[eax],edx
 0059DA87    push        59DAA4
 0059DA8C    lea         eax,[ebp-10]
 0059DA8F    call        @UStrClr
 0059DA94    lea         eax,[ebp-4]
 0059DA97    call        @UStrClr
 0059DA9C    ret
>0059DA9D    jmp         @HandleFinally
>0059DAA2    jmp         0059DA8C
 0059DAA4    mov         eax,ebx
 0059DAA6    pop         ebx
 0059DAA7    mov         esp,ebp
 0059DAA9    pop         ebp
 0059DAAA    ret         14
*}
end;

//0059DAD0
function Stub_WSACloseEvent(const hEvent:THandle):WordBool; stdcall;
begin
{*
 0059DAD0    push        ebp
 0059DAD1    mov         ebp,esp
 0059DAD3    add         esp,0FFFFFFF0
 0059DAD6    push        ebx
 0059DAD7    xor         eax,eax
 0059DAD9    mov         dword ptr [ebp-10],eax
 0059DADC    mov         dword ptr [ebp-4],eax
 0059DADF    xor         eax,eax
 0059DAE1    push        ebp
 0059DAE2    push        59DBAD
 0059DAE7    push        dword ptr fs:[eax]
 0059DAEA    mov         dword ptr fs:[eax],esp
 0059DAED    mov         ebx,dword ptr ds:[789E68]
 0059DAF3    test        ebx,ebx
>0059DAF5    jne         0059DB30
 0059DAF7    lea         edx,[ebp-4]
 0059DAFA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DAFF    call        LoadResString
 0059DB04    mov         eax,dword ptr [ebp-4]
 0059DB07    push        eax
 0059DB08    mov         eax,59DBCC;'WSACloseEvent'
 0059DB0D    mov         dword ptr [ebp-0C],eax
 0059DB10    mov         byte ptr [ebp-8],11
 0059DB14    lea         eax,[ebp-0C]
 0059DB17    push        eax
 0059DB18    push        0
 0059DB1A    mov         ecx,276D
 0059DB1F    mov         dl,1
 0059DB21    mov         eax,[0059A068];EIdWinsockStubError
 0059DB26    call        EIdWinsockStubError.Build
 0059DB2B    call        @RaiseExcept
 0059DB30    mov         eax,59DBCC;'WSACloseEvent'
 0059DB35    call        @UStrToPWChar
 0059DB3A    push        eax
 0059DB3B    push        ebx
 0059DB3C    call        GetProcAddress
 0059DB41    test        eax,eax
>0059DB43    jne         0059DB7E
 0059DB45    lea         edx,[ebp-10]
 0059DB48    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DB4D    call        LoadResString
 0059DB52    mov         eax,dword ptr [ebp-10]
 0059DB55    push        eax
 0059DB56    mov         eax,59DBCC;'WSACloseEvent'
 0059DB5B    mov         dword ptr [ebp-0C],eax
 0059DB5E    mov         byte ptr [ebp-8],11
 0059DB62    lea         eax,[ebp-0C]
 0059DB65    push        eax
 0059DB66    push        0
 0059DB68    mov         ecx,2726
 0059DB6D    mov         dl,1
 0059DB6F    mov         eax,[0059A068];EIdWinsockStubError
 0059DB74    call        EIdWinsockStubError.Build
 0059DB79    call        @RaiseExcept
 0059DB7E    mov         [00789D54],eax
 0059DB83    mov         eax,dword ptr [ebp+8]
 0059DB86    push        eax
 0059DB87    call        dword ptr ds:[789D54]
 0059DB8D    mov         ebx,eax
 0059DB8F    xor         eax,eax
 0059DB91    pop         edx
 0059DB92    pop         ecx
 0059DB93    pop         ecx
 0059DB94    mov         dword ptr fs:[eax],edx
 0059DB97    push        59DBB4
 0059DB9C    lea         eax,[ebp-10]
 0059DB9F    call        @UStrClr
 0059DBA4    lea         eax,[ebp-4]
 0059DBA7    call        @UStrClr
 0059DBAC    ret
>0059DBAD    jmp         @HandleFinally
>0059DBB2    jmp         0059DB9C
 0059DBB4    mov         eax,ebx
 0059DBB6    pop         ebx
 0059DBB7    mov         esp,ebp
 0059DBB9    pop         ebp
 0059DBBA    ret         4
*}
end;

//0059DBE8
function Stub_WSAConnect(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer; lpCallerData:PWSABuf; lpCalleeData:PWSABuf; lpSQOS:PQOS; lpGQOS:PQOS):Integer; stdcall;
begin
{*
 0059DBE8    push        ebp
 0059DBE9    mov         ebp,esp
 0059DBEB    add         esp,0FFFFFFF0
 0059DBEE    push        ebx
 0059DBEF    xor         eax,eax
 0059DBF1    mov         dword ptr [ebp-10],eax
 0059DBF4    mov         dword ptr [ebp-4],eax
 0059DBF7    xor         eax,eax
 0059DBF9    push        ebp
 0059DBFA    push        59DCDD
 0059DBFF    push        dword ptr fs:[eax]
 0059DC02    mov         dword ptr fs:[eax],esp
 0059DC05    mov         ebx,dword ptr ds:[789E68]
 0059DC0B    test        ebx,ebx
>0059DC0D    jne         0059DC48
 0059DC0F    lea         edx,[ebp-4]
 0059DC12    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DC17    call        LoadResString
 0059DC1C    mov         eax,dword ptr [ebp-4]
 0059DC1F    push        eax
 0059DC20    mov         eax,59DCFC;'WSAConnect'
 0059DC25    mov         dword ptr [ebp-0C],eax
 0059DC28    mov         byte ptr [ebp-8],11
 0059DC2C    lea         eax,[ebp-0C]
 0059DC2F    push        eax
 0059DC30    push        0
 0059DC32    mov         ecx,276D
 0059DC37    mov         dl,1
 0059DC39    mov         eax,[0059A068];EIdWinsockStubError
 0059DC3E    call        EIdWinsockStubError.Build
 0059DC43    call        @RaiseExcept
 0059DC48    mov         eax,59DCFC;'WSAConnect'
 0059DC4D    call        @UStrToPWChar
 0059DC52    push        eax
 0059DC53    push        ebx
 0059DC54    call        GetProcAddress
 0059DC59    test        eax,eax
>0059DC5B    jne         0059DC96
 0059DC5D    lea         edx,[ebp-10]
 0059DC60    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DC65    call        LoadResString
 0059DC6A    mov         eax,dword ptr [ebp-10]
 0059DC6D    push        eax
 0059DC6E    mov         eax,59DCFC;'WSAConnect'
 0059DC73    mov         dword ptr [ebp-0C],eax
 0059DC76    mov         byte ptr [ebp-8],11
 0059DC7A    lea         eax,[ebp-0C]
 0059DC7D    push        eax
 0059DC7E    push        0
 0059DC80    mov         ecx,2726
 0059DC85    mov         dl,1
 0059DC87    mov         eax,[0059A068];EIdWinsockStubError
 0059DC8C    call        EIdWinsockStubError.Build
 0059DC91    call        @RaiseExcept
 0059DC96    mov         [00789D58],eax
 0059DC9B    mov         eax,dword ptr [ebp+20]
 0059DC9E    push        eax
 0059DC9F    mov         eax,dword ptr [ebp+1C]
 0059DCA2    push        eax
 0059DCA3    mov         eax,dword ptr [ebp+18]
 0059DCA6    push        eax
 0059DCA7    mov         eax,dword ptr [ebp+14]
 0059DCAA    push        eax
 0059DCAB    mov         eax,dword ptr [ebp+10]
 0059DCAE    push        eax
 0059DCAF    mov         eax,dword ptr [ebp+0C]
 0059DCB2    push        eax
 0059DCB3    mov         eax,dword ptr [ebp+8]
 0059DCB6    push        eax
 0059DCB7    call        dword ptr ds:[789D58]
 0059DCBD    mov         ebx,eax
 0059DCBF    xor         eax,eax
 0059DCC1    pop         edx
 0059DCC2    pop         ecx
 0059DCC3    pop         ecx
 0059DCC4    mov         dword ptr fs:[eax],edx
 0059DCC7    push        59DCE4
 0059DCCC    lea         eax,[ebp-10]
 0059DCCF    call        @UStrClr
 0059DCD4    lea         eax,[ebp-4]
 0059DCD7    call        @UStrClr
 0059DCDC    ret
>0059DCDD    jmp         @HandleFinally
>0059DCE2    jmp         0059DCCC
 0059DCE4    mov         eax,ebx
 0059DCE6    pop         ebx
 0059DCE7    mov         esp,ebp
 0059DCE9    pop         ebp
 0059DCEA    ret         1C
*}
end;

//0059DD14
function Stub_WSACreateEvent:THandle; stdcall;
begin
{*
 0059DD14    push        ebp
 0059DD15    mov         ebp,esp
 0059DD17    add         esp,0FFFFFFF0
 0059DD1A    push        ebx
 0059DD1B    xor         eax,eax
 0059DD1D    mov         dword ptr [ebp-10],eax
 0059DD20    mov         dword ptr [ebp-4],eax
 0059DD23    xor         eax,eax
 0059DD25    push        ebp
 0059DD26    push        59DDED
 0059DD2B    push        dword ptr fs:[eax]
 0059DD2E    mov         dword ptr fs:[eax],esp
 0059DD31    mov         ebx,dword ptr ds:[789E68]
 0059DD37    test        ebx,ebx
>0059DD39    jne         0059DD74
 0059DD3B    lea         edx,[ebp-4]
 0059DD3E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DD43    call        LoadResString
 0059DD48    mov         eax,dword ptr [ebp-4]
 0059DD4B    push        eax
 0059DD4C    mov         eax,59DE08;'WSACreateEvent'
 0059DD51    mov         dword ptr [ebp-0C],eax
 0059DD54    mov         byte ptr [ebp-8],11
 0059DD58    lea         eax,[ebp-0C]
 0059DD5B    push        eax
 0059DD5C    push        0
 0059DD5E    mov         ecx,276D
 0059DD63    mov         dl,1
 0059DD65    mov         eax,[0059A068];EIdWinsockStubError
 0059DD6A    call        EIdWinsockStubError.Build
 0059DD6F    call        @RaiseExcept
 0059DD74    mov         eax,59DE08;'WSACreateEvent'
 0059DD79    call        @UStrToPWChar
 0059DD7E    push        eax
 0059DD7F    push        ebx
 0059DD80    call        GetProcAddress
 0059DD85    test        eax,eax
>0059DD87    jne         0059DDC2
 0059DD89    lea         edx,[ebp-10]
 0059DD8C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DD91    call        LoadResString
 0059DD96    mov         eax,dword ptr [ebp-10]
 0059DD99    push        eax
 0059DD9A    mov         eax,59DE08;'WSACreateEvent'
 0059DD9F    mov         dword ptr [ebp-0C],eax
 0059DDA2    mov         byte ptr [ebp-8],11
 0059DDA6    lea         eax,[ebp-0C]
 0059DDA9    push        eax
 0059DDAA    push        0
 0059DDAC    mov         ecx,2726
 0059DDB1    mov         dl,1
 0059DDB3    mov         eax,[0059A068];EIdWinsockStubError
 0059DDB8    call        EIdWinsockStubError.Build
 0059DDBD    call        @RaiseExcept
 0059DDC2    mov         [00789D5C],eax
 0059DDC7    call        dword ptr ds:[789D5C]
 0059DDCD    mov         ebx,eax
 0059DDCF    xor         eax,eax
 0059DDD1    pop         edx
 0059DDD2    pop         ecx
 0059DDD3    pop         ecx
 0059DDD4    mov         dword ptr fs:[eax],edx
 0059DDD7    push        59DDF4
 0059DDDC    lea         eax,[ebp-10]
 0059DDDF    call        @UStrClr
 0059DDE4    lea         eax,[ebp-4]
 0059DDE7    call        @UStrClr
 0059DDEC    ret
>0059DDED    jmp         @HandleFinally
>0059DDF2    jmp         0059DDDC
 0059DDF4    mov         eax,ebx
 0059DDF6    pop         ebx
 0059DDF7    mov         esp,ebp
 0059DDF9    pop         ebp
 0059DDFA    ret
*}
end;

//0059DE28
function Stub_WSADuplicateSocketA(const s:PtrUInt; const dwProcessId:DWORD; lpProtocolInfo:PWSAProtocol_InfoA):Integer; stdcall;
begin
{*
 0059DE28    push        ebp
 0059DE29    mov         ebp,esp
 0059DE2B    add         esp,0FFFFFFF0
 0059DE2E    push        ebx
 0059DE2F    xor         eax,eax
 0059DE31    mov         dword ptr [ebp-10],eax
 0059DE34    mov         dword ptr [ebp-4],eax
 0059DE37    xor         eax,eax
 0059DE39    push        ebp
 0059DE3A    push        59DF0D
 0059DE3F    push        dword ptr fs:[eax]
 0059DE42    mov         dword ptr fs:[eax],esp
 0059DE45    mov         ebx,dword ptr ds:[789E68]
 0059DE4B    test        ebx,ebx
>0059DE4D    jne         0059DE88
 0059DE4F    lea         edx,[ebp-4]
 0059DE52    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DE57    call        LoadResString
 0059DE5C    mov         eax,dword ptr [ebp-4]
 0059DE5F    push        eax
 0059DE60    mov         eax,59DF2C;'WSADuplicateSocketA'
 0059DE65    mov         dword ptr [ebp-0C],eax
 0059DE68    mov         byte ptr [ebp-8],11
 0059DE6C    lea         eax,[ebp-0C]
 0059DE6F    push        eax
 0059DE70    push        0
 0059DE72    mov         ecx,276D
 0059DE77    mov         dl,1
 0059DE79    mov         eax,[0059A068];EIdWinsockStubError
 0059DE7E    call        EIdWinsockStubError.Build
 0059DE83    call        @RaiseExcept
 0059DE88    mov         eax,59DF2C;'WSADuplicateSocketA'
 0059DE8D    call        @UStrToPWChar
 0059DE92    push        eax
 0059DE93    push        ebx
 0059DE94    call        GetProcAddress
 0059DE99    test        eax,eax
>0059DE9B    jne         0059DED6
 0059DE9D    lea         edx,[ebp-10]
 0059DEA0    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DEA5    call        LoadResString
 0059DEAA    mov         eax,dword ptr [ebp-10]
 0059DEAD    push        eax
 0059DEAE    mov         eax,59DF2C;'WSADuplicateSocketA'
 0059DEB3    mov         dword ptr [ebp-0C],eax
 0059DEB6    mov         byte ptr [ebp-8],11
 0059DEBA    lea         eax,[ebp-0C]
 0059DEBD    push        eax
 0059DEBE    push        0
 0059DEC0    mov         ecx,2726
 0059DEC5    mov         dl,1
 0059DEC7    mov         eax,[0059A068];EIdWinsockStubError
 0059DECC    call        EIdWinsockStubError.Build
 0059DED1    call        @RaiseExcept
 0059DED6    mov         [00789D60],eax
 0059DEDB    mov         eax,dword ptr [ebp+10]
 0059DEDE    push        eax
 0059DEDF    mov         eax,dword ptr [ebp+0C]
 0059DEE2    push        eax
 0059DEE3    mov         eax,dword ptr [ebp+8]
 0059DEE6    push        eax
 0059DEE7    call        dword ptr ds:[789D60]
 0059DEED    mov         ebx,eax
 0059DEEF    xor         eax,eax
 0059DEF1    pop         edx
 0059DEF2    pop         ecx
 0059DEF3    pop         ecx
 0059DEF4    mov         dword ptr fs:[eax],edx
 0059DEF7    push        59DF14
 0059DEFC    lea         eax,[ebp-10]
 0059DEFF    call        @UStrClr
 0059DF04    lea         eax,[ebp-4]
 0059DF07    call        @UStrClr
 0059DF0C    ret
>0059DF0D    jmp         @HandleFinally
>0059DF12    jmp         0059DEFC
 0059DF14    mov         eax,ebx
 0059DF16    pop         ebx
 0059DF17    mov         esp,ebp
 0059DF19    pop         ebp
 0059DF1A    ret         0C
*}
end;

//0059DF54
function Stub_WSADuplicateSocketW(const s:PtrUInt; const dwProcessId:DWORD; lpProtocolInfo:PWSAProtocol_InfoW):Integer; stdcall;
begin
{*
 0059DF54    push        ebp
 0059DF55    mov         ebp,esp
 0059DF57    add         esp,0FFFFFFF0
 0059DF5A    push        ebx
 0059DF5B    xor         eax,eax
 0059DF5D    mov         dword ptr [ebp-10],eax
 0059DF60    mov         dword ptr [ebp-4],eax
 0059DF63    xor         eax,eax
 0059DF65    push        ebp
 0059DF66    push        59E039
 0059DF6B    push        dword ptr fs:[eax]
 0059DF6E    mov         dword ptr fs:[eax],esp
 0059DF71    mov         ebx,dword ptr ds:[789E68]
 0059DF77    test        ebx,ebx
>0059DF79    jne         0059DFB4
 0059DF7B    lea         edx,[ebp-4]
 0059DF7E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DF83    call        LoadResString
 0059DF88    mov         eax,dword ptr [ebp-4]
 0059DF8B    push        eax
 0059DF8C    mov         eax,59E058;'WSADuplicateSocketW'
 0059DF91    mov         dword ptr [ebp-0C],eax
 0059DF94    mov         byte ptr [ebp-8],11
 0059DF98    lea         eax,[ebp-0C]
 0059DF9B    push        eax
 0059DF9C    push        0
 0059DF9E    mov         ecx,276D
 0059DFA3    mov         dl,1
 0059DFA5    mov         eax,[0059A068];EIdWinsockStubError
 0059DFAA    call        EIdWinsockStubError.Build
 0059DFAF    call        @RaiseExcept
 0059DFB4    mov         eax,59E058;'WSADuplicateSocketW'
 0059DFB9    call        @UStrToPWChar
 0059DFBE    push        eax
 0059DFBF    push        ebx
 0059DFC0    call        GetProcAddress
 0059DFC5    test        eax,eax
>0059DFC7    jne         0059E002
 0059DFC9    lea         edx,[ebp-10]
 0059DFCC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059DFD1    call        LoadResString
 0059DFD6    mov         eax,dword ptr [ebp-10]
 0059DFD9    push        eax
 0059DFDA    mov         eax,59E058;'WSADuplicateSocketW'
 0059DFDF    mov         dword ptr [ebp-0C],eax
 0059DFE2    mov         byte ptr [ebp-8],11
 0059DFE6    lea         eax,[ebp-0C]
 0059DFE9    push        eax
 0059DFEA    push        0
 0059DFEC    mov         ecx,2726
 0059DFF1    mov         dl,1
 0059DFF3    mov         eax,[0059A068];EIdWinsockStubError
 0059DFF8    call        EIdWinsockStubError.Build
 0059DFFD    call        @RaiseExcept
 0059E002    mov         [00789D64],eax
 0059E007    mov         eax,dword ptr [ebp+10]
 0059E00A    push        eax
 0059E00B    mov         eax,dword ptr [ebp+0C]
 0059E00E    push        eax
 0059E00F    mov         eax,dword ptr [ebp+8]
 0059E012    push        eax
 0059E013    call        dword ptr ds:[789D64]
 0059E019    mov         ebx,eax
 0059E01B    xor         eax,eax
 0059E01D    pop         edx
 0059E01E    pop         ecx
 0059E01F    pop         ecx
 0059E020    mov         dword ptr fs:[eax],edx
 0059E023    push        59E040
 0059E028    lea         eax,[ebp-10]
 0059E02B    call        @UStrClr
 0059E030    lea         eax,[ebp-4]
 0059E033    call        @UStrClr
 0059E038    ret
>0059E039    jmp         @HandleFinally
>0059E03E    jmp         0059E028
 0059E040    mov         eax,ebx
 0059E042    pop         ebx
 0059E043    mov         esp,ebp
 0059E045    pop         ebp
 0059E046    ret         0C
*}
end;

//0059E080
function Stub_WSADuplicateSocket(const s:PtrUInt; const dwProcessId:DWORD; lpProtocolInfo:PWSAProtocol_InfoW):Integer; stdcall;
begin
{*
 0059E080    push        ebp
 0059E081    mov         ebp,esp
 0059E083    add         esp,0FFFFFFF0
 0059E086    push        ebx
 0059E087    xor         eax,eax
 0059E089    mov         dword ptr [ebp-10],eax
 0059E08C    mov         dword ptr [ebp-4],eax
 0059E08F    xor         eax,eax
 0059E091    push        ebp
 0059E092    push        59E165
 0059E097    push        dword ptr fs:[eax]
 0059E09A    mov         dword ptr fs:[eax],esp
 0059E09D    mov         ebx,dword ptr ds:[789E68]
 0059E0A3    test        ebx,ebx
>0059E0A5    jne         0059E0E0
 0059E0A7    lea         edx,[ebp-4]
 0059E0AA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E0AF    call        LoadResString
 0059E0B4    mov         eax,dword ptr [ebp-4]
 0059E0B7    push        eax
 0059E0B8    mov         eax,59E184;'WSADuplicateSocketW'
 0059E0BD    mov         dword ptr [ebp-0C],eax
 0059E0C0    mov         byte ptr [ebp-8],11
 0059E0C4    lea         eax,[ebp-0C]
 0059E0C7    push        eax
 0059E0C8    push        0
 0059E0CA    mov         ecx,276D
 0059E0CF    mov         dl,1
 0059E0D1    mov         eax,[0059A068];EIdWinsockStubError
 0059E0D6    call        EIdWinsockStubError.Build
 0059E0DB    call        @RaiseExcept
 0059E0E0    mov         eax,59E184;'WSADuplicateSocketW'
 0059E0E5    call        @UStrToPWChar
 0059E0EA    push        eax
 0059E0EB    push        ebx
 0059E0EC    call        GetProcAddress
 0059E0F1    test        eax,eax
>0059E0F3    jne         0059E12E
 0059E0F5    lea         edx,[ebp-10]
 0059E0F8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E0FD    call        LoadResString
 0059E102    mov         eax,dword ptr [ebp-10]
 0059E105    push        eax
 0059E106    mov         eax,59E184;'WSADuplicateSocketW'
 0059E10B    mov         dword ptr [ebp-0C],eax
 0059E10E    mov         byte ptr [ebp-8],11
 0059E112    lea         eax,[ebp-0C]
 0059E115    push        eax
 0059E116    push        0
 0059E118    mov         ecx,2726
 0059E11D    mov         dl,1
 0059E11F    mov         eax,[0059A068];EIdWinsockStubError
 0059E124    call        EIdWinsockStubError.Build
 0059E129    call        @RaiseExcept
 0059E12E    mov         [00789D68],eax
 0059E133    mov         eax,dword ptr [ebp+10]
 0059E136    push        eax
 0059E137    mov         eax,dword ptr [ebp+0C]
 0059E13A    push        eax
 0059E13B    mov         eax,dword ptr [ebp+8]
 0059E13E    push        eax
 0059E13F    call        dword ptr ds:[789D68]
 0059E145    mov         ebx,eax
 0059E147    xor         eax,eax
 0059E149    pop         edx
 0059E14A    pop         ecx
 0059E14B    pop         ecx
 0059E14C    mov         dword ptr fs:[eax],edx
 0059E14F    push        59E16C
 0059E154    lea         eax,[ebp-10]
 0059E157    call        @UStrClr
 0059E15C    lea         eax,[ebp-4]
 0059E15F    call        @UStrClr
 0059E164    ret
>0059E165    jmp         @HandleFinally
>0059E16A    jmp         0059E154
 0059E16C    mov         eax,ebx
 0059E16E    pop         ebx
 0059E16F    mov         esp,ebp
 0059E171    pop         ebp
 0059E172    ret         0C
*}
end;

//0059E1AC
function Stub_WSAEnumNetworkEvents(const s:PtrUInt; const hEventObject:THandle; lpNetworkEvents:PWSANetworkEvents):Integer; stdcall;
begin
{*
 0059E1AC    push        ebp
 0059E1AD    mov         ebp,esp
 0059E1AF    add         esp,0FFFFFFF0
 0059E1B2    push        ebx
 0059E1B3    xor         eax,eax
 0059E1B5    mov         dword ptr [ebp-10],eax
 0059E1B8    mov         dword ptr [ebp-4],eax
 0059E1BB    xor         eax,eax
 0059E1BD    push        ebp
 0059E1BE    push        59E291
 0059E1C3    push        dword ptr fs:[eax]
 0059E1C6    mov         dword ptr fs:[eax],esp
 0059E1C9    mov         ebx,dword ptr ds:[789E68]
 0059E1CF    test        ebx,ebx
>0059E1D1    jne         0059E20C
 0059E1D3    lea         edx,[ebp-4]
 0059E1D6    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E1DB    call        LoadResString
 0059E1E0    mov         eax,dword ptr [ebp-4]
 0059E1E3    push        eax
 0059E1E4    mov         eax,59E2B0;'WSAEnumNetworkEvents'
 0059E1E9    mov         dword ptr [ebp-0C],eax
 0059E1EC    mov         byte ptr [ebp-8],11
 0059E1F0    lea         eax,[ebp-0C]
 0059E1F3    push        eax
 0059E1F4    push        0
 0059E1F6    mov         ecx,276D
 0059E1FB    mov         dl,1
 0059E1FD    mov         eax,[0059A068];EIdWinsockStubError
 0059E202    call        EIdWinsockStubError.Build
 0059E207    call        @RaiseExcept
 0059E20C    mov         eax,59E2B0;'WSAEnumNetworkEvents'
 0059E211    call        @UStrToPWChar
 0059E216    push        eax
 0059E217    push        ebx
 0059E218    call        GetProcAddress
 0059E21D    test        eax,eax
>0059E21F    jne         0059E25A
 0059E221    lea         edx,[ebp-10]
 0059E224    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E229    call        LoadResString
 0059E22E    mov         eax,dword ptr [ebp-10]
 0059E231    push        eax
 0059E232    mov         eax,59E2B0;'WSAEnumNetworkEvents'
 0059E237    mov         dword ptr [ebp-0C],eax
 0059E23A    mov         byte ptr [ebp-8],11
 0059E23E    lea         eax,[ebp-0C]
 0059E241    push        eax
 0059E242    push        0
 0059E244    mov         ecx,2726
 0059E249    mov         dl,1
 0059E24B    mov         eax,[0059A068];EIdWinsockStubError
 0059E250    call        EIdWinsockStubError.Build
 0059E255    call        @RaiseExcept
 0059E25A    mov         [00789D6C],eax
 0059E25F    mov         eax,dword ptr [ebp+10]
 0059E262    push        eax
 0059E263    mov         eax,dword ptr [ebp+0C]
 0059E266    push        eax
 0059E267    mov         eax,dword ptr [ebp+8]
 0059E26A    push        eax
 0059E26B    call        dword ptr ds:[789D6C]
 0059E271    mov         ebx,eax
 0059E273    xor         eax,eax
 0059E275    pop         edx
 0059E276    pop         ecx
 0059E277    pop         ecx
 0059E278    mov         dword ptr fs:[eax],edx
 0059E27B    push        59E298
 0059E280    lea         eax,[ebp-10]
 0059E283    call        @UStrClr
 0059E288    lea         eax,[ebp-4]
 0059E28B    call        @UStrClr
 0059E290    ret
>0059E291    jmp         @HandleFinally
>0059E296    jmp         0059E280
 0059E298    mov         eax,ebx
 0059E29A    pop         ebx
 0059E29B    mov         esp,ebp
 0059E29D    pop         ebp
 0059E29E    ret         0C
*}
end;

//0059E2DC
function Stub_WSAEnumProtocolsA(lpiProtocols:PInteger; lpProtocolBuffer:PWSAProtocol_InfoA; var lpdwBufferLength:DWORD):Integer; stdcall;
begin
{*
 0059E2DC    push        ebp
 0059E2DD    mov         ebp,esp
 0059E2DF    add         esp,0FFFFFFF0
 0059E2E2    push        ebx
 0059E2E3    xor         eax,eax
 0059E2E5    mov         dword ptr [ebp-10],eax
 0059E2E8    mov         dword ptr [ebp-4],eax
 0059E2EB    xor         eax,eax
 0059E2ED    push        ebp
 0059E2EE    push        59E3C1
 0059E2F3    push        dword ptr fs:[eax]
 0059E2F6    mov         dword ptr fs:[eax],esp
 0059E2F9    mov         ebx,dword ptr ds:[789E68]
 0059E2FF    test        ebx,ebx
>0059E301    jne         0059E33C
 0059E303    lea         edx,[ebp-4]
 0059E306    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E30B    call        LoadResString
 0059E310    mov         eax,dword ptr [ebp-4]
 0059E313    push        eax
 0059E314    mov         eax,59E3E0;'WSAEnumProtocolsA'
 0059E319    mov         dword ptr [ebp-0C],eax
 0059E31C    mov         byte ptr [ebp-8],11
 0059E320    lea         eax,[ebp-0C]
 0059E323    push        eax
 0059E324    push        0
 0059E326    mov         ecx,276D
 0059E32B    mov         dl,1
 0059E32D    mov         eax,[0059A068];EIdWinsockStubError
 0059E332    call        EIdWinsockStubError.Build
 0059E337    call        @RaiseExcept
 0059E33C    mov         eax,59E3E0;'WSAEnumProtocolsA'
 0059E341    call        @UStrToPWChar
 0059E346    push        eax
 0059E347    push        ebx
 0059E348    call        GetProcAddress
 0059E34D    test        eax,eax
>0059E34F    jne         0059E38A
 0059E351    lea         edx,[ebp-10]
 0059E354    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E359    call        LoadResString
 0059E35E    mov         eax,dword ptr [ebp-10]
 0059E361    push        eax
 0059E362    mov         eax,59E3E0;'WSAEnumProtocolsA'
 0059E367    mov         dword ptr [ebp-0C],eax
 0059E36A    mov         byte ptr [ebp-8],11
 0059E36E    lea         eax,[ebp-0C]
 0059E371    push        eax
 0059E372    push        0
 0059E374    mov         ecx,2726
 0059E379    mov         dl,1
 0059E37B    mov         eax,[0059A068];EIdWinsockStubError
 0059E380    call        EIdWinsockStubError.Build
 0059E385    call        @RaiseExcept
 0059E38A    mov         [00789D70],eax
 0059E38F    mov         eax,dword ptr [ebp+10]
 0059E392    push        eax
 0059E393    mov         eax,dword ptr [ebp+0C]
 0059E396    push        eax
 0059E397    mov         eax,dword ptr [ebp+8]
 0059E39A    push        eax
 0059E39B    call        dword ptr ds:[789D70]
 0059E3A1    mov         ebx,eax
 0059E3A3    xor         eax,eax
 0059E3A5    pop         edx
 0059E3A6    pop         ecx
 0059E3A7    pop         ecx
 0059E3A8    mov         dword ptr fs:[eax],edx
 0059E3AB    push        59E3C8
 0059E3B0    lea         eax,[ebp-10]
 0059E3B3    call        @UStrClr
 0059E3B8    lea         eax,[ebp-4]
 0059E3BB    call        @UStrClr
 0059E3C0    ret
>0059E3C1    jmp         @HandleFinally
>0059E3C6    jmp         0059E3B0
 0059E3C8    mov         eax,ebx
 0059E3CA    pop         ebx
 0059E3CB    mov         esp,ebp
 0059E3CD    pop         ebp
 0059E3CE    ret         0C
*}
end;

//0059E404
function Stub_WSAEnumProtocolsW(lpiProtocols:PInteger; lpProtocolBuffer:PWSAProtocol_InfoW; var lpdwBufferLength:DWORD):Integer; stdcall;
begin
{*
 0059E404    push        ebp
 0059E405    mov         ebp,esp
 0059E407    add         esp,0FFFFFFF0
 0059E40A    push        ebx
 0059E40B    xor         eax,eax
 0059E40D    mov         dword ptr [ebp-10],eax
 0059E410    mov         dword ptr [ebp-4],eax
 0059E413    xor         eax,eax
 0059E415    push        ebp
 0059E416    push        59E4E9
 0059E41B    push        dword ptr fs:[eax]
 0059E41E    mov         dword ptr fs:[eax],esp
 0059E421    mov         ebx,dword ptr ds:[789E68]
 0059E427    test        ebx,ebx
>0059E429    jne         0059E464
 0059E42B    lea         edx,[ebp-4]
 0059E42E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E433    call        LoadResString
 0059E438    mov         eax,dword ptr [ebp-4]
 0059E43B    push        eax
 0059E43C    mov         eax,59E508;'WSAEnumProtocolsW'
 0059E441    mov         dword ptr [ebp-0C],eax
 0059E444    mov         byte ptr [ebp-8],11
 0059E448    lea         eax,[ebp-0C]
 0059E44B    push        eax
 0059E44C    push        0
 0059E44E    mov         ecx,276D
 0059E453    mov         dl,1
 0059E455    mov         eax,[0059A068];EIdWinsockStubError
 0059E45A    call        EIdWinsockStubError.Build
 0059E45F    call        @RaiseExcept
 0059E464    mov         eax,59E508;'WSAEnumProtocolsW'
 0059E469    call        @UStrToPWChar
 0059E46E    push        eax
 0059E46F    push        ebx
 0059E470    call        GetProcAddress
 0059E475    test        eax,eax
>0059E477    jne         0059E4B2
 0059E479    lea         edx,[ebp-10]
 0059E47C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E481    call        LoadResString
 0059E486    mov         eax,dword ptr [ebp-10]
 0059E489    push        eax
 0059E48A    mov         eax,59E508;'WSAEnumProtocolsW'
 0059E48F    mov         dword ptr [ebp-0C],eax
 0059E492    mov         byte ptr [ebp-8],11
 0059E496    lea         eax,[ebp-0C]
 0059E499    push        eax
 0059E49A    push        0
 0059E49C    mov         ecx,2726
 0059E4A1    mov         dl,1
 0059E4A3    mov         eax,[0059A068];EIdWinsockStubError
 0059E4A8    call        EIdWinsockStubError.Build
 0059E4AD    call        @RaiseExcept
 0059E4B2    mov         [00789D74],eax
 0059E4B7    mov         eax,dword ptr [ebp+10]
 0059E4BA    push        eax
 0059E4BB    mov         eax,dword ptr [ebp+0C]
 0059E4BE    push        eax
 0059E4BF    mov         eax,dword ptr [ebp+8]
 0059E4C2    push        eax
 0059E4C3    call        dword ptr ds:[789D74]
 0059E4C9    mov         ebx,eax
 0059E4CB    xor         eax,eax
 0059E4CD    pop         edx
 0059E4CE    pop         ecx
 0059E4CF    pop         ecx
 0059E4D0    mov         dword ptr fs:[eax],edx
 0059E4D3    push        59E4F0
 0059E4D8    lea         eax,[ebp-10]
 0059E4DB    call        @UStrClr
 0059E4E0    lea         eax,[ebp-4]
 0059E4E3    call        @UStrClr
 0059E4E8    ret
>0059E4E9    jmp         @HandleFinally
>0059E4EE    jmp         0059E4D8
 0059E4F0    mov         eax,ebx
 0059E4F2    pop         ebx
 0059E4F3    mov         esp,ebp
 0059E4F5    pop         ebp
 0059E4F6    ret         0C
*}
end;

//0059E52C
function Stub_WSAEnumProtocols(lpiProtocols:PInteger; lpProtocolBuffer:PWSAProtocol_InfoW; var lpdwBufferLength:DWORD):Integer; stdcall;
begin
{*
 0059E52C    push        ebp
 0059E52D    mov         ebp,esp
 0059E52F    add         esp,0FFFFFFF0
 0059E532    push        ebx
 0059E533    xor         eax,eax
 0059E535    mov         dword ptr [ebp-10],eax
 0059E538    mov         dword ptr [ebp-4],eax
 0059E53B    xor         eax,eax
 0059E53D    push        ebp
 0059E53E    push        59E611
 0059E543    push        dword ptr fs:[eax]
 0059E546    mov         dword ptr fs:[eax],esp
 0059E549    mov         ebx,dword ptr ds:[789E68]
 0059E54F    test        ebx,ebx
>0059E551    jne         0059E58C
 0059E553    lea         edx,[ebp-4]
 0059E556    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E55B    call        LoadResString
 0059E560    mov         eax,dword ptr [ebp-4]
 0059E563    push        eax
 0059E564    mov         eax,59E630;'WSAEnumProtocolsW'
 0059E569    mov         dword ptr [ebp-0C],eax
 0059E56C    mov         byte ptr [ebp-8],11
 0059E570    lea         eax,[ebp-0C]
 0059E573    push        eax
 0059E574    push        0
 0059E576    mov         ecx,276D
 0059E57B    mov         dl,1
 0059E57D    mov         eax,[0059A068];EIdWinsockStubError
 0059E582    call        EIdWinsockStubError.Build
 0059E587    call        @RaiseExcept
 0059E58C    mov         eax,59E630;'WSAEnumProtocolsW'
 0059E591    call        @UStrToPWChar
 0059E596    push        eax
 0059E597    push        ebx
 0059E598    call        GetProcAddress
 0059E59D    test        eax,eax
>0059E59F    jne         0059E5DA
 0059E5A1    lea         edx,[ebp-10]
 0059E5A4    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E5A9    call        LoadResString
 0059E5AE    mov         eax,dword ptr [ebp-10]
 0059E5B1    push        eax
 0059E5B2    mov         eax,59E630;'WSAEnumProtocolsW'
 0059E5B7    mov         dword ptr [ebp-0C],eax
 0059E5BA    mov         byte ptr [ebp-8],11
 0059E5BE    lea         eax,[ebp-0C]
 0059E5C1    push        eax
 0059E5C2    push        0
 0059E5C4    mov         ecx,2726
 0059E5C9    mov         dl,1
 0059E5CB    mov         eax,[0059A068];EIdWinsockStubError
 0059E5D0    call        EIdWinsockStubError.Build
 0059E5D5    call        @RaiseExcept
 0059E5DA    mov         [00789D78],eax
 0059E5DF    mov         eax,dword ptr [ebp+10]
 0059E5E2    push        eax
 0059E5E3    mov         eax,dword ptr [ebp+0C]
 0059E5E6    push        eax
 0059E5E7    mov         eax,dword ptr [ebp+8]
 0059E5EA    push        eax
 0059E5EB    call        dword ptr ds:[789D78]
 0059E5F1    mov         ebx,eax
 0059E5F3    xor         eax,eax
 0059E5F5    pop         edx
 0059E5F6    pop         ecx
 0059E5F7    pop         ecx
 0059E5F8    mov         dword ptr fs:[eax],edx
 0059E5FB    push        59E618
 0059E600    lea         eax,[ebp-10]
 0059E603    call        @UStrClr
 0059E608    lea         eax,[ebp-4]
 0059E60B    call        @UStrClr
 0059E610    ret
>0059E611    jmp         @HandleFinally
>0059E616    jmp         0059E600
 0059E618    mov         eax,ebx
 0059E61A    pop         ebx
 0059E61B    mov         esp,ebp
 0059E61D    pop         ebp
 0059E61E    ret         0C
*}
end;

//0059E654
function Stub_WSAEventSelect(const s:PtrUInt; const hEventObject:THandle; lNetworkEvents:LongInt):Integer; stdcall;
begin
{*
 0059E654    push        ebp
 0059E655    mov         ebp,esp
 0059E657    add         esp,0FFFFFFF0
 0059E65A    push        ebx
 0059E65B    xor         eax,eax
 0059E65D    mov         dword ptr [ebp-10],eax
 0059E660    mov         dword ptr [ebp-4],eax
 0059E663    xor         eax,eax
 0059E665    push        ebp
 0059E666    push        59E739
 0059E66B    push        dword ptr fs:[eax]
 0059E66E    mov         dword ptr fs:[eax],esp
 0059E671    mov         ebx,dword ptr ds:[789E68]
 0059E677    test        ebx,ebx
>0059E679    jne         0059E6B4
 0059E67B    lea         edx,[ebp-4]
 0059E67E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E683    call        LoadResString
 0059E688    mov         eax,dword ptr [ebp-4]
 0059E68B    push        eax
 0059E68C    mov         eax,59E758;'WSAEventSelect'
 0059E691    mov         dword ptr [ebp-0C],eax
 0059E694    mov         byte ptr [ebp-8],11
 0059E698    lea         eax,[ebp-0C]
 0059E69B    push        eax
 0059E69C    push        0
 0059E69E    mov         ecx,276D
 0059E6A3    mov         dl,1
 0059E6A5    mov         eax,[0059A068];EIdWinsockStubError
 0059E6AA    call        EIdWinsockStubError.Build
 0059E6AF    call        @RaiseExcept
 0059E6B4    mov         eax,59E758;'WSAEventSelect'
 0059E6B9    call        @UStrToPWChar
 0059E6BE    push        eax
 0059E6BF    push        ebx
 0059E6C0    call        GetProcAddress
 0059E6C5    test        eax,eax
>0059E6C7    jne         0059E702
 0059E6C9    lea         edx,[ebp-10]
 0059E6CC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E6D1    call        LoadResString
 0059E6D6    mov         eax,dword ptr [ebp-10]
 0059E6D9    push        eax
 0059E6DA    mov         eax,59E758;'WSAEventSelect'
 0059E6DF    mov         dword ptr [ebp-0C],eax
 0059E6E2    mov         byte ptr [ebp-8],11
 0059E6E6    lea         eax,[ebp-0C]
 0059E6E9    push        eax
 0059E6EA    push        0
 0059E6EC    mov         ecx,2726
 0059E6F1    mov         dl,1
 0059E6F3    mov         eax,[0059A068];EIdWinsockStubError
 0059E6F8    call        EIdWinsockStubError.Build
 0059E6FD    call        @RaiseExcept
 0059E702    mov         [00789D88],eax
 0059E707    mov         eax,dword ptr [ebp+10]
 0059E70A    push        eax
 0059E70B    mov         eax,dword ptr [ebp+0C]
 0059E70E    push        eax
 0059E70F    mov         eax,dword ptr [ebp+8]
 0059E712    push        eax
 0059E713    call        dword ptr ds:[789D88]
 0059E719    mov         ebx,eax
 0059E71B    xor         eax,eax
 0059E71D    pop         edx
 0059E71E    pop         ecx
 0059E71F    pop         ecx
 0059E720    mov         dword ptr fs:[eax],edx
 0059E723    push        59E740
 0059E728    lea         eax,[ebp-10]
 0059E72B    call        @UStrClr
 0059E730    lea         eax,[ebp-4]
 0059E733    call        @UStrClr
 0059E738    ret
>0059E739    jmp         @HandleFinally
>0059E73E    jmp         0059E728
 0059E740    mov         eax,ebx
 0059E742    pop         ebx
 0059E743    mov         esp,ebp
 0059E745    pop         ebp
 0059E746    ret         0C
*}
end;

//0059E778
function Stub_WSAGetOverlappedResult(const s:PtrUInt; AOverlapped:Pointer; lpcbTransfer:LPDWORD; fWait:BOOL; var lpdwFlags:DWORD):WordBool; stdcall;
begin
{*
 0059E778    push        ebp
 0059E779    mov         ebp,esp
 0059E77B    add         esp,0FFFFFFF0
 0059E77E    push        ebx
 0059E77F    xor         eax,eax
 0059E781    mov         dword ptr [ebp-10],eax
 0059E784    mov         dword ptr [ebp-4],eax
 0059E787    xor         eax,eax
 0059E789    push        ebp
 0059E78A    push        59E865
 0059E78F    push        dword ptr fs:[eax]
 0059E792    mov         dword ptr fs:[eax],esp
 0059E795    mov         ebx,dword ptr ds:[789E68]
 0059E79B    test        ebx,ebx
>0059E79D    jne         0059E7D8
 0059E79F    lea         edx,[ebp-4]
 0059E7A2    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E7A7    call        LoadResString
 0059E7AC    mov         eax,dword ptr [ebp-4]
 0059E7AF    push        eax
 0059E7B0    mov         eax,59E884;'WSAGetOverlappedResult'
 0059E7B5    mov         dword ptr [ebp-0C],eax
 0059E7B8    mov         byte ptr [ebp-8],11
 0059E7BC    lea         eax,[ebp-0C]
 0059E7BF    push        eax
 0059E7C0    push        0
 0059E7C2    mov         ecx,276D
 0059E7C7    mov         dl,1
 0059E7C9    mov         eax,[0059A068];EIdWinsockStubError
 0059E7CE    call        EIdWinsockStubError.Build
 0059E7D3    call        @RaiseExcept
 0059E7D8    mov         eax,59E884;'WSAGetOverlappedResult'
 0059E7DD    call        @UStrToPWChar
 0059E7E2    push        eax
 0059E7E3    push        ebx
 0059E7E4    call        GetProcAddress
 0059E7E9    test        eax,eax
>0059E7EB    jne         0059E826
 0059E7ED    lea         edx,[ebp-10]
 0059E7F0    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E7F5    call        LoadResString
 0059E7FA    mov         eax,dword ptr [ebp-10]
 0059E7FD    push        eax
 0059E7FE    mov         eax,59E884;'WSAGetOverlappedResult'
 0059E803    mov         dword ptr [ebp-0C],eax
 0059E806    mov         byte ptr [ebp-8],11
 0059E80A    lea         eax,[ebp-0C]
 0059E80D    push        eax
 0059E80E    push        0
 0059E810    mov         ecx,2726
 0059E815    mov         dl,1
 0059E817    mov         eax,[0059A068];EIdWinsockStubError
 0059E81C    call        EIdWinsockStubError.Build
 0059E821    call        @RaiseExcept
 0059E826    mov         [00789D8C],eax
 0059E82B    mov         eax,dword ptr [ebp+18]
 0059E82E    push        eax
 0059E82F    mov         eax,dword ptr [ebp+14]
 0059E832    push        eax
 0059E833    mov         eax,dword ptr [ebp+10]
 0059E836    push        eax
 0059E837    mov         eax,dword ptr [ebp+0C]
 0059E83A    push        eax
 0059E83B    mov         eax,dword ptr [ebp+8]
 0059E83E    push        eax
 0059E83F    call        dword ptr ds:[789D8C]
 0059E845    mov         ebx,eax
 0059E847    xor         eax,eax
 0059E849    pop         edx
 0059E84A    pop         ecx
 0059E84B    pop         ecx
 0059E84C    mov         dword ptr fs:[eax],edx
 0059E84F    push        59E86C
 0059E854    lea         eax,[ebp-10]
 0059E857    call        @UStrClr
 0059E85C    lea         eax,[ebp-4]
 0059E85F    call        @UStrClr
 0059E864    ret
>0059E865    jmp         @HandleFinally
>0059E86A    jmp         0059E854
 0059E86C    mov         eax,ebx
 0059E86E    pop         ebx
 0059E86F    mov         esp,ebp
 0059E871    pop         ebp
 0059E872    ret         14
*}
end;

//0059E8B4
function Stub_WSAGetQOSByName(const s:PtrUInt; lpQOSName:PWSABuf; lpQOS:PQOS):WordBool; stdcall;
begin
{*
 0059E8B4    push        ebp
 0059E8B5    mov         ebp,esp
 0059E8B7    add         esp,0FFFFFFF0
 0059E8BA    push        ebx
 0059E8BB    xor         eax,eax
 0059E8BD    mov         dword ptr [ebp-10],eax
 0059E8C0    mov         dword ptr [ebp-4],eax
 0059E8C3    xor         eax,eax
 0059E8C5    push        ebp
 0059E8C6    push        59E999
 0059E8CB    push        dword ptr fs:[eax]
 0059E8CE    mov         dword ptr fs:[eax],esp
 0059E8D1    mov         ebx,dword ptr ds:[789E68]
 0059E8D7    test        ebx,ebx
>0059E8D9    jne         0059E914
 0059E8DB    lea         edx,[ebp-4]
 0059E8DE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E8E3    call        LoadResString
 0059E8E8    mov         eax,dword ptr [ebp-4]
 0059E8EB    push        eax
 0059E8EC    mov         eax,59E9B8;'WSAGetQOSByName'
 0059E8F1    mov         dword ptr [ebp-0C],eax
 0059E8F4    mov         byte ptr [ebp-8],11
 0059E8F8    lea         eax,[ebp-0C]
 0059E8FB    push        eax
 0059E8FC    push        0
 0059E8FE    mov         ecx,276D
 0059E903    mov         dl,1
 0059E905    mov         eax,[0059A068];EIdWinsockStubError
 0059E90A    call        EIdWinsockStubError.Build
 0059E90F    call        @RaiseExcept
 0059E914    mov         eax,59E9B8;'WSAGetQOSByName'
 0059E919    call        @UStrToPWChar
 0059E91E    push        eax
 0059E91F    push        ebx
 0059E920    call        GetProcAddress
 0059E925    test        eax,eax
>0059E927    jne         0059E962
 0059E929    lea         edx,[ebp-10]
 0059E92C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059E931    call        LoadResString
 0059E936    mov         eax,dword ptr [ebp-10]
 0059E939    push        eax
 0059E93A    mov         eax,59E9B8;'WSAGetQOSByName'
 0059E93F    mov         dword ptr [ebp-0C],eax
 0059E942    mov         byte ptr [ebp-8],11
 0059E946    lea         eax,[ebp-0C]
 0059E949    push        eax
 0059E94A    push        0
 0059E94C    mov         ecx,2726
 0059E951    mov         dl,1
 0059E953    mov         eax,[0059A068];EIdWinsockStubError
 0059E958    call        EIdWinsockStubError.Build
 0059E95D    call        @RaiseExcept
 0059E962    mov         [00789D90],eax
 0059E967    mov         eax,dword ptr [ebp+10]
 0059E96A    push        eax
 0059E96B    mov         eax,dword ptr [ebp+0C]
 0059E96E    push        eax
 0059E96F    mov         eax,dword ptr [ebp+8]
 0059E972    push        eax
 0059E973    call        dword ptr ds:[789D90]
 0059E979    mov         ebx,eax
 0059E97B    xor         eax,eax
 0059E97D    pop         edx
 0059E97E    pop         ecx
 0059E97F    pop         ecx
 0059E980    mov         dword ptr fs:[eax],edx
 0059E983    push        59E9A0
 0059E988    lea         eax,[ebp-10]
 0059E98B    call        @UStrClr
 0059E990    lea         eax,[ebp-4]
 0059E993    call        @UStrClr
 0059E998    ret
>0059E999    jmp         @HandleFinally
>0059E99E    jmp         0059E988
 0059E9A0    mov         eax,ebx
 0059E9A2    pop         ebx
 0059E9A3    mov         esp,ebp
 0059E9A5    pop         ebp
 0059E9A6    ret         0C
*}
end;

//0059E9D8
function Stub_WSAHtonl(const s:PtrUInt; hostlong:DWORD; var lpnetlong:DWORD):Integer; stdcall;
begin
{*
 0059E9D8    push        ebp
 0059E9D9    mov         ebp,esp
 0059E9DB    add         esp,0FFFFFFF0
 0059E9DE    push        ebx
 0059E9DF    xor         eax,eax
 0059E9E1    mov         dword ptr [ebp-10],eax
 0059E9E4    mov         dword ptr [ebp-4],eax
 0059E9E7    xor         eax,eax
 0059E9E9    push        ebp
 0059E9EA    push        59EABD
 0059E9EF    push        dword ptr fs:[eax]
 0059E9F2    mov         dword ptr fs:[eax],esp
 0059E9F5    mov         ebx,dword ptr ds:[789E68]
 0059E9FB    test        ebx,ebx
>0059E9FD    jne         0059EA38
 0059E9FF    lea         edx,[ebp-4]
 0059EA02    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EA07    call        LoadResString
 0059EA0C    mov         eax,dword ptr [ebp-4]
 0059EA0F    push        eax
 0059EA10    mov         eax,59EADC;'WSAHtonl'
 0059EA15    mov         dword ptr [ebp-0C],eax
 0059EA18    mov         byte ptr [ebp-8],11
 0059EA1C    lea         eax,[ebp-0C]
 0059EA1F    push        eax
 0059EA20    push        0
 0059EA22    mov         ecx,276D
 0059EA27    mov         dl,1
 0059EA29    mov         eax,[0059A068];EIdWinsockStubError
 0059EA2E    call        EIdWinsockStubError.Build
 0059EA33    call        @RaiseExcept
 0059EA38    mov         eax,59EADC;'WSAHtonl'
 0059EA3D    call        @UStrToPWChar
 0059EA42    push        eax
 0059EA43    push        ebx
 0059EA44    call        GetProcAddress
 0059EA49    test        eax,eax
>0059EA4B    jne         0059EA86
 0059EA4D    lea         edx,[ebp-10]
 0059EA50    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EA55    call        LoadResString
 0059EA5A    mov         eax,dword ptr [ebp-10]
 0059EA5D    push        eax
 0059EA5E    mov         eax,59EADC;'WSAHtonl'
 0059EA63    mov         dword ptr [ebp-0C],eax
 0059EA66    mov         byte ptr [ebp-8],11
 0059EA6A    lea         eax,[ebp-0C]
 0059EA6D    push        eax
 0059EA6E    push        0
 0059EA70    mov         ecx,2726
 0059EA75    mov         dl,1
 0059EA77    mov         eax,[0059A068];EIdWinsockStubError
 0059EA7C    call        EIdWinsockStubError.Build
 0059EA81    call        @RaiseExcept
 0059EA86    mov         [00789DAC],eax
 0059EA8B    mov         eax,dword ptr [ebp+10]
 0059EA8E    push        eax
 0059EA8F    mov         eax,dword ptr [ebp+0C]
 0059EA92    push        eax
 0059EA93    mov         eax,dword ptr [ebp+8]
 0059EA96    push        eax
 0059EA97    call        dword ptr ds:[789DAC]
 0059EA9D    mov         ebx,eax
 0059EA9F    xor         eax,eax
 0059EAA1    pop         edx
 0059EAA2    pop         ecx
 0059EAA3    pop         ecx
 0059EAA4    mov         dword ptr fs:[eax],edx
 0059EAA7    push        59EAC4
 0059EAAC    lea         eax,[ebp-10]
 0059EAAF    call        @UStrClr
 0059EAB4    lea         eax,[ebp-4]
 0059EAB7    call        @UStrClr
 0059EABC    ret
>0059EABD    jmp         @HandleFinally
>0059EAC2    jmp         0059EAAC
 0059EAC4    mov         eax,ebx
 0059EAC6    pop         ebx
 0059EAC7    mov         esp,ebp
 0059EAC9    pop         ebp
 0059EACA    ret         0C
*}
end;

//0059EAF0
function Stub_WSAHtons(const s:PtrUInt; hostshort:Word; var lpnetshort:Word):Integer; stdcall;
begin
{*
 0059EAF0    push        ebp
 0059EAF1    mov         ebp,esp
 0059EAF3    add         esp,0FFFFFFF0
 0059EAF6    push        ebx
 0059EAF7    xor         eax,eax
 0059EAF9    mov         dword ptr [ebp-10],eax
 0059EAFC    mov         dword ptr [ebp-4],eax
 0059EAFF    xor         eax,eax
 0059EB01    push        ebp
 0059EB02    push        59EBD6
 0059EB07    push        dword ptr fs:[eax]
 0059EB0A    mov         dword ptr fs:[eax],esp
 0059EB0D    mov         ebx,dword ptr ds:[789E68]
 0059EB13    test        ebx,ebx
>0059EB15    jne         0059EB50
 0059EB17    lea         edx,[ebp-4]
 0059EB1A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EB1F    call        LoadResString
 0059EB24    mov         eax,dword ptr [ebp-4]
 0059EB27    push        eax
 0059EB28    mov         eax,59EBF4;'WSAHtons'
 0059EB2D    mov         dword ptr [ebp-0C],eax
 0059EB30    mov         byte ptr [ebp-8],11
 0059EB34    lea         eax,[ebp-0C]
 0059EB37    push        eax
 0059EB38    push        0
 0059EB3A    mov         ecx,276D
 0059EB3F    mov         dl,1
 0059EB41    mov         eax,[0059A068];EIdWinsockStubError
 0059EB46    call        EIdWinsockStubError.Build
 0059EB4B    call        @RaiseExcept
 0059EB50    mov         eax,59EBF4;'WSAHtons'
 0059EB55    call        @UStrToPWChar
 0059EB5A    push        eax
 0059EB5B    push        ebx
 0059EB5C    call        GetProcAddress
 0059EB61    test        eax,eax
>0059EB63    jne         0059EB9E
 0059EB65    lea         edx,[ebp-10]
 0059EB68    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EB6D    call        LoadResString
 0059EB72    mov         eax,dword ptr [ebp-10]
 0059EB75    push        eax
 0059EB76    mov         eax,59EBF4;'WSAHtons'
 0059EB7B    mov         dword ptr [ebp-0C],eax
 0059EB7E    mov         byte ptr [ebp-8],11
 0059EB82    lea         eax,[ebp-0C]
 0059EB85    push        eax
 0059EB86    push        0
 0059EB88    mov         ecx,2726
 0059EB8D    mov         dl,1
 0059EB8F    mov         eax,[0059A068];EIdWinsockStubError
 0059EB94    call        EIdWinsockStubError.Build
 0059EB99    call        @RaiseExcept
 0059EB9E    mov         [00789DB0],eax
 0059EBA3    mov         eax,dword ptr [ebp+10]
 0059EBA6    push        eax
 0059EBA7    movzx       eax,word ptr [ebp+0C]
 0059EBAB    push        eax
 0059EBAC    mov         eax,dword ptr [ebp+8]
 0059EBAF    push        eax
 0059EBB0    call        dword ptr ds:[789DB0]
 0059EBB6    mov         ebx,eax
 0059EBB8    xor         eax,eax
 0059EBBA    pop         edx
 0059EBBB    pop         ecx
 0059EBBC    pop         ecx
 0059EBBD    mov         dword ptr fs:[eax],edx
 0059EBC0    push        59EBDD
 0059EBC5    lea         eax,[ebp-10]
 0059EBC8    call        @UStrClr
 0059EBCD    lea         eax,[ebp-4]
 0059EBD0    call        @UStrClr
 0059EBD5    ret
>0059EBD6    jmp         @HandleFinally
>0059EBDB    jmp         0059EBC5
 0059EBDD    mov         eax,ebx
 0059EBDF    pop         ebx
 0059EBE0    mov         esp,ebp
 0059EBE2    pop         ebp
 0059EBE3    ret         0C
*}
end;

//0059EC08
function Stub_WSAIoctl(const s:PtrUInt; dwIoControlCode:DWORD; lpvInBuffer:Pointer; cbInBuffer:DWORD; lpvOutBuffer:Pointer; cbOutBuffer:DWORD; lpcbBytesReturned:LPDWORD; AOverlapped:Pointer; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 0059EC08    push        ebp
 0059EC09    mov         ebp,esp
 0059EC0B    add         esp,0FFFFFFF0
 0059EC0E    push        ebx
 0059EC0F    xor         eax,eax
 0059EC11    mov         dword ptr [ebp-10],eax
 0059EC14    mov         dword ptr [ebp-4],eax
 0059EC17    xor         eax,eax
 0059EC19    push        ebp
 0059EC1A    push        59ED05
 0059EC1F    push        dword ptr fs:[eax]
 0059EC22    mov         dword ptr fs:[eax],esp
 0059EC25    mov         ebx,dword ptr ds:[789E68]
 0059EC2B    test        ebx,ebx
>0059EC2D    jne         0059EC68
 0059EC2F    lea         edx,[ebp-4]
 0059EC32    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EC37    call        LoadResString
 0059EC3C    mov         eax,dword ptr [ebp-4]
 0059EC3F    push        eax
 0059EC40    mov         eax,59ED24;'WSAIoctl'
 0059EC45    mov         dword ptr [ebp-0C],eax
 0059EC48    mov         byte ptr [ebp-8],11
 0059EC4C    lea         eax,[ebp-0C]
 0059EC4F    push        eax
 0059EC50    push        0
 0059EC52    mov         ecx,276D
 0059EC57    mov         dl,1
 0059EC59    mov         eax,[0059A068];EIdWinsockStubError
 0059EC5E    call        EIdWinsockStubError.Build
 0059EC63    call        @RaiseExcept
 0059EC68    mov         eax,59ED24;'WSAIoctl'
 0059EC6D    call        @UStrToPWChar
 0059EC72    push        eax
 0059EC73    push        ebx
 0059EC74    call        GetProcAddress
 0059EC79    test        eax,eax
>0059EC7B    jne         0059ECB6
 0059EC7D    lea         edx,[ebp-10]
 0059EC80    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EC85    call        LoadResString
 0059EC8A    mov         eax,dword ptr [ebp-10]
 0059EC8D    push        eax
 0059EC8E    mov         eax,59ED24;'WSAIoctl'
 0059EC93    mov         dword ptr [ebp-0C],eax
 0059EC96    mov         byte ptr [ebp-8],11
 0059EC9A    lea         eax,[ebp-0C]
 0059EC9D    push        eax
 0059EC9E    push        0
 0059ECA0    mov         ecx,2726
 0059ECA5    mov         dl,1
 0059ECA7    mov         eax,[0059A068];EIdWinsockStubError
 0059ECAC    call        EIdWinsockStubError.Build
 0059ECB1    call        @RaiseExcept
 0059ECB6    mov         [00789DB4],eax
 0059ECBB    mov         eax,dword ptr [ebp+28]
 0059ECBE    push        eax
 0059ECBF    mov         eax,dword ptr [ebp+24]
 0059ECC2    push        eax
 0059ECC3    mov         eax,dword ptr [ebp+20]
 0059ECC6    push        eax
 0059ECC7    mov         eax,dword ptr [ebp+1C]
 0059ECCA    push        eax
 0059ECCB    mov         eax,dword ptr [ebp+18]
 0059ECCE    push        eax
 0059ECCF    mov         eax,dword ptr [ebp+14]
 0059ECD2    push        eax
 0059ECD3    mov         eax,dword ptr [ebp+10]
 0059ECD6    push        eax
 0059ECD7    mov         eax,dword ptr [ebp+0C]
 0059ECDA    push        eax
 0059ECDB    mov         eax,dword ptr [ebp+8]
 0059ECDE    push        eax
 0059ECDF    call        dword ptr ds:[789DB4]
 0059ECE5    mov         ebx,eax
 0059ECE7    xor         eax,eax
 0059ECE9    pop         edx
 0059ECEA    pop         ecx
 0059ECEB    pop         ecx
 0059ECEC    mov         dword ptr fs:[eax],edx
 0059ECEF    push        59ED0C
 0059ECF4    lea         eax,[ebp-10]
 0059ECF7    call        @UStrClr
 0059ECFC    lea         eax,[ebp-4]
 0059ECFF    call        @UStrClr
 0059ED04    ret
>0059ED05    jmp         @HandleFinally
>0059ED0A    jmp         0059ECF4
 0059ED0C    mov         eax,ebx
 0059ED0E    pop         ebx
 0059ED0F    mov         esp,ebp
 0059ED11    pop         ebp
 0059ED12    ret         24
*}
end;

//0059ED38
function Stub_WSAJoinLeaf(const s:PtrUInt; name:PSOCKADDR; namelen:Integer; lpCallerData:PWSABuf; lpCalleeData:PWSABuf; lpSQOS:PQOS; lpGQOS:PQOS; dwFlags:DWORD):PtrUInt; stdcall;
begin
{*
 0059ED38    push        ebp
 0059ED39    mov         ebp,esp
 0059ED3B    add         esp,0FFFFFFF0
 0059ED3E    push        ebx
 0059ED3F    xor         eax,eax
 0059ED41    mov         dword ptr [ebp-10],eax
 0059ED44    mov         dword ptr [ebp-4],eax
 0059ED47    xor         eax,eax
 0059ED49    push        ebp
 0059ED4A    push        59EE31
 0059ED4F    push        dword ptr fs:[eax]
 0059ED52    mov         dword ptr fs:[eax],esp
 0059ED55    mov         ebx,dword ptr ds:[789E68]
 0059ED5B    test        ebx,ebx
>0059ED5D    jne         0059ED98
 0059ED5F    lea         edx,[ebp-4]
 0059ED62    mov         eax,[0078D780];^SResString602:TResStringRec
 0059ED67    call        LoadResString
 0059ED6C    mov         eax,dword ptr [ebp-4]
 0059ED6F    push        eax
 0059ED70    mov         eax,59EE50;'WSAJoinLeaf'
 0059ED75    mov         dword ptr [ebp-0C],eax
 0059ED78    mov         byte ptr [ebp-8],11
 0059ED7C    lea         eax,[ebp-0C]
 0059ED7F    push        eax
 0059ED80    push        0
 0059ED82    mov         ecx,276D
 0059ED87    mov         dl,1
 0059ED89    mov         eax,[0059A068];EIdWinsockStubError
 0059ED8E    call        EIdWinsockStubError.Build
 0059ED93    call        @RaiseExcept
 0059ED98    mov         eax,59EE50;'WSAJoinLeaf'
 0059ED9D    call        @UStrToPWChar
 0059EDA2    push        eax
 0059EDA3    push        ebx
 0059EDA4    call        GetProcAddress
 0059EDA9    test        eax,eax
>0059EDAB    jne         0059EDE6
 0059EDAD    lea         edx,[ebp-10]
 0059EDB0    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EDB5    call        LoadResString
 0059EDBA    mov         eax,dword ptr [ebp-10]
 0059EDBD    push        eax
 0059EDBE    mov         eax,59EE50;'WSAJoinLeaf'
 0059EDC3    mov         dword ptr [ebp-0C],eax
 0059EDC6    mov         byte ptr [ebp-8],11
 0059EDCA    lea         eax,[ebp-0C]
 0059EDCD    push        eax
 0059EDCE    push        0
 0059EDD0    mov         ecx,2726
 0059EDD5    mov         dl,1
 0059EDD7    mov         eax,[0059A068];EIdWinsockStubError
 0059EDDC    call        EIdWinsockStubError.Build
 0059EDE1    call        @RaiseExcept
 0059EDE6    mov         [00789DC4],eax
 0059EDEB    mov         eax,dword ptr [ebp+24]
 0059EDEE    push        eax
 0059EDEF    mov         eax,dword ptr [ebp+20]
 0059EDF2    push        eax
 0059EDF3    mov         eax,dword ptr [ebp+1C]
 0059EDF6    push        eax
 0059EDF7    mov         eax,dword ptr [ebp+18]
 0059EDFA    push        eax
 0059EDFB    mov         eax,dword ptr [ebp+14]
 0059EDFE    push        eax
 0059EDFF    mov         eax,dword ptr [ebp+10]
 0059EE02    push        eax
 0059EE03    mov         eax,dword ptr [ebp+0C]
 0059EE06    push        eax
 0059EE07    mov         eax,dword ptr [ebp+8]
 0059EE0A    push        eax
 0059EE0B    call        dword ptr ds:[789DC4]
 0059EE11    mov         ebx,eax
 0059EE13    xor         eax,eax
 0059EE15    pop         edx
 0059EE16    pop         ecx
 0059EE17    pop         ecx
 0059EE18    mov         dword ptr fs:[eax],edx
 0059EE1B    push        59EE38
 0059EE20    lea         eax,[ebp-10]
 0059EE23    call        @UStrClr
 0059EE28    lea         eax,[ebp-4]
 0059EE2B    call        @UStrClr
 0059EE30    ret
>0059EE31    jmp         @HandleFinally
>0059EE36    jmp         0059EE20
 0059EE38    mov         eax,ebx
 0059EE3A    pop         ebx
 0059EE3B    mov         esp,ebp
 0059EE3D    pop         ebp
 0059EE3E    ret         20
*}
end;

//0059EE68
function Stub_WSANtohl(const s:PtrUInt; netlong:DWORD; var lphostlong:DWORD):Integer; stdcall;
begin
{*
 0059EE68    push        ebp
 0059EE69    mov         ebp,esp
 0059EE6B    add         esp,0FFFFFFF0
 0059EE6E    push        ebx
 0059EE6F    xor         eax,eax
 0059EE71    mov         dword ptr [ebp-10],eax
 0059EE74    mov         dword ptr [ebp-4],eax
 0059EE77    xor         eax,eax
 0059EE79    push        ebp
 0059EE7A    push        59EF4D
 0059EE7F    push        dword ptr fs:[eax]
 0059EE82    mov         dword ptr fs:[eax],esp
 0059EE85    mov         ebx,dword ptr ds:[789E68]
 0059EE8B    test        ebx,ebx
>0059EE8D    jne         0059EEC8
 0059EE8F    lea         edx,[ebp-4]
 0059EE92    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EE97    call        LoadResString
 0059EE9C    mov         eax,dword ptr [ebp-4]
 0059EE9F    push        eax
 0059EEA0    mov         eax,59EF6C;'WSANtohl'
 0059EEA5    mov         dword ptr [ebp-0C],eax
 0059EEA8    mov         byte ptr [ebp-8],11
 0059EEAC    lea         eax,[ebp-0C]
 0059EEAF    push        eax
 0059EEB0    push        0
 0059EEB2    mov         ecx,276D
 0059EEB7    mov         dl,1
 0059EEB9    mov         eax,[0059A068];EIdWinsockStubError
 0059EEBE    call        EIdWinsockStubError.Build
 0059EEC3    call        @RaiseExcept
 0059EEC8    mov         eax,59EF6C;'WSANtohl'
 0059EECD    call        @UStrToPWChar
 0059EED2    push        eax
 0059EED3    push        ebx
 0059EED4    call        GetProcAddress
 0059EED9    test        eax,eax
>0059EEDB    jne         0059EF16
 0059EEDD    lea         edx,[ebp-10]
 0059EEE0    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EEE5    call        LoadResString
 0059EEEA    mov         eax,dword ptr [ebp-10]
 0059EEED    push        eax
 0059EEEE    mov         eax,59EF6C;'WSANtohl'
 0059EEF3    mov         dword ptr [ebp-0C],eax
 0059EEF6    mov         byte ptr [ebp-8],11
 0059EEFA    lea         eax,[ebp-0C]
 0059EEFD    push        eax
 0059EEFE    push        0
 0059EF00    mov         ecx,2726
 0059EF05    mov         dl,1
 0059EF07    mov         eax,[0059A068];EIdWinsockStubError
 0059EF0C    call        EIdWinsockStubError.Build
 0059EF11    call        @RaiseExcept
 0059EF16    mov         [00789DE4],eax
 0059EF1B    mov         eax,dword ptr [ebp+10]
 0059EF1E    push        eax
 0059EF1F    mov         eax,dword ptr [ebp+0C]
 0059EF22    push        eax
 0059EF23    mov         eax,dword ptr [ebp+8]
 0059EF26    push        eax
 0059EF27    call        dword ptr ds:[789DE4]
 0059EF2D    mov         ebx,eax
 0059EF2F    xor         eax,eax
 0059EF31    pop         edx
 0059EF32    pop         ecx
 0059EF33    pop         ecx
 0059EF34    mov         dword ptr fs:[eax],edx
 0059EF37    push        59EF54
 0059EF3C    lea         eax,[ebp-10]
 0059EF3F    call        @UStrClr
 0059EF44    lea         eax,[ebp-4]
 0059EF47    call        @UStrClr
 0059EF4C    ret
>0059EF4D    jmp         @HandleFinally
>0059EF52    jmp         0059EF3C
 0059EF54    mov         eax,ebx
 0059EF56    pop         ebx
 0059EF57    mov         esp,ebp
 0059EF59    pop         ebp
 0059EF5A    ret         0C
*}
end;

//0059EF80
function Stub_WSANtohs(const s:PtrUInt; netshort:Word; var lphostshort:Word):Integer; stdcall;
begin
{*
 0059EF80    push        ebp
 0059EF81    mov         ebp,esp
 0059EF83    add         esp,0FFFFFFF0
 0059EF86    push        ebx
 0059EF87    xor         eax,eax
 0059EF89    mov         dword ptr [ebp-10],eax
 0059EF8C    mov         dword ptr [ebp-4],eax
 0059EF8F    xor         eax,eax
 0059EF91    push        ebp
 0059EF92    push        59F066
 0059EF97    push        dword ptr fs:[eax]
 0059EF9A    mov         dword ptr fs:[eax],esp
 0059EF9D    mov         ebx,dword ptr ds:[789E68]
 0059EFA3    test        ebx,ebx
>0059EFA5    jne         0059EFE0
 0059EFA7    lea         edx,[ebp-4]
 0059EFAA    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EFAF    call        LoadResString
 0059EFB4    mov         eax,dword ptr [ebp-4]
 0059EFB7    push        eax
 0059EFB8    mov         eax,59F084;'WSANtohs'
 0059EFBD    mov         dword ptr [ebp-0C],eax
 0059EFC0    mov         byte ptr [ebp-8],11
 0059EFC4    lea         eax,[ebp-0C]
 0059EFC7    push        eax
 0059EFC8    push        0
 0059EFCA    mov         ecx,276D
 0059EFCF    mov         dl,1
 0059EFD1    mov         eax,[0059A068];EIdWinsockStubError
 0059EFD6    call        EIdWinsockStubError.Build
 0059EFDB    call        @RaiseExcept
 0059EFE0    mov         eax,59F084;'WSANtohs'
 0059EFE5    call        @UStrToPWChar
 0059EFEA    push        eax
 0059EFEB    push        ebx
 0059EFEC    call        GetProcAddress
 0059EFF1    test        eax,eax
>0059EFF3    jne         0059F02E
 0059EFF5    lea         edx,[ebp-10]
 0059EFF8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059EFFD    call        LoadResString
 0059F002    mov         eax,dword ptr [ebp-10]
 0059F005    push        eax
 0059F006    mov         eax,59F084;'WSANtohs'
 0059F00B    mov         dword ptr [ebp-0C],eax
 0059F00E    mov         byte ptr [ebp-8],11
 0059F012    lea         eax,[ebp-0C]
 0059F015    push        eax
 0059F016    push        0
 0059F018    mov         ecx,2726
 0059F01D    mov         dl,1
 0059F01F    mov         eax,[0059A068];EIdWinsockStubError
 0059F024    call        EIdWinsockStubError.Build
 0059F029    call        @RaiseExcept
 0059F02E    mov         [00789DE8],eax
 0059F033    mov         eax,dword ptr [ebp+10]
 0059F036    push        eax
 0059F037    movzx       eax,word ptr [ebp+0C]
 0059F03B    push        eax
 0059F03C    mov         eax,dword ptr [ebp+8]
 0059F03F    push        eax
 0059F040    call        dword ptr ds:[789DE8]
 0059F046    mov         ebx,eax
 0059F048    xor         eax,eax
 0059F04A    pop         edx
 0059F04B    pop         ecx
 0059F04C    pop         ecx
 0059F04D    mov         dword ptr fs:[eax],edx
 0059F050    push        59F06D
 0059F055    lea         eax,[ebp-10]
 0059F058    call        @UStrClr
 0059F05D    lea         eax,[ebp-4]
 0059F060    call        @UStrClr
 0059F065    ret
>0059F066    jmp         @HandleFinally
>0059F06B    jmp         0059F055
 0059F06D    mov         eax,ebx
 0059F06F    pop         ebx
 0059F070    mov         esp,ebp
 0059F072    pop         ebp
 0059F073    ret         0C
*}
end;

//0059F098
function Stub_WSARecv(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesRecvd:DWORD; var lpFlags:DWORD; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 0059F098    push        ebp
 0059F099    mov         ebp,esp
 0059F09B    add         esp,0FFFFFFF0
 0059F09E    push        ebx
 0059F09F    xor         eax,eax
 0059F0A1    mov         dword ptr [ebp-10],eax
 0059F0A4    mov         dword ptr [ebp-4],eax
 0059F0A7    xor         eax,eax
 0059F0A9    push        ebp
 0059F0AA    push        59F18D
 0059F0AF    push        dword ptr fs:[eax]
 0059F0B2    mov         dword ptr fs:[eax],esp
 0059F0B5    mov         ebx,dword ptr ds:[789E68]
 0059F0BB    test        ebx,ebx
>0059F0BD    jne         0059F0F8
 0059F0BF    lea         edx,[ebp-4]
 0059F0C2    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F0C7    call        LoadResString
 0059F0CC    mov         eax,dword ptr [ebp-4]
 0059F0CF    push        eax
 0059F0D0    mov         eax,59F1AC;'WSARecv'
 0059F0D5    mov         dword ptr [ebp-0C],eax
 0059F0D8    mov         byte ptr [ebp-8],11
 0059F0DC    lea         eax,[ebp-0C]
 0059F0DF    push        eax
 0059F0E0    push        0
 0059F0E2    mov         ecx,276D
 0059F0E7    mov         dl,1
 0059F0E9    mov         eax,[0059A068];EIdWinsockStubError
 0059F0EE    call        EIdWinsockStubError.Build
 0059F0F3    call        @RaiseExcept
 0059F0F8    mov         eax,59F1AC;'WSARecv'
 0059F0FD    call        @UStrToPWChar
 0059F102    push        eax
 0059F103    push        ebx
 0059F104    call        GetProcAddress
 0059F109    test        eax,eax
>0059F10B    jne         0059F146
 0059F10D    lea         edx,[ebp-10]
 0059F110    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F115    call        LoadResString
 0059F11A    mov         eax,dword ptr [ebp-10]
 0059F11D    push        eax
 0059F11E    mov         eax,59F1AC;'WSARecv'
 0059F123    mov         dword ptr [ebp-0C],eax
 0059F126    mov         byte ptr [ebp-8],11
 0059F12A    lea         eax,[ebp-0C]
 0059F12D    push        eax
 0059F12E    push        0
 0059F130    mov         ecx,2726
 0059F135    mov         dl,1
 0059F137    mov         eax,[0059A068];EIdWinsockStubError
 0059F13C    call        EIdWinsockStubError.Build
 0059F141    call        @RaiseExcept
 0059F146    mov         [00789DEC],eax
 0059F14B    mov         eax,dword ptr [ebp+20]
 0059F14E    push        eax
 0059F14F    mov         eax,dword ptr [ebp+1C]
 0059F152    push        eax
 0059F153    mov         eax,dword ptr [ebp+18]
 0059F156    push        eax
 0059F157    mov         eax,dword ptr [ebp+14]
 0059F15A    push        eax
 0059F15B    mov         eax,dword ptr [ebp+10]
 0059F15E    push        eax
 0059F15F    mov         eax,dword ptr [ebp+0C]
 0059F162    push        eax
 0059F163    mov         eax,dword ptr [ebp+8]
 0059F166    push        eax
 0059F167    call        dword ptr ds:[789DEC]
 0059F16D    mov         ebx,eax
 0059F16F    xor         eax,eax
 0059F171    pop         edx
 0059F172    pop         ecx
 0059F173    pop         ecx
 0059F174    mov         dword ptr fs:[eax],edx
 0059F177    push        59F194
 0059F17C    lea         eax,[ebp-10]
 0059F17F    call        @UStrClr
 0059F184    lea         eax,[ebp-4]
 0059F187    call        @UStrClr
 0059F18C    ret
>0059F18D    jmp         @HandleFinally
>0059F192    jmp         0059F17C
 0059F194    mov         eax,ebx
 0059F196    pop         ebx
 0059F197    mov         esp,ebp
 0059F199    pop         ebp
 0059F19A    ret         1C
*}
end;

//0059F1BC
function Stub_WSARecvDisconnect(const s:PtrUInt; lpInboundDisconnectData:PWSABuf):Integer; stdcall;
begin
{*
 0059F1BC    push        ebp
 0059F1BD    mov         ebp,esp
 0059F1BF    add         esp,0FFFFFFF0
 0059F1C2    push        ebx
 0059F1C3    xor         eax,eax
 0059F1C5    mov         dword ptr [ebp-10],eax
 0059F1C8    mov         dword ptr [ebp-4],eax
 0059F1CB    xor         eax,eax
 0059F1CD    push        ebp
 0059F1CE    push        59F29D
 0059F1D3    push        dword ptr fs:[eax]
 0059F1D6    mov         dword ptr fs:[eax],esp
 0059F1D9    mov         ebx,dword ptr ds:[789E68]
 0059F1DF    test        ebx,ebx
>0059F1E1    jne         0059F21C
 0059F1E3    lea         edx,[ebp-4]
 0059F1E6    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F1EB    call        LoadResString
 0059F1F0    mov         eax,dword ptr [ebp-4]
 0059F1F3    push        eax
 0059F1F4    mov         eax,59F2BC;'WSARecvDisconnect'
 0059F1F9    mov         dword ptr [ebp-0C],eax
 0059F1FC    mov         byte ptr [ebp-8],11
 0059F200    lea         eax,[ebp-0C]
 0059F203    push        eax
 0059F204    push        0
 0059F206    mov         ecx,276D
 0059F20B    mov         dl,1
 0059F20D    mov         eax,[0059A068];EIdWinsockStubError
 0059F212    call        EIdWinsockStubError.Build
 0059F217    call        @RaiseExcept
 0059F21C    mov         eax,59F2BC;'WSARecvDisconnect'
 0059F221    call        @UStrToPWChar
 0059F226    push        eax
 0059F227    push        ebx
 0059F228    call        GetProcAddress
 0059F22D    test        eax,eax
>0059F22F    jne         0059F26A
 0059F231    lea         edx,[ebp-10]
 0059F234    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F239    call        LoadResString
 0059F23E    mov         eax,dword ptr [ebp-10]
 0059F241    push        eax
 0059F242    mov         eax,59F2BC;'WSARecvDisconnect'
 0059F247    mov         dword ptr [ebp-0C],eax
 0059F24A    mov         byte ptr [ebp-8],11
 0059F24E    lea         eax,[ebp-0C]
 0059F251    push        eax
 0059F252    push        0
 0059F254    mov         ecx,2726
 0059F259    mov         dl,1
 0059F25B    mov         eax,[0059A068];EIdWinsockStubError
 0059F260    call        EIdWinsockStubError.Build
 0059F265    call        @RaiseExcept
 0059F26A    mov         [00789DF0],eax
 0059F26F    mov         eax,dword ptr [ebp+0C]
 0059F272    push        eax
 0059F273    mov         eax,dword ptr [ebp+8]
 0059F276    push        eax
 0059F277    call        dword ptr ds:[789DF0]
 0059F27D    mov         ebx,eax
 0059F27F    xor         eax,eax
 0059F281    pop         edx
 0059F282    pop         ecx
 0059F283    pop         ecx
 0059F284    mov         dword ptr fs:[eax],edx
 0059F287    push        59F2A4
 0059F28C    lea         eax,[ebp-10]
 0059F28F    call        @UStrClr
 0059F294    lea         eax,[ebp-4]
 0059F297    call        @UStrClr
 0059F29C    ret
>0059F29D    jmp         @HandleFinally
>0059F2A2    jmp         0059F28C
 0059F2A4    mov         eax,ebx
 0059F2A6    pop         ebx
 0059F2A7    mov         esp,ebp
 0059F2A9    pop         ebp
 0059F2AA    ret         8
*}
end;

//0059F2E0
function Stub_WSARecvFrom(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesRecvd:DWORD; var lpFlags:DWORD; lpFrom:PSOCKADDR; lpFromlen:PInteger; AOverlapped:Pointer; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 0059F2E0    push        ebp
 0059F2E1    mov         ebp,esp
 0059F2E3    add         esp,0FFFFFFF0
 0059F2E6    push        ebx
 0059F2E7    xor         eax,eax
 0059F2E9    mov         dword ptr [ebp-10],eax
 0059F2EC    mov         dword ptr [ebp-4],eax
 0059F2EF    xor         eax,eax
 0059F2F1    push        ebp
 0059F2F2    push        59F3DD
 0059F2F7    push        dword ptr fs:[eax]
 0059F2FA    mov         dword ptr fs:[eax],esp
 0059F2FD    mov         ebx,dword ptr ds:[789E68]
 0059F303    test        ebx,ebx
>0059F305    jne         0059F340
 0059F307    lea         edx,[ebp-4]
 0059F30A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F30F    call        LoadResString
 0059F314    mov         eax,dword ptr [ebp-4]
 0059F317    push        eax
 0059F318    mov         eax,59F3FC;'WSARecvFrom'
 0059F31D    mov         dword ptr [ebp-0C],eax
 0059F320    mov         byte ptr [ebp-8],11
 0059F324    lea         eax,[ebp-0C]
 0059F327    push        eax
 0059F328    push        0
 0059F32A    mov         ecx,276D
 0059F32F    mov         dl,1
 0059F331    mov         eax,[0059A068];EIdWinsockStubError
 0059F336    call        EIdWinsockStubError.Build
 0059F33B    call        @RaiseExcept
 0059F340    mov         eax,59F3FC;'WSARecvFrom'
 0059F345    call        @UStrToPWChar
 0059F34A    push        eax
 0059F34B    push        ebx
 0059F34C    call        GetProcAddress
 0059F351    test        eax,eax
>0059F353    jne         0059F38E
 0059F355    lea         edx,[ebp-10]
 0059F358    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F35D    call        LoadResString
 0059F362    mov         eax,dword ptr [ebp-10]
 0059F365    push        eax
 0059F366    mov         eax,59F3FC;'WSARecvFrom'
 0059F36B    mov         dword ptr [ebp-0C],eax
 0059F36E    mov         byte ptr [ebp-8],11
 0059F372    lea         eax,[ebp-0C]
 0059F375    push        eax
 0059F376    push        0
 0059F378    mov         ecx,2726
 0059F37D    mov         dl,1
 0059F37F    mov         eax,[0059A068];EIdWinsockStubError
 0059F384    call        EIdWinsockStubError.Build
 0059F389    call        @RaiseExcept
 0059F38E    mov         [00789DF4],eax
 0059F393    mov         eax,dword ptr [ebp+28]
 0059F396    push        eax
 0059F397    mov         eax,dword ptr [ebp+24]
 0059F39A    push        eax
 0059F39B    mov         eax,dword ptr [ebp+20]
 0059F39E    push        eax
 0059F39F    mov         eax,dword ptr [ebp+1C]
 0059F3A2    push        eax
 0059F3A3    mov         eax,dword ptr [ebp+18]
 0059F3A6    push        eax
 0059F3A7    mov         eax,dword ptr [ebp+14]
 0059F3AA    push        eax
 0059F3AB    mov         eax,dword ptr [ebp+10]
 0059F3AE    push        eax
 0059F3AF    mov         eax,dword ptr [ebp+0C]
 0059F3B2    push        eax
 0059F3B3    mov         eax,dword ptr [ebp+8]
 0059F3B6    push        eax
 0059F3B7    call        dword ptr ds:[789DF4]
 0059F3BD    mov         ebx,eax
 0059F3BF    xor         eax,eax
 0059F3C1    pop         edx
 0059F3C2    pop         ecx
 0059F3C3    pop         ecx
 0059F3C4    mov         dword ptr fs:[eax],edx
 0059F3C7    push        59F3E4
 0059F3CC    lea         eax,[ebp-10]
 0059F3CF    call        @UStrClr
 0059F3D4    lea         eax,[ebp-4]
 0059F3D7    call        @UStrClr
 0059F3DC    ret
>0059F3DD    jmp         @HandleFinally
>0059F3E2    jmp         0059F3CC
 0059F3E4    mov         eax,ebx
 0059F3E6    pop         ebx
 0059F3E7    mov         esp,ebp
 0059F3E9    pop         ebp
 0059F3EA    ret         24
*}
end;

//0059F414
function Stub_WSAResetEvent(hEvent:THandle):WordBool; stdcall;
begin
{*
 0059F414    push        ebp
 0059F415    mov         ebp,esp
 0059F417    add         esp,0FFFFFFF0
 0059F41A    push        ebx
 0059F41B    xor         eax,eax
 0059F41D    mov         dword ptr [ebp-10],eax
 0059F420    mov         dword ptr [ebp-4],eax
 0059F423    xor         eax,eax
 0059F425    push        ebp
 0059F426    push        59F4F1
 0059F42B    push        dword ptr fs:[eax]
 0059F42E    mov         dword ptr fs:[eax],esp
 0059F431    mov         ebx,dword ptr ds:[789E68]
 0059F437    test        ebx,ebx
>0059F439    jne         0059F474
 0059F43B    lea         edx,[ebp-4]
 0059F43E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F443    call        LoadResString
 0059F448    mov         eax,dword ptr [ebp-4]
 0059F44B    push        eax
 0059F44C    mov         eax,59F510;'WSAResetEvent'
 0059F451    mov         dword ptr [ebp-0C],eax
 0059F454    mov         byte ptr [ebp-8],11
 0059F458    lea         eax,[ebp-0C]
 0059F45B    push        eax
 0059F45C    push        0
 0059F45E    mov         ecx,276D
 0059F463    mov         dl,1
 0059F465    mov         eax,[0059A068];EIdWinsockStubError
 0059F46A    call        EIdWinsockStubError.Build
 0059F46F    call        @RaiseExcept
 0059F474    mov         eax,59F510;'WSAResetEvent'
 0059F479    call        @UStrToPWChar
 0059F47E    push        eax
 0059F47F    push        ebx
 0059F480    call        GetProcAddress
 0059F485    test        eax,eax
>0059F487    jne         0059F4C2
 0059F489    lea         edx,[ebp-10]
 0059F48C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F491    call        LoadResString
 0059F496    mov         eax,dword ptr [ebp-10]
 0059F499    push        eax
 0059F49A    mov         eax,59F510;'WSAResetEvent'
 0059F49F    mov         dword ptr [ebp-0C],eax
 0059F4A2    mov         byte ptr [ebp-8],11
 0059F4A6    lea         eax,[ebp-0C]
 0059F4A9    push        eax
 0059F4AA    push        0
 0059F4AC    mov         ecx,2726
 0059F4B1    mov         dl,1
 0059F4B3    mov         eax,[0059A068];EIdWinsockStubError
 0059F4B8    call        EIdWinsockStubError.Build
 0059F4BD    call        @RaiseExcept
 0059F4C2    mov         [00789DFC],eax
 0059F4C7    mov         eax,dword ptr [ebp+8]
 0059F4CA    push        eax
 0059F4CB    call        dword ptr ds:[789DFC]
 0059F4D1    mov         ebx,eax
 0059F4D3    xor         eax,eax
 0059F4D5    pop         edx
 0059F4D6    pop         ecx
 0059F4D7    pop         ecx
 0059F4D8    mov         dword ptr fs:[eax],edx
 0059F4DB    push        59F4F8
 0059F4E0    lea         eax,[ebp-10]
 0059F4E3    call        @UStrClr
 0059F4E8    lea         eax,[ebp-4]
 0059F4EB    call        @UStrClr
 0059F4F0    ret
>0059F4F1    jmp         @HandleFinally
>0059F4F6    jmp         0059F4E0
 0059F4F8    mov         eax,ebx
 0059F4FA    pop         ebx
 0059F4FB    mov         esp,ebp
 0059F4FD    pop         ebp
 0059F4FE    ret         4
*}
end;

//0059F52C
function Stub_WSASend(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesSent:DWORD; dwFlags:DWORD; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 0059F52C    push        ebp
 0059F52D    mov         ebp,esp
 0059F52F    add         esp,0FFFFFFF0
 0059F532    push        ebx
 0059F533    xor         eax,eax
 0059F535    mov         dword ptr [ebp-10],eax
 0059F538    mov         dword ptr [ebp-4],eax
 0059F53B    xor         eax,eax
 0059F53D    push        ebp
 0059F53E    push        59F621
 0059F543    push        dword ptr fs:[eax]
 0059F546    mov         dword ptr fs:[eax],esp
 0059F549    mov         ebx,dword ptr ds:[789E68]
 0059F54F    test        ebx,ebx
>0059F551    jne         0059F58C
 0059F553    lea         edx,[ebp-4]
 0059F556    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F55B    call        LoadResString
 0059F560    mov         eax,dword ptr [ebp-4]
 0059F563    push        eax
 0059F564    mov         eax,59F640;'WSASend'
 0059F569    mov         dword ptr [ebp-0C],eax
 0059F56C    mov         byte ptr [ebp-8],11
 0059F570    lea         eax,[ebp-0C]
 0059F573    push        eax
 0059F574    push        0
 0059F576    mov         ecx,276D
 0059F57B    mov         dl,1
 0059F57D    mov         eax,[0059A068];EIdWinsockStubError
 0059F582    call        EIdWinsockStubError.Build
 0059F587    call        @RaiseExcept
 0059F58C    mov         eax,59F640;'WSASend'
 0059F591    call        @UStrToPWChar
 0059F596    push        eax
 0059F597    push        ebx
 0059F598    call        GetProcAddress
 0059F59D    test        eax,eax
>0059F59F    jne         0059F5DA
 0059F5A1    lea         edx,[ebp-10]
 0059F5A4    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F5A9    call        LoadResString
 0059F5AE    mov         eax,dword ptr [ebp-10]
 0059F5B1    push        eax
 0059F5B2    mov         eax,59F640;'WSASend'
 0059F5B7    mov         dword ptr [ebp-0C],eax
 0059F5BA    mov         byte ptr [ebp-8],11
 0059F5BE    lea         eax,[ebp-0C]
 0059F5C1    push        eax
 0059F5C2    push        0
 0059F5C4    mov         ecx,2726
 0059F5C9    mov         dl,1
 0059F5CB    mov         eax,[0059A068];EIdWinsockStubError
 0059F5D0    call        EIdWinsockStubError.Build
 0059F5D5    call        @RaiseExcept
 0059F5DA    mov         [00789E00],eax
 0059F5DF    mov         eax,dword ptr [ebp+20]
 0059F5E2    push        eax
 0059F5E3    mov         eax,dword ptr [ebp+1C]
 0059F5E6    push        eax
 0059F5E7    mov         eax,dword ptr [ebp+18]
 0059F5EA    push        eax
 0059F5EB    mov         eax,dword ptr [ebp+14]
 0059F5EE    push        eax
 0059F5EF    mov         eax,dword ptr [ebp+10]
 0059F5F2    push        eax
 0059F5F3    mov         eax,dword ptr [ebp+0C]
 0059F5F6    push        eax
 0059F5F7    mov         eax,dword ptr [ebp+8]
 0059F5FA    push        eax
 0059F5FB    call        dword ptr ds:[789E00]
 0059F601    mov         ebx,eax
 0059F603    xor         eax,eax
 0059F605    pop         edx
 0059F606    pop         ecx
 0059F607    pop         ecx
 0059F608    mov         dword ptr fs:[eax],edx
 0059F60B    push        59F628
 0059F610    lea         eax,[ebp-10]
 0059F613    call        @UStrClr
 0059F618    lea         eax,[ebp-4]
 0059F61B    call        @UStrClr
 0059F620    ret
>0059F621    jmp         @HandleFinally
>0059F626    jmp         0059F610
 0059F628    mov         eax,ebx
 0059F62A    pop         ebx
 0059F62B    mov         esp,ebp
 0059F62D    pop         ebp
 0059F62E    ret         1C
*}
end;

//0059F650
function Stub_WSASendDisconnect(const s:PtrUInt; lpOutboundDisconnectData:PWSABuf):Integer; stdcall;
begin
{*
 0059F650    push        ebp
 0059F651    mov         ebp,esp
 0059F653    add         esp,0FFFFFFF0
 0059F656    push        ebx
 0059F657    xor         eax,eax
 0059F659    mov         dword ptr [ebp-10],eax
 0059F65C    mov         dword ptr [ebp-4],eax
 0059F65F    xor         eax,eax
 0059F661    push        ebp
 0059F662    push        59F731
 0059F667    push        dword ptr fs:[eax]
 0059F66A    mov         dword ptr fs:[eax],esp
 0059F66D    mov         ebx,dword ptr ds:[789E68]
 0059F673    test        ebx,ebx
>0059F675    jne         0059F6B0
 0059F677    lea         edx,[ebp-4]
 0059F67A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F67F    call        LoadResString
 0059F684    mov         eax,dword ptr [ebp-4]
 0059F687    push        eax
 0059F688    mov         eax,59F750;'WSASendDisconnect'
 0059F68D    mov         dword ptr [ebp-0C],eax
 0059F690    mov         byte ptr [ebp-8],11
 0059F694    lea         eax,[ebp-0C]
 0059F697    push        eax
 0059F698    push        0
 0059F69A    mov         ecx,276D
 0059F69F    mov         dl,1
 0059F6A1    mov         eax,[0059A068];EIdWinsockStubError
 0059F6A6    call        EIdWinsockStubError.Build
 0059F6AB    call        @RaiseExcept
 0059F6B0    mov         eax,59F750;'WSASendDisconnect'
 0059F6B5    call        @UStrToPWChar
 0059F6BA    push        eax
 0059F6BB    push        ebx
 0059F6BC    call        GetProcAddress
 0059F6C1    test        eax,eax
>0059F6C3    jne         0059F6FE
 0059F6C5    lea         edx,[ebp-10]
 0059F6C8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F6CD    call        LoadResString
 0059F6D2    mov         eax,dword ptr [ebp-10]
 0059F6D5    push        eax
 0059F6D6    mov         eax,59F750;'WSASendDisconnect'
 0059F6DB    mov         dword ptr [ebp-0C],eax
 0059F6DE    mov         byte ptr [ebp-8],11
 0059F6E2    lea         eax,[ebp-0C]
 0059F6E5    push        eax
 0059F6E6    push        0
 0059F6E8    mov         ecx,2726
 0059F6ED    mov         dl,1
 0059F6EF    mov         eax,[0059A068];EIdWinsockStubError
 0059F6F4    call        EIdWinsockStubError.Build
 0059F6F9    call        @RaiseExcept
 0059F6FE    mov         [00789E04],eax
 0059F703    mov         eax,dword ptr [ebp+0C]
 0059F706    push        eax
 0059F707    mov         eax,dword ptr [ebp+8]
 0059F70A    push        eax
 0059F70B    call        dword ptr ds:[789E04]
 0059F711    mov         ebx,eax
 0059F713    xor         eax,eax
 0059F715    pop         edx
 0059F716    pop         ecx
 0059F717    pop         ecx
 0059F718    mov         dword ptr fs:[eax],edx
 0059F71B    push        59F738
 0059F720    lea         eax,[ebp-10]
 0059F723    call        @UStrClr
 0059F728    lea         eax,[ebp-4]
 0059F72B    call        @UStrClr
 0059F730    ret
>0059F731    jmp         @HandleFinally
>0059F736    jmp         0059F720
 0059F738    mov         eax,ebx
 0059F73A    pop         ebx
 0059F73B    mov         esp,ebp
 0059F73D    pop         ebp
 0059F73E    ret         8
*}
end;

//0059F774
function Stub_WSASendTo(const s:PtrUInt; lpBuffers:PWSABuf; dwBufferCount:DWORD; var lpNumberOfBytesSent:DWORD; dwFlags:DWORD; lpTo:PSOCKADDR; iTolen:Integer; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 0059F774    push        ebp
 0059F775    mov         ebp,esp
 0059F777    add         esp,0FFFFFFF0
 0059F77A    push        ebx
 0059F77B    xor         eax,eax
 0059F77D    mov         dword ptr [ebp-10],eax
 0059F780    mov         dword ptr [ebp-4],eax
 0059F783    xor         eax,eax
 0059F785    push        ebp
 0059F786    push        59F871
 0059F78B    push        dword ptr fs:[eax]
 0059F78E    mov         dword ptr fs:[eax],esp
 0059F791    mov         ebx,dword ptr ds:[789E68]
 0059F797    test        ebx,ebx
>0059F799    jne         0059F7D4
 0059F79B    lea         edx,[ebp-4]
 0059F79E    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F7A3    call        LoadResString
 0059F7A8    mov         eax,dword ptr [ebp-4]
 0059F7AB    push        eax
 0059F7AC    mov         eax,59F890;'WSASendTo'
 0059F7B1    mov         dword ptr [ebp-0C],eax
 0059F7B4    mov         byte ptr [ebp-8],11
 0059F7B8    lea         eax,[ebp-0C]
 0059F7BB    push        eax
 0059F7BC    push        0
 0059F7BE    mov         ecx,276D
 0059F7C3    mov         dl,1
 0059F7C5    mov         eax,[0059A068];EIdWinsockStubError
 0059F7CA    call        EIdWinsockStubError.Build
 0059F7CF    call        @RaiseExcept
 0059F7D4    mov         eax,59F890;'WSASendTo'
 0059F7D9    call        @UStrToPWChar
 0059F7DE    push        eax
 0059F7DF    push        ebx
 0059F7E0    call        GetProcAddress
 0059F7E5    test        eax,eax
>0059F7E7    jne         0059F822
 0059F7E9    lea         edx,[ebp-10]
 0059F7EC    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F7F1    call        LoadResString
 0059F7F6    mov         eax,dword ptr [ebp-10]
 0059F7F9    push        eax
 0059F7FA    mov         eax,59F890;'WSASendTo'
 0059F7FF    mov         dword ptr [ebp-0C],eax
 0059F802    mov         byte ptr [ebp-8],11
 0059F806    lea         eax,[ebp-0C]
 0059F809    push        eax
 0059F80A    push        0
 0059F80C    mov         ecx,2726
 0059F811    mov         dl,1
 0059F813    mov         eax,[0059A068];EIdWinsockStubError
 0059F818    call        EIdWinsockStubError.Build
 0059F81D    call        @RaiseExcept
 0059F822    mov         [00789E08],eax
 0059F827    mov         eax,dword ptr [ebp+28]
 0059F82A    push        eax
 0059F82B    mov         eax,dword ptr [ebp+24]
 0059F82E    push        eax
 0059F82F    mov         eax,dword ptr [ebp+20]
 0059F832    push        eax
 0059F833    mov         eax,dword ptr [ebp+1C]
 0059F836    push        eax
 0059F837    mov         eax,dword ptr [ebp+18]
 0059F83A    push        eax
 0059F83B    mov         eax,dword ptr [ebp+14]
 0059F83E    push        eax
 0059F83F    mov         eax,dword ptr [ebp+10]
 0059F842    push        eax
 0059F843    mov         eax,dword ptr [ebp+0C]
 0059F846    push        eax
 0059F847    mov         eax,dword ptr [ebp+8]
 0059F84A    push        eax
 0059F84B    call        dword ptr ds:[789E08]
 0059F851    mov         ebx,eax
 0059F853    xor         eax,eax
 0059F855    pop         edx
 0059F856    pop         ecx
 0059F857    pop         ecx
 0059F858    mov         dword ptr fs:[eax],edx
 0059F85B    push        59F878
 0059F860    lea         eax,[ebp-10]
 0059F863    call        @UStrClr
 0059F868    lea         eax,[ebp-4]
 0059F86B    call        @UStrClr
 0059F870    ret
>0059F871    jmp         @HandleFinally
>0059F876    jmp         0059F860
 0059F878    mov         eax,ebx
 0059F87A    pop         ebx
 0059F87B    mov         esp,ebp
 0059F87D    pop         ebp
 0059F87E    ret         24
*}
end;

//0059F8A4
function Stub_WSASetEvent(hEvent:THandle):WordBool; stdcall;
begin
{*
 0059F8A4    push        ebp
 0059F8A5    mov         ebp,esp
 0059F8A7    add         esp,0FFFFFFF0
 0059F8AA    push        ebx
 0059F8AB    xor         eax,eax
 0059F8AD    mov         dword ptr [ebp-10],eax
 0059F8B0    mov         dword ptr [ebp-4],eax
 0059F8B3    xor         eax,eax
 0059F8B5    push        ebp
 0059F8B6    push        59F981
 0059F8BB    push        dword ptr fs:[eax]
 0059F8BE    mov         dword ptr fs:[eax],esp
 0059F8C1    mov         ebx,dword ptr ds:[789E68]
 0059F8C7    test        ebx,ebx
>0059F8C9    jne         0059F904
 0059F8CB    lea         edx,[ebp-4]
 0059F8CE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F8D3    call        LoadResString
 0059F8D8    mov         eax,dword ptr [ebp-4]
 0059F8DB    push        eax
 0059F8DC    mov         eax,59F9A0;'WSASetEvent'
 0059F8E1    mov         dword ptr [ebp-0C],eax
 0059F8E4    mov         byte ptr [ebp-8],11
 0059F8E8    lea         eax,[ebp-0C]
 0059F8EB    push        eax
 0059F8EC    push        0
 0059F8EE    mov         ecx,276D
 0059F8F3    mov         dl,1
 0059F8F5    mov         eax,[0059A068];EIdWinsockStubError
 0059F8FA    call        EIdWinsockStubError.Build
 0059F8FF    call        @RaiseExcept
 0059F904    mov         eax,59F9A0;'WSASetEvent'
 0059F909    call        @UStrToPWChar
 0059F90E    push        eax
 0059F90F    push        ebx
 0059F910    call        GetProcAddress
 0059F915    test        eax,eax
>0059F917    jne         0059F952
 0059F919    lea         edx,[ebp-10]
 0059F91C    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F921    call        LoadResString
 0059F926    mov         eax,dword ptr [ebp-10]
 0059F929    push        eax
 0059F92A    mov         eax,59F9A0;'WSASetEvent'
 0059F92F    mov         dword ptr [ebp-0C],eax
 0059F932    mov         byte ptr [ebp-8],11
 0059F936    lea         eax,[ebp-0C]
 0059F939    push        eax
 0059F93A    push        0
 0059F93C    mov         ecx,2726
 0059F941    mov         dl,1
 0059F943    mov         eax,[0059A068];EIdWinsockStubError
 0059F948    call        EIdWinsockStubError.Build
 0059F94D    call        @RaiseExcept
 0059F952    mov         [00789E0C],eax
 0059F957    mov         eax,dword ptr [ebp+8]
 0059F95A    push        eax
 0059F95B    call        dword ptr ds:[789E0C]
 0059F961    mov         ebx,eax
 0059F963    xor         eax,eax
 0059F965    pop         edx
 0059F966    pop         ecx
 0059F967    pop         ecx
 0059F968    mov         dword ptr fs:[eax],edx
 0059F96B    push        59F988
 0059F970    lea         eax,[ebp-10]
 0059F973    call        @UStrClr
 0059F978    lea         eax,[ebp-4]
 0059F97B    call        @UStrClr
 0059F980    ret
>0059F981    jmp         @HandleFinally
>0059F986    jmp         0059F970
 0059F988    mov         eax,ebx
 0059F98A    pop         ebx
 0059F98B    mov         esp,ebp
 0059F98D    pop         ebp
 0059F98E    ret         4
*}
end;

//0059F9B8
function Stub_WSASocketA(af:Integer; iType:Integer; protocol:Integer; lpProtocolInfo:PWSAProtocol_InfoA; g:DWORD; dwFlags:DWORD):PtrUInt; stdcall;
begin
{*
 0059F9B8    push        ebp
 0059F9B9    mov         ebp,esp
 0059F9BB    add         esp,0FFFFFFF0
 0059F9BE    push        ebx
 0059F9BF    xor         eax,eax
 0059F9C1    mov         dword ptr [ebp-10],eax
 0059F9C4    mov         dword ptr [ebp-4],eax
 0059F9C7    xor         eax,eax
 0059F9C9    push        ebp
 0059F9CA    push        59FAA9
 0059F9CF    push        dword ptr fs:[eax]
 0059F9D2    mov         dword ptr fs:[eax],esp
 0059F9D5    mov         ebx,dword ptr ds:[789E68]
 0059F9DB    test        ebx,ebx
>0059F9DD    jne         0059FA18
 0059F9DF    lea         edx,[ebp-4]
 0059F9E2    mov         eax,[0078D780];^SResString602:TResStringRec
 0059F9E7    call        LoadResString
 0059F9EC    mov         eax,dword ptr [ebp-4]
 0059F9EF    push        eax
 0059F9F0    mov         eax,59FAC8;'WSASocketA'
 0059F9F5    mov         dword ptr [ebp-0C],eax
 0059F9F8    mov         byte ptr [ebp-8],11
 0059F9FC    lea         eax,[ebp-0C]
 0059F9FF    push        eax
 0059FA00    push        0
 0059FA02    mov         ecx,276D
 0059FA07    mov         dl,1
 0059FA09    mov         eax,[0059A068];EIdWinsockStubError
 0059FA0E    call        EIdWinsockStubError.Build
 0059FA13    call        @RaiseExcept
 0059FA18    mov         eax,59FAC8;'WSASocketA'
 0059FA1D    call        @UStrToPWChar
 0059FA22    push        eax
 0059FA23    push        ebx
 0059FA24    call        GetProcAddress
 0059FA29    test        eax,eax
>0059FA2B    jne         0059FA66
 0059FA2D    lea         edx,[ebp-10]
 0059FA30    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FA35    call        LoadResString
 0059FA3A    mov         eax,dword ptr [ebp-10]
 0059FA3D    push        eax
 0059FA3E    mov         eax,59FAC8;'WSASocketA'
 0059FA43    mov         dword ptr [ebp-0C],eax
 0059FA46    mov         byte ptr [ebp-8],11
 0059FA4A    lea         eax,[ebp-0C]
 0059FA4D    push        eax
 0059FA4E    push        0
 0059FA50    mov         ecx,2726
 0059FA55    mov         dl,1
 0059FA57    mov         eax,[0059A068];EIdWinsockStubError
 0059FA5C    call        EIdWinsockStubError.Build
 0059FA61    call        @RaiseExcept
 0059FA66    mov         [00789E1C],eax
 0059FA6B    mov         eax,dword ptr [ebp+1C]
 0059FA6E    push        eax
 0059FA6F    mov         eax,dword ptr [ebp+18]
 0059FA72    push        eax
 0059FA73    mov         eax,dword ptr [ebp+14]
 0059FA76    push        eax
 0059FA77    mov         eax,dword ptr [ebp+10]
 0059FA7A    push        eax
 0059FA7B    mov         eax,dword ptr [ebp+0C]
 0059FA7E    push        eax
 0059FA7F    mov         eax,dword ptr [ebp+8]
 0059FA82    push        eax
 0059FA83    call        dword ptr ds:[789E1C]
 0059FA89    mov         ebx,eax
 0059FA8B    xor         eax,eax
 0059FA8D    pop         edx
 0059FA8E    pop         ecx
 0059FA8F    pop         ecx
 0059FA90    mov         dword ptr fs:[eax],edx
 0059FA93    push        59FAB0
 0059FA98    lea         eax,[ebp-10]
 0059FA9B    call        @UStrClr
 0059FAA0    lea         eax,[ebp-4]
 0059FAA3    call        @UStrClr
 0059FAA8    ret
>0059FAA9    jmp         @HandleFinally
>0059FAAE    jmp         0059FA98
 0059FAB0    mov         eax,ebx
 0059FAB2    pop         ebx
 0059FAB3    mov         esp,ebp
 0059FAB5    pop         ebp
 0059FAB6    ret         18
*}
end;

//0059FAE0
function Stub_WSASocketW(af:Integer; iType:Integer; protocol:Integer; lpProtocolInfo:PWSAProtocol_InfoW; g:DWORD; dwFlags:DWORD):PtrUInt; stdcall;
begin
{*
 0059FAE0    push        ebp
 0059FAE1    mov         ebp,esp
 0059FAE3    add         esp,0FFFFFFF0
 0059FAE6    push        ebx
 0059FAE7    xor         eax,eax
 0059FAE9    mov         dword ptr [ebp-10],eax
 0059FAEC    mov         dword ptr [ebp-4],eax
 0059FAEF    xor         eax,eax
 0059FAF1    push        ebp
 0059FAF2    push        59FBD1
 0059FAF7    push        dword ptr fs:[eax]
 0059FAFA    mov         dword ptr fs:[eax],esp
 0059FAFD    mov         ebx,dword ptr ds:[789E68]
 0059FB03    test        ebx,ebx
>0059FB05    jne         0059FB40
 0059FB07    lea         edx,[ebp-4]
 0059FB0A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FB0F    call        LoadResString
 0059FB14    mov         eax,dword ptr [ebp-4]
 0059FB17    push        eax
 0059FB18    mov         eax,59FBF0;'WSASocketW'
 0059FB1D    mov         dword ptr [ebp-0C],eax
 0059FB20    mov         byte ptr [ebp-8],11
 0059FB24    lea         eax,[ebp-0C]
 0059FB27    push        eax
 0059FB28    push        0
 0059FB2A    mov         ecx,276D
 0059FB2F    mov         dl,1
 0059FB31    mov         eax,[0059A068];EIdWinsockStubError
 0059FB36    call        EIdWinsockStubError.Build
 0059FB3B    call        @RaiseExcept
 0059FB40    mov         eax,59FBF0;'WSASocketW'
 0059FB45    call        @UStrToPWChar
 0059FB4A    push        eax
 0059FB4B    push        ebx
 0059FB4C    call        GetProcAddress
 0059FB51    test        eax,eax
>0059FB53    jne         0059FB8E
 0059FB55    lea         edx,[ebp-10]
 0059FB58    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FB5D    call        LoadResString
 0059FB62    mov         eax,dword ptr [ebp-10]
 0059FB65    push        eax
 0059FB66    mov         eax,59FBF0;'WSASocketW'
 0059FB6B    mov         dword ptr [ebp-0C],eax
 0059FB6E    mov         byte ptr [ebp-8],11
 0059FB72    lea         eax,[ebp-0C]
 0059FB75    push        eax
 0059FB76    push        0
 0059FB78    mov         ecx,2726
 0059FB7D    mov         dl,1
 0059FB7F    mov         eax,[0059A068];EIdWinsockStubError
 0059FB84    call        EIdWinsockStubError.Build
 0059FB89    call        @RaiseExcept
 0059FB8E    mov         [00789E20],eax
 0059FB93    mov         eax,dword ptr [ebp+1C]
 0059FB96    push        eax
 0059FB97    mov         eax,dword ptr [ebp+18]
 0059FB9A    push        eax
 0059FB9B    mov         eax,dword ptr [ebp+14]
 0059FB9E    push        eax
 0059FB9F    mov         eax,dword ptr [ebp+10]
 0059FBA2    push        eax
 0059FBA3    mov         eax,dword ptr [ebp+0C]
 0059FBA6    push        eax
 0059FBA7    mov         eax,dword ptr [ebp+8]
 0059FBAA    push        eax
 0059FBAB    call        dword ptr ds:[789E20]
 0059FBB1    mov         ebx,eax
 0059FBB3    xor         eax,eax
 0059FBB5    pop         edx
 0059FBB6    pop         ecx
 0059FBB7    pop         ecx
 0059FBB8    mov         dword ptr fs:[eax],edx
 0059FBBB    push        59FBD8
 0059FBC0    lea         eax,[ebp-10]
 0059FBC3    call        @UStrClr
 0059FBC8    lea         eax,[ebp-4]
 0059FBCB    call        @UStrClr
 0059FBD0    ret
>0059FBD1    jmp         @HandleFinally
>0059FBD6    jmp         0059FBC0
 0059FBD8    mov         eax,ebx
 0059FBDA    pop         ebx
 0059FBDB    mov         esp,ebp
 0059FBDD    pop         ebp
 0059FBDE    ret         18
*}
end;

//0059FC08
function Stub_WSASocket(af:Integer; iType:Integer; protocol:Integer; lpProtocolInfo:PWSAProtocol_InfoW; g:DWORD; dwFlags:DWORD):PtrUInt; stdcall;
begin
{*
 0059FC08    push        ebp
 0059FC09    mov         ebp,esp
 0059FC0B    add         esp,0FFFFFFF0
 0059FC0E    push        ebx
 0059FC0F    xor         eax,eax
 0059FC11    mov         dword ptr [ebp-10],eax
 0059FC14    mov         dword ptr [ebp-4],eax
 0059FC17    xor         eax,eax
 0059FC19    push        ebp
 0059FC1A    push        59FCF9
 0059FC1F    push        dword ptr fs:[eax]
 0059FC22    mov         dword ptr fs:[eax],esp
 0059FC25    mov         ebx,dword ptr ds:[789E68]
 0059FC2B    test        ebx,ebx
>0059FC2D    jne         0059FC68
 0059FC2F    lea         edx,[ebp-4]
 0059FC32    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FC37    call        LoadResString
 0059FC3C    mov         eax,dword ptr [ebp-4]
 0059FC3F    push        eax
 0059FC40    mov         eax,59FD18;'WSASocketW'
 0059FC45    mov         dword ptr [ebp-0C],eax
 0059FC48    mov         byte ptr [ebp-8],11
 0059FC4C    lea         eax,[ebp-0C]
 0059FC4F    push        eax
 0059FC50    push        0
 0059FC52    mov         ecx,276D
 0059FC57    mov         dl,1
 0059FC59    mov         eax,[0059A068];EIdWinsockStubError
 0059FC5E    call        EIdWinsockStubError.Build
 0059FC63    call        @RaiseExcept
 0059FC68    mov         eax,59FD18;'WSASocketW'
 0059FC6D    call        @UStrToPWChar
 0059FC72    push        eax
 0059FC73    push        ebx
 0059FC74    call        GetProcAddress
 0059FC79    test        eax,eax
>0059FC7B    jne         0059FCB6
 0059FC7D    lea         edx,[ebp-10]
 0059FC80    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FC85    call        LoadResString
 0059FC8A    mov         eax,dword ptr [ebp-10]
 0059FC8D    push        eax
 0059FC8E    mov         eax,59FD18;'WSASocketW'
 0059FC93    mov         dword ptr [ebp-0C],eax
 0059FC96    mov         byte ptr [ebp-8],11
 0059FC9A    lea         eax,[ebp-0C]
 0059FC9D    push        eax
 0059FC9E    push        0
 0059FCA0    mov         ecx,2726
 0059FCA5    mov         dl,1
 0059FCA7    mov         eax,[0059A068];EIdWinsockStubError
 0059FCAC    call        EIdWinsockStubError.Build
 0059FCB1    call        @RaiseExcept
 0059FCB6    mov         [00789E24],eax
 0059FCBB    mov         eax,dword ptr [ebp+1C]
 0059FCBE    push        eax
 0059FCBF    mov         eax,dword ptr [ebp+18]
 0059FCC2    push        eax
 0059FCC3    mov         eax,dword ptr [ebp+14]
 0059FCC6    push        eax
 0059FCC7    mov         eax,dword ptr [ebp+10]
 0059FCCA    push        eax
 0059FCCB    mov         eax,dword ptr [ebp+0C]
 0059FCCE    push        eax
 0059FCCF    mov         eax,dword ptr [ebp+8]
 0059FCD2    push        eax
 0059FCD3    call        dword ptr ds:[789E24]
 0059FCD9    mov         ebx,eax
 0059FCDB    xor         eax,eax
 0059FCDD    pop         edx
 0059FCDE    pop         ecx
 0059FCDF    pop         ecx
 0059FCE0    mov         dword ptr fs:[eax],edx
 0059FCE3    push        59FD00
 0059FCE8    lea         eax,[ebp-10]
 0059FCEB    call        @UStrClr
 0059FCF0    lea         eax,[ebp-4]
 0059FCF3    call        @UStrClr
 0059FCF8    ret
>0059FCF9    jmp         @HandleFinally
>0059FCFE    jmp         0059FCE8
 0059FD00    mov         eax,ebx
 0059FD02    pop         ebx
 0059FD03    mov         esp,ebp
 0059FD05    pop         ebp
 0059FD06    ret         18
*}
end;

//0059FD30
function Stub_WSAWaitForMultipleEvents(cEvents:DWORD; lphEvents:PWSAEVENT; fWaitAll:LongBool; dwTimeout:DWORD; fAlertable:LongBool):DWORD; stdcall;
begin
{*
 0059FD30    push        ebp
 0059FD31    mov         ebp,esp
 0059FD33    add         esp,0FFFFFFF0
 0059FD36    push        ebx
 0059FD37    xor         eax,eax
 0059FD39    mov         dword ptr [ebp-10],eax
 0059FD3C    mov         dword ptr [ebp-4],eax
 0059FD3F    xor         eax,eax
 0059FD41    push        ebp
 0059FD42    push        59FE1D
 0059FD47    push        dword ptr fs:[eax]
 0059FD4A    mov         dword ptr fs:[eax],esp
 0059FD4D    mov         ebx,dword ptr ds:[789E68]
 0059FD53    test        ebx,ebx
>0059FD55    jne         0059FD90
 0059FD57    lea         edx,[ebp-4]
 0059FD5A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FD5F    call        LoadResString
 0059FD64    mov         eax,dword ptr [ebp-4]
 0059FD67    push        eax
 0059FD68    mov         eax,59FE3C;'WSAWaitForMultipleEvents'
 0059FD6D    mov         dword ptr [ebp-0C],eax
 0059FD70    mov         byte ptr [ebp-8],11
 0059FD74    lea         eax,[ebp-0C]
 0059FD77    push        eax
 0059FD78    push        0
 0059FD7A    mov         ecx,276D
 0059FD7F    mov         dl,1
 0059FD81    mov         eax,[0059A068];EIdWinsockStubError
 0059FD86    call        EIdWinsockStubError.Build
 0059FD8B    call        @RaiseExcept
 0059FD90    mov         eax,59FE3C;'WSAWaitForMultipleEvents'
 0059FD95    call        @UStrToPWChar
 0059FD9A    push        eax
 0059FD9B    push        ebx
 0059FD9C    call        GetProcAddress
 0059FDA1    test        eax,eax
>0059FDA3    jne         0059FDDE
 0059FDA5    lea         edx,[ebp-10]
 0059FDA8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FDAD    call        LoadResString
 0059FDB2    mov         eax,dword ptr [ebp-10]
 0059FDB5    push        eax
 0059FDB6    mov         eax,59FE3C;'WSAWaitForMultipleEvents'
 0059FDBB    mov         dword ptr [ebp-0C],eax
 0059FDBE    mov         byte ptr [ebp-8],11
 0059FDC2    lea         eax,[ebp-0C]
 0059FDC5    push        eax
 0059FDC6    push        0
 0059FDC8    mov         ecx,2726
 0059FDCD    mov         dl,1
 0059FDCF    mov         eax,[0059A068];EIdWinsockStubError
 0059FDD4    call        EIdWinsockStubError.Build
 0059FDD9    call        @RaiseExcept
 0059FDDE    mov         [00789E34],eax
 0059FDE3    mov         eax,dword ptr [ebp+18]
 0059FDE6    push        eax
 0059FDE7    mov         eax,dword ptr [ebp+14]
 0059FDEA    push        eax
 0059FDEB    mov         eax,dword ptr [ebp+10]
 0059FDEE    push        eax
 0059FDEF    mov         eax,dword ptr [ebp+0C]
 0059FDF2    push        eax
 0059FDF3    mov         eax,dword ptr [ebp+8]
 0059FDF6    push        eax
 0059FDF7    call        dword ptr ds:[789E34]
 0059FDFD    mov         ebx,eax
 0059FDFF    xor         eax,eax
 0059FE01    pop         edx
 0059FE02    pop         ecx
 0059FE03    pop         ecx
 0059FE04    mov         dword ptr fs:[eax],edx
 0059FE07    push        59FE24
 0059FE0C    lea         eax,[ebp-10]
 0059FE0F    call        @UStrClr
 0059FE14    lea         eax,[ebp-4]
 0059FE17    call        @UStrClr
 0059FE1C    ret
>0059FE1D    jmp         @HandleFinally
>0059FE22    jmp         0059FE0C
 0059FE24    mov         eax,ebx
 0059FE26    pop         ebx
 0059FE27    mov         esp,ebp
 0059FE29    pop         ebp
 0059FE2A    ret         14
*}
end;

//0059FE70
function Stub_WSAAddressToStringA(lpsaAddress:PSOCKADDR; const dwAddressLength:DWORD; const lpProtocolInfo:PWSAProtocol_InfoA; const lpszAddressString:PAnsiChar; var lpdwAddressStringLength:DWORD):Integer; stdcall;
begin
{*
 0059FE70    push        ebp
 0059FE71    mov         ebp,esp
 0059FE73    add         esp,0FFFFFFF0
 0059FE76    push        ebx
 0059FE77    xor         eax,eax
 0059FE79    mov         dword ptr [ebp-10],eax
 0059FE7C    mov         dword ptr [ebp-4],eax
 0059FE7F    xor         eax,eax
 0059FE81    push        ebp
 0059FE82    push        59FF5D
 0059FE87    push        dword ptr fs:[eax]
 0059FE8A    mov         dword ptr fs:[eax],esp
 0059FE8D    mov         ebx,dword ptr ds:[789E68]
 0059FE93    test        ebx,ebx
>0059FE95    jne         0059FED0
 0059FE97    lea         edx,[ebp-4]
 0059FE9A    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FE9F    call        LoadResString
 0059FEA4    mov         eax,dword ptr [ebp-4]
 0059FEA7    push        eax
 0059FEA8    mov         eax,59FF7C;'WSAAddressToStringA'
 0059FEAD    mov         dword ptr [ebp-0C],eax
 0059FEB0    mov         byte ptr [ebp-8],11
 0059FEB4    lea         eax,[ebp-0C]
 0059FEB7    push        eax
 0059FEB8    push        0
 0059FEBA    mov         ecx,276D
 0059FEBF    mov         dl,1
 0059FEC1    mov         eax,[0059A068];EIdWinsockStubError
 0059FEC6    call        EIdWinsockStubError.Build
 0059FECB    call        @RaiseExcept
 0059FED0    mov         eax,59FF7C;'WSAAddressToStringA'
 0059FED5    call        @UStrToPWChar
 0059FEDA    push        eax
 0059FEDB    push        ebx
 0059FEDC    call        GetProcAddress
 0059FEE1    test        eax,eax
>0059FEE3    jne         0059FF1E
 0059FEE5    lea         edx,[ebp-10]
 0059FEE8    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FEED    call        LoadResString
 0059FEF2    mov         eax,dword ptr [ebp-10]
 0059FEF5    push        eax
 0059FEF6    mov         eax,59FF7C;'WSAAddressToStringA'
 0059FEFB    mov         dword ptr [ebp-0C],eax
 0059FEFE    mov         byte ptr [ebp-8],11
 0059FF02    lea         eax,[ebp-0C]
 0059FF05    push        eax
 0059FF06    push        0
 0059FF08    mov         ecx,2726
 0059FF0D    mov         dl,1
 0059FF0F    mov         eax,[0059A068];EIdWinsockStubError
 0059FF14    call        EIdWinsockStubError.Build
 0059FF19    call        @RaiseExcept
 0059FF1E    mov         [00789D48],eax
 0059FF23    mov         eax,dword ptr [ebp+18]
 0059FF26    push        eax
 0059FF27    mov         eax,dword ptr [ebp+14]
 0059FF2A    push        eax
 0059FF2B    mov         eax,dword ptr [ebp+10]
 0059FF2E    push        eax
 0059FF2F    mov         eax,dword ptr [ebp+0C]
 0059FF32    push        eax
 0059FF33    mov         eax,dword ptr [ebp+8]
 0059FF36    push        eax
 0059FF37    call        dword ptr ds:[789D48]
 0059FF3D    mov         ebx,eax
 0059FF3F    xor         eax,eax
 0059FF41    pop         edx
 0059FF42    pop         ecx
 0059FF43    pop         ecx
 0059FF44    mov         dword ptr fs:[eax],edx
 0059FF47    push        59FF64
 0059FF4C    lea         eax,[ebp-10]
 0059FF4F    call        @UStrClr
 0059FF54    lea         eax,[ebp-4]
 0059FF57    call        @UStrClr
 0059FF5C    ret
>0059FF5D    jmp         @HandleFinally
>0059FF62    jmp         0059FF4C
 0059FF64    mov         eax,ebx
 0059FF66    pop         ebx
 0059FF67    mov         esp,ebp
 0059FF69    pop         ebp
 0059FF6A    ret         14
*}
end;

//0059FFA4
function Stub_WSAAddressToStringW(lpsaAddress:PSOCKADDR; const dwAddressLength:DWORD; const lpProtocolInfo:PWSAProtocol_InfoW; const lpszAddressString:PWideChar; var lpdwAddressStringLength:DWORD):Integer; stdcall;
begin
{*
 0059FFA4    push        ebp
 0059FFA5    mov         ebp,esp
 0059FFA7    add         esp,0FFFFFFF0
 0059FFAA    push        ebx
 0059FFAB    xor         eax,eax
 0059FFAD    mov         dword ptr [ebp-10],eax
 0059FFB0    mov         dword ptr [ebp-4],eax
 0059FFB3    xor         eax,eax
 0059FFB5    push        ebp
 0059FFB6    push        5A0091
 0059FFBB    push        dword ptr fs:[eax]
 0059FFBE    mov         dword ptr fs:[eax],esp
 0059FFC1    mov         ebx,dword ptr ds:[789E68]
 0059FFC7    test        ebx,ebx
>0059FFC9    jne         005A0004
 0059FFCB    lea         edx,[ebp-4]
 0059FFCE    mov         eax,[0078D780];^SResString602:TResStringRec
 0059FFD3    call        LoadResString
 0059FFD8    mov         eax,dword ptr [ebp-4]
 0059FFDB    push        eax
 0059FFDC    mov         eax,5A00B0;'WSAAddressToStringW'
 0059FFE1    mov         dword ptr [ebp-0C],eax
 0059FFE4    mov         byte ptr [ebp-8],11
 0059FFE8    lea         eax,[ebp-0C]
 0059FFEB    push        eax
 0059FFEC    push        0
 0059FFEE    mov         ecx,276D
 0059FFF3    mov         dl,1
 0059FFF5    mov         eax,[0059A068];EIdWinsockStubError
 0059FFFA    call        EIdWinsockStubError.Build
 0059FFFF    call        @RaiseExcept
 005A0004    mov         eax,5A00B0;'WSAAddressToStringW'
 005A0009    call        @UStrToPWChar
 005A000E    push        eax
 005A000F    push        ebx
 005A0010    call        GetProcAddress
 005A0015    test        eax,eax
>005A0017    jne         005A0052
 005A0019    lea         edx,[ebp-10]
 005A001C    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0021    call        LoadResString
 005A0026    mov         eax,dword ptr [ebp-10]
 005A0029    push        eax
 005A002A    mov         eax,5A00B0;'WSAAddressToStringW'
 005A002F    mov         dword ptr [ebp-0C],eax
 005A0032    mov         byte ptr [ebp-8],11
 005A0036    lea         eax,[ebp-0C]
 005A0039    push        eax
 005A003A    push        0
 005A003C    mov         ecx,2726
 005A0041    mov         dl,1
 005A0043    mov         eax,[0059A068];EIdWinsockStubError
 005A0048    call        EIdWinsockStubError.Build
 005A004D    call        @RaiseExcept
 005A0052    mov         [00789D4C],eax
 005A0057    mov         eax,dword ptr [ebp+18]
 005A005A    push        eax
 005A005B    mov         eax,dword ptr [ebp+14]
 005A005E    push        eax
 005A005F    mov         eax,dword ptr [ebp+10]
 005A0062    push        eax
 005A0063    mov         eax,dword ptr [ebp+0C]
 005A0066    push        eax
 005A0067    mov         eax,dword ptr [ebp+8]
 005A006A    push        eax
 005A006B    call        dword ptr ds:[789D4C]
 005A0071    mov         ebx,eax
 005A0073    xor         eax,eax
 005A0075    pop         edx
 005A0076    pop         ecx
 005A0077    pop         ecx
 005A0078    mov         dword ptr fs:[eax],edx
 005A007B    push        5A0098
 005A0080    lea         eax,[ebp-10]
 005A0083    call        @UStrClr
 005A0088    lea         eax,[ebp-4]
 005A008B    call        @UStrClr
 005A0090    ret
>005A0091    jmp         @HandleFinally
>005A0096    jmp         005A0080
 005A0098    mov         eax,ebx
 005A009A    pop         ebx
 005A009B    mov         esp,ebp
 005A009D    pop         ebp
 005A009E    ret         14
*}
end;

//005A00D8
function Stub_WSAAddressToString(lpsaAddress:PSOCKADDR; const dwAddressLength:DWORD; const lpProtocolInfo:PWSAProtocol_InfoW; const lpszAddressString:PWideChar; var lpdwAddressStringLength:DWORD):Integer; stdcall;
begin
{*
 005A00D8    push        ebp
 005A00D9    mov         ebp,esp
 005A00DB    add         esp,0FFFFFFF0
 005A00DE    push        ebx
 005A00DF    xor         eax,eax
 005A00E1    mov         dword ptr [ebp-10],eax
 005A00E4    mov         dword ptr [ebp-4],eax
 005A00E7    xor         eax,eax
 005A00E9    push        ebp
 005A00EA    push        5A01C5
 005A00EF    push        dword ptr fs:[eax]
 005A00F2    mov         dword ptr fs:[eax],esp
 005A00F5    mov         ebx,dword ptr ds:[789E68]
 005A00FB    test        ebx,ebx
>005A00FD    jne         005A0138
 005A00FF    lea         edx,[ebp-4]
 005A0102    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0107    call        LoadResString
 005A010C    mov         eax,dword ptr [ebp-4]
 005A010F    push        eax
 005A0110    mov         eax,5A01E4;'WSAAddressToStringW'
 005A0115    mov         dword ptr [ebp-0C],eax
 005A0118    mov         byte ptr [ebp-8],11
 005A011C    lea         eax,[ebp-0C]
 005A011F    push        eax
 005A0120    push        0
 005A0122    mov         ecx,276D
 005A0127    mov         dl,1
 005A0129    mov         eax,[0059A068];EIdWinsockStubError
 005A012E    call        EIdWinsockStubError.Build
 005A0133    call        @RaiseExcept
 005A0138    mov         eax,5A01E4;'WSAAddressToStringW'
 005A013D    call        @UStrToPWChar
 005A0142    push        eax
 005A0143    push        ebx
 005A0144    call        GetProcAddress
 005A0149    test        eax,eax
>005A014B    jne         005A0186
 005A014D    lea         edx,[ebp-10]
 005A0150    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0155    call        LoadResString
 005A015A    mov         eax,dword ptr [ebp-10]
 005A015D    push        eax
 005A015E    mov         eax,5A01E4;'WSAAddressToStringW'
 005A0163    mov         dword ptr [ebp-0C],eax
 005A0166    mov         byte ptr [ebp-8],11
 005A016A    lea         eax,[ebp-0C]
 005A016D    push        eax
 005A016E    push        0
 005A0170    mov         ecx,2726
 005A0175    mov         dl,1
 005A0177    mov         eax,[0059A068];EIdWinsockStubError
 005A017C    call        EIdWinsockStubError.Build
 005A0181    call        @RaiseExcept
 005A0186    mov         [00789D50],eax
 005A018B    mov         eax,dword ptr [ebp+18]
 005A018E    push        eax
 005A018F    mov         eax,dword ptr [ebp+14]
 005A0192    push        eax
 005A0193    mov         eax,dword ptr [ebp+10]
 005A0196    push        eax
 005A0197    mov         eax,dword ptr [ebp+0C]
 005A019A    push        eax
 005A019B    mov         eax,dword ptr [ebp+8]
 005A019E    push        eax
 005A019F    call        dword ptr ds:[789D50]
 005A01A5    mov         ebx,eax
 005A01A7    xor         eax,eax
 005A01A9    pop         edx
 005A01AA    pop         ecx
 005A01AB    pop         ecx
 005A01AC    mov         dword ptr fs:[eax],edx
 005A01AF    push        5A01CC
 005A01B4    lea         eax,[ebp-10]
 005A01B7    call        @UStrClr
 005A01BC    lea         eax,[ebp-4]
 005A01BF    call        @UStrClr
 005A01C4    ret
>005A01C5    jmp         @HandleFinally
>005A01CA    jmp         005A01B4
 005A01CC    mov         eax,ebx
 005A01CE    pop         ebx
 005A01CF    mov         esp,ebp
 005A01D1    pop         ebp
 005A01D2    ret         14
*}
end;

//005A020C
function Stub_WSAStringToAddressA(const AddressString:PAnsiChar; const AddressFamily:Integer; const lpProtocolInfo:PWSAProtocol_InfoA; var lpAddress:sockaddr_in; var lpAddressLength:Integer):Integer; stdcall;
begin
{*
 005A020C    push        ebp
 005A020D    mov         ebp,esp
 005A020F    add         esp,0FFFFFFF0
 005A0212    push        ebx
 005A0213    xor         eax,eax
 005A0215    mov         dword ptr [ebp-10],eax
 005A0218    mov         dword ptr [ebp-4],eax
 005A021B    xor         eax,eax
 005A021D    push        ebp
 005A021E    push        5A02F9
 005A0223    push        dword ptr fs:[eax]
 005A0226    mov         dword ptr fs:[eax],esp
 005A0229    mov         ebx,dword ptr ds:[789E68]
 005A022F    test        ebx,ebx
>005A0231    jne         005A026C
 005A0233    lea         edx,[ebp-4]
 005A0236    mov         eax,[0078D780];^SResString602:TResStringRec
 005A023B    call        LoadResString
 005A0240    mov         eax,dword ptr [ebp-4]
 005A0243    push        eax
 005A0244    mov         eax,5A0318;'WSAStringToAddressA'
 005A0249    mov         dword ptr [ebp-0C],eax
 005A024C    mov         byte ptr [ebp-8],11
 005A0250    lea         eax,[ebp-0C]
 005A0253    push        eax
 005A0254    push        0
 005A0256    mov         ecx,276D
 005A025B    mov         dl,1
 005A025D    mov         eax,[0059A068];EIdWinsockStubError
 005A0262    call        EIdWinsockStubError.Build
 005A0267    call        @RaiseExcept
 005A026C    mov         eax,5A0318;'WSAStringToAddressA'
 005A0271    call        @UStrToPWChar
 005A0276    push        eax
 005A0277    push        ebx
 005A0278    call        GetProcAddress
 005A027D    test        eax,eax
>005A027F    jne         005A02BA
 005A0281    lea         edx,[ebp-10]
 005A0284    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0289    call        LoadResString
 005A028E    mov         eax,dword ptr [ebp-10]
 005A0291    push        eax
 005A0292    mov         eax,5A0318;'WSAStringToAddressA'
 005A0297    mov         dword ptr [ebp-0C],eax
 005A029A    mov         byte ptr [ebp-8],11
 005A029E    lea         eax,[ebp-0C]
 005A02A1    push        eax
 005A02A2    push        0
 005A02A4    mov         ecx,2726
 005A02A9    mov         dl,1
 005A02AB    mov         eax,[0059A068];EIdWinsockStubError
 005A02B0    call        EIdWinsockStubError.Build
 005A02B5    call        @RaiseExcept
 005A02BA    mov         [00789E28],eax
 005A02BF    mov         eax,dword ptr [ebp+18]
 005A02C2    push        eax
 005A02C3    mov         eax,dword ptr [ebp+14]
 005A02C6    push        eax
 005A02C7    mov         eax,dword ptr [ebp+10]
 005A02CA    push        eax
 005A02CB    mov         eax,dword ptr [ebp+0C]
 005A02CE    push        eax
 005A02CF    mov         eax,dword ptr [ebp+8]
 005A02D2    push        eax
 005A02D3    call        dword ptr ds:[789E28]
 005A02D9    mov         ebx,eax
 005A02DB    xor         eax,eax
 005A02DD    pop         edx
 005A02DE    pop         ecx
 005A02DF    pop         ecx
 005A02E0    mov         dword ptr fs:[eax],edx
 005A02E3    push        5A0300
 005A02E8    lea         eax,[ebp-10]
 005A02EB    call        @UStrClr
 005A02F0    lea         eax,[ebp-4]
 005A02F3    call        @UStrClr
 005A02F8    ret
>005A02F9    jmp         @HandleFinally
>005A02FE    jmp         005A02E8
 005A0300    mov         eax,ebx
 005A0302    pop         ebx
 005A0303    mov         esp,ebp
 005A0305    pop         ebp
 005A0306    ret         14
*}
end;

//005A0340
function Stub_WSAStringToAddressW(const AddressString:PWideChar; const AddressFamily:Integer; const lpProtocolInfo:PWSAProtocol_InfoW; var lpAddress:sockaddr_in; var lpAddressLength:Integer):Integer; stdcall;
begin
{*
 005A0340    push        ebp
 005A0341    mov         ebp,esp
 005A0343    add         esp,0FFFFFFF0
 005A0346    push        ebx
 005A0347    xor         eax,eax
 005A0349    mov         dword ptr [ebp-10],eax
 005A034C    mov         dword ptr [ebp-4],eax
 005A034F    xor         eax,eax
 005A0351    push        ebp
 005A0352    push        5A042D
 005A0357    push        dword ptr fs:[eax]
 005A035A    mov         dword ptr fs:[eax],esp
 005A035D    mov         ebx,dword ptr ds:[789E68]
 005A0363    test        ebx,ebx
>005A0365    jne         005A03A0
 005A0367    lea         edx,[ebp-4]
 005A036A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A036F    call        LoadResString
 005A0374    mov         eax,dword ptr [ebp-4]
 005A0377    push        eax
 005A0378    mov         eax,5A044C;'WSAStringToAddressW'
 005A037D    mov         dword ptr [ebp-0C],eax
 005A0380    mov         byte ptr [ebp-8],11
 005A0384    lea         eax,[ebp-0C]
 005A0387    push        eax
 005A0388    push        0
 005A038A    mov         ecx,276D
 005A038F    mov         dl,1
 005A0391    mov         eax,[0059A068];EIdWinsockStubError
 005A0396    call        EIdWinsockStubError.Build
 005A039B    call        @RaiseExcept
 005A03A0    mov         eax,5A044C;'WSAStringToAddressW'
 005A03A5    call        @UStrToPWChar
 005A03AA    push        eax
 005A03AB    push        ebx
 005A03AC    call        GetProcAddress
 005A03B1    test        eax,eax
>005A03B3    jne         005A03EE
 005A03B5    lea         edx,[ebp-10]
 005A03B8    mov         eax,[0078D780];^SResString602:TResStringRec
 005A03BD    call        LoadResString
 005A03C2    mov         eax,dword ptr [ebp-10]
 005A03C5    push        eax
 005A03C6    mov         eax,5A044C;'WSAStringToAddressW'
 005A03CB    mov         dword ptr [ebp-0C],eax
 005A03CE    mov         byte ptr [ebp-8],11
 005A03D2    lea         eax,[ebp-0C]
 005A03D5    push        eax
 005A03D6    push        0
 005A03D8    mov         ecx,2726
 005A03DD    mov         dl,1
 005A03DF    mov         eax,[0059A068];EIdWinsockStubError
 005A03E4    call        EIdWinsockStubError.Build
 005A03E9    call        @RaiseExcept
 005A03EE    mov         [00789E2C],eax
 005A03F3    mov         eax,dword ptr [ebp+18]
 005A03F6    push        eax
 005A03F7    mov         eax,dword ptr [ebp+14]
 005A03FA    push        eax
 005A03FB    mov         eax,dword ptr [ebp+10]
 005A03FE    push        eax
 005A03FF    mov         eax,dword ptr [ebp+0C]
 005A0402    push        eax
 005A0403    mov         eax,dword ptr [ebp+8]
 005A0406    push        eax
 005A0407    call        dword ptr ds:[789E2C]
 005A040D    mov         ebx,eax
 005A040F    xor         eax,eax
 005A0411    pop         edx
 005A0412    pop         ecx
 005A0413    pop         ecx
 005A0414    mov         dword ptr fs:[eax],edx
 005A0417    push        5A0434
 005A041C    lea         eax,[ebp-10]
 005A041F    call        @UStrClr
 005A0424    lea         eax,[ebp-4]
 005A0427    call        @UStrClr
 005A042C    ret
>005A042D    jmp         @HandleFinally
>005A0432    jmp         005A041C
 005A0434    mov         eax,ebx
 005A0436    pop         ebx
 005A0437    mov         esp,ebp
 005A0439    pop         ebp
 005A043A    ret         14
*}
end;

//005A0474
function Stub_WSAStringToAddress(const AddressString:PWideChar; const AddressFamily:Integer; const lpProtocolInfo:PWSAProtocol_InfoW; var lpAddress:sockaddr_in; var lpAddressLength:Integer):Integer; stdcall;
begin
{*
 005A0474    push        ebp
 005A0475    mov         ebp,esp
 005A0477    add         esp,0FFFFFFF0
 005A047A    push        ebx
 005A047B    xor         eax,eax
 005A047D    mov         dword ptr [ebp-10],eax
 005A0480    mov         dword ptr [ebp-4],eax
 005A0483    xor         eax,eax
 005A0485    push        ebp
 005A0486    push        5A0561
 005A048B    push        dword ptr fs:[eax]
 005A048E    mov         dword ptr fs:[eax],esp
 005A0491    mov         ebx,dword ptr ds:[789E68]
 005A0497    test        ebx,ebx
>005A0499    jne         005A04D4
 005A049B    lea         edx,[ebp-4]
 005A049E    mov         eax,[0078D780];^SResString602:TResStringRec
 005A04A3    call        LoadResString
 005A04A8    mov         eax,dword ptr [ebp-4]
 005A04AB    push        eax
 005A04AC    mov         eax,5A0580;'WSAStringToAddressW'
 005A04B1    mov         dword ptr [ebp-0C],eax
 005A04B4    mov         byte ptr [ebp-8],11
 005A04B8    lea         eax,[ebp-0C]
 005A04BB    push        eax
 005A04BC    push        0
 005A04BE    mov         ecx,276D
 005A04C3    mov         dl,1
 005A04C5    mov         eax,[0059A068];EIdWinsockStubError
 005A04CA    call        EIdWinsockStubError.Build
 005A04CF    call        @RaiseExcept
 005A04D4    mov         eax,5A0580;'WSAStringToAddressW'
 005A04D9    call        @UStrToPWChar
 005A04DE    push        eax
 005A04DF    push        ebx
 005A04E0    call        GetProcAddress
 005A04E5    test        eax,eax
>005A04E7    jne         005A0522
 005A04E9    lea         edx,[ebp-10]
 005A04EC    mov         eax,[0078D780];^SResString602:TResStringRec
 005A04F1    call        LoadResString
 005A04F6    mov         eax,dword ptr [ebp-10]
 005A04F9    push        eax
 005A04FA    mov         eax,5A0580;'WSAStringToAddressW'
 005A04FF    mov         dword ptr [ebp-0C],eax
 005A0502    mov         byte ptr [ebp-8],11
 005A0506    lea         eax,[ebp-0C]
 005A0509    push        eax
 005A050A    push        0
 005A050C    mov         ecx,2726
 005A0511    mov         dl,1
 005A0513    mov         eax,[0059A068];EIdWinsockStubError
 005A0518    call        EIdWinsockStubError.Build
 005A051D    call        @RaiseExcept
 005A0522    mov         [00789E30],eax
 005A0527    mov         eax,dword ptr [ebp+18]
 005A052A    push        eax
 005A052B    mov         eax,dword ptr [ebp+14]
 005A052E    push        eax
 005A052F    mov         eax,dword ptr [ebp+10]
 005A0532    push        eax
 005A0533    mov         eax,dword ptr [ebp+0C]
 005A0536    push        eax
 005A0537    mov         eax,dword ptr [ebp+8]
 005A053A    push        eax
 005A053B    call        dword ptr ds:[789E30]
 005A0541    mov         ebx,eax
 005A0543    xor         eax,eax
 005A0545    pop         edx
 005A0546    pop         ecx
 005A0547    pop         ecx
 005A0548    mov         dword ptr fs:[eax],edx
 005A054B    push        5A0568
 005A0550    lea         eax,[ebp-10]
 005A0553    call        @UStrClr
 005A0558    lea         eax,[ebp-4]
 005A055B    call        @UStrClr
 005A0560    ret
>005A0561    jmp         @HandleFinally
>005A0566    jmp         005A0550
 005A0568    mov         eax,ebx
 005A056A    pop         ebx
 005A056B    mov         esp,ebp
 005A056D    pop         ebp
 005A056E    ret         14
*}
end;

//005A05A8
function Stub_WSALookupServiceBeginA(var qsRestrictions:WSAQUERYSETA; const dwControlFlags:DWORD; var hLookup:THandle):Integer; stdcall;
begin
{*
 005A05A8    push        ebp
 005A05A9    mov         ebp,esp
 005A05AB    add         esp,0FFFFFFF0
 005A05AE    push        ebx
 005A05AF    xor         eax,eax
 005A05B1    mov         dword ptr [ebp-10],eax
 005A05B4    mov         dword ptr [ebp-4],eax
 005A05B7    xor         eax,eax
 005A05B9    push        ebp
 005A05BA    push        5A068D
 005A05BF    push        dword ptr fs:[eax]
 005A05C2    mov         dword ptr fs:[eax],esp
 005A05C5    mov         ebx,dword ptr ds:[789E68]
 005A05CB    test        ebx,ebx
>005A05CD    jne         005A0608
 005A05CF    lea         edx,[ebp-4]
 005A05D2    mov         eax,[0078D780];^SResString602:TResStringRec
 005A05D7    call        LoadResString
 005A05DC    mov         eax,dword ptr [ebp-4]
 005A05DF    push        eax
 005A05E0    mov         eax,5A06AC;'WSALookupServiceBeginA'
 005A05E5    mov         dword ptr [ebp-0C],eax
 005A05E8    mov         byte ptr [ebp-8],11
 005A05EC    lea         eax,[ebp-0C]
 005A05EF    push        eax
 005A05F0    push        0
 005A05F2    mov         ecx,276D
 005A05F7    mov         dl,1
 005A05F9    mov         eax,[0059A068];EIdWinsockStubError
 005A05FE    call        EIdWinsockStubError.Build
 005A0603    call        @RaiseExcept
 005A0608    mov         eax,5A06AC;'WSALookupServiceBeginA'
 005A060D    call        @UStrToPWChar
 005A0612    push        eax
 005A0613    push        ebx
 005A0614    call        GetProcAddress
 005A0619    test        eax,eax
>005A061B    jne         005A0656
 005A061D    lea         edx,[ebp-10]
 005A0620    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0625    call        LoadResString
 005A062A    mov         eax,dword ptr [ebp-10]
 005A062D    push        eax
 005A062E    mov         eax,5A06AC;'WSALookupServiceBeginA'
 005A0633    mov         dword ptr [ebp-0C],eax
 005A0636    mov         byte ptr [ebp-8],11
 005A063A    lea         eax,[ebp-0C]
 005A063D    push        eax
 005A063E    push        0
 005A0640    mov         ecx,2726
 005A0645    mov         dl,1
 005A0647    mov         eax,[0059A068];EIdWinsockStubError
 005A064C    call        EIdWinsockStubError.Build
 005A0651    call        @RaiseExcept
 005A0656    mov         [00789DC8],eax
 005A065B    mov         eax,dword ptr [ebp+10]
 005A065E    push        eax
 005A065F    mov         eax,dword ptr [ebp+0C]
 005A0662    push        eax
 005A0663    mov         eax,dword ptr [ebp+8]
 005A0666    push        eax
 005A0667    call        dword ptr ds:[789DC8]
 005A066D    mov         ebx,eax
 005A066F    xor         eax,eax
 005A0671    pop         edx
 005A0672    pop         ecx
 005A0673    pop         ecx
 005A0674    mov         dword ptr fs:[eax],edx
 005A0677    push        5A0694
 005A067C    lea         eax,[ebp-10]
 005A067F    call        @UStrClr
 005A0684    lea         eax,[ebp-4]
 005A0687    call        @UStrClr
 005A068C    ret
>005A068D    jmp         @HandleFinally
>005A0692    jmp         005A067C
 005A0694    mov         eax,ebx
 005A0696    pop         ebx
 005A0697    mov         esp,ebp
 005A0699    pop         ebp
 005A069A    ret         0C
*}
end;

//005A06DC
function Stub_WSALookupServiceBeginW(var qsRestrictions:WSAQUERYSETW; const dwControlFlags:DWORD; var hLookup:THandle):Integer; stdcall;
begin
{*
 005A06DC    push        ebp
 005A06DD    mov         ebp,esp
 005A06DF    add         esp,0FFFFFFF0
 005A06E2    push        ebx
 005A06E3    xor         eax,eax
 005A06E5    mov         dword ptr [ebp-10],eax
 005A06E8    mov         dword ptr [ebp-4],eax
 005A06EB    xor         eax,eax
 005A06ED    push        ebp
 005A06EE    push        5A07C1
 005A06F3    push        dword ptr fs:[eax]
 005A06F6    mov         dword ptr fs:[eax],esp
 005A06F9    mov         ebx,dword ptr ds:[789E68]
 005A06FF    test        ebx,ebx
>005A0701    jne         005A073C
 005A0703    lea         edx,[ebp-4]
 005A0706    mov         eax,[0078D780];^SResString602:TResStringRec
 005A070B    call        LoadResString
 005A0710    mov         eax,dword ptr [ebp-4]
 005A0713    push        eax
 005A0714    mov         eax,5A07E0;'WSALookupServiceBeginW'
 005A0719    mov         dword ptr [ebp-0C],eax
 005A071C    mov         byte ptr [ebp-8],11
 005A0720    lea         eax,[ebp-0C]
 005A0723    push        eax
 005A0724    push        0
 005A0726    mov         ecx,276D
 005A072B    mov         dl,1
 005A072D    mov         eax,[0059A068];EIdWinsockStubError
 005A0732    call        EIdWinsockStubError.Build
 005A0737    call        @RaiseExcept
 005A073C    mov         eax,5A07E0;'WSALookupServiceBeginW'
 005A0741    call        @UStrToPWChar
 005A0746    push        eax
 005A0747    push        ebx
 005A0748    call        GetProcAddress
 005A074D    test        eax,eax
>005A074F    jne         005A078A
 005A0751    lea         edx,[ebp-10]
 005A0754    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0759    call        LoadResString
 005A075E    mov         eax,dword ptr [ebp-10]
 005A0761    push        eax
 005A0762    mov         eax,5A07E0;'WSALookupServiceBeginW'
 005A0767    mov         dword ptr [ebp-0C],eax
 005A076A    mov         byte ptr [ebp-8],11
 005A076E    lea         eax,[ebp-0C]
 005A0771    push        eax
 005A0772    push        0
 005A0774    mov         ecx,2726
 005A0779    mov         dl,1
 005A077B    mov         eax,[0059A068];EIdWinsockStubError
 005A0780    call        EIdWinsockStubError.Build
 005A0785    call        @RaiseExcept
 005A078A    mov         [00789DCC],eax
 005A078F    mov         eax,dword ptr [ebp+10]
 005A0792    push        eax
 005A0793    mov         eax,dword ptr [ebp+0C]
 005A0796    push        eax
 005A0797    mov         eax,dword ptr [ebp+8]
 005A079A    push        eax
 005A079B    call        dword ptr ds:[789DCC]
 005A07A1    mov         ebx,eax
 005A07A3    xor         eax,eax
 005A07A5    pop         edx
 005A07A6    pop         ecx
 005A07A7    pop         ecx
 005A07A8    mov         dword ptr fs:[eax],edx
 005A07AB    push        5A07C8
 005A07B0    lea         eax,[ebp-10]
 005A07B3    call        @UStrClr
 005A07B8    lea         eax,[ebp-4]
 005A07BB    call        @UStrClr
 005A07C0    ret
>005A07C1    jmp         @HandleFinally
>005A07C6    jmp         005A07B0
 005A07C8    mov         eax,ebx
 005A07CA    pop         ebx
 005A07CB    mov         esp,ebp
 005A07CD    pop         ebp
 005A07CE    ret         0C
*}
end;

//005A0810
function Stub_WSALookupServiceBegin(var qsRestrictions:WSAQUERYSETW; const dwControlFlags:DWORD; var hLookup:THandle):Integer; stdcall;
begin
{*
 005A0810    push        ebp
 005A0811    mov         ebp,esp
 005A0813    add         esp,0FFFFFFF0
 005A0816    push        ebx
 005A0817    xor         eax,eax
 005A0819    mov         dword ptr [ebp-10],eax
 005A081C    mov         dword ptr [ebp-4],eax
 005A081F    xor         eax,eax
 005A0821    push        ebp
 005A0822    push        5A08F5
 005A0827    push        dword ptr fs:[eax]
 005A082A    mov         dword ptr fs:[eax],esp
 005A082D    mov         ebx,dword ptr ds:[789E68]
 005A0833    test        ebx,ebx
>005A0835    jne         005A0870
 005A0837    lea         edx,[ebp-4]
 005A083A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A083F    call        LoadResString
 005A0844    mov         eax,dword ptr [ebp-4]
 005A0847    push        eax
 005A0848    mov         eax,5A0914;'WSALookupServiceBeginW'
 005A084D    mov         dword ptr [ebp-0C],eax
 005A0850    mov         byte ptr [ebp-8],11
 005A0854    lea         eax,[ebp-0C]
 005A0857    push        eax
 005A0858    push        0
 005A085A    mov         ecx,276D
 005A085F    mov         dl,1
 005A0861    mov         eax,[0059A068];EIdWinsockStubError
 005A0866    call        EIdWinsockStubError.Build
 005A086B    call        @RaiseExcept
 005A0870    mov         eax,5A0914;'WSALookupServiceBeginW'
 005A0875    call        @UStrToPWChar
 005A087A    push        eax
 005A087B    push        ebx
 005A087C    call        GetProcAddress
 005A0881    test        eax,eax
>005A0883    jne         005A08BE
 005A0885    lea         edx,[ebp-10]
 005A0888    mov         eax,[0078D780];^SResString602:TResStringRec
 005A088D    call        LoadResString
 005A0892    mov         eax,dword ptr [ebp-10]
 005A0895    push        eax
 005A0896    mov         eax,5A0914;'WSALookupServiceBeginW'
 005A089B    mov         dword ptr [ebp-0C],eax
 005A089E    mov         byte ptr [ebp-8],11
 005A08A2    lea         eax,[ebp-0C]
 005A08A5    push        eax
 005A08A6    push        0
 005A08A8    mov         ecx,2726
 005A08AD    mov         dl,1
 005A08AF    mov         eax,[0059A068];EIdWinsockStubError
 005A08B4    call        EIdWinsockStubError.Build
 005A08B9    call        @RaiseExcept
 005A08BE    mov         [00789DD0],eax
 005A08C3    mov         eax,dword ptr [ebp+10]
 005A08C6    push        eax
 005A08C7    mov         eax,dword ptr [ebp+0C]
 005A08CA    push        eax
 005A08CB    mov         eax,dword ptr [ebp+8]
 005A08CE    push        eax
 005A08CF    call        dword ptr ds:[789DD0]
 005A08D5    mov         ebx,eax
 005A08D7    xor         eax,eax
 005A08D9    pop         edx
 005A08DA    pop         ecx
 005A08DB    pop         ecx
 005A08DC    mov         dword ptr fs:[eax],edx
 005A08DF    push        5A08FC
 005A08E4    lea         eax,[ebp-10]
 005A08E7    call        @UStrClr
 005A08EC    lea         eax,[ebp-4]
 005A08EF    call        @UStrClr
 005A08F4    ret
>005A08F5    jmp         @HandleFinally
>005A08FA    jmp         005A08E4
 005A08FC    mov         eax,ebx
 005A08FE    pop         ebx
 005A08FF    mov         esp,ebp
 005A0901    pop         ebp
 005A0902    ret         0C
*}
end;

//005A0944
function Stub_WSALookupServiceNextA(const hLookup:THandle; const dwControlFlags:DWORD; var dwBufferLength:DWORD; lpqsResults:PWSAQUERYSETA):Integer; stdcall;
begin
{*
 005A0944    push        ebp
 005A0945    mov         ebp,esp
 005A0947    add         esp,0FFFFFFF0
 005A094A    push        ebx
 005A094B    xor         eax,eax
 005A094D    mov         dword ptr [ebp-10],eax
 005A0950    mov         dword ptr [ebp-4],eax
 005A0953    xor         eax,eax
 005A0955    push        ebp
 005A0956    push        5A0A2D
 005A095B    push        dword ptr fs:[eax]
 005A095E    mov         dword ptr fs:[eax],esp
 005A0961    mov         ebx,dword ptr ds:[789E68]
 005A0967    test        ebx,ebx
>005A0969    jne         005A09A4
 005A096B    lea         edx,[ebp-4]
 005A096E    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0973    call        LoadResString
 005A0978    mov         eax,dword ptr [ebp-4]
 005A097B    push        eax
 005A097C    mov         eax,5A0A4C;'WSALookupServiceNextA'
 005A0981    mov         dword ptr [ebp-0C],eax
 005A0984    mov         byte ptr [ebp-8],11
 005A0988    lea         eax,[ebp-0C]
 005A098B    push        eax
 005A098C    push        0
 005A098E    mov         ecx,276D
 005A0993    mov         dl,1
 005A0995    mov         eax,[0059A068];EIdWinsockStubError
 005A099A    call        EIdWinsockStubError.Build
 005A099F    call        @RaiseExcept
 005A09A4    mov         eax,5A0A4C;'WSALookupServiceNextA'
 005A09A9    call        @UStrToPWChar
 005A09AE    push        eax
 005A09AF    push        ebx
 005A09B0    call        GetProcAddress
 005A09B5    test        eax,eax
>005A09B7    jne         005A09F2
 005A09B9    lea         edx,[ebp-10]
 005A09BC    mov         eax,[0078D780];^SResString602:TResStringRec
 005A09C1    call        LoadResString
 005A09C6    mov         eax,dword ptr [ebp-10]
 005A09C9    push        eax
 005A09CA    mov         eax,5A0A4C;'WSALookupServiceNextA'
 005A09CF    mov         dword ptr [ebp-0C],eax
 005A09D2    mov         byte ptr [ebp-8],11
 005A09D6    lea         eax,[ebp-0C]
 005A09D9    push        eax
 005A09DA    push        0
 005A09DC    mov         ecx,2726
 005A09E1    mov         dl,1
 005A09E3    mov         eax,[0059A068];EIdWinsockStubError
 005A09E8    call        EIdWinsockStubError.Build
 005A09ED    call        @RaiseExcept
 005A09F2    mov         [00789DD8],eax
 005A09F7    mov         eax,dword ptr [ebp+14]
 005A09FA    push        eax
 005A09FB    mov         eax,dword ptr [ebp+10]
 005A09FE    push        eax
 005A09FF    mov         eax,dword ptr [ebp+0C]
 005A0A02    push        eax
 005A0A03    mov         eax,dword ptr [ebp+8]
 005A0A06    push        eax
 005A0A07    call        dword ptr ds:[789DD8]
 005A0A0D    mov         ebx,eax
 005A0A0F    xor         eax,eax
 005A0A11    pop         edx
 005A0A12    pop         ecx
 005A0A13    pop         ecx
 005A0A14    mov         dword ptr fs:[eax],edx
 005A0A17    push        5A0A34
 005A0A1C    lea         eax,[ebp-10]
 005A0A1F    call        @UStrClr
 005A0A24    lea         eax,[ebp-4]
 005A0A27    call        @UStrClr
 005A0A2C    ret
>005A0A2D    jmp         @HandleFinally
>005A0A32    jmp         005A0A1C
 005A0A34    mov         eax,ebx
 005A0A36    pop         ebx
 005A0A37    mov         esp,ebp
 005A0A39    pop         ebp
 005A0A3A    ret         10
*}
end;

//005A0A78
function Stub_WSALookupServiceNextW(const hLookup:THandle; const dwControlFlags:DWORD; var dwBufferLength:DWORD; lpqsResults:PWSAQUERYSETW):Integer; stdcall;
begin
{*
 005A0A78    push        ebp
 005A0A79    mov         ebp,esp
 005A0A7B    add         esp,0FFFFFFF0
 005A0A7E    push        ebx
 005A0A7F    xor         eax,eax
 005A0A81    mov         dword ptr [ebp-10],eax
 005A0A84    mov         dword ptr [ebp-4],eax
 005A0A87    xor         eax,eax
 005A0A89    push        ebp
 005A0A8A    push        5A0B61
 005A0A8F    push        dword ptr fs:[eax]
 005A0A92    mov         dword ptr fs:[eax],esp
 005A0A95    mov         ebx,dword ptr ds:[789E68]
 005A0A9B    test        ebx,ebx
>005A0A9D    jne         005A0AD8
 005A0A9F    lea         edx,[ebp-4]
 005A0AA2    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0AA7    call        LoadResString
 005A0AAC    mov         eax,dword ptr [ebp-4]
 005A0AAF    push        eax
 005A0AB0    mov         eax,5A0B80;'WSALookupServiceNextW'
 005A0AB5    mov         dword ptr [ebp-0C],eax
 005A0AB8    mov         byte ptr [ebp-8],11
 005A0ABC    lea         eax,[ebp-0C]
 005A0ABF    push        eax
 005A0AC0    push        0
 005A0AC2    mov         ecx,276D
 005A0AC7    mov         dl,1
 005A0AC9    mov         eax,[0059A068];EIdWinsockStubError
 005A0ACE    call        EIdWinsockStubError.Build
 005A0AD3    call        @RaiseExcept
 005A0AD8    mov         eax,5A0B80;'WSALookupServiceNextW'
 005A0ADD    call        @UStrToPWChar
 005A0AE2    push        eax
 005A0AE3    push        ebx
 005A0AE4    call        GetProcAddress
 005A0AE9    test        eax,eax
>005A0AEB    jne         005A0B26
 005A0AED    lea         edx,[ebp-10]
 005A0AF0    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0AF5    call        LoadResString
 005A0AFA    mov         eax,dword ptr [ebp-10]
 005A0AFD    push        eax
 005A0AFE    mov         eax,5A0B80;'WSALookupServiceNextW'
 005A0B03    mov         dword ptr [ebp-0C],eax
 005A0B06    mov         byte ptr [ebp-8],11
 005A0B0A    lea         eax,[ebp-0C]
 005A0B0D    push        eax
 005A0B0E    push        0
 005A0B10    mov         ecx,2726
 005A0B15    mov         dl,1
 005A0B17    mov         eax,[0059A068];EIdWinsockStubError
 005A0B1C    call        EIdWinsockStubError.Build
 005A0B21    call        @RaiseExcept
 005A0B26    mov         [00789DDC],eax
 005A0B2B    mov         eax,dword ptr [ebp+14]
 005A0B2E    push        eax
 005A0B2F    mov         eax,dword ptr [ebp+10]
 005A0B32    push        eax
 005A0B33    mov         eax,dword ptr [ebp+0C]
 005A0B36    push        eax
 005A0B37    mov         eax,dword ptr [ebp+8]
 005A0B3A    push        eax
 005A0B3B    call        dword ptr ds:[789DDC]
 005A0B41    mov         ebx,eax
 005A0B43    xor         eax,eax
 005A0B45    pop         edx
 005A0B46    pop         ecx
 005A0B47    pop         ecx
 005A0B48    mov         dword ptr fs:[eax],edx
 005A0B4B    push        5A0B68
 005A0B50    lea         eax,[ebp-10]
 005A0B53    call        @UStrClr
 005A0B58    lea         eax,[ebp-4]
 005A0B5B    call        @UStrClr
 005A0B60    ret
>005A0B61    jmp         @HandleFinally
>005A0B66    jmp         005A0B50
 005A0B68    mov         eax,ebx
 005A0B6A    pop         ebx
 005A0B6B    mov         esp,ebp
 005A0B6D    pop         ebp
 005A0B6E    ret         10
*}
end;

//005A0BAC
function Stub_WSALookupServiceNext(const hLookup:THandle; const dwControlFlags:DWORD; var dwBufferLength:DWORD; lpqsResults:PWSAQUERYSETW):Integer; stdcall;
begin
{*
 005A0BAC    push        ebp
 005A0BAD    mov         ebp,esp
 005A0BAF    add         esp,0FFFFFFF0
 005A0BB2    push        ebx
 005A0BB3    xor         eax,eax
 005A0BB5    mov         dword ptr [ebp-10],eax
 005A0BB8    mov         dword ptr [ebp-4],eax
 005A0BBB    xor         eax,eax
 005A0BBD    push        ebp
 005A0BBE    push        5A0C95
 005A0BC3    push        dword ptr fs:[eax]
 005A0BC6    mov         dword ptr fs:[eax],esp
 005A0BC9    mov         ebx,dword ptr ds:[789E68]
 005A0BCF    test        ebx,ebx
>005A0BD1    jne         005A0C0C
 005A0BD3    lea         edx,[ebp-4]
 005A0BD6    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0BDB    call        LoadResString
 005A0BE0    mov         eax,dword ptr [ebp-4]
 005A0BE3    push        eax
 005A0BE4    mov         eax,5A0CB4;'WSALookupServiceNextW'
 005A0BE9    mov         dword ptr [ebp-0C],eax
 005A0BEC    mov         byte ptr [ebp-8],11
 005A0BF0    lea         eax,[ebp-0C]
 005A0BF3    push        eax
 005A0BF4    push        0
 005A0BF6    mov         ecx,276D
 005A0BFB    mov         dl,1
 005A0BFD    mov         eax,[0059A068];EIdWinsockStubError
 005A0C02    call        EIdWinsockStubError.Build
 005A0C07    call        @RaiseExcept
 005A0C0C    mov         eax,5A0CB4;'WSALookupServiceNextW'
 005A0C11    call        @UStrToPWChar
 005A0C16    push        eax
 005A0C17    push        ebx
 005A0C18    call        GetProcAddress
 005A0C1D    test        eax,eax
>005A0C1F    jne         005A0C5A
 005A0C21    lea         edx,[ebp-10]
 005A0C24    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0C29    call        LoadResString
 005A0C2E    mov         eax,dword ptr [ebp-10]
 005A0C31    push        eax
 005A0C32    mov         eax,5A0CB4;'WSALookupServiceNextW'
 005A0C37    mov         dword ptr [ebp-0C],eax
 005A0C3A    mov         byte ptr [ebp-8],11
 005A0C3E    lea         eax,[ebp-0C]
 005A0C41    push        eax
 005A0C42    push        0
 005A0C44    mov         ecx,2726
 005A0C49    mov         dl,1
 005A0C4B    mov         eax,[0059A068];EIdWinsockStubError
 005A0C50    call        EIdWinsockStubError.Build
 005A0C55    call        @RaiseExcept
 005A0C5A    mov         [00789DE0],eax
 005A0C5F    mov         eax,dword ptr [ebp+14]
 005A0C62    push        eax
 005A0C63    mov         eax,dword ptr [ebp+10]
 005A0C66    push        eax
 005A0C67    mov         eax,dword ptr [ebp+0C]
 005A0C6A    push        eax
 005A0C6B    mov         eax,dword ptr [ebp+8]
 005A0C6E    push        eax
 005A0C6F    call        dword ptr ds:[789DE0]
 005A0C75    mov         ebx,eax
 005A0C77    xor         eax,eax
 005A0C79    pop         edx
 005A0C7A    pop         ecx
 005A0C7B    pop         ecx
 005A0C7C    mov         dword ptr fs:[eax],edx
 005A0C7F    push        5A0C9C
 005A0C84    lea         eax,[ebp-10]
 005A0C87    call        @UStrClr
 005A0C8C    lea         eax,[ebp-4]
 005A0C8F    call        @UStrClr
 005A0C94    ret
>005A0C95    jmp         @HandleFinally
>005A0C9A    jmp         005A0C84
 005A0C9C    mov         eax,ebx
 005A0C9E    pop         ebx
 005A0C9F    mov         esp,ebp
 005A0CA1    pop         ebp
 005A0CA2    ret         10
*}
end;

//005A0CE0
function Stub_WSALookupServiceEnd(const hLookup:THandle):Integer; stdcall;
begin
{*
 005A0CE0    push        ebp
 005A0CE1    mov         ebp,esp
 005A0CE3    add         esp,0FFFFFFF0
 005A0CE6    push        ebx
 005A0CE7    xor         eax,eax
 005A0CE9    mov         dword ptr [ebp-10],eax
 005A0CEC    mov         dword ptr [ebp-4],eax
 005A0CEF    xor         eax,eax
 005A0CF1    push        ebp
 005A0CF2    push        5A0DBD
 005A0CF7    push        dword ptr fs:[eax]
 005A0CFA    mov         dword ptr fs:[eax],esp
 005A0CFD    mov         ebx,dword ptr ds:[789E68]
 005A0D03    test        ebx,ebx
>005A0D05    jne         005A0D40
 005A0D07    lea         edx,[ebp-4]
 005A0D0A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0D0F    call        LoadResString
 005A0D14    mov         eax,dword ptr [ebp-4]
 005A0D17    push        eax
 005A0D18    mov         eax,5A0DDC;'WSALookupServiceEnd'
 005A0D1D    mov         dword ptr [ebp-0C],eax
 005A0D20    mov         byte ptr [ebp-8],11
 005A0D24    lea         eax,[ebp-0C]
 005A0D27    push        eax
 005A0D28    push        0
 005A0D2A    mov         ecx,276D
 005A0D2F    mov         dl,1
 005A0D31    mov         eax,[0059A068];EIdWinsockStubError
 005A0D36    call        EIdWinsockStubError.Build
 005A0D3B    call        @RaiseExcept
 005A0D40    mov         eax,5A0DDC;'WSALookupServiceEnd'
 005A0D45    call        @UStrToPWChar
 005A0D4A    push        eax
 005A0D4B    push        ebx
 005A0D4C    call        GetProcAddress
 005A0D51    test        eax,eax
>005A0D53    jne         005A0D8E
 005A0D55    lea         edx,[ebp-10]
 005A0D58    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0D5D    call        LoadResString
 005A0D62    mov         eax,dword ptr [ebp-10]
 005A0D65    push        eax
 005A0D66    mov         eax,5A0DDC;'WSALookupServiceEnd'
 005A0D6B    mov         dword ptr [ebp-0C],eax
 005A0D6E    mov         byte ptr [ebp-8],11
 005A0D72    lea         eax,[ebp-0C]
 005A0D75    push        eax
 005A0D76    push        0
 005A0D78    mov         ecx,2726
 005A0D7D    mov         dl,1
 005A0D7F    mov         eax,[0059A068];EIdWinsockStubError
 005A0D84    call        EIdWinsockStubError.Build
 005A0D89    call        @RaiseExcept
 005A0D8E    mov         [00789DD4],eax
 005A0D93    mov         eax,dword ptr [ebp+8]
 005A0D96    push        eax
 005A0D97    call        dword ptr ds:[789DD4]
 005A0D9D    mov         ebx,eax
 005A0D9F    xor         eax,eax
 005A0DA1    pop         edx
 005A0DA2    pop         ecx
 005A0DA3    pop         ecx
 005A0DA4    mov         dword ptr fs:[eax],edx
 005A0DA7    push        5A0DC4
 005A0DAC    lea         eax,[ebp-10]
 005A0DAF    call        @UStrClr
 005A0DB4    lea         eax,[ebp-4]
 005A0DB7    call        @UStrClr
 005A0DBC    ret
>005A0DBD    jmp         @HandleFinally
>005A0DC2    jmp         005A0DAC
 005A0DC4    mov         eax,ebx
 005A0DC6    pop         ebx
 005A0DC7    mov         esp,ebp
 005A0DC9    pop         ebp
 005A0DCA    ret         4
*}
end;

//005A0E04
function Stub_WSANSPIoctl(const hLookup:THandle; const dwControlCode:DWORD; lpvInBuffer:Pointer; var cbInBuffer:DWORD; lpvOutBuffer:Pointer; var cbOutBuffer:DWORD; var lpcbBytesReturned:DWORD; lpCompletion:PWSACOMPLETION):Integer; stdcall;
begin
{*
 005A0E04    push        ebp
 005A0E05    mov         ebp,esp
 005A0E07    add         esp,0FFFFFFF0
 005A0E0A    push        ebx
 005A0E0B    xor         eax,eax
 005A0E0D    mov         dword ptr [ebp-10],eax
 005A0E10    mov         dword ptr [ebp-4],eax
 005A0E13    xor         eax,eax
 005A0E15    push        ebp
 005A0E16    push        5A0EFD
 005A0E1B    push        dword ptr fs:[eax]
 005A0E1E    mov         dword ptr fs:[eax],esp
 005A0E21    mov         ebx,dword ptr ds:[789E68]
 005A0E27    test        ebx,ebx
>005A0E29    jne         005A0E64
 005A0E2B    lea         edx,[ebp-4]
 005A0E2E    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0E33    call        LoadResString
 005A0E38    mov         eax,dword ptr [ebp-4]
 005A0E3B    push        eax
 005A0E3C    mov         eax,5A0F1C;'WSANSPIoctl'
 005A0E41    mov         dword ptr [ebp-0C],eax
 005A0E44    mov         byte ptr [ebp-8],11
 005A0E48    lea         eax,[ebp-0C]
 005A0E4B    push        eax
 005A0E4C    push        0
 005A0E4E    mov         ecx,276D
 005A0E53    mov         dl,1
 005A0E55    mov         eax,[0059A068];EIdWinsockStubError
 005A0E5A    call        EIdWinsockStubError.Build
 005A0E5F    call        @RaiseExcept
 005A0E64    mov         eax,5A0F1C;'WSANSPIoctl'
 005A0E69    call        @UStrToPWChar
 005A0E6E    push        eax
 005A0E6F    push        ebx
 005A0E70    call        GetProcAddress
 005A0E75    test        eax,eax
>005A0E77    jne         005A0EB2
 005A0E79    lea         edx,[ebp-10]
 005A0E7C    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0E81    call        LoadResString
 005A0E86    mov         eax,dword ptr [ebp-10]
 005A0E89    push        eax
 005A0E8A    mov         eax,5A0F1C;'WSANSPIoctl'
 005A0E8F    mov         dword ptr [ebp-0C],eax
 005A0E92    mov         byte ptr [ebp-8],11
 005A0E96    lea         eax,[ebp-0C]
 005A0E99    push        eax
 005A0E9A    push        0
 005A0E9C    mov         ecx,2726
 005A0EA1    mov         dl,1
 005A0EA3    mov         eax,[0059A068];EIdWinsockStubError
 005A0EA8    call        EIdWinsockStubError.Build
 005A0EAD    call        @RaiseExcept
 005A0EB2    mov         [00789E64],eax
 005A0EB7    mov         eax,dword ptr [ebp+24]
 005A0EBA    push        eax
 005A0EBB    mov         eax,dword ptr [ebp+20]
 005A0EBE    push        eax
 005A0EBF    mov         eax,dword ptr [ebp+1C]
 005A0EC2    push        eax
 005A0EC3    mov         eax,dword ptr [ebp+18]
 005A0EC6    push        eax
 005A0EC7    mov         eax,dword ptr [ebp+14]
 005A0ECA    push        eax
 005A0ECB    mov         eax,dword ptr [ebp+10]
 005A0ECE    push        eax
 005A0ECF    mov         eax,dword ptr [ebp+0C]
 005A0ED2    push        eax
 005A0ED3    mov         eax,dword ptr [ebp+8]
 005A0ED6    push        eax
 005A0ED7    call        dword ptr ds:[789E64]
 005A0EDD    mov         ebx,eax
 005A0EDF    xor         eax,eax
 005A0EE1    pop         edx
 005A0EE2    pop         ecx
 005A0EE3    pop         ecx
 005A0EE4    mov         dword ptr fs:[eax],edx
 005A0EE7    push        5A0F04
 005A0EEC    lea         eax,[ebp-10]
 005A0EEF    call        @UStrClr
 005A0EF4    lea         eax,[ebp-4]
 005A0EF7    call        @UStrClr
 005A0EFC    ret
>005A0EFD    jmp         @HandleFinally
>005A0F02    jmp         005A0EEC
 005A0F04    mov         eax,ebx
 005A0F06    pop         ebx
 005A0F07    mov         esp,ebp
 005A0F09    pop         ebp
 005A0F0A    ret         20
*}
end;

//005A0F34
function Stub_WSAInstallServiceClassA(const lpServiceClassInfo:PWSASERVICECLASSINFOA):Integer; stdcall;
begin
{*
 005A0F34    push        ebp
 005A0F35    mov         ebp,esp
 005A0F37    add         esp,0FFFFFFF0
 005A0F3A    push        ebx
 005A0F3B    xor         eax,eax
 005A0F3D    mov         dword ptr [ebp-10],eax
 005A0F40    mov         dword ptr [ebp-4],eax
 005A0F43    xor         eax,eax
 005A0F45    push        ebp
 005A0F46    push        5A1011
 005A0F4B    push        dword ptr fs:[eax]
 005A0F4E    mov         dword ptr fs:[eax],esp
 005A0F51    mov         ebx,dword ptr ds:[789E68]
 005A0F57    test        ebx,ebx
>005A0F59    jne         005A0F94
 005A0F5B    lea         edx,[ebp-4]
 005A0F5E    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0F63    call        LoadResString
 005A0F68    mov         eax,dword ptr [ebp-4]
 005A0F6B    push        eax
 005A0F6C    mov         eax,5A1030;'WSAInstallServiceClassA'
 005A0F71    mov         dword ptr [ebp-0C],eax
 005A0F74    mov         byte ptr [ebp-8],11
 005A0F78    lea         eax,[ebp-0C]
 005A0F7B    push        eax
 005A0F7C    push        0
 005A0F7E    mov         ecx,276D
 005A0F83    mov         dl,1
 005A0F85    mov         eax,[0059A068];EIdWinsockStubError
 005A0F8A    call        EIdWinsockStubError.Build
 005A0F8F    call        @RaiseExcept
 005A0F94    mov         eax,5A1030;'WSAInstallServiceClassA'
 005A0F99    call        @UStrToPWChar
 005A0F9E    push        eax
 005A0F9F    push        ebx
 005A0FA0    call        GetProcAddress
 005A0FA5    test        eax,eax
>005A0FA7    jne         005A0FE2
 005A0FA9    lea         edx,[ebp-10]
 005A0FAC    mov         eax,[0078D780];^SResString602:TResStringRec
 005A0FB1    call        LoadResString
 005A0FB6    mov         eax,dword ptr [ebp-10]
 005A0FB9    push        eax
 005A0FBA    mov         eax,5A1030;'WSAInstallServiceClassA'
 005A0FBF    mov         dword ptr [ebp-0C],eax
 005A0FC2    mov         byte ptr [ebp-8],11
 005A0FC6    lea         eax,[ebp-0C]
 005A0FC9    push        eax
 005A0FCA    push        0
 005A0FCC    mov         ecx,2726
 005A0FD1    mov         dl,1
 005A0FD3    mov         eax,[0059A068];EIdWinsockStubError
 005A0FD8    call        EIdWinsockStubError.Build
 005A0FDD    call        @RaiseExcept
 005A0FE2    mov         [00789DB8],eax
 005A0FE7    mov         eax,dword ptr [ebp+8]
 005A0FEA    push        eax
 005A0FEB    call        dword ptr ds:[789DB8]
 005A0FF1    mov         ebx,eax
 005A0FF3    xor         eax,eax
 005A0FF5    pop         edx
 005A0FF6    pop         ecx
 005A0FF7    pop         ecx
 005A0FF8    mov         dword ptr fs:[eax],edx
 005A0FFB    push        5A1018
 005A1000    lea         eax,[ebp-10]
 005A1003    call        @UStrClr
 005A1008    lea         eax,[ebp-4]
 005A100B    call        @UStrClr
 005A1010    ret
>005A1011    jmp         @HandleFinally
>005A1016    jmp         005A1000
 005A1018    mov         eax,ebx
 005A101A    pop         ebx
 005A101B    mov         esp,ebp
 005A101D    pop         ebp
 005A101E    ret         4
*}
end;

//005A1060
function Stub_WSAInstallServiceClassW(const lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;
begin
{*
 005A1060    push        ebp
 005A1061    mov         ebp,esp
 005A1063    add         esp,0FFFFFFF0
 005A1066    push        ebx
 005A1067    xor         eax,eax
 005A1069    mov         dword ptr [ebp-10],eax
 005A106C    mov         dword ptr [ebp-4],eax
 005A106F    xor         eax,eax
 005A1071    push        ebp
 005A1072    push        5A113D
 005A1077    push        dword ptr fs:[eax]
 005A107A    mov         dword ptr fs:[eax],esp
 005A107D    mov         ebx,dword ptr ds:[789E68]
 005A1083    test        ebx,ebx
>005A1085    jne         005A10C0
 005A1087    lea         edx,[ebp-4]
 005A108A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A108F    call        LoadResString
 005A1094    mov         eax,dword ptr [ebp-4]
 005A1097    push        eax
 005A1098    mov         eax,5A115C;'WSAInstallServiceClassW'
 005A109D    mov         dword ptr [ebp-0C],eax
 005A10A0    mov         byte ptr [ebp-8],11
 005A10A4    lea         eax,[ebp-0C]
 005A10A7    push        eax
 005A10A8    push        0
 005A10AA    mov         ecx,276D
 005A10AF    mov         dl,1
 005A10B1    mov         eax,[0059A068];EIdWinsockStubError
 005A10B6    call        EIdWinsockStubError.Build
 005A10BB    call        @RaiseExcept
 005A10C0    mov         eax,5A115C;'WSAInstallServiceClassW'
 005A10C5    call        @UStrToPWChar
 005A10CA    push        eax
 005A10CB    push        ebx
 005A10CC    call        GetProcAddress
 005A10D1    test        eax,eax
>005A10D3    jne         005A110E
 005A10D5    lea         edx,[ebp-10]
 005A10D8    mov         eax,[0078D780];^SResString602:TResStringRec
 005A10DD    call        LoadResString
 005A10E2    mov         eax,dword ptr [ebp-10]
 005A10E5    push        eax
 005A10E6    mov         eax,5A115C;'WSAInstallServiceClassW'
 005A10EB    mov         dword ptr [ebp-0C],eax
 005A10EE    mov         byte ptr [ebp-8],11
 005A10F2    lea         eax,[ebp-0C]
 005A10F5    push        eax
 005A10F6    push        0
 005A10F8    mov         ecx,2726
 005A10FD    mov         dl,1
 005A10FF    mov         eax,[0059A068];EIdWinsockStubError
 005A1104    call        EIdWinsockStubError.Build
 005A1109    call        @RaiseExcept
 005A110E    mov         [00789DBC],eax
 005A1113    mov         eax,dword ptr [ebp+8]
 005A1116    push        eax
 005A1117    call        dword ptr ds:[789DBC]
 005A111D    mov         ebx,eax
 005A111F    xor         eax,eax
 005A1121    pop         edx
 005A1122    pop         ecx
 005A1123    pop         ecx
 005A1124    mov         dword ptr fs:[eax],edx
 005A1127    push        5A1144
 005A112C    lea         eax,[ebp-10]
 005A112F    call        @UStrClr
 005A1134    lea         eax,[ebp-4]
 005A1137    call        @UStrClr
 005A113C    ret
>005A113D    jmp         @HandleFinally
>005A1142    jmp         005A112C
 005A1144    mov         eax,ebx
 005A1146    pop         ebx
 005A1147    mov         esp,ebp
 005A1149    pop         ebp
 005A114A    ret         4
*}
end;

//005A118C
function Stub_WSAInstallServiceClass(const lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;
begin
{*
 005A118C    push        ebp
 005A118D    mov         ebp,esp
 005A118F    add         esp,0FFFFFFF0
 005A1192    push        ebx
 005A1193    xor         eax,eax
 005A1195    mov         dword ptr [ebp-10],eax
 005A1198    mov         dword ptr [ebp-4],eax
 005A119B    xor         eax,eax
 005A119D    push        ebp
 005A119E    push        5A1269
 005A11A3    push        dword ptr fs:[eax]
 005A11A6    mov         dword ptr fs:[eax],esp
 005A11A9    mov         ebx,dword ptr ds:[789E68]
 005A11AF    test        ebx,ebx
>005A11B1    jne         005A11EC
 005A11B3    lea         edx,[ebp-4]
 005A11B6    mov         eax,[0078D780];^SResString602:TResStringRec
 005A11BB    call        LoadResString
 005A11C0    mov         eax,dword ptr [ebp-4]
 005A11C3    push        eax
 005A11C4    mov         eax,5A1288;'WSAInstallServiceClassW'
 005A11C9    mov         dword ptr [ebp-0C],eax
 005A11CC    mov         byte ptr [ebp-8],11
 005A11D0    lea         eax,[ebp-0C]
 005A11D3    push        eax
 005A11D4    push        0
 005A11D6    mov         ecx,276D
 005A11DB    mov         dl,1
 005A11DD    mov         eax,[0059A068];EIdWinsockStubError
 005A11E2    call        EIdWinsockStubError.Build
 005A11E7    call        @RaiseExcept
 005A11EC    mov         eax,5A1288;'WSAInstallServiceClassW'
 005A11F1    call        @UStrToPWChar
 005A11F6    push        eax
 005A11F7    push        ebx
 005A11F8    call        GetProcAddress
 005A11FD    test        eax,eax
>005A11FF    jne         005A123A
 005A1201    lea         edx,[ebp-10]
 005A1204    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1209    call        LoadResString
 005A120E    mov         eax,dword ptr [ebp-10]
 005A1211    push        eax
 005A1212    mov         eax,5A1288;'WSAInstallServiceClassW'
 005A1217    mov         dword ptr [ebp-0C],eax
 005A121A    mov         byte ptr [ebp-8],11
 005A121E    lea         eax,[ebp-0C]
 005A1221    push        eax
 005A1222    push        0
 005A1224    mov         ecx,2726
 005A1229    mov         dl,1
 005A122B    mov         eax,[0059A068];EIdWinsockStubError
 005A1230    call        EIdWinsockStubError.Build
 005A1235    call        @RaiseExcept
 005A123A    mov         [00789DC0],eax
 005A123F    mov         eax,dword ptr [ebp+8]
 005A1242    push        eax
 005A1243    call        dword ptr ds:[789DC0]
 005A1249    mov         ebx,eax
 005A124B    xor         eax,eax
 005A124D    pop         edx
 005A124E    pop         ecx
 005A124F    pop         ecx
 005A1250    mov         dword ptr fs:[eax],edx
 005A1253    push        5A1270
 005A1258    lea         eax,[ebp-10]
 005A125B    call        @UStrClr
 005A1260    lea         eax,[ebp-4]
 005A1263    call        @UStrClr
 005A1268    ret
>005A1269    jmp         @HandleFinally
>005A126E    jmp         005A1258
 005A1270    mov         eax,ebx
 005A1272    pop         ebx
 005A1273    mov         esp,ebp
 005A1275    pop         ebp
 005A1276    ret         4
*}
end;

//005A12B8
function Stub_WSARemoveServiceClass(const lpServiceClassId:PGUID):Integer; stdcall;
begin
{*
 005A12B8    push        ebp
 005A12B9    mov         ebp,esp
 005A12BB    add         esp,0FFFFFFF0
 005A12BE    push        ebx
 005A12BF    xor         eax,eax
 005A12C1    mov         dword ptr [ebp-10],eax
 005A12C4    mov         dword ptr [ebp-4],eax
 005A12C7    xor         eax,eax
 005A12C9    push        ebp
 005A12CA    push        5A1395
 005A12CF    push        dword ptr fs:[eax]
 005A12D2    mov         dword ptr fs:[eax],esp
 005A12D5    mov         ebx,dword ptr ds:[789E68]
 005A12DB    test        ebx,ebx
>005A12DD    jne         005A1318
 005A12DF    lea         edx,[ebp-4]
 005A12E2    mov         eax,[0078D780];^SResString602:TResStringRec
 005A12E7    call        LoadResString
 005A12EC    mov         eax,dword ptr [ebp-4]
 005A12EF    push        eax
 005A12F0    mov         eax,5A13B4;'WSARemoveServiceClass'
 005A12F5    mov         dword ptr [ebp-0C],eax
 005A12F8    mov         byte ptr [ebp-8],11
 005A12FC    lea         eax,[ebp-0C]
 005A12FF    push        eax
 005A1300    push        0
 005A1302    mov         ecx,276D
 005A1307    mov         dl,1
 005A1309    mov         eax,[0059A068];EIdWinsockStubError
 005A130E    call        EIdWinsockStubError.Build
 005A1313    call        @RaiseExcept
 005A1318    mov         eax,5A13B4;'WSARemoveServiceClass'
 005A131D    call        @UStrToPWChar
 005A1322    push        eax
 005A1323    push        ebx
 005A1324    call        GetProcAddress
 005A1329    test        eax,eax
>005A132B    jne         005A1366
 005A132D    lea         edx,[ebp-10]
 005A1330    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1335    call        LoadResString
 005A133A    mov         eax,dword ptr [ebp-10]
 005A133D    push        eax
 005A133E    mov         eax,5A13B4;'WSARemoveServiceClass'
 005A1343    mov         dword ptr [ebp-0C],eax
 005A1346    mov         byte ptr [ebp-8],11
 005A134A    lea         eax,[ebp-0C]
 005A134D    push        eax
 005A134E    push        0
 005A1350    mov         ecx,2726
 005A1355    mov         dl,1
 005A1357    mov         eax,[0059A068];EIdWinsockStubError
 005A135C    call        EIdWinsockStubError.Build
 005A1361    call        @RaiseExcept
 005A1366    mov         [00789DF8],eax
 005A136B    mov         eax,dword ptr [ebp+8]
 005A136E    push        eax
 005A136F    call        dword ptr ds:[789DF8]
 005A1375    mov         ebx,eax
 005A1377    xor         eax,eax
 005A1379    pop         edx
 005A137A    pop         ecx
 005A137B    pop         ecx
 005A137C    mov         dword ptr fs:[eax],edx
 005A137F    push        5A139C
 005A1384    lea         eax,[ebp-10]
 005A1387    call        @UStrClr
 005A138C    lea         eax,[ebp-4]
 005A138F    call        @UStrClr
 005A1394    ret
>005A1395    jmp         @HandleFinally
>005A139A    jmp         005A1384
 005A139C    mov         eax,ebx
 005A139E    pop         ebx
 005A139F    mov         esp,ebp
 005A13A1    pop         ebp
 005A13A2    ret         4
*}
end;

//005A13E0
function Stub_WSAGetServiceClassInfoA(const lpProviderId:PGUID; const lpServiceClassId:PGUID; var lpdwBufSize:DWORD; lpServiceClassInfo:PWSASERVICECLASSINFOA):Integer; stdcall;
begin
{*
 005A13E0    push        ebp
 005A13E1    mov         ebp,esp
 005A13E3    add         esp,0FFFFFFF0
 005A13E6    push        ebx
 005A13E7    xor         eax,eax
 005A13E9    mov         dword ptr [ebp-10],eax
 005A13EC    mov         dword ptr [ebp-4],eax
 005A13EF    xor         eax,eax
 005A13F1    push        ebp
 005A13F2    push        5A14C9
 005A13F7    push        dword ptr fs:[eax]
 005A13FA    mov         dword ptr fs:[eax],esp
 005A13FD    mov         ebx,dword ptr ds:[789E68]
 005A1403    test        ebx,ebx
>005A1405    jne         005A1440
 005A1407    lea         edx,[ebp-4]
 005A140A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A140F    call        LoadResString
 005A1414    mov         eax,dword ptr [ebp-4]
 005A1417    push        eax
 005A1418    mov         eax,5A14E8;'WSAGetServiceClassInfoA'
 005A141D    mov         dword ptr [ebp-0C],eax
 005A1420    mov         byte ptr [ebp-8],11
 005A1424    lea         eax,[ebp-0C]
 005A1427    push        eax
 005A1428    push        0
 005A142A    mov         ecx,276D
 005A142F    mov         dl,1
 005A1431    mov         eax,[0059A068];EIdWinsockStubError
 005A1436    call        EIdWinsockStubError.Build
 005A143B    call        @RaiseExcept
 005A1440    mov         eax,5A14E8;'WSAGetServiceClassInfoA'
 005A1445    call        @UStrToPWChar
 005A144A    push        eax
 005A144B    push        ebx
 005A144C    call        GetProcAddress
 005A1451    test        eax,eax
>005A1453    jne         005A148E
 005A1455    lea         edx,[ebp-10]
 005A1458    mov         eax,[0078D780];^SResString602:TResStringRec
 005A145D    call        LoadResString
 005A1462    mov         eax,dword ptr [ebp-10]
 005A1465    push        eax
 005A1466    mov         eax,5A14E8;'WSAGetServiceClassInfoA'
 005A146B    mov         dword ptr [ebp-0C],eax
 005A146E    mov         byte ptr [ebp-8],11
 005A1472    lea         eax,[ebp-0C]
 005A1475    push        eax
 005A1476    push        0
 005A1478    mov         ecx,2726
 005A147D    mov         dl,1
 005A147F    mov         eax,[0059A068];EIdWinsockStubError
 005A1484    call        EIdWinsockStubError.Build
 005A1489    call        @RaiseExcept
 005A148E    mov         [00789D94],eax
 005A1493    mov         eax,dword ptr [ebp+14]
 005A1496    push        eax
 005A1497    mov         eax,dword ptr [ebp+10]
 005A149A    push        eax
 005A149B    mov         eax,dword ptr [ebp+0C]
 005A149E    push        eax
 005A149F    mov         eax,dword ptr [ebp+8]
 005A14A2    push        eax
 005A14A3    call        dword ptr ds:[789D94]
 005A14A9    mov         ebx,eax
 005A14AB    xor         eax,eax
 005A14AD    pop         edx
 005A14AE    pop         ecx
 005A14AF    pop         ecx
 005A14B0    mov         dword ptr fs:[eax],edx
 005A14B3    push        5A14D0
 005A14B8    lea         eax,[ebp-10]
 005A14BB    call        @UStrClr
 005A14C0    lea         eax,[ebp-4]
 005A14C3    call        @UStrClr
 005A14C8    ret
>005A14C9    jmp         @HandleFinally
>005A14CE    jmp         005A14B8
 005A14D0    mov         eax,ebx
 005A14D2    pop         ebx
 005A14D3    mov         esp,ebp
 005A14D5    pop         ebp
 005A14D6    ret         10
*}
end;

//005A1518
function Stub_WSAGetServiceClassInfoW(const lpProviderId:PGUID; const lpServiceClassId:PGUID; var lpdwBufSize:DWORD; lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;
begin
{*
 005A1518    push        ebp
 005A1519    mov         ebp,esp
 005A151B    add         esp,0FFFFFFF0
 005A151E    push        ebx
 005A151F    xor         eax,eax
 005A1521    mov         dword ptr [ebp-10],eax
 005A1524    mov         dword ptr [ebp-4],eax
 005A1527    xor         eax,eax
 005A1529    push        ebp
 005A152A    push        5A1601
 005A152F    push        dword ptr fs:[eax]
 005A1532    mov         dword ptr fs:[eax],esp
 005A1535    mov         ebx,dword ptr ds:[789E68]
 005A153B    test        ebx,ebx
>005A153D    jne         005A1578
 005A153F    lea         edx,[ebp-4]
 005A1542    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1547    call        LoadResString
 005A154C    mov         eax,dword ptr [ebp-4]
 005A154F    push        eax
 005A1550    mov         eax,5A1620;'WSAGetServiceClassInfoW'
 005A1555    mov         dword ptr [ebp-0C],eax
 005A1558    mov         byte ptr [ebp-8],11
 005A155C    lea         eax,[ebp-0C]
 005A155F    push        eax
 005A1560    push        0
 005A1562    mov         ecx,276D
 005A1567    mov         dl,1
 005A1569    mov         eax,[0059A068];EIdWinsockStubError
 005A156E    call        EIdWinsockStubError.Build
 005A1573    call        @RaiseExcept
 005A1578    mov         eax,5A1620;'WSAGetServiceClassInfoW'
 005A157D    call        @UStrToPWChar
 005A1582    push        eax
 005A1583    push        ebx
 005A1584    call        GetProcAddress
 005A1589    test        eax,eax
>005A158B    jne         005A15C6
 005A158D    lea         edx,[ebp-10]
 005A1590    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1595    call        LoadResString
 005A159A    mov         eax,dword ptr [ebp-10]
 005A159D    push        eax
 005A159E    mov         eax,5A1620;'WSAGetServiceClassInfoW'
 005A15A3    mov         dword ptr [ebp-0C],eax
 005A15A6    mov         byte ptr [ebp-8],11
 005A15AA    lea         eax,[ebp-0C]
 005A15AD    push        eax
 005A15AE    push        0
 005A15B0    mov         ecx,2726
 005A15B5    mov         dl,1
 005A15B7    mov         eax,[0059A068];EIdWinsockStubError
 005A15BC    call        EIdWinsockStubError.Build
 005A15C1    call        @RaiseExcept
 005A15C6    mov         [00789D98],eax
 005A15CB    mov         eax,dword ptr [ebp+14]
 005A15CE    push        eax
 005A15CF    mov         eax,dword ptr [ebp+10]
 005A15D2    push        eax
 005A15D3    mov         eax,dword ptr [ebp+0C]
 005A15D6    push        eax
 005A15D7    mov         eax,dword ptr [ebp+8]
 005A15DA    push        eax
 005A15DB    call        dword ptr ds:[789D98]
 005A15E1    mov         ebx,eax
 005A15E3    xor         eax,eax
 005A15E5    pop         edx
 005A15E6    pop         ecx
 005A15E7    pop         ecx
 005A15E8    mov         dword ptr fs:[eax],edx
 005A15EB    push        5A1608
 005A15F0    lea         eax,[ebp-10]
 005A15F3    call        @UStrClr
 005A15F8    lea         eax,[ebp-4]
 005A15FB    call        @UStrClr
 005A1600    ret
>005A1601    jmp         @HandleFinally
>005A1606    jmp         005A15F0
 005A1608    mov         eax,ebx
 005A160A    pop         ebx
 005A160B    mov         esp,ebp
 005A160D    pop         ebp
 005A160E    ret         10
*}
end;

//005A1650
function Stub_WSAGetServiceClassInfo(const lpProviderId:PGUID; const lpServiceClassId:PGUID; var lpdwBufSize:DWORD; lpServiceClassInfo:PWSASERVICECLASSINFOW):Integer; stdcall;
begin
{*
 005A1650    push        ebp
 005A1651    mov         ebp,esp
 005A1653    add         esp,0FFFFFFF0
 005A1656    push        ebx
 005A1657    xor         eax,eax
 005A1659    mov         dword ptr [ebp-10],eax
 005A165C    mov         dword ptr [ebp-4],eax
 005A165F    xor         eax,eax
 005A1661    push        ebp
 005A1662    push        5A1739
 005A1667    push        dword ptr fs:[eax]
 005A166A    mov         dword ptr fs:[eax],esp
 005A166D    mov         ebx,dword ptr ds:[789E68]
 005A1673    test        ebx,ebx
>005A1675    jne         005A16B0
 005A1677    lea         edx,[ebp-4]
 005A167A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A167F    call        LoadResString
 005A1684    mov         eax,dword ptr [ebp-4]
 005A1687    push        eax
 005A1688    mov         eax,5A1758;'WSAGetServiceClassInfoW'
 005A168D    mov         dword ptr [ebp-0C],eax
 005A1690    mov         byte ptr [ebp-8],11
 005A1694    lea         eax,[ebp-0C]
 005A1697    push        eax
 005A1698    push        0
 005A169A    mov         ecx,276D
 005A169F    mov         dl,1
 005A16A1    mov         eax,[0059A068];EIdWinsockStubError
 005A16A6    call        EIdWinsockStubError.Build
 005A16AB    call        @RaiseExcept
 005A16B0    mov         eax,5A1758;'WSAGetServiceClassInfoW'
 005A16B5    call        @UStrToPWChar
 005A16BA    push        eax
 005A16BB    push        ebx
 005A16BC    call        GetProcAddress
 005A16C1    test        eax,eax
>005A16C3    jne         005A16FE
 005A16C5    lea         edx,[ebp-10]
 005A16C8    mov         eax,[0078D780];^SResString602:TResStringRec
 005A16CD    call        LoadResString
 005A16D2    mov         eax,dword ptr [ebp-10]
 005A16D5    push        eax
 005A16D6    mov         eax,5A1758;'WSAGetServiceClassInfoW'
 005A16DB    mov         dword ptr [ebp-0C],eax
 005A16DE    mov         byte ptr [ebp-8],11
 005A16E2    lea         eax,[ebp-0C]
 005A16E5    push        eax
 005A16E6    push        0
 005A16E8    mov         ecx,2726
 005A16ED    mov         dl,1
 005A16EF    mov         eax,[0059A068];EIdWinsockStubError
 005A16F4    call        EIdWinsockStubError.Build
 005A16F9    call        @RaiseExcept
 005A16FE    mov         [00789D9C],eax
 005A1703    mov         eax,dword ptr [ebp+14]
 005A1706    push        eax
 005A1707    mov         eax,dword ptr [ebp+10]
 005A170A    push        eax
 005A170B    mov         eax,dword ptr [ebp+0C]
 005A170E    push        eax
 005A170F    mov         eax,dword ptr [ebp+8]
 005A1712    push        eax
 005A1713    call        dword ptr ds:[789D9C]
 005A1719    mov         ebx,eax
 005A171B    xor         eax,eax
 005A171D    pop         edx
 005A171E    pop         ecx
 005A171F    pop         ecx
 005A1720    mov         dword ptr fs:[eax],edx
 005A1723    push        5A1740
 005A1728    lea         eax,[ebp-10]
 005A172B    call        @UStrClr
 005A1730    lea         eax,[ebp-4]
 005A1733    call        @UStrClr
 005A1738    ret
>005A1739    jmp         @HandleFinally
>005A173E    jmp         005A1728
 005A1740    mov         eax,ebx
 005A1742    pop         ebx
 005A1743    mov         esp,ebp
 005A1745    pop         ebp
 005A1746    ret         10
*}
end;

//005A1788
function Stub_WSAEnumNameSpaceProvidersA(var lpdwBufferLength:DWORD; const lpnspBuffer:PWSANAMESPACE_INFOA):Integer; stdcall;
begin
{*
 005A1788    push        ebp
 005A1789    mov         ebp,esp
 005A178B    add         esp,0FFFFFFF0
 005A178E    push        ebx
 005A178F    xor         eax,eax
 005A1791    mov         dword ptr [ebp-10],eax
 005A1794    mov         dword ptr [ebp-4],eax
 005A1797    xor         eax,eax
 005A1799    push        ebp
 005A179A    push        5A1869
 005A179F    push        dword ptr fs:[eax]
 005A17A2    mov         dword ptr fs:[eax],esp
 005A17A5    mov         ebx,dword ptr ds:[789E68]
 005A17AB    test        ebx,ebx
>005A17AD    jne         005A17E8
 005A17AF    lea         edx,[ebp-4]
 005A17B2    mov         eax,[0078D780];^SResString602:TResStringRec
 005A17B7    call        LoadResString
 005A17BC    mov         eax,dword ptr [ebp-4]
 005A17BF    push        eax
 005A17C0    mov         eax,5A1888;'WSAEnumNameSpaceProvidersA'
 005A17C5    mov         dword ptr [ebp-0C],eax
 005A17C8    mov         byte ptr [ebp-8],11
 005A17CC    lea         eax,[ebp-0C]
 005A17CF    push        eax
 005A17D0    push        0
 005A17D2    mov         ecx,276D
 005A17D7    mov         dl,1
 005A17D9    mov         eax,[0059A068];EIdWinsockStubError
 005A17DE    call        EIdWinsockStubError.Build
 005A17E3    call        @RaiseExcept
 005A17E8    mov         eax,5A1888;'WSAEnumNameSpaceProvidersA'
 005A17ED    call        @UStrToPWChar
 005A17F2    push        eax
 005A17F3    push        ebx
 005A17F4    call        GetProcAddress
 005A17F9    test        eax,eax
>005A17FB    jne         005A1836
 005A17FD    lea         edx,[ebp-10]
 005A1800    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1805    call        LoadResString
 005A180A    mov         eax,dword ptr [ebp-10]
 005A180D    push        eax
 005A180E    mov         eax,5A1888;'WSAEnumNameSpaceProvidersA'
 005A1813    mov         dword ptr [ebp-0C],eax
 005A1816    mov         byte ptr [ebp-8],11
 005A181A    lea         eax,[ebp-0C]
 005A181D    push        eax
 005A181E    push        0
 005A1820    mov         ecx,2726
 005A1825    mov         dl,1
 005A1827    mov         eax,[0059A068];EIdWinsockStubError
 005A182C    call        EIdWinsockStubError.Build
 005A1831    call        @RaiseExcept
 005A1836    mov         [00789D7C],eax
 005A183B    mov         eax,dword ptr [ebp+0C]
 005A183E    push        eax
 005A183F    mov         eax,dword ptr [ebp+8]
 005A1842    push        eax
 005A1843    call        dword ptr ds:[789D7C]
 005A1849    mov         ebx,eax
 005A184B    xor         eax,eax
 005A184D    pop         edx
 005A184E    pop         ecx
 005A184F    pop         ecx
 005A1850    mov         dword ptr fs:[eax],edx
 005A1853    push        5A1870
 005A1858    lea         eax,[ebp-10]
 005A185B    call        @UStrClr
 005A1860    lea         eax,[ebp-4]
 005A1863    call        @UStrClr
 005A1868    ret
>005A1869    jmp         @HandleFinally
>005A186E    jmp         005A1858
 005A1870    mov         eax,ebx
 005A1872    pop         ebx
 005A1873    mov         esp,ebp
 005A1875    pop         ebp
 005A1876    ret         8
*}
end;

//005A18C0
function Stub_WSAEnumNameSpaceProvidersW(var lpdwBufferLength:DWORD; const lpnspBuffer:PWSANAMESPACE_INFOW):Integer; stdcall;
begin
{*
 005A18C0    push        ebp
 005A18C1    mov         ebp,esp
 005A18C3    add         esp,0FFFFFFF0
 005A18C6    push        ebx
 005A18C7    xor         eax,eax
 005A18C9    mov         dword ptr [ebp-10],eax
 005A18CC    mov         dword ptr [ebp-4],eax
 005A18CF    xor         eax,eax
 005A18D1    push        ebp
 005A18D2    push        5A19A1
 005A18D7    push        dword ptr fs:[eax]
 005A18DA    mov         dword ptr fs:[eax],esp
 005A18DD    mov         ebx,dword ptr ds:[789E68]
 005A18E3    test        ebx,ebx
>005A18E5    jne         005A1920
 005A18E7    lea         edx,[ebp-4]
 005A18EA    mov         eax,[0078D780];^SResString602:TResStringRec
 005A18EF    call        LoadResString
 005A18F4    mov         eax,dword ptr [ebp-4]
 005A18F7    push        eax
 005A18F8    mov         eax,5A19C0;'WSAEnumNameSpaceProvidersW'
 005A18FD    mov         dword ptr [ebp-0C],eax
 005A1900    mov         byte ptr [ebp-8],11
 005A1904    lea         eax,[ebp-0C]
 005A1907    push        eax
 005A1908    push        0
 005A190A    mov         ecx,276D
 005A190F    mov         dl,1
 005A1911    mov         eax,[0059A068];EIdWinsockStubError
 005A1916    call        EIdWinsockStubError.Build
 005A191B    call        @RaiseExcept
 005A1920    mov         eax,5A19C0;'WSAEnumNameSpaceProvidersW'
 005A1925    call        @UStrToPWChar
 005A192A    push        eax
 005A192B    push        ebx
 005A192C    call        GetProcAddress
 005A1931    test        eax,eax
>005A1933    jne         005A196E
 005A1935    lea         edx,[ebp-10]
 005A1938    mov         eax,[0078D780];^SResString602:TResStringRec
 005A193D    call        LoadResString
 005A1942    mov         eax,dword ptr [ebp-10]
 005A1945    push        eax
 005A1946    mov         eax,5A19C0;'WSAEnumNameSpaceProvidersW'
 005A194B    mov         dword ptr [ebp-0C],eax
 005A194E    mov         byte ptr [ebp-8],11
 005A1952    lea         eax,[ebp-0C]
 005A1955    push        eax
 005A1956    push        0
 005A1958    mov         ecx,2726
 005A195D    mov         dl,1
 005A195F    mov         eax,[0059A068];EIdWinsockStubError
 005A1964    call        EIdWinsockStubError.Build
 005A1969    call        @RaiseExcept
 005A196E    mov         [00789D80],eax
 005A1973    mov         eax,dword ptr [ebp+0C]
 005A1976    push        eax
 005A1977    mov         eax,dword ptr [ebp+8]
 005A197A    push        eax
 005A197B    call        dword ptr ds:[789D80]
 005A1981    mov         ebx,eax
 005A1983    xor         eax,eax
 005A1985    pop         edx
 005A1986    pop         ecx
 005A1987    pop         ecx
 005A1988    mov         dword ptr fs:[eax],edx
 005A198B    push        5A19A8
 005A1990    lea         eax,[ebp-10]
 005A1993    call        @UStrClr
 005A1998    lea         eax,[ebp-4]
 005A199B    call        @UStrClr
 005A19A0    ret
>005A19A1    jmp         @HandleFinally
>005A19A6    jmp         005A1990
 005A19A8    mov         eax,ebx
 005A19AA    pop         ebx
 005A19AB    mov         esp,ebp
 005A19AD    pop         ebp
 005A19AE    ret         8
*}
end;

//005A19F8
function Stub_WSAEnumNameSpaceProviders(var lpdwBufferLength:DWORD; const lpnspBuffer:PWSANAMESPACE_INFOW):Integer; stdcall;
begin
{*
 005A19F8    push        ebp
 005A19F9    mov         ebp,esp
 005A19FB    add         esp,0FFFFFFF0
 005A19FE    push        ebx
 005A19FF    xor         eax,eax
 005A1A01    mov         dword ptr [ebp-10],eax
 005A1A04    mov         dword ptr [ebp-4],eax
 005A1A07    xor         eax,eax
 005A1A09    push        ebp
 005A1A0A    push        5A1AD9
 005A1A0F    push        dword ptr fs:[eax]
 005A1A12    mov         dword ptr fs:[eax],esp
 005A1A15    mov         ebx,dword ptr ds:[789E68]
 005A1A1B    test        ebx,ebx
>005A1A1D    jne         005A1A58
 005A1A1F    lea         edx,[ebp-4]
 005A1A22    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1A27    call        LoadResString
 005A1A2C    mov         eax,dword ptr [ebp-4]
 005A1A2F    push        eax
 005A1A30    mov         eax,5A1AF8;'WSAEnumNameSpaceProvidersW'
 005A1A35    mov         dword ptr [ebp-0C],eax
 005A1A38    mov         byte ptr [ebp-8],11
 005A1A3C    lea         eax,[ebp-0C]
 005A1A3F    push        eax
 005A1A40    push        0
 005A1A42    mov         ecx,276D
 005A1A47    mov         dl,1
 005A1A49    mov         eax,[0059A068];EIdWinsockStubError
 005A1A4E    call        EIdWinsockStubError.Build
 005A1A53    call        @RaiseExcept
 005A1A58    mov         eax,5A1AF8;'WSAEnumNameSpaceProvidersW'
 005A1A5D    call        @UStrToPWChar
 005A1A62    push        eax
 005A1A63    push        ebx
 005A1A64    call        GetProcAddress
 005A1A69    test        eax,eax
>005A1A6B    jne         005A1AA6
 005A1A6D    lea         edx,[ebp-10]
 005A1A70    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1A75    call        LoadResString
 005A1A7A    mov         eax,dword ptr [ebp-10]
 005A1A7D    push        eax
 005A1A7E    mov         eax,5A1AF8;'WSAEnumNameSpaceProvidersW'
 005A1A83    mov         dword ptr [ebp-0C],eax
 005A1A86    mov         byte ptr [ebp-8],11
 005A1A8A    lea         eax,[ebp-0C]
 005A1A8D    push        eax
 005A1A8E    push        0
 005A1A90    mov         ecx,2726
 005A1A95    mov         dl,1
 005A1A97    mov         eax,[0059A068];EIdWinsockStubError
 005A1A9C    call        EIdWinsockStubError.Build
 005A1AA1    call        @RaiseExcept
 005A1AA6    mov         [00789D84],eax
 005A1AAB    mov         eax,dword ptr [ebp+0C]
 005A1AAE    push        eax
 005A1AAF    mov         eax,dword ptr [ebp+8]
 005A1AB2    push        eax
 005A1AB3    call        dword ptr ds:[789D84]
 005A1AB9    mov         ebx,eax
 005A1ABB    xor         eax,eax
 005A1ABD    pop         edx
 005A1ABE    pop         ecx
 005A1ABF    pop         ecx
 005A1AC0    mov         dword ptr fs:[eax],edx
 005A1AC3    push        5A1AE0
 005A1AC8    lea         eax,[ebp-10]
 005A1ACB    call        @UStrClr
 005A1AD0    lea         eax,[ebp-4]
 005A1AD3    call        @UStrClr
 005A1AD8    ret
>005A1AD9    jmp         @HandleFinally
>005A1ADE    jmp         005A1AC8
 005A1AE0    mov         eax,ebx
 005A1AE2    pop         ebx
 005A1AE3    mov         esp,ebp
 005A1AE5    pop         ebp
 005A1AE6    ret         8
*}
end;

//005A1B30
function Stub_WSAGetServiceClassNameByClassIdA(const lpServiceClassId:PGUID; lpszServiceClassName:PAnsiChar; var lpdwBufferLength:DWORD):Integer; stdcall;
begin
{*
 005A1B30    push        ebp
 005A1B31    mov         ebp,esp
 005A1B33    add         esp,0FFFFFFF0
 005A1B36    push        ebx
 005A1B37    xor         eax,eax
 005A1B39    mov         dword ptr [ebp-10],eax
 005A1B3C    mov         dword ptr [ebp-4],eax
 005A1B3F    xor         eax,eax
 005A1B41    push        ebp
 005A1B42    push        5A1C15
 005A1B47    push        dword ptr fs:[eax]
 005A1B4A    mov         dword ptr fs:[eax],esp
 005A1B4D    mov         ebx,dword ptr ds:[789E68]
 005A1B53    test        ebx,ebx
>005A1B55    jne         005A1B90
 005A1B57    lea         edx,[ebp-4]
 005A1B5A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1B5F    call        LoadResString
 005A1B64    mov         eax,dword ptr [ebp-4]
 005A1B67    push        eax
 005A1B68    mov         eax,5A1C34;'WSAGetServiceClassNameByClassIdA'
 005A1B6D    mov         dword ptr [ebp-0C],eax
 005A1B70    mov         byte ptr [ebp-8],11
 005A1B74    lea         eax,[ebp-0C]
 005A1B77    push        eax
 005A1B78    push        0
 005A1B7A    mov         ecx,276D
 005A1B7F    mov         dl,1
 005A1B81    mov         eax,[0059A068];EIdWinsockStubError
 005A1B86    call        EIdWinsockStubError.Build
 005A1B8B    call        @RaiseExcept
 005A1B90    mov         eax,5A1C34;'WSAGetServiceClassNameByClassIdA'
 005A1B95    call        @UStrToPWChar
 005A1B9A    push        eax
 005A1B9B    push        ebx
 005A1B9C    call        GetProcAddress
 005A1BA1    test        eax,eax
>005A1BA3    jne         005A1BDE
 005A1BA5    lea         edx,[ebp-10]
 005A1BA8    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1BAD    call        LoadResString
 005A1BB2    mov         eax,dword ptr [ebp-10]
 005A1BB5    push        eax
 005A1BB6    mov         eax,5A1C34;'WSAGetServiceClassNameByClassIdA'
 005A1BBB    mov         dword ptr [ebp-0C],eax
 005A1BBE    mov         byte ptr [ebp-8],11
 005A1BC2    lea         eax,[ebp-0C]
 005A1BC5    push        eax
 005A1BC6    push        0
 005A1BC8    mov         ecx,2726
 005A1BCD    mov         dl,1
 005A1BCF    mov         eax,[0059A068];EIdWinsockStubError
 005A1BD4    call        EIdWinsockStubError.Build
 005A1BD9    call        @RaiseExcept
 005A1BDE    mov         [00789DA0],eax
 005A1BE3    mov         eax,dword ptr [ebp+10]
 005A1BE6    push        eax
 005A1BE7    mov         eax,dword ptr [ebp+0C]
 005A1BEA    push        eax
 005A1BEB    mov         eax,dword ptr [ebp+8]
 005A1BEE    push        eax
 005A1BEF    call        dword ptr ds:[789DA0]
 005A1BF5    mov         ebx,eax
 005A1BF7    xor         eax,eax
 005A1BF9    pop         edx
 005A1BFA    pop         ecx
 005A1BFB    pop         ecx
 005A1BFC    mov         dword ptr fs:[eax],edx
 005A1BFF    push        5A1C1C
 005A1C04    lea         eax,[ebp-10]
 005A1C07    call        @UStrClr
 005A1C0C    lea         eax,[ebp-4]
 005A1C0F    call        @UStrClr
 005A1C14    ret
>005A1C15    jmp         @HandleFinally
>005A1C1A    jmp         005A1C04
 005A1C1C    mov         eax,ebx
 005A1C1E    pop         ebx
 005A1C1F    mov         esp,ebp
 005A1C21    pop         ebp
 005A1C22    ret         0C
*}
end;

//005A1C78
function Stub_WSAGetServiceClassNameByClassIdW(const lpServiceClassId:PGUID; lpszServiceClassName:PWideChar; var lpdwBufferLength:DWORD):Integer; stdcall;
begin
{*
 005A1C78    push        ebp
 005A1C79    mov         ebp,esp
 005A1C7B    add         esp,0FFFFFFF0
 005A1C7E    push        ebx
 005A1C7F    xor         eax,eax
 005A1C81    mov         dword ptr [ebp-10],eax
 005A1C84    mov         dword ptr [ebp-4],eax
 005A1C87    xor         eax,eax
 005A1C89    push        ebp
 005A1C8A    push        5A1D5D
 005A1C8F    push        dword ptr fs:[eax]
 005A1C92    mov         dword ptr fs:[eax],esp
 005A1C95    mov         ebx,dword ptr ds:[789E68]
 005A1C9B    test        ebx,ebx
>005A1C9D    jne         005A1CD8
 005A1C9F    lea         edx,[ebp-4]
 005A1CA2    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1CA7    call        LoadResString
 005A1CAC    mov         eax,dword ptr [ebp-4]
 005A1CAF    push        eax
 005A1CB0    mov         eax,5A1D7C;'WSAGetServiceClassNameByClassIdW'
 005A1CB5    mov         dword ptr [ebp-0C],eax
 005A1CB8    mov         byte ptr [ebp-8],11
 005A1CBC    lea         eax,[ebp-0C]
 005A1CBF    push        eax
 005A1CC0    push        0
 005A1CC2    mov         ecx,276D
 005A1CC7    mov         dl,1
 005A1CC9    mov         eax,[0059A068];EIdWinsockStubError
 005A1CCE    call        EIdWinsockStubError.Build
 005A1CD3    call        @RaiseExcept
 005A1CD8    mov         eax,5A1D7C;'WSAGetServiceClassNameByClassIdW'
 005A1CDD    call        @UStrToPWChar
 005A1CE2    push        eax
 005A1CE3    push        ebx
 005A1CE4    call        GetProcAddress
 005A1CE9    test        eax,eax
>005A1CEB    jne         005A1D26
 005A1CED    lea         edx,[ebp-10]
 005A1CF0    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1CF5    call        LoadResString
 005A1CFA    mov         eax,dword ptr [ebp-10]
 005A1CFD    push        eax
 005A1CFE    mov         eax,5A1D7C;'WSAGetServiceClassNameByClassIdW'
 005A1D03    mov         dword ptr [ebp-0C],eax
 005A1D06    mov         byte ptr [ebp-8],11
 005A1D0A    lea         eax,[ebp-0C]
 005A1D0D    push        eax
 005A1D0E    push        0
 005A1D10    mov         ecx,2726
 005A1D15    mov         dl,1
 005A1D17    mov         eax,[0059A068];EIdWinsockStubError
 005A1D1C    call        EIdWinsockStubError.Build
 005A1D21    call        @RaiseExcept
 005A1D26    mov         [00789DA4],eax
 005A1D2B    mov         eax,dword ptr [ebp+10]
 005A1D2E    push        eax
 005A1D2F    mov         eax,dword ptr [ebp+0C]
 005A1D32    push        eax
 005A1D33    mov         eax,dword ptr [ebp+8]
 005A1D36    push        eax
 005A1D37    call        dword ptr ds:[789DA4]
 005A1D3D    mov         ebx,eax
 005A1D3F    xor         eax,eax
 005A1D41    pop         edx
 005A1D42    pop         ecx
 005A1D43    pop         ecx
 005A1D44    mov         dword ptr fs:[eax],edx
 005A1D47    push        5A1D64
 005A1D4C    lea         eax,[ebp-10]
 005A1D4F    call        @UStrClr
 005A1D54    lea         eax,[ebp-4]
 005A1D57    call        @UStrClr
 005A1D5C    ret
>005A1D5D    jmp         @HandleFinally
>005A1D62    jmp         005A1D4C
 005A1D64    mov         eax,ebx
 005A1D66    pop         ebx
 005A1D67    mov         esp,ebp
 005A1D69    pop         ebp
 005A1D6A    ret         0C
*}
end;

//005A1DC0
function Stub_WSAGetServiceClassNameByClassId(const lpServiceClassId:PGUID; lpszServiceClassName:PWideChar; var lpdwBufferLength:DWORD):Integer; stdcall;
begin
{*
 005A1DC0    push        ebp
 005A1DC1    mov         ebp,esp
 005A1DC3    add         esp,0FFFFFFF0
 005A1DC6    push        ebx
 005A1DC7    xor         eax,eax
 005A1DC9    mov         dword ptr [ebp-10],eax
 005A1DCC    mov         dword ptr [ebp-4],eax
 005A1DCF    xor         eax,eax
 005A1DD1    push        ebp
 005A1DD2    push        5A1EA5
 005A1DD7    push        dword ptr fs:[eax]
 005A1DDA    mov         dword ptr fs:[eax],esp
 005A1DDD    mov         ebx,dword ptr ds:[789E68]
 005A1DE3    test        ebx,ebx
>005A1DE5    jne         005A1E20
 005A1DE7    lea         edx,[ebp-4]
 005A1DEA    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1DEF    call        LoadResString
 005A1DF4    mov         eax,dword ptr [ebp-4]
 005A1DF7    push        eax
 005A1DF8    mov         eax,5A1EC4;'WSAGetServiceClassNameByClassIdW'
 005A1DFD    mov         dword ptr [ebp-0C],eax
 005A1E00    mov         byte ptr [ebp-8],11
 005A1E04    lea         eax,[ebp-0C]
 005A1E07    push        eax
 005A1E08    push        0
 005A1E0A    mov         ecx,276D
 005A1E0F    mov         dl,1
 005A1E11    mov         eax,[0059A068];EIdWinsockStubError
 005A1E16    call        EIdWinsockStubError.Build
 005A1E1B    call        @RaiseExcept
 005A1E20    mov         eax,5A1EC4;'WSAGetServiceClassNameByClassIdW'
 005A1E25    call        @UStrToPWChar
 005A1E2A    push        eax
 005A1E2B    push        ebx
 005A1E2C    call        GetProcAddress
 005A1E31    test        eax,eax
>005A1E33    jne         005A1E6E
 005A1E35    lea         edx,[ebp-10]
 005A1E38    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1E3D    call        LoadResString
 005A1E42    mov         eax,dword ptr [ebp-10]
 005A1E45    push        eax
 005A1E46    mov         eax,5A1EC4;'WSAGetServiceClassNameByClassIdW'
 005A1E4B    mov         dword ptr [ebp-0C],eax
 005A1E4E    mov         byte ptr [ebp-8],11
 005A1E52    lea         eax,[ebp-0C]
 005A1E55    push        eax
 005A1E56    push        0
 005A1E58    mov         ecx,2726
 005A1E5D    mov         dl,1
 005A1E5F    mov         eax,[0059A068];EIdWinsockStubError
 005A1E64    call        EIdWinsockStubError.Build
 005A1E69    call        @RaiseExcept
 005A1E6E    mov         [00789DA8],eax
 005A1E73    mov         eax,dword ptr [ebp+10]
 005A1E76    push        eax
 005A1E77    mov         eax,dword ptr [ebp+0C]
 005A1E7A    push        eax
 005A1E7B    mov         eax,dword ptr [ebp+8]
 005A1E7E    push        eax
 005A1E7F    call        dword ptr ds:[789DA8]
 005A1E85    mov         ebx,eax
 005A1E87    xor         eax,eax
 005A1E89    pop         edx
 005A1E8A    pop         ecx
 005A1E8B    pop         ecx
 005A1E8C    mov         dword ptr fs:[eax],edx
 005A1E8F    push        5A1EAC
 005A1E94    lea         eax,[ebp-10]
 005A1E97    call        @UStrClr
 005A1E9C    lea         eax,[ebp-4]
 005A1E9F    call        @UStrClr
 005A1EA4    ret
>005A1EA5    jmp         @HandleFinally
>005A1EAA    jmp         005A1E94
 005A1EAC    mov         eax,ebx
 005A1EAE    pop         ebx
 005A1EAF    mov         esp,ebp
 005A1EB1    pop         ebp
 005A1EB2    ret         0C
*}
end;

//005A1F08
function Stub_WSASetServiceA(const lpqsRegInfo:PWSAQUERYSETA; const essoperation:WSAESETSERVICEOP; const dwControlFlags:DWORD):Integer; stdcall;
begin
{*
 005A1F08    push        ebp
 005A1F09    mov         ebp,esp
 005A1F0B    add         esp,0FFFFFFF0
 005A1F0E    push        ebx
 005A1F0F    xor         eax,eax
 005A1F11    mov         dword ptr [ebp-10],eax
 005A1F14    mov         dword ptr [ebp-4],eax
 005A1F17    xor         eax,eax
 005A1F19    push        ebp
 005A1F1A    push        5A1FED
 005A1F1F    push        dword ptr fs:[eax]
 005A1F22    mov         dword ptr fs:[eax],esp
 005A1F25    mov         ebx,dword ptr ds:[789E68]
 005A1F2B    test        ebx,ebx
>005A1F2D    jne         005A1F68
 005A1F2F    lea         edx,[ebp-4]
 005A1F32    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1F37    call        LoadResString
 005A1F3C    mov         eax,dword ptr [ebp-4]
 005A1F3F    push        eax
 005A1F40    mov         eax,5A200C;'WSASetServiceA'
 005A1F45    mov         dword ptr [ebp-0C],eax
 005A1F48    mov         byte ptr [ebp-8],11
 005A1F4C    lea         eax,[ebp-0C]
 005A1F4F    push        eax
 005A1F50    push        0
 005A1F52    mov         ecx,276D
 005A1F57    mov         dl,1
 005A1F59    mov         eax,[0059A068];EIdWinsockStubError
 005A1F5E    call        EIdWinsockStubError.Build
 005A1F63    call        @RaiseExcept
 005A1F68    mov         eax,5A200C;'WSASetServiceA'
 005A1F6D    call        @UStrToPWChar
 005A1F72    push        eax
 005A1F73    push        ebx
 005A1F74    call        GetProcAddress
 005A1F79    test        eax,eax
>005A1F7B    jne         005A1FB6
 005A1F7D    lea         edx,[ebp-10]
 005A1F80    mov         eax,[0078D780];^SResString602:TResStringRec
 005A1F85    call        LoadResString
 005A1F8A    mov         eax,dword ptr [ebp-10]
 005A1F8D    push        eax
 005A1F8E    mov         eax,5A200C;'WSASetServiceA'
 005A1F93    mov         dword ptr [ebp-0C],eax
 005A1F96    mov         byte ptr [ebp-8],11
 005A1F9A    lea         eax,[ebp-0C]
 005A1F9D    push        eax
 005A1F9E    push        0
 005A1FA0    mov         ecx,2726
 005A1FA5    mov         dl,1
 005A1FA7    mov         eax,[0059A068];EIdWinsockStubError
 005A1FAC    call        EIdWinsockStubError.Build
 005A1FB1    call        @RaiseExcept
 005A1FB6    mov         [00789E10],eax
 005A1FBB    mov         eax,dword ptr [ebp+10]
 005A1FBE    push        eax
 005A1FBF    mov         eax,dword ptr [ebp+0C]
 005A1FC2    push        eax
 005A1FC3    mov         eax,dword ptr [ebp+8]
 005A1FC6    push        eax
 005A1FC7    call        dword ptr ds:[789E10]
 005A1FCD    mov         ebx,eax
 005A1FCF    xor         eax,eax
 005A1FD1    pop         edx
 005A1FD2    pop         ecx
 005A1FD3    pop         ecx
 005A1FD4    mov         dword ptr fs:[eax],edx
 005A1FD7    push        5A1FF4
 005A1FDC    lea         eax,[ebp-10]
 005A1FDF    call        @UStrClr
 005A1FE4    lea         eax,[ebp-4]
 005A1FE7    call        @UStrClr
 005A1FEC    ret
>005A1FED    jmp         @HandleFinally
>005A1FF2    jmp         005A1FDC
 005A1FF4    mov         eax,ebx
 005A1FF6    pop         ebx
 005A1FF7    mov         esp,ebp
 005A1FF9    pop         ebp
 005A1FFA    ret         0C
*}
end;

//005A202C
function Stub_WSASetServiceW(const lpqsRegInfo:PWSAQUERYSETW; const essoperation:WSAESETSERVICEOP; const dwControlFlags:DWORD):Integer; stdcall;
begin
{*
 005A202C    push        ebp
 005A202D    mov         ebp,esp
 005A202F    add         esp,0FFFFFFF0
 005A2032    push        ebx
 005A2033    xor         eax,eax
 005A2035    mov         dword ptr [ebp-10],eax
 005A2038    mov         dword ptr [ebp-4],eax
 005A203B    xor         eax,eax
 005A203D    push        ebp
 005A203E    push        5A2111
 005A2043    push        dword ptr fs:[eax]
 005A2046    mov         dword ptr fs:[eax],esp
 005A2049    mov         ebx,dword ptr ds:[789E68]
 005A204F    test        ebx,ebx
>005A2051    jne         005A208C
 005A2053    lea         edx,[ebp-4]
 005A2056    mov         eax,[0078D780];^SResString602:TResStringRec
 005A205B    call        LoadResString
 005A2060    mov         eax,dword ptr [ebp-4]
 005A2063    push        eax
 005A2064    mov         eax,5A2130;'WSASetServiceW'
 005A2069    mov         dword ptr [ebp-0C],eax
 005A206C    mov         byte ptr [ebp-8],11
 005A2070    lea         eax,[ebp-0C]
 005A2073    push        eax
 005A2074    push        0
 005A2076    mov         ecx,276D
 005A207B    mov         dl,1
 005A207D    mov         eax,[0059A068];EIdWinsockStubError
 005A2082    call        EIdWinsockStubError.Build
 005A2087    call        @RaiseExcept
 005A208C    mov         eax,5A2130;'WSASetServiceW'
 005A2091    call        @UStrToPWChar
 005A2096    push        eax
 005A2097    push        ebx
 005A2098    call        GetProcAddress
 005A209D    test        eax,eax
>005A209F    jne         005A20DA
 005A20A1    lea         edx,[ebp-10]
 005A20A4    mov         eax,[0078D780];^SResString602:TResStringRec
 005A20A9    call        LoadResString
 005A20AE    mov         eax,dword ptr [ebp-10]
 005A20B1    push        eax
 005A20B2    mov         eax,5A2130;'WSASetServiceW'
 005A20B7    mov         dword ptr [ebp-0C],eax
 005A20BA    mov         byte ptr [ebp-8],11
 005A20BE    lea         eax,[ebp-0C]
 005A20C1    push        eax
 005A20C2    push        0
 005A20C4    mov         ecx,2726
 005A20C9    mov         dl,1
 005A20CB    mov         eax,[0059A068];EIdWinsockStubError
 005A20D0    call        EIdWinsockStubError.Build
 005A20D5    call        @RaiseExcept
 005A20DA    mov         [00789E14],eax
 005A20DF    mov         eax,dword ptr [ebp+10]
 005A20E2    push        eax
 005A20E3    mov         eax,dword ptr [ebp+0C]
 005A20E6    push        eax
 005A20E7    mov         eax,dword ptr [ebp+8]
 005A20EA    push        eax
 005A20EB    call        dword ptr ds:[789E14]
 005A20F1    mov         ebx,eax
 005A20F3    xor         eax,eax
 005A20F5    pop         edx
 005A20F6    pop         ecx
 005A20F7    pop         ecx
 005A20F8    mov         dword ptr fs:[eax],edx
 005A20FB    push        5A2118
 005A2100    lea         eax,[ebp-10]
 005A2103    call        @UStrClr
 005A2108    lea         eax,[ebp-4]
 005A210B    call        @UStrClr
 005A2110    ret
>005A2111    jmp         @HandleFinally
>005A2116    jmp         005A2100
 005A2118    mov         eax,ebx
 005A211A    pop         ebx
 005A211B    mov         esp,ebp
 005A211D    pop         ebp
 005A211E    ret         0C
*}
end;

//005A2150
function Stub_WSASetService(const lpqsRegInfo:PWSAQUERYSETW; const essoperation:WSAESETSERVICEOP; const dwControlFlags:DWORD):Integer; stdcall;
begin
{*
 005A2150    push        ebp
 005A2151    mov         ebp,esp
 005A2153    add         esp,0FFFFFFF0
 005A2156    push        ebx
 005A2157    xor         eax,eax
 005A2159    mov         dword ptr [ebp-10],eax
 005A215C    mov         dword ptr [ebp-4],eax
 005A215F    xor         eax,eax
 005A2161    push        ebp
 005A2162    push        5A2235
 005A2167    push        dword ptr fs:[eax]
 005A216A    mov         dword ptr fs:[eax],esp
 005A216D    mov         ebx,dword ptr ds:[789E68]
 005A2173    test        ebx,ebx
>005A2175    jne         005A21B0
 005A2177    lea         edx,[ebp-4]
 005A217A    mov         eax,[0078D780];^SResString602:TResStringRec
 005A217F    call        LoadResString
 005A2184    mov         eax,dword ptr [ebp-4]
 005A2187    push        eax
 005A2188    mov         eax,5A2254;'WSASetServiceW'
 005A218D    mov         dword ptr [ebp-0C],eax
 005A2190    mov         byte ptr [ebp-8],11
 005A2194    lea         eax,[ebp-0C]
 005A2197    push        eax
 005A2198    push        0
 005A219A    mov         ecx,276D
 005A219F    mov         dl,1
 005A21A1    mov         eax,[0059A068];EIdWinsockStubError
 005A21A6    call        EIdWinsockStubError.Build
 005A21AB    call        @RaiseExcept
 005A21B0    mov         eax,5A2254;'WSASetServiceW'
 005A21B5    call        @UStrToPWChar
 005A21BA    push        eax
 005A21BB    push        ebx
 005A21BC    call        GetProcAddress
 005A21C1    test        eax,eax
>005A21C3    jne         005A21FE
 005A21C5    lea         edx,[ebp-10]
 005A21C8    mov         eax,[0078D780];^SResString602:TResStringRec
 005A21CD    call        LoadResString
 005A21D2    mov         eax,dword ptr [ebp-10]
 005A21D5    push        eax
 005A21D6    mov         eax,5A2254;'WSASetServiceW'
 005A21DB    mov         dword ptr [ebp-0C],eax
 005A21DE    mov         byte ptr [ebp-8],11
 005A21E2    lea         eax,[ebp-0C]
 005A21E5    push        eax
 005A21E6    push        0
 005A21E8    mov         ecx,2726
 005A21ED    mov         dl,1
 005A21EF    mov         eax,[0059A068];EIdWinsockStubError
 005A21F4    call        EIdWinsockStubError.Build
 005A21F9    call        @RaiseExcept
 005A21FE    mov         [00789E18],eax
 005A2203    mov         eax,dword ptr [ebp+10]
 005A2206    push        eax
 005A2207    mov         eax,dword ptr [ebp+0C]
 005A220A    push        eax
 005A220B    mov         eax,dword ptr [ebp+8]
 005A220E    push        eax
 005A220F    call        dword ptr ds:[789E18]
 005A2215    mov         ebx,eax
 005A2217    xor         eax,eax
 005A2219    pop         edx
 005A221A    pop         ecx
 005A221B    pop         ecx
 005A221C    mov         dword ptr fs:[eax],edx
 005A221F    push        5A223C
 005A2224    lea         eax,[ebp-10]
 005A2227    call        @UStrClr
 005A222C    lea         eax,[ebp-4]
 005A222F    call        @UStrClr
 005A2234    ret
>005A2235    jmp         @HandleFinally
>005A223A    jmp         005A2224
 005A223C    mov         eax,ebx
 005A223E    pop         ebx
 005A223F    mov         esp,ebp
 005A2241    pop         ebp
 005A2242    ret         0C
*}
end;

//005A2274
function Stub_WSAProviderConfigChange(var lpNotificationHandle:THandle; AOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 005A2274    push        ebp
 005A2275    mov         ebp,esp
 005A2277    add         esp,0FFFFFFF0
 005A227A    push        ebx
 005A227B    xor         eax,eax
 005A227D    mov         dword ptr [ebp-10],eax
 005A2280    mov         dword ptr [ebp-4],eax
 005A2283    xor         eax,eax
 005A2285    push        ebp
 005A2286    push        5A2359
 005A228B    push        dword ptr fs:[eax]
 005A228E    mov         dword ptr fs:[eax],esp
 005A2291    mov         ebx,dword ptr ds:[789E68]
 005A2297    test        ebx,ebx
>005A2299    jne         005A22D4
 005A229B    lea         edx,[ebp-4]
 005A229E    mov         eax,[0078D780];^SResString602:TResStringRec
 005A22A3    call        LoadResString
 005A22A8    mov         eax,dword ptr [ebp-4]
 005A22AB    push        eax
 005A22AC    mov         eax,5A2378;'WSAProviderConfigChange'
 005A22B1    mov         dword ptr [ebp-0C],eax
 005A22B4    mov         byte ptr [ebp-8],11
 005A22B8    lea         eax,[ebp-0C]
 005A22BB    push        eax
 005A22BC    push        0
 005A22BE    mov         ecx,276D
 005A22C3    mov         dl,1
 005A22C5    mov         eax,[0059A068];EIdWinsockStubError
 005A22CA    call        EIdWinsockStubError.Build
 005A22CF    call        @RaiseExcept
 005A22D4    mov         eax,5A2378;'WSAProviderConfigChange'
 005A22D9    call        @UStrToPWChar
 005A22DE    push        eax
 005A22DF    push        ebx
 005A22E0    call        GetProcAddress
 005A22E5    test        eax,eax
>005A22E7    jne         005A2322
 005A22E9    lea         edx,[ebp-10]
 005A22EC    mov         eax,[0078D780];^SResString602:TResStringRec
 005A22F1    call        LoadResString
 005A22F6    mov         eax,dword ptr [ebp-10]
 005A22F9    push        eax
 005A22FA    mov         eax,5A2378;'WSAProviderConfigChange'
 005A22FF    mov         dword ptr [ebp-0C],eax
 005A2302    mov         byte ptr [ebp-8],11
 005A2306    lea         eax,[ebp-0C]
 005A2309    push        eax
 005A230A    push        0
 005A230C    mov         ecx,2726
 005A2311    mov         dl,1
 005A2313    mov         eax,[0059A068];EIdWinsockStubError
 005A2318    call        EIdWinsockStubError.Build
 005A231D    call        @RaiseExcept
 005A2322    mov         [00789E38],eax
 005A2327    mov         eax,dword ptr [ebp+10]
 005A232A    push        eax
 005A232B    mov         eax,dword ptr [ebp+0C]
 005A232E    push        eax
 005A232F    mov         eax,dword ptr [ebp+8]
 005A2332    push        eax
 005A2333    call        dword ptr ds:[789E38]
 005A2339    mov         ebx,eax
 005A233B    xor         eax,eax
 005A233D    pop         edx
 005A233E    pop         ecx
 005A233F    pop         ecx
 005A2340    mov         dword ptr fs:[eax],edx
 005A2343    push        5A2360
 005A2348    lea         eax,[ebp-10]
 005A234B    call        @UStrClr
 005A2350    lea         eax,[ebp-4]
 005A2353    call        @UStrClr
 005A2358    ret
>005A2359    jmp         @HandleFinally
>005A235E    jmp         005A2348
 005A2360    mov         eax,ebx
 005A2362    pop         ebx
 005A2363    mov         esp,ebp
 005A2365    pop         ebp
 005A2366    ret         0C
*}
end;

//005A23A8
function Stub_TransmitFile(hSocket:PtrUInt; hFile:THandle; nNumberOfBytesToWrite:DWORD; nNumberOfBytesPerSend:DWORD; lpOverlapped:POverlapped; lpTransmitBuffers:PTransmitFileBuffers; dwReserved:DWORD):BOOL; stdcall;
begin
{*
 005A23A8    push        ebp
 005A23A9    mov         ebp,esp
 005A23AB    push        ebx
 005A23AC    mov         ebx,dword ptr [ebp+8]
 005A23AF    mov         ecx,789C38
 005A23B4    mov         edx,5A23F8;'TransmitFile'
 005A23B9    mov         eax,ebx
 005A23BB    call        FixupStubEx
 005A23C0    mov         [00789E3C],eax
 005A23C5    mov         eax,dword ptr [ebp+20]
 005A23C8    push        eax
 005A23C9    mov         eax,dword ptr [ebp+1C]
 005A23CC    push        eax
 005A23CD    mov         eax,dword ptr [ebp+18]
 005A23D0    push        eax
 005A23D1    mov         eax,dword ptr [ebp+14]
 005A23D4    push        eax
 005A23D5    mov         eax,dword ptr [ebp+10]
 005A23D8    push        eax
 005A23D9    mov         eax,dword ptr [ebp+0C]
 005A23DC    push        eax
 005A23DD    push        ebx
 005A23DE    call        dword ptr ds:[789E3C]
 005A23E4    pop         ebx
 005A23E5    pop         ebp
 005A23E6    ret         1C
*}
end;

//005A2414
function Stub_AcceptEx(sListenSocket:PtrUInt; sAcceptSocket:PtrUInt; lpOutputBuffer:Pointer; dwReceiveDataLength:DWORD; dwLocalAddressLength:DWORD; dwRemoteAddressLength:DWORD; var lpdwBytesReceived:DWORD; lpOverlapped:POverlapped):BOOL; stdcall;
begin
{*
 005A2414    push        ebp
 005A2415    mov         ebp,esp
 005A2417    push        ebx
 005A2418    mov         ebx,dword ptr [ebp+8]
 005A241B    mov         ecx,789C28
 005A2420    mov         edx,5A247C;'GetAcceptExSockaddrs'
 005A2425    mov         eax,ebx
 005A2427    call        FixupStubEx
 005A242C    mov         [00789E44],eax
 005A2431    mov         ecx,789BF8
 005A2436    mov         edx,5A24B4;'AcceptEx'
 005A243B    mov         eax,ebx
 005A243D    call        FixupStubEx
 005A2442    mov         [00789E40],eax
 005A2447    mov         eax,dword ptr [ebp+24]
 005A244A    push        eax
 005A244B    mov         eax,dword ptr [ebp+20]
 005A244E    push        eax
 005A244F    mov         eax,dword ptr [ebp+1C]
 005A2452    push        eax
 005A2453    mov         eax,dword ptr [ebp+18]
 005A2456    push        eax
 005A2457    mov         eax,dword ptr [ebp+14]
 005A245A    push        eax
 005A245B    mov         eax,dword ptr [ebp+10]
 005A245E    push        eax
 005A245F    mov         eax,dword ptr [ebp+0C]
 005A2462    push        eax
 005A2463    push        ebx
 005A2464    call        dword ptr ds:[789E40]
 005A246A    pop         ebx
 005A246B    pop         ebp
 005A246C    ret         20
*}
end;

//005A24C8
function Stub_WSARecvEx(s:PtrUInt; var buf:void ; len:Integer; var flags:Integer):Integer; stdcall;
begin
{*
 005A24C8    push        ebp
 005A24C9    mov         ebp,esp
 005A24CB    xor         ecx,ecx
 005A24CD    push        ecx
 005A24CE    push        ecx
 005A24CF    push        ecx
 005A24D0    push        ecx
 005A24D1    push        ecx
 005A24D2    push        ebx
 005A24D3    xor         eax,eax
 005A24D5    push        ebp
 005A24D6    push        5A2613
 005A24DB    push        dword ptr fs:[eax]
 005A24DE    mov         dword ptr fs:[eax],esp
 005A24E1    cmp         dword ptr ds:[789E6C],0
>005A24E8    jne         005A2542
 005A24EA    mov         edx,8000
 005A24EF    mov         eax,5A2630;'MSWSOCK.DLL'
 005A24F4    call        SafeLoadLibrary
 005A24F9    mov         [00789E6C],eax
 005A24FE    cmp         dword ptr ds:[789E6C],0
>005A2505    jne         005A2542
 005A2507    lea         edx,[ebp-4]
 005A250A    mov         eax,[0078D538];^SResString603:TResStringRec
 005A250F    call        LoadResString
 005A2514    mov         eax,dword ptr [ebp-4]
 005A2517    push        eax
 005A2518    mov         eax,5A2630;'MSWSOCK.DLL'
 005A251D    mov         dword ptr [ebp-0C],eax
 005A2520    mov         byte ptr [ebp-8],11
 005A2524    lea         eax,[ebp-0C]
 005A2527    push        eax
 005A2528    push        0
 005A252A    call        kernel32.GetLastError
 005A252F    mov         ecx,eax
 005A2531    mov         dl,1
 005A2533    mov         eax,[0059A068];EIdWinsockStubError
 005A2538    call        EIdWinsockStubError.Build
 005A253D    call        @RaiseExcept
 005A2542    mov         ebx,dword ptr ds:[789E6C]
 005A2548    test        ebx,ebx
>005A254A    jne         005A2585
 005A254C    lea         edx,[ebp-10]
 005A254F    mov         eax,[0078D780];^SResString602:TResStringRec
 005A2554    call        LoadResString
 005A2559    mov         eax,dword ptr [ebp-10]
 005A255C    push        eax
 005A255D    mov         eax,5A2654;'WSARecvEx'
 005A2562    mov         dword ptr [ebp-0C],eax
 005A2565    mov         byte ptr [ebp-8],11
 005A2569    lea         eax,[ebp-0C]
 005A256C    push        eax
 005A256D    push        0
 005A256F    mov         ecx,276D
 005A2574    mov         dl,1
 005A2576    mov         eax,[0059A068];EIdWinsockStubError
 005A257B    call        EIdWinsockStubError.Build
 005A2580    call        @RaiseExcept
 005A2585    mov         eax,5A2654;'WSARecvEx'
 005A258A    call        @UStrToPWChar
 005A258F    push        eax
 005A2590    push        ebx
 005A2591    call        GetProcAddress
 005A2596    test        eax,eax
>005A2598    jne         005A25D3
 005A259A    lea         edx,[ebp-14]
 005A259D    mov         eax,[0078D780];^SResString602:TResStringRec
 005A25A2    call        LoadResString
 005A25A7    mov         eax,dword ptr [ebp-14]
 005A25AA    push        eax
 005A25AB    mov         eax,5A2654;'WSARecvEx'
 005A25B0    mov         dword ptr [ebp-0C],eax
 005A25B3    mov         byte ptr [ebp-8],11
 005A25B7    lea         eax,[ebp-0C]
 005A25BA    push        eax
 005A25BB    push        0
 005A25BD    mov         ecx,2726
 005A25C2    mov         dl,1
 005A25C4    mov         eax,[0059A068];EIdWinsockStubError
 005A25C9    call        EIdWinsockStubError.Build
 005A25CE    call        @RaiseExcept
 005A25D3    mov         [00789E48],eax
 005A25D8    mov         eax,dword ptr [ebp+14]
 005A25DB    push        eax
 005A25DC    mov         eax,dword ptr [ebp+10]
 005A25DF    push        eax
 005A25E0    mov         eax,dword ptr [ebp+0C]
 005A25E3    push        eax
 005A25E4    mov         eax,dword ptr [ebp+8]
 005A25E7    push        eax
 005A25E8    call        dword ptr ds:[789E48]
 005A25EE    mov         ebx,eax
 005A25F0    xor         eax,eax
 005A25F2    pop         edx
 005A25F3    pop         ecx
 005A25F4    pop         ecx
 005A25F5    mov         dword ptr fs:[eax],edx
 005A25F8    push        5A261A
 005A25FD    lea         eax,[ebp-14]
 005A2600    mov         edx,2
 005A2605    call        @UStrArrayClr
 005A260A    lea         eax,[ebp-4]
 005A260D    call        @UStrClr
 005A2612    ret
>005A2613    jmp         @HandleFinally
>005A2618    jmp         005A25FD
 005A261A    mov         eax,ebx
 005A261C    pop         ebx
 005A261D    mov         esp,ebp
 005A261F    pop         ebp
 005A2620    ret         10
*}
end;

//005A2668
function Stub_ConnectEx(const s:PtrUInt; const name:PSOCKADDR; const namelen:Integer; lpSendBuffer:Pointer; dwSendDataLength:DWORD; var lpdwBytesSent:DWORD; lpOverlapped:PWSAOverlapped):BOOL; stdcall;
begin
{*
 005A2668    push        ebp
 005A2669    mov         ebp,esp
 005A266B    push        ebx
 005A266C    mov         ebx,dword ptr [ebp+8]
 005A266F    mov         ecx,789C08
 005A2674    mov         edx,5A26B8;'ConnectEx'
 005A2679    mov         eax,ebx
 005A267B    call        FixupStubEx
 005A2680    mov         [00789E4C],eax
 005A2685    mov         eax,dword ptr [ebp+20]
 005A2688    push        eax
 005A2689    mov         eax,dword ptr [ebp+1C]
 005A268C    push        eax
 005A268D    mov         eax,dword ptr [ebp+18]
 005A2690    push        eax
 005A2691    mov         eax,dword ptr [ebp+14]
 005A2694    push        eax
 005A2695    mov         eax,dword ptr [ebp+10]
 005A2698    push        eax
 005A2699    mov         eax,dword ptr [ebp+0C]
 005A269C    push        eax
 005A269D    push        ebx
 005A269E    call        dword ptr ds:[789E4C]
 005A26A4    pop         ebx
 005A26A5    pop         ebp
 005A26A6    ret         1C
*}
end;

//005A26CC
function Stub_DisconnectEx(const s:PtrUInt; AOverlapped:Pointer; const dwFlags:DWORD; const dwReserved:DWORD):BOOL; stdcall;
begin
{*
 005A26CC    push        ebp
 005A26CD    mov         ebp,esp
 005A26CF    push        ebx
 005A26D0    mov         ebx,dword ptr [ebp+8]
 005A26D3    mov         ecx,789C18
 005A26D8    mov         edx,5A2710;^338:Single
 005A26DD    mov         eax,ebx
 005A26DF    call        FixupStubEx
 005A26E4    mov         [00789E50],eax
 005A26E9    mov         eax,dword ptr [ebp+14]
 005A26EC    push        eax
 005A26ED    mov         eax,dword ptr [ebp+10]
 005A26F0    push        eax
 005A26F1    mov         eax,dword ptr [ebp+0C]
 005A26F4    push        eax
 005A26F5    push        ebx
 005A26F6    call        dword ptr ds:[789E50]
 005A26FC    pop         ebx
 005A26FD    pop         ebp
 005A26FE    ret         10
*}
end;

//005A272C
function Stub_WSARecvMsg(const s:PtrUInt; lpMsg:PWSAMSG; var lpNumberOfBytesRecvd:DWORD; AOverlapped:Pointer; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 005A272C    push        ebp
 005A272D    mov         ebp,esp
 005A272F    push        ebx
 005A2730    mov         ebx,dword ptr [ebp+8]
 005A2733    mov         ecx,789C68
 005A2738    mov         edx,5A2774;'WSARecvMsg'
 005A273D    mov         eax,ebx
 005A273F    call        FixupStubEx
 005A2744    mov         [00789E54],eax
 005A2749    mov         eax,dword ptr [ebp+18]
 005A274C    push        eax
 005A274D    mov         eax,dword ptr [ebp+14]
 005A2750    push        eax
 005A2751    mov         eax,dword ptr [ebp+10]
 005A2754    push        eax
 005A2755    mov         eax,dword ptr [ebp+0C]
 005A2758    push        eax
 005A2759    push        ebx
 005A275A    call        dword ptr ds:[789E54]
 005A2760    pop         ebx
 005A2761    pop         ebp
 005A2762    ret         14
*}
end;

//005A278C
function Stub_TransmitPackets(s:PtrUInt; lpPacketArray:PTRANSMIT_PACKETS_ELEMENT; nElementCount:DWORD; nSendSize:DWORD; lpOverlapped:PWSAOverlapped; dwFlags:DWORD):BOOL; stdcall;
begin
{*
 005A278C    push        ebp
 005A278D    mov         ebp,esp
 005A278F    push        ebx
 005A2790    mov         ebx,dword ptr [ebp+8]
 005A2793    mov         ecx,789C48
 005A2798    mov         edx,5A27D8;'TransmitPackets'
 005A279D    mov         eax,ebx
 005A279F    call        FixupStubEx
 005A27A4    mov         [00789E58],eax
 005A27A9    mov         eax,dword ptr [ebp+1C]
 005A27AC    push        eax
 005A27AD    mov         eax,dword ptr [ebp+18]
 005A27B0    push        eax
 005A27B1    mov         eax,dword ptr [ebp+14]
 005A27B4    push        eax
 005A27B5    mov         eax,dword ptr [ebp+10]
 005A27B8    push        eax
 005A27B9    mov         eax,dword ptr [ebp+0C]
 005A27BC    push        eax
 005A27BD    push        ebx
 005A27BE    call        dword ptr ds:[789E58]
 005A27C4    pop         ebx
 005A27C5    pop         ebp
 005A27C6    ret         18
*}
end;

//005A27F8
function Stub_WSASendMsg(const s:PtrUInt; lpMsg:PWSAMSG; const dwFlags:DWORD; var lpNumberOfBytesSent:DWORD; lpOverlapped:PWSAOverlapped; lpCompletionRoutine:LPWSAOVERLAPPED_COMPLETION_ROUTINE):Integer; stdcall;
begin
{*
 005A27F8    push        ebp
 005A27F9    mov         ebp,esp
 005A27FB    push        ebx
 005A27FC    mov         ebx,dword ptr [ebp+8]
 005A27FF    mov         ecx,789C78
 005A2804    mov         edx,5A2844;'WSASendMsg'
 005A2809    mov         eax,ebx
 005A280B    call        FixupStubEx
 005A2810    mov         [00789E5C],eax
 005A2815    mov         eax,dword ptr [ebp+1C]
 005A2818    push        eax
 005A2819    mov         eax,dword ptr [ebp+18]
 005A281C    push        eax
 005A281D    mov         eax,dword ptr [ebp+14]
 005A2820    push        eax
 005A2821    mov         eax,dword ptr [ebp+10]
 005A2824    push        eax
 005A2825    mov         eax,dword ptr [ebp+0C]
 005A2828    push        eax
 005A2829    push        ebx
 005A282A    call        dword ptr ds:[789E5C]
 005A2830    pop         ebx
 005A2831    pop         ebp
 005A2832    ret         18
*}
end;

//005A285C
function Stub_WSAPoll(fdarray:PWSAPOLLFD; const nfds:DWORD; const timeout:Integer):Integer; stdcall;
begin
{*
 005A285C    push        ebp
 005A285D    mov         ebp,esp
 005A285F    push        ebx
 005A2860    mov         ebx,dword ptr [ebp+8]
 005A2863    mov         ecx,789C58
 005A2868    mov         edx,5A289C;'WSAPoll'
 005A286D    mov         eax,dword ptr [ebx]
 005A286F    call        FixupStubEx
 005A2874    mov         [00789E60],eax
 005A2879    mov         eax,dword ptr [ebp+10]
 005A287C    push        eax
 005A287D    mov         eax,dword ptr [ebp+0C]
 005A2880    push        eax
 005A2881    push        ebx
 005A2882    call        dword ptr ds:[789E60]
 005A2888    pop         ebx
 005A2889    pop         ebp
 005A288A    ret         0C
*}
end;

//005A28AC
procedure InitializeStubs;
begin
{*
 005A28AC    mov         dword ptr ds:[789C90],59A790
 005A28B6    mov         dword ptr ds:[789C94],59A8A4
 005A28C0    mov         dword ptr ds:[789C98],59A9B4
 005A28CA    mov         dword ptr ds:[789C9C],59AAC8
 005A28D4    mov         dword ptr ds:[789CA0],59ABDC
 005A28DE    mov         dword ptr ds:[789CA4],59ACF8
 005A28E8    mov         dword ptr ds:[789CA8],59AE14
 005A28F2    mov         dword ptr ds:[789CAC],59AF30
 005A28FC    mov         dword ptr ds:[789CB0],59B054
 005A2906    mov         dword ptr ds:[789CB4],59B15C
 005A2910    mov         dword ptr ds:[789CB8],59B264
 005A291A    mov         dword ptr ds:[789CBC],59B374
 005A2924    mov         dword ptr ds:[789CC0],59B480
 005A292E    mov         dword ptr ds:[789CC4],59B590
 005A2938    mov         dword ptr ds:[789CC8],59B698
 005A2942    mov         dword ptr ds:[789CCC],59B7A0
 005A294C    mov         dword ptr ds:[789CD0],59B8B4
 005A2956    mov         dword ptr ds:[789CD4],59B9D8
 005A2960    mov         dword ptr ds:[789CD8],59BAF4
 005A296A    mov         dword ptr ds:[789CDC],59BC08
 005A2974    mov         dword ptr ds:[789CE0],59BD28
 005A297E    mov         dword ptr ds:[789CE4],59BE4C
 005A2988    mov         dword ptr ds:[789CE8],59BF60
 005A2992    mov         dword ptr ds:[789CEC],59C074
 005A299C    mov         dword ptr ds:[789CF0],59C194
 005A29A6    mov         dword ptr ds:[789CF4],59C2AC
 005A29B0    mov         dword ptr ds:[789CF8],59C3C4
 005A29BA    mov         dword ptr ds:[789CFC],59C4E0
 005A29C4    mov         dword ptr ds:[789D00],59C5FC
 005A29CE    mov         dword ptr ds:[789D04],59C71C
 005A29D8    mov         dword ptr ds:[789D40],59D894
 005A29E2    mov         dword ptr ds:[789E40],5A2414
 005A29EC    mov         dword ptr ds:[789E4C],5A2668
 005A29F6    mov         dword ptr ds:[789E50],5A26CC
 005A2A00    mov         dword ptr ds:[789E3C],5A23A8
 005A2A0A    mov         dword ptr ds:[789E58],5A278C
 005A2A14    mov         dword ptr ds:[789D44],59D9B0
 005A2A1E    mov         dword ptr ds:[789D38],59D644
 005A2A28    mov         dword ptr ds:[789D34],59D504
 005A2A32    mov         dword ptr ds:[789D30],59D3CC
 005A2A3C    mov         dword ptr ds:[789D28],59D150
 005A2A46    mov         dword ptr ds:[789D2C],59D28C
 005A2A50    mov         dword ptr ds:[789D20],59CED8
 005A2A5A    mov         dword ptr ds:[789D24],59D014
 005A2A64    mov         dword ptr ds:[789D3C],59D76C
 005A2A6E    mov         dword ptr ds:[789D48],59FE70
 005A2A78    mov         dword ptr ds:[789D4C],59FFA4
 005A2A82    mov         dword ptr ds:[789D50],5A00D8
 005A2A8C    mov         dword ptr ds:[789D1C],59CDB8
 005A2A96    mov         dword ptr ds:[789C8C],59A684
 005A2AA0    mov         dword ptr ds:[789D54],59DAD0
 005A2AAA    mov         dword ptr ds:[789D58],59DBE8
 005A2AB4    mov         dword ptr ds:[789D5C],59DD14
 005A2ABE    mov         dword ptr ds:[789D60],59DE28
 005A2AC8    mov         dword ptr ds:[789D64],59DF54
 005A2AD2    mov         dword ptr ds:[789D68],59E080
 005A2ADC    mov         dword ptr ds:[789D7C],5A1788
 005A2AE6    mov         dword ptr ds:[789D80],5A18C0
 005A2AF0    mov         dword ptr ds:[789D84],5A19F8
 005A2AFA    mov         dword ptr ds:[789D6C],59E1AC
 005A2B04    mov         dword ptr ds:[789D70],59E2DC
 005A2B0E    mov         dword ptr ds:[789D74],59E404
 005A2B18    mov         dword ptr ds:[789D78],59E52C
 005A2B22    mov         dword ptr ds:[789D88],59E654
 005A2B2C    mov         dword ptr ds:[789D0C],59C950
 005A2B36    mov         dword ptr ds:[789D8C],59E778
 005A2B40    mov         dword ptr ds:[789D90],59E8B4
 005A2B4A    mov         dword ptr ds:[789D94],5A13E0
 005A2B54    mov         dword ptr ds:[789D98],5A1518
 005A2B5E    mov         dword ptr ds:[789D9C],5A1650
 005A2B68    mov         dword ptr ds:[789DA0],5A1B30
 005A2B72    mov         dword ptr ds:[789DA4],5A1C78
 005A2B7C    mov         dword ptr ds:[789DA8],5A1DC0
 005A2B86    mov         dword ptr ds:[789DAC],59E9D8
 005A2B90    mov         dword ptr ds:[789DB0],59EAF0
 005A2B9A    mov         dword ptr ds:[789DB8],5A0F34
 005A2BA4    mov         dword ptr ds:[789DBC],5A1060
 005A2BAE    mov         dword ptr ds:[789DC0],5A118C
 005A2BB8    mov         dword ptr ds:[789DB4],59EC08
 005A2BC2    mov         dword ptr ds:[789D10],59CA64
 005A2BCC    mov         dword ptr ds:[789DC4],59ED38
 005A2BD6    mov         dword ptr ds:[789DC8],5A05A8
 005A2BE0    mov         dword ptr ds:[789DCC],5A06DC
 005A2BEA    mov         dword ptr ds:[789DD0],5A0810
 005A2BF4    mov         dword ptr ds:[789DD4],5A0CE0
 005A2BFE    mov         dword ptr ds:[789DD8],5A0944
 005A2C08    mov         dword ptr ds:[789DDC],5A0A78
 005A2C12    mov         dword ptr ds:[789DE0],5A0BAC
 005A2C1C    mov         dword ptr ds:[789E64],5A0E04
 005A2C26    mov         dword ptr ds:[789DE4],59EE68
 005A2C30    mov         dword ptr ds:[789DE8],59EF80
 005A2C3A    mov         dword ptr ds:[789E60],5A285C
 005A2C44    mov         dword ptr ds:[789E38],5A2274
 005A2C4E    mov         dword ptr ds:[789DEC],59F098
 005A2C58    mov         dword ptr ds:[789DF0],59F1BC
 005A2C62    mov         dword ptr ds:[789E48],5A24C8
 005A2C6C    mov         dword ptr ds:[789DF4],59F2E0
 005A2C76    mov         dword ptr ds:[789E54],5A272C
 005A2C80    mov         dword ptr ds:[789DF8],5A12B8
 005A2C8A    mov         dword ptr ds:[789DFC],59F414
 005A2C94    mov         dword ptr ds:[789E00],59F52C
 005A2C9E    mov         dword ptr ds:[789E04],59F650
 005A2CA8    mov         dword ptr ds:[789E5C],5A27F8
 005A2CB2    mov         dword ptr ds:[789E08],59F774
 005A2CBC    mov         dword ptr ds:[789D18],59CC94
 005A2CC6    mov         dword ptr ds:[789E0C],59F8A4
 005A2CD0    mov         dword ptr ds:[789D08],59C838
 005A2CDA    mov         dword ptr ds:[789E10],5A1F08
 005A2CE4    mov         dword ptr ds:[789E14],5A202C
 005A2CEE    mov         dword ptr ds:[789E18],5A2150
 005A2CF8    mov         dword ptr ds:[789E1C],59F9B8
 005A2D02    mov         dword ptr ds:[789E20],59FAE0
 005A2D0C    mov         dword ptr ds:[789E24],59FC08
 005A2D16    mov         dword ptr ds:[789C88],59A56C
 005A2D20    mov         dword ptr ds:[789E28],5A020C
 005A2D2A    mov         dword ptr ds:[789E2C],5A0340
 005A2D34    mov         dword ptr ds:[789E30],5A0474
 005A2D3E    mov         dword ptr ds:[789D14],59CB74
 005A2D48    mov         dword ptr ds:[789E34],59FD30
 005A2D52    ret
*}
end;

//005A2D54
function FD_ISSET(ASocket:PtrUInt; var FDSet:TFDSet):Boolean;
begin
{*
 005A2D54    push        ebx
 005A2D55    push        esi
 005A2D56    mov         esi,edx
 005A2D58    mov         ebx,eax
 005A2D5A    push        esi
 005A2D5B    push        ebx
 005A2D5C    call        dword ptr ds:[789D40]
 005A2D62    cmp         eax,1
 005A2D65    sbb         eax,eax
 005A2D67    inc         eax
 005A2D68    pop         esi
 005A2D69    pop         ebx
 005A2D6A    ret
*}
end;

//005A2D6C
procedure FD_ZERO(var FDSet:TFDSet);
begin
{*
 005A2D6C    xor         edx,edx
 005A2D6E    mov         dword ptr [eax],edx
 005A2D70    ret
*}
end;

//005A2D74
function WSA_CMSGHDR_ALIGN(const Alength:PtrUInt):PtrUInt;
begin
{*
 005A2D74    xor         edx,edx
 005A2D76    inc         edx
 005A2D77    mov         ecx,edx
 005A2D79    dec         ecx
 005A2D7A    add         eax,ecx
 005A2D7C    not         ecx
 005A2D7E    and         eax,ecx
 005A2D80    ret
*}
end;

//005A2D84
function WSA_CMSG_NXTHDR(const msg:PWSAMSG; const cmsg:PWSACMSGHDR):PWSACMSGHDR;
begin
{*
 005A2D84    push        ebx
 005A2D85    push        esi
 005A2D86    mov         ebx,edx
 005A2D88    mov         esi,eax
 005A2D8A    test        ebx,ebx
>005A2D8C    jne         005A2DA2
 005A2D8E    test        esi,esi
>005A2D90    je          005A2D9D
 005A2D92    cmp         dword ptr [esi+10],0C
>005A2D96    jb          005A2D9D
 005A2D98    mov         eax,dword ptr [esi+14]
>005A2D9B    jmp         005A2DC5
 005A2D9D    xor         eax,eax
 005A2D9F    pop         esi
 005A2DA0    pop         ebx
 005A2DA1    ret
 005A2DA2    mov         eax,dword ptr [ebx]
 005A2DA4    call        WSA_CMSGHDR_ALIGN
 005A2DA9    add         eax,ebx
 005A2DAB    add         eax,0C
 005A2DAE    mov         edx,dword ptr [esi+14]
 005A2DB1    add         edx,dword ptr [esi+10]
 005A2DB4    cmp         eax,edx
>005A2DB6    jbe         005A2DBC
 005A2DB8    xor         eax,eax
>005A2DBA    jmp         005A2DC5
 005A2DBC    mov         eax,dword ptr [ebx]
 005A2DBE    call        WSA_CMSGHDR_ALIGN
 005A2DC3    add         eax,ebx
 005A2DC5    pop         esi
 005A2DC6    pop         ebx
 005A2DC7    ret
*}
end;

//005A2DC8
function WSA_CMSG_DATA(const cmsg:PWSACMSGHDR):PByte;
begin
{*
 005A2DC8    add         eax,0C
 005A2DCB    ret
*}
end;

//005A2DCC
function WSA_CMSG_LEN(const Alength:PtrUInt):PtrUInt;
begin
{*
 005A2DCC    add         eax,0C
 005A2DCF    ret
*}
end;

Initialization
//0078153C
{*
 0078153C    push        ebp
 0078153D    mov         ebp,esp
 0078153F    add         esp,0FFFFFFE0
 00781542    push        esi
 00781543    push        edi
 00781544    sub         dword ptr ds:[8155B4],1
>0078154B    jae         0078158C
 0078154D    lea         eax,[ebp-10]
 00781550    xor         ecx,ecx
 00781552    mov         edx,10
 00781557    call        @FillChar
 0078155C    lea         esi,[ebp-10]
 0078155F    mov         edi,815594;in6addr_any:IN6_ADDR
 00781564    movs        dword ptr [edi],dword ptr [esi]
 00781565    movs        dword ptr [edi],dword ptr [esi]
 00781566    movs        dword ptr [edi],dword ptr [esi]
 00781567    movs        dword ptr [edi],dword ptr [esi]
 00781568    lea         eax,[ebp-20]
 0078156B    xor         ecx,ecx
 0078156D    mov         edx,10
 00781572    call        @FillChar
 00781577    mov         byte ptr [ebp-11],1
 0078157B    lea         esi,[ebp-20]
 0078157E    mov         edi,8155A4;in6addr_loopback:IN6_ADDR
 00781583    movs        dword ptr [edi],dword ptr [esi]
 00781584    movs        dword ptr [edi],dword ptr [esi]
 00781585    movs        dword ptr [edi],dword ptr [esi]
 00781586    movs        dword ptr [edi],dword ptr [esi]
 00781587    call        InitializeStubs
 0078158C    pop         edi
 0078158D    pop         esi
 0078158E    mov         esp,ebp
 00781590    pop         ebp
 00781591    ret
*}
Finalization
end.