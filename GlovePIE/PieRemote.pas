//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieRemote;

interface

uses
  SysUtils, Classes;

type
  TRemoteValue = class(TObjectValue)
  published
    function GetSonyRadio:Boolean;//006BB484
    function GetSonyCD:Boolean;//006BB7B0
    function GetSonyVCR:Boolean;//006BB8E8
    function GetSonyTV:Boolean;//006BA93C
    procedure CreateClone;//006BBDE8
    procedure FillClone(c:TExpression);//006BBDF8
    function GetSonyTape:Boolean;//006BB534
    procedure GetValue;//006BB260
    function GetSonyPhono:Boolean;//006BB3EC
    procedure SetValue(NewValue:Double);//006BB280
    //procedure ToString(?:?);//006BB28C
    function GetDataType:TDataType;//006BA854
    function CanSet:Boolean;//006BA808
    function GetSony:Boolean;//006BA858
    function GetSonyAudio:Boolean;//006BB36C
    procedure GetBoolean;//006BA80C
    function GetPinnacle:Boolean;//006BAEDC
  public
    Brand:byte;//f20
    Device:byte;//f21
    Item:Integer;//f24
    //procedure ToString(?:?); virtual;//006BB28C
    procedure GetValue; virtual;//v2C//006BB260
    procedure GetBoolean; virtual;//v30//006BA80C
    function GetDataType:TDataType; virtual;//v44//006BA854
    procedure SetValue(NewValue:Double); virtual;//v58//006BB280
    function CanSet:Boolean; virtual;//v68//006BA808
    procedure CreateClone; virtual;//v80//006BBDE8
    procedure FillClone(c:TExpression); virtual;//v84//006BBDF8
  end;
    //function sub_006B5684(?:UnicodeString):?;//006B5684
    //procedure sub_006B56D4(?:Integer; ?:?);//006B56D4
    procedure sub_006B56EC;//006B56EC
    //function sub_006B7250:?;//006B7250
    //function sub_006B72C8(?:?):?;//006B72C8
    //function sub_006B740C(?:?):?;//006B740C
    procedure sub_006B7CC8;//006B7CC8
    procedure sub_006B7E88;//006B7E88
    //procedure sub_006B7EF0(?:?; ?:?);//006B7EF0
    procedure sub_006B9E44;//006B9E44
    procedure sub_006B9E50;//006B9E50
    //procedure sub_006B9E5C(?:?);//006B9E5C
    //procedure sub_006B9E64(?:?);//006B9E64
    procedure sub_006B9E94;//006B9E94
    procedure sub_006B9EA8;//006B9EA8
    procedure sub_006B9EAC;//006B9EAC
    procedure sub_006B9EB0;//006B9EB0
    procedure sub_006B9EB4;//006B9EB4
    procedure sub_006B9EB8;//006B9EB8
    procedure sub_006B9EBC;//006B9EBC
    //procedure sub_006B9EC0(?:?);//006B9EC0
    //function sub_006B9ED8:?;//006B9ED8
    procedure sub_006BA688;//006BA688
    //function sub_006BA754:?;//006BA754
    //procedure sub_006BBD54(?:?; ?:?);//006BBD54

implementation

//006B5684
{*function sub_006B5684(?:UnicodeString):?;
begin
 006B5684    push        ebp
 006B5685    mov         ebp,esp
 006B5687    push        ecx
 006B5688    push        ebx
 006B5689    mov         dword ptr [ebp-4],eax
 006B568C    mov         eax,dword ptr [ebp-4]
 006B568F    call        @UStrAddRef
 006B5694    xor         eax,eax
 006B5696    push        ebp
 006B5697    push        6B56C7
 006B569C    push        dword ptr fs:[eax]
 006B569F    mov         dword ptr fs:[eax],esp
 006B56A2    mov         edx,dword ptr [ebp-4]
 006B56A5    mov         eax,[0081F564];gvar_0081F564:THashTable
 006B56AA    call        THashTable.Get
 006B56AF    mov         ebx,eax
 006B56B1    xor         eax,eax
 006B56B3    pop         edx
 006B56B4    pop         ecx
 006B56B5    pop         ecx
 006B56B6    mov         dword ptr fs:[eax],edx
 006B56B9    push        6B56CE
 006B56BE    lea         eax,[ebp-4]
 006B56C1    call        @UStrClr
 006B56C6    ret
>006B56C7    jmp         @HandleFinally
>006B56CC    jmp         006B56BE
 006B56CE    mov         eax,ebx
 006B56D0    pop         ebx
 006B56D1    pop         ecx
 006B56D2    pop         ebp
 006B56D3    ret
end;*}

//006B56D4
{*procedure sub_006B56D4(?:Integer; ?:?);
begin
 006B56D4    push        ebx
 006B56D5    push        esi
 006B56D6    mov         esi,edx
 006B56D8    mov         ebx,eax
 006B56DA    mov         ecx,esi
 006B56DC    mov         edx,ebx
 006B56DE    mov         eax,[0081F564];gvar_0081F564:THashTable
 006B56E3    call        THashTable.Get
 006B56E8    pop         esi
 006B56E9    pop         ebx
 006B56EA    ret
end;*}

//006B56EC
procedure sub_006B56EC;
begin
{*
 006B56EC    push        ebx
 006B56ED    mov         ebx,81F564;gvar_0081F564:THashTable
 006B56F2    xor         ecx,ecx
 006B56F4    mov         edx,6B616C;'Any'
 006B56F9    mov         eax,dword ptr [ebx]
 006B56FB    call        THashTable.Add
 006B5700    mov         ecx,1
 006B5705    mov         edx,6B6180;'One'
 006B570A    mov         eax,dword ptr [ebx]
 006B570C    call        THashTable.Add
 006B5711    mov         ecx,2
 006B5716    mov         edx,6B6194;'Two'
 006B571B    mov         eax,dword ptr [ebx]
 006B571D    call        THashTable.Add
 006B5722    mov         ecx,2
 006B5727    mov         edx,6B61A8;'ABC'
 006B572C    mov         eax,dword ptr [ebx]
 006B572E    call        THashTable.Add
 006B5733    mov         ecx,3
 006B5738    mov         edx,6B61BC;'Three'
 006B573D    mov         eax,dword ptr [ebx]
 006B573F    call        THashTable.Add
 006B5744    mov         ecx,3
 006B5749    mov         edx,6B61D4;'DEF'
 006B574E    mov         eax,dword ptr [ebx]
 006B5750    call        THashTable.Add
 006B5755    mov         ecx,4
 006B575A    mov         edx,6B61E8;'Four'
 006B575F    mov         eax,dword ptr [ebx]
 006B5761    call        THashTable.Add
 006B5766    mov         ecx,4
 006B576B    mov         edx,6B6200;'GHI'
 006B5770    mov         eax,dword ptr [ebx]
 006B5772    call        THashTable.Add
 006B5777    mov         ecx,5
 006B577C    mov         edx,6B6214;'Five'
 006B5781    mov         eax,dword ptr [ebx]
 006B5783    call        THashTable.Add
 006B5788    mov         ecx,5
 006B578D    mov         edx,6B622C;'JKL'
 006B5792    mov         eax,dword ptr [ebx]
 006B5794    call        THashTable.Add
 006B5799    mov         ecx,6
 006B579E    mov         edx,6B6240;'Six'
 006B57A3    mov         eax,dword ptr [ebx]
 006B57A5    call        THashTable.Add
 006B57AA    mov         ecx,6
 006B57AF    mov         edx,6B6254;'MNO'
 006B57B4    mov         eax,dword ptr [ebx]
 006B57B6    call        THashTable.Add
 006B57BB    mov         ecx,7
 006B57C0    mov         edx,6B6268;'Seven'
 006B57C5    mov         eax,dword ptr [ebx]
 006B57C7    call        THashTable.Add
 006B57CC    mov         ecx,7
 006B57D1    mov         edx,6B6280;'PQRS'
 006B57D6    mov         eax,dword ptr [ebx]
 006B57D8    call        THashTable.Add
 006B57DD    mov         ecx,8
 006B57E2    mov         edx,6B6298;'Eight'
 006B57E7    mov         eax,dword ptr [ebx]
 006B57E9    call        THashTable.Add
 006B57EE    mov         ecx,8
 006B57F3    mov         edx,6B62B0;'TUV'
 006B57F8    mov         eax,dword ptr [ebx]
 006B57FA    call        THashTable.Add
 006B57FF    mov         ecx,9
 006B5804    mov         edx,6B62C4;'Nine'
 006B5809    mov         eax,dword ptr [ebx]
 006B580B    call        THashTable.Add
 006B5810    mov         ecx,9
 006B5815    mov         edx,6B62DC;'WXYZ'
 006B581A    mov         eax,dword ptr [ebx]
 006B581C    call        THashTable.Add
 006B5821    mov         ecx,0A
 006B5826    mov         edx,6B62F4;'Zero'
 006B582B    mov         eax,dword ptr [ebx]
 006B582D    call        THashTable.Add
 006B5832    mov         ecx,0A
 006B5837    mov         edx,6B630C;'AV'
 006B583C    mov         eax,dword ptr [ebx]
 006B583E    call        THashTable.Add
 006B5843    mov         ecx,0B
 006B5848    mov         edx,6B6320;'TensUnits'
 006B584D    mov         eax,dword ptr [ebx]
 006B584F    call        THashTable.Add
 006B5854    mov         ecx,0B
 006B5859    mov         edx,6B6340;'UnitsTens'
 006B585E    mov         eax,dword ptr [ebx]
 006B5860    call        THashTable.Add
 006B5865    mov         ecx,0B
 006B586A    mov         edx,6B6360;'Tens'
 006B586F    mov         eax,dword ptr [ebx]
 006B5871    call        THashTable.Add
 006B5876    mov         ecx,0B
 006B587B    mov         edx,6B6378;'AddTen'
 006B5880    mov         eax,dword ptr [ebx]
 006B5882    call        THashTable.Add
 006B5887    mov         ecx,14
 006B588C    mov         edx,6B6394;'Power'
 006B5891    mov         eax,dword ptr [ebx]
 006B5893    call        THashTable.Add
 006B5898    mov         ecx,14
 006B589D    mov         edx,6B63AC;'On'
 006B58A2    mov         eax,dword ptr [ebx]
 006B58A4    call        THashTable.Add
 006B58A9    mov         ecx,14
 006B58AE    mov         edx,6B63C0;'Off'
 006B58B3    mov         eax,dword ptr [ebx]
 006B58B5    call        THashTable.Add
 006B58BA    mov         ecx,14
 006B58BF    mov         edx,6B63D4;'OnOff'
 006B58C4    mov         eax,dword ptr [ebx]
 006B58C6    call        THashTable.Add
 006B58CB    mov         ecx,14
 006B58D0    mov         edx,6B63EC;'StandBy'
 006B58D5    mov         eax,dword ptr [ebx]
 006B58D7    call        THashTable.Add
 006B58DC    mov         ecx,15
 006B58E1    mov         edx,6B6408;'Eject'
 006B58E6    mov         eax,dword ptr [ebx]
 006B58E8    call        THashTable.Add
 006B58ED    mov         ecx,16
 006B58F2    mov         edx,6B6420;'FullScreen'
 006B58F7    mov         eax,dword ptr [ebx]
 006B58F9    call        THashTable.Add
 006B58FE    mov         ecx,16
 006B5903    mov         edx,6B6444;'Maximise'
 006B5908    mov         eax,dword ptr [ebx]
 006B590A    call        THashTable.Add
 006B590F    mov         ecx,16
 006B5914    mov         edx,6B6464;'Maximize'
 006B5919    mov         eax,dword ptr [ebx]
 006B591B    call        THashTable.Add
 006B5920    mov         ecx,16
 006B5925    mov         edx,6B6484;'Box'
 006B592A    mov         eax,dword ptr [ebx]
 006B592C    call        THashTable.Add
 006B5931    mov         ecx,16
 006B5936    mov         edx,6B6498;'Window'
 006B593B    mov         eax,dword ptr [ebx]
 006B593D    call        THashTable.Add
 006B5942    mov         ecx,18
 006B5947    mov         edx,6B64B4;'Zoom'
 006B594C    mov         eax,dword ptr [ebx]
 006B594E    call        THashTable.Add
 006B5953    mov         ecx,19
 006B5958    mov         edx,6B64CC;'Preview'
 006B595D    mov         eax,dword ptr [ebx]
 006B595F    call        THashTable.Add
 006B5964    mov         ecx,19
 006B5969    mov         edx,6B64E8;'P'
 006B596E    mov         eax,dword ptr [ebx]
 006B5970    call        THashTable.Add
 006B5975    mov         ecx,1A
 006B597A    mov         edx,6B64F8;'List'
 006B597F    mov         eax,dword ptr [ebx]
 006B5981    call        THashTable.Add
 006B5986    mov         ecx,1A
 006B598B    mov         edx,6B6510;'L'
 006B5990    mov         eax,dword ptr [ebx]
 006B5992    call        THashTable.Add
 006B5997    mov         ecx,1B
 006B599C    mov         edx,6B6520;'Info'
 006B59A1    mov         eax,dword ptr [ebx]
 006B59A3    call        THashTable.Add
 006B59A8    mov         ecx,1B
 006B59AD    mov         edx,6B6538;'I'
 006B59B2    mov         eax,dword ptr [ebx]
 006B59B4    call        THashTable.Add
 006B59B9    mov         ecx,1E
 006B59BE    mov         edx,6B6548;'VolumePlus'
 006B59C3    mov         eax,dword ptr [ebx]
 006B59C5    call        THashTable.Add
 006B59CA    mov         ecx,1E
 006B59CF    mov         edx,6B656C;'VolPlus'
 006B59D4    mov         eax,dword ptr [ebx]
 006B59D6    call        THashTable.Add
 006B59DB    mov         ecx,1E
 006B59E0    mov         edx,6B6588;'PlusVolume'
 006B59E5    mov         eax,dword ptr [ebx]
 006B59E7    call        THashTable.Add
 006B59EC    mov         ecx,1E
 006B59F1    mov         edx,6B65AC;'PlusVol'
 006B59F6    mov         eax,dword ptr [ebx]
 006B59F8    call        THashTable.Add
 006B59FD    mov         ecx,1E
 006B5A02    mov         edx,6B65C8;'VolumeUp'
 006B5A07    mov         eax,dword ptr [ebx]
 006B5A09    call        THashTable.Add
 006B5A0E    mov         ecx,1E
 006B5A13    mov         edx,6B65E8;'VolUp'
 006B5A18    mov         eax,dword ptr [ebx]
 006B5A1A    call        THashTable.Add
 006B5A1F    mov         ecx,1F
 006B5A24    mov         edx,6B6600;'VolumeMinus'
 006B5A29    mov         eax,dword ptr [ebx]
 006B5A2B    call        THashTable.Add
 006B5A30    mov         ecx,1F
 006B5A35    mov         edx,6B6624;'VolMinus'
 006B5A3A    mov         eax,dword ptr [ebx]
 006B5A3C    call        THashTable.Add
 006B5A41    mov         ecx,1F
 006B5A46    mov         edx,6B6644;'MinusVolume'
 006B5A4B    mov         eax,dword ptr [ebx]
 006B5A4D    call        THashTable.Add
 006B5A52    mov         ecx,1F
 006B5A57    mov         edx,6B6668;'MinusVol'
 006B5A5C    mov         eax,dword ptr [ebx]
 006B5A5E    call        THashTable.Add
 006B5A63    mov         ecx,1F
 006B5A68    mov         edx,6B6688;'VolumeDown'
 006B5A6D    mov         eax,dword ptr [ebx]
 006B5A6F    call        THashTable.Add
 006B5A74    mov         ecx,1F
 006B5A79    mov         edx,6B66AC;'VolDown'
 006B5A7E    mov         eax,dword ptr [ebx]
 006B5A80    call        THashTable.Add
 006B5A85    mov         ecx,20
 006B5A8A    mov         edx,6B66C8;'Mute'
 006B5A8F    mov         eax,dword ptr [ebx]
 006B5A91    call        THashTable.Add
 006B5A96    mov         ecx,21
 006B5A9B    mov         edx,6B66E0;'ChannelUp'
 006B5AA0    mov         eax,dword ptr [ebx]
 006B5AA2    call        THashTable.Add
 006B5AA7    mov         ecx,21
 006B5AAC    mov         edx,6B6700;'ChUp'
 006B5AB1    mov         eax,dword ptr [ebx]
 006B5AB3    call        THashTable.Add
 006B5AB8    mov         ecx,22
 006B5ABD    mov         edx,6B6718;'ChannelDown'
 006B5AC2    mov         eax,dword ptr [ebx]
 006B5AC4    call        THashTable.Add
 006B5AC9    mov         ecx,22
 006B5ACE    mov         edx,6B673C;'ChDown'
 006B5AD3    mov         eax,dword ptr [ebx]
 006B5AD5    call        THashTable.Add
 006B5ADA    mov         ecx,23
 006B5ADF    mov         edx,6B6758;'ChannelPrev'
 006B5AE4    mov         eax,dword ptr [ebx]
 006B5AE6    call        THashTable.Add
 006B5AEB    mov         ecx,23
 006B5AF0    mov         edx,6B677C;'Recall'
 006B5AF5    mov         eax,dword ptr [ebx]
 006B5AF7    call        THashTable.Add
 006B5AFC    mov         ecx,28
 006B5B01    mov         edx,6B6798;'Up'
 006B5B06    mov         eax,dword ptr [ebx]
 006B5B08    call        THashTable.Add
 006B5B0D    mov         ecx,29
 006B5B12    mov         edx,6B67AC;'Down'
 006B5B17    mov         eax,dword ptr [ebx]
 006B5B19    call        THashTable.Add
 006B5B1E    mov         ecx,2A
 006B5B23    mov         edx,6B67C4;'Left'
 006B5B28    mov         eax,dword ptr [ebx]
 006B5B2A    call        THashTable.Add
 006B5B2F    mov         ecx,2B
 006B5B34    mov         edx,6B67DC;'Right'
 006B5B39    mov         eax,dword ptr [ebx]
 006B5B3B    call        THashTable.Add
 006B5B40    mov         ecx,2C
 006B5B45    mov         edx,6B67F4;'Ok'
 006B5B4A    mov         eax,dword ptr [ebx]
 006B5B4C    call        THashTable.Add
 006B5B51    mov         ecx,2C
 006B5B56    mov         edx,6B6808;'Enter'
 006B5B5B    mov         eax,dword ptr [ebx]
 006B5B5D    call        THashTable.Add
 006B5B62    mov         ecx,2D
 006B5B67    mov         edx,6B6820;'Menu'
 006B5B6C    mov         eax,dword ptr [ebx]
 006B5B6E    call        THashTable.Add
 006B5B73    mov         ecx,32
 006B5B78    mov         edx,6B6838;'Play'
 006B5B7D    mov         eax,dword ptr [ebx]
 006B5B7F    call        THashTable.Add
 006B5B84    mov         ecx,33
 006B5B89    mov         edx,6B6850;'Stop'
 006B5B8E    mov         eax,dword ptr [ebx]
 006B5B90    call        THashTable.Add
 006B5B95    mov         ecx,34
 006B5B9A    mov         edx,6B6868;'Rewind'
 006B5B9F    mov         eax,dword ptr [ebx]
 006B5BA1    call        THashTable.Add
 006B5BA6    mov         ecx,34
 006B5BAB    mov         edx,6B6884;'RW'
 006B5BB0    mov         eax,dword ptr [ebx]
 006B5BB2    call        THashTable.Add
 006B5BB7    mov         ecx,35
 006B5BBC    mov         edx,6B6898;'FastForward'
 006B5BC1    mov         eax,dword ptr [ebx]
 006B5BC3    call        THashTable.Add
 006B5BC8    mov         ecx,35
 006B5BCD    mov         edx,6B68BC;'FastFwd'
 006B5BD2    mov         eax,dword ptr [ebx]
 006B5BD4    call        THashTable.Add
 006B5BD9    mov         ecx,35
 006B5BDE    mov         edx,6B68D8;'FFwd'
 006B5BE3    mov         eax,dword ptr [ebx]
 006B5BE5    call        THashTable.Add
 006B5BEA    mov         ecx,35
 006B5BEF    mov         edx,6B68F0;'FF'
 006B5BF4    mov         eax,dword ptr [ebx]
 006B5BF6    call        THashTable.Add
 006B5BFB    mov         ecx,36
 006B5C00    mov         edx,6B6904;'Pause'
 006B5C05    mov         eax,dword ptr [ebx]
 006B5C07    call        THashTable.Add
 006B5C0C    mov         ecx,37
 006B5C11    mov         edx,6B691C;'NextFrame'
 006B5C16    mov         eax,dword ptr [ebx]
 006B5C18    call        THashTable.Add
 006B5C1D    mov         ecx,37
 006B5C22    mov         edx,6B693C;'Skip'
 006B5C27    mov         eax,dword ptr [ebx]
 006B5C29    call        THashTable.Add
 006B5C2E    mov         ecx,38
 006B5C33    mov         edx,6B6954;'PrevFrame'
 006B5C38    mov         eax,dword ptr [ebx]
 006B5C3A    call        THashTable.Add
 006B5C3F    mov         ecx,38
 006B5C44    mov         edx,6B6974;'JumpBack'
 006B5C49    mov         eax,dword ptr [ebx]
 006B5C4B    call        THashTable.Add
 006B5C50    mov         ecx,39
 006B5C55    mov         edx,6B6994;'Record'
 006B5C5A    mov         eax,dword ptr [ebx]
 006B5C5C    call        THashTable.Add
 006B5C61    mov         ecx,39
 006B5C66    mov         edx,6B69B0;'Rec'
 006B5C6B    mov         eax,dword ptr [ebx]
 006B5C6D    call        THashTable.Add
 006B5C72    mov         ecx,3A
 006B5C77    mov         edx,6B69C4;'NextTrack'
 006B5C7C    mov         eax,dword ptr [ebx]
 006B5C7E    call        THashTable.Add
 006B5C83    mov         ecx,3A
 006B5C88    mov         edx,6B69E4;'LiveTV'
 006B5C8D    mov         eax,dword ptr [ebx]
 006B5C8F    call        THashTable.Add
 006B5C94    mov         ecx,3B
 006B5C99    mov         edx,6B6A00;'PrevTrack'
 006B5C9E    mov         eax,dword ptr [ebx]
 006B5CA0    call        THashTable.Add
 006B5CA5    mov         ecx,3C
 006B5CAA    mov         edx,6B6A20;'DeckB.Play'
 006B5CAF    mov         eax,dword ptr [ebx]
 006B5CB1    call        THashTable.Add
 006B5CB6    mov         ecx,3C
 006B5CBB    mov         edx,6B6A44;'Play2'
 006B5CC0    mov         eax,dword ptr [ebx]
 006B5CC2    call        THashTable.Add
 006B5CC7    mov         ecx,3D
 006B5CCC    mov         edx,6B6A5C;'DeckB.Stop'
 006B5CD1    mov         eax,dword ptr [ebx]
 006B5CD3    call        THashTable.Add
 006B5CD8    mov         ecx,3D
 006B5CDD    mov         edx,6B6A80;'Stop2'
 006B5CE2    mov         eax,dword ptr [ebx]
 006B5CE4    call        THashTable.Add
 006B5CE9    mov         ecx,3E
 006B5CEE    mov         edx,6B6A98;'DeckB.Rewind'
 006B5CF3    mov         eax,dword ptr [ebx]
 006B5CF5    call        THashTable.Add
 006B5CFA    mov         ecx,3E
 006B5CFF    mov         edx,6B6AC0;'DeckB.RW'
 006B5D04    mov         eax,dword ptr [ebx]
 006B5D06    call        THashTable.Add
 006B5D0B    mov         ecx,3E
 006B5D10    mov         edx,6B6AE0;'Rewind2'
 006B5D15    mov         eax,dword ptr [ebx]
 006B5D17    call        THashTable.Add
 006B5D1C    mov         ecx,3E
 006B5D21    mov         edx,6B6AFC;'RW2'
 006B5D26    mov         eax,dword ptr [ebx]
 006B5D28    call        THashTable.Add
 006B5D2D    mov         ecx,3F
 006B5D32    mov         edx,6B6B10;'DeckB.FastForward'
 006B5D37    mov         eax,dword ptr [ebx]
 006B5D39    call        THashTable.Add
 006B5D3E    mov         ecx,3F
 006B5D43    mov         edx,6B6B40;'DeckB.FastFwd'
 006B5D48    mov         eax,dword ptr [ebx]
 006B5D4A    call        THashTable.Add
 006B5D4F    mov         ecx,3F
 006B5D54    mov         edx,6B6B68;'DeckB.FFwd'
 006B5D59    mov         eax,dword ptr [ebx]
 006B5D5B    call        THashTable.Add
 006B5D60    mov         ecx,3F
 006B5D65    mov         edx,6B6B8C;'DeckB.FF'
 006B5D6A    mov         eax,dword ptr [ebx]
 006B5D6C    call        THashTable.Add
 006B5D71    mov         ecx,40
 006B5D76    mov         edx,6B6BAC;'DeckB.Pause'
 006B5D7B    mov         eax,dword ptr [ebx]
 006B5D7D    call        THashTable.Add
 006B5D82    mov         ecx,3F
 006B5D87    mov         edx,6B6BD0;'FastForward2'
 006B5D8C    mov         eax,dword ptr [ebx]
 006B5D8E    call        THashTable.Add
 006B5D93    mov         ecx,3F
 006B5D98    mov         edx,6B6BF8;'FastFwd2'
 006B5D9D    mov         eax,dword ptr [ebx]
 006B5D9F    call        THashTable.Add
 006B5DA4    mov         ecx,3F
 006B5DA9    mov         edx,6B6C18;'FFwd2'
 006B5DAE    mov         eax,dword ptr [ebx]
 006B5DB0    call        THashTable.Add
 006B5DB5    mov         ecx,3F
 006B5DBA    mov         edx,6B6C30;'FF2'
 006B5DBF    mov         eax,dword ptr [ebx]
 006B5DC1    call        THashTable.Add
 006B5DC6    mov         ecx,40
 006B5DCB    mov         edx,6B6BAC;'DeckB.Pause'
 006B5DD0    mov         eax,dword ptr [ebx]
 006B5DD2    call        THashTable.Add
 006B5DD7    mov         ecx,40
 006B5DDC    mov         edx,6B6C44;'Pause2'
 006B5DE1    mov         eax,dword ptr [ebx]
 006B5DE3    call        THashTable.Add
 006B5DE8    mov         ecx,43
 006B5DED    mov         edx,6B6C60;'DeckB.Record'
 006B5DF2    mov         eax,dword ptr [ebx]
 006B5DF4    call        THashTable.Add
 006B5DF9    mov         ecx,43
 006B5DFE    mov         edx,6B6C88;'DeckB.Rec'
 006B5E03    mov         eax,dword ptr [ebx]
 006B5E05    call        THashTable.Add
 006B5E0A    mov         ecx,43
 006B5E0F    mov         edx,6B6CA8;'Record2'
 006B5E14    mov         eax,dword ptr [ebx]
 006B5E16    call        THashTable.Add
 006B5E1B    mov         ecx,43
 006B5E20    mov         edx,6B6CC4;'Rec2'
 006B5E25    mov         eax,dword ptr [ebx]
 006B5E27    call        THashTable.Add
 006B5E2C    mov         ecx,41
 006B5E31    mov         edx,6B6CDC;'PlayBackwards'
 006B5E36    mov         eax,dword ptr [ebx]
 006B5E38    call        THashTable.Add
 006B5E3D    mov         ecx,42
 006B5E42    mov         edx,6B6D04;'DeckB.PlayBackwards'
 006B5E47    mov         eax,dword ptr [ebx]
 006B5E49    call        THashTable.Add
 006B5E4E    mov         ecx,42
 006B5E53    mov         edx,6B6D38;'PlayBackwards2'
 006B5E58    mov         eax,dword ptr [ebx]
 006B5E5A    call        THashTable.Add
 006B5E5F    mov         ecx,46
 006B5E64    mov         edx,6B6D64;'TV'
 006B5E69    mov         eax,dword ptr [ebx]
 006B5E6B    call        THashTable.Add
 006B5E70    mov         ecx,46
 006B5E75    mov         edx,6B6D78;'Television'
 006B5E7A    mov         eax,dword ptr [ebx]
 006B5E7C    call        THashTable.Add
 006B5E81    mov         ecx,47
 006B5E86    mov         edx,6B6D9C;'Teletext'
 006B5E8B    mov         eax,dword ptr [ebx]
 006B5E8D    call        THashTable.Add
 006B5E92    mov         ecx,47
 006B5E97    mov         edx,6B6DBC;'Text'
 006B5E9C    mov         eax,dword ptr [ebx]
 006B5E9E    call        THashTable.Add
 006B5EA3    mov         ecx,48
 006B5EA8    mov         edx,6B6DD4;'Radio'
 006B5EAD    mov         eax,dword ptr [ebx]
 006B5EAF    call        THashTable.Add
 006B5EB4    mov         ecx,48
 006B5EB9    mov         edx,6B6DEC;'Tuner'
 006B5EBE    mov         eax,dword ptr [ebx]
 006B5EC0    call        THashTable.Add
 006B5EC5    mov         ecx,49
 006B5ECA    mov         edx,6B6E04;'EPG'
 006B5ECF    mov         eax,dword ptr [ebx]
 006B5ED1    call        THashTable.Add
 006B5ED6    mov         ecx,49
 006B5EDB    mov         edx,6B6E18;'ElectronicProgramGuide'
 006B5EE0    mov         eax,dword ptr [ebx]
 006B5EE2    call        THashTable.Add
 006B5EE7    mov         ecx,4A
 006B5EEC    mov         edx,6B6E54;'Tape1'
 006B5EF1    mov         eax,dword ptr [ebx]
 006B5EF3    call        THashTable.Add
 006B5EF8    mov         ecx,4A
 006B5EFD    mov         edx,6B6E6C;'DAT'
 006B5F02    mov         eax,dword ptr [ebx]
 006B5F04    call        THashTable.Add
 006B5F09    mov         ecx,4A
 006B5F0E    mov         edx,6B6E80;'DatTape1'
 006B5F13    mov         eax,dword ptr [ebx]
 006B5F15    call        THashTable.Add
 006B5F1A    mov         ecx,4B
 006B5F1F    mov         edx,6B6DEC;'Tuner'
 006B5F24    mov         eax,dword ptr [ebx]
 006B5F26    call        THashTable.Add
 006B5F2B    mov         ecx,4C
 006B5F30    mov         edx,6B6EA0;'DSkip'
 006B5F35    mov         eax,dword ptr [ebx]
 006B5F37    call        THashTable.Add
 006B5F3C    mov         ecx,1C
 006B5F41    mov         edx,6B6EB8;'ToString'
 006B5F46    mov         eax,dword ptr [ebx]
 006B5F48    call        THashTable.Add
 006B5F4D    mov         ecx,50
 006B5F52    mov         edx,6B6ED8;^338:Single
 006B5F57    mov         eax,dword ptr [ebx]
 006B5F59    call        THashTable.Add
 006B5F5E    mov         ecx,51
 006B5F63    mov         edx,6B6EF4;'Screen'
 006B5F68    mov         eax,dword ptr [ebx]
 006B5F6A    call        THashTable.Add
 006B5F6F    mov         ecx,52
 006B5F74    mov         edx,6B6F10;'TvVideo'
 006B5F79    mov         eax,dword ptr [ebx]
 006B5F7B    call        THashTable.Add
 006B5F80    mov         ecx,53
 006B5F85    mov         edx,6B6F2C;'SoundMode'
 006B5F8A    mov         eax,dword ptr [ebx]
 006B5F8C    call        THashTable.Add
 006B5F91    mov         ecx,54
 006B5F96    mov         edx,6B6F4C;'Sleep'
 006B5F9B    mov         eax,dword ptr [ebx]
 006B5F9D    call        THashTable.Add
 006B5FA2    mov         ecx,55
 006B5FA7    mov         edx,6B6F64;'Alarm'
 006B5FAC    mov         eax,dword ptr [ebx]
 006B5FAE    call        THashTable.Add
 006B5FB3    mov         ecx,56
 006B5FB8    mov         edx,6B6F7C;'PlusButton'
 006B5FBD    mov         eax,dword ptr [ebx]
 006B5FBF    call        THashTable.Add
 006B5FC4    mov         ecx,57
 006B5FC9    mov         edx,6B6FA0;'MinusButton'
 006B5FCE    mov         eax,dword ptr [ebx]
 006B5FD0    call        THashTable.Add
 006B5FD5    mov         ecx,58
 006B5FDA    mov         edx,6B6FC4;'Select'
 006B5FDF    mov         eax,dword ptr [ebx]
 006B5FE1    call        THashTable.Add
 006B5FE6    mov         ecx,59
 006B5FEB    mov         edx,6B6FE0;'PicMode'
 006B5FF0    mov         eax,dword ptr [ebx]
 006B5FF2    call        THashTable.Add
 006B5FF7    mov         ecx,5A
 006B5FFC    mov         edx,6B6FFC;'Red'
 006B6001    mov         eax,dword ptr [ebx]
 006B6003    call        THashTable.Add
 006B6008    mov         ecx,5B
 006B600D    mov         edx,6B7010;'Yellow'
 006B6012    mov         eax,dword ptr [ebx]
 006B6014    call        THashTable.Add
 006B6019    mov         ecx,5C
 006B601E    mov         edx,6B702C;'Green'
 006B6023    mov         eax,dword ptr [ebx]
 006B6025    call        THashTable.Add
 006B602A    mov         ecx,5D
 006B602F    mov         edx,6B7044;'Blue'
 006B6034    mov         eax,dword ptr [ebx]
 006B6036    call        THashTable.Add
 006B603B    mov         ecx,5E
 006B6040    mov         edx,6B705C;'AudioMonitor'
 006B6045    mov         eax,dword ptr [ebx]
 006B6047    call        THashTable.Add
 006B604C    mov         ecx,5F
 006B6051    mov         edx,6B7084;'Wide'
 006B6056    mov         eax,dword ptr [ebx]
 006B6058    call        THashTable.Add
 006B605D    mov         ecx,60
 006B6062    mov         edx,6B709C;'Question'
 006B6067    mov         eax,dword ptr [ebx]
 006B6069    call        THashTable.Add
 006B606E    mov         ecx,61
 006B6073    mov         edx,6B70BC;'AudioDub'
 006B6078    mov         eax,dword ptr [ebx]
 006B607A    call        THashTable.Add
 006B607F    mov         ecx,62
 006B6084    mov         edx,6B70DC;'CounterReset'
 006B6089    mov         eax,dword ptr [ebx]
 006B608B    call        THashTable.Add
 006B6090    mov         ecx,63
 006B6095    mov         edx,6B7104;'SyncroPlay'
 006B609A    mov         eax,dword ptr [ebx]
 006B609C    call        THashTable.Add
 006B60A1    mov         ecx,64
 006B60A6    mov         edx,6B7128;'Set'
 006B60AB    mov         eax,dword ptr [ebx]
 006B60AD    call        THashTable.Add
 006B60B2    mov         ecx,65
 006B60B7    mov         edx,6B713C;'QuickTimer'
 006B60BC    mov         eax,dword ptr [ebx]
 006B60BE    call        THashTable.Add
 006B60C3    mov         ecx,66
 006B60C8    mov         edx,6B7160;'Clear'
 006B60CD    mov         eax,dword ptr [ebx]
 006B60CF    call        THashTable.Add
 006B60D4    mov         ecx,67
 006B60D9    mov         edx,6B7178;'GCode'
 006B60DE    mov         eax,dword ptr [ebx]
 006B60E0    call        THashTable.Add
 006B60E5    mov         ecx,68
 006B60EA    mov         edx,6B7190;'Slow'
 006B60EF    mov         eax,dword ptr [ebx]
 006B60F1    call        THashTable.Add
 006B60F6    mov         ecx,68
 006B60FB    mov         edx,6B71A8;'SlowMotion'
 006B6100    mov         eax,dword ptr [ebx]
 006B6102    call        THashTable.Add
 006B6107    mov         ecx,69
 006B610C    mov         edx,6B71CC;'x2'
 006B6111    mov         eax,dword ptr [ebx]
 006B6113    call        THashTable.Add
 006B6118    mov         ecx,69
 006B611D    mov         edx,6B71E0;'Fast'
 006B6122    mov         eax,dword ptr [ebx]
 006B6124    call        THashTable.Add
 006B6129    mov         ecx,6A
 006B612E    mov         edx,6B71F8;'InputSelect'
 006B6133    mov         eax,dword ptr [ebx]
 006B6135    call        THashTable.Add
 006B613A    mov         ecx,6B
 006B613F    mov         edx,6B721C;'TapeSpeed'
 006B6144    mov         eax,dword ptr [ebx]
 006B6146    call        THashTable.Add
 006B614B    mov         ecx,6C
 006B6150    mov         edx,6B723C;'EasyTimer'
 006B6155    mov         eax,dword ptr [ebx]
 006B6157    call        THashTable.Add
 006B615C    pop         ebx
 006B615D    ret
*}
end;

