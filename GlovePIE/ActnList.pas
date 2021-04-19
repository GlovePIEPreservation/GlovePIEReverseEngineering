//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ActnList;

interface

uses
  SysUtils, Classes, ActnList, ImgList, Menus, System;

type
  TContainedAction = class(TBasicAction)
  published
    function Update:Boolean;//00474CFC
    procedure GetParentComponent;//00474B88
    procedure Execute;//00474CA4
    destructor Destroy();//00474B38
    procedure SetParentComponent(AParent:TComponent);//00474C78
    procedure HasParent;//00474B98
  public
    FCategory:string;//f58
    FActionList:TCustomActionList;//f5C
    destructor Destroy(); virtual;//00474B38
    procedure ReadState(Reader:TReader); virtual;//v14//00474BA8
    function Update:Boolean; virtual;//v48//00474CFC
    procedure Execute; dynamic;//00474CA4
    procedure HasParent; dynamic;//00474B98
    procedure GetParentComponent; dynamic;//00474B88
    procedure SetParentComponent(AParent:TComponent); dynamic;//00474C78
    function GetIndex:Integer;//00474B6C
    function IsStoredCategory(Value:string):Boolean;//00474B84
    procedure SetIndex(Value:Integer);//00474BDC
    procedure SetCategory(const Value:UnicodeString);//00474C24
    procedure SetActionList(AActionList:TCustomActionList);//00474C50
  end;
  TActionListEnumerator = class(TObject)
  published
    function MoveNext:Boolean;//00474D9C
    function GetCurrent:TContainedAction;//00474D90
    constructor Create;//00474D4C
  public
    FIndex:Integer;//f4
    FActionList:TCustomActionList;//f8
  end;
  TActionEvent = procedure(Action:TBasicAction; var Handled:Boolean) of object;;
  TActionListState = (asNormal, asSuspended, asSuspendedEnabled);
  TCustomActionList = class(TComponent)
  published
    function IsShortCut(var Message:TWMKey):Boolean;//00475060
    function UpdateAction(Action:TBasicAction):Boolean;//00475124
    constructor Create;//00474DB8
    destructor Destroy();//00474E24
    procedure ExecuteAction(Action:TBasicAction);//00475104
    function GetEnumerator:TActionListEnumerator;//00474F10
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc);//00474E7C
  public
    FActions:TList;//f34
    FImageChangeLink:TChangeLink;//f38
    FImages:TCustomImageList;//f3C
    FOnChange:TNotifyEvent;//f40
    FOnExecute:TActionEvent;//f48
    FOnUpdate:TActionEvent;//f50
    FState:TActionListState;//f58
    FOnStateChange:TNotifyEvent;//f60
    destructor Destroy(); virtual;//00474E24
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00474F60
    constructor Create; virtual;//v2C//00474DB8
    function UpdateAction(Action:TBasicAction):Boolean; virtual;//v30//00475124
    procedure Change; virtual;//v34//00474FF8
    procedure SetImages(Value:TCustomImageList); virtual;//v38//00474F20
    procedure SetState(const Value:TActionListState); virtual;//v3C//00475144
    procedure ExecuteAction(Action:TBasicAction); dynamic;//00475104
    procedure SetChildOrder(Component:TComponent; Order:Integer); dynamic;//00474EC4
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc); dynamic;//00474E7C
    function GetAction(Index:Integer):TContainedAction;//00474EF4
    function GetActionCount:Integer;//00474F08
    procedure ImageListChange(Sender:TObject);//00474F54
    procedure AddAction(Action:TContainedAction);//00474FB0
    procedure RemoveAction(Action:TContainedAction);//00474FD0
  end;
  TShortCutList = class(TStringList)
  published
    function IndexOfShortCut(Shortcut:TShortCut):Integer;//00475B5C
    function Add(S:string):Integer;//00475B30
  public
    function Add(S:string):Integer; virtual;//v38//00475B30
  end;
  THintEvent = procedure(var HintStr:string; var CanShow:Boolean) of object;;
  TCustomAction = class(TContainedAction)
  published
    procedure Execute;//00475A40
    destructor Destroy();//00475334
    constructor Create;//004752E0
    procedure DoHint(var HintStr:string);//00475A18
  public
    FDisableIfNoHandler:Boolean;//f60
    FCaption:string;//f64
    FChecking:Boolean;//f68
    FChecked:Boolean;//f69
    FEnabled:Boolean;//f6A
    FGroupIndex:Integer;//f6C
    FHelpType:THelpType;//f70
    FHelpContext:THelpContext;//f74
    FHelpKeyword:string;//f78
    FHint:string;//f7C
    FImageIndex:TImageIndex;//f80
    FShortCut:TShortCut;//f84
    FVisible:Boolean;//f86
    FOnHint:THintEvent;//f88
    FSecondaryShortCuts:TShortCutList;//f90
    FSavedEnabledState:Boolean;//f94
    FAutoCheck:Boolean;//f95
    FImage:TObject;//f98
    FMask:TObject;//f9C
    destructor Destroy(); virtual;//00475334
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0047538C
    procedure SetName(const Value:TComponentName); virtual;//v18//004759CC
    constructor Create; virtual;//v2C//004752E0
    procedure SetHelpContext(Value:THelpContext); virtual;//v4C//004757F4
    procedure SetHelpKeyword(const Value:UnicodeString); virtual;//v50//0047578C
    function HandleShortCut:Boolean; virtual;//v54//00475B24
    procedure DoHint(var HintStr:string); dynamic;//00475A18
    procedure Execute; dynamic;//00475A40
    procedure SetAutoCheck(Value:Boolean);//00475498
    procedure SetCaption(const Value:UnicodeString);//004754F8
    procedure SetChecked(Value:Boolean);//00475558
    procedure SetEnabled(Value:Boolean);//00475660
    procedure SetGroupIndex(const Value:Integer);//004756DC
    procedure SetHelpType(Value:THelpType);//00475734
    procedure SetHint(const Value:UnicodeString);//0047584C
    procedure SetImageIndex(Value:TImageIndex);//004758AC
    procedure SetShortCut(Value:TShortCut);//00475908
    procedure SetVisible(Value:Boolean);//0047596C
    function GetSecondaryShortCuts:TShortCutList;//00475AA4
    procedure SetSecondaryShortCuts(const Value:TShortCutList);//00475ACC
    function IsSecondaryShortCutsStored:Boolean;//00475B00
  end;
  TActionLink = class(TBasicActionLink)
  public
    function IsCaptionLinked:Boolean; virtual;//v20//004751E8
    function IsCheckedLinked:Boolean; virtual;//v24//004751FC
    function IsEnabledLinked:Boolean; virtual;//v28//00475210
    function IsGroupIndexLinked:Boolean; virtual;//v2C//00475224
    function IsHelpContextLinked:Boolean; virtual;//v30//00475238
    function IsHelpLinked:Boolean; virtual;//v34//0047524C
    function IsHintLinked:Boolean; virtual;//v38//00475260
    function IsImageIndexLinked:Boolean; virtual;//v3C//00475274
    function IsShortCutLinked:Boolean; virtual;//v40//00475288
    function IsVisibleLinked:Boolean; virtual;//v44//0047529C
    procedure v48; virtual;//v48//004752B0
    procedure v4C; virtual;//v4C//004752B4
    procedure v50; virtual;//v50//004752B8
    procedure v54; virtual;//v54//004752BC
    procedure v58; virtual;//v58//004752C0
    procedure v5C; virtual;//v5C//004752C4
    procedure v60; virtual;//v60//004752C8
    procedure v64; virtual;//v64//004752CC
    procedure v68; virtual;//v68//004752D0
    procedure v6C; virtual;//v6C//004752D4
    procedure v70; virtual;//v70//004752D8
    procedure v74; virtual;//v74//004752DC
  end;
    function MonitorFromWindow(dwFlags:DWORD):HMONITOR; stdcall;//00473820
    function MonitorFromRect(dwFlags:DWORD):HMONITOR; stdcall;//00473828
    function MonitorFromPoint(dwFlags:DWORD):HMONITOR; stdcall;//00473830
    function GetMonitorInfoW(lpMonitorInfo:PMonitorInfoW):Boolean; stdcall;//00473838
    function EnumDisplayMonitors(lprcIntersect:PRect; lpfnEnumProc:TMonitorEnumProc; lData:LPARAM):Boolean; stdcall;//00473840
    procedure ReadState(Reader:TReader);//00474BA8
    procedure SetChildOrder(Component:TComponent; Order:Integer);//00474EC4
    procedure SetImages(Value:TCustomImageList);//00474F20
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00474F60
    procedure Change;//00474FF8
    procedure SetState(const Value:TActionListState);//00475144
    function IsCaptionLinked:Boolean;//004751E8
    function IsCheckedLinked:Boolean;//004751FC
    function IsEnabledLinked:Boolean;//00475210
    function IsGroupIndexLinked:Boolean;//00475224
    function IsHelpContextLinked:Boolean;//00475238
    function IsHelpLinked:Boolean;//0047524C
    function IsHintLinked:Boolean;//00475260
    function IsImageIndexLinked:Boolean;//00475274
    function IsShortCutLinked:Boolean;//00475288
    function IsVisibleLinked:Boolean;//0047529C
    procedure sub_004752B0;//004752B0
    procedure sub_004752B4;//004752B4
    procedure sub_004752B8;//004752B8
    procedure sub_004752BC;//004752BC
    procedure sub_004752C0;//004752C0
    procedure sub_004752C4;//004752C4
    procedure sub_004752C8;//004752C8
    procedure sub_004752CC;//004752CC
    procedure sub_004752D0;//004752D0
    procedure sub_004752D4;//004752D4
    procedure sub_004752D8;//004752D8
    procedure sub_004752DC;//004752DC
    procedure AssignTo(Dest:TPersistent);//0047538C
    procedure SetHelpKeyword(const Value:UnicodeString);//0047578C
    procedure SetHelpContext(Value:THelpContext);//004757F4
    procedure SetName(const Value:TComponentName);//004759CC
    function HandleShortCut:Boolean;//00475B24

implementation

//00473820
function user32.MonitorFromWindow(dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 00473820    jmp         dword ptr ds:[826810]
*}
end;

//00473828
function user32.MonitorFromRect(dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 00473828    jmp         dword ptr ds:[82680C]
*}
end;

//00473830
function user32.MonitorFromPoint(dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 00473830    jmp         dword ptr ds:[826808]
*}
end;

//00473838
function user32.GetMonitorInfoW(lpMonitorInfo:PMonitorInfoW):Boolean; stdcall;
begin
{*
 00473838    jmp         dword ptr ds:[826804]
*}
end;

//00473840
function user32.EnumDisplayMonitors(lprcIntersect:PRect; lpfnEnumProc:TMonitorEnumProc; lData:LPARAM):Boolean; stdcall;
begin
{*
 00473840    jmp         dword ptr ds:[826800]
*}
end;

