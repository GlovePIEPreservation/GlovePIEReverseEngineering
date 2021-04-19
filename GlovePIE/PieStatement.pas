//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieStatement;

interface

uses
  SysUtils, Classes, Contnrs, UxTheme, CommCtrl, PieFunction, PieExpression, PieStatement;

type
  EWait = class(EAbort)
  published
    //constructor Create(t:Double; ?:?);//0067C3D8
  public
    time:Double;//f18
    f1C:dword;//f1C
  end;
  TStatement = class(TObject)
  published
    procedure SetIffy(IsIffy:Boolean);//0067C764
    //procedure ToString(?:?);//0067C768
    procedure Execute(Background:Boolean);//00679B18
  public
    Iffy:Boolean;//f4
    StartLine:Integer;//f8
    EndLine:Integer;//fC
    //procedure ToString(?:?); virtual;//0067C768
    procedure Execute; virtual; abstract;//v0//00404A58
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067C764
  end;
  TNullStatement = class(TStatement)
  published
    //procedure ToString(?:?);//0067D1F0
    function Execute(Background:Boolean):Boolean;//0067D1EC
  public
    //procedure ToString(?:?); virtual;//0067D1F0
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067D1EC
  end;
  TComment = class(TStatement)
  published
    //procedure ToString(?:?);//0067C860
    function Execute(Background:Boolean):Boolean;//0067C85C
  public
    //procedure ToString(?:?); virtual;//0067C860
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067C85C
  end;
  TElseStatement = class(TStatement)
  published
    //procedure ToString(?:?);//0067C930
    function Execute(Background:Boolean):Boolean;//0067C92C
  public
    //procedure ToString(?:?); virtual;//0067C930
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067C92C
  end;
  TCall = class(TStatement)
  published
    //procedure ToString(?:?);//0067C48C
    function Execute(Background:Boolean):Boolean;//0067C488
    constructor Create;//0067C40C
    destructor Destroy();//0067C458
  public
    FunctionName:string;//f10
    Parameters:TObjectList;//f14
    DotDotDot:Boolean;//f18
    //procedure ToString(?:?); virtual;//0067C48C
    destructor Destroy(); virtual;//0067C458
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067C488
  end;
  TProcedureStatement = class(TCall)
  published
    function Execute(Background:Boolean):Boolean;//0067D2E8
    procedure SetIffy(IsIffy:Boolean);//0067D300
    //procedure ToString(?:?);//0067D320
    constructor Create;//0067D298
    destructor Destroy();//0067D2B8
  public
    ..............Proc:TProcedureExpression;//f1C
    //procedure ToString(?:?); virtual;//0067D320
    destructor Destroy(); virtual;//0067D2B8
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067D2E8
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067D300
  end;
  TAssignment = class(TStatement)
  published
    procedure SetIffy(IsIffy:Boolean);//0067B93C
    destructor Destroy();//0067B3AC
    function Execute(Background:Boolean):Boolean;//0067B92C
    //procedure ToString(?:?);//0067B964
  public
    LValue:TExpression;//f10
    RValue:TExpression;//f14
    Implies:Boolean;//f18
    //procedure ToString(?:?); virtual;//0067B964
    destructor Destroy(); virtual;//0067B3AC
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067B92C
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067B93C
  end;
  TCodeBlock = class(TStatement)
  published
    destructor Destroy();//0067BA90
    //procedure ToString(?:?);//0067BDCC
    procedure SetIffy(IsIffy:Boolean);//0067BCA0
    function Execute(Background:Boolean):Boolean;//0067BAC0
    function ExecuteAfterStatement(StatementNumber:Integer; Background:Boolean):Boolean;//0067BBBC
    constructor Create;//0067BA4C
  public
    L:TObjectList;//f10
    Blocked:Boolean;//f14
    ForLoop:TForLoop;//f18
    //procedure ToString(?:?); virtual;//0067BDCC
    destructor Destroy(); virtual;//0067BA90
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067BAC0
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067BCA0
    function ExecuteAfterStatement(StatementNumber:Integer; Background:Boolean):Boolean; virtual;//v8//0067BBBC
  end;
  TIfStatement = class(TStatement)
  published
    destructor Destroy();//0067BFF4
    //procedure ToString(?:?);//0067C0BC
    function Execute(Background:Boolean):Boolean;//0067C02C
    procedure SetIffy(IsIffy:Boolean);//0067C068
  public
    Condition:TExpression;//f10
    IfCode:TStatement;//f14
    ElseCode:TStatement;//f18
    //procedure ToString(?:?); virtual;//0067C0BC
    destructor Destroy(); virtual;//0067BFF4
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067C02C
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067C068
  end;
  TForLoop = class(TStatement)
  published
    destructor Destroy();//0067CF38
    //procedure ToString(?:?);//0067D0B0
    procedure Execute(Background:Boolean);//0067CF80
    procedure SetIffy(IsIffy:Boolean);//0067D074
  public
    Initial:TStatement;//f10
    Condition:TExpression;//f14
    Increment:TStatement;//f18
    LoopCode:TStatement;//f1C
    //procedure ToString(?:?); virtual;//0067D0B0
    destructor Destroy(); virtual;//0067CF38
    procedure Execute(Background:Boolean); virtual;//v0//0067CF80
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067D074
  end;
  TWaitItem = class(TObject)
  published
    procedure Execute;//0067CC98
    function Evaluate:Boolean;//0067CC84
    constructor Create(block:TCodeBlock; Statement:Integer; delay:Double);//0067C9F8
  public
    TimeToTrigger:TDateTime;//f8
    CodeBlock:TCodeBlock;//f10
    StatementNumber:Integer;//f14
    ForLoop:TForLoop;//f18
    function Evaluate:Boolean; virtual;//v0//0067CC84
    procedure Execute; virtual;//v4//0067CC98
  end;
  TEmptyStatement = class(TStatement)
  published
    function Execute(Background:Boolean):Boolean;//0067C264
  public
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067C264
  end;
  TWaitStatement = class(TCall)
  published
    destructor Destroy();//0067C268
    //procedure ToString(?:?);//0067C2E8
    procedure Execute(Background:Boolean);//0067C298
    procedure SetIffy(IsIffy:Boolean);//0067C2CC
  public
    ..........time:TExpression;//f1C
    //procedure ToString(?:?); virtual;//0067C2E8
    destructor Destroy(); virtual;//0067C268
    procedure Execute(Background:Boolean); virtual;//v0//0067C298
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067C2CC
  end;
  TPressStatement = class(TCall)
  published
    destructor Destroy();//0067CD94
    //procedure ToString(?:?);//0067CDF8
    procedure Execute(Background:Boolean);//0067CDC4
    procedure SetIffy(IsIffy:Boolean);//0067CDDC
  public
    expression:TExpression;//f1C
    Release:Boolean;//f20
    //procedure ToString(?:?); virtual;//0067CDF8
    destructor Destroy(); virtual;//0067CD94
    procedure Execute(Background:Boolean); virtual;//v0//0067CDC4
    procedure SetIffy(IsIffy:Boolean); virtual;//v4//0067CDDC
  end;
  THaltStatement = class(TCall)
  published
    //procedure ToString(?:?);//0067C698
    function Execute(Background:Boolean):Boolean;//0067C690
  public
    //procedure ToString(?:?); virtual;//0067C698
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067C690
  end;
  TDisplayStatement = class(TCall)
  published
    destructor Destroy();//0067C550
    function Execute(Background:Boolean):Boolean;//0067C580
  public
    ....text:TExpression;//f1C
    destructor Destroy(); virtual;//0067C550
    function Execute(Background:Boolean):Boolean; virtual;//v0//0067C580
  end;
    //procedure sub_0067B290(?:UnicodeString; ?:?);//0067B290
    //procedure sub_0067B38C(?:?);//0067B38C
    procedure sub_0067B3E4(?:Pointer; ?:TExpression);//0067B3E4
    procedure sub_0067CA54;//0067CA54
    procedure sub_0067CA60;//0067CA60
    procedure sub_0067CAF8;//0067CAF8
    //function sub_0067CB04:?;//0067CB04

implementation

//00679B18
procedure TStatement.Execute(Background:Boolean);
begin
{*
>00679B18    jmp         @AbstractError
*}
end;

//0067B290
{*procedure sub_0067B290(?:UnicodeString; ?:?);
begin
 0067B290    push        ebp
 0067B291    mov         ebp,esp
 0067B293    add         esp,0FFFFFFF8
 0067B296    push        ebx
 0067B297    push        esi
 0067B298    xor         ecx,ecx
 0067B29A    mov         dword ptr [ebp-8],ecx
 0067B29D    mov         esi,edx
 0067B29F    mov         dword ptr [ebp-4],eax
 0067B2A2    mov         eax,dword ptr [ebp-4]
 0067B2A5    call        @UStrAddRef
 0067B2AA    xor         eax,eax
 0067B2AC    push        ebp
 0067B2AD    push        67B355
 0067B2B2    push        dword ptr fs:[eax]
 0067B2B5    mov         dword ptr fs:[eax],esp
 0067B2B8    mov         eax,esi
 0067B2BA    call        @UStrClr
 0067B2BF    mov         edx,dword ptr [ebp-4]
 0067B2C2    mov         eax,67B370;'
'
 0067B2C7    call        Pos
 0067B2CC    mov         ebx,eax
 0067B2CE    test        ebx,ebx
>0067B2D0    jle         0067B324
 0067B2D2    push        dword ptr [esi]
 0067B2D4    push        67B384;'  '
 0067B2D9    lea         eax,[ebp-8]
 0067B2DC    push        eax
 0067B2DD    mov         ecx,ebx
 0067B2DF    dec         ecx
 0067B2E0    mov         edx,1
 0067B2E5    mov         eax,dword ptr [ebp-4]
 0067B2E8    call        @UStrCopy
 0067B2ED    push        dword ptr [ebp-8]
 0067B2F0    push        67B370;'
'
 0067B2F5    mov         eax,esi
 0067B2F7    mov         edx,4
 0067B2FC    call        @UStrCatN
 0067B301    lea         ecx,[ebx+1]
 0067B304    lea         eax,[ebp-4]
 0067B307    mov         edx,1
 0067B30C    call        @UStrDelete
 0067B311    mov         edx,dword ptr [ebp-4]
 0067B314    mov         eax,67B370;'
'
 0067B319    call        Pos
 0067B31E    mov         ebx,eax
 0067B320    test        ebx,ebx
>0067B322    jg          0067B2D2
 0067B324    push        dword ptr [esi]
 0067B326    push        67B384;'  '
 0067B32B    push        dword ptr [ebp-4]
 0067B32E    mov         eax,esi
 0067B330    mov         edx,3
 0067B335    call        @UStrCatN
 0067B33A    xor         eax,eax
 0067B33C    pop         edx
 0067B33D    pop         ecx
 0067B33E    pop         ecx
 0067B33F    mov         dword ptr fs:[eax],edx
 0067B342    push        67B35C
 0067B347    lea         eax,[ebp-8]
 0067B34A    mov         edx,2
 0067B34F    call        @UStrArrayClr
 0067B354    ret
>0067B355    jmp         @HandleFinally
>0067B35A    jmp         0067B347
 0067B35C    pop         esi
 0067B35D    pop         ebx
 0067B35E    pop         ecx
 0067B35F    pop         ecx
 0067B360    pop         ebp
 0067B361    ret
end;*}

//0067B38C
{*procedure sub_0067B38C(?:?);
begin
 0067B38C    mov         edx,dword ptr [eax]
 0067B38E    cmp         edx,dword ptr ds:[81ECE4];gvar_0081ECE4:TComment
>0067B394    je          0067B3A9
 0067B396    cmp         edx,dword ptr ds:[81ECE8];gvar_0081ECE8:TElseStatement
>0067B39C    je          0067B3A9
 0067B39E    xor         ecx,ecx
 0067B3A0    mov         dword ptr [eax],ecx
 0067B3A2    mov         eax,edx
 0067B3A4    call        TObject.Free
 0067B3A9    ret
end;*}

//0067B3AC
destructor TAssignment.Destroy();
begin
{*
 0067B3AC    push        ebx
 0067B3AD    push        esi
 0067B3AE    call        @BeforeDestruction
 0067B3B3    mov         ebx,edx
 0067B3B5    mov         esi,eax
 0067B3B7    lea         eax,[esi+10];TAssignment.LValue:TExpression
 0067B3BA    call        0067B38C
 0067B3BF    lea         eax,[esi+14];TAssignment.RValue:TExpression
 0067B3C2    call        0067B38C
 0067B3C7    mov         edx,ebx
 0067B3C9    and         dl,0FC
 0067B3CC    mov         eax,esi
 0067B3CE    call        TObject.Destroy
 0067B3D3    test        bl,bl
>0067B3D5    jle         0067B3DE
 0067B3D7    mov         eax,esi
 0067B3D9    call        @ClassDestroy
 0067B3DE    pop         esi
 0067B3DF    pop         ebx
 0067B3E0    ret
*}
end;

