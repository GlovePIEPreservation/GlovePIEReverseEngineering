//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieModule;

interface

uses
  SysUtils, Classes, PieExpression;

type
  TGuiFormat = (gf_0to1, gf_Percent, gf_0To127, gf_1to128, gf_0to16383, gf_Minus8192to8191, gf_Minus1to1, gf_Minus64to63, gf_TrueIs64, gf_Other, gf_Minus127to0, gf_Minus63to64);
  TPieModule = class(TBaseClass)
  published
    function GetDefaultFormat(field:Integer):TGuiFormat;//005E4C40
    procedure Diagnose(L:TStrings);//005E4AC8
    procedure PrepareForGUI;//005E5220
    destructor Destroy();//005E4A98
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//005E4D5C
    function GetDefaultFormat(field:string):TGuiFormat;//005E4C98
    procedure StartMonitoring;//005E524C
    procedure StopMonitoring;//005E5278
    procedure MonitorFrame;//005E4FFC
    procedure StartGUI;//005E5248
    procedure StopGUI;//005E5274
    procedure PrepareForMonitoring;//005E5224
    procedure GetGoodFields;//005E4D54
    function GetAllFields:TStringList;//005E4BA0
    procedure AddFields;//005E458C
    function IsIdentifier(s:string):Boolean;//005E4D78
    function CreateValue(Identifier:string):TExpression;//005E4A64
    function GetFields:TStringList;//005E4CC8
    procedure StopRuntime;//005E528C
    procedure ClearRead;//005E4590
    function Read:Boolean;//005E5234
    procedure StartCompiletime;//005E5240
    procedure StopCompiletime;//005E5270
    procedure StartRuntime;//005E5264
  public
    Name:string;//f4
    Name1:string;//f8
    Name2:string;//fC
    Name3:string;//f10
    Name4:string;//f14
    Name5:string;//f18
    Fields:THashTable;//f1C
    MaxFieldNumber:Integer;//f20
    Used:Boolean;//f24
    Exists:Boolean;//f25
    DoesInput:Boolean;//f26
    DoesOutput:Boolean;//f27
    Monitoring:Boolean;//f28
    ButtonsDown:TStringList;//f2C
    OldButtonsDown:TStringList;//f30
    destructor Destroy(); virtual;//005E4A98
    function IsIdentifier(s:string):Boolean; virtual;//v10//005E4D78
    function CreateValue(Identifier:string):TExpression; virtual;//v14//005E4A64
    function GetFields:TStringList; virtual;//v18//005E4CC8
    procedure GetGoodFields; virtual;//v1C//005E4D54
    function GetAllFields:TStringList; virtual;//v20//005E4BA0
    procedure AddFields; virtual;//v24//005E458C
    procedure StartCompiletime; virtual;//v28//005E5240
    procedure StopCompiletime; virtual;//v2C//005E5270
    procedure StartRuntime; virtual;//v30//005E5264
    procedure StopRuntime; virtual;//v34//005E528C
    procedure ClearRead; virtual;//v38//005E4590
    function Read:Boolean; virtual;//v3C//005E5234
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//005E4D5C
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//005E4C98
    function GetDefaultFormat(field:Integer):TGuiFormat; virtual;//v48//005E4C40
    procedure Diagnose(L:TStrings); virtual;//v4C//005E4AC8
    procedure PrepareForGUI; virtual;//v50//005E5220
    procedure StartGUI; virtual;//v54//005E5248
    procedure StopGUI; virtual;//v58//005E5274
    procedure PrepareForMonitoring; virtual;//v5C//005E5224
    procedure StartMonitoring; virtual;//v60//005E524C
    procedure StopMonitoring; virtual;//v64//005E5278
    procedure MonitorFrame; virtual;//v68//005E4FFC
  end;
    //procedure sub_005E3058(?:WideString; ?:?);//005E3058
    //function sub_005E30E8(?:UString):?;//005E30E8
    procedure sub_005E31AC(?:TPieModule);//005E31AC
    //procedure sub_005E31EC(?:?; ?:?);//005E31EC
    //procedure sub_005E3294(?:TStrings; ?:?);//005E3294
    procedure sub_005E3340;//005E3340
    procedure sub_005E3474;//005E3474
    procedure sub_005E3568;//005E3568
    procedure sub_005E36E0;//005E36E0
    procedure sub_005E3858;//005E3858
    procedure sub_005E3960;//005E3960
    procedure sub_005E3A68;//005E3A68
    procedure sub_005E3B20;//005E3B20
    //function sub_005E3BD8(?:UnicodeString):?;//005E3BD8
    //function sub_005E3C9C(?:?):?;//005E3C9C
    //function sub_005E3D60(?:?; ?:?; ?:?; ?:?):?;//005E3D60
    procedure sub_005E3E40;//005E3E40
    procedure sub_005E3F3C;//005E3F3C
    procedure sub_005E4038;//005E4038
    procedure sub_005E413C;//005E413C
    procedure sub_005E4240;//005E4240
    procedure sub_005E43E8;//005E43E8
    //function sub_005E44F4(?:UnicodeString):?;//005E44F4
    //constructor sub_005E4594(?:?; ?:?; ?:?; ?:?);//005E4594
    //constructor sub_005E4830(?:?; ?:?; ?:?; ?:?);//005E4830
    //constructor sub_005E48EC(?:?; ?:?; ?:?; ?:?);//005E48EC
    //constructor sub_005E49A8(?:?; ?:?; ?:?; ?:?);//005E49A8
    procedure sub_005E4E90(?:TModuleP5; ?:UnicodeString);//005E4E90
    procedure sub_005E4ED8(?:TModuleP5; ?:UnicodeString);//005E4ED8
    procedure sub_005E4F20(?:TPieModule; ?:UnicodeString);//005E4F20
    procedure sub_005E4F6C(?:TPieModule; ?:UnicodeString);//005E4F6C
    procedure sub_005E4FB4(?:TPieModule; ?:UnicodeString);//005E4FB4
    procedure sub_005E5004(?:TPieModule; ?:UnicodeString);//005E5004
    procedure sub_005E5050(?:TPieModule; ?:UnicodeString);//005E5050
    procedure sub_005E509C(?:TPieModule);//005E509C
    procedure sub_005E5190(?:TPieModule; ?:UnicodeString);//005E5190
    procedure sub_005E51D8(?:TPieModule; ?:UnicodeString);//005E51D8

implementation

//005E3058
{*procedure sub_005E3058(?:WideString; ?:?);
begin
 005E3058    push        ebp
 005E3059    mov         ebp,esp
 005E305B    push        0
 005E305D    push        0
 005E305F    push        0
 005E3061    push        ebx
 005E3062    push        esi
 005E3063    mov         ebx,edx
 005E3065    mov         dword ptr [ebp-4],eax
 005E3068    lea         eax,[ebp-4]
 005E306B    call        @WStrAddRef
 005E3070    xor         eax,eax
 005E3072    push        ebp
 005E3073    push        5E30D8
 005E3078    push        dword ptr fs:[eax]
 005E307B    mov         dword ptr fs:[eax],esp
 005E307E    lea         eax,[ebp-0C]
 005E3081    mov         edx,dword ptr [ebp-4]
 005E3084    call        @UStrFromWStr
 005E3089    mov         eax,dword ptr [ebp-0C]
 005E308C    lea         edx,[ebp-8]
 005E308F    call        00575C90
 005E3094    mov         eax,dword ptr [ebp-8]
 005E3097    mov         edx,ebx
 005E3099    call        Trim
 005E309E    mov         eax,dword ptr [ebx]
 005E30A0    call        005E30E8
 005E30A5    mov         esi,eax
 005E30A7    test        esi,esi
>005E30A9    je          005E30B5
 005E30AB    mov         edx,ebx
 005E30AD    mov         eax,dword ptr [esi+4]
 005E30B0    call        Trim
 005E30B5    xor         eax,eax
 005E30B7    pop         edx
 005E30B8    pop         ecx
 005E30B9    pop         ecx
 005E30BA    mov         dword ptr fs:[eax],edx
 005E30BD    push        5E30DF
 005E30C2    lea         eax,[ebp-0C]
 005E30C5    mov         edx,2
 005E30CA    call        @UStrArrayClr
 005E30CF    lea         eax,[ebp-4]
 005E30D2    call        @WStrClr
 005E30D7    ret
>005E30D8    jmp         @HandleFinally
>005E30DD    jmp         005E30C2
 005E30DF    pop         esi
 005E30E0    pop         ebx
 005E30E1    mov         esp,ebp
 005E30E3    pop         ebp
 005E30E4    ret
end;*}

//005E30E8
{*function sub_005E30E8(?:UString):?;
begin
 005E30E8    push        ebp
 005E30E9    mov         ebp,esp
 005E30EB    add         esp,0FFFFFFF4
 005E30EE    push        ebx
 005E30EF    push        esi
 005E30F0    push        edi
 005E30F1    xor         edx,edx
 005E30F3    mov         dword ptr [ebp-0C],edx
 005E30F6    mov         dword ptr [ebp-4],eax
 005E30F9    mov         eax,dword ptr [ebp-4]
 005E30FC    call        @UStrAddRef
 005E3101    xor         eax,eax
 005E3103    push        ebp
 005E3104    push        5E317E
 005E3109    push        dword ptr fs:[eax]
 005E310C    mov         dword ptr fs:[eax],esp
 005E310F    xor         eax,eax
 005E3111    mov         dword ptr [ebp-8],eax
 005E3114    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3119    mov         esi,dword ptr [eax+8]
 005E311C    dec         esi
 005E311D    test        esi,esi
>005E311F    jl          005E3160
 005E3121    inc         esi
 005E3122    xor         edi,edi
 005E3124    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E312A    mov         edx,edi
 005E312C    mov         eax,ebx
 005E312E    call        TList.Get
 005E3133    mov         ebx,eax
 005E3135    test        ebx,ebx
>005E3137    je          005E315C
 005E3139    lea         eax,[ebp-0C]
 005E313C    mov         ecx,5E319C;'.exists'
 005E3141    mov         edx,dword ptr [ebp-4]
 005E3144    call        @UStrCat3
 005E3149    mov         edx,dword ptr [ebp-0C]
 005E314C    mov         eax,ebx
 005E314E    mov         ecx,dword ptr [eax]
 005E3150    call        dword ptr [ecx+10]
 005E3153    test        al,al
>005E3155    je          005E315C
 005E3157    mov         dword ptr [ebp-8],ebx
>005E315A    jmp         005E3160
 005E315C    inc         edi
 005E315D    dec         esi
>005E315E    jne         005E3124
 005E3160    xor         eax,eax
 005E3162    pop         edx
 005E3163    pop         ecx
 005E3164    pop         ecx
 005E3165    mov         dword ptr fs:[eax],edx
 005E3168    push        5E3185
 005E316D    lea         eax,[ebp-0C]
 005E3170    call        @UStrClr
 005E3175    lea         eax,[ebp-4]
 005E3178    call        @UStrClr
 005E317D    ret
>005E317E    jmp         @HandleFinally
>005E3183    jmp         005E316D
 005E3185    mov         eax,dword ptr [ebp-8]
 005E3188    pop         edi
 005E3189    pop         esi
 005E318A    pop         ebx
 005E318B    mov         esp,ebp
 005E318D    pop         ebp
 005E318E    ret
end;*}

//005E31AC
procedure sub_005E31AC(?:TPieModule);
begin
{*
 005E31AC    push        ebx
 005E31AD    push        esi
 005E31AE    mov         ebx,eax
 005E31B0    cmp         dword ptr ds:[8161E0],0;gvar_008161E0:TObjectList
>005E31B7    jne         005E31CA
 005E31B9    mov         dl,1
 005E31BB    mov         eax,[00471630];TObjectList
 005E31C0    call        TObjectList.Create;TObjectList.Create
 005E31C5    mov         [008161E0],eax;gvar_008161E0:TObjectList
 005E31CA    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E31CF    mov         esi,ebx
 005E31D1    mov         edx,esi
 005E31D3    call        TList.IndexOf
 005E31D8    test        eax,eax
>005E31DA    jge         005E31E8
 005E31DC    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E31E1    mov         edx,esi
 005E31E3    call        TList.Add
 005E31E8    pop         esi
 005E31E9    pop         ebx
 005E31EA    ret
*}
end;

//005E31EC
{*procedure sub_005E31EC(?:?; ?:?);
begin
 005E31EC    push        ebp
 005E31ED    mov         ebp,esp
 005E31EF    add         esp,0FFFFFFF4
 005E31F2    push        ebx
 005E31F3    push        esi
 005E31F4    push        edi
 005E31F5    xor         ecx,ecx
 005E31F7    mov         dword ptr [ebp-0C],ecx
 005E31FA    mov         dword ptr [ebp-4],edx
 005E31FD    mov         dword ptr [ebp-8],eax
 005E3200    mov         eax,dword ptr [ebp-4]
 005E3203    call        @UStrAddRef
 005E3208    xor         eax,eax
 005E320A    push        ebp
 005E320B    push        5E3284
 005E3210    push        dword ptr fs:[eax]
 005E3213    mov         dword ptr fs:[eax],esp
 005E3216    cmp         dword ptr [ebp-8],0
>005E321A    je          005E3266
 005E321C    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3221    mov         esi,dword ptr [eax+8]
 005E3224    dec         esi
 005E3225    test        esi,esi
>005E3227    jl          005E3266
 005E3229    inc         esi
 005E322A    xor         edi,edi
 005E322C    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3232    mov         edx,edi
 005E3234    mov         eax,ebx
 005E3236    call        TList.Get
 005E323B    mov         ebx,eax
 005E323D    test        ebx,ebx
>005E323F    je          005E3262
 005E3241    lea         edx,[ebp-0C]
 005E3244    mov         eax,dword ptr [ebx+4]
 005E3247    call        00575A60
 005E324C    lea         eax,[ebp-0C]
 005E324F    mov         edx,dword ptr [ebp-4]
 005E3252    call        @UStrCat
 005E3257    mov         edx,dword ptr [ebp-0C]
 005E325A    mov         eax,dword ptr [ebp-8]
 005E325D    mov         ecx,dword ptr [eax]
 005E325F    call        dword ptr [ecx+38]
 005E3262    inc         edi
 005E3263    dec         esi
>005E3264    jne         005E322C
 005E3266    xor         eax,eax
 005E3268    pop         edx
 005E3269    pop         ecx
 005E326A    pop         ecx
 005E326B    mov         dword ptr fs:[eax],edx
 005E326E    push        5E328B
 005E3273    lea         eax,[ebp-0C]
 005E3276    call        @UStrClr
 005E327B    lea         eax,[ebp-4]
 005E327E    call        @UStrClr
 005E3283    ret
>005E3284    jmp         @HandleFinally
>005E3289    jmp         005E3273
 005E328B    pop         edi
 005E328C    pop         esi
 005E328D    pop         ebx
 005E328E    mov         esp,ebp
 005E3290    pop         ebp
 005E3291    ret
end;*}

//005E3294
{*procedure sub_005E3294(?:TStrings; ?:?);
begin
 005E3294    push        ebp
 005E3295    mov         ebp,esp
 005E3297    add         esp,0FFFFFFF4
 005E329A    push        ebx
 005E329B    push        esi
 005E329C    push        edi
 005E329D    xor         ecx,ecx
 005E329F    mov         dword ptr [ebp-0C],ecx
 005E32A2    mov         dword ptr [ebp-4],edx
 005E32A5    mov         dword ptr [ebp-8],eax
 005E32A8    mov         eax,dword ptr [ebp-4]
 005E32AB    call        @UStrAddRef
 005E32B0    xor         eax,eax
 005E32B2    push        ebp
 005E32B3    push        5E3332
 005E32B8    push        dword ptr fs:[eax]
 005E32BB    mov         dword ptr fs:[eax],esp
 005E32BE    cmp         dword ptr [ebp-8],0
>005E32C2    je          005E3314
 005E32C4    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E32C9    mov         esi,dword ptr [eax+8]
 005E32CC    dec         esi
 005E32CD    test        esi,esi
>005E32CF    jl          005E3314
 005E32D1    inc         esi
 005E32D2    xor         edi,edi
 005E32D4    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E32DA    mov         edx,edi
 005E32DC    mov         eax,ebx
 005E32DE    call        TList.Get
 005E32E3    mov         ebx,eax
 005E32E5    test        ebx,ebx
>005E32E7    je          005E3310
 005E32E9    cmp         byte ptr [ebx+26],0
>005E32ED    je          005E3310
 005E32EF    lea         edx,[ebp-0C]
 005E32F2    mov         eax,dword ptr [ebx+4]
 005E32F5    call        00575A60
 005E32FA    lea         eax,[ebp-0C]
 005E32FD    mov         edx,dword ptr [ebp-4]
 005E3300    call        @UStrCat
 005E3305    mov         edx,dword ptr [ebp-0C]
 005E3308    mov         eax,dword ptr [ebp-8]
 005E330B    mov         ecx,dword ptr [eax]
 005E330D    call        dword ptr [ecx+38]
 005E3310    inc         edi
 005E3311    dec         esi
>005E3312    jne         005E32D4
 005E3314    xor         eax,eax
 005E3316    pop         edx
 005E3317    pop         ecx
 005E3318    pop         ecx
 005E3319    mov         dword ptr fs:[eax],edx
 005E331C    push        5E3339
 005E3321    lea         eax,[ebp-0C]
 005E3324    call        @UStrClr
 005E3329    lea         eax,[ebp-4]
 005E332C    call        @UStrClr
 005E3331    ret
>005E3332    jmp         @HandleFinally
>005E3337    jmp         005E3321
 005E3339    pop         edi
 005E333A    pop         esi
 005E333B    pop         ebx
 005E333C    mov         esp,ebp
 005E333E    pop         ebp
 005E333F    ret
end;*}

