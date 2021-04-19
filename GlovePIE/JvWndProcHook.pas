//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JvWndProcHook;

interface

uses
  SysUtils, Classes, Controls, DwmApi, JvWndProcHook;

type
  TJvControlHook = function(var Msg:TMessage):Boolean of object;;
  TJvHookMessageEvent = procedure(Sender:TObject; var Msg:TMessage; var Handled:Boolean) of object;;
  TJvHookOrder = (hoBeforeMsg, hoAfterMsg);
  TJvWindowHook = class(TJvComponent)
  published
    procedure UnHookControl;//0057193C
    constructor Create(AOwner:TComponent);//005714FC
    destructor Destroy();//005715E0
    procedure HookControl;//00571660
  public
    FActive:Boolean;//f38
    FControl:TControl;//f3C
    FBeforeMessage:TJvHookMessageEvent;//f40
    f42:word;//f42
    f44:dword;//f44
    FAfterMessage:TJvHookMessageEvent;//f48
    f4A:word;//f4A
    f4C:dword;//f4C
    destructor Destroy(); virtual;//005715E0
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0057157C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00571698
    constructor Create(AOwner:TComponent); virtual;//v2C//005714FC
    //procedure sub_0057163C(?:?); dynamic;//0057163C
    //procedure sub_00571618(?:?); dynamic;//00571618
    function IsStoredControl(Value:TControl):Boolean;//005716DC
    procedure SetActive(Value:Boolean);//00571738
    //procedure SetAfterMessage(Value:TJvHookMessageEvent; ?:?; ?:?; ?:?);//005717EC
    //procedure SetBeforeMessage(Value:TJvHookMessageEvent; ?:?; ?:?; ?:?);//00571868
    procedure SetControl(Value:TControl);//005718E4
  end;
  TJvHookInfo = TJvHookInfo = record//size=10
Hook:TJvControlHook;//f0
Next:PJvHookInfo;//f8
end;;
  THookInfoList = array [1..536870911] of PJvHookInfo;
  TJvHookInfos = class(TObject)
  published
    //procedure Add(Order:TJvHookOrder; Hook:TJvControlHook; ?:?);//00570FBC
    //procedure Delete(Order:TJvHookOrder; Hook:TJvControlHook; ?:?);//00571130
    procedure ControlDestroyed;//00571040
    constructor Create(AControl:TControl);//0057106C
    constructor Create(AHandle:Cardinal);//005710C8
    destructor Destroy();//005711D8
  public
    FFirst:?;//f4
    f8:dword;//f8
    FLast:?;//fC
    FStack:PHookInfoList;//f14
    FStackCapacity:Integer;//f18
    FStackCount:Integer;//f1C
    FHandle:Cardinal;//f20
    FControl:TControl;//f24
    FControlDestroyed:Boolean;//f28
    FOldWndProc:TWndMethod;//f30
    f34:dword;//f34
    FOldWndProcHandle:Pointer;//f38
    FHooked:Boolean;//f3C
    FController:TJvWndProcHook;//f40
  end;
  TJvWndProcHook = class(TComponent)
  published
    //function UnRegisterWndProc(AControl:TControl; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;//00570F7C
    //function UnRegisterWndProc(AHandle:Cardinal; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;//00570F40
    //function RegisterWndProc(AHandle:Cardinal; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;//00570EB4
    destructor Destroy();//00570CD4
    //function RegisterWndProc(AControl:TControl; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;//00570E30
  public
    ......................FHookInfos:TList;//f34
    destructor Destroy(); virtual;//00570CD4
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00570DDC
  end;
  TJvReleaser = class(TObject)
  published
    function Instance:TJvReleaser;//00571A78
    procedure Release(AObject:TObject);//00571A98
    constructor Create;//0057198C
    destructor Destroy();//005719FC
    //procedure DefaultHandler(var Msg:?);//005719D0
  public
    FHandle:Cardinal;//f4
    FReleasing:TList;//f8
    //procedure DefaultHandler(var Msg:?); virtual;//005719D0
    destructor Destroy(); virtual;//005719FC
    constructor Create; virtual;//v0//0057198C
    //procedure CMRelease(?:?); message CM_RELEASE;//00571960
  end;
    //function sub_0056FF78:?;//0056FF78
    //function sub_00570C74:?;//00570C74
    procedure sub_00570C98(?:TJvHookInfos);//00570C98
    procedure sub_00570CB0(?:TJvWndProcHook; ?:TJvHookInfos);//00570CB0
    //function sub_00570D24(?:TJvWndProcHook):?;//00570D24
    //function sub_00570D48(?:TJvWndProcHook):?;//00570D48
    //function sub_00570D6C(?:?; ?:?):?;//00570D6C
    //function sub_00570DA4(?:TJvWndProcHook; ?:TComponent):?;//00570DA4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00570DDC
    procedure sub_00570F24(?:TJvWndProcHook);//00570F24
    //procedure sub_00571124(?:?);//00571124
    procedure sub_00571250(?:TJvHookInfos);//00571250
    //procedure sub_005712C0(?:?);//005712C0
    procedure sub_005712F0(?:TJvHookInfos; ?:TJvWndProcHook);//005712F0
    procedure sub_0057131C(?:TJvHookInfos);//0057131C
    //procedure sub_00571370(?:?; ?:?);//00571370
    //function sub_00571538(?:?):?;//00571538
    procedure DefineProperties(Filer:TFiler);//0057157C
    //procedure sub_00571618(?:?);//00571618
    //procedure sub_0057163C(?:?);//0057163C
    //function sub_00571668(?:?):?;//00571668
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00571698
    //procedure CMRelease(?:?);//00571960
    //function sub_00571A5C(?:TJvReleaser):?;//00571A5C

implementation

//0056FF78
{*function sub_0056FF78:?;
begin
 0056FF78    call        ThemeServices
 0056FF7D    ret
end;*}

//00570C74
{*function sub_00570C74:?;
begin
 00570C74    cmp         dword ptr ds:[789938],0;gvar_00789938:TJvWndProcHook
>00570C7B    jne         00570C90
 00570C7D    xor         ecx,ecx
 00570C7F    mov         dl,1
 00570C81    mov         eax,[005707A8];TJvWndProcHook
 00570C86    call        TComponent.Create;TJvWndProcHook.Create
 00570C8B    mov         [00789938],eax;gvar_00789938:TJvWndProcHook
 00570C90    mov         eax,[00789938];0x0 gvar_00789938:TJvWndProcHook
 00570C95    ret
end;*}

//00570C98
procedure sub_00570C98(?:TJvHookInfos);
begin
{*
 00570C98    push        ebx
 00570C99    mov         ebx,eax
 00570C9B    mov         eax,[00570A64];TJvReleaser
 00570CA0    call        TJvReleaser.Instance
 00570CA5    mov         edx,ebx
 00570CA7    call        TJvReleaser.Release
 00570CAC    pop         ebx
 00570CAD    ret
*}
end;

//00570CB0
procedure sub_00570CB0(?:TJvWndProcHook; ?:TJvHookInfos);
begin
{*
 00570CB0    push        ebx
 00570CB1    push        esi
 00570CB2    mov         esi,edx
 00570CB4    mov         ebx,eax
 00570CB6    mov         edx,esi
 00570CB8    mov         eax,dword ptr [ebx+34]
 00570CBB    call        TList.IndexOf
 00570CC0    test        eax,eax
>00570CC2    jge         00570CCE
 00570CC4    mov         edx,esi
 00570CC6    mov         eax,dword ptr [ebx+34]
 00570CC9    call        TList.Add
 00570CCE    pop         esi
 00570CCF    pop         ebx
 00570CD0    ret
*}
end;

//00570CD4
destructor TJvWndProcHook.Destroy();
begin
{*
 00570CD4    push        ebx
 00570CD5    push        esi
 00570CD6    push        edi
 00570CD7    call        @BeforeDestruction
 00570CDC    mov         ebx,edx
 00570CDE    mov         edi,eax
 00570CE0    cmp         dword ptr [edi+34],0;TJvWndProcHook........................FHookInfos:TList
>00570CE4    je          00570D07
>00570CE6    jmp         00570CF6
 00570CE8    mov         eax,esi
 00570CEA    xor         edx,edx
 00570CEC    call        TList.Get
 00570CF1    call        TObject.Free
 00570CF6    mov         esi,dword ptr [edi+34];TJvWndProcHook.........................FHookInfos:TList
 00570CF9    cmp         dword ptr [esi+8],0;TList.FCount:Integer
>00570CFD    jg          00570CE8
 00570CFF    mov         eax,dword ptr [edi+34];TJvWndProcHook..........................FHookInfos:TList
 00570D02    call        TObject.Free
 00570D07    mov         edx,ebx
 00570D09    and         dl,0FC
 00570D0C    mov         eax,edi
 00570D0E    call        TComponent.Destroy
 00570D13    test        bl,bl
>00570D15    jle         00570D1E
 00570D17    mov         eax,edi
 00570D19    call        @ClassDestroy
 00570D1E    pop         edi
 00570D1F    pop         esi
 00570D20    pop         ebx
 00570D21    ret
*}
end;