//0067B3E4
procedure sub_0067B3E4(?:Pointer; ?:TExpression);
begin
{*
 0067B3E4    push        ebp
 0067B3E5    mov         ebp,esp
 0067B3E7    add         esp,0FFFFFF90
 0067B3EA    push        ebx
 0067B3EB    push        esi
 0067B3EC    push        edi
 0067B3ED    xor         ecx,ecx
 0067B3EF    mov         dword ptr [ebp-70],ecx
 0067B3F2    mov         dword ptr [ebp-6C],ecx
 0067B3F5    mov         edi,edx
 0067B3F7    mov         esi,eax
 0067B3F9    xor         eax,eax
 0067B3FB    push        ebp
 0067B3FC    push        67B91C
 0067B401    push        dword ptr fs:[eax]
 0067B404    mov         dword ptr fs:[eax],esp
 0067B407    mov         eax,esi
 0067B409    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0067B40F    call        @IsClass
 0067B414    test        al,al
>0067B416    jne         0067B429
 0067B418    mov         eax,esi
 0067B41A    mov         edx,dword ptr ds:[615530];TOscValue
 0067B420    call        @IsClass
 0067B425    test        al,al
>0067B427    je          0067B42F
 0067B429    mov         byte ptr [ebp-1],0
>0067B42D    jmp         0067B439
 0067B42F    mov         eax,esi
 0067B431    mov         edx,dword ptr [eax]
 0067B433    call        dword ptr [edx+44]
 0067B436    mov         byte ptr [ebp-1],al
 0067B439    cmp         byte ptr [ebp-1],4
>0067B43D    jne         0067B458
 0067B43F    lea         edx,[ebp-6C]
 0067B442    mov         eax,edi
 0067B444    mov         ecx,dword ptr [eax]
 0067B446    call        dword ptr [ecx+0C]
 0067B449    mov         edx,dword ptr [ebp-6C]
 0067B44C    mov         eax,esi
 0067B44E    mov         ecx,dword ptr [eax]
 0067B450    call        dword ptr [ecx+5C]
>0067B453    jmp         0067B901
 0067B458    cmp         byte ptr [ebp-1],3
>0067B45C    jne         0067B47D
 0067B45E    mov         eax,edi
 0067B460    mov         edx,dword ptr [eax]
 0067B462    call        dword ptr [edx+4]
 0067B465    call        00686074
 0067B46A    add         esp,0FFFFFFF8
 0067B46D    fstp        qword ptr [esp]
 0067B470    wait
 0067B471    mov         eax,esi
 0067B473    mov         edx,dword ptr [eax]
 0067B475    call        dword ptr [edx+58]
>0067B478    jmp         0067B901
 0067B47D    cmp         byte ptr [ebp-1],5
>0067B481    jne         0067B51A
 0067B487    mov         eax,esi
 0067B489    mov         edx,dword ptr ds:[681F10];TVectorExpression
 0067B48F    call        @IsClass
 0067B494    test        al,al
>0067B496    je          0067B4E8
 0067B498    lea         eax,[ebp-20]
 0067B49B    push        eax
 0067B49C    lea         ecx,[ebp-18]
 0067B49F    lea         edx,[ebp-10]
 0067B4A2    mov         eax,edi
 0067B4A4    mov         ebx,dword ptr [eax]
 0067B4A6    call        dword ptr [ebx+20]
 0067B4A9    push        dword ptr [ebp-0C]
 0067B4AC    push        dword ptr [ebp-10]
 0067B4AF    push        dword ptr [ebp-14]
 0067B4B2    push        dword ptr [ebp-18]
 0067B4B5    push        dword ptr [ebp-1C]
 0067B4B8    push        dword ptr [ebp-20]
 0067B4BB    mov         eax,esi
 0067B4BD    mov         edx,dword ptr [eax]
 0067B4BF    call        dword ptr [edx+60]
 0067B4C2    mov         eax,edi
 0067B4C4    mov         edx,dword ptr [eax]
 0067B4C6    call        dword ptr [edx+50]
 0067B4C9    push        eax
 0067B4CA    mov         eax,edi
 0067B4CC    mov         edx,dword ptr [eax]
 0067B4CE    call        dword ptr [edx+4C]
 0067B4D1    push        eax
 0067B4D2    mov         eax,edi
 0067B4D4    mov         edx,dword ptr [eax]
 0067B4D6    call        dword ptr [edx+48]
 0067B4D9    mov         edx,eax
 0067B4DB    mov         eax,esi
 0067B4DD    pop         ecx
 0067B4DE    call        TVectorExpression.SetUnits
>0067B4E3    jmp         0067B901
 0067B4E8    lea         eax,[ebp-18]
 0067B4EB    push        eax
 0067B4EC    lea         eax,[ebp-20]
 0067B4EF    push        eax
 0067B4F0    lea         ecx,[ebp-10]
 0067B4F3    mov         edx,esi
 0067B4F5    mov         eax,edi
 0067B4F7    mov         ebx,dword ptr [eax]
 0067B4F9    call        dword ptr [ebx+24]
 0067B4FC    push        dword ptr [ebp-0C]
 0067B4FF    push        dword ptr [ebp-10]
 0067B502    push        dword ptr [ebp-14]
 0067B505    push        dword ptr [ebp-18]
 0067B508    push        dword ptr [ebp-1C]
 0067B50B    push        dword ptr [ebp-20]
 0067B50E    mov         eax,esi
 0067B510    mov         edx,dword ptr [eax]
 0067B512    call        dword ptr [edx+60]
>0067B515    jmp         0067B901
 0067B51A    cmp         byte ptr [ebp-1],7
>0067B51E    jne         0067B59C
 0067B520    mov         eax,esi
 0067B522    mov         edx,dword ptr ds:[681F10];TVectorExpression
 0067B528    call        @IsClass
 0067B52D    test        al,al
>0067B52F    je          0067B56D
 0067B531    lea         eax,[ebp-20]
 0067B534    push        eax
 0067B535    lea         ecx,[ebp-18]
 0067B538    lea         edx,[ebp-10]
 0067B53B    mov         eax,edi
 0067B53D    mov         ebx,dword ptr [eax]
 0067B53F    call        dword ptr [ebx+1C]
 0067B542    push        dword ptr [ebp-0C]
 0067B545    push        dword ptr [ebp-10]
 0067B548    push        dword ptr [ebp-14]
 0067B54B    push        dword ptr [ebp-18]
 0067B54E    push        dword ptr [ebp-1C]
 0067B551    push        dword ptr [ebp-20]
 0067B554    mov         eax,esi
 0067B556    mov         edx,dword ptr [eax]
 0067B558    call        dword ptr [edx+60]
 0067B55B    push        0
 0067B55D    xor         ecx,ecx
 0067B55F    xor         edx,edx
 0067B561    mov         eax,esi
 0067B563    call        TVectorExpression.SetUnits
>0067B568    jmp         0067B901
 0067B56D    lea         eax,[ebp-20]
 0067B570    push        eax
 0067B571    lea         ecx,[ebp-18]
 0067B574    lea         edx,[ebp-10]
 0067B577    mov         eax,edi
 0067B579    mov         ebx,dword ptr [eax]
 0067B57B    call        dword ptr [ebx+1C]
 0067B57E    push        dword ptr [ebp-0C]
 0067B581    push        dword ptr [ebp-10]
 0067B584    push        dword ptr [ebp-14]
 0067B587    push        dword ptr [ebp-18]
 0067B58A    push        dword ptr [ebp-1C]
 0067B58D    push        dword ptr [ebp-20]
 0067B590    mov         eax,esi
 0067B592    mov         edx,dword ptr [eax]
 0067B594    call        dword ptr [edx+60]
>0067B597    jmp         0067B901
 0067B59C    cmp         byte ptr [ebp-1],6
>0067B5A0    jne         0067B5F1
 0067B5A2    lea         edx,[ebp-68]
 0067B5A5    mov         eax,edi
 0067B5A7    mov         ecx,dword ptr [eax]
 0067B5A9    call        dword ptr [ecx+40]
 0067B5AC    lea         edx,[ebp-68]
 0067B5AF    mov         eax,esi
 0067B5B1    mov         ecx,dword ptr [eax]
 0067B5B3    call        dword ptr [ecx+64]
 0067B5B6    mov         eax,esi
 0067B5B8    mov         edx,dword ptr ds:[682414];TMatrixExpression
 0067B5BE    call        @IsClass
 0067B5C3    test        al,al
>0067B5C5    je          0067B901
 0067B5CB    mov         eax,edi
 0067B5CD    mov         edx,dword ptr [eax]
 0067B5CF    call        dword ptr [edx+50]
 0067B5D2    push        eax
 0067B5D3    mov         eax,edi
 0067B5D5    mov         edx,dword ptr [eax]
 0067B5D7    call        dword ptr [edx+4C]
 0067B5DA    push        eax
 0067B5DB    mov         eax,edi
 0067B5DD    mov         edx,dword ptr [eax]
 0067B5DF    call        dword ptr [edx+48]
 0067B5E2    mov         edx,eax
 0067B5E4    mov         eax,esi
 0067B5E6    pop         ecx
 0067B5E7    call        TMatrixExpression.SetUnits
>0067B5EC    jmp         0067B901
 0067B5F1    mov         eax,edi
 0067B5F3    mov         edx,dword ptr [eax]
 0067B5F5    call        dword ptr [edx+44]
 0067B5F8    mov         byte ptr [ebp-1],al
 0067B5FB    cmp         byte ptr [ebp-1],4
>0067B5FF    jne         0067B61A
 0067B601    lea         edx,[ebp-70]
 0067B604    mov         eax,edi
 0067B606    mov         ecx,dword ptr [eax]
 0067B608    call        dword ptr [ecx+0C]
 0067B60B    mov         edx,dword ptr [ebp-70]
 0067B60E    mov         eax,esi
 0067B610    mov         ecx,dword ptr [eax]
 0067B612    call        dword ptr [ecx+5C]
>0067B615    jmp         0067B901
 0067B61A    cmp         byte ptr [ebp-1],3
>0067B61E    jne         0067B688
 0067B620    mov         eax,esi
 0067B622    mov         edx,dword ptr ds:[615530];TOscValue
 0067B628    call        @IsClass
 0067B62D    test        al,al
>0067B62F    je          0067B649
 0067B631    mov         eax,edi
 0067B633    mov         edx,dword ptr [eax]
 0067B635    call        dword ptr [edx+4]
 0067B638    mov         edx,eax
 0067B63A    mov         eax,esi
 0067B63C    mov         ecx,dword ptr [eax]
 0067B63E    call        dword ptr [ecx+0A0]
>0067B644    jmp         0067B901
 0067B649    mov         eax,edi
 0067B64B    mov         edx,dword ptr [eax]
 0067B64D    call        dword ptr [edx+4]
 0067B650    call        00686074
 0067B655    add         esp,0FFFFFFF8
 0067B658    fstp        qword ptr [esp]
 0067B65B    wait
 0067B65C    mov         eax,esi
 0067B65E    mov         edx,dword ptr [eax]
 0067B660    call        dword ptr [edx+58]
 0067B663    mov         eax,esi
 0067B665    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0067B66B    call        @IsClass
 0067B670    test        al,al
>0067B672    je          0067B901
 0067B678    movzx       edx,byte ptr [ebp-1]
 0067B67C    mov         eax,esi
 0067B67E    call        TVariableExpression.SetDataType
>0067B683    jmp         0067B901
 0067B688    cmp         byte ptr [ebp-1],5
>0067B68C    jne         0067B736
 0067B692    lea         eax,[ebp-20]
 0067B695    push        eax
 0067B696    lea         ecx,[ebp-18]
 0067B699    lea         edx,[ebp-10]
 0067B69C    mov         eax,edi
 0067B69E    mov         ebx,dword ptr [eax]
 0067B6A0    call        dword ptr [ebx+20]
 0067B6A3    push        dword ptr [ebp-0C]
 0067B6A6    push        dword ptr [ebp-10]
 0067B6A9    push        dword ptr [ebp-14]
 0067B6AC    push        dword ptr [ebp-18]
 0067B6AF    push        dword ptr [ebp-1C]
 0067B6B2    push        dword ptr [ebp-20]
 0067B6B5    mov         eax,esi
 0067B6B7    mov         edx,dword ptr [eax]
 0067B6B9    call        dword ptr [edx+60]
 0067B6BC    mov         eax,esi
 0067B6BE    mov         edx,dword ptr ds:[681F10];TVectorExpression
 0067B6C4    call        @IsClass
 0067B6C9    test        al,al
>0067B6CB    je          0067B6EE
 0067B6CD    mov         eax,edi
 0067B6CF    mov         edx,dword ptr [eax]
 0067B6D1    call        dword ptr [edx+50]
 0067B6D4    push        eax
 0067B6D5    mov         eax,edi
 0067B6D7    mov         edx,dword ptr [eax]
 0067B6D9    call        dword ptr [edx+4C]
 0067B6DC    push        eax
 0067B6DD    mov         eax,edi
 0067B6DF    mov         edx,dword ptr [eax]
 0067B6E1    call        dword ptr [edx+48]
 0067B6E4    mov         edx,eax
 0067B6E6    mov         eax,esi
 0067B6E8    pop         ecx
 0067B6E9    call        TVectorExpression.SetUnits
 0067B6EE    mov         eax,esi
 0067B6F0    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0067B6F6    call        @IsClass
 0067B6FB    test        al,al
>0067B6FD    je          0067B901
 0067B703    movzx       edx,byte ptr [ebp-1]
 0067B707    mov         ebx,esi
 0067B709    mov         eax,ebx
 0067B70B    call        TVariableExpression.SetDataType
 0067B710    mov         eax,edi
 0067B712    mov         edx,dword ptr [eax]
 0067B714    call        dword ptr [edx+50]
 0067B717    push        eax
 0067B718    mov         eax,edi
 0067B71A    mov         edx,dword ptr [eax]
 0067B71C    call        dword ptr [edx+4C]
 0067B71F    push        eax
 0067B720    mov         eax,edi
 0067B722    mov         edx,dword ptr [eax]
 0067B724    call        dword ptr [edx+48]
 0067B727    mov         edx,eax
 0067B729    mov         eax,ebx
 0067B72B    pop         ecx
 0067B72C    call        TVariableExpression.SetUnits
>0067B731    jmp         0067B901
 0067B736    cmp         byte ptr [ebp-1],7
>0067B73A    jne         0067B7B8
 0067B73C    lea         eax,[ebp-20]
 0067B73F    push        eax
 0067B740    lea         ecx,[ebp-18]
 0067B743    lea         edx,[ebp-10]
 0067B746    mov         eax,edi
 0067B748    mov         ebx,dword ptr [eax]
 0067B74A    call        dword ptr [ebx+1C]
 0067B74D    push        dword ptr [ebp-0C]
 0067B750    push        dword ptr [ebp-10]
 0067B753    push        dword ptr [ebp-14]
 0067B756    push        dword ptr [ebp-18]
 0067B759    push        dword ptr [ebp-1C]
 0067B75C    push        dword ptr [ebp-20]
 0067B75F    mov         eax,esi
 0067B761    mov         edx,dword ptr [eax]
 0067B763    call        dword ptr [edx+60]
 0067B766    mov         eax,esi
 0067B768    mov         edx,dword ptr ds:[681F10];TVectorExpression
 0067B76E    call        @IsClass
 0067B773    test        al,al
>0067B775    je          0067B784
 0067B777    push        0
 0067B779    xor         ecx,ecx
 0067B77B    xor         edx,edx
 0067B77D    mov         eax,esi
 0067B77F    call        TVectorExpression.SetUnits
 0067B784    mov         eax,esi
 0067B786    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0067B78C    call        @IsClass
 0067B791    test        al,al
>0067B793    je          0067B901
 0067B799    movzx       edx,byte ptr [ebp-1]
 0067B79D    mov         ebx,esi
 0067B79F    mov         eax,ebx
 0067B7A1    call        TVariableExpression.SetDataType
 0067B7A6    push        0
 0067B7A8    xor         ecx,ecx
 0067B7AA    xor         edx,edx
 0067B7AC    mov         eax,ebx
 0067B7AE    call        TVariableExpression.SetUnits
>0067B7B3    jmp         0067B901
 0067B7B8    cmp         byte ptr [ebp-1],6
>0067B7BC    jne         0067B850
 0067B7C2    lea         edx,[ebp-68]
 0067B7C5    mov         eax,edi
 0067B7C7    mov         ecx,dword ptr [eax]
 0067B7C9    call        dword ptr [ecx+40]
 0067B7CC    lea         edx,[ebp-68]
 0067B7CF    mov         eax,esi
 0067B7D1    mov         ecx,dword ptr [eax]
 0067B7D3    call        dword ptr [ecx+64]
 0067B7D6    mov         eax,esi
 0067B7D8    mov         edx,dword ptr ds:[682414];TMatrixExpression
 0067B7DE    call        @IsClass
 0067B7E3    test        al,al
>0067B7E5    je          0067B808
 0067B7E7    mov         eax,edi
 0067B7E9    mov         edx,dword ptr [eax]
 0067B7EB    call        dword ptr [edx+50]
 0067B7EE    push        eax
 0067B7EF    mov         eax,edi
 0067B7F1    mov         edx,dword ptr [eax]
 0067B7F3    call        dword ptr [edx+4C]
 0067B7F6    push        eax
 0067B7F7    mov         eax,edi
 0067B7F9    mov         edx,dword ptr [eax]
 0067B7FB    call        dword ptr [edx+48]
 0067B7FE    mov         edx,eax
 0067B800    mov         eax,esi
 0067B802    pop         ecx
 0067B803    call        TMatrixExpression.SetUnits
 0067B808    mov         eax,esi
 0067B80A    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0067B810    call        @IsClass
 0067B815    test        al,al
>0067B817    je          0067B901
 0067B81D    movzx       edx,byte ptr [ebp-1]
 0067B821    mov         ebx,esi
 0067B823    mov         eax,ebx
 0067B825    call        TVariableExpression.SetDataType
 0067B82A    mov         eax,edi
 0067B82C    mov         edx,dword ptr [eax]
 0067B82E    call        dword ptr [edx+50]
 0067B831    push        eax
 0067B832    mov         eax,edi
 0067B834    mov         edx,dword ptr [eax]
 0067B836    call        dword ptr [edx+4C]
 0067B839    push        eax
 0067B83A    mov         eax,edi
 0067B83C    mov         edx,dword ptr [eax]
 0067B83E    call        dword ptr [edx+48]
 0067B841    mov         edx,eax
 0067B843    mov         eax,ebx
 0067B845    pop         ecx
 0067B846    call        TVariableExpression.SetUnits
>0067B84B    jmp         0067B901
 0067B850    mov         eax,esi
 0067B852    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0067B858    call        @IsClass
 0067B85D    test        al,al
>0067B85F    je          0067B8A5
 0067B861    mov         eax,edi
 0067B863    mov         edx,dword ptr [eax]
 0067B865    call        dword ptr [edx]
 0067B867    add         esp,0FFFFFFF8
 0067B86A    fstp        qword ptr [esp]
 0067B86D    wait
 0067B86E    mov         eax,esi
 0067B870    mov         edx,dword ptr [eax]
 0067B872    call        dword ptr [edx+58]
 0067B875    movzx       edx,byte ptr [ebp-1]
 0067B879    mov         ebx,esi
 0067B87B    mov         eax,ebx
 0067B87D    call        TVariableExpression.SetDataType
 0067B882    mov         eax,edi
 0067B884    mov         edx,dword ptr [eax]
 0067B886    call        dword ptr [edx+50]
 0067B889    push        eax
 0067B88A    mov         eax,edi
 0067B88C    mov         edx,dword ptr [eax]
 0067B88E    call        dword ptr [edx+4C]
 0067B891    push        eax
 0067B892    mov         eax,edi
 0067B894    mov         edx,dword ptr [eax]
 0067B896    call        dword ptr [edx+48]
 0067B899    mov         edx,eax
 0067B89B    mov         eax,ebx
 0067B89D    pop         ecx
 0067B89E    call        TVariableExpression.SetUnits
>0067B8A3    jmp         0067B901
 0067B8A5    mov         eax,esi
 0067B8A7    mov         edx,dword ptr ds:[615530];TOscValue
 0067B8AD    call        @IsClass
 0067B8B2    test        al,al
>0067B8B4    je          0067B8EA
 0067B8B6    cmp         byte ptr [ebp-1],2
>0067B8BA    jne         0067B8D1
 0067B8BC    mov         eax,edi
 0067B8BE    mov         edx,dword ptr [eax]
 0067B8C0    call        dword ptr [edx+8]
 0067B8C3    mov         edx,eax
 0067B8C5    mov         eax,esi
 0067B8C7    mov         ecx,dword ptr [eax]
 0067B8C9    call        dword ptr [ecx+0A4]
>0067B8CF    jmp         0067B901
 0067B8D1    mov         edx,esi
 0067B8D3    mov         eax,edi
 0067B8D5    mov         ecx,dword ptr [eax]
 0067B8D7    call        dword ptr [ecx+14]
 0067B8DA    add         esp,0FFFFFFF8
 0067B8DD    fstp        qword ptr [esp]
 0067B8E0    wait
 0067B8E1    mov         eax,esi
 0067B8E3    mov         edx,dword ptr [eax]
 0067B8E5    call        dword ptr [edx+58]
>0067B8E8    jmp         0067B901
 0067B8EA    mov         edx,esi
 0067B8EC    mov         eax,edi
 0067B8EE    mov         ecx,dword ptr [eax]
 0067B8F0    call        dword ptr [ecx+14]
 0067B8F3    add         esp,0FFFFFFF8
 0067B8F6    fstp        qword ptr [esp]
 0067B8F9    wait
 0067B8FA    mov         eax,esi
 0067B8FC    mov         edx,dword ptr [eax]
 0067B8FE    call        dword ptr [edx+58]
 0067B901    xor         eax,eax
 0067B903    pop         edx
 0067B904    pop         ecx
 0067B905    pop         ecx
 0067B906    mov         dword ptr fs:[eax],edx
 0067B909    push        67B923
 0067B90E    lea         eax,[ebp-70]
 0067B911    mov         edx,2
 0067B916    call        @UStrArrayClr
 0067B91B    ret
>0067B91C    jmp         @HandleFinally
>0067B921    jmp         0067B90E
 0067B923    pop         edi
 0067B924    pop         esi
 0067B925    pop         ebx
 0067B926    mov         esp,ebp
 0067B928    pop         ebp
 0067B929    ret
*}
end;

