//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieKinectSDK2;

interface

uses
  SysUtils, Classes;

type
  TKinectPlayerValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//00771950
    function GetUnits:TUnits;//00771ADC
    //procedure GetString(?:?);//00771AC8
    function GetPerUnits2:TUnits;//0077196C
    procedure GetVector(x:Double; y:Double; z:Double);//00772B90
    procedure GetRotMat(m:TRotMat);//0077197C
    function Module:TObject;//00772E6C
    procedure SetValue(NewValue:Double);//00772E74
    function CanSet:Boolean;//00771888
    function GetDataType:TDataType;//007718BC
    //procedure ToString(?:?);//00772E80
    procedure FillClone(c:TExpression);//0077189C
    procedure CreateClone;//0077188C
    procedure GetValue;//00771B6C
  public
    ..........................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//00772E80
    procedure GetValue; virtual;//v2C//00771B6C
    //procedure GetString(?:?); virtual;//v38//00771AC8
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//00772B90
    procedure GetRotMat(m:TRotMat); virtual;//v40//0077197C
    function GetDataType:TDataType; virtual;//v44//007718BC
    function GetUnits:TUnits; virtual;//v48//00771ADC
    function GetPerUnits1:TUnits; virtual;//v4C//00771950
    function GetPerUnits2:TUnits; virtual;//v50//0077196C
    procedure SetValue(NewValue:Double); virtual;//v58//00772E74
    function CanSet:Boolean; virtual;//v68//00771888
    procedure CreateClone; virtual;//v80//0077188C
    procedure FillClone(c:TExpression); virtual;//v84//0077189C
    function Module:TObject; virtual;//v98//00772E6C
  end;
  TModuleKinectPlayer = class(TPieModule)
  published
    procedure MonitorFrame;//007747F0
    procedure PrepareForGUI;//00774810
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//007747D4
    function GetDefaultFormat(field:string):TGuiFormat;//007745C0
    procedure PrepareForMonitoring;//00774814
    procedure StopGUI;//00774C18
    procedure StopMonitoring;//00774C20
    procedure StartGUI;//00774ADC
    procedure StartMonitoring;//00774AE0
    function GetGoodFields:TStringList;//00774624
    procedure StartCompiletime;//00774AD0
    procedure StopCompiletime;//00774C04
    procedure StartRuntime;//00774AFC
    procedure StopRuntime;//00774C28
    constructor Create;//007744B8
    procedure ClearRead;//007744B0
    function Read:Boolean;//00774818
    procedure AddFields;//007732D8
    function CreateValue(Identifier:string):TExpression;//0077456C
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//0077456C
    function GetGoodFields:TStringList; virtual;//v1C//00774624
    procedure AddFields; virtual;//v24//007732D8
    procedure StartCompiletime; virtual;//v28//00774AD0
    procedure StopCompiletime; virtual;//v2C//00774C04
    procedure StartRuntime; virtual;//v30//00774AFC
    procedure StopRuntime; virtual;//v34//00774C28
    procedure ClearRead; virtual;//v38//007744B0
    function Read:Boolean; virtual;//v3C//00774818
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//007747D4
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//007745C0
    procedure PrepareForGUI; virtual;//v50//00774810
    procedure StartGUI; virtual;//v54//00774ADC
    procedure StopGUI; virtual;//v58//00774C18
    procedure PrepareForMonitoring; virtual;//v5C//00774814
    procedure StartMonitoring; virtual;//v60//00774AE0
    procedure StopMonitoring; virtual;//v64//00774C20
    procedure MonitorFrame; virtual;//v68//007747F0
  end;
    //function sub_00770E20(?:?; ?:?; ?:?; ?:?):?;//00770E20
    procedure sub_0077138C;//0077138C
    //function sub_007713A0:?;//007713A0
    //function sub_007713BC(?:?):?;//007713BC
    //function sub_00771638(?:string):?;//00771638
    procedure sub_00772F8C;//00772F8C
    procedure sub_00772FB0;//00772FB0
    //function sub_00772FC0(?:UnicodeString):?;//00772FC0

implementation

//00770E20
{*function sub_00770E20(?:?; ?:?; ?:?; ?:?):?;
begin
 00770E20    push        ebp
 00770E21    mov         ebp,esp
 00770E23    add         esp,0FFFFFFF8
 00770E26    fld         qword ptr [ebp+10]
 00770E29    fcomp       qword ptr [ebp+8]
 00770E2C    wait
 00770E2D    fnstsw      al
 00770E2F    sahf
>00770E30    ja          00770E40
 00770E32    mov         eax,dword ptr [ebp+10]
 00770E35    mov         dword ptr [ebp-8],eax
 00770E38    mov         eax,dword ptr [ebp+14]
 00770E3B    mov         dword ptr [ebp-4],eax
>00770E3E    jmp         00770E4C
 00770E40    mov         eax,dword ptr [ebp+8]
 00770E43    mov         dword ptr [ebp-8],eax
 00770E46    mov         eax,dword ptr [ebp+0C]
 00770E49    mov         dword ptr [ebp-4],eax
 00770E4C    fld         qword ptr [ebp-8]
 00770E4F    pop         ecx
 00770E50    pop         ecx
 00770E51    pop         ebp
 00770E52    ret         10
end;*}

//0077138C
procedure sub_0077138C;
begin
{*
 0077138C    mov         eax,[00822DD4];gvar_00822DD4:TModuleKinectPlayer
 00771391    mov         byte ptr [eax+24],1
 00771395    mov         byte ptr ds:[822DC0],1;gvar_00822DC0
 0077139C    ret
*}
end;

//007713A0
{*function sub_007713A0:?;
begin
 007713A0    xor         ecx,ecx
 007713A2    mov         edx,6
 007713A7    mov         eax,78CA50;gvar_0078CA50
 007713AC    cmp         dword ptr [eax],0
>007713AF    je          007713B2
 007713B1    inc         ecx
 007713B2    add         eax,4
 007713B5    dec         edx
>007713B6    jne         007713AC
 007713B8    mov         eax,ecx
 007713BA    ret
end;*}

//007713BC
{*function sub_007713BC(?:?):?;
begin
 007713BC    push        ebp
 007713BD    mov         ebp,esp
 007713BF    add         esp,0FFFFFFD0
 007713C2    push        ebx
 007713C3    push        esi
 007713C4    push        edi
 007713C5    xor         edx,edx
 007713C7    mov         dword ptr [ebp-24],edx
 007713CA    mov         dword ptr [ebp-28],edx
 007713CD    xor         edx,edx
 007713CF    push        ebp
 007713D0    push        771601
 007713D5    push        dword ptr fs:[edx]
 007713D8    mov         dword ptr fs:[edx],esp
 007713DB    mov         byte ptr [ebp-1],0
 007713DF    test        eax,eax
>007713E1    jl          007715E6
 007713E7    cmp         eax,6
>007713EA    jg          007715E6
 007713F0    cmp         eax,7
>007713F3    jg          007715E6
 007713F9    mov         edx,dword ptr [eax*4+78CA4C]
 00771400    mov         dword ptr [ebp-8],edx
 00771403    imul        eax,eax,35
 00771406    lea         ebx,[eax*8+823858];gvar_00823858:Pointer
 0077140D    mov         eax,dword ptr [ebp-8]
 00771410    mov         dword ptr [ebx+54],eax
 00771413    cmp         dword ptr [ebp-8],0
>00771417    jne         00771462
 00771419    mov         byte ptr [ebx+5C],0
 0077141D    xor         eax,eax
 0077141F    mov         dword ptr [ebx+40],eax
 00771422    mov         dword ptr [ebx+44],eax
 00771425    xor         eax,eax
 00771427    mov         dword ptr [ebx+48],eax
 0077142A    mov         dword ptr [ebx+4C],eax
 0077142D    xor         eax,eax
 0077142F    mov         dword ptr [ebx+50],eax
 00771432    lea         eax,[ebx+64]
 00771435    xor         ecx,ecx
 00771437    mov         edx,140
 0077143C    call        @FillChar
 00771441    xor         eax,eax
 00771443    mov         dword ptr [ebx],eax
 00771445    mov         dword ptr [ebx+4],eax
 00771448    xor         eax,eax
 0077144A    mov         dword ptr [ebx+10],eax
 0077144D    mov         dword ptr [ebx+14],eax
 00771450    xor         eax,eax
 00771452    mov         dword ptr [ebx+8],eax
 00771455    mov         dword ptr [ebx+0C],eax
 00771458    xor         eax,eax
 0077145A    mov         dword ptr [ebx+18],eax
 0077145D    mov         dword ptr [ebx+1C],eax
>00771460    jmp         007714DE
 00771462    imul        eax,dword ptr [ebp-8],6D
 00771466    cmp         dword ptr [eax*4+822C5C],2
 0077146E    sete        al
 00771471    mov         byte ptr [ebx+5C],al
 00771474    mov         eax,dword ptr [ebp-8]
 00771477    cmp         byte ptr [eax+822DCB],1;gvar_00822DCB
>0077147E    jne         007714DE
 00771480    xor         esi,esi
 00771482    mov         edi,822DE0;gvar_00822DE0:NUI_SKELETON_FRAME
 00771487    mov         dword ptr [ebp-1C],822DE0;gvar_00822DE0:NUI_SKELETON_FRAME
 0077148E    imul        eax,dword ptr [ebp-8],6D
 00771492    cmp         dword ptr [edi+eax*4-24],0
>00771497    je          007714D1
 00771499    imul        eax,dword ptr [ebp-8],6D
 0077149D    mov         edx,dword ptr [ebp-1C]
 007714A0    mov         ecx,esi
 007714A2    add         ecx,ecx
 007714A4    push        esi
 007714A5    push        edi
 007714A6    lea         esi,[edx+eax*4-164]
 007714AD    lea         edi,[ebx+ecx*8+64]
 007714B1    movs        dword ptr [edi],dword ptr [esi]
 007714B2    movs        dword ptr [edi],dword ptr [esi]
 007714B3    movs        dword ptr [edi],dword ptr [esi]
 007714B4    movs        dword ptr [edi],dword ptr [esi]
 007714B5    pop         edi
 007714B6    pop         esi
 007714B7    lea         edx,[ebp-28]
 007714BA    mov         eax,esi
 007714BC    call        IntToStr
 007714C1    mov         ecx,dword ptr [ebp-28]
 007714C4    lea         eax,[ebp-24]
 007714C7    mov         edx,771620;'Joint '
 007714CC    call        @UStrCat3
 007714D1    inc         esi
 007714D2    add         dword ptr [ebp-1C],10
 007714D6    add         edi,4
 007714D9    cmp         esi,14
>007714DC    jne         0077148E
 007714DE    mov         eax,dword ptr ds:[822DE0];gvar_00822DE0:NUI_SKELETON_FRAME
 007714E4    mov         edx,dword ptr ds:[822DE4];gvar_00822DE4
 007714EA    sub         eax,dword ptr [ebx+20]
 007714ED    sbb         edx,dword ptr [ebx+24]
 007714F0    mov         dword ptr [ebp-30],eax
 007714F3    mov         dword ptr [ebp-2C],edx
 007714F6    fild        qword ptr [ebp-30]
 007714F9    fdiv        dword ptr ds:[771630];1000:Single
 007714FF    fstp        qword ptr [ebx+30]
 00771502    wait
 00771503    fld         qword ptr [ebx+30]
 00771506    fcomp       dword ptr ds:[771634];0:Single
 0077150C    wait
 0077150D    fnstsw      al
 0077150F    sahf
>00771510    jae         00771520
 00771512    mov         dword ptr [ebx+30],11111111
 00771519    mov         dword ptr [ebx+34],3FB11111
 00771520    mov         eax,dword ptr ds:[822DE0];gvar_00822DE0:NUI_SKELETON_FRAME
 00771526    mov         dword ptr [ebx+20],eax
 00771529    mov         eax,dword ptr ds:[822DE4];gvar_00822DE4
 0077152F    mov         dword ptr [ebx+24],eax
 00771532    cmp         byte ptr [ebx+5C],0
>00771536    je          007715E6
 0077153C    mov         eax,dword ptr [ebx+20]
 0077153F    mov         edx,dword ptr [ebx+24]
 00771542    sub         eax,dword ptr [ebx+28]
 00771545    sbb         edx,dword ptr [ebx+2C]
 00771548    mov         dword ptr [ebp-30],eax
 0077154B    mov         dword ptr [ebp-2C],edx
 0077154E    fild        qword ptr [ebp-30]
 00771551    fdiv        dword ptr ds:[771630];1000:Single
 00771557    fstp        qword ptr [ebx+38]
 0077155A    wait
 0077155B    mov         eax,dword ptr [ebx+20]
 0077155E    mov         dword ptr [ebx+28],eax
 00771561    mov         eax,dword ptr [ebx+24]
 00771564    mov         dword ptr [ebx+2C],eax
 00771567    fld         qword ptr [ebx+38]
 0077156A    fcomp       dword ptr ds:[771634];0:Single
 00771570    wait
 00771571    fnstsw      al
 00771573    sahf
>00771574    jae         00771584
 00771576    mov         dword ptr [ebx+38],11111111
 0077157D    mov         dword ptr [ebx+3C],3FB11111
 00771584    imul        eax,dword ptr [ebp-8],6D
 00771588    mov         eax,dword ptr [eax*4+822E0C];gvar_00822E0C
 0077158F    mov         dword ptr [ebx+60],eax
 00771592    xor         esi,esi
 00771594    mov         eax,822DE0;gvar_00822DE0:NUI_SKELETON_FRAME
 00771599    mov         dword ptr [ebp-20],822DE0;gvar_00822DE0:NUI_SKELETON_FRAME
 007715A0    imul        edx,dword ptr [ebp-8],6D
 007715A4    cmp         dword ptr [eax+edx*4-24],0
>007715A9    je          007715C7
 007715AB    imul        edx,dword ptr [ebp-8],6D
 007715AF    mov         ecx,dword ptr [ebp-20]
 007715B2    mov         edi,esi
 007715B4    add         edi,edi
 007715B6    push        esi
 007715B7    lea         esi,[ecx+edx*4-164]
 007715BE    lea         edi,[ebx+edi*8+64]
 007715C2    movs        dword ptr [edi],dword ptr [esi]
 007715C3    movs        dword ptr [edi],dword ptr [esi]
 007715C4    movs        dword ptr [edi],dword ptr [esi]
 007715C5    movs        dword ptr [edi],dword ptr [esi]
 007715C6    pop         esi
 007715C7    inc         esi
 007715C8    add         dword ptr [ebp-20],10
 007715CC    add         eax,4
 007715CF    cmp         esi,14
>007715D2    jne         007715A0
 007715D4    imul        eax,dword ptr [ebp-8],6D
 007715D8    mov         eax,dword ptr [eax*4+822C60];gvar_00822C60
 007715DF    mov         dword ptr [ebx+58],eax
 007715E2    mov         byte ptr [ebp-1],1
 007715E6    xor         eax,eax
 007715E8    pop         edx
 007715E9    pop         ecx
 007715EA    pop         ecx
 007715EB    mov         dword ptr fs:[eax],edx
 007715EE    push        771608
 007715F3    lea         eax,[ebp-28]
 007715F6    mov         edx,2
 007715FB    call        @UStrArrayClr
 00771600    ret
>00771601    jmp         @HandleFinally
>00771606    jmp         007715F3
 00771608    movzx       eax,byte ptr [ebp-1]
 0077160C    pop         edi
 0077160D    pop         esi
 0077160E    pop         ebx
 0077160F    mov         esp,ebp
 00771611    pop         ebp
 00771612    ret
end;*}

