//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit107;

interface

uses
  SysUtils, Classes;

    //function sub_005FCB30(?:?; ?:?; ?:?):?;//005FCB30
    function sub_005FCB94:Boolean;//005FCB94
    //function sub_005FCBA0(?:UString):?;//005FCBA0
    //function sub_005FCC94(?:UString):?;//005FCC94
    //function sub_005FCD64:?;//005FCD64
    //function sub_005FCDA0:?;//005FCDA0
    //function sub_005FCDC8(?:Integer):?;//005FCDC8
    //function sub_005FD518(?:Integer):?;//005FD518
    procedure sub_005FD5B0;//005FD5B0
    procedure sub_005FD614;//005FD614
    //function sub_005FD6CC(?:?):?;//005FD6CC
    //procedure sub_005FE1A8(?:HWND; ?:LPARAM; ?:?);//005FE1A8
    //function sub_005FF2AC(?:UString; ?:?):?;//005FF2AC
    //function sub_0060010C(?:?):?;//0060010C
    //function sub_0060016C(?:?):Boolean;//0060016C
    //function sub_00600190(?:?):?;//00600190
    //function sub_0060058C(?:Integer):?;//0060058C
    //procedure sub_006005F0(?:?);//006005F0
    //procedure sub_00600678(?:?);//00600678
    //procedure sub_00600708(?:?);//00600708
    //procedure sub_00600754(?:?);//00600754
    procedure sub_006007EC(?:UnicodeString);//006007EC
    procedure sub_0060090C(?:WideString);//0060090C
    procedure sub_00600984;//00600984

implementation

//005FCB30
{*function sub_005FCB30(?:?; ?:?; ?:?):?;
begin
 005FCB30    push        ebp
 005FCB31    mov         ebp,esp
 005FCB33    push        ebx
 005FCB34    push        esi
 005FCB35    push        edi
 005FCB36    mov         ebx,dword ptr [ebp+0C]
 005FCB39    xor         edi,edi
 005FCB3B    mov         esi,dword ptr [ebp+8]
 005FCB3E    dec         esi
 005FCB3F    test        esi,esi
>005FCB41    jl          005FCB89
 005FCB43    inc         esi
 005FCB44    mov         eax,dword ptr [ebx]
 005FCB46    cmp         eax,1
>005FCB49    jne         005FCB65
 005FCB4B    mov         eax,dword ptr [ebx+10]
 005FCB4E    push        eax
 005FCB4F    mov         eax,dword ptr [ebx+8]
 005FCB52    push        eax
 005FCB53    movzx       eax,byte ptr [ebx+6]
 005FCB57    push        eax
 005FCB58    movzx       eax,byte ptr [ebx+4]
 005FCB5C    push        eax
 005FCB5D    call        user32.keybd_event
 005FCB62    inc         edi
>005FCB63    jmp         005FCB83
 005FCB65    test        eax,eax
>005FCB67    jne         005FCB83
 005FCB69    mov         eax,dword ptr [ebx+18]
 005FCB6C    push        eax
 005FCB6D    mov         eax,dword ptr [ebx+0C]
 005FCB70    push        eax
 005FCB71    mov         eax,dword ptr [ebx+8]
 005FCB74    push        eax
 005FCB75    mov         eax,dword ptr [ebx+4]
 005FCB78    push        eax
 005FCB79    mov         eax,dword ptr [ebx+10]
 005FCB7C    push        eax
 005FCB7D    call        user32.mouse_event
 005FCB82    inc         edi
 005FCB83    add         ebx,dword ptr [ebp+10]
 005FCB86    dec         esi
>005FCB87    jne         005FCB44
 005FCB89    mov         eax,edi
 005FCB8B    pop         edi
 005FCB8C    pop         esi
 005FCB8D    pop         ebx
 005FCB8E    pop         ebp
 005FCB8F    ret         0C
end;*}

//005FCB94
function sub_005FCB94:Boolean;
begin
{*
 005FCB94    cmp         dword ptr ds:[78BD08],0;gvar_0078BD08:IInterface
 005FCB9B    setne       al
 005FCB9E    ret
*}
end;

//005FCBA0
{*function sub_005FCBA0(?:UString):?;
begin
 005FCBA0    push        ebp
 005FCBA1    mov         ebp,esp
 005FCBA3    add         esp,0FFFFFFF8
 005FCBA6    push        ebx
 005FCBA7    xor         edx,edx
 005FCBA9    mov         dword ptr [ebp-8],edx
 005FCBAC    mov         dword ptr [ebp-4],eax
 005FCBAF    mov         eax,dword ptr [ebp-4]
 005FCBB2    call        @UStrAddRef
 005FCBB7    xor         eax,eax
 005FCBB9    push        ebp
 005FCBBA    push        5FCC3E
 005FCBBF    push        dword ptr fs:[eax]
 005FCBC2    mov         dword ptr fs:[eax],esp
 005FCBC5    lea         eax,[ebp-8]
 005FCBC8    mov         ecx,dword ptr [ebp-4]
 005FCBCB    mov         edx,5FCC58;'StartingInputMonitor '
 005FCBD0    call        @UStrCat3
 005FCBD5    mov         eax,dword ptr [ebp-8]
 005FCBD8    call        004FA5FC
 005FCBDD    inc         dword ptr ds:[78BD0C];gvar_0078BD0C
 005FCBE3    cmp         dword ptr ds:[78BD08],0;gvar_0078BD08:IInterface
>005FCBEA    je          005FCBF0
 005FCBEC    xor         ebx,ebx
>005FCBEE    jmp         005FCC23
 005FCBF0    mov         eax,78BD08;gvar_0078BD08:IInterface
 005FCBF5    call        @IntfClear
 005FCBFA    push        0
 005FCBFC    mov         eax,78BD08;gvar_0078BD08:IInterface
 005FCC01    call        @IntfClear
 005FCC06    push        eax
 005FCC07    push        5FCC84;['{BF798030-483A-4DA2-AA99-5D64ED369700}']
 005FCC0C    push        800
 005FCC11    mov         eax,[00790C38];gvar_00790C38
 005FCC16    push        eax
 005FCC17    call        dinput8.DirectInput8Create
 005FCC1C    call        OleCheck
 005FCC21    mov         bl,1
 005FCC23    xor         eax,eax
 005FCC25    pop         edx
 005FCC26    pop         ecx
 005FCC27    pop         ecx
 005FCC28    mov         dword ptr fs:[eax],edx
 005FCC2B    push        5FCC45
 005FCC30    lea         eax,[ebp-8]
 005FCC33    mov         edx,2
 005FCC38    call        @UStrArrayClr
 005FCC3D    ret
>005FCC3E    jmp         @HandleFinally
>005FCC43    jmp         005FCC30
 005FCC45    mov         eax,ebx
 005FCC47    pop         ebx
 005FCC48    pop         ecx
 005FCC49    pop         ecx
 005FCC4A    pop         ebp
 005FCC4B    ret
end;*}

//005FCC94
{*function sub_005FCC94(?:UString):?;
begin
 005FCC94    push        ebp
 005FCC95    mov         ebp,esp
 005FCC97    add         esp,0FFFFFFF8
 005FCC9A    push        ebx
 005FCC9B    xor         edx,edx
 005FCC9D    mov         dword ptr [ebp-8],edx
 005FCCA0    mov         dword ptr [ebp-4],eax
 005FCCA3    mov         eax,dword ptr [ebp-4]
 005FCCA6    call        @UStrAddRef
 005FCCAB    xor         eax,eax
 005FCCAD    push        ebp
 005FCCAE    push        5FCD1D
 005FCCB3    push        dword ptr fs:[eax]
 005FCCB6    mov         dword ptr fs:[eax],esp
 005FCCB9    lea         eax,[ebp-8]
 005FCCBC    mov         ecx,dword ptr [ebp-4]
 005FCCBF    mov         edx,5FCD38;'StoppingInputMonitor '
 005FCCC4    call        @UStrCat3
 005FCCC9    mov         eax,dword ptr [ebp-8]
 005FCCCC    call        004FA5FC
 005FCCD1    dec         dword ptr ds:[78BD0C];gvar_0078BD0C
 005FCCD7    xor         ebx,ebx
 005FCCD9    cmp         dword ptr ds:[78BD0C],0;gvar_0078BD0C
>005FCCE0    jg          005FCD02
 005FCCE2    xor         eax,eax
 005FCCE4    mov         [0078BD0C],eax;gvar_0078BD0C
 005FCCE9    cmp         dword ptr ds:[78BD08],0;gvar_0078BD08:IInterface
>005FCCF0    jne         005FCCF6
 005FCCF2    xor         ebx,ebx
>005FCCF4    jmp         005FCD02
 005FCCF6    mov         eax,78BD08;gvar_0078BD08:IInterface
 005FCCFB    call        @IntfClear
 005FCD00    mov         bl,1
 005FCD02    xor         eax,eax
 005FCD04    pop         edx
 005FCD05    pop         ecx
 005FCD06    pop         ecx
 005FCD07    mov         dword ptr fs:[eax],edx
 005FCD0A    push        5FCD24
 005FCD0F    lea         eax,[ebp-8]
 005FCD12    mov         edx,2
 005FCD17    call        @UStrArrayClr
 005FCD1C    ret
>005FCD1D    jmp         @HandleFinally
>005FCD22    jmp         005FCD0F
 005FCD24    mov         eax,ebx
 005FCD26    pop         ebx
 005FCD27    pop         ecx
 005FCD28    pop         ecx
 005FCD29    pop         ebp
 005FCD2A    ret
end;*}

//005FCD64
{*function sub_005FCD64:?;
begin
 005FCD64    cmp         byte ptr ds:[78BD04],0;gvar_0078BD04
>005FCD6B    je          005FCD70
 005FCD6D    xor         eax,eax
 005FCD6F    ret
 005FCD70    mov         eax,[0078DB58];^gvar_00784C7C
 005FCD75    cmp         dword ptr [eax],2
>005FCD78    jne         005FCD84
 005FCD7A    mov         eax,[0078D080];^gvar_00784C80
 005FCD7F    cmp         dword ptr [eax],5
>005FCD82    jg          005FCD9C
 005FCD84    mov         eax,[0078D080];^gvar_00784C80
 005FCD89    cmp         dword ptr [eax],5
>005FCD8C    jne         005FCD98
 005FCD8E    mov         eax,[0078D6F0];^gvar_00784C84
 005FCD93    cmp         dword ptr [eax],1
>005FCD96    jge         005FCD9C
 005FCD98    xor         eax,eax
>005FCD9A    jmp         005FCD9E
 005FCD9C    mov         al,1
 005FCD9E    ret
end;*}

//005FCDA0
{*function sub_005FCDA0:?;
begin
 005FCDA0    cmp         byte ptr ds:[78BD04],0;gvar_0078BD04
>005FCDA7    je          005FCDAC
 005FCDA9    xor         eax,eax
 005FCDAB    ret
 005FCDAC    mov         eax,[0078DB58];^gvar_00784C7C
 005FCDB1    cmp         dword ptr [eax],2
>005FCDB4    jne         005FCDC0
 005FCDB6    mov         eax,[0078D080];^gvar_00784C80
 005FCDBB    cmp         dword ptr [eax],5
>005FCDBE    jge         005FCDC4
 005FCDC0    xor         eax,eax
>005FCDC2    jmp         005FCDC6
 005FCDC4    mov         al,1
 005FCDC6    ret
end;*}

//005FCDC8
{*function sub_005FCDC8(?:Integer):?;
begin
 005FCDC8    mov         edx,eax
 005FCDCA    cmp         edx,103
>005FCDD0    ja          005FD501
 005FCDD6    jmp         dword ptr [edx*4+5FCDDD]
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD1ED
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD230
 005FCDD6    dd          005FD237
 005FCDD6    dd          005FD23D
 005FCDD6    dd          005FD243
 005FCDD6    dd          005FD249
 005FCDD6    dd          005FD24F
 005FCDD6    dd          005FD255
 005FCDD6    dd          005FD25B
 005FCDD6    dd          005FD261
 005FCDD6    dd          005FD267
 005FCDD6    dd          005FD26D
 005FCDD6    dd          005FD273
 005FCDD6    dd          005FD279
 005FCDD6    dd          005FD27F
 005FCDD6    dd          005FD285
 005FCDD6    dd          005FD28B
 005FCDD6    dd          005FD291
 005FCDD6    dd          005FD297
 005FCDD6    dd          005FD2EB
 005FCDD6    dd          005FD339
 005FCDD6    dd          005FD2A9
 005FCDD6    dd          005FD2AF
 005FCDD6    dd          005FD2B5
 005FCDD6    dd          005FD2BB
 005FCDD6    dd          005FD2C1
 005FCDD6    dd          005FD2C7
 005FCDD6    dd          005FD2CD
 005FCDD6    dd          005FD2D3
 005FCDD6    dd          005FD2D9
 005FCDD6    dd          005FD2DF
 005FCDD6    dd          005FD2E5
 005FCDD6    dd          005FD22A
 005FCDD6    dd          005FD2F1
 005FCDD6    dd          005FD29D
 005FCDD6    dd          005FD2F7
 005FCDD6    dd          005FD2FD
 005FCDD6    dd          005FD303
 005FCDD6    dd          005FD309
 005FCDD6    dd          005FD30F
 005FCDD6    dd          005FD315
 005FCDD6    dd          005FD31B
 005FCDD6    dd          005FD321
 005FCDD6    dd          005FD327
 005FCDD6    dd          005FD32D
 005FCDD6    dd          005FD333
 005FCDD6    dd          005FD3B1
 005FCDD6    dd          005FD345
 005FCDD6    dd          005FD34B
 005FCDD6    dd          005FD2A3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD1F3
 005FCDD6    dd          005FD3A5
 005FCDD6    dd          005FD224
 005FCDD6    dd          005FD3C3
 005FCDD6    dd          005FD3C9
 005FCDD6    dd          005FD3CF
 005FCDD6    dd          005FD3B7
 005FCDD6    dd          005FD3D5
 005FCDD6    dd          005FD3DB
 005FCDD6    dd          005FD3E1
 005FCDD6    dd          005FD3BD
 005FCDD6    dd          005FD3E7
 005FCDD6    dd          005FD3ED
 005FCDD6    dd          005FD3F3
 005FCDD6    dd          005FD3F9
 005FCDD6    dd          005FD3FF
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD471
 005FCDD6    dd          005FD1FA
 005FCDD6    dd          005FD200
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD206
 005FCDD6    dd          005FD20C
 005FCDD6    dd          005FD212
 005FCDD6    dd          005FD477
 005FCDD6    dd          005FD47D
 005FCDD6    dd          005FD483
 005FCDD6    dd          005FD489
 005FCDD6    dd          005FD48F
 005FCDD6    dd          005FD495
 005FCDD6    dd          005FD49B
 005FCDD6    dd          005FD4A1
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4A7
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4AD
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4B9
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4BF
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4C5
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4CB
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4D1
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD429
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4D7
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4B3
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD42F
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD405
 005FCDD6    dd          005FD363
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD40B
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD411
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD417
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD423
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD41D
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD441
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD3AB
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD218
 005FCDD6    dd          005FD351
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4DD
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD21E
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD375
 005FCDD6    dd          005FD38D
 005FCDD6    dd          005FD381
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD399
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD39F
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD37B
 005FCDD6    dd          005FD393
 005FCDD6    dd          005FD387
 005FCDD6    dd          005FD369
 005FCDD6    dd          005FD36F
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4E3
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD33F
 005FCDD6    dd          005FD357
 005FCDD6    dd          005FD35D
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD46B
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD447
 005FCDD6    dd          005FD44D
 005FCDD6    dd          005FD453
 005FCDD6    dd          005FD459
 005FCDD6    dd          005FD45F
 005FCDD6    dd          005FD465
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD43B
 005FCDD6    dd          005FD435
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD501
 005FCDD6    dd          005FD4E9
 005FCDD6    dd          005FD4EF
 005FCDD6    dd          005FD4F5
 005FCDD6    dd          005FD4FB
 005FD1ED    mov         eax,1B
 005FD1F2    ret
 005FD1F3    sub         eax,3B
 005FD1F6    add         eax,70
 005FD1F9    ret
 005FD1FA    mov         eax,7A
 005FD1FF    ret
 005FD200    mov         eax,7B
 005FD205    ret
 005FD206    mov         eax,7C
 005FD20B    ret
 005FD20C    mov         eax,7D
 005FD211    ret
 005FD212    mov         eax,7E
 005FD217    ret
 005FD218    mov         eax,2C
 005FD21D    ret
 005FD21E    mov         eax,13
 005FD223    ret
 005FD224    mov         eax,91
 005FD229    ret
 005FD22A    mov         eax,0C0
 005FD22F    ret
 005FD230    sub         eax,31
 005FD233    add         eax,31
 005FD236    ret
 005FD237    mov         eax,30
 005FD23C    ret
 005FD23D    mov         eax,0BD
 005FD242    ret
 005FD243    mov         eax,0BB
 005FD248    ret
 005FD249    mov         eax,8
 005FD24E    ret
 005FD24F    mov         eax,9
 005FD254    ret
 005FD255    mov         eax,51
 005FD25A    ret
 005FD25B    mov         eax,57
 005FD260    ret
 005FD261    mov         eax,45
 005FD266    ret
 005FD267    mov         eax,52
 005FD26C    ret
 005FD26D    mov         eax,54
 005FD272    ret
 005FD273    mov         eax,59
 005FD278    ret
 005FD279    mov         eax,55
 005FD27E    ret
 005FD27F    mov         eax,49
 005FD284    ret
 005FD285    mov         eax,4F
 005FD28A    ret
 005FD28B    mov         eax,50
 005FD290    ret
 005FD291    mov         eax,0DB
 005FD296    ret
 005FD297    mov         eax,0DD
 005FD29C    ret
 005FD29D    mov         eax,0DC
 005FD2A2    ret
 005FD2A3    mov         eax,14
 005FD2A8    ret
 005FD2A9    mov         eax,41
 005FD2AE    ret
 005FD2AF    mov         eax,53
 005FD2B4    ret
 005FD2B5    mov         eax,44
 005FD2BA    ret
 005FD2BB    mov         eax,46
 005FD2C0    ret
 005FD2C1    mov         eax,47
 005FD2C6    ret
 005FD2C7    mov         eax,48
 005FD2CC    ret
 005FD2CD    mov         eax,4A
 005FD2D2    ret
 005FD2D3    mov         eax,4B
 005FD2D8    ret
 005FD2D9    mov         eax,4C
 005FD2DE    ret
 005FD2DF    mov         eax,0BA
 005FD2E4    ret
 005FD2E5    mov         eax,0DE
 005FD2EA    ret
 005FD2EB    mov         eax,0D
 005FD2F0    ret
 005FD2F1    mov         eax,0A0
 005FD2F6    ret
 005FD2F7    mov         eax,5A
 005FD2FC    ret
 005FD2FD    mov         eax,58
 005FD302    ret
 005FD303    mov         eax,43
 005FD308    ret
 005FD309    mov         eax,56
 005FD30E    ret
 005FD30F    mov         eax,42
 005FD314    ret
 005FD315    mov         eax,4E
 005FD31A    ret
 005FD31B    mov         eax,4D
 005FD320    ret
 005FD321    mov         eax,0BC
 005FD326    ret
 005FD327    mov         eax,0BE
 005FD32C    ret
 005FD32D    mov         eax,0BF
 005FD332    ret
 005FD333    mov         eax,0A1
 005FD338    ret
 005FD339    mov         eax,0A2
 005FD33E    ret
 005FD33F    mov         eax,5B
 005FD344    ret
 005FD345    mov         eax,0A4
 005FD34A    ret
 005FD34B    mov         eax,20
 005FD350    ret
 005FD351    mov         eax,0A5
 005FD356    ret
 005FD357    mov         eax,5C
 005FD35C    ret
 005FD35D    mov         eax,5D
 005FD362    ret
 005FD363    mov         eax,0A3
 005FD368    ret
 005FD369    mov         eax,2D
 005FD36E    ret
 005FD36F    mov         eax,2E
 005FD374    ret
 005FD375    mov         eax,24
 005FD37A    ret
 005FD37B    mov         eax,23
 005FD380    ret
 005FD381    mov         eax,21
 005FD386    ret
 005FD387    mov         eax,22
 005FD38C    ret
 005FD38D    mov         eax,26
 005FD392    ret
 005FD393    mov         eax,28
 005FD398    ret
 005FD399    mov         eax,25
 005FD39E    ret
 005FD39F    mov         eax,27
 005FD3A4    ret
 005FD3A5    mov         eax,90
 005FD3AA    ret
 005FD3AB    mov         eax,6F
 005FD3B0    ret
 005FD3B1    mov         eax,6A
 005FD3B6    ret
 005FD3B7    mov         eax,6D
 005FD3BC    ret
 005FD3BD    mov         eax,6B
 005FD3C2    ret
 005FD3C3    mov         eax,67
 005FD3C8    ret
 005FD3C9    mov         eax,68
 005FD3CE    ret
 005FD3CF    mov         eax,69
 005FD3D4    ret
 005FD3D5    mov         eax,64
 005FD3DA    ret
 005FD3DB    mov         eax,65
 005FD3E0    ret
 005FD3E1    mov         eax,66
 005FD3E6    ret
 005FD3E7    mov         eax,61
 005FD3EC    ret
 005FD3ED    mov         eax,62
 005FD3F2    ret
 005FD3F3    mov         eax,63
 005FD3F8    ret
 005FD3F9    mov         eax,60
 005FD3FE    ret
 005FD3FF    mov         eax,6E
 005FD404    ret
 005FD405    mov         eax,0D
 005FD40A    ret
 005FD40B    mov         eax,0AD
 005FD410    ret
 005FD411    mov         eax,0B3
 005FD416    ret
 005FD417    mov         eax,0B2
 005FD41C    ret
 005FD41D    mov         eax,0AF
 005FD422    ret
 005FD423    mov         eax,0AE
 005FD428    ret
 005FD429    mov         eax,0B1
 005FD42E    ret
 005FD42F    mov         eax,0B0
 005FD434    ret
 005FD435    mov         eax,0B5
 005FD43A    ret
 005FD43B    mov         eax,0B4
 005FD440    ret
 005FD441    mov         eax,0AC
 005FD446    ret
 005FD447    mov         eax,0AA
 005FD44C    ret
 005FD44D    mov         eax,0AB
 005FD452    ret
 005FD453    mov         eax,0A8
 005FD458    ret
 005FD459    mov         eax,0A9
 005FD45E    ret
 005FD45F    mov         eax,0A7
 005FD464    ret
 005FD465    mov         eax,0A6
 005FD46A    ret
 005FD46B    mov         eax,5F
 005FD470    ret
 005FD471    mov         eax,0E2
 005FD476    ret
 005FD477    mov         eax,7F
 005FD47C    ret
 005FD47D    mov         eax,80
 005FD482    ret
 005FD483    mov         eax,81
 005FD488    ret
 005FD489    mov         eax,82
 005FD48E    ret
 005FD48F    mov         eax,83
 005FD494    ret
 005FD495    mov         eax,84
 005FD49A    ret
 005FD49B    mov         eax,85
 005FD4A0    ret
 005FD4A1    mov         eax,86
 005FD4A6    ret
 005FD4A7    mov         eax,15
 005FD4AC    ret
 005FD4AD    mov         eax,0F7
 005FD4B2    ret
 005FD4B3    mov         eax,0E1
 005FD4B8    ret
 005FD4B9    mov         eax,0F8
 005FD4BE    ret
 005FD4BF    mov         eax,87
 005FD4C4    ret
 005FD4C5    mov         eax,1C
 005FD4CA    ret
 005FD4CB    mov         eax,1D
 005FD4D0    ret
 005FD4D1    mov         eax,92
 005FD4D6    ret
 005FD4D7    mov         eax,19
 005FD4DC    ret
 005FD4DD    mov         eax,2F
 005FD4E2    ret
 005FD4E3    mov         eax,2A
 005FD4E8    ret
 005FD4E9    mov         eax,10
 005FD4EE    ret
 005FD4EF    mov         eax,11
 005FD4F4    ret
 005FD4F5    mov         eax,12
 005FD4FA    ret
 005FD4FB    mov         eax,5B
 005FD500    ret
 005FD501    cmp         eax,0FF
>005FD506    jg          005FD512
 005FD508    push        1
 005FD50A    push        eax
 005FD50B    call        user32.MapVirtualKeyW
>005FD510    jmp         005FD514
 005FD512    xor         eax,eax
 005FD514    ret
end;*}