//0067B92C
function TAssignment.Execute(Background:Boolean):Boolean;
begin
{*
 0067B92C    mov         edx,dword ptr [eax+14];TAssignment.RValue:TExpression
 0067B92F    mov         eax,dword ptr [eax+10];TAssignment.LValue:TExpression
 0067B932    call        0067B3E4
 0067B937    mov         al,1
 0067B939    ret
*}
end;

//0067B93C
procedure TAssignment.SetIffy(IsIffy:Boolean);
begin
{*
 0067B93C    push        ebx
 0067B93D    push        esi
 0067B93E    mov         ebx,edx
 0067B940    mov         esi,eax
 0067B942    mov         edx,ebx
 0067B944    mov         eax,esi
 0067B946    call        TStatement.SetIffy
 0067B94B    mov         edx,ebx
 0067B94D    mov         eax,dword ptr [esi+10];TAssignment.LValue:TExpression
 0067B950    mov         ecx,dword ptr [eax]
 0067B952    call        dword ptr [ecx+74];TExpression.SetIffy
 0067B955    mov         edx,ebx
 0067B957    mov         eax,dword ptr [esi+14];TAssignment.RValue:TExpression
 0067B95A    mov         ecx,dword ptr [eax]
 0067B95C    call        dword ptr [ecx+74];TExpression.SetIffy
 0067B95F    pop         esi
 0067B960    pop         ebx
 0067B961    ret
*}
end;

//0067B964
{*procedure TAssignment.ToString(?:?);
begin
 0067B964    push        ebp
 0067B965    mov         ebp,esp
 0067B967    xor         ecx,ecx
 0067B969    push        ecx
 0067B96A    push        ecx
 0067B96B    push        ecx
 0067B96C    push        ecx
 0067B96D    push        ebx
 0067B96E    push        esi
 0067B96F    mov         esi,edx
 0067B971    mov         ebx,eax
 0067B973    xor         eax,eax
 0067B975    push        ebp
 0067B976    push        67BA07
 0067B97B    push        dword ptr fs:[eax]
 0067B97E    mov         dword ptr fs:[eax],esp
 0067B981    lea         edx,[ebp-4]
 0067B984    mov         eax,dword ptr [ebx+10];TAssignment.LValue:TExpression
 0067B987    mov         ecx,dword ptr [eax]
 0067B989    call        dword ptr [ecx-24];TExpression.ToString
 0067B98C    push        dword ptr [ebp-4]
 0067B98F    push        67BA20;' := '
 0067B994    lea         edx,[ebp-8]
 0067B997    mov         eax,dword ptr [ebx+14];TAssignment.RValue:TExpression
 0067B99A    mov         ecx,dword ptr [eax]
 0067B99C    call        dword ptr [ecx-24];TExpression.ToString
 0067B99F    push        dword ptr [ebp-8]
 0067B9A2    mov         eax,esi
 0067B9A4    mov         edx,3
 0067B9A9    call        @UStrCatN
 0067B9AE    push        67BA38;'{'
 0067B9B3    lea         edx,[ebp-0C]
 0067B9B6    mov         eax,dword ptr [ebx+8];TAssignment.StartLine:Integer
 0067B9B9    call        IntToStr
 0067B9BE    push        dword ptr [ebp-0C]
 0067B9C1    push        67BA48;'}'
 0067B9C6    push        dword ptr [esi]
 0067B9C8    push        67BA38;'{'
 0067B9CD    lea         edx,[ebp-10]
 0067B9D0    mov         eax,dword ptr [ebx+0C];TAssignment.EndLine:Integer
 0067B9D3    call        IntToStr
 0067B9D8    push        dword ptr [ebp-10]
 0067B9DB    push        67BA48;'}'
 0067B9E0    mov         eax,esi
 0067B9E2    mov         edx,7
 0067B9E7    call        @UStrCatN
 0067B9EC    xor         eax,eax
 0067B9EE    pop         edx
 0067B9EF    pop         ecx
 0067B9F0    pop         ecx
 0067B9F1    mov         dword ptr fs:[eax],edx
 0067B9F4    push        67BA0E
 0067B9F9    lea         eax,[ebp-10]
 0067B9FC    mov         edx,4
 0067BA01    call        @UStrArrayClr
 0067BA06    ret
>0067BA07    jmp         @HandleFinally
>0067BA0C    jmp         0067B9F9
 0067BA0E    pop         esi
 0067BA0F    pop         ebx
 0067BA10    mov         esp,ebp
 0067BA12    pop         ebp
 0067BA13    ret
end;*}

//0067BA4C
constructor TCodeBlock.Create;
begin
{*
 0067BA4C    push        ebx
 0067BA4D    push        esi
 0067BA4E    test        dl,dl
>0067BA50    je          0067BA5A
 0067BA52    add         esp,0FFFFFFF0
 0067BA55    call        @ClassCreate
 0067BA5A    mov         ebx,edx
 0067BA5C    mov         esi,eax
 0067BA5E    mov         byte ptr [esi+14],0;TCodeBlock.Blocked:Boolean
 0067BA62    mov         cl,1
 0067BA64    mov         dl,1
 0067BA66    mov         eax,[00471630];TObjectList
 0067BA6B    call        TObjectList.Create;TObjectList.Create
 0067BA70    mov         dword ptr [esi+10],eax;TCodeBlock.L:TObjectList
 0067BA73    mov         eax,esi
 0067BA75    test        bl,bl
>0067BA77    je          0067BA88
 0067BA79    call        @AfterConstruction
 0067BA7E    pop         dword ptr fs:[0]
 0067BA85    add         esp,0C
 0067BA88    mov         eax,esi
 0067BA8A    pop         esi
 0067BA8B    pop         ebx
 0067BA8C    ret
*}
end;

//0067BA90
destructor TCodeBlock.Destroy();
begin
{*
 0067BA90    push        ebx
 0067BA91    push        esi
 0067BA92    call        @BeforeDestruction
 0067BA97    mov         ebx,edx
 0067BA99    mov         esi,eax
 0067BA9B    lea         eax,[esi+10];TCodeBlock.L:TObjectList
 0067BA9E    call        0067B38C
 0067BAA3    mov         edx,ebx
 0067BAA5    and         dl,0FC
 0067BAA8    mov         eax,esi
 0067BAAA    call        TObject.Destroy
 0067BAAF    test        bl,bl
>0067BAB1    jle         0067BABA
 0067BAB3    mov         eax,esi
 0067BAB5    call        @ClassDestroy
 0067BABA    pop         esi
 0067BABB    pop         ebx
 0067BABC    ret
*}
end;

//0067BAC0
function TCodeBlock.Execute(Background:Boolean):Boolean;
begin
{*
 0067BAC0    push        ebp
 0067BAC1    mov         ebp,esp
 0067BAC3    add         esp,0FFFFFFF4
 0067BAC6    push        ebx
 0067BAC7    push        esi
 0067BAC8    push        edi
 0067BAC9    mov         byte ptr [ebp-5],dl
 0067BACC    mov         dword ptr [ebp-4],eax
 0067BACF    mov         byte ptr [ebp-6],1
 0067BAD3    mov         eax,dword ptr [ebp-4]
 0067BAD6    cmp         byte ptr [eax+14],0;TCodeBlock.Blocked:Boolean
>0067BADA    jne         0067BBAE
 0067BAE0    xor         eax,eax
 0067BAE2    mov         dword ptr [ebp-0C],eax
 0067BAE5    mov         bl,1
 0067BAE7    xor         ecx,ecx
 0067BAE9    push        ebp
 0067BAEA    push        67BB42
 0067BAEF    push        dword ptr fs:[ecx]
 0067BAF2    mov         dword ptr fs:[ecx],esp
>0067BAF5    jmp         0067BB2A
 0067BAF7    mov         eax,esi
 0067BAF9    mov         edx,dword ptr [ebp-0C]
 0067BAFC    call        TList.Get
 0067BB01    mov         edx,dword ptr ds:[67997C];TStatement
 0067BB07    call        @AsClass
 0067BB0C    mov         edi,eax
 0067BB0E    test        edi,edi
>0067BB10    je          0067BB1E
 0067BB12    movzx       edx,byte ptr [ebp-5]
 0067BB16    mov         eax,edi
 0067BB18    mov         ecx,dword ptr [eax]
 0067BB1A    call        dword ptr [ecx];TStatement.Execute
 0067BB1C    mov         ebx,eax
 0067BB1E    movzx       eax,byte ptr [ebp-6]
 0067BB22    and         al,bl
 0067BB24    mov         byte ptr [ebp-6],al
 0067BB27    inc         dword ptr [ebp-0C]
 0067BB2A    mov         eax,dword ptr [ebp-4]
 0067BB2D    mov         esi,dword ptr [eax+10];TCodeBlock.L:TObjectList
 0067BB30    mov         eax,dword ptr [esi+8];TObjectList.FCount:Integer
 0067BB33    cmp         eax,dword ptr [ebp-0C]
>0067BB36    jg          0067BAF7
 0067BB38    xor         eax,eax
 0067BB3A    pop         edx
 0067BB3B    pop         ecx
 0067BB3C    pop         ecx
 0067BB3D    mov         dword ptr fs:[eax],edx
>0067BB40    jmp         0067BBA7
>0067BB42    jmp         @HandleOnException
 0067BB47    dd          2
 0067BB4B    dd          00679898;EWait
 0067BB4F    dd          0067BB5B
 0067BB53    dd          00000000
 0067BB57    dd          0067BB97
 0067BB5B    mov         edx,dword ptr [ebp-4]
 0067BB5E    mov         byte ptr [edx+14],1;TCodeBlock.Blocked:Boolean
 0067BB62    push        dword ptr [eax+1C];EWait.?f1C:dword
 0067BB65    push        dword ptr [eax+18];EWait.time:Double
 0067BB68    mov         eax,dword ptr [ebp-0C]
 0067BB6B    push        eax
 0067BB6C    mov         ecx,dword ptr [ebp-4]
 0067BB6F    mov         dl,1
 0067BB71    mov         eax,[0067AA18];TWaitItem
 0067BB76    call        TWaitItem.Create;TWaitItem.Create
 0067BB7B    mov         edx,dword ptr [ebp-4]
 0067BB7E    mov         edx,dword ptr [edx+18];TCodeBlock.ForLoop:TForLoop
 0067BB81    mov         dword ptr [eax+18],edx;TWaitItem.ForLoop:TForLoop
 0067BB84    mov         edx,dword ptr ds:[81ECDC];gvar_0081ECDC:TObjectList
 0067BB8A    xchg        eax,edx
 0067BB8B    call        TList.Add
 0067BB90    call        @DoneExcept
>0067BB95    jmp         0067BBAE
 0067BB97    mov         byte ptr [ebp-6],0
 0067BB9B    mov         eax,dword ptr [ebp-4]
 0067BB9E    mov         byte ptr [eax+14],0;TCodeBlock.Blocked:Boolean
 0067BBA2    call        @DoneExcept
 0067BBA7    mov         eax,dword ptr [ebp-4]
 0067BBAA    mov         byte ptr [eax+14],0;TCodeBlock.Blocked:Boolean
 0067BBAE    movzx       eax,byte ptr [ebp-6]
 0067BBB2    pop         edi
 0067BBB3    pop         esi
 0067BBB4    pop         ebx
 0067BBB5    mov         esp,ebp
 0067BBB7    pop         ebp
 0067BBB8    ret
*}
end;

//0067BBBC
function TCodeBlock.ExecuteAfterStatement(StatementNumber:Integer; Background:Boolean):Boolean;
begin
{*
 0067BBBC    push        ebp
 0067BBBD    mov         ebp,esp
 0067BBBF    add         esp,0FFFFFFF4
 0067BBC2    push        ebx
 0067BBC3    push        esi
 0067BBC4    push        edi
 0067BBC5    mov         byte ptr [ebp-5],cl
 0067BBC8    mov         dword ptr [ebp-4],eax
 0067BBCB    mov         byte ptr [ebp-6],1
 0067BBCF    inc         edx
 0067BBD0    mov         dword ptr [ebp-0C],edx
 0067BBD3    xor         ecx,ecx
 0067BBD5    push        ebp
 0067BBD6    push        67BC27
 0067BBDB    push        dword ptr fs:[ecx]
 0067BBDE    mov         dword ptr fs:[ecx],esp
>0067BBE1    jmp         0067BC0F
 0067BBE3    mov         eax,edi
 0067BBE5    mov         edx,dword ptr [ebp-0C]
 0067BBE8    call        TList.Get
 0067BBED    mov         edx,dword ptr ds:[67997C];TStatement
 0067BBF3    call        @AsClass
 0067BBF8    mov         esi,eax
 0067BBFA    movzx       edx,byte ptr [ebp-5]
 0067BBFE    mov         eax,esi
 0067BC00    mov         ecx,dword ptr [eax]
 0067BC02    call        dword ptr [ecx];TStatement.Execute
 0067BC04    mov         ebx,eax
 0067BC06    and         bl,byte ptr [ebp-6]
 0067BC09    mov         byte ptr [ebp-6],bl
 0067BC0C    inc         dword ptr [ebp-0C]
 0067BC0F    mov         eax,dword ptr [ebp-4]
 0067BC12    mov         edi,dword ptr [eax+10];TCodeBlock.L:TObjectList
 0067BC15    mov         eax,dword ptr [edi+8];TObjectList.FCount:Integer
 0067BC18    cmp         eax,dword ptr [ebp-0C]
>0067BC1B    jg          0067BBE3
 0067BC1D    xor         eax,eax
 0067BC1F    pop         edx
 0067BC20    pop         ecx
 0067BC21    pop         ecx
 0067BC22    mov         dword ptr fs:[eax],edx
>0067BC25    jmp         0067BC8C
>0067BC27    jmp         @HandleOnException
 0067BC2C    dd          2
 0067BC30    dd          00679898;EWait
 0067BC34    dd          0067BC40
 0067BC38    dd          00000000
 0067BC3C    dd          0067BC7C
 0067BC40    mov         edx,dword ptr [ebp-4]
 0067BC43    mov         byte ptr [edx+14],1;TCodeBlock.Blocked:Boolean
 0067BC47    push        dword ptr [eax+1C];EWait.?f1C:dword
 0067BC4A    push        dword ptr [eax+18];EWait.time:Double
 0067BC4D    mov         eax,dword ptr [ebp-0C]
 0067BC50    push        eax
 0067BC51    mov         ecx,dword ptr [ebp-4]
 0067BC54    mov         dl,1
 0067BC56    mov         eax,[0067AA18];TWaitItem
 0067BC5B    call        TWaitItem.Create;TWaitItem.Create
 0067BC60    mov         edx,dword ptr [ebp-4]
 0067BC63    mov         edx,dword ptr [edx+18];TCodeBlock.ForLoop:TForLoop
 0067BC66    mov         dword ptr [eax+18],edx;TWaitItem.ForLoop:TForLoop
 0067BC69    mov         edx,dword ptr ds:[81ECDC];gvar_0081ECDC:TObjectList
 0067BC6F    xchg        eax,edx
 0067BC70    call        TList.Add
 0067BC75    call        @DoneExcept
>0067BC7A    jmp         0067BC93
 0067BC7C    mov         byte ptr [ebp-6],0
 0067BC80    mov         eax,dword ptr [ebp-4]
 0067BC83    mov         byte ptr [eax+14],0;TCodeBlock.Blocked:Boolean
 0067BC87    call        @DoneExcept
 0067BC8C    mov         eax,dword ptr [ebp-4]
 0067BC8F    mov         byte ptr [eax+14],0;TCodeBlock.Blocked:Boolean
 0067BC93    movzx       eax,byte ptr [ebp-6]
 0067BC97    pop         edi
 0067BC98    pop         esi
 0067BC99    pop         ebx
 0067BC9A    mov         esp,ebp
 0067BC9C    pop         ebp
 0067BC9D    ret
*}
end;

