//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PiePie;

interface

uses
  SysUtils, Classes;

type
  TPieValue = class(TObjectValue)
  published
    procedure FillClone(c:TExpression);//00618624
    procedure CreateClone;//00618614
    function GetUnits:TUnits;//00618680
    function Module:TObject;//00618870
    function GetPerUnits1:TUnits;//00618664
    function CanSet:Boolean;//00618610
    function GetDataType:TDataType;//00618644
    //function SetValue(NewValue:Double; ?:?):Boolean;//00618878
    procedure GetValue;//006186C0
    //procedure ToString(?:?);//00618AB0
  public
    ................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//00618AB0
    procedure GetValue; virtual;//v2C//006186C0
    function GetDataType:TDataType; virtual;//v44//00618644
    function GetUnits:TUnits; virtual;//v48//00618680
    function GetPerUnits1:TUnits; virtual;//v4C//00618664
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//00618878
    function CanSet:Boolean; virtual;//v68//00618610
    procedure CreateClone; virtual;//v80//00618614
    procedure FillClone(c:TExpression); virtual;//v84//00618624
    function Module:TObject; virtual;//v98//00618870
  end;
  TModulePIE = class(TPieModule)
  published
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//0061905C
    function GetDefaultFormat(field:string):TGuiFormat;//00619024
    procedure Read;//00619080
    procedure GetGoodFields;//00619054
    procedure PrepareForGUI;//00619078
    procedure StopMonitoring;//006190A8
    procedure StartMonitoring;//00619090
    procedure PrepareForMonitoring;//0061907C
    procedure StartCompiletime;//00619088
    procedure StopCompiletime;//006190A0
    procedure StartRuntime;//00619094
    procedure StopRuntime;//006190AC
    function CreateValue(Identifier:string):TExpression;//00618FD0
    procedure ClearRead;//00618F4C
    constructor Create;//00618F54
    procedure AddFields;//00618CA0
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//00618FD0
    procedure GetGoodFields; virtual;//v1C//00619054
    procedure AddFields; virtual;//v24//00618CA0
    procedure StartCompiletime; virtual;//v28//00619088
    procedure StopCompiletime; virtual;//v2C//006190A0
    procedure StartRuntime; virtual;//v30//00619094
    procedure StopRuntime; virtual;//v34//006190AC
    procedure ClearRead; virtual;//v38//00618F4C
    procedure Read; virtual;//v3C//00619080
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//0061905C
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//00619024
    procedure PrepareForGUI; virtual;//v50//00619078
    procedure PrepareForMonitoring; virtual;//v5C//0061907C
    procedure StartMonitoring; virtual;//v60//00619090
    procedure StopMonitoring; virtual;//v64//006190A8
  end;
    //function sub_00618504(?:string):?;//00618504
    procedure sub_00618B28;//00618B28
    procedure sub_00618BB4;//00618BB4
    //function sub_00618BB8:?;//00618BB8
    //function sub_00618BBC(?:UnicodeString):?;//00618BBC
    //procedure sub_00618C10(?:?; ?:?);//00618C10
    //function sub_00618C2C:?;//00618C2C

implementation

//00618504
{*function sub_00618504(?:string):?;
begin
 00618504    push        ebp
 00618505    mov         ebp,esp
 00618507    add         esp,0FFFFFFF8
 0061850A    push        ebx
 0061850B    push        esi
 0061850C    push        edi
 0061850D    xor         edx,edx
 0061850F    mov         dword ptr [ebp-8],edx
 00618512    mov         dword ptr [ebp-4],eax
 00618515    mov         eax,dword ptr [ebp-4]
 00618518    call        @UStrAddRef
 0061851D    xor         eax,eax
 0061851F    push        ebp
 00618520    push        6185BB
 00618525    push        dword ptr fs:[eax]
 00618528    mov         dword ptr fs:[eax],esp
 0061852B    xor         ebx,ebx
 0061852D    lea         eax,[ebp-8]
 00618530    mov         edx,dword ptr [ebp-4]
 00618533    call        @UStrLAsg
 00618538    lea         eax,[ebp-8]
 0061853B    mov         edx,6185D8;'Pie'
 00618540    call        004F9BD0
 00618545    test        al,al
>00618547    jne         0061855A
 00618549    lea         eax,[ebp-8]
 0061854C    mov         edx,6185EC;'GlovePIE'
 00618551    call        004F9BD0
 00618556    test        al,al
>00618558    je          006185A0
 0061855A    lea         eax,[ebp-8]
 0061855D    call        004F9D00
 00618562    mov         esi,eax
 00618564    lea         eax,[ebp-8]
 00618567    mov         edx,61860C;'.'
 0061856C    call        004F9BD0
 00618571    test        al,al
>00618573    je          006185A0
 00618575    mov         eax,dword ptr [ebp-8]
 00618578    call        00618BBC
 0061857D    mov         edi,eax
 0061857F    test        edi,edi
>00618581    jl          006185A0
 00618583    mov         dl,1
 00618585    mov         eax,[00617D24];TPieValue
 0061858A    call        TObject.Create;TPieValue.Create
 0061858F    mov         ebx,eax
 00618591    mov         dword ptr [ebx+20],edi;TPieValue..................Item:Integer
 00618594    test        esi,esi
>00618596    jg          0061859D
 00618598    mov         esi,1
 0061859D    mov         dword ptr [ebx+18],esi;TPieValue...........................................................
 006185A0    xor         eax,eax
 006185A2    pop         edx
 006185A3    pop         ecx
 006185A4    pop         ecx
 006185A5    mov         dword ptr fs:[eax],edx
 006185A8    push        6185C2
 006185AD    lea         eax,[ebp-8]
 006185B0    mov         edx,2
 006185B5    call        @UStrArrayClr
 006185BA    ret
>006185BB    jmp         @HandleFinally
>006185C0    jmp         006185AD
 006185C2    mov         eax,ebx
 006185C4    pop         edi
 006185C5    pop         esi
 006185C6    pop         ebx
 006185C7    pop         ecx
 006185C8    pop         ecx
 006185C9    pop         ebp
 006185CA    ret
end;*}