//006B7250
{*function sub_006B7250:?;
begin
 006B7250    push        ebp
 006B7251    mov         ebp,esp
 006B7253    push        0
 006B7255    push        ebx
 006B7256    push        esi
 006B7257    xor         eax,eax
 006B7259    push        ebp
 006B725A    push        6B72B7
 006B725F    push        dword ptr fs:[eax]
 006B7262    mov         dword ptr fs:[eax],esp
 006B7265    mov         dl,1
 006B7267    mov         eax,[0043C7BC];TStringList
 006B726C    call        TStringList.Create;TStringList.Create
 006B7271    mov         esi,eax
 006B7273    mov         dl,1
 006B7275    mov         eax,esi
 006B7277    call        TStringList.SetSorted
 006B727C    xor         ebx,ebx
 006B727E    lea         edx,[ebp-4]
 006B7281    mov         eax,ebx
 006B7283    call        006B56D4
 006B7288    cmp         dword ptr [ebp-4],0
>006B728C    je          006B7298
 006B728E    mov         edx,dword ptr [ebp-4]
 006B7291    mov         eax,esi
 006B7293    mov         ecx,dword ptr [eax]
 006B7295    call        dword ptr [ecx+38];TStringList.Add
 006B7298    inc         ebx
 006B7299    cmp         ebx,10F
>006B729F    jne         006B727E
 006B72A1    xor         eax,eax
 006B72A3    pop         edx
 006B72A4    pop         ecx
 006B72A5    pop         ecx
 006B72A6    mov         dword ptr fs:[eax],edx
 006B72A9    push        6B72BE
 006B72AE    lea         eax,[ebp-4]
 006B72B1    call        @UStrClr
 006B72B6    ret
>006B72B7    jmp         @HandleFinally
>006B72BC    jmp         006B72AE
 006B72BE    mov         eax,esi
 006B72C0    pop         esi
 006B72C1    pop         ebx
 006B72C2    pop         ecx
 006B72C3    pop         ebp
 006B72C4    ret
end;*}

//006B72C8
{*function sub_006B72C8(?:?):?;
begin
 006B72C8    push        ebp
 006B72C9    mov         ebp,esp
 006B72CB    push        ecx
 006B72CC    push        ebx
 006B72CD    mov         dword ptr [ebp-4],eax
 006B72D0    mov         eax,dword ptr [ebp-4]
 006B72D3    call        @UStrAddRef
 006B72D8    xor         eax,eax
 006B72DA    push        ebp
 006B72DB    push        6B7363
 006B72E0    push        dword ptr fs:[eax]
 006B72E3    mov         dword ptr fs:[eax],esp
 006B72E6    lea         eax,[ebp-4]
 006B72E9    mov         edx,6B737C;'remotes'
 006B72EE    call        004F9BD0
 006B72F3    test        al,al
>006B72F5    jne         006B732E
 006B72F7    lea         eax,[ebp-4]
 006B72FA    mov         edx,6B7398;'remotecontrols'
 006B72FF    call        004F9BD0
 006B7304    test        al,al
>006B7306    jne         006B732E
 006B7308    lea         eax,[ebp-4]
 006B730B    mov         edx,6B73C4;'remotecontrol'
 006B7310    call        004F9BD0
 006B7315    test        al,al
>006B7317    jne         006B732E
 006B7319    lea         eax,[ebp-4]
 006B731C    mov         edx,6B73EC;'remote'
 006B7321    call        004F9BD0
 006B7326    test        al,al
>006B7328    jne         006B732E
 006B732A    xor         ebx,ebx
>006B732C    jmp         006B734D
 006B732E    lea         eax,[ebp-4]
 006B7331    call        004F9D00
 006B7336    lea         eax,[ebp-4]
 006B7339    mov         edx,6B7408;'.'
 006B733E    call        004F9BD0
 006B7343    test        al,al
>006B7345    jne         006B734B
 006B7347    xor         ebx,ebx
>006B7349    jmp         006B734D
 006B734B    mov         bl,1
 006B734D    xor         eax,eax
 006B734F    pop         edx
 006B7350    pop         ecx
 006B7351    pop         ecx
 006B7352    mov         dword ptr fs:[eax],edx
 006B7355    push        6B736A
 006B735A    lea         eax,[ebp-4]
 006B735D    call        @UStrClr
 006B7362    ret
>006B7363    jmp         @HandleFinally
>006B7368    jmp         006B735A
 006B736A    mov         eax,ebx
 006B736C    pop         ebx
 006B736D    pop         ecx
 006B736E    pop         ebp
 006B736F    ret
end;*}

//006B740C
{*function sub_006B740C(?:?):?;
begin
 006B740C    push        ebp
 006B740D    mov         ebp,esp
 006B740F    add         esp,0FFFFFFF0
 006B7412    push        ebx
 006B7413    push        esi
 006B7414    push        edi
 006B7415    xor         edx,edx
 006B7417    mov         dword ptr [ebp-8],edx
 006B741A    mov         dword ptr [ebp-4],eax
 006B741D    mov         eax,dword ptr [ebp-4]
 006B7420    call        @UStrAddRef
 006B7425    xor         eax,eax
 006B7427    push        ebp
 006B7428    push        6B7869
 006B742D    push        dword ptr fs:[eax]
 006B7430    mov         dword ptr fs:[eax],esp
 006B7433    xor         ebx,ebx
 006B7435    mov         byte ptr [ebp-0D],0
 006B7439    xor         esi,esi
 006B743B    lea         eax,[ebp-8]
 006B743E    mov         edx,dword ptr [ebp-4]
 006B7441    call        @UStrLAsg
 006B7446    lea         eax,[ebp-8]
 006B7449    mov         edx,6B7888;'remotecontrols'
 006B744E    call        004F9BD0
 006B7453    test        al,al
>006B7455    jne         006B748E
 006B7457    lea         eax,[ebp-8]
 006B745A    mov         edx,6B78B4;'remotecontrol'
 006B745F    call        004F9BD0
 006B7464    test        al,al
>006B7466    jne         006B748E
 006B7468    lea         eax,[ebp-8]
 006B746B    mov         edx,6B78DC;'remotes'
 006B7470    call        004F9BD0
 006B7475    test        al,al
>006B7477    jne         006B748E
 006B7479    lea         eax,[ebp-8]
 006B747C    mov         edx,6B78F8;'remote'
 006B7481    call        004F9BD0
 006B7486    test        al,al
>006B7488    je          006B784E
 006B748E    lea         eax,[ebp-8]
 006B7491    call        004F9D00
 006B7496    mov         edi,eax
 006B7498    lea         eax,[ebp-8]
 006B749B    mov         edx,6B7914;'.'
 006B74A0    call        004F9BD0
 006B74A5    test        al,al
>006B74A7    je          006B784E
 006B74AD    lea         eax,[ebp-8]
 006B74B0    mov         edx,6B7924;'Pinnacle.'
 006B74B5    call        004F9BD0
 006B74BA    test        al,al
>006B74BC    jne         006B74F1
 006B74BE    lea         eax,[ebp-8]
 006B74C1    mov         edx,6B7944;'Pinacle.'
 006B74C6    call        004F9BD0
 006B74CB    test        al,al
>006B74CD    jne         006B74F1
 006B74CF    lea         eax,[ebp-8]
 006B74D2    mov         edx,6B7964;'PCTV.'
 006B74D7    call        004F9BD0
 006B74DC    test        al,al
>006B74DE    jne         006B74F1
 006B74E0    lea         eax,[ebp-8]
 006B74E3    mov         edx,6B797C;'PCTVPro.'
 006B74E8    call        004F9BD0
 006B74ED    test        al,al
>006B74EF    je          006B74F8
 006B74F1    mov         bl,1
>006B74F3    jmp         006B7581
 006B74F8    lea         eax,[ebp-8]
 006B74FB    mov         edx,6B799C;'Sony.'
 006B7500    call        004F9BD0
 006B7505    test        al,al
>006B7507    je          006B750D
 006B7509    mov         bl,2
>006B750B    jmp         006B7581
 006B750D    lea         eax,[ebp-8]
 006B7510    mov         edx,6B79B4;'NEC.'
 006B7515    call        004F9BD0
 006B751A    test        al,al
>006B751C    je          006B7522
 006B751E    mov         bl,3
>006B7520    jmp         006B7581
 006B7522    lea         eax,[ebp-8]
 006B7525    mov         edx,6B79CC;'Akai.'
 006B752A    call        004F9BD0
 006B752F    test        al,al
>006B7531    je          006B7537
 006B7533    mov         bl,4
>006B7535    jmp         006B7581
 006B7537    lea         eax,[ebp-8]
 006B753A    mov         edx,6B79E4;'NuTec.'
 006B753F    call        004F9BD0
 006B7544    test        al,al
>006B7546    jne         006B756A
 006B7548    lea         eax,[ebp-8]
 006B754B    mov         edx,6B7A00;'Nu_Tec.'
 006B7550    call        004F9BD0
 006B7555    test        al,al
>006B7557    jne         006B756A
 006B7559    lea         eax,[ebp-8]
 006B755C    mov         edx,6B7A1C;'Nu.Tec.'
 006B7561    call        004F9BD0
 006B7566    test        al,al
>006B7568    je          006B756E
 006B756A    mov         bl,5
>006B756C    jmp         006B7581
 006B756E    lea         eax,[ebp-8]
 006B7571    mov         edx,6B7A38;'Benq.'
 006B7576    call        004F9BD0
 006B757B    test        al,al
>006B757D    je          006B7581
 006B757F    mov         bl,6
 006B7581    lea         eax,[ebp-8]
 006B7584    mov         edx,6B7A50;'Computer.'
 006B7589    call        004F9BD0
 006B758E    test        al,al
>006B7590    jne         006B75A3
 006B7592    lea         eax,[ebp-8]
 006B7595    mov         edx,6B7A70;'PC.'
 006B759A    call        004F9BD0
 006B759F    test        al,al
>006B75A1    je          006B75AC
 006B75A3    mov         byte ptr [ebp-0D],1
>006B75A7    jmp         006B7737
 006B75AC    lea         eax,[ebp-8]
 006B75AF    mov         edx,6B7A84;'VCR.'
 006B75B4    call        004F9BD0
 006B75B9    test        al,al
>006B75BB    jne         006B75F0
 006B75BD    lea         eax,[ebp-8]
 006B75C0    mov         edx,6B7A9C;'Video.'
 006B75C5    call        004F9BD0
 006B75CA    test        al,al
>006B75CC    jne         006B75F0
 006B75CE    lea         eax,[ebp-8]
 006B75D1    mov         edx,6B7AB8;'VideoRecorder.'
 006B75D6    call        004F9BD0
 006B75DB    test        al,al
>006B75DD    jne         006B75F0
 006B75DF    lea         eax,[ebp-8]
 006B75E2    mov         edx,6B7AE4;'VHS.'
 006B75E7    call        004F9BD0
 006B75EC    test        al,al
>006B75EE    je          006B75F9
 006B75F0    mov         byte ptr [ebp-0D],3
>006B75F4    jmp         006B7737
 006B75F9    lea         eax,[ebp-8]
 006B75FC    mov         edx,6B7AFC;'TV.'
 006B7601    call        004F9BD0
 006B7606    test        al,al
>006B7608    jne         006B761B
 006B760A    lea         eax,[ebp-8]
 006B760D    mov         edx,6B7B10;'Television.'
 006B7612    call        004F9BD0
 006B7617    test        al,al
>006B7619    je          006B7624
 006B761B    mov         byte ptr [ebp-0D],2
>006B761F    jmp         006B7737
 006B7624    lea         eax,[ebp-8]
 006B7627    mov         edx,6B7B34;'Stereo.'
 006B762C    call        004F9BD0
 006B7631    test        al,al
>006B7633    jne         006B7657
 006B7635    lea         eax,[ebp-8]
 006B7638    mov         edx,6B7B50;'Audio.'
 006B763D    call        004F9BD0
 006B7642    test        al,al
>006B7644    jne         006B7657
 006B7646    lea         eax,[ebp-8]
 006B7649    mov         edx,6B7B6C;'HiFi.'
 006B764E    call        004F9BD0
 006B7653    test        al,al
>006B7655    je          006B7660
 006B7657    mov         byte ptr [ebp-0D],5
>006B765B    jmp         006B7737
 006B7660    lea         eax,[ebp-8]
 006B7663    mov         edx,6B7B84;'Phono.'
 006B7668    call        004F9BD0
 006B766D    test        al,al
>006B766F    jne         006B7682
 006B7671    lea         eax,[ebp-8]
 006B7674    mov         edx,6B7BA0;'RecordPlayer.'
 006B7679    call        004F9BD0
 006B767E    test        al,al
>006B7680    je          006B768B
 006B7682    mov         byte ptr [ebp-0D],6
>006B7686    jmp         006B7737
 006B768B    lea         eax,[ebp-8]
 006B768E    mov         edx,6B7BC8;'Radio.'
 006B7693    call        004F9BD0
 006B7698    test        al,al
>006B769A    jne         006B76AD
 006B769C    lea         eax,[ebp-8]
 006B769F    mov         edx,6B7BE4;'Tuner.'
 006B76A4    call        004F9BD0
 006B76A9    test        al,al
>006B76AB    je          006B76B6
 006B76AD    mov         byte ptr [ebp-0D],7
>006B76B1    jmp         006B7737
 006B76B6    lea         eax,[ebp-8]
 006B76B9    mov         edx,6B7C00;'CD.'
 006B76BE    call        004F9BD0
 006B76C3    test        al,al
>006B76C5    jne         006B76E9
 006B76C7    lea         eax,[ebp-8]
 006B76CA    mov         edx,6B7C14;'CDPlayer.'
 006B76CF    call        004F9BD0
 006B76D4    test        al,al
>006B76D6    jne         006B76E9
 006B76D8    lea         eax,[ebp-8]
 006B76DB    mov         edx,6B7C34;'CompactDisc.'
 006B76E0    call        004F9BD0
 006B76E5    test        al,al
>006B76E7    je          006B76EF
 006B76E9    mov         byte ptr [ebp-0D],8
>006B76ED    jmp         006B7737
 006B76EF    lea         eax,[ebp-8]
 006B76F2    mov         edx,6B7C5C;'Tape.'
 006B76F7    call        004F9BD0
 006B76FC    test        al,al
>006B76FE    jne         006B7733
 006B7700    lea         eax,[ebp-8]
 006B7703    mov         edx,6B7C74;'Tape2.'
 006B7708    call        004F9BD0
 006B770D    test        al,al
>006B770F    jne         006B7733
 006B7711    lea         eax,[ebp-8]
 006B7714    mov         edx,6B7C90;'TapePlayer.'
 006B7719    call        004F9BD0
 006B771E    test        al,al
>006B7720    jne         006B7733
 006B7722    lea         eax,[ebp-8]
 006B7725    mov         edx,6B7CB4;'Cassette.'
 006B772A    call        004F9BD0
 006B772F    test        al,al
>006B7731    je          006B7737
 006B7733    mov         byte ptr [ebp-0D],9
 006B7737    test        bl,bl
>006B7739    jne         006B7813
 006B773F    lea         eax,[ebp-8]
 006B7742    mov         edx,6B7924;'Pinnacle.'
 006B7747    call        004F9BD0
 006B774C    test        al,al
>006B774E    jne         006B7783
 006B7750    lea         eax,[ebp-8]
 006B7753    mov         edx,6B7944;'Pinacle.'
 006B7758    call        004F9BD0
 006B775D    test        al,al
>006B775F    jne         006B7783
 006B7761    lea         eax,[ebp-8]
 006B7764    mov         edx,6B7964;'PCTV.'
 006B7769    call        004F9BD0
 006B776E    test        al,al
>006B7770    jne         006B7783
 006B7772    lea         eax,[ebp-8]
 006B7775    mov         edx,6B797C;'PCTVPro.'
 006B777A    call        004F9BD0
 006B777F    test        al,al
>006B7781    je          006B778A
 006B7783    mov         bl,1
>006B7785    jmp         006B7813
 006B778A    lea         eax,[ebp-8]
 006B778D    mov         edx,6B799C;'Sony.'
 006B7792    call        004F9BD0
 006B7797    test        al,al
>006B7799    je          006B779F
 006B779B    mov         bl,2
>006B779D    jmp         006B7813
 006B779F    lea         eax,[ebp-8]
 006B77A2    mov         edx,6B79B4;'NEC.'
 006B77A7    call        004F9BD0
 006B77AC    test        al,al
>006B77AE    je          006B77B4
 006B77B0    mov         bl,3
>006B77B2    jmp         006B7813
 006B77B4    lea         eax,[ebp-8]
 006B77B7    mov         edx,6B79CC;'Akai.'
 006B77BC    call        004F9BD0
 006B77C1    test        al,al
>006B77C3    je          006B77C9
 006B77C5    mov         bl,4
>006B77C7    jmp         006B7813
 006B77C9    lea         eax,[ebp-8]
 006B77CC    mov         edx,6B79E4;'NuTec.'
 006B77D1    call        004F9BD0
 006B77D6    test        al,al
>006B77D8    jne         006B77FC
 006B77DA    lea         eax,[ebp-8]
 006B77DD    mov         edx,6B7A00;'Nu_Tec.'
 006B77E2    call        004F9BD0
 006B77E7    test        al,al
>006B77E9    jne         006B77FC
 006B77EB    lea         eax,[ebp-8]
 006B77EE    mov         edx,6B7A1C;'Nu.Tec.'
 006B77F3    call        004F9BD0
 006B77F8    test        al,al
>006B77FA    je          006B7800
 006B77FC    mov         bl,5
>006B77FE    jmp         006B7813
 006B7800    lea         eax,[ebp-8]
 006B7803    mov         edx,6B7A38;'Benq.'
 006B7808    call        004F9BD0
 006B780D    test        al,al
>006B780F    je          006B7813
 006B7811    mov         bl,6
 006B7813    mov         eax,dword ptr [ebp-8]
 006B7816    call        006B5684
 006B781B    mov         dword ptr [ebp-0C],eax
 006B781E    cmp         dword ptr [ebp-0C],0
>006B7822    jl          006B784E
 006B7824    mov         dl,1
 006B7826    mov         eax,[006B51A0];TRemoteValue
 006B782B    call        TObject.Create;TRemoteValue.Create
 006B7830    mov         esi,eax
 006B7832    mov         eax,dword ptr [ebp-0C]
 006B7835    mov         dword ptr [esi+24],eax;TRemoteValue.Item:Integer
 006B7838    test        edi,edi
>006B783A    jg          006B7841
 006B783C    mov         edi,1
 006B7841    mov         dword ptr [esi+18],edi;TRemoteValue........................................................
 006B7844    mov         byte ptr [esi+20],bl;TRemoteValue.Brand:byte
 006B7847    movzx       eax,byte ptr [ebp-0D]
 006B784B    mov         byte ptr [esi+21],al;TRemoteValue.Device:byte
 006B784E    xor         eax,eax
 006B7850    pop         edx
 006B7851    pop         ecx
 006B7852    pop         ecx
 006B7853    mov         dword ptr fs:[eax],edx
 006B7856    push        6B7870
 006B785B    lea         eax,[ebp-8]
 006B785E    mov         edx,2
 006B7863    call        @UStrArrayClr
 006B7868    ret
>006B7869    jmp         @HandleFinally
>006B786E    jmp         006B785B
 006B7870    mov         eax,esi
 006B7872    pop         edi
 006B7873    pop         esi
 006B7874    pop         ebx
 006B7875    mov         esp,ebp
 006B7877    pop         ebp
 006B7878    ret
end;*}