//00771638
{*function sub_00771638(?:string):?;
begin
 00771638    push        ebp
 00771639    mov         ebp,esp
 0077163B    add         esp,0FFFFFFF8
 0077163E    push        ebx
 0077163F    push        esi
 00771640    push        edi
 00771641    xor         edx,edx
 00771643    mov         dword ptr [ebp-8],edx
 00771646    mov         dword ptr [ebp-4],eax
 00771649    mov         eax,dword ptr [ebp-4]
 0077164C    call        @UStrAddRef
 00771651    xor         eax,eax
 00771653    push        ebp
 00771654    push        7717F9
 00771659    push        dword ptr fs:[eax]
 0077165C    mov         dword ptr fs:[eax],esp
 0077165F    xor         ebx,ebx
 00771661    lea         eax,[ebp-8]
 00771664    mov         edx,dword ptr [ebp-4]
 00771667    call        @UStrLAsg
 0077166C    lea         eax,[ebp-8]
 0077166F    mov         edx,771818;'Player'
 00771674    call        004F9BD0
 00771679    test        al,al
>0077167B    jne         007716A3
 0077167D    lea         eax,[ebp-8]
 00771680    mov         edx,771834;'KinectPlayer'
 00771685    call        004F9BD0
 0077168A    test        al,al
>0077168C    jne         007716A3
 0077168E    lea         eax,[ebp-8]
 00771691    mov         edx,77185C;'Kinect.Player'
 00771696    call        004F9BD0
 0077169B    test        al,al
>0077169D    je          007717DE
 007716A3    lea         eax,[ebp-8]
 007716A6    call        004F9D00
 007716AB    mov         edi,eax
 007716AD    lea         eax,[ebp-8]
 007716B0    mov         edx,771884;'.'
 007716B5    call        004F9BD0
 007716BA    test        al,al
>007716BC    je          007717DE
 007716C2    mov         eax,dword ptr [ebp-8]
 007716C5    call        00772FC0
 007716CA    mov         esi,eax
 007716CC    test        esi,esi
>007716CE    jl          007717DE
 007716D4    mov         eax,esi
 007716D6    cmp         eax,37
>007716D9    jg          0077170B
>007716DB    je          00771738
 007716DD    cmp         eax,7
>007716E0    jge         007716F4
 007716E2    sub         eax,3
>007716E5    jb          00771738
>007716E7    je          00771741
 007716E9    dec         eax
 007716EA    sub         eax,3
>007716ED    jb          0077174A
>007716EF    jmp         00771790
 007716F4    add         eax,0FFFFFFF9
 007716F7    sub         eax,4
>007716FA    jb          00771738
 007716FC    sub         eax,20
>007716FF    jb          00771753
 00771701    sub         eax,7
>00771704    jb          0077175C
>00771706    jmp         00771790
 0077170B    cmp         eax,7B
>0077170E    jg          00771729
>00771710    je          00771780
 00771712    add         eax,0FFFFFF9C
 00771715    sub         eax,4
>00771718    jb          00771765
 0077171A    sub         eax,2
>0077171D    jb          00771780
 0077171F    add         eax,0FFFFFFF2
 00771722    sub         eax,3
>00771725    jb          00771777
>00771727    jmp         00771790
 00771729    sub         eax,7C
>0077172C    je          00771777
 0077172E    add         eax,0FFFFFFE6
 00771731    sub         eax,50
>00771734    jb          0077176E
>00771736    jmp         00771790
 00771738    mov         byte ptr ds:[822DC8],1;gvar_00822DC8
>0077173F    jmp         0077179E
 00771741    mov         byte ptr ds:[822DC9],1;gvar_00822DC9
>00771748    jmp         0077179E
 0077174A    mov         byte ptr ds:[822DC9],1;gvar_00822DC9
>00771751    jmp         0077179E
 00771753    mov         byte ptr ds:[822DC9],1;gvar_00822DC9
>0077175A    jmp         0077179E
 0077175C    mov         byte ptr ds:[822DC8],1;gvar_00822DC8
>00771763    jmp         0077179E
 00771765    mov         byte ptr ds:[822DC9],1;gvar_00822DC9
>0077176C    jmp         0077179E
 0077176E    mov         byte ptr ds:[822DC9],1;gvar_00822DC9
>00771775    jmp         0077179E
 00771777    mov         byte ptr ds:[822DCA],1;gvar_00822DCA
>0077177E    jmp         0077179E
 00771780    mov         byte ptr ds:[822DC9],1;gvar_00822DC9
 00771787    mov         byte ptr ds:[822DCA],1;gvar_00822DCA
>0077178E    jmp         0077179E
 00771790    mov         byte ptr ds:[822DC9],1;gvar_00822DC9
 00771797    mov         byte ptr ds:[822DCA],1;gvar_00822DCA
 0077179E    movzx       eax,byte ptr ds:[822DC8];gvar_00822DC8
 007717A5    or          al,byte ptr ds:[822DC9];gvar_00822DC9
 007717AB    mov         [00822DC8],al;gvar_00822DC8
 007717B0    mov         dl,1
 007717B2    mov         eax,[007709B4];TKinectPlayerValue
 007717B7    call        TObject.Create;TKinectPlayerValue.Create
 007717BC    mov         ebx,eax
 007717BE    mov         dword ptr [ebx+20],esi;TKinectPlayerValue............................Item:Integer
 007717C1    test        edi,edi
>007717C3    jg          007717CA
 007717C5    mov         edi,1
 007717CA    mov         dword ptr [ebx+18],edi;TKinectPlayerValue..................................................
 007717CD    mov         byte ptr ds:[822DC0],1;gvar_00822DC0
 007717D4    mov         eax,1
 007717D9    call        0076E984
 007717DE    xor         eax,eax
 007717E0    pop         edx
 007717E1    pop         ecx
 007717E2    pop         ecx
 007717E3    mov         dword ptr fs:[eax],edx
 007717E6    push        771800
 007717EB    lea         eax,[ebp-8]
 007717EE    mov         edx,2
 007717F3    call        @UStrArrayClr
 007717F8    ret
>007717F9    jmp         @HandleFinally
>007717FE    jmp         007717EB
 00771800    mov         eax,ebx
 00771802    pop         edi
 00771803    pop         esi
 00771804    pop         ebx
 00771805    pop         ecx
 00771806    pop         ecx
 00771807    pop         ebp
 00771808    ret
end;*}

//00771888
function TKinectPlayerValue.CanSet:Boolean;
begin
{*
 00771888    xor         eax,eax
 0077188A    ret
*}
end;

//0077188C
procedure TKinectPlayerValue.CreateClone;
begin
{*
 0077188C    mov         dl,1
 0077188E    mov         eax,[007709B4];TKinectPlayerValue
 00771893    call        TObject.Create;TKinectPlayerValue.Create
 00771898    ret
*}
end;

//0077189C
procedure TKinectPlayerValue.FillClone(c:TExpression);
begin
{*
 0077189C    push        ebx
 0077189D    push        esi
 0077189E    mov         esi,edx
 007718A0    mov         ebx,eax
 007718A2    mov         edx,esi
 007718A4    mov         eax,ebx
 007718A6    call        TExpression.FillClone
 007718AB    mov         eax,esi
 007718AD    mov         edx,dword ptr [ebx+20];TKinectPlayerValue.............................Item:Integer
 007718B0    mov         dword ptr [eax+20],edx
 007718B3    mov         edx,dword ptr [ebx+18];TKinectPlayerValue..................................................
 007718B6    mov         dword ptr [eax+18],edx
 007718B9    pop         esi
 007718BA    pop         ebx
 007718BB    ret
*}
end;

//007718BC
function TKinectPlayerValue.GetDataType:TDataType;
begin
{*
 007718BC    mov         edx,dword ptr [eax+20];TKinectPlayerValue..............................Item:Integer
 007718BF    mov         ecx,edx
 007718C1    cmp         ecx,33
>007718C4    jge         007718E8
 007718C6    cmp         ecx,3
>007718C9    jge         007718D7
 007718CB    sub         ecx,1
>007718CE    jb          00771915
 007718D0    sub         ecx,2
>007718D3    jb          00771918
>007718D5    jmp         0077194B
 007718D7    add         ecx,0FFFFFFFD
 007718DA    sub         ecx,4
>007718DD    jb          00771915
>007718DF    je          0077191B
 007718E1    sub         ecx,2B
>007718E4    je          00771918
>007718E6    jmp         0077194B
 007718E8    cmp         ecx,78
>007718EB    jge         00771901
 007718ED    add         ecx,0FFFFFFCD
 007718F0    sub         ecx,4
>007718F3    jb          00771915
>007718F5    je          00771918
 007718F7    add         ecx,0FFFFFFCA
 007718FA    sub         ecx,2
>007718FD    jb          00771915
>007718FF    jmp         0077194B
 00771901    add         ecx,0FFFFFF88
 00771904    sub         ecx,2
>00771907    jb          0077191B
>00771909    je          0077191E
 0077190B    add         ecx,0FFFFFFE4
 0077190E    sub         ecx,50
>00771911    jb          00771921
>00771913    jmp         0077194B
 00771915    mov         al,3
 00771917    ret
 00771918    mov         al,2
 0077191A    ret
 0077191B    mov         al,5
 0077191D    ret
 0077191E    mov         al,6
 00771920    ret
 00771921    sub         edx,96
 00771927    and         edx,80000003
>0077192D    jns         00771934
 0077192F    dec         edx
 00771930    or          edx,0FFFFFFFC
 00771933    inc         edx
 00771934    sub         edx,1
>00771937    jb          00771940
 00771939    sub         edx,4
>0077193C    je          00771944
>0077193E    jmp         00771948
 00771940    mov         al,5
>00771942    jmp         0077194D
 00771944    mov         al,6
>00771946    jmp         0077194D
 00771948    xor         eax,eax
 0077194A    ret
 0077194B    xor         eax,eax
 0077194D    ret
*}
end;

//00771950
function TKinectPlayerValue.GetPerUnits1:TUnits;
begin
{*
 00771950    mov         eax,dword ptr [eax+20];TKinectPlayerValue...............................Item:Integer
 00771953    sub         eax,1
>00771956    jb          00771962
 00771958    add         eax,0FFFFFF97
 0077195B    sub         eax,2
>0077195E    jb          00771965
>00771960    jmp         00771968
 00771962    xor         eax,eax
 00771964    ret
 00771965    mov         al,11
 00771967    ret
 00771968    xor         eax,eax
 0077196A    ret
*}
end;

//0077196C
function TKinectPlayerValue.GetPerUnits2:TUnits;
begin
{*
 0077196C    mov         eax,dword ptr [eax+20];TKinectPlayerValue................................Item:Integer
 0077196F    sub         eax,1
>00771972    jae         00771977
 00771974    xor         eax,eax
 00771976    ret
 00771977    xor         eax,eax
 00771979    ret
*}
end;

//0077197C
procedure TKinectPlayerValue.GetRotMat(m:TRotMat);
begin
{*
 0077197C    push        ebx
 0077197D    push        esi
 0077197E    push        edi
 0077197F    push        ecx
 00771980    mov         esi,edx
 00771982    mov         edx,dword ptr ds:[78D8AC];^gvar_00822D79
 00771988    cmp         byte ptr [edx],0
>0077198B    je          00771ABB
 00771991    cmp         dword ptr [eax+18],0;TKinectPlayerValue....................................................
>00771995    jl          00771ABB
 0077199B    mov         edx,dword ptr [eax+18];TKinectPlayerValue..................................................
 0077199E    cmp         edx,7
>007719A1    jg          007719AC
 007719A3    mov         edx,dword ptr [edx*4+78CA4C]
 007719AA    test        edx,edx
 007719AC    mov         edx,dword ptr [eax+20];TKinectPlayerValue.................................Item:Integer
 007719AF    sub         edx,7A
>007719B2    jne         00771AB4
 007719B8    fld         dword ptr ds:[823848];gvar_00823848:Single
 007719BE    fcomp       dword ptr ds:[771AC0];0:Single
 007719C4    wait
 007719C5    fnstsw      al
 007719C7    sahf
>007719C8    jne         00771A04
 007719CA    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 007719D0    fcomp       dword ptr ds:[771AC0];0:Single
 007719D6    wait
 007719D7    fnstsw      al
 007719D9    sahf
>007719DA    jne         00771A04
 007719DC    fld         dword ptr ds:[823850];gvar_00823850:Single
 007719E2    fcomp       dword ptr ds:[771AC0];0:Single
 007719E8    wait
 007719E9    fnstsw      al
 007719EB    sahf
>007719EC    jne         00771A04
 007719EE    fld         dword ptr ds:[823854];gvar_00823854:Single
 007719F4    fcomp       dword ptr ds:[771AC0];0:Single
 007719FA    wait
 007719FB    fnstsw      al
 007719FD    sahf
>007719FE    je          00771A87
 00771A04    fld         dword ptr ds:[823848];gvar_00823848:Single
 00771A0A    fmul        st,st(0)
 00771A0C    fsubr       dword ptr ds:[771AC4];1:Single
 00771A12    add         esp,0FFFFFFF4
 00771A15    fstp        tbyte ptr [esp]
 00771A18    wait
 00771A19    call        Sqrt
 00771A1E    fstp        qword ptr [esi]
 00771A20    wait
 00771A21    fld         dword ptr ds:[823848];gvar_00823848:Single
 00771A27    fchs
 00771A29    fstp        qword ptr [esi+8]
 00771A2C    wait
 00771A2D    xor         eax,eax
 00771A2F    mov         dword ptr [esi+10],eax
 00771A32    mov         dword ptr [esi+14],eax
 00771A35    fld         dword ptr ds:[823848];gvar_00823848:Single
 00771A3B    fstp        qword ptr [esi+18]
 00771A3E    wait
 00771A3F    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00771A45    fstp        qword ptr [esi+20]
 00771A48    wait
 00771A49    fld         dword ptr ds:[823850];gvar_00823850:Single
 00771A4F    fchs
 00771A51    fstp        qword ptr [esi+28]
 00771A54    wait
 00771A55    xor         eax,eax
 00771A57    mov         dword ptr [esi+30],eax
 00771A5A    mov         dword ptr [esi+34],eax
 00771A5D    fld         dword ptr ds:[823850];gvar_00823850:Single
 00771A63    fstp        qword ptr [esi+38]
 00771A66    wait
 00771A67    fld         dword ptr ds:[823850];gvar_00823850:Single
 00771A6D    fmul        st,st(0)
 00771A6F    fsubr       dword ptr ds:[771AC4];1:Single
 00771A75    add         esp,0FFFFFFF4
 00771A78    fstp        tbyte ptr [esp]
 00771A7B    wait
 00771A7C    call        Sqrt
 00771A81    fstp        qword ptr [esi+40]
 00771A84    wait
>00771A85    jmp         00771ABB
 00771A87    xor         ecx,ecx
 00771A89    mov         edi,esi
 00771A8B    xor         edx,edx
 00771A8D    mov         eax,edi
 00771A8F    cmp         edx,ecx
 00771A91    sete        bl
 00771A94    movsx       ebx,bl
 00771A97    mov         dword ptr [esp],ebx
 00771A9A    fild        dword ptr [esp]
 00771A9D    fstp        qword ptr [eax]
 00771A9F    wait
 00771AA0    inc         edx
 00771AA1    add         eax,8
 00771AA4    cmp         edx,3
>00771AA7    jne         00771A8F
 00771AA9    inc         ecx
 00771AAA    add         edi,18
 00771AAD    cmp         ecx,3
>00771AB0    jne         00771A8B
>00771AB2    jmp         00771ABB
 00771AB4    mov         edx,esi
 00771AB6    call        TExpression.GetRotMat
 00771ABB    pop         edx
 00771ABC    pop         edi
 00771ABD    pop         esi
 00771ABE    pop         ebx
 00771ABF    ret
*}
end;

//00771AC8
{*procedure TKinectPlayerValue.GetString(?:?);
begin
 00771AC8    push        ebx
 00771AC9    push        esi
 00771ACA    mov         esi,edx
 00771ACC    mov         ebx,eax
 00771ACE    mov         edx,esi
 00771AD0    mov         eax,ebx
 00771AD2    call        TExpression.GetString
 00771AD7    pop         esi
 00771AD8    pop         ebx
 00771AD9    ret
end;*}

//00771ADC
function TKinectPlayerValue.GetUnits:TUnits;
begin
{*
 00771ADC    mov         edx,dword ptr [eax+20];TKinectPlayerValue..................................Item:Integer
 00771ADF    mov         ecx,edx
 00771AE1    cmp         ecx,64
>00771AE4    jge         00771B0E
 00771AE6    cmp         ecx,0D
>00771AE9    jge         00771AFA
 00771AEB    add         ecx,0FFFFFFF9
 00771AEE    sub         ecx,4
>00771AF1    jb          00771B33
 00771AF3    sub         ecx,2
>00771AF6    jb          00771B36
>00771AF8    jmp         00771B69
 00771AFA    add         ecx,0FFFFFFF3
 00771AFD    sub         ecx,6
>00771B00    jb          00771B39
 00771B02    sub         ecx,4
>00771B05    jb          00771B36
 00771B07    sub         ecx,12
>00771B0A    jb          00771B39
>00771B0C    jmp         00771B69
 00771B0E    cmp         ecx,78
>00771B11    jg          00771B24
>00771B13    je          00771B33
 00771B15    add         ecx,0FFFFFF9C
 00771B18    sub         ecx,4
>00771B1B    jb          00771B36
 00771B1D    sub         ecx,5
>00771B20    jb          00771B33
>00771B22    jmp         00771B69
 00771B24    sub         ecx,7B
>00771B27    je          00771B33
 00771B29    add         ecx,0FFFFFFE5
 00771B2C    sub         ecx,50
>00771B2F    jb          00771B3C
>00771B31    jmp         00771B69
 00771B33    mov         al,5
 00771B35    ret
 00771B36    mov         al,18
 00771B38    ret
 00771B39    mov         al,7
 00771B3B    ret
 00771B3C    sub         edx,96
 00771B42    and         edx,80000003
>00771B48    jns         00771B4F
 00771B4A    dec         edx
 00771B4B    or          edx,0FFFFFFFC
 00771B4E    inc         edx
 00771B4F    sub         edx,4
>00771B52    jb          00771B5E
 00771B54    add         edx,0FFFFFFFE
 00771B57    sub         edx,3
>00771B5A    jb          00771B62
>00771B5C    jmp         00771B66
 00771B5E    mov         al,5
>00771B60    jmp         00771B6B
 00771B62    mov         al,18
>00771B64    jmp         00771B6B
 00771B66    xor         eax,eax
 00771B68    ret
 00771B69    xor         eax,eax
 00771B6B    ret
*}
end;