//0067BCA0
procedure TCodeBlock.SetIffy(IsIffy:Boolean);
begin
{*
 0067BCA0    push        ebp
 0067BCA1    mov         ebp,esp
 0067BCA3    push        0
 0067BCA5    push        0
 0067BCA7    push        0
 0067BCA9    push        ebx
 0067BCAA    push        esi
 0067BCAB    push        edi
 0067BCAC    mov         byte ptr [ebp-1],dl
 0067BCAF    mov         edi,eax
 0067BCB1    xor         eax,eax
 0067BCB3    push        ebp
 0067BCB4    push        67BD56
 0067BCB9    push        dword ptr fs:[eax]
 0067BCBC    mov         dword ptr fs:[eax],esp
 0067BCBF    movzx       edx,byte ptr [ebp-1]
 0067BCC3    mov         eax,edi
 0067BCC5    call        TStatement.SetIffy
 0067BCCA    mov         eax,dword ptr [edi+10];TCodeBlock.L:TObjectList
 0067BCCD    mov         esi,dword ptr [eax+8];TObjectList.FCount:Integer
 0067BCD0    dec         esi
 0067BCD1    test        esi,esi
>0067BCD3    jl          0067BD3B
 0067BCD5    inc         esi
 0067BCD6    xor         ebx,ebx
 0067BCD8    mov         eax,dword ptr [edi+10];TCodeBlock.L:TObjectList
 0067BCDB    mov         edx,ebx
 0067BCDD    call        TList.Get
 0067BCE2    call        004F99B0
 0067BCE7    test        al,al
>0067BCE9    je          0067BD0B
 0067BCEB    mov         eax,dword ptr [edi+10];TCodeBlock.L:TObjectList
 0067BCEE    mov         edx,ebx
 0067BCF0    call        TList.Get
 0067BCF5    mov         edx,dword ptr ds:[67997C];TStatement
 0067BCFB    call        @AsClass
 0067BD00    movzx       edx,byte ptr [ebp-1]
 0067BD04    mov         ecx,dword ptr [eax]
 0067BD06    call        dword ptr [ecx+4];TStatement.SetIffy
>0067BD09    jmp         0067BD37
 0067BD0B    push        67BD70;'Codeblock item '
 0067BD10    lea         edx,[ebp-0C]
 0067BD13    mov         eax,ebx
 0067BD15    call        IntToStr
 0067BD1A    push        dword ptr [ebp-0C]
 0067BD1D    push        67BD9C;' is invalid in SetIffy'
 0067BD22    lea         eax,[ebp-8]
 0067BD25    mov         edx,3
 0067BD2A    call        @UStrCatN
 0067BD2F    mov         eax,dword ptr [ebp-8]
 0067BD32    call        ShowMessage
 0067BD37    inc         ebx
 0067BD38    dec         esi
>0067BD39    jne         0067BCD8
 0067BD3B    xor         eax,eax
 0067BD3D    pop         edx
 0067BD3E    pop         ecx
 0067BD3F    pop         ecx
 0067BD40    mov         dword ptr fs:[eax],edx
 0067BD43    push        67BD5D
 0067BD48    lea         eax,[ebp-0C]
 0067BD4B    mov         edx,2
 0067BD50    call        @UStrArrayClr
 0067BD55    ret
>0067BD56    jmp         @HandleFinally
>0067BD5B    jmp         0067BD48
 0067BD5D    pop         edi
 0067BD5E    pop         esi
 0067BD5F    pop         ebx
 0067BD60    mov         esp,ebp
 0067BD62    pop         ebp
 0067BD63    ret
*}
end;

//0067BDCC
{*procedure TCodeBlock.ToString(?:?);
begin
 0067BDCC    push        ebp
 0067BDCD    mov         ebp,esp
 0067BDCF    mov         ecx,4
 0067BDD4    push        0
 0067BDD6    push        0
 0067BDD8    dec         ecx
>0067BDD9    jne         0067BDD4
 0067BDDB    push        ecx
 0067BDDC    push        ebx
 0067BDDD    push        esi
 0067BDDE    push        edi
 0067BDDF    mov         dword ptr [ebp-0C],edx
 0067BDE2    mov         dword ptr [ebp-8],eax
 0067BDE5    xor         eax,eax
 0067BDE7    push        ebp
 0067BDE8    push        67BF41
 0067BDED    push        dword ptr fs:[eax]
 0067BDF0    mov         dword ptr fs:[eax],esp
 0067BDF3    mov         eax,dword ptr [ebp-0C]
 0067BDF6    mov         edx,67BF5C;'Begin
'
 0067BDFB    call        @UStrAsg
 0067BE00    mov         eax,dword ptr [ebp-8]
 0067BE03    mov         eax,dword ptr [eax+10];TCodeBlock.L:TObjectList
 0067BE06    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0067BE09    dec         eax
 0067BE0A    test        eax,eax
>0067BE0C    jl          0067BEC6
 0067BE12    inc         eax
 0067BE13    mov         dword ptr [ebp-14],eax
 0067BE16    mov         dword ptr [ebp-10],0
 0067BE1D    xor         eax,eax
 0067BE1F    push        ebp
 0067BE20    push        67BE56
 0067BE25    push        dword ptr fs:[eax]
 0067BE28    mov         dword ptr fs:[eax],esp
 0067BE2B    mov         eax,dword ptr [ebp-8]
 0067BE2E    mov         eax,dword ptr [eax+10];TCodeBlock.L:TObjectList
 0067BE31    mov         edx,dword ptr [ebp-10]
 0067BE34    call        TList.Get
 0067BE39    mov         edx,dword ptr ds:[67997C];TStatement
 0067BE3F    call        @AsClass
 0067BE44    lea         edx,[ebp-4]
 0067BE47    mov         ecx,dword ptr [eax]
 0067BE49    call        dword ptr [ecx-24];TStatement.ToString
 0067BE4C    xor         eax,eax
 0067BE4E    pop         edx
 0067BE4F    pop         ecx
 0067BE50    pop         ecx
 0067BE51    mov         dword ptr fs:[eax],edx
>0067BE54    jmp         0067BE95
>0067BE56    jmp         @HandleOnException
 0067BE5B    dd          1
 0067BE5F    dd          00418C04;Exception
 0067BE63    dd          0067BE67
 0067BE67    mov         ebx,eax
 0067BE69    push        67BF78;'// Exception! '
 0067BE6E    lea         edx,[ebp-18]
 0067BE71    mov         eax,dword ptr [ebx]
 0067BE73    call        TObject.ClassName
 0067BE78    push        dword ptr [ebp-18]
 0067BE7B    push        67BFA4;': '
 0067BE80    push        dword ptr [ebx+4];Exception.FMessage:string
 0067BE83    lea         eax,[ebp-4]
 0067BE86    mov         edx,4
 0067BE8B    call        @UStrCatN
 0067BE90    call        @DoneExcept
 0067BE95    mov         eax,dword ptr [ebp-0C]
 0067BE98    push        dword ptr [eax]
 0067BE9A    lea         edx,[ebp-1C]
 0067BE9D    mov         eax,dword ptr [ebp-4]
 0067BEA0    call        0067B290
 0067BEA5    push        dword ptr [ebp-1C]
 0067BEA8    push        67BFB8;';
'
 0067BEAD    mov         eax,dword ptr [ebp-0C]
 0067BEB0    mov         edx,3
 0067BEB5    call        @UStrCatN
 0067BEBA    inc         dword ptr [ebp-10]
 0067BEBD    dec         dword ptr [ebp-14]
>0067BEC0    jne         0067BE1D
 0067BEC6    mov         eax,dword ptr [ebp-0C]
 0067BEC9    mov         edx,67BFCC;'End'
 0067BECE    call        @UStrCat
 0067BED3    mov         eax,dword ptr [ebp-0C]
 0067BED6    push        67BFE0;'{'
 0067BEDB    lea         edx,[ebp-20]
 0067BEDE    mov         eax,dword ptr [ebp-8]
 0067BEE1    mov         eax,dword ptr [eax+8];TCodeBlock.StartLine:Integer
 0067BEE4    call        IntToStr
 0067BEE9    push        dword ptr [ebp-20]
 0067BEEC    push        67BFF0;'}'
 0067BEF1    mov         eax,dword ptr [ebp-0C]
 0067BEF4    push        dword ptr [eax]
 0067BEF6    push        67BFE0;'{'
 0067BEFB    lea         edx,[ebp-24]
 0067BEFE    mov         eax,dword ptr [ebp-8]
 0067BF01    mov         eax,dword ptr [eax+0C];TCodeBlock.EndLine:Integer
 0067BF04    call        IntToStr
 0067BF09    push        dword ptr [ebp-24]
 0067BF0C    push        67BFF0;'}'
 0067BF11    mov         eax,dword ptr [ebp-0C]
 0067BF14    mov         edx,7
 0067BF19    call        @UStrCatN
 0067BF1E    xor         eax,eax
 0067BF20    pop         edx
 0067BF21    pop         ecx
 0067BF22    pop         ecx
 0067BF23    mov         dword ptr fs:[eax],edx
 0067BF26    push        67BF48
 0067BF2B    lea         eax,[ebp-24]
 0067BF2E    mov         edx,4
 0067BF33    call        @UStrArrayClr
 0067BF38    lea         eax,[ebp-4]
 0067BF3B    call        @UStrClr
 0067BF40    ret
>0067BF41    jmp         @HandleFinally
>0067BF46    jmp         0067BF2B
 0067BF48    pop         edi
 0067BF49    pop         esi
 0067BF4A    pop         ebx
 0067BF4B    mov         esp,ebp
 0067BF4D    pop         ebp
 0067BF4E    ret
end;*}

//0067BFF4
destructor TIfStatement.Destroy();
begin
{*
 0067BFF4    push        ebx
 0067BFF5    push        esi
 0067BFF6    call        @BeforeDestruction
 0067BFFB    mov         ebx,edx
 0067BFFD    mov         esi,eax
 0067BFFF    lea         eax,[esi+14];TIfStatement.IfCode:TStatement
 0067C002    call        0067B38C
 0067C007    lea         eax,[esi+18];TIfStatement.ElseCode:TStatement
 0067C00A    call        0067B38C
 0067C00F    mov         edx,ebx
 0067C011    and         dl,0FC
 0067C014    mov         eax,esi
 0067C016    call        TObject.Destroy
 0067C01B    test        bl,bl
>0067C01D    jle         0067C026
 0067C01F    mov         eax,esi
 0067C021    call        @ClassDestroy
 0067C026    pop         esi
 0067C027    pop         ebx
 0067C028    ret
*}
end;

//0067C02C
function TIfStatement.Execute(Background:Boolean):Boolean;
begin
{*
 0067C02C    push        ebx
 0067C02D    push        esi
 0067C02E    mov         ebx,edx
 0067C030    mov         esi,eax
 0067C032    mov         eax,dword ptr [esi+10];TIfStatement.Condition:TExpression
 0067C035    mov         edx,dword ptr [eax]
 0067C037    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0067C03A    test        al,al
>0067C03C    je          0067C052
 0067C03E    mov         eax,dword ptr [esi+14];TIfStatement.IfCode:TStatement
 0067C041    test        eax,eax
>0067C043    je          0067C04D
 0067C045    mov         edx,ebx
 0067C047    mov         ecx,dword ptr [eax]
 0067C049    call        dword ptr [ecx];TStatement.Execute
>0067C04B    jmp         0067C063
 0067C04D    mov         al,1
 0067C04F    pop         esi
 0067C050    pop         ebx
 0067C051    ret
 0067C052    mov         eax,dword ptr [esi+18];TIfStatement.ElseCode:TStatement
 0067C055    test        eax,eax
>0067C057    je          0067C061
 0067C059    mov         edx,ebx
 0067C05B    mov         ecx,dword ptr [eax]
 0067C05D    call        dword ptr [ecx];TStatement.Execute
>0067C05F    jmp         0067C063
 0067C061    mov         al,1
 0067C063    pop         esi
 0067C064    pop         ebx
 0067C065    ret
*}
end;

//0067C068
procedure TIfStatement.SetIffy(IsIffy:Boolean);
begin
{*
 0067C068    push        ebx
 0067C069    push        esi
 0067C06A    mov         ebx,edx
 0067C06C    mov         esi,eax
 0067C06E    mov         edx,ebx
 0067C070    mov         eax,esi
 0067C072    call        TStatement.SetIffy
 0067C077    mov         eax,dword ptr [esi+10];TIfStatement.Condition:TExpression
 0067C07A    call        004F99B0
 0067C07F    test        al,al
>0067C081    je          0067C08D
 0067C083    mov         edx,ebx
 0067C085    mov         eax,dword ptr [esi+10];TIfStatement.Condition:TExpression
 0067C088    mov         ecx,dword ptr [eax]
 0067C08A    call        dword ptr [ecx+74];TExpression.SetIffy
 0067C08D    mov         eax,dword ptr [esi+14];TIfStatement.IfCode:TStatement
 0067C090    call        004F99B0
 0067C095    test        al,al
>0067C097    je          0067C0A3
 0067C099    mov         dl,1
 0067C09B    mov         eax,dword ptr [esi+14];TIfStatement.IfCode:TStatement
 0067C09E    mov         ecx,dword ptr [eax]
 0067C0A0    call        dword ptr [ecx+4];TStatement.SetIffy
 0067C0A3    mov         eax,dword ptr [esi+18];TIfStatement.ElseCode:TStatement
 0067C0A6    call        004F99B0
 0067C0AB    test        al,al
>0067C0AD    je          0067C0B9
 0067C0AF    mov         dl,1
 0067C0B1    mov         eax,dword ptr [esi+18];TIfStatement.ElseCode:TStatement
 0067C0B4    mov         ecx,dword ptr [eax]
 0067C0B6    call        dword ptr [ecx+4];TStatement.SetIffy
 0067C0B9    pop         esi
 0067C0BA    pop         ebx
 0067C0BB    ret
*}
end;

//0067C0BC
{*procedure TIfStatement.ToString(?:?);
begin
 0067C0BC    push        ebp
 0067C0BD    mov         ebp,esp
 0067C0BF    xor         ecx,ecx
 0067C0C1    push        ecx
 0067C0C2    push        ecx
 0067C0C3    push        ecx
 0067C0C4    push        ecx
 0067C0C5    push        ecx
 0067C0C6    push        ecx
 0067C0C7    push        ecx
 0067C0C8    push        ebx
 0067C0C9    push        esi
 0067C0CA    mov         ebx,edx
 0067C0CC    mov         esi,eax
 0067C0CE    xor         eax,eax
 0067C0D0    push        ebp
 0067C0D1    push        67C1EA
 0067C0D6    push        dword ptr fs:[eax]
 0067C0D9    mov         dword ptr fs:[eax],esp
 0067C0DC    mov         eax,ebx
 0067C0DE    mov         edx,67C204;'If '
 0067C0E3    call        @UStrAsg
 0067C0E8    mov         eax,dword ptr [esi+10];TIfStatement.Condition:TExpression
 0067C0EB    call        004F99B0
 0067C0F0    test        al,al
>0067C0F2    je          0067C10B
 0067C0F4    lea         edx,[ebp-4]
 0067C0F7    mov         eax,dword ptr [esi+10];TIfStatement.Condition:TExpression
 0067C0FA    mov         ecx,dword ptr [eax]
 0067C0FC    call        dword ptr [ecx-24];TExpression.ToString
 0067C0FF    mov         edx,dword ptr [ebp-4]
 0067C102    mov         eax,ebx
 0067C104    call        @UStrCat
>0067C109    jmp         0067C120
 0067C10B    lea         edx,[ebp-8]
 0067C10E    mov         eax,dword ptr [esi+10];TIfStatement.Condition:TExpression
 0067C111    call        004F96E8
 0067C116    mov         edx,dword ptr [ebp-8]
 0067C119    mov         eax,ebx
 0067C11B    call        @UStrCat
 0067C120    mov         eax,ebx
 0067C122    mov         edx,67C218;' then '
 0067C127    call        @UStrCat
 0067C12C    mov         eax,dword ptr [esi+14];TIfStatement.IfCode:TStatement
 0067C12F    call        004F99B0
 0067C134    test        al,al
>0067C136    je          0067C14F
 0067C138    lea         edx,[ebp-0C]
 0067C13B    mov         eax,dword ptr [esi+14];TIfStatement.IfCode:TStatement
 0067C13E    mov         ecx,dword ptr [eax]
 0067C140    call        dword ptr [ecx-24];TStatement.ToString
 0067C143    mov         edx,dword ptr [ebp-0C]
 0067C146    mov         eax,ebx
 0067C148    call        @UStrCat
>0067C14D    jmp         0067C164
 0067C14F    lea         edx,[ebp-10]
 0067C152    mov         eax,dword ptr [esi+14];TIfStatement.IfCode:TStatement
 0067C155    call        004F96E8
 0067C15A    mov         edx,dword ptr [ebp-10]
 0067C15D    mov         eax,ebx
 0067C15F    call        @UStrCat
 0067C164    mov         eax,dword ptr [esi+18];TIfStatement.ElseCode:TStatement
 0067C167    call        004F99B0
 0067C16C    test        al,al
>0067C16E    je          0067C191
 0067C170    push        dword ptr [ebx]
 0067C172    push        67C234;' else '
 0067C177    lea         edx,[ebp-14]
 0067C17A    mov         eax,dword ptr [esi+18];TIfStatement.ElseCode:TStatement
 0067C17D    mov         ecx,dword ptr [eax]
 0067C17F    call        dword ptr [ecx-24];TStatement.ToString
 0067C182    push        dword ptr [ebp-14]
 0067C185    mov         eax,ebx
 0067C187    mov         edx,3
 0067C18C    call        @UStrCatN
 0067C191    push        67C250;'{'
 0067C196    lea         edx,[ebp-18]
 0067C199    mov         eax,dword ptr [esi+8];TIfStatement.StartLine:Integer
 0067C19C    call        IntToStr
 0067C1A1    push        dword ptr [ebp-18]
 0067C1A4    push        67C260;'}'
 0067C1A9    push        dword ptr [ebx]
 0067C1AB    push        67C250;'{'
 0067C1B0    lea         edx,[ebp-1C]
 0067C1B3    mov         eax,dword ptr [esi+0C];TIfStatement.EndLine:Integer
 0067C1B6    call        IntToStr
 0067C1BB    push        dword ptr [ebp-1C]
 0067C1BE    push        67C260;'}'
 0067C1C3    mov         eax,ebx
 0067C1C5    mov         edx,7
 0067C1CA    call        @UStrCatN
 0067C1CF    xor         eax,eax
 0067C1D1    pop         edx
 0067C1D2    pop         ecx
 0067C1D3    pop         ecx
 0067C1D4    mov         dword ptr fs:[eax],edx
 0067C1D7    push        67C1F1
 0067C1DC    lea         eax,[ebp-1C]
 0067C1DF    mov         edx,7
 0067C1E4    call        @UStrArrayClr
 0067C1E9    ret
>0067C1EA    jmp         @HandleFinally
>0067C1EF    jmp         0067C1DC
 0067C1F1    pop         esi
 0067C1F2    pop         ebx
 0067C1F3    mov         esp,ebp
 0067C1F5    pop         ebp
 0067C1F6    ret
end;*}

