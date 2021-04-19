//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit96;

interface

uses
  SysUtils, Classes, IdCustomTransparentProxy, IdIOHandlerSocket, IdIPAddress, IdIOHandlerStack, IdAntiFreezeBase, IdSocketHandle, IdUDPBase, IdBuffer, IdExceptionCore, IdIntercept, IdIOHandler;

type
  EIdTransparentProxyCircularLink = class(EIdException)
  end;
  EIdTransparentProxyUDPNotSupported = class(EIdException)
  end;
  TIdCustomTransparentProxy = class(TIdComponent)
  published
    procedure Bind(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word);//005B6BC0
    procedure Connect(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word);//005B6AE4
    function Listen(AIOHandler:TIdIOHandler; ATimeOut:Integer):Boolean;//005B6B68
    procedure Bind(AIOHandler:TIdIOHandler; APort:Word);//005B6C18
    procedure SendToUDP(AHandle:TIdSocketHandle; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);//005B6E38
    procedure OpenUDP(AHandle:TIdSocketHandle; AHost:string; AIPVersion:TIdIPVersion; APort:Word);//005B6D84
    procedure Assign(ASource:TPersistent);//005B6A6C
    procedure RecvFromUDP(AHandle:TIdSocketHandle; var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; AMSec:Integer);//005B6DDC
    procedure CloseUDP(AHandle:TIdSocketHandle);//005B6D30
  public
    FHost:string;//f90
    FPassword:string;//f94
    FPort:Word;//f98
    FIPVersion:TIdIPVersion;//f9A
    FUsername:string;//f9C
    FChainedProxy:TIdCustomTransparentProxy;//fA0
    procedure Assign(ASource:TPersistent); virtual;//v8//005B6A6C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//005B6C50
    procedure GetEnabled; virtual; abstract;//v44//00404A58
    procedure v48; virtual;//v48//005B6C4C
    procedure MakeConnection; virtual; abstract;//v4C//00404A58
    procedure OpenUDP(AHandle:TIdSocketHandle; AHost:string; AIPVersion:TIdIPVersion; APort:Word); virtual;//v50//005B6D84
    procedure CloseUDP(AHandle:TIdSocketHandle); virtual;//v54//005B6D30
    procedure RecvFromUDP(AHandle:TIdSocketHandle; var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; AMSec:Integer); virtual;//v58//005B6DDC
    procedure SendToUDP(AHandle:TIdSocketHandle; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes); virtual;//v5C//005B6E38
    procedure Bind(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word); virtual;//v60//005B6BC0
    function Listen(AIOHandler:TIdIOHandler; ATimeOut:Integer):Boolean; virtual;//v64//005B6B68
    procedure SetChainedProxy(const AValue:TIdCustomTransparentProxy);//005B6C70
  end;
  TIdIOHandlerSocket = class(TIdIOHandler)
  published
    function Connected:Boolean;//005B75F4
    procedure Open;//005B7770
    function WriteFile(AFile:string; AEnableTransferFile:Boolean):Int64;//005B78B4
    destructor Destroy();//005B7620
    function BindingAllocated:Boolean;//005B789C
    procedure Close;//005B7514
  public
    FBinding:TIdSocketHandle;//fD8
    FBoundIP:string;//fDC
    FBoundPort:Word;//fE0
    FBoundPortMax:Word;//fE2
    FBoundPortMin:Word;//fE4
    FDefaultPort:Word;//fE6
    FOnBeforeBind:TNotifyEvent;//fE8
    FOnAfterBind:TNotifyEvent;//fF0
    FOnSocketAllocated:TNotifyEvent;//fF8
    FTransparentProxy:TIdCustomTransparentProxy;//f100
    FUseNagle:Boolean;//f104
    FReuseSocket:TIdReuseSocket;//f105
    FIPVersion:TIdIPVersion;//f106
    destructor Destroy(); virtual;//005B7620
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//005B7AC8
    procedure InitComponent; virtual;//v34//005B7AE8
    function GetDestination:UnicodeString; virtual;//v44//005B76DC
    procedure SetDestination(const AValue:UnicodeString); virtual;//v4C//005B77DC
    procedure v64; virtual;//v64//005B7B04
    function CheckForError(ALastResult:Integer):Integer; virtual;//v68//005B7B0C
    procedure RaiseError(AError:Integer); virtual;//v6C//005B7B34
    function Connected:Boolean; virtual;//v74//005B75F4
    procedure Close; virtual;//v80//005B7514
    procedure Open; virtual;//v8C//005B7770
    function WriteFile(AFile:string; AEnableTransferFile:Boolean):Int64; virtual;//vA8//005B78B4
    procedure ConnectClient; virtual;//vD8//005B7530
    procedure DoBeforeBind; virtual;//vDC//005B767C
    procedure DoAfterBind; virtual;//vE0//005B769C
    procedure DoSocketAllocated; virtual;//vE4//005B76BC
    function GetTransparentProxy:TIdCustomTransparentProxy; virtual;//vE8//005B7A70
    procedure SetTransparentProxy(AProxy:TIdCustomTransparentProxy); virtual;//vEC//005B7970
    function GetUseNagle:Boolean;//005B7A98
    procedure SetUseNagle(AValue:Boolean);//005B7AB0
  end;
  TIdIPAddress = class(TObject)
  published
    function CompareAddress(AIP:string; var VErr:Boolean):Integer;//005B7E30
    procedure HToNBytes;//005B7F54
    function MakeAddressObject(AIP:string; AIPVersion:TIdIPVersion):TIdIPAddress;//005B8284
    constructor Create();//005B7F14
    function MakeAddressObject(AIP:string):TIdIPAddress;//005B81D0
  public
    FIPv4:Cardinal;//f4
    FAddrType:TIdIPVersion;//f8
    IPv6:TIdIPv6Address;//fA
    constructor Create(); virtual;//v0//005B7F14
    function GetIPAddress:UnicodeString;//005B8004
    function GetIPv4AsString:UnicodeString;//005B8028
    function GetIPv6AsString:UnicodeString;//005B8130
  end;
  TIdIOHandlerStack = class(TIdIOHandlerSocket)
  published
    function Readable(AMSec:Integer):Boolean;//005B8B74
    function Connected:Boolean;//005B8774
    procedure CheckForDisconnect(ARaiseExceptionIfDisconnected:Boolean; AIgnoreBuffer:Boolean);//005B8D50
  public
    function ReadDataFromSource(var VBuffer:TIdBytes):Integer; virtual;//v5C//005B8C70
    function WriteDataToTarget(const ABuffer:TIdBytes; const AOffset:Integer; const ALength:Integer):Integer; virtual;//v60//005B8B80
    function Connected:Boolean; virtual;//v74//005B8774
    procedure CheckForDisconnect(ARaiseExceptionIfDisconnected:Boolean; AIgnoreBuffer:Boolean); virtual;//v78//005B8D50
    function Readable(AMSec:Integer):Boolean; virtual;//v90//005B8B74
    procedure ConnectClient; virtual;//vD8//005B8928
  end;
  TIdConnectThread = class(TThread)
  published
    constructor Create;//005B8DB0
  public
    FBinding:TIdSocketHandle;//f40
    FLastSocketError:Integer;//f44
    FExceptionMessage:string;//f48
    procedure DoTerminate; virtual;//v0//005B8EA8
    procedure Execute; virtual;//v4//005B8DEC
  end;
    procedure sub_005B6C4C;//005B6C4C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//005B6C50
    procedure ConnectClient;//005B7530
    procedure DoBeforeBind;//005B767C
    procedure DoAfterBind;//005B769C
    procedure DoSocketAllocated;//005B76BC
    function GetDestination:UnicodeString;//005B76DC
    procedure SetDestination(const AValue:UnicodeString);//005B77DC
    procedure SetTransparentProxy(AProxy:TIdCustomTransparentProxy);//005B7970
    function GetTransparentProxy:TIdCustomTransparentProxy;//005B7A70
    procedure Notification(AComponent:TComponent; Operation:TOperation);//005B7AC8
    procedure InitComponent;//005B7AE8
    procedure sub_005B7B04;//005B7B04
    function CheckForError(ALastResult:Integer):Integer;//005B7B0C
    procedure RaiseError(AError:Integer);//005B7B34
    procedure DoConnectTimeout(ATimeout:Integer);//005B8790
    procedure ConnectClient;//005B8928
    function WriteDataToTarget(const ABuffer:TIdBytes; const AOffset:Integer; const ALength:Integer):Integer;//005B8B80
    function ReadDataFromSource(var VBuffer:TIdBytes):Integer;//005B8C70
    procedure Execute;//005B8DEC
    procedure DoTerminate;//005B8EA8

implementation

//005B6A6C
procedure TIdCustomTransparentProxy.Assign(ASource:TPersistent);
begin
{*
 005B6A6C    push        ebx
 005B6A6D    push        esi
 005B6A6E    push        edi
 005B6A6F    mov         esi,edx
 005B6A71    mov         ebx,eax
 005B6A73    mov         eax,esi
 005B6A75    mov         edx,dword ptr ds:[5B64CC];TIdCustomTransparentProxy
 005B6A7B    call        @IsClass
 005B6A80    test        al,al
>005B6A82    je          005B6AD6
 005B6A84    lea         eax,[ebx+90]
 005B6A8A    mov         edi,esi
 005B6A8C    mov         edx,dword ptr [edi+90]
 005B6A92    call        @UStrAsg
 005B6A97    lea         eax,[ebx+94]
 005B6A9D    mov         edx,dword ptr [edi+94]
 005B6AA3    call        @UStrAsg
 005B6AA8    movzx       eax,word ptr [edi+98]
 005B6AAF    mov         word ptr [ebx+98],ax
 005B6AB6    movzx       eax,byte ptr [edi+9A]
 005B6ABD    mov         byte ptr [ebx+9A],al
 005B6AC3    lea         eax,[ebx+9C]
 005B6AC9    mov         edx,dword ptr [edi+9C]
 005B6ACF    call        @UStrAsg
>005B6AD4    jmp         005B6ADF
 005B6AD6    mov         edx,esi
 005B6AD8    mov         eax,ebx
 005B6ADA    call        TPersistent.Assign
 005B6ADF    pop         edi
 005B6AE0    pop         esi
 005B6AE1    pop         ebx
 005B6AE2    ret
*}
end;

//005B6AE4
procedure TIdCustomTransparentProxy.Connect(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
 005B6AE4    push        ebp
 005B6AE5    mov         ebp,esp
 005B6AE7    add         esp,0FFFFFFF8
 005B6AEA    push        ebx
 005B6AEB    push        esi
 005B6AEC    mov         dword ptr [ebp-8],ecx
 005B6AEF    mov         dword ptr [ebp-4],edx
 005B6AF2    mov         ebx,eax
 005B6AF4    mov         esi,dword ptr [ebx+0A0]
 005B6AFA    test        esi,esi
>005B6AFC    je          005B6B46
 005B6AFE    mov         eax,esi
 005B6B00    mov         edx,dword ptr [eax]
 005B6B02    call        dword ptr [edx+44]
 005B6B05    test        al,al
>005B6B07    je          005B6B46
 005B6B09    mov         eax,dword ptr [ebx+0A0]
 005B6B0F    movzx       edx,word ptr [eax+98]
 005B6B16    push        edx
 005B6B17    push        0
 005B6B19    mov         ecx,dword ptr [eax+90]
 005B6B1F    mov         edx,dword ptr [ebp-4]
 005B6B22    mov         eax,ebx
 005B6B24    mov         esi,dword ptr [eax]
 005B6B26    call        dword ptr [esi+4C]
 005B6B29    movzx       eax,word ptr [ebp+0C]
 005B6B2D    push        eax
 005B6B2E    movzx       eax,byte ptr [ebp+8]
 005B6B32    push        eax
 005B6B33    mov         ecx,dword ptr [ebp-8]
 005B6B36    mov         edx,dword ptr [ebp-4]
 005B6B39    mov         eax,dword ptr [ebx+0A0]
 005B6B3F    call        TIdCustomTransparentProxy.Connect
>005B6B44    jmp         005B6B5D
 005B6B46    movzx       eax,word ptr [ebp+0C]
 005B6B4A    push        eax
 005B6B4B    movzx       eax,byte ptr [ebp+8]
 005B6B4F    push        eax
 005B6B50    mov         ecx,dword ptr [ebp-8]
 005B6B53    mov         edx,dword ptr [ebp-4]
 005B6B56    mov         eax,ebx
 005B6B58    mov         ebx,dword ptr [eax]
 005B6B5A    call        dword ptr [ebx+4C]
 005B6B5D    pop         esi
 005B6B5E    pop         ebx
 005B6B5F    pop         ecx
 005B6B60    pop         ecx
 005B6B61    pop         ebp
 005B6B62    ret         8
*}
end;