//00474B38
destructor TContainedAction.Destroy();
begin
{*
 00474B38    push        ebx
 00474B39    push        esi
 00474B3A    call        @BeforeDestruction
 00474B3F    mov         ebx,edx
 00474B41    mov         esi,eax
 00474B43    mov         eax,dword ptr [esi+5C]
 00474B46    test        eax,eax
>00474B48    je          00474B51
 00474B4A    mov         edx,esi
 00474B4C    call        TCustomActionList.RemoveAction
 00474B51    mov         edx,ebx
 00474B53    and         dl,0FC
 00474B56    mov         eax,esi
 00474B58    call        TBasicAction.Destroy
 00474B5D    test        bl,bl
>00474B5F    jle         00474B68
 00474B61    mov         eax,esi
 00474B63    call        @ClassDestroy
 00474B68    pop         esi
 00474B69    pop         ebx
 00474B6A    ret
*}
end;

//00474B6C
function TContainedAction.GetIndex:Integer;
begin
{*
 00474B6C    mov         edx,dword ptr [eax+5C]
 00474B6F    test        edx,edx
>00474B71    je          00474B7D
 00474B73    mov         edx,dword ptr [edx+34]
 00474B76    xchg        eax,edx
 00474B77    call        TList.IndexOf
 00474B7C    ret
 00474B7D    or          eax,0FFFFFFFF
 00474B80    ret
*}
end;

//00474B84
function TContainedAction.IsStoredCategory(Value:string):Boolean;
begin
{*
 00474B84    mov         al,1
 00474B86    ret
*}
end;

//00474B88
procedure TContainedAction.GetParentComponent;
begin
{*
 00474B88    mov         edx,dword ptr [eax+5C]
 00474B8B    test        edx,edx
>00474B8D    je          00474B92
 00474B8F    mov         eax,edx
 00474B91    ret
 00474B92    call        TComponent.GetParentComponent
 00474B97    ret
*}
end;

//00474B98
procedure TContainedAction.HasParent;
begin
{*
 00474B98    cmp         dword ptr [eax+5C],0
>00474B9C    je          00474BA1
 00474B9E    mov         al,1
 00474BA0    ret
 00474BA1    call        TComponent.HasParent
 00474BA6    ret
*}
end;

//00474BA8
procedure TContainedAction.ReadState(Reader:TReader);
begin
{*
 00474BA8    push        ebx
 00474BA9    push        esi
 00474BAA    push        edi
 00474BAB    mov         esi,edx
 00474BAD    mov         ebx,eax
 00474BAF    mov         edx,esi
 00474BB1    mov         eax,ebx
 00474BB3    call        TComponent.ReadState
 00474BB8    mov         edi,dword ptr [esi+2C]
 00474BBB    mov         eax,edi
 00474BBD    mov         edx,dword ptr ds:[473DC0];TCustomActionList
 00474BC3    call        @IsClass
 00474BC8    test        al,al
>00474BCA    je          00474BD5
 00474BCC    mov         edx,edi
 00474BCE    mov         eax,ebx
 00474BD0    call        TContainedAction.SetActionList
 00474BD5    pop         edi
 00474BD6    pop         esi
 00474BD7    pop         ebx
 00474BD8    ret
*}
end;

//00474BDC
procedure TContainedAction.SetIndex(Value:Integer);
begin
{*
 00474BDC    push        ebx
 00474BDD    push        esi
 00474BDE    push        edi
 00474BDF    mov         esi,edx
 00474BE1    mov         ebx,eax
 00474BE3    mov         eax,ebx
 00474BE5    call        TContainedAction.GetIndex
 00474BEA    test        eax,eax
>00474BEC    jl          00474C1F
 00474BEE    mov         edx,dword ptr [ebx+5C]
 00474BF1    mov         edi,dword ptr [edx+34]
 00474BF4    mov         edx,dword ptr [edi+8]
 00474BF7    test        esi,esi
>00474BF9    jge         00474BFD
 00474BFB    xor         esi,esi
 00474BFD    cmp         edx,esi
>00474BFF    jg          00474C04
 00474C01    mov         esi,edx
 00474C03    dec         esi
 00474C04    cmp         eax,esi
>00474C06    je          00474C1F
 00474C08    mov         edx,edi
 00474C0A    xchg        eax,edx
 00474C0B    call        TList.Delete
 00474C10    mov         eax,dword ptr [ebx+5C]
 00474C13    mov         eax,dword ptr [eax+34]
 00474C16    mov         ecx,ebx
 00474C18    mov         edx,esi
 00474C1A    call        TList.Insert
 00474C1F    pop         edi
 00474C20    pop         esi
 00474C21    pop         ebx
 00474C22    ret
*}
end;

//00474C24
procedure TContainedAction.SetCategory(const Value:UnicodeString);
begin
{*
 00474C24    push        ebx
 00474C25    push        esi
 00474C26    mov         esi,edx
 00474C28    mov         ebx,eax
 00474C2A    mov         eax,esi
 00474C2C    mov         edx,dword ptr [ebx+58]
 00474C2F    call        @UStrEqual
>00474C34    je          00474C4C
 00474C36    lea         eax,[ebx+58]
 00474C39    mov         edx,esi
 00474C3B    call        @UStrAsg
 00474C40    mov         eax,dword ptr [ebx+5C]
 00474C43    test        eax,eax
>00474C45    je          00474C4C
 00474C47    mov         edx,dword ptr [eax]
 00474C49    call        dword ptr [edx+34]
 00474C4C    pop         esi
 00474C4D    pop         ebx
 00474C4E    ret
*}
end;

//00474C50
procedure TContainedAction.SetActionList(AActionList:TCustomActionList);
begin
{*
 00474C50    push        ebx
 00474C51    push        esi
 00474C52    mov         esi,edx
 00474C54    mov         ebx,eax
 00474C56    mov         eax,dword ptr [ebx+5C]
 00474C59    cmp         esi,eax
>00474C5B    je          00474C75
 00474C5D    test        eax,eax
>00474C5F    je          00474C68
 00474C61    mov         edx,ebx
 00474C63    call        TCustomActionList.RemoveAction
 00474C68    test        esi,esi
>00474C6A    je          00474C75
 00474C6C    mov         edx,ebx
 00474C6E    mov         eax,esi
 00474C70    call        TCustomActionList.AddAction
 00474C75    pop         esi
 00474C76    pop         ebx
 00474C77    ret
*}
end;

//00474C78
procedure TContainedAction.SetParentComponent(AParent:TComponent);
begin
{*
 00474C78    push        ebx
 00474C79    push        esi
 00474C7A    mov         esi,edx
 00474C7C    mov         ebx,eax
 00474C7E    test        byte ptr [ebx+1C],1
>00474C82    jne         00474C9E
 00474C84    mov         eax,esi
 00474C86    mov         edx,dword ptr ds:[473DC0];TCustomActionList
 00474C8C    call        @IsClass
 00474C91    test        al,al
>00474C93    je          00474C9E
 00474C95    mov         edx,esi
 00474C97    mov         eax,ebx
 00474C99    call        TContainedAction.SetActionList
 00474C9E    pop         esi
 00474C9F    pop         ebx
 00474CA0    ret
*}
end;

//00474CA4
procedure TContainedAction.Execute;
begin
{*
 00474CA4    push        ebx
 00474CA5    push        esi
 00474CA6    push        edi
 00474CA7    mov         ebx,eax
 00474CA9    mov         edi,dword ptr [ebx+5C]
 00474CAC    test        edi,edi
>00474CAE    je          00474CC1
 00474CB0    mov         edx,ebx
 00474CB2    mov         eax,edi
 00474CB4    mov         si,0FFF3
 00474CB8    call        @CallDynaInst
 00474CBD    test        al,al
>00474CBF    jne         00474CF3
 00474CC1    mov         eax,[0078D590];^Application:TApplication
 00474CC6    mov         eax,dword ptr [eax]
 00474CC8    mov         edx,ebx
 00474CCA    call        TApplication.ExecuteAction
 00474CCF    test        al,al
>00474CD1    jne         00474CF3
 00474CD3    mov         eax,ebx
 00474CD5    call        TBasicAction.Execute
 00474CDA    test        al,al
>00474CDC    jne         00474CF3
 00474CDE    mov         ecx,ebx
 00474CE0    xor         edx,edx
 00474CE2    mov         eax,0B040
 00474CE7    call        SendAppMessage
 00474CEC    dec         eax
>00474CED    je          00474CF3
 00474CEF    xor         eax,eax
>00474CF1    jmp         00474CF5
 00474CF3    mov         al,1
 00474CF5    pop         edi
 00474CF6    pop         esi
 00474CF7    pop         ebx
 00474CF8    ret
*}
end;

//00474CFC
function TContainedAction.Update:Boolean;
begin
{*
 00474CFC    push        ebx
 00474CFD    push        esi
 00474CFE    mov         ebx,eax
 00474D00    mov         esi,dword ptr [ebx+5C]
 00474D03    test        esi,esi
>00474D05    je          00474D14
 00474D07    mov         edx,ebx
 00474D09    mov         eax,esi
 00474D0B    mov         ecx,dword ptr [eax]
 00474D0D    call        dword ptr [ecx+30]
 00474D10    test        al,al
>00474D12    jne         00474D47
 00474D14    mov         eax,[0078D590];^Application:TApplication
 00474D19    mov         eax,dword ptr [eax]
 00474D1B    mov         edx,ebx
 00474D1D    call        TApplication.UpdateAction
 00474D22    test        al,al
>00474D24    jne         00474D47
 00474D26    mov         eax,ebx
 00474D28    call        TBasicAction.Update
 00474D2D    test        al,al
>00474D2F    jne         00474D47
 00474D31    mov         ecx,ebx
 00474D33    xor         edx,edx
 00474D35    mov         eax,0B03F
 00474D3A    call        SendAppMessage
 00474D3F    dec         eax
>00474D40    je          00474D47
 00474D42    xor         eax,eax
 00474D44    pop         esi
 00474D45    pop         ebx
 00474D46    ret
 00474D47    mov         al,1
 00474D49    pop         esi
 00474D4A    pop         ebx
 00474D4B    ret
*}
end;

//00474D4C
constructor TActionListEnumerator.Create;
begin
{*
 00474D4C    push        ebx
 00474D4D    push        esi
 00474D4E    push        edi
 00474D4F    test        dl,dl
>00474D51    je          00474D5B
 00474D53    add         esp,0FFFFFFF0
 00474D56    call        @ClassCreate
 00474D5B    mov         esi,ecx
 00474D5D    mov         ebx,edx
 00474D5F    mov         edi,eax
 00474D61    xor         edx,edx
 00474D63    mov         eax,edi
 00474D65    call        TObject.Create
 00474D6A    mov         dword ptr [edi+4],0FFFFFFFF
 00474D71    mov         dword ptr [edi+8],esi
 00474D74    mov         eax,edi
 00474D76    test        bl,bl
>00474D78    je          00474D89
 00474D7A    call        @AfterConstruction
 00474D7F    pop         dword ptr fs:[0]
 00474D86    add         esp,0C
 00474D89    mov         eax,edi
 00474D8B    pop         edi
 00474D8C    pop         esi
 00474D8D    pop         ebx
 00474D8E    ret
*}
end;