//00618610
function TPieValue.CanSet:Boolean;
begin
{*
 00618610    mov         al,1
 00618612    ret
*}
end;

//00618614
procedure TPieValue.CreateClone;
begin
{*
 00618614    mov         dl,1
 00618616    mov         eax,[00617D24];TPieValue
 0061861B    call        TObject.Create;TPieValue.Create
 00618620    ret
*}
end;

//00618624
procedure TPieValue.FillClone(c:TExpression);
begin
{*
 00618624    push        ebx
 00618625    push        esi
 00618626    mov         esi,edx
 00618628    mov         ebx,eax
 0061862A    mov         edx,esi
 0061862C    mov         eax,ebx
 0061862E    call        TExpression.FillClone
 00618633    mov         eax,esi
 00618635    mov         edx,dword ptr [ebx+20];TPieValue...................Item:Integer
 00618638    mov         dword ptr [eax+20],edx
 0061863B    mov         edx,dword ptr [ebx+18];TPieValue...........................................................
 0061863E    mov         dword ptr [eax+18],edx
 00618641    pop         esi
 00618642    pop         ebx
 00618643    ret
*}
end;

//00618644
function TPieValue.GetDataType:TDataType;
begin
{*
 00618644    mov         eax,dword ptr [eax+20];TPieValue....................Item:Integer
 00618647    sub         eax,1
>0061864A    jb          00618658
 0061864C    sub         eax,6
>0061864F    je          0061865B
 00618651    sub         eax,5
>00618654    je          0061865B
>00618656    jmp         0061865E
 00618658    xor         eax,eax
 0061865A    ret
 0061865B    mov         al,2
 0061865D    ret
 0061865E    xor         eax,eax
 00618660    ret
*}
end;

//00618664
function TPieValue.GetPerUnits1:TUnits;
begin
{*
 00618664    mov         eax,dword ptr [eax+20];TPieValue.....................Item:Integer
 00618667    sub         eax,8
>0061866A    je          00618674
 0061866C    dec         eax
>0061866D    je          00618677
 0061866F    sub         eax,2
>00618672    jne         0061867A
 00618674    mov         al,11
 00618676    ret
 00618677    mov         al,7
 00618679    ret
 0061867A    xor         eax,eax
 0061867C    ret
*}
end;

//00618680
function TPieValue.GetUnits:TUnits;
begin
{*
 00618680    mov         eax,dword ptr [eax+20];TPieValue......................Item:Integer
 00618683    add         eax,0FFFFFFFB
 00618686    cmp         eax,6
>00618689    ja          006186BD
 0061868B    jmp         dword ptr [eax*4+618692]
 0061868B    dd          006186AE
 0061868B    dd          006186AE
 0061868B    dd          006186B1
 0061868B    dd          006186B4
 0061868B    dd          006186B7
 0061868B    dd          006186BA
 0061868B    dd          006186B4
 006186AE    xor         eax,eax
 006186B0    ret
 006186B1    mov         al,16
 006186B3    ret
 006186B4    xor         eax,eax
 006186B6    ret
 006186B7    mov         al,0D
 006186B9    ret
 006186BA    mov         al,11
 006186BC    ret
 006186BD    mov         al,11
 006186BF    ret
*}
end;