//00570D24
{*function sub_00570D24(?:TJvWndProcHook):?;
begin
 00570D24    push        ebx
 00570D25    push        esi
 00570D26    mov         ebx,eax
 00570D28    mov         eax,ebx
 00570D2A    call        00570D6C
 00570D2F    mov         esi,eax
 00570D31    test        esi,esi
>00570D33    jge         00570D3A
 00570D35    xor         eax,eax
 00570D37    pop         esi
 00570D38    pop         ebx
 00570D39    ret
 00570D3A    mov         edx,esi
 00570D3C    mov         eax,dword ptr [ebx+34]
 00570D3F    call        TList.Get
 00570D44    pop         esi
 00570D45    pop         ebx
 00570D46    ret
end;*}

//00570D48
{*function sub_00570D48(?:TJvWndProcHook):?;
begin
 00570D48    push        ebx
 00570D49    push        esi
 00570D4A    mov         ebx,eax
 00570D4C    mov         eax,ebx
 00570D4E    call        00570DA4
 00570D53    mov         esi,eax
 00570D55    test        esi,esi
>00570D57    jge         00570D5E
 00570D59    xor         eax,eax
 00570D5B    pop         esi
 00570D5C    pop         ebx
 00570D5D    ret
 00570D5E    mov         edx,esi
 00570D60    mov         eax,dword ptr [ebx+34]
 00570D63    call        TList.Get
 00570D68    pop         esi
 00570D69    pop         ebx
 00570D6A    ret
end;*}

//00570D6C
{*function sub_00570D6C(?:?; ?:?):?;
begin
 00570D6C    push        ebx
 00570D6D    push        esi
 00570D6E    push        edi
 00570D6F    push        ebp
 00570D70    mov         ebp,edx
 00570D72    mov         esi,eax
 00570D74    xor         ebx,ebx
>00570D76    jmp         00570D79
 00570D78    inc         ebx
 00570D79    mov         edi,dword ptr [esi+34]
 00570D7C    cmp         ebx,dword ptr [edi+8]
>00570D7F    jge         00570D8F
 00570D81    mov         edx,ebx
 00570D83    mov         eax,edi
 00570D85    call        TList.Get
 00570D8A    cmp         ebp,dword ptr [eax+20]
>00570D8D    jne         00570D78
 00570D8F    mov         eax,dword ptr [esi+34]
 00570D92    cmp         ebx,dword ptr [eax+8]
>00570D95    jne         00570D9A
 00570D97    or          ebx,0FFFFFFFF
 00570D9A    mov         eax,ebx
 00570D9C    pop         ebp
 00570D9D    pop         edi
 00570D9E    pop         esi
 00570D9F    pop         ebx
 00570DA0    ret
end;*}

//00570DA4
{*function sub_00570DA4(?:TJvWndProcHook; ?:TComponent):?;
begin
 00570DA4    push        ebx
 00570DA5    push        esi
 00570DA6    push        edi
 00570DA7    push        ebp
 00570DA8    mov         ebp,edx
 00570DAA    mov         esi,eax
 00570DAC    xor         ebx,ebx
>00570DAE    jmp         00570DB1
 00570DB0    inc         ebx
 00570DB1    mov         edi,dword ptr [esi+34]
 00570DB4    cmp         ebx,dword ptr [edi+8]
>00570DB7    jge         00570DC7
 00570DB9    mov         edx,ebx
 00570DBB    mov         eax,edi
 00570DBD    call        TList.Get
 00570DC2    cmp         ebp,dword ptr [eax+24]
>00570DC5    jne         00570DB0
 00570DC7    mov         eax,dword ptr [esi+34]
 00570DCA    cmp         ebx,dword ptr [eax+8]
>00570DCD    jne         00570DD2
 00570DCF    or          ebx,0FFFFFFFF
 00570DD2    mov         eax,ebx
 00570DD4    pop         ebp
 00570DD5    pop         edi
 00570DD6    pop         esi
 00570DD7    pop         ebx
 00570DD8    ret
end;*}

//00570DDC
procedure TJvWndProcHook.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00570DDC    push        ebx
 00570DDD    push        esi
 00570DDE    push        edi
 00570DDF    mov         ebx,ecx
 00570DE1    mov         esi,edx
 00570DE3    mov         edi,eax
 00570DE5    mov         ecx,ebx
 00570DE7    mov         edx,esi
 00570DE9    mov         eax,edi
 00570DEB    call        TComponent.Notification
 00570DF0    cmp         bl,1
>00570DF3    jne         00570E2A
 00570DF5    cmp         dword ptr [edi+34],0;TJvWndProcHook...........................FHookInfos:TList
>00570DF9    je          00570E2A
 00570DFB    mov         eax,esi
 00570DFD    mov         edx,dword ptr ds:[47A16C];TControl
 00570E03    call        @IsClass
 00570E08    test        al,al
>00570E0A    je          00570E2A
 00570E0C    mov         edx,esi
 00570E0E    mov         eax,edi
 00570E10    call        00570DA4
 00570E15    mov         ebx,eax
 00570E17    test        ebx,ebx
>00570E19    jl          00570E2A
 00570E1B    mov         edx,ebx
 00570E1D    mov         eax,dword ptr [edi+34];TJvWndProcHook............................FHookInfos:TList
 00570E20    call        TList.Get
 00570E25    call        TJvHookInfos.ControlDestroyed
 00570E2A    pop         edi
 00570E2B    pop         esi
 00570E2C    pop         ebx
 00570E2D    ret
*}
end;