//00771B6C
procedure TKinectPlayerValue.GetValue;
begin
{*
 00771B6C    push        ebx
 00771B6D    push        esi
 00771B6E    push        edi
 00771B6F    add         esp,0FFFFFFCC
 00771B72    xor         edx,edx
 00771B74    mov         dword ptr [esp],edx
 00771B77    mov         dword ptr [esp+4],edx
 00771B7B    mov         edx,dword ptr ds:[78D8AC];^gvar_00822D79
 00771B81    cmp         byte ptr [edx],0
>00771B84    je          00772B58
 00771B8A    cmp         dword ptr [eax+18],0;TKinectPlayerValue....................................................
>00771B8E    jl          00772B58
 00771B94    mov         edx,dword ptr [eax+18];TKinectPlayerValue..................................................
 00771B97    cmp         edx,6
>00771B9A    jg          00772B58
 00771BA0    cmp         edx,7
>00771BA3    jle         00771BAB
 00771BA5    mov         dword ptr [esp+8],edx
>00771BA9    jmp         00771BC1
 00771BAB    mov         ecx,dword ptr [edx*4+78CA4C]
 00771BB2    mov         dword ptr [esp+8],ecx
 00771BB6    cmp         dword ptr [esp+8],0
>00771BBB    jne         00771BC1
 00771BBD    mov         dword ptr [esp+8],edx
 00771BC1    imul        edx,edx,35
 00771BC4    lea         esi,[edx*8+823858];gvar_00823858:Pointer
 00771BCB    cmp         byte ptr ds:[822DC9],0;gvar_00822DC9
>00771BD2    je          00771C09
 00771BD4    cmp         dword ptr [eax+20],0B;TKinectPlayerValue...................................Item:Integer
>00771BD8    jl          00771C09
 00771BDA    cmp         dword ptr [eax+20],96;TKinectPlayerValue....................................Item:Integer
>00771BE1    jge         00771C09
 00771BE3    cmp         byte ptr [esi+5C],0
>00771BE7    je          00771C09
 00771BE9    xor         ebx,ebx
 00771BEB    mov         edx,8243F0;gvar_008243F0
 00771BF0    mov         ecx,ebx
 00771BF2    add         ecx,ecx
 00771BF4    push        esi
 00771BF5    lea         esi,[esi+ecx*8+64]
 00771BF9    mov         edi,edx
 00771BFB    movs        dword ptr [edi],dword ptr [esi]
 00771BFC    movs        dword ptr [edi],dword ptr [esi]
 00771BFD    movs        dword ptr [edi],dword ptr [esi]
 00771BFE    movs        dword ptr [edi],dword ptr [esi]
 00771BFF    pop         esi
 00771C00    inc         ebx
 00771C01    add         edx,10
 00771C04    cmp         ebx,14
>00771C07    jne         00771BF0
 00771C09    mov         edx,dword ptr [eax+20];TKinectPlayerValue.....................................Item:Integ...
 00771C0C    mov         ecx,edx
 00771C0E    cmp         ecx,0E5
>00771C14    ja          00772B4F
 00771C1A    movzx       ecx,byte ptr [ecx+771C28]
 00771C21    jmp         dword ptr [ecx*4+771D0E]
 00771C21    db          1
 00771C21    db          7
 00771C21    db          9
 00771C21    db          0
 00771C21    db          11
 00771C21    db          10
 00771C21    db          12
 00771C21    db          0
 00771C21    db          13
 00771C21    db          14
 00771C21    db          15
 00771C21    db          16
 00771C21    db          17
 00771C21    db          25
 00771C21    db          31
 00771C21    db          24
 00771C21    db          30
 00771C21    db          37
 00771C21    db          36
 00771C21    db          20
 00771C21    db          21
 00771C21    db          19
 00771C21    db          18
 00771C21    db          23
 00771C21    db          35
 00771C21    db          33
 00771C21    db          29
 00771C21    db          27
 00771C21    db          22
 00771C21    db          34
 00771C21    db          32
 00771C21    db          28
 00771C21    db          26
 00771C21    db          39
 00771C21    db          43
 00771C21    db          41
 00771C21    db          45
 00771C21    db          38
 00771C21    db          42
 00771C21    db          40
 00771C21    db          44
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          2
 00771C21    db          3
 00771C21    db          4
 00771C21    db          5
 00771C21    db          6
 00771C21    db          8
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          46
 00771C21    db          47
 00771C21    db          48
 00771C21    db          49
 00771C21    db          52
 00771C21    db          53
 00771C21    db          54
 00771C21    db          55
 00771C21    db          56
 00771C21    db          57
 00771C21    db          58
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          50
 00771C21    db          51
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          0
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    db          59
 00771C21    dd          00772B4F
 00771C21    dd          00771DFE
 00771C21    dd          00771E16
 00771C21    dd          00771E32
 00771C21    dd          00771E69
 00771C21    dd          00771EA0
 00771C21    dd          00771ED7
 00771C21    dd          00771F0E
 00771C21    dd          00771F1B
 00771C21    dd          00771F35
 00771C21    dd          00771F4B
 00771C21    dd          00771F5B
 00771C21    dd          00771F6B
 00771C21    dd          00771F7D
 00771C21    dd          00771F89
 00771C21    dd          00771F95
 00771C21    dd          00771FA3
 00771C21    dd          00771FDF
 00771C21    dd          0077201B
 00771C21    dd          00772073
 00771C21    dd          007720CB
 00771C21    dd          00772123
 00771C21    dd          0077217B
 00771C21    dd          007721A0
 00771C21    dd          007721C5
 00771C21    dd          007721E8
 00771C21    dd          0077220B
 00771C21    dd          0077224C
 00771C21    dd          0077228B
 00771C21    dd          007722CA
 00771C21    dd          0077230B
 00771C21    dd          0077232E
 00771C21    dd          00772351
 00771C21    dd          00772390
 00771C21    dd          007723CF
 00771C21    dd          00772410
 00771C21    dd          00772451
 00771C21    dd          00772476
 00771C21    dd          0077249B
 00771C21    dd          007724DC
 00771C21    dd          0077251D
 00771C21    dd          0077255C
 00771C21    dd          0077259B
 00771C21    dd          007725C0
 00771C21    dd          007725E3
 00771C21    dd          00772622
 00771C21    dd          00772661
 00771C21    dd          0077269D
 00771C21    dd          007726D9
 00771C21    dd          00772715
 00771C21    dd          00772751
 00771C21    dd          00772810
 00771C21    dd          00772872
 00771C21    dd          0077291B
 00771C21    dd          007729C4
 00771C21    dd          007729F7
 00771C21    dd          00772A2A
 00771C21    dd          00772A5D
 00771C21    dd          00772A95
 00771C21    dd          00772ACD
 00771DFE    movzx       eax,byte ptr [esi+5C]
 00771E02    movsx       eax,al
 00771E05    mov         dword ptr [esp+28],eax
 00771E09    fild        dword ptr [esp+28]
 00771E0D    fstp        qword ptr [esp]
 00771E10    wait
>00771E11    jmp         00772B58
 00771E16    mov         eax,[00822DEC];gvar_00822DEC
 00771E1B    mov         dword ptr [esp+2C],eax
 00771E1F    xor         eax,eax
 00771E21    mov         dword ptr [esp+30],eax
 00771E25    fild        qword ptr [esp+2C]
 00771E29    fstp        qword ptr [esp]
 00771E2C    wait
>00771E2D    jmp         00772B58
 00771E32    cmp         dword ptr [esp+8],1
>00771E37    jl          00771E5B
 00771E39    cmp         dword ptr [esp+8],6
>00771E3E    jg          00771E5B
 00771E40    test        byte ptr [esi+60],4
 00771E44    setne       al
 00771E47    movsx       eax,al
 00771E4A    mov         dword ptr [esp+28],eax
 00771E4E    fild        dword ptr [esp+28]
 00771E52    fstp        qword ptr [esp]
 00771E55    wait
>00771E56    jmp         00772B58
 00771E5B    xor         eax,eax
 00771E5D    mov         dword ptr [esp],eax
 00771E60    mov         dword ptr [esp+4],eax
>00771E64    jmp         00772B58
 00771E69    cmp         dword ptr [esp+8],1
>00771E6E    jl          00771E92
 00771E70    cmp         dword ptr [esp+8],6
>00771E75    jg          00771E92
 00771E77    test        byte ptr [esi+60],8
 00771E7B    setne       al
 00771E7E    movsx       eax,al
 00771E81    mov         dword ptr [esp+28],eax
 00771E85    fild        dword ptr [esp+28]
 00771E89    fstp        qword ptr [esp]
 00771E8C    wait
>00771E8D    jmp         00772B58
 00771E92    xor         eax,eax
 00771E94    mov         dword ptr [esp],eax
 00771E97    mov         dword ptr [esp+4],eax
>00771E9B    jmp         00772B58
 00771EA0    cmp         dword ptr [esp+8],1
>00771EA5    jl          00771EC9
 00771EA7    cmp         dword ptr [esp+8],6
>00771EAC    jg          00771EC9
 00771EAE    test        byte ptr [esi+60],2
 00771EB2    setne       al
 00771EB5    movsx       eax,al
 00771EB8    mov         dword ptr [esp+28],eax
 00771EBC    fild        dword ptr [esp+28]
 00771EC0    fstp        qword ptr [esp]
 00771EC3    wait
>00771EC4    jmp         00772B58
 00771EC9    xor         eax,eax
 00771ECB    mov         dword ptr [esp],eax
 00771ECE    mov         dword ptr [esp+4],eax
>00771ED2    jmp         00772B58
 00771ED7    cmp         dword ptr [esp+8],1
>00771EDC    jl          00771F00
 00771EDE    cmp         dword ptr [esp+8],6
>00771EE3    jg          00771F00
 00771EE5    test        byte ptr [esi+60],1
 00771EE9    setne       al
 00771EEC    movsx       eax,al
 00771EEF    mov         dword ptr [esp+28],eax
 00771EF3    fild        dword ptr [esp+28]
 00771EF7    fstp        qword ptr [esp]
 00771EFA    wait
>00771EFB    jmp         00772B58
 00771F00    xor         eax,eax
 00771F02    mov         dword ptr [esp],eax
 00771F05    mov         dword ptr [esp+4],eax
>00771F09    jmp         00772B58
 00771F0E    fild        dword ptr [esp+8]
 00771F12    fstp        qword ptr [esp]
 00771F15    wait
>00771F16    jmp         00772B58
 00771F1B    mov         eax,dword ptr [esi+58]
 00771F1E    mov         dword ptr [esp+2C],eax
 00771F22    xor         eax,eax
 00771F24    mov         dword ptr [esp+30],eax
 00771F28    fild        qword ptr [esp+2C]
 00771F2C    fstp        qword ptr [esp]
 00771F2F    wait
>00771F30    jmp         00772B58
 00771F35    call        007713A0
 00771F3A    mov         dword ptr [esp+28],eax
 00771F3E    fild        dword ptr [esp+28]
 00771F42    fstp        qword ptr [esp]
 00771F45    wait
>00771F46    jmp         00772B58
 00771F4B    mov         al,1
 00771F4D    call        00686074
 00771F52    fstp        qword ptr [esp]
 00771F55    wait
>00771F56    jmp         00772B58
 00771F5B    xor         eax,eax
 00771F5D    call        00686074
 00771F62    fstp        qword ptr [esp]
 00771F65    wait
>00771F66    jmp         00772B58
 00771F6B    movzx       eax,byte ptr [esi+5C]
 00771F6F    call        00686074
 00771F74    fstp        qword ptr [esp]
 00771F77    wait
>00771F78    jmp         00772B58
 00771F7D    fld         dword ptr [esi+64]
 00771F80    fstp        qword ptr [esp]
 00771F83    wait
>00771F84    jmp         00772B58
 00771F89    fld         dword ptr [esi+68]
 00771F8C    fstp        qword ptr [esp]
 00771F8F    wait
>00771F90    jmp         00772B58
 00771F95    fld         dword ptr [esi+6C]
 00771F98    fchs
 00771F9A    fstp        qword ptr [esp]
 00771F9D    wait
>00771F9E    jmp         00772B58
 00771FA3    fld         dword ptr ds:[824410];gvar_00824410:Single
 00771FA9    fsub        dword ptr ds:[824400];gvar_00824400:Single
 00771FAF    add         esp,0FFFFFFF4
 00771FB2    fstp        tbyte ptr [esp]
 00771FB5    wait
 00771FB6    fld         dword ptr ds:[824414];gvar_00824414:Single
 00771FBC    fsub        dword ptr ds:[824404];gvar_00824404:Single
 00771FC2    add         esp,0FFFFFFF4
 00771FC5    fstp        tbyte ptr [esp]
 00771FC8    wait
 00771FC9    call        00454A8C
 00771FCE    fld         tbyte ptr ds:[772B64];57.2957795130823:Extended
 00771FD4    fmulp       st(1),st
 00771FD6    fstp        qword ptr [esp]
 00771FD9    wait
>00771FDA    jmp         00772B58
 00771FDF    fld         dword ptr ds:[824418];gvar_00824418:Single
 00771FE5    fsub        dword ptr ds:[824408];gvar_00824408:Single
 00771FEB    add         esp,0FFFFFFF4
 00771FEE    fstp        tbyte ptr [esp]
 00771FF1    wait
 00771FF2    fld         dword ptr ds:[824414];gvar_00824414:Single
 00771FF8    fsub        dword ptr ds:[824404];gvar_00824404:Single
 00771FFE    add         esp,0FFFFFFF4
 00772001    fstp        tbyte ptr [esp]
 00772004    wait
 00772005    call        00454A8C
 0077200A    fld         tbyte ptr ds:[772B64];57.2957795130823:Extended
 00772010    fmulp       st(1),st
 00772012    fstp        qword ptr [esp]
 00772015    wait
>00772016    jmp         00772B58
 0077201B    fld         dword ptr ds:[824418];gvar_00824418:Single
 00772021    fsub        dword ptr ds:[824408];gvar_00824408:Single
 00772027    add         esp,0FFFFFFF4
 0077202A    fstp        tbyte ptr [esp]
 0077202D    wait
 0077202E    fld         dword ptr ds:[824414];gvar_00824414:Single
 00772034    fsub        dword ptr ds:[824404];gvar_00824404:Single
 0077203A    add         esp,0FFFFFFF4
 0077203D    fstp        tbyte ptr [esp]
 00772040    wait
 00772041    call        00454A8C
 00772046    fld         tbyte ptr ds:[772B64];57.2957795130823:Extended
 0077204C    fmulp       st(1),st
 0077204E    fstp        qword ptr [esp]
 00772051    wait
 00772052    fld         qword ptr [esp]
 00772055    fcomp       dword ptr ds:[772B70];0:Single
 0077205B    wait
 0077205C    fnstsw      al
 0077205E    sahf
>0077205F    jae         00772B58
 00772065    xor         eax,eax
 00772067    mov         dword ptr [esp],eax
 0077206A    mov         dword ptr [esp+4],eax
>0077206E    jmp         00772B58
 00772073    fld         dword ptr ds:[824418];gvar_00824418:Single
 00772079    fsub        dword ptr ds:[824408];gvar_00824408:Single
 0077207F    add         esp,0FFFFFFF4
 00772082    fstp        tbyte ptr [esp]
 00772085    wait
 00772086    fld         dword ptr ds:[824414];gvar_00824414:Single
 0077208C    fsub        dword ptr ds:[824404];gvar_00824404:Single
 00772092    add         esp,0FFFFFFF4
 00772095    fstp        tbyte ptr [esp]
 00772098    wait
 00772099    call        00454A8C
 0077209E    fld         tbyte ptr ds:[772B74];-57.2957795130823:Extended
 007720A4    fmulp       st(1),st
 007720A6    fstp        qword ptr [esp]
 007720A9    wait
 007720AA    fld         qword ptr [esp]
 007720AD    fcomp       dword ptr ds:[772B70];0:Single
 007720B3    wait
 007720B4    fnstsw      al
 007720B6    sahf
>007720B7    jae         00772B58
 007720BD    xor         eax,eax
 007720BF    mov         dword ptr [esp],eax
 007720C2    mov         dword ptr [esp+4],eax
>007720C6    jmp         00772B58
 007720CB    fld         dword ptr ds:[824410];gvar_00824410:Single
 007720D1    fsub        dword ptr ds:[824400];gvar_00824400:Single
 007720D7    add         esp,0FFFFFFF4
 007720DA    fstp        tbyte ptr [esp]
 007720DD    wait
 007720DE    fld         dword ptr ds:[824414];gvar_00824414:Single
 007720E4    fsub        dword ptr ds:[824404];gvar_00824404:Single
 007720EA    add         esp,0FFFFFFF4
 007720ED    fstp        tbyte ptr [esp]
 007720F0    wait
 007720F1    call        00454A8C
 007720F6    fld         tbyte ptr ds:[772B74];-57.2957795130823:Extended
 007720FC    fmulp       st(1),st
 007720FE    fstp        qword ptr [esp]
 00772101    wait
 00772102    fld         qword ptr [esp]
 00772105    fcomp       dword ptr ds:[772B70];0:Single
 0077210B    wait
 0077210C    fnstsw      al
 0077210E    sahf
>0077210F    jae         00772B58
 00772115    xor         eax,eax
 00772117    mov         dword ptr [esp],eax
 0077211A    mov         dword ptr [esp+4],eax
>0077211E    jmp         00772B58
 00772123    fld         dword ptr ds:[824410];gvar_00824410:Single
 00772129    fsub        dword ptr ds:[824400];gvar_00824400:Single
 0077212F    add         esp,0FFFFFFF4
 00772132    fstp        tbyte ptr [esp]
 00772135    wait
 00772136    fld         dword ptr ds:[824414];gvar_00824414:Single
 0077213C    fsub        dword ptr ds:[824404];gvar_00824404:Single
 00772142    add         esp,0FFFFFFF4
 00772145    fstp        tbyte ptr [esp]
 00772148    wait
 00772149    call        00454A8C
 0077214E    fld         tbyte ptr ds:[772B64];57.2957795130823:Extended
 00772154    fmulp       st(1),st
 00772156    fstp        qword ptr [esp]
 00772159    wait
 0077215A    fld         qword ptr [esp]
 0077215D    fcomp       dword ptr ds:[772B70];0:Single
 00772163    wait
 00772164    fnstsw      al
 00772166    sahf
>00772167    jae         00772B58
 0077216D    xor         eax,eax
 0077216F    mov         dword ptr [esp],eax
 00772172    mov         dword ptr [esp+4],eax
>00772176    jmp         00772B58
 0077217B    fld         dword ptr ds:[8244A8];gvar_008244A8:Single
 00772181    fsub        dword ptr ds:[824478];gvar_00824478:Single
 00772187    fchs
 00772189    fmul        dword ptr ds:[772B80];1000:Single
 0077218F    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772195    fdivp       st(1),st
 00772197    fstp        qword ptr [esp]
 0077219A    wait
>0077219B    jmp         00772B58
 007721A0    fld         dword ptr ds:[824468];gvar_00824468:Single
 007721A6    fsub        dword ptr ds:[824438];gvar_00824438:Single
 007721AC    fchs
 007721AE    fmul        dword ptr ds:[772B80];1000:Single
 007721B4    fld         tbyte ptr ds:[772B84];25.4:Extended
 007721BA    fdivp       st(1),st
 007721BC    fstp        qword ptr [esp]
 007721BF    wait
>007721C0    jmp         00772B58
 007721C5    fld         dword ptr ds:[8244A0];gvar_008244A0:Single
 007721CB    fsub        dword ptr ds:[824470];gvar_00824470:Single
 007721D1    fmul        dword ptr ds:[772B80];1000:Single
 007721D7    fld         tbyte ptr ds:[772B84];25.4:Extended
 007721DD    fdivp       st(1),st
 007721DF    fstp        qword ptr [esp]
 007721E2    wait
>007721E3    jmp         00772B58
 007721E8    fld         dword ptr ds:[824460];gvar_00824460:Single
 007721EE    fsub        dword ptr ds:[824430];gvar_00824430:Single
 007721F4    fmul        dword ptr ds:[772B80];1000:Single
 007721FA    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772200    fdivp       st(1),st
 00772202    fstp        qword ptr [esp]
 00772205    wait
>00772206    jmp         00772B58
 0077220B    fld         dword ptr ds:[8244A0];gvar_008244A0:Single
 00772211    fsub        dword ptr ds:[824470];gvar_00824470:Single
 00772217    fchs
 00772219    fmul        dword ptr ds:[772B80];1000:Single
 0077221F    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772225    fdivp       st(1),st
 00772227    fstp        qword ptr [esp]
 0077222A    wait
 0077222B    fld         qword ptr [esp]
 0077222E    fcomp       dword ptr ds:[772B70];0:Single
 00772234    wait
 00772235    fnstsw      al
 00772237    sahf
>00772238    jae         00772B58
 0077223E    xor         eax,eax
 00772240    mov         dword ptr [esp],eax
 00772243    mov         dword ptr [esp+4],eax
>00772247    jmp         00772B58
 0077224C    fld         dword ptr ds:[824460];gvar_00824460:Single
 00772252    fsub        dword ptr ds:[824430];gvar_00824430:Single
 00772258    fmul        dword ptr ds:[772B80];1000:Single
 0077225E    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772264    fdivp       st(1),st
 00772266    fstp        qword ptr [esp]
 00772269    wait
 0077226A    fld         qword ptr [esp]
 0077226D    fcomp       dword ptr ds:[772B70];0:Single
 00772273    wait
 00772274    fnstsw      al
 00772276    sahf
>00772277    jae         00772B58
 0077227D    xor         eax,eax
 0077227F    mov         dword ptr [esp],eax
 00772282    mov         dword ptr [esp+4],eax
>00772286    jmp         00772B58
 0077228B    fld         dword ptr ds:[8244A0];gvar_008244A0:Single
 00772291    fsub        dword ptr ds:[824470];gvar_00824470:Single
 00772297    fmul        dword ptr ds:[772B80];1000:Single
 0077229D    fld         tbyte ptr ds:[772B84];25.4:Extended
 007722A3    fdivp       st(1),st
 007722A5    fstp        qword ptr [esp]
 007722A8    wait
 007722A9    fld         qword ptr [esp]
 007722AC    fcomp       dword ptr ds:[772B70];0:Single
 007722B2    wait
 007722B3    fnstsw      al
 007722B5    sahf
>007722B6    jae         00772B58
 007722BC    xor         eax,eax
 007722BE    mov         dword ptr [esp],eax
 007722C1    mov         dword ptr [esp+4],eax
>007722C5    jmp         00772B58
 007722CA    fld         dword ptr ds:[824460];gvar_00824460:Single
 007722D0    fsub        dword ptr ds:[824430];gvar_00824430:Single
 007722D6    fchs
 007722D8    fmul        dword ptr ds:[772B80];1000:Single
 007722DE    fld         tbyte ptr ds:[772B84];25.4:Extended
 007722E4    fdivp       st(1),st
 007722E6    fstp        qword ptr [esp]
 007722E9    wait
 007722EA    fld         qword ptr [esp]
 007722ED    fcomp       dword ptr ds:[772B70];0:Single
 007722F3    wait
 007722F4    fnstsw      al
 007722F6    sahf
>007722F7    jae         00772B58
 007722FD    xor         eax,eax
 007722FF    mov         dword ptr [esp],eax
 00772302    mov         dword ptr [esp+4],eax
>00772306    jmp         00772B58
 0077230B    fld         dword ptr ds:[8244A4];gvar_008244A4:Single
 00772311    fsub        dword ptr ds:[824474];gvar_00824474:Single
 00772317    fmul        dword ptr ds:[772B80];1000:Single
 0077231D    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772323    fdivp       st(1),st
 00772325    fstp        qword ptr [esp]
 00772328    wait
>00772329    jmp         00772B58
 0077232E    fld         dword ptr ds:[824464];gvar_00824464:Single
 00772334    fsub        dword ptr ds:[824434];gvar_00824434:Single
 0077233A    fmul        dword ptr ds:[772B80];1000:Single
 00772340    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772346    fdivp       st(1),st
 00772348    fstp        qword ptr [esp]
 0077234B    wait
>0077234C    jmp         00772B58
 00772351    fld         dword ptr ds:[8244A4];gvar_008244A4:Single
 00772357    fsub        dword ptr ds:[824474];gvar_00824474:Single
 0077235D    fmul        dword ptr ds:[772B80];1000:Single
 00772363    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772369    fdivp       st(1),st
 0077236B    fstp        qword ptr [esp]
 0077236E    wait
 0077236F    fld         qword ptr [esp]
 00772372    fcomp       dword ptr ds:[772B70];0:Single
 00772378    wait
 00772379    fnstsw      al
 0077237B    sahf
>0077237C    jae         00772B58
 00772382    xor         eax,eax
 00772384    mov         dword ptr [esp],eax
 00772387    mov         dword ptr [esp+4],eax
>0077238B    jmp         00772B58
 00772390    fld         dword ptr ds:[824464];gvar_00824464:Single
 00772396    fsub        dword ptr ds:[824434];gvar_00824434:Single
 0077239C    fmul        dword ptr ds:[772B80];1000:Single
 007723A2    fld         tbyte ptr ds:[772B84];25.4:Extended
 007723A8    fdivp       st(1),st
 007723AA    fstp        qword ptr [esp]
 007723AD    wait
 007723AE    fld         qword ptr [esp]
 007723B1    fcomp       dword ptr ds:[772B70];0:Single
 007723B7    wait
 007723B8    fnstsw      al
 007723BA    sahf
>007723BB    jae         00772B58
 007723C1    xor         eax,eax
 007723C3    mov         dword ptr [esp],eax
 007723C6    mov         dword ptr [esp+4],eax
>007723CA    jmp         00772B58
 007723CF    fld         dword ptr ds:[8244A4];gvar_008244A4:Single
 007723D5    fsub        dword ptr ds:[824474];gvar_00824474:Single
 007723DB    fchs
 007723DD    fmul        dword ptr ds:[772B80];1000:Single
 007723E3    fld         tbyte ptr ds:[772B84];25.4:Extended
 007723E9    fdivp       st(1),st
 007723EB    fstp        qword ptr [esp]
 007723EE    wait
 007723EF    fld         qword ptr [esp]
 007723F2    fcomp       dword ptr ds:[772B70];0:Single
 007723F8    wait
 007723F9    fnstsw      al
 007723FB    sahf
>007723FC    jae         00772B58
 00772402    xor         eax,eax
 00772404    mov         dword ptr [esp],eax
 00772407    mov         dword ptr [esp+4],eax
>0077240B    jmp         00772B58
 00772410    fld         dword ptr ds:[824464];gvar_00824464:Single
 00772416    fsub        dword ptr ds:[824434];gvar_00824434:Single
 0077241C    fchs
 0077241E    fmul        dword ptr ds:[772B80];1000:Single
 00772424    fld         tbyte ptr ds:[772B84];25.4:Extended
 0077242A    fdivp       st(1),st
 0077242C    fstp        qword ptr [esp]
 0077242F    wait
 00772430    fld         qword ptr [esp]
 00772433    fcomp       dword ptr ds:[772B70];0:Single
 00772439    wait
 0077243A    fnstsw      al
 0077243C    sahf
>0077243D    jae         00772B58
 00772443    xor         eax,eax
 00772445    mov         dword ptr [esp],eax
 00772448    mov         dword ptr [esp+4],eax
>0077244C    jmp         00772B58
 00772451    fld         dword ptr ds:[824528];gvar_00824528:Single
 00772457    fsub        dword ptr ds:[8244F8];gvar_008244F8:Single
 0077245D    fchs
 0077245F    fmul        dword ptr ds:[772B80];1000:Single
 00772465    fld         tbyte ptr ds:[772B84];25.4:Extended
 0077246B    fdivp       st(1),st
 0077246D    fstp        qword ptr [esp]
 00772470    wait
>00772471    jmp         00772B58
 00772476    fld         dword ptr ds:[8244E8];gvar_008244E8:Single
 0077247C    fsub        dword ptr ds:[8244B8];gvar_008244B8:Single
 00772482    fchs
 00772484    fmul        dword ptr ds:[772B80];1000:Single
 0077248A    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772490    fdivp       st(1),st
 00772492    fstp        qword ptr [esp]
 00772495    wait
>00772496    jmp         00772B58
 0077249B    fld         dword ptr ds:[824528];gvar_00824528:Single
 007724A1    fsub        dword ptr ds:[8244F8];gvar_008244F8:Single
 007724A7    fchs
 007724A9    fmul        dword ptr ds:[772B80];1000:Single
 007724AF    fld         tbyte ptr ds:[772B84];25.4:Extended
 007724B5    fdivp       st(1),st
 007724B7    fstp        qword ptr [esp]
 007724BA    wait
 007724BB    fld         qword ptr [esp]
 007724BE    fcomp       dword ptr ds:[772B70];0:Single
 007724C4    wait
 007724C5    fnstsw      al
 007724C7    sahf
>007724C8    jae         00772B58
 007724CE    xor         eax,eax
 007724D0    mov         dword ptr [esp],eax
 007724D3    mov         dword ptr [esp+4],eax
>007724D7    jmp         00772B58
 007724DC    fld         dword ptr ds:[8244E8];gvar_008244E8:Single
 007724E2    fsub        dword ptr ds:[8244B8];gvar_008244B8:Single
 007724E8    fchs
 007724EA    fmul        dword ptr ds:[772B80];1000:Single
 007724F0    fld         tbyte ptr ds:[772B84];25.4:Extended
 007724F6    fdivp       st(1),st
 007724F8    fstp        qword ptr [esp]
 007724FB    wait
 007724FC    fld         qword ptr [esp]
 007724FF    fcomp       dword ptr ds:[772B70];0:Single
 00772505    wait
 00772506    fnstsw      al
 00772508    sahf
>00772509    jae         00772B58
 0077250F    xor         eax,eax
 00772511    mov         dword ptr [esp],eax
 00772514    mov         dword ptr [esp+4],eax
>00772518    jmp         00772B58
 0077251D    fld         dword ptr ds:[824528];gvar_00824528:Single
 00772523    fsub        dword ptr ds:[8244F8];gvar_008244F8:Single
 00772529    fmul        dword ptr ds:[772B80];1000:Single
 0077252F    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772535    fdivp       st(1),st
 00772537    fstp        qword ptr [esp]
 0077253A    wait
 0077253B    fld         qword ptr [esp]
 0077253E    fcomp       dword ptr ds:[772B70];0:Single
 00772544    wait
 00772545    fnstsw      al
 00772547    sahf
>00772548    jae         00772B58
 0077254E    xor         eax,eax
 00772550    mov         dword ptr [esp],eax
 00772553    mov         dword ptr [esp+4],eax
>00772557    jmp         00772B58
 0077255C    fld         dword ptr ds:[8244E8];gvar_008244E8:Single
 00772562    fsub        dword ptr ds:[8244B8];gvar_008244B8:Single
 00772568    fmul        dword ptr ds:[772B80];1000:Single
 0077256E    fld         tbyte ptr ds:[772B84];25.4:Extended
 00772574    fdivp       st(1),st
 00772576    fstp        qword ptr [esp]
 00772579    wait
 0077257A    fld         qword ptr [esp]
 0077257D    fcomp       dword ptr ds:[772B70];0:Single
 00772583    wait
 00772584    fnstsw      al
 00772586    sahf
>00772587    jae         00772B58
 0077258D    xor         eax,eax
 0077258F    mov         dword ptr [esp],eax
 00772592    mov         dword ptr [esp+4],eax
>00772596    jmp         00772B58
 0077259B    fld         dword ptr ds:[8244E0];gvar_008244E0:Single
 007725A1    fsub        dword ptr ds:[8244B0];gvar_008244B0:Single
 007725A7    fchs
 007725A9    fmul        dword ptr ds:[772B80];1000:Single
 007725AF    fld         tbyte ptr ds:[772B84];25.4:Extended
 007725B5    fdivp       st(1),st
 007725B7    fstp        qword ptr [esp]
 007725BA    wait
>007725BB    jmp         00772B58
 007725C0    fld         dword ptr ds:[824520];gvar_00824520:Single
 007725C6    fsub        dword ptr ds:[8244F0];gvar_008244F0:Single
 007725CC    fmul        dword ptr ds:[772B80];1000:Single
 007725D2    fld         tbyte ptr ds:[772B84];25.4:Extended
 007725D8    fdivp       st(1),st
 007725DA    fstp        qword ptr [esp]
 007725DD    wait
>007725DE    jmp         00772B58
 007725E3    fld         dword ptr ds:[824524];gvar_00824524:Single
 007725E9    fsub        dword ptr ds:[8244E4];gvar_008244E4:Single
 007725EF    fmul        dword ptr ds:[772B80];1000:Single
 007725F5    fld         tbyte ptr ds:[772B84];25.4:Extended
 007725FB    fdivp       st(1),st
 007725FD    fstp        qword ptr [esp]
 00772600    wait
 00772601    fld         qword ptr [esp]
 00772604    fcomp       dword ptr ds:[772B70];0:Single
 0077260A    wait
 0077260B    fnstsw      al
 0077260D    sahf
>0077260E    jae         00772B58
 00772614    xor         eax,eax
 00772616    mov         dword ptr [esp],eax
 00772619    mov         dword ptr [esp+4],eax
>0077261D    jmp         00772B58
 00772622    fld         dword ptr ds:[8244E4];gvar_008244E4:Single
 00772628    fsub        dword ptr ds:[824524];gvar_00824524:Single
 0077262E    fmul        dword ptr ds:[772B80];1000:Single
 00772634    fld         tbyte ptr ds:[772B84];25.4:Extended
 0077263A    fdivp       st(1),st
 0077263C    fstp        qword ptr [esp]
 0077263F    wait
 00772640    fld         qword ptr [esp]
 00772643    fcomp       dword ptr ds:[772B70];0:Single
 00772649    wait
 0077264A    fnstsw      al
 0077264C    sahf
>0077264D    jae         00772B58
 00772653    xor         eax,eax
 00772655    mov         dword ptr [esp],eax
 00772658    mov         dword ptr [esp+4],eax
>0077265C    jmp         00772B58
 00772661    fld         dword ptr ds:[8244A4];gvar_008244A4:Single
 00772667    fsub        dword ptr ds:[824464];gvar_00824464:Single
 0077266D    add         esp,0FFFFFFF4
 00772670    fstp        tbyte ptr [esp]
 00772673    wait
 00772674    fld         dword ptr ds:[8244A0];gvar_008244A0:Single
 0077267A    fsub        dword ptr ds:[824460];gvar_00824460:Single
 00772680    add         esp,0FFFFFFF4
 00772683    fstp        tbyte ptr [esp]
 00772686    wait
 00772687    call        00454A8C
 0077268C    fld         tbyte ptr ds:[772B74];-57.2957795130823:Extended
 00772692    fmulp       st(1),st
 00772694    fstp        qword ptr [esp]
 00772697    wait
>00772698    jmp         00772B58
 0077269D    fld         dword ptr ds:[824478];gvar_00824478:Single
 007726A3    fsub        dword ptr ds:[824438];gvar_00824438:Single
 007726A9    add         esp,0FFFFFFF4
 007726AC    fstp        tbyte ptr [esp]
 007726AF    wait
 007726B0    fld         dword ptr ds:[824470];gvar_00824470:Single
 007726B6    fsub        dword ptr ds:[824430];gvar_00824430:Single
 007726BC    add         esp,0FFFFFFF4
 007726BF    fstp        tbyte ptr [esp]
 007726C2    wait
 007726C3    call        00454A8C
 007726C8    fld         tbyte ptr ds:[772B64];57.2957795130823:Extended
 007726CE    fmulp       st(1),st
 007726D0    fstp        qword ptr [esp]
 007726D3    wait
>007726D4    jmp         00772B58
 007726D9    fld         dword ptr ds:[8244F8];gvar_008244F8:Single
 007726DF    fsub        dword ptr ds:[8244B8];gvar_008244B8:Single
 007726E5    add         esp,0FFFFFFF4
 007726E8    fstp        tbyte ptr [esp]
 007726EB    wait
 007726EC    fld         dword ptr ds:[8244F0];gvar_008244F0:Single
 007726F2    fsub        dword ptr ds:[8244B0];gvar_008244B0:Single
 007726F8    add         esp,0FFFFFFF4
 007726FB    fstp        tbyte ptr [esp]
 007726FE    wait
 007726FF    call        00454A8C
 00772704    fld         tbyte ptr ds:[772B64];57.2957795130823:Extended
 0077270A    fmulp       st(1),st
 0077270C    fstp        qword ptr [esp]
 0077270F    wait
>00772710    jmp         00772B58
 00772715    fld         dword ptr ds:[824528];gvar_00824528:Single
 0077271B    fsub        dword ptr ds:[8244E8];gvar_008244E8:Single
 00772721    add         esp,0FFFFFFF4
 00772724    fstp        tbyte ptr [esp]
 00772727    wait
 00772728    fld         dword ptr ds:[824520];gvar_00824520:Single
 0077272E    fsub        dword ptr ds:[8244E0];gvar_008244E0:Single
 00772734    add         esp,0FFFFFFF4
 00772737    fstp        tbyte ptr [esp]
 0077273A    wait
 0077273B    call        00454A8C
 00772740    fld         tbyte ptr ds:[772B64];57.2957795130823:Extended
 00772746    fmulp       st(1),st
 00772748    fstp        qword ptr [esp]
 0077274B    wait
>0077274C    jmp         00772B58
 00772751    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772757    fcomp       dword ptr ds:[772B70];0:Single
 0077275D    wait
 0077275E    fnstsw      al
 00772760    sahf
>00772761    jne         007727C1
 00772763    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772769    fcomp       dword ptr ds:[772B70];0:Single
 0077276F    wait
 00772770    fnstsw      al
 00772772    sahf
>00772773    jne         007727C1
 00772775    fld         dword ptr ds:[823850];gvar_00823850:Single
 0077277B    fcomp       dword ptr ds:[772B70];0:Single
 00772781    wait
 00772782    fnstsw      al
 00772784    sahf
>00772785    jne         007727C1
 00772787    fld         dword ptr ds:[823854];gvar_00823854:Single
 0077278D    fcomp       dword ptr ds:[772B70];0:Single
 00772793    wait
 00772794    fnstsw      al
 00772796    sahf
>00772797    jne         007727C1
 00772799    fld         dword ptr [esi+158]
 0077279F    add         esp,0FFFFFFF8
 007727A2    fstp        qword ptr [esp]
 007727A5    wait
 007727A6    fld         dword ptr [esi+198]
 007727AC    add         esp,0FFFFFFF8
 007727AF    fstp        qword ptr [esp]
 007727B2    wait
 007727B3    call        00770E20
 007727B8    fstp        qword ptr [esp]
 007727BB    wait
>007727BC    jmp         00772B58
 007727C1    add         esi,64
 007727C4    lea         edi,[esp+18]
 007727C8    movs        dword ptr [edi],dword ptr [esi]
 007727C9    movs        dword ptr [edi],dword ptr [esi]
 007727CA    movs        dword ptr [edi],dword ptr [esi]
 007727CB    movs        dword ptr [edi],dword ptr [esi]
 007727CC    fld         dword ptr ds:[823848];gvar_00823848:Single
 007727D2    fmul        dword ptr [esp+18]
 007727D6    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 007727DC    fmul        dword ptr [esp+1C]
 007727E0    faddp       st(1),st
 007727E2    fld         dword ptr ds:[823850];gvar_00823850:Single
 007727E8    fmul        dword ptr [esp+20]
 007727EC    faddp       st(1),st
 007727EE    fadd        dword ptr ds:[823854];gvar_00823854:Single
 007727F4    fstp        qword ptr [esp+10]
 007727F8    wait
 007727F9    fld         qword ptr [esp+10]
 007727FD    fmul        dword ptr ds:[82384C];gvar_0082384C:Single
 00772803    fsubr       dword ptr [esp+1C]
 00772807    fstp        qword ptr [esp]
 0077280A    wait
>0077280B    jmp         00772B58
 00772810    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772816    fcomp       dword ptr ds:[772B70];0:Single
 0077281C    wait
 0077281D    fnstsw      al
 0077281F    sahf
>00772820    jne         0077285C
 00772822    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772828    fcomp       dword ptr ds:[772B70];0:Single
 0077282E    wait
 0077282F    fnstsw      al
 00772831    sahf
>00772832    jne         0077285C
 00772834    fld         dword ptr ds:[823850];gvar_00823850:Single
 0077283A    fcomp       dword ptr ds:[772B70];0:Single
 00772840    wait
 00772841    fnstsw      al
 00772843    sahf
>00772844    jne         0077285C
 00772846    fld         dword ptr ds:[823854];gvar_00823854:Single
 0077284C    fcomp       dword ptr ds:[772B70];0:Single
 00772852    wait
 00772853    fnstsw      al
 00772855    sahf
>00772856    jne         0077285C
 00772858    xor         eax,eax
>0077285A    jmp         0077285E
 0077285C    mov         al,1
 0077285E    movsx       eax,al
 00772861    mov         dword ptr [esp+28],eax
 00772865    fild        dword ptr [esp+28]
 00772869    fstp        qword ptr [esp]
 0077286C    wait
>0077286D    jmp         00772B58
 00772872    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772878    fcomp       dword ptr ds:[772B70];0:Single
 0077287E    wait
 0077287F    fnstsw      al
 00772881    sahf
>00772882    jne         007728C8
 00772884    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 0077288A    fcomp       dword ptr ds:[772B70];0:Single
 00772890    wait
 00772891    fnstsw      al
 00772893    sahf
>00772894    jne         007728C8
 00772896    fld         dword ptr ds:[823850];gvar_00823850:Single
 0077289C    fcomp       dword ptr ds:[772B70];0:Single
 007728A2    wait
 007728A3    fnstsw      al
 007728A5    sahf
>007728A6    jne         007728C8
 007728A8    fld         dword ptr ds:[823854];gvar_00823854:Single
 007728AE    fcomp       dword ptr ds:[772B70];0:Single
 007728B4    wait
 007728B5    fnstsw      al
 007728B7    sahf
>007728B8    jne         007728C8
 007728BA    xor         eax,eax
 007728BC    mov         dword ptr [esp],eax
 007728BF    mov         dword ptr [esp+4],eax
>007728C3    jmp         00772B58
 007728C8    cmp         byte ptr [esi+5C],0
>007728CC    je          0077290D
 007728CE    add         esi,154
 007728D4    lea         edi,[esp+18]
 007728D8    movs        dword ptr [edi],dword ptr [esi]
 007728D9    movs        dword ptr [edi],dword ptr [esi]
 007728DA    movs        dword ptr [edi],dword ptr [esi]
 007728DB    movs        dword ptr [edi],dword ptr [esi]
 007728DC    fld         dword ptr ds:[823848];gvar_00823848:Single
 007728E2    fmul        dword ptr [esp+18]
 007728E6    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 007728EC    fmul        dword ptr [esp+1C]
 007728F0    faddp       st(1),st
 007728F2    fld         dword ptr ds:[823850];gvar_00823850:Single
 007728F8    fmul        dword ptr [esp+20]
 007728FC    faddp       st(1),st
 007728FE    fadd        dword ptr ds:[823854];gvar_00823854:Single
 00772904    fstp        qword ptr [esp]
 00772907    wait
>00772908    jmp         00772B58
 0077290D    xor         eax,eax
 0077290F    mov         dword ptr [esp],eax
 00772912    mov         dword ptr [esp+4],eax
>00772916    jmp         00772B58
 0077291B    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772921    fcomp       dword ptr ds:[772B70];0:Single
 00772927    wait
 00772928    fnstsw      al
 0077292A    sahf
>0077292B    jne         00772971
 0077292D    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772933    fcomp       dword ptr ds:[772B70];0:Single
 00772939    wait
 0077293A    fnstsw      al
 0077293C    sahf
>0077293D    jne         00772971
 0077293F    fld         dword ptr ds:[823850];gvar_00823850:Single
 00772945    fcomp       dword ptr ds:[772B70];0:Single
 0077294B    wait
 0077294C    fnstsw      al
 0077294E    sahf
>0077294F    jne         00772971
 00772951    fld         dword ptr ds:[823854];gvar_00823854:Single
 00772957    fcomp       dword ptr ds:[772B70];0:Single
 0077295D    wait
 0077295E    fnstsw      al
 00772960    sahf
>00772961    jne         00772971
 00772963    xor         eax,eax
 00772965    mov         dword ptr [esp],eax
 00772968    mov         dword ptr [esp+4],eax
>0077296C    jmp         00772B58
 00772971    cmp         byte ptr [esi+5C],0
>00772975    je          007729B6
 00772977    add         esi,194
 0077297D    lea         edi,[esp+18]
 00772981    movs        dword ptr [edi],dword ptr [esi]
 00772982    movs        dword ptr [edi],dword ptr [esi]
 00772983    movs        dword ptr [edi],dword ptr [esi]
 00772984    movs        dword ptr [edi],dword ptr [esi]
 00772985    fld         dword ptr ds:[823848];gvar_00823848:Single
 0077298B    fmul        dword ptr [esp+18]
 0077298F    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772995    fmul        dword ptr [esp+1C]
 00772999    faddp       st(1),st
 0077299B    fld         dword ptr ds:[823850];gvar_00823850:Single
 007729A1    fmul        dword ptr [esp+20]
 007729A5    faddp       st(1),st
 007729A7    fadd        dword ptr ds:[823854];gvar_00823854:Single
 007729AD    fstp        qword ptr [esp]
 007729B0    wait
>007729B1    jmp         00772B58
 007729B6    xor         eax,eax
 007729B8    mov         dword ptr [esp],eax
 007729BB    mov         dword ptr [esp+4],eax
>007729BF    jmp         00772B58
 007729C4    mov         edx,dword ptr [eax+18];TKinectPlayerValue..................................................
 007729C7    cmp         edx,6
>007729CA    jg          007729E9
 007729CC    imul        eax,edx,35
 007729CF    mov         edx,dword ptr [eax*8+823868];gvar_00823868
 007729D6    mov         dword ptr [esp],edx
 007729D9    mov         edx,dword ptr [eax*8+82386C];gvar_0082386C
 007729E0    mov         dword ptr [esp+4],edx
>007729E4    jmp         00772B58
 007729E9    xor         eax,eax
 007729EB    mov         dword ptr [esp],eax
 007729EE    mov         dword ptr [esp+4],eax
>007729F2    jmp         00772B58
 007729F7    mov         edx,dword ptr [eax+18];TKinectPlayerValue..................................................
 007729FA    cmp         edx,6
>007729FD    jg          00772A1C
 007729FF    imul        eax,edx,35
 00772A02    mov         edx,dword ptr [eax*8+823870];gvar_00823870
 00772A09    mov         dword ptr [esp],edx
 00772A0C    mov         edx,dword ptr [eax*8+823874];gvar_00823874
 00772A13    mov         dword ptr [esp+4],edx
>00772A17    jmp         00772B58
 00772A1C    xor         eax,eax
 00772A1E    mov         dword ptr [esp],eax
 00772A21    mov         dword ptr [esp+4],eax
>00772A25    jmp         00772B58
 00772A2A    mov         edx,dword ptr [eax+18];TKinectPlayerValue..................................................
 00772A2D    cmp         edx,6
>00772A30    jg          00772A4F
 00772A32    imul        eax,edx,35
 00772A35    mov         edx,dword ptr [eax*8+8238A0];gvar_008238A0
 00772A3C    mov         dword ptr [esp],edx
 00772A3F    mov         edx,dword ptr [eax*8+8238A4];gvar_008238A4
 00772A46    mov         dword ptr [esp+4],edx
>00772A4A    jmp         00772B58
 00772A4F    xor         eax,eax
 00772A51    mov         dword ptr [esp],eax
 00772A54    mov         dword ptr [esp+4],eax
>00772A58    jmp         00772B58
 00772A5D    mov         edx,dword ptr [eax+18];TKinectPlayerValue..................................................
 00772A60    cmp         edx,6
>00772A63    jg          00772A87
 00772A65    imul        eax,edx,35
 00772A68    cmp         dword ptr [eax*8+8238A8],1
 00772A70    sete        al
 00772A73    movsx       eax,al
 00772A76    mov         dword ptr [esp+28],eax
 00772A7A    fild        dword ptr [esp+28]
 00772A7E    fstp        qword ptr [esp]
 00772A81    wait
>00772A82    jmp         00772B58
 00772A87    xor         eax,eax
 00772A89    mov         dword ptr [esp],eax
 00772A8C    mov         dword ptr [esp+4],eax
>00772A90    jmp         00772B58
 00772A95    mov         edx,dword ptr [eax+18];TKinectPlayerValue..................................................
 00772A98    cmp         edx,6
>00772A9B    jg          00772ABF
 00772A9D    imul        eax,edx,35
 00772AA0    cmp         dword ptr [eax*8+8238A8],2
 00772AA8    sete        al
 00772AAB    movsx       eax,al
 00772AAE    mov         dword ptr [esp+28],eax
 00772AB2    fild        dword ptr [esp+28]
 00772AB6    fstp        qword ptr [esp]
 00772AB9    wait
>00772ABA    jmp         00772B58
 00772ABF    xor         eax,eax
 00772AC1    mov         dword ptr [esp],eax
 00772AC4    mov         dword ptr [esp+4],eax
>00772AC8    jmp         00772B58
 00772ACD    mov         ebx,edx
 00772ACF    sub         ebx,96
 00772AD5    mov         edi,ebx
 00772AD7    and         edi,80000003
>00772ADD    jns         00772AE4
 00772ADF    dec         edi
 00772AE0    or          edi,0FFFFFFFC
 00772AE3    inc         edi
 00772AE4    mov         ecx,4
 00772AE9    mov         eax,ebx
 00772AEB    cdq
 00772AEC    idiv        eax,ecx
 00772AEE    mov         ebx,eax
 00772AF0    mov         ebx,dword ptr [ebx*4+78CA6C]
 00772AF7    cmp         edi,5
>00772AFA    jge         00772B44
 00772AFC    cmp         byte ptr [esi+5C],0
>00772B00    je          00772B44
 00772B02    dec         edi
>00772B03    je          00772B0D
 00772B05    dec         edi
>00772B06    je          00772B1B
 00772B08    dec         edi
>00772B09    je          00772B29
>00772B0B    jmp         00772B39
 00772B0D    mov         eax,ebx
 00772B0F    add         eax,eax
 00772B11    fld         dword ptr [esi+eax*8+64]
 00772B15    fstp        qword ptr [esp]
 00772B18    wait
>00772B19    jmp         00772B58
 00772B1B    mov         eax,ebx
 00772B1D    add         eax,eax
 00772B1F    fld         dword ptr [esi+eax*8+68]
 00772B23    fstp        qword ptr [esp]
 00772B26    wait
>00772B27    jmp         00772B58
 00772B29    mov         eax,ebx
 00772B2B    add         eax,eax
 00772B2D    fld         dword ptr [esi+eax*8+6C]
 00772B31    fchs
 00772B33    fstp        qword ptr [esp]
 00772B36    wait
>00772B37    jmp         00772B58
 00772B39    xor         eax,eax
 00772B3B    mov         dword ptr [esp],eax
 00772B3E    mov         dword ptr [esp+4],eax
>00772B42    jmp         00772B58
 00772B44    xor         eax,eax
 00772B46    mov         dword ptr [esp],eax
 00772B49    mov         dword ptr [esp+4],eax
>00772B4D    jmp         00772B58
 00772B4F    xor         eax,eax
 00772B51    mov         dword ptr [esp],eax
 00772B54    mov         dword ptr [esp+4],eax
 00772B58    fld         qword ptr [esp]
 00772B5B    add         esp,34
 00772B5E    pop         edi
 00772B5F    pop         esi
 00772B60    pop         ebx
 00772B61    ret
*}
end;

