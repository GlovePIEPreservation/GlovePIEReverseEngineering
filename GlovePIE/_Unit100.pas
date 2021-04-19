//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit100;

interface

uses
  SysUtils, Classes, PieSR;

type
  CoSpObjectTokenCategory = class(TObject)
  published
    //procedure CreateRemote(MachineName:string; ?:?);//005CAA00
    //procedure Create(?:?);//005CA99C
  end;
  CoSpObjectToken = class(TObject)
  published
    //procedure CreateRemote(MachineName:string; ?:?);//005CAAE4
    //procedure Create(?:?);//005CAA80
  end;
  TSpVoiceStartStream = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpVoiceEndStream = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpVoiceVoiceChange = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const VoiceObjectToken:ISpeechObjectToken) of object;;
  TSpVoiceBookmark = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const Bookmark:WideString; BookmarkId:Integer) of object;;
  TSpVoiceWord = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; CharacterPosition:Integer; Length:Integer) of object;;
  TSpVoiceSentence = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; CharacterPosition:Integer; Length:Integer) of object;;
  TSpVoicePhoneme = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; Duration:Integer; NextPhoneId:SmallInt; Feature:TOleEnum; CurrentPhoneId:SmallInt) of object;;
  TSpVoiceViseme = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; Duration:Integer; NextVisemeId:TOleEnum; Feature:TOleEnum; CurrentVisemeId:TOleEnum) of object;;
  TSpVoiceAudioLevel = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; AudioLevel:Integer) of object;;
  TSpVoiceEnginePrivate = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:Integer; EngineData:OleVariant) of object;;
  TSpVoice = class(TOleServer)
  published
    //procedure GetAudioOutputs(RequiredAttributes:WideString; OptionalAttributes:WideString; ?:?);//005CBA78
    function WaitUntilDone(msTimeout:Integer):WordBool;//005CBAE0
    function Skip(Type_:WideString; NumItems:Integer):Integer;//005CB9A4
    //procedure GetVoices(RequiredAttributes:WideString; OptionalAttributes:WideString; ?:?);//005CBA10
    function SpeakCompleteEvent:Integer;//005CBB48
    procedure DisplayUI(hWndParent:Integer; Title:WideString; TypeOfUI:WideString);//005CBC8C
    procedure DisplayUI(hWndParent:Integer; Title:WideString; var ExtraData:OleVariant; TypeOfUI:WideString);//005CBCF4
    function IsUISupported(TypeOfUI:WideString):WordBool;//005CBBAC
    function IsUISupported(TypeOfUI:WideString; var ExtraData:OleVariant):WordBool;//005CBC1C
    procedure Connect;//005CAB70
    procedure ConnectTo(svrIntf:ISpeechVoice);//005CABE8
    constructor Create(AOwner:TComponent);//005CAC9C
    destructor Destroy();//005CACD4
    procedure Disconnect;//005CAC4C
    procedure Pause;//005CB904
    procedure Resume;//005CB954
    function Speak(Text:WideString; Flags:TOleEnum):Integer;//005CB82C
    function SpeakStream(Stream:ISpeechBaseStream; Flags:TOleEnum):Integer;//005CB898
  public
    FOnStartStream:TSpVoiceStartStream;//f58
    f5A:word;//f5A
    f5C:dword;//f5C
    FOnEndStream:TSpVoiceEndStream;//f60
    f62:word;//f62
    f64:dword;//f64
    FOnVoiceChange:TSpVoiceVoiceChange;//f68
    f6A:word;//f6A
    f6C:dword;//f6C
    FOnBookmark:TSpVoiceBookmark;//f70
    f72:word;//f72
    f74:dword;//f74
    FOnWord:TSpVoiceWord;//f78
    f7A:word;//f7A
    f7C:dword;//f7C
    FOnSentence:TSpVoiceSentence;//f80
    f82:word;//f82
    f84:dword;//f84
    FOnPhoneme:TSpVoicePhoneme;//f88
    f8A:word;//f8A
    f8C:dword;//f8C
    FOnViseme:TSpVoiceViseme;//f90
    f92:word;//f92
    f94:dword;//f94
    FOnAudioLevel:TSpVoiceAudioLevel;//f98
    f9A:word;//f9A
    f9C:dword;//f9C
    FOnEnginePrivate:TSpVoiceEnginePrivate;//fA0
    fA2:word;//fA2
    fA4:dword;//fA4
    FIntf:ISpeechVoice;//fA8
    destructor Destroy(); virtual;//005CACD4
    constructor Create(AOwner:TComponent); virtual;//v2C//005CAC9C
    procedure v34; virtual;//v34//005CAB64
    //procedure v3C(?:?; ?:?); virtual;//v3C//005CACFC
    procedure Connect; virtual;//v40//005CAB70
    procedure Disconnect; virtual;//v44//005CAC4C
  end;
  TSpSharedRecoContextStartStream = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpSharedRecoContextEndStream = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; StreamReleased:WordBool) of object;;
  TSpSharedRecoContextBookmark = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; BookmarkId:OleVariant; Options:TOleEnum) of object;;
  TSpSharedRecoContextSoundStart = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpSharedRecoContextSoundEnd = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpSharedRecoContextPhraseStart = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpSharedRecoContextRecognition = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; RecognitionType:TOleEnum; const Result:ISpeechRecoResult) of object;;
  TSpSharedRecoContextHypothesis = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const Result:ISpeechRecoResult) of object;;
  TSpSharedRecoContextPropertyNumberChange = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const PropertyName:WideString; NewNumberValue:Integer) of object;;
  TSpSharedRecoContextPropertyStringChange = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const PropertyName:WideString; const NewStringValue:WideString) of object;;
  TSpSharedRecoContextFalseRecognition = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const Result:ISpeechRecoResult) of object;;
  TSpSharedRecoContextInterference = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; Interference:TOleEnum) of object;;
  TSpSharedRecoContextRequestUI = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const UIType:WideString) of object;;
  TSpSharedRecoContextRecognizerStateChange = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; NewState:TOleEnum) of object;;
  TSpSharedRecoContextAdaptation = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpSharedRecoContextRecognitionForOtherContext = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpSharedRecoContextAudioLevel = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; AudioLevel:Integer) of object;;
  TSpSharedRecoContextEnginePrivate = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; EngineData:OleVariant) of object;;
  TSpSharedRecoContext = class(TOleServer)
  published
    //procedure CreateGrammar(GrammarId:OleVariant; ?:?);//005CCBFC
    //procedure CreateGrammar(?:?);//005CCB90
    procedure Resume;//005CCB40
    procedure SetAdaptationData(AdaptationString:WideString);//005CCD98
    procedure Bookmark(Options:TOleEnum; StreamPos:OleVariant; BookmarkId:OleVariant);//005CCCE8
    //procedure CreateResultFromMemory(var ResultBlock:OleVariant; ?:?);//005CCC88
    procedure Connect;//005CBD68
    destructor Destroy();//005CBECC
    constructor Create(AOwner:TComponent);//005CBE94
    procedure Pause;//005CCAF0
    procedure Disconnect;//005CBE44
    procedure ConnectTo(svrIntf:ISpeechRecoContext);//005CBDE0
  public
    FOnStartStream:TSpSharedRecoContextStartStream;//f58
    f5A:word;//f5A
    f5C:TSpeechRecogniser;//f5C
    FOnEndStream:TSpSharedRecoContextEndStream;//f60
    f62:word;//f62
    f64:TSpeechRecogniser;//f64
    FOnBookmark:TSpSharedRecoContextBookmark;//f68
    f6A:word;//f6A
    f6C:TSpeechRecogniser;//f6C
    FOnSoundStart:TSpSharedRecoContextSoundStart;//f70
    f72:word;//f72
    f74:TSpeechRecogniser;//f74
    FOnSoundEnd:TSpSharedRecoContextSoundEnd;//f78
    f7A:word;//f7A
    f7C:TSpeechRecogniser;//f7C
    FOnPhraseStart:TSpSharedRecoContextPhraseStart;//f80
    f82:word;//f82
    f84:TSpeechRecogniser;//f84
    FOnRecognition:TSpSharedRecoContextRecognition;//f88
    f8A:word;//f8A
    f8C:TSpeechRecogniser;//f8C
    FOnHypothesis:TSpSharedRecoContextHypothesis;//f90
    f92:word;//f92
    f94:TSpeechRecogniser;//f94
    FOnPropertyNumberChange:TSpSharedRecoContextPropertyNumberChange;//f98
    f9A:word;//f9A
    f9C:TSpeechRecogniser;//f9C
    FOnPropertyStringChange:TSpSharedRecoContextPropertyStringChange;//fA0
    fA2:word;//fA2
    fA4:TSpeechRecogniser;//fA4
    FOnFalseRecognition:TSpSharedRecoContextFalseRecognition;//fA8
    fAA:word;//fAA
    fAC:TSpeechRecogniser;//fAC
    FOnInterference:TSpSharedRecoContextInterference;//fB0
    fB2:word;//fB2
    fB4:TSpeechRecogniser;//fB4
    FOnRequestUI:TSpSharedRecoContextRequestUI;//fB8
    fBA:word;//fBA
    fBC:TSpeechRecogniser;//fBC
    FOnRecognizerStateChange:TSpSharedRecoContextRecognizerStateChange;//fC0
    fC2:word;//fC2
    fC4:TSpeechRecogniser;//fC4
    FOnAdaptation:TSpSharedRecoContextAdaptation;//fC8
    fCA:word;//fCA
    fCC:TSpeechRecogniser;//fCC
    FOnRecognitionForOtherContext:TSpSharedRecoContextRecognitionForOtherContext;//fD0
    fD2:word;//fD2
    fD4:TSpeechRecogniser;//fD4
    FOnAudioLevel:TSpSharedRecoContextAudioLevel;//fD8
    fDA:word;//fDA
    fDC:TSpeechRecogniser;//fDC
    FOnEnginePrivate:TSpSharedRecoContextEnginePrivate;//fE0
    fE2:word;//fE2
    fE4:TSpeechRecogniser;//fE4
    FIntf:ISpeechRecoContext;//fE8
    destructor Destroy(); virtual;//005CBECC
    constructor Create(AOwner:TComponent); virtual;//v2C//005CBE94
    procedure v34; virtual;//v34//005CBD5C
    //procedure v3C(?:?; ?:?); virtual;//v3C//005CBEF4
    procedure Connect; virtual;//v40//005CBD68
    procedure Disconnect; virtual;//v44//005CBE44
  end;
  TSpInProcRecoContextStartStream = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpInProcRecoContextEndStream = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; StreamReleased:WordBool) of object;;
  TSpInProcRecoContextBookmark = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; BookmarkId:OleVariant; Options:TOleEnum) of object;;
  TSpInProcRecoContextSoundStart = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpInProcRecoContextSoundEnd = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpInProcRecoContextPhraseStart = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpInProcRecoContextRecognition = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; RecognitionType:TOleEnum; const Result:ISpeechRecoResult) of object;;
  TSpInProcRecoContextHypothesis = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const Result:ISpeechRecoResult) of object;;
  TSpInProcRecoContextPropertyNumberChange = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const PropertyName:WideString; NewNumberValue:Integer) of object;;
  TSpInProcRecoContextPropertyStringChange = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const PropertyName:WideString; const NewStringValue:WideString) of object;;
  TSpInProcRecoContextFalseRecognition = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const Result:ISpeechRecoResult) of object;;
  TSpInProcRecoContextInterference = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; Interference:TOleEnum) of object;;
  TSpInProcRecoContextRequestUI = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; const UIType:WideString) of object;;
  TSpInProcRecoContextRecognizerStateChange = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; NewState:TOleEnum) of object;;
  TSpInProcRecoContextAdaptation = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpInProcRecoContextRecognitionForOtherContext = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant) of object;;
  TSpInProcRecoContextAudioLevel = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; AudioLevel:Integer) of object;;
  TSpInProcRecoContextEnginePrivate = procedure(ASender:TObject; StreamNumber:Integer; StreamPosition:OleVariant; EngineData:OleVariant) of object;;
  TSpInProcRecoContext = class(TOleServer)
  published
    //procedure CreateGrammar(GrammarId:OleVariant; ?:?);//005CDC8C
    //procedure CreateGrammar(?:?);//005CDC20
    procedure Resume;//005CDBD0
    procedure SetAdaptationData(AdaptationString:WideString);//005CDE28
    procedure Bookmark(Options:TOleEnum; StreamPos:OleVariant; BookmarkId:OleVariant);//005CDD78
    //procedure CreateResultFromMemory(var ResultBlock:OleVariant; ?:?);//005CDD18
    procedure Connect;//005CCDF8
    destructor Destroy();//005CCF5C
    constructor Create(AOwner:TComponent);//005CCF24
    procedure Pause;//005CDB80
    procedure Disconnect;//005CCED4
    procedure ConnectTo(svrIntf:ISpeechRecoContext);//005CCE70
  public
    FOnStartStream:TSpInProcRecoContextStartStream;//f58
    f5A:word;//f5A
    f5C:TSpeechRecogniser;//f5C
    FOnEndStream:TSpInProcRecoContextEndStream;//f60
    f62:word;//f62
    f64:TSpeechRecogniser;//f64
    FOnBookmark:TSpInProcRecoContextBookmark;//f68
    f6A:word;//f6A
    f6C:TSpeechRecogniser;//f6C
    FOnSoundStart:TSpInProcRecoContextSoundStart;//f70
    f72:word;//f72
    f74:TSpeechRecogniser;//f74
    FOnSoundEnd:TSpInProcRecoContextSoundEnd;//f78
    f7A:word;//f7A
    f7C:TSpeechRecogniser;//f7C
    FOnPhraseStart:TSpInProcRecoContextPhraseStart;//f80
    f82:word;//f82
    f84:TSpeechRecogniser;//f84
    FOnRecognition:TSpInProcRecoContextRecognition;//f88
    f8A:word;//f8A
    f8C:TSpeechRecogniser;//f8C
    FOnHypothesis:TSpInProcRecoContextHypothesis;//f90
    f92:word;//f92
    f94:TSpeechRecogniser;//f94
    FOnPropertyNumberChange:TSpInProcRecoContextPropertyNumberChange;//f98
    f9A:word;//f9A
    f9C:TSpeechRecogniser;//f9C
    FOnPropertyStringChange:TSpInProcRecoContextPropertyStringChange;//fA0
    fA2:word;//fA2
    fA4:TSpeechRecogniser;//fA4
    FOnFalseRecognition:TSpInProcRecoContextFalseRecognition;//fA8
    fAA:word;//fAA
    fAC:TSpeechRecogniser;//fAC
    FOnInterference:TSpInProcRecoContextInterference;//fB0
    fB2:word;//fB2
    fB4:TSpeechRecogniser;//fB4
    FOnRequestUI:TSpInProcRecoContextRequestUI;//fB8
    fBA:word;//fBA
    fBC:TSpeechRecogniser;//fBC
    FOnRecognizerStateChange:TSpInProcRecoContextRecognizerStateChange;//fC0
    fC2:word;//fC2
    fC4:TSpeechRecogniser;//fC4
    FOnAdaptation:TSpInProcRecoContextAdaptation;//fC8
    fCA:word;//fCA
    fCC:TSpeechRecogniser;//fCC
    FOnRecognitionForOtherContext:TSpInProcRecoContextRecognitionForOtherContext;//fD0
    fD2:word;//fD2
    fD4:TSpeechRecogniser;//fD4
    FOnAudioLevel:TSpInProcRecoContextAudioLevel;//fD8
    fDA:word;//fDA
    fDC:TSpeechRecogniser;//fDC
    FOnEnginePrivate:TSpInProcRecoContextEnginePrivate;//fE0
    fE2:word;//fE2
    fE4:TSpeechRecogniser;//fE4
    FIntf:ISpeechRecoContext;//fE8
    destructor Destroy(); virtual;//005CCF5C
    constructor Create(AOwner:TComponent); virtual;//v2C//005CCF24
    procedure v34; virtual;//v34//005CCDEC
    //procedure v3C(?:?; ?:?); virtual;//v3C//005CCF84
    procedure Connect; virtual;//v40//005CCDF8
    procedure Disconnect; virtual;//v44//005CCED4
  end;
  TSpeechValue = class(TExpression)
  published
    procedure CreateClone;//005D0198
    //procedure ToString(?:?);//005D07B4
    procedure FillClone(c:TExpression);//005D01A8
    constructor Create;//005D0150
    //procedure GetString(?:?);//005D0230
    procedure GetValue;//005D0434
    function GetDataType:TDataType;//005D01D8
    function CanSet:Boolean;//005D014C
    function SetString(NewValue:string):Boolean;//005D0750
    procedure SetValue(NewValue:Double);//005D07A8
  public
    Item:Integer;//f18
    Speaker:Integer;//f1C
    PrevString:string;//f20
    //procedure ToString(?:?); virtual;//005D07B4
    procedure GetValue; virtual;//v2C//005D0434
    //procedure GetString(?:?); virtual;//v38//005D0230
    function GetDataType:TDataType; virtual;//v44//005D01D8
    procedure SetValue(NewValue:Double); virtual;//v58//005D07A8
    function SetString(NewValue:string):Boolean; virtual;//v5C//005D0750
    function CanSet:Boolean; virtual;//v68//005D014C
    procedure CreateClone; virtual;//v80//005D0198
    procedure FillClone(c:TExpression); virtual;//v84//005D01A8
  end;
    procedure sub_005CAB64;//005CAB64
    //procedure sub_005CAC74(?:TSpVoice; ?:?);//005CAC74
    //procedure sub_005CACFC(?:?; ?:?);//005CACFC
    //procedure sub_005CB040(?:?; ?:?);//005CB040
    //procedure sub_005CB0F8(?:TSpVoice; ?:?);//005CB0F8
    //function sub_005CB340(?:?):?;//005CB340
    //function sub_005CB3F4(?:?):?;//005CB3F4
    procedure sub_005CBD5C;//005CBD5C
    //procedure sub_005CBE6C(?:TSpSharedRecoContext; ?:?);//005CBE6C
    //procedure sub_005CBEF4(?:?; ?:?);//005CBEF4
    //procedure sub_005CC3DC(?:TSpSharedRecoContext; ?:?);//005CC3DC
    //procedure sub_005CC738(?:TSpSharedRecoContext; ?:?);//005CC738
    procedure sub_005CCDEC;//005CCDEC
    //procedure sub_005CCEFC(?:TSpInProcRecoContext; ?:?);//005CCEFC
    //procedure sub_005CCF84(?:?; ?:?);//005CCF84
    //procedure sub_005CD46C(?:TSpInProcRecoContext; ?:?);//005CD46C
    //procedure sub_005CD7C8(?:TSpInProcRecoContext; ?:?);//005CD7C8
    procedure sub_005CE228;//005CE228
    procedure sub_005CE230;//005CE230
    //function sub_005CE234(?:UnicodeString):?;//005CE234
    //procedure sub_005CE284(?:Integer; ?:?);//005CE284
    procedure sub_005CE29C;//005CE29C
    procedure sub_005CF3AC;//005CF3AC
    procedure sub_005CFED4;//005CFED4
    //function sub_005D0620(?:string; ?:Integer):?;//005D0620
    procedure sub_005D0828;//005D0828
    procedure sub_005D087C;//005D087C
    //function sub_005D088C:?;//005D088C
    //function sub_005D0C14(?:?):?;//005D0C14
    //function sub_005D0CD0(?:?):?;//005D0CD0

implementation

//005CA99C
{*procedure CoSpObjectTokenCategory.Create(?:?);
begin
 005CA99C    push        ebp
 005CA99D    mov         ebp,esp
 005CA99F    push        0
 005CA9A1    push        ebx
 005CA9A2    mov         ebx,edx
 005CA9A4    xor         eax,eax
 005CA9A6    push        ebp
 005CA9A7    push        5CA9E4
 005CA9AC    push        dword ptr fs:[eax]
 005CA9AF    mov         dword ptr fs:[eax],esp
 005CA9B2    lea         edx,[ebp-4]
 005CA9B5    mov         eax,789F60;['{A910187F-0C7A-45AC-92CC-59EDAFB77B53}']
 005CA9BA    call        CreateComObject
 005CA9BF    mov         edx,dword ptr [ebp-4]
 005CA9C2    mov         eax,ebx
 005CA9C4    mov         ecx,5CA9F0;['{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}']
 005CA9C9    call        @IntfCast
 005CA9CE    xor         eax,eax
 005CA9D0    pop         edx
 005CA9D1    pop         ecx
 005CA9D2    pop         ecx
 005CA9D3    mov         dword ptr fs:[eax],edx
 005CA9D6    push        5CA9EB
 005CA9DB    lea         eax,[ebp-4]
 005CA9DE    call        @IntfClear
 005CA9E3    ret
>005CA9E4    jmp         @HandleFinally
>005CA9E9    jmp         005CA9DB
 005CA9EB    pop         ebx
 005CA9EC    pop         ecx
 005CA9ED    pop         ebp
 005CA9EE    ret
end;*}

//005CAA00
{*procedure CoSpObjectTokenCategory.CreateRemote(MachineName:string; ?:?);
begin
 005CAA00    push        ebp
 005CAA01    mov         ebp,esp
 005CAA03    push        0
 005CAA05    push        0
 005CAA07    push        ebx
 005CAA08    push        esi
 005CAA09    mov         esi,ecx
 005CAA0B    mov         ebx,edx
 005CAA0D    xor         eax,eax
 005CAA0F    push        ebp
 005CAA10    push        5CAA62
 005CAA15    push        dword ptr fs:[eax]
 005CAA18    mov         dword ptr fs:[eax],esp
 005CAA1B    lea         eax,[ebp-8]
 005CAA1E    mov         edx,ebx
 005CAA20    call        @WStrFromUStr
 005CAA25    mov         eax,dword ptr [ebp-8]
 005CAA28    lea         ecx,[ebp-4]
 005CAA2B    mov         edx,789F60;['{A910187F-0C7A-45AC-92CC-59EDAFB77B53}']
 005CAA30    call        CreateRemoteComObject
 005CAA35    mov         edx,dword ptr [ebp-4]
 005CAA38    mov         eax,esi
 005CAA3A    mov         ecx,5CAA70;['{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}']
 005CAA3F    call        @IntfCast
 005CAA44    xor         eax,eax
 005CAA46    pop         edx
 005CAA47    pop         ecx
 005CAA48    pop         ecx
 005CAA49    mov         dword ptr fs:[eax],edx
 005CAA4C    push        5CAA69
 005CAA51    lea         eax,[ebp-8]
 005CAA54    call        @WStrClr
 005CAA59    lea         eax,[ebp-4]
 005CAA5C    call        @IntfClear
 005CAA61    ret
>005CAA62    jmp         @HandleFinally
>005CAA67    jmp         005CAA51
 005CAA69    pop         esi
 005CAA6A    pop         ebx
 005CAA6B    pop         ecx
 005CAA6C    pop         ecx
 005CAA6D    pop         ebp
 005CAA6E    ret
end;*}

//005CAA80
{*procedure CoSpObjectToken.Create(?:?);
begin
 005CAA80    push        ebp
 005CAA81    mov         ebp,esp
 005CAA83    push        0
 005CAA85    push        ebx
 005CAA86    mov         ebx,edx
 005CAA88    xor         eax,eax
 005CAA8A    push        ebp
 005CAA8B    push        5CAAC8
 005CAA90    push        dword ptr fs:[eax]
 005CAA93    mov         dword ptr fs:[eax],esp
 005CAA96    lea         edx,[ebp-4]
 005CAA99    mov         eax,789F70;['{EF411752-3736-4CB4-9C8C-8EF4CCB58EFE}']
 005CAA9E    call        CreateComObject
 005CAAA3    mov         edx,dword ptr [ebp-4]
 005CAAA6    mov         eax,ebx
 005CAAA8    mov         ecx,5CAAD4;['{C74A3ADC-B727-4500-A84A-B526721C8B8C}']
 005CAAAD    call        @IntfCast
 005CAAB2    xor         eax,eax
 005CAAB4    pop         edx
 005CAAB5    pop         ecx
 005CAAB6    pop         ecx
 005CAAB7    mov         dword ptr fs:[eax],edx
 005CAABA    push        5CAACF
 005CAABF    lea         eax,[ebp-4]
 005CAAC2    call        @IntfClear
 005CAAC7    ret
>005CAAC8    jmp         @HandleFinally
>005CAACD    jmp         005CAABF
 005CAACF    pop         ebx
 005CAAD0    pop         ecx
 005CAAD1    pop         ebp
 005CAAD2    ret
end;*}

//005CAAE4
{*procedure CoSpObjectToken.CreateRemote(MachineName:string; ?:?);
begin
 005CAAE4    push        ebp
 005CAAE5    mov         ebp,esp
 005CAAE7    push        0
 005CAAE9    push        0
 005CAAEB    push        ebx
 005CAAEC    push        esi
 005CAAED    mov         esi,ecx
 005CAAEF    mov         ebx,edx
 005CAAF1    xor         eax,eax
 005CAAF3    push        ebp
 005CAAF4    push        5CAB46
 005CAAF9    push        dword ptr fs:[eax]
 005CAAFC    mov         dword ptr fs:[eax],esp
 005CAAFF    lea         eax,[ebp-8]
 005CAB02    mov         edx,ebx
 005CAB04    call        @WStrFromUStr
 005CAB09    mov         eax,dword ptr [ebp-8]
 005CAB0C    lea         ecx,[ebp-4]
 005CAB0F    mov         edx,789F70;['{EF411752-3736-4CB4-9C8C-8EF4CCB58EFE}']
 005CAB14    call        CreateRemoteComObject
 005CAB19    mov         edx,dword ptr [ebp-4]
 005CAB1C    mov         eax,esi
 005CAB1E    mov         ecx,5CAB54;['{C74A3ADC-B727-4500-A84A-B526721C8B8C}']
 005CAB23    call        @IntfCast
 005CAB28    xor         eax,eax
 005CAB2A    pop         edx
 005CAB2B    pop         ecx
 005CAB2C    pop         ecx
 005CAB2D    mov         dword ptr fs:[eax],edx
 005CAB30    push        5CAB4D
 005CAB35    lea         eax,[ebp-8]
 005CAB38    call        @WStrClr
 005CAB3D    lea         eax,[ebp-4]
 005CAB40    call        @IntfClear
 005CAB45    ret
>005CAB46    jmp         @HandleFinally
>005CAB4B    jmp         005CAB35
 005CAB4D    pop         esi
 005CAB4E    pop         ebx
 005CAB4F    pop         ecx
 005CAB50    pop         ecx
 005CAB51    pop         ebp
 005CAB52    ret
end;*}

//005CAB64
procedure sub_005CAB64;
begin
{*
 005CAB64    mov         edx,789F80
 005CAB69    mov         dword ptr [eax+34],edx;TSpVoice.FServerData:PServerData
 005CAB6C    ret
*}
end;

//005CAB70
procedure TSpVoice.Connect;
begin
{*
 005CAB70    push        ebp
 005CAB71    mov         ebp,esp
 005CAB73    push        0
 005CAB75    push        ebx
 005CAB76    mov         ebx,eax
 005CAB78    xor         eax,eax
 005CAB7A    push        ebp
 005CAB7B    push        5CABCC
 005CAB80    push        dword ptr fs:[eax]
 005CAB83    mov         dword ptr fs:[eax],esp
 005CAB86    cmp         dword ptr [ebx+0A8],0;TSpVoice.FIntf:ISpeechVoice
>005CAB8D    jne         005CABB6
 005CAB8F    lea         edx,[ebp-4]
 005CAB92    mov         eax,ebx
 005CAB94    mov         ecx,dword ptr [eax]
 005CAB96    call        dword ptr [ecx+38];TOleServer.GetServer
 005CAB99    mov         edx,dword ptr [ebp-4]
 005CAB9C    mov         eax,ebx
 005CAB9E    call        TOleServer.ConnectEvents
 005CABA3    lea         eax,[ebx+0A8];TSpVoice.FIntf:ISpeechVoice
 005CABA9    mov         edx,dword ptr [ebp-4]
 005CABAC    mov         ecx,5CABD8;['{269316D8-57BD-11D2-9EEE-00C04F797396}']
 005CABB1    call        @IntfCast
 005CABB6    xor         eax,eax
 005CABB8    pop         edx
 005CABB9    pop         ecx
 005CABBA    pop         ecx
 005CABBB    mov         dword ptr fs:[eax],edx
 005CABBE    push        5CABD3
 005CABC3    lea         eax,[ebp-4]
 005CABC6    call        @IntfClear
 005CABCB    ret
>005CABCC    jmp         @HandleFinally
>005CABD1    jmp         005CABC3
 005CABD3    pop         ebx
 005CABD4    pop         ecx
 005CABD5    pop         ebp
 005CABD6    ret
*}
end;

//005CABE8
procedure TSpVoice.ConnectTo(svrIntf:ISpeechVoice);
begin
{*
 005CABE8    push        ebp
 005CABE9    mov         ebp,esp
 005CABEB    push        ecx
 005CABEC    push        ebx
 005CABED    mov         dword ptr [ebp-4],edx
 005CABF0    mov         ebx,eax
 005CABF2    mov         eax,dword ptr [ebp-4]
 005CABF5    call        @IntfAddRef
 005CABFA    xor         eax,eax
 005CABFC    push        ebp
 005CABFD    push        5CAC40
 005CAC02    push        dword ptr fs:[eax]
 005CAC05    mov         dword ptr fs:[eax],esp
 005CAC08    mov         eax,ebx
 005CAC0A    mov         edx,dword ptr [eax]
 005CAC0C    call        dword ptr [edx+44];TSpVoice.Disconnect
 005CAC0F    lea         eax,[ebx+0A8];TSpVoice.FIntf:ISpeechVoice
 005CAC15    mov         edx,dword ptr [ebp-4]
 005CAC18    call        @IntfCopy
 005CAC1D    mov         edx,dword ptr [ebx+0A8];TSpVoice.FIntf:ISpeechVoice
 005CAC23    mov         eax,ebx
 005CAC25    call        TOleServer.ConnectEvents
 005CAC2A    xor         eax,eax
 005CAC2C    pop         edx
 005CAC2D    pop         ecx
 005CAC2E    pop         ecx
 005CAC2F    mov         dword ptr fs:[eax],edx
 005CAC32    push        5CAC47
 005CAC37    lea         eax,[ebp-4]
 005CAC3A    call        @IntfClear
 005CAC3F    ret
>005CAC40    jmp         @HandleFinally
>005CAC45    jmp         005CAC37
 005CAC47    pop         ebx
 005CAC48    pop         ecx
 005CAC49    pop         ebp
 005CAC4A    ret
*}
end;

//005CAC4C
procedure TSpVoice.Disconnect;
begin
{*
 005CAC4C    push        ebx
 005CAC4D    mov         ebx,eax
 005CAC4F    cmp         dword ptr [ebx+0A8],0;TSpVoice.FIntf:ISpeechVoice
>005CAC56    je          005CAC70
 005CAC58    mov         edx,dword ptr [ebx+0A8];TSpVoice.FIntf:ISpeechVoice
 005CAC5E    mov         eax,ebx
 005CAC60    call        TOleServer.DisconnectEvents
 005CAC65    lea         eax,[ebx+0A8];TSpVoice.FIntf:ISpeechVoice
 005CAC6B    call        @IntfClear
 005CAC70    pop         ebx
 005CAC71    ret
*}
end;

//005CAC74
{*procedure sub_005CAC74(?:TSpVoice; ?:?);
begin
 005CAC74    push        ebx
 005CAC75    push        esi
 005CAC76    mov         esi,edx
 005CAC78    mov         ebx,eax
 005CAC7A    cmp         dword ptr [ebx+0A8],0
>005CAC81    jne         005CAC8A
 005CAC83    mov         eax,ebx
 005CAC85    mov         edx,dword ptr [eax]
 005CAC87    call        dword ptr [edx+40]
 005CAC8A    mov         eax,esi
 005CAC8C    mov         edx,dword ptr [ebx+0A8]
 005CAC92    call        @IntfCopy
 005CAC97    pop         esi
 005CAC98    pop         ebx
 005CAC99    ret
end;*}

//005CAC9C
constructor TSpVoice.Create(AOwner:TComponent);
begin
{*
 005CAC9C    push        ebx
 005CAC9D    push        esi
 005CAC9E    test        dl,dl
>005CACA0    je          005CACAA
 005CACA2    add         esp,0FFFFFFF0
 005CACA5    call        @ClassCreate
 005CACAA    mov         ebx,edx
 005CACAC    mov         esi,eax
 005CACAE    xor         edx,edx
 005CACB0    mov         eax,esi
 005CACB2    call        TOleServer.Create
 005CACB7    mov         eax,esi
 005CACB9    test        bl,bl
>005CACBB    je          005CACCC
 005CACBD    call        @AfterConstruction
 005CACC2    pop         dword ptr fs:[0]
 005CACC9    add         esp,0C
 005CACCC    mov         eax,esi
 005CACCE    pop         esi
 005CACCF    pop         ebx
 005CACD0    ret
*}
end;

