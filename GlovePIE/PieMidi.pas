//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieMidi;

interface

uses
  SysUtils, Classes;

type
  TMidiValue = class(TExpression)
  published
    function GetChannel:Integer;//006B1E24
    function GetOutDevice:Integer;//006B1F1C
    function SendMessage(Message:Cardinal):Boolean;//006B26B4
    function SendLongMessage(Message:Pointer; Size:Cardinal):Boolean;//006B2670
    procedure FillClone(c:TExpression);//006B1DF8
    function GetUnits:TUnits;//006B1FD4
    function GetInDevice:Integer;//006B1F0C
    procedure CreateClone;//006B1DE8
    procedure SetNoteVelocity(Note:Integer; Velocity:Integer);//006B2770
    //procedure GetString(?:?);//006B1F30
    function CanSet:Boolean;//006B14D4
    function GetDataType:TDataType;//006B1E3C
    procedure GetValue;//006B2000
    procedure SetControl(Control:Integer; Value:Integer);//006B26F0
    procedure SetNote(Note:Integer; OnOff:Boolean);//006B2718
    //function SetValue(NewValue:Double; ?:?):Boolean;//006B27A4
    //procedure ToString(?:?);//006B30E0
  public
    MidiNumberIn:Integer;//f18
    MidiNumberOut:Integer;//f1C
    ChannelNumber:Integer;//f20
    Item:Integer;//f24
    //procedure ToString(?:?); virtual;//006B30E0
    procedure GetValue; virtual;//v2C//006B2000
    //procedure GetString(?:?); virtual;//v38//006B1F30
    function GetDataType:TDataType; virtual;//v44//006B1E3C
    function GetUnits:TUnits; virtual;//v48//006B1FD4
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006B27A4
    function CanSet:Boolean; virtual;//v68//006B14D4
    procedure CreateClone; virtual;//v80//006B1DE8
    procedure FillClone(c:TExpression); virtual;//v84//006B1DF8
  end;
  TMidiChannelArray = array [1..?,1..?] of Byte;
  TMidiDevice = class(TObject)
  published
    procedure ReceiveMessage(Status:Byte; byte2:Byte; TimeStamp:Cardinal; byte4:Byte; byte3:Byte);//006B33A0
    procedure SendLongMessage(message:Pointer; Size:Cardinal);//006B376C
    destructor Destroy();//006B3310
    procedure ReceiveLongMessage(Hdr:PMidiHdr; TimeStamp:Cardinal);//006B339C
    procedure SendMessage(message:Cardinal);//006B381C
    procedure Open;//006B3344
    constructor Create(IsInput:Boolean; DriverNumber:Integer);//006B326C
    procedure Finish;//006B333C
    procedure Close;//006B31E0
  public
    MidiNumber:Integer;//f4
    Input:Boolean;//f8
    IsOpen:Boolean;//f9
    MustStayOpen:Boolean;//fA
    Used:Boolean;//fB
    Handle:Cardinal;//fC
    NoteState:TMidiChannelArray;//f10
    AftertouchState:TMidiChannelArray;//f810
    ControlState:TMidiChannelArray;//f1010
    ChannelPressure:?;//f1810
    Instrument:?;//f1820
    PitchWheel:?;//f1830
    SongPos:Cardinal;//f1850
    SongSelected:byte;//f1854
    SongPlaying:Boolean;//f1855
    Omni:Boolean;//f1856
    Mono:Boolean;//f1857
    MonoChannels:byte;//f1858
    ActiveSensingOn:Boolean;//f1859
    FirstNote:?;//f185A
    SecondNote:?;//f186A
    ThirdNote:?;//f187A
    FourthNote:?;//f188A
  end;
    //function sub_006A78B4:?;//006A78B4
    //function sub_006A7A48:?;//006A7A48
    //function sub_006A81B8(?:Integer; ?:Integer; ?:Integer):?;//006A81B8
    //function sub_006A81F0(?:Integer; ?:Integer; ?:?):?;//006A81F0
    //function sub_006A8240(?:?; ?:?; ?:?):?;//006A8240
    //function sub_006A827C(?:?; ?:?):?;//006A827C
    //function sub_006A82A0(?:?; ?:?):?;//006A82A0
    //procedure sub_006A82C4(?:?; ?:?; ?:?);//006A82C4
    //function sub_006A830C(?:?; ?:?):?;//006A830C
    //function sub_006A8348(?:Integer; ?:Integer; ?:Integer):?;//006A8348
    //function sub_006A8384(?:?):?;//006A8384
    procedure sub_006A8438(?:Integer);//006A8438
    //procedure sub_006A8460(?:?; ?:?);//006A8460
    //procedure sub_006A849C(?:?; ?:?);//006A849C
    //function sub_006A84D8(?:?):?;//006A84D8
    //function sub_006A851C(?:?):?;//006A851C
    //function sub_006A8604(?:?):?;//006A8604
    //function sub_006A86F0(?:?):?;//006A86F0
    //function sub_006A87E0(?:?):?;//006A87E0
    //function sub_006A8828(?:?):?;//006A8828
    //function sub_006A8870(?:?):?;//006A8870
    //function sub_006A88C4(?:?):?;//006A88C4
    //function sub_006A8920(?:UnicodeString):?;//006A8920
    procedure sub_006A8970(?:Integer; ?:UnicodeString);//006A8970
    procedure sub_006A8988;//006A8988
    //function sub_006B14CC:?;//006B14CC
    procedure sub_006B14D0;//006B14D0
    //function sub_006B14D8(?:?):?;//006B14D8
    procedure sub_006B3850;//006B3850
    procedure sub_006B3918;//006B3918
    procedure sub_006B39A0;//006B39A0
    procedure sub_006B3A48;//006B3A48
    procedure sub_006B3A4C;//006B3A4C
    procedure sub_006B3AD8;//006B3AD8

implementation

//006A78B4
{*function sub_006A78B4:?;
begin
 006A78B4    push        ebp
 006A78B5    mov         ebp,esp
 006A78B7    push        0
 006A78B9    push        ebx
 006A78BA    push        esi
 006A78BB    xor         eax,eax
 006A78BD    push        ebp
 006A78BE    push        6A796F
 006A78C3    push        dword ptr fs:[eax]
 006A78C6    mov         dword ptr fs:[eax],esp
 006A78C9    mov         dl,1
 006A78CB    mov         eax,[0043C7BC];TStringList
 006A78D0    call        TStringList.Create;TStringList.Create
 006A78D5    mov         esi,eax
 006A78D7    mov         dl,1
 006A78D9    mov         eax,esi
 006A78DB    call        TStringList.SetSorted
 006A78E0    xor         ebx,ebx
 006A78E2    lea         edx,[ebp-4]
 006A78E5    mov         eax,ebx
 006A78E7    call        006A8970
 006A78EC    cmp         dword ptr [ebp-4],0
>006A78F0    je          006A78FC
 006A78F2    mov         edx,dword ptr [ebp-4]
 006A78F5    mov         eax,esi
 006A78F7    mov         ecx,dword ptr [eax]
 006A78F9    call        dword ptr [ecx+38];TStringList.Add
 006A78FC    inc         ebx
 006A78FD    cmp         ebx,468
>006A7903    jne         006A78E2
 006A7905    mov         edx,6A798C;'Port'
 006A790A    mov         eax,esi
 006A790C    mov         ecx,dword ptr [eax]
 006A790E    call        dword ptr [ecx+38];TStringList.Add
 006A7911    mov         edx,6A79A4;'Thru'
 006A7916    mov         eax,esi
 006A7918    mov         ecx,dword ptr [eax]
 006A791A    call        dword ptr [ecx+38];TStringList.Add
 006A791D    mov         edx,6A79BC;'External'
 006A7922    mov         eax,esi
 006A7924    mov         ecx,dword ptr [eax]
 006A7926    call        dword ptr [ecx+38];TStringList.Add
 006A7929    mov         edx,6A79DC;'Software'
 006A792E    mov         eax,esi
 006A7930    mov         ecx,dword ptr [eax]
 006A7932    call        dword ptr [ecx+38];TStringList.Add
 006A7935    mov         edx,6A79FC;'Soundcard'
 006A793A    mov         eax,esi
 006A793C    mov         ecx,dword ptr [eax]
 006A793E    call        dword ptr [ecx+38];TStringList.Add
 006A7941    mov         edx,6A7A1C;'Player'
 006A7946    mov         eax,esi
 006A7948    mov         ecx,dword ptr [eax]
 006A794A    call        dword ptr [ecx+38];TStringList.Add
 006A794D    mov         edx,6A7A38;'Channel'
 006A7952    mov         eax,esi
 006A7954    mov         ecx,dword ptr [eax]
 006A7956    call        dword ptr [ecx+38];TStringList.Add
 006A7959    xor         eax,eax
 006A795B    pop         edx
 006A795C    pop         ecx
 006A795D    pop         ecx
 006A795E    mov         dword ptr fs:[eax],edx
 006A7961    push        6A7976
 006A7966    lea         eax,[ebp-4]
 006A7969    call        @UStrClr
 006A796E    ret
>006A796F    jmp         @HandleFinally
>006A7974    jmp         006A7966
 006A7976    mov         eax,esi
 006A7978    pop         esi
 006A7979    pop         ebx
 006A797A    pop         ecx
 006A797B    pop         ebp
 006A797C    ret
end;*}

//006A7A48
{*function sub_006A7A48:?;
begin
 006A7A48    push        ebp
 006A7A49    mov         ebp,esp
 006A7A4B    push        0
 006A7A4D    push        0
 006A7A4F    push        ebx
 006A7A50    push        esi
 006A7A51    xor         eax,eax
 006A7A53    push        ebp
 006A7A54    push        6A7C94
 006A7A59    push        dword ptr fs:[eax]
 006A7A5C    mov         dword ptr fs:[eax],esp
 006A7A5F    mov         dl,1
 006A7A61    mov         eax,[0043C7BC];TStringList
 006A7A66    call        TStringList.Create;TStringList.Create
 006A7A6B    mov         ebx,eax
 006A7A6D    mov         edx,6A7CB0;'FirstNote'
 006A7A72    mov         eax,ebx
 006A7A74    mov         ecx,dword ptr [eax]
 006A7A76    call        dword ptr [ecx+38];TStringList.Add
 006A7A79    mov         edx,6A7CD0;'Instrument'
 006A7A7E    mov         eax,ebx
 006A7A80    mov         ecx,dword ptr [eax]
 006A7A82    call        dword ptr [ecx+38];TStringList.Add
 006A7A85    mov         edx,6A7CF4;'PitchWheel'
 006A7A8A    mov         eax,ebx
 006A7A8C    mov         ecx,dword ptr [eax]
 006A7A8E    call        dword ptr [ecx+38];TStringList.Add
 006A7A91    mov         edx,6A7D18;'ChannelPressure'
 006A7A96    mov         eax,ebx
 006A7A98    mov         ecx,dword ptr [eax]
 006A7A9A    call        dword ptr [ecx+38];TStringList.Add
 006A7A9D    mov         edx,6A7D44;'C4'
 006A7AA2    mov         eax,ebx
 006A7AA4    mov         ecx,dword ptr [eax]
 006A7AA6    call        dword ptr [ecx+38];TStringList.Add
 006A7AA9    mov         edx,6A7D58;'CSharp4'
 006A7AAE    mov         eax,ebx
 006A7AB0    mov         ecx,dword ptr [eax]
 006A7AB2    call        dword ptr [ecx+38];TStringList.Add
 006A7AB5    mov         edx,6A7D74;'D4'
 006A7ABA    mov         eax,ebx
 006A7ABC    mov         ecx,dword ptr [eax]
 006A7ABE    call        dword ptr [ecx+38];TStringList.Add
 006A7AC1    mov         edx,6A7D88;'DSharp4'
 006A7AC6    mov         eax,ebx
 006A7AC8    mov         ecx,dword ptr [eax]
 006A7ACA    call        dword ptr [ecx+38];TStringList.Add
 006A7ACD    mov         edx,6A7DA4;'E4'
 006A7AD2    mov         eax,ebx
 006A7AD4    mov         ecx,dword ptr [eax]
 006A7AD6    call        dword ptr [ecx+38];TStringList.Add
 006A7AD9    mov         edx,6A7DB8;'F4'
 006A7ADE    mov         eax,ebx
 006A7AE0    mov         ecx,dword ptr [eax]
 006A7AE2    call        dword ptr [ecx+38];TStringList.Add
 006A7AE5    mov         edx,6A7DCC;'FSharp4'
 006A7AEA    mov         eax,ebx
 006A7AEC    mov         ecx,dword ptr [eax]
 006A7AEE    call        dword ptr [ecx+38];TStringList.Add
 006A7AF1    mov         edx,6A7DE8;'G4'
 006A7AF6    mov         eax,ebx
 006A7AF8    mov         ecx,dword ptr [eax]
 006A7AFA    call        dword ptr [ecx+38];TStringList.Add
 006A7AFD    mov         edx,6A7DFC;'GSharp4'
 006A7B02    mov         eax,ebx
 006A7B04    mov         ecx,dword ptr [eax]
 006A7B06    call        dword ptr [ecx+38];TStringList.Add
 006A7B09    mov         edx,6A7E18;'A4'
 006A7B0E    mov         eax,ebx
 006A7B10    mov         ecx,dword ptr [eax]
 006A7B12    call        dword ptr [ecx+38];TStringList.Add
 006A7B15    mov         edx,6A7E2C;'ASharp4'
 006A7B1A    mov         eax,ebx
 006A7B1C    mov         ecx,dword ptr [eax]
 006A7B1E    call        dword ptr [ecx+38];TStringList.Add
 006A7B21    mov         edx,6A7E48;'B4'
 006A7B26    mov         eax,ebx
 006A7B28    mov         ecx,dword ptr [eax]
 006A7B2A    call        dword ptr [ecx+38];TStringList.Add
 006A7B2D    mov         edx,6A7E5C;'MiddleC'
 006A7B32    mov         eax,ebx
 006A7B34    mov         ecx,dword ptr [eax]
 006A7B36    call        dword ptr [ecx+38];TStringList.Add
 006A7B39    mov         edx,6A7E78;'MiddleCSharp'
 006A7B3E    mov         eax,ebx
 006A7B40    mov         ecx,dword ptr [eax]
 006A7B42    call        dword ptr [ecx+38];TStringList.Add
 006A7B45    mov         edx,6A7EA0;'MiddleD'
 006A7B4A    mov         eax,ebx
 006A7B4C    mov         ecx,dword ptr [eax]
 006A7B4E    call        dword ptr [ecx+38];TStringList.Add
 006A7B51    mov         edx,6A7EBC;'MiddleDSharp'
 006A7B56    mov         eax,ebx
 006A7B58    mov         ecx,dword ptr [eax]
 006A7B5A    call        dword ptr [ecx+38];TStringList.Add
 006A7B5D    mov         edx,6A7EE4;'MiddleE'
 006A7B62    mov         eax,ebx
 006A7B64    mov         ecx,dword ptr [eax]
 006A7B66    call        dword ptr [ecx+38];TStringList.Add
 006A7B69    mov         edx,6A7F00;'MiddleF'
 006A7B6E    mov         eax,ebx
 006A7B70    mov         ecx,dword ptr [eax]
 006A7B72    call        dword ptr [ecx+38];TStringList.Add
 006A7B75    mov         edx,6A7F1C;'MiddleFSharp'
 006A7B7A    mov         eax,ebx
 006A7B7C    mov         ecx,dword ptr [eax]
 006A7B7E    call        dword ptr [ecx+38];TStringList.Add
 006A7B81    mov         edx,6A7F44;'MiddleG'
 006A7B86    mov         eax,ebx
 006A7B88    mov         ecx,dword ptr [eax]
 006A7B8A    call        dword ptr [ecx+38];TStringList.Add
 006A7B8D    mov         edx,6A7F60;'MiddleGSharp'
 006A7B92    mov         eax,ebx
 006A7B94    mov         ecx,dword ptr [eax]
 006A7B96    call        dword ptr [ecx+38];TStringList.Add
 006A7B99    mov         edx,6A7F88;'MiddleA'
 006A7B9E    mov         eax,ebx
 006A7BA0    mov         ecx,dword ptr [eax]
 006A7BA2    call        dword ptr [ecx+38];TStringList.Add
 006A7BA5    mov         edx,6A7FA4;'MiddleASharp'
 006A7BAA    mov         eax,ebx
 006A7BAC    mov         ecx,dword ptr [eax]
 006A7BAE    call        dword ptr [ecx+38];TStringList.Add
 006A7BB1    mov         edx,6A7FCC;'MiddleB'
 006A7BB6    mov         eax,ebx
 006A7BB8    mov         ecx,dword ptr [eax]
 006A7BBA    call        dword ptr [ecx+38];TStringList.Add
 006A7BBD    mov         edx,6A7FE8;'C5'
 006A7BC2    mov         eax,ebx
 006A7BC4    mov         ecx,dword ptr [eax]
 006A7BC6    call        dword ptr [ecx+38];TStringList.Add
 006A7BC9    mov         edx,6A7FFC;'CSharp5'
 006A7BCE    mov         eax,ebx
 006A7BD0    mov         ecx,dword ptr [eax]
 006A7BD2    call        dword ptr [ecx+38];TStringList.Add
 006A7BD5    mov         edx,6A8018;'D5'
 006A7BDA    mov         eax,ebx
 006A7BDC    mov         ecx,dword ptr [eax]
 006A7BDE    call        dword ptr [ecx+38];TStringList.Add
 006A7BE1    mov         edx,6A802C;'DSharp5'
 006A7BE6    mov         eax,ebx
 006A7BE8    mov         ecx,dword ptr [eax]
 006A7BEA    call        dword ptr [ecx+38];TStringList.Add
 006A7BED    mov         edx,6A8048;'E5'
 006A7BF2    mov         eax,ebx
 006A7BF4    mov         ecx,dword ptr [eax]
 006A7BF6    call        dword ptr [ecx+38];TStringList.Add
 006A7BF9    mov         edx,6A805C;'F5'
 006A7BFE    mov         eax,ebx
 006A7C00    mov         ecx,dword ptr [eax]
 006A7C02    call        dword ptr [ecx+38];TStringList.Add
 006A7C05    mov         edx,6A8070;'FSharp5'
 006A7C0A    mov         eax,ebx
 006A7C0C    mov         ecx,dword ptr [eax]
 006A7C0E    call        dword ptr [ecx+38];TStringList.Add
 006A7C11    mov         edx,6A808C;'G5'
 006A7C16    mov         eax,ebx
 006A7C18    mov         ecx,dword ptr [eax]
 006A7C1A    call        dword ptr [ecx+38];TStringList.Add
 006A7C1D    mov         edx,6A80A0;'GSharp5'
 006A7C22    mov         eax,ebx
 006A7C24    mov         ecx,dword ptr [eax]
 006A7C26    call        dword ptr [ecx+38];TStringList.Add
 006A7C29    mov         edx,6A80BC;'A5'
 006A7C2E    mov         eax,ebx
 006A7C30    mov         ecx,dword ptr [eax]
 006A7C32    call        dword ptr [ecx+38];TStringList.Add
 006A7C35    mov         edx,6A80D0;'ASharp5'
 006A7C3A    mov         eax,ebx
 006A7C3C    mov         ecx,dword ptr [eax]
 006A7C3E    call        dword ptr [ecx+38];TStringList.Add
 006A7C41    mov         edx,6A80EC;'B5'
 006A7C46    mov         eax,ebx
 006A7C48    mov         ecx,dword ptr [eax]
 006A7C4A    call        dword ptr [ecx+38];TStringList.Add
 006A7C4D    xor         esi,esi
 006A7C4F    lea         edx,[ebp-8]
 006A7C52    mov         eax,esi
 006A7C54    call        IntToStr
 006A7C59    mov         ecx,dword ptr [ebp-8]
 006A7C5C    lea         eax,[ebp-4]
 006A7C5F    mov         edx,6A8100;'cc'
 006A7C64    call        @UStrCat3
 006A7C69    mov         edx,dword ptr [ebp-4]
 006A7C6C    mov         eax,ebx
 006A7C6E    mov         ecx,dword ptr [eax]
 006A7C70    call        dword ptr [ecx+38];TStringList.Add
 006A7C73    inc         esi
 006A7C74    cmp         esi,60
>006A7C77    jne         006A7C4F
 006A7C79    xor         eax,eax
 006A7C7B    pop         edx
 006A7C7C    pop         ecx
 006A7C7D    pop         ecx
 006A7C7E    mov         dword ptr fs:[eax],edx
 006A7C81    push        6A7C9B
 006A7C86    lea         eax,[ebp-8]
 006A7C89    mov         edx,2
 006A7C8E    call        @UStrArrayClr
 006A7C93    ret
>006A7C94    jmp         @HandleFinally
>006A7C99    jmp         006A7C86
 006A7C9B    mov         eax,ebx
 006A7C9D    pop         esi
 006A7C9E    pop         ebx
 006A7C9F    pop         ecx
 006A7CA0    pop         ecx
 006A7CA1    pop         ebp
 006A7CA2    ret
end;*}

//006A81B8
{*function sub_006A81B8(?:Integer; ?:Integer; ?:Integer):?;
begin
 006A81B8    dec         eax
 006A81B9    add         al,90
 006A81BB    test        edx,edx
>006A81BD    jge         006A81C1
 006A81BF    xor         edx,edx
 006A81C1    cmp         edx,7F
>006A81C4    jle         006A81CB
 006A81C6    mov         edx,7F
 006A81CB    test        ecx,ecx
>006A81CD    jge         006A81D1
 006A81CF    xor         ecx,ecx
 006A81D1    cmp         ecx,7F
>006A81D4    jle         006A81DB
 006A81D6    mov         ecx,7F
 006A81DB    movzx       eax,al
 006A81DE    movzx       edx,dl
 006A81E1    shl         edx,8
 006A81E4    add         eax,edx
 006A81E6    movzx       edx,cl
 006A81E9    shl         edx,10
 006A81EC    add         eax,edx
 006A81EE    ret
end;*}

//006A81F0
{*function sub_006A81F0(?:Integer; ?:Integer; ?:?):?;
begin
 006A81F0    test        eax,eax
>006A81F2    jge         006A81F8
 006A81F4    xor         eax,eax
>006A81F6    jmp         006A8202
 006A81F8    cmp         eax,7F
>006A81FB    jle         006A8202
 006A81FD    mov         eax,7F
 006A8202    dec         eax
 006A8203    add         al,80
 006A8205    test        edx,edx
>006A8207    jge         006A820D
 006A8209    xor         edx,edx
>006A820B    jmp         006A8217
 006A820D    cmp         edx,7F
>006A8210    jle         006A8217
 006A8212    mov         edx,7F
 006A8217    test        ecx,ecx
>006A8219    jge         006A821F
 006A821B    xor         ecx,ecx
>006A821D    jmp         006A8229
 006A821F    cmp         ecx,7F
>006A8222    jle         006A8229
 006A8224    mov         ecx,7F
 006A8229    movzx       eax,al
 006A822C    movzx       edx,dl
 006A822F    shl         edx,8
 006A8232    add         eax,edx
 006A8234    movzx       edx,cl
 006A8237    shl         edx,10
 006A823A    add         eax,edx
 006A823C    ret
end;*}

//006A8240
{*function sub_006A8240(?:?; ?:?; ?:?):?;
begin
 006A8240    dec         eax
 006A8241    add         al,0A0
 006A8243    test        edx,edx
>006A8245    jge         006A8249
 006A8247    xor         edx,edx
 006A8249    cmp         edx,7F
>006A824C    jle         006A8253
 006A824E    mov         edx,7F
 006A8253    test        ecx,ecx
>006A8255    jge         006A825B
 006A8257    xor         ecx,ecx
>006A8259    jmp         006A8265
 006A825B    cmp         ecx,7F
>006A825E    jle         006A8265
 006A8260    mov         ecx,7F
 006A8265    movzx       eax,al
 006A8268    movzx       edx,dl
 006A826B    shl         edx,8
 006A826E    add         eax,edx
 006A8270    movzx       edx,cl
 006A8273    shl         edx,10
 006A8276    add         eax,edx
 006A8278    ret
end;*}

//006A827C
{*function sub_006A827C(?:?; ?:?):?;
begin
 006A827C    dec         eax
 006A827D    add         al,0A0
 006A827F    test        edx,edx
>006A8281    jge         006A8287
 006A8283    xor         edx,edx
>006A8285    jmp         006A8291
 006A8287    cmp         edx,7F
>006A828A    jle         006A8291
 006A828C    mov         edx,7F
 006A8291    movzx       eax,al
 006A8294    movzx       edx,dl
 006A8297    shl         edx,8
 006A829A    add         eax,edx
 006A829C    ret
end;*}

//006A82A0
{*function sub_006A82A0(?:?; ?:?):?;
begin
 006A82A0    dec         eax
 006A82A1    add         al,0C0
 006A82A3    test        edx,edx
>006A82A5    jge         006A82AB
 006A82A7    xor         edx,edx
>006A82A9    jmp         006A82B5
 006A82AB    cmp         edx,7F
>006A82AE    jle         006A82B5
 006A82B0    mov         edx,7F
 006A82B5    movzx       eax,al
 006A82B8    movzx       edx,dl
 006A82BB    shl         edx,8
 006A82BE    add         eax,edx
 006A82C0    ret
end;*}

//006A82C4
{*procedure sub_006A82C4(?:?; ?:?; ?:?);
begin
 006A82C4    push        ebp
 006A82C5    mov         ebp,esp
 006A82C7    push        ebx
 006A82C8    push        esi
 006A82C9    mov         esi,edx
 006A82CB    mov         ebx,eax
 006A82CD    fld         qword ptr [ebp+8]
 006A82D0    fmul        dword ptr ds:[6A8308];16383:Single
 006A82D6    call        @ROUND
 006A82DB    test        eax,eax
>006A82DD    jge         006A82E1
 006A82DF    xor         eax,eax
 006A82E1    cmp         eax,3FFF
>006A82E6    jle         006A82ED
 006A82E8    mov         eax,3FFF
 006A82ED    mov         edx,eax
 006A82EF    and         dl,7F
 006A82F2    mov         byte ptr [ebx],dl
 006A82F4    test        eax,eax
>006A82F6    jns         006A82FB
 006A82F8    add         eax,7F
 006A82FB    sar         eax,7
 006A82FE    mov         byte ptr [esi],al
 006A8300    pop         esi
 006A8301    pop         ebx
 006A8302    pop         ebp
 006A8303    ret         8
end;*}

//006A830C
{*function sub_006A830C(?:?; ?:?):?;
begin
 006A830C    dec         eax
 006A830D    add         al,0E0
 006A830F    test        edx,edx
>006A8311    jge         006A8317
 006A8313    xor         edx,edx
>006A8315    jmp         006A8324
 006A8317    cmp         edx,3FFF
>006A831D    jle         006A8324
 006A831F    mov         edx,3FFF
 006A8324    mov         ecx,edx
 006A8326    and         cl,7F
 006A8329    test        edx,edx
>006A832B    jns         006A8330
 006A832D    add         edx,7F
 006A8330    sar         edx,7
 006A8333    movzx       eax,al
 006A8336    movzx       ecx,cl
 006A8339    shl         ecx,8
 006A833C    add         eax,ecx
 006A833E    movzx       edx,dl
 006A8341    shl         edx,10
 006A8344    add         eax,edx
 006A8346    ret
end;*}

//006A8348
{*function sub_006A8348(?:Integer; ?:Integer; ?:Integer):?;
begin
 006A8348    dec         eax
 006A8349    add         al,0B0
 006A834B    test        edx,edx
>006A834D    jge         006A8353
 006A834F    xor         edx,edx
>006A8351    jmp         006A835D
 006A8353    cmp         edx,7F
>006A8356    jle         006A835D
 006A8358    mov         edx,7F
 006A835D    test        ecx,ecx
>006A835F    jge         006A8365
 006A8361    xor         ecx,ecx
>006A8363    jmp         006A836F
 006A8365    cmp         ecx,7F
>006A8368    jle         006A836F
 006A836A    mov         ecx,7F
 006A836F    movzx       eax,al
 006A8372    movzx       edx,dl
 006A8375    shl         edx,8
 006A8378    add         eax,edx
 006A837A    movzx       edx,cl
 006A837D    shl         edx,10
 006A8380    add         eax,edx
 006A8382    ret
end;*}

//006A8384
{*function sub_006A8384(?:?):?;
begin
 006A8384    push        ebp
 006A8385    mov         ebp,esp
 006A8387    push        ecx
 006A8388    push        ebx
 006A8389    mov         dword ptr [ebp-4],eax
 006A838C    mov         eax,dword ptr [ebp-4]
 006A838F    call        @UStrAddRef
 006A8394    xor         eax,eax
 006A8396    push        ebp
 006A8397    push        6A8403
 006A839C    push        dword ptr fs:[eax]
 006A839F    mov         dword ptr fs:[eax],esp
 006A83A2    mov         eax,dword ptr [ebp-4]
 006A83A5    test        eax,eax
>006A83A7    je          006A83AE
 006A83A9    sub         eax,4
 006A83AC    mov         eax,dword ptr [eax]
 006A83AE    cmp         eax,5
>006A83B1    jge         006A83B7
 006A83B3    mov         al,1
>006A83B5    jmp         006A83C6
 006A83B7    lea         eax,[ebp-4]
 006A83BA    mov         edx,6A841C;'midi'
 006A83BF    call        004F9BD0
 006A83C4    xor         al,1
 006A83C6    test        al,al
>006A83C8    je          006A83CE
 006A83CA    xor         ebx,ebx
>006A83CC    jmp         006A83ED
 006A83CE    lea         eax,[ebp-4]
 006A83D1    call        004F9D00
 006A83D6    lea         eax,[ebp-4]
 006A83D9    mov         edx,6A8434;'.'
 006A83DE    call        004F9BD0
 006A83E3    test        al,al
>006A83E5    jne         006A83EB
 006A83E7    xor         ebx,ebx
>006A83E9    jmp         006A83ED
 006A83EB    mov         bl,1
 006A83ED    xor         eax,eax
 006A83EF    pop         edx
 006A83F0    pop         ecx
 006A83F1    pop         ecx
 006A83F2    mov         dword ptr fs:[eax],edx
 006A83F5    push        6A840A
 006A83FA    lea         eax,[ebp-4]
 006A83FD    call        @UStrClr
 006A8402    ret
>006A8403    jmp         @HandleFinally
>006A8408    jmp         006A83FA
 006A840A    mov         eax,ebx
 006A840C    pop         ebx
 006A840D    pop         ecx
 006A840E    pop         ebp
 006A840F    ret
end;*}

//006A8438
procedure sub_006A8438(?:Integer);
begin
{*
 006A8438    push        ebx
 006A8439    add         esp,0FFFFFFAC
 006A843C    mov         ebx,eax
 006A843E    push        54
 006A8440    lea         eax,[esp+4]
 006A8444    push        eax
 006A8445    push        ebx
 006A8446    call        winmm.midiOutGetDevCapsW
 006A844B    test        eax,eax
>006A844D    jne         006A8456
 006A844F    movzx       eax,word ptr [esp+48]
>006A8454    jmp         006A8458
 006A8456    xor         eax,eax
 006A8458    add         esp,54
 006A845B    pop         ebx
 006A845C    ret
*}
end;

//006A8460
{*procedure sub_006A8460(?:?; ?:?);
begin
 006A8460    push        ebx
 006A8461    push        esi
 006A8462    add         esp,0FFFFFFAC
 006A8465    mov         ebx,edx
 006A8467    mov         esi,eax
 006A8469    push        54
 006A846B    lea         eax,[esp+4]
 006A846F    push        eax
 006A8470    push        esi
 006A8471    call        winmm.midiOutGetDevCapsW
 006A8476    test        eax,eax
>006A8478    jne         006A848C
 006A847A    mov         eax,ebx
 006A847C    lea         edx,[esp+8]
 006A8480    mov         ecx,20
 006A8485    call        @UStrFromWArray
>006A848A    jmp         006A8493
 006A848C    mov         eax,ebx
 006A848E    call        @UStrClr
 006A8493    add         esp,54
 006A8496    pop         esi
 006A8497    pop         ebx
 006A8498    ret
end;*}

//006A849C
{*procedure sub_006A849C(?:?; ?:?);
begin
 006A849C    push        ebx
 006A849D    push        esi
 006A849E    add         esp,0FFFFFFB4
 006A84A1    mov         ebx,edx
 006A84A3    mov         esi,eax
 006A84A5    push        4C
 006A84A7    lea         eax,[esp+4]
 006A84AB    push        eax
 006A84AC    push        esi
 006A84AD    call        winmm.midiInGetDevCapsW
 006A84B2    test        eax,eax
>006A84B4    jne         006A84C8
 006A84B6    mov         eax,ebx
 006A84B8    lea         edx,[esp+8]
 006A84BC    mov         ecx,20
 006A84C1    call        @UStrFromWArray
>006A84C6    jmp         006A84CF
 006A84C8    mov         eax,ebx
 006A84CA    call        @UStrClr
 006A84CF    add         esp,4C
 006A84D2    pop         esi
 006A84D3    pop         ebx
 006A84D4    ret
end;*}

//006A84D8
{*function sub_006A84D8(?:?):?;
begin
 006A84D8    push        ebx
 006A84D9    push        esi
 006A84DA    push        edi
 006A84DB    push        ebp
 006A84DC    push        ecx
 006A84DD    mov         dword ptr [esp],eax
 006A84E0    or          ebp,0FFFFFFFF
 006A84E3    xor         edi,edi
 006A84E5    call        winmm.midiOutGetNumDevs
 006A84EA    mov         esi,eax
 006A84EC    dec         esi
 006A84ED    test        esi,esi
>006A84EF    jl          006A8513
 006A84F1    inc         esi
 006A84F2    xor         ebx,ebx
 006A84F4    mov         eax,ebx
 006A84F6    call        006A8438
 006A84FB    dec         eax
>006A84FC    jne         006A850F
 006A84FE    inc         edi
 006A84FF    cmp         edi,1
>006A8502    jne         006A8506
 006A8504    mov         ebp,ebx
 006A8506    cmp         edi,dword ptr [esp]
>006A8509    jne         006A850F
 006A850B    mov         ebp,ebx
>006A850D    jmp         006A8513
 006A850F    inc         ebx
 006A8510    dec         esi
>006A8511    jne         006A84F4
 006A8513    mov         eax,ebp
 006A8515    pop         edx
 006A8516    pop         ebp
 006A8517    pop         edi
 006A8518    pop         esi
 006A8519    pop         ebx
 006A851A    ret
end;*}

//006A851C
{*function sub_006A851C(?:?):?;
begin
 006A851C    push        ebp
 006A851D    mov         ebp,esp
 006A851F    add         esp,0FFFFFFF4
 006A8522    push        ebx
 006A8523    push        esi
 006A8524    push        edi
 006A8525    xor         edx,edx
 006A8527    mov         dword ptr [ebp-4],edx
 006A852A    mov         dword ptr [ebp-8],eax
 006A852D    xor         eax,eax
 006A852F    push        ebp
 006A8530    push        6A85BD
 006A8535    push        dword ptr fs:[eax]
 006A8538    mov         dword ptr fs:[eax],esp
 006A853B    mov         dword ptr [ebp-0C],0FFFFFFFF
 006A8542    xor         edi,edi
 006A8544    call        winmm.midiOutGetNumDevs
 006A8549    mov         esi,eax
 006A854B    dec         esi
 006A854C    test        esi,esi
>006A854E    jl          006A8596
 006A8550    inc         esi
 006A8551    xor         ebx,ebx
 006A8553    lea         edx,[ebp-4]
 006A8556    mov         eax,ebx
 006A8558    call        006A8460
 006A855D    mov         edx,6A85DC;'MIDI Yoke'
 006A8562    mov         eax,dword ptr [ebp-4]
 006A8565    call        004F9A58
 006A856A    test        al,al
>006A856C    jne         006A857F
 006A856E    mov         edx,6A85FC;'LB'
 006A8573    mov         eax,dword ptr [ebp-4]
 006A8576    call        004F9A58
 006A857B    test        al,al
>006A857D    je          006A8592
 006A857F    inc         edi
 006A8580    cmp         edi,1
>006A8583    jne         006A8588
 006A8585    mov         dword ptr [ebp-0C],ebx
 006A8588    cmp         edi,dword ptr [ebp-8]
>006A858B    jne         006A8592
 006A858D    mov         dword ptr [ebp-0C],ebx
>006A8590    jmp         006A85A7
 006A8592    inc         ebx
 006A8593    dec         esi
>006A8594    jne         006A8553
 006A8596    cmp         dword ptr [ebp-0C],0
>006A859A    jge         006A85A7
 006A859C    mov         eax,dword ptr [ebp-8]
 006A859F    call        006A84D8
 006A85A4    mov         dword ptr [ebp-0C],eax
 006A85A7    xor         eax,eax
 006A85A9    pop         edx
 006A85AA    pop         ecx
 006A85AB    pop         ecx
 006A85AC    mov         dword ptr fs:[eax],edx
 006A85AF    push        6A85C4
 006A85B4    lea         eax,[ebp-4]
 006A85B7    call        @UStrClr
 006A85BC    ret
>006A85BD    jmp         @HandleFinally
>006A85C2    jmp         006A85B4
 006A85C4    mov         eax,dword ptr [ebp-0C]
 006A85C7    pop         edi
 006A85C8    pop         esi
 006A85C9    pop         ebx
 006A85CA    mov         esp,ebp
 006A85CC    pop         ebp
 006A85CD    ret
end;*}

//006A8604
{*function sub_006A8604(?:?):?;
begin
 006A8604    push        ebp
 006A8605    mov         ebp,esp
 006A8607    add         esp,0FFFFFFF4
 006A860A    push        ebx
 006A860B    push        esi
 006A860C    push        edi
 006A860D    xor         edx,edx
 006A860F    mov         dword ptr [ebp-4],edx
 006A8612    mov         dword ptr [ebp-8],eax
 006A8615    xor         eax,eax
 006A8617    push        ebp
 006A8618    push        6A86AB
 006A861D    push        dword ptr fs:[eax]
 006A8620    mov         dword ptr fs:[eax],esp
 006A8623    mov         dword ptr [ebp-0C],0FFFFFFFF
 006A862A    xor         edi,edi
 006A862C    call        winmm.midiOutGetNumDevs
 006A8631    mov         esi,eax
 006A8633    dec         esi
 006A8634    test        esi,esi
>006A8636    jl          006A8688
 006A8638    inc         esi
 006A8639    xor         ebx,ebx
 006A863B    lea         edx,[ebp-4]
 006A863E    mov         eax,ebx
 006A8640    call        006A8460
 006A8645    mov         eax,ebx
 006A8647    call        006A8438
 006A864C    dec         eax
>006A864D    jne         006A8684
 006A864F    mov         edx,6A86C8;'MIDI Yoke'
 006A8654    mov         eax,dword ptr [ebp-4]
 006A8657    call        004F9A58
 006A865C    test        al,al
>006A865E    jne         006A8684
 006A8660    mov         edx,6A86E8;'LB'
 006A8665    mov         eax,dword ptr [ebp-4]
 006A8668    call        004F9A58
 006A866D    test        al,al
>006A866F    jne         006A8684
 006A8671    inc         edi
 006A8672    cmp         edi,1
>006A8675    jne         006A867A
 006A8677    mov         dword ptr [ebp-0C],ebx
 006A867A    cmp         edi,dword ptr [ebp-8]
>006A867D    jne         006A8684
 006A867F    mov         dword ptr [ebp-0C],ebx
>006A8682    jmp         006A8695
 006A8684    inc         ebx
 006A8685    dec         esi
>006A8686    jne         006A863B
 006A8688    cmp         dword ptr [ebp-0C],0
>006A868C    jge         006A8695
 006A868E    mov         dword ptr [ebp-0C],0FFFFFFFF
 006A8695    xor         eax,eax
 006A8697    pop         edx
 006A8698    pop         ecx
 006A8699    pop         ecx
 006A869A    mov         dword ptr fs:[eax],edx
 006A869D    push        6A86B2
 006A86A2    lea         eax,[ebp-4]
 006A86A5    call        @UStrClr
 006A86AA    ret
>006A86AB    jmp         @HandleFinally
>006A86B0    jmp         006A86A2
 006A86B2    mov         eax,dword ptr [ebp-0C]
 006A86B5    pop         edi
 006A86B6    pop         esi
 006A86B7    pop         ebx
 006A86B8    mov         esp,ebp
 006A86BA    pop         ebp
 006A86BB    ret
end;*}

//006A86F0
{*function sub_006A86F0(?:?):?;
begin
 006A86F0    push        ebp
 006A86F1    mov         ebp,esp
 006A86F3    add         esp,0FFFFFFF4
 006A86F6    push        ebx
 006A86F7    push        esi
 006A86F8    push        edi
 006A86F9    xor         edx,edx
 006A86FB    mov         dword ptr [ebp-4],edx
 006A86FE    mov         dword ptr [ebp-8],eax
 006A8701    xor         eax,eax
 006A8703    push        ebp
 006A8704    push        6A879A
 006A8709    push        dword ptr fs:[eax]
 006A870C    mov         dword ptr fs:[eax],esp
 006A870F    mov         dword ptr [ebp-0C],0FFFFFFFF
 006A8716    xor         edi,edi
 006A8718    call        winmm.midiInGetNumDevs
 006A871D    mov         esi,eax
 006A871F    dec         esi
 006A8720    test        esi,esi
>006A8722    jl          006A876A
 006A8724    inc         esi
 006A8725    xor         ebx,ebx
 006A8727    lea         edx,[ebp-4]
 006A872A    mov         eax,ebx
 006A872C    call        006A849C
 006A8731    mov         edx,6A87B8;'MIDI Yoke'
 006A8736    mov         eax,dword ptr [ebp-4]
 006A8739    call        004F9A58
 006A873E    test        al,al
>006A8740    jne         006A8753
 006A8742    mov         edx,6A87D8;'LB'
 006A8747    mov         eax,dword ptr [ebp-4]
 006A874A    call        004F9A58
 006A874F    test        al,al
>006A8751    je          006A8766
 006A8753    inc         edi
 006A8754    cmp         edi,1
>006A8757    jne         006A875C
 006A8759    mov         dword ptr [ebp-0C],ebx
 006A875C    cmp         edi,dword ptr [ebp-8]
>006A875F    jne         006A8766
 006A8761    mov         dword ptr [ebp-0C],ebx
>006A8764    jmp         006A8784
 006A8766    inc         ebx
 006A8767    dec         esi
>006A8768    jne         006A8727
 006A876A    cmp         dword ptr [ebp-0C],0
>006A876E    jge         006A8784
 006A8770    cmp         dword ptr [ebp-8],0
>006A8774    jge         006A877D
 006A8776    xor         eax,eax
 006A8778    mov         dword ptr [ebp-0C],eax
>006A877B    jmp         006A8784
 006A877D    mov         eax,dword ptr [ebp-8]
 006A8780    dec         eax
 006A8781    mov         dword ptr [ebp-0C],eax
 006A8784    xor         eax,eax
 006A8786    pop         edx
 006A8787    pop         ecx
 006A8788    pop         ecx
 006A8789    mov         dword ptr fs:[eax],edx
 006A878C    push        6A87A1
 006A8791    lea         eax,[ebp-4]
 006A8794    call        @UStrClr
 006A8799    ret
>006A879A    jmp         @HandleFinally
>006A879F    jmp         006A8791
 006A87A1    mov         eax,dword ptr [ebp-0C]
 006A87A4    pop         edi
 006A87A5    pop         esi
 006A87A6    pop         ebx
 006A87A7    mov         esp,ebp
 006A87A9    pop         ebp
 006A87AA    ret
end;*}

//006A87E0
{*function sub_006A87E0(?:?):?;
begin
 006A87E0    push        ebx
 006A87E1    push        esi
 006A87E2    push        edi
 006A87E3    push        ebp
 006A87E4    push        ecx
 006A87E5    mov         dword ptr [esp],eax
 006A87E8    or          ebp,0FFFFFFFF
 006A87EB    xor         edi,edi
 006A87ED    call        winmm.midiOutGetNumDevs
 006A87F2    mov         esi,eax
 006A87F4    dec         esi
 006A87F5    test        esi,esi
>006A87F7    jl          006A881D
 006A87F9    inc         esi
 006A87FA    xor         ebx,ebx
 006A87FC    mov         eax,ebx
 006A87FE    call        006A8438
 006A8803    cmp         eax,7
>006A8806    jne         006A8819
 006A8808    inc         edi
 006A8809    cmp         edi,1
>006A880C    jne         006A8810
 006A880E    mov         ebp,ebx
 006A8810    cmp         edi,dword ptr [esp]
>006A8813    jne         006A8819
 006A8815    mov         ebp,ebx
>006A8817    jmp         006A881D
 006A8819    inc         ebx
 006A881A    dec         esi
>006A881B    jne         006A87FC
 006A881D    mov         eax,ebp
 006A881F    pop         edx
 006A8820    pop         ebp
 006A8821    pop         edi
 006A8822    pop         esi
 006A8823    pop         ebx
 006A8824    ret
end;*}

//006A8828
{*function sub_006A8828(?:?):?;
begin
 006A8828    push        ebx
 006A8829    push        esi
 006A882A    push        edi
 006A882B    push        ebp
 006A882C    push        ecx
 006A882D    mov         dword ptr [esp],eax
 006A8830    or          ebp,0FFFFFFFF
 006A8833    xor         edi,edi
 006A8835    call        winmm.midiOutGetNumDevs
 006A883A    mov         esi,eax
 006A883C    dec         esi
 006A883D    test        esi,esi
>006A883F    jl          006A8865
 006A8841    inc         esi
 006A8842    xor         ebx,ebx
 006A8844    mov         eax,ebx
 006A8846    call        006A8438
 006A884B    cmp         eax,6
>006A884E    jne         006A8861
 006A8850    inc         edi
 006A8851    cmp         edi,1
>006A8854    jne         006A8858
 006A8856    mov         ebp,ebx
 006A8858    cmp         edi,dword ptr [esp]
>006A885B    jne         006A8861
 006A885D    mov         ebp,ebx
>006A885F    jmp         006A8865
 006A8861    inc         ebx
 006A8862    dec         esi
>006A8863    jne         006A8844
 006A8865    mov         eax,ebp
 006A8867    pop         edx
 006A8868    pop         ebp
 006A8869    pop         edi
 006A886A    pop         esi
 006A886B    pop         ebx
 006A886C    ret
end;*}

//006A8870
{*function sub_006A8870(?:?):?;
begin
 006A8870    push        ebx
 006A8871    push        esi
 006A8872    push        edi
 006A8873    push        ebp
 006A8874    push        ecx
 006A8875    mov         dword ptr [esp],eax
 006A8878    or          edi,0FFFFFFFF
 006A887B    xor         esi,esi
 006A887D    call        winmm.midiOutGetNumDevs
 006A8882    mov         ebx,eax
 006A8884    dec         ebx
 006A8885    test        ebx,ebx
>006A8887    jl          006A88BC
 006A8889    inc         ebx
 006A888A    xor         ebp,ebp
 006A888C    mov         eax,ebp
 006A888E    call        006A8438
 006A8893    cmp         eax,6
>006A8896    je          006A88A7
 006A8898    cmp         eax,2
>006A889B    je          006A88A7
 006A889D    cmp         eax,3
>006A88A0    je          006A88A7
 006A88A2    cmp         eax,4
>006A88A5    jne         006A88B8
 006A88A7    inc         esi
 006A88A8    cmp         esi,1
>006A88AB    jne         006A88AF
 006A88AD    mov         edi,esi
 006A88AF    cmp         esi,dword ptr [esp]
>006A88B2    jne         006A88B8
 006A88B4    mov         edi,esi
>006A88B6    jmp         006A88BC
 006A88B8    inc         ebp
 006A88B9    dec         ebx
>006A88BA    jne         006A888C
 006A88BC    mov         eax,edi
 006A88BE    pop         edx
 006A88BF    pop         ebp
 006A88C0    pop         edi
 006A88C1    pop         esi
 006A88C2    pop         ebx
 006A88C3    ret
end;*}

//006A88C4
{*function sub_006A88C4(?:?):?;
begin
 006A88C4    push        ebx
 006A88C5    push        esi
 006A88C6    push        edi
 006A88C7    push        ebp
 006A88C8    push        ecx
 006A88C9    mov         dword ptr [esp],eax
 006A88CC    or          ebp,0FFFFFFFF
 006A88CF    xor         edi,edi
 006A88D1    call        winmm.midiOutGetNumDevs
 006A88D6    mov         esi,eax
 006A88D8    dec         esi
 006A88D9    test        esi,esi
>006A88DB    jl          006A8915
 006A88DD    inc         esi
 006A88DE    xor         ebx,ebx
 006A88E0    mov         eax,ebx
 006A88E2    call        006A8438
 006A88E7    cmp         eax,7
>006A88EA    je          006A8900
 006A88EC    cmp         eax,6
>006A88EF    je          006A8900
 006A88F1    cmp         eax,2
>006A88F4    je          006A8900
 006A88F6    cmp         eax,3
>006A88F9    je          006A8900
 006A88FB    cmp         eax,4
>006A88FE    jne         006A8911
 006A8900    inc         edi
 006A8901    cmp         edi,1
>006A8904    jne         006A8908
 006A8906    mov         ebp,ebx
 006A8908    cmp         edi,dword ptr [esp]
>006A890B    jne         006A8911
 006A890D    mov         ebp,ebx
>006A890F    jmp         006A8915
 006A8911    inc         ebx
 006A8912    dec         esi
>006A8913    jne         006A88E0
 006A8915    mov         eax,ebp
 006A8917    pop         edx
 006A8918    pop         ebp
 006A8919    pop         edi
 006A891A    pop         esi
 006A891B    pop         ebx
 006A891C    ret
end;*}

//006A8920
{*function sub_006A8920(?:UnicodeString):?;
begin
 006A8920    push        ebp
 006A8921    mov         ebp,esp
 006A8923    push        ecx
 006A8924    push        ebx
 006A8925    mov         dword ptr [ebp-4],eax
 006A8928    mov         eax,dword ptr [ebp-4]
 006A892B    call        @UStrAddRef
 006A8930    xor         eax,eax
 006A8932    push        ebp
 006A8933    push        6A8963
 006A8938    push        dword ptr fs:[eax]
 006A893B    mov         dword ptr fs:[eax],esp
 006A893E    mov         edx,dword ptr [ebp-4]
 006A8941    mov         eax,[0081EDCC];gvar_0081EDCC:THashTable
 006A8946    call        THashTable.Get
 006A894B    mov         ebx,eax
 006A894D    xor         eax,eax
 006A894F    pop         edx
 006A8950    pop         ecx
 006A8951    pop         ecx
 006A8952    mov         dword ptr fs:[eax],edx
 006A8955    push        6A896A
 006A895A    lea         eax,[ebp-4]
 006A895D    call        @UStrClr
 006A8962    ret
>006A8963    jmp         @HandleFinally
>006A8968    jmp         006A895A
 006A896A    mov         eax,ebx
 006A896C    pop         ebx
 006A896D    pop         ecx
 006A896E    pop         ebp
 006A896F    ret
end;*}

//006A8970
procedure sub_006A8970(?:Integer; ?:UnicodeString);
begin
{*
 006A8970    push        ebx
 006A8971    push        esi
 006A8972    mov         esi,edx
 006A8974    mov         ebx,eax
 006A8976    mov         ecx,esi
 006A8978    mov         edx,ebx
 006A897A    mov         eax,[0081EDCC];gvar_0081EDCC:THashTable
 006A897F    call        THashTable.Get
 006A8984    pop         esi
 006A8985    pop         ebx
 006A8986    ret
*}
end;

//006A8988
procedure sub_006A8988;
begin
{*
 006A8988    push        ebp
 006A8989    mov         ebp,esp
 006A898B    mov         ecx,0C6
 006A8990    push        0
 006A8992    push        0
 006A8994    dec         ecx
>006A8995    jne         006A8990
 006A8997    push        ebx
 006A8998    push        esi
 006A8999    push        edi
 006A899A    mov         esi,81EDCC;gvar_0081EDCC:THashTable
 006A899F    xor         eax,eax
 006A89A1    push        ebp
 006A89A2    push        6AD8FB
 006A89A7    push        dword ptr fs:[eax]
 006A89AA    mov         dword ptr fs:[eax],esp
 006A89AD    mov         ecx,12C
 006A89B2    mov         edx,6AD918;'NumOutDevs'
 006A89B7    mov         eax,dword ptr [esi]
 006A89B9    call        THashTable.Add
 006A89BE    mov         ecx,12C
 006A89C3    mov         edx,6AD93C;'OutNumDevs'
 006A89C8    mov         eax,dword ptr [esi]
 006A89CA    call        THashTable.Add
 006A89CF    mov         ecx,12C
 006A89D4    mov         edx,6AD960;'NumOutDev'
 006A89D9    mov         eax,dword ptr [esi]
 006A89DB    call        THashTable.Add
 006A89E0    mov         ecx,12C
 006A89E5    mov         edx,6AD980;'OutNumDev'
 006A89EA    mov         eax,dword ptr [esi]
 006A89EC    call        THashTable.Add
 006A89F1    mov         ecx,12C
 006A89F6    mov         edx,6AD9A0;'GetOutNumDevs'
 006A89FB    mov         eax,dword ptr [esi]
 006A89FD    call        THashTable.Add
 006A8A02    mov         ecx,12C
 006A8A07    mov         edx,6AD9C8;'OutGetNumDevs'
 006A8A0C    mov         eax,dword ptr [esi]
 006A8A0E    call        THashTable.Add
 006A8A13    mov         ecx,12C
 006A8A18    mov         edx,6AD9F0;'GetNumOutDevs'
 006A8A1D    mov         eax,dword ptr [esi]
 006A8A1F    call        THashTable.Add
 006A8A24    mov         ecx,12C
 006A8A29    mov         edx,6ADA18;'NumberOfOutputDevices'
 006A8A2E    mov         eax,dword ptr [esi]
 006A8A30    call        THashTable.Add
 006A8A35    mov         ecx,12C
 006A8A3A    mov         edx,6ADA50;'OutputDevices'
 006A8A3F    mov         eax,dword ptr [esi]
 006A8A41    call        THashTable.Add
 006A8A46    mov         ecx,12C
 006A8A4B    mov         edx,6ADA78;'CountOutputDevices'
 006A8A50    mov         eax,dword ptr [esi]
 006A8A52    call        THashTable.Add
 006A8A57    mov         ecx,12C
 006A8A5C    mov         edx,6ADAAC;'OutputDeviceCount'
 006A8A61    mov         eax,dword ptr [esi]
 006A8A63    call        THashTable.Add
 006A8A68    mov         ecx,12C
 006A8A6D    mov         edx,6ADADC;'Count'
 006A8A72    mov         eax,dword ptr [esi]
 006A8A74    call        THashTable.Add
 006A8A79    mov         ecx,12D
 006A8A7E    mov         edx,6ADAF4;'NumInDevs'
 006A8A83    mov         eax,dword ptr [esi]
 006A8A85    call        THashTable.Add
 006A8A8A    mov         ecx,12D
 006A8A8F    mov         edx,6ADB14;'InNumDevs'
 006A8A94    mov         eax,dword ptr [esi]
 006A8A96    call        THashTable.Add
 006A8A9B    mov         ecx,12D
 006A8AA0    mov         edx,6ADB34;'GetInNumDevs'
 006A8AA5    mov         eax,dword ptr [esi]
 006A8AA7    call        THashTable.Add
 006A8AAC    mov         ecx,12D
 006A8AB1    mov         edx,6ADB5C;'InGetNumDevs'
 006A8AB6    mov         eax,dword ptr [esi]
 006A8AB8    call        THashTable.Add
 006A8ABD    mov         ecx,12D
 006A8AC2    mov         edx,6ADB84;'NumberOfInputDevices'
 006A8AC7    mov         eax,dword ptr [esi]
 006A8AC9    call        THashTable.Add
 006A8ACE    mov         ecx,12D
 006A8AD3    mov         edx,6ADBBC;'InputDevices'
 006A8AD8    mov         eax,dword ptr [esi]
 006A8ADA    call        THashTable.Add
 006A8ADF    mov         ecx,12D
 006A8AE4    mov         edx,6ADBE4;'CountInputDevices'
 006A8AE9    mov         eax,dword ptr [esi]
 006A8AEB    call        THashTable.Add
 006A8AF0    mov         ecx,12D
 006A8AF5    mov         edx,6ADC14;'InputDeviceCount'
 006A8AFA    mov         eax,dword ptr [esi]
 006A8AFC    call        THashTable.Add
 006A8B01    mov         ecx,12E
 006A8B06    mov         edx,6ADC44;'OutDevName'
 006A8B0B    mov         eax,dword ptr [esi]
 006A8B0D    call        THashTable.Add
 006A8B12    mov         ecx,12E
 006A8B17    mov         edx,6ADC68;'OutName'
 006A8B1C    mov         eax,dword ptr [esi]
 006A8B1E    call        THashTable.Add
 006A8B23    mov         ecx,12E
 006A8B28    mov         edx,6ADC84;'OutputName'
 006A8B2D    mov         eax,dword ptr [esi]
 006A8B2F    call        THashTable.Add
 006A8B34    mov         ecx,12E
 006A8B39    mov         edx,6ADCA8;'OutputDeviceName'
 006A8B3E    mov         eax,dword ptr [esi]
 006A8B40    call        THashTable.Add
 006A8B45    mov         ecx,12E
 006A8B4A    mov         edx,6ADCD8;'Name'
 006A8B4F    mov         eax,dword ptr [esi]
 006A8B51    call        THashTable.Add
 006A8B56    mov         ecx,2E7
 006A8B5B    mov         edx,6ADCF0;'GeneralMidi'
 006A8B60    mov         eax,dword ptr [esi]
 006A8B62    call        THashTable.Add
 006A8B67    mov         ecx,2E7
 006A8B6C    mov         edx,6ADD14;'GMidi'
 006A8B71    mov         eax,dword ptr [esi]
 006A8B73    call        THashTable.Add
 006A8B78    mov         ecx,2E7
 006A8B7D    mov         edx,6ADD2C;'GMEnable'
 006A8B82    mov         eax,dword ptr [esi]
 006A8B84    call        THashTable.Add
 006A8B89    mov         ecx,2E8
 006A8B8E    mov         edx,6ADD4C;'MasterVolume'
 006A8B93    mov         eax,dword ptr [esi]
 006A8B95    call        THashTable.Add
 006A8B9A    mov         ecx,2E9
 006A8B9F    mov         edx,6ADD74;'IdentityRequest'
 006A8BA4    mov         eax,dword ptr [esi]
 006A8BA6    call        THashTable.Add
 006A8BAB    mov         ecx,2EA
 006A8BB0    mov         edx,6ADDA0;'SetupFile'
 006A8BB5    mov         eax,dword ptr [esi]
 006A8BB7    call        THashTable.Add
 006A8BBC    mov         ecx,2EB
 006A8BC1    mov         edx,6ADDC0;'FirstNote'
 006A8BC6    mov         eax,dword ptr [esi]
 006A8BC8    call        THashTable.Add
 006A8BCD    mov         ecx,2EC
 006A8BD2    mov         edx,6ADDE0;'SecondNote'
 006A8BD7    mov         eax,dword ptr [esi]
 006A8BD9    call        THashTable.Add
 006A8BDE    mov         ecx,2ED
 006A8BE3    mov         edx,6ADE04;'ThirdNote'
 006A8BE8    mov         eax,dword ptr [esi]
 006A8BEA    call        THashTable.Add
 006A8BEF    mov         ecx,2EE
 006A8BF4    mov         edx,6ADE24;'FourthNote'
 006A8BF9    mov         eax,dword ptr [esi]
 006A8BFB    call        THashTable.Add
 006A8C00    mov         ecx,12F
 006A8C05    mov         edx,6ADE48;'InDevName'
 006A8C0A    mov         eax,dword ptr [esi]
 006A8C0C    call        THashTable.Add
 006A8C11    mov         ecx,12F
 006A8C16    mov         edx,6ADE68;'InName'
 006A8C1B    mov         eax,dword ptr [esi]
 006A8C1D    call        THashTable.Add
 006A8C22    mov         ecx,12F
 006A8C27    mov         edx,6ADE84;'InputName'
 006A8C2C    mov         eax,dword ptr [esi]
 006A8C2E    call        THashTable.Add
 006A8C33    mov         ecx,12F
 006A8C38    mov         edx,6ADEA4;'InputDeviceName'
 006A8C3D    mov         eax,dword ptr [esi]
 006A8C3F    call        THashTable.Add
 006A8C44    mov         ecx,130
 006A8C49    mov         edx,6ADED0;'OutVersion'
 006A8C4E    mov         eax,dword ptr [esi]
 006A8C50    call        THashTable.Add
 006A8C55    mov         ecx,130
 006A8C5A    mov         edx,6ADEF4;'OutDriverVersion'
 006A8C5F    mov         eax,dword ptr [esi]
 006A8C61    call        THashTable.Add
 006A8C66    mov         ecx,130
 006A8C6B    mov         edx,6ADF24;'OutVersionNumber'
 006A8C70    mov         eax,dword ptr [esi]
 006A8C72    call        THashTable.Add
 006A8C77    mov         ecx,130
 006A8C7C    mov         edx,6ADF54;'OutputVersion'
 006A8C81    mov         eax,dword ptr [esi]
 006A8C83    call        THashTable.Add
 006A8C88    mov         ecx,130
 006A8C8D    mov         edx,6ADF7C;'OutputDriverVersion'
 006A8C92    mov         eax,dword ptr [esi]
 006A8C94    call        THashTable.Add
 006A8C99    mov         ecx,130
 006A8C9E    mov         edx,6ADFB0;'OutputVersionNumber'
 006A8CA3    mov         eax,dword ptr [esi]
 006A8CA5    call        THashTable.Add
 006A8CAA    mov         ecx,130
 006A8CAF    mov         edx,6ADFE4;'Version'
 006A8CB4    mov         eax,dword ptr [esi]
 006A8CB6    call        THashTable.Add
 006A8CBB    mov         ecx,130
 006A8CC0    mov         edx,6AE000;'DriverVersion'
 006A8CC5    mov         eax,dword ptr [esi]
 006A8CC7    call        THashTable.Add
 006A8CCC    mov         ecx,130
 006A8CD1    mov         edx,6AE028;'VersionNumber'
 006A8CD6    mov         eax,dword ptr [esi]
 006A8CD8    call        THashTable.Add
 006A8CDD    mov         ecx,131
 006A8CE2    mov         edx,6AE050;'InVersion'
 006A8CE7    mov         eax,dword ptr [esi]
 006A8CE9    call        THashTable.Add
 006A8CEE    mov         ecx,131
 006A8CF3    mov         edx,6AE070;'InDriverVersion'
 006A8CF8    mov         eax,dword ptr [esi]
 006A8CFA    call        THashTable.Add
 006A8CFF    mov         ecx,131
 006A8D04    mov         edx,6AE09C;'InVersionNumber'
 006A8D09    mov         eax,dword ptr [esi]
 006A8D0B    call        THashTable.Add
 006A8D10    mov         ecx,131
 006A8D15    mov         edx,6AE0C8;'InputVersion'
 006A8D1A    mov         eax,dword ptr [esi]
 006A8D1C    call        THashTable.Add
 006A8D21    mov         ecx,131
 006A8D26    mov         edx,6AE0F0;'InputDriverVersion'
 006A8D2B    mov         eax,dword ptr [esi]
 006A8D2D    call        THashTable.Add
 006A8D32    mov         ecx,131
 006A8D37    mov         edx,6AE124;'InputVersionNumber'
 006A8D3C    mov         eax,dword ptr [esi]
 006A8D3E    call        THashTable.Add
 006A8D43    mov         ecx,132
 006A8D48    mov         edx,6AE158;'Technology'
 006A8D4D    mov         eax,dword ptr [esi]
 006A8D4F    call        THashTable.Add
 006A8D54    mov         ecx,132
 006A8D59    mov         edx,6AE17C;'wTechnology'
 006A8D5E    mov         eax,dword ptr [esi]
 006A8D60    call        THashTable.Add
 006A8D65    mov         ecx,132
 006A8D6A    mov         edx,6AE1A0;'OutTechnology'
 006A8D6F    mov         eax,dword ptr [esi]
 006A8D71    call        THashTable.Add
 006A8D76    mov         ecx,132
 006A8D7B    mov         edx,6AE1C8;'OutputTechnology'
 006A8D80    mov         eax,dword ptr [esi]
 006A8D82    call        THashTable.Add
 006A8D87    mov         ecx,133
 006A8D8C    mov         edx,6AE1F8;'InTechnology'
 006A8D91    mov         eax,dword ptr [esi]
 006A8D93    call        THashTable.Add
 006A8D98    mov         ecx,133
 006A8D9D    mov         edx,6AE220;'InputTechnology'
 006A8DA2    mov         eax,dword ptr [esi]
 006A8DA4    call        THashTable.Add
 006A8DA9    xor         ebx,ebx
 006A8DAB    lea         edx,[ebp-8]
 006A8DAE    mov         eax,ebx
 006A8DB0    call        IntToStr
 006A8DB5    mov         ecx,dword ptr [ebp-8]
 006A8DB8    lea         eax,[ebp-4]
 006A8DBB    mov         edx,6AE24C;'c'
 006A8DC0    call        @UStrCat3
 006A8DC5    mov         edx,dword ptr [ebp-4]
 006A8DC8    mov         edi,ebx
 006A8DCA    add         edi,edi
 006A8DCC    add         edi,edi
 006A8DCE    lea         edi,[edi+edi*2]
 006A8DD1    add         edi,0A0
 006A8DD7    mov         ecx,edi
 006A8DD9    mov         eax,dword ptr [esi]
 006A8DDB    call        THashTable.Add
 006A8DE0    lea         edx,[ebp-10]
 006A8DE3    mov         eax,ebx
 006A8DE5    call        IntToStr
 006A8DEA    mov         ecx,dword ptr [ebp-10]
 006A8DED    lea         eax,[ebp-0C]
 006A8DF0    mov         edx,6AE25C;'csharp'
 006A8DF5    call        @UStrCat3
 006A8DFA    mov         edx,dword ptr [ebp-0C]
 006A8DFD    mov         ecx,edi
 006A8DFF    inc         ecx
 006A8E00    mov         eax,dword ptr [esi]
 006A8E02    call        THashTable.Add
 006A8E07    lea         edx,[ebp-18]
 006A8E0A    mov         eax,ebx
 006A8E0C    call        IntToStr
 006A8E11    mov         ecx,dword ptr [ebp-18]
 006A8E14    lea         eax,[ebp-14]
 006A8E17    mov         edx,6AE278;'dflat'
 006A8E1C    call        @UStrCat3
 006A8E21    mov         edx,dword ptr [ebp-14]
 006A8E24    mov         ecx,ebx
 006A8E26    add         ecx,ecx
 006A8E28    add         ecx,ecx
 006A8E2A    lea         ecx,[ecx+ecx*2]
 006A8E2D    add         ecx,0A0
 006A8E33    inc         ecx
 006A8E34    mov         eax,dword ptr [esi]
 006A8E36    call        THashTable.Add
 006A8E3B    push        6AE24C;'c'
 006A8E40    lea         edx,[ebp-20]
 006A8E43    mov         eax,ebx
 006A8E45    call        IntToStr
 006A8E4A    push        dword ptr [ebp-20]
 006A8E4D    push        6AE290;'sharp'
 006A8E52    lea         eax,[ebp-1C]
 006A8E55    mov         edx,3
 006A8E5A    call        @UStrCatN
 006A8E5F    mov         edx,dword ptr [ebp-1C]
 006A8E62    mov         ecx,ebx
 006A8E64    add         ecx,ecx
 006A8E66    add         ecx,ecx
 006A8E68    lea         ecx,[ecx+ecx*2]
 006A8E6B    add         ecx,0A0
 006A8E71    inc         ecx
 006A8E72    mov         eax,dword ptr [esi]
 006A8E74    call        THashTable.Add
 006A8E79    push        6AE2A8;'d'
 006A8E7E    lea         edx,[ebp-28]
 006A8E81    mov         eax,ebx
 006A8E83    call        IntToStr
 006A8E88    push        dword ptr [ebp-28]
 006A8E8B    push        6AE2B8;'flat'
 006A8E90    lea         eax,[ebp-24]
 006A8E93    mov         edx,3
 006A8E98    call        @UStrCatN
 006A8E9D    mov         edx,dword ptr [ebp-24]
 006A8EA0    mov         ecx,ebx
 006A8EA2    add         ecx,ecx
 006A8EA4    add         ecx,ecx
 006A8EA6    lea         ecx,[ecx+ecx*2]
 006A8EA9    add         ecx,0A0
 006A8EAF    inc         ecx
 006A8EB0    mov         eax,dword ptr [esi]
 006A8EB2    call        THashTable.Add
 006A8EB7    lea         edx,[ebp-30]
 006A8EBA    mov         eax,ebx
 006A8EBC    call        IntToStr
 006A8EC1    mov         ecx,dword ptr [ebp-30]
 006A8EC4    lea         eax,[ebp-2C]
 006A8EC7    mov         edx,6AE2A8;'d'
 006A8ECC    call        @UStrCat3
 006A8ED1    mov         edx,dword ptr [ebp-2C]
 006A8ED4    mov         ecx,edi
 006A8ED6    add         ecx,2
 006A8ED9    mov         eax,dword ptr [esi]
 006A8EDB    call        THashTable.Add
 006A8EE0    lea         edx,[ebp-38]
 006A8EE3    mov         eax,ebx
 006A8EE5    call        IntToStr
 006A8EEA    mov         ecx,dword ptr [ebp-38]
 006A8EED    lea         eax,[ebp-34]
 006A8EF0    mov         edx,6AE2D0;'dsharp'
 006A8EF5    call        @UStrCat3
 006A8EFA    mov         edx,dword ptr [ebp-34]
 006A8EFD    mov         ecx,edi
 006A8EFF    add         ecx,3
 006A8F02    mov         eax,dword ptr [esi]
 006A8F04    call        THashTable.Add
 006A8F09    lea         edx,[ebp-40]
 006A8F0C    mov         eax,ebx
 006A8F0E    call        IntToStr
 006A8F13    mov         ecx,dword ptr [ebp-40]
 006A8F16    lea         eax,[ebp-3C]
 006A8F19    mov         edx,6AE2EC;'eflat'
 006A8F1E    call        @UStrCat3
 006A8F23    mov         edx,dword ptr [ebp-3C]
 006A8F26    mov         ecx,ebx
 006A8F28    add         ecx,ecx
 006A8F2A    add         ecx,ecx
 006A8F2C    lea         ecx,[ecx+ecx*2]
 006A8F2F    add         ecx,0A0
 006A8F35    add         ecx,3
 006A8F38    mov         eax,dword ptr [esi]
 006A8F3A    call        THashTable.Add
 006A8F3F    push        6AE2A8;'d'
 006A8F44    lea         edx,[ebp-48]
 006A8F47    mov         eax,ebx
 006A8F49    call        IntToStr
 006A8F4E    push        dword ptr [ebp-48]
 006A8F51    push        6AE290;'sharp'
 006A8F56    lea         eax,[ebp-44]
 006A8F59    mov         edx,3
 006A8F5E    call        @UStrCatN
 006A8F63    mov         edx,dword ptr [ebp-44]
 006A8F66    mov         ecx,ebx
 006A8F68    add         ecx,ecx
 006A8F6A    add         ecx,ecx
 006A8F6C    lea         ecx,[ecx+ecx*2]
 006A8F6F    add         ecx,0A0
 006A8F75    add         ecx,3
 006A8F78    mov         eax,dword ptr [esi]
 006A8F7A    call        THashTable.Add
 006A8F7F    push        6AE304;'e'
 006A8F84    lea         edx,[ebp-50]
 006A8F87    mov         eax,ebx
 006A8F89    call        IntToStr
 006A8F8E    push        dword ptr [ebp-50]
 006A8F91    push        6AE2B8;'flat'
 006A8F96    lea         eax,[ebp-4C]
 006A8F99    mov         edx,3
 006A8F9E    call        @UStrCatN
 006A8FA3    mov         edx,dword ptr [ebp-4C]
 006A8FA6    mov         ecx,ebx
 006A8FA8    add         ecx,ecx
 006A8FAA    add         ecx,ecx
 006A8FAC    lea         ecx,[ecx+ecx*2]
 006A8FAF    add         ecx,0A0
 006A8FB5    add         ecx,3
 006A8FB8    mov         eax,dword ptr [esi]
 006A8FBA    call        THashTable.Add
 006A8FBF    lea         edx,[ebp-58]
 006A8FC2    mov         eax,ebx
 006A8FC4    call        IntToStr
 006A8FC9    mov         ecx,dword ptr [ebp-58]
 006A8FCC    lea         eax,[ebp-54]
 006A8FCF    mov         edx,6AE304;'e'
 006A8FD4    call        @UStrCat3
 006A8FD9    mov         edx,dword ptr [ebp-54]
 006A8FDC    mov         ecx,edi
 006A8FDE    add         ecx,4
 006A8FE1    mov         eax,dword ptr [esi]
 006A8FE3    call        THashTable.Add
 006A8FE8    lea         edx,[ebp-60]
 006A8FEB    mov         eax,ebx
 006A8FED    call        IntToStr
 006A8FF2    mov         ecx,dword ptr [ebp-60]
 006A8FF5    lea         eax,[ebp-5C]
 006A8FF8    mov         edx,6AE314;'f'
 006A8FFD    call        @UStrCat3
 006A9002    mov         edx,dword ptr [ebp-5C]
 006A9005    mov         ecx,edi
 006A9007    add         ecx,5
 006A900A    mov         eax,dword ptr [esi]
 006A900C    call        THashTable.Add
 006A9011    lea         edx,[ebp-68]
 006A9014    mov         eax,ebx
 006A9016    call        IntToStr
 006A901B    mov         ecx,dword ptr [ebp-68]
 006A901E    lea         eax,[ebp-64]
 006A9021    mov         edx,6AE324;'fsharp'
 006A9026    call        @UStrCat3
 006A902B    mov         edx,dword ptr [ebp-64]
 006A902E    mov         ecx,ebx
 006A9030    add         ecx,ecx
 006A9032    add         ecx,ecx
 006A9034    lea         ecx,[ecx+ecx*2]
 006A9037    add         ecx,0A0
 006A903D    add         ecx,6
 006A9040    mov         eax,dword ptr [esi]
 006A9042    call        THashTable.Add
 006A9047    lea         edx,[ebp-70]
 006A904A    mov         eax,ebx
 006A904C    call        IntToStr
 006A9051    mov         ecx,dword ptr [ebp-70]
 006A9054    lea         eax,[ebp-6C]
 006A9057    mov         edx,6AE340;'gflat'
 006A905C    call        @UStrCat3
 006A9061    mov         edx,dword ptr [ebp-6C]
 006A9064    mov         ecx,ebx
 006A9066    add         ecx,ecx
 006A9068    add         ecx,ecx
 006A906A    lea         ecx,[ecx+ecx*2]
 006A906D    add         ecx,0A0
 006A9073    add         ecx,6
 006A9076    mov         eax,dword ptr [esi]
 006A9078    call        THashTable.Add
 006A907D    push        6AE314;'f'
 006A9082    lea         edx,[ebp-78]
 006A9085    mov         eax,ebx
 006A9087    call        IntToStr
 006A908C    push        dword ptr [ebp-78]
 006A908F    push        6AE290;'sharp'
 006A9094    lea         eax,[ebp-74]
 006A9097    mov         edx,3
 006A909C    call        @UStrCatN
 006A90A1    mov         edx,dword ptr [ebp-74]
 006A90A4    mov         ecx,ebx
 006A90A6    add         ecx,ecx
 006A90A8    add         ecx,ecx
 006A90AA    lea         ecx,[ecx+ecx*2]
 006A90AD    add         ecx,0A0
 006A90B3    add         ecx,6
 006A90B6    mov         eax,dword ptr [esi]
 006A90B8    call        THashTable.Add
 006A90BD    push        6AE358;'g'
 006A90C2    lea         edx,[ebp-80]
 006A90C5    mov         eax,ebx
 006A90C7    call        IntToStr
 006A90CC    push        dword ptr [ebp-80]
 006A90CF    push        6AE2B8;'flat'
 006A90D4    lea         eax,[ebp-7C]
 006A90D7    mov         edx,3
 006A90DC    call        @UStrCatN
 006A90E1    mov         edx,dword ptr [ebp-7C]
 006A90E4    mov         ecx,ebx
 006A90E6    add         ecx,ecx
 006A90E8    add         ecx,ecx
 006A90EA    lea         ecx,[ecx+ecx*2]
 006A90ED    add         ecx,0A0
 006A90F3    add         ecx,6
 006A90F6    mov         eax,dword ptr [esi]
 006A90F8    call        THashTable.Add
 006A90FD    lea         edx,[ebp-88]
 006A9103    mov         eax,ebx
 006A9105    call        IntToStr
 006A910A    mov         ecx,dword ptr [ebp-88]
 006A9110    lea         eax,[ebp-84]
 006A9116    mov         edx,6AE358;'g'
 006A911B    call        @UStrCat3
 006A9120    mov         edx,dword ptr [ebp-84]
 006A9126    mov         ecx,ebx
 006A9128    add         ecx,ecx
 006A912A    add         ecx,ecx
 006A912C    lea         ecx,[ecx+ecx*2]
 006A912F    add         ecx,0A0
 006A9135    add         ecx,7
 006A9138    mov         eax,dword ptr [esi]
 006A913A    call        THashTable.Add
 006A913F    lea         edx,[ebp-90]
 006A9145    mov         eax,ebx
 006A9147    call        IntToStr
 006A914C    mov         ecx,dword ptr [ebp-90]
 006A9152    lea         eax,[ebp-8C]
 006A9158    mov         edx,6AE368;'gsharp'
 006A915D    call        @UStrCat3
 006A9162    mov         edx,dword ptr [ebp-8C]
 006A9168    mov         ecx,ebx
 006A916A    add         ecx,ecx
 006A916C    add         ecx,ecx
 006A916E    lea         ecx,[ecx+ecx*2]
 006A9171    add         ecx,0A0
 006A9177    add         ecx,8
 006A917A    mov         eax,dword ptr [esi]
 006A917C    call        THashTable.Add
 006A9181    lea         edx,[ebp-98]
 006A9187    mov         eax,ebx
 006A9189    call        IntToStr
 006A918E    mov         ecx,dword ptr [ebp-98]
 006A9194    lea         eax,[ebp-94]
 006A919A    mov         edx,6AE384;'aflat'
 006A919F    call        @UStrCat3
 006A91A4    mov         edx,dword ptr [ebp-94]
 006A91AA    mov         ecx,ebx
 006A91AC    add         ecx,ecx
 006A91AE    add         ecx,ecx
 006A91B0    lea         ecx,[ecx+ecx*2]
 006A91B3    add         ecx,0A0
 006A91B9    add         ecx,8
 006A91BC    mov         eax,dword ptr [esi]
 006A91BE    call        THashTable.Add
 006A91C3    push        6AE358;'g'
 006A91C8    lea         edx,[ebp-0A0]
 006A91CE    mov         eax,ebx
 006A91D0    call        IntToStr
 006A91D5    push        dword ptr [ebp-0A0]
 006A91DB    push        6AE290;'sharp'
 006A91E0    lea         eax,[ebp-9C]
 006A91E6    mov         edx,3
 006A91EB    call        @UStrCatN
 006A91F0    mov         edx,dword ptr [ebp-9C]
 006A91F6    mov         ecx,ebx
 006A91F8    add         ecx,ecx
 006A91FA    add         ecx,ecx
 006A91FC    lea         ecx,[ecx+ecx*2]
 006A91FF    add         ecx,0A0
 006A9205    add         ecx,8
 006A9208    mov         eax,dword ptr [esi]
 006A920A    call        THashTable.Add
 006A920F    push        6AE39C;'a'
 006A9214    lea         edx,[ebp-0A8]
 006A921A    mov         eax,ebx
 006A921C    call        IntToStr
 006A9221    push        dword ptr [ebp-0A8]
 006A9227    push        6AE2B8;'flat'
 006A922C    lea         eax,[ebp-0A4]
 006A9232    mov         edx,3
 006A9237    call        @UStrCatN
 006A923C    mov         edx,dword ptr [ebp-0A4]
 006A9242    mov         ecx,ebx
 006A9244    add         ecx,ecx
 006A9246    add         ecx,ecx
 006A9248    lea         ecx,[ecx+ecx*2]
 006A924B    add         ecx,0A0
 006A9251    add         ecx,8
 006A9254    mov         eax,dword ptr [esi]
 006A9256    call        THashTable.Add
 006A925B    lea         edx,[ebp-0B0]
 006A9261    mov         eax,ebx
 006A9263    call        IntToStr
 006A9268    mov         ecx,dword ptr [ebp-0B0]
 006A926E    lea         eax,[ebp-0AC]
 006A9274    mov         edx,6AE39C;'a'
 006A9279    call        @UStrCat3
 006A927E    mov         edx,dword ptr [ebp-0AC]
 006A9284    mov         ecx,ebx
 006A9286    add         ecx,ecx
 006A9288    add         ecx,ecx
 006A928A    lea         ecx,[ecx+ecx*2]
 006A928D    add         ecx,0A0
 006A9293    add         ecx,9
 006A9296    mov         eax,dword ptr [esi]
 006A9298    call        THashTable.Add
 006A929D    lea         edx,[ebp-0B8]
 006A92A3    mov         eax,ebx
 006A92A5    call        IntToStr
 006A92AA    mov         ecx,dword ptr [ebp-0B8]
 006A92B0    lea         eax,[ebp-0B4]
 006A92B6    mov         edx,6AE3AC;'asharp'
 006A92BB    call        @UStrCat3
 006A92C0    mov         edx,dword ptr [ebp-0B4]
 006A92C6    mov         ecx,ebx
 006A92C8    add         ecx,ecx
 006A92CA    add         ecx,ecx
 006A92CC    lea         ecx,[ecx+ecx*2]
 006A92CF    add         ecx,0A0
 006A92D5    add         ecx,0A
 006A92D8    mov         eax,dword ptr [esi]
 006A92DA    call        THashTable.Add
 006A92DF    lea         edx,[ebp-0C0]
 006A92E5    mov         eax,ebx
 006A92E7    call        IntToStr
 006A92EC    mov         ecx,dword ptr [ebp-0C0]
 006A92F2    lea         eax,[ebp-0BC]
 006A92F8    mov         edx,6AE3C8;'bflat'
 006A92FD    call        @UStrCat3
 006A9302    mov         edx,dword ptr [ebp-0BC]
 006A9308    mov         ecx,ebx
 006A930A    add         ecx,ecx
 006A930C    add         ecx,ecx
 006A930E    lea         ecx,[ecx+ecx*2]
 006A9311    add         ecx,0A0
 006A9317    add         ecx,0A
 006A931A    mov         eax,dword ptr [esi]
 006A931C    call        THashTable.Add
 006A9321    push        6AE39C;'a'
 006A9326    lea         edx,[ebp-0C8]
 006A932C    mov         eax,ebx
 006A932E    call        IntToStr
 006A9333    push        dword ptr [ebp-0C8]
 006A9339    push        6AE290;'sharp'
 006A933E    lea         eax,[ebp-0C4]
 006A9344    mov         edx,3
 006A9349    call        @UStrCatN
 006A934E    mov         edx,dword ptr [ebp-0C4]
 006A9354    mov         ecx,ebx
 006A9356    add         ecx,ecx
 006A9358    add         ecx,ecx
 006A935A    lea         ecx,[ecx+ecx*2]
 006A935D    add         ecx,0A0
 006A9363    add         ecx,0A
 006A9366    mov         eax,dword ptr [esi]
 006A9368    call        THashTable.Add
 006A936D    push        6AE3E0;'b'
 006A9372    lea         edx,[ebp-0D0]
 006A9378    mov         eax,ebx
 006A937A    call        IntToStr
 006A937F    push        dword ptr [ebp-0D0]
 006A9385    push        6AE2B8;'flat'
 006A938A    lea         eax,[ebp-0CC]
 006A9390    mov         edx,3
 006A9395    call        @UStrCatN
 006A939A    mov         edx,dword ptr [ebp-0CC]
 006A93A0    mov         ecx,ebx
 006A93A2    add         ecx,ecx
 006A93A4    add         ecx,ecx
 006A93A6    lea         ecx,[ecx+ecx*2]
 006A93A9    add         ecx,0A0
 006A93AF    add         ecx,0A
 006A93B2    mov         eax,dword ptr [esi]
 006A93B4    call        THashTable.Add
 006A93B9    lea         edx,[ebp-0D8]
 006A93BF    mov         eax,ebx
 006A93C1    call        IntToStr
 006A93C6    mov         ecx,dword ptr [ebp-0D8]
 006A93CC    lea         eax,[ebp-0D4]
 006A93D2    mov         edx,6AE3E0;'b'
 006A93D7    call        @UStrCat3
 006A93DC    mov         edx,dword ptr [ebp-0D4]
 006A93E2    mov         ecx,ebx
 006A93E4    add         ecx,ecx
 006A93E6    add         ecx,ecx
 006A93E8    lea         ecx,[ecx+ecx*2]
 006A93EB    add         ecx,0A0
 006A93F1    add         ecx,0B
 006A93F4    mov         eax,dword ptr [esi]
 006A93F6    call        THashTable.Add
 006A93FB    inc         ebx
 006A93FC    cmp         ebx,0A
>006A93FF    jne         006A8DAB
 006A9405    mov         ebx,0A
 006A940A    lea         edx,[ebp-0E0]
 006A9410    mov         eax,ebx
 006A9412    call        IntToStr
 006A9417    mov         ecx,dword ptr [ebp-0E0]
 006A941D    lea         eax,[ebp-0DC]
 006A9423    mov         edx,6AE24C;'c'
 006A9428    call        @UStrCat3
 006A942D    mov         edx,dword ptr [ebp-0DC]
 006A9433    mov         edi,ebx
 006A9435    add         edi,edi
 006A9437    add         edi,edi
 006A9439    lea         edi,[edi+edi*2]
 006A943C    add         edi,0A0
 006A9442    mov         ecx,edi
 006A9444    mov         eax,dword ptr [esi]
 006A9446    call        THashTable.Add
 006A944B    lea         edx,[ebp-0E8]
 006A9451    mov         eax,ebx
 006A9453    call        IntToStr
 006A9458    mov         ecx,dword ptr [ebp-0E8]
 006A945E    lea         eax,[ebp-0E4]
 006A9464    mov         edx,6AE25C;'csharp'
 006A9469    call        @UStrCat3
 006A946E    mov         edx,dword ptr [ebp-0E4]
 006A9474    mov         ecx,edi
 006A9476    inc         ecx
 006A9477    mov         eax,dword ptr [esi]
 006A9479    call        THashTable.Add
 006A947E    lea         edx,[ebp-0F0]
 006A9484    mov         eax,ebx
 006A9486    call        IntToStr
 006A948B    mov         ecx,dword ptr [ebp-0F0]
 006A9491    lea         eax,[ebp-0EC]
 006A9497    mov         edx,6AE278;'dflat'
 006A949C    call        @UStrCat3
 006A94A1    mov         edx,dword ptr [ebp-0EC]
 006A94A7    mov         ecx,ebx
 006A94A9    add         ecx,ecx
 006A94AB    add         ecx,ecx
 006A94AD    lea         ecx,[ecx+ecx*2]
 006A94B0    add         ecx,0A0
 006A94B6    inc         ecx
 006A94B7    mov         eax,dword ptr [esi]
 006A94B9    call        THashTable.Add
 006A94BE    push        6AE24C;'c'
 006A94C3    lea         edx,[ebp-0F8]
 006A94C9    mov         eax,ebx
 006A94CB    call        IntToStr
 006A94D0    push        dword ptr [ebp-0F8]
 006A94D6    push        6AE290;'sharp'
 006A94DB    lea         eax,[ebp-0F4]
 006A94E1    mov         edx,3
 006A94E6    call        @UStrCatN
 006A94EB    mov         edx,dword ptr [ebp-0F4]
 006A94F1    mov         ecx,ebx
 006A94F3    add         ecx,ecx
 006A94F5    add         ecx,ecx
 006A94F7    lea         ecx,[ecx+ecx*2]
 006A94FA    add         ecx,0A0
 006A9500    inc         ecx
 006A9501    mov         eax,dword ptr [esi]
 006A9503    call        THashTable.Add
 006A9508    push        6AE2A8;'d'
 006A950D    lea         edx,[ebp-100]
 006A9513    mov         eax,ebx
 006A9515    call        IntToStr
 006A951A    push        dword ptr [ebp-100]
 006A9520    push        6AE2B8;'flat'
 006A9525    lea         eax,[ebp-0FC]
 006A952B    mov         edx,3
 006A9530    call        @UStrCatN
 006A9535    mov         edx,dword ptr [ebp-0FC]
 006A953B    mov         ecx,ebx
 006A953D    add         ecx,ecx
 006A953F    add         ecx,ecx
 006A9541    lea         ecx,[ecx+ecx*2]
 006A9544    add         ecx,0A0
 006A954A    inc         ecx
 006A954B    mov         eax,dword ptr [esi]
 006A954D    call        THashTable.Add
 006A9552    lea         edx,[ebp-108]
 006A9558    mov         eax,ebx
 006A955A    call        IntToStr
 006A955F    mov         ecx,dword ptr [ebp-108]
 006A9565    lea         eax,[ebp-104]
 006A956B    mov         edx,6AE2A8;'d'
 006A9570    call        @UStrCat3
 006A9575    mov         edx,dword ptr [ebp-104]
 006A957B    mov         ecx,edi
 006A957D    add         ecx,2
 006A9580    mov         eax,dword ptr [esi]
 006A9582    call        THashTable.Add
 006A9587    lea         edx,[ebp-110]
 006A958D    mov         eax,ebx
 006A958F    call        IntToStr
 006A9594    mov         ecx,dword ptr [ebp-110]
 006A959A    lea         eax,[ebp-10C]
 006A95A0    mov         edx,6AE2D0;'dsharp'
 006A95A5    call        @UStrCat3
 006A95AA    mov         edx,dword ptr [ebp-10C]
 006A95B0    mov         ecx,edi
 006A95B2    add         ecx,3
 006A95B5    mov         eax,dword ptr [esi]
 006A95B7    call        THashTable.Add
 006A95BC    lea         edx,[ebp-118]
 006A95C2    mov         eax,ebx
 006A95C4    call        IntToStr
 006A95C9    mov         ecx,dword ptr [ebp-118]
 006A95CF    lea         eax,[ebp-114]
 006A95D5    mov         edx,6AE2EC;'eflat'
 006A95DA    call        @UStrCat3
 006A95DF    mov         edx,dword ptr [ebp-114]
 006A95E5    mov         ecx,ebx
 006A95E7    add         ecx,ecx
 006A95E9    add         ecx,ecx
 006A95EB    lea         ecx,[ecx+ecx*2]
 006A95EE    add         ecx,0A0
 006A95F4    add         ecx,3
 006A95F7    mov         eax,dword ptr [esi]
 006A95F9    call        THashTable.Add
 006A95FE    push        6AE2A8;'d'
 006A9603    lea         edx,[ebp-120]
 006A9609    mov         eax,ebx
 006A960B    call        IntToStr
 006A9610    push        dword ptr [ebp-120]
 006A9616    push        6AE290;'sharp'
 006A961B    lea         eax,[ebp-11C]
 006A9621    mov         edx,3
 006A9626    call        @UStrCatN
 006A962B    mov         edx,dword ptr [ebp-11C]
 006A9631    mov         ecx,ebx
 006A9633    add         ecx,ecx
 006A9635    add         ecx,ecx
 006A9637    lea         ecx,[ecx+ecx*2]
 006A963A    add         ecx,0A0
 006A9640    add         ecx,3
 006A9643    mov         eax,dword ptr [esi]
 006A9645    call        THashTable.Add
 006A964A    push        6AE304;'e'
 006A964F    lea         edx,[ebp-128]
 006A9655    mov         eax,ebx
 006A9657    call        IntToStr
 006A965C    push        dword ptr [ebp-128]
 006A9662    push        6AE2B8;'flat'
 006A9667    lea         eax,[ebp-124]
 006A966D    mov         edx,3
 006A9672    call        @UStrCatN
 006A9677    mov         edx,dword ptr [ebp-124]
 006A967D    mov         ecx,ebx
 006A967F    add         ecx,ecx
 006A9681    add         ecx,ecx
 006A9683    lea         ecx,[ecx+ecx*2]
 006A9686    add         ecx,0A0
 006A968C    add         ecx,3
 006A968F    mov         eax,dword ptr [esi]
 006A9691    call        THashTable.Add
 006A9696    lea         edx,[ebp-130]
 006A969C    mov         eax,ebx
 006A969E    call        IntToStr
 006A96A3    mov         ecx,dword ptr [ebp-130]
 006A96A9    lea         eax,[ebp-12C]
 006A96AF    mov         edx,6AE304;'e'
 006A96B4    call        @UStrCat3
 006A96B9    mov         edx,dword ptr [ebp-12C]
 006A96BF    mov         ecx,edi
 006A96C1    add         ecx,4
 006A96C4    mov         eax,dword ptr [esi]
 006A96C6    call        THashTable.Add
 006A96CB    lea         edx,[ebp-138]
 006A96D1    mov         eax,ebx
 006A96D3    call        IntToStr
 006A96D8    mov         ecx,dword ptr [ebp-138]
 006A96DE    lea         eax,[ebp-134]
 006A96E4    mov         edx,6AE314;'f'
 006A96E9    call        @UStrCat3
 006A96EE    mov         edx,dword ptr [ebp-134]
 006A96F4    mov         ecx,edi
 006A96F6    add         ecx,5
 006A96F9    mov         eax,dword ptr [esi]
 006A96FB    call        THashTable.Add
 006A9700    lea         edx,[ebp-140]
 006A9706    mov         eax,ebx
 006A9708    call        IntToStr
 006A970D    mov         ecx,dword ptr [ebp-140]
 006A9713    lea         eax,[ebp-13C]
 006A9719    mov         edx,6AE324;'fsharp'
 006A971E    call        @UStrCat3
 006A9723    mov         edx,dword ptr [ebp-13C]
 006A9729    mov         ecx,ebx
 006A972B    add         ecx,ecx
 006A972D    add         ecx,ecx
 006A972F    lea         ecx,[ecx+ecx*2]
 006A9732    add         ecx,0A0
 006A9738    add         ecx,6
 006A973B    mov         eax,dword ptr [esi]
 006A973D    call        THashTable.Add
 006A9742    lea         edx,[ebp-148]
 006A9748    mov         eax,ebx
 006A974A    call        IntToStr
 006A974F    mov         ecx,dword ptr [ebp-148]
 006A9755    lea         eax,[ebp-144]
 006A975B    mov         edx,6AE340;'gflat'
 006A9760    call        @UStrCat3
 006A9765    mov         edx,dword ptr [ebp-144]
 006A976B    mov         ecx,ebx
 006A976D    add         ecx,ecx
 006A976F    add         ecx,ecx
 006A9771    lea         ecx,[ecx+ecx*2]
 006A9774    add         ecx,0A0
 006A977A    add         ecx,6
 006A977D    mov         eax,dword ptr [esi]
 006A977F    call        THashTable.Add
 006A9784    push        6AE314;'f'
 006A9789    lea         edx,[ebp-150]
 006A978F    mov         eax,ebx
 006A9791    call        IntToStr
 006A9796    push        dword ptr [ebp-150]
 006A979C    push        6AE290;'sharp'
 006A97A1    lea         eax,[ebp-14C]
 006A97A7    mov         edx,3
 006A97AC    call        @UStrCatN
 006A97B1    mov         edx,dword ptr [ebp-14C]
 006A97B7    mov         ecx,ebx
 006A97B9    add         ecx,ecx
 006A97BB    add         ecx,ecx
 006A97BD    lea         ecx,[ecx+ecx*2]
 006A97C0    add         ecx,0A0
 006A97C6    add         ecx,6
 006A97C9    mov         eax,dword ptr [esi]
 006A97CB    call        THashTable.Add
 006A97D0    push        6AE358;'g'
 006A97D5    lea         edx,[ebp-158]
 006A97DB    mov         eax,ebx
 006A97DD    call        IntToStr
 006A97E2    push        dword ptr [ebp-158]
 006A97E8    push        6AE2B8;'flat'
 006A97ED    lea         eax,[ebp-154]
 006A97F3    mov         edx,3
 006A97F8    call        @UStrCatN
 006A97FD    mov         edx,dword ptr [ebp-154]
 006A9803    mov         ecx,ebx
 006A9805    add         ecx,ecx
 006A9807    add         ecx,ecx
 006A9809    lea         ecx,[ecx+ecx*2]
 006A980C    add         ecx,0A0
 006A9812    add         ecx,6
 006A9815    mov         eax,dword ptr [esi]
 006A9817    call        THashTable.Add
 006A981C    lea         edx,[ebp-160]
 006A9822    mov         eax,ebx
 006A9824    call        IntToStr
 006A9829    mov         ecx,dword ptr [ebp-160]
 006A982F    lea         eax,[ebp-15C]
 006A9835    mov         edx,6AE358;'g'
 006A983A    call        @UStrCat3
 006A983F    mov         edx,dword ptr [ebp-15C]
 006A9845    mov         ecx,ebx
 006A9847    add         ecx,ecx
 006A9849    add         ecx,ecx
 006A984B    lea         ecx,[ecx+ecx*2]
 006A984E    add         ecx,0A0
 006A9854    add         ecx,7
 006A9857    mov         eax,dword ptr [esi]
 006A9859    call        THashTable.Add
 006A985E    mov         ecx,0DC
 006A9863    mov         edx,6AE3F0;'MiddleC'
 006A9868    mov         eax,dword ptr [esi]
 006A986A    call        THashTable.Add
 006A986F    mov         ecx,0DD
 006A9874    mov         edx,6AE40C;'MiddleCSharp'
 006A9879    mov         eax,dword ptr [esi]
 006A987B    call        THashTable.Add
 006A9880    mov         ecx,0DD
 006A9885    mov         edx,6AE434;'MiddleDFlat'
 006A988A    mov         eax,dword ptr [esi]
 006A988C    call        THashTable.Add
 006A9891    mov         ecx,0DD
 006A9896    mov         edx,6AE40C;'MiddleCSharp'
 006A989B    mov         eax,dword ptr [esi]
 006A989D    call        THashTable.Add
 006A98A2    mov         ecx,0DD
 006A98A7    mov         edx,6AE434;'MiddleDFlat'
 006A98AC    mov         eax,dword ptr [esi]
 006A98AE    call        THashTable.Add
 006A98B3    mov         ecx,0DE
 006A98B8    mov         edx,6AE458;'MiddleD'
 006A98BD    mov         eax,dword ptr [esi]
 006A98BF    call        THashTable.Add
 006A98C4    mov         ecx,0DF
 006A98C9    mov         edx,6AE474;'MiddleDSharp'
 006A98CE    mov         eax,dword ptr [esi]
 006A98D0    call        THashTable.Add
 006A98D5    mov         ecx,0DF
 006A98DA    mov         edx,6AE49C;'MiddleEFlat'
 006A98DF    mov         eax,dword ptr [esi]
 006A98E1    call        THashTable.Add
 006A98E6    mov         ecx,0DF
 006A98EB    mov         edx,6AE474;'MiddleDSharp'
 006A98F0    mov         eax,dword ptr [esi]
 006A98F2    call        THashTable.Add
 006A98F7    mov         ecx,0DF
 006A98FC    mov         edx,6AE49C;'MiddleEFlat'
 006A9901    mov         eax,dword ptr [esi]
 006A9903    call        THashTable.Add
 006A9908    mov         ecx,0E0
 006A990D    mov         edx,6AE4C0;'MiddleE'
 006A9912    mov         eax,dword ptr [esi]
 006A9914    call        THashTable.Add
 006A9919    mov         ecx,0E1
 006A991E    mov         edx,6AE4DC;'MiddleF'
 006A9923    mov         eax,dword ptr [esi]
 006A9925    call        THashTable.Add
 006A992A    mov         ecx,0E2
 006A992F    mov         edx,6AE4F8;'MiddleFsharp'
 006A9934    mov         eax,dword ptr [esi]
 006A9936    call        THashTable.Add
 006A993B    mov         ecx,0E2
 006A9940    mov         edx,6AE520;'MiddleGflat'
 006A9945    mov         eax,dword ptr [esi]
 006A9947    call        THashTable.Add
 006A994C    mov         ecx,0E2
 006A9951    mov         edx,6AE544;'MiddleFSharp'
 006A9956    mov         eax,dword ptr [esi]
 006A9958    call        THashTable.Add
 006A995D    mov         ecx,0E2
 006A9962    mov         edx,6AE56C;'MiddleGFlat'
 006A9967    mov         eax,dword ptr [esi]
 006A9969    call        THashTable.Add
 006A996E    mov         ecx,0E3
 006A9973    mov         edx,6AE590;'MiddleG'
 006A9978    mov         eax,dword ptr [esi]
 006A997A    call        THashTable.Add
 006A997F    mov         ecx,0E4
 006A9984    mov         edx,6AE5AC;'MiddleGsharp'
 006A9989    mov         eax,dword ptr [esi]
 006A998B    call        THashTable.Add
 006A9990    mov         ecx,0E4
 006A9995    mov         edx,6AE5D4;'MiddleAflat'
 006A999A    mov         eax,dword ptr [esi]
 006A999C    call        THashTable.Add
 006A99A1    mov         ecx,0E4
 006A99A6    mov         edx,6AE5F8;'MiddleGSharp'
 006A99AB    mov         eax,dword ptr [esi]
 006A99AD    call        THashTable.Add
 006A99B2    mov         ecx,0E4
 006A99B7    mov         edx,6AE620;'MiddleAFlat'
 006A99BC    mov         eax,dword ptr [esi]
 006A99BE    call        THashTable.Add
 006A99C3    mov         ecx,0E5
 006A99C8    mov         edx,6AE644;'MiddleA'
 006A99CD    mov         eax,dword ptr [esi]
 006A99CF    call        THashTable.Add
 006A99D4    mov         ecx,0E6
 006A99D9    mov         edx,6AE660;'MiddleASharp'
 006A99DE    mov         eax,dword ptr [esi]
 006A99E0    call        THashTable.Add
 006A99E5    mov         ecx,0E6
 006A99EA    mov         edx,6AE688;'MiddleBFlat'
 006A99EF    mov         eax,dword ptr [esi]
 006A99F1    call        THashTable.Add
 006A99F6    mov         ecx,0E6
 006A99FB    mov         edx,6AE660;'MiddleASharp'
 006A9A00    mov         eax,dword ptr [esi]
 006A9A02    call        THashTable.Add
 006A9A07    mov         ecx,0E6
 006A9A0C    mov         edx,6AE688;'MiddleBFlat'
 006A9A11    mov         eax,dword ptr [esi]
 006A9A13    call        THashTable.Add
 006A9A18    mov         ecx,0E7
 006A9A1D    mov         edx,6AE6AC;'MiddleB'
 006A9A22    mov         eax,dword ptr [esi]
 006A9A24    call        THashTable.Add
 006A9A29    xor         ebx,ebx
 006A9A2B    push        6AE24C;'c'
 006A9A30    lea         edx,[ebp-168]
 006A9A36    mov         eax,ebx
 006A9A38    call        IntToStr
 006A9A3D    push        dword ptr [ebp-168]
 006A9A43    push        6AE6C8;'Velocity'
 006A9A48    lea         eax,[ebp-164]
 006A9A4E    mov         edx,3
 006A9A53    call        @UStrCatN
 006A9A58    mov         edx,dword ptr [ebp-164]
 006A9A5E    mov         edi,ebx
 006A9A60    add         edi,edi
 006A9A62    add         edi,edi
 006A9A64    lea         edi,[edi+edi*2]
 006A9A67    add         edi,190
 006A9A6D    mov         ecx,edi
 006A9A6F    mov         eax,dword ptr [esi]
 006A9A71    call        THashTable.Add
 006A9A76    push        6AE25C;'csharp'
 006A9A7B    lea         edx,[ebp-170]
 006A9A81    mov         eax,ebx
 006A9A83    call        IntToStr
 006A9A88    push        dword ptr [ebp-170]
 006A9A8E    push        6AE6C8;'Velocity'
 006A9A93    lea         eax,[ebp-16C]
 006A9A99    mov         edx,3
 006A9A9E    call        @UStrCatN
 006A9AA3    mov         edx,dword ptr [ebp-16C]
 006A9AA9    mov         ecx,edi
 006A9AAB    inc         ecx
 006A9AAC    mov         eax,dword ptr [esi]
 006A9AAE    call        THashTable.Add
 006A9AB3    push        6AE278;'dflat'
 006A9AB8    lea         edx,[ebp-178]
 006A9ABE    mov         eax,ebx
 006A9AC0    call        IntToStr
 006A9AC5    push        dword ptr [ebp-178]
 006A9ACB    push        6AE6C8;'Velocity'
 006A9AD0    lea         eax,[ebp-174]
 006A9AD6    mov         edx,3
 006A9ADB    call        @UStrCatN
 006A9AE0    mov         edx,dword ptr [ebp-174]
 006A9AE6    mov         ecx,ebx
 006A9AE8    add         ecx,ecx
 006A9AEA    add         ecx,ecx
 006A9AEC    lea         ecx,[ecx+ecx*2]
 006A9AEF    add         ecx,190
 006A9AF5    inc         ecx
 006A9AF6    mov         eax,dword ptr [esi]
 006A9AF8    call        THashTable.Add
 006A9AFD    push        6AE24C;'c'
 006A9B02    lea         edx,[ebp-180]
 006A9B08    mov         eax,ebx
 006A9B0A    call        IntToStr
 006A9B0F    push        dword ptr [ebp-180]
 006A9B15    push        6AE290;'sharp'
 006A9B1A    push        6AE6C8;'Velocity'
 006A9B1F    lea         eax,[ebp-17C]
 006A9B25    mov         edx,4
 006A9B2A    call        @UStrCatN
 006A9B2F    mov         edx,dword ptr [ebp-17C]
 006A9B35    mov         ecx,ebx
 006A9B37    add         ecx,ecx
 006A9B39    add         ecx,ecx
 006A9B3B    lea         ecx,[ecx+ecx*2]
 006A9B3E    add         ecx,190
 006A9B44    inc         ecx
 006A9B45    mov         eax,dword ptr [esi]
 006A9B47    call        THashTable.Add
 006A9B4C    push        6AE2A8;'d'
 006A9B51    lea         edx,[ebp-188]
 006A9B57    mov         eax,ebx
 006A9B59    call        IntToStr
 006A9B5E    push        dword ptr [ebp-188]
 006A9B64    push        6AE2B8;'flat'
 006A9B69    push        6AE6C8;'Velocity'
 006A9B6E    lea         eax,[ebp-184]
 006A9B74    mov         edx,4
 006A9B79    call        @UStrCatN
 006A9B7E    mov         edx,dword ptr [ebp-184]
 006A9B84    mov         ecx,ebx
 006A9B86    add         ecx,ecx
 006A9B88    add         ecx,ecx
 006A9B8A    lea         ecx,[ecx+ecx*2]
 006A9B8D    add         ecx,190
 006A9B93    inc         ecx
 006A9B94    mov         eax,dword ptr [esi]
 006A9B96    call        THashTable.Add
 006A9B9B    push        6AE2A8;'d'
 006A9BA0    lea         edx,[ebp-190]
 006A9BA6    mov         eax,ebx
 006A9BA8    call        IntToStr
 006A9BAD    push        dword ptr [ebp-190]
 006A9BB3    push        6AE6C8;'Velocity'
 006A9BB8    lea         eax,[ebp-18C]
 006A9BBE    mov         edx,3
 006A9BC3    call        @UStrCatN
 006A9BC8    mov         edx,dword ptr [ebp-18C]
 006A9BCE    mov         ecx,edi
 006A9BD0    add         ecx,2
 006A9BD3    mov         eax,dword ptr [esi]
 006A9BD5    call        THashTable.Add
 006A9BDA    push        6AE2D0;'dsharp'
 006A9BDF    lea         edx,[ebp-198]
 006A9BE5    mov         eax,ebx
 006A9BE7    call        IntToStr
 006A9BEC    push        dword ptr [ebp-198]
 006A9BF2    push        6AE6C8;'Velocity'
 006A9BF7    lea         eax,[ebp-194]
 006A9BFD    mov         edx,3
 006A9C02    call        @UStrCatN
 006A9C07    mov         edx,dword ptr [ebp-194]
 006A9C0D    mov         ecx,edi
 006A9C0F    add         ecx,3
 006A9C12    mov         eax,dword ptr [esi]
 006A9C14    call        THashTable.Add
 006A9C19    push        6AE2EC;'eflat'
 006A9C1E    lea         edx,[ebp-1A0]
 006A9C24    mov         eax,ebx
 006A9C26    call        IntToStr
 006A9C2B    push        dword ptr [ebp-1A0]
 006A9C31    push        6AE6C8;'Velocity'
 006A9C36    lea         eax,[ebp-19C]
 006A9C3C    mov         edx,3
 006A9C41    call        @UStrCatN
 006A9C46    mov         edx,dword ptr [ebp-19C]
 006A9C4C    mov         ecx,ebx
 006A9C4E    add         ecx,ecx
 006A9C50    add         ecx,ecx
 006A9C52    lea         ecx,[ecx+ecx*2]
 006A9C55    add         ecx,190
 006A9C5B    add         ecx,3
 006A9C5E    mov         eax,dword ptr [esi]
 006A9C60    call        THashTable.Add
 006A9C65    push        6AE2A8;'d'
 006A9C6A    lea         edx,[ebp-1A8]
 006A9C70    mov         eax,ebx
 006A9C72    call        IntToStr
 006A9C77    push        dword ptr [ebp-1A8]
 006A9C7D    push        6AE290;'sharp'
 006A9C82    push        6AE6C8;'Velocity'
 006A9C87    lea         eax,[ebp-1A4]
 006A9C8D    mov         edx,4
 006A9C92    call        @UStrCatN
 006A9C97    mov         edx,dword ptr [ebp-1A4]
 006A9C9D    mov         ecx,ebx
 006A9C9F    add         ecx,ecx
 006A9CA1    add         ecx,ecx
 006A9CA3    lea         ecx,[ecx+ecx*2]
 006A9CA6    add         ecx,190
 006A9CAC    add         ecx,3
 006A9CAF    mov         eax,dword ptr [esi]
 006A9CB1    call        THashTable.Add
 006A9CB6    push        6AE304;'e'
 006A9CBB    lea         edx,[ebp-1B0]
 006A9CC1    mov         eax,ebx
 006A9CC3    call        IntToStr
 006A9CC8    push        dword ptr [ebp-1B0]
 006A9CCE    push        6AE2B8;'flat'
 006A9CD3    push        6AE6C8;'Velocity'
 006A9CD8    lea         eax,[ebp-1AC]
 006A9CDE    mov         edx,4
 006A9CE3    call        @UStrCatN
 006A9CE8    mov         edx,dword ptr [ebp-1AC]
 006A9CEE    mov         ecx,ebx
 006A9CF0    add         ecx,ecx
 006A9CF2    add         ecx,ecx
 006A9CF4    lea         ecx,[ecx+ecx*2]
 006A9CF7    add         ecx,190
 006A9CFD    add         ecx,3
 006A9D00    mov         eax,dword ptr [esi]
 006A9D02    call        THashTable.Add
 006A9D07    push        6AE304;'e'
 006A9D0C    lea         edx,[ebp-1B8]
 006A9D12    mov         eax,ebx
 006A9D14    call        IntToStr
 006A9D19    push        dword ptr [ebp-1B8]
 006A9D1F    push        6AE6C8;'Velocity'
 006A9D24    lea         eax,[ebp-1B4]
 006A9D2A    mov         edx,3
 006A9D2F    call        @UStrCatN
 006A9D34    mov         edx,dword ptr [ebp-1B4]
 006A9D3A    mov         ecx,ebx
 006A9D3C    add         ecx,ecx
 006A9D3E    add         ecx,ecx
 006A9D40    lea         ecx,[ecx+ecx*2]
 006A9D43    add         ecx,190
 006A9D49    add         ecx,4
 006A9D4C    mov         eax,dword ptr [esi]
 006A9D4E    call        THashTable.Add
 006A9D53    push        6AE314;'f'
 006A9D58    lea         edx,[ebp-1C0]
 006A9D5E    mov         eax,ebx
 006A9D60    call        IntToStr
 006A9D65    push        dword ptr [ebp-1C0]
 006A9D6B    push        6AE6C8;'Velocity'
 006A9D70    lea         eax,[ebp-1BC]
 006A9D76    mov         edx,3
 006A9D7B    call        @UStrCatN
 006A9D80    mov         edx,dword ptr [ebp-1BC]
 006A9D86    mov         ecx,ebx
 006A9D88    add         ecx,ecx
 006A9D8A    add         ecx,ecx
 006A9D8C    lea         ecx,[ecx+ecx*2]
 006A9D8F    add         ecx,190
 006A9D95    add         ecx,5
 006A9D98    mov         eax,dword ptr [esi]
 006A9D9A    call        THashTable.Add
 006A9D9F    push        6AE324;'fsharp'
 006A9DA4    lea         edx,[ebp-1C8]
 006A9DAA    mov         eax,ebx
 006A9DAC    call        IntToStr
 006A9DB1    push        dword ptr [ebp-1C8]
 006A9DB7    push        6AE6C8;'Velocity'
 006A9DBC    lea         eax,[ebp-1C4]
 006A9DC2    mov         edx,3
 006A9DC7    call        @UStrCatN
 006A9DCC    mov         edx,dword ptr [ebp-1C4]
 006A9DD2    mov         ecx,ebx
 006A9DD4    add         ecx,ecx
 006A9DD6    add         ecx,ecx
 006A9DD8    lea         ecx,[ecx+ecx*2]
 006A9DDB    add         ecx,190
 006A9DE1    add         ecx,6
 006A9DE4    mov         eax,dword ptr [esi]
 006A9DE6    call        THashTable.Add
 006A9DEB    push        6AE340;'gflat'
 006A9DF0    lea         edx,[ebp-1D0]
 006A9DF6    mov         eax,ebx
 006A9DF8    call        IntToStr
 006A9DFD    push        dword ptr [ebp-1D0]
 006A9E03    push        6AE6C8;'Velocity'
 006A9E08    lea         eax,[ebp-1CC]
 006A9E0E    mov         edx,3
 006A9E13    call        @UStrCatN
 006A9E18    mov         edx,dword ptr [ebp-1CC]
 006A9E1E    mov         ecx,ebx
 006A9E20    add         ecx,ecx
 006A9E22    add         ecx,ecx
 006A9E24    lea         ecx,[ecx+ecx*2]
 006A9E27    add         ecx,190
 006A9E2D    add         ecx,6
 006A9E30    mov         eax,dword ptr [esi]
 006A9E32    call        THashTable.Add
 006A9E37    push        6AE314;'f'
 006A9E3C    lea         edx,[ebp-1D8]
 006A9E42    mov         eax,ebx
 006A9E44    call        IntToStr
 006A9E49    push        dword ptr [ebp-1D8]
 006A9E4F    push        6AE290;'sharp'
 006A9E54    push        6AE6C8;'Velocity'
 006A9E59    lea         eax,[ebp-1D4]
 006A9E5F    mov         edx,4
 006A9E64    call        @UStrCatN
 006A9E69    mov         edx,dword ptr [ebp-1D4]
 006A9E6F    mov         ecx,ebx
 006A9E71    add         ecx,ecx
 006A9E73    add         ecx,ecx
 006A9E75    lea         ecx,[ecx+ecx*2]
 006A9E78    add         ecx,190
 006A9E7E    add         ecx,6
 006A9E81    mov         eax,dword ptr [esi]
 006A9E83    call        THashTable.Add
 006A9E88    push        6AE358;'g'
 006A9E8D    lea         edx,[ebp-1E0]
 006A9E93    mov         eax,ebx
 006A9E95    call        IntToStr
 006A9E9A    push        dword ptr [ebp-1E0]
 006A9EA0    push        6AE2B8;'flat'
 006A9EA5    push        6AE6C8;'Velocity'
 006A9EAA    lea         eax,[ebp-1DC]
 006A9EB0    mov         edx,4
 006A9EB5    call        @UStrCatN
 006A9EBA    mov         edx,dword ptr [ebp-1DC]
 006A9EC0    mov         ecx,ebx
 006A9EC2    add         ecx,ecx
 006A9EC4    add         ecx,ecx
 006A9EC6    lea         ecx,[ecx+ecx*2]
 006A9EC9    add         ecx,190
 006A9ECF    add         ecx,6
 006A9ED2    mov         eax,dword ptr [esi]
 006A9ED4    call        THashTable.Add
 006A9ED9    push        6AE358;'g'
 006A9EDE    lea         edx,[ebp-1E8]
 006A9EE4    mov         eax,ebx
 006A9EE6    call        IntToStr
 006A9EEB    push        dword ptr [ebp-1E8]
 006A9EF1    push        6AE6C8;'Velocity'
 006A9EF6    lea         eax,[ebp-1E4]
 006A9EFC    mov         edx,3
 006A9F01    call        @UStrCatN
 006A9F06    mov         edx,dword ptr [ebp-1E4]
 006A9F0C    mov         ecx,ebx
 006A9F0E    add         ecx,ecx
 006A9F10    add         ecx,ecx
 006A9F12    lea         ecx,[ecx+ecx*2]
 006A9F15    add         ecx,190
 006A9F1B    add         ecx,7
 006A9F1E    mov         eax,dword ptr [esi]
 006A9F20    call        THashTable.Add
 006A9F25    push        6AE368;'gsharp'
 006A9F2A    lea         edx,[ebp-1F0]
 006A9F30    mov         eax,ebx
 006A9F32    call        IntToStr
 006A9F37    push        dword ptr [ebp-1F0]
 006A9F3D    push        6AE6C8;'Velocity'
 006A9F42    lea         eax,[ebp-1EC]
 006A9F48    mov         edx,3
 006A9F4D    call        @UStrCatN
 006A9F52    mov         edx,dword ptr [ebp-1EC]
 006A9F58    mov         ecx,ebx
 006A9F5A    add         ecx,ecx
 006A9F5C    add         ecx,ecx
 006A9F5E    lea         ecx,[ecx+ecx*2]
 006A9F61    add         ecx,190
 006A9F67    add         ecx,8
 006A9F6A    mov         eax,dword ptr [esi]
 006A9F6C    call        THashTable.Add
 006A9F71    push        6AE384;'aflat'
 006A9F76    lea         edx,[ebp-1F8]
 006A9F7C    mov         eax,ebx
 006A9F7E    call        IntToStr
 006A9F83    push        dword ptr [ebp-1F8]
 006A9F89    push        6AE6C8;'Velocity'
 006A9F8E    lea         eax,[ebp-1F4]
 006A9F94    mov         edx,3
 006A9F99    call        @UStrCatN
 006A9F9E    mov         edx,dword ptr [ebp-1F4]
 006A9FA4    mov         ecx,ebx
 006A9FA6    add         ecx,ecx
 006A9FA8    add         ecx,ecx
 006A9FAA    lea         ecx,[ecx+ecx*2]
 006A9FAD    add         ecx,190
 006A9FB3    add         ecx,8
 006A9FB6    mov         eax,dword ptr [esi]
 006A9FB8    call        THashTable.Add
 006A9FBD    push        6AE358;'g'
 006A9FC2    lea         edx,[ebp-200]
 006A9FC8    mov         eax,ebx
 006A9FCA    call        IntToStr
 006A9FCF    push        dword ptr [ebp-200]
 006A9FD5    push        6AE290;'sharp'
 006A9FDA    push        6AE6C8;'Velocity'
 006A9FDF    lea         eax,[ebp-1FC]
 006A9FE5    mov         edx,4
 006A9FEA    call        @UStrCatN
 006A9FEF    mov         edx,dword ptr [ebp-1FC]
 006A9FF5    mov         ecx,ebx
 006A9FF7    add         ecx,ecx
 006A9FF9    add         ecx,ecx
 006A9FFB    lea         ecx,[ecx+ecx*2]
 006A9FFE    add         ecx,190
 006AA004    add         ecx,8
 006AA007    mov         eax,dword ptr [esi]
 006AA009    call        THashTable.Add
 006AA00E    push        6AE39C;'a'
 006AA013    lea         edx,[ebp-208]
 006AA019    mov         eax,ebx
 006AA01B    call        IntToStr
 006AA020    push        dword ptr [ebp-208]
 006AA026    push        6AE2B8;'flat'
 006AA02B    push        6AE6C8;'Velocity'
 006AA030    lea         eax,[ebp-204]
 006AA036    mov         edx,4
 006AA03B    call        @UStrCatN
 006AA040    mov         edx,dword ptr [ebp-204]
 006AA046    mov         ecx,ebx
 006AA048    add         ecx,ecx
 006AA04A    add         ecx,ecx
 006AA04C    lea         ecx,[ecx+ecx*2]
 006AA04F    add         ecx,190
 006AA055    add         ecx,8
 006AA058    mov         eax,dword ptr [esi]
 006AA05A    call        THashTable.Add
 006AA05F    push        6AE39C;'a'
 006AA064    lea         edx,[ebp-210]
 006AA06A    mov         eax,ebx
 006AA06C    call        IntToStr
 006AA071    push        dword ptr [ebp-210]
 006AA077    push        6AE6C8;'Velocity'
 006AA07C    lea         eax,[ebp-20C]
 006AA082    mov         edx,3
 006AA087    call        @UStrCatN
 006AA08C    mov         edx,dword ptr [ebp-20C]
 006AA092    mov         ecx,ebx
 006AA094    add         ecx,ecx
 006AA096    add         ecx,ecx
 006AA098    lea         ecx,[ecx+ecx*2]
 006AA09B    add         ecx,190
 006AA0A1    add         ecx,9
 006AA0A4    mov         eax,dword ptr [esi]
 006AA0A6    call        THashTable.Add
 006AA0AB    push        6AE3AC;'asharp'
 006AA0B0    lea         edx,[ebp-218]
 006AA0B6    mov         eax,ebx
 006AA0B8    call        IntToStr
 006AA0BD    push        dword ptr [ebp-218]
 006AA0C3    push        6AE6C8;'Velocity'
 006AA0C8    lea         eax,[ebp-214]
 006AA0CE    mov         edx,3
 006AA0D3    call        @UStrCatN
 006AA0D8    mov         edx,dword ptr [ebp-214]
 006AA0DE    mov         ecx,ebx
 006AA0E0    add         ecx,ecx
 006AA0E2    add         ecx,ecx
 006AA0E4    lea         ecx,[ecx+ecx*2]
 006AA0E7    add         ecx,190
 006AA0ED    add         ecx,0A
 006AA0F0    mov         eax,dword ptr [esi]
 006AA0F2    call        THashTable.Add
 006AA0F7    push        6AE3C8;'bflat'
 006AA0FC    lea         edx,[ebp-220]
 006AA102    mov         eax,ebx
 006AA104    call        IntToStr
 006AA109    push        dword ptr [ebp-220]
 006AA10F    push        6AE6C8;'Velocity'
 006AA114    lea         eax,[ebp-21C]
 006AA11A    mov         edx,3
 006AA11F    call        @UStrCatN
 006AA124    mov         edx,dword ptr [ebp-21C]
 006AA12A    mov         ecx,ebx
 006AA12C    add         ecx,ecx
 006AA12E    add         ecx,ecx
 006AA130    lea         ecx,[ecx+ecx*2]
 006AA133    add         ecx,190
 006AA139    add         ecx,0A
 006AA13C    mov         eax,dword ptr [esi]
 006AA13E    call        THashTable.Add
 006AA143    push        6AE39C;'a'
 006AA148    lea         edx,[ebp-228]
 006AA14E    mov         eax,ebx
 006AA150    call        IntToStr
 006AA155    push        dword ptr [ebp-228]
 006AA15B    push        6AE290;'sharp'
 006AA160    push        6AE6C8;'Velocity'
 006AA165    lea         eax,[ebp-224]
 006AA16B    mov         edx,4
 006AA170    call        @UStrCatN
 006AA175    mov         edx,dword ptr [ebp-224]
 006AA17B    mov         ecx,ebx
 006AA17D    add         ecx,ecx
 006AA17F    add         ecx,ecx
 006AA181    lea         ecx,[ecx+ecx*2]
 006AA184    add         ecx,190
 006AA18A    add         ecx,0A
 006AA18D    mov         eax,dword ptr [esi]
 006AA18F    call        THashTable.Add
 006AA194    push        6AE3E0;'b'
 006AA199    lea         edx,[ebp-230]
 006AA19F    mov         eax,ebx
 006AA1A1    call        IntToStr
 006AA1A6    push        dword ptr [ebp-230]
 006AA1AC    push        6AE2B8;'flat'
 006AA1B1    push        6AE6C8;'Velocity'
 006AA1B6    lea         eax,[ebp-22C]
 006AA1BC    mov         edx,4
 006AA1C1    call        @UStrCatN
 006AA1C6    mov         edx,dword ptr [ebp-22C]
 006AA1CC    mov         ecx,ebx
 006AA1CE    add         ecx,ecx
 006AA1D0    add         ecx,ecx
 006AA1D2    lea         ecx,[ecx+ecx*2]
 006AA1D5    add         ecx,190
 006AA1DB    add         ecx,0A
 006AA1DE    mov         eax,dword ptr [esi]
 006AA1E0    call        THashTable.Add
 006AA1E5    push        6AE3E0;'b'
 006AA1EA    lea         edx,[ebp-238]
 006AA1F0    mov         eax,ebx
 006AA1F2    call        IntToStr
 006AA1F7    push        dword ptr [ebp-238]
 006AA1FD    push        6AE6C8;'Velocity'
 006AA202    lea         eax,[ebp-234]
 006AA208    mov         edx,3
 006AA20D    call        @UStrCatN
 006AA212    mov         edx,dword ptr [ebp-234]
 006AA218    mov         ecx,ebx
 006AA21A    add         ecx,ecx
 006AA21C    add         ecx,ecx
 006AA21E    lea         ecx,[ecx+ecx*2]
 006AA221    add         ecx,190
 006AA227    add         ecx,0B
 006AA22A    mov         eax,dword ptr [esi]
 006AA22C    call        THashTable.Add
 006AA231    inc         ebx
 006AA232    cmp         ebx,0A
>006AA235    jne         006A9A2B
 006AA23B    mov         ebx,0A
 006AA240    push        6AE24C;'c'
 006AA245    lea         edx,[ebp-240]
 006AA24B    mov         eax,ebx
 006AA24D    call        IntToStr
 006AA252    push        dword ptr [ebp-240]
 006AA258    push        6AE6C8;'Velocity'
 006AA25D    lea         eax,[ebp-23C]
 006AA263    mov         edx,3
 006AA268    call        @UStrCatN
 006AA26D    mov         edx,dword ptr [ebp-23C]
 006AA273    mov         edi,ebx
 006AA275    add         edi,edi
 006AA277    add         edi,edi
 006AA279    lea         edi,[edi+edi*2]
 006AA27C    add         edi,190
 006AA282    mov         ecx,edi
 006AA284    mov         eax,dword ptr [esi]
 006AA286    call        THashTable.Add
 006AA28B    push        6AE25C;'csharp'
 006AA290    lea         edx,[ebp-248]
 006AA296    mov         eax,ebx
 006AA298    call        IntToStr
 006AA29D    push        dword ptr [ebp-248]
 006AA2A3    push        6AE6C8;'Velocity'
 006AA2A8    lea         eax,[ebp-244]
 006AA2AE    mov         edx,3
 006AA2B3    call        @UStrCatN
 006AA2B8    mov         edx,dword ptr [ebp-244]
 006AA2BE    mov         ecx,edi
 006AA2C0    inc         ecx
 006AA2C1    mov         eax,dword ptr [esi]
 006AA2C3    call        THashTable.Add
 006AA2C8    push        6AE278;'dflat'
 006AA2CD    lea         edx,[ebp-250]
 006AA2D3    mov         eax,ebx
 006AA2D5    call        IntToStr
 006AA2DA    push        dword ptr [ebp-250]
 006AA2E0    push        6AE6C8;'Velocity'
 006AA2E5    lea         eax,[ebp-24C]
 006AA2EB    mov         edx,3
 006AA2F0    call        @UStrCatN
 006AA2F5    mov         edx,dword ptr [ebp-24C]
 006AA2FB    mov         ecx,ebx
 006AA2FD    add         ecx,ecx
 006AA2FF    add         ecx,ecx
 006AA301    lea         ecx,[ecx+ecx*2]
 006AA304    add         ecx,190
 006AA30A    inc         ecx
 006AA30B    mov         eax,dword ptr [esi]
 006AA30D    call        THashTable.Add
 006AA312    push        6AE24C;'c'
 006AA317    lea         edx,[ebp-258]
 006AA31D    mov         eax,ebx
 006AA31F    call        IntToStr
 006AA324    push        dword ptr [ebp-258]
 006AA32A    push        6AE290;'sharp'
 006AA32F    push        6AE6C8;'Velocity'
 006AA334    lea         eax,[ebp-254]
 006AA33A    mov         edx,4
 006AA33F    call        @UStrCatN
 006AA344    mov         edx,dword ptr [ebp-254]
 006AA34A    mov         ecx,ebx
 006AA34C    add         ecx,ecx
 006AA34E    add         ecx,ecx
 006AA350    lea         ecx,[ecx+ecx*2]
 006AA353    add         ecx,190
 006AA359    inc         ecx
 006AA35A    mov         eax,dword ptr [esi]
 006AA35C    call        THashTable.Add
 006AA361    push        6AE2A8;'d'
 006AA366    lea         edx,[ebp-260]
 006AA36C    mov         eax,ebx
 006AA36E    call        IntToStr
 006AA373    push        dword ptr [ebp-260]
 006AA379    push        6AE2B8;'flat'
 006AA37E    push        6AE6C8;'Velocity'
 006AA383    lea         eax,[ebp-25C]
 006AA389    mov         edx,4
 006AA38E    call        @UStrCatN
 006AA393    mov         edx,dword ptr [ebp-25C]
 006AA399    mov         ecx,ebx
 006AA39B    add         ecx,ecx
 006AA39D    add         ecx,ecx
 006AA39F    lea         ecx,[ecx+ecx*2]
 006AA3A2    add         ecx,190
 006AA3A8    inc         ecx
 006AA3A9    mov         eax,dword ptr [esi]
 006AA3AB    call        THashTable.Add
 006AA3B0    push        6AE2A8;'d'
 006AA3B5    lea         edx,[ebp-268]
 006AA3BB    mov         eax,ebx
 006AA3BD    call        IntToStr
 006AA3C2    push        dword ptr [ebp-268]
 006AA3C8    push        6AE6C8;'Velocity'
 006AA3CD    lea         eax,[ebp-264]
 006AA3D3    mov         edx,3
 006AA3D8    call        @UStrCatN
 006AA3DD    mov         edx,dword ptr [ebp-264]
 006AA3E3    mov         ecx,edi
 006AA3E5    add         ecx,2
 006AA3E8    mov         eax,dword ptr [esi]
 006AA3EA    call        THashTable.Add
 006AA3EF    push        6AE2D0;'dsharp'
 006AA3F4    lea         edx,[ebp-270]
 006AA3FA    mov         eax,ebx
 006AA3FC    call        IntToStr
 006AA401    push        dword ptr [ebp-270]
 006AA407    push        6AE6C8;'Velocity'
 006AA40C    lea         eax,[ebp-26C]
 006AA412    mov         edx,3
 006AA417    call        @UStrCatN
 006AA41C    mov         edx,dword ptr [ebp-26C]
 006AA422    mov         ecx,edi
 006AA424    add         ecx,3
 006AA427    mov         eax,dword ptr [esi]
 006AA429    call        THashTable.Add
 006AA42E    push        6AE2EC;'eflat'
 006AA433    lea         edx,[ebp-278]
 006AA439    mov         eax,ebx
 006AA43B    call        IntToStr
 006AA440    push        dword ptr [ebp-278]
 006AA446    push        6AE6C8;'Velocity'
 006AA44B    lea         eax,[ebp-274]
 006AA451    mov         edx,3
 006AA456    call        @UStrCatN
 006AA45B    mov         edx,dword ptr [ebp-274]
 006AA461    mov         ecx,ebx
 006AA463    add         ecx,ecx
 006AA465    add         ecx,ecx
 006AA467    lea         ecx,[ecx+ecx*2]
 006AA46A    add         ecx,190
 006AA470    add         ecx,3
 006AA473    mov         eax,dword ptr [esi]
 006AA475    call        THashTable.Add
 006AA47A    push        6AE2A8;'d'
 006AA47F    lea         edx,[ebp-280]
 006AA485    mov         eax,ebx
 006AA487    call        IntToStr
 006AA48C    push        dword ptr [ebp-280]
 006AA492    push        6AE290;'sharp'
 006AA497    push        6AE6C8;'Velocity'
 006AA49C    lea         eax,[ebp-27C]
 006AA4A2    mov         edx,4
 006AA4A7    call        @UStrCatN
 006AA4AC    mov         edx,dword ptr [ebp-27C]
 006AA4B2    mov         ecx,ebx
 006AA4B4    add         ecx,ecx
 006AA4B6    add         ecx,ecx
 006AA4B8    lea         ecx,[ecx+ecx*2]
 006AA4BB    add         ecx,190
 006AA4C1    add         ecx,3
 006AA4C4    mov         eax,dword ptr [esi]
 006AA4C6    call        THashTable.Add
 006AA4CB    push        6AE304;'e'
 006AA4D0    lea         edx,[ebp-288]
 006AA4D6    mov         eax,ebx
 006AA4D8    call        IntToStr
 006AA4DD    push        dword ptr [ebp-288]
 006AA4E3    push        6AE2B8;'flat'
 006AA4E8    push        6AE6C8;'Velocity'
 006AA4ED    lea         eax,[ebp-284]
 006AA4F3    mov         edx,4
 006AA4F8    call        @UStrCatN
 006AA4FD    mov         edx,dword ptr [ebp-284]
 006AA503    mov         ecx,ebx
 006AA505    add         ecx,ecx
 006AA507    add         ecx,ecx
 006AA509    lea         ecx,[ecx+ecx*2]
 006AA50C    add         ecx,190
 006AA512    add         ecx,3
 006AA515    mov         eax,dword ptr [esi]
 006AA517    call        THashTable.Add
 006AA51C    push        6AE304;'e'
 006AA521    lea         edx,[ebp-290]
 006AA527    mov         eax,ebx
 006AA529    call        IntToStr
 006AA52E    push        dword ptr [ebp-290]
 006AA534    push        6AE6C8;'Velocity'
 006AA539    lea         eax,[ebp-28C]
 006AA53F    mov         edx,3
 006AA544    call        @UStrCatN
 006AA549    mov         edx,dword ptr [ebp-28C]
 006AA54F    mov         ecx,ebx
 006AA551    add         ecx,ecx
 006AA553    add         ecx,ecx
 006AA555    lea         ecx,[ecx+ecx*2]
 006AA558    add         ecx,190
 006AA55E    add         ecx,4
 006AA561    mov         eax,dword ptr [esi]
 006AA563    call        THashTable.Add
 006AA568    push        6AE314;'f'
 006AA56D    lea         edx,[ebp-298]
 006AA573    mov         eax,ebx
 006AA575    call        IntToStr
 006AA57A    push        dword ptr [ebp-298]
 006AA580    push        6AE6C8;'Velocity'
 006AA585    lea         eax,[ebp-294]
 006AA58B    mov         edx,3
 006AA590    call        @UStrCatN
 006AA595    mov         edx,dword ptr [ebp-294]
 006AA59B    mov         ecx,ebx
 006AA59D    add         ecx,ecx
 006AA59F    add         ecx,ecx
 006AA5A1    lea         ecx,[ecx+ecx*2]
 006AA5A4    add         ecx,190
 006AA5AA    add         ecx,5
 006AA5AD    mov         eax,dword ptr [esi]
 006AA5AF    call        THashTable.Add
 006AA5B4    push        6AE324;'fsharp'
 006AA5B9    lea         edx,[ebp-2A0]
 006AA5BF    mov         eax,ebx
 006AA5C1    call        IntToStr
 006AA5C6    push        dword ptr [ebp-2A0]
 006AA5CC    push        6AE6C8;'Velocity'
 006AA5D1    lea         eax,[ebp-29C]
 006AA5D7    mov         edx,3
 006AA5DC    call        @UStrCatN
 006AA5E1    mov         edx,dword ptr [ebp-29C]
 006AA5E7    mov         ecx,ebx
 006AA5E9    add         ecx,ecx
 006AA5EB    add         ecx,ecx
 006AA5ED    lea         ecx,[ecx+ecx*2]
 006AA5F0    add         ecx,190
 006AA5F6    add         ecx,6
 006AA5F9    mov         eax,dword ptr [esi]
 006AA5FB    call        THashTable.Add
 006AA600    push        6AE340;'gflat'
 006AA605    lea         edx,[ebp-2A8]
 006AA60B    mov         eax,ebx
 006AA60D    call        IntToStr
 006AA612    push        dword ptr [ebp-2A8]
 006AA618    push        6AE6C8;'Velocity'
 006AA61D    lea         eax,[ebp-2A4]
 006AA623    mov         edx,3
 006AA628    call        @UStrCatN
 006AA62D    mov         edx,dword ptr [ebp-2A4]
 006AA633    mov         ecx,ebx
 006AA635    add         ecx,ecx
 006AA637    add         ecx,ecx
 006AA639    lea         ecx,[ecx+ecx*2]
 006AA63C    add         ecx,190
 006AA642    add         ecx,6
 006AA645    mov         eax,dword ptr [esi]
 006AA647    call        THashTable.Add
 006AA64C    push        6AE314;'f'
 006AA651    lea         edx,[ebp-2B0]
 006AA657    mov         eax,ebx
 006AA659    call        IntToStr
 006AA65E    push        dword ptr [ebp-2B0]
 006AA664    push        6AE290;'sharp'
 006AA669    push        6AE6C8;'Velocity'
 006AA66E    lea         eax,[ebp-2AC]
 006AA674    mov         edx,4
 006AA679    call        @UStrCatN
 006AA67E    mov         edx,dword ptr [ebp-2AC]
 006AA684    mov         ecx,ebx
 006AA686    add         ecx,ecx
 006AA688    add         ecx,ecx
 006AA68A    lea         ecx,[ecx+ecx*2]
 006AA68D    add         ecx,190
 006AA693    add         ecx,6
 006AA696    mov         eax,dword ptr [esi]
 006AA698    call        THashTable.Add
 006AA69D    push        6AE358;'g'
 006AA6A2    lea         edx,[ebp-2B8]
 006AA6A8    mov         eax,ebx
 006AA6AA    call        IntToStr
 006AA6AF    push        dword ptr [ebp-2B8]
 006AA6B5    push        6AE2B8;'flat'
 006AA6BA    push        6AE6C8;'Velocity'
 006AA6BF    lea         eax,[ebp-2B4]
 006AA6C5    mov         edx,4
 006AA6CA    call        @UStrCatN
 006AA6CF    mov         edx,dword ptr [ebp-2B4]
 006AA6D5    mov         ecx,ebx
 006AA6D7    add         ecx,ecx
 006AA6D9    add         ecx,ecx
 006AA6DB    lea         ecx,[ecx+ecx*2]
 006AA6DE    add         ecx,190
 006AA6E4    add         ecx,6
 006AA6E7    mov         eax,dword ptr [esi]
 006AA6E9    call        THashTable.Add
 006AA6EE    push        6AE358;'g'
 006AA6F3    lea         edx,[ebp-2C0]
 006AA6F9    mov         eax,ebx
 006AA6FB    call        IntToStr
 006AA700    push        dword ptr [ebp-2C0]
 006AA706    push        6AE6C8;'Velocity'
 006AA70B    lea         eax,[ebp-2BC]
 006AA711    mov         edx,3
 006AA716    call        @UStrCatN
 006AA71B    mov         edx,dword ptr [ebp-2BC]
 006AA721    mov         ecx,ebx
 006AA723    add         ecx,ecx
 006AA725    add         ecx,ecx
 006AA727    lea         ecx,[ecx+ecx*2]
 006AA72A    add         ecx,190
 006AA730    add         ecx,7
 006AA733    mov         eax,dword ptr [esi]
 006AA735    call        THashTable.Add
 006AA73A    mov         ecx,1CC
 006AA73F    mov         edx,6AE6E8;'MiddleCVelocity'
 006AA744    mov         eax,dword ptr [esi]
 006AA746    call        THashTable.Add
 006AA74B    mov         ecx,1CD
 006AA750    mov         edx,6AE714;'MiddleCSharpVelocity'
 006AA755    mov         eax,dword ptr [esi]
 006AA757    call        THashTable.Add
 006AA75C    mov         ecx,1CD
 006AA761    mov         edx,6AE74C;'MiddleDFlatVelocity'
 006AA766    mov         eax,dword ptr [esi]
 006AA768    call        THashTable.Add
 006AA76D    mov         ecx,1CD
 006AA772    mov         edx,6AE714;'MiddleCSharpVelocity'
 006AA777    mov         eax,dword ptr [esi]
 006AA779    call        THashTable.Add
 006AA77E    mov         ecx,1CD
 006AA783    mov         edx,6AE74C;'MiddleDFlatVelocity'
 006AA788    mov         eax,dword ptr [esi]
 006AA78A    call        THashTable.Add
 006AA78F    mov         ecx,1CE
 006AA794    mov         edx,6AE780;'MiddleDVelocity'
 006AA799    mov         eax,dword ptr [esi]
 006AA79B    call        THashTable.Add
 006AA7A0    mov         ecx,1CF
 006AA7A5    mov         edx,6AE7AC;'MiddleDSharpVelocity'
 006AA7AA    mov         eax,dword ptr [esi]
 006AA7AC    call        THashTable.Add
 006AA7B1    mov         ecx,1CF
 006AA7B6    mov         edx,6AE7E4;'MiddleEFlatVelocity'
 006AA7BB    mov         eax,dword ptr [esi]
 006AA7BD    call        THashTable.Add
 006AA7C2    mov         ecx,1CF
 006AA7C7    mov         edx,6AE7AC;'MiddleDSharpVelocity'
 006AA7CC    mov         eax,dword ptr [esi]
 006AA7CE    call        THashTable.Add
 006AA7D3    mov         ecx,1CF
 006AA7D8    mov         edx,6AE7E4;'MiddleEFlatVelocity'
 006AA7DD    mov         eax,dword ptr [esi]
 006AA7DF    call        THashTable.Add
 006AA7E4    mov         ecx,1D0
 006AA7E9    mov         edx,6AE818;'MiddleEVelocity'
 006AA7EE    mov         eax,dword ptr [esi]
 006AA7F0    call        THashTable.Add
 006AA7F5    mov         ecx,1D1
 006AA7FA    mov         edx,6AE844;'MiddleFVelocity'
 006AA7FF    mov         eax,dword ptr [esi]
 006AA801    call        THashTable.Add
 006AA806    mov         ecx,1D2
 006AA80B    mov         edx,6AE870;'MiddleFsharpVelocity'
 006AA810    mov         eax,dword ptr [esi]
 006AA812    call        THashTable.Add
 006AA817    mov         ecx,1D2
 006AA81C    mov         edx,6AE8A8;'MiddleGflatVelocity'
 006AA821    mov         eax,dword ptr [esi]
 006AA823    call        THashTable.Add
 006AA828    mov         ecx,1D2
 006AA82D    mov         edx,6AE8DC;'MiddleFSharpVelocity'
 006AA832    mov         eax,dword ptr [esi]
 006AA834    call        THashTable.Add
 006AA839    mov         ecx,1D2
 006AA83E    mov         edx,6AE914;'MiddleGFlatVelocity'
 006AA843    mov         eax,dword ptr [esi]
 006AA845    call        THashTable.Add
 006AA84A    mov         ecx,1D3
 006AA84F    mov         edx,6AE948;'MiddleGVelocity'
 006AA854    mov         eax,dword ptr [esi]
 006AA856    call        THashTable.Add
 006AA85B    mov         ecx,1D4
 006AA860    mov         edx,6AE974;'MiddleGsharpVelocity'
 006AA865    mov         eax,dword ptr [esi]
 006AA867    call        THashTable.Add
 006AA86C    mov         ecx,1D4
 006AA871    mov         edx,6AE9AC;'MiddleAflatVelocity'
 006AA876    mov         eax,dword ptr [esi]
 006AA878    call        THashTable.Add
 006AA87D    mov         ecx,1D4
 006AA882    mov         edx,6AE9E0;'MiddleGSharpVelocity'
 006AA887    mov         eax,dword ptr [esi]
 006AA889    call        THashTable.Add
 006AA88E    mov         ecx,1D4
 006AA893    mov         edx,6AEA18;'MiddleAFlatVelocity'
 006AA898    mov         eax,dword ptr [esi]
 006AA89A    call        THashTable.Add
 006AA89F    mov         ecx,1D5
 006AA8A4    mov         edx,6AEA4C;'MiddleAVelocity'
 006AA8A9    mov         eax,dword ptr [esi]
 006AA8AB    call        THashTable.Add
 006AA8B0    mov         ecx,1D6
 006AA8B5    mov         edx,6AEA78;'MiddleASharpVelocity'
 006AA8BA    mov         eax,dword ptr [esi]
 006AA8BC    call        THashTable.Add
 006AA8C1    mov         ecx,1D6
 006AA8C6    mov         edx,6AEAB0;'MiddleBFlatVelocity'
 006AA8CB    mov         eax,dword ptr [esi]
 006AA8CD    call        THashTable.Add
 006AA8D2    mov         ecx,1D6
 006AA8D7    mov         edx,6AEA78;'MiddleASharpVelocity'
 006AA8DC    mov         eax,dword ptr [esi]
 006AA8DE    call        THashTable.Add
 006AA8E3    mov         ecx,1D6
 006AA8E8    mov         edx,6AEAB0;'MiddleBFlatVelocity'
 006AA8ED    mov         eax,dword ptr [esi]
 006AA8EF    call        THashTable.Add
 006AA8F4    mov         ecx,1D7
 006AA8F9    mov         edx,6AEAE4;'MiddleBVelocity'
 006AA8FE    mov         eax,dword ptr [esi]
 006AA900    call        THashTable.Add
 006AA905    xor         ebx,ebx
 006AA907    push        6AE24C;'c'
 006AA90C    lea         edx,[ebp-2C8]
 006AA912    mov         eax,ebx
 006AA914    call        IntToStr
 006AA919    push        dword ptr [ebp-2C8]
 006AA91F    push        6AEB10;'Aftertouch'
 006AA924    lea         eax,[ebp-2C4]
 006AA92A    mov         edx,3
 006AA92F    call        @UStrCatN
 006AA934    mov         edx,dword ptr [ebp-2C4]
 006AA93A    mov         edi,ebx
 006AA93C    add         edi,edi
 006AA93E    add         edi,edi
 006AA940    lea         edi,[edi+edi*2]
 006AA943    add         edi,258
 006AA949    mov         ecx,edi
 006AA94B    mov         eax,dword ptr [esi]
 006AA94D    call        THashTable.Add
 006AA952    push        6AE25C;'csharp'
 006AA957    lea         edx,[ebp-2D0]
 006AA95D    mov         eax,ebx
 006AA95F    call        IntToStr
 006AA964    push        dword ptr [ebp-2D0]
 006AA96A    push        6AEB10;'Aftertouch'
 006AA96F    lea         eax,[ebp-2CC]
 006AA975    mov         edx,3
 006AA97A    call        @UStrCatN
 006AA97F    mov         edx,dword ptr [ebp-2CC]
 006AA985    mov         ecx,edi
 006AA987    inc         ecx
 006AA988    mov         eax,dword ptr [esi]
 006AA98A    call        THashTable.Add
 006AA98F    push        6AE278;'dflat'
 006AA994    lea         edx,[ebp-2D8]
 006AA99A    mov         eax,ebx
 006AA99C    call        IntToStr
 006AA9A1    push        dword ptr [ebp-2D8]
 006AA9A7    push        6AEB10;'Aftertouch'
 006AA9AC    lea         eax,[ebp-2D4]
 006AA9B2    mov         edx,3
 006AA9B7    call        @UStrCatN
 006AA9BC    mov         edx,dword ptr [ebp-2D4]
 006AA9C2    mov         ecx,ebx
 006AA9C4    add         ecx,ecx
 006AA9C6    add         ecx,ecx
 006AA9C8    lea         ecx,[ecx+ecx*2]
 006AA9CB    add         ecx,258
 006AA9D1    inc         ecx
 006AA9D2    mov         eax,dword ptr [esi]
 006AA9D4    call        THashTable.Add
 006AA9D9    push        6AE24C;'c'
 006AA9DE    lea         edx,[ebp-2E0]
 006AA9E4    mov         eax,ebx
 006AA9E6    call        IntToStr
 006AA9EB    push        dword ptr [ebp-2E0]
 006AA9F1    push        6AE290;'sharp'
 006AA9F6    push        6AEB10;'Aftertouch'
 006AA9FB    lea         eax,[ebp-2DC]
 006AAA01    mov         edx,4
 006AAA06    call        @UStrCatN
 006AAA0B    mov         edx,dword ptr [ebp-2DC]
 006AAA11    mov         ecx,ebx
 006AAA13    add         ecx,ecx
 006AAA15    add         ecx,ecx
 006AAA17    lea         ecx,[ecx+ecx*2]
 006AAA1A    add         ecx,258
 006AAA20    inc         ecx
 006AAA21    mov         eax,dword ptr [esi]
 006AAA23    call        THashTable.Add
 006AAA28    push        6AE2A8;'d'
 006AAA2D    lea         edx,[ebp-2E8]
 006AAA33    mov         eax,ebx
 006AAA35    call        IntToStr
 006AAA3A    push        dword ptr [ebp-2E8]
 006AAA40    push        6AE2B8;'flat'
 006AAA45    push        6AEB10;'Aftertouch'
 006AAA4A    lea         eax,[ebp-2E4]
 006AAA50    mov         edx,4
 006AAA55    call        @UStrCatN
 006AAA5A    mov         edx,dword ptr [ebp-2E4]
 006AAA60    mov         ecx,ebx
 006AAA62    add         ecx,ecx
 006AAA64    add         ecx,ecx
 006AAA66    lea         ecx,[ecx+ecx*2]
 006AAA69    add         ecx,258
 006AAA6F    inc         ecx
 006AAA70    mov         eax,dword ptr [esi]
 006AAA72    call        THashTable.Add
 006AAA77    push        6AE2A8;'d'
 006AAA7C    lea         edx,[ebp-2F0]
 006AAA82    mov         eax,ebx
 006AAA84    call        IntToStr
 006AAA89    push        dword ptr [ebp-2F0]
 006AAA8F    push        6AEB10;'Aftertouch'
 006AAA94    lea         eax,[ebp-2EC]
 006AAA9A    mov         edx,3
 006AAA9F    call        @UStrCatN
 006AAAA4    mov         edx,dword ptr [ebp-2EC]
 006AAAAA    mov         ecx,edi
 006AAAAC    add         ecx,2
 006AAAAF    mov         eax,dword ptr [esi]
 006AAAB1    call        THashTable.Add
 006AAAB6    push        6AE2D0;'dsharp'
 006AAABB    lea         edx,[ebp-2F8]
 006AAAC1    mov         eax,ebx
 006AAAC3    call        IntToStr
 006AAAC8    push        dword ptr [ebp-2F8]
 006AAACE    push        6AEB10;'Aftertouch'
 006AAAD3    lea         eax,[ebp-2F4]
 006AAAD9    mov         edx,3
 006AAADE    call        @UStrCatN
 006AAAE3    mov         edx,dword ptr [ebp-2F4]
 006AAAE9    mov         ecx,edi
 006AAAEB    add         ecx,3
 006AAAEE    mov         eax,dword ptr [esi]
 006AAAF0    call        THashTable.Add
 006AAAF5    push        6AE2EC;'eflat'
 006AAAFA    lea         edx,[ebp-300]
 006AAB00    mov         eax,ebx
 006AAB02    call        IntToStr
 006AAB07    push        dword ptr [ebp-300]
 006AAB0D    push        6AEB10;'Aftertouch'
 006AAB12    lea         eax,[ebp-2FC]
 006AAB18    mov         edx,3
 006AAB1D    call        @UStrCatN
 006AAB22    mov         edx,dword ptr [ebp-2FC]
 006AAB28    mov         ecx,ebx
 006AAB2A    add         ecx,ecx
 006AAB2C    add         ecx,ecx
 006AAB2E    lea         ecx,[ecx+ecx*2]
 006AAB31    add         ecx,258
 006AAB37    add         ecx,3
 006AAB3A    mov         eax,dword ptr [esi]
 006AAB3C    call        THashTable.Add
 006AAB41    push        6AE2A8;'d'
 006AAB46    lea         edx,[ebp-308]
 006AAB4C    mov         eax,ebx
 006AAB4E    call        IntToStr
 006AAB53    push        dword ptr [ebp-308]
 006AAB59    push        6AE290;'sharp'
 006AAB5E    push        6AEB10;'Aftertouch'
 006AAB63    lea         eax,[ebp-304]
 006AAB69    mov         edx,4
 006AAB6E    call        @UStrCatN
 006AAB73    mov         edx,dword ptr [ebp-304]
 006AAB79    mov         ecx,ebx
 006AAB7B    add         ecx,ecx
 006AAB7D    add         ecx,ecx
 006AAB7F    lea         ecx,[ecx+ecx*2]
 006AAB82    add         ecx,258
 006AAB88    add         ecx,3
 006AAB8B    mov         eax,dword ptr [esi]
 006AAB8D    call        THashTable.Add
 006AAB92    push        6AE304;'e'
 006AAB97    lea         edx,[ebp-310]
 006AAB9D    mov         eax,ebx
 006AAB9F    call        IntToStr
 006AABA4    push        dword ptr [ebp-310]
 006AABAA    push        6AE2B8;'flat'
 006AABAF    push        6AEB10;'Aftertouch'
 006AABB4    lea         eax,[ebp-30C]
 006AABBA    mov         edx,4
 006AABBF    call        @UStrCatN
 006AABC4    mov         edx,dword ptr [ebp-30C]
 006AABCA    mov         ecx,ebx
 006AABCC    add         ecx,ecx
 006AABCE    add         ecx,ecx
 006AABD0    lea         ecx,[ecx+ecx*2]
 006AABD3    add         ecx,258
 006AABD9    add         ecx,3
 006AABDC    mov         eax,dword ptr [esi]
 006AABDE    call        THashTable.Add
 006AABE3    push        6AE304;'e'
 006AABE8    lea         edx,[ebp-318]
 006AABEE    mov         eax,ebx
 006AABF0    call        IntToStr
 006AABF5    push        dword ptr [ebp-318]
 006AABFB    push        6AEB10;'Aftertouch'
 006AAC00    lea         eax,[ebp-314]
 006AAC06    mov         edx,3
 006AAC0B    call        @UStrCatN
 006AAC10    mov         edx,dword ptr [ebp-314]
 006AAC16    mov         ecx,ebx
 006AAC18    add         ecx,ecx
 006AAC1A    add         ecx,ecx
 006AAC1C    lea         ecx,[ecx+ecx*2]
 006AAC1F    add         ecx,258
 006AAC25    add         ecx,4
 006AAC28    mov         eax,dword ptr [esi]
 006AAC2A    call        THashTable.Add
 006AAC2F    push        6AE314;'f'
 006AAC34    lea         edx,[ebp-320]
 006AAC3A    mov         eax,ebx
 006AAC3C    call        IntToStr
 006AAC41    push        dword ptr [ebp-320]
 006AAC47    push        6AEB10;'Aftertouch'
 006AAC4C    lea         eax,[ebp-31C]
 006AAC52    mov         edx,3
 006AAC57    call        @UStrCatN
 006AAC5C    mov         edx,dword ptr [ebp-31C]
 006AAC62    mov         ecx,ebx
 006AAC64    add         ecx,ecx
 006AAC66    add         ecx,ecx
 006AAC68    lea         ecx,[ecx+ecx*2]
 006AAC6B    add         ecx,258
 006AAC71    add         ecx,5
 006AAC74    mov         eax,dword ptr [esi]
 006AAC76    call        THashTable.Add
 006AAC7B    push        6AE324;'fsharp'
 006AAC80    lea         edx,[ebp-328]
 006AAC86    mov         eax,ebx
 006AAC88    call        IntToStr
 006AAC8D    push        dword ptr [ebp-328]
 006AAC93    push        6AEB10;'Aftertouch'
 006AAC98    lea         eax,[ebp-324]
 006AAC9E    mov         edx,3
 006AACA3    call        @UStrCatN
 006AACA8    mov         edx,dword ptr [ebp-324]
 006AACAE    mov         ecx,ebx
 006AACB0    add         ecx,ecx
 006AACB2    add         ecx,ecx
 006AACB4    lea         ecx,[ecx+ecx*2]
 006AACB7    add         ecx,258
 006AACBD    add         ecx,6
 006AACC0    mov         eax,dword ptr [esi]
 006AACC2    call        THashTable.Add
 006AACC7    push        6AE340;'gflat'
 006AACCC    lea         edx,[ebp-330]
 006AACD2    mov         eax,ebx
 006AACD4    call        IntToStr
 006AACD9    push        dword ptr [ebp-330]
 006AACDF    push        6AEB10;'Aftertouch'
 006AACE4    lea         eax,[ebp-32C]
 006AACEA    mov         edx,3
 006AACEF    call        @UStrCatN
 006AACF4    mov         edx,dword ptr [ebp-32C]
 006AACFA    mov         ecx,ebx
 006AACFC    add         ecx,ecx
 006AACFE    add         ecx,ecx
 006AAD00    lea         ecx,[ecx+ecx*2]
 006AAD03    add         ecx,258
 006AAD09    add         ecx,6
 006AAD0C    mov         eax,dword ptr [esi]
 006AAD0E    call        THashTable.Add
 006AAD13    push        6AE314;'f'
 006AAD18    lea         edx,[ebp-338]
 006AAD1E    mov         eax,ebx
 006AAD20    call        IntToStr
 006AAD25    push        dword ptr [ebp-338]
 006AAD2B    push        6AE290;'sharp'
 006AAD30    push        6AEB10;'Aftertouch'
 006AAD35    lea         eax,[ebp-334]
 006AAD3B    mov         edx,4
 006AAD40    call        @UStrCatN
 006AAD45    mov         edx,dword ptr [ebp-334]
 006AAD4B    mov         ecx,ebx
 006AAD4D    add         ecx,ecx
 006AAD4F    add         ecx,ecx
 006AAD51    lea         ecx,[ecx+ecx*2]
 006AAD54    add         ecx,258
 006AAD5A    add         ecx,6
 006AAD5D    mov         eax,dword ptr [esi]
 006AAD5F    call        THashTable.Add
 006AAD64    push        6AE358;'g'
 006AAD69    lea         edx,[ebp-340]
 006AAD6F    mov         eax,ebx
 006AAD71    call        IntToStr
 006AAD76    push        dword ptr [ebp-340]
 006AAD7C    push        6AE2B8;'flat'
 006AAD81    push        6AEB10;'Aftertouch'
 006AAD86    lea         eax,[ebp-33C]
 006AAD8C    mov         edx,4
 006AAD91    call        @UStrCatN
 006AAD96    mov         edx,dword ptr [ebp-33C]
 006AAD9C    mov         ecx,ebx
 006AAD9E    add         ecx,ecx
 006AADA0    add         ecx,ecx
 006AADA2    lea         ecx,[ecx+ecx*2]
 006AADA5    add         ecx,258
 006AADAB    add         ecx,6
 006AADAE    mov         eax,dword ptr [esi]
 006AADB0    call        THashTable.Add
 006AADB5    push        6AE358;'g'
 006AADBA    lea         edx,[ebp-348]
 006AADC0    mov         eax,ebx
 006AADC2    call        IntToStr
 006AADC7    push        dword ptr [ebp-348]
 006AADCD    push        6AEB10;'Aftertouch'
 006AADD2    lea         eax,[ebp-344]
 006AADD8    mov         edx,3
 006AADDD    call        @UStrCatN
 006AADE2    mov         edx,dword ptr [ebp-344]
 006AADE8    mov         ecx,ebx
 006AADEA    add         ecx,ecx
 006AADEC    add         ecx,ecx
 006AADEE    lea         ecx,[ecx+ecx*2]
 006AADF1    add         ecx,258
 006AADF7    add         ecx,7
 006AADFA    mov         eax,dword ptr [esi]
 006AADFC    call        THashTable.Add
 006AAE01    push        6AE368;'gsharp'
 006AAE06    lea         edx,[ebp-350]
 006AAE0C    mov         eax,ebx
 006AAE0E    call        IntToStr
 006AAE13    push        dword ptr [ebp-350]
 006AAE19    push        6AEB10;'Aftertouch'
 006AAE1E    lea         eax,[ebp-34C]
 006AAE24    mov         edx,3
 006AAE29    call        @UStrCatN
 006AAE2E    mov         edx,dword ptr [ebp-34C]
 006AAE34    mov         ecx,ebx
 006AAE36    add         ecx,ecx
 006AAE38    add         ecx,ecx
 006AAE3A    lea         ecx,[ecx+ecx*2]
 006AAE3D    add         ecx,258
 006AAE43    add         ecx,8
 006AAE46    mov         eax,dword ptr [esi]
 006AAE48    call        THashTable.Add
 006AAE4D    push        6AE384;'aflat'
 006AAE52    lea         edx,[ebp-358]
 006AAE58    mov         eax,ebx
 006AAE5A    call        IntToStr
 006AAE5F    push        dword ptr [ebp-358]
 006AAE65    push        6AEB10;'Aftertouch'
 006AAE6A    lea         eax,[ebp-354]
 006AAE70    mov         edx,3
 006AAE75    call        @UStrCatN
 006AAE7A    mov         edx,dword ptr [ebp-354]
 006AAE80    mov         ecx,ebx
 006AAE82    add         ecx,ecx
 006AAE84    add         ecx,ecx
 006AAE86    lea         ecx,[ecx+ecx*2]
 006AAE89    add         ecx,258
 006AAE8F    add         ecx,8
 006AAE92    mov         eax,dword ptr [esi]
 006AAE94    call        THashTable.Add
 006AAE99    push        6AE358;'g'
 006AAE9E    lea         edx,[ebp-360]
 006AAEA4    mov         eax,ebx
 006AAEA6    call        IntToStr
 006AAEAB    push        dword ptr [ebp-360]
 006AAEB1    push        6AE290;'sharp'
 006AAEB6    push        6AEB10;'Aftertouch'
 006AAEBB    lea         eax,[ebp-35C]
 006AAEC1    mov         edx,4
 006AAEC6    call        @UStrCatN
 006AAECB    mov         edx,dword ptr [ebp-35C]
 006AAED1    mov         ecx,ebx
 006AAED3    add         ecx,ecx
 006AAED5    add         ecx,ecx
 006AAED7    lea         ecx,[ecx+ecx*2]
 006AAEDA    add         ecx,258
 006AAEE0    add         ecx,8
 006AAEE3    mov         eax,dword ptr [esi]
 006AAEE5    call        THashTable.Add
 006AAEEA    push        6AE39C;'a'
 006AAEEF    lea         edx,[ebp-368]
 006AAEF5    mov         eax,ebx
 006AAEF7    call        IntToStr
 006AAEFC    push        dword ptr [ebp-368]
 006AAF02    push        6AE2B8;'flat'
 006AAF07    push        6AEB10;'Aftertouch'
 006AAF0C    lea         eax,[ebp-364]
 006AAF12    mov         edx,4
 006AAF17    call        @UStrCatN
 006AAF1C    mov         edx,dword ptr [ebp-364]
 006AAF22    mov         ecx,ebx
 006AAF24    add         ecx,ecx
 006AAF26    add         ecx,ecx
 006AAF28    lea         ecx,[ecx+ecx*2]
 006AAF2B    add         ecx,258
 006AAF31    add         ecx,8
 006AAF34    mov         eax,dword ptr [esi]
 006AAF36    call        THashTable.Add
 006AAF3B    push        6AE39C;'a'
 006AAF40    lea         edx,[ebp-370]
 006AAF46    mov         eax,ebx
 006AAF48    call        IntToStr
 006AAF4D    push        dword ptr [ebp-370]
 006AAF53    push        6AEB10;'Aftertouch'
 006AAF58    lea         eax,[ebp-36C]
 006AAF5E    mov         edx,3
 006AAF63    call        @UStrCatN
 006AAF68    mov         edx,dword ptr [ebp-36C]
 006AAF6E    mov         ecx,ebx
 006AAF70    add         ecx,ecx
 006AAF72    add         ecx,ecx
 006AAF74    lea         ecx,[ecx+ecx*2]
 006AAF77    add         ecx,258
 006AAF7D    add         ecx,9
 006AAF80    mov         eax,dword ptr [esi]
 006AAF82    call        THashTable.Add
 006AAF87    push        6AE3AC;'asharp'
 006AAF8C    lea         edx,[ebp-378]
 006AAF92    mov         eax,ebx
 006AAF94    call        IntToStr
 006AAF99    push        dword ptr [ebp-378]
 006AAF9F    push        6AEB10;'Aftertouch'
 006AAFA4    lea         eax,[ebp-374]
 006AAFAA    mov         edx,3
 006AAFAF    call        @UStrCatN
 006AAFB4    mov         edx,dword ptr [ebp-374]
 006AAFBA    mov         ecx,ebx
 006AAFBC    add         ecx,ecx
 006AAFBE    add         ecx,ecx
 006AAFC0    lea         ecx,[ecx+ecx*2]
 006AAFC3    add         ecx,258
 006AAFC9    add         ecx,0A
 006AAFCC    mov         eax,dword ptr [esi]
 006AAFCE    call        THashTable.Add
 006AAFD3    push        6AE3C8;'bflat'
 006AAFD8    lea         edx,[ebp-380]
 006AAFDE    mov         eax,ebx
 006AAFE0    call        IntToStr
 006AAFE5    push        dword ptr [ebp-380]
 006AAFEB    push        6AEB10;'Aftertouch'
 006AAFF0    lea         eax,[ebp-37C]
 006AAFF6    mov         edx,3
 006AAFFB    call        @UStrCatN
 006AB000    mov         edx,dword ptr [ebp-37C]
 006AB006    mov         ecx,ebx
 006AB008    add         ecx,ecx
 006AB00A    add         ecx,ecx
 006AB00C    lea         ecx,[ecx+ecx*2]
 006AB00F    add         ecx,258
 006AB015    add         ecx,0A
 006AB018    mov         eax,dword ptr [esi]
 006AB01A    call        THashTable.Add
 006AB01F    push        6AE39C;'a'
 006AB024    lea         edx,[ebp-388]
 006AB02A    mov         eax,ebx
 006AB02C    call        IntToStr
 006AB031    push        dword ptr [ebp-388]
 006AB037    push        6AE290;'sharp'
 006AB03C    push        6AEB10;'Aftertouch'
 006AB041    lea         eax,[ebp-384]
 006AB047    mov         edx,4
 006AB04C    call        @UStrCatN
 006AB051    mov         edx,dword ptr [ebp-384]
 006AB057    mov         ecx,ebx
 006AB059    add         ecx,ecx
 006AB05B    add         ecx,ecx
 006AB05D    lea         ecx,[ecx+ecx*2]
 006AB060    add         ecx,258
 006AB066    add         ecx,0A
 006AB069    mov         eax,dword ptr [esi]
 006AB06B    call        THashTable.Add
 006AB070    push        6AE3E0;'b'
 006AB075    lea         edx,[ebp-390]
 006AB07B    mov         eax,ebx
 006AB07D    call        IntToStr
 006AB082    push        dword ptr [ebp-390]
 006AB088    push        6AE2B8;'flat'
 006AB08D    push        6AEB10;'Aftertouch'
 006AB092    lea         eax,[ebp-38C]
 006AB098    mov         edx,4
 006AB09D    call        @UStrCatN
 006AB0A2    mov         edx,dword ptr [ebp-38C]
 006AB0A8    mov         ecx,ebx
 006AB0AA    add         ecx,ecx
 006AB0AC    add         ecx,ecx
 006AB0AE    lea         ecx,[ecx+ecx*2]
 006AB0B1    add         ecx,258
 006AB0B7    add         ecx,0A
 006AB0BA    mov         eax,dword ptr [esi]
 006AB0BC    call        THashTable.Add
 006AB0C1    push        6AE3E0;'b'
 006AB0C6    lea         edx,[ebp-398]
 006AB0CC    mov         eax,ebx
 006AB0CE    call        IntToStr
 006AB0D3    push        dword ptr [ebp-398]
 006AB0D9    push        6AEB10;'Aftertouch'
 006AB0DE    lea         eax,[ebp-394]
 006AB0E4    mov         edx,3
 006AB0E9    call        @UStrCatN
 006AB0EE    mov         edx,dword ptr [ebp-394]
 006AB0F4    mov         ecx,ebx
 006AB0F6    add         ecx,ecx
 006AB0F8    add         ecx,ecx
 006AB0FA    lea         ecx,[ecx+ecx*2]
 006AB0FD    add         ecx,258
 006AB103    add         ecx,0B
 006AB106    mov         eax,dword ptr [esi]
 006AB108    call        THashTable.Add
 006AB10D    inc         ebx
 006AB10E    cmp         ebx,0A
>006AB111    jne         006AA907
 006AB117    mov         ebx,0A
 006AB11C    push        6AE24C;'c'
 006AB121    lea         edx,[ebp-3A0]
 006AB127    mov         eax,ebx
 006AB129    call        IntToStr
 006AB12E    push        dword ptr [ebp-3A0]
 006AB134    push        6AEB10;'Aftertouch'
 006AB139    lea         eax,[ebp-39C]
 006AB13F    mov         edx,3
 006AB144    call        @UStrCatN
 006AB149    mov         edx,dword ptr [ebp-39C]
 006AB14F    mov         edi,ebx
 006AB151    add         edi,edi
 006AB153    add         edi,edi
 006AB155    lea         edi,[edi+edi*2]
 006AB158    add         edi,258
 006AB15E    mov         ecx,edi
 006AB160    mov         eax,dword ptr [esi]
 006AB162    call        THashTable.Add
 006AB167    push        6AE25C;'csharp'
 006AB16C    lea         edx,[ebp-3A8]
 006AB172    mov         eax,ebx
 006AB174    call        IntToStr
 006AB179    push        dword ptr [ebp-3A8]
 006AB17F    push        6AEB10;'Aftertouch'
 006AB184    lea         eax,[ebp-3A4]
 006AB18A    mov         edx,3
 006AB18F    call        @UStrCatN
 006AB194    mov         edx,dword ptr [ebp-3A4]
 006AB19A    mov         ecx,edi
 006AB19C    inc         ecx
 006AB19D    mov         eax,dword ptr [esi]
 006AB19F    call        THashTable.Add
 006AB1A4    push        6AE278;'dflat'
 006AB1A9    lea         edx,[ebp-3B0]
 006AB1AF    mov         eax,ebx
 006AB1B1    call        IntToStr
 006AB1B6    push        dword ptr [ebp-3B0]
 006AB1BC    push        6AEB10;'Aftertouch'
 006AB1C1    lea         eax,[ebp-3AC]
 006AB1C7    mov         edx,3
 006AB1CC    call        @UStrCatN
 006AB1D1    mov         edx,dword ptr [ebp-3AC]
 006AB1D7    mov         ecx,ebx
 006AB1D9    add         ecx,ecx
 006AB1DB    add         ecx,ecx
 006AB1DD    lea         ecx,[ecx+ecx*2]
 006AB1E0    add         ecx,258
 006AB1E6    inc         ecx
 006AB1E7    mov         eax,dword ptr [esi]
 006AB1E9    call        THashTable.Add
 006AB1EE    push        6AE24C;'c'
 006AB1F3    lea         edx,[ebp-3B8]
 006AB1F9    mov         eax,ebx
 006AB1FB    call        IntToStr
 006AB200    push        dword ptr [ebp-3B8]
 006AB206    push        6AE290;'sharp'
 006AB20B    push        6AEB10;'Aftertouch'
 006AB210    lea         eax,[ebp-3B4]
 006AB216    mov         edx,4
 006AB21B    call        @UStrCatN
 006AB220    mov         edx,dword ptr [ebp-3B4]
 006AB226    mov         ecx,ebx
 006AB228    add         ecx,ecx
 006AB22A    add         ecx,ecx
 006AB22C    lea         ecx,[ecx+ecx*2]
 006AB22F    add         ecx,258
 006AB235    inc         ecx
 006AB236    mov         eax,dword ptr [esi]
 006AB238    call        THashTable.Add
 006AB23D    push        6AE2A8;'d'
 006AB242    lea         edx,[ebp-3C0]
 006AB248    mov         eax,ebx
 006AB24A    call        IntToStr
 006AB24F    push        dword ptr [ebp-3C0]
 006AB255    push        6AE2B8;'flat'
 006AB25A    push        6AEB10;'Aftertouch'
 006AB25F    lea         eax,[ebp-3BC]
 006AB265    mov         edx,4
 006AB26A    call        @UStrCatN
 006AB26F    mov         edx,dword ptr [ebp-3BC]
 006AB275    mov         ecx,ebx
 006AB277    add         ecx,ecx
 006AB279    add         ecx,ecx
 006AB27B    lea         ecx,[ecx+ecx*2]
 006AB27E    add         ecx,258
 006AB284    inc         ecx
 006AB285    mov         eax,dword ptr [esi]
 006AB287    call        THashTable.Add
 006AB28C    push        6AE2A8;'d'
 006AB291    lea         edx,[ebp-3C8]
 006AB297    mov         eax,ebx
 006AB299    call        IntToStr
 006AB29E    push        dword ptr [ebp-3C8]
 006AB2A4    push        6AEB10;'Aftertouch'
 006AB2A9    lea         eax,[ebp-3C4]
 006AB2AF    mov         edx,3
 006AB2B4    call        @UStrCatN
 006AB2B9    mov         edx,dword ptr [ebp-3C4]
 006AB2BF    mov         ecx,edi
 006AB2C1    add         ecx,2
 006AB2C4    mov         eax,dword ptr [esi]
 006AB2C6    call        THashTable.Add
 006AB2CB    push        6AE2D0;'dsharp'
 006AB2D0    lea         edx,[ebp-3D0]
 006AB2D6    mov         eax,ebx
 006AB2D8    call        IntToStr
 006AB2DD    push        dword ptr [ebp-3D0]
 006AB2E3    push        6AEB10;'Aftertouch'
 006AB2E8    lea         eax,[ebp-3CC]
 006AB2EE    mov         edx,3
 006AB2F3    call        @UStrCatN
 006AB2F8    mov         edx,dword ptr [ebp-3CC]
 006AB2FE    mov         ecx,edi
 006AB300    add         ecx,3
 006AB303    mov         eax,dword ptr [esi]
 006AB305    call        THashTable.Add
 006AB30A    push        6AE2EC;'eflat'
 006AB30F    lea         edx,[ebp-3D8]
 006AB315    mov         eax,ebx
 006AB317    call        IntToStr
 006AB31C    push        dword ptr [ebp-3D8]
 006AB322    push        6AEB10;'Aftertouch'
 006AB327    lea         eax,[ebp-3D4]
 006AB32D    mov         edx,3
 006AB332    call        @UStrCatN
 006AB337    mov         edx,dword ptr [ebp-3D4]
 006AB33D    mov         ecx,ebx
 006AB33F    add         ecx,ecx
 006AB341    add         ecx,ecx
 006AB343    lea         ecx,[ecx+ecx*2]
 006AB346    add         ecx,258
 006AB34C    add         ecx,3
 006AB34F    mov         eax,dword ptr [esi]
 006AB351    call        THashTable.Add
 006AB356    push        6AE2A8;'d'
 006AB35B    lea         edx,[ebp-3E0]
 006AB361    mov         eax,ebx
 006AB363    call        IntToStr
 006AB368    push        dword ptr [ebp-3E0]
 006AB36E    push        6AE290;'sharp'
 006AB373    push        6AEB10;'Aftertouch'
 006AB378    lea         eax,[ebp-3DC]
 006AB37E    mov         edx,4
 006AB383    call        @UStrCatN
 006AB388    mov         edx,dword ptr [ebp-3DC]
 006AB38E    mov         ecx,ebx
 006AB390    add         ecx,ecx
 006AB392    add         ecx,ecx
 006AB394    lea         ecx,[ecx+ecx*2]
 006AB397    add         ecx,258
 006AB39D    add         ecx,3
 006AB3A0    mov         eax,dword ptr [esi]
 006AB3A2    call        THashTable.Add
 006AB3A7    push        6AE304;'e'
 006AB3AC    lea         edx,[ebp-3E8]
 006AB3B2    mov         eax,ebx
 006AB3B4    call        IntToStr
 006AB3B9    push        dword ptr [ebp-3E8]
 006AB3BF    push        6AE2B8;'flat'
 006AB3C4    push        6AEB10;'Aftertouch'
 006AB3C9    lea         eax,[ebp-3E4]
 006AB3CF    mov         edx,4
 006AB3D4    call        @UStrCatN
 006AB3D9    mov         edx,dword ptr [ebp-3E4]
 006AB3DF    mov         ecx,ebx
 006AB3E1    add         ecx,ecx
 006AB3E3    add         ecx,ecx
 006AB3E5    lea         ecx,[ecx+ecx*2]
 006AB3E8    add         ecx,258
 006AB3EE    add         ecx,3
 006AB3F1    mov         eax,dword ptr [esi]
 006AB3F3    call        THashTable.Add
 006AB3F8    push        6AE304;'e'
 006AB3FD    lea         edx,[ebp-3F0]
 006AB403    mov         eax,ebx
 006AB405    call        IntToStr
 006AB40A    push        dword ptr [ebp-3F0]
 006AB410    push        6AEB10;'Aftertouch'
 006AB415    lea         eax,[ebp-3EC]
 006AB41B    mov         edx,3
 006AB420    call        @UStrCatN
 006AB425    mov         edx,dword ptr [ebp-3EC]
 006AB42B    mov         ecx,ebx
 006AB42D    add         ecx,ecx
 006AB42F    add         ecx,ecx
 006AB431    lea         ecx,[ecx+ecx*2]
 006AB434    add         ecx,258
 006AB43A    add         ecx,4
 006AB43D    mov         eax,dword ptr [esi]
 006AB43F    call        THashTable.Add
 006AB444    push        6AE314;'f'
 006AB449    lea         edx,[ebp-3F8]
 006AB44F    mov         eax,ebx
 006AB451    call        IntToStr
 006AB456    push        dword ptr [ebp-3F8]
 006AB45C    push        6AEB10;'Aftertouch'
 006AB461    lea         eax,[ebp-3F4]
 006AB467    mov         edx,3
 006AB46C    call        @UStrCatN
 006AB471    mov         edx,dword ptr [ebp-3F4]
 006AB477    mov         ecx,ebx
 006AB479    add         ecx,ecx
 006AB47B    add         ecx,ecx
 006AB47D    lea         ecx,[ecx+ecx*2]
 006AB480    add         ecx,258
 006AB486    add         ecx,5
 006AB489    mov         eax,dword ptr [esi]
 006AB48B    call        THashTable.Add
 006AB490    push        6AE324;'fsharp'
 006AB495    lea         edx,[ebp-400]
 006AB49B    mov         eax,ebx
 006AB49D    call        IntToStr
 006AB4A2    push        dword ptr [ebp-400]
 006AB4A8    push        6AEB10;'Aftertouch'
 006AB4AD    lea         eax,[ebp-3FC]
 006AB4B3    mov         edx,3
 006AB4B8    call        @UStrCatN
 006AB4BD    mov         edx,dword ptr [ebp-3FC]
 006AB4C3    mov         ecx,ebx
 006AB4C5    add         ecx,ecx
 006AB4C7    add         ecx,ecx
 006AB4C9    lea         ecx,[ecx+ecx*2]
 006AB4CC    add         ecx,258
 006AB4D2    add         ecx,6
 006AB4D5    mov         eax,dword ptr [esi]
 006AB4D7    call        THashTable.Add
 006AB4DC    push        6AE340;'gflat'
 006AB4E1    lea         edx,[ebp-408]
 006AB4E7    mov         eax,ebx
 006AB4E9    call        IntToStr
 006AB4EE    push        dword ptr [ebp-408]
 006AB4F4    push        6AEB10;'Aftertouch'
 006AB4F9    lea         eax,[ebp-404]
 006AB4FF    mov         edx,3
 006AB504    call        @UStrCatN
 006AB509    mov         edx,dword ptr [ebp-404]
 006AB50F    mov         ecx,ebx
 006AB511    add         ecx,ecx
 006AB513    add         ecx,ecx
 006AB515    lea         ecx,[ecx+ecx*2]
 006AB518    add         ecx,258
 006AB51E    add         ecx,6
 006AB521    mov         eax,dword ptr [esi]
 006AB523    call        THashTable.Add
 006AB528    push        6AE314;'f'
 006AB52D    lea         edx,[ebp-410]
 006AB533    mov         eax,ebx
 006AB535    call        IntToStr
 006AB53A    push        dword ptr [ebp-410]
 006AB540    push        6AE290;'sharp'
 006AB545    push        6AEB10;'Aftertouch'
 006AB54A    lea         eax,[ebp-40C]
 006AB550    mov         edx,4
 006AB555    call        @UStrCatN
 006AB55A    mov         edx,dword ptr [ebp-40C]
 006AB560    mov         ecx,ebx
 006AB562    add         ecx,ecx
 006AB564    add         ecx,ecx
 006AB566    lea         ecx,[ecx+ecx*2]
 006AB569    add         ecx,258
 006AB56F    add         ecx,6
 006AB572    mov         eax,dword ptr [esi]
 006AB574    call        THashTable.Add
 006AB579    push        6AE358;'g'
 006AB57E    lea         edx,[ebp-418]
 006AB584    mov         eax,ebx
 006AB586    call        IntToStr
 006AB58B    push        dword ptr [ebp-418]
 006AB591    push        6AE2B8;'flat'
 006AB596    push        6AEB10;'Aftertouch'
 006AB59B    lea         eax,[ebp-414]
 006AB5A1    mov         edx,4
 006AB5A6    call        @UStrCatN
 006AB5AB    mov         edx,dword ptr [ebp-414]
 006AB5B1    mov         ecx,ebx
 006AB5B3    add         ecx,ecx
 006AB5B5    add         ecx,ecx
 006AB5B7    lea         ecx,[ecx+ecx*2]
 006AB5BA    add         ecx,258
 006AB5C0    add         ecx,6
 006AB5C3    mov         eax,dword ptr [esi]
 006AB5C5    call        THashTable.Add
 006AB5CA    push        6AE358;'g'
 006AB5CF    lea         edx,[ebp-420]
 006AB5D5    mov         eax,ebx
 006AB5D7    call        IntToStr
 006AB5DC    push        dword ptr [ebp-420]
 006AB5E2    push        6AEB10;'Aftertouch'
 006AB5E7    lea         eax,[ebp-41C]
 006AB5ED    mov         edx,3
 006AB5F2    call        @UStrCatN
 006AB5F7    mov         edx,dword ptr [ebp-41C]
 006AB5FD    mov         ecx,ebx
 006AB5FF    add         ecx,ecx
 006AB601    add         ecx,ecx
 006AB603    lea         ecx,[ecx+ecx*2]
 006AB606    add         ecx,258
 006AB60C    add         ecx,7
 006AB60F    mov         eax,dword ptr [esi]
 006AB611    call        THashTable.Add
 006AB616    mov         ecx,294
 006AB61B    mov         edx,6AEB34;'MiddleCAftertouch'
 006AB620    mov         eax,dword ptr [esi]
 006AB622    call        THashTable.Add
 006AB627    mov         ecx,295
 006AB62C    mov         edx,6AEB64;'MiddleCSharpAftertouch'
 006AB631    mov         eax,dword ptr [esi]
 006AB633    call        THashTable.Add
 006AB638    mov         ecx,295
 006AB63D    mov         edx,6AEBA0;'MiddleDFlatAftertouch'
 006AB642    mov         eax,dword ptr [esi]
 006AB644    call        THashTable.Add
 006AB649    mov         ecx,295
 006AB64E    mov         edx,6AEB64;'MiddleCSharpAftertouch'
 006AB653    mov         eax,dword ptr [esi]
 006AB655    call        THashTable.Add
 006AB65A    mov         ecx,295
 006AB65F    mov         edx,6AEBA0;'MiddleDFlatAftertouch'
 006AB664    mov         eax,dword ptr [esi]
 006AB666    call        THashTable.Add
 006AB66B    mov         ecx,296
 006AB670    mov         edx,6AEBD8;'MiddleDAftertouch'
 006AB675    mov         eax,dword ptr [esi]
 006AB677    call        THashTable.Add
 006AB67C    mov         ecx,297
 006AB681    mov         edx,6AEC08;'MiddleDSharpAftertouch'
 006AB686    mov         eax,dword ptr [esi]
 006AB688    call        THashTable.Add
 006AB68D    mov         ecx,297
 006AB692    mov         edx,6AEC44;'MiddleEFlatAftertouch'
 006AB697    mov         eax,dword ptr [esi]
 006AB699    call        THashTable.Add
 006AB69E    mov         ecx,297
 006AB6A3    mov         edx,6AEC08;'MiddleDSharpAftertouch'
 006AB6A8    mov         eax,dword ptr [esi]
 006AB6AA    call        THashTable.Add
 006AB6AF    mov         ecx,297
 006AB6B4    mov         edx,6AEC44;'MiddleEFlatAftertouch'
 006AB6B9    mov         eax,dword ptr [esi]
 006AB6BB    call        THashTable.Add
 006AB6C0    mov         ecx,298
 006AB6C5    mov         edx,6AEC7C;'MiddleEAftertouch'
 006AB6CA    mov         eax,dword ptr [esi]
 006AB6CC    call        THashTable.Add
 006AB6D1    mov         ecx,299
 006AB6D6    mov         edx,6AECAC;'MiddleFAftertouch'
 006AB6DB    mov         eax,dword ptr [esi]
 006AB6DD    call        THashTable.Add
 006AB6E2    mov         ecx,29A
 006AB6E7    mov         edx,6AECDC;'MiddleFsharpAftertouch'
 006AB6EC    mov         eax,dword ptr [esi]
 006AB6EE    call        THashTable.Add
 006AB6F3    mov         ecx,29A
 006AB6F8    mov         edx,6AED18;'MiddleGflatAftertouch'
 006AB6FD    mov         eax,dword ptr [esi]
 006AB6FF    call        THashTable.Add
 006AB704    mov         ecx,29A
 006AB709    mov         edx,6AED50;'MiddleFSharpAftertouch'
 006AB70E    mov         eax,dword ptr [esi]
 006AB710    call        THashTable.Add
 006AB715    mov         ecx,29A
 006AB71A    mov         edx,6AED8C;'MiddleGFlatAftertouch'
 006AB71F    mov         eax,dword ptr [esi]
 006AB721    call        THashTable.Add
 006AB726    mov         ecx,29B
 006AB72B    mov         edx,6AEDC4;'MiddleGAftertouch'
 006AB730    mov         eax,dword ptr [esi]
 006AB732    call        THashTable.Add
 006AB737    mov         ecx,29C
 006AB73C    mov         edx,6AEDF4;'MiddleGsharpAftertouch'
 006AB741    mov         eax,dword ptr [esi]
 006AB743    call        THashTable.Add
 006AB748    mov         ecx,29C
 006AB74D    mov         edx,6AEE30;'MiddleAflatAftertouch'
 006AB752    mov         eax,dword ptr [esi]
 006AB754    call        THashTable.Add
 006AB759    mov         ecx,29C
 006AB75E    mov         edx,6AEE68;'MiddleGSharpAftertouch'
 006AB763    mov         eax,dword ptr [esi]
 006AB765    call        THashTable.Add
 006AB76A    mov         ecx,29C
 006AB76F    mov         edx,6AEEA4;'MiddleAFlatAftertouch'
 006AB774    mov         eax,dword ptr [esi]
 006AB776    call        THashTable.Add
 006AB77B    mov         ecx,29D
 006AB780    mov         edx,6AEEDC;'MiddleAAftertouch'
 006AB785    mov         eax,dword ptr [esi]
 006AB787    call        THashTable.Add
 006AB78C    mov         ecx,29E
 006AB791    mov         edx,6AEF0C;'MiddleASharpAftertouch'
 006AB796    mov         eax,dword ptr [esi]
 006AB798    call        THashTable.Add
 006AB79D    mov         ecx,29E
 006AB7A2    mov         edx,6AEF48;'MiddleBFlatAftertouch'
 006AB7A7    mov         eax,dword ptr [esi]
 006AB7A9    call        THashTable.Add
 006AB7AE    mov         ecx,29E
 006AB7B3    mov         edx,6AEF0C;'MiddleASharpAftertouch'
 006AB7B8    mov         eax,dword ptr [esi]
 006AB7BA    call        THashTable.Add
 006AB7BF    mov         ecx,29E
 006AB7C4    mov         edx,6AEF48;'MiddleBFlatAftertouch'
 006AB7C9    mov         eax,dword ptr [esi]
 006AB7CB    call        THashTable.Add
 006AB7D0    mov         ecx,29F
 006AB7D5    mov         edx,6AEF80;'MiddleBAftertouch'
 006AB7DA    mov         eax,dword ptr [esi]
 006AB7DC    call        THashTable.Add
 006AB7E1    xor         ebx,ebx
 006AB7E3    push        6AE24C;'c'
 006AB7E8    lea         edx,[ebp-428]
 006AB7EE    mov         eax,ebx
 006AB7F0    call        IntToStr
 006AB7F5    push        dword ptr [ebp-428]
 006AB7FB    push        6AEFB0;'Pressure'
 006AB800    lea         eax,[ebp-424]
 006AB806    mov         edx,3
 006AB80B    call        @UStrCatN
 006AB810    mov         edx,dword ptr [ebp-424]
 006AB816    mov         edi,ebx
 006AB818    add         edi,edi
 006AB81A    add         edi,edi
 006AB81C    lea         edi,[edi+edi*2]
 006AB81F    add         edi,258
 006AB825    mov         ecx,edi
 006AB827    mov         eax,dword ptr [esi]
 006AB829    call        THashTable.Add
 006AB82E    push        6AE25C;'csharp'
 006AB833    lea         edx,[ebp-430]
 006AB839    mov         eax,ebx
 006AB83B    call        IntToStr
 006AB840    push        dword ptr [ebp-430]
 006AB846    push        6AEFB0;'Pressure'
 006AB84B    lea         eax,[ebp-42C]
 006AB851    mov         edx,3
 006AB856    call        @UStrCatN
 006AB85B    mov         edx,dword ptr [ebp-42C]
 006AB861    mov         ecx,edi
 006AB863    inc         ecx
 006AB864    mov         eax,dword ptr [esi]
 006AB866    call        THashTable.Add
 006AB86B    push        6AE278;'dflat'
 006AB870    lea         edx,[ebp-438]
 006AB876    mov         eax,ebx
 006AB878    call        IntToStr
 006AB87D    push        dword ptr [ebp-438]
 006AB883    push        6AEFB0;'Pressure'
 006AB888    lea         eax,[ebp-434]
 006AB88E    mov         edx,3
 006AB893    call        @UStrCatN
 006AB898    mov         edx,dword ptr [ebp-434]
 006AB89E    mov         ecx,ebx
 006AB8A0    add         ecx,ecx
 006AB8A2    add         ecx,ecx
 006AB8A4    lea         ecx,[ecx+ecx*2]
 006AB8A7    add         ecx,258
 006AB8AD    inc         ecx
 006AB8AE    mov         eax,dword ptr [esi]
 006AB8B0    call        THashTable.Add
 006AB8B5    push        6AE24C;'c'
 006AB8BA    lea         edx,[ebp-440]
 006AB8C0    mov         eax,ebx
 006AB8C2    call        IntToStr
 006AB8C7    push        dword ptr [ebp-440]
 006AB8CD    push        6AE290;'sharp'
 006AB8D2    push        6AEFB0;'Pressure'
 006AB8D7    lea         eax,[ebp-43C]
 006AB8DD    mov         edx,4
 006AB8E2    call        @UStrCatN
 006AB8E7    mov         edx,dword ptr [ebp-43C]
 006AB8ED    mov         ecx,ebx
 006AB8EF    add         ecx,ecx
 006AB8F1    add         ecx,ecx
 006AB8F3    lea         ecx,[ecx+ecx*2]
 006AB8F6    add         ecx,258
 006AB8FC    inc         ecx
 006AB8FD    mov         eax,dword ptr [esi]
 006AB8FF    call        THashTable.Add
 006AB904    push        6AE2A8;'d'
 006AB909    lea         edx,[ebp-448]
 006AB90F    mov         eax,ebx
 006AB911    call        IntToStr
 006AB916    push        dword ptr [ebp-448]
 006AB91C    push        6AE2B8;'flat'
 006AB921    push        6AEFB0;'Pressure'
 006AB926    lea         eax,[ebp-444]
 006AB92C    mov         edx,4
 006AB931    call        @UStrCatN
 006AB936    mov         edx,dword ptr [ebp-444]
 006AB93C    mov         ecx,ebx
 006AB93E    add         ecx,ecx
 006AB940    add         ecx,ecx
 006AB942    lea         ecx,[ecx+ecx*2]
 006AB945    add         ecx,258
 006AB94B    inc         ecx
 006AB94C    mov         eax,dword ptr [esi]
 006AB94E    call        THashTable.Add
 006AB953    push        6AE2A8;'d'
 006AB958    lea         edx,[ebp-450]
 006AB95E    mov         eax,ebx
 006AB960    call        IntToStr
 006AB965    push        dword ptr [ebp-450]
 006AB96B    push        6AEFB0;'Pressure'
 006AB970    lea         eax,[ebp-44C]
 006AB976    mov         edx,3
 006AB97B    call        @UStrCatN
 006AB980    mov         edx,dword ptr [ebp-44C]
 006AB986    mov         ecx,edi
 006AB988    add         ecx,2
 006AB98B    mov         eax,dword ptr [esi]
 006AB98D    call        THashTable.Add
 006AB992    push        6AE2D0;'dsharp'
 006AB997    lea         edx,[ebp-458]
 006AB99D    mov         eax,ebx
 006AB99F    call        IntToStr
 006AB9A4    push        dword ptr [ebp-458]
 006AB9AA    push        6AEFB0;'Pressure'
 006AB9AF    lea         eax,[ebp-454]
 006AB9B5    mov         edx,3
 006AB9BA    call        @UStrCatN
 006AB9BF    mov         edx,dword ptr [ebp-454]
 006AB9C5    mov         ecx,edi
 006AB9C7    add         ecx,3
 006AB9CA    mov         eax,dword ptr [esi]
 006AB9CC    call        THashTable.Add
 006AB9D1    push        6AE2EC;'eflat'
 006AB9D6    lea         edx,[ebp-460]
 006AB9DC    mov         eax,ebx
 006AB9DE    call        IntToStr
 006AB9E3    push        dword ptr [ebp-460]
 006AB9E9    push        6AEFB0;'Pressure'
 006AB9EE    lea         eax,[ebp-45C]
 006AB9F4    mov         edx,3
 006AB9F9    call        @UStrCatN
 006AB9FE    mov         edx,dword ptr [ebp-45C]
 006ABA04    mov         ecx,ebx
 006ABA06    add         ecx,ecx
 006ABA08    add         ecx,ecx
 006ABA0A    lea         ecx,[ecx+ecx*2]
 006ABA0D    add         ecx,258
 006ABA13    add         ecx,3
 006ABA16    mov         eax,dword ptr [esi]
 006ABA18    call        THashTable.Add
 006ABA1D    push        6AE2A8;'d'
 006ABA22    lea         edx,[ebp-468]
 006ABA28    mov         eax,ebx
 006ABA2A    call        IntToStr
 006ABA2F    push        dword ptr [ebp-468]
 006ABA35    push        6AE290;'sharp'
 006ABA3A    push        6AEFB0;'Pressure'
 006ABA3F    lea         eax,[ebp-464]
 006ABA45    mov         edx,4
 006ABA4A    call        @UStrCatN
 006ABA4F    mov         edx,dword ptr [ebp-464]
 006ABA55    mov         ecx,ebx
 006ABA57    add         ecx,ecx
 006ABA59    add         ecx,ecx
 006ABA5B    lea         ecx,[ecx+ecx*2]
 006ABA5E    add         ecx,258
 006ABA64    add         ecx,3
 006ABA67    mov         eax,dword ptr [esi]
 006ABA69    call        THashTable.Add
 006ABA6E    push        6AE304;'e'
 006ABA73    lea         edx,[ebp-470]
 006ABA79    mov         eax,ebx
 006ABA7B    call        IntToStr
 006ABA80    push        dword ptr [ebp-470]
 006ABA86    push        6AE2B8;'flat'
 006ABA8B    push        6AEFB0;'Pressure'
 006ABA90    lea         eax,[ebp-46C]
 006ABA96    mov         edx,4
 006ABA9B    call        @UStrCatN
 006ABAA0    mov         edx,dword ptr [ebp-46C]
 006ABAA6    mov         ecx,ebx
 006ABAA8    add         ecx,ecx
 006ABAAA    add         ecx,ecx
 006ABAAC    lea         ecx,[ecx+ecx*2]
 006ABAAF    add         ecx,258
 006ABAB5    add         ecx,3
 006ABAB8    mov         eax,dword ptr [esi]
 006ABABA    call        THashTable.Add
 006ABABF    push        6AE304;'e'
 006ABAC4    lea         edx,[ebp-478]
 006ABACA    mov         eax,ebx
 006ABACC    call        IntToStr
 006ABAD1    push        dword ptr [ebp-478]
 006ABAD7    push        6AEFB0;'Pressure'
 006ABADC    lea         eax,[ebp-474]
 006ABAE2    mov         edx,3
 006ABAE7    call        @UStrCatN
 006ABAEC    mov         edx,dword ptr [ebp-474]
 006ABAF2    mov         ecx,ebx
 006ABAF4    add         ecx,ecx
 006ABAF6    add         ecx,ecx
 006ABAF8    lea         ecx,[ecx+ecx*2]
 006ABAFB    add         ecx,258
 006ABB01    add         ecx,4
 006ABB04    mov         eax,dword ptr [esi]
 006ABB06    call        THashTable.Add
 006ABB0B    push        6AE314;'f'
 006ABB10    lea         edx,[ebp-480]
 006ABB16    mov         eax,ebx
 006ABB18    call        IntToStr
 006ABB1D    push        dword ptr [ebp-480]
 006ABB23    push        6AEFB0;'Pressure'
 006ABB28    lea         eax,[ebp-47C]
 006ABB2E    mov         edx,3
 006ABB33    call        @UStrCatN
 006ABB38    mov         edx,dword ptr [ebp-47C]
 006ABB3E    mov         ecx,ebx
 006ABB40    add         ecx,ecx
 006ABB42    add         ecx,ecx
 006ABB44    lea         ecx,[ecx+ecx*2]
 006ABB47    add         ecx,258
 006ABB4D    add         ecx,5
 006ABB50    mov         eax,dword ptr [esi]
 006ABB52    call        THashTable.Add
 006ABB57    push        6AE324;'fsharp'
 006ABB5C    lea         edx,[ebp-488]
 006ABB62    mov         eax,ebx
 006ABB64    call        IntToStr
 006ABB69    push        dword ptr [ebp-488]
 006ABB6F    push        6AEFB0;'Pressure'
 006ABB74    lea         eax,[ebp-484]
 006ABB7A    mov         edx,3
 006ABB7F    call        @UStrCatN
 006ABB84    mov         edx,dword ptr [ebp-484]
 006ABB8A    mov         ecx,ebx
 006ABB8C    add         ecx,ecx
 006ABB8E    add         ecx,ecx
 006ABB90    lea         ecx,[ecx+ecx*2]
 006ABB93    add         ecx,258
 006ABB99    add         ecx,6
 006ABB9C    mov         eax,dword ptr [esi]
 006ABB9E    call        THashTable.Add
 006ABBA3    push        6AE340;'gflat'
 006ABBA8    lea         edx,[ebp-490]
 006ABBAE    mov         eax,ebx
 006ABBB0    call        IntToStr
 006ABBB5    push        dword ptr [ebp-490]
 006ABBBB    push        6AEFB0;'Pressure'
 006ABBC0    lea         eax,[ebp-48C]
 006ABBC6    mov         edx,3
 006ABBCB    call        @UStrCatN
 006ABBD0    mov         edx,dword ptr [ebp-48C]
 006ABBD6    mov         ecx,ebx
 006ABBD8    add         ecx,ecx
 006ABBDA    add         ecx,ecx
 006ABBDC    lea         ecx,[ecx+ecx*2]
 006ABBDF    add         ecx,258
 006ABBE5    add         ecx,6
 006ABBE8    mov         eax,dword ptr [esi]
 006ABBEA    call        THashTable.Add
 006ABBEF    push        6AE314;'f'
 006ABBF4    lea         edx,[ebp-498]
 006ABBFA    mov         eax,ebx
 006ABBFC    call        IntToStr
 006ABC01    push        dword ptr [ebp-498]
 006ABC07    push        6AE290;'sharp'
 006ABC0C    push        6AEFB0;'Pressure'
 006ABC11    lea         eax,[ebp-494]
 006ABC17    mov         edx,4
 006ABC1C    call        @UStrCatN
 006ABC21    mov         edx,dword ptr [ebp-494]
 006ABC27    mov         ecx,ebx
 006ABC29    add         ecx,ecx
 006ABC2B    add         ecx,ecx
 006ABC2D    lea         ecx,[ecx+ecx*2]
 006ABC30    add         ecx,258
 006ABC36    add         ecx,6
 006ABC39    mov         eax,dword ptr [esi]
 006ABC3B    call        THashTable.Add
 006ABC40    push        6AE358;'g'
 006ABC45    lea         edx,[ebp-4A0]
 006ABC4B    mov         eax,ebx
 006ABC4D    call        IntToStr
 006ABC52    push        dword ptr [ebp-4A0]
 006ABC58    push        6AE2B8;'flat'
 006ABC5D    push        6AEFB0;'Pressure'
 006ABC62    lea         eax,[ebp-49C]
 006ABC68    mov         edx,4
 006ABC6D    call        @UStrCatN
 006ABC72    mov         edx,dword ptr [ebp-49C]
 006ABC78    mov         ecx,ebx
 006ABC7A    add         ecx,ecx
 006ABC7C    add         ecx,ecx
 006ABC7E    lea         ecx,[ecx+ecx*2]
 006ABC81    add         ecx,258
 006ABC87    add         ecx,6
 006ABC8A    mov         eax,dword ptr [esi]
 006ABC8C    call        THashTable.Add
 006ABC91    push        6AE358;'g'
 006ABC96    lea         edx,[ebp-4A8]
 006ABC9C    mov         eax,ebx
 006ABC9E    call        IntToStr
 006ABCA3    push        dword ptr [ebp-4A8]
 006ABCA9    push        6AEFB0;'Pressure'
 006ABCAE    lea         eax,[ebp-4A4]
 006ABCB4    mov         edx,3
 006ABCB9    call        @UStrCatN
 006ABCBE    mov         edx,dword ptr [ebp-4A4]
 006ABCC4    mov         ecx,ebx
 006ABCC6    add         ecx,ecx
 006ABCC8    add         ecx,ecx
 006ABCCA    lea         ecx,[ecx+ecx*2]
 006ABCCD    add         ecx,258
 006ABCD3    add         ecx,7
 006ABCD6    mov         eax,dword ptr [esi]
 006ABCD8    call        THashTable.Add
 006ABCDD    push        6AE368;'gsharp'
 006ABCE2    lea         edx,[ebp-4B0]
 006ABCE8    mov         eax,ebx
 006ABCEA    call        IntToStr
 006ABCEF    push        dword ptr [ebp-4B0]
 006ABCF5    push        6AEFB0;'Pressure'
 006ABCFA    lea         eax,[ebp-4AC]
 006ABD00    mov         edx,3
 006ABD05    call        @UStrCatN
 006ABD0A    mov         edx,dword ptr [ebp-4AC]
 006ABD10    mov         ecx,ebx
 006ABD12    add         ecx,ecx
 006ABD14    add         ecx,ecx
 006ABD16    lea         ecx,[ecx+ecx*2]
 006ABD19    add         ecx,258
 006ABD1F    add         ecx,8
 006ABD22    mov         eax,dword ptr [esi]
 006ABD24    call        THashTable.Add
 006ABD29    push        6AE384;'aflat'
 006ABD2E    lea         edx,[ebp-4B8]
 006ABD34    mov         eax,ebx
 006ABD36    call        IntToStr
 006ABD3B    push        dword ptr [ebp-4B8]
 006ABD41    push        6AEFB0;'Pressure'
 006ABD46    lea         eax,[ebp-4B4]
 006ABD4C    mov         edx,3
 006ABD51    call        @UStrCatN
 006ABD56    mov         edx,dword ptr [ebp-4B4]
 006ABD5C    mov         ecx,ebx
 006ABD5E    add         ecx,ecx
 006ABD60    add         ecx,ecx
 006ABD62    lea         ecx,[ecx+ecx*2]
 006ABD65    add         ecx,258
 006ABD6B    add         ecx,8
 006ABD6E    mov         eax,dword ptr [esi]
 006ABD70    call        THashTable.Add
 006ABD75    push        6AE358;'g'
 006ABD7A    lea         edx,[ebp-4C0]
 006ABD80    mov         eax,ebx
 006ABD82    call        IntToStr
 006ABD87    push        dword ptr [ebp-4C0]
 006ABD8D    push        6AE290;'sharp'
 006ABD92    push        6AEFB0;'Pressure'
 006ABD97    lea         eax,[ebp-4BC]
 006ABD9D    mov         edx,4
 006ABDA2    call        @UStrCatN
 006ABDA7    mov         edx,dword ptr [ebp-4BC]
 006ABDAD    mov         ecx,ebx
 006ABDAF    add         ecx,ecx
 006ABDB1    add         ecx,ecx
 006ABDB3    lea         ecx,[ecx+ecx*2]
 006ABDB6    add         ecx,258
 006ABDBC    add         ecx,8
 006ABDBF    mov         eax,dword ptr [esi]
 006ABDC1    call        THashTable.Add
 006ABDC6    push        6AE39C;'a'
 006ABDCB    lea         edx,[ebp-4C8]
 006ABDD1    mov         eax,ebx
 006ABDD3    call        IntToStr
 006ABDD8    push        dword ptr [ebp-4C8]
 006ABDDE    push        6AE2B8;'flat'
 006ABDE3    push        6AEFB0;'Pressure'
 006ABDE8    lea         eax,[ebp-4C4]
 006ABDEE    mov         edx,4
 006ABDF3    call        @UStrCatN
 006ABDF8    mov         edx,dword ptr [ebp-4C4]
 006ABDFE    mov         ecx,ebx
 006ABE00    add         ecx,ecx
 006ABE02    add         ecx,ecx
 006ABE04    lea         ecx,[ecx+ecx*2]
 006ABE07    add         ecx,258
 006ABE0D    add         ecx,8
 006ABE10    mov         eax,dword ptr [esi]
 006ABE12    call        THashTable.Add
 006ABE17    push        6AE39C;'a'
 006ABE1C    lea         edx,[ebp-4D0]
 006ABE22    mov         eax,ebx
 006ABE24    call        IntToStr
 006ABE29    push        dword ptr [ebp-4D0]
 006ABE2F    push        6AEFB0;'Pressure'
 006ABE34    lea         eax,[ebp-4CC]
 006ABE3A    mov         edx,3
 006ABE3F    call        @UStrCatN
 006ABE44    mov         edx,dword ptr [ebp-4CC]
 006ABE4A    mov         ecx,ebx
 006ABE4C    add         ecx,ecx
 006ABE4E    add         ecx,ecx
 006ABE50    lea         ecx,[ecx+ecx*2]
 006ABE53    add         ecx,258
 006ABE59    add         ecx,9
 006ABE5C    mov         eax,dword ptr [esi]
 006ABE5E    call        THashTable.Add
 006ABE63    push        6AE3AC;'asharp'
 006ABE68    lea         edx,[ebp-4D8]
 006ABE6E    mov         eax,ebx
 006ABE70    call        IntToStr
 006ABE75    push        dword ptr [ebp-4D8]
 006ABE7B    push        6AEFB0;'Pressure'
 006ABE80    lea         eax,[ebp-4D4]
 006ABE86    mov         edx,3
 006ABE8B    call        @UStrCatN
 006ABE90    mov         edx,dword ptr [ebp-4D4]
 006ABE96    mov         ecx,ebx
 006ABE98    add         ecx,ecx
 006ABE9A    add         ecx,ecx
 006ABE9C    lea         ecx,[ecx+ecx*2]
 006ABE9F    add         ecx,258
 006ABEA5    add         ecx,0A
 006ABEA8    mov         eax,dword ptr [esi]
 006ABEAA    call        THashTable.Add
 006ABEAF    push        6AE3C8;'bflat'
 006ABEB4    lea         edx,[ebp-4E0]
 006ABEBA    mov         eax,ebx
 006ABEBC    call        IntToStr
 006ABEC1    push        dword ptr [ebp-4E0]
 006ABEC7    push        6AEFB0;'Pressure'
 006ABECC    lea         eax,[ebp-4DC]
 006ABED2    mov         edx,3
 006ABED7    call        @UStrCatN
 006ABEDC    mov         edx,dword ptr [ebp-4DC]
 006ABEE2    mov         ecx,ebx
 006ABEE4    add         ecx,ecx
 006ABEE6    add         ecx,ecx
 006ABEE8    lea         ecx,[ecx+ecx*2]
 006ABEEB    add         ecx,258
 006ABEF1    add         ecx,0A
 006ABEF4    mov         eax,dword ptr [esi]
 006ABEF6    call        THashTable.Add
 006ABEFB    push        6AE39C;'a'
 006ABF00    lea         edx,[ebp-4E8]
 006ABF06    mov         eax,ebx
 006ABF08    call        IntToStr
 006ABF0D    push        dword ptr [ebp-4E8]
 006ABF13    push        6AE290;'sharp'
 006ABF18    push        6AEFB0;'Pressure'
 006ABF1D    lea         eax,[ebp-4E4]
 006ABF23    mov         edx,4
 006ABF28    call        @UStrCatN
 006ABF2D    mov         edx,dword ptr [ebp-4E4]
 006ABF33    mov         ecx,ebx
 006ABF35    add         ecx,ecx
 006ABF37    add         ecx,ecx
 006ABF39    lea         ecx,[ecx+ecx*2]
 006ABF3C    add         ecx,258
 006ABF42    add         ecx,0A
 006ABF45    mov         eax,dword ptr [esi]
 006ABF47    call        THashTable.Add
 006ABF4C    push        6AE3E0;'b'
 006ABF51    lea         edx,[ebp-4F0]
 006ABF57    mov         eax,ebx
 006ABF59    call        IntToStr
 006ABF5E    push        dword ptr [ebp-4F0]
 006ABF64    push        6AE2B8;'flat'
 006ABF69    push        6AEFB0;'Pressure'
 006ABF6E    lea         eax,[ebp-4EC]
 006ABF74    mov         edx,4
 006ABF79    call        @UStrCatN
 006ABF7E    mov         edx,dword ptr [ebp-4EC]
 006ABF84    mov         ecx,ebx
 006ABF86    add         ecx,ecx
 006ABF88    add         ecx,ecx
 006ABF8A    lea         ecx,[ecx+ecx*2]
 006ABF8D    add         ecx,258
 006ABF93    add         ecx,0A
 006ABF96    mov         eax,dword ptr [esi]
 006ABF98    call        THashTable.Add
 006ABF9D    push        6AE3E0;'b'
 006ABFA2    lea         edx,[ebp-4F8]
 006ABFA8    mov         eax,ebx
 006ABFAA    call        IntToStr
 006ABFAF    push        dword ptr [ebp-4F8]
 006ABFB5    push        6AEFB0;'Pressure'
 006ABFBA    lea         eax,[ebp-4F4]
 006ABFC0    mov         edx,3
 006ABFC5    call        @UStrCatN
 006ABFCA    mov         edx,dword ptr [ebp-4F4]
 006ABFD0    mov         ecx,ebx
 006ABFD2    add         ecx,ecx
 006ABFD4    add         ecx,ecx
 006ABFD6    lea         ecx,[ecx+ecx*2]
 006ABFD9    add         ecx,258
 006ABFDF    add         ecx,0B
 006ABFE2    mov         eax,dword ptr [esi]
 006ABFE4    call        THashTable.Add
 006ABFE9    inc         ebx
 006ABFEA    cmp         ebx,0A
>006ABFED    jne         006AB7E3
 006ABFF3    mov         ebx,0A
 006ABFF8    push        6AE24C;'c'
 006ABFFD    lea         edx,[ebp-500]
 006AC003    mov         eax,ebx
 006AC005    call        IntToStr
 006AC00A    push        dword ptr [ebp-500]
 006AC010    push        6AEFB0;'Pressure'
 006AC015    lea         eax,[ebp-4FC]
 006AC01B    mov         edx,3
 006AC020    call        @UStrCatN
 006AC025    mov         edx,dword ptr [ebp-4FC]
 006AC02B    mov         edi,ebx
 006AC02D    add         edi,edi
 006AC02F    add         edi,edi
 006AC031    lea         edi,[edi+edi*2]
 006AC034    add         edi,258
 006AC03A    mov         ecx,edi
 006AC03C    mov         eax,dword ptr [esi]
 006AC03E    call        THashTable.Add
 006AC043    push        6AE25C;'csharp'
 006AC048    lea         edx,[ebp-508]
 006AC04E    mov         eax,ebx
 006AC050    call        IntToStr
 006AC055    push        dword ptr [ebp-508]
 006AC05B    push        6AEFB0;'Pressure'
 006AC060    lea         eax,[ebp-504]
 006AC066    mov         edx,3
 006AC06B    call        @UStrCatN
 006AC070    mov         edx,dword ptr [ebp-504]
 006AC076    mov         ecx,edi
 006AC078    inc         ecx
 006AC079    mov         eax,dword ptr [esi]
 006AC07B    call        THashTable.Add
 006AC080    push        6AE278;'dflat'
 006AC085    lea         edx,[ebp-510]
 006AC08B    mov         eax,ebx
 006AC08D    call        IntToStr
 006AC092    push        dword ptr [ebp-510]
 006AC098    push        6AEFB0;'Pressure'
 006AC09D    lea         eax,[ebp-50C]
 006AC0A3    mov         edx,3
 006AC0A8    call        @UStrCatN
 006AC0AD    mov         edx,dword ptr [ebp-50C]
 006AC0B3    mov         ecx,ebx
 006AC0B5    add         ecx,ecx
 006AC0B7    add         ecx,ecx
 006AC0B9    lea         ecx,[ecx+ecx*2]
 006AC0BC    add         ecx,258
 006AC0C2    inc         ecx
 006AC0C3    mov         eax,dword ptr [esi]
 006AC0C5    call        THashTable.Add
 006AC0CA    push        6AE24C;'c'
 006AC0CF    lea         edx,[ebp-518]
 006AC0D5    mov         eax,ebx
 006AC0D7    call        IntToStr
 006AC0DC    push        dword ptr [ebp-518]
 006AC0E2    push        6AE290;'sharp'
 006AC0E7    push        6AEFB0;'Pressure'
 006AC0EC    lea         eax,[ebp-514]
 006AC0F2    mov         edx,4
 006AC0F7    call        @UStrCatN
 006AC0FC    mov         edx,dword ptr [ebp-514]
 006AC102    mov         ecx,ebx
 006AC104    add         ecx,ecx
 006AC106    add         ecx,ecx
 006AC108    lea         ecx,[ecx+ecx*2]
 006AC10B    add         ecx,258
 006AC111    inc         ecx
 006AC112    mov         eax,dword ptr [esi]
 006AC114    call        THashTable.Add
 006AC119    push        6AE2A8;'d'
 006AC11E    lea         edx,[ebp-520]
 006AC124    mov         eax,ebx
 006AC126    call        IntToStr
 006AC12B    push        dword ptr [ebp-520]
 006AC131    push        6AE2B8;'flat'
 006AC136    push        6AEFB0;'Pressure'
 006AC13B    lea         eax,[ebp-51C]
 006AC141    mov         edx,4
 006AC146    call        @UStrCatN
 006AC14B    mov         edx,dword ptr [ebp-51C]
 006AC151    mov         ecx,ebx
 006AC153    add         ecx,ecx
 006AC155    add         ecx,ecx
 006AC157    lea         ecx,[ecx+ecx*2]
 006AC15A    add         ecx,258
 006AC160    inc         ecx
 006AC161    mov         eax,dword ptr [esi]
 006AC163    call        THashTable.Add
 006AC168    push        6AE2A8;'d'
 006AC16D    lea         edx,[ebp-528]
 006AC173    mov         eax,ebx
 006AC175    call        IntToStr
 006AC17A    push        dword ptr [ebp-528]
 006AC180    push        6AEFB0;'Pressure'
 006AC185    lea         eax,[ebp-524]
 006AC18B    mov         edx,3
 006AC190    call        @UStrCatN
 006AC195    mov         edx,dword ptr [ebp-524]
 006AC19B    mov         ecx,edi
 006AC19D    add         ecx,2
 006AC1A0    mov         eax,dword ptr [esi]
 006AC1A2    call        THashTable.Add
 006AC1A7    push        6AE2D0;'dsharp'
 006AC1AC    lea         edx,[ebp-530]
 006AC1B2    mov         eax,ebx
 006AC1B4    call        IntToStr
 006AC1B9    push        dword ptr [ebp-530]
 006AC1BF    push        6AEFB0;'Pressure'
 006AC1C4    lea         eax,[ebp-52C]
 006AC1CA    mov         edx,3
 006AC1CF    call        @UStrCatN
 006AC1D4    mov         edx,dword ptr [ebp-52C]
 006AC1DA    mov         ecx,edi
 006AC1DC    add         ecx,3
 006AC1DF    mov         eax,dword ptr [esi]
 006AC1E1    call        THashTable.Add
 006AC1E6    push        6AE2EC;'eflat'
 006AC1EB    lea         edx,[ebp-538]
 006AC1F1    mov         eax,ebx
 006AC1F3    call        IntToStr
 006AC1F8    push        dword ptr [ebp-538]
 006AC1FE    push        6AEFB0;'Pressure'
 006AC203    lea         eax,[ebp-534]
 006AC209    mov         edx,3
 006AC20E    call        @UStrCatN
 006AC213    mov         edx,dword ptr [ebp-534]
 006AC219    mov         ecx,ebx
 006AC21B    add         ecx,ecx
 006AC21D    add         ecx,ecx
 006AC21F    lea         ecx,[ecx+ecx*2]
 006AC222    add         ecx,258
 006AC228    add         ecx,3
 006AC22B    mov         eax,dword ptr [esi]
 006AC22D    call        THashTable.Add
 006AC232    push        6AE2A8;'d'
 006AC237    lea         edx,[ebp-540]
 006AC23D    mov         eax,ebx
 006AC23F    call        IntToStr
 006AC244    push        dword ptr [ebp-540]
 006AC24A    push        6AE290;'sharp'
 006AC24F    push        6AEFB0;'Pressure'
 006AC254    lea         eax,[ebp-53C]
 006AC25A    mov         edx,4
 006AC25F    call        @UStrCatN
 006AC264    mov         edx,dword ptr [ebp-53C]
 006AC26A    mov         ecx,ebx
 006AC26C    add         ecx,ecx
 006AC26E    add         ecx,ecx
 006AC270    lea         ecx,[ecx+ecx*2]
 006AC273    add         ecx,258
 006AC279    add         ecx,3
 006AC27C    mov         eax,dword ptr [esi]
 006AC27E    call        THashTable.Add
 006AC283    push        6AE304;'e'
 006AC288    lea         edx,[ebp-548]
 006AC28E    mov         eax,ebx
 006AC290    call        IntToStr
 006AC295    push        dword ptr [ebp-548]
 006AC29B    push        6AE2B8;'flat'
 006AC2A0    push        6AEFB0;'Pressure'
 006AC2A5    lea         eax,[ebp-544]
 006AC2AB    mov         edx,4
 006AC2B0    call        @UStrCatN
 006AC2B5    mov         edx,dword ptr [ebp-544]
 006AC2BB    mov         ecx,ebx
 006AC2BD    add         ecx,ecx
 006AC2BF    add         ecx,ecx
 006AC2C1    lea         ecx,[ecx+ecx*2]
 006AC2C4    add         ecx,258
 006AC2CA    add         ecx,3
 006AC2CD    mov         eax,dword ptr [esi]
 006AC2CF    call        THashTable.Add
 006AC2D4    push        6AE304;'e'
 006AC2D9    lea         edx,[ebp-550]
 006AC2DF    mov         eax,ebx
 006AC2E1    call        IntToStr
 006AC2E6    push        dword ptr [ebp-550]
 006AC2EC    push        6AEFB0;'Pressure'
 006AC2F1    lea         eax,[ebp-54C]
 006AC2F7    mov         edx,3
 006AC2FC    call        @UStrCatN
 006AC301    mov         edx,dword ptr [ebp-54C]
 006AC307    mov         ecx,ebx
 006AC309    add         ecx,ecx
 006AC30B    add         ecx,ecx
 006AC30D    lea         ecx,[ecx+ecx*2]
 006AC310    add         ecx,258
 006AC316    add         ecx,4
 006AC319    mov         eax,dword ptr [esi]
 006AC31B    call        THashTable.Add
 006AC320    push        6AE314;'f'
 006AC325    lea         edx,[ebp-558]
 006AC32B    mov         eax,ebx
 006AC32D    call        IntToStr
 006AC332    push        dword ptr [ebp-558]
 006AC338    push        6AEFB0;'Pressure'
 006AC33D    lea         eax,[ebp-554]
 006AC343    mov         edx,3
 006AC348    call        @UStrCatN
 006AC34D    mov         edx,dword ptr [ebp-554]
 006AC353    mov         ecx,ebx
 006AC355    add         ecx,ecx
 006AC357    add         ecx,ecx
 006AC359    lea         ecx,[ecx+ecx*2]
 006AC35C    add         ecx,258
 006AC362    add         ecx,5
 006AC365    mov         eax,dword ptr [esi]
 006AC367    call        THashTable.Add
 006AC36C    push        6AE324;'fsharp'
 006AC371    lea         edx,[ebp-560]
 006AC377    mov         eax,ebx
 006AC379    call        IntToStr
 006AC37E    push        dword ptr [ebp-560]
 006AC384    push        6AEFB0;'Pressure'
 006AC389    lea         eax,[ebp-55C]
 006AC38F    mov         edx,3
 006AC394    call        @UStrCatN
 006AC399    mov         edx,dword ptr [ebp-55C]
 006AC39F    mov         ecx,ebx
 006AC3A1    add         ecx,ecx
 006AC3A3    add         ecx,ecx
 006AC3A5    lea         ecx,[ecx+ecx*2]
 006AC3A8    add         ecx,258
 006AC3AE    add         ecx,6
 006AC3B1    mov         eax,dword ptr [esi]
 006AC3B3    call        THashTable.Add
 006AC3B8    push        6AE340;'gflat'
 006AC3BD    lea         edx,[ebp-568]
 006AC3C3    mov         eax,ebx
 006AC3C5    call        IntToStr
 006AC3CA    push        dword ptr [ebp-568]
 006AC3D0    push        6AEFB0;'Pressure'
 006AC3D5    lea         eax,[ebp-564]
 006AC3DB    mov         edx,3
 006AC3E0    call        @UStrCatN
 006AC3E5    mov         edx,dword ptr [ebp-564]
 006AC3EB    mov         ecx,ebx
 006AC3ED    add         ecx,ecx
 006AC3EF    add         ecx,ecx
 006AC3F1    lea         ecx,[ecx+ecx*2]
 006AC3F4    add         ecx,258
 006AC3FA    add         ecx,6
 006AC3FD    mov         eax,dword ptr [esi]
 006AC3FF    call        THashTable.Add
 006AC404    push        6AE314;'f'
 006AC409    lea         edx,[ebp-570]
 006AC40F    mov         eax,ebx
 006AC411    call        IntToStr
 006AC416    push        dword ptr [ebp-570]
 006AC41C    push        6AE290;'sharp'
 006AC421    push        6AEFB0;'Pressure'
 006AC426    lea         eax,[ebp-56C]
 006AC42C    mov         edx,4
 006AC431    call        @UStrCatN
 006AC436    mov         edx,dword ptr [ebp-56C]
 006AC43C    mov         ecx,ebx
 006AC43E    add         ecx,ecx
 006AC440    add         ecx,ecx
 006AC442    lea         ecx,[ecx+ecx*2]
 006AC445    add         ecx,258
 006AC44B    add         ecx,6
 006AC44E    mov         eax,dword ptr [esi]
 006AC450    call        THashTable.Add
 006AC455    push        6AE358;'g'
 006AC45A    lea         edx,[ebp-578]
 006AC460    mov         eax,ebx
 006AC462    call        IntToStr
 006AC467    push        dword ptr [ebp-578]
 006AC46D    push        6AE2B8;'flat'
 006AC472    push        6AEFB0;'Pressure'
 006AC477    lea         eax,[ebp-574]
 006AC47D    mov         edx,4
 006AC482    call        @UStrCatN
 006AC487    mov         edx,dword ptr [ebp-574]
 006AC48D    mov         ecx,ebx
 006AC48F    add         ecx,ecx
 006AC491    add         ecx,ecx
 006AC493    lea         ecx,[ecx+ecx*2]
 006AC496    add         ecx,258
 006AC49C    add         ecx,6
 006AC49F    mov         eax,dword ptr [esi]
 006AC4A1    call        THashTable.Add
 006AC4A6    push        6AE358;'g'
 006AC4AB    lea         edx,[ebp-580]
 006AC4B1    mov         eax,ebx
 006AC4B3    call        IntToStr
 006AC4B8    push        dword ptr [ebp-580]
 006AC4BE    push        6AEFB0;'Pressure'
 006AC4C3    lea         eax,[ebp-57C]
 006AC4C9    mov         edx,3
 006AC4CE    call        @UStrCatN
 006AC4D3    mov         edx,dword ptr [ebp-57C]
 006AC4D9    mov         ecx,ebx
 006AC4DB    add         ecx,ecx
 006AC4DD    add         ecx,ecx
 006AC4DF    lea         ecx,[ecx+ecx*2]
 006AC4E2    add         ecx,258
 006AC4E8    add         ecx,7
 006AC4EB    mov         eax,dword ptr [esi]
 006AC4ED    call        THashTable.Add
 006AC4F2    mov         ecx,294
 006AC4F7    mov         edx,6AEFD0;'MiddleCPressure'
 006AC4FC    mov         eax,dword ptr [esi]
 006AC4FE    call        THashTable.Add
 006AC503    mov         ecx,295
 006AC508    mov         edx,6AEFFC;'MiddleCSharpPressure'
 006AC50D    mov         eax,dword ptr [esi]
 006AC50F    call        THashTable.Add
 006AC514    mov         ecx,295
 006AC519    mov         edx,6AF034;'MiddleDFlatPressure'
 006AC51E    mov         eax,dword ptr [esi]
 006AC520    call        THashTable.Add
 006AC525    mov         ecx,295
 006AC52A    mov         edx,6AEFFC;'MiddleCSharpPressure'
 006AC52F    mov         eax,dword ptr [esi]
 006AC531    call        THashTable.Add
 006AC536    mov         ecx,295
 006AC53B    mov         edx,6AF034;'MiddleDFlatPressure'
 006AC540    mov         eax,dword ptr [esi]
 006AC542    call        THashTable.Add
 006AC547    mov         ecx,296
 006AC54C    mov         edx,6AF068;'MiddleDPressure'
 006AC551    mov         eax,dword ptr [esi]
 006AC553    call        THashTable.Add
 006AC558    mov         ecx,297
 006AC55D    mov         edx,6AF094;'MiddleDSharpPressure'
 006AC562    mov         eax,dword ptr [esi]
 006AC564    call        THashTable.Add
 006AC569    mov         ecx,297
 006AC56E    mov         edx,6AF0CC;'MiddleEFlatPressure'
 006AC573    mov         eax,dword ptr [esi]
 006AC575    call        THashTable.Add
 006AC57A    mov         ecx,297
 006AC57F    mov         edx,6AF094;'MiddleDSharpPressure'
 006AC584    mov         eax,dword ptr [esi]
 006AC586    call        THashTable.Add
 006AC58B    mov         ecx,297
 006AC590    mov         edx,6AF0CC;'MiddleEFlatPressure'
 006AC595    mov         eax,dword ptr [esi]
 006AC597    call        THashTable.Add
 006AC59C    mov         ecx,298
 006AC5A1    mov         edx,6AF100;'MiddleEPressure'
 006AC5A6    mov         eax,dword ptr [esi]
 006AC5A8    call        THashTable.Add
 006AC5AD    mov         ecx,299
 006AC5B2    mov         edx,6AF12C;'MiddleFPressure'
 006AC5B7    mov         eax,dword ptr [esi]
 006AC5B9    call        THashTable.Add
 006AC5BE    mov         ecx,29A
 006AC5C3    mov         edx,6AF158;'MiddleFsharpPressure'
 006AC5C8    mov         eax,dword ptr [esi]
 006AC5CA    call        THashTable.Add
 006AC5CF    mov         ecx,29A
 006AC5D4    mov         edx,6AF190;'MiddleGflatPressure'
 006AC5D9    mov         eax,dword ptr [esi]
 006AC5DB    call        THashTable.Add
 006AC5E0    mov         ecx,29A
 006AC5E5    mov         edx,6AF1C4;'MiddleFSharpPressure'
 006AC5EA    mov         eax,dword ptr [esi]
 006AC5EC    call        THashTable.Add
 006AC5F1    mov         ecx,29A
 006AC5F6    mov         edx,6AF1FC;'MiddleGFlatPressure'
 006AC5FB    mov         eax,dword ptr [esi]
 006AC5FD    call        THashTable.Add
 006AC602    mov         ecx,29B
 006AC607    mov         edx,6AF230;'MiddleGPressure'
 006AC60C    mov         eax,dword ptr [esi]
 006AC60E    call        THashTable.Add
 006AC613    mov         ecx,29C
 006AC618    mov         edx,6AF25C;'MiddleGsharpPressure'
 006AC61D    mov         eax,dword ptr [esi]
 006AC61F    call        THashTable.Add
 006AC624    mov         ecx,29C
 006AC629    mov         edx,6AF294;'MiddleAflatPressure'
 006AC62E    mov         eax,dword ptr [esi]
 006AC630    call        THashTable.Add
 006AC635    mov         ecx,29C
 006AC63A    mov         edx,6AF2C8;'MiddleGSharpPressure'
 006AC63F    mov         eax,dword ptr [esi]
 006AC641    call        THashTable.Add
 006AC646    mov         ecx,29C
 006AC64B    mov         edx,6AF300;'MiddleAFlatPressure'
 006AC650    mov         eax,dword ptr [esi]
 006AC652    call        THashTable.Add
 006AC657    mov         ecx,29D
 006AC65C    mov         edx,6AF334;'MiddleAPressure'
 006AC661    mov         eax,dword ptr [esi]
 006AC663    call        THashTable.Add
 006AC668    mov         ecx,29E
 006AC66D    mov         edx,6AF360;'MiddleASharpPressure'
 006AC672    mov         eax,dword ptr [esi]
 006AC674    call        THashTable.Add
 006AC679    mov         ecx,29E
 006AC67E    mov         edx,6AF398;'MiddleBFlatPressure'
 006AC683    mov         eax,dword ptr [esi]
 006AC685    call        THashTable.Add
 006AC68A    mov         ecx,29E
 006AC68F    mov         edx,6AF360;'MiddleASharpPressure'
 006AC694    mov         eax,dword ptr [esi]
 006AC696    call        THashTable.Add
 006AC69B    mov         ecx,29E
 006AC6A0    mov         edx,6AF398;'MiddleBFlatPressure'
 006AC6A5    mov         eax,dword ptr [esi]
 006AC6A7    call        THashTable.Add
 006AC6AC    mov         ecx,29F
 006AC6B1    mov         edx,6AF3CC;'MiddleBPressure'
 006AC6B6    mov         eax,dword ptr [esi]
 006AC6B8    call        THashTable.Add
 006AC6BD    mov         ecx,80
 006AC6C2    mov         edx,6AF3F8;'BankSelectLevel'
 006AC6C7    mov         eax,dword ptr [esi]
 006AC6C9    call        THashTable.Add
 006AC6CE    mov         ecx,81
 006AC6D3    mov         edx,6AF424;'ModWheel'
 006AC6D8    mov         eax,dword ptr [esi]
 006AC6DA    call        THashTable.Add
 006AC6DF    mov         ecx,81
 006AC6E4    mov         edx,6AF444;'ModulationWheel'
 006AC6E9    mov         eax,dword ptr [esi]
 006AC6EB    call        THashTable.Add
 006AC6F0    mov         ecx,82
 006AC6F5    mov         edx,6AF470;'Breath'
 006AC6FA    mov         eax,dword ptr [esi]
 006AC6FC    call        THashTable.Add
 006AC701    mov         ecx,82
 006AC706    mov         edx,6AF48C;'BreathControl'
 006AC70B    mov         eax,dword ptr [esi]
 006AC70D    call        THashTable.Add
 006AC712    mov         ecx,82
 006AC717    mov         edx,6AF4B4;'BreathController'
 006AC71C    mov         eax,dword ptr [esi]
 006AC71E    call        THashTable.Add
 006AC723    mov         ecx,84
 006AC728    mov         edx,6AF4E4;'FootPedal'
 006AC72D    mov         eax,dword ptr [esi]
 006AC72F    call        THashTable.Add
 006AC734    mov         ecx,85
 006AC739    mov         edx,6AF504;'PortamentoTime'
 006AC73E    mov         eax,dword ptr [esi]
 006AC740    call        THashTable.Add
 006AC745    mov         ecx,86
 006AC74A    mov         edx,6AF530;'DataEntry'
 006AC74F    mov         eax,dword ptr [esi]
 006AC751    call        THashTable.Add
 006AC756    mov         ecx,87
 006AC75B    mov         edx,6AF550;'Volume'
 006AC760    mov         eax,dword ptr [esi]
 006AC762    call        THashTable.Add
 006AC767    mov         ecx,88
 006AC76C    mov         edx,6AF56C;'Balance'
 006AC771    mov         eax,dword ptr [esi]
 006AC773    call        THashTable.Add
 006AC778    mov         ecx,8A
 006AC77D    mov         edx,6AF588;'PanPosition'
 006AC782    mov         eax,dword ptr [esi]
 006AC784    call        THashTable.Add
 006AC789    mov         ecx,8B
 006AC78E    mov         edx,6AF5AC;'Expression'
 006AC793    mov         eax,dword ptr [esi]
 006AC795    call        THashTable.Add
 006AC79A    mov         ecx,8C
 006AC79F    mov         edx,6AF5D0;'EffectControl1'
 006AC7A4    mov         eax,dword ptr [esi]
 006AC7A6    call        THashTable.Add
 006AC7AB    mov         ecx,8D
 006AC7B0    mov         edx,6AF5FC;'EffectControl2'
 006AC7B5    mov         eax,dword ptr [esi]
 006AC7B7    call        THashTable.Add
 006AC7BC    mov         ecx,90
 006AC7C1    mov         edx,6AF628;'Slider1'
 006AC7C6    mov         eax,dword ptr [esi]
 006AC7C8    call        THashTable.Add
 006AC7CD    mov         ecx,91
 006AC7D2    mov         edx,6AF644;'Slider2'
 006AC7D7    mov         eax,dword ptr [esi]
 006AC7D9    call        THashTable.Add
 006AC7DE    mov         ecx,92
 006AC7E3    mov         edx,6AF660;'Slider3'
 006AC7E8    mov         eax,dword ptr [esi]
 006AC7EA    call        THashTable.Add
 006AC7EF    mov         ecx,93
 006AC7F4    mov         edx,6AF67C;'Slider4'
 006AC7F9    mov         eax,dword ptr [esi]
 006AC7FB    call        THashTable.Add
 006AC800    mov         ecx,40
 006AC805    mov         edx,6AF698;'HoldPedal'
 006AC80A    mov         eax,dword ptr [esi]
 006AC80C    call        THashTable.Add
 006AC811    mov         ecx,41
 006AC816    mov         edx,6AF6B8;'Portamento'
 006AC81B    mov         eax,dword ptr [esi]
 006AC81D    call        THashTable.Add
 006AC822    mov         ecx,42
 006AC827    mov         edx,6AF6DC;'SustenutoPedal'
 006AC82C    mov         eax,dword ptr [esi]
 006AC82E    call        THashTable.Add
 006AC833    mov         ecx,43
 006AC838    mov         edx,6AF708;'SoftPedal'
 006AC83D    mov         eax,dword ptr [esi]
 006AC83F    call        THashTable.Add
 006AC844    mov         ecx,44
 006AC849    mov         edx,6AF728;'LegatoPedal'
 006AC84E    mov         eax,dword ptr [esi]
 006AC850    call        THashTable.Add
 006AC855    mov         ecx,45
 006AC85A    mov         edx,6AF74C;'Hold2Pedal'
 006AC85F    mov         eax,dword ptr [esi]
 006AC861    call        THashTable.Add
 006AC866    mov         ecx,46
 006AC86B    mov         edx,6AF770;'SoundVariation'
 006AC870    mov         eax,dword ptr [esi]
 006AC872    call        THashTable.Add
 006AC877    mov         ecx,47
 006AC87C    mov         edx,6AF79C;'SoundTimbre'
 006AC881    mov         eax,dword ptr [esi]
 006AC883    call        THashTable.Add
 006AC888    mov         ecx,48
 006AC88D    mov         edx,6AF7C0;'SoundReleaseTime'
 006AC892    mov         eax,dword ptr [esi]
 006AC894    call        THashTable.Add
 006AC899    mov         ecx,49
 006AC89E    mov         edx,6AF7F0;'SoundAttackTime'
 006AC8A3    mov         eax,dword ptr [esi]
 006AC8A5    call        THashTable.Add
 006AC8AA    mov         ecx,4A
 006AC8AF    mov         edx,6AF81C;'SoundBrightness'
 006AC8B4    mov         eax,dword ptr [esi]
 006AC8B6    call        THashTable.Add
 006AC8BB    mov         ecx,4B
 006AC8C0    mov         edx,6AF848;'SoundControl6'
 006AC8C5    mov         eax,dword ptr [esi]
 006AC8C7    call        THashTable.Add
 006AC8CC    mov         ecx,4C
 006AC8D1    mov         edx,6AF870;'SoundControl7'
 006AC8D6    mov         eax,dword ptr [esi]
 006AC8D8    call        THashTable.Add
 006AC8DD    mov         ecx,4D
 006AC8E2    mov         edx,6AF898;'SoundControl8'
 006AC8E7    mov         eax,dword ptr [esi]
 006AC8E9    call        THashTable.Add
 006AC8EE    mov         ecx,4E
 006AC8F3    mov         edx,6AF8C0;'SoundControl9'
 006AC8F8    mov         eax,dword ptr [esi]
 006AC8FA    call        THashTable.Add
 006AC8FF    mov         ecx,4F
 006AC904    mov         edx,6AF8E8;'SoundControl10'
 006AC909    mov         eax,dword ptr [esi]
 006AC90B    call        THashTable.Add
 006AC910    mov         ecx,50
 006AC915    mov         edx,6AF914;'Button1'
 006AC91A    mov         eax,dword ptr [esi]
 006AC91C    call        THashTable.Add
 006AC921    mov         ecx,51
 006AC926    mov         edx,6AF930;'Button2'
 006AC92B    mov         eax,dword ptr [esi]
 006AC92D    call        THashTable.Add
 006AC932    mov         ecx,52
 006AC937    mov         edx,6AF94C;'Button3'
 006AC93C    mov         eax,dword ptr [esi]
 006AC93E    call        THashTable.Add
 006AC943    mov         ecx,53
 006AC948    mov         edx,6AF968;'Button4'
 006AC94D    mov         eax,dword ptr [esi]
 006AC94F    call        THashTable.Add
 006AC954    mov         ecx,5B
 006AC959    mov         edx,6AF984;'EffectsLevel'
 006AC95E    mov         eax,dword ptr [esi]
 006AC960    call        THashTable.Add
 006AC965    mov         ecx,5C
 006AC96A    mov         edx,6AF9AC;'TremuloLevel'
 006AC96F    mov         eax,dword ptr [esi]
 006AC971    call        THashTable.Add
 006AC976    mov         ecx,5D
 006AC97B    mov         edx,6AF9D4;'ChorusLevel'
 006AC980    mov         eax,dword ptr [esi]
 006AC982    call        THashTable.Add
 006AC987    mov         ecx,5E
 006AC98C    mov         edx,6AF9F8;'CelesteLevel'
 006AC991    mov         eax,dword ptr [esi]
 006AC993    call        THashTable.Add
 006AC998    mov         ecx,5F
 006AC99D    mov         edx,6AFA20;'PhaserLevel'
 006AC9A2    mov         eax,dword ptr [esi]
 006AC9A4    call        THashTable.Add
 006AC9A9    xor         ecx,ecx
 006AC9AB    mov         edx,6AFA44;'BankSelectLevelCoarse'
 006AC9B0    mov         eax,dword ptr [esi]
 006AC9B2    call        THashTable.Add
 006AC9B7    mov         ecx,1
 006AC9BC    mov         edx,6AFA7C;'ModWheelCoarse'
 006AC9C1    mov         eax,dword ptr [esi]
 006AC9C3    call        THashTable.Add
 006AC9C8    mov         ecx,1
 006AC9CD    mov         edx,6AFAA8;'ModulationWheelCoarse'
 006AC9D2    mov         eax,dword ptr [esi]
 006AC9D4    call        THashTable.Add
 006AC9D9    mov         ecx,2
 006AC9DE    mov         edx,6AFAE0;'BreathCoarse'
 006AC9E3    mov         eax,dword ptr [esi]
 006AC9E5    call        THashTable.Add
 006AC9EA    mov         ecx,2
 006AC9EF    mov         edx,6AFB08;'BreathControlCoarse'
 006AC9F4    mov         eax,dword ptr [esi]
 006AC9F6    call        THashTable.Add
 006AC9FB    mov         ecx,2
 006ACA00    mov         edx,6AFB3C;'BreathControllerCoarse'
 006ACA05    mov         eax,dword ptr [esi]
 006ACA07    call        THashTable.Add
 006ACA0C    mov         ecx,4
 006ACA11    mov         edx,6AFB78;'FootPedalCoarse'
 006ACA16    mov         eax,dword ptr [esi]
 006ACA18    call        THashTable.Add
 006ACA1D    mov         ecx,5
 006ACA22    mov         edx,6AFBA4;'PortamentoTimeCoarse'
 006ACA27    mov         eax,dword ptr [esi]
 006ACA29    call        THashTable.Add
 006ACA2E    mov         ecx,6
 006ACA33    mov         edx,6AFBDC;'DataEntryCoarse'
 006ACA38    mov         eax,dword ptr [esi]
 006ACA3A    call        THashTable.Add
 006ACA3F    mov         ecx,7
 006ACA44    mov         edx,6AFC08;'VolumeCoarse'
 006ACA49    mov         eax,dword ptr [esi]
 006ACA4B    call        THashTable.Add
 006ACA50    mov         ecx,8
 006ACA55    mov         edx,6AFC30;'BalanceCoarse'
 006ACA5A    mov         eax,dword ptr [esi]
 006ACA5C    call        THashTable.Add
 006ACA61    mov         ecx,0A
 006ACA66    mov         edx,6AFC58;'PanPositionCoarse'
 006ACA6B    mov         eax,dword ptr [esi]
 006ACA6D    call        THashTable.Add
 006ACA72    mov         ecx,0B
 006ACA77    mov         edx,6AFC88;'ExpressionCoarse'
 006ACA7C    mov         eax,dword ptr [esi]
 006ACA7E    call        THashTable.Add
 006ACA83    mov         ecx,0C
 006ACA88    mov         edx,6AFCB8;'EffectControl1Coarse'
 006ACA8D    mov         eax,dword ptr [esi]
 006ACA8F    call        THashTable.Add
 006ACA94    mov         ecx,0D
 006ACA99    mov         edx,6AFCF0;'EffectControl2Coarse'
 006ACA9E    mov         eax,dword ptr [esi]
 006ACAA0    call        THashTable.Add
 006ACAA5    mov         ecx,10
 006ACAAA    mov         edx,6AFD28;'Slider1Coarse'
 006ACAAF    mov         eax,dword ptr [esi]
 006ACAB1    call        THashTable.Add
 006ACAB6    mov         ecx,11
 006ACABB    mov         edx,6AFD50;'Slider2Coarse'
 006ACAC0    mov         eax,dword ptr [esi]
 006ACAC2    call        THashTable.Add
 006ACAC7    mov         ecx,12
 006ACACC    mov         edx,6AFD78;'Slider3Coarse'
 006ACAD1    mov         eax,dword ptr [esi]
 006ACAD3    call        THashTable.Add
 006ACAD8    mov         ecx,13
 006ACADD    mov         edx,6AFDA0;'Slider4Coarse'
 006ACAE2    mov         eax,dword ptr [esi]
 006ACAE4    call        THashTable.Add
 006ACAE9    xor         ecx,ecx
 006ACAEB    mov         edx,6AFDC8;'BankSelectLevelMSB'
 006ACAF0    mov         eax,dword ptr [esi]
 006ACAF2    call        THashTable.Add
 006ACAF7    mov         ecx,1
 006ACAFC    mov         edx,6AFDFC;'ModWheelMSB'
 006ACB01    mov         eax,dword ptr [esi]
 006ACB03    call        THashTable.Add
 006ACB08    mov         ecx,1
 006ACB0D    mov         edx,6AFE20;'ModulationWheelMSB'
 006ACB12    mov         eax,dword ptr [esi]
 006ACB14    call        THashTable.Add
 006ACB19    mov         ecx,2
 006ACB1E    mov         edx,6AFE54;'BreathMSB'
 006ACB23    mov         eax,dword ptr [esi]
 006ACB25    call        THashTable.Add
 006ACB2A    mov         ecx,2
 006ACB2F    mov         edx,6AFE74;'BreathControlMSB'
 006ACB34    mov         eax,dword ptr [esi]
 006ACB36    call        THashTable.Add
 006ACB3B    mov         ecx,2
 006ACB40    mov         edx,6AFEA4;'BreathControllerMSB'
 006ACB45    mov         eax,dword ptr [esi]
 006ACB47    call        THashTable.Add
 006ACB4C    mov         ecx,4
 006ACB51    mov         edx,6AFED8;'FootPedalMSB'
 006ACB56    mov         eax,dword ptr [esi]
 006ACB58    call        THashTable.Add
 006ACB5D    mov         ecx,5
 006ACB62    mov         edx,6AFF00;'PortamentoTimeMSB'
 006ACB67    mov         eax,dword ptr [esi]
 006ACB69    call        THashTable.Add
 006ACB6E    mov         ecx,6
 006ACB73    mov         edx,6AFF30;'DataEntryMSB'
 006ACB78    mov         eax,dword ptr [esi]
 006ACB7A    call        THashTable.Add
 006ACB7F    mov         ecx,7
 006ACB84    mov         edx,6AFF58;'VolumeMSB'
 006ACB89    mov         eax,dword ptr [esi]
 006ACB8B    call        THashTable.Add
 006ACB90    mov         ecx,8
 006ACB95    mov         edx,6AFF78;'BalanceMSB'
 006ACB9A    mov         eax,dword ptr [esi]
 006ACB9C    call        THashTable.Add
 006ACBA1    mov         ecx,0A
 006ACBA6    mov         edx,6AFF9C;'PanPositionMSB'
 006ACBAB    mov         eax,dword ptr [esi]
 006ACBAD    call        THashTable.Add
 006ACBB2    mov         ecx,0B
 006ACBB7    mov         edx,6AFFC8;'ExpressionMSB'
 006ACBBC    mov         eax,dword ptr [esi]
 006ACBBE    call        THashTable.Add
 006ACBC3    mov         ecx,0C
 006ACBC8    mov         edx,6AFFF0;'EffectControl1MSB'
 006ACBCD    mov         eax,dword ptr [esi]
 006ACBCF    call        THashTable.Add
 006ACBD4    mov         ecx,0D
 006ACBD9    mov         edx,6B0020;'EffectControl2MSB'
 006ACBDE    mov         eax,dword ptr [esi]
 006ACBE0    call        THashTable.Add
 006ACBE5    mov         ecx,10
 006ACBEA    mov         edx,6B0050;'Slider1MSB'
 006ACBEF    mov         eax,dword ptr [esi]
 006ACBF1    call        THashTable.Add
 006ACBF6    mov         ecx,11
 006ACBFB    mov         edx,6B0074;'Slider2MSB'
 006ACC00    mov         eax,dword ptr [esi]
 006ACC02    call        THashTable.Add
 006ACC07    mov         ecx,12
 006ACC0C    mov         edx,6B0098;'Slider3MSB'
 006ACC11    mov         eax,dword ptr [esi]
 006ACC13    call        THashTable.Add
 006ACC18    mov         ecx,13
 006ACC1D    mov         edx,6B00BC;'Slider4MSB'
 006ACC22    mov         eax,dword ptr [esi]
 006ACC24    call        THashTable.Add
 006ACC29    mov         ecx,20
 006ACC2E    mov         edx,6B00E0;'BankSelectLevelFine'
 006ACC33    mov         eax,dword ptr [esi]
 006ACC35    call        THashTable.Add
 006ACC3A    mov         ecx,21
 006ACC3F    mov         edx,6B0114;'ModWheelFine'
 006ACC44    mov         eax,dword ptr [esi]
 006ACC46    call        THashTable.Add
 006ACC4B    mov         ecx,21
 006ACC50    mov         edx,6B013C;'ModulationWheelFine'
 006ACC55    mov         eax,dword ptr [esi]
 006ACC57    call        THashTable.Add
 006ACC5C    mov         ecx,22
 006ACC61    mov         edx,6B0170;'BreathFine'
 006ACC66    mov         eax,dword ptr [esi]
 006ACC68    call        THashTable.Add
 006ACC6D    mov         ecx,22
 006ACC72    mov         edx,6B0194;'BreathControlFine'
 006ACC77    mov         eax,dword ptr [esi]
 006ACC79    call        THashTable.Add
 006ACC7E    mov         ecx,22
 006ACC83    mov         edx,6B01C4;'BreathControllerFine'
 006ACC88    mov         eax,dword ptr [esi]
 006ACC8A    call        THashTable.Add
 006ACC8F    mov         ecx,24
 006ACC94    mov         edx,6B01FC;'FootPedalFine'
 006ACC99    mov         eax,dword ptr [esi]
 006ACC9B    call        THashTable.Add
 006ACCA0    mov         ecx,25
 006ACCA5    mov         edx,6B0224;'PortamentoTimeFine'
 006ACCAA    mov         eax,dword ptr [esi]
 006ACCAC    call        THashTable.Add
 006ACCB1    mov         ecx,26
 006ACCB6    mov         edx,6B0258;'DataEntryFine'
 006ACCBB    mov         eax,dword ptr [esi]
 006ACCBD    call        THashTable.Add
 006ACCC2    mov         ecx,27
 006ACCC7    mov         edx,6B0280;'VolumeFine'
 006ACCCC    mov         eax,dword ptr [esi]
 006ACCCE    call        THashTable.Add
 006ACCD3    mov         ecx,28
 006ACCD8    mov         edx,6B02A4;'BalanceFine'
 006ACCDD    mov         eax,dword ptr [esi]
 006ACCDF    call        THashTable.Add
 006ACCE4    mov         ecx,2A
 006ACCE9    mov         edx,6B02C8;'PanPositionFine'
 006ACCEE    mov         eax,dword ptr [esi]
 006ACCF0    call        THashTable.Add
 006ACCF5    mov         ecx,2B
 006ACCFA    mov         edx,6B02F4;'ExpressionFine'
 006ACCFF    mov         eax,dword ptr [esi]
 006ACD01    call        THashTable.Add
 006ACD06    mov         ecx,2C
 006ACD0B    mov         edx,6B0320;'EffectControl1Fine'
 006ACD10    mov         eax,dword ptr [esi]
 006ACD12    call        THashTable.Add
 006ACD17    mov         ecx,2D
 006ACD1C    mov         edx,6B0354;'EffectControl2Fine'
 006ACD21    mov         eax,dword ptr [esi]
 006ACD23    call        THashTable.Add
 006ACD28    mov         ecx,30
 006ACD2D    mov         edx,6B0388;'Slider1Fine'
 006ACD32    mov         eax,dword ptr [esi]
 006ACD34    call        THashTable.Add
 006ACD39    mov         ecx,31
 006ACD3E    mov         edx,6B03AC;'Slider2Fine'
 006ACD43    mov         eax,dword ptr [esi]
 006ACD45    call        THashTable.Add
 006ACD4A    mov         ecx,32
 006ACD4F    mov         edx,6B03D0;'Slider3Fine'
 006ACD54    mov         eax,dword ptr [esi]
 006ACD56    call        THashTable.Add
 006ACD5B    mov         ecx,33
 006ACD60    mov         edx,6B03F4;'Slider4Fine'
 006ACD65    mov         eax,dword ptr [esi]
 006ACD67    call        THashTable.Add
 006ACD6C    mov         ecx,20
 006ACD71    mov         edx,6B0418;'BankSelectLevelLSB'
 006ACD76    mov         eax,dword ptr [esi]
 006ACD78    call        THashTable.Add
 006ACD7D    mov         ecx,21
 006ACD82    mov         edx,6B044C;'ModWheelLSB'
 006ACD87    mov         eax,dword ptr [esi]
 006ACD89    call        THashTable.Add
 006ACD8E    mov         ecx,21
 006ACD93    mov         edx,6B0470;'ModulationWheelLSB'
 006ACD98    mov         eax,dword ptr [esi]
 006ACD9A    call        THashTable.Add
 006ACD9F    mov         ecx,22
 006ACDA4    mov         edx,6B04A4;'BreathLSB'
 006ACDA9    mov         eax,dword ptr [esi]
 006ACDAB    call        THashTable.Add
 006ACDB0    mov         ecx,22
 006ACDB5    mov         edx,6B04C4;'BreathControlLSB'
 006ACDBA    mov         eax,dword ptr [esi]
 006ACDBC    call        THashTable.Add
 006ACDC1    mov         ecx,22
 006ACDC6    mov         edx,6B04F4;'BreathControllerLSB'
 006ACDCB    mov         eax,dword ptr [esi]
 006ACDCD    call        THashTable.Add
 006ACDD2    mov         ecx,24
 006ACDD7    mov         edx,6B0528;'FootPedalLSB'
 006ACDDC    mov         eax,dword ptr [esi]
 006ACDDE    call        THashTable.Add
 006ACDE3    mov         ecx,25
 006ACDE8    mov         edx,6B0550;'PortamentoTimeLSB'
 006ACDED    mov         eax,dword ptr [esi]
 006ACDEF    call        THashTable.Add
 006ACDF4    mov         ecx,26
 006ACDF9    mov         edx,6B0580;'DataEntryLSB'
 006ACDFE    mov         eax,dword ptr [esi]
 006ACE00    call        THashTable.Add
 006ACE05    mov         ecx,27
 006ACE0A    mov         edx,6B05A8;'VolumeLSB'
 006ACE0F    mov         eax,dword ptr [esi]
 006ACE11    call        THashTable.Add
 006ACE16    mov         ecx,28
 006ACE1B    mov         edx,6B05C8;'BalanceLSB'
 006ACE20    mov         eax,dword ptr [esi]
 006ACE22    call        THashTable.Add
 006ACE27    mov         ecx,2A
 006ACE2C    mov         edx,6B05EC;'PanPositionLSB'
 006ACE31    mov         eax,dword ptr [esi]
 006ACE33    call        THashTable.Add
 006ACE38    mov         ecx,2B
 006ACE3D    mov         edx,6B0618;'ExpressionLSB'
 006ACE42    mov         eax,dword ptr [esi]
 006ACE44    call        THashTable.Add
 006ACE49    mov         ecx,2C
 006ACE4E    mov         edx,6B0640;'EffectControl1LSB'
 006ACE53    mov         eax,dword ptr [esi]
 006ACE55    call        THashTable.Add
 006ACE5A    mov         ecx,2D
 006ACE5F    mov         edx,6B0670;'EffectControl2LSB'
 006ACE64    mov         eax,dword ptr [esi]
 006ACE66    call        THashTable.Add
 006ACE6B    mov         ecx,30
 006ACE70    mov         edx,6B06A0;'Slider1LSB'
 006ACE75    mov         eax,dword ptr [esi]
 006ACE77    call        THashTable.Add
 006ACE7C    mov         ecx,31
 006ACE81    mov         edx,6B06C4;'Slider2LSB'
 006ACE86    mov         eax,dword ptr [esi]
 006ACE88    call        THashTable.Add
 006ACE8D    mov         ecx,32
 006ACE92    mov         edx,6B06E8;'Slider3LSB'
 006ACE97    mov         eax,dword ptr [esi]
 006ACE99    call        THashTable.Add
 006ACE9E    mov         ecx,33
 006ACEA3    mov         edx,6B070C;'Slider4LSB'
 006ACEA8    mov         eax,dword ptr [esi]
 006ACEAA    call        THashTable.Add
 006ACEAF    mov         ecx,2DA
 006ACEB4    mov         edx,6B0730;'ChannelPressure'
 006ACEB9    mov         eax,dword ptr [esi]
 006ACEBB    call        THashTable.Add
 006ACEC0    mov         ecx,2DA
 006ACEC5    mov         edx,6B075C;'AveragePressure'
 006ACECA    mov         eax,dword ptr [esi]
 006ACECC    call        THashTable.Add
 006ACED1    mov         ecx,2DA
 006ACED6    mov         edx,6B0788;'TotalPressure'
 006ACEDB    mov         eax,dword ptr [esi]
 006ACEDD    call        THashTable.Add
 006ACEE2    mov         ecx,2DA
 006ACEE7    mov         edx,6B07B0;'ChannelAftertouch'
 006ACEEC    mov         eax,dword ptr [esi]
 006ACEEE    call        THashTable.Add
 006ACEF3    mov         ecx,2DA
 006ACEF8    mov         edx,6B07E0;'AverageAftertouch'
 006ACEFD    mov         eax,dword ptr [esi]
 006ACEFF    call        THashTable.Add
 006ACF04    mov         ecx,2DA
 006ACF09    mov         edx,6B0810;'TotalAftertouch'
 006ACF0E    mov         eax,dword ptr [esi]
 006ACF10    call        THashTable.Add
 006ACF15    mov         ecx,2DA
 006ACF1A    mov         edx,6AEFB0;'Pressure'
 006ACF1F    mov         eax,dword ptr [esi]
 006ACF21    call        THashTable.Add
 006ACF26    mov         ecx,2DB
 006ACF2B    mov         edx,6B083C;'Instrument'
 006ACF30    mov         eax,dword ptr [esi]
 006ACF32    call        THashTable.Add
 006ACF37    mov         ecx,2DD
 006ACF3C    mov         edx,6B0860;'Instrument0'
 006ACF41    mov         eax,dword ptr [esi]
 006ACF43    call        THashTable.Add
 006ACF48    mov         ecx,2DB
 006ACF4D    mov         edx,6B0884;'Instrument1'
 006ACF52    mov         eax,dword ptr [esi]
 006ACF54    call        THashTable.Add
 006ACF59    mov         ecx,2DB
 006ACF5E    mov         edx,6B08A8;'Program'
 006ACF63    mov         eax,dword ptr [esi]
 006ACF65    call        THashTable.Add
 006ACF6A    mov         ecx,2DB
 006ACF6F    mov         edx,6B08C4;'Programme'
 006ACF74    mov         eax,dword ptr [esi]
 006ACF76    call        THashTable.Add
 006ACF7B    mov         ecx,2DB
 006ACF80    mov         edx,6B08E4;'Patch'
 006ACF85    mov         eax,dword ptr [esi]
 006ACF87    call        THashTable.Add
 006ACF8C    mov         ecx,2DC
 006ACF91    mov         edx,6B08FC;'PitchWheel'
 006ACF96    mov         eax,dword ptr [esi]
 006ACF98    call        THashTable.Add
 006ACF9D    xor         ebx,ebx
 006ACF9F    lea         edx,[ebp-588]
 006ACFA5    mov         eax,ebx
 006ACFA7    call        IntToStr
 006ACFAC    mov         ecx,dword ptr [ebp-588]
 006ACFB2    lea         eax,[ebp-584]
 006ACFB8    mov         edx,6B0920;'ByteControl'
 006ACFBD    call        @UStrCat3
 006ACFC2    mov         edx,dword ptr [ebp-584]
 006ACFC8    lea         ecx,[ebx]
 006ACFCA    mov         eax,dword ptr [esi]
 006ACFCC    call        THashTable.Add
 006ACFD1    lea         edx,[ebp-590]
 006ACFD7    mov         eax,ebx
 006ACFD9    call        IntToStr
 006ACFDE    mov         ecx,dword ptr [ebp-590]
 006ACFE4    lea         eax,[ebp-58C]
 006ACFEA    mov         edx,6B0944;'cc'
 006ACFEF    call        @UStrCat3
 006ACFF4    mov         edx,dword ptr [ebp-58C]
 006ACFFA    lea         ecx,[ebx]
 006ACFFC    mov         eax,dword ptr [esi]
 006ACFFE    call        THashTable.Add
 006AD003    lea         edx,[ebp-598]
 006AD009    mov         eax,ebx
 006AD00B    call        IntToStr
 006AD010    mov         ecx,dword ptr [ebp-598]
 006AD016    lea         eax,[ebp-594]
 006AD01C    mov         edx,6B0958;'7BitControl'
 006AD021    call        @UStrCat3
 006AD026    mov         edx,dword ptr [ebp-594]
 006AD02C    lea         ecx,[ebx]
 006AD02E    mov         eax,dword ptr [esi]
 006AD030    call        THashTable.Add
 006AD035    lea         edx,[ebp-5A0]
 006AD03B    mov         eax,ebx
 006AD03D    call        IntToStr
 006AD042    mov         ecx,dword ptr [ebp-5A0]
 006AD048    lea         eax,[ebp-59C]
 006AD04E    mov         edx,6B097C;'Note'
 006AD053    call        @UStrCat3
 006AD058    mov         edx,dword ptr [ebp-59C]
 006AD05E    lea         ecx,[ebx+0A0]
 006AD064    mov         eax,dword ptr [esi]
 006AD066    call        THashTable.Add
 006AD06B    lea         edx,[ebp-5A8]
 006AD071    mov         eax,ebx
 006AD073    call        IntToStr
 006AD078    mov         ecx,dword ptr [ebp-5A8]
 006AD07E    lea         eax,[ebp-5A4]
 006AD084    mov         edx,6B0994;'NoteVelocity'
 006AD089    call        @UStrCat3
 006AD08E    mov         edx,dword ptr [ebp-5A4]
 006AD094    lea         ecx,[ebx+190]
 006AD09A    mov         eax,dword ptr [esi]
 006AD09C    call        THashTable.Add
 006AD0A1    lea         edx,[ebp-5B0]
 006AD0A7    mov         eax,ebx
 006AD0A9    call        IntToStr
 006AD0AE    mov         ecx,dword ptr [ebp-5B0]
 006AD0B4    lea         eax,[ebp-5AC]
 006AD0BA    mov         edx,6B09BC;'NoteAftertouch'
 006AD0BF    call        @UStrCat3
 006AD0C4    mov         edx,dword ptr [ebp-5AC]
 006AD0CA    lea         edi,[ebx+258]
 006AD0D0    mov         ecx,edi
 006AD0D2    mov         eax,dword ptr [esi]
 006AD0D4    call        THashTable.Add
 006AD0D9    lea         edx,[ebp-5B8]
 006AD0DF    mov         eax,ebx
 006AD0E1    call        IntToStr
 006AD0E6    mov         ecx,dword ptr [ebp-5B8]
 006AD0EC    lea         eax,[ebp-5B4]
 006AD0F2    mov         edx,6AEB10;'Aftertouch'
 006AD0F7    call        @UStrCat3
 006AD0FC    mov         edx,dword ptr [ebp-5B4]
 006AD102    mov         ecx,edi
 006AD104    mov         eax,dword ptr [esi]
 006AD106    call        THashTable.Add
 006AD10B    lea         edx,[ebp-5C0]
 006AD111    mov         eax,ebx
 006AD113    call        IntToStr
 006AD118    mov         ecx,dword ptr [ebp-5C0]
 006AD11E    lea         eax,[ebp-5BC]
 006AD124    mov         edx,6AEFB0;'Pressure'
 006AD129    call        @UStrCat3
 006AD12E    mov         edx,dword ptr [ebp-5BC]
 006AD134    mov         ecx,edi
 006AD136    mov         eax,dword ptr [esi]
 006AD138    call        THashTable.Add
 006AD13D    lea         edx,[ebp-5C8]
 006AD143    mov         eax,ebx
 006AD145    call        IntToStr
 006AD14A    mov         ecx,dword ptr [ebp-5C8]
 006AD150    lea         eax,[ebp-5C4]
 006AD156    mov         edx,6B09E8;'NotePressure'
 006AD15B    call        @UStrCat3
 006AD160    mov         edx,dword ptr [ebp-5C4]
 006AD166    mov         ecx,edi
 006AD168    mov         eax,dword ptr [esi]
 006AD16A    call        THashTable.Add
 006AD16F    cmp         ebx,1F
>006AD172    jle         006AD1A6
 006AD174    lea         edx,[ebp-5D0]
 006AD17A    mov         eax,ebx
 006AD17C    call        IntToStr
 006AD181    mov         ecx,dword ptr [ebp-5D0]
 006AD187    lea         eax,[ebp-5CC]
 006AD18D    mov         edx,6B0A10;'Control'
 006AD192    call        @UStrCat3
 006AD197    mov         edx,dword ptr [ebp-5CC]
 006AD19D    lea         ecx,[ebx]
 006AD19F    mov         eax,dword ptr [esi]
 006AD1A1    call        THashTable.Add
 006AD1A6    inc         ebx
 006AD1A7    cmp         ebx,80
>006AD1AD    jne         006ACF9F
 006AD1B3    xor         ebx,ebx
 006AD1B5    lea         edx,[ebp-5D8]
 006AD1BB    mov         eax,ebx
 006AD1BD    call        IntToStr
 006AD1C2    mov         ecx,dword ptr [ebp-5D8]
 006AD1C8    lea         eax,[ebp-5D4]
 006AD1CE    mov         edx,6B0A10;'Control'
 006AD1D3    call        @UStrCat3
 006AD1D8    mov         edx,dword ptr [ebp-5D4]
 006AD1DE    lea         edi,[ebx+80]
 006AD1E4    mov         ecx,edi
 006AD1E6    mov         eax,dword ptr [esi]
 006AD1E8    call        THashTable.Add
 006AD1ED    lea         edx,[ebp-5E0]
 006AD1F3    mov         eax,ebx
 006AD1F5    call        IntToStr
 006AD1FA    mov         ecx,dword ptr [ebp-5E0]
 006AD200    lea         eax,[ebp-5DC]
 006AD206    mov         edx,6B0A2C;'14BitControl'
 006AD20B    call        @UStrCat3
 006AD210    mov         edx,dword ptr [ebp-5DC]
 006AD216    mov         ecx,edi
 006AD218    mov         eax,dword ptr [esi]
 006AD21A    call        THashTable.Add
 006AD21F    lea         edx,[ebp-5E8]
 006AD225    mov         eax,ebx
 006AD227    call        IntToStr
 006AD22C    mov         ecx,dword ptr [ebp-5E8]
 006AD232    lea         eax,[ebp-5E4]
 006AD238    mov         edx,6B0A54;'WordControl'
 006AD23D    call        @UStrCat3
 006AD242    mov         edx,dword ptr [ebp-5E4]
 006AD248    mov         ecx,edi
 006AD24A    mov         eax,dword ptr [esi]
 006AD24C    call        THashTable.Add
 006AD251    lea         edx,[ebp-5F0]
 006AD257    mov         eax,ebx
 006AD259    call        IntToStr
 006AD25E    mov         ecx,dword ptr [ebp-5F0]
 006AD264    lea         eax,[ebp-5EC]
 006AD26A    mov         edx,6B0A78;'CoarseControl'
 006AD26F    call        @UStrCat3
 006AD274    mov         edx,dword ptr [ebp-5EC]
 006AD27A    lea         edi,[ebx]
 006AD27C    mov         ecx,edi
 006AD27E    mov         eax,dword ptr [esi]
 006AD280    call        THashTable.Add
 006AD285    lea         edx,[ebp-5F8]
 006AD28B    mov         eax,ebx
 006AD28D    call        IntToStr
 006AD292    mov         ecx,dword ptr [ebp-5F8]
 006AD298    lea         eax,[ebp-5F4]
 006AD29E    mov         edx,6B0AA0;'FineControl'
 006AD2A3    call        @UStrCat3
 006AD2A8    mov         edx,dword ptr [ebp-5F4]
 006AD2AE    mov         ecx,edi
 006AD2B0    add         ecx,20
 006AD2B3    mov         eax,dword ptr [esi]
 006AD2B5    call        THashTable.Add
 006AD2BA    push        6B0A10;'Control'
 006AD2BF    lea         edx,[ebp-600]
 006AD2C5    mov         eax,ebx
 006AD2C7    call        IntToStr
 006AD2CC    push        dword ptr [ebp-600]
 006AD2D2    push        6B0AC4;'Coarse'
 006AD2D7    lea         eax,[ebp-5FC]
 006AD2DD    mov         edx,3
 006AD2E2    call        @UStrCatN
 006AD2E7    mov         edx,dword ptr [ebp-5FC]
 006AD2ED    mov         ecx,edi
 006AD2EF    mov         eax,dword ptr [esi]
 006AD2F1    call        THashTable.Add
 006AD2F6    push        6B0A10;'Control'
 006AD2FB    lea         edx,[ebp-608]
 006AD301    mov         eax,ebx
 006AD303    call        IntToStr
 006AD308    push        dword ptr [ebp-608]
 006AD30E    push        6B0AE0;'Fine'
 006AD313    lea         eax,[ebp-604]
 006AD319    mov         edx,3
 006AD31E    call        @UStrCatN
 006AD323    mov         edx,dword ptr [ebp-604]
 006AD329    lea         ecx,[ebx+20]
 006AD32C    mov         eax,dword ptr [esi]
 006AD32E    call        THashTable.Add
 006AD333    lea         edx,[ebp-610]
 006AD339    mov         eax,ebx
 006AD33B    call        IntToStr
 006AD340    mov         ecx,dword ptr [ebp-610]
 006AD346    lea         eax,[ebp-60C]
 006AD34C    mov         edx,6B0AF8;'MSBControl'
 006AD351    call        @UStrCat3
 006AD356    mov         edx,dword ptr [ebp-60C]
 006AD35C    mov         ecx,edi
 006AD35E    mov         eax,dword ptr [esi]
 006AD360    call        THashTable.Add
 006AD365    lea         edx,[ebp-618]
 006AD36B    mov         eax,ebx
 006AD36D    call        IntToStr
 006AD372    mov         ecx,dword ptr [ebp-618]
 006AD378    lea         eax,[ebp-614]
 006AD37E    mov         edx,6B0B1C;'LSBControl'
 006AD383    call        @UStrCat3
 006AD388    mov         edx,dword ptr [ebp-614]
 006AD38E    lea         ecx,[ebx+20]
 006AD391    mov         eax,dword ptr [esi]
 006AD393    call        THashTable.Add
 006AD398    push        6B0A10;'Control'
 006AD39D    lea         edx,[ebp-620]
 006AD3A3    mov         eax,ebx
 006AD3A5    call        IntToStr
 006AD3AA    push        dword ptr [ebp-620]
 006AD3B0    push        6B0B40;'MSB'
 006AD3B5    lea         eax,[ebp-61C]
 006AD3BB    mov         edx,3
 006AD3C0    call        @UStrCatN
 006AD3C5    mov         edx,dword ptr [ebp-61C]
 006AD3CB    mov         ecx,edi
 006AD3CD    mov         eax,dword ptr [esi]
 006AD3CF    call        THashTable.Add
 006AD3D4    push        6B0A10;'Control'
 006AD3D9    lea         edx,[ebp-628]
 006AD3DF    mov         eax,ebx
 006AD3E1    call        IntToStr
 006AD3E6    push        dword ptr [ebp-628]
 006AD3EC    push        6B0B54;'LSB'
 006AD3F1    lea         eax,[ebp-624]
 006AD3F7    mov         edx,3
 006AD3FC    call        @UStrCatN
 006AD401    mov         edx,dword ptr [ebp-624]
 006AD407    lea         ecx,[ebx+20]
 006AD40A    mov         eax,dword ptr [esi]
 006AD40C    call        THashTable.Add
 006AD411    inc         ebx
 006AD412    cmp         ebx,20
>006AD415    jne         006AD1B5
 006AD41B    mov         ecx,343
 006AD420    mov         edx,6B0B68;'AcousticBassDrum'
 006AD425    mov         eax,dword ptr [esi]
 006AD427    call        THashTable.Add
 006AD42C    mov         ecx,344
 006AD431    mov         edx,6B0B98;'BassDrum1'
 006AD436    mov         eax,dword ptr [esi]
 006AD438    call        THashTable.Add
 006AD43D    mov         ecx,344
 006AD442    mov         edx,6B0BB8;'BassDrum2'
 006AD447    mov         eax,dword ptr [esi]
 006AD449    call        THashTable.Add
 006AD44E    mov         ecx,345
 006AD453    mov         edx,6B0BD8;'SideStick'
 006AD458    mov         eax,dword ptr [esi]
 006AD45A    call        THashTable.Add
 006AD45F    mov         ecx,346
 006AD464    mov         edx,6B0BF8;'AcousticSnare'
 006AD469    mov         eax,dword ptr [esi]
 006AD46B    call        THashTable.Add
 006AD470    mov         ecx,346
 006AD475    mov         edx,6B0C20;'AcousticSnareDrum'
 006AD47A    mov         eax,dword ptr [esi]
 006AD47C    call        THashTable.Add
 006AD481    mov         ecx,347
 006AD486    mov         edx,6B0C50;'HandClap'
 006AD48B    mov         eax,dword ptr [esi]
 006AD48D    call        THashTable.Add
 006AD492    mov         ecx,348
 006AD497    mov         edx,6B0C70;'ElectricSnare'
 006AD49C    mov         eax,dword ptr [esi]
 006AD49E    call        THashTable.Add
 006AD4A3    mov         ecx,348
 006AD4A8    mov         edx,6B0C98;'ElectricSnareDrum'
 006AD4AD    mov         eax,dword ptr [esi]
 006AD4AF    call        THashTable.Add
 006AD4B4    mov         ecx,349
 006AD4B9    mov         edx,6B0CC8;'LowFloorTom'
 006AD4BE    mov         eax,dword ptr [esi]
 006AD4C0    call        THashTable.Add
 006AD4C5    mov         ecx,34A
 006AD4CA    mov         edx,6B0CEC;'ClosedHiHat'
 006AD4CF    mov         eax,dword ptr [esi]
 006AD4D1    call        THashTable.Add
 006AD4D6    mov         ecx,34B
 006AD4DB    mov         edx,6B0D10;'HighFloorTom'
 006AD4E0    mov         eax,dword ptr [esi]
 006AD4E2    call        THashTable.Add
 006AD4E7    mov         ecx,34C
 006AD4EC    mov         edx,6B0D38;'PedalHiHat'
 006AD4F1    mov         eax,dword ptr [esi]
 006AD4F3    call        THashTable.Add
 006AD4F8    mov         ecx,34D
 006AD4FD    mov         edx,6B0D5C;'LowTom'
 006AD502    mov         eax,dword ptr [esi]
 006AD504    call        THashTable.Add
 006AD509    mov         ecx,34E
 006AD50E    mov         edx,6B0D78;'OpenHiHat'
 006AD513    mov         eax,dword ptr [esi]
 006AD515    call        THashTable.Add
 006AD51A    mov         ecx,34F
 006AD51F    mov         edx,6B0D98;'LowMidTom'
 006AD524    mov         eax,dword ptr [esi]
 006AD526    call        THashTable.Add
 006AD52B    mov         ecx,350
 006AD530    mov         edx,6B0DB8;'HighMidTom'
 006AD535    mov         eax,dword ptr [esi]
 006AD537    call        THashTable.Add
 006AD53C    mov         ecx,351
 006AD541    mov         edx,6B0DDC;'CrashCymbal1'
 006AD546    mov         eax,dword ptr [esi]
 006AD548    call        THashTable.Add
 006AD54D    mov         ecx,352
 006AD552    mov         edx,6B0E04;'HighTom'
 006AD557    mov         eax,dword ptr [esi]
 006AD559    call        THashTable.Add
 006AD55E    mov         ecx,353
 006AD563    mov         edx,6B0E20;'RideCymbal1'
 006AD568    mov         eax,dword ptr [esi]
 006AD56A    call        THashTable.Add
 006AD56F    mov         ecx,354
 006AD574    mov         edx,6B0E44;'ChineseCymbal'
 006AD579    mov         eax,dword ptr [esi]
 006AD57B    call        THashTable.Add
 006AD580    mov         ecx,355
 006AD585    mov         edx,6B0E6C;'RideBell'
 006AD58A    mov         eax,dword ptr [esi]
 006AD58C    call        THashTable.Add
 006AD591    mov         ecx,356
 006AD596    mov         edx,6B0E8C;'Tambourine'
 006AD59B    mov         eax,dword ptr [esi]
 006AD59D    call        THashTable.Add
 006AD5A2    mov         ecx,357
 006AD5A7    mov         edx,6B0EB0;'SplashCymbal'
 006AD5AC    mov         eax,dword ptr [esi]
 006AD5AE    call        THashTable.Add
 006AD5B3    mov         ecx,357
 006AD5B8    mov         edx,6B0ED8;'SplashCymbal1'
 006AD5BD    mov         eax,dword ptr [esi]
 006AD5BF    call        THashTable.Add
 006AD5C4    mov         ecx,358
 006AD5C9    mov         edx,6B0F00;'Cowbell'
 006AD5CE    mov         eax,dword ptr [esi]
 006AD5D0    call        THashTable.Add
 006AD5D5    mov         ecx,359
 006AD5DA    mov         edx,6B0F1C;'CrashCymbal2'
 006AD5DF    mov         eax,dword ptr [esi]
 006AD5E1    call        THashTable.Add
 006AD5E6    mov         ecx,35A
 006AD5EB    mov         edx,6B0F44;'Vibraslap'
 006AD5F0    mov         eax,dword ptr [esi]
 006AD5F2    call        THashTable.Add
 006AD5F7    mov         ecx,35B
 006AD5FC    mov         edx,6B0F64;'RideCymbal2'
 006AD601    mov         eax,dword ptr [esi]
 006AD603    call        THashTable.Add
 006AD608    mov         ecx,35C
 006AD60D    mov         edx,6B0F88;'HiBongo'
 006AD612    mov         eax,dword ptr [esi]
 006AD614    call        THashTable.Add
 006AD619    mov         ecx,35D
 006AD61E    mov         edx,6B0FA4;'LowBongo'
 006AD623    mov         eax,dword ptr [esi]
 006AD625    call        THashTable.Add
 006AD62A    mov         ecx,35E
 006AD62F    mov         edx,6B0FC4;'MuteHiConga'
 006AD634    mov         eax,dword ptr [esi]
 006AD636    call        THashTable.Add
 006AD63B    mov         ecx,35E
 006AD640    mov         edx,6B0FE8;'MuteHighConga'
 006AD645    mov         eax,dword ptr [esi]
 006AD647    call        THashTable.Add
 006AD64C    mov         ecx,35F
 006AD651    mov         edx,6B1010;'OpenHiConga'
 006AD656    mov         eax,dword ptr [esi]
 006AD658    call        THashTable.Add
 006AD65D    mov         ecx,35F
 006AD662    mov         edx,6B1034;'OpenHighConga'
 006AD667    mov         eax,dword ptr [esi]
 006AD669    call        THashTable.Add
 006AD66E    mov         ecx,360
 006AD673    mov         edx,6B105C;'LowConga'
 006AD678    mov         eax,dword ptr [esi]
 006AD67A    call        THashTable.Add
 006AD67F    mov         ecx,361
 006AD684    mov         edx,6B107C;'HighTimbale'
 006AD689    mov         eax,dword ptr [esi]
 006AD68B    call        THashTable.Add
 006AD690    mov         ecx,362
 006AD695    mov         edx,6B10A0;'LowTimbale'
 006AD69A    mov         eax,dword ptr [esi]
 006AD69C    call        THashTable.Add
 006AD6A1    mov         ecx,363
 006AD6A6    mov         edx,6B10C4;'HighAgogo'
 006AD6AB    mov         eax,dword ptr [esi]
 006AD6AD    call        THashTable.Add
 006AD6B2    mov         ecx,364
 006AD6B7    mov         edx,6B10E4;'LowAgogo'
 006AD6BC    mov         eax,dword ptr [esi]
 006AD6BE    call        THashTable.Add
 006AD6C3    mov         ecx,365
 006AD6C8    mov         edx,6B1104;'Cabasa'
 006AD6CD    mov         eax,dword ptr [esi]
 006AD6CF    call        THashTable.Add
 006AD6D4    mov         ecx,366
 006AD6D9    mov         edx,6B1120;'Maracas'
 006AD6DE    mov         eax,dword ptr [esi]
 006AD6E0    call        THashTable.Add
 006AD6E5    mov         ecx,367
 006AD6EA    mov         edx,6B113C;'ShortWhistle'
 006AD6EF    mov         eax,dword ptr [esi]
 006AD6F1    call        THashTable.Add
 006AD6F6    mov         ecx,368
 006AD6FB    mov         edx,6B1164;'LongWhistle'
 006AD700    mov         eax,dword ptr [esi]
 006AD702    call        THashTable.Add
 006AD707    mov         ecx,369
 006AD70C    mov         edx,6B1188;'ShortGuiro'
 006AD711    mov         eax,dword ptr [esi]
 006AD713    call        THashTable.Add
 006AD718    mov         ecx,36A
 006AD71D    mov         edx,6B11AC;'LongGuiro'
 006AD722    mov         eax,dword ptr [esi]
 006AD724    call        THashTable.Add
 006AD729    mov         ecx,36B
 006AD72E    mov         edx,6B11CC;'Claves'
 006AD733    mov         eax,dword ptr [esi]
 006AD735    call        THashTable.Add
 006AD73A    mov         ecx,36C
 006AD73F    mov         edx,6B11E8;'HiWoodBlock'
 006AD744    mov         eax,dword ptr [esi]
 006AD746    call        THashTable.Add
 006AD74B    mov         ecx,36C
 006AD750    mov         edx,6B120C;'HighWoodBlock'
 006AD755    mov         eax,dword ptr [esi]
 006AD757    call        THashTable.Add
 006AD75C    mov         ecx,36D
 006AD761    mov         edx,6B1234;'LowWoodBlock'
 006AD766    mov         eax,dword ptr [esi]
 006AD768    call        THashTable.Add
 006AD76D    mov         ecx,36E
 006AD772    mov         edx,6B125C;'MuteCuica'
 006AD777    mov         eax,dword ptr [esi]
 006AD779    call        THashTable.Add
 006AD77E    mov         ecx,36F
 006AD783    mov         edx,6B127C;'OpenCuica'
 006AD788    mov         eax,dword ptr [esi]
 006AD78A    call        THashTable.Add
 006AD78F    mov         ecx,370
 006AD794    mov         edx,6B129C;'MuteTriangle'
 006AD799    mov         eax,dword ptr [esi]
 006AD79B    call        THashTable.Add
 006AD7A0    mov         ecx,371
 006AD7A5    mov         edx,6B12C4;'OpenTriangle'
 006AD7AA    mov         eax,dword ptr [esi]
 006AD7AC    call        THashTable.Add
 006AD7B1    xor         ebx,ebx
 006AD7B3    lea         edx,[ebp-630]
 006AD7B9    mov         eax,ebx
 006AD7BB    call        IntToStr
 006AD7C0    mov         ecx,dword ptr [ebp-630]
 006AD7C6    lea         eax,[ebp-62C]
 006AD7CC    mov         edx,6B12EC;'Percussion'
 006AD7D1    call        @UStrCat3
 006AD7D6    mov         edx,dword ptr [ebp-62C]
 006AD7DC    lea         ecx,[ebx+320]
 006AD7E2    mov         eax,dword ptr [esi]
 006AD7E4    call        THashTable.Add
 006AD7E9    inc         ebx
 006AD7EA    cmp         ebx,80
>006AD7F0    jne         006AD7B3
 006AD7F2    mov         ecx,2E5
 006AD7F7    mov         edx,6B1310;'DeviceIn'
 006AD7FC    mov         eax,dword ptr [esi]
 006AD7FE    call        THashTable.Add
 006AD803    mov         ecx,2E4
 006AD808    mov         edx,6B1330;'DeviceOut'
 006AD80D    mov         eax,dword ptr [esi]
 006AD80F    call        THashTable.Add
 006AD814    mov         ecx,2E5
 006AD819    mov         edx,6B1350;'InDevice'
 006AD81E    mov         eax,dword ptr [esi]
 006AD820    call        THashTable.Add
 006AD825    mov         ecx,2E4
 006AD82A    mov         edx,6B1370;'OutDevice'
 006AD82F    mov         eax,dword ptr [esi]
 006AD831    call        THashTable.Add
 006AD836    mov         ecx,2E6
 006AD83B    mov         edx,6B1390;'DefaultChannel'
 006AD840    mov         eax,dword ptr [esi]
 006AD842    call        THashTable.Add
 006AD847    mov         ecx,2DE
 006AD84C    mov         edx,6B13BC;'MasterTuning'
 006AD851    mov         eax,dword ptr [esi]
 006AD853    call        THashTable.Add
 006AD858    mov         ecx,2DF
 006AD85D    mov         edx,6B13E4;'MasterTuningCoarse'
 006AD862    mov         eax,dword ptr [esi]
 006AD864    call        THashTable.Add
 006AD869    mov         ecx,2E0
 006AD86E    mov         edx,6B1418;'MasterTuningFine'
 006AD873    mov         eax,dword ptr [esi]
 006AD875    call        THashTable.Add
 006AD87A    mov         ecx,2E1
 006AD87F    mov         edx,6B1448;'PitchBendRange'
 006AD884    mov         eax,dword ptr [esi]
 006AD886    call        THashTable.Add
 006AD88B    mov         ecx,2E2
 006AD890    mov         edx,6B1474;'TuningProgramSelect'
 006AD895    mov         eax,dword ptr [esi]
 006AD897    call        THashTable.Add
 006AD89C    mov         ecx,2E3
 006AD8A1    mov         edx,6B14A8;'TuningBankSelect'
 006AD8A6    mov         eax,dword ptr [esi]
 006AD8A8    call        THashTable.Add
 006AD8AD    xor         eax,eax
 006AD8AF    pop         edx
 006AD8B0    pop         ecx
 006AD8B1    pop         ecx
 006AD8B2    mov         dword ptr fs:[eax],edx
 006AD8B5    push        6AD902
 006AD8BA    lea         eax,[ebp-630]
 006AD8C0    mov         edx,64
 006AD8C5    call        @UStrArrayClr
 006AD8CA    lea         eax,[ebp-4A0]
 006AD8D0    mov         edx,64
 006AD8D5    call        @UStrArrayClr
 006AD8DA    lea         eax,[ebp-310]
 006AD8E0    mov         edx,64
 006AD8E5    call        @UStrArrayClr
 006AD8EA    lea         eax,[ebp-180]
 006AD8F0    mov         edx,60
 006AD8F5    call        @UStrArrayClr
 006AD8FA    ret
>006AD8FB    jmp         @HandleFinally
>006AD900    jmp         006AD8BA
 006AD902    pop         edi
 006AD903    pop         esi
 006AD904    pop         ebx
 006AD905    mov         esp,ebp
 006AD907    pop         ebp
 006AD908    ret
*}
end;

//006B14CC
{*function sub_006B14CC:?;
begin
 006B14CC    xor         eax,eax
 006B14CE    ret
end;*}

//006B14D0
procedure sub_006B14D0;
begin
{*
 006B14D0    ret
*}
end;

//006B14D4
function TMidiValue.CanSet:Boolean;
begin
{*
 006B14D4    mov         al,1
 006B14D6    ret
*}
end;

//006B14D8
{*function sub_006B14D8(?:?):?;
begin
 006B14D8    push        ebp
 006B14D9    mov         ebp,esp
 006B14DB    xor         ecx,ecx
 006B14DD    push        ecx
 006B14DE    push        ecx
 006B14DF    push        ecx
 006B14E0    push        ecx
 006B14E1    push        ecx
 006B14E2    push        ecx
 006B14E3    push        ecx
 006B14E4    push        ecx
 006B14E5    push        ebx
 006B14E6    push        esi
 006B14E7    push        edi
 006B14E8    mov         dword ptr [ebp-4],eax
 006B14EB    mov         eax,dword ptr [ebp-4]
 006B14EE    call        @UStrAddRef
 006B14F3    xor         eax,eax
 006B14F5    push        ebp
 006B14F6    push        6B1A86
 006B14FB    push        dword ptr fs:[eax]
 006B14FE    mov         dword ptr fs:[eax],esp
 006B1501    mov         byte ptr ds:[78BE60],1;gvar_0078BE60
 006B1508    or          esi,0FFFFFFFF
 006B150B    xor         eax,eax
 006B150D    mov         dword ptr [ebp-0C],eax
 006B1510    lea         eax,[ebp-8]
 006B1513    mov         edx,dword ptr [ebp-4]
 006B1516    call        @UStrLAsg
 006B151B    mov         eax,dword ptr [ebp-8]
 006B151E    test        eax,eax
>006B1520    je          006B1527
 006B1522    sub         eax,4
 006B1525    mov         eax,dword ptr [eax]
 006B1527    cmp         eax,5
>006B152A    jge         006B1530
 006B152C    mov         al,1
>006B152E    jmp         006B153F
 006B1530    lea         eax,[ebp-8]
 006B1533    mov         edx,6B1AA4;'midi'
 006B1538    call        004F9BD0
 006B153D    xor         al,1
 006B153F    test        al,al
>006B1541    jne         006B1A5E
 006B1547    lea         eax,[ebp-8]
 006B154A    call        004F9D00
 006B154F    mov         ebx,eax
 006B1551    dec         ebx
 006B1552    lea         eax,[ebp-8]
 006B1555    mov         edx,6B1ABC;'.'
 006B155A    call        004F9BD0
 006B155F    test        al,al
>006B1561    je          006B1A5E
 006B1567    cmp         ebx,0FFFFFFFF
>006B156A    jl          006B1573
 006B156C    mov         esi,ebx
>006B156E    jmp         006B17F6
 006B1573    lea         eax,[ebp-8]
 006B1576    mov         edx,6B1ACC;^'RealLeftStick'
 006B157B    call        004F9BD0
 006B1580    test        al,al
>006B1582    je          006B15E0
 006B1584    lea         eax,[ebp-8]
 006B1587    mov         edx,6B1AE4;'amento'
 006B158C    call        004F9BD0
 006B1591    test        al,al
>006B1593    je          006B15AA
 006B1595    lea         eax,[ebp-8]
 006B1598    mov         ecx,dword ptr [ebp-8]
 006B159B    mov         edx,6B1B00;^'RealLeftStick'
 006B15A0    call        @UStrCat3
>006B15A5    jmp         006B17F6
 006B15AA    lea         eax,[ebp-8]
 006B15AD    call        004F9D00
 006B15B2    mov         esi,eax
 006B15B4    mov         eax,esi
 006B15B6    call        006A84D8
 006B15BB    mov         ebx,eax
 006B15BD    test        esi,esi
>006B15BF    jle         006B15C4
 006B15C1    dec         esi
>006B15C2    jmp         006B15C6
 006B15C4    xor         esi,esi
 006B15C6    lea         eax,[ebp-8]
 006B15C9    mov         edx,6B1ABC;'.'
 006B15CE    call        004F9BD0
 006B15D3    test        al,al
>006B15D5    je          006B1A5E
>006B15DB    jmp         006B17F6
 006B15E0    lea         eax,[ebp-8]
 006B15E3    mov         edx,6B1B24;'thru'
 006B15E8    call        004F9BD0
 006B15ED    test        al,al
>006B15EF    jne         006B1635
 006B15F1    lea         eax,[ebp-8]
 006B15F4    mov         edx,6B1B3C;'LoopBack'
 006B15F9    call        004F9BD0
 006B15FE    test        al,al
>006B1600    jne         006B1635
 006B1602    lea         eax,[ebp-8]
 006B1605    mov         edx,6B1B5C;'LB'
 006B160A    call        004F9BD0
 006B160F    test        al,al
>006B1611    jne         006B1635
 006B1613    lea         eax,[ebp-8]
 006B1616    mov         edx,6B1B70;'through'
 006B161B    call        004F9BD0
 006B1620    test        al,al
>006B1622    jne         006B1635
 006B1624    lea         eax,[ebp-8]
 006B1627    mov         edx,6B1B8C;'yoke'
 006B162C    call        004F9BD0
 006B1631    test        al,al
>006B1633    je          006B166B
 006B1635    lea         eax,[ebp-8]
 006B1638    call        004F9D00
 006B163D    mov         esi,eax
 006B163F    mov         eax,esi
 006B1641    call        006A851C
 006B1646    mov         ebx,eax
 006B1648    mov         eax,esi
 006B164A    call        006A86F0
 006B164F    mov         esi,eax
 006B1651    lea         eax,[ebp-8]
 006B1654    mov         edx,6B1ABC;'.'
 006B1659    call        004F9BD0
 006B165E    test        al,al
>006B1660    je          006B1A5E
>006B1666    jmp         006B17F6
 006B166B    lea         eax,[ebp-8]
 006B166E    mov         edx,6B1BA4;'mapper'
 006B1673    call        004F9BD0
 006B1678    test        al,al
>006B167A    je          006B169B
 006B167C    or          ebx,0FFFFFFFF
 006B167F    xor         esi,esi
 006B1681    lea         eax,[ebp-8]
 006B1684    mov         edx,6B1ABC;'.'
 006B1689    call        004F9BD0
 006B168E    test        al,al
>006B1690    je          006B1A5E
>006B1696    jmp         006B17F6
 006B169B    lea         eax,[ebp-8]
 006B169E    mov         edx,6B1BC0;'software'
 006B16A3    call        004F9BD0
 006B16A8    test        al,al
>006B16AA    jne         006B16CE
 006B16AC    lea         eax,[ebp-8]
 006B16AF    mov         edx,6B1BE0;'swsynth'
 006B16B4    call        004F9BD0
 006B16B9    test        al,al
>006B16BB    jne         006B16CE
 006B16BD    lea         eax,[ebp-8]
 006B16C0    mov         edx,6B1BFC;'SoftwareWavetable'
 006B16C5    call        004F9BD0
 006B16CA    test        al,al
>006B16CC    je          006B16F7
 006B16CE    lea         eax,[ebp-8]
 006B16D1    call        004F9D00
 006B16D6    call        006A87E0
 006B16DB    mov         ebx,eax
 006B16DD    lea         eax,[ebp-8]
 006B16E0    mov         edx,6B1ABC;'.'
 006B16E5    call        004F9BD0
 006B16EA    test        al,al
>006B16EC    je          006B1A5E
>006B16F2    jmp         006B17F6
 006B16F7    lea         eax,[ebp-8]
 006B16FA    mov         edx,6B1C2C;'SoundCard'
 006B16FF    call        004F9BD0
 006B1704    test        al,al
>006B1706    je          006B1731
 006B1708    lea         eax,[ebp-8]
 006B170B    call        004F9D00
 006B1710    call        006A8870
 006B1715    mov         ebx,eax
 006B1717    lea         eax,[ebp-8]
 006B171A    mov         edx,6B1ABC;'.'
 006B171F    call        004F9BD0
 006B1724    test        al,al
>006B1726    je          006B1A5E
>006B172C    jmp         006B17F6
 006B1731    lea         eax,[ebp-8]
 006B1734    mov         edx,6B1C4C;'player'
 006B1739    call        004F9BD0
 006B173E    test        al,al
>006B1740    jne         006B1764
 006B1742    lea         eax,[ebp-8]
 006B1745    mov         edx,6B1C68;'playback'
 006B174A    call        004F9BD0
 006B174F    test        al,al
>006B1751    jne         006B1764
 006B1753    lea         eax,[ebp-8]
 006B1756    mov         edx,6B1C88;'speakers'
 006B175B    call        004F9BD0
 006B1760    test        al,al
>006B1762    je          006B178A
 006B1764    lea         eax,[ebp-8]
 006B1767    call        004F9D00
 006B176C    call        006A88C4
 006B1771    mov         ebx,eax
 006B1773    lea         eax,[ebp-8]
 006B1776    mov         edx,6B1ABC;'.'
 006B177B    call        004F9BD0
 006B1780    test        al,al
>006B1782    je          006B1A5E
>006B1788    jmp         006B17F6
 006B178A    lea         eax,[ebp-8]
 006B178D    mov         edx,6B1CA8;'WaveTable'
 006B1792    call        004F9BD0
 006B1797    test        al,al
>006B1799    je          006B17C1
 006B179B    lea         eax,[ebp-8]
 006B179E    call        004F9D00
 006B17A3    call        006A8828
 006B17A8    mov         ebx,eax
 006B17AA    lea         eax,[ebp-8]
 006B17AD    mov         edx,6B1ABC;'.'
 006B17B2    call        004F9BD0
 006B17B7    test        al,al
>006B17B9    je          006B1A5E
>006B17BF    jmp         006B17F6
 006B17C1    lea         eax,[ebp-8]
 006B17C4    mov         edx,6B1CC8;'External'
 006B17C9    call        004F9BD0
 006B17CE    test        al,al
>006B17D0    je          006B17F6
 006B17D2    lea         eax,[ebp-8]
 006B17D5    call        004F9D00
 006B17DA    call        006A8604
 006B17DF    mov         ebx,eax
 006B17E1    lea         eax,[ebp-8]
 006B17E4    mov         edx,6B1ABC;'.'
 006B17E9    call        004F9BD0
 006B17EE    test        al,al
>006B17F0    je          006B1A5E
 006B17F6    lea         eax,[ebp-18]
 006B17F9    push        eax
 006B17FA    mov         ecx,0F
 006B17FF    mov         edx,1
 006B1804    mov         eax,dword ptr [ebp-8]
 006B1807    call        @UStrCopy
 006B180C    mov         eax,dword ptr [ebp-18]
 006B180F    lea         edx,[ebp-14]
 006B1812    call        LowerCase
 006B1817    mov         eax,dword ptr [ebp-14]
 006B181A    mov         edx,6B1CE8;'channelpressure'
 006B181F    call        @UStrEqual
>006B1824    je          006B1888
 006B1826    lea         eax,[ebp-20]
 006B1829    push        eax
 006B182A    mov         ecx,11
 006B182F    mov         edx,1
 006B1834    mov         eax,dword ptr [ebp-8]
 006B1837    call        @UStrCopy
 006B183C    mov         eax,dword ptr [ebp-20]
 006B183F    lea         edx,[ebp-1C]
 006B1842    call        LowerCase
 006B1847    mov         eax,dword ptr [ebp-1C]
 006B184A    mov         edx,6B1D14;'channelaftertouch'
 006B184F    call        @UStrEqual
>006B1854    je          006B1888
 006B1856    lea         eax,[ebp-8]
 006B1859    mov         edx,6B1D44;'Channel'
 006B185E    call        004F9BD0
 006B1863    test        al,al
>006B1865    je          006B1888
 006B1867    lea         eax,[ebp-8]
 006B186A    call        004F9D00
 006B186F    mov         edi,eax
 006B1871    lea         eax,[ebp-8]
 006B1874    mov         edx,6B1ABC;'.'
 006B1879    call        004F9BD0
 006B187E    test        al,al
>006B1880    je          006B1A5E
>006B1886    jmp         006B188B
 006B1888    or          edi,0FFFFFFFF
 006B188B    mov         eax,dword ptr [ebp-8]
 006B188E    call        006A8920
 006B1893    mov         dword ptr [ebp-10],eax
 006B1896    cmp         dword ptr [ebp-10],0
>006B189A    jl          006B1A5E
 006B18A0    mov         dl,1
 006B18A2    mov         eax,[006A6DD8];TMidiValue
 006B18A7    call        TObject.Create;TMidiValue.Create
 006B18AC    mov         dword ptr [ebp-0C],eax
 006B18AF    mov         eax,dword ptr [ebp-0C]
 006B18B2    mov         edx,dword ptr [ebp-10]
 006B18B5    mov         dword ptr [eax+24],edx;TMidiValue.Item:Integer
 006B18B8    mov         eax,dword ptr [ebp-0C]
 006B18BB    mov         dword ptr [eax+18],esi;TMidiValue.MidiNumberIn:Integer
 006B18BE    mov         eax,dword ptr [ebp-0C]
 006B18C1    mov         dword ptr [eax+1C],ebx;TMidiValue.MidiNumberOut:Integer
 006B18C4    mov         eax,dword ptr [ebp-0C]
 006B18C7    mov         dword ptr [eax+20],edi;TMidiValue.ChannelNumber:Integer
 006B18CA    cmp         dword ptr ds:[81EDD8],0;gvar_0081EDD8:TObjectList
>006B18D1    je          006B1995
 006B18D7    cmp         dword ptr [ebp-10],2E4
>006B18DE    jne         006B191C
 006B18E0    mov         eax,[0081EDD8];gvar_0081EDD8:TObjectList
 006B18E5    mov         ebx,dword ptr [eax+8]
 006B18E8    dec         ebx
 006B18E9    test        ebx,ebx
>006B18EB    jl          006B1995
 006B18F1    inc         ebx
 006B18F2    xor         esi,esi
 006B18F4    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B18FA    mov         edx,esi
 006B18FC    mov         eax,edi
 006B18FE    call        TList.Get
 006B1903    mov         edi,eax
 006B1905    mov         eax,edi
 006B1907    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B190D    call        @AsClass
 006B1912    mov         byte ptr [eax+0B],1;TMidiDevice.Used:Boolean
 006B1916    inc         esi
 006B1917    dec         ebx
>006B1918    jne         006B18F4
>006B191A    jmp         006B1995
 006B191C    xor         edx,edx
 006B191E    push        ebp
 006B191F    push        6B1975
 006B1924    push        dword ptr fs:[edx]
 006B1927    mov         dword ptr fs:[edx],esp
 006B192A    mov         eax,dword ptr [ebp-0C]
 006B192D    call        TMidiValue.GetOutDevice
 006B1932    inc         eax
 006B1933    mov         edx,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B1939    cmp         eax,dword ptr [edx+8]
>006B193C    jge         006B196B
 006B193E    mov         ebx,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B1944    mov         eax,dword ptr [ebp-0C]
 006B1947    call        TMidiValue.GetOutDevice
 006B194C    mov         esi,eax
 006B194E    inc         esi
 006B194F    mov         edx,esi
 006B1951    mov         eax,ebx
 006B1953    call        TList.Get
 006B1958    mov         ebx,eax
 006B195A    mov         eax,ebx
 006B195C    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B1962    call        @AsClass
 006B1967    mov         byte ptr [eax+0B],1;TMidiDevice.Used:Boolean
 006B196B    xor         eax,eax
 006B196D    pop         edx
 006B196E    pop         ecx
 006B196F    pop         ecx
 006B1970    mov         dword ptr fs:[eax],edx
>006B1973    jmp         006B1995
>006B1975    jmp         @HandleOnException
 006B197A    dd          1
 006B197E    dd          00418C04;Exception
 006B1982    dd          006B1986
 006B1986    mov         edx,6B1D60;'CreateMidiValue OutMidiDevices'
 006B198B    call        004FA6EC
 006B1990    call        @DoneExcept
 006B1995    cmp         dword ptr ds:[81EDD4],0;gvar_0081EDD4:TObjectList
>006B199C    je          006B1A5E
 006B19A2    cmp         dword ptr [ebp-10],2E5
>006B19A9    jne         006B19E7
 006B19AB    mov         eax,[0081EDD4];gvar_0081EDD4:TObjectList
 006B19B0    mov         ebx,dword ptr [eax+8]
 006B19B3    dec         ebx
 006B19B4    test        ebx,ebx
>006B19B6    jl          006B1A5E
 006B19BC    inc         ebx
 006B19BD    xor         esi,esi
 006B19BF    mov         edi,dword ptr ds:[81EDD4];gvar_0081EDD4:TObjectList
 006B19C5    mov         edx,esi
 006B19C7    mov         eax,edi
 006B19C9    call        TList.Get
 006B19CE    mov         edi,eax
 006B19D0    mov         eax,edi
 006B19D2    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B19D8    call        @AsClass
 006B19DD    mov         byte ptr [eax+0B],1;TMidiDevice.Used:Boolean
 006B19E1    inc         esi
 006B19E2    dec         ebx
>006B19E3    jne         006B19BF
>006B19E5    jmp         006B1A5E
 006B19E7    xor         edx,edx
 006B19E9    push        ebp
 006B19EA    push        6B1A3E
 006B19EF    push        dword ptr fs:[edx]
 006B19F2    mov         dword ptr fs:[edx],esp
 006B19F5    mov         eax,dword ptr [ebp-0C]
 006B19F8    call        TMidiValue.GetInDevice
 006B19FD    mov         edx,dword ptr ds:[81EDD4];gvar_0081EDD4:TObjectList
 006B1A03    cmp         eax,dword ptr [edx+8]
>006B1A06    jge         006B1A34
 006B1A08    mov         ebx,dword ptr ds:[81EDD4];gvar_0081EDD4:TObjectList
 006B1A0E    mov         eax,dword ptr [ebp-0C]
 006B1A11    call        TMidiValue.GetInDevice
 006B1A16    mov         esi,eax
 006B1A18    mov         edx,esi
 006B1A1A    mov         eax,ebx
 006B1A1C    call        TList.Get
 006B1A21    mov         ebx,eax
 006B1A23    mov         eax,ebx
 006B1A25    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B1A2B    call        @AsClass
 006B1A30    mov         byte ptr [eax+0B],1;TMidiDevice.Used:Boolean
 006B1A34    xor         eax,eax
 006B1A36    pop         edx
 006B1A37    pop         ecx
 006B1A38    pop         ecx
 006B1A39    mov         dword ptr fs:[eax],edx
>006B1A3C    jmp         006B1A5E
>006B1A3E    jmp         @HandleOnException
 006B1A43    dd          1
 006B1A47    dd          00418C04;Exception
 006B1A4B    dd          006B1A4F
 006B1A4F    mov         edx,6B1DAC;'CreateMidiValue InMidiDevices'
 006B1A54    call        004FA6EC
 006B1A59    call        @DoneExcept
 006B1A5E    xor         eax,eax
 006B1A60    pop         edx
 006B1A61    pop         ecx
 006B1A62    pop         ecx
 006B1A63    mov         dword ptr fs:[eax],edx
 006B1A66    push        6B1A8D
 006B1A6B    lea         eax,[ebp-20]
 006B1A6E    mov         edx,4
 006B1A73    call        @UStrArrayClr
 006B1A78    lea         eax,[ebp-8]
 006B1A7B    mov         edx,2
 006B1A80    call        @UStrArrayClr
 006B1A85    ret
>006B1A86    jmp         @HandleFinally
>006B1A8B    jmp         006B1A6B
 006B1A8D    mov         eax,dword ptr [ebp-0C]
 006B1A90    pop         edi
 006B1A91    pop         esi
 006B1A92    pop         ebx
 006B1A93    mov         esp,ebp
 006B1A95    pop         ebp
 006B1A96    ret
end;*}

//006B1DE8
procedure TMidiValue.CreateClone;
begin
{*
 006B1DE8    mov         dl,1
 006B1DEA    mov         eax,[006A6DD8];TMidiValue
 006B1DEF    call        TObject.Create;TMidiValue.Create
 006B1DF4    ret
*}
end;

//006B1DF8
procedure TMidiValue.FillClone(c:TExpression);
begin
{*
 006B1DF8    push        ebx
 006B1DF9    push        esi
 006B1DFA    mov         esi,edx
 006B1DFC    mov         ebx,eax
 006B1DFE    mov         edx,esi
 006B1E00    mov         eax,ebx
 006B1E02    call        TExpression.FillClone
 006B1E07    mov         eax,esi
 006B1E09    mov         edx,dword ptr [ebx+18];TMidiValue.MidiNumberIn:Integer
 006B1E0C    mov         dword ptr [eax+18],edx
 006B1E0F    mov         edx,dword ptr [ebx+1C];TMidiValue.MidiNumberOut:Integer
 006B1E12    mov         dword ptr [eax+1C],edx
 006B1E15    mov         edx,dword ptr [ebx+20];TMidiValue.ChannelNumber:Integer
 006B1E18    mov         dword ptr [eax+20],edx
 006B1E1B    mov         edx,dword ptr [ebx+24];TMidiValue.Item:Integer
 006B1E1E    mov         dword ptr [eax+24],edx
 006B1E21    pop         esi
 006B1E22    pop         ebx
 006B1E23    ret
*}
end;

//006B1E24
function TMidiValue.GetChannel:Integer;
begin
{*
 006B1E24    mov         edx,dword ptr [eax+20];TMidiValue.ChannelNumber:Integer
 006B1E27    test        edx,edx
>006B1E29    jle         006B1E30
 006B1E2B    cmp         edx,10
>006B1E2E    jle         006B1E36
 006B1E30    mov         eax,[0078BE64];0x1 gvar_0078BE64
 006B1E35    ret
 006B1E36    mov         eax,edx
 006B1E38    ret
*}
end;

//006B1E3C
function TMidiValue.GetDataType:TDataType;
begin
{*
 006B1E3C    mov         eax,dword ptr [eax+24];TMidiValue.Item:Integer
 006B1E3F    cmp         eax,258
>006B1E44    jge         006B1E9D
 006B1E46    cmp         eax,12E
>006B1E4B    jge         006B1E7D
 006B1E4D    sub         eax,80
>006B1E52    jb          006B1EED
 006B1E58    sub         eax,20
>006B1E5B    jb          006B1EF0
 006B1E61    sub         eax,80
>006B1E66    jb          006B1EF3
 006B1E6C    add         eax,0FFFFFFF4
 006B1E6F    sub         eax,2
>006B1E72    jb          006B1EFC
>006B1E78    jmp         006B1F08
 006B1E7D    add         eax,0FFFFFED2
 006B1E82    sub         eax,2
>006B1E85    jb          006B1EEA
 006B1E87    sub         eax,2
>006B1E8A    jb          006B1EFF
 006B1E8C    sub         eax,2
>006B1E8F    jb          006B1F02
 006B1E91    add         eax,0FFFFFFA4
 006B1E94    sub         eax,80
>006B1E99    jb          006B1EF6
>006B1E9B    jmp         006B1F08
 006B1E9D    cmp         eax,2E7
>006B1EA2    jg          006B1EC6
>006B1EA4    je          006B1EDB
 006B1EA6    add         eax,0FFFFFDA8
 006B1EAB    sub         eax,80
>006B1EB0    jb          006B1EF9
 006B1EB2    sub         eax,3
>006B1EB5    je          006B1EFC
 006B1EB7    sub         eax,2
>006B1EBA    je          006B1EFC
 006B1EBC    add         eax,0FFFFFFF9
 006B1EBF    sub         eax,3
>006B1EC2    jb          006B1F05
>006B1EC4    jmp         006B1F08
 006B1EC6    sub         eax,2E8
>006B1ECB    je          006B1EE1
 006B1ECD    dec         eax
>006B1ECE    je          006B1EE4
 006B1ED0    dec         eax
>006B1ED1    je          006B1EE7
 006B1ED3    dec         eax
 006B1ED4    sub         eax,4
>006B1ED7    jb          006B1EDE
>006B1ED9    jmp         006B1F08
 006B1EDB    mov         al,3
 006B1EDD    ret
 006B1EDE    mov         al,2
 006B1EE0    ret
 006B1EE1    xor         eax,eax
 006B1EE3    ret
 006B1EE4    mov         al,3
 006B1EE6    ret
 006B1EE7    mov         al,4
 006B1EE9    ret
 006B1EEA    mov         al,4
 006B1EEC    ret
 006B1EED    xor         eax,eax
 006B1EEF    ret
 006B1EF0    xor         eax,eax
 006B1EF2    ret
 006B1EF3    mov         al,3
 006B1EF5    ret
 006B1EF6    xor         eax,eax
 006B1EF8    ret
 006B1EF9    xor         eax,eax
 006B1EFB    ret
 006B1EFC    mov         al,2
 006B1EFE    ret
 006B1EFF    xor         eax,eax
 006B1F01    ret
 006B1F02    mov         al,2
 006B1F04    ret
 006B1F05    mov         al,2
 006B1F07    ret
 006B1F08    xor         eax,eax
 006B1F0A    ret
*}
end;

//006B1F0C
function TMidiValue.GetInDevice:Integer;
begin
{*
 006B1F0C    mov         edx,dword ptr [eax+18];TMidiValue.MidiNumberIn:Integer
 006B1F0F    test        edx,edx
>006B1F11    jge         006B1F19
 006B1F13    mov         eax,[0078BE6C];0x0 gvar_0078BE6C
 006B1F18    ret
 006B1F19    mov         eax,edx
 006B1F1B    ret
*}
end;

//006B1F1C
function TMidiValue.GetOutDevice:Integer;
begin
{*
 006B1F1C    mov         edx,dword ptr [eax+1C];TMidiValue.MidiNumberOut:Integer
 006B1F1F    cmp         edx,0FFFFFFFF
>006B1F22    jge         006B1F2A
 006B1F24    mov         eax,[0078BE68];0xFFFFFFFF gvar_0078BE68
 006B1F29    ret
 006B1F2A    mov         eax,edx
 006B1F2C    ret
*}
end;

//006B1F30
{*procedure TMidiValue.GetString(?:?);
begin
 006B1F30    push        ebx
 006B1F31    push        esi
 006B1F32    add         esp,0FFFFFF60
 006B1F38    mov         esi,edx
 006B1F3A    mov         ebx,eax
 006B1F3C    mov         eax,dword ptr [ebx+24];TMidiValue.Item:Integer
 006B1F3F    sub         eax,12E
>006B1F44    je          006B1F59
 006B1F46    dec         eax
>006B1F47    je          006B1F8C
 006B1F49    sub         eax,1BB
>006B1F4E    jne         006B1FBF
 006B1F50    mov         eax,esi
 006B1F52    call        @UStrClr
>006B1F57    jmp         006B1FC8
 006B1F59    push        54
 006B1F5B    lea         eax,[esp+4]
 006B1F5F    push        eax
 006B1F60    mov         eax,ebx
 006B1F62    call        TMidiValue.GetOutDevice
 006B1F67    push        eax
 006B1F68    call        winmm.midiOutGetDevCapsW
 006B1F6D    test        eax,eax
>006B1F6F    jne         006B1F83
 006B1F71    mov         eax,esi
 006B1F73    lea         edx,[esp+8]
 006B1F77    mov         ecx,20
 006B1F7C    call        @UStrFromWArray
>006B1F81    jmp         006B1FC8
 006B1F83    mov         eax,esi
 006B1F85    call        @UStrClr
>006B1F8A    jmp         006B1FC8
 006B1F8C    push        4C
 006B1F8E    lea         eax,[esp+58]
 006B1F92    push        eax
 006B1F93    mov         eax,ebx
 006B1F95    call        TMidiValue.GetInDevice
 006B1F9A    push        eax
 006B1F9B    call        winmm.midiInGetDevCapsW
 006B1FA0    test        eax,eax
>006B1FA2    jne         006B1FB6
 006B1FA4    mov         eax,esi
 006B1FA6    lea         edx,[esp+5C]
 006B1FAA    mov         ecx,20
 006B1FAF    call        @UStrFromWArray
>006B1FB4    jmp         006B1FC8
 006B1FB6    mov         eax,esi
 006B1FB8    call        @UStrClr
>006B1FBD    jmp         006B1FC8
 006B1FBF    mov         edx,esi
 006B1FC1    mov         eax,ebx
 006B1FC3    call        TExpression.GetString
 006B1FC8    add         esp,0A0
 006B1FCE    pop         esi
 006B1FCF    pop         ebx
 006B1FD0    ret
end;*}

//006B1FD4
function TMidiValue.GetUnits:TUnits;
begin
{*
 006B1FD4    mov         eax,dword ptr [eax+24];TMidiValue.Item:Integer
 006B1FD7    add         eax,0FFFFFD22
 006B1FDC    sub         eax,2
>006B1FDF    jb          006B1FF4
>006B1FE1    je          006B1FF7
 006B1FE3    dec         eax
>006B1FE4    je          006B1FF1
 006B1FE6    add         eax,0FFFFFFF6
 006B1FE9    sub         eax,4
>006B1FEC    jae         006B1FFA
 006B1FEE    mov         al,1B
 006B1FF0    ret
 006B1FF1    mov         al,1B
 006B1FF3    ret
 006B1FF4    mov         al,1B
 006B1FF6    ret
 006B1FF7    mov         al,1A
 006B1FF9    ret
 006B1FFA    xor         eax,eax
 006B1FFC    ret
*}
end;

//006B2000
procedure TMidiValue.GetValue;
begin
{*
 006B2000    push        ebx
 006B2001    push        esi
 006B2002    push        edi
 006B2003    add         esp,0FFFFFF4C
 006B2009    mov         ebx,eax
 006B200B    mov         eax,dword ptr [ebx+24];TMidiValue.Item:Integer
 006B200E    cmp         eax,131
>006B2013    jg          006B2044
>006B2015    je          006B20C9
 006B201B    add         eax,0FFFFFED4
 006B2020    cmp         eax,4
>006B2023    ja          006B2229
 006B2029    jmp         dword ptr [eax*4+6B2030]
 006B2029    dd          006B207F
 006B2029    dd          006B20A4
 006B2029    dd          006B220D
 006B2029    dd          006B221B
 006B2029    dd          006B2113
 006B2044    cmp         eax,2E4
>006B2049    jg          006B2068
>006B204B    je          006B21CF
 006B2051    sub         eax,132
>006B2056    je          006B216F
 006B205C    dec         eax
>006B205D    je          006B215D
>006B2063    jmp         006B2229
 006B2068    sub         eax,2E5
>006B206D    je          006B21EE
 006B2073    dec         eax
>006B2074    je          006B21B1
>006B207A    jmp         006B2229
 006B207F    call        winmm.midiOutGetNumDevs
 006B2084    mov         dword ptr [esp+0A8],eax
 006B208B    xor         eax,eax
 006B208D    mov         dword ptr [esp+0AC],eax
 006B2094    fild        qword ptr [esp+0A8]
 006B209B    fstp        qword ptr [esp]
 006B209E    wait
>006B209F    jmp         006B265A
 006B20A4    call        winmm.midiInGetNumDevs
 006B20A9    mov         dword ptr [esp+0A8],eax
 006B20B0    xor         eax,eax
 006B20B2    mov         dword ptr [esp+0AC],eax
 006B20B9    fild        qword ptr [esp+0A8]
 006B20C0    fstp        qword ptr [esp]
 006B20C3    wait
>006B20C4    jmp         006B265A
 006B20C9    push        4C
 006B20CB    lea         eax,[esp+60]
 006B20CF    push        eax
 006B20D0    mov         eax,ebx
 006B20D2    call        TMidiValue.GetInDevice
 006B20D7    push        eax
 006B20D8    call        winmm.midiInGetDevCapsW
 006B20DD    test        eax,eax
>006B20DF    jne         006B2105
 006B20E1    mov         eax,dword ptr [esp+60]
 006B20E5    mov         dword ptr [esp+0A8],eax
 006B20EC    xor         eax,eax
 006B20EE    mov         dword ptr [esp+0AC],eax
 006B20F5    fild        qword ptr [esp+0A8]
 006B20FC    fstp        qword ptr [esp]
 006B20FF    wait
>006B2100    jmp         006B265A
 006B2105    xor         eax,eax
 006B2107    mov         dword ptr [esp],eax
 006B210A    mov         dword ptr [esp+4],eax
>006B210E    jmp         006B265A
 006B2113    push        54
 006B2115    lea         eax,[esp+0C]
 006B2119    push        eax
 006B211A    mov         eax,ebx
 006B211C    call        TMidiValue.GetOutDevice
 006B2121    push        eax
 006B2122    call        winmm.midiOutGetDevCapsW
 006B2127    test        eax,eax
>006B2129    jne         006B214F
 006B212B    mov         eax,dword ptr [esp+0C]
 006B212F    mov         dword ptr [esp+0A8],eax
 006B2136    xor         eax,eax
 006B2138    mov         dword ptr [esp+0AC],eax
 006B213F    fild        qword ptr [esp+0A8]
 006B2146    fstp        qword ptr [esp]
 006B2149    wait
>006B214A    jmp         006B265A
 006B214F    xor         eax,eax
 006B2151    mov         dword ptr [esp],eax
 006B2154    mov         dword ptr [esp+4],eax
>006B2158    jmp         006B265A
 006B215D    xor         eax,eax
 006B215F    mov         dword ptr [esp],eax
 006B2162    mov         dword ptr [esp+4],3FF00000
>006B216A    jmp         006B265A
 006B216F    push        54
 006B2171    lea         eax,[esp+0C]
 006B2175    push        eax
 006B2176    mov         eax,ebx
 006B2178    call        TMidiValue.GetOutDevice
 006B217D    push        eax
 006B217E    call        winmm.midiOutGetDevCapsW
 006B2183    test        eax,eax
>006B2185    jne         006B21A3
 006B2187    movzx       eax,word ptr [esp+50]
 006B218C    mov         dword ptr [esp+0B0],eax
 006B2193    fild        dword ptr [esp+0B0]
 006B219A    fstp        qword ptr [esp]
 006B219D    wait
>006B219E    jmp         006B265A
 006B21A3    xor         eax,eax
 006B21A5    mov         dword ptr [esp],eax
 006B21A8    mov         dword ptr [esp+4],eax
>006B21AC    jmp         006B265A
 006B21B1    mov         eax,ebx
 006B21B3    call        TMidiValue.GetChannel
 006B21B8    mov         dword ptr [esp+0B0],eax
 006B21BF    fild        dword ptr [esp+0B0]
 006B21C6    fstp        qword ptr [esp]
 006B21C9    wait
>006B21CA    jmp         006B265A
 006B21CF    mov         eax,ebx
 006B21D1    call        TMidiValue.GetOutDevice
 006B21D6    inc         eax
 006B21D7    mov         dword ptr [esp+0B0],eax
 006B21DE    fild        dword ptr [esp+0B0]
 006B21E5    fstp        qword ptr [esp]
 006B21E8    wait
>006B21E9    jmp         006B265A
 006B21EE    mov         eax,ebx
 006B21F0    call        TMidiValue.GetInDevice
 006B21F5    inc         eax
 006B21F6    mov         dword ptr [esp+0B0],eax
 006B21FD    fild        dword ptr [esp+0B0]
 006B2204    fstp        qword ptr [esp]
 006B2207    wait
>006B2208    jmp         006B265A
 006B220D    xor         eax,eax
 006B220F    mov         dword ptr [esp],eax
 006B2212    mov         dword ptr [esp+4],eax
>006B2216    jmp         006B265A
 006B221B    xor         eax,eax
 006B221D    mov         dword ptr [esp],eax
 006B2220    mov         dword ptr [esp+4],eax
>006B2224    jmp         006B265A
 006B2229    mov         esi,dword ptr ds:[81EDD4];gvar_0081EDD4:TObjectList
 006B222F    mov         eax,ebx
 006B2231    call        TMidiValue.GetInDevice
 006B2236    mov         edi,eax
 006B2238    mov         edx,edi
 006B223A    mov         eax,esi
 006B223C    call        TList.Get
 006B2241    mov         esi,eax
 006B2243    mov         eax,esi
 006B2245    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B224B    call        @AsClass
 006B2250    mov         esi,eax
 006B2252    mov         eax,dword ptr [ebx+24];TMidiValue.Item:Integer
 006B2255    mov         edx,eax
 006B2257    cmp         edx,2E0
>006B225D    jg          006B22F8
>006B2263    je          006B25DC
 006B2269    cmp         edx,2DA
>006B226F    jg          006B22CE
>006B2271    je          006B252C
 006B2277    cmp         edx,0A0
>006B227D    jge         006B2299
 006B227F    sub         edx,80
>006B2285    jb          006B2372
 006B228B    sub         edx,20
>006B228E    jb          006B23A9
>006B2294    jmp         006B2651
 006B2299    add         edx,0FFFFFF60
 006B229F    sub         edx,80
>006B22A5    jb          006B2490
 006B22AB    add         edx,0FFFFFF90
 006B22AE    sub         edx,80
>006B22B4    jb          006B24BB
 006B22BA    add         edx,0FFFFFFB8
 006B22BD    sub         edx,80
>006B22C3    jb          006B24F2
>006B22C9    jmp         006B2651
 006B22CE    add         edx,0FFFFFD25
 006B22D4    cmp         edx,4
>006B22D7    ja          006B2651
 006B22DD    jmp         dword ptr [edx*4+6B22E4]
 006B22DD    dd          006B2558
 006B22DD    dd          006B25A5
 006B22DD    dd          006B257F
 006B22DD    dd          006B25D1
 006B22DD    dd          006B25E7
 006B22F8    cmp         edx,2EB
>006B22FE    jg          006B2344
>006B2300    je          006B23F8
 006B2306    add         edx,0FFFFFD1F
 006B230C    cmp         edx,9
>006B230F    ja          006B2651
 006B2315    jmp         dword ptr [edx*4+6B231C]
 006B2315    dd          006B25F2
 006B2315    dd          006B2651
 006B2315    dd          006B2651
 006B2315    dd          006B2651
 006B2315    dd          006B2651
 006B2315    dd          006B2651
 006B2315    dd          006B2601
 006B2315    dd          006B260E
 006B2315    dd          006B261D
 006B2315    dd          006B2628
 006B2344    sub         edx,2EC
>006B234A    je          006B241E
 006B2350    dec         edx
>006B2351    je          006B2444
 006B2357    dec         edx
>006B2358    je          006B246A
 006B235E    add         edx,0FFFFFFCE
 006B2361    sub         edx,80
>006B2367    jb          006B2633
>006B236D    jmp         006B2651
 006B2372    mov         edi,eax
 006B2374    sub         edi,0
 006B2377    mov         eax,ebx
 006B2379    call        TMidiValue.GetChannel
 006B237E    shl         eax,4
 006B2381    lea         eax,[esi+eax*8]
 006B2384    movzx       eax,byte ptr [eax+edi+0F90]
 006B238C    mov         dword ptr [esp+0B0],eax
 006B2393    fild        dword ptr [esp+0B0]
 006B239A    fdiv        dword ptr ds:[6B2668];127:Single
 006B23A0    fstp        qword ptr [esp]
 006B23A3    wait
>006B23A4    jmp         006B265A
 006B23A9    mov         edi,eax
 006B23AB    sub         edi,80
 006B23B1    mov         eax,ebx
 006B23B3    call        TMidiValue.GetChannel
 006B23B8    mov         edx,eax
 006B23BA    shl         edx,4
 006B23BD    lea         edx,[esi+edx*8]
 006B23C0    movzx       edx,byte ptr [edx+edi+0F90]
 006B23C8    shl         edx,7
 006B23CB    shl         eax,4
 006B23CE    lea         eax,[esi+eax*8]
 006B23D1    movzx       eax,byte ptr [eax+edi+0FB0]
 006B23D9    add         edx,eax
 006B23DB    mov         dword ptr [esp+0B0],edx
 006B23E2    fild        dword ptr [esp+0B0]
 006B23E9    fdiv        dword ptr ds:[6B266C];16383:Single
 006B23EF    fstp        qword ptr [esp]
 006B23F2    wait
>006B23F3    jmp         006B265A
 006B23F8    mov         eax,ebx
 006B23FA    call        TMidiValue.GetChannel
 006B23FF    movsx       eax,byte ptr [esi+eax+1859]
 006B2407    mov         dword ptr [esp+0B0],eax
 006B240E    fild        dword ptr [esp+0B0]
 006B2415    fstp        qword ptr [esp]
 006B2418    wait
>006B2419    jmp         006B265A
 006B241E    mov         eax,ebx
 006B2420    call        TMidiValue.GetChannel
 006B2425    movsx       eax,byte ptr [esi+eax+1869]
 006B242D    mov         dword ptr [esp+0B0],eax
 006B2434    fild        dword ptr [esp+0B0]
 006B243B    fstp        qword ptr [esp]
 006B243E    wait
>006B243F    jmp         006B265A
 006B2444    mov         eax,ebx
 006B2446    call        TMidiValue.GetChannel
 006B244B    movsx       eax,byte ptr [esi+eax+1879]
 006B2453    mov         dword ptr [esp+0B0],eax
 006B245A    fild        dword ptr [esp+0B0]
 006B2461    fstp        qword ptr [esp]
 006B2464    wait
>006B2465    jmp         006B265A
 006B246A    mov         eax,ebx
 006B246C    call        TMidiValue.GetChannel
 006B2471    movsx       eax,byte ptr [esi+eax+1889]
 006B2479    mov         dword ptr [esp+0B0],eax
 006B2480    fild        dword ptr [esp+0B0]
 006B2487    fstp        qword ptr [esp]
 006B248A    wait
>006B248B    jmp         006B265A
 006B2490    mov         edi,eax
 006B2492    sub         edi,0A0
 006B2498    mov         eax,ebx
 006B249A    call        TMidiValue.GetChannel
 006B249F    shl         eax,4
 006B24A2    lea         eax,[esi+eax*8]
 006B24A5    cmp         byte ptr [eax+edi-70],0
 006B24AA    seta        al
 006B24AD    call        00686074
 006B24B2    fstp        qword ptr [esp]
 006B24B5    wait
>006B24B6    jmp         006B265A
 006B24BB    mov         edi,eax
 006B24BD    sub         edi,190
 006B24C3    mov         eax,ebx
 006B24C5    call        TMidiValue.GetChannel
 006B24CA    shl         eax,4
 006B24CD    lea         eax,[esi+eax*8]
 006B24D0    movzx       eax,byte ptr [eax+edi-70]
 006B24D5    mov         dword ptr [esp+0B0],eax
 006B24DC    fild        dword ptr [esp+0B0]
 006B24E3    fdiv        dword ptr ds:[6B2668];127:Single
 006B24E9    fstp        qword ptr [esp]
 006B24EC    wait
>006B24ED    jmp         006B265A
 006B24F2    mov         edi,eax
 006B24F4    sub         edi,258
 006B24FA    mov         eax,ebx
 006B24FC    call        TMidiValue.GetChannel
 006B2501    shl         eax,4
 006B2504    lea         eax,[esi+eax*8]
 006B2507    movzx       eax,byte ptr [eax+edi+790]
 006B250F    mov         dword ptr [esp+0B0],eax
 006B2516    fild        dword ptr [esp+0B0]
 006B251D    fdiv        dword ptr ds:[6B2668];127:Single
 006B2523    fstp        qword ptr [esp]
 006B2526    wait
>006B2527    jmp         006B265A
 006B252C    mov         eax,ebx
 006B252E    call        TMidiValue.GetChannel
 006B2533    movzx       eax,byte ptr [esi+eax+180F]
 006B253B    mov         dword ptr [esp+0B0],eax
 006B2542    fild        dword ptr [esp+0B0]
 006B2549    fdiv        dword ptr ds:[6B2668];127:Single
 006B254F    fstp        qword ptr [esp]
 006B2552    wait
>006B2553    jmp         006B265A
 006B2558    mov         eax,ebx
 006B255A    call        TMidiValue.GetChannel
 006B255F    movzx       eax,byte ptr [esi+eax+181F]
 006B2567    inc         eax
 006B2568    mov         dword ptr [esp+0B0],eax
 006B256F    fild        dword ptr [esp+0B0]
 006B2576    fstp        qword ptr [esp]
 006B2579    wait
>006B257A    jmp         006B265A
 006B257F    mov         eax,ebx
 006B2581    call        TMidiValue.GetChannel
 006B2586    movzx       eax,byte ptr [esi+eax+181F]
 006B258E    mov         dword ptr [esp+0B0],eax
 006B2595    fild        dword ptr [esp+0B0]
 006B259C    fstp        qword ptr [esp]
 006B259F    wait
>006B25A0    jmp         006B265A
 006B25A5    mov         eax,ebx
 006B25A7    call        TMidiValue.GetChannel
 006B25AC    movzx       eax,word ptr [esi+eax*2+182E]
 006B25B4    mov         dword ptr [esp+0B0],eax
 006B25BB    fild        dword ptr [esp+0B0]
 006B25C2    fdiv        dword ptr ds:[6B266C];16383:Single
 006B25C8    fstp        qword ptr [esp]
 006B25CB    wait
>006B25CC    jmp         006B265A
 006B25D1    xor         eax,eax
 006B25D3    mov         dword ptr [esp],eax
 006B25D6    mov         dword ptr [esp+4],eax
>006B25DA    jmp         006B265A
 006B25DC    xor         eax,eax
 006B25DE    mov         dword ptr [esp],eax
 006B25E1    mov         dword ptr [esp+4],eax
>006B25E5    jmp         006B265A
 006B25E7    xor         eax,eax
 006B25E9    mov         dword ptr [esp],eax
 006B25EC    mov         dword ptr [esp+4],eax
>006B25F0    jmp         006B265A
 006B25F2    xor         eax,eax
 006B25F4    mov         dword ptr [esp],eax
 006B25F7    mov         dword ptr [esp+4],40000000
>006B25FF    jmp         006B265A
 006B2601    xor         eax,eax
 006B2603    call        00686074
 006B2608    fstp        qword ptr [esp]
 006B260B    wait
>006B260C    jmp         006B265A
 006B260E    xor         eax,eax
 006B2610    mov         dword ptr [esp],eax
 006B2613    mov         dword ptr [esp+4],3FF00000
>006B261B    jmp         006B265A
 006B261D    xor         eax,eax
 006B261F    mov         dword ptr [esp],eax
 006B2622    mov         dword ptr [esp+4],eax
>006B2626    jmp         006B265A
 006B2628    xor         eax,eax
 006B262A    mov         dword ptr [esp],eax
 006B262D    mov         dword ptr [esp+4],eax
>006B2631    jmp         006B265A
 006B2633    mov         edi,eax
 006B2635    sub         edi,320
 006B263B    cmp         byte ptr [esi+edi+490],0
 006B2643    seta        al
 006B2646    call        00686074
 006B264B    fstp        qword ptr [esp]
 006B264E    wait
>006B264F    jmp         006B265A
 006B2651    xor         eax,eax
 006B2653    mov         dword ptr [esp],eax
 006B2656    mov         dword ptr [esp+4],eax
 006B265A    fld         qword ptr [esp]
 006B265D    add         esp,0B4
 006B2663    pop         edi
 006B2664    pop         esi
 006B2665    pop         ebx
 006B2666    ret
*}
end;

//006B2670
function TMidiValue.SendLongMessage(Message:Pointer; Size:Cardinal):Boolean;
begin
{*
 006B2670    push        ebx
 006B2671    push        esi
 006B2672    push        edi
 006B2673    push        ebp
 006B2674    mov         ebp,ecx
 006B2676    mov         edi,edx
 006B2678    mov         ebx,eax
 006B267A    mov         esi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B2680    mov         eax,ebx
 006B2682    call        TMidiValue.GetOutDevice
 006B2687    inc         eax
 006B2688    mov         ebx,eax
 006B268A    mov         edx,ebx
 006B268C    mov         eax,esi
 006B268E    call        TList.Get
 006B2693    mov         ebx,eax
 006B2695    mov         eax,ebx
 006B2697    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B269D    call        @AsClass
 006B26A2    mov         ecx,ebp
 006B26A4    mov         edx,edi
 006B26A6    call        TMidiDevice.SendLongMessage
 006B26AB    mov         al,1
 006B26AD    pop         ebp
 006B26AE    pop         edi
 006B26AF    pop         esi
 006B26B0    pop         ebx
 006B26B1    ret
*}
end;

//006B26B4
function TMidiValue.SendMessage(Message:Cardinal):Boolean;
begin
{*
 006B26B4    push        ebx
 006B26B5    push        esi
 006B26B6    push        edi
 006B26B7    mov         edi,edx
 006B26B9    mov         ebx,eax
 006B26BB    mov         esi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B26C1    mov         eax,ebx
 006B26C3    call        TMidiValue.GetOutDevice
 006B26C8    inc         eax
 006B26C9    mov         ebx,eax
 006B26CB    mov         edx,ebx
 006B26CD    mov         eax,esi
 006B26CF    call        TList.Get
 006B26D4    mov         ebx,eax
 006B26D6    mov         eax,ebx
 006B26D8    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B26DE    call        @AsClass
 006B26E3    mov         edx,edi
 006B26E5    call        TMidiDevice.SendMessage
 006B26EA    mov         al,1
 006B26EC    pop         edi
 006B26ED    pop         esi
 006B26EE    pop         ebx
 006B26EF    ret
*}
end;

//006B26F0
procedure TMidiValue.SetControl(Control:Integer; Value:Integer);
begin
{*
 006B26F0    push        ebx
 006B26F1    push        esi
 006B26F2    push        edi
 006B26F3    mov         edi,ecx
 006B26F5    mov         esi,edx
 006B26F7    mov         ebx,eax
 006B26F9    mov         eax,ebx
 006B26FB    call        TMidiValue.GetChannel
 006B2700    mov         ecx,edi
 006B2702    mov         edx,esi
 006B2704    call        006A8348
 006B2709    mov         edx,eax
 006B270B    mov         eax,ebx
 006B270D    call        TMidiValue.SendMessage
 006B2712    pop         edi
 006B2713    pop         esi
 006B2714    pop         ebx
 006B2715    ret
*}
end;

//006B2718
procedure TMidiValue.SetNote(Note:Integer; OnOff:Boolean);
begin
{*
 006B2718    push        ebx
 006B2719    push        esi
 006B271A    mov         esi,edx
 006B271C    mov         ebx,eax
 006B271E    test        esi,esi
>006B2720    jl          006B2727
 006B2722    cmp         esi,7F
>006B2725    jle         006B272C
 006B2727    mov         al,1
 006B2729    pop         esi
 006B272A    pop         ebx
 006B272B    ret
 006B272C    test        cl,cl
>006B272E    je          006B274E
 006B2730    mov         eax,ebx
 006B2732    call        TMidiValue.GetChannel
 006B2737    mov         ecx,40
 006B273C    mov         edx,esi
 006B273E    call        006A81B8
 006B2743    mov         edx,eax
 006B2745    mov         eax,ebx
 006B2747    call        TMidiValue.SendMessage
>006B274C    jmp         006B276A
 006B274E    mov         eax,ebx
 006B2750    call        TMidiValue.GetChannel
 006B2755    mov         ecx,40
 006B275A    mov         edx,esi
 006B275C    call        006A81F0
 006B2761    mov         edx,eax
 006B2763    mov         eax,ebx
 006B2765    call        TMidiValue.SendMessage
 006B276A    pop         esi
 006B276B    pop         ebx
 006B276C    ret
*}
end;

//006B2770
procedure TMidiValue.SetNoteVelocity(Note:Integer; Velocity:Integer);
begin
{*
 006B2770    push        ebx
 006B2771    push        esi
 006B2772    push        edi
 006B2773    mov         edi,ecx
 006B2775    mov         esi,edx
 006B2777    mov         ebx,eax
 006B2779    test        esi,esi
>006B277B    jl          006B2782
 006B277D    cmp         esi,7F
>006B2780    jle         006B2786
 006B2782    mov         al,1
>006B2784    jmp         006B279F
 006B2786    mov         eax,ebx
 006B2788    call        TMidiValue.GetChannel
 006B278D    mov         ecx,edi
 006B278F    mov         edx,esi
 006B2791    call        006A81B8
 006B2796    mov         edx,eax
 006B2798    mov         eax,ebx
 006B279A    call        TMidiValue.SendMessage
 006B279F    pop         edi
 006B27A0    pop         esi
 006B27A1    pop         ebx
 006B27A2    ret
*}
end;

//006B27A4
{*function TMidiValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006B27A4    push        ebp
 006B27A5    mov         ebp,esp
 006B27A7    add         esp,0FFFFFFE0
 006B27AA    push        ebx
 006B27AB    push        esi
 006B27AC    push        edi
 006B27AD    mov         esi,eax
 006B27AF    cmp         byte ptr [esi+10],0;TMidiValue.Iffy:Boolean
>006B27B3    jne         006B2809
 006B27B5    fld         qword ptr [ebp+8]
 006B27B8    fcomp       qword ptr [esi+8];TMidiValue.PreviousValue:Double
 006B27BB    wait
 006B27BC    fnstsw      al
 006B27BE    sahf
>006B27BF    jne         006B27DB
 006B27C1    mov         edx,dword ptr [esi+24];TMidiValue.Item:Integer
 006B27C4    cmp         edx,2EB
>006B27CA    jl          006B27D4
 006B27CC    cmp         edx,2EE
>006B27D2    jle         006B27DB
 006B27D4    mov         bl,1
>006B27D6    jmp         006B30BC
 006B27DB    mov         eax,esi
 006B27DD    mov         edx,dword ptr [eax]
 006B27DF    call        dword ptr [edx+44];TMidiValue.GetDataType
 006B27E2    cmp         al,3
>006B27E4    jne         006B2809
 006B27E6    push        dword ptr [ebp+0C]
 006B27E9    push        dword ptr [ebp+8]
 006B27EC    call        00686060
 006B27F1    mov         ebx,eax
 006B27F3    push        dword ptr [esi+0C];TMidiValue.?fC:dword
 006B27F6    push        dword ptr [esi+8];TMidiValue.PreviousValue:Double
 006B27F9    call        00686060
 006B27FE    cmp         bl,al
>006B2800    jne         006B2809
 006B2802    mov         bl,1
>006B2804    jmp         006B30BC
 006B2809    mov         bl,1
 006B280B    mov         edi,dword ptr [esi+24];TMidiValue.Item:Integer
 006B280E    mov         eax,edi
 006B2810    cmp         eax,2E1
>006B2815    jg          006B28AE
>006B281B    je          006B3015
 006B2821    cmp         eax,2DB
>006B2826    jg          006B2885
>006B2828    je          006B2C93
 006B282E    cmp         eax,190
>006B2833    jge         006B2859
 006B2835    sub         eax,80
>006B283A    jb          006B2922
 006B2840    sub         eax,20
>006B2843    jb          006B2943
 006B2849    sub         eax,80
>006B284E    jb          006B29B6
>006B2854    jmp         006B308D
 006B2859    add         eax,0FFFFFE70
 006B285E    sub         eax,80
>006B2863    jb          006B2C6F
 006B2869    add         eax,0FFFFFFB8
 006B286C    sub         eax,80
>006B2871    jb          006B2D38
 006B2877    sub         eax,2
>006B287A    je          006B2CE0
>006B2880    jmp         006B308D
 006B2885    add         eax,0FFFFFD24
 006B288A    cmp         eax,4
>006B288D    ja          006B308D
 006B2893    jmp         dword ptr [eax*4+6B289A]
 006B2893    dd          006B2D0C
 006B2893    dd          006B2CBA
 006B2893    dd          006B2E57
 006B2893    dd          006B2F16
 006B2893    dd          006B2F91
 006B28AE    cmp         eax,2E9
>006B28B3    jg          006B28E4
>006B28B5    je          006B2E18
 006B28BB    add         eax,0FFFFFD1C
 006B28C0    cmp         eax,4
>006B28C3    ja          006B308D
 006B28C9    jmp         dword ptr [eax*4+6B28D0]
 006B28C9    dd          006B2D7F
 006B28C9    dd          006B2D92
 006B28C9    dd          006B2D6D
 006B28C9    dd          006B2DA5
 006B28C9    dd          006B2DDB
 006B28E4    cmp         eax,2ED
>006B28E9    jg          006B2908
>006B28EB    je          006B2B23
 006B28F1    sub         eax,2EB
>006B28F6    je          006B29D7
 006B28FC    dec         eax
>006B28FD    je          006B2A7D
>006B2903    jmp         006B308D
 006B2908    sub         eax,2EE
>006B290D    je          006B2BC9
 006B2913    add         eax,0FFFFFFCE
 006B2916    sub         eax,80
>006B291B    jb          006B298D
>006B291D    jmp         006B308D
 006B2922    fld         qword ptr [ebp+8]
 006B2925    fmul        dword ptr ds:[6B30C8];127:Single
 006B292B    call        @ROUND
 006B2930    mov         ecx,eax
 006B2932    mov         edx,edi
 006B2934    sub         edx,0
 006B2937    mov         eax,esi
 006B2939    call        TMidiValue.SetControl
>006B293E    jmp         006B308F
 006B2943    fld         qword ptr [ebp+8]
 006B2946    fmul        dword ptr ds:[6B30C8];127:Single
 006B294C    call        @ROUND
 006B2951    mov         ecx,eax
 006B2953    mov         edx,edi
 006B2955    sub         edx,80
 006B295B    mov         eax,esi
 006B295D    call        TMidiValue.SetControl
 006B2962    fld         qword ptr [ebp+8]
 006B2965    fmul        dword ptr ds:[6B30CC];16383:Single
 006B296B    call        @ROUND
 006B2970    mov         ecx,eax
 006B2972    and         ecx,7F
 006B2975    mov         edx,dword ptr [esi+24];TMidiValue.Item:Integer
 006B2978    add         edx,20
 006B297B    sub         edx,80
 006B2981    mov         eax,esi
 006B2983    call        TMidiValue.SetControl
>006B2988    jmp         006B308F
 006B298D    mov         dword ptr [esi+20],0A;TMidiValue.ChannelNumber:Integer
 006B2994    push        dword ptr [ebp+0C]
 006B2997    push        dword ptr [ebp+8]
 006B299A    call        00686060
 006B299F    mov         ecx,eax
 006B29A1    mov         edx,dword ptr [esi+24];TMidiValue.Item:Integer
 006B29A4    sub         edx,320
 006B29AA    mov         eax,esi
 006B29AC    call        TMidiValue.SetNote
>006B29B1    jmp         006B308F
 006B29B6    push        dword ptr [ebp+0C]
 006B29B9    push        dword ptr [ebp+8]
 006B29BC    call        00686060
 006B29C1    mov         ecx,eax
 006B29C3    mov         edx,edi
 006B29C5    sub         edx,0A0
 006B29CB    mov         eax,esi
 006B29CD    call        TMidiValue.SetNote
>006B29D2    jmp         006B308F
 006B29D7    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B29DD    mov         eax,esi
 006B29DF    call        TMidiValue.GetOutDevice
 006B29E4    inc         eax
 006B29E5    mov         dword ptr [ebp-4],eax
 006B29E8    mov         edx,dword ptr [ebp-4]
 006B29EB    mov         eax,edi
 006B29ED    call        TList.Get
 006B29F2    mov         edi,eax
 006B29F4    mov         eax,edi
 006B29F6    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B29FC    call        @AsClass
 006B2A01    mov         edi,eax
 006B2A03    mov         eax,esi
 006B2A05    call        TMidiValue.GetChannel
 006B2A0A    movsx       eax,byte ptr [edi+eax+1859]
 006B2A12    cdq
 006B2A13    push        edx
 006B2A14    push        eax
 006B2A15    fld         qword ptr [ebp+8]
 006B2A18    call        @ROUND
 006B2A1D    cmp         edx,dword ptr [esp+4]
>006B2A21    jne         006B2A26
 006B2A23    cmp         eax,dword ptr [esp]
 006B2A26    pop         edx
 006B2A27    pop         eax
>006B2A28    je          006B308F
 006B2A2E    mov         eax,esi
 006B2A30    call        TMidiValue.GetChannel
 006B2A35    movsx       edx,byte ptr [edi+eax+1859]
 006B2A3D    xor         ecx,ecx
 006B2A3F    mov         eax,esi
 006B2A41    call        TMidiValue.SetNote
 006B2A46    mov         eax,esi
 006B2A48    call        TMidiValue.GetChannel
 006B2A4D    lea         eax,[edi+eax+1859]
 006B2A54    push        eax
 006B2A55    fld         qword ptr [ebp+8]
 006B2A58    call        @ROUND
 006B2A5D    pop         edx
 006B2A5E    mov         byte ptr [edx],al
 006B2A60    mov         eax,esi
 006B2A62    call        TMidiValue.GetChannel
 006B2A67    movsx       edx,byte ptr [edi+eax+1859]
 006B2A6F    mov         cl,1
 006B2A71    mov         eax,esi
 006B2A73    call        TMidiValue.SetNote
>006B2A78    jmp         006B308F
 006B2A7D    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B2A83    mov         eax,esi
 006B2A85    call        TMidiValue.GetOutDevice
 006B2A8A    inc         eax
 006B2A8B    mov         dword ptr [ebp-8],eax
 006B2A8E    mov         edx,dword ptr [ebp-8]
 006B2A91    mov         eax,edi
 006B2A93    call        TList.Get
 006B2A98    mov         edi,eax
 006B2A9A    mov         eax,edi
 006B2A9C    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B2AA2    call        @AsClass
 006B2AA7    mov         edi,eax
 006B2AA9    mov         eax,esi
 006B2AAB    call        TMidiValue.GetChannel
 006B2AB0    movsx       eax,byte ptr [edi+eax+1869]
 006B2AB8    cdq
 006B2AB9    push        edx
 006B2ABA    push        eax
 006B2ABB    fld         qword ptr [ebp+8]
 006B2ABE    call        @ROUND
 006B2AC3    cmp         edx,dword ptr [esp+4]
>006B2AC7    jne         006B2ACC
 006B2AC9    cmp         eax,dword ptr [esp]
 006B2ACC    pop         edx
 006B2ACD    pop         eax
>006B2ACE    je          006B308F
 006B2AD4    mov         eax,esi
 006B2AD6    call        TMidiValue.GetChannel
 006B2ADB    movsx       edx,byte ptr [edi+eax+1869]
 006B2AE3    xor         ecx,ecx
 006B2AE5    mov         eax,esi
 006B2AE7    call        TMidiValue.SetNote
 006B2AEC    mov         eax,esi
 006B2AEE    call        TMidiValue.GetChannel
 006B2AF3    lea         eax,[edi+eax+1869]
 006B2AFA    push        eax
 006B2AFB    fld         qword ptr [ebp+8]
 006B2AFE    call        @ROUND
 006B2B03    pop         edx
 006B2B04    mov         byte ptr [edx],al
 006B2B06    mov         eax,esi
 006B2B08    call        TMidiValue.GetChannel
 006B2B0D    movsx       edx,byte ptr [edi+eax+1869]
 006B2B15    mov         cl,1
 006B2B17    mov         eax,esi
 006B2B19    call        TMidiValue.SetNote
>006B2B1E    jmp         006B308F
 006B2B23    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B2B29    mov         eax,esi
 006B2B2B    call        TMidiValue.GetOutDevice
 006B2B30    inc         eax
 006B2B31    mov         dword ptr [ebp-0C],eax
 006B2B34    mov         edx,dword ptr [ebp-0C]
 006B2B37    mov         eax,edi
 006B2B39    call        TList.Get
 006B2B3E    mov         edi,eax
 006B2B40    mov         eax,edi
 006B2B42    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B2B48    call        @AsClass
 006B2B4D    mov         edi,eax
 006B2B4F    mov         eax,esi
 006B2B51    call        TMidiValue.GetChannel
 006B2B56    movsx       eax,byte ptr [edi+eax+1879]
 006B2B5E    cdq
 006B2B5F    push        edx
 006B2B60    push        eax
 006B2B61    fld         qword ptr [ebp+8]
 006B2B64    call        @ROUND
 006B2B69    cmp         edx,dword ptr [esp+4]
>006B2B6D    jne         006B2B72
 006B2B6F    cmp         eax,dword ptr [esp]
 006B2B72    pop         edx
 006B2B73    pop         eax
>006B2B74    je          006B308F
 006B2B7A    mov         eax,esi
 006B2B7C    call        TMidiValue.GetChannel
 006B2B81    movsx       edx,byte ptr [edi+eax+1879]
 006B2B89    xor         ecx,ecx
 006B2B8B    mov         eax,esi
 006B2B8D    call        TMidiValue.SetNote
 006B2B92    mov         eax,esi
 006B2B94    call        TMidiValue.GetChannel
 006B2B99    lea         eax,[edi+eax+1879]
 006B2BA0    push        eax
 006B2BA1    fld         qword ptr [ebp+8]
 006B2BA4    call        @ROUND
 006B2BA9    pop         edx
 006B2BAA    mov         byte ptr [edx],al
 006B2BAC    mov         eax,esi
 006B2BAE    call        TMidiValue.GetChannel
 006B2BB3    movsx       edx,byte ptr [edi+eax+1879]
 006B2BBB    mov         cl,1
 006B2BBD    mov         eax,esi
 006B2BBF    call        TMidiValue.SetNote
>006B2BC4    jmp         006B308F
 006B2BC9    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B2BCF    mov         eax,esi
 006B2BD1    call        TMidiValue.GetOutDevice
 006B2BD6    inc         eax
 006B2BD7    mov         dword ptr [ebp-10],eax
 006B2BDA    mov         edx,dword ptr [ebp-10]
 006B2BDD    mov         eax,edi
 006B2BDF    call        TList.Get
 006B2BE4    mov         edi,eax
 006B2BE6    mov         eax,edi
 006B2BE8    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B2BEE    call        @AsClass
 006B2BF3    mov         edi,eax
 006B2BF5    mov         eax,esi
 006B2BF7    call        TMidiValue.GetChannel
 006B2BFC    movsx       eax,byte ptr [edi+eax+1889]
 006B2C04    cdq
 006B2C05    push        edx
 006B2C06    push        eax
 006B2C07    fld         qword ptr [ebp+8]
 006B2C0A    call        @ROUND
 006B2C0F    cmp         edx,dword ptr [esp+4]
>006B2C13    jne         006B2C18
 006B2C15    cmp         eax,dword ptr [esp]
 006B2C18    pop         edx
 006B2C19    pop         eax
>006B2C1A    je          006B308F
 006B2C20    mov         eax,esi
 006B2C22    call        TMidiValue.GetChannel
 006B2C27    movsx       edx,byte ptr [edi+eax+1889]
 006B2C2F    xor         ecx,ecx
 006B2C31    mov         eax,esi
 006B2C33    call        TMidiValue.SetNote
 006B2C38    mov         eax,esi
 006B2C3A    call        TMidiValue.GetChannel
 006B2C3F    lea         eax,[edi+eax+1889]
 006B2C46    push        eax
 006B2C47    fld         qword ptr [ebp+8]
 006B2C4A    call        @ROUND
 006B2C4F    pop         edx
 006B2C50    mov         byte ptr [edx],al
 006B2C52    mov         eax,esi
 006B2C54    call        TMidiValue.GetChannel
 006B2C59    movsx       edx,byte ptr [edi+eax+1889]
 006B2C61    mov         cl,1
 006B2C63    mov         eax,esi
 006B2C65    call        TMidiValue.SetNote
>006B2C6A    jmp         006B308F
 006B2C6F    fld         qword ptr [ebp+8]
 006B2C72    fmul        dword ptr ds:[6B30C8];127:Single
 006B2C78    call        @ROUND
 006B2C7D    mov         ecx,eax
 006B2C7F    mov         edx,edi
 006B2C81    sub         edx,190
 006B2C87    mov         eax,esi
 006B2C89    call        TMidiValue.SetNoteVelocity
>006B2C8E    jmp         006B308F
 006B2C93    mov         eax,esi
 006B2C95    call        TMidiValue.GetChannel
 006B2C9A    push        eax
 006B2C9B    fld         qword ptr [ebp+8]
 006B2C9E    call        @ROUND
 006B2CA3    mov         edx,eax
 006B2CA5    dec         edx
 006B2CA6    pop         eax
 006B2CA7    call        006A82A0
 006B2CAC    mov         edx,eax
 006B2CAE    mov         eax,esi
 006B2CB0    call        TMidiValue.SendMessage
>006B2CB5    jmp         006B308F
 006B2CBA    mov         eax,esi
 006B2CBC    call        TMidiValue.GetChannel
 006B2CC1    push        eax
 006B2CC2    fld         qword ptr [ebp+8]
 006B2CC5    call        @ROUND
 006B2CCA    mov         edx,eax
 006B2CCC    pop         eax
 006B2CCD    call        006A82A0
 006B2CD2    mov         edx,eax
 006B2CD4    mov         eax,esi
 006B2CD6    call        TMidiValue.SendMessage
>006B2CDB    jmp         006B308F
 006B2CE0    mov         eax,esi
 006B2CE2    call        TMidiValue.GetChannel
 006B2CE7    push        eax
 006B2CE8    fld         qword ptr [ebp+8]
 006B2CEB    fmul        dword ptr ds:[6B30C8];127:Single
 006B2CF1    call        @ROUND
 006B2CF6    mov         edx,eax
 006B2CF8    pop         eax
 006B2CF9    call        006A827C
 006B2CFE    mov         edx,eax
 006B2D00    mov         eax,esi
 006B2D02    call        TMidiValue.SendMessage
>006B2D07    jmp         006B308F
 006B2D0C    mov         eax,esi
 006B2D0E    call        TMidiValue.GetChannel
 006B2D13    push        eax
 006B2D14    fld         qword ptr [ebp+8]
 006B2D17    fmul        dword ptr ds:[6B30CC];16383:Single
 006B2D1D    call        @ROUND
 006B2D22    mov         edx,eax
 006B2D24    pop         eax
 006B2D25    call        006A830C
 006B2D2A    mov         edx,eax
 006B2D2C    mov         eax,esi
 006B2D2E    call        TMidiValue.SendMessage
>006B2D33    jmp         006B308F
 006B2D38    mov         eax,esi
 006B2D3A    call        TMidiValue.GetChannel
 006B2D3F    push        eax
 006B2D40    fld         qword ptr [ebp+8]
 006B2D43    fmul        dword ptr ds:[6B30C8];127:Single
 006B2D49    call        @ROUND
 006B2D4E    mov         ecx,eax
 006B2D50    mov         edx,dword ptr [esi+24];TMidiValue.Item:Integer
 006B2D53    sub         edx,258
 006B2D59    pop         eax
 006B2D5A    call        006A8240
 006B2D5F    mov         edx,eax
 006B2D61    mov         eax,esi
 006B2D63    call        TMidiValue.SendMessage
>006B2D68    jmp         006B308F
 006B2D6D    fld         qword ptr [ebp+8]
 006B2D70    call        @ROUND
 006B2D75    mov         [0078BE64],eax;gvar_0078BE64
>006B2D7A    jmp         006B308F
 006B2D7F    fld         qword ptr [ebp+8]
 006B2D82    call        @ROUND
 006B2D87    dec         eax
 006B2D88    mov         [0078BE68],eax;gvar_0078BE68
>006B2D8D    jmp         006B308F
 006B2D92    fld         qword ptr [ebp+8]
 006B2D95    call        @ROUND
 006B2D9A    dec         eax
 006B2D9B    mov         [0078BE6C],eax;gvar_0078BE6C
>006B2DA0    jmp         006B308F
 006B2DA5    mov         byte ptr [ebp-20],0F0
 006B2DA9    mov         byte ptr [ebp-1F],7E
 006B2DAD    mov         byte ptr [ebp-1E],7F
 006B2DB1    mov         byte ptr [ebp-1D],9
 006B2DB5    push        dword ptr [ebp+0C]
 006B2DB8    push        dword ptr [ebp+8]
 006B2DBB    call        00686060
 006B2DC0    mov         byte ptr [ebp-1C],al
 006B2DC3    mov         byte ptr [ebp-1B],0F7
 006B2DC7    lea         edx,[ebp-20]
 006B2DCA    mov         ecx,6
 006B2DCF    mov         eax,esi
 006B2DD1    call        TMidiValue.SendLongMessage
>006B2DD6    jmp         006B308F
 006B2DDB    mov         byte ptr [ebp-20],0F0
 006B2DDF    mov         byte ptr [ebp-1F],7F
 006B2DE3    mov         byte ptr [ebp-1E],7F
 006B2DE7    mov         byte ptr [ebp-1D],4
 006B2DEB    mov         byte ptr [ebp-1C],1
 006B2DEF    push        dword ptr [ebp+0C]
 006B2DF2    push        dword ptr [ebp+8]
 006B2DF5    lea         edx,[ebp-1A]
 006B2DF8    lea         eax,[ebp-1B]
 006B2DFB    call        006A82C4
 006B2E00    mov         byte ptr [ebp-19],0F7
 006B2E04    lea         edx,[ebp-20]
 006B2E07    mov         ecx,8
 006B2E0C    mov         eax,esi
 006B2E0E    call        TMidiValue.SendLongMessage
>006B2E13    jmp         006B308F
 006B2E18    push        dword ptr [ebp+0C]
 006B2E1B    push        dword ptr [ebp+8]
 006B2E1E    call        00686060
 006B2E23    test        al,al
>006B2E25    je          006B308F
 006B2E2B    mov         byte ptr [ebp-20],0F0
 006B2E2F    mov         byte ptr [ebp-1F],7E
 006B2E33    mov         byte ptr [ebp-1E],7F
 006B2E37    mov         byte ptr [ebp-1D],6
 006B2E3B    mov         byte ptr [ebp-1C],1
 006B2E3F    mov         byte ptr [ebp-1B],0F7
 006B2E43    lea         edx,[ebp-20]
 006B2E46    mov         ecx,6
 006B2E4B    mov         eax,esi
 006B2E4D    call        TMidiValue.SendLongMessage
>006B2E52    jmp         006B308F
 006B2E57    fld         qword ptr [ebp+8]
 006B2E5A    fadd        dword ptr ds:[6B30D0];63.5:Single
 006B2E60    fmul        dword ptr ds:[6B30D4];16384:Single
 006B2E66    call        @ROUND
 006B2E6B    mov         edi,eax
 006B2E6D    xor         ecx,ecx
 006B2E6F    mov         edx,65
 006B2E74    mov         eax,esi
 006B2E76    call        TMidiValue.SetControl
 006B2E7B    mov         ecx,2
 006B2E80    mov         edx,64
 006B2E85    mov         eax,esi
 006B2E87    call        TMidiValue.SetControl
 006B2E8C    mov         ecx,edi
 006B2E8E    shr         ecx,0E
 006B2E91    mov         edx,6
 006B2E96    mov         eax,esi
 006B2E98    call        TMidiValue.SetControl
 006B2E9D    xor         ecx,ecx
 006B2E9F    mov         edx,26
 006B2EA4    mov         eax,esi
 006B2EA6    call        TMidiValue.SetControl
 006B2EAB    xor         ecx,ecx
 006B2EAD    mov         edx,65
 006B2EB2    mov         eax,esi
 006B2EB4    call        TMidiValue.SetControl
 006B2EB9    mov         ecx,1
 006B2EBE    mov         edx,64
 006B2EC3    mov         eax,esi
 006B2EC5    call        TMidiValue.SetControl
 006B2ECA    mov         ecx,edi
 006B2ECC    shr         ecx,7
 006B2ECF    and         ecx,7F
 006B2ED2    mov         edx,6
 006B2ED7    mov         eax,esi
 006B2ED9    call        TMidiValue.SetControl
 006B2EDE    mov         ecx,edi
 006B2EE0    and         ecx,7F
 006B2EE3    mov         edx,26
 006B2EE8    mov         eax,esi
 006B2EEA    call        TMidiValue.SetControl
 006B2EEF    mov         ecx,7F
 006B2EF4    mov         edx,65
 006B2EF9    mov         eax,esi
 006B2EFB    call        TMidiValue.SetControl
 006B2F00    mov         ecx,7F
 006B2F05    mov         edx,64
 006B2F0A    mov         eax,esi
 006B2F0C    call        TMidiValue.SetControl
>006B2F11    jmp         006B308F
 006B2F16    fld         qword ptr [ebp+8]
 006B2F19    fadd        dword ptr ds:[6B30D0];63.5:Single
 006B2F1F    fmul        dword ptr ds:[6B30D4];16384:Single
 006B2F25    call        @ROUND
 006B2F2A    mov         edi,eax
 006B2F2C    xor         ecx,ecx
 006B2F2E    mov         edx,65
 006B2F33    mov         eax,esi
 006B2F35    call        TMidiValue.SetControl
 006B2F3A    mov         ecx,2
 006B2F3F    mov         edx,64
 006B2F44    mov         eax,esi
 006B2F46    call        TMidiValue.SetControl
 006B2F4B    mov         ecx,edi
 006B2F4D    shr         ecx,0E
 006B2F50    mov         edx,6
 006B2F55    mov         eax,esi
 006B2F57    call        TMidiValue.SetControl
 006B2F5C    xor         ecx,ecx
 006B2F5E    mov         edx,26
 006B2F63    mov         eax,esi
 006B2F65    call        TMidiValue.SetControl
 006B2F6A    mov         ecx,7F
 006B2F6F    mov         edx,65
 006B2F74    mov         eax,esi
 006B2F76    call        TMidiValue.SetControl
 006B2F7B    mov         ecx,7F
 006B2F80    mov         edx,64
 006B2F85    mov         eax,esi
 006B2F87    call        TMidiValue.SetControl
>006B2F8C    jmp         006B308F
 006B2F91    fld         qword ptr [ebp+8]
 006B2F94    fdiv        dword ptr ds:[6B30D8];100:Single
 006B2F9A    fadd        dword ptr ds:[6B30D0];63.5:Single
 006B2FA0    fmul        dword ptr ds:[6B30D4];16384:Single
 006B2FA6    call        @ROUND
 006B2FAB    mov         edi,eax
 006B2FAD    xor         ecx,ecx
 006B2FAF    mov         edx,65
 006B2FB4    mov         eax,esi
 006B2FB6    call        TMidiValue.SetControl
 006B2FBB    mov         ecx,1
 006B2FC0    mov         edx,64
 006B2FC5    mov         eax,esi
 006B2FC7    call        TMidiValue.SetControl
 006B2FCC    mov         ecx,edi
 006B2FCE    shr         ecx,7
 006B2FD1    and         ecx,7F
 006B2FD4    mov         edx,6
 006B2FD9    mov         eax,esi
 006B2FDB    call        TMidiValue.SetControl
 006B2FE0    mov         ecx,edi
 006B2FE2    and         ecx,7F
 006B2FE5    mov         edx,26
 006B2FEA    mov         eax,esi
 006B2FEC    call        TMidiValue.SetControl
 006B2FF1    mov         ecx,7F
 006B2FF6    mov         edx,65
 006B2FFB    mov         eax,esi
 006B2FFD    call        TMidiValue.SetControl
 006B3002    mov         ecx,7F
 006B3007    mov         edx,64
 006B300C    mov         eax,esi
 006B300E    call        TMidiValue.SetControl
>006B3013    jmp         006B308F
 006B3015    fld         qword ptr [ebp+8]
 006B3018    fadd        dword ptr ds:[6B30D0];63.5:Single
 006B301E    fmul        dword ptr ds:[6B30DC];128:Single
 006B3024    call        @ROUND
 006B3029    mov         edi,eax
 006B302B    xor         ecx,ecx
 006B302D    mov         edx,65
 006B3032    mov         eax,esi
 006B3034    call        TMidiValue.SetControl
 006B3039    xor         ecx,ecx
 006B303B    mov         edx,64
 006B3040    mov         eax,esi
 006B3042    call        TMidiValue.SetControl
 006B3047    mov         ecx,edi
 006B3049    shr         ecx,7
 006B304C    mov         edx,6
 006B3051    mov         eax,esi
 006B3053    call        TMidiValue.SetControl
 006B3058    mov         ecx,edi
 006B305A    and         ecx,7F
 006B305D    mov         edx,26
 006B3062    mov         eax,esi
 006B3064    call        TMidiValue.SetControl
 006B3069    mov         ecx,7F
 006B306E    mov         edx,65
 006B3073    mov         eax,esi
 006B3075    call        TMidiValue.SetControl
 006B307A    mov         ecx,7F
 006B307F    mov         edx,64
 006B3084    mov         eax,esi
 006B3086    call        TMidiValue.SetControl
>006B308B    jmp         006B308F
 006B308D    xor         ebx,ebx
 006B308F    mov         eax,esi
 006B3091    mov         edx,dword ptr [eax]
 006B3093    call        dword ptr [edx+44];TMidiValue.GetDataType
 006B3096    cmp         al,3
>006B3098    jne         006B30B0
 006B309A    push        dword ptr [ebp+0C]
 006B309D    push        dword ptr [ebp+8]
 006B30A0    call        00686060
 006B30A5    call        00686074
 006B30AA    fstp        qword ptr [esi+8];TMidiValue.PreviousValue:Double
 006B30AD    wait
>006B30AE    jmp         006B30BC
 006B30B0    mov         eax,dword ptr [ebp+8]
 006B30B3    mov         dword ptr [esi+8],eax;TMidiValue.PreviousValue:Double
 006B30B6    mov         eax,dword ptr [ebp+0C]
 006B30B9    mov         dword ptr [esi+0C],eax;TMidiValue.?fC:dword
 006B30BC    mov         eax,ebx
 006B30BE    pop         edi
 006B30BF    pop         esi
 006B30C0    pop         ebx
 006B30C1    mov         esp,ebp
 006B30C3    pop         ebp
 006B30C4    ret         8
end;*}

//006B30E0
{*procedure TMidiValue.ToString(?:?);
begin
 006B30E0    push        ebp
 006B30E1    mov         ebp,esp
 006B30E3    push        0
 006B30E5    push        0
 006B30E7    push        0
 006B30E9    push        ebx
 006B30EA    push        esi
 006B30EB    push        edi
 006B30EC    mov         ebx,edx
 006B30EE    mov         esi,eax
 006B30F0    xor         eax,eax
 006B30F2    push        ebp
 006B30F3    push        6B318A
 006B30F8    push        dword ptr fs:[eax]
 006B30FB    mov         dword ptr fs:[eax],esp
 006B30FE    mov         eax,ebx
 006B3100    mov         edx,6B31A4;'Midi'
 006B3105    call        @UStrAsg
 006B310A    mov         edi,dword ptr [esi+1C];TMidiValue.MidiNumberOut:Integer
 006B310D    cmp         edi,0FFFFFFFF
>006B3110    jl          006B3127
 006B3112    lea         edx,[ebp-4]
 006B3115    mov         eax,edi
 006B3117    inc         eax
 006B3118    call        IntToStr
 006B311D    mov         edx,dword ptr [ebp-4]
 006B3120    mov         eax,ebx
 006B3122    call        @UStrCat
 006B3127    mov         edi,dword ptr [esi+20];TMidiValue.ChannelNumber:Integer
 006B312A    test        edi,edi
>006B312C    jle         006B314E
 006B312E    push        dword ptr [ebx]
 006B3130    push        6B31BC;'.Channel'
 006B3135    lea         edx,[ebp-8]
 006B3138    mov         eax,edi
 006B313A    call        IntToStr
 006B313F    push        dword ptr [ebp-8]
 006B3142    mov         eax,ebx
 006B3144    mov         edx,3
 006B3149    call        @UStrCatN
 006B314E    push        dword ptr [ebx]
 006B3150    push        6B31DC;'.'
 006B3155    lea         edx,[ebp-0C]
 006B3158    mov         eax,dword ptr [esi+24];TMidiValue.Item:Integer
 006B315B    call        006A8970
 006B3160    push        dword ptr [ebp-0C]
 006B3163    mov         eax,ebx
 006B3165    mov         edx,3
 006B316A    call        @UStrCatN
 006B316F    xor         eax,eax
 006B3171    pop         edx
 006B3172    pop         ecx
 006B3173    pop         ecx
 006B3174    mov         dword ptr fs:[eax],edx
 006B3177    push        6B3191
 006B317C    lea         eax,[ebp-0C]
 006B317F    mov         edx,3
 006B3184    call        @UStrArrayClr
 006B3189    ret
>006B318A    jmp         @HandleFinally
>006B318F    jmp         006B317C
 006B3191    pop         edi
 006B3192    pop         esi
 006B3193    pop         ebx
 006B3194    mov         esp,ebp
 006B3196    pop         ebp
 006B3197    ret
end;*}

//006B31E0
procedure TMidiDevice.Close;
begin
{*
 006B31E0    push        ebx
 006B31E1    mov         ebx,eax
 006B31E3    cmp         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B31E7    je          006B3268
 006B31E9    cmp         byte ptr [ebx+8],0;TMidiDevice.Input:Boolean
>006B31ED    je          006B3231
 006B31EF    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B31F2    push        eax
 006B31F3    call        winmm.midiInClose
 006B31F8    test        eax,eax
>006B31FA    jne         006B3207
 006B31FC    xor         eax,eax
 006B31FE    mov         dword ptr [ebx+0C],eax;TMidiDevice.Handle:Cardinal
 006B3201    mov         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B3205    jmp         006B3268
 006B3207    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B320A    push        eax
 006B320B    call        winmm.midiInStop
 006B3210    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B3213    push        eax
 006B3214    call        winmm.midiInReset
 006B3219    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B321C    push        eax
 006B321D    call        winmm.midiInClose
 006B3222    test        eax,eax
>006B3224    jne         006B3268
 006B3226    xor         eax,eax
 006B3228    mov         dword ptr [ebx+0C],eax;TMidiDevice.Handle:Cardinal
 006B322B    mov         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B322F    jmp         006B3268
 006B3231    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B3234    push        eax
 006B3235    call        winmm.midiOutClose
 006B323A    test        eax,eax
>006B323C    jne         006B3249
 006B323E    xor         eax,eax
 006B3240    mov         dword ptr [ebx+0C],eax;TMidiDevice.Handle:Cardinal
 006B3243    mov         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B3247    jmp         006B3268
 006B3249    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B324C    push        eax
 006B324D    call        winmm.midiOutReset
 006B3252    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B3255    push        eax
 006B3256    call        winmm.midiOutClose
 006B325B    test        eax,eax
>006B325D    jne         006B3268
 006B325F    xor         eax,eax
 006B3261    mov         dword ptr [ebx+0C],eax;TMidiDevice.Handle:Cardinal
 006B3264    mov         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
 006B3268    pop         ebx
 006B3269    ret
*}
end;

//006B326C
constructor TMidiDevice.Create(IsInput:Boolean; DriverNumber:Integer);
begin
{*
 006B326C    push        ebp
 006B326D    mov         ebp,esp
 006B326F    push        ecx
 006B3270    push        ebx
 006B3271    push        esi
 006B3272    push        edi
 006B3273    test        dl,dl
>006B3275    je          006B327F
 006B3277    add         esp,0FFFFFFF0
 006B327A    call        @ClassCreate
 006B327F    mov         ebx,ecx
 006B3281    mov         byte ptr [ebp-1],dl
 006B3284    mov         esi,eax
 006B3286    mov         edi,dword ptr [ebp+8]
 006B3289    test        bl,bl
>006B328B    je          006B3294
 006B328D    mov         eax,1
>006B3292    jmp         006B329B
 006B3294    mov         eax,edi
 006B3296    call        006A8438
 006B329B    dec         eax
>006B329C    jne         006B32A6
 006B329E    test        bl,bl
>006B32A0    jne         006B32A6
 006B32A2    xor         eax,eax
>006B32A4    jmp         006B32A8
 006B32A6    mov         al,1
 006B32A8    mov         byte ptr [esi+0A],al;TMidiDevice.MustStayOpen:Boolean
 006B32AB    mov         byte ptr [esi+8],bl;TMidiDevice.Input:Boolean
 006B32AE    mov         dword ptr [esi+4],edi;TMidiDevice.MidiNumber:Integer
 006B32B1    mov         byte ptr [esi+9],0;TMidiDevice.IsOpen:Boolean
 006B32B5    mov         byte ptr [esi+1856],1;TMidiDevice.Omni:Boolean
 006B32BC    mov         byte ptr [esi+1857],0;TMidiDevice.Mono:Boolean
 006B32C3    mov         eax,1
 006B32C8    mov         byte ptr [esi+eax+1859],0FF
 006B32D0    mov         byte ptr [esi+eax+1869],0FF
 006B32D8    mov         byte ptr [esi+eax+1879],0FF
 006B32E0    mov         byte ptr [esi+eax+1889],0FF
 006B32E8    inc         eax
 006B32E9    cmp         eax,11
>006B32EC    jne         006B32C8
 006B32EE    mov         eax,esi
 006B32F0    cmp         byte ptr [ebp-1],0
>006B32F4    je          006B3305
 006B32F6    call        @AfterConstruction
 006B32FB    pop         dword ptr fs:[0]
 006B3302    add         esp,0C
 006B3305    mov         eax,esi
 006B3307    pop         edi
 006B3308    pop         esi
 006B3309    pop         ebx
 006B330A    pop         ecx
 006B330B    pop         ebp
 006B330C    ret         4
*}
end;

//006B3310
destructor TMidiDevice.Destroy();
begin
{*
 006B3310    push        ebx
 006B3311    push        esi
 006B3312    call        @BeforeDestruction
 006B3317    mov         ebx,edx
 006B3319    mov         esi,eax
 006B331B    mov         eax,esi
 006B331D    call        TMidiDevice.Close
 006B3322    mov         edx,ebx
 006B3324    and         dl,0FC
 006B3327    mov         eax,esi
 006B3329    call        TObject.Destroy
 006B332E    test        bl,bl
>006B3330    jle         006B3339
 006B3332    mov         eax,esi
 006B3334    call        @ClassDestroy
 006B3339    pop         esi
 006B333A    pop         ebx
 006B333B    ret
*}
end;

//006B333C
procedure TMidiDevice.Finish;
begin
{*
 006B333C    call        TMidiDevice.Close
 006B3341    ret
*}
end;

//006B3344
procedure TMidiDevice.Open;
begin
{*
 006B3344    push        ebx
 006B3345    mov         ebx,eax
 006B3347    cmp         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B334B    jne         006B3399
 006B334D    cmp         byte ptr [ebx+8],0;TMidiDevice.Input:Boolean
>006B3351    je          006B337E
 006B3353    push        30000
 006B3358    push        ebx
 006B3359    push        6A8108
 006B335E    mov         eax,dword ptr [ebx+4];TMidiDevice.MidiNumber:Integer
 006B3361    push        eax
 006B3362    lea         eax,[ebx+0C];TMidiDevice.Handle:Cardinal
 006B3365    push        eax
 006B3366    call        winmm.midiInOpen
 006B336B    test        eax,eax
>006B336D    jne         006B3399
 006B336F    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B3372    push        eax
 006B3373    call        winmm.midiInStart
 006B3378    mov         byte ptr [ebx+9],1;TMidiDevice.IsOpen:Boolean
>006B337C    jmp         006B3399
 006B337E    push        0
 006B3380    push        0
 006B3382    push        0
 006B3384    mov         eax,dword ptr [ebx+4];TMidiDevice.MidiNumber:Integer
 006B3387    push        eax
 006B3388    lea         eax,[ebx+0C];TMidiDevice.Handle:Cardinal
 006B338B    push        eax
 006B338C    call        winmm.midiOutOpen
 006B3391    test        eax,eax
>006B3393    jne         006B3399
 006B3395    mov         byte ptr [ebx+9],1;TMidiDevice.IsOpen:Boolean
 006B3399    pop         ebx
 006B339A    ret
*}
end;

//006B339C
procedure TMidiDevice.ReceiveLongMessage(Hdr:PMidiHdr; TimeStamp:Cardinal);
begin
{*
 006B339C    ret
*}
end;

//006B33A0
procedure TMidiDevice.ReceiveMessage(Status:Byte; byte2:Byte; TimeStamp:Cardinal; byte4:Byte; byte3:Byte);
begin
{*
 006B33A0    push        ebp
 006B33A1    mov         ebp,esp
 006B33A3    push        ecx
 006B33A4    push        ebx
 006B33A5    push        esi
 006B33A6    push        edi
 006B33A7    mov         byte ptr [ebp-1],cl
 006B33AA    mov         esi,eax
 006B33AC    mov         ecx,dword ptr [ebp+10]
 006B33AF    and         byte ptr [ebp-1],7F
 006B33B3    and         cl,7F
 006B33B6    mov         eax,edx
 006B33B8    and         al,0F
 006B33BA    inc         eax
 006B33BB    movzx       edx,dl
 006B33BE    cmp         edx,0F2
>006B33C4    jg          006B3426
>006B33C6    je          006B366B
 006B33CC    cmp         edx,0B0
>006B33D2    jge         006B33F7
 006B33D4    add         edx,0FFFFFF80
 006B33D7    sub         edx,10
>006B33DA    jb          006B3470
 006B33E0    sub         edx,10
>006B33E3    jb          006B3491
 006B33E9    sub         edx,10
>006B33EC    jb          006B34C5
>006B33F2    jmp         006B3763
 006B33F7    add         edx,0FFFFFF50
 006B33FD    sub         edx,10
>006B3400    jb          006B34DE
 006B3406    sub         edx,10
>006B3409    jb          006B3624
 006B340F    sub         edx,10
>006B3412    jb          006B3637
 006B3418    sub         edx,10
>006B341B    jb          006B364A
>006B3421    jmp         006B3763
 006B3426    add         edx,0FFFFFF0D
 006B342C    cmp         edx,0C
>006B342F    ja          006B3763
 006B3435    jmp         dword ptr [edx*4+6B343C]
 006B3435    dd          006B3686
 006B3435    dd          006B3763
 006B3435    dd          006B3763
 006B3435    dd          006B3763
 006B3435    dd          006B3763
 006B3435    dd          006B3763
 006B3435    dd          006B3763
 006B3435    dd          006B3695
 006B3435    dd          006B36A1
 006B3435    dd          006B36AD
 006B3435    dd          006B3763
 006B3435    dd          006B36B9
 006B3435    dd          006B36C5
 006B3470    movzx       ecx,byte ptr [ebp-1]
 006B3474    movzx       edx,al
 006B3477    mov         ebx,edx
 006B3479    shl         ebx,4
 006B347C    lea         ebx,[esi+ebx*8]
 006B347F    mov         byte ptr [ebx+ecx-70],0
 006B3484    mov         byte ptr [esi+edx+1859],0FF
>006B348C    jmp         006B3763
 006B3491    movzx       ebx,byte ptr [ebp-1]
 006B3495    movzx       edx,al
 006B3498    mov         edi,edx
 006B349A    shl         edi,4
 006B349D    lea         edi,[esi+edi*8]
 006B34A0    mov         byte ptr [edi+ebx-70],cl
 006B34A4    test        cl,cl
>006B34A6    jbe         006B34B8
 006B34A8    movzx       eax,byte ptr [ebp-1]
 006B34AC    mov         byte ptr [esi+edx+1859],al
>006B34B3    jmp         006B3763
 006B34B8    mov         byte ptr [esi+edx+1859],0FF
>006B34C0    jmp         006B3763
 006B34C5    movzx       edx,byte ptr [ebp-1]
 006B34C9    movzx       eax,al
 006B34CC    shl         eax,4
 006B34CF    lea         eax,[esi+eax*8]
 006B34D2    mov         byte ptr [eax+edx+790],cl
>006B34D9    jmp         006B3763
 006B34DE    movzx       edx,byte ptr [ebp-1]
 006B34E2    movzx       ebx,al
 006B34E5    shl         ebx,4
 006B34E8    lea         ebx,[esi+ebx*8]
 006B34EB    mov         byte ptr [ebx+edx+0F90],cl
 006B34F2    movzx       edx,byte ptr [ebp-1]
 006B34F6    add         edx,0FFFFFF88
 006B34F9    cmp         edx,7
>006B34FC    ja          006B3763
 006B3502    jmp         dword ptr [edx*4+6B3509]
 006B3502    dd          006B3529
 006B3502    dd          006B3547
 006B3502    dd          006B3763
 006B3502    dd          006B3568
 006B3502    dd          006B3586
 006B3502    dd          006B35AB
 006B3502    dd          006B35D0
 006B3502    dd          006B35FF
 006B3529    xor         edx,edx
 006B352B    movzx       ecx,dl
 006B352E    movzx       ebx,al
 006B3531    shl         ebx,4
 006B3534    lea         ebx,[esi+ebx*8]
 006B3537    mov         byte ptr [ebx+ecx-70],0
 006B353C    inc         edx
 006B353D    cmp         dl,80
>006B3540    jne         006B352B
>006B3542    jmp         006B3763
 006B3547    xor         edx,edx
 006B3549    movzx       ecx,dl
 006B354C    movzx       ebx,al
 006B354F    shl         ebx,4
 006B3552    lea         ebx,[esi+ebx*8]
 006B3555    mov         byte ptr [ebx+ecx+0F90],0
 006B355D    inc         edx
 006B355E    cmp         dl,78
>006B3561    jne         006B3549
>006B3563    jmp         006B3763
 006B3568    xor         edx,edx
 006B356A    movzx       ecx,dl
 006B356D    movzx       ebx,al
 006B3570    shl         ebx,4
 006B3573    lea         ebx,[esi+ebx*8]
 006B3576    mov         byte ptr [ebx+ecx-70],0
 006B357B    inc         edx
 006B357C    cmp         dl,80
>006B357F    jne         006B356A
>006B3581    jmp         006B3763
 006B3586    xor         edx,edx
 006B3588    movzx       ecx,dl
 006B358B    movzx       ebx,al
 006B358E    shl         ebx,4
 006B3591    lea         ebx,[esi+ebx*8]
 006B3594    mov         byte ptr [ebx+ecx-70],0
 006B3599    inc         edx
 006B359A    cmp         dl,80
>006B359D    jne         006B3588
 006B359F    mov         byte ptr [esi+1856],0;TMidiDevice.Omni:Boolean
>006B35A6    jmp         006B3763
 006B35AB    xor         edx,edx
 006B35AD    movzx       ecx,dl
 006B35B0    movzx       ebx,al
 006B35B3    shl         ebx,4
 006B35B6    lea         ebx,[esi+ebx*8]
 006B35B9    mov         byte ptr [ebx+ecx-70],0
 006B35BE    inc         edx
 006B35BF    cmp         dl,80
>006B35C2    jne         006B35AD
 006B35C4    mov         byte ptr [esi+1856],1;TMidiDevice.Omni:Boolean
>006B35CB    jmp         006B3763
 006B35D0    xor         edx,edx
 006B35D2    movzx       ecx,dl
 006B35D5    movzx       ebx,al
 006B35D8    shl         ebx,4
 006B35DB    lea         ebx,[esi+ebx*8]
 006B35DE    mov         byte ptr [ebx+ecx-70],0
 006B35E3    inc         edx
 006B35E4    cmp         dl,80
>006B35E7    jne         006B35D2
 006B35E9    mov         byte ptr [esi+1857],1;TMidiDevice.Mono:Boolean
 006B35F0    movzx       eax,byte ptr [ebp-1]
 006B35F4    mov         byte ptr [esi+1858],al;TMidiDevice.MonoChannels:byte
>006B35FA    jmp         006B3763
 006B35FF    xor         edx,edx
 006B3601    movzx       ecx,dl
 006B3604    movzx       ebx,al
 006B3607    shl         ebx,4
 006B360A    lea         ebx,[esi+ebx*8]
 006B360D    mov         byte ptr [ebx+ecx-70],0
 006B3612    inc         edx
 006B3613    cmp         dl,80
>006B3616    jne         006B3601
 006B3618    mov         byte ptr [esi+1857],0;TMidiDevice.Mono:Boolean
>006B361F    jmp         006B3763
 006B3624    movzx       eax,al
 006B3627    movzx       edx,byte ptr [ebp-1]
 006B362B    mov         byte ptr [esi+eax+181F],dl
>006B3632    jmp         006B3763
 006B3637    movzx       eax,al
 006B363A    movzx       edx,byte ptr [ebp-1]
 006B363E    mov         byte ptr [esi+eax+180F],dl
>006B3645    jmp         006B3763
 006B364A    movzx       edx,byte ptr [ebp-1]
 006B364E    movzx       ecx,cl
 006B3651    mov         ebx,ecx
 006B3653    shl         ecx,7
 006B3656    sub         ecx,ebx
 006B3658    add         dx,cx
 006B365B    movzx       eax,al
 006B365E    mov         word ptr [esi+eax*2+182E],dx
>006B3666    jmp         006B3763
 006B366B    movzx       eax,byte ptr [ebp-1]
 006B366F    movzx       edx,cl
 006B3672    mov         ecx,edx
 006B3674    shl         edx,7
 006B3677    sub         edx,ecx
 006B3679    add         eax,edx
 006B367B    mov         dword ptr [esi+1850],eax;TMidiDevice.SongPos:Cardinal
>006B3681    jmp         006B3763
 006B3686    movzx       eax,byte ptr [ebp-1]
 006B368A    mov         byte ptr [esi+1854],al;TMidiDevice.SongSelected:byte
>006B3690    jmp         006B3763
 006B3695    mov         byte ptr [esi+1855],1;TMidiDevice.SongPlaying:Boolean
>006B369C    jmp         006B3763
 006B36A1    mov         byte ptr [esi+1855],1;TMidiDevice.SongPlaying:Boolean
>006B36A8    jmp         006B3763
 006B36AD    mov         byte ptr [esi+1855],0;TMidiDevice.SongPlaying:Boolean
>006B36B4    jmp         006B3763
 006B36B9    mov         byte ptr [esi+1859],1;TMidiDevice.ActiveSensingOn:Boolean
>006B36C0    jmp         006B3763
 006B36C5    mov         al,1
 006B36C7    xor         edx,edx
 006B36C9    movzx       ebx,dl
 006B36CC    movzx       ecx,al
 006B36CF    mov         edi,ecx
 006B36D1    shl         edi,4
 006B36D4    lea         edi,[esi+edi*8]
 006B36D7    mov         byte ptr [edi+ebx-70],0
 006B36DC    movzx       ebx,dl
 006B36DF    movzx       edi,al
 006B36E2    shl         edi,4
 006B36E5    lea         edi,[esi+edi*8]
 006B36E8    mov         byte ptr [edi+ebx+790],0
 006B36F0    movzx       ebx,dl
 006B36F3    movzx       edi,al
 006B36F6    shl         edi,4
 006B36F9    lea         edi,[esi+edi*8]
 006B36FC    mov         byte ptr [edi+ebx+0F90],0
 006B3704    mov         byte ptr [esi+ecx+180F],0
 006B370C    mov         byte ptr [esi+ecx+181F],0
 006B3714    mov         word ptr [esi+ecx*2+182E],2000
 006B371E    xor         ecx,ecx
 006B3720    mov         dword ptr [esi+1850],ecx;TMidiDevice.SongPos:Cardinal
 006B3726    mov         byte ptr [esi+1854],0;TMidiDevice.SongSelected:byte
 006B372D    mov         byte ptr [esi+1856],1;TMidiDevice.Omni:Boolean
 006B3734    mov         byte ptr [esi+1857],0;TMidiDevice.Mono:Boolean
 006B373B    mov         byte ptr [esi+1858],0;TMidiDevice.MonoChannels:byte
 006B3742    mov         byte ptr [esi+1859],0;TMidiDevice.ActiveSensingOn:Boolean
 006B3749    mov         byte ptr [esi+1855],0;TMidiDevice.SongPlaying:Boolean
 006B3750    inc         edx
 006B3751    cmp         dl,80
>006B3754    jne         006B36C9
 006B375A    inc         eax
 006B375B    cmp         al,11
>006B375D    jne         006B36C7
 006B3763    pop         edi
 006B3764    pop         esi
 006B3765    pop         ebx
 006B3766    pop         ecx
 006B3767    pop         ebp
 006B3768    ret         0C
*}
end;

//006B376C
procedure TMidiDevice.SendLongMessage(message:Pointer; Size:Cardinal);
begin
{*
 006B376C    push        ebx
 006B376D    push        esi
 006B376E    push        edi
 006B376F    push        ebp
 006B3770    add         esp,0FFFFFFC0
 006B3773    mov         esi,ecx
 006B3775    mov         ebp,edx
 006B3777    mov         ebx,eax
 006B3779    cmp         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B377D    jne         006B3786
 006B377F    mov         eax,ebx
 006B3781    call        TMidiDevice.Open
 006B3786    cmp         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B378A    je          006B3811
 006B3790    mov         eax,esp
 006B3792    xor         ecx,ecx
 006B3794    mov         edx,40
 006B3799    call        @FillChar
 006B379E    mov         dword ptr [esp+4],esi
 006B37A2    xor         eax,eax
 006B37A4    mov         dword ptr [esp+10],eax
 006B37A8    mov         eax,esi
 006B37AA    call        @GetMem
 006B37AF    mov         edi,eax
 006B37B1    mov         dword ptr [esp],edi
 006B37B4    mov         edx,edi
 006B37B6    mov         eax,ebp
 006B37B8    mov         ecx,esi
 006B37BA    call        Move
 006B37BF    push        esi
 006B37C0    lea         eax,[esp+4]
 006B37C4    push        eax
 006B37C5    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B37C8    push        eax
 006B37C9    call        winmm.midiOutPrepareHeader
 006B37CE    push        esi
 006B37CF    lea         eax,[esp+4]
 006B37D3    push        eax
 006B37D4    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B37D7    push        eax
 006B37D8    call        winmm.midiOutLongMsg
>006B37DD    jmp         006B37E6
 006B37DF    push        0A
 006B37E1    call        kernel32.Sleep
 006B37E6    push        esi
 006B37E7    lea         eax,[esp+4]
 006B37EB    push        eax
 006B37EC    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B37EF    push        eax
 006B37F0    call        winmm.midiOutUnprepareHeader
 006B37F5    cmp         eax,41
>006B37F8    je          006B37DF
 006B37FA    mov         edx,esi
 006B37FC    mov         eax,dword ptr [esp]
 006B37FF    call        @FreeMem
 006B3804    cmp         byte ptr [ebx+0A],0;TMidiDevice.MustStayOpen:Boolean
>006B3808    jne         006B3811
 006B380A    mov         eax,ebx
 006B380C    call        TMidiDevice.Close
 006B3811    add         esp,40
 006B3814    pop         ebp
 006B3815    pop         edi
 006B3816    pop         esi
 006B3817    pop         ebx
 006B3818    ret
*}
end;

//006B381C
procedure TMidiDevice.SendMessage(message:Cardinal);
begin
{*
 006B381C    push        ebx
 006B381D    push        esi
 006B381E    mov         esi,edx
 006B3820    mov         ebx,eax
 006B3822    cmp         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B3826    jne         006B382F
 006B3828    mov         eax,ebx
 006B382A    call        TMidiDevice.Open
 006B382F    cmp         byte ptr [ebx+9],0;TMidiDevice.IsOpen:Boolean
>006B3833    je          006B384C
 006B3835    push        esi
 006B3836    mov         eax,dword ptr [ebx+0C];TMidiDevice.Handle:Cardinal
 006B3839    push        eax
 006B383A    call        winmm.midiOutShortMsg
 006B383F    cmp         byte ptr [ebx+0A],0;TMidiDevice.MustStayOpen:Boolean
>006B3843    jne         006B384C
 006B3845    mov         eax,ebx
 006B3847    call        TMidiDevice.Close
 006B384C    pop         esi
 006B384D    pop         ebx
 006B384E    ret
*}
end;

//006B3850
procedure sub_006B3850;
begin
{*
 006B3850    push        ebx
 006B3851    push        esi
 006B3852    push        edi
 006B3853    push        ebp
 006B3854    mov         ebp,81EDD4;gvar_0081EDD4:TObjectList
 006B3859    cmp         dword ptr ds:[81EDD8],0;gvar_0081EDD8:TObjectList
>006B3860    je          006B3899
 006B3862    mov         eax,[0081EDD8];gvar_0081EDD8:TObjectList
 006B3867    mov         esi,dword ptr [eax+8]
 006B386A    dec         esi
 006B386B    test        esi,esi
>006B386D    jl          006B3899
 006B386F    inc         esi
 006B3870    xor         ebx,ebx
 006B3872    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B3878    mov         edx,ebx
 006B387A    mov         eax,edi
 006B387C    call        TList.Get
 006B3881    mov         edi,eax
 006B3883    mov         eax,edi
 006B3885    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B388B    call        @AsClass
 006B3890    call        TMidiDevice.Finish
 006B3895    inc         ebx
 006B3896    dec         esi
>006B3897    jne         006B3872
 006B3899    cmp         dword ptr [ebp],0
>006B389D    je          006B3912
 006B389F    mov         eax,dword ptr [ebp]
 006B38A2    mov         esi,dword ptr [eax+8]
 006B38A5    dec         esi
 006B38A6    test        esi,esi
>006B38A8    jl          006B3912
 006B38AA    inc         esi
 006B38AB    xor         ebx,ebx
 006B38AD    mov         edi,dword ptr [ebp]
 006B38B0    mov         edx,ebx
 006B38B2    mov         eax,edi
 006B38B4    call        TList.Get
 006B38B9    mov         edi,eax
 006B38BB    mov         eax,edi
 006B38BD    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B38C3    call        @AsClass
 006B38C8    call        TMidiDevice.Finish
 006B38CD    mov         edi,dword ptr [ebp]
 006B38D0    mov         edx,ebx
 006B38D2    mov         eax,edi
 006B38D4    call        TList.Get
 006B38D9    mov         edi,eax
 006B38DB    mov         eax,edi
 006B38DD    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B38E3    call        @AsClass
 006B38E8    cmp         byte ptr [eax+0B],0;TMidiDevice.Used:Boolean
>006B38EC    je          006B390E
 006B38EE    mov         edi,dword ptr [ebp]
 006B38F1    mov         edx,ebx
 006B38F3    mov         eax,edi
 006B38F5    call        TList.Get
 006B38FA    mov         edi,eax
 006B38FC    mov         eax,edi
 006B38FE    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B3904    call        @AsClass
 006B3909    call        TMidiDevice.Open
 006B390E    inc         ebx
 006B390F    dec         esi
>006B3910    jne         006B38AD
 006B3912    pop         ebp
 006B3913    pop         edi
 006B3914    pop         esi
 006B3915    pop         ebx
 006B3916    ret
*}
end;

//006B3918
procedure sub_006B3918;
begin
{*
 006B3918    push        ebx
 006B3919    push        esi
 006B391A    push        edi
 006B391B    cmp         dword ptr ds:[81EDD8],0;gvar_0081EDD8:TObjectList
>006B3922    je          006B395B
 006B3924    mov         eax,[0081EDD8];gvar_0081EDD8:TObjectList
 006B3929    mov         ebx,dword ptr [eax+8]
 006B392C    dec         ebx
 006B392D    test        ebx,ebx
>006B392F    jl          006B395B
 006B3931    inc         ebx
 006B3932    xor         esi,esi
 006B3934    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B393A    mov         edx,esi
 006B393C    mov         eax,edi
 006B393E    call        TList.Get
 006B3943    mov         edi,eax
 006B3945    mov         eax,edi
 006B3947    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B394D    call        @AsClass
 006B3952    call        TMidiDevice.Finish
 006B3957    inc         esi
 006B3958    dec         ebx
>006B3959    jne         006B3934
 006B395B    cmp         dword ptr ds:[81EDD4],0;gvar_0081EDD4:TObjectList
>006B3962    je          006B399B
 006B3964    mov         eax,[0081EDD4];gvar_0081EDD4:TObjectList
 006B3969    mov         ebx,dword ptr [eax+8]
 006B396C    dec         ebx
 006B396D    test        ebx,ebx
>006B396F    jl          006B399B
 006B3971    inc         ebx
 006B3972    xor         esi,esi
 006B3974    mov         edi,dword ptr ds:[81EDD4];gvar_0081EDD4:TObjectList
 006B397A    mov         edx,esi
 006B397C    mov         eax,edi
 006B397E    call        TList.Get
 006B3983    mov         edi,eax
 006B3985    mov         eax,edi
 006B3987    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B398D    call        @AsClass
 006B3992    call        TMidiDevice.Finish
 006B3997    inc         esi
 006B3998    dec         ebx
>006B3999    jne         006B3974
 006B399B    pop         edi
 006B399C    pop         esi
 006B399D    pop         ebx
 006B399E    ret
*}
end;

//006B39A0
procedure sub_006B39A0;
begin
{*
 006B39A0    push        ebx
 006B39A1    push        esi
 006B39A2    push        edi
 006B39A3    mov         byte ptr ds:[78BE60],0;gvar_0078BE60
 006B39AA    mov         dword ptr ds:[78BE68],0FFFFFFFF;gvar_0078BE68
 006B39B4    xor         eax,eax
 006B39B6    mov         [0078BE6C],eax;gvar_0078BE6C
 006B39BB    mov         dword ptr ds:[78BE64],1;gvar_0078BE64
 006B39C5    cmp         dword ptr ds:[81EDD8],0;gvar_0081EDD8:TObjectList
>006B39CC    je          006B3A04
 006B39CE    mov         eax,[0081EDD8];gvar_0081EDD8:TObjectList
 006B39D3    mov         ebx,dword ptr [eax+8]
 006B39D6    dec         ebx
 006B39D7    test        ebx,ebx
>006B39D9    jl          006B3A04
 006B39DB    inc         ebx
 006B39DC    xor         esi,esi
 006B39DE    mov         edi,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B39E4    mov         edx,esi
 006B39E6    mov         eax,edi
 006B39E8    call        TList.Get
 006B39ED    mov         edi,eax
 006B39EF    mov         eax,edi
 006B39F1    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B39F7    call        @AsClass
 006B39FC    mov         byte ptr [eax+0B],0;TMidiDevice.Used:Boolean
 006B3A00    inc         esi
 006B3A01    dec         ebx
>006B3A02    jne         006B39DE
 006B3A04    cmp         dword ptr ds:[81EDD4],0;gvar_0081EDD4:TObjectList
>006B3A0B    je          006B3A43
 006B3A0D    mov         eax,[0081EDD4];gvar_0081EDD4:TObjectList
 006B3A12    mov         ebx,dword ptr [eax+8]
 006B3A15    dec         ebx
 006B3A16    test        ebx,ebx
>006B3A18    jl          006B3A43
 006B3A1A    inc         ebx
 006B3A1B    xor         esi,esi
 006B3A1D    mov         edi,dword ptr ds:[81EDD4];gvar_0081EDD4:TObjectList
 006B3A23    mov         edx,esi
 006B3A25    mov         eax,edi
 006B3A27    call        TList.Get
 006B3A2C    mov         edi,eax
 006B3A2E    mov         eax,edi
 006B3A30    mov         edx,dword ptr ds:[6A73A4];TMidiDevice
 006B3A36    call        @AsClass
 006B3A3B    mov         byte ptr [eax+0B],0;TMidiDevice.Used:Boolean
 006B3A3F    inc         esi
 006B3A40    dec         ebx
>006B3A41    jne         006B3A1D
 006B3A43    pop         edi
 006B3A44    pop         esi
 006B3A45    pop         ebx
 006B3A46    ret
*}
end;

//006B3A48
procedure sub_006B3A48;
begin
{*
 006B3A48    ret
*}
end;

//006B3A4C
procedure sub_006B3A4C;
begin
{*
 006B3A4C    push        ebx
 006B3A4D    push        esi
 006B3A4E    mov         cl,1
 006B3A50    mov         dl,1
 006B3A52    mov         eax,[00471630];TObjectList
 006B3A57    call        TObjectList.Create;TObjectList.Create
 006B3A5C    mov         [0081EDD8],eax;gvar_0081EDD8:TObjectList
 006B3A61    call        winmm.midiOutGetNumDevs
 006B3A66    mov         ebx,eax
 006B3A68    dec         ebx
 006B3A69    sub         ebx,0FFFFFFFF
>006B3A6C    jl          006B3A93
 006B3A6E    inc         ebx
 006B3A6F    mov         esi,0FFFFFFFF
 006B3A74    push        esi
 006B3A75    xor         ecx,ecx
 006B3A77    mov         dl,1
 006B3A79    mov         eax,[006A73A4];TMidiDevice
 006B3A7E    call        TMidiDevice.Create;TMidiDevice.Create
 006B3A83    mov         edx,dword ptr ds:[81EDD8];gvar_0081EDD8:TObjectList
 006B3A89    xchg        eax,edx
 006B3A8A    call        TList.Add
 006B3A8F    inc         esi
 006B3A90    dec         ebx
>006B3A91    jne         006B3A74
 006B3A93    mov         cl,1
 006B3A95    mov         dl,1
 006B3A97    mov         eax,[00471630];TObjectList
 006B3A9C    call        TObjectList.Create;TObjectList.Create
 006B3AA1    mov         [0081EDD4],eax;gvar_0081EDD4:TObjectList
 006B3AA6    call        winmm.midiInGetNumDevs
 006B3AAB    mov         ebx,eax
 006B3AAD    dec         ebx
 006B3AAE    test        ebx,ebx
>006B3AB0    jl          006B3AD4
 006B3AB2    inc         ebx
 006B3AB3    xor         esi,esi
 006B3AB5    push        esi
 006B3AB6    mov         cl,1
 006B3AB8    mov         dl,1
 006B3ABA    mov         eax,[006A73A4];TMidiDevice
 006B3ABF    call        TMidiDevice.Create;TMidiDevice.Create
 006B3AC4    mov         edx,dword ptr ds:[81EDD4];gvar_0081EDD4:TObjectList
 006B3ACA    xchg        eax,edx
 006B3ACB    call        TList.Add
 006B3AD0    inc         esi
 006B3AD1    dec         ebx
>006B3AD2    jne         006B3AB5
 006B3AD4    pop         esi
 006B3AD5    pop         ebx
 006B3AD6    ret
*}
end;

//006B3AD8
procedure sub_006B3AD8;
begin
{*
 006B3AD8    mov         eax,[0081EDD8];gvar_0081EDD8:TObjectList
 006B3ADD    xor         edx,edx
 006B3ADF    mov         dword ptr ds:[81EDD8],edx;gvar_0081EDD8:TObjectList
 006B3AE5    call        TObject.Free
 006B3AEA    mov         eax,[0081EDD4];gvar_0081EDD4:TObjectList
 006B3AEF    xor         edx,edx
 006B3AF1    mov         dword ptr ds:[81EDD4],edx;gvar_0081EDD4:TObjectList
 006B3AF7    call        TObject.Free
 006B3AFC    ret
*}
end;

Initialization
//00782270
{*
 00782270    push        ebp
 00782271    mov         ebp,esp
 00782273    push        ebx
 00782274    push        esi
 00782275    push        edi
 00782276    sub         dword ptr ds:[81EDD0],1
>0078227D    jae         007822D7
 0078227F    xor         edx,edx
 00782281    push        ebp
 00782282    push        7822BC
 00782287    push        dword ptr fs:[edx]
 0078228A    mov         dword ptr fs:[edx],esp
 0078228D    mov         eax,7822E8;'Initializing PieMidi'
 00782292    call        004FA5FC
 00782297    mov         dl,1
 00782299    mov         eax,[0067D4A4];THashTable
 0078229E    call        THashTable.Create;THashTable.Create
 007822A3    mov         [0081EDCC],eax;gvar_0081EDCC:THashTable
 007822A8    call        006A8988
 007822AD    call        006B3A4C
 007822B2    xor         eax,eax
 007822B4    pop         edx
 007822B5    pop         ecx
 007822B6    pop         ecx
 007822B7    mov         dword ptr fs:[eax],edx
>007822BA    jmp         007822D7
>007822BC    jmp         @HandleOnException
 007822C1    dd          1
 007822C5    dd          00418C04;Exception
 007822C9    dd          007822CD
 007822CD    call        004FA644
 007822D2    call        @DoneExcept
 007822D7    pop         edi
 007822D8    pop         esi
 007822D9    pop         ebx
 007822DA    pop         ebp
 007822DB    ret
*}
Finalization
//006B3B00
{*
 006B3B00    push        ebp
 006B3B01    mov         ebp,esp
 006B3B03    push        ebx
 006B3B04    push        esi
 006B3B05    push        edi
 006B3B06    inc         dword ptr ds:[81EDD0]
>006B3B0C    jne         006B3B76
 006B3B0E    xor         edx,edx
 006B3B10    push        ebp
 006B3B11    push        6B3B5B
 006B3B16    push        dword ptr fs:[edx]
 006B3B19    mov         dword ptr fs:[edx],esp
 006B3B1C    mov         eax,6B3B88;'Finalizing PieMidi'
 006B3B21    call        004FA5FC
 006B3B26    mov         eax,[0081EDCC];gvar_0081EDCC:THashTable
 006B3B2B    xor         edx,edx
 006B3B2D    mov         dword ptr ds:[81EDCC],edx;gvar_0081EDCC:THashTable
 006B3B33    call        TObject.Free
 006B3B38    call        006B14D0
 006B3B3D    call        006B14CC
 006B3B42    call        006B3A48
 006B3B47    call        006B3918
 006B3B4C    call        006B3AD8
 006B3B51    xor         eax,eax
 006B3B53    pop         edx
 006B3B54    pop         ecx
 006B3B55    pop         ecx
 006B3B56    mov         dword ptr fs:[eax],edx
>006B3B59    jmp         006B3B76
>006B3B5B    jmp         @HandleOnException
 006B3B60    dd          1
 006B3B64    dd          00418C04;Exception
 006B3B68    dd          006B3B6C
 006B3B6C    call        004FA644
 006B3B71    call        @DoneExcept
 006B3B76    pop         edi
 006B3B77    pop         esi
 006B3B78    pop         ebx
 006B3B79    pop         ebp
 006B3B7A    ret
*}
end.