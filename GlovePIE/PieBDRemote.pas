//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieBDRemote;

interface

uses
  SysUtils, Classes;

type
  TBDRemoteValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//006044AC
    procedure FillClone(c:TExpression);//00604434
    function GetUnits:TUnits;//0060458C
    function GetPerUnits2:TUnits;//0060449C
    function GetPerUnits1:TUnits;//0060448C
    procedure CreateClone;//00604424
    function CanSet:Boolean;//00604420
    function GetDataType:TDataType;//00604454
    procedure SetValue(NewValue:Double);//0060483C
    procedure GetValue;//00604664
    //procedure ToString(?:?);//00604864
  public
    ..............................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//00604864
    procedure GetValue; virtual;//v2C//00604664
    //procedure GetString(?:?); virtual;//v38//006044AC
    function GetDataType:TDataType; virtual;//v44//00604454
    function GetUnits:TUnits; virtual;//v48//0060458C
    function GetPerUnits1:TUnits; virtual;//v4C//0060448C
    function GetPerUnits2:TUnits; virtual;//v50//0060449C
    procedure SetValue(NewValue:Double); virtual;//v58//0060483C
    function CanSet:Boolean; virtual;//v68//00604420
    procedure CreateClone; virtual;//v80//00604424
    procedure FillClone(c:TExpression); virtual;//v84//00604434
  end;
    procedure sub_00603330;//00603330
    procedure sub_00604264;//00604264
    //function sub_006042D4(?:?):?;//006042D4
    //function sub_0060459C(?:?):?;//0060459C
    procedure sub_00604950;//00604950
    procedure sub_00604958;//00604958
    procedure sub_0060495C;//0060495C
    //function sub_006049BC:?;//006049BC
    //function sub_006049C0(?:UnicodeString):?;//006049C0
    //procedure sub_00604A10(?:Integer; ?:?);//00604A10
    //function sub_00604A28:?;//00604A28
    //function sub_00604AA0:?;//00604AA0
    //function sub_00605250(?:?):?;//00605250

implementation

