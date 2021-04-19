//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JvTrayIcon;

interface

uses
  SysUtils, Classes, Graphics, ImgList, Menus;

type
  TBalloonType = (btNone, btError, btInfo, btWarning);
  TNotifyIconDataXP = TNotifyIconDataXP = record//size=3A8
cbSize:Cardinal;//f0
Wnd:Cardinal;//f4
uID:Cardinal;//f8
uFlags:Cardinal;//fC
uCallbackMessage:Cardinal;//f10
hIcon:HICON;//f14
szTip:?;//f18
dwState:Cardinal;//f118
dwStateMask:Cardinal;//f11C
szInfo:?;//f120
uTimeOut:Cardinal;//f320
szInfoTitle:?;//f324
dwInfoFlags:Cardinal;//f3A4
end;;
  TAnimateEvent = procedure(Sender:TObject; const ImageIndex:Integer) of object;;
  TTrayVisibility = (tvVisibleTaskBar, tvVisibleTaskList, tvAutoHide, tvAutoHideIcon, tvVisibleDesign, tvRestoreClick, tvRestoreDbClick, tvMinimizeClick, tvMinimizeDbClick, tvAnimateToTray, tvNoRetryOnFailure);
  TTrayVisibilities = set of TTrayVisibility;
  TJvTrayIconState = (tisTrayIconVisible, tisAnimating, tisHooked, tisHintChanged, tisWaitingForDoubleClick, tisAppHiddenButNotMinimized, tisClicked);
  TJvTrayIconStates = set of TJvTrayIconState;
  TJvTrayIcon = class(TJvComponent)
  published
    function AcceptBalloons:Boolean;//0056E6C4
    procedure BalloonHint(Title:string; Value:string; CancelPrevious:Boolean; ADelay:Cardinal; BalloonType:TBalloonType);//0056E704
    procedure GetIconRect(var IconRect:TRect);//0056EEC8
    procedure HideBalloon;//0056EF88
    destructor Destroy();//0056E64C
    constructor Create(AOwner:TComponent);//0056E574
    procedure ShowApplication;//0056F714
    procedure HideApplication;//0056EEEC
  public
    FCurrentIcon:TIcon;//f38
    FState:TJvTrayIconStates;//f3C
    FStreamedActive:Boolean;//f3D
    FActive:Boolean;//f3E
    FIcon:TIcon;//f40
    FIconData:TNotifyIconDataXP;//f44
    FHandle:Cardinal;//f3EC
    FHint:string;//f3F0
    FPopupMenu:TPopupMenu;//f3F4
    FOnClick:TMouseEvent;//f3F8
    FOnDblClick:TMouseEvent;//f400
    FBalloonCount:Integer;//f408
    FClickedButton:TMouseButton;//f40C
    FClickedShift:TShiftState;//f40D
    FClickedX:Integer;//f410
    FClickedY:Integer;//f414
    FOnMouseMove:TMouseMoveEvent;//f418
    FOnMouseDown:TMouseEvent;//f420
    FOnMouseUp:TMouseEvent;//f428
    FOnContextPopup:TContextPopupEvent;//f430
    FAnimated:Boolean;//f438
    FDelay:Cardinal;//f43C
    FIcons:TCustomImageList;//f440
    FIconIndex:Integer;//f444
    FDropDownMenu:TPopupMenu;//f448
    FTask:Boolean;//f44C
    FOnBalloonHide:TNotifyEvent;//f450
    FOnBalloonShow:TNotifyEvent;//f458
    f45A:word;//f45A
    f45C:dword;//f45C
    FOnBalloonClick:TNotifyEvent;//f460
    FTime:TDateTime;//f468
    FTimeDelay:Integer;//f470
    FOnAnimate:TAnimateEvent;//f478
    FVisibility:TTrayVisibilities;//f480
    f481:byte;//f481
    FSnap:Boolean;//f482
    FSwingDirectionState:Integer;//f484
    FSwingForthAndBack:Boolean;//f488
    destructor Destroy(); virtual;//0056E64C
    procedure Loaded; virtual;//vC//0056F1AC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0056F224
    constructor Create(AOwner:TComponent); virtual;//v2C//0056E574
    procedure HideApplication; virtual;//v34//0056EEEC
    procedure ShowApplication; virtual;//v38//0056F714
    procedure SetActive(Value:Boolean);//0056F310
    procedure SetAnimated(Value:Boolean);//0056F35C
    procedure SetDelay(Value:Cardinal);//0056F3C0
    procedure SetDropDownMenu(Value:TPopupMenu);//0056F42C
    procedure SetHint(Value:string);//0056F438
    procedure SetIcon(Value:TIcon);//0056F50C
    procedure SetIconIndex(Value:Integer);//0056F518
    procedure SetIcons(Value:TCustomImageList);//0056F52C
    procedure SetPopupMenu(Value:TPopupMenu);//0056F560
    procedure SetVisibility(Value:TTrayVisibilities);//0056F624
  end;
  TExtraData = TExtraData = record//size=8
Wnd:Cardinal;//f0
uID:Cardinal;//f4
end;;
  TTrayIconEnumerator = class(TObject)
  published
    function MoveNext:Boolean;//0056FEC0
    //function ReadProcessMemory(Address:Pointer; Count:Cardinal; var Buffer:?):Boolean;//0056FF30
    destructor Destroy();//0056FE04
    constructor sub_0056FDBC;//0056FDBC
    constructor Create(DataSize:Integer);//0056FD68
  public
    FToolbarHandle:Cardinal;//f4
    FProcess:Cardinal;//f8
    FCount:Integer;//fC
    FData:Pointer;//f10
    FIndex:Integer;//f14
    FButton:_TBBUTTON;//f18
    FExtraData:TExtraData;//f2C
    f30:Cardinal;//f30
  end;
    //function sub_0056E2DC:?;//0056E2DC
    //function sub_0056E318:?;//0056E318
    //function sub_0056E32C:?;//0056E32C
    procedure sub_0056E388(?:HWND);//0056E388
    procedure sub_0056E3C4(?:HWND);//0056E3C4
    //function sub_0056E464:?;//0056E464
    //function sub_0056E488(?:Cardinal; ?:?; ?:TRect):?;//0056E488
    procedure sub_0056EE50(?:TJvTrayIcon);//0056EE50
    //function sub_0056EE6C(?:TJvTrayIcon):?;//0056EE6C
    //function sub_0056EEE4:?;//0056EEE4
    procedure sub_0056EFB4(?:TJvTrayIcon);//0056EFB4
    procedure sub_0056EFDC(?:TJvTrayIcon);//0056EFDC
    procedure sub_0056F00C(?:TJvTrayIcon);//0056F00C
    procedure sub_0056F0D0(?:TJvTrayIcon);//0056F0D0
    procedure Loaded;//0056F1AC
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0056F224
    //function sub_0056F274(?:TJvTrayIcon; ?:?; ?:?):?;//0056F274
    //procedure sub_0056F390(?:?);//0056F390
    //procedure sub_0056F56C(?:TJvTrayIcon; ?:?);//0056F56C
    procedure sub_0056F850(?:TJvTrayIcon);//0056F850
    procedure sub_0056F8C8(?:TJvTrayIcon);//0056F8C8
    procedure sub_0056F908(?:TJvTrayIcon);//0056F908
    procedure sub_0056F91C(?:TJvTrayIcon);//0056F91C
    procedure sub_0056FE50(?:TTrayIconEnumerator; ?:Integer);//0056FE50

implementation

//0056E2DC
{*function sub_0056E2DC:?;
begin
 0056E2DC    mov         eax,[0078D590];^Application:TApplication
 0056E2E1    mov         eax,dword ptr [eax]
 0056E2E3    cmp         byte ptr [eax+0D3],0;TApplication.FMainFormOnTaskBar:Boolean
>0056E2EA    je          0056E309
 0056E2EC    mov         eax,[0078D590];^Application:TApplication
 0056E2F1    mov         eax,dword ptr [eax]
 0056E2F3    cmp         dword ptr [eax+44],0;TApplication.FMainForm:TForm
>0056E2F7    je          0056E309
 0056E2F9    mov         eax,[0078D590];^Application:TApplication
 0056E2FE    mov         eax,dword ptr [eax]
 0056E300    mov         eax,dword ptr [eax+44];TApplication.FMainForm:TForm
 0056E303    call        TWinControl.GetHandle
 0056E308    ret
 0056E309    mov         eax,[0078D590];^Application:TApplication
 0056E30E    mov         eax,dword ptr [eax]
 0056E310    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0056E316    ret
end;*}

//0056E318
{*function sub_0056E318:?;
begin
 0056E318    call        0056E2DC
 0056E31D    push        eax
 0056E31E    call        user32.IsIconic
 0056E323    cmp         eax,1
 0056E326    sbb         eax,eax
 0056E328    inc         eax
 0056E329    ret
end;*}

//0056E32C
{*function sub_0056E32C:?;
begin
 0056E32C    push        0
 0056E32E    push        56E350;'Shell_TrayWnd'
 0056E333    call        user32.FindWindowW
 0056E338    test        eax,eax
>0056E33A    je          0056E34C
 0056E33C    push        0
 0056E33E    push        56E36C;'TrayNotifyWnd'
 0056E343    push        0
 0056E345    push        eax
 0056E346    call        user32.FindWindowExW
 0056E34B    ret
 0056E34C    xor         eax,eax
 0056E34E    ret
end;*}

//0056E388
procedure sub_0056E388(?:HWND);
begin
{*
 0056E388    push        ebx
 0056E389    push        esi
 0056E38A    add         esp,0FFFFFFE0
 0056E38D    mov         esi,eax
 0056E38F    call        0056E32C
 0056E394    mov         ebx,eax
 0056E396    test        ebx,ebx
>0056E398    je          0056E3BE
 0056E39A    push        esp
 0056E39B    push        esi
 0056E39C    call        user32.GetWindowRect
 0056E3A1    lea         eax,[esp+10]
 0056E3A5    push        eax
 0056E3A6    push        ebx
 0056E3A7    call        user32.GetWindowRect
 0056E3AC    lea         eax,[esp+10]
 0056E3B0    push        eax
 0056E3B1    lea         eax,[esp+4]
 0056E3B5    push        eax
 0056E3B6    push        3
 0056E3B8    push        esi
 0056E3B9    call        user32.DrawAnimatedRects
 0056E3BE    add         esp,20
 0056E3C1    pop         esi
 0056E3C2    pop         ebx
 0056E3C3    ret
*}
end;