//00570E30
{*function TJvWndProcHook.RegisterWndProc(AControl:TControl; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;
begin
 00570E30    push        ebp
 00570E31    mov         ebp,esp
 00570E33    push        ecx
 00570E34    push        ebx
 00570E35    push        esi
 00570E36    push        edi
 00570E37    mov         byte ptr [ebp-1],cl
 00570E3A    mov         esi,edx
 00570E3C    mov         ebx,eax
 00570E3E    xor         eax,eax
 00570E40    test        esi,esi
>00570E42    je          00570EAA
 00570E44    test        byte ptr [esi+1C],8;TControl.FComponentState:TComponentState
>00570E48    jne         00570EAA
 00570E4A    cmp         word ptr [ebp+0A],0
>00570E4F    je          00570EAA
 00570E51    cmp         dword ptr [ebx+34],0;TJvWndProcHook.............................FHookInfos:TList
>00570E55    jne         00570E66
 00570E57    mov         dl,1
 00570E59    mov         eax,[00439644];TList
 00570E5E    call        TObject.Create;TList.Create
 00570E63    mov         dword ptr [ebx+34],eax;TJvWndProcHook..............................FHookInfos:TList
 00570E66    mov         edx,esi
 00570E68    mov         eax,ebx
 00570E6A    call        00570D48
 00570E6F    mov         edi,eax
 00570E71    test        edi,edi
>00570E73    jne         00570E97
 00570E75    mov         ecx,esi
 00570E77    mov         dl,1
 00570E79    mov         eax,[00570404];TJvHookInfos
 00570E7E    call        TJvHookInfos.Create;TJvHookInfos.Create
 00570E83    mov         edi,eax
 00570E85    mov         edx,ebx
 00570E87    mov         eax,edi
 00570E89    call        005712F0
 00570E8E    mov         edx,ebx
 00570E90    mov         eax,esi
 00570E92    call        TComponent.FreeNotification
 00570E97    push        dword ptr [ebp+0C]
 00570E9A    push        dword ptr [ebp+8]
 00570E9D    movzx       edx,byte ptr [ebp-1]
 00570EA1    mov         eax,edi
 00570EA3    call        TJvHookInfos.Add
 00570EA8    mov         al,1
 00570EAA    pop         edi
 00570EAB    pop         esi
 00570EAC    pop         ebx
 00570EAD    pop         ecx
 00570EAE    pop         ebp
 00570EAF    ret         8
end;*}

//00570EB4
{*function TJvWndProcHook.RegisterWndProc(AHandle:Cardinal; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;
begin
 00570EB4    push        ebp
 00570EB5    mov         ebp,esp
 00570EB7    push        ecx
 00570EB8    push        ebx
 00570EB9    push        esi
 00570EBA    push        edi
 00570EBB    mov         byte ptr [ebp-1],cl
 00570EBE    mov         ebx,edx
 00570EC0    mov         edi,eax
 00570EC2    xor         eax,eax
 00570EC4    cmp         word ptr [ebp+0A],0
>00570EC9    je          00570F1B
 00570ECB    cmp         dword ptr [edi+34],0;TJvWndProcHook...............................FHookInfos:TList
>00570ECF    jne         00570EE0
 00570ED1    mov         dl,1
 00570ED3    mov         eax,[00439644];TList
 00570ED8    call        TObject.Create;TList.Create
 00570EDD    mov         dword ptr [edi+34],eax;TJvWndProcHook................................FHookInfos:TList
 00570EE0    mov         edx,ebx
 00570EE2    mov         eax,edi
 00570EE4    call        00570D24
 00570EE9    mov         esi,eax
 00570EEB    test        esi,esi
>00570EED    jne         00570F08
 00570EEF    mov         ecx,ebx
 00570EF1    mov         dl,1
 00570EF3    mov         eax,[00570404];TJvHookInfos
 00570EF8    call        TJvHookInfos.Create;TJvHookInfos.Create
 00570EFD    mov         esi,eax
 00570EFF    mov         edx,edi
 00570F01    mov         eax,esi
 00570F03    call        005712F0
 00570F08    push        dword ptr [ebp+0C]
 00570F0B    push        dword ptr [ebp+8]
 00570F0E    movzx       edx,byte ptr [ebp-1]
 00570F12    mov         eax,esi
 00570F14    call        TJvHookInfos.Add
 00570F19    mov         al,1
 00570F1B    pop         edi
 00570F1C    pop         esi
 00570F1D    pop         ebx
 00570F1E    pop         ecx
 00570F1F    pop         ebp
 00570F20    ret         8
end;*}

//00570F24
procedure sub_00570F24(?:TJvWndProcHook);
begin
{*
 00570F24    push        ebx
 00570F25    mov         ebx,eax
 00570F27    mov         eax,dword ptr [ebx+34]
 00570F2A    call        TList.IndexOf
 00570F2F    test        eax,eax
>00570F31    jl          00570F3D
 00570F33    mov         edx,eax
 00570F35    mov         eax,dword ptr [ebx+34]
 00570F38    call        TList.Delete
 00570F3D    pop         ebx
 00570F3E    ret
*}
end;

//00570F40
{*function TJvWndProcHook.UnRegisterWndProc(AHandle:Cardinal; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;
begin
 00570F40    push        ebp
 00570F41    mov         ebp,esp
 00570F43    push        ecx
 00570F44    push        ebx
 00570F45    mov         byte ptr [ebp-1],cl
 00570F48    xor         ebx,ebx
 00570F4A    cmp         word ptr [ebp+0A],0
>00570F4F    je          00570F74
 00570F51    cmp         dword ptr [eax+34],0;TJvWndProcHook.................................FHookInfos:TList
>00570F55    je          00570F74
 00570F57    call        00570D24
 00570F5C    test        eax,eax
 00570F5E    setne       bl
 00570F61    test        bl,bl
>00570F63    je          00570F74
 00570F65    push        dword ptr [ebp+0C]
 00570F68    push        dword ptr [ebp+8]
 00570F6B    movzx       edx,byte ptr [ebp-1]
 00570F6F    call        TJvHookInfos.Delete
 00570F74    mov         eax,ebx
 00570F76    pop         ebx
 00570F77    pop         ecx
 00570F78    pop         ebp
 00570F79    ret         8
end;*}

//00570F7C
{*function TJvWndProcHook.UnRegisterWndProc(AControl:TControl; Order:TJvHookOrder; Hook:TJvControlHook; ?:?; ?:?):Boolean;
begin
 00570F7C    push        ebp
 00570F7D    mov         ebp,esp
 00570F7F    push        ecx
 00570F80    push        ebx
 00570F81    mov         byte ptr [ebp-1],cl
 00570F84    xor         ebx,ebx
 00570F86    test        edx,edx
>00570F88    je          00570FB4
 00570F8A    cmp         word ptr [ebp+0A],0
>00570F8F    je          00570FB4
 00570F91    cmp         dword ptr [eax+34],0;TJvWndProcHook..................................FHookInfos:TList
>00570F95    je          00570FB4
 00570F97    call        00570D48
 00570F9C    test        eax,eax
 00570F9E    setne       bl
 00570FA1    test        bl,bl
>00570FA3    je          00570FB4
 00570FA5    push        dword ptr [ebp+0C]
 00570FA8    push        dword ptr [ebp+8]
 00570FAB    movzx       edx,byte ptr [ebp-1]
 00570FAF    call        TJvHookInfos.Delete
 00570FB4    mov         eax,ebx
 00570FB6    pop         ebx
 00570FB7    pop         ecx
 00570FB8    pop         ebp
 00570FB9    ret         8
end;*}

//00570FBC
{*procedure TJvHookInfos.Add(Order:TJvHookOrder; Hook:TJvControlHook; ?:?);
begin
 00570FBC    push        ebp
 00570FBD    mov         ebp,esp
 00570FBF    push        ecx
 00570FC0    push        ebx
 00570FC1    mov         byte ptr [ebp-1],dl
 00570FC4    mov         ebx,eax
 00570FC6    mov         eax,10
 00570FCB    call        @GetMem
 00570FD0    mov         edx,eax
 00570FD2    mov         eax,dword ptr [ebp+8]
 00570FD5    mov         dword ptr [edx],eax
 00570FD7    mov         eax,dword ptr [ebp+0C]
 00570FDA    mov         dword ptr [edx+4],eax
 00570FDD    xor         eax,eax
 00570FDF    mov         dword ptr [edx+8],eax
 00570FE2    movzx       eax,byte ptr [ebp-1]
 00570FE6    cmp         dword ptr [ebx+eax*4+4],0
>00570FEB    jne         00570FF1
 00570FED    mov         dword ptr [ebx+eax*4+4],edx
 00570FF1    cmp         dword ptr [ebx+eax*4+0C],0
>00570FF6    je          00571003
 00570FF8    movzx       ecx,byte ptr [ebp-1]
 00570FFC    mov         ecx,dword ptr [ebx+ecx*4+0C]
 00571000    mov         dword ptr [ecx+8],edx
 00571003    mov         dword ptr [ebx+eax*4+0C],edx
 00571007    cmp         byte ptr [ebp-1],0
>0057100B    jne         00571011
 0057100D    xor         eax,eax
>0057100F    jmp         00571027
 00571011    mov         eax,1
>00571016    jmp         00571027
 00571018    mov         ecx,dword ptr [ebx+14];TJvHookInfos.FStack:PHookInfoList
 0057101B    cmp         dword ptr [ecx+eax*4],0
>0057101F    jne         00571024
 00571021    mov         dword ptr [ecx+eax*4],edx
 00571024    add         eax,2
 00571027    mov         ecx,dword ptr [ebx+1C];TJvHookInfos.FStackCount:Integer
 0057102A    add         ecx,ecx
 0057102C    cmp         eax,ecx
>0057102E    jl          00571018
 00571030    mov         eax,ebx
 00571032    call        00571250
 00571037    pop         ebx
 00571038    pop         ecx
 00571039    pop         ebp
 0057103A    ret         8
end;*}

//00571040
procedure TJvHookInfos.ControlDestroyed;
begin
{*
 00571040    push        ebx
 00571041    mov         ebx,eax
 00571043    cmp         byte ptr [ebx+28],0;TJvHookInfos.FControlDestroyed:Boolean
>00571047    jne         0057106A
 00571049    mov         byte ptr [ebx+28],1;TJvHookInfos.FControlDestroyed:Boolean
 0057104D    xor         eax,eax
 0057104F    mov         dword ptr [ebx+30],eax;TJvHookInfos.FOldWndProc:TWndMethod
 00571052    mov         dword ptr [ebx+34],eax;TJvHookInfos.?f34:dword
 00571055    xor         eax,eax
 00571057    mov         dword ptr [ebx+38],eax;TJvHookInfos.FOldWndProcHandle:Pointer
 0057105A    xor         edx,edx
 0057105C    mov         eax,ebx
 0057105E    call        005712F0
 00571063    mov         eax,ebx
 00571065    call        00570C98
 0057106A    pop         ebx
 0057106B    ret
*}
end;

//0057106C
constructor TJvHookInfos.Create(AControl:TControl);
begin
{*
 0057106C    push        ebx
 0057106D    push        esi
 0057106E    push        edi
 0057106F    test        dl,dl
>00571071    je          0057107B
 00571073    add         esp,0FFFFFFF0
 00571076    call        @ClassCreate
 0057107B    mov         esi,ecx
 0057107D    mov         ebx,edx
 0057107F    mov         edi,eax
 00571081    xor         edx,edx
 00571083    mov         eax,edi
 00571085    call        TObject.Create
 0057108A    mov         dword ptr [edi+24],esi;TJvHookInfos.FControl:TControl
 0057108D    lea         eax,[edi+4];TJvHookInfos.FFirst:?
 00571090    xor         ecx,ecx
 00571092    mov         edx,8
 00571097    call        @FillChar
 0057109C    lea         eax,[edi+0C];TJvHookInfos.FLast:?
 0057109F    xor         ecx,ecx
 005710A1    mov         edx,8
 005710A6    call        @FillChar
 005710AB    mov         eax,edi
 005710AD    test        bl,bl
>005710AF    je          005710C0
 005710B1    call        @AfterConstruction
 005710B6    pop         dword ptr fs:[0]
 005710BD    add         esp,0C
 005710C0    mov         eax,edi
 005710C2    pop         edi
 005710C3    pop         esi
 005710C4    pop         ebx
 005710C5    ret
*}
end;

//005710C8
constructor TJvHookInfos.Create(AHandle:Cardinal);
begin
{*
 005710C8    push        ebx
 005710C9    push        esi
 005710CA    push        edi
 005710CB    test        dl,dl
>005710CD    je          005710D7
 005710CF    add         esp,0FFFFFFF0
 005710D2    call        @ClassCreate
 005710D7    mov         esi,ecx
 005710D9    mov         ebx,edx
 005710DB    mov         edi,eax
 005710DD    xor         edx,edx
 005710DF    mov         eax,edi
 005710E1    call        TObject.Create
 005710E6    mov         dword ptr [edi+20],esi;TJvHookInfos.FHandle:Cardinal
 005710E9    lea         eax,[edi+4];TJvHookInfos.FFirst:?
 005710EC    xor         ecx,ecx
 005710EE    mov         edx,8
 005710F3    call        @FillChar
 005710F8    lea         eax,[edi+0C];TJvHookInfos.FLast:?
 005710FB    xor         ecx,ecx
 005710FD    mov         edx,8
 00571102    call        @FillChar
 00571107    mov         eax,edi
 00571109    test        bl,bl
>0057110B    je          0057111C
 0057110D    call        @AfterConstruction
 00571112    pop         dword ptr fs:[0]
 00571119    add         esp,0C
 0057111C    mov         eax,edi
 0057111E    pop         edi
 0057111F    pop         esi
 00571120    pop         ebx
 00571121    ret
*}
end;

//00571124
{*procedure sub_00571124(?:?);
begin
 00571124    cmp         dword ptr [eax+1C],0
>00571128    jle         0057112D
 0057112A    dec         dword ptr [eax+1C]
 0057112D    ret
end;*}

//00571130
{*procedure TJvHookInfos.Delete(Order:TJvHookOrder; Hook:TJvControlHook; ?:?);
begin
 00571130    push        ebp
 00571131    mov         ebp,esp
 00571133    push        ebx
 00571134    push        esi
 00571135    mov         ebx,eax
 00571137    movzx       eax,dl
 0057113A    mov         eax,dword ptr [ebx+eax*4+4]
 0057113E    xor         esi,esi
>00571140    jmp         00571147
 00571142    mov         esi,eax
 00571144    mov         eax,dword ptr [eax+8]
 00571147    test        eax,eax
>00571149    je          0057115A
 0057114B    mov         ecx,dword ptr [eax]
 0057114D    cmp         ecx,dword ptr [ebp+8]
>00571150    jne         00571142
 00571152    mov         ecx,dword ptr [ebp+0C]
 00571155    cmp         ecx,dword ptr [eax+4]
>00571158    jne         00571142
 0057115A    test        eax,eax
>0057115C    je          005711D1
 0057115E    test        esi,esi
>00571160    je          00571168
 00571162    mov         ecx,dword ptr [eax+8]
 00571165    mov         dword ptr [esi+8],ecx
 00571168    movzx       ecx,dl
 0057116B    cmp         eax,dword ptr [ebx+ecx*4+0C]
>0057116F    jne         00571178
 00571171    movzx       ecx,dl
 00571174    mov         dword ptr [ebx+ecx*4+0C],esi
 00571178    movzx       ecx,dl
 0057117B    cmp         eax,dword ptr [ebx+ecx*4+4]
>0057117F    jne         0057118B
 00571181    movzx       ecx,dl
 00571184    mov         esi,dword ptr [eax+8]
 00571187    mov         dword ptr [ebx+ecx*4+4],esi
 0057118B    test        dl,dl
>0057118D    jne         00571193
 0057118F    xor         edx,edx
>00571191    jmp         005711AB
 00571193    mov         edx,1
>00571198    jmp         005711AB
 0057119A    mov         esi,dword ptr [ebx+14];TJvHookInfos.FStack:PHookInfoList
 0057119D    cmp         eax,dword ptr [esi+edx*4]
>005711A0    jne         005711A8
 005711A2    mov         ecx,dword ptr [eax+8]
 005711A5    mov         dword ptr [esi+edx*4],ecx
 005711A8    add         edx,2
 005711AB    mov         ecx,dword ptr [ebx+1C];TJvHookInfos.FStackCount:Integer
 005711AE    add         ecx,ecx
 005711B0    cmp         edx,ecx
>005711B2    jl          0057119A
 005711B4    mov         edx,10
 005711B9    call        @FreeMem
 005711BE    cmp         dword ptr [ebx+4],0;TJvHookInfos.FFirst:?
>005711C2    jne         005711D1
 005711C4    cmp         dword ptr [ebx+8],0;TJvHookInfos.?f8:dword
>005711C8    jne         005711D1
 005711CA    mov         eax,ebx
 005711CC    call        0057131C
 005711D1    pop         esi
 005711D2    pop         ebx
 005711D3    pop         ebp
 005711D4    ret         8
end;*}

//005711D8
destructor TJvHookInfos.Destroy();
begin
{*
 005711D8    push        ebx
 005711D9    push        esi
 005711DA    push        edi
 005711DB    push        ebp
 005711DC    push        ecx
 005711DD    call        @BeforeDestruction
 005711E2    mov         byte ptr [esp],dl
 005711E5    mov         esi,eax
 005711E7    xor         edx,edx
 005711E9    mov         eax,esi
 005711EB    call        005712F0
 005711F0    mov         eax,esi
 005711F2    call        0057131C
 005711F7    xor         ebx,ebx
>005711F9    jmp         00571213
 005711FB    mov         edi,ebp
 005711FD    movzx       eax,bl
 00571200    mov         edx,dword ptr [edi+8]
 00571203    mov         dword ptr [esi+eax*4+4],edx
 00571207    mov         edx,10
 0057120C    mov         eax,edi
 0057120E    call        @FreeMem
 00571213    movzx       eax,bl
 00571216    mov         ebp,dword ptr [esi+eax*4+4]
 0057121A    test        ebp,ebp
>0057121C    jne         005711FB
 0057121E    inc         ebx
 0057121F    cmp         bl,2
>00571222    jne         00571213
 00571224    mov         eax,dword ptr [esi+14];TJvHookInfos.FStack:PHookInfoList
 00571227    call        @FreeMem
 0057122C    movzx       edx,byte ptr [esp]
 00571230    and         dl,0FC
 00571233    mov         eax,esi
 00571235    call        TObject.Destroy
 0057123A    cmp         byte ptr [esp],0
>0057123E    jle         00571247
 00571240    mov         eax,esi
 00571242    call        @ClassDestroy
 00571247    pop         edx
 00571248    pop         ebp
 00571249    pop         edi
 0057124A    pop         esi
 0057124B    pop         ebx
 0057124C    ret
*}
end;

//00571250
procedure sub_00571250(?:TJvHookInfos);
begin
{*
 00571250    push        ebx
 00571251    mov         ebx,eax
 00571253    cmp         byte ptr [ebx+3C],0;TJvHookInfos.FHooked:Boolean
>00571257    jne         005712BB
 00571259    cmp         byte ptr [ebx+28],0;TJvHookInfos.FControlDestroyed:Boolean
>0057125D    jne         005712BB
 0057125F    mov         eax,dword ptr [ebx+24];TJvHookInfos.FControl:TControl
 00571262    test        eax,eax
>00571264    je          0057128A
 00571266    mov         edx,dword ptr [eax+38];TControl.FWindowProc:TWndMethod
 00571269    mov         dword ptr [ebx+30],edx;TJvHookInfos.FOldWndProc:TWndMethod
 0057126C    mov         edx,dword ptr [eax+3C];TControl.?f3C:TJvHookInfos
 0057126F    mov         dword ptr [ebx+34],edx;TJvHookInfos.?f34:dword
 00571272    xor         eax,eax
 00571274    mov         dword ptr [ebx+38],eax;TJvHookInfos.FOldWndProcHandle:Pointer
 00571277    mov         eax,dword ptr [ebx+24];TJvHookInfos.FControl:TControl
 0057127A    mov         dword ptr [eax+3C],ebx;TControl.?f3C:TJvHookInfos
 0057127D    mov         dword ptr [eax+38],571370;TControl.FWindowProc:TWndMethod sub_00571370
 00571284    mov         byte ptr [ebx+3C],1;TJvHookInfos.FHooked:Boolean
>00571288    jmp         005712BB
 0057128A    xor         eax,eax
 0057128C    mov         dword ptr [ebx+30],eax;TJvHookInfos.FOldWndProc:TWndMethod
 0057128F    mov         dword ptr [ebx+34],eax;TJvHookInfos.?f34:dword
 00571292    push        0FC
 00571294    mov         eax,dword ptr [ebx+20];TJvHookInfos.FHandle:Cardinal
 00571297    push        eax
 00571298    call        user32.GetWindowLongW
 0057129D    mov         dword ptr [ebx+38],eax;TJvHookInfos.FOldWndProcHandle:Pointer
 005712A0    push        ebx
 005712A1    push        571370;sub_00571370
 005712A6    call        MakeObjectInstance
 005712AB    push        eax
 005712AC    push        0FC
 005712AE    mov         eax,dword ptr [ebx+20];TJvHookInfos.FHandle:Cardinal
 005712B1    push        eax
 005712B2    call        user32.SetWindowLongW
 005712B7    mov         byte ptr [ebx+3C],1;TJvHookInfos.FHooked:Boolean
 005712BB    pop         ebx
 005712BC    ret
*}
end;

//005712C0
{*procedure sub_005712C0(?:?);
begin
 005712C0    push        ebx
 005712C1    mov         ebx,eax
 005712C3    mov         eax,dword ptr [ebx+1C]
 005712C6    cmp         eax,dword ptr [ebx+18]
>005712C9    jl          005712E9
 005712CB    inc         dword ptr [ebx+18]
 005712CE    mov         eax,dword ptr [ebx+18]
 005712D1    add         eax,eax
 005712D3    mov         dword ptr [ebx+18],eax
 005712D6    mov         eax,dword ptr [ebx+18]
 005712D9    add         eax,eax
 005712DB    mov         edx,eax
 005712DD    add         edx,edx
 005712DF    add         edx,edx
 005712E1    lea         eax,[ebx+14]
 005712E4    call        @ReallocMem
 005712E9    inc         dword ptr [ebx+1C]
 005712EC    pop         ebx
 005712ED    ret
end;*}

//005712F0
procedure sub_005712F0(?:TJvHookInfos; ?:TJvWndProcHook);
begin
{*
 005712F0    push        ebx
 005712F1    push        esi
 005712F2    mov         esi,edx
 005712F4    mov         ebx,eax
 005712F6    mov         eax,dword ptr [ebx+40];TJvHookInfos.FController:TJvWndProcHook
 005712F9    cmp         esi,eax
>005712FB    je          00571318
 005712FD    test        eax,eax
>005712FF    je          00571308
 00571301    mov         edx,ebx
 00571303    call        00570F24
 00571308    mov         eax,esi
 0057130A    mov         dword ptr [ebx+40],eax;TJvHookInfos.FController:TJvWndProcHook
 0057130D    test        eax,eax
>0057130F    je          00571318
 00571311    mov         edx,ebx
 00571313    call        00570CB0
 00571318    pop         esi
 00571319    pop         ebx
 0057131A    ret
*}
end;

//0057131C
procedure sub_0057131C(?:TJvHookInfos);
begin
{*
 0057131C    push        ebx
 0057131D    push        esi
 0057131E    mov         ebx,eax
 00571320    cmp         byte ptr [ebx+3C],0;TJvHookInfos.FHooked:Boolean
>00571324    je          0057136C
 00571326    cmp         byte ptr [ebx+28],0;TJvHookInfos.FControlDestroyed:Boolean
>0057132A    jne         0057136C
 0057132C    mov         eax,dword ptr [ebx+24];TJvHookInfos.FControl:TControl
 0057132F    test        eax,eax
>00571331    je          00571345
 00571333    mov         edx,dword ptr [ebx+30];TJvHookInfos.FOldWndProc:TWndMethod
 00571336    mov         dword ptr [eax+38],edx;TControl.FWindowProc:TWndMethod
 00571339    mov         edx,dword ptr [ebx+34];TJvHookInfos.?f34:dword
 0057133C    mov         dword ptr [eax+3C],edx;TControl.?f3C:TJvHookInfos
 0057133F    mov         byte ptr [ebx+3C],0;TJvHookInfos.FHooked:Boolean
>00571343    jmp         0057136C
 00571345    push        0FC
 00571347    mov         eax,dword ptr [ebx+20];TJvHookInfos.FHandle:Cardinal
 0057134A    push        eax
 0057134B    call        user32.GetWindowLongW
 00571350    mov         esi,eax
 00571352    mov         eax,dword ptr [ebx+38];TJvHookInfos.FOldWndProcHandle:Pointer
 00571355    push        eax
 00571356    push        0FC
 00571358    mov         eax,dword ptr [ebx+20];TJvHookInfos.FHandle:Cardinal
 0057135B    push        eax
 0057135C    call        user32.SetWindowLongW
 00571361    mov         eax,esi
 00571363    call        FreeObjectInstance
 00571368    mov         byte ptr [ebx+3C],0;TJvHookInfos.FHooked:Boolean
 0057136C    pop         esi
 0057136D    pop         ebx
 0057136E    ret
*}
end;

//00571370
{*procedure sub_00571370(?:?; ?:?);
begin
 00571370    push        ebp
 00571371    mov         ebp,esp
 00571373    add         esp,0FFFFFFF8
 00571376    push        ebx
 00571377    push        esi
 00571378    mov         dword ptr [ebp-8],edx
 0057137B    mov         dword ptr [ebp-4],eax
 0057137E    mov         eax,dword ptr [ebp-8]
 00571381    xor         edx,edx
 00571383    mov         dword ptr [eax+0C],edx
 00571386    mov         eax,dword ptr [ebp-4]
 00571389    call        005712C0
 0057138E    xor         eax,eax
 00571390    push        ebp
 00571391    push        5714EC
 00571396    push        dword ptr fs:[eax]
 00571399    mov         dword ptr fs:[eax],esp
 0057139C    mov         eax,dword ptr [ebp-4]
 0057139F    mov         eax,dword ptr [eax+1C]
 005713A2    dec         eax
 005713A3    mov         ebx,eax
 005713A5    add         ebx,ebx
 005713A7    mov         eax,dword ptr [ebp-4]
 005713AA    mov         eax,dword ptr [eax+14]
 005713AD    mov         edx,dword ptr [ebp-4]
 005713B0    mov         edx,dword ptr [edx+4]
 005713B3    mov         dword ptr [eax+ebx*4],edx
>005713B6    jmp         005713F5
 005713B8    mov         eax,dword ptr [ebp-4]
 005713BB    mov         eax,dword ptr [eax+14]
 005713BE    mov         esi,dword ptr [eax+ebx*4]
 005713C1    mov         eax,dword ptr [ebp-4]
 005713C4    mov         eax,dword ptr [eax+14]
 005713C7    mov         eax,dword ptr [eax+ebx*4]
 005713CA    mov         eax,dword ptr [eax+8]
 005713CD    mov         edx,dword ptr [ebp-4]
 005713D0    mov         edx,dword ptr [edx+14]
 005713D3    mov         dword ptr [edx+ebx*4],eax
 005713D6    mov         edx,dword ptr [ebp-8]
 005713D9    mov         eax,dword ptr [esi+4]
 005713DC    call        dword ptr [esi]
 005713DE    test        al,al
>005713E0    jne         005713EB
 005713E2    mov         eax,dword ptr [ebp-4]
 005713E5    cmp         byte ptr [eax+28],0
>005713E9    je          005713F5
 005713EB    call        @TryFinallyExit
>005713F0    jmp         005714F3
 005713F5    mov         eax,dword ptr [ebp-4]
 005713F8    mov         eax,dword ptr [eax+14]
 005713FB    cmp         dword ptr [eax+ebx*4],0
>005713FF    jne         005713B8
 00571401    mov         eax,dword ptr [ebp-4]
 00571404    cmp         word ptr [eax+32],0
>00571409    je          00571419
 0057140B    mov         edx,dword ptr [ebp-8]
 0057140E    mov         ebx,dword ptr [ebp-4]
 00571411    mov         eax,dword ptr [ebx+34]
 00571414    call        dword ptr [ebx+30]
>00571417    jmp         0057144A
 00571419    mov         eax,dword ptr [ebp-4]
 0057141C    mov         ebx,dword ptr [eax+38]
 0057141F    test        ebx,ebx
>00571421    je          0057144A
 00571423    mov         eax,dword ptr [ebp-8]
 00571426    mov         eax,dword ptr [eax+8]
 00571429    push        eax
 0057142A    mov         eax,dword ptr [ebp-8]
 0057142D    mov         eax,dword ptr [eax+4]
 00571430    push        eax
 00571431    mov         eax,dword ptr [ebp-8]
 00571434    mov         eax,dword ptr [eax]
 00571436    push        eax
 00571437    mov         eax,dword ptr [ebp-4]
 0057143A    mov         eax,dword ptr [eax+20]
 0057143D    push        eax
 0057143E    push        ebx
 0057143F    call        user32.CallWindowProcW
 00571444    mov         edx,dword ptr [ebp-8]
 00571447    mov         dword ptr [edx+0C],eax
 0057144A    mov         eax,dword ptr [ebp-4]
 0057144D    cmp         byte ptr [eax+28],0
>00571451    je          0057145D
 00571453    call        @TryFinallyExit
>00571458    jmp         005714F3
 0057145D    mov         eax,dword ptr [ebp-4]
 00571460    mov         ebx,dword ptr [eax+1C]
 00571463    add         ebx,ebx
 00571465    dec         ebx
 00571466    mov         eax,dword ptr [ebp-4]
 00571469    mov         eax,dword ptr [eax+14]
 0057146C    mov         edx,dword ptr [ebp-4]
 0057146F    mov         edx,dword ptr [edx+8]
 00571472    mov         dword ptr [eax+ebx*4],edx
>00571475    jmp         005714B1
 00571477    mov         eax,dword ptr [ebp-4]
 0057147A    mov         eax,dword ptr [eax+14]
 0057147D    mov         esi,dword ptr [eax+ebx*4]
 00571480    mov         eax,dword ptr [ebp-4]
 00571483    mov         eax,dword ptr [eax+14]
 00571486    mov         eax,dword ptr [eax+ebx*4]
 00571489    mov         eax,dword ptr [eax+8]
 0057148C    mov         edx,dword ptr [ebp-4]
 0057148F    mov         edx,dword ptr [edx+14]
 00571492    mov         dword ptr [edx+ebx*4],eax
 00571495    mov         edx,dword ptr [ebp-8]
 00571498    mov         eax,dword ptr [esi+4]
 0057149B    call        dword ptr [esi]
 0057149D    test        al,al
>0057149F    jne         005714AA
 005714A1    mov         eax,dword ptr [ebp-4]
 005714A4    cmp         byte ptr [eax+28],0
>005714A8    je          005714B1
 005714AA    call        @TryFinallyExit
>005714AF    jmp         005714F3
 005714B1    mov         eax,dword ptr [ebp-4]
 005714B4    mov         eax,dword ptr [eax+14]
 005714B7    cmp         dword ptr [eax+ebx*4],0
>005714BB    jne         00571477
 005714BD    xor         eax,eax
 005714BF    pop         edx
 005714C0    pop         ecx
 005714C1    pop         ecx
 005714C2    mov         dword ptr fs:[eax],edx
 005714C5    push        5714F3
 005714CA    mov         eax,dword ptr [ebp-4]
 005714CD    call        00571124
 005714D2    mov         eax,dword ptr [ebp-4]
 005714D5    cmp         dword ptr [eax+24],0
>005714D9    jne         005714EB
 005714DB    mov         eax,dword ptr [ebp-8]
 005714DE    cmp         dword ptr [eax],2
>005714E1    jne         005714EB
 005714E3    mov         eax,dword ptr [ebp-4]
 005714E6    call        TJvHookInfos.ControlDestroyed
 005714EB    ret
>005714EC    jmp         @HandleFinally
>005714F1    jmp         005714CA
 005714F3    pop         esi
 005714F4    pop         ebx
 005714F5    pop         ecx
 005714F6    pop         ecx
 005714F7    pop         ebp
 005714F8    ret
end;*}

//005714FC
constructor TJvWindowHook.Create(AOwner:TComponent);
begin
{*
 005714FC    push        ebx
 005714FD    push        esi
 005714FE    test        dl,dl
>00571500    je          0057150A
 00571502    add         esp,0FFFFFFF0
 00571505    call        @ClassCreate
 0057150A    mov         ebx,edx
 0057150C    mov         esi,eax
 0057150E    xor         edx,edx
 00571510    mov         eax,esi
 00571512    call        TComponent.Create
 00571517    mov         byte ptr [esi+38],1;TJvWindowHook.FActive:Boolean
 0057151B    mov         eax,esi
 0057151D    test        bl,bl
>0057151F    je          00571530
 00571521    call        @AfterConstruction
 00571526    pop         dword ptr fs:[0]
 0057152D    add         esp,0C
 00571530    mov         eax,esi
 00571532    pop         esi
 00571533    pop         ebx
 00571534    ret
*}
end;

//00571538
{*function sub_00571538(?:?):?;
begin
 00571538    push        ebp
 00571539    mov         ebp,esp
 0057153B    push        ebx
 0057153C    mov         eax,dword ptr [ebp+8]
 0057153F    mov         eax,dword ptr [eax-4]
 00571542    cmp         dword ptr [eax+20],0
>00571546    je          0057156B
 00571548    mov         eax,dword ptr [ebp+8]
 0057154B    mov         eax,dword ptr [eax-8]
 0057154E    call        00571668
 00571553    mov         ebx,eax
 00571555    mov         eax,dword ptr [ebp+8]
 00571558    mov         eax,dword ptr [eax-4]
 0057155B    mov         eax,dword ptr [eax+20]
 0057155E    call        00571668
 00571563    cmp         bl,al
 00571565    setne       al
 00571568    pop         ebx
 00571569    pop         ebp
 0057156A    ret
 0057156B    mov         eax,dword ptr [ebp+8]
 0057156E    mov         eax,dword ptr [eax-8]
 00571571    call        00571668
 00571576    pop         ebx
 00571577    pop         ebp
 00571578    ret
end;*}

//0057157C
procedure TJvWindowHook.DefineProperties(Filer:TFiler);
begin
{*
 0057157C    push        ebp
 0057157D    mov         ebp,esp
 0057157F    add         esp,0FFFFFFF8
 00571582    push        ebx
 00571583    mov         dword ptr [ebp-4],edx
 00571586    mov         dword ptr [ebp-8],eax
 00571589    mov         edx,dword ptr [ebp-4]
 0057158C    mov         eax,dword ptr [ebp-8]
 0057158F    call        TComponent.DefineProperties
 00571594    mov         eax,dword ptr [ebp-8]
 00571597    push        eax
 00571598    push        571704
 0057159D    mov         eax,dword ptr [ebp-8]
 005715A0    push        eax
 005715A1    push        571944
 005715A6    push        ebp
 005715A7    call        00571538
 005715AC    pop         ecx
 005715AD    mov         ecx,eax
 005715AF    mov         edx,5715D0;'IsForm'
 005715B4    mov         eax,dword ptr [ebp-4]
 005715B7    mov         ebx,dword ptr [eax]
 005715B9    call        dword ptr [ebx+4];TFiler.DefineProperty
 005715BC    pop         ebx
 005715BD    pop         ecx
 005715BE    pop         ecx
 005715BF    pop         ebp
 005715C0    ret
*}
end;

//005715E0
destructor TJvWindowHook.Destroy();
begin
{*
 005715E0    push        ebx
 005715E1    push        esi
 005715E2    call        @BeforeDestruction
 005715E7    mov         ebx,edx
 005715E9    mov         esi,eax
 005715EB    xor         edx,edx
 005715ED    mov         eax,esi
 005715EF    call        TJvWindowHook.SetActive
 005715F4    xor         edx,edx
 005715F6    mov         eax,esi
 005715F8    call        TJvWindowHook.SetControl
 005715FD    mov         edx,ebx
 005715FF    and         dl,0FC
 00571602    mov         eax,esi
 00571604    call        TComponent.Destroy
 00571609    test        bl,bl
>0057160B    jle         00571614
 0057160D    mov         eax,esi
 0057160F    call        @ClassDestroy
 00571614    pop         esi
 00571615    pop         ebx
 00571616    ret
*}
end;

//00571618
{*procedure TJvWindowHook.sub_00571618(?:?);
begin
 00571618    push        ebx
 00571619    push        ecx
 0057161A    mov         byte ptr [esp],0
 0057161E    cmp         word ptr [eax+4A],0;TJvWindowHook.?f4A:word
>00571623    je          00571632
 00571625    push        esp
 00571626    mov         ecx,edx
 00571628    mov         ebx,eax
 0057162A    mov         edx,eax
 0057162C    mov         eax,dword ptr [ebx+4C];TJvWindowHook.?f4C:dword
 0057162F    call        dword ptr [ebx+48];TJvWindowHook.FAfterMessage
 00571632    movzx       eax,byte ptr [esp]
 00571636    pop         edx
 00571637    pop         ebx
 00571638    ret
end;*}

//0057163C
{*procedure TJvWindowHook.sub_0057163C(?:?);
begin
 0057163C    push        ebx
 0057163D    push        ecx
 0057163E    mov         byte ptr [esp],0
 00571642    cmp         word ptr [eax+42],0;TJvWindowHook.?f42:word
>00571647    je          00571656
 00571649    push        esp
 0057164A    mov         ecx,edx
 0057164C    mov         ebx,eax
 0057164E    mov         edx,eax
 00571650    mov         eax,dword ptr [ebx+44];TJvWindowHook.?f44:dword
 00571653    call        dword ptr [ebx+40];TJvWindowHook.FBeforeMessage
 00571656    movzx       eax,byte ptr [esp]
 0057165A    pop         edx
 0057165B    pop         ebx
 0057165C    ret
end;*}

//00571660
procedure TJvWindowHook.HookControl;
begin
{*
 00571660    mov         dl,1
 00571662    call        TJvWindowHook.SetActive
 00571667    ret
*}
end;

//00571668
{*function sub_00571668(?:?):?;
begin
 00571668    push        ebx
 00571669    push        esi
 0057166A    mov         ebx,eax
 0057166C    cmp         dword ptr [ebx+3C],0
>00571670    je          0057168B
 00571672    mov         esi,dword ptr [ebx+4]
 00571675    cmp         esi,dword ptr [ebx+3C]
>00571678    jne         0057168B
 0057167A    mov         eax,esi
 0057167C    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00571682    call        @IsClass
 00571687    test        al,al
>00571689    jne         00571690
 0057168B    xor         eax,eax
 0057168D    pop         esi
 0057168E    pop         ebx
 0057168F    ret
 00571690    mov         al,1
 00571692    pop         esi
 00571693    pop         ebx
 00571694    ret
end;*}

//00571698
procedure TJvWindowHook.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00571698    push        ebx
 00571699    push        esi
 0057169A    push        edi
 0057169B    mov         ebx,ecx
 0057169D    mov         edi,edx
 0057169F    mov         esi,eax
 005716A1    mov         ecx,ebx
 005716A3    mov         edx,edi
 005716A5    mov         eax,esi
 005716A7    call        TComponent.Notification
 005716AC    cmp         bl,1
>005716AF    jne         005716D5
 005716B1    cmp         edi,dword ptr [esi+3C];TJvWindowHook.FControl:TControl
>005716B4    jne         005716C1
 005716B6    xor         edx,edx
 005716B8    mov         eax,esi
 005716BA    call        TJvWindowHook.SetControl
>005716BF    jmp         005716D5
 005716C1    mov         eax,dword ptr [esi+4];TJvWindowHook.FOwner:TComponent
 005716C4    cmp         edi,eax
>005716C6    je          005716CC
 005716C8    test        eax,eax
>005716CA    jne         005716D5
 005716CC    xor         edx,edx
 005716CE    mov         eax,esi
 005716D0    call        TJvWindowHook.SetControl
 005716D5    pop         edi
 005716D6    pop         esi
 005716D7    pop         ebx
 005716D8    ret
*}
end;

//005716DC
function TJvWindowHook.IsStoredControl(Value:TControl):Boolean;
begin
{*
 005716DC    push        ebx
 005716DD    push        esi
 005716DE    mov         ebx,eax
 005716E0    mov         esi,dword ptr [ebx+3C];TJvWindowHook.FControl:TControl
 005716E3    test        esi,esi
>005716E5    je          005716F8
 005716E7    mov         eax,esi
 005716E9    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 005716EF    call        @IsClass
 005716F4    test        al,al
>005716F6    je          005716FD
 005716F8    xor         eax,eax
 005716FA    pop         esi
 005716FB    pop         ebx
 005716FC    ret
 005716FD    mov         al,1
 005716FF    pop         esi
 00571700    pop         ebx
 00571701    ret
*}
end;

//00571738
procedure TJvWindowHook.SetActive(Value:Boolean);
begin
{*
 00571738    push        ebx
 00571739    push        esi
 0057173A    mov         ebx,edx
 0057173C    mov         esi,eax
 0057173E    cmp         bl,byte ptr [esi+38];TJvWindowHook.FActive:Boolean
>00571741    je          005717E6
 00571747    test        byte ptr [esi+1C],10;TJvWindowHook.FComponentState:TComponentState
>0057174B    jne         005717E3
 00571751    test        bl,bl
>00571753    je          0057179D
 00571755    cmp         word ptr [esi+4A],0;TJvWindowHook.?f4A:word
>0057175A    je          00571778
 0057175C    push        esi
 0057175D    mov         eax,esi
 0057175F    mov         dx,0FFF0
 00571763    call        @FindDynaInst;TJvWindowHook.sub_00571618
 00571768    push        eax
 00571769    call        00570C74
 0057176E    mov         cl,1
 00571770    mov         edx,dword ptr [esi+3C];TJvWindowHook.FControl:TControl
 00571773    call        TJvWndProcHook.RegisterWndProc
 00571778    cmp         word ptr [esi+42],0;TJvWindowHook.?f42:word
>0057177D    je          005717E3
 0057177F    push        esi
 00571780    mov         eax,esi
 00571782    mov         dx,0FFEF
 00571786    call        @FindDynaInst;TJvWindowHook.sub_0057163C
 0057178B    push        eax
 0057178C    call        00570C74
 00571791    xor         ecx,ecx
 00571793    mov         edx,dword ptr [esi+3C];TJvWindowHook.FControl:TControl
 00571796    call        TJvWndProcHook.RegisterWndProc
>0057179B    jmp         005717E3
 0057179D    cmp         word ptr [esi+4A],0;TJvWindowHook.?f4A:word
>005717A2    je          005717C0
 005717A4    push        esi
 005717A5    mov         eax,esi
 005717A7    mov         dx,0FFF0
 005717AB    call        @FindDynaInst;TJvWindowHook.sub_00571618
 005717B0    push        eax
 005717B1    call        00570C74
 005717B6    mov         cl,1
 005717B8    mov         edx,dword ptr [esi+3C];TJvWindowHook.FControl:TControl
 005717BB    call        TJvWndProcHook.UnRegisterWndProc
 005717C0    cmp         word ptr [esi+42],0;TJvWindowHook.?f42:word
>005717C5    je          005717E3
 005717C7    push        esi
 005717C8    mov         eax,esi
 005717CA    mov         dx,0FFEF
 005717CE    call        @FindDynaInst;TJvWindowHook.sub_0057163C
 005717D3    push        eax
 005717D4    call        00570C74
 005717D9    xor         ecx,ecx
 005717DB    mov         edx,dword ptr [esi+3C];TJvWindowHook.FControl:TControl
 005717DE    call        TJvWndProcHook.UnRegisterWndProc
 005717E3    mov         byte ptr [esi+38],bl;TJvWindowHook.FActive:Boolean
 005717E6    pop         esi
 005717E7    pop         ebx
 005717E8    ret
*}
end;

//005717EC
{*procedure TJvWindowHook.SetAfterMessage(Value:TJvHookMessageEvent; ?:?; ?:?; ?:?);
begin
 005717EC    push        ebp
 005717ED    mov         ebp,esp
 005717EF    push        ebx
 005717F0    mov         ebx,eax
 005717F2    cmp         byte ptr [ebx+38],0;TJvWindowHook.FActive:Boolean
>005717F6    je          00571854
 005717F8    test        byte ptr [ebx+1C],10;TJvWindowHook.FComponentState:TComponentState
>005717FC    jne         00571854
 005717FE    cmp         word ptr [ebp+0A],0
>00571803    je          0057182A
 00571805    cmp         word ptr [ebx+4A],0;TJvWindowHook.?f4A:word
>0057180A    jne         0057182A
 0057180C    push        ebx
 0057180D    mov         eax,ebx
 0057180F    mov         dx,0FFF0
 00571813    call        @FindDynaInst;TJvWindowHook.sub_00571618
 00571818    push        eax
 00571819    call        00570C74
 0057181E    mov         cl,1
 00571820    mov         edx,dword ptr [ebx+3C];TJvWindowHook.FControl:TControl
 00571823    call        TJvWndProcHook.RegisterWndProc
>00571828    jmp         00571854
 0057182A    cmp         word ptr [ebp+0A],0
>0057182F    jne         00571854
 00571831    cmp         word ptr [ebx+4A],0;TJvWindowHook.?f4A:word
>00571836    je          00571854
 00571838    push        ebx
 00571839    mov         eax,ebx
 0057183B    mov         dx,0FFF0
 0057183F    call        @FindDynaInst;TJvWindowHook.sub_00571618
 00571844    push        eax
 00571845    call        00570C74
 0057184A    mov         cl,1
 0057184C    mov         edx,dword ptr [ebx+3C];TJvWindowHook.FControl:TControl
 0057184F    call        TJvWndProcHook.UnRegisterWndProc
 00571854    mov         eax,dword ptr [ebp+8]
 00571857    mov         dword ptr [ebx+48],eax;TJvWindowHook.FAfterMessage:TJvHookMessageEvent
 0057185A    mov         eax,dword ptr [ebp+0C]
 0057185D    mov         dword ptr [ebx+4C],eax;TJvWindowHook.?f4C:dword
 00571860    pop         ebx
 00571861    pop         ebp
 00571862    ret         8
end;*}

//00571868
{*procedure TJvWindowHook.SetBeforeMessage(Value:TJvHookMessageEvent; ?:?; ?:?; ?:?);
begin
 00571868    push        ebp
 00571869    mov         ebp,esp
 0057186B    push        ebx
 0057186C    mov         ebx,eax
 0057186E    cmp         byte ptr [ebx+38],0;TJvWindowHook.FActive:Boolean
>00571872    je          005718D0
 00571874    test        byte ptr [ebx+1C],10;TJvWindowHook.FComponentState:TComponentState
>00571878    jne         005718D0
 0057187A    cmp         word ptr [ebp+0A],0
>0057187F    je          005718A6
 00571881    cmp         word ptr [ebx+42],0;TJvWindowHook.?f42:word
>00571886    jne         005718A6
 00571888    push        ebx
 00571889    mov         eax,ebx
 0057188B    mov         dx,0FFEF
 0057188F    call        @FindDynaInst;TJvWindowHook.sub_0057163C
 00571894    push        eax
 00571895    call        00570C74
 0057189A    xor         ecx,ecx
 0057189C    mov         edx,dword ptr [ebx+3C];TJvWindowHook.FControl:TControl
 0057189F    call        TJvWndProcHook.RegisterWndProc
>005718A4    jmp         005718D0
 005718A6    cmp         word ptr [ebp+0A],0
>005718AB    jne         005718D0
 005718AD    cmp         word ptr [ebx+42],0;TJvWindowHook.?f42:word
>005718B2    je          005718D0
 005718B4    push        ebx
 005718B5    mov         eax,ebx
 005718B7    mov         dx,0FFEF
 005718BB    call        @FindDynaInst;TJvWindowHook.sub_0057163C
 005718C0    push        eax
 005718C1    call        00570C74
 005718C6    xor         ecx,ecx
 005718C8    mov         edx,dword ptr [ebx+3C];TJvWindowHook.FControl:TControl
 005718CB    call        TJvWndProcHook.UnRegisterWndProc
 005718D0    mov         eax,dword ptr [ebp+8]
 005718D3    mov         dword ptr [ebx+40],eax;TJvWindowHook.FBeforeMessage:TJvHookMessageEvent
 005718D6    mov         eax,dword ptr [ebp+0C]
 005718D9    mov         dword ptr [ebx+44],eax;TJvWindowHook.?f44:dword
 005718DC    pop         ebx
 005718DD    pop         ebp
 005718DE    ret         8
end;*}

//005718E4
procedure TJvWindowHook.SetControl(Value:TControl);
begin
{*
 005718E4    push        ebx
 005718E5    push        esi
 005718E6    push        edi
 005718E7    mov         esi,edx
 005718E9    mov         edi,eax
 005718EB    cmp         esi,dword ptr [edi+3C];TJvWindowHook.FControl:TControl
>005718EE    je          00571935
 005718F0    movzx       ebx,byte ptr [edi+38];TJvWindowHook.FActive:Boolean
 005718F4    xor         edx,edx
 005718F6    mov         eax,edi
 005718F8    call        TJvWindowHook.SetActive
 005718FD    mov         eax,dword ptr [edi+3C];TJvWindowHook.FControl:TControl
 00571900    test        eax,eax
>00571902    je          0057190B
 00571904    mov         edx,edi
 00571906    call        TComponent.RemoveFreeNotification
 0057190B    test        esi,esi
>0057190D    je          0057191C
 0057190F    test        byte ptr [esi+1C],8;TControl.FComponentState:TComponentState
>00571913    je          0057191C
 00571915    xor         eax,eax
 00571917    mov         dword ptr [edi+3C],eax;TJvWindowHook.FControl:TControl
>0057191A    jmp         00571935
 0057191C    mov         eax,esi
 0057191E    mov         dword ptr [edi+3C],eax;TJvWindowHook.FControl:TControl
 00571921    test        eax,eax
>00571923    je          0057192C
 00571925    mov         edx,edi
 00571927    call        TComponent.FreeNotification
 0057192C    mov         edx,ebx
 0057192E    mov         eax,edi
 00571930    call        TJvWindowHook.SetActive
 00571935    pop         edi
 00571936    pop         esi
 00571937    pop         ebx
 00571938    ret
*}
end;

//0057193C
procedure TJvWindowHook.UnHookControl;
begin
{*
 0057193C    xor         edx,edx
 0057193E    call        TJvWindowHook.SetActive
 00571943    ret
*}
end;

//00571960
{*procedure TJvReleaser.CMRelease(?:?);
begin
 00571960    push        ebx
 00571961    push        esi
 00571962    mov         esi,eax
 00571964    mov         ebx,dword ptr [edx+4]
 00571967    mov         edx,ebx
 00571969    mov         eax,dword ptr [esi+8];TJvReleaser.FReleasing:TList
 0057196C    call        TList.IndexOf
 00571971    test        eax,eax
>00571973    jl          0057197F
 00571975    mov         edx,eax
 00571977    mov         eax,dword ptr [esi+8];TJvReleaser.FReleasing:TList
 0057197A    call        TList.Delete
 0057197F    mov         eax,ebx
 00571981    call        TObject.Free
 00571986    pop         esi
 00571987    pop         ebx
 00571988    ret
end;*}

//0057198C
constructor TJvReleaser.Create;
begin
{*
 0057198C    push        ebx
 0057198D    push        esi
 0057198E    test        dl,dl
>00571990    je          0057199A
 00571992    add         esp,0FFFFFFF0
 00571995    call        @ClassCreate
 0057199A    mov         ebx,edx
 0057199C    mov         esi,eax
 0057199E    xor         edx,edx
 005719A0    mov         eax,esi
 005719A2    call        TObject.Create
 005719A7    mov         dl,1
 005719A9    mov         eax,[00439644];TList
 005719AE    call        TObject.Create;TList.Create
 005719B3    mov         dword ptr [esi+8],eax;TJvReleaser.FReleasing:TList
 005719B6    mov         eax,esi
 005719B8    test        bl,bl
>005719BA    je          005719CB
 005719BC    call        @AfterConstruction
 005719C1    pop         dword ptr fs:[0]
 005719C8    add         esp,0C
 005719CB    mov         eax,esi
 005719CD    pop         esi
 005719CE    pop         ebx
 005719CF    ret
*}
end;

//005719D0
{*procedure TJvReleaser.DefaultHandler(var Msg:?);
begin
 005719D0    push        ebx
 005719D1    push        esi
 005719D2    push        edi
 005719D3    mov         esi,edx
 005719D5    mov         ebx,eax
 005719D7    mov         edi,dword ptr [ebx+4];TJvReleaser.FHandle:Cardinal
 005719DA    test        edi,edi
>005719DC    je          005719F7
 005719DE    mov         eax,dword ptr [esi+8]
 005719E1    push        eax
 005719E2    mov         eax,dword ptr [esi+4]
 005719E5    push        eax
 005719E6    mov         eax,dword ptr [esi]
 005719E8    push        eax
 005719E9    push        edi
 005719EA    push        40DD38;user32.DefWindowProcW:Integer
 005719EF    call        user32.CallWindowProcW
 005719F4    mov         dword ptr [esi+0C],eax
 005719F7    pop         edi
 005719F8    pop         esi
 005719F9    pop         ebx
 005719FA    ret
end;*}

//005719FC
destructor TJvReleaser.Destroy();
begin
{*
 005719FC    push        ebx
 005719FD    push        esi
 005719FE    push        edi
 005719FF    call        @BeforeDestruction
 00571A04    mov         ebx,edx
 00571A06    mov         edi,eax
>00571A08    jmp         00571A22
 00571A0A    mov         eax,esi
 00571A0C    xor         edx,edx
 00571A0E    call        TList.Get
 00571A13    call        TObject.Free
 00571A18    mov         eax,dword ptr [edi+8];TJvReleaser.FReleasing:TList
 00571A1B    xor         edx,edx
 00571A1D    call        TList.Delete
 00571A22    mov         esi,dword ptr [edi+8];TJvReleaser.FReleasing:TList
 00571A25    cmp         dword ptr [esi+8],0;TList.FCount:Integer
>00571A29    jg          00571A0A
 00571A2B    mov         eax,dword ptr [edi+8];TJvReleaser.FReleasing:TList
 00571A2E    call        TObject.Free
 00571A33    mov         eax,dword ptr [edi+4];TJvReleaser.FHandle:Cardinal
 00571A36    test        eax,eax
>00571A38    je          00571A3F
 00571A3A    call        DeallocateHWnd
 00571A3F    mov         edx,ebx
 00571A41    and         dl,0FC
 00571A44    mov         eax,edi
 00571A46    call        TObject.Destroy
 00571A4B    test        bl,bl
>00571A4D    jle         00571A56
 00571A4F    mov         eax,edi
 00571A51    call        @ClassDestroy
 00571A56    pop         edi
 00571A57    pop         esi
 00571A58    pop         ebx
 00571A59    ret
*}
end;

//00571A5C
{*function sub_00571A5C(?:TJvReleaser):?;
begin
 00571A5C    push        ebx
 00571A5D    mov         ebx,eax
 00571A5F    cmp         dword ptr [ebx+4],0
>00571A63    jne         00571A73
 00571A65    push        ebx
 00571A66    push        571AD0
 00571A6B    call        AllocateHWnd
 00571A70    mov         dword ptr [ebx+4],eax
 00571A73    mov         eax,dword ptr [ebx+4]
 00571A76    pop         ebx
 00571A77    ret
end;*}

//00571A78
function TJvReleaser.Instance:TJvReleaser;
begin
{*
 00571A78    cmp         dword ptr ds:[78993C],0;gvar_0078993C:TJvReleaser
>00571A7F    jne         00571A92
 00571A81    mov         dl,1
 00571A83    mov         eax,[00570A64];TJvReleaser
 00571A88    call        TJvReleaser.Create;TJvReleaser.Create
 00571A8D    mov         [0078993C],eax;gvar_0078993C:TJvReleaser
 00571A92    mov         eax,[0078993C];0x0 gvar_0078993C:TJvReleaser
 00571A97    ret
*}
end;

//00571A98
procedure TJvReleaser.Release(AObject:TObject);
begin
{*
 00571A98    push        ebx
 00571A99    push        esi
 00571A9A    mov         esi,edx
 00571A9C    mov         ebx,eax
 00571A9E    mov         edx,esi
 00571AA0    mov         eax,dword ptr [ebx+8];TJvReleaser.FReleasing:TList
 00571AA3    call        TList.IndexOf
 00571AA8    test        eax,eax
>00571AAA    jge         00571ACB
 00571AAC    mov         edx,esi
 00571AAE    mov         eax,dword ptr [ebx+8];TJvReleaser.FReleasing:TList
 00571AB1    call        TList.Add
 00571AB6    push        0
 00571AB8    push        esi
 00571AB9    push        0B021
 00571ABE    mov         eax,ebx
 00571AC0    call        00571A5C
 00571AC5    push        eax
 00571AC6    call        user32.PostMessageW
 00571ACB    pop         esi
 00571ACC    pop         ebx
 00571ACD    ret
*}
end;

end.