//00603330
procedure sub_00603330;
begin
{*
 00603330    push        ebx
 00603331    mov         ebx,817840;gvar_00817840:THashTable
 00603336    xor         ecx,ecx
 00603338    mov         edx,603968;'num1'
 0060333D    mov         eax,dword ptr [ebx]
 0060333F    call        THashTable.Add
 00603344    xor         ecx,ecx
 00603346    mov         edx,603980;'one'
 0060334B    mov         eax,dword ptr [ebx]
 0060334D    call        THashTable.Add
 00603352    xor         ecx,ecx
 00603354    mov         edx,603994;'1'
 00603359    mov         eax,dword ptr [ebx]
 0060335B    call        THashTable.Add
 00603360    mov         ecx,1
 00603365    mov         edx,6039A4;'num2'
 0060336A    mov         eax,dword ptr [ebx]
 0060336C    call        THashTable.Add
 00603371    mov         ecx,1
 00603376    mov         edx,6039BC;'two'
 0060337B    mov         eax,dword ptr [ebx]
 0060337D    call        THashTable.Add
 00603382    mov         ecx,1
 00603387    mov         edx,6039D0;'2'
 0060338C    mov         eax,dword ptr [ebx]
 0060338E    call        THashTable.Add
 00603393    mov         ecx,2
 00603398    mov         edx,6039E0;'num3'
 0060339D    mov         eax,dword ptr [ebx]
 0060339F    call        THashTable.Add
 006033A4    mov         ecx,2
 006033A9    mov         edx,6039F8;'three'
 006033AE    mov         eax,dword ptr [ebx]
 006033B0    call        THashTable.Add
 006033B5    mov         ecx,2
 006033BA    mov         edx,603A10;'3'
 006033BF    mov         eax,dword ptr [ebx]
 006033C1    call        THashTable.Add
 006033C6    mov         ecx,3
 006033CB    mov         edx,603A20;'num4'
 006033D0    mov         eax,dword ptr [ebx]
 006033D2    call        THashTable.Add
 006033D7    mov         ecx,3
 006033DC    mov         edx,603A38;'four'
 006033E1    mov         eax,dword ptr [ebx]
 006033E3    call        THashTable.Add
 006033E8    mov         ecx,3
 006033ED    mov         edx,603A50;'4'
 006033F2    mov         eax,dword ptr [ebx]
 006033F4    call        THashTable.Add
 006033F9    mov         ecx,4
 006033FE    mov         edx,603A60;'num5'
 00603403    mov         eax,dword ptr [ebx]
 00603405    call        THashTable.Add
 0060340A    mov         ecx,4
 0060340F    mov         edx,603A78;'five'
 00603414    mov         eax,dword ptr [ebx]
 00603416    call        THashTable.Add
 0060341B    mov         ecx,4
 00603420    mov         edx,603A90;'5'
 00603425    mov         eax,dword ptr [ebx]
 00603427    call        THashTable.Add
 0060342C    mov         ecx,5
 00603431    mov         edx,603AA0;'num6'
 00603436    mov         eax,dword ptr [ebx]
 00603438    call        THashTable.Add
 0060343D    mov         ecx,5
 00603442    mov         edx,603AB8;'six'
 00603447    mov         eax,dword ptr [ebx]
 00603449    call        THashTable.Add
 0060344E    mov         ecx,5
 00603453    mov         edx,603ACC;'6'
 00603458    mov         eax,dword ptr [ebx]
 0060345A    call        THashTable.Add
 0060345F    mov         ecx,6
 00603464    mov         edx,603ADC;'num7'
 00603469    mov         eax,dword ptr [ebx]
 0060346B    call        THashTable.Add
 00603470    mov         ecx,6
 00603475    mov         edx,603AF4;'seven'
 0060347A    mov         eax,dword ptr [ebx]
 0060347C    call        THashTable.Add
 00603481    mov         ecx,6
 00603486    mov         edx,603B0C;'7'
 0060348B    mov         eax,dword ptr [ebx]
 0060348D    call        THashTable.Add
 00603492    mov         ecx,7
 00603497    mov         edx,603B1C;'num8'
 0060349C    mov         eax,dword ptr [ebx]
 0060349E    call        THashTable.Add
 006034A3    mov         ecx,7
 006034A8    mov         edx,603B34;'eight'
 006034AD    mov         eax,dword ptr [ebx]
 006034AF    call        THashTable.Add
 006034B4    mov         ecx,7
 006034B9    mov         edx,603B4C;'8'
 006034BE    mov         eax,dword ptr [ebx]
 006034C0    call        THashTable.Add
 006034C5    mov         ecx,8
 006034CA    mov         edx,603B5C;'num9'
 006034CF    mov         eax,dword ptr [ebx]
 006034D1    call        THashTable.Add
 006034D6    mov         ecx,8
 006034DB    mov         edx,603B74;'nine'
 006034E0    mov         eax,dword ptr [ebx]
 006034E2    call        THashTable.Add
 006034E7    mov         ecx,8
 006034EC    mov         edx,603B8C;'9'
 006034F1    mov         eax,dword ptr [ebx]
 006034F3    call        THashTable.Add
 006034F8    mov         ecx,9
 006034FD    mov         edx,603B9C;'num0'
 00603502    mov         eax,dword ptr [ebx]
 00603504    call        THashTable.Add
 00603509    mov         ecx,9
 0060350E    mov         edx,603BB4;'zero'
 00603513    mov         eax,dword ptr [ebx]
 00603515    call        THashTable.Add
 0060351A    mov         ecx,9
 0060351F    mov         edx,603BCC;'0'
 00603524    mov         eax,dword ptr [ebx]
 00603526    call        THashTable.Add
 0060352B    mov         ecx,0B
 00603530    mov         edx,603BDC;'enter'
 00603535    mov         eax,dword ptr [ebx]
 00603537    call        THashTable.Add
 0060353C    mov         ecx,0E
 00603541    mov         edx,603BF4;'return'
 00603546    mov         eax,dword ptr [ebx]
 00603548    call        THashTable.Add
 0060354D    mov         ecx,0F
 00603552    mov         edx,603C10;'clear'
 00603557    mov         eax,dword ptr [ebx]
 00603559    call        THashTable.Add
 0060355E    mov         ecx,16
 00603563    mov         edx,603C28;'eject'
 00603568    mov         eax,dword ptr [ebx]
 0060356A    call        THashTable.Add
 0060356F    mov         ecx,16
 00603574    mov         edx,603C40;'OpenClose'
 00603579    mov         eax,dword ptr [ebx]
 0060357B    call        THashTable.Add
 00603580    mov         ecx,1A
 00603585    mov         edx,603C60;'TopMenu'
 0060358A    mov         eax,dword ptr [ebx]
 0060358C    call        THashTable.Add
 00603591    mov         ecx,28
 00603596    mov         edx,603C7C;'time'
 0060359B    mov         eax,dword ptr [ebx]
 0060359D    call        THashTable.Add
 006035A2    mov         ecx,30
 006035A7    mov         edx,603C94;'prev'
 006035AC    mov         eax,dword ptr [ebx]
 006035AE    call        THashTable.Add
 006035B3    mov         ecx,31
 006035B8    mov         edx,603CAC;'next'
 006035BD    mov         eax,dword ptr [ebx]
 006035BF    call        THashTable.Add
 006035C4    mov         ecx,32
 006035C9    mov         edx,603CC4;'play'
 006035CE    mov         eax,dword ptr [ebx]
 006035D0    call        THashTable.Add
 006035D5    mov         ecx,33
 006035DA    mov         edx,603CDC;'Rewind'
 006035DF    mov         eax,dword ptr [ebx]
 006035E1    call        THashTable.Add
 006035E6    mov         ecx,33
 006035EB    mov         edx,603CF8;'ScanRev'
 006035F0    mov         eax,dword ptr [ebx]
 006035F2    call        THashTable.Add
 006035F7    mov         ecx,34
 006035FC    mov         edx,603D14;'FastForward'
 00603601    mov         eax,dword ptr [ebx]
 00603603    call        THashTable.Add
 00603608    mov         ecx,34
 0060360D    mov         edx,603D38;'FF'
 00603612    mov         eax,dword ptr [ebx]
 00603614    call        THashTable.Add
 00603619    mov         ecx,34
 0060361E    mov         edx,603D4C;'ScanFwd'
 00603623    mov         eax,dword ptr [ebx]
 00603625    call        THashTable.Add
 0060362A    mov         ecx,38
 0060362F    mov         edx,603D68;'stop'
 00603634    mov         eax,dword ptr [ebx]
 00603636    call        THashTable.Add
 0060363B    mov         ecx,39
 00603640    mov         edx,603D80;'pause'
 00603645    mov         eax,dword ptr [ebx]
 00603647    call        THashTable.Add
 0060364C    mov         ecx,40
 00603651    mov         edx,603D98;^'RealLeftStick'
 00603656    mov         eax,dword ptr [ebx]
 00603658    call        THashTable.Add
 0060365D    mov         ecx,40
 00603662    mov         edx,603DB0;'PopupMenu'
 00603667    mov         eax,dword ptr [ebx]
 00603669    call        THashTable.Add
 0060366E    mov         ecx,43
 00603673    mov         edx,603DD0;'PS'
 00603678    mov         eax,dword ptr [ebx]
 0060367A    call        THashTable.Add
 0060367F    mov         ecx,43
 00603684    mov         edx,603DE4;'PlayStation'
 00603689    mov         eax,dword ptr [ebx]
 0060368B    call        THashTable.Add
 00603690    mov         ecx,50
 00603695    mov         edx,603E08;'Select'
 0060369A    mov         eax,dword ptr [ebx]
 0060369C    call        THashTable.Add
 006036A1    mov         ecx,51
 006036A6    mov         edx,603E24;'L3'
 006036AB    mov         eax,dword ptr [ebx]
 006036AD    call        THashTable.Add
 006036B2    mov         ecx,52
 006036B7    mov         edx,603E38;'R3'
 006036BC    mov         eax,dword ptr [ebx]
 006036BE    call        THashTable.Add
 006036C3    mov         ecx,53
 006036C8    mov         edx,603E4C;'Start'
 006036CD    mov         eax,dword ptr [ebx]
 006036CF    call        THashTable.Add
 006036D4    mov         ecx,54
 006036D9    mov         edx,603E64;'Up'
 006036DE    mov         eax,dword ptr [ebx]
 006036E0    call        THashTable.Add
 006036E5    mov         ecx,55
 006036EA    mov         edx,603E78;'Right'
 006036EF    mov         eax,dword ptr [ebx]
 006036F1    call        THashTable.Add
 006036F6    mov         ecx,56
 006036FB    mov         edx,603E90;'Down'
 00603700    mov         eax,dword ptr [ebx]
 00603702    call        THashTable.Add
 00603707    mov         ecx,57
 0060370C    mov         edx,603EA8;'Left'
 00603711    mov         eax,dword ptr [ebx]
 00603713    call        THashTable.Add
 00603718    mov         ecx,58
 0060371D    mov         edx,603EC0;'L2'
 00603722    mov         eax,dword ptr [ebx]
 00603724    call        THashTable.Add
 00603729    mov         ecx,59
 0060372E    mov         edx,603ED4;'R2'
 00603733    mov         eax,dword ptr [ebx]
 00603735    call        THashTable.Add
 0060373A    mov         ecx,5A
 0060373F    mov         edx,603EE8;'L1'
 00603744    mov         eax,dword ptr [ebx]
 00603746    call        THashTable.Add
 0060374B    mov         ecx,5B
 00603750    mov         edx,603EFC;'R1'
 00603755    mov         eax,dword ptr [ebx]
 00603757    call        THashTable.Add
 0060375C    mov         ecx,5C
 00603761    mov         edx,603F10;'Triangle'
 00603766    mov         eax,dword ptr [ebx]
 00603768    call        THashTable.Add
 0060376D    mov         ecx,5C
 00603772    mov         edx,603F30;'Options'
 00603777    mov         eax,dword ptr [ebx]
 00603779    call        THashTable.Add
 0060377E    mov         ecx,5D
 00603783    mov         edx,603F4C;'Circle'
 00603788    mov         eax,dword ptr [ebx]
 0060378A    call        THashTable.Add
 0060378F    mov         ecx,5D
 00603794    mov         edx,603F68;'OButton'
 00603799    mov         eax,dword ptr [ebx]
 0060379B    call        THashTable.Add
 006037A0    mov         ecx,5E
 006037A5    mov         edx,603F84;'Cross'
 006037AA    mov         eax,dword ptr [ebx]
 006037AC    call        THashTable.Add
 006037B1    mov         ecx,5E
 006037B6    mov         edx,603F9C;'XButton'
 006037BB    mov         eax,dword ptr [ebx]
 006037BD    call        THashTable.Add
 006037C2    mov         ecx,5E
 006037C7    mov         edx,603FB8;'Back'
 006037CC    mov         eax,dword ptr [ebx]
 006037CE    call        THashTable.Add
 006037D3    mov         ecx,5F
 006037D8    mov         edx,603FD0;'Square'
 006037DD    mov         eax,dword ptr [ebx]
 006037DF    call        THashTable.Add
 006037E4    mov         ecx,5F
 006037E9    mov         edx,603FEC;'View'
 006037EE    mov         eax,dword ptr [ebx]
 006037F0    call        THashTable.Add
 006037F5    mov         ecx,60
 006037FA    mov         edx,604004;'StepRev'
 006037FF    mov         eax,dword ptr [ebx]
 00603801    call        THashTable.Add
 00603806    mov         ecx,60
 0060380B    mov         edx,604020;'StepBack'
 00603810    mov         eax,dword ptr [ebx]
 00603812    call        THashTable.Add
 00603817    mov         ecx,60
 0060381C    mov         edx,604040;'StepReverse'
 00603821    mov         eax,dword ptr [ebx]
 00603823    call        THashTable.Add
 00603828    mov         ecx,61
 0060382D    mov         edx,604064;'StepFwd'
 00603832    mov         eax,dword ptr [ebx]
 00603834    call        THashTable.Add
 00603839    mov         ecx,61
 0060383E    mov         edx,604080;'StepForward'
 00603843    mov         eax,dword ptr [ebx]
 00603845    call        THashTable.Add
 0060384A    mov         ecx,63
 0060384F    mov         edx,6040A4;'subtitle'
 00603854    mov         eax,dword ptr [ebx]
 00603856    call        THashTable.Add
 0060385B    mov         ecx,64
 00603860    mov         edx,6040C4;'audio'
 00603865    mov         eax,dword ptr [ebx]
 00603867    call        THashTable.Add
 0060386C    mov         ecx,65
 00603871    mov         edx,6040DC;'angle'
 00603876    mov         eax,dword ptr [ebx]
 00603878    call        THashTable.Add
 0060387D    mov         ecx,70
 00603882    mov         edx,6040F4;'display'
 00603887    mov         eax,dword ptr [ebx]
 00603889    call        THashTable.Add
 0060388E    mov         ecx,80
 00603893    mov         edx,604110;'blue'
 00603898    mov         eax,dword ptr [ebx]
 0060389A    call        THashTable.Add
 0060389F    mov         ecx,81
 006038A4    mov         edx,604128;'red'
 006038A9    mov         eax,dword ptr [ebx]
 006038AB    call        THashTable.Add
 006038B0    mov         ecx,82
 006038B5    mov         edx,60413C;'green'
 006038BA    mov         eax,dword ptr [ebx]
 006038BC    call        THashTable.Add
 006038C1    mov         ecx,83
 006038C6    mov         edx,604154;'yellow'
 006038CB    mov         eax,dword ptr [ebx]
 006038CD    call        THashTable.Add
 006038D2    mov         ecx,0FF
 006038D7    mov         edx,604170;'TooManyButtons'
 006038DC    mov         eax,dword ptr [ebx]
 006038DE    call        THashTable.Add
 006038E3    mov         ecx,100
 006038E8    mov         edx,60419C;'Exists'
 006038ED    mov         eax,dword ptr [ebx]
 006038EF    call        THashTable.Add
 006038F4    mov         ecx,101
 006038F9    mov         edx,6041B8;'Count'
 006038FE    mov         eax,dword ptr [ebx]
 00603900    call        THashTable.Add
 00603905    mov         ecx,103
 0060390A    mov         edx,6041D0;'AnyButton'
 0060390F    mov         eax,dword ptr [ebx]
 00603911    call        THashTable.Add
 00603916    mov         ecx,103
 0060391B    mov         edx,6041F0;'Any'
 00603920    mov         eax,dword ptr [ebx]
 00603922    call        THashTable.Add
 00603927    mov         ecx,102
 0060392C    mov         edx,604204;'Button'
 00603931    mov         eax,dword ptr [ebx]
 00603933    call        THashTable.Add
 00603938    mov         ecx,102
 0060393D    mov         edx,604220;'ButtonNumber'
 00603942    mov         eax,dword ptr [ebx]
 00603944    call        THashTable.Add
 00603949    mov         ecx,104
 0060394E    mov         edx,604248;'InByteString'
 00603953    mov         eax,dword ptr [ebx]
 00603955    call        THashTable.Add
 0060395A    pop         ebx
 0060395B    ret
*}
end;