//0056E3C4
procedure sub_0056E3C4(?:HWND);
begin
{*
 0056E3C4    push        ebx
 0056E3C5    add         esp,0FFFFFFE0
 0056E3C8    mov         ebx,eax
 0056E3CA    call        0056E32C
 0056E3CF    test        eax,eax
>0056E3D1    je          0056E3F7
 0056E3D3    push        esp
 0056E3D4    push        eax
 0056E3D5    call        user32.GetWindowRect
 0056E3DA    lea         eax,[esp+10]
 0056E3DE    push        eax
 0056E3DF    push        ebx
 0056E3E0    call        user32.GetWindowRect
 0056E3E5    lea         eax,[esp+10]
 0056E3E9    push        eax
 0056E3EA    lea         eax,[esp+4]
 0056E3EE    push        eax
 0056E3EF    push        3
 0056E3F1    push        ebx
 0056E3F2    call        user32.DrawAnimatedRects
 0056E3F7    add         esp,20
 0056E3FA    pop         ebx
 0056E3FB    ret
*}
end;

//0056E464
{*function sub_0056E464:?;
begin
 0056E464    push        ecx
 0056E465    xor         eax,eax
 0056E467    mov         dword ptr [esp],eax
 0056E46A    call        0056E32C
 0056E46F    test        eax,eax
>0056E471    je          0056E481
 0056E473    mov         edx,esp
 0056E475    push        edx
 0056E476    push        56E3FC
 0056E47B    push        eax
 0056E47C    call        user32.EnumChildWindows
 0056E481    mov         eax,dword ptr [esp]
 0056E484    pop         edx
 0056E485    ret
end;*}

//0056E488
{*function sub_0056E488(?:Cardinal; ?:?; ?:TRect):?;
begin
 0056E488    push        ebp
 0056E489    mov         ebp,esp
 0056E48B    add         esp,0FFFFFFF8
 0056E48E    push        ebx
 0056E48F    push        esi
 0056E490    push        edi
 0056E491    mov         ebx,ecx
 0056E493    mov         edi,edx
 0056E495    mov         esi,eax
 0056E497    mov         byte ptr [ebp-1],0
 0056E49B    mov         ecx,10
 0056E4A0    mov         dl,1
 0056E4A2    mov         eax,[0056DF50];TTrayIconEnumerator
 0056E4A7    call        TTrayIconEnumerator.Create;TTrayIconEnumerator.Create
 0056E4AC    mov         dword ptr [ebp-8],eax
 0056E4AF    xor         eax,eax
 0056E4B1    push        ebp
 0056E4B2    push        56E562
 0056E4B7    push        dword ptr fs:[eax]
 0056E4BA    mov         dword ptr fs:[eax],esp
>0056E4BD    jmp         0056E53C
 0056E4BF    mov         eax,dword ptr [ebp-8]
 0056E4C2    cmp         esi,dword ptr [eax+2C];TTrayIconEnumerator.FExtraData:TExtraData
>0056E4C5    jne         0056E53C
 0056E4C7    mov         eax,dword ptr [ebp-8]
 0056E4CA    cmp         edi,dword ptr [eax+30];TTrayIconEnumerator.?f30:Cardinal
>0056E4CD    jne         0056E53C
 0056E4CF    mov         eax,dword ptr [ebp-8]
 0056E4D2    test        byte ptr [eax+20],8;TTrayIconEnumerator.FButton.fsState:Byte
>0056E4D6    je          0056E4E2
 0056E4D8    call        @TryFinallyExit
>0056E4DD    jmp         0056E569
 0056E4E2    mov         eax,dword ptr [ebp-8]
 0056E4E5    mov         eax,dword ptr [eax+10];TTrayIconEnumerator.FData:Pointer
 0056E4E8    push        eax
 0056E4E9    mov         eax,dword ptr [ebp-8]
 0056E4EC    mov         eax,dword ptr [eax+14];TTrayIconEnumerator.FIndex:Integer
 0056E4EF    push        eax
 0056E4F0    push        41D
 0056E4F5    mov         eax,dword ptr [ebp-8]
 0056E4F8    mov         eax,dword ptr [eax+4];TTrayIconEnumerator.FToolbarHandle:Cardinal
 0056E4FB    push        eax
 0056E4FC    call        user32.SendMessageW
 0056E501    push        ebx
 0056E502    mov         eax,dword ptr [ebp-8]
 0056E505    mov         edx,dword ptr [eax+10];TTrayIconEnumerator.FData:Pointer
 0056E508    mov         ecx,10
 0056E50D    mov         eax,dword ptr [ebp-8]
 0056E510    call        TTrayIconEnumerator.ReadProcessMemory
 0056E515    test        al,al
>0056E517    jne         0056E520
 0056E519    call        @TryFinallyExit
>0056E51E    jmp         0056E569
 0056E520    push        2
 0056E522    push        ebx
 0056E523    push        0
 0056E525    mov         eax,dword ptr [ebp-8]
 0056E528    mov         eax,dword ptr [eax+4];TTrayIconEnumerator.FToolbarHandle:Cardinal
 0056E52B    push        eax
 0056E52C    call        user32.MapWindowPoints
 0056E531    mov         byte ptr [ebp-1],1
 0056E535    call        @TryFinallyExit
>0056E53A    jmp         0056E569
 0056E53C    mov         eax,dword ptr [ebp-8]
 0056E53F    call        TTrayIconEnumerator.MoveNext
 0056E544    test        al,al
>0056E546    jne         0056E4BF
 0056E54C    xor         eax,eax
 0056E54E    pop         edx
 0056E54F    pop         ecx
 0056E550    pop         ecx
 0056E551    mov         dword ptr fs:[eax],edx
 0056E554    push        56E569
 0056E559    mov         eax,dword ptr [ebp-8]
 0056E55C    call        TObject.Free
 0056E561    ret
>0056E562    jmp         @HandleFinally
>0056E567    jmp         0056E559
 0056E569    movzx       eax,byte ptr [ebp-1]
 0056E56D    pop         edi
 0056E56E    pop         esi
 0056E56F    pop         ebx
 0056E570    pop         ecx
 0056E571    pop         ecx
 0056E572    pop         ebp
 0056E573    ret
end;*}

//0056E574
constructor TJvTrayIcon.Create(AOwner:TComponent);
begin
{*
 0056E574    push        ebp
 0056E575    mov         ebp,esp
 0056E577    push        ecx
 0056E578    push        ebx
 0056E579    push        esi
 0056E57A    test        dl,dl
>0056E57C    je          0056E586
 0056E57E    add         esp,0FFFFFFF0
 0056E581    call        @ClassCreate
 0056E586    mov         byte ptr [ebp-1],dl
 0056E589    mov         ebx,eax
 0056E58B    xor         edx,edx
 0056E58D    mov         eax,ebx
 0056E58F    call        TComponent.Create
 0056E594    mov         dl,1
 0056E596    mov         eax,[00464454];TIcon
 0056E59B    call        TIcon.Create;TIcon.Create
 0056E5A0    mov         esi,eax
 0056E5A2    mov         dword ptr [ebx+40],esi;TJvTrayIcon.FIcon:TIcon
 0056E5A5    mov         dword ptr [esi+14],ebx;TIcon.?f14:TJvTrayIcon
 0056E5A8    mov         dword ptr [esi+10],56F004;TIcon.FOnChange:TNotifyEvent
 0056E5AF    mov         dl,1
 0056E5B1    mov         eax,[00464454];TIcon
 0056E5B6    call        TIcon.Create;TIcon.Create
 0056E5BB    mov         dword ptr [ebx+38],eax;TJvTrayIcon.FCurrentIcon:TIcon
 0056E5BE    mov         byte ptr [ebx+482],0;TJvTrayIcon.FSnap:Boolean
 0056E5C5    push        ebx
 0056E5C6    push        56F940
 0056E5CB    xor         eax,eax
 0056E5CD    call        0056CCAC
 0056E5D2    mov         dword ptr [ebx+3EC],eax;TJvTrayIcon.FHandle:Cardinal
 0056E5D8    movzx       eax,byte ptr ds:[56E644];0x0 gvar_0056E644
 0056E5DF    mov         byte ptr [ebx+3C],al;TJvTrayIcon.FState:TJvTrayIconStates
 0056E5E2    movzx       eax,word ptr ds:[56E648];0x7 gvar_0056E648
 0056E5E9    mov         word ptr [ebx+480],ax;TJvTrayIcon.FVisibility:TTrayVisibilities
 0056E5F0    mov         byte ptr [ebx+438],0;TJvTrayIcon.FAnimated:Boolean
 0056E5F7    mov         dword ptr [ebx+43C],64;TJvTrayIcon.FDelay:Cardinal
 0056E601    xor         eax,eax
 0056E603    mov         dword ptr [ebx+444],eax;TJvTrayIcon.FIconIndex:Integer
 0056E609    xor         eax,eax
 0056E60B    mov         dword ptr [ebx+408],eax;TJvTrayIcon.FBalloonCount:Integer
 0056E611    mov         byte ptr [ebx+3E],0;TJvTrayIcon.FActive:Boolean
 0056E615    mov         byte ptr [ebx+44C],1;TJvTrayIcon.FTask:Boolean
 0056E61C    mov         dword ptr [ebx+484],1;TJvTrayIcon.FSwingDirectionState:Integer
 0056E626    mov         eax,ebx
 0056E628    cmp         byte ptr [ebp-1],0
>0056E62C    je          0056E63D
 0056E62E    call        @AfterConstruction
 0056E633    pop         dword ptr fs:[0]
 0056E63A    add         esp,0C
 0056E63D    mov         eax,ebx
 0056E63F    pop         esi
 0056E640    pop         ebx
 0056E641    pop         ecx
 0056E642    pop         ebp
 0056E643    ret
*}
end;