//005E3340
procedure sub_005E3340;
begin
{*
 005E3340    push        ebp
 005E3341    mov         ebp,esp
 005E3343    add         esp,0FFFFFFF0
 005E3346    push        ebx
 005E3347    push        esi
 005E3348    push        edi
 005E3349    xor         eax,eax
 005E334B    mov         dword ptr [ebp-10],eax
 005E334E    xor         eax,eax
 005E3350    push        ebp
 005E3351    push        5E3445
 005E3356    push        dword ptr fs:[eax]
 005E3359    mov         dword ptr fs:[eax],esp
 005E335C    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3361    mov         eax,dword ptr [eax+8]
 005E3364    dec         eax
 005E3365    test        eax,eax
>005E3367    jl          005E339D
 005E3369    inc         eax
 005E336A    mov         dword ptr [ebp-0C],eax
 005E336D    mov         dword ptr [ebp-4],0
 005E3374    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E337A    mov         edx,dword ptr [ebp-4]
 005E337D    mov         eax,ebx
 005E337F    call        TList.Get
 005E3384    mov         dword ptr [ebp-8],eax
 005E3387    cmp         dword ptr [ebp-8],0
>005E338B    je          005E3395
 005E338D    mov         eax,dword ptr [ebp-8]
 005E3390    mov         edx,dword ptr [eax]
 005E3392    call        dword ptr [edx+50]
 005E3395    inc         dword ptr [ebp-4]
 005E3398    dec         dword ptr [ebp-0C]
>005E339B    jne         005E3374
 005E339D    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E33A2    mov         eax,dword ptr [eax+8]
 005E33A5    dec         eax
 005E33A6    test        eax,eax
>005E33A8    jl          005E342F
 005E33AE    inc         eax
 005E33AF    mov         dword ptr [ebp-0C],eax
 005E33B2    mov         dword ptr [ebp-4],0
 005E33B9    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E33BF    mov         edx,dword ptr [ebp-4]
 005E33C2    mov         eax,ebx
 005E33C4    call        TList.Get
 005E33C9    mov         dword ptr [ebp-8],eax
 005E33CC    cmp         dword ptr [ebp-8],0
>005E33D0    je          005E3427
 005E33D2    xor         eax,eax
 005E33D4    push        ebp
 005E33D5    push        5E33F2
 005E33DA    push        dword ptr fs:[eax]
 005E33DD    mov         dword ptr fs:[eax],esp
 005E33E0    mov         eax,dword ptr [ebp-8]
 005E33E3    mov         edx,dword ptr [eax]
 005E33E5    call        dword ptr [edx+54]
 005E33E8    xor         eax,eax
 005E33EA    pop         edx
 005E33EB    pop         ecx
 005E33EC    pop         ecx
 005E33ED    mov         dword ptr fs:[eax],edx
>005E33F0    jmp         005E3427
>005E33F2    jmp         @HandleOnException
 005E33F7    dd          1
 005E33FB    dd          00418C04;Exception
 005E33FF    dd          005E3403
 005E3403    mov         ebx,eax
 005E3405    mov         eax,dword ptr [ebp-8]
 005E3408    mov         edx,dword ptr [eax+4]
 005E340B    lea         eax,[ebp-10]
 005E340E    mov         ecx,5E3460;'.StartGui'
 005E3413    call        @UStrCat3
 005E3418    mov         edx,dword ptr [ebp-10]
 005E341B    mov         eax,ebx
 005E341D    call        004FA6EC
 005E3422    call        @DoneExcept
 005E3427    inc         dword ptr [ebp-4]
 005E342A    dec         dword ptr [ebp-0C]
>005E342D    jne         005E33B9
 005E342F    xor         eax,eax
 005E3431    pop         edx
 005E3432    pop         ecx
 005E3433    pop         ecx
 005E3434    mov         dword ptr fs:[eax],edx
 005E3437    push        5E344C
 005E343C    lea         eax,[ebp-10]
 005E343F    call        @UStrClr
 005E3444    ret
>005E3445    jmp         @HandleFinally
>005E344A    jmp         005E343C
 005E344C    pop         edi
 005E344D    pop         esi
 005E344E    pop         ebx
 005E344F    mov         esp,ebp
 005E3451    pop         ebp
 005E3452    ret
*}
end;

//005E3474
procedure sub_005E3474;
begin
{*
 005E3474    push        ebp
 005E3475    mov         ebp,esp
 005E3477    add         esp,0FFFFFFF0
 005E347A    push        ebx
 005E347B    push        esi
 005E347C    push        edi
 005E347D    xor         eax,eax
 005E347F    mov         dword ptr [ebp-10],eax
 005E3482    xor         eax,eax
 005E3484    push        ebp
 005E3485    push        5E3538
 005E348A    push        dword ptr fs:[eax]
 005E348D    mov         dword ptr fs:[eax],esp
 005E3490    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3495    mov         eax,dword ptr [eax+8]
 005E3498    dec         eax
 005E3499    test        eax,eax
>005E349B    jl          005E3522
 005E34A1    inc         eax
 005E34A2    mov         dword ptr [ebp-0C],eax
 005E34A5    mov         dword ptr [ebp-4],0
 005E34AC    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E34B2    mov         edx,dword ptr [ebp-4]
 005E34B5    mov         eax,ebx
 005E34B7    call        TList.Get
 005E34BC    mov         dword ptr [ebp-8],eax
 005E34BF    cmp         dword ptr [ebp-8],0
>005E34C3    je          005E351A
 005E34C5    xor         eax,eax
 005E34C7    push        ebp
 005E34C8    push        5E34E5
 005E34CD    push        dword ptr fs:[eax]
 005E34D0    mov         dword ptr fs:[eax],esp
 005E34D3    mov         eax,dword ptr [ebp-8]
 005E34D6    mov         edx,dword ptr [eax]
 005E34D8    call        dword ptr [edx+58]
 005E34DB    xor         eax,eax
 005E34DD    pop         edx
 005E34DE    pop         ecx
 005E34DF    pop         ecx
 005E34E0    mov         dword ptr fs:[eax],edx
>005E34E3    jmp         005E351A
>005E34E5    jmp         @HandleOnException
 005E34EA    dd          1
 005E34EE    dd          00418C04;Exception
 005E34F2    dd          005E34F6
 005E34F6    mov         ebx,eax
 005E34F8    mov         eax,dword ptr [ebp-8]
 005E34FB    mov         edx,dword ptr [eax+4]
 005E34FE    lea         eax,[ebp-10]
 005E3501    mov         ecx,5E3554;'.StopGui'
 005E3506    call        @UStrCat3
 005E350B    mov         edx,dword ptr [ebp-10]
 005E350E    mov         eax,ebx
 005E3510    call        004FA6EC
 005E3515    call        @DoneExcept
 005E351A    inc         dword ptr [ebp-4]
 005E351D    dec         dword ptr [ebp-0C]
>005E3520    jne         005E34AC
 005E3522    xor         eax,eax
 005E3524    pop         edx
 005E3525    pop         ecx
 005E3526    pop         ecx
 005E3527    mov         dword ptr fs:[eax],edx
 005E352A    push        5E353F
 005E352F    lea         eax,[ebp-10]
 005E3532    call        @UStrClr
 005E3537    ret
>005E3538    jmp         @HandleFinally
>005E353D    jmp         005E352F
 005E353F    pop         edi
 005E3540    pop         esi
 005E3541    pop         ebx
 005E3542    mov         esp,ebp
 005E3544    pop         ebp
 005E3545    ret
*}
end;

//005E3568
procedure sub_005E3568;
begin
{*
 005E3568    push        ebp
 005E3569    mov         ebp,esp
 005E356B    add         esp,0FFFFFFF0
 005E356E    push        ebx
 005E356F    push        esi
 005E3570    push        edi
 005E3571    xor         eax,eax
 005E3573    mov         dword ptr [ebp-10],eax
 005E3576    xor         eax,eax
 005E3578    push        ebp
 005E3579    push        5E36A1
 005E357E    push        dword ptr fs:[eax]
 005E3581    mov         dword ptr fs:[eax],esp
 005E3584    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3589    mov         eax,dword ptr [eax+8]
 005E358C    dec         eax
 005E358D    test        eax,eax
>005E358F    jl          005E35F0
 005E3591    inc         eax
 005E3592    mov         dword ptr [ebp-0C],eax
 005E3595    mov         dword ptr [ebp-4],0
 005E359C    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E35A2    mov         edx,dword ptr [ebp-4]
 005E35A5    mov         eax,ebx
 005E35A7    call        TList.Get
 005E35AC    mov         dword ptr [ebp-8],eax
 005E35AF    cmp         dword ptr [ebp-8],0
>005E35B3    je          005E35E8
 005E35B5    mov         eax,dword ptr [ebp-8]
 005E35B8    cmp         byte ptr [eax+26],0
>005E35BC    je          005E35E8
 005E35BE    xor         eax,eax
 005E35C0    push        ebp
 005E35C1    push        5E35DE
 005E35C6    push        dword ptr fs:[eax]
 005E35C9    mov         dword ptr fs:[eax],esp
 005E35CC    mov         eax,dword ptr [ebp-8]
 005E35CF    mov         edx,dword ptr [eax]
 005E35D1    call        dword ptr [edx+5C]
 005E35D4    xor         eax,eax
 005E35D6    pop         edx
 005E35D7    pop         ecx
 005E35D8    pop         ecx
 005E35D9    mov         dword ptr fs:[eax],edx
>005E35DC    jmp         005E35E8
>005E35DE    jmp         @HandleAnyException
 005E35E3    call        @DoneExcept
 005E35E8    inc         dword ptr [ebp-4]
 005E35EB    dec         dword ptr [ebp-0C]
>005E35EE    jne         005E359C
 005E35F0    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E35F5    mov         eax,dword ptr [eax+8]
 005E35F8    dec         eax
 005E35F9    test        eax,eax
>005E35FB    jl          005E368B
 005E3601    inc         eax
 005E3602    mov         dword ptr [ebp-0C],eax
 005E3605    mov         dword ptr [ebp-4],0
 005E360C    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3612    mov         edx,dword ptr [ebp-4]
 005E3615    mov         eax,ebx
 005E3617    call        TList.Get
 005E361C    mov         dword ptr [ebp-8],eax
 005E361F    cmp         dword ptr [ebp-8],0
>005E3623    je          005E3683
 005E3625    mov         eax,dword ptr [ebp-8]
 005E3628    cmp         byte ptr [eax+26],0
>005E362C    je          005E3683
 005E362E    xor         eax,eax
 005E3630    push        ebp
 005E3631    push        5E364E
 005E3636    push        dword ptr fs:[eax]
 005E3639    mov         dword ptr fs:[eax],esp
 005E363C    mov         eax,dword ptr [ebp-8]
 005E363F    mov         edx,dword ptr [eax]
 005E3641    call        dword ptr [edx+60]
 005E3644    xor         eax,eax
 005E3646    pop         edx
 005E3647    pop         ecx
 005E3648    pop         ecx
 005E3649    mov         dword ptr fs:[eax],edx
>005E364C    jmp         005E3683
>005E364E    jmp         @HandleOnException
 005E3653    dd          1
 005E3657    dd          00418C04;Exception
 005E365B    dd          005E365F
 005E365F    mov         ebx,eax
 005E3661    mov         eax,dword ptr [ebp-8]
 005E3664    mov         edx,dword ptr [eax+4]
 005E3667    lea         eax,[ebp-10]
 005E366A    mov         ecx,5E36BC;'.StartMonitoring'
 005E366F    call        @UStrCat3
 005E3674    mov         edx,dword ptr [ebp-10]
 005E3677    mov         eax,ebx
 005E3679    call        004FA6EC
 005E367E    call        @DoneExcept
 005E3683    inc         dword ptr [ebp-4]
 005E3686    dec         dword ptr [ebp-0C]
>005E3689    jne         005E360C
 005E368B    xor         eax,eax
 005E368D    pop         edx
 005E368E    pop         ecx
 005E368F    pop         ecx
 005E3690    mov         dword ptr fs:[eax],edx
 005E3693    push        5E36A8
 005E3698    lea         eax,[ebp-10]
 005E369B    call        @UStrClr
 005E36A0    ret
>005E36A1    jmp         @HandleFinally
>005E36A6    jmp         005E3698
 005E36A8    pop         edi
 005E36A9    pop         esi
 005E36AA    pop         ebx
 005E36AB    mov         esp,ebp
 005E36AD    pop         ebp
 005E36AE    ret
*}
end;

//005E36E0
procedure sub_005E36E0;
begin
{*
 005E36E0    push        ebp
 005E36E1    mov         ebp,esp
 005E36E3    add         esp,0FFFFFFF0
 005E36E6    push        ebx
 005E36E7    push        esi
 005E36E8    push        edi
 005E36E9    xor         eax,eax
 005E36EB    mov         dword ptr [ebp-10],eax
 005E36EE    xor         eax,eax
 005E36F0    push        ebp
 005E36F1    push        5E3819
 005E36F6    push        dword ptr fs:[eax]
 005E36F9    mov         dword ptr fs:[eax],esp
 005E36FC    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3701    mov         eax,dword ptr [eax+8]
 005E3704    dec         eax
 005E3705    test        eax,eax
>005E3707    jl          005E3768
 005E3709    inc         eax
 005E370A    mov         dword ptr [ebp-0C],eax
 005E370D    mov         dword ptr [ebp-4],0
 005E3714    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E371A    mov         edx,dword ptr [ebp-4]
 005E371D    mov         eax,ebx
 005E371F    call        TList.Get
 005E3724    mov         dword ptr [ebp-8],eax
 005E3727    cmp         dword ptr [ebp-8],0
>005E372B    je          005E3760
 005E372D    mov         eax,dword ptr [ebp-8]
 005E3730    cmp         byte ptr [eax+27],0
>005E3734    je          005E3760
 005E3736    xor         eax,eax
 005E3738    push        ebp
 005E3739    push        5E3756
 005E373E    push        dword ptr fs:[eax]
 005E3741    mov         dword ptr fs:[eax],esp
 005E3744    mov         eax,dword ptr [ebp-8]
 005E3747    mov         edx,dword ptr [eax]
 005E3749    call        dword ptr [edx+5C]
 005E374C    xor         eax,eax
 005E374E    pop         edx
 005E374F    pop         ecx
 005E3750    pop         ecx
 005E3751    mov         dword ptr fs:[eax],edx
>005E3754    jmp         005E3760
>005E3756    jmp         @HandleAnyException
 005E375B    call        @DoneExcept
 005E3760    inc         dword ptr [ebp-4]
 005E3763    dec         dword ptr [ebp-0C]
>005E3766    jne         005E3714
 005E3768    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E376D    mov         eax,dword ptr [eax+8]
 005E3770    dec         eax
 005E3771    test        eax,eax
>005E3773    jl          005E3803
 005E3779    inc         eax
 005E377A    mov         dword ptr [ebp-0C],eax
 005E377D    mov         dword ptr [ebp-4],0
 005E3784    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E378A    mov         edx,dword ptr [ebp-4]
 005E378D    mov         eax,ebx
 005E378F    call        TList.Get
 005E3794    mov         dword ptr [ebp-8],eax
 005E3797    cmp         dword ptr [ebp-8],0
>005E379B    je          005E37FB
 005E379D    mov         eax,dword ptr [ebp-8]
 005E37A0    cmp         byte ptr [eax+27],0
>005E37A4    je          005E37FB
 005E37A6    xor         eax,eax
 005E37A8    push        ebp
 005E37A9    push        5E37C6
 005E37AE    push        dword ptr fs:[eax]
 005E37B1    mov         dword ptr fs:[eax],esp
 005E37B4    mov         eax,dword ptr [ebp-8]
 005E37B7    mov         edx,dword ptr [eax]
 005E37B9    call        dword ptr [edx+60]
 005E37BC    xor         eax,eax
 005E37BE    pop         edx
 005E37BF    pop         ecx
 005E37C0    pop         ecx
 005E37C1    mov         dword ptr fs:[eax],edx
>005E37C4    jmp         005E37FB
>005E37C6    jmp         @HandleOnException
 005E37CB    dd          1
 005E37CF    dd          00418C04;Exception
 005E37D3    dd          005E37D7
 005E37D7    mov         ebx,eax
 005E37D9    mov         eax,dword ptr [ebp-8]
 005E37DC    mov         edx,dword ptr [eax+4]
 005E37DF    lea         eax,[ebp-10]
 005E37E2    mov         ecx,5E3834;'.StartMonitoring'
 005E37E7    call        @UStrCat3
 005E37EC    mov         edx,dword ptr [ebp-10]
 005E37EF    mov         eax,ebx
 005E37F1    call        004FA6EC
 005E37F6    call        @DoneExcept
 005E37FB    inc         dword ptr [ebp-4]
 005E37FE    dec         dword ptr [ebp-0C]
>005E3801    jne         005E3784
 005E3803    xor         eax,eax
 005E3805    pop         edx
 005E3806    pop         ecx
 005E3807    pop         ecx
 005E3808    mov         dword ptr fs:[eax],edx
 005E380B    push        5E3820
 005E3810    lea         eax,[ebp-10]
 005E3813    call        @UStrClr
 005E3818    ret
>005E3819    jmp         @HandleFinally
>005E381E    jmp         005E3810
 005E3820    pop         edi
 005E3821    pop         esi
 005E3822    pop         ebx
 005E3823    mov         esp,ebp
 005E3825    pop         ebp
 005E3826    ret
*}
end;