//005FD518
{*function sub_005FD518(?:Integer):?;
begin
 005FD518    mov         edx,eax
 005FD51A    cmp         edx,0A0
>005FD520    jg          005FD53F
>005FD522    je          005FD565
 005FD524    cmp         edx,12
>005FD527    jg          005FD535
>005FD529    je          005FD5A1
 005FD52B    sub         edx,10
>005FD52E    je          005FD595
 005FD530    dec         edx
>005FD531    je          005FD59B
>005FD533    jmp         005FD5A7
 005FD535    sub         edx,5B
>005FD538    je          005FD589
 005FD53A    dec         edx
>005FD53B    je          005FD58F
>005FD53D    jmp         005FD5A7
 005FD53F    add         edx,0FFFFFF5F
 005FD545    cmp         edx,4
>005FD548    ja          005FD5A7
 005FD54A    jmp         dword ptr [edx*4+5FD551]
 005FD54A    dd          005FD56B
 005FD54A    dd          005FD571
 005FD54A    dd          005FD577
 005FD54A    dd          005FD57D
 005FD54A    dd          005FD583
 005FD565    mov         eax,2A
 005FD56A    ret
 005FD56B    mov         eax,36
 005FD570    ret
 005FD571    mov         eax,1D
 005FD576    ret
 005FD577    mov         eax,9D
 005FD57C    ret
 005FD57D    mov         eax,38
 005FD582    ret
 005FD583    mov         eax,0B8
 005FD588    ret
 005FD589    mov         eax,0DB
 005FD58E    ret
 005FD58F    mov         eax,0DC
 005FD594    ret
 005FD595    mov         eax,100
 005FD59A    ret
 005FD59B    mov         eax,101
 005FD5A0    ret
 005FD5A1    mov         eax,102
 005FD5A6    ret
 005FD5A7    push        0
 005FD5A9    push        eax
 005FD5AA    call        user32.MapVirtualKeyW
 005FD5AF    ret
end;*}

//005FD5B0
procedure sub_005FD5B0;
begin
{*
 005FD5B0    cmp         dword ptr ds:[78BD14],0;gvar_0078BD14:Pointer
>005FD5B7    je          005FD60C
 005FD5B9    mov         eax,[0078BD14];0x0 gvar_0078BD14:Pointer
 005FD5BE    call        @FreeMem
 005FD5C3    xor         eax,eax
 005FD5C5    mov         [0078BD14],eax;gvar_0078BD14:Pointer
 005FD5CA    xor         eax,eax
 005FD5CC    mov         [0078BD18],eax;gvar_0078BD18
 005FD5D1    xor         eax,eax
 005FD5D3    mov         [008177F0],eax;gvar_008177F0
 005FD5D8    xor         eax,eax
 005FD5DA    mov         [008177F4],eax;gvar_008177F4
 005FD5DF    mov         eax,10
 005FD5E4    mov         edx,816EAC;gvar_00816EAC
 005FD5E9    xor         ecx,ecx
 005FD5EB    mov         dword ptr [edx],ecx
 005FD5ED    add         edx,1C
 005FD5F0    dec         eax
>005FD5F1    jne         005FD5E9
 005FD5F3    mov         eax,10
 005FD5F8    mov         edx,817070;gvar_00817070
 005FD5FD    xor         ecx,ecx
 005FD5FF    mov         dword ptr [edx],ecx
 005FD601    add         edx,78
 005FD604    dec         eax
>005FD605    jne         005FD5FD
 005FD607    call        005FD614
 005FD60C    mov         byte ptr ds:[78BD10],0;gvar_0078BD10
 005FD613    ret
*}
end;

//005FD614
procedure sub_005FD614;
begin
{*
 005FD614    push        esi
 005FD615    push        edi
 005FD616    mov         edx,10
 005FD61B    mov         eax,816EB0;gvar_00816EB0
 005FD620    xor         ecx,ecx
 005FD622    mov         dword ptr [eax],ecx
 005FD624    xor         ecx,ecx
 005FD626    mov         dword ptr [eax+4],ecx
 005FD629    xor         ecx,ecx
 005FD62B    mov         dword ptr [eax+8],ecx
 005FD62E    xor         ecx,ecx
 005FD630    mov         dword ptr [eax+14],ecx
 005FD633    add         eax,1C
 005FD636    dec         edx
>005FD637    jne         005FD620
 005FD639    mov         edx,10
 005FD63E    mov         eax,817074;gvar_00817074
 005FD643    mov         byte ptr [eax],0
 005FD646    mov         byte ptr [eax+1],0
 005FD64A    mov         byte ptr [eax+2],0
 005FD64E    mov         byte ptr [eax+3],0
 005FD652    mov         byte ptr [eax+4],0
 005FD656    mov         byte ptr [eax+5],0
 005FD65A    mov         byte ptr [eax+6],0
 005FD65E    mov         byte ptr [eax+7],0
 005FD662    mov         byte ptr [eax+8],0
 005FD666    mov         byte ptr [eax+9],0
 005FD66A    mov         byte ptr [eax+0A],0
 005FD66E    mov         esi,5FD6AC
 005FD673    lea         edi,[eax+0B]
 005FD676    mov         ecx,8
 005FD67B    rep movs    dword ptr [edi],dword ptr [esi]
 005FD67D    mov         esi,5FD6AC
 005FD682    lea         edi,[eax+2B]
 005FD685    mov         ecx,8
 005FD68A    rep movs    dword ptr [edi],dword ptr [esi]
 005FD68C    mov         esi,5FD6AC
 005FD691    lea         edi,[eax+4B]
 005FD694    mov         ecx,8
 005FD699    rep movs    dword ptr [edi],dword ptr [esi]
 005FD69B    xor         ecx,ecx
 005FD69D    mov         dword ptr [eax+6C],ecx
 005FD6A0    mov         dword ptr [eax+70],ecx
 005FD6A3    add         eax,78
 005FD6A6    dec         edx
>005FD6A7    jne         005FD643
 005FD6A9    pop         edi
 005FD6AA    pop         esi
 005FD6AB    ret
*}
end;