//0056E64C
destructor TJvTrayIcon.Destroy();
begin
{*
 0056E64C    push        ebx
 0056E64D    push        esi
 0056E64E    call        @BeforeDestruction
 0056E653    mov         ebx,edx
 0056E655    mov         esi,eax
 0056E657    mov         edx,3
 0056E65C    mov         eax,esi
 0056E65E    call        0056F908
 0056E663    mov         edx,2
 0056E668    mov         eax,esi
 0056E66A    call        0056F908
 0056E66F    xor         edx,edx
 0056E671    mov         eax,esi
 0056E673    call        TJvTrayIcon.SetActive
 0056E678    mov         eax,[0078D590];^Application:TApplication
 0056E67D    mov         eax,dword ptr [eax]
 0056E67F    test        byte ptr [eax+1C],8;TApplication.FComponentState:TComponentState
>0056E683    jne         0056E68E
 0056E685    xor         edx,edx
 0056E687    mov         eax,esi
 0056E689    call        0056F56C
 0056E68E    mov         eax,dword ptr [esi+40];TJvTrayIcon.FIcon:TIcon
 0056E691    call        TObject.Free
 0056E696    mov         eax,dword ptr [esi+38];TJvTrayIcon.FCurrentIcon:TIcon
 0056E699    call        TObject.Free
 0056E69E    mov         eax,dword ptr [esi+3EC];TJvTrayIcon.FHandle:Cardinal
 0056E6A4    call        0056CD90
 0056E6A9    mov         edx,ebx
 0056E6AB    and         dl,0FC
 0056E6AE    mov         eax,esi
 0056E6B0    call        TComponent.Destroy
 0056E6B5    test        bl,bl
>0056E6B7    jle         0056E6C0
 0056E6B9    mov         eax,esi
 0056E6BB    call        @ClassDestroy
 0056E6C0    pop         esi
 0056E6C1    pop         ebx
 0056E6C2    ret
*}
end;

//0056E6C4
function TJvTrayIcon.AcceptBalloons:Boolean;
begin
{*
 0056E6C4    call        005401E0
 0056E6C9    cmp         eax,50000
 0056E6CE    setae       al
 0056E6D1    ret
*}
end;

//0056E704
procedure TJvTrayIcon.BalloonHint(Title:string; Value:string; CancelPrevious:Boolean; ADelay:Cardinal; BalloonType:TBalloonType);
begin
{*
 0056E704    push        ebp
 0056E705    mov         ebp,esp
 0056E707    add         esp,0FFFFFFF8
 0056E70A    push        ebx
 0056E70B    push        esi
 0056E70C    mov         dword ptr [ebp-8],ecx
 0056E70F    mov         dword ptr [ebp-4],edx
 0056E712    mov         ebx,eax
 0056E714    mov         esi,dword ptr [ebp+0C]
 0056E717    mov         eax,dword ptr [ebp-4]
 0056E71A    call        @UStrAddRef
 0056E71F    mov         eax,dword ptr [ebp-8]
 0056E722    call        @UStrAddRef
 0056E727    xor         eax,eax
 0056E729    push        ebp
 0056E72A    push        56E854
 0056E72F    push        dword ptr fs:[eax]
 0056E732    mov         dword ptr fs:[eax],esp
 0056E735    test        byte ptr [ebx+3C],1;TJvTrayIcon.FState:TJvTrayIconStates
>0056E739    je          0056E839
 0056E73F    mov         eax,ebx
 0056E741    call        TJvTrayIcon.AcceptBalloons
 0056E746    test        al,al
>0056E748    je          0056E839
 0056E74E    call        Now
 0056E753    fstp        qword ptr [ebx+468];TJvTrayIcon.FTime:TDateTime
 0056E759    wait
 0056E75A    mov         eax,esi
 0056E75C    mov         ecx,3E8
 0056E761    xor         edx,edx
 0056E763    div         eax,ecx
 0056E765    mov         dword ptr [ebx+470],eax;TJvTrayIcon.FTimeDelay:Integer
 0056E76B    cmp         byte ptr [ebp+8],0
>0056E76F    je          0056E778
 0056E771    mov         eax,ebx
 0056E773    call        TJvTrayIcon.HideBalloon
 0056E778    lea         eax,[ebx+44];TJvTrayIcon.FIconData:TNotifyIconDataXP
 0056E77B    add         eax,324
 0056E780    mov         ecx,7F
 0056E785    mov         edx,dword ptr [ebp-4]
 0056E788    call        StrPLCopy
 0056E78D    lea         eax,[ebx+44];TJvTrayIcon.FIconData:TNotifyIconDataXP
 0056E790    add         eax,120
 0056E795    mov         ecx,1FF
 0056E79A    mov         edx,dword ptr [ebp-8]
 0056E79D    call        StrPLCopy
 0056E7A2    mov         dword ptr [ebx+364],esi
 0056E7A8    movzx       eax,byte ptr [ebp+10]
 0056E7AC    mov         eax,dword ptr [eax*4+789928]
 0056E7B3    mov         dword ptr [ebx+3E8],eax
 0056E7B9    mov         ecx,1
 0056E7BE    mov         edx,10
 0056E7C3    mov         eax,ebx
 0056E7C5    call        0056F274
 0056E7CA    test        al,al
>0056E7CC    je          0056E839
 0056E7CE    cmp         dword ptr [ebp-4],0
>0056E7D2    jne         0056E7F3
 0056E7D4    cmp         dword ptr [ebp-8],0
>0056E7D8    jne         0056E7F3
 0056E7DA    dec         dword ptr [ebx+408];TJvTrayIcon.FBalloonCount:Integer
 0056E7E0    cmp         dword ptr [ebx+408],0;TJvTrayIcon.FBalloonCount:Integer
>0056E7E7    jge         0056E7F9
 0056E7E9    xor         eax,eax
 0056E7EB    mov         dword ptr [ebx+408],eax;TJvTrayIcon.FBalloonCount:Integer
>0056E7F1    jmp         0056E7F9
 0056E7F3    inc         dword ptr [ebx+408];TJvTrayIcon.FBalloonCount:Integer
 0056E7F9    mov         eax,ebx
 0056E7FB    call        0056EEE4
 0056E800    cmp         esi,eax
>0056E802    jae         0056E821
 0056E804    cmp         dword ptr [ebp-4],0
>0056E808    jne         0056E810
 0056E80A    cmp         dword ptr [ebp-8],0
>0056E80E    je          0056E821
 0056E810    push        0
 0056E812    push        esi
 0056E813    push        2
 0056E815    mov         eax,dword ptr [ebx+3EC];TJvTrayIcon.FHandle:Cardinal
 0056E81B    push        eax
 0056E81C    call        user32.SetTimer
 0056E821    cmp         word ptr [ebx+45A],0;TJvTrayIcon.?f45A:word
>0056E829    je          0056E839
 0056E82B    mov         edx,ebx
 0056E82D    mov         eax,dword ptr [ebx+45C];TJvTrayIcon.?f45C:dword
 0056E833    call        dword ptr [ebx+458];TJvTrayIcon.FOnBalloonShow
 0056E839    xor         eax,eax
 0056E83B    pop         edx
 0056E83C    pop         ecx
 0056E83D    pop         ecx
 0056E83E    mov         dword ptr fs:[eax],edx
 0056E841    push        56E85B
 0056E846    lea         eax,[ebp-8]
 0056E849    mov         edx,2
 0056E84E    call        @UStrArrayClr
 0056E853    ret
>0056E854    jmp         @HandleFinally
>0056E859    jmp         0056E846
 0056E85B    pop         esi
 0056E85C    pop         ebx
 0056E85D    pop         ecx
 0056E85E    pop         ecx
 0056E85F    pop         ebp
 0056E860    ret         0C
*}
end;

//0056EE50
procedure sub_0056EE50(?:TJvTrayIcon);
begin
{*
 0056EE50    push        ebx
 0056EE51    mov         ebx,eax
 0056EE53    test        byte ptr [ebx+3C],2
>0056EE57    je          0056EE69
 0056EE59    and         byte ptr [ebx+3C],0FD
 0056EE5D    mov         edx,1
 0056EE62    mov         eax,ebx
 0056EE64    call        0056F908
 0056EE69    pop         ebx
 0056EE6A    ret
*}
end;

//0056EE6C
{*function sub_0056EE6C(?:TJvTrayIcon):?;
begin
 0056EE6C    push        ebx
 0056EE6D    push        esi
 0056EE6E    mov         esi,eax
 0056EE70    test        byte ptr [esi+3C],20
>0056EE74    jne         0056EE7F
 0056EE76    call        0056E318
 0056EE7B    test        al,al
>0056EE7D    je          0056EE83
 0056EE7F    xor         ebx,ebx
>0056EE81    jmp         0056EE85
 0056EE83    mov         bl,1
 0056EE85    test        bl,bl
>0056EE87    je          0056EEC3
 0056EE89    cmp         byte ptr [esi+482],0
>0056EE90    jne         0056EE9B
 0056EE92    test        byte ptr [esi+481],2
>0056EE99    je          0056EEC3
 0056EE9B    mov         eax,[0078D590];^Application:TApplication
 0056EEA0    mov         eax,dword ptr [eax]
 0056EEA2    cmp         byte ptr [eax+0D3],0;TApplication.FMainFormOnTaskBar:Boolean
>0056EEA9    je          0056EEC3
 0056EEAB    mov         eax,[0078D590];^Application:TApplication
 0056EEB0    mov         eax,dword ptr [eax]
 0056EEB2    call        TApplication.GetMainFormHandle
 0056EEB7    push        eax
 0056EEB8    call        user32.IsWindowVisible
 0056EEBD    test        eax,eax
>0056EEBF    jne         0056EEC3
 0056EEC1    xor         ebx,ebx
 0056EEC3    mov         eax,ebx
 0056EEC5    pop         esi
 0056EEC6    pop         ebx
 0056EEC7    ret
end;*}

//0056EEC8
procedure TJvTrayIcon.GetIconRect(var IconRect:TRect);
begin
{*
 0056EEC8    mov         ecx,edx
 0056EECA    mov         eax,dword ptr [eax+3EC];TJvTrayIcon.FHandle:Cardinal
 0056EED0    mov         edx,1
 0056EED5    call        0056E488
 0056EEDA    ret
*}
end;

//0056EEE4
{*function sub_0056EEE4:?;
begin
 0056EEE4    mov         eax,2710
 0056EEE9    ret
end;*}