//005E3858
procedure sub_005E3858;
begin
{*
 005E3858    push        ebp
 005E3859    mov         ebp,esp
 005E385B    add         esp,0FFFFFFF0
 005E385E    push        ebx
 005E385F    push        esi
 005E3860    push        edi
 005E3861    xor         eax,eax
 005E3863    mov         dword ptr [ebp-10],eax
 005E3866    xor         eax,eax
 005E3868    push        ebp
 005E3869    push        5E3925
 005E386E    push        dword ptr fs:[eax]
 005E3871    mov         dword ptr fs:[eax],esp
 005E3874    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3879    mov         eax,dword ptr [eax+8]
 005E387C    dec         eax
 005E387D    test        eax,eax
>005E387F    jl          005E390F
 005E3885    inc         eax
 005E3886    mov         dword ptr [ebp-0C],eax
 005E3889    mov         dword ptr [ebp-4],0
 005E3890    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3896    mov         edx,dword ptr [ebp-4]
 005E3899    mov         eax,ebx
 005E389B    call        TList.Get
 005E38A0    mov         dword ptr [ebp-8],eax
 005E38A3    cmp         dword ptr [ebp-8],0
>005E38A7    je          005E3907
 005E38A9    mov         eax,dword ptr [ebp-8]
 005E38AC    cmp         byte ptr [eax+26],0
>005E38B0    je          005E3907
 005E38B2    xor         eax,eax
 005E38B4    push        ebp
 005E38B5    push        5E38D2
 005E38BA    push        dword ptr fs:[eax]
 005E38BD    mov         dword ptr fs:[eax],esp
 005E38C0    mov         eax,dword ptr [ebp-8]
 005E38C3    mov         edx,dword ptr [eax]
 005E38C5    call        dword ptr [edx+64]
 005E38C8    xor         eax,eax
 005E38CA    pop         edx
 005E38CB    pop         ecx
 005E38CC    pop         ecx
 005E38CD    mov         dword ptr fs:[eax],edx
>005E38D0    jmp         005E3907
>005E38D2    jmp         @HandleOnException
 005E38D7    dd          1
 005E38DB    dd          00418C04;Exception
 005E38DF    dd          005E38E3
 005E38E3    mov         ebx,eax
 005E38E5    mov         eax,dword ptr [ebp-8]
 005E38E8    mov         edx,dword ptr [eax+4]
 005E38EB    lea         eax,[ebp-10]
 005E38EE    mov         ecx,5E3940;'.StopMonitoring'
 005E38F3    call        @UStrCat3
 005E38F8    mov         edx,dword ptr [ebp-10]
 005E38FB    mov         eax,ebx
 005E38FD    call        004FA6EC
 005E3902    call        @DoneExcept
 005E3907    inc         dword ptr [ebp-4]
 005E390A    dec         dword ptr [ebp-0C]
>005E390D    jne         005E3890
 005E390F    xor         eax,eax
 005E3911    pop         edx
 005E3912    pop         ecx
 005E3913    pop         ecx
 005E3914    mov         dword ptr fs:[eax],edx
 005E3917    push        5E392C
 005E391C    lea         eax,[ebp-10]
 005E391F    call        @UStrClr
 005E3924    ret
>005E3925    jmp         @HandleFinally
>005E392A    jmp         005E391C
 005E392C    pop         edi
 005E392D    pop         esi
 005E392E    pop         ebx
 005E392F    mov         esp,ebp
 005E3931    pop         ebp
 005E3932    ret
*}
end;

//005E3960
procedure sub_005E3960;
begin
{*
 005E3960    push        ebp
 005E3961    mov         ebp,esp
 005E3963    add         esp,0FFFFFFF0
 005E3966    push        ebx
 005E3967    push        esi
 005E3968    push        edi
 005E3969    xor         eax,eax
 005E396B    mov         dword ptr [ebp-10],eax
 005E396E    xor         eax,eax
 005E3970    push        ebp
 005E3971    push        5E3A2D
 005E3976    push        dword ptr fs:[eax]
 005E3979    mov         dword ptr fs:[eax],esp
 005E397C    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3981    mov         eax,dword ptr [eax+8]
 005E3984    dec         eax
 005E3985    test        eax,eax
>005E3987    jl          005E3A17
 005E398D    inc         eax
 005E398E    mov         dword ptr [ebp-0C],eax
 005E3991    mov         dword ptr [ebp-4],0
 005E3998    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E399E    mov         edx,dword ptr [ebp-4]
 005E39A1    mov         eax,ebx
 005E39A3    call        TList.Get
 005E39A8    mov         dword ptr [ebp-8],eax
 005E39AB    cmp         dword ptr [ebp-8],0
>005E39AF    je          005E3A0F
 005E39B1    mov         eax,dword ptr [ebp-8]
 005E39B4    cmp         byte ptr [eax+27],0
>005E39B8    je          005E3A0F
 005E39BA    xor         eax,eax
 005E39BC    push        ebp
 005E39BD    push        5E39DA
 005E39C2    push        dword ptr fs:[eax]
 005E39C5    mov         dword ptr fs:[eax],esp
 005E39C8    mov         eax,dword ptr [ebp-8]
 005E39CB    mov         edx,dword ptr [eax]
 005E39CD    call        dword ptr [edx+64]
 005E39D0    xor         eax,eax
 005E39D2    pop         edx
 005E39D3    pop         ecx
 005E39D4    pop         ecx
 005E39D5    mov         dword ptr fs:[eax],edx
>005E39D8    jmp         005E3A0F
>005E39DA    jmp         @HandleOnException
 005E39DF    dd          1
 005E39E3    dd          00418C04;Exception
 005E39E7    dd          005E39EB
 005E39EB    mov         ebx,eax
 005E39ED    mov         eax,dword ptr [ebp-8]
 005E39F0    mov         edx,dword ptr [eax+4]
 005E39F3    lea         eax,[ebp-10]
 005E39F6    mov         ecx,5E3A48;'.StopMonitoring'
 005E39FB    call        @UStrCat3
 005E3A00    mov         edx,dword ptr [ebp-10]
 005E3A03    mov         eax,ebx
 005E3A05    call        004FA6EC
 005E3A0A    call        @DoneExcept
 005E3A0F    inc         dword ptr [ebp-4]
 005E3A12    dec         dword ptr [ebp-0C]
>005E3A15    jne         005E3998
 005E3A17    xor         eax,eax
 005E3A19    pop         edx
 005E3A1A    pop         ecx
 005E3A1B    pop         ecx
 005E3A1C    mov         dword ptr fs:[eax],edx
 005E3A1F    push        5E3A34
 005E3A24    lea         eax,[ebp-10]
 005E3A27    call        @UStrClr
 005E3A2C    ret
>005E3A2D    jmp         @HandleFinally
>005E3A32    jmp         005E3A24
 005E3A34    pop         edi
 005E3A35    pop         esi
 005E3A36    pop         ebx
 005E3A37    mov         esp,ebp
 005E3A39    pop         ebp
 005E3A3A    ret
*}
end;

//005E3A68
procedure sub_005E3A68;
begin
{*
 005E3A68    push        ebp
 005E3A69    mov         ebp,esp
 005E3A6B    add         esp,0FFFFFFF8
 005E3A6E    push        ebx
 005E3A6F    push        esi
 005E3A70    push        edi
 005E3A71    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3A76    mov         eax,dword ptr [eax+8]
 005E3A79    dec         eax
 005E3A7A    test        eax,eax
>005E3A7C    jl          005E3AB4
 005E3A7E    inc         eax
 005E3A7F    mov         dword ptr [ebp-8],eax
 005E3A82    mov         dword ptr [ebp-4],0
 005E3A89    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3A8F    mov         edx,dword ptr [ebp-4]
 005E3A92    mov         eax,ebx
 005E3A94    call        TList.Get
 005E3A99    mov         esi,eax
 005E3A9B    test        esi,esi
>005E3A9D    je          005E3AAC
 005E3A9F    cmp         byte ptr [esi+26],0
>005E3AA3    je          005E3AAC
 005E3AA5    mov         eax,esi
 005E3AA7    mov         edx,dword ptr [eax]
 005E3AA9    call        dword ptr [edx+38]
 005E3AAC    inc         dword ptr [ebp-4]
 005E3AAF    dec         dword ptr [ebp-8]
>005E3AB2    jne         005E3A89
 005E3AB4    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3AB9    mov         eax,dword ptr [eax+8]
 005E3ABC    dec         eax
 005E3ABD    test        eax,eax
>005E3ABF    jl          005E3B19
 005E3AC1    inc         eax
 005E3AC2    mov         dword ptr [ebp-8],eax
 005E3AC5    mov         dword ptr [ebp-4],0
 005E3ACC    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3AD2    mov         edx,dword ptr [ebp-4]
 005E3AD5    mov         eax,ebx
 005E3AD7    call        TList.Get
 005E3ADC    mov         esi,eax
 005E3ADE    test        esi,esi
>005E3AE0    je          005E3B11
 005E3AE2    cmp         byte ptr [esi+26],0
>005E3AE6    je          005E3B11
 005E3AE8    xor         eax,eax
 005E3AEA    push        ebp
 005E3AEB    push        5E3B07
 005E3AF0    push        dword ptr fs:[eax]
 005E3AF3    mov         dword ptr fs:[eax],esp
 005E3AF6    mov         eax,esi
 005E3AF8    mov         edx,dword ptr [eax]
 005E3AFA    call        dword ptr [edx+68]
 005E3AFD    xor         eax,eax
 005E3AFF    pop         edx
 005E3B00    pop         ecx
 005E3B01    pop         ecx
 005E3B02    mov         dword ptr fs:[eax],edx
>005E3B05    jmp         005E3B11
>005E3B07    jmp         @HandleAnyException
 005E3B0C    call        @DoneExcept
 005E3B11    inc         dword ptr [ebp-4]
 005E3B14    dec         dword ptr [ebp-8]
>005E3B17    jne         005E3ACC
 005E3B19    pop         edi
 005E3B1A    pop         esi
 005E3B1B    pop         ebx
 005E3B1C    pop         ecx
 005E3B1D    pop         ecx
 005E3B1E    pop         ebp
 005E3B1F    ret
*}
end;

//005E3B20
procedure sub_005E3B20;
begin
{*
 005E3B20    push        ebp
 005E3B21    mov         ebp,esp
 005E3B23    add         esp,0FFFFFFF8
 005E3B26    push        ebx
 005E3B27    push        esi
 005E3B28    push        edi
 005E3B29    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3B2E    mov         eax,dword ptr [eax+8]
 005E3B31    dec         eax
 005E3B32    test        eax,eax
>005E3B34    jl          005E3B6C
 005E3B36    inc         eax
 005E3B37    mov         dword ptr [ebp-8],eax
 005E3B3A    mov         dword ptr [ebp-4],0
 005E3B41    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3B47    mov         edx,dword ptr [ebp-4]
 005E3B4A    mov         eax,ebx
 005E3B4C    call        TList.Get
 005E3B51    mov         esi,eax
 005E3B53    test        esi,esi
>005E3B55    je          005E3B64
 005E3B57    cmp         byte ptr [esi+27],0
>005E3B5B    je          005E3B64
 005E3B5D    mov         eax,esi
 005E3B5F    mov         edx,dword ptr [eax]
 005E3B61    call        dword ptr [edx+38]
 005E3B64    inc         dword ptr [ebp-4]
 005E3B67    dec         dword ptr [ebp-8]
>005E3B6A    jne         005E3B41
 005E3B6C    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3B71    mov         eax,dword ptr [eax+8]
 005E3B74    dec         eax
 005E3B75    test        eax,eax
>005E3B77    jl          005E3BD1
 005E3B79    inc         eax
 005E3B7A    mov         dword ptr [ebp-8],eax
 005E3B7D    mov         dword ptr [ebp-4],0
 005E3B84    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3B8A    mov         edx,dword ptr [ebp-4]
 005E3B8D    mov         eax,ebx
 005E3B8F    call        TList.Get
 005E3B94    mov         esi,eax
 005E3B96    test        esi,esi
>005E3B98    je          005E3BC9
 005E3B9A    cmp         byte ptr [esi+27],0
>005E3B9E    je          005E3BC9
 005E3BA0    xor         eax,eax
 005E3BA2    push        ebp
 005E3BA3    push        5E3BBF
 005E3BA8    push        dword ptr fs:[eax]
 005E3BAB    mov         dword ptr fs:[eax],esp
 005E3BAE    mov         eax,esi
 005E3BB0    mov         edx,dword ptr [eax]
 005E3BB2    call        dword ptr [edx+68]
 005E3BB5    xor         eax,eax
 005E3BB7    pop         edx
 005E3BB8    pop         ecx
 005E3BB9    pop         ecx
 005E3BBA    mov         dword ptr fs:[eax],edx
>005E3BBD    jmp         005E3BC9
>005E3BBF    jmp         @HandleAnyException
 005E3BC4    call        @DoneExcept
 005E3BC9    inc         dword ptr [ebp-4]
 005E3BCC    dec         dword ptr [ebp-8]
>005E3BCF    jne         005E3B84
 005E3BD1    pop         edi
 005E3BD2    pop         esi
 005E3BD3    pop         ebx
 005E3BD4    pop         ecx
 005E3BD5    pop         ecx
 005E3BD6    pop         ebp
 005E3BD7    ret
*}
end;

//005E3BD8
{*function sub_005E3BD8(?:UnicodeString):?;
begin
 005E3BD8    push        ebp
 005E3BD9    mov         ebp,esp
 005E3BDB    add         esp,0FFFFFFF8
 005E3BDE    push        ebx
 005E3BDF    push        esi
 005E3BE0    push        edi
 005E3BE1    xor         edx,edx
 005E3BE3    mov         dword ptr [ebp-8],edx
 005E3BE6    mov         dword ptr [ebp-4],eax
 005E3BE9    mov         eax,dword ptr [ebp-4]
 005E3BEC    call        @UStrAddRef
 005E3BF1    xor         eax,eax
 005E3BF3    push        ebp
 005E3BF4    push        5E3C70
 005E3BF9    push        dword ptr fs:[eax]
 005E3BFC    mov         dword ptr fs:[eax],esp
 005E3BFF    xor         ebx,ebx
 005E3C01    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3C06    mov         esi,dword ptr [eax+8]
 005E3C09    dec         esi
 005E3C0A    test        esi,esi
>005E3C0C    jl          005E3C55
 005E3C0E    inc         esi
 005E3C0F    xor         edi,edi
 005E3C11    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3C17    mov         edx,edi
 005E3C19    mov         eax,ebx
 005E3C1B    call        TList.Get
 005E3C20    mov         ebx,eax
 005E3C22    test        ebx,ebx
>005E3C24    je          005E3C4F
 005E3C26    lea         eax,[ebp-8]
 005E3C29    mov         ecx,5E3C8C;'.exists'
 005E3C2E    mov         edx,dword ptr [ebp-4]
 005E3C31    call        @UStrCat3
 005E3C36    mov         edx,dword ptr [ebp-8]
 005E3C39    mov         eax,ebx
 005E3C3B    mov         ecx,dword ptr [eax]
 005E3C3D    call        dword ptr [ecx+10]
 005E3C40    test        al,al
>005E3C42    je          005E3C4F
 005E3C44    mov         eax,ebx
 005E3C46    mov         edx,dword ptr [eax]
 005E3C48    call        dword ptr [edx+18]
 005E3C4B    mov         ebx,eax
>005E3C4D    jmp         005E3C55
 005E3C4F    xor         ebx,ebx
 005E3C51    inc         edi
 005E3C52    dec         esi
>005E3C53    jne         005E3C11
 005E3C55    xor         eax,eax
 005E3C57    pop         edx
 005E3C58    pop         ecx
 005E3C59    pop         ecx
 005E3C5A    mov         dword ptr fs:[eax],edx
 005E3C5D    push        5E3C77
 005E3C62    lea         eax,[ebp-8]
 005E3C65    mov         edx,2
 005E3C6A    call        @UStrArrayClr
 005E3C6F    ret
>005E3C70    jmp         @HandleFinally
>005E3C75    jmp         005E3C62
 005E3C77    mov         eax,ebx
 005E3C79    pop         edi
 005E3C7A    pop         esi
 005E3C7B    pop         ebx
 005E3C7C    pop         ecx
 005E3C7D    pop         ecx
 005E3C7E    pop         ebp
 005E3C7F    ret
end;*}

