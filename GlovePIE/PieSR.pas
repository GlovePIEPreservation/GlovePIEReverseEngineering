//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieSR;

interface

uses
  SysUtils, Classes, SpeechLib_TLB, PieSpeech;

type
  TSaidValue = class(TExpression)
  published
    procedure FillClone(c:TExpression);//006C180C
    procedure CreateClone;//006C17FC
    function SetString(NewValue:string):Boolean;//006C1C3C
    //procedure SetValue(NewValue:Double; ?:?);//006C1D20
    //procedure GetString(?:?);//006C1A94
    procedure SetPhrase(s:string);//006C1BA4
    function CanSet:Boolean;//006C17EC
    function GetDataType:TDataType;//006C1A7C
    //procedure ToString(?:?);//006C1D78
    procedure GetValue;//006C1B04
    function GetBoolean:Boolean;//006C183C
  public
    Phrase:string;//f18
    Confidence:Integer;//f1C
    Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006C1D78
    procedure GetValue; virtual;//v2C//006C1B04
    function GetBoolean:Boolean; virtual;//v30//006C183C
    //procedure GetString(?:?); virtual;//v38//006C1A94
    function GetDataType:TDataType; virtual;//v44//006C1A7C
    //procedure SetValue(NewValue:Double; ?:?); virtual;//v58//006C1D20
    function SetString(NewValue:string):Boolean; virtual;//v5C//006C1C3C
    function CanSet:Boolean; virtual;//v68//006C17EC
    procedure CreateClone; virtual;//v80//006C17FC
    procedure FillClone(c:TExpression); virtual;//v84//006C180C
  end;
  TSpeechState = TSpeechState = record//size=38
f10:string;//f10
f1C:string;//f1C
f20:string;//f20
f2C:string;//f2C
end;
Confidence:Integer;//f0
FinishedRecognising:Boolean;//f4
TooQuiet:Boolean;//f5
TooLoud:Boolean;//f6
Noise:Boolean;//f7
NoSignal:Boolean;//f8
TooFast:Boolean;//f9
TooSlow:Boolean;//fA
SaidToOtherSoftware:Boolean;//fB
WasRequest:Boolean;//fC
RecognisedPhrase:string;//f10
RecognisedConfidence:Integer;//f14
RecognisedAlready:Boolean;//f18
FalselyRecognisedAlready:Boolean;//f19
FalsePhrase:string;//f1C
CurrentPhrase:string;//f20
CurrentConfidence:Integer;//f24
CurrentRegistered:Boolean;//f28
PartialPhrase:string;//f2C
AudioLevel:Integer;//f30
InSound:Boolean;//f34
InPhrase:Boolean;//f35
end;;
  TSpeechRecogniser = class(TObject)
  published
    procedure SpSharedRecoContextFalseRecognition(ASender:TObject; StreamNumber:Integer; Result:ISpeechRecoResult; StreamPosition:OleVariant);//006C0C2C
    procedure SpSharedRecoContextInterference(ASender:TObject; StreamNumber:Integer; Interference:TOleEnum; StreamPosition:OleVariant);//006C1028
    procedure SpSharedRecoContextPropertyStringChange(ASender:TObject; StreamNumber:Integer; NewStringValue:WideString; PropertyName:WideString; StreamPosition:OleVariant);//006C0B5C
    procedure SpSharedRecoContextPhraseStart(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);//006C09E0
    procedure SpSharedRecoContextPropertyNumberChange(ASender:TObject; StreamNumber:Integer; NewNumberValue:Integer; PropertyName:WideString; StreamPosition:OleVariant);//006C0A78
    procedure SpSharedRecoContextRequestUI(ASender:TObject; StreamNumber:Integer; UIType:WideString; StreamPosition:OleVariant);//006C1318
    procedure SpSharedRecoContextAudioLevel(ASender:TObject; StreamNumber:Integer; AudioLevel:Integer; StreamPosition:OleVariant);//006C159C
    procedure SpSharedRecoContextEnginePrivate(ASender:TObject; StreamNumber:Integer; EngineData:OleVariant; StreamPosition:OleVariant);//006C1658
    procedure SpSharedRecoContextRecognitionForOtherContext(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);//006C14CC
    procedure SpSharedRecoContextRecognizerStateChange(ASender:TObject; StreamNumber:Integer; NewState:TOleEnum; StreamPosition:OleVariant);//006C13C0
    procedure SpSharedRecoContextAdaptation(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);//006C1450
    procedure SpSharedRecoContextBookmark(ASender:TObject; StreamNumber:Integer; Options:TOleEnum; BookmarkId:OleVariant; StreamPosition:OleVariant);//006C094C
    procedure CreateGrammar;//006BDA54
    procedure ClearState;//006C2594
    procedure AddWord(word:string);//006BD8BC
    constructor Create;//006C1F70
    destructor Destroy();//006C2538
    procedure SpSharedRecoContextRecognition(ASender:TObject; StreamNumber:Integer; Result:ISpeechRecoResult; RecognitionType:TOleEnum; StreamPosition:OleVariant);//006BFD84
    procedure SpSharedRecoContextStartStream(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);//006C0858
    procedure SpSharedRecoContextEndStream(ASender:TObject; StreamNumber:Integer; StreamReleased:WordBool; StreamPosition:OleVariant);//006C08D4
    procedure SpSharedRecoContextSoundEnd(Sender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);//006C07CC
    procedure SpSharedRecoContextHypothesis(ASender:TObject; StreamNumber:Integer; Result:ISpeechRecoResult; StreamPosition:OleVariant);//006C0264
    procedure SpSharedRecoContextSoundStart(Sender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);//006C0734
  public
    State:TSpeechState;//f4
    SpSharedRecoContext:TSpSharedRecoContext;//f3C
    SpInprocRecoContext:TSpInProcRecoContext;//f40
    SRGrammar:ISpeechRecoGrammar;//f44
    Rule:ISpeechGrammarRule;//f48
    PreRequestState:ISpeechGrammarRuleState;//f4C
    ArticleState:ISpeechGrammarRuleState;//f50
    RequestState:ISpeechGrammarRuleState;//f54
    PostRequestState:ISpeechGrammarRuleState;//f58
    WordNumber:Integer;//f5C
  end;
    //function sub_006BD2D0(?:UnicodeString; ?:UnicodeString):?;//006BD2D0
    procedure sub_006BD37C;//006BD37C
    //function sub_006BD6D4(?:?):?;//006BD6D4
    procedure sub_006BD86C(?:UnicodeString);//006BD86C
    //procedure sub_006BD994(?:TSpeechRecogniser; ?:?);//006BD994
    procedure sub_006C16F8;//006C16F8
    procedure sub_006C1734;//006C1734
    procedure sub_006C1748;//006C1748
    procedure sub_006C17A0;//006C17A0
    //function sub_006C17BC:?;//006C17BC
    procedure sub_006C1F50;//006C1F50
    procedure sub_006C1F6C;//006C1F6C
    //function sub_006C25E0(?:UnicodeString):?;//006C25E0
    //procedure sub_006C2630(?:Integer; ?:?);//006C2630
    //function sub_006C2648:?;//006C2648
    //function sub_006C278C:?;//006C278C
    //function sub_006C2984(?:?):?;//006C2984

implementation

//006BD2D0
{*function sub_006BD2D0(?:UnicodeString; ?:UnicodeString):?;
begin
 006BD2D0    push        ebp
 006BD2D1    mov         ebp,esp
 006BD2D3    xor         ecx,ecx
 006BD2D5    push        ecx
 006BD2D6    push        ecx
 006BD2D7    push        ecx
 006BD2D8    push        ecx
 006BD2D9    push        ecx
 006BD2DA    push        ecx
 006BD2DB    push        ebx
 006BD2DC    mov         dword ptr [ebp-8],edx
 006BD2DF    mov         dword ptr [ebp-4],eax
 006BD2E2    mov         eax,dword ptr [ebp-4]
 006BD2E5    call        @UStrAddRef
 006BD2EA    mov         eax,dword ptr [ebp-8]
 006BD2ED    call        @UStrAddRef
 006BD2F2    xor         eax,eax
 006BD2F4    push        ebp
 006BD2F5    push        6BD36B
 006BD2FA    push        dword ptr fs:[eax]
 006BD2FD    mov         dword ptr fs:[eax],esp
 006BD300    lea         edx,[ebp-10]
 006BD303    mov         eax,dword ptr [ebp-4]
 006BD306    call        Trim
 006BD30B    mov         eax,dword ptr [ebp-10]
 006BD30E    lea         edx,[ebp-0C]
 006BD311    call        LowerCase
 006BD316    mov         edx,dword ptr [ebp-0C]
 006BD319    lea         eax,[ebp-4]
 006BD31C    call        @UStrLAsg
 006BD321    lea         edx,[ebp-18]
 006BD324    mov         eax,dword ptr [ebp-8]
 006BD327    call        Trim
 006BD32C    mov         eax,dword ptr [ebp-18]
 006BD32F    lea         edx,[ebp-14]
 006BD332    call        LowerCase
 006BD337    mov         edx,dword ptr [ebp-14]
 006BD33A    lea         eax,[ebp-8]
 006BD33D    call        @UStrLAsg
 006BD342    mov         eax,dword ptr [ebp-4]
 006BD345    mov         edx,dword ptr [ebp-8]
 006BD348    call        @UStrEqual
 006BD34D    sete        bl
 006BD350    xor         eax,eax
 006BD352    pop         edx
 006BD353    pop         ecx
 006BD354    pop         ecx
 006BD355    mov         dword ptr fs:[eax],edx
 006BD358    push        6BD372
 006BD35D    lea         eax,[ebp-18]
 006BD360    mov         edx,6
 006BD365    call        @UStrArrayClr
 006BD36A    ret
>006BD36B    jmp         @HandleFinally
>006BD370    jmp         006BD35D
 006BD372    mov         eax,ebx
 006BD374    pop         ebx
 006BD375    mov         esp,ebp
 006BD377    pop         ebp
 006BD378    ret
end;*}

//006BD37C
procedure sub_006BD37C;
begin
{*
 006BD37C    push        ebx
 006BD37D    mov         ebx,81F568;gvar_0081F568:THashTable
 006BD382    xor         ecx,ecx
 006BD384    mov         edx,6BD4B0;'Said'
 006BD389    mov         eax,dword ptr [ebx]
 006BD38B    call        THashTable.Add
 006BD390    mov         ecx,10
 006BD395    mov         edx,6BD4C8;'AskedFor'
 006BD39A    mov         eax,dword ptr [ebx]
 006BD39C    call        THashTable.Add
 006BD3A1    mov         ecx,1
 006BD3A6    mov         edx,6BD4E8;'TooLoud'
 006BD3AB    mov         eax,dword ptr [ebx]
 006BD3AD    call        THashTable.Add
 006BD3B2    mov         ecx,2
 006BD3B7    mov         edx,6BD504;'TooQuiet'
 006BD3BC    mov         eax,dword ptr [ebx]
 006BD3BE    call        THashTable.Add
 006BD3C3    mov         ecx,4
 006BD3C8    mov         edx,6BD524;'TooFast'
 006BD3CD    mov         eax,dword ptr [ebx]
 006BD3CF    call        THashTable.Add
 006BD3D4    mov         ecx,5
 006BD3D9    mov         edx,6BD540;'TooSlow'
 006BD3DE    mov         eax,dword ptr [ebx]
 006BD3E0    call        THashTable.Add
 006BD3E5    mov         ecx,3
 006BD3EA    mov         edx,6BD55C;'HeardNoise'
 006BD3EF    mov         eax,dword ptr [ebx]
 006BD3F1    call        THashTable.Add
 006BD3F6    mov         ecx,6
 006BD3FB    mov         edx,6BD580;'NoSignal'
 006BD400    mov         eax,dword ptr [ebx]
 006BD402    call        THashTable.Add
 006BD407    mov         ecx,7
 006BD40C    mov         edx,6BD5A0;'CompletePhrase'
 006BD411    mov         eax,dword ptr [ebx]
 006BD413    call        THashTable.Add
 006BD418    mov         ecx,8
 006BD41D    mov         edx,6BD5CC;'PartialPhrase'
 006BD422    mov         eax,dword ptr [ebx]
 006BD424    call        THashTable.Add
 006BD429    mov         ecx,9
 006BD42E    mov         edx,6BD5F4;'AudioLevel'
 006BD433    mov         eax,dword ptr [ebx]
 006BD435    call        THashTable.Add
 006BD43A    mov         ecx,0A
 006BD43F    mov         edx,6BD618;'InSound'
 006BD444    mov         eax,dword ptr [ebx]
 006BD446    call        THashTable.Add
 006BD44B    mov         ecx,0B
 006BD450    mov         edx,6BD634;'InPhrase'
 006BD455    mov         eax,dword ptr [ebx]
 006BD457    call        THashTable.Add
 006BD45C    mov         ecx,0C
 006BD461    mov         edx,6BD654;'Confidence'
 006BD466    mov         eax,dword ptr [ebx]
 006BD468    call        THashTable.Add
 006BD46D    mov         ecx,0D
 006BD472    mov         edx,6BD678;'Enabled'
 006BD477    mov         eax,dword ptr [ebx]
 006BD479    call        THashTable.Add
 006BD47E    mov         ecx,0E
 006BD483    mov         edx,6BD694;'PushToTalk'
 006BD488    mov         eax,dword ptr [ebx]
 006BD48A    call        THashTable.Add
 006BD48F    mov         ecx,0F
 006BD494    mov         edx,6BD6B8;'PushToNotTalk'
 006BD499    mov         eax,dword ptr [ebx]
 006BD49B    call        THashTable.Add
 006BD4A0    pop         ebx
 006BD4A1    ret
*}
end;

//006BD6D4
{*function sub_006BD6D4(?:?):?;
begin
 006BD6D4    push        ebp
 006BD6D5    mov         ebp,esp
 006BD6D7    xor         ecx,ecx
 006BD6D9    push        ecx
 006BD6DA    push        ecx
 006BD6DB    push        ecx
 006BD6DC    push        ecx
 006BD6DD    push        ebx
 006BD6DE    push        esi
 006BD6DF    mov         dword ptr [ebp-4],eax
 006BD6E2    mov         eax,dword ptr [ebp-4]
 006BD6E5    call        @UStrAddRef
 006BD6EA    xor         eax,eax
 006BD6EC    push        ebp
 006BD6ED    push        6BD7DC
 006BD6F2    push        dword ptr fs:[eax]
 006BD6F5    mov         dword ptr fs:[eax],esp
 006BD6F8    xor         ebx,ebx
 006BD6FA    lea         eax,[ebp-8]
 006BD6FD    mov         edx,dword ptr [ebp-4]
 006BD700    call        @UStrLAsg
 006BD705    lea         edx,[ebp-0C]
 006BD708    mov         eax,dword ptr [ebp-8]
 006BD70B    call        LowerCase
 006BD710    mov         eax,dword ptr [ebp-0C]
 006BD713    mov         edx,6BD7F8;'said'
 006BD718    call        @UStrEqual
>006BD71D    jne         006BD737
 006BD71F    mov         dl,1
 006BD721    mov         eax,[006BBEF4];TSaidValue
 006BD726    call        TObject.Create;TSaidValue.Create
 006BD72B    mov         ebx,eax
 006BD72D    xor         eax,eax
 006BD72F    mov         dword ptr [ebx+20],eax;TSaidValue.Item:Integer
>006BD732    jmp         006BD7C1
 006BD737    lea         edx,[ebp-10]
 006BD73A    mov         eax,dword ptr [ebp-8]
 006BD73D    call        LowerCase
 006BD742    mov         eax,dword ptr [ebp-10]
 006BD745    mov         edx,6BD810;'askedfor'
 006BD74A    call        @UStrEqual
>006BD74F    jne         006BD768
 006BD751    mov         dl,1
 006BD753    mov         eax,[006BBEF4];TSaidValue
 006BD758    call        TObject.Create;TSaidValue.Create
 006BD75D    mov         ebx,eax
 006BD75F    mov         dword ptr [ebx+20],10;TSaidValue.Item:Integer
>006BD766    jmp         006BD7C1
 006BD768    lea         eax,[ebp-8]
 006BD76B    mov         edx,6BD830;'Microphone'
 006BD770    call        004F9BD0
 006BD775    test        al,al
>006BD777    jne         006BD78A
 006BD779    lea         eax,[ebp-8]
 006BD77C    mov         edx,6BD854;'Mic'
 006BD781    call        004F9BD0
 006BD786    test        al,al
>006BD788    je          006BD7C1
 006BD78A    lea         eax,[ebp-8]
 006BD78D    mov         edx,6BD868;'.'
 006BD792    call        004F9BD0
 006BD797    test        al,al
>006BD799    je          006BD7C1
 006BD79B    mov         eax,dword ptr [ebp-8]
 006BD79E    call        006C25E0
 006BD7A3    mov         esi,eax
 006BD7A5    test        esi,esi
>006BD7A7    jl          006BD7C1
 006BD7A9    mov         dl,1
 006BD7AB    mov         eax,[006BBEF4];TSaidValue
 006BD7B0    call        TObject.Create;TSaidValue.Create
 006BD7B5    mov         ebx,eax
 006BD7B7    mov         dword ptr [ebx+20],esi;TSaidValue.Item:Integer
 006BD7BA    mov         byte ptr ds:[81F5B0],1;gvar_0081F5B0
 006BD7C1    xor         eax,eax
 006BD7C3    pop         edx
 006BD7C4    pop         ecx
 006BD7C5    pop         ecx
 006BD7C6    mov         dword ptr fs:[eax],edx
 006BD7C9    push        6BD7E3
 006BD7CE    lea         eax,[ebp-10]
 006BD7D1    mov         edx,4
 006BD7D6    call        @UStrArrayClr
 006BD7DB    ret
>006BD7DC    jmp         @HandleFinally
>006BD7E1    jmp         006BD7CE
 006BD7E3    mov         eax,ebx
 006BD7E5    pop         esi
 006BD7E6    pop         ebx
 006BD7E7    mov         esp,ebp
 006BD7E9    pop         ebp
 006BD7EA    ret
end;*}

//006BD86C
procedure sub_006BD86C(?:UnicodeString);
begin
{*
 006BD86C    push        ebp
 006BD86D    mov         ebp,esp
 006BD86F    push        ecx
 006BD870    mov         dword ptr [ebp-4],eax
 006BD873    mov         eax,dword ptr [ebp-4]
 006BD876    call        @UStrAddRef
 006BD87B    xor         eax,eax
 006BD87D    push        ebp
 006BD87E    push        6BD8B0
 006BD883    push        dword ptr fs:[eax]
 006BD886    mov         dword ptr fs:[eax],esp
 006BD889    cmp         byte ptr ds:[78BE8C],0;gvar_0078BE8C
>006BD890    je          006BD89A
 006BD892    mov         eax,dword ptr [ebp-4]
 006BD895    call        004F9EA0
 006BD89A    xor         eax,eax
 006BD89C    pop         edx
 006BD89D    pop         ecx
 006BD89E    pop         ecx
 006BD89F    mov         dword ptr fs:[eax],edx
 006BD8A2    push        6BD8B7
 006BD8A7    lea         eax,[ebp-4]
 006BD8AA    call        @UStrClr
 006BD8AF    ret
>006BD8B0    jmp         @HandleFinally
>006BD8B5    jmp         006BD8A7
 006BD8B7    pop         ecx
 006BD8B8    pop         ebp
 006BD8B9    ret
*}
end;

//006BD8BC
procedure TSpeechRecogniser.AddWord(word:string);
begin
{*
 006BD8BC    push        ebp
 006BD8BD    mov         ebp,esp
 006BD8BF    xor         ecx,ecx
 006BD8C1    push        ecx
 006BD8C2    push        ecx
 006BD8C3    push        ecx
 006BD8C4    push        ecx
 006BD8C5    push        ecx
 006BD8C6    push        ecx
 006BD8C7    push        ecx
 006BD8C8    push        ecx
 006BD8C9    push        ebx
 006BD8CA    mov         dword ptr [ebp-4],edx
 006BD8CD    mov         ebx,eax
 006BD8CF    mov         eax,dword ptr [ebp-4]
 006BD8D2    call        @UStrAddRef
 006BD8D7    xor         eax,eax
 006BD8D9    push        ebp
 006BD8DA    push        6BD970
 006BD8DF    push        dword ptr fs:[eax]
 006BD8E2    mov         dword ptr fs:[eax],esp
 006BD8E5    inc         dword ptr [ebx+5C];TSpeechRecogniser.WordNumber:Integer
 006BD8E8    lea         eax,[ebp-18]
 006BD8EB    mov         edx,dword ptr [ebx+5C];TSpeechRecogniser.WordNumber:Integer
 006BD8EE    mov         cl,0FC
 006BD8F0    call        @OleVarFromInt
 006BD8F5    push        3F800000
 006BD8FA    lea         eax,[ebp-18]
 006BD8FD    push        eax
 006BD8FE    push        1
 006BD900    push        6BD980
 006BD905    push        1
 006BD907    push        6BD990
 006BD90C    lea         eax,[ebp-1C]
 006BD90F    mov         edx,dword ptr [ebp-4]
 006BD912    call        @WStrFromUStr
 006BD917    mov         eax,dword ptr [ebp-1C]
 006BD91A    push        eax
 006BD91B    push        0
 006BD91D    lea         eax,[ebp-20]
 006BD920    call        @IntfClear
 006BD925    push        eax
 006BD926    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BD929    push        eax
 006BD92A    mov         eax,dword ptr [eax]
 006BD92C    call        dword ptr [eax+20]
 006BD92F    call        @CheckAutoResult
 006BD934    mov         eax,dword ptr [ebp-20]
 006BD937    push        eax
 006BD938    mov         eax,dword ptr [eax]
 006BD93A    call        dword ptr [eax+24]
 006BD93D    call        @CheckAutoResult
 006BD942    xor         eax,eax
 006BD944    pop         edx
 006BD945    pop         ecx
 006BD946    pop         ecx
 006BD947    mov         dword ptr fs:[eax],edx
 006BD94A    push        6BD977
 006BD94F    lea         eax,[ebp-20]
 006BD952    call        @IntfClear
 006BD957    lea         eax,[ebp-1C]
 006BD95A    call        @WStrClr
 006BD95F    lea         eax,[ebp-18]
 006BD962    call        @VarClr
 006BD967    lea         eax,[ebp-4]
 006BD96A    call        @UStrClr
 006BD96F    ret
>006BD970    jmp         @HandleFinally
>006BD975    jmp         006BD94F
 006BD977    pop         ebx
 006BD978    mov         esp,ebp
 006BD97A    pop         ebp
 006BD97B    ret
*}
end;

//006BD994
{*procedure sub_006BD994(?:TSpeechRecogniser; ?:?);
begin
 006BD994    push        ebp
 006BD995    mov         ebp,esp
 006BD997    xor         ecx,ecx
 006BD999    push        ecx
 006BD99A    push        ecx
 006BD99B    push        ecx
 006BD99C    push        ecx
 006BD99D    push        ecx
 006BD99E    push        ecx
 006BD99F    push        ecx
 006BD9A0    push        ebx
 006BD9A1    mov         dword ptr [ebp-4],edx
 006BD9A4    mov         ebx,eax
 006BD9A6    mov         eax,dword ptr [ebp-4]
 006BD9A9    call        @UStrAddRef
 006BD9AE    xor         eax,eax
 006BD9B0    push        ebp
 006BD9B1    push        6BDA28
 006BD9B6    push        dword ptr fs:[eax]
 006BD9B9    mov         dword ptr fs:[eax],esp
 006BD9BC    inc         dword ptr [ebx+5C]
 006BD9BF    lea         eax,[ebp-18]
 006BD9C2    mov         edx,dword ptr [ebp-4]
 006BD9C5    call        @OleVarFromUStr
 006BD9CA    push        3F800000
 006BD9CF    lea         eax,[ebp-18]
 006BD9D2    push        eax
 006BD9D3    push        2
 006BD9D5    push        6BDA38
 006BD9DA    push        1
 006BD9DC    push        6BDA50
 006BD9E1    lea         eax,[ebp-1C]
 006BD9E4    mov         edx,dword ptr [ebp-4]
 006BD9E7    call        @WStrFromUStr
 006BD9EC    mov         eax,dword ptr [ebp-1C]
 006BD9EF    push        eax
 006BD9F0    mov         eax,dword ptr [ebx+58]
 006BD9F3    push        eax
 006BD9F4    mov         eax,dword ptr [ebx+54]
 006BD9F7    push        eax
 006BD9F8    mov         eax,dword ptr [eax]
 006BD9FA    call        dword ptr [eax+24]
 006BD9FD    call        @CheckAutoResult
 006BDA02    xor         eax,eax
 006BDA04    pop         edx
 006BDA05    pop         ecx
 006BDA06    pop         ecx
 006BDA07    mov         dword ptr fs:[eax],edx
 006BDA0A    push        6BDA2F
 006BDA0F    lea         eax,[ebp-1C]
 006BDA12    call        @WStrClr
 006BDA17    lea         eax,[ebp-18]
 006BDA1A    call        @VarClr
 006BDA1F    lea         eax,[ebp-4]
 006BDA22    call        @UStrClr
 006BDA27    ret
>006BDA28    jmp         @HandleFinally
>006BDA2D    jmp         006BDA0F
 006BDA2F    pop         ebx
 006BDA30    mov         esp,ebp
 006BDA32    pop         ebp
 006BDA33    ret
end;*}