//0056EEEC
procedure TJvTrayIcon.HideApplication;
begin
{*
 0056EEEC    push        ebx
 0056EEED    push        esi
 0056EEEE    mov         ebx,eax
 0056EEF0    mov         eax,ebx
 0056EEF2    call        0056EE6C
 0056EEF7    test        al,al
>0056EEF9    je          0056EF5D
 0056EEFB    cmp         byte ptr [ebx+482],0;TJvTrayIcon.FSnap:Boolean
>0056EF02    jne         0056EF0D
 0056EF04    test        byte ptr [ebx+481],2;TJvTrayIcon.?f481:byte
>0056EF0B    je          0056EF51
 0056EF0D    mov         eax,[0078D590];^Application:TApplication
 0056EF12    mov         eax,dword ptr [eax]
 0056EF14    mov         esi,dword ptr [eax+44];TApplication.FMainForm:TForm
 0056EF17    test        esi,esi
>0056EF19    je          0056EF46
 0056EF1B    test        byte ptr [ebx+481],2;TJvTrayIcon.?f481:byte
>0056EF22    je          0056EF35
 0056EF24    mov         eax,[0078D590];^Application:TApplication
 0056EF29    mov         eax,esi
 0056EF2B    call        TWinControl.GetHandle
 0056EF30    call        0056E388
 0056EF35    mov         eax,[0078D590];^Application:TApplication
 0056EF3A    mov         eax,dword ptr [eax]
 0056EF3C    mov         eax,dword ptr [eax+44];TApplication.FMainForm:TForm
 0056EF3F    xor         edx,edx
 0056EF41    call        TCustomForm.SetVisible
 0056EF46    mov         eax,[0078D590];^Application:TApplication
 0056EF4B    mov         eax,dword ptr [eax]
 0056EF4D    mov         byte ptr [eax+5B],0;TApplication.FShowMainForm:Boolean
 0056EF51    mov         eax,[0078D590];^Application:TApplication
 0056EF56    mov         eax,dword ptr [eax]
 0056EF58    call        TApplication.Minimize
 0056EF5D    push        0
 0056EF5F    call        0056E2DC
 0056EF64    push        eax
 0056EF65    call        user32.ShowWindow
 0056EF6A    and         word ptr [ebx+480],0FFFFFFFE;TJvTrayIcon.FVisibility:TTrayVisibilities
 0056EF72    test        byte ptr [ebx+480],8;TJvTrayIcon.FVisibility:TTrayVisibilities
>0056EF79    je          0056EF82
 0056EF7B    mov         eax,ebx
 0056EF7D    call        0056F850
 0056EF82    pop         esi
 0056EF83    pop         ebx
 0056EF84    ret
*}
end;

//0056EF88
procedure TJvTrayIcon.HideBalloon;
begin
{*
 0056EF88    push        ebx
 0056EF89    push        esi
 0056EF8A    mov         esi,eax
 0056EF8C    mov         ebx,dword ptr [esi+408];TJvTrayIcon.FBalloonCount:Integer
 0056EF92    test        ebx,ebx
>0056EF94    jl          0056EFAE
 0056EF96    inc         ebx
 0056EF97    push        0
 0056EF99    push        1388
 0056EF9E    push        0
 0056EFA0    xor         ecx,ecx
 0056EFA2    xor         edx,edx
 0056EFA4    mov         eax,esi
 0056EFA6    call        TJvTrayIcon.BalloonHint
 0056EFAB    dec         ebx
>0056EFAC    jne         0056EF97
 0056EFAE    pop         esi
 0056EFAF    pop         ebx
 0056EFB0    ret
*}
end;

//0056EFB4
procedure sub_0056EFB4(?:TJvTrayIcon);
begin
{*
 0056EFB4    push        ebx
 0056EFB5    mov         ebx,eax
 0056EFB7    test        byte ptr [ebx+3C],1
>0056EFBB    je          0056EFDA
 0056EFBD    mov         eax,ebx
 0056EFBF    call        0056EE50
 0056EFC4    mov         ecx,2
 0056EFC9    xor         edx,edx
 0056EFCB    mov         eax,ebx
 0056EFCD    call        0056F274
 0056EFD2    test        al,al
>0056EFD4    je          0056EFDA
 0056EFD6    and         byte ptr [ebx+3C],0FE
 0056EFDA    pop         ebx
 0056EFDB    ret
*}
end;

//0056EFDC
procedure sub_0056EFDC(?:TJvTrayIcon);
begin
{*
 0056EFDC    push        ebx
 0056EFDD    mov         ebx,eax
 0056EFDF    test        byte ptr [ebx+3C],4
>0056EFE3    jne         0056F001
 0056EFE5    test        byte ptr [ebx+1C],10
>0056EFE9    jne         0056F001
 0056EFEB    or          byte ptr [ebx+3C],4
 0056EFEF    push        ebx
 0056EFF0    push        56E6D4
 0056EFF5    mov         eax,[0078D590];^Application:TApplication
 0056EFFA    mov         eax,dword ptr [eax]
 0056EFFC    call        TApplication.HookMainWindow
 0056F001    pop         ebx
 0056F002    ret
*}
end;

//0056F00C
procedure sub_0056F00C(?:TJvTrayIcon);
begin
{*
 0056F00C    push        ebp
 0056F00D    mov         ebp,esp
 0056F00F    push        ecx
 0056F010    push        ebx
 0056F011    push        esi
 0056F012    mov         ebx,eax
 0056F014    test        byte ptr [ebx+1C],1
>0056F018    jne         0056F0CA
 0056F01E    mov         esi,dword ptr [ebx+440]
 0056F024    test        esi,esi
>0056F026    je          0056F098
 0056F028    cmp         dword ptr [ebx+444],0
>0056F02F    jl          0056F098
 0056F031    mov         eax,esi
 0056F033    call        TCustomImageList.GetCount
 0056F038    cmp         eax,dword ptr [ebx+444]
>0056F03E    jle         0056F098
 0056F040    mov         dl,1
 0056F042    mov         eax,[00464454];TIcon
 0056F047    call        TIcon.Create;TIcon.Create
 0056F04C    mov         dword ptr [ebp-4],eax
 0056F04F    xor         eax,eax
 0056F051    push        ebp
 0056F052    push        56F091
 0056F057    push        dword ptr fs:[eax]
 0056F05A    mov         dword ptr fs:[eax],esp
 0056F05D    mov         edx,dword ptr [ebx+444]
 0056F063    mov         eax,dword ptr [ebx+440]
 0056F069    mov         ecx,dword ptr [ebp-4]
 0056F06C    call        TCustomImageList.GetIcon
 0056F071    mov         edx,dword ptr [ebp-4]
 0056F074    mov         eax,ebx
 0056F076    call        0056F390
 0056F07B    xor         eax,eax
 0056F07D    pop         edx
 0056F07E    pop         ecx
 0056F07F    pop         ecx
 0056F080    mov         dword ptr fs:[eax],edx
 0056F083    push        56F0CA
 0056F088    mov         eax,dword ptr [ebp-4]
 0056F08B    call        TObject.Free
 0056F090    ret
>0056F091    jmp         @HandleFinally
>0056F096    jmp         0056F088
 0056F098    mov         esi,dword ptr [ebx+40]
 0056F09B    test        esi,esi
>0056F09D    je          0056F0B6
 0056F09F    mov         eax,esi
 0056F0A1    mov         edx,dword ptr [eax]
 0056F0A3    call        dword ptr [edx+20]
 0056F0A6    test        al,al
>0056F0A8    jne         0056F0B6
 0056F0AA    mov         edx,dword ptr [ebx+40]
 0056F0AD    mov         eax,ebx
 0056F0AF    call        0056F390
>0056F0B4    jmp         0056F0CA
 0056F0B6    mov         eax,[0078D590];^Application:TApplication
 0056F0BB    mov         eax,dword ptr [eax]
 0056F0BD    mov         edx,dword ptr [eax+0A0];TApplication.FIcon:TIcon
 0056F0C3    mov         eax,ebx
 0056F0C5    call        0056F390
 0056F0CA    pop         esi
 0056F0CB    pop         ebx
 0056F0CC    pop         ecx
 0056F0CD    pop         ebp
 0056F0CE    ret
*}
end;

//0056F0D0
procedure sub_0056F0D0(?:TJvTrayIcon);
begin
{*
 0056F0D0    push        ebp
 0056F0D1    mov         ebp,esp
 0056F0D3    push        0
 0056F0D5    push        ebx
 0056F0D6    push        esi
 0056F0D7    mov         esi,eax
 0056F0D9    xor         eax,eax
 0056F0DB    push        ebp
 0056F0DC    push        56F19F
 0056F0E1    push        dword ptr fs:[eax]
 0056F0E4    mov         dword ptr fs:[eax],esp
 0056F0E7    lea         ebx,[esi+44]
 0056F0EA    call        005401E0
 0056F0EF    cmp         eax,50000
>0056F0F4    jb          0056F108
 0056F0F6    mov         dword ptr [ebx],3A8
 0056F0FC    mov         dword ptr [esi+364],3
>0056F106    jmp         0056F10E
 0056F108    mov         dword ptr [ebx],3BC
 0056F10E    mov         eax,dword ptr [esi+3EC]
 0056F114    mov         dword ptr [ebx+4],eax
 0056F117    mov         dword ptr [ebx+8],1
 0056F11E    mov         dword ptr [ebx+10],401
 0056F125    mov         eax,dword ptr [esi+38]
 0056F128    mov         edx,dword ptr [eax]
 0056F12A    call        dword ptr [edx+20]
 0056F12D    test        al,al
>0056F12F    jne         0056F13E
 0056F131    mov         eax,dword ptr [esi+38]
 0056F134    call        TIcon.GetHandle
 0056F139    mov         dword ptr [ebx+14],eax
>0056F13C    jmp         0056F152
 0056F13E    mov         eax,[0078D590];^Application:TApplication
 0056F143    mov         eax,dword ptr [eax]
 0056F145    mov         edx,dword ptr [eax+0A0];TApplication.FIcon:TIcon
 0056F14B    mov         eax,esi
 0056F14D    call        0056F390
 0056F152    lea         edx,[ebp-4]
 0056F155    mov         eax,dword ptr [esi+3F0]
 0056F15B    call        GetShortHint
 0056F160    mov         eax,dword ptr [ebp-4]
 0056F163    push        eax
 0056F164    call        005401E0
 0056F169    cmp         eax,50000
 0056F16E    setae       al
 0056F171    and         eax,7F
 0056F174    mov         ecx,dword ptr [eax*4+78991C]
 0056F17B    lea         eax,[ebx+18]
 0056F17E    pop         edx
 0056F17F    call        StrPLCopy
 0056F184    xor         eax,eax
 0056F186    mov         dword ptr [ebx+0C],eax
 0056F189    xor         eax,eax
 0056F18B    pop         edx
 0056F18C    pop         ecx
 0056F18D    pop         ecx
 0056F18E    mov         dword ptr fs:[eax],edx
 0056F191    push        56F1A6
 0056F196    lea         eax,[ebp-4]
 0056F199    call        @UStrClr
 0056F19E    ret
>0056F19F    jmp         @HandleFinally
>0056F1A4    jmp         0056F196
 0056F1A6    pop         esi
 0056F1A7    pop         ebx
 0056F1A8    pop         ecx
 0056F1A9    pop         ebp
 0056F1AA    ret
*}
end;