//005FD6CC
{*function sub_005FD6CC(?:?):?;
begin
 005FD6CC    push        ebp
 005FD6CD    mov         ebp,esp
 005FD6CF    mov         ecx,8C
 005FD6D4    push        0
 005FD6D6    push        0
 005FD6D8    dec         ecx
>005FD6D9    jne         005FD6D4
 005FD6DB    push        ebx
 005FD6DC    push        esi
 005FD6DD    push        edi
 005FD6DE    mov         dword ptr [ebp-4],eax
 005FD6E1    mov         edi,816EAC;gvar_00816EAC
 005FD6E6    xor         eax,eax
 005FD6E8    push        ebp
 005FD6E9    push        5FE0CE
 005FD6EE    push        dword ptr fs:[eax]
 005FD6F1    mov         dword ptr fs:[eax],esp
 005FD6F4    cmp         byte ptr ds:[78BD10],0;gvar_0078BD10
>005FD6FB    je          005FD707
 005FD6FD    mov         ebx,1
>005FD702    jmp         005FE080
 005FD707    xor         eax,eax
 005FD709    mov         [0078BD14],eax;gvar_0078BD14:Pointer
 005FD70E    xor         eax,eax
 005FD710    mov         [0078BD18],eax;gvar_0078BD18
 005FD715    cmp         dword ptr ds:[816E9C],0;gvar_00816E9C:Pointer
>005FD71C    je          005FD730
 005FD71E    cmp         dword ptr ds:[816EA0],0;gvar_00816EA0:Pointer
>005FD725    je          005FD730
 005FD727    cmp         dword ptr ds:[816EA4],0;gvar_00816EA4:Pointer
>005FD72E    jne         005FD73C
 005FD730    call        005FD5B0
 005FD735    xor         ebx,ebx
>005FD737    jmp         005FE080
 005FD73C    mov         byte ptr ds:[78BD10],1;gvar_0078BD10
 005FD743    push        8
 005FD745    lea         eax,[ebp-8]
 005FD748    push        eax
 005FD749    push        0
 005FD74B    call        dword ptr ds:[816EA4]
 005FD751    test        eax,eax
>005FD753    je          005FD761
 005FD755    call        005FD5B0
 005FD75A    xor         ebx,ebx
>005FD75C    jmp         005FE080
 005FD761    mov         eax,dword ptr [ebp-8]
 005FD764    add         eax,eax
 005FD766    add         eax,eax
 005FD768    add         eax,eax
 005FD76A    call        @GetMem
 005FD76F    mov         esi,eax
 005FD771    push        8
 005FD773    lea         eax,[ebp-8]
 005FD776    push        eax
 005FD777    push        esi
 005FD778    call        dword ptr ds:[816EA4]
 005FD77E    cmp         eax,0FFFFFFFF
>005FD781    jne         005FD796
 005FD783    mov         eax,esi
 005FD785    call        @FreeMem
 005FD78A    call        005FD5B0
 005FD78F    xor         ebx,ebx
>005FD791    jmp         005FE080
 005FD796    mov         dword ptr ds:[8177F0],1;gvar_008177F0
 005FD7A0    mov         dword ptr ds:[8177F4],1;gvar_008177F4
 005FD7AA    xor         eax,eax
 005FD7AC    mov         dword ptr [edi],eax
 005FD7AE    mov         ebx,dword ptr [ebp-8]
 005FD7B1    dec         ebx
 005FD7B2    cmp         ebx,0
>005FD7B5    jb          005FDBFA
 005FD7BB    cmp         dword ptr [esi+ebx*8],0
>005FD7BF    je          005FD896
 005FD7C5    cmp         dword ptr [esi+ebx*8+4],0
>005FD7CA    jne         005FD896
 005FD7D0    cmp         dword ptr ds:[8177F0],0F;gvar_008177F0
>005FD7D7    jge         005FDBF0
 005FD7DD    mov         dword ptr [ebp-0C],3E8
 005FD7E4    lea         eax,[ebp-0C]
 005FD7E7    push        eax
 005FD7E8    lea         eax,[ebp-425]
 005FD7EE    push        eax
 005FD7EF    push        20000007
 005FD7F4    mov         eax,dword ptr [esi+ebx*8]
 005FD7F7    push        eax
 005FD7F8    call        dword ptr ds:[816EA8]
 005FD7FE    mov         eax,dword ptr [ebp-0C]
 005FD801    mov         byte ptr [ebp+eax-424],0
 005FD809    lea         eax,[ebp-42C]
 005FD80F    lea         edx,[ebp-425]
 005FD815    mov         ecx,401
 005FD81A    push        0
 005FD81C    call        @LStrFromArray
 005FD821    mov         edx,dword ptr [ebp-42C]
 005FD827    mov         eax,5FE0EC;'\Root#RDP_MOU'
 005FD82C    call        Pos
 005FD831    test        eax,eax
>005FD833    jle         005FD858
 005FD835    mov         eax,dword ptr [esi+ebx*8]
 005FD838    mov         dword ptr [edi],eax
 005FD83A    xor         eax,eax
 005FD83C    mov         dword ptr [edi+4],eax
 005FD83F    xor         eax,eax
 005FD841    mov         dword ptr [edi+8],eax
 005FD844    xor         eax,eax
 005FD846    mov         dword ptr [edi+0C],eax
 005FD849    xor         eax,eax
 005FD84B    mov         dword ptr [edi+14],eax
 005FD84E    xor         eax,eax
 005FD850    mov         dword ptr [edi+18],eax
>005FD853    jmp         005FDBF0
 005FD858    mov         eax,[008177F0];gvar_008177F0
 005FD85D    mov         edx,eax
 005FD85F    add         eax,eax
 005FD861    add         eax,eax
 005FD863    add         eax,eax
 005FD865    sub         eax,edx
 005FD867    mov         edx,dword ptr [esi+ebx*8]
 005FD86A    mov         dword ptr [edi+eax*4],edx
 005FD86D    xor         edx,edx
 005FD86F    mov         dword ptr [edi+eax*4+4],edx
 005FD873    xor         edx,edx
 005FD875    mov         dword ptr [edi+eax*4+8],edx
 005FD879    xor         edx,edx
 005FD87B    mov         dword ptr [edi+eax*4+0C],edx
 005FD87F    xor         edx,edx
 005FD881    mov         dword ptr [edi+eax*4+14],edx
 005FD885    xor         edx,edx
 005FD887    mov         dword ptr [edi+eax*4+18],edx
 005FD88B    inc         dword ptr ds:[8177F0];gvar_008177F0
>005FD891    jmp         005FDBF0
 005FD896    cmp         dword ptr [esi+ebx*8],0
>005FD89A    je          005FDBF0
 005FD8A0    cmp         dword ptr [esi+ebx*8+4],1
>005FD8A5    jne         005FDBF0
 005FD8AB    cmp         dword ptr ds:[8177F4],0F;gvar_008177F4
>005FD8B2    jge         005FDBF0
 005FD8B8    mov         dword ptr [ebp-0C],3E8
 005FD8BF    lea         eax,[ebp-0C]
 005FD8C2    push        eax
 005FD8C3    lea         eax,[ebp-425]
 005FD8C9    push        eax
 005FD8CA    push        20000007
 005FD8CF    mov         eax,dword ptr [esi+ebx*8]
 005FD8D2    push        eax
 005FD8D3    call        dword ptr ds:[816EA8]
 005FD8D9    mov         eax,dword ptr [ebp-0C]
 005FD8DC    mov         byte ptr [ebp+eax-424],0
 005FD8E4    lea         eax,[ebp-430]
 005FD8EA    lea         edx,[ebp-425]
 005FD8F0    mov         ecx,401
 005FD8F5    push        0
 005FD8F7    call        @LStrFromArray
 005FD8FC    mov         edx,dword ptr [ebp-430]
 005FD902    mov         eax,5FE108;'\Root#RDP_KBD'
 005FD907    call        Pos
 005FD90C    test        eax,eax
>005FD90E    jle         005FD9BB
 005FD914    mov         eax,dword ptr [esi+ebx*8]
 005FD917    mov         [00817070],eax;gvar_00817070
 005FD91C    mov         byte ptr ds:[817074],0;gvar_00817074
 005FD923    mov         byte ptr ds:[817075],0;gvar_00817075
 005FD92A    mov         byte ptr ds:[817076],0;gvar_00817076
 005FD931    mov         byte ptr ds:[817077],0;gvar_00817077
 005FD938    mov         byte ptr ds:[817078],0;gvar_00817078
 005FD93F    mov         byte ptr ds:[817079],0;gvar_00817079
 005FD946    mov         byte ptr ds:[81707A],0;gvar_0081707A
 005FD94D    mov         byte ptr ds:[81707B],0;gvar_0081707B
 005FD954    mov         byte ptr ds:[81707C],0;gvar_0081707C
 005FD95B    mov         byte ptr ds:[81707D],0;gvar_0081707D
 005FD962    mov         byte ptr ds:[81707E],0;gvar_0081707E
 005FD969    push        esi
 005FD96A    push        edi
 005FD96B    mov         esi,5FE118
 005FD970    mov         edi,81707F;gvar_0081707F
 005FD975    mov         ecx,8
 005FD97A    rep movs    dword ptr [edi],dword ptr [esi]
 005FD97C    pop         edi
 005FD97D    pop         esi
 005FD97E    push        esi
 005FD97F    push        edi
 005FD980    mov         esi,5FE118
 005FD985    mov         edi,81709F;gvar_0081709F
 005FD98A    mov         ecx,8
 005FD98F    rep movs    dword ptr [edi],dword ptr [esi]
 005FD991    pop         edi
 005FD992    pop         esi
 005FD993    push        esi
 005FD994    push        edi
 005FD995    mov         esi,5FE118
 005FD99A    mov         edi,8170BF;gvar_008170BF
 005FD99F    mov         ecx,8
 005FD9A4    rep movs    dword ptr [edi],dword ptr [esi]
 005FD9A6    pop         edi
 005FD9A7    pop         esi
 005FD9A8    xor         eax,eax
 005FD9AA    mov         dword ptr ds:[8170E0],eax;gvar_008170E0
 005FD9B0    mov         dword ptr ds:[8170E4],eax;gvar_008170E4
>005FD9B6    jmp         005FDBF0
 005FD9BB    lea         eax,[ebp-434]
 005FD9C1    lea         edx,[ebp-425]
 005FD9C7    mov         ecx,401
 005FD9CC    push        0
 005FD9CE    call        @LStrFromArray
 005FD9D3    mov         edx,dword ptr [ebp-434]
 005FD9D9    mov         eax,5FE144;'\HID#VID_'
 005FD9DE    call        Pos
 005FD9E3    test        eax,eax
>005FD9E5    jg          005FDA17
 005FD9E7    lea         eax,[ebp-438]
 005FD9ED    lea         edx,[ebp-425]
 005FD9F3    mov         ecx,401
 005FD9F8    push        0
 005FD9FA    call        @LStrFromArray
 005FD9FF    mov         edx,dword ptr [ebp-438]
 005FDA05    mov         eax,5FE15C;'\HID#'
 005FDA0A    call        Pos
 005FDA0F    test        eax,eax
>005FDA11    jne         005FDBF0
 005FDA17    mov         eax,[008177F4];gvar_008177F4
 005FDA1C    mov         edx,eax
 005FDA1E    shl         eax,4
 005FDA21    sub         eax,edx
 005FDA23    mov         edx,dword ptr [esi+ebx*8]
 005FDA26    mov         dword ptr [eax*8+817070],edx;gvar_00817070
 005FDA2D    mov         eax,[008177F4];gvar_008177F4
 005FDA32    mov         edx,eax
 005FDA34    shl         eax,4
 005FDA37    sub         eax,edx
 005FDA39    mov         byte ptr [eax*8+817074],0;gvar_00817074
 005FDA41    mov         eax,[008177F4];gvar_008177F4
 005FDA46    mov         edx,eax
 005FDA48    shl         eax,4
 005FDA4B    sub         eax,edx
 005FDA4D    mov         byte ptr [eax*8+817075],0;gvar_00817075
 005FDA55    mov         eax,[008177F4];gvar_008177F4
 005FDA5A    mov         edx,eax
 005FDA5C    shl         eax,4
 005FDA5F    sub         eax,edx
 005FDA61    mov         byte ptr [eax*8+817076],0;gvar_00817076
 005FDA69    mov         eax,[008177F4];gvar_008177F4
 005FDA6E    mov         edx,eax
 005FDA70    shl         eax,4
 005FDA73    sub         eax,edx
 005FDA75    mov         byte ptr [eax*8+817077],0;gvar_00817077
 005FDA7D    mov         eax,[008177F4];gvar_008177F4
 005FDA82    mov         edx,eax
 005FDA84    shl         eax,4
 005FDA87    sub         eax,edx
 005FDA89    mov         byte ptr [eax*8+817078],0;gvar_00817078
 005FDA91    mov         eax,[008177F4];gvar_008177F4
 005FDA96    mov         edx,eax
 005FDA98    shl         eax,4
 005FDA9B    sub         eax,edx
 005FDA9D    mov         byte ptr [eax*8+817079],0;gvar_00817079
 005FDAA5    mov         eax,[008177F4];gvar_008177F4
 005FDAAA    mov         edx,eax
 005FDAAC    shl         eax,4
 005FDAAF    sub         eax,edx
 005FDAB1    mov         byte ptr [eax*8+81707A],0;gvar_0081707A
 005FDAB9    mov         eax,[008177F4];gvar_008177F4
 005FDABE    mov         edx,eax
 005FDAC0    shl         eax,4
 005FDAC3    sub         eax,edx
 005FDAC5    mov         byte ptr [eax*8+81707B],0;gvar_0081707B
 005FDACD    mov         eax,[008177F4];gvar_008177F4
 005FDAD2    mov         edx,eax
 005FDAD4    shl         eax,4
 005FDAD7    sub         eax,edx
 005FDAD9    mov         byte ptr [eax*8+81707C],0;gvar_0081707C
 005FDAE1    mov         eax,[008177F4];gvar_008177F4
 005FDAE6    mov         edx,eax
 005FDAE8    shl         eax,4
 005FDAEB    sub         eax,edx
 005FDAED    mov         byte ptr [eax*8+81707D],0;gvar_0081707D
 005FDAF5    mov         eax,[008177F4];gvar_008177F4
 005FDAFA    mov         edx,eax
 005FDAFC    shl         eax,4
 005FDAFF    sub         eax,edx
 005FDB01    mov         byte ptr [eax*8+81707E],0;gvar_0081707E
 005FDB09    mov         eax,[008177F4];gvar_008177F4
 005FDB0E    mov         edx,eax
 005FDB10    shl         eax,4
 005FDB13    sub         eax,edx
 005FDB15    push        esi
 005FDB16    push        edi
 005FDB17    lea         edi,[eax*8+81707F];gvar_0081707F
 005FDB1E    mov         esi,5FE118
 005FDB23    mov         ecx,8
 005FDB28    rep movs    dword ptr [edi],dword ptr [esi]
 005FDB2A    pop         edi
 005FDB2B    pop         esi
 005FDB2C    mov         eax,[008177F4];gvar_008177F4
 005FDB31    mov         edx,eax
 005FDB33    shl         eax,4
 005FDB36    sub         eax,edx
 005FDB38    push        esi
 005FDB39    push        edi
 005FDB3A    lea         edi,[eax*8+81709F];gvar_0081709F
 005FDB41    mov         esi,5FE118
 005FDB46    mov         ecx,8
 005FDB4B    rep movs    dword ptr [edi],dword ptr [esi]
 005FDB4D    pop         edi
 005FDB4E    pop         esi
 005FDB4F    mov         eax,[008177F4];gvar_008177F4
 005FDB54    mov         edx,eax
 005FDB56    shl         eax,4
 005FDB59    sub         eax,edx
 005FDB5B    push        esi
 005FDB5C    push        edi
 005FDB5D    lea         edi,[eax*8+8170BF];gvar_008170BF
 005FDB64    mov         esi,5FE118
 005FDB69    mov         ecx,8
 005FDB6E    rep movs    dword ptr [edi],dword ptr [esi]
 005FDB70    pop         edi
 005FDB71    pop         esi
 005FDB72    mov         eax,[008177F4];gvar_008177F4
 005FDB77    mov         edx,eax
 005FDB79    shl         eax,4
 005FDB7C    sub         eax,edx
 005FDB7E    xor         edx,edx
 005FDB80    mov         dword ptr [eax*8+8170E0],edx;gvar_008170E0
 005FDB87    mov         dword ptr [eax*8+8170E4],edx;gvar_008170E4
 005FDB8E    push        5FE170;'Keyboard '
 005FDB93    lea         edx,[ebp-440]
 005FDB99    mov         eax,[008177F4];gvar_008177F4
 005FDB9E    call        IntToStr
 005FDBA3    push        dword ptr [ebp-440]
 005FDBA9    push        5FE190;'="'
 005FDBAE    lea         eax,[ebp-444]
 005FDBB4    lea         edx,[ebp-425]
 005FDBBA    mov         ecx,401
 005FDBBF    call        @UStrFromArray
 005FDBC4    push        dword ptr [ebp-444]
 005FDBCA    push        5FE1A4;'"'
 005FDBCF    lea         eax,[ebp-43C]
 005FDBD5    mov         edx,5
 005FDBDA    call        @UStrCatN
 005FDBDF    mov         eax,dword ptr [ebp-43C]
 005FDBE5    call        004FA044
 005FDBEA    inc         dword ptr ds:[8177F4];gvar_008177F4
 005FDBF0    dec         ebx
 005FDBF1    cmp         ebx,0FFFFFFFF
>005FDBF4    jne         005FD7BB
 005FDBFA    mov         ebx,dword ptr [ebp-8]
 005FDBFD    dec         ebx
 005FDBFE    cmp         ebx,0
>005FDC01    jb          005FDFA3
 005FDC07    cmp         dword ptr [esi+ebx*8],0
>005FDC0B    je          005FDCE2
 005FDC11    cmp         dword ptr [esi+ebx*8+4],0
>005FDC16    jne         005FDCE2
 005FDC1C    cmp         dword ptr ds:[8177F0],0F;gvar_008177F0
>005FDC23    jge         005FDF99
 005FDC29    mov         dword ptr [ebp-0C],3E8
 005FDC30    lea         eax,[ebp-0C]
 005FDC33    push        eax
 005FDC34    lea         eax,[ebp-425]
 005FDC3A    push        eax
 005FDC3B    push        20000007
 005FDC40    mov         eax,dword ptr [esi+ebx*8]
 005FDC43    push        eax
 005FDC44    call        dword ptr ds:[816EA8]
 005FDC4A    mov         eax,dword ptr [ebp-0C]
 005FDC4D    mov         byte ptr [ebp+eax-424],0
 005FDC55    lea         eax,[ebp-448]
 005FDC5B    lea         edx,[ebp-425]
 005FDC61    mov         ecx,401
 005FDC66    push        0
 005FDC68    call        @LStrFromArray
 005FDC6D    mov         edx,dword ptr [ebp-448]
 005FDC73    mov         eax,5FE0EC;'\Root#RDP_MOU'
 005FDC78    call        Pos
 005FDC7D    test        eax,eax
>005FDC7F    jle         005FDCA4
 005FDC81    mov         eax,dword ptr [esi+ebx*8]
 005FDC84    mov         dword ptr [edi],eax
 005FDC86    xor         eax,eax
 005FDC88    mov         dword ptr [edi+4],eax
 005FDC8B    xor         eax,eax
 005FDC8D    mov         dword ptr [edi+8],eax
 005FDC90    xor         eax,eax
 005FDC92    mov         dword ptr [edi+0C],eax
 005FDC95    xor         eax,eax
 005FDC97    mov         dword ptr [edi+14],eax
 005FDC9A    xor         eax,eax
 005FDC9C    mov         dword ptr [edi+18],eax
>005FDC9F    jmp         005FDF99
 005FDCA4    mov         eax,[008177F0];gvar_008177F0
 005FDCA9    mov         edx,eax
 005FDCAB    add         eax,eax
 005FDCAD    add         eax,eax
 005FDCAF    add         eax,eax
 005FDCB1    sub         eax,edx
 005FDCB3    mov         edx,dword ptr [esi+ebx*8]
 005FDCB6    mov         dword ptr [edi+eax*4],edx
 005FDCB9    xor         edx,edx
 005FDCBB    mov         dword ptr [edi+eax*4+4],edx
 005FDCBF    xor         edx,edx
 005FDCC1    mov         dword ptr [edi+eax*4+8],edx
 005FDCC5    xor         edx,edx
 005FDCC7    mov         dword ptr [edi+eax*4+0C],edx
 005FDCCB    xor         edx,edx
 005FDCCD    mov         dword ptr [edi+eax*4+14],edx
 005FDCD1    xor         edx,edx
 005FDCD3    mov         dword ptr [edi+eax*4+18],edx
 005FDCD7    inc         dword ptr ds:[8177F0];gvar_008177F0
>005FDCDD    jmp         005FDF99
 005FDCE2    cmp         dword ptr [esi+ebx*8],0
>005FDCE6    je          005FDF99
 005FDCEC    cmp         dword ptr [esi+ebx*8+4],1
>005FDCF1    jne         005FDF99
 005FDCF7    cmp         dword ptr ds:[8177F4],0F;gvar_008177F4
>005FDCFE    jge         005FDF99
 005FDD04    mov         dword ptr [ebp-0C],3E8
 005FDD0B    lea         eax,[ebp-0C]
 005FDD0E    push        eax
 005FDD0F    lea         eax,[ebp-425]
 005FDD15    push        eax
 005FDD16    push        20000007
 005FDD1B    mov         eax,dword ptr [esi+ebx*8]
 005FDD1E    push        eax
 005FDD1F    call        dword ptr ds:[816EA8]
 005FDD25    mov         eax,dword ptr [ebp-0C]
 005FDD28    mov         byte ptr [ebp+eax-424],0
 005FDD30    lea         eax,[ebp-44C]
 005FDD36    lea         edx,[ebp-425]
 005FDD3C    mov         ecx,401
 005FDD41    push        0
 005FDD43    call        @LStrFromArray
 005FDD48    mov         edx,dword ptr [ebp-44C]
 005FDD4E    mov         eax,5FE108;'\Root#RDP_KBD'
 005FDD53    call        Pos
 005FDD58    test        eax,eax
>005FDD5A    jg          005FDF99
 005FDD60    lea         eax,[ebp-450]
 005FDD66    lea         edx,[ebp-425]
 005FDD6C    mov         ecx,401
 005FDD71    push        0
 005FDD73    call        @LStrFromArray
 005FDD78    mov         edx,dword ptr [ebp-450]
 005FDD7E    mov         eax,5FE144;'\HID#VID_'
 005FDD83    call        Pos
 005FDD88    test        eax,eax
>005FDD8A    jg          005FDF99
 005FDD90    lea         eax,[ebp-454]
 005FDD96    lea         edx,[ebp-425]
 005FDD9C    mov         ecx,401
 005FDDA1    push        0
 005FDDA3    call        @LStrFromArray
 005FDDA8    mov         edx,dword ptr [ebp-454]
 005FDDAE    mov         eax,5FE15C;'\HID#'
 005FDDB3    call        Pos
 005FDDB8    test        eax,eax
>005FDDBA    je          005FDF99
 005FDDC0    mov         eax,[008177F4];gvar_008177F4
 005FDDC5    mov         edx,eax
 005FDDC7    shl         eax,4
 005FDDCA    sub         eax,edx
 005FDDCC    mov         edx,dword ptr [esi+ebx*8]
 005FDDCF    mov         dword ptr [eax*8+817070],edx;gvar_00817070
 005FDDD6    mov         eax,[008177F4];gvar_008177F4
 005FDDDB    mov         edx,eax
 005FDDDD    shl         eax,4
 005FDDE0    sub         eax,edx
 005FDDE2    mov         byte ptr [eax*8+817074],0;gvar_00817074
 005FDDEA    mov         eax,[008177F4];gvar_008177F4
 005FDDEF    mov         edx,eax
 005FDDF1    shl         eax,4
 005FDDF4    sub         eax,edx
 005FDDF6    mov         byte ptr [eax*8+817075],0;gvar_00817075
 005FDDFE    mov         eax,[008177F4];gvar_008177F4
 005FDE03    mov         edx,eax
 005FDE05    shl         eax,4
 005FDE08    sub         eax,edx
 005FDE0A    mov         byte ptr [eax*8+817076],0;gvar_00817076
 005FDE12    mov         eax,[008177F4];gvar_008177F4
 005FDE17    mov         edx,eax
 005FDE19    shl         eax,4
 005FDE1C    sub         eax,edx
 005FDE1E    mov         byte ptr [eax*8+817077],0;gvar_00817077
 005FDE26    mov         eax,[008177F4];gvar_008177F4
 005FDE2B    mov         edx,eax
 005FDE2D    shl         eax,4
 005FDE30    sub         eax,edx
 005FDE32    mov         byte ptr [eax*8+817078],0;gvar_00817078
 005FDE3A    mov         eax,[008177F4];gvar_008177F4
 005FDE3F    mov         edx,eax
 005FDE41    shl         eax,4
 005FDE44    sub         eax,edx
 005FDE46    mov         byte ptr [eax*8+817079],0;gvar_00817079
 005FDE4E    mov         eax,[008177F4];gvar_008177F4
 005FDE53    mov         edx,eax
 005FDE55    shl         eax,4
 005FDE58    sub         eax,edx
 005FDE5A    mov         byte ptr [eax*8+81707A],0;gvar_0081707A
 005FDE62    mov         eax,[008177F4];gvar_008177F4
 005FDE67    mov         edx,eax
 005FDE69    shl         eax,4
 005FDE6C    sub         eax,edx
 005FDE6E    mov         byte ptr [eax*8+81707B],0;gvar_0081707B
 005FDE76    mov         eax,[008177F4];gvar_008177F4
 005FDE7B    mov         edx,eax
 005FDE7D    shl         eax,4
 005FDE80    sub         eax,edx
 005FDE82    mov         byte ptr [eax*8+81707C],0;gvar_0081707C
 005FDE8A    mov         eax,[008177F4];gvar_008177F4
 005FDE8F    mov         edx,eax
 005FDE91    shl         eax,4
 005FDE94    sub         eax,edx
 005FDE96    mov         byte ptr [eax*8+81707D],0;gvar_0081707D
 005FDE9E    mov         eax,[008177F4];gvar_008177F4
 005FDEA3    mov         edx,eax
 005FDEA5    shl         eax,4
 005FDEA8    sub         eax,edx
 005FDEAA    mov         byte ptr [eax*8+81707E],0;gvar_0081707E
 005FDEB2    mov         eax,[008177F4];gvar_008177F4
 005FDEB7    mov         edx,eax
 005FDEB9    shl         eax,4
 005FDEBC    sub         eax,edx
 005FDEBE    push        esi
 005FDEBF    push        edi
 005FDEC0    lea         edi,[eax*8+81707F];gvar_0081707F
 005FDEC7    mov         esi,5FE118
 005FDECC    mov         ecx,8
 005FDED1    rep movs    dword ptr [edi],dword ptr [esi]
 005FDED3    pop         edi
 005FDED4    pop         esi
 005FDED5    mov         eax,[008177F4];gvar_008177F4
 005FDEDA    mov         edx,eax
 005FDEDC    shl         eax,4
 005FDEDF    sub         eax,edx
 005FDEE1    push        esi
 005FDEE2    push        edi
 005FDEE3    lea         edi,[eax*8+81709F];gvar_0081709F
 005FDEEA    mov         esi,5FE118
 005FDEEF    mov         ecx,8
 005FDEF4    rep movs    dword ptr [edi],dword ptr [esi]
 005FDEF6    pop         edi
 005FDEF7    pop         esi
 005FDEF8    mov         eax,[008177F4];gvar_008177F4
 005FDEFD    mov         edx,eax
 005FDEFF    shl         eax,4
 005FDF02    sub         eax,edx
 005FDF04    push        esi
 005FDF05    push        edi
 005FDF06    lea         edi,[eax*8+8170BF];gvar_008170BF
 005FDF0D    mov         esi,5FE118
 005FDF12    mov         ecx,8
 005FDF17    rep movs    dword ptr [edi],dword ptr [esi]
 005FDF19    pop         edi
 005FDF1A    pop         esi
 005FDF1B    mov         eax,[008177F4];gvar_008177F4
 005FDF20    mov         edx,eax
 005FDF22    shl         eax,4
 005FDF25    sub         eax,edx
 005FDF27    xor         edx,edx
 005FDF29    mov         dword ptr [eax*8+8170E0],edx;gvar_008170E0
 005FDF30    mov         dword ptr [eax*8+8170E4],edx;gvar_008170E4
 005FDF37    push        5FE170;'Keyboard '
 005FDF3C    lea         edx,[ebp-45C]
 005FDF42    mov         eax,[008177F4];gvar_008177F4
 005FDF47    call        IntToStr
 005FDF4C    push        dword ptr [ebp-45C]
 005FDF52    push        5FE190;'="'
 005FDF57    lea         eax,[ebp-460]
 005FDF5D    lea         edx,[ebp-425]
 005FDF63    mov         ecx,401
 005FDF68    call        @UStrFromArray
 005FDF6D    push        dword ptr [ebp-460]
 005FDF73    push        5FE1A4;'"'
 005FDF78    lea         eax,[ebp-458]
 005FDF7E    mov         edx,5
 005FDF83    call        @UStrCatN
 005FDF88    mov         eax,dword ptr [ebp-458]
 005FDF8E    call        004FA044
 005FDF93    inc         dword ptr ds:[8177F4];gvar_008177F4
 005FDF99    dec         ebx
 005FDF9A    cmp         ebx,0FFFFFFFF
>005FDF9D    jne         005FDC07
 005FDFA3    mov         eax,esi
 005FDFA5    call        @FreeMem
 005FDFAA    mov         word ptr [ebp-24],1
 005FDFB0    mov         word ptr [ebp-22],2
 005FDFB6    mov         dword ptr [ebp-20],100
 005FDFBD    mov         eax,dword ptr [ebp-4]
 005FDFC0    mov         dword ptr [ebp-1C],eax
 005FDFC3    mov         word ptr [ebp-18],1
 005FDFC9    mov         word ptr [ebp-16],6
 005FDFCF    mov         dword ptr [ebp-14],100
 005FDFD6    mov         eax,dword ptr [ebp-4]
 005FDFD9    mov         dword ptr [ebp-10],eax
 005FDFDC    push        0C
 005FDFDE    push        2
 005FDFE0    lea         eax,[ebp-24]
 005FDFE3    push        eax
 005FDFE4    call        dword ptr ds:[816E9C]
 005FDFEA    test        eax,eax
>005FDFEC    jne         005FDFFA
 005FDFEE    call        005FD5B0
 005FDFF3    xor         ebx,ebx
>005FDFF5    jmp         005FE080
 005FDFFA    mov         ebx,dword ptr ds:[8177F0];gvar_008177F0
 005FE000    dec         ebx
 005FE001    test        ebx,ebx
>005FE003    jb          005FE039
 005FE005    inc         ebx
 005FE006    mov         esi,edi
 005FE008    mov         dword ptr [ebp-0C],3E8
 005FE00F    lea         eax,[ebp-0C]
 005FE012    push        eax
 005FE013    lea         eax,[ebp-425]
 005FE019    push        eax
 005FE01A    push        20000007
 005FE01F    mov         eax,dword ptr [esi]
 005FE021    push        eax
 005FE022    call        dword ptr ds:[816EA8]
 005FE028    mov         eax,dword ptr [ebp-0C]
 005FE02B    mov         byte ptr [ebp+eax-424],0
 005FE033    add         esi,1C
 005FE036    dec         ebx
>005FE037    jne         005FE008
 005FE039    mov         ebx,dword ptr ds:[8177F4];gvar_008177F4
 005FE03F    dec         ebx
 005FE040    test        ebx,ebx
>005FE042    jb          005FE07B
 005FE044    inc         ebx
 005FE045    mov         esi,817070;gvar_00817070
 005FE04A    mov         dword ptr [ebp-0C],3E8
 005FE051    lea         eax,[ebp-0C]
 005FE054    push        eax
 005FE055    lea         eax,[ebp-425]
 005FE05B    push        eax
 005FE05C    push        20000007
 005FE061    mov         eax,dword ptr [esi]
 005FE063    push        eax
 005FE064    call        dword ptr ds:[816EA8]
 005FE06A    mov         eax,dword ptr [ebp-0C]
 005FE06D    mov         byte ptr [ebp+eax-424],0
 005FE075    add         esi,78
 005FE078    dec         ebx
>005FE079    jne         005FE04A
 005FE07B    mov         ebx,1
 005FE080    xor         eax,eax
 005FE082    pop         edx
 005FE083    pop         ecx
 005FE084    pop         ecx
 005FE085    mov         dword ptr fs:[eax],edx
 005FE088    push        5FE0D5
 005FE08D    lea         eax,[ebp-460]
 005FE093    mov         edx,3
 005FE098    call        @UStrArrayClr
 005FE09D    lea         eax,[ebp-454]
 005FE0A3    mov         edx,4
 005FE0A8    call        @LStrArrayClr
 005FE0AD    lea         eax,[ebp-444]
 005FE0B3    mov         edx,3
 005FE0B8    call        @UStrArrayClr
 005FE0BD    lea         eax,[ebp-438]
 005FE0C3    mov         edx,4
 005FE0C8    call        @LStrArrayClr
 005FE0CD    ret
>005FE0CE    jmp         @HandleFinally
>005FE0D3    jmp         005FE08D
 005FE0D5    mov         eax,ebx
 005FE0D7    pop         edi
 005FE0D8    pop         esi
 005FE0D9    pop         ebx
 005FE0DA    mov         esp,ebp
 005FE0DC    pop         ebp
 005FE0DD    ret
end;*}