//00474D90
function TActionListEnumerator.GetCurrent:TContainedAction;
begin
{*
 00474D90    mov         edx,dword ptr [eax+4]
 00474D93    mov         eax,dword ptr [eax+8]
 00474D96    call        TCustomActionList.GetAction
 00474D9B    ret
*}
end;

//00474D9C
function TActionListEnumerator.MoveNext:Boolean;
begin
{*
 00474D9C    push        ebx
 00474D9D    mov         ebx,eax
 00474D9F    mov         eax,dword ptr [ebx+8]
 00474DA2    call        TCustomActionList.GetActionCount
 00474DA7    dec         eax
 00474DA8    cmp         eax,dword ptr [ebx+4]
 00474DAB    setg        al
 00474DAE    test        al,al
>00474DB0    je          00474DB5
 00474DB2    inc         dword ptr [ebx+4]
 00474DB5    pop         ebx
 00474DB6    ret
*}
end;

//00474DB8
constructor TCustomActionList.Create;
begin
{*
 00474DB8    push        ebp
 00474DB9    mov         ebp,esp
 00474DBB    push        ecx
 00474DBC    push        ebx
 00474DBD    push        esi
 00474DBE    test        dl,dl
>00474DC0    je          00474DCA
 00474DC2    add         esp,0FFFFFFF0
 00474DC5    call        @ClassCreate
 00474DCA    mov         byte ptr [ebp-1],dl
 00474DCD    mov         ebx,eax
 00474DCF    xor         edx,edx
 00474DD1    mov         eax,ebx
 00474DD3    call        TComponent.Create
 00474DD8    mov         dl,1
 00474DDA    mov         eax,[00439644];TList
 00474DDF    call        TObject.Create
 00474DE4    mov         dword ptr [ebx+34],eax
 00474DE7    mov         dl,1
 00474DE9    mov         eax,[0049B438];TChangeLink
 00474DEE    call        TObject.Create
 00474DF3    mov         esi,eax
 00474DF5    mov         dword ptr [ebx+38],esi
 00474DF8    mov         dword ptr [esi+0C],ebx
 00474DFB    mov         dword ptr [esi+8],474F54;TCustomActionList.ImageListChange
 00474E02    mov         byte ptr [ebx+58],0
 00474E06    mov         eax,ebx
 00474E08    cmp         byte ptr [ebp-1],0
>00474E0C    je          00474E1D
 00474E0E    call        @AfterConstruction
 00474E13    pop         dword ptr fs:[0]
 00474E1A    add         esp,0C
 00474E1D    mov         eax,ebx
 00474E1F    pop         esi
 00474E20    pop         ebx
 00474E21    pop         ecx
 00474E22    pop         ebp
 00474E23    ret
*}
end;

//00474E24
destructor TCustomActionList.Destroy();
begin
{*
 00474E24    push        ebx
 00474E25    push        esi
 00474E26    push        edi
 00474E27    call        @BeforeDestruction
 00474E2C    mov         ebx,edx
 00474E2E    mov         edi,eax
 00474E30    mov         eax,dword ptr [edi+38]
 00474E33    call        TObject.Free
>00474E38    jmp         00474E46
 00474E3A    mov         eax,esi
 00474E3C    call        TList.Last
 00474E41    call        TObject.Free
 00474E46    mov         esi,dword ptr [edi+34]
 00474E49    cmp         dword ptr [esi+8],0
>00474E4D    jg          00474E3A
 00474E4F    lea         eax,[edi+34]
 00474E52    mov         edx,dword ptr [eax]
 00474E54    xor         ecx,ecx
 00474E56    mov         dword ptr [eax],ecx
 00474E58    mov         eax,edx
 00474E5A    call        TObject.Free
 00474E5F    mov         edx,ebx
 00474E61    and         dl,0FC
 00474E64    mov         eax,edi
 00474E66    call        TComponent.Destroy
 00474E6B    test        bl,bl
>00474E6D    jle         00474E76
 00474E6F    mov         eax,edi
 00474E71    call        @ClassDestroy
 00474E76    pop         edi
 00474E77    pop         esi
 00474E78    pop         ebx
 00474E79    ret
*}
end;

//00474E7C
procedure TCustomActionList.GetChildren(Root:TComponent; Proc:TGetChildProc);
begin
{*
 00474E7C    push        ebp
 00474E7D    mov         ebp,esp
 00474E7F    add         esp,0FFFFFFF8
 00474E82    push        ebx
 00474E83    push        esi
 00474E84    mov         dword ptr [ebp-8],edx
 00474E87    mov         dword ptr [ebp-4],eax
 00474E8A    mov         eax,dword ptr [ebp-4]
 00474E8D    mov         eax,dword ptr [eax+34]
 00474E90    mov         ebx,dword ptr [eax+8]
 00474E93    dec         ebx
 00474E94    test        ebx,ebx
>00474E96    jl          00474EBB
 00474E98    inc         ebx
 00474E99    xor         esi,esi
 00474E9B    mov         eax,dword ptr [ebp-4]
 00474E9E    mov         eax,dword ptr [eax+34]
 00474EA1    mov         eax,dword ptr [eax+4]
 00474EA4    mov         eax,dword ptr [eax+esi*4]
 00474EA7    mov         edx,dword ptr [eax+4]
 00474EAA    cmp         edx,dword ptr [ebp-8]
>00474EAD    jne         00474EB7
 00474EAF    mov         edx,eax
 00474EB1    mov         eax,dword ptr [ebp+0C]
 00474EB4    call        dword ptr [ebp+8]
 00474EB7    inc         esi
 00474EB8    dec         ebx
>00474EB9    jne         00474E9B
 00474EBB    pop         esi
 00474EBC    pop         ebx
 00474EBD    pop         ecx
 00474EBE    pop         ecx
 00474EBF    pop         ebp
 00474EC0    ret         8
*}
end;

//00474EC4
procedure TCustomActionList.SetChildOrder(Component:TComponent; Order:Integer);
begin
{*
 00474EC4    push        ebx
 00474EC5    push        esi
 00474EC6    push        edi
 00474EC7    mov         edi,ecx
 00474EC9    mov         esi,edx
 00474ECB    mov         ebx,eax
 00474ECD    mov         edx,esi
 00474ECF    mov         eax,dword ptr [ebx+34]
 00474ED2    call        TList.IndexOf
 00474ED7    test        eax,eax
>00474ED9    jl          00474EEF
 00474EDB    mov         eax,esi
 00474EDD    mov         edx,dword ptr ds:[473848];TContainedAction
 00474EE3    call        @AsClass
 00474EE8    mov         edx,edi
 00474EEA    call        TContainedAction.SetIndex
 00474EEF    pop         edi
 00474EF0    pop         esi
 00474EF1    pop         ebx
 00474EF2    ret
*}
end;

//00474EF4
function TCustomActionList.GetAction(Index:Integer):TContainedAction;
begin
{*
 00474EF4    push        ebx
 00474EF5    push        esi
 00474EF6    mov         esi,edx
 00474EF8    mov         ebx,eax
 00474EFA    mov         edx,esi
 00474EFC    mov         eax,dword ptr [ebx+34]
 00474EFF    call        TList.Get
 00474F04    pop         esi
 00474F05    pop         ebx
 00474F06    ret
*}
end;

//00474F08
function TCustomActionList.GetActionCount:Integer;
begin
{*
 00474F08    mov         eax,dword ptr [eax+34]
 00474F0B    mov         eax,dword ptr [eax+8]
 00474F0E    ret
*}
end;

//00474F10
function TCustomActionList.GetEnumerator:TActionListEnumerator;
begin
{*
 00474F10    mov         ecx,eax
 00474F12    mov         dl,1
 00474F14    mov         eax,[00473B50];TActionListEnumerator
 00474F19    call        TActionListEnumerator.Create
 00474F1E    ret
*}
end;

//00474F20
procedure TCustomActionList.SetImages(Value:TCustomImageList);
begin
{*
 00474F20    push        ebx
 00474F21    push        esi
 00474F22    mov         esi,edx
 00474F24    mov         ebx,eax
 00474F26    mov         eax,dword ptr [ebx+3C]
 00474F29    test        eax,eax
>00474F2B    je          00474F35
 00474F2D    mov         edx,dword ptr [ebx+38]
 00474F30    call        TCustomImageList.UnRegisterChanges
 00474F35    mov         eax,esi
 00474F37    mov         dword ptr [ebx+3C],eax
 00474F3A    test        eax,eax
>00474F3C    je          00474F50
 00474F3E    mov         edx,dword ptr [ebx+38]
 00474F41    call        TCustomImageList.RegisterChanges
 00474F46    mov         edx,ebx
 00474F48    mov         eax,dword ptr [ebx+3C]
 00474F4B    call        TComponent.FreeNotification
 00474F50    pop         esi
 00474F51    pop         ebx
 00474F52    ret
*}
end;

//00474F54
procedure TCustomActionList.ImageListChange(Sender:TObject);
begin
{*
 00474F54    cmp         edx,dword ptr [eax+3C]
>00474F57    jne         00474F5E
 00474F59    mov         edx,dword ptr [eax]
 00474F5B    call        dword ptr [edx+34]
 00474F5E    ret
*}
end;

//00474F60
procedure TCustomActionList.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00474F60    push        ebx
 00474F61    push        esi
 00474F62    push        edi
 00474F63    mov         ebx,ecx
 00474F65    mov         edi,edx
 00474F67    mov         esi,eax
 00474F69    mov         ecx,ebx
 00474F6B    mov         edx,edi
 00474F6D    mov         eax,esi
 00474F6F    call        TComponent.Notification
 00474F74    cmp         bl,1
>00474F77    jne         00474FA9
 00474F79    cmp         edi,dword ptr [esi+3C]
>00474F7C    jne         00474F89
 00474F7E    xor         edx,edx
 00474F80    mov         eax,esi
 00474F82    mov         ecx,dword ptr [eax]
 00474F84    call        dword ptr [ecx+38]
>00474F87    jmp         00474FA9
 00474F89    cmp         dword ptr [esi+34],0
>00474F8D    je          00474FA9
 00474F8F    mov         eax,edi
 00474F91    mov         edx,dword ptr ds:[473848];TContainedAction
 00474F97    call        @IsClass
 00474F9C    test        al,al
>00474F9E    je          00474FA9
 00474FA0    mov         edx,edi
 00474FA2    mov         eax,esi
 00474FA4    call        TCustomActionList.RemoveAction
 00474FA9    pop         edi
 00474FAA    pop         esi
 00474FAB    pop         ebx
 00474FAC    ret
*}
end;