//005B6B68
function TIdCustomTransparentProxy.Listen(AIOHandler:TIdIOHandler; ATimeOut:Integer):Boolean;
begin
{*
 005B6B68    push        ebp
 005B6B69    mov         ebp,esp
 005B6B6B    push        0
 005B6B6D    push        ebx
 005B6B6E    xor         eax,eax
 005B6B70    push        ebp
 005B6B71    push        5B6BB3
 005B6B76    push        dword ptr fs:[eax]
 005B6B79    mov         dword ptr fs:[eax],esp
 005B6B7C    lea         edx,[ebp-4]
 005B6B7F    mov         eax,[0078D1E4];^SResString698:TResStringRec
 005B6B84    call        LoadResString
 005B6B89    mov         ecx,dword ptr [ebp-4]
 005B6B8C    mov         dl,1
 005B6B8E    mov         eax,[005AFF48];EIdTransparentProxyCantBind
 005B6B93    call        EIdException.Create
 005B6B98    call        @RaiseExcept
 005B6B9D    xor         eax,eax
 005B6B9F    pop         edx
 005B6BA0    pop         ecx
 005B6BA1    pop         ecx
 005B6BA2    mov         dword ptr fs:[eax],edx
 005B6BA5    push        5B6BBA
 005B6BAA    lea         eax,[ebp-4]
 005B6BAD    call        @UStrClr
 005B6BB2    ret
>005B6BB3    jmp         @HandleFinally
>005B6BB8    jmp         005B6BAA
 005B6BBA    mov         eax,ebx
 005B6BBC    pop         ebx
 005B6BBD    pop         ecx
 005B6BBE    pop         ebp
 005B6BBF    ret
*}
end;

//005B6BC0
procedure TIdCustomTransparentProxy.Bind(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
 005B6BC0    push        ebp
 005B6BC1    mov         ebp,esp
 005B6BC3    push        0
 005B6BC5    push        ebx
 005B6BC6    xor         eax,eax
 005B6BC8    push        ebp
 005B6BC9    push        5B6C0B
 005B6BCE    push        dword ptr fs:[eax]
 005B6BD1    mov         dword ptr fs:[eax],esp
 005B6BD4    lea         edx,[ebp-4]
 005B6BD7    mov         eax,[0078D1E4];^SResString698:TResStringRec
 005B6BDC    call        LoadResString
 005B6BE1    mov         ecx,dword ptr [ebp-4]
 005B6BE4    mov         dl,1
 005B6BE6    mov         eax,[005AFF48];EIdTransparentProxyCantBind
 005B6BEB    call        EIdException.Create
 005B6BF0    call        @RaiseExcept
 005B6BF5    xor         eax,eax
 005B6BF7    pop         edx
 005B6BF8    pop         ecx
 005B6BF9    pop         ecx
 005B6BFA    mov         dword ptr fs:[eax],edx
 005B6BFD    push        5B6C12
 005B6C02    lea         eax,[ebp-4]
 005B6C05    call        @UStrClr
 005B6C0A    ret
>005B6C0B    jmp         @HandleFinally
>005B6C10    jmp         005B6C02
 005B6C12    pop         ebx
 005B6C13    pop         ecx
 005B6C14    pop         ebp
 005B6C15    ret         8
*}
end;

//005B6C18
procedure TIdCustomTransparentProxy.Bind(AIOHandler:TIdIOHandler; APort:Word);
begin
{*
 005B6C18    push        ebx
 005B6C19    push        esi
 005B6C1A    mov         esi,eax
 005B6C1C    push        ecx
 005B6C1D    push        0
 005B6C1F    mov         eax,esi
 005B6C21    mov         ecx,5B6C3C;'0.0.0.0'
 005B6C26    mov         ebx,dword ptr [eax]
 005B6C28    call        dword ptr [ebx+60]
 005B6C2B    pop         esi
 005B6C2C    pop         ebx
 005B6C2D    ret
*}
end;

//005B6C4C
procedure sub_005B6C4C;
begin
{*
 005B6C4C    ret
*}
end;

//005B6C50
procedure TIdCustomTransparentProxy.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 005B6C50    push        ebx
 005B6C51    cmp         cl,1
>005B6C54    jne         005B6C66
 005B6C56    cmp         edx,dword ptr [eax+0A0]
>005B6C5C    jne         005B6C66
 005B6C5E    xor         ebx,ebx
 005B6C60    mov         dword ptr [eax+0A0],ebx
 005B6C66    call        TComponent.Notification
 005B6C6B    pop         ebx
 005B6C6C    ret
*}
end;

//005B6C70
procedure TIdCustomTransparentProxy.SetChainedProxy(const AValue:TIdCustomTransparentProxy);
begin
{*
 005B6C70    push        ebp
 005B6C71    mov         ebp,esp
 005B6C73    add         esp,0FFFFFFEC
 005B6C76    push        ebx
 005B6C77    push        esi
 005B6C78    xor         ecx,ecx
 005B6C7A    mov         dword ptr [ebp-10],ecx
 005B6C7D    mov         dword ptr [ebp-14],ecx
 005B6C80    mov         dword ptr [ebp-4],edx
 005B6C83    mov         esi,eax
 005B6C85    xor         eax,eax
 005B6C87    push        ebp
 005B6C88    push        5B6D23
 005B6C8D    push        dword ptr fs:[eax]
 005B6C90    mov         dword ptr fs:[eax],esp
 005B6C93    mov         ebx,dword ptr [ebp-4]
 005B6C96    test        ebx,ebx
>005B6C98    je          005B6CE3
 005B6C9A    cmp         esi,ebx
>005B6C9C    jne         005B6CD9
 005B6C9E    lea         edx,[ebp-10]
 005B6CA1    mov         eax,dword ptr [esi]
 005B6CA3    call        TObject.ClassName
 005B6CA8    mov         eax,dword ptr [ebp-10]
 005B6CAB    mov         dword ptr [ebp-0C],eax
 005B6CAE    mov         byte ptr [ebp-8],11
 005B6CB2    lea         eax,[ebp-0C]
 005B6CB5    push        eax
 005B6CB6    push        0
 005B6CB8    lea         edx,[ebp-14]
 005B6CBB    mov         eax,[0078D744];^SResString681:TResStringRec
 005B6CC0    call        LoadResString
 005B6CC5    mov         ecx,dword ptr [ebp-14]
 005B6CC8    mov         dl,1
 005B6CCA    mov         eax,[005B631C];EIdTransparentProxyCircularLink
 005B6CCF    call        Exception.CreateFmt
 005B6CD4    call        @RaiseExcept
 005B6CD9    mov         ebx,dword ptr [ebx+0A0]
 005B6CDF    test        ebx,ebx
>005B6CE1    jne         005B6C9A
 005B6CE3    mov         eax,dword ptr [esi+0A0]
 005B6CE9    test        eax,eax
>005B6CEB    je          005B6CF4
 005B6CED    mov         edx,esi
 005B6CEF    call        TComponent.RemoveFreeNotification
 005B6CF4    mov         eax,dword ptr [ebp-4]
 005B6CF7    mov         dword ptr [esi+0A0],eax
 005B6CFD    test        eax,eax
>005B6CFF    je          005B6D08
 005B6D01    mov         edx,esi
 005B6D03    call        TComponent.FreeNotification
 005B6D08    xor         eax,eax
 005B6D0A    pop         edx
 005B6D0B    pop         ecx
 005B6D0C    pop         ecx
 005B6D0D    mov         dword ptr fs:[eax],edx
 005B6D10    push        5B6D2A
 005B6D15    lea         eax,[ebp-14]
 005B6D18    mov         edx,2
 005B6D1D    call        @UStrArrayClr
 005B6D22    ret
>005B6D23    jmp         @HandleFinally
>005B6D28    jmp         005B6D15
 005B6D2A    pop         esi
 005B6D2B    pop         ebx
 005B6D2C    mov         esp,ebp
 005B6D2E    pop         ebp
 005B6D2F    ret
*}
end;

//005B6D30
procedure TIdCustomTransparentProxy.CloseUDP(AHandle:TIdSocketHandle);
begin
{*
 005B6D30    push        ebp
 005B6D31    mov         ebp,esp
 005B6D33    push        0
 005B6D35    xor         eax,eax
 005B6D37    push        ebp
 005B6D38    push        5B6D7A
 005B6D3D    push        dword ptr fs:[eax]
 005B6D40    mov         dword ptr fs:[eax],esp
 005B6D43    lea         edx,[ebp-4]
 005B6D46    mov         eax,[0078CB8C];^SResString699:TResStringRec
 005B6D4B    call        LoadResString
 005B6D50    mov         ecx,dword ptr [ebp-4]
 005B6D53    mov         dl,1
 005B6D55    mov         eax,[005B63F0];EIdTransparentProxyUDPNotSupported
 005B6D5A    call        EIdException.Create
 005B6D5F    call        @RaiseExcept
 005B6D64    xor         eax,eax
 005B6D66    pop         edx
 005B6D67    pop         ecx
 005B6D68    pop         ecx
 005B6D69    mov         dword ptr fs:[eax],edx
 005B6D6C    push        5B6D81
 005B6D71    lea         eax,[ebp-4]
 005B6D74    call        @UStrClr
 005B6D79    ret
>005B6D7A    jmp         @HandleFinally
>005B6D7F    jmp         005B6D71
 005B6D81    pop         ecx
 005B6D82    pop         ebp
 005B6D83    ret
*}
end;

//005B6D84
procedure TIdCustomTransparentProxy.OpenUDP(AHandle:TIdSocketHandle; AHost:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
 005B6D84    push        ebp
 005B6D85    mov         ebp,esp
 005B6D87    push        0
 005B6D89    push        ebx
 005B6D8A    xor         eax,eax
 005B6D8C    push        ebp
 005B6D8D    push        5B6DCF
 005B6D92    push        dword ptr fs:[eax]
 005B6D95    mov         dword ptr fs:[eax],esp
 005B6D98    lea         edx,[ebp-4]
 005B6D9B    mov         eax,[0078CB8C];^SResString699:TResStringRec
 005B6DA0    call        LoadResString
 005B6DA5    mov         ecx,dword ptr [ebp-4]
 005B6DA8    mov         dl,1
 005B6DAA    mov         eax,[005B63F0];EIdTransparentProxyUDPNotSupported
 005B6DAF    call        EIdException.Create
 005B6DB4    call        @RaiseExcept
 005B6DB9    xor         eax,eax
 005B6DBB    pop         edx
 005B6DBC    pop         ecx
 005B6DBD    pop         ecx
 005B6DBE    mov         dword ptr fs:[eax],edx
 005B6DC1    push        5B6DD6
 005B6DC6    lea         eax,[ebp-4]
 005B6DC9    call        @UStrClr
 005B6DCE    ret
>005B6DCF    jmp         @HandleFinally
>005B6DD4    jmp         005B6DC6
 005B6DD6    pop         ebx
 005B6DD7    pop         ecx
 005B6DD8    pop         ebp
 005B6DD9    ret         8
*}
end;

//005B6DDC
procedure TIdCustomTransparentProxy.RecvFromUDP(AHandle:TIdSocketHandle; var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; AMSec:Integer);
begin
{*
 005B6DDC    push        ebp
 005B6DDD    mov         ebp,esp
 005B6DDF    push        0
 005B6DE1    push        ebx
 005B6DE2    xor         eax,eax
 005B6DE4    push        ebp
 005B6DE5    push        5B6E27
 005B6DEA    push        dword ptr fs:[eax]
 005B6DED    mov         dword ptr fs:[eax],esp
 005B6DF0    lea         edx,[ebp-4]
 005B6DF3    mov         eax,[0078CB8C];^SResString699:TResStringRec
 005B6DF8    call        LoadResString
 005B6DFD    mov         ecx,dword ptr [ebp-4]
 005B6E00    mov         dl,1
 005B6E02    mov         eax,[005B63F0];EIdTransparentProxyUDPNotSupported
 005B6E07    call        EIdException.Create
 005B6E0C    call        @RaiseExcept
 005B6E11    xor         eax,eax
 005B6E13    pop         edx
 005B6E14    pop         ecx
 005B6E15    pop         ecx
 005B6E16    mov         dword ptr fs:[eax],edx
 005B6E19    push        5B6E2E
 005B6E1E    lea         eax,[ebp-4]
 005B6E21    call        @UStrClr
 005B6E26    ret
>005B6E27    jmp         @HandleFinally
>005B6E2C    jmp         005B6E1E
 005B6E2E    mov         eax,ebx
 005B6E30    pop         ebx
 005B6E31    pop         ecx
 005B6E32    pop         ebp
 005B6E33    ret         10
*}
end;