//006186C0
procedure TPieValue.GetValue;
begin
{*
 006186C0    add         esp,0FFFFFFEC
 006186C3    mov         eax,dword ptr [eax+20];TPieValue.......................Item:Integer
 006186C6    cmp         eax,0C
>006186C9    ja          00618856
 006186CF    jmp         dword ptr [eax*4+6186D6]
 006186CF    dd          00618856
 006186CF    dd          00618722
 006186CF    dd          0061873A
 006186CF    dd          00618752
 006186CF    dd          0061876A
 006186CF    dd          0061870A
 006186CF    dd          00618782
 006186CF    dd          0061879A
 006186CF    dd          006187B8
 006186CF    dd          0061881E
 006186CF    dd          0061880B
 006186CF    dd          006187D0
 006186CF    dd          00618833
 0061870A    mov         eax,dword ptr ds:[78BD50];0xCCCCCCCD gvar_0078BD50:Double
 00618710    mov         dword ptr [esp],eax
 00618713    mov         eax,dword ptr ds:[78BD54];0x3FDCCCCC gvar_0078BD54
 00618719    mov         dword ptr [esp+4],eax
>0061871D    jmp         0061885F
 00618722    mov         eax,dword ptr ds:[78BD58];0x33333333 gvar_0078BD58:Double
 00618728    mov         dword ptr [esp],eax
 0061872B    mov         eax,dword ptr ds:[78BD5C];0x3FD33333 gvar_0078BD5C
 00618731    mov         dword ptr [esp+4],eax
>00618735    jmp         0061885F
 0061873A    mov         eax,dword ptr ds:[78BD60];0x9999999A gvar_0078BD60:Double
 00618740    mov         dword ptr [esp],eax
 00618743    mov         eax,dword ptr ds:[78BD64];0x3FA99999 gvar_0078BD64
 00618749    mov         dword ptr [esp+4],eax
>0061874D    jmp         0061885F
 00618752    mov         eax,dword ptr ds:[78BD68];0x0 gvar_0078BD68:Double
 00618758    mov         dword ptr [esp],eax
 0061875B    mov         eax,dword ptr ds:[78BD6C];0x0 gvar_0078BD6C
 00618761    mov         dword ptr [esp+4],eax
>00618765    jmp         0061885F
 0061876A    mov         eax,dword ptr ds:[78BD70];0x0 gvar_0078BD70:Double
 00618770    mov         dword ptr [esp],eax
 00618773    mov         eax,dword ptr ds:[78BD74];0x3FF80000 gvar_0078BD74
 00618779    mov         dword ptr [esp+4],eax
>0061877D    jmp         0061885F
 00618782    mov         eax,dword ptr ds:[78BD78];0x0 gvar_0078BD78:Double
 00618788    mov         dword ptr [esp],eax
 0061878B    mov         eax,dword ptr ds:[78BD7C];0x3FF00000 gvar_0078BD7C
 00618791    mov         dword ptr [esp+4],eax
>00618795    jmp         0061885F
 0061879A    mov         eax,[0078CB88];^gvar_0078BDC0
 0061879F    mov         eax,dword ptr [eax]
 006187A1    mov         dword ptr [esp+8],eax
 006187A5    xor         eax,eax
 006187A7    mov         dword ptr [esp+0C],eax
 006187AB    fild        qword ptr [esp+8]
 006187AF    fstp        qword ptr [esp]
 006187B2    wait
>006187B3    jmp         0061885F
 006187B8    mov         eax,dword ptr ds:[78BD80];0x0 gvar_0078BD80:Double
 006187BE    mov         dword ptr [esp],eax
 006187C1    mov         eax,dword ptr ds:[78BD84];0x404F4000 gvar_0078BD84
 006187C7    mov         dword ptr [esp+4],eax
>006187CB    jmp         0061885F
 006187D0    mov         eax,[0078D560];^gvar_0078BDC8:Double
 006187D5    fld         qword ptr [eax]
 006187D7    fcomp       dword ptr ds:[618868];0:Single
 006187DD    wait
 006187DE    fnstsw      al
 006187E0    sahf
>006187E1    jne         006187F8
 006187E3    mov         eax,dword ptr ds:[78BD80];0x0 gvar_0078BD80:Double
 006187E9    mov         dword ptr [esp],eax
 006187EC    mov         eax,dword ptr ds:[78BD84];0x404F4000 gvar_0078BD84
 006187F2    mov         dword ptr [esp+4],eax
>006187F6    jmp         0061885F
 006187F8    fld         dword ptr ds:[61886C];1:Single
 006187FE    mov         eax,[0078D560];^gvar_0078BDC8:Double
 00618803    fdiv        qword ptr [eax]
 00618805    fstp        qword ptr [esp]
 00618808    wait
>00618809    jmp         0061885F
 0061880B    mov         eax,[0078D560];^gvar_0078BDC8:Double
 00618810    mov         edx,dword ptr [eax]
 00618812    mov         dword ptr [esp],edx
 00618815    mov         edx,dword ptr [eax+4]
 00618818    mov         dword ptr [esp+4],edx
>0061881C    jmp         0061885F
 0061881E    mov         eax,dword ptr ds:[78BD88];0x0 gvar_0078BD88:Double
 00618824    mov         dword ptr [esp],eax
 00618827    mov         eax,dword ptr ds:[78BD8C];0x40790000 gvar_0078BD8C
 0061882D    mov         dword ptr [esp+4],eax
>00618831    jmp         0061885F
 00618833    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00618838    mov         eax,dword ptr [eax]
 0061883A    mov         eax,dword ptr [eax+4E8]
 00618840    mov         eax,dword ptr [eax+64]
 00618843    call        TFont.GetSize
 00618848    mov         dword ptr [esp+10],eax
 0061884C    fild        dword ptr [esp+10]
 00618850    fstp        qword ptr [esp]
 00618853    wait
>00618854    jmp         0061885F
 00618856    xor         eax,eax
 00618858    mov         dword ptr [esp],eax
 0061885B    mov         dword ptr [esp+4],eax
 0061885F    fld         qword ptr [esp]
 00618862    add         esp,14
 00618865    ret
*}
end;

//00618870
function TPieValue.Module:TObject;
begin
{*
 00618870    mov         eax,[0081D8D8];gvar_0081D8D8:TModulePIE
 00618875    ret
*}
end;