//00772B90
procedure TKinectPlayerValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 00772B90    push        ebp
 00772B91    mov         ebp,esp
 00772B93    add         esp,0FFFFFFC8
 00772B96    push        ebx
 00772B97    push        esi
 00772B98    push        edi
 00772B99    mov         dword ptr [ebp-8],ecx
 00772B9C    mov         dword ptr [ebp-4],edx
 00772B9F    mov         ebx,eax
 00772BA1    mov         eax,[0078D8AC];^gvar_00822D79
 00772BA6    cmp         byte ptr [eax],0
>00772BA9    je          00772E5E
 00772BAF    cmp         dword ptr [ebx+18],0;TKinectPlayerValue....................................................
>00772BB3    jl          00772E5E
 00772BB9    mov         eax,dword ptr [ebx+18];TKinectPlayerValue..................................................
 00772BBC    cmp         eax,6
>00772BBF    jg          00772E5E
 00772BC5    cmp         eax,7
>00772BC8    jg          00772BD3
 00772BCA    mov         edx,dword ptr [eax*4+78CA4C]
 00772BD1    test        edx,edx
 00772BD3    imul        eax,eax,35
 00772BD6    lea         esi,[eax*8+823858];gvar_00823858:Pointer
 00772BDD    mov         eax,dword ptr [ebx+20];TKinectPlayerValue......................................Item:Inte...
 00772BE0    mov         edx,eax
 00772BE2    sub         edx,7