//005CACD4
destructor TSpVoice.Destroy();
begin
{*
 005CACD4    push        ebx
 005CACD5    push        esi
 005CACD6    call        @BeforeDestruction
 005CACDB    mov         ebx,edx
 005CACDD    mov         esi,eax
 005CACDF    mov         edx,ebx
 005CACE1    and         dl,0FC
 005CACE4    mov         eax,esi
 005CACE6    call        TOleServer.Destroy
 005CACEB    test        bl,bl
>005CACED    jle         005CACF6
 005CACEF    mov         eax,esi
 005CACF1    call        @ClassDestroy
 005CACF6    pop         esi
 005CACF7    pop         ebx
 005CACF8    ret
*}
end;

//005CACFC
{*procedure sub_005CACFC(?:?; ?:?);
begin
 005CACFC    push        ebp
 005CACFD    mov         ebp,esp
 005CACFF    push        ecx
 005CAD00    mov         ecx,4
 005CAD05    push        0
 005CAD07    push        0
 005CAD09    dec         ecx
>005CAD0A    jne         005CAD05
 005CAD0C    xchg        ecx,dword ptr [ebp-4]
 005CAD0F    push        ebx
 005CAD10    push        esi
 005CAD11    push        edi
 005CAD12    mov         esi,ecx
 005CAD14    mov         edi,edx
 005CAD16    mov         ebx,eax
 005CAD18    xor         eax,eax
 005CAD1A    push        ebp
 005CAD1B    push        5CB01F
 005CAD20    push        dword ptr fs:[eax]
 005CAD23    mov         dword ptr fs:[eax],esp
 005CAD26    inc         edi
 005CAD27    cmp         edi,0B
>005CAD2A    ja          005CAFF9
 005CAD30    jmp         dword ptr [edi*4+5CAD37]
 005CAD30    dd          005CAFF9
 005CAD30    dd          005CAFF9
 005CAD30    dd          005CAD6C
 005CAD30    dd          005CAD93
 005CAD30    dd          005CADBA
 005CAD30    dd          005CADF7
 005CAD30    dd          005CAE3A
 005CAD30    dd          005CAEBD
 005CAD30    dd          005CAE77
 005CAD30    dd          005CAF3A
 005CAD30    dd          005CAF93
 005CAD30    dd          005CAFC7
>005CAD67    jmp         005CAFF9
 005CAD6C    cmp         word ptr [ebx+5A],0;TSpVoice.?f5A:word
>005CAD71    je          005CAFF9
 005CAD77    mov         eax,dword ptr [esi]
 005CAD79    add         eax,10
 005CAD7C    push        eax
 005CAD7D    mov         eax,dword ptr [esi]
 005CAD7F    call        @VarToInteger
 005CAD84    mov         ecx,eax
 005CAD86    mov         edx,ebx
 005CAD88    mov         eax,dword ptr [ebx+5C];TSpVoice.?f5C:dword
 005CAD8B    call        dword ptr [ebx+58];TSpVoice.FOnStartStream
>005CAD8E    jmp         005CAFF9
 005CAD93    cmp         word ptr [ebx+62],0;TSpVoice.?f62:word
>005CAD98    je          005CAFF9
 005CAD9E    mov         eax,dword ptr [esi]
 005CADA0    add         eax,10
 005CADA3    push        eax
 005CADA4    mov         eax,dword ptr [esi]
 005CADA6    call        @VarToInteger
 005CADAB    mov         ecx,eax
 005CADAD    mov         edx,ebx
 005CADAF    mov         eax,dword ptr [ebx+64];TSpVoice.?f64:dword
 005CADB2    call        dword ptr [ebx+60];TSpVoice.FOnEndStream
>005CADB5    jmp         005CAFF9
 005CADBA    cmp         word ptr [ebx+6A],0;TSpVoice.?f6A:word
>005CADBF    je          005CAFF9
 005CADC5    mov         eax,dword ptr [esi]
 005CADC7    add         eax,10
 005CADCA    push        eax
 005CADCB    lea         eax,[ebp-20]
 005CADCE    mov         edx,dword ptr [esi]
 005CADD0    mov         edx,dword ptr [edx+28]
 005CADD3    mov         ecx,5CB030;['{C74A3ADC-B727-4500-A84A-B526721C8B8C}']
 005CADD8    call        @IntfCast
 005CADDD    mov         eax,dword ptr [ebp-20]
 005CADE0    push        eax
 005CADE1    mov         eax,dword ptr [esi]
 005CADE3    call        @VarToInteger
 005CADE8    mov         ecx,eax
 005CADEA    mov         edx,ebx
 005CADEC    mov         eax,dword ptr [ebx+6C];TSpVoice.?f6C:dword
 005CADEF    call        dword ptr [ebx+68];TSpVoice.FOnVoiceChange
>005CADF2    jmp         005CAFF9
 005CADF7    cmp         word ptr [ebx+72],0;TSpVoice.?f72:word
>005CADFC    je          005CAFF9
 005CAE02    mov         eax,dword ptr [esi]
 005CAE04    add         eax,10
 005CAE07    push        eax
 005CAE08    lea         eax,[ebp-24]
 005CAE0B    mov         edx,dword ptr [esi]
 005CAE0D    add         edx,20
 005CAE10    call        @VarToWStr
 005CAE15    mov         eax,dword ptr [ebp-24]
 005CAE18    push        eax
 005CAE19    mov         eax,dword ptr [esi]
 005CAE1B    add         eax,30
 005CAE1E    call        @VarToInteger
 005CAE23    push        eax
 005CAE24    mov         eax,dword ptr [esi]
 005CAE26    call        @VarToInteger
 005CAE2B    mov         ecx,eax
 005CAE2D    mov         edx,ebx
 005CAE2F    mov         eax,dword ptr [ebx+74];TSpVoice.?f74:dword
 005CAE32    call        dword ptr [ebx+70];TSpVoice.FOnBookmark
>005CAE35    jmp         005CAFF9
 005CAE3A    cmp         word ptr [ebx+7A],0;TSpVoice.?f7A:word
>005CAE3F    je          005CAFF9
 005CAE45    mov         eax,dword ptr [esi]
 005CAE47    add         eax,10
 005CAE4A    push        eax
 005CAE4B    mov         eax,dword ptr [esi]
 005CAE4D    add         eax,20
 005CAE50    call        @VarToInteger
 005CAE55    push        eax
 005CAE56    mov         eax,dword ptr [esi]
 005CAE58    add         eax,30
 005CAE5B    call        @VarToInteger
 005CAE60    push        eax
 005CAE61    mov         eax,dword ptr [esi]
 005CAE63    call        @VarToInteger
 005CAE68    mov         ecx,eax
 005CAE6A    mov         edx,ebx
 005CAE6C    mov         eax,dword ptr [ebx+7C];TSpVoice.?f7C:dword
 005CAE6F    call        dword ptr [ebx+78];TSpVoice.FOnWord
>005CAE72    jmp         005CAFF9
 005CAE77    cmp         word ptr [ebx+82],0;TSpVoice.?f82:word
>005CAE7F    je          005CAFF9
 005CAE85    mov         eax,dword ptr [esi]
 005CAE87    add         eax,10
 005CAE8A    push        eax
 005CAE8B    mov         eax,dword ptr [esi]
 005CAE8D    add         eax,20
 005CAE90    call        @VarToInteger
 005CAE95    push        eax
 005CAE96    mov         eax,dword ptr [esi]
 005CAE98    add         eax,30
 005CAE9B    call        @VarToInteger
 005CAEA0    push        eax
 005CAEA1    mov         eax,dword ptr [esi]
 005CAEA3    call        @VarToInteger
 005CAEA8    mov         ecx,eax
 005CAEAA    mov         edx,ebx
 005CAEAC    mov         eax,dword ptr [ebx+84];TSpVoice.?f84:dword
 005CAEB2    call        dword ptr [ebx+80];TSpVoice.FOnSentence
>005CAEB8    jmp         005CAFF9
 005CAEBD    cmp         word ptr [ebx+8A],0;TSpVoice.?f8A:word
>005CAEC5    je          005CAFF9
 005CAECB    mov         eax,dword ptr [esi]
 005CAECD    call        @VarToInteger
 005CAED2    mov         edi,eax
 005CAED4    lea         eax,[ebp-10]
 005CAED7    mov         edx,dword ptr [esi]
 005CAED9    add         edx,10
 005CAEDC    call        @VarCopy
 005CAEE1    mov         eax,dword ptr [esi]
 005CAEE3    add         eax,20
 005CAEE6    call        @VarToInteger
 005CAEEB    mov         dword ptr [ebp-14],eax
 005CAEEE    mov         eax,dword ptr [esi]
 005CAEF0    add         eax,30
 005CAEF3    call        @VarToInteger
 005CAEF8    mov         word ptr [ebp-16],ax
 005CAEFC    mov         eax,dword ptr [esi]
 005CAEFE    add         eax,40
 005CAF01    call        @VarToInt64
 005CAF06    mov         dword ptr [ebp-1C],eax
 005CAF09    mov         eax,dword ptr [esi]
 005CAF0B    add         eax,50
 005CAF0E    call        @VarToInteger
 005CAF13    lea         edx,[ebp-10]
 005CAF16    push        edx
 005CAF17    mov         edx,dword ptr [ebp-14]
 005CAF1A    push        edx
 005CAF1B    movzx       edx,word ptr [ebp-16]
 005CAF1F    push        edx
 005CAF20    mov         edx,dword ptr [ebp-1C]
 005CAF23    push        edx
 005CAF24    push        eax
 005CAF25    mov         ecx,edi
 005CAF27    mov         edx,ebx
 005CAF29    mov         eax,dword ptr [ebx+8C];TSpVoice.?f8C:dword
 005CAF2F    call        dword ptr [ebx+88];TSpVoice.FOnPhoneme
>005CAF35    jmp         005CAFF9
 005CAF3A    cmp         word ptr [ebx+92],0;TSpVoice.?f92:word
>005CAF42    je          005CAFF9
 005CAF48    mov         eax,dword ptr [esi]
 005CAF4A    add         eax,10
 005CAF4D    push        eax
 005CAF4E    mov         eax,dword ptr [esi]
 005CAF50    add         eax,20
 005CAF53    call        @VarToInteger
 005CAF58    push        eax
 005CAF59    mov         eax,dword ptr [esi]
 005CAF5B    add         eax,30
 005CAF5E    call        @VarToInt64
 005CAF63    push        eax
 005CAF64    mov         eax,dword ptr [esi]
 005CAF66    add         eax,40
 005CAF69    call        @VarToInt64
 005CAF6E    push        eax
 005CAF6F    mov         eax,dword ptr [esi]
 005CAF71    add         eax,50
 005CAF74    call        @VarToInt64
 005CAF79    push        eax
 005CAF7A    mov         eax,dword ptr [esi]
 005CAF7C    call        @VarToInteger
 005CAF81    mov         ecx,eax
 005CAF83    mov         edx,ebx
 005CAF85    mov         eax,dword ptr [ebx+94];TSpVoice.?f94:dword
 005CAF8B    call        dword ptr [ebx+90];TSpVoice.FOnViseme
>005CAF91    jmp         005CAFF9
 005CAF93    cmp         word ptr [ebx+9A],0;TSpVoice.?f9A:word
>005CAF9B    je          005CAFF9
 005CAF9D    mov         eax,dword ptr [esi]
 005CAF9F    add         eax,10
 005CAFA2    push        eax
 005CAFA3    mov         eax,dword ptr [esi]
 005CAFA5    add         eax,20
 005CAFA8    call        @VarToInteger
 005CAFAD    push        eax
 005CAFAE    mov         eax,dword ptr [esi]
 005CAFB0    call        @VarToInteger
 005CAFB5    mov         ecx,eax
 005CAFB7    mov         edx,ebx
 005CAFB9    mov         eax,dword ptr [ebx+9C];TSpVoice.?f9C:dword
 005CAFBF    call        dword ptr [ebx+98];TSpVoice.FOnAudioLevel
>005CAFC5    jmp         005CAFF9
 005CAFC7    cmp         word ptr [ebx+0A2],0;TSpVoice.?fA2:word
>005CAFCF    je          005CAFF9
 005CAFD1    mov         eax,dword ptr [esi]
 005CAFD3    add         eax,10
 005CAFD6    call        @VarToInteger
 005CAFDB    push        eax
 005CAFDC    mov         eax,dword ptr [esi]
 005CAFDE    add         eax,20
 005CAFE1    push        eax
 005CAFE2    mov         eax,dword ptr [esi]
 005CAFE4    call        @VarToInteger
 005CAFE9    mov         ecx,eax
 005CAFEB    mov         edx,ebx
 005CAFED    mov         eax,dword ptr [ebx+0A4];TSpVoice.?fA4:dword
 005CAFF3    call        dword ptr [ebx+0A0];TSpVoice.FOnEnginePrivate
 005CAFF9    xor         eax,eax
 005CAFFB    pop         edx
 005CAFFC    pop         ecx
 005CAFFD    pop         ecx
 005CAFFE    mov         dword ptr fs:[eax],edx
 005CB001    push        5CB026
 005CB006    lea         eax,[ebp-24]
 005CB009    call        @WStrClr
 005CB00E    lea         eax,[ebp-20]
 005CB011    call        @IntfClear
 005CB016    lea         eax,[ebp-10]
 005CB019    call        @VarClr
 005CB01E    ret
>005CB01F    jmp         @HandleFinally
>005CB024    jmp         005CB006
 005CB026    pop         edi
 005CB027    pop         esi
 005CB028    pop         ebx
 005CB029    mov         esp,ebp
 005CB02B    pop         ebp
 005CB02C    ret
end;*}

//005CB040
{*procedure sub_005CB040(?:?; ?:?);
begin
 005CB040    push        ebp
 005CB041    mov         ebp,esp
 005CB043    push        0
 005CB045    push        ebx
 005CB046    push        esi
 005CB047    mov         esi,edx
 005CB049    mov         ebx,eax
 005CB04B    xor         eax,eax
 005CB04D    push        ebp
 005CB04E    push        5CB08F
 005CB053    push        dword ptr fs:[eax]
 005CB056    mov         dword ptr fs:[eax],esp
 005CB059    mov         eax,esi
 005CB05B    call        @IntfClear
 005CB060    push        eax
 005CB061    lea         edx,[ebp-4]
 005CB064    mov         eax,ebx
 005CB066    call        005CAC74
 005CB06B    mov         eax,dword ptr [ebp-4]
 005CB06E    push        eax
 005CB06F    mov         eax,dword ptr [eax]
 005CB071    call        dword ptr [eax+1C]
 005CB074    call        @CheckAutoResult
 005CB079    xor         eax,eax
 005CB07B    pop         edx
 005CB07C    pop         ecx
 005CB07D    pop         ecx
 005CB07E    mov         dword ptr fs:[eax],edx
 005CB081    push        5CB096
 005CB086    lea         eax,[ebp-4]
 005CB089    call        @IntfClear
 005CB08E    ret
>005CB08F    jmp         @HandleFinally
>005CB094    jmp         005CB086
 005CB096    pop         esi
 005CB097    pop         ebx
 005CB098    pop         ecx
 005CB099    pop         ebp
 005CB09A    ret
end;*}

//005CB0F8
{*procedure sub_005CB0F8(?:TSpVoice; ?:?);
begin
 005CB0F8    push        ebp
 005CB0F9    mov         ebp,esp
 005CB0FB    xor         ecx,ecx
 005CB0FD    push        ecx
 005CB0FE    push        ecx
 005CB0FF    push        ecx
 005CB100    push        ecx
 005CB101    push        ecx
 005CB102    push        ebx
 005CB103    push        esi
 005CB104    mov         esi,edx
 005CB106    mov         ebx,eax
 005CB108    xor         eax,eax
 005CB10A    push        ebp
 005CB10B    push        5CB15D
 005CB110    push        dword ptr fs:[eax]
 005CB113    mov         dword ptr fs:[eax],esp
 005CB116    lea         edx,[ebp-14]
 005CB119    mov         eax,ebx
 005CB11B    call        005CAC74
 005CB120    mov         edx,dword ptr [ebp-14]
 005CB123    lea         eax,[ebp-10]
 005CB126    call        @VarFromDisp
 005CB12B    push        esi
 005CB12C    push        5CB16C
 005CB131    lea         eax,[ebp-10]
 005CB134    push        eax
 005CB135    push        0
 005CB137    call        @DispInvoke
 005CB13C    add         esp,10
 005CB13F    xor         eax,eax
 005CB141    pop         edx
 005CB142    pop         ecx
 005CB143    pop         ecx
 005CB144    mov         dword ptr fs:[eax],edx
 005CB147    push        5CB164
 005CB14C    lea         eax,[ebp-14]
 005CB14F    call        @IntfClear
 005CB154    lea         eax,[ebp-10]
 005CB157    call        @VarClr
 005CB15C    ret
>005CB15D    jmp         @HandleFinally
>005CB162    jmp         005CB14C
 005CB164    pop         esi
 005CB165    pop         ebx
 005CB166    mov         esp,ebp
 005CB168    pop         ebp
 005CB169    ret
end;*}

//005CB340
{*function sub_005CB340(?:?):?;
begin
 005CB340    push        ebp
 005CB341    mov         ebp,esp
 005CB343    add         esp,0FFFFFFF8
 005CB346    push        ebx
 005CB347    xor         edx,edx
 005CB349    mov         dword ptr [ebp-8],edx
 005CB34C    mov         ebx,eax
 005CB34E    xor         eax,eax
 005CB350    push        ebp
 005CB351    push        5CB391
 005CB356    push        dword ptr fs:[eax]
 005CB359    mov         dword ptr fs:[eax],esp
 005CB35C    lea         eax,[ebp-4]
 005CB35F    push        eax
 005CB360    lea         edx,[ebp-8]
 005CB363    mov         eax,ebx
 005CB365    call        005CAC74
 005CB36A    mov         eax,dword ptr [ebp-8]
 005CB36D    push        eax
 005CB36E    mov         eax,dword ptr [eax]
 005CB370    call        dword ptr [eax+38]
 005CB373    call        @CheckAutoResult
 005CB378    mov         ebx,dword ptr [ebp-4]
 005CB37B    xor         eax,eax
 005CB37D    pop         edx
 005CB37E    pop         ecx
 005CB37F    pop         ecx
 005CB380    mov         dword ptr fs:[eax],edx
 005CB383    push        5CB398
 005CB388    lea         eax,[ebp-8]
 005CB38B    call        @IntfClear
 005CB390    ret
>005CB391    jmp         @HandleFinally
>005CB396    jmp         005CB388
 005CB398    mov         eax,ebx
 005CB39A    pop         ebx
 005CB39B    pop         ecx
 005CB39C    pop         ecx
 005CB39D    pop         ebp
 005CB39E    ret
end;*}

//005CB3F4
{*function sub_005CB3F4(?:?):?;
begin
 005CB3F4    push        ebp
 005CB3F5    mov         ebp,esp
 005CB3F7    add         esp,0FFFFFFF8
 005CB3FA    push        ebx
 005CB3FB    xor         edx,edx
 005CB3FD    mov         dword ptr [ebp-8],edx
 005CB400    mov         ebx,eax
 005CB402    xor         eax,eax
 005CB404    push        ebp
 005CB405    push        5CB445
 005CB40A    push        dword ptr fs:[eax]
 005CB40D    mov         dword ptr fs:[eax],esp
 005CB410    lea         eax,[ebp-4]
 005CB413    push        eax
 005CB414    lea         edx,[ebp-8]
 005CB417    mov         eax,ebx
 005CB419    call        005CAC74
 005CB41E    mov         eax,dword ptr [ebp-8]
 005CB421    push        eax
 005CB422    mov         eax,dword ptr [eax]
 005CB424    call        dword ptr [eax+40]
 005CB427    call        @CheckAutoResult
 005CB42C    mov         ebx,dword ptr [ebp-4]
 005CB42F    xor         eax,eax
 005CB431    pop         edx
 005CB432    pop         ecx
 005CB433    pop         ecx
 005CB434    mov         dword ptr fs:[eax],edx
 005CB437    push        5CB44C
 005CB43C    lea         eax,[ebp-8]
 005CB43F    call        @IntfClear
 005CB444    ret
>005CB445    jmp         @HandleFinally
>005CB44A    jmp         005CB43C
 005CB44C    mov         eax,ebx
 005CB44E    pop         ebx
 005CB44F    pop         ecx
 005CB450    pop         ecx
 005CB451    pop         ebp
 005CB452    ret
end;*}

//005CB82C
function TSpVoice.Speak(Text:WideString; Flags:TOleEnum):Integer;
begin
{*
 005CB82C    push        ebp
 005CB82D    mov         ebp,esp
 005CB82F    add         esp,0FFFFFFF8
 005CB832    push        ebx
 005CB833    push        esi
 005CB834    push        edi
 005CB835    xor         ebx,ebx
 005CB837    mov         dword ptr [ebp-8],ebx
 005CB83A    mov         edi,ecx
 005CB83C    mov         esi,edx
 005CB83E    mov         ebx,eax
 005CB840    xor         eax,eax
 005CB842    push        ebp
 005CB843    push        5CB885
 005CB848    push        dword ptr fs:[eax]
 005CB84B    mov         dword ptr fs:[eax],esp
 005CB84E    lea         eax,[ebp-4]
 005CB851    push        eax
 005CB852    push        edi
 005CB853    push        esi
 005CB854    lea         edx,[ebp-8]
 005CB857    mov         eax,ebx
 005CB859    call        005CAC74
 005CB85E    mov         eax,dword ptr [ebp-8]
 005CB861    push        eax
 005CB862    mov         eax,dword ptr [eax]
 005CB864    call        dword ptr [eax+70]
 005CB867    call        @CheckAutoResult
 005CB86C    mov         ebx,dword ptr [ebp-4]
 005CB86F    xor         eax,eax
 005CB871    pop         edx
 005CB872    pop         ecx
 005CB873    pop         ecx
 005CB874    mov         dword ptr fs:[eax],edx
 005CB877    push        5CB88C
 005CB87C    lea         eax,[ebp-8]
 005CB87F    call        @IntfClear
 005CB884    ret
>005CB885    jmp         @HandleFinally
>005CB88A    jmp         005CB87C
 005CB88C    mov         eax,ebx
 005CB88E    pop         edi
 005CB88F    pop         esi
 005CB890    pop         ebx
 005CB891    pop         ecx
 005CB892    pop         ecx
 005CB893    pop         ebp
 005CB894    ret
*}
end;

//005CB898
function TSpVoice.SpeakStream(Stream:ISpeechBaseStream; Flags:TOleEnum):Integer;
begin
{*
 005CB898    push        ebp
 005CB899    mov         ebp,esp
 005CB89B    add         esp,0FFFFFFF8
 005CB89E    push        ebx
 005CB89F    push        esi
 005CB8A0    push        edi
 005CB8A1    xor         ebx,ebx
 005CB8A3    mov         dword ptr [ebp-8],ebx
 005CB8A6    mov         edi,ecx
 005CB8A8    mov         esi,edx
 005CB8AA    mov         ebx,eax
 005CB8AC    xor         eax,eax
 005CB8AE    push        ebp
 005CB8AF    push        5CB8F1
 005CB8B4    push        dword ptr fs:[eax]
 005CB8B7    mov         dword ptr fs:[eax],esp
 005CB8BA    lea         eax,[ebp-4]
 005CB8BD    push        eax
 005CB8BE    push        edi
 005CB8BF    push        esi
 005CB8C0    lea         edx,[ebp-8]
 005CB8C3    mov         eax,ebx
 005CB8C5    call        005CAC74
 005CB8CA    mov         eax,dword ptr [ebp-8]
 005CB8CD    push        eax
 005CB8CE    mov         eax,dword ptr [eax]
 005CB8D0    call        dword ptr [eax+74]
 005CB8D3    call        @CheckAutoResult
 005CB8D8    mov         ebx,dword ptr [ebp-4]
 005CB8DB    xor         eax,eax
 005CB8DD    pop         edx
 005CB8DE    pop         ecx
 005CB8DF    pop         ecx
 005CB8E0    mov         dword ptr fs:[eax],edx
 005CB8E3    push        5CB8F8
 005CB8E8    lea         eax,[ebp-8]
 005CB8EB    call        @IntfClear
 005CB8F0    ret
>005CB8F1    jmp         @HandleFinally
>005CB8F6    jmp         005CB8E8
 005CB8F8    mov         eax,ebx
 005CB8FA    pop         edi
 005CB8FB    pop         esi
 005CB8FC    pop         ebx
 005CB8FD    pop         ecx
 005CB8FE    pop         ecx
 005CB8FF    pop         ebp
 005CB900    ret
*}
end;

//005CB904
procedure TSpVoice.Pause;
begin
{*
 005CB904    push        ebp
 005CB905    mov         ebp,esp
 005CB907    push        0
 005CB909    push        ebx
 005CB90A    mov         ebx,eax
 005CB90C    xor         eax,eax
 005CB90E    push        ebp
 005CB90F    push        5CB948
 005CB914    push        dword ptr fs:[eax]
 005CB917    mov         dword ptr fs:[eax],esp
 005CB91A    lea         edx,[ebp-4]
 005CB91D    mov         eax,ebx
 005CB91F    call        005CAC74
 005CB924    mov         eax,dword ptr [ebp-4]
 005CB927    push        eax
 005CB928    mov         eax,dword ptr [eax]
 005CB92A    call        dword ptr [eax+78]
 005CB92D    call        @CheckAutoResult
 005CB932    xor         eax,eax
 005CB934    pop         edx
 005CB935    pop         ecx
 005CB936    pop         ecx
 005CB937    mov         dword ptr fs:[eax],edx
 005CB93A    push        5CB94F
 005CB93F    lea         eax,[ebp-4]
 005CB942    call        @IntfClear
 005CB947    ret
>005CB948    jmp         @HandleFinally
>005CB94D    jmp         005CB93F
 005CB94F    pop         ebx
 005CB950    pop         ecx
 005CB951    pop         ebp
 005CB952    ret
*}
end;

//005CB954
procedure TSpVoice.Resume;
begin
{*
 005CB954    push        ebp
 005CB955    mov         ebp,esp
 005CB957    push        0
 005CB959    push        ebx
 005CB95A    mov         ebx,eax
 005CB95C    xor         eax,eax
 005CB95E    push        ebp
 005CB95F    push        5CB998
 005CB964    push        dword ptr fs:[eax]
 005CB967    mov         dword ptr fs:[eax],esp
 005CB96A    lea         edx,[ebp-4]
 005CB96D    mov         eax,ebx
 005CB96F    call        005CAC74
 005CB974    mov         eax,dword ptr [ebp-4]
 005CB977    push        eax
 005CB978    mov         eax,dword ptr [eax]
 005CB97A    call        dword ptr [eax+7C]
 005CB97D    call        @CheckAutoResult
 005CB982    xor         eax,eax
 005CB984    pop         edx
 005CB985    pop         ecx
 005CB986    pop         ecx
 005CB987    mov         dword ptr fs:[eax],edx
 005CB98A    push        5CB99F
 005CB98F    lea         eax,[ebp-4]
 005CB992    call        @IntfClear
 005CB997    ret
>005CB998    jmp         @HandleFinally
>005CB99D    jmp         005CB98F
 005CB99F    pop         ebx
 005CB9A0    pop         ecx
 005CB9A1    pop         ebp
 005CB9A2    ret
*}
end;

//005CB9A4
function TSpVoice.Skip(Type_:WideString; NumItems:Integer):Integer;
begin
{*
 005CB9A4    push        ebp
 005CB9A5    mov         ebp,esp
 005CB9A7    add         esp,0FFFFFFF8
 005CB9AA    push        ebx
 005CB9AB    push        esi
 005CB9AC    push        edi
 005CB9AD    xor         ebx,ebx
 005CB9AF    mov         dword ptr [ebp-8],ebx
 005CB9B2    mov         edi,ecx
 005CB9B4    mov         esi,edx
 005CB9B6    mov         ebx,eax
 005CB9B8    xor         eax,eax
 005CB9BA    push        ebp
 005CB9BB    push        5CBA00
 005CB9C0    push        dword ptr fs:[eax]
 005CB9C3    mov         dword ptr fs:[eax],esp
 005CB9C6    lea         eax,[ebp-4]
 005CB9C9    push        eax
 005CB9CA    push        edi
 005CB9CB    push        esi
 005CB9CC    lea         edx,[ebp-8]
 005CB9CF    mov         eax,ebx
 005CB9D1    call        005CAC74
 005CB9D6    mov         eax,dword ptr [ebp-8]
 005CB9D9    push        eax
 005CB9DA    mov         eax,dword ptr [eax]
 005CB9DC    call        dword ptr [eax+80]
 005CB9E2    call        @CheckAutoResult
 005CB9E7    mov         ebx,dword ptr [ebp-4]
 005CB9EA    xor         eax,eax
 005CB9EC    pop         edx
 005CB9ED    pop         ecx
 005CB9EE    pop         ecx
 005CB9EF    mov         dword ptr fs:[eax],edx
 005CB9F2    push        5CBA07
 005CB9F7    lea         eax,[ebp-8]
 005CB9FA    call        @IntfClear
 005CB9FF    ret
>005CBA00    jmp         @HandleFinally
>005CBA05    jmp         005CB9F7
 005CBA07    mov         eax,ebx
 005CBA09    pop         edi
 005CBA0A    pop         esi
 005CBA0B    pop         ebx
 005CBA0C    pop         ecx
 005CBA0D    pop         ecx
 005CBA0E    pop         ebp
 005CBA0F    ret
*}
end;

//005CBA10
{*procedure TSpVoice.GetVoices(RequiredAttributes:WideString; OptionalAttributes:WideString; ?:?);
begin
 005CBA10    push        ebp
 005CBA11    mov         ebp,esp
 005CBA13    push        0
 005CBA15    push        ebx
 005CBA16    push        esi
 005CBA17    push        edi
 005CBA18    mov         edi,ecx
 005CBA1A    mov         esi,edx
 005CBA1C    mov         ebx,eax
 005CBA1E    xor         eax,eax
 005CBA20    push        ebp
 005CBA21    push        5CBA68
 005CBA26    push        dword ptr fs:[eax]
 005CBA29    mov         dword ptr fs:[eax],esp
 005CBA2C    mov         eax,dword ptr [ebp+8]
 005CBA2F    call        @IntfClear
 005CBA34    push        eax
 005CBA35    push        edi
 005CBA36    push        esi
 005CBA37    lea         edx,[ebp-4]
 005CBA3A    mov         eax,ebx
 005CBA3C    call        005CAC74
 005CBA41    mov         eax,dword ptr [ebp-4]
 005CBA44    push        eax
 005CBA45    mov         eax,dword ptr [eax]
 005CBA47    call        dword ptr [eax+84]
 005CBA4D    call        @CheckAutoResult
 005CBA52    xor         eax,eax
 005CBA54    pop         edx
 005CBA55    pop         ecx
 005CBA56    pop         ecx
 005CBA57    mov         dword ptr fs:[eax],edx
 005CBA5A    push        5CBA6F
 005CBA5F    lea         eax,[ebp-4]
 005CBA62    call        @IntfClear
 005CBA67    ret
>005CBA68    jmp         @HandleFinally
>005CBA6D    jmp         005CBA5F
 005CBA6F    pop         edi
 005CBA70    pop         esi
 005CBA71    pop         ebx
 005CBA72    pop         ecx
 005CBA73    pop         ebp
 005CBA74    ret         4
end;*}

//005CBA78
{*procedure TSpVoice.GetAudioOutputs(RequiredAttributes:WideString; OptionalAttributes:WideString; ?:?);
begin
 005CBA78    push        ebp
 005CBA79    mov         ebp,esp
 005CBA7B    push        0
 005CBA7D    push        ebx
 005CBA7E    push        esi
 005CBA7F    push        edi
 005CBA80    mov         edi,ecx
 005CBA82    mov         esi,edx
 005CBA84    mov         ebx,eax
 005CBA86    xor         eax,eax
 005CBA88    push        ebp
 005CBA89    push        5CBAD0
 005CBA8E    push        dword ptr fs:[eax]
 005CBA91    mov         dword ptr fs:[eax],esp
 005CBA94    mov         eax,dword ptr [ebp+8]
 005CBA97    call        @IntfClear
 005CBA9C    push        eax
 005CBA9D    push        edi
 005CBA9E    push        esi
 005CBA9F    lea         edx,[ebp-4]
 005CBAA2    mov         eax,ebx
 005CBAA4    call        005CAC74
 005CBAA9    mov         eax,dword ptr [ebp-4]
 005CBAAC    push        eax
 005CBAAD    mov         eax,dword ptr [eax]
 005CBAAF    call        dword ptr [eax+88]
 005CBAB5    call        @CheckAutoResult
 005CBABA    xor         eax,eax
 005CBABC    pop         edx
 005CBABD    pop         ecx
 005CBABE    pop         ecx
 005CBABF    mov         dword ptr fs:[eax],edx
 005CBAC2    push        5CBAD7
 005CBAC7    lea         eax,[ebp-4]
 005CBACA    call        @IntfClear
 005CBACF    ret
>005CBAD0    jmp         @HandleFinally
>005CBAD5    jmp         005CBAC7
 005CBAD7    pop         edi
 005CBAD8    pop         esi
 005CBAD9    pop         ebx
 005CBADA    pop         ecx
 005CBADB    pop         ebp
 005CBADC    ret         4
end;*}