//00604264
procedure sub_00604264;
begin
{*
 00604264    push        ebx
 00604265    push        esi
 00604266    push        edi
 00604267    add         esp,0FFFFFFEC
 0060426A    mov         esi,817988;gvar_00817988:Single
 0060426F    mov         ebx,dword ptr [esi]
 00604271    sar         ebx,1
>00604273    jns         00604278
 00604275    adc         ebx,0
 00604278    test        ebx,ebx
>0060427A    jle         006042CA
 0060427C    mov         edx,1
 00604281    mov         eax,817848;gvar_00817848:TJvHidDevice
 00604286    push        esi
 00604287    mov         esi,eax
 00604289    lea         edi,[esp+4]
 0060428D    movs        dword ptr [edi],dword ptr [esi]
 0060428E    movs        dword ptr [edi],dword ptr [esi]
 0060428F    movs        dword ptr [edi],dword ptr [esi]
 00604290    movs        dword ptr [edi],dword ptr [esi]
 00604291    movs        dword ptr [edi],dword ptr [esi]
 00604292    pop         esi
 00604293    mov         ecx,dword ptr [esi]
 00604295    sub         ecx,edx
 00604297    lea         ecx,[ecx+ecx*4]
 0060429A    push        esi
 0060429B    lea         esi,[ecx*4+817848];gvar_00817848:TJvHidDevice
 006042A2    mov         edi,eax
 006042A4    movs        dword ptr [edi],dword ptr [esi]
 006042A5    movs        dword ptr [edi],dword ptr [esi]
 006042A6    movs        dword ptr [edi],dword ptr [esi]
 006042A7    movs        dword ptr [edi],dword ptr [esi]
 006042A8    movs        dword ptr [edi],dword ptr [esi]
 006042A9    pop         esi
 006042AA    mov         ecx,dword ptr [esi]
 006042AC    sub         ecx,edx
 006042AE    lea         ecx,[ecx+ecx*4]
 006042B1    push        esi
 006042B2    lea         edi,[ecx*4+817848];gvar_00817848:TJvHidDevice
 006042B9    lea         esi,[esp+4]
 006042BD    movs        dword ptr [edi],dword ptr [esi]
 006042BE    movs        dword ptr [edi],dword ptr [esi]
 006042BF    movs        dword ptr [edi],dword ptr [esi]
 006042C0    movs        dword ptr [edi],dword ptr [esi]
 006042C1    movs        dword ptr [edi],dword ptr [esi]
 006042C2    pop         esi
 006042C3    inc         edx
 006042C4    add         eax,14
 006042C7    dec         ebx
>006042C8    jne         00604286
 006042CA    add         esp,14
 006042CD    pop         edi
 006042CE    pop         esi
 006042CF    pop         ebx
 006042D0    ret
*}
end;

//006042D4
{*function sub_006042D4(?:?):?;
begin
 006042D4    push        ebp
 006042D5    mov         ebp,esp
 006042D7    add         esp,0FFFFFFF8
 006042DA    push        ebx
 006042DB    push        esi
 006042DC    push        edi
 006042DD    xor         edx,edx
 006042DF    mov         dword ptr [ebp-8],edx
 006042E2    mov         dword ptr [ebp-4],eax
 006042E5    mov         eax,dword ptr [ebp-4]
 006042E8    call        @UStrAddRef
 006042ED    xor         eax,eax
 006042EF    push        ebp
 006042F0    push        6043A3
 006042F5    push        dword ptr fs:[eax]
 006042F8    mov         dword ptr fs:[eax],esp
 006042FB    xor         ebx,ebx
 006042FD    lea         eax,[ebp-8]
 00604300    mov         edx,dword ptr [ebp-4]
 00604303    call        @UStrLAsg
 00604308    lea         eax,[ebp-8]
 0060430B    mov         edx,6043C0;'BDRemote'
 00604310    call        004F9BD0
 00604315    test        al,al
>00604317    jne         0060433B
 00604319    lea         eax,[ebp-8]
 0060431C    mov         edx,6043E0;'PS3Remote'
 00604321    call        004F9BD0
 00604326    test        al,al
>00604328    jne         0060433B
 0060432A    lea         eax,[ebp-8]
 0060432D    mov         edx,604400;'PS3Mote'
 00604332    call        004F9BD0
 00604337    test        al,al
>00604339    je          00604388
 0060433B    lea         eax,[ebp-8]
 0060433E    call        004F9D00
 00604343    mov         esi,eax
 00604345    lea         eax,[ebp-8]
 00604348    mov         edx,60441C;'.'
 0060434D    call        004F9BD0
 00604352    test        al,al
>00604354    je          00604388
 00604356    mov         eax,dword ptr [ebp-8]
 00604359    call        006049C0
 0060435E    mov         edi,eax
 00604360    test        edi,edi
>00604362    jl          00604388
 00604364    mov         dl,1
 00604366    mov         eax,[00602F8C];TBDRemoteValue
 0060436B    call        TObject.Create;TBDRemoteValue.Create
 00604370    mov         ebx,eax
 00604372    mov         dword ptr [ebx+20],edi;TBDRemoteValue................................Item:Integer
 00604375    test        esi,esi
>00604377    jg          0060437E
 00604379    mov         esi,1
 0060437E    mov         dword ptr [ebx+18],esi;TBDRemoteValue......................................................
 00604381    mov         byte ptr ds:[817844],1;gvar_00817844
 00604388    xor         eax,eax
 0060438A    pop         edx
 0060438B    pop         ecx
 0060438C    pop         ecx
 0060438D    mov         dword ptr fs:[eax],edx
 00604390    push        6043AA
 00604395    lea         eax,[ebp-8]
 00604398    mov         edx,2
 0060439D    call        @UStrArrayClr
 006043A2    ret
>006043A3    jmp         @HandleFinally
>006043A8    jmp         00604395
 006043AA    mov         eax,ebx
 006043AC    pop         edi
 006043AD    pop         esi
 006043AE    pop         ebx
 006043AF    pop         ecx
 006043B0    pop         ecx
 006043B1    pop         ebp
 006043B2    ret
end;*}