>00772BE5    je          00772C04
 00772BE7    sub         edx,71
>00772BEA    je          00772C26
 00772BEC    dec         edx
>00772BED    je          00772D1A
 00772BF3    add         edx,0FFFFFFE3
 00772BF6    sub         edx,50
>00772BF9    jb          00772DB4
>00772BFF    jmp         00772E4D
 00772C04    fld         dword ptr [esi+64]
 00772C07    mov         eax,dword ptr [ebp-4]
 00772C0A    fstp        qword ptr [eax]
 00772C0C    wait
 00772C0D    fld         dword ptr [esi+68]
 00772C10    mov         eax,dword ptr [ebp-8]
 00772C13    fstp        qword ptr [eax]
 00772C15    wait
 00772C16    fld         dword ptr [esi+6C]
 00772C19    fchs
 00772C1B    mov         eax,dword ptr [ebp+8]
 00772C1E    fstp        qword ptr [eax]
 00772C20    wait
>00772C21    jmp         00772E5E
 00772C26    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772C2C    fcomp       dword ptr ds:[772E68];0:Single
 00772C32    wait
 00772C33    fnstsw      al
 00772C35    sahf
>00772C36    jne         00772CAC
 00772C38    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772C3E    fcomp       dword ptr ds:[772E68];0:Single
 00772C44    wait
 00772C45    fnstsw      al
 00772C47    sahf
>00772C48    jne         00772CAC
 00772C4A    fld         dword ptr ds:[823850];gvar_00823850:Single
 00772C50    fcomp       dword ptr ds:[772E68];0:Single
 00772C56    wait
 00772C57    fnstsw      al
 00772C59    sahf
>00772C5A    jne         00772CAC
 00772C5C    fld         dword ptr ds:[823854];gvar_00823854:Single
 00772C62    fcomp       dword ptr ds:[772E68];0:Single
 00772C68    wait
 00772C69    fnstsw      al
 00772C6B    sahf