//00618878
{*function TPieValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 00618878    push        ebp
 00618879    mov         ebp,esp
 0061887B    push        ebx
 0061887C    mov         bl,1
 0061887E    mov         eax,dword ptr [eax+20];TPieValue........................Item:Integer
 00618881    cmp         eax,0C
>00618884    ja          00618A98
 0061888A    jmp         dword ptr [eax*4+618891]
 0061888A    dd          00618A98
 0061888A    dd          006188DC
 0061888A    dd          006188F3
 0061888A    dd          0061890A
 0061888A    dd          00618921
 0061888A    dd          006188C5
 0061888A    dd          00618938
 0061888A    dd          00618A98
 0061888A    dd          0061894F
 0061888A    dd          00618A63
 0061888A    dd          006189D4
 0061888A    dd          0061894F
 0061888A    dd          00618A77
 006188C5    mov         eax,dword ptr [ebp+8]
 006188C8    mov         dword ptr ds:[78BD50],eax;gvar_0078BD50:Double
 006188CE    mov         eax,dword ptr [ebp+0C]
 006188D1    mov         dword ptr ds:[78BD54],eax;gvar_0078BD54
>006188D7    jmp         00618A9A
 006188DC    mov         eax,dword ptr [ebp+8]
 006188DF    mov         dword ptr ds:[78BD58],eax;gvar_0078BD58:Double
 006188E5    mov         eax,dword ptr [ebp+0C]
 006188E8    mov         dword ptr ds:[78BD5C],eax;gvar_0078BD5C
>006188EE    jmp         00618A9A
 006188F3    mov         eax,dword ptr [ebp+8]
 006188F6    mov         dword ptr ds:[78BD60],eax;gvar_0078BD60:Double
 006188FC    mov         eax,dword ptr [ebp+0C]
 006188FF    mov         dword ptr ds:[78BD64],eax;gvar_0078BD64
>00618905    jmp         00618A9A
 0061890A    mov         eax,dword ptr [ebp+8]
 0061890D    mov         dword ptr ds:[78BD68],eax;gvar_0078BD68:Double
 00618913    mov         eax,dword ptr [ebp+0C]
 00618916    mov         dword ptr ds:[78BD6C],eax;gvar_0078BD6C
>0061891C    jmp         00618A9A
 00618921    mov         eax,dword ptr [ebp+8]
 00618924    mov         dword ptr ds:[78BD70],eax;gvar_0078BD70:Double
 0061892A    mov         eax,dword ptr [ebp+0C]
 0061892D    mov         dword ptr ds:[78BD74],eax;gvar_0078BD74
>00618933    jmp         00618A9A
 00618938    mov         eax,dword ptr [ebp+8]
 0061893B    mov         dword ptr ds:[78BD78],eax;gvar_0078BD78:Double
 00618941    mov         eax,dword ptr [ebp+0C]
 00618944    mov         dword ptr ds:[78BD7C],eax;gvar_0078BD7C
>0061894A    jmp         00618A9A
 0061894F    fld         qword ptr [ebp+8]
 00618952    fcomp       qword ptr ds:[78BD80];gvar_0078BD80:Double
 00618958    wait
 00618959    fnstsw      al
 0061895B    sahf
>0061895C    je          00618A9A
 00618962    mov         eax,dword ptr [ebp+8]
 00618965    mov         dword ptr ds:[78BD80],eax;gvar_0078BD80:Double
 0061896B    mov         eax,dword ptr [ebp+0C]
 0061896E    mov         dword ptr ds:[78BD84],eax;gvar_0078BD84
 00618974    fld         qword ptr ds:[78BD80];gvar_0078BD80:Double
 0061897A    fcomp       dword ptr ds:[618AA4];1000:Single
 00618980    wait
 00618981    fnstsw      al
 00618983    sahf
>00618984    jbe         006189AA
 00618986    fld         qword ptr ds:[78BD80];gvar_0078BD80:Double
 0061898C    fcomp       dword ptr ds:[618AA8];INF:Single
 00618992    wait
 00618993    fnstsw      al
 00618995    sahf
>00618996    je          006189AA
 00618998    xor         eax,eax
 0061899A    mov         dword ptr ds:[78BD80],eax;gvar_0078BD80:Double
 006189A0    mov         dword ptr ds:[78BD84],408F4000;gvar_0078BD84
 006189AA    fld         dword ptr ds:[618AA4];1000:Single
 006189B0    fdiv        qword ptr ds:[78BD80];gvar_0078BD80:Double
 006189B6    call        @ROUND
 006189BB    mov         edx,eax
 006189BD    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006189C2    mov         eax,dword ptr [eax]
 006189C4    mov         eax,dword ptr [eax+564]
 006189CA    call        TThreadedTimer.SetInterval
>006189CF    jmp         00618A9A
 006189D4    fld         dword ptr ds:[618AAC];1:Single
 006189DA    fdiv        qword ptr [ebp+8]
 006189DD    fstp        qword ptr [ebp+8]
 006189E0    wait
 006189E1    fld         qword ptr [ebp+8]
 006189E4    fcomp       qword ptr ds:[78BD80];gvar_0078BD80:Double
 006189EA    wait
 006189EB    fnstsw      al
 006189ED    sahf
>006189EE    je          00618A9A
 006189F4    mov         eax,dword ptr [ebp+8]
 006189F7    mov         dword ptr ds:[78BD80],eax;gvar_0078BD80:Double
 006189FD    mov         eax,dword ptr [ebp+0C]
 00618A00    mov         dword ptr ds:[78BD84],eax;gvar_0078BD84
 00618A06    fld         qword ptr ds:[78BD80];gvar_0078BD80:Double
 00618A0C    fcomp       dword ptr ds:[618AA4];1000:Single
 00618A12    wait
 00618A13    fnstsw      al
 00618A15    sahf
>00618A16    jbe         00618A3C
 00618A18    fld         qword ptr ds:[78BD80];gvar_0078BD80:Double
 00618A1E    fcomp       dword ptr ds:[618AA8];INF:Single
 00618A24    wait
 00618A25    fnstsw      al
 00618A27    sahf
>00618A28    je          00618A3C
 00618A2A    xor         eax,eax
 00618A2C    mov         dword ptr ds:[78BD80],eax;gvar_0078BD80:Double
 00618A32    mov         dword ptr ds:[78BD84],408F4000;gvar_0078BD84
 00618A3C    fld         dword ptr ds:[618AA4];1000:Single
 00618A42    fdiv        qword ptr ds:[78BD80];gvar_0078BD80:Double
 00618A48    call        @ROUND
 00618A4D    mov         edx,eax
 00618A4F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00618A54    mov         eax,dword ptr [eax]
 00618A56    mov         eax,dword ptr [eax+564]
 00618A5C    call        TThreadedTimer.SetInterval
>00618A61    jmp         00618A9A
 00618A63    mov         eax,dword ptr [ebp+8]
 00618A66    mov         dword ptr ds:[78BD88],eax;gvar_0078BD88:Double
 00618A6C    mov         eax,dword ptr [ebp+0C]
 00618A6F    mov         dword ptr ds:[78BD8C],eax;gvar_0078BD8C
>00618A75    jmp         00618A9A
 00618A77    fld         qword ptr [ebp+8]
 00618A7A    call        @ROUND
 00618A7F    mov         edx,eax
 00618A81    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00618A86    mov         eax,dword ptr [eax]
 00618A88    mov         eax,dword ptr [eax+4E8]
 00618A8E    mov         eax,dword ptr [eax+64]
 00618A91    call        TFont.SetSize
>00618A96    jmp         00618A9A
 00618A98    xor         ebx,ebx
 00618A9A    mov         eax,ebx
 00618A9C    pop         ebx
 00618A9D    pop         ebp
 00618A9E    ret         8
end;*}