//006B7CC8
procedure sub_006B7CC8;
begin
{*
 006B7CC8    push        ebp
 006B7CC9    mov         ebp,esp
 006B7CCB    add         esp,0FFFFFFC8
 006B7CCE    push        ebx
 006B7CCF    push        esi
 006B7CD0    push        edi
 006B7CD1    xor         eax,eax
 006B7CD3    mov         dword ptr [ebp-38],eax
 006B7CD6    mov         dword ptr [ebp-4],eax
 006B7CD9    mov         ebx,78BE88;gvar_0078BE88:Integer
 006B7CDE    lea         esi,[ebp-20]
 006B7CE1    xor         eax,eax
 006B7CE3    push        ebp
 006B7CE4    push        6B7E56
 006B7CE9    push        dword ptr fs:[eax]
 006B7CEC    mov         dword ptr fs:[eax],esp
 006B7CEF    mov         eax,78BE80;gvar_0078BE80
 006B7CF4    call        @UStrClr
 006B7CF9    xor         eax,eax
 006B7CFB    mov         [0078BE70],eax;gvar_0078BE70
 006B7D00    mov         byte ptr ds:[78BE74],0;gvar_0078BE74
 006B7D07    xor         eax,eax
 006B7D09    mov         [0078BE78],eax;gvar_0078BE78
 006B7D0E    push        6B7E70;'COM'
 006B7D13    lea         edx,[ebp-38]
 006B7D16    mov         eax,[0078BE84];0x2 gvar_0078BE84
 006B7D1B    call        IntToStr
 006B7D20    push        dword ptr [ebp-38]
 006B7D23    push        6B7E84;':'
 006B7D28    lea         eax,[ebp-4]
 006B7D2B    mov         edx,3
 006B7D30    call        @UStrCatN
 006B7D35    push        0
 006B7D37    push        0
 006B7D39    push        3
 006B7D3B    push        0
 006B7D3D    push        0
 006B7D3F    push        80000000
 006B7D44    mov         eax,dword ptr [ebp-4]
 006B7D47    call        @UStrToPWChar
 006B7D4C    push        eax
 006B7D4D    call        kernel32.CreateFileW
 006B7D52    mov         dword ptr [ebx],eax
 006B7D54    cmp         dword ptr [ebx],0FFFFFFFF
>006B7D57    je          006B7E38
 006B7D5D    mov         dword ptr ds:[81F534],1C;gvar_0081F534
 006B7D67    push        81F534;gvar_0081F534
 006B7D6C    mov         eax,dword ptr [ebx]
 006B7D6E    push        eax
 006B7D6F    call        kernel32.GetCommState
 006B7D74    test        eax,eax
>006B7D76    jne         006B7D83
 006B7D78    mov         dword ptr [ebx],0FFFFFFFF
>006B7D7E    jmp         006B7E38
 006B7D83    push        esi
 006B7D84    mov         edi,esi
 006B7D86    mov         esi,81F534;gvar_0081F534
 006B7D8B    mov         ecx,7
 006B7D90    rep movs    dword ptr [edi],dword ptr [esi]
 006B7D92    pop         esi
 006B7D93    push        81F550;gvar_0081F550
 006B7D98    mov         eax,dword ptr [ebx]
 006B7D9A    push        eax
 006B7D9B    call        kernel32.GetCommTimeouts
 006B7DA0    test        eax,eax
>006B7DA2    jne         006B7DAF
 006B7DA4    mov         dword ptr [ebx],0FFFFFFFF
>006B7DAA    jmp         006B7E38
 006B7DAF    push        esi
 006B7DB0    mov         esi,81F550;gvar_0081F550
 006B7DB5    lea         edi,[ebp-34]
 006B7DB8    movs        dword ptr [edi],dword ptr [esi]
 006B7DB9    movs        dword ptr [edi],dword ptr [esi]
 006B7DBA    movs        dword ptr [edi],dword ptr [esi]
 006B7DBB    movs        dword ptr [edi],dword ptr [esi]
 006B7DBC    movs        dword ptr [edi],dword ptr [esi]
 006B7DBD    pop         esi
 006B7DBE    mov         dword ptr [esi+4],4B0
 006B7DC5    mov         byte ptr [esi+12],8
 006B7DC9    mov         byte ptr [esi+13],0
 006B7DCD    mov         byte ptr [esi+14],0
 006B7DD1    xor         eax,eax
 006B7DD3    mov         dword ptr [esi+8],eax
 006B7DD6    inc         dword ptr [esi+8]
 006B7DD9    add         dword ptr [esi+8],2
 006B7DDD    add         dword ptr [esi+8],80
 006B7DE4    add         dword ptr [esi+8],1000
 006B7DEB    add         dword ptr [esi+8],0
 006B7DEF    push        esi
 006B7DF0    mov         eax,dword ptr [ebx]
 006B7DF2    push        eax
 006B7DF3    call        kernel32.SetCommState
 006B7DF8    test        eax,eax
>006B7DFA    jne         006B7E04
 006B7DFC    mov         dword ptr [ebx],0FFFFFFFF
>006B7E02    jmp         006B7E38
 006B7E04    mov         dword ptr [ebp-34],0FFFFFFFF
 006B7E0B    xor         eax,eax
 006B7E0D    mov         dword ptr [ebp-30],eax
 006B7E10    xor         eax,eax
 006B7E12    mov         dword ptr [ebp-2C],eax
 006B7E15    lea         eax,[ebp-34]
 006B7E18    push        eax
 006B7E19    mov         eax,dword ptr [ebx]
 006B7E1B    push        eax
 006B7E1C    call        kernel32.SetCommTimeouts
 006B7E21    test        eax,eax
>006B7E23    jne         006B7E38
 006B7E25    push        81F534;gvar_0081F534
 006B7E2A    mov         eax,dword ptr [ebx]
 006B7E2C    push        eax
 006B7E2D    call        kernel32.SetCommState
 006B7E32    mov         dword ptr [ebx],0FFFFFFFF
 006B7E38    xor         eax,eax
 006B7E3A    pop         edx
 006B7E3B    pop         ecx
 006B7E3C    pop         ecx
 006B7E3D    mov         dword ptr fs:[eax],edx
 006B7E40    push        6B7E5D
 006B7E45    lea         eax,[ebp-38]
 006B7E48    call        @UStrClr
 006B7E4D    lea         eax,[ebp-4]
 006B7E50    call        @UStrClr
 006B7E55    ret
>006B7E56    jmp         @HandleFinally
>006B7E5B    jmp         006B7E45
 006B7E5D    pop         edi
 006B7E5E    pop         esi
 006B7E5F    pop         ebx
 006B7E60    mov         esp,ebp
 006B7E62    pop         ebp
 006B7E63    ret
*}
end;

//006B7E88
procedure sub_006B7E88;
begin
{*
 006B7E88    xor         eax,eax
 006B7E8A    mov         [0078BE70],eax;gvar_0078BE70
 006B7E8F    mov         byte ptr ds:[78BE74],0;gvar_0078BE74
 006B7E96    mov         byte ptr ds:[81F520],0;gvar_0081F520
 006B7E9D    xor         eax,eax
 006B7E9F    mov         [0078BE78],eax;gvar_0078BE78
 006B7EA4    mov         eax,78BE80;gvar_0078BE80
 006B7EA9    call        @UStrClr
 006B7EAE    cmp         dword ptr ds:[78BE88],0FFFFFFFF;gvar_0078BE88:Integer
>006B7EB5    je          006B7EEC
 006B7EB7    push        81F550;gvar_0081F550
 006B7EBC    mov         eax,[0078BE88];0xFFFFFFFF gvar_0078BE88:Integer
 006B7EC1    push        eax
 006B7EC2    call        kernel32.SetCommTimeouts
 006B7EC7    push        81F534;gvar_0081F534
 006B7ECC    mov         eax,[0078BE88];0xFFFFFFFF gvar_0078BE88:Integer
 006B7ED1    push        eax
 006B7ED2    call        kernel32.SetCommState
 006B7ED7    mov         eax,[0078BE88];0xFFFFFFFF gvar_0078BE88:Integer
 006B7EDC    push        eax
 006B7EDD    call        kernel32.CloseHandle
 006B7EE2    mov         dword ptr ds:[78BE88],0FFFFFFFF;gvar_0078BE88:Integer
 006B7EEC    ret
*}
end;