//005E3C9C
{*function sub_005E3C9C(?:?):?;
begin
 005E3C9C    push        ebp
 005E3C9D    mov         ebp,esp
 005E3C9F    add         esp,0FFFFFFF8
 005E3CA2    push        ebx
 005E3CA3    push        esi
 005E3CA4    push        edi
 005E3CA5    xor         edx,edx
 005E3CA7    mov         dword ptr [ebp-8],edx
 005E3CAA    mov         dword ptr [ebp-4],eax
 005E3CAD    mov         eax,dword ptr [ebp-4]
 005E3CB0    call        @UStrAddRef
 005E3CB5    xor         eax,eax
 005E3CB7    push        ebp
 005E3CB8    push        5E3D34
 005E3CBD    push        dword ptr fs:[eax]
 005E3CC0    mov         dword ptr fs:[eax],esp
 005E3CC3    xor         ebx,ebx
 005E3CC5    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3CCA    mov         esi,dword ptr [eax+8]
 005E3CCD    dec         esi
 005E3CCE    test        esi,esi
>005E3CD0    jl          005E3D19
 005E3CD2    inc         esi
 005E3CD3    xor         edi,edi
 005E3CD5    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3CDB    mov         edx,edi
 005E3CDD    mov         eax,ebx
 005E3CDF    call        TList.Get
 005E3CE4    mov         ebx,eax
 005E3CE6    test        ebx,ebx
>005E3CE8    je          005E3D13
 005E3CEA    lea         eax,[ebp-8]
 005E3CED    mov         ecx,5E3D50;'.exists'
 005E3CF2    mov         edx,dword ptr [ebp-4]
 005E3CF5    call        @UStrCat3
 005E3CFA    mov         edx,dword ptr [ebp-8]
 005E3CFD    mov         eax,ebx
 005E3CFF    mov         ecx,dword ptr [eax]
 005E3D01    call        dword ptr [ecx+10]
 005E3D04    test        al,al
>005E3D06    je          005E3D13
 005E3D08    mov         eax,ebx
 005E3D0A    mov         edx,dword ptr [eax]
 005E3D0C    call        dword ptr [edx+1C]
 005E3D0F    mov         ebx,eax
>005E3D11    jmp         005E3D19
 005E3D13    xor         ebx,ebx
 005E3D15    inc         edi
 005E3D16    dec         esi
>005E3D17    jne         005E3CD5
 005E3D19    xor         eax,eax
 005E3D1B    pop         edx
 005E3D1C    pop         ecx
 005E3D1D    pop         ecx
 005E3D1E    mov         dword ptr fs:[eax],edx
 005E3D21    push        5E3D3B
 005E3D26    lea         eax,[ebp-8]
 005E3D29    mov         edx,2
 005E3D2E    call        @UStrArrayClr
 005E3D33    ret
>005E3D34    jmp         @HandleFinally
>005E3D39    jmp         005E3D26
 005E3D3B    mov         eax,ebx
 005E3D3D    pop         edi
 005E3D3E    pop         esi
 005E3D3F    pop         ebx
 005E3D40    pop         ecx
 005E3D41    pop         ecx
 005E3D42    pop         ebp
 005E3D43    ret
end;*}

//005E3D60
{*function sub_005E3D60(?:?; ?:?; ?:?; ?:?):?;
begin
 005E3D60    push        ebp
 005E3D61    mov         ebp,esp
 005E3D63    add         esp,0FFFFFFEC
 005E3D66    push        ebx
 005E3D67    push        esi
 005E3D68    push        edi
 005E3D69    xor         ebx,ebx
 005E3D6B    mov         dword ptr [ebp-14],ebx
 005E3D6E    mov         dword ptr [ebp-0C],ecx
 005E3D71    mov         dword ptr [ebp-8],edx
 005E3D74    mov         dword ptr [ebp-4],eax
 005E3D77    mov         eax,dword ptr [ebp-4]
 005E3D7A    call        @UStrAddRef
 005E3D7F    xor         eax,eax
 005E3D81    push        ebp
 005E3D82    push        5E3E0D
 005E3D87    push        dword ptr fs:[eax]
 005E3D8A    mov         dword ptr fs:[eax],esp
 005E3D8D    mov         byte ptr [ebp-0D],0
 005E3D91    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3D96    mov         esi,dword ptr [eax+8]
 005E3D99    dec         esi
 005E3D9A    test        esi,esi
>005E3D9C    jl          005E3DEF
 005E3D9E    inc         esi
 005E3D9F    xor         edi,edi
 005E3DA1    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3DA7    mov         edx,edi
 005E3DA9    mov         eax,ebx
 005E3DAB    call        TList.Get
 005E3DB0    mov         ebx,eax
 005E3DB2    test        ebx,ebx
>005E3DB4    je          005E3DEB
 005E3DB6    lea         eax,[ebp-14]
 005E3DB9    mov         ecx,5E3E30;'.exists'
 005E3DBE    mov         edx,dword ptr [ebp-4]
 005E3DC1    call        @UStrCat3
 005E3DC6    mov         edx,dword ptr [ebp-14]
 005E3DC9    mov         eax,ebx
 005E3DCB    mov         ecx,dword ptr [eax]
 005E3DCD    call        dword ptr [ecx+10]
 005E3DD0    test        al,al
>005E3DD2    je          005E3DEB
 005E3DD4    mov         byte ptr [ebp-0D],1
 005E3DD8    mov         eax,dword ptr [ebp+8]
 005E3DDB    push        eax
 005E3DDC    mov         ecx,dword ptr [ebp-0C]
 005E3DDF    mov         edx,dword ptr [ebp-8]
 005E3DE2    mov         eax,ebx
 005E3DE4    mov         ebx,dword ptr [eax]
 005E3DE6    call        dword ptr [ebx+40]
>005E3DE9    jmp         005E3DEF
 005E3DEB    inc         edi
 005E3DEC    dec         esi
>005E3DED    jne         005E3DA1
 005E3DEF    xor         eax,eax
 005E3DF1    pop         edx
 005E3DF2    pop         ecx
 005E3DF3    pop         ecx
 005E3DF4    mov         dword ptr fs:[eax],edx
 005E3DF7    push        5E3E14
 005E3DFC    lea         eax,[ebp-14]
 005E3DFF    call        @UStrClr
 005E3E04    lea         eax,[ebp-4]
 005E3E07    call        @UStrClr
 005E3E0C    ret
>005E3E0D    jmp         @HandleFinally
>005E3E12    jmp         005E3DFC
 005E3E14    movzx       eax,byte ptr [ebp-0D]
 005E3E18    pop         edi
 005E3E19    pop         esi
 005E3E1A    pop         ebx
 005E3E1B    mov         esp,ebp
 005E3E1D    pop         ebp
 005E3E1E    ret         4
end;*}

//005E3E40
procedure sub_005E3E40;
begin
{*
 005E3E40    push        ebp
 005E3E41    mov         ebp,esp
 005E3E43    add         esp,0FFFFFFF0
 005E3E46    push        ebx
 005E3E47    push        esi
 005E3E48    push        edi
 005E3E49    xor         eax,eax
 005E3E4B    mov         dword ptr [ebp-10],eax
 005E3E4E    xor         eax,eax
 005E3E50    push        ebp
 005E3E51    push        5E3F04
 005E3E56    push        dword ptr fs:[eax]
 005E3E59    mov         dword ptr fs:[eax],esp
 005E3E5C    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3E61    mov         eax,dword ptr [eax+8]
 005E3E64    dec         eax
 005E3E65    test        eax,eax
>005E3E67    jl          005E3EEE
 005E3E6D    inc         eax
 005E3E6E    mov         dword ptr [ebp-0C],eax
 005E3E71    mov         dword ptr [ebp-4],0
 005E3E78    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3E7E    mov         edx,dword ptr [ebp-4]
 005E3E81    mov         eax,ebx
 005E3E83    call        TList.Get
 005E3E88    mov         dword ptr [ebp-8],eax
 005E3E8B    xor         eax,eax
 005E3E8D    push        ebp
 005E3E8E    push        5E3EB1
 005E3E93    push        dword ptr fs:[eax]
 005E3E96    mov         dword ptr fs:[eax],esp
 005E3E99    cmp         dword ptr [ebp-8],0
>005E3E9D    je          005E3EA7
 005E3E9F    mov         eax,dword ptr [ebp-8]
 005E3EA2    mov         edx,dword ptr [eax]
 005E3EA4    call        dword ptr [edx+30]
 005E3EA7    xor         eax,eax
 005E3EA9    pop         edx
 005E3EAA    pop         ecx
 005E3EAB    pop         ecx
 005E3EAC    mov         dword ptr fs:[eax],edx
>005E3EAF    jmp         005E3EE6
>005E3EB1    jmp         @HandleOnException
 005E3EB6    dd          1
 005E3EBA    dd          00418C04;Exception
 005E3EBE    dd          005E3EC2
 005E3EC2    mov         ebx,eax
 005E3EC4    mov         eax,dword ptr [ebp-8]
 005E3EC7    mov         edx,dword ptr [eax+4]
 005E3ECA    lea         eax,[ebp-10]
 005E3ECD    mov         ecx,5E3F20;'.StartRuntime'
 005E3ED2    call        @UStrCat3
 005E3ED7    mov         edx,dword ptr [ebp-10]
 005E3EDA    mov         eax,ebx
 005E3EDC    call        004FA6EC
 005E3EE1    call        @DoneExcept
 005E3EE6    inc         dword ptr [ebp-4]
 005E3EE9    dec         dword ptr [ebp-0C]
>005E3EEC    jne         005E3E78
 005E3EEE    xor         eax,eax
 005E3EF0    pop         edx
 005E3EF1    pop         ecx
 005E3EF2    pop         ecx
 005E3EF3    mov         dword ptr fs:[eax],edx
 005E3EF6    push        5E3F0B
 005E3EFB    lea         eax,[ebp-10]
 005E3EFE    call        @UStrClr
 005E3F03    ret
>005E3F04    jmp         @HandleFinally
>005E3F09    jmp         005E3EFB
 005E3F0B    pop         edi
 005E3F0C    pop         esi
 005E3F0D    pop         ebx
 005E3F0E    mov         esp,ebp
 005E3F10    pop         ebp
 005E3F11    ret
*}
end;

//005E3F3C
procedure sub_005E3F3C;
begin
{*
 005E3F3C    push        ebp
 005E3F3D    mov         ebp,esp
 005E3F3F    add         esp,0FFFFFFF0
 005E3F42    push        ebx
 005E3F43    push        esi
 005E3F44    push        edi
 005E3F45    xor         eax,eax
 005E3F47    mov         dword ptr [ebp-10],eax
 005E3F4A    xor         eax,eax
 005E3F4C    push        ebp
 005E3F4D    push        5E4000
 005E3F52    push        dword ptr fs:[eax]
 005E3F55    mov         dword ptr fs:[eax],esp
 005E3F58    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E3F5D    mov         eax,dword ptr [eax+8]
 005E3F60    dec         eax
 005E3F61    test        eax,eax
>005E3F63    jl          005E3FEA
 005E3F69    inc         eax
 005E3F6A    mov         dword ptr [ebp-0C],eax
 005E3F6D    mov         dword ptr [ebp-4],0
 005E3F74    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E3F7A    mov         edx,dword ptr [ebp-4]
 005E3F7D    mov         eax,ebx
 005E3F7F    call        TList.Get
 005E3F84    mov         dword ptr [ebp-8],eax
 005E3F87    xor         eax,eax
 005E3F89    push        ebp
 005E3F8A    push        5E3FAD
 005E3F8F    push        dword ptr fs:[eax]
 005E3F92    mov         dword ptr fs:[eax],esp
 005E3F95    cmp         dword ptr [ebp-8],0
>005E3F99    je          005E3FA3
 005E3F9B    mov         eax,dword ptr [ebp-8]
 005E3F9E    mov         edx,dword ptr [eax]
 005E3FA0    call        dword ptr [edx+34]
 005E3FA3    xor         eax,eax
 005E3FA5    pop         edx
 005E3FA6    pop         ecx
 005E3FA7    pop         ecx
 005E3FA8    mov         dword ptr fs:[eax],edx
>005E3FAB    jmp         005E3FE2
>005E3FAD    jmp         @HandleOnException
 005E3FB2    dd          1
 005E3FB6    dd          00418C04;Exception
 005E3FBA    dd          005E3FBE
 005E3FBE    mov         ebx,eax
 005E3FC0    mov         eax,dword ptr [ebp-8]
 005E3FC3    mov         edx,dword ptr [eax+4]
 005E3FC6    lea         eax,[ebp-10]
 005E3FC9    mov         ecx,5E401C;'.StopRuntime'
 005E3FCE    call        @UStrCat3
 005E3FD3    mov         edx,dword ptr [ebp-10]
 005E3FD6    mov         eax,ebx
 005E3FD8    call        004FA6EC
 005E3FDD    call        @DoneExcept
 005E3FE2    inc         dword ptr [ebp-4]
 005E3FE5    dec         dword ptr [ebp-0C]
>005E3FE8    jne         005E3F74
 005E3FEA    xor         eax,eax
 005E3FEC    pop         edx
 005E3FED    pop         ecx
 005E3FEE    pop         ecx
 005E3FEF    mov         dword ptr fs:[eax],edx
 005E3FF2    push        5E4007
 005E3FF7    lea         eax,[ebp-10]
 005E3FFA    call        @UStrClr
 005E3FFF    ret
>005E4000    jmp         @HandleFinally
>005E4005    jmp         005E3FF7
 005E4007    pop         edi
 005E4008    pop         esi
 005E4009    pop         ebx
 005E400A    mov         esp,ebp
 005E400C    pop         ebp
 005E400D    ret
*}
end;

//005E4038
procedure sub_005E4038;
begin
{*
 005E4038    push        ebp
 005E4039    mov         ebp,esp
 005E403B    add         esp,0FFFFFFF0
 005E403E    push        ebx
 005E403F    push        esi
 005E4040    push        edi
 005E4041    xor         eax,eax
 005E4043    mov         dword ptr [ebp-10],eax
 005E4046    xor         eax,eax
 005E4048    push        ebp
 005E4049    push        5E40FC
 005E404E    push        dword ptr fs:[eax]
 005E4051    mov         dword ptr fs:[eax],esp
 005E4054    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E4059    mov         eax,dword ptr [eax+8]
 005E405C    dec         eax
 005E405D    test        eax,eax
>005E405F    jl          005E40E6
 005E4065    inc         eax
 005E4066    mov         dword ptr [ebp-0C],eax
 005E4069    mov         dword ptr [ebp-4],0
 005E4070    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E4076    mov         edx,dword ptr [ebp-4]
 005E4079    mov         eax,ebx
 005E407B    call        TList.Get
 005E4080    mov         dword ptr [ebp-8],eax
 005E4083    xor         eax,eax
 005E4085    push        ebp
 005E4086    push        5E40A9
 005E408B    push        dword ptr fs:[eax]
 005E408E    mov         dword ptr fs:[eax],esp
 005E4091    cmp         dword ptr [ebp-8],0
>005E4095    je          005E409F
 005E4097    mov         eax,dword ptr [ebp-8]
 005E409A    mov         edx,dword ptr [eax]
 005E409C    call        dword ptr [edx+28]
 005E409F    xor         eax,eax
 005E40A1    pop         edx
 005E40A2    pop         ecx
 005E40A3    pop         ecx
 005E40A4    mov         dword ptr fs:[eax],edx
>005E40A7    jmp         005E40DE
>005E40A9    jmp         @HandleOnException
 005E40AE    dd          1
 005E40B2    dd          00418C04;Exception
 005E40B6    dd          005E40BA
 005E40BA    mov         ebx,eax
 005E40BC    mov         eax,dword ptr [ebp-8]
 005E40BF    mov         edx,dword ptr [eax+4]
 005E40C2    lea         eax,[ebp-10]
 005E40C5    mov         ecx,5E4118;'.StartCompiletime'
 005E40CA    call        @UStrCat3
 005E40CF    mov         edx,dword ptr [ebp-10]
 005E40D2    mov         eax,ebx
 005E40D4    call        004FA6EC
 005E40D9    call        @DoneExcept
 005E40DE    inc         dword ptr [ebp-4]
 005E40E1    dec         dword ptr [ebp-0C]
>005E40E4    jne         005E4070
 005E40E6    xor         eax,eax
 005E40E8    pop         edx
 005E40E9    pop         ecx
 005E40EA    pop         ecx
 005E40EB    mov         dword ptr fs:[eax],edx
 005E40EE    push        5E4103
 005E40F3    lea         eax,[ebp-10]
 005E40F6    call        @UStrClr
 005E40FB    ret
>005E40FC    jmp         @HandleFinally
>005E4101    jmp         005E40F3
 005E4103    pop         edi
 005E4104    pop         esi
 005E4105    pop         ebx
 005E4106    mov         esp,ebp
 005E4108    pop         ebp
 005E4109    ret
*}
end;

//005E413C
procedure sub_005E413C;
begin
{*
 005E413C    push        ebp
 005E413D    mov         ebp,esp
 005E413F    add         esp,0FFFFFFF0
 005E4142    push        ebx
 005E4143    push        esi
 005E4144    push        edi
 005E4145    xor         eax,eax
 005E4147    mov         dword ptr [ebp-10],eax
 005E414A    xor         eax,eax
 005E414C    push        ebp
 005E414D    push        5E4200
 005E4152    push        dword ptr fs:[eax]
 005E4155    mov         dword ptr fs:[eax],esp
 005E4158    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E415D    mov         eax,dword ptr [eax+8]
 005E4160    dec         eax
 005E4161    test        eax,eax
>005E4163    jl          005E41EA
 005E4169    inc         eax
 005E416A    mov         dword ptr [ebp-0C],eax
 005E416D    mov         dword ptr [ebp-4],0
 005E4174    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E417A    mov         edx,dword ptr [ebp-4]
 005E417D    mov         eax,ebx
 005E417F    call        TList.Get
 005E4184    mov         dword ptr [ebp-8],eax
 005E4187    xor         eax,eax
 005E4189    push        ebp
 005E418A    push        5E41AD
 005E418F    push        dword ptr fs:[eax]
 005E4192    mov         dword ptr fs:[eax],esp
 005E4195    cmp         dword ptr [ebp-8],0
>005E4199    je          005E41A3
 005E419B    mov         eax,dword ptr [ebp-8]
 005E419E    mov         edx,dword ptr [eax]
 005E41A0    call        dword ptr [edx+2C]
 005E41A3    xor         eax,eax
 005E41A5    pop         edx
 005E41A6    pop         ecx
 005E41A7    pop         ecx
 005E41A8    mov         dword ptr fs:[eax],edx
>005E41AB    jmp         005E41E2
>005E41AD    jmp         @HandleOnException
 005E41B2    dd          1
 005E41B6    dd          00418C04;Exception
 005E41BA    dd          005E41BE
 005E41BE    mov         ebx,eax
 005E41C0    mov         eax,dword ptr [ebp-8]
 005E41C3    mov         edx,dword ptr [eax+4]
 005E41C6    lea         eax,[ebp-10]
 005E41C9    mov         ecx,5E421C;'.StopCompiletime'
 005E41CE    call        @UStrCat3
 005E41D3    mov         edx,dword ptr [ebp-10]
 005E41D6    mov         eax,ebx
 005E41D8    call        004FA6EC
 005E41DD    call        @DoneExcept
 005E41E2    inc         dword ptr [ebp-4]
 005E41E5    dec         dword ptr [ebp-0C]
>005E41E8    jne         005E4174
 005E41EA    xor         eax,eax
 005E41EC    pop         edx
 005E41ED    pop         ecx
 005E41EE    pop         ecx
 005E41EF    mov         dword ptr fs:[eax],edx
 005E41F2    push        5E4207
 005E41F7    lea         eax,[ebp-10]
 005E41FA    call        @UStrClr
 005E41FF    ret
>005E4200    jmp         @HandleFinally
>005E4205    jmp         005E41F7
 005E4207    pop         edi
 005E4208    pop         esi
 005E4209    pop         ebx
 005E420A    mov         esp,ebp
 005E420C    pop         ebp
 005E420D    ret
*}
end;