//0067C264
function TEmptyStatement.Execute(Background:Boolean):Boolean;
begin
{*
 0067C264    mov         al,1
 0067C266    ret
*}
end;

//0067C268
destructor TWaitStatement.Destroy();
begin
{*
 0067C268    push        ebx
 0067C269    push        esi
 0067C26A    call        @BeforeDestruction
 0067C26F    mov         ebx,edx
 0067C271    mov         esi,eax
 0067C273    lea         eax,[esi+1C];TWaitStatement............time:TExpression
 0067C276    call        0067B38C
 0067C27B    mov         edx,ebx
 0067C27D    and         dl,0FC
 0067C280    mov         eax,esi
 0067C282    call        TCall.Destroy
 0067C287    test        bl,bl
>0067C289    jle         0067C292
 0067C28B    mov         eax,esi
 0067C28D    call        @ClassDestroy
 0067C292    pop         esi
 0067C293    pop         ebx
 0067C294    ret
*}
end;

//0067C298
procedure TWaitStatement.Execute(Background:Boolean);
begin
{*
 0067C298    push        ebx
 0067C299    add         esp,0FFFFFFF8
 0067C29C    push        0
 0067C29E    xor         ecx,ecx
 0067C2A0    mov         dl,11
 0067C2A2    mov         eax,dword ptr [eax+1C];TWaitStatement.............time:TExpression
 0067C2A5    mov         ebx,dword ptr [eax]
 0067C2A7    call        dword ptr [ebx+10];TExpression.EvaluateUnits
 0067C2AA    fstp        qword ptr [esp]
 0067C2AD    wait
 0067C2AE    push        dword ptr [esp+4]
 0067C2B2    push        dword ptr [esp+4]
 0067C2B6    mov         dl,1
 0067C2B8    mov         eax,[00679898];EWait
 0067C2BD    call        EWait.Create;EWait.Create
 0067C2C2    call        @RaiseExcept
 0067C2C7    pop         ecx
 0067C2C8    pop         edx
 0067C2C9    pop         ebx
 0067C2CA    ret
*}
end;

//0067C2CC
procedure TWaitStatement.SetIffy(IsIffy:Boolean);
begin
{*
 0067C2CC    push        ebx
 0067C2CD    push        esi
 0067C2CE    mov         ebx,edx
 0067C2D0    mov         esi,eax
 0067C2D2    mov         edx,ebx
 0067C2D4    mov         eax,esi
 0067C2D6    call        TStatement.SetIffy
 0067C2DB    mov         edx,ebx
 0067C2DD    mov         eax,dword ptr [esi+1C];TWaitStatement..............time:TExpression
 0067C2E0    mov         ecx,dword ptr [eax]
 0067C2E2    call        dword ptr [ecx+74];TExpression.SetIffy
 0067C2E5    pop         esi
 0067C2E6    pop         ebx
 0067C2E7    ret
*}
end;

//0067C2E8
{*procedure TWaitStatement.ToString(?:?);
begin
 0067C2E8    push        ebp
 0067C2E9    mov         ebp,esp
 0067C2EB    push        0
 0067C2ED    push        0
 0067C2EF    push        0
 0067C2F1    push        ebx
 0067C2F2    push        esi
 0067C2F3    mov         esi,edx
 0067C2F5    mov         ebx,eax
 0067C2F7    xor         eax,eax
 0067C2F9    push        ebp
 0067C2FA    push        67C382
 0067C2FF    push        dword ptr fs:[eax]
 0067C302    mov         dword ptr fs:[eax],esp
 0067C305    push        67C39C;'Wait('
 0067C30A    lea         edx,[ebp-4]
 0067C30D    mov         eax,dword ptr [ebx+1C];TWaitStatement...............time:TExpression
 0067C310    mov         ecx,dword ptr [eax]
 0067C312    call        dword ptr [ecx-24];TExpression.ToString
 0067C315    push        dword ptr [ebp-4]
 0067C318    push        67C3B4;')'
 0067C31D    mov         eax,esi
 0067C31F    mov         edx,3
 0067C324    call        @UStrCatN
 0067C329    push        67C3C4;'{'
 0067C32E    lea         edx,[ebp-8]
 0067C331    mov         eax,dword ptr [ebx+8];TWaitStatement.StartLine:Integer
 0067C334    call        IntToStr
 0067C339    push        dword ptr [ebp-8]
 0067C33C    push        67C3D4;'}'
 0067C341    push        dword ptr [esi]
 0067C343    push        67C3C4;'{'
 0067C348    lea         edx,[ebp-0C]
 0067C34B    mov         eax,dword ptr [ebx+0C];TWaitStatement.EndLine:Integer
 0067C34E    call        IntToStr
 0067C353    push        dword ptr [ebp-0C]
 0067C356    push        67C3D4;'}'
 0067C35B    mov         eax,esi
 0067C35D    mov         edx,7
 0067C362    call        @UStrCatN
 0067C367    xor         eax,eax
 0067C369    pop         edx
 0067C36A    pop         ecx
 0067C36B    pop         ecx
 0067C36C    mov         dword ptr fs:[eax],edx
 0067C36F    push        67C389
 0067C374    lea         eax,[ebp-0C]
 0067C377    mov         edx,3
 0067C37C    call        @UStrArrayClr
 0067C381    ret
>0067C382    jmp         @HandleFinally
>0067C387    jmp         0067C374
 0067C389    pop         esi
 0067C38A    pop         ebx
 0067C38B    mov         esp,ebp
 0067C38D    pop         ebp
 0067C38E    ret
end;*}

//0067C3D8
{*constructor EWait.Create(t:Double; ?:?);
begin
 0067C3D8    push        ebp
 0067C3D9    mov         ebp,esp
 0067C3DB    test        dl,dl
>0067C3DD    je          0067C3E7
 0067C3DF    add         esp,0FFFFFFF0
 0067C3E2    call        @ClassCreate
 0067C3E7    mov         ecx,dword ptr [ebp+8]
 0067C3EA    mov         dword ptr [eax+18],ecx;EWait.time:Double
 0067C3ED    mov         ecx,dword ptr [ebp+0C]
 0067C3F0    mov         dword ptr [eax+1C],ecx;EWait.?f1C:dword
 0067C3F3    test        dl,dl
>0067C3F5    je          0067C406
 0067C3F7    call        @AfterConstruction
 0067C3FC    pop         dword ptr fs:[0]
 0067C403    add         esp,0C
 0067C406    pop         ebp
 0067C407    ret         8
end;*}

//0067C40C
constructor TCall.Create;
begin
{*
 0067C40C    push        ebx
 0067C40D    push        esi
 0067C40E    push        edi
 0067C40F    test        dl,dl
>0067C411    je          0067C41B
 0067C413    add         esp,0FFFFFFF0
 0067C416    call        @ClassCreate
 0067C41B    mov         ebx,edx
 0067C41D    mov         edi,eax
 0067C41F    xor         edx,edx
 0067C421    mov         eax,edi
 0067C423    call        TObject.Create
 0067C428    mov         dl,1
 0067C42A    mov         eax,[00471630];TObjectList
 0067C42F    call        TObjectList.Create;TObjectList.Create
 0067C434    mov         esi,eax
 0067C436    mov         dword ptr [edi+14],esi;TCall.Parameters:TObjectList
 0067C439    mov         byte ptr [esi+10],1;TObjectList....FOwnsObjects:Boolean
 0067C43D    mov         eax,edi
 0067C43F    test        bl,bl
>0067C441    je          0067C452
 0067C443    call        @AfterConstruction
 0067C448    pop         dword ptr fs:[0]
 0067C44F    add         esp,0C
 0067C452    mov         eax,edi
 0067C454    pop         edi
 0067C455    pop         esi
 0067C456    pop         ebx
 0067C457    ret
*}
end;

//0067C458
destructor TCall.Destroy();
begin
{*
 0067C458    push        ebx
 0067C459    push        esi
 0067C45A    call        @BeforeDestruction
 0067C45F    mov         ebx,edx
 0067C461    mov         esi,eax
 0067C463    mov         eax,dword ptr [esi+14];TCall.Parameters:TObjectList
 0067C466    call        TObject.Free
 0067C46B    mov         edx,ebx
 0067C46D    and         dl,0FC
 0067C470    mov         eax,esi
 0067C472    call        TObject.Destroy
 0067C477    test        bl,bl
>0067C479    jle         0067C482
 0067C47B    mov         eax,esi
 0067C47D    call        @ClassDestroy
 0067C482    pop         esi
 0067C483    pop         ebx
 0067C484    ret
*}
end;

//0067C488
function TCall.Execute(Background:Boolean):Boolean;
begin
{*
 0067C488    xor         eax,eax
 0067C48A    ret
*}
end;

//0067C48C
{*procedure TCall.ToString(?:?);
begin
 0067C48C    push        ebp
 0067C48D    mov         ebp,esp
 0067C48F    push        0
 0067C491    push        0
 0067C493    push        ebx
 0067C494    push        esi
 0067C495    mov         esi,edx
 0067C497    mov         ebx,eax
 0067C499    xor         eax,eax
 0067C49B    push        ebp
 0067C49C    push        67C50F
 0067C4A1    push        dword ptr fs:[eax]
 0067C4A4    mov         dword ptr fs:[eax],esp
 0067C4A7    mov         eax,esi
 0067C4A9    mov         ecx,67C528;'()'
 0067C4AE    mov         edx,dword ptr [ebx+10];TCall.FunctionName:string
 0067C4B1    call        @UStrCat3
 0067C4B6    push        67C53C;'{'
 0067C4BB    lea         edx,[ebp-4]
 0067C4BE    mov         eax,dword ptr [ebx+8];TCall.StartLine:Integer
 0067C4C1    call        IntToStr
 0067C4C6    push        dword ptr [ebp-4]
 0067C4C9    push        67C54C;'}'
 0067C4CE    push        dword ptr [esi]
 0067C4D0    push        67C53C;'{'
 0067C4D5    lea         edx,[ebp-8]
 0067C4D8    mov         eax,dword ptr [ebx+0C];TCall.EndLine:Integer
 0067C4DB    call        IntToStr
 0067C4E0    push        dword ptr [ebp-8]
 0067C4E3    push        67C54C;'}'
 0067C4E8    mov         eax,esi
 0067C4EA    mov         edx,7
 0067C4EF    call        @UStrCatN
 0067C4F4    xor         eax,eax
 0067C4F6    pop         edx
 0067C4F7    pop         ecx
 0067C4F8    pop         ecx
 0067C4F9    mov         dword ptr fs:[eax],edx
 0067C4FC    push        67C516
 0067C501    lea         eax,[ebp-8]
 0067C504    mov         edx,2
 0067C509    call        @UStrArrayClr
 0067C50E    ret
>0067C50F    jmp         @HandleFinally
>0067C514    jmp         0067C501
 0067C516    pop         esi
 0067C517    pop         ebx
 0067C518    pop         ecx
 0067C519    pop         ecx
 0067C51A    pop         ebp
 0067C51B    ret
end;*}

//0067C550
destructor TDisplayStatement.Destroy();
begin
{*
 0067C550    push        ebx
 0067C551    push        esi
 0067C552    call        @BeforeDestruction
 0067C557    mov         ebx,edx
 0067C559    mov         esi,eax
 0067C55B    lea         eax,[esi+1C];TDisplayStatement......text:TExpression
 0067C55E    call        0067B38C
 0067C563    mov         edx,ebx
 0067C565    and         dl,0FC
 0067C568    mov         eax,esi
 0067C56A    call        TCall.Destroy
 0067C56F    test        bl,bl
>0067C571    jle         0067C57A
 0067C573    mov         eax,esi
 0067C575    call        @ClassDestroy
 0067C57A    pop         esi
 0067C57B    pop         ebx
 0067C57C    ret
*}
end;

//0067C580
function TDisplayStatement.Execute(Background:Boolean):Boolean;
begin
{*
 0067C580    push        ebp
 0067C581    mov         ebp,esp
 0067C583    push        0
 0067C585    push        0
 0067C587    push        ebx
 0067C588    push        esi
 0067C589    push        edi
 0067C58A    mov         ebx,eax
 0067C58C    xor         eax,eax
 0067C58E    push        ebp
 0067C58F    push        67C669
 0067C594    push        dword ptr fs:[eax]
 0067C597    mov         dword ptr fs:[eax],esp
 0067C59A    mov         esi,dword ptr [ebx+1C];TDisplayStatement.......text:TExpression
 0067C59D    test        esi,esi
>0067C59F    je          0067C5D2
 0067C5A1    lea         edx,[ebp-4]
 0067C5A4    mov         eax,esi
 0067C5A6    mov         ecx,dword ptr [eax]
 0067C5A8    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0067C5AB    mov         eax,[0078D7E4];^gvar_008155DC:TTntEdit
 0067C5B0    cmp         dword ptr [eax],0
>0067C5B3    je          0067C5C4
 0067C5B5    mov         eax,[0078D7E4];^gvar_008155DC:TTntEdit
 0067C5BA    mov         eax,dword ptr [eax]
 0067C5BC    mov         edx,dword ptr [ebp-4]
 0067C5BF    call        TControl.SetText
 0067C5C4    xor         edx,edx
 0067C5C6    mov         eax,dword ptr [ebp-4]
 0067C5C9    call        005D0620
 0067C5CE    mov         bl,1
>0067C5D0    jmp         0067C64E
 0067C5D2    mov         eax,dword ptr [ebx+14];TDisplayStatement.Parameters:TObjectList
 0067C5D5    mov         esi,dword ptr [eax+8];TObjectList.FCount:Integer
 0067C5D8    test        esi,esi
>0067C5DA    jle         0067C64C
 0067C5DC    lea         eax,[ebp-4]
 0067C5DF    call        @UStrClr
 0067C5E4    dec         esi
 0067C5E5    test        esi,esi
>0067C5E7    jl          0067C625
 0067C5E9    inc         esi
 0067C5EA    xor         edi,edi
 0067C5EC    push        dword ptr [ebp-4]
 0067C5EF    mov         edx,edi
 0067C5F1    mov         eax,dword ptr [ebx+14];TDisplayStatement.Parameters:TObjectList
 0067C5F4    call        TList.Get
 0067C5F9    mov         edx,dword ptr ds:[67DB04];TExpression
 0067C5FF    call        @AsClass
 0067C604    lea         edx,[ebp-8]
 0067C607    mov         ecx,dword ptr [eax]
 0067C609    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0067C60C    push        dword ptr [ebp-8]
 0067C60F    push        67C688;'. '
 0067C614    lea         eax,[ebp-4]
 0067C617    mov         edx,3
 0067C61C    call        @UStrCatN
 0067C621    inc         edi
 0067C622    dec         esi
>0067C623    jne         0067C5EC
 0067C625    mov         eax,[0078D7E4];^gvar_008155DC:TTntEdit
 0067C62A    cmp         dword ptr [eax],0
>0067C62D    je          0067C63E
 0067C62F    mov         eax,[0078D7E4];^gvar_008155DC:TTntEdit
 0067C634    mov         eax,dword ptr [eax]
 0067C636    mov         edx,dword ptr [ebp-4]
 0067C639    call        TControl.SetText
 0067C63E    xor         edx,edx
 0067C640    mov         eax,dword ptr [ebp-4]
 0067C643    call        005D0620
 0067C648    mov         bl,1
>0067C64A    jmp         0067C64E
 0067C64C    xor         ebx,ebx
 0067C64E    xor         eax,eax
 0067C650    pop         edx
 0067C651    pop         ecx
 0067C652    pop         ecx
 0067C653    mov         dword ptr fs:[eax],edx
 0067C656    push        67C670
 0067C65B    lea         eax,[ebp-8]
 0067C65E    mov         edx,2
 0067C663    call        @UStrArrayClr
 0067C668    ret
>0067C669    jmp         @HandleFinally
>0067C66E    jmp         0067C65B
 0067C670    mov         eax,ebx
 0067C672    pop         edi
 0067C673    pop         esi
 0067C674    pop         ebx
 0067C675    pop         ecx
 0067C676    pop         ecx
 0067C677    pop         ebp
 0067C678    ret
*}
end;

//0067C690
function THaltStatement.Execute(Background:Boolean):Boolean;
begin
{*
 0067C690    call        @Halt0
 0067C695    xor         eax,eax
 0067C697    ret
*}
end;