//0056F1AC
procedure TJvTrayIcon.Loaded;
begin
{*
 0056F1AC    push        ebx
 0056F1AD    mov         ebx,eax
 0056F1AF    mov         eax,ebx
 0056F1B1    call        TComponent.Loaded
 0056F1B6    mov         eax,ebx
 0056F1B8    call        0056F00C
 0056F1BD    cmp         byte ptr [ebx+3D],0;TJvTrayIcon.FStreamedActive:Boolean
>0056F1C1    je          0056F21F
 0056F1C3    mov         dl,1
 0056F1C5    mov         eax,ebx
 0056F1C7    call        TJvTrayIcon.SetActive
 0056F1CC    test        byte ptr [ebx+1C],10;TJvTrayIcon.FComponentState:TComponentState
>0056F1D0    jne         0056F21F
 0056F1D2    test        byte ptr [ebx+480],1;TJvTrayIcon.FVisibility:TTrayVisibilities
>0056F1D9    jne         0056F20D
 0056F1DB    mov         eax,[0078D590];^Application:TApplication
 0056F1E0    mov         eax,dword ptr [eax]
 0056F1E2    mov         byte ptr [eax+5B],0;TApplication.FShowMainForm:Boolean
 0056F1E6    mov         eax,[0078D590];^Application:TApplication
 0056F1EB    mov         eax,dword ptr [eax]
 0056F1ED    call        TApplication.NormalizeTopMosts
 0056F1F2    call        0056E2DC
 0056F1F7    push        eax
 0056F1F8    call        user32.SetActiveWindow
 0056F1FD    call        0056E2DC
 0056F202    xor         edx,edx
 0056F204    call        005402D8
 0056F209    or          byte ptr [ebx+3C],20;TJvTrayIcon.FState:TJvTrayIconStates
 0056F20D    test        byte ptr [ebx+480],2;TJvTrayIcon.FVisibility:TTrayVisibilities
>0056F214    jne         0056F21F
 0056F216    xor         edx,edx
 0056F218    mov         eax,ebx
 0056F21A    call        0056F56C
 0056F21F    pop         ebx
 0056F220    ret
*}
end;

//0056F224
procedure TJvTrayIcon.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0056F224    push        ebx
 0056F225    push        esi
 0056F226    push        edi
 0056F227    mov         ebx,ecx
 0056F229    mov         esi,edx
 0056F22B    mov         edi,eax
 0056F22D    mov         ecx,ebx
 0056F22F    mov         edx,esi
 0056F231    mov         eax,edi
 0056F233    call        TComponent.Notification
 0056F238    cmp         bl,1
>0056F23B    jne         0056F270
 0056F23D    cmp         esi,dword ptr [edi+448];TJvTrayIcon.FDropDownMenu:TPopupMenu
>0056F243    jne         0056F24E
 0056F245    xor         edx,edx
 0056F247    mov         eax,edi
 0056F249    call        TJvTrayIcon.SetDropDownMenu
 0056F24E    cmp         esi,dword ptr [edi+3F4];TJvTrayIcon.FPopupMenu:TPopupMenu
>0056F254    jne         0056F25F
 0056F256    xor         edx,edx
 0056F258    mov         eax,edi
 0056F25A    call        TJvTrayIcon.SetPopupMenu
 0056F25F    cmp         esi,dword ptr [edi+440];TJvTrayIcon.FIcons:TCustomImageList
>0056F265    jne         0056F270
 0056F267    xor         edx,edx
 0056F269    mov         eax,edi
 0056F26B    call        TJvTrayIcon.SetIcons
 0056F270    pop         edi
 0056F271    pop         esi
 0056F272    pop         ebx
 0056F273    ret
*}
end;

//0056F274
{*function sub_0056F274(?:TJvTrayIcon; ?:?; ?:?):?;
begin
 0056F274    push        ebx
 0056F275    push        esi
 0056F276    push        edi
 0056F277    push        ebp
 0056F278    mov         edi,ecx
 0056F27A    mov         esi,eax
 0056F27C    mov         dword ptr [esi+50],edx
 0056F27F    lea         eax,[esi+44];TJvTrayIcon.FIconData:TNotifyIconDataXP
 0056F282    push        eax
 0056F283    push        edi
 0056F284    call        shell32.Shell_NotifyIconW
 0056F289    cmp         eax,1
 0056F28C    sbb         ebx,ebx
 0056F28E    inc         ebx
 0056F28F    test        bl,bl
>0056F291    jne         0056F309
 0056F293    test        byte ptr [esi+481],4;TJvTrayIcon.?f481:byte
>0056F29A    jne         0056F309
 0056F29C    call        kernel32.GetLastError
 0056F2A1    test        eax,eax
>0056F2A3    je          0056F2AC
 0056F2A5    cmp         eax,5B4
>0056F2AA    jne         0056F309
 0056F2AC    xor         ebp,ebp
 0056F2AE    push        3E8
 0056F2B3    call        kernel32.Sleep
 0056F2B8    mov         eax,edi
 0056F2BA    sub         eax,1
>0056F2BD    jb          0056F2C4
 0056F2BF    dec         eax
>0056F2C0    je          0056F2D7
>0056F2C2    jmp         0056F2EB
 0056F2C4    lea         eax,[esi+44];TJvTrayIcon.FIconData:TNotifyIconDataXP
 0056F2C7    push        eax
 0056F2C8    push        1
 0056F2CA    call        shell32.Shell_NotifyIconW
 0056F2CF    cmp         eax,1
 0056F2D2    sbb         ebx,ebx
 0056F2D4    inc         ebx
>0056F2D5    jmp         0056F2EB
 0056F2D7    lea         eax,[esi+44];TJvTrayIcon.FIconData:TNotifyIconDataXP
 0056F2DA    push        eax
 0056F2DB    push        1
 0056F2DD    call        shell32.Shell_NotifyIconW
 0056F2E2    mov         ebx,eax
 0056F2E4    cmp         ebx,1
 0056F2E7    sbb         ebx,ebx
 0056F2E9    neg         ebx
 0056F2EB    test        bl,bl
>0056F2ED    jne         0056F309
 0056F2EF    inc         ebp
 0056F2F0    lea         eax,[esi+44];TJvTrayIcon.FIconData:TNotifyIconDataXP
 0056F2F3    push        eax
 0056F2F4    push        edi
 0056F2F5    call        shell32.Shell_NotifyIconW
 0056F2FA    cmp         eax,1
 0056F2FD    sbb         ebx,ebx
 0056F2FF    inc         ebx
 0056F300    test        bl,bl
>0056F302    jne         0056F309
 0056F304    cmp         ebp,1E
>0056F307    jle         0056F2AE
 0056F309    mov         eax,ebx
 0056F30B    pop         ebp
 0056F30C    pop         edi
 0056F30D    pop         esi
 0056F30E    pop         ebx
 0056F30F    ret
end;*}

//0056F310
procedure TJvTrayIcon.SetActive(Value:Boolean);
begin
{*
 0056F310    push        ebx
 0056F311    mov         ebx,eax
 0056F313    test        byte ptr [ebx+1C],1;TJvTrayIcon.FComponentState:TComponentState
>0056F317    je          0056F31E
 0056F319    mov         byte ptr [ebx+3D],dl;TJvTrayIcon.FStreamedActive:Boolean
 0056F31C    pop         ebx
 0056F31D    ret
 0056F31E    cmp         dl,byte ptr [ebx+3E];TJvTrayIcon.FActive:Boolean
>0056F321    je          0056F358
 0056F323    mov         eax,edx
 0056F325    mov         byte ptr [ebx+3E],al;TJvTrayIcon.FActive:Boolean
 0056F328    test        al,al
>0056F32A    je          0056F343
 0056F32C    mov         eax,ebx
 0056F32E    call        0056F0D0
 0056F333    mov         eax,ebx
 0056F335    call        0056EFDC
 0056F33A    mov         eax,ebx
 0056F33C    call        0056F850
>0056F341    jmp         0056F358
 0056F343    mov         eax,ebx
 0056F345    call        0056EE50
 0056F34A    mov         eax,ebx
 0056F34C    call        0056F91C
 0056F351    mov         eax,ebx
 0056F353    call        0056EFB4
 0056F358    pop         ebx
 0056F359    ret
*}
end;

//0056F35C
procedure TJvTrayIcon.SetAnimated(Value:Boolean);
begin
{*
 0056F35C    cmp         dl,byte ptr [eax+438];TJvTrayIcon.FAnimated:Boolean
>0056F362    je          0056F37C
 0056F364    mov         ecx,edx
 0056F366    mov         byte ptr [eax+438],cl;TJvTrayIcon.FAnimated:Boolean
 0056F36C    test        cl,cl
>0056F36E    je          0056F377
 0056F370    call        0056F8C8
>0056F375    jmp         0056F37C
 0056F377    call        0056EE50
 0056F37C    ret
*}
end;

//0056F390
{*procedure sub_0056F390(?:?);
begin
 0056F390    push        esi
 0056F391    mov         esi,eax
 0056F393    mov         eax,dword ptr [esi+38]
 0056F396    mov         ecx,dword ptr [eax]
 0056F398    call        dword ptr [ecx+8]
 0056F39B    mov         eax,dword ptr [esi+38]
 0056F39E    call        TIcon.GetHandle
 0056F3A3    mov         dword ptr [esi+58],eax
 0056F3A6    test        byte ptr [esi+3C],1
>0056F3AA    je          0056F3BD
 0056F3AC    mov         ecx,1
 0056F3B1    mov         edx,2
 0056F3B6    mov         eax,esi
 0056F3B8    call        0056F274
 0056F3BD    pop         esi
 0056F3BE    ret
end;*}

