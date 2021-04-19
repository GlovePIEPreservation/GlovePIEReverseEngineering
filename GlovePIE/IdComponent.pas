//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IdComponent;

interface

uses
  SysUtils, Classes, IdComponent;

type
  TIdStatus = (hsResolving, hsConnecting, hsConnected, hsDisconnecting, hsDisconnected, hsStatusText, ftpTransfer, ftpReady, ftpAborted);
  TIdStatusEvent = procedure(ASender:TObject; const AStatus:TIdStatus; const AStatusText:string) of object;;
  TWorkMode = (wmRead, wmWrite);
  TWorkBeginEvent = procedure(ASender:TObject; AWorkMode:TWorkMode; AWorkCountMax:Int64) of object;;
  TWorkEndEvent = procedure(ASender:TObject; AWorkMode:TWorkMode) of object;;
  TWorkEvent = procedure(ASender:TObject; AWorkMode:TWorkMode; AWorkCount:Int64) of object;;
  TIdComponent = class(TIdBaseComponent)
  published
    procedure DoWork(AWorkMode:TWorkMode; ACount:Int64);//005AAA98
    procedure EndWork(AWorkMode:TWorkMode);//005AAAF8
    procedure BeginWork(AWorkMode:TWorkMode; ASize:Int64);//005AAA2C
    destructor Destroy();//005AA934
  public
    FOnStatus:TIdStatusEvent;//f38
    FOnWork:TWorkEvent;//f40
    FOnWorkBegin:TWorkBeginEvent;//f48
    FOnWorkEnd:TWorkEndEvent;//f50
    FWorkInfos:?;//f58
    FWorkTarget:TIdComponent;//f88
    destructor Destroy(); virtual;//005AA934
    procedure InitComponent; virtual;//v34//005AAB38
    procedure BeginWork(AWorkMode:TWorkMode; ASize:Int64); virtual;//v38//005AAA2C
    procedure DoWork(AWorkMode:TWorkMode; ACount:Int64); virtual;//v3C//005AAA98
    procedure EndWork(AWorkMode:TWorkMode); virtual;//v40//005AAAF8
    procedure DoStatus(AStatus:TIdStatus);//005AA964
    procedure DoStatus(AStatus:TIdStatus; const AArgs:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//005AA970
  end;
    procedure InitComponent;//005AAB38

implementation

//005AA934
destructor TIdComponent.Destroy();
begin
{*
 005AA934    push        ebx
 005AA935    push        esi
 005AA936    call        @BeforeDestruction
 005AA93B    mov         ebx,edx
 005AA93D    mov         esi,eax
 005AA93F    mov         edx,ebx
 005AA941    and         dl,0FC
 005AA944    mov         eax,esi
 005AA946    call        TComponent.Destroy
 005AA94B    mov         eax,[005A7FAC];TIdStack
 005AA950    call        TIdStack.DecUsage
 005AA955    test        bl,bl
>005AA957    jle         005AA960
 005AA959    mov         eax,esi
 005AA95B    call        @ClassDestroy
 005AA960    pop         esi
 005AA961    pop         ebx
 005AA962    ret
*}
end;

//005AA964
procedure TIdComponent.DoStatus(AStatus:TIdStatus);
begin
{*
 005AA964    push        0FF
 005AA966    lea         ecx,[esp+4]
 005AA96A    call        TIdComponent.DoStatus
 005AA96F    ret
*}
end;

//005AA970
procedure TIdComponent.DoStatus(AStatus:TIdStatus; const AArgs:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 005AA970    push        ebp
 005AA971    mov         ebp,esp
 005AA973    add         esp,0FFFFFFF0
 005AA976    push        ebx
 005AA977    push        esi
 005AA978    push        edi
 005AA979    xor         ebx,ebx
 005AA97B    mov         dword ptr [ebp-10],ebx
 005AA97E    mov         dword ptr [ebp-4],ebx
 005AA981    mov         edi,ecx
 005AA983    mov         ebx,edx
 005AA985    mov         esi,eax
 005AA987    xor         eax,eax
 005AA989    push        ebp
 005AA98A    push        5AAA19
 005AA98F    push        dword ptr fs:[eax]
 005AA992    mov         dword ptr fs:[eax],esp
 005AA995    cmp         word ptr [esi+3A],0
>005AA99A    je          005AA9FB
 005AA99C    mov         eax,dword ptr [ebp+8]
 005AA99F    inc         eax
 005AA9A0    test        eax,eax
>005AA9A2    jne         005AA9D5
 005AA9A4    lea         eax,[ebp-4]
 005AA9A7    push        eax
 005AA9A8    xor         eax,eax
 005AA9AA    mov         dword ptr [ebp-0C],eax
 005AA9AD    mov         byte ptr [ebp-8],11
 005AA9B1    lea         edx,[ebp-0C]
 005AA9B4    movzx       eax,bl
 005AA9B7    mov         eax,dword ptr [eax*4+789EE4]
 005AA9BE    xor         ecx,ecx
 005AA9C0    call        IndyFormat
 005AA9C5    mov         eax,dword ptr [ebp-4]
 005AA9C8    push        eax
 005AA9C9    mov         ecx,ebx
 005AA9CB    mov         edx,esi
 005AA9CD    mov         eax,dword ptr [esi+3C]
 005AA9D0    call        dword ptr [esi+38]
>005AA9D3    jmp         005AA9FB
 005AA9D5    lea         eax,[ebp-10]
 005AA9D8    push        eax
 005AA9D9    mov         edx,edi
 005AA9DB    movzx       eax,bl
 005AA9DE    mov         eax,dword ptr [eax*4+789EE4]
 005AA9E5    mov         ecx,dword ptr [ebp+8]
 005AA9E8    call        IndyFormat
 005AA9ED    mov         eax,dword ptr [ebp-10]
 005AA9F0    push        eax
 005AA9F1    mov         ecx,ebx
 005AA9F3    mov         edx,esi
 005AA9F5    mov         eax,dword ptr [esi+3C]
 005AA9F8    call        dword ptr [esi+38]
 005AA9FB    xor         eax,eax
 005AA9FD    pop         edx
 005AA9FE    pop         ecx
 005AA9FF    pop         ecx
 005AAA00    mov         dword ptr fs:[eax],edx
 005AAA03    push        5AAA20
 005AAA08    lea         eax,[ebp-10]
 005AAA0B    call        @UStrClr
 005AAA10    lea         eax,[ebp-4]
 005AAA13    call        @UStrClr
 005AAA18    ret
>005AAA19    jmp         @HandleFinally
>005AAA1E    jmp         005AAA08
 005AAA20    pop         edi
 005AAA21    pop         esi
 005AAA22    pop         ebx
 005AAA23    mov         esp,ebp
 005AAA25    pop         ebp
 005AAA26    ret         4
*}
end;

//005AAA2C
procedure TIdComponent.BeginWork(AWorkMode:TWorkMode; ASize:Int64);
begin
{*
 005AAA2C    push        ebp
 005AAA2D    mov         ebp,esp
 005AAA2F    push        ebx
 005AAA30    push        esi
 005AAA31    mov         esi,dword ptr [eax+88]
 005AAA37    test        esi,esi
>005AAA39    je          005AAA4A
 005AAA3B    push        dword ptr [ebp+0C]
 005AAA3E    push        dword ptr [ebp+8]
 005AAA41    mov         eax,esi
 005AAA43    mov         ecx,dword ptr [eax]
 005AAA45    call        dword ptr [ecx+38]
>005AAA48    jmp         005AAA92
 005AAA4A    movzx       ecx,dl
 005AAA4D    lea         ecx,[ecx+ecx*2]
 005AAA50    inc         dword ptr [eax+ecx*8+68]
 005AAA54    cmp         dword ptr [eax+ecx*8+68],1
>005AAA59    jne         005AAA92
 005AAA5B    mov         ebx,dword ptr [ebp+8]
 005AAA5E    mov         dword ptr [eax+ecx*8+60],ebx
 005AAA62    mov         ebx,dword ptr [ebp+0C]
 005AAA65    mov         dword ptr [eax+ecx*8+64],ebx
 005AAA69    mov         dword ptr [eax+ecx*8+58],0
 005AAA71    mov         dword ptr [eax+ecx*8+5C],0
 005AAA79    cmp         word ptr [eax+4A],0
>005AAA7E    je          005AAA92
 005AAA80    push        dword ptr [ebp+0C]
 005AAA83    push        dword ptr [ebp+8]
 005AAA86    mov         ebx,eax
 005AAA88    mov         ecx,edx
 005AAA8A    mov         edx,eax
 005AAA8C    mov         eax,dword ptr [ebx+4C]
 005AAA8F    call        dword ptr [ebx+48]
 005AAA92    pop         esi
 005AAA93    pop         ebx
 005AAA94    pop         ebp
 005AAA95    ret         8
*}
end;

//005AAA98
procedure TIdComponent.DoWork(AWorkMode:TWorkMode; ACount:Int64);
begin
{*
 005AAA98    push        ebp
 005AAA99    mov         ebp,esp
 005AAA9B    push        ebx
 005AAA9C    push        esi
 005AAA9D    mov         ebx,edx
 005AAA9F    mov         ecx,eax
 005AAAA1    mov         esi,dword ptr [ecx+88]
 005AAAA7    test        esi,esi
>005AAAA9    je          005AAABC
 005AAAAB    push        dword ptr [ebp+0C]
 005AAAAE    push        dword ptr [ebp+8]
 005AAAB1    mov         edx,ebx
 005AAAB3    mov         eax,esi
 005AAAB5    mov         ecx,dword ptr [eax]
 005AAAB7    call        dword ptr [ecx+3C]
>005AAABA    jmp         005AAAF2
 005AAABC    movzx       eax,bl
 005AAABF    lea         esi,[eax+eax*2]
 005AAAC2    cmp         dword ptr [ecx+esi*8+68],0
>005AAAC7    jle         005AAAF2
 005AAAC9    mov         eax,dword ptr [ebp+8]
 005AAACC    mov         edx,dword ptr [ebp+0C]
 005AAACF    add         dword ptr [ecx+esi*8+58],eax
 005AAAD3    adc         dword ptr [ecx+esi*8+5C],edx
 005AAAD7    cmp         word ptr [ecx+42],0
>005AAADC    je          005AAAF2
 005AAADE    push        dword ptr [ecx+esi*8+5C]
 005AAAE2    push        dword ptr [ecx+esi*8+58]
 005AAAE6    mov         esi,ecx
 005AAAE8    mov         edx,ecx
 005AAAEA    mov         ecx,ebx
 005AAAEC    mov         eax,dword ptr [esi+44]
 005AAAEF    call        dword ptr [esi+40]
 005AAAF2    pop         esi
 005AAAF3    pop         ebx
 005AAAF4    pop         ebp
 005AAAF5    ret         8
*}
end;

//005AAAF8
procedure TIdComponent.EndWork(AWorkMode:TWorkMode);
begin
{*
 005AAAF8    push        ebx
 005AAAF9    push        esi
 005AAAFA    push        edi
 005AAAFB    mov         ebx,edx
 005AAAFD    mov         esi,eax
 005AAAFF    mov         eax,dword ptr [esi+88]
 005AAB05    test        eax,eax
>005AAB07    je          005AAB12
 005AAB09    mov         edx,ebx
 005AAB0B    mov         ecx,dword ptr [eax]
 005AAB0D    call        dword ptr [ecx+40]
>005AAB10    jmp         005AAB34
 005AAB12    movzx       eax,bl
 005AAB15    lea         edi,[eax+eax*2]
 005AAB18    cmp         dword ptr [esi+edi*8+68],1
>005AAB1D    jne         005AAB30
 005AAB1F    cmp         word ptr [esi+52],0
>005AAB24    je          005AAB30
 005AAB26    mov         ecx,ebx
 005AAB28    mov         edx,esi
 005AAB2A    mov         eax,dword ptr [esi+54]
 005AAB2D    call        dword ptr [esi+50]
 005AAB30    dec         dword ptr [esi+edi*8+68]
 005AAB34    pop         edi
 005AAB35    pop         esi
 005AAB36    pop         ebx
 005AAB37    ret
*}
end;

//005AAB38
procedure TIdComponent.InitComponent;
begin
{*
 005AAB38    call        TIdInitializerComponent.InitComponent
 005AAB3D    mov         eax,[005A7FAC];TIdStack
 005AAB42    call        TIdStack.IncUsage
 005AAB47    ret
*}
end;

Initialization
//00781654
{*
 00781654    sub         dword ptr ds:[8155C8],1
>0078165B    jae         00781667
 0078165D    mov         eax,5AAB90
 00781662    call        @InitResStringImports
 00781667    ret
*}
Finalization
//005AAB48
{*
 005AAB48    push        ebp
 005AAB49    mov         ebp,esp
 005AAB4B    xor         eax,eax
 005AAB4D    push        ebp
 005AAB4E    push        5AAB84
 005AAB53    push        dword ptr fs:[eax]
 005AAB56    mov         dword ptr fs:[eax],esp
 005AAB59    inc         dword ptr ds:[8155C8]
>005AAB5F    jne         005AAB76
 005AAB61    mov         eax,789EE4
 005AAB66    mov         ecx,9
 005AAB6B    mov         edx,dword ptr ds:[40128C];string
 005AAB71    call        @FinalizeArray
 005AAB76    xor         eax,eax
 005AAB78    pop         edx
 005AAB79    pop         ecx
 005AAB7A    pop         ecx
 005AAB7B    mov         dword ptr fs:[eax],edx
 005AAB7E    push        5AAB8B
 005AAB83    ret
>005AAB84    jmp         @HandleFinally
>005AAB89    jmp         005AAB83
 005AAB8B    pop         ebp
 005AAB8C    ret
*}
end.