//00618AB0
{*procedure TPieValue.ToString(?:?);
begin
 00618AB0    push        ebp
 00618AB1    mov         ebp,esp
 00618AB3    push        0
 00618AB5    push        ebx
 00618AB6    push        esi
 00618AB7    mov         esi,edx
 00618AB9    mov         ebx,eax
 00618ABB    xor         eax,eax
 00618ABD    push        ebp
 00618ABE    push        618B01
 00618AC3    push        dword ptr fs:[eax]
 00618AC6    mov         dword ptr fs:[eax],esp
 00618AC9    lea         ecx,[ebp-4]
 00618ACC    mov         eax,[0081D8D8];gvar_0081D8D8:TModulePIE
 00618AD1    mov         eax,dword ptr [eax+1C]
 00618AD4    mov         edx,dword ptr [ebx+20];TPieValue.........................Item:Integer
 00618AD7    call        THashTable.Get
 00618ADC    mov         ecx,dword ptr [ebp-4]
 00618ADF    mov         eax,esi
 00618AE1    mov         edx,618B1C;'Pie.'
 00618AE6    call        @UStrCat3
 00618AEB    xor         eax,eax
 00618AED    pop         edx
 00618AEE    pop         ecx
 00618AEF    pop         ecx
 00618AF0    mov         dword ptr fs:[eax],edx
 00618AF3    push        618B08
 00618AF8    lea         eax,[ebp-4]
 00618AFB    call        @UStrClr
 00618B00    ret
>00618B01    jmp         @HandleFinally
>00618B06    jmp         00618AF8
 00618B08    pop         esi
 00618B09    pop         ebx
 00618B0A    pop         ecx
 00618B0B    pop         ebp
 00618B0C    ret
end;*}

//00618B28
procedure sub_00618B28;
begin
{*
 00618B28    mov         eax,[0078CB88];^gvar_0078BDC0
 00618B2D    xor         edx,edx
 00618B2F    mov         dword ptr [eax],edx
 00618B31    mov         eax,[0078D0EC];^gvar_0078BE00
 00618B36    cmp         byte ptr [eax],0
>00618B39    je          00618B75
 00618B3B    mov         dword ptr ds:[78BD80],55555555;gvar_0078BD80:Double
 00618B45    mov         dword ptr ds:[78BD84],4044D555;gvar_0078BD84
 00618B4F    fld         dword ptr ds:[618BB0];1000:Single
 00618B55    fdiv        qword ptr ds:[78BD80];gvar_0078BD80:Double
 00618B5B    call        @ROUND
 00618B60    mov         edx,eax
 00618B62    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00618B67    mov         eax,dword ptr [eax]
 00618B69    mov         eax,dword ptr [eax+564]
 00618B6F    call        TThreadedTimer.SetInterval
 00618B74    ret
 00618B75    xor         eax,eax
 00618B77    mov         dword ptr ds:[78BD80],eax;gvar_0078BD80:Double
 00618B7D    mov         dword ptr ds:[78BD84],404F4000;gvar_0078BD84
 00618B87    fld         dword ptr ds:[618BB0];1000:Single
 00618B8D    fdiv        qword ptr ds:[78BD80];gvar_0078BD80:Double
 00618B93    call        @ROUND
 00618B98    mov         edx,eax
 00618B9A    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00618B9F    mov         eax,dword ptr [eax]
 00618BA1    mov         eax,dword ptr [eax+564]
 00618BA7    call        TThreadedTimer.SetInterval
 00618BAC    ret
*}
end;