//006B7EF0
{*procedure sub_006B7EF0(?:?; ?:?);
begin
 006B7EF0    push        ebx
 006B7EF1    mov         ebx,edx
 006B7EF3    cmp         eax,4CB4FF
>006B7EF8    jg          006B820F
>006B7EFE    je          006B8C57
 006B7F04    cmp         eax,34ADFE
>006B7F09    jg          006B8093
>006B7F0F    je          006B851A
 006B7F15    cmp         eax,2CB1FC
>006B7F1A    jg          006B7FE3
>006B7F20    je          006B895A
 006B7F26    cmp         eax,2C54FA
>006B7F2B    jg          006B7F8C
>006B7F2D    je          006B86A1
 006B7F33    cmp         eax,2C35F1
>006B7F38    jg          006B7F66
>006B7F3A    je          006B88B0
 006B7F40    sub         eax,2C1AF1
>006B7F45    je          006B88C1
 006B7F4B    sub         eax,100C
>006B7F50    je          006B8C68
 006B7F56    sub         eax,300
>006B7F5B    je          006B8BE0
>006B7F61    jmp         006B8D2A
 006B7F66    sub         eax,2C42FF
>006B7F6B    je          006B85F7
 006B7F71    sub         eax,2E3
>006B7F76    je          006B8A26
 006B7F7C    sub         eax,0C1C
>006B7F81    je          006B875C
>006B7F87    jmp         006B8D2A
 006B7F8C    cmp         eax,2C58FC
>006B7F91    jg          006B7FBD
>006B7F93    je          006B8C24
 006B7F99    sub         eax,2C55E2
>006B7F9E    je          006B8A15
 006B7FA4    sub         eax,1A
>006B7FA7    je          006B8CE4
 006B7FAD    sub         eax,2FE
>006B7FB2    je          006B8C13
>006B7FB8    jmp         006B8D2A
 006B7FBD    sub         eax,2C82FD
>006B7FC2    je          006B8AD0
 006B7FC8    sub         eax,1FFD
>006B7FCD    je          006B8A37
 006B7FD3    sub         eax,147
>006B7FD8    je          006B8B03
>006B7FDE    jmp         006B8D2A
 006B7FE3    cmp         eax,345AFC
>006B7FE8    jg          006B8047
>006B7FEA    je          006B8BAD
 006B7FF0    cmp         eax,3454FA
>006B7FF5    jg          006B8023
>006B7FF7    je          006B8690
 006B7FFD    sub         eax,342DFD
>006B8002    je          006B8BF1
 006B8008    sub         eax,1502
>006B800D    je          006B85E6
 006B8013    sub         eax,0A00
>006B8018    je          006B89F3
>006B801E    jmp         006B8D2A
 006B8023    sub         eax,3454FC
>006B8028    je          006B8B58
 006B802E    sub         eax,2
>006B8031    je          006B86F6
 006B8037    sub         eax,5FC
>006B803C    je          006B862A
>006B8042    jmp         006B8D2A
 006B8047    cmp         eax,3482FD
>006B804C    jg          006B8078
>006B804E    je          006B8ABF
 006B8054    sub         eax,3462AD
>006B8059    je          006B854D
 006B805F    sub         eax,1F4D
>006B8064    je          006B8718
 006B806A    sub         eax,4
>006B806D    je          006B874B
>006B8073    jmp         006B8D2A
 006B8078    sub         eax,3485FA
>006B807D    je          006B8729
 006B8083    sub         eax,2704
>006B8088    je          006B8C46
>006B808E    jmp         006B8D2A
 006B8093    cmp         eax,4C51FC
>006B8098    jg          006B815F
>006B809E    je          006B89E2
 006B80A4    cmp         eax,4C2DFE
>006B80A9    jg          006B8106
>006B80AB    je          006B8905
 006B80B1    cmp         eax,4C28FE
>006B80B6    jg          006B80E4
>006B80B8    je          006B87E4
 006B80BE    sub         eax,34B5FA
>006B80C3    je          006B863B
 006B80C9    sub         eax,159650
>006B80CE    je          006B856F
 006B80D4    sub         eax,1C8B3
>006B80D9    je          006B885B
>006B80DF    jmp         006B8D2A
 006B80E4    sub         eax,4C29FD
>006B80E9    je          006B884A
 006B80EF    dec         eax
>006B80F0    je          006B87F5
 006B80F6    sub         eax,3FF
>006B80FB    je          006B88F4
>006B8101    jmp         006B8D2A
 006B8106    cmp         eax,4C4A4C;^TObject.AfterConstruction
>006B810B    jg          006B8139
>006B810D    je          006B855E
 006B8113    sub         eax,4C41FF
>006B8118    je          006B86C3
 006B811E    sub         eax,100
>006B8123    je          006B8619
 006B8129    sub         eax,74B
>006B812E    je          006B8580
>006B8134    jmp         006B8D2A
 006B8139    sub         eax,4C4CFF
>006B813E    je          006B8817
 006B8144    sub         eax,100
>006B8149    je          006B8806
 006B814F    sub         eax,3A3
>006B8154    je          006B8CBA
>006B815A    jmp         006B8D2A
 006B815F    cmp         eax,4C84D1
>006B8164    jg          006B81C1
>006B8166    je          006B8B36
 006B816C    cmp         eax,4C55FC
>006B8171    jg          006B819B
>006B8173    je          006B8D0E
 006B8179    sub         eax,4C51FE
>006B817E    je          006B8C02
 006B8184    sub         eax,2FE
>006B8189    je          006B8C8A
 006B818F    dec         eax
>006B8190    je          006B8B8B
>006B8196    jmp         006B8D2A
 006B819B    sub         eax,4C6AFC
>006B81A0    je          006B8A59
 006B81A6    sub         eax,1701
>006B81AB    je          006B8D1C
 006B81B1    sub         eax,100
>006B81B6    je          006B8AF2
>006B81BC    jmp         006B8D2A
 006B81C1    cmp         eax,4CAAFF
>006B81C6    jg          006B81F4
>006B81C8    je          006B8A6A
 006B81CE    sub         eax,4C8D41
>006B81D3    je          006B8B14
 006B81D9    sub         eax,0BC
>006B81DE    je          006B8916
 006B81E4    sub         eax,702
>006B81E9    je          006B864C
>006B81EF    jmp         006B8D2A
 006B81F4    sub         eax,4CACFE
>006B81F9    je          006B877E
 006B81FF    sub         eax,4FE
>006B8204    je          006B898D
>006B820A    jmp         006B8D2A
 006B820F    cmp         eax,8C81FA
>006B8214    jg          006B839C
>006B821A    je          006B86D4
 006B8220    cmp         eax,5454FC
>006B8225    jg          006B82EA
>006B822B    je          006B8CAC
 006B8231    cmp         eax,5441F2
>006B8236    jg          006B8295
>006B8238    je          006B866E
 006B823E    cmp         eax,542CFD
>006B8243    jg          006B8271
>006B8245    je          006B8CC8
 006B824B    sub         eax,4CD5FC
>006B8250    je          006B8A48
 006B8256    sub         eax,744F5
>006B825B    je          006B8949
 006B8261    sub         eax,1207
>006B8266    je          006B8CD6
>006B826C    jmp         006B8D2A
 006B8271    sub         eax,542DF4
>006B8276    je          006B86B2
 006B827C    sub         eax,4
>006B827F    je          006B8D00
 006B8285    sub         eax,7F9
>006B828A    je          006B8938
>006B8290    jmp         006B8D2A
 006B8295    cmp         eax,544DFF
>006B829A    jg          006B82C6
>006B829C    je          006B886C
 006B82A2    sub         eax,5442FF
>006B82A7    je          006B85C4
 006B82AD    sub         eax,0A00
>006B82B2    je          006B889F
 006B82B8    sub         eax,55
>006B82BB    je          006B8B25
>006B82C1    jmp         006B8D2A
 006B82C6    sub         eax,5451FE
>006B82CB    je          006B8707
 006B82D1    sub         eax,0FE
>006B82D6    je          006B8AE1
 006B82DC    sub         eax,2
>006B82DF    je          006B8608
>006B82E5    jmp         006B8D2A
 006B82EA    cmp         eax,8C2AFE
>006B82EF    jg          006B834E
>006B82F1    je          006B867F
 006B82F7    cmp         eax,54ADFE
>006B82FC    jg          006B8328
>006B82FE    je          006B8B7A
 006B8304    sub         eax,5482FD
>006B8309    je          006B8A9D
 006B830F    sub         eax,9FD
>006B8314    je          006B853C
 006B831A    sub         eax,2
>006B831D    je          006B8C79
>006B8323    jmp         006B8D2A
 006B8328    sub         eax,54B1FC
>006B832D    je          006B89C0
 006B8333    sub         eax,2FE
>006B8338    je          006B897C
 006B833E    sub         eax,102
>006B8343    je          006B89AF
>006B8349    jmp         006B8D2A
 006B834E    cmp         eax,8C51FE
>006B8353    jg          006B8381
>006B8355    je          006B86E5
 006B835B    sub         eax,8C2DFD
>006B8360    je          006B8CF2
 006B8366    sub         eax,1502
>006B836B    je          006B85D5
 006B8371    sub         eax,0A00
>006B8376    je          006B88D2
>006B837C    jmp         006B8D2A
 006B8381    sub         eax,8C54FE
>006B8386    je          006B873A
 006B838C    sub         eax,100
>006B8391    je          006B876D
>006B8397    jmp         006B8D2A
 006B839C    cmp         eax,0AC82FD
>006B83A1    jg          006B846A
>006B83A7    je          006B8A8C
 006B83AD    cmp         eax,0AC2CFD
>006B83B2    jg          006B8413
>006B83B4    je          006B8C9B
 006B83BA    cmp         eax,8C85FE
>006B83BF    jg          006B83ED
>006B83C1    je          006B87C2
 006B83C7    sub         eax,8C81FE
>006B83CC    je          006B87D3
 006B83D2    sub         eax,0FF
>006B83D7    je          006B8AAE
 006B83DD    sub         eax,2FD
>006B83E2    je          006B87B1
>006B83E8    jmp         006B8D2A
 006B83ED    sub         eax,8C8DFD
>006B83F2    je          006B8927
 006B83F8    sub         eax,2001
>006B83FD    je          006B878F
 006B8403    sub         eax,3FE
>006B8408    je          006B899E
>006B840E    jmp         006B8D2A
 006B8413    cmp         eax,0AC51FC
>006B8418    jg          006B8446
>006B841A    je          006B8A04
 006B8420    sub         eax,0AC2DFD
>006B8425    je          006B8C35
 006B842B    sub         eax,1502
>006B8430    je          006B85B3
 006B8436    sub         eax,0B00
>006B843B    je          006B887D
>006B8441    jmp         006B8D2A
 006B8446    sub         eax,0AC51FE
>006B844B    je          006B852B
 006B8451    sub         eax,3FE
>006B8456    je          006B8BBE
 006B845C    sub         eax,2
>006B845F    je          006B87A0
>006B8465    jmp         006B8D2A
 006B846A    cmp         eax,0B44CFF
>006B846F    jg          006B84D0
>006B8471    je          006B8828
 006B8477    cmp         eax,0B42DFD
>006B847C    jg          006B84AA
>006B847E    je          006B8B9C
 006B8484    sub         eax,0AC8DFD
>006B8489    je          006B88E3
 006B848F    sub         eax,2001
>006B8494    je          006B8B69
 006B849A    sub         eax,3FE
>006B849F    je          006B896B
>006B84A5    jmp         006B8D2A
 006B84AA    sub         eax,0B43441
>006B84AF    je          006B8BCF
 006B84B5    sub         eax,0EBE
>006B84BA    je          006B8591
 006B84C0    sub         eax,400
>006B84C5    je          006B85A2
>006B84CB    jmp         006B8D2A
 006B84D0    cmp         eax,0B48DFD
>006B84D5    jg          006B8503
>006B84D7    je          006B888E
 006B84DD    sub         eax,0B451FC
>006B84E2    je          006B89D1
 006B84E8    sub         eax,3101
>006B84ED    je          006B8A7B
 006B84F3    sub         eax,0A44
>006B84F8    je          006B8B47
>006B84FE    jmp         006B8D2A
 006B8503    sub         eax,0B4ADFD
>006B8508    je          006B8839
 006B850E    dec         eax
>006B850F    je          006B865D
>006B8515    jmp         006B8D2A
 006B851A    mov         eax,ebx
 006B851C    mov         edx,6B8D54;'TV.Off'
 006B8521    call        @UStrAsg
>006B8526    jmp         006B8D31
 006B852B    mov         eax,ebx
 006B852D    mov         edx,6B8D70;'TV.Display'
 006B8532    call        @UStrAsg
>006B8537    jmp         006B8D31
 006B853C    mov         eax,ebx
 006B853E    mov         edx,6B8D94;'TV.AudioMonitor'
 006B8543    call        @UStrAsg
>006B8548    jmp         006B8D31
 006B854D    mov         eax,ebx
 006B854F    mov         edx,6B8DC0;'TV.Wide'
 006B8554    call        @UStrAsg
>006B8559    jmp         006B8D31
 006B855E    mov         eax,ebx
 006B8560    mov         edx,6B8DDC;'TV.1'
 006B8565    call        @UStrAsg
>006B856A    jmp         006B8D31
 006B856F    mov         eax,ebx
 006B8571    mov         edx,6B8DF4;'TV.1a'
 006B8576    call        @UStrAsg
>006B857B    jmp         006B8D31
 006B8580    mov         eax,ebx
 006B8582    mov         edx,6B8E0C;'TV.1b'
 006B8587    call        @UStrAsg
>006B858C    jmp         006B8D31
 006B8591    mov         eax,ebx
 006B8593    mov         edx,6B8E24;'TV.2'
 006B8598    call        @UStrAsg
>006B859D    jmp         006B8D31
 006B85A2    mov         eax,ebx
 006B85A4    mov         edx,6B8E3C;'TV.2a'
 006B85A9    call        @UStrAsg
>006B85AE    jmp         006B8D31
 006B85B3    mov         eax,ebx
 006B85B5    mov         edx,6B8E54;'TV.3'
 006B85BA    call        @UStrAsg
>006B85BF    jmp         006B8D31
 006B85C4    mov         eax,ebx
 006B85C6    mov         edx,6B8E6C;'TV.4'
 006B85CB    call        @UStrAsg
>006B85D0    jmp         006B8D31
 006B85D5    mov         eax,ebx
 006B85D7    mov         edx,6B8E84;'TV.5'
 006B85DC    call        @UStrAsg
>006B85E1    jmp         006B8D31
 006B85E6    mov         eax,ebx
 006B85E8    mov         edx,6B8E9C;'TV.6'
 006B85ED    call        @UStrAsg
>006B85F2    jmp         006B8D31
 006B85F7    mov         eax,ebx
 006B85F9    mov         edx,6B8EB4;'TV.7'
 006B85FE    call        @UStrAsg
>006B8603    jmp         006B8D31
 006B8608    mov         eax,ebx
 006B860A    mov         edx,6B8ECC;'TV.8'
 006B860F    call        @UStrAsg
>006B8614    jmp         006B8D31
 006B8619    mov         eax,ebx
 006B861B    mov         edx,6B8EE4;'TV.9'
 006B8620    call        @UStrAsg
>006B8625    jmp         006B8D31
 006B862A    mov         eax,ebx
 006B862C    mov         edx,6B8EFC;'TV.UnitsTens'
 006B8631    call        @UStrAsg
>006B8636    jmp         006B8D31
 006B863B    mov         eax,ebx
 006B863D    mov         edx,6B8F24;'TV.UnitsTensA'
 006B8642    call        @UStrAsg
>006B8647    jmp         006B8D31
 006B864C    mov         eax,ebx
 006B864E    mov         edx,6B8F4C;'TV.ChannelUp'
 006B8653    call        @UStrAsg
>006B8658    jmp         006B8D31
 006B865D    mov         eax,ebx
 006B865F    mov         edx,6B8F74;'TV.ChannelDown'
 006B8664    call        @UStrAsg
>006B8669    jmp         006B8D31
 006B866E    mov         eax,ebx
 006B8670    mov         edx,6B8FA0;'TV.Teletext'
 006B8675    call        @UStrAsg
>006B867A    jmp         006B8D31
 006B867F    mov         eax,ebx
 006B8681    mov         edx,6B8FC4;'TV.Red'
 006B8686    call        @UStrAsg
>006B868B    jmp         006B8D31
 006B8690    mov         eax,ebx
 006B8692    mov         edx,6B8FE0;'TV.Green'
 006B8697    call        @UStrAsg
>006B869C    jmp         006B8D31
 006B86A1    mov         eax,ebx
 006B86A3    mov         edx,6B9000;'TV.Yellow'
 006B86A8    call        @UStrAsg
>006B86AD    jmp         006B8D31
 006B86B2    mov         eax,ebx
 006B86B4    mov         edx,6B9020;'TV.Blue'
 006B86B9    call        @UStrAsg
>006B86BE    jmp         006B8D31
 006B86C3    mov         eax,ebx
 006B86C5    mov         edx,6B903C;'TV.Menu'
 006B86CA    call        @UStrAsg
>006B86CF    jmp         006B8D31
 006B86D4    mov         eax,ebx
 006B86D6    mov         edx,6B9058;'TV.Plus'
 006B86DB    call        @UStrAsg
>006B86E0    jmp         006B8D31
 006B86E5    mov         eax,ebx
 006B86E7    mov         edx,6B9074;'TV.Left'
 006B86EC    call        @UStrAsg
>006B86F1    jmp         006B8D31
 006B86F6    mov         eax,ebx
 006B86F8    mov         edx,6B9090;'TV.Ok'
 006B86FD    call        @UStrAsg
>006B8702    jmp         006B8D31
 006B8707    mov         eax,ebx
 006B8709    mov         edx,6B90A8;'TV.Right'
 006B870E    call        @UStrAsg
>006B8713    jmp         006B8D31
 006B8718    mov         eax,ebx
 006B871A    mov         edx,6B90C8;'TV.Minus'
 006B871F    call        @UStrAsg
>006B8724    jmp         006B8D31
 006B8729    mov         eax,ebx
 006B872B    mov         edx,6B90E8;'TV.MinusA'
 006B8730    call        @UStrAsg
>006B8735    jmp         006B8D31
 006B873A    mov         eax,ebx
 006B873C    mov         edx,6B9108;'TV.PicMode'
 006B8741    call        @UStrAsg
>006B8746    jmp         006B8D31
 006B874B    mov         eax,ebx
 006B874D    mov         edx,6B90C8;'TV.Minus'
 006B8752    call        @UStrAsg
>006B8757    jmp         006B8D31
 006B875C    mov         eax,ebx
 006B875E    mov         edx,6B912C;'TV.CountTo'
 006B8763    call        @UStrAsg
>006B8768    jmp         006B8D31
 006B876D    mov         eax,ebx
 006B876F    mov         edx,6B9150;'TV.CountPast'
 006B8774    call        @UStrAsg
>006B8779    jmp         006B8D31
 006B877E    mov         eax,ebx
 006B8780    mov         edx,6B9178;'TV.SoundMode'
 006B8785    call        @UStrAsg
>006B878A    jmp         006B8D31
 006B878F    mov         eax,ebx
 006B8791    mov         edx,6B91A0;'TV.Mute'
 006B8796    call        @UStrAsg
>006B879B    jmp         006B8D31
 006B87A0    mov         eax,ebx
 006B87A2    mov         edx,6B91BC;'TV.Question'
 006B87A7    call        @UStrAsg
>006B87AC    jmp         006B8D31
 006B87B1    mov         eax,ebx
 006B87B3    mov         edx,6B9058;'TV.Plus'
 006B87B8    call        @UStrAsg
>006B87BD    jmp         006B8D31
 006B87C2    mov         eax,ebx
 006B87C4    mov         edx,6B91E0;'TV.PlusA'
 006B87C9    call        @UStrAsg
>006B87CE    jmp         006B8D31
 006B87D3    mov         eax,ebx
 006B87D5    mov         edx,6B9200;'TV.PlusB'
 006B87DA    call        @UStrAsg
>006B87DF    jmp         006B8D31
 006B87E4    mov         eax,ebx
 006B87E6    mov         edx,6B9220;'TV.ChannelUpA'
 006B87EB    call        @UStrAsg
>006B87F0    jmp         006B8D31
 006B87F5    mov         eax,ebx
 006B87F7    mov         edx,6B9248;'TV.ChannelUpB'
 006B87FC    call        @UStrAsg
>006B8801    jmp         006B8D31
 006B8806    mov         eax,ebx
 006B8808    mov         edx,6B9270;'Phono.Start1'
 006B880D    call        @UStrAsg
>006B8812    jmp         006B8D31
 006B8817    mov         eax,ebx
 006B8819    mov         edx,6B9298;'Phono.Start2'
 006B881E    call        @UStrAsg
>006B8823    jmp         006B8D31
 006B8828    mov         eax,ebx
 006B882A    mov         edx,6B92C0;'Phono.Stop'
 006B882F    call        @UStrAsg
>006B8834    jmp         006B8D31
 006B8839    mov         eax,ebx
 006B883B    mov         edx,6B92E4;'Tuner.PresetMinus'
 006B8840    call        @UStrAsg
>006B8845    jmp         006B8D31
 006B884A    mov         eax,ebx
 006B884C    mov         edx,6B9314;'Tuner.PresetPlus'
 006B8851    call        @UStrAsg
>006B8856    jmp         006B8D31
 006B885B    mov         eax,ebx
 006B885D    mov         edx,6B9344;'Tuner.PresetPlus2'
 006B8862    call        @UStrAsg
>006B8867    jmp         006B8D31
 006B886C    mov         eax,ebx
 006B886E    mov         edx,6B9374;'Audio.VolumeMinus'
 006B8873    call        @UStrAsg
>006B8878    jmp         006B8D31
 006B887D    mov         eax,ebx
 006B887F    mov         edx,6B93A4;'Audio.VolumePlus'
 006B8884    call        @UStrAsg
>006B8889    jmp         006B8D31
 006B888E    mov         eax,ebx
 006B8890    mov         edx,6B93D4;'Tape2.Pause'
 006B8895    call        @UStrAsg
>006B889A    jmp         006B8D31
 006B889F    mov         eax,ebx
 006B88A1    mov         edx,6B93F8;'Audio.Tape1'
 006B88A6    call        @UStrAsg
>006B88AB    jmp         006B8D31
 006B88B0    mov         eax,ebx
 006B88B2    mov         edx,6B941C;'Tape2.DeckB.Record'
 006B88B7    call        @UStrAsg
>006B88BC    jmp         006B8D31
 006B88C1    mov         eax,ebx
 006B88C3    mov         edx,6B9450;'Tape2.DeckB.Record2'
 006B88C8    call        @UStrAsg
>006B88CD    jmp         006B8D31
 006B88D2    mov         eax,ebx
 006B88D4    mov         edx,6B9484;'Tape2.DeckB.Play'
 006B88D9    call        @UStrAsg
>006B88DE    jmp         006B8D31
 006B88E3    mov         eax,ebx
 006B88E5    mov         edx,6B94B4;'Tape2.DeckB.Play2'
 006B88EA    call        @UStrAsg
>006B88EF    jmp         006B8D31
 006B88F4    mov         eax,ebx
 006B88F6    mov         edx,6B94E4;'Tape2.DeckB.PlayLeft2'
 006B88FB    call        @UStrAsg
>006B8900    jmp         006B8D31
 006B8905    mov         eax,ebx
 006B8907    mov         edx,6B951C;'Tape2.DeckB.PlayLeft3'
 006B890C    call        @UStrAsg
>006B8911    jmp         006B8D31
 006B8916    mov         eax,ebx
 006B8918    mov         edx,6B9554;'Tape2.DeckB.Stop'
 006B891D    call        @UStrAsg
>006B8922    jmp         006B8D31
 006B8927    mov         eax,ebx
 006B8929    mov         edx,6B9584;'Tape2.DeckB.FastForward'
 006B892E    call        @UStrAsg
>006B8933    jmp         006B8D31
 006B8938    mov         eax,ebx
 006B893A    mov         edx,6B95C0;'Tape2.DeckB.Rewind'
 006B893F    call        @UStrAsg
>006B8944    jmp         006B8D31
 006B8949    mov         eax,ebx
 006B894B    mov         edx,6B95F4;'Tape2.DeckB.Rewind2'
 006B8950    call        @UStrAsg
>006B8955    jmp         006B8D31
 006B895A    mov         eax,ebx
 006B895C    mov         edx,6B9628;'Tape2.DeckA.Record'
 006B8961    call        @UStrAsg
>006B8966    jmp         006B8D31
 006B896B    mov         eax,ebx
 006B896D    mov         edx,6B965C;'Tape2.DeckA.Play2'
 006B8972    call        @UStrAsg
>006B8977    jmp         006B8D31
 006B897C    mov         eax,ebx
 006B897E    mov         edx,6B968C;'Tape2.DeckA.PlayLeft2'
 006B8983    call        @UStrAsg
>006B8988    jmp         006B8D31
 006B898D    mov         eax,ebx
 006B898F    mov         edx,6B96C4;'Tape2.DeckA.Stop'
 006B8994    call        @UStrAsg
>006B8999    jmp         006B8D31
 006B899E    mov         eax,ebx
 006B89A0    mov         edx,6B96F4;'Tape2.DeckA.FastForward'
 006B89A5    call        @UStrAsg
>006B89AA    jmp         006B8D31
 006B89AF    mov         eax,ebx
 006B89B1    mov         edx,6B9730;'Tape2.DeckA.Rewind'
 006B89B6    call        @UStrAsg
>006B89BB    jmp         006B8D31
 006B89C0    mov         eax,ebx
 006B89C2    mov         edx,6B9730;'Tape2.DeckA.Rewind'
 006B89C7    call        @UStrAsg
>006B89CC    jmp         006B8D31
 006B89D1    mov         eax,ebx
 006B89D3    mov         edx,6B9764;'CD.Pause'
 006B89D8    call        @UStrAsg
>006B89DD    jmp         006B8D31
 006B89E2    mov         eax,ebx
 006B89E4    mov         edx,6B9784;'CD.Stop'
 006B89E9    call        @UStrAsg
>006B89EE    jmp         006B8D31
 006B89F3    mov         eax,ebx
 006B89F5    mov         edx,6B97A0;'CD.Play'
 006B89FA    call        @UStrAsg
>006B89FF    jmp         006B8D31
 006B8A04    mov         eax,ebx
 006B8A06    mov         edx,6B97BC;'CD.Play2'
 006B8A0B    call        @UStrAsg
>006B8A10    jmp         006B8D31
 006B8A15    mov         eax,ebx
 006B8A17    mov         edx,6B97DC;'CD.DSkip'
 006B8A1C    call        @UStrAsg
>006B8A21    jmp         006B8D31
 006B8A26    mov         eax,ebx
 006B8A28    mov         edx,6B97FC;'CD.DSkip2'
 006B8A2D    call        @UStrAsg
>006B8A32    jmp         006B8D31
 006B8A37    mov         eax,ebx
 006B8A39    mov         edx,6B981C;'CD.DSkip3'
 006B8A3E    call        @UStrAsg
>006B8A43    jmp         006B8D31
 006B8A48    mov         eax,ebx
 006B8A4A    mov         edx,6B983C;'CD.Prev'
 006B8A4F    call        @UStrAsg
>006B8A54    jmp         006B8D31
 006B8A59    mov         eax,ebx
 006B8A5B    mov         edx,6B983C;'CD.Prev'
 006B8A60    call        @UStrAsg
>006B8A65    jmp         006B8D31
 006B8A6A    mov         eax,ebx
 006B8A6C    mov         edx,6B9858;'Vcr.1'
 006B8A71    call        @UStrAsg
>006B8A76    jmp         006B8D31
 006B8A7B    mov         eax,ebx
 006B8A7D    mov         edx,6B9870;'Vcr.2'
 006B8A82    call        @UStrAsg
>006B8A87    jmp         006B8D31
 006B8A8C    mov         eax,ebx
 006B8A8E    mov         edx,6B9888;'Vcr.3'
 006B8A93    call        @UStrAsg
>006B8A98    jmp         006B8D31
 006B8A9D    mov         eax,ebx
 006B8A9F    mov         edx,6B98A0;'Vcr.4'
 006B8AA4    call        @UStrAsg
>006B8AA9    jmp         006B8D31
 006B8AAE    mov         eax,ebx
 006B8AB0    mov         edx,6B98B8;'Vcr.5'
 006B8AB5    call        @UStrAsg
>006B8ABA    jmp         006B8D31
 006B8ABF    mov         eax,ebx
 006B8AC1    mov         edx,6B98D0;'Vcr.6'
 006B8AC6    call        @UStrAsg
>006B8ACB    jmp         006B8D31
 006B8AD0    mov         eax,ebx
 006B8AD2    mov         edx,6B98E8;'Vcr.7'
 006B8AD7    call        @UStrAsg
>006B8ADC    jmp         006B8D31
 006B8AE1    mov         eax,ebx
 006B8AE3    mov         edx,6B9900;'Vcr.8'
 006B8AE8    call        @UStrAsg
>006B8AED    jmp         006B8D31
 006B8AF2    mov         eax,ebx
 006B8AF4    mov         edx,6B9918;'Vcr.9'
 006B8AF9    call        @UStrAsg
>006B8AFE    jmp         006B8D31
 006B8B03    mov         eax,ebx
 006B8B05    mov         edx,6B9930;'Vcr.Pause'
 006B8B0A    call        @UStrAsg
>006B8B0F    jmp         006B8D31
 006B8B14    mov         eax,ebx
 006B8B16    mov         edx,6B9950;'Vcr.Ok'
 006B8B1B    call        @UStrAsg
>006B8B20    jmp         006B8D31
 006B8B25    mov         eax,ebx
 006B8B27    mov         edx,6B996C;'Vcr.Down'
 006B8B2C    call        @UStrAsg
>006B8B31    jmp         006B8D31
 006B8B36    mov         eax,ebx
 006B8B38    mov         edx,6B998C;'Vcr.Left'
 006B8B3D    call        @UStrAsg
>006B8B42    jmp         006B8D31
 006B8B47    mov         eax,ebx
 006B8B49    mov         edx,6B99AC;'Vcr.Right'
 006B8B4E    call        @UStrAsg
>006B8B53    jmp         006B8D31
 006B8B58    mov         eax,ebx
 006B8B5A    mov         edx,6B99CC;'Vcr.Menu'
 006B8B5F    call        @UStrAsg
>006B8B64    jmp         006B8D31
 006B8B69    mov         eax,ebx
 006B8B6B    mov         edx,6B99EC;'Vcr.VolumePlus'
 006B8B70    call        @UStrAsg
>006B8B75    jmp         006B8D31
 006B8B7A    mov         eax,ebx
 006B8B7C    mov         edx,6B9A18;'Vcr.VolumeMinus'
 006B8B81    call        @UStrAsg
>006B8B86    jmp         006B8D31
 006B8B8B    mov         eax,ebx
 006B8B8D    mov         edx,6B9A44;'Vcr.ChannelUp'
 006B8B92    call        @UStrAsg
>006B8B97    jmp         006B8D31
 006B8B9C    mov         eax,ebx
 006B8B9E    mov         edx,6B9A6C;'Vcr.ChannelDown'
 006B8BA3    call        @UStrAsg
>006B8BA8    jmp         006B8D31
 006B8BAD    mov         eax,ebx
 006B8BAF    mov         edx,6B9A98;'Vcr.Record'
 006B8BB4    call        @UStrAsg
>006B8BB9    jmp         006B8D31
 006B8BBE    mov         eax,ebx
 006B8BC0    mov         edx,6B9ABC;'Vcr.Display'
 006B8BC5    call        @UStrAsg
>006B8BCA    jmp         006B8D31
 006B8BCF    mov         eax,ebx
 006B8BD1    mov         edx,6B9AE0;'Vcr.Set'
 006B8BD6    call        @UStrAsg
>006B8BDB    jmp         006B8D31
 006B8BE0    mov         eax,ebx
 006B8BE2    mov         edx,6B9AFC;'Vcr.Eject'
 006B8BE7    call        @UStrAsg
>006B8BEC    jmp         006B8D31
 006B8BF1    mov         eax,ebx
 006B8BF3    mov         edx,6B9B1C;'Vcr.Off'
 006B8BF8    call        @UStrAsg
>006B8BFD    jmp         006B8D31
 006B8C02    mov         eax,ebx
 006B8C04    mov         edx,6B9B38;'TV.Screen'
 006B8C09    call        @UStrAsg
>006B8C0E    jmp         006B8D31
 006B8C13    mov         eax,ebx
 006B8C15    mov         edx,6B9B58;'Vcr.SyncroPlay2'
 006B8C1A    call        @UStrAsg
>006B8C1F    jmp         006B8D31
 006B8C24    mov         eax,ebx
 006B8C26    mov         edx,6B9B84;'Vcr.SyncroPlay3'
 006B8C2B    call        @UStrAsg
>006B8C30    jmp         006B8D31
 006B8C35    mov         eax,ebx
 006B8C37    mov         edx,6B9BB0;'Vcr.SyncroPlay4'
 006B8C3C    call        @UStrAsg
>006B8C41    jmp         006B8D31
 006B8C46    mov         eax,ebx
 006B8C48    mov         edx,6B9BDC;'TV.TvVideo'
 006B8C4D    call        @UStrAsg
>006B8C52    jmp         006B8D31
 006B8C57    mov         eax,ebx
 006B8C59    mov         edx,6B9C00;'Vcr.SyncroPlay6'
 006B8C5E    call        @UStrAsg
>006B8C63    jmp         006B8D31
 006B8C68    mov         eax,ebx
 006B8C6A    mov         edx,6B9C2C;'Vcr.CounterReset'
 006B8C6F    call        @UStrAsg
>006B8C74    jmp         006B8D31
 006B8C79    mov         eax,ebx
 006B8C7B    mov         edx,6B9C5C;'Vcr.AudioMonitor'
 006B8C80    call        @UStrAsg
>006B8C85    jmp         006B8D31
 006B8C8A    mov         eax,ebx
 006B8C8C    mov         edx,6B9C8C;'Vcr.AudioDub'
 006B8C91    call        @UStrAsg
>006B8C96    jmp         006B8D31
 006B8C9B    mov         eax,ebx
 006B8C9D    mov         edx,6B9CB4;'Vcr.TvVideo'
 006B8CA2    call        @UStrAsg
>006B8CA7    jmp         006B8D31
 006B8CAC    mov         eax,ebx
 006B8CAE    mov         edx,6B9CD8;'Vcr.Clear'
 006B8CB3    call        @UStrAsg
>006B8CB8    jmp         006B8D31
 006B8CBA    mov         eax,ebx
 006B8CBC    mov         edx,6B9CF8;'Vcr.GCode'
 006B8CC1    call        @UStrAsg
>006B8CC6    jmp         006B8D31
 006B8CC8    mov         eax,ebx
 006B8CCA    mov         edx,6B9D18;'Vcr.Slow'
 006B8CCF    call        @UStrAsg
>006B8CD4    jmp         006B8D31
 006B8CD6    mov         eax,ebx
 006B8CD8    mov         edx,6B9D38;'Vcr.IndexSearchPrev'
 006B8CDD    call        @UStrAsg
>006B8CE2    jmp         006B8D31
 006B8CE4    mov         eax,ebx
 006B8CE6    mov         edx,6B9D6C;'Vcr.IndexSearchNext'
 006B8CEB    call        @UStrAsg
>006B8CF0    jmp         006B8D31
 006B8CF2    mov         eax,ebx
 006B8CF4    mov         edx,6B9DA0;'Vcr.x2'
 006B8CF9    call        @UStrAsg
>006B8CFE    jmp         006B8D31
 006B8D00    mov         eax,ebx
 006B8D02    mov         edx,6B9DBC;'Vcr.InputSelect'
 006B8D07    call        @UStrAsg
>006B8D0C    jmp         006B8D31
 006B8D0E    mov         eax,ebx
 006B8D10    mov         edx,6B9DE8;'Vcr.TapeSpeed'
 006B8D15    call        @UStrAsg
>006B8D1A    jmp         006B8D31
 006B8D1C    mov         eax,ebx
 006B8D1E    mov         edx,6B9E10;'Vcr.EasyTimer'
 006B8D23    call        @UStrAsg
>006B8D28    jmp         006B8D31
 006B8D2A    mov         eax,ebx
 006B8D2C    call        @UStrClr
 006B8D31    cmp         dword ptr [ebx],0
>006B8D34    je          006B8D44
 006B8D36    mov         ecx,dword ptr [ebx]
 006B8D38    mov         eax,ebx
 006B8D3A    mov         edx,6B9E38;'Sony.'
 006B8D3F    call        @UStrCat3
 006B8D44    pop         ebx
 006B8D45    ret
end;*}

//006B9E44
procedure sub_006B9E44;
begin
{*
 006B9E44    mov         dword ptr ds:[78BE7C],0FF00;gvar_0078BE7C
 006B9E4E    ret
*}
end;

//006B9E50
procedure sub_006B9E50;
begin
{*
 006B9E50    mov         dword ptr ds:[78BE7C],0FF;gvar_0078BE7C
 006B9E5A    ret
*}
end;

//006B9E5C
{*procedure sub_006B9E5C(?:?);
begin
 006B9E5C    mov         [0078BE7C],eax;gvar_0078BE7C
 006B9E61    ret
end;*}

//006B9E64
{*procedure sub_006B9E64(?:?);
begin
 006B9E64    push        ebx
 006B9E65    mov         ebx,eax
 006B9E67    call        Now
 006B9E6C    fstp        qword ptr ds:[81F518];gvar_0081F518:Double
 006B9E72    wait
 006B9E73    movzx       eax,bl
 006B9E76    cmp         eax,dword ptr ds:[78BE70];0x0 gvar_0078BE70
>006B9E7C    jne         006B9E85
 006B9E7E    mov         byte ptr ds:[81F520],1;gvar_0081F520
 006B9E85    mov         [0078BE70],eax;gvar_0078BE70
 006B9E8A    mov         byte ptr ds:[78BE74],0;gvar_0078BE74
 006B9E91    pop         ebx
 006B9E92    ret
end;*}

//006B9E94
procedure sub_006B9E94;
begin
{*
 006B9E94    call        Now
 006B9E99    fstp        qword ptr ds:[81F518];gvar_0081F518:Double
 006B9E9F    wait
 006B9EA0    mov         byte ptr ds:[78BE74],1;gvar_0078BE74
 006B9EA7    ret
*}
end;

//006B9EA8
procedure sub_006B9EA8;
begin
{*
 006B9EA8    ret
*}
end;

//006B9EAC
procedure sub_006B9EAC;
begin
{*
 006B9EAC    ret
*}
end;

//006B9EB0
procedure sub_006B9EB0;
begin
{*
 006B9EB0    ret
*}
end;

//006B9EB4
procedure sub_006B9EB4;
begin
{*
 006B9EB4    ret
*}
end;

//006B9EB8
procedure sub_006B9EB8;
begin
{*
 006B9EB8    ret
*}
end;

//006B9EBC
procedure sub_006B9EBC;
begin
{*
 006B9EBC    ret
*}
end;

//006B9EC0
{*procedure sub_006B9EC0(?:?);
begin
 006B9EC0    push        ebx
 006B9EC1    mov         ebx,eax
 006B9EC3    call        Now
 006B9EC8    fstp        qword ptr ds:[81F528];gvar_0081F528:Double
 006B9ECE    wait
 006B9ECF    mov         dword ptr ds:[78BE78],ebx;gvar_0078BE78
 006B9ED5    pop         ebx
 006B9ED6    ret
end;*}