//005E4240
procedure sub_005E4240;
begin
{*
 005E4240    push        ebp
 005E4241    mov         ebp,esp
 005E4243    add         esp,0FFFFFFEC
 005E4246    push        ebx
 005E4247    push        esi
 005E4248    push        edi
 005E4249    xor         eax,eax
 005E424B    mov         dword ptr [ebp-14],eax
 005E424E    mov         dword ptr [ebp-10],eax
 005E4251    xor         eax,eax
 005E4253    push        ebp
 005E4254    push        5E439E
 005E4259    push        dword ptr fs:[eax]
 005E425C    mov         dword ptr fs:[eax],esp
 005E425F    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E4264    mov         eax,dword ptr [eax+8]
 005E4267    dec         eax
 005E4268    test        eax,eax
>005E426A    jl          005E42F1
 005E4270    inc         eax
 005E4271    mov         dword ptr [ebp-0C],eax
 005E4274    mov         dword ptr [ebp-4],0
 005E427B    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E4281    mov         edx,dword ptr [ebp-4]
 005E4284    mov         eax,ebx
 005E4286    call        TList.Get
 005E428B    mov         dword ptr [ebp-8],eax
 005E428E    cmp         dword ptr [ebp-8],0
>005E4292    je          005E42E9
 005E4294    xor         eax,eax
 005E4296    push        ebp
 005E4297    push        5E42B4
 005E429C    push        dword ptr fs:[eax]
 005E429F    mov         dword ptr fs:[eax],esp
 005E42A2    mov         eax,dword ptr [ebp-8]
 005E42A5    mov         edx,dword ptr [eax]
 005E42A7    call        dword ptr [edx+38]
 005E42AA    xor         eax,eax
 005E42AC    pop         edx
 005E42AD    pop         ecx
 005E42AE    pop         ecx
 005E42AF    mov         dword ptr fs:[eax],edx
>005E42B2    jmp         005E42E9
>005E42B4    jmp         @HandleOnException
 005E42B9    dd          1
 005E42BD    dd          00418C04;Exception
 005E42C1    dd          005E42C5
 005E42C5    mov         ebx,eax
 005E42C7    mov         eax,dword ptr [ebp-8]
 005E42CA    mov         edx,dword ptr [eax+4]
 005E42CD    lea         eax,[ebp-10]
 005E42D0    mov         ecx,5E43B8;'.ClearRead'
 005E42D5    call        @UStrCat3
 005E42DA    mov         edx,dword ptr [ebp-10]
 005E42DD    mov         eax,ebx
 005E42DF    call        004FA6EC
 005E42E4    call        @DoneExcept
 005E42E9    inc         dword ptr [ebp-4]
 005E42EC    dec         dword ptr [ebp-0C]
>005E42EF    jne         005E427B
 005E42F1    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E42F6    mov         eax,dword ptr [eax+8]
 005E42F9    dec         eax
 005E42FA    test        eax,eax
>005E42FC    jl          005E4383
 005E4302    inc         eax
 005E4303    mov         dword ptr [ebp-0C],eax
 005E4306    mov         dword ptr [ebp-4],0
 005E430D    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E4313    mov         edx,dword ptr [ebp-4]
 005E4316    mov         eax,ebx
 005E4318    call        TList.Get
 005E431D    mov         dword ptr [ebp-8],eax
 005E4320    cmp         dword ptr [ebp-8],0
>005E4324    je          005E437B
 005E4326    xor         eax,eax
 005E4328    push        ebp
 005E4329    push        5E4346
 005E432E    push        dword ptr fs:[eax]
 005E4331    mov         dword ptr fs:[eax],esp
 005E4334    mov         eax,dword ptr [ebp-8]
 005E4337    mov         edx,dword ptr [eax]
 005E4339    call        dword ptr [edx+3C]
 005E433C    xor         eax,eax
 005E433E    pop         edx
 005E433F    pop         ecx
 005E4340    pop         ecx
 005E4341    mov         dword ptr fs:[eax],edx
>005E4344    jmp         005E437B
>005E4346    jmp         @HandleOnException
 005E434B    dd          1
 005E434F    dd          00418C04;Exception
 005E4353    dd          005E4357
 005E4357    mov         ebx,eax
 005E4359    mov         eax,dword ptr [ebp-8]
 005E435C    mov         edx,dword ptr [eax+4]
 005E435F    lea         eax,[ebp-14]
 005E4362    mov         ecx,5E43DC;'.Read'
 005E4367    call        @UStrCat3
 005E436C    mov         edx,dword ptr [ebp-14]
 005E436F    mov         eax,ebx
 005E4371    call        004FA6EC
 005E4376    call        @DoneExcept
 005E437B    inc         dword ptr [ebp-4]
 005E437E    dec         dword ptr [ebp-0C]
>005E4381    jne         005E430D
 005E4383    xor         eax,eax
 005E4385    pop         edx
 005E4386    pop         ecx
 005E4387    pop         ecx
 005E4388    mov         dword ptr fs:[eax],edx
 005E438B    push        5E43A5
 005E4390    lea         eax,[ebp-14]
 005E4393    mov         edx,2
 005E4398    call        @UStrArrayClr
 005E439D    ret
>005E439E    jmp         @HandleFinally
>005E43A3    jmp         005E4390
 005E43A5    pop         edi
 005E43A6    pop         esi
 005E43A7    pop         ebx
 005E43A8    mov         esp,ebp
 005E43AA    pop         ebp
 005E43AB    ret
*}
end;

//005E43E8
procedure sub_005E43E8;
begin
{*
 005E43E8    push        ebp
 005E43E9    mov         ebp,esp
 005E43EB    add         esp,0FFFFFFF0
 005E43EE    push        ebx
 005E43EF    push        esi
 005E43F0    push        edi
 005E43F1    xor         eax,eax
 005E43F3    mov         dword ptr [ebp-10],eax
 005E43F6    xor         eax,eax
 005E43F8    push        ebp
 005E43F9    push        5E44C3
 005E43FE    push        dword ptr fs:[eax]
 005E4401    mov         dword ptr fs:[eax],esp
 005E4404    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E4409    mov         eax,dword ptr [eax+8]
 005E440C    dec         eax
 005E440D    test        eax,eax
>005E440F    jl          005E44AD
 005E4415    inc         eax
 005E4416    mov         dword ptr [ebp-0C],eax
 005E4419    mov         dword ptr [ebp-4],0
 005E4420    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E4426    mov         edx,dword ptr [ebp-4]
 005E4429    mov         eax,ebx
 005E442B    call        TList.Get
 005E4430    mov         dword ptr [ebp-8],eax
 005E4433    xor         eax,eax
 005E4435    push        ebp
 005E4436    push        5E446C
 005E443B    push        dword ptr fs:[eax]
 005E443E    mov         dword ptr fs:[eax],esp
 005E4441    cmp         dword ptr [ebp-8],0
>005E4445    je          005E4462
 005E4447    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 005E444C    mov         eax,dword ptr [eax]
 005E444E    mov         eax,dword ptr [eax+388]
 005E4454    mov         edx,dword ptr [eax+2A0]
 005E445A    mov         eax,dword ptr [ebp-8]
 005E445D    mov         ecx,dword ptr [eax]
 005E445F    call        dword ptr [ecx+4C]
 005E4462    xor         eax,eax
 005E4464    pop         edx
 005E4465    pop         ecx
 005E4466    pop         ecx
 005E4467    mov         dword ptr fs:[eax],edx
>005E446A    jmp         005E44A1
>005E446C    jmp         @HandleOnException
 005E4471    dd          1
 005E4475    dd          00418C04;Exception
 005E4479    dd          005E447D
 005E447D    mov         ebx,eax
 005E447F    mov         eax,dword ptr [ebp-8]
 005E4482    mov         edx,dword ptr [eax+4]
 005E4485    lea         eax,[ebp-10]
 005E4488    mov         ecx,5E44E0;'.Diagnose'
 005E448D    call        @UStrCat3
 005E4492    mov         edx,dword ptr [ebp-10]
 005E4495    mov         eax,ebx
 005E4497    call        004FA6EC
 005E449C    call        @DoneExcept
 005E44A1    inc         dword ptr [ebp-4]
 005E44A4    dec         dword ptr [ebp-0C]
>005E44A7    jne         005E4420
 005E44AD    xor         eax,eax
 005E44AF    pop         edx
 005E44B0    pop         ecx
 005E44B1    pop         ecx
 005E44B2    mov         dword ptr fs:[eax],edx
 005E44B5    push        5E44CA
 005E44BA    lea         eax,[ebp-10]
 005E44BD    call        @UStrClr
 005E44C2    ret
>005E44C3    jmp         @HandleFinally
>005E44C8    jmp         005E44BA
 005E44CA    pop         edi
 005E44CB    pop         esi
 005E44CC    pop         ebx
 005E44CD    mov         esp,ebp
 005E44CF    pop         ebp
 005E44D0    ret
*}
end;

//005E44F4
{*function sub_005E44F4(?:UnicodeString):?;
begin
 005E44F4    push        ebp
 005E44F5    mov         ebp,esp
 005E44F7    add         esp,0FFFFFFF8
 005E44FA    push        ebx
 005E44FB    push        esi
 005E44FC    push        edi
 005E44FD    mov         dword ptr [ebp-4],eax
 005E4500    mov         eax,dword ptr [ebp-4]
 005E4503    call        @UStrAddRef
 005E4508    xor         eax,eax
 005E450A    push        ebp
 005E450B    push        5E457B
 005E4510    push        dword ptr fs:[eax]
 005E4513    mov         dword ptr fs:[eax],esp
 005E4516    xor         eax,eax
 005E4518    mov         dword ptr [ebp-8],eax
 005E451B    mov         eax,[008161E0];gvar_008161E0:TObjectList
 005E4520    mov         esi,dword ptr [eax+8]
 005E4523    dec         esi
 005E4524    test        esi,esi
>005E4526    jl          005E4565
 005E4528    inc         esi
 005E4529    xor         edi,edi
 005E452B    mov         ebx,dword ptr ds:[8161E0];gvar_008161E0:TObjectList
 005E4531    mov         edx,edi
 005E4533    mov         eax,ebx
 005E4535    call        TList.Get
 005E453A    mov         ebx,eax
 005E453C    test        ebx,ebx
>005E453E    je          005E4561
 005E4540    mov         edx,dword ptr [ebp-4]
 005E4543    mov         eax,ebx
 005E4545    mov         ecx,dword ptr [eax]
 005E4547    call        dword ptr [ecx+10]
 005E454A    test        al,al
>005E454C    je          005E4561
 005E454E    mov         edx,dword ptr [ebp-4]
 005E4551    mov         eax,ebx
 005E4553    mov         ecx,dword ptr [eax]
 005E4555    call        dword ptr [ecx+14]
 005E4558    mov         dword ptr [ebp-8],eax
 005E455B    cmp         dword ptr [ebp-8],0
>005E455F    jne         005E4565
 005E4561    inc         edi
 005E4562    dec         esi
>005E4563    jne         005E452B
 005E4565    xor         eax,eax
 005E4567    pop         edx
 005E4568    pop         ecx
 005E4569    pop         ecx
 005E456A    mov         dword ptr fs:[eax],edx
 005E456D    push        5E4582
 005E4572    lea         eax,[ebp-4]
 005E4575    call        @UStrClr
 005E457A    ret
>005E457B    jmp         @HandleFinally
>005E4580    jmp         005E4572
 005E4582    mov         eax,dword ptr [ebp-8]
 005E4585    pop         edi
 005E4586    pop         esi
 005E4587    pop         ebx
 005E4588    pop         ecx
 005E4589    pop         ecx
 005E458A    pop         ebp
 005E458B    ret
end;*}

//005E458C
procedure TPieModule.AddFields;
begin
{*
 005E458C    ret
*}
end;

//005E4590
procedure TPieModule.ClearRead;
begin
{*
 005E4590    ret
*}
end;