//00618BB4
procedure sub_00618BB4;
begin
{*
 00618BB4    ret
*}
end;

//00618BB8
{*function sub_00618BB8:?;
begin
 00618BB8    mov         al,1
 00618BBA    ret
end;*}

//00618BBC
{*function sub_00618BBC(?:UnicodeString):?;
begin
 00618BBC    push        ebp
 00618BBD    mov         ebp,esp
 00618BBF    push        ecx
 00618BC0    push        ebx
 00618BC1    mov         dword ptr [ebp-4],eax
 00618BC4    mov         eax,dword ptr [ebp-4]
 00618BC7    call        @UStrAddRef
 00618BCC    xor         eax,eax
 00618BCE    push        ebp
 00618BCF    push        618C02
 00618BD4    push        dword ptr fs:[eax]
 00618BD7    mov         dword ptr fs:[eax],esp
 00618BDA    mov         eax,[0081D8D8];gvar_0081D8D8:TModulePIE
 00618BDF    mov         eax,dword ptr [eax+1C]
 00618BE2    mov         edx,dword ptr [ebp-4]
 00618BE5    call        THashTable.Get
 00618BEA    mov         ebx,eax
 00618BEC    xor         eax,eax
 00618BEE    pop         edx
 00618BEF    pop         ecx
 00618BF0    pop         ecx
 00618BF1    mov         dword ptr fs:[eax],edx
 00618BF4    push        618C09
 00618BF9    lea         eax,[ebp-4]
 00618BFC    call        @UStrClr
 00618C01    ret
>00618C02    jmp         @HandleFinally
>00618C07    jmp         00618BF9
 00618C09    mov         eax,ebx
 00618C0B    pop         ebx
 00618C0C    pop         ecx
 00618C0D    pop         ebp
 00618C0E    ret
end;*}

//00618C10
{*procedure sub_00618C10(?:?; ?:?);
begin
 00618C10    push        ebx
 00618C11    push        esi
 00618C12    mov         esi,edx
 00618C14    mov         ebx,eax
 00618C16    mov         ecx,esi
 00618C18    mov         eax,[0081D8D8];gvar_0081D8D8:TModulePIE
 00618C1D    mov         eax,dword ptr [eax+1C]
 00618C20    mov         edx,ebx
 00618C22    call        THashTable.Get
 00618C27    pop         esi
 00618C28    pop         ebx
 00618C29    ret
end;*}

//00618C2C
{*function sub_00618C2C:?;
begin
 00618C2C    push        ebp
 00618C2D    mov         ebp,esp
 00618C2F    push        0
 00618C31    push        ebx
 00618C32    push        esi
 00618C33    xor         eax,eax
 00618C35    push        ebp
 00618C36    push        618C90
 00618C3B    push        dword ptr fs:[eax]
 00618C3E    mov         dword ptr fs:[eax],esp
 00618C41    mov         dl,1
 00618C43    mov         eax,[0043C7BC];TStringList
 00618C48    call        TStringList.Create;TStringList.Create
 00618C4D    mov         esi,eax
 00618C4F    mov         dl,1
 00618C51    mov         eax,esi
 00618C53    call        TStringList.SetSorted
 00618C58    xor         ebx,ebx
 00618C5A    lea         edx,[ebp-4]
 00618C5D    mov         eax,ebx
 00618C5F    call        00618C10
 00618C64    cmp         dword ptr [ebp-4],0
>00618C68    je          00618C74
 00618C6A    mov         edx,dword ptr [ebp-4]
 00618C6D    mov         eax,esi
 00618C6F    mov         ecx,dword ptr [eax]
 00618C71    call        dword ptr [ecx+38];TStringList.Add
 00618C74    inc         ebx
 00618C75    cmp         ebx,0D
>00618C78    jne         00618C5A
 00618C7A    xor         eax,eax
 00618C7C    pop         edx
 00618C7D    pop         ecx
 00618C7E    pop         ecx
 00618C7F    mov         dword ptr fs:[eax],edx
 00618C82    push        618C97
 00618C87    lea         eax,[ebp-4]
 00618C8A    call        @UStrClr
 00618C8F    ret
>00618C90    jmp         @HandleFinally
>00618C95    jmp         00618C87
 00618C97    mov         eax,esi
 00618C99    pop         esi
 00618C9A    pop         ebx
 00618C9B    pop         ecx
 00618C9C    pop         ebp
 00618C9D    ret
end;*}