//006BDA54
procedure TSpeechRecogniser.CreateGrammar;
begin
{*
 006BDA54    push        ebp
 006BDA55    mov         ebp,esp
 006BDA57    mov         ecx,86
 006BDA5C    push        0
 006BDA5E    push        0
 006BDA60    dec         ecx
>006BDA61    jne         006BDA5C
 006BDA63    push        ebx
 006BDA64    push        esi
 006BDA65    push        edi
 006BDA66    mov         ebx,eax
 006BDA68    xor         eax,eax
 006BDA6A    push        ebp
 006BDA6B    push        6BF390
 006BDA70    push        dword ptr fs:[eax]
 006BDA73    mov         dword ptr fs:[eax],esp
 006BDA76    mov         eax,6BF3B0;'SpeechRecogniser.CreateCrammar'
 006BDA7B    call        004FA5FC
 006BDA80    mov         eax,dword ptr [ebx+3C];TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006BDA83    test        eax,eax
>006BDA85    je          006BDAB8
 006BDA87    mov         edx,5FFFF
 006BDA8C    call        005CC738
 006BDA91    lea         eax,[ebp-28]
 006BDA94    xor         edx,edx
 006BDA96    mov         cl,1
 006BDA98    call        @OleVarFromInt
 006BDA9D    lea         edx,[ebp-28]
 006BDAA0    lea         ecx,[ebp-18]
 006BDAA3    mov         eax,dword ptr [ebx+3C];TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006BDAA6    call        TSpSharedRecoContext.CreateGrammar
 006BDAAB    mov         edx,dword ptr [ebp-18]
 006BDAAE    lea         eax,[ebx+44];TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006BDAB1    call        @IntfCopy
>006BDAB6    jmp         006BDAEA
 006BDAB8    mov         edx,5FFFF
 006BDABD    mov         eax,dword ptr [ebx+40];TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006BDAC0    call        005CD7C8
 006BDAC5    lea         eax,[ebp-3C]
 006BDAC8    xor         edx,edx
 006BDACA    mov         cl,1
 006BDACC    call        @OleVarFromInt
 006BDAD1    lea         edx,[ebp-3C]
 006BDAD4    lea         ecx,[ebp-2C]
 006BDAD7    mov         eax,dword ptr [ebx+40];TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006BDADA    call        TSpInProcRecoContext.CreateGrammar
 006BDADF    mov         edx,dword ptr [ebp-2C]
 006BDAE2    lea         eax,[ebx+44];TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006BDAE5    call        @IntfCopy
 006BDAEA    lea         eax,[ebp-40]
 006BDAED    call        @IntfClear
 006BDAF2    push        eax
 006BDAF3    push        0
 006BDAF5    push        3
 006BDAF7    push        6BF3F4
 006BDAFC    lea         eax,[ebp-44]
 006BDAFF    call        @IntfClear
 006BDB04    push        eax
 006BDB05    mov         eax,dword ptr [ebx+44];TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006BDB08    push        eax
 006BDB09    mov         eax,dword ptr [eax]
 006BDB0B    call        dword ptr [eax+2C]
 006BDB0E    call        @CheckAutoResult
 006BDB13    mov         eax,dword ptr [ebp-44]
 006BDB16    push        eax
 006BDB17    mov         eax,dword ptr [eax]
 006BDB19    call        dword ptr [eax+30]
 006BDB1C    call        @CheckAutoResult
 006BDB21    mov         edx,dword ptr [ebp-40]
 006BDB24    lea         eax,[ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDB27    call        @IntfCopy
 006BDB2C    xor         eax,eax
 006BDB2E    mov         dword ptr [ebx+5C],eax;TSpeechRecogniser.WordNumber:Integer
 006BDB31    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 006BDB36    mov         edx,dword ptr [eax]
 006BDB38    call        dword ptr [edx+14]
 006BDB3B    mov         esi,eax
 006BDB3D    dec         esi
 006BDB3E    test        esi,esi
>006BDB40    jl          006BDB6A
 006BDB42    inc         esi
 006BDB43    mov         dword ptr [ebp-14],0
 006BDB4A    lea         ecx,[ebp-48]
 006BDB4D    mov         edx,dword ptr [ebp-14]
 006BDB50    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 006BDB55    mov         edi,dword ptr [eax]
 006BDB57    call        dword ptr [edi+0C]
 006BDB5A    mov         edx,dword ptr [ebp-48]
 006BDB5D    mov         eax,ebx
 006BDB5F    call        TSpeechRecogniser.AddWord
 006BDB64    inc         dword ptr [ebp-14]
 006BDB67    dec         esi
>006BDB68    jne         006BDB4A
 006BDB6A    lea         eax,[ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDB6D    call        @IntfClear
 006BDB72    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 006BDB77    mov         edx,dword ptr [eax]
 006BDB79    call        dword ptr [edx+14]
 006BDB7C    test        eax,eax
>006BDB7E    jle         006BF2A6
 006BDB84    lea         eax,[ebp-4C]
 006BDB87    call        @IntfClear
 006BDB8C    push        eax
 006BDB8D    push        0
 006BDB8F    push        3
 006BDB91    push        6BF404
 006BDB96    lea         eax,[ebp-50]
 006BDB99    call        @IntfClear
 006BDB9E    push        eax
 006BDB9F    mov         eax,dword ptr [ebx+44];TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006BDBA2    push        eax
 006BDBA3    mov         eax,dword ptr [eax]
 006BDBA5    call        dword ptr [eax+2C]
 006BDBA8    call        @CheckAutoResult
 006BDBAD    mov         eax,dword ptr [ebp-50]
 006BDBB0    push        eax
 006BDBB1    mov         eax,dword ptr [eax]
 006BDBB3    call        dword ptr [eax+30]
 006BDBB6    call        @CheckAutoResult
 006BDBBB    mov         edx,dword ptr [ebp-4C]
 006BDBBE    lea         eax,[ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDBC1    call        @IntfCopy
 006BDBC6    xor         eax,eax
 006BDBC8    mov         dword ptr [ebx+5C],eax;TSpeechRecogniser.WordNumber:Integer
 006BDBCB    lea         eax,[ebp-54]
 006BDBCE    call        @IntfClear
 006BDBD3    push        eax
 006BDBD4    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDBD7    push        eax
 006BDBD8    mov         eax,dword ptr [eax]
 006BDBDA    call        dword ptr [eax+34]
 006BDBDD    call        @CheckAutoResult
 006BDBE2    mov         edx,dword ptr [ebp-54]
 006BDBE5    lea         eax,[ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDBE8    call        @IntfCopy
 006BDBED    lea         eax,[ebp-58]
 006BDBF0    call        @IntfClear
 006BDBF5    push        eax
 006BDBF6    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDBF9    push        eax
 006BDBFA    mov         eax,dword ptr [eax]
 006BDBFC    call        dword ptr [eax+34]
 006BDBFF    call        @CheckAutoResult
 006BDC04    mov         edx,dword ptr [ebp-58]
 006BDC07    lea         eax,[ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDC0A    call        @IntfCopy
 006BDC0F    lea         eax,[ebp-5C]
 006BDC12    call        @IntfClear
 006BDC17    push        eax
 006BDC18    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDC1B    push        eax
 006BDC1C    mov         eax,dword ptr [eax]
 006BDC1E    call        dword ptr [eax+34]
 006BDC21    call        @CheckAutoResult
 006BDC26    mov         edx,dword ptr [ebp-5C]
 006BDC29    lea         eax,[ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BDC2C    call        @IntfCopy
 006BDC31    lea         eax,[ebp-60]
 006BDC34    call        @IntfClear
 006BDC39    push        eax
 006BDC3A    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDC3D    push        eax
 006BDC3E    mov         eax,dword ptr [eax]
 006BDC40    call        dword ptr [eax+34]
 006BDC43    call        @CheckAutoResult
 006BDC48    mov         edx,dword ptr [ebp-60]
 006BDC4B    lea         eax,[ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BDC4E    call        @IntfCopy
 006BDC53    lea         eax,[ebp-10]
 006BDC56    xor         edx,edx
 006BDC58    mov         cl,1
 006BDC5A    call        @OleVarFromInt
 006BDC5F    push        3F800000
 006BDC64    lea         eax,[ebp-10]
 006BDC67    push        eax
 006BDC68    push        0
 006BDC6A    push        0
 006BDC6C    push        1
 006BDC6E    push        6BF418
 006BDC73    push        0
 006BDC75    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDC78    push        eax
 006BDC79    lea         eax,[ebp-64]
 006BDC7C    call        @IntfClear
 006BDC81    push        eax
 006BDC82    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDC85    push        eax
 006BDC86    mov         eax,dword ptr [eax]
 006BDC88    call        dword ptr [eax+20]
 006BDC8B    call        @CheckAutoResult
 006BDC90    mov         eax,dword ptr [ebp-64]
 006BDC93    push        eax
 006BDC94    mov         eax,dword ptr [eax]
 006BDC96    call        dword ptr [eax+24]
 006BDC99    call        @CheckAutoResult
 006BDC9E    push        3F800000
 006BDCA3    lea         eax,[ebp-10]
 006BDCA6    push        eax
 006BDCA7    push        0
 006BDCA9    push        0
 006BDCAB    push        1
 006BDCAD    push        6BF418
 006BDCB2    push        6BF420
 006BDCB7    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDCBA    push        eax
 006BDCBB    lea         eax,[ebp-68]
 006BDCBE    call        @IntfClear
 006BDCC3    push        eax
 006BDCC4    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDCC7    push        eax
 006BDCC8    mov         eax,dword ptr [eax]
 006BDCCA    call        dword ptr [eax+20]
 006BDCCD    call        @CheckAutoResult
 006BDCD2    mov         eax,dword ptr [ebp-68]
 006BDCD5    push        eax
 006BDCD6    mov         eax,dword ptr [eax]
 006BDCD8    call        dword ptr [eax+24]
 006BDCDB    call        @CheckAutoResult
 006BDCE0    push        3F800000
 006BDCE5    lea         eax,[ebp-10]
 006BDCE8    push        eax
 006BDCE9    push        0
 006BDCEB    push        0
 006BDCED    push        1
 006BDCEF    push        6BF418
 006BDCF4    push        6BF434
 006BDCF9    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDCFC    push        eax
 006BDCFD    lea         eax,[ebp-6C]
 006BDD00    call        @IntfClear
 006BDD05    push        eax
 006BDD06    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDD09    push        eax
 006BDD0A    mov         eax,dword ptr [eax]
 006BDD0C    call        dword ptr [eax+20]
 006BDD0F    call        @CheckAutoResult
 006BDD14    mov         eax,dword ptr [ebp-6C]
 006BDD17    push        eax
 006BDD18    mov         eax,dword ptr [eax]
 006BDD1A    call        dword ptr [eax+24]
 006BDD1D    call        @CheckAutoResult
 006BDD22    push        3F800000
 006BDD27    lea         eax,[ebp-10]
 006BDD2A    push        eax
 006BDD2B    push        0
 006BDD2D    push        0
 006BDD2F    push        1
 006BDD31    push        6BF418
 006BDD36    push        6BF45C
 006BDD3B    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDD3E    push        eax
 006BDD3F    lea         eax,[ebp-70]
 006BDD42    call        @IntfClear
 006BDD47    push        eax
 006BDD48    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDD4B    push        eax
 006BDD4C    mov         eax,dword ptr [eax]
 006BDD4E    call        dword ptr [eax+20]
 006BDD51    call        @CheckAutoResult
 006BDD56    mov         eax,dword ptr [ebp-70]
 006BDD59    push        eax
 006BDD5A    mov         eax,dword ptr [eax]
 006BDD5C    call        dword ptr [eax+24]
 006BDD5F    call        @CheckAutoResult
 006BDD64    push        3F800000
 006BDD69    lea         eax,[ebp-10]
 006BDD6C    push        eax
 006BDD6D    push        0
 006BDD6F    push        0
 006BDD71    push        1
 006BDD73    push        6BF418
 006BDD78    push        6BF488
 006BDD7D    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDD80    push        eax
 006BDD81    lea         eax,[ebp-74]
 006BDD84    call        @IntfClear
 006BDD89    push        eax
 006BDD8A    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDD8D    push        eax
 006BDD8E    mov         eax,dword ptr [eax]
 006BDD90    call        dword ptr [eax+20]
 006BDD93    call        @CheckAutoResult
 006BDD98    mov         eax,dword ptr [ebp-74]
 006BDD9B    push        eax
 006BDD9C    mov         eax,dword ptr [eax]
 006BDD9E    call        dword ptr [eax+24]
 006BDDA1    call        @CheckAutoResult
 006BDDA6    push        3F800000
 006BDDAB    lea         eax,[ebp-10]
 006BDDAE    push        eax
 006BDDAF    push        0
 006BDDB1    push        0
 006BDDB3    push        1
 006BDDB5    push        6BF418
 006BDDBA    push        6BF4C0
 006BDDBF    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDDC2    push        eax
 006BDDC3    lea         eax,[ebp-78]
 006BDDC6    call        @IntfClear
 006BDDCB    push        eax
 006BDDCC    mov         eax,dword ptr [ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BDDCF    push        eax
 006BDDD0    mov         eax,dword ptr [eax]
 006BDDD2    call        dword ptr [eax+20]
 006BDDD5    call        @CheckAutoResult
 006BDDDA    mov         eax,dword ptr [ebp-78]
 006BDDDD    push        eax
 006BDDDE    mov         eax,dword ptr [eax]
 006BDDE0    call        dword ptr [eax+24]
 006BDDE3    call        @CheckAutoResult
 006BDDE8    lea         eax,[ebp-88]
 006BDDEE    mov         edx,1
 006BDDF3    mov         cl,0FC
 006BDDF5    call        @OleVarFromInt
 006BDDFA    lea         edx,[ebp-88]
 006BDE00    lea         eax,[ebp-10]
 006BDE03    call        @VarAdd
 006BDE08    push        3F800000
 006BDE0D    lea         eax,[ebp-10]
 006BDE10    push        eax
 006BDE11    push        3
 006BDE13    push        6BF4D8
 006BDE18    push        1
 006BDE1A    push        6BF418
 006BDE1F    push        6BF4F4
 006BDE24    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDE27    push        eax
 006BDE28    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDE2B    push        eax
 006BDE2C    mov         eax,dword ptr [eax]
 006BDE2E    call        dword ptr [eax+24]
 006BDE31    call        @CheckAutoResult
 006BDE36    lea         eax,[ebp-98]
 006BDE3C    mov         edx,1
 006BDE41    mov         cl,0FC
 006BDE43    call        @OleVarFromInt
 006BDE48    lea         edx,[ebp-98]
 006BDE4E    lea         eax,[ebp-10]
 006BDE51    call        @VarAdd
 006BDE56    push        3F800000
 006BDE5B    lea         eax,[ebp-10]
 006BDE5E    push        eax
 006BDE5F    push        3
 006BDE61    push        6BF4D8
 006BDE66    push        1
 006BDE68    push        6BF418
 006BDE6D    push        6BF51C
 006BDE72    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDE75    push        eax
 006BDE76    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDE79    push        eax
 006BDE7A    mov         eax,dword ptr [eax]
 006BDE7C    call        dword ptr [eax+24]
 006BDE7F    call        @CheckAutoResult
 006BDE84    lea         eax,[ebp-0A8]
 006BDE8A    mov         edx,1
 006BDE8F    mov         cl,0FC
 006BDE91    call        @OleVarFromInt
 006BDE96    lea         edx,[ebp-0A8]
 006BDE9C    lea         eax,[ebp-10]
 006BDE9F    call        @VarAdd
 006BDEA4    push        3F800000
 006BDEA9    lea         eax,[ebp-10]
 006BDEAC    push        eax
 006BDEAD    push        3
 006BDEAF    push        6BF4D8
 006BDEB4    push        1
 006BDEB6    push        6BF418
 006BDEBB    push        6BF530
 006BDEC0    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDEC3    push        eax
 006BDEC4    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDEC7    push        eax
 006BDEC8    mov         eax,dword ptr [eax]
 006BDECA    call        dword ptr [eax+24]
 006BDECD    call        @CheckAutoResult
 006BDED2    lea         eax,[ebp-0B8]
 006BDED8    mov         edx,1
 006BDEDD    mov         cl,0FC
 006BDEDF    call        @OleVarFromInt
 006BDEE4    lea         edx,[ebp-0B8]
 006BDEEA    lea         eax,[ebp-10]
 006BDEED    call        @VarAdd
 006BDEF2    push        3F800000
 006BDEF7    lea         eax,[ebp-10]
 006BDEFA    push        eax
 006BDEFB    push        3
 006BDEFD    push        6BF4D8
 006BDF02    push        1
 006BDF04    push        6BF418
 006BDF09    push        6BF544
 006BDF0E    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDF11    push        eax
 006BDF12    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDF15    push        eax
 006BDF16    mov         eax,dword ptr [eax]
 006BDF18    call        dword ptr [eax+24]
 006BDF1B    call        @CheckAutoResult
 006BDF20    lea         eax,[ebp-0C8]
 006BDF26    mov         edx,1
 006BDF2B    mov         cl,0FC
 006BDF2D    call        @OleVarFromInt
 006BDF32    lea         edx,[ebp-0C8]
 006BDF38    lea         eax,[ebp-10]
 006BDF3B    call        @VarAdd
 006BDF40    push        3F800000
 006BDF45    lea         eax,[ebp-10]
 006BDF48    push        eax
 006BDF49    push        3
 006BDF4B    push        6BF4D8
 006BDF50    push        1
 006BDF52    push        6BF418
 006BDF57    push        6BF558
 006BDF5C    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDF5F    push        eax
 006BDF60    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDF63    push        eax
 006BDF64    mov         eax,dword ptr [eax]
 006BDF66    call        dword ptr [eax+24]
 006BDF69    call        @CheckAutoResult
 006BDF6E    lea         eax,[ebp-0D8]
 006BDF74    mov         edx,1
 006BDF79    mov         cl,0FC
 006BDF7B    call        @OleVarFromInt
 006BDF80    lea         edx,[ebp-0D8]
 006BDF86    lea         eax,[ebp-10]
 006BDF89    call        @VarAdd
 006BDF8E    push        3F800000
 006BDF93    lea         eax,[ebp-10]
 006BDF96    push        eax
 006BDF97    push        3
 006BDF99    push        6BF4D8
 006BDF9E    push        1
 006BDFA0    push        6BF418
 006BDFA5    push        6BF56C
 006BDFAA    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDFAD    push        eax
 006BDFAE    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDFB1    push        eax
 006BDFB2    mov         eax,dword ptr [eax]
 006BDFB4    call        dword ptr [eax+24]
 006BDFB7    call        @CheckAutoResult
 006BDFBC    lea         eax,[ebp-0E8]
 006BDFC2    mov         edx,1
 006BDFC7    mov         cl,0FC
 006BDFC9    call        @OleVarFromInt
 006BDFCE    lea         edx,[ebp-0E8]
 006BDFD4    lea         eax,[ebp-10]
 006BDFD7    call        @VarAdd
 006BDFDC    push        3F800000
 006BDFE1    lea         eax,[ebp-10]
 006BDFE4    push        eax
 006BDFE5    push        3
 006BDFE7    push        6BF4D8
 006BDFEC    push        1
 006BDFEE    push        6BF418
 006BDFF3    push        6BF580
 006BDFF8    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BDFFB    push        eax
 006BDFFC    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BDFFF    push        eax
 006BE000    mov         eax,dword ptr [eax]
 006BE002    call        dword ptr [eax+24]
 006BE005    call        @CheckAutoResult
 006BE00A    lea         eax,[ebp-0F8]
 006BE010    mov         edx,1
 006BE015    mov         cl,0FC
 006BE017    call        @OleVarFromInt
 006BE01C    lea         edx,[ebp-0F8]
 006BE022    lea         eax,[ebp-10]
 006BE025    call        @VarAdd
 006BE02A    push        3F800000
 006BE02F    lea         eax,[ebp-10]
 006BE032    push        eax
 006BE033    push        4
 006BE035    push        6BF594
 006BE03A    push        1
 006BE03C    push        6BF418
 006BE041    push        6BF5B4
 006BE046    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE049    push        eax
 006BE04A    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE04D    push        eax
 006BE04E    mov         eax,dword ptr [eax]
 006BE050    call        dword ptr [eax+24]
 006BE053    call        @CheckAutoResult
 006BE058    lea         eax,[ebp-108]
 006BE05E    mov         edx,1
 006BE063    mov         cl,0FC
 006BE065    call        @OleVarFromInt
 006BE06A    lea         edx,[ebp-108]
 006BE070    lea         eax,[ebp-10]
 006BE073    call        @VarAdd
 006BE078    push        3F800000
 006BE07D    lea         eax,[ebp-10]
 006BE080    push        eax
 006BE081    push        4
 006BE083    push        6BF594
 006BE088    push        1
 006BE08A    push        6BF418
 006BE08F    push        6BF5D4
 006BE094    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE097    push        eax
 006BE098    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE09B    push        eax
 006BE09C    mov         eax,dword ptr [eax]
 006BE09E    call        dword ptr [eax+24]
 006BE0A1    call        @CheckAutoResult
 006BE0A6    lea         eax,[ebp-118]
 006BE0AC    mov         edx,1
 006BE0B1    mov         cl,0FC
 006BE0B3    call        @OleVarFromInt
 006BE0B8    lea         edx,[ebp-118]
 006BE0BE    lea         eax,[ebp-10]
 006BE0C1    call        @VarAdd
 006BE0C6    push        3F800000
 006BE0CB    lea         eax,[ebp-10]
 006BE0CE    push        eax
 006BE0CF    push        4
 006BE0D1    push        6BF594
 006BE0D6    push        1
 006BE0D8    push        6BF418
 006BE0DD    push        6BF5F4
 006BE0E2    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE0E5    push        eax
 006BE0E6    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE0E9    push        eax
 006BE0EA    mov         eax,dword ptr [eax]
 006BE0EC    call        dword ptr [eax+24]
 006BE0EF    call        @CheckAutoResult
 006BE0F4    lea         eax,[ebp-128]
 006BE0FA    mov         edx,1
 006BE0FF    mov         cl,0FC
 006BE101    call        @OleVarFromInt
 006BE106    lea         edx,[ebp-128]
 006BE10C    lea         eax,[ebp-10]
 006BE10F    call        @VarAdd
 006BE114    push        3F800000
 006BE119    lea         eax,[ebp-10]
 006BE11C    push        eax
 006BE11D    push        4
 006BE11F    push        6BF594
 006BE124    push        1
 006BE126    push        6BF418
 006BE12B    push        6BF614
 006BE130    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE133    push        eax
 006BE134    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE137    push        eax
 006BE138    mov         eax,dword ptr [eax]
 006BE13A    call        dword ptr [eax+24]
 006BE13D    call        @CheckAutoResult
 006BE142    lea         eax,[ebp-138]
 006BE148    mov         edx,1
 006BE14D    mov         cl,0FC
 006BE14F    call        @OleVarFromInt
 006BE154    lea         edx,[ebp-138]
 006BE15A    lea         eax,[ebp-10]
 006BE15D    call        @VarAdd
 006BE162    push        3F800000
 006BE167    lea         eax,[ebp-10]
 006BE16A    push        eax
 006BE16B    push        4
 006BE16D    push        6BF594
 006BE172    push        1
 006BE174    push        6BF418
 006BE179    push        6BF634
 006BE17E    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE181    push        eax
 006BE182    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE185    push        eax
 006BE186    mov         eax,dword ptr [eax]
 006BE188    call        dword ptr [eax+24]
 006BE18B    call        @CheckAutoResult
 006BE190    lea         eax,[ebp-148]
 006BE196    mov         edx,1
 006BE19B    mov         cl,0FC
 006BE19D    call        @OleVarFromInt
 006BE1A2    lea         edx,[ebp-148]
 006BE1A8    lea         eax,[ebp-10]
 006BE1AB    call        @VarAdd
 006BE1B0    push        3F800000
 006BE1B5    lea         eax,[ebp-10]
 006BE1B8    push        eax
 006BE1B9    push        4
 006BE1BB    push        6BF594
 006BE1C0    push        1
 006BE1C2    push        6BF418
 006BE1C7    push        6BF654
 006BE1CC    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE1CF    push        eax
 006BE1D0    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE1D3    push        eax
 006BE1D4    mov         eax,dword ptr [eax]
 006BE1D6    call        dword ptr [eax+24]
 006BE1D9    call        @CheckAutoResult
 006BE1DE    lea         eax,[ebp-158]
 006BE1E4    mov         edx,1
 006BE1E9    mov         cl,0FC
 006BE1EB    call        @OleVarFromInt
 006BE1F0    lea         edx,[ebp-158]
 006BE1F6    lea         eax,[ebp-10]
 006BE1F9    call        @VarAdd
 006BE1FE    push        3F800000
 006BE203    lea         eax,[ebp-10]
 006BE206    push        eax
 006BE207    push        3
 006BE209    push        6BF4D8
 006BE20E    push        1
 006BE210    push        6BF418
 006BE215    push        6BF674
 006BE21A    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE21D    push        eax
 006BE21E    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE221    push        eax
 006BE222    mov         eax,dword ptr [eax]
 006BE224    call        dword ptr [eax+24]
 006BE227    call        @CheckAutoResult
 006BE22C    lea         eax,[ebp-168]
 006BE232    mov         edx,1
 006BE237    mov         cl,0FC
 006BE239    call        @OleVarFromInt
 006BE23E    lea         edx,[ebp-168]
 006BE244    lea         eax,[ebp-10]
 006BE247    call        @VarAdd
 006BE24C    push        3F800000
 006BE251    lea         eax,[ebp-10]
 006BE254    push        eax
 006BE255    push        3
 006BE257    push        6BF4D8
 006BE25C    push        1
 006BE25E    push        6BF418
 006BE263    push        6BF680
 006BE268    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE26B    push        eax
 006BE26C    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE26F    push        eax
 006BE270    mov         eax,dword ptr [eax]
 006BE272    call        dword ptr [eax+24]
 006BE275    call        @CheckAutoResult
 006BE27A    lea         eax,[ebp-178]
 006BE280    mov         edx,1
 006BE285    mov         cl,0FC
 006BE287    call        @OleVarFromInt
 006BE28C    lea         edx,[ebp-178]
 006BE292    lea         eax,[ebp-10]
 006BE295    call        @VarAdd
 006BE29A    push        3F800000
 006BE29F    lea         eax,[ebp-10]
 006BE2A2    push        eax
 006BE2A3    push        3
 006BE2A5    push        6BF4D8
 006BE2AA    push        1
 006BE2AC    push        6BF418
 006BE2B1    push        6BF694
 006BE2B6    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE2B9    push        eax
 006BE2BA    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE2BD    push        eax
 006BE2BE    mov         eax,dword ptr [eax]
 006BE2C0    call        dword ptr [eax+24]
 006BE2C3    call        @CheckAutoResult
 006BE2C8    lea         eax,[ebp-188]
 006BE2CE    mov         edx,1
 006BE2D3    mov         cl,0FC
 006BE2D5    call        @OleVarFromInt
 006BE2DA    lea         edx,[ebp-188]
 006BE2E0    lea         eax,[ebp-10]
 006BE2E3    call        @VarAdd
 006BE2E8    push        3F800000
 006BE2ED    lea         eax,[ebp-10]
 006BE2F0    push        eax
 006BE2F1    push        3
 006BE2F3    push        6BF4D8
 006BE2F8    push        1
 006BE2FA    push        6BF418
 006BE2FF    push        6BF6B4
 006BE304    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE307    push        eax
 006BE308    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE30B    push        eax
 006BE30C    mov         eax,dword ptr [eax]
 006BE30E    call        dword ptr [eax+24]
 006BE311    call        @CheckAutoResult
 006BE316    lea         eax,[ebp-198]
 006BE31C    mov         edx,1
 006BE321    mov         cl,0FC
 006BE323    call        @OleVarFromInt
 006BE328    lea         edx,[ebp-198]
 006BE32E    lea         eax,[ebp-10]
 006BE331    call        @VarAdd
 006BE336    push        3F800000
 006BE33B    lea         eax,[ebp-10]
 006BE33E    push        eax
 006BE33F    push        3
 006BE341    push        6BF4D8
 006BE346    push        1
 006BE348    push        6BF418
 006BE34D    push        6BF6CC
 006BE352    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE355    push        eax
 006BE356    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE359    push        eax
 006BE35A    mov         eax,dword ptr [eax]
 006BE35C    call        dword ptr [eax+24]
 006BE35F    call        @CheckAutoResult
 006BE364    lea         eax,[ebp-1A8]
 006BE36A    mov         edx,1
 006BE36F    mov         cl,0FC
 006BE371    call        @OleVarFromInt
 006BE376    lea         edx,[ebp-1A8]
 006BE37C    lea         eax,[ebp-10]
 006BE37F    call        @VarAdd
 006BE384    push        3F800000
 006BE389    lea         eax,[ebp-10]
 006BE38C    push        eax
 006BE38D    push        3
 006BE38F    push        6BF4D8
 006BE394    push        1
 006BE396    push        6BF418
 006BE39B    push        6BF6E0
 006BE3A0    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE3A3    push        eax
 006BE3A4    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE3A7    push        eax
 006BE3A8    mov         eax,dword ptr [eax]
 006BE3AA    call        dword ptr [eax+24]
 006BE3AD    call        @CheckAutoResult
 006BE3B2    lea         eax,[ebp-1B8]
 006BE3B8    mov         edx,1
 006BE3BD    mov         cl,0FC
 006BE3BF    call        @OleVarFromInt
 006BE3C4    lea         edx,[ebp-1B8]
 006BE3CA    lea         eax,[ebp-10]
 006BE3CD    call        @VarAdd
 006BE3D2    push        3F800000
 006BE3D7    lea         eax,[ebp-10]
 006BE3DA    push        eax
 006BE3DB    push        3
 006BE3DD    push        6BF4D8
 006BE3E2    push        1
 006BE3E4    push        6BF418
 006BE3E9    push        6BF6F8
 006BE3EE    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE3F1    push        eax
 006BE3F2    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE3F5    push        eax
 006BE3F6    mov         eax,dword ptr [eax]
 006BE3F8    call        dword ptr [eax+24]
 006BE3FB    call        @CheckAutoResult
 006BE400    lea         eax,[ebp-1C8]
 006BE406    mov         edx,1
 006BE40B    mov         cl,0FC
 006BE40D    call        @OleVarFromInt
 006BE412    lea         edx,[ebp-1C8]
 006BE418    lea         eax,[ebp-10]
 006BE41B    call        @VarAdd
 006BE420    push        3F800000
 006BE425    lea         eax,[ebp-10]
 006BE428    push        eax
 006BE429    push        3
 006BE42B    push        6BF4D8
 006BE430    push        1
 006BE432    push        6BF418
 006BE437    push        6BF718
 006BE43C    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE43F    push        eax
 006BE440    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE443    push        eax
 006BE444    mov         eax,dword ptr [eax]
 006BE446    call        dword ptr [eax+24]
 006BE449    call        @CheckAutoResult
 006BE44E    lea         eax,[ebp-1D8]
 006BE454    mov         edx,1
 006BE459    mov         cl,0FC
 006BE45B    call        @OleVarFromInt
 006BE460    lea         edx,[ebp-1D8]
 006BE466    lea         eax,[ebp-10]
 006BE469    call        @VarAdd
 006BE46E    push        3F800000
 006BE473    lea         eax,[ebp-10]
 006BE476    push        eax
 006BE477    push        3
 006BE479    push        6BF4D8
 006BE47E    push        1
 006BE480    push        6BF418
 006BE485    push        6BF730
 006BE48A    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE48D    push        eax
 006BE48E    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE491    push        eax
 006BE492    mov         eax,dword ptr [eax]
 006BE494    call        dword ptr [eax+24]
 006BE497    call        @CheckAutoResult
 006BE49C    lea         eax,[ebp-1E8]
 006BE4A2    mov         edx,1
 006BE4A7    mov         cl,0FC
 006BE4A9    call        @OleVarFromInt
 006BE4AE    lea         edx,[ebp-1E8]
 006BE4B4    lea         eax,[ebp-10]
 006BE4B7    call        @VarAdd
 006BE4BC    push        3F800000
 006BE4C1    lea         eax,[ebp-10]
 006BE4C4    push        eax
 006BE4C5    push        3
 006BE4C7    push        6BF4D8
 006BE4CC    push        1
 006BE4CE    push        6BF418
 006BE4D3    push        6BF75C
 006BE4D8    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE4DB    push        eax
 006BE4DC    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE4DF    push        eax
 006BE4E0    mov         eax,dword ptr [eax]
 006BE4E2    call        dword ptr [eax+24]
 006BE4E5    call        @CheckAutoResult
 006BE4EA    lea         eax,[ebp-1F8]
 006BE4F0    mov         edx,1
 006BE4F5    mov         cl,0FC
 006BE4F7    call        @OleVarFromInt
 006BE4FC    lea         edx,[ebp-1F8]
 006BE502    lea         eax,[ebp-10]
 006BE505    call        @VarAdd
 006BE50A    push        3F800000
 006BE50F    lea         eax,[ebp-10]
 006BE512    push        eax
 006BE513    push        4
 006BE515    push        6BF594
 006BE51A    push        1
 006BE51C    push        6BF418
 006BE521    push        6BF780
 006BE526    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE529    push        eax
 006BE52A    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE52D    push        eax
 006BE52E    mov         eax,dword ptr [eax]
 006BE530    call        dword ptr [eax+24]
 006BE533    call        @CheckAutoResult
 006BE538    lea         eax,[ebp-208]
 006BE53E    mov         edx,1
 006BE543    mov         cl,0FC
 006BE545    call        @OleVarFromInt
 006BE54A    lea         edx,[ebp-208]
 006BE550    lea         eax,[ebp-10]
 006BE553    call        @VarAdd
 006BE558    push        3F800000
 006BE55D    lea         eax,[ebp-10]
 006BE560    push        eax
 006BE561    push        4
 006BE563    push        6BF594
 006BE568    push        1
 006BE56A    push        6BF418
 006BE56F    push        6BF7A0
 006BE574    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE577    push        eax
 006BE578    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE57B    push        eax
 006BE57C    mov         eax,dword ptr [eax]
 006BE57E    call        dword ptr [eax+24]
 006BE581    call        @CheckAutoResult
 006BE586    lea         eax,[ebp-218]
 006BE58C    mov         edx,1
 006BE591    mov         cl,0FC
 006BE593    call        @OleVarFromInt
 006BE598    lea         edx,[ebp-218]
 006BE59E    lea         eax,[ebp-10]
 006BE5A1    call        @VarAdd
 006BE5A6    push        3F800000
 006BE5AB    lea         eax,[ebp-10]
 006BE5AE    push        eax
 006BE5AF    push        4
 006BE5B1    push        6BF594
 006BE5B6    push        1
 006BE5B8    push        6BF418
 006BE5BD    push        6BF7C8
 006BE5C2    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE5C5    push        eax
 006BE5C6    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE5C9    push        eax
 006BE5CA    mov         eax,dword ptr [eax]
 006BE5CC    call        dword ptr [eax+24]
 006BE5CF    call        @CheckAutoResult
 006BE5D4    lea         eax,[ebp-228]
 006BE5DA    mov         edx,1
 006BE5DF    mov         cl,0FC
 006BE5E1    call        @OleVarFromInt
 006BE5E6    lea         edx,[ebp-228]
 006BE5EC    lea         eax,[ebp-10]
 006BE5EF    call        @VarAdd
 006BE5F4    push        3F800000
 006BE5F9    lea         eax,[ebp-10]
 006BE5FC    push        eax
 006BE5FD    push        4
 006BE5FF    push        6BF594
 006BE604    push        1
 006BE606    push        6BF418
 006BE60B    push        6BF7E8
 006BE610    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE613    push        eax
 006BE614    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE617    push        eax
 006BE618    mov         eax,dword ptr [eax]
 006BE61A    call        dword ptr [eax+24]
 006BE61D    call        @CheckAutoResult
 006BE622    lea         eax,[ebp-238]
 006BE628    mov         edx,1
 006BE62D    mov         cl,0FC
 006BE62F    call        @OleVarFromInt
 006BE634    lea         edx,[ebp-238]
 006BE63A    lea         eax,[ebp-10]
 006BE63D    call        @VarAdd
 006BE642    push        3F800000
 006BE647    lea         eax,[ebp-10]
 006BE64A    push        eax
 006BE64B    push        4
 006BE64D    push        6BF594
 006BE652    push        1
 006BE654    push        6BF418
 006BE659    push        6BF80C
 006BE65E    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE661    push        eax
 006BE662    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE665    push        eax
 006BE666    mov         eax,dword ptr [eax]
 006BE668    call        dword ptr [eax+24]
 006BE66B    call        @CheckAutoResult
 006BE670    lea         eax,[ebp-248]
 006BE676    mov         edx,1
 006BE67B    mov         cl,0FC
 006BE67D    call        @OleVarFromInt
 006BE682    lea         edx,[ebp-248]
 006BE688    lea         eax,[ebp-10]
 006BE68B    call        @VarAdd
 006BE690    push        3F800000
 006BE695    lea         eax,[ebp-10]
 006BE698    push        eax
 006BE699    push        3
 006BE69B    push        6BF4D8
 006BE6A0    push        1
 006BE6A2    push        6BF418
 006BE6A7    push        6BF834
 006BE6AC    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE6AF    push        eax
 006BE6B0    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE6B3    push        eax
 006BE6B4    mov         eax,dword ptr [eax]
 006BE6B6    call        dword ptr [eax+24]
 006BE6B9    call        @CheckAutoResult
 006BE6BE    lea         eax,[ebp-258]
 006BE6C4    mov         edx,1
 006BE6C9    mov         cl,0FC
 006BE6CB    call        @OleVarFromInt
 006BE6D0    lea         edx,[ebp-258]
 006BE6D6    lea         eax,[ebp-10]
 006BE6D9    call        @VarAdd
 006BE6DE    push        3F800000
 006BE6E3    lea         eax,[ebp-10]
 006BE6E6    push        eax
 006BE6E7    push        3
 006BE6E9    push        6BF4D8
 006BE6EE    push        1
 006BE6F0    push        6BF418
 006BE6F5    push        6BF850
 006BE6FA    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE6FD    push        eax
 006BE6FE    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE701    push        eax
 006BE702    mov         eax,dword ptr [eax]
 006BE704    call        dword ptr [eax+24]
 006BE707    call        @CheckAutoResult
 006BE70C    lea         eax,[ebp-268]
 006BE712    mov         edx,1
 006BE717    mov         cl,0FC
 006BE719    call        @OleVarFromInt
 006BE71E    lea         edx,[ebp-268]
 006BE724    lea         eax,[ebp-10]
 006BE727    call        @VarAdd
 006BE72C    push        3F800000
 006BE731    lea         eax,[ebp-10]
 006BE734    push        eax
 006BE735    push        3
 006BE737    push        6BF4D8
 006BE73C    push        1
 006BE73E    push        6BF418
 006BE743    push        6BF870
 006BE748    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE74B    push        eax
 006BE74C    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE74F    push        eax
 006BE750    mov         eax,dword ptr [eax]
 006BE752    call        dword ptr [eax+24]
 006BE755    call        @CheckAutoResult
 006BE75A    lea         eax,[ebp-278]
 006BE760    mov         edx,1
 006BE765    mov         cl,0FC
 006BE767    call        @OleVarFromInt
 006BE76C    lea         edx,[ebp-278]
 006BE772    lea         eax,[ebp-10]
 006BE775    call        @VarAdd
 006BE77A    push        3F800000
 006BE77F    lea         eax,[ebp-10]
 006BE782    push        eax
 006BE783    push        3
 006BE785    push        6BF4D8
 006BE78A    push        1
 006BE78C    push        6BF418
 006BE791    push        6BF88C
 006BE796    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE799    push        eax
 006BE79A    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE79D    push        eax
 006BE79E    mov         eax,dword ptr [eax]
 006BE7A0    call        dword ptr [eax+24]
 006BE7A3    call        @CheckAutoResult
 006BE7A8    lea         eax,[ebp-288]
 006BE7AE    mov         edx,1
 006BE7B3    mov         cl,0FC
 006BE7B5    call        @OleVarFromInt
 006BE7BA    lea         edx,[ebp-288]
 006BE7C0    lea         eax,[ebp-10]
 006BE7C3    call        @VarAdd
 006BE7C8    push        3F800000
 006BE7CD    lea         eax,[ebp-10]
 006BE7D0    push        eax
 006BE7D1    push        3
 006BE7D3    push        6BF4D8
 006BE7D8    push        1
 006BE7DA    push        6BF418
 006BE7DF    push        6BF8AC
 006BE7E4    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE7E7    push        eax
 006BE7E8    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE7EB    push        eax
 006BE7EC    mov         eax,dword ptr [eax]
 006BE7EE    call        dword ptr [eax+24]
 006BE7F1    call        @CheckAutoResult
 006BE7F6    lea         eax,[ebp-298]
 006BE7FC    mov         edx,1
 006BE801    mov         cl,0FC
 006BE803    call        @OleVarFromInt
 006BE808    lea         edx,[ebp-298]
 006BE80E    lea         eax,[ebp-10]
 006BE811    call        @VarAdd
 006BE816    push        3F800000
 006BE81B    lea         eax,[ebp-10]
 006BE81E    push        eax
 006BE81F    push        3
 006BE821    push        6BF4D8
 006BE826    push        1
 006BE828    push        6BF418
 006BE82D    push        6BF8CC
 006BE832    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE835    push        eax
 006BE836    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE839    push        eax
 006BE83A    mov         eax,dword ptr [eax]
 006BE83C    call        dword ptr [eax+24]
 006BE83F    call        @CheckAutoResult
 006BE844    lea         eax,[ebp-2A8]
 006BE84A    mov         edx,1
 006BE84F    mov         cl,0FC
 006BE851    call        @OleVarFromInt
 006BE856    lea         edx,[ebp-2A8]
 006BE85C    lea         eax,[ebp-10]
 006BE85F    call        @VarAdd
 006BE864    push        3F800000
 006BE869    lea         eax,[ebp-10]
 006BE86C    push        eax
 006BE86D    push        3
 006BE86F    push        6BF4D8
 006BE874    push        1
 006BE876    push        6BF418
 006BE87B    push        6BF8F0
 006BE880    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE883    push        eax
 006BE884    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE887    push        eax
 006BE888    mov         eax,dword ptr [eax]
 006BE88A    call        dword ptr [eax+24]
 006BE88D    call        @CheckAutoResult
 006BE892    lea         eax,[ebp-2B8]
 006BE898    mov         edx,1
 006BE89D    mov         cl,0FC
 006BE89F    call        @OleVarFromInt
 006BE8A4    lea         edx,[ebp-2B8]
 006BE8AA    lea         eax,[ebp-10]
 006BE8AD    call        @VarAdd
 006BE8B2    push        3F800000
 006BE8B7    lea         eax,[ebp-10]
 006BE8BA    push        eax
 006BE8BB    push        3
 006BE8BD    push        6BF4D8
 006BE8C2    push        1
 006BE8C4    push        6BF418
 006BE8C9    push        6BF914
 006BE8CE    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE8D1    push        eax
 006BE8D2    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE8D5    push        eax
 006BE8D6    mov         eax,dword ptr [eax]
 006BE8D8    call        dword ptr [eax+24]
 006BE8DB    call        @CheckAutoResult
 006BE8E0    lea         eax,[ebp-2C8]
 006BE8E6    mov         edx,1
 006BE8EB    mov         cl,0FC
 006BE8ED    call        @OleVarFromInt
 006BE8F2    lea         edx,[ebp-2C8]
 006BE8F8    lea         eax,[ebp-10]
 006BE8FB    call        @VarAdd
 006BE900    push        3F800000
 006BE905    lea         eax,[ebp-10]
 006BE908    push        eax
 006BE909    push        3
 006BE90B    push        6BF4D8
 006BE910    push        1
 006BE912    push        6BF418
 006BE917    push        6BF930
 006BE91C    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE91F    push        eax
 006BE920    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE923    push        eax
 006BE924    mov         eax,dword ptr [eax]
 006BE926    call        dword ptr [eax+24]
 006BE929    call        @CheckAutoResult
 006BE92E    lea         eax,[ebp-2D8]
 006BE934    mov         edx,1
 006BE939    mov         cl,0FC
 006BE93B    call        @OleVarFromInt
 006BE940    lea         edx,[ebp-2D8]
 006BE946    lea         eax,[ebp-10]
 006BE949    call        @VarAdd
 006BE94E    push        3F800000
 006BE953    lea         eax,[ebp-10]
 006BE956    push        eax
 006BE957    push        3
 006BE959    push        6BF4D8
 006BE95E    push        1
 006BE960    push        6BF418
 006BE965    push        6BF950
 006BE96A    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE96D    push        eax
 006BE96E    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE971    push        eax
 006BE972    mov         eax,dword ptr [eax]
 006BE974    call        dword ptr [eax+24]
 006BE977    call        @CheckAutoResult
 006BE97C    lea         eax,[ebp-2E8]
 006BE982    mov         edx,1
 006BE987    mov         cl,0FC
 006BE989    call        @OleVarFromInt
 006BE98E    lea         edx,[ebp-2E8]
 006BE994    lea         eax,[ebp-10]
 006BE997    call        @VarAdd
 006BE99C    push        3F800000
 006BE9A1    lea         eax,[ebp-10]
 006BE9A4    push        eax
 006BE9A5    push        3
 006BE9A7    push        6BF4D8
 006BE9AC    push        1
 006BE9AE    push        6BF418
 006BE9B3    push        6BF96C
 006BE9B8    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BE9BB    push        eax
 006BE9BC    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BE9BF    push        eax
 006BE9C0    mov         eax,dword ptr [eax]
 006BE9C2    call        dword ptr [eax+24]
 006BE9C5    call        @CheckAutoResult
 006BE9CA    lea         eax,[ebp-2F8]
 006BE9D0    mov         edx,1
 006BE9D5    mov         cl,0FC
 006BE9D7    call        @OleVarFromInt
 006BE9DC    lea         edx,[ebp-2F8]
 006BE9E2    lea         eax,[ebp-10]
 006BE9E5    call        @VarAdd
 006BE9EA    push        3F800000
 006BE9EF    lea         eax,[ebp-10]
 006BE9F2    push        eax
 006BE9F3    push        3
 006BE9F5    push        6BF4D8
 006BE9FA    push        1
 006BE9FC    push        6BF418
 006BEA01    push        6BF98C
 006BEA06    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEA09    push        eax
 006BEA0A    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEA0D    push        eax
 006BEA0E    mov         eax,dword ptr [eax]
 006BEA10    call        dword ptr [eax+24]
 006BEA13    call        @CheckAutoResult
 006BEA18    lea         eax,[ebp-308]
 006BEA1E    mov         edx,1
 006BEA23    mov         cl,0FC
 006BEA25    call        @OleVarFromInt
 006BEA2A    lea         edx,[ebp-308]
 006BEA30    lea         eax,[ebp-10]
 006BEA33    call        @VarAdd
 006BEA38    push        3F800000
 006BEA3D    lea         eax,[ebp-10]
 006BEA40    push        eax
 006BEA41    push        3
 006BEA43    push        6BF4D8
 006BEA48    push        1
 006BEA4A    push        6BF418
 006BEA4F    push        6BF9AC
 006BEA54    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEA57    push        eax
 006BEA58    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEA5B    push        eax
 006BEA5C    mov         eax,dword ptr [eax]
 006BEA5E    call        dword ptr [eax+24]
 006BEA61    call        @CheckAutoResult
 006BEA66    lea         eax,[ebp-318]
 006BEA6C    mov         edx,1
 006BEA71    mov         cl,0FC
 006BEA73    call        @OleVarFromInt
 006BEA78    lea         edx,[ebp-318]
 006BEA7E    lea         eax,[ebp-10]
 006BEA81    call        @VarAdd
 006BEA86    push        3F800000
 006BEA8B    lea         eax,[ebp-10]
 006BEA8E    push        eax
 006BEA8F    push        3
 006BEA91    push        6BF4D8
 006BEA96    push        1
 006BEA98    push        6BF418
 006BEA9D    push        6BF9D4
 006BEAA2    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEAA5    push        eax
 006BEAA6    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEAA9    push        eax
 006BEAAA    mov         eax,dword ptr [eax]
 006BEAAC    call        dword ptr [eax+24]
 006BEAAF    call        @CheckAutoResult
 006BEAB4    lea         eax,[ebp-328]
 006BEABA    mov         edx,1
 006BEABF    mov         cl,0FC
 006BEAC1    call        @OleVarFromInt
 006BEAC6    lea         edx,[ebp-328]
 006BEACC    lea         eax,[ebp-10]
 006BEACF    call        @VarAdd
 006BEAD4    push        3F800000
 006BEAD9    lea         eax,[ebp-10]
 006BEADC    push        eax
 006BEADD    push        3
 006BEADF    push        6BF4D8
 006BEAE4    push        1
 006BEAE6    push        6BF418
 006BEAEB    push        6BF9FC
 006BEAF0    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEAF3    push        eax
 006BEAF4    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEAF7    push        eax
 006BEAF8    mov         eax,dword ptr [eax]
 006BEAFA    call        dword ptr [eax+24]
 006BEAFD    call        @CheckAutoResult
 006BEB02    lea         eax,[ebp-338]
 006BEB08    mov         edx,1
 006BEB0D    mov         cl,0FC
 006BEB0F    call        @OleVarFromInt
 006BEB14    lea         edx,[ebp-338]
 006BEB1A    lea         eax,[ebp-10]
 006BEB1D    call        @VarAdd
 006BEB22    push        3F800000
 006BEB27    lea         eax,[ebp-10]
 006BEB2A    push        eax
 006BEB2B    push        3
 006BEB2D    push        6BF4D8
 006BEB32    push        1
 006BEB34    push        6BF418
 006BEB39    push        6BFA24
 006BEB3E    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEB41    push        eax
 006BEB42    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEB45    push        eax
 006BEB46    mov         eax,dword ptr [eax]
 006BEB48    call        dword ptr [eax+24]
 006BEB4B    call        @CheckAutoResult
 006BEB50    lea         eax,[ebp-348]
 006BEB56    mov         edx,1
 006BEB5B    mov         cl,0FC
 006BEB5D    call        @OleVarFromInt
 006BEB62    lea         edx,[ebp-348]
 006BEB68    lea         eax,[ebp-10]
 006BEB6B    call        @VarAdd
 006BEB70    push        3F800000
 006BEB75    lea         eax,[ebp-10]
 006BEB78    push        eax
 006BEB79    push        3
 006BEB7B    push        6BF4D8
 006BEB80    push        1
 006BEB82    push        6BF418
 006BEB87    push        6BFA50
 006BEB8C    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEB8F    push        eax
 006BEB90    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEB93    push        eax
 006BEB94    mov         eax,dword ptr [eax]
 006BEB96    call        dword ptr [eax+24]
 006BEB99    call        @CheckAutoResult
 006BEB9E    lea         eax,[ebp-358]
 006BEBA4    mov         edx,1
 006BEBA9    mov         cl,0FC
 006BEBAB    call        @OleVarFromInt
 006BEBB0    lea         edx,[ebp-358]
 006BEBB6    lea         eax,[ebp-10]
 006BEBB9    call        @VarAdd
 006BEBBE    push        3F800000
 006BEBC3    lea         eax,[ebp-10]
 006BEBC6    push        eax
 006BEBC7    push        3
 006BEBC9    push        6BF4D8
 006BEBCE    push        1
 006BEBD0    push        6BF418
 006BEBD5    push        6BFA78
 006BEBDA    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEBDD    push        eax
 006BEBDE    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEBE1    push        eax
 006BEBE2    mov         eax,dword ptr [eax]
 006BEBE4    call        dword ptr [eax+24]
 006BEBE7    call        @CheckAutoResult
 006BEBEC    lea         eax,[ebp-368]
 006BEBF2    mov         edx,1
 006BEBF7    mov         cl,0FC
 006BEBF9    call        @OleVarFromInt
 006BEBFE    lea         edx,[ebp-368]
 006BEC04    lea         eax,[ebp-10]
 006BEC07    call        @VarAdd
 006BEC0C    push        3F800000
 006BEC11    lea         eax,[ebp-10]
 006BEC14    push        eax
 006BEC15    push        3
 006BEC17    push        6BF4D8
 006BEC1C    push        1
 006BEC1E    push        6BF418
 006BEC23    push        6BFAA4
 006BEC28    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEC2B    push        eax
 006BEC2C    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEC2F    push        eax
 006BEC30    mov         eax,dword ptr [eax]
 006BEC32    call        dword ptr [eax+24]
 006BEC35    call        @CheckAutoResult
 006BEC3A    lea         eax,[ebp-378]
 006BEC40    mov         edx,1
 006BEC45    mov         cl,0FC
 006BEC47    call        @OleVarFromInt
 006BEC4C    lea         edx,[ebp-378]
 006BEC52    lea         eax,[ebp-10]
 006BEC55    call        @VarAdd
 006BEC5A    push        3F800000
 006BEC5F    lea         eax,[ebp-10]
 006BEC62    push        eax
 006BEC63    push        3
 006BEC65    push        6BF4D8
 006BEC6A    push        1
 006BEC6C    push        6BF418
 006BEC71    push        6BFAD0
 006BEC76    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEC79    push        eax
 006BEC7A    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEC7D    push        eax
 006BEC7E    mov         eax,dword ptr [eax]
 006BEC80    call        dword ptr [eax+24]
 006BEC83    call        @CheckAutoResult
 006BEC88    lea         eax,[ebp-388]
 006BEC8E    mov         edx,1
 006BEC93    mov         cl,0FC
 006BEC95    call        @OleVarFromInt
 006BEC9A    lea         edx,[ebp-388]
 006BECA0    lea         eax,[ebp-10]
 006BECA3    call        @VarAdd
 006BECA8    push        3F800000
 006BECAD    lea         eax,[ebp-10]
 006BECB0    push        eax
 006BECB1    push        3
 006BECB3    push        6BF4D8
 006BECB8    push        1
 006BECBA    push        6BF418
 006BECBF    push        6BFB04
 006BECC4    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BECC7    push        eax
 006BECC8    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BECCB    push        eax
 006BECCC    mov         eax,dword ptr [eax]
 006BECCE    call        dword ptr [eax+24]
 006BECD1    call        @CheckAutoResult
 006BECD6    lea         eax,[ebp-398]
 006BECDC    mov         edx,1
 006BECE1    mov         cl,0FC
 006BECE3    call        @OleVarFromInt
 006BECE8    lea         edx,[ebp-398]
 006BECEE    lea         eax,[ebp-10]
 006BECF1    call        @VarAdd
 006BECF6    push        3F800000
 006BECFB    lea         eax,[ebp-10]
 006BECFE    push        eax
 006BECFF    push        3
 006BED01    push        6BF4D8
 006BED06    push        1
 006BED08    push        6BF418
 006BED0D    push        6BFB38
 006BED12    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BED15    push        eax
 006BED16    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BED19    push        eax
 006BED1A    mov         eax,dword ptr [eax]
 006BED1C    call        dword ptr [eax+24]
 006BED1F    call        @CheckAutoResult
 006BED24    lea         eax,[ebp-3A8]
 006BED2A    mov         edx,1
 006BED2F    mov         cl,0FC
 006BED31    call        @OleVarFromInt
 006BED36    lea         edx,[ebp-3A8]
 006BED3C    lea         eax,[ebp-10]
 006BED3F    call        @VarAdd
 006BED44    push        3F800000
 006BED49    lea         eax,[ebp-10]
 006BED4C    push        eax
 006BED4D    push        3
 006BED4F    push        6BF4D8
 006BED54    push        1
 006BED56    push        6BF418
 006BED5B    push        6BFB64
 006BED60    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BED63    push        eax
 006BED64    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BED67    push        eax
 006BED68    mov         eax,dword ptr [eax]
 006BED6A    call        dword ptr [eax+24]
 006BED6D    call        @CheckAutoResult
 006BED72    lea         eax,[ebp-3B8]
 006BED78    mov         edx,1
 006BED7D    mov         cl,0FC
 006BED7F    call        @OleVarFromInt
 006BED84    lea         edx,[ebp-3B8]
 006BED8A    lea         eax,[ebp-10]
 006BED8D    call        @VarAdd
 006BED92    push        3F800000
 006BED97    lea         eax,[ebp-10]
 006BED9A    push        eax
 006BED9B    push        3
 006BED9D    push        6BF4D8
 006BEDA2    push        1
 006BEDA4    push        6BF418
 006BEDA9    push        6BFB94
 006BEDAE    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEDB1    push        eax
 006BEDB2    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEDB5    push        eax
 006BEDB6    mov         eax,dword ptr [eax]
 006BEDB8    call        dword ptr [eax+24]
 006BEDBB    call        @CheckAutoResult
 006BEDC0    lea         eax,[ebp-3C8]
 006BEDC6    mov         edx,1
 006BEDCB    mov         cl,0FC
 006BEDCD    call        @OleVarFromInt
 006BEDD2    lea         edx,[ebp-3C8]
 006BEDD8    lea         eax,[ebp-10]
 006BEDDB    call        @VarAdd
 006BEDE0    push        3F800000
 006BEDE5    lea         eax,[ebp-10]
 006BEDE8    push        eax
 006BEDE9    push        3
 006BEDEB    push        6BF4D8
 006BEDF0    push        1
 006BEDF2    push        6BF418
 006BEDF7    push        6BFBC0
 006BEDFC    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEDFF    push        eax
 006BEE00    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEE03    push        eax
 006BEE04    mov         eax,dword ptr [eax]
 006BEE06    call        dword ptr [eax+24]
 006BEE09    call        @CheckAutoResult
 006BEE0E    lea         eax,[ebp-3D8]
 006BEE14    mov         edx,1
 006BEE19    mov         cl,0FC
 006BEE1B    call        @OleVarFromInt
 006BEE20    lea         edx,[ebp-3D8]
 006BEE26    lea         eax,[ebp-10]
 006BEE29    call        @VarAdd
 006BEE2E    push        3F800000
 006BEE33    lea         eax,[ebp-10]
 006BEE36    push        eax
 006BEE37    push        3
 006BEE39    push        6BF4D8
 006BEE3E    push        1
 006BEE40    push        6BF418
 006BEE45    push        6BFBF0
 006BEE4A    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEE4D    push        eax
 006BEE4E    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEE51    push        eax
 006BEE52    mov         eax,dword ptr [eax]
 006BEE54    call        dword ptr [eax+24]
 006BEE57    call        @CheckAutoResult
 006BEE5C    lea         eax,[ebp-3E8]
 006BEE62    mov         edx,1
 006BEE67    mov         cl,0FC
 006BEE69    call        @OleVarFromInt
 006BEE6E    lea         edx,[ebp-3E8]
 006BEE74    lea         eax,[ebp-10]
 006BEE77    call        @VarAdd
 006BEE7C    push        3F800000
 006BEE81    lea         eax,[ebp-10]
 006BEE84    push        eax
 006BEE85    push        3
 006BEE87    push        6BF4D8
 006BEE8C    push        1
 006BEE8E    push        6BF418
 006BEE93    push        6BFC20
 006BEE98    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEE9B    push        eax
 006BEE9C    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEE9F    push        eax
 006BEEA0    mov         eax,dword ptr [eax]
 006BEEA2    call        dword ptr [eax+24]
 006BEEA5    call        @CheckAutoResult
 006BEEAA    lea         eax,[ebp-3F8]
 006BEEB0    mov         edx,1
 006BEEB5    mov         cl,0FC
 006BEEB7    call        @OleVarFromInt
 006BEEBC    lea         edx,[ebp-3F8]
 006BEEC2    lea         eax,[ebp-10]
 006BEEC5    call        @VarAdd
 006BEECA    push        3F800000
 006BEECF    lea         eax,[ebp-10]
 006BEED2    push        eax
 006BEED3    push        3
 006BEED5    push        6BF4D8
 006BEEDA    push        1
 006BEEDC    push        6BF418
 006BEEE1    push        6BFC54
 006BEEE6    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEEE9    push        eax
 006BEEEA    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEEED    push        eax
 006BEEEE    mov         eax,dword ptr [eax]
 006BEEF0    call        dword ptr [eax+24]
 006BEEF3    call        @CheckAutoResult
 006BEEF8    lea         eax,[ebp-408]
 006BEEFE    mov         edx,1
 006BEF03    mov         cl,0FC
 006BEF05    call        @OleVarFromInt
 006BEF0A    lea         edx,[ebp-408]
 006BEF10    lea         eax,[ebp-10]
 006BEF13    call        @VarAdd
 006BEF18    push        3F800000
 006BEF1D    lea         eax,[ebp-10]
 006BEF20    push        eax
 006BEF21    push        3
 006BEF23    push        6BF4D8
 006BEF28    push        1
 006BEF2A    push        6BF418
 006BEF2F    push        6BFC88
 006BEF34    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEF37    push        eax
 006BEF38    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEF3B    push        eax
 006BEF3C    mov         eax,dword ptr [eax]
 006BEF3E    call        dword ptr [eax+24]
 006BEF41    call        @CheckAutoResult
 006BEF46    lea         eax,[ebp-418]
 006BEF4C    mov         edx,1
 006BEF51    mov         cl,0FC
 006BEF53    call        @OleVarFromInt
 006BEF58    lea         edx,[ebp-418]
 006BEF5E    lea         eax,[ebp-10]
 006BEF61    call        @VarAdd
 006BEF66    push        3F800000
 006BEF6B    lea         eax,[ebp-10]
 006BEF6E    push        eax
 006BEF6F    push        3
 006BEF71    push        6BF4D8
 006BEF76    push        1
 006BEF78    push        6BF418
 006BEF7D    push        6BFCA4
 006BEF82    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEF85    push        eax
 006BEF86    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEF89    push        eax
 006BEF8A    mov         eax,dword ptr [eax]
 006BEF8C    call        dword ptr [eax+24]
 006BEF8F    call        @CheckAutoResult
 006BEF94    lea         eax,[ebp-428]
 006BEF9A    mov         edx,1
 006BEF9F    mov         cl,0FC
 006BEFA1    call        @OleVarFromInt
 006BEFA6    lea         edx,[ebp-428]
 006BEFAC    lea         eax,[ebp-10]
 006BEFAF    call        @VarAdd
 006BEFB4    push        3F800000
 006BEFB9    lea         eax,[ebp-10]
 006BEFBC    push        eax
 006BEFBD    push        3
 006BEFBF    push        6BF4D8
 006BEFC4    push        1
 006BEFC6    push        6BF418
 006BEFCB    push        6BFCC8
 006BEFD0    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BEFD3    push        eax
 006BEFD4    mov         eax,dword ptr [ebx+4C];TSpeechRecogniser.PreRequestState:ISpeechGrammarRuleState
 006BEFD7    push        eax
 006BEFD8    mov         eax,dword ptr [eax]
 006BEFDA    call        dword ptr [eax+24]
 006BEFDD    call        @CheckAutoResult
 006BEFE2    lea         eax,[ebp-10]
 006BEFE5    xor         edx,edx
 006BEFE7    mov         cl,1
 006BEFE9    call        @OleVarFromInt
 006BEFEE    push        3F800000
 006BEFF3    lea         eax,[ebp-10]
 006BEFF6    push        eax
 006BEFF7    push        0
 006BEFF9    push        0
 006BEFFB    push        1
 006BEFFD    push        6BF418
 006BF002    push        0
 006BF004    mov         eax,dword ptr [ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BF007    push        eax
 006BF008    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BF00B    push        eax
 006BF00C    mov         eax,dword ptr [eax]
 006BF00E    call        dword ptr [eax+24]
 006BF011    call        @CheckAutoResult
 006BF016    push        3F800000
 006BF01B    lea         eax,[ebp-10]
 006BF01E    push        eax
 006BF01F    push        0
 006BF021    push        0
 006BF023    push        1
 006BF025    push        6BF418
 006BF02A    push        6BFCF0
 006BF02F    mov         eax,dword ptr [ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BF032    push        eax
 006BF033    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BF036    push        eax
 006BF037    mov         eax,dword ptr [eax]
 006BF039    call        dword ptr [eax+24]
 006BF03C    call        @CheckAutoResult
 006BF041    push        3F800000
 006BF046    lea         eax,[ebp-10]
 006BF049    push        eax
 006BF04A    push        0
 006BF04C    push        0
 006BF04E    push        1
 006BF050    push        6BF418
 006BF055    push        6BFCF8
 006BF05A    mov         eax,dword ptr [ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BF05D    push        eax
 006BF05E    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BF061    push        eax
 006BF062    mov         eax,dword ptr [eax]
 006BF064    call        dword ptr [eax+24]
 006BF067    call        @CheckAutoResult
 006BF06C    push        3F800000
 006BF071    lea         eax,[ebp-10]
 006BF074    push        eax
 006BF075    push        0
 006BF077    push        0
 006BF079    push        1
 006BF07B    push        6BF418
 006BF080    push        6BFD04
 006BF085    mov         eax,dword ptr [ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BF088    push        eax
 006BF089    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BF08C    push        eax
 006BF08D    mov         eax,dword ptr [eax]
 006BF08F    call        dword ptr [eax+24]
 006BF092    call        @CheckAutoResult
 006BF097    push        3F800000
 006BF09C    lea         eax,[ebp-10]
 006BF09F    push        eax
 006BF0A0    push        0
 006BF0A2    push        0
 006BF0A4    push        1
 006BF0A6    push        6BF418
 006BF0AB    push        6BFD14
 006BF0B0    mov         eax,dword ptr [ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BF0B3    push        eax
 006BF0B4    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BF0B7    push        eax
 006BF0B8    mov         eax,dword ptr [eax]
 006BF0BA    call        dword ptr [eax+24]
 006BF0BD    call        @CheckAutoResult
 006BF0C2    push        3F800000
 006BF0C7    lea         eax,[ebp-10]
 006BF0CA    push        eax
 006BF0CB    push        0
 006BF0CD    push        0
 006BF0CF    push        1
 006BF0D1    push        6BF418
 006BF0D6    push        6BFD24
 006BF0DB    mov         eax,dword ptr [ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BF0DE    push        eax
 006BF0DF    mov         eax,dword ptr [ebx+50];TSpeechRecogniser.ArticleState:ISpeechGrammarRuleState
 006BF0E2    push        eax
 006BF0E3    mov         eax,dword ptr [eax]
 006BF0E5    call        dword ptr [eax+24]
 006BF0E8    call        @CheckAutoResult
 006BF0ED    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 006BF0F2    mov         edx,dword ptr [eax]
 006BF0F4    call        dword ptr [edx+14]
 006BF0F7    mov         esi,eax
 006BF0F9    dec         esi
 006BF0FA    test        esi,esi
>006BF0FC    jl          006BF12C
 006BF0FE    inc         esi
 006BF0FF    mov         dword ptr [ebp-14],0
 006BF106    lea         ecx,[ebp-42C]
 006BF10C    mov         edx,dword ptr [ebp-14]
 006BF10F    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 006BF114    mov         edi,dword ptr [eax]
 006BF116    call        dword ptr [edi+0C]
 006BF119    mov         edx,dword ptr [ebp-42C]
 006BF11F    mov         eax,ebx
 006BF121    call        006BD994
 006BF126    inc         dword ptr [ebp-14]
 006BF129    dec         esi
>006BF12A    jne         006BF106
 006BF12C    lea         eax,[ebp-10]
 006BF12F    xor         edx,edx
 006BF131    mov         cl,1
 006BF133    call        @OleVarFromInt
 006BF138    push        3F800000
 006BF13D    lea         eax,[ebp-10]
 006BF140    push        eax
 006BF141    push        0
 006BF143    push        0
 006BF145    push        1
 006BF147    push        6BF418
 006BF14C    push        0
 006BF14E    push        0
 006BF150    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF153    push        eax
 006BF154    mov         eax,dword ptr [eax]
 006BF156    call        dword ptr [eax+24]
 006BF159    call        @CheckAutoResult
 006BF15E    push        3F800000
 006BF163    lea         eax,[ebp-10]
 006BF166    push        eax
 006BF167    push        0
 006BF169    push        0
 006BF16B    push        1
 006BF16D    push        6BF418
 006BF172    push        6BF420
 006BF177    push        0
 006BF179    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF17C    push        eax
 006BF17D    mov         eax,dword ptr [eax]
 006BF17F    call        dword ptr [eax+24]
 006BF182    call        @CheckAutoResult
 006BF187    push        3F800000
 006BF18C    lea         eax,[ebp-10]
 006BF18F    push        eax
 006BF190    push        0
 006BF192    push        0
 006BF194    push        1
 006BF196    push        6BF418
 006BF19B    push        6BFD34
 006BF1A0    push        0
 006BF1A2    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF1A5    push        eax
 006BF1A6    mov         eax,dword ptr [eax]
 006BF1A8    call        dword ptr [eax+24]
 006BF1AB    call        @CheckAutoResult
 006BF1B0    push        3F800000
 006BF1B5    lea         eax,[ebp-10]
 006BF1B8    push        eax
 006BF1B9    push        0
 006BF1BB    push        0
 006BF1BD    push        1
 006BF1BF    push        6BF418
 006BF1C4    push        6BFD40
 006BF1C9    push        0
 006BF1CB    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF1CE    push        eax
 006BF1CF    mov         eax,dword ptr [eax]
 006BF1D1    call        dword ptr [eax+24]
 006BF1D4    call        @CheckAutoResult
 006BF1D9    push        3F800000
 006BF1DE    lea         eax,[ebp-10]
 006BF1E1    push        eax
 006BF1E2    push        0
 006BF1E4    push        0
 006BF1E6    push        1
 006BF1E8    push        6BF418
 006BF1ED    push        6BFD5C
 006BF1F2    push        0
 006BF1F4    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF1F7    push        eax
 006BF1F8    mov         eax,dword ptr [eax]
 006BF1FA    call        dword ptr [eax+24]
 006BF1FD    call        @CheckAutoResult
 006BF202    push        3F800000
 006BF207    lea         eax,[ebp-10]
 006BF20A    push        eax
 006BF20B    push        0
 006BF20D    push        0
 006BF20F    push        1
 006BF211    push        6BF418
 006BF216    push        6BFD6C
 006BF21B    push        0
 006BF21D    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF220    push        eax
 006BF221    mov         eax,dword ptr [eax]
 006BF223    call        dword ptr [eax+24]
 006BF226    call        @CheckAutoResult
 006BF22B    push        3F800000
 006BF230    lea         eax,[ebp-10]
 006BF233    push        eax
 006BF234    push        0
 006BF236    push        0
 006BF238    push        1
 006BF23A    push        6BF418
 006BF23F    push        6BF434
 006BF244    push        0
 006BF246    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF249    push        eax
 006BF24A    mov         eax,dword ptr [eax]
 006BF24C    call        dword ptr [eax+24]
 006BF24F    call        @CheckAutoResult
 006BF254    push        3F800000
 006BF259    lea         eax,[ebp-10]
 006BF25C    push        eax
 006BF25D    push        0
 006BF25F    push        0
 006BF261    push        1
 006BF263    push        6BF418
 006BF268    push        6BF488
 006BF26D    push        0
 006BF26F    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF272    push        eax
 006BF273    mov         eax,dword ptr [eax]
 006BF275    call        dword ptr [eax+24]
 006BF278    call        @CheckAutoResult
 006BF27D    push        3F800000
 006BF282    lea         eax,[ebp-10]
 006BF285    push        eax
 006BF286    push        0
 006BF288    push        0
 006BF28A    push        1
 006BF28C    push        6BF418
 006BF291    push        6BF45C
 006BF296    push        0
 006BF298    mov         eax,dword ptr [ebx+58];TSpeechRecogniser.PostRequestState:ISpeechGrammarRuleState
 006BF29B    push        eax
 006BF29C    mov         eax,dword ptr [eax]
 006BF29E    call        dword ptr [eax+24]
 006BF2A1    call        @CheckAutoResult
 006BF2A6    lea         eax,[ebx+54];TSpeechRecogniser.RequestState:ISpeechGrammarRuleState
 006BF2A9    call        @IntfClear
 006BF2AE    lea         eax,[ebx+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006BF2B1    call        @IntfClear
 006BF2B6    lea         eax,[ebp-430]
 006BF2BC    call        @IntfClear
 006BF2C1    push        eax
 006BF2C2    mov         eax,dword ptr [ebx+44];TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006BF2C5    push        eax
 006BF2C6    mov         eax,dword ptr [eax]
 006BF2C8    call        dword ptr [eax+2C]
 006BF2CB    call        @CheckAutoResult
 006BF2D0    mov         eax,dword ptr [ebp-430]
 006BF2D6    push        eax
 006BF2D7    mov         eax,dword ptr [eax]
 006BF2D9    call        dword ptr [eax+34]
 006BF2DC    call        @CheckAutoResult
 006BF2E1    push        1
 006BF2E3    push        0
 006BF2E5    mov         eax,dword ptr [ebx+44];TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006BF2E8    push        eax
 006BF2E9    mov         eax,dword ptr [eax]
 006BF2EB    call        dword ptr [eax+4C]
 006BF2EE    call        @CheckAutoResult
 006BF2F3    xor         eax,eax
 006BF2F5    pop         edx
 006BF2F6    pop         ecx
 006BF2F7    pop         ecx
 006BF2F8    mov         dword ptr fs:[eax],edx
 006BF2FB    push        6BF39A
 006BF300    lea         eax,[ebp-430]
 006BF306    call        @IntfClear
 006BF30B    lea         eax,[ebp-42C]
 006BF311    call        @UStrClr
 006BF316    lea         eax,[ebp-428]
 006BF31C    mov         edx,dword ptr ds:[4012D4];OleVariant
 006BF322    mov         ecx,3B
 006BF327    call        @FinalizeArray
 006BF32C    lea         eax,[ebp-78]
 006BF32F    mov         edx,dword ptr ds:[5C58E0];ISpeechGrammarRuleState
 006BF335    mov         ecx,0A
 006BF33A    call        @FinalizeArray
 006BF33F    lea         eax,[ebp-50]
 006BF342    call        @IntfClear
 006BF347    lea         eax,[ebp-4C]
 006BF34A    call        @IntfClear
 006BF34F    lea         eax,[ebp-48]
 006BF352    call        @UStrClr
 006BF357    lea         eax,[ebp-44]
 006BF35A    call        @IntfClear
 006BF35F    lea         eax,[ebp-40]
 006BF362    call        @IntfClear
 006BF367    lea         eax,[ebp-3C]
 006BF36A    call        @VarClr
 006BF36F    lea         eax,[ebp-2C]
 006BF372    call        @IntfClear
 006BF377    lea         eax,[ebp-28]
 006BF37A    call        @VarClr
 006BF37F    lea         eax,[ebp-18]
 006BF382    call        @IntfClear
 006BF387    lea         eax,[ebp-10]
 006BF38A    call        @VarClr
 006BF38F    ret
>006BF390    jmp         @HandleFinally
>006BF395    jmp         006BF300
 006BF39A    pop         edi
 006BF39B    pop         esi
 006BF39C    pop         ebx
 006BF39D    mov         esp,ebp
 006BF39F    pop         ebp
 006BF3A0    ret
*}
end;

//006BFD84
procedure TSpeechRecogniser.SpSharedRecoContextRecognition(ASender:TObject; StreamNumber:Integer; Result:ISpeechRecoResult; RecognitionType:TOleEnum; StreamPosition:OleVariant);
begin
{*
 006BFD84    push        ebp
 006BFD85    mov         ebp,esp
 006BFD87    push        ecx
 006BFD88    mov         ecx,0F
 006BFD8D    push        0
 006BFD8F    push        0
 006BFD91    dec         ecx
>006BFD92    jne         006BFD8D
 006BFD94    xchg        ecx,dword ptr [ebp-4]
 006BFD97    push        ebx
 006BFD98    push        esi
 006BFD99    push        edi
 006BFD9A    mov         esi,dword ptr [ebp+10]
 006BFD9D    lea         edi,[ebp-18]
 006BFDA0    movs        dword ptr [edi],dword ptr [esi]
 006BFDA1    movs        dword ptr [edi],dword ptr [esi]
 006BFDA2    movs        dword ptr [edi],dword ptr [esi]
 006BFDA3    movs        dword ptr [edi],dword ptr [esi]
 006BFDA4    mov         ebx,eax
 006BFDA6    lea         eax,[ebp-18]
 006BFDA9    call        @VarAddRef
 006BFDAE    xor         eax,eax
 006BFDB0    push        ebp
 006BFDB1    push        6C017B
 006BFDB6    push        dword ptr fs:[eax]
 006BFDB9    mov         dword ptr fs:[eax],esp
 006BFDBC    lea         eax,[ebp-24]
 006BFDBF    call        @WStrClr
 006BFDC4    push        eax
 006BFDC5    push        0FF
 006BFDC7    push        0FF
 006BFDC9    push        0
 006BFDCB    lea         eax,[ebp-28]
 006BFDCE    call        @IntfClear
 006BFDD3    push        eax
 006BFDD4    mov         eax,dword ptr [ebp+8]
 006BFDD7    push        eax
 006BFDD8    mov         eax,dword ptr [eax]
 006BFDDA    call        dword ptr [eax+2C]
 006BFDDD    call        @CheckAutoResult
 006BFDE2    mov         eax,dword ptr [ebp-28]
 006BFDE5    push        eax
 006BFDE6    mov         eax,dword ptr [eax]
 006BFDE8    call        dword ptr [eax+54]
 006BFDEB    call        @CheckAutoResult
 006BFDF0    mov         edx,dword ptr [ebp-24]
 006BFDF3    lea         eax,[ebp-20]
 006BFDF6    call        @UStrFromWStr
 006BFDFB    mov         eax,dword ptr [ebp-20]
 006BFDFE    call        006BD86C
 006BFE03    lea         eax,[ebp-8]
 006BFE06    call        @IntfClear
 006BFE0B    push        eax
 006BFE0C    lea         eax,[ebp-2C]
 006BFE0F    call        @IntfClear
 006BFE14    push        eax
 006BFE15    mov         eax,dword ptr [ebp+8]
 006BFE18    push        eax
 006BFE19    mov         eax,dword ptr [eax]
 006BFE1B    call        dword ptr [eax+2C]
 006BFE1E    call        @CheckAutoResult
 006BFE23    mov         eax,dword ptr [ebp-2C]
 006BFE26    push        eax
 006BFE27    mov         eax,dword ptr [eax]
 006BFE29    call        dword ptr [eax+3C]
 006BFE2C    call        @CheckAutoResult
 006BFE31    mov         byte ptr [ebp-19],0
 006BFE35    mov         byte ptr [ebp-1A],0
 006BFE39    cmp         dword ptr [ebp-8],0
>006BFE3D    je          006BFF73
 006BFE43    lea         eax,[ebp-30]
 006BFE46    push        eax
 006BFE47    mov         eax,dword ptr [ebp-8]
 006BFE4A    push        eax
 006BFE4B    mov         eax,dword ptr [eax]
 006BFE4D    call        dword ptr [eax+1C]
 006BFE50    call        @CheckAutoResult
 006BFE55    mov         edi,dword ptr [ebp-30]
 006BFE58    dec         edi
 006BFE59    test        edi,edi
>006BFE5B    jl          006BFF73
 006BFE61    inc         edi
 006BFE62    xor         esi,esi
 006BFE64    lea         eax,[ebp-34]
 006BFE67    call        @WStrClr
 006BFE6C    push        eax
 006BFE6D    lea         eax,[ebp-38]
 006BFE70    call        @IntfClear
 006BFE75    push        eax
 006BFE76    push        esi
 006BFE77    mov         eax,dword ptr [ebp-8]
 006BFE7A    push        eax
 006BFE7B    mov         eax,dword ptr [eax]
 006BFE7D    call        dword ptr [eax+20]
 006BFE80    call        @CheckAutoResult
 006BFE85    mov         eax,dword ptr [ebp-38]
 006BFE88    push        eax
 006BFE89    mov         eax,dword ptr [eax]
 006BFE8B    call        dword ptr [eax+1C]
 006BFE8E    call        @CheckAutoResult
 006BFE93    mov         eax,dword ptr [ebp-34]
 006BFE96    mov         edx,6C0194;'askedfor'
 006BFE9B    call        @WStrEqual
>006BFEA0    jne         006BFEE5
 006BFEA2    mov         byte ptr [ebp-19],1
 006BFEA6    lea         eax,[ebp-48]
 006BFEA9    call        @VarClr
 006BFEAE    push        eax
 006BFEAF    lea         eax,[ebp-4C]
 006BFEB2    call        @IntfClear
 006BFEB7    push        eax
 006BFEB8    push        esi
 006BFEB9    mov         eax,dword ptr [ebp-8]
 006BFEBC    push        eax
 006BFEBD    mov         eax,dword ptr [eax]
 006BFEBF    call        dword ptr [eax+20]
 006BFEC2    call        @CheckAutoResult
 006BFEC7    mov         eax,dword ptr [ebp-4C]
 006BFECA    push        eax
 006BFECB    mov         eax,dword ptr [eax]
 006BFECD    call        dword ptr [eax+24]
 006BFED0    call        @CheckAutoResult
 006BFED5    lea         eax,[ebp-48]
 006BFED8    lea         edx,[ebp-4]
 006BFEDB    call        VarToStr
>006BFEE0    jmp         006BFF6B
 006BFEE5    lea         eax,[ebp-50]
 006BFEE8    call        @WStrClr
 006BFEED    push        eax
 006BFEEE    lea         eax,[ebp-54]
 006BFEF1    call        @IntfClear
 006BFEF6    push        eax
 006BFEF7    push        esi
 006BFEF8    mov         eax,dword ptr [ebp-8]
 006BFEFB    push        eax
 006BFEFC    mov         eax,dword ptr [eax]
 006BFEFE    call        dword ptr [eax+20]
 006BFF01    call        @CheckAutoResult
 006BFF06    mov         eax,dword ptr [ebp-54]
 006BFF09    push        eax
 006BFF0A    mov         eax,dword ptr [eax]
 006BFF0C    call        dword ptr [eax+1C]
 006BFF0F    call        @CheckAutoResult
 006BFF14    mov         eax,dword ptr [ebp-50]
 006BFF17    mov         edx,6C01AC;'said'
 006BFF1C    call        @WStrEqual
>006BFF21    jne         006BFF29
 006BFF23    mov         byte ptr [ebp-19],0
>006BFF27    jmp         006BFF6B
 006BFF29    lea         eax,[ebp-58]
 006BFF2C    call        @WStrClr
 006BFF31    push        eax
 006BFF32    lea         eax,[ebp-5C]
 006BFF35    call        @IntfClear
 006BFF3A    push        eax
 006BFF3B    push        esi
 006BFF3C    mov         eax,dword ptr [ebp-8]
 006BFF3F    push        eax
 006BFF40    mov         eax,dword ptr [eax]
 006BFF42    call        dword ptr [eax+20]
 006BFF45    call        @CheckAutoResult
 006BFF4A    mov         eax,dword ptr [ebp-5C]
 006BFF4D    push        eax
 006BFF4E    mov         eax,dword ptr [eax]
 006BFF50    call        dword ptr [eax+1C]
 006BFF53    call        @CheckAutoResult
 006BFF58    mov         eax,dword ptr [ebp-58]
 006BFF5B    mov         edx,6C01BC;'norequesttype'
 006BFF60    call        @WStrEqual
>006BFF65    jne         006BFF6B
 006BFF67    mov         byte ptr [ebp-1A],1
 006BFF6B    inc         esi
 006BFF6C    dec         edi
>006BFF6D    jne         006BFE64
 006BFF73    mov         byte ptr [ebx+39],0
 006BFF77    mov         byte ptr [ebx+8],1
 006BFF7B    cmp         byte ptr [ebp-19],0
>006BFF7F    jne         006BFFC0
 006BFF81    lea         eax,[ebp-60]
 006BFF84    call        @WStrClr
 006BFF89    push        eax
 006BFF8A    push        0FF
 006BFF8C    push        0FF
 006BFF8E    push        0
 006BFF90    lea         eax,[ebp-64]
 006BFF93    call        @IntfClear
 006BFF98    push        eax
 006BFF99    mov         eax,dword ptr [ebp+8]
 006BFF9C    push        eax
 006BFF9D    mov         eax,dword ptr [eax]
 006BFF9F    call        dword ptr [eax+2C]
 006BFFA2    call        @CheckAutoResult
 006BFFA7    mov         eax,dword ptr [ebp-64]
 006BFFAA    push        eax
 006BFFAB    mov         eax,dword ptr [eax]
 006BFFAD    call        dword ptr [eax+54]
 006BFFB0    call        @CheckAutoResult
 006BFFB5    mov         edx,dword ptr [ebp-60]
 006BFFB8    lea         eax,[ebp-4]
 006BFFBB    call        @UStrFromWStr
 006BFFC0    lea         eax,[ebp-30]
 006BFFC3    push        eax
 006BFFC4    lea         eax,[ebp-68]
 006BFFC7    call        @IntfClear
 006BFFCC    push        eax
 006BFFCD    lea         eax,[ebp-6C]
 006BFFD0    call        @IntfClear
 006BFFD5    push        eax
 006BFFD6    mov         eax,dword ptr [ebp+8]
 006BFFD9    push        eax
 006BFFDA    mov         eax,dword ptr [eax]
 006BFFDC    call        dword ptr [eax+2C]
 006BFFDF    call        @CheckAutoResult
 006BFFE4    mov         eax,dword ptr [ebp-6C]
 006BFFE7    push        eax
 006BFFE8    mov         eax,dword ptr [eax]
 006BFFEA    call        dword ptr [eax+38]
 006BFFED    call        @CheckAutoResult
 006BFFF2    mov         eax,dword ptr [ebp-68]
 006BFFF5    push        eax
 006BFFF6    mov         eax,dword ptr [eax]
 006BFFF8    call        dword ptr [eax+34]
 006BFFFB    call        @CheckAutoResult
 006C0000    mov         esi,dword ptr [ebp-30]
 006C0003    cmp         byte ptr [ebp-1A],0
>006C0007    je          006C000E
 006C0009    mov         esi,0FFFFFFFA
 006C000E    lea         eax,[esi+2]
 006C0011    mov         edx,eax
 006C0013    add         edx,3
 006C0016    mov         dword ptr [ebx+4],edx;TSpeechRecogniser.State:TSpeechState
 006C0019    movzx       edx,byte ptr [ebp-19]
 006C001D    mov         byte ptr [ebx+10],dl
 006C0020    mov         dword ptr [ebx+18],eax
 006C0023    lea         eax,[ebx+14]
 006C0026    mov         edx,dword ptr [ebp-4]
 006C0029    call        @UStrAsg
 006C002E    lea         eax,[ebx+30]
 006C0031    mov         edx,dword ptr [ebp-4]
 006C0034    call        @UStrAsg
 006C0039    cmp         byte ptr [ebx+2C],0
>006C003D    je          006C0084
 006C003F    mov         edx,dword ptr [ebp-4]
 006C0042    mov         eax,dword ptr [ebx+24]
 006C0045    call        006BD2D0
 006C004A    test        al,al
>006C004C    je          006C0084
 006C004E    mov         byte ptr [ebx+1C],1
 006C0052    push        6C01E4;'Recognised, but already guessed "'
 006C0057    push        dword ptr [ebp-4]
 006C005A    push        6C0234;'", '
 006C005F    lea         edx,[ebp-74]
 006C0062    lea         eax,[esi+5]
 006C0065    call        IntToStr
 006C006A    push        dword ptr [ebp-74]
 006C006D    lea         eax,[ebp-70]
 006C0070    mov         edx,4
 006C0075    call        @UStrCatN
 006C007A    mov         eax,dword ptr [ebp-70]
 006C007D    call        006BD86C
>006C0082    jmp         006C00B4
 006C0084    push        6C0248;'Recognised "'
 006C0089    push        dword ptr [ebp-4]
 006C008C    push        6C0234;'", '
 006C0091    lea         edx,[ebp-7C]
 006C0094    lea         eax,[esi+5]
 006C0097    call        IntToStr
 006C009C    push        dword ptr [ebp-7C]
 006C009F    lea         eax,[ebp-78]
 006C00A2    mov         edx,4
 006C00A7    call        @UStrCatN
 006C00AC    mov         eax,dword ptr [ebp-78]
 006C00AF    call        006BD86C
 006C00B4    lea         eax,[ebx+24]
 006C00B7    call        @UStrClr
 006C00BC    xor         eax,eax
 006C00BE    mov         dword ptr [ebx+28],eax
 006C00C1    mov         byte ptr [ebx+2C],0
 006C00C5    xor         eax,eax
 006C00C7    pop         edx
 006C00C8    pop         ecx
 006C00C9    pop         ecx
 006C00CA    mov         dword ptr fs:[eax],edx
 006C00CD    push        6C0185
 006C00D2    lea         eax,[ebp-7C]
 006C00D5    mov         edx,4
 006C00DA    call        @UStrArrayClr
 006C00DF    lea         eax,[ebp-6C]
 006C00E2    call        @IntfClear
 006C00E7    lea         eax,[ebp-68]
 006C00EA    call        @IntfClear
 006C00EF    lea         eax,[ebp-64]
 006C00F2    call        @IntfClear
 006C00F7    lea         eax,[ebp-60]
 006C00FA    call        @WStrClr
 006C00FF    lea         eax,[ebp-5C]
 006C0102    call        @IntfClear
 006C0107    lea         eax,[ebp-58]
 006C010A    call        @WStrClr
 006C010F    lea         eax,[ebp-54]
 006C0112    call        @IntfClear
 006C0117    lea         eax,[ebp-50]
 006C011A    call        @WStrClr
 006C011F    lea         eax,[ebp-4C]
 006C0122    call        @IntfClear
 006C0127    lea         eax,[ebp-48]
 006C012A    call        @VarClr
 006C012F    lea         eax,[ebp-38]
 006C0132    call        @IntfClear
 006C0137    lea         eax,[ebp-34]
 006C013A    call        @WStrClr
 006C013F    lea         eax,[ebp-2C]
 006C0142    mov         edx,dword ptr ds:[5C5968];ISpeechPhraseInfo
 006C0148    mov         ecx,2
 006C014D    call        @FinalizeArray
 006C0152    lea         eax,[ebp-24]
 006C0155    call        @WStrClr
 006C015A    lea         eax,[ebp-20]
 006C015D    call        @UStrClr
 006C0162    lea         eax,[ebp-18]
 006C0165    call        @VarClr
 006C016A    lea         eax,[ebp-8]
 006C016D    call        @IntfClear
 006C0172    lea         eax,[ebp-4]
 006C0175    call        @UStrClr
 006C017A    ret
>006C017B    jmp         @HandleFinally
>006C0180    jmp         006C00D2
 006C0185    pop         edi
 006C0186    pop         esi
 006C0187    pop         ebx
 006C0188    mov         esp,ebp
 006C018A    pop         ebp
 006C018B    ret         0C
*}
end;

//006C0264
procedure TSpeechRecogniser.SpSharedRecoContextHypothesis(ASender:TObject; StreamNumber:Integer; Result:ISpeechRecoResult; StreamPosition:OleVariant);
begin
{*
 006C0264    push        ebp
 006C0265    mov         ebp,esp
 006C0267    push        ecx
 006C0268    mov         ecx,0E
 006C026D    push        0
 006C026F    push        0
 006C0271    dec         ecx
>006C0272    jne         006C026D
 006C0274    push        ecx
 006C0275    xchg        ecx,dword ptr [ebp-4]
 006C0278    push        ebx
 006C0279    push        esi
 006C027A    push        edi
 006C027B    mov         esi,dword ptr [ebp+0C]
 006C027E    lea         edi,[ebp-18]
 006C0281    movs        dword ptr [edi],dword ptr [esi]
 006C0282    movs        dword ptr [edi],dword ptr [esi]
 006C0283    movs        dword ptr [edi],dword ptr [esi]
 006C0284    movs        dword ptr [edi],dword ptr [esi]
 006C0285    mov         ebx,eax
 006C0287    lea         eax,[ebp-18]
 006C028A    call        @VarAddRef
 006C028F    xor         eax,eax
 006C0291    push        ebp
 006C0292    push        6C061D
 006C0297    push        dword ptr fs:[eax]
 006C029A    mov         dword ptr fs:[eax],esp
 006C029D    mov         byte ptr [ebp-19],0
 006C02A1    mov         byte ptr [ebp-1A],0
 006C02A5    lea         eax,[ebp-8]
 006C02A8    call        @IntfClear
 006C02AD    push        eax
 006C02AE    lea         eax,[ebp-20]
 006C02B1    call        @IntfClear
 006C02B6    push        eax
 006C02B7    mov         eax,dword ptr [ebp+8]
 006C02BA    push        eax
 006C02BB    mov         eax,dword ptr [eax]
 006C02BD    call        dword ptr [eax+2C]
 006C02C0    call        @CheckAutoResult
 006C02C5    mov         eax,dword ptr [ebp-20]
 006C02C8    push        eax
 006C02C9    mov         eax,dword ptr [eax]
 006C02CB    call        dword ptr [eax+3C]
 006C02CE    call        @CheckAutoResult
 006C02D3    cmp         dword ptr [ebp-8],0
>006C02D7    je          006C040D
 006C02DD    lea         eax,[ebp-24]
 006C02E0    push        eax
 006C02E1    mov         eax,dword ptr [ebp-8]
 006C02E4    push        eax
 006C02E5    mov         eax,dword ptr [eax]
 006C02E7    call        dword ptr [eax+1C]
 006C02EA    call        @CheckAutoResult
 006C02EF    mov         edi,dword ptr [ebp-24]
 006C02F2    dec         edi
 006C02F3    test        edi,edi
>006C02F5    jl          006C040D
 006C02FB    inc         edi
 006C02FC    xor         esi,esi
 006C02FE    lea         eax,[ebp-28]
 006C0301    call        @WStrClr
 006C0306    push        eax
 006C0307    lea         eax,[ebp-2C]
 006C030A    call        @IntfClear
 006C030F    push        eax
 006C0310    push        esi
 006C0311    mov         eax,dword ptr [ebp-8]
 006C0314    push        eax
 006C0315    mov         eax,dword ptr [eax]
 006C0317    call        dword ptr [eax+20]
 006C031A    call        @CheckAutoResult
 006C031F    mov         eax,dword ptr [ebp-2C]
 006C0322    push        eax
 006C0323    mov         eax,dword ptr [eax]
 006C0325    call        dword ptr [eax+1C]
 006C0328    call        @CheckAutoResult
 006C032D    mov         eax,dword ptr [ebp-28]
 006C0330    mov         edx,6C0634;'askedfor'
 006C0335    call        @WStrEqual
>006C033A    jne         006C037F
 006C033C    mov         byte ptr [ebp-19],1
 006C0340    lea         eax,[ebp-3C]
 006C0343    call        @VarClr
 006C0348    push        eax
 006C0349    lea         eax,[ebp-40]
 006C034C    call        @IntfClear
 006C0351    push        eax
 006C0352    push        esi
 006C0353    mov         eax,dword ptr [ebp-8]
 006C0356    push        eax
 006C0357    mov         eax,dword ptr [eax]
 006C0359    call        dword ptr [eax+20]
 006C035C    call        @CheckAutoResult
 006C0361    mov         eax,dword ptr [ebp-40]
 006C0364    push        eax
 006C0365    mov         eax,dword ptr [eax]
 006C0367    call        dword ptr [eax+24]
 006C036A    call        @CheckAutoResult
 006C036F    lea         eax,[ebp-3C]
 006C0372    lea         edx,[ebp-4]
 006C0375    call        VarToStr
>006C037A    jmp         006C0405
 006C037F    lea         eax,[ebp-44]
 006C0382    call        @WStrClr
 006C0387    push        eax
 006C0388    lea         eax,[ebp-48]
 006C038B    call        @IntfClear
 006C0390    push        eax
 006C0391    push        esi
 006C0392    mov         eax,dword ptr [ebp-8]
 006C0395    push        eax
 006C0396    mov         eax,dword ptr [eax]
 006C0398    call        dword ptr [eax+20]
 006C039B    call        @CheckAutoResult
 006C03A0    mov         eax,dword ptr [ebp-48]
 006C03A3    push        eax
 006C03A4    mov         eax,dword ptr [eax]
 006C03A6    call        dword ptr [eax+1C]
 006C03A9    call        @CheckAutoResult
 006C03AE    mov         eax,dword ptr [ebp-44]
 006C03B1    mov         edx,6C064C;'said'
 006C03B6    call        @WStrEqual
>006C03BB    jne         006C03C3
 006C03BD    mov         byte ptr [ebp-19],0
>006C03C1    jmp         006C0405
 006C03C3    lea         eax,[ebp-4C]
 006C03C6    call        @WStrClr
 006C03CB    push        eax
 006C03CC    lea         eax,[ebp-50]
 006C03CF    call        @IntfClear
 006C03D4    push        eax
 006C03D5    push        esi
 006C03D6    mov         eax,dword ptr [ebp-8]
 006C03D9    push        eax
 006C03DA    mov         eax,dword ptr [eax]
 006C03DC    call        dword ptr [eax+20]
 006C03DF    call        @CheckAutoResult
 006C03E4    mov         eax,dword ptr [ebp-50]
 006C03E7    push        eax
 006C03E8    mov         eax,dword ptr [eax]
 006C03EA    call        dword ptr [eax+1C]
 006C03ED    call        @CheckAutoResult
 006C03F2    mov         eax,dword ptr [ebp-4C]
 006C03F5    mov         edx,6C065C;'norequesttype'
 006C03FA    call        @WStrEqual
>006C03FF    jne         006C0405
 006C0401    mov         byte ptr [ebp-1A],1
 006C0405    inc         esi
 006C0406    dec         edi
>006C0407    jne         006C02FE
 006C040D    cmp         byte ptr [ebp-19],0
>006C0411    jne         006C0452
 006C0413    lea         eax,[ebp-54]
 006C0416    call        @WStrClr
 006C041B    push        eax
 006C041C    push        0FF
 006C041E    push        0FF
 006C0420    push        0
 006C0422    lea         eax,[ebp-58]
 006C0425    call        @IntfClear
 006C042A    push        eax
 006C042B    mov         eax,dword ptr [ebp+8]
 006C042E    push        eax
 006C042F    mov         eax,dword ptr [eax]
 006C0431    call        dword ptr [eax+2C]
 006C0434    call        @CheckAutoResult
 006C0439    mov         eax,dword ptr [ebp-58]
 006C043C    push        eax
 006C043D    mov         eax,dword ptr [eax]
 006C043F    call        dword ptr [eax+54]
 006C0442    call        @CheckAutoResult
 006C0447    mov         edx,dword ptr [ebp-54]
 006C044A    lea         eax,[ebp-4]
 006C044D    call        @UStrFromWStr
 006C0452    movzx       eax,byte ptr [ebp-19]
 006C0456    mov         byte ptr [ebx+10],al
 006C0459    lea         eax,[ebp-24]
 006C045C    push        eax
 006C045D    lea         eax,[ebp-5C]
 006C0460    call        @IntfClear
 006C0465    push        eax
 006C0466    lea         eax,[ebp-60]
 006C0469    call        @IntfClear
 006C046E    push        eax
 006C046F    mov         eax,dword ptr [ebp+8]
 006C0472    push        eax
 006C0473    mov         eax,dword ptr [eax]
 006C0475    call        dword ptr [eax+2C]
 006C0478    call        @CheckAutoResult
 006C047D    mov         eax,dword ptr [ebp-60]
 006C0480    push        eax
 006C0481    mov         eax,dword ptr [eax]
 006C0483    call        dword ptr [eax+38]
 006C0486    call        @CheckAutoResult
 006C048B    mov         eax,dword ptr [ebp-5C]
 006C048E    push        eax
 006C048F    mov         eax,dword ptr [eax]
 006C0491    call        dword ptr [eax+34]
 006C0494    call        @CheckAutoResult
 006C0499    mov         esi,dword ptr [ebp-24]
 006C049C    cmp         byte ptr [ebp-1A],0
>006C04A0    je          006C04A7
 006C04A2    mov         esi,0FFFFFFFD
 006C04A7    lea         edi,[esi+2]
 006C04AA    mov         dword ptr [ebx+4],edi;TSpeechRecogniser.State:TSpeechState
 006C04AD    lea         eax,[ebx+30]
 006C04B0    mov         edx,dword ptr [ebp-4]
 006C04B3    call        @UStrAsg
 006C04B8    mov         edx,dword ptr [ebx+24]
 006C04BB    mov         eax,dword ptr [ebp-4]
 006C04BE    call        006BD2D0
 006C04C3    test        al,al
>006C04C5    jne         006C050A
 006C04C7    push        6C0684;'New guess: "'
 006C04CC    push        dword ptr [ebp-4]
 006C04CF    push        6C06AC;'", '
 006C04D4    lea         edx,[ebp-68]
 006C04D7    mov         eax,edi
 006C04D9    call        IntToStr
 006C04DE    push        dword ptr [ebp-68]
 006C04E1    lea         eax,[ebp-64]
 006C04E4    mov         edx,4
 006C04E9    call        @UStrCatN
 006C04EE    mov         eax,dword ptr [ebp-64]
 006C04F1    call        006BD86C
 006C04F6    lea         eax,[ebx+24]
 006C04F9    mov         edx,dword ptr [ebp-4]
 006C04FC    call        @UStrAsg
 006C0501    mov         dword ptr [ebx+28],edi
 006C0504    mov         byte ptr [ebx+2C],0
>006C0508    jmp         006C0582
 006C050A    cmp         byte ptr [ebx+2C],0
>006C050E    jne         006C0553
 006C0510    push        6C06C0;'Improved guess: "'
 006C0515    push        dword ptr [ebp-4]
 006C0518    push        6C06AC;'", '
 006C051D    lea         edx,[ebp-70]
 006C0520    mov         eax,edi
 006C0522    call        IntToStr
 006C0527    push        dword ptr [ebp-70]
 006C052A    lea         eax,[ebp-6C]
 006C052D    mov         edx,4
 006C0532    call        @UStrCatN
 006C0537    mov         eax,dword ptr [ebp-6C]
 006C053A    call        006BD86C
 006C053F    lea         eax,[ebx+24]
 006C0542    mov         edx,dword ptr [ebp-4]
 006C0545    call        @UStrAsg
 006C054A    mov         dword ptr [ebx+28],edi
 006C054D    mov         byte ptr [ebx+2C],0
>006C0551    jmp         006C0582
 006C0553    push        6C06F0;'Unnecessary guess improvement: "'
 006C0558    push        dword ptr [ebp-4]
 006C055B    push        6C06AC;'", '
 006C0560    lea         edx,[ebp-78]
 006C0563    mov         eax,edi
 006C0565    call        IntToStr
 006C056A    push        dword ptr [ebp-78]
 006C056D    lea         eax,[ebp-74]
 006C0570    mov         edx,4
 006C0575    call        @UStrCatN
 006C057A    mov         eax,dword ptr [ebp-74]
 006C057D    call        006BD86C
 006C0582    xor         eax,eax
 006C0584    pop         edx
 006C0585    pop         ecx
 006C0586    pop         ecx
 006C0587    mov         dword ptr fs:[eax],edx
 006C058A    push        6C0627
 006C058F    lea         eax,[ebp-78]
 006C0592    mov         edx,6
 006C0597    call        @UStrArrayClr
 006C059C    lea         eax,[ebp-60]
 006C059F    call        @IntfClear
 006C05A4    lea         eax,[ebp-5C]
 006C05A7    call        @IntfClear
 006C05AC    lea         eax,[ebp-58]
 006C05AF    call        @IntfClear
 006C05B4    lea         eax,[ebp-54]
 006C05B7    call        @WStrClr
 006C05BC    lea         eax,[ebp-50]
 006C05BF    call        @IntfClear
 006C05C4    lea         eax,[ebp-4C]
 006C05C7    call        @WStrClr
 006C05CC    lea         eax,[ebp-48]
 006C05CF    call        @IntfClear
 006C05D4    lea         eax,[ebp-44]
 006C05D7    call        @WStrClr
 006C05DC    lea         eax,[ebp-40]
 006C05DF    call        @IntfClear
 006C05E4    lea         eax,[ebp-3C]
 006C05E7    call        @VarClr
 006C05EC    lea         eax,[ebp-2C]
 006C05EF    call        @IntfClear
 006C05F4    lea         eax,[ebp-28]
 006C05F7    call        @WStrClr
 006C05FC    lea         eax,[ebp-20]
 006C05FF    call        @IntfClear
 006C0604    lea         eax,[ebp-18]
 006C0607    call        @VarClr
 006C060C    lea         eax,[ebp-8]
 006C060F    call        @IntfClear
 006C0614    lea         eax,[ebp-4]
 006C0617    call        @UStrClr
 006C061C    ret
>006C061D    jmp         @HandleFinally
>006C0622    jmp         006C058F
 006C0627    pop         edi
 006C0628    pop         esi
 006C0629    pop         ebx
 006C062A    mov         esp,ebp
 006C062C    pop         ebp
 006C062D    ret         8
*}
end;

//006C0734
procedure TSpeechRecogniser.SpSharedRecoContextSoundStart(Sender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);
begin
{*
 006C0734    push        ebp
 006C0735    mov         ebp,esp
 006C0737    add         esp,0FFFFFFF0
 006C073A    push        ebx
 006C073B    push        esi
 006C073C    push        edi
 006C073D    mov         esi,dword ptr [ebp+8]
 006C0740    lea         edi,[ebp-10]
 006C0743    movs        dword ptr [edi],dword ptr [esi]
 006C0744    movs        dword ptr [edi],dword ptr [esi]
 006C0745    movs        dword ptr [edi],dword ptr [esi]
 006C0746    movs        dword ptr [edi],dword ptr [esi]
 006C0747    mov         ebx,eax
 006C0749    lea         eax,[ebp-10]
 006C074C    call        @VarAddRef
 006C0751    xor         eax,eax
 006C0753    push        ebp
 006C0754    push        6C0794
 006C0759    push        dword ptr fs:[eax]
 006C075C    mov         dword ptr fs:[eax],esp
 006C075F    mov         eax,6C07B0;'Sound started'
 006C0764    call        006BD86C
 006C0769    mov         byte ptr [ebx+38],1
 006C076D    lea         eax,[ebx+24]
 006C0770    call        @UStrClr
 006C0775    xor         eax,eax
 006C0777    mov         dword ptr [ebx+28],eax
 006C077A    mov         byte ptr [ebx+2C],0
 006C077E    xor         eax,eax
 006C0780    pop         edx
 006C0781    pop         ecx
 006C0782    pop         ecx
 006C0783    mov         dword ptr fs:[eax],edx
 006C0786    push        6C079B
 006C078B    lea         eax,[ebp-10]
 006C078E    call        @VarClr
 006C0793    ret
>006C0794    jmp         @HandleFinally
>006C0799    jmp         006C078B
 006C079B    pop         edi
 006C079C    pop         esi
 006C079D    pop         ebx
 006C079E    mov         esp,ebp
 006C07A0    pop         ebp
 006C07A1    ret         4
*}
end;

//006C07CC
procedure TSpeechRecogniser.SpSharedRecoContextSoundEnd(Sender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);
begin
{*
 006C07CC    push        ebp
 006C07CD    mov         ebp,esp
 006C07CF    add         esp,0FFFFFFF0
 006C07D2    push        ebx
 006C07D3    push        esi
 006C07D4    push        edi
 006C07D5    mov         esi,dword ptr [ebp+8]
 006C07D8    lea         edi,[ebp-10]
 006C07DB    movs        dword ptr [edi],dword ptr [esi]
 006C07DC    movs        dword ptr [edi],dword ptr [esi]
 006C07DD    movs        dword ptr [edi],dword ptr [esi]
 006C07DE    movs        dword ptr [edi],dword ptr [esi]
 006C07DF    mov         ebx,eax
 006C07E1    lea         eax,[ebp-10]
 006C07E4    call        @VarAddRef
 006C07E9    xor         eax,eax
 006C07EB    push        ebp
 006C07EC    push        6C081B
 006C07F1    push        dword ptr fs:[eax]
 006C07F4    mov         dword ptr fs:[eax],esp
 006C07F7    mov         eax,6C0838;'Sound finished'
 006C07FC    call        006BD86C
 006C0801    mov         byte ptr [ebx+38],0
 006C0805    xor         eax,eax
 006C0807    pop         edx
 006C0808    pop         ecx
 006C0809    pop         ecx
 006C080A    mov         dword ptr fs:[eax],edx
 006C080D    push        6C0822
 006C0812    lea         eax,[ebp-10]
 006C0815    call        @VarClr
 006C081A    ret
>006C081B    jmp         @HandleFinally
>006C0820    jmp         006C0812
 006C0822    pop         edi
 006C0823    pop         esi
 006C0824    pop         ebx
 006C0825    mov         esp,ebp
 006C0827    pop         ebp
 006C0828    ret         4
*}
end;

//006C0858
procedure TSpeechRecogniser.SpSharedRecoContextStartStream(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);
begin
{*
 006C0858    push        ebp
 006C0859    mov         ebp,esp
 006C085B    add         esp,0FFFFFFF0
 006C085E    push        esi
 006C085F    push        edi
 006C0860    mov         esi,dword ptr [ebp+8]
 006C0863    lea         edi,[ebp-10]
 006C0866    movs        dword ptr [edi],dword ptr [esi]
 006C0867    movs        dword ptr [edi],dword ptr [esi]
 006C0868    movs        dword ptr [edi],dword ptr [esi]
 006C0869    movs        dword ptr [edi],dword ptr [esi]
 006C086A    lea         eax,[ebp-10]
 006C086D    call        @VarAddRef
 006C0872    xor         eax,eax
 006C0874    push        ebp
 006C0875    push        6C08A0
 006C087A    push        dword ptr fs:[eax]
 006C087D    mov         dword ptr fs:[eax],esp
 006C0880    mov         eax,6C08BC;'StartStream'
 006C0885    call        006BD86C
 006C088A    xor         eax,eax
 006C088C    pop         edx
 006C088D    pop         ecx
 006C088E    pop         ecx
 006C088F    mov         dword ptr fs:[eax],edx
 006C0892    push        6C08A7
 006C0897    lea         eax,[ebp-10]
 006C089A    call        @VarClr
 006C089F    ret
>006C08A0    jmp         @HandleFinally
>006C08A5    jmp         006C0897
 006C08A7    pop         edi
 006C08A8    pop         esi
 006C08A9    mov         esp,ebp
 006C08AB    pop         ebp
 006C08AC    ret         4
*}
end;

//006C08D4
procedure TSpeechRecogniser.SpSharedRecoContextEndStream(ASender:TObject; StreamNumber:Integer; StreamReleased:WordBool; StreamPosition:OleVariant);
begin
{*
 006C08D4    push        ebp
 006C08D5    mov         ebp,esp
 006C08D7    add         esp,0FFFFFFF0
 006C08DA    push        esi
 006C08DB    push        edi
 006C08DC    mov         esi,dword ptr [ebp+0C]
 006C08DF    lea         edi,[ebp-10]
 006C08E2    movs        dword ptr [edi],dword ptr [esi]
 006C08E3    movs        dword ptr [edi],dword ptr [esi]
 006C08E4    movs        dword ptr [edi],dword ptr [esi]
 006C08E5    movs        dword ptr [edi],dword ptr [esi]
 006C08E6    lea         eax,[ebp-10]
 006C08E9    call        @VarAddRef
 006C08EE    xor         eax,eax
 006C08F0    push        ebp
 006C08F1    push        6C091C
 006C08F6    push        dword ptr fs:[eax]
 006C08F9    mov         dword ptr fs:[eax],esp
 006C08FC    mov         eax,6C0938;'EndStream'
 006C0901    call        006BD86C
 006C0906    xor         eax,eax
 006C0908    pop         edx
 006C0909    pop         ecx
 006C090A    pop         ecx
 006C090B    mov         dword ptr fs:[eax],edx
 006C090E    push        6C0923
 006C0913    lea         eax,[ebp-10]
 006C0916    call        @VarClr
 006C091B    ret
>006C091C    jmp         @HandleFinally
>006C0921    jmp         006C0913
 006C0923    pop         edi
 006C0924    pop         esi
 006C0925    mov         esp,ebp
 006C0927    pop         ebp
 006C0928    ret         8
*}
end;

//006C094C
procedure TSpeechRecogniser.SpSharedRecoContextBookmark(ASender:TObject; StreamNumber:Integer; Options:TOleEnum; BookmarkId:OleVariant; StreamPosition:OleVariant);
begin
{*
 006C094C    push        ebp
 006C094D    mov         ebp,esp
 006C094F    add         esp,0FFFFFFE0
 006C0952    push        esi
 006C0953    push        edi
 006C0954    mov         esi,dword ptr [ebp+0C]
 006C0957    lea         edi,[ebp-20]
 006C095A    movs        dword ptr [edi],dword ptr [esi]
 006C095B    movs        dword ptr [edi],dword ptr [esi]
 006C095C    movs        dword ptr [edi],dword ptr [esi]
 006C095D    movs        dword ptr [edi],dword ptr [esi]
 006C095E    mov         esi,dword ptr [ebp+10]
 006C0961    lea         edi,[ebp-10]
 006C0964    movs        dword ptr [edi],dword ptr [esi]
 006C0965    movs        dword ptr [edi],dword ptr [esi]
 006C0966    movs        dword ptr [edi],dword ptr [esi]
 006C0967    movs        dword ptr [edi],dword ptr [esi]
 006C0968    lea         eax,[ebp-10]
 006C096B    call        @VarAddRef
 006C0970    lea         eax,[ebp-20]
 006C0973    call        @VarAddRef
 006C0978    xor         eax,eax
 006C097A    push        ebp
 006C097B    push        6C09B1
 006C0980    push        dword ptr fs:[eax]
 006C0983    mov         dword ptr fs:[eax],esp
 006C0986    mov         eax,6C09CC;'Bookmark'
 006C098B    call        006BD86C
 006C0990    xor         eax,eax
 006C0992    pop         edx
 006C0993    pop         ecx
 006C0994    pop         ecx
 006C0995    mov         dword ptr fs:[eax],edx
 006C0998    push        6C09B8
 006C099D    lea         eax,[ebp-20]
 006C09A0    mov         edx,dword ptr ds:[4012D4];OleVariant
 006C09A6    mov         ecx,2
 006C09AB    call        @FinalizeArray
 006C09B0    ret
>006C09B1    jmp         @HandleFinally
>006C09B6    jmp         006C099D
 006C09B8    pop         edi
 006C09B9    pop         esi
 006C09BA    mov         esp,ebp
 006C09BC    pop         ebp
 006C09BD    ret         0C
*}
end;

//006C09E0
procedure TSpeechRecogniser.SpSharedRecoContextPhraseStart(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);
begin
{*
 006C09E0    push        ebp
 006C09E1    mov         ebp,esp
 006C09E3    add         esp,0FFFFFFF0
 006C09E6    push        ebx
 006C09E7    push        esi
 006C09E8    push        edi
 006C09E9    mov         esi,dword ptr [ebp+8]
 006C09EC    lea         edi,[ebp-10]
 006C09EF    movs        dword ptr [edi],dword ptr [esi]
 006C09F0    movs        dword ptr [edi],dword ptr [esi]
 006C09F1    movs        dword ptr [edi],dword ptr [esi]
 006C09F2    movs        dword ptr [edi],dword ptr [esi]
 006C09F3    mov         ebx,eax
 006C09F5    lea         eax,[ebp-10]
 006C09F8    call        @VarAddRef
 006C09FD    xor         eax,eax
 006C09FF    push        ebp
 006C0A00    push        6C0A2F
 006C0A05    push        dword ptr fs:[eax]
 006C0A08    mov         dword ptr fs:[eax],esp
 006C0A0B    mov         byte ptr [ebx+39],1
 006C0A0F    mov         eax,6C0A4C;'You started speaking'
 006C0A14    call        006BD86C
 006C0A19    xor         eax,eax
 006C0A1B    pop         edx
 006C0A1C    pop         ecx
 006C0A1D    pop         ecx
 006C0A1E    mov         dword ptr fs:[eax],edx
 006C0A21    push        6C0A36
 006C0A26    lea         eax,[ebp-10]
 006C0A29    call        @VarClr
 006C0A2E    ret
>006C0A2F    jmp         @HandleFinally
>006C0A34    jmp         006C0A26
 006C0A36    pop         edi
 006C0A37    pop         esi
 006C0A38    pop         ebx
 006C0A39    mov         esp,ebp
 006C0A3B    pop         ebp
 006C0A3C    ret         4
*}
end;

//006C0A78
procedure TSpeechRecogniser.SpSharedRecoContextPropertyNumberChange(ASender:TObject; StreamNumber:Integer; NewNumberValue:Integer; PropertyName:WideString; StreamPosition:OleVariant);
begin
{*
 006C0A78    push        ebp
 006C0A79    mov         ebp,esp
 006C0A7B    add         esp,0FFFFFFE4
 006C0A7E    push        ebx
 006C0A7F    push        esi
 006C0A80    push        edi
 006C0A81    xor         ebx,ebx
 006C0A83    mov         dword ptr [ebp-14],ebx
 006C0A86    mov         dword ptr [ebp-18],ebx
 006C0A89    mov         dword ptr [ebp-1C],ebx
 006C0A8C    mov         esi,dword ptr [ebp+10]
 006C0A8F    lea         edi,[ebp-10]
 006C0A92    movs        dword ptr [edi],dword ptr [esi]
 006C0A93    movs        dword ptr [edi],dword ptr [esi]
 006C0A94    movs        dword ptr [edi],dword ptr [esi]
 006C0A95    movs        dword ptr [edi],dword ptr [esi]
 006C0A96    lea         eax,[ebp-10]
 006C0A99    call        @VarAddRef
 006C0A9E    xor         eax,eax
 006C0AA0    push        ebp
 006C0AA1    push        6C0B1F
 006C0AA6    push        dword ptr fs:[eax]
 006C0AA9    mov         dword ptr fs:[eax],esp
 006C0AAC    push        6C0B34
 006C0AB1    push        dword ptr [ebp+0C]
 006C0AB4    push        6C0B50
 006C0AB9    lea         eax,[ebp-18]
 006C0ABC    mov         edx,3
 006C0AC1    call        @WStrCatN
 006C0AC6    mov         edx,dword ptr [ebp-18]
 006C0AC9    lea         eax,[ebp-14]
 006C0ACC    call        @UStrFromWStr
 006C0AD1    lea         eax,[ebp-14]
 006C0AD4    push        eax
 006C0AD5    lea         edx,[ebp-1C]
 006C0AD8    mov         eax,dword ptr [ebp+8]
 006C0ADB    call        IntToStr
 006C0AE0    mov         edx,dword ptr [ebp-1C]
 006C0AE3    pop         eax
 006C0AE4    call        @UStrCat
 006C0AE9    mov         eax,dword ptr [ebp-14]
 006C0AEC    call        006BD86C
 006C0AF1    xor         eax,eax
 006C0AF3    pop         edx
 006C0AF4    pop         ecx
 006C0AF5    pop         ecx
 006C0AF6    mov         dword ptr fs:[eax],edx
 006C0AF9    push        6C0B26
 006C0AFE    lea         eax,[ebp-1C]
 006C0B01    call        @UStrClr
 006C0B06    lea         eax,[ebp-18]
 006C0B09    call        @WStrClr
 006C0B0E    lea         eax,[ebp-14]
 006C0B11    call        @UStrClr
 006C0B16    lea         eax,[ebp-10]
 006C0B19    call        @VarClr
 006C0B1E    ret
>006C0B1F    jmp         @HandleFinally
>006C0B24    jmp         006C0AFE
 006C0B26    pop         edi
 006C0B27    pop         esi
 006C0B28    pop         ebx
 006C0B29    mov         esp,ebp
 006C0B2B    pop         ebp
 006C0B2C    ret         0C
*}
end;

//006C0B5C
procedure TSpeechRecogniser.SpSharedRecoContextPropertyStringChange(ASender:TObject; StreamNumber:Integer; NewStringValue:WideString; PropertyName:WideString; StreamPosition:OleVariant);
begin
{*
 006C0B5C    push        ebp
 006C0B5D    mov         ebp,esp
 006C0B5F    add         esp,0FFFFFFE8
 006C0B62    push        ebx
 006C0B63    push        esi
 006C0B64    push        edi
 006C0B65    xor         ebx,ebx
 006C0B67    mov         dword ptr [ebp-14],ebx
 006C0B6A    mov         dword ptr [ebp-18],ebx
 006C0B6D    mov         esi,dword ptr [ebp+10]
 006C0B70    lea         edi,[ebp-10]
 006C0B73    movs        dword ptr [edi],dword ptr [esi]
 006C0B74    movs        dword ptr [edi],dword ptr [esi]
 006C0B75    movs        dword ptr [edi],dword ptr [esi]
 006C0B76    movs        dword ptr [edi],dword ptr [esi]
 006C0B77    lea         eax,[ebp-10]
 006C0B7A    call        @VarAddRef
 006C0B7F    xor         eax,eax
 006C0B81    push        ebp
 006C0B82    push        6C0BE8
 006C0B87    push        dword ptr fs:[eax]
 006C0B8A    mov         dword ptr fs:[eax],esp
 006C0B8D    push        6C0BFC
 006C0B92    push        dword ptr [ebp+0C]
 006C0B95    push        6C0C18
 006C0B9A    push        dword ptr [ebp+8]
 006C0B9D    push        6C0C28
 006C0BA2    lea         eax,[ebp-18]
 006C0BA5    mov         edx,5
 006C0BAA    call        @WStrCatN
 006C0BAF    mov         edx,dword ptr [ebp-18]
 006C0BB2    lea         eax,[ebp-14]
 006C0BB5    call        @UStrFromWStr
 006C0BBA    mov         eax,dword ptr [ebp-14]
 006C0BBD    call        006BD86C
 006C0BC2    xor         eax,eax
 006C0BC4    pop         edx
 006C0BC5    pop         ecx
 006C0BC6    pop         ecx
 006C0BC7    mov         dword ptr fs:[eax],edx
 006C0BCA    push        6C0BEF
 006C0BCF    lea         eax,[ebp-18]
 006C0BD2    call        @WStrClr
 006C0BD7    lea         eax,[ebp-14]
 006C0BDA    call        @UStrClr
 006C0BDF    lea         eax,[ebp-10]
 006C0BE2    call        @VarClr
 006C0BE7    ret
>006C0BE8    jmp         @HandleFinally
>006C0BED    jmp         006C0BCF
 006C0BEF    pop         edi
 006C0BF0    pop         esi
 006C0BF1    pop         ebx
 006C0BF2    mov         esp,ebp
 006C0BF4    pop         ebp
 006C0BF5    ret         0C
*}
end;

//006C0C2C
procedure TSpeechRecogniser.SpSharedRecoContextFalseRecognition(ASender:TObject; StreamNumber:Integer; Result:ISpeechRecoResult; StreamPosition:OleVariant);
begin
{*
 006C0C2C    push        ebp
 006C0C2D    mov         ebp,esp
 006C0C2F    push        ecx
 006C0C30    mov         ecx,0B
 006C0C35    push        0
 006C0C37    push        0
 006C0C39    dec         ecx
>006C0C3A    jne         006C0C35
 006C0C3C    push        ecx
 006C0C3D    xchg        ecx,dword ptr [ebp-4]
 006C0C40    push        ebx
 006C0C41    push        esi
 006C0C42    push        edi
 006C0C43    mov         esi,dword ptr [ebp+0C]
 006C0C46    lea         edi,[ebp-18]
 006C0C49    movs        dword ptr [edi],dword ptr [esi]
 006C0C4A    movs        dword ptr [edi],dword ptr [esi]
 006C0C4B    movs        dword ptr [edi],dword ptr [esi]
 006C0C4C    movs        dword ptr [edi],dword ptr [esi]
 006C0C4D    mov         ebx,eax
 006C0C4F    lea         eax,[ebp-18]
 006C0C52    call        @VarAddRef
 006C0C57    xor         eax,eax
 006C0C59    push        ebp
 006C0C5A    push        6C0F43
 006C0C5F    push        dword ptr fs:[eax]
 006C0C62    mov         dword ptr fs:[eax],esp
 006C0C65    mov         byte ptr [ebp-19],0
 006C0C69    mov         byte ptr [ebp-1A],0
 006C0C6D    lea         eax,[ebp-8]
 006C0C70    call        @IntfClear
 006C0C75    push        eax
 006C0C76    lea         eax,[ebp-20]
 006C0C79    call        @IntfClear
 006C0C7E    push        eax
 006C0C7F    mov         eax,dword ptr [ebp+8]
 006C0C82    push        eax
 006C0C83    mov         eax,dword ptr [eax]
 006C0C85    call        dword ptr [eax+2C]
 006C0C88    call        @CheckAutoResult
 006C0C8D    mov         eax,dword ptr [ebp-20]
 006C0C90    push        eax
 006C0C91    mov         eax,dword ptr [eax]
 006C0C93    call        dword ptr [eax+3C]
 006C0C96    call        @CheckAutoResult
 006C0C9B    cmp         dword ptr [ebp-8],0
>006C0C9F    je          006C0DD5
 006C0CA5    lea         eax,[ebp-24]
 006C0CA8    push        eax
 006C0CA9    mov         eax,dword ptr [ebp-8]
 006C0CAC    push        eax
 006C0CAD    mov         eax,dword ptr [eax]
 006C0CAF    call        dword ptr [eax+1C]
 006C0CB2    call        @CheckAutoResult
 006C0CB7    mov         edi,dword ptr [ebp-24]
 006C0CBA    dec         edi
 006C0CBB    test        edi,edi
>006C0CBD    jl          006C0DD5
 006C0CC3    inc         edi
 006C0CC4    xor         esi,esi
 006C0CC6    lea         eax,[ebp-28]
 006C0CC9    call        @WStrClr
 006C0CCE    push        eax
 006C0CCF    lea         eax,[ebp-2C]
 006C0CD2    call        @IntfClear
 006C0CD7    push        eax
 006C0CD8    push        esi
 006C0CD9    mov         eax,dword ptr [ebp-8]
 006C0CDC    push        eax
 006C0CDD    mov         eax,dword ptr [eax]
 006C0CDF    call        dword ptr [eax+20]
 006C0CE2    call        @CheckAutoResult
 006C0CE7    mov         eax,dword ptr [ebp-2C]
 006C0CEA    push        eax
 006C0CEB    mov         eax,dword ptr [eax]
 006C0CED    call        dword ptr [eax+1C]
 006C0CF0    call        @CheckAutoResult
 006C0CF5    mov         eax,dword ptr [ebp-28]
 006C0CF8    mov         edx,6C0F5C;'askedfor'
 006C0CFD    call        @WStrEqual
>006C0D02    jne         006C0D47
 006C0D04    mov         byte ptr [ebp-19],1
 006C0D08    lea         eax,[ebp-3C]
 006C0D0B    call        @VarClr
 006C0D10    push        eax
 006C0D11    lea         eax,[ebp-40]
 006C0D14    call        @IntfClear
 006C0D19    push        eax
 006C0D1A    push        esi
 006C0D1B    mov         eax,dword ptr [ebp-8]
 006C0D1E    push        eax
 006C0D1F    mov         eax,dword ptr [eax]
 006C0D21    call        dword ptr [eax+20]
 006C0D24    call        @CheckAutoResult
 006C0D29    mov         eax,dword ptr [ebp-40]
 006C0D2C    push        eax
 006C0D2D    mov         eax,dword ptr [eax]
 006C0D2F    call        dword ptr [eax+24]
 006C0D32    call        @CheckAutoResult
 006C0D37    lea         eax,[ebp-3C]
 006C0D3A    lea         edx,[ebp-4]
 006C0D3D    call        VarToStr
>006C0D42    jmp         006C0DCD
 006C0D47    lea         eax,[ebp-44]
 006C0D4A    call        @WStrClr
 006C0D4F    push        eax
 006C0D50    lea         eax,[ebp-48]
 006C0D53    call        @IntfClear
 006C0D58    push        eax
 006C0D59    push        esi
 006C0D5A    mov         eax,dword ptr [ebp-8]
 006C0D5D    push        eax
 006C0D5E    mov         eax,dword ptr [eax]
 006C0D60    call        dword ptr [eax+20]
 006C0D63    call        @CheckAutoResult
 006C0D68    mov         eax,dword ptr [ebp-48]
 006C0D6B    push        eax
 006C0D6C    mov         eax,dword ptr [eax]
 006C0D6E    call        dword ptr [eax+1C]
 006C0D71    call        @CheckAutoResult
 006C0D76    mov         eax,dword ptr [ebp-44]
 006C0D79    mov         edx,6C0F74;'said'
 006C0D7E    call        @WStrEqual
>006C0D83    jne         006C0D8B
 006C0D85    mov         byte ptr [ebp-19],0
>006C0D89    jmp         006C0DCD
 006C0D8B    lea         eax,[ebp-4C]
 006C0D8E    call        @WStrClr
 006C0D93    push        eax
 006C0D94    lea         eax,[ebp-50]
 006C0D97    call        @IntfClear
 006C0D9C    push        eax
 006C0D9D    push        esi
 006C0D9E    mov         eax,dword ptr [ebp-8]
 006C0DA1    push        eax
 006C0DA2    mov         eax,dword ptr [eax]
 006C0DA4    call        dword ptr [eax+20]
 006C0DA7    call        @CheckAutoResult
 006C0DAC    mov         eax,dword ptr [ebp-50]
 006C0DAF    push        eax
 006C0DB0    mov         eax,dword ptr [eax]
 006C0DB2    call        dword ptr [eax+1C]
 006C0DB5    call        @CheckAutoResult
 006C0DBA    mov         eax,dword ptr [ebp-4C]
 006C0DBD    mov         edx,6C0F84;'norequesttype'
 006C0DC2    call        @WStrEqual
>006C0DC7    jne         006C0DCD
 006C0DC9    mov         byte ptr [ebp-1A],1
 006C0DCD    inc         esi
 006C0DCE    dec         edi
>006C0DCF    jne         006C0CC6
 006C0DD5    movzx       eax,byte ptr [ebp-19]
 006C0DD9    mov         byte ptr [ebx+10],al
 006C0DDC    mov         byte ptr [ebx+39],0
 006C0DE0    xor         eax,eax
 006C0DE2    mov         dword ptr [ebx+4],eax;TSpeechRecogniser.State:TSpeechState
 006C0DE5    cmp         byte ptr [ebp-1A],0
>006C0DE9    je          006C0DF2
 006C0DEB    mov         dword ptr [ebx+4],0FFFFFFFF;TSpeechRecogniser.State:TSpeechState
 006C0DF2    cmp         byte ptr [ebp-19],0
>006C0DF6    jne         006C0E37
 006C0DF8    lea         eax,[ebp-54]
 006C0DFB    call        @WStrClr
 006C0E00    push        eax
 006C0E01    push        0FF
 006C0E03    push        0FF
 006C0E05    push        0
 006C0E07    lea         eax,[ebp-58]
 006C0E0A    call        @IntfClear
 006C0E0F    push        eax
 006C0E10    mov         eax,dword ptr [ebp+8]
 006C0E13    push        eax
 006C0E14    mov         eax,dword ptr [eax]
 006C0E16    call        dword ptr [eax+2C]
 006C0E19    call        @CheckAutoResult
 006C0E1E    mov         eax,dword ptr [ebp-58]
 006C0E21    push        eax
 006C0E22    mov         eax,dword ptr [eax]
 006C0E24    call        dword ptr [eax+54]
 006C0E27    call        @CheckAutoResult
 006C0E2C    mov         edx,dword ptr [ebp-54]
 006C0E2F    lea         eax,[ebp-4]
 006C0E32    call        @UStrFromWStr
 006C0E37    cmp         byte ptr [ebx+2C],0
>006C0E3B    je          006C0E74
 006C0E3D    mov         edx,dword ptr [ebp-4]
 006C0E40    mov         eax,dword ptr [ebx+24]
 006C0E43    call        006BD2D0
 006C0E48    test        al,al
>006C0E4A    je          006C0E74
 006C0E4C    push        6C0FAC;'Falsely recognised already "'
 006C0E51    push        dword ptr [ebp-4]
 006C0E54    push        6C0FF4;'"'
 006C0E59    lea         eax,[ebp-5C]
 006C0E5C    mov         edx,3
 006C0E61    call        @UStrCatN
 006C0E66    mov         eax,dword ptr [ebp-5C]
 006C0E69    call        006BD86C
 006C0E6E    mov         byte ptr [ebx+1D],1
>006C0E72    jmp         006C0E96
 006C0E74    push        6C1004;'You didn''t say "'
 006C0E79    push        dword ptr [ebp-4]
 006C0E7C    push        6C0FF4;'"'
 006C0E81    lea         eax,[ebp-60]
 006C0E84    mov         edx,3
 006C0E89    call        @UStrCatN
 006C0E8E    mov         eax,dword ptr [ebp-60]
 006C0E91    call        006BD86C
 006C0E96    lea         eax,[ebx+24]
 006C0E99    call        @UStrClr
 006C0E9E    xor         eax,eax
 006C0EA0    mov         dword ptr [ebx+28],eax
 006C0EA3    mov         byte ptr [ebx+2C],0
 006C0EA7    cmp         byte ptr [ebp-1A],0
>006C0EAB    jne         006C0EB8
 006C0EAD    lea         eax,[ebx+20]
 006C0EB0    mov         edx,dword ptr [ebp-4]
 006C0EB3    call        @UStrAsg
 006C0EB8    xor         eax,eax
 006C0EBA    pop         edx
 006C0EBB    pop         ecx
 006C0EBC    pop         ecx
 006C0EBD    mov         dword ptr fs:[eax],edx
 006C0EC0    push        6C0F4D
 006C0EC5    lea         eax,[ebp-60]
 006C0EC8    mov         edx,2
 006C0ECD    call        @UStrArrayClr
 006C0ED2    lea         eax,[ebp-58]
 006C0ED5    call        @IntfClear
 006C0EDA    lea         eax,[ebp-54]
 006C0EDD    call        @WStrClr
 006C0EE2    lea         eax,[ebp-50]
 006C0EE5    call        @IntfClear
 006C0EEA    lea         eax,[ebp-4C]
 006C0EED    call        @WStrClr
 006C0EF2    lea         eax,[ebp-48]
 006C0EF5    call        @IntfClear
 006C0EFA    lea         eax,[ebp-44]
 006C0EFD    call        @WStrClr
 006C0F02    lea         eax,[ebp-40]
 006C0F05    call        @IntfClear
 006C0F0A    lea         eax,[ebp-3C]
 006C0F0D    call        @VarClr
 006C0F12    lea         eax,[ebp-2C]
 006C0F15    call        @IntfClear
 006C0F1A    lea         eax,[ebp-28]
 006C0F1D    call        @WStrClr
 006C0F22    lea         eax,[ebp-20]
 006C0F25    call        @IntfClear
 006C0F2A    lea         eax,[ebp-18]
 006C0F2D    call        @VarClr
 006C0F32    lea         eax,[ebp-8]
 006C0F35    call        @IntfClear
 006C0F3A    lea         eax,[ebp-4]
 006C0F3D    call        @UStrClr
 006C0F42    ret
>006C0F43    jmp         @HandleFinally
>006C0F48    jmp         006C0EC5
 006C0F4D    pop         edi
 006C0F4E    pop         esi
 006C0F4F    pop         ebx
 006C0F50    mov         esp,ebp
 006C0F52    pop         ebp
 006C0F53    ret         8
*}
end;

//006C1028
procedure TSpeechRecogniser.SpSharedRecoContextInterference(ASender:TObject; StreamNumber:Integer; Interference:TOleEnum; StreamPosition:OleVariant);
begin
{*
 006C1028    push        ebp
 006C1029    mov         ebp,esp
 006C102B    add         esp,0FFFFFFE8
 006C102E    push        ebx
 006C102F    push        esi
 006C1030    push        edi
 006C1031    xor         ebx,ebx
 006C1033    mov         dword ptr [ebp-4],ebx
 006C1036    mov         esi,dword ptr [ebp+0C]
 006C1039    lea         edi,[ebp-18]
 006C103C    movs        dword ptr [edi],dword ptr [esi]
 006C103D    movs        dword ptr [edi],dword ptr [esi]
 006C103E    movs        dword ptr [edi],dword ptr [esi]
 006C103F    movs        dword ptr [edi],dword ptr [esi]
 006C1040    mov         esi,eax
 006C1042    mov         ebx,dword ptr [ebp+8]
 006C1045    lea         eax,[ebp-18]
 006C1048    call        @VarAddRef
 006C104D    xor         eax,eax
 006C104F    push        ebp
 006C1050    push        6C1171
 006C1055    push        dword ptr fs:[eax]
 006C1058    mov         dword ptr fs:[eax],esp
 006C105B    mov         eax,ebx
 006C105D    cmp         eax,6
>006C1060    ja          006C10F2
 006C1066    jmp         dword ptr [eax*4+6C106D]
 006C1066    dd          006C1089
 006C1066    dd          006C1098
 006C1066    dd          006C10A7
 006C1066    dd          006C10B6
 006C1066    dd          006C10C5
 006C1066    dd          006C10D4
 006C1066    dd          006C10E3
 006C1089    lea         eax,[ebp-4]
 006C108C    mov         edx,6C1190;'<<<<<No interference>>>>>'
 006C1091    call        @UStrLAsg
>006C1096    jmp         006C10FF
 006C1098    lea         eax,[ebp-4]
 006C109B    mov         edx,6C11D0;'<<<<Noise>>>>'
 006C10A0    call        @UStrLAsg
>006C10A5    jmp         006C10FF
 006C10A7    lea         eax,[ebp-4]
 006C10AA    mov         edx,6C11F8;'<<<<NoSignal>>>>'
 006C10AF    call        @UStrLAsg
>006C10B4    jmp         006C10FF
 006C10B6    lea         eax,[ebp-4]
 006C10B9    mov         edx,6C1228;'<<<<TooLoud>>>>'
 006C10BE    call        @UStrLAsg
>006C10C3    jmp         006C10FF
 006C10C5    lea         eax,[ebp-4]
 006C10C8    mov         edx,6C1254;'<<<<TooQuiet>>>>'
 006C10CD    call        @UStrLAsg
>006C10D2    jmp         006C10FF
 006C10D4    lea         eax,[ebp-4]
 006C10D7    mov         edx,6C1284;'<<<<TooFast>>>>'
 006C10DC    call        @UStrLAsg
>006C10E1    jmp         006C10FF
 006C10E3    lea         eax,[ebp-4]
 006C10E6    mov         edx,6C12B0;'<<<<TooSlow>>>>'
 006C10EB    call        @UStrLAsg
>006C10F0    jmp         006C10FF
 006C10F2    lea         eax,[ebp-4]
 006C10F5    mov         edx,6C12DC;'<<<<Unknown Interference>>>>'
 006C10FA    call        @UStrLAsg
 006C10FF    cmp         ebx,6
>006C1102    ja          006C114B
 006C1104    jmp         dword ptr [ebx*4+6C110B]
 006C1104    dd          006C114B
 006C1104    dd          006C1129
 006C1104    dd          006C112F
 006C1104    dd          006C1135
 006C1104    dd          006C113B
 006C1104    dd          006C1141
 006C1104    dd          006C1147
>006C1127    jmp         006C114B
 006C1129    mov         byte ptr [esi+0B],1
>006C112D    jmp         006C114B
 006C112F    mov         byte ptr [esi+0C],1
>006C1133    jmp         006C114B
 006C1135    mov         byte ptr [esi+0A],1
>006C1139    jmp         006C114B
 006C113B    mov         byte ptr [esi+9],1
>006C113F    jmp         006C114B
 006C1141    mov         byte ptr [esi+0D],1
>006C1145    jmp         006C114B
 006C1147    mov         byte ptr [esi+0E],1
 006C114B    mov         eax,dword ptr [ebp-4]
 006C114E    call        006BD86C
 006C1153    xor         eax,eax
 006C1155    pop         edx
 006C1156    pop         ecx
 006C1157    pop         ecx
 006C1158    mov         dword ptr fs:[eax],edx
 006C115B    push        6C1178
 006C1160    lea         eax,[ebp-18]
 006C1163    call        @VarClr
 006C1168    lea         eax,[ebp-4]
 006C116B    call        @UStrClr
 006C1170    ret
>006C1171    jmp         @HandleFinally
>006C1176    jmp         006C1160
 006C1178    pop         edi
 006C1179    pop         esi
 006C117A    pop         ebx
 006C117B    mov         esp,ebp
 006C117D    pop         ebp
 006C117E    ret         8
*}
end;

//006C1318
procedure TSpeechRecogniser.SpSharedRecoContextRequestUI(ASender:TObject; StreamNumber:Integer; UIType:WideString; StreamPosition:OleVariant);
begin
{*
 006C1318    push        ebp
 006C1319    mov         ebp,esp
 006C131B    add         esp,0FFFFFFE8
 006C131E    push        ebx
 006C131F    push        esi
 006C1320    push        edi
 006C1321    xor         ebx,ebx
 006C1323    mov         dword ptr [ebp-14],ebx
 006C1326    mov         dword ptr [ebp-18],ebx
 006C1329    mov         esi,dword ptr [ebp+0C]
 006C132C    lea         edi,[ebp-10]
 006C132F    movs        dword ptr [edi],dword ptr [esi]
 006C1330    movs        dword ptr [edi],dword ptr [esi]
 006C1331    movs        dword ptr [edi],dword ptr [esi]
 006C1332    movs        dword ptr [edi],dword ptr [esi]
 006C1333    lea         eax,[ebp-10]
 006C1336    call        @VarAddRef
 006C133B    xor         eax,eax
 006C133D    push        ebp
 006C133E    push        6C1392
 006C1343    push        dword ptr fs:[eax]
 006C1346    mov         dword ptr fs:[eax],esp
 006C1349    lea         eax,[ebp-18]
 006C134C    mov         ecx,dword ptr [ebp+8]
 006C134F    mov         edx,6C13A8;'RequestUI: '
 006C1354    call        @WStrCat3
 006C1359    mov         edx,dword ptr [ebp-18]
 006C135C    lea         eax,[ebp-14]
 006C135F    call        @UStrFromWStr
 006C1364    mov         eax,dword ptr [ebp-14]
 006C1367    call        006BD86C
 006C136C    xor         eax,eax
 006C136E    pop         edx
 006C136F    pop         ecx
 006C1370    pop         ecx
 006C1371    mov         dword ptr fs:[eax],edx
 006C1374    push        6C1399
 006C1379    lea         eax,[ebp-18]
 006C137C    call        @WStrClr
 006C1381    lea         eax,[ebp-14]
 006C1384    call        @UStrClr
 006C1389    lea         eax,[ebp-10]
 006C138C    call        @VarClr
 006C1391    ret
>006C1392    jmp         @HandleFinally
>006C1397    jmp         006C1379
 006C1399    pop         edi
 006C139A    pop         esi
 006C139B    pop         ebx
 006C139C    mov         esp,ebp
 006C139E    pop         ebp
 006C139F    ret         8
*}
end;

//006C13C0
procedure TSpeechRecogniser.SpSharedRecoContextRecognizerStateChange(ASender:TObject; StreamNumber:Integer; NewState:TOleEnum; StreamPosition:OleVariant);
begin
{*
 006C13C0    push        ebp
 006C13C1    mov         ebp,esp
 006C13C3    add         esp,0FFFFFFF0
 006C13C6    push        esi
 006C13C7    push        edi
 006C13C8    mov         esi,dword ptr [ebp+0C]
 006C13CB    lea         edi,[ebp-10]
 006C13CE    movs        dword ptr [edi],dword ptr [esi]
 006C13CF    movs        dword ptr [edi],dword ptr [esi]
 006C13D0    movs        dword ptr [edi],dword ptr [esi]
 006C13D1    movs        dword ptr [edi],dword ptr [esi]
 006C13D2    lea         eax,[ebp-10]
 006C13D5    call        @VarAddRef
 006C13DA    xor         eax,eax
 006C13DC    push        ebp
 006C13DD    push        6C1408
 006C13E2    push        dword ptr fs:[eax]
 006C13E5    mov         dword ptr fs:[eax],esp
 006C13E8    mov         eax,6C1424;'RecognizerStateChange'
 006C13ED    call        006BD86C
 006C13F2    xor         eax,eax
 006C13F4    pop         edx
 006C13F5    pop         ecx
 006C13F6    pop         ecx
 006C13F7    mov         dword ptr fs:[eax],edx
 006C13FA    push        6C140F
 006C13FF    lea         eax,[ebp-10]
 006C1402    call        @VarClr
 006C1407    ret
>006C1408    jmp         @HandleFinally
>006C140D    jmp         006C13FF
 006C140F    pop         edi
 006C1410    pop         esi
 006C1411    mov         esp,ebp
 006C1413    pop         ebp
 006C1414    ret         8
*}
end;

//006C1450
procedure TSpeechRecogniser.SpSharedRecoContextAdaptation(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);
begin
{*
 006C1450    push        ebp
 006C1451    mov         ebp,esp
 006C1453    add         esp,0FFFFFFF0
 006C1456    push        esi
 006C1457    push        edi
 006C1458    mov         esi,dword ptr [ebp+8]
 006C145B    lea         edi,[ebp-10]
 006C145E    movs        dword ptr [edi],dword ptr [esi]
 006C145F    movs        dword ptr [edi],dword ptr [esi]
 006C1460    movs        dword ptr [edi],dword ptr [esi]
 006C1461    movs        dword ptr [edi],dword ptr [esi]
 006C1462    lea         eax,[ebp-10]
 006C1465    call        @VarAddRef
 006C146A    xor         eax,eax
 006C146C    push        ebp
 006C146D    push        6C1498
 006C1472    push        dword ptr fs:[eax]
 006C1475    mov         dword ptr fs:[eax],esp
 006C1478    mov         eax,6C14B4;'Adaptation'
 006C147D    call        006BD86C
 006C1482    xor         eax,eax
 006C1484    pop         edx
 006C1485    pop         ecx
 006C1486    pop         ecx
 006C1487    mov         dword ptr fs:[eax],edx
 006C148A    push        6C149F
 006C148F    lea         eax,[ebp-10]
 006C1492    call        @VarClr
 006C1497    ret
>006C1498    jmp         @HandleFinally
>006C149D    jmp         006C148F
 006C149F    pop         edi
 006C14A0    pop         esi
 006C14A1    mov         esp,ebp
 006C14A3    pop         ebp
 006C14A4    ret         4
*}
end;

//006C14CC
procedure TSpeechRecogniser.SpSharedRecoContextRecognitionForOtherContext(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant);
begin
{*
 006C14CC    push        ebp
 006C14CD    mov         ebp,esp
 006C14CF    add         esp,0FFFFFFF0
 006C14D2    push        ebx
 006C14D3    push        esi
 006C14D4    push        edi
 006C14D5    mov         esi,dword ptr [ebp+8]
 006C14D8    lea         edi,[ebp-10]
 006C14DB    movs        dword ptr [edi],dword ptr [esi]
 006C14DC    movs        dword ptr [edi],dword ptr [esi]
 006C14DD    movs        dword ptr [edi],dword ptr [esi]
 006C14DE    movs        dword ptr [edi],dword ptr [esi]
 006C14DF    mov         ebx,eax
 006C14E1    lea         eax,[ebp-10]
 006C14E4    call        @VarAddRef
 006C14E9    xor         eax,eax
 006C14EB    push        ebp
 006C14EC    push        6C1531
 006C14F1    push        dword ptr fs:[eax]
 006C14F4    mov         dword ptr fs:[eax],esp
 006C14F7    mov         eax,6C1550;'You said something to other software'
 006C14FC    call        006BD86C
 006C1501    xor         eax,eax
 006C1503    mov         dword ptr [ebx+4],eax;TSpeechRecogniser.State:TSpeechState
 006C1506    mov         byte ptr [ebx+0F],1
 006C150A    lea         eax,[ebx+24]
 006C150D    call        @UStrClr
 006C1512    xor         eax,eax
 006C1514    mov         dword ptr [ebx+28],eax
 006C1517    mov         byte ptr [ebx+2C],0
 006C151B    xor         eax,eax
 006C151D    pop         edx
 006C151E    pop         ecx
 006C151F    pop         ecx
 006C1520    mov         dword ptr fs:[eax],edx
 006C1523    push        6C1538
 006C1528    lea         eax,[ebp-10]
 006C152B    call        @VarClr
 006C1530    ret
>006C1531    jmp         @HandleFinally
>006C1536    jmp         006C1528
 006C1538    pop         edi
 006C1539    pop         esi
 006C153A    pop         ebx
 006C153B    mov         esp,ebp
 006C153D    pop         ebp
 006C153E    ret         4
*}
end;

//006C159C
procedure TSpeechRecogniser.SpSharedRecoContextAudioLevel(ASender:TObject; StreamNumber:Integer; AudioLevel:Integer; StreamPosition:OleVariant);
begin
{*
 006C159C    push        ebp
 006C159D    mov         ebp,esp
 006C159F    add         esp,0FFFFFFE8
 006C15A2    push        ebx
 006C15A3    push        esi
 006C15A4    push        edi
 006C15A5    xor         ebx,ebx
 006C15A7    mov         dword ptr [ebp-14],ebx
 006C15AA    mov         dword ptr [ebp-18],ebx
 006C15AD    mov         esi,dword ptr [ebp+0C]
 006C15B0    lea         edi,[ebp-10]
 006C15B3    movs        dword ptr [edi],dword ptr [esi]
 006C15B4    movs        dword ptr [edi],dword ptr [esi]
 006C15B5    movs        dword ptr [edi],dword ptr [esi]
 006C15B6    movs        dword ptr [edi],dword ptr [esi]
 006C15B7    mov         ebx,eax
 006C15B9    mov         esi,dword ptr [ebp+8]
 006C15BC    lea         eax,[ebp-10]
 006C15BF    call        @VarAddRef
 006C15C4    xor         eax,eax
 006C15C6    push        ebp
 006C15C7    push        6C161F
 006C15CC    push        dword ptr fs:[eax]
 006C15CF    mov         dword ptr fs:[eax],esp
 006C15D2    cmp         esi,dword ptr [ebx+34]
>006C15D5    je          006C15FC
 006C15D7    lea         edx,[ebp-18]
 006C15DA    mov         eax,esi
 006C15DC    call        IntToStr
 006C15E1    mov         ecx,dword ptr [ebp-18]
 006C15E4    lea         eax,[ebp-14]
 006C15E7    mov         edx,6C163C;'Audio Level: '
 006C15EC    call        @UStrCat3
 006C15F1    mov         eax,dword ptr [ebp-14]
 006C15F4    call        006BD86C
 006C15F9    mov         dword ptr [ebx+34],esi
 006C15FC    xor         eax,eax
 006C15FE    pop         edx
 006C15FF    pop         ecx
 006C1600    pop         ecx
 006C1601    mov         dword ptr fs:[eax],edx
 006C1604    push        6C1626
 006C1609    lea         eax,[ebp-18]
 006C160C    mov         edx,2
 006C1611    call        @UStrArrayClr
 006C1616    lea         eax,[ebp-10]
 006C1619    call        @VarClr
 006C161E    ret
>006C161F    jmp         @HandleFinally
>006C1624    jmp         006C1609
 006C1626    pop         edi
 006C1627    pop         esi
 006C1628    pop         ebx
 006C1629    mov         esp,ebp
 006C162B    pop         ebp
 006C162C    ret         8
*}
end;

//006C1658
procedure TSpeechRecogniser.SpSharedRecoContextEnginePrivate(ASender:TObject; StreamNumber:Integer; EngineData:OleVariant; StreamPosition:OleVariant);
begin
{*
 006C1658    push        ebp
 006C1659    mov         ebp,esp
 006C165B    add         esp,0FFFFFFE0
 006C165E    push        esi
 006C165F    push        edi
 006C1660    mov         esi,dword ptr [ebp+8]
 006C1663    lea         edi,[ebp-20]
 006C1666    movs        dword ptr [edi],dword ptr [esi]
 006C1667    movs        dword ptr [edi],dword ptr [esi]
 006C1668    movs        dword ptr [edi],dword ptr [esi]
 006C1669    movs        dword ptr [edi],dword ptr [esi]
 006C166A    mov         esi,dword ptr [ebp+0C]
 006C166D    lea         edi,[ebp-10]
 006C1670    movs        dword ptr [edi],dword ptr [esi]
 006C1671    movs        dword ptr [edi],dword ptr [esi]
 006C1672    movs        dword ptr [edi],dword ptr [esi]
 006C1673    movs        dword ptr [edi],dword ptr [esi]
 006C1674    lea         eax,[ebp-10]
 006C1677    call        @VarAddRef
 006C167C    lea         eax,[ebp-20]
 006C167F    call        @VarAddRef
 006C1684    xor         eax,eax
 006C1686    push        ebp
 006C1687    push        6C16BD
 006C168C    push        dword ptr fs:[eax]
 006C168F    mov         dword ptr fs:[eax],esp
 006C1692    mov         eax,6C16D8;'Engine Private'
 006C1697    call        006BD86C
 006C169C    xor         eax,eax
 006C169E    pop         edx
 006C169F    pop         ecx
 006C16A0    pop         ecx
 006C16A1    mov         dword ptr fs:[eax],edx
 006C16A4    push        6C16C4
 006C16A9    lea         eax,[ebp-20]
 006C16AC    mov         edx,dword ptr ds:[4012D4];OleVariant
 006C16B2    mov         ecx,2
 006C16B7    call        @FinalizeArray
 006C16BC    ret
>006C16BD    jmp         @HandleFinally
>006C16C2    jmp         006C16A9
 006C16C4    pop         edi
 006C16C5    pop         esi
 006C16C6    mov         esp,ebp
 006C16C8    pop         ebp
 006C16C9    ret         8
*}
end;

//006C16F8
procedure sub_006C16F8;
begin
{*
 006C16F8    mov         dl,1
 006C16FA    mov         eax,[006BC534];TSpeechRecogniser
 006C16FF    call        TSpeechRecogniser.Create;TSpeechRecogniser.Create
 006C1704    mov         [0078BE90],eax;gvar_0078BE90:TSpeechRecogniser
 006C1709    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C170E    cmp         dword ptr [eax+3C],0;TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
>006C1712    jne         006C1731
 006C1714    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C1719    cmp         dword ptr [eax+40],0;TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
>006C171D    jne         006C1731
 006C171F    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C1724    xor         edx,edx
 006C1726    mov         dword ptr ds:[78BE90],edx;gvar_0078BE90:TSpeechRecogniser
 006C172C    call        TObject.Free
 006C1731    ret
*}
end;

//006C1734
procedure sub_006C1734;
begin
{*
 006C1734    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C1739    xor         edx,edx
 006C173B    mov         dword ptr ds:[78BE90],edx;gvar_0078BE90:TSpeechRecogniser
 006C1741    call        TObject.Free
 006C1746    ret
*}
end;

//006C1748
procedure sub_006C1748;
begin
{*
 006C1748    mov         byte ptr ds:[78BE94],1;gvar_0078BE94:Boolean
 006C174F    mov         byte ptr ds:[78BE95],0;gvar_0078BE95:Boolean
 006C1756    mov         byte ptr ds:[78BE96],0;gvar_0078BE96:Boolean
 006C175D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006C1762    mov         eax,dword ptr [eax]
 006C1764    mov         eax,dword ptr [eax+4EC]
 006C176A    movzx       eax,byte ptr [eax+38]
 006C176E    mov         [0078BE8C],al;gvar_0078BE8C
 006C1773    cmp         byte ptr ds:[81F5B0],0;gvar_0081F5B0
>006C177A    jne         006C1798
 006C177C    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 006C1781    mov         edx,dword ptr [eax]
 006C1783    call        dword ptr [edx+14]
 006C1786    test        eax,eax
>006C1788    jg          006C1798
 006C178A    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 006C178F    mov         edx,dword ptr [eax]
 006C1791    call        dword ptr [edx+14]
 006C1794    test        eax,eax
>006C1796    jle         006C179D
 006C1798    call        006C16F8
 006C179D    ret
*}
end;

//006C17A0
procedure sub_006C17A0;
begin
{*
 006C17A0    mov         byte ptr ds:[78BE94],1;gvar_0078BE94:Boolean
 006C17A7    mov         byte ptr ds:[78BE95],0;gvar_0078BE95:Boolean
 006C17AE    mov         byte ptr ds:[78BE96],0;gvar_0078BE96:Boolean
 006C17B5    call        006C1734
 006C17BA    ret
*}
end;

//006C17BC
{*function sub_006C17BC:?;
begin
 006C17BC    cmp         dword ptr ds:[78BE90],0;gvar_0078BE90:TSpeechRecogniser
>006C17C3    je          006C17E8
 006C17C5    mov         eax,81F570;gvar_0081F570:Pointer
 006C17CA    mov         edx,dword ptr ds:[78BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C17D0    add         edx,4;TSpeechRecogniser.State:TSpeechState
 006C17D3    mov         ecx,dword ptr ds:[6BC2D8];TSpeechState
 006C17D9    call        @CopyRecord
 006C17DE    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C17E3    call        TSpeechRecogniser.ClearState
 006C17E8    mov         al,1
 006C17EA    ret
end;*}

//006C17EC
function TSaidValue.CanSet:Boolean;
begin
{*
 006C17EC    mov         eax,dword ptr [eax+20];TSaidValue.Item:Integer
 006C17EF    sub         eax,7
>006C17F2    jne         006C17F7
 006C17F4    mov         al,1
 006C17F6    ret
 006C17F7    xor         eax,eax
 006C17F9    ret
*}
end;

//006C17FC
procedure TSaidValue.CreateClone;
begin
{*
 006C17FC    mov         dl,1
 006C17FE    mov         eax,[006BBEF4];TSaidValue
 006C1803    call        TObject.Create;TSaidValue.Create
 006C1808    ret
*}
end;

//006C180C
procedure TSaidValue.FillClone(c:TExpression);
begin
{*
 006C180C    push        ebx
 006C180D    push        esi
 006C180E    push        edi
 006C180F    mov         esi,edx
 006C1811    mov         ebx,eax
 006C1813    mov         edx,esi
 006C1815    mov         eax,ebx
 006C1817    call        TExpression.FillClone
 006C181C    mov         edi,esi
 006C181E    lea         eax,[edi+18]
 006C1821    mov         edx,dword ptr [ebx+18];TSaidValue.Phrase:string
 006C1824    call        @UStrAsg
 006C1829    mov         eax,dword ptr [ebx+1C];TSaidValue.Confidence:Integer
 006C182C    mov         dword ptr [edi+1C],eax
 006C182F    mov         eax,dword ptr [ebx+20];TSaidValue.Item:Integer
 006C1832    mov         dword ptr [edi+20],eax
 006C1835    pop         edi
 006C1836    pop         esi
 006C1837    pop         ebx
 006C1838    ret
*}
end;

//006C183C
function TSaidValue.GetBoolean:Boolean;
begin
{*
 006C183C    push        ebx
 006C183D    push        esi
 006C183E    mov         esi,eax
 006C1840    xor         ebx,ebx
 006C1842    mov         eax,dword ptr [esi+20];TSaidValue.Item:Integer
 006C1845    cmp         eax,0D
>006C1848    je          006C1877
 006C184A    cmp         eax,0E
>006C184D    je          006C1877
 006C184F    cmp         eax,0F
>006C1852    je          006C1877
 006C1854    cmp         byte ptr ds:[78BE96],0;gvar_0078BE96:Boolean
>006C185B    jne         006C1A75
 006C1861    cmp         byte ptr ds:[78BE94],0;gvar_0078BE94:Boolean
>006C1868    jne         006C1877
 006C186A    cmp         byte ptr ds:[78BE95],0;gvar_0078BE95:Boolean
>006C1871    je          006C1A75
 006C1877    cmp         eax,10
>006C187A    ja          006C1A73
 006C1880    jmp         dword ptr [eax*4+6C1887]
 006C1880    dd          006C18CB
 006C1880    dd          006C1A2B
 006C1880    dd          006C1A34
 006C1880    dd          006C1A3D
 006C1880    dd          006C1A73
 006C1880    dd          006C1A73
 006C1880    dd          006C1A73
 006C1880    dd          006C1A73
 006C1880    dd          006C1A73
 006C1880    dd          006C1A73
 006C1880    dd          006C1A46
 006C1880    dd          006C1A4F
 006C1880    dd          006C1A73
 006C1880    dd          006C1A58
 006C1880    dd          006C1A61
 006C1880    dd          006C1A6A
 006C1880    dd          006C1984
 006C18CB    xor         ebx,ebx
 006C18CD    cmp         byte ptr ds:[81F57C],0;gvar_0081F57C
>006C18D4    jne         006C1A75
 006C18DA    mov         edx,dword ptr ds:[81F580];gvar_0081F580
 006C18E0    mov         eax,dword ptr [esi+18];TSaidValue.Phrase:string
 006C18E3    call        006BD2D0
 006C18E8    test        al,al
>006C18EA    je          006C1914
 006C18EC    mov         eax,dword ptr [esi+1C];TSaidValue.Confidence:Integer
 006C18EF    dec         eax
 006C18F0    mov         ecx,3
 006C18F5    cdq
 006C18F6    idiv        eax,ecx
 006C18F8    cmp         edx,dword ptr ds:[81F584];gvar_0081F584
>006C18FE    jge         006C1914
 006C1900    cmp         byte ptr ds:[81F588],0;gvar_0081F588
>006C1907    jne         006C1A75
 006C190D    mov         bl,1
>006C190F    jmp         006C1A75
 006C1914    mov         edx,dword ptr ds:[81F58C];gvar_0081F58C
 006C191A    mov         eax,dword ptr [esi+18];TSaidValue.Phrase:string
 006C191D    call        006BD2D0
 006C1922    test        al,al
>006C1924    je          006C1933
 006C1926    cmp         dword ptr [esi+1C],0;TSaidValue.Confidence:Integer
>006C192A    jg          006C1933
 006C192C    mov         bl,1
>006C192E    jmp         006C1A75
 006C1933    mov         edx,dword ptr ds:[81F590];gvar_0081F590
 006C1939    mov         eax,dword ptr [esi+18];TSaidValue.Phrase:string
 006C193C    call        006BD2D0
 006C1941    test        al,al
>006C1943    je          006C1A75
 006C1949    cmp         byte ptr ds:[81F598],0;gvar_0081F598
>006C1950    je          006C1959
 006C1952    xor         ebx,ebx
>006C1954    jmp         006C1A75
 006C1959    mov         eax,[0081F594];gvar_0081F594
 006C195E    cmp         eax,dword ptr [esi+1C];TSaidValue.Confidence:Integer
>006C1961    jl          006C1A75
 006C1967    mov         bl,1
 006C1969    cmp         dword ptr ds:[78BE90],0;gvar_0078BE90:TSpeechRecogniser
>006C1970    je          006C1A75
 006C1976    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C197B    mov         byte ptr [eax+2C],1
>006C197F    jmp         006C1A75
 006C1984    xor         ebx,ebx
 006C1986    cmp         byte ptr ds:[81F57C],0;gvar_0081F57C
>006C198D    je          006C1A75
 006C1993    mov         edx,dword ptr ds:[81F580];gvar_0081F580
 006C1999    mov         eax,dword ptr [esi+18];TSaidValue.Phrase:string
 006C199C    call        006BD2D0
 006C19A1    test        al,al
>006C19A3    je          006C19CD
 006C19A5    mov         eax,dword ptr [esi+1C];TSaidValue.Confidence:Integer
 006C19A8    dec         eax
 006C19A9    mov         ecx,3
 006C19AE    cdq
 006C19AF    idiv        eax,ecx
 006C19B1    cmp         edx,dword ptr ds:[81F584];gvar_0081F584
>006C19B7    jge         006C19CD
 006C19B9    cmp         byte ptr ds:[81F588],0;gvar_0081F588
>006C19C0    jne         006C1A75
 006C19C6    mov         bl,1
>006C19C8    jmp         006C1A75
 006C19CD    mov         edx,dword ptr ds:[81F58C];gvar_0081F58C
 006C19D3    mov         eax,dword ptr [esi+18];TSaidValue.Phrase:string
 006C19D6    call        006BD2D0
 006C19DB    test        al,al
>006C19DD    je          006C19EC
 006C19DF    cmp         dword ptr [esi+1C],0;TSaidValue.Confidence:Integer
>006C19E3    jg          006C19EC
 006C19E5    mov         bl,1
>006C19E7    jmp         006C1A75
 006C19EC    mov         edx,dword ptr ds:[81F590];gvar_0081F590
 006C19F2    mov         eax,dword ptr [esi+18];TSaidValue.Phrase:string
 006C19F5    call        006BD2D0
 006C19FA    test        al,al
>006C19FC    je          006C1A75
 006C19FE    cmp         byte ptr ds:[81F598],0;gvar_0081F598
>006C1A05    je          006C1A0B
 006C1A07    xor         ebx,ebx
>006C1A09    jmp         006C1A75
 006C1A0B    mov         eax,[0081F594];gvar_0081F594
 006C1A10    cmp         eax,dword ptr [esi+1C];TSaidValue.Confidence:Integer
>006C1A13    jl          006C1A75
 006C1A15    mov         bl,1
 006C1A17    cmp         dword ptr ds:[78BE90],0;gvar_0078BE90:TSpeechRecogniser
>006C1A1E    je          006C1A75
 006C1A20    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C1A25    mov         byte ptr [eax+2C],1
>006C1A29    jmp         006C1A75
 006C1A2B    movzx       ebx,byte ptr ds:[81F576];gvar_0081F576
>006C1A32    jmp         006C1A75
 006C1A34    movzx       ebx,byte ptr ds:[81F575];gvar_0081F575
>006C1A3B    jmp         006C1A75
 006C1A3D    movzx       ebx,byte ptr ds:[81F577];gvar_0081F577
>006C1A44    jmp         006C1A75
 006C1A46    movzx       ebx,byte ptr ds:[81F5A4];gvar_0081F5A4
>006C1A4D    jmp         006C1A75
 006C1A4F    movzx       ebx,byte ptr ds:[81F5A5];gvar_0081F5A5
>006C1A56    jmp         006C1A75
 006C1A58    movzx       ebx,byte ptr ds:[78BE94];0x1 gvar_0078BE94:Boolean
>006C1A5F    jmp         006C1A75
 006C1A61    movzx       ebx,byte ptr ds:[78BE95];0xF4000000 gvar_0078BE95:Boolean
>006C1A68    jmp         006C1A75
 006C1A6A    movzx       ebx,byte ptr ds:[78BE96];0x2BF40000 gvar_0078BE96:Boolean
>006C1A71    jmp         006C1A75
 006C1A73    xor         ebx,ebx
 006C1A75    mov         eax,ebx
 006C1A77    pop         esi
 006C1A78    pop         ebx
 006C1A79    ret
*}
end;

//006C1A7C
function TSaidValue.GetDataType:TDataType;
begin
{*
 006C1A7C    mov         eax,dword ptr [eax+20];TSaidValue.Item:Integer
 006C1A7F    add         eax,0FFFFFFF9
 006C1A82    sub         eax,2
>006C1A85    jb          006C1A8B
>006C1A87    je          006C1A8E
>006C1A89    jmp         006C1A91
 006C1A8B    mov         al,4
 006C1A8D    ret
 006C1A8E    xor         eax,eax
 006C1A90    ret
 006C1A91    mov         al,3
 006C1A93    ret
*}
end;

//006C1A94
{*procedure TSaidValue.GetString(?:?);
begin
 006C1A94    push        ebx
 006C1A95    push        esi
 006C1A96    mov         esi,edx
 006C1A98    mov         ebx,eax
 006C1A9A    mov         eax,esi
 006C1A9C    call        @UStrClr
 006C1AA1    mov         eax,dword ptr [ebx+20];TSaidValue.Item:Integer
 006C1AA4    cmp         eax,0D
>006C1AA7    je          006C1ACE
 006C1AA9    cmp         eax,0E
>006C1AAC    je          006C1ACE
 006C1AAE    cmp         eax,0F
>006C1AB1    je          006C1ACE
 006C1AB3    cmp         byte ptr ds:[78BE96],0;gvar_0078BE96:Boolean
>006C1ABA    jne         006C1AFF
 006C1ABC    cmp         byte ptr ds:[78BE94],0;gvar_0078BE94:Boolean
>006C1AC3    jne         006C1ACE
 006C1AC5    cmp         byte ptr ds:[78BE95],0;gvar_0078BE95:Boolean
>006C1ACC    je          006C1AFF
 006C1ACE    sub         eax,7
>006C1AD1    je          006C1AD8
 006C1AD3    dec         eax
>006C1AD4    je          006C1AE7
>006C1AD6    jmp         006C1AF6
 006C1AD8    mov         eax,esi
 006C1ADA    mov         edx,dword ptr ds:[81F580];gvar_0081F580
 006C1AE0    call        @UStrAsg
>006C1AE5    jmp         006C1AFF
 006C1AE7    mov         eax,esi
 006C1AE9    mov         edx,dword ptr ds:[81F59C];gvar_0081F59C
 006C1AEF    call        @UStrAsg
>006C1AF4    jmp         006C1AFF
 006C1AF6    mov         edx,esi
 006C1AF8    mov         eax,ebx
 006C1AFA    call        TExpression.GetString
 006C1AFF    pop         esi
 006C1B00    pop         ebx
 006C1B01    ret
end;*}

//006C1B04
procedure TSaidValue.GetValue;
begin
{*
 006C1B04    push        ebx
 006C1B05    add         esp,0FFFFFFF8
 006C1B08    mov         ebx,eax
 006C1B0A    xor         eax,eax
 006C1B0C    mov         dword ptr [esp],eax
 006C1B0F    mov         dword ptr [esp+4],eax
 006C1B13    mov         eax,dword ptr [ebx+20];TSaidValue.Item:Integer
 006C1B16    cmp         eax,0D
>006C1B19    je          006C1B40
 006C1B1B    cmp         eax,0E
>006C1B1E    je          006C1B40
 006C1B20    cmp         eax,0F
>006C1B23    je          006C1B40
 006C1B25    cmp         byte ptr ds:[78BE96],0;gvar_0078BE96:Boolean
>006C1B2C    jne         006C1B96
 006C1B2E    cmp         byte ptr ds:[78BE94],0;gvar_0078BE94:Boolean
>006C1B35    jne         006C1B40
 006C1B37    cmp         byte ptr ds:[78BE95],0;gvar_0078BE95:Boolean
>006C1B3E    je          006C1B96
 006C1B40    sub         eax,7
>006C1B43    je          006C1B52
 006C1B45    dec         eax
>006C1B46    je          006C1B5D
 006C1B48    dec         eax
>006C1B49    je          006C1B68
 006C1B4B    sub         eax,3
>006C1B4E    je          006C1B7A
>006C1B50    jmp         006C1B86
 006C1B52    xor         eax,eax
 006C1B54    mov         dword ptr [esp],eax
 006C1B57    mov         dword ptr [esp+4],eax
>006C1B5B    jmp         006C1B96
 006C1B5D    xor         eax,eax
 006C1B5F    mov         dword ptr [esp],eax
 006C1B62    mov         dword ptr [esp+4],eax
>006C1B66    jmp         006C1B96
 006C1B68    fild        dword ptr ds:[81F5A0];gvar_0081F5A0:Single
 006C1B6E    fdiv        dword ptr ds:[6C1BA0];100:Single
 006C1B74    fstp        qword ptr [esp]
 006C1B77    wait
>006C1B78    jmp         006C1B96
 006C1B7A    fild        dword ptr ds:[81F570];gvar_0081F570:Pointer
 006C1B80    fstp        qword ptr [esp]
 006C1B83    wait
>006C1B84    jmp         006C1B96
 006C1B86    mov         eax,ebx
 006C1B88    mov         edx,dword ptr [eax]
 006C1B8A    call        dword ptr [edx+30];TSaidValue.GetBoolean
 006C1B8D    call        00686074
 006C1B92    fstp        qword ptr [esp]
 006C1B95    wait
 006C1B96    fld         qword ptr [esp]
 006C1B99    pop         ecx
 006C1B9A    pop         edx
 006C1B9B    pop         ebx
 006C1B9C    ret
*}
end;

//006C1BA4
procedure TSaidValue.SetPhrase(s:string);
begin
{*
 006C1BA4    push        ebp
 006C1BA5    mov         ebp,esp
 006C1BA7    push        0
 006C1BA9    push        0
 006C1BAB    push        0
 006C1BAD    push        ebx
 006C1BAE    mov         dword ptr [ebp-4],edx
 006C1BB1    mov         ebx,eax
 006C1BB3    mov         eax,dword ptr [ebp-4]
 006C1BB6    call        @UStrAddRef
 006C1BBB    xor         eax,eax
 006C1BBD    push        ebp
 006C1BBE    push        6C1C2E
 006C1BC3    push        dword ptr fs:[eax]
 006C1BC6    mov         dword ptr fs:[eax],esp
 006C1BC9    mov         dword ptr [ebx+1C],2;TSaidValue.Confidence:Integer
 006C1BD0    lea         edx,[ebp-0C]
 006C1BD3    mov         eax,dword ptr [ebp-4]
 006C1BD6    call        Trim
 006C1BDB    mov         eax,dword ptr [ebp-0C]
 006C1BDE    lea         edx,[ebp-8]
 006C1BE1    call        LowerCase
 006C1BE6    mov         edx,dword ptr [ebp-8]
 006C1BE9    lea         eax,[ebx+18];TSaidValue.Phrase:string
 006C1BEC    call        @UStrAsg
 006C1BF1    cmp         dword ptr [ebx+20],10;TSaidValue.Item:Integer
>006C1BF5    jne         006C1C06
 006C1BF7    mov         edx,dword ptr [ebp-4]
 006C1BFA    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 006C1BFF    mov         ecx,dword ptr [eax]
 006C1C01    call        dword ptr [ecx+38]
>006C1C04    jmp         006C1C13
 006C1C06    mov         edx,dword ptr [ebp-4]
 006C1C09    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 006C1C0E    mov         ecx,dword ptr [eax]
 006C1C10    call        dword ptr [ecx+38]
 006C1C13    xor         eax,eax
 006C1C15    pop         edx
 006C1C16    pop         ecx
 006C1C17    pop         ecx
 006C1C18    mov         dword ptr fs:[eax],edx
 006C1C1B    push        6C1C35
 006C1C20    lea         eax,[ebp-0C]
 006C1C23    mov         edx,3
 006C1C28    call        @UStrArrayClr
 006C1C2D    ret
>006C1C2E    jmp         @HandleFinally
>006C1C33    jmp         006C1C20
 006C1C35    pop         ebx
 006C1C36    mov         esp,ebp
 006C1C38    pop         ebp
 006C1C39    ret
*}
end;

//006C1C3C
function TSaidValue.SetString(NewValue:string):Boolean;
begin
{*
 006C1C3C    push        ebp
 006C1C3D    mov         ebp,esp
 006C1C3F    mov         ecx,6
 006C1C44    push        0
 006C1C46    push        0
 006C1C48    dec         ecx
>006C1C49    jne         006C1C44
 006C1C4B    push        ebx
 006C1C4C    push        esi
 006C1C4D    push        edi
 006C1C4E    mov         dword ptr [ebp-4],edx
 006C1C51    mov         ebx,eax
 006C1C53    mov         eax,dword ptr [ebp-4]
 006C1C56    call        @UStrAddRef
 006C1C5B    xor         eax,eax
 006C1C5D    push        ebp
 006C1C5E    push        6C1D0D
 006C1C63    push        dword ptr fs:[eax]
 006C1C66    mov         dword ptr fs:[eax],esp
 006C1C69    cmp         dword ptr [ebx+20],7;TSaidValue.Item:Integer
>006C1C6D    jne         006C1CDB
 006C1C6F    mov         byte ptr [ebp-19],1
 006C1C73    cmp         dword ptr ds:[78BE90],0;gvar_0078BE90:TSpeechRecogniser
>006C1C7A    je          006C1CDF
 006C1C7C    xor         eax,eax
 006C1C7E    push        ebp
 006C1C7F    push        6C1CCF
 006C1C84    push        dword ptr fs:[eax]
 006C1C87    mov         dword ptr fs:[eax],esp
 006C1C8A    push        0
 006C1C8C    lea         eax,[ebp-18]
 006C1C8F    push        eax
 006C1C90    lea         eax,[ebp-2C]
 006C1C93    mov         edx,dword ptr [ebp-4]
 006C1C96    call        @OleVarFromUStr
 006C1C9B    push        dword ptr [ebp-20]
 006C1C9E    push        dword ptr [ebp-24]
 006C1CA1    push        dword ptr [ebp-28]
 006C1CA4    push        dword ptr [ebp-2C]
 006C1CA7    lea         edx,[ebp-30]
 006C1CAA    mov         eax,[0078BE90];0x0 gvar_0078BE90:TSpeechRecogniser
 006C1CAF    mov         eax,dword ptr [eax+3C];TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006C1CB2    call        005CC3DC
 006C1CB7    mov         eax,dword ptr [ebp-30]
 006C1CBA    push        eax
 006C1CBB    mov         eax,dword ptr [eax]
 006C1CBD    call        dword ptr [eax+54]
 006C1CC0    call        @CheckAutoResult
 006C1CC5    xor         eax,eax
 006C1CC7    pop         edx
 006C1CC8    pop         ecx
 006C1CC9    pop         ecx
 006C1CCA    mov         dword ptr fs:[eax],edx
>006C1CCD    jmp         006C1CDF
>006C1CCF    jmp         @HandleAnyException
 006C1CD4    call        @DoneExcept
>006C1CD9    jmp         006C1CDF
 006C1CDB    mov         byte ptr [ebp-19],0
 006C1CDF    xor         eax,eax
 006C1CE1    pop         edx
 006C1CE2    pop         ecx
 006C1CE3    pop         ecx
 006C1CE4    mov         dword ptr fs:[eax],edx
 006C1CE7    push        6C1D14
 006C1CEC    lea         eax,[ebp-30]
 006C1CEF    call        @IntfClear
 006C1CF4    lea         eax,[ebp-2C]
 006C1CF7    call        @VarClr
 006C1CFC    lea         eax,[ebp-18]
 006C1CFF    call        @VarClr
 006C1D04    lea         eax,[ebp-4]
 006C1D07    call        @UStrClr
 006C1D0C    ret
>006C1D0D    jmp         @HandleFinally
>006C1D12    jmp         006C1CEC
 006C1D14    movzx       eax,byte ptr [ebp-19]
 006C1D18    pop         edi
 006C1D19    pop         esi
 006C1D1A    pop         ebx
 006C1D1B    mov         esp,ebp
 006C1D1D    pop         ebp
 006C1D1E    ret
*}
end;

//006C1D20
{*procedure TSaidValue.SetValue(NewValue:Double; ?:?);
begin
 006C1D20    push        ebp
 006C1D21    mov         ebp,esp
 006C1D23    mov         edx,dword ptr [eax+20];TSaidValue.Item:Integer
 006C1D26    cmp         edx,0D
>006C1D29    jne         006C1D3F
 006C1D2B    push        dword ptr [ebp+0C]
 006C1D2E    push        dword ptr [ebp+8]
 006C1D31    call        00686060
 006C1D36    mov         [0078BE94],al;gvar_0078BE94:Boolean
 006C1D3B    mov         al,1
>006C1D3D    jmp         006C1D73
 006C1D3F    cmp         edx,0E
>006C1D42    jne         006C1D58
 006C1D44    push        dword ptr [ebp+0C]
 006C1D47    push        dword ptr [ebp+8]
 006C1D4A    call        00686060
 006C1D4F    mov         [0078BE95],al;gvar_0078BE95:Boolean
 006C1D54    mov         al,1
>006C1D56    jmp         006C1D73
 006C1D58    cmp         edx,0F
>006C1D5B    jne         006C1D71
 006C1D5D    push        dword ptr [ebp+0C]
 006C1D60    push        dword ptr [ebp+8]
 006C1D63    call        00686060
 006C1D68    mov         [0078BE96],al;gvar_0078BE96:Boolean
 006C1D6D    mov         al,1
>006C1D6F    jmp         006C1D73
 006C1D71    xor         eax,eax
 006C1D73    pop         ebp
 006C1D74    ret         8
end;*}

//006C1D78
{*procedure TSaidValue.ToString(?:?);
begin
 006C1D78    push        ebp
 006C1D79    mov         ebp,esp
 006C1D7B    xor         ecx,ecx
 006C1D7D    push        ecx
 006C1D7E    push        ecx
 006C1D7F    push        ecx
 006C1D80    push        ecx
 006C1D81    push        ebx
 006C1D82    push        esi
 006C1D83    push        edi
 006C1D84    mov         esi,edx
 006C1D86    mov         ebx,eax
 006C1D88    xor         eax,eax
 006C1D8A    push        ebp
 006C1D8B    push        6C1EA5
 006C1D90    push        dword ptr fs:[eax]
 006C1D93    mov         dword ptr fs:[eax],esp
 006C1D96    mov         edi,dword ptr [ebx+1C];TSaidValue.Confidence:Integer
 006C1D99    cmp         edi,2
>006C1D9C    je          006C1E2A
 006C1DA2    mov         eax,dword ptr [ebx+20];TSaidValue.Item:Integer
 006C1DA5    sub         eax,1
>006C1DA8    jb          006C1DB1
 006C1DAA    sub         eax,0F
>006C1DAD    je          006C1DE1
>006C1DAF    jmp         006C1E0E
 006C1DB1    push        6C1EC0;'Said("'
 006C1DB6    push        dword ptr [ebx+18];TSaidValue.Phrase:string
 006C1DB9    push        6C1EDC;'", '
 006C1DBE    lea         edx,[ebp-4]
 006C1DC1    mov         eax,edi
 006C1DC3    call        IntToStr
 006C1DC8    push        dword ptr [ebp-4]
 006C1DCB    push        6C1EF0;')'
 006C1DD0    mov         eax,esi
 006C1DD2    mov         edx,5
 006C1DD7    call        @UStrCatN
>006C1DDC    jmp         006C1E8A
 006C1DE1    push        6C1F00;'AskedFor("'
 006C1DE6    push        dword ptr [ebx+18];TSaidValue.Phrase:string
 006C1DE9    push        6C1EDC;'", '
 006C1DEE    lea         edx,[ebp-8]
 006C1DF1    mov         eax,edi
 006C1DF3    call        IntToStr
 006C1DF8    push        dword ptr [ebp-8]
 006C1DFB    push        6C1EF0;')'
 006C1E00    mov         eax,esi
 006C1E02    mov         edx,5
 006C1E07    call        @UStrCatN
>006C1E0C    jmp         006C1E8A
 006C1E0E    lea         edx,[ebp-0C]
 006C1E11    mov         eax,dword ptr [ebx+20];TSaidValue.Item:Integer
 006C1E14    call        006C2630
 006C1E19    mov         ecx,dword ptr [ebp-0C]
 006C1E1C    mov         eax,esi
 006C1E1E    mov         edx,6C1F24;'Microphone.'
 006C1E23    call        @UStrCat3
>006C1E28    jmp         006C1E8A
 006C1E2A    mov         edi,dword ptr [ebx+20];TSaidValue.Item:Integer
 006C1E2D    mov         eax,edi
 006C1E2F    sub         eax,1
>006C1E32    jb          006C1E3B
 006C1E34    sub         eax,0F
>006C1E37    je          006C1E56
>006C1E39    jmp         006C1E71
 006C1E3B    push        6C1EC0;'Said("'
 006C1E40    push        dword ptr [ebx+18];TSaidValue.Phrase:string
 006C1E43    push        6C1F48;'")'
 006C1E48    mov         eax,esi
 006C1E4A    mov         edx,3
 006C1E4F    call        @UStrCatN
>006C1E54    jmp         006C1E8A
 006C1E56    push        6C1F00;'AskedFor("'
 006C1E5B    push        dword ptr [ebx+18];TSaidValue.Phrase:string
 006C1E5E    push        6C1F48;'")'
 006C1E63    mov         eax,esi
 006C1E65    mov         edx,3
 006C1E6A    call        @UStrCatN
>006C1E6F    jmp         006C1E8A
 006C1E71    lea         edx,[ebp-10]
 006C1E74    mov         eax,edi
 006C1E76    call        006C2630
 006C1E7B    mov         ecx,dword ptr [ebp-10]
 006C1E7E    mov         eax,esi
 006C1E80    mov         edx,6C1F24;'Microphone.'
 006C1E85    call        @UStrCat3
 006C1E8A    xor         eax,eax
 006C1E8C    pop         edx
 006C1E8D    pop         ecx
 006C1E8E    pop         ecx
 006C1E8F    mov         dword ptr fs:[eax],edx
 006C1E92    push        6C1EAC
 006C1E97    lea         eax,[ebp-10]
 006C1E9A    mov         edx,4
 006C1E9F    call        @UStrArrayClr
 006C1EA4    ret
>006C1EA5    jmp         @HandleFinally
>006C1EAA    jmp         006C1E97
 006C1EAC    pop         edi
 006C1EAD    pop         esi
 006C1EAE    pop         ebx
 006C1EAF    mov         esp,ebp
 006C1EB1    pop         ebp
 006C1EB2    ret
end;*}

//006C1F50
procedure sub_006C1F50;
begin
{*
 006C1F50    mov         byte ptr ds:[81F5B0],0;gvar_0081F5B0
 006C1F57    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 006C1F5C    mov         edx,dword ptr [eax]
 006C1F5E    call        dword ptr [edx+44]
 006C1F61    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 006C1F66    mov         edx,dword ptr [eax]
 006C1F68    call        dword ptr [edx+44]
 006C1F6B    ret
*}
end;

//006C1F6C
procedure sub_006C1F6C;
begin
{*
 006C1F6C    ret
*}
end;

//006C1F70
constructor TSpeechRecogniser.Create;
begin
{*
 006C1F70    push        ebp
 006C1F71    mov         ebp,esp
 006C1F73    xor         ecx,ecx
 006C1F75    push        ecx
 006C1F76    push        ecx
 006C1F77    push        ecx
 006C1F78    push        ecx
 006C1F79    push        ecx
 006C1F7A    push        ecx
 006C1F7B    push        ebx
 006C1F7C    push        esi
 006C1F7D    push        edi
 006C1F7E    test        dl,dl
>006C1F80    je          006C1F8A
 006C1F82    add         esp,0FFFFFFF0
 006C1F85    call        @ClassCreate
 006C1F8A    mov         byte ptr [ebp-0D],dl
 006C1F8D    mov         dword ptr [ebp-0C],eax
 006C1F90    xor         eax,eax
 006C1F92    push        ebp
 006C1F93    push        6C241C
 006C1F98    push        dword ptr fs:[eax]
 006C1F9B    mov         dword ptr fs:[eax],esp
 006C1F9E    mov         eax,6C2454;'Creating SpeechRecogniser'
 006C1FA3    call        004FA5FC
 006C1FA8    mov         eax,dword ptr [ebp-0C]
 006C1FAB    xor         edx,edx
 006C1FAD    mov         dword ptr [eax+5C],edx;TSpeechRecogniser.WordNumber:Integer
 006C1FB0    mov         eax,dword ptr [ebp-0C]
 006C1FB3    add         eax,44;TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006C1FB6    call        @IntfClear
 006C1FBB    mov         eax,dword ptr [ebp-0C]
 006C1FBE    add         eax,48;TSpeechRecogniser.Rule:ISpeechGrammarRule
 006C1FC1    call        @IntfClear
 006C1FC6    mov         eax,dword ptr [ebp-0C]
 006C1FC9    xor         edx,edx
 006C1FCB    mov         dword ptr [eax+3C],edx;TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006C1FCE    mov         eax,dword ptr [ebp-0C]
 006C1FD1    xor         edx,edx
 006C1FD3    mov         dword ptr [eax+40],edx;TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006C1FD6    call        004FA14C
 006C1FDB    cmp         eax,8
>006C1FDE    jl          006C224D
 006C1FE4    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006C1FE9    mov         eax,dword ptr [eax]
 006C1FEB    mov         eax,dword ptr [eax+5E8]
 006C1FF1    cmp         byte ptr [eax+38],0
>006C1FF5    jne         006C224D
 006C1FFB    xor         eax,eax
 006C1FFD    push        ebp
 006C1FFE    push        6C2027
 006C2003    push        dword ptr fs:[eax]
 006C2006    mov         dword ptr fs:[eax],esp
 006C2009    xor         ecx,ecx
 006C200B    mov         dl,1
 006C200D    mov         eax,[005C9DA8];TSpInProcRecoContext
 006C2012    call        TSpInProcRecoContext.Create;TSpInProcRecoContext.Create
 006C2017    mov         edx,dword ptr [ebp-0C]
 006C201A    mov         dword ptr [edx+40],eax;TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006C201D    xor         eax,eax
 006C201F    pop         edx
 006C2020    pop         ecx
 006C2021    pop         ecx
 006C2022    mov         dword ptr fs:[eax],edx
>006C2025    jmp         006C2043
>006C2027    jmp         @HandleAnyException
 006C202C    mov         eax,dword ptr [ebp-0C]
 006C202F    xor         edx,edx
 006C2031    mov         dword ptr [eax+40],edx;TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006C2034    call        @DoneExcept
>006C2039    jmp         006C23EE
 006C203E    call        @DoneExcept
 006C2043    mov         eax,dword ptr [ebp-0C]
 006C2046    mov         eax,dword ptr [eax+40];TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006C2049    mov         edx,dword ptr [ebp-0C]
 006C204C    mov         dword ptr [eax+8C],edx;TSpInProcRecoContext.?f8C:TSpeechRecogniser
 006C2052    mov         dword ptr [eax+88],6BFD84;TSpInProcRecoContext.FOnRecognition:TSpInProcRecoContextRecogn...
 006C205C    mov         edx,dword ptr [ebp-0C]
 006C205F    mov         dword ptr [eax+5C],edx;TSpInProcRecoContext.?f5C:TSpeechRecogniser
 006C2062    mov         dword ptr [eax+58],6C0858;TSpInProcRecoContext.FOnStartStream:TSpInProcRecoContextStartS...
 006C2069    mov         edx,dword ptr [ebp-0C]
 006C206C    mov         dword ptr [eax+64],edx;TSpInProcRecoContext.?f64:TSpeechRecogniser
 006C206F    mov         dword ptr [eax+60],6C08D4;TSpInProcRecoContext.FOnEndStream:TSpInProcRecoContextEndStrea...
 006C2076    mov         edx,dword ptr [ebp-0C]
 006C2079    mov         dword ptr [eax+6C],edx;TSpInProcRecoContext.?f6C:TSpeechRecogniser
 006C207C    mov         dword ptr [eax+68],6C094C;TSpInProcRecoContext.FOnBookmark:TSpInProcRecoContextBookmark ...
 006C2083    mov         edx,dword ptr [ebp-0C]
 006C2086    mov         dword ptr [eax+74],edx;TSpInProcRecoContext.?f74:TSpeechRecogniser
 006C2089    mov         dword ptr [eax+70],6C0734;TSpInProcRecoContext.FOnSoundStart:TSpInProcRecoContextSoundSt...
 006C2090    mov         edx,dword ptr [ebp-0C]
 006C2093    mov         dword ptr [eax+7C],edx;TSpInProcRecoContext.?f7C:TSpeechRecogniser
 006C2096    mov         dword ptr [eax+78],6C07CC;TSpInProcRecoContext.FOnSoundEnd:TSpInProcRecoContextSoundEnd ...
 006C209D    mov         edx,dword ptr [ebp-0C]
 006C20A0    mov         dword ptr [eax+84],edx;TSpInProcRecoContext.?f84:TSpeechRecogniser
 006C20A6    mov         dword ptr [eax+80],6C09E0;TSpInProcRecoContext.FOnPhraseStart:TSpInProcRecoContextPhrase...
 006C20B0    mov         edx,dword ptr [ebp-0C]
 006C20B3    mov         dword ptr [eax+8C],edx;TSpInProcRecoContext.?f8C:TSpeechRecogniser
 006C20B9    mov         dword ptr [eax+88],6BFD84;TSpInProcRecoContext.FOnRecognition:TSpInProcRecoContextRecogn...
 006C20C3    mov         edx,dword ptr [ebp-0C]
 006C20C6    mov         dword ptr [eax+94],edx;TSpInProcRecoContext.?f94:TSpeechRecogniser
 006C20CC    mov         dword ptr [eax+90],6C0264;TSpInProcRecoContext.FOnHypothesis:TSpInProcRecoContextHypothe...
 006C20D6    mov         edx,dword ptr [ebp-0C]
 006C20D9    mov         dword ptr [eax+9C],edx;TSpInProcRecoContext.?f9C:TSpeechRecogniser
 006C20DF    mov         dword ptr [eax+98],6C0A78;TSpInProcRecoContext.FOnPropertyNumberChange:TSpInProcRecoCont...
 006C20E9    mov         edx,dword ptr [ebp-0C]
 006C20EC    mov         dword ptr [eax+0A4],edx;TSpInProcRecoContext.?fA4:TSpeechRecogniser
 006C20F2    mov         dword ptr [eax+0A0],6C0B5C;TSpInProcRecoContext.FOnPropertyStringChange:TSpInProcRecoCon...
 006C20FC    mov         edx,dword ptr [ebp-0C]
 006C20FF    mov         dword ptr [eax+0AC],edx;TSpInProcRecoContext.?fAC:TSpeechRecogniser
 006C2105    mov         dword ptr [eax+0A8],6C0C2C;TSpInProcRecoContext.FOnFalseRecognition:TSpInProcRecoContext...
 006C210F    mov         edx,dword ptr [ebp-0C]
 006C2112    mov         dword ptr [eax+0B4],edx;TSpInProcRecoContext.?fB4:TSpeechRecogniser
 006C2118    mov         dword ptr [eax+0B0],6C1028;TSpInProcRecoContext.FOnInterference:TSpInProcRecoContextInte...
 006C2122    mov         edx,dword ptr [ebp-0C]
 006C2125    mov         dword ptr [eax+0BC],edx;TSpInProcRecoContext.?fBC:TSpeechRecogniser
 006C212B    mov         dword ptr [eax+0B8],6C1318;TSpInProcRecoContext.FOnRequestUI:TSpInProcRecoContextRequest...
 006C2135    mov         edx,dword ptr [ebp-0C]
 006C2138    mov         dword ptr [eax+0C4],edx;TSpInProcRecoContext.?fC4:TSpeechRecogniser
 006C213E    mov         dword ptr [eax+0C0],6C13C0;TSpInProcRecoContext.FOnRecognizerStateChange:TSpInProcRecoCo...
 006C2148    mov         edx,dword ptr [ebp-0C]
 006C214B    mov         dword ptr [eax+0CC],edx;TSpInProcRecoContext.?fCC:TSpeechRecogniser
 006C2151    mov         dword ptr [eax+0C8],6C1450;TSpInProcRecoContext.FOnAdaptation:TSpInProcRecoContextAdapta...
 006C215B    mov         edx,dword ptr [ebp-0C]
 006C215E    mov         dword ptr [eax+0D4],edx;TSpInProcRecoContext.?fD4:TSpeechRecogniser
 006C2164    mov         dword ptr [eax+0D0],6C14CC;TSpInProcRecoContext.FOnRecognitionForOtherContext:TSpInProcR...
 006C216E    mov         edx,dword ptr [ebp-0C]
 006C2171    mov         dword ptr [eax+0DC],edx;TSpInProcRecoContext.?fDC:TSpeechRecogniser
 006C2177    mov         dword ptr [eax+0D8],6C159C;TSpInProcRecoContext.FOnAudioLevel:TSpInProcRecoContextAudioL...
 006C2181    mov         edx,dword ptr [ebp-0C]
 006C2184    mov         dword ptr [eax+0E4],edx;TSpInProcRecoContext.?fE4:TSpeechRecogniser
 006C218A    mov         dword ptr [eax+0E0],6C1658;TSpInProcRecoContext.FOnEnginePrivate:TSpInProcRecoContextEng...
 006C2194    xor         edx,edx
 006C2196    push        ebp
 006C2197    push        6C21B9
 006C219C    push        dword ptr fs:[edx]
 006C219F    mov         dword ptr fs:[edx],esp
 006C21A2    lea         edx,[ebp-4]
 006C21A5    mov         eax,[005C59A8];CoSpObjectTokenCategory
 006C21AA    call        CoSpObjectTokenCategory.Create
 006C21AF    xor         eax,eax
 006C21B1    pop         edx
 006C21B2    pop         ecx
 006C21B3    pop         ecx
 006C21B4    mov         dword ptr fs:[eax],edx
>006C21B7    jmp         006C21D9
>006C21B9    jmp         @HandleOnException
 006C21BE    dd          1
 006C21C2    dd          00418C04;Exception
 006C21C6    dd          006C21CA
 006C21CA    mov         eax,6C2494;'Can''t create category!'
 006C21CF    call        004FA048
 006C21D4    call        @DoneExcept
 006C21D9    push        0
 006C21DB    push        6C24C8
 006C21E0    mov         eax,dword ptr [ebp-4]
 006C21E3    push        eax
 006C21E4    mov         eax,dword ptr [eax]
 006C21E6    call        dword ptr [eax+28]
 006C21E9    call        @CheckAutoResult
 006C21EE    lea         edx,[ebp-8]
 006C21F1    mov         eax,[005C5AE8];CoSpObjectToken
 006C21F6    call        CoSpObjectToken.Create
 006C21FB    push        0
 006C21FD    push        0
 006C21FF    lea         eax,[ebp-14]
 006C2202    call        @WStrClr
 006C2207    push        eax
 006C2208    mov         eax,dword ptr [ebp-4]
 006C220B    push        eax
 006C220C    mov         eax,dword ptr [eax]
 006C220E    call        dword ptr [eax+24]
 006C2211    call        @CheckAutoResult
 006C2216    mov         eax,dword ptr [ebp-14]
 006C2219    push        eax
 006C221A    mov         eax,dword ptr [ebp-8]
 006C221D    push        eax
 006C221E    mov         eax,dword ptr [eax]
 006C2220    call        dword ptr [eax+2C]
 006C2223    call        @CheckAutoResult
 006C2228    mov         eax,dword ptr [ebp-8]
 006C222B    push        eax
 006C222C    lea         edx,[ebp-18]
 006C222F    mov         eax,dword ptr [ebp-0C]
 006C2232    mov         eax,dword ptr [eax+40];TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006C2235    call        005CD46C
 006C223A    mov         eax,dword ptr [ebp-18]
 006C223D    push        eax
 006C223E    mov         eax,dword ptr [eax]
 006C2240    call        dword ptr [eax+2C]
 006C2243    call        @CheckAutoResult
>006C2248    jmp         006C23E6
 006C224D    xor         eax,eax
 006C224F    push        ebp
 006C2250    push        6C2279
 006C2255    push        dword ptr fs:[eax]
 006C2258    mov         dword ptr fs:[eax],esp
 006C225B    xor         ecx,ecx
 006C225D    mov         dl,1
 006C225F    mov         eax,[005C8164];TSpSharedRecoContext
 006C2264    call        TSpSharedRecoContext.Create;TSpSharedRecoContext.Create
 006C2269    mov         edx,dword ptr [ebp-0C]
 006C226C    mov         dword ptr [edx+3C],eax;TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006C226F    xor         eax,eax
 006C2271    pop         edx
 006C2272    pop         ecx
 006C2273    pop         ecx
 006C2274    mov         dword ptr fs:[eax],edx
>006C2277    jmp         006C2295
>006C2279    jmp         @HandleAnyException
 006C227E    mov         eax,dword ptr [ebp-0C]
 006C2281    xor         edx,edx
 006C2283    mov         dword ptr [eax+3C],edx;TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006C2286    call        @DoneExcept
>006C228B    jmp         006C23EE
 006C2290    call        @DoneExcept
 006C2295    mov         eax,dword ptr [ebp-0C]
 006C2298    mov         eax,dword ptr [eax+3C];TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006C229B    mov         edx,dword ptr [ebp-0C]
 006C229E    mov         dword ptr [eax+8C],edx;TSpSharedRecoContext.?f8C:TSpeechRecogniser
 006C22A4    mov         dword ptr [eax+88],6BFD84;TSpSharedRecoContext.FOnRecognition:TSpSharedRecoContextRecogn...
 006C22AE    mov         edx,dword ptr [ebp-0C]
 006C22B1    mov         dword ptr [eax+5C],edx;TSpSharedRecoContext.?f5C:TSpeechRecogniser
 006C22B4    mov         dword ptr [eax+58],6C0858;TSpSharedRecoContext.FOnStartStream:TSpSharedRecoContextStartS...
 006C22BB    mov         edx,dword ptr [ebp-0C]
 006C22BE    mov         dword ptr [eax+64],edx;TSpSharedRecoContext.?f64:TSpeechRecogniser
 006C22C1    mov         dword ptr [eax+60],6C08D4;TSpSharedRecoContext.FOnEndStream:TSpSharedRecoContextEndStrea...
 006C22C8    mov         edx,dword ptr [ebp-0C]
 006C22CB    mov         dword ptr [eax+6C],edx;TSpSharedRecoContext.?f6C:TSpeechRecogniser
 006C22CE    mov         dword ptr [eax+68],6C094C;TSpSharedRecoContext.FOnBookmark:TSpSharedRecoContextBookmark ...
 006C22D5    mov         edx,dword ptr [ebp-0C]
 006C22D8    mov         dword ptr [eax+74],edx;TSpSharedRecoContext.?f74:TSpeechRecogniser
 006C22DB    mov         dword ptr [eax+70],6C0734;TSpSharedRecoContext.FOnSoundStart:TSpSharedRecoContextSoundSt...
 006C22E2    mov         edx,dword ptr [ebp-0C]
 006C22E5    mov         dword ptr [eax+7C],edx;TSpSharedRecoContext.?f7C:TSpeechRecogniser
 006C22E8    mov         dword ptr [eax+78],6C07CC;TSpSharedRecoContext.FOnSoundEnd:TSpSharedRecoContextSoundEnd ...
 006C22EF    mov         edx,dword ptr [ebp-0C]
 006C22F2    mov         dword ptr [eax+84],edx;TSpSharedRecoContext.?f84:TSpeechRecogniser
 006C22F8    mov         dword ptr [eax+80],6C09E0;TSpSharedRecoContext.FOnPhraseStart:TSpSharedRecoContextPhrase...
 006C2302    mov         edx,dword ptr [ebp-0C]
 006C2305    mov         dword ptr [eax+8C],edx;TSpSharedRecoContext.?f8C:TSpeechRecogniser
 006C230B    mov         dword ptr [eax+88],6BFD84;TSpSharedRecoContext.FOnRecognition:TSpSharedRecoContextRecogn...
 006C2315    mov         edx,dword ptr [ebp-0C]
 006C2318    mov         dword ptr [eax+94],edx;TSpSharedRecoContext.?f94:TSpeechRecogniser
 006C231E    mov         dword ptr [eax+90],6C0264;TSpSharedRecoContext.FOnHypothesis:TSpSharedRecoContextHypothe...
 006C2328    mov         edx,dword ptr [ebp-0C]
 006C232B    mov         dword ptr [eax+9C],edx;TSpSharedRecoContext.?f9C:TSpeechRecogniser
 006C2331    mov         dword ptr [eax+98],6C0A78;TSpSharedRecoContext.FOnPropertyNumberChange:TSpSharedRecoCont...
 006C233B    mov         edx,dword ptr [ebp-0C]
 006C233E    mov         dword ptr [eax+0A4],edx;TSpSharedRecoContext.?fA4:TSpeechRecogniser
 006C2344    mov         dword ptr [eax+0A0],6C0B5C;TSpSharedRecoContext.FOnPropertyStringChange:TSpSharedRecoCon...
 006C234E    mov         edx,dword ptr [ebp-0C]
 006C2351    mov         dword ptr [eax+0AC],edx;TSpSharedRecoContext.?fAC:TSpeechRecogniser
 006C2357    mov         dword ptr [eax+0A8],6C0C2C;TSpSharedRecoContext.FOnFalseRecognition:TSpSharedRecoContext...
 006C2361    mov         edx,dword ptr [ebp-0C]
 006C2364    mov         dword ptr [eax+0B4],edx;TSpSharedRecoContext.?fB4:TSpeechRecogniser
 006C236A    mov         dword ptr [eax+0B0],6C1028;TSpSharedRecoContext.FOnInterference:TSpSharedRecoContextInte...
 006C2374    mov         edx,dword ptr [ebp-0C]
 006C2377    mov         dword ptr [eax+0BC],edx;TSpSharedRecoContext.?fBC:TSpeechRecogniser
 006C237D    mov         dword ptr [eax+0B8],6C1318;TSpSharedRecoContext.FOnRequestUI:TSpSharedRecoContextRequest...
 006C2387    mov         edx,dword ptr [ebp-0C]
 006C238A    mov         dword ptr [eax+0C4],edx;TSpSharedRecoContext.?fC4:TSpeechRecogniser
 006C2390    mov         dword ptr [eax+0C0],6C13C0;TSpSharedRecoContext.FOnRecognizerStateChange:TSpSharedRecoCo...
 006C239A    mov         edx,dword ptr [ebp-0C]
 006C239D    mov         dword ptr [eax+0CC],edx;TSpSharedRecoContext.?fCC:TSpeechRecogniser
 006C23A3    mov         dword ptr [eax+0C8],6C1450;TSpSharedRecoContext.FOnAdaptation:TSpSharedRecoContextAdapta...
 006C23AD    mov         edx,dword ptr [ebp-0C]
 006C23B0    mov         dword ptr [eax+0D4],edx;TSpSharedRecoContext.?fD4:TSpeechRecogniser
 006C23B6    mov         dword ptr [eax+0D0],6C14CC;TSpSharedRecoContext.FOnRecognitionForOtherContext:TSpSharedR...
 006C23C0    mov         edx,dword ptr [ebp-0C]
 006C23C3    mov         dword ptr [eax+0DC],edx;TSpSharedRecoContext.?fDC:TSpeechRecogniser
 006C23C9    mov         dword ptr [eax+0D8],6C159C;TSpSharedRecoContext.FOnAudioLevel:TSpSharedRecoContextAudioL...
 006C23D3    mov         edx,dword ptr [ebp-0C]
 006C23D6    mov         dword ptr [eax+0E4],edx;TSpSharedRecoContext.?fE4:TSpeechRecogniser
 006C23DC    mov         dword ptr [eax+0E0],6C1658;TSpSharedRecoContext.FOnEnginePrivate:TSpSharedRecoContextEng...
 006C23E6    mov         eax,dword ptr [ebp-0C]
 006C23E9    call        TSpeechRecogniser.CreateGrammar
 006C23EE    xor         eax,eax
 006C23F0    pop         edx
 006C23F1    pop         ecx
 006C23F2    pop         ecx
 006C23F3    mov         dword ptr fs:[eax],edx
 006C23F6    push        6C2423
 006C23FB    lea         eax,[ebp-18]
 006C23FE    call        @IntfClear
 006C2403    lea         eax,[ebp-14]
 006C2406    call        @WStrClr
 006C240B    lea         eax,[ebp-8]
 006C240E    call        @IntfClear
 006C2413    lea         eax,[ebp-4]
 006C2416    call        @IntfClear
 006C241B    ret
>006C241C    jmp         @HandleFinally
>006C2421    jmp         006C23FB
 006C2423    mov         eax,dword ptr [ebp-0C]
 006C2426    cmp         byte ptr [ebp-0D],0
>006C242A    je          006C243B
 006C242C    call        @AfterConstruction
 006C2431    pop         dword ptr fs:[0]
 006C2438    add         esp,0C
 006C243B    mov         eax,dword ptr [ebp-0C]
 006C243E    pop         edi
 006C243F    pop         esi
 006C2440    pop         ebx
 006C2441    mov         esp,ebp
 006C2443    pop         ebp
 006C2444    ret
*}
end;

//006C2538
destructor TSpeechRecogniser.Destroy();
begin
{*
 006C2538    push        ebx
 006C2539    push        esi
 006C253A    call        @BeforeDestruction
 006C253F    mov         ebx,edx
 006C2541    mov         esi,eax
 006C2543    lea         eax,[esi+44];TSpeechRecogniser.SRGrammar:ISpeechRecoGrammar
 006C2546    call        @IntfClear
 006C254B    lea         eax,[esi+48];TSpeechRecogniser.Rule:ISpeechGrammarRule
 006C254E    call        @IntfClear
 006C2553    lea         eax,[esi+3C];TSpeechRecogniser.SpSharedRecoContext:TSpSharedRecoContext
 006C2556    mov         edx,dword ptr [eax]
 006C2558    xor         ecx,ecx
 006C255A    mov         dword ptr [eax],ecx
 006C255C    mov         eax,edx
 006C255E    call        TObject.Free
 006C2563    lea         eax,[esi+40];TSpeechRecogniser.SpInprocRecoContext:TSpInProcRecoContext
 006C2566    mov         edx,dword ptr [eax]
 006C2568    xor         ecx,ecx
 006C256A    mov         dword ptr [eax],ecx
 006C256C    mov         eax,edx
 006C256E    call        TObject.Free
 006C2573    xor         eax,eax
 006C2575    mov         dword ptr [esi+5C],eax;TSpeechRecogniser.WordNumber:Integer
 006C2578    mov         edx,ebx
 006C257A    and         dl,0FC
 006C257D    mov         eax,esi
 006C257F    call        TObject.Destroy
 006C2584    test        bl,bl
>006C2586    jle         006C258F
 006C2588    mov         eax,esi
 006C258A    call        @ClassDestroy
 006C258F    pop         esi
 006C2590    pop         ebx
 006C2591    ret
*}
end;

//006C2594
procedure TSpeechRecogniser.ClearState;
begin
{*
 006C2594    push        ebx
 006C2595    mov         ebx,eax
 006C2597    xor         eax,eax
 006C2599    mov         dword ptr [ebx+4],eax;TSpeechRecogniser.State:TSpeechState
 006C259C    mov         byte ptr [ebx+8],0
 006C25A0    mov         byte ptr [ebx+9],0
 006C25A4    mov         byte ptr [ebx+0A],0
 006C25A8    mov         byte ptr [ebx+0D],0
 006C25AC    mov         byte ptr [ebx+0E],0
 006C25B0    mov         byte ptr [ebx+0B],0
 006C25B4    mov         byte ptr [ebx+0C],0
 006C25B8    lea         eax,[ebx+14]
 006C25BB    call        @UStrClr
 006C25C0    xor         eax,eax
 006C25C2    mov         dword ptr [ebx+18],eax
 006C25C5    mov         byte ptr [ebx+1C],0
 006C25C9    lea         eax,[ebx+20]
 006C25CC    call        @UStrClr
 006C25D1    lea         eax,[ebx+30]
 006C25D4    call        @UStrClr
 006C25D9    mov         byte ptr [ebx+0F],0
 006C25DD    pop         ebx
 006C25DE    ret
*}
end;

//006C25E0
{*function sub_006C25E0(?:UnicodeString):?;
begin
 006C25E0    push        ebp
 006C25E1    mov         ebp,esp
 006C25E3    push        ecx
 006C25E4    push        ebx
 006C25E5    mov         dword ptr [ebp-4],eax
 006C25E8    mov         eax,dword ptr [ebp-4]
 006C25EB    call        @UStrAddRef
 006C25F0    xor         eax,eax
 006C25F2    push        ebp
 006C25F3    push        6C2623
 006C25F8    push        dword ptr fs:[eax]
 006C25FB    mov         dword ptr fs:[eax],esp
 006C25FE    mov         edx,dword ptr [ebp-4]
 006C2601    mov         eax,[0081F568];gvar_0081F568:THashTable
 006C2606    call        THashTable.Get
 006C260B    mov         ebx,eax
 006C260D    xor         eax,eax
 006C260F    pop         edx
 006C2610    pop         ecx
 006C2611    pop         ecx
 006C2612    mov         dword ptr fs:[eax],edx
 006C2615    push        6C262A
 006C261A    lea         eax,[ebp-4]
 006C261D    call        @UStrClr
 006C2622    ret
>006C2623    jmp         @HandleFinally
>006C2628    jmp         006C261A
 006C262A    mov         eax,ebx
 006C262C    pop         ebx
 006C262D    pop         ecx
 006C262E    pop         ebp
 006C262F    ret
end;*}

//006C2630
{*procedure sub_006C2630(?:Integer; ?:?);
begin
 006C2630    push        ebx
 006C2631    push        esi
 006C2632    mov         esi,edx
 006C2634    mov         ebx,eax
 006C2636    mov         ecx,esi
 006C2638    mov         edx,ebx
 006C263A    mov         eax,[0081F568];gvar_0081F568:THashTable
 006C263F    call        THashTable.Get
 006C2644    pop         esi
 006C2645    pop         ebx
 006C2646    ret
end;*}

//006C2648
{*function sub_006C2648:?;
begin
 006C2648    push        ebp
 006C2649    mov         ebp,esp
 006C264B    push        0
 006C264D    push        0
 006C264F    push        0
 006C2651    push        ebx
 006C2652    push        esi
 006C2653    xor         eax,eax
 006C2655    push        ebp
 006C2656    push        6C2705
 006C265B    push        dword ptr fs:[eax]
 006C265E    mov         dword ptr fs:[eax],esp
 006C2661    mov         dl,1
 006C2663    mov         eax,[0043C7BC];TStringList
 006C2668    call        TStringList.Create;TStringList.Create
 006C266D    mov         esi,eax
 006C266F    mov         dl,1
 006C2671    mov         eax,esi
 006C2673    call        TStringList.SetSorted
 006C2678    xor         ebx,ebx
 006C267A    lea         edx,[ebp-4]
 006C267D    mov         eax,ebx
 006C267F    call        006C2630
 006C2684    lea         edx,[ebp-8]
 006C2687    mov         eax,dword ptr [ebp-4]
 006C268A    call        LowerCase
 006C268F    mov         eax,dword ptr [ebp-8]
 006C2692    mov         edx,6C2720;'said'
 006C2697    call        @UStrEqual
>006C269C    jne         006C26AD
 006C269E    lea         eax,[ebp-4]
 006C26A1    mov         edx,6C2738;'Said()'
 006C26A6    call        @UStrLAsg
>006C26AB    jmp         006C26D4
 006C26AD    lea         edx,[ebp-0C]
 006C26B0    mov         eax,dword ptr [ebp-4]
 006C26B3    call        LowerCase
 006C26B8    mov         eax,dword ptr [ebp-0C]
 006C26BB    mov         edx,6C2754;'askedfor'
 006C26C0    call        @UStrEqual
>006C26C5    jne         006C26D4
 006C26C7    lea         eax,[ebp-4]
 006C26CA    mov         edx,6C2774;'AskedFor()'
 006C26CF    call        @UStrLAsg
 006C26D4    cmp         dword ptr [ebp-4],0
>006C26D8    je          006C26E4
 006C26DA    mov         edx,dword ptr [ebp-4]
 006C26DD    mov         eax,esi
 006C26DF    mov         ecx,dword ptr [eax]
 006C26E1    call        dword ptr [ecx+38];TStringList.Add
 006C26E4    inc         ebx
 006C26E5    cmp         ebx,11
>006C26E8    jne         006C267A
 006C26EA    xor         eax,eax
 006C26EC    pop         edx
 006C26ED    pop         ecx
 006C26EE    pop         ecx
 006C26EF    mov         dword ptr fs:[eax],edx
 006C26F2    push        6C270C
 006C26F7    lea         eax,[ebp-0C]
 006C26FA    mov         edx,3
 006C26FF    call        @UStrArrayClr
 006C2704    ret
>006C2705    jmp         @HandleFinally
>006C270A    jmp         006C26F7
 006C270C    mov         eax,esi
 006C270E    pop         esi
 006C270F    pop         ebx
 006C2710    mov         esp,ebp
 006C2712    pop         ebp
 006C2713    ret
end;*}

//006C278C
{*function sub_006C278C:?;
begin
 006C278C    push        ebx
 006C278D    mov         dl,1
 006C278F    mov         eax,[0043C7BC];TStringList
 006C2794    call        TStringList.Create;TStringList.Create
 006C2799    mov         ebx,eax
 006C279B    mov         edx,6C2830;'Said("")'
 006C27A0    mov         eax,ebx
 006C27A2    mov         ecx,dword ptr [eax]
 006C27A4    call        dword ptr [ecx+38];TStringList.Add
 006C27A7    mov         edx,6C2850;'AskedFor("")'
 006C27AC    mov         eax,ebx
 006C27AE    mov         ecx,dword ptr [eax]
 006C27B0    call        dword ptr [ecx+38];TStringList.Add
 006C27B3    mov         edx,6C2878;'AudioLevel'
 006C27B8    mov         eax,ebx
 006C27BA    mov         ecx,dword ptr [eax]
 006C27BC    call        dword ptr [ecx+38];TStringList.Add
 006C27BF    mov         edx,6C289C;'TooLoud'
 006C27C4    mov         eax,ebx
 006C27C6    mov         ecx,dword ptr [eax]
 006C27C8    call        dword ptr [ecx+38];TStringList.Add
 006C27CB    mov         edx,6C28B8;'TooQuiet'
 006C27D0    mov         eax,ebx
 006C27D2    mov         ecx,dword ptr [eax]
 006C27D4    call        dword ptr [ecx+38];TStringList.Add
 006C27D7    mov         edx,6C28D8;'TooFast'
 006C27DC    mov         eax,ebx
 006C27DE    mov         ecx,dword ptr [eax]
 006C27E0    call        dword ptr [ecx+38];TStringList.Add
 006C27E3    mov         edx,6C28F4;'TooSlow'
 006C27E8    mov         eax,ebx
 006C27EA    mov         ecx,dword ptr [eax]
 006C27EC    call        dword ptr [ecx+38];TStringList.Add
 006C27EF    mov         edx,6C2910;'HeardNoise'
 006C27F4    mov         eax,ebx
 006C27F6    mov         ecx,dword ptr [eax]
 006C27F8    call        dword ptr [ecx+38];TStringList.Add
 006C27FB    mov         edx,6C2934;'NoSignal'
 006C2800    mov         eax,ebx
 006C2802    mov         ecx,dword ptr [eax]
 006C2804    call        dword ptr [ecx+38];TStringList.Add
 006C2807    mov         edx,6C2954;'InSound'
 006C280C    mov         eax,ebx
 006C280E    mov         ecx,dword ptr [eax]
 006C2810    call        dword ptr [ecx+38];TStringList.Add
 006C2813    mov         edx,6C2970;'InPhrase'
 006C2818    mov         eax,ebx
 006C281A    mov         ecx,dword ptr [eax]
 006C281C    call        dword ptr [ecx+38];TStringList.Add
 006C281F    mov         eax,ebx
 006C2821    pop         ebx
 006C2822    ret
end;*}

//006C2984
{*function sub_006C2984(?:?):?;
begin
 006C2984    push        ebp
 006C2985    mov         ebp,esp
 006C2987    push        0
 006C2989    push        0
 006C298B    push        0
 006C298D    push        ebx
 006C298E    mov         dword ptr [ebp-4],eax
 006C2991    mov         eax,dword ptr [ebp-4]
 006C2994    call        @UStrAddRef
 006C2999    xor         eax,eax
 006C299B    push        ebp
 006C299C    push        6C2A43
 006C29A1    push        dword ptr fs:[eax]
 006C29A4    mov         dword ptr fs:[eax],esp
 006C29A7    lea         edx,[ebp-8]
 006C29AA    mov         eax,dword ptr [ebp-4]
 006C29AD    call        LowerCase
 006C29B2    mov         eax,dword ptr [ebp-8]
 006C29B5    mov         edx,6C2A60;'said'
 006C29BA    call        @UStrEqual
>006C29BF    jne         006C29C5
 006C29C1    mov         bl,1
>006C29C3    jmp         006C2A28
 006C29C5    lea         edx,[ebp-0C]
 006C29C8    mov         eax,dword ptr [ebp-4]
 006C29CB    call        LowerCase
 006C29D0    mov         eax,dword ptr [ebp-0C]
 006C29D3    mov         edx,6C2A78;'askedfor'
 006C29D8    call        @UStrEqual
>006C29DD    jne         006C29E3
 006C29DF    mov         bl,1
>006C29E1    jmp         006C2A28
 006C29E3    lea         eax,[ebp-4]
 006C29E6    mov         edx,6C2A98;'Microphone'
 006C29EB    call        004F9BD0
 006C29F0    test        al,al
>006C29F2    jne         006C2A09
 006C29F4    lea         eax,[ebp-4]
 006C29F7    mov         edx,6C2ABC;'Mic'
 006C29FC    call        004F9BD0
 006C2A01    test        al,al
>006C2A03    jne         006C2A09
 006C2A05    xor         ebx,ebx
>006C2A07    jmp         006C2A28
 006C2A09    lea         eax,[ebp-4]
 006C2A0C    call        004F9D00
 006C2A11    lea         eax,[ebp-4]
 006C2A14    mov         edx,6C2AD0;'.'
 006C2A19    call        004F9BD0
 006C2A1E    test        al,al
>006C2A20    jne         006C2A26
 006C2A22    xor         ebx,ebx
>006C2A24    jmp         006C2A28
 006C2A26    mov         bl,1
 006C2A28    xor         eax,eax
 006C2A2A    pop         edx
 006C2A2B    pop         ecx
 006C2A2C    pop         ecx
 006C2A2D    mov         dword ptr fs:[eax],edx
 006C2A30    push        6C2A4A
 006C2A35    lea         eax,[ebp-0C]
 006C2A38    mov         edx,3
 006C2A3D    call        @UStrArrayClr
 006C2A42    ret
>006C2A43    jmp         @HandleFinally
>006C2A48    jmp         006C2A35
 006C2A4A    mov         eax,ebx
 006C2A4C    pop         ebx
 006C2A4D    mov         esp,ebp
 006C2A4F    pop         ebp
 006C2A50    ret
end;*}

Initialization
//00782464
{*
 00782464    push        ebp
 00782465    mov         ebp,esp
 00782467    push        ebx
 00782468    push        esi
 00782469    push        edi
 0078246A    xor         eax,eax
 0078246C    push        ebp
 0078246D    push        78254A
 00782472    push        dword ptr fs:[eax]
 00782475    mov         dword ptr fs:[eax],esp
 00782478    sub         dword ptr ds:[81F56C],1
>0078247F    jae         0078253C
 00782485    xor         edx,edx
 00782487    push        ebp
 00782488    push        782521
 0078248D    push        dword ptr fs:[edx]
 00782490    mov         dword ptr fs:[edx],esp
 00782493    mov         eax,782564;'Initializing Pie Speech Recognition'
 00782498    call        004FA5FC
 0078249D    mov         dl,1
 0078249F    mov         eax,[0043C7BC];TStringList
 007824A4    call        TStringList.Create;TStringList.Create
 007824A9    mov         [0081F5A8],eax;gvar_0081F5A8:TStringList
 007824AE    mov         dl,1
 007824B0    mov         eax,[0043C7BC];TStringList
 007824B5    call        TStringList.Create;TStringList.Create
 007824BA    mov         [0081F5AC],eax;gvar_0081F5AC:TStringList
 007824BF    xor         edx,edx
 007824C1    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 007824C6    call        TStringList.SetCaseSensitive
 007824CB    mov         dl,1
 007824CD    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 007824D2    call        TStringList.SetSorted
 007824D7    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 007824DC    mov         byte ptr [eax+39],0
 007824E0    xor         edx,edx
 007824E2    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 007824E7    call        TStringList.SetCaseSensitive
 007824EC    mov         dl,1
 007824EE    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 007824F3    call        TStringList.SetSorted
 007824F8    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 007824FD    mov         byte ptr [eax+39],0
 00782501    mov         dl,1
 00782503    mov         eax,[0067D4A4];THashTable
 00782508    call        THashTable.Create;THashTable.Create
 0078250D    mov         [0081F568],eax;gvar_0081F568:THashTable
 00782512    call        006BD37C
 00782517    xor         eax,eax
 00782519    pop         edx
 0078251A    pop         ecx
 0078251B    pop         ecx
 0078251C    mov         dword ptr fs:[eax],edx
>0078251F    jmp         0078253C
>00782521    jmp         @HandleOnException
 00782526    dd          1
 0078252A    dd          00418C04;Exception
 0078252E    dd          00782532
 00782532    call        004FA644
 00782537    call        @DoneExcept
 0078253C    xor         eax,eax
 0078253E    pop         edx
 0078253F    pop         ecx
 00782540    pop         ecx
 00782541    mov         dword ptr fs:[eax],edx
 00782544    push        782551
 00782549    ret
>0078254A    jmp         @HandleFinally
>0078254F    jmp         00782549
 00782551    pop         edi
 00782552    pop         esi
 00782553    pop         ebx
 00782554    pop         ebp
 00782555    ret
*}
Finalization
//006C2AD4
{*
 006C2AD4    push        ebp
 006C2AD5    mov         ebp,esp
 006C2AD7    push        ebx
 006C2AD8    push        esi
 006C2AD9    push        edi
 006C2ADA    xor         eax,eax
 006C2ADC    push        ebp
 006C2ADD    push        6C2B8A
 006C2AE2    push        dword ptr fs:[eax]
 006C2AE5    mov         dword ptr fs:[eax],esp
 006C2AE8    inc         dword ptr ds:[81F56C]
>006C2AEE    jne         006C2B7C
 006C2AF4    xor         edx,edx
 006C2AF6    push        ebp
 006C2AF7    push        6C2B51
 006C2AFC    push        dword ptr fs:[edx]
 006C2AFF    mov         dword ptr fs:[edx],esp
 006C2B02    mov         eax,6C2BA4;'Finalizing Pie Speech Recognition'
 006C2B07    call        004FA5FC
 006C2B0C    mov         eax,[0081F5A8];gvar_0081F5A8:TStringList
 006C2B11    xor         edx,edx
 006C2B13    mov         dword ptr ds:[81F5A8],edx;gvar_0081F5A8:TStringList
 006C2B19    call        TObject.Free
 006C2B1E    mov         eax,[0081F5AC];gvar_0081F5AC:TStringList
 006C2B23    xor         edx,edx
 006C2B25    mov         dword ptr ds:[81F5AC],edx;gvar_0081F5AC:TStringList
 006C2B2B    call        TObject.Free
 006C2B30    mov         eax,[0081F568];gvar_0081F568:THashTable
 006C2B35    xor         edx,edx
 006C2B37    mov         dword ptr ds:[81F568],edx;gvar_0081F568:THashTable
 006C2B3D    call        TObject.Free
 006C2B42    call        006C1734
 006C2B47    xor         eax,eax
 006C2B49    pop         edx
 006C2B4A    pop         ecx
 006C2B4B    pop         ecx
 006C2B4C    mov         dword ptr fs:[eax],edx
>006C2B4F    jmp         006C2B6C
>006C2B51    jmp         @HandleOnException
 006C2B56    dd          1
 006C2B5A    dd          00418C04;Exception
 006C2B5E    dd          006C2B62
 006C2B62    call        004FA644
 006C2B67    call        @DoneExcept
 006C2B6C    mov         eax,81F570;gvar_0081F570:Pointer
 006C2B71    mov         edx,dword ptr ds:[6BC2D8];TSpeechState
 006C2B77    call        @FinalizeRecord
 006C2B7C    xor         eax,eax
 006C2B7E    pop         edx
 006C2B7F    pop         ecx
 006C2B80    pop         ecx
 006C2B81    mov         dword ptr fs:[eax],edx
 006C2B84    push        6C2B91
 006C2B89    ret
>006C2B8A    jmp         @HandleFinally
>006C2B8F    jmp         006C2B89
 006C2B91    pop         edi
 006C2B92    pop         esi
 006C2B93    pop         ebx
 006C2B94    pop         ebp
 006C2B95    ret
*}
end.