//005E4594
{*constructor sub_005E4594(?:?; ?:?; ?:?; ?:?);
begin
 005E4594    push        ebp
 005E4595    mov         ebp,esp
 005E4597    push        0
 005E4599    push        0
 005E459B    push        0
 005E459D    push        0
 005E459F    push        0
 005E45A1    push        0
 005E45A3    push        0
 005E45A5    push        ebx
 005E45A6    push        esi
 005E45A7    push        edi
 005E45A8    test        dl,dl
>005E45AA    je          005E45B4
 005E45AC    add         esp,0FFFFFFF0
 005E45AF    call        @ClassCreate
 005E45B4    mov         dword ptr [ebp-4],ecx
 005E45B7    mov         byte ptr [ebp-5],dl
 005E45BA    mov         ebx,eax
 005E45BC    mov         eax,dword ptr [ebp-4]
 005E45BF    call        @UStrAddRef
 005E45C4    mov         eax,dword ptr [ebp+14]
 005E45C7    call        @UStrAddRef
 005E45CC    mov         eax,dword ptr [ebp+10]
 005E45CF    call        @UStrAddRef
 005E45D4    mov         eax,dword ptr [ebp+0C]
 005E45D7    call        @UStrAddRef
 005E45DC    mov         eax,dword ptr [ebp+8]
 005E45DF    call        @UStrAddRef
 005E45E4    xor         eax,eax
 005E45E6    push        ebp
 005E45E7    push        5E47F7
 005E45EC    push        dword ptr fs:[eax]
 005E45EF    mov         dword ptr fs:[eax],esp
 005E45F2    mov         dl,1
 005E45F4    mov         eax,[0043C7BC];TStringList
 005E45F9    call        TStringList.Create;TStringList.Create
 005E45FE    mov         esi,eax
 005E4600    mov         dword ptr [ebx+2C],esi
 005E4603    mov         eax,esi
 005E4605    xor         edx,edx
 005E4607    call        TStringList.SetCaseSensitive
 005E460C    mov         eax,dword ptr [ebx+2C]
 005E460F    mov         dl,1
 005E4611    call        TStringList.SetSorted
 005E4616    mov         eax,dword ptr [ebx+2C]
 005E4619    mov         byte ptr [eax+39],0
 005E461D    mov         dl,1
 005E461F    mov         eax,[0043C7BC];TStringList
 005E4624    call        TStringList.Create;TStringList.Create
 005E4629    mov         esi,eax
 005E462B    mov         dword ptr [ebx+30],esi
 005E462E    mov         eax,esi
 005E4630    xor         edx,edx
 005E4632    call        TStringList.SetCaseSensitive
 005E4637    mov         eax,dword ptr [ebx+30]
 005E463A    mov         dl,1
 005E463C    call        TStringList.SetSorted
 005E4641    mov         eax,dword ptr [ebx+30]
 005E4644    mov         byte ptr [eax+39],0
 005E4648    lea         eax,[ebx+4]
 005E464B    mov         edx,dword ptr [ebp-4]
 005E464E    call        @UStrAsg
 005E4653    cmp         dword ptr [ebp+14],0
>005E4657    jne         005E4668
 005E4659    lea         eax,[ebx+0C]
 005E465C    mov         edx,5E482C;'*'
 005E4661    call        @UStrAsg
>005E4666    jmp         005E4673
 005E4668    lea         eax,[ebx+0C]
 005E466B    mov         edx,dword ptr [ebp+14]
 005E466E    call        @UStrAsg
 005E4673    cmp         dword ptr [ebp+10],0
>005E4677    jne         005E4688
 005E4679    lea         eax,[ebx+10]
 005E467C    mov         edx,5E482C;'*'
 005E4681    call        @UStrAsg
>005E4686    jmp         005E4693
 005E4688    lea         eax,[ebx+10]
 005E468B    mov         edx,dword ptr [ebp+10]
 005E468E    call        @UStrAsg
 005E4693    cmp         dword ptr [ebp+0C],0
>005E4697    jne         005E46A8
 005E4699    lea         eax,[ebx+14]
 005E469C    mov         edx,5E482C;'*'
 005E46A1    call        @UStrAsg
>005E46A6    jmp         005E46B3
 005E46A8    lea         eax,[ebx+14]
 005E46AB    mov         edx,dword ptr [ebp+0C]
 005E46AE    call        @UStrAsg
 005E46B3    cmp         dword ptr [ebp+8],0
>005E46B7    jne         005E46C8
 005E46B9    lea         eax,[ebx+18]
 005E46BC    mov         edx,5E482C;'*'
 005E46C1    call        @UStrAsg
>005E46C6    jmp         005E46D3
 005E46C8    lea         eax,[ebx+18]
 005E46CB    mov         edx,dword ptr [ebp+8]
 005E46CE    call        @UStrAsg
 005E46D3    mov         dl,1
 005E46D5    mov         eax,[0043C7BC];TStringList
 005E46DA    call        TStringList.Create;TStringList.Create
 005E46DF    mov         esi,eax
 005E46E1    mov         dl,1
 005E46E3    mov         eax,esi
 005E46E5    call        TStringList.SetSorted
 005E46EA    mov         byte ptr [esi+39],1;TStringList.FDuplicates:TDuplicates
 005E46EE    mov         edx,dword ptr [ebp-4]
 005E46F1    mov         eax,esi
 005E46F3    mov         ecx,dword ptr [eax]
 005E46F5    call        dword ptr [ecx+38];TStringList.Add
 005E46F8    mov         edx,dword ptr [ebx+0C]
 005E46FB    mov         eax,esi
 005E46FD    mov         ecx,dword ptr [eax]
 005E46FF    call        dword ptr [ecx+38];TStringList.Add
 005E4702    mov         edx,dword ptr [ebx+10]
 005E4705    mov         eax,esi
 005E4707    mov         ecx,dword ptr [eax]
 005E4709    call        dword ptr [ecx+38];TStringList.Add
 005E470C    mov         edx,dword ptr [ebx+14]
 005E470F    mov         eax,esi
 005E4711    mov         ecx,dword ptr [eax]
 005E4713    call        dword ptr [ecx+38];TStringList.Add
 005E4716    mov         edx,dword ptr [ebx+18]
 005E4719    mov         eax,esi
 005E471B    mov         ecx,dword ptr [eax]
 005E471D    call        dword ptr [ecx+38];TStringList.Add
 005E4720    lea         ecx,[ebp-0C]
 005E4723    mov         edx,4
 005E4728    mov         eax,esi
 005E472A    mov         edi,dword ptr [eax]
 005E472C    call        dword ptr [edi+0C];TStringList.Get
 005E472F    mov         edx,dword ptr [ebp-0C]
 005E4732    lea         eax,[ebx+8]
 005E4735    call        @UStrAsg
 005E473A    lea         ecx,[ebp-10]
 005E473D    mov         edx,3
 005E4742    mov         eax,esi
 005E4744    mov         edi,dword ptr [eax]
 005E4746    call        dword ptr [edi+0C];TStringList.Get
 005E4749    mov         edx,dword ptr [ebp-10]
 005E474C    lea         eax,[ebx+0C]
 005E474F    call        @UStrAsg
 005E4754    lea         ecx,[ebp-14]
 005E4757    mov         edx,2
 005E475C    mov         eax,esi
 005E475E    mov         edi,dword ptr [eax]
 005E4760    call        dword ptr [edi+0C];TStringList.Get
 005E4763    mov         edx,dword ptr [ebp-14]
 005E4766    lea         eax,[ebx+10]
 005E4769    call        @UStrAsg
 005E476E    lea         ecx,[ebp-18]
 005E4771    mov         edx,1
 005E4776    mov         eax,esi
 005E4778    mov         edi,dword ptr [eax]
 005E477A    call        dword ptr [edi+0C];TStringList.Get
 005E477D    mov         edx,dword ptr [ebp-18]
 005E4780    lea         eax,[ebx+14]
 005E4783    call        @UStrAsg
 005E4788    lea         ecx,[ebp-1C]
 005E478B    xor         edx,edx
 005E478D    mov         eax,esi
 005E478F    mov         edi,dword ptr [eax]
 005E4791    call        dword ptr [edi+0C];TStringList.Get
 005E4794    mov         edx,dword ptr [ebp-1C]
 005E4797    lea         eax,[ebx+18]
 005E479A    call        @UStrAsg
 005E479F    mov         eax,esi
 005E47A1    call        TObject.Free
 005E47A6    mov         byte ptr [ebx+24],0
 005E47AA    mov         dl,1
 005E47AC    mov         eax,[0067D4A4];THashTable
 005E47B1    call        THashTable.Create;THashTable.Create
 005E47B6    mov         dword ptr [ebx+1C],eax
 005E47B9    mov         eax,ebx
 005E47BB    mov         edx,dword ptr [eax]
 005E47BD    call        dword ptr [edx+24]
 005E47C0    mov         dword ptr [ebx+20],1F4
 005E47C7    xor         eax,eax
 005E47C9    pop         edx
 005E47CA    pop         ecx
 005E47CB    pop         ecx
 005E47CC    mov         dword ptr fs:[eax],edx
 005E47CF    push        5E47FE
 005E47D4    lea         eax,[ebp-1C]
 005E47D7    mov         edx,5
 005E47DC    call        @UStrArrayClr
 005E47E1    lea         eax,[ebp-4]
 005E47E4    call        @UStrClr
 005E47E9    lea         eax,[ebp+8]
 005E47EC    mov         edx,4
 005E47F1    call        @UStrArrayClr
 005E47F6    ret
>005E47F7    jmp         @HandleFinally
>005E47FC    jmp         005E47D4
 005E47FE    mov         eax,ebx
 005E4800    cmp         byte ptr [ebp-5],0
>005E4804    je          005E4815
 005E4806    call        @AfterConstruction
 005E480B    pop         dword ptr fs:[0]
 005E4812    add         esp,0C
 005E4815    mov         eax,ebx
 005E4817    pop         edi
 005E4818    pop         esi
 005E4819    pop         ebx
 005E481A    mov         esp,ebp
 005E481C    pop         ebp
 005E481D    ret         10
end;*}

//005E4830
{*constructor sub_005E4830(?:?; ?:?; ?:?; ?:?);
begin
 005E4830    push        ebp
 005E4831    mov         ebp,esp
 005E4833    push        ecx
 005E4834    push        ebx
 005E4835    push        esi
 005E4836    test        dl,dl
>005E4838    je          005E4842
 005E483A    add         esp,0FFFFFFF0
 005E483D    call        @ClassCreate
 005E4842    mov         dword ptr [ebp-4],ecx
 005E4845    mov         ebx,edx
 005E4847    mov         esi,eax
 005E4849    mov         eax,dword ptr [ebp-4]
 005E484C    call        @UStrAddRef
 005E4851    mov         eax,dword ptr [ebp+14]
 005E4854    call        @UStrAddRef
 005E4859    mov         eax,dword ptr [ebp+10]
 005E485C    call        @UStrAddRef
 005E4861    mov         eax,dword ptr [ebp+0C]
 005E4864    call        @UStrAddRef
 005E4869    mov         eax,dword ptr [ebp+8]
 005E486C    call        @UStrAddRef
 005E4871    xor         eax,eax
 005E4873    push        ebp
 005E4874    push        5E48C6
 005E4879    push        dword ptr fs:[eax]
 005E487C    mov         dword ptr fs:[eax],esp
 005E487F    mov         eax,dword ptr [ebp+14]
 005E4882    push        eax
 005E4883    mov         eax,dword ptr [ebp+10]
 005E4886    push        eax
 005E4887    mov         eax,dword ptr [ebp+0C]
 005E488A    push        eax
 005E488B    mov         eax,dword ptr [ebp+8]
 005E488E    push        eax
 005E488F    mov         ecx,dword ptr [ebp-4]
 005E4892    xor         edx,edx
 005E4894    mov         eax,esi
 005E4896    call        005E4594
 005E489B    mov         byte ptr [esi+26],1
 005E489F    mov         byte ptr [esi+27],0
 005E48A3    xor         eax,eax
 005E48A5    pop         edx
 005E48A6    pop         ecx
 005E48A7    pop         ecx
 005E48A8    mov         dword ptr fs:[eax],edx
 005E48AB    push        5E48CD
 005E48B0    lea         eax,[ebp-4]
 005E48B3    call        @UStrClr
 005E48B8    lea         eax,[ebp+8]
 005E48BB    mov         edx,4
 005E48C0    call        @UStrArrayClr
 005E48C5    ret
>005E48C6    jmp         @HandleFinally
>005E48CB    jmp         005E48B0
 005E48CD    mov         eax,esi
 005E48CF    test        bl,bl
>005E48D1    je          005E48E2
 005E48D3    call        @AfterConstruction
 005E48D8    pop         dword ptr fs:[0]
 005E48DF    add         esp,0C
 005E48E2    mov         eax,esi
 005E48E4    pop         esi
 005E48E5    pop         ebx
 005E48E6    pop         ecx
 005E48E7    pop         ebp
 005E48E8    ret         10
end;*}

//005E48EC
{*constructor sub_005E48EC(?:?; ?:?; ?:?; ?:?);
begin
 005E48EC    push        ebp
 005E48ED    mov         ebp,esp
 005E48EF    push        ecx
 005E48F0    push        ebx
 005E48F1    push        esi
 005E48F2    test        dl,dl
>005E48F4    je          005E48FE
 005E48F6    add         esp,0FFFFFFF0
 005E48F9    call        @ClassCreate
 005E48FE    mov         dword ptr [ebp-4],ecx
 005E4901    mov         ebx,edx
 005E4903    mov         esi,eax
 005E4905    mov         eax,dword ptr [ebp-4]
 005E4908    call        @UStrAddRef
 005E490D    mov         eax,dword ptr [ebp+14]
 005E4910    call        @UStrAddRef
 005E4915    mov         eax,dword ptr [ebp+10]
 005E4918    call        @UStrAddRef
 005E491D    mov         eax,dword ptr [ebp+0C]
 005E4920    call        @UStrAddRef
 005E4925    mov         eax,dword ptr [ebp+8]
 005E4928    call        @UStrAddRef
 005E492D    xor         eax,eax
 005E492F    push        ebp
 005E4930    push        5E4982
 005E4935    push        dword ptr fs:[eax]
 005E4938    mov         dword ptr fs:[eax],esp
 005E493B    mov         eax,dword ptr [ebp+14]
 005E493E    push        eax
 005E493F    mov         eax,dword ptr [ebp+10]
 005E4942    push        eax
 005E4943    mov         eax,dword ptr [ebp+0C]
 005E4946    push        eax
 005E4947    mov         eax,dword ptr [ebp+8]
 005E494A    push        eax
 005E494B    mov         ecx,dword ptr [ebp-4]
 005E494E    xor         edx,edx
 005E4950    mov         eax,esi
 005E4952    call        005E4594
 005E4957    mov         byte ptr [esi+26],1
 005E495B    mov         byte ptr [esi+27],1
 005E495F    xor         eax,eax
 005E4961    pop         edx
 005E4962    pop         ecx
 005E4963    pop         ecx
 005E4964    mov         dword ptr fs:[eax],edx
 005E4967    push        5E4989
 005E496C    lea         eax,[ebp-4]
 005E496F    call        @UStrClr
 005E4974    lea         eax,[ebp+8]
 005E4977    mov         edx,4
 005E497C    call        @UStrArrayClr
 005E4981    ret
>005E4982    jmp         @HandleFinally
>005E4987    jmp         005E496C
 005E4989    mov         eax,esi
 005E498B    test        bl,bl
>005E498D    je          005E499E
 005E498F    call        @AfterConstruction
 005E4994    pop         dword ptr fs:[0]
 005E499B    add         esp,0C
 005E499E    mov         eax,esi
 005E49A0    pop         esi
 005E49A1    pop         ebx
 005E49A2    pop         ecx
 005E49A3    pop         ebp
 005E49A4    ret         10
end;*}

//005E49A8
{*constructor sub_005E49A8(?:?; ?:?; ?:?; ?:?);
begin
 005E49A8    push        ebp
 005E49A9    mov         ebp,esp
 005E49AB    push        ecx
 005E49AC    push        ebx
 005E49AD    push        esi
 005E49AE    test        dl,dl
>005E49B0    je          005E49BA
 005E49B2    add         esp,0FFFFFFF0
 005E49B5    call        @ClassCreate
 005E49BA    mov         dword ptr [ebp-4],ecx
 005E49BD    mov         ebx,edx
 005E49BF    mov         esi,eax
 005E49C1    mov         eax,dword ptr [ebp-4]
 005E49C4    call        @UStrAddRef
 005E49C9    mov         eax,dword ptr [ebp+14]
 005E49CC    call        @UStrAddRef
 005E49D1    mov         eax,dword ptr [ebp+10]
 005E49D4    call        @UStrAddRef
 005E49D9    mov         eax,dword ptr [ebp+0C]
 005E49DC    call        @UStrAddRef
 005E49E1    mov         eax,dword ptr [ebp+8]
 005E49E4    call        @UStrAddRef
 005E49E9    xor         eax,eax
 005E49EB    push        ebp
 005E49EC    push        5E4A3E
 005E49F1    push        dword ptr fs:[eax]
 005E49F4    mov         dword ptr fs:[eax],esp
 005E49F7    mov         eax,dword ptr [ebp+14]
 005E49FA    push        eax
 005E49FB    mov         eax,dword ptr [ebp+10]
 005E49FE    push        eax
 005E49FF    mov         eax,dword ptr [ebp+0C]
 005E4A02    push        eax
 005E4A03    mov         eax,dword ptr [ebp+8]
 005E4A06    push        eax
 005E4A07    mov         ecx,dword ptr [ebp-4]
 005E4A0A    xor         edx,edx
 005E4A0C    mov         eax,esi
 005E4A0E    call        005E4594
 005E4A13    mov         byte ptr [esi+26],0
 005E4A17    mov         byte ptr [esi+27],1
 005E4A1B    xor         eax,eax
 005E4A1D    pop         edx
 005E4A1E    pop         ecx
 005E4A1F    pop         ecx
 005E4A20    mov         dword ptr fs:[eax],edx
 005E4A23    push        5E4A45
 005E4A28    lea         eax,[ebp-4]
 005E4A2B    call        @UStrClr
 005E4A30    lea         eax,[ebp+8]
 005E4A33    mov         edx,4
 005E4A38    call        @UStrArrayClr
 005E4A3D    ret
>005E4A3E    jmp         @HandleFinally
>005E4A43    jmp         005E4A28
 005E4A45    mov         eax,esi
 005E4A47    test        bl,bl
>005E4A49    je          005E4A5A
 005E4A4B    call        @AfterConstruction
 005E4A50    pop         dword ptr fs:[0]
 005E4A57    add         esp,0C
 005E4A5A    mov         eax,esi
 005E4A5C    pop         esi
 005E4A5D    pop         ebx
 005E4A5E    pop         ecx
 005E4A5F    pop         ebp
 005E4A60    ret         10
end;*}

//005E4A64
function TPieModule.CreateValue(Identifier:string):TExpression;
begin
{*
 005E4A64    push        ebp
 005E4A65    mov         ebp,esp
 005E4A67    push        ebx
 005E4A68    mov         ebx,eax
 005E4A6A    xor         eax,eax
 005E4A6C    push        ebp
 005E4A6D    push        5E4A8C
 005E4A72    push        dword ptr fs:[eax]
 005E4A75    mov         dword ptr fs:[eax],esp
 005E4A78    mov         byte ptr [ebx+24],1;TPieModule.Used:Boolean
 005E4A7C    xor         ebx,ebx
 005E4A7E    xor         eax,eax
 005E4A80    pop         edx
 005E4A81    pop         ecx
 005E4A82    pop         ecx
 005E4A83    mov         dword ptr fs:[eax],edx
 005E4A86    push        5E4A93
 005E4A8B    ret
>005E4A8C    jmp         @HandleFinally
>005E4A91    jmp         005E4A8B
 005E4A93    mov         eax,ebx
 005E4A95    pop         ebx
 005E4A96    pop         ebp
 005E4A97    ret
*}
end;

//005E4A98
destructor TPieModule.Destroy();
begin
{*
 005E4A98    push        ebx
 005E4A99    push        esi
 005E4A9A    call        @BeforeDestruction
 005E4A9F    mov         ebx,edx
 005E4AA1    mov         esi,eax
 005E4AA3    mov         eax,dword ptr [esi+1C];TPieModule.Fields:THashTable
 005E4AA6    call        TObject.Free
 005E4AAB    mov         edx,ebx
 005E4AAD    and         dl,0FC
 005E4AB0    mov         eax,esi
 005E4AB2    call        TMemoryStream.Destroy
 005E4AB7    test        bl,bl
>005E4AB9    jle         005E4AC2
 005E4ABB    mov         eax,esi
 005E4ABD    call        @ClassDestroy
 005E4AC2    pop         esi
 005E4AC3    pop         ebx
 005E4AC4    ret
*}
end;

//005E4AC8
procedure TPieModule.Diagnose(L:TStrings);
begin
{*
 005E4AC8    push        ebp
 005E4AC9    mov         ebp,esp
 005E4ACB    push        0
 005E4ACD    push        0
 005E4ACF    push        ebx
 005E4AD0    push        esi
 005E4AD1    mov         esi,edx
 005E4AD3    mov         ebx,eax
 005E4AD5    xor         eax,eax
 005E4AD7    push        ebp
 005E4AD8    push        5E4B34
 005E4ADD    push        dword ptr fs:[eax]
 005E4AE0    mov         dword ptr fs:[eax],esp
 005E4AE3    push        5E4B50;'===== Module: '
 005E4AE8    push        dword ptr [ebx+4];TPieModule.Name:string
 005E4AEB    push        5E4B7C;' ('
 005E4AF0    lea         edx,[ebp-8]
 005E4AF3    mov         eax,dword ptr [ebx]
 005E4AF5    call        TObject.ClassName
 005E4AFA    push        dword ptr [ebp-8]
 005E4AFD    push        5E4B90;') ====='
 005E4B02    lea         eax,[ebp-4]
 005E4B05    mov         edx,5
 005E4B0A    call        @UStrCatN
 005E4B0F    mov         edx,dword ptr [ebp-4]
 005E4B12    mov         eax,esi
 005E4B14    mov         ecx,dword ptr [eax]
 005E4B16    call        dword ptr [ecx+38];TStrings.Add
 005E4B19    xor         eax,eax
 005E4B1B    pop         edx
 005E4B1C    pop         ecx
 005E4B1D    pop         ecx
 005E4B1E    mov         dword ptr fs:[eax],edx
 005E4B21    push        5E4B3B
 005E4B26    lea         eax,[ebp-8]
 005E4B29    mov         edx,2
 005E4B2E    call        @UStrArrayClr
 005E4B33    ret
>005E4B34    jmp         @HandleFinally
>005E4B39    jmp         005E4B26
 005E4B3B    pop         esi
 005E4B3C    pop         ebx
 005E4B3D    pop         ecx
 005E4B3E    pop         ecx
 005E4B3F    pop         ebp
 005E4B40    ret
*}
end;