//00618CA0
procedure TModulePIE.AddFields;
begin
{*
 00618CA0    push        ebx
 00618CA1    mov         ebx,eax
 00618CA3    mov         ecx,1
 00618CA8    mov         edx,618D9C;'SeqDuration'
 00618CAD    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618CB0    call        THashTable.Add
 00618CB5    mov         ecx,3
 00618CBA    mov         edx,618DC0;'SeqReadDuration'
 00618CBF    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618CC2    call        THashTable.Add
 00618CC7    mov         ecx,2
 00618CCC    mov         edx,618DEC;'SeqGap'
 00618CD1    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618CD4    call        THashTable.Add
 00618CD9    mov         ecx,4
 00618CDE    mov         edx,618E08;'SeqReadGap'
 00618CE3    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618CE6    call        THashTable.Add
 00618CEB    mov         ecx,5
 00618CF0    mov         edx,618E2C;'Version'
 00618CF5    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618CF8    call        THashTable.Add
 00618CFD    mov         ecx,6
 00618D02    mov         edx,618E48;'Epsilon'
 00618D07    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D0A    call        THashTable.Add
 00618D0F    mov         ecx,7
 00618D14    mov         edx,618E64;'Frame'
 00618D19    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D1C    call        THashTable.Add
 00618D21    mov         ecx,8
 00618D26    mov         edx,618E7C;'FrameRate'
 00618D2B    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D2E    call        THashTable.Add
 00618D33    mov         ecx,0B
 00618D38    mov         edx,618E9C;'RealFrameRate'
 00618D3D    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D40    call        THashTable.Add
 00618D45    mov         ecx,0A
 00618D4A    mov         edx,618EC4;'FrameTime'
 00618D4F    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D52    call        THashTable.Add
 00618D57    mov         ecx,9
 00618D5C    mov         edx,618EE4;'MouseDPI'
 00618D61    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D64    call        THashTable.Add
 00618D69    mov         ecx,9
 00618D6E    mov         edx,618F04;'MickeysPerInch'
 00618D73    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D76    call        THashTable.Add
 00618D7B    mov         ecx,0C
 00618D80    mov         edx,618F30;'DebugFontSize'
 00618D85    mov         eax,dword ptr [ebx+1C];TModulePIE.Fields:THashTable
 00618D88    call        THashTable.Add
 00618D8D    pop         ebx
 00618D8E    ret
*}
end;

//00618F4C
procedure TModulePIE.ClearRead;
begin
{*
 00618F4C    call        TPieModule.ClearRead
 00618F51    ret
*}
end;

//00618F54
constructor TModulePIE.Create;
begin
{*
 00618F54    push        ebx
 00618F55    push        esi
 00618F56    test        dl,dl
>00618F58    je          00618F62
 00618F5A    add         esp,0FFFFFFF0
 00618F5D    call        @ClassCreate
 00618F62    mov         ebx,edx
 00618F64    mov         esi,eax
 00618F66    push        618FA8;'GlovePIE'
 00618F6B    push        0
 00618F6D    push        0
 00618F6F    push        0
 00618F71    mov         ecx,618FC8;'PIE'
 00618F76    xor         edx,edx
 00618F78    mov         eax,esi
 00618F7A    call        005E48EC
 00618F7F    mov         eax,esi
 00618F81    test        bl,bl
>00618F83    je          00618F94
 00618F85    call        @AfterConstruction
 00618F8A    pop         dword ptr fs:[0]
 00618F91    add         esp,0C
 00618F94    mov         eax,esi
 00618F96    pop         esi
 00618F97    pop         ebx
 00618F98    ret
*}
end;

//00618FD0
function TModulePIE.CreateValue(Identifier:string):TExpression;
begin
{*
 00618FD0    push        ebp
 00618FD1    mov         ebp,esp
 00618FD3    push        ecx
 00618FD4    push        ebx
 00618FD5    mov         dword ptr [ebp-4],edx
 00618FD8    mov         ebx,eax
 00618FDA    mov         eax,dword ptr [ebp-4]
 00618FDD    call        @UStrAddRef
 00618FE2    xor         eax,eax
 00618FE4    push        ebp
 00618FE5    push        619014
 00618FEA    push        dword ptr fs:[eax]
 00618FED    mov         dword ptr fs:[eax],esp
 00618FF0    mov         byte ptr [ebx+24],1;TModulePIE.Used:Boolean
 00618FF4    mov         eax,dword ptr [ebp-4]
 00618FF7    call        00618504
 00618FFC    mov         ebx,eax
 00618FFE    xor         eax,eax
 00619000    pop         edx
 00619001    pop         ecx
 00619002    pop         ecx
 00619003    mov         dword ptr fs:[eax],edx
 00619006    push        61901B
 0061900B    lea         eax,[ebp-4]
 0061900E    call        @UStrClr
 00619013    ret
>00619014    jmp         @HandleFinally
>00619019    jmp         0061900B
 0061901B    mov         eax,ebx
 0061901D    pop         ebx
 0061901E    pop         ecx
 0061901F    pop         ebp
 00619020    ret
*}
end;

//00619024
function TModulePIE.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 00619024    push        ebp
 00619025    mov         ebp,esp
 00619027    push        ebx
 00619028    xor         eax,eax
 0061902A    push        ebp
 0061902B    push        619046
 00619030    push        dword ptr fs:[eax]
 00619033    mov         dword ptr fs:[eax],esp
 00619036    mov         bl,9
 00619038    xor         eax,eax
 0061903A    pop         edx
 0061903B    pop         ecx
 0061903C    pop         ecx
 0061903D    mov         dword ptr fs:[eax],edx
 00619040    push        61904D
 00619045    ret