//005B6E38
procedure TIdCustomTransparentProxy.SendToUDP(AHandle:TIdSocketHandle; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);
begin
{*
 005B6E38    push        ebp
 005B6E39    mov         ebp,esp
 005B6E3B    push        0
 005B6E3D    push        ebx
 005B6E3E    xor         eax,eax
 005B6E40    push        ebp
 005B6E41    push        5B6E83
 005B6E46    push        dword ptr fs:[eax]
 005B6E49    mov         dword ptr fs:[eax],esp
 005B6E4C    lea         edx,[ebp-4]
 005B6E4F    mov         eax,[0078CB8C];^SResString699:TResStringRec
 005B6E54    call        LoadResString
 005B6E59    mov         ecx,dword ptr [ebp-4]
 005B6E5C    mov         dl,1
 005B6E5E    mov         eax,[005B63F0];EIdTransparentProxyUDPNotSupported
 005B6E63    call        EIdException.Create
 005B6E68    call        @RaiseExcept
 005B6E6D    xor         eax,eax
 005B6E6F    pop         edx
 005B6E70    pop         ecx
 005B6E71    pop         ecx
 005B6E72    mov         dword ptr fs:[eax],edx
 005B6E75    push        5B6E8A
 005B6E7A    lea         eax,[ebp-4]
 005B6E7D    call        @UStrClr
 005B6E82    ret
>005B6E83    jmp         @HandleFinally
>005B6E88    jmp         005B6E7A
 005B6E8A    pop         ebx
 005B6E8B    pop         ecx
 005B6E8C    pop         ebp
 005B6E8D    ret         0C
*}
end;

//005B7514
procedure TIdIOHandlerSocket.Close;
begin
{*
 005B7514    push        ebx
 005B7515    mov         ebx,eax
 005B7517    mov         eax,dword ptr [ebx+0D8]
 005B751D    test        eax,eax
>005B751F    je          005B7526
 005B7521    mov         edx,dword ptr [eax]
 005B7523    call        dword ptr [edx+24]
 005B7526    mov         eax,ebx
 005B7528    call        TIdIOHandler.Close
 005B752D    pop         ebx
 005B752E    ret
*}
end;

//005B7530
procedure TIdIOHandlerSocket.ConnectClient;
begin
{*
 005B7530    push        ebx
 005B7531    push        esi
 005B7532    mov         ebx,eax
 005B7534    mov         esi,dword ptr [ebx+0D8]
 005B753A    mov         eax,ebx
 005B753C    mov         edx,dword ptr [eax]
 005B753E    call        dword ptr [edx+0DC]
 005B7544    movzx       edx,byte ptr [ebx+106]
 005B754B    mov         eax,esi
 005B754D    call        TIdSocketHandle.SetIPVersion
 005B7552    xor         ecx,ecx
 005B7554    mov         edx,1
 005B7559    mov         eax,esi
 005B755B    call        TIdSocketHandle.AllocateSocket
 005B7560    mov         eax,ebx
 005B7562    mov         edx,dword ptr [eax]
 005B7564    call        dword ptr [edx+0E4]
 005B756A    cmp         dword ptr [ebx+0DC],0
>005B7571    je          005B7581
 005B7573    lea         eax,[esi+18]
 005B7576    mov         edx,dword ptr [ebx+0DC]
 005B757C    call        @UStrAsg
 005B7581    movzx       eax,word ptr [ebx+0E0]
 005B7588    mov         word ptr [esi+20],ax
 005B758C    movzx       eax,word ptr [ebx+0E4]
 005B7593    mov         word ptr [esi+0C],ax
 005B7597    movzx       eax,word ptr [ebx+0E2]
 005B759E    mov         word ptr [esi+0E],ax
 005B75A2    cmp         byte ptr [ebx+105],1
>005B75A9    je          005B75B6
 005B75AB    cmp         byte ptr [ebx+105],0
>005B75B2    jne         005B75CF
>005B75B4    jmp         005B75CF
 005B75B6    mov         eax,[0078CB90]
 005B75BB    mov         eax,dword ptr [eax]
 005B75BD    push        eax
 005B75BE    mov         ecx,4
 005B75C3    mov         edx,0FFFF
 005B75C8    mov         eax,esi
 005B75CA    call        TIdSocketHandle.SetSockOpt
 005B75CF    mov         eax,esi
 005B75D1    call        TIdSocketHandle.Bind
 005B75D6    movzx       edx,byte ptr [ebx+104]
 005B75DD    mov         eax,esi
 005B75DF    call        TIdSocketHandle.SetUseNagle
 005B75E4    mov         eax,ebx
 005B75E6    mov         edx,dword ptr [eax]
 005B75E8    call        dword ptr [edx+0E0]
 005B75EE    pop         esi
 005B75EF    pop         ebx
 005B75F0    ret
*}
end;

//005B75F4
function TIdIOHandlerSocket.Connected:Boolean;
begin
{*
 005B75F4    push        ebx
 005B75F5    mov         ebx,eax
 005B75F7    mov         eax,ebx
 005B75F9    call        TIdIOHandlerSocket.BindingAllocated
 005B75FE    test        al,al
>005B7600    je          005B760D
 005B7602    mov         eax,ebx
 005B7604    call        TIdIOHandler.Connected
 005B7609    test        al,al
>005B760B    jne         005B761C
 005B760D    mov         eax,ebx
 005B760F    call        TIdIOHandler.InputBufferIsEmpty
 005B7614    test        al,al
>005B7616    je          005B761C
 005B7618    xor         eax,eax
 005B761A    pop         ebx
 005B761B    ret
 005B761C    mov         al,1
 005B761E    pop         ebx
 005B761F    ret
*}
end;

//005B7620
destructor TIdIOHandlerSocket.Destroy();
begin
{*
 005B7620    push        ebx
 005B7621    push        esi
 005B7622    call        @BeforeDestruction
 005B7627    mov         ebx,edx
 005B7629    mov         esi,eax
 005B762B    mov         eax,dword ptr [esi+100]
 005B7631    test        eax,eax
>005B7633    je          005B764E
 005B7635    cmp         dword ptr [eax+4],0
>005B7639    jne         005B764E
 005B763B    lea         eax,[esi+100]
 005B7641    mov         edx,dword ptr [eax]
 005B7643    xor         ecx,ecx
 005B7645    mov         dword ptr [eax],ecx
 005B7647    mov         eax,edx
 005B7649    call        TObject.Free
 005B764E    lea         eax,[esi+0D8]
 005B7654    mov         edx,dword ptr [eax]
 005B7656    xor         ecx,ecx
 005B7658    mov         dword ptr [eax],ecx
 005B765A    mov         eax,edx
 005B765C    call        TObject.Free
 005B7661    mov         edx,ebx
 005B7663    and         dl,0FC
 005B7666    mov         eax,esi
 005B7668    call        TIdIOHandler.Destroy
 005B766D    test        bl,bl
>005B766F    jle         005B7678
 005B7671    mov         eax,esi
 005B7673    call        @ClassDestroy
 005B7678    pop         esi
 005B7679    pop         ebx
 005B767A    ret
*}
end;

//005B767C
procedure TIdIOHandlerSocket.DoBeforeBind;
begin
{*
 005B767C    push        ebx
 005B767D    cmp         word ptr [eax+0EA],0
>005B7685    je          005B7697
 005B7687    mov         ebx,eax
 005B7689    mov         edx,eax
 005B768B    mov         eax,dword ptr [ebx+0EC]
 005B7691    call        dword ptr [ebx+0E8]
 005B7697    pop         ebx
 005B7698    ret
*}
end;

//005B769C
procedure TIdIOHandlerSocket.DoAfterBind;
begin
{*
 005B769C    push        ebx
 005B769D    cmp         word ptr [eax+0F2],0
>005B76A5    je          005B76B7
 005B76A7    mov         ebx,eax
 005B76A9    mov         edx,eax
 005B76AB    mov         eax,dword ptr [ebx+0F4]
 005B76B1    call        dword ptr [ebx+0F0]
 005B76B7    pop         ebx
 005B76B8    ret
*}
end;

//005B76BC
procedure TIdIOHandlerSocket.DoSocketAllocated;
begin
{*
 005B76BC    push        ebx
 005B76BD    cmp         word ptr [eax+0FA],0
>005B76C5    je          005B76D7
 005B76C7    mov         ebx,eax
 005B76C9    mov         edx,eax
 005B76CB    mov         eax,dword ptr [ebx+0FC]
 005B76D1    call        dword ptr [ebx+0F8]
 005B76D7    pop         ebx
 005B76D8    ret
*}
end;

//005B76DC
function TIdIOHandlerSocket.GetDestination:UnicodeString;
begin
{*
 005B76DC    push        ebp
 005B76DD    mov         ebp,esp
 005B76DF    push        0
 005B76E1    push        ebx
 005B76E2    push        esi
 005B76E3    push        edi
 005B76E4    mov         edi,edx
 005B76E6    mov         ebx,eax
 005B76E8    xor         eax,eax
 005B76EA    push        ebp
 005B76EB    push        5B7752
 005B76F0    push        dword ptr fs:[eax]
 005B76F3    mov         dword ptr fs:[eax],esp
 005B76F6    mov         eax,edi
 005B76F8    mov         edx,dword ptr [ebx+9C]
 005B76FE    call        @UStrAsg
 005B7703    movzx       eax,word ptr [ebx+0E6]
 005B770A    mov         esi,dword ptr [ebx+0B8]
 005B7710    cmp         eax,esi
>005B7712    je          005B773C
 005B7714    test        esi,esi
>005B7716    jle         005B773C
 005B7718    push        dword ptr [ebx+9C]
 005B771E    push        5B776C;':'
 005B7723    lea         edx,[ebp-4]
 005B7726    mov         eax,esi
 005B7728    call        IntToStr
 005B772D    push        dword ptr [ebp-4]
 005B7730    mov         eax,edi
 005B7732    mov         edx,3
 005B7737    call        @UStrCatN
 005B773C    xor         eax,eax
 005B773E    pop         edx
 005B773F    pop         ecx
 005B7740    pop         ecx
 005B7741    mov         dword ptr fs:[eax],edx
 005B7744    push        5B7759
 005B7749    lea         eax,[ebp-4]
 005B774C    call        @UStrClr
 005B7751    ret
>005B7752    jmp         @HandleFinally
>005B7757    jmp         005B7749
 005B7759    pop         edi
 005B775A    pop         esi
 005B775B    pop         ebx
 005B775C    pop         ecx
 005B775D    pop         ebp
 005B775E    ret
*}
end;

//005B7770
procedure TIdIOHandlerSocket.Open;
begin
{*
 005B7770    push        ebx
 005B7771    mov         ebx,eax
 005B7773    mov         eax,ebx
 005B7775    call        TIdIOHandler.Open
 005B777A    mov         eax,dword ptr [ebx+0D8]
 005B7780    test        eax,eax
>005B7782    jne         005B779A
 005B7784    xor         ecx,ecx
 005B7786    mov         dl,1
 005B7788    mov         eax,[005AB27C];TIdSocketHandle
 005B778D    call        TIdSocketHandle.Create
 005B7792    mov         dword ptr [ebx+0D8],eax
>005B7798    jmp         005B77A1
 005B779A    mov         dl,1
 005B779C    call        TIdSocketHandle.Reset
 005B77A1    mov         eax,dword ptr [ebx+0D8]
 005B77A7    movzx       edx,word ptr [ebx+0E4]
 005B77AE    mov         word ptr [eax+0C],dx
 005B77B2    movzx       edx,word ptr [ebx+0E2]
 005B77B9    mov         word ptr [eax+0E],dx
 005B77BD    cmp         dword ptr [ebx+9C],0
>005B77C4    je          005B77D9
 005B77C6    cmp         dword ptr [ebx+0B8],0
>005B77CD    jle         005B77D9
 005B77CF    mov         eax,ebx
 005B77D1    mov         edx,dword ptr [eax]
 005B77D3    call        dword ptr [edx+0D8]
 005B77D9    pop         ebx
 005B77DA    ret
*}
end;