//005E4BA0
function TPieModule.GetAllFields:TStringList;
begin
{*
 005E4BA0    push        ebp
 005E4BA1    mov         ebp,esp
 005E4BA3    add         esp,0FFFFFFF4
 005E4BA6    push        ebx
 005E4BA7    push        esi
 005E4BA8    push        edi
 005E4BA9    xor         edx,edx
 005E4BAB    mov         dword ptr [ebp-0C],edx
 005E4BAE    mov         dword ptr [ebp-4],eax
 005E4BB1    xor         eax,eax
 005E4BB3    push        ebp
 005E4BB4    push        5E4C2F
 005E4BB9    push        dword ptr fs:[eax]
 005E4BBC    mov         dword ptr fs:[eax],esp
 005E4BBF    mov         dl,1
 005E4BC1    mov         eax,[0043C7BC];TStringList
 005E4BC6    call        TStringList.Create;TStringList.Create
 005E4BCB    mov         dword ptr [ebp-8],eax
 005E4BCE    mov         dl,1
 005E4BD0    mov         eax,dword ptr [ebp-8]
 005E4BD3    call        TStringList.SetSorted
 005E4BD8    mov         eax,dword ptr [ebp-8]
 005E4BDB    mov         byte ptr [eax+39],0;TStringList.FDuplicates:TDuplicates
 005E4BDF    mov         eax,dword ptr [ebp-4]
 005E4BE2    mov         eax,dword ptr [eax+1C];TPieModule.Fields:THashTable
 005E4BE5    mov         eax,dword ptr [eax+4];THashTable....................................L:THashedStringList
 005E4BE8    mov         edx,dword ptr [eax]
 005E4BEA    call        dword ptr [edx+14];TStringList.GetCount
 005E4BED    mov         ebx,eax
 005E4BEF    dec         ebx
 005E4BF0    test        ebx,ebx
>005E4BF2    jl          005E4C19
 005E4BF4    inc         ebx
 005E4BF5    xor         esi,esi
 005E4BF7    lea         ecx,[ebp-0C]
 005E4BFA    mov         eax,dword ptr [ebp-4]
 005E4BFD    mov         eax,dword ptr [eax+1C];TPieModule.Fields:THashTable
 005E4C00    mov         eax,dword ptr [eax+4];THashTable.....................................L:THashedStringList
 005E4C03    mov         edx,esi
 005E4C05    mov         edi,dword ptr [eax]
 005E4C07    call        dword ptr [edi+0C];TStringList.Get
 005E4C0A    mov         edx,dword ptr [ebp-0C]
 005E4C0D    mov         eax,dword ptr [ebp-8]
 005E4C10    mov         ecx,dword ptr [eax]
 005E4C12    call        dword ptr [ecx+38];TStringList.Add
 005E4C15    inc         esi
 005E4C16    dec         ebx
>005E4C17    jne         005E4BF7
 005E4C19    xor         eax,eax
 005E4C1B    pop         edx
 005E4C1C    pop         ecx
 005E4C1D    pop         ecx
 005E4C1E    mov         dword ptr fs:[eax],edx
 005E4C21    push        5E4C36
 005E4C26    lea         eax,[ebp-0C]
 005E4C29    call        @UStrClr
 005E4C2E    ret
>005E4C2F    jmp         @HandleFinally
>005E4C34    jmp         005E4C26
 005E4C36    mov         eax,dword ptr [ebp-8]
 005E4C39    pop         edi
 005E4C3A    pop         esi
 005E4C3B    pop         ebx
 005E4C3C    mov         esp,ebp
 005E4C3E    pop         ebp
 005E4C3F    ret
*}
end;

//005E4C40
function TPieModule.GetDefaultFormat(field:Integer):TGuiFormat;
begin
{*
 005E4C40    push        ebp
 005E4C41    mov         ebp,esp
 005E4C43    push        0
 005E4C45    push        ebx
 005E4C46    push        esi
 005E4C47    mov         esi,edx
 005E4C49    mov         ebx,eax
 005E4C4B    xor         eax,eax
 005E4C4D    push        ebp
 005E4C4E    push        5E4C88
 005E4C53    push        dword ptr fs:[eax]
 005E4C56    mov         dword ptr fs:[eax],esp
 005E4C59    lea         ecx,[ebp-4]
 005E4C5C    mov         edx,esi
 005E4C5E    mov         eax,dword ptr [ebx+1C];TPieModule.Fields:THashTable
 005E4C61    call        THashTable.Get
 005E4C66    mov         edx,dword ptr [ebp-4]
 005E4C69    mov         eax,ebx
 005E4C6B    mov         ecx,dword ptr [eax]
 005E4C6D    call        dword ptr [ecx+44];TPieModule.GetDefaultFormat
 005E4C70    mov         ebx,eax
 005E4C72    xor         eax,eax
 005E4C74    pop         edx
 005E4C75    pop         ecx
 005E4C76    pop         ecx
 005E4C77    mov         dword ptr fs:[eax],edx
 005E4C7A    push        5E4C8F
 005E4C7F    lea         eax,[ebp-4]
 005E4C82    call        @UStrClr
 005E4C87    ret
>005E4C88    jmp         @HandleFinally
>005E4C8D    jmp         005E4C7F
 005E4C8F    mov         eax,ebx
 005E4C91    pop         esi
 005E4C92    pop         ebx
 005E4C93    pop         ecx
 005E4C94    pop         ebp
 005E4C95    ret
*}
end;

//005E4C98
function TPieModule.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 005E4C98    push        ebp
 005E4C99    mov         ebp,esp
 005E4C9B    push        ebx
 005E4C9C    xor         eax,eax
 005E4C9E    push        ebp
 005E4C9F    push        5E4CBA
 005E4CA4    push        dword ptr fs:[eax]
 005E4CA7    mov         dword ptr fs:[eax],esp
 005E4CAA    mov         bl,9
 005E4CAC    xor         eax,eax
 005E4CAE    pop         edx
 005E4CAF    pop         ecx
 005E4CB0    pop         ecx
 005E4CB1    mov         dword ptr fs:[eax],edx
 005E4CB4    push        5E4CC1
 005E4CB9    ret
>005E4CBA    jmp         @HandleFinally
>005E4CBF    jmp         005E4CB9
 005E4CC1    mov         eax,ebx
 005E4CC3    pop         ebx
 005E4CC4    pop         ebp
 005E4CC5    ret
*}
end;

//005E4CC8
function TPieModule.GetFields:TStringList;
begin
{*
 005E4CC8    push        ebp
 005E4CC9    mov         ebp,esp
 005E4CCB    add         esp,0FFFFFFF8
 005E4CCE    push        ebx
 005E4CCF    push        esi
 005E4CD0    push        edi
 005E4CD1    xor         edx,edx
 005E4CD3    mov         dword ptr [ebp-4],edx
 005E4CD6    mov         edi,eax
 005E4CD8    xor         eax,eax
 005E4CDA    push        ebp
 005E4CDB    push        5E4D41
 005E4CE0    push        dword ptr fs:[eax]
 005E4CE3    mov         dword ptr fs:[eax],esp
 005E4CE6    mov         dl,1
 005E4CE8    mov         eax,[0043C7BC];TStringList
 005E4CED    call        TStringList.Create;TStringList.Create
 005E4CF2    mov         dword ptr [ebp-8],eax
 005E4CF5    mov         dl,1
 005E4CF7    mov         eax,dword ptr [ebp-8]
 005E4CFA    call        TStringList.SetSorted
 005E4CFF    mov         ebx,dword ptr [edi+20];TPieModule.MaxFieldNumber:Integer
 005E4D02    test        ebx,ebx
>005E4D04    jl          005E4D2B
 005E4D06    inc         ebx
 005E4D07    xor         esi,esi
 005E4D09    lea         ecx,[ebp-4]
 005E4D0C    mov         eax,dword ptr [edi+1C];TPieModule.Fields:THashTable
 005E4D0F    mov         edx,esi
 005E4D11    call        THashTable.Get
 005E4D16    cmp         dword ptr [ebp-4],0
>005E4D1A    je          005E4D27
 005E4D1C    mov         edx,dword ptr [ebp-4]
 005E4D1F    mov         eax,dword ptr [ebp-8]
 005E4D22    mov         ecx,dword ptr [eax]
 005E4D24    call        dword ptr [ecx+38];TStringList.Add
 005E4D27    inc         esi
 005E4D28    dec         ebx
>005E4D29    jne         005E4D09
 005E4D2B    xor         eax,eax
 005E4D2D    pop         edx
 005E4D2E    pop         ecx
 005E4D2F    pop         ecx
 005E4D30    mov         dword ptr fs:[eax],edx
 005E4D33    push        5E4D48
 005E4D38    lea         eax,[ebp-4]
 005E4D3B    call        @UStrClr
 005E4D40    ret
>005E4D41    jmp         @HandleFinally
>005E4D46    jmp         005E4D38
 005E4D48    mov         eax,dword ptr [ebp-8]
 005E4D4B    pop         edi
 005E4D4C    pop         esi
 005E4D4D    pop         ebx
 005E4D4E    pop         ecx
 005E4D4F    pop         ecx
 005E4D50    pop         ebp
 005E4D51    ret
*}
end;

//005E4D54
procedure TPieModule.GetGoodFields;
begin
{*
 005E4D54    mov         edx,dword ptr [eax]
 005E4D56    call        dword ptr [edx+18];TPieModule.GetFields
 005E4D59    ret
*}
end;

//005E4D5C
procedure TPieModule.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 005E4D5C    push        ebp
 005E4D5D    mov         ebp,esp
 005E4D5F    mov         byte ptr [edx],1
 005E4D62    mov         dword ptr [ecx],1
 005E4D68    mov         eax,dword ptr [ebp+8]
 005E4D6B    mov         dword ptr [eax],10
 005E4D71    pop         ebp
 005E4D72    ret         4
*}
end;

//005E4D78
function TPieModule.IsIdentifier(s:string):Boolean;
begin
{*
 005E4D78    push        ebp
 005E4D79    mov         ebp,esp
 005E4D7B    push        ecx
 005E4D7C    push        ebx
 005E4D7D    mov         dword ptr [ebp-4],edx
 005E4D80    mov         ebx,eax
 005E4D82    mov         eax,dword ptr [ebp-4]
 005E4D85    call        @UStrAddRef
 005E4D8A    xor         eax,eax
 005E4D8C    push        ebp
 005E4D8D    push        5E4E42
 005E4D92    push        dword ptr fs:[eax]
 005E4D95    mov         dword ptr fs:[eax],esp
 005E4D98    cmp         byte ptr [ebx+26],0;TPieModule.DoesInput:Boolean
>005E4D9C    je          005E4DAB
 005E4D9E    lea         eax,[ebp-4]
 005E4DA1    mov         edx,5E4E5C;'real'
 005E4DA6    call        004F9BD0
 005E4DAB    cmp         byte ptr [ebx+27],0;TPieModule.DoesOutput:Boolean
>005E4DAF    je          005E4DBE
 005E4DB1    lea         eax,[ebp-4]
 005E4DB4    mov         edx,5E4E74;'fake'
 005E4DB9    call        004F9BD0
 005E4DBE    lea         eax,[ebp-4]
 005E4DC1    mov         edx,dword ptr [ebx+8];TPieModule.Name1:string
 005E4DC4    call        004F9BD0
 005E4DC9    test        al,al
>005E4DCB    jne         005E4E0D
 005E4DCD    lea         eax,[ebp-4]
 005E4DD0    mov         edx,dword ptr [ebx+0C];TPieModule.Name2:string
 005E4DD3    call        004F9BD0
 005E4DD8    test        al,al
>005E4DDA    jne         005E4E0D
 005E4DDC    lea         eax,[ebp-4]
 005E4DDF    mov         edx,dword ptr [ebx+10];TPieModule.Name3:string
 005E4DE2    call        004F9BD0
 005E4DE7    test        al,al
>005E4DE9    jne         005E4E0D
 005E4DEB    lea         eax,[ebp-4]
 005E4DEE    mov         edx,dword ptr [ebx+14];TPieModule.Name4:string
 005E4DF1    call        004F9BD0
 005E4DF6    test        al,al
>005E4DF8    jne         005E4E0D
 005E4DFA    lea         eax,[ebp-4]
 005E4DFD    mov         edx,dword ptr [ebx+18];TPieModule.Name5:string
 005E4E00    call        004F9BD0
 005E4E05    test        al,al
>005E4E07    jne         005E4E0D
 005E4E09    xor         ebx,ebx
>005E4E0B    jmp         005E4E2C
 005E4E0D    lea         eax,[ebp-4]
 005E4E10    call        004F9D00
 005E4E15    lea         eax,[ebp-4]
 005E4E18    mov         edx,5E4E8C;'.'
 005E4E1D    call        004F9BD0
 005E4E22    test        al,al
>005E4E24    jne         005E4E2A
 005E4E26    xor         ebx,ebx
>005E4E28    jmp         005E4E2C
 005E4E2A    mov         bl,1
 005E4E2C    xor         eax,eax
 005E4E2E    pop         edx
 005E4E2F    pop         ecx
 005E4E30    pop         ecx
 005E4E31    mov         dword ptr fs:[eax],edx
 005E4E34    push        5E4E49
 005E4E39    lea         eax,[ebp-4]
 005E4E3C    call        @UStrClr
 005E4E41    ret
>005E4E42    jmp         @HandleFinally
>005E4E47    jmp         005E4E39
 005E4E49    mov         eax,ebx
 005E4E4B    pop         ebx
 005E4E4C    pop         ecx
 005E4E4D    pop         ebp
 005E4E4E    ret
*}
end;

//005E4E90
procedure sub_005E4E90(?:TModuleP5; ?:UnicodeString);
begin
{*
 005E4E90    push        ebp
 005E4E91    mov         ebp,esp
 005E4E93    push        ecx
 005E4E94    mov         dword ptr [ebp-4],edx
 005E4E97    mov         eax,dword ptr [ebp-4]
 005E4E9A    call        @UStrAddRef
 005E4E9F    xor         eax,eax
 005E4EA1    push        ebp
 005E4EA2    push        5E4ECB
 005E4EA7    push        dword ptr fs:[eax]
 005E4EAA    mov         dword ptr fs:[eax],esp
 005E4EAD    mov         eax,dword ptr [ebp-4]
 005E4EB0    call        005E2444
 005E4EB5    xor         eax,eax
 005E4EB7    pop         edx
 005E4EB8    pop         ecx
 005E4EB9    pop         ecx
 005E4EBA    mov         dword ptr fs:[eax],edx
 005E4EBD    push        5E4ED2
 005E4EC2    lea         eax,[ebp-4]
 005E4EC5    call        @UStrClr
 005E4ECA    ret
>005E4ECB    jmp         @HandleFinally
>005E4ED0    jmp         005E4EC2
 005E4ED2    pop         ecx
 005E4ED3    pop         ebp
 005E4ED4    ret
*}
end;

//005E4ED8
procedure sub_005E4ED8(?:TModuleP5; ?:UnicodeString);
begin
{*
 005E4ED8    push        ebp
 005E4ED9    mov         ebp,esp
 005E4EDB    push        ecx
 005E4EDC    mov         dword ptr [ebp-4],edx
 005E4EDF    mov         eax,dword ptr [ebp-4]
 005E4EE2    call        @UStrAddRef
 005E4EE7    xor         eax,eax
 005E4EE9    push        ebp
 005E4EEA    push        5E4F13
 005E4EEF    push        dword ptr fs:[eax]
 005E4EF2    mov         dword ptr fs:[eax],esp
 005E4EF5    mov         eax,dword ptr [ebp-4]
 005E4EF8    call        005E2540
 005E4EFD    xor         eax,eax
 005E4EFF    pop         edx
 005E4F00    pop         ecx
 005E4F01    pop         ecx
 005E4F02    mov         dword ptr fs:[eax],edx
 005E4F05    push        5E4F1A
 005E4F0A    lea         eax,[ebp-4]
 005E4F0D    call        @UStrClr
 005E4F12    ret
>005E4F13    jmp         @HandleFinally
>005E4F18    jmp         005E4F0A
 005E4F1A    pop         ecx
 005E4F1B    pop         ebp
 005E4F1C    ret
*}
end;