//005CBAE0
function TSpVoice.WaitUntilDone(msTimeout:Integer):WordBool;
begin
{*
 005CBAE0    push        ebp
 005CBAE1    mov         ebp,esp
 005CBAE3    add         esp,0FFFFFFF8
 005CBAE6    push        ebx
 005CBAE7    push        esi
 005CBAE8    xor         ecx,ecx
 005CBAEA    mov         dword ptr [ebp-8],ecx
 005CBAED    mov         esi,edx
 005CBAEF    mov         ebx,eax
 005CBAF1    xor         eax,eax
 005CBAF3    push        ebp
 005CBAF4    push        5CBB39
 005CBAF9    push        dword ptr fs:[eax]
 005CBAFC    mov         dword ptr fs:[eax],esp
 005CBAFF    lea         eax,[ebp-4]
 005CBB02    push        eax
 005CBB03    push        esi
 005CBB04    lea         edx,[ebp-8]
 005CBB07    mov         eax,ebx
 005CBB09    call        005CAC74
 005CBB0E    mov         eax,dword ptr [ebp-8]
 005CBB11    push        eax
 005CBB12    mov         eax,dword ptr [eax]
 005CBB14    call        dword ptr [eax+8C]
 005CBB1A    call        @CheckAutoResult
 005CBB1F    movzx       ebx,word ptr [ebp-4]
 005CBB23    xor         eax,eax
 005CBB25    pop         edx
 005CBB26    pop         ecx
 005CBB27    pop         ecx
 005CBB28    mov         dword ptr fs:[eax],edx
 005CBB2B    push        5CBB40
 005CBB30    lea         eax,[ebp-8]
 005CBB33    call        @IntfClear
 005CBB38    ret
>005CBB39    jmp         @HandleFinally
>005CBB3E    jmp         005CBB30
 005CBB40    mov         eax,ebx
 005CBB42    pop         esi
 005CBB43    pop         ebx
 005CBB44    pop         ecx
 005CBB45    pop         ecx
 005CBB46    pop         ebp
 005CBB47    ret
*}
end;

//005CBB48
function TSpVoice.SpeakCompleteEvent:Integer;
begin
{*
 005CBB48    push        ebp
 005CBB49    mov         ebp,esp
 005CBB4B    add         esp,0FFFFFFF8
 005CBB4E    push        ebx
 005CBB4F    xor         edx,edx
 005CBB51    mov         dword ptr [ebp-8],edx
 005CBB54    mov         ebx,eax
 005CBB56    xor         eax,eax
 005CBB58    push        ebp
 005CBB59    push        5CBB9C
 005CBB5E    push        dword ptr fs:[eax]
 005CBB61    mov         dword ptr fs:[eax],esp
 005CBB64    lea         eax,[ebp-4]
 005CBB67    push        eax
 005CBB68    lea         edx,[ebp-8]
 005CBB6B    mov         eax,ebx
 005CBB6D    call        005CAC74
 005CBB72    mov         eax,dword ptr [ebp-8]
 005CBB75    push        eax
 005CBB76    mov         eax,dword ptr [eax]
 005CBB78    call        dword ptr [eax+90]
 005CBB7E    call        @CheckAutoResult
 005CBB83    mov         ebx,dword ptr [ebp-4]
 005CBB86    xor         eax,eax
 005CBB88    pop         edx
 005CBB89    pop         ecx
 005CBB8A    pop         ecx
 005CBB8B    mov         dword ptr fs:[eax],edx
 005CBB8E    push        5CBBA3
 005CBB93    lea         eax,[ebp-8]
 005CBB96    call        @IntfClear
 005CBB9B    ret
>005CBB9C    jmp         @HandleFinally
>005CBBA1    jmp         005CBB93
 005CBBA3    mov         eax,ebx
 005CBBA5    pop         ebx
 005CBBA6    pop         ecx
 005CBBA7    pop         ecx
 005CBBA8    pop         ebp
 005CBBA9    ret
*}
end;

//005CBBAC
function TSpVoice.IsUISupported(TypeOfUI:WideString):WordBool;
begin
{*
 005CBBAC    push        ebp
 005CBBAD    mov         ebp,esp
 005CBBAF    add         esp,0FFFFFFF8
 005CBBB2    push        ebx
 005CBBB3    push        esi
 005CBBB4    xor         ecx,ecx
 005CBBB6    mov         dword ptr [ebp-8],ecx
 005CBBB9    mov         esi,edx
 005CBBBB    mov         ebx,eax
 005CBBBD    xor         eax,eax
 005CBBBF    push        ebp
 005CBBC0    push        5CBC0B
 005CBBC5    push        dword ptr fs:[eax]
 005CBBC8    mov         dword ptr fs:[eax],esp
 005CBBCB    lea         eax,[ebp-4]
 005CBBCE    push        eax
 005CBBCF    mov         eax,[0078CDF8];^gvar_00792F78
 005CBBD4    push        eax
 005CBBD5    push        esi
 005CBBD6    lea         edx,[ebp-8]
 005CBBD9    mov         eax,ebx
 005CBBDB    call        005CAC74
 005CBBE0    mov         eax,dword ptr [ebp-8]
 005CBBE3    push        eax
 005CBBE4    mov         eax,dword ptr [eax]
 005CBBE6    call        dword ptr [eax+94]
 005CBBEC    call        @CheckAutoResult
 005CBBF1    movzx       ebx,word ptr [ebp-4]
 005CBBF5    xor         eax,eax
 005CBBF7    pop         edx
 005CBBF8    pop         ecx
 005CBBF9    pop         ecx
 005CBBFA    mov         dword ptr fs:[eax],edx
 005CBBFD    push        5CBC12
 005CBC02    lea         eax,[ebp-8]
 005CBC05    call        @IntfClear
 005CBC0A    ret
>005CBC0B    jmp         @HandleFinally
>005CBC10    jmp         005CBC02
 005CBC12    mov         eax,ebx
 005CBC14    pop         esi
 005CBC15    pop         ebx
 005CBC16    pop         ecx
 005CBC17    pop         ecx
 005CBC18    pop         ebp
 005CBC19    ret
*}
end;

//005CBC1C
function TSpVoice.IsUISupported(TypeOfUI:WideString; var ExtraData:OleVariant):WordBool;
begin
{*
 005CBC1C    push        ebp
 005CBC1D    mov         ebp,esp
 005CBC1F    add         esp,0FFFFFFF8
 005CBC22    push        ebx
 005CBC23    push        esi
 005CBC24    push        edi
 005CBC25    xor         ebx,ebx
 005CBC27    mov         dword ptr [ebp-8],ebx
 005CBC2A    mov         edi,ecx
 005CBC2C    mov         esi,edx
 005CBC2E    mov         ebx,eax
 005CBC30    xor         eax,eax
 005CBC32    push        ebp
 005CBC33    push        5CBC79
 005CBC38    push        dword ptr fs:[eax]
 005CBC3B    mov         dword ptr fs:[eax],esp
 005CBC3E    lea         eax,[ebp-4]
 005CBC41    push        eax
 005CBC42    push        edi
 005CBC43    push        esi
 005CBC44    lea         edx,[ebp-8]
 005CBC47    mov         eax,ebx
 005CBC49    call        005CAC74
 005CBC4E    mov         eax,dword ptr [ebp-8]
 005CBC51    push        eax
 005CBC52    mov         eax,dword ptr [eax]
 005CBC54    call        dword ptr [eax+94]
 005CBC5A    call        @CheckAutoResult
 005CBC5F    movzx       ebx,word ptr [ebp-4]
 005CBC63    xor         eax,eax
 005CBC65    pop         edx
 005CBC66    pop         ecx
 005CBC67    pop         ecx
 005CBC68    mov         dword ptr fs:[eax],edx
 005CBC6B    push        5CBC80
 005CBC70    lea         eax,[ebp-8]
 005CBC73    call        @IntfClear
 005CBC78    ret
>005CBC79    jmp         @HandleFinally
>005CBC7E    jmp         005CBC70
 005CBC80    mov         eax,ebx
 005CBC82    pop         edi
 005CBC83    pop         esi
 005CBC84    pop         ebx
 005CBC85    pop         ecx
 005CBC86    pop         ecx
 005CBC87    pop         ebp
 005CBC88    ret
*}
end;

//005CBC8C
procedure TSpVoice.DisplayUI(hWndParent:Integer; Title:WideString; TypeOfUI:WideString);
begin
{*
 005CBC8C    push        ebp
 005CBC8D    mov         ebp,esp
 005CBC8F    push        0
 005CBC91    push        ebx
 005CBC92    push        esi
 005CBC93    push        edi
 005CBC94    mov         edi,ecx
 005CBC96    mov         esi,edx
 005CBC98    mov         ebx,eax
 005CBC9A    xor         eax,eax
 005CBC9C    push        ebp
 005CBC9D    push        5CBCE5
 005CBCA2    push        dword ptr fs:[eax]
 005CBCA5    mov         dword ptr fs:[eax],esp
 005CBCA8    mov         eax,[0078CDF8];^gvar_00792F78
 005CBCAD    push        eax
 005CBCAE    mov         eax,dword ptr [ebp+8]
 005CBCB1    push        eax
 005CBCB2    push        edi
 005CBCB3    push        esi
 005CBCB4    lea         edx,[ebp-4]
 005CBCB7    mov         eax,ebx
 005CBCB9    call        005CAC74
 005CBCBE    mov         eax,dword ptr [ebp-4]
 005CBCC1    push        eax
 005CBCC2    mov         eax,dword ptr [eax]
 005CBCC4    call        dword ptr [eax+98]
 005CBCCA    call        @CheckAutoResult
 005CBCCF    xor         eax,eax
 005CBCD1    pop         edx
 005CBCD2    pop         ecx
 005CBCD3    pop         ecx
 005CBCD4    mov         dword ptr fs:[eax],edx
 005CBCD7    push        5CBCEC
 005CBCDC    lea         eax,[ebp-4]
 005CBCDF    call        @IntfClear
 005CBCE4    ret
>005CBCE5    jmp         @HandleFinally
>005CBCEA    jmp         005CBCDC
 005CBCEC    pop         edi
 005CBCED    pop         esi
 005CBCEE    pop         ebx
 005CBCEF    pop         ecx
 005CBCF0    pop         ebp
 005CBCF1    ret         4
*}
end;

//005CBCF4
procedure TSpVoice.DisplayUI(hWndParent:Integer; Title:WideString; var ExtraData:OleVariant; TypeOfUI:WideString);
begin
{*
 005CBCF4    push        ebp
 005CBCF5    mov         ebp,esp
 005CBCF7    push        0
 005CBCF9    push        ebx
 005CBCFA    push        esi
 005CBCFB    push        edi
 005CBCFC    mov         edi,ecx
 005CBCFE    mov         esi,edx
 005CBD00    mov         ebx,eax
 005CBD02    xor         eax,eax
 005CBD04    push        ebp
 005CBD05    push        5CBD4B
 005CBD0A    push        dword ptr fs:[eax]
 005CBD0D    mov         dword ptr fs:[eax],esp
 005CBD10    mov         eax,dword ptr [ebp+8]
 005CBD13    push        eax
 005CBD14    mov         eax,dword ptr [ebp+0C]
 005CBD17    push        eax
 005CBD18    push        edi
 005CBD19    push        esi
 005CBD1A    lea         edx,[ebp-4]
 005CBD1D    mov         eax,ebx
 005CBD1F    call        005CAC74
 005CBD24    mov         eax,dword ptr [ebp-4]
 005CBD27    push        eax
 005CBD28    mov         eax,dword ptr [eax]
 005CBD2A    call        dword ptr [eax+98]
 005CBD30    call        @CheckAutoResult
 005CBD35    xor         eax,eax
 005CBD37    pop         edx
 005CBD38    pop         ecx
 005CBD39    pop         ecx
 005CBD3A    mov         dword ptr fs:[eax],edx
 005CBD3D    push        5CBD52
 005CBD42    lea         eax,[ebp-4]
 005CBD45    call        @IntfClear
 005CBD4A    ret
>005CBD4B    jmp         @HandleFinally
>005CBD50    jmp         005CBD42
 005CBD52    pop         edi
 005CBD53    pop         esi
 005CBD54    pop         ebx
 005CBD55    pop         ecx
 005CBD56    pop         ebp
 005CBD57    ret         8
*}
end;

//005CBD5C
procedure sub_005CBD5C;
begin
{*
 005CBD5C    mov         edx,789FBC
 005CBD61    mov         dword ptr [eax+34],edx;TSpSharedRecoContext.FServerData:PServerData
 005CBD64    ret
*}
end;

//005CBD68
procedure TSpSharedRecoContext.Connect;
begin
{*
 005CBD68    push        ebp
 005CBD69    mov         ebp,esp
 005CBD6B    push        0
 005CBD6D    push        ebx
 005CBD6E    mov         ebx,eax
 005CBD70    xor         eax,eax
 005CBD72    push        ebp
 005CBD73    push        5CBDC4
 005CBD78    push        dword ptr fs:[eax]
 005CBD7B    mov         dword ptr fs:[eax],esp
 005CBD7E    cmp         dword ptr [ebx+0E8],0;TSpSharedRecoContext.FIntf:ISpeechRecoContext
>005CBD85    jne         005CBDAE
 005CBD87    lea         edx,[ebp-4]
 005CBD8A    mov         eax,ebx
 005CBD8C    mov         ecx,dword ptr [eax]
 005CBD8E    call        dword ptr [ecx+38];TOleServer.GetServer
 005CBD91    mov         edx,dword ptr [ebp-4]
 005CBD94    mov         eax,ebx
 005CBD96    call        TOleServer.ConnectEvents
 005CBD9B    lea         eax,[ebx+0E8];TSpSharedRecoContext.FIntf:ISpeechRecoContext
 005CBDA1    mov         edx,dword ptr [ebp-4]
 005CBDA4    mov         ecx,5CBDD0;['{580AA49D-7E1E-4809-B8E2-57DA806104B8}']
 005CBDA9    call        @IntfCast
 005CBDAE    xor         eax,eax
 005CBDB0    pop         edx
 005CBDB1    pop         ecx
 005CBDB2    pop         ecx
 005CBDB3    mov         dword ptr fs:[eax],edx
 005CBDB6    push        5CBDCB
 005CBDBB    lea         eax,[ebp-4]
 005CBDBE    call        @IntfClear
 005CBDC3    ret
>005CBDC4    jmp         @HandleFinally
>005CBDC9    jmp         005CBDBB
 005CBDCB    pop         ebx
 005CBDCC    pop         ecx
 005CBDCD    pop         ebp
 005CBDCE    ret
*}
end;

//005CBDE0
procedure TSpSharedRecoContext.ConnectTo(svrIntf:ISpeechRecoContext);
begin
{*
 005CBDE0    push        ebp
 005CBDE1    mov         ebp,esp
 005CBDE3    push        ecx
 005CBDE4    push        ebx
 005CBDE5    mov         dword ptr [ebp-4],edx
 005CBDE8    mov         ebx,eax
 005CBDEA    mov         eax,dword ptr [ebp-4]
 005CBDED    call        @IntfAddRef
 005CBDF2    xor         eax,eax
 005CBDF4    push        ebp
 005CBDF5    push        5CBE38
 005CBDFA    push        dword ptr fs:[eax]
 005CBDFD    mov         dword ptr fs:[eax],esp
 005CBE00    mov         eax,ebx
 005CBE02    mov         edx,dword ptr [eax]
 005CBE04    call        dword ptr [edx+44];TSpSharedRecoContext.Disconnect
 005CBE07    lea         eax,[ebx+0E8];TSpSharedRecoContext.FIntf:ISpeechRecoContext
 005CBE0D    mov         edx,dword ptr [ebp-4]
 005CBE10    call        @IntfCopy
 005CBE15    mov         edx,dword ptr [ebx+0E8];TSpSharedRecoContext.FIntf:ISpeechRecoContext
 005CBE1B    mov         eax,ebx
 005CBE1D    call        TOleServer.ConnectEvents
 005CBE22    xor         eax,eax
 005CBE24    pop         edx
 005CBE25    pop         ecx
 005CBE26    pop         ecx
 005CBE27    mov         dword ptr fs:[eax],edx
 005CBE2A    push        5CBE3F
 005CBE2F    lea         eax,[ebp-4]
 005CBE32    call        @IntfClear
 005CBE37    ret
>005CBE38    jmp         @HandleFinally
>005CBE3D    jmp         005CBE2F
 005CBE3F    pop         ebx
 005CBE40    pop         ecx
 005CBE41    pop         ebp
 005CBE42    ret
*}
end;

//005CBE44
procedure TSpSharedRecoContext.Disconnect;
begin
{*
 005CBE44    push        ebx
 005CBE45    mov         ebx,eax
 005CBE47    cmp         dword ptr [ebx+0E8],0;TSpSharedRecoContext.FIntf:ISpeechRecoContext
>005CBE4E    je          005CBE68
 005CBE50    mov         edx,dword ptr [ebx+0E8];TSpSharedRecoContext.FIntf:ISpeechRecoContext
 005CBE56    mov         eax,ebx
 005CBE58    call        TOleServer.DisconnectEvents
 005CBE5D    lea         eax,[ebx+0E8];TSpSharedRecoContext.FIntf:ISpeechRecoContext
 005CBE63    call        @IntfClear
 005CBE68    pop         ebx
 005CBE69    ret
*}
end;

//005CBE6C
{*procedure sub_005CBE6C(?:TSpSharedRecoContext; ?:?);
begin
 005CBE6C    push        ebx
 005CBE6D    push        esi
 005CBE6E    mov         esi,edx
 005CBE70    mov         ebx,eax
 005CBE72    cmp         dword ptr [ebx+0E8],0
>005CBE79    jne         005CBE82
 005CBE7B    mov         eax,ebx
 005CBE7D    mov         edx,dword ptr [eax]
 005CBE7F    call        dword ptr [edx+40]
 005CBE82    mov         eax,esi
 005CBE84    mov         edx,dword ptr [ebx+0E8]
 005CBE8A    call        @IntfCopy
 005CBE8F    pop         esi
 005CBE90    pop         ebx
 005CBE91    ret
end;*}

//005CBE94
constructor TSpSharedRecoContext.Create(AOwner:TComponent);
begin
{*
 005CBE94    push        ebx
 005CBE95    push        esi
 005CBE96    test        dl,dl
>005CBE98    je          005CBEA2
 005CBE9A    add         esp,0FFFFFFF0
 005CBE9D    call        @ClassCreate
 005CBEA2    mov         ebx,edx
 005CBEA4    mov         esi,eax
 005CBEA6    xor         edx,edx
 005CBEA8    mov         eax,esi
 005CBEAA    call        TOleServer.Create
 005CBEAF    mov         eax,esi
 005CBEB1    test        bl,bl
>005CBEB3    je          005CBEC4
 005CBEB5    call        @AfterConstruction
 005CBEBA    pop         dword ptr fs:[0]
 005CBEC1    add         esp,0C
 005CBEC4    mov         eax,esi
 005CBEC6    pop         esi
 005CBEC7    pop         ebx
 005CBEC8    ret
*}
end;

//005CBECC
destructor TSpSharedRecoContext.Destroy();
begin
{*
 005CBECC    push        ebx
 005CBECD    push        esi
 005CBECE    call        @BeforeDestruction
 005CBED3    mov         ebx,edx
 005CBED5    mov         esi,eax
 005CBED7    mov         edx,ebx
 005CBED9    and         dl,0FC
 005CBEDC    mov         eax,esi
 005CBEDE    call        TOleServer.Destroy
 005CBEE3    test        bl,bl
>005CBEE5    jle         005CBEEE
 005CBEE7    mov         eax,esi
 005CBEE9    call        @ClassDestroy
 005CBEEE    pop         esi
 005CBEEF    pop         ebx
 005CBEF0    ret
*}
end;