//00474FB0
procedure TCustomActionList.AddAction(Action:TContainedAction);
begin
{*
 00474FB0    push        ebx
 00474FB1    push        esi
 00474FB2    mov         esi,edx
 00474FB4    mov         ebx,eax
 00474FB6    mov         edx,esi
 00474FB8    mov         eax,dword ptr [ebx+34]
 00474FBB    call        TList.Add
 00474FC0    mov         dword ptr [esi+5C],ebx
 00474FC3    mov         edx,ebx
 00474FC5    mov         eax,esi
 00474FC7    call        TComponent.FreeNotification
 00474FCC    pop         esi
 00474FCD    pop         ebx
 00474FCE    ret
*}
end;

//00474FD0
procedure TCustomActionList.RemoveAction(Action:TContainedAction);
begin
{*
 00474FD0    push        ebx
 00474FD1    push        esi
 00474FD2    mov         esi,edx
 00474FD4    mov         ebx,eax
 00474FD6    mov         edx,esi
 00474FD8    xor         ecx,ecx
 00474FDA    mov         eax,dword ptr [ebx+34]
 00474FDD    call        TList.RemoveItem
 00474FE2    test        eax,eax
>00474FE4    jl          00474FF4
 00474FE6    mov         edx,ebx
 00474FE8    mov         eax,esi
 00474FEA    call        TComponent.RemoveFreeNotification
 00474FEF    xor         eax,eax
 00474FF1    mov         dword ptr [esi+5C],eax
 00474FF4    pop         esi
 00474FF5    pop         ebx
 00474FF6    ret
*}
end;

//00474FF8
procedure TCustomActionList.Change;
begin
{*
 00474FF8    push        ebx
 00474FF9    push        esi
 00474FFA    push        edi
 00474FFB    mov         ebx,eax
 00474FFD    cmp         word ptr [ebx+42],0
>00475002    je          0047500C
 00475004    mov         edx,ebx
 00475006    mov         eax,dword ptr [ebx+44]
 00475009    call        dword ptr [ebx+40]
 0047500C    mov         eax,dword ptr [ebx+34]
 0047500F    mov         esi,dword ptr [eax+8]
 00475012    dec         esi
 00475013    test        esi,esi
>00475015    jl          0047502C
 00475017    inc         esi
 00475018    xor         edi,edi
 0047501A    mov         eax,dword ptr [ebx+34]
 0047501D    mov         eax,dword ptr [eax+4]
 00475020    mov         eax,dword ptr [eax+edi*4]
 00475023    mov         edx,dword ptr [eax]
 00475025    call        dword ptr [edx+34]
 00475028    inc         edi
 00475029    dec         esi
>0047502A    jne         0047501A
 0047502C    test        byte ptr [ebx+1C],10
>00475030    je          0047505A
 00475032    mov         esi,dword ptr [ebx+4]
 00475035    mov         eax,esi
 00475037    mov         edx,dword ptr ds:[4E0C38];TForm
 0047503D    call        @IsClass
 00475042    test        al,al
>00475044    je          0047505A
 00475046    cmp         dword ptr [esi+2BC],0
>0047504D    je          0047505A
 0047504F    mov         eax,dword ptr [esi+2BC]
 00475055    mov         edx,dword ptr [eax]
 00475057    call        dword ptr [edx+0C]
 0047505A    pop         edi
 0047505B    pop         esi
 0047505C    pop         ebx
 0047505D    ret
*}
end;

//00475060
function TCustomActionList.IsShortCut(var Message:TWMKey):Boolean;
begin
{*
 00475060    push        ebx
 00475061    push        esi
 00475062    push        edi
 00475063    push        ebp
 00475064    add         esp,0FFFFFFF8
 00475067    mov         ebx,edx
 00475069    mov         dword ptr [esp],eax
 0047506C    mov         byte ptr [esp+4],0
 00475071    call        IsAltGRPressed
 00475076    test        al,al
>00475078    jne         004750F8
 0047507A    mov         eax,dword ptr [ebx+8]
 0047507D    call        KeyDataToShiftState
 00475082    mov         esi,eax
 00475084    movzx       eax,word ptr [ebx+4]
 00475088    mov         edx,esi
 0047508A    call        ShortCut
 0047508F    mov         ebp,eax
 00475091    test        bp,bp
>00475094    je          004750F8
 00475096    mov         eax,dword ptr [esp]
 00475099    mov         eax,dword ptr [eax+34]
 0047509C    mov         esi,dword ptr [eax+8]
 0047509F    dec         esi
 004750A0    test        esi,esi
>004750A2    jl          004750F8
 004750A4    inc         esi
 004750A5    xor         edi,edi
 004750A7    mov         eax,dword ptr [esp]
 004750AA    mov         eax,dword ptr [eax+34]
 004750AD    mov         eax,dword ptr [eax+4]
 004750B0    mov         ebx,dword ptr [eax+edi*4]
 004750B3    mov         eax,ebx
 004750B5    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004750BB    call        @IsClass
 004750C0    test        al,al
>004750C2    je          004750F4
 004750C4    cmp         bp,word ptr [ebx+84]
>004750CB    je          004750E7
 004750CD    cmp         dword ptr [ebx+90],0
>004750D4    je          004750F4
 004750D6    mov         eax,ebx
 004750D8    call        TCustomAction.GetSecondaryShortCuts
 004750DD    mov         edx,ebp
 004750DF    call        TShortCutList.IndexOfShortCut
 004750E4    inc         eax
>004750E5    je          004750F4
 004750E7    mov         eax,ebx
 004750E9    mov         edx,dword ptr [eax]
 004750EB    call        dword ptr [edx+54]
 004750EE    mov         byte ptr [esp+4],al
>004750F2    jmp         004750F8
 004750F4    inc         edi
 004750F5    dec         esi
>004750F6    jne         004750A7
 004750F8    movzx       eax,byte ptr [esp+4]
 004750FD    pop         ecx
 004750FE    pop         edx
 004750FF    pop         ebp
 00475100    pop         edi
 00475101    pop         esi
 00475102    pop         ebx
 00475103    ret
*}
end;

//00475104
procedure TCustomActionList.ExecuteAction(Action:TBasicAction);
begin
{*
 00475104    push        ebx
 00475105    push        ecx
 00475106    mov         byte ptr [esp],0
 0047510A    cmp         word ptr [eax+4A],0
>0047510F    je          0047511B
 00475111    mov         ecx,esp
 00475113    mov         ebx,eax
 00475115    mov         eax,dword ptr [ebx+4C]
 00475118    call        dword ptr [ebx+48]
 0047511B    movzx       eax,byte ptr [esp]
 0047511F    pop         edx
 00475120    pop         ebx
 00475121    ret
*}
end;

//00475124
function TCustomActionList.UpdateAction(Action:TBasicAction):Boolean;
begin
{*
 00475124    push        ebx
 00475125    push        ecx
 00475126    mov         byte ptr [esp],0
 0047512A    cmp         word ptr [eax+52],0
>0047512F    je          0047513B
 00475131    mov         ecx,esp
 00475133    mov         ebx,eax
 00475135    mov         eax,dword ptr [ebx+54]
 00475138    call        dword ptr [ebx+50]
 0047513B    movzx       eax,byte ptr [esp]
 0047513F    pop         edx
 00475140    pop         ebx
 00475141    ret
*}
end;

//00475144
procedure TCustomActionList.SetState(const Value:TActionListState);
begin
{*
 00475144    push        ebx
 00475145    push        esi
 00475146    push        edi
 00475147    push        ebp
 00475148    push        ecx
 00475149    mov         byte ptr [esp],dl
 0047514C    mov         ebx,eax
 0047514E    movzx       eax,byte ptr [ebx+58]
 00475152    cmp         al,byte ptr [esp]
>00475155    je          004751E1
 0047515B    mov         byte ptr [esp+1],al
 0047515F    movzx       eax,byte ptr [esp]
 00475163    mov         byte ptr [ebx+58],al
 00475166    cmp         al,1
>00475168    je          004751E1
 0047516A    mov         eax,dword ptr [ebx+34]
 0047516D    mov         esi,dword ptr [eax+8]
 00475170    dec         esi
 00475171    test        esi,esi
>00475173    jl          004751D2
 00475175    inc         esi
 00475176    xor         ebp,ebp
 00475178    mov         eax,dword ptr [ebx+34]
 0047517B    mov         eax,dword ptr [eax+4]
 0047517E    mov         edi,dword ptr [eax+ebp*4]
 00475181    movzx       eax,byte ptr [esp]
 00475185    sub         al,1
>00475187    jb          0047518F
 00475189    dec         al
>0047518B    je          004751B1
>0047518D    jmp         004751CE
 0047518F    test        edi,edi
>00475191    je          004751A8
 00475193    cmp         byte ptr [esp+1],2
>00475198    jne         004751A8
 0047519A    movzx       edx,byte ptr [edi+94]
 004751A1    mov         eax,edi
 004751A3    call        TCustomAction.SetEnabled
 004751A8    mov         eax,edi
 004751AA    mov         edx,dword ptr [eax]
 004751AC    call        dword ptr [edx+48]
>004751AF    jmp         004751CE
 004751B1    test        edi,edi
>004751B3    je          004751CE
 004751B5    cmp         byte ptr [esp],2
>004751B9    jne         004751CE
 004751BB    movzx       eax,byte ptr [edi+6A]
 004751BF    mov         byte ptr [edi+94],al
 004751C5    mov         dl,1
 004751C7    mov         eax,edi
 004751C9    call        TCustomAction.SetEnabled
 004751CE    inc         ebp
 004751CF    dec         esi
>004751D0    jne         00475178
 004751D2    cmp         word ptr [ebx+62],0
>004751D7    je          004751E1
 004751D9    mov         edx,ebx
 004751DB    mov         eax,dword ptr [ebx+64]
 004751DE    call        dword ptr [ebx+60]
 004751E1    pop         edx
 004751E2    pop         ebp
 004751E3    pop         edi
 004751E4    pop         esi
 004751E5    pop         ebx
 004751E6    ret
*}
end;

//004751E8
function TActionLink.IsCaptionLinked:Boolean;
begin
{*
 004751E8    push        ebx
 004751E9    mov         ebx,eax
 004751EB    mov         eax,dword ptr [ebx+10]
 004751EE    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004751F4    call        @IsClass
 004751F9    pop         ebx
 004751FA    ret
*}
end;

//004751FC
function TActionLink.IsCheckedLinked:Boolean;
begin
{*
 004751FC    push        ebx
 004751FD    mov         ebx,eax
 004751FF    mov         eax,dword ptr [ebx+10]
 00475202    mov         edx,dword ptr ds:[4743FC];TCustomAction
 00475208    call        @IsClass
 0047520D    pop         ebx
 0047520E    ret
*}
end;

//00475210
function TActionLink.IsEnabledLinked:Boolean;
begin
{*
 00475210    push        ebx
 00475211    mov         ebx,eax
 00475213    mov         eax,dword ptr [ebx+10]
 00475216    mov         edx,dword ptr ds:[4743FC];TCustomAction
 0047521C    call        @IsClass
 00475221    pop         ebx
 00475222    ret
*}
end;