//005B77DC
procedure TIdIOHandlerSocket.SetDestination(const AValue:UnicodeString);
begin
{*
 005B77DC    push        ebp
 005B77DD    mov         ebp,esp
 005B77DF    xor         ecx,ecx
 005B77E1    push        ecx
 005B77E2    push        ecx
 005B77E3    push        ecx
 005B77E4    push        ecx
 005B77E5    push        ebx
 005B77E6    push        esi
 005B77E7    mov         dword ptr [ebp-4],edx
 005B77EA    mov         esi,eax
 005B77EC    xor         eax,eax
 005B77EE    push        ebp
 005B77EF    push        5B787D
 005B77F4    push        dword ptr fs:[eax]
 005B77F7    mov         dword ptr fs:[eax],esp
 005B77FA    mov         edx,dword ptr [ebp-4]
 005B77FD    mov         eax,5B7898;':'
 005B7802    call        LastDelimiter
 005B7807    mov         ebx,eax
 005B7809    test        ebx,ebx
>005B780B    jle         005B7862
 005B780D    lea         eax,[ebp-8]
 005B7810    push        eax
 005B7811    mov         ecx,ebx
 005B7813    dec         ecx
 005B7814    mov         edx,1
 005B7819    mov         eax,dword ptr [ebp-4]
 005B781C    call        @UStrCopy
 005B7821    mov         edx,dword ptr [ebp-8]
 005B7824    mov         eax,esi
 005B7826    mov         ecx,dword ptr [eax]
 005B7828    call        dword ptr [ecx+50]
 005B782B    lea         eax,[ebp-10]
 005B782E    push        eax
 005B782F    lea         edx,[ebx+1]
 005B7832    mov         ecx,0FF
 005B7837    mov         eax,dword ptr [ebp-4]
 005B783A    call        @UStrCopy
 005B783F    mov         eax,dword ptr [ebp-10]
 005B7842    lea         edx,[ebp-0C]
 005B7845    call        Trim
 005B784A    mov         eax,dword ptr [ebp-0C]
 005B784D    movzx       edx,word ptr [esi+0E6]
 005B7854    call        IndyStrToInt
 005B7859    mov         edx,eax
 005B785B    mov         eax,esi
 005B785D    mov         ecx,dword ptr [eax]
 005B785F    call        dword ptr [ecx+54]
 005B7862    xor         eax,eax
 005B7864    pop         edx
 005B7865    pop         ecx
 005B7866    pop         ecx
 005B7867    mov         dword ptr fs:[eax],edx
 005B786A    push        5B7884
 005B786F    lea         eax,[ebp-10]
 005B7872    mov         edx,3
 005B7877    call        @UStrArrayClr
 005B787C    ret
>005B787D    jmp         @HandleFinally
>005B7882    jmp         005B786F
 005B7884    pop         esi
 005B7885    pop         ebx
 005B7886    mov         esp,ebp
 005B7888    pop         ebp
 005B7889    ret
*}
end;

//005B789C
function TIdIOHandlerSocket.BindingAllocated:Boolean;
begin
{*
 005B789C    mov         ecx,dword ptr [eax+0D8]
 005B78A2    test        ecx,ecx
 005B78A4    setne       dl
 005B78A7    test        dl,dl
>005B78A9    je          005B78AF
 005B78AB    movzx       edx,byte ptr [ecx+14]
 005B78AF    mov         eax,edx
 005B78B1    ret
*}
end;

//005B78B4
function TIdIOHandlerSocket.WriteFile(AFile:string; AEnableTransferFile:Boolean):Int64;
begin
{*
 005B78B4    push        ebp
 005B78B5    mov         ebp,esp
 005B78B7    add         esp,0FFFFFFF4
 005B78BA    push        ebx
 005B78BB    push        esi
 005B78BC    push        edi
 005B78BD    mov         ebx,ecx
 005B78BF    mov         esi,edx
 005B78C1    mov         edi,eax
 005B78C3    mov         dword ptr [ebp-8],0
 005B78CA    mov         dword ptr [ebp-4],0
 005B78D1    push        1
 005B78D3    call        kernel32.SetErrorMode
 005B78D8    mov         dword ptr [ebp-0C],eax
 005B78DB    xor         eax,eax
 005B78DD    push        ebp
 005B78DE    push        5B7959
 005B78E3    push        dword ptr fs:[eax]
 005B78E6    mov         dword ptr fs:[eax],esp
 005B78E9    mov         dl,1
 005B78EB    mov         eax,esi
 005B78ED    call        FileExists
 005B78F2    test        al,al
>005B78F4    je          005B7942
 005B78F6    mov         eax,[0078D454]
 005B78FB    cmp         dword ptr [eax],0
>005B78FE    je          005B7931
 005B7900    mov         eax,edi
 005B7902    call        TIdIOHandler.WriteBufferingActive
 005B7907    test        al,al
>005B7909    jne         005B7931
 005B790B    test        bl,bl
>005B790D    je          005B7931
 005B790F    mov         ebx,dword ptr ds:[78D454]
 005B7915    mov         ebx,dword ptr [ebx]
 005B7917    mov         eax,dword ptr [edi+0D8]
 005B791D    mov         eax,dword ptr [eax+10]
 005B7920    mov         edx,esi
 005B7922    call        ebx
 005B7924    mov         dword ptr [ebp-8],eax
 005B7927    mov         dword ptr [ebp-4],edx
 005B792A    call        @TryFinallyExit
>005B792F    jmp         005B7960
 005B7931    mov         ecx,ebx
 005B7933    mov         edx,esi
 005B7935    mov         eax,edi
 005B7937    call        TIdIOHandler.WriteFile
 005B793C    mov         dword ptr [ebp-8],eax
 005B793F    mov         dword ptr [ebp-4],edx
 005B7942    xor         eax,eax
 005B7944    pop         edx
 005B7945    pop         ecx
 005B7946    pop         ecx
 005B7947    mov         dword ptr fs:[eax],edx
 005B794A    push        5B7960
 005B794F    mov         eax,dword ptr [ebp-0C]
 005B7952    push        eax
 005B7953    call        kernel32.SetErrorMode
 005B7958    ret
>005B7959    jmp         @HandleFinally
>005B795E    jmp         005B794F
 005B7960    mov         eax,dword ptr [ebp-8]
 005B7963    mov         edx,dword ptr [ebp-4]
 005B7966    pop         edi
 005B7967    pop         esi
 005B7968    pop         ebx
 005B7969    mov         esp,ebp
 005B796B    pop         ebp
 005B796C    ret
*}
end;

//005B7970
procedure TIdIOHandlerSocket.SetTransparentProxy(AProxy:TIdCustomTransparentProxy);
begin
{*
 005B7970    push        ebx
 005B7971    push        esi
 005B7972    push        edi
 005B7973    mov         esi,edx
 005B7975    mov         ebx,eax
 005B7977    test        esi,esi
>005B7979    je          005B7A35
 005B797F    cmp         dword ptr [esi+4],0
>005B7983    jne         005B79F8
 005B7985    mov         eax,dword ptr [ebx+100]
 005B798B    test        eax,eax
>005B798D    je          005B79A4
 005B798F    cmp         dword ptr [eax+4],0
>005B7993    je          005B79A4
 005B7995    mov         edx,ebx
 005B7997    call        TComponent.RemoveFreeNotification
 005B799C    xor         eax,eax
 005B799E    mov         dword ptr [ebx+100],eax
 005B79A4    mov         edx,dword ptr [esi]
 005B79A6    mov         eax,edx
 005B79A8    mov         edi,eax
 005B79AA    mov         edx,dword ptr [ebx+100]
 005B79B0    test        edx,edx
>005B79B2    je          005B79CF
 005B79B4    mov         edx,dword ptr [edx]
 005B79B6    mov         eax,edx
 005B79B8    cmp         edi,eax
>005B79BA    je          005B79CF
 005B79BC    lea         eax,[ebx+100]
 005B79C2    mov         edx,dword ptr [eax]
 005B79C4    xor         ecx,ecx
 005B79C6    mov         dword ptr [eax],ecx
 005B79C8    mov         eax,edx
 005B79CA    call        TObject.Free
 005B79CF    cmp         dword ptr [ebx+100],0
>005B79D6    jne         005B79E9
 005B79D8    xor         ecx,ecx
 005B79DA    mov         dl,1
 005B79DC    mov         eax,edi
 005B79DE    call        TIdBaseComponent.Create
 005B79E3    mov         dword ptr [ebx+100],eax
 005B79E9    mov         edx,esi
 005B79EB    mov         eax,dword ptr [ebx+100]
 005B79F1    mov         ecx,dword ptr [eax]
 005B79F3    call        dword ptr [ecx+8]
>005B79F6    jmp         005B7A69
 005B79F8    mov         eax,dword ptr [ebx+100]
 005B79FE    test        eax,eax
>005B7A00    je          005B7A24
 005B7A02    cmp         dword ptr [eax+4],0
>005B7A06    jne         005B7A1D
 005B7A08    lea         eax,[ebx+100]
 005B7A0E    mov         edx,dword ptr [eax]
 005B7A10    xor         ecx,ecx
 005B7A12    mov         dword ptr [eax],ecx
 005B7A14    mov         eax,edx
 005B7A16    call        TObject.Free
>005B7A1B    jmp         005B7A24
 005B7A1D    mov         edx,ebx
 005B7A1F    call        TComponent.RemoveFreeNotification
 005B7A24    mov         eax,esi
 005B7A26    mov         dword ptr [ebx+100],eax
 005B7A2C    mov         edx,ebx
 005B7A2E    call        TComponent.FreeNotification
>005B7A33    jmp         005B7A69
 005B7A35    mov         eax,dword ptr [ebx+100]
 005B7A3B    test        eax,eax
>005B7A3D    je          005B7A69
 005B7A3F    cmp         dword ptr [eax+4],0
>005B7A43    jne         005B7A5A
 005B7A45    lea         eax,[ebx+100]
 005B7A4B    mov         edx,dword ptr [eax]
 005B7A4D    xor         ecx,ecx
 005B7A4F    mov         dword ptr [eax],ecx
 005B7A51    mov         eax,edx
 005B7A53    call        TObject.Free
>005B7A58    jmp         005B7A69
 005B7A5A    mov         edx,ebx
 005B7A5C    call        TComponent.RemoveFreeNotification
 005B7A61    xor         eax,eax
 005B7A63    mov         dword ptr [ebx+100],eax
 005B7A69    pop         edi
 005B7A6A    pop         esi
 005B7A6B    pop         ebx
 005B7A6C    ret
*}
end;

//005B7A70
function TIdIOHandlerSocket.GetTransparentProxy:TIdCustomTransparentProxy;
begin
{*
 005B7A70    push        ebx
 005B7A71    mov         ebx,eax
 005B7A73    cmp         dword ptr [ebx+100],0
>005B7A7A    jne         005B7A90
 005B7A7C    xor         ecx,ecx
 005B7A7E    mov         dl,1
 005B7A80    mov         eax,[005BC8D0];TIdSocksInfo
 005B7A85    call        TIdBaseComponent.Create
 005B7A8A    mov         dword ptr [ebx+100],eax
 005B7A90    mov         eax,dword ptr [ebx+100]
 005B7A96    pop         ebx
 005B7A97    ret
*}
end;

//005B7A98
function TIdIOHandlerSocket.GetUseNagle:Boolean;
begin
{*
 005B7A98    mov         edx,dword ptr [eax+0D8]
 005B7A9E    test        edx,edx
>005B7AA0    je          005B7AA7
 005B7AA2    movzx       eax,byte ptr [edx+35]
 005B7AA6    ret
 005B7AA7    movzx       eax,byte ptr [eax+104]
 005B7AAE    ret
*}
end;

//005B7AB0
procedure TIdIOHandlerSocket.SetUseNagle(AValue:Boolean);
begin
{*
 005B7AB0    mov         byte ptr [eax+104],dl
 005B7AB6    mov         ecx,dword ptr [eax+0D8]
 005B7ABC    test        ecx,ecx
>005B7ABE    je          005B7AC7
 005B7AC0    mov         eax,ecx
 005B7AC2    call        TIdSocketHandle.SetUseNagle
 005B7AC7    ret
*}
end;

//005B7AC8
procedure TIdIOHandlerSocket.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 005B7AC8    push        ebx
 005B7AC9    cmp         cl,1