//005CBEF4
{*procedure sub_005CBEF4(?:?; ?:?);
begin
 005CBEF4    push        ebp
 005CBEF5    mov         ebp,esp
 005CBEF7    push        0
 005CBEF9    push        0
 005CBEFB    push        0
 005CBEFD    push        0
 005CBEFF    push        0
 005CBF01    push        0
 005CBF03    push        0
 005CBF05    push        ebx
 005CBF06    push        esi
 005CBF07    mov         esi,ecx
 005CBF09    mov         ebx,eax
 005CBF0B    xor         eax,eax
 005CBF0D    push        ebp
 005CBF0E    push        5CC3BC
 005CBF13    push        dword ptr fs:[eax]
 005CBF16    mov         dword ptr fs:[eax],esp
 005CBF19    inc         edx
 005CBF1A    cmp         edx,13
>005CBF1D    ja          005CC37E
 005CBF23    jmp         dword ptr [edx*4+5CBF2A]
 005CBF23    dd          005CC37E
 005CBF23    dd          005CC37E
 005CBF23    dd          005CBF7F
 005CBF23    dd          005CBFA6
 005CBF23    dd          005CBFD8
 005CBF23    dd          005CC010
 005CBF23    dd          005CC037
 005CBF23    dd          005CC05E
 005CBF23    dd          005CC08E
 005CBF23    dd          005CC0DF
 005CBF23    dd          005CC125
 005CBF23    dd          005CC171
 005CBF23    dd          005CC1C3
 005CBF23    dd          005CC209
 005CBF23    dd          005CC244
 005CBF23    dd          005CC285
 005CBF23    dd          005CC2C0
 005CBF23    dd          005CC2F0
 005CBF23    dd          005CC31D
 005CBF23    dd          005CC351
>005CBF7A    jmp         005CC37E
 005CBF7F    cmp         word ptr [ebx+5A],0;TSpSharedRecoContext.?f5A:word
>005CBF84    je          005CC37E
 005CBF8A    mov         eax,dword ptr [esi]
 005CBF8C    add         eax,10
 005CBF8F    push        eax
 005CBF90    mov         eax,dword ptr [esi]
 005CBF92    call        @VarToInteger
 005CBF97    mov         ecx,eax
 005CBF99    mov         edx,ebx
 005CBF9B    mov         eax,dword ptr [ebx+5C];TSpSharedRecoContext.?f5C:TSpeechRecogniser
 005CBF9E    call        dword ptr [ebx+58];TSpSharedRecoContext.FOnStartStream
>005CBFA1    jmp         005CC37E
 005CBFA6    cmp         word ptr [ebx+62],0;TSpSharedRecoContext.?f62:word
>005CBFAB    je          005CC37E
 005CBFB1    mov         eax,dword ptr [esi]
 005CBFB3    add         eax,10
 005CBFB6    push        eax
 005CBFB7    mov         eax,dword ptr [esi]
 005CBFB9    add         eax,20
 005CBFBC    call        @VarToBool
 005CBFC1    push        eax
 005CBFC2    mov         eax,dword ptr [esi]
 005CBFC4    call        @VarToInteger
 005CBFC9    mov         ecx,eax
 005CBFCB    mov         edx,ebx
 005CBFCD    mov         eax,dword ptr [ebx+64];TSpSharedRecoContext.?f64:TSpeechRecogniser
 005CBFD0    call        dword ptr [ebx+60];TSpSharedRecoContext.FOnEndStream
>005CBFD3    jmp         005CC37E
 005CBFD8    cmp         word ptr [ebx+6A],0;TSpSharedRecoContext.?f6A:word
>005CBFDD    je          005CC37E
 005CBFE3    mov         eax,dword ptr [esi]
 005CBFE5    add         eax,10
 005CBFE8    push        eax
 005CBFE9    mov         eax,dword ptr [esi]
 005CBFEB    add         eax,20
 005CBFEE    push        eax
 005CBFEF    mov         eax,dword ptr [esi]
 005CBFF1    add         eax,30
 005CBFF4    call        @VarToInt64
 005CBFF9    push        eax
 005CBFFA    mov         eax,dword ptr [esi]
 005CBFFC    call        @VarToInteger
 005CC001    mov         ecx,eax
 005CC003    mov         edx,ebx
 005CC005    mov         eax,dword ptr [ebx+6C];TSpSharedRecoContext.?f6C:TSpeechRecogniser
 005CC008    call        dword ptr [ebx+68];TSpSharedRecoContext.FOnBookmark
>005CC00B    jmp         005CC37E
 005CC010    cmp         word ptr [ebx+72],0;TSpSharedRecoContext.?f72:word
>005CC015    je          005CC37E
 005CC01B    mov         eax,dword ptr [esi]
 005CC01D    add         eax,10
 005CC020    push        eax
 005CC021    mov         eax,dword ptr [esi]
 005CC023    call        @VarToInteger
 005CC028    mov         ecx,eax
 005CC02A    mov         edx,ebx
 005CC02C    mov         eax,dword ptr [ebx+74];TSpSharedRecoContext.?f74:TSpeechRecogniser
 005CC02F    call        dword ptr [ebx+70];TSpSharedRecoContext.FOnSoundStart
>005CC032    jmp         005CC37E
 005CC037    cmp         word ptr [ebx+7A],0;TSpSharedRecoContext.?f7A:word
>005CC03C    je          005CC37E
 005CC042    mov         eax,dword ptr [esi]
 005CC044    add         eax,10
 005CC047    push        eax
 005CC048    mov         eax,dword ptr [esi]
 005CC04A    call        @VarToInteger
 005CC04F    mov         ecx,eax
 005CC051    mov         edx,ebx
 005CC053    mov         eax,dword ptr [ebx+7C];TSpSharedRecoContext.?f7C:TSpeechRecogniser
 005CC056    call        dword ptr [ebx+78];TSpSharedRecoContext.FOnSoundEnd
>005CC059    jmp         005CC37E
 005CC05E    cmp         word ptr [ebx+82],0;TSpSharedRecoContext.?f82:word
>005CC066    je          005CC37E
 005CC06C    mov         eax,dword ptr [esi]
 005CC06E    add         eax,10
 005CC071    push        eax
 005CC072    mov         eax,dword ptr [esi]
 005CC074    call        @VarToInteger
 005CC079    mov         ecx,eax
 005CC07B    mov         edx,ebx
 005CC07D    mov         eax,dword ptr [ebx+84];TSpSharedRecoContext.?f84:TSpeechRecogniser
 005CC083    call        dword ptr [ebx+80];TSpSharedRecoContext.FOnPhraseStart
>005CC089    jmp         005CC37E
 005CC08E    cmp         word ptr [ebx+8A],0;TSpSharedRecoContext.?f8A:word
>005CC096    je          005CC37E
 005CC09C    mov         eax,dword ptr [esi]
 005CC09E    add         eax,10
 005CC0A1    push        eax
 005CC0A2    mov         eax,dword ptr [esi]
 005CC0A4    add         eax,20
 005CC0A7    call        @VarToInt64
 005CC0AC    push        eax
 005CC0AD    lea         eax,[ebp-4]
 005CC0B0    mov         edx,dword ptr [esi]
 005CC0B2    mov         edx,dword ptr [edx+38]
 005CC0B5    mov         ecx,5CC3CC;['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
 005CC0BA    call        @IntfCast
 005CC0BF    mov         eax,dword ptr [ebp-4]
 005CC0C2    push        eax
 005CC0C3    mov         eax,dword ptr [esi]
 005CC0C5    call        @VarToInteger
 005CC0CA    mov         ecx,eax
 005CC0CC    mov         edx,ebx
 005CC0CE    mov         eax,dword ptr [ebx+8C];TSpSharedRecoContext.?f8C:TSpeechRecogniser
 005CC0D4    call        dword ptr [ebx+88];TSpSharedRecoContext.FOnRecognition
>005CC0DA    jmp         005CC37E
 005CC0DF    cmp         word ptr [ebx+92],0;TSpSharedRecoContext.?f92:word
>005CC0E7    je          005CC37E
 005CC0ED    mov         eax,dword ptr [esi]
 005CC0EF    add         eax,10
 005CC0F2    push        eax
 005CC0F3    lea         eax,[ebp-8]
 005CC0F6    mov         edx,dword ptr [esi]
 005CC0F8    mov         edx,dword ptr [edx+28]
 005CC0FB    mov         ecx,5CC3CC;['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
 005CC100    call        @IntfCast
 005CC105    mov         eax,dword ptr [ebp-8]
 005CC108    push        eax
 005CC109    mov         eax,dword ptr [esi]
 005CC10B    call        @VarToInteger
 005CC110    mov         ecx,eax
 005CC112    mov         edx,ebx
 005CC114    mov         eax,dword ptr [ebx+94];TSpSharedRecoContext.?f94:TSpeechRecogniser
 005CC11A    call        dword ptr [ebx+90];TSpSharedRecoContext.FOnHypothesis
>005CC120    jmp         005CC37E
 005CC125    cmp         word ptr [ebx+9A],0;TSpSharedRecoContext.?f9A:word
>005CC12D    je          005CC37E
 005CC133    mov         eax,dword ptr [esi]
 005CC135    add         eax,10
 005CC138    push        eax
 005CC139    lea         eax,[ebp-0C]
 005CC13C    mov         edx,dword ptr [esi]
 005CC13E    add         edx,20
 005CC141    call        @VarToWStr
 005CC146    mov         eax,dword ptr [ebp-0C]
 005CC149    push        eax
 005CC14A    mov         eax,dword ptr [esi]
 005CC14C    add         eax,30
 005CC14F    call        @VarToInteger
 005CC154    push        eax
 005CC155    mov         eax,dword ptr [esi]
 005CC157    call        @VarToInteger
 005CC15C    mov         ecx,eax
 005CC15E    mov         edx,ebx
 005CC160    mov         eax,dword ptr [ebx+9C];TSpSharedRecoContext.?f9C:TSpeechRecogniser
 005CC166    call        dword ptr [ebx+98];TSpSharedRecoContext.FOnPropertyNumberChange
>005CC16C    jmp         005CC37E
 005CC171    cmp         word ptr [ebx+0A2],0;TSpSharedRecoContext.?fA2:word
>005CC179    je          005CC37E
 005CC17F    mov         eax,dword ptr [esi]
 005CC181    add         eax,10
 005CC184    push        eax
 005CC185    lea         eax,[ebp-10]
 005CC188    mov         edx,dword ptr [esi]
 005CC18A    add         edx,20
 005CC18D    call        @VarToWStr
 005CC192    mov         eax,dword ptr [ebp-10]
 005CC195    push        eax
 005CC196    lea         eax,[ebp-14]
 005CC199    mov         edx,dword ptr [esi]
 005CC19B    add         edx,30
 005CC19E    call        @VarToWStr
 005CC1A3    mov         eax,dword ptr [ebp-14]
 005CC1A6    push        eax
 005CC1A7    mov         eax,dword ptr [esi]
 005CC1A9    call        @VarToInteger
 005CC1AE    mov         ecx,eax
 005CC1B0    mov         edx,ebx
 005CC1B2    mov         eax,dword ptr [ebx+0A4];TSpSharedRecoContext.?fA4:TSpeechRecogniser
 005CC1B8    call        dword ptr [ebx+0A0];TSpSharedRecoContext.FOnPropertyStringChange
>005CC1BE    jmp         005CC37E
 005CC1C3    cmp         word ptr [ebx+0AA],0;TSpSharedRecoContext.?fAA:word
>005CC1CB    je          005CC37E
 005CC1D1    mov         eax,dword ptr [esi]
 005CC1D3    add         eax,10
 005CC1D6    push        eax
 005CC1D7    lea         eax,[ebp-18]
 005CC1DA    mov         edx,dword ptr [esi]
 005CC1DC    mov         edx,dword ptr [edx+28]
 005CC1DF    mov         ecx,5CC3CC;['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
 005CC1E4    call        @IntfCast
 005CC1E9    mov         eax,dword ptr [ebp-18]
 005CC1EC    push        eax
 005CC1ED    mov         eax,dword ptr [esi]
 005CC1EF    call        @VarToInteger
 005CC1F4    mov         ecx,eax
 005CC1F6    mov         edx,ebx
 005CC1F8    mov         eax,dword ptr [ebx+0AC];TSpSharedRecoContext.?fAC:TSpeechRecogniser
 005CC1FE    call        dword ptr [ebx+0A8];TSpSharedRecoContext.FOnFalseRecognition
>005CC204    jmp         005CC37E
 005CC209    cmp         word ptr [ebx+0B2],0;TSpSharedRecoContext.?fB2:word
>005CC211    je          005CC37E
 005CC217    mov         eax,dword ptr [esi]
 005CC219    add         eax,10
 005CC21C    push        eax
 005CC21D    mov         eax,dword ptr [esi]
 005CC21F    add         eax,20
 005CC222    call        @VarToInt64
 005CC227    push        eax
 005CC228    mov         eax,dword ptr [esi]
 005CC22A    call        @VarToInteger
 005CC22F    mov         ecx,eax
 005CC231    mov         edx,ebx
 005CC233    mov         eax,dword ptr [ebx+0B4];TSpSharedRecoContext.?fB4:TSpeechRecogniser
 005CC239    call        dword ptr [ebx+0B0];TSpSharedRecoContext.FOnInterference
>005CC23F    jmp         005CC37E
 005CC244    cmp         word ptr [ebx+0BA],0;TSpSharedRecoContext.?fBA:word
>005CC24C    je          005CC37E
 005CC252    mov         eax,dword ptr [esi]
 005CC254    add         eax,10
 005CC257    push        eax
 005CC258    lea         eax,[ebp-1C]
 005CC25B    mov         edx,dword ptr [esi]
 005CC25D    add         edx,20
 005CC260    call        @VarToWStr
 005CC265    mov         eax,dword ptr [ebp-1C]
 005CC268    push        eax
 005CC269    mov         eax,dword ptr [esi]
 005CC26B    call        @VarToInteger
 005CC270    mov         ecx,eax
 005CC272    mov         edx,ebx
 005CC274    mov         eax,dword ptr [ebx+0BC];TSpSharedRecoContext.?fBC:TSpeechRecogniser
 005CC27A    call        dword ptr [ebx+0B8];TSpSharedRecoContext.FOnRequestUI
>005CC280    jmp         005CC37E
 005CC285    cmp         word ptr [ebx+0C2],0;TSpSharedRecoContext.?fC2:word
>005CC28D    je          005CC37E
 005CC293    mov         eax,dword ptr [esi]
 005CC295    add         eax,10
 005CC298    push        eax
 005CC299    mov         eax,dword ptr [esi]
 005CC29B    add         eax,20
 005CC29E    call        @VarToInt64
 005CC2A3    push        eax
 005CC2A4    mov         eax,dword ptr [esi]
 005CC2A6    call        @VarToInteger
 005CC2AB    mov         ecx,eax
 005CC2AD    mov         edx,ebx
 005CC2AF    mov         eax,dword ptr [ebx+0C4];TSpSharedRecoContext.?fC4:TSpeechRecogniser
 005CC2B5    call        dword ptr [ebx+0C0];TSpSharedRecoContext.FOnRecognizerStateChange
>005CC2BB    jmp         005CC37E
 005CC2C0    cmp         word ptr [ebx+0CA],0;TSpSharedRecoContext.?fCA:word
>005CC2C8    je          005CC37E
 005CC2CE    mov         eax,dword ptr [esi]
 005CC2D0    add         eax,10
 005CC2D3    push        eax
 005CC2D4    mov         eax,dword ptr [esi]
 005CC2D6    call        @VarToInteger
 005CC2DB    mov         ecx,eax
 005CC2DD    mov         edx,ebx
 005CC2DF    mov         eax,dword ptr [ebx+0CC];TSpSharedRecoContext.?fCC:TSpeechRecogniser
 005CC2E5    call        dword ptr [ebx+0C8];TSpSharedRecoContext.FOnAdaptation
>005CC2EB    jmp         005CC37E
 005CC2F0    cmp         word ptr [ebx+0D2],0;TSpSharedRecoContext.?fD2:word
>005CC2F8    je          005CC37E
 005CC2FE    mov         eax,dword ptr [esi]
 005CC300    add         eax,10
 005CC303    push        eax
 005CC304    mov         eax,dword ptr [esi]
 005CC306    call        @VarToInteger
 005CC30B    mov         ecx,eax
 005CC30D    mov         edx,ebx
 005CC30F    mov         eax,dword ptr [ebx+0D4];TSpSharedRecoContext.?fD4:TSpeechRecogniser
 005CC315    call        dword ptr [ebx+0D0];TSpSharedRecoContext.FOnRecognitionForOtherContext
>005CC31B    jmp         005CC37E
 005CC31D    cmp         word ptr [ebx+0DA],0;TSpSharedRecoContext.?fDA:word
>005CC325    je          005CC37E
 005CC327    mov         eax,dword ptr [esi]
 005CC329    add         eax,10
 005CC32C    push        eax
 005CC32D    mov         eax,dword ptr [esi]
 005CC32F    add         eax,20
 005CC332    call        @VarToInteger
 005CC337    push        eax
 005CC338    mov         eax,dword ptr [esi]
 005CC33A    call        @VarToInteger
 005CC33F    mov         ecx,eax
 005CC341    mov         edx,ebx
 005CC343    mov         eax,dword ptr [ebx+0DC];TSpSharedRecoContext.?fDC:TSpeechRecogniser
 005CC349    call        dword ptr [ebx+0D8];TSpSharedRecoContext.FOnAudioLevel
>005CC34F    jmp         005CC37E
 005CC351    cmp         word ptr [ebx+0E2],0;TSpSharedRecoContext.?fE2:word
>005CC359    je          005CC37E
 005CC35B    mov         eax,dword ptr [esi]
 005CC35D    add         eax,10
 005CC360    push        eax
 005CC361    mov         eax,dword ptr [esi]
 005CC363    add         eax,20
 005CC366    push        eax
 005CC367    mov         eax,dword ptr [esi]
 005CC369    call        @VarToInteger
 005CC36E    mov         ecx,eax
 005CC370    mov         edx,ebx
 005CC372    mov         eax,dword ptr [ebx+0E4];TSpSharedRecoContext.?fE4:TSpeechRecogniser
 005CC378    call        dword ptr [ebx+0E0];TSpSharedRecoContext.FOnEnginePrivate
 005CC37E    xor         eax,eax
 005CC380    pop         edx
 005CC381    pop         ecx
 005CC382    pop         ecx
 005CC383    mov         dword ptr fs:[eax],edx
 005CC386    push        5CC3C3
 005CC38B    lea         eax,[ebp-1C]
 005CC38E    call        @WStrClr
 005CC393    lea         eax,[ebp-18]
 005CC396    call        @IntfClear
 005CC39B    lea         eax,[ebp-14]
 005CC39E    mov         edx,3
 005CC3A3    call        @WStrArrayClr
 005CC3A8    lea         eax,[ebp-8]
 005CC3AB    mov         edx,dword ptr ds:[5C5928];ISpeechRecoResult
 005CC3B1    mov         ecx,2
 005CC3B6    call        @FinalizeArray
 005CC3BB    ret
>005CC3BC    jmp         @HandleFinally
>005CC3C1    jmp         005CC38B
 005CC3C3    pop         esi
 005CC3C4    pop         ebx
 005CC3C5    mov         esp,ebp
 005CC3C7    pop         ebp
 005CC3C8    ret
end;*}

//005CC3DC
{*procedure sub_005CC3DC(?:TSpSharedRecoContext; ?:?);
begin
 005CC3DC    push        ebp
 005CC3DD    mov         ebp,esp
 005CC3DF    push        0
 005CC3E1    push        ebx
 005CC3E2    push        esi
 005CC3E3    mov         esi,edx
 005CC3E5    mov         ebx,eax
 005CC3E7    xor         eax,eax
 005CC3E9    push        ebp
 005CC3EA    push        5CC42B
 005CC3EF    push        dword ptr fs:[eax]
 005CC3F2    mov         dword ptr fs:[eax],esp
 005CC3F5    mov         eax,esi
 005CC3F7    call        @IntfClear
 005CC3FC    push        eax
 005CC3FD    lea         edx,[ebp-4]
 005CC400    mov         eax,ebx
 005CC402    call        005CBE6C
 005CC407    mov         eax,dword ptr [ebp-4]
 005CC40A    push        eax
 005CC40B    mov         eax,dword ptr [eax]
 005CC40D    call        dword ptr [eax+1C]
 005CC410    call        @CheckAutoResult
 005CC415    xor         eax,eax
 005CC417    pop         edx
 005CC418    pop         ecx
 005CC419    pop         ecx
 005CC41A    mov         dword ptr fs:[eax],edx
 005CC41D    push        5CC432
 005CC422    lea         eax,[ebp-4]
 005CC425    call        @IntfClear
 005CC42A    ret
>005CC42B    jmp         @HandleFinally
>005CC430    jmp         005CC422
 005CC432    pop         esi
 005CC433    pop         ebx
 005CC434    pop         ecx
 005CC435    pop         ebp
 005CC436    ret
end;*}

//005CC738
{*procedure sub_005CC738(?:TSpSharedRecoContext; ?:?);
begin
 005CC738    push        ebp
 005CC739    mov         ebp,esp
 005CC73B    push        0
 005CC73D    push        ebx
 005CC73E    push        esi
 005CC73F    mov         esi,edx
 005CC741    mov         ebx,eax
 005CC743    xor         eax,eax
 005CC745    push        ebp
 005CC746    push        5CC780
 005CC74B    push        dword ptr fs:[eax]
 005CC74E    mov         dword ptr fs:[eax],esp
 005CC751    push        esi
 005CC752    lea         edx,[ebp-4]
 005CC755    mov         eax,ebx
 005CC757    call        005CBE6C
 005CC75C    mov         eax,dword ptr [ebp-4]
 005CC75F    push        eax
 005CC760    mov         eax,dword ptr [eax]
 005CC762    call        dword ptr [eax+40]
 005CC765    call        @CheckAutoResult
 005CC76A    xor         eax,eax
 005CC76C    pop         edx
 005CC76D    pop         ecx
 005CC76E    pop         ecx
 005CC76F    mov         dword ptr fs:[eax],edx
 005CC772    push        5CC787
 005CC777    lea         eax,[ebp-4]
 005CC77A    call        @IntfClear
 005CC77F    ret
>005CC780    jmp         @HandleFinally
>005CC785    jmp         005CC777
 005CC787    pop         esi
 005CC788    pop         ebx
 005CC789    pop         ecx
 005CC78A    pop         ebp
 005CC78B    ret
end;*}

//005CCAF0
procedure TSpSharedRecoContext.Pause;
begin
{*
 005CCAF0    push        ebp
 005CCAF1    mov         ebp,esp
 005CCAF3    push        0
 005CCAF5    push        ebx
 005CCAF6    mov         ebx,eax
 005CCAF8    xor         eax,eax
 005CCAFA    push        ebp
 005CCAFB    push        5CCB34
 005CCB00    push        dword ptr fs:[eax]
 005CCB03    mov         dword ptr fs:[eax],esp
 005CCB06    lea         edx,[ebp-4]
 005CCB09    mov         eax,ebx
 005CCB0B    call        005CBE6C
 005CCB10    mov         eax,dword ptr [ebp-4]
 005CCB13    push        eax
 005CCB14    mov         eax,dword ptr [eax]
 005CCB16    call        dword ptr [eax+68]
 005CCB19    call        @CheckAutoResult
 005CCB1E    xor         eax,eax
 005CCB20    pop         edx
 005CCB21    pop         ecx
 005CCB22    pop         ecx
 005CCB23    mov         dword ptr fs:[eax],edx
 005CCB26    push        5CCB3B
 005CCB2B    lea         eax,[ebp-4]
 005CCB2E    call        @IntfClear
 005CCB33    ret
>005CCB34    jmp         @HandleFinally
>005CCB39    jmp         005CCB2B
 005CCB3B    pop         ebx
 005CCB3C    pop         ecx
 005CCB3D    pop         ebp
 005CCB3E    ret
*}
end;

//005CCB40
procedure TSpSharedRecoContext.Resume;
begin
{*
 005CCB40    push        ebp
 005CCB41    mov         ebp,esp
 005CCB43    push        0
 005CCB45    push        ebx
 005CCB46    mov         ebx,eax
 005CCB48    xor         eax,eax
 005CCB4A    push        ebp
 005CCB4B    push        5CCB84
 005CCB50    push        dword ptr fs:[eax]
 005CCB53    mov         dword ptr fs:[eax],esp
 005CCB56    lea         edx,[ebp-4]
 005CCB59    mov         eax,ebx
 005CCB5B    call        005CBE6C
 005CCB60    mov         eax,dword ptr [ebp-4]
 005CCB63    push        eax
 005CCB64    mov         eax,dword ptr [eax]
 005CCB66    call        dword ptr [eax+6C]
 005CCB69    call        @CheckAutoResult
 005CCB6E    xor         eax,eax
 005CCB70    pop         edx
 005CCB71    pop         ecx
 005CCB72    pop         ecx
 005CCB73    mov         dword ptr fs:[eax],edx
 005CCB76    push        5CCB8B
 005CCB7B    lea         eax,[ebp-4]
 005CCB7E    call        @IntfClear
 005CCB83    ret
>005CCB84    jmp         @HandleFinally
>005CCB89    jmp         005CCB7B
 005CCB8B    pop         ebx
 005CCB8C    pop         ecx
 005CCB8D    pop         ebp
 005CCB8E    ret
*}
end;

//005CCB90
{*procedure TSpSharedRecoContext.CreateGrammar(?:?);
begin
 005CCB90    push        ebp
 005CCB91    mov         ebp,esp
 005CCB93    push        0
 005CCB95    push        ebx
 005CCB96    push        esi
 005CCB97    mov         esi,edx
 005CCB99    mov         ebx,eax
 005CCB9B    xor         eax,eax
 005CCB9D    push        ebp
 005CCB9E    push        5CCBEF
 005CCBA3    push        dword ptr fs:[eax]
 005CCBA6    mov         dword ptr fs:[eax],esp
 005CCBA9    mov         eax,esi
 005CCBAB    call        @IntfClear
 005CCBB0    push        eax
 005CCBB1    mov         eax,[0078CDF8];^gvar_00792F78
 005CCBB6    push        dword ptr [eax+0C]
 005CCBB9    push        dword ptr [eax+8]
 005CCBBC    push        dword ptr [eax+4]
 005CCBBF    push        dword ptr [eax]
 005CCBC1    lea         edx,[ebp-4]
 005CCBC4    mov         eax,ebx
 005CCBC6    call        005CBE6C
 005CCBCB    mov         eax,dword ptr [ebp-4]
 005CCBCE    push        eax
 005CCBCF    mov         eax,dword ptr [eax]
 005CCBD1    call        dword ptr [eax+70]
 005CCBD4    call        @CheckAutoResult
 005CCBD9    xor         eax,eax
 005CCBDB    pop         edx
 005CCBDC    pop         ecx
 005CCBDD    pop         ecx
 005CCBDE    mov         dword ptr fs:[eax],edx
 005CCBE1    push        5CCBF6
 005CCBE6    lea         eax,[ebp-4]
 005CCBE9    call        @IntfClear
 005CCBEE    ret
>005CCBEF    jmp         @HandleFinally
>005CCBF4    jmp         005CCBE6
 005CCBF6    pop         esi
 005CCBF7    pop         ebx
 005CCBF8    pop         ecx
 005CCBF9    pop         ebp
 005CCBFA    ret
end;*}

//005CCBFC
{*procedure TSpSharedRecoContext.CreateGrammar(GrammarId:OleVariant; ?:?);
begin
 005CCBFC    push        ebp
 005CCBFD    mov         ebp,esp
 005CCBFF    add         esp,0FFFFFFEC
 005CCC02    push        ebx
 005CCC03    push        esi
 005CCC04    push        edi
 005CCC05    xor         ebx,ebx
 005CCC07    mov         dword ptr [ebp-14],ebx
 005CCC0A    mov         esi,edx
 005CCC0C    lea         edi,[ebp-10]
 005CCC0F    movs        dword ptr [edi],dword ptr [esi]
 005CCC10    movs        dword ptr [edi],dword ptr [esi]
 005CCC11    movs        dword ptr [edi],dword ptr [esi]
 005CCC12    movs        dword ptr [edi],dword ptr [esi]
 005CCC13    mov         esi,ecx
 005CCC15    mov         ebx,eax
 005CCC17    lea         eax,[ebp-10]
 005CCC1A    call        @VarAddRef
 005CCC1F    xor         eax,eax
 005CCC21    push        ebp
 005CCC22    push        5CCC77
 005CCC27    push        dword ptr fs:[eax]
 005CCC2A    mov         dword ptr fs:[eax],esp
 005CCC2D    mov         eax,esi
 005CCC2F    call        @IntfClear
 005CCC34    push        eax
 005CCC35    push        dword ptr [ebp-4]
 005CCC38    push        dword ptr [ebp-8]
 005CCC3B    push        dword ptr [ebp-0C]
 005CCC3E    push        dword ptr [ebp-10]
 005CCC41    lea         edx,[ebp-14]
 005CCC44    mov         eax,ebx
 005CCC46    call        005CBE6C
 005CCC4B    mov         eax,dword ptr [ebp-14]
 005CCC4E    push        eax
 005CCC4F    mov         eax,dword ptr [eax]
 005CCC51    call        dword ptr [eax+70]
 005CCC54    call        @CheckAutoResult
 005CCC59    xor         eax,eax
 005CCC5B    pop         edx
 005CCC5C    pop         ecx
 005CCC5D    pop         ecx
 005CCC5E    mov         dword ptr fs:[eax],edx
 005CCC61    push        5CCC7E
 005CCC66    lea         eax,[ebp-14]
 005CCC69    call        @IntfClear
 005CCC6E    lea         eax,[ebp-10]
 005CCC71    call        @VarClr
 005CCC76    ret
>005CCC77    jmp         @HandleFinally
>005CCC7C    jmp         005CCC66
 005CCC7E    pop         edi
 005CCC7F    pop         esi
 005CCC80    pop         ebx
 005CCC81    mov         esp,ebp
 005CCC83    pop         ebp
 005CCC84    ret
end;*}

//005CCC88
{*procedure TSpSharedRecoContext.CreateResultFromMemory(var ResultBlock:OleVariant; ?:?);
begin
 005CCC88    push        ebp
 005CCC89    mov         ebp,esp
 005CCC8B    push        0
 005CCC8D    push        ebx
 005CCC8E    push        esi
 005CCC8F    push        edi
 005CCC90    mov         edi,ecx
 005CCC92    mov         esi,edx
 005CCC94    mov         ebx,eax
 005CCC96    xor         eax,eax
 005CCC98    push        ebp
 005CCC99    push        5CCCDB
 005CCC9E    push        dword ptr fs:[eax]
 005CCCA1    mov         dword ptr fs:[eax],esp
 005CCCA4    mov         eax,edi
 005CCCA6    call        @IntfClear
 005CCCAB    push        eax
 005CCCAC    push        esi
 005CCCAD    lea         edx,[ebp-4]
 005CCCB0    mov         eax,ebx
 005CCCB2    call        005CBE6C
 005CCCB7    mov         eax,dword ptr [ebp-4]
 005CCCBA    push        eax
 005CCCBB    mov         eax,dword ptr [eax]
 005CCCBD    call        dword ptr [eax+74]
 005CCCC0    call        @CheckAutoResult
 005CCCC5    xor         eax,eax
 005CCCC7    pop         edx
 005CCCC8    pop         ecx
 005CCCC9    pop         ecx
 005CCCCA    mov         dword ptr fs:[eax],edx
 005CCCCD    push        5CCCE2
 005CCCD2    lea         eax,[ebp-4]
 005CCCD5    call        @IntfClear
 005CCCDA    ret
>005CCCDB    jmp         @HandleFinally
>005CCCE0    jmp         005CCCD2
 005CCCE2    pop         edi
 005CCCE3    pop         esi
 005CCCE4    pop         ebx
 005CCCE5    pop         ecx
 005CCCE6    pop         ebp
 005CCCE7    ret
end;*}

//005CCCE8
procedure TSpSharedRecoContext.Bookmark(Options:TOleEnum; StreamPos:OleVariant; BookmarkId:OleVariant);
begin
{*
 005CCCE8    push        ebp
 005CCCE9    mov         ebp,esp
 005CCCEB    add         esp,0FFFFFFDC
 005CCCEE    push        ebx
 005CCCEF    push        esi
 005CCCF0    push        edi
 005CCCF1    xor         ebx,ebx
 005CCCF3    mov         dword ptr [ebp-24],ebx
 005CCCF6    mov         esi,dword ptr [ebp+8]
 005CCCF9    lea         edi,[ebp-20]
 005CCCFC    movs        dword ptr [edi],dword ptr [esi]
 005CCCFD    movs        dword ptr [edi],dword ptr [esi]
 005CCCFE    movs        dword ptr [edi],dword ptr [esi]
 005CCCFF    movs        dword ptr [edi],dword ptr [esi]
 005CCD00    mov         esi,ecx
 005CCD02    lea         edi,[ebp-10]
 005CCD05    movs        dword ptr [edi],dword ptr [esi]
 005CCD06    movs        dword ptr [edi],dword ptr [esi]
 005CCD07    movs        dword ptr [edi],dword ptr [esi]
 005CCD08    movs        dword ptr [edi],dword ptr [esi]
 005CCD09    mov         esi,edx
 005CCD0B    mov         ebx,eax
 005CCD0D    lea         eax,[ebp-10]
 005CCD10    call        @VarAddRef
 005CCD15    lea         eax,[ebp-20]
 005CCD18    call        @VarAddRef
 005CCD1D    xor         eax,eax
 005CCD1F    push        ebp
 005CCD20    push        5CCD85
 005CCD25    push        dword ptr fs:[eax]
 005CCD28    mov         dword ptr fs:[eax],esp
 005CCD2B    push        dword ptr [ebp-14]
 005CCD2E    push        dword ptr [ebp-18]
 005CCD31    push        dword ptr [ebp-1C]
 005CCD34    push        dword ptr [ebp-20]
 005CCD37    push        dword ptr [ebp-4]
 005CCD3A    push        dword ptr [ebp-8]
 005CCD3D    push        dword ptr [ebp-0C]
 005CCD40    push        dword ptr [ebp-10]
 005CCD43    push        esi
 005CCD44    lea         edx,[ebp-24]
 005CCD47    mov         eax,ebx
 005CCD49    call        005CBE6C
 005CCD4E    mov         eax,dword ptr [ebp-24]
 005CCD51    push        eax
 005CCD52    mov         eax,dword ptr [eax]
 005CCD54    call        dword ptr [eax+78]
 005CCD57    call        @CheckAutoResult
 005CCD5C    xor         eax,eax
 005CCD5E    pop         edx
 005CCD5F    pop         ecx
 005CCD60    pop         ecx
 005CCD61    mov         dword ptr fs:[eax],edx
 005CCD64    push        5CCD8C
 005CCD69    lea         eax,[ebp-24]
 005CCD6C    call        @IntfClear
 005CCD71    lea         eax,[ebp-20]
 005CCD74    mov         edx,dword ptr ds:[4012D4];OleVariant
 005CCD7A    mov         ecx,2
 005CCD7F    call        @FinalizeArray
 005CCD84    ret
>005CCD85    jmp         @HandleFinally
>005CCD8A    jmp         005CCD69
 005CCD8C    pop         edi
 005CCD8D    pop         esi
 005CCD8E    pop         ebx
 005CCD8F    mov         esp,ebp
 005CCD91    pop         ebp
 005CCD92    ret         4
*}
end;

//005CCD98
procedure TSpSharedRecoContext.SetAdaptationData(AdaptationString:WideString);
begin
{*
 005CCD98    push        ebp
 005CCD99    mov         ebp,esp
 005CCD9B    push        0
 005CCD9D    push        ebx
 005CCD9E    push        esi
 005CCD9F    mov         esi,edx
 005CCDA1    mov         ebx,eax
 005CCDA3    xor         eax,eax
 005CCDA5    push        ebp
 005CCDA6    push        5CCDE0
 005CCDAB    push        dword ptr fs:[eax]
 005CCDAE    mov         dword ptr fs:[eax],esp
 005CCDB1    push        esi
 005CCDB2    lea         edx,[ebp-4]
 005CCDB5    mov         eax,ebx
 005CCDB7    call        005CBE6C
 005CCDBC    mov         eax,dword ptr [ebp-4]
 005CCDBF    push        eax
 005CCDC0    mov         eax,dword ptr [eax]
 005CCDC2    call        dword ptr [eax+7C]
 005CCDC5    call        @CheckAutoResult
 005CCDCA    xor         eax,eax
 005CCDCC    pop         edx
 005CCDCD    pop         ecx
 005CCDCE    pop         ecx
 005CCDCF    mov         dword ptr fs:[eax],edx
 005CCDD2    push        5CCDE7
 005CCDD7    lea         eax,[ebp-4]
 005CCDDA    call        @IntfClear
 005CCDDF    ret
>005CCDE0    jmp         @HandleFinally
>005CCDE5    jmp         005CCDD7
 005CCDE7    pop         esi
 005CCDE8    pop         ebx
 005CCDE9    pop         ecx
 005CCDEA    pop         ebp
 005CCDEB    ret
*}
end;

//005CCDEC
procedure sub_005CCDEC;
begin
{*
 005CCDEC    mov         edx,789FF8
 005CCDF1    mov         dword ptr [eax+34],edx;TSpInProcRecoContext.FServerData:PServerData
 005CCDF4    ret
*}
end;

//005CCDF8
procedure TSpInProcRecoContext.Connect;
begin
{*
 005CCDF8    push        ebp
 005CCDF9    mov         ebp,esp
 005CCDFB    push        0
 005CCDFD    push        ebx
 005CCDFE    mov         ebx,eax
 005CCE00    xor         eax,eax
 005CCE02    push        ebp
 005CCE03    push        5CCE54
 005CCE08    push        dword ptr fs:[eax]
 005CCE0B    mov         dword ptr fs:[eax],esp
 005CCE0E    cmp         dword ptr [ebx+0E8],0;TSpInProcRecoContext.FIntf:ISpeechRecoContext
>005CCE15    jne         005CCE3E
 005CCE17    lea         edx,[ebp-4]
 005CCE1A    mov         eax,ebx
 005CCE1C    mov         ecx,dword ptr [eax]
 005CCE1E    call        dword ptr [ecx+38];TOleServer.GetServer
 005CCE21    mov         edx,dword ptr [ebp-4]
 005CCE24    mov         eax,ebx
 005CCE26    call        TOleServer.ConnectEvents
 005CCE2B    lea         eax,[ebx+0E8];TSpInProcRecoContext.FIntf:ISpeechRecoContext
 005CCE31    mov         edx,dword ptr [ebp-4]
 005CCE34    mov         ecx,5CCE60;['{580AA49D-7E1E-4809-B8E2-57DA806104B8}']
 005CCE39    call        @IntfCast
 005CCE3E    xor         eax,eax
 005CCE40    pop         edx
 005CCE41    pop         ecx
 005CCE42    pop         ecx
 005CCE43    mov         dword ptr fs:[eax],edx
 005CCE46    push        5CCE5B
 005CCE4B    lea         eax,[ebp-4]
 005CCE4E    call        @IntfClear
 005CCE53    ret
>005CCE54    jmp         @HandleFinally
>005CCE59    jmp         005CCE4B
 005CCE5B    pop         ebx
 005CCE5C    pop         ecx
 005CCE5D    pop         ebp
 005CCE5E    ret
*}
end;

//005CCE70
procedure TSpInProcRecoContext.ConnectTo(svrIntf:ISpeechRecoContext);
begin
{*
 005CCE70    push        ebp
 005CCE71    mov         ebp,esp
 005CCE73    push        ecx
 005CCE74    push        ebx
 005CCE75    mov         dword ptr [ebp-4],edx
 005CCE78    mov         ebx,eax
 005CCE7A    mov         eax,dword ptr [ebp-4]
 005CCE7D    call        @IntfAddRef
 005CCE82    xor         eax,eax
 005CCE84    push        ebp
 005CCE85    push        5CCEC8
 005CCE8A    push        dword ptr fs:[eax]
 005CCE8D    mov         dword ptr fs:[eax],esp
 005CCE90    mov         eax,ebx
 005CCE92    mov         edx,dword ptr [eax]
 005CCE94    call        dword ptr [edx+44];TSpInProcRecoContext.Disconnect
 005CCE97    lea         eax,[ebx+0E8];TSpInProcRecoContext.FIntf:ISpeechRecoContext
 005CCE9D    mov         edx,dword ptr [ebp-4]
 005CCEA0    call        @IntfCopy
 005CCEA5    mov         edx,dword ptr [ebx+0E8];TSpInProcRecoContext.FIntf:ISpeechRecoContext
 005CCEAB    mov         eax,ebx
 005CCEAD    call        TOleServer.ConnectEvents
 005CCEB2    xor         eax,eax
 005CCEB4    pop         edx
 005CCEB5    pop         ecx
 005CCEB6    pop         ecx
 005CCEB7    mov         dword ptr fs:[eax],edx
 005CCEBA    push        5CCECF
 005CCEBF    lea         eax,[ebp-4]
 005CCEC2    call        @IntfClear
 005CCEC7    ret
>005CCEC8    jmp         @HandleFinally
>005CCECD    jmp         005CCEBF
 005CCECF    pop         ebx
 005CCED0    pop         ecx
 005CCED1    pop         ebp
 005CCED2    ret
*}
end;

//005CCED4
procedure TSpInProcRecoContext.Disconnect;
begin
{*
 005CCED4    push        ebx
 005CCED5    mov         ebx,eax
 005CCED7    cmp         dword ptr [ebx+0E8],0;TSpInProcRecoContext.FIntf:ISpeechRecoContext
>005CCEDE    je          005CCEF8
 005CCEE0    mov         edx,dword ptr [ebx+0E8];TSpInProcRecoContext.FIntf:ISpeechRecoContext
 005CCEE6    mov         eax,ebx
 005CCEE8    call        TOleServer.DisconnectEvents
 005CCEED    lea         eax,[ebx+0E8];TSpInProcRecoContext.FIntf:ISpeechRecoContext
 005CCEF3    call        @IntfClear
 005CCEF8    pop         ebx
 005CCEF9    ret
*}
end;

//005CCEFC
{*procedure sub_005CCEFC(?:TSpInProcRecoContext; ?:?);
begin
 005CCEFC    push        ebx
 005CCEFD    push        esi
 005CCEFE    mov         esi,edx
 005CCF00    mov         ebx,eax
 005CCF02    cmp         dword ptr [ebx+0E8],0
>005CCF09    jne         005CCF12
 005CCF0B    mov         eax,ebx
 005CCF0D    mov         edx,dword ptr [eax]
 005CCF0F    call        dword ptr [edx+40]
 005CCF12    mov         eax,esi
 005CCF14    mov         edx,dword ptr [ebx+0E8]
 005CCF1A    call        @IntfCopy
 005CCF1F    pop         esi
 005CCF20    pop         ebx
 005CCF21    ret
end;*}

//005CCF24
constructor TSpInProcRecoContext.Create(AOwner:TComponent);
begin
{*
 005CCF24    push        ebx
 005CCF25    push        esi
 005CCF26    test        dl,dl
>005CCF28    je          005CCF32
 005CCF2A    add         esp,0FFFFFFF0
 005CCF2D    call        @ClassCreate
 005CCF32    mov         ebx,edx
 005CCF34    mov         esi,eax
 005CCF36    xor         edx,edx
 005CCF38    mov         eax,esi
 005CCF3A    call        TOleServer.Create
 005CCF3F    mov         eax,esi
 005CCF41    test        bl,bl
>005CCF43    je          005CCF54
 005CCF45    call        @AfterConstruction
 005CCF4A    pop         dword ptr fs:[0]
 005CCF51    add         esp,0C
 005CCF54    mov         eax,esi
 005CCF56    pop         esi
 005CCF57    pop         ebx
 005CCF58    ret
*}
end;

//005CCF5C
destructor TSpInProcRecoContext.Destroy();
begin
{*
 005CCF5C    push        ebx
 005CCF5D    push        esi
 005CCF5E    call        @BeforeDestruction
 005CCF63    mov         ebx,edx
 005CCF65    mov         esi,eax
 005CCF67    mov         edx,ebx
 005CCF69    and         dl,0FC
 005CCF6C    mov         eax,esi
 005CCF6E    call        TOleServer.Destroy
 005CCF73    test        bl,bl
>005CCF75    jle         005CCF7E
 005CCF77    mov         eax,esi
 005CCF79    call        @ClassDestroy
 005CCF7E    pop         esi
 005CCF7F    pop         ebx
 005CCF80    ret
*}
end;

//005CCF84
{*procedure sub_005CCF84(?:?; ?:?);
begin
 005CCF84    push        ebp
 005CCF85    mov         ebp,esp
 005CCF87    push        0
 005CCF89    push        0
 005CCF8B    push        0
 005CCF8D    push        0
 005CCF8F    push        0
 005CCF91    push        0
 005CCF93    push        0
 005CCF95    push        ebx
 005CCF96    push        esi
 005CCF97    mov         esi,ecx
 005CCF99    mov         ebx,eax
 005CCF9B    xor         eax,eax
 005CCF9D    push        ebp
 005CCF9E    push        5CD44C
 005CCFA3    push        dword ptr fs:[eax]
 005CCFA6    mov         dword ptr fs:[eax],esp
 005CCFA9    inc         edx
 005CCFAA    cmp         edx,13
>005CCFAD    ja          005CD40E
 005CCFB3    jmp         dword ptr [edx*4+5CCFBA]
 005CCFB3    dd          005CD40E
 005CCFB3    dd          005CD40E
 005CCFB3    dd          005CD00F
 005CCFB3    dd          005CD036
 005CCFB3    dd          005CD068
 005CCFB3    dd          005CD0A0
 005CCFB3    dd          005CD0C7
 005CCFB3    dd          005CD0EE
 005CCFB3    dd          005CD11E
 005CCFB3    dd          005CD16F
 005CCFB3    dd          005CD1B5
 005CCFB3    dd          005CD201
 005CCFB3    dd          005CD253
 005CCFB3    dd          005CD299
 005CCFB3    dd          005CD2D4
 005CCFB3    dd          005CD315
 005CCFB3    dd          005CD350
 005CCFB3    dd          005CD380
 005CCFB3    dd          005CD3AD
 005CCFB3    dd          005CD3E1
>005CD00A    jmp         005CD40E
 005CD00F    cmp         word ptr [ebx+5A],0;TSpInProcRecoContext.?f5A:word
>005CD014    je          005CD40E
 005CD01A    mov         eax,dword ptr [esi]
 005CD01C    add         eax,10
 005CD01F    push        eax
 005CD020    mov         eax,dword ptr [esi]
 005CD022    call        @VarToInteger
 005CD027    mov         ecx,eax
 005CD029    mov         edx,ebx
 005CD02B    mov         eax,dword ptr [ebx+5C];TSpInProcRecoContext.?f5C:TSpeechRecogniser
 005CD02E    call        dword ptr [ebx+58];TSpInProcRecoContext.FOnStartStream
>005CD031    jmp         005CD40E
 005CD036    cmp         word ptr [ebx+62],0;TSpInProcRecoContext.?f62:word
>005CD03B    je          005CD40E
 005CD041    mov         eax,dword ptr [esi]
 005CD043    add         eax,10
 005CD046    push        eax
 005CD047    mov         eax,dword ptr [esi]
 005CD049    add         eax,20
 005CD04C    call        @VarToBool
 005CD051    push        eax
 005CD052    mov         eax,dword ptr [esi]
 005CD054    call        @VarToInteger
 005CD059    mov         ecx,eax
 005CD05B    mov         edx,ebx
 005CD05D    mov         eax,dword ptr [ebx+64];TSpInProcRecoContext.?f64:TSpeechRecogniser
 005CD060    call        dword ptr [ebx+60];TSpInProcRecoContext.FOnEndStream
>005CD063    jmp         005CD40E
 005CD068    cmp         word ptr [ebx+6A],0;TSpInProcRecoContext.?f6A:word
>005CD06D    je          005CD40E
 005CD073    mov         eax,dword ptr [esi]
 005CD075    add         eax,10
 005CD078    push        eax
 005CD079    mov         eax,dword ptr [esi]
 005CD07B    add         eax,20
 005CD07E    push        eax
 005CD07F    mov         eax,dword ptr [esi]
 005CD081    add         eax,30
 005CD084    call        @VarToInt64
 005CD089    push        eax
 005CD08A    mov         eax,dword ptr [esi]
 005CD08C    call        @VarToInteger
 005CD091    mov         ecx,eax
 005CD093    mov         edx,ebx
 005CD095    mov         eax,dword ptr [ebx+6C];TSpInProcRecoContext.?f6C:TSpeechRecogniser
 005CD098    call        dword ptr [ebx+68];TSpInProcRecoContext.FOnBookmark
>005CD09B    jmp         005CD40E
 005CD0A0    cmp         word ptr [ebx+72],0;TSpInProcRecoContext.?f72:word
>005CD0A5    je          005CD40E
 005CD0AB    mov         eax,dword ptr [esi]
 005CD0AD    add         eax,10
 005CD0B0    push        eax
 005CD0B1    mov         eax,dword ptr [esi]
 005CD0B3    call        @VarToInteger
 005CD0B8    mov         ecx,eax
 005CD0BA    mov         edx,ebx
 005CD0BC    mov         eax,dword ptr [ebx+74];TSpInProcRecoContext.?f74:TSpeechRecogniser
 005CD0BF    call        dword ptr [ebx+70];TSpInProcRecoContext.FOnSoundStart
>005CD0C2    jmp         005CD40E
 005CD0C7    cmp         word ptr [ebx+7A],0;TSpInProcRecoContext.?f7A:word
>005CD0CC    je          005CD40E
 005CD0D2    mov         eax,dword ptr [esi]
 005CD0D4    add         eax,10
 005CD0D7    push        eax
 005CD0D8    mov         eax,dword ptr [esi]
 005CD0DA    call        @VarToInteger
 005CD0DF    mov         ecx,eax
 005CD0E1    mov         edx,ebx
 005CD0E3    mov         eax,dword ptr [ebx+7C];TSpInProcRecoContext.?f7C:TSpeechRecogniser
 005CD0E6    call        dword ptr [ebx+78];TSpInProcRecoContext.FOnSoundEnd
>005CD0E9    jmp         005CD40E
 005CD0EE    cmp         word ptr [ebx+82],0;TSpInProcRecoContext.?f82:word
>005CD0F6    je          005CD40E
 005CD0FC    mov         eax,dword ptr [esi]
 005CD0FE    add         eax,10
 005CD101    push        eax
 005CD102    mov         eax,dword ptr [esi]
 005CD104    call        @VarToInteger
 005CD109    mov         ecx,eax
 005CD10B    mov         edx,ebx
 005CD10D    mov         eax,dword ptr [ebx+84];TSpInProcRecoContext.?f84:TSpeechRecogniser
 005CD113    call        dword ptr [ebx+80];TSpInProcRecoContext.FOnPhraseStart
>005CD119    jmp         005CD40E
 005CD11E    cmp         word ptr [ebx+8A],0;TSpInProcRecoContext.?f8A:word
>005CD126    je          005CD40E
 005CD12C    mov         eax,dword ptr [esi]
 005CD12E    add         eax,10
 005CD131    push        eax
 005CD132    mov         eax,dword ptr [esi]
 005CD134    add         eax,20
 005CD137    call        @VarToInt64
 005CD13C    push        eax
 005CD13D    lea         eax,[ebp-4]
 005CD140    mov         edx,dword ptr [esi]
 005CD142    mov         edx,dword ptr [edx+38]
 005CD145    mov         ecx,5CD45C;['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
 005CD14A    call        @IntfCast
 005CD14F    mov         eax,dword ptr [ebp-4]
 005CD152    push        eax
 005CD153    mov         eax,dword ptr [esi]
 005CD155    call        @VarToInteger
 005CD15A    mov         ecx,eax
 005CD15C    mov         edx,ebx
 005CD15E    mov         eax,dword ptr [ebx+8C];TSpInProcRecoContext.?f8C:TSpeechRecogniser
 005CD164    call        dword ptr [ebx+88];TSpInProcRecoContext.FOnRecognition
>005CD16A    jmp         005CD40E
 005CD16F    cmp         word ptr [ebx+92],0;TSpInProcRecoContext.?f92:word
>005CD177    je          005CD40E
 005CD17D    mov         eax,dword ptr [esi]
 005CD17F    add         eax,10
 005CD182    push        eax
 005CD183    lea         eax,[ebp-8]
 005CD186    mov         edx,dword ptr [esi]
 005CD188    mov         edx,dword ptr [edx+28]
 005CD18B    mov         ecx,5CD45C;['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
 005CD190    call        @IntfCast
 005CD195    mov         eax,dword ptr [ebp-8]
 005CD198    push        eax
 005CD199    mov         eax,dword ptr [esi]
 005CD19B    call        @VarToInteger
 005CD1A0    mov         ecx,eax
 005CD1A2    mov         edx,ebx
 005CD1A4    mov         eax,dword ptr [ebx+94];TSpInProcRecoContext.?f94:TSpeechRecogniser
 005CD1AA    call        dword ptr [ebx+90];TSpInProcRecoContext.FOnHypothesis
>005CD1B0    jmp         005CD40E
 005CD1B5    cmp         word ptr [ebx+9A],0;TSpInProcRecoContext.?f9A:word
>005CD1BD    je          005CD40E
 005CD1C3    mov         eax,dword ptr [esi]
 005CD1C5    add         eax,10
 005CD1C8    push        eax
 005CD1C9    lea         eax,[ebp-0C]
 005CD1CC    mov         edx,dword ptr [esi]
 005CD1CE    add         edx,20
 005CD1D1    call        @VarToWStr
 005CD1D6    mov         eax,dword ptr [ebp-0C]
 005CD1D9    push        eax
 005CD1DA    mov         eax,dword ptr [esi]
 005CD1DC    add         eax,30
 005CD1DF    call        @VarToInteger
 005CD1E4    push        eax
 005CD1E5    mov         eax,dword ptr [esi]
 005CD1E7    call        @VarToInteger
 005CD1EC    mov         ecx,eax
 005CD1EE    mov         edx,ebx
 005CD1F0    mov         eax,dword ptr [ebx+9C];TSpInProcRecoContext.?f9C:TSpeechRecogniser
 005CD1F6    call        dword ptr [ebx+98];TSpInProcRecoContext.FOnPropertyNumberChange
>005CD1FC    jmp         005CD40E
 005CD201    cmp         word ptr [ebx+0A2],0;TSpInProcRecoContext.?fA2:word
>005CD209    je          005CD40E
 005CD20F    mov         eax,dword ptr [esi]
 005CD211    add         eax,10
 005CD214    push        eax
 005CD215    lea         eax,[ebp-10]
 005CD218    mov         edx,dword ptr [esi]
 005CD21A    add         edx,20
 005CD21D    call        @VarToWStr
 005CD222    mov         eax,dword ptr [ebp-10]
 005CD225    push        eax
 005CD226    lea         eax,[ebp-14]
 005CD229    mov         edx,dword ptr [esi]
 005CD22B    add         edx,30
 005CD22E    call        @VarToWStr
 005CD233    mov         eax,dword ptr [ebp-14]
 005CD236    push        eax
 005CD237    mov         eax,dword ptr [esi]
 005CD239    call        @VarToInteger
 005CD23E    mov         ecx,eax
 005CD240    mov         edx,ebx
 005CD242    mov         eax,dword ptr [ebx+0A4];TSpInProcRecoContext.?fA4:TSpeechRecogniser
 005CD248    call        dword ptr [ebx+0A0];TSpInProcRecoContext.FOnPropertyStringChange
>005CD24E    jmp         005CD40E
 005CD253    cmp         word ptr [ebx+0AA],0;TSpInProcRecoContext.?fAA:word
>005CD25B    je          005CD40E
 005CD261    mov         eax,dword ptr [esi]
 005CD263    add         eax,10
 005CD266    push        eax
 005CD267    lea         eax,[ebp-18]
 005CD26A    mov         edx,dword ptr [esi]
 005CD26C    mov         edx,dword ptr [edx+28]
 005CD26F    mov         ecx,5CD45C;['{ED2879CF-CED9-4EE6-A534-DE0191D5468D}']
 005CD274    call        @IntfCast
 005CD279    mov         eax,dword ptr [ebp-18]
 005CD27C    push        eax
 005CD27D    mov         eax,dword ptr [esi]
 005CD27F    call        @VarToInteger
 005CD284    mov         ecx,eax
 005CD286    mov         edx,ebx
 005CD288    mov         eax,dword ptr [ebx+0AC];TSpInProcRecoContext.?fAC:TSpeechRecogniser
 005CD28E    call        dword ptr [ebx+0A8];TSpInProcRecoContext.FOnFalseRecognition
>005CD294    jmp         005CD40E
 005CD299    cmp         word ptr [ebx+0B2],0;TSpInProcRecoContext.?fB2:word
>005CD2A1    je          005CD40E
 005CD2A7    mov         eax,dword ptr [esi]
 005CD2A9    add         eax,10
 005CD2AC    push        eax
 005CD2AD    mov         eax,dword ptr [esi]
 005CD2AF    add         eax,20
 005CD2B2    call        @VarToInt64
 005CD2B7    push        eax
 005CD2B8    mov         eax,dword ptr [esi]
 005CD2BA    call        @VarToInteger
 005CD2BF    mov         ecx,eax
 005CD2C1    mov         edx,ebx
 005CD2C3    mov         eax,dword ptr [ebx+0B4];TSpInProcRecoContext.?fB4:TSpeechRecogniser
 005CD2C9    call        dword ptr [ebx+0B0];TSpInProcRecoContext.FOnInterference
>005CD2CF    jmp         005CD40E
 005CD2D4    cmp         word ptr [ebx+0BA],0;TSpInProcRecoContext.?fBA:word
>005CD2DC    je          005CD40E
 005CD2E2    mov         eax,dword ptr [esi]
 005CD2E4    add         eax,10
 005CD2E7    push        eax
 005CD2E8    lea         eax,[ebp-1C]
 005CD2EB    mov         edx,dword ptr [esi]
 005CD2ED    add         edx,20
 005CD2F0    call        @VarToWStr
 005CD2F5    mov         eax,dword ptr [ebp-1C]
 005CD2F8    push        eax
 005CD2F9    mov         eax,dword ptr [esi]
 005CD2FB    call        @VarToInteger
 005CD300    mov         ecx,eax
 005CD302    mov         edx,ebx
 005CD304    mov         eax,dword ptr [ebx+0BC];TSpInProcRecoContext.?fBC:TSpeechRecogniser
 005CD30A    call        dword ptr [ebx+0B8];TSpInProcRecoContext.FOnRequestUI
>005CD310    jmp         005CD40E
 005CD315    cmp         word ptr [ebx+0C2],0;TSpInProcRecoContext.?fC2:word
>005CD31D    je          005CD40E
 005CD323    mov         eax,dword ptr [esi]
 005CD325    add         eax,10
 005CD328    push        eax
 005CD329    mov         eax,dword ptr [esi]
 005CD32B    add         eax,20
 005CD32E    call        @VarToInt64
 005CD333    push        eax
 005CD334    mov         eax,dword ptr [esi]
 005CD336    call        @VarToInteger
 005CD33B    mov         ecx,eax
 005CD33D    mov         edx,ebx
 005CD33F    mov         eax,dword ptr [ebx+0C4];TSpInProcRecoContext.?fC4:TSpeechRecogniser
 005CD345    call        dword ptr [ebx+0C0];TSpInProcRecoContext.FOnRecognizerStateChange
>005CD34B    jmp         005CD40E
 005CD350    cmp         word ptr [ebx+0CA],0;TSpInProcRecoContext.?fCA:word
>005CD358    je          005CD40E
 005CD35E    mov         eax,dword ptr [esi]
 005CD360    add         eax,10
 005CD363    push        eax
 005CD364    mov         eax,dword ptr [esi]
 005CD366    call        @VarToInteger
 005CD36B    mov         ecx,eax
 005CD36D    mov         edx,ebx
 005CD36F    mov         eax,dword ptr [ebx+0CC];TSpInProcRecoContext.?fCC:TSpeechRecogniser
 005CD375    call        dword ptr [ebx+0C8];TSpInProcRecoContext.FOnAdaptation
>005CD37B    jmp         005CD40E
 005CD380    cmp         word ptr [ebx+0D2],0;TSpInProcRecoContext.?fD2:word
>005CD388    je          005CD40E
 005CD38E    mov         eax,dword ptr [esi]
 005CD390    add         eax,10
 005CD393    push        eax
 005CD394    mov         eax,dword ptr [esi]
 005CD396    call        @VarToInteger
 005CD39B    mov         ecx,eax
 005CD39D    mov         edx,ebx
 005CD39F    mov         eax,dword ptr [ebx+0D4];TSpInProcRecoContext.?fD4:TSpeechRecogniser
 005CD3A5    call        dword ptr [ebx+0D0];TSpInProcRecoContext.FOnRecognitionForOtherContext
>005CD3AB    jmp         005CD40E
 005CD3AD    cmp         word ptr [ebx+0DA],0;TSpInProcRecoContext.?fDA:word
>005CD3B5    je          005CD40E
 005CD3B7    mov         eax,dword ptr [esi]
 005CD3B9    add         eax,10
 005CD3BC    push        eax
 005CD3BD    mov         eax,dword ptr [esi]
 005CD3BF    add         eax,20
 005CD3C2    call        @VarToInteger
 005CD3C7    push        eax
 005CD3C8    mov         eax,dword ptr [esi]
 005CD3CA    call        @VarToInteger
 005CD3CF    mov         ecx,eax
 005CD3D1    mov         edx,ebx
 005CD3D3    mov         eax,dword ptr [ebx+0DC];TSpInProcRecoContext.?fDC:TSpeechRecogniser
 005CD3D9    call        dword ptr [ebx+0D8];TSpInProcRecoContext.FOnAudioLevel
>005CD3DF    jmp         005CD40E
 005CD3E1    cmp         word ptr [ebx+0E2],0;TSpInProcRecoContext.?fE2:word
>005CD3E9    je          005CD40E
 005CD3EB    mov         eax,dword ptr [esi]
 005CD3ED    add         eax,10
 005CD3F0    push        eax
 005CD3F1    mov         eax,dword ptr [esi]
 005CD3F3    add         eax,20
 005CD3F6    push        eax
 005CD3F7    mov         eax,dword ptr [esi]
 005CD3F9    call        @VarToInteger
 005CD3FE    mov         ecx,eax
 005CD400    mov         edx,ebx
 005CD402    mov         eax,dword ptr [ebx+0E4];TSpInProcRecoContext.?fE4:TSpeechRecogniser
 005CD408    call        dword ptr [ebx+0E0];TSpInProcRecoContext.FOnEnginePrivate
 005CD40E    xor         eax,eax
 005CD410    pop         edx
 005CD411    pop         ecx
 005CD412    pop         ecx
 005CD413    mov         dword ptr fs:[eax],edx
 005CD416    push        5CD453
 005CD41B    lea         eax,[ebp-1C]
 005CD41E    call        @WStrClr
 005CD423    lea         eax,[ebp-18]
 005CD426    call        @IntfClear
 005CD42B    lea         eax,[ebp-14]
 005CD42E    mov         edx,3
 005CD433    call        @WStrArrayClr
 005CD438    lea         eax,[ebp-8]
 005CD43B    mov         edx,dword ptr ds:[5C5928];ISpeechRecoResult
 005CD441    mov         ecx,2
 005CD446    call        @FinalizeArray
 005CD44B    ret
>005CD44C    jmp         @HandleFinally
>005CD451    jmp         005CD41B
 005CD453    pop         esi
 005CD454    pop         ebx
 005CD455    mov         esp,ebp
 005CD457    pop         ebp
 005CD458    ret
end;*}

//005CD46C
{*procedure sub_005CD46C(?:TSpInProcRecoContext; ?:?);
begin
 005CD46C    push        ebp
 005CD46D    mov         ebp,esp
 005CD46F    push        0
 005CD471    push        ebx
 005CD472    push        esi
 005CD473    mov         esi,edx
 005CD475    mov         ebx,eax
 005CD477    xor         eax,eax
 005CD479    push        ebp
 005CD47A    push        5CD4BB
 005CD47F    push        dword ptr fs:[eax]
 005CD482    mov         dword ptr fs:[eax],esp
 005CD485    mov         eax,esi
 005CD487    call        @IntfClear
 005CD48C    push        eax
 005CD48D    lea         edx,[ebp-4]
 005CD490    mov         eax,ebx
 005CD492    call        005CCEFC
 005CD497    mov         eax,dword ptr [ebp-4]
 005CD49A    push        eax
 005CD49B    mov         eax,dword ptr [eax]
 005CD49D    call        dword ptr [eax+1C]
 005CD4A0    call        @CheckAutoResult
 005CD4A5    xor         eax,eax
 005CD4A7    pop         edx
 005CD4A8    pop         ecx
 005CD4A9    pop         ecx
 005CD4AA    mov         dword ptr fs:[eax],edx
 005CD4AD    push        5CD4C2
 005CD4B2    lea         eax,[ebp-4]
 005CD4B5    call        @IntfClear
 005CD4BA    ret
>005CD4BB    jmp         @HandleFinally
>005CD4C0    jmp         005CD4B2
 005CD4C2    pop         esi
 005CD4C3    pop         ebx
 005CD4C4    pop         ecx
 005CD4C5    pop         ebp
 005CD4C6    ret
end;*}

//005CD7C8
{*procedure sub_005CD7C8(?:TSpInProcRecoContext; ?:?);
begin
 005CD7C8    push        ebp
 005CD7C9    mov         ebp,esp
 005CD7CB    push        0
 005CD7CD    push        ebx
 005CD7CE    push        esi
 005CD7CF    mov         esi,edx
 005CD7D1    mov         ebx,eax
 005CD7D3    xor         eax,eax
 005CD7D5    push        ebp
 005CD7D6    push        5CD810
 005CD7DB    push        dword ptr fs:[eax]
 005CD7DE    mov         dword ptr fs:[eax],esp
 005CD7E1    push        esi
 005CD7E2    lea         edx,[ebp-4]
 005CD7E5    mov         eax,ebx
 005CD7E7    call        005CCEFC
 005CD7EC    mov         eax,dword ptr [ebp-4]
 005CD7EF    push        eax
 005CD7F0    mov         eax,dword ptr [eax]
 005CD7F2    call        dword ptr [eax+40]
 005CD7F5    call        @CheckAutoResult
 005CD7FA    xor         eax,eax
 005CD7FC    pop         edx
 005CD7FD    pop         ecx
 005CD7FE    pop         ecx
 005CD7FF    mov         dword ptr fs:[eax],edx
 005CD802    push        5CD817
 005CD807    lea         eax,[ebp-4]
 005CD80A    call        @IntfClear
 005CD80F    ret
>005CD810    jmp         @HandleFinally
>005CD815    jmp         005CD807
 005CD817    pop         esi
 005CD818    pop         ebx
 005CD819    pop         ecx
 005CD81A    pop         ebp
 005CD81B    ret
end;*}

//005CDB80
procedure TSpInProcRecoContext.Pause;
begin
{*
 005CDB80    push        ebp
 005CDB81    mov         ebp,esp
 005CDB83    push        0
 005CDB85    push        ebx
 005CDB86    mov         ebx,eax
 005CDB88    xor         eax,eax
 005CDB8A    push        ebp
 005CDB8B    push        5CDBC4
 005CDB90    push        dword ptr fs:[eax]
 005CDB93    mov         dword ptr fs:[eax],esp
 005CDB96    lea         edx,[ebp-4]
 005CDB99    mov         eax,ebx
 005CDB9B    call        005CCEFC
 005CDBA0    mov         eax,dword ptr [ebp-4]
 005CDBA3    push        eax
 005CDBA4    mov         eax,dword ptr [eax]
 005CDBA6    call        dword ptr [eax+68]
 005CDBA9    call        @CheckAutoResult
 005CDBAE    xor         eax,eax
 005CDBB0    pop         edx
 005CDBB1    pop         ecx
 005CDBB2    pop         ecx
 005CDBB3    mov         dword ptr fs:[eax],edx
 005CDBB6    push        5CDBCB
 005CDBBB    lea         eax,[ebp-4]
 005CDBBE    call        @IntfClear
 005CDBC3    ret
>005CDBC4    jmp         @HandleFinally
>005CDBC9    jmp         005CDBBB
 005CDBCB    pop         ebx
 005CDBCC    pop         ecx
 005CDBCD    pop         ebp
 005CDBCE    ret
*}
end;

//005CDBD0
procedure TSpInProcRecoContext.Resume;
begin
{*
 005CDBD0    push        ebp
 005CDBD1    mov         ebp,esp
 005CDBD3    push        0
 005CDBD5    push        ebx
 005CDBD6    mov         ebx,eax
 005CDBD8    xor         eax,eax
 005CDBDA    push        ebp
 005CDBDB    push        5CDC14
 005CDBE0    push        dword ptr fs:[eax]
 005CDBE3    mov         dword ptr fs:[eax],esp
 005CDBE6    lea         edx,[ebp-4]
 005CDBE9    mov         eax,ebx
 005CDBEB    call        005CCEFC
 005CDBF0    mov         eax,dword ptr [ebp-4]
 005CDBF3    push        eax
 005CDBF4    mov         eax,dword ptr [eax]
 005CDBF6    call        dword ptr [eax+6C]
 005CDBF9    call        @CheckAutoResult
 005CDBFE    xor         eax,eax
 005CDC00    pop         edx
 005CDC01    pop         ecx
 005CDC02    pop         ecx
 005CDC03    mov         dword ptr fs:[eax],edx
 005CDC06    push        5CDC1B
 005CDC0B    lea         eax,[ebp-4]
 005CDC0E    call        @IntfClear
 005CDC13    ret
>005CDC14    jmp         @HandleFinally
>005CDC19    jmp         005CDC0B
 005CDC1B    pop         ebx
 005CDC1C    pop         ecx
 005CDC1D    pop         ebp
 005CDC1E    ret
*}
end;

//005CDC20
{*procedure TSpInProcRecoContext.CreateGrammar(?:?);
begin
 005CDC20    push        ebp
 005CDC21    mov         ebp,esp
 005CDC23    push        0
 005CDC25    push        ebx
 005CDC26    push        esi
 005CDC27    mov         esi,edx
 005CDC29    mov         ebx,eax
 005CDC2B    xor         eax,eax
 005CDC2D    push        ebp
 005CDC2E    push        5CDC7F
 005CDC33    push        dword ptr fs:[eax]
 005CDC36    mov         dword ptr fs:[eax],esp
 005CDC39    mov         eax,esi
 005CDC3B    call        @IntfClear
 005CDC40    push        eax
 005CDC41    mov         eax,[0078CDF8];^gvar_00792F78
 005CDC46    push        dword ptr [eax+0C]
 005CDC49    push        dword ptr [eax+8]
 005CDC4C    push        dword ptr [eax+4]
 005CDC4F    push        dword ptr [eax]
 005CDC51    lea         edx,[ebp-4]
 005CDC54    mov         eax,ebx
 005CDC56    call        005CCEFC
 005CDC5B    mov         eax,dword ptr [ebp-4]
 005CDC5E    push        eax
 005CDC5F    mov         eax,dword ptr [eax]
 005CDC61    call        dword ptr [eax+70]
 005CDC64    call        @CheckAutoResult
 005CDC69    xor         eax,eax
 005CDC6B    pop         edx
 005CDC6C    pop         ecx
 005CDC6D    pop         ecx
 005CDC6E    mov         dword ptr fs:[eax],edx
 005CDC71    push        5CDC86
 005CDC76    lea         eax,[ebp-4]
 005CDC79    call        @IntfClear
 005CDC7E    ret
>005CDC7F    jmp         @HandleFinally
>005CDC84    jmp         005CDC76
 005CDC86    pop         esi
 005CDC87    pop         ebx
 005CDC88    pop         ecx
 005CDC89    pop         ebp
 005CDC8A    ret
end;*}

//005CDC8C
{*procedure TSpInProcRecoContext.CreateGrammar(GrammarId:OleVariant; ?:?);
begin
 005CDC8C    push        ebp
 005CDC8D    mov         ebp,esp
 005CDC8F    add         esp,0FFFFFFEC
 005CDC92    push        ebx
 005CDC93    push        esi
 005CDC94    push        edi
 005CDC95    xor         ebx,ebx
 005CDC97    mov         dword ptr [ebp-14],ebx
 005CDC9A    mov         esi,edx
 005CDC9C    lea         edi,[ebp-10]
 005CDC9F    movs        dword ptr [edi],dword ptr [esi]
 005CDCA0    movs        dword ptr [edi],dword ptr [esi]
 005CDCA1    movs        dword ptr [edi],dword ptr [esi]
 005CDCA2    movs        dword ptr [edi],dword ptr [esi]
 005CDCA3    mov         esi,ecx
 005CDCA5    mov         ebx,eax
 005CDCA7    lea         eax,[ebp-10]
 005CDCAA    call        @VarAddRef
 005CDCAF    xor         eax,eax
 005CDCB1    push        ebp
 005CDCB2    push        5CDD07
 005CDCB7    push        dword ptr fs:[eax]
 005CDCBA    mov         dword ptr fs:[eax],esp
 005CDCBD    mov         eax,esi
 005CDCBF    call        @IntfClear
 005CDCC4    push        eax
 005CDCC5    push        dword ptr [ebp-4]
 005CDCC8    push        dword ptr [ebp-8]
 005CDCCB    push        dword ptr [ebp-0C]
 005CDCCE    push        dword ptr [ebp-10]
 005CDCD1    lea         edx,[ebp-14]
 005CDCD4    mov         eax,ebx
 005CDCD6    call        005CCEFC
 005CDCDB    mov         eax,dword ptr [ebp-14]
 005CDCDE    push        eax
 005CDCDF    mov         eax,dword ptr [eax]
 005CDCE1    call        dword ptr [eax+70]
 005CDCE4    call        @CheckAutoResult
 005CDCE9    xor         eax,eax
 005CDCEB    pop         edx
 005CDCEC    pop         ecx
 005CDCED    pop         ecx
 005CDCEE    mov         dword ptr fs:[eax],edx
 005CDCF1    push        5CDD0E
 005CDCF6    lea         eax,[ebp-14]
 005CDCF9    call        @IntfClear
 005CDCFE    lea         eax,[ebp-10]
 005CDD01    call        @VarClr
 005CDD06    ret
>005CDD07    jmp         @HandleFinally
>005CDD0C    jmp         005CDCF6
 005CDD0E    pop         edi
 005CDD0F    pop         esi
 005CDD10    pop         ebx
 005CDD11    mov         esp,ebp
 005CDD13    pop         ebp
 005CDD14    ret
end;*}

//005CDD18
{*procedure TSpInProcRecoContext.CreateResultFromMemory(var ResultBlock:OleVariant; ?:?);
begin
 005CDD18    push        ebp
 005CDD19    mov         ebp,esp
 005CDD1B    push        0
 005CDD1D    push        ebx
 005CDD1E    push        esi
 005CDD1F    push        edi
 005CDD20    mov         edi,ecx
 005CDD22    mov         esi,edx
 005CDD24    mov         ebx,eax
 005CDD26    xor         eax,eax
 005CDD28    push        ebp
 005CDD29    push        5CDD6B
 005CDD2E    push        dword ptr fs:[eax]
 005CDD31    mov         dword ptr fs:[eax],esp
 005CDD34    mov         eax,edi
 005CDD36    call        @IntfClear
 005CDD3B    push        eax
 005CDD3C    push        esi
 005CDD3D    lea         edx,[ebp-4]
 005CDD40    mov         eax,ebx
 005CDD42    call        005CCEFC
 005CDD47    mov         eax,dword ptr [ebp-4]
 005CDD4A    push        eax
 005CDD4B    mov         eax,dword ptr [eax]
 005CDD4D    call        dword ptr [eax+74]
 005CDD50    call        @CheckAutoResult
 005CDD55    xor         eax,eax
 005CDD57    pop         edx
 005CDD58    pop         ecx
 005CDD59    pop         ecx
 005CDD5A    mov         dword ptr fs:[eax],edx
 005CDD5D    push        5CDD72
 005CDD62    lea         eax,[ebp-4]
 005CDD65    call        @IntfClear
 005CDD6A    ret
>005CDD6B    jmp         @HandleFinally
>005CDD70    jmp         005CDD62
 005CDD72    pop         edi
 005CDD73    pop         esi
 005CDD74    pop         ebx
 005CDD75    pop         ecx
 005CDD76    pop         ebp
 005CDD77    ret
end;*}

//005CDD78
procedure TSpInProcRecoContext.Bookmark(Options:TOleEnum; StreamPos:OleVariant; BookmarkId:OleVariant);
begin
{*
 005CDD78    push        ebp
 005CDD79    mov         ebp,esp
 005CDD7B    add         esp,0FFFFFFDC
 005CDD7E    push        ebx
 005CDD7F    push        esi
 005CDD80    push        edi
 005CDD81    xor         ebx,ebx
 005CDD83    mov         dword ptr [ebp-24],ebx
 005CDD86    mov         esi,dword ptr [ebp+8]
 005CDD89    lea         edi,[ebp-20]
 005CDD8C    movs        dword ptr [edi],dword ptr [esi]
 005CDD8D    movs        dword ptr [edi],dword ptr [esi]
 005CDD8E    movs        dword ptr [edi],dword ptr [esi]
 005CDD8F    movs        dword ptr [edi],dword ptr [esi]
 005CDD90    mov         esi,ecx
 005CDD92    lea         edi,[ebp-10]
 005CDD95    movs        dword ptr [edi],dword ptr [esi]
 005CDD96    movs        dword ptr [edi],dword ptr [esi]
 005CDD97    movs        dword ptr [edi],dword ptr [esi]
 005CDD98    movs        dword ptr [edi],dword ptr [esi]
 005CDD99    mov         esi,edx
 005CDD9B    mov         ebx,eax
 005CDD9D    lea         eax,[ebp-10]
 005CDDA0    call        @VarAddRef
 005CDDA5    lea         eax,[ebp-20]
 005CDDA8    call        @VarAddRef
 005CDDAD    xor         eax,eax
 005CDDAF    push        ebp
 005CDDB0    push        5CDE15
 005CDDB5    push        dword ptr fs:[eax]
 005CDDB8    mov         dword ptr fs:[eax],esp
 005CDDBB    push        dword ptr [ebp-14]
 005CDDBE    push        dword ptr [ebp-18]
 005CDDC1    push        dword ptr [ebp-1C]
 005CDDC4    push        dword ptr [ebp-20]
 005CDDC7    push        dword ptr [ebp-4]
 005CDDCA    push        dword ptr [ebp-8]
 005CDDCD    push        dword ptr [ebp-0C]
 005CDDD0    push        dword ptr [ebp-10]
 005CDDD3    push        esi
 005CDDD4    lea         edx,[ebp-24]
 005CDDD7    mov         eax,ebx
 005CDDD9    call        005CCEFC
 005CDDDE    mov         eax,dword ptr [ebp-24]
 005CDDE1    push        eax
 005CDDE2    mov         eax,dword ptr [eax]
 005CDDE4    call        dword ptr [eax+78]
 005CDDE7    call        @CheckAutoResult
 005CDDEC    xor         eax,eax
 005CDDEE    pop         edx
 005CDDEF    pop         ecx
 005CDDF0    pop         ecx
 005CDDF1    mov         dword ptr fs:[eax],edx
 005CDDF4    push        5CDE1C
 005CDDF9    lea         eax,[ebp-24]
 005CDDFC    call        @IntfClear
 005CDE01    lea         eax,[ebp-20]
 005CDE04    mov         edx,dword ptr ds:[4012D4];OleVariant
 005CDE0A    mov         ecx,2
 005CDE0F    call        @FinalizeArray
 005CDE14    ret
>005CDE15    jmp         @HandleFinally
>005CDE1A    jmp         005CDDF9
 005CDE1C    pop         edi
 005CDE1D    pop         esi
 005CDE1E    pop         ebx
 005CDE1F    mov         esp,ebp
 005CDE21    pop         ebp
 005CDE22    ret         4
*}
end;

//005CDE28
procedure TSpInProcRecoContext.SetAdaptationData(AdaptationString:WideString);
begin
{*
 005CDE28    push        ebp
 005CDE29    mov         ebp,esp
 005CDE2B    push        0
 005CDE2D    push        ebx
 005CDE2E    push        esi
 005CDE2F    mov         esi,edx
 005CDE31    mov         ebx,eax
 005CDE33    xor         eax,eax
 005CDE35    push        ebp
 005CDE36    push        5CDE70
 005CDE3B    push        dword ptr fs:[eax]
 005CDE3E    mov         dword ptr fs:[eax],esp
 005CDE41    push        esi
 005CDE42    lea         edx,[ebp-4]
 005CDE45    mov         eax,ebx
 005CDE47    call        005CCEFC
 005CDE4C    mov         eax,dword ptr [ebp-4]
 005CDE4F    push        eax
 005CDE50    mov         eax,dword ptr [eax]
 005CDE52    call        dword ptr [eax+7C]
 005CDE55    call        @CheckAutoResult
 005CDE5A    xor         eax,eax
 005CDE5C    pop         edx
 005CDE5D    pop         ecx
 005CDE5E    pop         ecx
 005CDE5F    mov         dword ptr fs:[eax],edx
 005CDE62    push        5CDE77
 005CDE67    lea         eax,[ebp-4]
 005CDE6A    call        @IntfClear
 005CDE6F    ret
>005CDE70    jmp         @HandleFinally
>005CDE75    jmp         005CDE67
 005CDE77    pop         esi
 005CDE78    pop         ebx
 005CDE79    pop         ecx
 005CDE7A    pop         ebp
 005CDE7B    ret
*}
end;

//005CE228
procedure sub_005CE228;
begin
{*
 005CE228    mov         byte ptr ds:[78A038],0;gvar_0078A038
 005CE22F    ret
*}
end;

//005CE230
procedure sub_005CE230;
begin
{*
 005CE230    ret
*}
end;

//005CE234
{*function sub_005CE234(?:UnicodeString):?;
begin
 005CE234    push        ebp
 005CE235    mov         ebp,esp
 005CE237    push        ecx
 005CE238    push        ebx
 005CE239    mov         dword ptr [ebp-4],eax
 005CE23C    mov         eax,dword ptr [ebp-4]
 005CE23F    call        @UStrAddRef
 005CE244    xor         eax,eax
 005CE246    push        ebp
 005CE247    push        5CE277
 005CE24C    push        dword ptr fs:[eax]
 005CE24F    mov         dword ptr fs:[eax],esp
 005CE252    mov         edx,dword ptr [ebp-4]
 005CE255    mov         eax,[008155EC];gvar_008155EC:THashTable
 005CE25A    call        THashTable.Get
 005CE25F    mov         ebx,eax
 005CE261    xor         eax,eax
 005CE263    pop         edx
 005CE264    pop         ecx
 005CE265    pop         ecx
 005CE266    mov         dword ptr fs:[eax],edx
 005CE269    push        5CE27E
 005CE26E    lea         eax,[ebp-4]
 005CE271    call        @UStrClr
 005CE276    ret
>005CE277    jmp         @HandleFinally
>005CE27C    jmp         005CE26E
 005CE27E    mov         eax,ebx
 005CE280    pop         ebx
 005CE281    pop         ecx
 005CE282    pop         ebp
 005CE283    ret
end;*}

//005CE284
{*procedure sub_005CE284(?:Integer; ?:?);
begin
 005CE284    push        ebx
 005CE285    push        esi
 005CE286    mov         esi,edx
 005CE288    mov         ebx,eax
 005CE28A    mov         ecx,esi
 005CE28C    mov         edx,ebx
 005CE28E    mov         eax,[008155EC];gvar_008155EC:THashTable
 005CE293    call        THashTable.Get
 005CE298    pop         esi
 005CE299    pop         ebx
 005CE29A    ret
end;*}

//005CE29C
procedure sub_005CE29C;
begin
{*
 005CE29C    push        ebx
 005CE29D    mov         ebx,8155E8;gvar_008155E8:THashTable
 005CE2A2    mov         ecx,1
 005CE2A7    mov         edx,5CE900;'Sam'
 005CE2AC    mov         eax,dword ptr [ebx]
 005CE2AE    call        THashTable.Add
 005CE2B3    mov         ecx,2
 005CE2B8    mov         edx,5CE914;'Mike'
 005CE2BD    mov         eax,dword ptr [ebx]
 005CE2BF    call        THashTable.Add
 005CE2C4    mov         ecx,3
 005CE2C9    mov         edx,5CE92C;'Mary'
 005CE2CE    mov         eax,dword ptr [ebx]
 005CE2D0    call        THashTable.Add
 005CE2D5    mov         ecx,4
 005CE2DA    mov         edx,5CE944;'FemaleWhisper'
 005CE2DF    mov         eax,dword ptr [ebx]
 005CE2E1    call        THashTable.Add
 005CE2E6    mov         ecx,5
 005CE2EB    mov         edx,5CE96C;'MaleWhisper'
 005CE2F0    mov         eax,dword ptr [ebx]
 005CE2F2    call        THashTable.Add
 005CE2F7    mov         ecx,6
 005CE2FC    mov         edx,5CE990;'MikeSpace'
 005CE301    mov         eax,dword ptr [ebx]
 005CE303    call        THashTable.Add
 005CE308    mov         ecx,7
 005CE30D    mov         edx,5CE9B0;'MikeHall'
 005CE312    mov         eax,dword ptr [ebx]
 005CE314    call        THashTable.Add
 005CE319    mov         ecx,8
 005CE31E    mov         edx,5CE9D0;'MikeStadium'
 005CE323    mov         eax,dword ptr [ebx]
 005CE325    call        THashTable.Add
 005CE32A    mov         ecx,9
 005CE32F    mov         edx,5CE9F4;'MarySpace'
 005CE334    mov         eax,dword ptr [ebx]
 005CE336    call        THashTable.Add
 005CE33B    mov         ecx,0A
 005CE340    mov         edx,5CEA14;'MaryHall'
 005CE345    mov         eax,dword ptr [ebx]
 005CE347    call        THashTable.Add
 005CE34C    mov         ecx,0B
 005CE351    mov         edx,5CEA34;'MaryStadium'
 005CE356    mov         eax,dword ptr [ebx]
 005CE358    call        THashTable.Add
 005CE35D    mov         ecx,0C
 005CE362    mov         edx,5CEA58;'RoboSoft1'
 005CE367    mov         eax,dword ptr [ebx]
 005CE369    call        THashTable.Add
 005CE36E    mov         ecx,0D
 005CE373    mov         edx,5CEA78;'RoboSoft2'
 005CE378    mov         eax,dword ptr [ebx]
 005CE37A    call        THashTable.Add
 005CE37F    mov         ecx,0E
 005CE384    mov         edx,5CEA98;'RoboSoft3'
 005CE389    mov         eax,dword ptr [ebx]
 005CE38B    call        THashTable.Add
 005CE390    mov         ecx,0F
 005CE395    mov         edx,5CEAB8;'RoboSoft4'
 005CE39A    mov         eax,dword ptr [ebx]
 005CE39C    call        THashTable.Add
 005CE3A1    mov         ecx,10
 005CE3A6    mov         edx,5CEAD8;'RoboSoft5'
 005CE3AB    mov         eax,dword ptr [ebx]
 005CE3AD    call        THashTable.Add
 005CE3B2    mov         ecx,11
 005CE3B7    mov         edx,5CEAF8;'RoboSoft6'
 005CE3BC    mov         eax,dword ptr [ebx]
 005CE3BE    call        THashTable.Add
 005CE3C3    mov         ecx,12
 005CE3C8    mov         edx,5CEB18;'AdultMale1'
 005CE3CD    mov         eax,dword ptr [ebx]
 005CE3CF    call        THashTable.Add
 005CE3D4    mov         ecx,13
 005CE3D9    mov         edx,5CEB3C;'AdultMale2'
 005CE3DE    mov         eax,dword ptr [ebx]
 005CE3E0    call        THashTable.Add
 005CE3E5    mov         ecx,14
 005CE3EA    mov         edx,5CEB60;'AdultMale3'
 005CE3EF    mov         eax,dword ptr [ebx]
 005CE3F1    call        THashTable.Add
 005CE3F6    mov         ecx,15
 005CE3FB    mov         edx,5CEB84;'AdultMale4'
 005CE400    mov         eax,dword ptr [ebx]
 005CE402    call        THashTable.Add
 005CE407    mov         ecx,16
 005CE40C    mov         edx,5CEBA8;'AdultMale5'
 005CE411    mov         eax,dword ptr [ebx]
 005CE413    call        THashTable.Add
 005CE418    mov         ecx,17
 005CE41D    mov         edx,5CEBCC;'AdultMale6'
 005CE422    mov         eax,dword ptr [ebx]
 005CE424    call        THashTable.Add
 005CE429    mov         ecx,18
 005CE42E    mov         edx,5CEBF0;'AdultMale7'
 005CE433    mov         eax,dword ptr [ebx]
 005CE435    call        THashTable.Add
 005CE43A    mov         ecx,19
 005CE43F    mov         edx,5CEC14;'AdultMale8'
 005CE444    mov         eax,dword ptr [ebx]
 005CE446    call        THashTable.Add
 005CE44B    mov         ecx,1A
 005CE450    mov         edx,5CEC38;'AdultFemale1'
 005CE455    mov         eax,dword ptr [ebx]
 005CE457    call        THashTable.Add
 005CE45C    mov         ecx,1B
 005CE461    mov         edx,5CEC60;'AdultFemale2'
 005CE466    mov         eax,dword ptr [ebx]
 005CE468    call        THashTable.Add
 005CE46D    mov         ecx,1C
 005CE472    mov         edx,5CEC88;'BritishMale1'
 005CE477    mov         eax,dword ptr [ebx]
 005CE479    call        THashTable.Add
 005CE47E    mov         ecx,1D
 005CE483    mov         edx,5CECB0;'BritishFemale1'
 005CE488    mov         eax,dword ptr [ebx]
 005CE48A    call        THashTable.Add
 005CE48F    mov         ecx,1E
 005CE494    mov         edx,5CECDC;'Kal'
 005CE499    mov         eax,dword ptr [ebx]
 005CE49B    call        THashTable.Add
 005CE4A0    mov         ecx,1F
 005CE4A5    mov         edx,5CECF0;'Michael'
 005CE4AA    mov         eax,dword ptr [ebx]
 005CE4AC    call        THashTable.Add
 005CE4B1    mov         ecx,20
 005CE4B6    mov         edx,5CED0C;'Michelle'
 005CE4BB    mov         eax,dword ptr [ebx]
 005CE4BD    call        THashTable.Add
 005CE4C2    mov         ecx,21
 005CE4C7    mov         edx,5CED2C;'David'
 005CE4CC    mov         eax,dword ptr [ebx]
 005CE4CE    call        THashTable.Add
 005CE4D3    mov         ecx,22
 005CE4D8    mov         edx,5CED44;^338:Single
 005CE4DD    mov         eax,dword ptr [ebx]
 005CE4DF    call        THashTable.Add
 005CE4E4    mov         ecx,23
 005CE4E9    mov         edx,5CED60;'William'
 005CE4EE    mov         eax,dword ptr [ebx]
 005CE4F0    call        THashTable.Add
 005CE4F5    mov         ecx,24
 005CE4FA    mov         edx,5CED7C;'Amy'
 005CE4FF    mov         eax,dword ptr [ebx]
 005CE501    call        THashTable.Add
 005CE506    mov         ecx,25
 005CE50B    mov         edx,5CED90;'Frank'
 005CE510    mov         eax,dword ptr [ebx]
 005CE512    call        THashTable.Add
 005CE517    mov         ecx,26
 005CE51C    mov         edx,5CEDA8;'Emily'
 005CE521    mov         eax,dword ptr [ebx]
 005CE523    call        THashTable.Add
 005CE528    mov         ecx,27
 005CE52D    mov         edx,5CEDC0;'Duncan'
 005CE532    mov         eax,dword ptr [ebx]
 005CE534    call        THashTable.Add
 005CE539    mov         ecx,28
 005CE53E    mov         edx,5CEDDC;'Linda'
 005CE543    mov         eax,dword ptr [ebx]
 005CE545    call        THashTable.Add
 005CE54A    mov         ecx,29
 005CE54F    mov         edx,5CEDF4;'Robin'
 005CE554    mov         eax,dword ptr [ebx]
 005CE556    call        THashTable.Add
 005CE55B    mov         ecx,2A
 005CE560    mov         edx,5CEE0C;'Walter'
 005CE565    mov         eax,dword ptr [ebx]
 005CE567    call        THashTable.Add
 005CE56C    mov         ecx,31
 005CE571    mov         edx,5CEE28;'Lawrence'
 005CE576    mov         eax,dword ptr [ebx]
 005CE578    call        THashTable.Add
 005CE57D    mov         ecx,32
 005CE582    mov         edx,5CEE48;'Millie'
 005CE587    mov         eax,dword ptr [ebx]
 005CE589    call        THashTable.Add
 005CE58E    mov         ecx,2B
 005CE593    mov         edx,5CEE64;'NaturalMike'
 005CE598    mov         eax,dword ptr [ebx]
 005CE59A    call        THashTable.Add
 005CE59F    mov         ecx,2C
 005CE5A4    mov         edx,5CEE88;'Crystal'
 005CE5A9    mov         eax,dword ptr [ebx]
 005CE5AB    call        THashTable.Add
 005CE5B0    mov         ecx,2D
 005CE5B5    mov         edx,5CEEA4;'Charles'
 005CE5BA    mov         eax,dword ptr [ebx]
 005CE5BC    call        THashTable.Add
 005CE5C1    mov         ecx,2E
 005CE5C6    mov         edx,5CEEC0;'Audrey'
 005CE5CB    mov         eax,dword ptr [ebx]
 005CE5CD    call        THashTable.Add
 005CE5D2    mov         ecx,2F
 005CE5D7    mov         edx,5CEEDC;'Kate'
 005CE5DC    mov         eax,dword ptr [ebx]
 005CE5DE    call        THashTable.Add
 005CE5E3    mov         ecx,30
 005CE5E8    mov         edx,5CEEF4;'Paul'
 005CE5ED    mov         eax,dword ptr [ebx]
 005CE5EF    call        THashTable.Add
 005CE5F4    mov         ecx,33
 005CE5F9    mov         edx,5CEF0C;'Anna'
 005CE5FE    mov         eax,dword ptr [ebx]
 005CE600    call        THashTable.Add
 005CE605    mov         ecx,34
 005CE60A    mov         edx,5CEF24;'Lili'
 005CE60F    mov         eax,dword ptr [ebx]
 005CE611    call        THashTable.Add
 005CE616    mov         ecx,35
 005CE61B    mov         edx,5CEF3C;'Jennifer'
 005CE620    mov         eax,dword ptr [ebx]
 005CE622    call        THashTable.Add
 005CE627    mov         ecx,51
 005CE62C    mov         edx,5CEF5C;'Emily2'
 005CE631    mov         eax,dword ptr [ebx]
 005CE633    call        THashTable.Add
 005CE638    mov         ecx,36
 005CE63D    mov         edx,5CEF78;'Daniel'
 005CE642    mov         eax,dword ptr [ebx]
 005CE644    call        THashTable.Add
 005CE649    mov         ecx,37
 005CE64E    mov         edx,5CEF94;'Karen'
 005CE653    mov         eax,dword ptr [ebx]
 005CE655    call        THashTable.Add
 005CE65A    mov         ecx,38
 005CE65F    mov         edx,5CEFAC;'Lee'
 005CE664    mov         eax,dword ptr [ebx]
 005CE666    call        THashTable.Add
 005CE66B    mov         ecx,57
 005CE670    mov         edx,5CEFC0;'Moira'
 005CE675    mov         eax,dword ptr [ebx]
 005CE677    call        THashTable.Add
 005CE67C    mov         ecx,58
 005CE681    mov         edx,5CEFD8;'Samantha'
 005CE686    mov         eax,dword ptr [ebx]
 005CE688    call        THashTable.Add
 005CE68D    mov         ecx,53
 005CE692    mov         edx,5CEFF8;'Jill'
 005CE697    mov         eax,dword ptr [ebx]
 005CE699    call        THashTable.Add
 005CE69E    mov         ecx,54
 005CE6A3    mov         edx,5CF010;'Tom'
 005CE6A8    mov         eax,dword ptr [ebx]
 005CE6AA    call        THashTable.Add
 005CE6AF    mov         ecx,59
 005CE6B4    mov         edx,5CF024;'Anjali'
 005CE6B9    mov         eax,dword ptr [ebx]
 005CE6BB    call        THashTable.Add
 005CE6C0    mov         ecx,52
 005CE6C5    mov         edx,5CF040;'Sangeeta'
 005CE6CA    mov         eax,dword ptr [ebx]
 005CE6CC    call        THashTable.Add
 005CE6D1    mov         ecx,5A
 005CE6D6    mov         edx,5CF060;'Asharir16'
 005CE6DB    mov         eax,dword ptr [ebx]
 005CE6DD    call        THashTable.Add
 005CE6E2    mov         ecx,5B
 005CE6E7    mov         edx,5CF080;'Asharir22'
 005CE6EC    mov         eax,dword ptr [ebx]
 005CE6EE    call        THashTable.Add
 005CE6F3    mov         ecx,5C
 005CE6F8    mov         edx,5CF0A0;'Katrin'
 005CE6FD    mov         eax,dword ptr [ebx]
 005CE6FF    call        THashTable.Add
 005CE704    mov         ecx,39
 005CE709    mov         edx,5CF0BC;'MeiLing'
 005CE70E    mov         eax,dword ptr [ebx]
 005CE710    call        THashTable.Add
 005CE715    mov         ecx,3A
 005CE71A    mov         edx,5CF0D8;'SinJi'
 005CE71F    mov         eax,dword ptr [ebx]
 005CE721    call        THashTable.Add
 005CE726    mov         ecx,39
 005CE72B    mov         edx,5CF0F0;'Mei_ling'
 005CE730    mov         eax,dword ptr [ebx]
 005CE732    call        THashTable.Add
 005CE737    mov         ecx,3A
 005CE73C    mov         edx,5CF110;'Sin_ji'
 005CE741    mov         eax,dword ptr [ebx]
 005CE743    call        THashTable.Add
 005CE748    mov         ecx,3B
 005CE74D    mov         edx,5CF12C;'Nanna'
 005CE752    mov         eax,dword ptr [ebx]
 005CE754    call        THashTable.Add
 005CE759    mov         ecx,3C
 005CE75E    mov         edx,5CF144;'Claire'
 005CE763    mov         eax,dword ptr [ebx]
 005CE765    call        THashTable.Add
 005CE76A    mov         ecx,3D
 005CE76F    mov         edx,5CF160;'Laura'
 005CE774    mov         eax,dword ptr [ebx]
 005CE776    call        THashTable.Add
 005CE77B    mov         ecx,3E
 005CE780    mov         edx,5CF178;'Ellen'
 005CE785    mov         eax,dword ptr [ebx]
 005CE787    call        THashTable.Add
 005CE78C    mov         ecx,3F
 005CE791    mov         edx,5CF190;'Julie'
 005CE796    mov         eax,dword ptr [ebx]
 005CE798    call        THashTable.Add
 005CE79D    mov         ecx,40
 005CE7A2    mov         edx,5CF1A8;'Felix'
 005CE7A7    mov         eax,dword ptr [ebx]
 005CE7A9    call        THashTable.Add
 005CE7AE    mov         ecx,41
 005CE7B3    mov         edx,5CF1C0;'Sebastien'
 005CE7B8    mov         eax,dword ptr [ebx]
 005CE7BA    call        THashTable.Add
 005CE7BF    mov         ecx,42
 005CE7C4    mov         edx,5CF1E0;'Virginie'
 005CE7C9    mov         eax,dword ptr [ebx]
 005CE7CB    call        THashTable.Add
 005CE7D0    mov         ecx,43
 005CE7D5    mov         edx,5CF200;'Steffi'
 005CE7DA    mov         eax,dword ptr [ebx]
 005CE7DC    call        THashTable.Add
 005CE7E1    mov         ecx,44
 005CE7E6    mov         edx,5CF21C;'Sylvia'
 005CE7EB    mov         eax,dword ptr [ebx]
 005CE7ED    call        THashTable.Add
 005CE7F2    mov         ecx,45
 005CE7F7    mov         edx,5CF238;'Kyoko'
 005CE7FC    mov         eax,dword ptr [ebx]
 005CE7FE    call        THashTable.Add
 005CE803    mov         ecx,46
 005CE808    mov         edx,5CF250;'Narae'
 005CE80D    mov         eax,dword ptr [ebx]
 005CE80F    call        THashTable.Add
 005CE814    mov         ecx,47
 005CE819    mov         edx,5CF268;'Nora'
 005CE81E    mov         eax,dword ptr [ebx]
 005CE820    call        THashTable.Add
 005CE825    mov         ecx,48
 005CE82A    mov         edx,5CF280;'Agata'
 005CE82F    mov         eax,dword ptr [ebx]
 005CE831    call        THashTable.Add
 005CE836    mov         ecx,49
 005CE83B    mov         edx,5CF298;'Raquel'
 005CE840    mov         eax,dword ptr [ebx]
 005CE842    call        THashTable.Add
 005CE847    mov         ecx,4A
 005CE84C    mov         edx,5CF2B4;'Madalena'
 005CE851    mov         eax,dword ptr [ebx]
 005CE853    call        THashTable.Add
 005CE858    mov         ecx,4B
 005CE85D    mov         edx,5CF2D4;'Katerina'
 005CE862    mov         eax,dword ptr [ebx]
 005CE864    call        THashTable.Add
 005CE869    mov         ecx,4C
 005CE86E    mov         edx,5CF2F4;'Javier'
 005CE873    mov         eax,dword ptr [ebx]
 005CE875    call        THashTable.Add
 005CE87A    mov         ecx,4D
 005CE87F    mov         edx,5CF310;'Paulina'
 005CE884    mov         eax,dword ptr [ebx]
 005CE886    call        THashTable.Add
 005CE88B    mov         ecx,4E
 005CE890    mov         edx,5CF32C;'Isabel'
 005CE895    mov         eax,dword ptr [ebx]
 005CE897    call        THashTable.Add
 005CE89C    mov         ecx,4F
 005CE8A1    mov         edx,5CF348;'Ingrid'
 005CE8A6    mov         eax,dword ptr [ebx]
 005CE8A8    call        THashTable.Add
 005CE8AD    mov         ecx,50
 005CE8B2    mov         edx,5CF364;'Arantxa'
 005CE8B7    mov         eax,dword ptr [ebx]
 005CE8B9    call        THashTable.Add
 005CE8BE    mov         ecx,55
 005CE8C3    mov         edx,5CF380;'Yannick'
 005CE8C8    mov         eax,dword ptr [ebx]
 005CE8CA    call        THashTable.Add
 005CE8CF    mov         ecx,56
 005CE8D4    mov         edx,5CF39C;'Silvia'
 005CE8D9    mov         eax,dword ptr [ebx]
 005CE8DB    call        THashTable.Add
 005CE8E0    mov         ecx,45
 005CE8E5    mov         edx,5CF238;'Kyoko'
 005CE8EA    mov         eax,dword ptr [ebx]
 005CE8EC    call        THashTable.Add
 005CE8F1    pop         ebx
 005CE8F2    ret
*}
end;

//005CF3AC
procedure sub_005CF3AC;
begin
{*
 005CF3AC    push        ebp
 005CF3AD    mov         ebp,esp
 005CF3AF    mov         ecx,4
 005CF3B4    push        0
 005CF3B6    push        0
 005CF3B8    dec         ecx
>005CF3B9    jne         005CF3B4
 005CF3BB    push        ecx
 005CF3BC    push        ebx
 005CF3BD    push        esi
 005CF3BE    push        edi
 005CF3BF    xor         eax,eax
 005CF3C1    push        ebp
 005CF3C2    push        5CFA90
 005CF3C7    push        dword ptr fs:[eax]
 005CF3CA    mov         dword ptr fs:[eax],esp
 005CF3CD    xor         eax,eax
 005CF3CF    mov         [008155F0],eax;gvar_008155F0:TSpVoice
 005CF3D4    cmp         byte ptr ds:[78A038],0;gvar_0078A038
>005CF3DB    je          005CFA55
 005CF3E1    mov         eax,5CFAAC;'StartRuntimeSpeech'
 005CF3E6    call        004FA5FC
 005CF3EB    xor         ecx,ecx
 005CF3ED    mov         dl,1
 005CF3EF    mov         eax,[005C65E4];TSpVoice
 005CF3F4    call        TSpVoice.Create;TSpVoice.Create
 005CF3F9    mov         [008155F0],eax;gvar_008155F0:TSpVoice
 005CF3FE    lea         eax,[ebp-14]
 005CF401    push        eax
 005CF402    xor         ecx,ecx
 005CF404    xor         edx,edx
 005CF406    mov         eax,[008155F0];gvar_008155F0:TSpVoice
 005CF40B    call        TSpVoice.GetVoices
 005CF410    mov         edx,dword ptr [ebp-14]
 005CF413    mov         eax,815AB0;gvar_00815AB0:IInterface
 005CF418    call        @IntfCopy
 005CF41D    mov         eax,78A034;gvar_0078A034
 005CF422    call        @UStrClr
 005CF427    lea         eax,[ebp-18]
 005CF42A    push        eax
 005CF42B    mov         eax,[00815AB0];gvar_00815AB0:IInterface
 005CF430    push        eax
 005CF431    mov         eax,dword ptr [eax]
 005CF433    call        dword ptr [eax+1C]
 005CF436    call        @CheckAutoResult
 005CF43B    mov         eax,dword ptr [ebp-18]
 005CF43E    dec         eax
 005CF43F    test        eax,eax
>005CF441    jl          005CFA3E
 005CF447    inc         eax
 005CF448    mov         dword ptr [ebp-10],eax
 005CF44B    mov         dword ptr [ebp-0C],0
 005CF452    lea         eax,[ebp-4]
 005CF455    call        @IntfClear
 005CF45A    push        eax
 005CF45B    mov         eax,dword ptr [ebp-0C]
 005CF45E    push        eax
 005CF45F    mov         eax,[00815AB0];gvar_00815AB0:IInterface
 005CF464    push        eax
 005CF465    mov         eax,dword ptr [eax]
 005CF467    call        dword ptr [eax+20]
 005CF46A    call        @CheckAutoResult
 005CF46F    xor         edx,edx
 005CF471    push        ebp
 005CF472    push        5CF4B6
 005CF477    push        dword ptr fs:[edx]
 005CF47A    mov         dword ptr fs:[edx],esp
 005CF47D    lea         eax,[ebp-20]
 005CF480    call        @WStrClr
 005CF485    push        eax
 005CF486    push        0
 005CF488    mov         eax,dword ptr [ebp-4]
 005CF48B    push        eax
 005CF48C    mov         eax,dword ptr [eax]
 005CF48E    call        dword ptr [eax+28]
 005CF491    call        @CheckAutoResult
 005CF496    mov         edx,dword ptr [ebp-20]
 005CF499    lea         eax,[ebp-1C]
 005CF49C    call        @UStrFromWStr
 005CF4A1    mov         eax,dword ptr [ebp-1C]
 005CF4A4    lea         edx,[ebp-8]
 005CF4A7    call        LowerCase
 005CF4AC    xor         eax,eax
 005CF4AE    pop         edx
 005CF4AF    pop         ecx
 005CF4B0    pop         ecx
 005CF4B1    mov         dword ptr fs:[eax],edx
>005CF4B4    jmp         005CF4EE
>005CF4B6    jmp         @HandleOnException
 005CF4BB    dd          1
 005CF4BF    dd          00418C04;Exception
 005CF4C3    dd          005CF4C7
 005CF4C7    lea         eax,[ebp-24]
 005CF4CA    call        @WStrClr
 005CF4CF    push        eax
 005CF4D0    mov         eax,dword ptr [ebp-4]
 005CF4D3    push        eax
 005CF4D4    mov         eax,dword ptr [eax]
 005CF4D6    call        dword ptr [eax+1C]
 005CF4D9    call        @CheckAutoResult
 005CF4DE    mov         edx,dword ptr [ebp-24]
 005CF4E1    lea         eax,[ebp-8]
 005CF4E4    call        @UStrFromWStr
 005CF4E9    call        @DoneExcept
 005CF4EE    mov         edx,dword ptr [ebp-8]
 005CF4F1    mov         eax,5CFAE0;'sam'
 005CF4F6    call        Pos
 005CF4FB    test        eax,eax
>005CF4FD    jle         005CF511
 005CF4FF    mov         eax,815920;gvar_00815920:IInterface
 005CF504    mov         edx,dword ptr [ebp-4]
 005CF507    call        @IntfCopy
>005CF50C    jmp         005CFA32
 005CF511    mov         edx,dword ptr [ebp-8]
 005CF514    mov         eax,5CFAF4;'mike16'
 005CF519    call        Pos
 005CF51E    test        eax,eax
>005CF520    jle         005CF534
 005CF522    mov         eax,8159C8;gvar_008159C8:IInterface
 005CF527    mov         edx,dword ptr [ebp-4]
 005CF52A    call        @IntfCopy
>005CF52F    jmp         005CFA32
 005CF534    mov         edx,dword ptr [ebp-8]
 005CF537    mov         eax,5CFB10;'mike'
 005CF53C    call        Pos
 005CF541    test        eax,eax
>005CF543    jle         005CF557
 005CF545    mov         eax,815924;gvar_00815924:IInterface
 005CF54A    mov         edx,dword ptr [ebp-4]
 005CF54D    call        @IntfCopy
>005CF552    jmp         005CFA32
 005CF557    mov         edx,dword ptr [ebp-8]
 005CF55A    mov         eax,5CFB28;'mary'
 005CF55F    call        Pos
 005CF564    test        eax,eax
>005CF566    jle         005CF57A
 005CF568    mov         eax,815928;gvar_00815928:IInterface
 005CF56D    mov         edx,dword ptr [ebp-4]
 005CF570    call        @IntfCopy
>005CF575    jmp         005CFA32
 005CF57A    mov         edx,dword ptr [ebp-8]
 005CF57D    mov         eax,5CFB40;'anna'
 005CF582    call        Pos
 005CF587    test        eax,eax
>005CF589    jle         005CF59D
 005CF58B    mov         eax,8159E8;gvar_008159E8:IInterface
 005CF590    mov         edx,dword ptr [ebp-4]
 005CF593    call        @IntfCopy
>005CF598    jmp         005CFA32
 005CF59D    mov         edx,dword ptr [ebp-8]
 005CF5A0    mov         eax,5CFB58;'lili'
 005CF5A5    call        Pos
 005CF5AA    test        eax,eax
>005CF5AC    jle         005CF5C0
 005CF5AE    mov         eax,8159EC;gvar_008159EC:IInterface
 005CF5B3    mov         edx,dword ptr [ebp-4]
 005CF5B6    call        @IntfCopy
>005CF5BB    jmp         005CFA32
 005CF5C0    mov         edx,dword ptr [ebp-8]
 005CF5C3    mov         eax,5CFB70;'michael'
 005CF5C8    call        Pos
 005CF5CD    test        eax,eax
>005CF5CF    jle         005CF5E3
 005CF5D1    mov         eax,815998;gvar_00815998:IInterface
 005CF5D6    mov         edx,dword ptr [ebp-4]
 005CF5D9    call        @IntfCopy
>005CF5DE    jmp         005CFA32
 005CF5E3    mov         edx,dword ptr [ebp-8]
 005CF5E6    mov         eax,5CFB8C;'michelle'
 005CF5EB    call        Pos
 005CF5F0    test        eax,eax
>005CF5F2    jle         005CF606
 005CF5F4    mov         eax,81599C;gvar_0081599C:IInterface
 005CF5F9    mov         edx,dword ptr [ebp-4]
 005CF5FC    call        @IntfCopy
>005CF601    jmp         005CFA32
 005CF606    mov         edx,dword ptr [ebp-8]
 005CF609    mov         eax,5CFBAC;'kal'
 005CF60E    call        Pos
 005CF613    test        eax,eax
>005CF615    jle         005CF629
 005CF617    mov         eax,815994;gvar_00815994:IInterface
 005CF61C    mov         edx,dword ptr [ebp-4]
 005CF61F    call        @IntfCopy
>005CF624    jmp         005CFA32
 005CF629    mov         edx,dword ptr [ebp-8]
 005CF62C    mov         eax,5CFBC0;'david'
 005CF631    call        Pos
 005CF636    test        eax,eax
>005CF638    jle         005CF64C
 005CF63A    mov         eax,8159A0;gvar_008159A0:IInterface
 005CF63F    mov         edx,dword ptr [ebp-4]
 005CF642    call        @IntfCopy
>005CF647    jmp         005CFA32
 005CF64C    mov         edx,dword ptr [ebp-8]
 005CF64F    mov         eax,5CFBD8;'dianne'
 005CF654    call        Pos
 005CF659    test        eax,eax
>005CF65B    jle         005CF66F
 005CF65D    mov         eax,8159A4;gvar_008159A4:IInterface
 005CF662    mov         edx,dword ptr [ebp-4]
 005CF665    call        @IntfCopy
>005CF66A    jmp         005CFA32
 005CF66F    mov         edx,dword ptr [ebp-8]
 005CF672    mov         eax,5CFBF4;'william'
 005CF677    call        Pos
 005CF67C    test        eax,eax
>005CF67E    jle         005CF692
 005CF680    mov         eax,8159A8;gvar_008159A8:IInterface
 005CF685    mov         edx,dword ptr [ebp-4]
 005CF688    call        @IntfCopy
>005CF68D    jmp         005CFA32
 005CF692    mov         edx,dword ptr [ebp-8]
 005CF695    mov         eax,5CFC10;'amy'
 005CF69A    call        Pos
 005CF69F    test        eax,eax
>005CF6A1    jle         005CF6B5
 005CF6A3    mov         eax,8159AC;gvar_008159AC:IInterface
 005CF6A8    mov         edx,dword ptr [ebp-4]
 005CF6AB    call        @IntfCopy
>005CF6B0    jmp         005CFA32
 005CF6B5    mov         edx,dword ptr [ebp-8]
 005CF6B8    mov         eax,5CFC24;'frank'
 005CF6BD    call        Pos
 005CF6C2    test        eax,eax
>005CF6C4    jle         005CF6D8
 005CF6C6    mov         eax,8159B0;gvar_008159B0:IInterface
 005CF6CB    mov         edx,dword ptr [ebp-4]
 005CF6CE    call        @IntfCopy
>005CF6D3    jmp         005CFA32
 005CF6D8    mov         edx,dword ptr [ebp-8]
 005CF6DB    mov         eax,5CFC3C;'emily'
 005CF6E0    call        Pos
 005CF6E5    test        eax,eax
>005CF6E7    jle         005CF6FB
 005CF6E9    mov         eax,8159B4;gvar_008159B4:IInterface
 005CF6EE    mov         edx,dword ptr [ebp-4]
 005CF6F1    call        @IntfCopy
>005CF6F6    jmp         005CFA32
 005CF6FB    mov         edx,dword ptr [ebp-8]
 005CF6FE    mov         eax,5CFC54;'duncan'
 005CF703    call        Pos
 005CF708    test        eax,eax
>005CF70A    jle         005CF71E
 005CF70C    mov         eax,8159B8;gvar_008159B8:IInterface
 005CF711    mov         edx,dword ptr [ebp-4]
 005CF714    call        @IntfCopy
>005CF719    jmp         005CFA32
 005CF71E    mov         edx,dword ptr [ebp-8]
 005CF721    mov         eax,5CFC70;'linda'
 005CF726    call        Pos
 005CF72B    test        eax,eax
>005CF72D    jle         005CF741
 005CF72F    mov         eax,8159BC;gvar_008159BC:IInterface
 005CF734    mov         edx,dword ptr [ebp-4]
 005CF737    call        @IntfCopy
>005CF73C    jmp         005CFA32
 005CF741    mov         edx,dword ptr [ebp-8]
 005CF744    mov         eax,5CFC88;'robin'
 005CF749    call        Pos
 005CF74E    test        eax,eax
>005CF750    jle         005CF764
 005CF752    mov         eax,8159C0;gvar_008159C0:IInterface
 005CF757    mov         edx,dword ptr [ebp-4]
 005CF75A    call        @IntfCopy
>005CF75F    jmp         005CFA32
 005CF764    mov         edx,dword ptr [ebp-8]
 005CF767    mov         eax,5CFCA0;'walter'
 005CF76C    call        Pos
 005CF771    test        eax,eax
>005CF773    jle         005CF787
 005CF775    mov         eax,8159C4;gvar_008159C4:IInterface
 005CF77A    mov         edx,dword ptr [ebp-4]
 005CF77D    call        @IntfCopy
>005CF782    jmp         005CFA32
 005CF787    mov         edx,dword ptr [ebp-8]
 005CF78A    mov         eax,5CFCBC;'lawrence'
 005CF78F    call        Pos
 005CF794    test        eax,eax
>005CF796    jle         005CF7AA
 005CF798    mov         eax,8159E0;gvar_008159E0:IInterface
 005CF79D    mov         edx,dword ptr [ebp-4]
 005CF7A0    call        @IntfCopy
>005CF7A5    jmp         005CFA32
 005CF7AA    mov         edx,dword ptr [ebp-8]
 005CF7AD    mov         eax,5CFCDC;'charles'
 005CF7B2    call        Pos
 005CF7B7    test        eax,eax
>005CF7B9    jle         005CF7CD
 005CF7BB    mov         eax,8159D0;gvar_008159D0:IInterface
 005CF7C0    mov         edx,dword ptr [ebp-4]
 005CF7C3    call        @IntfCopy
>005CF7C8    jmp         005CFA32
 005CF7CD    mov         edx,dword ptr [ebp-8]
 005CF7D0    mov         eax,5CFCF8;'audrey'
 005CF7D5    call        Pos
 005CF7DA    test        eax,eax
>005CF7DC    jle         005CF7F0
 005CF7DE    mov         eax,8159D4;gvar_008159D4:IInterface
 005CF7E3    mov         edx,dword ptr [ebp-4]
 005CF7E6    call        @IntfCopy
>005CF7EB    jmp         005CFA32
 005CF7F0    mov         edx,dword ptr [ebp-8]
 005CF7F3    mov         eax,5CFD14;'crystal'
 005CF7F8    call        Pos
 005CF7FD    test        eax,eax
>005CF7FF    jle         005CF813
 005CF801    mov         eax,8159CC;gvar_008159CC:IInterface
 005CF806    mov         edx,dword ptr [ebp-4]
 005CF809    call        @IntfCopy
>005CF80E    jmp         005CFA32
 005CF813    mov         edx,dword ptr [ebp-8]
 005CF816    mov         eax,5CFD30;'kate'
 005CF81B    call        Pos
 005CF820    test        eax,eax
>005CF822    jle         005CF836
 005CF824    mov         eax,8159D8;gvar_008159D8:IInterface
 005CF829    mov         edx,dword ptr [ebp-4]
 005CF82C    call        @IntfCopy
>005CF831    jmp         005CFA32
 005CF836    mov         edx,dword ptr [ebp-8]
 005CF839    mov         eax,5CFD48;'paul'
 005CF83E    call        Pos
 005CF843    test        eax,eax
>005CF845    jle         005CF859
 005CF847    mov         eax,8159DC;gvar_008159DC:IInterface
 005CF84C    mov         edx,dword ptr [ebp-4]
 005CF84F    call        @IntfCopy
>005CF854    jmp         005CFA32
 005CF859    mov         edx,dword ptr [ebp-8]
 005CF85C    mov         eax,5CFD60;'karen'
 005CF861    call        Pos
 005CF866    test        eax,eax
>005CF868    jle         005CF87C
 005CF86A    mov         eax,8159F8;gvar_008159F8:IInterface
 005CF86F    mov         edx,dword ptr [ebp-4]
 005CF872    call        @IntfCopy
>005CF877    jmp         005CFA32
 005CF87C    mov         edx,dword ptr [ebp-8]
 005CF87F    mov         eax,5CFD78;'lee'
 005CF884    call        Pos
 005CF889    test        eax,eax
>005CF88B    jle         005CF89F
 005CF88D    mov         eax,8159FC;gvar_008159FC:IInterface
 005CF892    mov         edx,dword ptr [ebp-4]
 005CF895    call        @IntfCopy
>005CF89A    jmp         005CFA32
 005CF89F    mov         edx,dword ptr [ebp-8]
 005CF8A2    mov         eax,5CFD8C;'jennifer'
 005CF8A7    call        Pos
 005CF8AC    test        eax,eax
>005CF8AE    jle         005CF8C2
 005CF8B0    mov         eax,8159F8;gvar_008159F8:IInterface
 005CF8B5    mov         edx,dword ptr [ebp-4]
 005CF8B8    call        @IntfCopy
>005CF8BD    jmp         005CFA32
 005CF8C2    mov         edx,dword ptr [ebp-8]
 005CF8C5    mov         eax,5CFDAC;'samantha'
 005CF8CA    call        Pos
 005CF8CF    test        eax,eax
>005CF8D1    jle         005CF8E5
 005CF8D3    mov         eax,8159FC;gvar_008159FC:IInterface
 005CF8D8    mov         edx,dword ptr [ebp-4]
 005CF8DB    call        @IntfCopy
>005CF8E0    jmp         005CFA32
 005CF8E5    mov         edx,dword ptr [ebp-8]
 005CF8E8    mov         eax,5CFDCC;'jill'
 005CF8ED    call        Pos
 005CF8F2    test        eax,eax
>005CF8F4    jle         005CF908
 005CF8F6    mov         eax,815A68;gvar_00815A68:IInterface
 005CF8FB    mov         edx,dword ptr [ebp-4]
 005CF8FE    call        @IntfCopy
>005CF903    jmp         005CFA32
 005CF908    mov         edx,dword ptr [ebp-8]
 005CF90B    mov         eax,5CFDE4;'tom'
 005CF910    call        Pos
 005CF915    test        eax,eax
>005CF917    jle         005CF92B
 005CF919    mov         eax,815A6C;gvar_00815A6C:IInterface
 005CF91E    mov         edx,dword ptr [ebp-4]
 005CF921    call        @IntfCopy
>005CF926    jmp         005CFA32
 005CF92B    mov         edx,dword ptr [ebp-8]
 005CF92E    mov         eax,5CFDF8;'daniel'
 005CF933    call        Pos
 005CF938    test        eax,eax
>005CF93A    jle         005CF94E
 005CF93C    mov         eax,8159F4;gvar_008159F4:IInterface
 005CF941    mov         edx,dword ptr [ebp-4]
 005CF944    call        @IntfCopy
>005CF949    jmp         005CFA32
 005CF94E    mov         edx,dword ptr [ebp-8]
 005CF951    mov         eax,5CFE14;'moira'
 005CF956    call        Pos
 005CF95B    test        eax,eax
>005CF95D    jle         005CF971
 005CF95F    mov         eax,815A78;gvar_00815A78:IInterface
 005CF964    mov         edx,dword ptr [ebp-4]
 005CF967    call        @IntfCopy
>005CF96C    jmp         005CFA32
 005CF971    mov         edx,dword ptr [ebp-8]
 005CF974    mov         eax,5CFE2C;'sangeeta'
 005CF979    call        Pos
 005CF97E    test        eax,eax
>005CF980    jle         005CF994
 005CF982    mov         eax,815A64;gvar_00815A64:IInterface
 005CF987    mov         edx,dword ptr [ebp-4]
 005CF98A    call        @IntfCopy
>005CF98F    jmp         005CFA32
 005CF994    mov         edx,dword ptr [ebp-8]
 005CF997    mov         eax,5CFE4C;'anjali'
 005CF99C    call        Pos
 005CF9A1    test        eax,eax
>005CF9A3    jle         005CF9B4
 005CF9A5    mov         eax,815A80;gvar_00815A80:IInterface
 005CF9AA    mov         edx,dword ptr [ebp-4]
 005CF9AD    call        @IntfCopy
>005CF9B2    jmp         005CFA32
 005CF9B4    mov         edx,dword ptr [ebp-8]
 005CF9B7    mov         eax,5CFE68;'asharir16'
 005CF9BC    call        Pos
 005CF9C1    test        eax,eax
>005CF9C3    jle         005CF9D4
 005CF9C5    mov         eax,815A84;gvar_00815A84:IInterface
 005CF9CA    mov         edx,dword ptr [ebp-4]
 005CF9CD    call        @IntfCopy
>005CF9D2    jmp         005CFA32
 005CF9D4    mov         edx,dword ptr [ebp-8]
 005CF9D7    mov         eax,5CFE88;'asharir22'
 005CF9DC    call        Pos
 005CF9E1    test        eax,eax
>005CF9E3    jle         005CF9F4
 005CF9E5    mov         eax,815A88;gvar_00815A88:IInterface
 005CF9EA    mov         edx,dword ptr [ebp-4]
 005CF9ED    call        @IntfCopy
>005CF9F2    jmp         005CFA32
 005CF9F4    mov         edx,dword ptr [ebp-8]
 005CF9F7    mov         eax,5CFEA8;'katrin'
 005CF9FC    call        Pos
 005CFA01    test        eax,eax
>005CFA03    jle         005CFA14
 005CFA05    mov         eax,815A8C;gvar_00815A8C:IInterface
 005CFA0A    mov         edx,dword ptr [ebp-4]
 005CFA0D    call        @IntfCopy
>005CFA12    jmp         005CFA32
 005CFA14    mov         edx,dword ptr [ebp-8]
 005CFA17    mov         eax,5CFEC4;'millie'
 005CFA1C    call        Pos
 005CFA21    test        eax,eax
>005CFA23    jle         005CFA32
 005CFA25    mov         eax,8159E4;gvar_008159E4:IInterface
 005CFA2A    mov         edx,dword ptr [ebp-4]
 005CFA2D    call        @IntfCopy
 005CFA32    inc         dword ptr [ebp-0C]
 005CFA35    dec         dword ptr [ebp-10]
>005CFA38    jne         005CF452
 005CFA3E    mov         esi,65
 005CFA43    mov         ebx,815788;gvar_00815788:UnicodeString
 005CFA48    mov         eax,ebx
 005CFA4A    call        @UStrClr
 005CFA4F    add         ebx,4
 005CFA52    dec         esi
>005CFA53    jne         005CFA48
 005CFA55    xor         eax,eax
 005CFA57    pop         edx
 005CFA58    pop         ecx
 005CFA59    pop         ecx
 005CFA5A    mov         dword ptr fs:[eax],edx
 005CFA5D    push        5CFA97
 005CFA62    lea         eax,[ebp-24]
 005CFA65    mov         edx,2
 005CFA6A    call        @WStrArrayClr
 005CFA6F    lea         eax,[ebp-1C]
 005CFA72    call        @UStrClr
 005CFA77    lea         eax,[ebp-14]
 005CFA7A    call        @IntfClear
 005CFA7F    lea         eax,[ebp-8]
 005CFA82    call        @UStrClr
 005CFA87    lea         eax,[ebp-4]
 005CFA8A    call        @IntfClear
 005CFA8F    ret
>005CFA90    jmp         @HandleFinally
>005CFA95    jmp         005CFA62
 005CFA97    pop         edi
 005CFA98    pop         esi
 005CFA99    pop         ebx
 005CFA9A    mov         esp,ebp
 005CFA9C    pop         ebp
 005CFA9D    ret
*}
end;

//005CFED4
procedure sub_005CFED4;
begin
{*
 005CFED4    push        ebx
 005CFED5    mov         ebx,8155EC;gvar_008155EC:THashTable
 005CFEDA    xor         ecx,ecx
 005CFEDC    mov         edx,5CFFD4;'text'
 005CFEE1    mov         eax,dword ptr [ebx]
 005CFEE3    call        THashTable.Add
 005CFEE8    mov         ecx,1
 005CFEED    mov         edx,5CFFEC;'name'
 005CFEF2    mov         eax,dword ptr [ebx]
 005CFEF4    call        THashTable.Add
 005CFEF9    mov         ecx,2
 005CFEFE    mov         edx,5D0004;'vendor'
 005CFF03    mov         eax,dword ptr [ebx]
 005CFF05    call        THashTable.Add
 005CFF0A    mov         ecx,3
 005CFF0F    mov         edx,5D0020;'age'
 005CFF14    mov         eax,dword ptr [ebx]
 005CFF16    call        THashTable.Add
 005CFF1B    mov         ecx,4
 005CFF20    mov         edx,5D0034;'gender'
 005CFF25    mov         eax,dword ptr [ebx]
 005CFF27    call        THashTable.Add
 005CFF2C    mov         ecx,5
 005CFF31    mov         edx,5D0050;'language'
 005CFF36    mov         eax,dword ptr [ebx]
 005CFF38    call        THashTable.Add
 005CFF3D    mov         ecx,6
 005CFF42    mov         edx,5D0070;'regkey'
 005CFF47    mov         eax,dword ptr [ebx]
 005CFF49    call        THashTable.Add
 005CFF4E    mov         ecx,8
 005CFF53    mov         edx,5D008C;'volume'
 005CFF58    mov         eax,dword ptr [ebx]
 005CFF5A    call        THashTable.Add
 005CFF5F    mov         ecx,9
 005CFF64    mov         edx,5D00A8;'pitch'
 005CFF69    mov         eax,dword ptr [ebx]
 005CFF6B    call        THashTable.Add
 005CFF70    mov         ecx,0A
 005CFF75    mov         edx,5D00C0;'audiolevel'
 005CFF7A    mov         eax,dword ptr [ebx]
 005CFF7C    call        THashTable.Add
 005CFF81    mov         ecx,0B
 005CFF86    mov         edx,5D00E4;'phoneme'
 005CFF8B    mov         eax,dword ptr [ebx]
 005CFF8D    call        THashTable.Add
 005CFF92    mov         ecx,0C
 005CFF97    mov         edx,5D0100;'viseme'
 005CFF9C    mov         eax,dword ptr [ebx]
 005CFF9E    call        THashTable.Add
 005CFFA3    mov         ecx,0D
 005CFFA8    mov         edx,5D011C;'paused'
 005CFFAD    mov         eax,dword ptr [ebx]
 005CFFAF    call        THashTable.Add
 005CFFB4    mov         ecx,0E
 005CFFB9    mov         edx,5D0138;'speaking'
 005CFFBE    mov         eax,dword ptr [ebx]
 005CFFC0    call        THashTable.Add
 005CFFC5    pop         ebx
 005CFFC6    ret
*}
end;

//005D014C
function TSpeechValue.CanSet:Boolean;
begin
{*
 005D014C    mov         al,1
 005D014E    ret
*}
end;

//005D0150
constructor TSpeechValue.Create;
begin
{*
 005D0150    push        ebx
 005D0151    push        esi
 005D0152    test        dl,dl
>005D0154    je          005D015E
 005D0156    add         esp,0FFFFFFF0
 005D0159    call        @ClassCreate
 005D015E    mov         ebx,edx
 005D0160    mov         esi,eax
 005D0162    mov         byte ptr ds:[78A038],1;gvar_0078A038
 005D0169    xor         eax,eax
 005D016B    mov         dword ptr [esi+18],eax;TSpeechValue.Item:Integer
 005D016E    xor         eax,eax
 005D0170    mov         dword ptr [esi+1C],eax;TSpeechValue.Speaker:Integer
 005D0173    lea         eax,[esi+20];TSpeechValue.PrevString:string
 005D0176    call        @UStrClr
 005D017B    mov         eax,esi
 005D017D    test        bl,bl
>005D017F    je          005D0190
 005D0181    call        @AfterConstruction
 005D0186    pop         dword ptr fs:[0]
 005D018D    add         esp,0C
 005D0190    mov         eax,esi
 005D0192    pop         esi
 005D0193    pop         ebx
 005D0194    ret
*}
end;

//005D0198
procedure TSpeechValue.CreateClone;
begin
{*
 005D0198    mov         dl,1
 005D019A    mov         eax,[005CDE7C];TSpeechValue
 005D019F    call        TSpeechValue.Create;TSpeechValue.Create
 005D01A4    ret
*}
end;

//005D01A8
procedure TSpeechValue.FillClone(c:TExpression);
begin
{*
 005D01A8    push        ebx
 005D01A9    push        esi
 005D01AA    push        edi
 005D01AB    mov         esi,edx
 005D01AD    mov         ebx,eax
 005D01AF    mov         edx,esi
 005D01B1    mov         eax,ebx
 005D01B3    call        TExpression.FillClone
 005D01B8    mov         edi,esi
 005D01BA    mov         eax,dword ptr [ebx+18];TSpeechValue.Item:Integer
 005D01BD    mov         dword ptr [edi+18],eax
 005D01C0    mov         eax,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D01C3    mov         dword ptr [edi+1C],eax
 005D01C6    lea         eax,[edi+20]
 005D01C9    mov         edx,dword ptr [ebx+20];TSpeechValue.PrevString:string
 005D01CC    call        @UStrAsg
 005D01D1    pop         edi
 005D01D2    pop         esi
 005D01D3    pop         ebx
 005D01D4    ret
*}
end;

//005D01D8
function TSpeechValue.GetDataType:TDataType;
begin
{*
 005D01D8    mov         eax,dword ptr [eax+18];TSpeechValue.Item:Integer
 005D01DB    cmp         eax,0E
>005D01DE    ja          005D022B
 005D01E0    movzx       eax,byte ptr [eax+5D01EE]
 005D01E7    jmp         dword ptr [eax*4+5D01FD]
 005D01E7    db          1
 005D01E7    db          1
 005D01E7    db          1
 005D01E7    db          1
 005D01E7    db          1
 005D01E7    db          1
 005D01E7    db          1
 005D01E7    db          2
 005D01E7    db          3
 005D01E7    db          2
 005D01E7    db          4
 005D01E7    db          5
 005D01E7    db          5
 005D01E7    db          6
 005D01E7    db          6
 005D01E7    dd          005D022B
 005D01E7    dd          005D0219
 005D01E7    dd          005D021C
 005D01E7    dd          005D021F
 005D01E7    dd          005D0222
 005D01E7    dd          005D0225
 005D01E7    dd          005D0228
 005D0219    mov         al,4
 005D021B    ret
 005D021C    xor         eax,eax
 005D021E    ret
 005D021F    xor         eax,eax
 005D0221    ret
 005D0222    xor         eax,eax
 005D0224    ret
 005D0225    mov         al,2
 005D0227    ret
 005D0228    mov         al,3
 005D022A    ret
 005D022B    xor         eax,eax
 005D022D    ret
*}
end;

//005D0230
{*procedure TSpeechValue.GetString(?:?);
begin
 005D0230    push        ebp
 005D0231    mov         ebp,esp
 005D0233    xor         ecx,ecx
 005D0235    push        ecx
 005D0236    push        ecx
 005D0237    push        ecx
 005D0238    push        ecx
 005D0239    push        ebx
 005D023A    push        esi
 005D023B    push        edi
 005D023C    mov         esi,edx
 005D023E    mov         ebx,eax
 005D0240    xor         eax,eax
 005D0242    push        ebp
 005D0243    push        5D03DA
 005D0248    push        dword ptr fs:[eax]
 005D024B    mov         dword ptr fs:[eax],esp
 005D024E    mov         eax,esi
 005D0250    call        @UStrClr
 005D0255    mov         eax,dword ptr [ebx+18];TSpeechValue.Item:Integer
 005D0258    cmp         eax,6
>005D025B    ja          005D03B6
 005D0261    jmp         dword ptr [eax*4+5D0268]
 005D0261    dd          005D0284
 005D0261    dd          005D0296
 005D0261    dd          005D02AA
 005D0261    dd          005D02EA
 005D0261    dd          005D032A
 005D0261    dd          005D0367
 005D0261    dd          005D03A0
 005D0284    mov         eax,esi
 005D0286    mov         edx,dword ptr ds:[78A034];0x0 gvar_0078A034
 005D028C    call        @UStrAsg
>005D0291    jmp         005D03BF
 005D0296    mov         ecx,esi
 005D0298    mov         edx,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D029B    mov         eax,[008155E8];gvar_008155E8:THashTable
 005D02A0    call        THashTable.Get
>005D02A5    jmp         005D03BF
 005D02AA    mov         edi,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D02AD    cmp         dword ptr [edi*4+81591C],0;gvar_0081591C:IInterface
>005D02B5    je          005D03BF
 005D02BB    lea         eax,[ebp-4]
 005D02BE    call        @WStrClr
 005D02C3    push        eax
 005D02C4    push        5D03EC
 005D02C9    mov         eax,dword ptr [edi*4+81591C];gvar_0081591C:IInterface
 005D02D0    push        eax
 005D02D1    mov         eax,dword ptr [eax]
 005D02D3    call        dword ptr [eax+30]
 005D02D6    call        @CheckAutoResult
 005D02DB    mov         edx,dword ptr [ebp-4]
 005D02DE    mov         eax,esi
 005D02E0    call        @UStrFromWStr
>005D02E5    jmp         005D03BF
 005D02EA    mov         edi,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D02ED    cmp         dword ptr [edi*4+81591C],0;gvar_0081591C:IInterface
>005D02F5    je          005D03BF
 005D02FB    lea         eax,[ebp-8]
 005D02FE    call        @WStrClr
 005D0303    push        eax
 005D0304    push        5D0400
 005D0309    mov         eax,dword ptr [edi*4+81591C];gvar_0081591C:IInterface
 005D0310    push        eax
 005D0311    mov         eax,dword ptr [eax]
 005D0313    call        dword ptr [eax+30]
 005D0316    call        @CheckAutoResult
 005D031B    mov         edx,dword ptr [ebp-8]
 005D031E    mov         eax,esi
 005D0320    call        @UStrFromWStr
>005D0325    jmp         005D03BF
 005D032A    mov         edi,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D032D    cmp         dword ptr [edi*4+81591C],0;gvar_0081591C:IInterface
>005D0335    je          005D03BF
 005D033B    lea         eax,[ebp-0C]
 005D033E    call        @WStrClr
 005D0343    push        eax
 005D0344    push        5D040C
 005D0349    mov         eax,dword ptr [edi*4+81591C];gvar_0081591C:IInterface
 005D0350    push        eax
 005D0351    mov         eax,dword ptr [eax]
 005D0353    call        dword ptr [eax+30]
 005D0356    call        @CheckAutoResult
 005D035B    mov         edx,dword ptr [ebp-0C]
 005D035E    mov         eax,esi
 005D0360    call        @UStrFromWStr
>005D0365    jmp         005D03BF
 005D0367    mov         edi,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D036A    cmp         dword ptr [edi*4+81591C],0;gvar_0081591C:IInterface
>005D0372    je          005D03BF
 005D0374    lea         eax,[ebp-10]
 005D0377    call        @WStrClr
 005D037C    push        eax
 005D037D    push        5D0420
 005D0382    mov         eax,dword ptr [edi*4+81591C];gvar_0081591C:IInterface
 005D0389    push        eax
 005D038A    mov         eax,dword ptr [eax]
 005D038C    call        dword ptr [eax+30]
 005D038F    call        @CheckAutoResult
 005D0394    mov         edx,dword ptr [ebp-10]
 005D0397    mov         eax,esi
 005D0399    call        @UStrFromWStr
>005D039E    jmp         005D03BF
 005D03A0    mov         eax,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D03A3    cmp         dword ptr [eax*4+81591C],0;gvar_0081591C:IInterface
>005D03AB    je          005D03BF
 005D03AD    mov         eax,esi
 005D03AF    call        @UStrClr
>005D03B4    jmp         005D03BF
 005D03B6    mov         edx,esi
 005D03B8    mov         eax,ebx
 005D03BA    call        TExpression.GetString
 005D03BF    xor         eax,eax
 005D03C1    pop         edx
 005D03C2    pop         ecx
 005D03C3    pop         ecx
 005D03C4    mov         dword ptr fs:[eax],edx
 005D03C7    push        5D03E1
 005D03CC    lea         eax,[ebp-10]
 005D03CF    mov         edx,4
 005D03D4    call        @WStrArrayClr
 005D03D9    ret
>005D03DA    jmp         @HandleFinally
>005D03DF    jmp         005D03CC
 005D03E1    pop         edi
 005D03E2    pop         esi
 005D03E3    pop         ebx
 005D03E4    mov         esp,ebp
 005D03E6    pop         ebp
 005D03E7    ret
end;*}

//005D0434
procedure TSpeechValue.GetValue;
begin
{*
 005D0434    push        ebp
 005D0435    mov         ebp,esp
 005D0437    add         esp,0FFFFFFE4
 005D043A    push        ebx
 005D043B    push        esi
 005D043C    xor         edx,edx
 005D043E    mov         dword ptr [ebp-1C],edx
 005D0441    mov         dword ptr [ebp-18],edx
 005D0444    mov         dword ptr [ebp-14],edx
 005D0447    mov         ebx,eax
 005D0449    xor         eax,eax
 005D044B    push        ebp
 005D044C    push        5D060F
 005D0451    push        dword ptr fs:[eax]
 005D0454    mov         dword ptr fs:[eax],esp
 005D0457    xor         eax,eax
 005D0459    mov         dword ptr [ebp-8],eax
 005D045C    mov         dword ptr [ebp-4],eax
 005D045F    mov         eax,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D0462    mov         esi,dword ptr [eax*4+8155F4];gvar_008155F4
 005D0469    test        esi,esi
>005D046B    je          005D05EE
 005D0471    mov         eax,dword ptr [ebx+18];TSpeechValue.Item:Integer
 005D0474    cmp         eax,0E
>005D0477    ja          005D05E6
 005D047D    jmp         dword ptr [eax*4+5D0484]
 005D047D    dd          005D04C0
 005D047D    dd          005D04CD
 005D047D    dd          005D04DA
 005D047D    dd          005D04E7
 005D047D    dd          005D04F4
 005D047D    dd          005D0501
 005D047D    dd          005D050E
 005D047D    dd          005D051B
 005D047D    dd          005D053E
 005D047D    dd          005D0531
 005D047D    dd          005D0554
 005D047D    dd          005D0561
 005D047D    dd          005D0586
 005D047D    dd          005D05AB
 005D047D    dd          005D05B5
 005D04C0    xor         eax,eax
 005D04C2    mov         dword ptr [ebp-8],eax
 005D04C5    mov         dword ptr [ebp-4],eax
>005D04C8    jmp         005D05EE
 005D04CD    xor         eax,eax
 005D04CF    mov         dword ptr [ebp-8],eax
 005D04D2    mov         dword ptr [ebp-4],eax
>005D04D5    jmp         005D05EE
 005D04DA    xor         eax,eax
 005D04DC    mov         dword ptr [ebp-8],eax
 005D04DF    mov         dword ptr [ebp-4],eax
>005D04E2    jmp         005D05EE
 005D04E7    xor         eax,eax
 005D04E9    mov         dword ptr [ebp-8],eax
 005D04EC    mov         dword ptr [ebp-4],eax
>005D04EF    jmp         005D05EE
 005D04F4    xor         eax,eax
 005D04F6    mov         dword ptr [ebp-8],eax
 005D04F9    mov         dword ptr [ebp-4],eax
>005D04FC    jmp         005D05EE
 005D0501    xor         eax,eax
 005D0503    mov         dword ptr [ebp-8],eax
 005D0506    mov         dword ptr [ebp-4],eax
>005D0509    jmp         005D05EE
 005D050E    xor         eax,eax
 005D0510    mov         dword ptr [ebp-8],eax
 005D0513    mov         dword ptr [ebp-4],eax
>005D0516    jmp         005D05EE
 005D051B    mov         eax,esi
 005D051D    call        005CB340
 005D0522    mov         dword ptr [ebp-0C],eax
 005D0525    fild        dword ptr [ebp-0C]
 005D0528    fstp        qword ptr [ebp-8]
 005D052B    wait
>005D052C    jmp         005D05EE
 005D0531    xor         eax,eax
 005D0533    mov         dword ptr [ebp-8],eax
 005D0536    mov         dword ptr [ebp-4],eax
>005D0539    jmp         005D05EE
 005D053E    mov         eax,esi
 005D0540    call        005CB3F4
 005D0545    mov         dword ptr [ebp-0C],eax
 005D0548    fild        dword ptr [ebp-0C]
 005D054B    fstp        qword ptr [ebp-8]
 005D054E    wait
>005D054F    jmp         005D05EE
 005D0554    xor         eax,eax
 005D0556    mov         dword ptr [ebp-8],eax
 005D0559    mov         dword ptr [ebp-4],eax
>005D055C    jmp         005D05EE
 005D0561    lea         eax,[ebp-10]
 005D0564    push        eax
 005D0565    lea         edx,[ebp-14]
 005D0568    mov         eax,esi
 005D056A    call        005CB040
 005D056F    mov         eax,dword ptr [ebp-14]
 005D0572    push        eax
 005D0573    mov         eax,dword ptr [eax]
 005D0575    call        dword ptr [eax+44]
 005D0578    call        @CheckAutoResult
 005D057D    fild        word ptr [ebp-10]
 005D0580    fstp        qword ptr [ebp-8]
 005D0583    wait
>005D0584    jmp         005D05EE
 005D0586    lea         eax,[ebp-10]
 005D0589    push        eax
 005D058A    lea         edx,[ebp-18]
 005D058D    mov         eax,esi
 005D058F    call        005CB040
 005D0594    mov         eax,dword ptr [ebp-18]
 005D0597    push        eax
 005D0598    mov         eax,dword ptr [eax]
 005D059A    call        dword ptr [eax+48]
 005D059D    call        @CheckAutoResult
 005D05A2    fild        word ptr [ebp-10]
 005D05A5    fstp        qword ptr [ebp-8]
 005D05A8    wait
>005D05A9    jmp         005D05EE
 005D05AB    xor         eax,eax
 005D05AD    mov         dword ptr [ebp-8],eax
 005D05B0    mov         dword ptr [ebp-4],eax
>005D05B3    jmp         005D05EE
 005D05B5    lea         eax,[ebp-0C]
 005D05B8    push        eax
 005D05B9    lea         edx,[ebp-1C]
 005D05BC    mov         eax,[008155F0];gvar_008155F0:TSpVoice
 005D05C1    call        005CB040
 005D05C6    mov         eax,dword ptr [ebp-1C]
 005D05C9    push        eax
 005D05CA    mov         eax,dword ptr [eax]
 005D05CC    call        dword ptr [eax+28]
 005D05CF    call        @CheckAutoResult
 005D05D4    cmp         dword ptr [ebp-0C],0
 005D05D8    seta        al
 005D05DB    call        00686074
 005D05E0    fstp        qword ptr [ebp-8]
 005D05E3    wait
>005D05E4    jmp         005D05EE
 005D05E6    xor         eax,eax
 005D05E8    mov         dword ptr [ebp-8],eax
 005D05EB    mov         dword ptr [ebp-4],eax
 005D05EE    xor         eax,eax
 005D05F0    pop         edx
 005D05F1    pop         ecx
 005D05F2    pop         ecx
 005D05F3    mov         dword ptr fs:[eax],edx
 005D05F6    push        5D0616
 005D05FB    lea         eax,[ebp-1C]
 005D05FE    mov         edx,dword ptr ds:[5C5790];ISpeechVoiceStatus
 005D0604    mov         ecx,3
 005D0609    call        @FinalizeArray
 005D060E    ret
>005D060F    jmp         @HandleFinally
>005D0614    jmp         005D05FB
 005D0616    fld         qword ptr [ebp-8]
 005D0619    pop         esi
 005D061A    pop         ebx
 005D061B    mov         esp,ebp
 005D061D    pop         ebp
 005D061E    ret
*}
end;

//005D0620
{*function sub_005D0620(?:string; ?:Integer):?;
begin
 005D0620    push        ebp
 005D0621    mov         ebp,esp
 005D0623    add         esp,0FFFFFFF4
 005D0626    push        ebx
 005D0627    push        esi
 005D0628    push        edi
 005D0629    xor         ecx,ecx
 005D062B    mov         dword ptr [ebp-0C],ecx
 005D062E    mov         dword ptr [ebp-8],edx
 005D0631    mov         dword ptr [ebp-4],eax
 005D0634    mov         eax,dword ptr [ebp-4]
 005D0637    call        @UStrAddRef
 005D063C    xor         eax,eax
 005D063E    push        ebp
 005D063F    push        5D073E
 005D0644    push        dword ptr fs:[eax]
 005D0647    mov         dword ptr fs:[eax],esp
 005D064A    cmp         dword ptr [ebp-8],0
>005D064E    jl          005D0656
 005D0650    cmp         dword ptr [ebp-8],32
>005D0654    jle         005D065B
 005D0656    xor         eax,eax
 005D0658    mov         dword ptr [ebp-8],eax
 005D065B    mov         eax,dword ptr [ebp-4]
 005D065E    mov         edx,dword ptr [ebp-8]
 005D0661    mov         edx,dword ptr [edx*4+815788];gvar_00815788:UnicodeString
 005D0668    call        @UStrEqual
>005D066D    je          005D071E
 005D0673    xor         eax,eax
 005D0675    push        ebp
 005D0676    push        5D06FE
 005D067B    push        dword ptr fs:[eax]
 005D067E    mov         dword ptr fs:[eax],esp
 005D0681    mov         eax,dword ptr [ebp-8]
 005D0684    cmp         dword ptr [eax*4+8155F4],0;gvar_008155F4
>005D068C    jne         005D06C6
 005D068E    xor         ecx,ecx
 005D0690    mov         dl,1
 005D0692    mov         eax,[005C65E4];TSpVoice
 005D0697    call        TSpVoice.Create;TSpVoice.Create
 005D069C    mov         ebx,eax
 005D069E    mov         eax,dword ptr [ebp-8]
 005D06A1    mov         dword ptr [eax*4+8155F4],ebx;gvar_008155F4
 005D06A8    mov         eax,dword ptr [ebp-8]
 005D06AB    cmp         dword ptr [eax*4+81591C],0;gvar_0081591C:IInterface
>005D06B3    je          005D06C6
 005D06B5    mov         eax,dword ptr [ebp-8]
 005D06B8    mov         edx,dword ptr [eax*4+81591C];gvar_0081591C:IInterface
 005D06BF    mov         eax,ebx
 005D06C1    call        005CB0F8
 005D06C6    mov         eax,dword ptr [ebp-8]
 005D06C9    mov         ebx,dword ptr [eax*4+8155F4];gvar_008155F4
 005D06D0    test        ebx,ebx
>005D06D2    je          005D06F2
 005D06D4    lea         eax,[ebp-0C]
 005D06D7    mov         edx,dword ptr [ebp-4]
 005D06DA    call        @WStrFromUStr
 005D06DF    mov         edx,dword ptr [ebp-0C]
 005D06E2    mov         eax,ebx
 005D06E4    mov         ecx,0B
 005D06E9    call        TSpVoice.Speak
 005D06EE    mov         bl,1
>005D06F0    jmp         005D06F4
 005D06F2    xor         ebx,ebx
 005D06F4    xor         eax,eax
 005D06F6    pop         edx
 005D06F7    pop         ecx
 005D06F8    pop         ecx
 005D06F9    mov         dword ptr fs:[eax],edx
>005D06FC    jmp         005D070A
>005D06FE    jmp         @HandleAnyException
 005D0703    xor         ebx,ebx
 005D0705    call        @DoneExcept
 005D070A    mov         eax,dword ptr [ebp-8]
 005D070D    lea         eax,[eax*4+815788];gvar_00815788:UnicodeString
 005D0714    mov         edx,dword ptr [ebp-4]
 005D0717    call        @UStrAsg
>005D071C    jmp         005D0720
 005D071E    mov         bl,1
 005D0720    xor         eax,eax
 005D0722    pop         edx
 005D0723    pop         ecx
 005D0724    pop         ecx
 005D0725    mov         dword ptr fs:[eax],edx
 005D0728    push        5D0745
 005D072D    lea         eax,[ebp-0C]
 005D0730    call        @WStrClr
 005D0735    lea         eax,[ebp-4]
 005D0738    call        @UStrClr
 005D073D    ret
>005D073E    jmp         @HandleFinally
>005D0743    jmp         005D072D
 005D0745    mov         eax,ebx
 005D0747    pop         edi
 005D0748    pop         esi
 005D0749    pop         ebx
 005D074A    mov         esp,ebp
 005D074C    pop         ebp
 005D074D    ret
end;*}

//005D0750
function TSpeechValue.SetString(NewValue:string):Boolean;
begin
{*
 005D0750    push        ebp
 005D0751    mov         ebp,esp
 005D0753    push        ecx
 005D0754    push        ebx
 005D0755    mov         dword ptr [ebp-4],edx
 005D0758    mov         ebx,eax
 005D075A    mov         eax,dword ptr [ebp-4]
 005D075D    call        @UStrAddRef
 005D0762    xor         eax,eax
 005D0764    push        ebp
 005D0765    push        5D0799
 005D076A    push        dword ptr fs:[eax]
 005D076D    mov         dword ptr fs:[eax],esp
 005D0770    cmp         dword ptr [ebx+18],0;TSpeechValue.Item:Integer
>005D0774    jne         005D0781
 005D0776    mov         edx,dword ptr [ebx+1C];TSpeechValue.Speaker:Integer
 005D0779    mov         eax,dword ptr [ebp-4]
 005D077C    call        005D0620
 005D0781    mov         bl,1
 005D0783    xor         eax,eax
 005D0785    pop         edx
 005D0786    pop         ecx
 005D0787    pop         ecx
 005D0788    mov         dword ptr fs:[eax],edx
 005D078B    push        5D07A0
 005D0790    lea         eax,[ebp-4]
 005D0793    call        @UStrClr
 005D0798    ret
>005D0799    jmp         @HandleFinally
>005D079E    jmp         005D0790
 005D07A0    mov         eax,ebx
 005D07A2    pop         ebx
 005D07A3    pop         ecx
 005D07A4    pop         ebp
 005D07A5    ret
*}
end;

//005D07A8
procedure TSpeechValue.SetValue(NewValue:Double);
begin
{*
 005D07A8    push        ebp
 005D07A9    mov         ebp,esp
 005D07AB    mov         al,1
 005D07AD    pop         ebp
 005D07AE    ret         8
*}
end;

//005D07B4
{*procedure TSpeechValue.ToString(?:?);
begin
 005D07B4    push        ebp
 005D07B5    mov         ebp,esp
 005D07B7    push        0
 005D07B9    push        ebx
 005D07BA    push        esi
 005D07BB    mov         esi,edx
 005D07BD    mov         ebx,eax
 005D07BF    xor         eax,eax
 005D07C1    push        ebp
 005D07C2    push        5D07FD
 005D07C7    push        dword ptr fs:[eax]
 005D07CA    mov         dword ptr fs:[eax],esp
 005D07CD    lea         edx,[ebp-4]
 005D07D0    mov         eax,dword ptr [ebx+18];TSpeechValue.Item:Integer
 005D07D3    call        005CE284
 005D07D8    mov         ecx,dword ptr [ebp-4]
 005D07DB    mov         eax,esi
 005D07DD    mov         edx,5D0818;'Speech.'
 005D07E2    call        @UStrCat3
 005D07E7    xor         eax,eax
 005D07E9    pop         edx
 005D07EA    pop         ecx
 005D07EB    pop         ecx
 005D07EC    mov         dword ptr fs:[eax],edx
 005D07EF    push        5D0804
 005D07F4    lea         eax,[ebp-4]
 005D07F7    call        @UStrClr
 005D07FC    ret
>005D07FD    jmp         @HandleFinally
>005D0802    jmp         005D07F4
 005D0804    pop         esi
 005D0805    pop         ebx
 005D0806    pop         ecx
 005D0807    pop         ebp
 005D0808    ret
end;*}

//005D0828
procedure sub_005D0828;
begin
{*
 005D0828    push        ebx
 005D0829    push        esi
 005D082A    push        edi
 005D082B    mov         edi,33
 005D0830    mov         ebx,81591C;gvar_0081591C:IInterface
 005D0835    mov         esi,8155F4;gvar_008155F4
 005D083A    mov         eax,ebx
 005D083C    call        @IntfClear
 005D0841    mov         eax,esi
 005D0843    mov         edx,dword ptr [eax]
 005D0845    xor         ecx,ecx
 005D0847    mov         dword ptr [eax],ecx
 005D0849    mov         eax,edx
 005D084B    call        TObject.Free
 005D0850    add         esi,4
 005D0853    add         ebx,4
 005D0856    dec         edi
>005D0857    jne         005D083A
 005D0859    mov         eax,815AB0;gvar_00815AB0:IInterface
 005D085E    call        @IntfClear
 005D0863    mov         eax,[008155F0];gvar_008155F0:TSpVoice
 005D0868    xor         edx,edx
 005D086A    mov         dword ptr ds:[8155F0],edx;gvar_008155F0:TSpVoice
 005D0870    call        TObject.Free
 005D0875    pop         edi
 005D0876    pop         esi
 005D0877    pop         ebx
 005D0878    ret
*}
end;

//005D087C
procedure sub_005D087C;
begin
{*
 005D087C    mov         byte ptr ds:[78A038],0;gvar_0078A038
 005D0883    call        005D0828
 005D0888    ret
*}
end;

//005D088C
{*function sub_005D088C:?;
begin
 005D088C    push        ebp
 005D088D    mov         ebp,esp
 005D088F    push        0
 005D0891    push        ebx
 005D0892    push        esi
 005D0893    xor         eax,eax
 005D0895    push        ebp
 005D0896    push        5D09E0
 005D089B    push        dword ptr fs:[eax]
 005D089E    mov         dword ptr fs:[eax],esp
 005D08A1    mov         dl,1
 005D08A3    mov         eax,[0043C7BC];TStringList
 005D08A8    call        TStringList.Create;TStringList.Create
 005D08AD    mov         ebx,eax
 005D08AF    mov         dl,1
 005D08B1    mov         eax,ebx
 005D08B3    call        TStringList.SetSorted
 005D08B8    xor         esi,esi
 005D08BA    lea         edx,[ebp-4]
 005D08BD    mov         eax,esi
 005D08BF    call        005CE284
 005D08C4    cmp         dword ptr [ebp-4],0
>005D08C8    je          005D08D4
 005D08CA    mov         edx,dword ptr [ebp-4]
 005D08CD    mov         eax,ebx
 005D08CF    mov         ecx,dword ptr [eax]
 005D08D1    call        dword ptr [ecx+38];TStringList.Add
 005D08D4    inc         esi
 005D08D5    cmp         esi,0F
>005D08D8    jne         005D08BA
 005D08DA    mov         edx,5D09FC;'Sam.'
 005D08DF    mov         eax,ebx
 005D08E1    mov         ecx,dword ptr [eax]
 005D08E3    call        dword ptr [ecx+38];TStringList.Add
 005D08E6    mov         edx,5D0A14;'Mike.'
 005D08EB    mov         eax,ebx
 005D08ED    mov         ecx,dword ptr [eax]
 005D08EF    call        dword ptr [ecx+38];TStringList.Add
 005D08F2    mov         edx,5D0A2C;'Mary.'
 005D08F7    mov         eax,ebx
 005D08F9    mov         ecx,dword ptr [eax]
 005D08FB    call        dword ptr [ecx+38];TStringList.Add
 005D08FE    mov         edx,5D0A44;'Anna.'
 005D0903    mov         eax,ebx
 005D0905    mov         ecx,dword ptr [eax]
 005D0907    call        dword ptr [ecx+38];TStringList.Add
 005D090A    mov         edx,5D0A5C;'Lili.'
 005D090F    mov         eax,ebx
 005D0911    mov         ecx,dword ptr [eax]
 005D0913    call        dword ptr [ecx+38];TStringList.Add
 005D0916    mov         edx,5D0A74;'Michael.'
 005D091B    mov         eax,ebx
 005D091D    mov         ecx,dword ptr [eax]
 005D091F    call        dword ptr [ecx+38];TStringList.Add
 005D0922    mov         edx,5D0A94;'Michelle.'
 005D0927    mov         eax,ebx
 005D0929    mov         ecx,dword ptr [eax]
 005D092B    call        dword ptr [ecx+38];TStringList.Add
 005D092E    mov         edx,5D0AB4;'Kal.'
 005D0933    mov         eax,ebx
 005D0935    mov         ecx,dword ptr [eax]
 005D0937    call        dword ptr [ecx+38];TStringList.Add
 005D093A    mov         edx,5D0ACC;'David.'
 005D093F    mov         eax,ebx
 005D0941    mov         ecx,dword ptr [eax]
 005D0943    call        dword ptr [ecx+38];TStringList.Add
 005D0946    mov         edx,5D0AE8;^338:Single
 005D094B    mov         eax,ebx
 005D094D    mov         ecx,dword ptr [eax]
 005D094F    call        dword ptr [ecx+38];TStringList.Add
 005D0952    mov         edx,5D0B04;'William.'
 005D0957    mov         eax,ebx
 005D0959    mov         ecx,dword ptr [eax]
 005D095B    call        dword ptr [ecx+38];TStringList.Add
 005D095E    mov         edx,5D0B24;'Amy.'
 005D0963    mov         eax,ebx
 005D0965    mov         ecx,dword ptr [eax]
 005D0967    call        dword ptr [ecx+38];TStringList.Add
 005D096A    mov         edx,5D0B3C;'Frank.'
 005D096F    mov         eax,ebx
 005D0971    mov         ecx,dword ptr [eax]
 005D0973    call        dword ptr [ecx+38];TStringList.Add
 005D0976    mov         edx,5D0B58;'Emily.'
 005D097B    mov         eax,ebx
 005D097D    mov         ecx,dword ptr [eax]
 005D097F    call        dword ptr [ecx+38];TStringList.Add
 005D0982    mov         edx,5D0B74;'Duncan.'
 005D0987    mov         eax,ebx
 005D0989    mov         ecx,dword ptr [eax]
 005D098B    call        dword ptr [ecx+38];TStringList.Add
 005D098E    mov         edx,5D0B90;'Linda.'
 005D0993    mov         eax,ebx
 005D0995    mov         ecx,dword ptr [eax]
 005D0997    call        dword ptr [ecx+38];TStringList.Add
 005D099A    mov         edx,5D0BAC;'Robin.'
 005D099F    mov         eax,ebx
 005D09A1    mov         ecx,dword ptr [eax]
 005D09A3    call        dword ptr [ecx+38];TStringList.Add
 005D09A6    mov         edx,5D0BC8;'Walter.'
 005D09AB    mov         eax,ebx
 005D09AD    mov         ecx,dword ptr [eax]
 005D09AF    call        dword ptr [ecx+38];TStringList.Add
 005D09B2    mov         edx,5D0BE4;'Lawrence.'
 005D09B7    mov         eax,ebx
 005D09B9    mov         ecx,dword ptr [eax]
 005D09BB    call        dword ptr [ecx+38];TStringList.Add
 005D09BE    mov         edx,5D0C04;'Millie.'
 005D09C3    mov         eax,ebx
 005D09C5    mov         ecx,dword ptr [eax]
 005D09C7    call        dword ptr [ecx+38];TStringList.Add
 005D09CA    xor         eax,eax
 005D09CC    pop         edx
 005D09CD    pop         ecx
 005D09CE    pop         ecx
 005D09CF    mov         dword ptr fs:[eax],edx
 005D09D2    push        5D09E7
 005D09D7    lea         eax,[ebp-4]
 005D09DA    call        @UStrClr
 005D09DF    ret
>005D09E0    jmp         @HandleFinally
>005D09E5    jmp         005D09D7
 005D09E7    mov         eax,ebx
 005D09E9    pop         esi
 005D09EA    pop         ebx
 005D09EB    pop         ecx
 005D09EC    pop         ebp
 005D09ED    ret
end;*}

//005D0C14
{*function sub_005D0C14(?:?):?;
begin
 005D0C14    push        ebp
 005D0C15    mov         ebp,esp
 005D0C17    add         esp,0FFFFFFF8
 005D0C1A    push        ebx
 005D0C1B    xor         edx,edx
 005D0C1D    mov         dword ptr [ebp-8],edx
 005D0C20    mov         dword ptr [ebp-4],eax
 005D0C23    mov         eax,dword ptr [ebp-4]
 005D0C26    call        @UStrAddRef
 005D0C2B    xor         eax,eax
 005D0C2D    push        ebp
 005D0C2E    push        5D0C89
 005D0C33    push        dword ptr fs:[eax]
 005D0C36    mov         dword ptr fs:[eax],esp
 005D0C39    lea         edx,[ebp-8]
 005D0C3C    mov         eax,dword ptr [ebp-4]
 005D0C3F    call        LowerCase
 005D0C44    mov         eax,dword ptr [ebp-8]
 005D0C47    mov         edx,5D0CA4;'speech'
 005D0C4C    call        @UStrEqual
>005D0C51    jne         005D0C57
 005D0C53    mov         bl,1
>005D0C55    jmp         005D0C6E
 005D0C57    lea         eax,[ebp-4]
 005D0C5A    mov         edx,5D0CC0;'Speech.'
 005D0C5F    call        004F9BD0
 005D0C64    test        al,al
>005D0C66    jne         005D0C6C
 005D0C68    xor         ebx,ebx
>005D0C6A    jmp         005D0C6E
 005D0C6C    mov         bl,1
 005D0C6E    xor         eax,eax
 005D0C70    pop         edx
 005D0C71    pop         ecx
 005D0C72    pop         ecx
 005D0C73    mov         dword ptr fs:[eax],edx
 005D0C76    push        5D0C90
 005D0C7B    lea         eax,[ebp-8]
 005D0C7E    mov         edx,2
 005D0C83    call        @UStrArrayClr
 005D0C88    ret
>005D0C89    jmp         @HandleFinally
>005D0C8E    jmp         005D0C7B
 005D0C90    mov         eax,ebx
 005D0C92    pop         ebx
 005D0C93    pop         ecx
 005D0C94    pop         ecx
 005D0C95    pop         ebp
 005D0C96    ret
end;*}

//005D0CD0
{*function sub_005D0CD0(?:?):?;
begin
 005D0CD0    push        ebp
 005D0CD1    mov         ebp,esp
 005D0CD3    xor         ecx,ecx
 005D0CD5    push        ecx
 005D0CD6    push        ecx
 005D0CD7    push        ecx
 005D0CD8    push        ecx
 005D0CD9    push        ebx
 005D0CDA    push        esi
 005D0CDB    push        edi
 005D0CDC    mov         dword ptr [ebp-4],eax
 005D0CDF    mov         eax,dword ptr [ebp-4]
 005D0CE2    call        @UStrAddRef
 005D0CE7    xor         eax,eax
 005D0CE9    push        ebp
 005D0CEA    push        5D0DED
 005D0CEF    push        dword ptr fs:[eax]
 005D0CF2    mov         dword ptr fs:[eax],esp
 005D0CF5    xor         ebx,ebx
 005D0CF7    lea         eax,[ebp-8]
 005D0CFA    mov         edx,dword ptr [ebp-4]
 005D0CFD    call        @UStrLAsg
 005D0D02    lea         edx,[ebp-10]
 005D0D05    mov         eax,dword ptr [ebp-8]
 005D0D08    call        LowerCase
 005D0D0D    mov         eax,dword ptr [ebp-10]
 005D0D10    mov         edx,5D0E0C;'speech'
 005D0D15    call        @UStrEqual
>005D0D1A    jne         005D0D34
 005D0D1C    mov         dl,1
 005D0D1E    mov         eax,[005CDE7C];TSpeechValue
 005D0D23    call        TSpeechValue.Create;TSpeechValue.Create
 005D0D28    mov         ebx,eax
 005D0D2A    xor         eax,eax
 005D0D2C    mov         dword ptr [ebx+18],eax;TSpeechValue.Item:Integer
>005D0D2F    jmp         005D0DD2
 005D0D34    lea         eax,[ebp-8]
 005D0D37    mov         edx,5D0E28;'Speech.'
 005D0D3C    call        004F9BD0
 005D0D41    test        al,al
>005D0D43    je          005D0DD2
 005D0D49    xor         esi,esi
 005D0D4B    mov         edx,dword ptr [ebp-8]
 005D0D4E    mov         eax,5D0E44;'.'
 005D0D53    call        Pos
 005D0D58    test        eax,eax
>005D0D5A    jle         005D0DB0
 005D0D5C    lea         eax,[ebp-0C]
 005D0D5F    push        eax
 005D0D60    mov         edx,dword ptr [ebp-8]
 005D0D63    mov         eax,5D0E44;'.'
 005D0D68    call        Pos
 005D0D6D    mov         ecx,eax
 005D0D6F    dec         ecx
 005D0D70    mov         edx,1
 005D0D75    mov         eax,dword ptr [ebp-8]
 005D0D78    call        @UStrCopy
 005D0D7D    mov         edx,dword ptr [ebp-0C]
 005D0D80    mov         eax,[008155E8];gvar_008155E8:THashTable
 005D0D85    call        THashTable.Get
 005D0D8A    mov         esi,eax
 005D0D8C    test        esi,esi
>005D0D8E    jge         005D0D94
 005D0D90    xor         esi,esi
>005D0D92    jmp         005D0DB0
 005D0D94    mov         eax,dword ptr [ebp-0C]
 005D0D97    test        eax,eax
>005D0D99    je          005D0DA0
 005D0D9B    sub         eax,4
 005D0D9E    mov         eax,dword ptr [eax]
 005D0DA0    lea         ecx,[eax+1]
 005D0DA3    lea         eax,[ebp-8]
 005D0DA6    mov         edx,1
 005D0DAB    call        @UStrDelete
 005D0DB0    mov         eax,dword ptr [ebp-8]
 005D0DB3    call        005CE234
 005D0DB8    mov         edi,eax
 005D0DBA    test        edi,edi
>005D0DBC    jl          005D0DD2
 005D0DBE    mov         dl,1
 005D0DC0    mov         eax,[005CDE7C];TSpeechValue
 005D0DC5    call        TSpeechValue.Create;TSpeechValue.Create
 005D0DCA    mov         ebx,eax
 005D0DCC    mov         dword ptr [ebx+1C],esi;TSpeechValue.Speaker:Integer
 005D0DCF    mov         dword ptr [ebx+18],edi;TSpeechValue.Item:Integer
 005D0DD2    xor         eax,eax
 005D0DD4    pop         edx
 005D0DD5    pop         ecx
 005D0DD6    pop         ecx
 005D0DD7    mov         dword ptr fs:[eax],edx
 005D0DDA    push        5D0DF4
 005D0DDF    lea         eax,[ebp-10]
 005D0DE2    mov         edx,4
 005D0DE7    call        @UStrArrayClr
 005D0DEC    ret
>005D0DED    jmp         @HandleFinally
>005D0DF2    jmp         005D0DDF
 005D0DF4    mov         eax,ebx
 005D0DF6    pop         edi
 005D0DF7    pop         esi
 005D0DF8    pop         ebx
 005D0DF9    mov         esp,ebp
 005D0DFB    pop         ebp
 005D0DFC    ret
end;*}

Initialization
//007816DC
{*
 007816DC    push        ebp
 007816DD    mov         ebp,esp
 007816DF    push        ebx
 007816E0    push        esi
 007816E1    push        edi
 007816E2    xor         eax,eax
 007816E4    push        ebp
 007816E5    push        781770
 007816EA    push        dword ptr fs:[eax]
 007816ED    mov         dword ptr fs:[eax],esp
 007816F0    sub         dword ptr ds:[8155E4],1
>007816F7    jae         00781762
 007816F9    xor         edx,edx
 007816FB    push        ebp
 007816FC    push        781747
 00781701    push        dword ptr fs:[edx]
 00781704    mov         dword ptr fs:[edx],esp
 00781707    mov         eax,781788;'Initializing PieSpeech'
 0078170C    call        004FA5FC
 00781711    mov         dl,1
 00781713    mov         eax,[0067D4A4];THashTable
 00781718    call        THashTable.Create;THashTable.Create
 0078171D    mov         [008155EC],eax;gvar_008155EC:THashTable
 00781722    mov         dl,1
 00781724    mov         eax,[0067D4A4];THashTable
 00781729    call        THashTable.Create;THashTable.Create
 0078172E    mov         [008155E8],eax;gvar_008155E8:THashTable
 00781733    call        005CE29C
 00781738    call        005CFED4
 0078173D    xor         eax,eax
 0078173F    pop         edx
 00781740    pop         ecx
 00781741    pop         ecx
 00781742    mov         dword ptr fs:[eax],edx
>00781745    jmp         00781762
>00781747    jmp         @HandleOnException
 0078174C    dd          1
 00781750    dd          00418C04;Exception
 00781754    dd          00781758
 00781758    call        004FA644
 0078175D    call        @DoneExcept
 00781762    xor         eax,eax
 00781764    pop         edx
 00781765    pop         ecx
 00781766    pop         ecx
 00781767    mov         dword ptr fs:[eax],edx
 0078176A    push        781777
 0078176F    ret
>00781770    jmp         @HandleFinally
>00781775    jmp         0078176F
 00781777    pop         edi
 00781778    pop         esi
 00781779    pop         ebx
 0078177A    pop         ebp
 0078177B    ret
*}
Finalization
//005D0E48
{*
 005D0E48    push        ebp
 005D0E49    mov         ebp,esp
 005D0E4B    push        ebx
 005D0E4C    push        esi
 005D0E4D    push        edi
 005D0E4E    xor         eax,eax
 005D0E50    push        ebp
 005D0E51    push        5D0F1A
 005D0E56    push        dword ptr fs:[eax]
 005D0E59    mov         dword ptr fs:[eax],esp
 005D0E5C    inc         dword ptr ds:[8155E4]
>005D0E62    jne         005D0F0C
 005D0E68    xor         edx,edx
 005D0E6A    push        ebp
 005D0E6B    push        5D0EB3
 005D0E70    push        dword ptr fs:[edx]
 005D0E73    mov         dword ptr fs:[edx],esp
 005D0E76    mov         eax,5D0F34;'Finalizing PieSpeech'
 005D0E7B    call        004FA5FC
 005D0E80    call        005D0828
 005D0E85    mov         eax,[008155E8];gvar_008155E8:THashTable
 005D0E8A    xor         edx,edx
 005D0E8C    mov         dword ptr ds:[8155E8],edx;gvar_008155E8:THashTable
 005D0E92    call        TObject.Free
 005D0E97    mov         eax,[008155EC];gvar_008155EC:THashTable
 005D0E9C    xor         edx,edx
 005D0E9E    mov         dword ptr ds:[8155EC],edx;gvar_008155EC:THashTable
 005D0EA4    call        TObject.Free
 005D0EA9    xor         eax,eax
 005D0EAB    pop         edx
 005D0EAC    pop         ecx
 005D0EAD    pop         ecx
 005D0EAE    mov         dword ptr fs:[eax],edx
>005D0EB1    jmp         005D0ECE
>005D0EB3    jmp         @HandleOnException
 005D0EB8    dd          1
 005D0EBC    dd          00418C04;Exception
 005D0EC0    dd          005D0EC4
 005D0EC4    call        004FA644
 005D0EC9    call        @DoneExcept
 005D0ECE    mov         eax,78A034;gvar_0078A034
 005D0ED3    call        @UStrClr
 005D0ED8    mov         eax,815788;gvar_00815788:UnicodeString
 005D0EDD    mov         ecx,65
 005D0EE2    mov         edx,dword ptr ds:[40128C];string
 005D0EE8    call        @FinalizeArray
 005D0EED    mov         eax,81591C;gvar_0081591C:IInterface
 005D0EF2    mov         ecx,65
 005D0EF7    mov         edx,dword ptr ds:[5C55FC];ISpeechObjectToken
 005D0EFD    call        @FinalizeArray
 005D0F02    mov         eax,815AB0;gvar_00815AB0:IInterface
 005D0F07    call        @IntfClear
 005D0F0C    xor         eax,eax
 005D0F0E    pop         edx
 005D0F0F    pop         ecx
 005D0F10    pop         ecx
 005D0F11    mov         dword ptr fs:[eax],edx
 005D0F14    push        5D0F21
 005D0F19    ret
>005D0F1A    jmp         @HandleFinally
>005D0F1F    jmp         005D0F19
 005D0F21    pop         edi
 005D0F22    pop         esi
 005D0F23    pop         ebx
 005D0F24    pop         ebp
 005D0F25    ret
*}
end.