//00604420
function TBDRemoteValue.CanSet:Boolean;
begin
{*
 00604420    xor         eax,eax
 00604422    ret
*}
end;

//00604424
procedure TBDRemoteValue.CreateClone;
begin
{*
 00604424    mov         dl,1
 00604426    mov         eax,[00602F8C];TBDRemoteValue
 0060442B    call        TObject.Create;TBDRemoteValue.Create
 00604430    ret
*}
end;

//00604434
procedure TBDRemoteValue.FillClone(c:TExpression);
begin
{*
 00604434    push        ebx
 00604435    push        esi
 00604436    mov         esi,edx
 00604438    mov         ebx,eax
 0060443A    mov         edx,esi
 0060443C    mov         eax,ebx
 0060443E    call        TExpression.FillClone
 00604443    mov         eax,esi
 00604445    mov         edx,dword ptr [ebx+20];TBDRemoteValue.................................Item:Integer
 00604448    mov         dword ptr [eax+20],edx
 0060444B    mov         edx,dword ptr [ebx+18];TBDRemoteValue......................................................
 0060444E    mov         dword ptr [eax+18],edx
 00604451    pop         esi
 00604452    pop         ebx
 00604453    ret
*}
end;

//00604454
function TBDRemoteValue.GetDataType:TDataType;
begin
{*
 00604454    mov         eax,dword ptr [eax+20];TBDRemoteValue..................................Item:Integer
 00604457    cmp         eax,101
>0060445C    jge         00604469
 0060445E    sub         eax,100
>00604463    jb          0060447A
>00604465    je          0060447D
>00604467    jmp         00604486
 00604469    add         eax,0FFFFFEFF
 0060446E    sub         eax,2
>00604471    jb          00604480
>00604473    je          0060447D
 00604475    dec         eax
>00604476    je          00604483
>00604478    jmp         00604486
 0060447A    mov         al,3
 0060447C    ret
 0060447D    mov         al,3
 0060447F    ret
 00604480    mov         al,2
 00604482    ret
 00604483    mov         al,4
 00604485    ret
 00604486    xor         eax,eax
 00604488    ret
*}
end;

//0060448C
function TBDRemoteValue.GetPerUnits1:TUnits;
begin
{*
 0060448C    mov         eax,dword ptr [eax+20];TBDRemoteValue...................................Item:Integer
 0060448F    sub         eax,100
>00604494    jne         00604499
 00604496    xor         eax,eax
 00604498    ret
 00604499    xor         eax,eax
 0060449B    ret
*}
end;

//0060449C
function TBDRemoteValue.GetPerUnits2:TUnits;
begin
{*
 0060449C    mov         eax,dword ptr [eax+20];TBDRemoteValue....................................Item:Integer
 0060449F    sub         eax,100
>006044A4    jne         006044A9
 006044A6    xor         eax,eax
 006044A8    ret
 006044A9    xor         eax,eax
 006044AB    ret
*}
end;

//006044AC
{*procedure TBDRemoteValue.GetString(?:?);
begin
 006044AC    push        ebp
 006044AD    mov         ebp,esp
 006044AF    add         esp,0FFFFFFF8
 006044B2    push        ebx
 006044B3    push        esi
 006044B4    push        edi
 006044B5    xor         ecx,ecx
 006044B7    mov         dword ptr [ebp-4],ecx
 006044BA    mov         esi,edx
 006044BC    mov         ebx,eax
 006044BE    xor         eax,eax
 006044C0    push        ebp
 006044C1    push        60456C
 006044C6    push        dword ptr fs:[eax]
 006044C9    mov         dword ptr fs:[eax],esp
 006044CC    mov         eax,dword ptr [ebx+18];TBDRemoteValue......................................................
 006044CF    cmp         eax,1
>006044D2    jl          006044D9
 006044D4    cmp         eax,10
>006044D7    jle         006044E2
 006044D9    mov         eax,esi
 006044DB    call        @UStrClr
>006044E0    jmp         00604556
 006044E2    lea         eax,[eax+eax*4]
 006044E5    lea         edi,[eax*4+817834];gvar_00817834
 006044EC    mov         eax,dword ptr [ebx+20];TBDRemoteValue.....................................Item:Integer
 006044EF    sub         eax,104
>006044F4    jne         0060454D
 006044F6    mov         eax,esi
 006044F8    call        @UStrClr
 006044FD    xor         ebx,ebx
 006044FF    push        dword ptr [esi]
 00604501    lea         ecx,[ebp-4]
 00604504    movzx       eax,byte ptr [edi+ebx+8]
 00604509    mov         edx,2
 0060450E    call        IntToHex
 00604513    push        dword ptr [ebp-4]
 00604516    push        604588;' '
 0060451B    mov         eax,esi
 0060451D    mov         edx,3
 00604522    call        @UStrCatN
 00604527    inc         ebx
 00604528    cmp         ebx,0C
>0060452B    jne         006044FF
 0060452D    mov         eax,dword ptr [esi]
 0060452F    mov         dword ptr [ebp-8],eax
 00604532    mov         eax,dword ptr [ebp-8]
 00604535    test        eax,eax
>00604537    je          0060453E
 00604539    sub         eax,4
 0060453C    mov         eax,dword ptr [eax]
 0060453E    mov         edx,esi
 00604540    mov         ecx,1
 00604545    xchg        eax,edx
 00604546    call        @UStrDelete
>0060454B    jmp         00604556
 0060454D    mov         edx,esi
 0060454F    mov         eax,ebx
 00604551    call        TExpression.GetString
 00604556    xor         eax,eax
 00604558    pop         edx
 00604559    pop         ecx
 0060455A    pop         ecx
 0060455B    mov         dword ptr fs:[eax],edx
 0060455E    push        604573
 00604563    lea         eax,[ebp-4]
 00604566    call        @UStrClr
 0060456B    ret
>0060456C    jmp         @HandleFinally
>00604571    jmp         00604563
 00604573    pop         edi
 00604574    pop         esi
 00604575    pop         ebx
 00604576    pop         ecx
 00604577    pop         ecx
 00604578    pop         ebp
 00604579    ret
end;*}

//0060458C
function TBDRemoteValue.GetUnits:TUnits;
begin
{*
 0060458C    mov         eax,dword ptr [eax+20];TBDRemoteValue......................................Item:Integer
 0060458F    sub         eax,100
>00604594    jne         00604599
 00604596    xor         eax,eax
 00604598    ret
 00604599    xor         eax,eax
 0060459B    ret
*}
end;