>005B7ACC    jne         005B7ADE
 005B7ACE    cmp         edx,dword ptr [eax+100]
>005B7AD4    jne         005B7ADE
 005B7AD6    xor         ebx,ebx
 005B7AD8    mov         dword ptr [eax+100],ebx
 005B7ADE    call        TIdIOHandler.Notification
 005B7AE3    pop         ebx
 005B7AE4    ret
*}
end;

//005B7AE8
procedure TIdIOHandlerSocket.InitComponent;
begin
{*
 005B7AE8    push        ebx
 005B7AE9    mov         ebx,eax
 005B7AEB    mov         eax,ebx
 005B7AED    call        TIdIOHandler.InitComponent
 005B7AF2    mov         byte ptr [ebx+104],1
 005B7AF9    mov         byte ptr [ebx+106],0
 005B7B00    pop         ebx
 005B7B01    ret
*}
end;

//005B7B04
procedure sub_005B7B04;
begin
{*
 005B7B04    call        TIdIOHandlerSocket.BindingAllocated
 005B7B09    ret
*}
end;

//005B7B0C
function TIdIOHandlerSocket.CheckForError(ALastResult:Integer):Integer;
begin
{*
 005B7B0C    add         esp,0FFFFFFF8
 005B7B0F    push        1
 005B7B11    mov         dword ptr [esp+4],274A
 005B7B19    mov         dword ptr [esp+8],2745
 005B7B21    lea         ecx,[esp+4]
 005B7B25    mov         eax,[0078D940];^gvar_00789ED0
 005B7B2A    mov         eax,dword ptr [eax]
 005B7B2C    call        TIdStack.CheckForSocketError
 005B7B31    pop         ecx
 005B7B32    pop         edx
 005B7B33    ret
*}
end;

//005B7B34
procedure TIdIOHandlerSocket.RaiseError(AError:Integer);
begin
{*
 005B7B34    mov         eax,[0078D940];^gvar_00789ED0
 005B7B39    mov         eax,dword ptr [eax]
 005B7B3B    mov         ecx,dword ptr [eax]
 005B7B3D    call        dword ptr [ecx+4C]
 005B7B40    ret
*}
end;

//005B7E30
function TIdIPAddress.CompareAddress(AIP:string; var VErr:Boolean):Integer;
begin
{*
 005B7E30    push        ebp
 005B7E31    mov         ebp,esp
 005B7E33    add         esp,0FFFFFFF8
 005B7E36    push        ebx
 005B7E37    push        esi
 005B7E38    push        edi
 005B7E39    mov         esi,ecx
 005B7E3B    mov         edi,edx
 005B7E3D    mov         ebx,eax
 005B7E3F    xor         eax,eax
 005B7E41    mov         dword ptr [ebp-4],eax
 005B7E44    mov         eax,dword ptr [ebx]
 005B7E46    mov         edx,edi
 005B7E48    call        TIdIPAddress.MakeAddressObject
 005B7E4D    mov         dword ptr [ebp-8],eax
 005B7E50    cmp         dword ptr [ebp-8],0
 005B7E54    setne       al
 005B7E57    xor         al,1
 005B7E59    mov         byte ptr [esi],al
 005B7E5B    cmp         byte ptr [esi],0
>005B7E5E    jne         005B7F09
 005B7E64    xor         ecx,ecx
 005B7E66    push        ebp
 005B7E67    push        5B7F02
 005B7E6C    push        dword ptr fs:[ecx]
 005B7E6F    mov         dword ptr fs:[ecx],esp
 005B7E72    movzx       eax,byte ptr [ebx+8]
 005B7E76    mov         edx,dword ptr [ebp-8]
 005B7E79    cmp         al,byte ptr [edx+8]
 005B7E7C    setne       byte ptr [esi]
 005B7E7F    cmp         byte ptr [esi],0
>005B7E82    jne         005B7EE7
 005B7E84    test        al,al
>005B7E86    jne         005B7EAC
 005B7E88    mov         edx,dword ptr [ebp-8]
 005B7E8B    mov         edx,dword ptr [edx+4]
 005B7E8E    mov         eax,dword ptr [ebx+4]
 005B7E91    cmp         edx,eax
>005B7E93    jae         005B7E9C
 005B7E95    mov         eax,1
>005B7E9A    jmp         005B7EA7
 005B7E9C    cmp         edx,eax
>005B7E9E    jbe         005B7EA5
 005B7EA0    or          eax,0FFFFFFFF
>005B7EA3    jmp         005B7EA7
 005B7EA5    xor         eax,eax
 005B7EA7    mov         dword ptr [ebp-4],eax
>005B7EAA    jmp         005B7EE7
 005B7EAC    xor         eax,eax
 005B7EAE    mov         ecx,dword ptr [ebp-8]
 005B7EB1    movzx       ecx,word ptr [ecx+eax*2+0A]
 005B7EB6    movzx       edx,word ptr [ebx+eax*2+0A]
 005B7EBB    cmp         cx,dx
>005B7EBE    jae         005B7EC7
 005B7EC0    mov         edx,1
>005B7EC5    jmp         005B7ED8
 005B7EC7    mov         ecx,dword ptr [ebp-8]
 005B7ECA    cmp         dx,word ptr [ecx+eax*2+0A]
>005B7ECF    jae         005B7ED6
 005B7ED1    or          edx,0FFFFFFFF
>005B7ED4    jmp         005B7ED8
 005B7ED6    xor         edx,edx
 005B7ED8    mov         dword ptr [ebp-4],edx
 005B7EDB    cmp         dword ptr [ebp-4],0
>005B7EDF    jne         005B7EE7
 005B7EE1    inc         eax
 005B7EE2    cmp         eax,8
>005B7EE5    jne         005B7EAE
 005B7EE7    xor         eax,eax
 005B7EE9    pop         edx
 005B7EEA    pop         ecx
 005B7EEB    pop         ecx
 005B7EEC    mov         dword ptr fs:[eax],edx
 005B7EEF    push        5B7F09
 005B7EF4    mov         eax,dword ptr [ebp-8]
 005B7EF7    xor         edx,edx
 005B7EF9    mov         dword ptr [ebp-8],edx
 005B7EFC    call        TObject.Free
 005B7F01    ret
>005B7F02    jmp         @HandleFinally
>005B7F07    jmp         005B7EF4
 005B7F09    mov         eax,dword ptr [ebp-4]
 005B7F0C    pop         edi
 005B7F0D    pop         esi
 005B7F0E    pop         ebx
 005B7F0F    pop         ecx
 005B7F10    pop         ecx
 005B7F11    pop         ebp
 005B7F12    ret
*}
end;

//005B7F14
constructor TIdIPAddress.Create();
begin
{*
 005B7F14    push        ebx
 005B7F15    push        esi
 005B7F16    test        dl,dl
>005B7F18    je          005B7F22
 005B7F1A    add         esp,0FFFFFFF0
 005B7F1D    call        @ClassCreate
 005B7F22    mov         ebx,edx
 005B7F24    mov         esi,eax
 005B7F26    xor         edx,edx
 005B7F28    mov         eax,esi
 005B7F2A    call        TObject.Create
 005B7F2F    mov         byte ptr [esi+8],0
 005B7F33    xor         eax,eax
 005B7F35    mov         dword ptr [esi+4],eax
 005B7F38    mov         eax,esi
 005B7F3A    test        bl,bl
>005B7F3C    je          005B7F4D
 005B7F3E    call        @AfterConstruction
 005B7F43    pop         dword ptr fs:[0]
 005B7F4A    add         esp,0C
 005B7F4D    mov         eax,esi
 005B7F4F    pop         esi
 005B7F50    pop         ebx
 005B7F51    ret
*}
end;

//005B7F54
procedure TIdIPAddress.HToNBytes;
begin
{*
 005B7F54    push        ebp
 005B7F55    mov         ebp,esp
 005B7F57    push        0
 005B7F59    push        ebx
 005B7F5A    push        esi
 005B7F5B    push        edi
 005B7F5C    mov         edi,edx
 005B7F5E    mov         esi,eax
 005B7F60    xor         eax,eax
 005B7F62    push        ebp
 005B7F63    push        5B7FF4
 005B7F68    push        dword ptr fs:[eax]
 005B7F6B    mov         dword ptr fs:[eax],esp
 005B7F6E    cmp         byte ptr [esi+8],0
>005B7F72    jne         005B7F9D
 005B7F74    mov         eax,[0078D940];^gvar_00789ED0
 005B7F79    mov         eax,dword ptr [eax]
 005B7F7B    mov         edx,dword ptr [esi+4]
 005B7F7E    mov         ecx,dword ptr [eax]
 005B7F80    call        dword ptr [ecx+30]
 005B7F83    lea         edx,[ebp-4]
 005B7F86    call        ToBytes
 005B7F8B    mov         edx,dword ptr [ebp-4]
 005B7F8E    mov         eax,edi
 005B7F90    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005B7F96    call        @DynArrayAsg
>005B7F9B    jmp         005B7FD8
 005B7F9D    push        10
 005B7F9F    mov         eax,edi
 005B7FA1    mov         ecx,1
 005B7FA6    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B7FAC    call        @DynArraySetLength
 005B7FB1    add         esp,4
 005B7FB4    xor         ebx,ebx
 005B7FB6    mov         eax,[0078D940];^gvar_00789ED0
 005B7FBB    mov         eax,dword ptr [eax]
 005B7FBD    movzx       edx,word ptr [esi+ebx*2+0A]
 005B7FC2    mov         ecx,dword ptr [eax]
 005B7FC4    call        dword ptr [ecx+2C]
 005B7FC7    mov         ecx,ebx
 005B7FC9    add         ecx,ecx
 005B7FCB    mov         edx,edi
 005B7FCD    call        CopyTIdShort
 005B7FD2    inc         ebx
 005B7FD3    cmp         ebx,8
>005B7FD6    jne         005B7FB6
 005B7FD8    xor         eax,eax
 005B7FDA    pop         edx
 005B7FDB    pop         ecx
 005B7FDC    pop         ecx
 005B7FDD    mov         dword ptr fs:[eax],edx
 005B7FE0    push        5B7FFB
 005B7FE5    lea         eax,[ebp-4]
 005B7FE8    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B7FEE    call        @DynArrayClear
 005B7FF3    ret
>005B7FF4    jmp         @HandleFinally
>005B7FF9    jmp         005B7FE5
 005B7FFB    pop         edi
 005B7FFC    pop         esi
 005B7FFD    pop         ebx
 005B7FFE    pop         ecx
 005B7FFF    pop         ebp
 005B8000    ret
*}
end;

//005B8004
function TIdIPAddress.GetIPAddress:UnicodeString;
begin
{*
 005B8004    push        ebx
 005B8005    push        esi
 005B8006    mov         esi,edx
 005B8008    mov         ebx,eax
 005B800A    cmp         byte ptr [ebx+8],0
>005B800E    jne         005B801C
 005B8010    mov         edx,esi
 005B8012    mov         eax,ebx
 005B8014    call        TIdIPAddress.GetIPv4AsString
 005B8019    pop         esi
 005B801A    pop         ebx
 005B801B    ret
 005B801C    mov         edx,esi
 005B801E    mov         eax,ebx
 005B8020    call        TIdIPAddress.GetIPv6AsString
 005B8025    pop         esi
 005B8026    pop         ebx
 005B8027    ret
*}
end;