//0056F3C0
procedure TJvTrayIcon.SetDelay(Value:Cardinal);
begin
{*
 0056F3C0    push        ebp
 0056F3C1    mov         ebp,esp
 0056F3C3    add         esp,0FFFFFFF8
 0056F3C6    push        ebx
 0056F3C7    mov         ebx,edx
 0056F3C9    mov         dword ptr [ebp-4],eax
 0056F3CC    mov         eax,dword ptr [ebp-4]
 0056F3CF    cmp         ebx,dword ptr [eax+43C];TJvTrayIcon.FDelay:Cardinal
>0056F3D5    je          0056F426
 0056F3D7    mov         eax,dword ptr [ebp-4]
 0056F3DA    movzx       eax,byte ptr [eax+438];TJvTrayIcon.FAnimated:Boolean
 0056F3E1    mov         byte ptr [ebp-5],al
 0056F3E4    xor         eax,eax
 0056F3E6    push        ebp
 0056F3E7    push        56F41F
 0056F3EC    push        dword ptr fs:[eax]
 0056F3EF    mov         dword ptr fs:[eax],esp
 0056F3F2    xor         edx,edx
 0056F3F4    mov         eax,dword ptr [ebp-4]
 0056F3F7    call        TJvTrayIcon.SetAnimated
 0056F3FC    mov         eax,dword ptr [ebp-4]
 0056F3FF    mov         dword ptr [eax+43C],ebx;TJvTrayIcon.FDelay:Cardinal
 0056F405    xor         eax,eax
 0056F407    pop         edx
 0056F408    pop         ecx
 0056F409    pop         ecx
 0056F40A    mov         dword ptr fs:[eax],edx
 0056F40D    push        56F426
 0056F412    movzx       edx,byte ptr [ebp-5]
 0056F416    mov         eax,dword ptr [ebp-4]
 0056F419    call        TJvTrayIcon.SetAnimated
 0056F41E    ret
>0056F41F    jmp         @HandleFinally
>0056F424    jmp         0056F412
 0056F426    pop         ebx
 0056F427    pop         ecx
 0056F428    pop         ecx
 0056F429    pop         ebp
 0056F42A    ret
*}
end;

//0056F42C
procedure TJvTrayIcon.SetDropDownMenu(Value:TPopupMenu);
begin
{*
 0056F42C    lea         ecx,[eax+448];TJvTrayIcon.FDropDownMenu:TPopupMenu
 0056F432    call        0056D000
 0056F437    ret
*}
end;

//0056F438
procedure TJvTrayIcon.SetHint(Value:string);
begin
{*
 0056F438    push        ebp
 0056F439    mov         ebp,esp
 0056F43B    add         esp,0FFFFFFF8
 0056F43E    push        ebx
 0056F43F    xor         ecx,ecx
 0056F441    mov         dword ptr [ebp-8],ecx
 0056F444    mov         dword ptr [ebp-4],edx
 0056F447    mov         ebx,eax
 0056F449    mov         eax,dword ptr [ebp-4]
 0056F44C    call        @UStrAddRef
 0056F451    xor         eax,eax
 0056F453    push        ebp
 0056F454    push        56F4D1
 0056F459    push        dword ptr fs:[eax]
 0056F45C    mov         dword ptr fs:[eax],esp
 0056F45F    call        005401E0
 0056F464    cmp         eax,50000
>0056F469    jae         0056F494
 0056F46B    movzx       eax,byte ptr ds:[56F4E0];0x1 gvar_0056F4E0
 0056F472    push        eax
 0056F473    lea         eax,[ebp-8]
 0056F476    push        eax
 0056F477    mov         ecx,56F4F0;' - '
 0056F47C    mov         edx,56F504;'
'
 0056F481    mov         eax,dword ptr [ebp-4]
 0056F484    call        StringReplace
 0056F489    mov         edx,dword ptr [ebp-8]
 0056F48C    lea         eax,[ebp-4]
 0056F48F    call        @UStrLAsg
 0056F494    mov         eax,dword ptr [ebx+3F0];TJvTrayIcon.FHint:string
 0056F49A    mov         edx,dword ptr [ebp-4]
 0056F49D    call        @UStrEqual
>0056F4A2    je          0056F4B6
 0056F4A4    or          byte ptr [ebx+3C],8;TJvTrayIcon.FState:TJvTrayIconStates
 0056F4A8    lea         eax,[ebx+3F0];TJvTrayIcon.FHint:string
 0056F4AE    mov         edx,dword ptr [ebp-4]
 0056F4B1    call        @UStrAsg
 0056F4B6    xor         eax,eax
 0056F4B8    pop         edx
 0056F4B9    pop         ecx
 0056F4BA    pop         ecx
 0056F4BB    mov         dword ptr fs:[eax],edx
 0056F4BE    push        56F4D8
 0056F4C3    lea         eax,[ebp-8]
 0056F4C6    mov         edx,2
 0056F4CB    call        @UStrArrayClr
 0056F4D0    ret
>0056F4D1    jmp         @HandleFinally
>0056F4D6    jmp         0056F4C3
 0056F4D8    pop         ebx
 0056F4D9    pop         ecx
 0056F4DA    pop         ecx
 0056F4DB    pop         ebp
 0056F4DC    ret
*}
end;

//0056F50C
procedure TJvTrayIcon.SetIcon(Value:TIcon);
begin
{*
 0056F50C    mov         eax,dword ptr [eax+40];TJvTrayIcon.FIcon:TIcon
 0056F50F    mov         ecx,dword ptr [eax]
 0056F511    call        dword ptr [ecx+8];TIcon.Assign
 0056F514    ret
*}
end;

//0056F518
procedure TJvTrayIcon.SetIconIndex(Value:Integer);
begin
{*
 0056F518    cmp         edx,dword ptr [eax+444];TJvTrayIcon.FIconIndex:Integer
>0056F51E    je          0056F52B
 0056F520    mov         dword ptr [eax+444],edx;TJvTrayIcon.FIconIndex:Integer
 0056F526    call        0056F00C
 0056F52B    ret
*}
end;

//0056F52C
procedure TJvTrayIcon.SetIcons(Value:TCustomImageList);
begin
{*
 0056F52C    push        ebx
 0056F52D    push        esi
 0056F52E    mov         esi,edx
 0056F530    mov         ebx,eax
 0056F532    lea         ecx,[ebx+440];TJvTrayIcon.FIcons:TCustomImageList
 0056F538    mov         edx,esi
 0056F53A    mov         eax,ebx
 0056F53C    call        0056D000
 0056F541    test        al,al
>0056F543    je          0056F54C
 0056F545    mov         eax,ebx
 0056F547    call        0056F00C
 0056F54C    pop         esi
 0056F54D    pop         ebx
 0056F54E    ret
*}
end;

//0056F560
procedure TJvTrayIcon.SetPopupMenu(Value:TPopupMenu);
begin
{*
 0056F560    lea         ecx,[eax+3F4];TJvTrayIcon.FPopupMenu:TPopupMenu
 0056F566    call        0056D000
 0056F56B    ret
*}
end;

//0056F56C
{*procedure sub_0056F56C(?:TJvTrayIcon; ?:?);
begin
 0056F56C    push        ebx
 0056F56D    mov         ebx,eax
 0056F56F    cmp         dl,byte ptr [ebx+44C];TJvTrayIcon.FTask:Boolean
>0056F575    je          0056F5D6
 0056F577    mov         byte ptr [ebx+44C],dl;TJvTrayIcon.FTask:Boolean
 0056F57D    test        byte ptr [ebx+1C],10;TJvTrayIcon.FComponentState:TComponentState
>0056F581    jne         0056F5D6
 0056F583    cmp         dword ptr ds:[789924],0;gvar_00789924:Pointer
>0056F58A    jne         0056F5A6
 0056F58C    push        56F5D8
 0056F591    push        56F608;'kernel32.dll'
 0056F596    call        kernel32.GetModuleHandleW
 0056F59B    push        eax
 0056F59C    call        GetProcAddress
 0056F5A1    mov         [00789924],eax;gvar_00789924:Pointer
 0056F5A6    cmp         dword ptr ds:[789924],0;gvar_00789924:Pointer
>0056F5AD    je          0056F5D6
 0056F5AF    cmp         byte ptr [ebx+44C],0;TJvTrayIcon.FTask:Boolean
>0056F5B6    je          0056F5C8
 0056F5B8    push        0
 0056F5BA    call        kernel32.GetCurrentProcessId
 0056F5BF    push        eax
 0056F5C0    call        dword ptr ds:[789924]
>0056F5C6    jmp         0056F5D6
 0056F5C8    push        1
 0056F5CA    call        kernel32.GetCurrentProcessId
 0056F5CF    push        eax
 0056F5D0    call        dword ptr ds:[789924]
 0056F5D6    pop         ebx
 0056F5D7    ret
end;*}

//0056F624
procedure TJvTrayIcon.SetVisibility(Value:TTrayVisibilities);
begin
{*
 0056F624    push        ebx
 0056F625    push        esi
 0056F626    push        edi
 0056F627    push        ecx
 0056F628    mov         word ptr [esp],dx
 0056F62C    mov         ebx,eax
 0056F62E    movzx       eax,word ptr [ebx+480];TJvTrayIcon.FVisibility:TTrayVisibilities
 0056F635    cmp         ax,word ptr [esp]
>0056F639    je          0056F70D
 0056F63F    movzx       esi,word ptr [ebx+480];TJvTrayIcon.FVisibility:TTrayVisibilities
 0056F646    not         esi
 0056F648    and         si,word ptr [esp]
 0056F64C    movzx       edi,word ptr [esp]
 0056F650    not         edi
 0056F652    and         di,word ptr [ebx+480];TJvTrayIcon.FVisibility:TTrayVisibilities
 0056F659    movzx       eax,word ptr [esp]
 0056F65D    mov         word ptr [ebx+480],ax;TJvTrayIcon.FVisibility:TTrayVisibilities
 0056F664    cmp         byte ptr [ebx+3E],0;TJvTrayIcon.FActive:Boolean
>0056F668    je          0056F70D
 0056F66E    test        byte ptr [ebx+1C],10;TJvTrayIcon.FComponentState:TComponentState
>0056F672    je          0056F697
 0056F674    test        si,10
>0056F679    je          0056F687
 0056F67B    mov         eax,ebx
 0056F67D    call        0056F850
>0056F682    jmp         0056F70D
 0056F687    test        di,10
>0056F68C    je          0056F70D
 0056F68E    mov         eax,ebx
 0056F690    call        0056EFB4
>0056F695    jmp         0056F70D
 0056F697    test        byte ptr [ebx+480],2;TJvTrayIcon.FVisibility:TTrayVisibilities
 0056F69E    setne       dl
 0056F6A1    mov         eax,ebx
 0056F6A3    call        0056F56C
 0056F6A8    test        si,4
>0056F6AD    je          0056F6C1
 0056F6AF    mov         eax,ebx
 0056F6B1    call        0056EE6C
 0056F6B6    test        al,al
>0056F6B8    jne         0056F6C1
 0056F6BA    mov         eax,ebx
 0056F6BC    mov         edx,dword ptr [eax]
 0056F6BE    call        dword ptr [edx+34];TJvTrayIcon.HideApplication
 0056F6C1    test        si,1
>0056F6C6    je          0056F6D1
 0056F6C8    mov         eax,ebx
 0056F6CA    mov         edx,dword ptr [eax]
 0056F6CC    call        dword ptr [edx+38];TJvTrayIcon.ShowApplication
>0056F6CF    jmp         0056F6DF
 0056F6D1    test        di,1
>0056F6D6    je          0056F6DF
 0056F6D8    mov         eax,ebx
 0056F6DA    mov         edx,dword ptr [eax]
 0056F6DC    call        dword ptr [edx+34];TJvTrayIcon.HideApplication
 0056F6DF    test        si,8
>0056F6E4    je          0056F6F6
 0056F6E6    call        0056E318
 0056F6EB    test        al,al
>0056F6ED    jne         0056F6F6
 0056F6EF    mov         eax,ebx
 0056F6F1    call        0056EFB4
 0056F6F6    test        di,8
>0056F6FB    je          0056F70D
 0056F6FD    call        0056E318
 0056F702    test        al,al
>0056F704    jne         0056F70D
 0056F706    mov         eax,ebx
 0056F708    call        0056F850
 0056F70D    pop         edx
 0056F70E    pop         edi
 0056F70F    pop         esi
 0056F710    pop         ebx
 0056F711    ret
*}
end;

