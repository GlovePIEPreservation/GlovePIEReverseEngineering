//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieWiimote;

interface

uses
  SysUtils, Classes;

type
  TWiimoteOldValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//0060D2A4
    function GetUnits:TUnits;//0060D674
    //procedure GetString(?:?);//0060D4B4
    procedure GetRotMat(m:TRotMat);//0060D310
    procedure GetVector(x:Double; y:Double; z:Double);//00610100
    function GetPerUnits2:TUnits;//0060D2E4
    procedure FillClone(c:TExpression);//0060CEAC
    //function SetValue(NewValue:Double; ?:?):Boolean;//00610E14
    function CanSet:Boolean;//0060CE54
    function GetDataType:TDataType;//0060CECC
    procedure CreateClone;//0060CE9C
    procedure GetValue;//0060D704
    //procedure ToString(?:?);//00611B34
  public
    ................................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//00611B34
    procedure GetValue; virtual;//v2C//0060D704
    //procedure GetString(?:?); virtual;//v38//0060D4B4
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//00610100
    procedure GetRotMat(m:TRotMat); virtual;//v40//0060D310
    function GetDataType:TDataType; virtual;//v44//0060CECC
    function GetUnits:TUnits; virtual;//v48//0060D674
    function GetPerUnits1:TUnits; virtual;//v4C//0060D2A4
    function GetPerUnits2:TUnits; virtual;//v50//0060D2E4
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//00610E14
    function CanSet:Boolean; virtual;//v68//0060CE54
    procedure CreateClone; virtual;//v80//0060CE9C
    procedure FillClone(c:TExpression); virtual;//v84//0060CEAC
  end;
  TNunchukOldState = TNunchukOldState = record//size=98
RawForceX:Double;//f0
RawForceY:Double;//f8
RawForceZ:Double;//f10
cyx:Double;//f18
cxy:Double;//f20
cxz:Double;//f28
cxx:Double;//f30
cyy:Double;//f38
czz:Double;//f40
JoyX:SmallInt;//f48
JoyY:SmallInt;//f4A
JoyZeroX:SmallInt;//f4C
JoyZeroY:SmallInt;//f4E
JoyMaxX:SmallInt;//f50
JoyMaxY:SmallInt;//f52
JoyMinX:SmallInt;//f54
JoyMinY:SmallInt;//f56
ButtonC:Boolean;//f58
ButtonZ:Boolean;//f59
gx:Single;//f5C
gy:Single;//f60
gz:Single;//f64
upx:Single;//f68
upy:Single;//f6C
upz:Single;//f70
pitch:Single;//f74
roll:Single;//f78
SmoothPitch:Single;//f7C
SmoothRoll:Single;//f80
Bytes:?;//f84
end;;
  TClassicOldState = TClassicOldState = record//size=36
Joy1X:SmallInt;//f0
Joy1Y:SmallInt;//f2
Joy1ZeroX:SmallInt;//f4
Joy1ZeroY:SmallInt;//f6
Joy1MinX:SmallInt;//f8
Joy1MinY:SmallInt;//fA
Joy1MaxX:SmallInt;//fC
Joy1MaxY:SmallInt;//fE
Joy2X:SmallInt;//f10
Joy2Y:SmallInt;//f12
Joy2ZeroX:SmallInt;//f14
Joy2ZeroY:SmallInt;//f16
Joy2MinX:SmallInt;//f18
Joy2MinY:SmallInt;//f1A
Joy2MaxX:SmallInt;//f1C
Joy2MaxY:SmallInt;//f1E
L:SmallInt;//f20
R:SmallInt;//f22
Buttons:Word;//f24
Bytes:?;//f26
end;;
  TFitOldState = TFitOldState = record//size=50
Calib:?;//f0
Bytes:?;//f18
WeightTopRight:Double;//f28
WeightTopLeft:Double;//f30
WeightBottomRight:Double;//f38
WeightBottomLeft:Double;//f40
QuestionQuestion:Word;//f48
EE:Byte;//f4A
end;;
  TSixaxisOldState = TSixaxisOldState = record//size=1C
f8:string;//f8
end;
Dev:TJvHidDevice;//f0
hEvent:Cardinal;//f4
Serial:string;//f8
Written:Cardinal;//fC
InByteCount:Cardinal;//f10
SampleRate:Integer;//f14
WriteSuccess:Boolean;//f18
ReadSuccess:Boolean;//f19
HungWrite:Boolean;//f1A
end;;
  TWiimoteOldState = TWiimoteOldState = record//size=5D0
fC:string;//fC
end;
Dev:TJvHidDevice;//f0
hEvent:Cardinal;//f4
UseSetOutputReport:Boolean;//f8
WriteMethodConfirmed:Boolean;//f9
UseGetInputReport:Boolean;//fA
ReadMethodConfirmed:Boolean;//fB
Serial:string;//fC
Written:Cardinal;//f10
InByteCount:Cardinal;//f14
SampleRate:Integer;//f18
WriteSuccess:Boolean;//f1C
ReadSuccess:Boolean;//f1D
HungWrite:Boolean;//f1E
Channel:Byte;//f1F
Volume:Byte;//f20
OutReport11:Byte;//f21
OutReport13:Byte;//f22
OutReport14:Byte;//f23
OutReport15:Byte;//f24
OutReport19:Byte;//f25
OutReport1A:Byte;//f26
Rumble:Boolean;//f27
UseBuiltInCalibration:Boolean;//f28
SpeakerEnabled:Boolean;//f29
Muted:Boolean;//f2A
NeedsCalib:Boolean;//f2B
Leds:Byte;//f2C
NeedCalibTime:Double;//f30
RawForceX:Double;//f38
RawForceY:Double;//f40
RawForceZ:Double;//f48
cxx:Double;//f50
cxy:Double;//f58
cxz:Double;//f60
cyx:Double;//f68
cyy:Double;//f70
cyz:Double;//f78
czx:Double;//f80
czy:Double;//f88
czz:Double;//f90
Buttons:Word;//f98
AlreadyDecoded:Boolean;//f9A
State:Byte;//f9B
Expansion:Byte;//f9C
Expansion2:Byte;//f9D
Battery:Byte;//f9E
InByte:?;//f9F
Dots:?;//fB5
Acc:TAccelerometers;//fE8
gx:Double;//fF0
gy:Double;//fF8
gz:Double;//f100
gnx:Double;//f108
gny:Double;//f110
gnz:Double;//f118
UpX:Double;//f120
UpY:Double;//f128
UpZ:Double;//f130
PrevUpX:Double;//f138
PrevUpY:Double;//f140
PrevUpZ:Double;//f148
ReportTimeStamp:Double;//f150
vx:Double;//f158
vy:Double;//f160
vz:Double;//f168
x:Double;//f170
y:Double;//f178
z:Double;//f180
VarDot1x:Double;//f188
VarDot1y:Double;//f190
VarDot2x:Double;//f198
VarDot2y:Double;//f1A0
VarLeftDotX:Double;//f1A8
VarLeftDotY:Double;//f1B0
VarRightDotX:Double;//f1B8
VarRightDotY:Double;//f1C0
VarMiddleDotX:Double;//f1C8
VarMiddleDotY:Double;//f1D0
varWiimoteYawNoX:Double;//f1D8
varWiimoteXNoYaw:Double;//f1E0
varWiimoteY:Double;//f1E8
varWiimoteZ:Double;//f1F0
VarDotDeltaX:Double;//f1F8
VarDotDeltaY:Double;//f200
VarDotSep:Double;//f208
VarIRDistance:Double;//f210
SinOfRoll:Double;//f218
CosOfRoll:Double;//f220
VarTotalPitch:Double;//f228
VarDotYaw:Double;//f230
varIRPitchY:Double;//f238
varIRx:Double;//f240
varIRy:Double;//f248
varLen:Double;//f250
VarLeftDot:Integer;//f258
VarLeftDotVis:Boolean;//f25C
VarRightDotVis:Boolean;//f25D
VarMiddleDotVis:Boolean;//f25E
VarIRvis:Boolean;//f25F
VarIROnScreen:Boolean;//f260
varIRTooFarLeft:Boolean;//f261
varIRTooFarRight:Boolean;//f262
varIRTooFarUp:Boolean;//f263
varIRTooFarDown:Boolean;//f264
Frequency:Double;//f268
Phase:Double;//f270
PerSample:Double;//f278
BladeFXDisconnectTime:Double;//f280
Nunchuk:TNunchukOldState;//f288
Classic:TClassicOldState;//f320
Fit:TFitOldState;//f358
ExpBytes:?;//f3A8
IRXSmoother:TSmoother;//f3C0
IRYSmoother:TSmoother;//f4C8
end;;
    //procedure sub_00606698(?:?; ?:?; ?:?);//00606698
    //procedure sub_00607AEC(?:?; ?:?; ?:?);//00607AEC
    //procedure sub_00607C20(?:?);//00607C20
    //procedure sub_00607D08(?:?; ?:?; ?:?);//00607D08
    //procedure sub_006080F8(?:?; ?:?; ?:?);//006080F8
    //procedure sub_00608240(?:?; ?:?; ?:?);//00608240
    //procedure sub_00608360(?:?; ?:?; ?:?);//00608360
    procedure sub_00608424;//00608424
    //procedure sub_0060842C(?:?; ?:?; ?:Pointer; ?:?);//0060842C
    //function sub_006085AC(?:?):?;//006085AC
    //function sub_006085C0(?:?):?;//006085C0
    //function sub_006085F4(?:?; ?:?):?;//006085F4
    //procedure sub_00608600(?:?; ?:?);//00608600
    //procedure sub_00608648(?:?; ?:?);//00608648
    //procedure sub_00608684(?:?; ?:?);//00608684
    //procedure sub_006086C0(?:?; ?:?);//006086C0
    //procedure sub_00608704(?:Integer; ?:?);//00608704
    //procedure sub_0060873C(?:?; ?:?);//0060873C
    //procedure sub_00608780(?:?; ?:?);//00608780
    procedure sub_006087BC(?:Integer);//006087BC
    //function sub_00608884(?:?):?;//00608884
    //procedure sub_00608970(?:?; ?:Byte);//00608970
    //function sub_00608AA4(?:?; ?:?):?;//00608AA4
    procedure sub_00608B04(?:Integer);//00608B04
    //procedure sub_00608B78(?:?);//00608B78
    //procedure sub_00608BEC(?:?);//00608BEC
    procedure sub_00608C60(?:Integer);//00608C60
    //procedure sub_00608CDC(?:?);//00608CDC
    //procedure sub_00608D50(?:Integer; ?:Integer; ?:?);//00608D50
    //function sub_00608F5C(?:Integer; ?:Integer; ?:?):?;//00608F5C
    //procedure sub_00608FD8(?:?);//00608FD8
    //procedure sub_006090DC(?:?);//006090DC
    procedure sub_0060911C;//0060911C
    procedure sub_0060912C;//0060912C
    procedure sub_0060913C(?:Integer);//0060913C
    //function sub_006091D0(?:?; ?:?):?;//006091D0
    //procedure sub_00609214(?:?; ?:Boolean);//00609214
    //procedure sub_0060925C(?:?);//0060925C
    //procedure sub_006092B0(?:?);//006092B0
    procedure sub_00609390;//00609390
    //function sub_0060C978(?:?):?;//0060C978
    procedure sub_00611C1C;//00611C1C
    procedure sub_00611C40;//00611C40
    procedure sub_00611C44;//00611C44
    procedure sub_00611D1C(?:Integer);//00611D1C
    procedure sub_00611E3C;//00611E3C
    procedure sub_006123D8;//006123D8
    procedure sub_00612600;//00612600
    //function sub_0061266C:?;//0061266C
    //function sub_0061273C(?:UnicodeString):?;//0061273C
    //procedure sub_0061278C(?:Integer; ?:?);//0061278C
    //function sub_006127A4:?;//006127A4
    //function sub_0061285C:?;//0061285C
    //function sub_00613164:?;//00613164
    //function sub_006134A8:?;//006134A8
    //function sub_0061385C:?;//0061385C
    //function sub_00613B88(?:?):?;//00613B88
    procedure sub_00613D10;//00613D10
    //procedure sub_00613DF4(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00613DF4
    //procedure sub_0061408C(?:?);//0061408C
    procedure sub_006151F8;//006151F8
    //function sub_00615220(?:Boolean):?;//00615220

implementation

//00606698
{*procedure sub_00606698(?:?; ?:?; ?:?);
begin
 00606698    push        ebp
 00606699    mov         ebp,esp
 0060669B    add         esp,0FFFFFF6C
 006066A1    push        ebx
 006066A2    push        esi
 006066A3    push        edi
 006066A4    mov         dword ptr [ebp-8],ecx
 006066A7    mov         dword ptr [ebp-4],edx
 006066AA    mov         ebx,eax
 006066AC    call        00600EA0
 006066B1    fstp        qword ptr [ebp-10]
 006066B4    wait
 006066B5    fld         qword ptr [ebp-10]
 006066B8    fsub        qword ptr [ebx+150]
 006066BE    fstp        qword ptr [ebp-30]
 006066C1    wait
 006066C2    fld         qword ptr [ebx+150]
 006066C8    fcomp       dword ptr ds:[607AB0];0:Single
 006066CE    wait
 006066CF    fnstsw      al
 006066D1    sahf
>006066D2    jne         006066DE
 006066D4    xor         eax,eax
 006066D6    mov         dword ptr [ebp-30],eax
 006066D9    mov         dword ptr [ebp-2C],eax
>006066DC    jmp         006066F5
 006066DE    fld         qword ptr [ebp-30]
 006066E1    fcomp       dword ptr ds:[607AB0];0:Single
 006066E7    wait
 006066E8    fnstsw      al
 006066EA    sahf
>006066EB    ja          006066F5
 006066ED    xor         eax,eax
 006066EF    mov         dword ptr [ebp-30],eax
 006066F2    mov         dword ptr [ebp-2C],eax
 006066F5    mov         eax,dword ptr [ebp-10]
 006066F8    mov         dword ptr [ebx+150],eax
 006066FE    mov         eax,dword ptr [ebp-0C]
 00606701    mov         dword ptr [ebx+154],eax
 00606707    cmp         dword ptr [ebp-4],3E
>0060670B    jge         00606716
 0060670D    movzx       eax,byte ptr [ebp-4]
 00606711    mov         byte ptr [ebx+1F],al
>00606714    jmp         00606720
 00606716    cmp         byte ptr [ebx+1F],3E
>0060671A    jae         00606720
 0060671C    mov         byte ptr [ebx+1F],3E
 00606720    cmp         dword ptr [ebp-4],3D
>00606724    je          00606740
 00606726    mov         eax,dword ptr [ebp-8]
 00606729    movzx       eax,byte ptr [eax]
 0060672C    shl         eax,8
 0060672F    mov         edx,dword ptr [ebp-8]
 00606732    movzx       edx,byte ptr [edx+1]
 00606736    add         ax,dx
 00606739    mov         word ptr [ebx+98],ax
 00606740    mov         eax,dword ptr [ebp-4]
 00606743    add         eax,0FFFFFFCF
 00606746    cmp         eax,0E
>00606749    ja          006068ED
 0060674F    movzx       eax,byte ptr [eax+60675D]
 00606756    jmp         dword ptr [eax*4+60676C]
 00606756    db          3
 00606756    db          0
 00606756    db          3
 00606756    db          0
 00606756    db          3
 00606756    db          0
 00606756    db          3
 00606756    db          0
 00606756    db          0
 00606756    db          0
 00606756    db          0
 00606756    db          0
 00606756    db          0
 00606756    db          1
 00606756    db          2
 00606756    dd          006068ED
 00606756    dd          0060677C
 00606756    dd          006067DE
 00606756    dd          0060683D
 0060677C    mov         eax,dword ptr [ebp-8]
 0060677F    movzx       eax,byte ptr [eax+2]
 00606783    mov         edx,80
 00606788    sub         edx,eax
 0060678A    mov         dword ptr [ebp-74],edx
 0060678D    fild        dword ptr [ebp-74]
 00606790    fstp        qword ptr [ebx+38]
 00606793    wait
 00606794    fld         qword ptr [ebx+40]
 00606797    call        @ROUND
 0060679C    add         al,80
 0060679E    and         al,0F
 006067A0    mov         edx,dword ptr [ebp-8]
 006067A3    movzx       edx,byte ptr [edx]
 006067A6    and         dl,60
 006067A9    movzx       edx,dl
 006067AC    shr         edx,5
 006067AF    mov         ecx,dword ptr [ebp-8]
 006067B2    movzx       ecx,byte ptr [ecx+1]
 006067B6    and         cl,60
 006067B9    movzx       ecx,cl
 006067BC    shr         ecx,3
 006067BF    add         edx,ecx
 006067C1    shl         edx,4
 006067C4    movzx       eax,al
 006067C7    add         edx,eax
 006067C9    sub         edx,80
 006067CF    mov         dword ptr [ebp-74],edx
 006067D2    fild        dword ptr [ebp-74]
 006067D5    fstp        qword ptr [ebx+40]
 006067D8    wait
>006067D9    jmp         006068ED
 006067DE    mov         eax,dword ptr [ebp-8]
 006067E1    movzx       eax,byte ptr [eax+2]
 006067E5    mov         edx,80
 006067EA    sub         edx,eax
 006067EC    mov         dword ptr [ebp-74],edx
 006067EF    fild        dword ptr [ebp-74]
 006067F2    fstp        qword ptr [ebx+48]
 006067F5    wait
 006067F6    fld         qword ptr [ebx+40]
 006067F9    call        @ROUND
 006067FE    add         al,80
 00606800    and         al,0F0
 00606802    mov         edx,dword ptr [ebp-8]
 00606805    movzx       edx,byte ptr [edx]
 00606808    and         dl,60
 0060680B    movzx       edx,dl
 0060680E    shr         edx,5
 00606811    mov         ecx,dword ptr [ebp-8]
 00606814    movzx       ecx,byte ptr [ecx+1]
 00606818    and         cl,60
 0060681B    movzx       ecx,cl
 0060681E    shr         ecx,3
 00606821    add         edx,ecx
 00606823    movzx       eax,al
 00606826    add         edx,eax
 00606828    sub         edx,80
 0060682E    mov         dword ptr [ebp-74],edx
 00606831    fild        dword ptr [ebp-74]
 00606834    fstp        qword ptr [ebx+40]
 00606837    wait
>00606838    jmp         006068ED
 0060683D    mov         edx,dword ptr [ebp-8]
 00606840    movzx       edx,byte ptr [edx+2]
 00606844    mov         ecx,80
 00606849    sub         ecx,edx
 0060684B    mov         dword ptr [ebp-74],ecx
 0060684E    fild        dword ptr [ebp-74]
 00606851    mov         eax,dword ptr [ebp-8]
 00606854    movzx       eax,byte ptr [eax]
 00606857    test        al,40
 0060685A    seta        dl
 0060685D    movsx       edx,dl
 00606860    mov         dword ptr [ebp-78],edx
 00606863    fild        dword ptr [ebp-78]
 00606866    fdiv        dword ptr ds:[607AB4];2:Single
 0060686C    fsubp       st(1),st
 0060686E    test        al,20
 00606871    seta        al
 00606874    movsx       eax,al
 00606877    mov         dword ptr [ebp-7C],eax
 0060687A    fild        dword ptr [ebp-7C]
 0060687D    fdiv        dword ptr ds:[607AB8];4:Single
 00606883    fsubp       st(1),st
 00606885    fstp        qword ptr [ebx+38]
 00606888    wait
 00606889    mov         eax,dword ptr [ebp-8]
 0060688C    movzx       eax,byte ptr [eax+4]
 00606890    sub         eax,80
 00606895    mov         dword ptr [ebp-74],eax
 00606898    fild        dword ptr [ebp-74]
 0060689B    mov         eax,dword ptr [ebp-8]
 0060689E    test        byte ptr [eax+1],40
 006068A2    seta        al
 006068A5    movsx       eax,al
 006068A8    mov         dword ptr [ebp-78],eax
 006068AB    fild        dword ptr [ebp-78]
 006068AE    fdiv        dword ptr ds:[607AB4];2:Single
 006068B4    faddp       st(1),st
 006068B6    fstp        qword ptr [ebx+40]
 006068B9    wait
 006068BA    mov         eax,dword ptr [ebp-8]
 006068BD    movzx       eax,byte ptr [eax+3]
 006068C1    mov         edx,80
 006068C6    sub         edx,eax
 006068C8    mov         dword ptr [ebp-74],edx
 006068CB    fild        dword ptr [ebp-74]
 006068CE    mov         eax,dword ptr [ebp-8]
 006068D1    test        byte ptr [eax+1],20
 006068D5    seta        al
 006068D8    movsx       eax,al
 006068DB    mov         dword ptr [ebp-78],eax
 006068DE    fild        dword ptr [ebp-78]
 006068E1    fdiv        dword ptr ds:[607AB4];2:Single
 006068E7    fsubp       st(1),st
 006068E9    fstp        qword ptr [ebx+48]
 006068EC    wait
 006068ED    mov         eax,dword ptr [ebp-4]
 006068F0    sub         eax,32
>006068F3    je          00606906
 006068F5    add         eax,0FFFFFFFE
 006068F8    sub         eax,4
>006068FB    jb          00606906
 006068FD    sub         eax,5
>00606900    jne         0060734D
 00606906    lea         eax,[ebx+3A8]
 0060690C    mov         ecx,0FE
 00606911    mov         edx,15
 00606916    call        @FillChar
 0060691B    mov         eax,dword ptr [ebp-4]
 0060691E    add         eax,0FFFFFFCE
 00606921    cmp         eax,0B
>00606924    ja          006069EC
 0060692A    jmp         dword ptr [eax*4+606931]
 0060692A    dd          00606961
 0060692A    dd          006069EC
 0060692A    dd          00606979
 0060692A    dd          00606991
 0060692A    dd          006069A9
 0060692A    dd          006069C1
 0060692A    dd          006069EC
 0060692A    dd          006069EC
 0060692A    dd          006069EC
 0060692A    dd          006069EC
 0060692A    dd          006069EC
 0060692A    dd          006069D9
 00606961    lea         edx,[ebx+3A8]
 00606967    mov         eax,dword ptr [ebp-8]
 0060696A    add         eax,2
 0060696D    mov         ecx,8
 00606972    call        Move
>00606977    jmp         006069EC
 00606979    lea         edx,[ebx+3A8]
 0060697F    mov         eax,dword ptr [ebp-8]
 00606982    add         eax,2
 00606985    mov         ecx,13
 0060698A    call        Move
>0060698F    jmp         006069EC
 00606991    lea         edx,[ebx+3A8]
 00606997    mov         eax,dword ptr [ebp-8]
 0060699A    add         eax,5
 0060699D    mov         ecx,10
 006069A2    call        Move
>006069A7    jmp         006069EC
 006069A9    lea         edx,[ebx+3A8]
 006069AF    mov         eax,dword ptr [ebp-8]
 006069B2    add         eax,0C
 006069B5    mov         ecx,9
 006069BA    call        Move
>006069BF    jmp         006069EC
 006069C1    lea         edx,[ebx+3A8]
 006069C7    mov         eax,dword ptr [ebp-8]
 006069CA    add         eax,0F
 006069CD    mov         ecx,6
 006069D2    call        Move
>006069D7    jmp         006069EC
 006069D9    lea         edx,[ebx+3A8]
 006069DF    mov         eax,dword ptr [ebp-8]
 006069E2    mov         ecx,15
 006069E7    call        Move
 006069EC    mov         esi,15
 006069F1    lea         edi,[ebx+3A8]
 006069F7    movzx       edx,byte ptr [ebx+9A]
 006069FE    movzx       eax,byte ptr [edi]
 00606A01    call        006085F4
 00606A06    mov         byte ptr [edi],al
 00606A08    inc         edi
 00606A09    dec         esi
>00606A0A    jne         006069F7
 00606A0C    mov         esi,6
 00606A11    lea         eax,[ebx+3A8]
 00606A17    movzx       edx,byte ptr [eax]
 00606A1A    mov         byte ptr [eax-5A],dl
 00606A1D    inc         eax
 00606A1E    dec         esi
>00606A1F    jne         00606A17
 00606A21    mov         esi,6
 00606A26    lea         eax,[ebx+3A8]
 00606A2C    movzx       edx,byte ptr [eax]
 00606A2F    mov         byte ptr [eax-94],dl
 00606A35    inc         eax
 00606A36    dec         esi
>00606A37    jne         00606A2C
 00606A39    movzx       eax,byte ptr [ebx+9C]
 00606A40    cmp         al,2
>00606A42    jne         00606D79
 00606A48    lea         eax,[ebx+320]
 00606A4E    xor         ecx,ecx
 00606A50    mov         edx,36
 00606A55    call        @FillChar
 00606A5A    movzx       eax,byte ptr [ebx+314]
 00606A61    mov         word ptr [ebx+2D0],ax
 00606A68    movzx       eax,byte ptr [ebx+315]
 00606A6F    mov         word ptr [ebx+2D2],ax
 00606A76    cmp         word ptr [ebx+2D4],0
>00606A7E    jne         00606AA6
 00606A80    cmp         word ptr [ebx+2D6],0
>00606A88    jne         00606AA6
 00606A8A    movzx       eax,word ptr [ebx+2D0]
 00606A91    mov         word ptr [ebx+2D4],ax
 00606A98    movzx       eax,word ptr [ebx+2D2]
 00606A9F    mov         word ptr [ebx+2D6],ax
 00606AA6    movzx       edx,byte ptr [ebx+316]
 00606AAD    mov         dword ptr [ebp-74],edx
 00606AB0    fild        dword ptr [ebp-74]
 00606AB3    movzx       eax,byte ptr [ebx+319]
 00606ABA    mov         edx,eax
 00606ABC    shr         edx,2
 00606ABF    and         edx,3
 00606AC2    mov         dword ptr [ebp-78],edx
 00606AC5    fild        dword ptr [ebp-78]
 00606AC8    fdiv        dword ptr ds:[607AB8];4:Single
 00606ACE    faddp       st(1),st
 00606AD0    fstp        qword ptr [ebp-10]
 00606AD3    wait
 00606AD4    movzx       edx,byte ptr [ebx+317]
 00606ADB    mov         dword ptr [ebp-74],edx
 00606ADE    fild        dword ptr [ebp-74]
 00606AE1    mov         edx,eax
 00606AE3    shr         edx,4
 00606AE6    and         edx,3
 00606AE9    mov         dword ptr [ebp-78],edx
 00606AEC    fild        dword ptr [ebp-78]
 00606AEF    fdiv        dword ptr ds:[607AB8];4:Single
 00606AF5    faddp       st(1),st
 00606AF7    fstp        qword ptr [ebp-20]
 00606AFA    wait
 00606AFB    movzx       edx,byte ptr [ebx+318]
 00606B02    mov         dword ptr [ebp-74],edx
 00606B05    fild        dword ptr [ebp-74]
 00606B08    shr         eax,6
 00606B0B    and         eax,3
 00606B0E    mov         dword ptr [ebp-78],eax
 00606B11    fild        dword ptr [ebp-78]
 00606B14    fdiv        dword ptr ds:[607AB8];4:Single
 00606B1A    faddp       st(1),st
 00606B1C    fstp        qword ptr [ebp-18]
 00606B1F    wait
 00606B20    fld         dword ptr ds:[607ABC];127:Single
 00606B26    fsub        qword ptr [ebp-10]
 00606B29    fstp        qword ptr [ebx+288]
 00606B2F    wait
 00606B30    fld         dword ptr ds:[607ABC];127:Single
 00606B36    fsub        qword ptr [ebp-20]
 00606B39    fstp        qword ptr [ebx+298]
 00606B3F    wait
 00606B40    fld         qword ptr [ebp-18]
 00606B43    fsub        dword ptr ds:[607AC0];130:Single
 00606B49    fstp        qword ptr [ebx+290]
 00606B4F    wait
 00606B50    fld         qword ptr [ebx+2B8]
 00606B56    fsub        qword ptr [ebx+2A0]
 00606B5C    fcomp       dword ptr ds:[607AB0];0:Single
 00606B62    wait
 00606B63    fnstsw      al
 00606B65    sahf
>00606B66    je          00606B86
 00606B68    fld         qword ptr [ebx+2A0]
 00606B6E    fsub        qword ptr [ebp-10]
 00606B71    fld         qword ptr [ebx+2B8]
 00606B77    fsub        qword ptr [ebx+2A0]
 00606B7D    fdivp       st(1),st
 00606B7F    fstp        dword ptr [ebx+2E4]
 00606B85    wait
 00606B86    fld         qword ptr [ebx+2C0]
 00606B8C    fsub        qword ptr [ebx+2A8]
 00606B92    fcomp       dword ptr ds:[607AB0];0:Single
 00606B98    wait
 00606B99    fnstsw      al
 00606B9B    sahf
>00606B9C    je          00606BBC
 00606B9E    fld         qword ptr [ebp-18]
 00606BA1    fsub        qword ptr [ebx+2A8]
 00606BA7    fld         qword ptr [ebx+2C0]
 00606BAD    fsub        qword ptr [ebx+2A8]
 00606BB3    fdivp       st(1),st
 00606BB5    fstp        dword ptr [ebx+2E8]
 00606BBB    wait
 00606BBC    fld         qword ptr [ebx+2C8]
 00606BC2    fsub        qword ptr [ebx+2B0]
 00606BC8    fcomp       dword ptr ds:[607AB0];0:Single
 00606BCE    wait
 00606BCF    fnstsw      al
 00606BD1    sahf
>00606BD2    je          00606BF2
 00606BD4    fld         qword ptr [ebx+2A8]
 00606BDA    fsub        qword ptr [ebp-20]
 00606BDD    fld         qword ptr [ebx+2C8]
 00606BE3    fsub        qword ptr [ebx+2B0]
 00606BE9    fdivp       st(1),st
 00606BEB    fstp        dword ptr [ebx+2EC]
 00606BF1    wait
 00606BF2    fld         dword ptr [ebx+2E4]
 00606BF8    fmul        st,st(0)
 00606BFA    fstp        tbyte ptr [ebp-88]
 00606C00    wait
 00606C01    fld         dword ptr [ebx+2E8]
 00606C07    fmul        st,st(0)
 00606C09    fld         tbyte ptr [ebp-88]
 00606C0F    faddp       st(1),st
 00606C11    fstp        tbyte ptr [ebp-94]
 00606C17    wait
 00606C18    fld         dword ptr [ebx+2EC]
 00606C1E    fmul        st,st(0)
 00606C20    fld         tbyte ptr [ebp-94]
 00606C26    faddp       st(1),st
 00606C28    add         esp,0FFFFFFF4
 00606C2B    fstp        tbyte ptr [esp]
 00606C2E    wait
 00606C2F    call        Sqrt
 00606C34    fstp        qword ptr [ebp-28]
 00606C37    wait
 00606C38    fld         tbyte ptr ds:[607AC4];0.97:Extended
 00606C3E    fcomp       qword ptr [ebp-28]
 00606C41    wait
 00606C42    fnstsw      al
 00606C44    sahf
>00606C45    ja          00606CE1
 00606C4B    fld         tbyte ptr ds:[607AD0];1.03:Extended
 00606C51    fcomp       qword ptr [ebp-28]
 00606C54    wait
 00606C55    fnstsw      al
 00606C57    sahf
>00606C58    jb          00606CE1
 00606C5E    fld         dword ptr [ebx+2E4]
 00606C64    fdiv        qword ptr [ebp-28]
 00606C67    fstp        dword ptr [ebx+2F0]
 00606C6D    wait
 00606C6E    fld         dword ptr [ebx+2E8]
 00606C74    fdiv        qword ptr [ebp-28]
 00606C77    fstp        dword ptr [ebx+2F4]
 00606C7D    wait
 00606C7E    fld         dword ptr [ebx+2EC]
 00606C84    fdiv        qword ptr [ebp-28]
 00606C87    fstp        dword ptr [ebx+2F8]
 00606C8D    wait
 00606C8E    push        dword ptr [ebx+2F0]
 00606C94    push        dword ptr [ebx+2F4]
 00606C9A    call        00454AAC
 00606C9F    fstp        dword ptr [ebp-34]
 00606CA2    wait
 00606CA3    fld         tbyte ptr ds:[607ADC];57.2957795130823:Extended
 00606CA9    fmul        dword ptr [ebp-34]
 00606CAC    fstp        dword ptr [ebp-38]
 00606CAF    wait
 00606CB0    fld         dword ptr [ebp-38]
 00606CB3    fchs
 00606CB5    fstp        dword ptr [ebx+300]
 00606CBB    wait
 00606CBC    push        dword ptr [ebx+2F8]
 00606CC2    call        00454A74
 00606CC7    fstp        dword ptr [ebp-3C]
 00606CCA    wait
 00606CCB    fld         tbyte ptr ds:[607ADC];57.2957795130823:Extended
 00606CD1    fmul        dword ptr [ebp-3C]
 00606CD4    fstp        dword ptr [ebp-40]
 00606CD7    wait
 00606CD8    mov         eax,dword ptr [ebp-40]
 00606CDB    mov         dword ptr [ebx+2FC],eax
 00606CE1    fld         qword ptr [ebp-28]
 00606CE4    fcomp       dword ptr ds:[607AB0];0:Single
 00606CEA    wait
 00606CEB    fnstsw      al
 00606CED    sahf
>00606CEE    je          00606D50
 00606CF0    push        dword ptr [ebx+2E4]
 00606CF6    push        dword ptr [ebx+2E8]
 00606CFC    call        00454AAC
 00606D01    fstp        dword ptr [ebp-44]
 00606D04    wait
 00606D05    fld         tbyte ptr ds:[607ADC];57.2957795130823:Extended
 00606D0B    fmul        dword ptr [ebp-44]
 00606D0E    fstp        dword ptr [ebp-48]
 00606D11    wait
 00606D12    fld         dword ptr [ebp-48]
 00606D15    fchs
 00606D17    fstp        dword ptr [ebx+308]
 00606D1D    wait
 00606D1E    fld         dword ptr [ebx+2EC]
 00606D24    fdiv        qword ptr [ebp-28]
 00606D27    add         esp,0FFFFFFF4
 00606D2A    fstp        tbyte ptr [esp]
 00606D2D    wait
 00606D2E    call        00454A44
 00606D33    fstp        tbyte ptr [ebp-60]
 00606D36    wait
 00606D37    fld         tbyte ptr [ebp-60]
 00606D3A    fld         tbyte ptr ds:[607ADC];57.2957795130823:Extended
 00606D40    fmulp       st(1),st
 00606D42    fstp        tbyte ptr [ebp-70]
 00606D45    wait
 00606D46    fld         tbyte ptr [ebp-70]
 00606D49    fstp        dword ptr [ebx+304]
 00606D4F    wait
 00606D50    test        byte ptr [ebx+319],1
 00606D57    seta        al
 00606D5A    xor         al,1
 00606D5C    mov         byte ptr [ebx+2E1],al
 00606D62    test        byte ptr [ebx+319],2
 00606D69    seta        al
 00606D6C    xor         al,1
 00606D6E    mov         byte ptr [ebx+2E0],al
>00606D74    jmp         0060734D
 00606D79    cmp         al,3
>00606D7B    jne         00606F95
 00606D81    lea         eax,[ebx+288]
 00606D87    xor         ecx,ecx
 00606D89    mov         edx,98
 00606D8E    call        @FillChar
 00606D93    movzx       eax,byte ptr [ebx+352]
 00606D9A    xor         al,0FF
 00606D9C    movzx       eax,al
 00606D9F    shl         eax,8
 00606DA2    movzx       edx,byte ptr [ebx+353]
 00606DA9    xor         dl,0FF
 00606DAC    movzx       edx,dl
 00606DAF    add         ax,dx
 00606DB2    mov         word ptr [ebx+344],ax
 00606DB9    movzx       eax,byte ptr [ebx+34E]
 00606DC0    and         al,3F
 00606DC2    movzx       eax,al
 00606DC5    mov         word ptr [ebx+320],ax
 00606DCC    movzx       eax,byte ptr [ebx+34F]
 00606DD3    and         al,3F
 00606DD5    movzx       eax,al
 00606DD8    mov         word ptr [ebx+322],ax
 00606DDF    movzx       eax,byte ptr [ebx+350]
 00606DE6    shr         eax,7
 00606DE9    movzx       edx,byte ptr [ebx+34F]
 00606DF0    shr         edx,6
 00606DF3    add         edx,edx
 00606DF5    add         ax,dx
 00606DF8    movzx       edx,byte ptr [ebx+34E]
 00606DFF    shr         edx,6
 00606E02    add         edx,edx
 00606E04    add         edx,edx
 00606E06    add         edx,edx
 00606E08    add         ax,dx
 00606E0B    add         eax,eax
 00606E0D    mov         word ptr [ebx+330],ax
 00606E14    movzx       eax,byte ptr [ebx+350]
 00606E1B    and         al,1F
 00606E1D    movzx       eax,al
 00606E20    add         eax,eax
 00606E22    mov         word ptr [ebx+332],ax
 00606E29    movzx       eax,byte ptr [ebx+351]
 00606E30    and         al,1F
 00606E32    movzx       eax,al
 00606E35    mov         word ptr [ebx+342],ax
 00606E3C    movzx       eax,byte ptr [ebx+351]
 00606E43    shr         eax,5
 00606E46    movzx       edx,byte ptr [ebx+350]
 00606E4D    shr         edx,5
 00606E50    and         dx,3
 00606E54    add         edx,edx
 00606E56    add         edx,edx
 00606E58    add         edx,edx
 00606E5A    add         ax,dx
 00606E5D    mov         word ptr [ebx+340],ax
 00606E64    cmp         word ptr [ebx+324],0
>00606E6C    jne         00606EF8
 00606E72    cmp         word ptr [ebx+326],0
>00606E7A    jne         00606EF8
 00606E7C    movzx       eax,word ptr [ebx+320]
 00606E83    add         eax,eax
 00606E85    add         eax,eax
 00606E87    mov         word ptr [ebx+324],ax
 00606E8E    movzx       eax,word ptr [ebx+322]
 00606E95    add         eax,eax
 00606E97    add         eax,eax
 00606E99    mov         word ptr [ebx+326],ax
 00606EA0    movzx       eax,word ptr [ebx+320]
 00606EA7    add         eax,eax
 00606EA9    add         eax,eax
 00606EAB    add         ax,68
 00606EAF    mov         word ptr [ebx+32C],ax
 00606EB6    movzx       eax,word ptr [ebx+322]
 00606EBD    add         eax,eax
 00606EBF    add         eax,eax
 00606EC1    add         ax,68
 00606EC5    mov         word ptr [ebx+32E],ax
 00606ECC    movzx       eax,word ptr [ebx+320]
 00606ED3    add         eax,eax
 00606ED5    add         eax,eax
 00606ED7    sub         ax,68
 00606EDB    mov         word ptr [ebx+328],ax
 00606EE2    movzx       eax,word ptr [ebx+322]
 00606EE9    add         eax,eax
 00606EEB    add         eax,eax
 00606EED    sub         ax,68
 00606EF1    mov         word ptr [ebx+32A],ax
 00606EF8    cmp         word ptr [ebx+334],0
>00606F00    jne         0060734D
 00606F06    cmp         word ptr [ebx+336],0
>00606F0E    jne         0060734D
 00606F14    movzx       eax,word ptr [ebx+330]
 00606F1B    add         eax,eax
 00606F1D    add         eax,eax
 00606F1F    mov         word ptr [ebx+334],ax
 00606F26    movzx       eax,word ptr [ebx+332]
 00606F2D    add         eax,eax
 00606F2F    add         eax,eax
 00606F31    mov         word ptr [ebx+336],ax
 00606F38    movzx       eax,word ptr [ebx+330]
 00606F3F    add         eax,eax
 00606F41    add         eax,eax
 00606F43    add         ax,68
 00606F47    mov         word ptr [ebx+33C],ax
 00606F4E    movzx       eax,word ptr [ebx+332]
 00606F55    add         eax,eax
 00606F57    add         eax,eax
 00606F59    add         ax,68
 00606F5D    mov         word ptr [ebx+33E],ax
 00606F64    movzx       eax,word ptr [ebx+330]
 00606F6B    add         eax,eax
 00606F6D    add         eax,eax
 00606F6F    sub         ax,68
 00606F73    mov         word ptr [ebx+338],ax
 00606F7A    movzx       eax,word ptr [ebx+332]
 00606F81    add         eax,eax
 00606F83    add         eax,eax
 00606F85    sub         ax,68
 00606F89    mov         word ptr [ebx+33A],ax
>00606F90    jmp         0060734D
 00606F95    cmp         al,6
>00606F97    jne         0060733B
 00606F9D    lea         eax,[ebx+288]
 00606FA3    xor         ecx,ecx
 00606FA5    mov         edx,98
 00606FAA    call        @FillChar
 00606FAF    lea         eax,[ebx+320]
 00606FB5    xor         ecx,ecx
 00606FB7    mov         edx,36
 00606FBC    call        @FillChar
 00606FC1    movzx       eax,byte ptr [ebx+3A8]
 00606FC8    shl         eax,8
 00606FCB    movzx       edx,byte ptr [ebx+3A9]
 00606FD2    add         ax,dx
 00606FD5    cmp         ax,word ptr [ebx+360]
>00606FDC    jae         00607037
 00606FDE    movzx       edx,word ptr [ebx+358]
 00606FE5    cmp         dx,word ptr [ebx+360]
>00606FEC    jne         00607001
 00606FEE    xor         eax,eax
 00606FF0    mov         dword ptr [ebx+380],eax
 00606FF6    mov         dword ptr [ebx+384],eax
>00606FFC    jmp         00607095
 00607001    movzx       eax,ax
 00607004    movzx       edx,word ptr [ebx+358]
 0060700B    sub         eax,edx
 0060700D    imul        eax,eax,44
 00607010    mov         dword ptr [ebp-74],eax
 00607013    fild        dword ptr [ebp-74]
 00607016    movzx       eax,word ptr [ebx+360]
 0060701D    movzx       edx,word ptr [ebx+358]
 00607024    sub         eax,edx
 00607026    mov         dword ptr [ebp-78],eax
 00607029    fild        dword ptr [ebp-78]
 0060702C    fdivp       st(1),st
 0060702E    fstp        qword ptr [ebx+380]
 00607034    wait
>00607035    jmp         00607095
 00607037    movzx       edx,word ptr [ebx+368]
 0060703E    cmp         dx,word ptr [ebx+360]
>00607045    jne         0060705B
 00607047    xor         eax,eax
 00607049    mov         dword ptr [ebx+380],eax
 0060704F    mov         dword ptr [ebx+384],40510000
>00607059    jmp         00607095
 0060705B    movzx       eax,ax
 0060705E    movzx       edx,word ptr [ebx+360]
 00607065    sub         eax,edx
 00607067    imul        eax,eax,44
 0060706A    mov         dword ptr [ebp-74],eax
 0060706D    fild        dword ptr [ebp-74]
 00607070    movzx       eax,word ptr [ebx+368]
 00607077    movzx       edx,word ptr [ebx+360]
 0060707E    sub         eax,edx
 00607080    mov         dword ptr [ebp-78],eax
 00607083    fild        dword ptr [ebp-78]
 00607086    fdivp       st(1),st
 00607088    fadd        dword ptr ds:[607AE8];68:Single
 0060708E    fstp        qword ptr [ebx+380]
 00607094    wait
 00607095    movzx       eax,byte ptr [ebx+3AA]
 0060709C    shl         eax,8
 0060709F    movzx       edx,byte ptr [ebx+3AB]
 006070A6    add         ax,dx
 006070A9    cmp         ax,word ptr [ebx+362]
>006070B0    jae         0060710B
 006070B2    movzx       edx,word ptr [ebx+35A]
 006070B9    cmp         dx,word ptr [ebx+362]
>006070C0    jne         006070D5
 006070C2    xor         eax,eax
 006070C4    mov         dword ptr [ebx+390],eax
 006070CA    mov         dword ptr [ebx+394],eax
>006070D0    jmp         00607169
 006070D5    movzx       eax,ax
 006070D8    movzx       edx,word ptr [ebx+35A]
 006070DF    sub         eax,edx
 006070E1    imul        eax,eax,44
 006070E4    mov         dword ptr [ebp-74],eax
 006070E7    fild        dword ptr [ebp-74]
 006070EA    movzx       eax,word ptr [ebx+362]
 006070F1    movzx       edx,word ptr [ebx+35A]
 006070F8    sub         eax,edx
 006070FA    mov         dword ptr [ebp-78],eax
 006070FD    fild        dword ptr [ebp-78]
 00607100    fdivp       st(1),st
 00607102    fstp        qword ptr [ebx+390]
 00607108    wait
>00607109    jmp         00607169
 0060710B    movzx       edx,word ptr [ebx+36A]
 00607112    cmp         dx,word ptr [ebx+362]
>00607119    jne         0060712F
 0060711B    xor         eax,eax
 0060711D    mov         dword ptr [ebx+390],eax
 00607123    mov         dword ptr [ebx+394],40510000
>0060712D    jmp         00607169
 0060712F    movzx       eax,ax
 00607132    movzx       edx,word ptr [ebx+362]
 00607139    sub         eax,edx
 0060713B    imul        eax,eax,44
 0060713E    mov         dword ptr [ebp-74],eax
 00607141    fild        dword ptr [ebp-74]
 00607144    movzx       eax,word ptr [ebx+36A]
 0060714B    movzx       edx,word ptr [ebx+362]
 00607152    sub         eax,edx
 00607154    mov         dword ptr [ebp-78],eax
 00607157    fild        dword ptr [ebp-78]
 0060715A    fdivp       st(1),st
 0060715C    fadd        dword ptr ds:[607AE8];68:Single
 00607162    fstp        qword ptr [ebx+390]
 00607168    wait
 00607169    movzx       eax,byte ptr [ebx+3AC]
 00607170    shl         eax,8
 00607173    movzx       edx,byte ptr [ebx+3AD]
 0060717A    add         ax,dx
 0060717D    cmp         ax,word ptr [ebx+364]
>00607184    jae         006071DF
 00607186    movzx       edx,word ptr [ebx+35C]
 0060718D    cmp         dx,word ptr [ebx+364]
>00607194    jne         006071A9
 00607196    xor         eax,eax
 00607198    mov         dword ptr [ebx+388],eax
 0060719E    mov         dword ptr [ebx+38C],eax
>006071A4    jmp         0060723D
 006071A9    movzx       eax,ax
 006071AC    movzx       edx,word ptr [ebx+35C]
 006071B3    sub         eax,edx
 006071B5    imul        eax,eax,44
 006071B8    mov         dword ptr [ebp-74],eax
 006071BB    fild        dword ptr [ebp-74]
 006071BE    movzx       eax,word ptr [ebx+364]
 006071C5    movzx       edx,word ptr [ebx+35C]
 006071CC    sub         eax,edx
 006071CE    mov         dword ptr [ebp-78],eax
 006071D1    fild        dword ptr [ebp-78]
 006071D4    fdivp       st(1),st
 006071D6    fstp        qword ptr [ebx+388]
 006071DC    wait
>006071DD    jmp         0060723D
 006071DF    movzx       edx,word ptr [ebx+36C]
 006071E6    cmp         dx,word ptr [ebx+364]
>006071ED    jne         00607203
 006071EF    xor         eax,eax
 006071F1    mov         dword ptr [ebx+388],eax
 006071F7    mov         dword ptr [ebx+38C],40510000
>00607201    jmp         0060723D
 00607203    movzx       eax,ax
 00607206    movzx       edx,word ptr [ebx+364]
 0060720D    sub         eax,edx
 0060720F    imul        eax,eax,44
 00607212    mov         dword ptr [ebp-74],eax
 00607215    fild        dword ptr [ebp-74]
 00607218    movzx       eax,word ptr [ebx+36C]
 0060721F    movzx       edx,word ptr [ebx+364]
 00607226    sub         eax,edx
 00607228    mov         dword ptr [ebp-78],eax
 0060722B    fild        dword ptr [ebp-78]
 0060722E    fdivp       st(1),st
 00607230    fadd        dword ptr ds:[607AE8];68:Single
 00607236    fstp        qword ptr [ebx+388]
 0060723C    wait
 0060723D    movzx       eax,byte ptr [ebx+3AE]
 00607244    shl         eax,8
 00607247    movzx       edx,byte ptr [ebx+3AF]
 0060724E    add         ax,dx
 00607251    cmp         ax,word ptr [ebx+366]
>00607258    jae         006072B3
 0060725A    movzx       edx,word ptr [ebx+35E]
 00607261    cmp         dx,word ptr [ebx+366]
>00607268    jne         0060727D
 0060726A    xor         eax,eax
 0060726C    mov         dword ptr [ebx+398],eax
 00607272    mov         dword ptr [ebx+39C],eax
>00607278    jmp         00607311
 0060727D    movzx       eax,ax
 00607280    movzx       edx,word ptr [ebx+35E]
 00607287    sub         eax,edx
 00607289    imul        eax,eax,44
 0060728C    mov         dword ptr [ebp-74],eax
 0060728F    fild        dword ptr [ebp-74]
 00607292    movzx       eax,word ptr [ebx+366]
 00607299    movzx       edx,word ptr [ebx+35E]
 006072A0    sub         eax,edx
 006072A2    mov         dword ptr [ebp-78],eax
 006072A5    fild        dword ptr [ebp-78]
 006072A8    fdivp       st(1),st
 006072AA    fstp        qword ptr [ebx+398]
 006072B0    wait
>006072B1    jmp         00607311
 006072B3    movzx       edx,word ptr [ebx+36E]
 006072BA    cmp         dx,word ptr [ebx+366]
>006072C1    jne         006072D7
 006072C3    xor         eax,eax
 006072C5    mov         dword ptr [ebx+398],eax
 006072CB    mov         dword ptr [ebx+39C],40510000
>006072D5    jmp         00607311
 006072D7    movzx       eax,ax
 006072DA    movzx       edx,word ptr [ebx+366]
 006072E1    sub         eax,edx
 006072E3    imul        eax,eax,44
 006072E6    mov         dword ptr [ebp-74],eax
 006072E9    fild        dword ptr [ebp-74]
 006072EC    movzx       eax,word ptr [ebx+36E]
 006072F3    movzx       edx,word ptr [ebx+366]
 006072FA    sub         eax,edx
 006072FC    mov         dword ptr [ebp-78],eax
 006072FF    fild        dword ptr [ebp-78]
 00607302    fdivp       st(1),st
 00607304    fadd        dword ptr ds:[607AE8];68:Single
 0060730A    fstp        qword ptr [ebx+398]
 00607310    wait
 00607311    movzx       eax,byte ptr [ebx+3B0]
 00607318    shl         eax,8
 0060731B    movzx       edx,byte ptr [ebx+3B1]
 00607322    add         ax,dx
 00607325    mov         word ptr [ebx+3A0],ax
 0060732C    movzx       eax,byte ptr [ebx+3B2]
 00607333    mov         byte ptr [ebx+3A2],al
>00607339    jmp         0060734D
 0060733B    lea         eax,[ebx+320]
 00607341    xor         ecx,ecx
 00607343    mov         edx,36
 00607348    call        @FillChar
 0060734D    mov         eax,dword ptr [ebp-4]
 00607350    add         eax,0FFFFFFCF
 00607353    cmp         eax,0E
>00607356    ja          0060739C
 00607358    movzx       eax,byte ptr [eax+607366]
 0060735F    jmp         dword ptr [eax*4+607375]
 0060735F    db          1
 0060735F    db          0
 0060735F    db          1
 0060735F    db          0
 0060735F    db          1
 0060735F    db          0
 0060735F    db          1
 0060735F    db          0
 0060735F    db          0
 0060735F    db          0
 0060735F    db          0
 0060735F    db          0
 0060735F    db          0
 0060735F    db          1
 0060735F    db          1
 0060735F    dd          0060739C
 0060735F    dd          0060737D
 0060737D    push        dword ptr [ebx+3C]
 00607380    push        dword ptr [ebx+38]
 00607383    push        dword ptr [ebx+44]
 00607386    push        dword ptr [ebx+40]
 00607389    push        dword ptr [ebx+4C]
 0060738C    push        dword ptr [ebx+48]
 0060738F    push        dword ptr [ebp-2C]
 00607392    push        dword ptr [ebp-30]
 00607395    mov         eax,ebx
 00607397    call        00613DF4
 0060739C    mov         eax,dword ptr [ebp-4]
 0060739F    add         eax,0FFFFFFCD
 006073A2    cmp         eax,0C
>006073A5    ja          00607A97
 006073AB    movzx       eax,byte ptr [eax+6073B9]
 006073B2    jmp         dword ptr [eax*4+6073C6]
 006073B2    db          1
 006073B2    db          0
 006073B2    db          0
 006073B2    db          2
 006073B2    db          3
 006073B2    db          0
 006073B2    db          0
 006073B2    db          0
 006073B2    db          0
 006073B2    db          0
 006073B2    db          0
 006073B2    db          4
 006073B2    db          5
 006073B2    dd          00607A97
 006073B2    dd          006073DE
 006073B2    dd          006074B0
 006073B2    dd          006076BD
 006073B2    dd          006078CA
 006073B2    dd          006079B3
 006073DE    mov         esi,1
 006073E3    lea         eax,[ebx+0BE]
 006073E9    mov         edx,esi
 006073EB    dec         edx
 006073EC    lea         edx,[edx+edx*2]
 006073EF    add         edx,5
 006073F2    mov         ecx,dword ptr [ebp-8]
 006073F5    cmp         byte ptr [ecx+edx],0FF
>006073F9    jne         00607423
 006073FB    mov         edx,esi
 006073FD    dec         edx
 006073FE    lea         edx,[edx+edx*2]
 00607401    add         edx,6
 00607404    mov         ecx,dword ptr [ebp-8]
 00607407    cmp         byte ptr [ecx+edx],0FF
>0060740B    jne         00607423
 0060740D    mov         edx,esi
 0060740F    dec         edx
 00607410    lea         edx,[edx+edx*2]
 00607413    add         edx,7
 00607416    mov         ecx,dword ptr [ebp-8]
 00607419    cmp         byte ptr [ecx+edx],0FF
>0060741D    jne         00607423
 0060741F    xor         edx,edx
>00607421    jmp         00607425
 00607423    mov         dl,1
 00607425    mov         byte ptr [eax],dl
 00607427    test        dl,dl
>00607429    je          0060749E
 0060742B    mov         edx,esi
 0060742D    dec         edx
 0060742E    lea         edx,[edx+edx*2]
 00607431    add         edx,7
 00607434    mov         ecx,dword ptr [ebp-8]
 00607437    movzx       edx,byte ptr [ecx+edx]
 0060743B    and         dl,30
 0060743E    movzx       edx,dl
 00607441    shl         edx,4
 00607444    mov         ecx,esi
 00607446    dec         ecx
 00607447    lea         ecx,[ecx+ecx*2]
 0060744A    add         ecx,5
 0060744D    mov         edi,dword ptr [ebp-8]
 00607450    movzx       ecx,byte ptr [edi+ecx]
 00607454    or          edx,ecx
 00607456    mov         dword ptr [eax-9],edx
 00607459    mov         edx,esi
 0060745B    dec         edx
 0060745C    lea         edx,[edx+edx*2]
 0060745F    add         edx,7
 00607462    mov         ecx,dword ptr [ebp-8]
 00607465    movzx       edx,byte ptr [ecx+edx]
 00607469    and         dl,0C0
 0060746C    movzx       edx,dl
 0060746F    add         edx,edx
 00607471    add         edx,edx
 00607473    mov         ecx,esi
 00607475    dec         ecx
 00607476    lea         ecx,[ecx+ecx*2]
 00607479    add         ecx,6
 0060747C    mov         edi,dword ptr [ebp-8]
 0060747F    movzx       ecx,byte ptr [edi+ecx]
 00607483    or          edx,ecx
 00607485    mov         dword ptr [eax-5],edx
 00607488    mov         edx,esi
 0060748A    dec         edx
 0060748B    lea         edx,[edx+edx*2]
 0060748E    add         edx,7
 00607491    mov         ecx,dword ptr [ebp-8]
 00607494    movzx       edx,byte ptr [ecx+edx]
 00607498    and         dl,0F
 0060749B    mov         byte ptr [eax-1],dl
 0060749E    inc         esi
 0060749F    add         eax,0C
 006074A2    cmp         esi,5
>006074A5    jne         006073E9
>006074AB    jmp         00607A97
 006074B0    mov         eax,dword ptr [ebp-8]
 006074B3    cmp         byte ptr [eax+2],0FF
>006074B7    jne         006074D5
 006074B9    mov         eax,dword ptr [ebp-8]
 006074BC    cmp         byte ptr [eax+3],0FF
>006074C0    jne         006074D5
 006074C2    mov         eax,dword ptr [ebp-8]
 006074C5    movzx       eax,byte ptr [eax+4]
 006074C9    shr         eax,4
 006074CC    cmp         eax,0F
>006074CF    jne         006074D5
 006074D1    xor         eax,eax
>006074D3    jmp         006074D7
 006074D5    mov         al,1
 006074D7    mov         byte ptr [ebx+0BE],al
 006074DD    mov         eax,dword ptr [ebp-8]
 006074E0    cmp         byte ptr [eax+5],0FF
>006074E4    jne         00607500
 006074E6    mov         eax,dword ptr [ebp-8]
 006074E9    cmp         byte ptr [eax+6],0FF
>006074ED    jne         00607500
 006074EF    mov         eax,dword ptr [ebp-8]
 006074F2    movzx       eax,byte ptr [eax+4]
 006074F6    and         al,0F
 006074F8    cmp         al,0F
>006074FA    jne         00607500
 006074FC    xor         eax,eax
>006074FE    jmp         00607502
 00607500    mov         al,1
 00607502    mov         byte ptr [ebx+0CA],al
 00607508    mov         eax,dword ptr [ebp-8]
 0060750B    cmp         byte ptr [eax+7],0FF
>0060750F    jne         0060752D
 00607511    mov         eax,dword ptr [ebp-8]
 00607514    cmp         byte ptr [eax+8],0FF
>00607518    jne         0060752D
 0060751A    mov         eax,dword ptr [ebp-8]
 0060751D    movzx       eax,byte ptr [eax+9]
 00607521    shr         eax,4
 00607524    cmp         eax,0F
>00607527    jne         0060752D
 00607529    xor         eax,eax
>0060752B    jmp         0060752F
 0060752D    mov         al,1
 0060752F    mov         byte ptr [ebx+0D6],al
 00607535    mov         eax,dword ptr [ebp-8]
 00607538    cmp         byte ptr [eax+0A],0FF
>0060753C    jne         00607558
 0060753E    mov         eax,dword ptr [ebp-8]
 00607541    cmp         byte ptr [eax+0B],0FF
>00607545    jne         00607558
 00607547    mov         eax,dword ptr [ebp-8]
 0060754A    movzx       eax,byte ptr [eax+9]
 0060754E    and         al,0F
 00607550    cmp         al,0F
>00607552    jne         00607558
 00607554    xor         eax,eax
>00607556    jmp         0060755A
 00607558    mov         al,1
 0060755A    mov         byte ptr [ebx+0E2],al
 00607560    cmp         byte ptr [ebx+0BE],0
>00607567    je          006075B5
 00607569    mov         byte ptr [ebx+0BD],10
 00607570    mov         byte ptr [ebx+0BF],0FF
 00607577    mov         eax,dword ptr [ebp-8]
 0060757A    movzx       eax,byte ptr [eax+4]
 0060757E    shr         eax,4
 00607581    and         eax,3
 00607584    shl         eax,8
 00607587    mov         edx,dword ptr [ebp-8]
 0060758A    movzx       edx,byte ptr [edx+2]
 0060758E    add         eax,edx
 00607590    mov         dword ptr [ebx+0B5],eax
 00607596    mov         eax,dword ptr [ebp-8]
 00607599    movzx       eax,byte ptr [eax+4]
 0060759D    shr         eax,6
 006075A0    and         eax,3
 006075A3    shl         eax,8
 006075A6    mov         edx,dword ptr [ebp-8]
 006075A9    movzx       edx,byte ptr [edx+3]
 006075AD    add         eax,edx
 006075AF    mov         dword ptr [ebx+0B9],eax
 006075B5    cmp         byte ptr [ebx+0CA],0
>006075BC    je          0060760A
 006075BE    mov         byte ptr [ebx+0C9],10
 006075C5    mov         byte ptr [ebx+0CB],0FF
 006075CC    mov         eax,dword ptr [ebp-8]
 006075CF    movzx       eax,byte ptr [eax+4]
 006075D3    shr         eax,0
 006075D6    and         eax,3
 006075D9    shl         eax,8
 006075DC    mov         edx,dword ptr [ebp-8]
 006075DF    movzx       edx,byte ptr [edx+5]
 006075E3    add         eax,edx
 006075E5    mov         dword ptr [ebx+0C1],eax
 006075EB    mov         eax,dword ptr [ebp-8]
 006075EE    movzx       eax,byte ptr [eax+4]
 006075F2    shr         eax,2
 006075F5    and         eax,3
 006075F8    shl         eax,8
 006075FB    mov         edx,dword ptr [ebp-8]
 006075FE    movzx       edx,byte ptr [edx+6]
 00607602    add         eax,edx
 00607604    mov         dword ptr [ebx+0C5],eax
 0060760A    cmp         byte ptr [ebx+0D6],0
>00607611    je          0060765F
 00607613    mov         byte ptr [ebx+0D5],10
 0060761A    mov         byte ptr [ebx+0D7],0FF
 00607621    mov         eax,dword ptr [ebp-8]
 00607624    movzx       eax,byte ptr [eax+9]
 00607628    shr         eax,4
 0060762B    and         eax,3
 0060762E    shl         eax,8
 00607631    mov         edx,dword ptr [ebp-8]
 00607634    movzx       edx,byte ptr [edx+7]
 00607638    add         eax,edx
 0060763A    mov         dword ptr [ebx+0CD],eax
 00607640    mov         eax,dword ptr [ebp-8]
 00607643    movzx       eax,byte ptr [eax+9]
 00607647    shr         eax,6
 0060764A    and         eax,3
 0060764D    shl         eax,8
 00607650    mov         edx,dword ptr [ebp-8]
 00607653    movzx       edx,byte ptr [edx+8]
 00607657    add         eax,edx
 00607659    mov         dword ptr [ebx+0D1],eax
 0060765F    cmp         byte ptr [ebx+0E2],0
>00607666    je          00607A97
 0060766C    mov         byte ptr [ebx+0E1],10
 00607673    mov         byte ptr [ebx+0E3],0FF
 0060767A    mov         eax,dword ptr [ebp-8]
 0060767D    movzx       eax,byte ptr [eax+9]
 00607681    shr         eax,0
 00607684    and         eax,3
 00607687    shl         eax,8
 0060768A    mov         edx,dword ptr [ebp-8]
 0060768D    movzx       edx,byte ptr [edx+0A]
 00607691    add         eax,edx
 00607693    mov         dword ptr [ebx+0D9],eax
 00607699    mov         eax,dword ptr [ebp-8]
 0060769C    movzx       eax,byte ptr [eax+9]
 006076A0    shr         eax,2
 006076A3    and         eax,3
 006076A6    shl         eax,8
 006076A9    mov         edx,dword ptr [ebp-8]
 006076AC    movzx       edx,byte ptr [edx+0B]
 006076B0    add         eax,edx
 006076B2    mov         dword ptr [ebx+0DD],eax
>006076B8    jmp         00607A97
 006076BD    mov         eax,dword ptr [ebp-8]
 006076C0    cmp         byte ptr [eax+5],0FF
>006076C4    jne         006076E2
 006076C6    mov         eax,dword ptr [ebp-8]
 006076C9    cmp         byte ptr [eax+6],0FF
>006076CD    jne         006076E2
 006076CF    mov         eax,dword ptr [ebp-8]
 006076D2    movzx       eax,byte ptr [eax+7]
 006076D6    shr         eax,4
 006076D9    cmp         eax,0F
>006076DC    jne         006076E2
 006076DE    xor         eax,eax
>006076E0    jmp         006076E4
 006076E2    mov         al,1
 006076E4    mov         byte ptr [ebx+0BE],al
 006076EA    mov         eax,dword ptr [ebp-8]
 006076ED    cmp         byte ptr [eax+8],0FF
>006076F1    jne         0060770D
 006076F3    mov         eax,dword ptr [ebp-8]
 006076F6    cmp         byte ptr [eax+9],0FF
>006076FA    jne         0060770D
 006076FC    mov         eax,dword ptr [ebp-8]
 006076FF    movzx       eax,byte ptr [eax+7]
 00607703    and         al,0F
 00607705    cmp         al,0F
>00607707    jne         0060770D
 00607709    xor         eax,eax
>0060770B    jmp         0060770F
 0060770D    mov         al,1
 0060770F    mov         byte ptr [ebx+0CA],al
 00607715    mov         eax,dword ptr [ebp-8]
 00607718    cmp         byte ptr [eax+0A],0FF
>0060771C    jne         0060773A
 0060771E    mov         eax,dword ptr [ebp-8]
 00607721    cmp         byte ptr [eax+0B],0FF
>00607725    jne         0060773A
 00607727    mov         eax,dword ptr [ebp-8]
 0060772A    movzx       eax,byte ptr [eax+0C]
 0060772E    shr         eax,4
 00607731    cmp         eax,0F
>00607734    jne         0060773A
 00607736    xor         eax,eax
>00607738    jmp         0060773C
 0060773A    mov         al,1
 0060773C    mov         byte ptr [ebx+0D6],al
 00607742    mov         eax,dword ptr [ebp-8]
 00607745    cmp         byte ptr [eax+0D],0FF
>00607749    jne         00607765
 0060774B    mov         eax,dword ptr [ebp-8]
 0060774E    cmp         byte ptr [eax+0E],0FF
>00607752    jne         00607765
 00607754    mov         eax,dword ptr [ebp-8]
 00607757    movzx       eax,byte ptr [eax+0C]
 0060775B    and         al,0F
 0060775D    cmp         al,0F
>0060775F    jne         00607765
 00607761    xor         eax,eax
>00607763    jmp         00607767
 00607765    mov         al,1
 00607767    mov         byte ptr [ebx+0E2],al
 0060776D    cmp         byte ptr [ebx+0BE],0
>00607774    je          006077C2
 00607776    mov         byte ptr [ebx+0BD],10
 0060777D    mov         byte ptr [ebx+0BF],0FF
 00607784    mov         eax,dword ptr [ebp-8]
 00607787    movzx       eax,byte ptr [eax+7]
 0060778B    shr         eax,4
 0060778E    and         eax,3
 00607791    shl         eax,8
 00607794    mov         edx,dword ptr [ebp-8]
 00607797    movzx       edx,byte ptr [edx+5]
 0060779B    add         eax,edx
 0060779D    mov         dword ptr [ebx+0B5],eax
 006077A3    mov         eax,dword ptr [ebp-8]
 006077A6    movzx       eax,byte ptr [eax+7]
 006077AA    shr         eax,6
 006077AD    and         eax,3
 006077B0    shl         eax,8
 006077B3    mov         edx,dword ptr [ebp-8]
 006077B6    movzx       edx,byte ptr [edx+6]
 006077BA    add         eax,edx
 006077BC    mov         dword ptr [ebx+0B9],eax
 006077C2    cmp         byte ptr [ebx+0CA],0
>006077C9    je          00607817
 006077CB    mov         byte ptr [ebx+0C9],10
 006077D2    mov         byte ptr [ebx+0CB],0FF
 006077D9    mov         eax,dword ptr [ebp-8]
 006077DC    movzx       eax,byte ptr [eax+7]
 006077E0    shr         eax,0
 006077E3    and         eax,3
 006077E6    shl         eax,8
 006077E9    mov         edx,dword ptr [ebp-8]
 006077EC    movzx       edx,byte ptr [edx+8]
 006077F0    add         eax,edx
 006077F2    mov         dword ptr [ebx+0C1],eax
 006077F8    mov         eax,dword ptr [ebp-8]
 006077FB    movzx       eax,byte ptr [eax+7]
 006077FF    shr         eax,2
 00607802    and         eax,3
 00607805    shl         eax,8
 00607808    mov         edx,dword ptr [ebp-8]
 0060780B    movzx       edx,byte ptr [edx+9]
 0060780F    add         eax,edx
 00607811    mov         dword ptr [ebx+0C5],eax
 00607817    cmp         byte ptr [ebx+0D6],0
>0060781E    je          0060786C
 00607820    mov         byte ptr [ebx+0D5],10
 00607827    mov         byte ptr [ebx+0D7],0FF
 0060782E    mov         eax,dword ptr [ebp-8]
 00607831    movzx       eax,byte ptr [eax+0C]
 00607835    shr         eax,4
 00607838    and         eax,3
 0060783B    shl         eax,8
 0060783E    mov         edx,dword ptr [ebp-8]
 00607841    movzx       edx,byte ptr [edx+0A]
 00607845    add         eax,edx
 00607847    mov         dword ptr [ebx+0CD],eax
 0060784D    mov         eax,dword ptr [ebp-8]
 00607850    movzx       eax,byte ptr [eax+0C]
 00607854    shr         eax,6
 00607857    and         eax,3
 0060785A    shl         eax,8
 0060785D    mov         edx,dword ptr [ebp-8]
 00607860    movzx       edx,byte ptr [edx+0B]
 00607864    add         eax,edx
 00607866    mov         dword ptr [ebx+0D1],eax
 0060786C    cmp         byte ptr [ebx+0E2],0
>00607873    je          00607A97
 00607879    mov         byte ptr [ebx+0E1],10
 00607880    mov         byte ptr [ebx+0E3],0FF
 00607887    mov         eax,dword ptr [ebp-8]
 0060788A    movzx       eax,byte ptr [eax+0C]
 0060788E    shr         eax,0
 00607891    and         eax,3
 00607894    shl         eax,8
 00607897    mov         edx,dword ptr [ebp-8]
 0060789A    movzx       edx,byte ptr [edx+0D]
 0060789E    add         eax,edx
 006078A0    mov         dword ptr [ebx+0D9],eax
 006078A6    mov         eax,dword ptr [ebp-8]
 006078A9    movzx       eax,byte ptr [eax+0C]
 006078AD    shr         eax,2
 006078B0    and         eax,3
 006078B3    shl         eax,8
 006078B6    mov         edx,dword ptr [ebp-8]
 006078B9    movzx       edx,byte ptr [edx+0E]
 006078BD    add         eax,edx
 006078BF    mov         dword ptr [ebx+0DD],eax
>006078C5    jmp         00607A97
 006078CA    mov         esi,1
 006078CF    lea         eax,[ebx+0BE]
 006078D5    mov         edx,esi
 006078D7    dec         edx
 006078D8    lea         edx,[edx+edx*8]
 006078DB    add         edx,3
 006078DE    mov         ecx,dword ptr [ebp-8]
 006078E1    cmp         byte ptr [ecx+edx],0FF
>006078E5    jne         0060790F
 006078E7    mov         edx,esi
 006078E9    dec         edx
 006078EA    lea         edx,[edx+edx*8]
 006078ED    add         edx,4
 006078F0    mov         ecx,dword ptr [ebp-8]
 006078F3    cmp         byte ptr [ecx+edx],0FF
>006078F7    jne         0060790F
 006078F9    mov         edx,esi
 006078FB    dec         edx
 006078FC    lea         edx,[edx+edx*8]
 006078FF    add         edx,5
 00607902    mov         ecx,dword ptr [ebp-8]
 00607905    cmp         byte ptr [ecx+edx],0FF
>00607909    jne         0060790F
 0060790B    xor         edx,edx
>0060790D    jmp         00607911
 0060790F    mov         dl,1
 00607911    mov         byte ptr [eax],dl
 00607913    test        dl,dl
>00607915    je          006079A1
 0060791B    mov         edx,esi
 0060791D    dec         edx
 0060791E    lea         edx,[edx+edx*8]
 00607921    add         edx,5
 00607924    mov         ecx,dword ptr [ebp-8]
 00607927    movzx       edx,byte ptr [ecx+edx]
 0060792B    and         dl,30
 0060792E    movzx       edx,dl
 00607931    shl         edx,4
 00607934    mov         ecx,esi
 00607936    dec         ecx
 00607937    lea         ecx,[ecx+ecx*8]
 0060793A    add         ecx,3
 0060793D    mov         edi,dword ptr [ebp-8]
 00607940    movzx       ecx,byte ptr [edi+ecx]
 00607944    or          edx,ecx
 00607946    mov         dword ptr [eax-9],edx
 00607949    mov         edx,esi
 0060794B    dec         edx
 0060794C    lea         edx,[edx+edx*8]
 0060794F    add         edx,5
 00607952    mov         ecx,dword ptr [ebp-8]
 00607955    movzx       edx,byte ptr [ecx+edx]
 00607959    and         dl,0C0
 0060795C    movzx       edx,dl
 0060795F    add         edx,edx
 00607961    add         edx,edx
 00607963    mov         ecx,esi
 00607965    dec         ecx
 00607966    lea         ecx,[ecx+ecx*8]
 00607969    add         ecx,4
 0060796C    mov         edi,dword ptr [ebp-8]
 0060796F    movzx       ecx,byte ptr [edi+ecx]
 00607973    or          edx,ecx
 00607975    mov         dword ptr [eax-5],edx
 00607978    mov         edx,esi
 0060797A    dec         edx
 0060797B    lea         edx,[edx+edx*8]
 0060797E    add         edx,5
 00607981    mov         ecx,dword ptr [ebp-8]
 00607984    movzx       edx,byte ptr [ecx+edx]
 00607988    and         dl,0F
 0060798B    mov         byte ptr [eax-1],dl
 0060798E    mov         edx,esi
 00607990    dec         edx
 00607991    lea         edx,[edx+edx*8]
 00607994    add         edx,0B
 00607997    mov         ecx,dword ptr [ebp-8]
 0060799A    movzx       edx,byte ptr [ecx+edx]
 0060799E    mov         byte ptr [eax+1],dl
 006079A1    inc         esi
 006079A2    add         eax,0C
 006079A5    cmp         esi,3
>006079A8    jne         006078D5
>006079AE    jmp         00607A97
 006079B3    mov         esi,1
 006079B8    lea         eax,[ebx+0D6]
 006079BE    mov         edx,esi
 006079C0    dec         edx
 006079C1    lea         edx,[edx+edx*8]
 006079C4    add         edx,3
 006079C7    mov         ecx,dword ptr [ebp-8]
 006079CA    cmp         byte ptr [ecx+edx],0FF
>006079CE    jne         006079F8
 006079D0    mov         edx,esi
 006079D2    dec         edx
 006079D3    lea         edx,[edx+edx*8]
 006079D6    add         edx,4
 006079D9    mov         ecx,dword ptr [ebp-8]
 006079DC    cmp         byte ptr [ecx+edx],0FF
>006079E0    jne         006079F8
 006079E2    mov         edx,esi
 006079E4    dec         edx
 006079E5    lea         edx,[edx+edx*8]
 006079E8    add         edx,5
 006079EB    mov         ecx,dword ptr [ebp-8]
 006079EE    cmp         byte ptr [ecx+edx],0FF
>006079F2    jne         006079F8
 006079F4    xor         edx,edx
>006079F6    jmp         006079FA
 006079F8    mov         dl,1
 006079FA    mov         byte ptr [eax],dl
 006079FC    test        dl,dl
>006079FE    je          00607A8A
 00607A04    mov         edx,esi
 00607A06    dec         edx
 00607A07    lea         edx,[edx+edx*8]
 00607A0A    add         edx,5
 00607A0D    mov         ecx,dword ptr [ebp-8]
 00607A10    movzx       edx,byte ptr [ecx+edx]
 00607A14    and         dl,30
 00607A17    movzx       edx,dl
 00607A1A    shl         edx,4
 00607A1D    mov         ecx,esi
 00607A1F    dec         ecx
 00607A20    lea         ecx,[ecx+ecx*8]
 00607A23    add         ecx,3
 00607A26    mov         edi,dword ptr [ebp-8]
 00607A29    movzx       ecx,byte ptr [edi+ecx]
 00607A2D    or          edx,ecx
 00607A2F    mov         dword ptr [eax-9],edx
 00607A32    mov         edx,esi
 00607A34    dec         edx
 00607A35    lea         edx,[edx+edx*8]
 00607A38    add         edx,5
 00607A3B    mov         ecx,dword ptr [ebp-8]
 00607A3E    movzx       edx,byte ptr [ecx+edx]
 00607A42    and         dl,0C0
 00607A45    movzx       edx,dl
 00607A48    add         edx,edx
 00607A4A    add         edx,edx
 00607A4C    mov         ecx,esi
 00607A4E    dec         ecx
 00607A4F    lea         ecx,[ecx+ecx*8]
 00607A52    add         ecx,4
 00607A55    mov         edi,dword ptr [ebp-8]
 00607A58    movzx       ecx,byte ptr [edi+ecx]
 00607A5C    or          edx,ecx
 00607A5E    mov         dword ptr [eax-5],edx
 00607A61    mov         edx,esi
 00607A63    dec         edx
 00607A64    lea         edx,[edx+edx*8]
 00607A67    add         edx,5
 00607A6A    mov         ecx,dword ptr [ebp-8]
 00607A6D    movzx       edx,byte ptr [ecx+edx]
 00607A71    and         dl,0F
 00607A74    mov         byte ptr [eax-1],dl
 00607A77    mov         edx,esi
 00607A79    dec         edx
 00607A7A    lea         edx,[edx+edx*8]
 00607A7D    add         edx,0B
 00607A80    mov         ecx,dword ptr [ebp-8]
 00607A83    movzx       edx,byte ptr [ecx+edx]
 00607A87    mov         byte ptr [eax+1],dl
 00607A8A    inc         esi
 00607A8B    add         eax,0C
 00607A8E    cmp         esi,3
>00607A91    jne         006079BE
 00607A97    cmp         byte ptr ds:[817996],0;gvar_00817996
>00607A9E    je          00607AA7
 00607AA0    mov         eax,ebx
 00607AA2    call        0061408C
 00607AA7    pop         edi
 00607AA8    pop         esi
 00607AA9    pop         ebx
 00607AAA    mov         esp,ebp
 00607AAC    pop         ebp
 00607AAD    ret         4
end;*}

//00607AEC
{*procedure sub_00607AEC(?:?; ?:?; ?:?);
begin
 00607AEC    push        ebp
 00607AED    mov         ebp,esp
 00607AEF    push        ebx
 00607AF0    mov         ebx,eax
 00607AF2    movzx       eax,byte ptr [ecx+2]
 00607AF6    mov         byte ptr [ebx+9B],al
 00607AFC    movzx       eax,byte ptr [ecx+5]
 00607B00    mov         byte ptr [ebx+9E],al
 00607B06    test        byte ptr [ebx+9B],2
>00607B0D    jne         00607B69
 00607B0F    cmp         byte ptr [ebx+9C],2
>00607B16    jne         00607B32
 00607B18    cmp         byte ptr [ebx+9D],1
>00607B1F    jne         00607B32
 00607B21    call        00600EA0
 00607B26    fstp        qword ptr [ebx+280]
 00607B2C    wait
>00607B2D    jmp         00607C10
 00607B32    mov         byte ptr [ebx+9C],0
 00607B39    mov         byte ptr [ebx+9D],0
 00607B40    lea         eax,[ebx+288]
 00607B46    xor         ecx,ecx
 00607B48    mov         edx,98
 00607B4D    call        @FillChar
 00607B52    lea         eax,[ebx+320]
 00607B58    xor         ecx,ecx
 00607B5A    mov         edx,36
 00607B5F    call        @FillChar
>00607B64    jmp         00607C10
 00607B69    cmp         byte ptr [ebx+9C],2
>00607B70    jne         00607BB9
 00607B72    cmp         byte ptr [ebx+9D],1
>00607B79    jne         00607BB9
 00607B7B    call        00600EA0
 00607B80    fsub        qword ptr [ebx+280]
 00607B86    fcomp       dword ptr ds:[607C1C];5:Single
 00607B8C    wait
 00607B8D    fnstsw      al
 00607B8F    sahf
>00607B90    jae         00607BB9
 00607B92    xor         eax,eax
 00607B94    mov         dword ptr [ebx+280],eax
 00607B9A    mov         dword ptr [ebx+284],eax
 00607BA0    cmp         byte ptr ds:[817997],0;gvar_00817997
>00607BA7    je          00607C10
 00607BA9    mov         eax,ebx
 00607BAB    call        0060911C
 00607BB0    mov         eax,ebx
 00607BB2    call        00608B04
>00607BB7    jmp         00607C10
 00607BB9    xor         eax,eax
 00607BBB    mov         dword ptr [ebx+280],eax
 00607BC1    mov         dword ptr [ebx+284],eax
 00607BC7    mov         byte ptr [ebx+9C],1
 00607BCE    mov         byte ptr [ebx+9D],1
 00607BD5    lea         eax,[ebx+288]
 00607BDB    xor         ecx,ecx
 00607BDD    mov         edx,98
 00607BE2    call        @FillChar
 00607BE7    lea         eax,[ebx+320]
 00607BED    xor         ecx,ecx
 00607BEF    mov         edx,36
 00607BF4    call        @FillChar
 00607BF9    cmp         byte ptr ds:[817997],0;gvar_00817997
>00607C00    je          00607C10
 00607C02    mov         eax,ebx
 00607C04    call        0060911C
 00607C09    mov         eax,ebx
 00607C0B    call        00608B04
 00607C10    mov         eax,ebx
 00607C12    call        006087BC
 00607C17    pop         ebx
 00607C18    pop         ebp
 00607C19    ret         4
end;*}

//00607C20
{*procedure sub_00607C20(?:?);
begin
 00607C20    push        ebp
 00607C21    mov         ebp,esp
 00607C23    push        ecx
 00607C24    push        ebx
 00607C25    mov         byte ptr [eax+2B],0
 00607C29    xor         edx,edx
 00607C2B    mov         dword ptr [eax+30],edx
 00607C2E    mov         dword ptr [eax+34],edx
 00607C31    cmp         byte ptr [eax+28],0
>00607C35    je          00607CF1
 00607C3B    movzx       edx,byte ptr [ecx+5]
 00607C3F    mov         ebx,80
 00607C44    sub         ebx,edx
 00607C46    mov         dword ptr [ebp-4],ebx
 00607C49    fild        dword ptr [ebp-4]
 00607C4C    fstp        qword ptr [eax+68]
 00607C4F    wait
 00607C50    mov         edx,dword ptr [eax+68]
 00607C53    mov         dword ptr [eax+80],edx
 00607C59    mov         edx,dword ptr [eax+6C]
 00607C5C    mov         dword ptr [eax+84],edx
 00607C62    movzx       edx,byte ptr [ecx+7]
 00607C66    sub         edx,80
 00607C6C    mov         dword ptr [ebp-4],edx
 00607C6F    fild        dword ptr [ebp-4]
 00607C72    fstp        qword ptr [eax+58]
 00607C75    wait
 00607C76    mov         edx,dword ptr [eax+58]
 00607C79    mov         dword ptr [eax+88],edx
 00607C7F    mov         edx,dword ptr [eax+5C]
 00607C82    mov         dword ptr [eax+8C],edx
 00607C88    movzx       edx,byte ptr [ecx+6]
 00607C8C    mov         ebx,80
 00607C91    sub         ebx,edx
 00607C93    mov         dword ptr [ebp-4],ebx
 00607C96    fild        dword ptr [ebp-4]
 00607C99    fstp        qword ptr [eax+60]
 00607C9C    wait
 00607C9D    mov         edx,dword ptr [eax+60]
 00607CA0    mov         dword ptr [eax+78],edx
 00607CA3    mov         edx,dword ptr [eax+64]
 00607CA6    mov         dword ptr [eax+7C],edx
 00607CA9    movzx       edx,byte ptr [ecx+9]
 00607CAD    movzx       ebx,byte ptr [ecx+5]
 00607CB1    sub         edx,ebx
 00607CB3    mov         dword ptr [ebp-4],edx
 00607CB6    fild        dword ptr [ebp-4]
 00607CB9    fadd        qword ptr [eax+68]
 00607CBC    fstp        qword ptr [eax+50]
 00607CBF    wait
 00607CC0    movzx       edx,byte ptr [ecx+0B]
 00607CC4    movzx       ebx,byte ptr [ecx+7]
 00607CC8    sub         edx,ebx
 00607CCA    mov         dword ptr [ebp-4],edx
 00607CCD    fild        dword ptr [ebp-4]
 00607CD0    fadd        qword ptr [eax+58]
 00607CD3    fstp        qword ptr [eax+70]
 00607CD6    wait
 00607CD7    movzx       edx,byte ptr [ecx+0A]
 00607CDB    movzx       ecx,byte ptr [ecx+6]
 00607CDF    sub         edx,ecx
 00607CE1    mov         dword ptr [ebp-4],edx
 00607CE4    fild        dword ptr [ebp-4]
 00607CE7    fadd        qword ptr [eax+60]
 00607CEA    fstp        qword ptr [eax+90]
 00607CF0    wait
 00607CF1    cmp         byte ptr ds:[817997],0;gvar_00817997
>00607CF8    je          00607CFF
 00607CFA    call        00608B04
 00607CFF    pop         ebx
 00607D00    pop         ecx
 00607D01    pop         ebp
 00607D02    ret         4
end;*}

//00607D08
{*procedure sub_00607D08(?:?; ?:?; ?:?);
begin
 00607D08    push        ebp
 00607D09    mov         ebp,esp
 00607D0B    add         esp,0FFFFFFE8
 00607D0E    push        ebx
 00607D0F    push        esi
 00607D10    push        edi
 00607D11    mov         edi,ecx
 00607D13    mov         esi,eax
 00607D15    movzx       eax,byte ptr [esi+9C]
 00607D1C    cmp         al,2
>00607D1E    je          00607D28
 00607D20    cmp         al,1
>00607D22    jne         00607E84
 00607D28    movzx       edx,byte ptr [esi+9A]
 00607D2F    movzx       eax,byte ptr [edi+5]
 00607D33    call        006085F4
 00607D38    movzx       eax,al
 00607D3B    mov         dword ptr [ebp-18],eax
 00607D3E    fild        dword ptr [ebp-18]
 00607D41    fstp        qword ptr [esi+2A0]
 00607D47    wait
 00607D48    movzx       edx,byte ptr [esi+9A]
 00607D4F    movzx       eax,byte ptr [edi+6]
 00607D53    call        006085F4
 00607D58    movzx       eax,al
 00607D5B    mov         dword ptr [ebp-18],eax
 00607D5E    fild        dword ptr [ebp-18]
 00607D61    fstp        qword ptr [esi+2B0]
 00607D67    wait
 00607D68    movzx       edx,byte ptr [esi+9A]
 00607D6F    movzx       eax,byte ptr [edi+7]
 00607D73    call        006085F4
 00607D78    movzx       eax,al
 00607D7B    mov         dword ptr [ebp-18],eax
 00607D7E    fild        dword ptr [ebp-18]
 00607D81    fstp        qword ptr [esi+2A8]
 00607D87    wait
 00607D88    movzx       edx,byte ptr [esi+9A]
 00607D8F    movzx       eax,byte ptr [edi+9]
 00607D93    call        006085F4
 00607D98    movzx       eax,al
 00607D9B    mov         dword ptr [ebp-18],eax
 00607D9E    fild        dword ptr [ebp-18]
 00607DA1    fstp        qword ptr [esi+2B8]
 00607DA7    wait
 00607DA8    movzx       edx,byte ptr [esi+9A]
 00607DAF    movzx       eax,byte ptr [edi+0A]
 00607DB3    call        006085F4
 00607DB8    movzx       eax,al
 00607DBB    mov         dword ptr [ebp-18],eax
 00607DBE    fild        dword ptr [ebp-18]
 00607DC1    fstp        qword ptr [esi+2C8]
 00607DC7    wait
 00607DC8    movzx       edx,byte ptr [esi+9A]
 00607DCF    movzx       eax,byte ptr [edi+0B]
 00607DD3    call        006085F4
 00607DD8    movzx       eax,al
 00607DDB    mov         dword ptr [ebp-18],eax
 00607DDE    fild        dword ptr [ebp-18]
 00607DE1    fstp        qword ptr [esi+2C0]
 00607DE7    wait
 00607DE8    movzx       edx,byte ptr [esi+9A]
 00607DEF    movzx       eax,byte ptr [edi+0D]
 00607DF3    call        006085F4
 00607DF8    movzx       eax,al
 00607DFB    mov         word ptr [esi+2D8],ax
 00607E02    movzx       edx,byte ptr [esi+9A]
 00607E09    movzx       eax,byte ptr [edi+0E]
 00607E0D    call        006085F4
 00607E12    movzx       eax,al
 00607E15    mov         word ptr [esi+2DC],ax
 00607E1C    movzx       edx,byte ptr [esi+9A]
 00607E23    movzx       eax,byte ptr [edi+0F]
 00607E27    call        006085F4
 00607E2C    movzx       eax,al
 00607E2F    mov         word ptr [esi+2D4],ax
 00607E36    movzx       edx,byte ptr [esi+9A]
 00607E3D    movzx       eax,byte ptr [edi+10]
 00607E41    call        006085F4
 00607E46    movzx       eax,al
 00607E49    mov         word ptr [esi+2DA],ax
 00607E50    movzx       edx,byte ptr [esi+9A]
 00607E57    movzx       eax,byte ptr [edi+11]
 00607E5B    call        006085F4
 00607E60    movzx       eax,al
 00607E63    mov         word ptr [esi+2DE],ax
 00607E6A    movzx       edx,byte ptr [esi+9A]
 00607E71    movzx       eax,byte ptr [edi+12]
 00607E75    call        006085F4
 00607E7A    movzx       eax,al
 00607E7D    mov         word ptr [esi+2D6],ax
 00607E84    movzx       eax,byte ptr [esi+9C]
 00607E8B    cmp         al,3
>00607E8D    je          00607E97
 00607E8F    cmp         al,1
>00607E91    jne         00607FCF
 00607E97    movzx       edx,byte ptr [esi+9A]
 00607E9E    movzx       eax,byte ptr [edi+5]
 00607EA2    call        006085F4
 00607EA7    movzx       eax,al
 00607EAA    mov         word ptr [esi+32C],ax
 00607EB1    movzx       edx,byte ptr [esi+9A]
 00607EB8    movzx       eax,byte ptr [edi+6]
 00607EBC    call        006085F4
 00607EC1    movzx       eax,al
 00607EC4    mov         word ptr [esi+328],ax
 00607ECB    movzx       edx,byte ptr [esi+9A]
 00607ED2    movzx       eax,byte ptr [edi+7]
 00607ED6    call        006085F4
 00607EDB    movzx       eax,al
 00607EDE    mov         word ptr [esi+324],ax
 00607EE5    movzx       edx,byte ptr [esi+9A]
 00607EEC    movzx       eax,byte ptr [edi+8]
 00607EF0    call        006085F4
 00607EF5    movzx       eax,al
 00607EF8    mov         word ptr [esi+32E],ax
 00607EFF    movzx       edx,byte ptr [esi+9A]
 00607F06    movzx       eax,byte ptr [edi+9]
 00607F0A    call        006085F4
 00607F0F    movzx       eax,al
 00607F12    mov         word ptr [esi+32A],ax
 00607F19    movzx       edx,byte ptr [esi+9A]
 00607F20    movzx       eax,byte ptr [edi+0A]
 00607F24    call        006085F4
 00607F29    movzx       eax,al
 00607F2C    mov         word ptr [esi+326],ax
 00607F33    movzx       edx,byte ptr [esi+9A]
 00607F3A    movzx       eax,byte ptr [edi+0B]
 00607F3E    call        006085F4
 00607F43    movzx       eax,al
 00607F46    mov         word ptr [esi+33C],ax
 00607F4D    movzx       edx,byte ptr [esi+9A]
 00607F54    movzx       eax,byte ptr [edi+0C]
 00607F58    call        006085F4
 00607F5D    movzx       eax,al
 00607F60    mov         word ptr [esi+338],ax
 00607F67    movzx       edx,byte ptr [esi+9A]
 00607F6E    movzx       eax,byte ptr [edi+0D]
 00607F72    call        006085F4
 00607F77    movzx       eax,al
 00607F7A    mov         word ptr [esi+334],ax
 00607F81    movzx       edx,byte ptr [esi+9A]
 00607F88    movzx       eax,byte ptr [edi+0E]
 00607F8C    call        006085F4
 00607F91    movzx       eax,al
 00607F94    mov         word ptr [esi+33E],ax
 00607F9B    movzx       edx,byte ptr [esi+9A]
 00607FA2    movzx       eax,byte ptr [edi+0F]
 00607FA6    call        006085F4
 00607FAB    movzx       eax,al
 00607FAE    mov         word ptr [esi+33A],ax
 00607FB5    movzx       edx,byte ptr [esi+9A]
 00607FBC    movzx       eax,byte ptr [edi+10]
 00607FC0    call        006085F4
 00607FC5    movzx       eax,al
 00607FC8    mov         word ptr [esi+336],ax
 00607FCF    movzx       eax,byte ptr [esi+9C]
 00607FD6    cmp         al,6
>00607FD8    je          00607FE2
 00607FDA    cmp         al,1
>00607FDC    jne         006080EE
 00607FE2    xor         eax,eax
 00607FE4    mov         dword ptr [ebp-4],eax
 00607FE7    lea         eax,[esi+358]
 00607FED    mov         dword ptr [ebp-8],eax
 00607FF0    xor         ebx,ebx
 00607FF2    mov         eax,dword ptr [ebp-8]
 00607FF5    mov         dword ptr [ebp-0C],eax
 00607FF8    mov         eax,dword ptr [ebp-4]
 00607FFB    add         eax,eax
 00607FFD    add         eax,eax
 00607FFF    add         eax,eax
 00608001    add         eax,5
 00608004    mov         edx,ebx
 00608006    add         edx,edx
 00608008    add         eax,edx
 0060800A    movzx       eax,byte ptr [edi+eax]
 0060800E    movzx       edx,byte ptr [esi+9A]
 00608015    call        006085F4
 0060801A    movzx       eax,al
 0060801D    shl         eax,8
 00608020    push        eax
 00608021    mov         eax,dword ptr [ebp-4]
 00608024    add         eax,eax
 00608026    add         eax,eax
 00608028    add         eax,eax
 0060802A    add         eax,6
 0060802D    mov         edx,ebx
 0060802F    add         edx,edx
 00608031    add         eax,edx
 00608033    movzx       eax,byte ptr [edi+eax]
 00608037    movzx       edx,byte ptr [esi+9A]
 0060803E    call        006085F4
 00608043    movzx       eax,al
 00608046    pop         edx
 00608047    add         dx,ax
 0060804A    mov         eax,dword ptr [ebp-0C]
 0060804D    mov         word ptr [eax],dx
 00608050    inc         ebx
 00608051    add         dword ptr [ebp-0C],2
 00608055    cmp         ebx,4
>00608058    jne         00607FF8
 0060805A    inc         dword ptr [ebp-4]
 0060805D    add         dword ptr [ebp-8],8
 00608061    cmp         dword ptr [ebp-4],1
>00608065    jne         00607FF0
 00608067    mov         dword ptr [ebp-4],1
 0060806E    lea         eax,[esi+360]
 00608074    mov         dword ptr [ebp-10],eax
 00608077    xor         ebx,ebx
 00608079    mov         eax,dword ptr [ebp-10]
 0060807C    mov         dword ptr [ebp-14],eax
 0060807F    mov         eax,dword ptr [ebp-4]
 00608082    add         eax,eax
 00608084    add         eax,eax
 00608086    add         eax,eax
 00608088    add         eax,5
 0060808B    mov         edx,ebx
 0060808D    add         edx,edx
 0060808F    add         eax,edx
 00608091    movzx       eax,byte ptr [edi+eax]
 00608095    movzx       edx,byte ptr [esi+9A]
 0060809C    call        006085F4
 006080A1    movzx       eax,al
 006080A4    shl         eax,8
 006080A7    push        eax
 006080A8    mov         eax,dword ptr [ebp-4]
 006080AB    add         eax,eax
 006080AD    add         eax,eax
 006080AF    add         eax,eax
 006080B1    add         eax,6
 006080B4    mov         edx,ebx
 006080B6    add         edx,edx
 006080B8    add         eax,edx
 006080BA    movzx       eax,byte ptr [edi+eax]
 006080BE    movzx       edx,byte ptr [esi+9A]
 006080C5    call        006085F4
 006080CA    movzx       eax,al
 006080CD    pop         edx
 006080CE    add         dx,ax
 006080D1    mov         eax,dword ptr [ebp-14]
 006080D4    mov         word ptr [eax],dx
 006080D7    inc         ebx
 006080D8    add         dword ptr [ebp-14],2
 006080DC    cmp         ebx,2
>006080DF    jne         0060807F
 006080E1    inc         dword ptr [ebp-4]
 006080E4    add         dword ptr [ebp-10],8
 006080E8    cmp         dword ptr [ebp-4],2
>006080EC    jne         00608077
 006080EE    pop         edi
 006080EF    pop         esi
 006080F0    pop         ebx
 006080F1    mov         esp,ebp
 006080F3    pop         ebp
 006080F4    ret         4
end;*}

//006080F8
{*procedure sub_006080F8(?:?; ?:?; ?:?);
begin
 006080F8    push        ebp
 006080F9    mov         ebp,esp
 006080FB    add         esp,0FFFFFFF0
 006080FE    push        ebx
 006080FF    push        esi
 00608100    push        edi
 00608101    mov         dword ptr [ebp-8],ecx
 00608104    mov         dword ptr [ebp-4],eax
 00608107    mov         eax,dword ptr [ebp-4]
 0060810A    movzx       eax,byte ptr [eax+9C]
 00608111    cmp         al,6
>00608113    je          00608120
 00608115    mov         edx,dword ptr [ebp-4]
 00608118    cmp         al,1
>0060811A    jne         00608235
 00608120    mov         esi,1
 00608125    mov         eax,dword ptr [ebp-4]
 00608128    add         eax,364
 0060812D    mov         dword ptr [ebp-0C],eax
 00608130    mov         ebx,2
 00608135    mov         eax,dword ptr [ebp-0C]
 00608138    mov         edi,eax
 0060813A    mov         eax,esi
 0060813C    add         eax,eax
 0060813E    add         eax,eax
 00608140    add         eax,eax
 00608142    inc         eax
 00608143    mov         edx,ebx
 00608145    add         edx,edx
 00608147    add         eax,edx
 00608149    mov         edx,dword ptr [ebp-8]
 0060814C    movzx       eax,byte ptr [edx+eax-8]
 00608151    mov         edx,dword ptr [ebp-4]
 00608154    movzx       edx,byte ptr [edx+9A]
 0060815B    call        006085F4
 00608160    movzx       eax,al
 00608163    shl         eax,8
 00608166    push        eax
 00608167    mov         eax,esi
 00608169    add         eax,eax
 0060816B    add         eax,eax
 0060816D    add         eax,eax
 0060816F    add         eax,2
 00608172    mov         edx,ebx
 00608174    add         edx,edx
 00608176    add         eax,edx
 00608178    mov         edx,dword ptr [ebp-8]
 0060817B    movzx       eax,byte ptr [edx+eax-8]
 00608180    mov         edx,dword ptr [ebp-4]
 00608183    movzx       edx,byte ptr [edx+9A]
 0060818A    call        006085F4
 0060818F    movzx       eax,al
 00608192    pop         edx
 00608193    add         dx,ax
 00608196    mov         word ptr [edi],dx
 00608199    inc         ebx
 0060819A    add         edi,2
 0060819D    cmp         ebx,4
>006081A0    jne         0060813A
 006081A2    inc         esi
 006081A3    add         dword ptr [ebp-0C],8
 006081A7    cmp         esi,2
>006081AA    jne         00608130
 006081AC    mov         esi,2
 006081B1    mov         eax,dword ptr [ebp-4]
 006081B4    add         eax,368
 006081B9    mov         dword ptr [ebp-10],eax
 006081BC    xor         ebx,ebx
 006081BE    mov         eax,dword ptr [ebp-10]
 006081C1    mov         edi,eax
 006081C3    mov         eax,esi
 006081C5    add         eax,eax
 006081C7    add         eax,eax
 006081C9    add         eax,eax
 006081CB    inc         eax
 006081CC    mov         edx,ebx
 006081CE    add         edx,edx
 006081D0    add         eax,edx
 006081D2    mov         edx,dword ptr [ebp-8]
 006081D5    movzx       eax,byte ptr [edx+eax-8]
 006081DA    mov         edx,dword ptr [ebp-4]
 006081DD    movzx       edx,byte ptr [edx+9A]
 006081E4    call        006085F4
 006081E9    movzx       eax,al
 006081EC    shl         eax,8
 006081EF    push        eax
 006081F0    mov         eax,esi
 006081F2    add         eax,eax
 006081F4    add         eax,eax
 006081F6    add         eax,eax
 006081F8    add         eax,2
 006081FB    mov         edx,ebx
 006081FD    add         edx,edx
 006081FF    add         eax,edx
 00608201    mov         edx,dword ptr [ebp-8]
 00608204    movzx       eax,byte ptr [edx+eax-8]
 00608209    mov         edx,dword ptr [ebp-4]
 0060820C    movzx       edx,byte ptr [edx+9A]
 00608213    call        006085F4
 00608218    movzx       eax,al
 0060821B    pop         edx
 0060821C    add         dx,ax
 0060821F    mov         word ptr [edi],dx
 00608222    inc         ebx
 00608223    add         edi,2
 00608226    cmp         ebx,4
>00608229    jne         006081C3
 0060822B    inc         esi
 0060822C    add         dword ptr [ebp-10],8
 00608230    cmp         esi,3
>00608233    jne         006081BC
 00608235    pop         edi
 00608236    pop         esi
 00608237    pop         ebx
 00608238    mov         esp,ebp
 0060823A    pop         ebp
 0060823B    ret         4
end;*}

//00608240
{*procedure sub_00608240(?:?; ?:?; ?:?);
begin
 00608240    push        ebp
 00608241    mov         ebp,esp
 00608243    push        ebx
 00608244    push        esi
 00608245    mov         ebx,ecx
 00608247    mov         esi,eax
 00608249    cmp         byte ptr [ebx+13],0FF
>0060824D    jne         0060826E
 0060824F    cmp         byte ptr [ebx+14],0FF
>00608253    jne         0060826E
 00608255    mov         dl,1
 00608257    mov         eax,5
 0060825C    cmp         byte ptr [ebx+eax],0FF
>00608260    je          00608266
 00608262    xor         edx,edx
>00608264    jmp         00608295
 00608266    inc         eax
 00608267    cmp         eax,13
>0060826A    jne         0060825C
>0060826C    jmp         00608295
 0060826E    cmp         byte ptr [ebx+13],0
>00608272    jne         00608293
 00608274    cmp         byte ptr [ebx+14],0
>00608278    jne         00608293
 0060827A    mov         dl,1
 0060827C    mov         eax,5
 00608281    cmp         byte ptr [ebx+eax],0
>00608285    je          0060828B
 00608287    xor         edx,edx
>00608289    jmp         00608295
 0060828B    inc         eax
 0060828C    cmp         eax,13
>0060828F    jne         00608281
>00608291    jmp         00608295
 00608293    xor         edx,edx
 00608295    test        dl,dl
>00608297    je          006082D7
 00608299    mov         byte ptr [esi+9A],1
 006082A0    mov         byte ptr [esi+9C],2
 006082A7    mov         byte ptr [esi+9D],1
 006082AE    lea         eax,[esi+288]
 006082B4    xor         ecx,ecx
 006082B6    mov         edx,98
 006082BB    call        @FillChar
 006082C0    lea         eax,[esi+320]
 006082C6    xor         ecx,ecx
 006082C8    mov         edx,36
 006082CD    call        @FillChar
>006082D2    jmp         0060835A
 006082D7    cmp         byte ptr [ebx+11],0A4
 006082DB    sete        al
 006082DE    mov         byte ptr [esi+9A],al
 006082E4    movzx       edx,byte ptr [esi+9A]
 006082EB    movzx       eax,byte ptr [ebx+13]
 006082EF    call        006085F4
 006082F4    add         al,2
 006082F6    mov         byte ptr [esi+9C],al
 006082FC    movzx       edx,byte ptr [esi+9A]
 00608303    movzx       eax,byte ptr [ebx+14]
 00608307    call        006085F4
 0060830C    add         al,2
 0060830E    mov         byte ptr [esi+9D],al
 00608314    lea         eax,[esi+288]
 0060831A    xor         ecx,ecx
 0060831C    mov         edx,98
 00608321    call        @FillChar
 00608326    lea         eax,[esi+320]
 0060832C    xor         ecx,ecx
 0060832E    mov         edx,36
 00608333    call        @FillChar
 00608338    cmp         byte ptr [esi+9C],6
>0060833F    jne         00608353
 00608341    mov         eax,esi
 00608343    mov         dl,34
 00608345    call        00608600
 0060834A    mov         eax,esi
 0060834C    call        00608BEC
>00608351    jmp         0060835A
 00608353    mov         eax,esi
 00608355    call        00608B78
 0060835A    pop         esi
 0060835B    pop         ebx
 0060835C    pop         ebp
 0060835D    ret         4
end;*}

//00608360
{*procedure sub_00608360(?:?; ?:?; ?:?);
begin
 00608360    push        ebp
 00608361    mov         ebp,esp
 00608363    push        0
 00608365    push        ebx
 00608366    mov         ebx,ecx
 00608368    xor         eax,eax
 0060836A    push        ebp
 0060836B    push        6083F3
 00608370    push        dword ptr fs:[eax]
 00608373    mov         dword ptr fs:[eax],esp
 00608376    movzx       ecx,byte ptr [ebx+2]
 0060837A    shr         ecx,4
 0060837D    inc         ecx
 0060837E    mov         edx,dword ptr ds:[78CDD4];^gvar_00822CBC
 00608384    mov         edx,dword ptr [edx]
 00608386    lea         eax,[ebx+5]
 00608389    call        Move
 0060838E    mov         eax,[0078CDD4];^gvar_00822CBC
 00608393    add         dword ptr [eax],20
 00608396    cmp         byte ptr [ebx+2],30
>0060839A    jne         006083DD
 0060839C    mov         byte ptr ds:[81799B],0;gvar_0081799B
 006083A3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006083A8    mov         eax,dword ptr [eax]
 006083AA    mov         eax,dword ptr [eax+564]
 006083B0    xor         edx,edx
 006083B2    call        TThreadedTimer.SetEnabled
 006083B7    lea         edx,[ebp-4]
 006083BA    mov         eax,60840C;'Miis Saved'
 006083BF    call        00576000
 006083C4    mov         eax,dword ptr [ebp-4]
 006083C7    call        0074C108
 006083CC    call        00764A54
 006083D1    mov         eax,[0078CDB4];^gvar_00822CB8:Pointer
 006083D6    mov         eax,dword ptr [eax]
 006083D8    call        @FreeMem
 006083DD    xor         eax,eax
 006083DF    pop         edx
 006083E0    pop         ecx
 006083E1    pop         ecx
 006083E2    mov         dword ptr fs:[eax],edx
 006083E5    push        6083FA
 006083EA    lea         eax,[ebp-4]
 006083ED    call        @UStrClr
 006083F2    ret
>006083F3    jmp         @HandleFinally
>006083F8    jmp         006083EA
 006083FA    pop         ebx
 006083FB    pop         ecx
 006083FC    pop         ebp
 006083FD    ret         4
end;*}

//00608424
procedure sub_00608424;
begin
{*
 00608424    push        ebp
 00608425    mov         ebp,esp
 00608427    pop         ebp
 00608428    ret         4
*}
end;

//0060842C
{*procedure sub_0060842C(?:?; ?:?; ?:Pointer; ?:?);
begin
 0060842C    push        ebp
 0060842D    mov         ebp,esp
 0060842F    push        ebx
 00608430    push        esi
 00608431    push        edi
 00608432    mov         edi,ecx
 00608434    mov         ebx,edx
 00608436    mov         esi,eax
 00608438    mov         byte ptr [esi+0B],1
 0060843C    cmp         ebx,30
>0060843F    je          00608445
 00608441    mov         byte ptr [esi+9],1
 00608445    cmp         ebx,30
>00608448    jl          00608463
 0060844A    cmp         ebx,3F
>0060844D    jg          00608463
 0060844F    mov         eax,dword ptr [ebp+8]
 00608452    push        eax
 00608453    mov         eax,esi
 00608455    mov         ecx,edi
 00608457    mov         edx,ebx
 00608459    call        00606698
>0060845E    jmp         0060857B
 00608463    cmp         ebx,20
>00608466    jne         0060847C
 00608468    mov         eax,dword ptr [ebp+8]
 0060846B    push        eax
 0060846C    mov         eax,esi
 0060846E    mov         ecx,edi
 00608470    mov         edx,ebx
 00608472    call        00607AEC
>00608477    jmp         0060857B
 0060847C    cmp         ebx,21
>0060847F    jne         00608567
 00608485    cmp         byte ptr [edi+2],90
>00608489    jne         006084AB
 0060848B    cmp         byte ptr [edi+3],0
>0060848F    jne         006084AB
 00608491    cmp         byte ptr [edi+4],16
>00608495    jne         006084AB
 00608497    mov         eax,dword ptr [ebp+8]
 0060849A    push        eax
 0060849B    mov         eax,esi
 0060849D    mov         ecx,edi
 0060849F    mov         edx,ebx
 006084A1    call        00607C20
>006084A6    jmp         0060857B
 006084AB    cmp         byte ptr [edi+2],0F0
>006084AF    jne         006084DA
 006084B1    cmp         byte ptr [edi+3],0
>006084B5    jne         006084DA
 006084B7    cmp         byte ptr [edi+4],20
>006084BB    jne         006084DA
 006084BD    cmp         byte ptr [esi+9C],0
>006084C4    je          006084DA
 006084C6    mov         eax,dword ptr [ebp+8]
 006084C9    push        eax
 006084CA    mov         eax,esi
 006084CC    mov         ecx,edi
 006084CE    mov         edx,ebx
 006084D0    call        00607D08
>006084D5    jmp         0060857B
 006084DA    cmp         byte ptr [edi+2],0F0
>006084DE    jne         00608506
 006084E0    cmp         byte ptr [edi+3],0
>006084E4    jne         00608506
 006084E6    cmp         byte ptr [edi+4],30
>006084EA    jne         00608506
 006084EC    cmp         byte ptr [esi+9C],0
>006084F3    je          00608506
 006084F5    mov         eax,dword ptr [ebp+8]
 006084F8    push        eax
 006084F9    mov         eax,esi
 006084FB    mov         ecx,edi
 006084FD    mov         edx,ebx
 006084FF    call        006080F8
>00608504    jmp         0060857B
 00608506    cmp         byte ptr [edi+2],0F0
>0060850A    jne         00608532
 0060850C    cmp         byte ptr [edi+3],0
>00608510    jne         00608532
 00608512    cmp         byte ptr [edi+4],0F0
>00608516    jne         00608532
 00608518    cmp         byte ptr [esi+9C],0
>0060851F    je          00608532
 00608521    mov         eax,dword ptr [ebp+8]
 00608524    push        eax
 00608525    mov         eax,esi
 00608527    mov         ecx,edi
 00608529    mov         edx,ebx
 0060852B    call        00608240
>00608530    jmp         0060857B
 00608532    cmp         byte ptr [edi+2],0F0
>00608536    jne         0060854D
 00608538    cmp         byte ptr [edi+3],0
>0060853C    jne         0060854D
 0060853E    cmp         byte ptr [edi+4],0
>00608542    jne         0060854D
 00608544    cmp         byte ptr [esi+9C],0
>0060854B    jne         0060857B
 0060854D    cmp         byte ptr ds:[81799B],0;gvar_0081799B
>00608554    je          0060857B
 00608556    mov         eax,dword ptr [ebp+8]
 00608559    push        eax
 0060855A    mov         eax,esi
 0060855C    mov         ecx,edi
 0060855E    mov         edx,ebx
 00608560    call        00608360
>00608565    jmp         0060857B
 00608567    cmp         ebx,22
>0060856A    jne         0060857B
 0060856C    mov         eax,dword ptr [ebp+8]
 0060856F    push        eax
 00608570    mov         eax,esi
 00608572    mov         ecx,edi
 00608574    mov         edx,ebx
 00608576    call        00608424
 0060857B    lea         eax,[esi+9F]
 00608581    xor         ecx,ecx
 00608583    mov         edx,16
 00608588    call        @FillChar
 0060858D    mov         byte ptr [esi+9F],bl
 00608593    lea         edx,[esi+0A0]
 00608599    mov         eax,edi
 0060859B    mov         ecx,dword ptr [ebp+8]
 0060859E    call        Move
 006085A3    pop         edi
 006085A4    pop         esi
 006085A5    pop         ebx
 006085A6    pop         ebp
 006085A7    ret         4
end;*}

//006085AC
{*function sub_006085AC(?:?):?;
begin
 006085AC    movzx       eax,al
 006085AF    mov         edx,1A
 006085B4    sub         edx,eax
 006085B6    imul        eax,edx,118
 006085BC    ret
end;*}

//006085C0
{*function sub_006085C0(?:?):?;
begin
 006085C0    push        ebp
 006085C1    mov         ebp,esp
 006085C3    fld         qword ptr [ebp+8]
 006085C6    fdiv        dword ptr ds:[6085F0];280:Single
 006085CC    call        @ROUND
 006085D1    push        eax
 006085D2    mov         eax,1A
 006085D7    pop         edx
 006085D8    sub         eax,edx
 006085DA    test        eax,eax
>006085DC    jge         006085E0
 006085DE    xor         eax,eax
 006085E0    cmp         eax,0FF
>006085E5    jle         006085EC
 006085E7    mov         eax,0FF
 006085EC    pop         ebp
 006085ED    ret         8
end;*}

//006085F4
{*function sub_006085F4(?:?; ?:?):?;
begin
 006085F4    test        dl,dl
>006085F6    jne         006085FC
 006085F8    xor         al,17
 006085FA    add         al,17
 006085FC    ret
end;*}

//00608600
{*procedure sub_00608600(?:?; ?:?);
begin
 00608600    push        ebx
 00608601    push        esi
 00608602    add         esp,0FFFFFFE8
 00608605    mov         ebx,edx
 00608607    mov         esi,eax
 00608609    cmp         bl,byte ptr [esi+1F]
>0060860C    je          0060863F
 0060860E    mov         byte ptr [esi+1F],bl
 00608611    cmp         dword ptr [esi],0
>00608614    je          0060863F
 00608616    mov         eax,esp
 00608618    xor         ecx,ecx
 0060861A    mov         edx,16
 0060861F    call        @FillChar
 00608624    mov         byte ptr [esp],12
 00608628    movzx       eax,byte ptr [esi+27]
 0060862C    or          al,0
 0060862E    mov         byte ptr [esp+1],al
 00608632    mov         byte ptr [esp+2],bl
 00608636    mov         edx,esp
 00608638    mov         eax,esi
 0060863A    call        00608970
 0060863F    add         esp,18
 00608642    pop         esi
 00608643    pop         ebx
 00608644    ret
end;*}

//00608648
{*procedure sub_00608648(?:?; ?:?);
begin
 00608648    push        ebx
 00608649    push        esi
 0060864A    add         esp,0FFFFFFE8
 0060864D    mov         ebx,edx
 0060864F    mov         esi,eax
 00608651    cmp         bl,byte ptr [esi+21]
>00608654    je          0060867D
 00608656    mov         byte ptr [esi+21],bl
 00608659    cmp         dword ptr [esi],0
>0060865C    je          0060867D
 0060865E    mov         eax,esp
 00608660    xor         ecx,ecx
 00608662    mov         edx,16
 00608667    call        @FillChar
 0060866C    mov         byte ptr [esp],11
 00608670    mov         byte ptr [esp+1],bl
 00608674    mov         edx,esp
 00608676    mov         eax,esi
 00608678    call        00608970
 0060867D    add         esp,18
 00608680    pop         esi
 00608681    pop         ebx
 00608682    ret
end;*}

//00608684
{*procedure sub_00608684(?:?; ?:?);
begin
 00608684    push        ebx
 00608685    push        esi
 00608686    add         esp,0FFFFFFE8
 00608689    mov         ebx,edx
 0060868B    mov         esi,eax
 0060868D    cmp         bl,byte ptr [esi+22]
>00608690    je          006086B9
 00608692    mov         byte ptr [esi+22],bl
 00608695    cmp         dword ptr [esi],0
>00608698    je          006086B9
 0060869A    mov         eax,esp
 0060869C    xor         ecx,ecx
 0060869E    mov         edx,16
 006086A3    call        @FillChar
 006086A8    mov         byte ptr [esp],13
 006086AC    mov         byte ptr [esp+1],bl
 006086B0    mov         edx,esp
 006086B2    mov         eax,esi
 006086B4    call        00608970
 006086B9    add         esp,18
 006086BC    pop         esi
 006086BD    pop         ebx
 006086BE    ret
end;*}

//006086C0
{*procedure sub_006086C0(?:?; ?:?);
begin
 006086C0    push        ebx
 006086C1    push        esi
 006086C2    add         esp,0FFFFFFE8
 006086C5    mov         ebx,edx
 006086C7    mov         esi,eax
 006086C9    cmp         bl,byte ptr [esi+23]
>006086CC    je          006086FE
 006086CE    mov         byte ptr [esi+23],bl
 006086D1    test        bl,4
 006086D4    seta        al
 006086D7    mov         byte ptr [esi+29],al
 006086DA    cmp         dword ptr [esi],0
>006086DD    je          006086FE
 006086DF    mov         eax,esp
 006086E1    xor         ecx,ecx
 006086E3    mov         edx,16
 006086E8    call        @FillChar
 006086ED    mov         byte ptr [esp],14
 006086F1    mov         byte ptr [esp+1],bl
 006086F5    mov         edx,esp
 006086F7    mov         eax,esi
 006086F9    call        00608970
 006086FE    add         esp,18
 00608701    pop         esi
 00608702    pop         ebx
 00608703    ret
end;*}

//00608704
{*procedure sub_00608704(?:Integer; ?:?);
begin
 00608704    push        ebx
 00608705    push        esi
 00608706    add         esp,0FFFFFFE8
 00608709    mov         ebx,edx
 0060870B    mov         esi,eax
 0060870D    mov         byte ptr [esi+24],bl
 00608710    cmp         dword ptr [esi],0
>00608713    je          00608734
 00608715    mov         eax,esp
 00608717    xor         ecx,ecx
 00608719    mov         edx,16
 0060871E    call        @FillChar
 00608723    mov         byte ptr [esp],15
 00608727    mov         byte ptr [esp+1],bl
 0060872B    mov         edx,esp
 0060872D    mov         eax,esi
 0060872F    call        00608970
 00608734    add         esp,18
 00608737    pop         esi
 00608738    pop         ebx
 00608739    ret
end;*}

//0060873C
{*procedure sub_0060873C(?:?; ?:?);
begin
 0060873C    push        ebx
 0060873D    push        esi
 0060873E    add         esp,0FFFFFFE8
 00608741    mov         ebx,edx
 00608743    mov         esi,eax
 00608745    cmp         bl,byte ptr [esi+25]
>00608748    je          0060877A
 0060874A    mov         byte ptr [esi+25],bl
 0060874D    test        bl,4
 00608750    seta        al
 00608753    mov         byte ptr [esi+2A],al
 00608756    cmp         dword ptr [esi],0
>00608759    je          0060877A
 0060875B    mov         eax,esp
 0060875D    xor         ecx,ecx
 0060875F    mov         edx,16
 00608764    call        @FillChar
 00608769    mov         byte ptr [esp],19
 0060876D    mov         byte ptr [esp+1],bl
 00608771    mov         edx,esp
 00608773    mov         eax,esi
 00608775    call        00608970
 0060877A    add         esp,18
 0060877D    pop         esi
 0060877E    pop         ebx
 0060877F    ret
end;*}

//00608780
{*procedure sub_00608780(?:?; ?:?);
begin
 00608780    push        ebx
 00608781    push        esi
 00608782    add         esp,0FFFFFFE8
 00608785    mov         ebx,edx
 00608787    mov         esi,eax
 00608789    cmp         bl,byte ptr [esi+26]
>0060878C    je          006087B5
 0060878E    mov         byte ptr [esi+26],bl
 00608791    cmp         dword ptr [esi],0
>00608794    je          006087B5
 00608796    mov         eax,esp
 00608798    xor         ecx,ecx
 0060879A    mov         edx,16
 0060879F    call        @FillChar
 006087A4    mov         byte ptr [esp],1A
 006087A8    mov         byte ptr [esp+1],bl
 006087AC    mov         edx,esp
 006087AE    mov         eax,esi
 006087B0    call        00608970
 006087B5    add         esp,18
 006087B8    pop         esi
 006087B9    pop         ebx
 006087BA    ret
end;*}

//006087BC
procedure sub_006087BC(?:Integer);
begin
{*
 006087BC    push        ebx
 006087BD    add         esp,0FFFFFFE8
 006087C0    mov         ebx,eax
 006087C2    cmp         byte ptr ds:[817997],0;gvar_00817997
>006087C9    je          006087FE
 006087CB    cmp         byte ptr ds:[817996],0;gvar_00817996
>006087D2    je          006087E9
 006087D4    cmp         byte ptr ds:[817995],0;gvar_00817995
>006087DB    je          006087E3
 006087DD    mov         byte ptr [ebx+1F],37
>006087E1    jmp         00608844
 006087E3    mov         byte ptr [ebx+1F],36
>006087E7    jmp         00608844
 006087E9    cmp         byte ptr ds:[817995],0;gvar_00817995
>006087F0    je          006087F8
 006087F2    mov         byte ptr [ebx+1F],35
>006087F6    jmp         00608844
 006087F8    mov         byte ptr [ebx+1F],34
>006087FC    jmp         00608844
 006087FE    cmp         byte ptr ds:[817996],0;gvar_00817996
>00608805    je          0060882B
 00608807    cmp         byte ptr ds:[817999],0;gvar_00817999
>0060880E    je          00608816
 00608810    mov         byte ptr [ebx+1F],3E
>00608814    jmp         00608844
 00608816    cmp         byte ptr ds:[817995],0;gvar_00817995
>0060881D    je          00608825
 0060881F    mov         byte ptr [ebx+1F],33
>00608823    jmp         00608844
 00608825    mov         byte ptr [ebx+1F],33
>00608829    jmp         00608844
 0060882B    movzx       eax,byte ptr ds:[817995];gvar_00817995
 00608832    or          al,byte ptr ds:[817998];gvar_00817998
>00608838    je          00608840
 0060883A    mov         byte ptr [ebx+1F],31
>0060883E    jmp         00608844
 00608840    mov         byte ptr [ebx+1F],30
 00608844    mov         eax,dword ptr [ebx]
 00608846    test        eax,eax
>00608848    je          0060887C
 0060884A    call        TJvHidDevice.OpenFile
 0060884F    mov         eax,esp
 00608851    xor         ecx,ecx
 00608853    mov         edx,16
 00608858    call        @FillChar
 0060885D    mov         byte ptr [esp],12
 00608861    movzx       eax,byte ptr [ebx+27]
 00608865    or          al,0
 00608867    mov         byte ptr [esp+1],al
 0060886B    movzx       eax,byte ptr [ebx+1F]
 0060886F    mov         byte ptr [esp+2],al
 00608873    mov         edx,esp
 00608875    mov         eax,ebx
 00608877    call        00608970
 0060887C    add         esp,18
 0060887F    pop         ebx
 00608880    ret
*}
end;

//00608884
{*function sub_00608884(?:?):?;
begin
 00608884    add         eax,0FFFFFFEF
 00608887    cmp         eax,2E
>0060888A    ja          00608967
 00608890    movzx       eax,byte ptr [eax+60889E]
 00608897    jmp         dword ptr [eax*4+6088CD]
 00608897    db          1
 00608897    db          2
 00608897    db          3
 00608897    db          3
 00608897    db          3
 00608897    db          4
 00608897    db          5
 00608897    db          6
 00608897    db          7
 00608897    db          7
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          8
 00608897    db          9
 00608897    db          10
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          0
 00608897    db          11
 00608897    db          12
 00608897    db          13
 00608897    db          14
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    db          15
 00608897    dd          00608967
 00608897    dd          0060890D
 00608897    dd          00608913
 00608897    dd          00608919
 00608897    dd          0060891F
 00608897    dd          00608925
 00608897    dd          0060892B
 00608897    dd          00608931
 00608897    dd          00608937
 00608897    dd          0060893D
 00608897    dd          00608943
 00608897    dd          00608949
 00608897    dd          0060894F
 00608897    dd          00608955
 00608897    dd          0060895B
 00608897    dd          00608961
 0060890D    mov         eax,1
 00608912    ret
 00608913    mov         eax,2
 00608918    ret
 00608919    mov         eax,1
 0060891E    ret
 0060891F    mov         eax,15
 00608924    ret
 00608925    mov         eax,6
 0060892A    ret
 0060892B    mov         eax,15
 00608930    ret
 00608931    mov         eax,1
 00608936    ret
 00608937    mov         eax,6
 0060893C    ret
 0060893D    mov         eax,15
 00608942    ret
 00608943    mov         eax,4
 00608948    ret
 00608949    mov         eax,2
 0060894E    ret
 0060894F    mov         eax,5
 00608954    ret
 00608955    mov         eax,0A
 0060895A    ret
 0060895B    mov         eax,11
 00608960    ret
 00608961    mov         eax,15
 00608966    ret
 00608967    mov         eax,15
 0060896C    ret
end;*}

//00608970
{*procedure sub_00608970(?:?; ?:Byte);
begin
 00608970    push        ebx
 00608971    push        esi
 00608972    push        edi
 00608973    mov         esi,edx
 00608975    mov         edi,eax
 00608977    cmp         dword ptr [edi],0
>0060897A    je          00608A9E
 00608980    cmp         dword ptr ds:[78BD30],0;gvar_0078BD30:Pointer
>00608987    je          006089BC
 00608989    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0060898E    mov         eax,dword ptr [eax]
 00608990    mov         eax,dword ptr [eax+588]
 00608996    cmp         byte ptr [eax+38],0
>0060899A    je          006089BC
 0060899C    push        16
 0060899E    push        esi
 0060899F    mov         eax,dword ptr [edi]
 006089A1    mov         eax,dword ptr [eax+0C]
 006089A4    push        eax
 006089A5    call        dword ptr ds:[78BD30]
 006089AB    cmp         eax,1
 006089AE    sbb         ebx,ebx
 006089B0    inc         ebx
 006089B1    mov         byte ptr [edi+1C],bl
 006089B4    test        bl,bl
>006089B6    jne         00608A9E
 006089BC    cmp         dword ptr [edi+4],0FFFFFFFF
>006089C0    jne         006089D2
 006089C2    push        0
 006089C4    push        0
 006089C6    push        0
 006089C8    push        0
 006089CA    call        kernel32.CreateEventW
 006089CF    mov         dword ptr [edi+4],eax
 006089D2    mov         eax,dword ptr [edi]
 006089D4    mov         dl,1
 006089D6    call        TJvHidDevice.OpenFileEx
 006089DB    mov         eax,81D884;gvar_0081D884:Pointer
 006089E0    xor         ecx,ecx
 006089E2    mov         edx,14
 006089E7    call        @FillChar
 006089EC    mov         eax,dword ptr [edi+4]
 006089EF    mov         [0081D894],eax;gvar_0081D894
 006089F4    cmp         byte ptr [edi+1E],0
>006089F8    je          00608A05
 006089FA    mov         eax,dword ptr [edi]
 006089FC    mov         eax,dword ptr [eax+14]
 006089FF    push        eax
 00608A00    call        kernel32.CancelIo
 00608A05    mov         eax,dword ptr [edi+4]
 00608A08    push        eax
 00608A09    call        kernel32.ResetEvent
 00608A0E    push        81D884;gvar_0081D884:Pointer
 00608A13    lea         eax,[edi+10]
 00608A16    push        eax
 00608A17    push        16
 00608A19    push        esi
 00608A1A    mov         eax,dword ptr [edi]
 00608A1C    mov         eax,dword ptr [eax+14]
 00608A1F    push        eax
 00608A20    call        kernel32.WriteFile
 00608A25    test        eax,eax
>00608A27    je          00608A91
 00608A29    push        1F4
 00608A2E    mov         eax,dword ptr [edi+4]
 00608A31    push        eax
 00608A32    call        kernel32.WaitForSingleObject
 00608A37    sub         eax,1
>00608A3A    jb          00608A45
 00608A3C    sub         eax,101
>00608A41    je          00608A6A
>00608A43    jmp         00608A84
 00608A45    mov         byte ptr [edi+1E],0
 00608A49    push        0
 00608A4B    lea         eax,[edi+10]
 00608A4E    push        eax
 00608A4F    push        81D884;gvar_0081D884:Pointer
 00608A54    mov         eax,dword ptr [edi]
 00608A56    mov         eax,dword ptr [eax+14]
 00608A59    push        eax
 00608A5A    call        kernel32.GetOverlappedResult
 00608A5F    cmp         eax,1
 00608A62    sbb         eax,eax
 00608A64    inc         eax
 00608A65    mov         byte ptr [edi+1C],al
>00608A68    jmp         00608A9E
 00608A6A    mov         byte ptr [edi+1E],1
 00608A6E    xor         eax,eax
 00608A70    mov         dword ptr [edi+10],eax
 00608A73    mov         byte ptr [edi+1C],0
 00608A77    mov         eax,dword ptr [edi]
 00608A79    mov         eax,dword ptr [eax+14]
 00608A7C    push        eax
 00608A7D    call        kernel32.CancelIo
>00608A82    jmp         00608A9E
 00608A84    mov         eax,dword ptr [edi]
 00608A86    mov         eax,dword ptr [eax+14]
 00608A89    push        eax
 00608A8A    call        kernel32.CancelIo
>00608A8F    jmp         00608A9E
 00608A91    mov         byte ptr [edi+1E],1
 00608A95    xor         eax,eax
 00608A97    mov         dword ptr [edi+10],eax
 00608A9A    mov         byte ptr [edi+1C],0
 00608A9E    pop         edi
 00608A9F    pop         esi
 00608AA0    pop         ebx
 00608AA1    ret
end;*}

//00608AA4
{*function sub_00608AA4(?:?; ?:?):?;
begin
 00608AA4    push        ebx
 00608AA5    push        esi
 00608AA6    push        edi
 00608AA7    mov         esi,edx
 00608AA9    mov         edi,eax
 00608AAB    cmp         dword ptr [edi],0
>00608AAE    je          00608AFD
 00608AB0    cmp         dword ptr ds:[78BD30],0;gvar_0078BD30:Pointer
>00608AB7    je          00608AE8
 00608AB9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00608ABE    mov         eax,dword ptr [eax]
 00608AC0    mov         eax,dword ptr [eax+588]
 00608AC6    cmp         byte ptr [eax+38],0
>00608ACA    je          00608AE8
 00608ACC    push        16
 00608ACE    push        esi
 00608ACF    mov         eax,dword ptr [edi]
 00608AD1    mov         eax,dword ptr [eax+0C]
 00608AD4    push        eax
 00608AD5    call        dword ptr ds:[78BD30]
 00608ADB    cmp         eax,1
 00608ADE    sbb         ebx,ebx
 00608AE0    inc         ebx
 00608AE1    mov         byte ptr [edi+1C],bl
 00608AE4    test        bl,bl
>00608AE6    jne         00608AFD
 00608AE8    lea         eax,[edi+10]
 00608AEB    push        eax
 00608AEC    mov         edx,esi
 00608AEE    mov         eax,dword ptr [edi]
 00608AF0    mov         ecx,16
 00608AF5    call        TJvHidDevice.WriteFile
 00608AFA    mov         byte ptr [edi+1C],al
 00608AFD    pop         edi
 00608AFE    pop         esi
 00608AFF    pop         ebx
 00608B00    ret
end;*}

//00608B04
procedure sub_00608B04(?:Integer);
begin
{*
 00608B04    push        ebx
 00608B05    push        esi
 00608B06    add         esp,0FFFFFFE8
 00608B09    mov         esi,eax
 00608B0B    cmp         dword ptr [esi],0
>00608B0E    je          00608B6F
 00608B10    mov         ebx,4A400F0
 00608B15    and         ebx,0FEFFFFFF
 00608B1B    mov         eax,esp
 00608B1D    xor         ecx,ecx
 00608B1F    mov         edx,16
 00608B24    call        @FillChar
 00608B29    mov         byte ptr [esp],17
 00608B2D    movzx       eax,byte ptr [esi+27]
 00608B31    mov         edx,ebx
 00608B33    shr         edx,18
 00608B36    and         dl,0FF
 00608B39    or          al,dl
 00608B3B    mov         byte ptr [esp+1],al
 00608B3F    mov         eax,ebx
 00608B41    shr         eax,10
 00608B44    and         al,0FF
 00608B46    mov         byte ptr [esp+2],al
 00608B4A    mov         eax,ebx
 00608B4C    shr         eax,8
 00608B4F    and         al,0FF
 00608B51    mov         byte ptr [esp+3],al
 00608B55    and         bl,0FF
 00608B58    mov         byte ptr [esp+4],bl
 00608B5C    mov         byte ptr [esp+5],0
 00608B61    mov         byte ptr [esp+6],10
 00608B66    mov         edx,esp
 00608B68    mov         eax,esi
 00608B6A    call        00608970
 00608B6F    add         esp,18
 00608B72    pop         esi
 00608B73    pop         ebx
 00608B74    ret
*}
end;

//00608B78
{*procedure sub_00608B78(?:?);
begin
 00608B78    push        ebx
 00608B79    push        esi
 00608B7A    add         esp,0FFFFFFE8
 00608B7D    mov         esi,eax
 00608B7F    cmp         dword ptr [esi],0
>00608B82    je          00608BE3
 00608B84    mov         ebx,4A40020
 00608B89    and         ebx,0FEFFFFFF
 00608B8F    mov         eax,esp
 00608B91    xor         ecx,ecx
 00608B93    mov         edx,16
 00608B98    call        @FillChar
 00608B9D    mov         byte ptr [esp],17
 00608BA1    movzx       eax,byte ptr [esi+27]
 00608BA5    mov         edx,ebx
 00608BA7    shr         edx,18
 00608BAA    and         dl,0FF
 00608BAD    or          al,dl
 00608BAF    mov         byte ptr [esp+1],al
 00608BB3    mov         eax,ebx
 00608BB5    shr         eax,10
 00608BB8    and         al,0FF
 00608BBA    mov         byte ptr [esp+2],al
 00608BBE    mov         eax,ebx
 00608BC0    shr         eax,8
 00608BC3    and         al,0FF
 00608BC5    mov         byte ptr [esp+3],al
 00608BC9    and         bl,0FF
 00608BCC    mov         byte ptr [esp+4],bl
 00608BD0    mov         byte ptr [esp+5],0
 00608BD5    mov         byte ptr [esp+6],20
 00608BDA    mov         edx,esp
 00608BDC    mov         eax,esi
 00608BDE    call        00608970
 00608BE3    add         esp,18
 00608BE6    pop         esi
 00608BE7    pop         ebx
 00608BE8    ret
end;*}

//00608BEC
{*procedure sub_00608BEC(?:?);
begin
 00608BEC    push        ebx
 00608BED    push        esi
 00608BEE    add         esp,0FFFFFFE8
 00608BF1    mov         esi,eax
 00608BF3    cmp         dword ptr [esi],0
>00608BF6    je          00608C57
 00608BF8    mov         ebx,4A40020
 00608BFD    and         ebx,0FEFFFFFF
 00608C03    mov         eax,esp
 00608C05    xor         ecx,ecx
 00608C07    mov         edx,16
 00608C0C    call        @FillChar
 00608C11    mov         byte ptr [esp],17
 00608C15    movzx       eax,byte ptr [esi+27]
 00608C19    mov         edx,ebx
 00608C1B    shr         edx,18
 00608C1E    and         dl,0FF
 00608C21    or          al,dl
 00608C23    mov         byte ptr [esp+1],al
 00608C27    mov         eax,ebx
 00608C29    shr         eax,10
 00608C2C    and         al,0FF
 00608C2E    mov         byte ptr [esp+2],al
 00608C32    mov         eax,ebx
 00608C34    shr         eax,8
 00608C37    and         al,0FF
 00608C39    mov         byte ptr [esp+3],al
 00608C3D    and         bl,0FF
 00608C40    mov         byte ptr [esp+4],bl
 00608C44    mov         byte ptr [esp+5],0
 00608C49    mov         byte ptr [esp+6],20
 00608C4E    mov         edx,esp
 00608C50    mov         eax,esi
 00608C52    call        00608970
 00608C57    add         esp,18
 00608C5A    pop         esi
 00608C5B    pop         ebx
 00608C5C    ret
end;*}

//00608C60
procedure sub_00608C60(?:Integer);
begin
{*
 00608C60    push        ebx
 00608C61    push        esi
 00608C62    add         esp,0FFFFFFE8
 00608C65    mov         esi,eax
 00608C67    cmp         dword ptr [esi],0
>00608C6A    je          00608CD4
 00608C6C    call        00600EA0
 00608C71    fstp        qword ptr [esi+30]
 00608C74    wait
 00608C75    mov         ebx,16
 00608C7A    and         ebx,0FEFFFFFF
 00608C80    mov         eax,esp
 00608C82    xor         ecx,ecx
 00608C84    mov         edx,16
 00608C89    call        @FillChar
 00608C8E    mov         byte ptr [esp],17
 00608C92    movzx       eax,byte ptr [esi+27]
 00608C96    mov         edx,ebx
 00608C98    shr         edx,18
 00608C9B    and         dl,0FF
 00608C9E    or          al,dl
 00608CA0    mov         byte ptr [esp+1],al
 00608CA4    mov         eax,ebx
 00608CA6    shr         eax,10
 00608CA9    and         al,0FF
 00608CAB    mov         byte ptr [esp+2],al
 00608CAF    mov         eax,ebx
 00608CB1    shr         eax,8
 00608CB4    and         al,0FF
 00608CB6    mov         byte ptr [esp+3],al
 00608CBA    and         bl,0FF
 00608CBD    mov         byte ptr [esp+4],bl
 00608CC1    mov         byte ptr [esp+5],0
 00608CC6    mov         byte ptr [esp+6],0A
 00608CCB    mov         edx,esp
 00608CCD    mov         eax,esi
 00608CCF    call        00608970
 00608CD4    add         esp,18
 00608CD7    pop         esi
 00608CD8    pop         ebx
 00608CD9    ret
*}
end;

//00608CDC
{*procedure sub_00608CDC(?:?);
begin
 00608CDC    push        ebx
 00608CDD    push        esi
 00608CDE    add         esp,0FFFFFFE8
 00608CE1    mov         esi,eax
 00608CE3    cmp         dword ptr [esi],0
>00608CE6    je          00608D47
 00608CE8    mov         ebx,0FD2
 00608CED    and         ebx,0FEFFFFFF
 00608CF3    mov         eax,esp
 00608CF5    xor         ecx,ecx
 00608CF7    mov         edx,16
 00608CFC    call        @FillChar
 00608D01    mov         byte ptr [esp],17
 00608D05    movzx       eax,byte ptr [esi+27]
 00608D09    mov         edx,ebx
 00608D0B    shr         edx,18
 00608D0E    and         dl,0FF
 00608D11    or          al,dl
 00608D13    mov         byte ptr [esp+1],al
 00608D17    mov         eax,ebx
 00608D19    shr         eax,10
 00608D1C    and         al,0FF
 00608D1E    mov         byte ptr [esp+2],al
 00608D22    mov         eax,ebx
 00608D24    shr         eax,8
 00608D27    and         al,0FF
 00608D29    mov         byte ptr [esp+3],al
 00608D2D    and         bl,0FF
 00608D30    mov         byte ptr [esp+4],bl
 00608D34    mov         byte ptr [esp+5],2
 00608D39    mov         byte ptr [esp+6],0E4
 00608D3E    mov         edx,esp
 00608D40    mov         eax,esi
 00608D42    call        00608970
 00608D47    add         esp,18
 00608D4A    pop         esi
 00608D4B    pop         ebx
 00608D4C    ret
end;*}

//00608D50
{*procedure sub_00608D50(?:Integer; ?:Integer; ?:?);
begin
 00608D50    push        ebp
 00608D51    mov         ebp,esp
 00608D53    add         esp,0FFFFFFD8
 00608D56    push        ebx
 00608D57    push        esi
 00608D58    push        edi
 00608D59    xor         ebx,ebx
 00608D5B    mov         dword ptr [ebp-28],ebx
 00608D5E    mov         dword ptr [ebp-24],ebx
 00608D61    mov         dword ptr [ebp-4],ebx
 00608D64    mov         esi,ecx
 00608D66    mov         ebx,edx
 00608D68    mov         dword ptr [ebp-8],eax
 00608D6B    xor         eax,eax
 00608D6D    push        ebp
 00608D6E    push        608F2A
 00608D73    push        dword ptr fs:[eax]
 00608D76    mov         dword ptr fs:[eax],esp
 00608D79    mov         eax,dword ptr [ebp-8]
 00608D7C    cmp         dword ptr [eax],0
>00608D7F    je          00608F07
 00608D85    lea         eax,[ebp-1E]
 00608D88    xor         ecx,ecx
 00608D8A    mov         edx,16
 00608D8F    call        @FillChar
 00608D94    and         esi,0FFF0
 00608D9A    inc         esi
 00608D9B    and         ebx,0FEFFFFFF
 00608DA1    mov         byte ptr [ebp-1E],17
 00608DA5    mov         eax,dword ptr [ebp-8]
 00608DA8    movzx       eax,byte ptr [eax+27]
 00608DAC    mov         edx,ebx
 00608DAE    shr         edx,18
 00608DB1    and         dl,0FF
 00608DB4    or          al,dl
 00608DB6    mov         byte ptr [ebp-1D],al
 00608DB9    mov         eax,ebx
 00608DBB    shr         eax,10
 00608DBE    and         al,0FF
 00608DC0    mov         byte ptr [ebp-1C],al
 00608DC3    mov         eax,ebx
 00608DC5    shr         eax,8
 00608DC8    and         al,0FF
 00608DCA    mov         byte ptr [ebp-1B],al
 00608DCD    and         bl,0FF
 00608DD0    mov         byte ptr [ebp-1A],bl
 00608DD3    mov         eax,esi
 00608DD5    shr         eax,8
 00608DD8    and         al,0FF
 00608DDA    mov         byte ptr [ebp-19],al
 00608DDD    mov         eax,esi
 00608DDF    and         al,0FF
 00608DE1    mov         byte ptr [ebp-18],al
 00608DE4    push        0
 00608DE6    push        0
 00608DE8    mov         eax,dword ptr [ebp-8]
 00608DEB    mov         eax,dword ptr [eax]
 00608DED    call        005DF390
 00608DF2    xor         edx,edx
 00608DF4    push        ebp
 00608DF5    push        608F00
 00608DFA    push        dword ptr fs:[edx]
 00608DFD    mov         dword ptr fs:[edx],esp
 00608E00    lea         edx,[ebp-1E]
 00608E03    mov         eax,dword ptr [ebp-8]
 00608E06    call        00608970
 00608E0B    mov         edi,64
 00608E10    lea         eax,[ebp-1E]
 00608E13    xor         ecx,ecx
 00608E15    mov         edx,16
 00608E1A    call        @FillChar
 00608E1F    mov         eax,dword ptr [ebp-8]
 00608E22    add         eax,14
 00608E25    push        eax
 00608E26    lea         edx,[ebp-1E]
 00608E29    mov         eax,dword ptr [ebp-8]
 00608E2C    mov         eax,dword ptr [eax]
 00608E2E    mov         ecx,16
 00608E33    call        TJvHidDevice.ReadFile
 00608E38    mov         edx,dword ptr [ebp-8]
 00608E3B    mov         byte ptr [edx+1D],al
 00608E3E    cmp         byte ptr [ebp-1E],21
>00608E42    jne         00608ED4
 00608E48    lea         ecx,[ebp-24]
 00608E4B    movzx       eax,byte ptr [ebp-19]
 00608E4F    mov         edx,2
 00608E54    call        IntToHex
 00608E59    mov         edx,dword ptr [ebp-24]
 00608E5C    lea         eax,[ebp-4]
 00608E5F    mov         ecx,608F44;': '
 00608E64    call        @UStrCat3
 00608E69    mov         esi,10
 00608E6E    lea         ebx,[ebp-18]
 00608E71    push        dword ptr [ebp-4]
 00608E74    lea         ecx,[ebp-28]
 00608E77    movzx       eax,byte ptr [ebx]
 00608E7A    mov         edx,2
 00608E7F    call        IntToHex
 00608E84    push        dword ptr [ebp-28]
 00608E87    push        608F58;' '
 00608E8C    lea         eax,[ebp-4]
 00608E8F    mov         edx,3
 00608E94    call        @UStrCatN
 00608E99    inc         ebx
 00608E9A    dec         esi
>00608E9B    jne         00608E71
 00608E9D    mov         edx,dword ptr [ebp-8]
 00608EA0    add         edx,9F
 00608EA6    lea         eax,[ebp-1E]
 00608EA9    mov         ecx,16
 00608EAE    call        Move
 00608EB3    cmp         byte ptr [ebp-1E],21
>00608EB7    jne         00608ECC
 00608EB9    movzx       eax,byte ptr [ebp-1B]
 00608EBD    test        al,0F0
>00608EBF    je          00608EC5
 00608EC1    test        al,0F
>00608EC3    je          00608ECC
 00608EC5    call        @TryFinallyExit
>00608ECA    jmp         00608F07
 00608ECC    mov         eax,dword ptr [ebp-4]
 00608ECF    call        004F9EA0
 00608ED4    dec         edi
>00608ED5    jne         00608E10
 00608EDB    xor         eax,eax
 00608EDD    pop         edx
 00608EDE    pop         ecx
 00608EDF    pop         ecx
 00608EE0    mov         dword ptr fs:[eax],edx
 00608EE3    push        608F07
 00608EE8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00608EED    mov         eax,dword ptr [eax]
 00608EEF    push        eax
 00608EF0    push        764520;TEditorForm.HidControllerDeviceData
 00608EF5    mov         eax,dword ptr [ebp-8]
 00608EF8    mov         eax,dword ptr [eax]
 00608EFA    call        005DF390
 00608EFF    ret
>00608F00    jmp         @HandleFinally
>00608F05    jmp         00608EE8
 00608F07    xor         eax,eax
 00608F09    pop         edx
 00608F0A    pop         ecx
 00608F0B    pop         ecx
 00608F0C    mov         dword ptr fs:[eax],edx
 00608F0F    push        608F31
 00608F14    lea         eax,[ebp-28]
 00608F17    mov         edx,2
 00608F1C    call        @UStrArrayClr
 00608F21    lea         eax,[ebp-4]
 00608F24    call        @UStrClr
 00608F29    ret
>00608F2A    jmp         @HandleFinally
>00608F2F    jmp         00608F14
 00608F31    pop         edi
 00608F32    pop         esi
 00608F33    pop         ebx
 00608F34    mov         esp,ebp
 00608F36    pop         ebp
 00608F37    ret
end;*}

//00608F5C
{*function sub_00608F5C(?:Integer; ?:Integer; ?:?):?;
begin
 00608F5C    push        ebx
 00608F5D    push        esi
 00608F5E    push        edi
 00608F5F    add         esp,0FFFFFFE8
 00608F62    mov         ebx,ecx
 00608F64    mov         edi,edx
 00608F66    mov         esi,eax
 00608F68    cmp         dword ptr [esi],0
>00608F6B    je          00608FCE
 00608F6D    and         edi,0FEFFFFFF
 00608F73    mov         eax,esp
 00608F75    xor         ecx,ecx
 00608F77    mov         edx,16
 00608F7C    call        @FillChar
 00608F81    mov         byte ptr [esp],16
 00608F85    movzx       eax,byte ptr [esi+27]
 00608F89    mov         edx,edi
 00608F8B    shr         edx,18
 00608F8E    and         dl,0FF
 00608F91    or          al,dl
 00608F93    mov         byte ptr [esp+1],al
 00608F97    mov         eax,edi
 00608F99    shr         eax,10
 00608F9C    and         al,0FF
 00608F9E    mov         byte ptr [esp+2],al
 00608FA2    mov         eax,edi
 00608FA4    shr         eax,8
 00608FA7    and         al,0FF
 00608FA9    mov         byte ptr [esp+3],al
 00608FAD    mov         eax,edi
 00608FAF    and         al,0FF
 00608FB1    mov         byte ptr [esp+4],al
 00608FB5    mov         byte ptr [esp+5],1
 00608FBA    mov         byte ptr [esp+6],bl
 00608FBE    mov         edx,esp
 00608FC0    mov         eax,esi
 00608FC2    call        00608970
 00608FC7    push        0A
 00608FC9    call        kernel32.Sleep
 00608FCE    add         esp,18
 00608FD1    pop         edi
 00608FD2    pop         esi
 00608FD3    pop         ebx
 00608FD4    ret
end;*}

//00608FD8
{*procedure sub_00608FD8(?:?);
begin
 00608FD8    push        ebx
 00608FD9    push        esi
 00608FDA    mov         esi,eax
 00608FDC    movzx       ebx,byte ptr [esi+2A]
 00608FE0    movzx       edx,byte ptr [esi+27]
 00608FE4    add         dl,4
 00608FE7    mov         eax,esi
 00608FE9    call        006086C0
 00608FEE    movzx       edx,byte ptr [esi+27]
 00608FF2    add         dl,4
 00608FF5    mov         eax,esi
 00608FF7    call        0060873C
 00608FFC    mov         eax,esi
 00608FFE    mov         cl,1
 00609000    mov         edx,4A20009
 00609005    call        00608F5C
 0060900A    mov         eax,esi
 0060900C    mov         cl,8
 0060900E    mov         edx,4A20001
 00609013    call        00608F5C
 00609018    mov         eax,esi
 0060901A    xor         ecx,ecx
 0060901C    mov         edx,4A20001
 00609021    call        00608F5C
 00609026    mov         eax,esi
 00609028    xor         ecx,ecx
 0060902A    mov         edx,4A20002
 0060902F    call        00608F5C
 00609034    mov         eax,esi
 00609036    xor         ecx,ecx
 00609038    mov         edx,4A20003
 0060903D    call        00608F5C
 00609042    movzx       ecx,byte ptr [esi+18]
 00609046    mov         eax,esi
 00609048    mov         edx,4A20004
 0060904D    call        00608F5C
 00609052    movzx       ecx,byte ptr [esi+20]
 00609056    mov         eax,esi
 00609058    mov         edx,4A20005
 0060905D    call        00608F5C
 00609062    mov         eax,esi
 00609064    xor         ecx,ecx
 00609066    mov         edx,4A20006
 0060906B    call        00608F5C
 00609070    mov         eax,esi
 00609072    xor         ecx,ecx
 00609074    mov         edx,4A20007
 00609079    call        00608F5C
 0060907E    mov         eax,esi
 00609080    mov         cl,1
 00609082    mov         edx,4A20008
 00609087    call        00608F5C
 0060908C    mov         edx,ebx
 0060908E    add         edx,edx
 00609090    add         edx,edx
 00609092    movzx       eax,byte ptr [esi+27]
 00609096    add         dl,al
 00609098    mov         eax,esi
 0060909A    call        0060873C
 0060909F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006090A4    mov         eax,dword ptr [eax]
 006090A6    mov         eax,dword ptr [eax+5BC]
 006090AC    mov         edx,8
 006090B1    call        TThreadedTimer.SetInterval
 006090B6    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006090BB    mov         eax,dword ptr [eax]
 006090BD    mov         eax,dword ptr [eax+5BC]
 006090C3    mov         dl,1
 006090C5    call        TThreadedTimer.SetEnabled
 006090CA    xor         eax,eax
 006090CC    mov         dword ptr [esi+270],eax
 006090D2    mov         dword ptr [esi+274],eax
 006090D8    pop         esi
 006090D9    pop         ebx
 006090DA    ret
end;*}

//006090DC
{*procedure sub_006090DC(?:?);
begin
 006090DC    push        ebx
 006090DD    push        esi
 006090DE    mov         esi,eax
 006090E0    movzx       ebx,byte ptr [esi+2A]
 006090E4    movzx       edx,byte ptr [esi+27]
 006090E8    mov         eax,esi
 006090EA    call        006086C0
 006090EF    mov         edx,ebx
 006090F1    add         edx,edx
 006090F3    add         edx,edx
 006090F5    movzx       eax,byte ptr [esi+27]
 006090F9    add         dl,al
 006090FB    mov         eax,esi
 006090FD    call        0060873C
 00609102    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00609107    mov         eax,dword ptr [eax]
 00609109    mov         eax,dword ptr [eax+5BC]
 0060910F    xor         edx,edx
 00609111    call        TThreadedTimer.SetEnabled
 00609116    pop         esi
 00609117    pop         ebx
 00609118    ret
end;*}

//0060911C
procedure sub_0060911C;
begin
{*
 0060911C    xor         ecx,ecx
 0060911E    mov         edx,4A40040
 00609123    call        00608F5C
 00609128    ret
*}
end;

//0060912C
procedure sub_0060912C;
begin
{*
 0060912C    xor         ecx,ecx
 0060912E    mov         edx,4A40040
 00609133    call        00608F5C
 00609138    ret
*}
end;

//0060913C
procedure sub_0060913C(?:Integer);
begin
{*
 0060913C    push        ebx
 0060913D    mov         ebx,eax
 0060913F    cmp         dword ptr [ebx],0
>00609142    je          006091CE
 00609148    push        64
 0060914A    call        kernel32.Sleep
 0060914F    mov         eax,ebx
 00609151    mov         dl,4
 00609153    call        00608684
 00609158    push        64
 0060915A    call        kernel32.Sleep
 0060915F    mov         eax,ebx
 00609161    mov         dl,4
 00609163    call        00608780
 00609168    push        64
 0060916A    call        kernel32.Sleep
 0060916F    mov         eax,ebx
 00609171    mov         cl,8
 00609173    mov         edx,4B00030
 00609178    call        00608F5C
 0060917D    mov         eax,ebx
 0060917F    mov         cl,90
 00609181    mov         edx,4B00006
 00609186    call        00608F5C
 0060918B    mov         eax,ebx
 0060918D    mov         cl,0C0
 0060918F    mov         edx,4B00008
 00609194    call        00608F5C
 00609199    mov         eax,ebx
 0060919B    mov         cl,40
 0060919D    mov         edx,4B0001A
 006091A2    call        00608F5C
 006091A7    cmp         byte ptr ds:[817997],0;gvar_00817997
>006091AE    je          006091C0
 006091B0    mov         eax,ebx
 006091B2    xor         ecx,ecx
 006091B4    mov         edx,4B00033
 006091B9    call        00608F5C
>006091BE    jmp         006091CE
 006091C0    mov         eax,ebx
 006091C2    mov         cl,3
 006091C4    mov         edx,4B00033
 006091C9    call        00608F5C
 006091CE    pop         ebx
 006091CF    ret
*}
end;

//006091D0
{*function sub_006091D0(?:?; ?:?):?;
begin
 006091D0    push        ebx
 006091D1    push        esi
 006091D2    add         esp,0FFFFFFE8
 006091D5    mov         ebx,edx
 006091D7    mov         esi,eax
 006091D9    cmp         bl,byte ptr [esi+2C]
>006091DC    je          0060920E
 006091DE    mov         byte ptr [esi+2C],bl
 006091E1    mov         eax,esp
 006091E3    xor         ecx,ecx
 006091E5    mov         edx,16
 006091EA    call        @FillChar
 006091EF    mov         byte ptr [esp],11
 006091F3    movzx       eax,byte ptr [esi+27]
 006091F7    shl         ebx,4
 006091FA    or          al,bl
 006091FC    mov         byte ptr [esp+1],al
 00609200    cmp         dword ptr [esi],0
>00609203    je          0060920E
 00609205    mov         edx,esp
 00609207    mov         eax,esi
 00609209    call        00608970
 0060920E    add         esp,18
 00609211    pop         esi
 00609212    pop         ebx
 00609213    ret
end;*}

//00609214
{*procedure sub_00609214(?:?; ?:Boolean);
begin
 00609214    push        ebx
 00609215    push        esi
 00609216    add         esp,0FFFFFFE8
 00609219    mov         ebx,edx
 0060921B    mov         esi,eax
 0060921D    cmp         bl,byte ptr [esi+27]
>00609220    je          00609254
 00609222    mov         byte ptr [esi+27],bl
 00609225    mov         eax,esp
 00609227    xor         ecx,ecx
 00609229    mov         edx,16
 0060922E    call        @FillChar
 00609233    mov         byte ptr [esp],11
 00609237    movzx       eax,byte ptr [esi+2C]
 0060923B    and         al,0F
 0060923D    shl         eax,4
 00609240    add         bl,al
 00609242    mov         byte ptr [esp+1],bl
 00609246    cmp         dword ptr [esi],0
>00609249    je          00609254
 0060924B    mov         edx,esp
 0060924D    mov         eax,esi
 0060924F    call        00608970
 00609254    add         esp,18
 00609257    pop         esi
 00609258    pop         ebx
 00609259    ret
end;*}

//0060925C
{*procedure sub_0060925C(?:?);
begin
 0060925C    push        ebx
 0060925D    mov         ebx,eax
 0060925F    cmp         dword ptr [ebx],0
>00609262    je          006092AE
 00609264    mov         eax,ebx
 00609266    mov         cl,1
 00609268    mov         edx,4B00030
 0060926D    call        00608F5C
 00609272    push        64
 00609274    call        kernel32.Sleep
 00609279    mov         eax,ebx
 0060927B    xor         ecx,ecx
 0060927D    mov         edx,4B00033
 00609282    call        00608F5C
 00609287    push        64
 00609289    call        kernel32.Sleep
 0060928E    mov         eax,ebx
 00609290    xor         edx,edx
 00609292    call        00608684
 00609297    push        64
 00609299    call        kernel32.Sleep
 0060929E    mov         eax,ebx
 006092A0    xor         edx,edx
 006092A2    call        00608780
 006092A7    push        64
 006092A9    call        kernel32.Sleep
 006092AE    pop         ebx
 006092AF    ret
end;*}

//006092B0
{*procedure sub_006092B0(?:?);
begin
 006092B0    push        ebp
 006092B1    mov         ebp,esp
 006092B3    add         esp,0FFFFFFE4
 006092B6    push        ebx
 006092B7    push        esi
 006092B8    push        edi
 006092B9    mov         dword ptr [ebp-4],eax
 006092BC    mov         eax,dword ptr [ebp-4]
 006092BF    mov         eax,dword ptr [eax]
 006092C1    test        eax,eax
>006092C3    je          00609386
 006092C9    xor         edx,edx
 006092CB    push        ebp
 006092CC    push        6092ED
 006092D1    push        dword ptr fs:[edx]
 006092D4    mov         dword ptr fs:[edx],esp
 006092D7    mov         edx,dword ptr [ebp-4]
 006092DA    mov         eax,dword ptr [eax+14]
 006092DD    push        eax
 006092DE    call        kernel32.CancelIo
 006092E3    xor         eax,eax
 006092E5    pop         edx
 006092E6    pop         ecx
 006092E7    pop         ecx
 006092E8    mov         dword ptr fs:[eax],edx
>006092EB    jmp         006092F7
>006092ED    jmp         @HandleAnyException
 006092F2    call        @DoneExcept
 006092F7    cmp         byte ptr ds:[817996],0;gvar_00817996
>006092FE    je          00609308
 00609300    mov         eax,dword ptr [ebp-4]
 00609303    call        0060925C
 00609308    cmp         byte ptr ds:[817998],0;gvar_00817998
>0060930F    je          00609320
 00609311    mov         eax,dword ptr [ebp-4]
 00609314    mov         byte ptr [eax+2A],0
 00609318    mov         eax,dword ptr [ebp-4]
 0060931B    call        006090DC
 00609320    cmp         byte ptr ds:[817997],0;gvar_00817997
>00609327    je          00609331
 00609329    mov         eax,dword ptr [ebp-4]
 0060932C    call        0060912C
 00609331    mov         eax,dword ptr [ebp-4]
 00609334    xor         edx,edx
 00609336    call        006091D0
 0060933B    push        64
 0060933D    call        kernel32.Sleep
 00609342    mov         eax,dword ptr [ebp-4]
 00609345    mov         byte ptr [eax+1F],30
 00609349    mov         eax,dword ptr [ebp-4]
 0060934C    mov         eax,dword ptr [eax]
 0060934E    call        TJvHidDevice.OpenFile
 00609353    lea         eax,[ebp-1A]
 00609356    xor         ecx,ecx
 00609358    mov         edx,16
 0060935D    call        @FillChar
 00609362    mov         byte ptr [ebp-1A],12
 00609366    mov         byte ptr [ebp-19],0
 0060936A    mov         eax,dword ptr [ebp-4]
 0060936D    movzx       eax,byte ptr [eax+1F]
 00609371    mov         byte ptr [ebp-18],al
 00609374    lea         edx,[ebp-1A]
 00609377    mov         eax,dword ptr [ebp-4]
 0060937A    call        00608970
 0060937F    push        64
 00609381    call        kernel32.Sleep
 00609386    pop         edi
 00609387    pop         esi
 00609388    pop         ebx
 00609389    mov         esp,ebp
 0060938B    pop         ebp
 0060938C    ret
end;*}

//00609390
procedure sub_00609390;
begin
{*
 00609390    push        ebp
 00609391    mov         ebp,esp
 00609393    mov         ecx,0A
 00609398    push        0
 0060939A    push        0
 0060939C    dec         ecx
>0060939D    jne         00609398
 0060939F    push        ebx
 006093A0    push        esi
 006093A1    push        edi
 006093A2    mov         ebx,817990;gvar_00817990:THashTable
 006093A7    xor         eax,eax
 006093A9    push        ebp
 006093AA    push        60A582
 006093AF    push        dword ptr fs:[eax]
 006093B2    mov         dword ptr fs:[eax],esp
 006093B5    xor         ecx,ecx
 006093B7    mov         edx,60A59C;'Exists'
 006093BC    mov         eax,dword ptr [ebx]
 006093BE    call        THashTable.Add
 006093C3    mov         ecx,17
 006093C8    mov         edx,60A5B8;'PluggedIn'
 006093CD    mov         eax,dword ptr [ebx]
 006093CF    call        THashTable.Add
 006093D4    mov         ecx,11E
 006093D9    mov         edx,60A5D8;'LedPlayer'
 006093DE    mov         eax,dword ptr [ebx]
 006093E0    call        THashTable.Add
 006093E5    mov         ecx,1
 006093EA    mov         edx,60A5F8;'Leds'
 006093EF    mov         eax,dword ptr [ebx]
 006093F1    call        THashTable.Add
 006093F6    mov         ecx,13
 006093FB    mov         edx,60A610;'Led1'
 00609400    mov         eax,dword ptr [ebx]
 00609402    call        THashTable.Add
 00609407    mov         ecx,14
 0060940C    mov         edx,60A628;'Led2'
 00609411    mov         eax,dword ptr [ebx]
 00609413    call        THashTable.Add
 00609418    mov         ecx,15
 0060941D    mov         edx,60A640;'Led3'
 00609422    mov         eax,dword ptr [ebx]
 00609424    call        THashTable.Add
 00609429    mov         ecx,16
 0060942E    mov         edx,60A658;'Led4'
 00609433    mov         eax,dword ptr [ebx]
 00609435    call        THashTable.Add
 0060943A    mov         ecx,2
 0060943F    mov         edx,60A670;'Rumble'
 00609444    mov         eax,dword ptr [ebx]
 00609446    call        THashTable.Add
 0060944B    mov         ecx,3
 00609450    mov         edx,60A68C;'RawForceX'
 00609455    mov         eax,dword ptr [ebx]
 00609457    call        THashTable.Add
 0060945C    mov         ecx,4
 00609461    mov         edx,60A6AC;'RawForceY'
 00609466    mov         eax,dword ptr [ebx]
 00609468    call        THashTable.Add
 0060946D    mov         ecx,5
 00609472    mov         edx,60A6CC;'RawForceZ'
 00609477    mov         eax,dword ptr [ebx]
 00609479    call        THashTable.Add
 0060947E    mov         ecx,7A
 00609483    mov         edx,60A6EC;'DPad'
 00609488    mov         eax,dword ptr [ebx]
 0060948A    call        THashTable.Add
 0060948F    mov         ecx,6
 00609494    mov         edx,60A704;'Up'
 00609499    mov         eax,dword ptr [ebx]
 0060949B    call        THashTable.Add
 006094A0    mov         ecx,7
 006094A5    mov         edx,60A718;'Down'
 006094AA    mov         eax,dword ptr [ebx]
 006094AC    call        THashTable.Add
 006094B1    mov         ecx,8
 006094B6    mov         edx,60A730;'Left'
 006094BB    mov         eax,dword ptr [ebx]
 006094BD    call        THashTable.Add
 006094C2    mov         ecx,9
 006094C7    mov         edx,60A748;'Right'
 006094CC    mov         eax,dword ptr [ebx]
 006094CE    call        THashTable.Add
 006094D3    mov         ecx,0A
 006094D8    mov         edx,60A760;'Home'
 006094DD    mov         eax,dword ptr [ebx]
 006094DF    call        THashTable.Add
 006094E4    mov         ecx,0A
 006094E9    mov         edx,60A778;'HomeButton'
 006094EE    mov         eax,dword ptr [ebx]
 006094F0    call        THashTable.Add
 006094F5    mov         ecx,0B
 006094FA    mov         edx,60A79C;'A'
 006094FF    mov         eax,dword ptr [ebx]
 00609501    call        THashTable.Add
 00609506    mov         ecx,0C
 0060950B    mov         edx,60A7AC;'B'
 00609510    mov         eax,dword ptr [ebx]
 00609512    call        THashTable.Add
 00609517    mov         ecx,0B
 0060951C    mov         edx,60A7BC;'AButton'
 00609521    mov         eax,dword ptr [ebx]
 00609523    call        THashTable.Add
 00609528    mov         ecx,0C
 0060952D    mov         edx,60A7D8;'BButton'
 00609532    mov         eax,dword ptr [ebx]
 00609534    call        THashTable.Add
 00609539    mov         ecx,0D
 0060953E    mov         edx,60A7F4;'One'
 00609543    mov         eax,dword ptr [ebx]
 00609545    call        THashTable.Add
 0060954A    mov         ecx,0D
 0060954F    mov         edx,60A808;'OneButton'
 00609554    mov         eax,dword ptr [ebx]
 00609556    call        THashTable.Add
 0060955B    mov         ecx,0D
 00609560    mov         edx,60A828;'1'
 00609565    mov         eax,dword ptr [ebx]
 00609567    call        THashTable.Add
 0060956C    mov         ecx,0D
 00609571    mov         edx,60A838;'1Button'
 00609576    mov         eax,dword ptr [ebx]
 00609578    call        THashTable.Add
 0060957D    mov         ecx,0E
 00609582    mov         edx,60A854;'Two'
 00609587    mov         eax,dword ptr [ebx]
 00609589    call        THashTable.Add
 0060958E    mov         ecx,0E
 00609593    mov         edx,60A868;'TwoButton'
 00609598    mov         eax,dword ptr [ebx]
 0060959A    call        THashTable.Add
 0060959F    mov         ecx,0E
 006095A4    mov         edx,60A888;'2'
 006095A9    mov         eax,dword ptr [ebx]
 006095AB    call        THashTable.Add
 006095B0    mov         ecx,0E
 006095B5    mov         edx,60A898;'2Button'
 006095BA    mov         eax,dword ptr [ebx]
 006095BC    call        THashTable.Add
 006095C1    mov         ecx,0F
 006095C6    mov         edx,60A8B4;'Plus'
 006095CB    mov         eax,dword ptr [ebx]
 006095CD    call        THashTable.Add
 006095D2    mov         ecx,10
 006095D7    mov         edx,60A8CC;'Minus'
 006095DC    mov         eax,dword ptr [ebx]
 006095DE    call        THashTable.Add
 006095E3    mov         ecx,0F
 006095E8    mov         edx,60A8E4;'PlusButton'
 006095ED    mov         eax,dword ptr [ebx]
 006095EF    call        THashTable.Add
 006095F4    mov         ecx,10
 006095F9    mov         edx,60A908;'MinusButton'
 006095FE    mov         eax,dword ptr [ebx]
 00609600    call        THashTable.Add
 00609605    mov         ecx,11
 0060960A    mov         edx,60A92C;'HasClassic'
 0060960F    mov         eax,dword ptr [ebx]
 00609611    call        THashTable.Add
 00609616    mov         ecx,11
 0060961B    mov         edx,60A950;'Classic.Exists'
 00609620    mov         eax,dword ptr [ebx]
 00609622    call        THashTable.Add
 00609627    mov         ecx,140
 0060962C    mov         edx,60A97C;'HasGuitar'
 00609631    mov         eax,dword ptr [ebx]
 00609633    call        THashTable.Add
 00609638    mov         ecx,140
 0060963D    mov         edx,60A99C;'Guitar.Exists'
 00609642    mov         eax,dword ptr [ebx]
 00609644    call        THashTable.Add
 00609649    mov         ecx,12
 0060964E    mov         edx,60A9C4;'HasNunchuk'
 00609653    mov         eax,dword ptr [ebx]
 00609655    call        THashTable.Add
 0060965A    mov         ecx,12
 0060965F    mov         edx,60A9E8;'HasNunchuck'
 00609664    mov         eax,dword ptr [ebx]
 00609666    call        THashTable.Add
 0060966B    mov         ecx,0C4
 00609670    mov         edx,60AA0C;'HasBladeFX'
 00609675    mov         eax,dword ptr [ebx]
 00609677    call        THashTable.Add
 0060967C    mov         ecx,0C4
 00609681    mov         edx,60AA30;'BladeFX.Exists'
 00609686    mov         eax,dword ptr [ebx]
 00609688    call        THashTable.Add
 0060968D    mov         ecx,0C4
 00609692    mov         edx,60AA5C;'Nunchuk.IsBladeFX'
 00609697    mov         eax,dword ptr [ebx]
 00609699    call        THashTable.Add
 0060969E    mov         ecx,12
 006096A3    mov         edx,60AA8C;'Nunchuk.Exists'
 006096A8    mov         eax,dword ptr [ebx]
 006096AA    call        THashTable.Add
 006096AF    mov         ecx,15E
 006096B4    mov         edx,60AAB8;'HasBalanceBoard'
 006096B9    mov         eax,dword ptr [ebx]
 006096BB    call        THashTable.Add
 006096C0    mov         ecx,15E
 006096C5    mov         edx,60AAE4;'BalanceBoard.Exists'
 006096CA    mov         eax,dword ptr [ebx]
 006096CC    call        THashTable.Add
 006096D1    mov         ecx,4A
 006096D6    mov         edx,60AB18;'Expansion'
 006096DB    mov         eax,dword ptr [ebx]
 006096DD    call        THashTable.Add
 006096E2    mov         ecx,4A
 006096E7    mov         edx,60AB38;'Attachment'
 006096EC    mov         eax,dword ptr [ebx]
 006096EE    call        THashTable.Add
 006096F3    mov         ecx,141
 006096F8    mov         edx,60AB5C;'Expansion2'
 006096FD    mov         eax,dword ptr [ebx]
 006096FF    call        THashTable.Add
 00609704    mov         ecx,18
 00609709    mov         edx,60AB80;'Written'
 0060970E    mov         eax,dword ptr [ebx]
 00609710    call        THashTable.Add
 00609715    mov         ecx,19
 0060971A    mov         edx,60AB9C;'WriteSuccess'
 0060971F    mov         eax,dword ptr [ebx]
 00609721    call        THashTable.Add
 00609726    mov         ecx,1A
 0060972B    mov         edx,60ABC4;'Channel'
 00609730    mov         eax,dword ptr [ebx]
 00609732    call        THashTable.Add
 00609737    mov         ecx,37
 0060973C    mov         edx,60ABE0;'Report11'
 00609741    mov         eax,dword ptr [ebx]
 00609743    call        THashTable.Add
 00609748    mov         ecx,1B
 0060974D    mov         edx,60AC00;'Report13'
 00609752    mov         eax,dword ptr [ebx]
 00609754    call        THashTable.Add
 00609759    mov         ecx,1C
 0060975E    mov         edx,60AC20;'Report14'
 00609763    mov         eax,dword ptr [ebx]
 00609765    call        THashTable.Add
 0060976A    mov         ecx,1D
 0060976F    mov         edx,60AC40;'Report15'
 00609774    mov         eax,dword ptr [ebx]
 00609776    call        THashTable.Add
 0060977B    mov         ecx,1E
 00609780    mov         edx,60AC60;'Report19'
 00609785    mov         eax,dword ptr [ebx]
 00609787    call        THashTable.Add
 0060978C    mov         ecx,1F
 00609791    mov         edx,60AC80;'Report1A'
 00609796    mov         eax,dword ptr [ebx]
 00609798    call        THashTable.Add
 0060979D    mov         ecx,20
 006097A2    mov         edx,60ACA0;'InReport'
 006097A7    mov         eax,dword ptr [ebx]
 006097A9    call        THashTable.Add
 006097AE    xor         esi,esi
 006097B0    lea         edx,[ebp-8]
 006097B3    mov         eax,esi
 006097B5    call        IntToStr
 006097BA    mov         ecx,dword ptr [ebp-8]
 006097BD    lea         eax,[ebp-4]
 006097C0    mov         edx,60ACC0;'Exp'
 006097C5    call        @UStrCat3
 006097CA    mov         edx,dword ptr [ebp-4]
 006097CD    lea         ecx,[esi+108]
 006097D3    mov         eax,dword ptr [ebx]
 006097D5    call        THashTable.Add
 006097DA    inc         esi
 006097DB    cmp         esi,15
>006097DE    jne         006097B0
 006097E0    xor         esi,esi
 006097E2    lea         edx,[ebp-10]
 006097E5    mov         eax,esi
 006097E7    call        IntToStr
 006097EC    mov         ecx,dword ptr [ebp-10]
 006097EF    lea         eax,[ebp-0C]
 006097F2    mov         edx,60ACD4;'InByte'
 006097F7    call        @UStrCat3
 006097FC    mov         edx,dword ptr [ebp-0C]
 006097FF    lea         ecx,[esi+20]
 00609802    mov         eax,dword ptr [ebx]
 00609804    call        THashTable.Add
 00609809    inc         esi
 0060980A    cmp         esi,16
>0060980D    jne         006097E2
 0060980F    mov         ecx,36
 00609814    mov         edx,60ACF0;'Count'
 00609819    mov         eax,dword ptr [ebx]
 0060981B    call        THashTable.Add
 00609820    mov         ecx,38
 00609825    mov         edx,60AD08;'InByteString'
 0060982A    mov         eax,dword ptr [ebx]
 0060982C    call        THashTable.Add
 00609831    mov         ecx,11D
 00609836    mov         edx,60AD30;'ExpString'
 0060983B    mov         eax,dword ptr [ebx]
 0060983D    call        THashTable.Add
 00609842    mov         ecx,39
 00609847    mov         edx,60AD50;'Serial'
 0060984C    mov         eax,dword ptr [ebx]
 0060984E    call        THashTable.Add
 00609853    mov         ecx,39
 00609858    mov         edx,60AD6C;'SerialNumber'
 0060985D    mov         eax,dword ptr [ebx]
 0060985F    call        THashTable.Add
 00609864    mov         esi,1
 00609869    push        60AD94;'dot'
 0060986E    lea         edx,[ebp-18]
 00609871    mov         eax,esi
 00609873    call        IntToStr
 00609878    push        dword ptr [ebp-18]
 0060987B    push        60ADA8;'x'
 00609880    lea         eax,[ebp-14]
 00609883    mov         edx,3
 00609888    call        @UStrCatN
 0060988D    mov         edx,dword ptr [ebp-14]
 00609890    mov         eax,esi
 00609892    dec         eax
 00609893    mov         edi,eax
 00609895    add         edi,edi
 00609897    add         edi,edi
 00609899    mov         ecx,edi
 0060989B    add         ecx,3A
 0060989E    mov         eax,dword ptr [ebx]
 006098A0    call        THashTable.Add
 006098A5    push        60AD94;'dot'
 006098AA    lea         edx,[ebp-20]
 006098AD    mov         eax,esi
 006098AF    call        IntToStr
 006098B4    push        dword ptr [ebp-20]
 006098B7    push        60ADB8;'y'
 006098BC    lea         eax,[ebp-1C]
 006098BF    mov         edx,3
 006098C4    call        @UStrCatN
 006098C9    mov         edx,dword ptr [ebp-1C]
 006098CC    mov         ecx,edi
 006098CE    add         ecx,3B
 006098D1    mov         eax,dword ptr [ebx]
 006098D3    call        THashTable.Add
 006098D8    push        60AD94;'dot'
 006098DD    lea         edx,[ebp-28]
 006098E0    mov         eax,esi
 006098E2    call        IntToStr
 006098E7    push        dword ptr [ebp-28]
 006098EA    push        60ADC8;'size'
 006098EF    lea         eax,[ebp-24]
 006098F2    mov         edx,3
 006098F7    call        @UStrCatN
 006098FC    mov         edx,dword ptr [ebp-24]
 006098FF    mov         ecx,edi
 00609901    add         ecx,3C
 00609904    mov         eax,dword ptr [ebx]
 00609906    call        THashTable.Add
 0060990B    push        60AD94;'dot'
 00609910    lea         edx,[ebp-30]
 00609913    mov         eax,esi
 00609915    call        IntToStr
 0060991A    push        dword ptr [ebp-30]
 0060991D    push        60ADE0;'vis'
 00609922    lea         eax,[ebp-2C]
 00609925    mov         edx,3
 0060992A    call        @UStrCatN
 0060992F    mov         edx,dword ptr [ebp-2C]
 00609932    mov         ecx,edi
 00609934    add         ecx,3D
 00609937    mov         eax,dword ptr [ebx]
 00609939    call        THashTable.Add
 0060993E    push        60AD94;'dot'
 00609943    lea         edx,[ebp-38]
 00609946    mov         eax,esi
 00609948    call        IntToStr
 0060994D    push        dword ptr [ebp-38]
 00609950    push        60ADF4;'visible'
 00609955    lea         eax,[ebp-34]
 00609958    mov         edx,3
 0060995D    call        @UStrCatN
 00609962    mov         edx,dword ptr [ebp-34]
 00609965    mov         eax,esi
 00609967    dec         eax
 00609968    mov         ecx,eax
 0060996A    add         ecx,ecx
 0060996C    add         ecx,ecx
 0060996E    add         ecx,3D
 00609971    mov         eax,dword ptr [ebx]
 00609973    call        THashTable.Add
 00609978    push        60AD94;'dot'
 0060997D    lea         edx,[ebp-40]
 00609980    mov         eax,esi
 00609982    call        IntToStr
 00609987    push        dword ptr [ebp-40]
 0060998A    push        60AE10;'intensity'
 0060998F    lea         eax,[ebp-3C]
 00609992    mov         edx,3
 00609997    call        @UStrCatN
 0060999C    mov         edx,dword ptr [ebp-3C]
 0060999F    mov         ecx,esi
 006099A1    dec         ecx
 006099A2    add         ecx,11F
 006099A8    mov         eax,dword ptr [ebx]
 006099AA    call        THashTable.Add
 006099AF    inc         esi
 006099B0    cmp         esi,5
>006099B3    jne         00609869
 006099B9    mov         ecx,4B
 006099BE    mov         edx,60AE30;'Battery'
 006099C3    mov         eax,dword ptr [ebx]
 006099C5    call        THashTable.Add
 006099CA    mov         ecx,4C
 006099CF    mov         edx,60AE4C;'cxx'
 006099D4    mov         eax,dword ptr [ebx]
 006099D6    call        THashTable.Add
 006099DB    mov         ecx,4D
 006099E0    mov         edx,60AE60;'cxy'
 006099E5    mov         eax,dword ptr [ebx]
 006099E7    call        THashTable.Add
 006099EC    mov         ecx,4E
 006099F1    mov         edx,60AE74;'cxz'
 006099F6    mov         eax,dword ptr [ebx]
 006099F8    call        THashTable.Add
 006099FD    mov         ecx,4F
 00609A02    mov         edx,60AE88;'cyx'
 00609A07    mov         eax,dword ptr [ebx]
 00609A09    call        THashTable.Add
 00609A0E    mov         ecx,50
 00609A13    mov         edx,60AE9C;'cyy'
 00609A18    mov         eax,dword ptr [ebx]
 00609A1A    call        THashTable.Add
 00609A1F    mov         ecx,51
 00609A24    mov         edx,60AEB0;'cyz'
 00609A29    mov         eax,dword ptr [ebx]
 00609A2B    call        THashTable.Add
 00609A30    mov         ecx,52
 00609A35    mov         edx,60AEC4;'czx'
 00609A3A    mov         eax,dword ptr [ebx]
 00609A3C    call        THashTable.Add
 00609A41    mov         ecx,53
 00609A46    mov         edx,60AED8;'czy'
 00609A4B    mov         eax,dword ptr [ebx]
 00609A4D    call        THashTable.Add
 00609A52    mov         ecx,54
 00609A57    mov         edx,60AEEC;'czz'
 00609A5C    mov         eax,dword ptr [ebx]
 00609A5E    call        THashTable.Add
 00609A63    mov         ecx,55
 00609A68    mov         edx,60AF00;'gx'
 00609A6D    mov         eax,dword ptr [ebx]
 00609A6F    call        THashTable.Add
 00609A74    mov         ecx,56
 00609A79    mov         edx,60AF14;'gy'
 00609A7E    mov         eax,dword ptr [ebx]
 00609A80    call        THashTable.Add
 00609A85    mov         ecx,57
 00609A8A    mov         edx,60AF28;'gz'
 00609A8F    mov         eax,dword ptr [ebx]
 00609A91    call        THashTable.Add
 00609A96    mov         ecx,58
 00609A9B    mov         edx,60AF3C;'RawAccX'
 00609AA0    mov         eax,dword ptr [ebx]
 00609AA2    call        THashTable.Add
 00609AA7    mov         ecx,59
 00609AAC    mov         edx,60AF58;'RawAccY'
 00609AB1    mov         eax,dword ptr [ebx]
 00609AB3    call        THashTable.Add
 00609AB8    mov         ecx,5A
 00609ABD    mov         edx,60AF74;'RawAccZ'
 00609AC2    mov         eax,dword ptr [ebx]
 00609AC4    call        THashTable.Add
 00609AC9    mov         ecx,5B
 00609ACE    mov         edx,60AF90;'RawAcc'
 00609AD3    mov         eax,dword ptr [ebx]
 00609AD5    call        THashTable.Add
 00609ADA    mov         ecx,5C
 00609ADF    mov         edx,60AFAC;'RawForce'
 00609AE4    mov         eax,dword ptr [ebx]
 00609AE6    call        THashTable.Add
 00609AEB    mov         ecx,5D
 00609AF0    mov         edx,60AFCC;'g'
 00609AF5    mov         eax,dword ptr [ebx]
 00609AF7    call        THashTable.Add
 00609AFC    mov         ecx,5E
 00609B01    mov         edx,60AFDC;'Gravity'
 00609B06    mov         eax,dword ptr [ebx]
 00609B08    call        THashTable.Add
 00609B0D    mov         ecx,62
 00609B12    mov         edx,60AFF8;'Pitch'
 00609B17    mov         eax,dword ptr [ebx]
 00609B19    call        THashTable.Add
 00609B1E    mov         ecx,63
 00609B23    mov         edx,60B010;'Roll'
 00609B28    mov         eax,dword ptr [ebx]
 00609B2A    call        THashTable.Add
 00609B2F    mov         ecx,74
 00609B34    mov         edx,60B028;'SmoothPitch'
 00609B39    mov         eax,dword ptr [ebx]
 00609B3B    call        THashTable.Add
 00609B40    mov         ecx,75
 00609B45    mov         edx,60B04C;'SmoothRoll'
 00609B4A    mov         eax,dword ptr [ebx]
 00609B4C    call        THashTable.Add
 00609B51    mov         ecx,106
 00609B56    mov         edx,60B070;'len'
 00609B5B    mov         eax,dword ptr [ebx]
 00609B5D    call        THashTable.Add
 00609B62    mov         ecx,107
 00609B67    mov         edx,60B084;'frames'
 00609B6C    mov         eax,dword ptr [ebx]
 00609B6E    call        THashTable.Add
 00609B73    mov         ecx,65
 00609B78    mov         edx,60B0A0;'RelAccX'
 00609B7D    mov         eax,dword ptr [ebx]
 00609B7F    call        THashTable.Add
 00609B84    mov         ecx,66
 00609B89    mov         edx,60B0BC;'RelAccY'
 00609B8E    mov         eax,dword ptr [ebx]
 00609B90    call        THashTable.Add
 00609B95    mov         ecx,67
 00609B9A    mov         edx,60B0D8;'RelAccZ'
 00609B9F    mov         eax,dword ptr [ebx]
 00609BA1    call        THashTable.Add
 00609BA6    mov         ecx,68
 00609BAB    mov         edx,60B0F4;'RelAcc'
 00609BB0    mov         eax,dword ptr [ebx]
 00609BB2    call        THashTable.Add
 00609BB7    mov         ecx,6C
 00609BBC    mov         edx,60ADA8;'x'
 00609BC1    mov         eax,dword ptr [ebx]
 00609BC3    call        THashTable.Add
 00609BC8    mov         ecx,6D
 00609BCD    mov         edx,60ADB8;'y'
 00609BD2    mov         eax,dword ptr [ebx]
 00609BD4    call        THashTable.Add
 00609BD9    mov         ecx,6E
 00609BDE    mov         edx,60B110;'z'
 00609BE3    mov         eax,dword ptr [ebx]
 00609BE5    call        THashTable.Add
 00609BEA    mov         ecx,0FE
 00609BEF    mov         edx,60B120;^'RealLeftStick'
 00609BF4    mov         eax,dword ptr [ebx]
 00609BF6    call        THashTable.Add
 00609BFB    mov         ecx,0FE
 00609C00    mov         edx,60B140;^'RealLeftStick'
 00609C05    mov         eax,dword ptr [ebx]
 00609C07    call        THashTable.Add
 00609C0C    mov         ecx,0FE
 00609C11    mov         edx,60B154;'xyz'
 00609C16    mov         eax,dword ptr [ebx]
 00609C18    call        THashTable.Add
 00609C1D    mov         ecx,0FF
 00609C22    mov         edx,60B168;'PointerXY'
 00609C27    mov         eax,dword ptr [ebx]
 00609C29    call        THashTable.Add
 00609C2E    mov         ecx,0FF
 00609C33    mov         edx,60B188;'Pointer'
 00609C38    mov         eax,dword ptr [ebx]
 00609C3A    call        THashTable.Add
 00609C3F    mov         ecx,0FA
 00609C44    mov         edx,60B1A4;'PointerX'
 00609C49    mov         eax,dword ptr [ebx]
 00609C4B    call        THashTable.Add
 00609C50    mov         ecx,0FB
 00609C55    mov         edx,60B1C4;'PointerY'
 00609C5A    mov         eax,dword ptr [ebx]
 00609C5C    call        THashTable.Add
 00609C61    mov         ecx,104
 00609C66    mov         edx,60B1E4;'SmoothPointerX'
 00609C6B    mov         eax,dword ptr [ebx]
 00609C6D    call        THashTable.Add
 00609C72    mov         ecx,105
 00609C77    mov         edx,60B210;'SmoothPointerY'
 00609C7C    mov         eax,dword ptr [ebx]
 00609C7E    call        THashTable.Add
 00609C83    mov         ecx,0FC
 00609C88    mov         edx,60B23C;'PointerVisible'
 00609C8D    mov         eax,dword ptr [ebx]
 00609C8F    call        THashTable.Add
 00609C94    mov         ecx,0FD
 00609C99    mov         edx,60B268;'PointerOnScreen'
 00609C9E    mov         eax,dword ptr [ebx]
 00609CA0    call        THashTable.Add
 00609CA5    mov         ecx,64
 00609CAA    mov         edx,60B294;'RotMat'
 00609CAF    mov         eax,dword ptr [ebx]
 00609CB1    call        THashTable.Add
 00609CB6    mov         ecx,76
 00609CBB    mov         edx,60B2B0;'TimeStamp'
 00609CC0    mov         eax,dword ptr [ebx]
 00609CC2    call        THashTable.Add
 00609CC7    mov         ecx,0C3
 00609CCC    mov         edx,60B2D0;'Nunchuk.Joy'
 00609CD1    mov         eax,dword ptr [ebx]
 00609CD3    call        THashTable.Add
 00609CD8    mov         ecx,96
 00609CDD    mov         edx,60B2F4;'Nunchuk.JoyX'
 00609CE2    mov         eax,dword ptr [ebx]
 00609CE4    call        THashTable.Add
 00609CE9    mov         ecx,97
 00609CEE    mov         edx,60B31C;'Nunchuk.JoyY'
 00609CF3    mov         eax,dword ptr [ebx]
 00609CF5    call        THashTable.Add
 00609CFA    mov         ecx,99
 00609CFF    mov         edx,60B344;'Nunchuk.ZButton'
 00609D04    mov         eax,dword ptr [ebx]
 00609D06    call        THashTable.Add
 00609D0B    mov         ecx,98
 00609D10    mov         edx,60B370;'Nunchuk.CButton'
 00609D15    mov         eax,dword ptr [ebx]
 00609D17    call        THashTable.Add
 00609D1C    mov         ecx,0C5
 00609D21    mov         edx,60B39C;'Nunchuk.ClassicButton'
 00609D26    mov         eax,dword ptr [ebx]
 00609D28    call        THashTable.Add
 00609D2D    mov         ecx,9A
 00609D32    mov         edx,60B3D4;'Nunchuk.RawForceX'
 00609D37    mov         eax,dword ptr [ebx]
 00609D39    call        THashTable.Add
 00609D3E    mov         ecx,9B
 00609D43    mov         edx,60B404;'Nunchuk.RawForceY'
 00609D48    mov         eax,dword ptr [ebx]
 00609D4A    call        THashTable.Add
 00609D4F    mov         ecx,9C
 00609D54    mov         edx,60B434;'Nunchuk.RawForceZ'
 00609D59    mov         eax,dword ptr [ebx]
 00609D5B    call        THashTable.Add
 00609D60    mov         ecx,0AD
 00609D65    mov         edx,60B464;'Nunchuk.gx'
 00609D6A    mov         eax,dword ptr [ebx]
 00609D6C    call        THashTable.Add
 00609D71    mov         ecx,0AE
 00609D76    mov         edx,60B488;'Nunchuk.gy'
 00609D7B    mov         eax,dword ptr [ebx]
 00609D7D    call        THashTable.Add
 00609D82    mov         ecx,0AF
 00609D87    mov         edx,60B4AC;'Nunchuk.gz'
 00609D8C    mov         eax,dword ptr [ebx]
 00609D8E    call        THashTable.Add
 00609D93    mov         ecx,0B0
 00609D98    mov         edx,60B4D0;'Nunchuk.g'
 00609D9D    mov         eax,dword ptr [ebx]
 00609D9F    call        THashTable.Add
 00609DA4    mov         ecx,0B1
 00609DA9    mov         edx,60B4F0;'Nunchuk.cyx'
 00609DAE    mov         eax,dword ptr [ebx]
 00609DB0    call        THashTable.Add
 00609DB5    mov         ecx,0B2
 00609DBA    mov         edx,60B514;'Nunchuk.cxy'
 00609DBF    mov         eax,dword ptr [ebx]
 00609DC1    call        THashTable.Add
 00609DC6    mov         ecx,0B3
 00609DCB    mov         edx,60B538;'Nunchuk.cxz'
 00609DD0    mov         eax,dword ptr [ebx]
 00609DD2    call        THashTable.Add
 00609DD7    mov         ecx,0B4
 00609DDC    mov         edx,60B55C;'Nunchuk.cxx'
 00609DE1    mov         eax,dword ptr [ebx]
 00609DE3    call        THashTable.Add
 00609DE8    mov         ecx,0B5
 00609DED    mov         edx,60B580;'Nunchuk.cyy'
 00609DF2    mov         eax,dword ptr [ebx]
 00609DF4    call        THashTable.Add
 00609DF9    mov         ecx,0B6
 00609DFE    mov         edx,60B5A4;'Nunchuk.czz'
 00609E03    mov         eax,dword ptr [ebx]
 00609E05    call        THashTable.Add
 00609E0A    mov         ecx,0B7
 00609E0F    mov         edx,60B5C8;'Nunchuk.Pitch'
 00609E14    mov         eax,dword ptr [ebx]
 00609E16    call        THashTable.Add
 00609E1B    mov         ecx,0B8
 00609E20    mov         edx,60B5F0;'Nunchuk.Roll'
 00609E25    mov         eax,dword ptr [ebx]
 00609E27    call        THashTable.Add
 00609E2C    mov         ecx,0C1
 00609E31    mov         edx,60B618;'Nunchuk.SmoothPitch'
 00609E36    mov         eax,dword ptr [ebx]
 00609E38    call        THashTable.Add
 00609E3D    mov         ecx,0C2
 00609E42    mov         edx,60B64C;'Nunchuk.SmoothRoll'
 00609E47    mov         eax,dword ptr [ebx]
 00609E49    call        THashTable.Add
 00609E4E    mov         ecx,0BC
 00609E53    mov         edx,60B680;'Nunchuk.RawAcc'
 00609E58    mov         eax,dword ptr [ebx]
 00609E5A    call        THashTable.Add
 00609E5F    mov         ecx,0B9
 00609E64    mov         edx,60B6AC;'Nunchuk.RawAccX'
 00609E69    mov         eax,dword ptr [ebx]
 00609E6B    call        THashTable.Add
 00609E70    mov         ecx,0BA
 00609E75    mov         edx,60B6D8;'Nunchuk.RawAccY'
 00609E7A    mov         eax,dword ptr [ebx]
 00609E7C    call        THashTable.Add
 00609E81    mov         ecx,0BB
 00609E86    mov         edx,60B704;'Nunchuk.RawAccZ'
 00609E8B    mov         eax,dword ptr [ebx]
 00609E8D    call        THashTable.Add
 00609E92    mov         ecx,0C0
 00609E97    mov         edx,60B730;'Nunchuk.RelAcc'
 00609E9C    mov         eax,dword ptr [ebx]
 00609E9E    call        THashTable.Add
 00609EA3    mov         ecx,0BD
 00609EA8    mov         edx,60B75C;'Nunchuk.RelAccX'
 00609EAD    mov         eax,dword ptr [ebx]
 00609EAF    call        THashTable.Add
 00609EB4    mov         ecx,0BE
 00609EB9    mov         edx,60B788;'Nunchuk.RelAccY'
 00609EBE    mov         eax,dword ptr [ebx]
 00609EC0    call        THashTable.Add
 00609EC5    mov         ecx,0BF
 00609ECA    mov         edx,60B7B4;'Nunchuk.RelAccZ'
 00609ECF    mov         eax,dword ptr [ebx]
 00609ED1    call        THashTable.Add
 00609ED6    xor         esi,esi
 00609ED8    lea         edx,[ebp-48]
 00609EDB    mov         eax,esi
 00609EDD    call        IntToStr
 00609EE2    mov         ecx,dword ptr [ebp-48]
 00609EE5    lea         eax,[ebp-44]
 00609EE8    mov         edx,60B7E0;'Nunchuk.Byte'
 00609EED    call        @UStrCat3
 00609EF2    mov         edx,dword ptr [ebp-44]
 00609EF5    lea         ecx,[esi+9D]
 00609EFB    mov         eax,dword ptr [ebx]
 00609EFD    call        THashTable.Add
 00609F02    inc         esi
 00609F03    cmp         esi,10
>00609F06    jne         00609ED8
 00609F08    xor         esi,esi
 00609F0A    lea         edx,[ebp-50]
 00609F0D    mov         eax,esi
 00609F0F    call        IntToStr
 00609F14    mov         ecx,dword ptr [ebp-50]
 00609F17    lea         eax,[ebp-4C]
 00609F1A    mov         edx,60B808;'Classic.Byte'
 00609F1F    call        @UStrCat3
 00609F24    mov         edx,dword ptr [ebp-4C]
 00609F27    lea         ecx,[esi+9D]
 00609F2D    mov         eax,dword ptr [ebx]
 00609F2F    call        THashTable.Add
 00609F34    inc         esi
 00609F35    cmp         esi,10
>00609F38    jne         00609F0A
 00609F3A    mov         ecx,0E2
 00609F3F    mov         edx,60B830;'Classic.Joy1'
 00609F44    mov         eax,dword ptr [ebx]
 00609F46    call        THashTable.Add
 00609F4B    mov         ecx,0E3
 00609F50    mov         edx,60B858;'Classic.Joy2'
 00609F55    mov         eax,dword ptr [ebx]
 00609F57    call        THashTable.Add
 00609F5C    mov         ecx,0E4
 00609F61    mov         edx,60B880;'Classic.Dpad'
 00609F66    mov         eax,dword ptr [ebx]
 00609F68    call        THashTable.Add
 00609F6D    mov         ecx,0DE
 00609F72    mov         edx,60B8A8;'Classic.Joy1X'
 00609F77    mov         eax,dword ptr [ebx]
 00609F79    call        THashTable.Add
 00609F7E    mov         ecx,0DF
 00609F83    mov         edx,60B8D0;'Classic.Joy1Y'
 00609F88    mov         eax,dword ptr [ebx]
 00609F8A    call        THashTable.Add
 00609F8F    mov         ecx,0E0
 00609F94    mov         edx,60B8F8;'Classic.Joy2X'
 00609F99    mov         eax,dword ptr [ebx]
 00609F9B    call        THashTable.Add
 00609FA0    mov         ecx,0E1
 00609FA5    mov         edx,60B920;'Classic.Joy2Y'
 00609FAA    mov         eax,dword ptr [ebx]
 00609FAC    call        THashTable.Add
 00609FB1    mov         ecx,0D8
 00609FB6    mov         edx,60B948;'Classic.RawJoy1X'
 00609FBB    mov         eax,dword ptr [ebx]
 00609FBD    call        THashTable.Add
 00609FC2    mov         ecx,0D9
 00609FC7    mov         edx,60B978;'Classic.RawJoy1Y'
 00609FCC    mov         eax,dword ptr [ebx]
 00609FCE    call        THashTable.Add
 00609FD3    mov         ecx,0DA
 00609FD8    mov         edx,60B9A8;'Classic.RawJoy2X'
 00609FDD    mov         eax,dword ptr [ebx]
 00609FDF    call        THashTable.Add
 00609FE4    mov         ecx,0DB
 00609FE9    mov         edx,60B9D8;'Classic.RawJoy2Y'
 00609FEE    mov         eax,dword ptr [ebx]
 00609FF0    call        THashTable.Add
 00609FF5    mov         ecx,0DC
 00609FFA    mov         edx,60BA08;'Classic.L'
 00609FFF    mov         eax,dword ptr [ebx]
 0060A001    call        THashTable.Add
 0060A006    mov         ecx,0DD
 0060A00B    mov         edx,60BA28;'Classic.R'
 0060A010    mov         eax,dword ptr [ebx]
 0060A012    call        THashTable.Add
 0060A017    mov         ecx,0C8
 0060A01C    mov         edx,60BA48;'Classic.Up'
 0060A021    mov         eax,dword ptr [ebx]
 0060A023    call        THashTable.Add
 0060A028    mov         ecx,0C9
 0060A02D    mov         edx,60BA6C;'Classic.Left'
 0060A032    mov         eax,dword ptr [ebx]
 0060A034    call        THashTable.Add
 0060A039    mov         ecx,0CA
 0060A03E    mov         edx,60BA94;'Classic.ZR'
 0060A043    mov         eax,dword ptr [ebx]
 0060A045    call        THashTable.Add
 0060A04A    mov         ecx,0CB
 0060A04F    mov         edx,60BAB8;'Classic.x'
 0060A054    mov         eax,dword ptr [ebx]
 0060A056    call        THashTable.Add
 0060A05B    mov         ecx,0CC
 0060A060    mov         edx,60BAD8;'Classic.a'
 0060A065    mov         eax,dword ptr [ebx]
 0060A067    call        THashTable.Add
 0060A06C    mov         ecx,0CD
 0060A071    mov         edx,60BAF8;'Classic.y'
 0060A076    mov         eax,dword ptr [ebx]
 0060A078    call        THashTable.Add
 0060A07D    mov         ecx,0CE
 0060A082    mov         edx,60BB18;'Classic.b'
 0060A087    mov         eax,dword ptr [ebx]
 0060A089    call        THashTable.Add
 0060A08E    mov         ecx,0CF
 0060A093    mov         edx,60BB38;'Classic.ZL'
 0060A098    mov         eax,dword ptr [ebx]
 0060A09A    call        THashTable.Add
 0060A09F    mov         ecx,0D0
 0060A0A4    mov         edx,60BB5C;'Classic.Unused'
 0060A0A9    mov         eax,dword ptr [ebx]
 0060A0AB    call        THashTable.Add
 0060A0B0    mov         ecx,0D1
 0060A0B5    mov         edx,60BB88;'Classic.RFull'
 0060A0BA    mov         eax,dword ptr [ebx]
 0060A0BC    call        THashTable.Add
 0060A0C1    mov         ecx,0D2
 0060A0C6    mov         edx,60BBB0;'Classic.Plus'
 0060A0CB    mov         eax,dword ptr [ebx]
 0060A0CD    call        THashTable.Add
 0060A0D2    mov         ecx,0D2
 0060A0D7    mov         edx,60BBD8;'Classic.Start'
 0060A0DC    mov         eax,dword ptr [ebx]
 0060A0DE    call        THashTable.Add
 0060A0E3    mov         ecx,0D3
 0060A0E8    mov         edx,60BC00;'Classic.Home'
 0060A0ED    mov         eax,dword ptr [ebx]
 0060A0EF    call        THashTable.Add
 0060A0F4    mov         ecx,0D4
 0060A0F9    mov         edx,60BC28;'Classic.Minus'
 0060A0FE    mov         eax,dword ptr [ebx]
 0060A100    call        THashTable.Add
 0060A105    mov         ecx,0D4
 0060A10A    mov         edx,60BC50;'Classic.Select'
 0060A10F    mov         eax,dword ptr [ebx]
 0060A111    call        THashTable.Add
 0060A116    mov         ecx,0D5
 0060A11B    mov         edx,60BC7C;'Classic.LFull'
 0060A120    mov         eax,dword ptr [ebx]
 0060A122    call        THashTable.Add
 0060A127    mov         ecx,0D6
 0060A12C    mov         edx,60BCA4;'Classic.Down'
 0060A131    mov         eax,dword ptr [ebx]
 0060A133    call        THashTable.Add
 0060A138    mov         ecx,0D7
 0060A13D    mov         edx,60BCCC;'Classic.Right'
 0060A142    mov         eax,dword ptr [ebx]
 0060A144    call        THashTable.Add
 0060A149    mov         ecx,12C
 0060A14E    mov         edx,60BCF4;'Guitar.StrumUp'
 0060A153    mov         eax,dword ptr [ebx]
 0060A155    call        THashTable.Add
 0060A15A    mov         ecx,12F
 0060A15F    mov         edx,60BD20;'Guitar.Fret3'
 0060A164    mov         eax,dword ptr [ebx]
 0060A166    call        THashTable.Add
 0060A16B    mov         ecx,130
 0060A170    mov         edx,60BD48;'Guitar.Fret1'
 0060A175    mov         eax,dword ptr [ebx]
 0060A177    call        THashTable.Add
 0060A17C    mov         ecx,131
 0060A181    mov         edx,60BD70;'Guitar.Fret4'
 0060A186    mov         eax,dword ptr [ebx]
 0060A188    call        THashTable.Add
 0060A18D    mov         ecx,132
 0060A192    mov         edx,60BD98;'Guitar.Fret2'
 0060A197    mov         eax,dword ptr [ebx]
 0060A199    call        THashTable.Add
 0060A19E    mov         ecx,133
 0060A1A3    mov         edx,60BDC0;'Guitar.Fret5'
 0060A1A8    mov         eax,dword ptr [ebx]
 0060A1AA    call        THashTable.Add
 0060A1AF    mov         ecx,12F
 0060A1B4    mov         edx,60BDE8;'Guitar.Yellow'
 0060A1B9    mov         eax,dword ptr [ebx]
 0060A1BB    call        THashTable.Add
 0060A1C0    mov         ecx,130
 0060A1C5    mov         edx,60BE10;'Guitar.Green'
 0060A1CA    mov         eax,dword ptr [ebx]
 0060A1CC    call        THashTable.Add
 0060A1D1    mov         ecx,131
 0060A1D6    mov         edx,60BE38;'Guitar.Blue'
 0060A1DB    mov         eax,dword ptr [ebx]
 0060A1DD    call        THashTable.Add
 0060A1E2    mov         ecx,132
 0060A1E7    mov         edx,60BE5C;'Guitar.Red'
 0060A1EC    mov         eax,dword ptr [ebx]
 0060A1EE    call        THashTable.Add
 0060A1F3    mov         ecx,133
 0060A1F8    mov         edx,60BE80;'Guitar.Orange'
 0060A1FD    mov         eax,dword ptr [ebx]
 0060A1FF    call        THashTable.Add
 0060A204    mov         ecx,136
 0060A209    mov         edx,60BEA8;'Guitar.Plus'
 0060A20E    mov         eax,dword ptr [ebx]
 0060A210    call        THashTable.Add
 0060A215    mov         ecx,136
 0060A21A    mov         edx,60BECC;'Guitar.Start'
 0060A21F    mov         eax,dword ptr [ebx]
 0060A221    call        THashTable.Add
 0060A226    mov         ecx,138
 0060A22B    mov         edx,60BEF4;'Guitar.Minus'
 0060A230    mov         eax,dword ptr [ebx]
 0060A232    call        THashTable.Add
 0060A237    mov         ecx,138
 0060A23C    mov         edx,60BF1C;'Guitar.Select'
 0060A241    mov         eax,dword ptr [ebx]
 0060A243    call        THashTable.Add
 0060A248    mov         ecx,13A
 0060A24D    mov         edx,60BF44;'Guitar.StrumDown'
 0060A252    mov         eax,dword ptr [ebx]
 0060A254    call        THashTable.Add
 0060A259    mov         ecx,13F
 0060A25E    mov         edx,60BF74;'Guitar.Joy'
 0060A263    mov         eax,dword ptr [ebx]
 0060A265    call        THashTable.Add
 0060A26A    mov         ecx,13C
 0060A26F    mov         edx,60BF98;'Guitar.JoyX'
 0060A274    mov         eax,dword ptr [ebx]
 0060A276    call        THashTable.Add
 0060A27B    mov         ecx,13D
 0060A280    mov         edx,60BFBC;'Guitar.JoyY'
 0060A285    mov         eax,dword ptr [ebx]
 0060A287    call        THashTable.Add
 0060A28C    mov         ecx,13E
 0060A291    mov         edx,60BFE0;'Guitar.WhammyBar'
 0060A296    mov         eax,dword ptr [ebx]
 0060A298    call        THashTable.Add
 0060A29D    mov         ecx,163
 0060A2A2    mov         edx,60C010;'BalanceBoard.Weight'
 0060A2A7    mov         eax,dword ptr [ebx]
 0060A2A9    call        THashTable.Add
 0060A2AE    mov         ecx,164
 0060A2B3    mov         edx,60C044;'BalanceBoard.FrontLeft'
 0060A2B8    mov         eax,dword ptr [ebx]
 0060A2BA    call        THashTable.Add
 0060A2BF    mov         ecx,165
 0060A2C4    mov         edx,60C080;'BalanceBoard.FrontRight'
 0060A2C9    mov         eax,dword ptr [ebx]
 0060A2CB    call        THashTable.Add
 0060A2D0    mov         ecx,166
 0060A2D5    mov         edx,60C0BC;'BalanceBoard.BackLeft'
 0060A2DA    mov         eax,dword ptr [ebx]
 0060A2DC    call        THashTable.Add
 0060A2E1    mov         ecx,167
 0060A2E6    mov         edx,60C0F4;'BalanceBoard.BackRight'
 0060A2EB    mov         eax,dword ptr [ebx]
 0060A2ED    call        THashTable.Add
 0060A2F2    mov         ecx,15F
 0060A2F7    mov         edx,60C130;'BalanceBoard.RawFrontLeft'
 0060A2FC    mov         eax,dword ptr [ebx]
 0060A2FE    call        THashTable.Add
 0060A303    mov         ecx,160
 0060A308    mov         edx,60C170;'BalanceBoard.RawFrontRight'
 0060A30D    mov         eax,dword ptr [ebx]
 0060A30F    call        THashTable.Add
 0060A314    mov         ecx,161
 0060A319    mov         edx,60C1B4;'BalanceBoard.RawBackLeft'
 0060A31E    mov         eax,dword ptr [ebx]
 0060A320    call        THashTable.Add
 0060A325    mov         ecx,162
 0060A32A    mov         edx,60C1F4;'BalanceBoard.RawBackRight'
 0060A32F    mov         eax,dword ptr [ebx]
 0060A331    call        THashTable.Add
 0060A336    mov         ecx,16A
 0060A33B    mov         edx,60C234;'BalanceBoard.WeightLeft'
 0060A340    mov         eax,dword ptr [ebx]
 0060A342    call        THashTable.Add
 0060A347    mov         ecx,16B
 0060A34C    mov         edx,60C270;'BalanceBoard.WeightRight'
 0060A351    mov         eax,dword ptr [ebx]
 0060A353    call        THashTable.Add
 0060A358    mov         ecx,16C
 0060A35D    mov         edx,60C2B0;'BalanceBoard.WeightFront'
 0060A362    mov         eax,dword ptr [ebx]
 0060A364    call        THashTable.Add
 0060A369    mov         ecx,16D
 0060A36E    mov         edx,60C2F0;'BalanceBoard.WeightBack'
 0060A373    mov         eax,dword ptr [ebx]
 0060A375    call        THashTable.Add
 0060A37A    mov         ecx,168
 0060A37F    mov         edx,60C32C;'BalanceBoard.EE'
 0060A384    mov         eax,dword ptr [ebx]
 0060A386    call        THashTable.Add
 0060A38B    mov         ecx,169
 0060A390    mov         edx,60C358;'BalanceBoard.QuestionQuestion'
 0060A395    mov         eax,dword ptr [ebx]
 0060A397    call        THashTable.Add
 0060A39C    mov         ecx,16E
 0060A3A1    mov         edx,60C3A0;'BalanceBoard.JoyX'
 0060A3A6    mov         eax,dword ptr [ebx]
 0060A3A8    call        THashTable.Add
 0060A3AD    mov         ecx,16F
 0060A3B2    mov         edx,60C3D0;'BalanceBoard.JoyY'
 0060A3B7    mov         eax,dword ptr [ebx]
 0060A3B9    call        THashTable.Add
 0060A3BE    mov         ecx,170
 0060A3C3    mov         edx,60C400;'BalanceBoard.Joy'
 0060A3C8    mov         eax,dword ptr [ebx]
 0060A3CA    call        THashTable.Add
 0060A3CF    mov         ecx,13
 0060A3D4    mov         edx,60C430;'BalanceBoard.LED'
 0060A3D9    mov         eax,dword ptr [ebx]
 0060A3DB    call        THashTable.Add
 0060A3E0    mov         ecx,0B
 0060A3E5    mov         edx,60C460;'BalanceBoard.Button'
 0060A3EA    mov         eax,dword ptr [ebx]
 0060A3EC    call        THashTable.Add
 0060A3F1    mov         ecx,171
 0060A3F6    mov         edx,60C494;'BalanceBoard.CalibFrontLeftMin'
 0060A3FB    mov         eax,dword ptr [ebx]
 0060A3FD    call        THashTable.Add
 0060A402    mov         ecx,174
 0060A407    mov         edx,60C4E0;'BalanceBoard.CalibFrontRightMin'
 0060A40C    mov         eax,dword ptr [ebx]
 0060A40E    call        THashTable.Add
 0060A413    mov         ecx,177
 0060A418    mov         edx,60C52C;'BalanceBoard.CalibBackLeftMin'
 0060A41D    mov         eax,dword ptr [ebx]
 0060A41F    call        THashTable.Add
 0060A424    mov         ecx,17A
 0060A429    mov         edx,60C574;'BalanceBoard.CalibBackRightMin'
 0060A42E    mov         eax,dword ptr [ebx]
 0060A430    call        THashTable.Add
 0060A435    mov         ecx,172
 0060A43A    mov         edx,60C5C0;'BalanceBoard.CalibFrontLeftMid'
 0060A43F    mov         eax,dword ptr [ebx]
 0060A441    call        THashTable.Add
 0060A446    mov         ecx,175
 0060A44B    mov         edx,60C60C;'BalanceBoard.CalibFrontRightMid'
 0060A450    mov         eax,dword ptr [ebx]
 0060A452    call        THashTable.Add
 0060A457    mov         ecx,178
 0060A45C    mov         edx,60C658;'BalanceBoard.CalibBackLeftMid'
 0060A461    mov         eax,dword ptr [ebx]
 0060A463    call        THashTable.Add
 0060A468    mov         ecx,17B
 0060A46D    mov         edx,60C6A0;'BalanceBoard.CalibBackRightMid'
 0060A472    mov         eax,dword ptr [ebx]
 0060A474    call        THashTable.Add
 0060A479    mov         ecx,173
 0060A47E    mov         edx,60C6EC;'BalanceBoard.CalibFrontLeftMax'
 0060A483    mov         eax,dword ptr [ebx]
 0060A485    call        THashTable.Add
 0060A48A    mov         ecx,176
 0060A48F    mov         edx,60C738;'BalanceBoard.CalibFrontRightMax'
 0060A494    mov         eax,dword ptr [ebx]
 0060A496    call        THashTable.Add
 0060A49B    mov         ecx,179
 0060A4A0    mov         edx,60C784;'BalanceBoard.CalibBackLeftMax'
 0060A4A5    mov         eax,dword ptr [ebx]
 0060A4A7    call        THashTable.Add
 0060A4AC    mov         ecx,17C
 0060A4B1    mov         edx,60C7CC;'BalanceBoard.CalibBackRightMax'
 0060A4B6    mov         eax,dword ptr [ebx]
 0060A4B8    call        THashTable.Add
 0060A4BD    mov         ecx,6F
 0060A4C2    mov         edx,60C818;'Speaker'
 0060A4C7    mov         eax,dword ptr [ebx]
 0060A4C9    call        THashTable.Add
 0060A4CE    mov         ecx,70
 0060A4D3    mov         edx,60C834;'Mute'
 0060A4D8    mov         eax,dword ptr [ebx]
 0060A4DA    call        THashTable.Add
 0060A4DF    mov         ecx,71
 0060A4E4    mov         edx,60C84C;'SampleRate'
 0060A4E9    mov         eax,dword ptr [ebx]
 0060A4EB    call        THashTable.Add
 0060A4F0    mov         ecx,72
 0060A4F5    mov         edx,60C870;'Volume'
 0060A4FA    mov         eax,dword ptr [ebx]
 0060A4FC    call        THashTable.Add
 0060A501    mov         ecx,73
 0060A506    mov         edx,60C88C;'Frequency'
 0060A50B    mov         eax,dword ptr [ebx]
 0060A50D    call        THashTable.Add
 0060A512    mov         ecx,73
 0060A517    mov         edx,60C8AC;'Freq'
 0060A51C    mov         eax,dword ptr [ebx]
 0060A51E    call        THashTable.Add
 0060A523    mov         ecx,77
 0060A528    mov         edx,60C8C4;'SensorBarDots'
 0060A52D    mov         eax,dword ptr [ebx]
 0060A52F    call        THashTable.Add
 0060A534    mov         ecx,78
 0060A539    mov         edx,60C8EC;'SensorBarSeparation'
 0060A53E    mov         eax,dword ptr [ebx]
 0060A540    call        THashTable.Add
 0060A545    mov         ecx,78
 0060A54A    mov         edx,60C920;'SensorBarSeperation'
 0060A54F    mov         eax,dword ptr [ebx]
 0060A551    call        THashTable.Add
 0060A556    mov         ecx,79
 0060A55B    mov         edx,60C954;'SensorBarDistance'
 0060A560    mov         eax,dword ptr [ebx]
 0060A562    call        THashTable.Add
 0060A567    xor         eax,eax
 0060A569    pop         edx
 0060A56A    pop         ecx
 0060A56B    pop         ecx
 0060A56C    mov         dword ptr fs:[eax],edx
 0060A56F    push        60A589
 0060A574    lea         eax,[ebp-50]
 0060A577    mov         edx,14
 0060A57C    call        @UStrArrayClr
 0060A581    ret
>0060A582    jmp         @HandleFinally
>0060A587    jmp         0060A574
 0060A589    pop         edi
 0060A58A    pop         esi
 0060A58B    pop         ebx
 0060A58C    mov         esp,ebp
 0060A58E    pop         ebp
 0060A58F    ret
*}
end;

//0060C978
{*function sub_0060C978(?:?):?;
begin
 0060C978    push        ebp
 0060C979    mov         ebp,esp
 0060C97B    add         esp,0FFFFFFF4
 0060C97E    push        ebx
 0060C97F    push        esi
 0060C980    push        edi
 0060C981    xor         edx,edx
 0060C983    mov         dword ptr [ebp-8],edx
 0060C986    mov         dword ptr [ebp-4],eax
 0060C989    mov         eax,dword ptr [ebp-4]
 0060C98C    call        @UStrAddRef
 0060C991    xor         eax,eax
 0060C993    push        ebp
 0060C994    push        60CCC6
 0060C999    push        dword ptr fs:[eax]
 0060C99C    mov         dword ptr fs:[eax],esp
 0060C99F    xor         esi,esi
 0060C9A1    lea         eax,[ebp-8]
 0060C9A4    mov         edx,dword ptr [ebp-4]
 0060C9A7    call        @UStrLAsg
 0060C9AC    lea         eax,[ebp-8]
 0060C9AF    mov         edx,60CCE4;'NunchukOld'
 0060C9B4    call        004F9BD0
 0060C9B9    mov         byte ptr [ebp-9],al
 0060C9BC    lea         eax,[ebp-8]
 0060C9BF    mov         edx,60CD08;'ClassicOld'
 0060C9C4    call        004F9BD0
 0060C9C9    mov         byte ptr [ebp-0A],al
 0060C9CC    lea         eax,[ebp-8]
 0060C9CF    mov         edx,60CD2C;'WiiGuitarOld'
 0060C9D4    call        004F9BD0
 0060C9D9    mov         byte ptr [ebp-0B],al
 0060C9DC    lea         eax,[ebp-8]
 0060C9DF    mov         edx,60CD54;'BalanceBoardOld'
 0060C9E4    call        004F9BD0
 0060C9E9    mov         byte ptr [ebp-0C],al
 0060C9EC    cmp         byte ptr [ebp-9],0
>0060C9F0    jne         0060CA2A
 0060C9F2    cmp         byte ptr [ebp-0A],0
>0060C9F6    jne         0060CA2A
 0060C9F8    cmp         byte ptr [ebp-0B],0
>0060C9FC    jne         0060CA2A
 0060C9FE    cmp         byte ptr [ebp-0C],0
>0060CA02    jne         0060CA2A
 0060CA04    lea         eax,[ebp-8]
 0060CA07    mov         edx,60CD80;'WiimoteOld'
 0060CA0C    call        004F9BD0
 0060CA11    test        al,al
>0060CA13    jne         0060CA2A
 0060CA15    lea         eax,[ebp-8]
 0060CA18    mov         edx,60CDA4;'WiiRemoteOld'
 0060CA1D    call        004F9BD0
 0060CA22    test        al,al
>0060CA24    je          0060CCAB
 0060CA2A    lea         eax,[ebp-8]
 0060CA2D    call        004F9D00
 0060CA32    mov         ebx,eax
 0060CA34    lea         eax,[ebp-8]
 0060CA37    mov         edx,60CDCC;'.'
 0060CA3C    call        004F9BD0
 0060CA41    test        al,al
>0060CA43    je          0060CCAB
 0060CA49    cmp         byte ptr [ebp-9],0
>0060CA4D    je          0060CA5F
 0060CA4F    lea         eax,[ebp-8]
 0060CA52    mov         ecx,dword ptr [ebp-8]
 0060CA55    mov         edx,60CDDC;'Nunchuk.'
 0060CA5A    call        @UStrCat3
 0060CA5F    cmp         byte ptr [ebp-0A],0
>0060CA63    je          0060CA75
 0060CA65    lea         eax,[ebp-8]
 0060CA68    mov         ecx,dword ptr [ebp-8]
 0060CA6B    mov         edx,60CDFC;'Classic.'
 0060CA70    call        @UStrCat3
 0060CA75    cmp         byte ptr [ebp-0B],0
>0060CA79    je          0060CA8B
 0060CA7B    lea         eax,[ebp-8]
 0060CA7E    mov         ecx,dword ptr [ebp-8]
 0060CA81    mov         edx,60CE1C;'Guitar.'
 0060CA86    call        @UStrCat3
 0060CA8B    cmp         byte ptr [ebp-0C],0
>0060CA8F    je          0060CAA1
 0060CA91    lea         eax,[ebp-8]
 0060CA94    mov         ecx,dword ptr [ebp-8]
 0060CA97    mov         edx,60CE38;'BalanceBoard.'
 0060CA9C    call        @UStrCat3
 0060CAA1    mov         eax,dword ptr [ebp-8]
 0060CAA4    call        0061273C
 0060CAA9    mov         edi,eax
 0060CAAB    test        edi,edi
>0060CAAD    jl          0060CCAB
 0060CAB3    mov         dl,1
 0060CAB5    mov         eax,[00605374];TWiimoteOldValue
 0060CABA    call        TObject.Create;TWiimoteOldValue.Create
 0060CABF    mov         esi,eax
 0060CAC1    mov         dword ptr [esi+20],edi;TWiimoteOldValue..................................Item:Integer
 0060CAC4    test        ebx,ebx
>0060CAC6    jle         0060CACD
 0060CAC8    cmp         ebx,10
>0060CACB    jle         0060CAD2
 0060CACD    mov         ebx,1
 0060CAD2    mov         dword ptr [esi+18],ebx;TWiimoteOldValue....................................................
 0060CAD5    mov         byte ptr ds:[817994],1;gvar_00817994
 0060CADC    cmp         edi,77
>0060CADF    jg          0060CB7A
>0060CAE5    je          0060CC4C
 0060CAEB    cmp         edi,3A
>0060CAEE    jge         0060CB2F
 0060CAF0    cmp         edi,1F
>0060CAF3    jg          0060CB15
>0060CAF5    je          0060CC4C
 0060CAFB    add         edi,0FFFFFFFD
 0060CAFE    sub         edi,3
>0060CB01    jb          0060CC1E
 0060CB07    sub         edi,15
>0060CB0A    je          0060CC4C
>0060CB10    jmp         0060CCAB
 0060CB15    add         edi,0FFFFFFDD
 0060CB18    sub         edi,3
>0060CB1B    jb          0060CC33
 0060CB21    sub         edi,10
>0060CB24    jb          0060CC55
>0060CB2A    jmp         0060CCAB
 0060CB2F    cmp         edi,6C
>0060CB32    jge         0060CB57
 0060CB34    add         edi,0FFFFFFC6
 0060CB37    sub         edi,10
>0060CB3A    jb          0060CC4C
>0060CB40    je          0060CC80
 0060CB46    add         edi,0FFFFFFF5
 0060CB49    sub         edi,17
>0060CB4C    jb          0060CC1E
>0060CB52    jmp         0060CCAB
 0060CB57    add         edi,0FFFFFF94
 0060CB5A    sub         edi,3
>0060CB5D    jb          0060CC67
 0060CB63    sub         edi,5
>0060CB66    jb          0060CC77
 0060CB6C    sub         edi,2
>0060CB6F    jb          0060CC1E
>0060CB75    jmp         0060CCAB
 0060CB7A    cmp         edi,0FD
>0060CB80    jge         0060CBCA
 0060CB82    cmp         edi,0C8
>0060CB88    jge         0060CBA4
 0060CB8A    sub         edi,79
>0060CB8D    je          0060CC4C
 0060CB93    add         edi,0FFFFFFE3
 0060CB96    sub         edi,30
>0060CB99    jb          0060CC89
>0060CB9F    jmp         0060CCAB
 0060CBA4    add         edi,0FFFFFF38
 0060CBAA    sub         edi,1D
>0060CBAD    jb          0060CC92
 0060CBB3    add         edi,0FFFFFFEB
 0060CBB6    sub         edi,2
>0060CBB9    jb          0060CC67
>0060CBBF    je          0060CC5E
>0060CBC5    jmp         0060CCAB
 0060CBCA    cmp         edi,11F
>0060CBD0    jge         0060CBF6
 0060CBD2    add         edi,0FFFFFF03
 0060CBD8    sub         edi,3
>0060CBDB    jb          0060CC67
 0060CBE1    add         edi,0FFFFFFFC
 0060CBE4    sub         edi,2
>0060CBE7    jb          0060CC67
 0060CBE9    add         edi,0FFFFFFFE
 0060CBEC    sub         edi,16
>0060CBEF    jb          0060CC2A
>0060CBF1    jmp         0060CCAB
 0060CBF6    add         edi,0FFFFFEE1
 0060CBFC    sub         edi,4
>0060CBFF    jb          0060CC3C
 0060CC01    add         edi,0FFFFFFF7
 0060CC04    sub         edi,16
>0060CC07    jb          0060CC9B
 0060CC0D    add         edi,0FFFFFFE4
 0060CC10    sub         edi,1F
>0060CC13    jb          0060CCA4
>0060CC19    jmp         0060CCAB
 0060CC1E    mov         byte ptr ds:[817995],1;gvar_00817995
>0060CC25    jmp         0060CCAB
 0060CC2A    mov         byte ptr ds:[817997],1;gvar_00817997
>0060CC31    jmp         0060CCAB
 0060CC33    mov         byte ptr ds:[817995],1;gvar_00817995
>0060CC3A    jmp         0060CCAB
 0060CC3C    mov         byte ptr ds:[817996],1;gvar_00817996
 0060CC43    mov         byte ptr ds:[817999],1;gvar_00817999
>0060CC4A    jmp         0060CCAB
 0060CC4C    mov         byte ptr ds:[817996],1;gvar_00817996
>0060CC53    jmp         0060CCAB
 0060CC55    mov         byte ptr ds:[817996],1;gvar_00817996
>0060CC5C    jmp         0060CCAB
 0060CC5E    mov         byte ptr ds:[817996],1;gvar_00817996
>0060CC65    jmp         0060CCAB
 0060CC67    mov         byte ptr ds:[817996],1;gvar_00817996
 0060CC6E    mov         byte ptr ds:[817995],1;gvar_00817995
>0060CC75    jmp         0060CCAB
 0060CC77    mov         byte ptr ds:[817998],1;gvar_00817998
>0060CC7E    jmp         0060CCAB
 0060CC80    mov         byte ptr ds:[817997],1;gvar_00817997
>0060CC87    jmp         0060CCAB
 0060CC89    mov         byte ptr ds:[817997],1;gvar_00817997
>0060CC90    jmp         0060CCAB
 0060CC92    mov         byte ptr ds:[817997],1;gvar_00817997
>0060CC99    jmp         0060CCAB
 0060CC9B    mov         byte ptr ds:[817997],1;gvar_00817997
>0060CCA2    jmp         0060CCAB
 0060CCA4    mov         byte ptr ds:[817997],1;gvar_00817997
 0060CCAB    xor         eax,eax
 0060CCAD    pop         edx
 0060CCAE    pop         ecx
 0060CCAF    pop         ecx
 0060CCB0    mov         dword ptr fs:[eax],edx
 0060CCB3    push        60CCCD
 0060CCB8    lea         eax,[ebp-8]
 0060CCBB    mov         edx,2
 0060CCC0    call        @UStrArrayClr
 0060CCC5    ret
>0060CCC6    jmp         @HandleFinally
>0060CCCB    jmp         0060CCB8
 0060CCCD    mov         eax,esi
 0060CCCF    pop         edi
 0060CCD0    pop         esi
 0060CCD1    pop         ebx
 0060CCD2    mov         esp,ebp
 0060CCD4    pop         ebp
 0060CCD5    ret
end;*}

//0060CE54
function TWiimoteOldValue.CanSet:Boolean;
begin
{*
 0060CE54    mov         eax,dword ptr [eax+20];TWiimoteOldValue...................................Item:Integer
 0060CE57    cmp         eax,4C
>0060CE5A    jge         0060CE71
 0060CE5C    dec         eax
 0060CE5D    sub         eax,2
>0060CE60    jb          0060CE90
 0060CE62    add         eax,0FFFFFFF0
 0060CE65    sub         eax,4
>0060CE68    jb          0060CE90
 0060CE6A    sub         eax,3
>0060CE6D    je          0060CE90
>0060CE6F    jmp         0060CE99
 0060CE71    add         eax,0FFFFFFB4
 0060CE74    sub         eax,9
>0060CE77    jb          0060CE93
 0060CE79    add         eax,0FFFFFFEC
 0060CE7C    sub         eax,6
>0060CE7F    jb          0060CE96
 0060CE81    add         eax,0FFFFFFF8
 0060CE84    sub         eax,3
>0060CE87    jb          0060CE96
 0060CE89    sub         eax,0A4
>0060CE8E    jne         0060CE99
 0060CE90    mov         al,1
 0060CE92    ret
 0060CE93    mov         al,1
 0060CE95    ret
 0060CE96    mov         al,1
 0060CE98    ret
 0060CE99    xor         eax,eax
 0060CE9B    ret
*}
end;

//0060CE9C
procedure TWiimoteOldValue.CreateClone;
begin
{*
 0060CE9C    mov         dl,1
 0060CE9E    mov         eax,[00605374];TWiimoteOldValue
 0060CEA3    call        TObject.Create;TWiimoteOldValue.Create
 0060CEA8    ret
*}
end;

//0060CEAC
procedure TWiimoteOldValue.FillClone(c:TExpression);
begin
{*
 0060CEAC    push        ebx
 0060CEAD    push        esi
 0060CEAE    mov         esi,edx
 0060CEB0    mov         ebx,eax
 0060CEB2    mov         edx,esi
 0060CEB4    mov         eax,ebx
 0060CEB6    call        TExpression.FillClone
 0060CEBB    mov         eax,esi
 0060CEBD    mov         edx,dword ptr [ebx+20];TWiimoteOldValue....................................Item:Integer
 0060CEC0    mov         dword ptr [eax+20],edx
 0060CEC3    mov         edx,dword ptr [ebx+18];TWiimoteOldValue....................................................
 0060CEC6    mov         dword ptr [eax+18],edx
 0060CEC9    pop         esi
 0060CECA    pop         ebx
 0060CECB    ret
*}
end;

//0060CECC
function TWiimoteOldValue.GetDataType:TDataType;
begin
{*
 0060CECC    mov         eax,dword ptr [eax+20];TWiimoteOldValue.....................................Item:Integer
 0060CECF    cmp         eax,78
>0060CED2    jge         0060D0C8
 0060CED8    cmp         eax,77
>0060CEDB    ja          0060D29F
 0060CEE1    jmp         dword ptr [eax*4+60CEE8]
 0060CEE1    dd          0060D23C
 0060CEE1    dd          0060D24E
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D248
 0060CEE1    dd          0060D248
 0060CEE1    dd          0060D248
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D245
 0060CEE1    dd          0060D23C
 0060CEE1    dd          0060D23C
 0060CEE1    dd          0060D242
 0060CEE1    dd          0060D242
 0060CEE1    dd          0060D242
 0060CEE1    dd          0060D242
 0060CEE1    dd          0060D23C
 0060CEE1    dd          0060D254
 0060CEE1    dd          0060D251
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D25D
 0060CEE1    dd          0060D25D
 0060CEE1    dd          0060D25D
 0060CEE1    dd          0060D25D
 0060CEE1    dd          0060D25D
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D257
 0060CEE1    dd          0060D25A
 0060CEE1    dd          0060D25D
 0060CEE1    dd          0060D239
 0060CEE1    dd          0060D239
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D263
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D263
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D263
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D260
 0060CEE1    dd          0060D263
 0060CEE1    dd          0060D23F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D24B
 0060CEE1    dd          0060D266
 0060CEE1    dd          0060D266
 0060CEE1    dd          0060D266
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D269
 0060CEE1    dd          0060D269
 0060CEE1    dd          0060D269
 0060CEE1    dd          0060D269
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D26C
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D269
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D293
 0060CEE1    dd          0060D293
 0060CEE1    dd          0060D290
 0060CEE1    dd          0060D28D
 0060CEE1    dd          0060D28D
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D29F
 0060CEE1    dd          0060D230
 0060D0C8    cmp         eax,0C8
>0060D0CD    jge         0060D18B
 0060D0D3    cmp         eax,0B7
>0060D0D8    jge         0060D13A
 0060D0DA    cmp         eax,9A
>0060D0DF    jge         0060D10D
 0060D0E1    add         eax,0FFFFFF88
 0060D0E4    sub         eax,2
>0060D0E7    jb          0060D236
>0060D0ED    je          0060D29C
 0060D0F3    add         eax,0FFFFFFE4
 0060D0F6    sub         eax,2
>0060D0F9    jb          0060D26F
 0060D0FF    sub         eax,2
>0060D102    jb          0060D272
>0060D108    jmp         0060D29F
 0060D10D    add         eax,0FFFFFF66
 0060D112    sub         eax,13
>0060D115    jb          0060D275
 0060D11B    sub         eax,2
>0060D11E    jb          0060D278
 0060D124    dec         eax
>0060D125    je          0060D269
 0060D12B    dec         eax
 0060D12C    sub         eax,6
>0060D12F    jb          0060D27E
>0060D135    jmp         0060D29F
 0060D13A    add         eax,0FFFFFF49
 0060D13F    cmp         eax,0E
>0060D142    ja          0060D29F
 0060D148    jmp         dword ptr [eax*4+60D14F]
 0060D148    dd          0060D27B
 0060D148    dd          0060D27B
 0060D148    dd          0060D278
 0060D148    dd          0060D278
 0060D148    dd          0060D29F
 0060D148    dd          0060D269
 0060D148    dd          0060D29F
 0060D148    dd          0060D29F
 0060D148    dd          0060D29F
 0060D148    dd          0060D269
 0060D148    dd          0060D27B
 0060D148    dd          0060D27B
 0060D148    dd          0060D296
 0060D148    dd          0060D23C
 0060D148    dd          0060D272
 0060D18B    cmp         eax,11E
>0060D190    jg          0060D1EF
>0060D192    je          0060D24E
 0060D198    cmp         eax,0FE
>0060D19D    jge         0060D1CD
 0060D19F    add         eax,0FFFFFF38
 0060D1A4    sub         eax,10
>0060D1A7    jb          0060D281
 0060D1AD    sub         eax,4
>0060D1B0    jb          0060D284
 0060D1B6    sub         eax,2
>0060D1B9    jb          0060D28A
 0060D1BF    sub         eax,4
>0060D1C2    jb          0060D287
>0060D1C8    jmp         0060D29F
 0060D1CD    add         eax,0FFFFFF02
 0060D1D2    sub         eax,2
>0060D1D5    jb          0060D296
 0060D1DB    sub         eax,4
>0060D1DE    jb          0060D233
 0060D1E0    add         eax,0FFFFFFFC
 0060D1E3    sub         eax,15
>0060D1E6    jb          0060D257
>0060D1E8    je          0060D239
>0060D1EA    jmp         0060D29F
 0060D1EF    cmp         eax,15E
>0060D1F4    jg          0060D217
>0060D1F6    je          0060D23C
 0060D1F8    add         eax,0FFFFFEE1
 0060D1FD    sub         eax,4
>0060D200    jb          0060D260
 0060D202    add         eax,0FFFFFFF7
 0060D205    sub         eax,10
>0060D208    jb          0060D281
 0060D20A    sub         eax,4
>0060D20D    je          0060D23C
 0060D20F    dec         eax
>0060D210    je          0060D23F
>0060D212    jmp         0060D29F
 0060D217    add         eax,0FFFFFEA1
 0060D21C    sub         eax,4
>0060D21F    jb          0060D299
 0060D221    add         eax,0FFFFFFFB
 0060D224    sub         eax,2
>0060D227    jb          0060D299
 0060D229    sub         eax,6
>0060D22C    je          0060D296
>0060D22E    jmp         0060D29F
 0060D230    mov         al,2
 0060D232    ret
 0060D233    mov         al,3
 0060D235    ret
 0060D236    xor         eax,eax
 0060D238    ret
 0060D239    mov         al,4
 0060D23B    ret
 0060D23C    mov         al,3
 0060D23E    ret
 0060D23F    mov         al,2
 0060D241    ret
 0060D242    mov         al,3
 0060D244    ret
 0060D245    mov         al,3
 0060D247    ret
 0060D248    xor         eax,eax
 0060D24A    ret
 0060D24B    mov         al,2
 0060D24D    ret
 0060D24E    mov         al,2
 0060D250    ret
 0060D251    mov         al,3
 0060D253    ret
 0060D254    mov         al,2
 0060D256    ret
 0060D257    mov         al,2
 0060D259    ret
 0060D25A    mov         al,2
 0060D25C    ret
 0060D25D    mov         al,2
 0060D25F    ret
 0060D260    mov         al,2
 0060D262    ret
 0060D263    mov         al,3
 0060D265    ret
 0060D266    xor         eax,eax
 0060D268    ret
 0060D269    mov         al,5
 0060D26B    ret
 0060D26C    mov         al,6
 0060D26E    ret
 0060D26F    xor         eax,eax
 0060D271    ret
 0060D272    mov         al,3
 0060D274    ret
 0060D275    xor         eax,eax
 0060D277    ret
 0060D278    xor         eax,eax
 0060D27A    ret
 0060D27B    xor         eax,eax
 0060D27D    ret
 0060D27E    xor         eax,eax
 0060D280    ret
 0060D281    mov         al,3
 0060D283    ret
 0060D284    mov         al,2
 0060D286    ret
 0060D287    xor         eax,eax
 0060D289    ret
 0060D28A    xor         eax,eax
 0060D28C    ret
 0060D28D    xor         eax,eax
 0060D28F    ret
 0060D290    mov         al,2
 0060D292    ret
 0060D293    mov         al,3
 0060D295    ret
 0060D296    mov         al,5
 0060D298    ret
 0060D299    mov         al,2
 0060D29B    ret
 0060D29C    mov         al,5
 0060D29E    ret
 0060D29F    xor         eax,eax
 0060D2A1    ret
*}
end;

//0060D2A4
function TWiimoteOldValue.GetPerUnits1:TUnits;
begin
{*
 0060D2A4    mov         eax,dword ptr [eax+20];TWiimoteOldValue......................................Item:Intege...
 0060D2A7    cmp         eax,73
>0060D2AA    jg          0060D2C5
>0060D2AC    je          0060D2DC
 0060D2AE    add         eax,0FFFFFFA8
 0060D2B1    sub         eax,4
>0060D2B4    jb          0060D2D6
 0060D2B6    add         eax,0FFFFFFF7
 0060D2B9    sub         eax,4
>0060D2BC    jb          0060D2D9
 0060D2BE    sub         eax,3
>0060D2C1    jb          0060D2DC
>0060D2C3    jmp         0060D2DF
 0060D2C5    add         eax,0FFFFFF47
 0060D2CA    sub         eax,4
>0060D2CD    jb          0060D2D6
 0060D2CF    sub         eax,4
>0060D2D2    jb          0060D2D9
>0060D2D4    jmp         0060D2DF
 0060D2D6    mov         al,11
 0060D2D8    ret
 0060D2D9    mov         al,11
 0060D2DB    ret
 0060D2DC    mov         al,11
 0060D2DE    ret
 0060D2DF    xor         eax,eax
 0060D2E1    ret
*}
end;

//0060D2E4
function TWiimoteOldValue.GetPerUnits2:TUnits;
begin
{*
 0060D2E4    mov         eax,dword ptr [eax+20];TWiimoteOldValue.......................................Item:Integ...
 0060D2E7    add         eax,0FFFFFFA8
 0060D2EA    sub         eax,4
>0060D2ED    jb          0060D306
 0060D2EF    add         eax,0FFFFFFF7
 0060D2F2    sub         eax,4
>0060D2F5    jb          0060D309
 0060D2F7    add         eax,0FFFFFFB0
 0060D2FA    sub         eax,4
>0060D2FD    jb          0060D306
 0060D2FF    sub         eax,4
>0060D302    jb          0060D309
>0060D304    jmp         0060D30C
 0060D306    mov         al,11
 0060D308    ret
 0060D309    mov         al,11
 0060D30B    ret
 0060D30C    xor         eax,eax
 0060D30E    ret
*}
end;

//0060D310
procedure TWiimoteOldValue.GetRotMat(m:TRotMat);
begin
{*
 0060D310    push        ebx
 0060D311    push        esi
 0060D312    push        edi
 0060D313    add         esp,0FFFFFFC4
 0060D316    mov         esi,edx
 0060D318    mov         edx,dword ptr [eax+18];TWiimoteOldValue....................................................
 0060D31B    cmp         edx,1
>0060D31E    jl          0060D325
 0060D320    cmp         edx,10
>0060D323    jle         0060D357
 0060D325    xor         ecx,ecx
 0060D327    mov         edi,esi
 0060D329    xor         edx,edx
 0060D32B    mov         eax,edi
 0060D32D    cmp         edx,ecx
 0060D32F    sete        bl
 0060D332    movsx       ebx,bl
 0060D335    mov         dword ptr [esp+20],ebx
 0060D339    fild        dword ptr [esp+20]
 0060D33D    fstp        qword ptr [eax]
 0060D33F    wait
 0060D340    inc         edx
 0060D341    add         eax,8
 0060D344    cmp         edx,3
>0060D347    jne         0060D32D
 0060D349    inc         ecx
 0060D34A    add         edi,18
 0060D34D    cmp         ecx,3
>0060D350    jne         0060D329
>0060D352    jmp         0060D4A3
 0060D357    mov         edx,dword ptr [eax+20];TWiimoteOldValue........................................Item:Inte...
 0060D35A    sub         edx,64
>0060D35D    jne         0060D49C
 0060D363    imul        edx,dword ptr [eax+18],0BA;TWiimoteOldValue................................................
 0060D36A    mov         ecx,dword ptr [edx*8+8174F0];gvar_008174F0
 0060D371    mov         dword ptr [esp],ecx
 0060D374    mov         ecx,dword ptr [edx*8+8174F4];gvar_008174F4
 0060D37B    mov         dword ptr [esp+4],ecx
 0060D37F    mov         ecx,dword ptr [edx*8+8174F8];gvar_008174F8
 0060D386    mov         dword ptr [esp+8],ecx
 0060D38A    mov         ecx,dword ptr [edx*8+8174FC];gvar_008174FC
 0060D391    mov         dword ptr [esp+0C],ecx
 0060D395    mov         eax,dword ptr [edx*8+817500];gvar_00817500
 0060D39C    mov         dword ptr [esp+10],eax
 0060D3A0    mov         eax,dword ptr [edx*8+817504];gvar_00817504
 0060D3A7    mov         dword ptr [esp+14],eax
 0060D3AB    fld         qword ptr [esp]
 0060D3AE    fmul        st,st(0)
 0060D3B0    fstp        tbyte ptr [esp+24]
 0060D3B4    wait
 0060D3B5    fld         qword ptr [esp+8]
 0060D3B9    fmul        st,st(0)
 0060D3BB    fld         tbyte ptr [esp+24]
 0060D3BF    faddp       st(1),st
 0060D3C1    fstp        tbyte ptr [esp+30]
 0060D3C5    wait
 0060D3C6    fld         qword ptr [esp+10]
 0060D3CA    fmul        st,st(0)
 0060D3CC    fld         tbyte ptr [esp+30]
 0060D3D0    faddp       st(1),st
 0060D3D2    add         esp,0FFFFFFF4
 0060D3D5    fstp        tbyte ptr [esp]
 0060D3D8    wait
 0060D3D9    call        Sqrt
 0060D3DE    fstp        qword ptr [esp+18]
 0060D3E2    wait
 0060D3E3    fld         qword ptr [esp+18]
 0060D3E7    fcomp       dword ptr ds:[60D4AC];0:Single
 0060D3ED    wait
 0060D3EE    fnstsw      al
 0060D3F0    sahf
>0060D3F1    je          0060D418
 0060D3F3    fld         qword ptr [esp]
 0060D3F6    fdiv        qword ptr [esp+18]
 0060D3FA    fstp        qword ptr [esp]
 0060D3FD    wait
 0060D3FE    fld         qword ptr [esp+8]
 0060D402    fdiv        qword ptr [esp+18]
 0060D406    fstp        qword ptr [esp+8]
 0060D40A    wait
 0060D40B    fld         qword ptr [esp+10]
 0060D40F    fdiv        qword ptr [esp+18]
 0060D413    fstp        qword ptr [esp+10]
 0060D417    wait
 0060D418    fld         qword ptr [esp]
 0060D41B    fmul        st,st(0)
 0060D41D    fsubr       dword ptr ds:[60D4B0];1:Single
 0060D423    add         esp,0FFFFFFF4
 0060D426    fstp        tbyte ptr [esp]
 0060D429    wait
 0060D42A    call        Sqrt
 0060D42F    fstp        qword ptr [esi]
 0060D431    wait
 0060D432    fld         qword ptr [esp]
 0060D435    fchs
 0060D437    fstp        qword ptr [esi+18]
 0060D43A    wait
 0060D43B    xor         eax,eax
 0060D43D    mov         dword ptr [esi+30],eax
 0060D440    mov         dword ptr [esi+34],eax
 0060D443    mov         eax,dword ptr [esp]
 0060D446    mov         dword ptr [esi+8],eax
 0060D449    mov         eax,dword ptr [esp+4]
 0060D44D    mov         dword ptr [esi+0C],eax
 0060D450    mov         eax,dword ptr [esp+8]
 0060D454    mov         dword ptr [esi+20],eax
 0060D457    mov         eax,dword ptr [esp+0C]
 0060D45B    mov         dword ptr [esi+24],eax
 0060D45E    mov         eax,dword ptr [esp+10]
 0060D462    mov         dword ptr [esi+38],eax
 0060D465    mov         eax,dword ptr [esp+14]
 0060D469    mov         dword ptr [esi+3C],eax
 0060D46C    xor         eax,eax
 0060D46E    mov         dword ptr [esi+10],eax
 0060D471    mov         dword ptr [esi+14],eax
 0060D474    fld         qword ptr [esp+10]
 0060D478    fchs
 0060D47A    fstp        qword ptr [esi+28]
 0060D47D    wait
 0060D47E    fld         qword ptr [esp+10]
 0060D482    fmul        st,st(0)
 0060D484    fsubr       dword ptr ds:[60D4B0];1:Single
 0060D48A    add         esp,0FFFFFFF4
 0060D48D    fstp        tbyte ptr [esp]
 0060D490    wait
 0060D491    call        Sqrt
 0060D496    fstp        qword ptr [esi+40]
 0060D499    wait
>0060D49A    jmp         0060D4A3
 0060D49C    mov         edx,esi
 0060D49E    call        TExpression.GetRotMat
 0060D4A3    add         esp,3C
 0060D4A6    pop         edi
 0060D4A7    pop         esi
 0060D4A8    pop         ebx
 0060D4A9    ret
*}
end;

//0060D4B4
{*procedure TWiimoteOldValue.GetString(?:?);
begin
 0060D4B4    push        ebp
 0060D4B5    mov         ebp,esp
 0060D4B7    add         esp,0FFFFFFEC
 0060D4BA    push        ebx
 0060D4BB    push        esi
 0060D4BC    push        edi
 0060D4BD    xor         ecx,ecx
 0060D4BF    mov         dword ptr [ebp-14],ecx
 0060D4C2    mov         dword ptr [ebp-0C],ecx
 0060D4C5    mov         esi,edx
 0060D4C7    mov         ebx,eax
 0060D4C9    xor         eax,eax
 0060D4CB    push        ebp
 0060D4CC    push        60D653
 0060D4D1    push        dword ptr fs:[eax]
 0060D4D4    mov         dword ptr fs:[eax],esp
 0060D4D7    mov         edi,dword ptr [ebx+18];TWiimoteOldValue....................................................
 0060D4DA    cmp         edi,1
>0060D4DD    jl          0060D4E4
 0060D4DF    cmp         edi,10
>0060D4E2    jle         0060D4F0
 0060D4E4    mov         eax,esi
 0060D4E6    call        @UStrClr
>0060D4EB    jmp         0060D635
 0060D4F0    mov         eax,dword ptr [ebx+20];TWiimoteOldValue.........................................Item:Int...
 0060D4F3    sub         eax,38
>0060D4F6    je          0060D50F
 0060D4F8    dec         eax
>0060D4F9    je          0060D5FC
 0060D4FF    sub         eax,0E4
>0060D504    je          0060D591
>0060D50A    jmp         0060D62C
 0060D50F    mov         eax,esi
 0060D511    call        @UStrClr
 0060D516    imul        eax,edi,0BA
 0060D51C    movzx       eax,byte ptr [eax*8+81746F];gvar_0081746F
 0060D524    call        00608884
 0060D529    test        eax,eax
>0060D52B    jl          0060D56E
 0060D52D    inc         eax
 0060D52E    mov         dword ptr [ebp-8],eax
 0060D531    mov         edi,8179A0;gvar_0078D490
 0060D536    push        dword ptr [esi]
 0060D538    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060D53F    movzx       eax,byte ptr [edi+eax*8-531]
 0060D547    lea         ecx,[ebp-0C]
 0060D54A    mov         edx,2
 0060D54F    call        IntToHex
 0060D554    push        dword ptr [ebp-0C]
 0060D557    push        60D670;' '
 0060D55C    mov         eax,esi
 0060D55E    mov         edx,3
 0060D563    call        @UStrCatN
 0060D568    inc         edi
 0060D569    dec         dword ptr [ebp-8]
>0060D56C    jne         0060D536
 0060D56E    mov         eax,dword ptr [esi]
 0060D570    mov         dword ptr [ebp-10],eax
 0060D573    mov         eax,dword ptr [ebp-10]
 0060D576    test        eax,eax
>0060D578    je          0060D57F
 0060D57A    sub         eax,4
 0060D57D    mov         eax,dword ptr [eax]
 0060D57F    mov         edx,esi
 0060D581    mov         ecx,1
 0060D586    xchg        eax,edx
 0060D587    call        @UStrDelete
>0060D58C    jmp         0060D635
 0060D591    mov         eax,esi
 0060D593    call        @UStrClr
 0060D598    mov         dword ptr [ebp-4],15
 0060D59F    mov         edi,8179A8;gvar_008179A8
 0060D5A4    push        dword ptr [esi]
 0060D5A6    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060D5AD    movzx       eax,byte ptr [edi+eax*8-230]
 0060D5B5    lea         ecx,[ebp-14]
 0060D5B8    mov         edx,2
 0060D5BD    call        IntToHex
 0060D5C2    push        dword ptr [ebp-14]
 0060D5C5    push        60D670;' '
 0060D5CA    mov         eax,esi
 0060D5CC    mov         edx,3
 0060D5D1    call        @UStrCatN
 0060D5D6    inc         edi
 0060D5D7    dec         dword ptr [ebp-4]
>0060D5DA    jne         0060D5A4
 0060D5DC    mov         eax,dword ptr [esi]
 0060D5DE    mov         dword ptr [ebp-10],eax
 0060D5E1    mov         eax,dword ptr [ebp-10]
 0060D5E4    test        eax,eax
>0060D5E6    je          0060D5ED
 0060D5E8    sub         eax,4
 0060D5EB    mov         eax,dword ptr [eax]
 0060D5ED    mov         edx,esi
 0060D5EF    mov         ecx,1
 0060D5F4    xchg        eax,edx
 0060D5F5    call        @UStrDelete
>0060D5FA    jmp         0060D635
 0060D5FC    imul        eax,edi,0BA
 0060D602    cmp         dword ptr [eax*8+8173D0],0;gvar_008173D0
>0060D60A    je          0060D623
 0060D60C    mov         eax,esi
 0060D60E    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060D615    mov         edx,dword ptr [edx*8+8173DC];gvar_008173DC
 0060D61C    call        @UStrAsg
>0060D621    jmp         0060D635
 0060D623    mov         eax,esi
 0060D625    call        @UStrClr
>0060D62A    jmp         0060D635
 0060D62C    mov         edx,esi
 0060D62E    mov         eax,ebx
 0060D630    call        TExpression.GetString
 0060D635    xor         eax,eax
 0060D637    pop         edx
 0060D638    pop         ecx
 0060D639    pop         ecx
 0060D63A    mov         dword ptr fs:[eax],edx
 0060D63D    push        60D65A
 0060D642    lea         eax,[ebp-14]
 0060D645    call        @UStrClr
 0060D64A    lea         eax,[ebp-0C]
 0060D64D    call        @UStrClr
 0060D652    ret
>0060D653    jmp         @HandleFinally
>0060D658    jmp         0060D642
 0060D65A    pop         edi
 0060D65B    pop         esi
 0060D65C    pop         ebx
 0060D65D    mov         esp,ebp
 0060D65F    pop         ebp
 0060D660    ret
end;*}

//0060D674
function TWiimoteOldValue.GetUnits:TUnits;
begin
{*
 0060D674    mov         eax,dword ptr [eax+20];TWiimoteOldValue..........................................Item:In...
 0060D677    cmp         eax,78
>0060D67A    jge         0060D6AD
 0060D67C    cmp         eax,69
>0060D67F    jge         0060D699
 0060D681    add         eax,0FFFFFFA8
 0060D684    sub         eax,4
>0060D687    jb          0060D6E9
 0060D689    add         eax,0FFFFFFFA
 0060D68C    sub         eax,2
>0060D68F    jb          0060D6F2
 0060D691    dec         eax
 0060D692    sub         eax,4
>0060D695    jb          0060D6EC
>0060D697    jmp         0060D6FE
 0060D699    add         eax,0FFFFFF97
 0060D69C    sub         eax,6
>0060D69F    jb          0060D6EF
 0060D6A1    add         eax,0FFFFFFFB
 0060D6A4    sub         eax,2
>0060D6A7    jb          0060D6F2
>0060D6A9    je          0060D6F5
>0060D6AB    jmp         0060D6FE
 0060D6AD    cmp         eax,0C1
>0060D6B2    jge         0060D6CB
 0060D6B4    add         eax,0FFFFFF88
 0060D6B7    sub         eax,2
>0060D6BA    jb          0060D6F8
 0060D6BC    add         eax,0FFFFFFC3
 0060D6BF    sub         eax,2
>0060D6C2    jb          0060D6F2
 0060D6C4    sub         eax,8
>0060D6C7    jb          0060D6E9
>0060D6C9    jmp         0060D6FE
 0060D6CB    add         eax,0FFFFFF3F
 0060D6D0    sub         eax,2
>0060D6D3    jb          0060D6F2
 0060D6D5    add         eax,0FFFFFF60
 0060D6DA    sub         eax,5
>0060D6DD    jb          0060D6FB
 0060D6DF    add         eax,0FFFFFFFE
 0060D6E2    sub         eax,4
>0060D6E5    jb          0060D6FB
>0060D6E7    jmp         0060D6FE
 0060D6E9    mov         al,5
 0060D6EB    ret
 0060D6EC    mov         al,5
 0060D6EE    ret
 0060D6EF    mov         al,5
 0060D6F1    ret
 0060D6F2    mov         al,18
 0060D6F4    ret
 0060D6F5    mov         al,11
 0060D6F7    ret
 0060D6F8    mov         al,5
 0060D6FA    ret
 0060D6FB    mov         al,28
 0060D6FD    ret
 0060D6FE    xor         eax,eax
 0060D700    ret
*}
end;

//0060D704
procedure TWiimoteOldValue.GetValue;
begin
{*
 0060D704    push        ebx
 0060D705    add         esp,0FFFFFF60
 0060D70B    mov         ebx,eax
 0060D70D    mov         eax,dword ptr [ebx+18];TWiimoteOldValue....................................................
 0060D710    cmp         eax,1
>0060D713    jl          0060D723
 0060D715    cmp         eax,10
>0060D718    jg          0060D723
 0060D71A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060D721    jne         0060D731
 0060D723    xor         eax,eax
 0060D725    mov         dword ptr [esp],eax
 0060D728    mov         dword ptr [esp+4],eax
>0060D72C    jmp         006100BD
 0060D731    mov         eax,dword ptr [ebx+20];TWiimoteOldValue...........................................Item:I...
 0060D734    cmp         eax,12C
>0060D739    jl          0060D76B
 0060D73B    cmp         eax,141
>0060D740    jg          0060D76B
 0060D742    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060D749    cmp         byte ptr [eax*8+81746C],3;gvar_0081746C
>0060D751    jne         0060D75D
 0060D753    cmp         byte ptr [eax*8+81746D],5;gvar_0081746D
>0060D75B    je          0060D76B
 0060D75D    xor         eax,eax
 0060D75F    mov         dword ptr [esp],eax
 0060D762    mov         dword ptr [esp+4],eax
>0060D766    jmp         006100BD
 0060D76B    mov         eax,dword ptr [ebx+20];TWiimoteOldValue............................................Item:...
 0060D76E    cmp         eax,15E
>0060D773    jl          0060D7A5
 0060D775    cmp         eax,17C
>0060D77A    jg          0060D7A5
 0060D77C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060D783    cmp         byte ptr [eax*8+81746C],6;gvar_0081746C
>0060D78B    jne         0060D797
 0060D78D    cmp         byte ptr [eax*8+81746D],4;gvar_0081746D
>0060D795    je          0060D7A5
 0060D797    xor         eax,eax
 0060D799    mov         dword ptr [esp],eax
 0060D79C    mov         dword ptr [esp+4],eax
>0060D7A0    jmp         006100BD
 0060D7A5    mov         eax,dword ptr [ebx+20];TWiimoteOldValue.............................................Item...
 0060D7A8    mov         edx,eax
 0060D7AA    cmp         edx,17C
>0060D7B0    ja          006100B4
 0060D7B6    movzx       edx,byte ptr [edx+60D7C4]
 0060D7BD    jmp         dword ptr [edx*4+60D941]
 0060D7BD    db          1
 0060D7BD    db          59
 0060D7BD    db          58
 0060D7BD    db          61
 0060D7BD    db          62
 0060D7BD    db          63
 0060D7BD    db          47
 0060D7BD    db          48
 0060D7BD    db          50
 0060D7BD    db          49
 0060D7BD    db          51
 0060D7BD    db          54
 0060D7BD    db          55
 0060D7BD    db          56
 0060D7BD    db          57
 0060D7BD    db          53
 0060D7BD    db          52
 0060D7BD    db          41
 0060D7BD    db          44
 0060D7BD    db          98
 0060D7BD    db          99
 0060D7BD    db          100
 0060D7BD    db          101
 0060D7BD    db          35
 0060D7BD    db          37
 0060D7BD    db          36
 0060D7BD    db          102
 0060D7BD    db          103
 0060D7BD    db          104
 0060D7BD    db          105
 0060D7BD    db          106
 0060D7BD    db          107
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          108
 0060D7BD    db          34
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          110
 0060D7BD    db          111
 0060D7BD    db          112
 0060D7BD    db          114
 0060D7BD    db          110
 0060D7BD    db          111
 0060D7BD    db          112
 0060D7BD    db          114
 0060D7BD    db          110
 0060D7BD    db          111
 0060D7BD    db          112
 0060D7BD    db          114
 0060D7BD    db          110
 0060D7BD    db          111
 0060D7BD    db          112
 0060D7BD    db          114
 0060D7BD    db          38
 0060D7BD    db          46
 0060D7BD    db          89
 0060D7BD    db          90
 0060D7BD    db          91
 0060D7BD    db          92
 0060D7BD    db          93
 0060D7BD    db          94
 0060D7BD    db          95
 0060D7BD    db          96
 0060D7BD    db          97
 0060D7BD    db          64
 0060D7BD    db          65
 0060D7BD    db          66
 0060D7BD    db          67
 0060D7BD    db          68
 0060D7BD    db          69
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          115
 0060D7BD    db          116
 0060D7BD    db          117
 0060D7BD    db          118
 0060D7BD    db          120
 0060D7BD    db          0
 0060D7BD    db          70
 0060D7BD    db          71
 0060D7BD    db          72
 0060D7BD    db          0
 0060D7BD    db          73
 0060D7BD    db          74
 0060D7BD    db          75
 0060D7BD    db          76
 0060D7BD    db          77
 0060D7BD    db          78
 0060D7BD    db          165
 0060D7BD    db          166
 0060D7BD    db          164
 0060D7BD    db          163
 0060D7BD    db          162
 0060D7BD    db          119
 0060D7BD    db          121
 0060D7BD    db          40
 0060D7BD    db          31
 0060D7BD    db          32
 0060D7BD    db          33
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          122
 0060D7BD    db          123
 0060D7BD    db          143
 0060D7BD    db          144
 0060D7BD    db          147
 0060D7BD    db          148
 0060D7BD    db          149
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          146
 0060D7BD    db          128
 0060D7BD    db          129
 0060D7BD    db          130
 0060D7BD    db          0
 0060D7BD    db          140
 0060D7BD    db          141
 0060D7BD    db          142
 0060D7BD    db          137
 0060D7BD    db          138
 0060D7BD    db          139
 0060D7BD    db          124
 0060D7BD    db          125
 0060D7BD    db          131
 0060D7BD    db          132
 0060D7BD    db          133
 0060D7BD    db          0
 0060D7BD    db          134
 0060D7BD    db          135
 0060D7BD    db          136
 0060D7BD    db          0
 0060D7BD    db          126
 0060D7BD    db          127
 0060D7BD    db          0
 0060D7BD    db          45
 0060D7BD    db          145
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          150
 0060D7BD    db          154
 0060D7BD    db          155
 0060D7BD    db          156
 0060D7BD    db          157
 0060D7BD    db          152
 0060D7BD    db          153
 0060D7BD    db          158
 0060D7BD    db          159
 0060D7BD    db          160
 0060D7BD    db          161
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          79
 0060D7BD    db          80
 0060D7BD    db          84
 0060D7BD    db          83
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          85
 0060D7BD    db          86
 0060D7BD    db          87
 0060D7BD    db          88
 0060D7BD    db          81
 0060D7BD    db          82
 0060D7BD    db          167
 0060D7BD    db          168
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          109
 0060D7BD    db          0
 0060D7BD    db          60
 0060D7BD    db          113
 0060D7BD    db          113
 0060D7BD    db          113
 0060D7BD    db          113
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          151
 0060D7BD    db          158
 0060D7BD    db          159
 0060D7BD    db          153
 0060D7BD    db          0
 0060D7BD    db          42
 0060D7BD    db          39
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          0
 0060D7BD    db          43
 0060D7BD    db          16
 0060D7BD    db          14
 0060D7BD    db          17
 0060D7BD    db          15
 0060D7BD    db          18
 0060D7BD    db          28
 0060D7BD    db          27
 0060D7BD    db          30
 0060D7BD    db          29
 0060D7BD    db          23
 0060D7BD    db          24
 0060D7BD    db          19
 0060D7BD    db          20
 0060D7BD    db          21
 0060D7BD    db          22
 0060D7BD    db          25
 0060D7BD    db          26
 0060D7BD    db          0
 0060D7BD    db          8
 0060D7BD    db          9
 0060D7BD    db          10
 0060D7BD    db          2
 0060D7BD    db          3
 0060D7BD    db          4
 0060D7BD    db          11
 0060D7BD    db          12
 0060D7BD    db          13
 0060D7BD    db          5
 0060D7BD    db          6
 0060D7BD    db          7
 0060D7BD    dd          006100B4
 0060D7BD    dd          0060DBE5
 0060D7BD    dd          0060DC18
 0060D7BD    dd          0060DC4C
 0060D7BD    dd          0060DC80
 0060D7BD    dd          0060DCB4
 0060D7BD    dd          0060DCE8
 0060D7BD    dd          0060DD1C
 0060D7BD    dd          0060DD50
 0060D7BD    dd          0060DD84
 0060D7BD    dd          0060DDB8
 0060D7BD    dd          0060DDEC
 0060D7BD    dd          0060DE20
 0060D7BD    dd          0060DE54
 0060D7BD    dd          0060DE88
 0060D7BD    dd          0060DEC0
 0060D7BD    dd          0060DEF8
 0060D7BD    dd          0060DF30
 0060D7BD    dd          0060DF68
 0060D7BD    dd          0060DF91
 0060D7BD    dd          0060DFB4
 0060D7BD    dd          0060DFD7
 0060D7BD    dd          0060E006
 0060D7BD    dd          0060E035
 0060D7BD    dd          0060E05B
 0060D7BD    dd          0060E081
 0060D7BD    dd          0060E0E1
 0060D7BD    dd          0060E141
 0060D7BD    dd          0060E162
 0060D7BD    dd          0060E183
 0060D7BD    dd          0060E1A4
 0060D7BD    dd          0060E1C5
 0060D7BD    dd          0060E1D4
 0060D7BD    dd          0060E1EC
 0060D7BD    dd          0060E204
 0060D7BD    dd          0060E22A
 0060D7BD    dd          0060E263
 0060D7BD    dd          0060E299
 0060D7BD    dd          0060E2DE
 0060D7BD    dd          0060E31B
 0060D7BD    dd          0060E358
 0060D7BD    dd          0060E390
 0060D7BD    dd          0060E3DF
 0060D7BD    dd          0060E42E
 0060D7BD    dd          0060E47D
 0060D7BD    dd          0060E4B6
 0060D7BD    dd          0060E505
 0060D7BD    dd          0060E542
 0060D7BD    dd          0060E57D
 0060D7BD    dd          0060E5B8
 0060D7BD    dd          0060E5F3
 0060D7BD    dd          0060E62E
 0060D7BD    dd          0060E669
 0060D7BD    dd          0060E6A4
 0060D7BD    dd          0060E6DF
 0060D7BD    dd          0060E71A
 0060D7BD    dd          0060E755
 0060D7BD    dd          0060E790
 0060D7BD    dd          0060E7CB
 0060D7BD    dd          0060E801
 0060D7BD    dd          0060E840
 0060D7BD    dd          0060E8C2
 0060D7BD    dd          0060E8FA
 0060D7BD    dd          0060E932
 0060D7BD    dd          0060E96A
 0060D7BD    dd          0060E9A2
 0060D7BD    dd          0060E9DA
 0060D7BD    dd          0060EA12
 0060D7BD    dd          0060EA46
 0060D7BD    dd          0060EA7A
 0060D7BD    dd          0060EAB2
 0060D7BD    dd          0060EAF6
 0060D7BD    dd          0060EB3A
 0060D7BD    dd          0060EB7E
 0060D7BD    dd          0060EBB6
 0060D7BD    dd          0060EBEE
 0060D7BD    dd          0060EC26
 0060D7BD    dd          0060EC5E
 0060D7BD    dd          0060EC96
 0060D7BD    dd          0060ECCE
 0060D7BD    dd          0060ED06
 0060D7BD    dd          0060ED3E
 0060D7BD    dd          0060ED76
 0060D7BD    dd          0060EDAE
 0060D7BD    dd          0060EDE2
 0060D7BD    dd          0060EE16
 0060D7BD    dd          0060EE4A
 0060D7BD    dd          0060EE7E
 0060D7BD    dd          0060EEB2
 0060D7BD    dd          0060EEE6
 0060D7BD    dd          0060EF1E
 0060D7BD    dd          0060EF56
 0060D7BD    dd          0060EF8E
 0060D7BD    dd          0060EFC6
 0060D7BD    dd          0060EFFE
 0060D7BD    dd          0060F036
 0060D7BD    dd          0060F06E
 0060D7BD    dd          0060F0A6
 0060D7BD    dd          0060F0DE
 0060D7BD    dd          0060F115
 0060D7BD    dd          0060F14C
 0060D7BD    dd          0060F183
 0060D7BD    dd          0060F1BA
 0060D7BD    dd          0060F1E0
 0060D7BD    dd          0060F206
 0060D7BD    dd          0060F22C
 0060D7BD    dd          0060F252
 0060D7BD    dd          0060F278
 0060D7BD    dd          0060F29E
 0060D7BD    dd          0060F2CB
 0060D7BD    dd          0060F2FD
 0060D7BD    dd          0060F32C
 0060D7BD    dd          0060F35B
 0060D7BD    dd          0060F399
 0060D7BD    dd          0060F3CF
 0060D7BD    dd          0060F404
 0060D7BD    dd          0060F425
 0060D7BD    dd          0060F446
 0060D7BD    dd          0060F467
 0060D7BD    dd          0060F4A9
 0060D7BD    dd          0060F4EB
 0060D7BD    dd          0060F53D
 0060D7BD    dd          0060F59B
 0060D7BD    dd          0060F650
 0060D7BD    dd          0060F705
 0060D7BD    dd          0060F71C
 0060D7BD    dd          0060F733
 0060D7BD    dd          0060F74A
 0060D7BD    dd          0060F761
 0060D7BD    dd          0060F778
 0060D7BD    dd          0060F78F
 0060D7BD    dd          0060F7A6
 0060D7BD    dd          0060F7C3
 0060D7BD    dd          0060F7E0
 0060D7BD    dd          0060F7FD
 0060D7BD    dd          0060F82A
 0060D7BD    dd          0060F857
 0060D7BD    dd          0060F884
 0060D7BD    dd          0060F8A5
 0060D7BD    dd          0060F8C6
 0060D7BD    dd          0060F8E7
 0060D7BD    dd          0060F908
 0060D7BD    dd          0060F929
 0060D7BD    dd          0060F94A
 0060D7BD    dd          0060F967
 0060D7BD    dd          0060F984
 0060D7BD    dd          0060F9D1
 0060D7BD    dd          0060F9FE
 0060D7BD    dd          0060FA1F
 0060D7BD    dd          0060FA40
 0060D7BD    dd          0060FA61
 0060D7BD    dd          0060FA92
 0060D7BD    dd          0060FAC3
 0060D7BD    dd          0060FAE0
 0060D7BD    dd          0060FAFD
 0060D7BD    dd          0060FB34
 0060D7BD    dd          0060FB6B
 0060D7BD    dd          0060FBA2
 0060D7BD    dd          0060FBD9
 0060D7BD    dd          0060FCD7
 0060D7BD    dd          0060FDD9
 0060D7BD    dd          0060FED7
 0060D7BD    dd          0060FFD9
 0060D7BD    dd          0060FFFA
 0060D7BD    dd          00610026
 0060D7BD    dd          0061004E
 0060D7BD    dd          00610068
 0060D7BD    dd          00610082
 0060D7BD    dd          006100A0
 0060DBE5    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060DBEC    jne         0060DBFE
 0060DBEE    xor         eax,eax
 0060DBF0    call        00686074
 0060DBF5    fstp        qword ptr [esp]
 0060DBF8    wait
>0060DBF9    jmp         006100BD
 0060DBFE    mov         eax,dword ptr [ebx+18];TWiimoteOldValue....................................................
 0060DC01    cmp         eax,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 0060DC07    setle       al
 0060DC0A    call        00686074
 0060DC0F    fstp        qword ptr [esp]
 0060DC12    wait
>0060DC13    jmp         006100BD
 0060DC18    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DC1F    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DC26    mov         dword ptr [esp+14],eax
 0060DC2A    mov         eax,dword ptr [esp+14]
 0060DC2E    movzx       eax,word ptr [eax+358]
 0060DC35    mov         dword ptr [esp+90],eax
 0060DC3C    fild        dword ptr [esp+90]
 0060DC43    fstp        qword ptr [esp]
 0060DC46    wait
>0060DC47    jmp         006100BD
 0060DC4C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DC53    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DC5A    mov         dword ptr [esp+18],eax
 0060DC5E    mov         eax,dword ptr [esp+18]
 0060DC62    movzx       eax,word ptr [eax+360]
 0060DC69    mov         dword ptr [esp+90],eax
 0060DC70    fild        dword ptr [esp+90]
 0060DC77    fstp        qword ptr [esp]
 0060DC7A    wait
>0060DC7B    jmp         006100BD
 0060DC80    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DC87    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DC8E    mov         dword ptr [esp+1C],eax
 0060DC92    mov         eax,dword ptr [esp+1C]
 0060DC96    movzx       eax,word ptr [eax+368]
 0060DC9D    mov         dword ptr [esp+90],eax
 0060DCA4    fild        dword ptr [esp+90]
 0060DCAB    fstp        qword ptr [esp]
 0060DCAE    wait
>0060DCAF    jmp         006100BD
 0060DCB4    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DCBB    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DCC2    mov         dword ptr [esp+20],eax
 0060DCC6    mov         eax,dword ptr [esp+20]
 0060DCCA    movzx       eax,word ptr [eax+35A]
 0060DCD1    mov         dword ptr [esp+90],eax
 0060DCD8    fild        dword ptr [esp+90]
 0060DCDF    fstp        qword ptr [esp]
 0060DCE2    wait
>0060DCE3    jmp         006100BD
 0060DCE8    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DCEF    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DCF6    mov         dword ptr [esp+24],eax
 0060DCFA    mov         eax,dword ptr [esp+24]
 0060DCFE    movzx       eax,word ptr [eax+362]
 0060DD05    mov         dword ptr [esp+90],eax
 0060DD0C    fild        dword ptr [esp+90]
 0060DD13    fstp        qword ptr [esp]
 0060DD16    wait
>0060DD17    jmp         006100BD
 0060DD1C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DD23    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DD2A    mov         dword ptr [esp+28],eax
 0060DD2E    mov         eax,dword ptr [esp+28]
 0060DD32    movzx       eax,word ptr [eax+36A]
 0060DD39    mov         dword ptr [esp+90],eax
 0060DD40    fild        dword ptr [esp+90]
 0060DD47    fstp        qword ptr [esp]
 0060DD4A    wait
>0060DD4B    jmp         006100BD
 0060DD50    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DD57    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DD5E    mov         dword ptr [esp+2C],eax
 0060DD62    mov         eax,dword ptr [esp+2C]
 0060DD66    movzx       eax,word ptr [eax+35C]
 0060DD6D    mov         dword ptr [esp+90],eax
 0060DD74    fild        dword ptr [esp+90]
 0060DD7B    fstp        qword ptr [esp]
 0060DD7E    wait
>0060DD7F    jmp         006100BD
 0060DD84    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DD8B    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DD92    mov         dword ptr [esp+30],eax
 0060DD96    mov         eax,dword ptr [esp+30]
 0060DD9A    movzx       eax,word ptr [eax+364]
 0060DDA1    mov         dword ptr [esp+90],eax
 0060DDA8    fild        dword ptr [esp+90]
 0060DDAF    fstp        qword ptr [esp]
 0060DDB2    wait
>0060DDB3    jmp         006100BD
 0060DDB8    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DDBF    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DDC6    mov         dword ptr [esp+34],eax
 0060DDCA    mov         eax,dword ptr [esp+34]
 0060DDCE    movzx       eax,word ptr [eax+36C]
 0060DDD5    mov         dword ptr [esp+90],eax
 0060DDDC    fild        dword ptr [esp+90]
 0060DDE3    fstp        qword ptr [esp]
 0060DDE6    wait
>0060DDE7    jmp         006100BD
 0060DDEC    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DDF3    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DDFA    mov         dword ptr [esp+38],eax
 0060DDFE    mov         eax,dword ptr [esp+38]
 0060DE02    movzx       eax,word ptr [eax+35E]
 0060DE09    mov         dword ptr [esp+90],eax
 0060DE10    fild        dword ptr [esp+90]
 0060DE17    fstp        qword ptr [esp]
 0060DE1A    wait
>0060DE1B    jmp         006100BD
 0060DE20    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DE27    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DE2E    mov         dword ptr [esp+3C],eax
 0060DE32    mov         eax,dword ptr [esp+3C]
 0060DE36    movzx       eax,word ptr [eax+366]
 0060DE3D    mov         dword ptr [esp+90],eax
 0060DE44    fild        dword ptr [esp+90]
 0060DE4B    fstp        qword ptr [esp]
 0060DE4E    wait
>0060DE4F    jmp         006100BD
 0060DE54    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DE5B    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DE62    mov         dword ptr [esp+40],eax
 0060DE66    mov         eax,dword ptr [esp+40]
 0060DE6A    movzx       eax,word ptr [eax+36E]
 0060DE71    mov         dword ptr [esp+90],eax
 0060DE78    fild        dword ptr [esp+90]
 0060DE7F    fstp        qword ptr [esp]
 0060DE82    wait
>0060DE83    jmp         006100BD
 0060DE88    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DE8F    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DE96    movzx       edx,byte ptr [eax+3A8]
 0060DE9D    shl         edx,8
 0060DEA0    movzx       eax,byte ptr [eax+3A9]
 0060DEA7    add         edx,eax
 0060DEA9    mov         dword ptr [esp+90],edx
 0060DEB0    fild        dword ptr [esp+90]
 0060DEB7    fstp        qword ptr [esp]
 0060DEBA    wait
>0060DEBB    jmp         006100BD
 0060DEC0    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DEC7    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DECE    movzx       edx,byte ptr [eax+3AA]
 0060DED5    shl         edx,8
 0060DED8    movzx       eax,byte ptr [eax+3AB]
 0060DEDF    add         edx,eax
 0060DEE1    mov         dword ptr [esp+90],edx
 0060DEE8    fild        dword ptr [esp+90]
 0060DEEF    fstp        qword ptr [esp]
 0060DEF2    wait
>0060DEF3    jmp         006100BD
 0060DEF8    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DEFF    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DF06    movzx       edx,byte ptr [eax+3AC]
 0060DF0D    shl         edx,8
 0060DF10    movzx       eax,byte ptr [eax+3AD]
 0060DF17    add         edx,eax
 0060DF19    mov         dword ptr [esp+90],edx
 0060DF20    fild        dword ptr [esp+90]
 0060DF27    fstp        qword ptr [esp]
 0060DF2A    wait
>0060DF2B    jmp         006100BD
 0060DF30    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DF37    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060DF3E    movzx       edx,byte ptr [eax+3AE]
 0060DF45    shl         edx,8
 0060DF48    movzx       eax,byte ptr [eax+3AF]
 0060DF4F    add         edx,eax
 0060DF51    mov         dword ptr [esp+90],edx
 0060DF58    fild        dword ptr [esp+90]
 0060DF5F    fstp        qword ptr [esp]
 0060DF62    wait
>0060DF63    jmp         006100BD
 0060DF68    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DF6F    lea         eax,[eax*8+817728];gvar_00817728
 0060DF76    fld         qword ptr [eax+28]
 0060DF79    fadd        qword ptr [eax+30]
 0060DF7C    fadd        qword ptr [eax+38]
 0060DF7F    fadd        qword ptr [eax+40]
 0060DF82    fdiv        dword ptr ds:[6100C8];4:Single
 0060DF88    fstp        qword ptr [esp]
 0060DF8B    wait
>0060DF8C    jmp         006100BD
 0060DF91    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DF98    lea         eax,[eax*8+817728];gvar_00817728
 0060DF9F    fld         qword ptr [eax+30]
 0060DFA2    fadd        qword ptr [eax+40]
 0060DFA5    fdiv        dword ptr ds:[6100CC];2:Single
 0060DFAB    fstp        qword ptr [esp]
 0060DFAE    wait
>0060DFAF    jmp         006100BD
 0060DFB4    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DFBB    lea         eax,[eax*8+817728];gvar_00817728
 0060DFC2    fld         qword ptr [eax+28]
 0060DFC5    fadd        qword ptr [eax+38]
 0060DFC8    fdiv        dword ptr ds:[6100CC];2:Single
 0060DFCE    fstp        qword ptr [esp]
 0060DFD1    wait
>0060DFD2    jmp         006100BD
 0060DFD7    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060DFDE    lea         eax,[eax*8+817728];gvar_00817728
 0060DFE5    mov         dword ptr [esp+44],eax
 0060DFE9    mov         eax,dword ptr [esp+44]
 0060DFED    fld         qword ptr [eax+28]
 0060DFF0    mov         eax,dword ptr [esp+44]
 0060DFF4    fadd        qword ptr [eax+30]
 0060DFF7    fdiv        dword ptr ds:[6100CC];2:Single
 0060DFFD    fstp        qword ptr [esp]
 0060E000    wait
>0060E001    jmp         006100BD
 0060E006    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E00D    lea         eax,[eax*8+817728];gvar_00817728
 0060E014    mov         dword ptr [esp+48],eax
 0060E018    mov         eax,dword ptr [esp+48]
 0060E01C    fld         qword ptr [eax+38]
 0060E01F    mov         eax,dword ptr [esp+48]
 0060E023    fadd        qword ptr [eax+40]
 0060E026    fdiv        dword ptr ds:[6100CC];2:Single
 0060E02C    fstp        qword ptr [esp]
 0060E02F    wait
>0060E030    jmp         006100BD
 0060E035    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E03C    movzx       eax,byte ptr [eax*8+817772];gvar_00817772
 0060E044    mov         dword ptr [esp+90],eax
 0060E04B    fild        dword ptr [esp+90]
 0060E052    fstp        qword ptr [esp]
 0060E055    wait
>0060E056    jmp         006100BD
 0060E05B    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E062    movzx       eax,word ptr [eax*8+817770];gvar_00817770
 0060E06A    mov         dword ptr [esp+90],eax
 0060E071    fild        dword ptr [esp+90]
 0060E078    fstp        qword ptr [esp]
 0060E07B    wait
>0060E07C    jmp         006100BD
 0060E081    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E088    lea         edx,[eax*8+817728];gvar_00817728
 0060E08F    fld         qword ptr [edx+28]
 0060E092    fadd        qword ptr [edx+38]
 0060E095    fstp        qword ptr [esp+8]
 0060E099    wait
 0060E09A    fld         qword ptr [esp+8]
 0060E09E    fadd        qword ptr [edx+30]
 0060E0A1    fadd        qword ptr [edx+40]
 0060E0A4    fcomp       dword ptr ds:[6100D0];0:Single
 0060E0AA    wait
 0060E0AB    fnstsw      al
 0060E0AD    sahf
>0060E0AE    jne         0060E0BE
 0060E0B0    xor         eax,eax
 0060E0B2    mov         dword ptr [esp],eax
 0060E0B5    mov         dword ptr [esp+4],eax
>0060E0B9    jmp         006100BD
 0060E0BE    fld         qword ptr [esp+8]
 0060E0C2    fadd        qword ptr [edx+30]
 0060E0C5    fadd        qword ptr [edx+40]
 0060E0C8    fdivr       qword ptr [esp+8]
 0060E0CC    fmul        dword ptr ds:[6100CC];2:Single
 0060E0D2    fsub        dword ptr ds:[6100D4];1:Single
 0060E0D8    fstp        qword ptr [esp]
 0060E0DB    wait
>0060E0DC    jmp         006100BD
 0060E0E1    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E0E8    lea         edx,[eax*8+817728];gvar_00817728
 0060E0EF    fld         qword ptr [edx+38]
 0060E0F2    fadd        qword ptr [edx+40]
 0060E0F5    fstp        qword ptr [esp+8]
 0060E0F9    wait
 0060E0FA    fld         qword ptr [esp+8]
 0060E0FE    fadd        qword ptr [edx+30]
 0060E101    fadd        qword ptr [edx+28]
 0060E104    fcomp       dword ptr ds:[6100D0];0:Single
 0060E10A    wait
 0060E10B    fnstsw      al
 0060E10D    sahf
>0060E10E    jne         0060E11E
 0060E110    xor         eax,eax
 0060E112    mov         dword ptr [esp],eax
 0060E115    mov         dword ptr [esp+4],eax
>0060E119    jmp         006100BD
 0060E11E    fld         qword ptr [esp+8]
 0060E122    fadd        qword ptr [edx+30]
 0060E125    fadd        qword ptr [edx+28]
 0060E128    fdivr       qword ptr [esp+8]
 0060E12C    fmul        dword ptr ds:[6100CC];2:Single
 0060E132    fsub        dword ptr ds:[6100D4];1:Single
 0060E138    fstp        qword ptr [esp]
 0060E13B    wait
>0060E13C    jmp         006100BD
 0060E141    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E148    mov         edx,dword ptr [eax*8+817750];gvar_00817750
 0060E14F    mov         dword ptr [esp],edx
 0060E152    mov         edx,dword ptr [eax*8+817754];gvar_00817754
 0060E159    mov         dword ptr [esp+4],edx
>0060E15D    jmp         006100BD
 0060E162    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E169    mov         edx,dword ptr [eax*8+817758];gvar_00817758
 0060E170    mov         dword ptr [esp],edx
 0060E173    mov         edx,dword ptr [eax*8+81775C];gvar_0081775C
 0060E17A    mov         dword ptr [esp+4],edx
>0060E17E    jmp         006100BD
 0060E183    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E18A    mov         edx,dword ptr [eax*8+817760];gvar_00817760
 0060E191    mov         dword ptr [esp],edx
 0060E194    mov         edx,dword ptr [eax*8+817764];gvar_00817764
 0060E19B    mov         dword ptr [esp+4],edx
>0060E19F    jmp         006100BD
 0060E1A4    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E1AB    mov         edx,dword ptr [eax*8+817768];gvar_00817768
 0060E1B2    mov         dword ptr [esp],edx
 0060E1B5    mov         edx,dword ptr [eax*8+81776C];gvar_0081776C
 0060E1BC    mov         dword ptr [esp+4],edx
>0060E1C0    jmp         006100BD
 0060E1C5    fild        dword ptr ds:[81D868];gvar_0081D868:Single
 0060E1CB    fstp        qword ptr [esp]
 0060E1CE    wait
>0060E1CF    jmp         006100BD
 0060E1D4    mov         eax,dword ptr ds:[81D870];gvar_0081D870:Double
 0060E1DA    mov         dword ptr [esp],eax
 0060E1DD    mov         eax,dword ptr ds:[81D874];gvar_0081D874
 0060E1E3    mov         dword ptr [esp+4],eax
>0060E1E7    jmp         006100BD
 0060E1EC    mov         eax,dword ptr ds:[81D878];gvar_0081D878:Double
 0060E1F2    mov         dword ptr [esp],eax
 0060E1F5    mov         eax,dword ptr ds:[81D87C];gvar_0081D87C
 0060E1FB    mov         dword ptr [esp+4],eax
>0060E1FF    jmp         006100BD
 0060E204    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E20B    jne         0060E21B
 0060E20D    xor         eax,eax
 0060E20F    mov         dword ptr [esp],eax
 0060E212    mov         dword ptr [esp+4],eax
>0060E216    jmp         006100BD
 0060E21B    fild        dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 0060E221    fstp        qword ptr [esp]
 0060E224    wait
>0060E225    jmp         006100BD
 0060E22A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E231    jne         0060E243
 0060E233    xor         eax,eax
 0060E235    call        00686074
 0060E23A    fstp        qword ptr [esp]
 0060E23D    wait
>0060E23E    jmp         006100BD
 0060E243    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E24A    mov         eax,dword ptr [eax*8+8173D0];gvar_008173D0
 0060E251    movzx       eax,byte ptr [eax+8]
 0060E255    call        00686074
 0060E25A    fstp        qword ptr [esp]
 0060E25D    wait
>0060E25E    jmp         006100BD
 0060E263    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E26A    jne         0060E27C
 0060E26C    xor         eax,eax
 0060E26E    call        00686074
 0060E273    fstp        qword ptr [esp]
 0060E276    wait
>0060E277    jmp         006100BD
 0060E27C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E283    movzx       eax,byte ptr [eax*8+8173EC];gvar_008173EC
 0060E28B    call        00686074
 0060E290    fstp        qword ptr [esp]
 0060E293    wait
>0060E294    jmp         006100BD
 0060E299    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E2A0    jne         0060E2B0
 0060E2A2    xor         eax,eax
 0060E2A4    mov         dword ptr [esp],eax
 0060E2A7    mov         dword ptr [esp+4],eax
>0060E2AB    jmp         006100BD
 0060E2B0    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E2B7    mov         eax,dword ptr [eax*8+8173E0];gvar_008173E0
 0060E2BE    mov         dword ptr [esp+94],eax
 0060E2C5    xor         eax,eax
 0060E2C7    mov         dword ptr [esp+98],eax
 0060E2CE    fild        qword ptr [esp+94]
 0060E2D5    fstp        qword ptr [esp]
 0060E2D8    wait
>0060E2D9    jmp         006100BD
 0060E2DE    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E2E5    jne         0060E2F5
 0060E2E7    xor         eax,eax
 0060E2E9    mov         dword ptr [esp],eax
 0060E2EC    mov         dword ptr [esp+4],eax
>0060E2F0    jmp         006100BD
 0060E2F5    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E2FC    movzx       eax,byte ptr [eax*8+81746C];gvar_0081746C
 0060E304    mov         dword ptr [esp+90],eax
 0060E30B    fild        dword ptr [esp+90]
 0060E312    fstp        qword ptr [esp]
 0060E315    wait
>0060E316    jmp         006100BD
 0060E31B    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E322    jne         0060E332
 0060E324    xor         eax,eax
 0060E326    mov         dword ptr [esp],eax
 0060E329    mov         dword ptr [esp+4],eax
>0060E32D    jmp         006100BD
 0060E332    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E339    movzx       eax,byte ptr [eax*8+81746D];gvar_0081746D
 0060E341    mov         dword ptr [esp+90],eax
 0060E348    fild        dword ptr [esp+90]
 0060E34F    fstp        qword ptr [esp]
 0060E352    wait
>0060E353    jmp         006100BD
 0060E358    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E35F    jne         0060E36F
 0060E361    xor         eax,eax
 0060E363    mov         dword ptr [esp],eax
 0060E366    mov         dword ptr [esp+4],eax
>0060E36A    jmp         006100BD
 0060E36F    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E376    mov         edx,dword ptr [eax*8+817520];gvar_00817520
 0060E37D    mov         dword ptr [esp],edx
 0060E380    mov         edx,dword ptr [eax*8+817524];gvar_00817524
 0060E387    mov         dword ptr [esp+4],edx
>0060E38B    jmp         006100BD
 0060E390    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E397    jne         0060E3A9
 0060E399    xor         eax,eax
 0060E39B    call        00686074
 0060E3A0    fstp        qword ptr [esp]
 0060E3A3    wait
>0060E3A4    jmp         006100BD
 0060E3A9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E3B0    cmp         byte ptr [eax*8+81746C],3;gvar_0081746C
>0060E3B8    jne         0060E3CB
 0060E3BA    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E3C1    cmp         byte ptr [eax*8+81746D],3;gvar_0081746D
>0060E3C9    je          0060E3CF
 0060E3CB    xor         eax,eax
>0060E3CD    jmp         0060E3D1
 0060E3CF    mov         al,1
 0060E3D1    call        00686074
 0060E3D6    fstp        qword ptr [esp]
 0060E3D9    wait
>0060E3DA    jmp         006100BD
 0060E3DF    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E3E6    jne         0060E3F8
 0060E3E8    xor         eax,eax
 0060E3EA    call        00686074
 0060E3EF    fstp        qword ptr [esp]
 0060E3F2    wait
>0060E3F3    jmp         006100BD
 0060E3F8    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E3FF    cmp         byte ptr [eax*8+81746C],3;gvar_0081746C
>0060E407    jne         0060E41A
 0060E409    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E410    cmp         byte ptr [eax*8+81746D],5;gvar_0081746D
>0060E418    je          0060E41E
 0060E41A    xor         eax,eax
>0060E41C    jmp         0060E420
 0060E41E    mov         al,1
 0060E420    call        00686074
 0060E425    fstp        qword ptr [esp]
 0060E428    wait
>0060E429    jmp         006100BD
 0060E42E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E435    jne         0060E447
 0060E437    xor         eax,eax
 0060E439    call        00686074
 0060E43E    fstp        qword ptr [esp]
 0060E441    wait
>0060E442    jmp         006100BD
 0060E447    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E44E    cmp         byte ptr [eax*8+81746C],6;gvar_0081746C
>0060E456    jne         0060E469
 0060E458    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E45F    cmp         byte ptr [eax*8+81746D],4;gvar_0081746D
>0060E467    je          0060E46D
 0060E469    xor         eax,eax
>0060E46B    jmp         0060E46F
 0060E46D    mov         al,1
 0060E46F    call        00686074
 0060E474    fstp        qword ptr [esp]
 0060E477    wait
>0060E478    jmp         006100BD
 0060E47D    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E484    jne         0060E496
 0060E486    xor         eax,eax
 0060E488    call        00686074
 0060E48D    fstp        qword ptr [esp]
 0060E490    wait
>0060E491    jmp         006100BD
 0060E496    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E49D    cmp         byte ptr [eax*8+81746C],2;gvar_0081746C
 0060E4A5    sete        al
 0060E4A8    call        00686074
 0060E4AD    fstp        qword ptr [esp]
 0060E4B0    wait
>0060E4B1    jmp         006100BD
 0060E4B6    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E4BD    jne         0060E4CF
 0060E4BF    xor         eax,eax
 0060E4C1    call        00686074
 0060E4C6    fstp        qword ptr [esp]
 0060E4C9    wait
>0060E4CA    jmp         006100BD
 0060E4CF    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E4D6    cmp         byte ptr [eax*8+81746C],2;gvar_0081746C
>0060E4DE    jne         0060E4F1
 0060E4E0    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E4E7    cmp         byte ptr [eax*8+81746D],1;gvar_0081746D
>0060E4EF    je          0060E4F5
 0060E4F1    xor         eax,eax
>0060E4F3    jmp         0060E4F7
 0060E4F5    mov         al,1
 0060E4F7    call        00686074
 0060E4FC    fstp        qword ptr [esp]
 0060E4FF    wait
>0060E500    jmp         006100BD
 0060E505    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E50C    jne         0060E51C
 0060E50E    xor         eax,eax
 0060E510    mov         dword ptr [esp],eax
 0060E513    mov         dword ptr [esp+4],eax
>0060E517    jmp         006100BD
 0060E51C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E523    movzx       eax,byte ptr [eax*8+81746E];gvar_0081746E
 0060E52B    mov         dword ptr [esp+90],eax
 0060E532    fild        dword ptr [esp+90]
 0060E539    fstp        qword ptr [esp]
 0060E53C    wait
>0060E53D    jmp         006100BD
 0060E542    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E549    jne         0060E55B
 0060E54B    xor         eax,eax
 0060E54D    call        00686074
 0060E552    fstp        qword ptr [esp]
 0060E555    wait
>0060E556    jmp         006100BD
 0060E55B    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E562    test        word ptr [eax*8+817468],800
 0060E56C    seta        al
 0060E56F    call        00686074
 0060E574    fstp        qword ptr [esp]
 0060E577    wait
>0060E578    jmp         006100BD
 0060E57D    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E584    jne         0060E596
 0060E586    xor         eax,eax
 0060E588    call        00686074
 0060E58D    fstp        qword ptr [esp]
 0060E590    wait
>0060E591    jmp         006100BD
 0060E596    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E59D    test        word ptr [eax*8+817468],400
 0060E5A7    seta        al
 0060E5AA    call        00686074
 0060E5AF    fstp        qword ptr [esp]
 0060E5B2    wait
>0060E5B3    jmp         006100BD
 0060E5B8    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E5BF    jne         0060E5D1
 0060E5C1    xor         eax,eax
 0060E5C3    call        00686074
 0060E5C8    fstp        qword ptr [esp]
 0060E5CB    wait
>0060E5CC    jmp         006100BD
 0060E5D1    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E5D8    test        word ptr [eax*8+817468],200
 0060E5E2    seta        al
 0060E5E5    call        00686074
 0060E5EA    fstp        qword ptr [esp]
 0060E5ED    wait
>0060E5EE    jmp         006100BD
 0060E5F3    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E5FA    jne         0060E60C
 0060E5FC    xor         eax,eax
 0060E5FE    call        00686074
 0060E603    fstp        qword ptr [esp]
 0060E606    wait
>0060E607    jmp         006100BD
 0060E60C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E613    test        word ptr [eax*8+817468],100
 0060E61D    seta        al
 0060E620    call        00686074
 0060E625    fstp        qword ptr [esp]
 0060E628    wait
>0060E629    jmp         006100BD
 0060E62E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E635    jne         0060E647
 0060E637    xor         eax,eax
 0060E639    call        00686074
 0060E63E    fstp        qword ptr [esp]
 0060E641    wait
>0060E642    jmp         006100BD
 0060E647    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E64E    test        word ptr [eax*8+817468],80
 0060E658    seta        al
 0060E65B    call        00686074
 0060E660    fstp        qword ptr [esp]
 0060E663    wait
>0060E664    jmp         006100BD
 0060E669    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E670    jne         0060E682
 0060E672    xor         eax,eax
 0060E674    call        00686074
 0060E679    fstp        qword ptr [esp]
 0060E67C    wait
>0060E67D    jmp         006100BD
 0060E682    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E689    test        word ptr [eax*8+817468],10
 0060E693    seta        al
 0060E696    call        00686074
 0060E69B    fstp        qword ptr [esp]
 0060E69E    wait
>0060E69F    jmp         006100BD
 0060E6A4    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E6AB    jne         0060E6BD
 0060E6AD    xor         eax,eax
 0060E6AF    call        00686074
 0060E6B4    fstp        qword ptr [esp]
 0060E6B7    wait
>0060E6B8    jmp         006100BD
 0060E6BD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E6C4    test        word ptr [eax*8+817468],1000
 0060E6CE    seta        al
 0060E6D1    call        00686074
 0060E6D6    fstp        qword ptr [esp]
 0060E6D9    wait
>0060E6DA    jmp         006100BD
 0060E6DF    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E6E6    jne         0060E6F8
 0060E6E8    xor         eax,eax
 0060E6EA    call        00686074
 0060E6EF    fstp        qword ptr [esp]
 0060E6F2    wait
>0060E6F3    jmp         006100BD
 0060E6F8    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E6FF    test        word ptr [eax*8+817468],8
 0060E709    seta        al
 0060E70C    call        00686074
 0060E711    fstp        qword ptr [esp]
 0060E714    wait
>0060E715    jmp         006100BD
 0060E71A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E721    jne         0060E733
 0060E723    xor         eax,eax
 0060E725    call        00686074
 0060E72A    fstp        qword ptr [esp]
 0060E72D    wait
>0060E72E    jmp         006100BD
 0060E733    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E73A    test        word ptr [eax*8+817468],4
 0060E744    seta        al
 0060E747    call        00686074
 0060E74C    fstp        qword ptr [esp]
 0060E74F    wait
>0060E750    jmp         006100BD
 0060E755    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E75C    jne         0060E76E
 0060E75E    xor         eax,eax
 0060E760    call        00686074
 0060E765    fstp        qword ptr [esp]
 0060E768    wait
>0060E769    jmp         006100BD
 0060E76E    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E775    test        word ptr [eax*8+817468],2
 0060E77F    seta        al
 0060E782    call        00686074
 0060E787    fstp        qword ptr [esp]
 0060E78A    wait
>0060E78B    jmp         006100BD
 0060E790    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E797    jne         0060E7A9
 0060E799    xor         eax,eax
 0060E79B    call        00686074
 0060E7A0    fstp        qword ptr [esp]
 0060E7A3    wait
>0060E7A4    jmp         006100BD
 0060E7A9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E7B0    test        word ptr [eax*8+817468],1
 0060E7BA    seta        al
 0060E7BD    call        00686074
 0060E7C2    fstp        qword ptr [esp]
 0060E7C5    wait
>0060E7C6    jmp         006100BD
 0060E7CB    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E7D2    jne         0060E7E4
 0060E7D4    xor         eax,eax
 0060E7D6    call        00686074
 0060E7DB    fstp        qword ptr [esp]
 0060E7DE    wait
>0060E7DF    jmp         006100BD
 0060E7E4    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E7EB    movzx       eax,byte ptr [eax*8+8173F7];gvar_008173F7
 0060E7F3    call        00686074
 0060E7F8    fstp        qword ptr [esp]
 0060E7FB    wait
>0060E7FC    jmp         006100BD
 0060E801    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E808    jne         0060E81A
 0060E80A    xor         eax,eax
 0060E80C    call        00686074
 0060E811    fstp        qword ptr [esp]
 0060E814    wait
>0060E815    jmp         006100BD
 0060E81A    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E821    movzx       eax,byte ptr [eax*8+8173FC];gvar_008173FC
 0060E829    mov         dword ptr [esp+90],eax
 0060E830    fild        dword ptr [esp+90]
 0060E837    fstp        qword ptr [esp]
 0060E83A    wait
>0060E83B    jmp         006100BD
 0060E840    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E847    jne         0060E857
 0060E849    xor         eax,eax
 0060E84B    mov         dword ptr [esp],eax
 0060E84E    mov         dword ptr [esp+4],eax
>0060E852    jmp         006100BD
 0060E857    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E85E    movzx       eax,byte ptr [eax*8+8173FC];gvar_008173FC
 0060E866    and         al,3
 0060E868    movzx       eax,al
 0060E86B    mov         dword ptr [esp+90],eax
 0060E872    fild        dword ptr [esp+90]
 0060E879    fstp        qword ptr [esp]
 0060E87C    wait
 0060E87D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E884    test        byte ptr [eax*8+8173FC],4;gvar_008173FC
>0060E88C    je          0060E89B
 0060E88E    fld         qword ptr [esp]
 0060E891    fadd        dword ptr ds:[6100D8];3:Single
 0060E897    fstp        qword ptr [esp]
 0060E89A    wait
 0060E89B    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E8A2    test        byte ptr [eax*8+8173FC],8;gvar_008173FC
>0060E8AA    je          006100BD
 0060E8B0    fld         qword ptr [esp]
 0060E8B3    fadd        dword ptr ds:[6100C8];4:Single
 0060E8B9    fstp        qword ptr [esp]
 0060E8BC    wait
>0060E8BD    jmp         006100BD
 0060E8C2    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E8C9    jne         0060E8D9
 0060E8CB    xor         eax,eax
 0060E8CD    mov         dword ptr [esp],eax
 0060E8D0    mov         dword ptr [esp+4],eax
>0060E8D4    jmp         006100BD
 0060E8D9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E8E0    mov         edx,dword ptr [eax*8+817408];gvar_00817408
 0060E8E7    mov         dword ptr [esp],edx
 0060E8EA    mov         edx,dword ptr [eax*8+81740C];gvar_0081740C
 0060E8F1    mov         dword ptr [esp+4],edx
>0060E8F5    jmp         006100BD
 0060E8FA    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E901    jne         0060E911
 0060E903    xor         eax,eax
 0060E905    mov         dword ptr [esp],eax
 0060E908    mov         dword ptr [esp+4],eax
>0060E90C    jmp         006100BD
 0060E911    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E918    mov         edx,dword ptr [eax*8+817410];gvar_00817410
 0060E91F    mov         dword ptr [esp],edx
 0060E922    mov         edx,dword ptr [eax*8+817414];gvar_00817414
 0060E929    mov         dword ptr [esp+4],edx
>0060E92D    jmp         006100BD
 0060E932    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E939    jne         0060E949
 0060E93B    xor         eax,eax
 0060E93D    mov         dword ptr [esp],eax
 0060E940    mov         dword ptr [esp+4],eax
>0060E944    jmp         006100BD
 0060E949    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E950    mov         edx,dword ptr [eax*8+817418];gvar_00817418
 0060E957    mov         dword ptr [esp],edx
 0060E95A    mov         edx,dword ptr [eax*8+81741C];gvar_0081741C
 0060E961    mov         dword ptr [esp+4],edx
>0060E965    jmp         006100BD
 0060E96A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E971    jne         0060E981
 0060E973    xor         eax,eax
 0060E975    mov         dword ptr [esp],eax
 0060E978    mov         dword ptr [esp+4],eax
>0060E97C    jmp         006100BD
 0060E981    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E988    mov         edx,dword ptr [eax*8+8174C0];gvar_008174C0
 0060E98F    mov         dword ptr [esp],edx
 0060E992    mov         edx,dword ptr [eax*8+8174C4];gvar_008174C4
 0060E999    mov         dword ptr [esp+4],edx
>0060E99D    jmp         006100BD
 0060E9A2    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E9A9    jne         0060E9B9
 0060E9AB    xor         eax,eax
 0060E9AD    mov         dword ptr [esp],eax
 0060E9B0    mov         dword ptr [esp+4],eax
>0060E9B4    jmp         006100BD
 0060E9B9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E9C0    mov         edx,dword ptr [eax*8+8174C8];gvar_008174C8
 0060E9C7    mov         dword ptr [esp],edx
 0060E9CA    mov         edx,dword ptr [eax*8+8174CC];gvar_008174CC
 0060E9D1    mov         dword ptr [esp+4],edx
>0060E9D5    jmp         006100BD
 0060E9DA    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060E9E1    jne         0060E9F1
 0060E9E3    xor         eax,eax
 0060E9E5    mov         dword ptr [esp],eax
 0060E9E8    mov         dword ptr [esp+4],eax
>0060E9EC    jmp         006100BD
 0060E9F1    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060E9F8    mov         edx,dword ptr [eax*8+8174D0];gvar_008174D0
 0060E9FF    mov         dword ptr [esp],edx
 0060EA02    mov         edx,dword ptr [eax*8+8174D4];gvar_008174D4
 0060EA09    mov         dword ptr [esp+4],edx
>0060EA0D    jmp         006100BD
 0060EA12    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EA19    jne         0060EA29
 0060EA1B    xor         eax,eax
 0060EA1D    mov         dword ptr [esp],eax
 0060EA20    mov         dword ptr [esp+4],eax
>0060EA24    jmp         006100BD
 0060EA29    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060EA2F    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EA36    fmul        qword ptr [eax*8+8174C0];gvar_008174C0
 0060EA3D    fstp        qword ptr [esp]
 0060EA40    wait
>0060EA41    jmp         006100BD
 0060EA46    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EA4D    jne         0060EA5D
 0060EA4F    xor         eax,eax
 0060EA51    mov         dword ptr [esp],eax
 0060EA54    mov         dword ptr [esp+4],eax
>0060EA58    jmp         006100BD
 0060EA5D    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060EA63    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EA6A    fmul        qword ptr [eax*8+8174C8];gvar_008174C8
 0060EA71    fstp        qword ptr [esp]
 0060EA74    wait
>0060EA75    jmp         006100BD
 0060EA7A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EA81    jne         0060EA91
 0060EA83    xor         eax,eax
 0060EA85    mov         dword ptr [esp],eax
 0060EA88    mov         dword ptr [esp+4],eax
>0060EA8C    jmp         006100BD
 0060EA91    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EA98    mov         edx,dword ptr [eax*8+8174D0];gvar_008174D0
 0060EA9F    mov         dword ptr [esp],edx
 0060EAA2    mov         edx,dword ptr [eax*8+8174D4];gvar_008174D4
 0060EAA9    mov         dword ptr [esp+4],edx
>0060EAAD    jmp         006100BD
 0060EAB2    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EAB9    jne         0060EAC9
 0060EABB    xor         eax,eax
 0060EABD    mov         dword ptr [esp],eax
 0060EAC0    mov         dword ptr [esp+4],eax
>0060EAC4    jmp         006100BD
 0060EAC9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EAD0    fld         qword ptr [eax*8+8174C0];gvar_008174C0
 0060EAD7    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EADE    fsub        qword ptr [eax*8+8174F0];gvar_008174F0
 0060EAE5    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060EAEB    fmulp       st(1),st
 0060EAED    fstp        qword ptr [esp]
 0060EAF0    wait
>0060EAF1    jmp         006100BD
 0060EAF6    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EAFD    jne         0060EB0D
 0060EAFF    xor         eax,eax
 0060EB01    mov         dword ptr [esp],eax
 0060EB04    mov         dword ptr [esp+4],eax
>0060EB08    jmp         006100BD
 0060EB0D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EB14    fld         qword ptr [eax*8+8174C8];gvar_008174C8
 0060EB1B    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EB22    fsub        qword ptr [eax*8+8174F8];gvar_008174F8
 0060EB29    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060EB2F    fmulp       st(1),st
 0060EB31    fstp        qword ptr [esp]
 0060EB34    wait
>0060EB35    jmp         006100BD
 0060EB3A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EB41    jne         0060EB51
 0060EB43    xor         eax,eax
 0060EB45    mov         dword ptr [esp],eax
 0060EB48    mov         dword ptr [esp+4],eax
>0060EB4C    jmp         006100BD
 0060EB51    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EB58    fld         qword ptr [eax*8+8174D0];gvar_008174D0
 0060EB5F    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EB66    fsub        qword ptr [eax*8+817500];gvar_00817500
 0060EB6D    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060EB73    fmulp       st(1),st
 0060EB75    fstp        qword ptr [esp]
 0060EB78    wait
>0060EB79    jmp         006100BD
 0060EB7E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EB85    jne         0060EB95
 0060EB87    xor         eax,eax
 0060EB89    mov         dword ptr [esp],eax
 0060EB8C    mov         dword ptr [esp+4],eax
>0060EB90    jmp         006100BD
 0060EB95    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EB9C    mov         edx,dword ptr [eax*8+817528];gvar_00817528
 0060EBA3    mov         dword ptr [esp],edx
 0060EBA6    mov         edx,dword ptr [eax*8+81752C];gvar_0081752C
 0060EBAD    mov         dword ptr [esp+4],edx
>0060EBB1    jmp         006100BD
 0060EBB6    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EBBD    jne         0060EBCD
 0060EBBF    xor         eax,eax
 0060EBC1    mov         dword ptr [esp],eax
 0060EBC4    mov         dword ptr [esp+4],eax
>0060EBC8    jmp         006100BD
 0060EBCD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EBD4    mov         edx,dword ptr [eax*8+817530];gvar_00817530
 0060EBDB    mov         dword ptr [esp],edx
 0060EBDE    mov         edx,dword ptr [eax*8+817534];gvar_00817534
 0060EBE5    mov         dword ptr [esp+4],edx
>0060EBE9    jmp         006100BD
 0060EBEE    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EBF5    jne         0060EC05
 0060EBF7    xor         eax,eax
 0060EBF9    mov         dword ptr [esp],eax
 0060EBFC    mov         dword ptr [esp+4],eax
>0060EC00    jmp         006100BD
 0060EC05    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EC0C    mov         edx,dword ptr [eax*8+817538];gvar_00817538
 0060EC13    mov         dword ptr [esp],edx
 0060EC16    mov         edx,dword ptr [eax*8+81753C];gvar_0081753C
 0060EC1D    mov         dword ptr [esp+4],edx
>0060EC21    jmp         006100BD
 0060EC26    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EC2D    jne         0060EC3D
 0060EC2F    xor         eax,eax
 0060EC31    mov         dword ptr [esp],eax
 0060EC34    mov         dword ptr [esp+4],eax
>0060EC38    jmp         006100BD
 0060EC3D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EC44    mov         edx,dword ptr [eax*8+817540];gvar_00817540
 0060EC4B    mov         dword ptr [esp],edx
 0060EC4E    mov         edx,dword ptr [eax*8+817544];gvar_00817544
 0060EC55    mov         dword ptr [esp+4],edx
>0060EC59    jmp         006100BD
 0060EC5E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EC65    jne         0060EC75
 0060EC67    xor         eax,eax
 0060EC69    mov         dword ptr [esp],eax
 0060EC6C    mov         dword ptr [esp+4],eax
>0060EC70    jmp         006100BD
 0060EC75    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EC7C    mov         edx,dword ptr [eax*8+817548];gvar_00817548
 0060EC83    mov         dword ptr [esp],edx
 0060EC86    mov         edx,dword ptr [eax*8+81754C];gvar_0081754C
 0060EC8D    mov         dword ptr [esp+4],edx
>0060EC91    jmp         006100BD
 0060EC96    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EC9D    jne         0060ECAD
 0060EC9F    xor         eax,eax
 0060ECA1    mov         dword ptr [esp],eax
 0060ECA4    mov         dword ptr [esp+4],eax
>0060ECA8    jmp         006100BD
 0060ECAD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060ECB4    mov         edx,dword ptr [eax*8+817550];gvar_00817550
 0060ECBB    mov         dword ptr [esp],edx
 0060ECBE    mov         edx,dword ptr [eax*8+817554];gvar_00817554
 0060ECC5    mov         dword ptr [esp+4],edx
>0060ECC9    jmp         006100BD
 0060ECCE    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060ECD5    jne         0060ECE5
 0060ECD7    xor         eax,eax
 0060ECD9    mov         dword ptr [esp],eax
 0060ECDC    mov         dword ptr [esp+4],eax
>0060ECE0    jmp         006100BD
 0060ECE5    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060ECEC    mov         edx,dword ptr [eax*8+817610];gvar_00817610
 0060ECF3    mov         dword ptr [esp],edx
 0060ECF6    mov         edx,dword ptr [eax*8+817614];gvar_00817614
 0060ECFD    mov         dword ptr [esp+4],edx
>0060ED01    jmp         006100BD
 0060ED06    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060ED0D    jne         0060ED1D
 0060ED0F    xor         eax,eax
 0060ED11    mov         dword ptr [esp],eax
 0060ED14    mov         dword ptr [esp+4],eax
>0060ED18    jmp         006100BD
 0060ED1D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060ED24    mov         edx,dword ptr [eax*8+817618];gvar_00817618
 0060ED2B    mov         dword ptr [esp],edx
 0060ED2E    mov         edx,dword ptr [eax*8+81761C];gvar_0081761C
 0060ED35    mov         dword ptr [esp+4],edx
>0060ED39    jmp         006100BD
 0060ED3E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060ED45    jne         0060ED55
 0060ED47    xor         eax,eax
 0060ED49    mov         dword ptr [esp],eax
 0060ED4C    mov         dword ptr [esp+4],eax
>0060ED50    jmp         006100BD
 0060ED55    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060ED5C    mov         edx,dword ptr [eax*8+817610];gvar_00817610
 0060ED63    mov         dword ptr [esp],edx
 0060ED66    mov         edx,dword ptr [eax*8+817614];gvar_00817614
 0060ED6D    mov         dword ptr [esp+4],edx
>0060ED71    jmp         006100BD
 0060ED76    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060ED7D    jne         0060ED8D
 0060ED7F    xor         eax,eax
 0060ED81    mov         dword ptr [esp],eax
 0060ED84    mov         dword ptr [esp+4],eax
>0060ED88    jmp         006100BD
 0060ED8D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060ED94    mov         edx,dword ptr [eax*8+817618];gvar_00817618
 0060ED9B    mov         dword ptr [esp],edx
 0060ED9E    mov         edx,dword ptr [eax*8+81761C];gvar_0081761C
 0060EDA5    mov         dword ptr [esp+4],edx
>0060EDA9    jmp         006100BD
 0060EDAE    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EDB5    jne         0060EDC5
 0060EDB7    xor         eax,eax
 0060EDB9    mov         dword ptr [esp],eax
 0060EDBC    mov         dword ptr [esp+4],eax
>0060EDC0    jmp         006100BD
 0060EDC5    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EDCC    movzx       eax,byte ptr [eax*8+817630];gvar_00817630
 0060EDD4    call        00686074
 0060EDD9    fstp        qword ptr [esp]
 0060EDDC    wait
>0060EDDD    jmp         006100BD
 0060EDE2    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EDE9    jne         0060EDF9
 0060EDEB    xor         eax,eax
 0060EDED    mov         dword ptr [esp],eax
 0060EDF0    mov         dword ptr [esp+4],eax
>0060EDF4    jmp         006100BD
 0060EDF9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EE00    movzx       eax,byte ptr [eax*8+81762F];gvar_0081762F
 0060EE08    call        00686074
 0060EE0D    fstp        qword ptr [esp]
 0060EE10    wait
>0060EE11    jmp         006100BD
 0060EE16    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EE1D    jne         0060EE2D
 0060EE1F    xor         eax,eax
 0060EE21    mov         dword ptr [esp],eax
 0060EE24    mov         dword ptr [esp+4],eax
>0060EE28    jmp         006100BD
 0060EE2D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EE34    movzx       eax,byte ptr [eax*8+817631];gvar_00817631
 0060EE3C    call        00686074
 0060EE41    fstp        qword ptr [esp]
 0060EE44    wait
>0060EE45    jmp         006100BD
 0060EE4A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EE51    jne         0060EE61
 0060EE53    xor         eax,eax
 0060EE55    mov         dword ptr [esp],eax
 0060EE58    mov         dword ptr [esp+4],eax
>0060EE5C    jmp         006100BD
 0060EE61    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EE68    movzx       eax,byte ptr [eax*8+817632];gvar_00817632
 0060EE70    call        00686074
 0060EE75    fstp        qword ptr [esp]
 0060EE78    wait
>0060EE79    jmp         006100BD
 0060EE7E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EE85    jne         0060EE95
 0060EE87    xor         eax,eax
 0060EE89    mov         dword ptr [esp],eax
 0060EE8C    mov         dword ptr [esp+4],eax
>0060EE90    jmp         006100BD
 0060EE95    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EE9C    movzx       eax,byte ptr [eax*8+817633];gvar_00817633
 0060EEA4    call        00686074
 0060EEA9    fstp        qword ptr [esp]
 0060EEAC    wait
>0060EEAD    jmp         006100BD
 0060EEB2    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EEB9    jne         0060EEC9
 0060EEBB    xor         eax,eax
 0060EEBD    mov         dword ptr [esp],eax
 0060EEC0    mov         dword ptr [esp+4],eax
>0060EEC4    jmp         006100BD
 0060EEC9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EED0    movzx       eax,byte ptr [eax*8+817634];gvar_00817634
 0060EED8    call        00686074
 0060EEDD    fstp        qword ptr [esp]
 0060EEE0    wait
>0060EEE1    jmp         006100BD
 0060EEE6    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EEED    jne         0060EEFD
 0060EEEF    xor         eax,eax
 0060EEF1    mov         dword ptr [esp],eax
 0060EEF4    mov         dword ptr [esp+4],eax
>0060EEF8    jmp         006100BD
 0060EEFD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EF04    mov         edx,dword ptr [eax*8+817420];gvar_00817420
 0060EF0B    mov         dword ptr [esp],edx
 0060EF0E    mov         edx,dword ptr [eax*8+817424];gvar_00817424
 0060EF15    mov         dword ptr [esp+4],edx
>0060EF19    jmp         006100BD
 0060EF1E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EF25    jne         0060EF35
 0060EF27    xor         eax,eax
 0060EF29    mov         dword ptr [esp],eax
 0060EF2C    mov         dword ptr [esp+4],eax
>0060EF30    jmp         006100BD
 0060EF35    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EF3C    mov         edx,dword ptr [eax*8+817428];gvar_00817428
 0060EF43    mov         dword ptr [esp],edx
 0060EF46    mov         edx,dword ptr [eax*8+81742C];gvar_0081742C
 0060EF4D    mov         dword ptr [esp+4],edx
>0060EF51    jmp         006100BD
 0060EF56    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EF5D    jne         0060EF6D
 0060EF5F    xor         eax,eax
 0060EF61    mov         dword ptr [esp],eax
 0060EF64    mov         dword ptr [esp+4],eax
>0060EF68    jmp         006100BD
 0060EF6D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EF74    mov         edx,dword ptr [eax*8+817430];gvar_00817430
 0060EF7B    mov         dword ptr [esp],edx
 0060EF7E    mov         edx,dword ptr [eax*8+817434];gvar_00817434
 0060EF85    mov         dword ptr [esp+4],edx
>0060EF89    jmp         006100BD
 0060EF8E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EF95    jne         0060EFA5
 0060EF97    xor         eax,eax
 0060EF99    mov         dword ptr [esp],eax
 0060EF9C    mov         dword ptr [esp+4],eax
>0060EFA0    jmp         006100BD
 0060EFA5    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EFAC    mov         edx,dword ptr [eax*8+817438];gvar_00817438
 0060EFB3    mov         dword ptr [esp],edx
 0060EFB6    mov         edx,dword ptr [eax*8+81743C];gvar_0081743C
 0060EFBD    mov         dword ptr [esp+4],edx
>0060EFC1    jmp         006100BD
 0060EFC6    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060EFCD    jne         0060EFDD
 0060EFCF    xor         eax,eax
 0060EFD1    mov         dword ptr [esp],eax
 0060EFD4    mov         dword ptr [esp+4],eax
>0060EFD8    jmp         006100BD
 0060EFDD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060EFE4    mov         edx,dword ptr [eax*8+817440];gvar_00817440
 0060EFEB    mov         dword ptr [esp],edx
 0060EFEE    mov         edx,dword ptr [eax*8+817444];gvar_00817444
 0060EFF5    mov         dword ptr [esp+4],edx
>0060EFF9    jmp         006100BD
 0060EFFE    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F005    jne         0060F015
 0060F007    xor         eax,eax
 0060F009    mov         dword ptr [esp],eax
 0060F00C    mov         dword ptr [esp+4],eax
>0060F010    jmp         006100BD
 0060F015    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F01C    mov         edx,dword ptr [eax*8+817448];gvar_00817448
 0060F023    mov         dword ptr [esp],edx
 0060F026    mov         edx,dword ptr [eax*8+81744C];gvar_0081744C
 0060F02D    mov         dword ptr [esp+4],edx
>0060F031    jmp         006100BD
 0060F036    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F03D    jne         0060F04D
 0060F03F    xor         eax,eax
 0060F041    mov         dword ptr [esp],eax
 0060F044    mov         dword ptr [esp+4],eax
>0060F048    jmp         006100BD
 0060F04D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F054    mov         edx,dword ptr [eax*8+817450];gvar_00817450
 0060F05B    mov         dword ptr [esp],edx
 0060F05E    mov         edx,dword ptr [eax*8+817454];gvar_00817454
 0060F065    mov         dword ptr [esp+4],edx
>0060F069    jmp         006100BD
 0060F06E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F075    jne         0060F085
 0060F077    xor         eax,eax
 0060F079    mov         dword ptr [esp],eax
 0060F07C    mov         dword ptr [esp+4],eax
>0060F080    jmp         006100BD
 0060F085    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F08C    mov         edx,dword ptr [eax*8+817458];gvar_00817458
 0060F093    mov         dword ptr [esp],edx
 0060F096    mov         edx,dword ptr [eax*8+81745C];gvar_0081745C
 0060F09D    mov         dword ptr [esp+4],edx
>0060F0A1    jmp         006100BD
 0060F0A6    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F0AD    jne         0060F0BD
 0060F0AF    xor         eax,eax
 0060F0B1    mov         dword ptr [esp],eax
 0060F0B4    mov         dword ptr [esp+4],eax
>0060F0B8    jmp         006100BD
 0060F0BD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F0C4    mov         edx,dword ptr [eax*8+817460];gvar_00817460
 0060F0CB    mov         dword ptr [esp],edx
 0060F0CE    mov         edx,dword ptr [eax*8+817464];gvar_00817464
 0060F0D5    mov         dword ptr [esp+4],edx
>0060F0D9    jmp         006100BD
 0060F0DE    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F0E5    jne         0060F0F5
 0060F0E7    xor         eax,eax
 0060F0E9    mov         dword ptr [esp],eax
 0060F0EC    mov         dword ptr [esp+4],eax
>0060F0F0    jmp         006100BD
 0060F0F5    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F0FC    test        byte ptr [eax*8+8173FC],1;gvar_008173FC
 0060F104    seta        al
 0060F107    call        00686074
 0060F10C    fstp        qword ptr [esp]
 0060F10F    wait
>0060F110    jmp         006100BD
 0060F115    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F11C    jne         0060F12C
 0060F11E    xor         eax,eax
 0060F120    mov         dword ptr [esp],eax
 0060F123    mov         dword ptr [esp+4],eax
>0060F127    jmp         006100BD
 0060F12C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F133    test        byte ptr [eax*8+8173FC],2;gvar_008173FC
 0060F13B    seta        al
 0060F13E    call        00686074
 0060F143    fstp        qword ptr [esp]
 0060F146    wait
>0060F147    jmp         006100BD
 0060F14C    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F153    jne         0060F163
 0060F155    xor         eax,eax
 0060F157    mov         dword ptr [esp],eax
 0060F15A    mov         dword ptr [esp+4],eax
>0060F15E    jmp         006100BD
 0060F163    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F16A    test        byte ptr [eax*8+8173FC],4;gvar_008173FC
 0060F172    seta        al
 0060F175    call        00686074
 0060F17A    fstp        qword ptr [esp]
 0060F17D    wait
>0060F17E    jmp         006100BD
 0060F183    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0060F18A    jne         0060F19A
 0060F18C    xor         eax,eax
 0060F18E    mov         dword ptr [esp],eax
 0060F191    mov         dword ptr [esp+4],eax
>0060F195    jmp         006100BD
 0060F19A    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F1A1    test        byte ptr [eax*8+8173FC],8;gvar_008173FC
 0060F1A9    seta        al
 0060F1AC    call        00686074
 0060F1B1    fstp        qword ptr [esp]
 0060F1B4    wait
>0060F1B5    jmp         006100BD
 0060F1BA    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F1C1    movzx       eax,byte ptr [eax*8+8173EF];gvar_008173EF
 0060F1C9    mov         dword ptr [esp+90],eax
 0060F1D0    fild        dword ptr [esp+90]
 0060F1D7    fstp        qword ptr [esp]
 0060F1DA    wait
>0060F1DB    jmp         006100BD
 0060F1E0    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F1E7    movzx       eax,byte ptr [eax*8+8173F2];gvar_008173F2
 0060F1EF    mov         dword ptr [esp+90],eax
 0060F1F6    fild        dword ptr [esp+90]
 0060F1FD    fstp        qword ptr [esp]
 0060F200    wait
>0060F201    jmp         006100BD
 0060F206    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F20D    movzx       eax,byte ptr [eax*8+8173F3];gvar_008173F3
 0060F215    mov         dword ptr [esp+90],eax
 0060F21C    fild        dword ptr [esp+90]
 0060F223    fstp        qword ptr [esp]
 0060F226    wait
>0060F227    jmp         006100BD
 0060F22C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F233    movzx       eax,byte ptr [eax*8+8173F4];gvar_008173F4
 0060F23B    mov         dword ptr [esp+90],eax
 0060F242    fild        dword ptr [esp+90]
 0060F249    fstp        qword ptr [esp]
 0060F24C    wait
>0060F24D    jmp         006100BD
 0060F252    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F259    movzx       eax,byte ptr [eax*8+8173F5];gvar_008173F5
 0060F261    mov         dword ptr [esp+90],eax
 0060F268    fild        dword ptr [esp+90]
 0060F26F    fstp        qword ptr [esp]
 0060F272    wait
>0060F273    jmp         006100BD
 0060F278    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F27F    movzx       eax,byte ptr [eax*8+8173F6];gvar_008173F6
 0060F287    mov         dword ptr [esp+90],eax
 0060F28E    fild        dword ptr [esp+90]
 0060F295    fstp        qword ptr [esp]
 0060F298    wait
>0060F299    jmp         006100BD
 0060F29E    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F2A5    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F2AC    movzx       eax,byte ptr [edx+eax-551]
 0060F2B4    mov         dword ptr [esp+90],eax
 0060F2BB    fild        dword ptr [esp+90]
 0060F2C2    fstp        qword ptr [esp]
 0060F2C5    wait
>0060F2C6    jmp         006100BD
 0060F2CB    sub         eax,108
 0060F2D0    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F2D7    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F2DE    movzx       eax,byte ptr [edx+eax-228]
 0060F2E6    mov         dword ptr [esp+90],eax
 0060F2ED    fild        dword ptr [esp+90]
 0060F2F4    fstp        qword ptr [esp]
 0060F2F7    wait
>0060F2F8    jmp         006100BD
 0060F2FD    sub         eax,3A
 0060F300    test        eax,eax
>0060F302    jns         0060F307
 0060F304    add         eax,3
 0060F307    sar         eax,2
 0060F30A    inc         eax
 0060F30B    lea         eax,[eax+eax*2]
 0060F30E    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F315    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F31C    fild        dword ptr [edx+eax*4-527]
 0060F323    fstp        qword ptr [esp]
 0060F326    wait
>0060F327    jmp         006100BD
 0060F32C    sub         eax,3B
 0060F32F    test        eax,eax
>0060F331    jns         0060F336
 0060F333    add         eax,3
 0060F336    sar         eax,2
 0060F339    inc         eax
 0060F33A    lea         eax,[eax+eax*2]
 0060F33D    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F344    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F34B    fild        dword ptr [edx+eax*4-523]
 0060F352    fstp        qword ptr [esp]
 0060F355    wait
>0060F356    jmp         006100BD
 0060F35B    sub         eax,3C
 0060F35E    test        eax,eax
>0060F360    jns         0060F365
 0060F362    add         eax,3
 0060F365    sar         eax,2
 0060F368    inc         eax
 0060F369    lea         eax,[eax+eax*2]
 0060F36C    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F373    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F37A    movzx       eax,byte ptr [edx+eax*4-51F]
 0060F382    mov         dword ptr [esp+90],eax
 0060F389    fild        dword ptr [esp+90]
 0060F390    fstp        qword ptr [esp]
 0060F393    wait
>0060F394    jmp         006100BD
 0060F399    sub         eax,11F
 0060F39E    inc         eax
 0060F39F    lea         eax,[eax+eax*2]
 0060F3A2    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F3A9    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F3B0    movzx       eax,byte ptr [edx+eax*4-51D]
 0060F3B8    mov         dword ptr [esp+90],eax
 0060F3BF    fild        dword ptr [esp+90]
 0060F3C6    fstp        qword ptr [esp]
 0060F3C9    wait
>0060F3CA    jmp         006100BD
 0060F3CF    sub         eax,3D
 0060F3D2    test        eax,eax
>0060F3D4    jns         0060F3D9
 0060F3D6    add         eax,3
 0060F3D9    sar         eax,2
 0060F3DC    inc         eax
 0060F3DD    lea         eax,[eax+eax*2]
 0060F3E0    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F3E7    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F3EE    movzx       eax,byte ptr [edx+eax*4-51E]
 0060F3F6    call        00686074
 0060F3FB    fstp        qword ptr [esp]
 0060F3FE    wait
>0060F3FF    jmp         006100BD
 0060F404    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F40B    mov         edx,dword ptr [eax*8+8174F0];gvar_008174F0
 0060F412    mov         dword ptr [esp],edx
 0060F415    mov         edx,dword ptr [eax*8+8174F4];gvar_008174F4
 0060F41C    mov         dword ptr [esp+4],edx
>0060F420    jmp         006100BD
 0060F425    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F42C    mov         edx,dword ptr [eax*8+8174F8];gvar_008174F8
 0060F433    mov         dword ptr [esp],edx
 0060F436    mov         edx,dword ptr [eax*8+8174FC];gvar_008174FC
 0060F43D    mov         dword ptr [esp+4],edx
>0060F441    jmp         006100BD
 0060F446    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F44D    mov         edx,dword ptr [eax*8+817500];gvar_00817500
 0060F454    mov         dword ptr [esp],edx
 0060F457    mov         edx,dword ptr [eax*8+817504];gvar_00817504
 0060F45E    mov         dword ptr [esp+4],edx
>0060F462    jmp         006100BD
 0060F467    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F46E    push        dword ptr [eax*8+817504];gvar_00817504
 0060F475    push        dword ptr [eax*8+817500];gvar_00817500
 0060F47C    call        00454A5C
 0060F481    fstp        qword ptr [esp+50]
 0060F485    wait
 0060F486    fld         tbyte ptr ds:[6100E8];57.2957795130823:Extended
 0060F48C    fmul        qword ptr [esp+50]
 0060F490    fstp        qword ptr [esp+58]
 0060F494    wait
 0060F495    mov         eax,dword ptr [esp+58]
 0060F499    mov         dword ptr [esp],eax
 0060F49C    mov         eax,dword ptr [esp+5C]
 0060F4A0    mov         dword ptr [esp+4],eax
>0060F4A4    jmp         006100BD
 0060F4A9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F4B0    push        dword ptr [eax*8+8174EC]
 0060F4B7    push        dword ptr [eax*8+8174E8]
 0060F4BE    call        00454A5C
 0060F4C3    fstp        qword ptr [esp+60]
 0060F4C7    wait
 0060F4C8    fld         tbyte ptr ds:[6100E8];57.2957795130823:Extended
 0060F4CE    fmul        qword ptr [esp+60]
 0060F4D2    fstp        qword ptr [esp+68]
 0060F4D6    wait
 0060F4D7    mov         eax,dword ptr [esp+68]
 0060F4DB    mov         dword ptr [esp],eax
 0060F4DE    mov         eax,dword ptr [esp+6C]
 0060F4E2    mov         dword ptr [esp+4],eax
>0060F4E6    jmp         006100BD
 0060F4EB    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F4F2    push        dword ptr [eax*8+8174F4];gvar_008174F4
 0060F4F9    push        dword ptr [eax*8+8174F0];gvar_008174F0
 0060F500    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F507    push        dword ptr [eax*8+8174FC];gvar_008174FC
 0060F50E    push        dword ptr [eax*8+8174F8];gvar_008174F8
 0060F515    call        00454A9C
 0060F51A    fstp        qword ptr [esp+70]
 0060F51E    wait
 0060F51F    fld         tbyte ptr ds:[6100E8];57.2957795130823:Extended
 0060F525    fmul        qword ptr [esp+70]
 0060F529    fstp        qword ptr [esp+78]
 0060F52D    wait
 0060F52E    fld         qword ptr [esp+78]
 0060F532    fchs
 0060F534    fstp        qword ptr [esp]
 0060F537    wait
>0060F538    jmp         006100BD
 0060F53D    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F544    push        dword ptr [eax*8+8174DC]
 0060F54B    push        dword ptr [eax*8+8174D8]
 0060F552    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F559    push        dword ptr [eax*8+8174E4]
 0060F560    push        dword ptr [eax*8+8174E0]
 0060F567    call        00454A9C
 0060F56C    fstp        qword ptr [esp+80]
 0060F573    wait
 0060F574    fld         tbyte ptr ds:[6100E8];57.2957795130823:Extended
 0060F57A    fmul        qword ptr [esp+80]
 0060F581    fstp        qword ptr [esp+88]
 0060F588    wait
 0060F589    fld         qword ptr [esp+88]
 0060F590    fchs
 0060F592    fstp        qword ptr [esp]
 0060F595    wait
>0060F596    jmp         006100BD
 0060F59B    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F5A2    lea         eax,[eax*8+817658];gvar_00817658
 0060F5A9    movzx       edx,word ptr [eax+4C]
 0060F5AD    test        dx,dx
>0060F5B0    je          0060F5C8
 0060F5B2    movsx       ecx,word ptr [eax+50]
 0060F5B6    movsx       ebx,dx
 0060F5B9    sub         ecx,ebx
>0060F5BB    je          0060F5C8
 0060F5BD    movsx       ecx,dx
 0060F5C0    movsx       ebx,word ptr [eax+54]
 0060F5C4    sub         ecx,ebx
>0060F5C6    jne         0060F5D6
 0060F5C8    xor         eax,eax
 0060F5CA    mov         dword ptr [esp],eax
 0060F5CD    mov         dword ptr [esp+4],eax
>0060F5D1    jmp         006100BD
 0060F5D6    cmp         dx,word ptr [eax+48]
>0060F5DA    jge         0060F616
 0060F5DC    movsx       ecx,word ptr [eax+48]
 0060F5E0    movsx       edx,dx
 0060F5E3    sub         ecx,edx
 0060F5E5    mov         dword ptr [esp+90],ecx
 0060F5EC    fild        dword ptr [esp+90]
 0060F5F3    movsx       edx,word ptr [eax+50]
 0060F5F7    movsx       eax,word ptr [eax+4C]
 0060F5FB    sub         edx,eax
 0060F5FD    mov         dword ptr [esp+9C],edx
 0060F604    fild        dword ptr [esp+9C]
 0060F60B    fdivp       st(1),st
 0060F60D    fstp        qword ptr [esp]
 0060F610    wait
>0060F611    jmp         006100BD
 0060F616    movsx       ecx,word ptr [eax+48]
 0060F61A    movsx       edx,dx
 0060F61D    sub         ecx,edx
 0060F61F    mov         dword ptr [esp+90],ecx
 0060F626    fild        dword ptr [esp+90]
 0060F62D    movsx       edx,word ptr [eax+4C]
 0060F631    movsx       eax,word ptr [eax+54]
 0060F635    sub         edx,eax
 0060F637    mov         dword ptr [esp+9C],edx
 0060F63E    fild        dword ptr [esp+9C]
 0060F645    fdivp       st(1),st
 0060F647    fstp        qword ptr [esp]
 0060F64A    wait
>0060F64B    jmp         006100BD
 0060F650    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F657    lea         eax,[eax*8+817658];gvar_00817658
 0060F65E    movzx       edx,word ptr [eax+4E]
 0060F662    test        dx,dx
>0060F665    je          0060F67D
 0060F667    movsx       ecx,word ptr [eax+52]
 0060F66B    movsx       ebx,dx
 0060F66E    sub         ecx,ebx
>0060F670    je          0060F67D
 0060F672    movsx       ecx,dx
 0060F675    movsx       ebx,word ptr [eax+56]
 0060F679    sub         ecx,ebx
>0060F67B    jne         0060F68B
 0060F67D    xor         eax,eax
 0060F67F    mov         dword ptr [esp],eax
 0060F682    mov         dword ptr [esp+4],eax
>0060F686    jmp         006100BD
 0060F68B    cmp         dx,word ptr [eax+4A]
>0060F68F    jge         0060F6CB
 0060F691    movsx       edx,dx
 0060F694    movsx       ecx,word ptr [eax+4A]
 0060F698    sub         edx,ecx
 0060F69A    mov         dword ptr [esp+90],edx
 0060F6A1    fild        dword ptr [esp+90]
 0060F6A8    movsx       edx,word ptr [eax+52]
 0060F6AC    movsx       eax,word ptr [eax+4E]
 0060F6B0    sub         edx,eax
 0060F6B2    mov         dword ptr [esp+9C],edx
 0060F6B9    fild        dword ptr [esp+9C]
 0060F6C0    fdivp       st(1),st
 0060F6C2    fstp        qword ptr [esp]
 0060F6C5    wait
>0060F6C6    jmp         006100BD
 0060F6CB    movsx       edx,dx
 0060F6CE    movsx       ecx,word ptr [eax+4A]
 0060F6D2    sub         edx,ecx
 0060F6D4    mov         dword ptr [esp+90],edx
 0060F6DB    fild        dword ptr [esp+90]
 0060F6E2    movsx       edx,word ptr [eax+4E]
 0060F6E6    movsx       eax,word ptr [eax+56]
 0060F6EA    sub         edx,eax
 0060F6EC    mov         dword ptr [esp+9C],edx
 0060F6F3    fild        dword ptr [esp+9C]
 0060F6FA    fdivp       st(1),st
 0060F6FC    fstp        qword ptr [esp]
 0060F6FF    wait
>0060F700    jmp         006100BD
 0060F705    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F70C    fld         dword ptr [eax*8+8176CC]
 0060F713    fstp        qword ptr [esp]
 0060F716    wait
>0060F717    jmp         006100BD
 0060F71C    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F723    fld         dword ptr [eax*8+8176D0]
 0060F72A    fstp        qword ptr [esp]
 0060F72D    wait
>0060F72E    jmp         006100BD
 0060F733    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F73A    fld         dword ptr [eax*8+8176D4]
 0060F741    fstp        qword ptr [esp]
 0060F744    wait
>0060F745    jmp         006100BD
 0060F74A    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F751    fld         dword ptr [eax*8+8176D8]
 0060F758    fstp        qword ptr [esp]
 0060F75B    wait
>0060F75C    jmp         006100BD
 0060F761    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F768    fld         dword ptr [eax*8+8176B4]
 0060F76F    fstp        qword ptr [esp]
 0060F772    wait
>0060F773    jmp         006100BD
 0060F778    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F77F    fld         dword ptr [eax*8+8176B8]
 0060F786    fstp        qword ptr [esp]
 0060F789    wait
>0060F78A    jmp         006100BD
 0060F78F    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F796    fld         dword ptr [eax*8+8176BC]
 0060F79D    fstp        qword ptr [esp]
 0060F7A0    wait
>0060F7A1    jmp         006100BD
 0060F7A6    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060F7AC    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F7B3    fmul        dword ptr [eax*8+8176B4]
 0060F7BA    fstp        qword ptr [esp]
 0060F7BD    wait
>0060F7BE    jmp         006100BD
 0060F7C3    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060F7C9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F7D0    fmul        dword ptr [eax*8+8176B8]
 0060F7D7    fstp        qword ptr [esp]
 0060F7DA    wait
>0060F7DB    jmp         006100BD
 0060F7E0    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060F7E6    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F7ED    fmul        dword ptr [eax*8+8176BC]
 0060F7F4    fstp        qword ptr [esp]
 0060F7F7    wait
>0060F7F8    jmp         006100BD
 0060F7FD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F804    fld         dword ptr [eax*8+8176B4]
 0060F80B    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F812    fsub        dword ptr [eax*8+8176C0]
 0060F819    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060F81F    fmulp       st(1),st
 0060F821    fstp        qword ptr [esp]
 0060F824    wait
>0060F825    jmp         006100BD
 0060F82A    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F831    fld         dword ptr [eax*8+8176B8]
 0060F838    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F83F    fsub        dword ptr [eax*8+8176C4]
 0060F846    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060F84C    fmulp       st(1),st
 0060F84E    fstp        qword ptr [esp]
 0060F851    wait
>0060F852    jmp         006100BD
 0060F857    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F85E    fld         dword ptr [eax*8+8176BC]
 0060F865    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F86C    fsub        dword ptr [eax*8+8176C8]
 0060F873    fld         tbyte ptr ds:[6100DC];9.8:Extended
 0060F879    fmulp       st(1),st
 0060F87B    fstp        qword ptr [esp]
 0060F87E    wait
>0060F87F    jmp         006100BD
 0060F884    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F88B    mov         edx,dword ptr [eax*8+817688];gvar_00817688
 0060F892    mov         dword ptr [esp],edx
 0060F895    mov         edx,dword ptr [eax*8+81768C];gvar_0081768C
 0060F89C    mov         dword ptr [esp+4],edx
>0060F8A0    jmp         006100BD
 0060F8A5    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F8AC    mov         edx,dword ptr [eax*8+817690];gvar_00817690
 0060F8B3    mov         dword ptr [esp],edx
 0060F8B6    mov         edx,dword ptr [eax*8+817694];gvar_00817694
 0060F8BD    mov         dword ptr [esp+4],edx
>0060F8C1    jmp         006100BD
 0060F8C6    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F8CD    mov         edx,dword ptr [eax*8+817698];gvar_00817698
 0060F8D4    mov         dword ptr [esp],edx
 0060F8D7    mov         edx,dword ptr [eax*8+81769C];gvar_0081769C
 0060F8DE    mov         dword ptr [esp+4],edx
>0060F8E2    jmp         006100BD
 0060F8E7    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F8EE    mov         edx,dword ptr [eax*8+817670];gvar_00817670
 0060F8F5    mov         dword ptr [esp],edx
 0060F8F8    mov         edx,dword ptr [eax*8+817674];gvar_00817674
 0060F8FF    mov         dword ptr [esp+4],edx
>0060F903    jmp         006100BD
 0060F908    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F90F    mov         edx,dword ptr [eax*8+817678];gvar_00817678
 0060F916    mov         dword ptr [esp],edx
 0060F919    mov         edx,dword ptr [eax*8+81767C];gvar_0081767C
 0060F920    mov         dword ptr [esp+4],edx
>0060F924    jmp         006100BD
 0060F929    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F930    mov         edx,dword ptr [eax*8+817680];gvar_00817680
 0060F937    mov         dword ptr [esp],edx
 0060F93A    mov         edx,dword ptr [eax*8+817684];gvar_00817684
 0060F941    mov         dword ptr [esp+4],edx
>0060F945    jmp         006100BD
 0060F94A    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F951    movzx       eax,byte ptr [eax*8+8176B0];gvar_008176B0
 0060F959    call        00686074
 0060F95E    fstp        qword ptr [esp]
 0060F961    wait
>0060F962    jmp         006100BD
 0060F967    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F96E    movzx       eax,byte ptr [eax*8+8176B1];gvar_008176B1
 0060F976    call        00686074
 0060F97B    fstp        qword ptr [esp]
 0060F97E    wait
>0060F97F    jmp         006100BD
 0060F984    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F98B    lea         eax,[eax*8+8173D0];gvar_008173D0
 0060F992    mov         ebx,eax
 0060F994    cmp         byte ptr [ebx+9C],2
>0060F99B    jne         0060F9BD
 0060F99D    cmp         byte ptr [ebx+9D],1
>0060F9A4    jne         0060F9BD
 0060F9A6    call        00600EA0
 0060F9AB    fsub        qword ptr [ebx+280]
 0060F9B1    fcomp       dword ptr ds:[6100F4];5:Single
 0060F9B7    wait
 0060F9B8    fnstsw      al
 0060F9BA    sahf
>0060F9BB    jbe         0060F9C1
 0060F9BD    xor         eax,eax
>0060F9BF    jmp         0060F9C3
 0060F9C1    mov         al,1
 0060F9C3    call        00686074
 0060F9C8    fstp        qword ptr [esp]
 0060F9CB    wait
>0060F9CC    jmp         006100BD
 0060F9D1    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060F9D8    lea         edx,[edx*8+8179A0];gvar_0078D490
 0060F9DF    movzx       eax,byte ptr [edx+eax-361]
 0060F9E7    mov         dword ptr [esp+90],eax
 0060F9EE    fild        dword ptr [esp+90]
 0060F9F5    fstp        qword ptr [esp]
 0060F9F8    wait
>0060F9F9    jmp         006100BD
 0060F9FE    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FA05    mov         edx,dword ptr [eax*8+817658];gvar_00817658
 0060FA0C    mov         dword ptr [esp],edx
 0060FA0F    mov         edx,dword ptr [eax*8+81765C];gvar_0081765C
 0060FA16    mov         dword ptr [esp+4],edx
>0060FA1A    jmp         006100BD
 0060FA1F    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FA26    mov         edx,dword ptr [eax*8+817660];gvar_00817660
 0060FA2D    mov         dword ptr [esp],edx
 0060FA30    mov         edx,dword ptr [eax*8+817664];gvar_00817664
 0060FA37    mov         dword ptr [esp+4],edx
>0060FA3B    jmp         006100BD
 0060FA40    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FA47    mov         edx,dword ptr [eax*8+817668];gvar_00817668
 0060FA4E    mov         dword ptr [esp],edx
 0060FA51    mov         edx,dword ptr [eax*8+81766C];gvar_0081766C
 0060FA58    mov         dword ptr [esp+4],edx
>0060FA5C    jmp         006100BD
 0060FA61    mov         ecx,eax
 0060FA63    sub         ecx,0C8
 0060FA69    mov         eax,1
 0060FA6E    shl         eax,cl
 0060FA70    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FA77    movzx       edx,word ptr [edx*8+817714];gvar_00817714
 0060FA7F    and         eax,edx
 0060FA81    setne       al
 0060FA84    call        00686074
 0060FA89    fstp        qword ptr [esp]
 0060FA8C    wait
>0060FA8D    jmp         006100BD
 0060FA92    mov         ecx,eax
 0060FA94    sub         ecx,12C
 0060FA9A    mov         eax,1
 0060FA9F    shl         eax,cl
 0060FAA1    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FAA8    movzx       edx,word ptr [edx*8+817714];gvar_00817714
 0060FAB0    and         eax,edx
 0060FAB2    setne       al
 0060FAB5    call        00686074
 0060FABA    fstp        qword ptr [esp]
 0060FABD    wait
>0060FABE    jmp         006100BD
 0060FAC3    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FACA    fild        word ptr [eax*8+817710]
 0060FAD1    fdiv        dword ptr ds:[6100F8];31:Single
 0060FAD7    fstp        qword ptr [esp]
 0060FADA    wait
>0060FADB    jmp         006100BD
 0060FAE0    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FAE7    fild        word ptr [eax*8+817712]
 0060FAEE    fdiv        dword ptr ds:[6100F8];31:Single
 0060FAF4    fstp        qword ptr [esp]
 0060FAF7    wait
>0060FAF8    jmp         006100BD
 0060FAFD    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FB04    movsx       eax,word ptr [eax*8+8176F0];gvar_008176F0
 0060FB0C    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FB13    movsx       edx,word ptr [edx*8+8176F4];gvar_008176F4
 0060FB1B    sub         eax,edx
 0060FB1D    mov         dword ptr [esp+90],eax
 0060FB24    fild        dword ptr [esp+90]
 0060FB2B    fstp        qword ptr [esp]
 0060FB2E    wait
>0060FB2F    jmp         006100BD
 0060FB34    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FB3B    movsx       eax,word ptr [eax*8+8176F2];gvar_008176F2
 0060FB43    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FB4A    movsx       edx,word ptr [edx*8+8176F6];gvar_008176F6
 0060FB52    sub         eax,edx
 0060FB54    mov         dword ptr [esp+90],eax
 0060FB5B    fild        dword ptr [esp+90]
 0060FB62    fstp        qword ptr [esp]
 0060FB65    wait
>0060FB66    jmp         006100BD
 0060FB6B    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FB72    movsx       eax,word ptr [eax*8+817700];gvar_00817700
 0060FB7A    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FB81    movsx       edx,word ptr [edx*8+817704];gvar_00817704
 0060FB89    sub         eax,edx
 0060FB8B    mov         dword ptr [esp+90],eax
 0060FB92    fild        dword ptr [esp+90]
 0060FB99    fstp        qword ptr [esp]
 0060FB9C    wait
>0060FB9D    jmp         006100BD
 0060FBA2    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FBA9    movsx       eax,word ptr [eax*8+817702];gvar_00817702
 0060FBB1    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FBB8    movsx       edx,word ptr [edx*8+817706];gvar_00817706
 0060FBC0    sub         eax,edx
 0060FBC2    mov         dword ptr [esp+90],eax
 0060FBC9    fild        dword ptr [esp+90]
 0060FBD0    fstp        qword ptr [esp]
 0060FBD3    wait
>0060FBD4    jmp         006100BD
 0060FBD9    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FBE0    movzx       eax,word ptr [edx*8+8176FC];gvar_008176FC
 0060FBE8    cmp         ax,word ptr [edx*8+8176F4];gvar_008176F4
>0060FBF0    jne         0060FC00
 0060FBF2    xor         eax,eax
 0060FBF4    mov         dword ptr [esp],eax
 0060FBF7    mov         dword ptr [esp+4],eax
>0060FBFB    jmp         006100BD
 0060FC00    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FC07    movsx       eax,word ptr [eax*8+8176F4];gvar_008176F4
 0060FC0F    movsx       ecx,word ptr [edx*8+8176F0];gvar_008176F0
 0060FC17    add         ecx,ecx
 0060FC19    add         ecx,ecx
 0060FC1B    cmp         eax,ecx
>0060FC1D    jge         0060FC6C
 0060FC1F    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FC26    movsx       edx,word ptr [edx*8+8176F0];gvar_008176F0
 0060FC2E    add         edx,edx
 0060FC30    add         edx,edx
 0060FC32    sub         edx,eax
 0060FC34    mov         dword ptr [esp+90],edx
 0060FC3B    fild        dword ptr [esp+90]
 0060FC42    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FC49    movsx       edx,word ptr [edx*8+8176FC];gvar_008176FC
 0060FC51    sub         edx,eax
 0060FC53    mov         dword ptr [esp+9C],edx
 0060FC5A    fild        dword ptr [esp+9C]
 0060FC61    fdivp       st(1),st
 0060FC63    fstp        qword ptr [esp]
 0060FC66    wait
>0060FC67    jmp         006100BD
 0060FC6C    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FC73    movsx       ecx,word ptr [ecx*8+8176F0];gvar_008176F0
 0060FC7B    add         ecx,ecx
 0060FC7D    add         ecx,ecx
 0060FC7F    cmp         eax,ecx
>0060FC81    jle         0060FCC9
 0060FC83    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FC8A    movsx       ecx,word ptr [ecx*8+8176F0];gvar_008176F0
 0060FC92    add         ecx,ecx
 0060FC94    add         ecx,ecx
 0060FC96    sub         ecx,eax
 0060FC98    mov         dword ptr [esp+90],ecx
 0060FC9F    fild        dword ptr [esp+90]
 0060FCA6    movsx       edx,word ptr [edx*8+8176F8];gvar_008176F8
 0060FCAE    sub         eax,edx
 0060FCB0    mov         dword ptr [esp+9C],eax
 0060FCB7    fild        dword ptr [esp+9C]
 0060FCBE    fdivp       st(1),st
 0060FCC0    fstp        qword ptr [esp]
 0060FCC3    wait
>0060FCC4    jmp         006100BD
 0060FCC9    xor         eax,eax
 0060FCCB    mov         dword ptr [esp],eax
 0060FCCE    mov         dword ptr [esp+4],eax
>0060FCD2    jmp         006100BD
 0060FCD7    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FCDE    movzx       eax,word ptr [edx*8+8176FE];gvar_008176FE
 0060FCE6    cmp         ax,word ptr [edx*8+8176F6];gvar_008176F6
>0060FCEE    jne         0060FCFE
 0060FCF0    xor         eax,eax
 0060FCF2    mov         dword ptr [esp],eax
 0060FCF5    mov         dword ptr [esp+4],eax
>0060FCF9    jmp         006100BD
 0060FCFE    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FD05    movsx       eax,word ptr [eax*8+8176F6];gvar_008176F6
 0060FD0D    movsx       ecx,word ptr [edx*8+8176F2];gvar_008176F2
 0060FD15    add         ecx,ecx
 0060FD17    add         ecx,ecx
 0060FD19    cmp         eax,ecx
>0060FD1B    jge         0060FD6C
 0060FD1D    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FD24    movsx       edx,word ptr [edx*8+8176F2];gvar_008176F2
 0060FD2C    add         edx,edx
 0060FD2E    add         edx,edx
 0060FD30    sub         edx,eax
 0060FD32    neg         edx
 0060FD34    mov         dword ptr [esp+90],edx
 0060FD3B    fild        dword ptr [esp+90]
 0060FD42    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FD49    movsx       edx,word ptr [edx*8+8176FE];gvar_008176FE
 0060FD51    sub         edx,eax
 0060FD53    mov         dword ptr [esp+9C],edx
 0060FD5A    fild        dword ptr [esp+9C]
 0060FD61    fdivp       st(1),st
 0060FD63    fstp        qword ptr [esp]
 0060FD66    wait
>0060FD67    jmp         006100BD
 0060FD6C    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FD73    movsx       ecx,word ptr [ecx*8+8176F2];gvar_008176F2
 0060FD7B    add         ecx,ecx
 0060FD7D    add         ecx,ecx
 0060FD7F    cmp         eax,ecx
>0060FD81    jle         0060FDCB
 0060FD83    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FD8A    movsx       ecx,word ptr [ecx*8+8176F2];gvar_008176F2
 0060FD92    add         ecx,ecx
 0060FD94    add         ecx,ecx
 0060FD96    sub         ecx,eax
 0060FD98    neg         ecx
 0060FD9A    mov         dword ptr [esp+90],ecx
 0060FDA1    fild        dword ptr [esp+90]
 0060FDA8    movsx       edx,word ptr [edx*8+8176FA];gvar_008176FA
 0060FDB0    sub         eax,edx
 0060FDB2    mov         dword ptr [esp+9C],eax
 0060FDB9    fild        dword ptr [esp+9C]
 0060FDC0    fdivp       st(1),st
 0060FDC2    fstp        qword ptr [esp]
 0060FDC5    wait
>0060FDC6    jmp         006100BD
 0060FDCB    xor         eax,eax
 0060FDCD    mov         dword ptr [esp],eax
 0060FDD0    mov         dword ptr [esp+4],eax
>0060FDD4    jmp         006100BD
 0060FDD9    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FDE0    movzx       eax,word ptr [edx*8+81770C];gvar_0081770C
 0060FDE8    cmp         ax,word ptr [edx*8+817704];gvar_00817704
>0060FDF0    jne         0060FE00
 0060FDF2    xor         eax,eax
 0060FDF4    mov         dword ptr [esp],eax
 0060FDF7    mov         dword ptr [esp+4],eax
>0060FDFB    jmp         006100BD
 0060FE00    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FE07    movsx       eax,word ptr [eax*8+817704];gvar_00817704
 0060FE0F    movsx       ecx,word ptr [edx*8+817700];gvar_00817700
 0060FE17    add         ecx,ecx
 0060FE19    add         ecx,ecx
 0060FE1B    cmp         eax,ecx
>0060FE1D    jge         0060FE6C
 0060FE1F    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FE26    movsx       edx,word ptr [edx*8+817700];gvar_00817700
 0060FE2E    add         edx,edx
 0060FE30    add         edx,edx
 0060FE32    sub         edx,eax
 0060FE34    mov         dword ptr [esp+90],edx
 0060FE3B    fild        dword ptr [esp+90]
 0060FE42    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FE49    movsx       edx,word ptr [edx*8+81770C];gvar_0081770C
 0060FE51    sub         edx,eax
 0060FE53    mov         dword ptr [esp+9C],edx
 0060FE5A    fild        dword ptr [esp+9C]
 0060FE61    fdivp       st(1),st
 0060FE63    fstp        qword ptr [esp]
 0060FE66    wait
>0060FE67    jmp         006100BD
 0060FE6C    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FE73    movsx       ecx,word ptr [ecx*8+817700];gvar_00817700
 0060FE7B    add         ecx,ecx
 0060FE7D    add         ecx,ecx
 0060FE7F    cmp         eax,ecx
>0060FE81    jle         0060FEC9
 0060FE83    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FE8A    movsx       ecx,word ptr [ecx*8+817700];gvar_00817700
 0060FE92    add         ecx,ecx
 0060FE94    add         ecx,ecx
 0060FE96    sub         ecx,eax
 0060FE98    mov         dword ptr [esp+90],ecx
 0060FE9F    fild        dword ptr [esp+90]
 0060FEA6    movsx       edx,word ptr [edx*8+817708];gvar_00817708
 0060FEAE    sub         eax,edx
 0060FEB0    mov         dword ptr [esp+9C],eax
 0060FEB7    fild        dword ptr [esp+9C]
 0060FEBE    fdivp       st(1),st
 0060FEC0    fstp        qword ptr [esp]
 0060FEC3    wait
>0060FEC4    jmp         006100BD
 0060FEC9    xor         eax,eax
 0060FECB    mov         dword ptr [esp],eax
 0060FECE    mov         dword ptr [esp+4],eax
>0060FED2    jmp         006100BD
 0060FED7    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FEDE    movzx       eax,word ptr [edx*8+81770E];gvar_0081770E
 0060FEE6    cmp         ax,word ptr [edx*8+817706];gvar_00817706
>0060FEEE    jne         0060FEFE
 0060FEF0    xor         eax,eax
 0060FEF2    mov         dword ptr [esp],eax
 0060FEF5    mov         dword ptr [esp+4],eax
>0060FEF9    jmp         006100BD
 0060FEFE    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FF05    movsx       eax,word ptr [eax*8+817706];gvar_00817706
 0060FF0D    movsx       ecx,word ptr [edx*8+817702];gvar_00817702
 0060FF15    add         ecx,ecx
 0060FF17    add         ecx,ecx
 0060FF19    cmp         eax,ecx
>0060FF1B    jge         0060FF6C
 0060FF1D    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FF24    movsx       edx,word ptr [edx*8+817702];gvar_00817702
 0060FF2C    add         edx,edx
 0060FF2E    add         edx,edx
 0060FF30    sub         edx,eax
 0060FF32    neg         edx
 0060FF34    mov         dword ptr [esp+90],edx
 0060FF3B    fild        dword ptr [esp+90]
 0060FF42    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FF49    movsx       edx,word ptr [edx*8+81770E];gvar_0081770E
 0060FF51    sub         edx,eax
 0060FF53    mov         dword ptr [esp+9C],edx
 0060FF5A    fild        dword ptr [esp+9C]
 0060FF61    fdivp       st(1),st
 0060FF63    fstp        qword ptr [esp]
 0060FF66    wait
>0060FF67    jmp         006100BD
 0060FF6C    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FF73    movsx       ecx,word ptr [ecx*8+817702];gvar_00817702
 0060FF7B    add         ecx,ecx
 0060FF7D    add         ecx,ecx
 0060FF7F    cmp         eax,ecx
>0060FF81    jle         0060FFCB
 0060FF83    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FF8A    movsx       ecx,word ptr [ecx*8+817702];gvar_00817702
 0060FF92    add         ecx,ecx
 0060FF94    add         ecx,ecx
 0060FF96    sub         ecx,eax
 0060FF98    neg         ecx
 0060FF9A    mov         dword ptr [esp+90],ecx
 0060FFA1    fild        dword ptr [esp+90]
 0060FFA8    movsx       edx,word ptr [edx*8+81770A];gvar_0081770A
 0060FFB0    sub         eax,edx
 0060FFB2    mov         dword ptr [esp+9C],eax
 0060FFB9    fild        dword ptr [esp+9C]
 0060FFC0    fdivp       st(1),st
 0060FFC2    fstp        qword ptr [esp]
 0060FFC5    wait
>0060FFC6    jmp         006100BD
 0060FFCB    xor         eax,eax
 0060FFCD    mov         dword ptr [esp],eax
 0060FFD0    mov         dword ptr [esp+4],eax
>0060FFD4    jmp         006100BD
 0060FFD9    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0060FFE0    mov         edx,dword ptr [eax*8+817638];gvar_00817638
 0060FFE7    mov         dword ptr [esp],edx
 0060FFEA    mov         edx,dword ptr [eax*8+81763C];gvar_0081763C
 0060FFF1    mov         dword ptr [esp+4],edx
>0060FFF5    jmp         006100BD
 0060FFFA    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610001    movzx       eax,byte ptr [eax*8+8173F0];gvar_008173F0
 00610009    mov         dword ptr [esp+90],eax
 00610010    fild        dword ptr [esp+90]
 00610017    fdiv        dword ptr ds:[6100FC];255:Single
 0061001D    fstp        qword ptr [esp]
 00610020    wait
>00610021    jmp         006100BD
 00610026    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061002D    movzx       eax,byte ptr [eax*8+8173E8];gvar_008173E8
 00610035    call        006085AC
 0061003A    mov         dword ptr [esp+90],eax
 00610041    fild        dword ptr [esp+90]
 00610048    fstp        qword ptr [esp]
 0061004B    wait
>0061004C    jmp         006100BD
 0061004E    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610055    movzx       eax,byte ptr [eax*8+8173F9];gvar_008173F9
 0061005D    call        00686074
 00610062    fstp        qword ptr [esp]
 00610065    wait
>00610066    jmp         006100BD
 00610068    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061006F    movzx       eax,byte ptr [eax*8+8173FA];gvar_008173FA
 00610077    call        00686074
 0061007C    fstp        qword ptr [esp]
 0061007F    wait
>00610080    jmp         006100BD
 00610082    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610089    mov         edx,dword ptr [eax*8+817620];gvar_00817620
 00610090    mov         dword ptr [esp],edx
 00610093    mov         edx,dword ptr [eax*8+817624];gvar_00817624
 0061009A    mov         dword ptr [esp+4],edx
>0061009E    jmp         006100BD
 006100A0    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006100A7    fild        dword ptr [eax*8+81788C]
 006100AE    fstp        qword ptr [esp]
 006100B1    wait
>006100B2    jmp         006100BD
 006100B4    xor         eax,eax
 006100B6    mov         dword ptr [esp],eax
 006100B9    mov         dword ptr [esp+4],eax
 006100BD    fld         qword ptr [esp]
 006100C0    add         esp,0A0
 006100C6    pop         ebx
 006100C7    ret
*}
end;

//00610100
procedure TWiimoteOldValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 00610100    push        ebp
 00610101    mov         ebp,esp
 00610103    add         esp,0FFFFFFE8
 00610106    push        ebx
 00610107    push        esi
 00610108    mov         dword ptr [ebp-4],ecx
 0061010B    mov         ebx,eax
 0061010D    mov         eax,dword ptr [ebx+18];TWiimoteOldValue....................................................
 00610110    cmp         eax,1
>00610113    jl          00610123
 00610115    cmp         eax,10
>00610118    jg          00610123
 0061011A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00610121    jne         00610143
 00610123    xor         eax,eax
 00610125    mov         dword ptr [edx],eax
 00610127    mov         dword ptr [edx+4],eax
 0061012A    mov         eax,dword ptr [ebp-4]
 0061012D    xor         edx,edx
 0061012F    mov         dword ptr [eax],edx
 00610131    mov         dword ptr [eax+4],edx
 00610134    mov         eax,dword ptr [ebp+8]
 00610137    xor         edx,edx
 00610139    mov         dword ptr [eax],edx
 0061013B    mov         dword ptr [eax+4],edx
>0061013E    jmp         00610DF4
 00610143    mov         ecx,dword ptr [ebx+20];TWiimoteOldValue..............................................Ite...
 00610146    cmp         ecx,0C0
>0061014C    jg          0061019E
>0061014E    je          00610B2F
 00610154    cmp         ecx,68
>00610157    jg          00610182
>00610159    je          006109EC
 0061015F    sub         ecx,5B
>00610162    je          006108BE
 00610168    dec         ecx
>00610169    je          00610D10
 0061016F    dec         ecx
>00610170    je          006107A8
 00610176    dec         ecx
>00610177    je          00610D8E
>0061017D    jmp         00610DE6
 00610182    sub         ecx,7A
>00610185    je          006101F7
 00610187    sub         ecx,36
>0061018A    je          00610BCC
 00610190    sub         ecx,0C
>00610193    je          00610B8B
>00610199    jmp         00610DE6
 0061019E    cmp         ecx,0FE
>006101A4    jg          006101D4
>006101A6    je          0061070B
 006101AC    sub         ecx,0C3
>006101B2    je          00610BFB
 006101B8    sub         ecx,1F
>006101BB    je          00610301
 006101C1    dec         ecx
>006101C2    je          006104B2
 006101C8    dec         ecx
>006101C9    je          0061027C
>006101CF    jmp         00610DE6
 006101D4    sub         ecx,0FF
>006101DA    je          00610763
 006101E0    sub         ecx,40
>006101E3    je          00610301
 006101E9    sub         ecx,31
>006101EC    je          00610663
>006101F2    jmp         00610DE6
 006101F7    imul        eax,eax,0BA
 006101FD    test        word ptr [eax*8+817468],200
 00610207    seta        al
 0061020A    mov         esi,eax
 0061020C    and         esi,7F
 0061020F    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610216    test        word ptr [eax*8+817468],100
 00610220    seta        al
 00610223    and         eax,7F
 00610226    sub         esi,eax
 00610228    mov         dword ptr [ebp-14],esi
 0061022B    fild        dword ptr [ebp-14]
 0061022E    fstp        qword ptr [edx]
 00610230    wait
 00610231    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610238    test        word ptr [eax*8+817468],400
 00610242    seta        al
 00610245    and         eax,7F
 00610248    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061024F    test        word ptr [edx*8+817468],800
 00610259    seta        dl
 0061025C    and         edx,7F
 0061025F    sub         eax,edx
 00610261    mov         dword ptr [ebp-14],eax
 00610264    fild        dword ptr [ebp-14]
 00610267    mov         eax,dword ptr [ebp-4]
 0061026A    fstp        qword ptr [eax]
 0061026C    wait
 0061026D    mov         eax,dword ptr [ebp+8]
 00610270    xor         edx,edx
 00610272    mov         dword ptr [eax],edx
 00610274    mov         dword ptr [eax+4],edx
>00610277    jmp         00610DF4
 0061027C    imul        eax,eax,0BA
 00610282    test        word ptr [eax*8+817714],8000;gvar_00817714
 0061028C    seta        al
 0061028F    mov         esi,eax
 00610291    and         esi,7F
 00610294    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061029B    test        word ptr [eax*8+817714],2;gvar_00817714
 006102A5    seta        al
 006102A8    and         eax,7F
 006102AB    sub         esi,eax
 006102AD    mov         dword ptr [ebp-14],esi
 006102B0    fild        dword ptr [ebp-14]
 006102B3    fstp        qword ptr [edx]
 006102B5    wait
 006102B6    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006102BD    test        word ptr [eax*8+817714],4000;gvar_00817714
 006102C7    seta        al
 006102CA    and         eax,7F
 006102CD    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006102D4    test        word ptr [edx*8+817714],1;gvar_00817714
 006102DE    seta        dl
 006102E1    and         edx,7F
 006102E4    sub         eax,edx
 006102E6    mov         dword ptr [ebp-14],eax
 006102E9    fild        dword ptr [ebp-14]
 006102EC    mov         eax,dword ptr [ebp-4]
 006102EF    fstp        qword ptr [eax]
 006102F1    wait
 006102F2    mov         eax,dword ptr [ebp+8]
 006102F5    xor         edx,edx
 006102F7    mov         dword ptr [eax],edx
 006102F9    mov         dword ptr [eax+4],edx
>006102FC    jmp         00610DF4
 00610301    imul        esi,eax,0BA
 00610307    movzx       eax,word ptr [esi*8+8176FC];gvar_008176FC
 0061030F    cmp         ax,word ptr [esi*8+8176F4];gvar_008176F4
>00610317    jne         00610325
 00610319    xor         eax,eax
 0061031B    mov         dword ptr [edx],eax
 0061031D    mov         dword ptr [edx+4],eax
>00610320    jmp         006103CD
 00610325    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061032C    movsx       eax,word ptr [eax*8+8176F4];gvar_008176F4
 00610334    movsx       ecx,word ptr [esi*8+8176F0];gvar_008176F0
 0061033C    add         ecx,ecx
 0061033E    add         ecx,ecx
 00610340    cmp         eax,ecx
>00610342    jge         0061037D
 00610344    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061034B    movsx       ecx,word ptr [ecx*8+8176F0];gvar_008176F0
 00610353    add         ecx,ecx
 00610355    add         ecx,ecx
 00610357    sub         ecx,eax
 00610359    mov         dword ptr [ebp-14],ecx
 0061035C    fild        dword ptr [ebp-14]
 0061035F    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610366    movsx       ecx,word ptr [ecx*8+8176FC];gvar_008176FC
 0061036E    sub         ecx,eax
 00610370    mov         dword ptr [ebp-18],ecx
 00610373    fild        dword ptr [ebp-18]
 00610376    fdivp       st(1),st
 00610378    fstp        qword ptr [edx]
 0061037A    wait
>0061037B    jmp         006103CD
 0061037D    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610384    movsx       ecx,word ptr [ecx*8+8176F0];gvar_008176F0
 0061038C    add         ecx,ecx
 0061038E    add         ecx,ecx
 00610390    cmp         eax,ecx
>00610392    jle         006103C6
 00610394    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061039B    movsx       ecx,word ptr [ecx*8+8176F0];gvar_008176F0
 006103A3    add         ecx,ecx
 006103A5    add         ecx,ecx
 006103A7    sub         ecx,eax
 006103A9    mov         dword ptr [ebp-14],ecx
 006103AC    fild        dword ptr [ebp-14]
 006103AF    movsx       ecx,word ptr [esi*8+8176F8];gvar_008176F8
 006103B7    sub         eax,ecx
 006103B9    mov         dword ptr [ebp-18],eax
 006103BC    fild        dword ptr [ebp-18]
 006103BF    fdivp       st(1),st
 006103C1    fstp        qword ptr [edx]
 006103C3    wait
>006103C4    jmp         006103CD
 006103C6    xor         eax,eax
 006103C8    mov         dword ptr [edx],eax
 006103CA    mov         dword ptr [edx+4],eax
 006103CD    movzx       eax,word ptr [esi*8+8176FE];gvar_008176FE
 006103D5    cmp         ax,word ptr [esi*8+8176F6];gvar_008176F6
>006103DD    jne         006103EE
 006103DF    mov         eax,dword ptr [ebp-4]
 006103E2    xor         edx,edx
 006103E4    mov         dword ptr [eax],edx
 006103E6    mov         dword ptr [eax+4],edx
>006103E9    jmp         006104A3
 006103EE    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006103F5    movsx       eax,word ptr [eax*8+8176F6];gvar_008176F6
 006103FD    movsx       edx,word ptr [esi*8+8176F2];gvar_008176F2
 00610405    add         edx,edx
 00610407    add         edx,edx
 00610409    cmp         eax,edx
>0061040B    jge         0061044B
 0061040D    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610414    movsx       edx,word ptr [edx*8+8176F2];gvar_008176F2
 0061041C    add         edx,edx
 0061041E    add         edx,edx
 00610420    sub         edx,eax
 00610422    neg         edx
 00610424    mov         dword ptr [ebp-14],edx
 00610427    fild        dword ptr [ebp-14]
 0061042A    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610431    movsx       edx,word ptr [edx*8+8176FE];gvar_008176FE
 00610439    sub         edx,eax
 0061043B    mov         dword ptr [ebp-18],edx
 0061043E    fild        dword ptr [ebp-18]
 00610441    fdivp       st(1),st
 00610443    mov         eax,dword ptr [ebp-4]
 00610446    fstp        qword ptr [eax]
 00610448    wait
>00610449    jmp         006104A3
 0061044B    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610452    movsx       edx,word ptr [edx*8+8176F2];gvar_008176F2
 0061045A    add         edx,edx
 0061045C    add         edx,edx
 0061045E    cmp         eax,edx
>00610460    jle         00610499
 00610462    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610469    movsx       edx,word ptr [edx*8+8176F2];gvar_008176F2
 00610471    add         edx,edx
 00610473    add         edx,edx
 00610475    sub         edx,eax
 00610477    neg         edx
 00610479    mov         dword ptr [ebp-14],edx
 0061047C    fild        dword ptr [ebp-14]
 0061047F    movsx       edx,word ptr [esi*8+8176FA];gvar_008176FA
 00610487    sub         eax,edx
 00610489    mov         dword ptr [ebp-18],eax
 0061048C    fild        dword ptr [ebp-18]
 0061048F    fdivp       st(1),st
 00610491    mov         eax,dword ptr [ebp-4]
 00610494    fstp        qword ptr [eax]
 00610496    wait
>00610497    jmp         006104A3
 00610499    mov         eax,dword ptr [ebp-4]
 0061049C    xor         edx,edx
 0061049E    mov         dword ptr [eax],edx
 006104A0    mov         dword ptr [eax+4],edx
 006104A3    mov         eax,dword ptr [ebp+8]
 006104A6    xor         edx,edx
 006104A8    mov         dword ptr [eax],edx
 006104AA    mov         dword ptr [eax+4],edx
>006104AD    jmp         00610DF4
 006104B2    imul        esi,eax,0BA
 006104B8    movzx       eax,word ptr [esi*8+81770C];gvar_0081770C
 006104C0    cmp         ax,word ptr [esi*8+817704];gvar_00817704
>006104C8    jne         006104D6
 006104CA    xor         eax,eax
 006104CC    mov         dword ptr [edx],eax
 006104CE    mov         dword ptr [edx+4],eax
>006104D1    jmp         0061057E
 006104D6    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006104DD    movsx       eax,word ptr [eax*8+817704];gvar_00817704
 006104E5    movsx       ecx,word ptr [esi*8+817700];gvar_00817700
 006104ED    add         ecx,ecx
 006104EF    add         ecx,ecx
 006104F1    cmp         eax,ecx
>006104F3    jge         0061052E
 006104F5    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006104FC    movsx       ecx,word ptr [ecx*8+817700];gvar_00817700
 00610504    add         ecx,ecx
 00610506    add         ecx,ecx
 00610508    sub         ecx,eax
 0061050A    mov         dword ptr [ebp-14],ecx
 0061050D    fild        dword ptr [ebp-14]
 00610510    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610517    movsx       ecx,word ptr [ecx*8+81770C];gvar_0081770C
 0061051F    sub         ecx,eax
 00610521    mov         dword ptr [ebp-18],ecx
 00610524    fild        dword ptr [ebp-18]
 00610527    fdivp       st(1),st
 00610529    fstp        qword ptr [edx]
 0061052B    wait
>0061052C    jmp         0061057E
 0061052E    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610535    movsx       ecx,word ptr [ecx*8+817700];gvar_00817700
 0061053D    add         ecx,ecx
 0061053F    add         ecx,ecx
 00610541    cmp         eax,ecx
>00610543    jle         00610577
 00610545    imul        ecx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061054C    movsx       ecx,word ptr [ecx*8+817700];gvar_00817700
 00610554    add         ecx,ecx
 00610556    add         ecx,ecx
 00610558    sub         ecx,eax
 0061055A    mov         dword ptr [ebp-14],ecx
 0061055D    fild        dword ptr [ebp-14]
 00610560    movsx       ecx,word ptr [esi*8+817708];gvar_00817708
 00610568    sub         eax,ecx
 0061056A    mov         dword ptr [ebp-18],eax
 0061056D    fild        dword ptr [ebp-18]
 00610570    fdivp       st(1),st
 00610572    fstp        qword ptr [edx]
 00610574    wait
>00610575    jmp         0061057E
 00610577    xor         eax,eax
 00610579    mov         dword ptr [edx],eax
 0061057B    mov         dword ptr [edx+4],eax
 0061057E    movzx       eax,word ptr [esi*8+81770E];gvar_0081770E
 00610586    cmp         ax,word ptr [esi*8+817706];gvar_00817706
>0061058E    jne         0061059F
 00610590    mov         eax,dword ptr [ebp-4]
 00610593    xor         edx,edx
 00610595    mov         dword ptr [eax],edx
 00610597    mov         dword ptr [eax+4],edx
>0061059A    jmp         00610654
 0061059F    imul        eax,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006105A6    movsx       eax,word ptr [eax*8+817706];gvar_00817706
 006105AE    movsx       edx,word ptr [esi*8+817702];gvar_00817702
 006105B6    add         edx,edx
 006105B8    add         edx,edx
 006105BA    cmp         eax,edx
>006105BC    jge         006105FC
 006105BE    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006105C5    movsx       edx,word ptr [edx*8+817702];gvar_00817702
 006105CD    add         edx,edx
 006105CF    add         edx,edx
 006105D1    sub         edx,eax
 006105D3    neg         edx
 006105D5    mov         dword ptr [ebp-14],edx
 006105D8    fild        dword ptr [ebp-14]
 006105DB    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 006105E2    movsx       edx,word ptr [edx*8+81770E];gvar_0081770E
 006105EA    sub         edx,eax
 006105EC    mov         dword ptr [ebp-18],edx
 006105EF    fild        dword ptr [ebp-18]
 006105F2    fdivp       st(1),st
 006105F4    mov         eax,dword ptr [ebp-4]
 006105F7    fstp        qword ptr [eax]
 006105F9    wait
>006105FA    jmp         00610654
 006105FC    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610603    movsx       edx,word ptr [edx*8+817702];gvar_00817702
 0061060B    add         edx,edx
 0061060D    add         edx,edx
 0061060F    cmp         eax,edx
>00610611    jle         0061064A
 00610613    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061061A    movsx       edx,word ptr [edx*8+817702];gvar_00817702
 00610622    add         edx,edx
 00610624    add         edx,edx
 00610626    sub         edx,eax
 00610628    neg         edx
 0061062A    mov         dword ptr [ebp-14],edx
 0061062D    fild        dword ptr [ebp-14]
 00610630    movsx       edx,word ptr [esi*8+81770A];gvar_0081770A
 00610638    sub         eax,edx
 0061063A    mov         dword ptr [ebp-18],eax
 0061063D    fild        dword ptr [ebp-18]
 00610640    fdivp       st(1),st
 00610642    mov         eax,dword ptr [ebp-4]
 00610645    fstp        qword ptr [eax]
 00610647    wait
>00610648    jmp         00610654
 0061064A    mov         eax,dword ptr [ebp-4]
 0061064D    xor         edx,edx
 0061064F    mov         dword ptr [eax],edx
 00610651    mov         dword ptr [eax+4],edx
 00610654    mov         eax,dword ptr [ebp+8]
 00610657    xor         edx,edx
 00610659    mov         dword ptr [eax],edx
 0061065B    mov         dword ptr [eax+4],edx
>0061065E    jmp         00610DF4
 00610663    imul        eax,eax,0BA
 00610669    lea         ecx,[eax*8+817728];gvar_00817728
 00610670    fld         qword ptr [ecx+28]
 00610673    fadd        qword ptr [ecx+38]
 00610676    fstp        qword ptr [ebp-10]
 00610679    wait
 0061067A    fld         qword ptr [ebp-10]
 0061067D    fadd        qword ptr [ecx+30]
 00610680    fadd        qword ptr [ecx+40]
 00610683    fcomp       dword ptr ds:[610DFC];0:Single
 00610689    wait
 0061068A    fnstsw      al
 0061068C    sahf
>0061068D    jne         00610698
 0061068F    xor         eax,eax
 00610691    mov         dword ptr [edx],eax
 00610693    mov         dword ptr [edx+4],eax
>00610696    jmp         006106B3
 00610698    fld         qword ptr [ebp-10]
 0061069B    fadd        qword ptr [ecx+30]
 0061069E    fadd        qword ptr [ecx+40]
 006106A1    fdivr       qword ptr [ebp-10]
 006106A4    fmul        dword ptr ds:[610E00];2:Single
 006106AA    fsub        dword ptr ds:[610E04];1:Single
 006106B0    fstp        qword ptr [edx]
 006106B2    wait
 006106B3    fld         qword ptr [ecx+38]
 006106B6    fadd        qword ptr [ecx+40]
 006106B9    fstp        qword ptr [ebp-10]
 006106BC    wait
 006106BD    fld         qword ptr [ebp-10]
 006106C0    fadd        qword ptr [ecx+30]
 006106C3    fadd        qword ptr [ecx+28]
 006106C6    fcomp       dword ptr ds:[610DFC];0:Single
 006106CC    wait
 006106CD    fnstsw      al
 006106CF    sahf
>006106D0    jne         006106DE
 006106D2    mov         eax,dword ptr [ebp-4]
 006106D5    xor         edx,edx
 006106D7    mov         dword ptr [eax],edx
 006106D9    mov         dword ptr [eax+4],edx
>006106DC    jmp         006106FC
 006106DE    fld         qword ptr [ebp-10]
 006106E1    fadd        qword ptr [ecx+30]
 006106E4    fadd        qword ptr [ecx+28]
 006106E7    fdivr       qword ptr [ebp-10]
 006106EA    fmul        dword ptr ds:[610E00];2:Single
 006106F0    fsub        dword ptr ds:[610E04];1:Single
 006106F6    mov         eax,dword ptr [ebp-4]
 006106F9    fstp        qword ptr [eax]
 006106FB    wait
 006106FC    mov         eax,dword ptr [ebp+8]
 006106FF    xor         edx,edx
 00610701    mov         dword ptr [eax],edx
 00610703    mov         dword ptr [eax+4],edx
>00610706    jmp         00610DF4
 0061070B    imul        eax,eax,0BA
 00610711    mov         ecx,dword ptr [eax*8+817540];gvar_00817540
 00610718    mov         dword ptr [edx],ecx
 0061071A    mov         ecx,dword ptr [eax*8+817544];gvar_00817544
 00610721    mov         dword ptr [edx+4],ecx
 00610724    mov         eax,dword ptr [ebp-4]
 00610727    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061072E    mov         ecx,dword ptr [edx*8+817548];gvar_00817548
 00610735    mov         dword ptr [eax],ecx
 00610737    mov         ecx,dword ptr [edx*8+81754C];gvar_0081754C
 0061073E    mov         dword ptr [eax+4],ecx
 00610741    mov         eax,dword ptr [ebp+8]
 00610744    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 0061074B    mov         ecx,dword ptr [edx*8+817550];gvar_00817550
 00610752    mov         dword ptr [eax],ecx
 00610754    mov         ecx,dword ptr [edx*8+817554];gvar_00817554
 0061075B    mov         dword ptr [eax+4],ecx
>0061075E    jmp         00610DF4
 00610763    imul        eax,eax,0BA
 00610769    mov         ecx,dword ptr [eax*8+817610];gvar_00817610
 00610770    mov         dword ptr [edx],ecx
 00610772    mov         ecx,dword ptr [eax*8+817614];gvar_00817614
 00610779    mov         dword ptr [edx+4],ecx
 0061077C    mov         eax,dword ptr [ebp-4]
 0061077F    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610786    mov         ecx,dword ptr [edx*8+817618];gvar_00817618
 0061078D    mov         dword ptr [eax],ecx
 0061078F    mov         ecx,dword ptr [edx*8+81761C];gvar_0081761C
 00610796    mov         dword ptr [eax+4],ecx
 00610799    mov         eax,dword ptr [ebp+8]
 0061079C    xor         edx,edx
 0061079E    mov         dword ptr [eax],edx
 006107A0    mov         dword ptr [eax+4],edx
>006107A3    jmp         00610DF4
 006107A8    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006107AF    jne         006107D1
 006107B1    xor         eax,eax
 006107B3    mov         dword ptr [edx],eax
 006107B5    mov         dword ptr [edx+4],eax
 006107B8    mov         eax,dword ptr [ebp-4]
 006107BB    xor         edx,edx
 006107BD    mov         dword ptr [eax],edx
 006107BF    mov         dword ptr [eax+4],edx
 006107C2    mov         eax,dword ptr [ebp+8]
 006107C5    xor         edx,edx
 006107C7    mov         dword ptr [eax],edx
 006107C9    mov         dword ptr [eax+4],edx
>006107CC    jmp         00610DF4
 006107D1    imul        esi,eax,0BA
 006107D7    fld         qword ptr [esi*8+817438];gvar_00817438
 006107DE    fadd        qword ptr [esi*8+817450];gvar_00817450
 006107E5    fdiv        dword ptr ds:[610E00];2:Single
 006107EB    fstp        qword ptr [ebp-10]
 006107EE    wait
 006107EF    fld         qword ptr [esi*8+817420];gvar_00817420
 006107F6    fsub        qword ptr [ebp-10]
 006107F9    fstp        qword ptr [edx]
 006107FB    wait
 006107FC    fld         qword ptr [edx]
 006107FE    fcomp       dword ptr ds:[610DFC];0:Single
 00610804    wait
 00610805    fnstsw      al
 00610807    sahf
>00610808    je          00610819
 0061080A    fld         qword ptr [esi*8+817408];gvar_00817408
 00610811    fsub        qword ptr [ebp-10]
 00610814    fdiv        qword ptr [edx]
 00610816    fstp        qword ptr [edx]
 00610818    wait
 00610819    fld         qword ptr [esi*8+817428];gvar_00817428
 00610820    fadd        qword ptr [esi*8+817458];gvar_00817458
 00610827    fdiv        dword ptr ds:[610E00];2:Single
 0061082D    fstp        qword ptr [ebp-10]
 00610830    wait
 00610831    fld         qword ptr [esi*8+817440];gvar_00817440
 00610838    fsub        qword ptr [ebp-10]
 0061083B    mov         eax,dword ptr [ebp-4]
 0061083E    fstp        qword ptr [eax]
 00610840    wait
 00610841    mov         eax,dword ptr [ebp-4]
 00610844    fld         qword ptr [eax]
 00610846    fcomp       dword ptr ds:[610DFC];0:Single
 0061084C    wait
 0061084D    fnstsw      al
 0061084F    sahf
>00610850    je          00610867
 00610852    fld         qword ptr [esi*8+817410];gvar_00817410
 00610859    fsub        qword ptr [ebp-10]
 0061085C    mov         eax,dword ptr [ebp-4]
 0061085F    fdiv        qword ptr [eax]
 00610861    mov         eax,dword ptr [ebp-4]
 00610864    fstp        qword ptr [eax]
 00610866    wait
 00610867    fld         qword ptr [esi*8+817430];gvar_00817430
 0061086E    fadd        qword ptr [esi*8+817448];gvar_00817448
 00610875    fdiv        dword ptr ds:[610E00];2:Single
 0061087B    fstp        qword ptr [ebp-10]
 0061087E    wait
 0061087F    fld         qword ptr [esi*8+817460];gvar_00817460
 00610886    fsub        qword ptr [ebp-10]
 00610889    mov         eax,dword ptr [ebp+8]
 0061088C    fstp        qword ptr [eax]
 0061088E    wait
 0061088F    mov         eax,dword ptr [ebp+8]
 00610892    fld         qword ptr [eax]
 00610894    fcomp       dword ptr ds:[610DFC];0:Single
 0061089A    wait
 0061089B    fnstsw      al
 0061089D    sahf
>0061089E    je          00610DF4
 006108A4    fld         qword ptr [esi*8+817418];gvar_00817418
 006108AB    fsub        qword ptr [ebp-10]
 006108AE    mov         eax,dword ptr [ebp+8]
 006108B1    fdiv        qword ptr [eax]
 006108B3    mov         eax,dword ptr [ebp+8]
 006108B6    fstp        qword ptr [eax]
 006108B8    wait
>006108B9    jmp         00610DF4
 006108BE    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006108C5    jne         006108E7
 006108C7    xor         eax,eax
 006108C9    mov         dword ptr [edx],eax
 006108CB    mov         dword ptr [edx+4],eax
 006108CE    mov         eax,dword ptr [ebp-4]
 006108D1    xor         edx,edx
 006108D3    mov         dword ptr [eax],edx
 006108D5    mov         dword ptr [eax+4],edx
 006108D8    mov         eax,dword ptr [ebp+8]
 006108DB    xor         edx,edx
 006108DD    mov         dword ptr [eax],edx
 006108DF    mov         dword ptr [eax+4],edx
>006108E2    jmp         00610DF4
 006108E7    imul        esi,eax,0BA
 006108ED    fld         qword ptr [esi*8+817438];gvar_00817438
 006108F4    fadd        qword ptr [esi*8+817450];gvar_00817450
 006108FB    fdiv        dword ptr ds:[610E00];2:Single
 00610901    fstp        qword ptr [ebp-10]
 00610904    wait
 00610905    fld         qword ptr [esi*8+817420];gvar_00817420
 0061090C    fsub        qword ptr [ebp-10]
 0061090F    fstp        qword ptr [edx]
 00610911    wait
 00610912    fld         qword ptr [edx]
 00610914    fcomp       dword ptr ds:[610DFC];0:Single
 0061091A    wait
 0061091B    fnstsw      al
 0061091D    sahf
>0061091E    je          00610937
 00610920    fld         qword ptr [esi*8+817408];gvar_00817408
 00610927    fsub        qword ptr [ebp-10]
 0061092A    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610930    fmulp       st(1),st
 00610932    fdiv        qword ptr [edx]
 00610934    fstp        qword ptr [edx]
 00610936    wait
 00610937    fld         qword ptr [esi*8+817428];gvar_00817428
 0061093E    fadd        qword ptr [esi*8+817458];gvar_00817458
 00610945    fdiv        dword ptr ds:[610E00];2:Single
 0061094B    fstp        qword ptr [ebp-10]
 0061094E    wait
 0061094F    fld         qword ptr [esi*8+817440];gvar_00817440
 00610956    fsub        qword ptr [ebp-10]
 00610959    mov         eax,dword ptr [ebp-4]
 0061095C    fstp        qword ptr [eax]
 0061095E    wait
 0061095F    mov         eax,dword ptr [ebp-4]
 00610962    fld         qword ptr [eax]
 00610964    fcomp       dword ptr ds:[610DFC];0:Single
 0061096A    wait
 0061096B    fnstsw      al
 0061096D    sahf
>0061096E    je          0061098D
 00610970    fld         qword ptr [esi*8+817410];gvar_00817410
 00610977    fsub        qword ptr [ebp-10]
 0061097A    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610980    fmulp       st(1),st
 00610982    mov         eax,dword ptr [ebp-4]
 00610985    fdiv        qword ptr [eax]
 00610987    mov         eax,dword ptr [ebp-4]
 0061098A    fstp        qword ptr [eax]
 0061098C    wait
 0061098D    fld         qword ptr [esi*8+817430];gvar_00817430
 00610994    fadd        qword ptr [esi*8+817448];gvar_00817448
 0061099B    fdiv        dword ptr ds:[610E00];2:Single
 006109A1    fstp        qword ptr [ebp-10]
 006109A4    wait
 006109A5    fld         qword ptr [esi*8+817460];gvar_00817460
 006109AC    fsub        qword ptr [ebp-10]
 006109AF    mov         eax,dword ptr [ebp+8]
 006109B2    fstp        qword ptr [eax]
 006109B4    wait
 006109B5    mov         eax,dword ptr [ebp+8]
 006109B8    fld         qword ptr [eax]
 006109BA    fcomp       dword ptr ds:[610DFC];0:Single
 006109C0    wait
 006109C1    fnstsw      al
 006109C3    sahf
>006109C4    je          00610DF4
 006109CA    fld         qword ptr [esi*8+817418];gvar_00817418
 006109D1    fsub        qword ptr [ebp-10]
 006109D4    fld         tbyte ptr ds:[610E08];9.8:Extended
 006109DA    fmulp       st(1),st
 006109DC    mov         eax,dword ptr [ebp+8]
 006109DF    fdiv        qword ptr [eax]
 006109E1    mov         eax,dword ptr [ebp+8]
 006109E4    fstp        qword ptr [eax]
 006109E6    wait
>006109E7    jmp         00610DF4
 006109EC    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006109F3    jne         00610A15
 006109F5    xor         eax,eax
 006109F7    mov         dword ptr [edx],eax
 006109F9    mov         dword ptr [edx+4],eax
 006109FC    mov         eax,dword ptr [ebp-4]
 006109FF    xor         edx,edx
 00610A01    mov         dword ptr [eax],edx
 00610A03    mov         dword ptr [eax+4],edx
 00610A06    mov         eax,dword ptr [ebp+8]
 00610A09    xor         edx,edx
 00610A0B    mov         dword ptr [eax],edx
 00610A0D    mov         dword ptr [eax+4],edx
>00610A10    jmp         00610DF4
 00610A15    imul        esi,eax,0BA
 00610A1B    fld         qword ptr [esi*8+817438];gvar_00817438
 00610A22    fadd        qword ptr [esi*8+817450];gvar_00817450
 00610A29    fdiv        dword ptr ds:[610E00];2:Single
 00610A2F    fstp        qword ptr [ebp-10]
 00610A32    wait
 00610A33    fld         qword ptr [esi*8+817420];gvar_00817420
 00610A3A    fsub        qword ptr [ebp-10]
 00610A3D    fstp        qword ptr [edx]
 00610A3F    wait
 00610A40    fld         qword ptr [edx]
 00610A42    fcomp       dword ptr ds:[610DFC];0:Single
 00610A48    wait
 00610A49    fnstsw      al
 00610A4B    sahf
>00610A4C    je          00610A6C
 00610A4E    fld         qword ptr [esi*8+817408];gvar_00817408
 00610A55    fsub        qword ptr [ebp-10]
 00610A58    fdiv        qword ptr [edx]
 00610A5A    fsub        qword ptr [esi*8+8174F0];gvar_008174F0
 00610A61    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610A67    fmulp       st(1),st
 00610A69    fstp        qword ptr [edx]
 00610A6B    wait
 00610A6C    fld         qword ptr [esi*8+817428];gvar_00817428
 00610A73    fadd        qword ptr [esi*8+817458];gvar_00817458
 00610A7A    fdiv        dword ptr ds:[610E00];2:Single
 00610A80    fstp        qword ptr [ebp-10]
 00610A83    wait
 00610A84    fld         qword ptr [esi*8+817440];gvar_00817440
 00610A8B    fsub        qword ptr [ebp-10]
 00610A8E    mov         eax,dword ptr [ebp-4]
 00610A91    fstp        qword ptr [eax]
 00610A93    wait
 00610A94    mov         eax,dword ptr [ebp-4]
 00610A97    fld         qword ptr [eax]
 00610A99    fcomp       dword ptr ds:[610DFC];0:Single
 00610A9F    wait
 00610AA0    fnstsw      al
 00610AA2    sahf
>00610AA3    je          00610AC9
 00610AA5    fld         qword ptr [esi*8+817410];gvar_00817410
 00610AAC    fsub        qword ptr [ebp-10]
 00610AAF    mov         eax,dword ptr [ebp-4]
 00610AB2    fdiv        qword ptr [eax]
 00610AB4    fsub        qword ptr [esi*8+8174F8];gvar_008174F8
 00610ABB    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610AC1    fmulp       st(1),st
 00610AC3    mov         eax,dword ptr [ebp-4]
 00610AC6    fstp        qword ptr [eax]
 00610AC8    wait
 00610AC9    fld         qword ptr [esi*8+817430];gvar_00817430
 00610AD0    fadd        qword ptr [esi*8+817448];gvar_00817448
 00610AD7    fdiv        dword ptr ds:[610E00];2:Single
 00610ADD    fstp        qword ptr [ebp-10]
 00610AE0    wait
 00610AE1    fld         qword ptr [esi*8+817460];gvar_00817460
 00610AE8    fsub        qword ptr [ebp-10]
 00610AEB    mov         eax,dword ptr [ebp+8]
 00610AEE    fstp        qword ptr [eax]
 00610AF0    wait
 00610AF1    mov         eax,dword ptr [ebp+8]
 00610AF4    fld         qword ptr [eax]
 00610AF6    fcomp       dword ptr ds:[610DFC];0:Single
 00610AFC    wait
 00610AFD    fnstsw      al
 00610AFF    sahf
>00610B00    je          00610DF4
 00610B06    fld         qword ptr [esi*8+817418];gvar_00817418
 00610B0D    fsub        qword ptr [ebp-10]
 00610B10    mov         eax,dword ptr [ebp+8]
 00610B13    fdiv        qword ptr [eax]
 00610B15    fsub        qword ptr [esi*8+817500];gvar_00817500
 00610B1C    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610B22    fmulp       st(1),st
 00610B24    mov         eax,dword ptr [ebp+8]
 00610B27    fstp        qword ptr [eax]
 00610B29    wait
>00610B2A    jmp         00610DF4
 00610B2F    imul        ecx,eax,0BA
 00610B35    fld         dword ptr [ecx*8+8176B4]
 00610B3C    fsub        dword ptr [ecx*8+8176C0]
 00610B43    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610B49    fmulp       st(1),st
 00610B4B    fstp        qword ptr [edx]
 00610B4D    wait
 00610B4E    fld         dword ptr [ecx*8+8176B8]
 00610B55    fsub        dword ptr [ecx*8+8176C4]
 00610B5C    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610B62    fmulp       st(1),st
 00610B64    mov         eax,dword ptr [ebp-4]
 00610B67    fstp        qword ptr [eax]
 00610B69    wait
 00610B6A    fld         dword ptr [ecx*8+8176BC]
 00610B71    fsub        dword ptr [ecx*8+8176C8]
 00610B78    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610B7E    fmulp       st(1),st
 00610B80    mov         eax,dword ptr [ebp+8]
 00610B83    fstp        qword ptr [eax]
 00610B85    wait
>00610B86    jmp         00610DF4
 00610B8B    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610B91    imul        ecx,eax,0BA
 00610B97    fmul        dword ptr [ecx*8+8176B4]
 00610B9E    fstp        qword ptr [edx]
 00610BA0    wait
 00610BA1    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610BA7    fmul        dword ptr [ecx*8+8176B8]
 00610BAE    mov         eax,dword ptr [ebp-4]
 00610BB1    fstp        qword ptr [eax]
 00610BB3    wait
 00610BB4    fld         tbyte ptr ds:[610E08];9.8:Extended
 00610BBA    fmul        dword ptr [ecx*8+8176BC]
 00610BC1    mov         eax,dword ptr [ebp+8]
 00610BC4    fstp        qword ptr [eax]
 00610BC6    wait
>00610BC7    jmp         00610DF4
 00610BCC    imul        ecx,eax,0BA
 00610BD2    fld         dword ptr [ecx*8+8176B4]
 00610BD9    fstp        qword ptr [edx]
 00610BDB    wait
 00610BDC    fld         dword ptr [ecx*8+8176B8]
 00610BE3    mov         eax,dword ptr [ebp-4]
 00610BE6    fstp        qword ptr [eax]
 00610BE8    wait
 00610BE9    fld         dword ptr [ecx*8+8176BC]
 00610BF0    mov         eax,dword ptr [ebp+8]
 00610BF3    fstp        qword ptr [eax]
 00610BF5    wait
>00610BF6    jmp         00610DF4
 00610BFB    imul        eax,eax,0BA
 00610C01    lea         eax,[eax*8+817658];gvar_00817658
 00610C08    movzx       ecx,word ptr [eax+4C]
 00610C0C    test        cx,cx
>00610C0F    je          00610C27
 00610C11    movsx       ebx,word ptr [eax+50]
 00610C15    movsx       esi,cx
 00610C18    sub         ebx,esi
>00610C1A    je          00610C27
 00610C1C    movsx       ebx,cx
 00610C1F    movsx       esi,word ptr [eax+54]
 00610C23    sub         ebx,esi
>00610C25    jne         00610C30
 00610C27    xor         ecx,ecx
 00610C29    mov         dword ptr [edx],ecx
 00610C2B    mov         dword ptr [edx+4],ecx
>00610C2E    jmp         00610C81
 00610C30    movzx       esi,word ptr [eax+48]
 00610C34    cmp         cx,si
>00610C37    jge         00610C5E
 00610C39    movsx       ebx,si
 00610C3C    movsx       ecx,cx
 00610C3F    sub         ebx,ecx
 00610C41    mov         dword ptr [ebp-14],ebx
 00610C44    fild        dword ptr [ebp-14]
 00610C47    movsx       ecx,word ptr [eax+50]
 00610C4B    movsx       ebx,word ptr [eax+4C]
 00610C4F    sub         ecx,ebx
 00610C51    mov         dword ptr [ebp-18],ecx
 00610C54    fild        dword ptr [ebp-18]
 00610C57    fdivp       st(1),st
 00610C59    fstp        qword ptr [edx]
 00610C5B    wait
>00610C5C    jmp         00610C81
 00610C5E    movsx       ebx,si
 00610C61    movsx       ecx,cx
 00610C64    sub         ebx,ecx
 00610C66    mov         dword ptr [ebp-14],ebx
 00610C69    fild        dword ptr [ebp-14]
 00610C6C    movsx       ecx,word ptr [eax+4C]
 00610C70    movsx       ebx,word ptr [eax+54]
 00610C74    sub         ecx,ebx
 00610C76    mov         dword ptr [ebp-18],ecx
 00610C79    fild        dword ptr [ebp-18]
 00610C7C    fdivp       st(1),st
 00610C7E    fstp        qword ptr [edx]
 00610C80    wait
 00610C81    movzx       edx,word ptr [eax+4E]
 00610C85    test        dx,dx
>00610C88    je          00610CA0
 00610C8A    movsx       ecx,word ptr [eax+52]
 00610C8E    movsx       ebx,dx
 00610C91    sub         ecx,ebx
>00610C93    je          00610CA0
 00610C95    movsx       ecx,dx
 00610C98    movsx       ebx,word ptr [eax+56]
 00610C9C    sub         ecx,ebx
>00610C9E    jne         00610CAC
 00610CA0    mov         eax,dword ptr [ebp-4]
 00610CA3    xor         edx,edx
 00610CA5    mov         dword ptr [eax],edx
 00610CA7    mov         dword ptr [eax+4],edx
>00610CAA    jmp         00610D01
 00610CAC    movzx       ecx,word ptr [eax+4A]
 00610CB0    cmp         dx,cx
>00610CB3    jge         00610CDB
 00610CB5    movsx       ebx,dx
 00610CB8    mov         edx,ebx
 00610CBA    movsx       ecx,cx
 00610CBD    sub         edx,ecx
 00610CBF    mov         dword ptr [ebp-14],edx
 00610CC2    fild        dword ptr [ebp-14]
 00610CC5    movsx       edx,word ptr [eax+52]
 00610CC9    sub         edx,ebx
 00610CCB    mov         dword ptr [ebp-18],edx
 00610CCE    fild        dword ptr [ebp-18]
 00610CD1    fdivp       st(1),st
 00610CD3    mov         eax,dword ptr [ebp-4]
 00610CD6    fstp        qword ptr [eax]
 00610CD8    wait
>00610CD9    jmp         00610D01
 00610CDB    movsx       edx,dx
 00610CDE    movsx       ecx,cx
 00610CE1    sub         edx,ecx
 00610CE3    mov         dword ptr [ebp-14],edx
 00610CE6    fild        dword ptr [ebp-14]
 00610CE9    movsx       edx,word ptr [eax+4E]
 00610CED    movsx       eax,word ptr [eax+56]
 00610CF1    sub         edx,eax
 00610CF3    mov         dword ptr [ebp-18],edx
 00610CF6    fild        dword ptr [ebp-18]
 00610CF9    fdivp       st(1),st
 00610CFB    mov         eax,dword ptr [ebp-4]
 00610CFE    fstp        qword ptr [eax]
 00610D00    wait
 00610D01    mov         eax,dword ptr [ebp+8]
 00610D04    xor         edx,edx
 00610D06    mov         dword ptr [eax],edx
 00610D08    mov         dword ptr [eax+4],edx
>00610D0B    jmp         00610DF4
 00610D10    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00610D17    jne         00610D39
 00610D19    xor         eax,eax
 00610D1B    mov         dword ptr [edx],eax
 00610D1D    mov         dword ptr [edx+4],eax
 00610D20    mov         eax,dword ptr [ebp-4]
 00610D23    xor         edx,edx
 00610D25    mov         dword ptr [eax],edx
 00610D27    mov         dword ptr [eax+4],edx
 00610D2A    mov         eax,dword ptr [ebp+8]
 00610D2D    xor         edx,edx
 00610D2F    mov         dword ptr [eax],edx
 00610D31    mov         dword ptr [eax+4],edx
>00610D34    jmp         00610DF4
 00610D39    imul        eax,eax,0BA
 00610D3F    mov         ecx,dword ptr [eax*8+817408];gvar_00817408
 00610D46    mov         dword ptr [edx],ecx
 00610D48    mov         ecx,dword ptr [eax*8+81740C];gvar_0081740C
 00610D4F    mov         dword ptr [edx+4],ecx
 00610D52    mov         eax,dword ptr [ebp-4]
 00610D55    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610D5C    mov         ecx,dword ptr [edx*8+817410];gvar_00817410
 00610D63    mov         dword ptr [eax],ecx
 00610D65    mov         ecx,dword ptr [edx*8+817414];gvar_00817414
 00610D6C    mov         dword ptr [eax+4],ecx
 00610D6F    mov         eax,dword ptr [ebp+8]
 00610D72    imul        edx,dword ptr [ebx+18],0BA;TWiimoteOldValue................................................
 00610D79    mov         ecx,dword ptr [edx*8+817418];gvar_00817418
 00610D80    mov         dword ptr [eax],ecx
 00610D82    mov         ecx,dword ptr [edx*8+81741C];gvar_0081741C
 00610D89    mov         dword ptr [eax+4],ecx
>00610D8C    jmp         00610DF4
 00610D8E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00610D95    jne         00610DB4
 00610D97    xor         eax,eax
 00610D99    mov         dword ptr [edx],eax
 00610D9B    mov         dword ptr [edx+4],eax
 00610D9E    mov         eax,dword ptr [ebp-4]
 00610DA1    xor         edx,edx
 00610DA3    mov         dword ptr [eax],edx
 00610DA5    mov         dword ptr [eax+4],edx
 00610DA8    mov         eax,dword ptr [ebp+8]
 00610DAB    xor         edx,edx
 00610DAD    mov         dword ptr [eax],edx
 00610DAF    mov         dword ptr [eax+4],edx
>00610DB2    jmp         00610DF4
 00610DB4    imul        ecx,eax,0BA
 00610DBA    fld         qword ptr [ecx*8+8174F0];gvar_008174F0
 00610DC1    fchs
 00610DC3    fstp        qword ptr [edx]
 00610DC5    wait
 00610DC6    fld         qword ptr [ecx*8+8174F8];gvar_008174F8
 00610DCD    fchs
 00610DCF    mov         eax,dword ptr [ebp-4]
 00610DD2    fstp        qword ptr [eax]
 00610DD4    wait
 00610DD5    fld         qword ptr [ecx*8+817500];gvar_00817500
 00610DDC    fchs
 00610DDE    mov         eax,dword ptr [ebp+8]
 00610DE1    fstp        qword ptr [eax]
 00610DE3    wait
>00610DE4    jmp         00610DF4
 00610DE6    mov         eax,dword ptr [ebp+8]
 00610DE9    push        eax
 00610DEA    mov         ecx,dword ptr [ebp-4]
 00610DED    mov         eax,ebx
 00610DEF    call        TExpression.GetVector
 00610DF4    pop         esi
 00610DF5    pop         ebx
 00610DF6    mov         esp,ebp
 00610DF8    pop         ebp
 00610DF9    ret         4
*}
end;

//00610E14
{*function TWiimoteOldValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 00610E14    push        ebp
 00610E15    mov         ebp,esp
 00610E17    add         esp,0FFFFFFF4
 00610E1A    push        ebx
 00610E1B    push        esi
 00610E1C    push        edi
 00610E1D    mov         edi,eax
 00610E1F    mov         esi,dword ptr [edi+18];TWiimoteOldValue....................................................
 00610E22    cmp         esi,1
>00610E25    jl          00610E35
 00610E27    cmp         esi,10
>00610E2A    jg          00610E35
 00610E2C    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00610E33    jne         00610E3C
 00610E35    xor         ebx,ebx
>00610E37    jmp         00611B17
 00610E3C    mov         bl,1
 00610E3E    mov         eax,dword ptr [edi+20];TWiimoteOldValue...............................................It...
 00610E41    cmp         eax,51
>00610E44    jg          00610F31
>00610E4A    je          006115CC
 00610E50    cmp         eax,1D
>00610E53    jg          00610EE3
>00610E59    je          0061144D
 00610E5F    cmp         eax,1C
>00610E62    ja          00611B15
 00610E68    jmp         dword ptr [eax*4+610E6F]
 00610E68    dd          00611B15
 00610E68    dd          00611011
 00610E68    dd          00611291
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          006110D0
 00610E68    dd          0061113D
 00610E68    dd          006111AA
 00610E68    dd          00611217
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          00611B15
 00610E68    dd          006112C2
 00610E68    dd          006113F1
 00610E68    dd          0061141F
 00610EE3    cmp         eax,4D
>00610EE6    jg          00610F15
>00610EE8    je          00611508
 00610EEE    sub         eax,1E
>00610EF1    je          0061147B
 00610EF7    dec         eax
>00610EF8    je          006114A9
 00610EFE    sub         eax,18
>00610F01    je          006113C3
 00610F07    sub         eax,15
>00610F0A    je          006114D7
>00610F10    jmp         00611B15
 00610F15    sub         eax,4E
>00610F18    je          00611539
 00610F1E    dec         eax
>00610F1F    je          0061156A
 00610F25    dec         eax
>00610F26    je          0061159B
>00610F2C    jmp         00611B15
 00610F31    cmp         eax,6F
>00610F34    jg          00610FC7
>00610F3A    je          0061198B
 00610F40    add         eax,0FFFFFFAE
 00610F43    cmp         eax,1C
>00610F46    ja          00611B15
 00610F4C    jmp         dword ptr [eax*4+610F53]
 00610F4C    dd          006115FD
 00610F4C    dd          0061162E
 00610F4C    dd          0061165F
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611B15
 00610F4C    dd          00611A6A
 00610F4C    dd          00611A89
 00610F4C    dd          00611AA5
 00610F4C    dd          00611AC1
 00610F4C    dd          00611ADD
 00610F4C    dd          00611AF9
 00610FC7    cmp         eax,77
>00610FCA    jg          00610FF5
>00610FCC    je          00611A2A
 00610FD2    sub         eax,70
>00610FD5    je          006119DD
 00610FDB    dec         eax
>00610FDC    je          006118F2
 00610FE2    dec         eax
>00610FE3    je          0061183A
 00610FE9    dec         eax
>00610FEA    je          00611690
>00610FF0    jmp         00611B15
 00610FF5    sub         eax,78
>00610FF8    je          00611A3C
 00610FFE    dec         eax
>00610FFF    je          00611A53
 00611005    sub         eax,0A5
>0061100A    je          00611032
>0061100C    jmp         00611B15
 00611011    fld         qword ptr [ebp+8]
 00611014    call        @ROUND
 00611019    mov         edx,eax
 0061101B    imul        eax,esi,0BA
 00611021    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611028    call        006091D0
>0061102D    jmp         00611B17
 00611032    fld         qword ptr [ebp+8]
 00611035    call        @ROUND
 0061103A    mov         esi,eax
 0061103C    test        esi,esi
>0061103E    jl          00611045
 00611040    cmp         esi,0A
>00611043    jle         00611047
 00611045    xor         esi,esi
 00611047    fld         qword ptr [ebp+8]
 0061104A    call        @ROUND
 0061104F    add         eax,0FFFFFFFD
 00611052    cmp         eax,7
>00611055    ja          006110B6
 00611057    jmp         dword ptr [eax*4+61105E]
 00611057    dd          00611080
 00611057    dd          00611087
 00611057    dd          0061108E
 00611057    dd          00611095
 00611057    dd          0061109C
 00611057    dd          006110A3
 00611057    dd          006110AA
 00611057    dd          006110B1
>0061107E    jmp         006110B6
 00611080    mov         esi,4
>00611085    jmp         006110B6
 00611087    mov         esi,8
>0061108C    jmp         006110B6
 0061108E    mov         esi,9
>00611093    jmp         006110B6
 00611095    mov         esi,0A
>0061109A    jmp         006110B6
 0061109C    mov         esi,0C
>006110A1    jmp         006110B6
 006110A3    mov         esi,0D
>006110A8    jmp         006110B6
 006110AA    mov         esi,0E
>006110AF    jmp         006110B6
 006110B1    mov         esi,0F
 006110B6    mov         edx,esi
 006110B8    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006110BF    lea         eax,[eax*8+8173D0];gvar_008173D0
 006110C6    call        006091D0
>006110CB    jmp         00611B17
 006110D0    imul        eax,esi,0BA
 006110D6    cmp         byte ptr [eax*8+8173FC],0F0;gvar_008173FC
>006110DE    jne         006110E8
 006110E0    mov         byte ptr [eax*8+8173FC],0;gvar_008173FC
 006110E8    push        dword ptr [ebp+0C]
 006110EB    push        dword ptr [ebp+8]
 006110EE    call        00686060
 006110F3    test        al,al
>006110F5    je          0061111A
 006110F7    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006110FE    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 00611106    or          dl,1
 00611109    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611110    call        006091D0
>00611115    jmp         00611B17
 0061111A    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611121    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 00611129    and         dl,0E
 0061112C    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611133    call        006091D0
>00611138    jmp         00611B17
 0061113D    imul        eax,esi,0BA
 00611143    cmp         byte ptr [eax*8+8173FC],0F0;gvar_008173FC
>0061114B    jne         00611155
 0061114D    mov         byte ptr [eax*8+8173FC],0;gvar_008173FC
 00611155    push        dword ptr [ebp+0C]
 00611158    push        dword ptr [ebp+8]
 0061115B    call        00686060
 00611160    test        al,al
>00611162    je          00611187
 00611164    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 0061116B    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 00611173    or          dl,2
 00611176    lea         eax,[eax*8+8173D0];gvar_008173D0
 0061117D    call        006091D0
>00611182    jmp         00611B17
 00611187    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 0061118E    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 00611196    and         dl,0D
 00611199    lea         eax,[eax*8+8173D0];gvar_008173D0
 006111A0    call        006091D0
>006111A5    jmp         00611B17
 006111AA    imul        eax,esi,0BA
 006111B0    cmp         byte ptr [eax*8+8173FC],0F0;gvar_008173FC
>006111B8    jne         006111C2
 006111BA    mov         byte ptr [eax*8+8173FC],0;gvar_008173FC
 006111C2    push        dword ptr [ebp+0C]
 006111C5    push        dword ptr [ebp+8]
 006111C8    call        00686060
 006111CD    test        al,al
>006111CF    je          006111F4
 006111D1    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006111D8    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 006111E0    or          dl,4
 006111E3    lea         eax,[eax*8+8173D0];gvar_008173D0
 006111EA    call        006091D0
>006111EF    jmp         00611B17
 006111F4    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006111FB    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 00611203    and         dl,0B
 00611206    lea         eax,[eax*8+8173D0];gvar_008173D0
 0061120D    call        006091D0
>00611212    jmp         00611B17
 00611217    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0061121E    je          00611B17
 00611224    imul        eax,esi,0BA
 0061122A    cmp         byte ptr [eax*8+8173FC],0F0;gvar_008173FC
>00611232    jne         0061123C
 00611234    mov         byte ptr [eax*8+8173FC],0;gvar_008173FC
 0061123C    push        dword ptr [ebp+0C]
 0061123F    push        dword ptr [ebp+8]
 00611242    call        00686060
 00611247    test        al,al
>00611249    je          0061126E
 0061124B    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611252    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 0061125A    or          dl,8
 0061125D    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611264    call        006091D0
>00611269    jmp         00611B17
 0061126E    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611275    movzx       edx,byte ptr [eax*8+8173FC];gvar_008173FC
 0061127D    and         dl,7
 00611280    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611287    call        006091D0
>0061128C    jmp         00611B17
 00611291    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611298    je          00611B17
 0061129E    push        dword ptr [ebp+0C]
 006112A1    push        dword ptr [ebp+8]
 006112A4    call        00686060
 006112A9    mov         edx,eax
 006112AB    imul        eax,esi,0BA
 006112B1    lea         eax,[eax*8+8173D0];gvar_008173D0
 006112B8    call        00609214
>006112BD    jmp         00611B17
 006112C2    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006112C9    je          00611B17
 006112CF    fld         qword ptr [ebp+8]
 006112D2    call        @ROUND
 006112D7    add         eax,0FFFFFFCF
 006112DA    cmp         eax,0E
>006112DD    ja          006113A1
 006112E3    jmp         dword ptr [eax*4+6112EA]
 006112E3    dd          00611328
 006112E3    dd          00611331
 006112E3    dd          0061133A
 006112E3    dd          0061134A
 006112E3    dd          00611353
 006112E3    dd          00611363
 006112E3    dd          00611373
 006112E3    dd          006113A1
 006112E3    dd          006113A1
 006112E3    dd          006113A1
 006112E3    dd          006113A1
 006112E3    dd          006113A1
 006112E3    dd          0061138A
 006112E3    dd          00611393
 006112E3    dd          00611393
>00611326    jmp         006113A1
 00611328    mov         byte ptr ds:[817995],1;gvar_00817995
>0061132F    jmp         006113A1
 00611331    mov         byte ptr ds:[817997],1;gvar_00817997
>00611338    jmp         006113A1
 0061133A    mov         byte ptr ds:[817995],1;gvar_00817995
 00611341    mov         byte ptr ds:[817996],1;gvar_00817996
>00611348    jmp         006113A1
 0061134A    mov         byte ptr ds:[817997],1;gvar_00817997
>00611351    jmp         006113A1
 00611353    mov         byte ptr ds:[817995],1;gvar_00817995
 0061135A    mov         byte ptr ds:[817997],1;gvar_00817997
>00611361    jmp         006113A1
 00611363    mov         byte ptr ds:[817996],1;gvar_00817996
 0061136A    mov         byte ptr ds:[817997],1;gvar_00817997
>00611371    jmp         006113A1
 00611373    mov         byte ptr ds:[817995],1;gvar_00817995
 0061137A    mov         byte ptr ds:[817996],1;gvar_00817996
 00611381    mov         byte ptr ds:[817997],1;gvar_00817997
>00611388    jmp         006113A1
 0061138A    mov         byte ptr ds:[817997],1;gvar_00817997
>00611391    jmp         006113A1
 00611393    mov         byte ptr ds:[817995],1;gvar_00817995
 0061139A    mov         byte ptr ds:[817996],1;gvar_00817996
 006113A1    fld         qword ptr [ebp+8]
 006113A4    call        @ROUND
 006113A9    mov         edx,eax
 006113AB    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006113B2    lea         eax,[eax*8+8173D0];gvar_008173D0
 006113B9    call        00608600
>006113BE    jmp         00611B17
 006113C3    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006113CA    je          00611B17
 006113D0    fld         qword ptr [ebp+8]
 006113D3    call        @ROUND
 006113D8    mov         edx,eax
 006113DA    imul        eax,esi,0BA
 006113E0    lea         eax,[eax*8+8173D0];gvar_008173D0
 006113E7    call        00608648
>006113EC    jmp         00611B17
 006113F1    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006113F8    je          00611B17
 006113FE    fld         qword ptr [ebp+8]
 00611401    call        @ROUND
 00611406    mov         edx,eax
 00611408    imul        eax,esi,0BA
 0061140E    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611415    call        00608684
>0061141A    jmp         00611B17
 0061141F    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611426    je          00611B17
 0061142C    fld         qword ptr [ebp+8]
 0061142F    call        @ROUND
 00611434    mov         edx,eax
 00611436    imul        eax,esi,0BA
 0061143C    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611443    call        006086C0
>00611448    jmp         00611B17
 0061144D    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611454    je          00611B17
 0061145A    fld         qword ptr [ebp+8]
 0061145D    call        @ROUND
 00611462    mov         edx,eax
 00611464    imul        eax,esi,0BA
 0061146A    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611471    call        00608704
>00611476    jmp         00611B17
 0061147B    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611482    je          00611B17
 00611488    fld         qword ptr [ebp+8]
 0061148B    call        @ROUND
 00611490    mov         edx,eax
 00611492    imul        eax,esi,0BA
 00611498    lea         eax,[eax*8+8173D0];gvar_008173D0
 0061149F    call        0060873C
>006114A4    jmp         00611B17
 006114A9    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006114B0    je          00611B17
 006114B6    fld         qword ptr [ebp+8]
 006114B9    call        @ROUND
 006114BE    mov         edx,eax
 006114C0    imul        eax,esi,0BA
 006114C6    lea         eax,[eax*8+8173D0];gvar_008173D0
 006114CD    call        00608780
>006114D2    jmp         00611B17
 006114D7    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006114DE    je          00611B17
 006114E4    fld         qword ptr [ebp+8]
 006114E7    call        @ROUND
 006114EC    mov         dword ptr [ebp-8],eax
 006114EF    mov         dword ptr [ebp-4],edx
 006114F2    fild        qword ptr [ebp-8]
 006114F5    imul        eax,esi,0BA
 006114FB    fstp        qword ptr [eax*8+817420];gvar_00817420
 00611502    wait
>00611503    jmp         00611B17
 00611508    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>0061150F    je          00611B17
 00611515    fld         qword ptr [ebp+8]
 00611518    call        @ROUND
 0061151D    mov         dword ptr [ebp-8],eax
 00611520    mov         dword ptr [ebp-4],edx
 00611523    fild        qword ptr [ebp-8]
 00611526    imul        eax,esi,0BA
 0061152C    fstp        qword ptr [eax*8+817428];gvar_00817428
 00611533    wait
>00611534    jmp         00611B17
 00611539    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611540    je          00611B17
 00611546    fld         qword ptr [ebp+8]
 00611549    call        @ROUND
 0061154E    mov         dword ptr [ebp-8],eax
 00611551    mov         dword ptr [ebp-4],edx
 00611554    fild        qword ptr [ebp-8]
 00611557    imul        eax,esi,0BA
 0061155D    fstp        qword ptr [eax*8+817430];gvar_00817430
 00611564    wait
>00611565    jmp         00611B17
 0061156A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611571    je          00611B17
 00611577    fld         qword ptr [ebp+8]
 0061157A    call        @ROUND
 0061157F    mov         dword ptr [ebp-8],eax
 00611582    mov         dword ptr [ebp-4],edx
 00611585    fild        qword ptr [ebp-8]
 00611588    imul        eax,esi,0BA
 0061158E    fstp        qword ptr [eax*8+817438];gvar_00817438
 00611595    wait
>00611596    jmp         00611B17
 0061159B    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006115A2    je          00611B17
 006115A8    fld         qword ptr [ebp+8]
 006115AB    call        @ROUND
 006115B0    mov         dword ptr [ebp-8],eax
 006115B3    mov         dword ptr [ebp-4],edx
 006115B6    fild        qword ptr [ebp-8]
 006115B9    imul        eax,esi,0BA
 006115BF    fstp        qword ptr [eax*8+817440];gvar_00817440
 006115C6    wait
>006115C7    jmp         00611B17
 006115CC    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006115D3    je          00611B17
 006115D9    fld         qword ptr [ebp+8]
 006115DC    call        @ROUND
 006115E1    mov         dword ptr [ebp-8],eax
 006115E4    mov         dword ptr [ebp-4],edx
 006115E7    fild        qword ptr [ebp-8]
 006115EA    imul        eax,esi,0BA
 006115F0    fstp        qword ptr [eax*8+817448];gvar_00817448
 006115F7    wait
>006115F8    jmp         00611B17
 006115FD    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611604    je          00611B17
 0061160A    fld         qword ptr [ebp+8]
 0061160D    call        @ROUND
 00611612    mov         dword ptr [ebp-8],eax
 00611615    mov         dword ptr [ebp-4],edx
 00611618    fild        qword ptr [ebp-8]
 0061161B    imul        eax,esi,0BA
 00611621    fstp        qword ptr [eax*8+817450];gvar_00817450
 00611628    wait
>00611629    jmp         00611B17
 0061162E    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611635    je          00611B17
 0061163B    fld         qword ptr [ebp+8]
 0061163E    call        @ROUND
 00611643    mov         dword ptr [ebp-8],eax
 00611646    mov         dword ptr [ebp-4],edx
 00611649    fild        qword ptr [ebp-8]
 0061164C    imul        eax,esi,0BA
 00611652    fstp        qword ptr [eax*8+817458];gvar_00817458
 00611659    wait
>0061165A    jmp         00611B17
 0061165F    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611666    je          00611B17
 0061166C    fld         qword ptr [ebp+8]
 0061166F    call        @ROUND
 00611674    mov         dword ptr [ebp-8],eax
 00611677    mov         dword ptr [ebp-4],edx
 0061167A    fild        qword ptr [ebp-8]
 0061167D    imul        eax,esi,0BA
 00611683    fstp        qword ptr [eax*8+817460];gvar_00817460
 0061168A    wait
>0061168B    jmp         00611B17
 00611690    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611697    je          00611B17
 0061169D    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006116A4    fld         qword ptr [eax*8+817638];gvar_00817638
 006116AB    fcomp       qword ptr [ebp+8]
 006116AE    wait
 006116AF    fnstsw      al
 006116B1    sahf
>006116B2    je          00611B17
 006116B8    imul        edx,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006116BF    fld         qword ptr [edx*8+817638];gvar_00817638
 006116C6    fcomp       dword ptr ds:[611B24];0:Single
 006116CC    wait
 006116CD    fnstsw      al
 006116CF    sahf
>006116D0    jne         00611709
 006116D2    fld         qword ptr [ebp+8]
 006116D5    fcomp       dword ptr ds:[611B24];0:Single
 006116DB    wait
 006116DC    fnstsw      al
 006116DE    sahf
>006116DF    jbe         00611709
 006116E1    mov         eax,dword ptr [ebp+8]
 006116E4    mov         dword ptr [edx*8+817638],eax;gvar_00817638
 006116EB    mov         eax,dword ptr [ebp+0C]
 006116EE    mov         dword ptr [edx*8+81763C],eax;gvar_0081763C
 006116F5    mov         byte ptr [edx*8+8173FA],0;gvar_008173FA
 006116FD    lea         eax,[edx*8+8173D0];gvar_008173D0
 00611704    call        00608FD8
 00611709    fld         qword ptr [ebp+8]
 0061170C    fcomp       dword ptr ds:[611B24];0:Single
 00611712    wait
 00611713    fnstsw      al
 00611715    sahf
>00611716    jae         00611720
 00611718    xor         eax,eax
 0061171A    mov         dword ptr [ebp+8],eax
 0061171D    mov         dword ptr [ebp+0C],eax
 00611720    fld         qword ptr [ebp+8]
 00611723    fcomp       dword ptr ds:[611B24];0:Single
 00611729    wait
 0061172A    fnstsw      al
 0061172C    sahf
>0061172D    jne         0061175C
 0061172F    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611736    fld         qword ptr [eax*8+817638];gvar_00817638
 0061173D    fcomp       dword ptr ds:[611B24];0:Single
 00611743    wait
 00611744    fnstsw      al
 00611746    sahf
>00611747    jbe         0061175C
 00611749    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611750    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611757    call        006090DC
 0061175C    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611763    mov         edx,dword ptr [ebp+8]
 00611766    mov         dword ptr [eax*8+817638],edx;gvar_00817638
 0061176D    mov         edx,dword ptr [ebp+0C]
 00611770    mov         dword ptr [eax*8+81763C],edx;gvar_0081763C
 00611777    imul        edx,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 0061177E    cmp         dword ptr [edx*8+8173E8],0D;gvar_008173E8
>00611786    jne         006117C1
 00611788    fld         qword ptr [edx*8+817638];gvar_00817638
 0061178F    fcomp       dword ptr ds:[611B28];1820:Single
 00611795    wait
 00611796    fnstsw      al
 00611798    sahf
>00611799    jbe         006117C1
 0061179B    mov         dword ptr [edx*8+8173E8],0C;gvar_008173E8
 006117A6    movzx       ecx,byte ptr [edx*8+8173E8];gvar_008173E8
 006117AE    lea         eax,[edx*8+8173D0];gvar_008173D0
 006117B5    mov         edx,4A20004
 006117BA    call        00608F5C
>006117BF    jmp         00611809
 006117C1    imul        edx,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006117C8    cmp         dword ptr [edx*8+8173E8],0C;gvar_008173E8
>006117D0    jne         00611809
 006117D2    fld         qword ptr [edx*8+817638];gvar_00817638
 006117D9    fcomp       dword ptr ds:[611B28];1820:Single
 006117DF    wait
 006117E0    fnstsw      al
 006117E2    sahf
>006117E3    ja          00611809
 006117E5    mov         dword ptr [edx*8+8173E8],0D;gvar_008173E8
 006117F0    movzx       ecx,byte ptr [edx*8+8173E8];gvar_008173E8
 006117F8    lea         eax,[edx*8+8173D0];gvar_008173D0
 006117FF    mov         edx,4A20004
 00611804    call        00608F5C
 00611809    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611810    movzx       eax,byte ptr [eax*8+8173E8];gvar_008173E8
 00611818    call        006085AC
 0061181D    mov         dword ptr [ebp-0C],eax
 00611820    fild        dword ptr [ebp-0C]
 00611823    fdivr       qword ptr [ebp+8]
 00611826    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 0061182D    fstp        qword ptr [eax*8+817648]
 00611834    wait
>00611835    jmp         00611B17
 0061183A    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611841    je          00611B17
 00611847    fld         qword ptr [ebp+8]
 0061184A    fcomp       dword ptr ds:[611B24];0:Single
 00611850    wait
 00611851    fnstsw      al
 00611853    sahf
>00611854    jae         0061185E
 00611856    xor         eax,eax
 00611858    mov         dword ptr [ebp+8],eax
 0061185B    mov         dword ptr [ebp+0C],eax
 0061185E    fld         qword ptr [ebp+8]
 00611861    fcomp       dword ptr ds:[611B2C];1:Single
 00611867    wait
 00611868    fnstsw      al
 0061186A    sahf
>0061186B    jbe         00611879
 0061186D    xor         eax,eax
 0061186F    mov         dword ptr [ebp+8],eax
 00611872    mov         dword ptr [ebp+0C],3FF00000
 00611879    fld         qword ptr [ebp+8]
 0061187C    fmul        dword ptr ds:[611B30];255:Single
 00611882    call        @ROUND
 00611887    push        edx
 00611888    push        eax
 00611889    imul        eax,esi,0BA
 0061188F    movzx       eax,byte ptr [eax*8+8173F0];gvar_008173F0
 00611897    xor         edx,edx
 00611899    cmp         edx,dword ptr [esp+4]
>0061189D    jne         006118A2
 0061189F    cmp         eax,dword ptr [esp]
 006118A2    pop         edx
 006118A3    pop         eax
>006118A4    je          00611B17
 006118AA    fld         qword ptr [ebp+8]
 006118AD    fmul        dword ptr ds:[611B30];255:Single
 006118B3    call        @ROUND
 006118B8    imul        edx,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006118BF    mov         byte ptr [edx*8+8173F0],al;gvar_008173F0
 006118C6    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006118CD    movzx       ecx,byte ptr [eax*8+8173F0];gvar_008173F0
 006118D5    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006118DC    lea         eax,[eax*8+8173D0];gvar_008173D0
 006118E3    mov         edx,4A20005
 006118E8    call        00608F5C
>006118ED    jmp         00611B17
 006118F2    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006118F9    je          00611B17
 006118FF    push        dword ptr [ebp+0C]
 00611902    push        dword ptr [ebp+8]
 00611905    call        006085C0
 0061190A    movzx       eax,al
 0061190D    imul        edx,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611914    cmp         eax,dword ptr [edx*8+8173E8];gvar_008173E8
>0061191B    je          00611B17
 00611921    push        dword ptr [ebp+0C]
 00611924    push        dword ptr [ebp+8]
 00611927    call        006085C0
 0061192C    movzx       eax,al
 0061192F    imul        esi,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 00611936    mov         dword ptr [esi*8+8173E8],eax;gvar_008173E8
 0061193D    movzx       ecx,byte ptr [esi*8+8173E8];gvar_008173E8
 00611945    lea         eax,[esi*8+8173D0];gvar_008173D0
 0061194C    mov         edx,4A20004
 00611951    call        00608F5C
 00611956    imul        esi,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 0061195D    movzx       eax,byte ptr [esi*8+8173E8];gvar_008173E8
 00611965    call        006085AC
 0061196A    mov         dword ptr [ebp-0C],eax
 0061196D    fild        dword ptr [ebp-0C]
 00611970    fdivr       qword ptr [esi*8+817638];gvar_00817638
 00611977    imul        eax,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 0061197E    fstp        qword ptr [eax*8+817648]
 00611985    wait
>00611986    jmp         00611B17
 0061198B    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>00611992    je          00611B17
 00611998    push        dword ptr [ebp+0C]
 0061199B    push        dword ptr [ebp+8]
 0061199E    call        00686060
 006119A3    imul        edx,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006119AA    cmp         al,byte ptr [edx*8+8173F9];gvar_008173F9
>006119B1    je          00611B17
 006119B7    test        al,al
>006119B9    je          006119CC
 006119BB    lea         eax,[edx*8+8173D0];gvar_008173D0
 006119C2    call        00608FD8
>006119C7    jmp         00611B17
 006119CC    lea         eax,[edx*8+8173D0];gvar_008173D0
 006119D3    call        006090DC
>006119D8    jmp         00611B17
 006119DD    cmp         byte ptr ds:[81799A],0;gvar_0081799A
>006119E4    je          00611B17
 006119EA    push        dword ptr [ebp+0C]
 006119ED    push        dword ptr [ebp+8]
 006119F0    call        00686060
 006119F5    imul        esi,dword ptr [edi+18],0BA;TWiimoteOldValue................................................
 006119FC    cmp         al,byte ptr [esi*8+8173FA];gvar_008173FA
>00611A03    je          00611B17
 00611A09    mov         edx,eax
 00611A0B    add         edx,edx
 00611A0D    add         edx,edx
 00611A0F    movzx       eax,byte ptr [esi*8+8173F7];gvar_008173F7
 00611A17    add         dl,al
 00611A19    lea         eax,[esi*8+8173D0];gvar_008173D0
 00611A20    call        0060873C
>00611A25    jmp         00611B17
 00611A2A    fld         qword ptr [ebp+8]
 00611A2D    call        @ROUND
 00611A32    mov         [0081D868],eax;gvar_0081D868:Single
>00611A37    jmp         00611B17
 00611A3C    mov         eax,dword ptr [ebp+8]
 00611A3F    mov         dword ptr ds:[81D870],eax;gvar_0081D870:Double
 00611A45    mov         eax,dword ptr [ebp+0C]
 00611A48    mov         dword ptr ds:[81D874],eax;gvar_0081D874
>00611A4E    jmp         00611B17
 00611A53    mov         eax,dword ptr [ebp+8]
 00611A56    mov         dword ptr ds:[81D878],eax;gvar_0081D878:Double
 00611A5C    mov         eax,dword ptr [ebp+0C]
 00611A5F    mov         dword ptr ds:[81D87C],eax;gvar_0081D87C
>00611A65    jmp         00611B17
 00611A6A    imul        eax,esi,0BA
 00611A70    mov         edx,dword ptr [ebp+8]
 00611A73    mov         dword ptr [eax*8+817528],edx;gvar_00817528
 00611A7A    mov         edx,dword ptr [ebp+0C]
 00611A7D    mov         dword ptr [eax*8+81752C],edx;gvar_0081752C
>00611A84    jmp         00611B17
 00611A89    imul        eax,esi,0BA
 00611A8F    mov         edx,dword ptr [ebp+8]
 00611A92    mov         dword ptr [eax*8+817530],edx;gvar_00817530
 00611A99    mov         edx,dword ptr [ebp+0C]
 00611A9C    mov         dword ptr [eax*8+817534],edx;gvar_00817534
>00611AA3    jmp         00611B17
 00611AA5    imul        eax,esi,0BA
 00611AAB    mov         edx,dword ptr [ebp+8]
 00611AAE    mov         dword ptr [eax*8+817538],edx;gvar_00817538
 00611AB5    mov         edx,dword ptr [ebp+0C]
 00611AB8    mov         dword ptr [eax*8+81753C],edx;gvar_0081753C
>00611ABF    jmp         00611B17
 00611AC1    imul        eax,esi,0BA
 00611AC7    mov         edx,dword ptr [ebp+8]
 00611ACA    mov         dword ptr [eax*8+817540],edx;gvar_00817540
 00611AD1    mov         edx,dword ptr [ebp+0C]
 00611AD4    mov         dword ptr [eax*8+817544],edx;gvar_00817544
>00611ADB    jmp         00611B17
 00611ADD    imul        eax,esi,0BA
 00611AE3    mov         edx,dword ptr [ebp+8]
 00611AE6    mov         dword ptr [eax*8+817548],edx;gvar_00817548
 00611AED    mov         edx,dword ptr [ebp+0C]
 00611AF0    mov         dword ptr [eax*8+81754C],edx;gvar_0081754C
>00611AF7    jmp         00611B17
 00611AF9    imul        eax,esi,0BA
 00611AFF    mov         edx,dword ptr [ebp+8]
 00611B02    mov         dword ptr [eax*8+817550],edx;gvar_00817550
 00611B09    mov         edx,dword ptr [ebp+0C]
 00611B0C    mov         dword ptr [eax*8+817554],edx;gvar_00817554
>00611B13    jmp         00611B17
 00611B15    xor         ebx,ebx
 00611B17    mov         eax,ebx
 00611B19    pop         edi
 00611B1A    pop         esi
 00611B1B    pop         ebx
 00611B1C    mov         esp,ebp
 00611B1E    pop         ebp
 00611B1F    ret         8
end;*}

//00611B34
{*procedure TWiimoteOldValue.ToString(?:?);
begin
 00611B34    push        ebp
 00611B35    mov         ebp,esp
 00611B37    push        0
 00611B39    push        0
 00611B3B    push        0
 00611B3D    push        ebx
 00611B3E    push        esi
 00611B3F    push        edi
 00611B40    mov         esi,edx
 00611B42    mov         ebx,eax
 00611B44    xor         eax,eax
 00611B46    push        ebp
 00611B47    push        611BC1
 00611B4C    push        dword ptr fs:[eax]
 00611B4F    mov         dword ptr fs:[eax],esp
 00611B52    mov         edi,dword ptr [ebx+18];TWiimoteOldValue....................................................
 00611B55    test        edi,edi
>00611B57    jle         00611B8C
 00611B59    push        611BDC;'Wiimote'
 00611B5E    lea         edx,[ebp-4]
 00611B61    mov         eax,edi
 00611B63    call        IntToStr
 00611B68    push        dword ptr [ebp-4]
 00611B6B    push        611BF8;'.'
 00611B70    lea         edx,[ebp-8]
 00611B73    mov         eax,dword ptr [ebx+20];TWiimoteOldValue................................................I...
 00611B76    call        0061278C
 00611B7B    push        dword ptr [ebp-8]
 00611B7E    mov         eax,esi
 00611B80    mov         edx,4
 00611B85    call        @UStrCatN
>00611B8A    jmp         00611BA6
 00611B8C    lea         edx,[ebp-0C]
 00611B8F    mov         eax,dword ptr [ebx+20];TWiimoteOldValue....................................................
 00611B92    call        0061278C
 00611B97    mov         ecx,dword ptr [ebp-0C]
 00611B9A    mov         eax,esi
 00611B9C    mov         edx,611C08;'Wiimote.'
 00611BA1    call        @UStrCat3
 00611BA6    xor         eax,eax
 00611BA8    pop         edx
 00611BA9    pop         ecx
 00611BAA    pop         ecx
 00611BAB    mov         dword ptr fs:[eax],edx
 00611BAE    push        611BC8
 00611BB3    lea         eax,[ebp-0C]
 00611BB6    mov         edx,3
 00611BBB    call        @UStrArrayClr
 00611BC0    ret
>00611BC1    jmp         @HandleFinally
>00611BC6    jmp         00611BB3
 00611BC8    pop         edi
 00611BC9    pop         esi
 00611BCA    pop         ebx
 00611BCB    mov         esp,ebp
 00611BCD    pop         ebp
 00611BCE    ret
end;*}

//00611C1C
procedure sub_00611C1C;
begin
{*
 00611C1C    mov         byte ptr ds:[817994],0;gvar_00817994
 00611C23    mov         byte ptr ds:[817996],0;gvar_00817996
 00611C2A    mov         byte ptr ds:[817995],0;gvar_00817995
 00611C31    mov         byte ptr ds:[817997],0;gvar_00817997
 00611C38    mov         byte ptr ds:[817998],0;gvar_00817998
 00611C3F    ret
*}
end;

//00611C40
procedure sub_00611C40;
begin
{*
 00611C40    ret
*}
end;

//00611C44
procedure sub_00611C44;
begin
{*
 00611C44    push        ebp
 00611C45    mov         ebp,esp
 00611C47    add         esp,0FFFFFA30
 00611C4D    push        ebx
 00611C4E    push        esi
 00611C4F    push        edi
 00611C50    lea         eax,[ebp-5D0]
 00611C56    mov         edx,dword ptr ds:[605D38];TWiimoteOldState
 00611C5C    call        @InitializeRecord
 00611C61    xor         eax,eax
 00611C63    push        ebp
 00611C64    push        611D0D
 00611C69    push        dword ptr fs:[eax]
 00611C6C    mov         dword ptr fs:[eax],esp
 00611C6F    mov         edi,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 00611C75    sar         edi,1
>00611C77    jns         00611C7C
 00611C79    adc         edi,0
 00611C7C    test        edi,edi
>00611C7E    jle         00611CEE
 00611C80    mov         esi,1
 00611C85    mov         ebx,8179A0;gvar_0078D490
 00611C8A    lea         eax,[ebp-5D0]
 00611C90    mov         edx,ebx
 00611C92    mov         ecx,dword ptr ds:[605D38];TWiimoteOldState
 00611C98    call        @CopyRecord
 00611C9D    mov         eax,ebx
 00611C9F    mov         edx,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 00611CA5    sub         edx,esi
 00611CA7    imul        edx,edx,0BA
 00611CAD    lea         edx,[edx*8+8179A0];gvar_0078D490
 00611CB4    mov         ecx,dword ptr ds:[605D38];TWiimoteOldState
 00611CBA    call        @CopyRecord
 00611CBF    mov         eax,[0081D6A0];gvar_0081D6A0:Single
 00611CC4    sub         eax,esi
 00611CC6    imul        eax,eax,0BA
 00611CCC    lea         eax,[eax*8+8179A0];gvar_0078D490
 00611CD3    lea         edx,[ebp-5D0]
 00611CD9    mov         ecx,dword ptr ds:[605D38];TWiimoteOldState
 00611CDF    call        @CopyRecord
 00611CE4    inc         esi
 00611CE5    add         ebx,5D0
 00611CEB    dec         edi
>00611CEC    jne         00611C8A
 00611CEE    xor         eax,eax
 00611CF0    pop         edx
 00611CF1    pop         ecx
 00611CF2    pop         ecx
 00611CF3    mov         dword ptr fs:[eax],edx
 00611CF6    push        611D14
 00611CFB    lea         eax,[ebp-5D0]
 00611D01    mov         edx,dword ptr ds:[605D38];TWiimoteOldState
 00611D07    call        @FinalizeRecord
 00611D0C    ret
>00611D0D    jmp         @HandleFinally
>00611D12    jmp         00611CFB
 00611D14    pop         edi
 00611D15    pop         esi
 00611D16    pop         ebx
 00611D17    mov         esp,ebp
 00611D19    pop         ebp
 00611D1A    ret
*}
end;

//00611D1C
procedure sub_00611D1C(?:Integer);
begin
{*
 00611D1C    push        ebp
 00611D1D    mov         ebp,esp
 00611D1F    add         esp,0FFFFFA30
 00611D25    push        ebx
 00611D26    push        esi
 00611D27    mov         ebx,eax
 00611D29    lea         eax,[ebp-5D0]
 00611D2F    mov         edx,dword ptr ds:[605D38];TWiimoteOldState
 00611D35    call        @InitializeRecord
 00611D3A    xor         eax,eax
 00611D3C    push        ebp
 00611D3D    push        611E2F
 00611D42    push        dword ptr fs:[eax]
 00611D45    mov         dword ptr fs:[eax],esp
 00611D48    lea         eax,[ebp-5D0]
 00611D4E    imul        edx,ebx,0BA
 00611D54    lea         edx,[edx*8+8173D0];gvar_008173D0
 00611D5B    mov         ecx,dword ptr ds:[605D38];TWiimoteOldState
 00611D61    call        @CopyRecord
 00611D66    mov         eax,ebx
 00611D68    mov         esi,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 00611D6E    dec         esi
 00611D6F    sub         esi,eax
>00611D71    jl          00611D9D
 00611D73    inc         esi
 00611D74    imul        eax,eax,0BA
 00611D7A    lea         ebx,[eax*8+8179A0];gvar_0078D490
 00611D81    lea         eax,[ebx-5D0]
 00611D87    mov         edx,ebx
 00611D89    mov         ecx,dword ptr ds:[605D38];TWiimoteOldState
 00611D8F    call        @CopyRecord
 00611D94    add         ebx,5D0
 00611D9A    dec         esi
>00611D9B    jne         00611D81
 00611D9D    imul        eax,dword ptr ds:[81D6A0],0BA;gvar_0081D6A0:Single
 00611DA7    lea         eax,[eax*8+8173D0];gvar_008173D0
 00611DAE    lea         edx,[ebp-5D0]
 00611DB4    mov         ecx,dword ptr ds:[605D38];TWiimoteOldState
 00611DBA    call        @CopyRecord
 00611DBF    mov         eax,dword ptr [ebp-5D0]
 00611DC5    mov         eax,dword ptr [eax+14]
 00611DC8    push        eax
 00611DC9    call        kernel32.CancelIo
 00611DCE    mov         eax,dword ptr [ebp-5CC]
 00611DD4    cmp         eax,0FFFFFFFF
>00611DD7    je          00611DDF
 00611DD9    push        eax
 00611DDA    call        kernel32.CloseHandle
 00611DDF    lea         edx,[ebp-5D0]
 00611DE5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00611DEA    mov         eax,dword ptr [eax]
 00611DEC    mov         eax,dword ptr [eax+580]
 00611DF2    call        TJvHidDeviceController.CheckIn
 00611DF7    mov         eax,dword ptr [ebp-5D0]
 00611DFD    call        TObject.Free
 00611E02    xor         eax,eax
 00611E04    mov         dword ptr [ebp-5D0],eax
 00611E0A    dec         dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 00611E10    xor         eax,eax
 00611E12    pop         edx
 00611E13    pop         ecx
 00611E14    pop         ecx
 00611E15    mov         dword ptr fs:[eax],edx
 00611E18    push        611E36
 00611E1D    lea         eax,[ebp-5D0]
 00611E23    mov         edx,dword ptr ds:[605D38];TWiimoteOldState
 00611E29    call        @FinalizeRecord
 00611E2E    ret
>00611E2F    jmp         @HandleFinally
>00611E34    jmp         00611E1D
 00611E36    pop         esi
 00611E37    pop         ebx
 00611E38    mov         esp,ebp
 00611E3A    pop         ebp
 00611E3B    ret
*}
end;

//00611E3C
procedure sub_00611E3C;
begin
{*
 00611E3C    push        ebp
 00611E3D    mov         ebp,esp
 00611E3F    mov         ecx,0B
 00611E44    push        0
 00611E46    push        0
 00611E48    dec         ecx
>00611E49    jne         00611E44
 00611E4B    push        ebx
 00611E4C    push        esi
 00611E4D    push        edi
 00611E4E    xor         eax,eax
 00611E50    push        ebp
 00611E51    push        6121C7
 00611E56    push        dword ptr fs:[eax]
 00611E59    mov         dword ptr fs:[eax],esp
 00611E5C    xor         eax,eax
 00611E5E    push        ebp
 00611E5F    push        611EA8
 00611E64    push        dword ptr fs:[eax]
 00611E67    mov         dword ptr fs:[eax],esp
 00611E6A    lea         edx,[ebp-10]
 00611E6D    xor         eax,eax
 00611E6F    call        ParamStr
 00611E74    mov         eax,dword ptr [ebp-10]
 00611E77    lea         edx,[ebp-0C]
 00611E7A    call        ExtractFileDir
 00611E7F    lea         eax,[ebp-0C]
 00611E82    mov         edx,6121E4;'\wiimote.ini'
 00611E87    call        @UStrCat
 00611E8C    mov         ecx,dword ptr [ebp-0C]
 00611E8F    mov         dl,1
 00611E91    mov         eax,[004598F4];TIniFile
 00611E96    call        TCustomIniFile.Create;TIniFile.Create
 00611E9B    mov         dword ptr [ebp-4],eax
 00611E9E    xor         eax,eax
 00611EA0    pop         edx
 00611EA1    pop         ecx
 00611EA2    pop         ecx
 00611EA3    mov         dword ptr fs:[eax],edx
>00611EA6    jmp         00611EBC
>00611EA8    jmp         @HandleAnyException
 00611EAD    call        @DoneExcept
>00611EB2    jmp         006121AC
 00611EB7    call        @DoneExcept
 00611EBC    xor         eax,eax
 00611EBE    push        ebp
 00611EBF    push        6121A5
 00611EC4    push        dword ptr fs:[eax]
 00611EC7    mov         dword ptr fs:[eax],esp
 00611ECA    push        0
 00611ECC    mov         ecx,61220C;'BluetoothFix'
 00611ED1    mov         edx,612234;'General'
 00611ED6    mov         eax,dword ptr [ebp-4]
 00611ED9    mov         ebx,dword ptr [eax]
 00611EDB    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 00611EDE    test        eax,eax
 00611EE0    setne       dl
 00611EE3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00611EE8    mov         eax,dword ptr [eax]
 00611EEA    mov         eax,dword ptr [eax+588]
 00611EF0    call        TMenuItem.SetChecked
 00611EF5    push        0FF
 00611EF7    mov         ecx,612250;'SensorBarDots'
 00611EFC    mov         edx,612234;'General'
 00611F01    mov         eax,dword ptr [ebp-4]
 00611F04    mov         ebx,dword ptr [eax]
 00611F06    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 00611F09    mov         [0081D868],eax;gvar_0081D868:Single
 00611F0E    cmp         dword ptr ds:[81D868],0;gvar_0081D868:Single
>00611F15    je          00611F45
 00611F17    cmp         dword ptr ds:[81D868],1;gvar_0081D868:Single
>00611F1E    je          00611F45
 00611F20    push        3FC8624D
 00611F25    push        0D2F1A9FC
 00611F2A    mov         ecx,612278;'SensorBarSeparation'
 00611F2F    mov         edx,612234;'General'
 00611F34    mov         eax,dword ptr [ebp-4]
 00611F37    mov         ebx,dword ptr [eax]
 00611F39    call        dword ptr [ebx+28];TCustomIniFile.ReadFloat
 00611F3C    fstp        qword ptr ds:[81D870];gvar_0081D870:Double
 00611F42    wait
>00611F43    jmp         00611F53
 00611F45    xor         eax,eax
 00611F47    mov         dword ptr ds:[81D870],eax;gvar_0081D870:Double
 00611F4D    mov         dword ptr ds:[81D874],eax;gvar_0081D874
 00611F53    push        3FE66666
 00611F58    push        66666666
 00611F5D    mov         ecx,6122AC;'SensorBarDistance'
 00611F62    mov         edx,612234;'General'
 00611F67    mov         eax,dword ptr [ebp-4]
 00611F6A    mov         ebx,dword ptr [eax]
 00611F6C    call        dword ptr [ebx+28];TCustomIniFile.ReadFloat
 00611F6F    fstp        qword ptr ds:[81D878];gvar_0081D878:Double
 00611F75    wait
 00611F76    mov         eax,[0081D6A0];gvar_0081D6A0:Single
 00611F7B    test        eax,eax
>00611F7D    jle         0061218F
 00611F83    mov         dword ptr [ebp-8],eax
 00611F86    mov         esi,1
 00611F8B    mov         ebx,8179C8;gvar_008179C8
 00611F90    push        1
 00611F92    mov         ecx,6122DC;'UseBuiltInCalibration'
 00611F97    mov         edx,612234;'General'
 00611F9C    mov         eax,dword ptr [ebp-4]
 00611F9F    mov         edi,dword ptr [eax]
 00611FA1    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 00611FA4    test        eax,eax
 00611FA6    setne       al
 00611FA9    mov         byte ptr [ebx],al
 00611FAB    push        403E0000
 00611FB0    push        0
 00611FB2    lea         edx,[ebp-18]
 00611FB5    mov         eax,esi
 00611FB7    call        IntToStr
 00611FBC    mov         ecx,dword ptr [ebp-18]
 00611FBF    lea         eax,[ebp-14]
 00611FC2    mov         edx,612314;'Wiimote'
 00611FC7    call        @UStrCat3
 00611FCC    mov         edx,dword ptr [ebp-14]
 00611FCF    mov         ecx,612330;'cxx'
 00611FD4    mov         eax,dword ptr [ebp-4]
 00611FD7    mov         edi,dword ptr [eax]
 00611FD9    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 00611FDC    fstp        qword ptr [ebx+28]
 00611FDF    wait
 00611FE0    push        0
 00611FE2    push        0
 00611FE4    lea         edx,[ebp-20]
 00611FE7    mov         eax,esi
 00611FE9    call        IntToStr
 00611FEE    mov         ecx,dword ptr [ebp-20]
 00611FF1    lea         eax,[ebp-1C]
 00611FF4    mov         edx,612314;'Wiimote'
 00611FF9    call        @UStrCat3
 00611FFE    mov         edx,dword ptr [ebp-1C]
 00612001    mov         ecx,612344;'cxy'
 00612006    mov         eax,dword ptr [ebp-4]
 00612009    mov         edi,dword ptr [eax]
 0061200B    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 0061200E    fstp        qword ptr [ebx+30]
 00612011    wait
 00612012    push        0
 00612014    push        0
 00612016    lea         edx,[ebp-28]
 00612019    mov         eax,esi
 0061201B    call        IntToStr
 00612020    mov         ecx,dword ptr [ebp-28]
 00612023    lea         eax,[ebp-24]
 00612026    mov         edx,612314;'Wiimote'
 0061202B    call        @UStrCat3
 00612030    mov         edx,dword ptr [ebp-24]
 00612033    mov         ecx,612358;'cxz'
 00612038    mov         eax,dword ptr [ebp-4]
 0061203B    mov         edi,dword ptr [eax]
 0061203D    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 00612040    fstp        qword ptr [ebx+38]
 00612043    wait
 00612044    push        0
 00612046    push        0
 00612048    lea         edx,[ebp-30]
 0061204B    mov         eax,esi
 0061204D    call        IntToStr
 00612052    mov         ecx,dword ptr [ebp-30]
 00612055    lea         eax,[ebp-2C]
 00612058    mov         edx,612314;'Wiimote'
 0061205D    call        @UStrCat3
 00612062    mov         edx,dword ptr [ebp-2C]
 00612065    mov         ecx,61236C;'cyx'
 0061206A    mov         eax,dword ptr [ebp-4]
 0061206D    mov         edi,dword ptr [eax]
 0061206F    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 00612072    fstp        qword ptr [ebx+40]
 00612075    wait
 00612076    push        403E0000
 0061207B    push        0
 0061207D    lea         edx,[ebp-38]
 00612080    mov         eax,esi
 00612082    call        IntToStr
 00612087    mov         ecx,dword ptr [ebp-38]
 0061208A    lea         eax,[ebp-34]
 0061208D    mov         edx,612314;'Wiimote'
 00612092    call        @UStrCat3
 00612097    mov         edx,dword ptr [ebp-34]
 0061209A    mov         ecx,612380;'cyy'
 0061209F    mov         eax,dword ptr [ebp-4]
 006120A2    mov         edi,dword ptr [eax]
 006120A4    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 006120A7    fstp        qword ptr [ebx+48]
 006120AA    wait
 006120AB    push        0
 006120AD    push        0
 006120AF    lea         edx,[ebp-40]
 006120B2    mov         eax,esi
 006120B4    call        IntToStr
 006120B9    mov         ecx,dword ptr [ebp-40]
 006120BC    lea         eax,[ebp-3C]
 006120BF    mov         edx,612314;'Wiimote'
 006120C4    call        @UStrCat3
 006120C9    mov         edx,dword ptr [ebp-3C]
 006120CC    mov         ecx,612394;'cyz'
 006120D1    mov         eax,dword ptr [ebp-4]
 006120D4    mov         edi,dword ptr [eax]
 006120D6    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 006120D9    fstp        qword ptr [ebx+50]
 006120DC    wait
 006120DD    push        0
 006120DF    push        0
 006120E1    lea         edx,[ebp-48]
 006120E4    mov         eax,esi
 006120E6    call        IntToStr
 006120EB    mov         ecx,dword ptr [ebp-48]
 006120EE    lea         eax,[ebp-44]
 006120F1    mov         edx,612314;'Wiimote'
 006120F6    call        @UStrCat3
 006120FB    mov         edx,dword ptr [ebp-44]
 006120FE    mov         ecx,6123A8;'czx'
 00612103    mov         eax,dword ptr [ebp-4]
 00612106    mov         edi,dword ptr [eax]
 00612108    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 0061210B    fstp        qword ptr [ebx+58]
 0061210E    wait
 0061210F    push        0
 00612111    push        0
 00612113    lea         edx,[ebp-50]
 00612116    mov         eax,esi
 00612118    call        IntToStr
 0061211D    mov         ecx,dword ptr [ebp-50]
 00612120    lea         eax,[ebp-4C]
 00612123    mov         edx,612314;'Wiimote'
 00612128    call        @UStrCat3
 0061212D    mov         edx,dword ptr [ebp-4C]
 00612130    mov         ecx,6123BC;'czy'
 00612135    mov         eax,dword ptr [ebp-4]
 00612138    mov         edi,dword ptr [eax]
 0061213A    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 0061213D    fstp        qword ptr [ebx+60]
 00612140    wait
 00612141    push        403E0000
 00612146    push        0
 00612148    lea         edx,[ebp-58]
 0061214B    mov         eax,esi
 0061214D    call        IntToStr
 00612152    mov         ecx,dword ptr [ebp-58]
 00612155    lea         eax,[ebp-54]
 00612158    mov         edx,612314;'Wiimote'
 0061215D    call        @UStrCat3
 00612162    mov         edx,dword ptr [ebp-54]
 00612165    mov         ecx,6123D0;'czz'
 0061216A    mov         eax,dword ptr [ebp-4]
 0061216D    mov         edi,dword ptr [eax]
 0061216F    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 00612172    fstp        qword ptr [ebx+68]
 00612175    wait
 00612176    cmp         byte ptr [ebx],0
>00612179    jne         0061217F
 0061217B    mov         byte ptr [ebx+3],0
 0061217F    inc         esi
 00612180    add         ebx,5D0
 00612186    dec         dword ptr [ebp-8]
>00612189    jne         00611F90
 0061218F    xor         eax,eax
 00612191    pop         edx
 00612192    pop         ecx
 00612193    pop         ecx
 00612194    mov         dword ptr fs:[eax],edx
 00612197    push        6121AC
 0061219C    mov         eax,dword ptr [ebp-4]
 0061219F    call        TObject.Free
 006121A4    ret
>006121A5    jmp         @HandleFinally
>006121AA    jmp         0061219C
 006121AC    xor         eax,eax
 006121AE    pop         edx
 006121AF    pop         ecx
 006121B0    pop         ecx
 006121B1    mov         dword ptr fs:[eax],edx
 006121B4    push        6121CE
 006121B9    lea         eax,[ebp-58]
 006121BC    mov         edx,14
 006121C1    call        @UStrArrayClr
 006121C6    ret
>006121C7    jmp         @HandleFinally
>006121CC    jmp         006121B9
 006121CE    pop         edi
 006121CF    pop         esi
 006121D0    pop         ebx
 006121D1    mov         esp,ebp
 006121D3    pop         ebp
 006121D4    ret
*}
end;

//006123D8
procedure sub_006123D8;
begin
{*
 006123D8    push        ebx
 006123D9    push        esi
 006123DA    push        edi
 006123DB    mov         edi,8179A0;gvar_0078D490
 006123E0    mov         byte ptr ds:[81799A],0;gvar_0081799A
 006123E7    xor         eax,eax
 006123E9    mov         [0081D6A0],eax;gvar_0081D6A0:Single
 006123EE    xor         eax,eax
 006123F0    mov         [0081D864],eax;gvar_0081D864
 006123F5    mov         eax,[0078D4AC];^gvar_00817845
 006123FA    mov         byte ptr [eax],0
 006123FD    mov         eax,[0078D5A0];^gvar_00817988:Single
 00612402    xor         edx,edx
 00612404    mov         dword ptr [eax],edx
 00612406    cmp         byte ptr ds:[817994],0;gvar_00817994
>0061240D    je          00612414
 0061240F    call        00600DEC
 00612414    cmp         byte ptr ds:[817994],0;gvar_00817994
>0061241B    jne         0061242B
 0061241D    mov         eax,[0078DBAC];^gvar_00817844
 00612422    cmp         byte ptr [eax],0
>00612425    je          006125FB
 0061242B    mov         ebx,10
 00612430    mov         eax,edi
 00612432    xor         edx,edx
 00612434    mov         dword ptr [eax],edx
 00612436    add         eax,5D0
 0061243B    dec         ebx
>0061243C    jne         00612432
 0061243E    mov         ebx,10
 00612443    mov         eax,[0078D6FC];^gvar_00817848:TJvHidDevice
 00612448    xor         edx,edx
 0061244A    mov         dword ptr [eax],edx
 0061244C    add         eax,14
 0061244F    dec         ebx
>00612450    jne         00612448
 00612452    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00612457    mov         eax,dword ptr [eax]
 00612459    mov         eax,dword ptr [eax+580]
 0061245F    call        TJvHidDeviceController.Enumerate
 00612464    test        eax,eax
>00612466    jle         006125FB
 0061246C    cmp         dword ptr ds:[81D6A0],1;gvar_0081D6A0:Single
>00612473    jle         0061247A
 00612475    call        00611C44
 0061247A    mov         eax,[0078D5A0];^gvar_00817988:Single
 0061247F    cmp         dword ptr [eax],1
>00612482    jle         00612489
 00612484    call        00604264
 00612489    mov         ebx,1
 0061248E    mov         eax,[0078D5A0];^gvar_00817988:Single
 00612493    cmp         ebx,dword ptr [eax]
>00612495    jg          006124B9
 00612497    lea         eax,[ebx+ebx*4]
 0061249A    mov         edx,dword ptr ds:[78D6FC];^gvar_00817848:TJvHidDevice
 006124A0    cmp         dword ptr [edx+eax*4-14],0
>006124A5    je          006124AF
 006124A7    mov         eax,[0078D4AC];^gvar_00817845
 006124AC    mov         byte ptr [eax],1
 006124AF    inc         ebx
 006124B0    mov         eax,[0078D5A0];^gvar_00817988:Single
 006124B5    cmp         ebx,dword ptr [eax]
>006124B7    jle         00612497
 006124B9    mov         ebx,1
 006124BE    cmp         ebx,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
>006124C4    jg          006125ED
 006124CA    imul        esi,ebx,0BA
 006124D0    cmp         dword ptr [edi+esi*8-5D0],0
>006124D8    je          006125E0
 006124DE    lea         eax,[edi+esi*8-228]
 006124E5    xor         ecx,ecx
 006124E7    mov         edx,14
 006124EC    call        @FillChar
 006124F1    lea         eax,[edi+esi*8-5C4]
 006124F8    call        @UStrClr
 006124FD    xor         eax,eax
 006124FF    mov         dword ptr [edi+esi*8-368],eax
 00612506    mov         dword ptr [edi+esi*8-364],eax
 0061250D    mov         byte ptr [edi+esi*8-5A7],0
 00612515    mov         byte ptr [edi+esi*8-5A6],0
 0061251D    mov         dword ptr [edi+esi*8-5B8],0D
 00612528    mov         byte ptr [edi+esi*8-5B0],28
 00612530    mov         byte ptr [edi+esi*8-536],0
 00612538    movzx       eax,byte ptr ds:[817995];gvar_00817995
 0061253F    mov         byte ptr [edi+esi*8-5A5],al
 00612546    xor         eax,eax
 00612548    mov         dword ptr [edi+esi*8-5A0],eax
 0061254F    mov         dword ptr [edi+esi*8-59C],eax
 00612556    mov         byte ptr ds:[81799A],1;gvar_0081799A
 0061255D    lea         eax,[edi+esi*8-5D0]
 00612564    call        006087BC
 00612569    lea         eax,[edi+esi*8-5D0]
 00612570    mov         dl,4
 00612572    call        00608704
 00612577    cmp         byte ptr ds:[817995],0;gvar_00817995
>0061257E    je          0061258E
 00612580    lea         eax,[edi+esi*8-5D0]
 00612587    call        00608C60
>0061258C    jmp         006125A3
 0061258E    cmp         byte ptr ds:[817997],0;gvar_00817997
>00612595    je          006125A3
 00612597    lea         eax,[edi+esi*8-5D0]
 0061259E    call        00608B04
 006125A3    cmp         byte ptr ds:[817996],0;gvar_00817996
>006125AA    je          006125B8
 006125AC    lea         eax,[edi+esi*8-5D0]
 006125B3    call        0060913C
 006125B8    cmp         byte ptr ds:[817997],0;gvar_00817997
>006125BF    je          006125CD
 006125C1    lea         eax,[edi+esi*8-5D0]
 006125C8    call        0060911C
 006125CD    cmp         byte ptr [edi+esi*8-5B2],0
>006125D5    je          006125E0
 006125D7    mov         eax,ebx
 006125D9    call        00611D1C
>006125DE    jmp         006125E1
 006125E0    inc         ebx
 006125E1    cmp         ebx,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
>006125E7    jle         006124CA
 006125ED    cmp         byte ptr ds:[817995],0;gvar_00817995
>006125F4    je          006125FB
 006125F6    call        00611E3C
 006125FB    pop         edi
 006125FC    pop         esi
 006125FD    pop         ebx
 006125FE    ret
*}
end;

//00612600
procedure sub_00612600;
begin
{*
 00612600    push        ebx
 00612601    push        esi
 00612602    movzx       eax,byte ptr ds:[817994];gvar_00817994
 00612609    and         al,byte ptr ds:[81799A];gvar_0081799A
>0061260F    je          00612666
 00612611    mov         esi,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 00612617    test        esi,esi
>00612619    jle         0061265F
 0061261B    mov         ebx,8179A0;gvar_0078D490
 00612620    cmp         dword ptr [ebx],0
>00612623    je          0061264B
 00612625    mov         eax,ebx
 00612627    call        006092B0
 0061262C    push        0
 0061262E    push        0
 00612630    mov         eax,dword ptr [ebx]
 00612632    call        005DF390
 00612637    mov         edx,ebx
 00612639    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0061263E    mov         eax,dword ptr [eax]
 00612640    mov         eax,dword ptr [eax+580]
 00612646    call        TJvHidDeviceController.CheckIn
 0061264B    xor         eax,eax
 0061264D    mov         dword ptr [ebx],eax
 0061264F    mov         byte ptr ds:[81799A],0;gvar_0081799A
 00612656    add         ebx,5D0
 0061265C    dec         esi
>0061265D    jne         00612620
 0061265F    xor         eax,eax
 00612661    mov         [0081D6A0],eax;gvar_0081D6A0:Single
 00612666    pop         esi
 00612667    pop         ebx
 00612668    ret
*}
end;

//0061266C
{*function sub_0061266C:?;
begin
 0061266C    push        ebx
 0061266D    push        esi
 0061266E    push        edi
 0061266F    mov         bl,1
 00612671    movzx       eax,byte ptr ds:[817994];gvar_00817994
 00612678    and         al,byte ptr ds:[817997];gvar_00817997
>0061267E    je          0061272B
 00612684    mov         eax,[0078CB88];^gvar_0078BDC0
 00612689    mov         eax,dword ptr [eax]
 0061268B    mov         ecx,3C
 00612690    xor         edx,edx
 00612692    div         eax,ecx
 00612694    cmp         edx,3B
>00612697    jne         0061272B
 0061269D    mov         esi,dword ptr ds:[81D6A0];gvar_0081D6A0:Single
 006126A3    test        esi,esi
>006126A5    jle         0061272B
 006126AB    mov         edi,8179A0;gvar_0078D490
 006126B0    cmp         dword ptr [edi],0
>006126B3    je          00612722
 006126B5    cmp         byte ptr [edi+9C],2
>006126BC    jne         00612722
 006126BE    cmp         byte ptr [edi+9D],1
>006126C5    jne         00612722
 006126C7    fld         qword ptr [edi+280]
 006126CD    fcomp       dword ptr ds:[612734];0:Single
 006126D3    wait
 006126D4    fnstsw      al
 006126D6    sahf
>006126D7    jbe         00612722
 006126D9    call        00600EA0
 006126DE    fsub        qword ptr [edi+280]
 006126E4    fcomp       dword ptr ds:[612738];5:Single
 006126EA    wait
 006126EB    fnstsw      al
 006126ED    sahf
>006126EE    jb          00612722
 006126F0    mov         byte ptr [edi+9C],0
 006126F7    mov         byte ptr [edi+9D],0
 006126FE    lea         eax,[edi+288]
 00612704    xor         ecx,ecx
 00612706    mov         edx,98
 0061270B    call        @FillChar
 00612710    lea         eax,[edi+320]
 00612716    xor         ecx,ecx
 00612718    mov         edx,36
 0061271D    call        @FillChar
 00612722    add         edi,5D0
 00612728    dec         esi
>00612729    jne         006126B0
 0061272B    mov         eax,ebx
 0061272D    pop         edi
 0061272E    pop         esi
 0061272F    pop         ebx
 00612730    ret
end;*}

//0061273C
{*function sub_0061273C(?:UnicodeString):?;
begin
 0061273C    push        ebp
 0061273D    mov         ebp,esp
 0061273F    push        ecx
 00612740    push        ebx
 00612741    mov         dword ptr [ebp-4],eax
 00612744    mov         eax,dword ptr [ebp-4]
 00612747    call        @UStrAddRef
 0061274C    xor         eax,eax
 0061274E    push        ebp
 0061274F    push        61277F
 00612754    push        dword ptr fs:[eax]
 00612757    mov         dword ptr fs:[eax],esp
 0061275A    mov         edx,dword ptr [ebp-4]
 0061275D    mov         eax,[00817990];gvar_00817990:THashTable
 00612762    call        THashTable.Get
 00612767    mov         ebx,eax
 00612769    xor         eax,eax
 0061276B    pop         edx
 0061276C    pop         ecx
 0061276D    pop         ecx
 0061276E    mov         dword ptr fs:[eax],edx
 00612771    push        612786
 00612776    lea         eax,[ebp-4]
 00612779    call        @UStrClr
 0061277E    ret
>0061277F    jmp         @HandleFinally
>00612784    jmp         00612776
 00612786    mov         eax,ebx
 00612788    pop         ebx
 00612789    pop         ecx
 0061278A    pop         ebp
 0061278B    ret
end;*}

//0061278C
{*procedure sub_0061278C(?:Integer; ?:?);
begin
 0061278C    push        ebx
 0061278D    push        esi
 0061278E    mov         esi,edx
 00612790    mov         ebx,eax
 00612792    mov         ecx,esi
 00612794    mov         edx,ebx
 00612796    mov         eax,[00817990];gvar_00817990:THashTable
 0061279B    call        THashTable.Get
 006127A0    pop         esi
 006127A1    pop         ebx
 006127A2    ret
end;*}

//006127A4
{*function sub_006127A4:?;
begin
 006127A4    push        ebp
 006127A5    mov         ebp,esp
 006127A7    add         esp,0FFFFFFF8
 006127AA    push        ebx
 006127AB    xor         eax,eax
 006127AD    mov         dword ptr [ebp-4],eax
 006127B0    xor         eax,eax
 006127B2    push        ebp
 006127B3    push        61283C
 006127B8    push        dword ptr fs:[eax]
 006127BB    mov         dword ptr fs:[eax],esp
 006127BE    mov         dl,1
 006127C0    mov         eax,[0043C7BC];TStringList
 006127C5    call        TStringList.Create;TStringList.Create
 006127CA    mov         dword ptr [ebp-8],eax
 006127CD    mov         dl,1
 006127CF    mov         eax,dword ptr [ebp-8]
 006127D2    call        TStringList.SetSorted
 006127D7    xor         ebx,ebx
 006127D9    lea         edx,[ebp-4]
 006127DC    mov         eax,ebx
 006127DE    call        0061278C
 006127E3    cmp         dword ptr [ebp-4],0
>006127E7    je          0061281D
 006127E9    mov         edx,dword ptr [ebp-4]
 006127EC    mov         eax,612858;'.'
 006127F1    call        Pos
 006127F6    test        eax,eax
>006127F8    jle         00612812
 006127FA    mov         edx,dword ptr [ebp-4]
 006127FD    test        edx,edx
>006127FF    je          00612806
 00612801    sub         edx,4
 00612804    mov         edx,dword ptr [edx]
 00612806    lea         ecx,[ebp-4]
 00612809    inc         eax
 0061280A    xchg        eax,ecx
 0061280B    xchg        ecx,edx
 0061280D    call        @UStrDelete
 00612812    mov         edx,dword ptr [ebp-4]
 00612815    mov         eax,dword ptr [ebp-8]
 00612818    mov         ecx,dword ptr [eax]
 0061281A    call        dword ptr [ecx+38];TStringList.Add
 0061281D    inc         ebx
 0061281E    cmp         ebx,17D
>00612824    jne         006127D9
 00612826    xor         eax,eax
 00612828    pop         edx
 00612829    pop         ecx
 0061282A    pop         ecx
 0061282B    mov         dword ptr fs:[eax],edx
 0061282E    push        612843
 00612833    lea         eax,[ebp-4]
 00612836    call        @UStrClr
 0061283B    ret
>0061283C    jmp         @HandleFinally
>00612841    jmp         00612833
 00612843    mov         eax,dword ptr [ebp-8]
 00612846    pop         ebx
 00612847    pop         ecx
 00612848    pop         ecx
 00612849    pop         ebp
 0061284A    ret
end;*}

//0061285C
{*function sub_0061285C:?;
begin
 0061285C    push        ebx
 0061285D    mov         dl,1
 0061285F    mov         eax,[0043C7BC];TStringList
 00612864    call        TStringList.Create;TStringList.Create
 00612869    mov         ebx,eax
 0061286B    mov         edx,612AF8;'Nunchuk.JoyX'
 00612870    mov         eax,ebx
 00612872    mov         ecx,dword ptr [eax]
 00612874    call        dword ptr [ecx+38];TStringList.Add
 00612877    mov         edx,612B20;'Nunchuk.JoyY'
 0061287C    mov         eax,ebx
 0061287E    mov         ecx,dword ptr [eax]
 00612880    call        dword ptr [ecx+38];TStringList.Add
 00612883    mov         edx,612B48;'Nunchuk.CButton'
 00612888    mov         eax,ebx
 0061288A    mov         ecx,dword ptr [eax]
 0061288C    call        dword ptr [ecx+38];TStringList.Add
 0061288F    mov         edx,612B74;'Nunchuk.ZButton'
 00612894    mov         eax,ebx
 00612896    mov         ecx,dword ptr [eax]
 00612898    call        dword ptr [ecx+38];TStringList.Add
 0061289B    mov         edx,612BA0;'Nunchuk.RawForceX'
 006128A0    mov         eax,ebx
 006128A2    mov         ecx,dword ptr [eax]
 006128A4    call        dword ptr [ecx+38];TStringList.Add
 006128A7    mov         edx,612BD0;'Nunchuk.RawForceY'
 006128AC    mov         eax,ebx
 006128AE    mov         ecx,dword ptr [eax]
 006128B0    call        dword ptr [ecx+38];TStringList.Add
 006128B3    mov         edx,612C00;'Nunchuk.RawForceZ'
 006128B8    mov         eax,ebx
 006128BA    mov         ecx,dword ptr [eax]
 006128BC    call        dword ptr [ecx+38];TStringList.Add
 006128BF    mov         edx,612C30;'Pitch'
 006128C4    mov         eax,ebx
 006128C6    mov         ecx,dword ptr [eax]
 006128C8    call        dword ptr [ecx+38];TStringList.Add
 006128CB    mov         edx,612C48;'Roll'
 006128D0    mov         eax,ebx
 006128D2    mov         ecx,dword ptr [eax]
 006128D4    call        dword ptr [ecx+38];TStringList.Add
 006128D7    mov         edx,612C60;'RelAccX'
 006128DC    mov         eax,ebx
 006128DE    mov         ecx,dword ptr [eax]
 006128E0    call        dword ptr [ecx+38];TStringList.Add
 006128E3    mov         edx,612C7C;'RelAccY'
 006128E8    mov         eax,ebx
 006128EA    mov         ecx,dword ptr [eax]
 006128EC    call        dword ptr [ecx+38];TStringList.Add
 006128EF    mov         edx,612C98;'RelAccZ'
 006128F4    mov         eax,ebx
 006128F6    mov         ecx,dword ptr [eax]
 006128F8    call        dword ptr [ecx+38];TStringList.Add
 006128FB    mov         edx,612CB4;'A'
 00612900    mov         eax,ebx
 00612902    mov         ecx,dword ptr [eax]
 00612904    call        dword ptr [ecx+38];TStringList.Add
 00612907    mov         edx,612CC4;'B'
 0061290C    mov         eax,ebx
 0061290E    mov         ecx,dword ptr [eax]
 00612910    call        dword ptr [ecx+38];TStringList.Add
 00612913    mov         edx,612CD4;'One'
 00612918    mov         eax,ebx
 0061291A    mov         ecx,dword ptr [eax]
 0061291C    call        dword ptr [ecx+38];TStringList.Add
 0061291F    mov         edx,612CE8;'Two'
 00612924    mov         eax,ebx
 00612926    mov         ecx,dword ptr [eax]
 00612928    call        dword ptr [ecx+38];TStringList.Add
 0061292B    mov         edx,612CFC;'Plus'
 00612930    mov         eax,ebx
 00612932    mov         ecx,dword ptr [eax]
 00612934    call        dword ptr [ecx+38];TStringList.Add
 00612937    mov         edx,612D14;'Minus'
 0061293C    mov         eax,ebx
 0061293E    mov         ecx,dword ptr [eax]
 00612940    call        dword ptr [ecx+38];TStringList.Add
 00612943    mov         edx,612D2C;'Home'
 00612948    mov         eax,ebx
 0061294A    mov         ecx,dword ptr [eax]
 0061294C    call        dword ptr [ecx+38];TStringList.Add
 0061294F    mov         edx,612D44;'Up'
 00612954    mov         eax,ebx
 00612956    mov         ecx,dword ptr [eax]
 00612958    call        dword ptr [ecx+38];TStringList.Add
 0061295B    mov         edx,612D58;'Down'
 00612960    mov         eax,ebx
 00612962    mov         ecx,dword ptr [eax]
 00612964    call        dword ptr [ecx+38];TStringList.Add
 00612967    mov         edx,612D70;'Left'
 0061296C    mov         eax,ebx
 0061296E    mov         ecx,dword ptr [eax]
 00612970    call        dword ptr [ecx+38];TStringList.Add
 00612973    mov         edx,612D88;'Right'
 00612978    mov         eax,ebx
 0061297A    mov         ecx,dword ptr [eax]
 0061297C    call        dword ptr [ecx+38];TStringList.Add
 0061297F    mov         edx,612DA0;'dot1x'
 00612984    mov         eax,ebx
 00612986    mov         ecx,dword ptr [eax]
 00612988    call        dword ptr [ecx+38];TStringList.Add
 0061298B    mov         edx,612DB8;'dot1y'
 00612990    mov         eax,ebx
 00612992    mov         ecx,dword ptr [eax]
 00612994    call        dword ptr [ecx+38];TStringList.Add
 00612997    mov         edx,612DD0;'dot1size'
 0061299C    mov         eax,ebx
 0061299E    mov         ecx,dword ptr [eax]
 006129A0    call        dword ptr [ecx+38];TStringList.Add
 006129A3    mov         edx,612DF0;'dot1vis'
 006129A8    mov         eax,ebx
 006129AA    mov         ecx,dword ptr [eax]
 006129AC    call        dword ptr [ecx+38];TStringList.Add
 006129AF    mov         edx,612E0C;'dot2x'
 006129B4    mov         eax,ebx
 006129B6    mov         ecx,dword ptr [eax]
 006129B8    call        dword ptr [ecx+38];TStringList.Add
 006129BB    mov         edx,612E24;'dot2y'
 006129C0    mov         eax,ebx
 006129C2    mov         ecx,dword ptr [eax]
 006129C4    call        dword ptr [ecx+38];TStringList.Add
 006129C7    mov         edx,612E3C;'dot2size'
 006129CC    mov         eax,ebx
 006129CE    mov         ecx,dword ptr [eax]
 006129D0    call        dword ptr [ecx+38];TStringList.Add
 006129D3    mov         edx,612E5C;'dot2vis'
 006129D8    mov         eax,ebx
 006129DA    mov         ecx,dword ptr [eax]
 006129DC    call        dword ptr [ecx+38];TStringList.Add
 006129DF    mov         edx,612E78;'gx'
 006129E4    mov         eax,ebx
 006129E6    mov         ecx,dword ptr [eax]
 006129E8    call        dword ptr [ecx+38];TStringList.Add
 006129EB    mov         edx,612E8C;'gy'
 006129F0    mov         eax,ebx
 006129F2    mov         ecx,dword ptr [eax]
 006129F4    call        dword ptr [ecx+38];TStringList.Add
 006129F7    mov         edx,612EA0;'gz'
 006129FC    mov         eax,ebx
 006129FE    mov         ecx,dword ptr [eax]
 00612A00    call        dword ptr [ecx+38];TStringList.Add
 00612A03    mov         edx,612EB4;'Classic.Joy1X'
 00612A08    mov         eax,ebx
 00612A0A    mov         ecx,dword ptr [eax]
 00612A0C    call        dword ptr [ecx+38];TStringList.Add
 00612A0F    mov         edx,612EDC;'Classic.Joy1Y'
 00612A14    mov         eax,ebx
 00612A16    mov         ecx,dword ptr [eax]
 00612A18    call        dword ptr [ecx+38];TStringList.Add
 00612A1B    mov         edx,612F04;'Classic.Joy2X'
 00612A20    mov         eax,ebx
 00612A22    mov         ecx,dword ptr [eax]
 00612A24    call        dword ptr [ecx+38];TStringList.Add
 00612A27    mov         edx,612F2C;'Classic.Joy2Y'
 00612A2C    mov         eax,ebx
 00612A2E    mov         ecx,dword ptr [eax]
 00612A30    call        dword ptr [ecx+38];TStringList.Add
 00612A33    mov         edx,612F54;'Classic.Up'
 00612A38    mov         eax,ebx
 00612A3A    mov         ecx,dword ptr [eax]
 00612A3C    call        dword ptr [ecx+38];TStringList.Add
 00612A3F    mov         edx,612F78;'Classic.Down'
 00612A44    mov         eax,ebx
 00612A46    mov         ecx,dword ptr [eax]
 00612A48    call        dword ptr [ecx+38];TStringList.Add
 00612A4B    mov         edx,612FA0;'Classic.Left'
 00612A50    mov         eax,ebx
 00612A52    mov         ecx,dword ptr [eax]
 00612A54    call        dword ptr [ecx+38];TStringList.Add
 00612A57    mov         edx,612FC8;'Classic.Right'
 00612A5C    mov         eax,ebx
 00612A5E    mov         ecx,dword ptr [eax]
 00612A60    call        dword ptr [ecx+38];TStringList.Add
 00612A63    mov         edx,612FF0;'Classic.a'
 00612A68    mov         eax,ebx
 00612A6A    mov         ecx,dword ptr [eax]
 00612A6C    call        dword ptr [ecx+38];TStringList.Add
 00612A6F    mov         edx,613010;'Classic.b'
 00612A74    mov         eax,ebx
 00612A76    mov         ecx,dword ptr [eax]
 00612A78    call        dword ptr [ecx+38];TStringList.Add
 00612A7B    mov         edx,613030;'Classic.x'
 00612A80    mov         eax,ebx
 00612A82    mov         ecx,dword ptr [eax]
 00612A84    call        dword ptr [ecx+38];TStringList.Add
 00612A87    mov         edx,613050;'Classic.y'
 00612A8C    mov         eax,ebx
 00612A8E    mov         ecx,dword ptr [eax]
 00612A90    call        dword ptr [ecx+38];TStringList.Add
 00612A93    mov         edx,613070;'Classic.L'
 00612A98    mov         eax,ebx
 00612A9A    mov         ecx,dword ptr [eax]
 00612A9C    call        dword ptr [ecx+38];TStringList.Add
 00612A9F    mov         edx,613090;'Classic.R'
 00612AA4    mov         eax,ebx
 00612AA6    mov         ecx,dword ptr [eax]
 00612AA8    call        dword ptr [ecx+38];TStringList.Add
 00612AAB    mov         edx,6130B0;'Classic.ZL'
 00612AB0    mov         eax,ebx
 00612AB2    mov         ecx,dword ptr [eax]
 00612AB4    call        dword ptr [ecx+38];TStringList.Add
 00612AB7    mov         edx,6130D4;'Classic.ZR'
 00612ABC    mov         eax,ebx
 00612ABE    mov         ecx,dword ptr [eax]
 00612AC0    call        dword ptr [ecx+38];TStringList.Add
 00612AC3    mov         edx,6130F8;'Classic.Minus'
 00612AC8    mov         eax,ebx
 00612ACA    mov         ecx,dword ptr [eax]
 00612ACC    call        dword ptr [ecx+38];TStringList.Add
 00612ACF    mov         edx,613120;'Classic.Home'
 00612AD4    mov         eax,ebx
 00612AD6    mov         ecx,dword ptr [eax]
 00612AD8    call        dword ptr [ecx+38];TStringList.Add
 00612ADB    mov         edx,613148;'Classic.Plus'
 00612AE0    mov         eax,ebx
 00612AE2    mov         ecx,dword ptr [eax]
 00612AE4    call        dword ptr [ecx+38];TStringList.Add
 00612AE7    mov         eax,ebx
 00612AE9    pop         ebx
 00612AEA    ret
end;*}

//00613164
{*function sub_00613164:?;
begin
 00613164    push        ebx
 00613165    mov         dl,1
 00613167    mov         eax,[0043C7BC];TStringList
 0061316C    call        TStringList.Create;TStringList.Create
 00613171    mov         ebx,eax
 00613173    mov         dl,1
 00613175    mov         eax,ebx
 00613177    call        TStringList.SetSorted
 0061317C    mov         edx,613288;'Exists'
 00613181    mov         eax,ebx
 00613183    mov         ecx,dword ptr [eax]
 00613185    call        dword ptr [ecx+38];TStringList.Add
 00613188    mov         edx,6132A4;'JoyX'
 0061318D    mov         eax,ebx
 0061318F    mov         ecx,dword ptr [eax]
 00613191    call        dword ptr [ecx+38];TStringList.Add
 00613194    mov         edx,6132BC;'JoyY'
 00613199    mov         eax,ebx
 0061319B    mov         ecx,dword ptr [eax]
 0061319D    call        dword ptr [ecx+38];TStringList.Add
 006131A0    mov         edx,6132D4;'Joy'
 006131A5    mov         eax,ebx
 006131A7    mov         ecx,dword ptr [eax]
 006131A9    call        dword ptr [ecx+38];TStringList.Add
 006131AC    mov         edx,6132E8;'CButton'
 006131B1    mov         eax,ebx
 006131B3    mov         ecx,dword ptr [eax]
 006131B5    call        dword ptr [ecx+38];TStringList.Add
 006131B8    mov         edx,613304;'ZButton'
 006131BD    mov         eax,ebx
 006131BF    mov         ecx,dword ptr [eax]
 006131C1    call        dword ptr [ecx+38];TStringList.Add
 006131C4    mov         edx,613320;'Pitch'
 006131C9    mov         eax,ebx
 006131CB    mov         ecx,dword ptr [eax]
 006131CD    call        dword ptr [ecx+38];TStringList.Add
 006131D0    mov         edx,613338;'Roll'
 006131D5    mov         eax,ebx
 006131D7    mov         ecx,dword ptr [eax]
 006131D9    call        dword ptr [ecx+38];TStringList.Add
 006131DC    mov         edx,613350;'SmoothPitch'
 006131E1    mov         eax,ebx
 006131E3    mov         ecx,dword ptr [eax]
 006131E5    call        dword ptr [ecx+38];TStringList.Add
 006131E8    mov         edx,613374;'SmoothRoll'
 006131ED    mov         eax,ebx
 006131EF    mov         ecx,dword ptr [eax]
 006131F1    call        dword ptr [ecx+38];TStringList.Add
 006131F4    mov         edx,613398;'gx'
 006131F9    mov         eax,ebx
 006131FB    mov         ecx,dword ptr [eax]
 006131FD    call        dword ptr [ecx+38];TStringList.Add
 00613200    mov         edx,6133AC;'gy'
 00613205    mov         eax,ebx
 00613207    mov         ecx,dword ptr [eax]
 00613209    call        dword ptr [ecx+38];TStringList.Add
 0061320C    mov         edx,6133C0;'gz'
 00613211    mov         eax,ebx
 00613213    mov         ecx,dword ptr [eax]
 00613215    call        dword ptr [ecx+38];TStringList.Add
 00613218    mov         edx,6133D4;'RawAccX'
 0061321D    mov         eax,ebx
 0061321F    mov         ecx,dword ptr [eax]
 00613221    call        dword ptr [ecx+38];TStringList.Add
 00613224    mov         edx,6133F0;'RawAccY'
 00613229    mov         eax,ebx
 0061322B    mov         ecx,dword ptr [eax]
 0061322D    call        dword ptr [ecx+38];TStringList.Add
 00613230    mov         edx,61340C;'RawAccZ'
 00613235    mov         eax,ebx
 00613237    mov         ecx,dword ptr [eax]
 00613239    call        dword ptr [ecx+38];TStringList.Add
 0061323C    mov         edx,613428;'RawAcc'
 00613241    mov         eax,ebx
 00613243    mov         ecx,dword ptr [eax]
 00613245    call        dword ptr [ecx+38];TStringList.Add
 00613248    mov         edx,613444;'RelAccX'
 0061324D    mov         eax,ebx
 0061324F    mov         ecx,dword ptr [eax]
 00613251    call        dword ptr [ecx+38];TStringList.Add
 00613254    mov         edx,613460;'RelAccY'
 00613259    mov         eax,ebx
 0061325B    mov         ecx,dword ptr [eax]
 0061325D    call        dword ptr [ecx+38];TStringList.Add
 00613260    mov         edx,61347C;'RelAccZ'
 00613265    mov         eax,ebx
 00613267    mov         ecx,dword ptr [eax]
 00613269    call        dword ptr [ecx+38];TStringList.Add
 0061326C    mov         edx,613498;'RelAcc'
 00613271    mov         eax,ebx
 00613273    mov         ecx,dword ptr [eax]
 00613275    call        dword ptr [ecx+38];TStringList.Add
 00613278    mov         eax,ebx
 0061327A    pop         ebx
 0061327B    ret
end;*}

//006134A8
{*function sub_006134A8:?;
begin
 006134A8    push        ebx
 006134A9    mov         dl,1
 006134AB    mov         eax,[0043C7BC];TStringList
 006134B0    call        TStringList.Create;TStringList.Create
 006134B5    mov         ebx,eax
 006134B7    mov         dl,1
 006134B9    mov         eax,ebx
 006134BB    call        TStringList.SetSorted
 006134C0    mov         edx,613614;'Joy1'
 006134C5    mov         eax,ebx
 006134C7    mov         ecx,dword ptr [eax]
 006134C9    call        dword ptr [ecx+38];TStringList.Add
 006134CC    mov         edx,61362C;'Joy1X'
 006134D1    mov         eax,ebx
 006134D3    mov         ecx,dword ptr [eax]
 006134D5    call        dword ptr [ecx+38];TStringList.Add
 006134D8    mov         edx,613644;'Joy1Y'
 006134DD    mov         eax,ebx
 006134DF    mov         ecx,dword ptr [eax]
 006134E1    call        dword ptr [ecx+38];TStringList.Add
 006134E4    mov         edx,61365C;'Joy2'
 006134E9    mov         eax,ebx
 006134EB    mov         ecx,dword ptr [eax]
 006134ED    call        dword ptr [ecx+38];TStringList.Add
 006134F0    mov         edx,613674;'Joy2X'
 006134F5    mov         eax,ebx
 006134F7    mov         ecx,dword ptr [eax]
 006134F9    call        dword ptr [ecx+38];TStringList.Add
 006134FC    mov         edx,61368C;'Joy2Y'
 00613501    mov         eax,ebx
 00613503    mov         ecx,dword ptr [eax]
 00613505    call        dword ptr [ecx+38];TStringList.Add
 00613508    mov         edx,6136A4;'L'
 0061350D    mov         eax,ebx
 0061350F    mov         ecx,dword ptr [eax]
 00613511    call        dword ptr [ecx+38];TStringList.Add
 00613514    mov         edx,6136B4;'R'
 00613519    mov         eax,ebx
 0061351B    mov         ecx,dword ptr [eax]
 0061351D    call        dword ptr [ecx+38];TStringList.Add
 00613520    mov         edx,6136C4;'DPad'
 00613525    mov         eax,ebx
 00613527    mov         ecx,dword ptr [eax]
 00613529    call        dword ptr [ecx+38];TStringList.Add
 0061352C    mov         edx,6136DC;'Up'
 00613531    mov         eax,ebx
 00613533    mov         ecx,dword ptr [eax]
 00613535    call        dword ptr [ecx+38];TStringList.Add
 00613538    mov         edx,6136F0;'Left'
 0061353D    mov         eax,ebx
 0061353F    mov         ecx,dword ptr [eax]
 00613541    call        dword ptr [ecx+38];TStringList.Add
 00613544    mov         edx,613708;'ZR'
 00613549    mov         eax,ebx
 0061354B    mov         ecx,dword ptr [eax]
 0061354D    call        dword ptr [ecx+38];TStringList.Add
 00613550    mov         edx,61371C;'x'
 00613555    mov         eax,ebx
 00613557    mov         ecx,dword ptr [eax]
 00613559    call        dword ptr [ecx+38];TStringList.Add
 0061355C    mov         edx,61372C;'a'
 00613561    mov         eax,ebx
 00613563    mov         ecx,dword ptr [eax]
 00613565    call        dword ptr [ecx+38];TStringList.Add
 00613568    mov         edx,61373C;'y'
 0061356D    mov         eax,ebx
 0061356F    mov         ecx,dword ptr [eax]
 00613571    call        dword ptr [ecx+38];TStringList.Add
 00613574    mov         edx,61374C;'b'
 00613579    mov         eax,ebx
 0061357B    mov         ecx,dword ptr [eax]
 0061357D    call        dword ptr [ecx+38];TStringList.Add
 00613580    mov         edx,61375C;'ZL'
 00613585    mov         eax,ebx
 00613587    mov         ecx,dword ptr [eax]
 00613589    call        dword ptr [ecx+38];TStringList.Add
 0061358C    mov         edx,613770;'RFull'
 00613591    mov         eax,ebx
 00613593    mov         ecx,dword ptr [eax]
 00613595    call        dword ptr [ecx+38];TStringList.Add
 00613598    mov         edx,613788;'Plus'
 0061359D    mov         eax,ebx
 0061359F    mov         ecx,dword ptr [eax]
 006135A1    call        dword ptr [ecx+38];TStringList.Add
 006135A4    mov         edx,6137A0;'Start'
 006135A9    mov         eax,ebx
 006135AB    mov         ecx,dword ptr [eax]
 006135AD    call        dword ptr [ecx+38];TStringList.Add
 006135B0    mov         edx,6137B8;'Home'
 006135B5    mov         eax,ebx
 006135B7    mov         ecx,dword ptr [eax]
 006135B9    call        dword ptr [ecx+38];TStringList.Add
 006135BC    mov         edx,6137D0;'Minus'
 006135C1    mov         eax,ebx
 006135C3    mov         ecx,dword ptr [eax]
 006135C5    call        dword ptr [ecx+38];TStringList.Add
 006135C8    mov         edx,6137E8;'Select'
 006135CD    mov         eax,ebx
 006135CF    mov         ecx,dword ptr [eax]
 006135D1    call        dword ptr [ecx+38];TStringList.Add
 006135D4    mov         edx,613804;'LFull'
 006135D9    mov         eax,ebx
 006135DB    mov         ecx,dword ptr [eax]
 006135DD    call        dword ptr [ecx+38];TStringList.Add
 006135E0    mov         edx,61381C;'Down'
 006135E5    mov         eax,ebx
 006135E7    mov         ecx,dword ptr [eax]
 006135E9    call        dword ptr [ecx+38];TStringList.Add
 006135EC    mov         edx,613834;'Right'
 006135F1    mov         eax,ebx
 006135F3    mov         ecx,dword ptr [eax]
 006135F5    call        dword ptr [ecx+38];TStringList.Add
 006135F8    mov         edx,61384C;'Exists'
 006135FD    mov         eax,ebx
 006135FF    mov         ecx,dword ptr [eax]
 00613601    call        dword ptr [ecx+38];TStringList.Add
 00613604    mov         eax,ebx
 00613606    pop         ebx
 00613607    ret
end;*}

//0061385C
{*function sub_0061385C:?;
begin
 0061385C    push        ebx
 0061385D    mov         dl,1
 0061385F    mov         eax,[0043C7BC];TStringList
 00613864    call        TStringList.Create;TStringList.Create
 00613869    mov         ebx,eax
 0061386B    mov         dl,1
 0061386D    mov         eax,ebx
 0061386F    call        TStringList.SetSorted
 00613874    mov         edx,613980;'StrumUp'
 00613879    mov         eax,ebx
 0061387B    mov         ecx,dword ptr [eax]
 0061387D    call        dword ptr [ecx+38];TStringList.Add
 00613880    mov         edx,61399C;'StrumDown'
 00613885    mov         eax,ebx
 00613887    mov         ecx,dword ptr [eax]
 00613889    call        dword ptr [ecx+38];TStringList.Add
 0061388C    mov         edx,6139BC;'Joy'
 00613891    mov         eax,ebx
 00613893    mov         ecx,dword ptr [eax]
 00613895    call        dword ptr [ecx+38];TStringList.Add
 00613898    mov         edx,6139D0;'JoyX'
 0061389D    mov         eax,ebx
 0061389F    mov         ecx,dword ptr [eax]
 006138A1    call        dword ptr [ecx+38];TStringList.Add
 006138A4    mov         edx,6139E8;'JoyY'
 006138A9    mov         eax,ebx
 006138AB    mov         ecx,dword ptr [eax]
 006138AD    call        dword ptr [ecx+38];TStringList.Add
 006138B0    mov         edx,613A00;'Plus'
 006138B5    mov         eax,ebx
 006138B7    mov         ecx,dword ptr [eax]
 006138B9    call        dword ptr [ecx+38];TStringList.Add
 006138BC    mov         edx,613A18;'Start'
 006138C1    mov         eax,ebx
 006138C3    mov         ecx,dword ptr [eax]
 006138C5    call        dword ptr [ecx+38];TStringList.Add
 006138C8    mov         edx,613A30;'Minus'
 006138CD    mov         eax,ebx
 006138CF    mov         ecx,dword ptr [eax]
 006138D1    call        dword ptr [ecx+38];TStringList.Add
 006138D4    mov         edx,613A48;'Select'
 006138D9    mov         eax,ebx
 006138DB    mov         ecx,dword ptr [eax]
 006138DD    call        dword ptr [ecx+38];TStringList.Add
 006138E0    mov         edx,613A64;'Fret1'
 006138E5    mov         eax,ebx
 006138E7    mov         ecx,dword ptr [eax]
 006138E9    call        dword ptr [ecx+38];TStringList.Add
 006138EC    mov         edx,613A7C;'Fret2'
 006138F1    mov         eax,ebx
 006138F3    mov         ecx,dword ptr [eax]
 006138F5    call        dword ptr [ecx+38];TStringList.Add
 006138F8    mov         edx,613A94;'Fret3'
 006138FD    mov         eax,ebx
 006138FF    mov         ecx,dword ptr [eax]
 00613901    call        dword ptr [ecx+38];TStringList.Add
 00613904    mov         edx,613AAC;'Fret4'
 00613909    mov         eax,ebx
 0061390B    mov         ecx,dword ptr [eax]
 0061390D    call        dword ptr [ecx+38];TStringList.Add
 00613910    mov         edx,613AC4;'Fret5'
 00613915    mov         eax,ebx
 00613917    mov         ecx,dword ptr [eax]
 00613919    call        dword ptr [ecx+38];TStringList.Add
 0061391C    mov         edx,613ADC;'Green'
 00613921    mov         eax,ebx
 00613923    mov         ecx,dword ptr [eax]
 00613925    call        dword ptr [ecx+38];TStringList.Add
 00613928    mov         edx,613AF4;'Red'
 0061392D    mov         eax,ebx
 0061392F    mov         ecx,dword ptr [eax]
 00613931    call        dword ptr [ecx+38];TStringList.Add
 00613934    mov         edx,613B08;'Yellow'
 00613939    mov         eax,ebx
 0061393B    mov         ecx,dword ptr [eax]
 0061393D    call        dword ptr [ecx+38];TStringList.Add
 00613940    mov         edx,613B24;'Blue'
 00613945    mov         eax,ebx
 00613947    mov         ecx,dword ptr [eax]
 00613949    call        dword ptr [ecx+38];TStringList.Add
 0061394C    mov         edx,613B3C;'Orange'
 00613951    mov         eax,ebx
 00613953    mov         ecx,dword ptr [eax]
 00613955    call        dword ptr [ecx+38];TStringList.Add
 00613958    mov         edx,613B58;'WhammyBar'
 0061395D    mov         eax,ebx
 0061395F    mov         ecx,dword ptr [eax]
 00613961    call        dword ptr [ecx+38];TStringList.Add
 00613964    mov         edx,613B78;'Exists'
 00613969    mov         eax,ebx
 0061396B    mov         ecx,dword ptr [eax]
 0061396D    call        dword ptr [ecx+38];TStringList.Add
 00613970    mov         eax,ebx
 00613972    pop         ebx
 00613973    ret
end;*}

//00613B88
{*function sub_00613B88(?:?):?;
begin
 00613B88    push        ebp
 00613B89    mov         ebp,esp
 00613B8B    push        ecx
 00613B8C    push        ebx
 00613B8D    mov         dword ptr [ebp-4],eax
 00613B90    mov         eax,dword ptr [ebp-4]
 00613B93    call        @UStrAddRef
 00613B98    xor         eax,eax
 00613B9A    push        ebp
 00613B9B    push        613C34
 00613BA0    push        dword ptr fs:[eax]
 00613BA3    mov         dword ptr fs:[eax],esp
 00613BA6    lea         eax,[ebp-4]
 00613BA9    mov         edx,613C50;'WiimoteOld'
 00613BAE    call        004F9BD0
 00613BB3    test        al,al
>00613BB5    jne         00613BFF
 00613BB7    lea         eax,[ebp-4]
 00613BBA    mov         edx,613C74;'WiiRemoteOld'
 00613BBF    call        004F9BD0
 00613BC4    test        al,al
>00613BC6    jne         00613BFF
 00613BC8    lea         eax,[ebp-4]
 00613BCB    mov         edx,613C9C;'NunchukOld'
 00613BD0    call        004F9BD0
 00613BD5    test        al,al
>00613BD7    jne         00613BFF
 00613BD9    lea         eax,[ebp-4]
 00613BDC    mov         edx,613CC0;'ClassicOld'
 00613BE1    call        004F9BD0
 00613BE6    test        al,al
>00613BE8    jne         00613BFF
 00613BEA    lea         eax,[ebp-4]
 00613BED    mov         edx,613CE4;'WiiGuitarOld'
 00613BF2    call        004F9BD0
 00613BF7    test        al,al
>00613BF9    jne         00613BFF
 00613BFB    xor         ebx,ebx
>00613BFD    jmp         00613C1E
 00613BFF    lea         eax,[ebp-4]
 00613C02    call        004F9D00
 00613C07    lea         eax,[ebp-4]
 00613C0A    mov         edx,613D0C;'.'
 00613C0F    call        004F9BD0
 00613C14    test        al,al
>00613C16    jne         00613C1C
 00613C18    xor         ebx,ebx
>00613C1A    jmp         00613C1E
 00613C1C    mov         bl,1
 00613C1E    xor         eax,eax
 00613C20    pop         edx
 00613C21    pop         ecx
 00613C22    pop         ecx
 00613C23    mov         dword ptr fs:[eax],edx
 00613C26    push        613C3B
 00613C2B    lea         eax,[ebp-4]
 00613C2E    call        @UStrClr
 00613C33    ret
>00613C34    jmp         @HandleFinally
>00613C39    jmp         00613C2B
 00613C3B    mov         eax,ebx
 00613C3D    pop         ebx
 00613C3E    pop         ecx
 00613C3F    pop         ebp
 00613C40    ret
end;*}

//00613D10
procedure sub_00613D10;
begin
{*
 00613D10    push        ebp
 00613D11    mov         ebp,esp
 00613D13    push        ebx
 00613D14    push        esi
 00613D15    push        edi
 00613D16    xor         eax,eax
 00613D18    push        ebp
 00613D19    push        613D73
 00613D1E    push        dword ptr fs:[eax]
 00613D21    mov         dword ptr fs:[eax],esp
 00613D24    push        613D90;'HID.dll'
 00613D29    call        kernel32.LoadLibraryW
 00613D2E    mov         ebx,eax
 00613D30    call        005FCD64
 00613D35    test        al,al
>00613D37    je          00613D5B
 00613D39    push        613DA0;'HidD_SetOutputReport'
 00613D3E    push        ebx
 00613D3F    call        GetProcAddress
 00613D44    mov         [0078BD30],eax;gvar_0078BD30:Pointer
 00613D49    push        613DCC;'HidD_GetInputReport'
 00613D4E    push        ebx
 00613D4F    call        GetProcAddress
 00613D54    mov         [0078BD34],eax;gvar_0078BD34:Pointer
>00613D59    jmp         00613D69
 00613D5B    xor         eax,eax
 00613D5D    mov         [0078BD30],eax;gvar_0078BD30:Pointer
 00613D62    xor         eax,eax
 00613D64    mov         [0078BD34],eax;gvar_0078BD34:Pointer
 00613D69    xor         eax,eax
 00613D6B    pop         edx
 00613D6C    pop         ecx
 00613D6D    pop         ecx
 00613D6E    mov         dword ptr fs:[eax],edx
>00613D71    jmp         00613D8B
>00613D73    jmp         @HandleAnyException
 00613D78    xor         eax,eax
 00613D7A    mov         [0078BD30],eax;gvar_0078BD30:Pointer
 00613D7F    xor         eax,eax
 00613D81    mov         [0078BD34],eax;gvar_0078BD34:Pointer
 00613D86    call        @DoneExcept
 00613D8B    pop         edi
 00613D8C    pop         esi
 00613D8D    pop         ebx
 00613D8E    pop         ebp
 00613D8F    ret
*}
end;

//00613DF4
{*procedure sub_00613DF4(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00613DF4    push        ebp
 00613DF5    mov         ebp,esp
 00613DF7    add         esp,0FFFFFFC0
 00613DFA    push        ebx
 00613DFB    mov         ebx,eax
 00613DFD    mov         eax,dword ptr [ebp+20]
 00613E00    mov         dword ptr [ebx+38],eax
 00613E03    mov         eax,dword ptr [ebp+24]
 00613E06    mov         dword ptr [ebx+3C],eax
 00613E09    mov         eax,dword ptr [ebp+18]
 00613E0C    mov         dword ptr [ebx+40],eax
 00613E0F    mov         eax,dword ptr [ebp+1C]
 00613E12    mov         dword ptr [ebx+44],eax
 00613E15    mov         eax,dword ptr [ebp+10]
 00613E18    mov         dword ptr [ebx+48],eax
 00613E1B    mov         eax,dword ptr [ebp+14]
 00613E1E    mov         dword ptr [ebx+4C],eax
 00613E21    fld         qword ptr [ebx+68]
 00613E24    fadd        qword ptr [ebx+80]
 00613E2A    fdiv        dword ptr ds:[614060];2:Single
 00613E30    fstp        qword ptr [ebp-8]
 00613E33    wait
 00613E34    fld         qword ptr [ebx+50]
 00613E37    fsub        qword ptr [ebp-8]
 00613E3A    fstp        qword ptr [ebp-18]
 00613E3D    wait
 00613E3E    fld         qword ptr [ebp-18]
 00613E41    fcomp       dword ptr ds:[614064];0:Single
 00613E47    wait
 00613E48    fnstsw      al
 00613E4A    sahf
>00613E4B    je          00613E5A
 00613E4D    fld         qword ptr [ebx+38]
 00613E50    fsub        qword ptr [ebp-8]
 00613E53    fdiv        qword ptr [ebp-18]
 00613E56    fstp        qword ptr [ebp-18]
 00613E59    wait
 00613E5A    mov         eax,dword ptr [ebp-18]
 00613E5D    mov         dword ptr [ebx+0F0],eax
 00613E63    mov         eax,dword ptr [ebp-14]
 00613E66    mov         dword ptr [ebx+0F4],eax
 00613E6C    fld         tbyte ptr ds:[614068];9.8:Extended
 00613E72    fmul        qword ptr [ebp-18]
 00613E75    fstp        qword ptr [ebp-18]
 00613E78    wait
 00613E79    fld         qword ptr [ebx+58]
 00613E7C    fadd        qword ptr [ebx+88]
 00613E82    fdiv        dword ptr ds:[614060];2:Single
 00613E88    fstp        qword ptr [ebp-8]
 00613E8B    wait
 00613E8C    fld         qword ptr [ebx+70]
 00613E8F    fsub        qword ptr [ebp-8]
 00613E92    fstp        qword ptr [ebp-20]
 00613E95    wait
 00613E96    fld         qword ptr [ebp-20]
 00613E99    fcomp       dword ptr ds:[614064];0:Single
 00613E9F    wait
 00613EA0    fnstsw      al
 00613EA2    sahf
>00613EA3    je          00613EB2
 00613EA5    fld         qword ptr [ebx+40]
 00613EA8    fsub        qword ptr [ebp-8]
 00613EAB    fdiv        qword ptr [ebp-20]
 00613EAE    fstp        qword ptr [ebp-20]
 00613EB1    wait
 00613EB2    mov         eax,dword ptr [ebp-20]
 00613EB5    mov         dword ptr [ebx+0F8],eax
 00613EBB    mov         eax,dword ptr [ebp-1C]
 00613EBE    mov         dword ptr [ebx+0FC],eax
 00613EC4    fld         tbyte ptr ds:[614068];9.8:Extended
 00613ECA    fmul        qword ptr [ebp-20]
 00613ECD    fstp        qword ptr [ebp-20]
 00613ED0    wait
 00613ED1    fld         qword ptr [ebx+60]
 00613ED4    fadd        qword ptr [ebx+78]
 00613ED7    fdiv        dword ptr ds:[614060];2:Single
 00613EDD    fstp        qword ptr [ebp-8]
 00613EE0    wait
 00613EE1    fld         qword ptr [ebx+90]
 00613EE7    fsub        qword ptr [ebp-8]
 00613EEA    fstp        qword ptr [ebp-28]
 00613EED    wait
 00613EEE    fld         qword ptr [ebp-28]
 00613EF1    fcomp       dword ptr ds:[614064];0:Single
 00613EF7    wait
 00613EF8    fnstsw      al
 00613EFA    sahf
>00613EFB    je          00613F0A
 00613EFD    fld         qword ptr [ebx+48]
 00613F00    fsub        qword ptr [ebp-8]
 00613F03    fdiv        qword ptr [ebp-28]
 00613F06    fstp        qword ptr [ebp-28]
 00613F09    wait
 00613F0A    mov         eax,dword ptr [ebp-28]
 00613F0D    mov         dword ptr [ebx+100],eax
 00613F13    mov         eax,dword ptr [ebp-24]
 00613F16    mov         dword ptr [ebx+104],eax
 00613F1C    fld         tbyte ptr ds:[614068];9.8:Extended
 00613F22    fmul        qword ptr [ebp-28]
 00613F25    fstp        qword ptr [ebp-28]
 00613F28    wait
 00613F29    fld         qword ptr [ebp-18]
 00613F2C    fmul        st,st(0)
 00613F2E    fstp        tbyte ptr [ebp-34]
 00613F31    wait
 00613F32    fld         qword ptr [ebp-20]
 00613F35    fmul        st,st(0)
 00613F37    fld         tbyte ptr [ebp-34]
 00613F3A    faddp       st(1),st
 00613F3C    fstp        tbyte ptr [ebp-40]
 00613F3F    wait
 00613F40    fld         qword ptr [ebp-28]
 00613F43    fmul        st,st(0)
 00613F45    fld         tbyte ptr [ebp-40]
 00613F48    faddp       st(1),st
 00613F4A    add         esp,0FFFFFFF4
 00613F4D    fstp        tbyte ptr [esp]
 00613F50    wait
 00613F51    call        Sqrt
 00613F56    fstp        qword ptr [ebp-10]
 00613F59    wait
 00613F5A    fld         qword ptr [ebp-10]
 00613F5D    fcomp       dword ptr ds:[614064];0:Single
 00613F63    wait
 00613F64    fnstsw      al
 00613F66    sahf
>00613F67    je          00613F90
 00613F69    fld         qword ptr [ebp-18]
 00613F6C    fdiv        qword ptr [ebp-10]
 00613F6F    fstp        qword ptr [ebx+108]
 00613F75    wait
 00613F76    fld         qword ptr [ebp-20]
 00613F79    fdiv        qword ptr [ebp-10]
 00613F7C    fstp        qword ptr [ebx+110]
 00613F82    wait
 00613F83    fld         qword ptr [ebp-28]
 00613F86    fdiv        qword ptr [ebp-10]
 00613F89    fstp        qword ptr [ebx+118]
 00613F8F    wait
 00613F90    fld         tbyte ptr ds:[614074];9.3:Extended
 00613F96    fcomp       qword ptr [ebp-10]
 00613F99    wait
 00613F9A    fnstsw      al
 00613F9C    sahf
>00613F9D    ja          00613FD5
 00613F9F    fld         tbyte ptr ds:[614080];10.3:Extended
 00613FA5    fcomp       qword ptr [ebp-10]
 00613FA8    wait
 00613FA9    fnstsw      al
 00613FAB    sahf
>00613FAC    jb          00613FD5
 00613FAE    fld         qword ptr [ebp-18]
 00613FB1    fdiv        qword ptr [ebp-10]
 00613FB4    fstp        qword ptr [ebx+120]
 00613FBA    wait
 00613FBB    fld         qword ptr [ebp-20]
 00613FBE    fdiv        qword ptr [ebp-10]
 00613FC1    fstp        qword ptr [ebx+128]
 00613FC7    wait
 00613FC8    fld         qword ptr [ebp-28]
 00613FCB    fdiv        qword ptr [ebp-10]
 00613FCE    fstp        qword ptr [ebx+130]
 00613FD4    wait
 00613FD5    fld         tbyte ptr ds:[614068];9.8:Extended
 00613FDB    fmul        qword ptr [ebx+120]
 00613FE1    fsubr       qword ptr [ebp-18]
 00613FE4    fstp        qword ptr [ebp-18]
 00613FE7    wait
 00613FE8    fld         tbyte ptr ds:[614068];9.8:Extended
 00613FEE    fmul        qword ptr [ebx+128]
 00613FF4    fsubr       qword ptr [ebp-20]
 00613FF7    fstp        qword ptr [ebp-20]
 00613FFA    wait
 00613FFB    fld         tbyte ptr ds:[614068];9.8:Extended
 00614001    fmul        qword ptr [ebx+130]
 00614007    fsubr       qword ptr [ebp-28]
 0061400A    fstp        qword ptr [ebp-28]
 0061400D    wait
 0061400E    fld         qword ptr [ebp+8]
 00614011    fcomp       dword ptr ds:[614064];0:Single
 00614017    wait
 00614018    fnstsw      al
 0061401A    sahf
>0061401B    jbe         00614056
 0061401D    fld         qword ptr [ebp-18]
 00614020    fmul        qword ptr [ebp+8]
 00614023    fadd        qword ptr [ebx+158]
 00614029    fstp        qword ptr [ebx+158]
 0061402F    wait
 00614030    fld         qword ptr [ebp-20]
 00614033    fmul        qword ptr [ebp+8]
 00614036    fadd        qword ptr [ebx+160]
 0061403C    fstp        qword ptr [ebx+160]
 00614042    wait
 00614043    fld         qword ptr [ebp-28]
 00614046    fmul        qword ptr [ebp+8]
 00614049    fadd        qword ptr [ebx+168]
 0061404F    fstp        qword ptr [ebx+168]
 00614055    wait
 00614056    pop         ebx
 00614057    mov         esp,ebp
 00614059    pop         ebp
 0061405A    ret         20
end;*}

//0061408C
{*procedure sub_0061408C(?:?);
begin
 0061408C    push        ebx
 0061408D    add         esp,0FFFFFFD4
 00614090    mov         ebx,eax
 00614092    fld         qword ptr [ebx+120]
 00614098    fadd        qword ptr [ebx+138]
 0061409E    fcomp       dword ptr ds:[6150F0];0:Single
 006140A4    wait
 006140A5    fnstsw      al
 006140A7    sahf
>006140A8    jne         006140C2
 006140AA    fld         qword ptr [ebx+128]
 006140B0    fadd        qword ptr [ebx+140]
 006140B6    fcomp       dword ptr ds:[6150F0];0:Single
 006140BC    wait
 006140BD    fnstsw      al
 006140BF    sahf
>006140C0    je          00614123
 006140C2    fld         qword ptr [ebx+120]
 006140C8    fadd        qword ptr [ebx+138]
 006140CE    fdiv        dword ptr ds:[6150F4];2:Single
 006140D4    add         esp,0FFFFFFF8
 006140D7    fstp        qword ptr [esp]
 006140DA    wait
 006140DB    fld         qword ptr [ebx+128]
 006140E1    fadd        qword ptr [ebx+140]
 006140E7    fdiv        dword ptr ds:[6150F4];2:Single
 006140ED    add         esp,0FFFFFFF8
 006140F0    fstp        qword ptr [esp]
 006140F3    wait
 006140F4    push        0
 006140F6    push        0
 006140F8    call        005C4070
 006140FD    fstp        qword ptr [esp]
 00614100    wait
 00614101    fld         qword ptr [ebx+120]
 00614107    fchs
 00614109    fdiv        qword ptr [esp]
 0061410C    fstp        qword ptr [ebx+218]
 00614112    wait
 00614113    fld         qword ptr [ebx+128]
 00614119    fdiv        qword ptr [esp]
 0061411C    fstp        qword ptr [ebx+220]
 00614122    wait
 00614123    mov         eax,dword ptr [ebx+120]
 00614129    mov         dword ptr [ebx+138],eax
 0061412F    mov         eax,dword ptr [ebx+124]
 00614135    mov         dword ptr [ebx+13C],eax
 0061413B    mov         eax,dword ptr [ebx+128]
 00614141    mov         dword ptr [ebx+140],eax
 00614147    mov         eax,dword ptr [ebx+12C]
 0061414D    mov         dword ptr [ebx+144],eax
 00614153    mov         eax,dword ptr [ebx+130]
 00614159    mov         dword ptr [ebx+148],eax
 0061415F    mov         eax,dword ptr [ebx+134]
 00614165    mov         dword ptr [ebx+14C],eax
 0061416B    cmp         byte ptr [ebx+0BE],0
>00614172    je          006141E6
 00614174    fild        dword ptr [ebx+0B5]
 0061417A    fsubr       dword ptr ds:[6150F8];511.5:Single
 00614180    fmul        qword ptr [ebx+220]
 00614186    fdiv        dword ptr ds:[6150F8];511.5:Single
 0061418C    fild        dword ptr [ebx+0B9]
 00614192    fsub        dword ptr ds:[6150FC];383.5:Single
 00614198    fmul        qword ptr [ebx+218]
 0061419E    fdiv        dword ptr ds:[6150F8];511.5:Single
 006141A4    fsubp       st(1),st
 006141A6    fstp        qword ptr [ebx+188]
 006141AC    wait
 006141AD    fild        dword ptr [ebx+0B5]
 006141B3    fsubr       dword ptr ds:[6150F8];511.5:Single
 006141B9    fmul        qword ptr [ebx+218]
 006141BF    fdiv        dword ptr ds:[6150F8];511.5:Single
 006141C5    fild        dword ptr [ebx+0B9]
 006141CB    fsub        dword ptr ds:[6150FC];383.5:Single
 006141D1    fmul        qword ptr [ebx+220]
 006141D7    fdiv        dword ptr ds:[6150F8];511.5:Single
 006141DD    faddp       st(1),st
 006141DF    fstp        qword ptr [ebx+190]
 006141E5    wait
 006141E6    cmp         byte ptr [ebx+0CA],0
>006141ED    je          00614261
 006141EF    fild        dword ptr [ebx+0C1]
 006141F5    fsubr       dword ptr ds:[6150F8];511.5:Single
 006141FB    fmul        qword ptr [ebx+220]
 00614201    fdiv        dword ptr ds:[6150F8];511.5:Single
 00614207    fild        dword ptr [ebx+0C5]
 0061420D    fsub        dword ptr ds:[6150FC];383.5:Single
 00614213    fmul        qword ptr [ebx+218]
 00614219    fdiv        dword ptr ds:[6150F8];511.5:Single
 0061421F    fsubp       st(1),st
 00614221    fstp        qword ptr [ebx+198]
 00614227    wait
 00614228    fild        dword ptr [ebx+0C1]
 0061422E    fsubr       dword ptr ds:[6150F8];511.5:Single
 00614234    fmul        qword ptr [ebx+218]
 0061423A    fdiv        dword ptr ds:[6150F8];511.5:Single
 00614240    fild        dword ptr [ebx+0C5]
 00614246    fsub        dword ptr ds:[6150FC];383.5:Single
 0061424C    fmul        qword ptr [ebx+220]
 00614252    fdiv        dword ptr ds:[6150F8];511.5:Single
 00614258    faddp       st(1),st
 0061425A    fstp        qword ptr [ebx+1A0]
 00614260    wait
 00614261    cmp         byte ptr [ebx+0BE],0
>00614268    je          00614325
 0061426E    cmp         byte ptr [ebx+0CA],0
>00614275    je          00614325
 0061427B    fld         qword ptr [ebx+188]
 00614281    fcomp       qword ptr [ebx+198]
 00614287    wait
 00614288    fnstsw      al
 0061428A    sahf
>0061428B    ja          006142AC
 0061428D    mov         dword ptr [ebx+258],1
 00614297    fld         qword ptr [ebx+1A0]
 0061429D    fsub        qword ptr [ebx+190]
 006142A3    fstp        qword ptr [ebx+200]
 006142A9    wait
>006142AA    jmp         006142C9
 006142AC    mov         dword ptr [ebx+258],2
 006142B6    fld         qword ptr [ebx+190]
 006142BC    fsub        qword ptr [ebx+1A0]
 006142C2    fstp        qword ptr [ebx+200]
 006142C8    wait
 006142C9    fld         qword ptr [ebx+188]
 006142CF    fsub        qword ptr [ebx+198]
 006142D5    fabs
 006142D7    fstp        qword ptr [ebx+1F8]
 006142DD    wait
 006142DE    push        dword ptr [ebx+1FC]
 006142E4    push        dword ptr [ebx+1F8]
 006142EA    push        dword ptr [ebx+204]
 006142F0    push        dword ptr [ebx+200]
 006142F6    push        0
 006142F8    push        0
 006142FA    call        005C4070
 006142FF    fmul        dword ptr ds:[6150F8];511.5:Single
 00614305    fstp        qword ptr [ebx+208]
 0061430B    wait
 0061430C    fld         qword ptr ds:[81D870];gvar_0081D870:Double
 00614312    fmul        dword ptr ds:[615100];1320:Single
 00614318    fdiv        qword ptr [ebx+208]
 0061431E    fstp        qword ptr [ebx+210]
 00614324    wait
 00614325    mov         eax,dword ptr [ebx+258]
 0061432B    cmp         eax,1
>0061432E    jne         00614582
 00614334    movzx       eax,byte ptr [ebx+0BE]
 0061433B    test        al,al
>0061433D    je          006143BB
 0061433F    cmp         byte ptr [ebx+0CA],0
>00614346    je          006143BB
 00614348    mov         eax,dword ptr [ebx+188]
 0061434E    mov         dword ptr [ebx+1A8],eax
 00614354    mov         eax,dword ptr [ebx+18C]
 0061435A    mov         dword ptr [ebx+1AC],eax
 00614360    mov         eax,dword ptr [ebx+190]
 00614366    mov         dword ptr [ebx+1B0],eax
 0061436C    mov         eax,dword ptr [ebx+194]
 00614372    mov         dword ptr [ebx+1B4],eax
 00614378    mov         byte ptr [ebx+25C],1
 0061437F    mov         eax,dword ptr [ebx+198]
 00614385    mov         dword ptr [ebx+1B8],eax
 0061438B    mov         eax,dword ptr [ebx+19C]
 00614391    mov         dword ptr [ebx+1BC],eax
 00614397    mov         eax,dword ptr [ebx+1A0]
 0061439D    mov         dword ptr [ebx+1C0],eax
 006143A3    mov         eax,dword ptr [ebx+1A4]
 006143A9    mov         dword ptr [ebx+1C4],eax
 006143AF    mov         byte ptr [ebx+25D],1
>006143B6    jmp         0061488B
 006143BB    test        al,al
>006143BD    je          0061450C
 006143C3    fld         qword ptr [ebx+1A8]
 006143C9    fsub        qword ptr [ebx+188]
 006143CF    add         esp,0FFFFFFF8
 006143D2    fstp        qword ptr [esp]
 006143D5    wait
 006143D6    fld         qword ptr [ebx+1B0]
 006143DC    fsub        qword ptr [ebx+190]
 006143E2    add         esp,0FFFFFFF8
 006143E5    fstp        qword ptr [esp]
 006143E8    wait
 006143E9    push        0
 006143EB    push        0
 006143ED    call        005C4070
 006143F2    fstp        qword ptr [esp+18]
 006143F6    wait
 006143F7    fld         qword ptr [ebx+1B8]
 006143FD    fsub        qword ptr [ebx+188]
 00614403    add         esp,0FFFFFFF8
 00614406    fstp        qword ptr [esp]
 00614409    wait
 0061440A    fld         qword ptr [ebx+1C0]
 00614410    fsub        qword ptr [ebx+190]
 00614416    add         esp,0FFFFFFF8
 00614419    fstp        qword ptr [esp]
 0061441C    wait
 0061441D    push        0
 0061441F    push        0
 00614421    call        005C4070
 00614426    fcomp       qword ptr [esp+18]
 0061442A    wait
 0061442B    fnstsw      al
 0061442D    sahf
>0061442E    jb          00614499
 00614430    mov         eax,dword ptr [ebx+188]
 00614436    mov         dword ptr [ebx+1A8],eax
 0061443C    mov         eax,dword ptr [ebx+18C]
 00614442    mov         dword ptr [ebx+1AC],eax
 00614448    mov         eax,dword ptr [ebx+190]
 0061444E    mov         dword ptr [ebx+1B0],eax
 00614454    mov         eax,dword ptr [ebx+194]
 0061445A    mov         dword ptr [ebx+1B4],eax
 00614460    fld         qword ptr [ebx+188]
 00614466    fadd        qword ptr [ebx+1F8]
 0061446C    fstp        qword ptr [ebx+1B8]
 00614472    wait
 00614473    fld         qword ptr [ebx+190]
 00614479    fadd        qword ptr [ebx+200]
 0061447F    fstp        qword ptr [ebx+1C0]
 00614485    wait
 00614486    mov         byte ptr [ebx+25C],1
 0061448D    mov         byte ptr [ebx+25D],0
>00614494    jmp         0061488B
 00614499    mov         dword ptr [ebx+258],2
 006144A3    fld         qword ptr [ebx+188]
 006144A9    fsub        qword ptr [ebx+1F8]
 006144AF    fstp        qword ptr [ebx+1A8]
 006144B5    wait
 006144B6    fld         qword ptr [ebx+190]
 006144BC    fsub        qword ptr [ebx+200]
 006144C2    fstp        qword ptr [ebx+1B0]
 006144C8    wait
 006144C9    mov         eax,dword ptr [ebx+188]
 006144CF    mov         dword ptr [ebx+1B8],eax
 006144D5    mov         eax,dword ptr [ebx+18C]
 006144DB    mov         dword ptr [ebx+1BC],eax
 006144E1    mov         eax,dword ptr [ebx+190]
 006144E7    mov         dword ptr [ebx+1C0],eax
 006144ED    mov         eax,dword ptr [ebx+194]
 006144F3    mov         dword ptr [ebx+1C4],eax
 006144F9    mov         byte ptr [ebx+25D],1
 00614500    mov         byte ptr [ebx+25C],0
>00614507    jmp         0061488B
 0061450C    cmp         byte ptr [ebx+0CA],0
>00614513    je          0061488B
 00614519    fld         qword ptr [ebx+198]
 0061451F    fsub        qword ptr [ebx+1F8]
 00614525    fstp        qword ptr [ebx+1A8]
 0061452B    wait
 0061452C    fld         qword ptr [ebx+1A0]
 00614532    fsub        qword ptr [ebx+200]
 00614538    fstp        qword ptr [ebx+1B0]
 0061453E    wait
 0061453F    mov         eax,dword ptr [ebx+198]
 00614545    mov         dword ptr [ebx+1B8],eax
 0061454B    mov         eax,dword ptr [ebx+19C]
 00614551    mov         dword ptr [ebx+1BC],eax
 00614557    mov         eax,dword ptr [ebx+1A0]
 0061455D    mov         dword ptr [ebx+1C0],eax
 00614563    mov         eax,dword ptr [ebx+1A4]
 00614569    mov         dword ptr [ebx+1C4],eax
 0061456F    mov         byte ptr [ebx+25D],1
 00614576    mov         byte ptr [ebx+25C],0
>0061457D    jmp         0061488B
 00614582    cmp         eax,2
>00614585    jne         006147D9
 0061458B    movzx       eax,byte ptr [ebx+0BE]
 00614592    test        al,al
>00614594    je          00614612
 00614596    cmp         byte ptr [ebx+0CA],0
>0061459D    je          00614612
 0061459F    mov         eax,dword ptr [ebx+198]
 006145A5    mov         dword ptr [ebx+1A8],eax
 006145AB    mov         eax,dword ptr [ebx+19C]
 006145B1    mov         dword ptr [ebx+1AC],eax
 006145B7    mov         eax,dword ptr [ebx+1A0]
 006145BD    mov         dword ptr [ebx+1B0],eax
 006145C3    mov         eax,dword ptr [ebx+1A4]
 006145C9    mov         dword ptr [ebx+1B4],eax
 006145CF    mov         byte ptr [ebx+25C],1
 006145D6    mov         eax,dword ptr [ebx+188]
 006145DC    mov         dword ptr [ebx+1B8],eax
 006145E2    mov         eax,dword ptr [ebx+18C]
 006145E8    mov         dword ptr [ebx+1BC],eax
 006145EE    mov         eax,dword ptr [ebx+190]
 006145F4    mov         dword ptr [ebx+1C0],eax
 006145FA    mov         eax,dword ptr [ebx+194]
 00614600    mov         dword ptr [ebx+1C4],eax
 00614606    mov         byte ptr [ebx+25D],1
>0061460D    jmp         0061488B
 00614612    test        al,al
>00614614    je          00614763
 0061461A    fld         qword ptr [ebx+1A8]
 00614620    fsub        qword ptr [ebx+188]
 00614626    add         esp,0FFFFFFF8
 00614629    fstp        qword ptr [esp]
 0061462C    wait
 0061462D    fld         qword ptr [ebx+1B0]
 00614633    fsub        qword ptr [ebx+190]
 00614639    add         esp,0FFFFFFF8
 0061463C    fstp        qword ptr [esp]
 0061463F    wait
 00614640    push        0
 00614642    push        0
 00614644    call        005C4070
 00614649    fstp        qword ptr [esp+18]
 0061464D    wait
 0061464E    fld         qword ptr [ebx+1B8]
 00614654    fsub        qword ptr [ebx+188]
 0061465A    add         esp,0FFFFFFF8
 0061465D    fstp        qword ptr [esp]
 00614660    wait
 00614661    fld         qword ptr [ebx+1C0]
 00614667    fsub        qword ptr [ebx+190]
 0061466D    add         esp,0FFFFFFF8
 00614670    fstp        qword ptr [esp]
 00614673    wait
 00614674    push        0
 00614676    push        0
 00614678    call        005C4070
 0061467D    fcomp       qword ptr [esp+18]
 00614681    wait
 00614682    fnstsw      al
 00614684    sahf
>00614685    jb          006146FA
 00614687    mov         dword ptr [ebx+258],1
 00614691    mov         eax,dword ptr [ebx+188]
 00614697    mov         dword ptr [ebx+1A8],eax
 0061469D    mov         eax,dword ptr [ebx+18C]
 006146A3    mov         dword ptr [ebx+1AC],eax
 006146A9    mov         eax,dword ptr [ebx+190]
 006146AF    mov         dword ptr [ebx+1B0],eax
 006146B5    mov         eax,dword ptr [ebx+194]
 006146BB    mov         dword ptr [ebx+1B4],eax
 006146C1    fld         qword ptr [ebx+188]
 006146C7    fadd        qword ptr [ebx+1F8]
 006146CD    fstp        qword ptr [ebx+1B8]
 006146D3    wait
 006146D4    fld         qword ptr [ebx+190]
 006146DA    fadd        qword ptr [ebx+200]
 006146E0    fstp        qword ptr [ebx+1C0]
 006146E6    wait
 006146E7    mov         byte ptr [ebx+25C],1
 006146EE    mov         byte ptr [ebx+25D],0
>006146F5    jmp         0061488B
 006146FA    fld         qword ptr [ebx+188]
 00614700    fsub        qword ptr [ebx+1F8]
 00614706    fstp        qword ptr [ebx+1A8]
 0061470C    wait
 0061470D    fld         qword ptr [ebx+190]
 00614713    fsub        qword ptr [ebx+200]
 00614719    fstp        qword ptr [ebx+1B0]
 0061471F    wait
 00614720    mov         eax,dword ptr [ebx+188]
 00614726    mov         dword ptr [ebx+1B8],eax
 0061472C    mov         eax,dword ptr [ebx+18C]
 00614732    mov         dword ptr [ebx+1BC],eax
 00614738    mov         eax,dword ptr [ebx+190]
 0061473E    mov         dword ptr [ebx+1C0],eax
 00614744    mov         eax,dword ptr [ebx+194]
 0061474A    mov         dword ptr [ebx+1C4],eax
 00614750    mov         byte ptr [ebx+25D],1
 00614757    mov         byte ptr [ebx+25C],0
>0061475E    jmp         0061488B
 00614763    cmp         byte ptr [ebx+0CA],0
>0061476A    je          0061488B
 00614770    fld         qword ptr [ebx+198]
 00614776    fadd        qword ptr [ebx+1F8]
 0061477C    fstp        qword ptr [ebx+1B8]
 00614782    wait
 00614783    fld         qword ptr [ebx+1A0]
 00614789    fadd        qword ptr [ebx+200]
 0061478F    fstp        qword ptr [ebx+1C0]
 00614795    wait
 00614796    mov         eax,dword ptr [ebx+198]
 0061479C    mov         dword ptr [ebx+1A8],eax
 006147A2    mov         eax,dword ptr [ebx+19C]
 006147A8    mov         dword ptr [ebx+1AC],eax
 006147AE    mov         eax,dword ptr [ebx+1A0]
 006147B4    mov         dword ptr [ebx+1B0],eax
 006147BA    mov         eax,dword ptr [ebx+1A4]
 006147C0    mov         dword ptr [ebx+1B4],eax
 006147C6    mov         byte ptr [ebx+25C],1
 006147CD    mov         byte ptr [ebx+25D],0
>006147D4    jmp         0061488B
 006147D9    cmp         byte ptr [ebx+0BE],0
>006147E0    je          00614814
 006147E2    mov         eax,dword ptr [ebx+188]
 006147E8    mov         dword ptr [ebx+1A8],eax
 006147EE    mov         eax,dword ptr [ebx+18C]
 006147F4    mov         dword ptr [ebx+1AC],eax
 006147FA    mov         eax,dword ptr [ebx+190]
 00614800    mov         dword ptr [ebx+1B0],eax
 00614806    mov         eax,dword ptr [ebx+194]
 0061480C    mov         dword ptr [ebx+1B4],eax
>00614812    jmp         0061484D
 00614814    cmp         byte ptr [ebx+0CA],0
>0061481B    je          0061484D
 0061481D    mov         eax,dword ptr [ebx+198]
 00614823    mov         dword ptr [ebx+1A8],eax
 00614829    mov         eax,dword ptr [ebx+19C]
 0061482F    mov         dword ptr [ebx+1AC],eax
 00614835    mov         eax,dword ptr [ebx+1A0]
 0061483B    mov         dword ptr [ebx+1B0],eax
 00614841    mov         eax,dword ptr [ebx+1A4]
 00614847    mov         dword ptr [ebx+1B4],eax
 0061484D    mov         eax,dword ptr [ebx+1A8]
 00614853    mov         dword ptr [ebx+1B8],eax
 00614859    mov         eax,dword ptr [ebx+1AC]
 0061485F    mov         dword ptr [ebx+1BC],eax
 00614865    mov         eax,dword ptr [ebx+1B0]
 0061486B    mov         dword ptr [ebx+1C0],eax
 00614871    mov         eax,dword ptr [ebx+1B4]
 00614877    mov         dword ptr [ebx+1C4],eax
 0061487D    mov         byte ptr [ebx+25C],1
 00614884    mov         byte ptr [ebx+25D],1
 0061488B    fld         qword ptr [ebx+1A8]
 00614891    fadd        qword ptr [ebx+1B8]
 00614897    fdiv        dword ptr ds:[6150F4];2:Single
 0061489D    fstp        qword ptr [ebx+1C8]
 006148A3    wait
 006148A4    fld         qword ptr [ebx+1B0]
 006148AA    fadd        qword ptr [ebx+1C0]
 006148B0    fdiv        dword ptr ds:[6150F4];2:Single
 006148B6    fstp        qword ptr [ebx+1D0]
 006148BC    wait
 006148BD    cmp         byte ptr [ebx+0BE],0
>006148C4    jne         006148D3
 006148C6    cmp         byte ptr [ebx+0CA],0
>006148CD    jne         006148D3
 006148CF    xor         eax,eax
>006148D1    jmp         006148D5
 006148D3    mov         al,1
 006148D5    mov         byte ptr [ebx+25E],al
 006148DB    test        al,al
>006148DD    je          00614A3A
 006148E3    fld         dword ptr ds:[6150F8];511.5:Single
 006148E9    fmul        qword ptr [ebx+1D0]
 006148EF    add         esp,0FFFFFFF4
 006148F2    fstp        tbyte ptr [esp]
 006148F5    wait
 006148F6    push        4009
 006148FB    push        0A5000000
 00614900    push        0
 00614902    call        00454A8C
 00614907    fstp        tbyte ptr [esp+20]
 0061490B    wait
 0061490C    push        dword ptr [ebx+134]
 00614912    push        dword ptr [ebx+130]
 00614918    call        00454A5C
 0061491D    fld         tbyte ptr [esp+20]
 00614921    faddp       st(1),st
 00614923    fstp        qword ptr [ebx+228]
 00614929    wait
 0061492A    fld         dword ptr ds:[615104];-511.5:Single
 00614930    fmul        qword ptr [ebx+1C8]
 00614936    add         esp,0FFFFFFF4
 00614939    fstp        tbyte ptr [esp]
 0061493C    wait
 0061493D    push        4009
 00614942    push        0A5000000
 00614947    push        0
 00614949    call        00454A8C
 0061494E    fstp        qword ptr [ebx+230]
 00614954    wait
 00614955    fld         dword ptr ds:[6150F8];511.5:Single
 0061495B    fmul        qword ptr [ebx+1C8]
 00614961    add         esp,0FFFFFFF4
 00614964    fstp        tbyte ptr [esp]
 00614967    wait
 00614968    push        4009
 0061496D    push        0A5000000
 00614972    push        0
 00614974    call        00454A8C
 00614979    fstp        qword ptr [ebx+1D8]
 0061497F    wait
 00614980    fld         qword ptr [ebx+230]
 00614986    add         esp,0FFFFFFF4
 00614989    fstp        tbyte ptr [esp]
 0061498C    wait
 0061498D    call        Sin
 00614992    fchs
 00614994    fmul        qword ptr [ebx+210]
 0061499A    fstp        qword ptr [ebx+1E0]
 006149A0    wait
 006149A1    mov         eax,dword ptr [ebx+1E0]
 006149A7    mov         dword ptr [ebx+170],eax
 006149AD    mov         eax,dword ptr [ebx+1E4]
 006149B3    mov         dword ptr [ebx+174],eax
 006149B9    fld         qword ptr [ebx+228]
 006149BF    add         esp,0FFFFFFF4
 006149C2    fstp        tbyte ptr [esp]
 006149C5    wait
 006149C6    call        Sin
 006149CB    fchs
 006149CD    fmul        qword ptr [ebx+210]
 006149D3    fstp        qword ptr [ebx+1E8]
 006149D9    wait
 006149DA    mov         eax,dword ptr [ebx+1E8]
 006149E0    mov         dword ptr [ebx+178],eax
 006149E6    mov         eax,dword ptr [ebx+1EC]
 006149EC    mov         dword ptr [ebx+17C],eax
 006149F2    fld         qword ptr [ebx+210]
 006149F8    fmul        st,st(0)
 006149FA    fstp        tbyte ptr [esp+20]
 006149FE    wait
 006149FF    fld         qword ptr [ebx+1E8]
 00614A05    fmul        st,st(0)
 00614A07    fld         tbyte ptr [esp+20]
 00614A0B    fsubrp      st(1),st
 00614A0D    add         esp,0FFFFFFF4
 00614A10    fstp        tbyte ptr [esp]
 00614A13    wait
 00614A14    call        Sqrt
 00614A19    fchs
 00614A1B    fstp        qword ptr [ebx+1F0]
 00614A21    wait
 00614A22    mov         eax,dword ptr [ebx+1F0]
 00614A28    mov         dword ptr [ebx+180],eax
 00614A2E    mov         eax,dword ptr [ebx+1F4]
 00614A34    mov         dword ptr [ebx+184],eax
 00614A3A    fld         qword ptr ds:[78BD38]
 00614A40    fmul        qword ptr [ebx+1C8]
 00614A46    fdiv        dword ptr ds:[6150F4];2:Single
 00614A4C    fadd        dword ptr ds:[615108];0.5:Single
 00614A52    fstp        qword ptr [esp+8]
 00614A56    wait
 00614A57    fld         qword ptr ds:[78BD40]
 00614A5D    fmul        qword ptr [ebx+1D0]
 00614A63    fmul        dword ptr ds:[61510C];1023:Single
 00614A69    fdiv        dword ptr ds:[615110];767:Single
 00614A6F    fdiv        dword ptr ds:[6150F4];2:Single
 00614A75    fadd        dword ptr ds:[615108];0.5:Single
 00614A7B    fstp        qword ptr [esp+10]
 00614A7F    wait
 00614A80    fld         qword ptr [esp+8]
 00614A84    fsub        qword ptr [ebx+240]
 00614A8A    fabs
 00614A8C    fstp        qword ptr [esp]
 00614A8F    wait
 00614A90    mov         eax,dword ptr [esp]
 00614A93    mov         dword ptr [ebx+250],eax
 00614A99    mov         eax,dword ptr [esp+4]
 00614A9D    mov         dword ptr [ebx+254],eax
 00614AA3    fld         tbyte ptr ds:[615114];0.04:Extended
 00614AA9    fcomp       qword ptr [esp]
 00614AAC    wait
 00614AAD    fnstsw      al
 00614AAF    sahf
>00614AB0    ja          00614AC7
 00614AB2    lea         eax,[ebx+3C0]
 00614AB8    mov         edx,1
 00614ABD    call        0068BF2C
>00614AC2    jmp         00614CE7
 00614AC7    fld         tbyte ptr ds:[615120];0.03:Extended
 00614ACD    fcomp       qword ptr [esp]
 00614AD0    wait
 00614AD1    fnstsw      al
 00614AD3    sahf
>00614AD4    ja          00614AEB
 00614AD6    lea         eax,[ebx+3C0]
 00614ADC    mov         edx,2
 00614AE1    call        0068BF2C
>00614AE6    jmp         00614CE7
 00614AEB    fld         tbyte ptr ds:[61512C];0.02:Extended
 00614AF1    fcomp       qword ptr [esp]
 00614AF4    wait
 00614AF5    fnstsw      al
 00614AF7    sahf
>00614AF8    ja          00614B0F
 00614AFA    lea         eax,[ebx+3C0]
 00614B00    mov         edx,3
 00614B05    call        0068BF2C
>00614B0A    jmp         00614CE7
 00614B0F    fld         tbyte ptr ds:[615138];0.01:Extended
 00614B15    fcomp       qword ptr [esp]
 00614B18    wait
 00614B19    fnstsw      al
 00614B1B    sahf
>00614B1C    ja          00614B33
 00614B1E    lea         eax,[ebx+3C0]
 00614B24    mov         edx,4
 00614B29    call        0068BF2C
>00614B2E    jmp         00614CE7
 00614B33    fld         tbyte ptr ds:[615144];0.009:Extended
 00614B39    fcomp       qword ptr [esp]
 00614B3C    wait
 00614B3D    fnstsw      al
 00614B3F    sahf
>00614B40    ja          00614B57
 00614B42    lea         eax,[ebx+3C0]
 00614B48    mov         edx,5
 00614B4D    call        0068BF2C
>00614B52    jmp         00614CE7
 00614B57    fld         tbyte ptr ds:[615150];0.008:Extended
 00614B5D    fcomp       qword ptr [esp]
 00614B60    wait
 00614B61    fnstsw      al
 00614B63    sahf
>00614B64    ja          00614B7B
 00614B66    lea         eax,[ebx+3C0]
 00614B6C    mov         edx,6
 00614B71    call        0068BF2C
>00614B76    jmp         00614CE7
 00614B7B    fld         tbyte ptr ds:[61515C];0.007:Extended
 00614B81    fcomp       qword ptr [esp]
 00614B84    wait
 00614B85    fnstsw      al
 00614B87    sahf
>00614B88    ja          00614B9F
 00614B8A    lea         eax,[ebx+3C0]
 00614B90    mov         edx,7
 00614B95    call        0068BF2C
>00614B9A    jmp         00614CE7
 00614B9F    fld         tbyte ptr ds:[615168];0.0068:Extended
 00614BA5    fcomp       qword ptr [esp]
 00614BA8    wait
 00614BA9    fnstsw      al
 00614BAB    sahf
>00614BAC    ja          00614BC3
 00614BAE    lea         eax,[ebx+3C0]
 00614BB4    mov         edx,8
 00614BB9    call        0068BF2C
>00614BBE    jmp         00614CE7
 00614BC3    fld         tbyte ptr ds:[615174];0.0065:Extended
 00614BC9    fcomp       qword ptr [esp]
 00614BCC    wait
 00614BCD    fnstsw      al
 00614BCF    sahf
>00614BD0    ja          00614BE7
 00614BD2    lea         eax,[ebx+3C0]
 00614BD8    mov         edx,9
 00614BDD    call        0068BF2C
>00614BE2    jmp         00614CE7
 00614BE7    fld         tbyte ptr ds:[615180];0.006:Extended
 00614BED    fcomp       qword ptr [esp]
 00614BF0    wait
 00614BF1    fnstsw      al
 00614BF3    sahf
>00614BF4    ja          00614C0B
 00614BF6    lea         eax,[ebx+3C0]
 00614BFC    mov         edx,0A
 00614C01    call        0068BF2C
>00614C06    jmp         00614CE7
 00614C0B    fld         tbyte ptr ds:[61518C];0.0059:Extended
 00614C11    fcomp       qword ptr [esp]
 00614C14    wait
 00614C15    fnstsw      al
 00614C17    sahf
>00614C18    ja          00614C2F
 00614C1A    lea         eax,[ebx+3C0]
 00614C20    mov         edx,0B
 00614C25    call        0068BF2C
>00614C2A    jmp         00614CE7
 00614C2F    fld         tbyte ptr ds:[615198];0.0058:Extended
 00614C35    fcomp       qword ptr [esp]
 00614C38    wait
 00614C39    fnstsw      al
 00614C3B    sahf
>00614C3C    ja          00614C53
 00614C3E    lea         eax,[ebx+3C0]
 00614C44    mov         edx,0C
 00614C49    call        0068BF2C
>00614C4E    jmp         00614CE7
 00614C53    fld         tbyte ptr ds:[6151A4];0.0055:Extended
 00614C59    fcomp       qword ptr [esp]
 00614C5C    wait
 00614C5D    fnstsw      al
 00614C5F    sahf
>00614C60    ja          00614C74
 00614C62    lea         eax,[ebx+3C0]
 00614C68    mov         edx,0D
 00614C6D    call        0068BF2C
>00614C72    jmp         00614CE7
 00614C74    fld         tbyte ptr ds:[6151B0];0.005:Extended
 00614C7A    fcomp       qword ptr [esp]
 00614C7D    wait
 00614C7E    fnstsw      al
 00614C80    sahf
>00614C81    ja          00614C95
 00614C83    lea         eax,[ebx+3C0]
 00614C89    mov         edx,0F
 00614C8E    call        0068BF2C
>00614C93    jmp         00614CE7
 00614C95    fld         tbyte ptr ds:[6151BC];0.004:Extended
 00614C9B    fcomp       qword ptr [esp]
 00614C9E    wait
 00614C9F    fnstsw      al
 00614CA1    sahf
>00614CA2    ja          00614CB6
 00614CA4    lea         eax,[ebx+3C0]
 00614CAA    mov         edx,14
 00614CAF    call        0068BF2C
>00614CB4    jmp         00614CE7
 00614CB6    fld         tbyte ptr ds:[6151C8];0.003:Extended
 00614CBC    fcomp       qword ptr [esp]
 00614CBF    wait
 00614CC0    fnstsw      al
 00614CC2    sahf
>00614CC3    ja          00614CD7
 00614CC5    lea         eax,[ebx+3C0]
 00614CCB    mov         edx,19
 00614CD0    call        0068BF2C
>00614CD5    jmp         00614CE7
 00614CD7    lea         eax,[ebx+3C0]
 00614CDD    mov         edx,1E
 00614CE2    call        0068BF2C
 00614CE7    fld         qword ptr [esp+10]
 00614CEB    fsub        qword ptr [ebx+248]
 00614CF1    fabs
 00614CF3    fstp        qword ptr [esp]
 00614CF6    wait
 00614CF7    fld         tbyte ptr ds:[615114];0.04:Extended
 00614CFD    fcomp       qword ptr [esp]
 00614D00    wait
 00614D01    fnstsw      al
 00614D03    sahf
>00614D04    ja          00614D1B
 00614D06    lea         eax,[ebx+4C8]
 00614D0C    mov         edx,1
 00614D11    call        0068BF2C
>00614D16    jmp         00614F3B
 00614D1B    fld         tbyte ptr ds:[615120];0.03:Extended
 00614D21    fcomp       qword ptr [esp]
 00614D24    wait
 00614D25    fnstsw      al
 00614D27    sahf
>00614D28    ja          00614D3F
 00614D2A    lea         eax,[ebx+4C8]
 00614D30    mov         edx,2
 00614D35    call        0068BF2C
>00614D3A    jmp         00614F3B
 00614D3F    fld         tbyte ptr ds:[61512C];0.02:Extended
 00614D45    fcomp       qword ptr [esp]
 00614D48    wait
 00614D49    fnstsw      al
 00614D4B    sahf
>00614D4C    ja          00614D63
 00614D4E    lea         eax,[ebx+4C8]
 00614D54    mov         edx,3
 00614D59    call        0068BF2C
>00614D5E    jmp         00614F3B
 00614D63    fld         tbyte ptr ds:[615138];0.01:Extended
 00614D69    fcomp       qword ptr [esp]
 00614D6C    wait
 00614D6D    fnstsw      al
 00614D6F    sahf
>00614D70    ja          00614D87
 00614D72    lea         eax,[ebx+4C8]
 00614D78    mov         edx,4
 00614D7D    call        0068BF2C
>00614D82    jmp         00614F3B
 00614D87    fld         tbyte ptr ds:[615144];0.009:Extended
 00614D8D    fcomp       qword ptr [esp]
 00614D90    wait
 00614D91    fnstsw      al
 00614D93    sahf
>00614D94    ja          00614DAB
 00614D96    lea         eax,[ebx+4C8]
 00614D9C    mov         edx,5
 00614DA1    call        0068BF2C
>00614DA6    jmp         00614F3B
 00614DAB    fld         tbyte ptr ds:[615150];0.008:Extended
 00614DB1    fcomp       qword ptr [esp]
 00614DB4    wait
 00614DB5    fnstsw      al
 00614DB7    sahf
>00614DB8    ja          00614DCF
 00614DBA    lea         eax,[ebx+4C8]
 00614DC0    mov         edx,6
 00614DC5    call        0068BF2C
>00614DCA    jmp         00614F3B
 00614DCF    fld         tbyte ptr ds:[61515C];0.007:Extended
 00614DD5    fcomp       qword ptr [esp]
 00614DD8    wait
 00614DD9    fnstsw      al
 00614DDB    sahf
>00614DDC    ja          00614DF3
 00614DDE    lea         eax,[ebx+4C8]
 00614DE4    mov         edx,7
 00614DE9    call        0068BF2C
>00614DEE    jmp         00614F3B
 00614DF3    fld         tbyte ptr ds:[615168];0.0068:Extended
 00614DF9    fcomp       qword ptr [esp]
 00614DFC    wait
 00614DFD    fnstsw      al
 00614DFF    sahf
>00614E00    ja          00614E17
 00614E02    lea         eax,[ebx+4C8]
 00614E08    mov         edx,8
 00614E0D    call        0068BF2C
>00614E12    jmp         00614F3B
 00614E17    fld         tbyte ptr ds:[615174];0.0065:Extended
 00614E1D    fcomp       qword ptr [esp]
 00614E20    wait
 00614E21    fnstsw      al
 00614E23    sahf
>00614E24    ja          00614E3B
 00614E26    lea         eax,[ebx+4C8]
 00614E2C    mov         edx,9
 00614E31    call        0068BF2C
>00614E36    jmp         00614F3B
 00614E3B    fld         tbyte ptr ds:[615180];0.006:Extended
 00614E41    fcomp       qword ptr [esp]
 00614E44    wait
 00614E45    fnstsw      al
 00614E47    sahf
>00614E48    ja          00614E5F
 00614E4A    lea         eax,[ebx+4C8]
 00614E50    mov         edx,0A
 00614E55    call        0068BF2C
>00614E5A    jmp         00614F3B
 00614E5F    fld         tbyte ptr ds:[61518C];0.0059:Extended
 00614E65    fcomp       qword ptr [esp]
 00614E68    wait
 00614E69    fnstsw      al
 00614E6B    sahf
>00614E6C    ja          00614E83
 00614E6E    lea         eax,[ebx+4C8]
 00614E74    mov         edx,0B
 00614E79    call        0068BF2C
>00614E7E    jmp         00614F3B
 00614E83    fld         tbyte ptr ds:[615198];0.0058:Extended
 00614E89    fcomp       qword ptr [esp]
 00614E8C    wait
 00614E8D    fnstsw      al
 00614E8F    sahf
>00614E90    ja          00614EA7
 00614E92    lea         eax,[ebx+4C8]
 00614E98    mov         edx,0C
 00614E9D    call        0068BF2C
>00614EA2    jmp         00614F3B
 00614EA7    fld         tbyte ptr ds:[6151A4];0.0055:Extended
 00614EAD    fcomp       qword ptr [esp]
 00614EB0    wait
 00614EB1    fnstsw      al
 00614EB3    sahf
>00614EB4    ja          00614EC8
 00614EB6    lea         eax,[ebx+4C8]
 00614EBC    mov         edx,0D
 00614EC1    call        0068BF2C
>00614EC6    jmp         00614F3B
 00614EC8    fld         tbyte ptr ds:[6151B0];0.005:Extended
 00614ECE    fcomp       qword ptr [esp]
 00614ED1    wait
 00614ED2    fnstsw      al
 00614ED4    sahf
>00614ED5    ja          00614EE9
 00614ED7    lea         eax,[ebx+4C8]
 00614EDD    mov         edx,0F
 00614EE2    call        0068BF2C
>00614EE7    jmp         00614F3B
 00614EE9    fld         tbyte ptr ds:[6151BC];0.004:Extended
 00614EEF    fcomp       qword ptr [esp]
 00614EF2    wait
 00614EF3    fnstsw      al
 00614EF5    sahf
>00614EF6    ja          00614F0A
 00614EF8    lea         eax,[ebx+4C8]
 00614EFE    mov         edx,14
 00614F03    call        0068BF2C
>00614F08    jmp         00614F3B
 00614F0A    fld         tbyte ptr ds:[6151C8];0.003:Extended
 00614F10    fcomp       qword ptr [esp]
 00614F13    wait
 00614F14    fnstsw      al
 00614F16    sahf
>00614F17    ja          00614F2B
 00614F19    lea         eax,[ebx+4C8]
 00614F1F    mov         edx,19
 00614F24    call        0068BF2C
>00614F29    jmp         00614F3B
 00614F2B    lea         eax,[ebx+4C8]
 00614F31    mov         edx,1E
 00614F36    call        0068BF2C
 00614F3B    push        dword ptr [esp+0C]
 00614F3F    push        dword ptr [esp+0C]
 00614F43    mov         edx,dword ptr ds:[78CB88];^gvar_0078BDC0
 00614F49    mov         edx,dword ptr [edx]
 00614F4B    lea         eax,[ebx+3C0]
 00614F51    call        0068BF5C
 00614F56    push        dword ptr [esp+14]
 00614F5A    push        dword ptr [esp+14]
 00614F5E    mov         edx,dword ptr ds:[78CB88];^gvar_0078BDC0
 00614F64    mov         edx,dword ptr [edx]
 00614F66    lea         eax,[ebx+4C8]
 00614F6C    call        0068BF5C
 00614F71    lea         eax,[ebx+3C0]
 00614F77    call        0068B968
 00614F7C    fstp        qword ptr [ebx+240]
 00614F82    wait
 00614F83    lea         eax,[ebx+4C8]
 00614F89    call        0068B968
 00614F8E    fstp        qword ptr [ebx+248]
 00614F94    wait
 00614F95    cmp         byte ptr [ebx+0BE],0
>00614F9C    jne         00614FAB
 00614F9E    cmp         byte ptr [ebx+0CA],0
>00614FA5    jne         00614FAB
 00614FA7    xor         eax,eax
>00614FA9    jmp         00614FAD
 00614FAB    mov         al,1
 00614FAD    mov         byte ptr [ebx+25F],al
 00614FB3    fld         qword ptr [ebx+240]
 00614FB9    fcomp       dword ptr ds:[6150F0];0:Single
 00614FBF    wait
 00614FC0    fnstsw      al
 00614FC2    sahf
>00614FC3    jb          00614FFB
 00614FC5    fld         qword ptr [ebx+240]
 00614FCB    fcomp       dword ptr ds:[6151D4];1:Single
 00614FD1    wait
 00614FD2    fnstsw      al
 00614FD4    sahf
>00614FD5    ja          00614FFB
 00614FD7    fld         qword ptr [ebx+248]
 00614FDD    fcomp       dword ptr ds:[6150F0];0:Single
 00614FE3    wait
 00614FE4    fnstsw      al
 00614FE6    sahf
>00614FE7    jb          00614FFB
 00614FE9    fld         qword ptr [ebx+248]
 00614FEF    fcomp       dword ptr ds:[6151D4];1:Single
 00614FF5    wait
 00614FF6    fnstsw      al
 00614FF8    sahf
>00614FF9    jbe         00614FFF
 00614FFB    xor         eax,eax
>00614FFD    jmp         00615001
 00614FFF    mov         al,1
 00615001    mov         byte ptr [ebx+260],al
 00615007    fld         qword ptr [ebx+240]
 0061500D    fcomp       dword ptr ds:[6150F0];0:Single
 00615013    wait
 00615014    fnstsw      al
 00615016    sahf
>00615017    jb          00615038
 00615019    fld         qword ptr [ebx+240]
 0061501F    fcomp       dword ptr ds:[6151D8];0.25:Single
 00615025    wait
 00615026    fnstsw      al
 00615028    sahf
>00615029    jae         00615034
 0061502B    cmp         byte ptr [ebx+25F],0
>00615032    je          00615038
 00615034    xor         eax,eax
>00615036    jmp         0061503A
 00615038    mov         al,1
 0061503A    mov         byte ptr [ebx+261],al
 00615040    fld         qword ptr [ebx+240]
 00615046    fcomp       dword ptr ds:[6151D4];1:Single
 0061504C    wait
 0061504D    fnstsw      al
 0061504F    sahf
>00615050    ja          00615071
 00615052    fld         qword ptr [ebx+240]
 00615058    fcomp       dword ptr ds:[6151DC];0.75:Single
 0061505E    wait
 0061505F    fnstsw      al
 00615061    sahf
>00615062    jbe         0061506D
 00615064    cmp         byte ptr [ebx+25F],0
>0061506B    je          00615071
 0061506D    xor         eax,eax
>0061506F    jmp         00615073
 00615071    mov         al,1
 00615073    mov         byte ptr [ebx+262],al
 00615079    fld         qword ptr [ebx+238]
 0061507F    fcomp       dword ptr ds:[6150F0];0:Single
 00615085    wait
 00615086    fnstsw      al
 00615088    sahf
>00615089    jb          006150AA
 0061508B    fld         tbyte ptr ds:[6151E0];0.1:Extended
 00615091    fcomp       qword ptr [ebx+248]
 00615097    wait
 00615098    fnstsw      al
 0061509A    sahf
>0061509B    jbe         006150A6
 0061509D    cmp         byte ptr [ebx+25F],0
>006150A4    je          006150AA
 006150A6    xor         eax,eax
>006150A8    jmp         006150AC
 006150AA    mov         al,1
 006150AC    mov         byte ptr [ebx+263],al
 006150B2    fld         qword ptr [ebx+238]
 006150B8    fcomp       dword ptr ds:[6151D4];1:Single
 006150BE    wait
 006150BF    fnstsw      al
 006150C1    sahf
>006150C2    ja          006150E3
 006150C4    fld         tbyte ptr ds:[6151EC];0.9:Extended
 006150CA    fcomp       qword ptr [ebx+248]
 006150D0    wait
 006150D1    fnstsw      al
 006150D3    sahf
>006150D4    jae         006150DF
 006150D6    cmp         byte ptr [ebx+25F],0
>006150DD    je          006150E3
 006150DF    xor         eax,eax
>006150E1    jmp         006150E5
 006150E3    mov         al,1
 006150E5    mov         byte ptr [ebx+264],al
 006150EB    add         esp,2C
 006150EE    pop         ebx
 006150EF    ret
end;*}

//006151F8
procedure sub_006151F8;
begin
{*
 006151F8    push        ebx
 006151F9    push        esi
 006151FA    mov         esi,10
 006151FF    mov         ebx,817A88;gvar_00817A88:TAccelerometers
 00615204    mov         dl,1
 00615206    mov         eax,[005E1080];TAccelerometers
 0061520B    call        TAccelerometers.Create;TAccelerometers.Create
 00615210    mov         dword ptr [ebx],eax
 00615212    add         ebx,5D0
 00615218    dec         esi
>00615219    jne         00615204
 0061521B    pop         esi
 0061521C    pop         ebx
 0061521D    ret
*}
end;

//00615220
{*function sub_00615220(?:Boolean):?;
begin
 00615220    push        ebx
 00615221    push        esi
 00615222    push        edi
 00615223    mov         edi,8179A0;gvar_0078D490
 00615228    mov         esi,81D6A0;gvar_0081D6A0:Single
 0061522D    mov         bl,1
 0061522F    imul        eax,dword ptr [esi],0BA
 00615235    mov         eax,dword ptr [edi+eax*8-4E8]
 0061523C    call        TAccelerometers.Reset
 00615241    imul        eax,dword ptr [esi],0BA
 00615247    mov         byte ptr [edi+eax*8-5B2],0
 0061524F    mov         dword ptr [edi+eax*8-5CC],0FFFFFFFF
 0061525A    mov         dword ptr [edi+eax*8-5B8],0D
 00615265    mov         byte ptr [edi+eax*8-5B0],28
 0061526D    mov         byte ptr [edi+eax*8-5A6],0
 00615275    mov         byte ptr [edi+eax*8-5A7],0
 0061527D    xor         edx,edx
 0061527F    mov         dword ptr [edi+eax*8-368],edx
 00615286    mov         dword ptr [edi+eax*8-364],edx
 0061528D    mov         byte ptr [edi+eax*8-5A9],0
 00615295    xor         edx,edx
 00615297    mov         dword ptr [edi+eax*8-598],edx
 0061529E    mov         dword ptr [edi+eax*8-594],0BFF00000
 006152A9    xor         edx,edx
 006152AB    mov         dword ptr [edi+eax*8-590],edx
 006152B2    mov         dword ptr [edi+eax*8-58C],0BFF00000
 006152BD    xor         edx,edx
 006152BF    mov         dword ptr [edi+eax*8-588],edx
 006152C6    mov         dword ptr [edi+eax*8-584],0BFF00000
 006152D1    xor         edx,edx
 006152D3    mov         dword ptr [edi+eax*8-4B0],edx
 006152DA    mov         dword ptr [edi+eax*8-4AC],edx
 006152E1    xor         edx,edx
 006152E3    mov         dword ptr [edi+eax*8-4A8],edx
 006152EA    mov         dword ptr [edi+eax*8-4A4],3FF00000
 006152F5    xor         edx,edx
 006152F7    mov         dword ptr [edi+eax*8-4A0],edx
 006152FE    mov         dword ptr [edi+eax*8-49C],edx
 00615305    xor         edx,edx
 00615307    mov         dword ptr [edi+eax*8-4C8],edx
 0061530E    mov         dword ptr [edi+eax*8-4C4],edx
 00615315    xor         edx,edx
 00615317    mov         dword ptr [edi+eax*8-4C0],edx
 0061531E    mov         dword ptr [edi+eax*8-4BC],3FF00000
 00615329    xor         edx,edx
 0061532B    mov         dword ptr [edi+eax*8-4B8],edx
 00615332    mov         dword ptr [edi+eax*8-4B4],edx
 00615339    mov         word ptr [edi+eax*8-538],0
 00615343    mov         byte ptr [edi+eax*8-535],0
 0061534B    mov         byte ptr [edi+eax*8-534],0
 00615353    mov         byte ptr [edi+eax*8-533],0
 0061535B    mov         byte ptr [edi+eax*8-532],0FF
 00615363    xor         edx,edx
 00615365    mov         dword ptr [edi+eax*8-5BC],edx
 0061536C    mov         byte ptr [edi+eax*8-5A4],0F0
 00615374    xor         edx,edx
 00615376    mov         dword ptr [edi+eax*8-480],edx
 0061537D    mov         dword ptr [edi+eax*8-47C],edx
 00615384    xor         edx,edx
 00615386    mov         dword ptr [edi+eax*8-478],edx
 0061538D    mov         dword ptr [edi+eax*8-474],edx
 00615394    xor         edx,edx
 00615396    mov         dword ptr [edi+eax*8-470],edx
 0061539D    mov         dword ptr [edi+eax*8-46C],edx
 006153A4    xor         edx,edx
 006153A6    mov         dword ptr [edi+eax*8-468],edx
 006153AD    mov         dword ptr [edi+eax*8-464],edx
 006153B4    xor         edx,edx
 006153B6    mov         dword ptr [edi+eax*8-460],edx
 006153BD    mov         dword ptr [edi+eax*8-45C],edx
 006153C4    xor         edx,edx
 006153C6    mov         dword ptr [edi+eax*8-458],edx
 006153CD    mov         dword ptr [edi+eax*8-454],edx
 006153D4    xor         edx,edx
 006153D6    mov         dword ptr [edi+eax*8-450],edx
 006153DD    mov         dword ptr [edi+eax*8-44C],edx
 006153E4    lea         eax,[edi+eax*8-210]
 006153EB    mov         edx,1E
 006153F0    call        0068BF04
 006153F5    imul        eax,dword ptr [esi],0BA
 006153FB    lea         eax,[edi+eax*8-108]
 00615402    mov         edx,1E
 00615407    call        0068BF04
 0061540C    imul        eax,dword ptr [esi],0BA
 00615412    lea         eax,[edi+eax*8-348]
 00615419    xor         ecx,ecx
 0061541B    mov         edx,98
 00615420    call        @FillChar
 00615425    imul        eax,dword ptr [esi],0BA
 0061542B    lea         eax,[edi+eax*8-531]
 00615432    xor         ecx,ecx
 00615434    mov         edx,15
 00615439    call        @FillChar
 0061543E    mov         eax,ebx
 00615440    pop         edi
 00615441    pop         esi
 00615442    pop         ebx
 00615443    ret
end;*}

Initialization
//00781BD4
{*
 00781BD4    push        ebp
 00781BD5    mov         ebp,esp
 00781BD7    xor         eax,eax
 00781BD9    push        ebp
 00781BDA    push        781C1C
 00781BDF    push        dword ptr fs:[eax]
 00781BE2    mov         dword ptr fs:[eax],esp
 00781BE5    sub         dword ptr ds:[81D880],1
>00781BEC    jae         00781C0E
 00781BEE    mov         dl,1
 00781BF0    mov         eax,[0067D4A4];THashTable
 00781BF5    call        THashTable.Create;THashTable.Create
 00781BFA    mov         [00817990],eax;gvar_00817990:THashTable
 00781BFF    call        00609390
 00781C04    call        00613D10
 00781C09    call        006151F8
 00781C0E    xor         eax,eax
 00781C10    pop         edx
 00781C11    pop         ecx
 00781C12    pop         ecx
 00781C13    mov         dword ptr fs:[eax],edx
 00781C16    push        781C23
 00781C1B    ret
>00781C1C    jmp         @HandleFinally
>00781C21    jmp         00781C1B
 00781C23    pop         ebp
 00781C24    ret
*}
Finalization
//00615444
{*
 00615444    push        ebp
 00615445    mov         ebp,esp
 00615447    xor         eax,eax
 00615449    push        ebp
 0061544A    push        6154AC
 0061544F    push        dword ptr fs:[eax]
 00615452    mov         dword ptr fs:[eax],esp
 00615455    inc         dword ptr ds:[81D880]
>0061545B    jne         0061549E
 0061545D    mov         eax,[00817990];gvar_00817990:THashTable
 00615462    xor         edx,edx
 00615464    mov         dword ptr ds:[817990],edx;gvar_00817990:THashTable
 0061546A    call        TObject.Free
 0061546F    call        00612600
 00615474    mov         eax,8179A0;gvar_0078D490
 00615479    mov         ecx,10
 0061547E    mov         edx,dword ptr ds:[605D38];TWiimoteOldState
 00615484    call        @FinalizeArray
 00615489    mov         eax,81D6A4;gvar_0081D6A4:array[16] of ?
 0061548E    mov         ecx,10
 00615493    mov         edx,dword ptr ds:[605C54];TSixaxisOldState
 00615499    call        @FinalizeArray
 0061549E    xor         eax,eax
 006154A0    pop         edx
 006154A1    pop         ecx
 006154A2    pop         ecx
 006154A3    mov         dword ptr fs:[eax],edx
 006154A6    push        6154B3
 006154AB    ret
>006154AC    jmp         @HandleFinally
>006154B1    jmp         006154AB
 006154B3    pop         ebp
 006154B4    ret
*}
end.