//005B8028
function TIdIPAddress.GetIPv4AsString:UnicodeString;
begin
{*
 005B8028    push        ebp
 005B8029    mov         ebp,esp
 005B802B    xor         ecx,ecx
 005B802D    push        ecx
 005B802E    push        ecx
 005B802F    push        ecx
 005B8030    push        ecx
 005B8031    push        ebx
 005B8032    push        esi
 005B8033    mov         ebx,edx
 005B8035    mov         esi,eax
 005B8037    xor         eax,eax
 005B8039    push        ebp
 005B803A    push        5B8111
 005B803F    push        dword ptr fs:[eax]
 005B8042    mov         dword ptr fs:[eax],esp
 005B8045    cmp         byte ptr [esi+8],0
>005B8049    jne         005B80EF
 005B804F    mov         eax,dword ptr [esi+4]
 005B8052    shr         eax,18
 005B8055    and         eax,0FF
 005B805A    xor         edx,edx
 005B805C    push        edx
 005B805D    push        eax
 005B805E    lea         eax,[ebp-4]
 005B8061    call        IntToStr
 005B8066    mov         edx,dword ptr [ebp-4]
 005B8069    mov         eax,ebx
 005B806B    mov         ecx,5B812C;'.'
 005B8070    call        @UStrCat3
 005B8075    push        dword ptr [ebx]
 005B8077    mov         eax,dword ptr [esi+4]
 005B807A    shr         eax,10
 005B807D    and         eax,0FF
 005B8082    xor         edx,edx
 005B8084    push        edx
 005B8085    push        eax
 005B8086    lea         eax,[ebp-8]
 005B8089    call        IntToStr
 005B808E    push        dword ptr [ebp-8]
 005B8091    push        5B812C;'.'
 005B8096    mov         eax,ebx
 005B8098    mov         edx,3
 005B809D    call        @UStrCatN
 005B80A2    push        dword ptr [ebx]
 005B80A4    mov         eax,dword ptr [esi+4]
 005B80A7    shr         eax,8
 005B80AA    and         eax,0FF
 005B80AF    xor         edx,edx
 005B80B1    push        edx
 005B80B2    push        eax
 005B80B3    lea         eax,[ebp-0C]
 005B80B6    call        IntToStr
 005B80BB    push        dword ptr [ebp-0C]
 005B80BE    push        5B812C;'.'
 005B80C3    mov         eax,ebx
 005B80C5    mov         edx,3
 005B80CA    call        @UStrCatN
 005B80CF    mov         eax,dword ptr [esi+4]
 005B80D2    and         eax,0FF
 005B80D7    xor         edx,edx
 005B80D9    push        edx
 005B80DA    push        eax
 005B80DB    lea         eax,[ebp-10]
 005B80DE    call        IntToStr
 005B80E3    mov         edx,dword ptr [ebp-10]
 005B80E6    mov         eax,ebx
 005B80E8    call        @UStrCat
>005B80ED    jmp         005B80F6
 005B80EF    mov         eax,ebx
 005B80F1    call        @UStrClr
 005B80F6    xor         eax,eax
 005B80F8    pop         edx
 005B80F9    pop         ecx
 005B80FA    pop         ecx
 005B80FB    mov         dword ptr fs:[eax],edx
 005B80FE    push        5B8118
 005B8103    lea         eax,[ebp-10]
 005B8106    mov         edx,4
 005B810B    call        @UStrArrayClr
 005B8110    ret
>005B8111    jmp         @HandleFinally
>005B8116    jmp         005B8103
 005B8118    pop         esi
 005B8119    pop         ebx
 005B811A    mov         esp,ebp
 005B811C    pop         ebp
 005B811D    ret
*}
end;

//005B8130
function TIdIPAddress.GetIPv6AsString:UnicodeString;
begin
{*
 005B8130    push        ebp
 005B8131    mov         ebp,esp
 005B8133    push        0
 005B8135    push        ebx
 005B8136    push        esi
 005B8137    push        edi
 005B8138    mov         esi,edx
 005B813A    mov         edi,eax
 005B813C    xor         eax,eax
 005B813E    push        ebp
 005B813F    push        5B81B2
 005B8144    push        dword ptr fs:[eax]
 005B8147    mov         dword ptr fs:[eax],esp
 005B814A    cmp         byte ptr [edi+8],1
>005B814E    jne         005B8195
 005B8150    mov         ecx,esi
 005B8152    movzx       eax,word ptr [edi+0A]
 005B8156    mov         edx,4
 005B815B    call        IntToHex
 005B8160    mov         ebx,1
 005B8165    push        dword ptr [esi]
 005B8167    push        5B81CC;':'
 005B816C    lea         ecx,[ebp-4]
 005B816F    movzx       eax,word ptr [edi+ebx*2+0A]
 005B8174    mov         edx,4
 005B8179    call        IntToHex
 005B817E    push        dword ptr [ebp-4]
 005B8181    mov         eax,esi
 005B8183    mov         edx,3
 005B8188    call        @UStrCatN
 005B818D    inc         ebx
 005B818E    cmp         ebx,8
>005B8191    jne         005B8165
>005B8193    jmp         005B819C
 005B8195    mov         eax,esi
 005B8197    call        @UStrClr
 005B819C    xor         eax,eax
 005B819E    pop         edx
 005B819F    pop         ecx
 005B81A0    pop         ecx
 005B81A1    mov         dword ptr fs:[eax],edx
 005B81A4    push        5B81B9
 005B81A9    lea         eax,[ebp-4]
 005B81AC    call        @UStrClr
 005B81B1    ret
>005B81B2    jmp         @HandleFinally
>005B81B7    jmp         005B81A9
 005B81B9    pop         edi
 005B81BA    pop         esi
 005B81BB    pop         ebx
 005B81BC    pop         ecx
 005B81BD    pop         ebp
 005B81BE    ret
*}
end;

//005B81D0
function TIdIPAddress.MakeAddressObject(AIP:string):TIdIPAddress;
begin
{*
 005B81D0    push        ebp
 005B81D1    mov         ebp,esp
 005B81D3    add         esp,0FFFFFFF8
 005B81D6    push        ebx
 005B81D7    push        esi
 005B81D8    push        edi
 005B81D9    mov         ebx,edx
 005B81DB    mov         dl,1
 005B81DD    mov         eax,[005B7B44];TIdIPAddress
 005B81E2    call        TIdIPAddress.Create
 005B81E7    mov         dword ptr [ebp-4],eax
 005B81EA    xor         edx,edx
 005B81EC    push        ebp
 005B81ED    push        5B825D
 005B81F2    push        dword ptr fs:[edx]
 005B81F5    mov         dword ptr fs:[edx],esp
 005B81F8    lea         ecx,[ebp-5]
 005B81FB    mov         eax,dword ptr [ebp-4]
 005B81FE    lea         edx,[eax+0A]
 005B8201    mov         eax,ebx
 005B8203    call        IPv6ToIdIPv6Address
 005B8208    cmp         byte ptr [ebp-5],0
>005B820C    jne         005B821F
 005B820E    mov         eax,dword ptr [ebp-4]
 005B8211    mov         byte ptr [eax+8],1
 005B8215    xor         eax,eax
 005B8217    pop         edx
 005B8218    pop         ecx
 005B8219    pop         ecx
 005B821A    mov         dword ptr fs:[eax],edx
>005B821D    jmp         005B8279
 005B821F    lea         edx,[ebp-5]
 005B8222    mov         eax,ebx
 005B8224    call        IPv4ToDWord
 005B8229    mov         edx,dword ptr [ebp-4]
 005B822C    mov         dword ptr [edx+4],eax
 005B822F    cmp         byte ptr [ebp-5],0
>005B8233    jne         005B8246
 005B8235    mov         eax,dword ptr [ebp-4]
 005B8238    mov         byte ptr [eax+8],0
 005B823C    xor         eax,eax
 005B823E    pop         edx
 005B823F    pop         ecx
 005B8240    pop         ecx
 005B8241    mov         dword ptr fs:[eax],edx
>005B8244    jmp         005B8279
 005B8246    mov         eax,dword ptr [ebp-4]
 005B8249    xor         edx,edx
 005B824B    mov         dword ptr [ebp-4],edx
 005B824E    call        TObject.Free
 005B8253    xor         eax,eax
 005B8255    pop         edx
 005B8256    pop         ecx
 005B8257    pop         ecx
 005B8258    mov         dword ptr fs:[eax],edx
>005B825B    jmp         005B8279
>005B825D    jmp         @HandleAnyException
 005B8262    mov         eax,dword ptr [ebp-4]
 005B8265    xor         edx,edx
 005B8267    mov         dword ptr [ebp-4],edx
 005B826A    call        TObject.Free
 005B826F    call        @RaiseAgain
 005B8274    call        @DoneExcept
 005B8279    mov         eax,dword ptr [ebp-4]
 005B827C    pop         edi
 005B827D    pop         esi
 005B827E    pop         ebx
 005B827F    pop         ecx
 005B8280    pop         ecx
 005B8281    pop         ebp
 005B8282    ret
*}
end;

//005B8284
function TIdIPAddress.MakeAddressObject(AIP:string; AIPVersion:TIdIPVersion):TIdIPAddress;
begin
{*
 005B8284    push        ebp
 005B8285    mov         ebp,esp
 005B8287    add         esp,0FFFFFFF8
 005B828A    push        ebx
 005B828B    push        esi
 005B828C    push        edi
 005B828D    mov         ebx,ecx
 005B828F    mov         esi,edx
 005B8291    mov         dl,1
 005B8293    mov         eax,[005B7B44];TIdIPAddress
 005B8298    call        TIdIPAddress.Create
 005B829D    mov         dword ptr [ebp-4],eax
 005B82A0    xor         edx,edx
 005B82A2    push        ebp
 005B82A3    push        5B831C
 005B82A8    push        dword ptr fs:[edx]
 005B82AB    mov         dword ptr fs:[edx],esp
 005B82AE    sub         bl,1
>005B82B1    jb          005B82B7
>005B82B3    je          005B82DE
>005B82B5    jmp         005B8305
 005B82B7    lea         edx,[ebp-5]
 005B82BA    mov         eax,esi
 005B82BC    call        IPv4ToDWord
 005B82C1    mov         edx,dword ptr [ebp-4]
 005B82C4    mov         dword ptr [edx+4],eax
 005B82C7    cmp         byte ptr [ebp-5],0
>005B82CB    jne         005B8305
 005B82CD    mov         eax,dword ptr [ebp-4]
 005B82D0    mov         byte ptr [eax+8],0
 005B82D4    xor         eax,eax
 005B82D6    pop         edx
 005B82D7    pop         ecx
 005B82D8    pop         ecx
 005B82D9    mov         dword ptr fs:[eax],edx
>005B82DC    jmp         005B8338
 005B82DE    lea         ecx,[ebp-5]
 005B82E1    mov         eax,dword ptr [ebp-4]
 005B82E4    lea         edx,[eax+0A]
 005B82E7    mov         eax,esi
 005B82E9    call        IPv6ToIdIPv6Address
 005B82EE    cmp         byte ptr [ebp-5],0
>005B82F2    jne         005B8305
 005B82F4    mov         eax,dword ptr [ebp-4]
 005B82F7    mov         byte ptr [eax+8],1
 005B82FB    xor         eax,eax
 005B82FD    pop         edx
 005B82FE    pop         ecx
 005B82FF    pop         ecx
 005B8300    mov         dword ptr fs:[eax],edx
>005B8303    jmp         005B8338
 005B8305    mov         eax,dword ptr [ebp-4]
 005B8308    xor         edx,edx
 005B830A    mov         dword ptr [ebp-4],edx
 005B830D    call        TObject.Free
 005B8312    xor         eax,eax
 005B8314    pop         edx
 005B8315    pop         ecx
 005B8316    pop         ecx
 005B8317    mov         dword ptr fs:[eax],edx
>005B831A    jmp         005B8338
>005B831C    jmp         @HandleAnyException
 005B8321    mov         eax,dword ptr [ebp-4]
 005B8324    xor         edx,edx
 005B8326    mov         dword ptr [ebp-4],edx
 005B8329    call        TObject.Free
 005B832E    call        @RaiseAgain
 005B8333    call        @DoneExcept
 005B8338    mov         eax,dword ptr [ebp-4]
 005B833B    pop         edi
 005B833C    pop         esi
 005B833D    pop         ebx
 005B833E    pop         ecx
 005B833F    pop         ecx
 005B8340    pop         ebp
 005B8341    ret
*}
end;

//005B8774
function TIdIOHandlerStack.Connected:Boolean;
begin
{*
 005B8774    push        ebx
 005B8775    mov         ebx,eax
 005B8777    push        0
 005B8779    xor         ecx,ecx
 005B877B    xor         edx,edx
 005B877D    mov         eax,ebx
 005B877F    call        TIdIOHandler.ReadFromSource
 005B8784    mov         eax,ebx
 005B8786    call        TIdIOHandlerSocket.Connected
 005B878B    pop         ebx
 005B878C    ret
*}
end;