//0056F714
procedure TJvTrayIcon.ShowApplication;
begin
{*
 0056F714    push        ebx
 0056F715    mov         ebx,eax
 0056F717    test        byte ptr [ebx+3C],20;TJvTrayIcon.FState:TJvTrayIconStates
>0056F71B    je          0056F749
 0056F71D    call        0056E2DC
 0056F722    mov         edx,6
 0056F727    call        005402D8
 0056F72C    cmp         byte ptr [ebx+482],0;TJvTrayIcon.FSnap:Boolean
>0056F733    jne         0056F749
 0056F735    test        byte ptr [ebx+481],2;TJvTrayIcon.?f481:byte
>0056F73C    jne         0056F749
 0056F73E    mov         eax,[0078D590];^Application:TApplication
 0056F743    mov         eax,dword ptr [eax]
 0056F745    mov         byte ptr [eax+5B],1;TApplication.FShowMainForm:Boolean
 0056F749    or          word ptr [ebx+480],1;TJvTrayIcon.FVisibility:TTrayVisibilities
 0056F751    push        5
 0056F753    call        0056E2DC
 0056F758    push        eax
 0056F759    call        user32.ShowWindow
 0056F75E    mov         eax,ebx
 0056F760    call        0056EE6C
 0056F765    test        al,al
>0056F767    jne         0056F83A
 0056F76D    test        byte ptr [ebx+481],2;TJvTrayIcon.?f481:byte
>0056F774    je          0056F797
 0056F776    mov         eax,[0078D590];^Application:TApplication
 0056F77B    mov         eax,dword ptr [eax]
 0056F77D    cmp         dword ptr [eax+44],0;TApplication.FMainForm:TForm
>0056F781    je          0056F797
 0056F783    mov         eax,[0078D590];^Application:TApplication
 0056F788    mov         eax,dword ptr [eax]
 0056F78A    mov         eax,dword ptr [eax+44];TApplication.FMainForm:TForm
 0056F78D    call        TWinControl.GetHandle
 0056F792    call        0056E3C4
 0056F797    mov         eax,[0078D590];^Application:TApplication
 0056F79C    mov         eax,dword ptr [eax]
 0056F79E    cmp         byte ptr [eax+0D3],0;TApplication.FMainFormOnTaskBar:Boolean
>0056F7A5    je          0056F7D5
 0056F7A7    mov         eax,[0078D590];^Application:TApplication
 0056F7AC    mov         eax,dword ptr [eax]
 0056F7AE    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0056F7B4    push        eax
 0056F7B5    call        user32.IsIconic
 0056F7BA    test        eax,eax
>0056F7BC    jne         0056F7D5
 0056F7BE    mov         eax,[0078D590];^Application:TApplication
 0056F7C3    mov         eax,dword ptr [eax]
 0056F7C5    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0056F7CB    mov         edx,7
 0056F7D0    call        005402D8
 0056F7D5    mov         eax,[0078D590];^Application:TApplication
 0056F7DA    mov         eax,dword ptr [eax]
 0056F7DC    call        TApplication.Restore
 0056F7E1    mov         eax,[0078D590];^Application:TApplication
 0056F7E6    mov         eax,dword ptr [eax]
 0056F7E8    cmp         byte ptr [eax+0D3],0;TApplication.FMainFormOnTaskBar:Boolean
>0056F7EF    je          0056F81F
 0056F7F1    mov         eax,[0078D590];^Application:TApplication
 0056F7F6    mov         eax,dword ptr [eax]
 0056F7F8    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0056F7FE    push        eax
 0056F7FF    call        user32.IsIconic
 0056F804    test        eax,eax
>0056F806    je          0056F81F
 0056F808    mov         eax,[0078D590];^Application:TApplication
 0056F80D    mov         eax,dword ptr [eax]
 0056F80F    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0056F815    mov         edx,4
 0056F81A    call        005402D8
 0056F81F    mov         eax,[0078D590];^Application:TApplication
 0056F824    mov         eax,dword ptr [eax]
 0056F826    mov         eax,dword ptr [eax+44];TApplication.FMainForm:TForm
 0056F829    test        eax,eax
>0056F82B    je          0056F83A
 0056F82D    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 0056F833    mov         dl,1
 0056F835    call        TCustomForm.SetVisible
 0056F83A    and         byte ptr [ebx+3C],0DF;TJvTrayIcon.FState:TJvTrayIconStates
 0056F83E    test        byte ptr [ebx+480],8;TJvTrayIcon.FVisibility:TTrayVisibilities
>0056F845    je          0056F84E
 0056F847    mov         eax,ebx
 0056F849    call        0056EFB4
 0056F84E    pop         ebx
 0056F84F    ret
*}
end;

//0056F850
procedure sub_0056F850(?:TJvTrayIcon);
begin
{*
 0056F850    push        ebx
 0056F851    mov         ebx,eax
 0056F853    test        byte ptr [ebx+3C],1;TJvTrayIcon.FState:TJvTrayIconStates
>0056F857    jne         0056F8C4
 0056F859    cmp         byte ptr [ebx+3E],0;TJvTrayIcon.FActive:Boolean
>0056F85D    je          0056F8C4
 0056F85F    test        byte ptr [ebx+1C],10;TJvTrayIcon.FComponentState:TComponentState
>0056F863    je          0056F870
 0056F865    test        byte ptr [ebx+480],10;TJvTrayIcon.FVisibility:TTrayVisibilities
>0056F86C    je          0056F8C4
>0056F86E    jmp         0056F884
 0056F870    test        byte ptr [ebx+480],8;TJvTrayIcon.FVisibility:TTrayVisibilities
>0056F877    je          0056F884
 0056F879    mov         eax,ebx
 0056F87B    call        0056EE6C
 0056F880    test        al,al
>0056F882    jne         0056F8C4
 0056F884    xor         ecx,ecx
 0056F886    mov         edx,7
 0056F88B    mov         eax,ebx
 0056F88D    call        0056F274
 0056F892    test        al,al
>0056F894    je          0056F8C4
 0056F896    or          byte ptr [ebx+3C],1;TJvTrayIcon.FState:TJvTrayIconStates
 0056F89A    call        005401E0
 0056F89F    cmp         eax,50000
>0056F8A4    jb          0056F8B4
 0056F8A6    mov         ecx,4
 0056F8AB    xor         edx,edx
 0056F8AD    mov         eax,ebx
 0056F8AF    call        0056F274
 0056F8B4    cmp         byte ptr [ebx+438],0;TJvTrayIcon.FAnimated:Boolean
>0056F8BB    je          0056F8C4
 0056F8BD    mov         eax,ebx
 0056F8BF    call        0056F8C8
 0056F8C4    pop         ebx
 0056F8C5    ret
*}
end;

//0056F8C8
procedure sub_0056F8C8(?:TJvTrayIcon);
begin
{*
 0056F8C8    push        ebx
 0056F8C9    mov         ebx,eax
 0056F8CB    movzx       eax,byte ptr [ebx+3C];TJvTrayIcon.FState:TJvTrayIconStates
 0056F8CF    and         al,byte ptr ds:[56F900];0x3 gvar_0056F900
 0056F8D5    movzx       edx,byte ptr ds:[56F904];0x1 gvar_0056F904
 0056F8DC    cmp         dl,al
>0056F8DE    jne         0056F8FB
 0056F8E0    or          byte ptr [ebx+3C],2;TJvTrayIcon.FState:TJvTrayIconStates
 0056F8E4    push        0
 0056F8E6    mov         eax,dword ptr [ebx+43C];TJvTrayIcon.FDelay:Cardinal
 0056F8EC    push        eax
 0056F8ED    push        1
 0056F8EF    mov         eax,dword ptr [ebx+3EC];TJvTrayIcon.FHandle:Cardinal
 0056F8F5    push        eax
 0056F8F6    call        user32.SetTimer
 0056F8FB    pop         ebx
 0056F8FC    ret
*}
end;

//0056F908
procedure sub_0056F908(?:TJvTrayIcon);
begin
{*
 0056F908    mov         ecx,dword ptr [eax+3EC];TJvTrayIcon.FHandle:Cardinal
 0056F90E    test        ecx,ecx
>0056F910    je          0056F919
 0056F912    push        edx
 0056F913    push        ecx
 0056F914    call        user32.KillTimer
 0056F919    ret
*}
end;

//0056F91C
procedure sub_0056F91C(?:TJvTrayIcon);
begin
{*
 0056F91C    push        ebx
 0056F91D    mov         ebx,eax
 0056F91F    test        byte ptr [ebx+3C],4;TJvTrayIcon.FState:TJvTrayIconStates
>0056F923    je          0056F93B
 0056F925    and         byte ptr [ebx+3C],0FB;TJvTrayIcon.FState:TJvTrayIconStates
 0056F929    push        ebx
 0056F92A    push        56E6D4
 0056F92F    mov         eax,[0078D590];^Application:TApplication
 0056F934    mov         eax,dword ptr [eax]
 0056F936    call        TApplication.UnhookMainWindow
 0056F93B    pop         ebx
 0056F93C    ret
*}
end;