//00475224
function TActionLink.IsGroupIndexLinked:Boolean;
begin
{*
 00475224    push        ebx
 00475225    mov         ebx,eax
 00475227    mov         eax,dword ptr [ebx+10]
 0047522A    mov         edx,dword ptr ds:[4743FC];TCustomAction
 00475230    call        @IsClass
 00475235    pop         ebx
 00475236    ret
*}
end;

//00475238
function TActionLink.IsHelpContextLinked:Boolean;
begin
{*
 00475238    push        ebx
 00475239    mov         ebx,eax
 0047523B    mov         eax,dword ptr [ebx+10]
 0047523E    mov         edx,dword ptr ds:[4743FC];TCustomAction
 00475244    call        @IsClass
 00475249    pop         ebx
 0047524A    ret
*}
end;

//0047524C
function TActionLink.IsHelpLinked:Boolean;
begin
{*
 0047524C    push        ebx
 0047524D    mov         ebx,eax
 0047524F    mov         eax,dword ptr [ebx+10]
 00475252    mov         edx,dword ptr ds:[4743FC];TCustomAction
 00475258    call        @IsClass
 0047525D    pop         ebx
 0047525E    ret
*}
end;

//00475260
function TActionLink.IsHintLinked:Boolean;
begin
{*
 00475260    push        ebx
 00475261    mov         ebx,eax
 00475263    mov         eax,dword ptr [ebx+10]
 00475266    mov         edx,dword ptr ds:[4743FC];TCustomAction
 0047526C    call        @IsClass
 00475271    pop         ebx
 00475272    ret
*}
end;

//00475274
function TActionLink.IsImageIndexLinked:Boolean;
begin
{*
 00475274    push        ebx
 00475275    mov         ebx,eax
 00475277    mov         eax,dword ptr [ebx+10]
 0047527A    mov         edx,dword ptr ds:[4743FC];TCustomAction
 00475280    call        @IsClass
 00475285    pop         ebx
 00475286    ret
*}
end;

//00475288
function TActionLink.IsShortCutLinked:Boolean;
begin
{*
 00475288    push        ebx
 00475289    mov         ebx,eax
 0047528B    mov         eax,dword ptr [ebx+10]
 0047528E    mov         edx,dword ptr ds:[4743FC];TCustomAction
 00475294    call        @IsClass
 00475299    pop         ebx
 0047529A    ret
*}
end;

//0047529C
function TActionLink.IsVisibleLinked:Boolean;
begin
{*
 0047529C    push        ebx
 0047529D    mov         ebx,eax
 0047529F    mov         eax,dword ptr [ebx+10]
 004752A2    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004752A8    call        @IsClass
 004752AD    pop         ebx
 004752AE    ret
*}
end;

//004752B0
procedure sub_004752B0;
begin
{*
 004752B0    ret
*}
end;

//004752B4
procedure sub_004752B4;
begin
{*
 004752B4    ret
*}
end;

//004752B8
procedure sub_004752B8;
begin
{*
 004752B8    ret
*}
end;

//004752BC
procedure sub_004752BC;
begin
{*
 004752BC    ret
*}
end;

//004752C0
procedure sub_004752C0;
begin
{*
 004752C0    ret
*}
end;

//004752C4
procedure sub_004752C4;
begin
{*
 004752C4    ret
*}
end;

//004752C8
procedure sub_004752C8;
begin
{*
 004752C8    ret
*}
end;

//004752CC
procedure sub_004752CC;
begin
{*
 004752CC    ret
*}
end;

//004752D0
procedure sub_004752D0;
begin
{*
 004752D0    ret
*}
end;

//004752D4
procedure sub_004752D4;
begin
{*
 004752D4    ret
*}
end;

//004752D8
procedure sub_004752D8;
begin
{*
 004752D8    ret
*}
end;

//004752DC
procedure sub_004752DC;
begin
{*
 004752DC    ret
*}
end;

//004752E0
constructor TCustomAction.Create;
begin
{*
 004752E0    push        ebx
 004752E1    push        esi
 004752E2    test        dl,dl
>004752E4    je          004752EE
 004752E6    add         esp,0FFFFFFF0
 004752E9    call        @ClassCreate
 004752EE    mov         ebx,edx
 004752F0    mov         esi,eax
 004752F2    xor         edx,edx
 004752F4    mov         eax,esi
 004752F6    call        TBasicAction.Create
 004752FB    mov         byte ptr [esi+6A],1
 004752FF    mov         dword ptr [esi+80],0FFFFFFFF
 00475309    mov         byte ptr [esi+86],1
 00475310    xor         eax,eax
 00475312    mov         dword ptr [esi+90],eax
 00475318    mov         eax,esi
 0047531A    test        bl,bl
>0047531C    je          0047532D
 0047531E    call        @AfterConstruction
 00475323    pop         dword ptr fs:[0]
 0047532A    add         esp,0C
 0047532D    mov         eax,esi
 0047532F    pop         esi
 00475330    pop         ebx
 00475331    ret
*}
end;

//00475334
destructor TCustomAction.Destroy();
begin
{*
 00475334    push        ebx
 00475335    push        esi
 00475336    call        @BeforeDestruction
 0047533B    mov         ebx,edx
 0047533D    mov         esi,eax
 0047533F    mov         eax,dword ptr [esi+98]
 00475345    call        TObject.Free
 0047534A    mov         eax,dword ptr [esi+9C]
 00475350    call        TObject.Free
 00475355    cmp         dword ptr [esi+90],0
>0047535C    je          00475371
 0047535E    lea         eax,[esi+90]
 00475364    mov         edx,dword ptr [eax]
 00475366    xor         ecx,ecx
 00475368    mov         dword ptr [eax],ecx
 0047536A    mov         eax,edx
 0047536C    call        TObject.Free
 00475371    mov         edx,ebx
 00475373    and         dl,0FC
 00475376    mov         eax,esi
 00475378    call        TContainedAction.Destroy
 0047537D    test        bl,bl
>0047537F    jle         00475388
 00475381    mov         eax,esi
 00475383    call        @ClassDestroy
 00475388    pop         esi
 00475389    pop         ebx
 0047538A    ret
*}
end;

//0047538C
procedure TCustomAction.AssignTo(Dest:TPersistent);
begin
{*
 0047538C    push        ebx
 0047538D    push        esi
 0047538E    push        edi
 0047538F    mov         esi,edx
 00475391    mov         ebx,eax
 00475393    mov         eax,esi
 00475395    mov         edx,dword ptr ds:[4743FC];TCustomAction
 0047539B    call        @IsClass
 004753A0    test        al,al
>004753A2    je          00475489
 004753A8    movzx       edx,byte ptr [ebx+95]
 004753AF    mov         edi,esi
 004753B1    mov         eax,edi
 004753B3    call        TCustomAction.SetAutoCheck
 004753B8    mov         edx,dword ptr [ebx+64]
 004753BB    mov         eax,edi
 004753BD    call        TCustomAction.SetCaption
 004753C2    movzx       edx,byte ptr [ebx+69]
 004753C6    mov         eax,edi
 004753C8    call        TCustomAction.SetChecked
 004753CD    movzx       edx,byte ptr [ebx+6A]
 004753D1    mov         eax,edi
 004753D3    call        TCustomAction.SetEnabled
 004753D8    mov         edx,dword ptr [ebx+6C]
 004753DB    mov         eax,edi
 004753DD    call        TCustomAction.SetGroupIndex
 004753E2    mov         edx,dword ptr [ebx+74]
 004753E5    mov         eax,edi
 004753E7    mov         ecx,dword ptr [eax]
 004753E9    call        dword ptr [ecx+4C]
 004753EC    mov         edx,dword ptr [ebx+78]
 004753EF    mov         eax,edi
 004753F1    mov         ecx,dword ptr [eax]
 004753F3    call        dword ptr [ecx+50]
 004753F6    movzx       edx,byte ptr [ebx+70]
 004753FA    mov         eax,edi
 004753FC    call        TCustomAction.SetHelpType
 00475401    mov         edx,dword ptr [ebx+7C]
 00475404    mov         eax,edi
 00475406    call        TCustomAction.SetHint
 0047540B    mov         edx,dword ptr [ebx+80]
 00475411    mov         eax,edi
 00475413    call        TCustomAction.SetImageIndex
 00475418    mov         eax,ebx
 0047541A    call        TCustomAction.GetSecondaryShortCuts
 0047541F    mov         edx,eax
 00475421    mov         eax,edi
 00475423    call        TCustomAction.SetSecondaryShortCuts
 00475428    movzx       edx,word ptr [ebx+84]
 0047542F    mov         eax,edi
 00475431    call        TCustomAction.SetShortCut
 00475436    movzx       edx,byte ptr [ebx+86]
 0047543D    mov         eax,edi
 0047543F    call        TCustomAction.SetVisible
 00475444    mov         eax,dword ptr [ebx+0C]
 00475447    mov         dword ptr [edi+0C],eax
 0047544A    push        dword ptr [ebx+44]
 0047544D    push        dword ptr [ebx+40]
 00475450    mov         eax,edi
 00475452    mov         edx,dword ptr [eax]
 00475454    call        dword ptr [edx+38]
 00475457    mov         eax,dword ptr [ebx+88]
 0047545D    mov         dword ptr [edi+88],eax
 00475463    mov         eax,dword ptr [ebx+8C]
 00475469    mov         dword ptr [edi+8C],eax
 0047546F    mov         eax,dword ptr [ebx+48]
 00475472    mov         dword ptr [edi+48],eax
 00475475    mov         eax,dword ptr [ebx+4C]
 00475478    mov         dword ptr [edi+4C],eax
 0047547B    mov         eax,dword ptr [ebx+38]
 0047547E    mov         dword ptr [edi+38],eax
 00475481    mov         eax,dword ptr [ebx+3C]
 00475484    mov         dword ptr [edi+3C],eax
>00475487    jmp         00475492
 00475489    mov         edx,esi
 0047548B    mov         eax,ebx
 0047548D    call        TPersistent.AssignTo
 00475492    pop         edi
 00475493    pop         esi
 00475494    pop         ebx
 00475495    ret
*}
end;