//005E4F20
procedure sub_005E4F20(?:TPieModule; ?:UnicodeString);
begin
{*
 005E4F20    push        ebp
 005E4F21    mov         ebp,esp
 005E4F23    push        ecx
 005E4F24    push        ebx
 005E4F25    mov         dword ptr [ebp-4],edx
 005E4F28    mov         ebx,eax
 005E4F2A    mov         eax,dword ptr [ebp-4]
 005E4F2D    call        @UStrAddRef
 005E4F32    xor         eax,eax
 005E4F34    push        ebp
 005E4F35    push        5E4F61
 005E4F3A    push        dword ptr fs:[eax]
 005E4F3D    mov         dword ptr fs:[eax],esp
 005E4F40    mov         edx,dword ptr [ebp-4]
 005E4F43    mov         eax,dword ptr [ebx+2C]
 005E4F46    mov         ecx,dword ptr [eax]
 005E4F48    call        dword ptr [ecx+38]
 005E4F4B    xor         eax,eax
 005E4F4D    pop         edx
 005E4F4E    pop         ecx
 005E4F4F    pop         ecx
 005E4F50    mov         dword ptr fs:[eax],edx
 005E4F53    push        5E4F68
 005E4F58    lea         eax,[ebp-4]
 005E4F5B    call        @UStrClr
 005E4F60    ret
>005E4F61    jmp         @HandleFinally
>005E4F66    jmp         005E4F58
 005E4F68    pop         ebx
 005E4F69    pop         ecx
 005E4F6A    pop         ebp
 005E4F6B    ret
*}
end;

//005E4F6C
procedure sub_005E4F6C(?:TPieModule; ?:UnicodeString);
begin
{*
 005E4F6C    push        ebp
 005E4F6D    mov         ebp,esp
 005E4F6F    push        ecx
 005E4F70    mov         dword ptr [ebp-4],edx
 005E4F73    mov         eax,dword ptr [ebp-4]
 005E4F76    call        @UStrAddRef
 005E4F7B    xor         eax,eax
 005E4F7D    push        ebp
 005E4F7E    push        5E4FA7
 005E4F83    push        dword ptr fs:[eax]
 005E4F86    mov         dword ptr fs:[eax],esp
 005E4F89    mov         eax,dword ptr [ebp-4]
 005E4F8C    call        005E2444
 005E4F91    xor         eax,eax
 005E4F93    pop         edx
 005E4F94    pop         ecx
 005E4F95    pop         ecx
 005E4F96    mov         dword ptr fs:[eax],edx
 005E4F99    push        5E4FAE
 005E4F9E    lea         eax,[ebp-4]
 005E4FA1    call        @UStrClr
 005E4FA6    ret
>005E4FA7    jmp         @HandleFinally
>005E4FAC    jmp         005E4F9E
 005E4FAE    pop         ecx
 005E4FAF    pop         ebp
 005E4FB0    ret
*}
end;

//005E4FB4
procedure sub_005E4FB4(?:TPieModule; ?:UnicodeString);
begin
{*
 005E4FB4    push        ebp
 005E4FB5    mov         ebp,esp
 005E4FB7    push        ecx
 005E4FB8    mov         dword ptr [ebp-4],edx
 005E4FBB    mov         eax,dword ptr [ebp-4]
 005E4FBE    call        @UStrAddRef
 005E4FC3    xor         eax,eax
 005E4FC5    push        ebp
 005E4FC6    push        5E4FEF
 005E4FCB    push        dword ptr fs:[eax]
 005E4FCE    mov         dword ptr fs:[eax],esp
 005E4FD1    mov         eax,dword ptr [ebp-4]
 005E4FD4    call        005E2540
 005E4FD9    xor         eax,eax
 005E4FDB    pop         edx
 005E4FDC    pop         ecx
 005E4FDD    pop         ecx
 005E4FDE    mov         dword ptr fs:[eax],edx
 005E4FE1    push        5E4FF6
 005E4FE6    lea         eax,[ebp-4]
 005E4FE9    call        @UStrClr
 005E4FEE    ret
>005E4FEF    jmp         @HandleFinally
>005E4FF4    jmp         005E4FE6
 005E4FF6    pop         ecx
 005E4FF7    pop         ebp
 005E4FF8    ret
*}
end;

//005E4FFC
procedure TPieModule.MonitorFrame;
begin
{*
 005E4FFC    mov         edx,dword ptr [eax]
 005E4FFE    call        dword ptr [edx+3C];TPieModule.Read
 005E5001    ret
*}
end;

//005E5004
procedure sub_005E5004(?:TPieModule; ?:UnicodeString);
begin
{*
 005E5004    push        ebp
 005E5005    mov         ebp,esp
 005E5007    push        ecx
 005E5008    push        ebx
 005E5009    mov         dword ptr [ebp-4],edx
 005E500C    mov         ebx,eax
 005E500E    mov         eax,dword ptr [ebp-4]
 005E5011    call        @UStrAddRef
 005E5016    xor         eax,eax
 005E5018    push        ebp
 005E5019    push        5E5044
 005E501E    push        dword ptr fs:[eax]
 005E5021    mov         dword ptr fs:[eax],esp
 005E5024    mov         edx,dword ptr [ebp-4]
 005E5027    mov         eax,ebx
 005E5029    call        005E4F20
 005E502E    xor         eax,eax
 005E5030    pop         edx
 005E5031    pop         ecx
 005E5032    pop         ecx
 005E5033    mov         dword ptr fs:[eax],edx
 005E5036    push        5E504B
 005E503B    lea         eax,[ebp-4]
 005E503E    call        @UStrClr
 005E5043    ret
>005E5044    jmp         @HandleFinally
>005E5049    jmp         005E503B
 005E504B    pop         ebx
 005E504C    pop         ecx
 005E504D    pop         ebp
 005E504E    ret
*}
end;

//005E5050
procedure sub_005E5050(?:TPieModule; ?:UnicodeString);
begin
{*
 005E5050    push        ebp
 005E5051    mov         ebp,esp
 005E5053    push        ecx
 005E5054    push        ebx
 005E5055    mov         dword ptr [ebp-4],edx
 005E5058    mov         ebx,eax
 005E505A    mov         eax,dword ptr [ebp-4]
 005E505D    call        @UStrAddRef
 005E5062    xor         eax,eax
 005E5064    push        ebp
 005E5065    push        5E5090
 005E506A    push        dword ptr fs:[eax]
 005E506D    mov         dword ptr fs:[eax],esp
 005E5070    mov         edx,dword ptr [ebp-4]
 005E5073    mov         eax,ebx
 005E5075    call        005E4F20
 005E507A    xor         eax,eax
 005E507C    pop         edx
 005E507D    pop         ecx
 005E507E    pop         ecx
 005E507F    mov         dword ptr fs:[eax],edx
 005E5082    push        5E5097
 005E5087    lea         eax,[ebp-4]
 005E508A    call        @UStrClr
 005E508F    ret
>005E5090    jmp         @HandleFinally
>005E5095    jmp         005E5087
 005E5097    pop         ebx
 005E5098    pop         ecx
 005E5099    pop         ebp
 005E509A    ret
*}
end;

//005E509C
procedure sub_005E509C(?:TPieModule);
begin
{*
 005E509C    push        ebp
 005E509D    mov         ebp,esp
 005E509F    xor         ecx,ecx
 005E50A1    push        ecx
 005E50A2    push        ecx
 005E50A3    push        ecx
 005E50A4    push        ecx
 005E50A5    push        ecx
 005E50A6    push        ebx
 005E50A7    push        esi
 005E50A8    push        edi
 005E50A9    mov         ebx,eax
 005E50AB    xor         eax,eax
 005E50AD    push        ebp
 005E50AE    push        5E517F
 005E50B3    push        dword ptr fs:[eax]
 005E50B6    mov         dword ptr fs:[eax],esp
 005E50B9    mov         eax,dword ptr [ebx+30]
 005E50BC    mov         edx,dword ptr [eax]
 005E50BE    call        dword ptr [edx+14]
 005E50C1    dec         eax
 005E50C2    test        eax,eax
>005E50C4    jl          005E5105
 005E50C6    inc         eax
 005E50C7    mov         dword ptr [ebp-4],eax
 005E50CA    xor         esi,esi
 005E50CC    lea         ecx,[ebp-8]
 005E50CF    mov         edx,esi
 005E50D1    mov         eax,dword ptr [ebx+30]
 005E50D4    mov         edi,dword ptr [eax]
 005E50D6    call        dword ptr [edi+0C]
 005E50D9    mov         edx,dword ptr [ebp-8]
 005E50DC    mov         eax,dword ptr [ebx+2C]
 005E50DF    mov         ecx,dword ptr [eax]
 005E50E1    call        dword ptr [ecx+54]
 005E50E4    test        eax,eax
>005E50E6    jge         005E50FF
 005E50E8    lea         ecx,[ebp-0C]
 005E50EB    mov         edx,esi
 005E50ED    mov         eax,dword ptr [ebx+30]
 005E50F0    mov         edi,dword ptr [eax]
 005E50F2    call        dword ptr [edi+0C]
 005E50F5    mov         edx,dword ptr [ebp-0C]
 005E50F8    mov         eax,ebx
 005E50FA    call        005E4FB4
 005E50FF    inc         esi
 005E5100    dec         dword ptr [ebp-4]
>005E5103    jne         005E50CC
 005E5105    mov         eax,dword ptr [ebx+2C]
 005E5108    mov         edx,dword ptr [eax]
 005E510A    call        dword ptr [edx+14]
 005E510D    dec         eax
 005E510E    test        eax,eax
>005E5110    jl          005E5151
 005E5112    inc         eax
 005E5113    mov         dword ptr [ebp-4],eax
 005E5116    xor         esi,esi
 005E5118    lea         ecx,[ebp-10]
 005E511B    mov         edx,esi
 005E511D    mov         eax,dword ptr [ebx+2C]
 005E5120    mov         edi,dword ptr [eax]
 005E5122    call        dword ptr [edi+0C]
 005E5125    mov         edx,dword ptr [ebp-10]
 005E5128    mov         eax,dword ptr [ebx+30]
 005E512B    mov         ecx,dword ptr [eax]
 005E512D    call        dword ptr [ecx+54]
 005E5130    test        eax,eax
>005E5132    jge         005E514B
 005E5134    lea         ecx,[ebp-14]
 005E5137    mov         edx,esi
 005E5139    mov         eax,dword ptr [ebx+2C]
 005E513C    mov         edi,dword ptr [eax]
 005E513E    call        dword ptr [edi+0C]
 005E5141    mov         edx,dword ptr [ebp-14]
 005E5144    mov         eax,ebx
 005E5146    call        005E4F6C
 005E514B    inc         esi
 005E514C    dec         dword ptr [ebp-4]
>005E514F    jne         005E5118
 005E5151    mov         edx,dword ptr [ebx+2C]
 005E5154    mov         eax,dword ptr [ebx+30]
 005E5157    mov         ecx,dword ptr [eax]
 005E5159    call        dword ptr [ecx+8]
 005E515C    mov         eax,dword ptr [ebx+2C]
 005E515F    mov         edx,dword ptr [eax]
 005E5161    call        dword ptr [edx+44]
 005E5164    xor         eax,eax
 005E5166    pop         edx
 005E5167    pop         ecx
 005E5168    pop         ecx
 005E5169    mov         dword ptr fs:[eax],edx
 005E516C    push        5E5186
 005E5171    lea         eax,[ebp-14]
 005E5174    mov         edx,4
 005E5179    call        @UStrArrayClr
 005E517E    ret
>005E517F    jmp         @HandleFinally
>005E5184    jmp         005E5171
 005E5186    pop         edi
 005E5187    pop         esi
 005E5188    pop         ebx
 005E5189    mov         esp,ebp
 005E518B    pop         ebp
 005E518C    ret
*}
end;

//005E5190
procedure sub_005E5190(?:TPieModule; ?:UnicodeString);
begin
{*
 005E5190    push        ebp
 005E5191    mov         ebp,esp
 005E5193    push        ecx
 005E5194    mov         dword ptr [ebp-4],edx
 005E5197    mov         eax,dword ptr [ebp-4]
 005E519A    call        @UStrAddRef
 005E519F    xor         eax,eax
 005E51A1    push        ebp
 005E51A2    push        5E51CB
 005E51A7    push        dword ptr fs:[eax]
 005E51AA    mov         dword ptr fs:[eax],esp
 005E51AD    mov         eax,dword ptr [ebp-4]
 005E51B0    call        005E2300
 005E51B5    xor         eax,eax
 005E51B7    pop         edx
 005E51B8    pop         ecx
 005E51B9    pop         ecx
 005E51BA    mov         dword ptr fs:[eax],edx
 005E51BD    push        5E51D2
 005E51C2    lea         eax,[ebp-4]
 005E51C5    call        @UStrClr
 005E51CA    ret
>005E51CB    jmp         @HandleFinally
>005E51D0    jmp         005E51C2
 005E51D2    pop         ecx
 005E51D3    pop         ebp
 005E51D4    ret
*}
end;

//005E51D8
procedure sub_005E51D8(?:TPieModule; ?:UnicodeString);
begin
{*
 005E51D8    push        ebp
 005E51D9    mov         ebp,esp
 005E51DB    push        ecx
 005E51DC    mov         dword ptr [ebp-4],edx
 005E51DF    mov         eax,dword ptr [ebp-4]
 005E51E2    call        @UStrAddRef
 005E51E7    xor         eax,eax
 005E51E9    push        ebp
 005E51EA    push        5E5213
 005E51EF    push        dword ptr fs:[eax]
 005E51F2    mov         dword ptr fs:[eax],esp
 005E51F5    mov         eax,dword ptr [ebp-4]
 005E51F8    call        005E238C
 005E51FD    xor         eax,eax
 005E51FF    pop         edx
 005E5200    pop         ecx
 005E5201    pop         ecx
 005E5202    mov         dword ptr fs:[eax],edx
 005E5205    push        5E521A
 005E520A    lea         eax,[ebp-4]
 005E520D    call        @UStrClr
 005E5212    ret
>005E5213    jmp         @HandleFinally
>005E5218    jmp         005E520A
 005E521A    pop         ecx
 005E521B    pop         ebp
 005E521C    ret
*}
end;

//005E5220
procedure TPieModule.PrepareForGUI;
begin
{*
 005E5220    ret
*}
end;

//005E5224
procedure TPieModule.PrepareForMonitoring;
begin
{*
 005E5224    push        ebx
 005E5225    mov         ebx,eax
 005E5227    mov         eax,ebx
 005E5229    mov         edx,dword ptr [eax]
 005E522B    call        dword ptr [edx+28];TPieModule.StartCompiletime
 005E522E    mov         byte ptr [ebx+24],1;TPieModule.Used:Boolean
 005E5232    pop         ebx
 005E5233    ret
*}
end;

//005E5234
function TPieModule.Read:Boolean;
begin
{*
 005E5234    cmp         byte ptr [eax+24],0;TPieModule.Used:Boolean
>005E5238    je          005E523D
 005E523A    xor         eax,eax
 005E523C    ret
 005E523D    mov         al,1
 005E523F    ret
*}
end;

//005E5240
procedure TPieModule.StartCompiletime;
begin
{*
 005E5240    mov         byte ptr [eax+24],0;TPieModule.Used:Boolean
 005E5244    ret
*}
end;

//005E5248
procedure TPieModule.StartGUI;
begin
{*
 005E5248    ret
*}
end;

//005E524C
procedure TPieModule.StartMonitoring;
begin
{*
 005E524C    push        ebx
 005E524D    mov         ebx,eax
 005E524F    mov         eax,ebx
 005E5251    mov         edx,dword ptr [eax]
 005E5253    call        dword ptr [edx+2C];TPieModule.StopCompiletime
 005E5256    mov         eax,ebx
 005E5258    mov         edx,dword ptr [eax]
 005E525A    call        dword ptr [edx+30];TPieModule.StartRuntime
 005E525D    mov         byte ptr [ebx+28],1;TPieModule.Monitoring:Boolean
 005E5261    pop         ebx
 005E5262    ret
*}
end;

//005E5264
procedure TPieModule.StartRuntime;
begin
{*
 005E5264    cmp         byte ptr [eax+24],0;TPieModule.Used:Boolean
>005E5268    je          005E526E
 005E526A    mov         byte ptr [eax+25],0;TPieModule.Exists:Boolean
 005E526E    ret
*}
end;

//005E5270
procedure TPieModule.StopCompiletime;
begin
{*
 005E5270    ret
*}
end;

//005E5274
procedure TPieModule.StopGUI;
begin
{*
 005E5274    ret
*}
end;

//005E5278
procedure TPieModule.StopMonitoring;
begin
{*
 005E5278    push        ebx
 005E5279    mov         ebx,eax
 005E527B    mov         eax,ebx
 005E527D    mov         edx,dword ptr [eax]
 005E527F    call        dword ptr [edx+34];TPieModule.StopRuntime
 005E5282    mov         byte ptr [ebx+25],0;TPieModule.Exists:Boolean
 005E5286    mov         byte ptr [ebx+28],0;TPieModule.Monitoring:Boolean
 005E528A    pop         ebx
 005E528B    ret
*}
end;

//005E528C
procedure TPieModule.StopRuntime;
begin
{*
 005E528C    cmp         byte ptr [eax+24],0;TPieModule.Used:Boolean
>005E5290    je          005E529C
 005E5292    cmp         byte ptr [eax+25],0;TPieModule.Exists:Boolean
>005E5296    je          005E529C
 005E5298    mov         byte ptr [eax+25],0;TPieModule.Exists:Boolean
 005E529C    ret
*}
end;

Initialization
//00781878
{*
 00781878    sub         dword ptr ds:[8161E4],1
>0078187F    jae         0078189D
 00781881    cmp         dword ptr ds:[8161E0],0;gvar_008161E0:TObjectList
>00781888    jne         0078189D
 0078188A    mov         cl,1
 0078188C    mov         dl,1
 0078188E    mov         eax,[00471630];TObjectList
 00781893    call        TObjectList.Create;TObjectList.Create
 00781898    mov         [008161E0],eax;gvar_008161E0:TObjectList
 0078189D    ret
*}
Finalization
end.