//005B8790
procedure DoConnectTimeout(ATimeout:Integer);
begin
{*
 005B8790    push        ebp
 005B8791    mov         ebp,esp
 005B8793    add         esp,0FFFFFFF8
 005B8796    push        ebx
 005B8797    push        esi
 005B8798    xor         edx,edx
 005B879A    mov         dword ptr [ebp-8],edx
 005B879D    mov         ebx,eax
 005B879F    xor         eax,eax
 005B87A1    push        ebp
 005B87A2    push        5B8919
 005B87A7    push        dword ptr fs:[eax]
 005B87AA    mov         dword ptr fs:[eax],esp
 005B87AD    cmp         ebx,0FFFFFFFF
>005B87B0    jne         005B87B7
 005B87B2    mov         ebx,0FFFFFFFE
 005B87B7    mov         eax,dword ptr [ebp+8]
 005B87BA    mov         eax,dword ptr [eax-4]
 005B87BD    mov         ecx,dword ptr [eax+0D8]
 005B87C3    mov         dl,1
 005B87C5    mov         eax,[005B85F4];TIdConnectThread
 005B87CA    call        TIdConnectThread.Create
 005B87CF    mov         dword ptr [ebp-4],eax
 005B87D2    xor         eax,eax
 005B87D4    push        ebp
 005B87D5    push        5B88FC
 005B87DA    push        dword ptr fs:[eax]
 005B87DD    mov         dword ptr fs:[eax],esp
 005B87E0    mov         eax,[005AAC00];TIdAntiFreezeBase
 005B87E5    call        TIdAntiFreezeBase.ShouldUse
 005B87EA    test        al,al
>005B87EC    je          005B8806
 005B87EE    mov         eax,[0078DB60]
 005B87F3    mov         eax,dword ptr [eax]
 005B87F5    mov         eax,dword ptr [eax+38]
 005B87F8    mov         edx,7D
 005B87FD    call        IndyMin
 005B8802    mov         esi,eax
>005B8804    jmp         005B880B
 005B8806    mov         esi,7D
 005B880B    cmp         ebx,0FFFFFFFE
>005B880E    jne         005B8859
>005B8810    jmp         005B8827
 005B8812    mov         eax,esi
 005B8814    call        IndySleep
 005B8819    xor         ecx,ecx
 005B881B    mov         dl,1
 005B881D    mov         eax,[005AAC00];TIdAntiFreezeBase
 005B8822    call        TIdAntiFreezeBase.DoProcess
 005B8827    mov         eax,dword ptr [ebp-4]
 005B882A    cmp         byte ptr [eax+0D],0
>005B882E    je          005B8812
>005B8830    jmp         005B8866
 005B8832    mov         edx,esi
 005B8834    mov         eax,ebx
 005B8836    call        IndyMin
 005B883B    call        IndySleep
 005B8840    xor         ecx,ecx
 005B8842    mov         dl,1
 005B8844    mov         eax,[005AAC00];TIdAntiFreezeBase
 005B8849    call        TIdAntiFreezeBase.DoProcess
 005B884E    mov         edx,esi
 005B8850    mov         eax,ebx
 005B8852    call        IndyMin
 005B8857    sub         ebx,eax
 005B8859    test        ebx,ebx
>005B885B    jle         005B8866
 005B885D    mov         eax,dword ptr [ebp-4]
 005B8860    cmp         byte ptr [eax+0D],0
>005B8864    je          005B8832
 005B8866    mov         eax,dword ptr [ebp-4]
 005B8869    cmp         byte ptr [eax+0D],0
>005B886D    je          005B88AE
 005B886F    mov         eax,dword ptr [ebp-4]
 005B8872    cmp         dword ptr [eax+48],0
>005B8876    je          005B88E6
 005B8878    mov         eax,dword ptr [ebp-4]
 005B887B    mov         ebx,dword ptr [eax+44]
 005B887E    test        ebx,ebx
>005B8880    je          005B889C
 005B8882    mov         eax,dword ptr [ebp-4]
 005B8885    mov         eax,dword ptr [eax+48]
 005B8888    push        eax
 005B8889    mov         ecx,ebx
 005B888B    mov         dl,1
 005B888D    mov         eax,[005A7804];EIdSocketError
 005B8892    call        EIdSocketError.CreateError
 005B8897    call        @RaiseExcept
 005B889C    mov         eax,dword ptr [ebp-4]
 005B889F    mov         edx,dword ptr [eax+48]
 005B88A2    mov         eax,[005AFE94];EIdConnectException
 005B88A7    call        EIdException.Toss
>005B88AC    jmp         005B88E6
 005B88AE    mov         eax,dword ptr [ebp-4]
 005B88B1    call        TThread.Terminate
 005B88B6    mov         eax,dword ptr [ebp+8]
 005B88B9    mov         eax,dword ptr [eax-4]
 005B88BC    mov         edx,dword ptr [eax]
 005B88BE    call        dword ptr [edx+80]
 005B88C4    mov         eax,dword ptr [ebp-4]
 005B88C7    call        TThread.WaitFor
 005B88CC    lea         edx,[ebp-8]
 005B88CF    mov         eax,[0078D494];^SResString693:TResStringRec
 005B88D4    call        LoadResString
 005B88D9    mov         edx,dword ptr [ebp-8]
 005B88DC    mov         eax,[005AFDE4];EIdConnectTimeout
 005B88E1    call        EIdException.Toss
 005B88E6    xor         eax,eax
 005B88E8    pop         edx
 005B88E9    pop         ecx
 005B88EA    pop         ecx
 005B88EB    mov         dword ptr fs:[eax],edx
 005B88EE    push        5B8903
 005B88F3    mov         eax,dword ptr [ebp-4]
 005B88F6    call        TObject.Free
 005B88FB    ret
>005B88FC    jmp         @HandleFinally
>005B8901    jmp         005B88F3
 005B8903    xor         eax,eax
 005B8905    pop         edx
 005B8906    pop         ecx
 005B8907    pop         ecx
 005B8908    mov         dword ptr fs:[eax],edx
 005B890B    push        5B8920
 005B8910    lea         eax,[ebp-8]
 005B8913    call        @UStrClr
 005B8918    ret
>005B8919    jmp         @HandleFinally
>005B891E    jmp         005B8910
 005B8920    pop         esi
 005B8921    pop         ebx
 005B8922    pop         ecx
 005B8923    pop         ecx
 005B8924    pop         ebp
 005B8925    ret
*}
end;

//005B8928
procedure TIdIOHandlerStack.ConnectClient;
begin
{*
 005B8928    push        ebp
 005B8929    mov         ebp,esp
 005B892B    add         esp,0FFFFFFEC
 005B892E    push        ebx
 005B892F    push        esi
 005B8930    push        edi
 005B8931    xor         edx,edx
 005B8933    mov         dword ptr [ebp-8],edx
 005B8936    mov         dword ptr [ebp-0C],edx
 005B8939    mov         dword ptr [ebp-4],eax
 005B893C    lea         edi,[ebp-4]
 005B893F    xor         eax,eax
 005B8941    push        ebp
 005B8942    push        5B8B63
 005B8947    push        dword ptr fs:[eax]
 005B894A    mov         dword ptr fs:[eax],esp
 005B894D    mov         eax,dword ptr [edi]
 005B894F    call        TIdIOHandlerSocket.ConnectClient
 005B8954    mov         eax,dword ptr [edi]
 005B8956    mov         ebx,dword ptr [eax+100]
 005B895C    test        ebx,ebx
>005B895E    je          005B89B4
 005B8960    mov         eax,ebx
 005B8962    mov         edx,dword ptr [eax]
 005B8964    call        dword ptr [edx+44]
 005B8967    test        al,al
>005B8969    je          005B8991
 005B896B    lea         eax,[ebp-8]
 005B896E    mov         edx,dword ptr [edi]
 005B8970    mov         ebx,dword ptr [edx+100]
 005B8976    mov         edx,dword ptr [ebx+90]
 005B897C    call        @UStrLAsg
 005B8981    movzx       esi,word ptr [ebx+98]
 005B8988    movzx       ebx,byte ptr [ebx+9A]
>005B898F    jmp         005B89D5
 005B8991    lea         eax,[ebp-8]
 005B8994    mov         edx,dword ptr [edi]
 005B8996    mov         edx,dword ptr [edx+9C]
 005B899C    call        @UStrLAsg
 005B89A1    mov         eax,dword ptr [edi]
 005B89A3    mov         esi,dword ptr [eax+0B8]
 005B89A9    mov         eax,dword ptr [edi]
 005B89AB    movzx       ebx,byte ptr [eax+106]
>005B89B2    jmp         005B89D5
 005B89B4    lea         eax,[ebp-8]
 005B89B7    mov         edx,dword ptr [edi]
 005B89B9    mov         edx,dword ptr [edx+9C]
 005B89BF    call        @UStrLAsg
 005B89C4    mov         eax,dword ptr [edi]
 005B89C6    mov         esi,dword ptr [eax+0B8]
 005B89CC    mov         eax,dword ptr [edi]
 005B89CE    movzx       ebx,byte ptr [eax+106]
 005B89D5    test        bl,bl
>005B89D7    jne         005B8A38
 005B89D9    mov         eax,[0078D940];^gvar_00789ED0
 005B89DE    mov         eax,dword ptr [eax]
 005B89E0    mov         edx,dword ptr [ebp-8]
 005B89E3    call        TIdStack.IsIP
 005B89E8    test        al,al
>005B89EA    jne         005B8A2B
 005B89EC    mov         eax,dword ptr [edi]
 005B89EE    cmp         word ptr [eax+3A],0
>005B89F3    je          005B8A0D
 005B89F5    push        0
 005B89F7    mov         eax,dword ptr [ebp-8]
 005B89FA    mov         dword ptr [ebp-14],eax
 005B89FD    mov         byte ptr [ebp-10],11
 005B8A01    lea         ecx,[ebp-14]
 005B8A04    xor         edx,edx
 005B8A06    mov         eax,dword ptr [edi]
 005B8A08    call        TIdComponent.DoStatus
 005B8A0D    lea         eax,[ebp-0C]
 005B8A10    push        eax
 005B8A11    mov         eax,dword ptr [edi]
 005B8A13    movzx       ecx,byte ptr [eax+106]
 005B8A1A    mov         eax,[0078D940];^gvar_00789ED0
 005B8A1F    mov         eax,dword ptr [eax]
 005B8A21    mov         edx,dword ptr [ebp-8]
 005B8A24    call        TIdStack.ResolveHost
>005B8A29    jmp         005B8A8C
 005B8A2B    lea         eax,[ebp-0C]
 005B8A2E    mov         edx,dword ptr [ebp-8]
 005B8A31    call        @UStrLAsg
>005B8A36    jmp         005B8A8C
 005B8A38    lea         edx,[ebp-0C]
 005B8A3B    mov         eax,dword ptr [ebp-8]
 005B8A3E    call        MakeCanonicalIPv6Address
 005B8A43    cmp         dword ptr [ebp-0C],0
>005B8A47    jne         005B8A81
 005B8A49    mov         eax,dword ptr [edi]
 005B8A4B    cmp         word ptr [eax+3A],0
>005B8A50    je          005B8A6A
 005B8A52    push        0
 005B8A54    mov         eax,dword ptr [ebp-8]
 005B8A57    mov         dword ptr [ebp-14],eax
 005B8A5A    mov         byte ptr [ebp-10],11
 005B8A5E    lea         ecx,[ebp-14]
 005B8A61    xor         edx,edx
 005B8A63    mov         eax,dword ptr [edi]
 005B8A65    call        TIdComponent.DoStatus
 005B8A6A    lea         eax,[ebp-0C]
 005B8A6D    push        eax
 005B8A6E    mov         eax,[0078D940];^gvar_00789ED0
 005B8A73    mov         eax,dword ptr [eax]
 005B8A75    mov         ecx,ebx
 005B8A77    mov         edx,dword ptr [ebp-8]
 005B8A7A    call        TIdStack.ResolveHost
>005B8A7F    jmp         005B8A8C
 005B8A81    lea         eax,[ebp-0C]
 005B8A84    mov         edx,dword ptr [ebp-8]
 005B8A87    call        @UStrLAsg
 005B8A8C    push        ebx
 005B8A8D    mov         eax,dword ptr [edi]
 005B8A8F    mov         eax,dword ptr [eax+0D8]
 005B8A95    mov         ecx,esi
 005B8A97    mov         edx,dword ptr [ebp-0C]
 005B8A9A    call        TIdSocketHandle.SetPeer
 005B8A9F    mov         eax,dword ptr [edi]
 005B8AA1    cmp         word ptr [eax+3A],0
>005B8AA6    je          005B8AC8
 005B8AA8    push        0
 005B8AAA    mov         eax,dword ptr [edi]
 005B8AAC    mov         eax,dword ptr [eax+0D8]
 005B8AB2    mov         eax,dword ptr [eax+1C]
 005B8AB5    mov         dword ptr [ebp-14],eax
 005B8AB8    mov         byte ptr [ebp-10],11
 005B8ABC    lea         ecx,[ebp-14]
 005B8ABF    mov         dl,1
 005B8AC1    mov         eax,dword ptr [edi]
 005B8AC3    call        TIdComponent.DoStatus
 005B8AC8    mov         eax,dword ptr [edi]
 005B8ACA    mov         eax,dword ptr [eax+94]
 005B8AD0    test        eax,eax
>005B8AD2    jne         005B8AFF
 005B8AD4    mov         eax,[005AAC00];TIdAntiFreezeBase
 005B8AD9    call        TIdAntiFreezeBase.ShouldUse
 005B8ADE    test        al,al
>005B8AE0    je          005B8AF0
 005B8AE2    push        ebp
 005B8AE3    mov         eax,1D4C0
 005B8AE8    call        DoConnectTimeout
 005B8AED    pop         ecx
>005B8AEE    jmp         005B8B06
 005B8AF0    mov         eax,dword ptr [edi]
 005B8AF2    mov         eax,dword ptr [eax+0D8]
 005B8AF8    mov         edx,dword ptr [eax]
 005B8AFA    call        dword ptr [edx+28]
>005B8AFD    jmp         005B8B06
 005B8AFF    push        ebp
 005B8B00    call        DoConnectTimeout
 005B8B05    pop         ecx
 005B8B06    mov         eax,dword ptr [edi]
 005B8B08    mov         ebx,dword ptr [eax+100]
 005B8B0E    test        ebx,ebx
>005B8B10    je          005B8B48
 005B8B12    mov         eax,ebx
 005B8B14    mov         edx,dword ptr [eax]
 005B8B16    call        dword ptr [edx+44]
 005B8B19    test        al,al
>005B8B1B    je          005B8B48
 005B8B1D    mov         eax,dword ptr [edi]
 005B8B1F    movzx       eax,word ptr [eax+0B8]
 005B8B26    push        eax
 005B8B27    mov         eax,dword ptr [edi]
 005B8B29    movzx       eax,byte ptr [eax+106]
 005B8B30    push        eax
 005B8B31    mov         eax,dword ptr [edi]
 005B8B33    mov         ecx,dword ptr [eax+9C]
 005B8B39    mov         eax,dword ptr [edi]
 005B8B3B    mov         eax,dword ptr [eax+100]
 005B8B41    mov         edx,dword ptr [edi]
 005B8B43    call        TIdCustomTransparentProxy.Connect
 005B8B48    xor         eax,eax
 005B8B4A    pop         edx
 005B8B4B    pop         ecx
 005B8B4C    pop         ecx
 005B8B4D    mov         dword ptr fs:[eax],edx
 005B8B50    push        5B8B6A
 005B8B55    lea         eax,[ebp-0C]
 005B8B58    mov         edx,2
 005B8B5D    call        @UStrArrayClr
 005B8B62    ret
>005B8B63    jmp         @HandleFinally
>005B8B68    jmp         005B8B55
 005B8B6A    pop         edi
 005B8B6B    pop         esi
 005B8B6C    pop         ebx
 005B8B6D    mov         esp,ebp
 005B8B6F    pop         ebp
 005B8B70    ret
*}
end;