//0067C698
{*procedure THaltStatement.ToString(?:?);
begin
 0067C698    push        ebp
 0067C699    mov         ebp,esp
 0067C69B    push        0
 0067C69D    push        0
 0067C69F    push        ebx
 0067C6A0    push        esi
 0067C6A1    mov         esi,edx
 0067C6A3    mov         ebx,eax
 0067C6A5    xor         eax,eax
 0067C6A7    push        ebp
 0067C6A8    push        67C718
 0067C6AD    push        dword ptr fs:[eax]
 0067C6B0    mov         dword ptr fs:[eax],esp
 0067C6B3    mov         eax,esi
 0067C6B5    mov         edx,67C734;'Halt()'
 0067C6BA    call        @UStrAsg
 0067C6BF    push        67C750;'{'
 0067C6C4    lea         edx,[ebp-4]
 0067C6C7    mov         eax,dword ptr [ebx+8];THaltStatement.StartLine:Integer
 0067C6CA    call        IntToStr
 0067C6CF    push        dword ptr [ebp-4]
 0067C6D2    push        67C760;'}'
 0067C6D7    push        dword ptr [esi]
 0067C6D9    push        67C750;'{'
 0067C6DE    lea         edx,[ebp-8]
 0067C6E1    mov         eax,dword ptr [ebx+0C];THaltStatement.EndLine:Integer
 0067C6E4    call        IntToStr
 0067C6E9    push        dword ptr [ebp-8]
 0067C6EC    push        67C760;'}'
 0067C6F1    mov         eax,esi
 0067C6F3    mov         edx,7
 0067C6F8    call        @UStrCatN
 0067C6FD    xor         eax,eax
 0067C6FF    pop         edx
 0067C700    pop         ecx
 0067C701    pop         ecx
 0067C702    mov         dword ptr fs:[eax],edx
 0067C705    push        67C71F
 0067C70A    lea         eax,[ebp-8]
 0067C70D    mov         edx,2
 0067C712    call        @UStrArrayClr
 0067C717    ret
>0067C718    jmp         @HandleFinally
>0067C71D    jmp         0067C70A
 0067C71F    pop         esi
 0067C720    pop         ebx
 0067C721    pop         ecx
 0067C722    pop         ecx
 0067C723    pop         ebp
 0067C724    ret
end;*}

//0067C764
procedure TStatement.SetIffy(IsIffy:Boolean);
begin
{*
 0067C764    mov         byte ptr [eax+4],dl;TStatement.Iffy:Boolean
 0067C767    ret
*}
end;

//0067C768
{*procedure TStatement.ToString(?:?);
begin
 0067C768    push        ebp
 0067C769    mov         ebp,esp
 0067C76B    xor         ecx,ecx
 0067C76D    push        ecx
 0067C76E    push        ecx
 0067C76F    push        ecx
 0067C770    push        ecx
 0067C771    push        ebx
 0067C772    push        esi
 0067C773    mov         esi,edx
 0067C775    mov         ebx,eax
 0067C777    xor         eax,eax
 0067C779    push        ebp
 0067C77A    push        67C80E
 0067C77F    push        dword ptr fs:[eax]
 0067C782    mov         dword ptr fs:[eax],esp
 0067C785    lea         edx,[ebp-4]
 0067C788    mov         eax,dword ptr [ebx]
 0067C78A    call        TObject.ClassName
 0067C78F    push        dword ptr [ebp-4]
 0067C792    push        67C828;'('
 0067C797    lea         edx,[ebp-8]
 0067C79A    mov         eax,ebx
 0067C79C    call        004F9E44
 0067C7A1    push        dword ptr [ebp-8]
 0067C7A4    push        67C838;')'
 0067C7A9    mov         eax,esi
 0067C7AB    mov         edx,4
 0067C7B0    call        @UStrCatN
 0067C7B5    push        67C848;'{'
 0067C7BA    lea         edx,[ebp-0C]
 0067C7BD    mov         eax,dword ptr [ebx+8];TStatement.StartLine:Integer
 0067C7C0    call        IntToStr
 0067C7C5    push        dword ptr [ebp-0C]
 0067C7C8    push        67C858;'}'
 0067C7CD    push        dword ptr [esi]
 0067C7CF    push        67C848;'{'
 0067C7D4    lea         edx,[ebp-10]
 0067C7D7    mov         eax,dword ptr [ebx+0C];TStatement.EndLine:Integer
 0067C7DA    call        IntToStr
 0067C7DF    push        dword ptr [ebp-10]
 0067C7E2    push        67C858;'}'
 0067C7E7    mov         eax,esi
 0067C7E9    mov         edx,7
 0067C7EE    call        @UStrCatN
 0067C7F3    xor         eax,eax
 0067C7F5    pop         edx
 0067C7F6    pop         ecx
 0067C7F7    pop         ecx
 0067C7F8    mov         dword ptr fs:[eax],edx
 0067C7FB    push        67C815
 0067C800    lea         eax,[ebp-10]
 0067C803    mov         edx,4
 0067C808    call        @UStrArrayClr
 0067C80D    ret
>0067C80E    jmp         @HandleFinally
>0067C813    jmp         0067C800
 0067C815    pop         esi
 0067C816    pop         ebx
 0067C817    mov         esp,ebp
 0067C819    pop         ebp
 0067C81A    ret
end;*}

//0067C85C
function TComment.Execute(Background:Boolean):Boolean;
begin
{*
 0067C85C    mov         al,1
 0067C85E    ret
*}
end;

//0067C860
{*procedure TComment.ToString(?:?);
begin
 0067C860    push        ebp
 0067C861    mov         ebp,esp
 0067C863    push        0
 0067C865    push        0
 0067C867    push        ebx
 0067C868    push        esi
 0067C869    mov         esi,edx
 0067C86B    mov         ebx,eax
 0067C86D    xor         eax,eax
 0067C86F    push        ebp
 0067C870    push        67C8E0
 0067C875    push        dword ptr fs:[eax]
 0067C878    mov         dword ptr fs:[eax],esp
 0067C87B    mov         eax,esi
 0067C87D    mov         edx,67C8FC;'// ...'
 0067C882    call        @UStrAsg
 0067C887    push        67C918;'{'
 0067C88C    lea         edx,[ebp-4]
 0067C88F    mov         eax,dword ptr [ebx+8];TComment.StartLine:Integer
 0067C892    call        IntToStr
 0067C897    push        dword ptr [ebp-4]
 0067C89A    push        67C928;'}'
 0067C89F    push        dword ptr [esi]
 0067C8A1    push        67C918;'{'
 0067C8A6    lea         edx,[ebp-8]
 0067C8A9    mov         eax,dword ptr [ebx+0C];TComment.EndLine:Integer
 0067C8AC    call        IntToStr
 0067C8B1    push        dword ptr [ebp-8]
 0067C8B4    push        67C928;'}'
 0067C8B9    mov         eax,esi
 0067C8BB    mov         edx,7
 0067C8C0    call        @UStrCatN
 0067C8C5    xor         eax,eax
 0067C8C7    pop         edx
 0067C8C8    pop         ecx
 0067C8C9    pop         ecx
 0067C8CA    mov         dword ptr fs:[eax],edx
 0067C8CD    push        67C8E7
 0067C8D2    lea         eax,[ebp-8]
 0067C8D5    mov         edx,2
 0067C8DA    call        @UStrArrayClr
 0067C8DF    ret
>0067C8E0    jmp         @HandleFinally
>0067C8E5    jmp         0067C8D2
 0067C8E7    pop         esi
 0067C8E8    pop         ebx
 0067C8E9    pop         ecx
 0067C8EA    pop         ecx
 0067C8EB    pop         ebp
 0067C8EC    ret
end;*}

//0067C92C
function TElseStatement.Execute(Background:Boolean):Boolean;
begin
{*
 0067C92C    xor         eax,eax
 0067C92E    ret
*}
end;

//0067C930
{*procedure TElseStatement.ToString(?:?);
begin
 0067C930    push        ebp
 0067C931    mov         ebp,esp
 0067C933    push        0
 0067C935    push        0
 0067C937    push        ebx
 0067C938    push        esi
 0067C939    mov         esi,edx
 0067C93B    mov         ebx,eax
 0067C93D    xor         eax,eax
 0067C93F    push        ebp
 0067C940    push        67C9B0
 0067C945    push        dword ptr fs:[eax]
 0067C948    mov         dword ptr fs:[eax],esp
 0067C94B    mov         eax,esi
 0067C94D    mov         edx,67C9CC;'else'
 0067C952    call        @UStrAsg
 0067C957    push        67C9E4;'{'
 0067C95C    lea         edx,[ebp-4]
 0067C95F    mov         eax,dword ptr [ebx+8];TElseStatement.StartLine:Integer
 0067C962    call        IntToStr
 0067C967    push        dword ptr [ebp-4]
 0067C96A    push        67C9F4;'}'
 0067C96F    push        dword ptr [esi]
 0067C971    push        67C9E4;'{'
 0067C976    lea         edx,[ebp-8]
 0067C979    mov         eax,dword ptr [ebx+0C];TElseStatement.EndLine:Integer
 0067C97C    call        IntToStr
 0067C981    push        dword ptr [ebp-8]
 0067C984    push        67C9F4;'}'
 0067C989    mov         eax,esi
 0067C98B    mov         edx,7
 0067C990    call        @UStrCatN
 0067C995    xor         eax,eax
 0067C997    pop         edx
 0067C998    pop         ecx
 0067C999    pop         ecx
 0067C99A    mov         dword ptr fs:[eax],edx
 0067C99D    push        67C9B7
 0067C9A2    lea         eax,[ebp-8]
 0067C9A5    mov         edx,2
 0067C9AA    call        @UStrArrayClr
 0067C9AF    ret
>0067C9B0    jmp         @HandleFinally
>0067C9B5    jmp         0067C9A2
 0067C9B7    pop         esi
 0067C9B8    pop         ebx
 0067C9B9    pop         ecx
 0067C9BA    pop         ecx
 0067C9BB    pop         ebp
 0067C9BC    ret
end;*}

//0067C9F8
constructor TWaitItem.Create(block:TCodeBlock; Statement:Integer; delay:Double);
begin
{*
 0067C9F8    push        ebp
 0067C9F9    mov         ebp,esp
 0067C9FB    push        ebx
 0067C9FC    push        esi
 0067C9FD    push        edi
 0067C9FE    test        dl,dl
>0067CA00    je          0067CA0A
 0067CA02    add         esp,0FFFFFFF0
 0067CA05    call        @ClassCreate
 0067CA0A    mov         esi,ecx
 0067CA0C    mov         ebx,edx
 0067CA0E    mov         edi,eax
 0067CA10    fld         qword ptr [ebp+0C]
 0067CA13    fdiv        dword ptr ds:[67CA50];86400:Single
 0067CA19    fstp        qword ptr [ebp+0C]
 0067CA1C    wait
 0067CA1D    call        Now
 0067CA22    fadd        qword ptr [ebp+0C]
 0067CA25    fstp        qword ptr [edi+8];TWaitItem.TimeToTrigger:TDateTime
 0067CA28    wait
 0067CA29    mov         dword ptr [edi+10],esi;TWaitItem.CodeBlock:TCodeBlock
 0067CA2C    mov         eax,dword ptr [ebp+8]
 0067CA2F    mov         dword ptr [edi+14],eax;TWaitItem.StatementNumber:Integer
 0067CA32    mov         eax,edi
 0067CA34    test        bl,bl
>0067CA36    je          0067CA47
 0067CA38    call        @AfterConstruction
 0067CA3D    pop         dword ptr fs:[0]
 0067CA44    add         esp,0C
 0067CA47    mov         eax,edi
 0067CA49    pop         edi
 0067CA4A    pop         esi
 0067CA4B    pop         ebx
 0067CA4C    pop         ebp
 0067CA4D    ret         0C
*}
end;

//0067CA54
procedure sub_0067CA54;
begin
{*
 0067CA54    mov         eax,[0081ECDC];gvar_0081ECDC:TObjectList
 0067CA59    mov         edx,dword ptr [eax]
 0067CA5B    call        dword ptr [edx+8]
 0067CA5E    ret
*}
end;

//0067CA60
procedure sub_0067CA60;
begin
{*
 0067CA60    push        ebx
 0067CA61    push        esi
 0067CA62    push        edi
 0067CA63    push        ebp
 0067CA64    add         esp,0FFFFFFF4
 0067CA67    xor         esi,esi
 0067CA69    mov         byte ptr [esp],1
>0067CA6D    jmp         0067CADF
 0067CA6F    mov         edi,dword ptr ds:[81ECDC];gvar_0081ECDC:TObjectList
 0067CA75    mov         edx,esi
 0067CA77    mov         eax,edi
 0067CA79    call        TList.Get
 0067CA7E    mov         ebp,eax
 0067CA80    mov         eax,ebp
 0067CA82    mov         edx,dword ptr ds:[67AA18];TWaitItem
 0067CA88    call        @AsClass
 0067CA8D    mov         edx,dword ptr [eax]
 0067CA8F    call        dword ptr [edx];TWaitItem.Evaluate
 0067CA91    test        al,al
>0067CA93    je          0067CADE
 0067CA95    cmp         byte ptr [esp],0
>0067CA99    je          0067CACB
 0067CA9B    mov         eax,[0081ECDC];gvar_0081ECDC:TObjectList
 0067CAA0    mov         dword ptr [esp+4],eax
 0067CAA4    mov         edx,esi
 0067CAA6    mov         eax,dword ptr [esp+4]
 0067CAAA    call        TList.Get
 0067CAAF    mov         dword ptr [esp+8],eax
 0067CAB3    mov         eax,dword ptr [esp+8]
 0067CAB7    mov         edx,dword ptr ds:[67AA18];TWaitItem
 0067CABD    call        @AsClass
 0067CAC2    mov         edx,dword ptr [eax]
 0067CAC4    call        dword ptr [edx+4];TWaitItem.Execute
 0067CAC7    mov         ebx,eax
>0067CAC9    jmp         0067CACD
 0067CACB    xor         ebx,ebx
 0067CACD    mov         byte ptr [esp],bl
 0067CAD0    mov         edx,esi
 0067CAD2    mov         eax,[0081ECDC];gvar_0081ECDC:TObjectList
 0067CAD7    call        TList.Delete
>0067CADC    jmp         0067CADF
 0067CADE    inc         esi
 0067CADF    mov         eax,[0081ECDC];gvar_0081ECDC:TObjectList
 0067CAE4    cmp         esi,dword ptr [eax+8]
>0067CAE7    jl          0067CA6F
 0067CAE9    movzx       eax,byte ptr [esp]
 0067CAED    add         esp,0C
 0067CAF0    pop         ebp
 0067CAF1    pop         edi
 0067CAF2    pop         esi
 0067CAF3    pop         ebx
 0067CAF4    ret
*}
end;

//0067CAF8
procedure sub_0067CAF8;
begin
{*
 0067CAF8    mov         eax,[0081ECE0];gvar_0081ECE0:TObjectList
 0067CAFD    mov         edx,dword ptr [eax]
 0067CAFF    call        dword ptr [edx+8]
 0067CB02    ret
*}
end;

//0067CB04
{*function sub_0067CB04:?;
begin
 0067CB04    push        ebp
 0067CB05    mov         ebp,esp
 0067CB07    add         esp,0FFFFFFF0
 0067CB0A    push        ebx
 0067CB0B    push        esi
 0067CB0C    push        edi
 0067CB0D    xor         eax,eax
 0067CB0F    mov         dword ptr [ebp-10],eax
 0067CB12    xor         eax,eax
 0067CB14    push        ebp
 0067CB15    push        67CBE4
 0067CB1A    push        dword ptr fs:[eax]
 0067CB1D    mov         dword ptr fs:[eax],esp
 0067CB20    xor         eax,eax
 0067CB22    push        ebp
 0067CB23    push        67CBC7
 0067CB28    push        dword ptr fs:[eax]
 0067CB2B    mov         dword ptr fs:[eax],esp
 0067CB2E    xor         esi,esi
 0067CB30    mov         byte ptr [ebp-1],1
>0067CB34    jmp         0067CBA8
 0067CB36    mov         edi,dword ptr ds:[81ECE0];gvar_0081ECE0:TObjectList
 0067CB3C    mov         edx,esi
 0067CB3E    mov         eax,edi
 0067CB40    call        TList.Get
 0067CB45    mov         dword ptr [ebp-0C],eax
 0067CB48    mov         ebx,dword ptr [ebp-0C]
 0067CB4B    test        ebx,ebx
>0067CB4D    je          0067CB78
 0067CB4F    mov         eax,ebx
 0067CB51    mov         edx,dword ptr ds:[67F010];TUpdatingExpression
 0067CB57    call        @IsClass
 0067CB5C    test        al,al
>0067CB5E    je          0067CB78
 0067CB60    mov         dword ptr [ebp-8],ebx
 0067CB63    mov         edx,dword ptr ds:[78CB88];^gvar_0078BDC0
 0067CB69    mov         edx,dword ptr [edx]
 0067CB6B    mov         eax,dword ptr [ebp-8]
 0067CB6E    mov         ecx,dword ptr [eax]
 0067CB70    call        dword ptr [ecx+98]
>0067CB76    jmp         0067CBA7
 0067CB78    test        ebx,ebx
>0067CB7A    jne         0067CB88
 0067CB7C    mov         eax,67CC04;'Nil added to GlobalUpdateList'
 0067CB81    call        004FA5FC
>0067CB86    jmp         0067CBA7
 0067CB88    lea         edx,[ebp-10]
 0067CB8B    mov         eax,dword ptr [ebx]
 0067CB8D    call        TObject.ClassName
 0067CB92    lea         eax,[ebp-10]
 0067CB95    mov         edx,67CC4C;' added to GlobalUpdateList'
 0067CB9A    call        @UStrCat
 0067CB9F    mov         eax,dword ptr [ebp-10]
 0067CBA2    call        004FA5FC
 0067CBA7    inc         esi
 0067CBA8    mov         eax,[0081ECE0];gvar_0081ECE0:TObjectList
 0067CBAD    cmp         esi,dword ptr [eax+8]
>0067CBB0    jl          0067CB36
 0067CBB2    xor         eax,eax
 0067CBB4    pop         edx
 0067CBB5    pop         ecx
 0067CBB6    pop         ecx
 0067CBB7    mov         dword ptr fs:[eax],edx
 0067CBBA    push        67CBCE
 0067CBBF    mov         eax,[0078CB88];^gvar_0078BDC0
 0067CBC4    inc         dword ptr [eax]
 0067CBC6    ret
>0067CBC7    jmp         @HandleFinally
>0067CBCC    jmp         0067CBBF
 0067CBCE    xor         eax,eax
 0067CBD0    pop         edx
 0067CBD1    pop         ecx
 0067CBD2    pop         ecx
 0067CBD3    mov         dword ptr fs:[eax],edx
 0067CBD6    push        67CBEB
 0067CBDB    lea         eax,[ebp-10]
 0067CBDE    call        @UStrClr
 0067CBE3    ret
>0067CBE4    jmp         @HandleFinally
>0067CBE9    jmp         0067CBDB
 0067CBEB    movzx       eax,byte ptr [ebp-1]
 0067CBEF    pop         edi
 0067CBF0    pop         esi
 0067CBF1    pop         ebx
 0067CBF2    mov         esp,ebp
 0067CBF4    pop         ebp
 0067CBF5    ret
end;*}