//006B9ED8
{*function sub_006B9ED8:?;
begin
 006B9ED8    push        ebp
 006B9ED9    mov         ebp,esp
 006B9EDB    add         esp,0FFFFFFE0
 006B9EDE    push        ebx
 006B9EDF    push        esi
 006B9EE0    push        edi
 006B9EE1    xor         eax,eax
 006B9EE3    mov         dword ptr [ebp-20],eax
 006B9EE6    mov         dword ptr [ebp-1C],eax
 006B9EE9    mov         dword ptr [ebp-18],eax
 006B9EEC    mov         dword ptr [ebp-14],eax
 006B9EEF    mov         edi,78BE80;gvar_0078BE80
 006B9EF4    xor         eax,eax
 006B9EF6    push        ebp
 006B9EF7    push        6BA675
 006B9EFC    push        dword ptr fs:[eax]
 006B9EFF    mov         dword ptr fs:[eax],esp
 006B9F02    xor         ebx,ebx
 006B9F04    cmp         dword ptr [edi],0
>006B9F07    je          006BA65A
 006B9F0D    mov         eax,dword ptr [edi]
 006B9F0F    cmp         word ptr [eax],0FF
>006B9F14    jne         006B9F50
 006B9F16    call        006B9E50
 006B9F1B    mov         eax,edi
 006B9F1D    mov         ecx,1
 006B9F22    mov         edx,1
 006B9F27    call        @UStrDelete
 006B9F2C    mov         bl,1
>006B9F2E    jmp         006BA65A
 006B9F33    call        006B9E44
 006B9F38    mov         eax,edi
 006B9F3A    mov         ecx,2
 006B9F3F    mov         edx,1
 006B9F44    call        @UStrDelete
 006B9F49    mov         bl,1
>006B9F4B    jmp         006BA65A
 006B9F50    mov         eax,dword ptr [edi]
 006B9F52    call        @UStrLen
 006B9F57    cmp         eax,2
>006B9F5A    jl          006B9F6E
 006B9F5C    mov         eax,dword ptr [edi]
 006B9F5E    cmp         word ptr [eax],0
>006B9F62    jne         006B9F6E
 006B9F64    mov         eax,dword ptr [edi]
 006B9F66    cmp         word ptr [eax+2],0FF
>006B9F6C    je          006B9F33
 006B9F6E    mov         eax,dword ptr [edi]
 006B9F70    mov         dword ptr [ebp-10],eax
 006B9F73    mov         eax,dword ptr [ebp-10]
 006B9F76    test        eax,eax
>006B9F78    je          006B9F7F
 006B9F7A    sub         eax,4
 006B9F7D    mov         eax,dword ptr [eax]
 006B9F7F    cmp         eax,3
>006B9F82    jl          006BA65A
 006B9F88    mov         eax,dword ptr [edi]
 006B9F8A    cmp         word ptr [eax],0FE
>006B9F8F    jne         006B9FFB
 006B9F91    mov         eax,dword ptr [edi]
 006B9F93    cmp         word ptr [eax+4],20AC
>006B9F99    jae         006B9FFB
 006B9F9B    mov         eax,dword ptr [edi]
 006B9F9D    movzx       eax,word ptr [eax+4]
 006B9FA1    cmp         ax,3F
>006B9FA5    ja          006B9FCA
 006B9FA7    mov         eax,dword ptr [edi]
 006B9FA9    movzx       eax,word ptr [eax+4]
 006B9FAD    call        006B9E64
 006B9FB2    mov         eax,edi
 006B9FB4    mov         ecx,3
 006B9FB9    mov         edx,1
 006B9FBE    call        @UStrDelete
 006B9FC3    mov         bl,1
>006B9FC5    jmp         006BA65A
 006B9FCA    mov         eax,dword ptr [edi]
 006B9FCC    movzx       eax,word ptr [eax+4]
 006B9FD0    cmp         ax,7F
>006B9FD4    ja          006B9FFB
 006B9FD6    mov         eax,dword ptr [edi]
 006B9FD8    movzx       eax,word ptr [eax+4]
 006B9FDC    sub         al,40
 006B9FDE    call        006B9E94
 006B9FE3    mov         eax,edi
 006B9FE5    mov         ecx,3
 006B9FEA    mov         edx,1
 006B9FEF    call        @UStrDelete
 006B9FF4    mov         bl,1
>006B9FF6    jmp         006BA65A
 006B9FFB    mov         eax,dword ptr [edi]
 006B9FFD    cmp         word ptr [eax],0
>006BA001    jne         006BA070
 006BA003    mov         eax,dword ptr [edi]
 006BA005    cmp         word ptr [eax+2],0F6
>006BA00B    jne         006BA070
 006BA00D    mov         eax,dword ptr [edi]
 006BA00F    cmp         word ptr [eax+4],6E
>006BA014    jne         006BA070
 006BA016    mov         eax,dword ptr [edi]
 006BA018    mov         dword ptr [ebp-10],eax
 006BA01B    mov         eax,dword ptr [ebp-10]
 006BA01E    test        eax,eax
>006BA020    je          006BA027
 006BA022    sub         eax,4
 006BA025    mov         eax,dword ptr [eax]
 006BA027    cmp         eax,7
>006BA02A    jl          006BA65A
 006BA030    mov         eax,dword ptr [edi]
 006BA032    movzx       eax,word ptr [eax+8]
 006BA036    shl         eax,8
 006BA039    mov         esi,eax
 006BA03B    shl         esi,8
 006BA03E    mov         eax,dword ptr [edi]
 006BA040    movzx       eax,word ptr [eax+0A]
 006BA044    shl         eax,8
 006BA047    add         esi,eax
 006BA049    mov         eax,dword ptr [edi]
 006BA04B    movzx       eax,word ptr [eax+0C]
 006BA04F    add         esi,eax
 006BA051    mov         eax,esi
 006BA053    call        006B9EA8
 006BA058    mov         eax,edi
 006BA05A    mov         ecx,7
 006BA05F    mov         edx,1
 006BA064    call        @UStrDelete
 006BA069    mov         bl,1
>006BA06B    jmp         006BA65A
 006BA070    mov         eax,dword ptr [edi]
 006BA072    cmp         word ptr [eax],0
>006BA076    jne         006BA0F7
 006BA078    mov         eax,dword ptr [edi]
 006BA07A    cmp         word ptr [eax+2],0F6
>006BA080    jne         006BA0F7
 006BA082    mov         eax,dword ptr [edi]
 006BA084    cmp         word ptr [eax+4],0E6
>006BA08A    jne         006BA0F7
 006BA08C    mov         eax,dword ptr [edi]
 006BA08E    mov         dword ptr [ebp-10],eax
 006BA091    mov         eax,dword ptr [ebp-10]
 006BA094    test        eax,eax
>006BA096    je          006BA09D
 006BA098    sub         eax,4
 006BA09B    mov         eax,dword ptr [eax]
 006BA09D    cmp         eax,7
>006BA0A0    jl          006BA65A
 006BA0A6    mov         eax,dword ptr [edi]
 006BA0A8    movzx       eax,word ptr [eax+6]
 006BA0AC    shl         eax,8
 006BA0AF    shl         eax,8
 006BA0B2    mov         esi,eax
 006BA0B4    shl         esi,8
 006BA0B7    mov         eax,dword ptr [edi]
 006BA0B9    movzx       eax,word ptr [eax+8]
 006BA0BD    shl         eax,8
 006BA0C0    shl         eax,8
 006BA0C3    add         esi,eax
 006BA0C5    mov         eax,dword ptr [edi]
 006BA0C7    movzx       eax,word ptr [eax+0A]
 006BA0CB    shl         eax,8
 006BA0CE    add         esi,eax
 006BA0D0    mov         eax,dword ptr [edi]
 006BA0D2    movzx       eax,word ptr [eax+0C]
 006BA0D6    add         esi,eax
 006BA0D8    mov         eax,esi
 006BA0DA    call        006B9EA8
 006BA0DF    mov         eax,edi
 006BA0E1    mov         ecx,7
 006BA0E6    mov         edx,1
 006BA0EB    call        @UStrDelete
 006BA0F0    mov         bl,1
>006BA0F2    jmp         006BA65A
 006BA0F7    mov         eax,dword ptr [edi]
 006BA0F9    cmp         word ptr [eax],0
>006BA0FD    jne         006BA17D
 006BA0FF    mov         eax,dword ptr [edi]
 006BA101    cmp         word ptr [eax+2],66
>006BA106    jne         006BA17D
 006BA108    mov         eax,dword ptr [edi]
 006BA10A    cmp         word ptr [eax+4],0EF
>006BA110    jne         006BA17D
 006BA112    mov         eax,dword ptr [edi]
 006BA114    mov         dword ptr [ebp-10],eax
 006BA117    mov         eax,dword ptr [ebp-10]
 006BA11A    test        eax,eax
>006BA11C    je          006BA123
 006BA11E    sub         eax,4
 006BA121    mov         eax,dword ptr [eax]
 006BA123    cmp         eax,7
>006BA126    jl          006BA65A
 006BA12C    mov         eax,dword ptr [edi]
 006BA12E    movzx       eax,word ptr [eax+6]
 006BA132    shl         eax,8
 006BA135    shl         eax,8
 006BA138    mov         esi,eax
 006BA13A    shl         esi,8
 006BA13D    mov         eax,dword ptr [edi]
 006BA13F    movzx       eax,word ptr [eax+8]
 006BA143    shl         eax,8
 006BA146    shl         eax,8
 006BA149    add         esi,eax
 006BA14B    mov         eax,dword ptr [edi]
 006BA14D    movzx       eax,word ptr [eax+0A]
 006BA151    shl         eax,8
 006BA154    add         esi,eax
 006BA156    mov         eax,dword ptr [edi]
 006BA158    movzx       eax,word ptr [eax+0C]
 006BA15C    add         esi,eax
 006BA15E    mov         eax,esi
 006BA160    call        006B9EAC
 006BA165    mov         eax,edi
 006BA167    mov         ecx,7
 006BA16C    mov         edx,1
 006BA171    call        @UStrDelete
 006BA176    mov         bl,1
>006BA178    jmp         006BA65A
 006BA17D    mov         eax,dword ptr [edi]
 006BA17F    cmp         word ptr [eax],0
>006BA183    jne         006BA202
 006BA185    mov         eax,dword ptr [edi]
 006BA187    cmp         word ptr [eax+2],66
>006BA18C    jne         006BA202
 006BA18E    mov         eax,dword ptr [edi]
 006BA190    cmp         word ptr [eax+4],76
>006BA195    jne         006BA202
 006BA197    mov         eax,dword ptr [edi]
 006BA199    mov         dword ptr [ebp-10],eax
 006BA19C    mov         eax,dword ptr [ebp-10]
 006BA19F    test        eax,eax
>006BA1A1    je          006BA1A8
 006BA1A3    sub         eax,4
 006BA1A6    mov         eax,dword ptr [eax]
 006BA1A8    cmp         eax,7
>006BA1AB    jl          006BA65A
 006BA1B1    mov         eax,dword ptr [edi]
 006BA1B3    movzx       eax,word ptr [eax+6]
 006BA1B7    shl         eax,8
 006BA1BA    shl         eax,8
 006BA1BD    mov         esi,eax
 006BA1BF    shl         esi,8
 006BA1C2    mov         eax,dword ptr [edi]
 006BA1C4    movzx       eax,word ptr [eax+8]
 006BA1C8    shl         eax,8
 006BA1CB    shl         eax,8
 006BA1CE    add         esi,eax
 006BA1D0    mov         eax,dword ptr [edi]
 006BA1D2    movzx       eax,word ptr [eax+0A]
 006BA1D6    shl         eax,8
 006BA1D9    add         esi,eax
 006BA1DB    mov         eax,dword ptr [edi]
 006BA1DD    movzx       eax,word ptr [eax+0C]
 006BA1E1    add         esi,eax
 006BA1E3    mov         eax,esi
 006BA1E5    call        006B9EAC
 006BA1EA    mov         eax,edi
 006BA1EC    mov         ecx,7
 006BA1F1    mov         edx,1
 006BA1F6    call        @UStrDelete
 006BA1FB    mov         bl,1
>006BA1FD    jmp         006BA65A
 006BA202    mov         eax,dword ptr [edi]
 006BA204    cmp         word ptr [eax+2],66
>006BA209    jne         006BA280
 006BA20B    mov         eax,dword ptr [edi]
 006BA20D    cmp         word ptr [eax+4],0EF
>006BA213    jne         006BA280
 006BA215    mov         eax,dword ptr [edi]
 006BA217    mov         dword ptr [ebp-10],eax
 006BA21A    mov         eax,dword ptr [ebp-10]
 006BA21D    test        eax,eax
>006BA21F    je          006BA226
 006BA221    sub         eax,4
 006BA224    mov         eax,dword ptr [eax]
 006BA226    cmp         eax,7
>006BA229    jl          006BA65A
 006BA22F    mov         eax,dword ptr [edi]
 006BA231    movzx       eax,word ptr [eax+6]
 006BA235    shl         eax,8
 006BA238    shl         eax,8
 006BA23B    mov         esi,eax
 006BA23D    shl         esi,8
 006BA240    mov         eax,dword ptr [edi]
 006BA242    movzx       eax,word ptr [eax+8]
 006BA246    shl         eax,8
 006BA249    shl         eax,8
 006BA24C    add         esi,eax
 006BA24E    mov         eax,dword ptr [edi]
 006BA250    movzx       eax,word ptr [eax+0A]
 006BA254    shl         eax,8
 006BA257    add         esi,eax
 006BA259    mov         eax,dword ptr [edi]
 006BA25B    movzx       eax,word ptr [eax+0C]
 006BA25F    add         esi,eax
 006BA261    mov         eax,esi
 006BA263    call        006B9EAC
 006BA268    mov         eax,edi
 006BA26A    mov         ecx,7
 006BA26F    mov         edx,1
 006BA274    call        @UStrDelete
 006BA279    mov         bl,1
>006BA27B    jmp         006BA65A
 006BA280    mov         eax,dword ptr [edi]
 006BA282    cmp         word ptr [eax],0
>006BA286    jne         006BA2F4
 006BA288    mov         eax,dword ptr [edi]
 006BA28A    cmp         word ptr [eax+2],66
>006BA28F    jne         006BA2F4
 006BA291    mov         eax,dword ptr [edi]
 006BA293    cmp         word ptr [eax+4],6E
>006BA298    jne         006BA2F4
 006BA29A    mov         eax,dword ptr [edi]
 006BA29C    mov         dword ptr [ebp-10],eax
 006BA29F    mov         eax,dword ptr [ebp-10]
 006BA2A2    test        eax,eax
>006BA2A4    je          006BA2AB
 006BA2A6    sub         eax,4
 006BA2A9    mov         eax,dword ptr [eax]
 006BA2AB    cmp         eax,7
>006BA2AE    jl          006BA65A
 006BA2B4    mov         eax,dword ptr [edi]
 006BA2B6    movzx       eax,word ptr [eax+8]
 006BA2BA    shl         eax,8
 006BA2BD    mov         esi,eax
 006BA2BF    shl         esi,8
 006BA2C2    mov         eax,dword ptr [edi]
 006BA2C4    movzx       eax,word ptr [eax+0A]
 006BA2C8    shl         eax,8
 006BA2CB    add         esi,eax
 006BA2CD    mov         eax,dword ptr [edi]
 006BA2CF    movzx       eax,word ptr [eax+0C]
 006BA2D3    add         esi,eax
 006BA2D5    mov         eax,esi
 006BA2D7    call        006B9EB0
 006BA2DC    mov         eax,edi
 006BA2DE    mov         ecx,7
 006BA2E3    mov         edx,1
 006BA2E8    call        @UStrDelete
 006BA2ED    mov         bl,1
>006BA2EF    jmp         006BA65A
 006BA2F4    mov         eax,dword ptr [edi]
 006BA2F6    cmp         word ptr [eax],0F0
>006BA2FB    jne         006BA369
 006BA2FD    mov         eax,dword ptr [edi]
 006BA2FF    cmp         word ptr [eax+2],66
>006BA304    jne         006BA369
 006BA306    mov         eax,dword ptr [edi]
 006BA308    cmp         word ptr [eax+4],66
>006BA30D    jne         006BA369
 006BA30F    mov         eax,dword ptr [edi]
 006BA311    mov         dword ptr [ebp-10],eax
 006BA314    mov         eax,dword ptr [ebp-10]
 006BA317    test        eax,eax
>006BA319    je          006BA320
 006BA31B    sub         eax,4
 006BA31E    mov         eax,dword ptr [eax]
 006BA320    cmp         eax,6
>006BA323    jl          006BA65A
 006BA329    mov         eax,dword ptr [edi]
 006BA32B    movzx       eax,word ptr [eax+6]
 006BA32F    shl         eax,8
 006BA332    mov         esi,eax
 006BA334    shl         esi,8
 006BA337    mov         eax,dword ptr [edi]
 006BA339    movzx       eax,word ptr [eax+8]
 006BA33D    shl         eax,8
 006BA340    add         esi,eax
 006BA342    mov         eax,dword ptr [edi]
 006BA344    movzx       eax,word ptr [eax+0A]
 006BA348    add         esi,eax
 006BA34A    mov         eax,esi
 006BA34C    call        006B9EB4
 006BA351    mov         eax,edi
 006BA353    mov         ecx,6
 006BA358    mov         edx,1
 006BA35D    call        @UStrDelete
 006BA362    mov         bl,1
>006BA364    jmp         006BA65A
 006BA369    mov         eax,dword ptr [edi]
 006BA36B    cmp         word ptr [eax],0
>006BA36F    jne         006BA3DD
 006BA371    mov         eax,dword ptr [edi]
 006BA373    cmp         word ptr [eax+2],6E
>006BA378    jne         006BA3DD
 006BA37A    mov         eax,dword ptr [edi]
 006BA37C    cmp         word ptr [eax+4],76
>006BA381    jne         006BA3DD
 006BA383    mov         eax,dword ptr [edi]
 006BA385    mov         dword ptr [ebp-10],eax
 006BA388    mov         eax,dword ptr [ebp-10]
 006BA38B    test        eax,eax
>006BA38D    je          006BA394
 006BA38F    sub         eax,4
 006BA392    mov         eax,dword ptr [eax]
 006BA394    cmp         eax,7
>006BA397    jl          006BA65A
 006BA39D    mov         eax,dword ptr [edi]
 006BA39F    movzx       eax,word ptr [eax+8]
 006BA3A3    shl         eax,8
 006BA3A6    mov         esi,eax
 006BA3A8    shl         esi,8
 006BA3AB    mov         eax,dword ptr [edi]
 006BA3AD    movzx       eax,word ptr [eax+0A]
 006BA3B1    shl         eax,8
 006BA3B4    add         esi,eax
 006BA3B6    mov         eax,dword ptr [edi]
 006BA3B8    movzx       eax,word ptr [eax+0C]
 006BA3BC    add         esi,eax
 006BA3BE    mov         eax,esi
 006BA3C0    call        006B9EB8
 006BA3C5    mov         eax,edi
 006BA3C7    mov         ecx,7
 006BA3CC    mov         edx,1
 006BA3D1    call        @UStrDelete
 006BA3D6    mov         bl,1
>006BA3D8    jmp         006BA65A
 006BA3DD    mov         eax,dword ptr [edi]
 006BA3DF    cmp         word ptr [eax],0
>006BA3E3    jne         006BA453
 006BA3E5    mov         eax,dword ptr [edi]
 006BA3E7    cmp         word ptr [eax+2],0F6
>006BA3ED    jne         006BA453
 006BA3EF    mov         eax,dword ptr [edi]
 006BA3F1    cmp         word ptr [eax+4],0EF
>006BA3F7    jne         006BA453
 006BA3F9    mov         eax,dword ptr [edi]
 006BA3FB    mov         dword ptr [ebp-4],eax
 006BA3FE    mov         eax,dword ptr [ebp-4]
 006BA401    test        eax,eax
>006BA403    je          006BA40A
 006BA405    sub         eax,4
 006BA408    mov         eax,dword ptr [eax]
 006BA40A    cmp         eax,7
>006BA40D    jl          006BA65A
 006BA413    mov         eax,dword ptr [edi]
 006BA415    movzx       eax,word ptr [eax+8]
 006BA419    shl         eax,8
 006BA41C    mov         esi,eax
 006BA41E    shl         esi,8
 006BA421    mov         eax,dword ptr [edi]
 006BA423    movzx       eax,word ptr [eax+0A]
 006BA427    shl         eax,8
 006BA42A    add         esi,eax
 006BA42C    mov         eax,dword ptr [edi]
 006BA42E    movzx       eax,word ptr [eax+0C]
 006BA432    add         esi,eax
 006BA434    mov         eax,esi
 006BA436    call        006B9EBC
 006BA43B    mov         eax,edi
 006BA43D    mov         ecx,7
 006BA442    mov         edx,1
 006BA447    call        @UStrDelete
 006BA44C    mov         bl,1
>006BA44E    jmp         006BA65A
 006BA453    mov         eax,dword ptr [edi]
 006BA455    movzx       eax,word ptr [eax]
 006BA458    shl         eax,8
 006BA45B    mov         esi,eax
 006BA45D    shl         esi,8
 006BA460    mov         eax,dword ptr [edi]
 006BA462    movzx       eax,word ptr [eax+2]
 006BA466    shl         eax,8
 006BA469    add         esi,eax
 006BA46B    mov         eax,dword ptr [edi]
 006BA46D    movzx       eax,word ptr [eax+4]
 006BA471    add         esi,eax
 006BA473    lea         edx,[ebp-14]
 006BA476    mov         eax,esi
 006BA478    call        006B7EF0
 006BA47D    cmp         dword ptr [ebp-14],0
>006BA481    je          006BA4A2
 006BA483    mov         eax,esi
 006BA485    call        006B9EC0
 006BA48A    mov         eax,edi
 006BA48C    mov         ecx,3
 006BA491    mov         edx,1
 006BA496    call        @UStrDelete
 006BA49B    mov         bl,1
>006BA49D    jmp         006BA65A
 006BA4A2    mov         eax,dword ptr [edi]
 006BA4A4    mov         dword ptr [ebp-10],eax
 006BA4A7    mov         eax,dword ptr [ebp-10]
 006BA4AA    test        eax,eax
>006BA4AC    je          006BA4B3
 006BA4AE    sub         eax,4
 006BA4B1    mov         eax,dword ptr [eax]
 006BA4B3    cmp         eax,4
>006BA4B6    jl          006BA510
 006BA4B8    mov         eax,dword ptr [edi]
 006BA4BA    cmp         word ptr [eax+2],0
>006BA4BF    jne         006BA510
 006BA4C1    mov         eax,dword ptr [edi]
 006BA4C3    movzx       eax,word ptr [eax]
 006BA4C6    shl         eax,8
 006BA4C9    mov         esi,eax
 006BA4CB    shl         esi,8
 006BA4CE    mov         eax,dword ptr [edi]
 006BA4D0    movzx       eax,word ptr [eax+4]
 006BA4D4    shl         eax,8
 006BA4D7    add         esi,eax
 006BA4D9    mov         eax,dword ptr [edi]
 006BA4DB    movzx       eax,word ptr [eax+6]
 006BA4DF    add         esi,eax
 006BA4E1    lea         edx,[ebp-18]
 006BA4E4    mov         eax,esi
 006BA4E6    call        006B7EF0
 006BA4EB    cmp         dword ptr [ebp-18],0
>006BA4EF    je          006BA510
 006BA4F1    mov         eax,esi
 006BA4F3    call        006B9EC0
 006BA4F8    mov         eax,edi
 006BA4FA    mov         ecx,4
 006BA4FF    mov         edx,1
 006BA504    call        @UStrDelete
 006BA509    mov         bl,1
>006BA50B    jmp         006BA65A
 006BA510    mov         eax,dword ptr [edi]
 006BA512    mov         dword ptr [ebp-10],eax
 006BA515    mov         eax,dword ptr [ebp-10]
 006BA518    test        eax,eax
>006BA51A    je          006BA521
 006BA51C    sub         eax,4
 006BA51F    mov         eax,dword ptr [eax]
 006BA521    cmp         eax,4
>006BA524    jl          006BA57E
 006BA526    mov         eax,dword ptr [edi]
 006BA528    cmp         word ptr [eax+4],0
>006BA52D    jne         006BA57E
 006BA52F    mov         eax,dword ptr [edi]
 006BA531    movzx       eax,word ptr [eax]
 006BA534    shl         eax,8
 006BA537    mov         esi,eax
 006BA539    shl         esi,8
 006BA53C    mov         eax,dword ptr [edi]
 006BA53E    movzx       eax,word ptr [eax+2]
 006BA542    shl         eax,8
 006BA545    add         esi,eax
 006BA547    mov         eax,dword ptr [edi]
 006BA549    movzx       eax,word ptr [eax+6]
 006BA54D    add         esi,eax
 006BA54F    lea         edx,[ebp-1C]
 006BA552    mov         eax,esi
 006BA554    call        006B7EF0
 006BA559    cmp         dword ptr [ebp-1C],0
>006BA55D    je          006BA57E
 006BA55F    mov         eax,esi
 006BA561    call        006B9EC0
 006BA566    mov         eax,edi
 006BA568    mov         ecx,4
 006BA56D    mov         edx,1
 006BA572    call        @UStrDelete
 006BA577    mov         bl,1
>006BA579    jmp         006BA65A
 006BA57E    mov         eax,dword ptr [edi]
 006BA580    mov         dword ptr [ebp-10],eax
 006BA583    mov         eax,dword ptr [ebp-10]
 006BA586    test        eax,eax
>006BA588    je          006BA58F
 006BA58A    sub         eax,4
 006BA58D    mov         eax,dword ptr [eax]
 006BA58F    cmp         eax,5
>006BA592    jl          006BA5A0
 006BA594    mov         eax,dword ptr [edi]
 006BA596    cmp         word ptr [eax+2],0
 006BA59B    sete        al
>006BA59E    jmp         006BA5A2
 006BA5A0    xor         eax,eax
 006BA5A2    test        al,al
>006BA5A4    je          006BA5FB
 006BA5A6    mov         eax,dword ptr [edi]
 006BA5A8    cmp         word ptr [eax+6],0
>006BA5AD    jne         006BA5FB
 006BA5AF    mov         eax,dword ptr [edi]
 006BA5B1    movzx       eax,word ptr [eax]
 006BA5B4    shl         eax,8
 006BA5B7    mov         esi,eax
 006BA5B9    shl         esi,8
 006BA5BC    mov         eax,dword ptr [edi]
 006BA5BE    movzx       eax,word ptr [eax+4]
 006BA5C2    shl         eax,8
 006BA5C5    add         esi,eax
 006BA5C7    mov         eax,dword ptr [edi]
 006BA5C9    movzx       eax,word ptr [eax+8]
 006BA5CD    add         esi,eax
 006BA5CF    lea         edx,[ebp-20]
 006BA5D2    mov         eax,esi
 006BA5D4    call        006B7EF0
 006BA5D9    cmp         dword ptr [ebp-20],0
>006BA5DD    je          006BA5FB
 006BA5DF    mov         eax,esi
 006BA5E1    call        006B9EC0
 006BA5E6    mov         eax,edi
 006BA5E8    mov         ecx,5
 006BA5ED    mov         edx,1
 006BA5F2    call        @UStrDelete
 006BA5F7    mov         bl,1
>006BA5F9    jmp         006BA65A
 006BA5FB    test        bl,bl
>006BA5FD    jne         006BA65A
 006BA5FF    mov         eax,dword ptr [edi]
 006BA601    cmp         word ptr [eax+2],0
>006BA606    jne         006BA61E
 006BA608    mov         eax,dword ptr [edi]
 006BA60A    mov         dword ptr [ebp-8],eax
 006BA60D    mov         eax,dword ptr [ebp-8]
 006BA610    test        eax,eax
>006BA612    je          006BA619
 006BA614    sub         eax,4
 006BA617    mov         eax,dword ptr [eax]
 006BA619    cmp         eax,5
>006BA61C    jl          006BA65A
 006BA61E    mov         eax,dword ptr [edi]
 006BA620    cmp         word ptr [eax+4],0
>006BA625    jne         006BA63D
 006BA627    mov         eax,dword ptr [edi]
 006BA629    mov         dword ptr [ebp-0C],eax
 006BA62C    mov         eax,dword ptr [ebp-0C]
 006BA62F    test        eax,eax
>006BA631    je          006BA638
 006BA633    sub         eax,4
 006BA636    mov         eax,dword ptr [eax]
 006BA638    cmp         eax,5
>006BA63B    jl          006BA65A
 006BA63D    mov         eax,dword ptr [edi]
 006BA63F    movzx       eax,word ptr [eax]
 006BA642    call        006B9E5C
 006BA647    mov         eax,edi
 006BA649    mov         ecx,1
 006BA64E    mov         edx,1
 006BA653    call        @UStrDelete
 006BA658    mov         bl,1
 006BA65A    xor         eax,eax
 006BA65C    pop         edx
 006BA65D    pop         ecx
 006BA65E    pop         ecx
 006BA65F    mov         dword ptr fs:[eax],edx
 006BA662    push        6BA67C
 006BA667    lea         eax,[ebp-20]
 006BA66A    mov         edx,4
 006BA66F    call        @UStrArrayClr
 006BA674    ret
>006BA675    jmp         @HandleFinally
>006BA67A    jmp         006BA667
 006BA67C    mov         eax,ebx
 006BA67E    pop         edi
 006BA67F    pop         esi
 006BA680    pop         ebx
 006BA681    mov         esp,ebp
 006BA683    pop         ebp
 006BA684    ret
end;*}