//005FE1A8
{*procedure sub_005FE1A8(?:HWND; ?:LPARAM; ?:?);
begin
 005FE1A8    push        ebp
 005FE1A9    mov         ebp,esp
 005FE1AB    push        ecx
 005FE1AC    mov         ecx,1A
 005FE1B1    push        0
 005FE1B3    push        0
 005FE1B5    dec         ecx
>005FE1B6    jne         005FE1B1
 005FE1B8    push        ecx
 005FE1B9    xchg        ecx,dword ptr [ebp-4]
 005FE1BC    push        ebx
 005FE1BD    push        esi
 005FE1BE    push        edi
 005FE1BF    mov         dword ptr [ebp-10],ecx
 005FE1C2    mov         ebx,edx
 005FE1C4    mov         dword ptr [ebp-0C],eax
 005FE1C7    xor         eax,eax
 005FE1C9    push        ebp
 005FE1CA    push        5FEFEE
 005FE1CF    push        dword ptr fs:[eax]
 005FE1D2    mov         dword ptr fs:[eax],esp
 005FE1D5    mov         eax,dword ptr [ebp-10]
 005FE1D8    call        @UStrClr
 005FE1DD    push        ebp
 005FE1DE    push        5FEF8B
 005FE1E3    push        dword ptr fs:[0]
 005FE1EA    mov         dword ptr fs:[0],esp
 005FE1F1    cmp         dword ptr ds:[816EA0],0;gvar_00816EA0:Pointer
>005FE1F8    jne         005FE20F
 005FE1FA    mov         eax,dword ptr [ebp-10]
 005FE1FD    call        @UStrClr
 005FE202    xor         eax,eax
 005FE204    pop         edx
 005FE205    pop         ecx
 005FE206    pop         ecx
 005FE207    mov         dword ptr fs:[eax],edx
>005FE20A    jmp         005FEFA9
 005FE20F    push        10
 005FE211    lea         eax,[ebp-14]
 005FE214    push        eax
 005FE215    push        0
 005FE217    push        10000003
 005FE21C    push        ebx
 005FE21D    call        dword ptr ds:[816EA0]
 005FE223    mov         eax,dword ptr [ebp-14]
 005FE226    cmp         eax,dword ptr ds:[78BD18];0x0 gvar_0078BD18
>005FE22C    jb          005FE24F
 005FE22E    mov         eax,[0078BD14];0x0 gvar_0078BD14:Pointer
 005FE233    call        @FreeMem
 005FE238    mov         eax,dword ptr [ebp-14]
 005FE23B    mov         [0078BD18],eax;gvar_0078BD18
 005FE240    mov         eax,[0078BD18];0x0 gvar_0078BD18
 005FE245    call        @GetMem
 005FE24A    mov         [0078BD14],eax;gvar_0078BD14:Pointer
 005FE24F    push        10
 005FE251    lea         eax,[ebp-14]
 005FE254    push        eax
 005FE255    mov         eax,[0078BD14];0x0 gvar_0078BD14:Pointer
 005FE25A    push        eax
 005FE25B    push        10000003
 005FE260    push        ebx
 005FE261    call        dword ptr ds:[816EA0]
 005FE267    cmp         eax,dword ptr [ebp-14]
>005FE26A    je          005FE281
 005FE26C    mov         eax,dword ptr [ebp-10]
 005FE26F    call        @UStrClr
 005FE274    xor         eax,eax
 005FE276    pop         edx
 005FE277    pop         ecx
 005FE278    pop         ecx
 005FE279    mov         dword ptr fs:[eax],edx
>005FE27C    jmp         005FEFA9
 005FE281    mov         ecx,dword ptr ds:[78BD14];0x0 gvar_0078BD14:Pointer
 005FE287    mov         eax,dword ptr [ecx]
 005FE289    test        eax,eax
>005FE28B    jne         005FE53D
 005FE291    mov         dword ptr [ebp-18],0FFFFFFFF
 005FE298    mov         edx,dword ptr ds:[8177F0];gvar_008177F0
 005FE29E    dec         edx
 005FE29F    test        edx,edx
>005FE2A1    jl          005FE2BE
 005FE2A3    inc         edx
 005FE2A4    xor         esi,esi
 005FE2A6    mov         eax,816EAC;gvar_00816EAC
 005FE2AB    mov         ebx,dword ptr [ecx+8]
 005FE2AE    cmp         ebx,dword ptr [eax]
>005FE2B0    jne         005FE2B7
 005FE2B2    mov         dword ptr [ebp-18],esi
>005FE2B5    jmp         005FE2BE
 005FE2B7    inc         esi
 005FE2B8    add         eax,1C
 005FE2BB    dec         edx
>005FE2BC    jne         005FE2AB
 005FE2BE    lea         ebx,[ecx+10]
 005FE2C1    mov         esi,ebx
 005FE2C3    cmp         dword ptr [ebp-18],0
>005FE2C7    jl          005FE433
 005FE2CD    cmp         dword ptr [ebp-18],0F
>005FE2D1    jg          005FE433
 005FE2D7    mov         edx,dword ptr [esi+8]
 005FE2DA    and         edx,0FFFFE0
 005FE2E0    mov         eax,dword ptr [ebp-18]
 005FE2E3    mov         ecx,eax
 005FE2E5    add         eax,eax
 005FE2E7    add         eax,eax
 005FE2E9    add         eax,eax
 005FE2EB    sub         eax,ecx
 005FE2ED    mov         ecx,dword ptr [eax*4+816EC0];gvar_00816EC0
 005FE2F4    and         ecx,1F
 005FE2F7    add         edx,ecx
 005FE2F9    mov         dword ptr [eax*4+816EC0],edx;gvar_00816EC0
 005FE300    movzx       edx,word ptr [esi+4]
 005FE304    test        dx,1
>005FE309    jbe         005FE313
 005FE30B    or          dword ptr [eax*4+816EC0],1;gvar_00816EC0
 005FE313    test        dx,2
>005FE318    jbe         005FE32F
 005FE31A    mov         ecx,dword ptr [eax*4+816EC0];gvar_00816EC0
 005FE321    and         ecx,0FFFFFF
 005FE327    dec         ecx
 005FE328    mov         dword ptr [eax*4+816EC0],ecx;gvar_00816EC0
 005FE32F    test        dx,4
>005FE334    jbe         005FE33E
 005FE336    or          dword ptr [eax*4+816EC0],2;gvar_00816EC0
 005FE33E    test        dx,8
>005FE343    jbe         005FE35C
 005FE345    mov         ecx,dword ptr [eax*4+816EC0];gvar_00816EC0
 005FE34C    and         ecx,0FFFFFF
 005FE352    sub         ecx,2
 005FE355    mov         dword ptr [eax*4+816EC0],ecx;gvar_00816EC0
 005FE35C    test        dx,10
>005FE361    jbe         005FE36B
 005FE363    or          dword ptr [eax*4+816EC0],4;gvar_00816EC0
 005FE36B    test        dx,20
>005FE370    jbe         005FE389
 005FE372    mov         ecx,dword ptr [eax*4+816EC0];gvar_00816EC0
 005FE379    and         ecx,0FFFFFF
 005FE37F    sub         ecx,4
 005FE382    mov         dword ptr [eax*4+816EC0],ecx;gvar_00816EC0
 005FE389    test        dx,40
>005FE38E    jbe         005FE398
 005FE390    or          dword ptr [eax*4+816EC0],8;gvar_00816EC0
 005FE398    test        dx,80
>005FE39D    jbe         005FE3B6
 005FE39F    mov         ecx,dword ptr [eax*4+816EC0];gvar_00816EC0
 005FE3A6    and         ecx,0FFFFFF
 005FE3AC    sub         ecx,8
 005FE3AF    mov         dword ptr [eax*4+816EC0],ecx;gvar_00816EC0
 005FE3B6    test        dx,100
>005FE3BB    jbe         005FE3C5
 005FE3BD    or          dword ptr [eax*4+816EC0],10;gvar_00816EC0
 005FE3C5    test        dx,200
>005FE3CA    jbe         005FE3E3
 005FE3CC    mov         ecx,dword ptr [eax*4+816EC0];gvar_00816EC0
 005FE3D3    and         ecx,0FFFFFF
 005FE3D9    sub         ecx,10
 005FE3DC    mov         dword ptr [eax*4+816EC0],ecx;gvar_00816EC0
 005FE3E3    cmp         word ptr [esi],0
>005FE3E7    jne         005FE3FD
 005FE3E9    mov         ecx,dword ptr [esi+0C]
 005FE3EC    add         dword ptr [eax*4+816EB0],ecx;gvar_00816EB0
 005FE3F3    mov         ecx,dword ptr [esi+10]
 005FE3F6    add         dword ptr [eax*4+816EB4],ecx
 005FE3FD    test        dx,400
>005FE402    jbe         005FE420
 005FE404    movsx       edx,word ptr [esi+6]
 005FE408    add         dword ptr [eax*4+816EB8],edx
 005FE40F    movzx       edx,word ptr [esi+6]
 005FE413    shr         edx,10
 005FE416    movsx       edx,dx
 005FE419    add         dword ptr [eax*4+816EBC],edx
 005FE420    movzx       edx,word ptr [esi+4]
 005FE424    and         dx,3FF
 005FE429    movzx       edx,dx
 005FE42C    or          dword ptr [eax*4+816EC4],edx
 005FE433    movzx       edi,word ptr [esi+4]
 005FE437    test        di,3FF
>005FE43C    jbe         005FE44D
 005FE43E    lea         eax,[ebp-4]
 005FE441    mov         edx,5FF008;'Button '
 005FE446    call        @UStrLAsg
>005FE44B    jmp         005FE455
 005FE44D    lea         eax,[ebp-4]
 005FE450    call        @UStrClr
 005FE455    test        di,400
>005FE45A    jbe         005FE480
 005FE45C    push        dword ptr [ebp-4]
 005FE45F    push        5FF024;' Wheel '
 005FE464    lea         edx,[ebp-20]
 005FE467    movsx       eax,word ptr [esi+6]
 005FE46B    call        IntToStr
 005FE470    push        dword ptr [ebp-20]
 005FE473    lea         eax,[ebp-4]
 005FE476    mov         edx,3
 005FE47B    call        @UStrCatN
 005FE480    cmp         dword ptr [ebx+0C],0
>005FE484    jne         005FE48C
 005FE486    cmp         dword ptr [ebx+10],0
>005FE48A    je          005FE49B
 005FE48C    lea         eax,[ebp-8]
 005FE48F    mov         edx,5FF040;'Moved '
 005FE494    call        @UStrLAsg
>005FE499    jmp         005FE4A3
 005FE49B    lea         eax,[ebp-8]
 005FE49E    call        @UStrClr
 005FE4A3    mov         eax,dword ptr [ebp-10]
 005FE4A6    mov         ecx,dword ptr [ebp-8]
 005FE4A9    mov         edx,dword ptr [ebp-4]
 005FE4AC    call        @UStrCat3
 005FE4B1    mov         eax,dword ptr [ebp-10]
 005FE4B4    call        @UStrClr
 005FE4B9    lea         edx,[ebp-24]
 005FE4BC    mov         eax,dword ptr [ebp-10]
 005FE4BF    mov         eax,dword ptr [eax]
 005FE4C1    call        Trim
 005FE4C6    cmp         dword ptr [ebp-24],0
>005FE4CA    jne         005FEF81
 005FE4D0    mov         eax,dword ptr [ebp-10]
 005FE4D3    push        eax
 005FE4D4    mov         eax,dword ptr [ebp-18]
 005FE4D7    mov         dword ptr [ebp-64],eax
 005FE4DA    mov         byte ptr [ebp-60],0
 005FE4DE    movzx       eax,word ptr [ebx]
 005FE4E1    mov         dword ptr [ebp-5C],eax
 005FE4E4    mov         byte ptr [ebp-58],0
 005FE4E8    movzx       eax,word ptr [ebx+4]
 005FE4EC    mov         dword ptr [ebp-54],eax
 005FE4EF    mov         byte ptr [ebp-50],0
 005FE4F3    movzx       eax,word ptr [ebx+6]
 005FE4F7    mov         dword ptr [ebp-4C],eax
 005FE4FA    mov         byte ptr [ebp-48],0
 005FE4FE    mov         eax,dword ptr [ebx+8]
 005FE501    mov         dword ptr [ebp-44],eax
 005FE504    mov         byte ptr [ebp-40],0
 005FE508    mov         eax,dword ptr [ebx+0C]
 005FE50B    mov         dword ptr [ebp-3C],eax
 005FE50E    mov         byte ptr [ebp-38],0
 005FE512    mov         eax,dword ptr [ebx+10]
 005FE515    mov         dword ptr [ebp-34],eax
 005FE518    mov         byte ptr [ebp-30],0
 005FE51C    mov         eax,dword ptr [ebx+14]
 005FE51F    mov         dword ptr [ebp-2C],eax
 005FE522    mov         byte ptr [ebp-28],0
 005FE526    lea         edx,[ebp-64]
 005FE529    mov         ecx,7
 005FE52E    mov         eax,5FF05C;'Mouse: num %d, usFlags=%04x usButtonFlags=%04x usButtonData=%04x ulRawButton...
 005FE533    call        Format
>005FE538    jmp         005FEF81
 005FE53D    cmp         eax,1
>005FE540    jne         005FEF81
 005FE546    push        ebp
 005FE547    push        5FEF63
 005FE54C    push        dword ptr fs:[0]
 005FE553    mov         dword ptr fs:[0],esp
 005FE55A    mov         dword ptr [ebp-1C],0FFFFFFFF
 005FE561    mov         edx,dword ptr ds:[8177F4];gvar_008177F4
 005FE567    dec         edx
 005FE568    test        edx,edx
>005FE56A    jl          005FE587
 005FE56C    inc         edx
 005FE56D    xor         esi,esi
 005FE56F    mov         eax,817070;gvar_00817070
 005FE574    mov         ebx,dword ptr [ecx+8]
 005FE577    cmp         ebx,dword ptr [eax]
>005FE579    jne         005FE580
 005FE57B    mov         dword ptr [ebp-1C],esi
>005FE57E    jmp         005FE587
 005FE580    inc         esi
 005FE581    add         eax,78
 005FE584    dec         edx
>005FE585    jne         005FE574
 005FE587    lea         esi,[ecx+10]
 005FE58A    cmp         dword ptr [ebp-1C],0
>005FE58E    jl          005FEF59
 005FE594    cmp         dword ptr [ebp-1C],0F
>005FE598    jg          005FEF59
 005FE59E    mov         ebx,esi
 005FE5A0    lea         eax,[ebp-4]
 005FE5A3    call        @UStrClr
 005FE5A8    movzx       edi,word ptr [esi]
 005FE5AB    movzx       esi,word ptr [ebx+2]
 005FE5AF    mov         eax,esi
 005FE5B1    and         ax,1
 005FE5B5    test        ax,ax
>005FE5B8    jne         005FE5C7
 005FE5BA    lea         eax,[ebp-4]
 005FE5BD    mov         edx,5FF170;'Pressed '
 005FE5C2    call        @UStrLAsg
 005FE5C7    movzx       eax,word ptr [ebx+2]
 005FE5CB    and         ax,1
 005FE5CF    test        ax,ax
>005FE5D2    jbe         005FE5E1
 005FE5D4    lea         eax,[ebp-4]
 005FE5D7    mov         edx,5FF190;'Released '
 005FE5DC    call        @UStrCat
 005FE5E1    test        si,2
>005FE5E6    jbe         005FE5FB
 005FE5E8    lea         eax,[ebp-4]
 005FE5EB    mov         edx,5FF1B0;'E0 '
 005FE5F0    call        @UStrCat
 005FE5F5    add         edi,80
 005FE5FB    test        si,4
>005FE600    jbe         005FE60F
 005FE602    lea         eax,[ebp-4]
 005FE605    mov         edx,5FF1C4;'E1 '
 005FE60A    call        @UStrCat
 005FE60F    test        si,8
>005FE614    jbe         005FE623
 005FE616    lea         eax,[ebp-4]
 005FE619    mov         edx,5FF1D8;'LED '
 005FE61E    call        @UStrCat
 005FE623    test        si,10
>005FE628    jbe         005FE637
 005FE62A    lea         eax,[ebp-4]
 005FE62D    mov         edx,5FF1F0;'Shadow '
 005FE632    call        @UStrCat
 005FE637    movzx       eax,word ptr [ebx+2]
 005FE63B    test        ax,4
>005FE640    jbe         005FE68E
 005FE642    cmp         edi,1D
>005FE645    jne         005FE68E
 005FE647    mov         edi,105
 005FE64C    test        al,1
>005FE64E    jne         005FE66F
 005FE650    mov         eax,dword ptr [ebp-1C]
 005FE653    mov         edx,eax
 005FE655    shl         eax,4
 005FE658    sub         eax,edx
 005FE65A    mov         byte ptr [eax*8+817076],1;gvar_00817076
 005FE662    mov         byte ptr [eax*8+817078],0;gvar_00817078
>005FE66A    jmp         005FE7BC
 005FE66F    mov         eax,dword ptr [ebp-1C]
 005FE672    mov         edx,eax
 005FE674    shl         eax,4
 005FE677    sub         eax,edx
 005FE679    mov         byte ptr [eax*8+817076],0;gvar_00817076
 005FE681    mov         byte ptr [eax*8+817078],1;gvar_00817078
>005FE689    jmp         005FE7BC
 005FE68E    movzx       eax,word ptr [ebx+2]
 005FE692    test        ax,4
>005FE697    jbe         005FE6C1
 005FE699    cmp         edi,9D
>005FE69F    jne         005FE6C1
 005FE6A1    mov         edi,106
 005FE6A6    test        al,1
 005FE6A8    sete        al
 005FE6AB    mov         edx,dword ptr [ebp-1C]
 005FE6AE    mov         ecx,edx
 005FE6B0    shl         edx,4
 005FE6B3    sub         edx,ecx
 005FE6B5    mov         byte ptr [edx*8+817077],al;gvar_00817077
>005FE6BC    jmp         005FE7BC
 005FE6C1    cmp         edi,0AA
>005FE6C7    jne         005FE6E4
 005FE6C9    test        al,1
 005FE6CB    sete        al
 005FE6CE    mov         edx,dword ptr [ebp-1C]
 005FE6D1    mov         ecx,edx
 005FE6D3    shl         edx,4
 005FE6D6    sub         edx,ecx
 005FE6D8    mov         byte ptr [edx*8+817074],al;gvar_00817074
>005FE6DF    jmp         005FE7BC
 005FE6E4    cmp         edi,0B6
>005FE6EA    jne         005FE707
 005FE6EC    test        al,1
 005FE6EE    sete        al
 005FE6F1    mov         edx,dword ptr [ebp-1C]
 005FE6F4    mov         ecx,edx
 005FE6F6    shl         edx,4
 005FE6F9    sub         edx,ecx
 005FE6FB    mov         byte ptr [edx*8+817075],al;gvar_00817075
>005FE702    jmp         005FE7BC
 005FE707    cmp         edi,2A
>005FE70A    jne         005FE727
 005FE70C    test        al,1
 005FE70E    sete        al
 005FE711    mov         edx,dword ptr [ebp-1C]
 005FE714    mov         ecx,edx
 005FE716    shl         edx,4
 005FE719    sub         edx,ecx
 005FE71B    mov         byte ptr [edx*8+817079],al;gvar_00817079
>005FE722    jmp         005FE7BC
 005FE727    cmp         edi,36
>005FE72A    jne         005FE744
 005FE72C    test        al,1
 005FE72E    sete        al
 005FE731    mov         edx,dword ptr [ebp-1C]
 005FE734    mov         ecx,edx
 005FE736    shl         edx,4
 005FE739    sub         edx,ecx
 005FE73B    mov         byte ptr [edx*8+81707C],al;gvar_0081707C
>005FE742    jmp         005FE7BC
 005FE744    cmp         edi,1D
>005FE747    jne         005FE761
 005FE749    test        al,1
 005FE74B    sete        al
 005FE74E    mov         edx,dword ptr [ebp-1C]
 005FE751    mov         ecx,edx
 005FE753    shl         edx,4
 005FE756    sub         edx,ecx
 005FE758    mov         byte ptr [edx*8+81707A],al;gvar_0081707A
>005FE75F    jmp         005FE7BC
 005FE761    cmp         edi,9D
>005FE767    jne         005FE781
 005FE769    test        al,1
 005FE76B    sete        al
 005FE76E    mov         edx,dword ptr [ebp-1C]
 005FE771    mov         ecx,edx
 005FE773    shl         edx,4
 005FE776    sub         edx,ecx
 005FE778    mov         byte ptr [edx*8+81707D],al;gvar_0081707D
>005FE77F    jmp         005FE7BC
 005FE781    cmp         edi,38
>005FE784    jne         005FE79E
 005FE786    test        al,1
 005FE788    sete        al
 005FE78B    mov         edx,dword ptr [ebp-1C]
 005FE78E    mov         ecx,edx
 005FE790    shl         edx,4
 005FE793    sub         edx,ecx
 005FE795    mov         byte ptr [edx*8+81707B],al;gvar_0081707B
>005FE79C    jmp         005FE7BC
 005FE79E    cmp         edi,0B8
>005FE7A4    jne         005FE7BC
 005FE7A6    test        al,1
 005FE7A8    sete        al
 005FE7AB    mov         edx,dword ptr [ebp-1C]
 005FE7AE    mov         ecx,edx
 005FE7B0    shl         edx,4
 005FE7B3    sub         edx,ecx
 005FE7B5    mov         byte ptr [edx*8+81707E],al;gvar_0081707E
 005FE7BC    cmp         edi,54
>005FE7BF    jne         005FE97D
 005FE7C5    mov         eax,dword ptr [ebp-1C]
 005FE7C8    mov         edx,eax
 005FE7CA    shl         eax,4
 005FE7CD    sub         eax,edx
 005FE7CF    cmp         byte ptr [eax*8+81707E],0;gvar_0081707E
>005FE7D7    jne         005FE7E7
 005FE7D9    cmp         byte ptr [eax*8+81707B],0;gvar_0081707B
>005FE7E1    je          005FE97D
 005FE7E7    push        5FF20C;'Keyboard '
 005FE7EC    lea         edx,[ebp-68]
 005FE7EF    mov         eax,dword ptr [ebp-1C]
 005FE7F2    call        IntToStr
 005FE7F7    push        dword ptr [ebp-68]
 005FE7FA    push        5FF22C;': '
 005FE7FF    push        dword ptr [ebp-4]
 005FE802    mov         eax,dword ptr [ebp-10]
 005FE805    mov         edx,4
 005FE80A    call        @UStrCatN
 005FE80F    mov         eax,dword ptr [ebp-10]
 005FE812    push        dword ptr [eax]
 005FE814    lea         ecx,[ebp-6C]
 005FE817    movzx       eax,word ptr [ebx]
 005FE81A    mov         edx,2
 005FE81F    call        IntToHex
 005FE824    push        dword ptr [ebp-6C]
 005FE827    push        5FF240;' = '
 005FE82C    lea         ecx,[ebp-70]
 005FE82F    mov         edx,2
 005FE834    mov         eax,0B7
 005FE839    call        IntToHex
 005FE83E    push        dword ptr [ebp-70]
 005FE841    push        5FF254;' '
 005FE846    lea         edx,[ebp-74]
 005FE849    mov         eax,0B7
 005FE84E    call        005F2178
 005FE853    push        dword ptr [ebp-74]
 005FE856    push        5FF264;', '
 005FE85B    mov         eax,dword ptr [ebp-10]
 005FE85E    mov         edx,7
 005FE863    call        @UStrCatN
 005FE868    mov         eax,dword ptr [ebp-10]
 005FE86B    push        dword ptr [eax]
 005FE86D    lea         edx,[ebp-78]
 005FE870    movzx       eax,word ptr [ebx+4]
 005FE874    call        IntToStr
 005FE879    push        dword ptr [ebp-78]
 005FE87C    push        5FF264;', '
 005FE881    mov         eax,dword ptr [ebp-10]
 005FE884    mov         edx,3
 005FE889    call        @UStrCatN
 005FE88E    mov         eax,dword ptr [ebp-10]
 005FE891    push        dword ptr [eax]
 005FE893    lea         edx,[ebp-7C]
 005FE896    movzx       eax,word ptr [ebx+6]
 005FE89A    call        IntToStr
 005FE89F    push        dword ptr [ebp-7C]
 005FE8A2    push        5FF264;', '
 005FE8A7    mov         eax,dword ptr [ebp-10]
 005FE8AA    mov         edx,3
 005FE8AF    call        @UStrCatN
 005FE8B4    mov         eax,dword ptr [ebx+0C]
 005FE8B7    xor         edx,edx
 005FE8B9    push        edx
 005FE8BA    push        eax
 005FE8BB    lea         eax,[ebp-80]
 005FE8BE    call        IntToStr
 005FE8C3    mov         edx,dword ptr [ebp-80]
 005FE8C6    mov         eax,dword ptr [ebp-10]
 005FE8C9    call        @UStrCat
 005FE8CE    mov         eax,dword ptr [ebp-10]
 005FE8D1    test        byte ptr [ebx+2],1
>005FE8D5    jne         005FE92B
 005FE8D7    push        edi
 005FE8D8    mov         esi,5FF26C
 005FE8DD    lea         edi,[ebp-0A0]
 005FE8E3    mov         ecx,8
 005FE8E8    rep movs    dword ptr [edi],dword ptr [esi]
 005FE8EA    pop         edi
 005FE8EB    lea         eax,[ebp-0A0]
 005FE8F1    mov         edx,dword ptr [ebp-1C]
 005FE8F4    mov         ecx,edx
 005FE8F6    shl         edx,4
 005FE8F9    sub         edx,ecx
 005FE8FB    lea         edx,[edx*8+81707F];gvar_0081707F
 005FE902    mov         cl,20
 005FE904    call        @SetUnion
 005FE909    mov         eax,dword ptr [ebp-1C]
 005FE90C    mov         edx,eax
 005FE90E    shl         eax,4
 005FE911    sub         eax,edx
 005FE913    push        edi
 005FE914    lea         esi,[ebp-0A0]
 005FE91A    lea         edi,[eax*8+81707F];gvar_0081707F
 005FE921    mov         ecx,8
 005FE926    rep movs    dword ptr [edi],dword ptr [esi]
 005FE928    pop         edi
>005FE929    jmp         005FE97D
 005FE92B    mov         eax,dword ptr [ebp-1C]
 005FE92E    mov         edx,eax
 005FE930    shl         eax,4
 005FE933    sub         eax,edx
 005FE935    push        edi
 005FE936    lea         esi,[eax*8+81707F];gvar_0081707F
 005FE93D    lea         edi,[ebp-0A0]
 005FE943    mov         ecx,8
 005FE948    rep movs    dword ptr [edi],dword ptr [esi]
 005FE94A    pop         edi
 005FE94B    lea         eax,[ebp-0A0]
 005FE951    mov         edx,5FF26C
 005FE956    mov         cl,20
 005FE958    call        @SetSub
 005FE95D    mov         eax,dword ptr [ebp-1C]
 005FE960    mov         edx,eax
 005FE962    shl         eax,4
 005FE965    sub         eax,edx
 005FE967    push        edi
 005FE968    lea         esi,[ebp-0A0]
 005FE96E    lea         edi,[eax*8+81707F];gvar_0081707F
 005FE975    mov         ecx,8
 005FE97A    rep movs    dword ptr [edi],dword ptr [esi]
 005FE97C    pop         edi
 005FE97D    cmp         edi,45
>005FE980    jne         005FE9C3
 005FE982    mov         eax,dword ptr [ebp-1C]
 005FE985    mov         edx,eax
 005FE987    shl         eax,4
 005FE98A    sub         eax,edx
 005FE98C    cmp         byte ptr [eax*8+817076],0;gvar_00817076
>005FE994    jne         005FE9AA
 005FE996    cmp         byte ptr [eax*8+817077],0;gvar_00817077
>005FE99E    jne         005FE9AA
 005FE9A0    cmp         byte ptr [eax*8+817078],0;gvar_00817078
>005FE9A8    je          005FE9C3
 005FE9AA    mov         edi,0C5
 005FE9AF    mov         eax,dword ptr [ebp-1C]
 005FE9B2    mov         edx,eax
 005FE9B4    shl         eax,4
 005FE9B7    sub         eax,edx
 005FE9B9    mov         byte ptr [eax*8+817078],0;gvar_00817078
>005FE9C1    jmp         005FEA34
 005FE9C3    cmp         edi,45
>005FE9C6    jne         005FEA34
 005FE9C8    test        byte ptr [ebx+2],1
>005FE9CC    je          005FEA34
 005FE9CE    mov         eax,dword ptr [ebp-1C]
 005FE9D1    mov         edx,eax
 005FE9D3    shl         eax,4
 005FE9D6    sub         eax,edx
 005FE9D8    test        byte ptr [eax*8+817097],20
>005FE9E0    je          005FEA34
 005FE9E2    mov         eax,dword ptr [ebp-1C]
 005FE9E5    mov         edx,eax
 005FE9E7    shl         eax,4
 005FE9EA    sub         eax,edx
 005FE9EC    push        edi
 005FE9ED    lea         esi,[eax*8+81707F];gvar_0081707F
 005FE9F4    lea         edi,[ebp-0A0]
 005FE9FA    mov         ecx,8
 005FE9FF    rep movs    dword ptr [edi],dword ptr [esi]
 005FEA01    pop         edi
 005FEA02    lea         eax,[ebp-0A0]
 005FEA08    mov         edx,5FF28C
 005FEA0D    mov         cl,20
 005FEA0F    call        @SetSub
 005FEA14    mov         eax,dword ptr [ebp-1C]
 005FEA17    mov         edx,eax
 005FEA19    shl         eax,4
 005FEA1C    sub         eax,edx
 005FEA1E    push        edi
 005FEA1F    lea         esi,[ebp-0A0]
 005FEA25    lea         edi,[eax*8+81707F];gvar_0081707F
 005FEA2C    mov         ecx,8
 005FEA31    rep movs    dword ptr [edi],dword ptr [esi]
 005FEA33    pop         edi
 005FEA34    cmp         edi,0C6
>005FEA3A    jne         005FEC22
 005FEA40    mov         eax,dword ptr [ebp-1C]
 005FEA43    mov         edx,eax
 005FEA45    shl         eax,4
 005FEA48    sub         eax,edx
 005FEA4A    cmp         byte ptr [eax*8+81707A],0;gvar_0081707A
>005FEA52    jne         005FEA62
 005FEA54    cmp         byte ptr [eax*8+81707D],0;gvar_0081707D
>005FEA5C    je          005FEC22
 005FEA62    push        5FF20C;'Keyboard '
 005FEA67    lea         edx,[ebp-0A4]
 005FEA6D    mov         eax,dword ptr [ebp-1C]
 005FEA70    call        IntToStr
 005FEA75    push        dword ptr [ebp-0A4]
 005FEA7B    push        5FF22C;': '
 005FEA80    push        dword ptr [ebp-4]
 005FEA83    mov         eax,dword ptr [ebp-10]
 005FEA86    mov         edx,4
 005FEA8B    call        @UStrCatN
 005FEA90    mov         eax,dword ptr [ebp-10]
 005FEA93    push        dword ptr [eax]
 005FEA95    lea         ecx,[ebp-0A8]
 005FEA9B    movzx       eax,word ptr [ebx]
 005FEA9E    mov         edx,2
 005FEAA3    call        IntToHex
 005FEAA8    push        dword ptr [ebp-0A8]
 005FEAAE    push        5FF240;' = '
 005FEAB3    lea         ecx,[ebp-0AC]
 005FEAB9    mov         edx,2
 005FEABE    mov         eax,0C5
 005FEAC3    call        IntToHex
 005FEAC8    push        dword ptr [ebp-0AC]
 005FEACE    push        5FF254;' '
 005FEAD3    lea         edx,[ebp-0B0]
 005FEAD9    mov         eax,0C5
 005FEADE    call        005F2178
 005FEAE3    push        dword ptr [ebp-0B0]
 005FEAE9    push        5FF264;', '
 005FEAEE    mov         eax,dword ptr [ebp-10]
 005FEAF1    mov         edx,7
 005FEAF6    call        @UStrCatN
 005FEAFB    mov         eax,dword ptr [ebp-10]
 005FEAFE    push        dword ptr [eax]
 005FEB00    lea         edx,[ebp-0B4]
 005FEB06    movzx       eax,word ptr [ebx+4]
 005FEB0A    call        IntToStr
 005FEB0F    push        dword ptr [ebp-0B4]
 005FEB15    push        5FF264;', '
 005FEB1A    mov         eax,dword ptr [ebp-10]
 005FEB1D    mov         edx,3
 005FEB22    call        @UStrCatN
 005FEB27    mov         eax,dword ptr [ebp-10]
 005FEB2A    push        dword ptr [eax]
 005FEB2C    lea         edx,[ebp-0B8]
 005FEB32    movzx       eax,word ptr [ebx+6]
 005FEB36    call        IntToStr
 005FEB3B    push        dword ptr [ebp-0B8]
 005FEB41    push        5FF264;', '
 005FEB46    mov         eax,dword ptr [ebp-10]
 005FEB49    mov         edx,3
 005FEB4E    call        @UStrCatN
 005FEB53    mov         eax,dword ptr [ebx+0C]
 005FEB56    xor         edx,edx
 005FEB58    push        edx
 005FEB59    push        eax
 005FEB5A    lea         eax,[ebp-0BC]
 005FEB60    call        IntToStr
 005FEB65    mov         edx,dword ptr [ebp-0BC]
 005FEB6B    mov         eax,dword ptr [ebp-10]
 005FEB6E    call        @UStrCat
 005FEB73    mov         eax,dword ptr [ebp-10]
 005FEB76    test        byte ptr [ebx+2],1
>005FEB7A    jne         005FEBD0
 005FEB7C    push        edi
 005FEB7D    mov         esi,5FF28C
 005FEB82    lea         edi,[ebp-0A0]
 005FEB88    mov         ecx,8
 005FEB8D    rep movs    dword ptr [edi],dword ptr [esi]
 005FEB8F    pop         edi
 005FEB90    lea         eax,[ebp-0A0]
 005FEB96    mov         edx,dword ptr [ebp-1C]
 005FEB99    mov         ecx,edx
 005FEB9B    shl         edx,4
 005FEB9E    sub         edx,ecx
 005FEBA0    lea         edx,[edx*8+81707F];gvar_0081707F
 005FEBA7    mov         cl,20
 005FEBA9    call        @SetUnion
 005FEBAE    mov         eax,dword ptr [ebp-1C]
 005FEBB1    mov         edx,eax
 005FEBB3    shl         eax,4
 005FEBB6    sub         eax,edx
 005FEBB8    push        edi
 005FEBB9    lea         esi,[ebp-0A0]
 005FEBBF    lea         edi,[eax*8+81707F];gvar_0081707F
 005FEBC6    mov         ecx,8
 005FEBCB    rep movs    dword ptr [edi],dword ptr [esi]
 005FEBCD    pop         edi
>005FEBCE    jmp         005FEC22
 005FEBD0    mov         eax,dword ptr [ebp-1C]
 005FEBD3    mov         edx,eax
 005FEBD5    shl         eax,4
 005FEBD8    sub         eax,edx
 005FEBDA    push        edi
 005FEBDB    lea         esi,[eax*8+81707F];gvar_0081707F
 005FEBE2    lea         edi,[ebp-0A0]
 005FEBE8    mov         ecx,8
 005FEBED    rep movs    dword ptr [edi],dword ptr [esi]
 005FEBEF    pop         edi
 005FEBF0    lea         eax,[ebp-0A0]
 005FEBF6    mov         edx,5FF28C
 005FEBFB    mov         cl,20
 005FEBFD    call        @SetSub
 005FEC02    mov         eax,dword ptr [ebp-1C]
 005FEC05    mov         edx,eax
 005FEC07    shl         eax,4
 005FEC0A    sub         eax,edx
 005FEC0C    push        edi
 005FEC0D    lea         esi,[ebp-0A0]
 005FEC13    lea         edi,[eax*8+81707F];gvar_0081707F
 005FEC1A    mov         ecx,8
 005FEC1F    rep movs    dword ptr [edi],dword ptr [esi]
 005FEC21    pop         edi
 005FEC22    push        5FF20C;'Keyboard '
 005FEC27    lea         edx,[ebp-0C0]
 005FEC2D    mov         eax,dword ptr [ebp-1C]
 005FEC30    call        IntToStr
 005FEC35    push        dword ptr [ebp-0C0]
 005FEC3B    push        5FF22C;': '
 005FEC40    push        dword ptr [ebp-4]
 005FEC43    mov         eax,dword ptr [ebp-10]
 005FEC46    mov         edx,4
 005FEC4B    call        @UStrCatN
 005FEC50    mov         eax,dword ptr [ebp-10]
 005FEC53    push        dword ptr [eax]
 005FEC55    lea         ecx,[ebp-0C4]
 005FEC5B    movzx       eax,word ptr [ebx]
 005FEC5E    mov         edx,2
 005FEC63    call        IntToHex
 005FEC68    push        dword ptr [ebp-0C4]
 005FEC6E    push        5FF240;' = '
 005FEC73    lea         ecx,[ebp-0C8]
 005FEC79    mov         edx,2
 005FEC7E    mov         eax,edi
 005FEC80    call        IntToHex
 005FEC85    push        dword ptr [ebp-0C8]
 005FEC8B    push        5FF254;' '
 005FEC90    lea         edx,[ebp-0CC]
 005FEC96    mov         eax,edi
 005FEC98    call        005F2178
 005FEC9D    push        dword ptr [ebp-0CC]
 005FECA3    push        5FF264;', '
 005FECA8    mov         eax,dword ptr [ebp-10]
 005FECAB    mov         edx,7
 005FECB0    call        @UStrCatN
 005FECB5    mov         eax,dword ptr [ebp-10]
 005FECB8    push        dword ptr [eax]
 005FECBA    lea         edx,[ebp-0D0]
 005FECC0    movzx       eax,word ptr [ebx+4]
 005FECC4    call        IntToStr
 005FECC9    push        dword ptr [ebp-0D0]
 005FECCF    push        5FF264;', '
 005FECD4    mov         eax,dword ptr [ebp-10]
 005FECD7    mov         edx,3
 005FECDC    call        @UStrCatN
 005FECE1    mov         eax,dword ptr [ebp-10]
 005FECE4    push        dword ptr [eax]
 005FECE6    lea         edx,[ebp-0D4]
 005FECEC    movzx       eax,word ptr [ebx+6]
 005FECF0    call        IntToStr
 005FECF5    push        dword ptr [ebp-0D4]
 005FECFB    push        5FF264;', '
 005FED00    mov         eax,dword ptr [ebp-10]
 005FED03    mov         edx,3
 005FED08    call        @UStrCatN
 005FED0D    mov         eax,dword ptr [ebx+0C]
 005FED10    xor         edx,edx
 005FED12    push        edx
 005FED13    push        eax
 005FED14    lea         eax,[ebp-0D8]
 005FED1A    call        IntToStr
 005FED1F    mov         edx,dword ptr [ebp-0D8]
 005FED25    mov         eax,dword ptr [ebp-10]
 005FED28    call        @UStrCat
 005FED2D    mov         eax,dword ptr [ebp-10]
 005FED30    mov         eax,edi
 005FED32    call        005F465C
 005FED37    test        eax,eax
>005FED39    je          005FED8B
 005FED3B    test        byte ptr [ebx+2],1
>005FED3F    jne         005FED7A
 005FED41    mov         eax,edi
 005FED43    call        005F465C
 005FED48    mov         edx,dword ptr ds:[78D8FC];^gvar_008162C0:Pointer
 005FED4E    cmp         byte ptr [edx+eax],0
>005FED52    jne         005FED67
 005FED54    mov         eax,edi
 005FED56    call        005F465C
 005FED5B    mov         edx,dword ptr ds:[78D8FC];^gvar_008162C0:Pointer
 005FED61    mov         byte ptr [edx+eax],3
>005FED65    jmp         005FED8B
 005FED67    mov         eax,edi
 005FED69    call        005F465C
 005FED6E    mov         edx,dword ptr ds:[78D8FC];^gvar_008162C0:Pointer
 005FED74    mov         byte ptr [edx+eax],1
>005FED78    jmp         005FED8B
 005FED7A    mov         eax,edi
 005FED7C    call        005F465C
 005FED81    mov         edx,dword ptr ds:[78D8FC];^gvar_008162C0:Pointer
 005FED87    mov         byte ptr [edx+eax],0
 005FED8B    cmp         edi,0C5
>005FED91    jne         005FEE20
 005FED97    mov         eax,dword ptr [ebp-1C]
 005FED9A    mov         edx,eax
 005FED9C    shl         eax,4
 005FED9F    sub         eax,edx
 005FEDA1    push        edi
 005FEDA2    lea         esi,[eax*8+81709F];gvar_0081709F
 005FEDA9    lea         edi,[ebp-0A0]
 005FEDAF    mov         ecx,8
 005FEDB4    rep movs    dword ptr [edi],dword ptr [esi]
 005FEDB6    pop         edi
 005FEDB7    mov         eax,edi
 005FEDB9    cmp         eax,0FF
>005FEDBE    ja          005FEDC7
 005FEDC0    bts         dword ptr [ebp-0A0],eax
 005FEDC7    mov         eax,dword ptr [ebp-1C]
 005FEDCA    mov         edx,eax
 005FEDCC    shl         eax,4
 005FEDCF    sub         eax,edx
 005FEDD1    push        edi
 005FEDD2    lea         esi,[ebp-0A0]
 005FEDD8    lea         edi,[eax*8+81709F];gvar_0081709F
 005FEDDF    mov         ecx,8
 005FEDE4    rep movs    dword ptr [edi],dword ptr [esi]
 005FEDE6    pop         edi
 005FEDE7    test        byte ptr [ebx+2],1
>005FEDEB    jne         005FEE06
 005FEDED    call        00682F08
 005FEDF2    mov         eax,dword ptr [ebp-1C]
 005FEDF5    mov         edx,eax
 005FEDF7    shl         eax,4
 005FEDFA    sub         eax,edx
 005FEDFC    fstp        qword ptr [eax*8+8170E0];gvar_008170E0
 005FEE03    wait
>005FEE04    jmp         005FEE20
 005FEE06    mov         eax,dword ptr [ebp-1C]
 005FEE09    mov         edx,eax
 005FEE0B    shl         eax,4
 005FEE0E    sub         eax,edx
 005FEE10    xor         edx,edx
 005FEE12    mov         dword ptr [eax*8+8170E0],edx;gvar_008170E0
 005FEE19    mov         dword ptr [eax*8+8170E4],edx;gvar_008170E4
 005FEE20    cmp         edi,0FF
>005FEE26    jg          005FEF59
 005FEE2C    test        edi,edi
>005FEE2E    jl          005FEF59
 005FEE34    test        byte ptr [ebx+2],1
>005FEE38    jne         005FEE8D
 005FEE3A    mov         eax,dword ptr [ebp-1C]
 005FEE3D    mov         edx,eax
 005FEE3F    shl         eax,4
 005FEE42    sub         eax,edx
 005FEE44    push        edi
 005FEE45    lea         esi,[eax*8+81707F];gvar_0081707F
 005FEE4C    lea         edi,[ebp-0A0]
 005FEE52    mov         ecx,8
 005FEE57    rep movs    dword ptr [edi],dword ptr [esi]
 005FEE59    pop         edi
 005FEE5A    mov         eax,edi
 005FEE5C    cmp         eax,0FF
>005FEE61    ja          005FEE6A
 005FEE63    bts         dword ptr [ebp-0A0],eax
 005FEE6A    mov         eax,dword ptr [ebp-1C]
 005FEE6D    mov         edx,eax
 005FEE6F    shl         eax,4
 005FEE72    sub         eax,edx
 005FEE74    lea         esi,[ebp-0A0]
 005FEE7A    lea         edi,[eax*8+81707F];gvar_0081707F
 005FEE81    mov         ecx,8
 005FEE86    rep movs    dword ptr [edi],dword ptr [esi]
>005FEE88    jmp         005FEF59
 005FEE8D    mov         eax,dword ptr [ebp-1C]
 005FEE90    mov         edx,eax
 005FEE92    shl         eax,4
 005FEE95    sub         eax,edx
 005FEE97    mov         edx,edi
 005FEE99    cmp         edx,0FF
>005FEE9F    ja          005FEEA9
 005FEEA1    bt          dword ptr [eax*8+81707F],edx;gvar_0081707F
>005FEEA9    jae         005FEEFB
 005FEEAB    mov         eax,dword ptr [ebp-1C]
 005FEEAE    mov         edx,eax
 005FEEB0    shl         eax,4
 005FEEB3    sub         eax,edx
 005FEEB5    push        edi
 005FEEB6    lea         esi,[eax*8+81707F];gvar_0081707F
 005FEEBD    lea         edi,[ebp-0A0]
 005FEEC3    mov         ecx,8
 005FEEC8    rep movs    dword ptr [edi],dword ptr [esi]
 005FEECA    pop         edi
 005FEECB    mov         eax,edi
 005FEECD    cmp         eax,0FF
>005FEED2    ja          005FEEDB
 005FEED4    btr         dword ptr [ebp-0A0],eax
 005FEEDB    mov         eax,dword ptr [ebp-1C]
 005FEEDE    mov         edx,eax
 005FEEE0    shl         eax,4
 005FEEE3    sub         eax,edx
 005FEEE5    lea         esi,[ebp-0A0]
 005FEEEB    lea         edi,[eax*8+81707F];gvar_0081707F
 005FEEF2    mov         ecx,8
 005FEEF7    rep movs    dword ptr [edi],dword ptr [esi]
>005FEEF9    jmp         005FEF59
 005FEEFB    mov         eax,edi
 005FEEFD    call        005F465C
 005FEF02    test        eax,eax
>005FEF04    jne         005FEF59
 005FEF06    cmp         edi,45
>005FEF09    je          005FEF59
 005FEF0B    mov         eax,dword ptr [ebp-1C]
 005FEF0E    mov         edx,eax
 005FEF10    shl         eax,4
 005FEF13    sub         eax,edx
 005FEF15    push        edi
 005FEF16    lea         esi,[eax*8+81709F];gvar_0081709F
 005FEF1D    lea         edi,[ebp-0A0]
 005FEF23    mov         ecx,8
 005FEF28    rep movs    dword ptr [edi],dword ptr [esi]
 005FEF2A    pop         edi
 005FEF2B    mov         eax,edi
 005FEF2D    cmp         eax,0FF
>005FEF32    ja          005FEF3B
 005FEF34    bts         dword ptr [ebp-0A0],eax
 005FEF3B    mov         eax,dword ptr [ebp-1C]
 005FEF3E    mov         edx,eax
 005FEF40    shl         eax,4
 005FEF43    sub         eax,edx
 005FEF45    lea         esi,[ebp-0A0]
 005FEF4B    lea         edi,[eax*8+81709F];gvar_0081709F
 005FEF52    mov         ecx,8
 005FEF57    rep movs    dword ptr [edi],dword ptr [esi]
 005FEF59    xor         eax,eax
 005FEF5B    pop         edx
 005FEF5C    pop         ecx
 005FEF5D    pop         ecx
 005FEF5E    mov         dword ptr fs:[eax],edx
>005FEF61    jmp         005FEF81
>005FEF63    jmp         @HandleOnException
 005FEF68    dd          1
 005FEF6C    dd          00418C04;Exception
 005FEF70    dd          005FEF74
 005FEF74    mov         eax,dword ptr [eax+4];Exception.FMessage:string
 005FEF77    call        004FA048
 005FEF7C    call        @DoneExcept
 005FEF81    xor         eax,eax
 005FEF83    pop         edx
 005FEF84    pop         ecx
 005FEF85    pop         ecx
 005FEF86    mov         dword ptr fs:[eax],edx
>005FEF89    jmp         005FEFA9
>005FEF8B    jmp         @HandleOnException
 005FEF90    dd          1
 005FEF94    dd          00418C04;Exception
 005FEF98    dd          005FEF9C
 005FEF9C    mov         eax,dword ptr [eax+4];Exception.FMessage:string
 005FEF9F    call        004FA048
 005FEFA4    call        @DoneExcept
 005FEFA9    xor         eax,eax
 005FEFAB    pop         edx
 005FEFAC    pop         ecx
 005FEFAD    pop         ecx
 005FEFAE    mov         dword ptr fs:[eax],edx
 005FEFB1    push        5FEFF5
 005FEFB6    lea         eax,[ebp-0D8]
 005FEFBC    mov         edx,0E
 005FEFC1    call        @UStrArrayClr
 005FEFC6    lea         eax,[ebp-80]
 005FEFC9    mov         edx,7
 005FEFCE    call        @UStrArrayClr
 005FEFD3    lea         eax,[ebp-24]
 005FEFD6    mov         edx,2
 005FEFDB    call        @UStrArrayClr
 005FEFE0    lea         eax,[ebp-8]
 005FEFE3    mov         edx,2
 005FEFE8    call        @UStrArrayClr
 005FEFED    ret
>005FEFEE    jmp         @HandleFinally
>005FEFF3    jmp         005FEFB6
 005FEFF5    pop         edi
 005FEFF6    pop         esi
 005FEFF7    pop         ebx
 005FEFF8    mov         esp,ebp
 005FEFFA    pop         ebp
 005FEFFB    ret
end;*}