//0060459C
{*function sub_0060459C(?:?):?;
begin
 0060459C    push        ebx
 0060459D    push        esi
 0060459E    push        edi
 0060459F    add         esp,0FFFFFFF8
 006045A2    xor         ebx,ebx
 006045A4    mov         edi,dword ptr ds:[817988];gvar_00817988:Single
 006045AA    test        edi,edi
>006045AC    jle         0060465B
 006045B2    mov         edx,817848;gvar_00817848:TJvHidDevice
 006045B7    mov         esi,edx
 006045B9    mov         ecx,eax
 006045BB    sub         ecx,0B
>006045BE    je          0060461D
 006045C0    sub         ecx,38
>006045C3    je          00604601
 006045C5    add         ecx,0FFFFFFF3
 006045C8    sub         ecx,10
>006045CB    jae         00604639
 006045CD    lea         ecx,[esi+9]
 006045D0    movzx       ecx,word ptr [ecx]
 006045D3    mov         word ptr [esp],cx
 006045D7    test        bl,bl
>006045D9    jne         006045FB
 006045DB    mov         ecx,eax
 006045DD    sub         ecx,50
 006045E0    mov         ebx,1
 006045E5    shl         ebx,cl
 006045E7    movzx       ecx,word ptr [esp]
 006045EB    and         ebx,ecx
>006045ED    jne         006045FB
 006045EF    movzx       ecx,byte ptr [esi+0C]
 006045F3    cmp         eax,ecx
>006045F5    je          006045FB
 006045F7    xor         ecx,ecx
>006045F9    jmp         006045FD
 006045FB    mov         cl,1
 006045FD    mov         ebx,ecx
>006045FF    jmp         0060464D
 00604601    test        bl,bl
>00604603    jne         00604617
 00604605    test        byte ptr [esi+0B],1
>00604609    jne         00604617
 0060460B    movzx       ecx,byte ptr [esi+0C]
 0060460F    cmp         eax,ecx
>00604611    je          00604617
 00604613    xor         ecx,ecx
>00604615    jmp         00604619
 00604617    mov         cl,1
 00604619    mov         ebx,ecx
>0060461B    jmp         0060464D
 0060461D    test        bl,bl
>0060461F    jne         00604633
 00604621    test        byte ptr [esi+0B],8
>00604625    jne         00604633
 00604627    movzx       ecx,byte ptr [esi+0C]
 0060462B    cmp         eax,ecx
>0060462D    je          00604633
 0060462F    xor         ecx,ecx
>00604631    jmp         00604635
 00604633    mov         cl,1
 00604635    mov         ebx,ecx
>00604637    jmp         0060464D
 00604639    test        bl,bl
>0060463B    jne         00604649
 0060463D    movzx       ecx,byte ptr [esi+0C]
 00604641    cmp         eax,ecx
>00604643    je          00604649
 00604645    xor         ecx,ecx
>00604647    jmp         0060464B
 00604649    mov         cl,1
 0060464B    mov         ebx,ecx
 0060464D    test        bl,bl
>0060464F    jne         0060465B
 00604651    add         edx,14
 00604654    dec         edi
>00604655    jne         006045B7
 0060465B    mov         eax,ebx
 0060465D    pop         ecx
 0060465E    pop         edx
 0060465F    pop         edi
 00604660    pop         esi
 00604661    pop         ebx
 00604662    ret
end;*}

//00604664
procedure TBDRemoteValue.GetValue;
begin
{*
 00604664    push        ebx
 00604665    push        esi
 00604666    push        edi
 00604667    add         esp,0FFFFFFF4
 0060466A    cmp         dword ptr [eax+20],101;TBDRemoteValue.......................................Item:Integer
>00604671    jne         00604682
 00604673    fild        dword ptr ds:[817988];gvar_00817988:Single
 00604679    fstp        qword ptr [esp]
 0060467C    wait
>0060467D    jmp         00604830
 00604682    mov         edx,dword ptr [eax+18];TBDRemoteValue......................................................
 00604685    cmp         edx,1
>00604688    jl          0060468F
 0060468A    cmp         edx,10
>0060468D    jle         0060469D
 0060468F    xor         eax,eax
 00604691    mov         dword ptr [esp],eax
 00604694    mov         dword ptr [esp+4],eax
>00604698    jmp         00604830
 0060469D    lea         edx,[edx+edx*4]
 006046A0    lea         edx,[edx*4+817834];gvar_00817834
 006046A7    mov         ecx,dword ptr [eax+20];TBDRemoteValue........................................Item:Intege...
 006046AA    cmp         ecx,100
>006046B0    jg          006046DF
>006046B2    je          006046FA
 006046B4    sub         ecx,0B
>006046B7    je          00604778
 006046BD    sub         ecx,38
>006046C0    je          00604755
 006046C6    add         ecx,0FFFFFFF3
 006046C9    sub         ecx,10
>006046CC    jb          0060471D
 006046CE    sub         ecx,9F
>006046D4    je          006047B0
>006046DA    jmp         0060480D
 006046DF    sub         ecx,101
>006046E5    je          0060470E
 006046E7    dec         ecx
>006046E8    je          006047CD
 006046EE    dec         ecx
>006046EF    je          0060479B
>006046F5    jmp         0060480D
 006046FA    cmp         dword ptr [edx],0
 006046FD    setne       al
 00604700    call        00686074
 00604705    fstp        qword ptr [esp]
 00604708    wait
>00604709    jmp         00604830
 0060470E    fild        dword ptr ds:[817988];gvar_00817988:Single
 00604714    fstp        qword ptr [esp]
 00604717    wait
>00604718    jmp         00604830
 0060471D    lea         ecx,[edx+9]
 00604720    movzx       ebx,word ptr [ecx]
 00604723    mov         esi,dword ptr [eax+20];TBDRemoteValue.........................................Item:Integ...
 00604726    mov         ecx,esi
 00604728    sub         ecx,50
 0060472B    mov         edi,1
 00604730    shl         edi,cl
 00604732    movzx       ecx,bx
 00604735    and         edi,ecx
>00604737    jne         00604745
 00604739    movzx       eax,byte ptr [edx+0C]
 0060473D    cmp         esi,eax
>0060473F    je          00604745
 00604741    xor         eax,eax
>00604743    jmp         00604747
 00604745    mov         al,1
 00604747    call        00686074
 0060474C    fstp        qword ptr [esp]
 0060474F    wait
>00604750    jmp         00604830
 00604755    test        byte ptr [edx+0B],1
>00604759    jne         00604768
 0060475B    movzx       edx,byte ptr [edx+0C]
 0060475F    cmp         edx,dword ptr [eax+20];TBDRemoteValue..........................................Item:Inte...
>00604762    je          00604768
 00604764    xor         eax,eax
>00604766    jmp         0060476A
 00604768    mov         al,1
 0060476A    call        00686074
 0060476F    fstp        qword ptr [esp]
 00604772    wait
>00604773    jmp         00604830
 00604778    test        byte ptr [edx+0B],8
>0060477C    jne         0060478B
 0060477E    movzx       edx,byte ptr [edx+0C]
 00604782    cmp         edx,dword ptr [eax+20];TBDRemoteValue...........................................Item:Int...
>00604785    je          0060478B
 00604787    xor         eax,eax
>00604789    jmp         0060478D
 0060478B    mov         al,1
 0060478D    call        00686074
 00604792    fstp        qword ptr [esp]
 00604795    wait
>00604796    jmp         00604830
 0060479B    cmp         byte ptr [edx+12],0
 0060479F    setne       al
 006047A2    call        00686074
 006047A7    fstp        qword ptr [esp]
 006047AA    wait
>006047AB    jmp         00604830
 006047B0    cmp         byte ptr [edx+12],0
>006047B4    je          006047BC
 006047B6    cmp         byte ptr [edx+0C],0FF
>006047BA    je          006047C0
 006047BC    xor         eax,eax
>006047BE    jmp         006047C2
 006047C0    mov         al,1
 006047C2    call        00686074
 006047C7    fstp        qword ptr [esp]
 006047CA    wait
>006047CB    jmp         00604830
 006047CD    cmp         byte ptr [edx+12],0
>006047D1    je          006047E8
 006047D3    cmp         byte ptr [edx+0C],0FF
>006047D7    jne         006047E8
 006047D9    xor         eax,eax
 006047DB    mov         dword ptr [esp],eax
 006047DE    mov         dword ptr [esp+4],0BFF00000
>006047E6    jmp         00604830
 006047E8    movzx       eax,byte ptr [edx+0C]
 006047EC    cmp         al,0FF
>006047EE    jne         006047FB
 006047F0    xor         eax,eax
 006047F2    mov         dword ptr [esp],eax
 006047F5    mov         dword ptr [esp+4],eax
>006047F9    jmp         00604830
 006047FB    movzx       eax,al
 006047FE    inc         eax
 006047FF    mov         dword ptr [esp+8],eax
 00604803    fild        dword ptr [esp+8]
 00604807    fstp        qword ptr [esp]
 0060480A    wait
>0060480B    jmp         00604830
 0060480D    movzx       ecx,byte ptr [edx+0C]
 00604811    cmp         ecx,dword ptr [eax+20]
>00604814    jne         00604821
 00604816    cmp         dword ptr [edx],0
>00604819    je          00604821
 0060481B    cmp         byte ptr [edx+12],0
>0060481F    jne         00604825
 00604821    xor         eax,eax
>00604823    jmp         00604827
 00604825    mov         al,1
 00604827    call        00686074
 0060482C    fstp        qword ptr [esp]
 0060482F    wait
 00604830    fld         qword ptr [esp]
 00604833    add         esp,0C
 00604836    pop         edi
 00604837    pop         esi
 00604838    pop         ebx
 00604839    ret
*}
end;