//006BA688
procedure sub_006BA688;
begin
{*
 006BA688    add         esp,0FFFFFFF0
 006BA68B    call        Now
 006BA690    fsub        qword ptr ds:[81F518];gvar_0081F518:Double
 006BA696    fstp        qword ptr [esp]
 006BA699    wait
 006BA69A    call        Now
 006BA69F    fsub        qword ptr ds:[81F528];gvar_0081F528:Double
 006BA6A5    fstp        qword ptr [esp+8]
 006BA6A9    wait
 006BA6AA    fld         qword ptr [esp]
 006BA6AD    fcomp       dword ptr ds:[6BA72C];0:Single
 006BA6B3    wait
 006BA6B4    fnstsw      al
 006BA6B6    sahf
>006BA6B7    jae         006BA6CE
 006BA6B9    call        Now
 006BA6BE    fstp        qword ptr ds:[81F518];gvar_0081F518:Double
 006BA6C4    wait
 006BA6C5    xor         eax,eax
 006BA6C7    mov         dword ptr [esp],eax
 006BA6CA    mov         dword ptr [esp+4],eax
 006BA6CE    cmp         dword ptr ds:[78BE70],0;gvar_0078BE70
>006BA6D5    jle         006BA705
 006BA6D7    cmp         byte ptr ds:[78BE74],0;gvar_0078BE74
>006BA6DE    je          006BA6EF
 006BA6E0    fld         tbyte ptr ds:[6BA730];1.15740740740741E-6:Extended
 006BA6E6    fcomp       qword ptr [esp]
 006BA6E9    wait
 006BA6EA    fnstsw      al
 006BA6EC    sahf
>006BA6ED    jb          006BA6FE
 006BA6EF    fld         tbyte ptr ds:[6BA73C];3.85802469135802E-6:Extended
 006BA6F5    fcomp       qword ptr [esp]
 006BA6F8    wait
 006BA6F9    fnstsw      al
 006BA6FB    sahf
>006BA6FC    jae         006BA705
 006BA6FE    xor         eax,eax
 006BA700    mov         [0078BE70],eax;gvar_0078BE70
 006BA705    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BA70C    jbe         006BA725
 006BA70E    fld         tbyte ptr ds:[6BA748];2.31481481481481E-6:Extended
 006BA714    fcomp       qword ptr [esp+8]
 006BA718    wait
 006BA719    fnstsw      al
 006BA71B    sahf
>006BA71C    jae         006BA725
 006BA71E    xor         eax,eax
 006BA720    mov         [0078BE78],eax;gvar_0078BE78
 006BA725    add         esp,10
 006BA728    ret
*}
end;

//006BA754
{*function sub_006BA754:?;
begin
 006BA754    push        ebp
 006BA755    mov         ebp,esp
 006BA757    add         esp,0FFFFFFF0
 006BA75A    push        ebx
 006BA75B    xor         eax,eax
 006BA75D    mov         dword ptr [ebp-10],eax
 006BA760    mov         dword ptr [ebp-4],eax
 006BA763    xor         eax,eax
 006BA765    push        ebp
 006BA766    push        6BA7F7
 006BA76B    push        dword ptr fs:[eax]
 006BA76E    mov         dword ptr fs:[eax],esp
 006BA771    mov         byte ptr ds:[81F520],0;gvar_0081F520
 006BA778    mov         bl,1
 006BA77A    lea         eax,[ebp-4]
 006BA77D    call        @UStrClr
 006BA782    push        0
 006BA784    lea         eax,[ebp-0C]
 006BA787    push        eax
 006BA788    push        1
 006BA78A    lea         eax,[ebp-6]
 006BA78D    push        eax
 006BA78E    mov         eax,[0078BE88];0xFFFFFFFF gvar_0078BE88:Integer
 006BA793    push        eax
 006BA794    call        kernel32.ReadFile
 006BA799    test        eax,eax
>006BA79B    jne         006BA7A1
 006BA79D    xor         ebx,ebx
>006BA79F    jmp         006BA7D9
 006BA7A1    lea         eax,[ebp-10]
 006BA7A4    movzx       edx,word ptr [ebp-6]
 006BA7A8    call        @UStrFromWChar
 006BA7AD    mov         edx,dword ptr [ebp-10]
 006BA7B0    lea         eax,[ebp-4]
 006BA7B3    call        @UStrCat
 006BA7B8    cmp         dword ptr [ebp-0C],0
>006BA7BC    jne         006BA782
 006BA7BE    mov         eax,78BE80;gvar_0078BE80
 006BA7C3    mov         edx,dword ptr [ebp-4]
 006BA7C6    call        @UStrCat
 006BA7CB    call        006B9ED8
 006BA7D0    test        al,al
>006BA7D2    jne         006BA7CB
 006BA7D4    call        006BA688
 006BA7D9    xor         eax,eax
 006BA7DB    pop         edx
 006BA7DC    pop         ecx
 006BA7DD    pop         ecx
 006BA7DE    mov         dword ptr fs:[eax],edx
 006BA7E1    push        6BA7FE
 006BA7E6    lea         eax,[ebp-10]
 006BA7E9    call        @UStrClr
 006BA7EE    lea         eax,[ebp-4]
 006BA7F1    call        @UStrClr
 006BA7F6    ret
>006BA7F7    jmp         @HandleFinally
>006BA7FC    jmp         006BA7E6
 006BA7FE    mov         eax,ebx
 006BA800    pop         ebx
 006BA801    mov         esp,ebp
 006BA803    pop         ebp
 006BA804    ret
end;*}

//006BA808
function TRemoteValue.CanSet:Boolean;
begin
{*
 006BA808    xor         eax,eax
 006BA80A    ret
*}
end;

//006BA80C
procedure TRemoteValue.GetBoolean;
begin
{*
 006BA80C    push        ebx
 006BA80D    mov         ebx,eax
 006BA80F    movzx       eax,byte ptr [ebx+20];TRemoteValue.Brand:byte
 006BA813    sub         al,1
>006BA815    jb          006BA81F
>006BA817    je          006BA83D
 006BA819    dec         al
>006BA81B    je          006BA846
>006BA81D    jmp         006BA84F
 006BA81F    mov         eax,ebx
 006BA821    call        TRemoteValue.GetPinnacle
 006BA826    test        al,al
>006BA828    jne         006BA839
 006BA82A    mov         eax,ebx
 006BA82C    call        TRemoteValue.GetSony
 006BA831    test        al,al
>006BA833    jne         006BA839
 006BA835    xor         eax,eax
>006BA837    jmp         006BA851
 006BA839    mov         al,1
 006BA83B    pop         ebx
 006BA83C    ret
 006BA83D    mov         eax,ebx
 006BA83F    call        TRemoteValue.GetPinnacle
 006BA844    pop         ebx
 006BA845    ret
 006BA846    mov         eax,ebx
 006BA848    call        TRemoteValue.GetSony
 006BA84D    pop         ebx
 006BA84E    ret
 006BA84F    xor         eax,eax
 006BA851    pop         ebx
 006BA852    ret
*}
end;

//006BA854
function TRemoteValue.GetDataType:TDataType;
begin
{*
 006BA854    mov         al,3
 006BA856    ret
*}
end;

//006BA858
function TRemoteValue.GetSony:Boolean;
begin
{*
 006BA858    push        ebx
 006BA859    mov         ebx,eax
 006BA85B    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BA862    jne         006BA868
 006BA864    xor         eax,eax
 006BA866    pop         ebx
 006BA867    ret
 006BA868    movzx       eax,byte ptr [ebx+21];TRemoteValue.Device:byte
 006BA86C    cmp         eax,9
>006BA86F    ja          006BA938
 006BA875    jmp         dword ptr [eax*4+6BA87C]
 006BA875    dd          006BA8A4
 006BA875    dd          006BA938
 006BA875    dd          006BA8F9
 006BA875    dd          006BA902
 006BA875    dd          006BA938
 006BA875    dd          006BA90B
 006BA875    dd          006BA92F
 006BA875    dd          006BA926
 006BA875    dd          006BA914
 006BA875    dd          006BA91D
 006BA8A4    mov         eax,ebx
 006BA8A6    call        TRemoteValue.GetSonyTV
 006BA8AB    test        al,al
>006BA8AD    jne         006BA8F5
 006BA8AF    mov         eax,ebx
 006BA8B1    call        TRemoteValue.GetSonyVCR
 006BA8B6    test        al,al
>006BA8B8    jne         006BA8F5
 006BA8BA    mov         eax,ebx
 006BA8BC    call        TRemoteValue.GetSonyAudio
 006BA8C1    test        al,al
>006BA8C3    jne         006BA8F5
 006BA8C5    mov         eax,ebx
 006BA8C7    call        TRemoteValue.GetSonyRadio
 006BA8CC    test        al,al
>006BA8CE    jne         006BA8F5
 006BA8D0    mov         eax,ebx
 006BA8D2    call        TRemoteValue.GetSonyCD
 006BA8D7    test        al,al
>006BA8D9    jne         006BA8F5
 006BA8DB    mov         eax,ebx
 006BA8DD    call        TRemoteValue.GetSonyPhono
 006BA8E2    test        al,al
>006BA8E4    jne         006BA8F5
 006BA8E6    mov         eax,ebx
 006BA8E8    call        TRemoteValue.GetSonyTape
 006BA8ED    test        al,al
>006BA8EF    jne         006BA8F5
 006BA8F1    xor         eax,eax
>006BA8F3    jmp         006BA93A
 006BA8F5    mov         al,1
>006BA8F7    jmp         006BA93A
 006BA8F9    mov         eax,ebx
 006BA8FB    call        TRemoteValue.GetSonyTV
>006BA900    jmp         006BA93A
 006BA902    mov         eax,ebx
 006BA904    call        TRemoteValue.GetSonyVCR
>006BA909    jmp         006BA93A
 006BA90B    mov         eax,ebx
 006BA90D    call        TRemoteValue.GetSonyAudio
>006BA912    jmp         006BA93A
 006BA914    mov         eax,ebx
 006BA916    call        TRemoteValue.GetSonyCD
>006BA91B    jmp         006BA93A
 006BA91D    mov         eax,ebx
 006BA91F    call        TRemoteValue.GetSonyTape
>006BA924    jmp         006BA93A
 006BA926    mov         eax,ebx
 006BA928    call        TRemoteValue.GetSonyRadio
>006BA92D    jmp         006BA93A
 006BA92F    mov         eax,ebx
 006BA931    call        TRemoteValue.GetSonyPhono
>006BA936    jmp         006BA93A
 006BA938    xor         eax,eax
 006BA93A    pop         ebx
 006BA93B    ret
*}
end;

//006BA93C
function TRemoteValue.GetSonyTV:Boolean;
begin
{*
 006BA93C    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BA943    jne         006BA948
 006BA945    xor         eax,eax
 006BA947    ret
 006BA948    movzx       edx,byte ptr [eax+21];TRemoteValue.Device:byte
 006BA94C    cmp         dl,2
>006BA94F    je          006BA959
 006BA951    test        dl,dl
>006BA953    jne         006BAED8
 006BA959    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BA95C    cmp         eax,6A
>006BA95F    ja          006BAED4
 006BA965    movzx       eax,byte ptr [eax+6BA973]
 006BA96C    jmp         dword ptr [eax*4+6BA9DE]
 006BA96C    db          1
 006BA96C    db          3
 006BA96C    db          4
 006BA96C    db          5
 006BA96C    db          6
 006BA96C    db          7
 006BA96C    db          8
 006BA96C    db          9
 006BA96C    db          10
 006BA96C    db          11
 006BA96C    db          12
 006BA96C    db          13
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          2
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          37
 006BA96C    db          17
 006BA96C    db          18
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          31
 006BA96C    db          28
 006BA96C    db          30
 006BA96C    db          29
 006BA96C    db          26
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          19
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          14
 006BA96C    db          20
 006BA96C    db          21
 006BA96C    db          36
 006BA96C    db          34
 006BA96C    db          35
 006BA96C    db          27
 006BA96C    db          32
 006BA96C    db          39
 006BA96C    db          33
 006BA96C    db          22
 006BA96C    db          24
 006BA96C    db          23
 006BA96C    db          25
 006BA96C    db          15
 006BA96C    db          16
 006BA96C    db          38
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          0
 006BA96C    db          21
 006BA96C    dd          006BAED4
 006BA96C    dd          006BAA7E
 006BA96C    dd          006BAA85
 006BA96C    dd          006BAA97
 006BA96C    dd          006BAAC9
 006BA96C    dd          006BAAEF
 006BA96C    dd          006BAB01
 006BA96C    dd          006BAB13
 006BA96C    dd          006BAB25
 006BA96C    dd          006BAB37
 006BA96C    dd          006BAB49
 006BA96C    dd          006BAB5B
 006BA96C    dd          006BAB6D
 006BA96C    dd          006BAB7F
 006BA96C    dd          006BABA5
 006BA96C    dd          006BABB7
 006BA96C    dd          006BABC9
 006BA96C    dd          006BABDB
 006BA96C    dd          006BAC0D
 006BA96C    dd          006BAC1F
 006BA96C    dd          006BAC31
 006BA96C    dd          006BAC43
 006BA96C    dd          006BAC55
 006BA96C    dd          006BAC9F
 006BA96C    dd          006BACE9
 006BA96C    dd          006BAD27
 006BA96C    dd          006BAD4D
 006BA96C    dd          006BAD5F
 006BA96C    dd          006BAD9D
 006BA96C    dd          006BADAF
 006BA96C    dd          006BADC1
 006BA96C    dd          006BADD3
 006BA96C    dd          006BADE5
 006BA96C    dd          006BAE17
 006BA96C    dd          006BAE29
 006BA96C    dd          006BAE3B
 006BA96C    dd          006BAE5E
 006BA96C    dd          006BAE6D
 006BA96C    dd          006BAE7C
 006BA96C    dd          006BAE9C
 006BAA7E    mov         al,1
>006BAA80    jmp         006BAEDA
 006BAA85    cmp         dword ptr ds:[78BE78],34ADFE;gvar_0078BE78
 006BAA8F    sete        al
>006BAA92    jmp         006BAEDA
 006BAA97    cmp         dword ptr ds:[78BE78],4C4A4C
>006BAAA1    je          006BAAC2
 006BAAA3    cmp         dword ptr ds:[78BE78],4A4C4A
>006BAAAD    je          006BAAC2
 006BAAAF    cmp         dword ptr ds:[78BE78],4C4A4A
>006BAAB9    je          006BAAC2
 006BAABB    xor         eax,eax
>006BAABD    jmp         006BAEDA
 006BAAC2    mov         al,1
>006BAAC4    jmp         006BAEDA
 006BAAC9    cmp         dword ptr ds:[78BE78],0B442FF;gvar_0078BE78
>006BAAD3    je          006BAAE8
 006BAAD5    cmp         dword ptr ds:[78BE78],0B446FF;gvar_0078BE78
>006BAADF    je          006BAAE8
 006BAAE1    xor         eax,eax
>006BAAE3    jmp         006BAEDA
 006BAAE8    mov         al,1
>006BAAEA    jmp         006BAEDA
 006BAAEF    cmp         dword ptr ds:[78BE78],0AC42FF;gvar_0078BE78
 006BAAF9    sete        al
>006BAAFC    jmp         006BAEDA
 006BAB01    cmp         dword ptr ds:[78BE78],5442FF
 006BAB0B    sete        al
>006BAB0E    jmp         006BAEDA
 006BAB13    cmp         dword ptr ds:[78BE78],8C42FF;gvar_0078BE78
 006BAB1D    sete        al
>006BAB20    jmp         006BAEDA
 006BAB25    cmp         dword ptr ds:[78BE78],3442FF;gvar_0078BE78
 006BAB2F    sete        al
>006BAB32    jmp         006BAEDA
 006BAB37    cmp         dword ptr ds:[78BE78],2C42FF;gvar_0078BE78
 006BAB41    sete        al
>006BAB44    jmp         006BAEDA
 006BAB49    cmp         dword ptr ds:[78BE78],5452FE
 006BAB53    sete        al
>006BAB56    jmp         006BAEDA
 006BAB5B    cmp         dword ptr ds:[78BE78],4C42FF
 006BAB65    sete        al
>006BAB68    jmp         006BAEDA
 006BAB6D    cmp         dword ptr ds:[78BE78],0B442FF;gvar_0078BE78
 006BAB77    sete        al
>006BAB7A    jmp         006BAEDA
 006BAB7F    cmp         dword ptr ds:[78BE78],345AFA;gvar_0078BE78
>006BAB89    je          006BAB9E
 006BAB8B    cmp         dword ptr ds:[78BE78],34B5FA;gvar_0078BE78
>006BAB95    je          006BAB9E
 006BAB97    xor         eax,eax
>006BAB99    jmp         006BAEDA
 006BAB9E    mov         al,1
>006BABA0    jmp         006BAEDA
 006BABA5    cmp         dword ptr ds:[78BE78],0AC51FE;gvar_0078BE78
 006BABAF    sete        al
>006BABB2    jmp         006BAEDA
 006BABB7    cmp         dword ptr ds:[78BE78],548CFA
 006BABC1    sete        al
>006BABC4    jmp         006BAEDA
 006BABC9    cmp         dword ptr ds:[78BE78],3462AD;gvar_0078BE78
 006BABD3    sete        al
>006BABD6    jmp         006BAEDA
 006BABDB    cmp         dword ptr ds:[78BE78],4C94FF
>006BABE5    je          006BAC06
 006BABE7    cmp         dword ptr ds:[78BE78],4C28FE
>006BABF1    je          006BAC06
 006BABF3    cmp         dword ptr ds:[78BE78],4C29FE
>006BABFD    je          006BAC06
 006BABFF    xor         eax,eax
>006BAC01    jmp         006BAEDA
 006BAC06    mov         al,1
>006BAC08    jmp         006BAEDA
 006BAC0D    cmp         dword ptr ds:[78BE78],0B4ADFE;gvar_0078BE78
 006BAC17    sete        al
>006BAC1A    jmp         006BAEDA
 006BAC1F    cmp         dword ptr ds:[78BE78],5441F2
 006BAC29    sete        al
>006BAC2C    jmp         006BAEDA
 006BAC31    cmp         dword ptr ds:[78BE78],4C51FE
 006BAC3B    sete        al
>006BAC3E    jmp         006BAEDA
 006BAC43    cmp         dword ptr ds:[78BE78],34ACFE;gvar_0078BE78
 006BAC4D    sete        al
>006BAC50    jmp         006BAEDA
 006BAC55    cmp         dword ptr ds:[78BE78],8C2AFE;gvar_0078BE78
>006BAC5F    je          006BAC98
 006BAC61    cmp         dword ptr ds:[78BE78],8C81FA;gvar_0078BE78
>006BAC6B    je          006BAC98
 006BAC6D    cmp         dword ptr ds:[78BE78],8C85FA;gvar_0078BE78
>006BAC77    je          006BAC98
 006BAC79    cmp         dword ptr ds:[78BE78],8C85FE;gvar_0078BE78
>006BAC83    je          006BAC98
 006BAC85    cmp         dword ptr ds:[78BE78],8C81FE;gvar_0078BE78
>006BAC8F    je          006BAC98
 006BAC91    xor         eax,eax
>006BAC93    jmp         006BAEDA
 006BAC98    mov         al,1
>006BAC9A    jmp         006BAEDA
 006BAC9F    cmp         dword ptr ds:[78BE78],3454FA;gvar_0078BE78
>006BACA9    je          006BACE2
 006BACAB    cmp         dword ptr ds:[78BE78],8C85FE;gvar_0078BE78
>006BACB5    je          006BACE2
 006BACB7    cmp         dword ptr ds:[78BE78],8C81FE;gvar_0078BE78
>006BACC1    je          006BACE2
 006BACC3    cmp         dword ptr ds:[78BE78],8C81FA;gvar_0078BE78
>006BACCD    je          006BACE2
 006BACCF    cmp         dword ptr ds:[78BE78],8C85FA;gvar_0078BE78
>006BACD9    je          006BACE2
 006BACDB    xor         eax,eax
>006BACDD    jmp         006BAEDA
 006BACE2    mov         al,1
>006BACE4    jmp         006BAEDA
 006BACE9    cmp         dword ptr ds:[78BE78],2C54FA;gvar_0078BE78
>006BACF3    je          006BAD20
 006BACF5    cmp         dword ptr ds:[78BE78],3481FA;gvar_0078BE78
>006BACFF    je          006BAD20
 006BAD01    cmp         dword ptr ds:[78BE78],3485FA;gvar_0078BE78
>006BAD0B    je          006BAD20
 006BAD0D    cmp         dword ptr ds:[78BE78],3481FE;gvar_0078BE78
>006BAD17    je          006BAD20
 006BAD19    xor         eax,eax
>006BAD1B    jmp         006BAEDA
 006BAD20    mov         al,1
>006BAD22    jmp         006BAEDA
 006BAD27    cmp         dword ptr ds:[78BE78],542DF4
>006BAD31    je          006BAD46
 006BAD33    cmp         dword ptr ds:[78BE78],8C54FE;gvar_0078BE78
>006BAD3D    je          006BAD46
 006BAD3F    xor         eax,eax
>006BAD41    jmp         006BAEDA
 006BAD46    mov         al,1
>006BAD48    jmp         006BAEDA
 006BAD4D    cmp         dword ptr ds:[78BE78],4C41FF
 006BAD57    sete        al
>006BAD5A    jmp         006BAEDA
 006BAD5F    cmp         dword ptr ds:[78BE78],8C81FA;gvar_0078BE78
>006BAD69    je          006BAD96
 006BAD6B    cmp         dword ptr ds:[78BE78],8C85FA;gvar_0078BE78
>006BAD75    je          006BAD96
 006BAD77    cmp         dword ptr ds:[78BE78],8C85FE;gvar_0078BE78
>006BAD81    je          006BAD96
 006BAD83    cmp         dword ptr ds:[78BE78],8C81FE;gvar_0078BE78
>006BAD8D    je          006BAD96
 006BAD8F    xor         eax,eax
>006BAD91    jmp         006BAEDA
 006BAD96    mov         al,1
>006BAD98    jmp         006BAEDA
 006BAD9D    cmp         dword ptr ds:[78BE78],8C51FE;gvar_0078BE78
 006BADA7    sete        al
>006BADAA    jmp         006BAEDA
 006BADAF    cmp         dword ptr ds:[78BE78],3454FE;gvar_0078BE78
 006BADB9    sete        al
>006BADBC    jmp         006BAEDA
 006BADC1    cmp         dword ptr ds:[78BE78],5451FE
 006BADCB    sete        al
>006BADCE    jmp         006BAEDA
 006BADD3    cmp         dword ptr ds:[78BE78],3485FA;gvar_0078BE78
 006BADDD    sete        al
>006BADE0    jmp         006BAEDA
 006BADE5    cmp         dword ptr ds:[78BE78],3481FA;gvar_0078BE78
>006BADEF    je          006BAE10
 006BADF1    cmp         dword ptr ds:[78BE78],3485FA;gvar_0078BE78
>006BADFB    je          006BAE10
 006BADFD    cmp         dword ptr ds:[78BE78],3481FE;gvar_0078BE78
>006BAE07    je          006BAE10
 006BAE09    xor         eax,eax
>006BAE0B    jmp         006BAEDA
 006BAE10    mov         al,1
>006BAE12    jmp         006BAEDA
 006BAE17    cmp         dword ptr ds:[78BE78],8C54FE;gvar_0078BE78
 006BAE21    sete        al
>006BAE24    jmp         006BAEDA
 006BAE29    cmp         dword ptr ds:[78BE78],2C51FE;gvar_0078BE78
 006BAE33    sete        al
>006BAE36    jmp         006BAEDA
 006BAE3B    cmp         dword ptr ds:[78BE78],8C55FE;gvar_0078BE78
>006BAE45    je          006BAE5A
 006BAE47    cmp         dword ptr ds:[78BE78],8C51FE;gvar_0078BE78
>006BAE51    je          006BAE5A
 006BAE53    xor         eax,eax
>006BAE55    jmp         006BAEDA
 006BAE5A    mov         al,1
>006BAE5C    jmp         006BAEDA
 006BAE5E    cmp         dword ptr ds:[78BE78],4CACFE
 006BAE68    sete        al
>006BAE6B    jmp         006BAEDA
 006BAE6D    cmp         dword ptr ds:[78BE78],8CADFE;gvar_0078BE78
 006BAE77    sete        al
>006BAE7A    jmp         006BAEDA
 006BAE7C    cmp         dword ptr ds:[78BE78],0AC55FE;gvar_0078BE78
>006BAE86    je          006BAE98
 006BAE88    cmp         dword ptr ds:[78BE78],548CFA
>006BAE92    je          006BAE98
 006BAE94    xor         eax,eax
>006BAE96    jmp         006BAEDA
 006BAE98    mov         al,1
>006BAE9A    jmp         006BAEDA
 006BAE9C    cmp         dword ptr ds:[78BE78],8C85FE;gvar_0078BE78
>006BAEA6    je          006BAED0
 006BAEA8    cmp         dword ptr ds:[78BE78],8C81FE;gvar_0078BE78
>006BAEB2    je          006BAED0
 006BAEB4    cmp         dword ptr ds:[78BE78],8C81FA;gvar_0078BE78
>006BAEBE    je          006BAED0
 006BAEC0    cmp         dword ptr ds:[78BE78],8C85FA;gvar_0078BE78
>006BAECA    je          006BAED0
 006BAECC    xor         eax,eax
>006BAECE    jmp         006BAEDA
 006BAED0    mov         al,1
>006BAED2    jmp         006BAEDA
 006BAED4    xor         eax,eax
>006BAED6    jmp         006BAEDA
 006BAED8    xor         eax,eax
 006BAEDA    ret
*}
end;