//005FF2AC
{*function sub_005FF2AC(?:UString; ?:?):?;
begin
 005FF2AC    push        ebp
 005FF2AD    mov         ebp,esp
 005FF2AF    mov         ecx,14
 005FF2B4    push        0
 005FF2B6    push        0
 005FF2B8    dec         ecx
>005FF2B9    jne         005FF2B4
 005FF2BB    push        ecx
 005FF2BC    push        ebx
 005FF2BD    push        esi
 005FF2BE    push        edi
 005FF2BF    mov         ebx,edx
 005FF2C1    mov         dword ptr [ebp-4],eax
 005FF2C4    mov         eax,dword ptr [ebp-4]
 005FF2C7    call        @UStrAddRef
 005FF2CC    xor         eax,eax
 005FF2CE    push        ebp
 005FF2CF    push        5FF9A7
 005FF2D4    push        dword ptr fs:[eax]
 005FF2D7    mov         dword ptr fs:[eax],esp
 005FF2DA    test        ebx,ebx
 005FF2DC    sete        byte ptr [ebp-5]
>005FF2E0    jmp         005FF981
 005FF2E5    mov         eax,dword ptr [ebp-4]
 005FF2E8    mov         edx,5FF9C8;'Poll'
 005FF2ED    call        @UStrEqual
 005FF2F2    cmp         dword ptr [ebp-4],0
>005FF2F6    je          005FF305
 005FF2F8    lea         eax,[ebp-4]
 005FF2FB    mov         edx,5FF9E0;': '
 005FF300    call        @UStrCat
 005FF305    xor         eax,eax
 005FF307    push        ebp
 005FF308    push        5FF94D
 005FF30D    push        dword ptr fs:[eax]
 005FF310    mov         dword ptr fs:[eax],esp
 005FF313    mov         eax,ebx
 005FF315    cmp         eax,80070005
>005FF31A    jg          005FF3EF
>005FF320    je          005FF765
 005FF326    cmp         eax,80040203
>005FF32B    jg          005FF394
>005FF32D    je          005FF853
 005FF333    cmp         eax,80040110
>005FF338    jg          005FF36B
>005FF33A    je          005FF748
 005FF340    sub         eax,8000000A
>005FF345    je          005FF7D9
 005FF34B    sub         eax,3FF7
>005FF350    je          005FF578
 005FF356    dec         eax
>005FF357    je          005FF6F1
 005FF35D    sub         eax,3
>005FF360    je          005FF4E7
>005FF366    jmp         005FF93C
 005FF36B    sub         eax,80040154
>005FF370    je          005FF6B7
 005FF376    sub         eax,0AC
>005FF37B    je          005FF7F6
 005FF381    dec         eax
>005FF382    je          005FF813
 005FF388    dec         eax
>005FF389    je          005FF830
>005FF38F    jmp         005FF93C
 005FF394    cmp         eax,80040208
>005FF399    jg          005FF3C6
>005FF39B    je          005FF8BC
 005FF3A1    sub         eax,80040204
>005FF3A6    je          005FF876
 005FF3AC    dec         eax
>005FF3AD    je          005FF53E
 005FF3B3    dec         eax
>005FF3B4    je          005FF504
 005FF3BA    dec         eax
>005FF3BB    je          005FF899
>005FF3C1    jmp         005FF93C
 005FF3C6    sub         eax,80040209
>005FF3CB    je          005FF8DC
 005FF3D1    dec         eax
>005FF3D2    je          005FF8FC
 005FF3D8    dec         eax
>005FF3D9    je          005FF91C
 005FF3DF    sub         eax,2FDF7
>005FF3E4    je          005FF6D4
>005FF3EA    jmp         005FF93C
 005FF3EF    cmp         eax,800704DF
>005FF3F4    jg          005FF461
>005FF3F6    je          005FF72B
 005FF3FC    cmp         eax,80070057
>005FF401    jg          005FF434
>005FF403    je          005FF521
 005FF409    sub         eax,8007000C
>005FF40E    je          005FF7BC
 005FF414    sub         eax,2
>005FF417    je          005FF70E
 005FF41D    sub         eax,7
>005FF420    je          005FF55B
 005FF426    sub         eax,9
>005FF429    je          005FF782
>005FF42F    jmp         005FF93C
 005FF434    sub         eax,80070077
>005FF439    je          005FF69A
 005FF43F    sub         eax,33
>005FF442    je          005FF79F
 005FF448    sub         eax,3D4
>005FF44D    je          005FF660
 005FF453    sub         eax,3
>005FF456    je          005FF67D
>005FF45C    jmp         005FF93C
 005FF461    cmp         eax,13
>005FF464    ja          005FF93C
 005FF46A    jmp         dword ptr [eax*4+5FF471]
 005FF46A    dd          005FF4C1
 005FF46A    dd          005FF4CA
 005FF46A    dd          005FF595
 005FF46A    dd          005FF5B2
 005FF46A    dd          005FF5CF
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF5EC
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF609
 005FF46A    dd          005FF626
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF93C
 005FF46A    dd          005FF643
 005FF4C1    mov         byte ptr [ebp-5],1
>005FF4C5    jmp         005FF943
 005FF4CA    lea         eax,[ebp-0C]
 005FF4CD    mov         ecx,5FF9F4;'False/No Effect'
 005FF4D2    mov         edx,dword ptr [ebp-4]
 005FF4D5    call        @UStrCat3
 005FF4DA    mov         eax,dword ptr [ebp-0C]
 005FF4DD    call        004FA048
>005FF4E2    jmp         005FF943
 005FF4E7    lea         eax,[ebp-10]
 005FF4EA    mov         ecx,5FFA20;'Fail'
 005FF4EF    mov         edx,dword ptr [ebp-4]
 005FF4F2    call        @UStrCat3
 005FF4F7    mov         eax,dword ptr [ebp-10]
 005FF4FA    call        004FA048
>005FF4FF    jmp         005FF943
 005FF504    lea         eax,[ebp-14]
 005FF507    mov         ecx,5FFA38;'Incomplete Effect'
 005FF50C    mov         edx,dword ptr [ebp-4]
 005FF50F    call        @UStrCat3
 005FF514    mov         eax,dword ptr [ebp-14]
 005FF517    call        004FA048
>005FF51C    jmp         005FF943
 005FF521    lea         eax,[ebp-18]
 005FF524    mov         ecx,5FFA68;'Invalid Param'
 005FF529    mov         edx,dword ptr [ebp-4]
 005FF52C    call        @UStrCat3
 005FF531    mov         eax,dword ptr [ebp-18]
 005FF534    call        004FA048
>005FF539    jmp         005FF943
 005FF53E    lea         eax,[ebp-1C]
 005FF541    mov         ecx,5FFA90;'Not Exclusive Acquired'
 005FF546    mov         edx,dword ptr [ebp-4]
 005FF549    call        @UStrCat3
 005FF54E    mov         eax,dword ptr [ebp-1C]
 005FF551    call        004FA048
>005FF556    jmp         005FF943
 005FF55B    lea         eax,[ebp-20]
 005FF55E    mov         ecx,5FFACC;'Not initialized'
 005FF563    mov         edx,dword ptr [ebp-4]
 005FF566    call        @UStrCat3
 005FF56B    mov         eax,dword ptr [ebp-20]
 005FF56E    call        004FA048
>005FF573    jmp         005FF943
 005FF578    lea         eax,[ebp-24]
 005FF57B    mov         ecx,5FFAF8;'Unsupported'
 005FF580    mov         edx,dword ptr [ebp-4]
 005FF583    call        @UStrCat3
 005FF588    mov         eax,dword ptr [ebp-24]
 005FF58B    call        004FA048
>005FF590    jmp         005FF943
 005FF595    lea         eax,[ebp-28]
 005FF598    mov         ecx,5FFB1C;'Polled Device'
 005FF59D    mov         edx,dword ptr [ebp-4]
 005FF5A0    call        @UStrCat3
 005FF5A5    mov         eax,dword ptr [ebp-28]
 005FF5A8    call        004FA048
>005FF5AD    jmp         005FF943
 005FF5B2    lea         eax,[ebp-2C]
 005FF5B5    mov         ecx,5FFB44;'Download Skipped'
 005FF5BA    mov         edx,dword ptr [ebp-4]
 005FF5BD    call        @UStrCat3
 005FF5C2    mov         eax,dword ptr [ebp-2C]
 005FF5C5    call        004FA048
>005FF5CA    jmp         005FF943
 005FF5CF    lea         eax,[ebp-30]
 005FF5D2    mov         ecx,5FFB74;'Effect Restarted'
 005FF5D7    mov         edx,dword ptr [ebp-4]
 005FF5DA    call        @UStrCat3
 005FF5DF    mov         eax,dword ptr [ebp-30]
 005FF5E2    call        004FA048
>005FF5E7    jmp         005FF943
 005FF5EC    lea         eax,[ebp-34]
 005FF5EF    mov         ecx,5FFBA4;'Effect parameters updated but truncated to match capabilities'
 005FF5F4    mov         edx,dword ptr [ebp-4]
 005FF5F7    call        @UStrCat3
 005FF5FC    mov         eax,dword ptr [ebp-34]
 005FF5FF    call        004FA048
>005FF604    jmp         005FF943
 005FF609    lea         eax,[ebp-38]
 005FF60C    mov         ecx,5FFC2C;'Settings applied, but not persisted'
 005FF611    mov         edx,dword ptr [ebp-4]
 005FF614    call        @UStrCat3
 005FF619    mov         eax,dword ptr [ebp-38]
 005FF61C    call        004FA048
>005FF621    jmp         005FF943
 005FF626    lea         eax,[ebp-3C]
 005FF629    mov         ecx,5FFC80;'Truncated and restarted'
 005FF62E    mov         edx,dword ptr [ebp-4]
 005FF631    call        @UStrCat3
 005FF636    mov         eax,dword ptr [ebp-3C]
 005FF639    call        004FA048
>005FF63E    jmp         005FF943
 005FF643    lea         eax,[ebp-40]
 005FF646    mov         ecx,5FFCBC;'Write protected'
 005FF64B    mov         edx,dword ptr [ebp-4]
 005FF64E    call        @UStrCat3
 005FF653    mov         eax,dword ptr [ebp-40]
 005FF656    call        004FA048
>005FF65B    jmp         005FF943
 005FF660    lea         eax,[ebp-44]
 005FF663    mov         ecx,5FFCE8;'Old DirectInput version'
 005FF668    mov         edx,dword ptr [ebp-4]
 005FF66B    call        @UStrCat3
 005FF670    mov         eax,dword ptr [ebp-44]
 005FF673    call        004FA048
>005FF678    jmp         005FF943
 005FF67D    lea         eax,[ebp-48]
 005FF680    mov         ecx,5FFD24;'Beta DirectInput version'
 005FF685    mov         edx,dword ptr [ebp-4]
 005FF688    call        @UStrCat3
 005FF68D    mov         eax,dword ptr [ebp-48]
 005FF690    call        004FA048
>005FF695    jmp         005FF943
 005FF69A    lea         eax,[ebp-4C]
 005FF69D    mov         ecx,5FFD64;'Bad Driver version'
 005FF6A2    mov         edx,dword ptr [ebp-4]
 005FF6A5    call        @UStrCat3
 005FF6AA    mov         eax,dword ptr [ebp-4C]
 005FF6AD    call        004FA048
>005FF6B2    jmp         005FF943
 005FF6B7    lea         eax,[ebp-50]
 005FF6BA    mov         ecx,5FFD98;'Device not registered'
 005FF6BF    mov         edx,dword ptr [ebp-4]
 005FF6C2    call        @UStrCat3
 005FF6C7    mov         eax,dword ptr [ebp-50]
 005FF6CA    call        004FA048
>005FF6CF    jmp         005FF943
 005FF6D4    lea         eax,[ebp-54]
 005FF6D7    mov         ecx,5FFDD0;'Not found'
 005FF6DC    mov         edx,dword ptr [ebp-4]
 005FF6DF    call        @UStrCat3
 005FF6E4    mov         eax,dword ptr [ebp-54]
 005FF6E7    call        004FA048
>005FF6EC    jmp         005FF943
 005FF6F1    lea         eax,[ebp-58]
 005FF6F4    mov         ecx,5FFDF0;'No interface'
 005FF6F9    mov         edx,dword ptr [ebp-4]
 005FF6FC    call        @UStrCat3
 005FF701    mov         eax,dword ptr [ebp-58]
 005FF704    call        004FA048
>005FF709    jmp         005FF943
 005FF70E    lea         eax,[ebp-5C]
 005FF711    mov         ecx,5FFE18;'Out of memory'
 005FF716    mov         edx,dword ptr [ebp-4]
 005FF719    call        @UStrCat3
 005FF71E    mov         eax,dword ptr [ebp-5C]
 005FF721    call        004FA048
>005FF726    jmp         005FF943
 005FF72B    lea         eax,[ebp-60]
 005FF72E    mov         ecx,5FFE40;'Already initialized'
 005FF733    mov         edx,dword ptr [ebp-4]
 005FF736    call        @UStrCat3
 005FF73B    mov         eax,dword ptr [ebp-60]
 005FF73E    call        004FA048
>005FF743    jmp         005FF943
 005FF748    lea         eax,[ebp-64]
 005FF74B    mov         ecx,5FFE74;'No aggregation'
 005FF750    mov         edx,dword ptr [ebp-4]
 005FF753    call        @UStrCat3
 005FF758    mov         eax,dword ptr [ebp-64]
 005FF75B    call        004FA048
>005FF760    jmp         005FF943
 005FF765    lea         eax,[ebp-68]
 005FF768    mov         ecx,5FFEA0;'Other app has priority'
 005FF76D    mov         edx,dword ptr [ebp-4]
 005FF770    call        @UStrCat3
 005FF775    mov         eax,dword ptr [ebp-68]
 005FF778    call        004FA048
>005FF77D    jmp         005FF943
 005FF782    lea         eax,[ebp-6C]
 005FF785    mov         ecx,5FFEDC;'Input Lost'
 005FF78A    mov         edx,dword ptr [ebp-4]
 005FF78D    call        @UStrCat3
 005FF792    mov         eax,dword ptr [ebp-6C]
 005FF795    call        004FA048
>005FF79A    jmp         005FF943
 005FF79F    lea         eax,[ebp-70]
 005FF7A2    mov         ecx,5FFF00;'Device is acquired'
 005FF7A7    mov         edx,dword ptr [ebp-4]
 005FF7AA    call        @UStrCat3
 005FF7AF    mov         eax,dword ptr [ebp-70]
 005FF7B2    call        004FA048
>005FF7B7    jmp         005FF943
 005FF7BC    lea         eax,[ebp-74]
 005FF7BF    mov         ecx,5FFF34;'Device not acquired'
 005FF7C4    mov         edx,dword ptr [ebp-4]
 005FF7C7    call        @UStrCat3
 005FF7CC    mov         eax,dword ptr [ebp-74]
 005FF7CF    call        004FA048
>005FF7D4    jmp         005FF943
 005FF7D9    lea         eax,[ebp-78]
 005FF7DC    mov         ecx,5FFF68;'Pending'
 005FF7E1    mov         edx,dword ptr [ebp-4]
 005FF7E4    call        @UStrCat3
 005FF7E9    mov         eax,dword ptr [ebp-78]
 005FF7EC    call        004FA048
>005FF7F1    jmp         005FF943
 005FF7F6    lea         eax,[ebp-7C]
 005FF7F9    mov         ecx,5FFF84;'Insufficient Privelliges'
 005FF7FE    mov         edx,dword ptr [ebp-4]
 005FF801    call        @UStrCat3
 005FF806    mov         eax,dword ptr [ebp-7C]
 005FF809    call        004FA048
>005FF80E    jmp         005FF943
 005FF813    lea         eax,[ebp-80]
 005FF816    mov         ecx,5FFFC4;'Device full'
 005FF81B    mov         edx,dword ptr [ebp-4]
 005FF81E    call        @UStrCat3
 005FF823    mov         eax,dword ptr [ebp-80]
 005FF826    call        004FA048
>005FF82B    jmp         005FF943
 005FF830    lea         eax,[ebp-84]
 005FF836    mov         ecx,5FFFE8;'More data'
 005FF83B    mov         edx,dword ptr [ebp-4]
 005FF83E    call        @UStrCat3
 005FF843    mov         eax,dword ptr [ebp-84]
 005FF849    call        004FA048
>005FF84E    jmp         005FF943
 005FF853    lea         eax,[ebp-88]
 005FF859    mov         ecx,600008;'Not downloaded'
 005FF85E    mov         edx,dword ptr [ebp-4]
 005FF861    call        @UStrCat3
 005FF866    mov         eax,dword ptr [ebp-88]
 005FF86C    call        004FA048
>005FF871    jmp         005FF943
 005FF876    lea         eax,[ebp-8C]
 005FF87C    mov         ecx,600034;'Has effects'
 005FF881    mov         edx,dword ptr [ebp-4]
 005FF884    call        @UStrCat3
 005FF889    mov         eax,dword ptr [ebp-8C]
 005FF88F    call        004FA048
>005FF894    jmp         005FF943
 005FF899    lea         eax,[ebp-90]
 005FF89F    mov         ecx,600058;'Not buffered'
 005FF8A4    mov         edx,dword ptr [ebp-4]
 005FF8A7    call        @UStrCat3
 005FF8AC    mov         eax,dword ptr [ebp-90]
 005FF8B2    call        004FA048
>005FF8B7    jmp         005FF943
 005FF8BC    lea         eax,[ebp-94]
 005FF8C2    mov         ecx,600080;'Effect playing'
 005FF8C7    mov         edx,dword ptr [ebp-4]
 005FF8CA    call        @UStrCat3
 005FF8CF    mov         eax,dword ptr [ebp-94]
 005FF8D5    call        004FA048
>005FF8DA    jmp         005FF943
 005FF8DC    lea         eax,[ebp-98]
 005FF8E2    mov         ecx,6000AC;'Unplugged'
 005FF8E7    mov         edx,dword ptr [ebp-4]
 005FF8EA    call        @UStrCat3
 005FF8EF    mov         eax,dword ptr [ebp-98]
 005FF8F5    call        004FA048
>005FF8FA    jmp         005FF943
 005FF8FC    lea         eax,[ebp-9C]
 005FF902    mov         ecx,6000CC;'Report full'
 005FF907    mov         edx,dword ptr [ebp-4]
 005FF90A    call        @UStrCat3
 005FF90F    mov         eax,dword ptr [ebp-9C]
 005FF915    call        004FA048
>005FF91A    jmp         005FF943
 005FF91C    lea         eax,[ebp-0A0]
 005FF922    mov         ecx,6000F0;'Map file fail'
 005FF927    mov         edx,dword ptr [ebp-4]
 005FF92A    call        @UStrCat3
 005FF92F    mov         eax,dword ptr [ebp-0A0]
 005FF935    call        004FA048
>005FF93A    jmp         005FF943
 005FF93C    mov         eax,ebx
 005FF93E    call        OleCheck
 005FF943    xor         eax,eax
 005FF945    pop         edx
 005FF946    pop         ecx
 005FF947    pop         ecx
 005FF948    mov         dword ptr fs:[eax],edx
>005FF94B    jmp         005FF981
>005FF94D    jmp         @HandleOnException
 005FF952    dd          1
 005FF956    dd          00418C04;Exception
 005FF95A    dd          005FF95E
 005FF95E    mov         ebx,eax
 005FF960    mov         ecx,dword ptr [ebx+4];Exception.FMessage:string
 005FF963    lea         eax,[ebp-0A4]
 005FF969    mov         edx,dword ptr [ebp-4]
 005FF96C    call        @UStrCat3
 005FF971    mov         eax,dword ptr [ebp-0A4]
 005FF977    call        004FA048
 005FF97C    call        @DoneExcept
 005FF981    xor         eax,eax
 005FF983    pop         edx
 005FF984    pop         ecx
 005FF985    pop         ecx
 005FF986    mov         dword ptr fs:[eax],edx
 005FF989    push        5FF9AE
 005FF98E    lea         eax,[ebp-0A4]
 005FF994    mov         edx,27
 005FF999    call        @UStrArrayClr
 005FF99E    lea         eax,[ebp-4]
 005FF9A1    call        @UStrClr
 005FF9A6    ret
>005FF9A7    jmp         @HandleFinally
>005FF9AC    jmp         005FF98E
 005FF9AE    movzx       eax,byte ptr [ebp-5]
 005FF9B2    pop         edi
 005FF9B3    pop         esi
 005FF9B4    pop         ebx
 005FF9B5    mov         esp,ebp
 005FF9B7    pop         ebp
 005FF9B8    ret
end;*}