>00772C6C    jne         00772CAC
 00772C6E    fld         dword ptr [esi+64]
 00772C71    mov         eax,dword ptr [ebp-4]
 00772C74    fstp        qword ptr [eax]
 00772C76    wait
 00772C77    fld         dword ptr [esi+6C]
 00772C7A    fchs
 00772C7C    mov         eax,dword ptr [ebp+8]
 00772C7F    fstp        qword ptr [eax]
 00772C81    wait
 00772C82    fld         dword ptr [esi+158]
 00772C88    add         esp,0FFFFFFF8
 00772C8B    fstp        qword ptr [esp]
 00772C8E    wait
 00772C8F    fld         dword ptr [esi+198]
 00772C95    add         esp,0FFFFFFF8
 00772C98    fstp        qword ptr [esp]
 00772C9B    wait
 00772C9C    call        00770E20
 00772CA1    mov         eax,dword ptr [ebp-8]
 00772CA4    fstp        qword ptr [eax]
 00772CA6    wait
>00772CA7    jmp         00772E5E
 00772CAC    add         esi,64
 00772CAF    lea         edi,[ebp-38]
 00772CB2    movs        dword ptr [edi],dword ptr [esi]
 00772CB3    movs        dword ptr [edi],dword ptr [esi]
 00772CB4    movs        dword ptr [edi],dword ptr [esi]
 00772CB5    movs        dword ptr [edi],dword ptr [esi]
 00772CB6    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772CBC    fmul        dword ptr [ebp-38]
 00772CBF    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772CC5    fmul        dword ptr [ebp-34]
 00772CC8    faddp       st(1),st
 00772CCA    fld         dword ptr ds:[823850];gvar_00823850:Single
 00772CD0    fmul        dword ptr [ebp-30]
 00772CD3    faddp       st(1),st
 00772CD5    fadd        dword ptr ds:[823854];gvar_00823854:Single
 00772CDB    fstp        qword ptr [ebp-18]
 00772CDE    wait
 00772CDF    fld         qword ptr [ebp-18]
 00772CE2    fmul        dword ptr ds:[823848];gvar_00823848:Single
 00772CE8    fsubr       dword ptr [ebp-38]
 00772CEB    mov         eax,dword ptr [ebp-4]
 00772CEE    fstp        qword ptr [eax]
 00772CF0    wait
 00772CF1    fld         qword ptr [ebp-18]
 00772CF4    fmul        dword ptr ds:[82384C];gvar_0082384C:Single
 00772CFA    fsubr       dword ptr [ebp-34]
 00772CFD    mov         eax,dword ptr [ebp-8]
 00772D00    fstp        qword ptr [eax]
 00772D02    wait
 00772D03    fld         qword ptr [ebp-18]
 00772D06    fmul        dword ptr ds:[823850];gvar_00823850:Single
 00772D0C    fsub        dword ptr [ebp-30]
 00772D0F    mov         eax,dword ptr [ebp+8]
 00772D12    fstp        qword ptr [eax]
 00772D14    wait
>00772D15    jmp         00772E5E
 00772D1A    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772D20    fcomp       dword ptr ds:[772E68];0:Single
 00772D26    wait
 00772D27    fnstsw      al
 00772D29    sahf
>00772D2A    jne         00772D89
 00772D2C    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772D32    fcomp       dword ptr ds:[772E68];0:Single
 00772D38    wait
 00772D39    fnstsw      al
 00772D3B    sahf
>00772D3C    jne         00772D89
 00772D3E    fld         dword ptr ds:[823850];gvar_00823850:Single
 00772D44    fcomp       dword ptr ds:[772E68];0:Single
 00772D4A    wait
 00772D4B    fnstsw      al
 00772D4D    sahf
>00772D4E    jne         00772D89
 00772D50    fld         dword ptr ds:[823854];gvar_00823854:Single
 00772D56    fcomp       dword ptr ds:[772E68];0:Single
 00772D5C    wait
 00772D5D    fnstsw      al
 00772D5F    sahf
>00772D60    jne         00772D89
 00772D62    mov         eax,dword ptr [ebp-4]
 00772D65    xor         edx,edx
 00772D67    mov         dword ptr [eax],edx
 00772D69    mov         dword ptr [eax+4],edx
 00772D6C    mov         eax,dword ptr [ebp-8]
 00772D6F    xor         edx,edx
 00772D71    mov         dword ptr [eax],edx
 00772D73    mov         dword ptr [eax+4],3FF00000
 00772D7A    mov         eax,dword ptr [ebp+8]
 00772D7D    xor         edx,edx
 00772D7F    mov         dword ptr [eax],edx
 00772D81    mov         dword ptr [eax+4],edx
>00772D84    jmp         00772E5E
 00772D89    fld         dword ptr ds:[823848];gvar_00823848:Single
 00772D8F    mov         eax,dword ptr [ebp-4]
 00772D92    fstp        qword ptr [eax]
 00772D94    wait
 00772D95    fld         dword ptr ds:[82384C];gvar_0082384C:Single
 00772D9B    mov         eax,dword ptr [ebp-8]
 00772D9E    fstp        qword ptr [eax]
 00772DA0    wait
 00772DA1    fld         dword ptr ds:[823850];gvar_00823850:Single
 00772DA7    fchs
 00772DA9    mov         eax,dword ptr [ebp+8]
 00772DAC    fstp        qword ptr [eax]
 00772DAE    wait
>00772DAF    jmp         00772E5E
 00772DB4    mov         edi,eax
 00772DB6    sub         edi,96
 00772DBC    mov         eax,edi
 00772DBE    and         eax,80000003
>00772DC3    jns         00772DCA
 00772DC5    dec         eax
 00772DC6    or          eax,0FFFFFFFC
 00772DC9    inc         eax
 00772DCA    mov         dword ptr [ebp-0C],eax
 00772DCD    mov         ecx,4
 00772DD2    mov         eax,edi
 00772DD4    cdq
 00772DD5    idiv        eax,ecx
 00772DD7    mov         edi,eax
 00772DD9    mov         eax,dword ptr [edi*4+78CA6C]
 00772DE0    mov         edx,dword ptr [ebp-0C]
 00772DE3    sub         edx,1
>00772DE6    jae         00772E3A
 00772DE8    cmp         byte ptr [esi+5C],0
>00772DEC    je          00772E1A
 00772DEE    add         eax,eax
 00772DF0    lea         esi,[esi+eax*8+64]
 00772DF4    lea         edi,[ebp-28]
 00772DF7    movs        dword ptr [edi],dword ptr [esi]
 00772DF8    movs        dword ptr [edi],dword ptr [esi]
 00772DF9    movs        dword ptr [edi],dword ptr [esi]
 00772DFA    movs        dword ptr [edi],dword ptr [esi]
 00772DFB    fld         dword ptr [ebp-28]
 00772DFE    mov         eax,dword ptr [ebp-4]
 00772E01    fstp        qword ptr [eax]
 00772E03    wait
 00772E04    fld         dword ptr [ebp-24]
 00772E07    mov         eax,dword ptr [ebp-8]
 00772E0A    fstp        qword ptr [eax]
 00772E0C    wait
 00772E0D    fld         dword ptr [ebp-20]
 00772E10    fchs
 00772E12    mov         eax,dword ptr [ebp+8]
 00772E15    fstp        qword ptr [eax]
 00772E17    wait
>00772E18    jmp         00772E5E
 00772E1A    mov         eax,dword ptr [ebp-4]
 00772E1D    xor         edx,edx
 00772E1F    mov         dword ptr [eax],edx
 00772E21    mov         dword ptr [eax+4],edx
 00772E24    mov         eax,dword ptr [ebp-8]
 00772E27    xor         edx,edx
 00772E29    mov         dword ptr [eax],edx
 00772E2B    mov         dword ptr [eax+4],edx
 00772E2E    mov         eax,dword ptr [ebp+8]
 00772E31    xor         edx,edx
 00772E33    mov         dword ptr [eax],edx
 00772E35    mov         dword ptr [eax+4],edx
>00772E38    jmp         00772E5E
 00772E3A    mov         eax,dword ptr [ebp+8]
 00772E3D    push        eax
 00772E3E    mov         ecx,dword ptr [ebp-8]
 00772E41    mov         edx,dword ptr [ebp-4]
 00772E44    mov         eax,ebx
 00772E46    call        TExpression.GetVector
>00772E4B    jmp         00772E5E
 00772E4D    mov         eax,dword ptr [ebp+8]
 00772E50    push        eax
 00772E51    mov         ecx,dword ptr [ebp-8]
 00772E54    mov         edx,dword ptr [ebp-4]
 00772E57    mov         eax,ebx
 00772E59    call        TExpression.GetVector
 00772E5E    pop         edi
 00772E5F    pop         esi
 00772E60    pop         ebx
 00772E61    mov         esp,ebp
 00772E63    pop         ebp
 00772E64    ret         4
*}
end;

//00772E6C
function TKinectPlayerValue.Module:TObject;
begin
{*
 00772E6C    mov         eax,[00822DD4];gvar_00822DD4:TModuleKinectPlayer
 00772E71    ret
*}
end;

//00772E74
procedure TKinectPlayerValue.SetValue(NewValue:Double);
begin
{*
 00772E74    push        ebp
 00772E75    mov         ebp,esp
 00772E77    mov         al,1
 00772E79    pop         ebp
 00772E7A    ret         8
*}
end;

//00772E80
{*procedure TKinectPlayerValue.ToString(?:?);
begin
 00772E80    push        ebp
 00772E81    mov         ebp,esp
 00772E83    push        0
 00772E85    push        0
 00772E87    push        0
 00772E89    push        ebx
 00772E8A    push        esi
 00772E8B    push        edi
 00772E8C    mov         esi,edx
 00772E8E    mov         ebx,eax
 00772E90    xor         eax,eax
 00772E92    push        ebp
 00772E93    push        772F1D
 00772E98    push        dword ptr fs:[eax]
 00772E9B    mov         dword ptr fs:[eax],esp
 00772E9E    mov         edi,dword ptr [ebx+18];TKinectPlayerValue..................................................
 00772EA1    test        edi,edi
>00772EA3    jle         00772EE0
 00772EA5    push        772F38;'KinectPlayer'
 00772EAA    lea         edx,[ebp-4]
 00772EAD    mov         eax,edi
 00772EAF    call        IntToStr
 00772EB4    push        dword ptr [ebp-4]
 00772EB7    push        772F60;'.'
 00772EBC    lea         ecx,[ebp-8]
 00772EBF    mov         eax,[00822DD4];gvar_00822DD4:TModuleKinectPlayer
 00772EC4    mov         eax,dword ptr [eax+1C]
 00772EC7    mov         edx,dword ptr [ebx+20];TKinectPlayerValue.......................................Item:Int...
 00772ECA    call        THashTable.Get
 00772ECF    push        dword ptr [ebp-8]
 00772ED2    mov         eax,esi
 00772ED4    mov         edx,4
 00772ED9    call        @UStrCatN
>00772EDE    jmp         00772F02
 00772EE0    lea         ecx,[ebp-0C]
 00772EE3    mov         eax,[00822DD4];gvar_00822DD4:TModuleKinectPlayer
 00772EE8    mov         eax,dword ptr [eax+1C]
 00772EEB    mov         edx,dword ptr [ebx+20];TKinectPlayerValue........................................Item:In...
 00772EEE    call        THashTable.Get
 00772EF3    mov         ecx,dword ptr [ebp-0C]
 00772EF6    mov         eax,esi
 00772EF8    mov         edx,772F70;'KinectPlayer.'
 00772EFD    call        @UStrCat3
 00772F02    xor         eax,eax
 00772F04    pop         edx
 00772F05    pop         ecx
 00772F06    pop         ecx
 00772F07    mov         dword ptr fs:[eax],edx
 00772F0A    push        772F24
 00772F0F    lea         eax,[ebp-0C]
 00772F12    mov         edx,3
 00772F17    call        @UStrArrayClr
 00772F1C    ret
>00772F1D    jmp         @HandleFinally
>00772F22    jmp         00772F0F
 00772F24    pop         edi
 00772F25    pop         esi
 00772F26    pop         ebx
 00772F27    mov         esp,ebp
 00772F29    pop         ebp
 00772F2A    ret
end;*}

//00772F8C
procedure sub_00772F8C;
begin
{*
 00772F8C    mov         byte ptr ds:[822DC0],0;gvar_00822DC0
 00772F93    mov         byte ptr ds:[822DC8],0;gvar_00822DC8
 00772F9A    mov         byte ptr ds:[822DC9],0;gvar_00822DC9
 00772FA1    mov         byte ptr ds:[822DCA],0;gvar_00822DCA
 00772FA8    mov         byte ptr ds:[822DCB],0;gvar_00822DCB
 00772FAF    ret
*}
end;

//00772FB0
procedure sub_00772FB0;
begin
{*
 00772FB0    mov         eax,[0078D930];^gvar_00822D90
 00772FB5    cmp         byte ptr [eax],0
>00772FB8    je          00772FBF
 00772FBA    call        0077138C
 00772FBF    ret
*}
end;

//00772FC0
{*function sub_00772FC0(?:UnicodeString):?;
begin
 00772FC0    push        ebp
 00772FC1    mov         ebp,esp
 00772FC3    push        ecx
 00772FC4    push        ebx
 00772FC5    mov         dword ptr [ebp-4],eax
 00772FC8    mov         eax,dword ptr [ebp-4]
 00772FCB    call        @UStrAddRef
 00772FD0    xor         eax,eax
 00772FD2    push        ebp
 00772FD3    push        773006
 00772FD8    push        dword ptr fs:[eax]
 00772FDB    mov         dword ptr fs:[eax],esp
 00772FDE    mov         eax,[00822DD4];gvar_00822DD4:TModuleKinectPlayer
 00772FE3    mov         eax,dword ptr [eax+1C]
 00772FE6    mov         edx,dword ptr [ebp-4]
 00772FE9    call        THashTable.Get
 00772FEE    mov         ebx,eax
 00772FF0    xor         eax,eax
 00772FF2    pop         edx
 00772FF3    pop         ecx
 00772FF4    pop         ecx
 00772FF5    mov         dword ptr fs:[eax],edx
 00772FF8    push        77300D
 00772FFD    lea         eax,[ebp-4]
 00773000    call        @UStrClr
 00773005    ret
>00773006    jmp         @HandleFinally
>0077300B    jmp         00772FFD
 0077300D    mov         eax,ebx
 0077300F    pop         ebx
 00773010    pop         ecx
 00773011    pop         ebp
 00773012    ret
end;*}