//0056FD68
constructor TTrayIconEnumerator.Create(DataSize:Integer);
begin
{*
 0056FD68    push        ebx
 0056FD69    push        esi
 0056FD6A    push        edi
 0056FD6B    test        dl,dl
>0056FD6D    je          0056FD77
 0056FD6F    add         esp,0FFFFFFF0
 0056FD72    call        @ClassCreate
 0056FD77    mov         esi,ecx
 0056FD79    mov         ebx,edx
 0056FD7B    mov         edi,eax
 0056FD7D    xor         edx,edx
 0056FD7F    mov         eax,edi
 0056FD81    call        TObject.Create
 0056FD86    cmp         esi,14
>0056FD89    jge         0056FD90
 0056FD8B    mov         esi,14
 0056FD90    mov         edx,esi
 0056FD92    mov         eax,edi
 0056FD94    call        0056FE50
 0056FD99    mov         eax,dword ptr [edi+0C];TTrayIconEnumerator.FCount:Integer
 0056FD9C    mov         dword ptr [edi+14],eax;TTrayIconEnumerator.FIndex:Integer
 0056FD9F    mov         eax,edi
 0056FDA1    test        bl,bl
>0056FDA3    je          0056FDB4
 0056FDA5    call        @AfterConstruction
 0056FDAA    pop         dword ptr fs:[0]
 0056FDB1    add         esp,0C
 0056FDB4    mov         eax,edi
 0056FDB6    pop         edi
 0056FDB7    pop         esi
 0056FDB8    pop         ebx
 0056FDB9    ret
*}
end;

//0056FDBC
constructor sub_0056FDBC;
begin
{*
 0056FDBC    push        ebx
 0056FDBD    push        esi
 0056FDBE    test        dl,dl
>0056FDC0    je          0056FDCA
 0056FDC2    add         esp,0FFFFFFF0
 0056FDC5    call        @ClassCreate
 0056FDCA    mov         ebx,edx
 0056FDCC    mov         esi,eax
 0056FDCE    xor         edx,edx
 0056FDD0    mov         eax,esi
 0056FDD2    call        TObject.Create
 0056FDD7    mov         edx,14
 0056FDDC    mov         eax,esi
 0056FDDE    call        0056FE50
 0056FDE3    mov         eax,dword ptr [esi+0C];TTrayIconEnumerator.FCount:Integer
 0056FDE6    mov         dword ptr [esi+14],eax;TTrayIconEnumerator.FIndex:Integer
 0056FDE9    mov         eax,esi
 0056FDEB    test        bl,bl
>0056FDED    je          0056FDFE
 0056FDEF    call        @AfterConstruction
 0056FDF4    pop         dword ptr fs:[0]
 0056FDFB    add         esp,0C
 0056FDFE    mov         eax,esi
 0056FE00    pop         esi
 0056FE01    pop         ebx
 0056FE02    ret
*}
end;

//0056FE04
destructor TTrayIconEnumerator.Destroy();
begin
{*
 0056FE04    push        ebx
 0056FE05    push        esi
 0056FE06    call        @BeforeDestruction
 0056FE0B    mov         ebx,edx
 0056FE0D    mov         esi,eax
 0056FE0F    mov         eax,dword ptr [esi+10];TTrayIconEnumerator.FData:Pointer
 0056FE12    test        eax,eax
>0056FE14    je          0056FE27
 0056FE16    push        8000
 0056FE1B    push        0
 0056FE1D    push        eax
 0056FE1E    mov         eax,dword ptr [esi+8];TTrayIconEnumerator.FProcess:Cardinal
 0056FE21    push        eax
 0056FE22    call        kernel32.VirtualFreeEx
 0056FE27    mov         eax,dword ptr [esi+8];TTrayIconEnumerator.FProcess:Cardinal
 0056FE2A    test        eax,eax
>0056FE2C    je          0056FE34
 0056FE2E    push        eax
 0056FE2F    call        kernel32.CloseHandle
 0056FE34    mov         edx,ebx
 0056FE36    and         dl,0FC
 0056FE39    mov         eax,esi
 0056FE3B    call        TObject.Destroy
 0056FE40    test        bl,bl
>0056FE42    jle         0056FE4B
 0056FE44    mov         eax,esi
 0056FE46    call        @ClassDestroy
 0056FE4B    pop         esi
 0056FE4C    pop         ebx
 0056FE4D    ret
*}
end;

//0056FE50
procedure sub_0056FE50(?:TTrayIconEnumerator; ?:Integer);
begin
{*
 0056FE50    push        ebx
 0056FE51    push        esi
 0056FE52    push        edi
 0056FE53    push        ebp
 0056FE54    push        ecx
 0056FE55    mov         ebp,edx
 0056FE57    mov         ebx,eax
 0056FE59    call        0056E464
 0056FE5E    mov         esi,eax
 0056FE60    mov         dword ptr [ebx+4],esi;TTrayIconEnumerator.FToolbarHandle:Cardinal
 0056FE63    test        esi,esi
>0056FE65    je          0056FEB8
 0056FE67    push        0
 0056FE69    push        0
 0056FE6B    push        418
 0056FE70    push        esi
 0056FE71    call        user32.SendMessageW
 0056FE76    mov         edi,eax
 0056FE78    mov         dword ptr [ebx+0C],edi;TTrayIconEnumerator.FCount:Integer
 0056FE7B    dec         edi
>0056FE7C    jl          0056FEB8
 0056FE7E    push        esp
 0056FE7F    mov         eax,dword ptr [ebx+4];TTrayIconEnumerator.FToolbarHandle:Cardinal
 0056FE82    push        eax
 0056FE83    call        user32.GetWindowThreadProcessId
 0056FE88    test        eax,eax
>0056FE8A    je          0056FEB8
 0056FE8C    mov         eax,dword ptr [esp]
 0056FE8F    push        eax
 0056FE90    push        0
 0056FE92    push        1F0FFF
 0056FE97    call        kernel32.OpenProcess
 0056FE9C    mov         esi,eax
 0056FE9E    mov         dword ptr [ebx+8],esi;TTrayIconEnumerator.FProcess:Cardinal
 0056FEA1    test        esi,esi
>0056FEA3    je          0056FEB8
 0056FEA5    push        4
 0056FEA7    push        1000
 0056FEAC    push        ebp
 0056FEAD    push        0
 0056FEAF    push        esi
 0056FEB0    call        kernel32.VirtualAllocEx
 0056FEB5    mov         dword ptr [ebx+10],eax;TTrayIconEnumerator.FData:Pointer
 0056FEB8    pop         edx
 0056FEB9    pop         ebp
 0056FEBA    pop         edi
 0056FEBB    pop         esi
 0056FEBC    pop         ebx
 0056FEBD    ret
*}
end;

//0056FEC0
function TTrayIconEnumerator.MoveNext:Boolean;
begin
{*
 0056FEC0    push        ebx
 0056FEC1    push        esi
 0056FEC2    push        edi
 0056FEC3    mov         edi,eax
 0056FEC5    xor         ebx,ebx
 0056FEC7    cmp         dword ptr [edi+8],0;TTrayIconEnumerator.FProcess:Cardinal
>0056FECB    je          0056FF27
 0056FECD    cmp         dword ptr [edi+10],0;TTrayIconEnumerator.FData:Pointer
>0056FED1    je          0056FF27
 0056FED3    dec         dword ptr [edi+14];TTrayIconEnumerator.FIndex:Integer
>0056FED6    jmp         0056FF20
 0056FED8    mov         eax,dword ptr [edi+10];TTrayIconEnumerator.FData:Pointer
 0056FEDB    push        eax
 0056FEDC    push        esi
 0056FEDD    push        417
 0056FEE2    mov         eax,dword ptr [edi+4];TTrayIconEnumerator.FToolbarHandle:Cardinal
 0056FEE5    push        eax
 0056FEE6    call        user32.SendMessageW
 0056FEEB    lea         eax,[edi+18];TTrayIconEnumerator.FButton:_TBBUTTON
 0056FEEE    push        eax
 0056FEEF    mov         ecx,14
 0056FEF4    mov         edx,dword ptr [edi+10];TTrayIconEnumerator.FData:Pointer
 0056FEF7    mov         eax,edi
 0056FEF9    call        TTrayIconEnumerator.ReadProcessMemory
 0056FEFE    test        al,al
>0056FF00    je          0056FF1D
 0056FF02    lea         eax,[edi+2C];TTrayIconEnumerator.FExtraData:TExtraData
 0056FF05    push        eax
 0056FF06    mov         ecx,8
 0056FF0B    mov         edx,dword ptr [edi+24];TTrayIconEnumerator.FButton.dwData:LongInt
 0056FF0E    mov         eax,edi
 0056FF10    call        TTrayIconEnumerator.ReadProcessMemory
 0056FF15    test        al,al
>0056FF17    je          0056FF1D
 0056FF19    mov         bl,1
>0056FF1B    jmp         0056FF27
 0056FF1D    dec         dword ptr [edi+14];TTrayIconEnumerator.FIndex:Integer
 0056FF20    mov         esi,dword ptr [edi+14];TTrayIconEnumerator.FIndex:Integer
 0056FF23    test        esi,esi
>0056FF25    jge         0056FED8
 0056FF27    mov         eax,ebx
 0056FF29    pop         edi
 0056FF2A    pop         esi
 0056FF2B    pop         ebx
 0056FF2C    ret
*}
end;

//0056FF30
{*function TTrayIconEnumerator.ReadProcessMemory(Address:Pointer; Count:Cardinal; var Buffer:?):Boolean;
begin
 0056FF30    push        ebp
 0056FF31    mov         ebp,esp
 0056FF33    push        ecx
 0056FF34    push        ebx
 0056FF35    push        esi
 0056FF36    push        edi
 0056FF37    mov         esi,ecx
 0056FF39    mov         edi,edx
 0056FF3B    mov         ebx,eax
 0056FF3D    lea         eax,[ebp-4]
 0056FF40    push        eax
 0056FF41    push        esi
 0056FF42    mov         eax,dword ptr [ebp+8]
 0056FF45    push        eax
 0056FF46    push        edi
 0056FF47    mov         eax,dword ptr [ebx+8];TTrayIconEnumerator.FProcess:Cardinal
 0056FF4A    push        eax
 0056FF4B    call        kernel32.ReadProcessMemory
 0056FF50    test        eax,eax
>0056FF52    je          0056FF59
 0056FF54    cmp         esi,dword ptr [ebp-4]
>0056FF57    je          0056FF5D
 0056FF59    xor         eax,eax
>0056FF5B    jmp         0056FF5F
 0056FF5D    mov         al,1
 0056FF5F    pop         edi
 0056FF60    pop         esi
 0056FF61    pop         ebx
 0056FF62    pop         ecx
 0056FF63    pop         ebp
 0056FF64    ret         4
end;*}

Initialization
//007812F0
{*
 007812F0    sub         dword ptr ds:[81550C],1
>007812F7    jae         00781308
 007812F9    push        78130C;'TaskbarCreated'
 007812FE    call        user32.RegisterWindowMessageW
 00781303    mov         [00815510],eax;gvar_00815510:LongWord
 00781308    ret
*}
Finalization
end.