//0060010C
{*function sub_0060010C(?:?):?;
begin
 0060010C    movzx       eax,ax
 0060010F    cmp         eax,3C
>00600112    jg          0060013F
>00600114    je          00600161
 00600116    cmp         eax,21
>00600119    jge         0060012A
 0060011B    sub         eax,1
>0060011E    jb          00600164
 00600120    add         eax,0FFFFFFE3
 00600123    sub         eax,2
>00600126    jb          00600164
>00600128    jmp         00600167
 0060012A    add         eax,0FFFFFFDF
 0060012D    sub         eax,6
>00600130    jb          00600161
 00600132    dec         eax
 00600133    sub         eax,4
>00600136    jb          00600161
 00600138    sub         eax,0E
>0060013B    je          00600161
>0060013D    jmp         00600167
 0060013F    add         eax,0FFFFFFC2
 00600142    sub         eax,3
>00600145    jb          00600161
 00600147    sub         eax,1A
>0060014A    jb          0060015E
 0060014C    add         eax,0FFFFFFFD
 0060014F    sub         eax,2
>00600152    jb          00600161
 00600154    add         eax,0FFFFFFE5
 00600157    sub         eax,4
>0060015A    jb          00600161
>0060015C    jmp         00600167
 0060015E    mov         al,1
 00600160    ret
 00600161    mov         al,1
 00600163    ret
 00600164    mov         al,1
 00600166    ret
 00600167    xor         eax,eax
 00600169    ret
end;*}