//007732D8
procedure TModuleKinectPlayer.AddFields;
begin
{*
 007732D8    push        ebp
 007732D9    mov         ebp,esp
 007732DB    add         esp,0FFFFFFF4
 007732DE    push        ebx
 007732DF    push        esi
 007732E0    push        edi
 007732E1    xor         edx,edx
 007732E3    mov         dword ptr [ebp-0C],edx
 007732E6    mov         ebx,eax
 007732E8    xor         eax,eax
 007732EA    push        ebp
 007732EB    push        7738D0
 007732F0    push        dword ptr fs:[eax]
 007732F3    mov         dword ptr fs:[eax],esp
 007732F6    xor         ecx,ecx
 007732F8    mov         edx,7738EC;'exists'
 007732FD    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773300    call        THashTable.Add
 00773305    mov         ecx,33
 0077330A    mov         edx,773908;'ClippedTop'
 0077330F    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773312    call        THashTable.Add
 00773317    mov         ecx,34
 0077331C    mov         edx,77392C;'ClippedBottom'
 00773321    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773324    call        THashTable.Add
 00773329    mov         ecx,35
 0077332E    mov         edx,773954;'ClippedLeft'
 00773333    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773336    call        THashTable.Add
 0077333B    mov         ecx,36
 00773340    mov         edx,773978;'ClippedRight'
 00773345    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773348    call        THashTable.Add
 0077334D    mov         ecx,32
 00773352    mov         edx,7739A0;'flags'
 00773357    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077335A    call        THashTable.Add
 0077335F    mov         ecx,1
 00773364    mov         edx,7739B8;'UserID'
 00773369    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077336C    call        THashTable.Add
 00773371    mov         ecx,37
 00773376    mov         edx,7739D4;'TrackingID'
 0077337B    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077337E    call        THashTable.Add
 00773383    mov         ecx,2
 00773388    mov         edx,7739F8;'count'
 0077338D    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773390    call        THashTable.Add
 00773395    mov         ecx,6
 0077339A    mov         edx,773A10;'tracking'
 0077339F    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007733A2    call        THashTable.Add
 007733A7    mov         ecx,4
 007733AC    mov         edx,773A30;'calibrating'
 007733B1    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007733B4    call        THashTable.Add
 007733B9    mov         ecx,6
 007733BE    mov         edx,773A54;'calibrated'
 007733C3    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007733C6    call        THashTable.Add
 007733CB    mov         ecx,7
 007733D0    mov         edx,773A78;'COM'
 007733D5    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007733D8    call        THashTable.Add
 007733DD    mov         ecx,8
 007733E2    mov         edx,773A8C;'x'
 007733E7    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007733EA    call        THashTable.Add
 007733EF    mov         ecx,9
 007733F4    mov         edx,773A9C;'y'
 007733F9    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007733FC    call        THashTable.Add
 00773401    mov         ecx,0A
 00773406    mov         edx,773AAC;'z'
 0077340B    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077340E    call        THashTable.Add
 00773413    mov         ecx,0B
 00773418    mov         edx,773ABC;'leanX'
 0077341D    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773420    call        THashTable.Add
 00773425    mov         ecx,0C
 0077342A    mov         edx,773AD4;'leanY'
 0077342F    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773432    call        THashTable.Add
 00773437    mov         ecx,13
 0077343C    mov         edx,773AEC;'lean_left'
 00773441    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773444    call        THashTable.Add
 00773449    mov         ecx,14
 0077344E    mov         edx,773B0C;'lean_right'
 00773453    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773456    call        THashTable.Add
 0077345B    mov         ecx,15
 00773460    mov         edx,773B30;'lean_forwards'
 00773465    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773468    call        THashTable.Add
 0077346D    mov         ecx,15
 00773472    mov         edx,773B58;'lean_forward'
 00773477    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077347A    call        THashTable.Add
 0077347F    mov         ecx,16
 00773484    mov         edx,773B80;'lean_backwards'
 00773489    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077348C    call        THashTable.Add
 00773491    mov         ecx,16
 00773496    mov         edx,773BAC;'lean_backward'
 0077349B    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077349E    call        THashTable.Add
 007734A3    mov         ecx,16
 007734A8    mov         edx,773BD4;'lean_back'
 007734AD    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007734B0    call        THashTable.Add
 007734B5    mov         ecx,17
 007734BA    mov         edx,773BF4;'left_arm_forwards'
 007734BF    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007734C2    call        THashTable.Add
 007734C7    mov         ecx,17
 007734CC    mov         edx,773C24;'left_arm_forward'
 007734D1    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007734D4    call        THashTable.Add
 007734D9    mov         ecx,1B
 007734DE    mov         edx,773C54;'left_arm_across'
 007734E3    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007734E6    call        THashTable.Add
 007734EB    mov         ecx,1A
 007734F0    mov         edx,773C80;'left_arm_out'
 007734F5    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007734F8    call        THashTable.Add
 007734FD    mov         ecx,18
 00773502    mov         edx,773CA8;'left_arm_down'
 00773507    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077350A    call        THashTable.Add
 0077350F    mov         ecx,19
 00773514    mov         edx,773CD0;'left_arm_up'
 00773519    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077351C    call        THashTable.Add
 00773521    mov         ecx,0D
 00773526    mov         edx,773CF4;'left_arm_x'
 0077352B    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077352E    call        THashTable.Add
 00773533    mov         ecx,0E
 00773538    mov         edx,773D18;'left_arm_y'
 0077353D    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773540    call        THashTable.Add
 00773545    mov         ecx,1C
 0077354A    mov         edx,773D3C;'right_arm_forwards'
 0077354F    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773552    call        THashTable.Add
 00773557    mov         ecx,1C
 0077355C    mov         edx,773D70;'right_arm_forward'
 00773561    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773564    call        THashTable.Add
 00773569    mov         ecx,20
 0077356E    mov         edx,773DA0;'right_arm_across'
 00773573    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773576    call        THashTable.Add
 0077357B    mov         ecx,1F
 00773580    mov         edx,773DD0;'right_arm_out'
 00773585    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773588    call        THashTable.Add
 0077358D    mov         ecx,1D
 00773592    mov         edx,773DF8;'right_arm_down'
 00773597    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077359A    call        THashTable.Add
 0077359F    mov         ecx,1E
 007735A4    mov         edx,773E24;'right_arm_up'
 007735A9    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007735AC    call        THashTable.Add
 007735B1    mov         ecx,0F
 007735B6    mov         edx,773E4C;'right_arm_x'
 007735BB    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007735BE    call        THashTable.Add
 007735C3    mov         ecx,10
 007735C8    mov         edx,773E70;'right_arm_y'
 007735CD    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007735D0    call        THashTable.Add
 007735D5    mov         ecx,21
 007735DA    mov         edx,773E94;'left_foot_forwards'
 007735DF    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007735E2    call        THashTable.Add
 007735E7    mov         ecx,21
 007735EC    mov         edx,773EC8;'left_foot_forward'
 007735F1    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007735F4    call        THashTable.Add
 007735F9    mov         ecx,23
 007735FE    mov         edx,773EF8;'left_foot_backwards'
 00773603    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773606    call        THashTable.Add
 0077360B    mov         ecx,23
 00773610    mov         edx,773F2C;'left_foot_backward'
 00773615    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773618    call        THashTable.Add
 0077361D    mov         ecx,23
 00773622    mov         edx,773F60;'left_foot_back'
 00773627    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077362A    call        THashTable.Add
 0077362F    mov         ecx,22
 00773634    mov         edx,773F8C;'left_foot_sideways'
 00773639    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077363C    call        THashTable.Add
 00773641    mov         ecx,24
 00773646    mov         edx,773FC0;'left_foot_up'
 0077364B    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077364E    call        THashTable.Add
 00773653    mov         ecx,11
 00773658    mov         edx,773FE8;'left_foot_z'
 0077365D    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773660    call        THashTable.Add
 00773665    mov         ecx,25
 0077366A    mov         edx,77400C;'right_foot_forwards'
 0077366F    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773672    call        THashTable.Add
 00773677    mov         ecx,25
 0077367C    mov         edx,774040;'right_foot_forward'
 00773681    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773684    call        THashTable.Add
 00773689    mov         ecx,27
 0077368E    mov         edx,774074;'right_foot_backwards'
 00773693    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773696    call        THashTable.Add
 0077369B    mov         ecx,27
 007736A0    mov         edx,7740AC;'right_foot_backward'
 007736A5    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007736A8    call        THashTable.Add
 007736AD    mov         ecx,27
 007736B2    mov         edx,7740E0;'right_foot_back'
 007736B7    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007736BA    call        THashTable.Add
 007736BF    mov         ecx,26
 007736C4    mov         edx,77410C;'right_foot_sideways'
 007736C9    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007736CC    call        THashTable.Add
 007736D1    mov         ecx,28
 007736D6    mov         edx,774140;'right_foot_up'
 007736DB    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007736DE    call        THashTable.Add
 007736E3    mov         ecx,12
 007736E8    mov         edx,774168;'right_foot_z'
 007736ED    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007736F0    call        THashTable.Add
 007736F5    mov         ecx,64
 007736FA    mov         edx,774190;'SteeringAngle'
 007736FF    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773702    call        THashTable.Add
 00773707    mov         ecx,65
 0077370C    mov         edx,7741B8;'ShoulderYaw'
 00773711    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773714    call        THashTable.Add
 00773719    mov         ecx,66
 0077371E    mov         edx,7741DC;'HipYaw'
 00773723    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773726    call        THashTable.Add
 0077372B    mov         ecx,67
 00773730    mov         edx,7741F8;'FeetYaw'
 00773735    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773738    call        THashTable.Add
 0077373D    mov         ecx,7B
 00773742    mov         edx,774214;'floor.y'
 00773747    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077374A    call        THashTable.Add
 0077374F    mov         ecx,7C
 00773754    mov         edx,774230;'floor.confidence'
 00773759    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077375C    call        THashTable.Add
 00773761    mov         ecx,78
 00773766    mov         edx,774260;'floor.pos'
 0077376B    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077376E    call        THashTable.Add
 00773773    mov         ecx,78
 00773778    mov         edx,774280;'floor.point'
 0077377D    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773780    call        THashTable.Add
 00773785    mov         ecx,79
 0077378A    mov         edx,7742A4;'floor.normal'
 0077378F    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773792    call        THashTable.Add
 00773797    mov         ecx,7A
 0077379C    mov         edx,7742CC;'floor.RotMat'
 007737A1    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007737A4    call        THashTable.Add
 007737A9    mov         ecx,68
 007737AE    mov         edx,7742F4;'leftfoot.HeightAboveFloor'
 007737B3    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007737B6    call        THashTable.Add
 007737BB    mov         ecx,69
 007737C0    mov         edx,774334;'rightfoot.HeightAboveFloor'
 007737C5    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007737C8    call        THashTable.Add
 007737CD    mov         ecx,65
 007737D2    mov         edx,774378;'head.yaw'
 007737D7    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007737DA    call        THashTable.Add
 007737DF    mov         ecx,65
 007737E4    mov         edx,774398;'neck.yaw'
 007737E9    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007737EC    call        THashTable.Add
 007737F1    mov         ecx,65
 007737F6    mov         edx,7743B8;'leftshoulder.yaw'
 007737FB    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007737FE    call        THashTable.Add
 00773803    mov         ecx,65
 00773808    mov         edx,7743E8;'rightshoulder.yaw'
 0077380D    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773810    call        THashTable.Add
 00773815    mov         ecx,65
 0077381A    mov         edx,774418;'torso.yaw'
 0077381F    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773822    call        THashTable.Add
 00773827    mov         ecx,66
 0077382C    mov         edx,774438;'hipcenter.yaw'
 00773831    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773834    call        THashTable.Add
 00773839    mov         ecx,66
 0077383E    mov         edx,774460;'lefthip.yaw'
 00773843    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773846    call        THashTable.Add
 0077384B    mov         ecx,66
 00773850    mov         edx,774484;'righthip.yaw'
 00773855    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 00773858    call        THashTable.Add
 0077385D    xor         eax,eax
 0077385F    mov         dword ptr [ebp-4],eax
 00773862    mov         edi,78CABC;^'head'
 00773867    xor         eax,eax
 00773869    mov         dword ptr [ebp-8],eax
 0077386C    mov         esi,78CB0C;^'pos'
 00773871    push        dword ptr [edi]
 00773873    push        7744AC;'.'
 00773878    push        dword ptr [esi]
 0077387A    lea         eax,[ebp-0C]
 0077387D    mov         edx,3
 00773882    call        @UStrCatN
 00773887    mov         edx,dword ptr [ebp-0C]
 0077388A    mov         ecx,dword ptr [ebp-4]
 0077388D    add         ecx,ecx
 0077388F    add         ecx,ecx
 00773891    add         ecx,96
 00773897    add         ecx,dword ptr [ebp-8]
 0077389A    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 0077389D    call        THashTable.Add
 007738A2    inc         dword ptr [ebp-8]
 007738A5    add         esi,4
 007738A8    cmp         dword ptr [ebp-8],4
>007738AC    jne         00773871
 007738AE    inc         dword ptr [ebp-4]
 007738B1    add         edi,4
 007738B4    cmp         dword ptr [ebp-4],14
>007738B8    jne         00773867
 007738BA    xor         eax,eax
 007738BC    pop         edx
 007738BD    pop         ecx
 007738BE    pop         ecx
 007738BF    mov         dword ptr fs:[eax],edx
 007738C2    push        7738D7
 007738C7    lea         eax,[ebp-0C]
 007738CA    call        @UStrClr
 007738CF    ret
>007738D0    jmp         @HandleFinally
>007738D5    jmp         007738C7
 007738D7    pop         edi
 007738D8    pop         esi
 007738D9    pop         ebx
 007738DA    mov         esp,ebp
 007738DC    pop         ebp
 007738DD    ret
*}
end;

//007744B0
procedure TModuleKinectPlayer.ClearRead;
begin
{*
 007744B0    call        TPieModule.ClearRead
 007744B5    ret
*}
end;

//007744B8
constructor TModuleKinectPlayer.Create;
begin
{*
 007744B8    push        ebx
 007744B9    push        esi
 007744BA    test        dl,dl
>007744BC    je          007744C6
 007744BE    add         esp,0FFFFFFF0
 007744C1    call        @ClassCreate
 007744C6    mov         ebx,edx
 007744C8    mov         esi,eax
 007744CA    push        77450C;'KinectPlayer'
 007744CF    push        774534;'Kinect.Player'
 007744D4    push        0
 007744D6    push        0
 007744D8    mov         ecx,77455C;'Player'
 007744DD    xor         edx,edx
 007744DF    mov         eax,esi
 007744E1    call        005E4830
 007744E6    mov         eax,esi
 007744E8    test        bl,bl
>007744EA    je          007744FB
 007744EC    call        @AfterConstruction
 007744F1    pop         dword ptr fs:[0]
 007744F8    add         esp,0C
 007744FB    mov         eax,esi
 007744FD    pop         esi
 007744FE    pop         ebx
 007744FF    ret
*}
end;

//0077456C
function TModuleKinectPlayer.CreateValue(Identifier:string):TExpression;
begin
{*
 0077456C    push        ebp
 0077456D    mov         ebp,esp
 0077456F    push        ecx
 00774570    push        ebx
 00774571    mov         dword ptr [ebp-4],edx
 00774574    mov         ebx,eax
 00774576    mov         eax,dword ptr [ebp-4]
 00774579    call        @UStrAddRef
 0077457E    xor         eax,eax
 00774580    push        ebp
 00774581    push        7745B0
 00774586    push        dword ptr fs:[eax]
 00774589    mov         dword ptr fs:[eax],esp
 0077458C    mov         byte ptr [ebx+24],1;TModuleKinectPlayer.Used:Boolean
 00774590    mov         eax,dword ptr [ebp-4]
 00774593    call        00771638
 00774598    mov         ebx,eax
 0077459A    xor         eax,eax
 0077459C    pop         edx
 0077459D    pop         ecx
 0077459E    pop         ecx
 0077459F    mov         dword ptr fs:[eax],edx
 007745A2    push        7745B7
 007745A7    lea         eax,[ebp-4]
 007745AA    call        @UStrClr
 007745AF    ret
>007745B0    jmp         @HandleFinally
>007745B5    jmp         007745A7
 007745B7    mov         eax,ebx
 007745B9    pop         ebx
 007745BA    pop         ecx
 007745BB    pop         ebp
 007745BC    ret
*}
end;

//007745C0
function TModuleKinectPlayer.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 007745C0    push        ebp
 007745C1    mov         ebp,esp
 007745C3    push        ecx
 007745C4    push        ebx
 007745C5    mov         dword ptr [ebp-4],edx
 007745C8    mov         ebx,eax
 007745CA    mov         eax,dword ptr [ebp-4]
 007745CD    call        @UStrAddRef
 007745D2    xor         eax,eax
 007745D4    push        ebp
 007745D5    push        774614
 007745DA    push        dword ptr fs:[eax]
 007745DD    mov         dword ptr fs:[eax],esp
 007745E0    mov         edx,dword ptr [ebp-4]
 007745E3    mov         eax,dword ptr [ebx+1C];TModuleKinectPlayer.Fields:THashTable
 007745E6    call        THashTable.Get
 007745EB    sub         eax,1
>007745EE    jb          007745F8
 007745F0    add         eax,0FFFFFFFE
 007745F3    sub         eax,4
>007745F6    jae         007745FC
 007745F8    xor         ebx,ebx
>007745FA    jmp         007745FE
 007745FC    mov         bl,9
 007745FE    xor         eax,eax
 00774600    pop         edx
 00774601    pop         ecx
 00774602    pop         ecx
 00774603    mov         dword ptr fs:[eax],edx
 00774606    push        77461B
 0077460B    lea         eax,[ebp-4]
 0077460E    call        @UStrClr
 00774613    ret
>00774614    jmp         @HandleFinally
>00774619    jmp         0077460B
 0077461B    mov         eax,ebx
 0077461D    pop         ebx
 0077461E    pop         ecx
 0077461F    pop         ebp
 00774620    ret
*}
end;

//00774624
function TModuleKinectPlayer.GetGoodFields:TStringList;
begin
{*
 00774624    push        ebx
 00774625    mov         dl,1
 00774627    mov         eax,[0043C7BC];TStringList
 0077462C    call        TStringList.Create;TStringList.Create
 00774631    mov         ebx,eax
 00774633    mov         edx,7746C8;'exists'
 00774638    mov         eax,ebx
 0077463A    mov         ecx,dword ptr [eax]
 0077463C    call        dword ptr [ecx+38];TStringList.Add
 0077463F    mov         edx,7746E4;'test'
 00774644    mov         eax,ebx
 00774646    mov         ecx,dword ptr [eax]
 00774648    call        dword ptr [ecx+38];TStringList.Add
 0077464B    mov         edx,7746FC;'UserID'
 00774650    mov         eax,ebx
 00774652    mov         ecx,dword ptr [eax]
 00774654    call        dword ptr [ecx+38];TStringList.Add
 00774657    mov         edx,774718;'PsiPose'
 0077465C    mov         eax,ebx
 0077465E    mov         ecx,dword ptr [eax]
 00774660    call        dword ptr [ecx+38];TStringList.Add
 00774663    mov         edx,774734;'calibrating'
 00774668    mov         eax,ebx
 0077466A    mov         ecx,dword ptr [eax]
 0077466C    call        dword ptr [ecx+38];TStringList.Add
 0077466F    mov         edx,774758;'calibrated'
 00774674    mov         eax,ebx
 00774676    mov         ecx,dword ptr [eax]
 00774678    call        dword ptr [ecx+38];TStringList.Add
 0077467B    mov         edx,77477C;'tracking'
 00774680    mov         eax,ebx
 00774682    mov         ecx,dword ptr [eax]
 00774684    call        dword ptr [ecx+38];TStringList.Add
 00774687    mov         edx,77479C;'COM'
 0077468C    mov         eax,ebx
 0077468E    mov         ecx,dword ptr [eax]
 00774690    call        dword ptr [ecx+38];TStringList.Add
 00774693    mov         edx,7747B0;'x'
 00774698    mov         eax,ebx
 0077469A    mov         ecx,dword ptr [eax]
 0077469C    call        dword ptr [ecx+38];TStringList.Add
 0077469F    mov         edx,7747C0;'y'
 007746A4    mov         eax,ebx
 007746A6    mov         ecx,dword ptr [eax]
 007746A8    call        dword ptr [ecx+38];TStringList.Add
 007746AB    mov         edx,7747D0;'z'
 007746B0    mov         eax,ebx
 007746B2    mov         ecx,dword ptr [eax]
 007746B4    call        dword ptr [ecx+38];TStringList.Add
 007746B7    mov         eax,ebx
 007746B9    pop         ebx
 007746BA    ret
*}
end;

//007747D4
procedure TModuleKinectPlayer.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 007747D4    push        ebp
 007747D5    mov         ebp,esp
 007747D7    mov         byte ptr [edx],1
 007747DA    mov         dword ptr [ecx],1
 007747E0    mov         eax,dword ptr [ebp+8]
 007747E3    mov         dword ptr [eax],6
 007747E9    pop         ebp
 007747EA    ret         4
*}
end;

//007747F0
procedure TModuleKinectPlayer.MonitorFrame;
begin
{*
 007747F0    push        ebx
 007747F1    mov         ebx,eax
 007747F3    cmp         byte ptr [ebx+28],0;TModuleKinectPlayer.Monitoring:Boolean
>007747F7    je          0077480B
 007747F9    mov         eax,ebx
 007747FB    mov         edx,dword ptr [eax]
 007747FD    call        dword ptr [edx+3C];TModuleKinectPlayer.Read
 00774800    test        al,al
>00774802    je          0077480B
 00774804    mov         eax,ebx
 00774806    call        005E509C
 0077480B    pop         ebx
 0077480C    ret
*}
end;