//006BAEDC
function TRemoteValue.GetPinnacle:Boolean;
begin
{*
 006BAEDC    cmp         byte ptr ds:[81F520],0;gvar_0081F520
>006BAEE3    jne         006BAEEE
 006BAEE5    cmp         dword ptr ds:[78BE70],0;gvar_0078BE70
>006BAEEC    jne         006BAEF1
 006BAEEE    xor         eax,eax
 006BAEF0    ret
 006BAEF1    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BAEF4    cmp         eax,58
>006BAEF7    ja          006BB25D
 006BAEFD    movzx       eax,byte ptr [eax+6BAF0B]
 006BAF04    jmp         dword ptr [eax*4+6BAF64]
 006BAF04    db          1
 006BAF04    db          2
 006BAF04    db          3
 006BAF04    db          4
 006BAF04    db          5
 006BAF04    db          6
 006BAF04    db          7
 006BAF04    db          8
 006BAF04    db          9
 006BAF04    db          10
 006BAF04    db          11
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          37
 006BAF04    db          0
 006BAF04    db          35
 006BAF04    db          0
 006BAF04    db          27
 006BAF04    db          36
 006BAF04    db          28
 006BAF04    db          34
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          24
 006BAF04    db          16
 006BAF04    db          39
 006BAF04    db          20
 006BAF04    db          25
 006BAF04    db          29
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          42
 006BAF04    db          41
 006BAF04    db          40
 006BAF04    db          38
 006BAF04    db          23
 006BAF04    db          26
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          14
 006BAF04    db          13
 006BAF04    db          15
 006BAF04    db          12
 006BAF04    db          18
 006BAF04    db          17
 006BAF04    db          19
 006BAF04    db          31
 006BAF04    db          22
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          30
 006BAF04    db          32
 006BAF04    db          33
 006BAF04    db          21
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          0
 006BAF04    db          23
 006BAF04    dd          006BB25D
 006BAF04    dd          006BB010
 006BAF04    dd          006BB017
 006BAF04    dd          006BB026
 006BAF04    dd          006BB035
 006BAF04    dd          006BB044
 006BAF04    dd          006BB053
 006BAF04    dd          006BB062
 006BAF04    dd          006BB071
 006BAF04    dd          006BB080
 006BAF04    dd          006BB08F
 006BAF04    dd          006BB09E
 006BAF04    dd          006BB0AD
 006BAF04    dd          006BB0BC
 006BAF04    dd          006BB0CB
 006BAF04    dd          006BB0DA
 006BAF04    dd          006BB0E9
 006BAF04    dd          006BB0F8
 006BAF04    dd          006BB107
 006BAF04    dd          006BB116
 006BAF04    dd          006BB125
 006BAF04    dd          006BB134
 006BAF04    dd          006BB143
 006BAF04    dd          006BB152
 006BAF04    dd          006BB161
 006BAF04    dd          006BB170
 006BAF04    dd          006BB17F
 006BAF04    dd          006BB18E
 006BAF04    dd          006BB19D
 006BAF04    dd          006BB1AC
 006BAF04    dd          006BB1BB
 006BAF04    dd          006BB1CA
 006BAF04    dd          006BB1D9
 006BAF04    dd          006BB1E5
 006BAF04    dd          006BB1F1
 006BAF04    dd          006BB1FD
 006BAF04    dd          006BB209
 006BAF04    dd          006BB215
 006BAF04    dd          006BB221
 006BAF04    dd          006BB22D
 006BAF04    dd          006BB239
 006BAF04    dd          006BB245
 006BAF04    dd          006BB251
 006BB010    mov         al,1
>006BB012    jmp         006BB25F
 006BB017    cmp         dword ptr ds:[78BE70],31;gvar_0078BE70
 006BB01E    sete        al
>006BB021    jmp         006BB25F
 006BB026    cmp         dword ptr ds:[78BE70],32;gvar_0078BE70
 006BB02D    sete        al
>006BB030    jmp         006BB25F
 006BB035    cmp         dword ptr ds:[78BE70],33;gvar_0078BE70
 006BB03C    sete        al
>006BB03F    jmp         006BB25F
 006BB044    cmp         dword ptr ds:[78BE70],34;gvar_0078BE70
 006BB04B    sete        al
>006BB04E    jmp         006BB25F
 006BB053    cmp         dword ptr ds:[78BE70],35;gvar_0078BE70
 006BB05A    sete        al
>006BB05D    jmp         006BB25F
 006BB062    cmp         dword ptr ds:[78BE70],36;gvar_0078BE70
 006BB069    sete        al
>006BB06C    jmp         006BB25F
 006BB071    cmp         dword ptr ds:[78BE70],37;gvar_0078BE70
 006BB078    sete        al
>006BB07B    jmp         006BB25F
 006BB080    cmp         dword ptr ds:[78BE70],38;gvar_0078BE70
 006BB087    sete        al
>006BB08A    jmp         006BB25F
 006BB08F    cmp         dword ptr ds:[78BE70],39;gvar_0078BE70
 006BB096    sete        al
>006BB099    jmp         006BB25F
 006BB09E    cmp         dword ptr ds:[78BE70],3A;gvar_0078BE70
 006BB0A5    sete        al
>006BB0A8    jmp         006BB25F
 006BB0AD    cmp         dword ptr ds:[78BE70],7;gvar_0078BE70
 006BB0B4    sete        al
>006BB0B7    jmp         006BB25F
 006BB0BC    cmp         dword ptr ds:[78BE70],0B;gvar_0078BE70
 006BB0C3    sete        al
>006BB0C6    jmp         006BB25F
 006BB0CB    cmp         dword ptr ds:[78BE70],0D;gvar_0078BE70
 006BB0D2    sete        al
>006BB0D5    jmp         006BB25F
 006BB0DA    cmp         dword ptr ds:[78BE70],0E;gvar_0078BE70
 006BB0E1    sete        al
>006BB0E4    jmp         006BB25F
 006BB0E9    cmp         dword ptr ds:[78BE70],0F;gvar_0078BE70
 006BB0F0    sete        al
>006BB0F3    jmp         006BB25F
 006BB0F8    cmp         dword ptr ds:[78BE70],13;gvar_0078BE70
 006BB0FF    sete        al
>006BB102    jmp         006BB25F
 006BB107    cmp         dword ptr ds:[78BE70],15;gvar_0078BE70
 006BB10E    sete        al
>006BB111    jmp         006BB25F
 006BB116    cmp         dword ptr ds:[78BE70],16;gvar_0078BE70
 006BB11D    sete        al
>006BB120    jmp         006BB25F
 006BB125    cmp         dword ptr ds:[78BE70],17;gvar_0078BE70
 006BB12C    sete        al
>006BB12F    jmp         006BB25F
 006BB134    cmp         dword ptr ds:[78BE70],18;gvar_0078BE70
 006BB13B    sete        al
>006BB13E    jmp         006BB25F
 006BB143    cmp         dword ptr ds:[78BE70],19;gvar_0078BE70
 006BB14A    sete        al
>006BB14D    jmp         006BB25F
 006BB152    cmp         dword ptr ds:[78BE70],1A;gvar_0078BE70
 006BB159    sete        al
>006BB15C    jmp         006BB25F
 006BB161    cmp         dword ptr ds:[78BE70],1B;gvar_0078BE70
 006BB168    sete        al
>006BB16B    jmp         006BB25F
 006BB170    cmp         dword ptr ds:[78BE70],1C;gvar_0078BE70
 006BB177    sete        al
>006BB17A    jmp         006BB25F
 006BB17F    cmp         dword ptr ds:[78BE70],1D;gvar_0078BE70
 006BB186    sete        al
>006BB189    jmp         006BB25F
 006BB18E    cmp         dword ptr ds:[78BE70],1E;gvar_0078BE70
 006BB195    sete        al
>006BB198    jmp         006BB25F
 006BB19D    cmp         dword ptr ds:[78BE70],1F;gvar_0078BE70
 006BB1A4    sete        al
>006BB1A7    jmp         006BB25F
 006BB1AC    cmp         dword ptr ds:[78BE70],25;gvar_0078BE70
 006BB1B3    sete        al
>006BB1B6    jmp         006BB25F
 006BB1BB    cmp         dword ptr ds:[78BE70],26;gvar_0078BE70
 006BB1C2    sete        al
>006BB1C5    jmp         006BB25F
 006BB1CA    cmp         dword ptr ds:[78BE70],27;gvar_0078BE70
 006BB1D1    sete        al
>006BB1D4    jmp         006BB25F
 006BB1D9    cmp         dword ptr ds:[78BE70],29;gvar_0078BE70
 006BB1E0    sete        al
>006BB1E3    jmp         006BB25F
 006BB1E5    cmp         dword ptr ds:[78BE70],2A;gvar_0078BE70
 006BB1EC    sete        al
>006BB1EF    jmp         006BB25F
 006BB1F1    cmp         dword ptr ds:[78BE70],2B;gvar_0078BE70
 006BB1F8    sete        al
>006BB1FB    jmp         006BB25F
 006BB1FD    cmp         dword ptr ds:[78BE70],2D;gvar_0078BE70
 006BB204    sete        al
>006BB207    jmp         006BB25F
 006BB209    cmp         dword ptr ds:[78BE70],2E;gvar_0078BE70
 006BB210    sete        al
>006BB213    jmp         006BB25F
 006BB215    cmp         dword ptr ds:[78BE70],2F;gvar_0078BE70
 006BB21C    sete        al
>006BB21F    jmp         006BB25F
 006BB221    cmp         dword ptr ds:[78BE70],3B;gvar_0078BE70
 006BB228    sete        al
>006BB22B    jmp         006BB25F
 006BB22D    cmp         dword ptr ds:[78BE70],3C;gvar_0078BE70
 006BB234    sete        al
>006BB237    jmp         006BB25F
 006BB239    cmp         dword ptr ds:[78BE70],3D;gvar_0078BE70
 006BB240    sete        al
>006BB243    jmp         006BB25F
 006BB245    cmp         dword ptr ds:[78BE70],3E;gvar_0078BE70
 006BB24C    sete        al
>006BB24F    jmp         006BB25F
 006BB251    cmp         dword ptr ds:[78BE70],3F;gvar_0078BE70
 006BB258    sete        al
>006BB25B    jmp         006BB25F
 006BB25D    xor         eax,eax
 006BB25F    ret
*}
end;

//006BB260
procedure TRemoteValue.GetValue;
begin
{*
 006BB260    push        ebx
 006BB261    add         esp,0FFFFFFF8
 006BB264    mov         ebx,eax
 006BB266    mov         eax,ebx
 006BB268    mov         edx,dword ptr [eax]
 006BB26A    call        dword ptr [edx+30];TRemoteValue.GetBoolean
 006BB26D    call        00686074
 006BB272    fstp        qword ptr [esp]
 006BB275    wait
 006BB276    fld         qword ptr [esp]
 006BB279    pop         ecx
 006BB27A    pop         edx
 006BB27B    pop         ebx
 006BB27C    ret
*}
end;

//006BB280
procedure TRemoteValue.SetValue(NewValue:Double);
begin
{*
 006BB280    push        ebp
 006BB281    mov         ebp,esp
 006BB283    xor         eax,eax
 006BB285    pop         ebp
 006BB286    ret         8
*}
end;

//006BB28C
{*procedure TRemoteValue.ToString(?:?);
begin
 006BB28C    push        ebp
 006BB28D    mov         ebp,esp
 006BB28F    push        0
 006BB291    push        0
 006BB293    push        0
 006BB295    push        ebx
 006BB296    push        esi
 006BB297    mov         esi,edx
 006BB299    mov         ebx,eax
 006BB29B    xor         eax,eax
 006BB29D    push        ebp
 006BB29E    push        6BB30B
 006BB2A3    push        dword ptr fs:[eax]
 006BB2A6    mov         dword ptr fs:[eax],esp
 006BB2A9    push        6BB324;'Remote.Brand'
 006BB2AE    lea         edx,[ebp-4]
 006BB2B1    movzx       eax,byte ptr [ebx+20];TRemoteValue.Brand:byte
 006BB2B5    call        IntToStr
 006BB2BA    push        dword ptr [ebp-4]
 006BB2BD    push        6BB34C;'.Device'
 006BB2C2    lea         edx,[ebp-8]
 006BB2C5    movzx       eax,byte ptr [ebx+21];TRemoteValue.Device:byte
 006BB2C9    call        IntToStr
 006BB2CE    push        dword ptr [ebp-8]
 006BB2D1    push        6BB368;'.'
 006BB2D6    lea         edx,[ebp-0C]
 006BB2D9    mov         eax,dword ptr [ebx+24];TRemoteValue.Item:Integer
 006BB2DC    call        006B56D4
 006BB2E1    push        dword ptr [ebp-0C]
 006BB2E4    mov         eax,esi
 006BB2E6    mov         edx,6
 006BB2EB    call        @UStrCatN
 006BB2F0    xor         eax,eax
 006BB2F2    pop         edx
 006BB2F3    pop         ecx
 006BB2F4    pop         ecx
 006BB2F5    mov         dword ptr fs:[eax],edx
 006BB2F8    push        6BB312
 006BB2FD    lea         eax,[ebp-0C]
 006BB300    mov         edx,3
 006BB305    call        @UStrArrayClr
 006BB30A    ret
>006BB30B    jmp         @HandleFinally
>006BB310    jmp         006BB2FD
 006BB312    pop         esi
 006BB313    pop         ebx
 006BB314    mov         esp,ebp
 006BB316    pop         ebp
 006BB317    ret
end;*}

//006BB36C
function TRemoteValue.GetSonyAudio:Boolean;
begin
{*
 006BB36C    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BB373    jne         006BB378
 006BB375    xor         eax,eax
 006BB377    ret
 006BB378    movzx       edx,byte ptr [eax+21];TRemoteValue.Device:byte
 006BB37C    cmp         dl,5
>006BB37F    je          006BB385
 006BB381    test        dl,dl
>006BB383    jne         006BB3E9
 006BB385    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BB388    cmp         eax,1F
>006BB38B    jg          006BB39B
>006BB38D    je          006BB3A9
 006BB38F    sub         eax,1
>006BB392    jb          006BB3A5
 006BB394    sub         eax,1D
>006BB397    je          006BB3B8
>006BB399    jmp         006BB3E5
 006BB39B    sub         eax,4A
>006BB39E    je          006BB3C7
 006BB3A0    dec         eax
>006BB3A1    je          006BB3D6
>006BB3A3    jmp         006BB3E5
 006BB3A5    mov         al,1
>006BB3A7    jmp         006BB3EB
 006BB3A9    cmp         dword ptr ds:[78BE78],544DFF
 006BB3B3    sete        al
>006BB3B6    jmp         006BB3EB
 006BB3B8    cmp         dword ptr ds:[78BE78],0AC4DFF;gvar_0078BE78
 006BB3C2    sete        al
>006BB3C5    jmp         006BB3EB
 006BB3C7    cmp         dword ptr ds:[78BE78],544CFF
 006BB3D1    sete        al
>006BB3D4    jmp         006BB3EB
 006BB3D6    cmp         dword ptr ds:[78BE78],0B44CFF;gvar_0078BE78
 006BB3E0    sete        al
>006BB3E3    jmp         006BB3EB
 006BB3E5    xor         eax,eax
>006BB3E7    jmp         006BB3EB
 006BB3E9    xor         eax,eax
 006BB3EB    ret
*}
end;

//006BB3EC
function TRemoteValue.GetSonyPhono:Boolean;
begin
{*
 006BB3EC    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BB3F3    jne         006BB3F8
 006BB3F5    xor         eax,eax
 006BB3F7    ret
 006BB3F8    movzx       edx,byte ptr [eax+21];TRemoteValue.Device:byte
 006BB3FC    cmp         dl,5
>006BB3FF    je          006BB40A
 006BB401    cmp         dl,6
>006BB404    je          006BB40A
 006BB406    test        dl,dl
>006BB408    jne         006BB47F
 006BB40A    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BB40D    cmp         eax,1F
>006BB410    jg          006BB420
>006BB412    je          006BB45D
 006BB414    sub         eax,1
>006BB417    jb          006BB42A
 006BB419    sub         eax,1D
>006BB41C    je          006BB46C
>006BB41E    jmp         006BB47B
 006BB420    sub         eax,32
>006BB423    je          006BB42E
 006BB425    dec         eax
>006BB426    je          006BB44E
>006BB428    jmp         006BB47B
 006BB42A    mov         al,1
>006BB42C    jmp         006BB481
 006BB42E    cmp         dword ptr ds:[78BE78],4C4DFF
>006BB438    je          006BB44A
 006BB43A    cmp         dword ptr ds:[78BE78],4C4CFF
>006BB444    je          006BB44A
 006BB446    xor         eax,eax
>006BB448    jmp         006BB481
 006BB44A    mov         al,1
>006BB44C    jmp         006BB481
 006BB44E    cmp         dword ptr ds:[78BE78],0B44CFF;gvar_0078BE78
 006BB458    sete        al
>006BB45B    jmp         006BB481
 006BB45D    cmp         dword ptr ds:[78BE78],544DFF
 006BB467    sete        al
>006BB46A    jmp         006BB481
 006BB46C    cmp         dword ptr ds:[78BE78],0AC4DFF;gvar_0078BE78
 006BB476    sete        al
>006BB479    jmp         006BB481
 006BB47B    xor         eax,eax
>006BB47D    jmp         006BB481
 006BB47F    xor         eax,eax
 006BB481    ret
*}
end;

//006BB484
function TRemoteValue.GetSonyRadio:Boolean;
begin
{*
 006BB484    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BB48B    jne         006BB490
 006BB48D    xor         eax,eax
 006BB48F    ret
 006BB490    movzx       edx,byte ptr [eax+21];TRemoteValue.Device:byte
 006BB494    cmp         dl,5
>006BB497    je          006BB4A6
 006BB499    cmp         dl,7
>006BB49C    je          006BB4A6
 006BB49E    test        dl,dl
>006BB4A0    jne         006BB52F
 006BB4A6    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BB4A9    cmp         eax,21
>006BB4AC    jg          006BB4BF
>006BB4AE    je          006BB4DE
 006BB4B0    sub         eax,1
>006BB4B3    jb          006BB4CB
 006BB4B5    sub         eax,1D
>006BB4B8    je          006BB51C
 006BB4BA    dec         eax
>006BB4BB    je          006BB50D
>006BB4BD    jmp         006BB52B
 006BB4BF    sub         eax,22
>006BB4C2    je          006BB4CF
 006BB4C4    sub         eax,29
>006BB4C7    je          006BB4FE
>006BB4C9    jmp         006BB52B
 006BB4CB    mov         al,1
>006BB4CD    jmp         006BB531
 006BB4CF    cmp         dword ptr ds:[78BE78],0B4ADFD;gvar_0078BE78
 006BB4D9    sete        al
>006BB4DC    jmp         006BB531
 006BB4DE    cmp         dword ptr ds:[78BE78],4C29FD
>006BB4E8    je          006BB4FA
 006BB4EA    cmp         dword ptr ds:[78BE78],4C14FD
>006BB4F4    je          006BB4FA
 006BB4F6    xor         eax,eax
>006BB4F8    jmp         006BB531
 006BB4FA    mov         al,1
>006BB4FC    jmp         006BB531
 006BB4FE    cmp         dword ptr ds:[78BE78],0B44CFF;gvar_0078BE78
 006BB508    sete        al
>006BB50B    jmp         006BB531
 006BB50D    cmp         dword ptr ds:[78BE78],544DFF
 006BB517    sete        al
>006BB51A    jmp         006BB531
 006BB51C    cmp         dword ptr ds:[78BE78],0AC4DFF;gvar_0078BE78
 006BB526    sete        al
>006BB529    jmp         006BB531
 006BB52B    xor         eax,eax
>006BB52D    jmp         006BB531
 006BB52F    xor         eax,eax
 006BB531    ret
*}
end;

//006BB534
function TRemoteValue.GetSonyTape:Boolean;
begin
{*
 006BB534    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BB53B    jne         006BB540
 006BB53D    xor         eax,eax
 006BB53F    ret
 006BB540    movzx       edx,byte ptr [eax+21];TRemoteValue.Device:byte
 006BB544    cmp         dl,5
>006BB547    je          006BB556
 006BB549    cmp         dl,9
>006BB54C    je          006BB556
 006BB54E    test        dl,dl
>006BB550    jne         006BB7AB
 006BB556    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BB559    cmp         eax,4A
>006BB55C    ja          006BB7A7
 006BB562    movzx       eax,byte ptr [eax+6BB570]
 006BB569    jmp         dword ptr [eax*4+6BB5BB]
 006BB569    db          1
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          16
 006BB569    db          15
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          10
 006BB569    db          12
 006BB569    db          14
 006BB569    db          13
 006BB569    db          2
 006BB569    db          0
 006BB569    db          0
 006BB569    db          9
 006BB569    db          0
 006BB569    db          0
 006BB569    db          4
 006BB569    db          6
 006BB569    db          8
 006BB569    db          7
 006BB569    db          2
 006BB569    db          11
 006BB569    db          5
 006BB569    db          3
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          0
 006BB569    db          17
 006BB569    dd          006BB7A7
 006BB569    dd          006BB603
 006BB569    dd          006BB60A
 006BB569    dd          006BB61C
 006BB569    dd          006BB642
 006BB569    dd          006BB668
 006BB569    dd          006BB69A
 006BB569    dd          006BB6AC
 006BB569    dd          006BB6BE
 006BB569    dd          006BB6E4
 006BB569    dd          006BB6F6
 006BB569    dd          006BB71C
 006BB569    dd          006BB73C
 006BB569    dd          006BB74B
 006BB569    dd          006BB75A
 006BB569    dd          006BB77A
 006BB569    dd          006BB789
 006BB569    dd          006BB798
 006BB603    mov         al,1
>006BB605    jmp         006BB7AD
 006BB60A    cmp         dword ptr ds:[78BE78],0B48DFD;gvar_0078BE78
 006BB614    sete        al
>006BB617    jmp         006BB7AD
 006BB61C    cmp         dword ptr ds:[78BE78],2C35F1;gvar_0078BE78
>006BB626    je          006BB63B
 006BB628    cmp         dword ptr ds:[78BE78],2C1AF1;gvar_0078BE78
>006BB632    je          006BB63B
 006BB634    xor         eax,eax
>006BB636    jmp         006BB7AD
 006BB63B    mov         al,1
>006BB63D    jmp         006BB7AD
 006BB642    cmp         dword ptr ds:[78BE78],8C4CFF;gvar_0078BE78
>006BB64C    je          006BB661
 006BB64E    cmp         dword ptr ds:[78BE78],0AC8DFD;gvar_0078BE78
>006BB658    je          006BB661
 006BB65A    xor         eax,eax
>006BB65C    jmp         006BB7AD
 006BB661    mov         al,1
>006BB663    jmp         006BB7AD
 006BB668    cmp         dword ptr ds:[78BE78],8C4CFF;gvar_0078BE78
>006BB672    je          006BB693
 006BB674    cmp         dword ptr ds:[78BE78],4C2DFD
>006BB67E    je          006BB693
 006BB680    cmp         dword ptr ds:[78BE78],4C2DFE
>006BB68A    je          006BB693
 006BB68C    xor         eax,eax
>006BB68E    jmp         006BB7AD
 006BB693    mov         al,1
>006BB695    jmp         006BB7AD
 006BB69A    cmp         dword ptr ds:[78BE78],4C8DFD
 006BB6A4    sete        al
>006BB6A7    jmp         006BB7AD
 006BB6AC    cmp         dword ptr ds:[78BE78],8C8DFD;gvar_0078BE78
 006BB6B6    sete        al
>006BB6B9    jmp         006BB7AD
 006BB6BE    cmp         dword ptr ds:[78BE78],5435F1
>006BB6C8    je          006BB6DD
 006BB6CA    cmp         dword ptr ds:[78BE78],541AF1
>006BB6D4    je          006BB6DD
 006BB6D6    xor         eax,eax
>006BB6D8    jmp         006BB7AD
 006BB6DD    mov         al,1
>006BB6DF    jmp         006BB7AD
 006BB6E4    cmp         dword ptr ds:[78BE78],2CB1FC;gvar_0078BE78
 006BB6EE    sete        al
>006BB6F1    jmp         006BB7AD
 006BB6F6    cmp         dword ptr ds:[78BE78],8C4CFF;gvar_0078BE78
>006BB700    je          006BB715
 006BB702    cmp         dword ptr ds:[78BE78],0ACB1FC;gvar_0078BE78
>006BB70C    je          006BB715
 006BB70E    xor         eax,eax
>006BB710    jmp         006BB7AD
 006BB715    mov         al,1
>006BB717    jmp         006BB7AD
 006BB71C    cmp         dword ptr ds:[78BE78],8C4CFF;gvar_0078BE78
>006BB726    je          006BB738
 006BB728    cmp         dword ptr ds:[78BE78],54B4FA
>006BB732    je          006BB738
 006BB734    xor         eax,eax
>006BB736    jmp         006BB7AD
 006BB738    mov         al,1
>006BB73A    jmp         006BB7AD
 006BB73C    cmp         dword ptr ds:[78BE78],4CB1FC
 006BB746    sete        al
>006BB749    jmp         006BB7AD
 006BB74B    cmp         dword ptr ds:[78BE78],8CB1FC;gvar_0078BE78
 006BB755    sete        al
>006BB758    jmp         006BB7AD
 006BB75A    cmp         dword ptr ds:[78BE78],54B5FC
>006BB764    je          006BB776
 006BB766    cmp         dword ptr ds:[78BE78],54B1FC
>006BB770    je          006BB776
 006BB772    xor         eax,eax
>006BB774    jmp         006BB7AD
 006BB776    mov         al,1
>006BB778    jmp         006BB7AD
 006BB77A    cmp         dword ptr ds:[78BE78],544DFF
 006BB784    sete        al
>006BB787    jmp         006BB7AD
 006BB789    cmp         dword ptr ds:[78BE78],0AC4DFF;gvar_0078BE78
 006BB793    sete        al
>006BB796    jmp         006BB7AD
 006BB798    cmp         dword ptr ds:[78BE78],544CFF
 006BB7A2    sete        al
>006BB7A5    jmp         006BB7AD
 006BB7A7    xor         eax,eax
>006BB7A9    jmp         006BB7AD
 006BB7AB    xor         eax,eax
 006BB7AD    ret
*}
end;