//0060483C
procedure TBDRemoteValue.SetValue(NewValue:Double);
begin
{*
 0060483C    push        ebp
 0060483D    mov         ebp,esp
 0060483F    mov         edx,dword ptr [eax+18];TBDRemoteValue......................................................
 00604842    cmp         edx,1
>00604845    jl          0060484C
 00604847    cmp         edx,10
>0060484A    jle         00604850
 0060484C    xor         eax,eax
>0060484E    jmp         00604860
 00604850    mov         eax,dword ptr [eax+20];TBDRemoteValue............................................Item:In...
 00604853    sub         eax,100
>00604858    jne         0060485E
 0060485A    xor         eax,eax
>0060485C    jmp         00604860
 0060485E    xor         eax,eax
 00604860    pop         ebp
 00604861    ret         8
*}
end;

//00604864
{*procedure TBDRemoteValue.ToString(?:?);
begin
 00604864    push        ebp
 00604865    mov         ebp,esp
 00604867    push        0
 00604869    push        0
 0060486B    push        0
 0060486D    push        ebx
 0060486E    push        esi
 0060486F    push        edi
 00604870    mov         esi,edx
 00604872    mov         ebx,eax
 00604874    xor         eax,eax
 00604876    push        ebp
 00604877    push        6048F1
 0060487C    push        dword ptr fs:[eax]
 0060487F    mov         dword ptr fs:[eax],esp
 00604882    mov         edi,dword ptr [ebx+18];TBDRemoteValue......................................................
 00604885    test        edi,edi
>00604887    jle         006048BC
 00604889    push        60490C;'BDRemote'
 0060488E    lea         edx,[ebp-4]
 00604891    mov         eax,edi
 00604893    call        IntToStr
 00604898    push        dword ptr [ebp-4]
 0060489B    push        60492C;'.'
 006048A0    lea         edx,[ebp-8]
 006048A3    mov         eax,dword ptr [ebx+20];TBDRemoteValue.............................................Item:I...
 006048A6    call        00604A10
 006048AB    push        dword ptr [ebp-8]
 006048AE    mov         eax,esi
 006048B0    mov         edx,4
 006048B5    call        @UStrCatN
>006048BA    jmp         006048D6
 006048BC    lea         edx,[ebp-0C]
 006048BF    mov         eax,dword ptr [ebx+20];TBDRemoteValue..............................................Item:...
 006048C2    call        00604A10
 006048C7    mov         ecx,dword ptr [ebp-0C]
 006048CA    mov         eax,esi
 006048CC    mov         edx,60493C;'BDRemote.'
 006048D1    call        @UStrCat3
 006048D6    xor         eax,eax
 006048D8    pop         edx
 006048D9    pop         ecx
 006048DA    pop         ecx
 006048DB    mov         dword ptr fs:[eax],edx
 006048DE    push        6048F8
 006048E3    lea         eax,[ebp-0C]
 006048E6    mov         edx,3
 006048EB    call        @UStrArrayClr
 006048F0    ret
>006048F1    jmp         @HandleFinally
>006048F6    jmp         006048E3
 006048F8    pop         edi
 006048F9    pop         esi
 006048FA    pop         ebx
 006048FB    mov         esp,ebp
 006048FD    pop         ebp
 006048FE    ret
end;*}

//00604950
procedure sub_00604950;
begin
{*
 00604950    mov         byte ptr ds:[817844],0;gvar_00817844
 00604957    ret
*}
end;

//00604958
procedure sub_00604958;
begin
{*
 00604958    ret
*}
end;

//0060495C
procedure sub_0060495C;
begin
{*
 0060495C    push        ebx
 0060495D    push        esi
 0060495E    movzx       eax,byte ptr ds:[817844];gvar_00817844
 00604965    and         al,byte ptr ds:[817845];gvar_00817845
>0060496B    je          006049B7
 0060496D    mov         esi,dword ptr ds:[817988];gvar_00817988:Single
 00604973    test        esi,esi
>00604975    jle         006049B0
 00604977    mov         ebx,817848;gvar_00817848:TJvHidDevice
 0060497C    mov         eax,dword ptr [ebx]
 0060497E    test        eax,eax
>00604980    je          0060499F
 00604982    push        0
 00604984    push        0
 00604986    call        005DF390
 0060498B    mov         edx,ebx
 0060498D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00604992    mov         eax,dword ptr [eax]
 00604994    mov         eax,dword ptr [eax+580]
 0060499A    call        TJvHidDeviceController.CheckIn
 0060499F    xor         eax,eax
 006049A1    mov         dword ptr [ebx],eax
 006049A3    mov         byte ptr ds:[817845],0;gvar_00817845
 006049AA    add         ebx,14
 006049AD    dec         esi
>006049AE    jne         0060497C
 006049B0    xor         eax,eax
 006049B2    mov         [00817988],eax;gvar_00817988:Single
 006049B7    pop         esi
 006049B8    pop         ebx
 006049B9    ret
*}
end;

//006049BC
{*function sub_006049BC:?;
begin
 006049BC    mov         al,1
 006049BE    ret
end;*}

//006049C0
{*function sub_006049C0(?:UnicodeString):?;
begin
 006049C0    push        ebp
 006049C1    mov         ebp,esp
 006049C3    push        ecx
 006049C4    push        ebx
 006049C5    mov         dword ptr [ebp-4],eax
 006049C8    mov         eax,dword ptr [ebp-4]
 006049CB    call        @UStrAddRef
 006049D0    xor         eax,eax
 006049D2    push        ebp
 006049D3    push        604A03
 006049D8    push        dword ptr fs:[eax]
 006049DB    mov         dword ptr fs:[eax],esp
 006049DE    mov         edx,dword ptr [ebp-4]
 006049E1    mov         eax,[00817840];gvar_00817840:THashTable
 006049E6    call        THashTable.Get
 006049EB    mov         ebx,eax
 006049ED    xor         eax,eax
 006049EF    pop         edx
 006049F0    pop         ecx
 006049F1    pop         ecx
 006049F2    mov         dword ptr fs:[eax],edx
 006049F5    push        604A0A
 006049FA    lea         eax,[ebp-4]
 006049FD    call        @UStrClr
 00604A02    ret
>00604A03    jmp         @HandleFinally
>00604A08    jmp         006049FA
 00604A0A    mov         eax,ebx
 00604A0C    pop         ebx
 00604A0D    pop         ecx
 00604A0E    pop         ebp
 00604A0F    ret
end;*}

//00604A10
{*procedure sub_00604A10(?:Integer; ?:?);
begin
 00604A10    push        ebx
 00604A11    push        esi
 00604A12    mov         esi,edx
 00604A14    mov         ebx,eax
 00604A16    mov         ecx,esi
 00604A18    mov         edx,ebx
 00604A1A    mov         eax,[00817840];gvar_00817840:THashTable
 00604A1F    call        THashTable.Get
 00604A24    pop         esi
 00604A25    pop         ebx
 00604A26    ret
end;*}