//005B8B74
function TIdIOHandlerStack.Readable(AMSec:Integer):Boolean;
begin
{*
 005B8B74    mov         eax,dword ptr [eax+0D8]
 005B8B7A    call        TIdSocketHandle.Readable
 005B8B7F    ret
*}
end;

//005B8B80
function TIdIOHandlerStack.WriteDataToTarget(const ABuffer:TIdBytes; const AOffset:Integer; const ALength:Integer):Integer;
begin
{*
 005B8B80    push        ebp
 005B8B81    mov         ebp,esp
 005B8B83    push        ebx
 005B8B84    push        esi
 005B8B85    push        edi
 005B8B86    mov         edi,ecx
 005B8B88    mov         esi,edx
 005B8B8A    mov         ebx,eax
 005B8B8C    cmp         dword ptr [ebx+0D8],0
>005B8B93    jne         005B8BA9
 005B8B95    mov         ecx,16A
 005B8B9A    mov         edx,5B8BD0;'C:\Builds\TP\indysockets\lib\core\IdIOHandlerStack.pas'
 005B8B9F    mov         eax,5B8C4C;'Assertion failure'
 005B8BA4    call        @Assert
 005B8BA9    mov         eax,dword ptr [ebp+8]
 005B8BAC    push        eax
 005B8BAD    mov         ecx,edi
 005B8BAF    mov         edx,esi
 005B8BB1    mov         eax,dword ptr [ebx+0D8]
 005B8BB7    call        TIdSocketHandle.Send
 005B8BBC    pop         edi
 005B8BBD    pop         esi
 005B8BBE    pop         ebx
 005B8BBF    pop         ebp
 005B8BC0    ret         4
*}
end;

//005B8C70
function TIdIOHandlerStack.ReadDataFromSource(var VBuffer:TIdBytes):Integer;
begin
{*
 005B8C70    push        ebx
 005B8C71    push        esi
 005B8C72    mov         esi,edx
 005B8C74    mov         ebx,eax
 005B8C76    cmp         dword ptr [ebx+0D8],0
>005B8C7D    jne         005B8C93
 005B8C7F    mov         ecx,173
 005B8C84    mov         edx,5B8CB0;'C:\Builds\TP\indysockets\lib\core\IdIOHandlerStack.pas'
 005B8C89    mov         eax,5B8D2C;'Assertion failure'
 005B8C8E    call        @Assert
 005B8C93    mov         edx,esi
 005B8C95    mov         eax,dword ptr [ebx+0D8]
 005B8C9B    call        TIdSocketHandle.Receive
 005B8CA0    pop         esi
 005B8CA1    pop         ebx
 005B8CA2    ret
*}
end;

//005B8D50
procedure TIdIOHandlerStack.CheckForDisconnect(ARaiseExceptionIfDisconnected:Boolean; AIgnoreBuffer:Boolean);
begin
{*
 005B8D50    push        ebx
 005B8D51    push        esi
 005B8D52    push        ecx
 005B8D53    mov         byte ptr [esp],cl
 005B8D56    mov         ebx,edx
 005B8D58    mov         esi,eax
 005B8D5A    cmp         byte ptr [esi+91],0
>005B8D61    je          005B8D85
 005B8D63    mov         eax,esi
 005B8D65    call        TIdIOHandlerSocket.BindingAllocated
 005B8D6A    test        al,al
>005B8D6C    je          005B8D81
 005B8D6E    mov         eax,esi
 005B8D70    mov         edx,dword ptr [eax]
 005B8D72    call        dword ptr [edx+80]
 005B8D78    mov         dl,4
 005B8D7A    mov         eax,esi
 005B8D7C    call        TIdComponent.DoStatus
 005B8D81    mov         al,1
>005B8D83    jmp         005B8D8E
 005B8D85    mov         eax,esi
 005B8D87    call        TIdIOHandlerSocket.BindingAllocated
 005B8D8C    xor         al,1
 005B8D8E    test        al,al
>005B8D90    je          005B8DA9
 005B8D92    mov         eax,esi
 005B8D94    call        TIdIOHandler.InputBufferIsEmpty
 005B8D99    or          al,byte ptr [esp]
>005B8D9C    je          005B8DA9
 005B8D9E    test        bl,bl
>005B8DA0    je          005B8DA9
 005B8DA2    mov         eax,esi
 005B8DA4    call        TIdIOHandler.RaiseConnClosedGracefully
 005B8DA9    pop         edx
 005B8DAA    pop         esi
 005B8DAB    pop         ebx
 005B8DAC    ret
*}
end;

//005B8DB0
constructor TIdConnectThread.Create;
begin
{*
 005B8DB0    push        ebx
 005B8DB1    push        esi
 005B8DB2    test        dl,dl
>005B8DB4    je          005B8DBE
 005B8DB6    add         esp,0FFFFFFF0
 005B8DB9    call        @ClassCreate
 005B8DBE    mov         ebx,edx
 005B8DC0    mov         esi,eax
 005B8DC2    mov         dword ptr [esi+40],ecx
 005B8DC5    xor         ecx,ecx
 005B8DC7    xor         edx,edx
 005B8DC9    mov         eax,esi
 005B8DCB    call        TThread.Create
 005B8DD0    mov         eax,esi
 005B8DD2    test        bl,bl
>005B8DD4    je          005B8DE5
 005B8DD6    call        @AfterConstruction
 005B8DDB    pop         dword ptr fs:[0]
 005B8DE2    add         esp,0C
 005B8DE5    mov         eax,esi
 005B8DE7    pop         esi
 005B8DE8    pop         ebx
 005B8DE9    ret
*}
end;

//005B8DEC
procedure TIdConnectThread.Execute;
begin
{*
 005B8DEC    push        ebp
 005B8DED    mov         ebp,esp
 005B8DEF    push        ecx
 005B8DF0    push        ebx
 005B8DF1    push        esi
 005B8DF2    push        edi
 005B8DF3    mov         dword ptr [ebp-4],eax
 005B8DF6    xor         ecx,ecx
 005B8DF8    push        ebp
 005B8DF9    push        5B8E5F
 005B8DFE    push        dword ptr fs:[ecx]
 005B8E01    mov         dword ptr fs:[ecx],esp
 005B8E04    xor         ecx,ecx
 005B8E06    push        ebp
 005B8E07    push        5B8E27
 005B8E0C    push        dword ptr fs:[ecx]
 005B8E0F    mov         dword ptr fs:[ecx],esp
 005B8E12    mov         eax,dword ptr [ebp-4]
 005B8E15    mov         eax,dword ptr [eax+40]
 005B8E18    mov         edx,dword ptr [eax]
 005B8E1A    call        dword ptr [edx+28]
 005B8E1D    xor         eax,eax
 005B8E1F    pop         edx
 005B8E20    pop         ecx
 005B8E21    pop         ecx
 005B8E22    mov         dword ptr fs:[eax],edx
>005B8E25    jmp         005B8E55
>005B8E27    jmp         @HandleOnException
 005B8E2C    dd          1
 005B8E30    dd          005A7804;EIdSocketError
 005B8E34    dd          005B8E38
 005B8E38    mov         edx,dword ptr [eax+18]
 005B8E3B    cmp         edx,2719
>005B8E41    je          005B8E50
 005B8E43    cmp         edx,2736
>005B8E49    je          005B8E50
 005B8E4B    call        @RaiseAgain
 005B8E50    call        @DoneExcept
 005B8E55    xor         eax,eax
 005B8E57    pop         edx
 005B8E58    pop         ecx
 005B8E59    pop         ecx
 005B8E5A    mov         dword ptr fs:[eax],edx
>005B8E5D    jmp         005B8E9F
>005B8E5F    jmp         @HandleOnException
 005B8E64    dd          1
 005B8E68    dd          00418C04;Exception
 005B8E6C    dd          005B8E70
 005B8E70    mov         ebx,eax
 005B8E72    mov         eax,dword ptr [ebp-4]
 005B8E75    add         eax,48
 005B8E78    mov         edx,dword ptr [ebx+4]
 005B8E7B    call        @UStrAsg
 005B8E80    mov         eax,ebx
 005B8E82    mov         edx,dword ptr ds:[5A7804];EIdSocketError
 005B8E88    call        @IsClass
 005B8E8D    test        al,al
>005B8E8F    je          005B8E9A
 005B8E91    mov         eax,dword ptr [ebx+18]
 005B8E94    mov         edx,dword ptr [ebp-4]
 005B8E97    mov         dword ptr [edx+44],eax
 005B8E9A    call        @DoneExcept
 005B8E9F    pop         edi
 005B8EA0    pop         esi
 005B8EA1    pop         ebx
 005B8EA2    pop         ecx
 005B8EA3    pop         ebp
 005B8EA4    ret
*}
end;

//005B8EA8
procedure TIdConnectThread.DoTerminate;
begin
{*
 005B8EA8    push        ebx
 005B8EA9    mov         ebx,eax
 005B8EAB    mov         eax,ebx
 005B8EAD    call        TThread.Terminate
 005B8EB2    mov         eax,ebx
 005B8EB4    call        TThread.DoTerminate
 005B8EB9    pop         ebx
 005B8EBA    ret
*}
end;

Initialization
//00781670
{*
 00781670    sub         dword ptr ds:[8155D0],1
>00781677    jae         00781683
 00781679    mov         eax,[005B8344];TIdIOHandlerStack
 0078167E    call        TIdIOHandler.SetDefaultClass
 00781683    ret
*}
Finalization
end.