>00619046    jmp         @HandleFinally
>0061904B    jmp         00619045
 0061904D    mov         eax,ebx
 0061904F    pop         ebx
 00619050    pop         ebp
 00619051    ret
*}
end;

//00619054
procedure TModulePIE.GetGoodFields;
begin
{*
 00619054    call        00618C2C
 00619059    ret
*}
end;

//0061905C
procedure TModulePIE.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 0061905C    push        ebp
 0061905D    mov         ebp,esp
 0061905F    mov         byte ptr [edx],1
 00619062    mov         dword ptr [ecx],1
 00619068    mov         eax,dword ptr [ebp+8]
 0061906B    mov         dword ptr [eax],14
 00619071    pop         ebp
 00619072    ret         4
*}
end;

//00619078
procedure TModulePIE.PrepareForGUI;
begin
{*
 00619078    ret
*}
end;

//0061907C
procedure TModulePIE.PrepareForMonitoring;
begin
{*
 0061907C    ret
*}
end;

//00619080
procedure TModulePIE.Read;
begin
{*
 00619080    call        00618BB8
 00619085    ret
*}
end;

//00619088
procedure TModulePIE.StartCompiletime;
begin
{*
 00619088    call        TPieModule.StartCompiletime
 0061908D    ret
*}
end;

//00619090
procedure TModulePIE.StartMonitoring;
begin
{*
 00619090    ret
*}
end;

//00619094
procedure TModulePIE.StartRuntime;
begin
{*
 00619094    call        TPieModule.StartRuntime
 00619099    call        00618B28
 0061909E    ret
*}
end;

//006190A0
procedure TModulePIE.StopCompiletime;
begin
{*
 006190A0    call        TPieModule.StopCompiletime
 006190A5    ret
*}
end;

//006190A8
procedure TModulePIE.StopMonitoring;
begin
{*
 006190A8    ret
*}
end;

//006190AC
procedure TModulePIE.StopRuntime;
begin
{*
 006190AC    push        ebx
 006190AD    mov         ebx,eax
 006190AF    call        00618BB4
 006190B4    mov         eax,ebx
 006190B6    call        TPieModule.StopRuntime
 006190BB    pop         ebx
 006190BC    ret
*}
end;

Initialization
//00781CF8
{*
 00781CF8    push        ebp
 00781CF9    mov         ebp,esp
 00781CFB    push        ebx
 00781CFC    push        esi
 00781CFD    push        edi
 00781CFE    sub         dword ptr ds:[81D8D4],1
>00781D05    jae         00781D5F
 00781D07    xor         edx,edx
 00781D09    push        ebp
 00781D0A    push        781D44
 00781D0F    push        dword ptr fs:[edx]
 00781D12    mov         dword ptr fs:[edx],esp
 00781D15    mov         eax,781D70;'Initializing PiePie'
 00781D1A    call        004FA5FC
 00781D1F    mov         dl,1
 00781D21    mov         eax,[0061807C];TModulePIE
 00781D26    call        TModulePIE.Create;TModulePIE.Create
 00781D2B    mov         [0081D8D8],eax;gvar_0081D8D8:TModulePIE
 00781D30    mov         eax,[0081D8D8];gvar_0081D8D8:TModulePIE
 00781D35    call        005E31AC
 00781D3A    xor         eax,eax
 00781D3C    pop         edx
 00781D3D    pop         ecx
 00781D3E    pop         ecx
 00781D3F    mov         dword ptr fs:[eax],edx
>00781D42    jmp         00781D5F
>00781D44    jmp         @HandleOnException
 00781D49    dd          1
 00781D4D    dd          00418C04;Exception
 00781D51    dd          00781D55
 00781D55    call        004FA644
 00781D5A    call        @DoneExcept
 00781D5F    pop         edi
 00781D60    pop         esi
 00781D61    pop         ebx
 00781D62    pop         ebp
 00781D63    ret
*}
Finalization
//006190C0
{*
 006190C0    push        ebp
 006190C1    mov         ebp,esp
 006190C3    push        ebx
 006190C4    push        esi
 006190C5    push        edi
 006190C6    inc         dword ptr ds:[81D8D4]
>006190CC    jne         00619110
 006190CE    xor         edx,edx
 006190D0    push        ebp
 006190D1    push        6190F5
 006190D6    push        dword ptr fs:[edx]
 006190D9    mov         dword ptr fs:[edx],esp
 006190DC    mov         eax,619124;'Finalizing PiePie'
 006190E1    call        004FA5FC
 006190E6    call        00618BB4
 006190EB    xor         eax,eax
 006190ED    pop         edx
 006190EE    pop         ecx
 006190EF    pop         ecx
 006190F0    mov         dword ptr fs:[eax],edx
>006190F3    jmp         00619110
>006190F5    jmp         @HandleOnException
 006190FA    dd          1
 006190FE    dd          00418C04;Exception
 00619102    dd          00619106
 00619106    call        004FA644
 0061910B    call        @DoneExcept
 00619110    pop         edi
 00619111    pop         esi
 00619112    pop         ebx
 00619113    pop         ebp
 00619114    ret
*}
end.