//00475498
procedure TCustomAction.SetAutoCheck(Value:Boolean);
begin
{*
 00475498    push        ebx
 00475499    push        esi
 0047549A    push        edi
 0047549B    push        ebp
 0047549C    mov         ebx,edx
 0047549E    mov         ebp,eax
 004754A0    cmp         bl,byte ptr [ebp+95]
>004754A6    je          004754F1
 004754A8    mov         eax,dword ptr [ebp+50]
 004754AB    mov         edi,dword ptr [eax+8]
 004754AE    dec         edi
 004754AF    test        edi,edi
>004754B1    jl          004754E4
 004754B3    inc         edi
 004754B4    xor         esi,esi
 004754B6    mov         edx,esi
 004754B8    mov         eax,dword ptr [ebp+50]
 004754BB    call        TList.Get
 004754C0    mov         edx,dword ptr ds:[474A30];TActionLink
 004754C6    call        @IsClass
 004754CB    test        al,al
>004754CD    je          004754E0
 004754CF    mov         edx,esi
 004754D1    mov         eax,dword ptr [ebp+50]
 004754D4    call        TList.Get
 004754D9    mov         edx,ebx
 004754DB    mov         ecx,dword ptr [eax]
 004754DD    call        dword ptr [ecx+48]
 004754E0    inc         esi
 004754E1    dec         edi
>004754E2    jne         004754B6
 004754E4    mov         byte ptr [ebp+95],bl
 004754EA    mov         eax,ebp
 004754EC    mov         edx,dword ptr [eax]
 004754EE    call        dword ptr [edx+34]
 004754F1    pop         ebp
 004754F2    pop         edi
 004754F3    pop         esi
 004754F4    pop         ebx
 004754F5    ret
*}
end;

//004754F8
procedure TCustomAction.SetCaption(const Value:UnicodeString);
begin
{*
 004754F8    push        ebx
 004754F9    push        esi
 004754FA    push        edi
 004754FB    push        ecx
 004754FC    mov         dword ptr [esp],edx
 004754FF    mov         ebx,eax
 00475501    mov         eax,dword ptr [esp]
 00475504    mov         edx,dword ptr [ebx+64]
 00475507    call        @UStrEqual
>0047550C    je          00475552
 0047550E    mov         eax,dword ptr [ebx+50]
 00475511    mov         esi,dword ptr [eax+8]
 00475514    dec         esi
 00475515    test        esi,esi
>00475517    jl          00475540
 00475519    inc         esi
 0047551A    xor         edi,edi
 0047551C    mov         eax,dword ptr [ebx+50]
 0047551F    mov         eax,dword ptr [eax+4]
 00475522    mov         eax,dword ptr [eax+edi*4]
 00475525    mov         edx,dword ptr ds:[474A30];TActionLink
 0047552B    call        @AsClass
 00475530    test        eax,eax
>00475532    je          0047553C
 00475534    mov         edx,dword ptr [esp]
 00475537    mov         ecx,dword ptr [eax]
 00475539    call        dword ptr [ecx+4C]
 0047553C    inc         edi
 0047553D    dec         esi
>0047553E    jne         0047551C
 00475540    lea         eax,[ebx+64]
 00475543    mov         edx,dword ptr [esp]
 00475546    call        @UStrAsg
 0047554B    mov         eax,ebx
 0047554D    mov         edx,dword ptr [eax]
 0047554F    call        dword ptr [edx+34]
 00475552    pop         edx
 00475553    pop         edi
 00475554    pop         esi
 00475555    pop         ebx
 00475556    ret
*}
end;

//00475558
procedure TCustomAction.SetChecked(Value:Boolean);
begin
{*
 00475558    push        ebp
 00475559    mov         ebp,esp
 0047555B    push        ecx
 0047555C    push        ebx
 0047555D    push        esi
 0047555E    push        edi
 0047555F    mov         ebx,edx
 00475561    mov         dword ptr [ebp-4],eax
 00475564    mov         eax,dword ptr [ebp-4]
 00475567    cmp         byte ptr [eax+68],0
>0047556B    jne         00475657
 00475571    mov         eax,dword ptr [ebp-4]
 00475574    mov         byte ptr [eax+68],1
 00475578    xor         edx,edx
 0047557A    push        ebp
 0047557B    push        475650
 00475580    push        dword ptr fs:[edx]
 00475583    mov         dword ptr fs:[edx],esp
 00475586    mov         eax,dword ptr [ebp-4]
 00475589    cmp         bl,byte ptr [eax+69]
>0047558C    je          0047563B
 00475592    mov         eax,dword ptr [ebp-4]
 00475595    mov         eax,dword ptr [eax+50]
 00475598    mov         edi,dword ptr [eax+8]
 0047559B    dec         edi
 0047559C    test        edi,edi
>0047559E    jl          004755C9
 004755A0    inc         edi
 004755A1    xor         esi,esi
 004755A3    mov         eax,dword ptr [ebp-4]
 004755A6    mov         eax,dword ptr [eax+50]
 004755A9    mov         eax,dword ptr [eax+4]
 004755AC    mov         eax,dword ptr [eax+esi*4]
 004755AF    mov         edx,dword ptr ds:[474A30];TActionLink
 004755B5    call        @AsClass
 004755BA    test        eax,eax
>004755BC    je          004755C5
 004755BE    mov         edx,ebx
 004755C0    mov         ecx,dword ptr [eax]
 004755C2    call        dword ptr [ecx+50]
 004755C5    inc         esi
 004755C6    dec         edi
>004755C7    jne         004755A3
 004755C9    mov         eax,dword ptr [ebp-4]
 004755CC    mov         byte ptr [eax+69],bl
 004755CF    mov         eax,dword ptr [ebp-4]
 004755D2    cmp         dword ptr [eax+6C],0
>004755D6    jle         00475633
 004755D8    mov         eax,dword ptr [ebp-4]
 004755DB    cmp         byte ptr [eax+69],0
>004755DF    je          00475633
 004755E1    mov         eax,dword ptr [ebp-4]
 004755E4    mov         eax,dword ptr [eax+5C]
 004755E7    call        TCustomActionList.GetActionCount
 004755EC    mov         edi,eax
 004755EE    dec         edi
 004755EF    test        edi,edi
>004755F1    jl          00475633
 004755F3    inc         edi
 004755F4    xor         esi,esi
 004755F6    mov         eax,dword ptr [ebp-4]
 004755F9    mov         eax,dword ptr [eax+5C]
 004755FC    mov         edx,esi
 004755FE    call        TCustomActionList.GetAction
 00475603    mov         ebx,eax
 00475605    cmp         ebx,dword ptr [ebp-4]
>00475608    je          0047562F
 0047560A    mov         eax,ebx
 0047560C    mov         edx,dword ptr ds:[4743FC];TCustomAction
 00475612    call        @IsClass
 00475617    test        al,al
>00475619    je          0047562F
 0047561B    mov         eax,dword ptr [ebx+6C]
 0047561E    mov         edx,dword ptr [ebp-4]
 00475621    cmp         eax,dword ptr [edx+6C]
>00475624    jne         0047562F
 00475626    xor         edx,edx
 00475628    mov         eax,ebx
 0047562A    call        TCustomAction.SetChecked
 0047562F    inc         esi
 00475630    dec         edi
>00475631    jne         004755F6
 00475633    mov         eax,dword ptr [ebp-4]
 00475636    mov         edx,dword ptr [eax]
 00475638    call        dword ptr [edx+34]
 0047563B    xor         eax,eax
 0047563D    pop         edx
 0047563E    pop         ecx
 0047563F    pop         ecx
 00475640    mov         dword ptr fs:[eax],edx
 00475643    push        475657
 00475648    mov         eax,dword ptr [ebp-4]
 0047564B    mov         byte ptr [eax+68],0
 0047564F    ret
>00475650    jmp         @HandleFinally
>00475655    jmp         00475648
 00475657    pop         edi
 00475658    pop         esi
 00475659    pop         ebx
 0047565A    pop         ecx
 0047565B    pop         ebp
 0047565C    ret
*}
end;

//00475660
procedure TCustomAction.SetEnabled(Value:Boolean);
begin
{*
 00475660    push        ebx
 00475661    push        esi
 00475662    push        edi
 00475663    push        ecx
 00475664    mov         byte ptr [esp],dl
 00475667    mov         ebx,eax
 00475669    movzx       eax,byte ptr [esp]
 0047566D    cmp         al,byte ptr [ebx+6A]
>00475670    je          004756D5
 00475672    mov         eax,dword ptr [ebx+5C]
 00475675    test        eax,eax
>00475677    je          00475694
 00475679    movzx       edx,byte ptr [eax+58]
 0047567D    cmp         dl,1
>00475680    jne         0047568B
 00475682    movzx       eax,byte ptr [esp]
 00475686    mov         byte ptr [ebx+6A],al
>00475689    jmp         004756D5
 0047568B    cmp         dl,2
>0047568E    jne         00475694
 00475690    mov         byte ptr [esp],1
 00475694    mov         eax,dword ptr [ebx+50]
 00475697    mov         esi,dword ptr [eax+8]
 0047569A    dec         esi
 0047569B    test        esi,esi
>0047569D    jl          004756C7
 0047569F    inc         esi
 004756A0    xor         edi,edi
 004756A2    mov         eax,dword ptr [ebx+50]
 004756A5    mov         eax,dword ptr [eax+4]
 004756A8    mov         eax,dword ptr [eax+edi*4]
 004756AB    mov         edx,dword ptr ds:[474A30];TActionLink
 004756B1    call        @AsClass
 004756B6    test        eax,eax
>004756B8    je          004756C3
 004756BA    movzx       edx,byte ptr [esp]
 004756BE    mov         ecx,dword ptr [eax]
 004756C0    call        dword ptr [ecx+54]
 004756C3    inc         edi
 004756C4    dec         esi
>004756C5    jne         004756A2
 004756C7    movzx       eax,byte ptr [esp]
 004756CB    mov         byte ptr [ebx+6A],al
 004756CE    mov         eax,ebx
 004756D0    mov         edx,dword ptr [eax]
 004756D2    call        dword ptr [edx+34]
 004756D5    pop         edx
 004756D6    pop         edi
 004756D7    pop         esi
 004756D8    pop         ebx
 004756D9    ret
*}
end;

//004756DC
procedure TCustomAction.SetGroupIndex(const Value:Integer);
begin
{*
 004756DC    push        ebx
 004756DD    push        esi
 004756DE    push        edi
 004756DF    push        ecx
 004756E0    mov         dword ptr [esp],edx
 004756E3    mov         ebx,eax
 004756E5    mov         eax,dword ptr [esp]
 004756E8    cmp         eax,dword ptr [ebx+6C]
>004756EB    je          0047572C
 004756ED    mov         eax,dword ptr [esp]
 004756F0    mov         dword ptr [ebx+6C],eax
 004756F3    mov         eax,dword ptr [ebx+50]
 004756F6    mov         esi,dword ptr [eax+8]
 004756F9    dec         esi
 004756FA    test        esi,esi
>004756FC    jl          00475725
 004756FE    inc         esi
 004756FF    xor         edi,edi
 00475701    mov         eax,dword ptr [ebx+50]
 00475704    mov         eax,dword ptr [eax+4]
 00475707    mov         eax,dword ptr [eax+edi*4]
 0047570A    mov         edx,dword ptr ds:[474A30];TActionLink
 00475710    call        @AsClass
 00475715    test        eax,eax
>00475717    je          00475721
 00475719    mov         edx,dword ptr [esp]
 0047571C    mov         ecx,dword ptr [eax]
 0047571E    call        dword ptr [ecx+58]
 00475721    inc         edi
 00475722    dec         esi
>00475723    jne         00475701
 00475725    mov         eax,ebx
 00475727    mov         edx,dword ptr [eax]
 00475729    call        dword ptr [edx+34]
 0047572C    pop         edx
 0047572D    pop         edi
 0047572E    pop         esi
 0047572F    pop         ebx
 00475730    ret
*}
end;