//0067CC84
function TWaitItem.Evaluate:Boolean;
begin
{*
 0067CC84    push        ebx
 0067CC85    mov         ebx,eax
 0067CC87    call        Now
 0067CC8C    fcomp       qword ptr [ebx+8];TWaitItem.TimeToTrigger:TDateTime
 0067CC8F    wait
 0067CC90    fnstsw      al
 0067CC92    sahf
 0067CC93    setae       al
 0067CC96    pop         ebx
 0067CC97    ret
*}
end;

//0067CC98
procedure TWaitItem.Execute;
begin
{*
 0067CC98    push        ebx
 0067CC99    push        esi
 0067CC9A    add         esp,0FFFFFFE8
 0067CC9D    mov         esi,eax
 0067CC9F    mov         cl,1
 0067CCA1    mov         edx,dword ptr [esi+14];TWaitItem.StatementNumber:Integer
 0067CCA4    mov         eax,dword ptr [esi+10];TWaitItem.CodeBlock:TCodeBlock
 0067CCA7    mov         ebx,dword ptr [eax]
 0067CCA9    call        dword ptr [ebx+8];TCodeBlock.ExecuteAfterStatement
 0067CCAC    mov         ebx,eax
 0067CCAE    cmp         dword ptr [esi+18],0;TWaitItem.ForLoop:TForLoop
>0067CCB2    je          0067CD4A
 0067CCB8    mov         eax,dword ptr [esi+10];TWaitItem.CodeBlock:TCodeBlock
 0067CCBB    mov         byte ptr [eax+14],1;TCodeBlock.Blocked:Boolean
 0067CCBF    mov         eax,dword ptr [esi+18];TWaitItem.ForLoop:TForLoop
 0067CCC2    mov         eax,dword ptr [eax+18];TForLoop.Increment:TStatement
 0067CCC5    mov         dl,1
 0067CCC7    mov         ecx,dword ptr [eax]
 0067CCC9    call        dword ptr [ecx];TStatement.Execute
 0067CCCB    call        Now
 0067CCD0    fstp        qword ptr [esp]
 0067CCD3    wait
>0067CCD4    jmp         0067CD34
 0067CCD6    mov         eax,dword ptr [esi+18];TWaitItem.ForLoop:TForLoop
 0067CCD9    mov         eax,dword ptr [eax+1C];TForLoop.LoopCode:TStatement
 0067CCDC    mov         dl,1
 0067CCDE    mov         ecx,dword ptr [eax]
 0067CCE0    call        dword ptr [ecx];TStatement.Execute
 0067CCE2    mov         eax,dword ptr [esi+18];TWaitItem.ForLoop:TForLoop
 0067CCE5    mov         eax,dword ptr [eax+18];TForLoop.Increment:TStatement
 0067CCE8    mov         dl,1
 0067CCEA    mov         ecx,dword ptr [eax]
 0067CCEC    call        dword ptr [ecx];TStatement.Execute
 0067CCEE    call        Now
 0067CCF3    fstp        qword ptr [esp+8]
 0067CCF7    wait
 0067CCF8    fld         qword ptr [esp+8]
 0067CCFC    fsub        qword ptr [esp]
 0067CCFF    fmul        dword ptr ds:[67CD54];24:Single
 0067CD05    fmul        dword ptr ds:[67CD58];60:Single
 0067CD0B    fmul        dword ptr ds:[67CD58];60:Single
 0067CD11    fstp        qword ptr [esp+10]
 0067CD15    wait
 0067CD16    fld         tbyte ptr ds:[67CD5C];0.2:Extended
 0067CD1C    fcomp       qword ptr [esp+10]
 0067CD20    wait
 0067CD21    fnstsw      al
 0067CD23    sahf
>0067CD24    jae         0067CD34
 0067CD26    xor         edx,edx
 0067CD28    mov         eax,67CD74;'Infinite Loop!'
 0067CD2D    call        005D0620
>0067CD32    jmp         0067CD43
 0067CD34    mov         eax,dword ptr [esi+18];TWaitItem.ForLoop:TForLoop
 0067CD37    mov         eax,dword ptr [eax+14];TForLoop.Condition:TExpression
 0067CD3A    mov         edx,dword ptr [eax]
 0067CD3C    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0067CD3F    test        al,al
>0067CD41    jne         0067CCD6
 0067CD43    mov         eax,dword ptr [esi+10];TWaitItem.CodeBlock:TCodeBlock
 0067CD46    mov         byte ptr [eax+14],0;TCodeBlock.Blocked:Boolean
 0067CD4A    mov         eax,ebx
 0067CD4C    add         esp,18
 0067CD4F    pop         esi
 0067CD50    pop         ebx
 0067CD51    ret
*}
end;

//0067CD94
destructor TPressStatement.Destroy();
begin
{*
 0067CD94    push        ebx
 0067CD95    push        esi
 0067CD96    call        @BeforeDestruction
 0067CD9B    mov         ebx,edx
 0067CD9D    mov         esi,eax
 0067CD9F    lea         eax,[esi+1C];TPressStatement.expression:TExpression
 0067CDA2    call        0067B38C
 0067CDA7    mov         edx,ebx
 0067CDA9    and         dl,0FC
 0067CDAC    mov         eax,esi
 0067CDAE    call        TCall.Destroy
 0067CDB3    test        bl,bl
>0067CDB5    jle         0067CDBE
 0067CDB7    mov         eax,esi
 0067CDB9    call        @ClassDestroy
 0067CDBE    pop         esi
 0067CDBF    pop         ebx
 0067CDC0    ret
*}
end;

//0067CDC4
procedure TPressStatement.Execute(Background:Boolean);
begin
{*
 0067CDC4    cmp         byte ptr [eax+20],0;TPressStatement.Release:Boolean
>0067CDC8    je          0067CDD3
 0067CDCA    mov         eax,dword ptr [eax+1C];TPressStatement.expression:TExpression
 0067CDCD    mov         edx,dword ptr [eax]
 0067CDCF    call        dword ptr [edx+70];TExpression.Release
 0067CDD2    ret
 0067CDD3    mov         eax,dword ptr [eax+1C];TPressStatement.expression:TExpression
 0067CDD6    mov         edx,dword ptr [eax]
 0067CDD8    call        dword ptr [edx+6C];TExpression.Press
 0067CDDB    ret
*}
end;

//0067CDDC
procedure TPressStatement.SetIffy(IsIffy:Boolean);
begin
{*
 0067CDDC    push        ebx
 0067CDDD    push        esi
 0067CDDE    mov         ebx,edx
 0067CDE0    mov         esi,eax
 0067CDE2    mov         edx,ebx
 0067CDE4    mov         eax,esi
 0067CDE6    call        TStatement.SetIffy
 0067CDEB    mov         edx,ebx
 0067CDED    mov         eax,dword ptr [esi+1C];TPressStatement.expression:TExpression
 0067CDF0    mov         ecx,dword ptr [eax]
 0067CDF2    call        dword ptr [ecx+74];TExpression.SetIffy
 0067CDF5    pop         esi
 0067CDF6    pop         ebx
 0067CDF7    ret
*}
end;

//0067CDF8
{*procedure TPressStatement.ToString(?:?);
begin
 0067CDF8    push        ebp
 0067CDF9    mov         ebp,esp
 0067CDFB    xor         ecx,ecx
 0067CDFD    push        ecx
 0067CDFE    push        ecx
 0067CDFF    push        ecx
 0067CE00    push        ecx
 0067CE01    push        ebx
 0067CE02    push        esi
 0067CE03    mov         esi,edx
 0067CE05    mov         ebx,eax
 0067CE07    xor         eax,eax
 0067CE09    push        ebp
 0067CE0A    push        67CEBE
 0067CE0F    push        dword ptr fs:[eax]
 0067CE12    mov         dword ptr fs:[eax],esp
 0067CE15    cmp         byte ptr [ebx+20],0;TPressStatement.Release:Boolean
>0067CE19    je          0067CE41
 0067CE1B    push        67CED8;'Release('
 0067CE20    lea         edx,[ebp-4]
 0067CE23    mov         eax,dword ptr [ebx+1C];TPressStatement.expression:TExpression
 0067CE26    mov         ecx,dword ptr [eax]
 0067CE28    call        dword ptr [ecx-24];TExpression.ToString
 0067CE2B    push        dword ptr [ebp-4]
 0067CE2E    push        67CEF8;')'
 0067CE33    mov         eax,esi
 0067CE35    mov         edx,3
 0067CE3A    call        @UStrCatN
>0067CE3F    jmp         0067CE65
 0067CE41    push        67CF08;'Press('
 0067CE46    lea         edx,[ebp-8]
 0067CE49    mov         eax,dword ptr [ebx+1C];TPressStatement.expression:TExpression
 0067CE4C    mov         ecx,dword ptr [eax]
 0067CE4E    call        dword ptr [ecx-24];TExpression.ToString
 0067CE51    push        dword ptr [ebp-8]
 0067CE54    push        67CEF8;')'
 0067CE59    mov         eax,esi
 0067CE5B    mov         edx,3
 0067CE60    call        @UStrCatN
 0067CE65    push        67CF24;'{'
 0067CE6A    lea         edx,[ebp-0C]
 0067CE6D    mov         eax,dword ptr [ebx+8];TPressStatement.StartLine:Integer
 0067CE70    call        IntToStr
 0067CE75    push        dword ptr [ebp-0C]
 0067CE78    push        67CF34;'}'
 0067CE7D    push        dword ptr [esi]
 0067CE7F    push        67CF24;'{'
 0067CE84    lea         edx,[ebp-10]
 0067CE87    mov         eax,dword ptr [ebx+0C];TPressStatement.EndLine:Integer
 0067CE8A    call        IntToStr
 0067CE8F    push        dword ptr [ebp-10]
 0067CE92    push        67CF34;'}'
 0067CE97    mov         eax,esi
 0067CE99    mov         edx,7
 0067CE9E    call        @UStrCatN
 0067CEA3    xor         eax,eax
 0067CEA5    pop         edx
 0067CEA6    pop         ecx
 0067CEA7    pop         ecx
 0067CEA8    mov         dword ptr fs:[eax],edx
 0067CEAB    push        67CEC5
 0067CEB0    lea         eax,[ebp-10]
 0067CEB3    mov         edx,4
 0067CEB8    call        @UStrArrayClr
 0067CEBD    ret
>0067CEBE    jmp         @HandleFinally
>0067CEC3    jmp         0067CEB0
 0067CEC5    pop         esi
 0067CEC6    pop         ebx
 0067CEC7    mov         esp,ebp
 0067CEC9    pop         ebp
 0067CECA    ret
end;*}

//0067CF38
destructor TForLoop.Destroy();
begin
{*
 0067CF38    push        ebx
 0067CF39    push        esi
 0067CF3A    call        @BeforeDestruction
 0067CF3F    mov         ebx,edx
 0067CF41    mov         esi,eax
 0067CF43    lea         eax,[esi+10];TForLoop.Initial:TStatement
 0067CF46    call        0067B38C
 0067CF4B    lea         eax,[esi+14];TForLoop.Condition:TExpression
 0067CF4E    call        0067B38C
 0067CF53    lea         eax,[esi+18];TForLoop.Increment:TStatement
 0067CF56    call        0067B38C
 0067CF5B    lea         eax,[esi+1C];TForLoop.LoopCode:TStatement
 0067CF5E    call        0067B38C
 0067CF63    mov         edx,ebx
 0067CF65    and         dl,0FC
 0067CF68    mov         eax,esi
 0067CF6A    call        TObject.Destroy
 0067CF6F    test        bl,bl
>0067CF71    jle         0067CF7A
 0067CF73    mov         eax,esi
 0067CF75    call        @ClassDestroy
 0067CF7A    pop         esi
 0067CF7B    pop         ebx
 0067CF7C    ret
*}
end;

//0067CF80
procedure TForLoop.Execute(Background:Boolean);
begin
{*
 0067CF80    push        ebx
 0067CF81    push        esi
 0067CF82    push        edi
 0067CF83    add         esp,0FFFFFFE0
 0067CF86    mov         ebx,edx
 0067CF88    mov         esi,eax
 0067CF8A    mov         edi,dword ptr [esi+1C];TForLoop.LoopCode:TStatement
 0067CF8D    mov         eax,edi
 0067CF8F    mov         edx,dword ptr ds:[67A404];TCodeBlock
 0067CF95    call        @IsClass
 0067CF9A    test        al,al
>0067CF9C    je          0067CFAA
 0067CF9E    cmp         byte ptr [edi+14],0
>0067CFA2    je          0067CFAA
 0067CFA4    mov         byte ptr [esp],1
>0067CFA8    jmp         0067D028
 0067CFAA    mov         byte ptr [esp],1
 0067CFAE    mov         edx,ebx
 0067CFB0    mov         eax,dword ptr [esi+10];TForLoop.Initial:TStatement
 0067CFB3    mov         ecx,dword ptr [eax]
 0067CFB5    call        dword ptr [ecx];TStatement.Execute
 0067CFB7    call        Now
 0067CFBC    fstp        qword ptr [esp+8]
 0067CFC0    wait
>0067CFC1    jmp         0067D01C
 0067CFC3    mov         edx,ebx
 0067CFC5    mov         eax,dword ptr [esi+1C];TForLoop.LoopCode:TStatement
 0067CFC8    mov         ecx,dword ptr [eax]
 0067CFCA    call        dword ptr [ecx];TStatement.Execute
 0067CFCC    mov         edx,ebx
 0067CFCE    mov         eax,dword ptr [esi+18];TForLoop.Increment:TStatement
 0067CFD1    mov         ecx,dword ptr [eax]
 0067CFD3    call        dword ptr [ecx];TStatement.Execute
 0067CFD5    call        Now
 0067CFDA    fstp        qword ptr [esp+10]
 0067CFDE    wait
 0067CFDF    fld         qword ptr [esp+10]
 0067CFE3    fsub        qword ptr [esp+8]
 0067CFE7    fmul        dword ptr ds:[67D034];24:Single
 0067CFED    fmul        dword ptr ds:[67D038];60:Single
 0067CFF3    fmul        dword ptr ds:[67D038];60:Single
 0067CFF9    fstp        qword ptr [esp+18]
 0067CFFD    wait
 0067CFFE    fld         tbyte ptr ds:[67D03C];0.2:Extended
 0067D004    fcomp       qword ptr [esp+18]
 0067D008    wait
 0067D009    fnstsw      al
 0067D00B    sahf
>0067D00C    jae         0067D01C
 0067D00E    xor         edx,edx
 0067D010    mov         eax,67D054;'Infinite Loop!'
 0067D015    call        005D0620
>0067D01A    jmp         0067D028
 0067D01C    mov         eax,dword ptr [esi+14];TForLoop.Condition:TExpression
 0067D01F    mov         edx,dword ptr [eax]
 0067D021    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0067D024    test        al,al
>0067D026    jne         0067CFC3
 0067D028    movzx       eax,byte ptr [esp]
 0067D02C    add         esp,20
 0067D02F    pop         edi
 0067D030    pop         esi
 0067D031    pop         ebx
 0067D032    ret
*}
end;