//006BB7B0
function TRemoteValue.GetSonyCD:Boolean;
begin
{*
 006BB7B0    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BB7B7    jne         006BB7BC
 006BB7B9    xor         eax,eax
 006BB7BB    ret
 006BB7BC    movzx       edx,byte ptr [eax+21];TRemoteValue.Device:byte
 006BB7C0    cmp         dl,5
>006BB7C3    je          006BB7D2
 006BB7C5    cmp         dl,8
>006BB7C8    je          006BB7D2
 006BB7CA    test        dl,dl
>006BB7CC    jne         006BB8E5
 006BB7D2    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BB7D5    cmp         eax,33
>006BB7D8    jg          006BB7FB
>006BB7DA    je          006BB833
 006BB7DC    sub         eax,1
>006BB7DF    jb          006BB81A
 006BB7E1    sub         eax,1D
>006BB7E4    je          006BB8D2
 006BB7EA    dec         eax
>006BB7EB    je          006BB8C3
 006BB7F1    sub         eax,13
>006BB7F4    je          006BB845
>006BB7F6    jmp         006BB8E1
 006BB7FB    sub         eax,36
>006BB7FE    je          006BB821
 006BB800    sub         eax,4
>006BB803    je          006BB894
 006BB809    dec         eax
>006BB80A    je          006BB8A3
 006BB810    sub         eax,11
>006BB813    je          006BB868
>006BB815    jmp         006BB8E1
 006BB81A    mov         al,1
>006BB81C    jmp         006BB8E7
 006BB821    cmp         dword ptr ds:[78BE78],0B451FC;gvar_0078BE78
 006BB82B    sete        al
>006BB82E    jmp         006BB8E7
 006BB833    cmp         dword ptr ds:[78BE78],4C51FC
 006BB83D    sete        al
>006BB840    jmp         006BB8E7
 006BB845    cmp         dword ptr ds:[78BE78],344CFF;gvar_0078BE78
>006BB84F    je          006BB864
 006BB851    cmp         dword ptr ds:[78BE78],0AC51FC;gvar_0078BE78
>006BB85B    je          006BB864
 006BB85D    xor         eax,eax
>006BB85F    jmp         006BB8E7
 006BB864    mov         al,1
>006BB866    jmp         006BB8E7
 006BB868    cmp         dword ptr ds:[78BE78],2C55E2;gvar_0078BE78
>006BB872    je          006BB890
 006BB874    cmp         dword ptr ds:[78BE78],2C45E2;gvar_0078BE78
>006BB87E    je          006BB890
 006BB880    cmp         dword ptr ds:[78BE78],2CA2FA;gvar_0078BE78
>006BB88A    je          006BB890
 006BB88C    xor         eax,eax
>006BB88E    jmp         006BB8E7
 006BB890    mov         al,1
>006BB892    jmp         006BB8E7
 006BB894    cmp         dword ptr ds:[78BE78],0B451FC;gvar_0078BE78
 006BB89E    sete        al
>006BB8A1    jmp         006BB8E7
 006BB8A3    cmp         dword ptr ds:[78BE78],4CD5FC
>006BB8AD    je          006BB8BF
 006BB8AF    cmp         dword ptr ds:[78BE78],4C6AFC
>006BB8B9    je          006BB8BF
 006BB8BB    xor         eax,eax
>006BB8BD    jmp         006BB8E7
 006BB8BF    mov         al,1
>006BB8C1    jmp         006BB8E7
 006BB8C3    cmp         dword ptr ds:[78BE78],544DFF
 006BB8CD    sete        al
>006BB8D0    jmp         006BB8E7
 006BB8D2    cmp         dword ptr ds:[78BE78],0AC4DFF;gvar_0078BE78
 006BB8DC    sete        al
>006BB8DF    jmp         006BB8E7
 006BB8E1    xor         eax,eax
>006BB8E3    jmp         006BB8E7
 006BB8E5    xor         eax,eax
 006BB8E7    ret
*}
end;

//006BB8E8
function TRemoteValue.GetSonyVCR:Boolean;
begin
{*
 006BB8E8    cmp         dword ptr ds:[78BE78],0;gvar_0078BE78
>006BB8EF    jne         006BB8F4
 006BB8F1    xor         eax,eax
 006BB8F3    ret
 006BB8F4    movzx       edx,byte ptr [eax+21];TRemoteValue.Device:byte
 006BB8F8    cmp         dl,3
>006BB8FB    je          006BB905
 006BB8FD    test        dl,dl
>006BB8FF    jne         006BBD4E
 006BB905    mov         eax,dword ptr [eax+24];TRemoteValue.Item:Integer
 006BB908    cmp         eax,6C
>006BB90B    ja          006BBD4A
 006BB911    movzx       eax,byte ptr [eax+6BB91F]
 006BB918    jmp         dword ptr [eax*4+6BB98C]
 006BB918    db          1
 006BB918    db          2
 006BB918    db          3
 006BB918    db          4
 006BB918    db          5
 006BB918    db          6
 006BB918    db          7
 006BB918    db          8
 006BB918    db          9
 006BB918    db          10
 006BB918    db          11
 006BB918    db          12
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          27
 006BB918    db          28
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          19
 006BB918    db          20
 006BB918    db          0
 006BB918    db          21
 006BB918    db          22
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          15
 006BB918    db          16
 006BB918    db          17
 006BB918    db          14
 006BB918    db          18
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          13
 006BB918    db          0
 006BB918    db          0
 006BB918    db          32
 006BB918    db          38
 006BB918    db          37
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          30
 006BB918    db          0
 006BB918    db          33
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          0
 006BB918    db          24
 006BB918    db          0
 006BB918    db          0
 006BB918    db          23
 006BB918    db          25
 006BB918    db          26
 006BB918    db          29
 006BB918    db          31
 006BB918    db          34
 006BB918    db          35
 006BB918    db          36
 006BB918    db          39
 006BB918    db          40
 006BB918    db          41
 006BB918    db          42
 006BB918    dd          006BBD4A
 006BB918    dd          006BBA38
 006BB918    dd          006BBA3F
 006BB918    dd          006BBA51
 006BB918    dd          006BBA63
 006BB918    dd          006BBA75
 006BB918    dd          006BBA87
 006BB918    dd          006BBA99
 006BB918    dd          006BBAAB
 006BB918    dd          006BBABD
 006BB918    dd          006BBACF
 006BB918    dd          006BBAE1
 006BB918    dd          006BBAF3
 006BB918    dd          006BBB05
 006BB918    dd          006BBB17
 006BB918    dd          006BBB29
 006BB918    dd          006BBB3B
 006BB918    dd          006BBB4D
 006BB918    dd          006BBB5F
 006BB918    dd          006BBB71
 006BB918    dd          006BBB83
 006BB918    dd          006BBB95
 006BB918    dd          006BBBA7
 006BB918    dd          006BBBB9
 006BB918    dd          006BBBCB
 006BB918    dd          006BBBDD
 006BB918    dd          006BBBEF
 006BB918    dd          006BBC45
 006BB918    dd          006BBC57
 006BB918    dd          006BBC69
 006BB918    dd          006BBC7B
 006BB918    dd          006BBC8D
 006BB918    dd          006BBC9F
 006BB918    dd          006BBCB1
 006BB918    dd          006BBCC3
 006BB918    dd          006BBCD2
 006BB918    dd          006BBCE1
 006BB918    dd          006BBCF0
 006BB918    dd          006BBCFF
 006BB918    dd          006BBD0E
 006BB918    dd          006BBD1D
 006BB918    dd          006BBD2C
 006BB918    dd          006BBD3B
 006BBA38    mov         al,1
>006BBA3A    jmp         006BBD50
 006BBA3F    cmp         dword ptr ds:[78BE78],4CAAFF
 006BBA49    sete        al
>006BBA4C    jmp         006BBD50
 006BBA51    cmp         dword ptr ds:[78BE78],0B482FD;gvar_0078BE78
 006BBA5B    sete        al
>006BBA5E    jmp         006BBD50
 006BBA63    cmp         dword ptr ds:[78BE78],0AC82FD;gvar_0078BE78
 006BBA6D    sete        al
>006BBA70    jmp         006BBD50
 006BBA75    cmp         dword ptr ds:[78BE78],5482FD
 006BBA7F    sete        al
>006BBA82    jmp         006BBD50
 006BBA87    cmp         dword ptr ds:[78BE78],8C82FD;gvar_0078BE78
 006BBA91    sete        al
>006BBA94    jmp         006BBD50
 006BBA99    cmp         dword ptr ds:[78BE78],3482FD;gvar_0078BE78
 006BBAA3    sete        al
>006BBAA6    jmp         006BBD50
 006BBAAB    cmp         dword ptr ds:[78BE78],2C82FD;gvar_0078BE78
 006BBAB5    sete        al
>006BBAB8    jmp         006BBD50
 006BBABD    cmp         dword ptr ds:[78BE78],5452FC
 006BBAC7    sete        al
>006BBACA    jmp         006BBD50
 006BBACF    cmp         dword ptr ds:[78BE78],4C82FD
 006BBAD9    sete        al
>006BBADC    jmp         006BBD50
 006BBAE1    cmp         dword ptr ds:[78BE78],0B482FD;gvar_0078BE78
 006BBAEB    sete        al
>006BBAEE    jmp         006BBD50
 006BBAF3    cmp         dword ptr ds:[78BE78],0AC82FD;gvar_0078BE78
 006BBAFD    sete        al
>006BBB00    jmp         006BBD50
 006BBB05    cmp         dword ptr ds:[78BE78],2CA441;gvar_0078BE78
 006BBB0F    sete        al
>006BBB12    jmp         006BBD50
 006BBB17    cmp         dword ptr ds:[78BE78],4C8D41
 006BBB21    sete        al
>006BBB24    jmp         006BBD50
 006BBB29    cmp         dword ptr ds:[78BE78],544D54
 006BBB33    sete        al
>006BBB36    jmp         006BBD50
 006BBB3B    cmp         dword ptr ds:[78BE78],4C84D1
 006BBB45    sete        al
>006BBB48    jmp         006BBD50
 006BBB4D    cmp         dword ptr ds:[78BE78],0B48D41;gvar_0078BE78
 006BBB57    sete        al
>006BBB5A    jmp         006BBD50
 006BBB5F    cmp         dword ptr ds:[78BE78],3454FC;gvar_0078BE78
 006BBB69    sete        al
>006BBB6C    jmp         006BBD50
 006BBB71    cmp         dword ptr ds:[78BE78],0ACADFE;gvar_0078BE78
 006BBB7B    sete        al
>006BBB7E    jmp         006BBD50
 006BBB83    cmp         dword ptr ds:[78BE78],54ADFE
 006BBB8D    sete        al
>006BBB90    jmp         006BBD50
 006BBB95    cmp         dword ptr ds:[78BE78],4C54FD
 006BBB9F    sete        al
>006BBBA2    jmp         006BBD50
 006BBBA7    cmp         dword ptr ds:[78BE78],0B42DFD;gvar_0078BE78
 006BBBB1    sete        al
>006BBBB4    jmp         006BBD50
 006BBBB9    cmp         dword ptr ds:[78BE78],4C54FC
 006BBBC3    sete        al
>006BBBC6    jmp         006BBD50
 006BBBCB    cmp         dword ptr ds:[78BE78],548CFC
 006BBBD5    sete        al
>006BBBD8    jmp         006BBD50
 006BBBDD    cmp         dword ptr ds:[78BE78],2C2AFD;gvar_0078BE78
 006BBBE7    sete        al
>006BBBEA    jmp         006BBD50
 006BBBEF    cmp         dword ptr ds:[78BE78],4CB4FF
>006BBBF9    je          006BBC3E
 006BBBFB    cmp         dword ptr ds:[78BE78],34ACFE;gvar_0078BE78
>006BBC05    je          006BBC3E
 006BBC07    cmp         dword ptr ds:[78BE78],0AC2DFD;gvar_0078BE78
>006BBC11    je          006BBC3E
 006BBC13    cmp         dword ptr ds:[78BE78],2C58FC;gvar_0078BE78
>006BBC1D    je          006BBC3E
 006BBC1F    cmp         dword ptr ds:[78BE78],2C58FA;gvar_0078BE78
>006BBC29    je          006BBC3E
 006BBC2B    cmp         dword ptr ds:[78BE78],4C51FE
>006BBC35    je          006BBC3E
 006BBC37    xor         eax,eax
>006BBC39    jmp         006BBD50
 006BBC3E    mov         al,1
>006BBC40    jmp         006BBD50
 006BBC45    cmp         dword ptr ds:[78BE78],342DFD;gvar_0078BE78
 006BBC4F    sete        al
>006BBC52    jmp         006BBD50
 006BBC57    cmp         dword ptr ds:[78BE78],2C2DFD;gvar_0078BE78
 006BBC61    sete        al
>006BBC64    jmp         006BBD50
 006BBC69    cmp         dword ptr ds:[78BE78],0B43441;gvar_0078BE78
 006BBC73    sete        al
>006BBC76    jmp         006BBD50
 006BBC7B    cmp         dword ptr ds:[78BE78],0AC55FC;gvar_0078BE78
 006BBC85    sete        al
>006BBC88    jmp         006BBD50
 006BBC8D    cmp         dword ptr ds:[78BE78],0AC55FC;gvar_0078BE78
 006BBC97    sete        al
>006BBC9A    jmp         006BBD50
 006BBC9F    cmp         dword ptr ds:[78BE78],345AFC;gvar_0078BE78
 006BBCA9    sete        al
>006BBCAC    jmp         006BBD50
 006BBCB1    cmp         dword ptr ds:[78BE78],0AC2CFD;gvar_0078BE78
 006BBCBB    sete        al
>006BBCBE    jmp         006BBD50
 006BBCC3    cmp         dword ptr ds:[78BE78],5454FC
 006BBCCD    sete        al
>006BBCD0    jmp         006BBD50
 006BBCD2    cmp         dword ptr ds:[78BE78],4C51A2
 006BBCDC    sete        al
>006BBCDF    jmp         006BBD50
 006BBCE1    cmp         dword ptr ds:[78BE78],542CFD
 006BBCEB    sete        al
>006BBCEE    jmp         006BBD50
 006BBCF0    cmp         dword ptr ds:[78BE78],542CF8
 006BBCFA    sete        al
>006BBCFD    jmp         006BBD50
 006BBCFF    cmp         dword ptr ds:[78BE78],2C55FC;gvar_0078BE78
 006BBD09    sete        al
>006BBD0C    jmp         006BBD50
 006BBD0E    cmp         dword ptr ds:[78BE78],8C2DFD;gvar_0078BE78
 006BBD18    sete        al
>006BBD1B    jmp         006BBD50
 006BBD1D    cmp         dword ptr ds:[78BE78],542DF8
 006BBD27    sete        al
>006BBD2A    jmp         006BBD50
 006BBD2C    cmp         dword ptr ds:[78BE78],4C55FC
 006BBD36    sete        al
>006BBD39    jmp         006BBD50
 006BBD3B    cmp         dword ptr ds:[78BE78],4C81FD
 006BBD45    sete        al
>006BBD48    jmp         006BBD50
 006BBD4A    xor         eax,eax
>006BBD4C    jmp         006BBD50
 006BBD4E    xor         eax,eax
 006BBD50    ret
*}
end;

//006BBD54
{*procedure sub_006BBD54(?:?; ?:?);
begin
 006BBD54    push        ebp
 006BBD55    mov         ebp,esp
 006BBD57    add         esp,0FFFFFFF8
 006BBD5A    push        ebx
 006BBD5B    push        esi
 006BBD5C    push        edi
 006BBD5D    xor         ecx,ecx
 006BBD5F    mov         dword ptr [ebp-8],ecx
 006BBD62    mov         esi,edx
 006BBD64    mov         dword ptr [ebp-4],eax
 006BBD67    mov         eax,dword ptr [ebp-4]
 006BBD6A    call        @UStrAddRef
 006BBD6F    xor         eax,eax
 006BBD71    push        ebp
 006BBD72    push        6BBDD9
 006BBD77    push        dword ptr fs:[eax]
 006BBD7A    mov         dword ptr fs:[eax],esp
 006BBD7D    mov         eax,esi
 006BBD7F    call        @UStrClr
 006BBD84    mov         eax,dword ptr [ebp-4]
 006BBD87    test        eax,eax
>006BBD89    je          006BBD90
 006BBD8B    sub         eax,4
 006BBD8E    mov         eax,dword ptr [eax]
 006BBD90    mov         ebx,eax
 006BBD92    test        ebx,ebx
>006BBD94    jle         006BBDBE
 006BBD96    mov         edi,1
 006BBD9B    mov         eax,dword ptr [ebp-4]
 006BBD9E    movzx       eax,word ptr [eax+edi*2-2]
 006BBDA3    lea         ecx,[ebp-8]
 006BBDA6    mov         edx,2
 006BBDAB    call        IntToHex
 006BBDB0    mov         edx,dword ptr [ebp-8]
 006BBDB3    mov         eax,esi
 006BBDB5    call        @UStrCat
 006BBDBA    inc         edi
 006BBDBB    dec         ebx
>006BBDBC    jne         006BBD9B
 006BBDBE    xor         eax,eax
 006BBDC0    pop         edx
 006BBDC1    pop         ecx
 006BBDC2    pop         ecx
 006BBDC3    mov         dword ptr fs:[eax],edx
 006BBDC6    push        6BBDE0
 006BBDCB    lea         eax,[ebp-8]
 006BBDCE    mov         edx,2
 006BBDD3    call        @UStrArrayClr
 006BBDD8    ret
>006BBDD9    jmp         @HandleFinally
>006BBDDE    jmp         006BBDCB
 006BBDE0    pop         edi
 006BBDE1    pop         esi
 006BBDE2    pop         ebx
 006BBDE3    pop         ecx
 006BBDE4    pop         ecx
 006BBDE5    pop         ebp
 006BBDE6    ret
end;*}

//006BBDE8
procedure TRemoteValue.CreateClone;
begin
{*
 006BBDE8    mov         dl,1
 006BBDEA    mov         eax,[006B51A0];TRemoteValue
 006BBDEF    call        TObject.Create;TRemoteValue.Create
 006BBDF4    ret
*}
end;

//006BBDF8
procedure TRemoteValue.FillClone(c:TExpression);
begin
{*
 006BBDF8    push        ebx
 006BBDF9    push        esi
 006BBDFA    mov         esi,edx
 006BBDFC    mov         ebx,eax
 006BBDFE    mov         edx,esi
 006BBE00    mov         eax,ebx
 006BBE02    call        TExpression.FillClone
 006BBE07    mov         eax,esi
 006BBE09    movzx       edx,byte ptr [ebx+20];TRemoteValue.Brand:byte
 006BBE0D    mov         byte ptr [eax+20],dl
 006BBE10    movzx       edx,byte ptr [ebx+21];TRemoteValue.Device:byte
 006BBE14    mov         byte ptr [eax+21],dl
 006BBE17    mov         edx,dword ptr [ebx+24];TRemoteValue.Item:Integer
 006BBE1A    mov         dword ptr [eax+24],edx
 006BBE1D    mov         edx,dword ptr [ebx+18];TRemoteValue........................................................
 006BBE20    mov         dword ptr [eax+18],edx
 006BBE23    pop         esi
 006BBE24    pop         ebx
 006BBE25    ret
*}
end;

Initialization
//007823C0
{*
 007823C0    push        ebp
 007823C1    mov         ebp,esp
 007823C3    push        ebx
 007823C4    push        esi
 007823C5    push        edi
 007823C6    sub         dword ptr ds:[81F530],1
>007823CD    jae         00782422
 007823CF    xor         edx,edx
 007823D1    push        ebp
 007823D2    push        782407
 007823D7    push        dword ptr fs:[edx]
 007823DA    mov         dword ptr fs:[edx],esp
 007823DD    mov         eax,782434;'Initializing PieRemote'
 007823E2    call        004FA5FC
 007823E7    mov         dl,1
 007823E9    mov         eax,[0067D4A4];THashTable
 007823EE    call        THashTable.Create;THashTable.Create
 007823F3    mov         [0081F564],eax;gvar_0081F564:THashTable
 007823F8    call        006B56EC
 007823FD    xor         eax,eax
 007823FF    pop         edx
 00782400    pop         ecx
 00782401    pop         ecx
 00782402    mov         dword ptr fs:[eax],edx
>00782405    jmp         00782422
>00782407    jmp         @HandleOnException
 0078240C    dd          1
 00782410    dd          00418C04;Exception
 00782414    dd          00782418
 00782418    call        004FA644
 0078241D    call        @DoneExcept
 00782422    pop         edi
 00782423    pop         esi
 00782424    pop         ebx
 00782425    pop         ebp
 00782426    ret
*}
Finalization
//006BBE28
{*
 006BBE28    push        ebp
 006BBE29    mov         ebp,esp
 006BBE2B    push        ebx
 006BBE2C    push        esi
 006BBE2D    push        edi
 006BBE2E    xor         eax,eax
 006BBE30    push        ebp
 006BBE31    push        6BBEB0
 006BBE36    push        dword ptr fs:[eax]
 006BBE39    mov         dword ptr fs:[eax],esp
 006BBE3C    inc         dword ptr ds:[81F530]
>006BBE42    jne         006BBEA2
 006BBE44    xor         edx,edx
 006BBE46    push        ebp
 006BBE47    push        6BBE7D
 006BBE4C    push        dword ptr fs:[edx]
 006BBE4F    mov         dword ptr fs:[edx],esp
 006BBE52    mov         eax,6BBEC8;'Finalizing PieRemote'
 006BBE57    call        004FA5FC
 006BBE5C    mov         eax,[0081F564];gvar_0081F564:THashTable
 006BBE61    xor         edx,edx
 006BBE63    mov         dword ptr ds:[81F564],edx;gvar_0081F564:THashTable
 006BBE69    call        TObject.Free
 006BBE6E    call        006B7E88
 006BBE73    xor         eax,eax
 006BBE75    pop         edx
 006BBE76    pop         ecx
 006BBE77    pop         ecx
 006BBE78    mov         dword ptr fs:[eax],edx
>006BBE7B    jmp         006BBE98
>006BBE7D    jmp         @HandleOnException
 006BBE82    dd          1
 006BBE86    dd          00418C04;Exception
 006BBE8A    dd          006BBE8E
 006BBE8E    call        004FA644
 006BBE93    call        @DoneExcept
 006BBE98    mov         eax,78BE80;gvar_0078BE80
 006BBE9D    call        @UStrClr
 006BBEA2    xor         eax,eax
 006BBEA4    pop         edx
 006BBEA5    pop         ecx
 006BBEA6    pop         ecx
 006BBEA7    mov         dword ptr fs:[eax],edx
 006BBEAA    push        6BBEB7
 006BBEAF    ret
>006BBEB0    jmp         @HandleFinally
>006BBEB5    jmp         006BBEAF
 006BBEB7    pop         edi
 006BBEB8    pop         esi
 006BBEB9    pop         ebx
 006BBEBA    pop         ebp
 006BBEBB    ret
*}
end.