//0060016C
{*function sub_0060016C(?:?):Boolean;
begin
 0060016C    mov         edx,eax
 0060016E    add         edx,0FFFFFFF8
 00600171    sub         dx,3
>00600175    jb          00600183
 00600177    sub         dx,2
>0060017B    je          00600183
 0060017D    sub         dx,0E
>00600181    jne         00600186
 00600183    xor         eax,eax
 00600185    ret
 00600186    cmp         ax,1F
 0060018A    setbe       al
 0060018D    ret
end;*}

//00600190
{*function sub_00600190(?:?):?;
begin
 00600190    movzx       eax,ax
 00600193    cmp         eax,7F
>00600196    ja          00600586
 0060019C    jmp         dword ptr [eax*4+6001A3]
 0060019C    dd          006004BD
 0060019C    dd          006004C3
 0060019C    dd          006004C9
 0060019C    dd          006004CF
 0060019C    dd          006004D5
 0060019C    dd          006004DB
 0060019C    dd          006004E1
 0060019C    dd          006004E7
 0060019C    dd          006004ED
 0060019C    dd          006004F3
 0060019C    dd          006004F9
 0060019C    dd          006004FC
 0060019C    dd          00600502
 0060019C    dd          00600508
 0060019C    dd          0060050E
 0060019C    dd          00600514
 0060019C    dd          0060051A
 0060019C    dd          00600520
 0060019C    dd          00600526
 0060019C    dd          0060052C
 0060019C    dd          00600532
 0060019C    dd          00600538
 0060019C    dd          0060053E
 0060019C    dd          00600544
 0060019C    dd          0060054A
 0060019C    dd          00600550
 0060019C    dd          00600556
 0060019C    dd          0060055C
 0060019C    dd          00600562
 0060019C    dd          00600568
 0060019C    dd          0060056E
 0060019C    dd          00600574
 0060019C    dd          0060057A
 0060019C    dd          006003A3
 0060019C    dd          006004A5
 0060019C    dd          006003AF
 0060019C    dd          006003B5
 0060019C    dd          006003BB
 0060019C    dd          006003C7
 0060019C    dd          006004A5
 0060019C    dd          006003D3
 0060019C    dd          006003D9
 0060019C    dd          006003CD
 0060019C    dd          00600487
 0060019C    dd          006004AB
 0060019C    dd          00600481
 0060019C    dd          006004B1
 0060019C    dd          006004B7
 0060019C    dd          006003D9
 0060019C    dd          006003A3
 0060019C    dd          006003A9
 0060019C    dd          006003AF
 0060019C    dd          006003B5
 0060019C    dd          006003BB
 0060019C    dd          006003C1
 0060019C    dd          006003C7
 0060019C    dd          006003CD
 0060019C    dd          006003D3
 0060019C    dd          0060049F
 0060019C    dd          0060049F
 0060019C    dd          006004AB
 0060019C    dd          00600487
 0060019C    dd          006004B1
 0060019C    dd          006004B7
 0060019C    dd          006003A9
 0060019C    dd          006003DF
 0060019C    dd          006003E5
 0060019C    dd          006003EB
 0060019C    dd          006003F1
 0060019C    dd          006003F7
 0060019C    dd          006003FD
 0060019C    dd          00600403
 0060019C    dd          00600409
 0060019C    dd          0060040F
 0060019C    dd          00600415
 0060019C    dd          0060041B
 0060019C    dd          00600421
 0060019C    dd          00600427
 0060019C    dd          0060042D
 0060019C    dd          00600433
 0060019C    dd          00600439
 0060019C    dd          0060043F
 0060019C    dd          00600445
 0060019C    dd          0060044B
 0060019C    dd          00600451
 0060019C    dd          00600457
 0060019C    dd          0060045D
 0060019C    dd          00600463
 0060019C    dd          00600469
 0060019C    dd          0060046F
 0060019C    dd          00600475
 0060019C    dd          0060048D
 0060019C    dd          00600499
 0060019C    dd          00600493
 0060019C    dd          006003C1
 0060019C    dd          00600481
 0060019C    dd          0060047B
 0060019C    dd          006003DF
 0060019C    dd          006003E5
 0060019C    dd          006003EB
 0060019C    dd          006003F1
 0060019C    dd          006003F7
 0060019C    dd          006003FD
 0060019C    dd          00600403
 0060019C    dd          00600409
 0060019C    dd          0060040F
 0060019C    dd          00600415
 0060019C    dd          0060041B
 0060019C    dd          00600421
 0060019C    dd          00600427
 0060019C    dd          0060042D
 0060019C    dd          00600433
 0060019C    dd          00600439
 0060019C    dd          0060043F
 0060019C    dd          00600445
 0060019C    dd          0060044B
 0060019C    dd          00600451
 0060019C    dd          00600457
 0060019C    dd          0060045D
 0060019C    dd          00600463
 0060019C    dd          00600469
 0060019C    dd          0060046F
 0060019C    dd          00600475
 0060019C    dd          0060048D
 0060019C    dd          00600499
 0060019C    dd          00600493
 0060019C    dd          0060047B
 0060019C    dd          00600580
 006003A3    mov         eax,2
 006003A8    ret
 006003A9    mov         eax,3
 006003AE    ret
 006003AF    mov         eax,4
 006003B4    ret
 006003B5    mov         eax,5
 006003BA    ret
 006003BB    mov         eax,6
 006003C0    ret
 006003C1    mov         eax,7
 006003C6    ret
 006003C7    mov         eax,8
 006003CC    ret
 006003CD    mov         eax,9
 006003D2    ret
 006003D3    mov         eax,0A
 006003D8    ret
 006003D9    mov         eax,0B
 006003DE    ret
 006003DF    mov         eax,1E
 006003E4    ret
 006003E5    mov         eax,30
 006003EA    ret
 006003EB    mov         eax,2E
 006003F0    ret
 006003F1    mov         eax,20
 006003F6    ret
 006003F7    mov         eax,12
 006003FC    ret
 006003FD    mov         eax,21
 00600402    ret
 00600403    mov         eax,22
 00600408    ret
 00600409    mov         eax,23
 0060040E    ret
 0060040F    mov         eax,17
 00600414    ret
 00600415    mov         eax,24
 0060041A    ret
 0060041B    mov         eax,25
 00600420    ret
 00600421    mov         eax,26
 00600426    ret
 00600427    mov         eax,32
 0060042C    ret
 0060042D    mov         eax,31
 00600432    ret
 00600433    mov         eax,18
 00600438    ret
 00600439    mov         eax,19
 0060043E    ret
 0060043F    mov         eax,10
 00600444    ret
 00600445    mov         eax,13
 0060044A    ret
 0060044B    mov         eax,1F
 00600450    ret
 00600451    mov         eax,14
 00600456    ret
 00600457    mov         eax,16
 0060045C    ret
 0060045D    mov         eax,2F
 00600462    ret
 00600463    mov         eax,11
 00600468    ret
 00600469    mov         eax,2D
 0060046E    ret
 0060046F    mov         eax,15
 00600474    ret
 00600475    mov         eax,2C
 0060047A    ret
 0060047B    mov         eax,29
 00600480    ret
 00600481    mov         eax,0C
 00600486    ret
 00600487    mov         eax,0D
 0060048C    ret
 0060048D    mov         eax,1A
 00600492    ret
 00600493    mov         eax,1B
 00600498    ret
 00600499    mov         eax,2B
 0060049E    ret
 0060049F    mov         eax,27
 006004A4    ret
 006004A5    mov         eax,28
 006004AA    ret
 006004AB    mov         eax,33
 006004B0    ret
 006004B1    mov         eax,34
 006004B6    ret
 006004B7    mov         eax,35
 006004BC    ret
 006004BD    mov         eax,3
 006004C2    ret
 006004C3    mov         eax,1E
 006004C8    ret
 006004C9    mov         eax,30
 006004CE    ret
 006004CF    mov         eax,2E
 006004D4    ret
 006004D5    mov         eax,20
 006004DA    ret
 006004DB    mov         eax,12
 006004E0    ret
 006004E1    mov         eax,21
 006004E6    ret
 006004E7    mov         eax,22
 006004EC    ret
 006004ED    mov         eax,0E
 006004F2    ret
 006004F3    mov         eax,0F
 006004F8    ret
 006004F9    xor         eax,eax
 006004FB    ret
 006004FC    mov         eax,25
 00600501    ret
 00600502    mov         eax,26
 00600507    ret
 00600508    mov         eax,1C
 0060050D    ret
 0060050E    mov         eax,31
 00600513    ret
 00600514    mov         eax,18
 00600519    ret
 0060051A    mov         eax,19
 0060051F    ret
 00600520    mov         eax,10
 00600525    ret
 00600526    mov         eax,13
 0060052B    ret
 0060052C    mov         eax,1F
 00600531    ret
 00600532    mov         eax,14
 00600537    ret
 00600538    mov         eax,16
 0060053D    ret
 0060053E    mov         eax,2F
 00600543    ret
 00600544    mov         eax,11
 00600549    ret
 0060054A    mov         eax,2D
 0060054F    ret
 00600550    mov         eax,15
 00600555    ret
 00600556    mov         eax,2C
 0060055B    ret
 0060055C    mov         eax,1
 00600561    ret
 00600562    mov         eax,2B
 00600567    ret
 00600568    mov         eax,1B
 0060056D    ret
 0060056E    mov         eax,7
 00600573    ret
 00600574    mov         eax,0C
 00600579    ret
 0060057A    mov         eax,39
 0060057F    ret
 00600580    mov         eax,0D3
 00600585    ret
 00600586    or          eax,0FFFFFFFF
 00600589    ret
end;*}