//00475734
procedure TCustomAction.SetHelpType(Value:THelpType);
begin
{*
 00475734    push        ebx
 00475735    push        esi
 00475736    push        edi
 00475737    push        ebp
 00475738    mov         ebx,edx
 0047573A    mov         ebp,eax
 0047573C    cmp         bl,byte ptr [ebp+70]
>0047573F    je          00475787
 00475741    mov         eax,dword ptr [ebp+50]
 00475744    mov         edi,dword ptr [eax+8]
 00475747    dec         edi
 00475748    test        edi,edi
>0047574A    jl          0047577D
 0047574C    inc         edi
 0047574D    xor         esi,esi
 0047574F    mov         edx,esi
 00475751    mov         eax,dword ptr [ebp+50]
 00475754    call        TList.Get
 00475759    mov         edx,dword ptr ds:[474A30];TActionLink
 0047575F    call        @IsClass
 00475764    test        al,al
>00475766    je          00475779
 00475768    mov         edx,esi
 0047576A    mov         eax,dword ptr [ebp+50]
 0047576D    call        TList.Get
 00475772    mov         edx,ebx
 00475774    mov         ecx,dword ptr [eax]
 00475776    call        dword ptr [ecx+64]
 00475779    inc         esi
 0047577A    dec         edi
>0047577B    jne         0047574F
 0047577D    mov         byte ptr [ebp+70],bl
 00475780    mov         eax,ebp
 00475782    mov         edx,dword ptr [eax]
 00475784    call        dword ptr [edx+34]
 00475787    pop         ebp
 00475788    pop         edi
 00475789    pop         esi
 0047578A    pop         ebx
 0047578B    ret
*}
end;

//0047578C
procedure TCustomAction.SetHelpKeyword(const Value:UnicodeString);
begin
{*
 0047578C    push        ebx
 0047578D    push        esi
 0047578E    push        edi
 0047578F    push        ebp
 00475790    mov         ebp,edx
 00475792    mov         ebx,eax
 00475794    mov         eax,ebp
 00475796    mov         edx,dword ptr [ebx+78]
 00475799    call        @UStrEqual
>0047579E    je          004757ED
 004757A0    mov         eax,dword ptr [ebx+50]
 004757A3    mov         edi,dword ptr [eax+8]
 004757A6    dec         edi
 004757A7    test        edi,edi
>004757A9    jl          004757DC
 004757AB    inc         edi
 004757AC    xor         esi,esi
 004757AE    mov         edx,esi
 004757B0    mov         eax,dword ptr [ebx+50]
 004757B3    call        TList.Get
 004757B8    mov         edx,dword ptr ds:[474A30];TActionLink
 004757BE    call        @IsClass
 004757C3    test        al,al
>004757C5    je          004757D8
 004757C7    mov         edx,esi
 004757C9    mov         eax,dword ptr [ebx+50]
 004757CC    call        TList.Get
 004757D1    mov         edx,ebp
 004757D3    mov         ecx,dword ptr [eax]
 004757D5    call        dword ptr [ecx+60]
 004757D8    inc         esi
 004757D9    dec         edi
>004757DA    jne         004757AE
 004757DC    lea         eax,[ebx+78]
 004757DF    mov         edx,ebp
 004757E1    call        @UStrAsg
 004757E6    mov         eax,ebx
 004757E8    mov         edx,dword ptr [eax]
 004757EA    call        dword ptr [edx+34]
 004757ED    pop         ebp
 004757EE    pop         edi
 004757EF    pop         esi
 004757F0    pop         ebx
 004757F1    ret
*}
end;

//004757F4
procedure TCustomAction.SetHelpContext(Value:THelpContext);
begin
{*
 004757F4    push        ebx
 004757F5    push        esi
 004757F6    push        edi
 004757F7    push        ecx
 004757F8    mov         dword ptr [esp],edx
 004757FB    mov         ebx,eax
 004757FD    mov         eax,dword ptr [esp]
 00475800    cmp         eax,dword ptr [ebx+74]
>00475803    je          00475844
 00475805    mov         eax,dword ptr [ebx+50]
 00475808    mov         esi,dword ptr [eax+8]
 0047580B    dec         esi
 0047580C    test        esi,esi
>0047580E    jl          00475837
 00475810    inc         esi
 00475811    xor         edi,edi
 00475813    mov         eax,dword ptr [ebx+50]
 00475816    mov         eax,dword ptr [eax+4]
 00475819    mov         eax,dword ptr [eax+edi*4]
 0047581C    mov         edx,dword ptr ds:[474A30];TActionLink
 00475822    call        @AsClass
 00475827    test        eax,eax
>00475829    je          00475833
 0047582B    mov         edx,dword ptr [esp]
 0047582E    mov         ecx,dword ptr [eax]
 00475830    call        dword ptr [ecx+5C]
 00475833    inc         edi
 00475834    dec         esi
>00475835    jne         00475813
 00475837    mov         eax,dword ptr [esp]
 0047583A    mov         dword ptr [ebx+74],eax
 0047583D    mov         eax,ebx
 0047583F    mov         edx,dword ptr [eax]
 00475841    call        dword ptr [edx+34]
 00475844    pop         edx
 00475845    pop         edi
 00475846    pop         esi
 00475847    pop         ebx
 00475848    ret
*}
end;

//0047584C
procedure TCustomAction.SetHint(const Value:UnicodeString);
begin
{*
 0047584C    push        ebx
 0047584D    push        esi
 0047584E    push        edi
 0047584F    push        ecx
 00475850    mov         dword ptr [esp],edx
 00475853    mov         ebx,eax
 00475855    mov         eax,dword ptr [esp]
 00475858    mov         edx,dword ptr [ebx+7C]
 0047585B    call        @UStrEqual
>00475860    je          004758A6
 00475862    mov         eax,dword ptr [ebx+50]
 00475865    mov         esi,dword ptr [eax+8]
 00475868    dec         esi
 00475869    test        esi,esi
>0047586B    jl          00475894
 0047586D    inc         esi
 0047586E    xor         edi,edi
 00475870    mov         eax,dword ptr [ebx+50]
 00475873    mov         eax,dword ptr [eax+4]
 00475876    mov         eax,dword ptr [eax+edi*4]
 00475879    mov         edx,dword ptr ds:[474A30];TActionLink
 0047587F    call        @AsClass
 00475884    test        eax,eax
>00475886    je          00475890
 00475888    mov         edx,dword ptr [esp]
 0047588B    mov         ecx,dword ptr [eax]
 0047588D    call        dword ptr [ecx+68]
 00475890    inc         edi
 00475891    dec         esi
>00475892    jne         00475870
 00475894    lea         eax,[ebx+7C]
 00475897    mov         edx,dword ptr [esp]
 0047589A    call        @UStrAsg
 0047589F    mov         eax,ebx
 004758A1    mov         edx,dword ptr [eax]
 004758A3    call        dword ptr [edx+34]
 004758A6    pop         edx
 004758A7    pop         edi
 004758A8    pop         esi
 004758A9    pop         ebx
 004758AA    ret
*}
end;

//004758AC
procedure TCustomAction.SetImageIndex(Value:TImageIndex);
begin
{*
 004758AC    push        ebx
 004758AD    push        esi
 004758AE    push        edi
 004758AF    push        ecx
 004758B0    mov         dword ptr [esp],edx
 004758B3    mov         ebx,eax
 004758B5    mov         eax,dword ptr [esp]
 004758B8    cmp         eax,dword ptr [ebx+80]
>004758BE    je          00475902
 004758C0    mov         eax,dword ptr [ebx+50]
 004758C3    mov         esi,dword ptr [eax+8]
 004758C6    dec         esi
 004758C7    test        esi,esi
>004758C9    jl          004758F2
 004758CB    inc         esi
 004758CC    xor         edi,edi
 004758CE    mov         eax,dword ptr [ebx+50]
 004758D1    mov         eax,dword ptr [eax+4]
 004758D4    mov         eax,dword ptr [eax+edi*4]
 004758D7    mov         edx,dword ptr ds:[474A30];TActionLink
 004758DD    call        @AsClass
 004758E2    test        eax,eax
>004758E4    je          004758EE
 004758E6    mov         edx,dword ptr [esp]
 004758E9    mov         ecx,dword ptr [eax]
 004758EB    call        dword ptr [ecx+6C]
 004758EE    inc         edi
 004758EF    dec         esi
>004758F0    jne         004758CE
 004758F2    mov         eax,dword ptr [esp]
 004758F5    mov         dword ptr [ebx+80],eax
 004758FB    mov         eax,ebx
 004758FD    mov         edx,dword ptr [eax]
 004758FF    call        dword ptr [edx+34]
 00475902    pop         edx
 00475903    pop         edi
 00475904    pop         esi
 00475905    pop         ebx
 00475906    ret
*}
end;

//00475908
procedure TCustomAction.SetShortCut(Value:TShortCut);
begin
{*
 00475908    push        ebx
 00475909    push        esi
 0047590A    push        edi
 0047590B    push        ecx
 0047590C    mov         word ptr [esp],dx
 00475910    mov         ebx,eax
 00475912    movzx       eax,word ptr [esp]
 00475916    cmp         ax,word ptr [ebx+84]
>0047591D    je          00475964
 0047591F    mov         eax,dword ptr [ebx+50]
 00475922    mov         esi,dword ptr [eax+8]
 00475925    dec         esi
 00475926    test        esi,esi
>00475928    jl          00475952
 0047592A    inc         esi
 0047592B    xor         edi,edi
 0047592D    mov         eax,dword ptr [ebx+50]
 00475930    mov         eax,dword ptr [eax+4]
 00475933    mov         eax,dword ptr [eax+edi*4]
 00475936    mov         edx,dword ptr ds:[474A30];TActionLink
 0047593C    call        @AsClass
 00475941    test        eax,eax
>00475943    je          0047594E
 00475945    movzx       edx,word ptr [esp]
 00475949    mov         ecx,dword ptr [eax]
 0047594B    call        dword ptr [ecx+70]
 0047594E    inc         edi
 0047594F    dec         esi
>00475950    jne         0047592D
 00475952    movzx       eax,word ptr [esp]
 00475956    mov         word ptr [ebx+84],ax
 0047595D    mov         eax,ebx
 0047595F    mov         edx,dword ptr [eax]
 00475961    call        dword ptr [edx+34]
 00475964    pop         edx
 00475965    pop         edi
 00475966    pop         esi
 00475967    pop         ebx
 00475968    ret
*}
end;