//0067D074
procedure TForLoop.SetIffy(IsIffy:Boolean);
begin
{*
 0067D074    push        ebx
 0067D075    push        esi
 0067D076    mov         ebx,edx
 0067D078    mov         esi,eax
 0067D07A    mov         edx,ebx
 0067D07C    mov         eax,esi
 0067D07E    call        TStatement.SetIffy
 0067D083    mov         edx,ebx
 0067D085    mov         eax,dword ptr [esi+10];TForLoop.Initial:TStatement
 0067D088    mov         ecx,dword ptr [eax]
 0067D08A    call        dword ptr [ecx+4];TStatement.SetIffy
 0067D08D    mov         edx,ebx
 0067D08F    mov         eax,dword ptr [esi+14];TForLoop.Condition:TExpression
 0067D092    mov         ecx,dword ptr [eax]
 0067D094    call        dword ptr [ecx+74];TExpression.SetIffy
 0067D097    mov         edx,ebx
 0067D099    mov         eax,dword ptr [esi+18];TForLoop.Increment:TStatement
 0067D09C    mov         ecx,dword ptr [eax]
 0067D09E    call        dword ptr [ecx+4];TStatement.SetIffy
 0067D0A1    mov         edx,ebx
 0067D0A3    mov         eax,dword ptr [esi+1C];TForLoop.LoopCode:TStatement
 0067D0A6    mov         ecx,dword ptr [eax]
 0067D0A8    call        dword ptr [ecx+4];TStatement.SetIffy
 0067D0AB    pop         esi
 0067D0AC    pop         ebx
 0067D0AD    ret
*}
end;

//0067D0B0
{*procedure TForLoop.ToString(?:?);
begin
 0067D0B0    push        ebp
 0067D0B1    mov         ebp,esp
 0067D0B3    xor         ecx,ecx
 0067D0B5    push        ecx
 0067D0B6    push        ecx
 0067D0B7    push        ecx
 0067D0B8    push        ecx
 0067D0B9    push        ecx
 0067D0BA    push        ecx
 0067D0BB    push        ebx
 0067D0BC    push        esi
 0067D0BD    mov         esi,edx
 0067D0BF    mov         ebx,eax
 0067D0C1    xor         eax,eax
 0067D0C3    push        ebp
 0067D0C4    push        67D180
 0067D0C9    push        dword ptr fs:[eax]
 0067D0CC    mov         dword ptr fs:[eax],esp
 0067D0CF    push        67D19C;'for('
 0067D0D4    lea         edx,[ebp-4]
 0067D0D7    mov         eax,dword ptr [ebx+10];TForLoop.Initial:TStatement
 0067D0DA    mov         ecx,dword ptr [eax]
 0067D0DC    call        dword ptr [ecx-24];TStatement.ToString
 0067D0DF    push        dword ptr [ebp-4]
 0067D0E2    push        67D1B4;';'
 0067D0E7    lea         edx,[ebp-8]
 0067D0EA    mov         eax,dword ptr [ebx+14];TForLoop.Condition:TExpression
 0067D0ED    mov         ecx,dword ptr [eax]
 0067D0EF    call        dword ptr [ecx-24];TExpression.ToString
 0067D0F2    push        dword ptr [ebp-8]
 0067D0F5    push        67D1B4;';'
 0067D0FA    lea         edx,[ebp-0C]
 0067D0FD    mov         eax,dword ptr [ebx+18];TForLoop.Increment:TStatement
 0067D100    mov         ecx,dword ptr [eax]
 0067D102    call        dword ptr [ecx-24];TStatement.ToString
 0067D105    push        dword ptr [ebp-0C]
 0067D108    push        67D1C4;') '
 0067D10D    lea         edx,[ebp-10]
 0067D110    mov         eax,dword ptr [ebx+1C];TForLoop.LoopCode:TStatement
 0067D113    mov         ecx,dword ptr [eax]
 0067D115    call        dword ptr [ecx-24];TStatement.ToString
 0067D118    push        dword ptr [ebp-10]
 0067D11B    mov         eax,esi
 0067D11D    mov         edx,8
 0067D122    call        @UStrCatN
 0067D127    push        67D1D8;'{'
 0067D12C    lea         edx,[ebp-14]
 0067D12F    mov         eax,dword ptr [ebx+8];TForLoop.StartLine:Integer
 0067D132    call        IntToStr
 0067D137    push        dword ptr [ebp-14]
 0067D13A    push        67D1E8;'}'
 0067D13F    push        dword ptr [esi]
 0067D141    push        67D1D8;'{'
 0067D146    lea         edx,[ebp-18]
 0067D149    mov         eax,dword ptr [ebx+0C];TForLoop.EndLine:Integer
 0067D14C    call        IntToStr
 0067D151    push        dword ptr [ebp-18]
 0067D154    push        67D1E8;'}'
 0067D159    mov         eax,esi
 0067D15B    mov         edx,7
 0067D160    call        @UStrCatN
 0067D165    xor         eax,eax
 0067D167    pop         edx
 0067D168    pop         ecx
 0067D169    pop         ecx
 0067D16A    mov         dword ptr fs:[eax],edx
 0067D16D    push        67D187
 0067D172    lea         eax,[ebp-18]
 0067D175    mov         edx,6
 0067D17A    call        @UStrArrayClr
 0067D17F    ret
>0067D180    jmp         @HandleFinally
>0067D185    jmp         0067D172
 0067D187    pop         esi
 0067D188    pop         ebx
 0067D189    mov         esp,ebp
 0067D18B    pop         ebp
 0067D18C    ret
end;*}

//0067D1EC
function TNullStatement.Execute(Background:Boolean):Boolean;
begin
{*
 0067D1EC    mov         al,1
 0067D1EE    ret
*}
end;

//0067D1F0
{*procedure TNullStatement.ToString(?:?);
begin
 0067D1F0    push        ebp
 0067D1F1    mov         ebp,esp
 0067D1F3    push        0
 0067D1F5    push        0
 0067D1F7    push        ebx
 0067D1F8    push        esi
 0067D1F9    mov         esi,edx
 0067D1FB    mov         ebx,eax
 0067D1FD    xor         eax,eax
 0067D1FF    push        ebp
 0067D200    push        67D26B
 0067D205    push        dword ptr fs:[eax]
 0067D208    mov         dword ptr fs:[eax],esp
 0067D20B    mov         eax,esi
 0067D20D    call        @UStrClr
 0067D212    push        67D284;'{'
 0067D217    lea         edx,[ebp-4]
 0067D21A    mov         eax,dword ptr [ebx+8];TNullStatement.StartLine:Integer
 0067D21D    call        IntToStr
 0067D222    push        dword ptr [ebp-4]
 0067D225    push        67D294;'}'
 0067D22A    push        dword ptr [esi]
 0067D22C    push        67D284;'{'
 0067D231    lea         edx,[ebp-8]
 0067D234    mov         eax,dword ptr [ebx+0C];TNullStatement.EndLine:Integer
 0067D237    call        IntToStr
 0067D23C    push        dword ptr [ebp-8]
 0067D23F    push        67D294;'}'
 0067D244    mov         eax,esi
 0067D246    mov         edx,7
 0067D24B    call        @UStrCatN
 0067D250    xor         eax,eax
 0067D252    pop         edx
 0067D253    pop         ecx
 0067D254    pop         ecx
 0067D255    mov         dword ptr fs:[eax],edx
 0067D258    push        67D272
 0067D25D    lea         eax,[ebp-8]
 0067D260    mov         edx,2
 0067D265    call        @UStrArrayClr
 0067D26A    ret
>0067D26B    jmp         @HandleFinally
>0067D270    jmp         0067D25D
 0067D272    pop         esi
 0067D273    pop         ebx
 0067D274    pop         ecx
 0067D275    pop         ecx
 0067D276    pop         ebp
 0067D277    ret
end;*}

//0067D298
constructor TProcedureStatement.Create;
begin
{*
 0067D298    test        dl,dl
>0067D29A    je          0067D2A4
 0067D29C    add         esp,0FFFFFFF0
 0067D29F    call        @ClassCreate
 0067D2A4    test        dl,dl
>0067D2A6    je          0067D2B7
 0067D2A8    call        @AfterConstruction
 0067D2AD    pop         dword ptr fs:[0]
 0067D2B4    add         esp,0C
 0067D2B7    ret
*}
end;

//0067D2B8
destructor TProcedureStatement.Destroy();
begin
{*
 0067D2B8    push        ebx
 0067D2B9    push        esi
 0067D2BA    call        @BeforeDestruction
 0067D2BF    mov         ebx,edx
 0067D2C1    mov         esi,eax
 0067D2C3    lea         eax,[esi+1C];TProcedureStatement................Proc:TProcedureExpression
 0067D2C6    call        0067B38C
 0067D2CB    mov         edx,ebx
 0067D2CD    and         dl,0FC
 0067D2D0    mov         eax,esi
 0067D2D2    call        TCall.Destroy
 0067D2D7    test        bl,bl
>0067D2D9    jle         0067D2E2
 0067D2DB    mov         eax,esi
 0067D2DD    call        @ClassDestroy
 0067D2E2    pop         esi
 0067D2E3    pop         ebx
 0067D2E4    ret
*}
end;

//0067D2E8
function TProcedureStatement.Execute(Background:Boolean):Boolean;
begin
{*
 0067D2E8    mov         ecx,dword ptr [eax+1C];TProcedureStatement.................Proc:TProcedureExpression
 0067D2EB    test        ecx,ecx
>0067D2ED    je          0067D2FA
 0067D2EF    mov         eax,ecx
 0067D2F1    mov         ecx,dword ptr [eax]
 0067D2F3    call        dword ptr [ecx+98];TProcedureExpression.Execute
 0067D2F9    ret
 0067D2FA    xor         eax,eax
 0067D2FC    ret
*}
end;

//0067D300
procedure TProcedureStatement.SetIffy(IsIffy:Boolean);
begin
{*
 0067D300    push        ebx
 0067D301    push        esi
 0067D302    mov         ebx,edx
 0067D304    mov         esi,eax
 0067D306    mov         edx,ebx
 0067D308    mov         eax,esi
 0067D30A    call        TStatement.SetIffy
 0067D30F    mov         eax,dword ptr [esi+1C];TProcedureStatement..................Proc:TProcedureExpression
 0067D312    test        eax,eax
>0067D314    je          0067D31D
 0067D316    mov         edx,ebx
 0067D318    mov         ecx,dword ptr [eax]
 0067D31A    call        dword ptr [ecx+74];TExpression.SetIffy
 0067D31D    pop         esi
 0067D31E    pop         ebx
 0067D31F    ret
*}
end;

//0067D320
{*procedure TProcedureStatement.ToString(?:?);
begin
 0067D320    push        ebp
 0067D321    mov         ebp,esp
 0067D323    push        0
 0067D325    push        0
 0067D327    push        ebx
 0067D328    push        esi
 0067D329    push        edi
 0067D32A    mov         esi,edx
 0067D32C    mov         ebx,eax
 0067D32E    xor         eax,eax
 0067D330    push        ebp
 0067D331    push        67D3B0
 0067D336    push        dword ptr fs:[eax]
 0067D339    mov         dword ptr fs:[eax],esp
 0067D33C    mov         edi,dword ptr [ebx+1C];TProcedureStatement...................Proc:TProcedureExpression
 0067D33F    test        edi,edi
>0067D341    je          0067D34E
 0067D343    mov         edx,esi
 0067D345    mov         eax,edi
 0067D347    mov         ecx,dword ptr [eax]
 0067D349    call        dword ptr [ecx-24];TProcedureExpression.ToString
>0067D34C    jmp         0067D357
 0067D34E    mov         edx,esi
 0067D350    mov         eax,ebx
 0067D352    call        TCall.ToString
 0067D357    push        67D3CC;'{'
 0067D35C    lea         edx,[ebp-4]
 0067D35F    mov         eax,dword ptr [ebx+8];TProcedureStatement.StartLine:Integer
 0067D362    call        IntToStr
 0067D367    push        dword ptr [ebp-4]
 0067D36A    push        67D3DC;'}'
 0067D36F    push        dword ptr [esi]
 0067D371    push        67D3CC;'{'
 0067D376    lea         edx,[ebp-8]
 0067D379    mov         eax,dword ptr [ebx+0C];TProcedureStatement.EndLine:Integer
 0067D37C    call        IntToStr
 0067D381    push        dword ptr [ebp-8]
 0067D384    push        67D3DC;'}'
 0067D389    mov         eax,esi
 0067D38B    mov         edx,7
 0067D390    call        @UStrCatN
 0067D395    xor         eax,eax
 0067D397    pop         edx
 0067D398    pop         ecx
 0067D399    pop         ecx
 0067D39A    mov         dword ptr fs:[eax],edx
 0067D39D    push        67D3B7
 0067D3A2    lea         eax,[ebp-8]
 0067D3A5    mov         edx,2
 0067D3AA    call        @UStrArrayClr
 0067D3AF    ret
>0067D3B0    jmp         @HandleFinally
>0067D3B5    jmp         0067D3A2
 0067D3B7    pop         edi
 0067D3B8    pop         esi
 0067D3B9    pop         ebx
 0067D3BA    pop         ecx
 0067D3BB    pop         ecx
 0067D3BC    pop         ebp
 0067D3BD    ret
end;*}

Initialization
//00781F40
{*
 00781F40    push        ebp
 00781F41    mov         ebp,esp
 00781F43    push        ebx
 00781F44    push        esi
 00781F45    push        edi
 00781F46    sub         dword ptr ds:[81ECEC],1
>00781F4D    jae         00781FD8
 00781F53    xor         edx,edx
 00781F55    push        ebp
 00781F56    push        781FBD
 00781F5B    push        dword ptr fs:[edx]
 00781F5E    mov         dword ptr fs:[edx],esp
 00781F61    mov         eax,781FEC;'Initializing PieStatement'
 00781F66    call        004FA5FC
 00781F6B    mov         dl,1
 00781F6D    mov         eax,[00679C48];TComment
 00781F72    call        TObject.Create;TComment.Create
 00781F77    mov         [0081ECE4],eax;gvar_0081ECE4:TComment
 00781F7C    mov         dl,1
 00781F7E    mov         eax,[00679D60];TElseStatement
 00781F83    call        TObject.Create;TElseStatement.Create
 00781F88    mov         [0081ECE8],eax;gvar_0081ECE8:TElseStatement
 00781F8D    mov         cl,1
 00781F8F    mov         dl,1
 00781F91    mov         eax,[00471630];TObjectList
 00781F96    call        TObjectList.Create;TObjectList.Create
 00781F9B    mov         [0081ECDC],eax;gvar_0081ECDC:TObjectList
 00781FA0    xor         ecx,ecx
 00781FA2    mov         dl,1
 00781FA4    mov         eax,[00471630];TObjectList
 00781FA9    call        TObjectList.Create;TObjectList.Create
 00781FAE    mov         [0081ECE0],eax;gvar_0081ECE0:TObjectList
 00781FB3    xor         eax,eax
 00781FB5    pop         edx
 00781FB6    pop         ecx
 00781FB7    pop         ecx
 00781FB8    mov         dword ptr fs:[eax],edx
>00781FBB    jmp         00781FD8
>00781FBD    jmp         @HandleOnException
 00781FC2    dd          1
 00781FC6    dd          00418C04;Exception
 00781FCA    dd          00781FCE
 00781FCE    call        004FA644
 00781FD3    call        @DoneExcept
 00781FD8    pop         edi
 00781FD9    pop         esi
 00781FDA    pop         ebx
 00781FDB    pop         ebp
 00781FDC    ret
*}
Finalization
//0067D3E0
{*
 0067D3E0    push        ebp
 0067D3E1    mov         ebp,esp
 0067D3E3    push        ebx
 0067D3E4    push        esi
 0067D3E5    push        edi
 0067D3E6    inc         dword ptr ds:[81ECEC]
>0067D3EC    jne         0067D463
 0067D3EE    xor         edx,edx
 0067D3F0    push        ebp
 0067D3F1    push        67D448
 0067D3F6    push        dword ptr fs:[edx]
 0067D3F9    mov         dword ptr fs:[edx],esp
 0067D3FC    mov         eax,67D474;'Finalizing PieStatement'
 0067D401    call        004FA5FC
 0067D406    mov         eax,[0081ECE4];gvar_0081ECE4:TComment
 0067D40B    xor         edx,edx
 0067D40D    mov         dword ptr ds:[81ECE4],edx;gvar_0081ECE4:TComment
 0067D413    call        TObject.Free
 0067D418    mov         eax,[0081ECE8];gvar_0081ECE8:TElseStatement
 0067D41D    xor         edx,edx
 0067D41F    mov         dword ptr ds:[81ECE8],edx;gvar_0081ECE8:TElseStatement
 0067D425    call        TObject.Free
 0067D42A    mov         eax,81ECDC;gvar_0081ECDC:TObjectList
 0067D42F    call        0067B38C
 0067D434    mov         eax,81ECE0;gvar_0081ECE0:TObjectList
 0067D439    call        0067B38C
 0067D43E    xor         eax,eax
 0067D440    pop         edx
 0067D441    pop         ecx
 0067D442    pop         ecx
 0067D443    mov         dword ptr fs:[eax],edx
>0067D446    jmp         0067D463
>0067D448    jmp         @HandleOnException
 0067D44D    dd          1
 0067D451    dd          00418C04;Exception
 0067D455    dd          0067D459
 0067D459    call        004FA644
 0067D45E    call        @DoneExcept
 0067D463    pop         edi
 0067D464    pop         esi
 0067D465    pop         ebx
 0067D466    pop         ebp
 0067D467    ret
*}
end.