//00604A28
{*function sub_00604A28:?;
begin
 00604A28    push        ebp
 00604A29    mov         ebp,esp
 00604A2B    push        0
 00604A2D    push        ebx
 00604A2E    push        esi
 00604A2F    xor         eax,eax
 00604A31    push        ebp
 00604A32    push        604A8F
 00604A37    push        dword ptr fs:[eax]
 00604A3A    mov         dword ptr fs:[eax],esp
 00604A3D    mov         dl,1
 00604A3F    mov         eax,[0043C7BC];TStringList
 00604A44    call        TStringList.Create;TStringList.Create
 00604A49    mov         esi,eax
 00604A4B    mov         dl,1
 00604A4D    mov         eax,esi
 00604A4F    call        TStringList.SetSorted
 00604A54    xor         ebx,ebx
 00604A56    lea         edx,[ebp-4]
 00604A59    mov         eax,ebx
 00604A5B    call        00604A10
 00604A60    cmp         dword ptr [ebp-4],0
>00604A64    je          00604A70
 00604A66    mov         edx,dword ptr [ebp-4]
 00604A69    mov         eax,esi
 00604A6B    mov         ecx,dword ptr [eax]
 00604A6D    call        dword ptr [ecx+38];TStringList.Add
 00604A70    inc         ebx
 00604A71    cmp         ebx,105
>00604A77    jne         00604A56
 00604A79    xor         eax,eax
 00604A7B    pop         edx
 00604A7C    pop         ecx
 00604A7D    pop         ecx
 00604A7E    mov         dword ptr fs:[eax],edx
 00604A81    push        604A96
 00604A86    lea         eax,[ebp-4]
 00604A89    call        @UStrClr
 00604A8E    ret
>00604A8F    jmp         @HandleFinally
>00604A94    jmp         00604A86
 00604A96    mov         eax,esi
 00604A98    pop         esi
 00604A99    pop         ebx
 00604A9A    pop         ecx
 00604A9B    pop         ebp
 00604A9C    ret
end;*}

//00604AA0
{*function sub_00604AA0:?;
begin
 00604AA0    push        ebx
 00604AA1    mov         dl,1
 00604AA3    mov         eax,[0043C7BC];TStringList
 00604AA8    call        TStringList.Create;TStringList.Create
 00604AAD    mov         ebx,eax
 00604AAF    mov         edx,604D3C;'Any'
 00604AB4    mov         eax,ebx
 00604AB6    mov         ecx,dword ptr [eax]
 00604AB8    call        dword ptr [ecx+38];TStringList.Add
 00604ABB    mov         edx,604D50;'TooManyButtons'
 00604AC0    mov         eax,ebx
 00604AC2    mov         ecx,dword ptr [eax]
 00604AC4    call        dword ptr [ecx+38];TStringList.Add
 00604AC7    mov         edx,604D7C;'num1'
 00604ACC    mov         eax,ebx
 00604ACE    mov         ecx,dword ptr [eax]
 00604AD0    call        dword ptr [ecx+38];TStringList.Add
 00604AD3    mov         edx,604D94;'num2'
 00604AD8    mov         eax,ebx
 00604ADA    mov         ecx,dword ptr [eax]
 00604ADC    call        dword ptr [ecx+38];TStringList.Add
 00604ADF    mov         edx,604DAC;'num3'
 00604AE4    mov         eax,ebx
 00604AE6    mov         ecx,dword ptr [eax]
 00604AE8    call        dword ptr [ecx+38];TStringList.Add
 00604AEB    mov         edx,604DC4;'num4'
 00604AF0    mov         eax,ebx
 00604AF2    mov         ecx,dword ptr [eax]
 00604AF4    call        dword ptr [ecx+38];TStringList.Add
 00604AF7    mov         edx,604DDC;'num5'
 00604AFC    mov         eax,ebx
 00604AFE    mov         ecx,dword ptr [eax]
 00604B00    call        dword ptr [ecx+38];TStringList.Add
 00604B03    mov         edx,604DF4;'num6'
 00604B08    mov         eax,ebx
 00604B0A    mov         ecx,dword ptr [eax]
 00604B0C    call        dword ptr [ecx+38];TStringList.Add
 00604B0F    mov         edx,604E0C;'num7'
 00604B14    mov         eax,ebx
 00604B16    mov         ecx,dword ptr [eax]
 00604B18    call        dword ptr [ecx+38];TStringList.Add
 00604B1B    mov         edx,604E24;'num8'
 00604B20    mov         eax,ebx
 00604B22    mov         ecx,dword ptr [eax]
 00604B24    call        dword ptr [ecx+38];TStringList.Add
 00604B27    mov         edx,604E3C;'num9'
 00604B2C    mov         eax,ebx
 00604B2E    mov         ecx,dword ptr [eax]
 00604B30    call        dword ptr [ecx+38];TStringList.Add
 00604B33    mov         edx,604E54;'num0'
 00604B38    mov         eax,ebx
 00604B3A    mov         ecx,dword ptr [eax]
 00604B3C    call        dword ptr [ecx+38];TStringList.Add
 00604B3F    mov         edx,604E6C;'enter'
 00604B44    mov         eax,ebx
 00604B46    mov         ecx,dword ptr [eax]
 00604B48    call        dword ptr [ecx+38];TStringList.Add
 00604B4B    mov         edx,604E84;'return'
 00604B50    mov         eax,ebx
 00604B52    mov         ecx,dword ptr [eax]
 00604B54    call        dword ptr [ecx+38];TStringList.Add
 00604B57    mov         edx,604EA0;'clear'
 00604B5C    mov         eax,ebx
 00604B5E    mov         ecx,dword ptr [eax]
 00604B60    call        dword ptr [ecx+38];TStringList.Add
 00604B63    mov         edx,604EB8;'eject'
 00604B68    mov         eax,ebx
 00604B6A    mov         ecx,dword ptr [eax]
 00604B6C    call        dword ptr [ecx+38];TStringList.Add
 00604B6F    mov         edx,604ED0;'TopMenu'
 00604B74    mov         eax,ebx
 00604B76    mov         ecx,dword ptr [eax]
 00604B78    call        dword ptr [ecx+38];TStringList.Add
 00604B7B    mov         edx,604EEC;'time'
 00604B80    mov         eax,ebx
 00604B82    mov         ecx,dword ptr [eax]
 00604B84    call        dword ptr [ecx+38];TStringList.Add
 00604B87    mov         edx,604F04;'prev'
 00604B8C    mov         eax,ebx
 00604B8E    mov         ecx,dword ptr [eax]
 00604B90    call        dword ptr [ecx+38];TStringList.Add
 00604B93    mov         edx,604F1C;'next'
 00604B98    mov         eax,ebx
 00604B9A    mov         ecx,dword ptr [eax]
 00604B9C    call        dword ptr [ecx+38];TStringList.Add
 00604B9F    mov         edx,604F34;'play'
 00604BA4    mov         eax,ebx
 00604BA6    mov         ecx,dword ptr [eax]
 00604BA8    call        dword ptr [ecx+38];TStringList.Add
 00604BAB    mov         edx,604F4C;'ScanRev'
 00604BB0    mov         eax,ebx
 00604BB2    mov         ecx,dword ptr [eax]
 00604BB4    call        dword ptr [ecx+38];TStringList.Add
 00604BB7    mov         edx,604F68;'ScanFwd'
 00604BBC    mov         eax,ebx
 00604BBE    mov         ecx,dword ptr [eax]
 00604BC0    call        dword ptr [ecx+38];TStringList.Add
 00604BC3    mov         edx,604F84;'stop'
 00604BC8    mov         eax,ebx
 00604BCA    mov         ecx,dword ptr [eax]
 00604BCC    call        dword ptr [ecx+38];TStringList.Add
 00604BCF    mov         edx,604F9C;'pause'
 00604BD4    mov         eax,ebx
 00604BD6    mov         ecx,dword ptr [eax]
 00604BD8    call        dword ptr [ecx+38];TStringList.Add
 00604BDB    mov         edx,604FB4;^'RealLeftStick'
 00604BE0    mov         eax,ebx
 00604BE2    mov         ecx,dword ptr [eax]
 00604BE4    call        dword ptr [ecx+38];TStringList.Add
 00604BE7    mov         edx,604FCC;'ps'
 00604BEC    mov         eax,ebx
 00604BEE    mov         ecx,dword ptr [eax]
 00604BF0    call        dword ptr [ecx+38];TStringList.Add
 00604BF3    mov         edx,604FE0;'Select'
 00604BF8    mov         eax,ebx
 00604BFA    mov         ecx,dword ptr [eax]
 00604BFC    call        dword ptr [ecx+38];TStringList.Add
 00604BFF    mov         edx,604FFC;'L3'
 00604C04    mov         eax,ebx
 00604C06    mov         ecx,dword ptr [eax]
 00604C08    call        dword ptr [ecx+38];TStringList.Add
 00604C0B    mov         edx,605010;'R3'
 00604C10    mov         eax,ebx
 00604C12    mov         ecx,dword ptr [eax]
 00604C14    call        dword ptr [ecx+38];TStringList.Add
 00604C17    mov         edx,605024;'Start'
 00604C1C    mov         eax,ebx
 00604C1E    mov         ecx,dword ptr [eax]
 00604C20    call        dword ptr [ecx+38];TStringList.Add
 00604C23    mov         edx,60503C;'Up'
 00604C28    mov         eax,ebx
 00604C2A    mov         ecx,dword ptr [eax]
 00604C2C    call        dword ptr [ecx+38];TStringList.Add
 00604C2F    mov         edx,605050;'Right'
 00604C34    mov         eax,ebx
 00604C36    mov         ecx,dword ptr [eax]
 00604C38    call        dword ptr [ecx+38];TStringList.Add
 00604C3B    mov         edx,605068;'Down'
 00604C40    mov         eax,ebx
 00604C42    mov         ecx,dword ptr [eax]
 00604C44    call        dword ptr [ecx+38];TStringList.Add
 00604C47    mov         edx,605080;'Left'
 00604C4C    mov         eax,ebx
 00604C4E    mov         ecx,dword ptr [eax]
 00604C50    call        dword ptr [ecx+38];TStringList.Add
 00604C53    mov         edx,605098;'L2'
 00604C58    mov         eax,ebx
 00604C5A    mov         ecx,dword ptr [eax]
 00604C5C    call        dword ptr [ecx+38];TStringList.Add
 00604C5F    mov         edx,6050AC;'R2'
 00604C64    mov         eax,ebx
 00604C66    mov         ecx,dword ptr [eax]
 00604C68    call        dword ptr [ecx+38];TStringList.Add
 00604C6B    mov         edx,6050C0;'L1'
 00604C70    mov         eax,ebx
 00604C72    mov         ecx,dword ptr [eax]
 00604C74    call        dword ptr [ecx+38];TStringList.Add
 00604C77    mov         edx,6050D4;'R1'
 00604C7C    mov         eax,ebx
 00604C7E    mov         ecx,dword ptr [eax]
 00604C80    call        dword ptr [ecx+38];TStringList.Add
 00604C83    mov         edx,6050E8;'Triangle'
 00604C88    mov         eax,ebx
 00604C8A    mov         ecx,dword ptr [eax]
 00604C8C    call        dword ptr [ecx+38];TStringList.Add
 00604C8F    mov         edx,605108;'Circle'
 00604C94    mov         eax,ebx
 00604C96    mov         ecx,dword ptr [eax]
 00604C98    call        dword ptr [ecx+38];TStringList.Add
 00604C9B    mov         edx,605124;'Cross'
 00604CA0    mov         eax,ebx
 00604CA2    mov         ecx,dword ptr [eax]
 00604CA4    call        dword ptr [ecx+38];TStringList.Add
 00604CA7    mov         edx,60513C;'Square'
 00604CAC    mov         eax,ebx
 00604CAE    mov         ecx,dword ptr [eax]
 00604CB0    call        dword ptr [ecx+38];TStringList.Add
 00604CB3    mov         edx,605158;'StepRev'
 00604CB8    mov         eax,ebx
 00604CBA    mov         ecx,dword ptr [eax]
 00604CBC    call        dword ptr [ecx+38];TStringList.Add
 00604CBF    mov         edx,605174;'StepFwd'
 00604CC4    mov         eax,ebx
 00604CC6    mov         ecx,dword ptr [eax]
 00604CC8    call        dword ptr [ecx+38];TStringList.Add
 00604CCB    mov         edx,605190;'subtitle'
 00604CD0    mov         eax,ebx
 00604CD2    mov         ecx,dword ptr [eax]
 00604CD4    call        dword ptr [ecx+38];TStringList.Add
 00604CD7    mov         edx,6051B0;'audio'
 00604CDC    mov         eax,ebx
 00604CDE    mov         ecx,dword ptr [eax]
 00604CE0    call        dword ptr [ecx+38];TStringList.Add
 00604CE3    mov         edx,6051C8;'angle'
 00604CE8    mov         eax,ebx
 00604CEA    mov         ecx,dword ptr [eax]
 00604CEC    call        dword ptr [ecx+38];TStringList.Add
 00604CEF    mov         edx,6051E0;'display'
 00604CF4    mov         eax,ebx
 00604CF6    mov         ecx,dword ptr [eax]
 00604CF8    call        dword ptr [ecx+38];TStringList.Add
 00604CFB    mov         edx,6051FC;'blue'
 00604D00    mov         eax,ebx
 00604D02    mov         ecx,dword ptr [eax]
 00604D04    call        dword ptr [ecx+38];TStringList.Add
 00604D07    mov         edx,605214;'red'
 00604D0C    mov         eax,ebx
 00604D0E    mov         ecx,dword ptr [eax]
 00604D10    call        dword ptr [ecx+38];TStringList.Add
 00604D13    mov         edx,605228;'green'
 00604D18    mov         eax,ebx
 00604D1A    mov         ecx,dword ptr [eax]
 00604D1C    call        dword ptr [ecx+38];TStringList.Add
 00604D1F    mov         edx,605240;'yellow'
 00604D24    mov         eax,ebx
 00604D26    mov         ecx,dword ptr [eax]
 00604D28    call        dword ptr [ecx+38];TStringList.Add
 00604D2B    mov         eax,ebx
 00604D2D    pop         ebx
 00604D2E    ret
end;*}