//00774810
procedure TModuleKinectPlayer.PrepareForGUI;
begin
{*
 00774810    ret
*}
end;

//00774814
procedure TModuleKinectPlayer.PrepareForMonitoring;
begin
{*
 00774814    ret
*}
end;

//00774818
function TModuleKinectPlayer.Read:Boolean;
begin
{*
 00774818    push        ebp
 00774819    mov         ebp,esp
 0077481B    xor         ecx,ecx
 0077481D    push        ecx
 0077481E    push        ecx
 0077481F    push        ecx
 00774820    push        ecx
 00774821    push        ecx
 00774822    push        ecx
 00774823    push        ebx
 00774824    push        esi
 00774825    push        edi
 00774826    xor         eax,eax
 00774828    push        ebp
 00774829    push        774A3D
 0077482E    push        dword ptr fs:[eax]
 00774831    mov         dword ptr fs:[eax],esp
 00774834    mov         byte ptr [ebp-1],1
 00774838    cmp         dword ptr ds:[822DD8],0;gvar_00822DD8
>0077483F    je          00774A22
 00774845    mov         ecx,822DE0;gvar_00822DE0:NUI_SKELETON_FRAME
 0077484A    mov         eax,[00822DD8];gvar_00822DD8
 0077484F    mov         eax,dword ptr [eax+4]
 00774852    mov         edx,0A
 00774857    call        INuiInstance.NuiSkeletonGetNextFrame
 0077485C    mov         ebx,eax
 0077485E    test        ebx,80000000
>00774864    je          007748B7
 00774866    cmp         ebx,83010001
>0077486C    je          00774A22
 00774872    lea         edx,[ebp-10]
 00774875    mov         eax,ebx
 00774877    call        0076D414
 0077487C    mov         ecx,dword ptr [ebp-10]
 0077487F    lea         eax,[ebp-0C]
 00774882    mov         edx,774A5C;'NuiSkeletonGetNextFrame '
 00774887    call        @UStrCat3
 0077488C    lea         edx,[ebp-18]
 0077488F    mov         eax,ebx
 00774891    call        0076D414
 00774896    mov         ecx,dword ptr [ebp-18]
 00774899    lea         eax,[ebp-14]
 0077489C    mov         edx,774A9C;'KinectSDK Read failed: '
 007748A1    call        @UStrCat3
 007748A6    mov         eax,dword ptr [ebp-14]
 007748A9    call        004FA5FC
 007748AE    mov         byte ptr [ebp-1],0
>007748B2    jmp         00774A22
 007748B7    mov         edx,6
 007748BC    mov         eax,822E10;gvar_00822E10
 007748C1    mov         ecx,822DCC;gvar_00822DCC
 007748C6    mov         ebx,dword ptr [eax]
 007748C8    sub         ebx,1
>007748CB    jb          007748DC
>007748CD    je          007748D7
 007748CF    dec         ebx
>007748D0    jne         007748DF
 007748D2    mov         byte ptr [ecx],2
>007748D5    jmp         007748DF
 007748D7    mov         byte ptr [ecx],1
>007748DA    jmp         007748DF
 007748DC    mov         byte ptr [ecx],0
 007748DF    inc         ecx
 007748E0    add         eax,1B4
 007748E5    dec         edx
>007748E6    jne         007748C6
 007748E8    mov         edx,1
 007748ED    mov         ecx,822E10;gvar_00822E10
 007748F2    mov         eax,ecx
 007748F4    mov         ebx,dword ptr [eax]
 007748F6    cmp         ebx,2
>007748F9    jne         0077494A
 007748FB    xor         eax,eax
 007748FD    mov         dword ptr [ebp-8],eax
 00774900    mov         esi,1
 00774905    mov         eax,78CA50;gvar_0078CA50
 0077490A    cmp         edx,dword ptr [eax]
>0077490C    jne         00774913
 0077490E    mov         dword ptr [ebp-8],esi
>00774911    jmp         0077491C
 00774913    inc         esi
 00774914    add         eax,4
 00774917    cmp         esi,7
>0077491A    jne         0077490A
 0077491C    cmp         dword ptr [ebp-8],0
>00774920    jne         0077499C
 00774922    mov         esi,1
 00774927    mov         eax,78CA50;gvar_0078CA50
 0077492C    mov         edi,dword ptr [eax]
 0077492E    test        edi,edi
>00774930    je          0077493B
 00774932    cmp         byte ptr [edi+822DCB],2;gvar_00822DCB
>00774939    jae         0077493F
 0077493B    mov         dword ptr [eax],edx
>0077493D    jmp         0077499C
 0077493F    inc         esi
 00774940    add         eax,4
 00774943    cmp         esi,7
>00774946    jne         0077492C
>00774948    jmp         0077499C
 0077494A    cmp         ebx,1
>0077494D    jne         0077499C
 0077494F    xor         eax,eax
 00774951    mov         dword ptr [ebp-8],eax
 00774954    mov         esi,1
 00774959    mov         eax,78CA50;gvar_0078CA50
 0077495E    cmp         edx,dword ptr [eax]
>00774960    jne         00774967
 00774962    mov         dword ptr [ebp-8],esi
>00774965    jmp         00774970
 00774967    inc         esi
 00774968    add         eax,4
 0077496B    cmp         esi,7
>0077496E    jne         0077495E
 00774970    cmp         dword ptr [ebp-8],0
>00774974    jne         0077499C
 00774976    mov         esi,1
 0077497B    mov         eax,78CA50;gvar_0078CA50
 00774980    mov         edi,dword ptr [eax]
 00774982    test        edi,edi
>00774984    je          0077498F
 00774986    cmp         byte ptr [edi+822DCB],1;gvar_00822DCB
>0077498D    jae         00774993
 0077498F    mov         dword ptr [eax],edx
>00774991    jmp         0077499C
 00774993    inc         esi
 00774994    add         eax,4
 00774997    cmp         esi,7
>0077499A    jne         00774980
 0077499C    inc         edx
 0077499D    add         ecx,1B4
 007749A3    cmp         edx,7
>007749A6    jne         007748F2
 007749AC    fld         dword ptr ds:[822DF0];gvar_00822DF0:Single
 007749B2    fcomp       dword ptr ds:[774ACC];0:Single
 007749B8    wait
 007749B9    fnstsw      al
 007749BB    sahf
>007749BC    jne         007749F4
 007749BE    fld         dword ptr ds:[822DF4];gvar_00822DF4:Single
 007749C4    fcomp       dword ptr ds:[774ACC];0:Single
 007749CA    wait
 007749CB    fnstsw      al
 007749CD    sahf
>007749CE    jne         007749F4
 007749D0    fld         dword ptr ds:[822DF8];gvar_00822DF8:Single
 007749D6    fcomp       dword ptr ds:[774ACC];0:Single
 007749DC    wait
 007749DD    fnstsw      al
 007749DF    sahf
>007749E0    jne         007749F4
 007749E2    fld         dword ptr ds:[822DFC];gvar_00822DFC:Single
 007749E8    fcomp       dword ptr ds:[774ACC];0:Single
 007749EE    wait
 007749EF    fnstsw      al
 007749F1    sahf
>007749F2    je          00774A10
 007749F4    fld         dword ptr ds:[822DFC];gvar_00822DFC:Single
 007749FA    mov         eax,[0078CDFC];^gvar_00822D98:Double
 007749FF    fstp        qword ptr [eax]
 00774A01    wait
 00774A02    mov         esi,822DF0;gvar_00822DF0:Single
 00774A07    mov         edi,823848;gvar_00823848:Single
 00774A0C    movs        dword ptr [edi],dword ptr [esi]
 00774A0D    movs        dword ptr [edi],dword ptr [esi]
 00774A0E    movs        dword ptr [edi],dword ptr [esi]
 00774A0F    movs        dword ptr [edi],dword ptr [esi]
 00774A10    mov         esi,1
 00774A15    mov         eax,esi
 00774A17    call        007713BC
 00774A1C    inc         esi
 00774A1D    cmp         esi,7
>00774A20    jne         00774A15
 00774A22    xor         eax,eax
 00774A24    pop         edx
 00774A25    pop         ecx
 00774A26    pop         ecx
 00774A27    mov         dword ptr fs:[eax],edx
 00774A2A    push        774A44
 00774A2F    lea         eax,[ebp-18]
 00774A32    mov         edx,4
 00774A37    call        @UStrArrayClr
 00774A3C    ret
>00774A3D    jmp         @HandleFinally
>00774A42    jmp         00774A2F
 00774A44    movzx       eax,byte ptr [ebp-1]
 00774A48    pop         edi
 00774A49    pop         esi
 00774A4A    pop         ebx
 00774A4B    mov         esp,ebp
 00774A4D    pop         ebp
 00774A4E    ret
*}
end;

//00774AD0
procedure TModuleKinectPlayer.StartCompiletime;
begin
{*
 00774AD0    call        TPieModule.StartCompiletime
 00774AD5    call        00772F8C
 00774ADA    ret
*}
end;

//00774ADC
procedure TModuleKinectPlayer.StartGUI;
begin
{*
 00774ADC    ret
*}
end;

//00774AE0
procedure TModuleKinectPlayer.StartMonitoring;
begin
{*
 00774AE0    push        ebx
 00774AE1    mov         ebx,eax
 00774AE3    mov         byte ptr [ebx+28],1;TModuleKinectPlayer.Monitoring:Boolean
 00774AE7    mov         eax,dword ptr [ebx+30];TModuleKinectPlayer.OldButtonsDown:TStringList
 00774AEA    mov         edx,dword ptr [eax]
 00774AEC    call        dword ptr [edx+44];TStringList.Clear
 00774AEF    mov         eax,dword ptr [ebx+2C];TModuleKinectPlayer.ButtonsDown:TStringList
 00774AF2    mov         edx,dword ptr [eax]
 00774AF4    call        dword ptr [edx+44];TStringList.Clear
 00774AF7    pop         ebx
 00774AF8    ret
*}
end;

//00774AFC
procedure TModuleKinectPlayer.StartRuntime;
begin
{*
 00774AFC    push        ebp
 00774AFD    mov         ebp,esp
 00774AFF    push        0
 00774B01    push        0
 00774B03    push        ebx
 00774B04    mov         ebx,eax
 00774B06    xor         eax,eax
 00774B08    push        ebp
 00774B09    push        774BB6
 00774B0E    push        dword ptr fs:[eax]
 00774B11    mov         dword ptr fs:[eax],esp
 00774B14    mov         eax,ebx
 00774B16    call        TPieModule.StartRuntime
 00774B1B    cmp         byte ptr [ebx+24],0;TModuleKinectPlayer.Used:Boolean
>00774B1F    je          00774B94
 00774B21    mov         eax,[0078D8AC];^gvar_00822D79
 00774B26    cmp         byte ptr [eax],0
>00774B29    je          00774B94
 00774B2B    mov         eax,1
 00774B30    call        0076E404
 00774B35    mov         [00822DD8],eax;gvar_00822DD8
 00774B3A    mov         eax,78CA4C
 00774B3F    xor         ecx,ecx
 00774B41    mov         edx,20
 00774B46    call        @FillChar
 00774B4B    mov         eax,823858;gvar_00823858:Pointer
 00774B50    xor         ecx,ecx
 00774B52    mov         edx,0B98
 00774B57    call        @FillChar
 00774B5C    cmp         dword ptr ds:[822DD8],0;gvar_00822DD8
>00774B63    je          00774B9B
 00774B65    mov         eax,[00822DD8];gvar_00822DD8
 00774B6A    mov         eax,dword ptr [eax+4]
 00774B6D    xor         ecx,ecx
 00774B6F    xor         edx,edx
 00774B71    call        INuiInstance.NuiSkeletonTrackingEnable
 00774B76    mov         ebx,eax
 00774B78    lea         edx,[ebp-8]
 00774B7B    mov         eax,ebx
 00774B7D    call        0076D414
 00774B82    mov         ecx,dword ptr [ebp-8]
 00774B85    lea         eax,[ebp-4]
 00774B88    mov         edx,774BD0;'SkeletonTrackingEnable: '
 00774B8D    call        @UStrCat3
>00774B92    jmp         00774B9B
 00774B94    xor         eax,eax
 00774B96    mov         [00822DD8],eax;gvar_00822DD8
 00774B9B    xor         eax,eax
 00774B9D    pop         edx
 00774B9E    pop         ecx
 00774B9F    pop         ecx
 00774BA0    mov         dword ptr fs:[eax],edx
 00774BA3    push        774BBD
 00774BA8    lea         eax,[ebp-8]
 00774BAB    mov         edx,2
 00774BB0    call        @UStrArrayClr
 00774BB5    ret
>00774BB6    jmp         @HandleFinally
>00774BBB    jmp         00774BA8
 00774BBD    pop         ebx
 00774BBE    pop         ecx
 00774BBF    pop         ecx
 00774BC0    pop         ebp
 00774BC1    ret
*}
end;

//00774C04
procedure TModuleKinectPlayer.StopCompiletime;
begin
{*
 00774C04    push        ebx
 00774C05    mov         ebx,eax
 00774C07    call        00772FB0
 00774C0C    mov         eax,ebx
 00774C0E    call        TPieModule.StopCompiletime
 00774C13    pop         ebx
 00774C14    ret
*}
end;

//00774C18
procedure TModuleKinectPlayer.StopGUI;
begin
{*
 00774C18    mov         edx,dword ptr [eax]
 00774C1A    call        dword ptr [edx+34];TModuleKinectPlayer.StopRuntime
 00774C1D    ret
*}
end;

//00774C20
procedure TModuleKinectPlayer.StopMonitoring;
begin
{*
 00774C20    mov         byte ptr [eax+28],0;TModuleKinectPlayer.Monitoring:Boolean
 00774C24    ret
*}
end;

//00774C28
procedure TModuleKinectPlayer.StopRuntime;
begin
{*
 00774C28    push        ebp
 00774C29    mov         ebp,esp
 00774C2B    push        0
 00774C2D    push        0
 00774C2F    push        ebx
 00774C30    push        esi
 00774C31    mov         ebx,eax
 00774C33    xor         eax,eax
 00774C35    push        ebp
 00774C36    push        774CB4
 00774C3B    push        dword ptr fs:[eax]
 00774C3E    mov         dword ptr fs:[eax],esp
 00774C41    cmp         byte ptr [ebx+24],0;TModuleKinectPlayer.Used:Boolean
>00774C45    je          00774C92
 00774C47    mov         eax,[0078D8AC];^gvar_00822D79
 00774C4C    cmp         byte ptr [eax],0
>00774C4F    je          00774C92
 00774C51    cmp         dword ptr ds:[822DD8],0;gvar_00822DD8
>00774C58    je          00774C8A
 00774C5A    mov         eax,[00822DD8];gvar_00822DD8
 00774C5F    mov         eax,dword ptr [eax+4]
 00774C62    call        INuiInstance.NuiSkeletonTrackingDisable
 00774C67    mov         esi,eax
 00774C69    lea         edx,[ebp-8]
 00774C6C    mov         eax,esi
 00774C6E    call        0076D414
 00774C73    mov         ecx,dword ptr [ebp-8]
 00774C76    lea         eax,[ebp-4]
 00774C79    mov         edx,774CD0;'SkeletonTrackingDisable: '
 00774C7E    call        @UStrCat3
 00774C83    xor         eax,eax
 00774C85    mov         [00822DD8],eax;gvar_00822DD8
 00774C8A    mov         eax,[0078D8AC];^gvar_00822D79
 00774C8F    mov         byte ptr [eax],0
 00774C92    mov         eax,ebx
 00774C94    call        TPieModule.StopRuntime
 00774C99    xor         eax,eax
 00774C9B    pop         edx
 00774C9C    pop         ecx
 00774C9D    pop         ecx
 00774C9E    mov         dword ptr fs:[eax],edx
 00774CA1    push        774CBB
 00774CA6    lea         eax,[ebp-8]
 00774CA9    mov         edx,2
 00774CAE    call        @UStrArrayClr
 00774CB3    ret
>00774CB4    jmp         @HandleFinally
>00774CB9    jmp         00774CA6
 00774CBB    pop         esi
 00774CBC    pop         ebx
 00774CBD    pop         ecx
 00774CBE    pop         ecx
 00774CBF    pop         ebp
 00774CC0    ret
*}
end;

Initialization
//00783094
{*
 00783094    sub         dword ptr ds:[822DC4],1
>0078309B    jae         007830B8
 0078309D    mov         dl,1
 0078309F    mov         eax,[00770E58];TModuleKinectPlayer
 007830A4    call        TModuleKinectPlayer.Create;TModuleKinectPlayer.Create
 007830A9    mov         [00822DD4],eax;gvar_00822DD4:TModuleKinectPlayer
 007830AE    mov         eax,[00822DD4];gvar_00822DD4:TModuleKinectPlayer
 007830B3    call        005E31AC
 007830B8    ret
*}
Finalization
//00774D04
{*
 00774D04    push        ebp
 00774D05    mov         ebp,esp
 00774D07    xor         eax,eax
 00774D09    push        ebp
 00774D0A    push        774D55
 00774D0F    push        dword ptr fs:[eax]
 00774D12    mov         dword ptr fs:[eax],esp
 00774D15    inc         dword ptr ds:[822DC4]
>00774D1B    jne         00774D47
 00774D1D    mov         eax,78CABC;^'head'
 00774D22    mov         ecx,14
 00774D27    mov         edx,dword ptr ds:[40128C];string
 00774D2D    call        @FinalizeArray
 00774D32    mov         eax,78CB0C;^'pos'
 00774D37    mov         ecx,4
 00774D3C    mov         edx,dword ptr ds:[40128C];string
 00774D42    call        @FinalizeArray
 00774D47    xor         eax,eax
 00774D49    pop         edx
 00774D4A    pop         ecx
 00774D4B    pop         ecx
 00774D4C    mov         dword ptr fs:[eax],edx
 00774D4F    push        774D5C
 00774D54    ret
>00774D55    jmp         @HandleFinally
>00774D5A    jmp         00774D54
 00774D5C    pop         ebp
 00774D5D    ret
*}
end.