//0047596C
procedure TCustomAction.SetVisible(Value:Boolean);
begin
{*
 0047596C    push        ebx
 0047596D    push        esi
 0047596E    push        edi
 0047596F    push        ecx
 00475970    mov         byte ptr [esp],dl
 00475973    mov         ebx,eax
 00475975    movzx       eax,byte ptr [esp]
 00475979    cmp         al,byte ptr [ebx+86]
>0047597F    je          004759C5
 00475981    mov         eax,dword ptr [ebx+50]
 00475984    mov         esi,dword ptr [eax+8]
 00475987    dec         esi
 00475988    test        esi,esi
>0047598A    jl          004759B4
 0047598C    inc         esi
 0047598D    xor         edi,edi
 0047598F    mov         eax,dword ptr [ebx+50]
 00475992    mov         eax,dword ptr [eax+4]
 00475995    mov         eax,dword ptr [eax+edi*4]
 00475998    mov         edx,dword ptr ds:[474A30];TActionLink
 0047599E    call        @AsClass
 004759A3    test        eax,eax
>004759A5    je          004759B0
 004759A7    movzx       edx,byte ptr [esp]
 004759AB    mov         ecx,dword ptr [eax]
 004759AD    call        dword ptr [ecx+74]
 004759B0    inc         edi
 004759B1    dec         esi
>004759B2    jne         0047598F
 004759B4    movzx       eax,byte ptr [esp]
 004759B8    mov         byte ptr [ebx+86],al
 004759BE    mov         eax,ebx
 004759C0    mov         edx,dword ptr [eax]
 004759C2    call        dword ptr [edx+34]
 004759C5    pop         edx
 004759C6    pop         edi
 004759C7    pop         esi
 004759C8    pop         ebx
 004759C9    ret
*}
end;

//004759CC
procedure TCustomAction.SetName(const Value:TComponentName);
begin
{*
 004759CC    push        ebx
 004759CD    push        esi
 004759CE    push        edi
 004759CF    mov         edi,edx
 004759D1    mov         esi,eax
 004759D3    mov         eax,dword ptr [esi+8]
 004759D6    mov         edx,dword ptr [esi+64]
 004759D9    call        @UStrEqual
>004759DE    jne         004759ED
 004759E0    mov         ebx,dword ptr [esi+4]
 004759E3    test        ebx,ebx
>004759E5    je          004759F1
 004759E7    test        byte ptr [ebx+1C],1
>004759EB    je          004759F1
 004759ED    xor         eax,eax
>004759EF    jmp         004759F3
 004759F1    mov         al,1
 004759F3    mov         ebx,eax
 004759F5    mov         edx,edi
 004759F7    mov         eax,esi
 004759F9    call        TComponent.SetName
 004759FE    test        bl,bl
>00475A00    je          00475A14
 00475A02    mov         eax,dword ptr [esi+50]
 00475A05    cmp         dword ptr [eax+8],0
>00475A09    jne         00475A14
 00475A0B    mov         edx,edi
 00475A0D    mov         eax,esi
 00475A0F    call        TCustomAction.SetCaption
 00475A14    pop         edi
 00475A15    pop         esi
 00475A16    pop         ebx
 00475A17    ret
*}
end;

//00475A18
procedure TCustomAction.DoHint(var HintStr:string);
begin
{*
 00475A18    push        ebx
 00475A19    push        ecx
 00475A1A    mov         byte ptr [esp],1
 00475A1E    cmp         word ptr [eax+8A],0
>00475A26    je          00475A38
 00475A28    mov         ecx,esp
 00475A2A    mov         ebx,eax
 00475A2C    mov         eax,dword ptr [ebx+8C]
 00475A32    call        dword ptr [ebx+88]
 00475A38    movzx       eax,byte ptr [esp]
 00475A3C    pop         edx
 00475A3D    pop         ebx
 00475A3E    ret
*}
end;

//00475A40
procedure TCustomAction.Execute;
begin
{*
 00475A40    push        ebx
 00475A41    mov         ebx,eax
 00475A43    xor         eax,eax
 00475A45    mov         edx,dword ptr [ebx+5C]
 00475A48    test        edx,edx
>00475A4A    je          00475A52
 00475A4C    cmp         byte ptr [edx+58],0
>00475A50    jne         00475A9F
 00475A52    mov         eax,ebx
 00475A54    mov         edx,dword ptr [eax]
 00475A56    call        dword ptr [edx+48]
 00475A59    cmp         byte ptr [ebx+6A],0
>00475A5D    je          00475A88
 00475A5F    cmp         byte ptr [ebx+95],0
>00475A66    je          00475A88
 00475A68    cmp         byte ptr [ebx+69],0
>00475A6C    je          00475A7A
 00475A6E    cmp         byte ptr [ebx+69],0
>00475A72    je          00475A88
 00475A74    cmp         dword ptr [ebx+6C],0
>00475A78    jne         00475A88
 00475A7A    movzx       edx,byte ptr [ebx+69]
 00475A7E    xor         dl,1
 00475A81    mov         eax,ebx
 00475A83    call        TCustomAction.SetChecked
 00475A88    cmp         byte ptr [ebx+6A],0
>00475A8C    je          00475A99
 00475A8E    mov         eax,ebx
 00475A90    call        TContainedAction.Execute
 00475A95    test        al,al
>00475A97    jne         00475A9D
 00475A99    xor         eax,eax
>00475A9B    jmp         00475A9F
 00475A9D    mov         al,1
 00475A9F    pop         ebx
 00475AA0    ret
*}
end;

//00475AA4
function TCustomAction.GetSecondaryShortCuts:TShortCutList;
begin
{*
 00475AA4    push        ebx
 00475AA5    mov         ebx,eax
 00475AA7    cmp         dword ptr [ebx+90],0
>00475AAE    jne         00475AC2
 00475AB0    mov         dl,1
 00475AB2    mov         eax,[004741D4];TShortCutList
 00475AB7    call        TStringList.Create
 00475ABC    mov         dword ptr [ebx+90],eax
 00475AC2    mov         eax,dword ptr [ebx+90]
 00475AC8    pop         ebx
 00475AC9    ret
*}
end;

//00475ACC
procedure TCustomAction.SetSecondaryShortCuts(const Value:TShortCutList);
begin
{*
 00475ACC    push        ebx
 00475ACD    push        esi
 00475ACE    mov         esi,edx
 00475AD0    mov         ebx,eax
 00475AD2    cmp         dword ptr [ebx+90],0
>00475AD9    jne         00475AED
 00475ADB    mov         dl,1
 00475ADD    mov         eax,[004741D4];TShortCutList
 00475AE2    call        TStringList.Create
 00475AE7    mov         dword ptr [ebx+90],eax
 00475AED    mov         edx,esi
 00475AEF    mov         eax,dword ptr [ebx+90]
 00475AF5    mov         ecx,dword ptr [eax]
 00475AF7    call        dword ptr [ecx+8]
 00475AFA    pop         esi
 00475AFB    pop         ebx
 00475AFC    ret
*}
end;

//00475B00
function TCustomAction.IsSecondaryShortCutsStored:Boolean;
begin
{*
 00475B00    push        ebx
 00475B01    push        esi
 00475B02    mov         ebx,eax
 00475B04    mov         esi,dword ptr [ebx+90]
 00475B0A    test        esi,esi
>00475B0C    je          00475B19
 00475B0E    mov         eax,esi
 00475B10    mov         edx,dword ptr [eax]
 00475B12    call        dword ptr [edx+14]
 00475B15    test        eax,eax
>00475B17    jg          00475B1E
 00475B19    xor         eax,eax
 00475B1B    pop         esi
 00475B1C    pop         ebx
 00475B1D    ret
 00475B1E    mov         al,1
 00475B20    pop         esi
 00475B21    pop         ebx
 00475B22    ret
*}
end;

//00475B24
function TCustomAction.HandleShortCut:Boolean;
begin
{*
 00475B24    push        esi
 00475B25    mov         si,0FFF0
 00475B29    call        @CallDynaInst
 00475B2E    pop         esi
 00475B2F    ret
*}
end;

//00475B30
function TShortCutList.Add(S:string):Integer;
begin
{*
 00475B30    push        ebx
 00475B31    push        esi
 00475B32    push        edi
 00475B33    mov         esi,edx
 00475B35    mov         ebx,eax
 00475B37    mov         edx,esi
 00475B39    mov         eax,ebx
 00475B3B    call        TStringList.Add
 00475B40    mov         edi,eax
 00475B42    mov         eax,esi
 00475B44    call        TextToShortCut
 00475B49    movzx       ecx,ax
 00475B4C    mov         edx,edi
 00475B4E    mov         eax,ebx
 00475B50    mov         ebx,dword ptr [eax]
 00475B52    call        dword ptr [ebx+24]
 00475B55    mov         eax,edi
 00475B57    pop         edi
 00475B58    pop         esi
 00475B59    pop         ebx
 00475B5A    ret
*}
end;

//00475B5C
function TShortCutList.IndexOfShortCut(Shortcut:TShortCut):Integer;
begin
{*
 00475B5C    push        ebx
 00475B5D    push        esi
 00475B5E    push        edi
 00475B5F    push        ebp
 00475B60    push        ecx
 00475B61    mov         ebp,edx
 00475B63    mov         edi,eax
 00475B65    mov         dword ptr [esp],0FFFFFFFF
 00475B6C    mov         eax,edi
 00475B6E    mov         edx,dword ptr [eax]
 00475B70    call        dword ptr [edx+14]
 00475B73    mov         esi,eax
 00475B75    dec         esi
 00475B76    test        esi,esi
>00475B78    jl          00475B94
 00475B7A    inc         esi
 00475B7B    xor         ebx,ebx
 00475B7D    mov         edx,ebx
 00475B7F    mov         eax,edi
 00475B81    mov         ecx,dword ptr [eax]
 00475B83    call        dword ptr [ecx+18]
 00475B86    cmp         bp,ax
>00475B89    jne         00475B90
 00475B8B    mov         dword ptr [esp],ebx
>00475B8E    jmp         00475B94
 00475B90    inc         ebx
 00475B91    dec         esi
>00475B92    jne         00475B7D
 00475B94    mov         eax,dword ptr [esp]
 00475B97    pop         edx
 00475B98    pop         ebp
 00475B99    pop         edi
 00475B9A    pop         esi
 00475B9B    pop         ebx
 00475B9C    ret
*}
end;

Initialization
//007808E4
{*
 007808E4    sub         dword ptr ds:[793188],1
>007808EB    jae         0078090D
 007808ED    mov         edx,dword ptr ds:[47A16C];TControl
 007808F3    mov         eax,[00473DC0];TCustomActionList
 007808F8    call        GroupDescendentsWith
 007808FD    mov         edx,dword ptr ds:[47A16C];TControl
 00780903    mov         eax,[00473848];TContainedAction
 00780908    call        GroupDescendentsWith
 0078090D    ret
*}
Finalization
end.