//00605250
{*function sub_00605250(?:?):?;
begin
 00605250    push        ebp
 00605251    mov         ebp,esp
 00605253    push        ecx
 00605254    push        ebx
 00605255    mov         dword ptr [ebp-4],eax
 00605258    mov         eax,dword ptr [ebp-4]
 0060525B    call        @UStrAddRef
 00605260    xor         eax,eax
 00605262    push        ebp
 00605263    push        6052DA
 00605268    push        dword ptr fs:[eax]
 0060526B    mov         dword ptr fs:[eax],esp
 0060526E    lea         eax,[ebp-4]
 00605271    mov         edx,6052F4;'BDRemote'
 00605276    call        004F9BD0
 0060527B    test        al,al
>0060527D    jne         006052A5
 0060527F    lea         eax,[ebp-4]
 00605282    mov         edx,605314;'PS3Remote'
 00605287    call        004F9BD0
 0060528C    test        al,al
>0060528E    jne         006052A5
 00605290    lea         eax,[ebp-4]
 00605293    mov         edx,605334;'PS3Mote'
 00605298    call        004F9BD0
 0060529D    test        al,al
>0060529F    jne         006052A5
 006052A1    xor         ebx,ebx
>006052A3    jmp         006052C4
 006052A5    lea         eax,[ebp-4]
 006052A8    call        004F9D00
 006052AD    lea         eax,[ebp-4]
 006052B0    mov         edx,605350;'.'
 006052B5    call        004F9BD0
 006052BA    test        al,al
>006052BC    jne         006052C2
 006052BE    xor         ebx,ebx
>006052C0    jmp         006052C4
 006052C2    mov         bl,1
 006052C4    xor         eax,eax
 006052C6    pop         edx
 006052C7    pop         ecx
 006052C8    pop         ecx
 006052C9    mov         dword ptr fs:[eax],edx
 006052CC    push        6052E1
 006052D1    lea         eax,[ebp-4]
 006052D4    call        @UStrClr
 006052D9    ret
>006052DA    jmp         @HandleFinally
>006052DF    jmp         006052D1
 006052E1    mov         eax,ebx
 006052E3    pop         ebx
 006052E4    pop         ecx
 006052E5    pop         ebp
 006052E6    ret
end;*}

Initialization
//00781BB4
{*
 00781BB4    sub         dword ptr ds:[81798C],1
>00781BBB    jae         00781BD3
 00781BBD    mov         dl,1
 00781BBF    mov         eax,[0067D4A4];THashTable
 00781BC4    call        THashTable.Create;THashTable.Create
 00781BC9    mov         [00817840],eax;gvar_00817840:THashTable
 00781BCE    call        00603330
 00781BD3    ret
*}
Finalization
end.