//0060058C
{*function sub_0060058C(?:Integer):?;
begin
 0060058C    mov         edx,eax
 0060058E    add         edx,0FFFFFF00
 00600594    cmp         edx,11
>00600597    ja          006005ED
 00600599    movzx       edx,byte ptr [edx+6005A7]
 006005A0    jmp         dword ptr [edx*4+6005B9]
 006005A0    db          1
 006005A0    db          2
 006005A0    db          3
 006005A0    db          4
 006005A0    db          5
 006005A0    db          6
 006005A0    db          6
 006005A0    db          6
 006005A0    db          0
 006005A0    db          0
 006005A0    db          0
 006005A0    db          0
 006005A0    db          0
 006005A0    db          0
 006005A0    db          0
 006005A0    db          0
 006005A0    db          0
 006005A0    db          7
 006005A0    dd          006005ED
 006005A0    dd          006005D9
 006005A0    dd          006005DC
 006005A0    dd          006005DF
 006005A0    dd          006005E2
 006005A0    dd          006005E5
 006005A0    dd          006005E8
 006005A0    dd          006005EB
 006005D9    mov         al,2A
 006005DB    ret
 006005DC    mov         al,1D
 006005DE    ret
 006005DF    mov         al,38
 006005E1    ret
 006005E2    mov         al,0DB
 006005E4    ret
 006005E5    mov         al,0AA
 006005E7    ret
 006005E8    mov         al,1D
 006005EA    ret
 006005EB    mov         al,1D
 006005ED    ret
end;*}

//006005F0
{*procedure sub_006005F0(?:?);
begin
 006005F0    push        ebx
 006005F1    add         esp,0FFFFFFE4
 006005F4    mov         ebx,eax
 006005F6    mov         dword ptr [esp],1
 006005FD    call        005FCDA0
 00600602    test        al,al
>00600604    je          00600628
 00600606    mov         word ptr [esp+4],0
 0060060D    mov         eax,ebx
 0060060F    call        0060058C
 00600614    and         al,7F
 00600616    movzx       eax,al
 00600619    mov         word ptr [esp+6],ax
 0060061E    mov         dword ptr [esp+8],8
>00600626    jmp         00600645
 00600628    mov         eax,ebx
 0060062A    call        005FCDC8
 0060062F    mov         word ptr [esp+4],ax
 00600634    mov         eax,ebx
 00600636    call        0060058C
 0060063B    and         al,7F
 0060063D    movzx       eax,al
 00600640    mov         word ptr [esp+6],ax
 00600645    xor         eax,eax
 00600647    mov         dword ptr [esp+0C],eax
 0060064B    xor         eax,eax
 0060064D    mov         dword ptr [esp+10],eax
 00600651    mov         eax,ebx
 00600653    call        0060058C
 00600658    cmp         al,80
>0060065A    jb          00600661
 0060065C    or          dword ptr [esp+8],1
 00600661    push        1C
 00600663    lea         eax,[esp+4]
 00600667    push        eax
 00600668    push        1
 0060066A    call        dword ptr ds:[816E98]
 00600670    add         esp,1C
 00600673    pop         ebx
 00600674    ret
end;*}

//00600678
{*procedure sub_00600678(?:?);
begin
 00600678    push        ebx
 00600679    add         esp,0FFFFFFE4
 0060067C    mov         ebx,eax
 0060067E    mov         dword ptr [esp],1
 00600685    call        005FCDA0
 0060068A    test        al,al
>0060068C    je          006006B0
 0060068E    mov         word ptr [esp+4],0
 00600695    mov         eax,ebx
 00600697    call        0060058C
 0060069C    and         al,7F
 0060069E    movzx       eax,al
 006006A1    mov         word ptr [esp+6],ax
 006006A6    mov         dword ptr [esp+8],0A
>006006AE    jmp         006006D5
 006006B0    mov         eax,ebx
 006006B2    call        005FCDC8
 006006B7    mov         word ptr [esp+4],ax
 006006BC    mov         eax,ebx
 006006BE    call        0060058C
 006006C3    and         al,7F
 006006C5    movzx       eax,al
 006006C8    mov         word ptr [esp+6],ax
 006006CD    mov         dword ptr [esp+8],2
 006006D5    xor         eax,eax
 006006D7    mov         dword ptr [esp+0C],eax
 006006DB    xor         eax,eax
 006006DD    mov         dword ptr [esp+10],eax
 006006E1    mov         eax,ebx
 006006E3    call        0060058C
 006006E8    cmp         al,80
>006006EA    jb          006006F1
 006006EC    or          dword ptr [esp+8],1
 006006F1    push        1C
 006006F3    lea         eax,[esp+4]
 006006F7    push        eax
 006006F8    push        1
 006006FA    call        dword ptr ds:[816E98]
 00600700    add         esp,1C
 00600703    pop         ebx
 00600704    ret
end;*}

//00600708
{*procedure sub_00600708(?:?);
begin
 00600708    push        ebx
 00600709    add         esp,0FFFFFFE4
 0060070C    mov         ebx,eax
 0060070E    mov         dword ptr [esp],1
 00600715    call        005FCDA0
 0060071A    test        al,al
>0060071C    je          0060074D
 0060071E    mov         word ptr [esp+4],0
 00600725    mov         word ptr [esp+6],bx
 0060072A    mov         dword ptr [esp+8],4
 00600732    xor         eax,eax
 00600734    mov         dword ptr [esp+0C],eax
 00600738    xor         eax,eax
 0060073A    mov         dword ptr [esp+10],eax
 0060073E    push        1C
 00600740    lea         eax,[esp+4]
 00600744    push        eax
 00600745    push        1
 00600747    call        dword ptr ds:[816E98]
 0060074D    add         esp,1C
 00600750    pop         ebx
 00600751    ret
end;*}

//00600754
{*procedure sub_00600754(?:?);
begin
 00600754    push        ebp
 00600755    mov         ebp,esp
 00600757    add         esp,0FFFFFFE0
 0060075A    push        ebx
 0060075B    xor         edx,edx
 0060075D    mov         dword ptr [ebp-20],edx
 00600760    mov         ebx,eax
 00600762    xor         eax,eax
 00600764    push        ebp
 00600765    push        6007DD
 0060076A    push        dword ptr fs:[eax]
 0060076D    mov         dword ptr fs:[eax],esp
 00600770    mov         dword ptr [ebp-1C],1
 00600777    call        005FCDA0
 0060077C    test        al,al
>0060077E    je          00600793
 00600780    mov         word ptr [ebp-18],0
 00600786    mov         word ptr [ebp-16],bx
 0060078A    mov         dword ptr [ebp-14],6
>00600791    jmp         006007AF
 00600793    cmp         ebx,0FF
>00600799    ja          006007C7
 0060079B    lea         eax,[ebp-20]
 0060079E    mov         edx,ebx
 006007A0    call        @UStrFromWChar
 006007A5    mov         eax,dword ptr [ebp-20]
 006007A8    call        006007EC
>006007AD    jmp         006007C7
 006007AF    xor         eax,eax
 006007B1    mov         dword ptr [ebp-10],eax
 006007B4    xor         eax,eax
 006007B6    mov         dword ptr [ebp-0C],eax
 006007B9    push        1C
 006007BB    lea         eax,[ebp-1C]
 006007BE    push        eax
 006007BF    push        1
 006007C1    call        dword ptr ds:[816E98]
 006007C7    xor         eax,eax
 006007C9    pop         edx
 006007CA    pop         ecx
 006007CB    pop         ecx
 006007CC    mov         dword ptr fs:[eax],edx
 006007CF    push        6007E4
 006007D4    lea         eax,[ebp-20]
 006007D7    call        @UStrClr
 006007DC    ret
>006007DD    jmp         @HandleFinally
>006007E2    jmp         006007D4
 006007E4    pop         ebx
 006007E5    mov         esp,ebp
 006007E7    pop         ebp
 006007E8    ret
end;*}

//006007EC
procedure sub_006007EC(?:UnicodeString);
begin
{*
 006007EC    push        ebp
 006007ED    mov         ebp,esp
 006007EF    add         esp,0FFFFFFF4
 006007F2    push        ebx
 006007F3    push        esi
 006007F4    push        edi
 006007F5    mov         dword ptr [ebp-4],eax
 006007F8    mov         eax,dword ptr [ebp-4]
 006007FB    call        @UStrAddRef
 00600800    xor         eax,eax
 00600802    push        ebp
 00600803    push        6008FB
 00600808    push        dword ptr fs:[eax]
 0060080B    mov         dword ptr fs:[eax],esp
 0060080E    mov         eax,dword ptr [ebp-4]
 00600811    test        eax,eax
>00600813    je          0060081A
 00600815    sub         eax,4
 00600818    mov         eax,dword ptr [eax]
 0060081A    test        eax,eax
>0060081C    jle         006008E5
 00600822    mov         dword ptr [ebp-0C],eax
 00600825    mov         edi,1
 0060082A    mov         eax,dword ptr [ebp-4]
 0060082D    movzx       ebx,word ptr [eax+edi*2-2]
 00600832    mov         eax,ebx
 00600834    call        00600190
 00600839    mov         esi,eax
 0060083B    cmp         bx,0A
>0060083F    jne         0060085A
 00600841    cmp         edi,1
>00600844    jle         00600855
 00600846    mov         eax,dword ptr [ebp-4]
 00600849    cmp         word ptr [eax+edi*2-4],0D
>0060084F    jne         00600855
 00600851    xor         esi,esi
>00600853    jmp         0060085A
 00600855    mov         esi,1C
 0060085A    test        esi,esi
>0060085C    je          006008DB
 0060085E    test        esi,esi
>00600860    jge         0060087E
 00600862    call        005FCDA0
 00600867    test        al,al
>00600869    je          006008DB
 0060086B    movzx       esi,bx
 0060086E    mov         eax,esi
 00600870    call        00600708
 00600875    mov         eax,esi
 00600877    call        00600754
>0060087C    jmp         006008DB
 0060087E    mov         eax,ebx
 00600880    call        0060016C
 00600885    mov         byte ptr [ebp-5],al
 00600888    mov         eax,ebx
 0060088A    call        0060010C
 0060088F    mov         ebx,eax
 00600891    cmp         byte ptr [ebp-5],0
>00600895    je          006008A1
 00600897    mov         eax,1D
 0060089C    call        006005F0
 006008A1    test        bl,bl
>006008A3    je          006008AF
 006008A5    mov         eax,2A
 006008AA    call        006005F0
 006008AF    mov         eax,esi
 006008B1    call        006005F0
 006008B6    mov         eax,esi
 006008B8    call        00600678
 006008BD    test        bl,bl
>006008BF    je          006008CB
 006008C1    mov         eax,2A
 006008C6    call        00600678
 006008CB    cmp         byte ptr [ebp-5],0
>006008CF    je          006008DB
 006008D1    mov         eax,1D
 006008D6    call        00600678
 006008DB    inc         edi
 006008DC    dec         dword ptr [ebp-0C]
>006008DF    jne         0060082A
 006008E5    xor         eax,eax
 006008E7    pop         edx
 006008E8    pop         ecx
 006008E9    pop         ecx
 006008EA    mov         dword ptr fs:[eax],edx
 006008ED    push        600902
 006008F2    lea         eax,[ebp-4]
 006008F5    call        @UStrClr
 006008FA    ret
>006008FB    jmp         @HandleFinally
>00600900    jmp         006008F2
 00600902    pop         edi
 00600903    pop         esi
 00600904    pop         ebx
 00600905    mov         esp,ebp
 00600907    pop         ebp
 00600908    ret
*}
end;

//0060090C
procedure sub_0060090C(?:WideString);
begin
{*
 0060090C    push        ebp
 0060090D    mov         ebp,esp
 0060090F    push        ecx
 00600910    push        ebx
 00600911    push        esi
 00600912    mov         dword ptr [ebp-4],eax
 00600915    lea         eax,[ebp-4]
 00600918    call        @WStrAddRef
 0060091D    xor         eax,eax
 0060091F    push        ebp
 00600920    push        600978
 00600925    push        dword ptr fs:[eax]
 00600928    mov         dword ptr fs:[eax],esp
 0060092B    mov         eax,dword ptr [ebp-4]
 0060092E    test        eax,eax
>00600930    je          00600939
 00600932    sub         eax,4
 00600935    mov         eax,dword ptr [eax]
 00600937    shr         eax,1
 00600939    mov         esi,eax
 0060093B    test        esi,esi
>0060093D    jle         00600962
 0060093F    mov         ebx,1
 00600944    mov         eax,dword ptr [ebp-4]
 00600947    movzx       eax,word ptr [eax+ebx*2-2]
 0060094C    call        00600708
 00600951    mov         eax,dword ptr [ebp-4]
 00600954    movzx       eax,word ptr [eax+ebx*2-2]
 00600959    call        00600754
 0060095E    inc         ebx
 0060095F    dec         esi
>00600960    jne         00600944
 00600962    xor         eax,eax
 00600964    pop         edx
 00600965    pop         ecx
 00600966    pop         ecx
 00600967    mov         dword ptr fs:[eax],edx
 0060096A    push        60097F
 0060096F    lea         eax,[ebp-4]
 00600972    call        @WStrClr
 00600977    ret
>00600978    jmp         @HandleFinally
>0060097D    jmp         0060096F
 0060097F    pop         esi
 00600980    pop         ebx
 00600981    pop         ecx
 00600982    pop         ebp
 00600983    ret
*}
end;

//00600984
procedure sub_00600984;
begin
{*
 00600984    push        ebx
 00600985    push        6009F8;'user32'
 0060098A    call        kernel32.GetModuleHandleW
 0060098F    mov         ebx,eax
 00600991    push        600A08;'SendInput'
 00600996    push        ebx
 00600997    call        GetProcAddress
 0060099C    mov         [00816E98],eax;gvar_00816E98:Pointer
 006009A1    cmp         dword ptr ds:[816E98],0;gvar_00816E98:Pointer
>006009A8    jne         006009B4
 006009AA    mov         dword ptr ds:[816E98],5FCB30
 006009B4    push        600A1C;'RegisterRawInputDevices'
 006009B9    push        ebx
 006009BA    call        GetProcAddress
 006009BF    mov         [00816E9C],eax;gvar_00816E9C:Pointer
 006009C4    push        600A4C;'GetRawInputData'
 006009C9    push        ebx
 006009CA    call        GetProcAddress
 006009CF    mov         [00816EA0],eax;gvar_00816EA0:Pointer
 006009D4    push        600A6C;'GetRawInputDeviceList'
 006009D9    push        ebx
 006009DA    call        GetProcAddress
 006009DF    mov         [00816EA4],eax;gvar_00816EA4:Pointer
 006009E4    push        600A98;'GetRawInputDeviceInfoA'
 006009E9    push        ebx
 006009EA    call        GetProcAddress
 006009EF    mov         [00816EA8],eax;gvar_00816EA8:Pointer
 006009F4    pop         ebx
 006009F5    ret
*}
end;

Initialization
//00781AF0
{*
 00781AF0    push        ebp
 00781AF1    mov         ebp,esp
 00781AF3    push        ebx
 00781AF4    push        esi
 00781AF5    push        edi
 00781AF6    sub         dword ptr ds:[8177F8],1
>00781AFD    jae         00781B41
 00781AFF    xor         edx,edx
 00781B01    push        ebp
 00781B02    push        781B26
 00781B07    push        dword ptr fs:[edx]
 00781B0A    mov         dword ptr fs:[edx],esp
 00781B0D    mov         eax,781B54;'Initializing PieInput'
 00781B12    call        004FA5FC
 00781B17    call        00600984
 00781B1C    xor         eax,eax
 00781B1E    pop         edx
 00781B1F    pop         ecx
 00781B20    pop         ecx
 00781B21    mov         dword ptr fs:[eax],edx
>00781B24    jmp         00781B41
>00781B26    jmp         @HandleOnException
 00781B2B    dd          1
 00781B2F    dd          00418C04;Exception
 00781B33    dd          00781B37
 00781B37    call        004FA644
 00781B3C    call        @DoneExcept
 00781B41    pop         edi
 00781B42    pop         esi
 00781B43    pop         ebx
 00781B44    pop         ebp
 00781B45    ret
*}
Finalization
//00600AC8
{*
 00600AC8    push        ebp
 00600AC9    mov         ebp,esp
 00600ACB    xor         eax,eax
 00600ACD    push        ebp
 00600ACE    push        600AFE
 00600AD3    push        dword ptr fs:[eax]
 00600AD6    mov         dword ptr fs:[eax],esp
 00600AD9    inc         dword ptr ds:[8177F8]
>00600ADF    jne         00600AF0
 00600AE1    call        005FD5B0
 00600AE6    mov         eax,78BD08;gvar_0078BD08:IInterface
 00600AEB    call        @IntfClear
 00600AF0    xor         eax,eax
 00600AF2    pop         edx
 00600AF3    pop         ecx
 00600AF4    pop         ecx
 00600AF5    mov         dword ptr fs:[eax],edx
 00600AF8    push        600B05
 00600AFD    ret
>00600AFE    jmp         @HandleFinally
>00600B03    jmp         00600AFD
 00600B05    pop         ebp
 00600B06    ret
*}
end.