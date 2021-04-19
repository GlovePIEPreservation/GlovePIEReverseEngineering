//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit113;

interface

uses
  SysUtils, Classes, WiimoteSpeakerUnit, WiimoteClassUnit, PS3ClassUnit, PieSixaxis;

type
  TUsb_device_descriptor = TUsb_device_descriptor = record//size=12
bLength:Byte;//f0
bDescriptorType:Byte;//f1
bcdUSB:Word;//f2
bDeviceClass:Byte;//f4
bDeviceSubClass:Byte;//f5
bDeviceProtocol:Byte;//f6
bMaxPacketSize0:Byte;//f7
idVendor:Word;//f8
idProduct:Word;//fA
bcdDevice:Word;//fC
iManufacturer:Byte;//fE
iProduct:Byte;//fF
iSerialNumber:Byte;//f10
bNumConfigurations:Byte;//f11
end;;
  TUsb_endpoint_descriptor = TUsb_endpoint_descriptor = record//size=11
bLength:Byte;//f0
bDescriptorType:Byte;//f1
bEndpointAddress:Byte;//f2
bmAttributes:Byte;//f3
wMaxPacketSize:Word;//f4
bInterval:Byte;//f6
bRefresh:Byte;//f7
bSynchAddress:Byte;//f8
extra:PByte;//f9
extralen:Integer;//fD
end;;
  TUsb_interface_descriptor = TUsb_interface_descriptor = record//size=15
bLength:Byte;//f0
bDescriptorType:Byte;//f1
bInterfaceNumber:Byte;//f2
bAlternateSetting:Byte;//f3
bNumEndpoints:Byte;//f4
bInterfaceClass:Byte;//f5
bInterfaceSubClass:Byte;//f6
bInterfaceProtocol:Byte;//f7
iInterface:Byte;//f8
endpoint:PUsb_endpoint_descriptor;//f9
extra:PByte;//fD
extralen:Integer;//f11
end;;
  TUsb_interface = TUsb_interface = record//size=8
altsetting:PUsb_interface_descriptor;//f0
num_alt_setting:Integer;//f4
end;;
  TArray_TUsb_interface = array [1..32] of TUsb_interface;
  TUsb_config_descriptor = TUsb_config_descriptor = record//size=15
bLength:Byte;//f0
bDescriptorType:Byte;//f1
wTotalLength:Word;//f2
bNumInterfaces:Byte;//f4
bConfigurationValue:Byte;//f5
iConfiguration:Byte;//f6
bmAttributes:Byte;//f7
MaxPower:Byte;//f8
interfaces:PArray_TUsb_interface;//f9
extra:PByte;//fD
extralen:Integer;//f11
end;;
  TUsb_bus = TUsb_bus = record//size=214
next:PUsb_bus;//f0
prev:PUsb_bus;//f4
dirname:?;//f8
devices:PUsb_device;//f208
location:Cardinal;//f20C
root_dev:PUsb_device;//f210
end;;
  TUsb_device = TUsb_device = record//size=22C
next:PUsb_device;//f0
prev:PUsb_device;//f4
filename:?;//f8
bus:PUsb_bus;//f208
descriptor:TUsb_device_descriptor;//f20C
config:PUsb_config_descriptor;//f21E
dev:Pointer;//f222
devnum:Byte;//f226
num_children:Byte;//f227
children:PPUsb_device;//f228
end;;
  TWiimoteSpeakerThread = class(TThread)
  public
    Rumble:Boolean;//f40
    Handle:Cardinal;//f44
    PhasePerSample:Double;//f48
    SampleRate:Double;//f50
    f54:dword;//f54
    procedure Execute; virtual;//v4//00619D50
  end;
  TExpBytes = array [1..21] of Byte;
  TNunchukObject = class(TAccelerometerObject)
  published
    procedure Stick3DY;//00625CB4
    procedure Stick3DZ;//00625CEC
    function Stick3DX:Double;//00625C7C
    function StickX:Double;//00625D24
    function StickY:Double;//00625E00
    function Up:Boolean;//00626070
    procedure SwingVertically;//00625EDC
    procedure SetCalibrated(c:Boolean);//00625C30
    function Right:Boolean;//00625B7C
    function Down:Boolean;//00625570
    function Left:Boolean;//00625650
    procedure ReceiveExpansionData(ExpBytes:TExpBytes);//00625704
    procedure ReceivePassThroughData(ExpBytes:TExpBytes);//00625948
    procedure Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);//00625168
    constructor Create(Wiimote:TObject);//00625524
    procedure Clear;//006254E0
    function C:Boolean;//00625134
    function FX:Boolean;//00625624
    function Classic:Boolean;//00625484
    function ZPrev:Boolean;//00626158
    function Z:Boolean;//00626124
    function CPrev:Boolean;//006254F0
  public
    Wiimote:TWiimoteObject;//f440
    Exists:Boolean;//f444
    PassThrough:Boolean;//f445
    Calibrated:Boolean;//f446
    JoyX:SmallInt;//f448
    JoyY:SmallInt;//f44A
    JoyZeroX:SmallInt;//f44C
    JoyZeroY:SmallInt;//f44E
    JoyMaxX:SmallInt;//f450
    JoyMaxY:SmallInt;//f452
    JoyMinX:SmallInt;//f454
    JoyMinY:SmallInt;//f456
    ButtonC:Boolean;//f458
    ButtonZ:Boolean;//f459
    ButtonCPrev:Boolean;//f45A
    ButtonZPrev:Boolean;//f45B
    ReportCount:Integer;//f45C
    procedure SwingVertically; virtual;//vC//00625EDC
  end;
  TClassicObject = class(TObject)
  published
    function LFullPrev:Boolean;//00626520
    procedure RPrev;//00626AB0
    procedure LPrev;//00626530
    function PlusPrev:Boolean;//00626584
    function MinusPrev:Boolean;//0062655C
    function RFullPrev:Boolean;//00626954
    function XPrev:Boolean;//00626B4C
    function BPrev:Boolean;//006261BC
    function APrev:Boolean;//0062619C
    function ZRPrev:Boolean;//00626BAC
    function ZLPrev:Boolean;//00626B8C
    function YPrev:Boolean;//00626B6C
    function LeftStickX:Double;//006263E4
    function DPadY:Integer;//00626368
    function DPadX:Integer;//00626348
    function RightStickY:Double;//00626A18
    function RightStickX:Double;//00626984
    function LeftStickY:Double;//00626478
    function UpPrev:Boolean;//00626B2C
    function UnusedPrev:Boolean;//00626B0C
    function HOMEPrev:Boolean;//00626398
    function RightPrev:Boolean;//00626974
    function LeftPrev:Boolean;//006263D4
    function DownPrev:Boolean;//00626338
    function X:Boolean;//00626B3C
    function B:Boolean;//006261AC
    function A:Boolean;//0062618C
    function ZR:Boolean;//00626B9C
    function ZL:Boolean;//00626B7C
    function Y:Boolean;//00626B5C
    procedure Clear;//006262B8
    constructor Create(Wiimote:TObject);//006262F0
    procedure SetNumber(Value:Integer);//00626ACC
    procedure ReceivePassThroughData(ExpBytes:TExpBytes);//00626740
    procedure ReceiveExpansionData(ExpBytes:TExpBytes);//006265B8
    procedure Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);//006261CC
    function Up:Boolean;//00626B1C
    function Unused:Boolean;//00626AFC
    function HOME:Boolean;//00626388
    function Right:Boolean;//00626964
    function Left:Boolean;//006263C4
    function Down:Boolean;//00626328
    function LFull:Boolean;//00626510
    function R:Double;//0062659C
    function L:Double;//006263A8
    function Plus:Boolean;//0062656C
    function Minus:Boolean;//0062654C
    function RFull:Boolean;//00626944
  public
    Wiimote:TWiimoteObject;//f4
    Exists:Boolean;//f8
    PassThrough:Boolean;//f9
    FNumber:Integer;//fC
    Joy1X:SmallInt;//f10
    Joy1Y:SmallInt;//f12
    Joy1ZeroX:SmallInt;//f14
    Joy1ZeroY:SmallInt;//f16
    Joy1MinX:SmallInt;//f18
    Joy1MinY:SmallInt;//f1A
    Joy1MaxX:SmallInt;//f1C
    Joy1MaxY:SmallInt;//f1E
    Joy2X:SmallInt;//f20
    Joy2Y:SmallInt;//f22
    Joy2ZeroX:SmallInt;//f24
    Joy2ZeroY:SmallInt;//f26
    Joy2MinX:SmallInt;//f28
    Joy2MinY:SmallInt;//f2A
    Joy2MaxX:SmallInt;//f2C
    Joy2MaxY:SmallInt;//f2E
    FL:SmallInt;//f30
    FR:SmallInt;//f32
    OldFL:SmallInt;//f34
    OldFR:SmallInt;//f36
    Buttons:word;//f38
    f39:byte;//f39
    OldButtons:word;//f3A
    f3B:byte;//f3B
  end;
  TGuitarObject = class(TObject)
  published
    function TouchFret4:Boolean;//006274C0
    function TouchFret5:Boolean;//006274C8
    function Plus:Boolean;//0062721C
    function TouchFret1:Boolean;//006274A8
    function TouchFret2:Boolean;//006274B0
    function TouchFret3:Boolean;//006274B8
    function TouchBar:Double;//00627474
    function RawTouchBar:Integer;//0062722C
    function WhammyBar:Double;//006274D0
    function Minus:Boolean;//0062720C
    function StickX:Double;//00627390
    function StickY:Double;//006273F0
    procedure Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);//00627144
    procedure ReceiveExpansionData(ExpBytes:TExpBytes);//00627238
    function StrumUp:Boolean;//00627464
    procedure SetNumber(Value:Integer);//00627360
    constructor Create(Wiimote:TObject);//00627184
    procedure Clear;//0062714C
    function Fret3:Boolean;//006271DC
    function Fret4:Boolean;//006271EC
    function Fret5:Boolean;//006271FC
    function StrumDown:Boolean;//00627454
    function Fret1:Boolean;//006271BC
    function Fret2:Boolean;//006271CC
  public
    Wiimote:TWiimoteObject;//f4
    Exists:Boolean;//f8
    PassThrough:Boolean;//f9
    FNumber:Integer;//fC
    Joy1X:SmallInt;//f10
    Joy1Y:SmallInt;//f12
    FWhammy:SmallInt;//f14
    Buttons:word;//f16
    f17:byte;//f17
    FTouch:byte;//f18
    TF1:Boolean;//f19
    TF2:Boolean;//f1A
    TF3:Boolean;//f1B
    TF4:Boolean;//f1C
    TF5:Boolean;//f1D
    IsWorldTour:Boolean;//f1E
  end;
  TDrumsObject = class(TObject)
  published
    function StickY:Double;//0062795C
    procedure WhammyBar;//006279E0
    procedure Speed;//006278D8
    function Plus:Boolean;//00627698
    function Minus:Boolean;//00627630
    function StickX:Double;//006278FC
    function RedSpeed:Double;//00627884
    function OrangeSpeed:Double;//00627650
    function PedalSpeed:Double;//00627674
    function HiHatSpeed:Double;//0062760C
    function BlueSpeed:Double;//0062751C
    function GreenSpeed:Double;//006275D8
    function YellowSpeed:Double;//00627A1C
    function HiHat:Boolean;//006275FC
    procedure Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);//00627540
    procedure ReceiveExpansionData(ExpBytes:TExpBytes);//006276A8
    function StrumUp:Boolean;//006279D0
    procedure SetNumber(Value:Integer);//006278A8
    constructor Create(Wiimote:TObject);//00627590
    procedure Clear;//00627548
    function StrumDown:Boolean;//006279C0
    function Green:Boolean;//006275C8
    function Blue:Boolean;//0062750C
    function Bass:Boolean;//006274FC
    function Orange:Boolean;//00627640
    function Red:Boolean;//00627874
    function Yellow:Boolean;//00627A0C
  public
    Wiimote:TWiimoteObject;//f4
    Exists:Boolean;//f8
    PassThrough:Boolean;//f9
    FNumber:Integer;//fC
    Joy1X:SmallInt;//f10
    Joy1Y:SmallInt;//f12
    Joy1ZeroX:SmallInt;//f14
    Joy1ZeroY:SmallInt;//f16
    Joy1MinX:SmallInt;//f18
    Joy1MinY:SmallInt;//f1A
    Joy1MaxX:SmallInt;//f1C
    Joy1MaxY:SmallInt;//f1E
    Joy2X:SmallInt;//f20
    Joy2Y:SmallInt;//f22
    Joy2ZeroX:SmallInt;//f24
    Joy2ZeroY:SmallInt;//f26
    Joy2MinX:SmallInt;//f28
    Joy2MinY:SmallInt;//f2A
    Joy2MaxX:SmallInt;//f2C
    Joy2MaxY:SmallInt;//f2E
    FL:SmallInt;//f30
    FR:SmallInt;//f32
    Buttons:word;//f34
    f35:byte;//f35
    Which:byte;//f36
    FSpeed:byte;//f37
    FRedSpeed:byte;//f38
    FBlueSpeed:byte;//f39
    FGreenSpeed:byte;//f3A
    FYellowSpeed:byte;//f3B
    FOrangeSpeed:byte;//f3C
    FPedalSpeed:byte;//f3D
    FHiHatSpeed:byte;//f3E
    HHP:Boolean;//f3F
    HasSpeed:Boolean;//f40
  end;
  TTurntableObject = class(TObject)
  published
    function LeftGreen:Boolean;//00627D40
    function LeftBlue:Boolean;//00627D2C
    function LeftRed:Boolean;//00627D54
    function StickY:Double;//00627EBC
    function QuestionQuestion:Boolean;//00627D90
    function RawRightTurntable:Integer;//00627DAC
    function RawLeftTurntable:Integer;//00627DA4
    function RightBlue:Boolean;//00627DF0
    function RightRed:Boolean;//00627E18
    function RightGreen:Boolean;//00627E04
    function StickX:Double;//00627E5C
    procedure Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);//00627C54
    procedure ReceiveExpansionData(ExpBytes:TExpBytes);//00627DB4
    procedure Clear;//00627C5C
    procedure SetNumber(Value:Integer);//00627E2C
    constructor Create(Wiimote:TObject);//00627C84
    function EffectDial:Double;//00627CF4
    function CrossFade:Double;//00627CBC
    function Minus:Boolean;//00627D68
    function Euphoria:Boolean;//00627D18
    function Plus:Boolean;//00627D7C
  public
    Wiimote:TWiimoteObject;//f4
    Exists:Boolean;//f8
    PassThrough:Boolean;//f9
    FNumber:Integer;//fC
    Joy1X:SmallInt;//f10
    Joy1Y:SmallInt;//f12
    Buttons:word;//f14
    f15:byte;//f15
    CS:byte;//f16
    ED:byte;//f17
    LTT:byte;//f18
    RTT:byte;//f19
  end;
  TBalanceBoardObject = class(TObject)
  published
    function WeightLeft:Double;//006270F0
    function Weight:Double;//006270AC
    function JoyY:Double;//00626EBC
    function WeightBottom:Double;//006270D4
    function WeightTop:Double;//00627128
    function WeightRight:Double;//0062710C
    function JoyX:Double;//00626E60
    procedure Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);//00626BBC
    procedure Clear;//00626E34
    constructor Create(Wiimote:TObject);//00626E3C
    procedure ReceiveExpansionData(ExpBytes:TExpBytes);//00626F18
    procedure SetNumber(Value:Integer);//0062707C
    procedure Calibrate2(Report:PByteArray; AlreadyDecoded:Boolean);//00626CA0
  public
    Wiimote:TWiimoteObject;//f4
    Exists:Boolean;//f8
    FNumber:Integer;//fC
    PreCalib:word;//f10
    PreCalibZero:word;//f12
    PostCalib1:word;//f14
    PostCalib2:word;//f16
    Calib:?;//f18
    f20:word;//f20
    f22:word;//f22
    f24:word;//f24
    f26:word;//f26
    f28:word;//f28
    f2A:word;//f2A
    f2C:word;//f2C
    f2E:word;//f2E
    NewtonFormCoefficients:?;//f30
    f38:Double;//f38
    f40:Double;//f40
    f48:Double;//f48
    f50:Double;//f50
    f58:Double;//f58
    f60:Double;//f60
    f68:Double;//f68
    f70:Double;//f70
    f78:Double;//f78
    f80:Double;//f80
    f88:Double;//f88
    RawTopRight:Double;//f90
    RawTopLeft:Double;//f98
    RawBottomRight:Double;//fA0
    RawBottomLeft:Double;//fA8
    WeightTopRight:Double;//fB0
    WeightTopLeft:Double;//fB8
    WeightBottomRight:Double;//fC0
    WeightBottomLeft:Double;//fC8
    QuestionQuestion:word;//fD0
    EE:byte;//fD2
  end;
  TMotionPlusObject = class(TObject)
  published
    procedure Calibrate2(Report:PByteArray; AlreadyDecoded:Boolean);//00627A54
    procedure ReceiveExpansionData(ExpBytes:TExpBytes);//00627B28
    procedure Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);//00627A40
    constructor Create(Wiimote:TObject);//00627B04
    procedure Clear;//00627A74
  public
    Wiimote:TWiimoteObject;//f4
    Exists:Boolean;//f8
    Active:Boolean;//f9
    Calib:?;//fA
    //f1A:?;//f1A
    Data:?;//f2A
    A:Double;//fB0
    fB4:dword;//fB4
    B:Double;//fB8
    fBC:dword;//fBC
    C:Double;//fC0
    fC4:dword;//fC4
  end;
  TWiimoteObject = class(TAccelerometerObject)
  published
    procedure SetPlayerLed(Value:ShortInt);//00623638
    //procedure SetLedLevel(Value:Double; ?:?);//006230B0
    //procedure SetLedDrumLevel(Value:Double; ?:?);//00622EAC
    constructor Create(Manager:TComponent; Device:TObject);//0061FB18
    destructor Destroy();//0061FD8C
    procedure SetNumber(Value:Integer);//0062360C
    procedure UpdateIR;//00623F80
    function A:Boolean;//0061F8F8
    function B:Boolean;//0061F9BC
    function Minus:Boolean;//006206D0
    //procedure InByteString(?:?);//006205F0
    //procedure ExpString(?:?);//00620598
    //procedure BladeFxOverflowString(?:?);//0061F9D4
    procedure SetLeds(NewLeds:Byte);//006232B4
    procedure ReceiveMotionPlusCalibrationReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00621FA0
    procedure ReceiveMotionPlusCalibrationReport2(ReportID:Integer; Report:PByteArray; Size:Integer);//00621FD0
    procedure ReceiveExpansionTypeReport(ReportID:Integer; Report:PByteArray; Size:Integer);//006217BC
    procedure ReceiveWiimoteCalibrationReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00622734
    procedure ReceiveExpansionCalibrationReport(ReportID:Integer; Report:PByteArray; Size:Integer);//0062152C
    procedure ReceiveExpansionCalibrationReport2(ReportID:Integer; Report:PByteArray; Size:Integer);//00621770
    procedure ReceiveMotionPlusTypeReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00622010
    procedure ReceiveButtons(ReportID:Integer; Report:PByteArray; Size:Integer);//00620A68
    procedure DisableIR;//0061FE0C
    procedure DisableExpansion;//0061FE08
    procedure ReceiveBladeFXOverflowReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00620A2C
    procedure ReceiveMiiReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00621F98
    procedure ReceiveWriteConfirmationReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00622900
    function LeftPrev:Boolean;//006206B8
    function RightPrev:Boolean;//00622D44
    function DPadX:Integer;//006200C8
    function TwoPrev:Boolean;//00623EC0
    function UpPrev:Boolean;//00625104
    function DownPrev:Boolean;//0061FFD8
    function DPadY:Integer;//006200E8
    function CrossArms:Boolean;//0061FD0C
    function DrumRoll:Boolean;//00620108
    procedure ShowCalibrating(value:Boolean);//00623CF4
    function DPad3DX:Double;//0061FFF0
    procedure DPad3DY;//00620038
    procedure DPad3DZ;//00620080
    function OnePrev:Boolean;//00620718
    function Two:Boolean;//00623EA8
    function Up:Boolean;//00623F68
    function Down:Boolean;//0061FFC0
    function Plus:Boolean;//006207FC
    function HOME:Boolean;//006205C0
    function One:Boolean;//00620700
    function Left:Boolean;//006206A0
    function MinusPrev:Boolean;//006206E8
    function PlusPrev:Boolean;//00620814
    function HOMEPrev:Boolean;//006205D8
    function Right:Boolean;//00622D2C
    function APrev:Boolean;//0061F9A4
    function BPrev:Boolean;//0061FAB4
    procedure ReadWiimote;//006208B4
    procedure PerformNullUpdates;//00620730
    procedure DoNullUpdate;//0061FEBC
    function HasBladeFX:Boolean;//006205B4
    function ClassicButton:Boolean;//0061FACC
    function WirelessNunchuk:Boolean;//0062511C
    function TestConnection:Integer;//00623E6C
    //function RequestExpansionType:?;//00622AF4
    //function RequestMotionPlusType:?;//00622BFC
    //function RequestExpansionCalibration:?;//00622A70
    procedure Connect;//0061FB14
    procedure RequestStatusReport;//00622C84
    procedure RequestWiimoteCalibration;//00622CA8
    procedure SensorBarSeparation;//00622D5C
    procedure DisableSpeaker;//0061FE64
    procedure SetSpeaker(SpeakerOn:Boolean);//00623C4C
    procedure SetMute(MuteOn:Boolean);//006235DC
    procedure StartSpeaker;//00623D4C
    procedure StopSpeaker;//00623DD4
    procedure EnableSpeaker;//00620228
    //procedure SetFrequency(NewFrequency:Double; ?:?);//00622DD0
    procedure SetSampleRateWord(Number:Integer);//00623BE4
    procedure UpdateSpeakerThread;//006250F0
    procedure ShowConnecting;//00623D1C
    //procedure SetSampleRate(NewSampleRate:Double; ?:?);//00623B2C
    //procedure SetVolume(NewVolume:Double; ?:?);//00623C68
    procedure SetSampleRateNumber(Number:Integer);//00623B80
    procedure QuickPoke(addr:Cardinal; value:Byte);//0062083C
    procedure SetMode;//00623474
    procedure Stop;//00623D9C
    procedure SetChannel(value:Byte);//00622D74
    procedure SetRumble(value:Boolean);//00623AD8
    procedure Poke(addr:Cardinal; value:Byte);//0062082C
    procedure SwitchOff;//00623DEC
    procedure ReceiveReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00622214
    procedure ReceiveDataReport(ReportID:Integer; Report:PByteArray; Size:Integer);//00620ABC
    procedure ReceiveStatusReport(ReportID:Integer; Report:PByteArray; Size:Integer);//006224F8
    procedure EnableNintendoExpansion;//00620218
    procedure EnableThirdPartyExpansion;//006203E8
    procedure EnableBladeFX;//00620184
    procedure SetReport1A(value:Byte);//00623A90
    procedure ActivateMotionPlus;//0061F93C
    procedure ActivateNunchukPassThrough;//0061F950
    procedure ActivateClassicPassThrough;//0061F910
    procedure RequestBalanceBoardCalibration;//0062296C
    procedure RequestMotionPlusCalibration;//00622B78
    procedure RequestBladeFxBufferOverflow;//006229E8
    procedure ActivateRealExpansion;//0061F988
    procedure SetReport14(value:Byte);//006239A8
    procedure SetReport15(value:Byte);//006239FC
    procedure SetReport19(value:Byte);//00623A3C
    //function EnableIR:?;//0062033C
    procedure SetReport11(value:Byte);//00623918
    procedure SetReport13(value:Byte);//00623960
  public
    ReceivedAnyMessage:Boolean;//f440
    ReceivedStatusMessage:Boolean;//f441
    ReceivedStatusError:Boolean;//f442
    ReceivedAdvancedMessage:Boolean;//f443
    FUseWiimote:Boolean;//f444
    FUseForce:Boolean;//f445
    FUseIR:Boolean;//f446
    FUseExpansion:Boolean;//f447
    FUseMotionPlus:Boolean;//f448
    FUseSpeaker:Boolean;//f449
    FUse3F:Boolean;//f44A
    NeedCalibration:Boolean;//f44B
    NeedExpansionType:Boolean;//f44C
    NeedMotionPlusType:Boolean;//f44D
    NeedExpansionCalibration:Boolean;//f44E
    NeedMotionPlusCalibration:Boolean;//f44F
    NeedChannel:Boolean;//f450
    NeedIR:Boolean;//f451
    DesiredChannel:byte;//f452
    OutReport11:Byte;//f453
    Channel:Integer;//f454
    OutReport13:Byte;//f455
    OutReport14:Byte;//f456
    OutReport15:Byte;//f457
    OutReport19:Byte;//f458
    OutReport1A:Byte;//f459
    SpeakerEnabled:Boolean;//f45A
    Muted:Boolean;//f45B
    InByte:?;//f45C
    //f45D:?;//f45D
    ExpBytes:TExpBytes;//f472
    FNumber:Integer;//f488
    FRumble:Boolean;//f48C
    FLeds:byte;//f48D
    FPlayerLed:ShortInt;//f48E
    FLedLevel:Double;//f490
    f494:dword;//f494
    FLedDrumLevel:Double;//f498
    f49C:dword;//f49C
    State:byte;//f4A0
    Battery:byte;//f4A1
    Expansion:byte;//f4A2
    Expansion2:byte;//f4A3
    Expansion3:byte;//f4A4
    MotionPlusType:byte;//f4A5
    MotionPlusType2:byte;//f4A6
    MotionPlusType3:byte;//f4A7
    AlreadyDecoded:Boolean;//f4A8
    BladeFXReplugged:Boolean;//f4A9
    ThirdParty:Boolean;//f4AA
    MustBeBladeFX:Boolean;//f4AB
    MotionPlusHasExpansion:Boolean;//f4AC
    ActivatingMotionPlus:Boolean;//f4AD
    DeactivatingMotionPlus:Boolean;//f4AE
    BladeFXConfidence:Integer;//f4B0
    Nunchuk:TNunchukObject;//f4B4
    Classic:TClassicObject;//f4B8
    Guitar:TGuitarObject;//f4BC
    Drums:TDrumsObject;//f4C0
    Turntable:TTurntableObject;//f4C4
    MotionPlus:TMotionPlusObject;//f4C8
    BalanceBoard:TBalanceBoardObject;//f4CC
    UseBuiltInCalibration:Boolean;//f4D0
    UpdateTime:Double;//f4D8
    f4DC:dword;//f4DC
    BladeFXDisconnectTime:Double;//f4E0
    f4E4:dword;//f4E4
    BladeFxOverflowTime:Double;//f4E8
    BladeFxBufferOverflow:?;//f4F0
    Buttons:word;//f580
    OldButtons:word;//f582
    x:Double;//f588
    f58C:dword;//f58C
    y:Double;//f590
    f594:dword;//f594
    z:Double;//f598
    f59C:dword;//f59C
    SpeakerThread:TThread;//f5A0
    Volume:Double;//f5A8
    f5AC:dword;//f5AC
    Frequency:Double;//f5B0
    f5B4:dword;//f5B4
    SampleRate:Double;//f5B8
    f5BC:dword;//f5BC
    RealSampleRate:Double;//f5C0
    f5C4:dword;//f5C4
    ReportInterval:Double;//f5C8
    SampleRateNumber:Integer;//f5D0
    SampleRateWord:Integer;//f5D2
    ContinuousReporting:Boolean;//f5D4
    Dots:?;//f5D5
    f5D9:Single;//f5D9
    f5DD:byte;//f5DD
    f5DE:byte;//f5DE
    f5DF:byte;//f5DF
    f5E1:Single;//f5E1
    f5E5:Single;//f5E5
    f5E9:byte;//f5E9
    f5EA:byte;//f5EA
    f5EB:byte;//f5EB
    f5ED:dword;//f5ED
    f5F1:dword;//f5F1
    f5F5:byte;//f5F5
    f5F6:byte;//f5F6
    f5F7:byte;//f5F7
    f5F9:dword;//f5F9
    f5FD:dword;//f5FD
    f601:byte;//f601
    f602:byte;//f602
    f603:byte;//f603
    PrevUpX:Double;//f608
    f60C:dword;//f60C
    PrevUpY:Double;//f610
    f614:dword;//f614
    PrevUpZ:Double;//f618
    f61C:dword;//f61C
    SinOfRoll:Double;//f620
    CosOfRoll:Double;//f628
    VarDot1x:Double;//f630
    f634:dword;//f634
    VarDot1y:Double;//f638
    f63C:dword;//f63C
    VarDot2x:Double;//f640
    f644:dword;//f644
    VarDot2y:Double;//f648
    f64C:dword;//f64C
    VarLeftDot:Integer;//f650
    VarLeftDotX:Double;//f658
    f65C:dword;//f65C
    VarLeftDotY:Double;//f660
    f664:dword;//f664
    VarRightDotX:Double;//f668
    f66C:dword;//f66C
    VarRightDotY:Double;//f670
    f674:dword;//f674
    VarMiddleDotX:Double;//f678
    VarMiddleDotY:Double;//f680
    varWiimoteYawNoX:Double;//f688
    varWiimoteXNoYaw:Double;//f690
    f694:dword;//f694
    varWiimoteY:Double;//f698
    f69C:dword;//f69C
    varWiimoteZ:Double;//f6A0
    f6A4:dword;//f6A4
    VarDotDeltaX:Double;//f6A8
    f6AC:dword;//f6AC
    VarDotDeltaY:Double;//f6B0
    f6B4:dword;//f6B4
    VarDotSep:Double;//f6B8
    VarIRDistance:Double;//f6C0
    VarTotalPitch:Double;//f6C8
    VarDotYaw:Double;//f6D0
    varIRPitchY:Double;//f6D8
    varIRx:Double;//f6E0
    f6E4:dword;//f6E4
    varIRy:Double;//f6E8
    f6EC:dword;//f6EC
    varLen:Double;//f6F0
    f6F4:dword;//f6F4
    VarLeftDotVis:Boolean;//f6F8
    VarRightDotVis:Boolean;//f6F9
    VarMiddleDotVis:Boolean;//f6FA
    VarIRvis:Boolean;//f6FB
    VarIROnScreen:Boolean;//f6FC
    varIRTooFarLeft:Boolean;//f6FD
    varIRTooFarRight:Boolean;//f6FE
    varIRTooFarUp:Boolean;//f6FF
    varIRTooFarDown:Boolean;//f700
    IRXSmoother:TSmoother;//f708
    IRYSmoother:TSmoother;//f810
    destructor Destroy(); virtual;//0061FD8C
    procedure ReceiveReport(ReportID:Integer; Report:PByteArray; Size:Integer); virtual;//v0//00622214
    procedure ShowCalibrating(value:Boolean); virtual;//v8//00623CF4
    function CrossArms:Boolean; virtual;//v10//0061FD0C
    function DrumRoll:Boolean; virtual;//v14//00620108
  end;
  TSixAxisOutput = TSixAxisOutput = record//size=29
FeatureSelect:Byte;//f0
SmallDuration:Byte;//f1
SmallVoltage:Byte;//f2
BigDuration:Byte;//f3
BigVoltage:Byte;//f4
noClue:Cardinal;//f5
Leds:Byte;//f9
Led:?;//fA
Changed:Boolean;//f28
end;;
  TSixAxisOutputReport = TSixAxisOutputReport = record//size=2A
ReportNumber:Byte;//f0
Report:TSixAxisOutput;//f1
end;;
  TPS3ControllerObject = class(TAccelerometerObject)
  published
    procedure L1Analog;//00629E84
    procedure L2Analog;//00629EB8
    procedure RightAnalog;//0062A374
    procedure DownAnalog;//00629BFC
    procedure LeftAnalog;//00629EF8
    procedure TriangleAnalog;//0062B4D0
    procedure R1Analog;//0062A100
    procedure SquareAnalog;//0062B3CC
    procedure CircleAnalog;//0062991C
    procedure CrossAnalog;//00629AF0
    function Cross:Boolean;//00629AE4
    function Square:Boolean;//0062B3C0
    function Circle:Boolean;//00629910
    function TButton:Boolean;//0062B4B8
    function MoveButton:Boolean;//0062A030
    function R3:Boolean;//0062A15C
    procedure UpAnalog;//0062B504
    function R2:Boolean;//0062A128
    function Triangle:Boolean;//0062B4C4
    function R1:Boolean;//0062A0F4
    procedure R2Analog;//0062A134
    function RightStickX:Double;//0062A444
    function RightStickY:Double;//0062A478
    function LeftStickY:Double;//00629FFC
    procedure LeftStick3DZ;//00629F90
    function LeftStickX:Double;//00629FC8
    function CrossArms:Boolean;//00629B18
    procedure UpdateSteering;//0062B52C
    procedure RightStick3DZ;//0062A40C
    function RightStick3DX:Double;//0062A39C
    procedure RightStick3DY;//0062A3D4
    function DPad3DX:Double;//00629C24
    procedure DPad3DY;//00629C64
    procedure DPadY;//00629D10
    procedure TAnalog;//0062B490
    procedure DPadX;//00629CE4
    function LeftStick3DX:Double;//00629F20
    procedure LeftStick3DY;//00629F58
    procedure ButtonsY;//006298E4
    procedure DPad3DZ;//00629CA4
    procedure ButtonsX;//006298B8
    function Start:Boolean;//0062B3F4
    function GetLed(Number:Byte):Boolean;//00629D3C
    //procedure SetLedFrequency(Number:ShortInt; Frequency:Double; ?:?);//0062A8FC
    procedure SetLed(Number:Byte; SwitchedOn:Boolean);//0062A4B8
    procedure ReceiveButtons(ReportID:Integer; Report:PByteArray; Size:Integer);//0062A1F0
    procedure SetLeds(NewLeds:Byte);//0062AC34
    procedure SetLedBlock1(Number:ShortInt; Block:Byte);//0062A998
    procedure SetLedBlock2(Number:ShortInt; Block:Byte);//0062A9D0
    function GetLedDuration(Number:ShortInt):Double;//00629D9C
    function GetLedFrequency(Number:ShortInt):Double;//00629E00
    //procedure SetLedDuration(Number:ShortInt; Duration:Double; ?:?);//0062A870
    procedure DoNullUpdate;//00629B6C
    //procedure SetRumble(value:Double; ?:?);//0062B2F4
    procedure PerformNullUpdates;//0062A058
    procedure ShowConnecting;//0062B38C
    procedure ReadSixaxis;//0062A168
    procedure ReceiveReport(ReportID:Integer; Report:PByteArray; Size:Integer);//0062A330
    procedure ReceiveDataReport(ReportID:Integer; Report:PByteArray; Size:Integer);//0062A23C
    procedure SwitchOff;//0062B438
    procedure SetMode;//0062ADE8
    procedure Stop;//0062B400
    procedure SetLedBlock3(Number:ShortInt; Block:Byte);//0062AA08
    function Left:Boolean;//00629EEC
    function Right:Boolean;//0062A368
    function Down:Boolean;//00629BF0
    procedure ShowCalibrating(value:Boolean);//0062B35C
    function Up:Boolean;//0062B4F8
    function Select:Boolean;//0062A4AC
    function PS:Boolean;//0062A0E8
    function L3:Boolean;//00629EE0
    function L1:Boolean;//00629E78
    function L2:Boolean;//00629EAC
    destructor Destroy();//00629B38
    procedure SetNumber(Value:Integer);//0062AFEC
    constructor sub_00629A14(Manager:TObject; Device:TObject);//00629A14
    function GetLedBlock(Number:ShortInt; Block:ShortInt):Byte;//00629D54
    constructor Create(Manager:TComponent; Dev:Pointer);//00629944
    //procedure InByteString(?:?);//00629E5C
    //procedure OutByteString(?:?);//0062A03C
    //procedure SetLedDrumLevel(Value:Double; ?:?);//0062A67C
    procedure SetPlayerLed(Value:ShortInt);//0062B020
    //procedure SetLedLevel(Value:Double; ?:?);//0062AA40
  public
    ReceivedAnyMessage:Boolean;//f440
    ReceivedStatusMessage:Boolean;//f441
    ReceivedStatusError:Boolean;//f442
    ReceivedAdvancedMessage:Boolean;//f443
    FeatureF5:?;//f444
    f446:byte;//f446
    f447:byte;//f447
    f448:byte;//f448
    f449:byte;//f449
    f44A:byte;//f44A
    f44B:byte;//f44B
    OutputReport:TSixAxisOutputReport;//f44C
    FUseSixaxis:Boolean;//f476
    FUseGyro:Boolean;//f477
    FUseDualShock3:Boolean;//f478
    FNumber:Integer;//f47C
    FRumble:Double;//f480
    f484:dword;//f484
    FLeds:byte;//f488
    FPlayerLed:ShortInt;//f489
    FLedLevel:Double;//f490
    f494:dword;//f494
    FLedDrumLevel:Double;//f498
    f49C:dword;//f49C
    UpdateTime:Double;//f4A0
    f4A4:dword;//f4A4
    Buttons:Cardinal;//f4A8
    f4A9:byte;//f4A9
    f4AA:byte;//f4AA
    OldButtons:Cardinal;//f4AC
    MinX:Double;//f4B0
    MaxX:Double;//f4B8
    MinY:Double;//f4C0
    MaxY:Double;//f4C8
    MinZ:Double;//f4D0
    MaxZ:Double;//f4D8
    Report:?;//f4E0
    f4E6:byte;//f4E6
    f4E7:byte;//f4E7
    f4E8:byte;//f4E8
    f4E9:byte;//f4E9
    f4EE:byte;//f4EE
    f4EF:byte;//f4EF
    f4F0:byte;//f4F0
    f4F1:byte;//f4F1
    f4F2:byte;//f4F2
    f4F3:byte;//f4F3
    f4F4:byte;//f4F4
    f4F5:byte;//f4F5
    f4F6:byte;//f4F6
    f4F7:byte;//f4F7
    f4F8:byte;//f4F8
    f4F9:byte;//f4F9
    destructor Destroy(); virtual;//00629B38
    procedure ReceiveReport(ReportID:Integer; Report:PByteArray; Size:Integer); virtual;//v0//0062A330
    procedure UpdateSteering; virtual;//v4//0062B52C
    procedure ShowCalibrating(value:Boolean); virtual;//v8//0062B35C
    function CrossArms:Boolean; virtual;//v10//00629B18
    procedure ShowConnecting; virtual;//v18//0062B38C
    procedure ReadSixaxis; virtual;//v1C//0062A168
    procedure PerformNullUpdates; virtual;//v20//0062A058
    procedure DoNullUpdate; virtual;//v24//00629B6C
    //procedure SetRumble(value:Double; ?:?); virtual;//v28//0062B2F4
    procedure SetMode; virtual;//v2C//0062ADE8
    procedure SwitchOff; virtual;//v30//0062B438
    procedure ReceiveDataReport(ReportID:Integer; Report:PByteArray; Size:Integer); virtual;//v34//0062A23C
    procedure ReceiveButtons(ReportID:Integer; Report:PByteArray; Size:Integer); virtual;//v38//0062A1F0
    procedure SetLeds(NewLeds:Byte); virtual;//v3C//0062AC34
    procedure SetNumber(Value:Integer); virtual;//v40//0062AFEC
    procedure SetPlayerLed(Value:ShortInt); virtual;//v44//0062B020
    //procedure SetLedLevel(Value:Double; ?:?); virtual;//v48//0062AA40
    //procedure SetLedDrumLevel(Value:Double; ?:?); virtual;//v4C//0062A67C
    //procedure OutByteString(?:?); virtual;//v50//0062A03C
    procedure UpAnalog; virtual;//v54//0062B504
    procedure DownAnalog; virtual;//v58//00629BFC
    procedure LeftAnalog; virtual;//v5C//00629EF8
    procedure RightAnalog; virtual;//v60//0062A374
    procedure L1Analog; virtual;//v64//00629E84
    procedure L2Analog; virtual;//v68//00629EB8
    procedure CircleAnalog; virtual;//v6C//0062991C
    procedure CrossAnalog; virtual;//v70//00629AF0
    procedure SquareAnalog; virtual;//v74//0062B3CC
    procedure TriangleAnalog; virtual;//v78//0062B4D0
    procedure R1Analog; virtual;//v7C//0062A100
    procedure R2Analog; virtual;//v80//0062A134
    procedure TAnalog; virtual;//v84//0062B490
    procedure DPadX; virtual;//v88//00629CE4
    procedure DPadY; virtual;//v8C//00629D10
    procedure ButtonsX; virtual;//v90//006298B8
    procedure ButtonsY; virtual;//v94//006298E4
  end;
  TSixaxisObject = class(TPS3ControllerObject)
  published
    procedure ReadSixaxis;//0062B6EC
  public
    procedure ReadSixaxis; virtual;//v1C//0062B6EC
  end;
  TSixAxisValue = class(TObjectValue)
  published
    function GetPerUnits2:TUnits;//0062D4E8
    function GetPerUnits1:TUnits;//0062D4A8
    function GetUnits:TUnits;//0062D71C
    function SetString(NewValue:string):Boolean;//0062F454
    function Module:TObject;//0062F44C
    procedure GetRotMat(m:TRotMat);//0062D50C
    procedure GetVector(x:Double; y:Double; z:Double);//0062F1D8
    //procedure GetString(?:?);//0062D5B8
    //function SetValue(NewValue:Double; ?:?):Boolean;//0062F660
    function CanSet:Boolean;//0062D380
    function GetDataType:TDataType;//0062D3D8
    //procedure ToString(?:?);//0062FABC
    procedure FillClone(c:TExpression);//0062D3B8
    procedure CreateClone;//0062D3A8
    procedure GetValue;//0062D76C
  public
    ............................................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//0062FABC
    procedure GetValue; virtual;//v2C//0062D76C
    //procedure GetString(?:?); virtual;//v38//0062D5B8
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0062F1D8
    procedure GetRotMat(m:TRotMat); virtual;//v40//0062D50C
    function GetDataType:TDataType; virtual;//v44//0062D3D8
    function GetUnits:TUnits; virtual;//v48//0062D71C
    function GetPerUnits1:TUnits; virtual;//v4C//0062D4A8
    function GetPerUnits2:TUnits; virtual;//v50//0062D4E8
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0062F660
    function SetString(NewValue:string):Boolean; virtual;//v5C//0062F454
    function CanSet:Boolean; virtual;//v68//0062D380
    procedure CreateClone; virtual;//v80//0062D3A8
    procedure FillClone(c:TExpression); virtual;//v84//0062D3B8
    function Module:TObject; virtual;//v98//0062F44C
  end;
  TModuleSixaxis = class(TPieModule)
  published
    procedure MonitorFrame;//00634604
    procedure PrepareForMonitoring;//00636CBC
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006345E8
    function GetDefaultFormat(field:string):TGuiFormat;//00633F04
    procedure PrepareForGUI;//00636CB8
    procedure StartGUI;//00636CE0
    procedure StopGUI;//00636D4C
    procedure StartMonitoring;//00636CEC
    procedure StopMonitoring;//00636D54
    function GetGoodFields:TStringList;//00633F60
    procedure StartCompiletime;//00636CD4
    procedure StopCompiletime;//00636D38
    procedure StartRuntime;//00636D08
    procedure StopRuntime;//00636D5C
    constructor Create;//00633E0C
    procedure ClearRead;//00633E04
    function Read:Boolean;//00636CC0
    procedure AddFields;//0062FC44
    function CreateValue(Identifier:string):TExpression;//00633EB0
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//00633EB0
    function GetGoodFields:TStringList; virtual;//v1C//00633F60
    procedure AddFields; virtual;//v24//0062FC44
    procedure StartCompiletime; virtual;//v28//00636CD4
    procedure StopCompiletime; virtual;//v2C//00636D38
    procedure StartRuntime; virtual;//v30//00636D08
    procedure StopRuntime; virtual;//v34//00636D5C
    procedure ClearRead; virtual;//v38//00633E04
    function Read:Boolean; virtual;//v3C//00636CC0
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006345E8
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//00633F04
    procedure PrepareForGUI; virtual;//v50//00636CB8
    procedure StartGUI; virtual;//v54//00636CE0
    procedure StopGUI; virtual;//v58//00636D4C
    procedure PrepareForMonitoring; virtual;//v5C//00636CBC
    procedure StartMonitoring; virtual;//v60//00636CEC
    procedure StopMonitoring; virtual;//v64//00636D54
    procedure MonitorFrame; virtual;//v68//00634604
  end;
    //function sub_0061992C:?;//0061992C
    //function sub_00619CB4:?;//00619CB4
    procedure sub_00619CE0;//00619CE0
    procedure Execute;//00619D50
    //function sub_00619E40(?:Cardinal; ?:Boolean; ?:?; ?:?; ?:?):?;//00619E40
    //function sub_0061F6A8(?:Integer):?;//0061F6A8
    //function sub_0061F6BC(?:Integer):?;//0061F6BC
    //function sub_0061F6F4(?:?; ?:?):?;//0061F6F4
    //function sub_0061F738(?:byte):?;//0061F738
    //function sub_0061F75C(?:byte):?;//0061F75C
    //function sub_0061F7C0(?:Integer):?;//0061F7C0
    //procedure sub_0061F864(?:?; ?:?; ?:?);//0061F864
    //function sub_0061F8EC(?:?; ?:Boolean):?;//0061F8EC
    procedure sub_0061FEB4;//0061FEB4
    procedure sub_006207C0;//006207C0
    procedure sub_006207C4;//006207C4
    procedure sub_006207C8;//006207C8
    procedure sub_006207D0;//006207D0
    procedure sub_006207D4(?:TWiimoteObject);//006207D4
    procedure sub_006207E8;//006207E8
    procedure sub_006207EC(?:TWiimoteObject);//006207EC
    procedure sub_006207F4;//006207F4
    procedure sub_006207F8;//006207F8
    //function sub_00623ED8:?;//00623ED8
    //function sub_00623EDC:?;//00623EDC
    procedure sub_00623EE0(?:TWiimoteObject);//00623EE0
    //function sub_00623F50:?;//00623F50
    procedure sub_00623F54;//00623F54
    //function sub_00623F58:?;//00623F58
    procedure sub_00623F5C;//00623F5C
    procedure sub_00623F60;//00623F60
    procedure sub_00623F64;//00623F64
    //function sub_00629880(?:string):?;//00629880
    //function sub_006298B0(?:?):?;//006298B0
    procedure sub_00629B64;//00629B64
    procedure sub_0062C0E8;//0062C0E8
    //function sub_0062C43C(?:?):Boolean;//0062C43C
    //function sub_0062C464(?:?; ?:?; ?:Integer; ?:?):Boolean;//0062C464
    //function sub_0062C4A4(?:PUsb_dev_handle; ?:Integer; ?:?; ?:?; ?:?):Boolean;//0062C4A4
    //function sub_0062C4D8(?:?; ?:?; ?:?; ?:?; ?:?):Boolean;//0062C4D8
    //function sub_0062C50C(?:?; ?:?; ?:?; ?:?; ?:?):Boolean;//0062C50C
    //procedure sub_0062C540(?:?; ?:?; ?:?);//0062C540
    procedure sub_0062C708;//0062C708
    //procedure sub_0062C838(?:?; ?:?; ?:?);//0062C838
    procedure sub_0062CAF4;//0062CAF4
    procedure sub_0062CC50;//0062CC50
    procedure sub_0062D1C8;//0062D1C8
    //function sub_0062D1E4(?:string):?;//0062D1E4
    procedure sub_0062FBB4;//0062FBB4
    procedure sub_0062FBC8;//0062FBC8
    procedure sub_0062FBCC;//0062FBCC
    procedure sub_0062FBF0;//0062FBF0
    //function sub_0062FC3C:?;//0062FC3C

implementation

//0061992C
{*function sub_0061992C:?;
begin
 0061992C    push        ebx
 0061992D    push        esi
 0061992E    cmp         byte ptr ds:[78BD90],0;gvar_0078BD90
>00619935    je          0061993E
 00619937    mov         bl,1
>00619939    jmp         00619A1B
 0061993E    xor         ebx,ebx
 00619940    push        619A20;'libusb0.dll'
 00619945    call        kernel32.LoadLibraryW
 0061994A    mov         esi,eax
 0061994C    test        esi,esi
>0061994E    je          00619A1B
 00619954    push        619A38;'usb_init'
 00619959    push        esi
 0061995A    call        GetProcAddress
 0061995F    mov         [0081D8DC],eax;gvar_0081D8DC:Pointer
 00619964    push        619A4C;'usb_open'
 00619969    push        esi
 0061996A    call        GetProcAddress
 0061996F    mov         [0081D8E0],eax;gvar_0081D8E0:Pointer
 00619974    push        619A60;'usb_close'
 00619979    push        esi
 0061997A    call        GetProcAddress
 0061997F    mov         [0081D8E4],eax;gvar_0081D8E4:Pointer
 00619984    push        619A74;'usb_find_busses'
 00619989    push        esi
 0061998A    call        GetProcAddress
 0061998F    mov         [0081D8E8],eax;gvar_0081D8E8:Pointer
 00619994    push        619A94;'usb_find_devices'
 00619999    push        esi
 0061999A    call        GetProcAddress
 0061999F    mov         [0081D8EC],eax;gvar_0081D8EC:Pointer
 006199A4    push        619AB8;'usb_get_busses'
 006199A9    push        esi
 006199AA    call        GetProcAddress
 006199AF    mov         [0081D8F0],eax;gvar_0081D8F0:Pointer
 006199B4    push        619AD8;'usb_control_msg'
 006199B9    push        esi
 006199BA    call        GetProcAddress
 006199BF    mov         [0081D8F4],eax;gvar_0081D8F4:Pointer
 006199C4    push        619AF8;'usb_claim_interface'
 006199C9    push        esi
 006199CA    call        GetProcAddress
 006199CF    mov         [0081D8F8],eax;gvar_0081D8F8:Pointer
 006199D4    push        619B20;'usb_release_interface'
 006199D9    push        esi
 006199DA    call        GetProcAddress
 006199DF    mov         [0081D8FC],eax;gvar_0081D8FC:Pointer
 006199E4    push        619B4C;'usb_set_configuration'
 006199E9    push        esi
 006199EA    call        GetProcAddress
 006199EF    mov         [0081D900],eax;gvar_0081D900:Pointer
 006199F4    push        619B78;'usb_interrupt_read'
 006199F9    push        esi
 006199FA    call        GetProcAddress
 006199FF    mov         [0081D904],eax;gvar_0081D904:Pointer
 00619A04    cmp         dword ptr ds:[81D8DC],0;gvar_0081D8DC:Pointer
>00619A0B    je          00619A15
 00619A0D    mov         bl,1
 00619A0F    call        dword ptr ds:[81D8DC]
 00619A15    mov         byte ptr ds:[78BD90],bl;gvar_0078BD90
 00619A1B    mov         eax,ebx
 00619A1D    pop         esi
 00619A1E    pop         ebx
 00619A1F    ret
end;*}

//00619CB4
{*function sub_00619CB4:?;
begin
 00619CB4    add         esp,0FFFFFFE0
 00619CB7    lea         eax,[esp+10]
 00619CBB    push        eax
 00619CBC    call        kernel32.QueryPerformanceCounter
 00619CC1    lea         eax,[esp+18]
 00619CC5    push        eax
 00619CC6    call        kernel32.QueryPerformanceFrequency
 00619CCB    fild        qword ptr [esp+10]
 00619CCF    fild        qword ptr [esp+18]
 00619CD3    fdivp       st(1),st
 00619CD5    fstp        tbyte ptr [esp]
 00619CD8    wait
 00619CD9    fld         tbyte ptr [esp]
 00619CDC    add         esp,20
 00619CDF    ret
end;*}

//00619CE0
procedure sub_00619CE0;
begin
{*
 00619CE0    push        ebp
 00619CE1    mov         ebp,esp
 00619CE3    add         esp,0FFFFFFF0
 00619CE6    push        ebx
 00619CE7    push        esi
 00619CE8    push        edi
 00619CE9    mov         dword ptr [ebp-10],1000
 00619CF0    mov         eax,619D40
 00619CF5    mov         dword ptr [ebp-0C],eax
 00619CF8    mov         dword ptr [ebp-8],0FFFFFFFF
 00619CFF    xor         eax,eax
 00619D01    mov         dword ptr [ebp-4],eax
 00619D04    xor         eax,eax
 00619D06    push        ebp
 00619D07    push        619D2E
 00619D0C    push        dword ptr fs:[eax]
 00619D0F    mov         dword ptr fs:[eax],esp
 00619D12    lea         eax,[ebp-10]
 00619D15    push        eax
 00619D16    push        4
 00619D18    push        0
 00619D1A    push        406D1388
 00619D1F    call        kernel32.RaiseException
 00619D24    xor         eax,eax
 00619D26    pop         edx
 00619D27    pop         ecx
 00619D28    pop         ecx
 00619D29    mov         dword ptr fs:[eax],edx
>00619D2C    jmp         00619D38
>00619D2E    jmp         @HandleAnyException
 00619D33    call        @DoneExcept
 00619D38    pop         edi
 00619D39    pop         esi
 00619D3A    pop         ebx
 00619D3B    mov         esp,ebp
 00619D3D    pop         ebp
 00619D3E    ret
*}
end;

//00619D50
procedure TWiimoteSpeakerThread.Execute;
begin
{*
 00619D50    push        ebx
 00619D51    add         esp,0FFFFFFC8
 00619D54    mov         ebx,eax
 00619D56    mov         eax,ebx
 00619D58    call        00619CE0
 00619D5D    mov         byte ptr [esp+20],18
 00619D62    movzx       eax,byte ptr [ebx+40];TWiimoteSpeakerThread.Rumble:Boolean
 00619D66    or          al,0A0
 00619D68    mov         byte ptr [esp+21],al
 00619D6C    mov         edx,14
 00619D71    lea         eax,[esp+22]
 00619D75    mov         byte ptr [eax],0C3
 00619D78    inc         eax
 00619D79    dec         edx
>00619D7A    jne         00619D75
 00619D7C    fld         qword ptr [ebx+50];TWiimoteSpeakerThread.SampleRate:Double
 00619D7F    fcomp       dword ptr ds:[619E30];3664:Single
 00619D85    wait
 00619D86    fnstsw      al
 00619D88    sahf
>00619D89    jbe         00619D96
 00619D8B    xor         eax,eax
 00619D8D    mov         dword ptr [esp],eax
 00619D90    mov         dword ptr [esp+4],eax
>00619D94    jmp         00619DA3
 00619D96    fld         dword ptr ds:[619E34];30:Single
 00619D9C    fdiv        qword ptr [ebx+50];TWiimoteSpeakerThread.SampleRate:Double
 00619D9F    fstp        qword ptr [esp]
 00619DA2    wait
 00619DA3    call        00619CB4
 00619DA8    fadd        qword ptr [esp]
 00619DAB    fstp        qword ptr [esp+10]
 00619DAF    wait
>00619DB0    jmp         00619E24
 00619DB2    call        00619CB4
 00619DB7    fstp        qword ptr [esp+8]
 00619DBB    wait
 00619DBC    fld         qword ptr [esp+8]
 00619DC0    fcomp       qword ptr [esp+10]
 00619DC4    wait
 00619DC5    fnstsw      al
 00619DC7    sahf
>00619DC8    jae         00619E04
 00619DCA    fld         qword ptr [esp+10]
 00619DCE    fsub        qword ptr [esp+8]
 00619DD2    fmul        dword ptr ds:[619E38];1000:Single
 00619DD8    fstp        qword ptr [esp+18]
 00619DDC    wait
 00619DDD    fld         qword ptr [esp+18]
 00619DE1    fcomp       dword ptr ds:[619E3C];1:Single
 00619DE7    wait
 00619DE8    fnstsw      al
 00619DEA    sahf
>00619DEB    jb          00619DFD
 00619DED    fld         qword ptr [esp+18]
 00619DF1    call        @ROUND
 00619DF6    call        TThread.Sleep
>00619DFB    jmp         00619E04
 00619DFD    xor         eax,eax
 00619DFF    call        TThread.Sleep
 00619E04    push        16
 00619E06    lea         eax,[esp+24]
 00619E0A    push        eax
 00619E0B    mov         eax,dword ptr [ebx+44];TWiimoteSpeakerThread.Handle:Cardinal
 00619E0E    push        eax
 00619E0F    mov         eax,[0078DB90];^gvar_0078BDA8:Pointer
 00619E14    mov         eax,dword ptr [eax]
 00619E16    call        eax
 00619E18    fld         qword ptr [esp+8]
 00619E1C    fadd        qword ptr [esp]
 00619E1F    fstp        qword ptr [esp+10]
 00619E23    wait
 00619E24    cmp         byte ptr [ebx+0D],0;TWiimoteSpeakerThread.FTerminated:Boolean
>00619E28    je          00619DB2
 00619E2A    add         esp,38
 00619E2D    pop         ebx
 00619E2E    ret
*}
end;

//00619E40
{*function sub_00619E40(?:Cardinal; ?:Boolean; ?:?; ?:?; ?:?):?;
begin
 00619E40    push        ebp
 00619E41    mov         ebp,esp
 00619E43    push        ebx
 00619E44    push        esi
 00619E45    push        edi
 00619E46    mov         ebx,edx
 00619E48    mov         esi,eax
 00619E4A    xor         edi,edi
 00619E4C    mov         eax,[0078DB90];^gvar_0078BDA8:Pointer
 00619E51    cmp         dword ptr [eax],0
>00619E54    je          00619EA1
 00619E56    cmp         esi,0FFFFFFFF
>00619E59    je          00619EA1
 00619E5B    fld         qword ptr [ebp+10]
 00619E5E    fcomp       dword ptr ds:[619EAC];0:Single
 00619E64    wait
 00619E65    fnstsw      al
 00619E67    sahf
>00619E68    je          00619EA1
 00619E6A    mov         cl,1
 00619E6C    mov         dl,1
 00619E6E    mov         eax,[00619BA0];TWiimoteSpeakerThread
 00619E73    call        TThread.Create;TWiimoteSpeakerThread.Create
 00619E78    mov         edi,eax
 00619E7A    mov         dword ptr [edi+44],esi;TWiimoteSpeakerThread.Handle:Cardinal
 00619E7D    mov         byte ptr [edi+40],bl;TWiimoteSpeakerThread.Rumble:Boolean
 00619E80    fld         qword ptr [ebp+10]
 00619E83    fdiv        qword ptr [ebp+8]
 00619E86    fstp        qword ptr [edi+48];TWiimoteSpeakerThread.PhasePerSample:Double
 00619E89    wait
 00619E8A    mov         eax,dword ptr [ebp+8]
 00619E8D    mov         dword ptr [edi+50],eax;TWiimoteSpeakerThread.SampleRate:Double
 00619E90    mov         eax,dword ptr [ebp+0C]
 00619E93    mov         dword ptr [edi+54],eax;TWiimoteSpeakerThread.?f54:dword
 00619E96    mov         byte ptr [edi+0F],1;TWiimoteSpeakerThread.FFreeOnTerminate:Boolean
 00619E9A    mov         eax,edi
 00619E9C    call        TThread.Resume
 00619EA1    mov         eax,edi
 00619EA3    pop         edi
 00619EA4    pop         esi
 00619EA5    pop         ebx
 00619EA6    pop         ebp
 00619EA7    ret         10
end;*}

//0061F6A8
{*function sub_0061F6A8(?:Integer):?;
begin
 0061F6A8    movzx       eax,al
 0061F6AB    mov         edx,1A
 0061F6B0    sub         edx,eax
 0061F6B2    imul        eax,edx,118
 0061F6B8    ret
end;*}

//0061F6BC
{*function sub_0061F6BC(?:Integer):?;
begin
 0061F6BC    add         esp,0FFFFFFF4
 0061F6BF    test        ax,ax
>0061F6C2    jne         0061F6D3
 0061F6C4    xor         eax,eax
 0061F6C6    mov         dword ptr [esp],eax
 0061F6C9    mov         dword ptr [esp+4],4166E360
>0061F6D1    jmp         0061F6E8
 0061F6D3    movzx       eax,ax
 0061F6D6    mov         dword ptr [esp+8],eax
 0061F6DA    fild        dword ptr [esp+8]
 0061F6DE    fdivr       dword ptr ds:[61F6F0];12000000:Single
 0061F6E4    fstp        qword ptr [esp]
 0061F6E7    wait
 0061F6E8    fld         qword ptr [esp]
 0061F6EB    add         esp,0C
 0061F6EE    ret
end;*}

//0061F6F4
{*function sub_0061F6F4(?:?; ?:?):?;
begin
 0061F6F4    push        ebp
 0061F6F5    mov         ebp,esp
 0061F6F7    fld         tbyte ptr ds:[61F728];183.108262760357:Extended
 0061F6FD    fcomp       qword ptr [ebp+8]
 0061F700    wait
 0061F701    fnstsw      al
 0061F703    sahf
>0061F704    jbe         0061F714
 0061F706    mov         dword ptr [ebp+8],0E376E377
 0061F70D    mov         dword ptr [ebp+0C],4066E376
 0061F714    fld         dword ptr ds:[61F734];12000000:Single
 0061F71A    fdiv        qword ptr [ebp+8]
 0061F71D    call        @ROUND
 0061F722    pop         ebp
 0061F723    ret         8
end;*}

//0061F738
{*function sub_0061F738(?:byte):?;
begin
 0061F738    sub         eax,33
>0061F73B    je          0061F752
 0061F73D    add         eax,0FFFFFFFD
 0061F740    sub         eax,2
>0061F743    jb          0061F74F
 0061F745    add         eax,0FFFFFFFA
 0061F748    sub         eax,2
>0061F74B    jb          0061F755
>0061F74D    jmp         0061F758
 0061F74F    xor         eax,eax
 0061F751    ret
 0061F752    mov         al,3
 0061F754    ret
 0061F755    mov         al,5
 0061F757    ret
 0061F758    xor         eax,eax
 0061F75A    ret
end;*}

//0061F75C
{*function sub_0061F75C(?:byte):?;
begin
 0061F75C    mov         edx,eax
 0061F75E    add         edx,0FFFFFFD0
 0061F761    cmp         edx,0F
>0061F764    ja          0061F7BE
 0061F766    movzx       edx,byte ptr [edx+61F774]
 0061F76D    jmp         dword ptr [edx*4+61F784]
 0061F76D    db          1
 0061F76D    db          1
 0061F76D    db          2
 0061F76D    db          1
 0061F76D    db          2
 0061F76D    db          3
 0061F76D    db          4
 0061F76D    db          5
 0061F76D    db          0
 0061F76D    db          0
 0061F76D    db          0
 0061F76D    db          0
 0061F76D    db          0
 0061F76D    db          6
 0061F76D    db          1
 0061F76D    db          1
 0061F76D    dd          0061F7BE
 0061F76D    dd          0061F7BE
 0061F76D    dd          0061F7A1
 0061F76D    dd          0061F7A7
 0061F76D    dd          0061F7AD
 0061F76D    dd          0061F7B3
 0061F76D    dd          0061F7B9
 0061F7A0    ret
 0061F7A1    mov         eax,30
 0061F7A6    ret
 0061F7A7    mov         eax,31
 0061F7AC    ret
 0061F7AD    mov         eax,36
 0061F7B2    ret
 0061F7B3    mov         eax,37
 0061F7B8    ret
 0061F7B9    mov         eax,30
 0061F7BE    ret
end;*}

//0061F7C0
{*function sub_0061F7C0(?:Integer):?;
begin
 0061F7C0    add         eax,0FFFFFFF0
 0061F7C3    cmp         eax,2F
>0061F7C6    ja          0061F85E
 0061F7CC    movzx       eax,byte ptr [eax+61F7DA]
 0061F7D3    jmp         dword ptr [eax*4+61F80A]
 0061F7D3    db          1
 0061F7D3    db          1
 0061F7D3    db          2
 0061F7D3    db          1
 0061F7D3    db          1
 0061F7D3    db          1
 0061F7D3    db          8
 0061F7D3    db          5
 0061F7D3    db          8
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          5
 0061F7D3    db          0
 0061F7D3    db          3
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          2
 0061F7D3    db          4
 0061F7D3    db          6
 0061F7D3    db          7
 0061F7D3    db          8
 0061F7D3    db          8
 0061F7D3    db          8
 0061F7D3    db          8
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          0
 0061F7D3    db          8
 0061F7D3    db          8
 0061F7D3    db          8
 0061F7D3    dd          0061F85E
 0061F7D3    dd          0061F82E
 0061F7D3    dd          0061F834
 0061F7D3    dd          0061F83A
 0061F7D3    dd          0061F840
 0061F7D3    dd          0061F846
 0061F7D3    dd          0061F84C
 0061F7D3    dd          0061F852
 0061F7D3    dd          0061F858
 0061F82E    mov         eax,1
 0061F833    ret
 0061F834    mov         eax,2
 0061F839    ret
 0061F83A    mov         eax,4
 0061F83F    ret
 0061F840    mov         eax,5
 0061F845    ret
 0061F846    mov         eax,6
 0061F84B    ret
 0061F84C    mov         eax,0A
 0061F851    ret
 0061F852    mov         eax,11
 0061F857    ret
 0061F858    mov         eax,15
 0061F85D    ret
 0061F85E    mov         eax,15
 0061F863    ret
end;*}

//0061F864
{*procedure sub_0061F864(?:?; ?:?; ?:?);
begin
 0061F864    push        ebp
 0061F865    mov         ebp,esp
 0061F867    push        0
 0061F869    push        ebx
 0061F86A    push        esi
 0061F86B    push        edi
 0061F86C    mov         esi,ecx
 0061F86E    mov         ebx,edx
 0061F870    xor         edx,edx
 0061F872    push        ebp
 0061F873    push        61F8CD
 0061F878    push        dword ptr fs:[edx]
 0061F87B    mov         dword ptr fs:[edx],esp
 0061F87E    mov         edi,eax
 0061F880    mov         eax,esi
 0061F882    call        @UStrClr
 0061F887    dec         ebx
 0061F888    test        ebx,ebx
>0061F88A    jl          0061F8B7
 0061F88C    inc         ebx
 0061F88D    push        dword ptr [esi]
 0061F88F    lea         ecx,[ebp-4]
 0061F892    movzx       eax,byte ptr [edi]
 0061F895    mov         edx,2
 0061F89A    call        IntToHex
 0061F89F    push        dword ptr [ebp-4]
 0061F8A2    push        61F8E8;' '
 0061F8A7    mov         eax,esi
 0061F8A9    mov         edx,3
 0061F8AE    call        @UStrCatN
 0061F8B3    inc         edi
 0061F8B4    dec         ebx
>0061F8B5    jne         0061F88D
 0061F8B7    xor         eax,eax
 0061F8B9    pop         edx
 0061F8BA    pop         ecx
 0061F8BB    pop         ecx
 0061F8BC    mov         dword ptr fs:[eax],edx
 0061F8BF    push        61F8D4
 0061F8C4    lea         eax,[ebp-4]
 0061F8C7    call        @UStrClr
 0061F8CC    ret
>0061F8CD    jmp         @HandleFinally
>0061F8D2    jmp         0061F8C4
 0061F8D4    pop         edi
 0061F8D5    pop         esi
 0061F8D6    pop         ebx
 0061F8D7    pop         ecx
 0061F8D8    pop         ebp
 0061F8D9    ret
end;*}

//0061F8EC
{*function sub_0061F8EC(?:?; ?:Boolean):?;
begin
 0061F8EC    test        dl,dl
>0061F8EE    jne         0061F8F4
 0061F8F0    xor         al,17
 0061F8F2    add         al,17
 0061F8F4    ret
end;*}

//0061F8F8
function TWiimoteObject.A:Boolean;
begin
{*
 0061F8F8    test        eax,eax
>0061F8FA    je          0061F907
 0061F8FC    test        word ptr [eax+580],8;TWiimoteObject.Buttons:word
>0061F905    ja          0061F90A
 0061F907    xor         eax,eax
 0061F909    ret
 0061F90A    mov         al,1
 0061F90C    ret
*}
end;

//0061F910
procedure TWiimoteObject.ActivateClassicPassThrough;
begin
{*
 0061F910    mov         byte ptr [eax+4AC],1;TWiimoteObject.MotionPlusHasExpansion:Boolean
 0061F917    mov         edx,dword ptr [eax+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 0061F91D    mov         byte ptr [edx+8],1;TMotionPlusObject.Exists:Boolean
 0061F921    mov         byte ptr [edx+9],1;TMotionPlusObject.Active:Boolean
 0061F925    mov         byte ptr [eax+4AD],1;TWiimoteObject.ActivatingMotionPlus:Boolean
 0061F92C    mov         cl,7
 0061F92E    mov         edx,4A600FE
 0061F933    call        TWiimoteObject.QuickPoke
 0061F938    ret
*}
end;

//0061F93C
procedure TWiimoteObject.ActivateMotionPlus;
begin
{*
 0061F93C    mov         byte ptr [eax+4AD],1;TWiimoteObject.ActivatingMotionPlus:Boolean
 0061F943    mov         cl,4
 0061F945    mov         edx,4A600FE
 0061F94A    call        TWiimoteObject.QuickPoke
 0061F94F    ret
*}
end;

//0061F950
procedure TWiimoteObject.ActivateNunchukPassThrough;
begin
{*
 0061F950    mov         byte ptr [eax+4AC],1;TWiimoteObject.MotionPlusHasExpansion:Boolean
 0061F957    mov         edx,dword ptr [eax+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 0061F95D    mov         byte ptr [edx+8],1;TMotionPlusObject.Exists:Boolean
 0061F961    mov         byte ptr [edx+9],1;TMotionPlusObject.Active:Boolean
 0061F965    mov         byte ptr [eax+4AD],1;TWiimoteObject.ActivatingMotionPlus:Boolean
 0061F96C    mov         edx,dword ptr [eax+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0061F972    mov         byte ptr [edx+445],1;TNunchukObject.PassThrough:Boolean
 0061F979    mov         cl,5
 0061F97B    mov         edx,4A600FE
 0061F980    call        TWiimoteObject.QuickPoke
 0061F985    ret
*}
end;

//0061F988
procedure TWiimoteObject.ActivateRealExpansion;
begin
{*
 0061F988    push        ebx
 0061F989    mov         ebx,eax
 0061F98B    mov         cl,55
 0061F98D    mov         edx,4A400F0
 0061F992    mov         eax,ebx
 0061F994    call        TWiimoteObject.Poke
 0061F999    mov         byte ptr [ebx+4AE],1;TWiimoteObject.DeactivatingMotionPlus:Boolean
 0061F9A0    pop         ebx
 0061F9A1    ret
*}
end;

//0061F9A4
function TWiimoteObject.APrev:Boolean;
begin
{*
 0061F9A4    test        eax,eax
>0061F9A6    je          0061F9B3
 0061F9A8    test        word ptr [eax+582],8;TWiimoteObject.OldButtons:word
>0061F9B1    ja          0061F9B6
 0061F9B3    xor         eax,eax
 0061F9B5    ret
 0061F9B6    mov         al,1
 0061F9B8    ret
*}
end;

//0061F9BC
function TWiimoteObject.B:Boolean;
begin
{*
 0061F9BC    test        eax,eax
>0061F9BE    je          0061F9CB
 0061F9C0    test        word ptr [eax+580],4;TWiimoteObject.Buttons:word
>0061F9C9    ja          0061F9CE
 0061F9CB    xor         eax,eax
 0061F9CD    ret
 0061F9CE    mov         al,1
 0061F9D0    ret
*}
end;

//0061F9D4
{*procedure TWiimoteObject.BladeFxOverflowString(?:?);
begin
 0061F9D4    push        ebp
 0061F9D5    mov         ebp,esp
 0061F9D7    add         esp,0FFFFFFF8
 0061F9DA    push        ebx
 0061F9DB    push        esi
 0061F9DC    push        edi
 0061F9DD    xor         ecx,ecx
 0061F9DF    mov         dword ptr [ebp-4],ecx
 0061F9E2    mov         esi,edx
 0061F9E4    mov         edi,eax
 0061F9E6    xor         eax,eax
 0061F9E8    push        ebp
 0061F9E9    push        61FA82
 0061F9EE    push        dword ptr fs:[eax]
 0061F9F1    mov         dword ptr fs:[eax],esp
 0061F9F4    mov         eax,esi
 0061F9F6    call        @UStrClr
 0061F9FB    test        edi,edi
>0061F9FD    je          0061FA6C
 0061F9FF    mov         ebx,6D
 0061FA04    push        dword ptr [esi]
 0061FA06    lea         ecx,[ebp-4]
 0061FA09    movzx       eax,byte ptr [edi+ebx+490]
 0061FA11    mov         edx,2
 0061FA16    call        IntToHex
 0061FA1B    push        dword ptr [ebp-4]
 0061FA1E    push        61FA9C;' '
 0061FA23    mov         eax,esi
 0061FA25    mov         edx,3
 0061FA2A    call        @UStrCatN
 0061FA2F    mov         eax,ebx
 0061FA31    and         eax,0F
 0061FA34    cmp         eax,0C
>0061FA37    jne         0061FA45
 0061FA39    mov         eax,esi
 0061FA3B    mov         edx,61FAAC;'  '
 0061FA40    call        @UStrCat
 0061FA45    inc         ebx
 0061FA46    cmp         ebx,0F0
>0061FA4C    jne         0061FA04
 0061FA4E    mov         eax,dword ptr [esi]
 0061FA50    mov         dword ptr [ebp-8],eax
 0061FA53    mov         eax,dword ptr [ebp-8]
 0061FA56    test        eax,eax
>0061FA58    je          0061FA5F
 0061FA5A    sub         eax,4
 0061FA5D    mov         eax,dword ptr [eax]
 0061FA5F    mov         edx,esi
 0061FA61    mov         ecx,1
 0061FA66    xchg        eax,edx
 0061FA67    call        @UStrDelete
 0061FA6C    xor         eax,eax
 0061FA6E    pop         edx
 0061FA6F    pop         ecx
 0061FA70    pop         ecx
 0061FA71    mov         dword ptr fs:[eax],edx
 0061FA74    push        61FA89
 0061FA79    lea         eax,[ebp-4]
 0061FA7C    call        @UStrClr
 0061FA81    ret
>0061FA82    jmp         @HandleFinally
>0061FA87    jmp         0061FA79
 0061FA89    pop         edi
 0061FA8A    pop         esi
 0061FA8B    pop         ebx
 0061FA8C    pop         ecx
 0061FA8D    pop         ecx
 0061FA8E    pop         ebp
 0061FA8F    ret
end;*}

//0061FAB4
function TWiimoteObject.BPrev:Boolean;
begin
{*
 0061FAB4    test        eax,eax
>0061FAB6    je          0061FAC3
 0061FAB8    test        word ptr [eax+582],4;TWiimoteObject.OldButtons:word
>0061FAC1    ja          0061FAC6
 0061FAC3    xor         eax,eax
 0061FAC5    ret
 0061FAC6    mov         al,1
 0061FAC8    ret
*}
end;

//0061FACC
function TWiimoteObject.ClassicButton:Boolean;
begin
{*
 0061FACC    push        ebx
 0061FACD    mov         ebx,eax
 0061FACF    cmp         dword ptr [ebx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>0061FAD6    jle         0061FB01
 0061FAD8    fld         qword ptr [ebx+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 0061FADE    fcomp       dword ptr ds:[61FB0C];0:Single
 0061FAE4    wait
 0061FAE5    fnstsw      al
 0061FAE7    sahf
>0061FAE8    jbe         0061FB01
 0061FAEA    call        00600EA0
 0061FAEF    fsub        qword ptr [ebx+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 0061FAF5    fcomp       dword ptr ds:[61FB10];4:Single
 0061FAFB    wait
 0061FAFC    fnstsw      al
 0061FAFE    sahf
>0061FAFF    jbe         0061FB05
 0061FB01    xor         eax,eax
 0061FB03    pop         ebx
 0061FB04    ret
 0061FB05    mov         al,1
 0061FB07    pop         ebx
 0061FB08    ret
*}
end;

//0061FB14
procedure TWiimoteObject.Connect;
begin
{*
 0061FB14    ret
*}
end;

//0061FB18
constructor TWiimoteObject.Create(Manager:TComponent; Device:TObject);
begin
{*
 0061FB18    push        ebp
 0061FB19    mov         ebp,esp
 0061FB1B    add         esp,0FFFFFFF4
 0061FB1E    push        ebx
 0061FB1F    push        esi
 0061FB20    push        edi
 0061FB21    test        dl,dl
>0061FB23    je          0061FB2D
 0061FB25    add         esp,0FFFFFFF0
 0061FB28    call        @ClassCreate
 0061FB2D    mov         ebx,ecx
 0061FB2F    mov         byte ptr [ebp-5],dl
 0061FB32    mov         dword ptr [ebp-4],eax
 0061FB35    mov         eax,dword ptr [ebp+8]
 0061FB38    push        eax
 0061FB39    mov         ecx,ebx
 0061FB3B    xor         edx,edx
 0061FB3D    mov         eax,dword ptr [ebp-4]
 0061FB40    call        00648E90
 0061FB45    xor         edx,edx
 0061FB47    push        ebp
 0061FB48    push        61FB6E
 0061FB4D    push        dword ptr fs:[edx]
 0061FB50    mov         dword ptr fs:[edx],esp
 0061FB53    cmp         byte ptr [ebx+134],0
>0061FB5A    je          0061FB64
 0061FB5C    mov         eax,dword ptr [ebp-4]
 0061FB5F    call        TWiimoteObject.ShowConnecting
 0061FB64    xor         eax,eax
 0061FB66    pop         edx
 0061FB67    pop         ecx
 0061FB68    pop         ecx
 0061FB69    mov         dword ptr fs:[eax],edx
>0061FB6C    jmp         0061FB84
>0061FB6E    jmp         @HandleOnException
 0061FB73    dd          1
 0061FB77    dd          00418C04;Exception
 0061FB7B    dd          0061FB7F
 0061FB7F    call        @DoneExcept
 0061FB84    mov         eax,dword ptr [ebp-4]
 0061FB87    mov         dword ptr [eax+4B0],0FFFFFFFF;TWiimoteObject.BladeFXConfidence:Integer
 0061FB91    mov         eax,dword ptr [ebp-4]
 0061FB94    mov         byte ptr [eax+4D0],1;TWiimoteObject.UseBuiltInCalibration:Boolean
 0061FB9B    mov         eax,dword ptr [ebp-4]
 0061FB9E    mov         byte ptr [eax+48D],0FF;TWiimoteObject.FLeds:byte
 0061FBA5    mov         eax,dword ptr [ebp-4]
 0061FBA8    mov         byte ptr [eax+48E],7F;TWiimoteObject.FPlayerLed:ShortInt
 0061FBAF    mov         eax,dword ptr [ebp-4]
 0061FBB2    xor         edx,edx
 0061FBB4    mov         dword ptr [eax+490],edx;TWiimoteObject.FLedLevel:Double
 0061FBBA    mov         dword ptr [eax+494],406FE000;TWiimoteObject.?f494:dword
 0061FBC4    mov         ecx,dword ptr [ebp-4]
 0061FBC7    mov         dl,1
 0061FBC9    mov         eax,[00619ED4];TNunchukObject
 0061FBCE    call        TNunchukObject.Create;TNunchukObject.Create
 0061FBD3    mov         edx,dword ptr [ebp-4]
 0061FBD6    mov         dword ptr [edx+4B4],eax;TWiimoteObject.Nunchuk:TNunchukObject
 0061FBDC    mov         ecx,dword ptr [ebp-4]
 0061FBDF    mov         dl,1
 0061FBE1    mov         eax,[0061A564];TClassicObject
 0061FBE6    call        TClassicObject.Create;TClassicObject.Create
 0061FBEB    mov         edx,dword ptr [ebp-4]
 0061FBEE    mov         dword ptr [edx+4B8],eax;TWiimoteObject.Classic:TClassicObject
 0061FBF4    mov         ecx,dword ptr [ebp-4]
 0061FBF7    mov         dl,1
 0061FBF9    mov         eax,[0061B140];TGuitarObject
 0061FBFE    call        TGuitarObject.Create;TGuitarObject.Create
 0061FC03    mov         edx,dword ptr [ebp-4]
 0061FC06    mov         dword ptr [edx+4BC],eax;TWiimoteObject.Guitar:TGuitarObject
 0061FC0C    mov         ecx,dword ptr [ebp-4]
 0061FC0F    mov         dl,1
 0061FC11    mov         eax,[0061B7F0];TDrumsObject
 0061FC16    call        TDrumsObject.Create;TDrumsObject.Create
 0061FC1B    mov         edx,dword ptr [ebp-4]
 0061FC1E    mov         dword ptr [edx+4C0],eax;TWiimoteObject.Drums:TDrumsObject
 0061FC24    mov         ecx,dword ptr [ebp-4]
 0061FC27    mov         dl,1
 0061FC29    mov         eax,[0061C0B8];TTurntableObject
 0061FC2E    call        TTurntableObject.Create;TTurntableObject.Create
 0061FC33    mov         edx,dword ptr [ebp-4]
 0061FC36    mov         dword ptr [edx+4C4],eax;TWiimoteObject.Turntable:TTurntableObject
 0061FC3C    mov         ecx,dword ptr [ebp-4]
 0061FC3F    mov         dl,1
 0061FC41    mov         eax,[0061C6B4];TBalanceBoardObject
 0061FC46    call        TBalanceBoardObject.Create;TBalanceBoardObject.Create
 0061FC4B    mov         edx,dword ptr [ebp-4]
 0061FC4E    mov         dword ptr [edx+4CC],eax;TWiimoteObject.BalanceBoard:TBalanceBoardObject
 0061FC54    mov         ecx,dword ptr [ebp-4]
 0061FC57    mov         dl,1
 0061FC59    mov         eax,[0061CC48];TMotionPlusObject
 0061FC5E    call        TMotionPlusObject.Create;TMotionPlusObject.Create
 0061FC63    mov         edx,dword ptr [ebp-4]
 0061FC66    mov         dword ptr [edx+4C8],eax;TWiimoteObject.MotionPlus:TMotionPlusObject
 0061FC6C    mov         eax,dword ptr [ebp-4]
 0061FC6F    xor         edx,edx
 0061FC71    mov         dword ptr [eax+5B0],edx;TWiimoteObject.Frequency:Double
 0061FC77    mov         dword ptr [eax+5B4],edx;TWiimoteObject.?f5B4:dword
 0061FC7D    mov         eax,dword ptr [ebp-4]
 0061FC80    mov         byte ptr [eax+45A],0;TWiimoteObject.SpeakerEnabled:Boolean
 0061FC87    mov         eax,dword ptr [ebp-4]
 0061FC8A    mov         byte ptr [eax+45B],0;TWiimoteObject.Muted:Boolean
 0061FC91    mov         eax,dword ptr [ebp-4]
 0061FC94    mov         bl,0D
 0061FC96    mov         byte ptr [eax+5D0],bl;TWiimoteObject.SampleRateNumber:Integer
 0061FC9C    mov         eax,ebx
 0061FC9E    call        0061F6A8
 0061FCA3    mov         dword ptr [ebp-0C],eax
 0061FCA6    fild        dword ptr [ebp-0C]
 0061FCA9    mov         eax,dword ptr [ebp-4]
 0061FCAC    fstp        qword ptr [eax+5C0];TWiimoteObject.RealSampleRate:Double
 0061FCB2    wait
 0061FCB3    mov         eax,dword ptr [ebp-4]
 0061FCB6    mov         edx,dword ptr [ebp-4]
 0061FCB9    mov         ecx,dword ptr [edx+5C0];TWiimoteObject.RealSampleRate:Double
 0061FCBF    mov         dword ptr [eax+5B8],ecx;TWiimoteObject.SampleRate:Double
 0061FCC5    mov         ecx,dword ptr [edx+5C4];TWiimoteObject.?f5C4:dword
 0061FCCB    mov         dword ptr [eax+5BC],ecx;TWiimoteObject.?f5BC:dword
 0061FCD1    mov         eax,dword ptr [ebp-4]
 0061FCD4    mov         dword ptr [eax+5A8],14141414;TWiimoteObject.Volume:Double
 0061FCDE    mov         dword ptr [eax+5AC],3FC41414;TWiimoteObject.?f5AC:dword
 0061FCE8    mov         eax,dword ptr [ebp-4]
 0061FCEB    cmp         byte ptr [ebp-5],0
>0061FCEF    je          0061FD00
 0061FCF1    call        @AfterConstruction
 0061FCF6    pop         dword ptr fs:[0]
 0061FCFD    add         esp,0C
 0061FD00    mov         eax,dword ptr [ebp-4]
 0061FD03    pop         edi
 0061FD04    pop         esi
 0061FD05    pop         ebx
 0061FD06    mov         esp,ebp
 0061FD08    pop         ebp
 0061FD09    ret         4
*}
end;

//0061FD0C
function TWiimoteObject.CrossArms:Boolean;
begin
{*
 0061FD0C    push        ebx
 0061FD0D    mov         ebx,eax
 0061FD0F    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0061FD15    cmp         byte ptr [eax+444],0;TNunchukObject.Exists:Boolean
>0061FD1C    je          0061FD72
 0061FD1E    mov         eax,ebx
 0061FD20    call        TAccelerometerObject.RelAccX
 0061FD25    fcomp       dword ptr ds:[61FD7C];-5:Single
 0061FD2B    wait
 0061FD2C    fnstsw      al
 0061FD2E    sahf
>0061FD2F    jae         0061FD48
 0061FD31    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0061FD37    call        TAccelerometerObject.RelAccX
 0061FD3C    fcomp       dword ptr ds:[61FD80];4:Single
 0061FD42    wait
 0061FD43    fnstsw      al
 0061FD45    sahf
>0061FD46    ja          0061FD76
 0061FD48    mov         eax,ebx
 0061FD4A    call        TAccelerometerObject.RelAccX
 0061FD4F    fcomp       dword ptr ds:[61FD84];-4:Single
 0061FD55    wait
 0061FD56    fnstsw      al
 0061FD58    sahf
>0061FD59    jae         0061FD72
 0061FD5B    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0061FD61    call        TAccelerometerObject.RelAccX
 0061FD66    fcomp       dword ptr ds:[61FD88];5:Single
 0061FD6C    wait
 0061FD6D    fnstsw      al
 0061FD6F    sahf
>0061FD70    ja          0061FD76
 0061FD72    xor         eax,eax
 0061FD74    pop         ebx
 0061FD75    ret
 0061FD76    mov         al,1
 0061FD78    pop         ebx
 0061FD79    ret
*}
end;

//0061FD8C
destructor TWiimoteObject.Destroy();
begin
{*
 0061FD8C    push        ebx
 0061FD8D    push        esi
 0061FD8E    call        @BeforeDestruction
 0061FD93    mov         ebx,edx
 0061FD95    mov         esi,eax
 0061FD97    mov         eax,esi
 0061FD99    call        TWiimoteObject.Stop
 0061FD9E    mov         eax,dword ptr [esi+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0061FDA4    call        TObject.Free
 0061FDA9    mov         eax,dword ptr [esi+4B8];TWiimoteObject.Classic:TClassicObject
 0061FDAF    call        TObject.Free
 0061FDB4    mov         eax,dword ptr [esi+4BC];TWiimoteObject.Guitar:TGuitarObject
 0061FDBA    call        TObject.Free
 0061FDBF    mov         eax,dword ptr [esi+4C0];TWiimoteObject.Drums:TDrumsObject
 0061FDC5    call        TObject.Free
 0061FDCA    mov         eax,dword ptr [esi+4C4];TWiimoteObject.Turntable:TTurntableObject
 0061FDD0    call        TObject.Free
 0061FDD5    mov         eax,dword ptr [esi+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 0061FDDB    call        TObject.Free
 0061FDE0    mov         eax,dword ptr [esi+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 0061FDE6    call        TObject.Free
 0061FDEB    mov         edx,ebx
 0061FDED    and         dl,0FC
 0061FDF0    mov         eax,esi
 0061FDF2    call        TAccelerometerObject.Destroy
 0061FDF7    test        bl,bl
>0061FDF9    jle         0061FE02
 0061FDFB    mov         eax,esi
 0061FDFD    call        @ClassDestroy
 0061FE02    pop         esi
 0061FE03    pop         ebx
 0061FE04    ret
*}
end;

//0061FE08
procedure TWiimoteObject.DisableExpansion;
begin
{*
 0061FE08    ret
*}
end;

//0061FE0C
procedure TWiimoteObject.DisableIR;
begin
{*
 0061FE0C    push        ebx
 0061FE0D    mov         ebx,eax
 0061FE0F    cmp         dword ptr [ebx+20],0;TWiimoteObject.Dev:TJvHidDevice
>0061FE13    je          0061FE5F
 0061FE15    mov         cl,1
 0061FE17    mov         edx,4B00030
 0061FE1C    mov         eax,ebx
 0061FE1E    call        TWiimoteObject.Poke
 0061FE23    push        64
 0061FE25    call        kernel32.Sleep
 0061FE2A    xor         ecx,ecx
 0061FE2C    mov         edx,4B00033
 0061FE31    mov         eax,ebx
 0061FE33    call        TWiimoteObject.Poke
 0061FE38    push        64
 0061FE3A    call        kernel32.Sleep
 0061FE3F    xor         edx,edx
 0061FE41    mov         eax,ebx
 0061FE43    call        TWiimoteObject.SetReport13
 0061FE48    push        64
 0061FE4A    call        kernel32.Sleep
 0061FE4F    xor         edx,edx
 0061FE51    mov         eax,ebx
 0061FE53    call        TWiimoteObject.SetReport1A
 0061FE58    push        64
 0061FE5A    call        kernel32.Sleep
 0061FE5F    pop         ebx
 0061FE60    ret
*}
end;

//0061FE64
procedure TWiimoteObject.DisableSpeaker;
begin
{*
 0061FE64    push        ebx
 0061FE65    push        esi
 0061FE66    mov         esi,eax
 0061FE68    movzx       ebx,byte ptr [esi+45B];TWiimoteObject.Muted:Boolean
 0061FE6F    mov         byte ptr [esi+5D4],0;TWiimoteObject.ContinuousReporting:Boolean
 0061FE76    movzx       edx,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 0061FE7D    mov         eax,esi
 0061FE7F    call        TWiimoteObject.SetReport14
 0061FE84    mov         edx,ebx
 0061FE86    add         edx,edx
 0061FE88    add         edx,edx
 0061FE8A    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 0061FE91    add         dl,al
 0061FE93    mov         eax,esi
 0061FE95    call        TWiimoteObject.SetReport19
 0061FE9A    mov         eax,esi
 0061FE9C    call        TWiimoteObject.StopSpeaker
 0061FEA1    movzx       edx,byte ptr [esi+452];TWiimoteObject.DesiredChannel:byte
 0061FEA8    mov         eax,esi
 0061FEAA    call        TWiimoteObject.SetChannel
 0061FEAF    pop         esi
 0061FEB0    pop         ebx
 0061FEB1    ret
*}
end;

//0061FEB4
procedure sub_0061FEB4;
begin
{*
 0061FEB4    push        ebp
 0061FEB5    mov         ebp,esp
 0061FEB7    pop         ebp
 0061FEB8    ret         8
*}
end;

//0061FEBC
procedure TWiimoteObject.DoNullUpdate;
begin
{*
 0061FEBC    push        ebx
 0061FEBD    mov         ebx,eax
 0061FEBF    fld         tbyte ptr ds:[61FFB4];0.01:Extended
 0061FEC5    fadd        qword ptr [ebx+4D8];TWiimoteObject.UpdateTime:Double
 0061FECB    fstp        qword ptr [ebx+4D8];TWiimoteObject.UpdateTime:Double
 0061FED1    wait
 0061FED2    cmp         byte ptr [ebx+445],0;TWiimoteObject.FUseForce:Boolean
>0061FED9    je          0061FF12
 0061FEDB    push        dword ptr [ebx+24C];TWiimoteObject.?f24C:dword
 0061FEE1    push        dword ptr [ebx+248];TWiimoteObject.RawForceX:Double
 0061FEE7    push        dword ptr [ebx+254];TWiimoteObject.?f254:dword
 0061FEED    push        dword ptr [ebx+250];TWiimoteObject.RawForceY:Double
 0061FEF3    push        dword ptr [ebx+25C];TWiimoteObject.?f25C:dword
 0061FEF9    push        dword ptr [ebx+258];TWiimoteObject.RawForceZ:Double
 0061FEFF    push        dword ptr [ebx+4DC];TWiimoteObject.?f4DC:dword
 0061FF05    push        dword ptr [ebx+4D8];TWiimoteObject.UpdateTime:Double
 0061FF0B    mov         eax,ebx
 0061FF0D    call        TAccelerometerObject.UpdateForces
 0061FF12    cmp         byte ptr [ebx+447],0;TWiimoteObject.FUseExpansion:Boolean
>0061FF19    je          0061FF56
 0061FF1B    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0061FF21    push        dword ptr [eax+24C];TNunchukObject.?f24C:dword
 0061FF27    push        dword ptr [eax+248];TNunchukObject.RawForceX:Double
 0061FF2D    push        dword ptr [eax+254];TNunchukObject.?f254:dword
 0061FF33    push        dword ptr [eax+250];TNunchukObject.RawForceY:Double
 0061FF39    push        dword ptr [eax+25C];TNunchukObject.?f25C:dword
 0061FF3F    push        dword ptr [eax+258];TNunchukObject.RawForceZ:Double
 0061FF45    push        dword ptr [ebx+4DC];TWiimoteObject.?f4DC:dword
 0061FF4B    push        dword ptr [ebx+4D8];TWiimoteObject.UpdateTime:Double
 0061FF51    call        TAccelerometerObject.UpdateForces
 0061FF56    cmp         byte ptr [ebx+448],0;TWiimoteObject.FUseMotionPlus:Boolean
>0061FF5D    je          0061FF9F
 0061FF5F    cmp         byte ptr [ebx+148],0;TWiimoteObject.HasGyros:Boolean
>0061FF66    je          0061FF9F
 0061FF68    push        dword ptr [ebx+154];TWiimoteObject.?f154:dword
 0061FF6E    push        dword ptr [ebx+150];TWiimoteObject.RawGyroYaw:Double
 0061FF74    push        dword ptr [ebx+15C];TWiimoteObject.?f15C:dword
 0061FF7A    push        dword ptr [ebx+158];TWiimoteObject.RawGyroPitch:Double
 0061FF80    push        dword ptr [ebx+164];TWiimoteObject.?f164:dword
 0061FF86    push        dword ptr [ebx+160];TWiimoteObject.RawGyroRoll:Double
 0061FF8C    push        dword ptr [ebx+4DC];TWiimoteObject.?f4DC:dword
 0061FF92    push        dword ptr [ebx+4D8];TWiimoteObject.UpdateTime:Double
 0061FF98    mov         eax,ebx
 0061FF9A    call        TAccelerometerObject.UpdateGyros
 0061FF9F    cmp         byte ptr [ebx+446],0;TWiimoteObject.FUseIR:Boolean
>0061FFA6    je          0061FFAF
 0061FFA8    mov         eax,ebx
 0061FFAA    call        TWiimoteObject.UpdateIR
 0061FFAF    pop         ebx
 0061FFB0    ret
*}
end;

//0061FFC0
function TWiimoteObject.Down:Boolean;
begin
{*
 0061FFC0    test        eax,eax
>0061FFC2    je          0061FFCF
 0061FFC4    test        word ptr [eax+580],400;TWiimoteObject.Buttons:word
>0061FFCD    ja          0061FFD2
 0061FFCF    xor         eax,eax
 0061FFD1    ret
 0061FFD2    mov         al,1
 0061FFD4    ret
*}
end;

//0061FFD8
function TWiimoteObject.DownPrev:Boolean;
begin
{*
 0061FFD8    test        eax,eax
>0061FFDA    je          0061FFE7
 0061FFDC    test        word ptr [eax+582],400;TWiimoteObject.OldButtons:word
>0061FFE5    ja          0061FFEA
 0061FFE7    xor         eax,eax
 0061FFE9    ret
 0061FFEA    mov         al,1
 0061FFEC    ret
*}
end;

//0061FFF0
function TWiimoteObject.DPad3DX:Double;
begin
{*
 0061FFF0    push        ebx
 0061FFF1    add         esp,0FFFFFFE4
 0061FFF4    mov         ebx,eax
 0061FFF6    mov         eax,ebx
 0061FFF8    call        TWiimoteObject.DPadX
 0061FFFD    mov         dword ptr [esp+8],eax
 00620001    fild        dword ptr [esp+8]
 00620005    fmul        qword ptr [ebx+370];TWiimoteObject.RotMat:TRotMat
 0062000B    fstp        tbyte ptr [esp+0C]
 0062000F    wait
 00620010    mov         eax,ebx
 00620012    call        TWiimoteObject.DPadY
 00620017    mov         dword ptr [esp+18],eax
 0062001B    fild        dword ptr [esp+18]
 0062001F    fmul        qword ptr [ebx+3A0];TWiimoteObject.RotMat:TRotMat
 00620025    fld         tbyte ptr [esp+0C]
 00620029    fsubrp      st(1),st
 0062002B    fstp        qword ptr [esp]
 0062002E    wait
 0062002F    fld         qword ptr [esp]
 00620032    add         esp,1C
 00620035    pop         ebx
 00620036    ret
*}
end;

//00620038
procedure TWiimoteObject.DPad3DY;
begin
{*
 00620038    push        ebx
 00620039    add         esp,0FFFFFFE4
 0062003C    mov         ebx,eax
 0062003E    mov         eax,ebx
 00620040    call        TWiimoteObject.DPadX
 00620045    mov         dword ptr [esp+8],eax
 00620049    fild        dword ptr [esp+8]
 0062004D    fmul        qword ptr [ebx+378];TWiimoteObject.RotMat:TRotMat
 00620053    fstp        tbyte ptr [esp+0C]
 00620057    wait
 00620058    mov         eax,ebx
 0062005A    call        TWiimoteObject.DPadY
 0062005F    mov         dword ptr [esp+18],eax
 00620063    fild        dword ptr [esp+18]
 00620067    fmul        qword ptr [ebx+3A8];TWiimoteObject.RotMat:TRotMat
 0062006D    fld         tbyte ptr [esp+0C]
 00620071    fsubrp      st(1),st
 00620073    fstp        qword ptr [esp]
 00620076    wait
 00620077    fld         qword ptr [esp]
 0062007A    add         esp,1C
 0062007D    pop         ebx
 0062007E    ret
*}
end;

//00620080
procedure TWiimoteObject.DPad3DZ;
begin
{*
 00620080    push        ebx
 00620081    add         esp,0FFFFFFE4
 00620084    mov         ebx,eax
 00620086    mov         eax,ebx
 00620088    call        TWiimoteObject.DPadX
 0062008D    mov         dword ptr [esp+8],eax
 00620091    fild        dword ptr [esp+8]
 00620095    fmul        qword ptr [ebx+380];TWiimoteObject.RotMat:TRotMat
 0062009B    fstp        tbyte ptr [esp+0C]
 0062009F    wait
 006200A0    mov         eax,ebx
 006200A2    call        TWiimoteObject.DPadY
 006200A7    mov         dword ptr [esp+18],eax
 006200AB    fild        dword ptr [esp+18]
 006200AF    fmul        qword ptr [ebx+3B0];TWiimoteObject.RotMat:TRotMat
 006200B5    fld         tbyte ptr [esp+0C]
 006200B9    fsubrp      st(1),st
 006200BB    fstp        qword ptr [esp]
 006200BE    wait
 006200BF    fld         qword ptr [esp]
 006200C2    add         esp,1C
 006200C5    pop         ebx
 006200C6    ret
*}
end;

//006200C8
function TWiimoteObject.DPadX:Integer;
begin
{*
 006200C8    push        ebx
 006200C9    mov         ebx,eax
 006200CB    mov         eax,ebx
 006200CD    call        TWiimoteObject.Right
 006200D2    and         eax,7F
 006200D5    push        eax
 006200D6    mov         eax,ebx
 006200D8    call        TWiimoteObject.Left
 006200DD    and         eax,7F
 006200E0    mov         edx,eax
 006200E2    pop         eax
 006200E3    sub         eax,edx
 006200E5    pop         ebx
 006200E6    ret
*}
end;

//006200E8
function TWiimoteObject.DPadY:Integer;
begin
{*
 006200E8    push        ebx
 006200E9    mov         ebx,eax
 006200EB    mov         eax,ebx
 006200ED    call        TWiimoteObject.Down
 006200F2    and         eax,7F
 006200F5    push        eax
 006200F6    mov         eax,ebx
 006200F8    call        TWiimoteObject.Up
 006200FD    and         eax,7F
 00620100    mov         edx,eax
 00620102    pop         eax
 00620103    sub         eax,edx
 00620105    pop         ebx
 00620106    ret
*}
end;

//00620108
function TWiimoteObject.DrumRoll:Boolean;
begin
{*
 00620108    push        ebx
 00620109    mov         ebx,eax
 0062010B    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00620111    cmp         byte ptr [eax+444],0;TNunchukObject.Exists:Boolean
>00620118    je          00620178
 0062011A    mov         eax,ebx
 0062011C    call        TAccelerometerObject.RelAccY
 00620121    add         esp,0FFFFFFF8
 00620124    fstp        qword ptr [esp]
 00620127    wait
 00620128    call        004553A0
 0062012D    push        eax
 0062012E    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00620134    call        TAccelerometerObject.RelAccY
 00620139    add         esp,0FFFFFFF8
 0062013C    fstp        qword ptr [esp]
 0062013F    wait
 00620140    call        004553A0
 00620145    pop         edx
 00620146    cmp         dl,al
>00620148    je          00620178
 0062014A    mov         eax,ebx
 0062014C    call        TAccelerometerObject.RelAccY
 00620151    fabs
 00620153    fcomp       dword ptr ds:[620180];5:Single
 00620159    wait
 0062015A    fnstsw      al
 0062015C    sahf
>0062015D    jbe         00620178
 0062015F    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00620165    call        TAccelerometerObject.RelAccY
 0062016A    fabs
 0062016C    fcomp       dword ptr ds:[620180];5:Single
 00620172    wait
 00620173    fnstsw      al
 00620175    sahf
>00620176    ja          0062017C
 00620178    xor         eax,eax
 0062017A    pop         ebx
 0062017B    ret
 0062017C    mov         al,1
 0062017E    pop         ebx
 0062017F    ret
*}
end;

//00620184
procedure TWiimoteObject.EnableBladeFX;
begin
{*
 00620184    push        ebx
 00620185    mov         ebx,eax
>00620187    jmp         00620215
 0062018C    cmp         dword ptr [ebx+20],0;TWiimoteObject.Dev:TJvHidDevice
 00620190    mov         cl,55
 00620192    mov         edx,4A400F0
 00620197    mov         eax,ebx
 00620199    call        TWiimoteObject.Poke
 0062019E    push        32
 006201A0    call        kernel32.Sleep
 006201A5    xor         ecx,ecx
 006201A7    mov         edx,4A400FB
 006201AC    mov         eax,ebx
 006201AE    call        TWiimoteObject.Poke
 006201B3    push        64
 006201B5    call        kernel32.Sleep
 006201BA    mov         cl,0AA
 006201BC    mov         edx,4A400F0
 006201C1    mov         eax,ebx
 006201C3    call        TWiimoteObject.Poke
 006201C8    push        32
 006201CA    call        kernel32.Sleep
 006201CF    xor         ecx,ecx
 006201D1    mov         edx,4A40040
 006201D6    mov         eax,ebx
 006201D8    call        TWiimoteObject.Poke
 006201DD    push        32
 006201DF    call        kernel32.Sleep
 006201E4    xor         ecx,ecx
 006201E6    mov         edx,4A40046
 006201EB    mov         eax,ebx
 006201ED    call        TWiimoteObject.Poke
 006201F2    push        32
 006201F4    call        kernel32.Sleep
 006201F9    xor         ecx,ecx
 006201FB    mov         edx,4A4004C
 00620200    mov         eax,ebx
 00620202    call        TWiimoteObject.Poke
 00620207    push        32
 00620209    call        kernel32.Sleep
 0062020E    mov         eax,ebx
 00620210    call        TWiimoteObject.RequestExpansionCalibration
 00620215    pop         ebx
 00620216    ret
*}
end;

//00620218
procedure TWiimoteObject.EnableNintendoExpansion;
begin
{*
 00620218    xor         ecx,ecx
 0062021A    mov         edx,4A40040
 0062021F    call        TWiimoteObject.QuickPoke
 00620224    ret
*}
end;

//00620228
procedure TWiimoteObject.EnableSpeaker;
begin
{*
 00620228    push        ebx
 00620229    push        esi
 0062022A    mov         esi,eax
 0062022C    movzx       ebx,byte ptr [esi+45B];TWiimoteObject.Muted:Boolean
 00620233    mov         byte ptr [esi+5D4],1;TWiimoteObject.ContinuousReporting:Boolean
 0062023A    movzx       edx,byte ptr [esi+452];TWiimoteObject.DesiredChannel:byte
 00620241    mov         eax,esi
 00620243    call        TWiimoteObject.SetChannel
 00620248    movzx       edx,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 0062024F    add         dl,4
 00620252    mov         eax,esi
 00620254    call        TWiimoteObject.SetReport14
 00620259    movzx       edx,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00620260    add         dl,4
 00620263    mov         eax,esi
 00620265    call        TWiimoteObject.SetReport19
 0062026A    mov         cl,1
 0062026C    mov         edx,4A20009
 00620271    mov         eax,esi
 00620273    call        TWiimoteObject.Poke
 00620278    mov         cl,8
 0062027A    mov         edx,4A20001
 0062027F    mov         eax,esi
 00620281    call        TWiimoteObject.Poke
 00620286    xor         ecx,ecx
 00620288    mov         edx,4A20001
 0062028D    mov         eax,esi
 0062028F    call        TWiimoteObject.Poke
 00620294    xor         ecx,ecx
 00620296    mov         edx,4A20002
 0062029B    mov         eax,esi
 0062029D    call        TWiimoteObject.Poke
 006202A2    movzx       ecx,byte ptr [esi+5D2];TWiimoteObject.SampleRateWord:Integer
 006202A9    and         cl,0FF
 006202AC    mov         edx,4A20003
 006202B1    mov         eax,esi
 006202B3    call        TWiimoteObject.Poke
 006202B8    movzx       ecx,word ptr [esi+5D2];TWiimoteObject.SampleRateWord:Integer
 006202BF    shr         ecx,8
 006202C2    mov         edx,4A20004
 006202C7    mov         eax,esi
 006202C9    call        TWiimoteObject.Poke
 006202CE    fld         qword ptr [esi+5A8];TWiimoteObject.Volume:Double
 006202D4    fmul        dword ptr ds:[620338];255:Single
 006202DA    call        @ROUND
 006202DF    mov         ecx,eax
 006202E1    mov         edx,4A20005
 006202E6    mov         eax,esi
 006202E8    call        TWiimoteObject.Poke
 006202ED    xor         ecx,ecx
 006202EF    mov         edx,4A20006
 006202F4    mov         eax,esi
 006202F6    call        TWiimoteObject.Poke
 006202FB    xor         ecx,ecx
 006202FD    mov         edx,4A20007
 00620302    mov         eax,esi
 00620304    call        TWiimoteObject.Poke
 00620309    mov         cl,1
 0062030B    mov         edx,4A20008
 00620310    mov         eax,esi
 00620312    call        TWiimoteObject.Poke
 00620317    mov         edx,ebx
 00620319    add         edx,edx
 0062031B    add         edx,edx
 0062031D    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00620324    add         dl,al
 00620326    mov         eax,esi
 00620328    call        TWiimoteObject.SetReport19
 0062032D    mov         eax,esi
 0062032F    call        TWiimoteObject.StartSpeaker
 00620334    pop         esi
 00620335    pop         ebx
 00620336    ret
*}
end;

//0062033C
{*function TWiimoteObject.EnableIR:?;
begin
 0062033C    push        ebx
 0062033D    mov         ebx,eax
 0062033F    mov         byte ptr [ebx+451],0;TWiimoteObject.NeedIR:Boolean
 00620346    cmp         dword ptr [ebx+20],0;TWiimoteObject.Dev:TJvHidDevice
>0062034A    je          006203E5
 00620350    movzx       edx,byte ptr [ebx+452];TWiimoteObject.DesiredChannel:byte
 00620357    mov         eax,ebx
 00620359    call        TWiimoteObject.SetChannel
 0062035E    push        3C
 00620360    call        kernel32.Sleep
 00620365    mov         dl,4
 00620367    mov         eax,ebx
 00620369    call        TWiimoteObject.SetReport13
 0062036E    push        3C
 00620370    call        kernel32.Sleep
 00620375    mov         dl,4
 00620377    mov         eax,ebx
 00620379    call        TWiimoteObject.SetReport1A
 0062037E    push        3C
 00620380    call        kernel32.Sleep
 00620385    mov         cl,1
 00620387    mov         edx,4B00030
 0062038C    mov         eax,ebx
 0062038E    call        TWiimoteObject.Poke
 00620393    mov         cl,90
 00620395    mov         edx,4B00006
 0062039A    mov         eax,ebx
 0062039C    call        TWiimoteObject.Poke
 006203A1    mov         cl,0C0
 006203A3    mov         edx,4B00008
 006203A8    mov         eax,ebx
 006203AA    call        TWiimoteObject.Poke
 006203AF    mov         cl,40
 006203B1    mov         edx,4B0001A
 006203B6    mov         eax,ebx
 006203B8    call        TWiimoteObject.Poke
 006203BD    movzx       eax,byte ptr [ebx+452];TWiimoteObject.DesiredChannel:byte
 006203C4    call        0061F738
 006203C9    mov         ecx,eax
 006203CB    mov         edx,4B00033
 006203D0    mov         eax,ebx
 006203D2    call        TWiimoteObject.Poke
 006203D7    mov         cl,8
 006203D9    mov         edx,4B00030
 006203DE    mov         eax,ebx
 006203E0    call        TWiimoteObject.Poke
 006203E5    pop         ebx
 006203E6    ret
end;*}

//006203E8
procedure TWiimoteObject.EnableThirdPartyExpansion;
begin
{*
 006203E8    push        ebx
 006203E9    push        esi
 006203EA    push        edi
 006203EB    add         esp,0FFFFFFE8
 006203EE    mov         esi,eax
 006203F0    mov         edi,esp
 006203F2    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>006203F6    je          0062058F
 006203FC    mov         cl,55
 006203FE    mov         edx,4A400F0
 00620403    mov         eax,esi
 00620405    call        TWiimoteObject.Poke
 0062040A    push        32
 0062040C    call        kernel32.Sleep
 00620411    xor         ecx,ecx
 00620413    mov         edx,4A400FB
 00620418    mov         eax,esi
 0062041A    call        TWiimoteObject.Poke
 0062041F    push        64
 00620421    call        kernel32.Sleep
 00620426    mov         dl,37
 00620428    mov         eax,esi
 0062042A    call        TWiimoteObject.SetChannel
 0062042F    mov         cl,0AA
 00620431    mov         edx,4A400F0
 00620436    mov         eax,esi
 00620438    call        TWiimoteObject.Poke
 0062043D    push        32
 0062043F    call        kernel32.Sleep
 00620444    mov         ebx,4A40040
 00620449    mov         eax,edi
 0062044B    xor         ecx,ecx
 0062044D    mov         edx,16
 00620452    call        @FillChar
 00620457    mov         byte ptr [edi],16
 0062045A    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00620461    mov         edx,ebx
 00620463    shr         edx,18
 00620466    and         dl,0FF
 00620469    or          al,dl
 0062046B    mov         byte ptr [edi+1],al
 0062046E    mov         eax,ebx
 00620470    shr         eax,10
 00620473    and         al,0FF
 00620475    mov         byte ptr [edi+2],al
 00620478    mov         eax,ebx
 0062047A    shr         eax,8
 0062047D    and         al,0FF
 0062047F    mov         byte ptr [edi+3],al
 00620482    and         bl,0FF
 00620485    mov         byte ptr [edi+4],bl
 00620488    mov         byte ptr [edi+5],6
 0062048C    xor         eax,eax
 0062048E    lea         edx,[eax+6]
 00620491    mov         byte ptr [edi+edx],0
 00620495    inc         eax
 00620496    cmp         eax,6
>00620499    jne         0062048E
 0062049B    mov         edx,edi
 0062049D    mov         ecx,16
 006204A2    mov         eax,esi
 006204A4    call        TManagedHidObject.SendReport
 006204A9    push        32
 006204AB    call        kernel32.Sleep
 006204B0    mov         ebx,4A40046
 006204B5    mov         eax,edi
 006204B7    xor         ecx,ecx
 006204B9    mov         edx,16
 006204BE    call        @FillChar
 006204C3    mov         byte ptr [edi],16
 006204C6    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 006204CD    mov         edx,ebx
 006204CF    shr         edx,18
 006204D2    and         dl,0FF
 006204D5    or          al,dl
 006204D7    mov         byte ptr [edi+1],al
 006204DA    mov         eax,ebx
 006204DC    shr         eax,10
 006204DF    and         al,0FF
 006204E1    mov         byte ptr [edi+2],al
 006204E4    mov         eax,ebx
 006204E6    shr         eax,8
 006204E9    and         al,0FF
 006204EB    mov         byte ptr [edi+3],al
 006204EE    and         bl,0FF
 006204F1    mov         byte ptr [edi+4],bl
 006204F4    mov         byte ptr [edi+5],6
 006204F8    xor         eax,eax
 006204FA    lea         edx,[eax+6]
 006204FD    mov         byte ptr [edi+edx],0
 00620501    inc         eax
 00620502    cmp         eax,6
>00620505    jne         006204FA
 00620507    mov         edx,edi
 00620509    mov         ecx,16
 0062050E    mov         eax,esi
 00620510    call        TManagedHidObject.SendReport
 00620515    push        32
 00620517    call        kernel32.Sleep
 0062051C    mov         ebx,4A4004C
 00620521    mov         eax,edi
 00620523    xor         ecx,ecx
 00620525    mov         edx,16
 0062052A    call        @FillChar
 0062052F    mov         byte ptr [edi],16
 00620532    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00620539    mov         edx,ebx
 0062053B    shr         edx,18
 0062053E    and         dl,0FF
 00620541    or          al,dl
 00620543    mov         byte ptr [edi+1],al
 00620546    mov         eax,ebx
 00620548    shr         eax,10
 0062054B    and         al,0FF
 0062054D    mov         byte ptr [edi+2],al
 00620550    mov         eax,ebx
 00620552    shr         eax,8
 00620555    and         al,0FF
 00620557    mov         byte ptr [edi+3],al
 0062055A    and         bl,0FF
 0062055D    mov         byte ptr [edi+4],bl
 00620560    mov         byte ptr [edi+5],4
 00620564    xor         eax,eax
 00620566    lea         edx,[eax+6]
 00620569    mov         byte ptr [edi+edx],0
 0062056D    inc         eax
 0062056E    cmp         eax,4
>00620571    jne         00620566
 00620573    mov         edx,edi
 00620575    mov         ecx,16
 0062057A    mov         eax,esi
 0062057C    call        TManagedHidObject.SendReport
 00620581    push        32
 00620583    call        kernel32.Sleep
 00620588    mov         eax,esi
 0062058A    call        TWiimoteObject.RequestExpansionType
 0062058F    add         esp,18
 00620592    pop         edi
 00620593    pop         esi
 00620594    pop         ebx
 00620595    ret
*}
end;

//00620598
{*procedure TWiimoteObject.ExpString(?:?);
begin
 00620598    push        ebx
 00620599    push        esi
 0062059A    mov         esi,edx
 0062059C    mov         ebx,eax
 0062059E    mov         ecx,esi
 006205A0    lea         eax,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 006205A6    mov         edx,14
 006205AB    call        0061F864
 006205B0    pop         esi
 006205B1    pop         ebx
 006205B2    ret
end;*}

//006205B4
function TWiimoteObject.HasBladeFX:Boolean;
begin
{*
 006205B4    cmp         dword ptr [eax+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
 006205BB    setg        al
 006205BE    ret
*}
end;

//006205C0
function TWiimoteObject.HOME:Boolean;
begin
{*
 006205C0    test        eax,eax
>006205C2    je          006205CF
 006205C4    test        word ptr [eax+580],80;TWiimoteObject.Buttons:word
>006205CD    ja          006205D2
 006205CF    xor         eax,eax
 006205D1    ret
 006205D2    mov         al,1
 006205D4    ret
*}
end;

//006205D8
function TWiimoteObject.HOMEPrev:Boolean;
begin
{*
 006205D8    test        eax,eax
>006205DA    je          006205E7
 006205DC    test        word ptr [eax+582],400;TWiimoteObject.OldButtons:word
>006205E5    ja          006205EA
 006205E7    xor         eax,eax
 006205E9    ret
 006205EA    mov         al,1
 006205EC    ret
*}
end;

//006205F0
{*procedure TWiimoteObject.InByteString(?:?);
begin
 006205F0    push        ebp
 006205F1    mov         ebp,esp
 006205F3    add         esp,0FFFFFFF8
 006205F6    push        ebx
 006205F7    push        esi
 006205F8    push        edi
 006205F9    xor         ecx,ecx
 006205FB    mov         dword ptr [ebp-4],ecx
 006205FE    mov         esi,edx
 00620600    mov         edi,eax
 00620602    xor         eax,eax
 00620604    push        ebp
 00620605    push        620682
 0062060A    push        dword ptr fs:[eax]
 0062060D    mov         dword ptr fs:[eax],esp
 00620610    mov         eax,esi
 00620612    call        @UStrClr
 00620617    test        edi,edi
>00620619    je          0062066C
 0062061B    xor         ebx,ebx
 0062061D    push        dword ptr [esi]
 0062061F    lea         ecx,[ebp-4]
 00620622    movzx       eax,byte ptr [edi+ebx+45C]
 0062062A    mov         edx,2
 0062062F    call        IntToHex
 00620634    push        dword ptr [ebp-4]
 00620637    push        62069C;' '
 0062063C    mov         eax,esi
 0062063E    mov         edx,3
 00620643    call        @UStrCatN
 00620648    inc         ebx
 00620649    cmp         ebx,16
>0062064C    jne         0062061D
 0062064E    mov         eax,dword ptr [esi]
 00620650    mov         dword ptr [ebp-8],eax
 00620653    mov         eax,dword ptr [ebp-8]
 00620656    test        eax,eax
>00620658    je          0062065F
 0062065A    sub         eax,4
 0062065D    mov         eax,dword ptr [eax]
 0062065F    mov         edx,esi
 00620661    mov         ecx,1
 00620666    xchg        eax,edx
 00620667    call        @UStrDelete
 0062066C    xor         eax,eax
 0062066E    pop         edx
 0062066F    pop         ecx
 00620670    pop         ecx
 00620671    mov         dword ptr fs:[eax],edx
 00620674    push        620689
 00620679    lea         eax,[ebp-4]
 0062067C    call        @UStrClr
 00620681    ret
>00620682    jmp         @HandleFinally
>00620687    jmp         00620679
 00620689    pop         edi
 0062068A    pop         esi
 0062068B    pop         ebx
 0062068C    pop         ecx
 0062068D    pop         ecx
 0062068E    pop         ebp
 0062068F    ret
end;*}

//006206A0
function TWiimoteObject.Left:Boolean;
begin
{*
 006206A0    test        eax,eax
>006206A2    je          006206AF
 006206A4    test        word ptr [eax+580],100;TWiimoteObject.Buttons:word
>006206AD    ja          006206B2
 006206AF    xor         eax,eax
 006206B1    ret
 006206B2    mov         al,1
 006206B4    ret
*}
end;

//006206B8
function TWiimoteObject.LeftPrev:Boolean;
begin
{*
 006206B8    test        eax,eax
>006206BA    je          006206C7
 006206BC    test        word ptr [eax+582],100;TWiimoteObject.OldButtons:word
>006206C5    ja          006206CA
 006206C7    xor         eax,eax
 006206C9    ret
 006206CA    mov         al,1
 006206CC    ret
*}
end;

//006206D0
function TWiimoteObject.Minus:Boolean;
begin
{*
 006206D0    test        eax,eax
>006206D2    je          006206DF
 006206D4    test        word ptr [eax+580],10;TWiimoteObject.Buttons:word
>006206DD    ja          006206E2
 006206DF    xor         eax,eax
 006206E1    ret
 006206E2    mov         al,1
 006206E4    ret
*}
end;

//006206E8
function TWiimoteObject.MinusPrev:Boolean;
begin
{*
 006206E8    test        eax,eax
>006206EA    je          006206F7
 006206EC    test        word ptr [eax+582],10;TWiimoteObject.OldButtons:word
>006206F5    ja          006206FA
 006206F7    xor         eax,eax
 006206F9    ret
 006206FA    mov         al,1
 006206FC    ret
*}
end;

//00620700
function TWiimoteObject.One:Boolean;
begin
{*
 00620700    test        eax,eax
>00620702    je          0062070F
 00620704    test        word ptr [eax+580],2;TWiimoteObject.Buttons:word
>0062070D    ja          00620712
 0062070F    xor         eax,eax
 00620711    ret
 00620712    mov         al,1
 00620714    ret
*}
end;

//00620718
function TWiimoteObject.OnePrev:Boolean;
begin
{*
 00620718    test        eax,eax
>0062071A    je          00620727
 0062071C    test        word ptr [eax+582],2;TWiimoteObject.OldButtons:word
>00620725    ja          0062072A
 00620727    xor         eax,eax
 00620729    ret
 0062072A    mov         al,1
 0062072C    ret
*}
end;

//00620730
procedure TWiimoteObject.PerformNullUpdates;
begin
{*
 00620730    push        ebx
 00620731    push        esi
 00620732    add         esp,0FFFFFFF8
 00620735    mov         esi,eax
 00620737    fld         qword ptr [esi+4D8];TWiimoteObject.UpdateTime:Double
 0062073D    fcomp       dword ptr ds:[6207AC];0:Single
 00620743    wait
 00620744    fnstsw      al
 00620746    sahf
>00620747    je          006207A6
 00620749    call        00600EA0
 0062074E    fsub        qword ptr [esi+4D8];TWiimoteObject.UpdateTime:Double
 00620754    fmul        dword ptr ds:[6207B0];100:Single
 0062075A    fstp        qword ptr [esp]
 0062075D    wait
 0062075E    fld         qword ptr [esp]
 00620761    fcomp       dword ptr ds:[6207B0];100:Single
 00620767    wait
 00620768    fnstsw      al
 0062076A    sahf
>0062076B    jbe         0062077A
 0062076D    xor         eax,eax
 0062076F    mov         dword ptr [esp],eax
 00620772    mov         dword ptr [esp+4],40590000
 0062077A    fld         tbyte ptr ds:[6207B4];1.1:Extended
 00620780    fcomp       qword ptr [esp]
 00620783    wait
 00620784    fnstsw      al
 00620786    sahf
>00620787    jae         006207A6
 00620789    push        dword ptr [esp+4]
 0062078D    push        dword ptr [esp+4]
 00620791    call        00454B98
 00620796    mov         ebx,eax
 00620798    test        ebx,ebx
>0062079A    jle         006207A6
 0062079C    mov         eax,esi
 0062079E    call        TWiimoteObject.DoNullUpdate
 006207A3    dec         ebx
>006207A4    jne         0062079C
 006207A6    pop         ecx
 006207A7    pop         edx
 006207A8    pop         esi
 006207A9    pop         ebx
 006207AA    ret
*}
end;

//006207C0
procedure sub_006207C0;
begin
{*
 006207C0    ret
*}
end;

//006207C4
procedure sub_006207C4;
begin
{*
 006207C4    ret
*}
end;

//006207C8
procedure sub_006207C8;
begin
{*
 006207C8    push        ebp
 006207C9    mov         ebp,esp
 006207CB    pop         ebp
 006207CC    ret         4
*}
end;

//006207D0
procedure sub_006207D0;
begin
{*
 006207D0    ret
*}
end;

//006207D4
procedure sub_006207D4(?:TWiimoteObject);
begin
{*
 006207D4    cmp         byte ptr [eax+448],0
>006207DB    je          006207E4
 006207DD    mov         dl,1
 006207DF    mov         ecx,dword ptr [eax]
 006207E1    call        dword ptr [ecx+8]
 006207E4    ret
*}
end;

//006207E8
procedure sub_006207E8;
begin
{*
 006207E8    ret
*}
end;

//006207EC
procedure sub_006207EC(?:TWiimoteObject);
begin
{*
 006207EC    cmp         byte ptr [eax+447],0
 006207F3    ret
*}
end;

//006207F4
procedure sub_006207F4;
begin
{*
 006207F4    ret
*}
end;

//006207F8
procedure sub_006207F8;
begin
{*
 006207F8    ret
*}
end;

//006207FC
function TWiimoteObject.Plus:Boolean;
begin
{*
 006207FC    test        eax,eax
>006207FE    je          0062080B
 00620800    test        word ptr [eax+580],1000;TWiimoteObject.Buttons:word
>00620809    ja          0062080E
 0062080B    xor         eax,eax
 0062080D    ret
 0062080E    mov         al,1
 00620810    ret
*}
end;

//00620814
function TWiimoteObject.PlusPrev:Boolean;
begin
{*
 00620814    test        eax,eax
>00620816    je          00620823
 00620818    test        word ptr [eax+582],1000;TWiimoteObject.OldButtons:word
>00620821    ja          00620826
 00620823    xor         eax,eax
 00620825    ret
 00620826    mov         al,1
 00620828    ret
*}
end;

//0062082C
procedure TWiimoteObject.Poke(addr:Cardinal; value:Byte);
begin
{*
 0062082C    call        TWiimoteObject.QuickPoke
 00620831    push        0A
 00620833    call        kernel32.Sleep
 00620838    ret
*}
end;

//0062083C
procedure TWiimoteObject.QuickPoke(addr:Cardinal; value:Byte);
begin
{*
 0062083C    push        ebx
 0062083D    push        esi
 0062083E    push        edi
 0062083F    add         esp,0FFFFFFE8
 00620842    mov         ebx,ecx
 00620844    mov         edi,edx
 00620846    mov         esi,eax
 00620848    and         edi,0FEFFFFFF
 0062084E    mov         eax,esp
 00620850    xor         ecx,ecx
 00620852    mov         edx,16
 00620857    call        @FillChar
 0062085C    mov         byte ptr [esp],16
 00620860    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00620867    mov         edx,edi
 00620869    shr         edx,18
 0062086C    and         dl,0FF
 0062086F    or          al,dl
 00620871    mov         byte ptr [esp+1],al
 00620875    mov         eax,edi
 00620877    shr         eax,10
 0062087A    and         al,0FF
 0062087C    mov         byte ptr [esp+2],al
 00620880    mov         eax,edi
 00620882    shr         eax,8
 00620885    and         al,0FF
 00620887    mov         byte ptr [esp+3],al
 0062088B    mov         eax,edi
 0062088D    and         al,0FF
 0062088F    mov         byte ptr [esp+4],al
 00620893    mov         byte ptr [esp+5],1
 00620898    mov         byte ptr [esp+6],bl
 0062089C    mov         edx,esp
 0062089E    mov         ecx,16
 006208A3    mov         eax,esi
 006208A5    call        TManagedHidObject.SendReport
 006208AA    add         esp,18
 006208AD    pop         edi
 006208AE    pop         esi
 006208AF    pop         ebx
 006208B0    ret
*}
end;

//006208B4
procedure TWiimoteObject.ReadWiimote;
begin
{*
 006208B4    push        ebx
 006208B5    push        esi
 006208B6    mov         ebx,eax
 006208B8    cmp         byte ptr [ebx+18],0;TWiimoteObject.Connected:Boolean
>006208BC    je          00620A10
 006208C2    cmp         byte ptr [ebx+19],0;TWiimoteObject.Unplugged:Boolean
>006208C6    je          006208DE
 006208C8    mov         esi,dword ptr [ebx+4];TWiimoteObject.FManager:TComponent
 006208CB    mov         eax,ebx
 006208CD    call        TWiimoteObject.Stop
 006208D2    mov         edx,ebx
 006208D4    mov         eax,esi
 006208D6    call        TWiimoteManager.RemoveWiimote
 006208DB    pop         esi
 006208DC    pop         ebx
 006208DD    ret
 006208DE    call        00600EA0
 006208E3    fsub        qword ptr [ebx+8];TWiimoteObject.ReportTime:Double
 006208E6    fcomp       dword ptr ds:[620A14];30:Single
 006208EC    wait
 006208ED    fnstsw      al
 006208EF    sahf
>006208F0    jbe         006208F9
 006208F2    mov         eax,ebx
 006208F4    call        TWiimoteObject.RequestStatusReport
 006208F9    mov         eax,ebx
 006208FB    call        TWiimoteObject.PerformNullUpdates
 00620900    cmp         dword ptr [ebx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00620907    jle         006209B4
 0062090D    fld         qword ptr [ebx+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 00620913    fcomp       dword ptr ds:[620A18];0:Single
 00620919    wait
 0062091A    fnstsw      al
 0062091C    sahf
>0062091D    jbe         00620988
 0062091F    call        00600EA0
 00620924    fsub        qword ptr [ebx+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 0062092A    fcomp       dword ptr ds:[620A1C];4:Single
 00620930    wait
 00620931    fnstsw      al
 00620933    sahf
>00620934    jb          00620988
 00620936    mov         byte ptr [ebx+4A2],0;TWiimoteObject.Expansion:byte
 0062093D    mov         byte ptr [ebx+4A3],0;TWiimoteObject.Expansion2:byte
 00620944    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0062094A    call        TNunchukObject.Clear
 0062094F    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00620955    call        TClassicObject.Clear
 0062095A    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00620960    call        TGuitarObject.Clear
 00620965    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 0062096B    call        TBalanceBoardObject.Clear
 00620970    xor         eax,eax
 00620972    mov         dword ptr [ebx+4E0],eax;TWiimoteObject.BladeFXDisconnectTime:Double
 00620978    mov         dword ptr [ebx+4E4],eax;TWiimoteObject.?f4E4:dword
 0062097E    xor         eax,eax
 00620980    mov         dword ptr [ebx+4B0],eax;TWiimoteObject.BladeFXConfidence:Integer
>00620986    jmp         006209B4
 00620988    mov         eax,dword ptr [ebx+4];TWiimoteObject.FManager:TComponent
 0062098B    cmp         byte ptr [eax+128],0
>00620992    je          006209B4
 00620994    call        00600EA0
 00620999    fsub        qword ptr [ebx+4E8];TWiimoteObject.BladeFxOverflowTime:Double
 0062099F    fld         tbyte ptr ds:[620A20];0.2:Extended
 006209A5    fcompp
 006209A7    wait
 006209A8    fnstsw      al
 006209AA    sahf
>006209AB    jae         006209B4
 006209AD    mov         eax,ebx
 006209AF    call        TWiimoteObject.RequestBladeFxBufferOverflow
 006209B4    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 006209BA    movzx       edx,byte ptr [eax+42C];TNunchukObject.NextWaggleGesture:TWaggleGesture
 006209C1    mov         byte ptr [eax+42D],dl;TNunchukObject.WaggleGesture:TWaggleGesture
 006209C7    mov         byte ptr [eax+42C],0;TNunchukObject.NextWaggleGesture:TWaggleGesture
 006209CE    movzx       eax,byte ptr [ebx+42C];TWiimoteObject.NextWaggleGesture:TWaggleGesture
 006209D5    mov         byte ptr [ebx+42D],al;TWiimoteObject.WaggleGesture:TWaggleGesture
 006209DB    mov         byte ptr [ebx+42C],0;TWiimoteObject.NextWaggleGesture:TWaggleGesture
 006209E2    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 006209E8    movzx       edx,byte ptr [eax+42E];TNunchukObject.NextPartialGesture:TWaggleGesture
 006209EF    mov         byte ptr [eax+42F],dl;TNunchukObject.PartialGesture:TWaggleGesture
 006209F5    mov         byte ptr [eax+42E],0;TNunchukObject.NextPartialGesture:TWaggleGesture
 006209FC    movzx       eax,byte ptr [ebx+42E];TWiimoteObject.NextPartialGesture:TWaggleGesture
 00620A03    mov         byte ptr [ebx+42F],al;TWiimoteObject.PartialGesture:TWaggleGesture
 00620A09    mov         byte ptr [ebx+42E],0;TWiimoteObject.NextPartialGesture:TWaggleGesture
 00620A10    pop         esi
 00620A11    pop         ebx
 00620A12    ret
*}
end;

//00620A2C
procedure TWiimoteObject.ReceiveBladeFXOverflowReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00620A2C    push        ebp
 00620A2D    mov         ebp,esp
 00620A2F    push        ebx
 00620A30    push        esi
 00620A31    push        edi
 00620A32    movzx       esi,byte ptr [ecx+4]
 00620A36    cmp         esi,60
>00620A39    jl          00620A60
 00620A3B    cmp         esi,0E0
>00620A41    jg          00620A60
 00620A43    xor         edx,edx
 00620A45    lea         ebx,[edx+5]
 00620A48    movzx       ebx,byte ptr [ecx+ebx]
 00620A4C    push        ebx
 00620A4D    lea         ebx,[edx+esi]
 00620A50    lea         edi,[eax+ebx+490]
 00620A57    pop         ebx
 00620A58    mov         byte ptr [edi],bl
 00620A5A    inc         edx
 00620A5B    cmp         edx,10
>00620A5E    jne         00620A45
 00620A60    pop         edi
 00620A61    pop         esi
 00620A62    pop         ebx
 00620A63    pop         ebp
 00620A64    ret         4
*}
end;

//00620A68
procedure TWiimoteObject.ReceiveButtons(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00620A68    push        ebp
 00620A69    mov         ebp,esp
 00620A6B    push        esi
 00620A6C    push        edi
 00620A6D    movzx       edx,word ptr [eax+580];TWiimoteObject.Buttons:word
 00620A74    and         dx,1F9F
 00620A79    mov         word ptr [eax+582],dx;TWiimoteObject.OldButtons:word
 00620A80    movzx       edx,byte ptr [ecx]
 00620A83    shl         edx,8
 00620A86    movzx       ecx,byte ptr [ecx+1]
 00620A8A    add         dx,cx
 00620A8D    mov         word ptr [eax+580],dx;TWiimoteObject.Buttons:word
 00620A94    mov         esi,edx
 00620A96    and         si,1F9F
 00620A9B    movzx       edi,word ptr [eax+582];TWiimoteObject.OldButtons:word
 00620AA2    cmp         si,di
>00620AA5    je          00620AB6
 00620AA7    push        dword ptr [eax+0C];TWiimoteObject.?fC:dword
 00620AAA    push        dword ptr [eax+8];TWiimoteObject.ReportTime:Double
 00620AAD    mov         edx,esi
 00620AAF    mov         ecx,edi
 00620AB1    call        0061FEB4
 00620AB6    pop         edi
 00620AB7    pop         esi
 00620AB8    pop         ebp
 00620AB9    ret         4
*}
end;

//00620ABC
procedure TWiimoteObject.ReceiveDataReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00620ABC    push        ebp
 00620ABD    mov         ebp,esp
 00620ABF    add         esp,0FFFFFFD4
 00620AC2    push        ebx
 00620AC3    push        esi
 00620AC4    push        edi
 00620AC5    mov         edi,ecx
 00620AC7    mov         dword ptr [ebp-4],edx
 00620ACA    mov         ebx,eax
 00620ACC    call        00600EA0
 00620AD1    fstp        qword ptr [ebx+4D8];TWiimoteObject.UpdateTime:Double
 00620AD7    wait
 00620AD8    cmp         dword ptr [ebp-4],3E
>00620ADC    jge         00620AEA
 00620ADE    movzx       eax,byte ptr [ebp-4]
 00620AE2    mov         byte ptr [ebx+454],al;TWiimoteObject.Channel:Integer
>00620AE8    jmp         00620AFA
 00620AEA    cmp         byte ptr [ebx+454],3E;TWiimoteObject.Channel:Integer
>00620AF1    jae         00620AFA
 00620AF3    mov         byte ptr [ebx+454],3E;TWiimoteObject.Channel:Integer
 00620AFA    xor         eax,eax
 00620AFC    mov         dword ptr [ebp-10],eax
 00620AFF    mov         dword ptr [ebp-0C],eax
 00620B02    xor         eax,eax
 00620B04    mov         dword ptr [ebp-18],eax
 00620B07    mov         dword ptr [ebp-14],eax
 00620B0A    xor         eax,eax
 00620B0C    mov         dword ptr [ebp-20],eax
 00620B0F    mov         dword ptr [ebp-1C],eax
 00620B12    cmp         byte ptr [ebx+445],0;TWiimoteObject.FUseForce:Boolean
>00620B19    je          00620CE0
 00620B1F    mov         eax,dword ptr [ebp-4]
 00620B22    add         eax,0FFFFFFCF
 00620B25    cmp         eax,0E
>00620B28    ja          00620CBB
 00620B2E    movzx       eax,byte ptr [eax+620B3C]
 00620B35    jmp         dword ptr [eax*4+620B4B]
 00620B35    db          3
 00620B35    db          0
 00620B35    db          3
 00620B35    db          0
 00620B35    db          3
 00620B35    db          0
 00620B35    db          3
 00620B35    db          0
 00620B35    db          0
 00620B35    db          0
 00620B35    db          0
 00620B35    db          0
 00620B35    db          0
 00620B35    db          1
 00620B35    db          2
 00620B35    dd          00620CBB
 00620B35    dd          00620B5B
 00620B35    dd          00620BB9
 00620B35    dd          00620C16
 00620B5B    movzx       eax,byte ptr [edi+2]
 00620B5F    mov         edx,80
 00620B64    sub         edx,eax
 00620B66    mov         dword ptr [ebp-24],edx
 00620B69    fild        dword ptr [ebp-24]
 00620B6C    fstp        qword ptr [ebp-10]
 00620B6F    wait
 00620B70    fld         qword ptr [ebx+250];TWiimoteObject.RawForceY:Double
 00620B76    call        @ROUND
 00620B7B    add         eax,80
 00620B80    and         eax,0F
 00620B83    movzx       edx,byte ptr [edi]
 00620B86    and         dl,60
 00620B89    movzx       edx,dl
 00620B8C    shr         edx,5
 00620B8F    movzx       ecx,byte ptr [edi+1]
 00620B93    and         cl,60
 00620B96    movzx       ecx,cl
 00620B99    shr         ecx,3
 00620B9C    add         edx,ecx
 00620B9E    shl         edx,4
 00620BA1    add         eax,edx
 00620BA3    sub         eax,80
 00620BA8    mov         dword ptr [ebp-24],eax
 00620BAB    fild        dword ptr [ebp-24]
 00620BAE    fstp        qword ptr [ebp-18]
 00620BB1    wait
 00620BB2    mov         al,1
>00620BB4    jmp         00620CBD
 00620BB9    movzx       eax,byte ptr [edi+2]
 00620BBD    mov         edx,80
 00620BC2    sub         edx,eax
 00620BC4    mov         dword ptr [ebp-24],edx
 00620BC7    fild        dword ptr [ebp-24]
 00620BCA    fstp        qword ptr [ebp-20]
 00620BCD    wait
 00620BCE    fld         qword ptr [ebx+250];TWiimoteObject.RawForceY:Double
 00620BD4    call        @ROUND
 00620BD9    add         eax,80
 00620BDE    and         eax,0F0
 00620BE3    movzx       edx,byte ptr [edi]
 00620BE6    and         dl,60
 00620BE9    movzx       edx,dl
 00620BEC    shr         edx,5
 00620BEF    movzx       ecx,byte ptr [edi+1]
 00620BF3    and         cl,60
 00620BF6    movzx       ecx,cl
 00620BF9    shr         ecx,3
 00620BFC    add         edx,ecx
 00620BFE    add         eax,edx
 00620C00    sub         eax,80
 00620C05    mov         dword ptr [ebp-24],eax
 00620C08    fild        dword ptr [ebp-24]
 00620C0B    fstp        qword ptr [ebp-18]
 00620C0E    wait
 00620C0F    mov         al,1
>00620C11    jmp         00620CBD
 00620C16    movzx       edx,byte ptr [edi+2]
 00620C1A    mov         ecx,80
 00620C1F    sub         ecx,edx
 00620C21    mov         dword ptr [ebp-24],ecx
 00620C24    fild        dword ptr [ebp-24]
 00620C27    movzx       eax,byte ptr [edi]
 00620C2A    test        al,40
 00620C2D    seta        dl
 00620C30    movsx       edx,dl
 00620C33    mov         dword ptr [ebp-28],edx
 00620C36    fild        dword ptr [ebp-28]
 00620C39    fdiv        dword ptr ds:[621524];2:Single
 00620C3F    fsubp       st(1),st
 00620C41    test        al,20
 00620C44    seta        al
 00620C47    movsx       eax,al
 00620C4A    mov         dword ptr [ebp-2C],eax
 00620C4D    fild        dword ptr [ebp-2C]
 00620C50    fdiv        dword ptr ds:[621528];4:Single
 00620C56    fsubp       st(1),st
 00620C58    fstp        qword ptr [ebp-10]
 00620C5B    wait
 00620C5C    movzx       edx,byte ptr [edi+4]
 00620C60    sub         edx,80
 00620C66    mov         dword ptr [ebp-24],edx
 00620C69    fild        dword ptr [ebp-24]
 00620C6C    movzx       eax,byte ptr [edi+1]
 00620C70    test        al,40
 00620C73    seta        dl
 00620C76    movsx       edx,dl
 00620C79    mov         dword ptr [ebp-28],edx
 00620C7C    fild        dword ptr [ebp-28]
 00620C7F    fdiv        dword ptr ds:[621524];2:Single
 00620C85    faddp       st(1),st
 00620C87    fstp        qword ptr [ebp-18]
 00620C8A    wait
 00620C8B    movzx       edx,byte ptr [edi+3]
 00620C8F    mov         ecx,80
 00620C94    sub         ecx,edx
 00620C96    mov         dword ptr [ebp-24],ecx
 00620C99    fild        dword ptr [ebp-24]
 00620C9C    test        al,20
 00620C9F    seta        al
 00620CA2    movsx       eax,al
 00620CA5    mov         dword ptr [ebp-28],eax
 00620CA8    fild        dword ptr [ebp-28]
 00620CAB    fdiv        dword ptr ds:[621524];2:Single
 00620CB1    fsubp       st(1),st
 00620CB3    fstp        qword ptr [ebp-20]
 00620CB6    wait
 00620CB7    mov         al,1
>00620CB9    jmp         00620CBD
 00620CBB    xor         eax,eax
 00620CBD    test        al,al
>00620CBF    je          00620CE0
 00620CC1    push        dword ptr [ebp-0C]
 00620CC4    push        dword ptr [ebp-10]
 00620CC7    push        dword ptr [ebp-14]
 00620CCA    push        dword ptr [ebp-18]
 00620CCD    push        dword ptr [ebp-1C]
 00620CD0    push        dword ptr [ebp-20]
 00620CD3    push        dword ptr [ebx+0C];TWiimoteObject.?fC:dword
 00620CD6    push        dword ptr [ebx+8];TWiimoteObject.ReportTime:Double
 00620CD9    mov         eax,ebx
 00620CDB    call        TAccelerometerObject.UpdateForces
 00620CE0    mov         eax,dword ptr [ebp-4]
 00620CE3    sub         eax,32
>00620CE6    je          00620CF9
 00620CE8    add         eax,0FFFFFFFE
 00620CEB    sub         eax,4
>00620CEE    jb          00620CF9
 00620CF0    sub         eax,5
>00620CF3    jne         00620EAA
 00620CF9    lea         eax,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620CFF    mov         ecx,0FE
 00620D04    mov         edx,15
 00620D09    call        @FillChar
 00620D0E    mov         eax,dword ptr [ebp-4]
 00620D11    add         eax,0FFFFFFCE
 00620D14    cmp         eax,0B
>00620D17    ja          00620DCF
 00620D1D    jmp         dword ptr [eax*4+620D24]
 00620D1D    dd          00620D54
 00620D1D    dd          00620DCF
 00620D1D    dd          00620D69
 00620D1D    dd          00620D7E
 00620D1D    dd          00620D93
 00620D1D    dd          00620DA8
 00620D1D    dd          00620DCF
 00620D1D    dd          00620DCF
 00620D1D    dd          00620DCF
 00620D1D    dd          00620DCF
 00620D1D    dd          00620DCF
 00620D1D    dd          00620DBD
 00620D54    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620D5A    lea         eax,[edi+2]
 00620D5D    mov         ecx,8
 00620D62    call        Move
>00620D67    jmp         00620DCF
 00620D69    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620D6F    lea         eax,[edi+2]
 00620D72    mov         ecx,13
 00620D77    call        Move
>00620D7C    jmp         00620DCF
 00620D7E    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620D84    lea         eax,[edi+5]
 00620D87    mov         ecx,10
 00620D8C    call        Move
>00620D91    jmp         00620DCF
 00620D93    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620D99    lea         eax,[edi+0C]
 00620D9C    mov         ecx,9
 00620DA1    call        Move
>00620DA6    jmp         00620DCF
 00620DA8    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620DAE    lea         eax,[edi+0F]
 00620DB1    mov         ecx,6
 00620DB6    call        Move
>00620DBB    jmp         00620DCF
 00620DBD    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620DC3    mov         eax,edi
 00620DC5    mov         ecx,15
 00620DCA    call        Move
 00620DCF    mov         esi,8
 00620DD4    movzx       edx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 00620DDB    movzx       eax,byte ptr [ebx+esi+46A]
 00620DE3    call        0061F8EC
 00620DE8    mov         byte ptr [ebx+esi+46A],al
 00620DEF    inc         esi
 00620DF0    cmp         esi,1D
>00620DF3    jne         00620DD4
 00620DF5    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00620DFB    cmp         byte ptr [eax+444],0;TNunchukObject.Exists:Boolean
>00620E02    je          00620E0F
 00620E04    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620E0A    call        TNunchukObject.ReceiveExpansionData
 00620E0F    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00620E15    cmp         byte ptr [eax+8],0;TClassicObject.Exists:Boolean
>00620E19    je          00620E26
 00620E1B    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620E21    call        TClassicObject.ReceiveExpansionData
 00620E26    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00620E2C    cmp         byte ptr [eax+8],0;TBalanceBoardObject.Exists:Boolean
>00620E30    je          00620E3D
 00620E32    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620E38    call        TBalanceBoardObject.ReceiveExpansionData
 00620E3D    mov         eax,dword ptr [ebx+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00620E43    cmp         byte ptr [eax+8],0;TMotionPlusObject.Exists:Boolean
>00620E47    je          00620E54
 00620E49    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620E4F    call        TMotionPlusObject.ReceiveExpansionData
 00620E54    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00620E5A    cmp         byte ptr [eax+8],0;TGuitarObject.Exists:Boolean
>00620E5E    je          00620E7C
 00620E60    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620E66    call        TGuitarObject.ReceiveExpansionData
 00620E6B    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620E71    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00620E77    call        TClassicObject.ReceiveExpansionData
 00620E7C    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00620E82    cmp         byte ptr [eax+8],0;TDrumsObject.Exists:Boolean
>00620E86    je          00620E93
 00620E88    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620E8E    call        TDrumsObject.ReceiveExpansionData
 00620E93    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00620E99    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00620E9D    je          00620EAA
 00620E9F    lea         edx,[ebx+472];TWiimoteObject.ExpBytes:TExpBytes
 00620EA5    call        TTurntableObject.ReceiveExpansionData
 00620EAA    cmp         byte ptr [ebx+446],0;TWiimoteObject.FUseIR:Boolean
>00620EB1    je          00621518
 00620EB7    mov         eax,dword ptr [ebp-4]
 00620EBA    add         eax,0FFFFFFCD
 00620EBD    cmp         eax,0C
>00620EC0    ja          00621518
 00620EC6    movzx       eax,byte ptr [eax+620ED4]
 00620ECD    jmp         dword ptr [eax*4+620EE1]
 00620ECD    db          1
 00620ECD    db          0
 00620ECD    db          0
 00620ECD    db          2
 00620ECD    db          3
 00620ECD    db          0
 00620ECD    db          0
 00620ECD    db          0
 00620ECD    db          0
 00620ECD    db          0
 00620ECD    db          0
 00620ECD    db          4
 00620ECD    db          5
 00620ECD    dd          00621518
 00620ECD    dd          00620EF9
 00620ECD    dd          00620FCB
 00620ECD    dd          00621187
 00620ECD    dd          00621343
 00620ECD    dd          00621430
 00620EF9    mov         esi,1
 00620EFE    mov         eax,esi
 00620F00    dec         eax
 00620F01    lea         eax,[eax+eax*2]
 00620F04    add         eax,5
 00620F07    cmp         byte ptr [edi+eax],0FF
>00620F0B    jne         00620F2F
 00620F0D    mov         eax,esi
 00620F0F    dec         eax
 00620F10    lea         eax,[eax+eax*2]
 00620F13    add         eax,6
 00620F16    cmp         byte ptr [edi+eax],0FF
>00620F1A    jne         00620F2F
 00620F1C    mov         eax,esi
 00620F1E    dec         eax
 00620F1F    lea         eax,[eax+eax*2]
 00620F22    add         eax,7
 00620F25    cmp         byte ptr [edi+eax],0FF
>00620F29    jne         00620F2F
 00620F2B    xor         eax,eax
>00620F2D    jmp         00620F31
 00620F2F    mov         al,1
 00620F31    lea         edx,[esi+esi*2]
 00620F34    mov         byte ptr [ebx+edx*4+5D2],al
 00620F3B    test        al,al
>00620F3D    je          00620FB5
 00620F3F    mov         eax,esi
 00620F41    dec         eax
 00620F42    lea         eax,[eax+eax*2]
 00620F45    add         eax,7
 00620F48    movzx       eax,byte ptr [edi+eax]
 00620F4C    and         al,30
 00620F4E    movzx       eax,al
 00620F51    shl         eax,4
 00620F54    mov         edx,esi
 00620F56    dec         edx
 00620F57    lea         edx,[edx+edx*2]
 00620F5A    add         edx,5
 00620F5D    movzx       edx,byte ptr [edi+edx]
 00620F61    or          eax,edx
 00620F63    lea         edx,[esi+esi*2]
 00620F66    mov         dword ptr [ebx+edx*4+5C9],eax
 00620F6D    mov         eax,esi
 00620F6F    dec         eax
 00620F70    lea         eax,[eax+eax*2]
 00620F73    add         eax,7
 00620F76    movzx       eax,byte ptr [edi+eax]
 00620F7A    and         al,0C0
 00620F7C    movzx       eax,al
 00620F7F    add         eax,eax
 00620F81    add         eax,eax
 00620F83    mov         edx,esi
 00620F85    dec         edx
 00620F86    lea         edx,[edx+edx*2]
 00620F89    add         edx,6
 00620F8C    movzx       edx,byte ptr [edi+edx]
 00620F90    or          eax,edx
 00620F92    lea         edx,[esi+esi*2]
 00620F95    mov         dword ptr [ebx+edx*4+5CD],eax
 00620F9C    mov         eax,esi
 00620F9E    dec         eax
 00620F9F    lea         eax,[eax+eax*2]
 00620FA2    add         eax,7
 00620FA5    movzx       eax,byte ptr [edi+eax]
 00620FA9    and         al,0F
 00620FAB    lea         edx,[esi+esi*2]
 00620FAE    mov         byte ptr [ebx+edx*4+5D1],al
 00620FB5    inc         esi
 00620FB6    cmp         esi,5
>00620FB9    jne         00620EFE
 00620FBF    mov         eax,ebx
 00620FC1    call        TWiimoteObject.UpdateIR
>00620FC6    jmp         00621518
 00620FCB    cmp         byte ptr [edi+2],0FF
>00620FCF    jne         00620FE7
 00620FD1    cmp         byte ptr [edi+3],0FF
>00620FD5    jne         00620FE7
 00620FD7    movzx       eax,byte ptr [edi+4]
 00620FDB    shr         eax,4
 00620FDE    cmp         eax,0F
>00620FE1    jne         00620FE7
 00620FE3    xor         eax,eax
>00620FE5    jmp         00620FE9
 00620FE7    mov         al,1
 00620FE9    mov         byte ptr [ebx+5DE],al;TWiimoteObject.?f5DE:byte
 00620FEF    cmp         byte ptr [edi+5],0FF
>00620FF3    jne         00621009
 00620FF5    cmp         byte ptr [edi+6],0FF
>00620FF9    jne         00621009
 00620FFB    movzx       eax,byte ptr [edi+4]
 00620FFF    and         al,0F
 00621001    cmp         al,0F
>00621003    jne         00621009
 00621005    xor         eax,eax
>00621007    jmp         0062100B
 00621009    mov         al,1
 0062100B    mov         byte ptr [ebx+5EA],al;TWiimoteObject.?f5EA:byte
 00621011    cmp         byte ptr [edi+7],0FF
>00621015    jne         0062102D
 00621017    cmp         byte ptr [edi+8],0FF
>0062101B    jne         0062102D
 0062101D    movzx       eax,byte ptr [edi+9]
 00621021    shr         eax,4
 00621024    cmp         eax,0F
>00621027    jne         0062102D
 00621029    xor         eax,eax
>0062102B    jmp         0062102F
 0062102D    mov         al,1
 0062102F    mov         byte ptr [ebx+5F6],al;TWiimoteObject.?f5F6:byte
 00621035    cmp         byte ptr [edi+0A],0FF
>00621039    jne         0062104F
 0062103B    cmp         byte ptr [edi+0B],0FF
>0062103F    jne         0062104F
 00621041    movzx       eax,byte ptr [edi+9]
 00621045    and         al,0F
 00621047    cmp         al,0F
>00621049    jne         0062104F
 0062104B    xor         eax,eax
>0062104D    jmp         00621051
 0062104F    mov         al,1
 00621051    mov         byte ptr [ebx+602],al;TWiimoteObject.?f602:byte
 00621057    cmp         byte ptr [ebx+5DE],0;TWiimoteObject.?f5DE:byte
>0062105E    je          006210A0
 00621060    mov         byte ptr [ebx+5DD],10;TWiimoteObject.?f5DD:byte
 00621067    mov         byte ptr [ebx+5DF],0FF;TWiimoteObject.?f5DF:byte
 0062106E    movzx       eax,byte ptr [edi+4]
 00621072    shr         eax,4
 00621075    and         eax,3
 00621078    shl         eax,8
 0062107B    movzx       edx,byte ptr [edi+2]
 0062107F    add         eax,edx
 00621081    mov         dword ptr [ebx+5D5],eax;TWiimoteObject.Dots:?
 00621087    movzx       eax,byte ptr [edi+4]
 0062108B    shr         eax,6
 0062108E    and         eax,3
 00621091    shl         eax,8
 00621094    movzx       edx,byte ptr [edi+3]
 00621098    add         eax,edx
 0062109A    mov         dword ptr [ebx+5D9],eax;TWiimoteObject.?f5D9:Single
 006210A0    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>006210A7    je          006210E9
 006210A9    mov         byte ptr [ebx+5E9],10;TWiimoteObject.?f5E9:byte
 006210B0    mov         byte ptr [ebx+5EB],0FF;TWiimoteObject.?f5EB:byte
 006210B7    movzx       eax,byte ptr [edi+4]
 006210BB    shr         eax,0
 006210BE    and         eax,3
 006210C1    shl         eax,8
 006210C4    movzx       edx,byte ptr [edi+5]
 006210C8    add         eax,edx
 006210CA    mov         dword ptr [ebx+5E1],eax;TWiimoteObject.?f5E1:Single
 006210D0    movzx       eax,byte ptr [edi+4]
 006210D4    shr         eax,2
 006210D7    and         eax,3
 006210DA    shl         eax,8
 006210DD    movzx       edx,byte ptr [edi+6]
 006210E1    add         eax,edx
 006210E3    mov         dword ptr [ebx+5E5],eax;TWiimoteObject.?f5E5:Single
 006210E9    cmp         byte ptr [ebx+5F6],0;TWiimoteObject.?f5F6:byte
>006210F0    je          00621132
 006210F2    mov         byte ptr [ebx+5F5],10;TWiimoteObject.?f5F5:byte
 006210F9    mov         byte ptr [ebx+5F7],0FF;TWiimoteObject.?f5F7:byte
 00621100    movzx       eax,byte ptr [edi+9]
 00621104    shr         eax,4
 00621107    and         eax,3
 0062110A    shl         eax,8
 0062110D    movzx       edx,byte ptr [edi+7]
 00621111    add         eax,edx
 00621113    mov         dword ptr [ebx+5ED],eax;TWiimoteObject.?f5ED:dword
 00621119    movzx       eax,byte ptr [edi+9]
 0062111D    shr         eax,6
 00621120    and         eax,3
 00621123    shl         eax,8
 00621126    movzx       edx,byte ptr [edi+8]
 0062112A    add         eax,edx
 0062112C    mov         dword ptr [ebx+5F1],eax;TWiimoteObject.?f5F1:dword
 00621132    cmp         byte ptr [ebx+602],0;TWiimoteObject.?f602:byte
>00621139    je          0062117B
 0062113B    mov         byte ptr [ebx+601],10;TWiimoteObject.?f601:byte
 00621142    mov         byte ptr [ebx+603],0FF;TWiimoteObject.?f603:byte
 00621149    movzx       eax,byte ptr [edi+9]
 0062114D    shr         eax,0
 00621150    and         eax,3
 00621153    shl         eax,8
 00621156    movzx       edx,byte ptr [edi+0A]
 0062115A    add         eax,edx
 0062115C    mov         dword ptr [ebx+5F9],eax;TWiimoteObject.?f5F9:dword
 00621162    movzx       eax,byte ptr [edi+9]
 00621166    shr         eax,2
 00621169    and         eax,3
 0062116C    shl         eax,8
 0062116F    movzx       edx,byte ptr [edi+0B]
 00621173    add         eax,edx
 00621175    mov         dword ptr [ebx+5FD],eax;TWiimoteObject.?f5FD:dword
 0062117B    mov         eax,ebx
 0062117D    call        TWiimoteObject.UpdateIR
>00621182    jmp         00621518
 00621187    cmp         byte ptr [edi+5],0FF
>0062118B    jne         006211A3
 0062118D    cmp         byte ptr [edi+6],0FF
>00621191    jne         006211A3
 00621193    movzx       eax,byte ptr [edi+7]
 00621197    shr         eax,4
 0062119A    cmp         eax,0F
>0062119D    jne         006211A3
 0062119F    xor         eax,eax
>006211A1    jmp         006211A5
 006211A3    mov         al,1
 006211A5    mov         byte ptr [ebx+5DE],al;TWiimoteObject.?f5DE:byte
 006211AB    cmp         byte ptr [edi+8],0FF
>006211AF    jne         006211C5
 006211B1    cmp         byte ptr [edi+9],0FF
>006211B5    jne         006211C5
 006211B7    movzx       eax,byte ptr [edi+7]
 006211BB    and         al,0F
 006211BD    cmp         al,0F
>006211BF    jne         006211C5
 006211C1    xor         eax,eax
>006211C3    jmp         006211C7
 006211C5    mov         al,1
 006211C7    mov         byte ptr [ebx+5EA],al;TWiimoteObject.?f5EA:byte
 006211CD    cmp         byte ptr [edi+0A],0FF
>006211D1    jne         006211E9
 006211D3    cmp         byte ptr [edi+0B],0FF
>006211D7    jne         006211E9
 006211D9    movzx       eax,byte ptr [edi+0C]
 006211DD    shr         eax,4
 006211E0    cmp         eax,0F
>006211E3    jne         006211E9
 006211E5    xor         eax,eax
>006211E7    jmp         006211EB
 006211E9    mov         al,1
 006211EB    mov         byte ptr [ebx+5F6],al;TWiimoteObject.?f5F6:byte
 006211F1    cmp         byte ptr [edi+0D],0FF
>006211F5    jne         0062120B
 006211F7    cmp         byte ptr [edi+0E],0FF
>006211FB    jne         0062120B
 006211FD    movzx       eax,byte ptr [edi+0C]
 00621201    and         al,0F
 00621203    cmp         al,0F
>00621205    jne         0062120B
 00621207    xor         eax,eax
>00621209    jmp         0062120D
 0062120B    mov         al,1
 0062120D    mov         byte ptr [ebx+602],al;TWiimoteObject.?f602:byte
 00621213    cmp         byte ptr [ebx+5DE],0;TWiimoteObject.?f5DE:byte
>0062121A    je          0062125C
 0062121C    mov         byte ptr [ebx+5DD],10;TWiimoteObject.?f5DD:byte
 00621223    mov         byte ptr [ebx+5DF],0FF;TWiimoteObject.?f5DF:byte
 0062122A    movzx       eax,byte ptr [edi+7]
 0062122E    shr         eax,4
 00621231    and         eax,3
 00621234    shl         eax,8
 00621237    movzx       edx,byte ptr [edi+5]
 0062123B    add         eax,edx
 0062123D    mov         dword ptr [ebx+5D5],eax;TWiimoteObject.Dots:?
 00621243    movzx       eax,byte ptr [edi+7]
 00621247    shr         eax,6
 0062124A    and         eax,3
 0062124D    shl         eax,8
 00621250    movzx       edx,byte ptr [edi+6]
 00621254    add         eax,edx
 00621256    mov         dword ptr [ebx+5D9],eax;TWiimoteObject.?f5D9:Single
 0062125C    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>00621263    je          006212A5
 00621265    mov         byte ptr [ebx+5E9],10;TWiimoteObject.?f5E9:byte
 0062126C    mov         byte ptr [ebx+5EB],0FF;TWiimoteObject.?f5EB:byte
 00621273    movzx       eax,byte ptr [edi+7]
 00621277    shr         eax,0
 0062127A    and         eax,3
 0062127D    shl         eax,8
 00621280    movzx       edx,byte ptr [edi+8]
 00621284    add         eax,edx
 00621286    mov         dword ptr [ebx+5E1],eax;TWiimoteObject.?f5E1:Single
 0062128C    movzx       eax,byte ptr [edi+7]
 00621290    shr         eax,2
 00621293    and         eax,3
 00621296    shl         eax,8
 00621299    movzx       edx,byte ptr [edi+9]
 0062129D    add         eax,edx
 0062129F    mov         dword ptr [ebx+5E5],eax;TWiimoteObject.?f5E5:Single
 006212A5    cmp         byte ptr [ebx+5F6],0;TWiimoteObject.?f5F6:byte
>006212AC    je          006212EE
 006212AE    mov         byte ptr [ebx+5F5],10;TWiimoteObject.?f5F5:byte
 006212B5    mov         byte ptr [ebx+5F7],0FF;TWiimoteObject.?f5F7:byte
 006212BC    movzx       eax,byte ptr [edi+0C]
 006212C0    shr         eax,4
 006212C3    and         eax,3
 006212C6    shl         eax,8
 006212C9    movzx       edx,byte ptr [edi+0A]
 006212CD    add         eax,edx
 006212CF    mov         dword ptr [ebx+5ED],eax;TWiimoteObject.?f5ED:dword
 006212D5    movzx       eax,byte ptr [edi+0C]
 006212D9    shr         eax,6
 006212DC    and         eax,3
 006212DF    shl         eax,8
 006212E2    movzx       edx,byte ptr [edi+0B]
 006212E6    add         eax,edx
 006212E8    mov         dword ptr [ebx+5F1],eax;TWiimoteObject.?f5F1:dword
 006212EE    cmp         byte ptr [ebx+602],0;TWiimoteObject.?f602:byte
>006212F5    je          00621337
 006212F7    mov         byte ptr [ebx+601],10;TWiimoteObject.?f601:byte
 006212FE    mov         byte ptr [ebx+603],0FF;TWiimoteObject.?f603:byte
 00621305    movzx       eax,byte ptr [edi+0C]
 00621309    shr         eax,0
 0062130C    and         eax,3
 0062130F    shl         eax,8
 00621312    movzx       edx,byte ptr [edi+0D]
 00621316    add         eax,edx
 00621318    mov         dword ptr [ebx+5F9],eax;TWiimoteObject.?f5F9:dword
 0062131E    movzx       eax,byte ptr [edi+0C]
 00621322    shr         eax,2
 00621325    and         eax,3
 00621328    shl         eax,8
 0062132B    movzx       edx,byte ptr [edi+0E]
 0062132F    add         eax,edx
 00621331    mov         dword ptr [ebx+5FD],eax;TWiimoteObject.?f5FD:dword
 00621337    mov         eax,ebx
 00621339    call        TWiimoteObject.UpdateIR
>0062133E    jmp         00621518
 00621343    mov         esi,1
 00621348    mov         eax,esi
 0062134A    dec         eax
 0062134B    lea         eax,[eax+eax*8]
 0062134E    add         eax,3
 00621351    cmp         byte ptr [edi+eax],0FF
>00621355    jne         00621379
 00621357    mov         eax,esi
 00621359    dec         eax
 0062135A    lea         eax,[eax+eax*8]
 0062135D    add         eax,4
 00621360    cmp         byte ptr [edi+eax],0FF
>00621364    jne         00621379
 00621366    mov         eax,esi
 00621368    dec         eax
 00621369    lea         eax,[eax+eax*8]
 0062136C    add         eax,5
 0062136F    cmp         byte ptr [edi+eax],0FF
>00621373    jne         00621379
 00621375    xor         eax,eax
>00621377    jmp         0062137B
 00621379    mov         al,1
 0062137B    lea         edx,[esi+esi*2]
 0062137E    mov         byte ptr [ebx+edx*4+5D2],al
 00621385    test        al,al
>00621387    je          0062141A
 0062138D    mov         eax,esi
 0062138F    dec         eax
 00621390    lea         eax,[eax+eax*8]
 00621393    add         eax,5
 00621396    movzx       eax,byte ptr [edi+eax]
 0062139A    and         al,30
 0062139C    movzx       eax,al
 0062139F    shl         eax,4
 006213A2    mov         edx,esi
 006213A4    dec         edx
 006213A5    lea         edx,[edx+edx*8]
 006213A8    add         edx,3
 006213AB    movzx       edx,byte ptr [edi+edx]
 006213AF    or          eax,edx
 006213B1    lea         edx,[esi+esi*2]
 006213B4    mov         dword ptr [ebx+edx*4+5C9],eax
 006213BB    mov         eax,esi
 006213BD    dec         eax
 006213BE    lea         eax,[eax+eax*8]
 006213C1    add         eax,5
 006213C4    movzx       eax,byte ptr [edi+eax]
 006213C8    and         al,0C0
 006213CA    movzx       eax,al
 006213CD    add         eax,eax
 006213CF    add         eax,eax
 006213D1    mov         edx,esi
 006213D3    dec         edx
 006213D4    lea         edx,[edx+edx*8]
 006213D7    add         edx,4
 006213DA    movzx       edx,byte ptr [edi+edx]
 006213DE    or          eax,edx
 006213E0    lea         edx,[esi+esi*2]
 006213E3    mov         dword ptr [ebx+edx*4+5CD],eax
 006213EA    mov         eax,esi
 006213EC    dec         eax
 006213ED    lea         eax,[eax+eax*8]
 006213F0    add         eax,5
 006213F3    movzx       eax,byte ptr [edi+eax]
 006213F7    and         al,0F
 006213F9    lea         edx,[esi+esi*2]
 006213FC    mov         byte ptr [ebx+edx*4+5D1],al
 00621403    mov         eax,esi
 00621405    dec         eax
 00621406    lea         eax,[eax+eax*8]
 00621409    add         eax,0B
 0062140C    movzx       eax,byte ptr [edi+eax]
 00621410    lea         edx,[esi+esi*2]
 00621413    mov         byte ptr [ebx+edx*4+5D3],al
 0062141A    inc         esi
 0062141B    cmp         esi,3
>0062141E    jne         00621348
 00621424    mov         eax,ebx
 00621426    call        TWiimoteObject.UpdateIR
>0062142B    jmp         00621518
 00621430    mov         esi,1
 00621435    mov         eax,esi
 00621437    dec         eax
 00621438    lea         eax,[eax+eax*8]
 0062143B    add         eax,3
 0062143E    cmp         byte ptr [edi+eax],0FF
>00621442    jne         00621466
 00621444    mov         eax,esi
 00621446    dec         eax
 00621447    lea         eax,[eax+eax*8]
 0062144A    add         eax,4
 0062144D    cmp         byte ptr [edi+eax],0FF
>00621451    jne         00621466
 00621453    mov         eax,esi
 00621455    dec         eax
 00621456    lea         eax,[eax+eax*8]
 00621459    add         eax,5
 0062145C    cmp         byte ptr [edi+eax],0FF
>00621460    jne         00621466
 00621462    xor         eax,eax
>00621464    jmp         00621468
 00621466    mov         al,1
 00621468    lea         edx,[esi+esi*2]
 0062146B    mov         byte ptr [ebx+edx*4+5EA],al
 00621472    test        al,al
>00621474    je          00621507
 0062147A    mov         eax,esi
 0062147C    dec         eax
 0062147D    lea         eax,[eax+eax*8]
 00621480    add         eax,5
 00621483    movzx       eax,byte ptr [edi+eax]
 00621487    and         al,30
 00621489    movzx       eax,al
 0062148C    shl         eax,4
 0062148F    mov         edx,esi
 00621491    dec         edx
 00621492    lea         edx,[edx+edx*8]
 00621495    add         edx,3
 00621498    movzx       edx,byte ptr [edi+edx]
 0062149C    or          eax,edx
 0062149E    lea         edx,[esi+esi*2]
 006214A1    mov         dword ptr [ebx+edx*4+5E1],eax
 006214A8    mov         eax,esi
 006214AA    dec         eax
 006214AB    lea         eax,[eax+eax*8]
 006214AE    add         eax,5
 006214B1    movzx       eax,byte ptr [edi+eax]
 006214B5    and         al,0C0
 006214B7    movzx       eax,al
 006214BA    add         eax,eax
 006214BC    add         eax,eax
 006214BE    mov         edx,esi
 006214C0    dec         edx
 006214C1    lea         edx,[edx+edx*8]
 006214C4    add         edx,4
 006214C7    movzx       edx,byte ptr [edi+edx]
 006214CB    or          eax,edx
 006214CD    lea         edx,[esi+esi*2]
 006214D0    mov         dword ptr [ebx+edx*4+5E5],eax
 006214D7    mov         eax,esi
 006214D9    dec         eax
 006214DA    lea         eax,[eax+eax*8]
 006214DD    add         eax,5
 006214E0    movzx       eax,byte ptr [edi+eax]
 006214E4    and         al,0F
 006214E6    lea         edx,[esi+esi*2]
 006214E9    mov         byte ptr [ebx+edx*4+5E9],al
 006214F0    mov         eax,esi
 006214F2    dec         eax
 006214F3    lea         eax,[eax+eax*8]
 006214F6    add         eax,0B
 006214F9    movzx       eax,byte ptr [edi+eax]
 006214FD    lea         edx,[esi+esi*2]
 00621500    mov         byte ptr [ebx+edx*4+5EB],al
 00621507    inc         esi
 00621508    cmp         esi,3
>0062150B    jne         00621435
 00621511    mov         eax,ebx
 00621513    call        TWiimoteObject.UpdateIR
 00621518    pop         edi
 00621519    pop         esi
 0062151A    pop         ebx
 0062151B    mov         esp,ebp
 0062151D    pop         ebp
 0062151E    ret         4
*}
end;

//0062152C
procedure TWiimoteObject.ReceiveExpansionCalibrationReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 0062152C    push        ebp
 0062152D    mov         ebp,esp
 0062152F    push        ebx
 00621530    push        esi
 00621531    mov         esi,ecx
 00621533    mov         ebx,eax
 00621535    mov         byte ptr [ebx+44E],0;TWiimoteObject.NeedExpansionCalibration:Boolean
 0062153C    movzx       eax,byte ptr [ebx+4A2];TWiimoteObject.Expansion:byte
 00621543    cmp         al,1
>00621545    jne         006215BB
 00621547    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 0062154E    mov         edx,esi
 00621550    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621556    call        TNunchukObject.Calibrate
 0062155B    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 00621562    mov         edx,esi
 00621564    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 0062156A    call        TClassicObject.Calibrate
 0062156F    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 00621576    mov         edx,esi
 00621578    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 0062157E    call        TGuitarObject.Calibrate
 00621583    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 0062158A    mov         edx,esi
 0062158C    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621592    call        TDrumsObject.Calibrate
 00621597    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 0062159E    mov         edx,esi
 006215A0    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 006215A6    call        TTurntableObject.Calibrate
 006215AB    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 006215B1    call        TBalanceBoardObject.Clear
>006215B6    jmp         0062173F
 006215BB    cmp         al,2
>006215BD    jne         0062160F
 006215BF    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 006215C6    mov         edx,esi
 006215C8    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 006215CE    call        TNunchukObject.Calibrate
 006215D3    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 006215D9    call        TClassicObject.Clear
 006215DE    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 006215E4    call        TGuitarObject.Clear
 006215E9    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 006215EF    call        TDrumsObject.Clear
 006215F4    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 006215FA    call        TTurntableObject.Clear
 006215FF    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621605    call        TBalanceBoardObject.Clear
>0062160A    jmp         0062173F
 0062160F    cmp         al,3
>00621611    jne         006216BD
 00621617    cmp         byte ptr [ebx+4A3],5;TWiimoteObject.Expansion2:byte
>0062161E    jne         0062166D
 00621620    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 00621627    mov         edx,esi
 00621629    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 0062162F    call        TGuitarObject.Calibrate
 00621634    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 0062163B    mov         edx,esi
 0062163D    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621643    call        TClassicObject.Calibrate
 00621648    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 0062164E    mov         byte ptr [eax+8],0;TClassicObject.Exists:Boolean
 00621652    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621658    call        TNunchukObject.Clear
 0062165D    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621663    call        TBalanceBoardObject.Clear
>00621668    jmp         0062173F
 0062166D    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 00621674    mov         edx,esi
 00621676    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 0062167C    call        TClassicObject.Calibrate
 00621681    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621687    call        TNunchukObject.Clear
 0062168C    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621692    call        TGuitarObject.Clear
 00621697    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 0062169D    call        TDrumsObject.Clear
 006216A2    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 006216A8    call        TTurntableObject.Clear
 006216AD    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 006216B3    call        TBalanceBoardObject.Clear
>006216B8    jmp         0062173F
 006216BD    cmp         al,6
>006216BF    jne         0062173F
 006216C1    movzx       eax,byte ptr [ebx+4A3];TWiimoteObject.Expansion2:byte
 006216C8    cmp         al,4
>006216CA    jne         00621720
 006216CC    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 006216D3    mov         edx,esi
 006216D5    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 006216DB    call        TBalanceBoardObject.Calibrate
 006216E0    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 006216E6    call        TNunchukObject.Clear
 006216EB    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 006216F1    call        TGuitarObject.Clear
 006216F6    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 006216FC    call        TDrumsObject.Clear
 00621701    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621707    call        TTurntableObject.Clear
 0062170C    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621712    call        TClassicObject.Clear
 00621717    mov         byte ptr [ebx+452],34;TWiimoteObject.DesiredChannel:byte
>0062171E    jmp         0062173F
 00621720    cmp         al,7
>00621722    jne         0062173F
 00621724    mov         byte ptr [ebx+44D],0;TWiimoteObject.NeedMotionPlusType:Boolean
 0062172B    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 00621732    mov         edx,esi
 00621734    mov         eax,dword ptr [ebx+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 0062173A    call        TMotionPlusObject.Calibrate
 0062173F    cmp         byte ptr [ebx+44B],0;TWiimoteObject.NeedCalibration:Boolean
>00621746    je          00621751
 00621748    mov         eax,ebx
 0062174A    call        TWiimoteObject.RequestWiimoteCalibration
>0062174F    jmp         00621767
 00621751    cmp         byte ptr [ebx+18],0;TWiimoteObject.Connected:Boolean
>00621755    je          00621767
 00621757    cmp         byte ptr [ebx+44D],0;TWiimoteObject.NeedMotionPlusType:Boolean
>0062175E    je          00621767
 00621760    mov         eax,ebx
 00621762    call        TWiimoteObject.RequestMotionPlusType
 00621767    pop         esi
 00621768    pop         ebx
 00621769    pop         ebp
 0062176A    ret         4
*}
end;

//00621770
procedure TWiimoteObject.ReceiveExpansionCalibrationReport2(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00621770    push        ebp
 00621771    mov         ebp,esp
 00621773    push        ebx
 00621774    mov         ebx,eax
 00621776    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 0062177C    cmp         byte ptr [eax+8],0;TBalanceBoardObject.Exists:Boolean
>00621780    je          00621792
 00621782    mov         edx,ecx
 00621784    movzx       ecx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 0062178B    call        TBalanceBoardObject.Calibrate2
>00621790    jmp         006217A7
 00621792    mov         eax,dword ptr [ebx+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00621798    cmp         byte ptr [eax+8],0;TMotionPlusObject.Exists:Boolean
>0062179C    je          006217A7
 0062179E    mov         edx,ecx
 006217A0    mov         cl,1
 006217A2    call        TMotionPlusObject.Calibrate2
 006217A7    cmp         byte ptr [ebx+44B],0;TWiimoteObject.NeedCalibration:Boolean
>006217AE    je          006217B7
 006217B0    mov         eax,ebx
 006217B2    call        TWiimoteObject.RequestWiimoteCalibration
 006217B7    pop         ebx
 006217B8    pop         ebp
 006217B9    ret         4
*}
end;

//006217BC
procedure TWiimoteObject.ReceiveExpansionTypeReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 006217BC    push        ebp
 006217BD    mov         ebp,esp
 006217BF    push        ecx
 006217C0    push        ebx
 006217C1    push        esi
 006217C2    mov         esi,ecx
 006217C4    mov         ebx,eax
 006217C6    mov         byte ptr [ebx+44C],0;TWiimoteObject.NeedExpansionType:Boolean
 006217CD    mov         byte ptr [ebx+4A9],0;TWiimoteObject.BladeFXReplugged:Boolean
 006217D4    cmp         byte ptr [esi+2],0F7
>006217D8    jne         00621838
 006217DA    mov         byte ptr [ebx+4A8],0;TWiimoteObject.AlreadyDecoded:Boolean
 006217E1    mov         byte ptr [ebx+4A2],0;TWiimoteObject.Expansion:byte
 006217E8    mov         byte ptr [ebx+4A3],0;TWiimoteObject.Expansion2:byte
 006217EF    mov         byte ptr [ebx+4A4],0;TWiimoteObject.Expansion3:byte
 006217F6    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 006217FC    call        TNunchukObject.Clear
 00621801    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621807    call        TClassicObject.Clear
 0062180C    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621812    call        TBalanceBoardObject.Clear
 00621817    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 0062181D    call        TGuitarObject.Clear
 00621822    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621828    call        TDrumsObject.Clear
 0062182D    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621833    call        TTurntableObject.Clear
 00621838    cmp         byte ptr [esi+13],0FF
>0062183C    jne         00621861
 0062183E    cmp         byte ptr [esi+14],0FF
>00621842    jne         00621861
 00621844    mov         byte ptr [ebp-1],1
 00621848    mov         eax,5
 0062184D    cmp         byte ptr [esi+eax],0FF
>00621851    je          00621859
 00621853    mov         byte ptr [ebp-1],0
>00621857    jmp         00621895
 00621859    inc         eax
 0062185A    cmp         eax,13
>0062185D    jne         0062184D
>0062185F    jmp         00621895
 00621861    cmp         byte ptr [esi+13],0
>00621865    jne         00621891
 00621867    cmp         byte ptr [esi+14],0
>0062186B    jne         00621891
 0062186D    mov         byte ptr [ebp-1],1
 00621871    mov         byte ptr [ebx+4A9],1;TWiimoteObject.BladeFXReplugged:Boolean
 00621878    mov         eax,5
 0062187D    cmp         byte ptr [esi+eax],0
>00621881    je          00621889
 00621883    mov         byte ptr [ebp-1],0
>00621887    jmp         00621895
 00621889    inc         eax
 0062188A    cmp         eax,13
>0062188D    jne         0062187D
>0062188F    jmp         00621895
 00621891    mov         byte ptr [ebp-1],0
 00621895    movzx       eax,byte ptr [ebx+4A9];TWiimoteObject.BladeFXReplugged:Boolean
 0062189C    and         al,byte ptr [ebp-1]
>0062189F    je          00621917
 006218A1    mov         byte ptr [ebx+4AA],1;TWiimoteObject.ThirdParty:Boolean
 006218A8    mov         dword ptr [ebx+4B0],2;TWiimoteObject.BladeFXConfidence:Integer
 006218B2    mov         eax,ebx
 006218B4    call        TWiimoteObject.EnableThirdPartyExpansion
 006218B9    mov         byte ptr [ebx+4A8],1;TWiimoteObject.AlreadyDecoded:Boolean
 006218C0    mov         byte ptr [ebx+4A2],2;TWiimoteObject.Expansion:byte
 006218C7    mov         byte ptr [ebx+4A3],1;TWiimoteObject.Expansion2:byte
 006218CE    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 006218D4    mov         byte ptr [eax+444],1;TNunchukObject.Exists:Boolean
 006218DB    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 006218E1    call        TClassicObject.Clear
 006218E6    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 006218EC    call        TGuitarObject.Clear
 006218F1    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 006218F7    call        TDrumsObject.Clear
 006218FC    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621902    call        TTurntableObject.Clear
 00621907    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 0062190D    call        TBalanceBoardObject.Clear
>00621912    jmp         00621F56
 00621917    cmp         byte ptr [ebp-1],0
>0062191B    je          00621998
 0062191D    mov         byte ptr [ebx+4AA],1;TWiimoteObject.ThirdParty:Boolean
 00621924    cmp         dword ptr [ebx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>0062192B    jge         00621935
 0062192D    xor         eax,eax
 0062192F    mov         dword ptr [ebx+4B0],eax;TWiimoteObject.BladeFXConfidence:Integer
 00621935    mov         eax,ebx
 00621937    call        TWiimoteObject.EnableThirdPartyExpansion
 0062193C    mov         byte ptr [ebx+4A8],1;TWiimoteObject.AlreadyDecoded:Boolean
 00621943    mov         byte ptr [ebx+4A2],1;TWiimoteObject.Expansion:byte
 0062194A    mov         byte ptr [ebx+4A3],1;TWiimoteObject.Expansion2:byte
 00621951    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621957    call        TNunchukObject.Clear
 0062195C    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621962    call        TClassicObject.Clear
 00621967    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 0062196D    call        TGuitarObject.Clear
 00621972    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621978    call        TDrumsObject.Clear
 0062197D    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621983    call        TTurntableObject.Clear
 00621988    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 0062198E    call        TBalanceBoardObject.Clear
>00621993    jmp         00621F56
 00621998    cmp         byte ptr [esi+11],0A4
 0062199C    sete        al
 0062199F    mov         byte ptr [ebx+4A8],al;TWiimoteObject.AlreadyDecoded:Boolean
 006219A5    movzx       eax,byte ptr [esi+13]
 006219A9    movzx       edx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 006219B0    call        0061F8EC
 006219B5    add         al,2
 006219B7    mov         byte ptr [ebx+4A2],al;TWiimoteObject.Expansion:byte
 006219BD    movzx       eax,byte ptr [esi+14]
 006219C1    movzx       edx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 006219C8    call        0061F8EC
 006219CD    add         al,2
 006219CF    mov         byte ptr [ebx+4A3],al;TWiimoteObject.Expansion2:byte
 006219D5    movzx       eax,byte ptr [esi+0F]
 006219D9    movzx       edx,byte ptr [ebx+4A8];TWiimoteObject.AlreadyDecoded:Boolean
 006219E0    call        0061F8EC
 006219E5    add         al,2
 006219E7    mov         byte ptr [ebx+4A4],al;TWiimoteObject.Expansion3:byte
 006219ED    movzx       eax,byte ptr [ebx+4A2];TWiimoteObject.Expansion:byte
 006219F4    test        al,al
>006219F6    je          00621A10
 006219F8    movzx       edx,byte ptr [ebx+4A4];TWiimoteObject.Expansion3:byte
 006219FF    push        edx
 00621A00    movzx       ecx,byte ptr [ebx+4A3];TWiimoteObject.Expansion2:byte
 00621A07    mov         edx,eax
 00621A09    mov         eax,ebx
 00621A0B    call        006207C8
 00621A10    movzx       eax,byte ptr [ebx+4A2];TWiimoteObject.Expansion:byte
 00621A17    test        al,al
>00621A19    jne         00621A62
 00621A1B    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621A21    call        TNunchukObject.Clear
 00621A26    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621A2C    call        TClassicObject.Clear
 00621A31    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621A37    call        TBalanceBoardObject.Clear
 00621A3C    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621A42    call        TGuitarObject.Clear
 00621A47    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621A4D    call        TDrumsObject.Clear
 00621A52    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621A58    call        TTurntableObject.Clear
>00621A5D    jmp         00621F37
 00621A62    cmp         al,1
>00621A64    jne         00621AAD
 00621A66    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621A6C    call        TNunchukObject.Clear
 00621A71    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621A77    call        TClassicObject.Clear
 00621A7C    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621A82    call        TBalanceBoardObject.Clear
 00621A87    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621A8D    call        TGuitarObject.Clear
 00621A92    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621A98    call        TDrumsObject.Clear
 00621A9D    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621AA3    call        TTurntableObject.Clear
>00621AA8    jmp         00621F37
 00621AAD    cmp         al,2
>00621AAF    jne         00621B52
 00621AB5    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621ABB    cmp         byte ptr [eax+444],0;TNunchukObject.Exists:Boolean
>00621AC2    jne         00621ACB
 00621AC4    mov         eax,ebx
 00621AC6    call        006207E8
 00621ACB    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621AD1    mov         byte ptr [eax+444],1;TNunchukObject.Exists:Boolean
 00621AD8    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621ADE    call        TClassicObject.Clear
 00621AE3    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621AE9    call        TBalanceBoardObject.Clear
 00621AEE    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621AF4    call        TGuitarObject.Clear
 00621AF9    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621AFF    call        TDrumsObject.Clear
 00621B04    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621B0A    call        TTurntableObject.Clear
 00621B0F    cmp         byte ptr [ebx+4AA],0;TWiimoteObject.ThirdParty:Boolean
>00621B16    je          00621B2B
 00621B18    cmp         dword ptr [ebx+4B0],1;TWiimoteObject.BladeFXConfidence:Integer
>00621B1F    jge         00621B2B
 00621B21    mov         dword ptr [ebx+4B0],1;TWiimoteObject.BladeFXConfidence:Integer
 00621B2B    cmp         byte ptr [ebx+4AA],0;TWiimoteObject.ThirdParty:Boolean
>00621B32    jne         00621F37
 00621B38    cmp         dword ptr [ebx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00621B3F    jle         00621F37
 00621B45    xor         eax,eax
 00621B47    mov         dword ptr [ebx+4B0],eax;TWiimoteObject.BladeFXConfidence:Integer
>00621B4D    jmp         00621F37
 00621B52    cmp         al,3
>00621B54    jne         00621D11
 00621B5A    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621B60    call        TNunchukObject.Clear
 00621B65    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621B6B    call        TBalanceBoardObject.Clear
 00621B70    cmp         byte ptr [ebx+4A3],5;TWiimoteObject.Expansion2:byte
>00621B77    jne         00621BCF
 00621B79    cmp         byte ptr [ebx+4A4],3;TWiimoteObject.Expansion3:byte
>00621B80    jne         00621BCF
 00621B82    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621B88    cmp         byte ptr [eax+8],0;TDrumsObject.Exists:Boolean
>00621B8C    jne         00621B95
 00621B8E    mov         eax,ebx
 00621B90    call        006207C4
 00621B95    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621B9B    mov         byte ptr [eax+8],1;TDrumsObject.Exists:Boolean
 00621B9F    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621BA5    call        TGuitarObject.Clear
 00621BAA    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621BB0    call        TClassicObject.Clear
 00621BB5    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621BBB    call        TTurntableObject.Clear
 00621BC0    mov         dword ptr [ebx+4B0],0FFFFFFFF;TWiimoteObject.BladeFXConfidence:Integer
>00621BCA    jmp         00621F37
 00621BCF    movzx       eax,byte ptr [ebx+4A3];TWiimoteObject.Expansion2:byte
 00621BD6    cmp         al,5
>00621BD8    jne         00621C30
 00621BDA    cmp         byte ptr [ebx+4A4],5;TWiimoteObject.Expansion3:byte
>00621BE1    jne         00621C30
 00621BE3    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621BE9    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00621BED    jne         00621BF6
 00621BEF    mov         eax,ebx
 00621BF1    call        006207F4
 00621BF6    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621BFC    mov         byte ptr [eax+8],1;TTurntableObject.Exists:Boolean
 00621C00    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621C06    call        TGuitarObject.Clear
 00621C0B    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621C11    call        TDrumsObject.Clear
 00621C16    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621C1C    call        TClassicObject.Clear
 00621C21    mov         dword ptr [ebx+4B0],0FFFFFFFF;TWiimoteObject.BladeFXConfidence:Integer
>00621C2B    jmp         00621F37
 00621C30    cmp         al,5
>00621C32    jne         00621C81
 00621C34    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621C3A    cmp         byte ptr [eax+8],0;TGuitarObject.Exists:Boolean
>00621C3E    jne         00621C47
 00621C40    mov         eax,ebx
 00621C42    call        006207D0
 00621C47    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621C4D    mov         byte ptr [eax+8],1;TGuitarObject.Exists:Boolean
 00621C51    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621C57    call        TDrumsObject.Clear
 00621C5C    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621C62    call        TTurntableObject.Clear
 00621C67    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621C6D    call        TClassicObject.Clear
 00621C72    mov         dword ptr [ebx+4B0],0FFFFFFFF;TWiimoteObject.BladeFXConfidence:Integer
>00621C7C    jmp         00621F37
 00621C81    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621C87    cmp         byte ptr [eax+8],0;TClassicObject.Exists:Boolean
>00621C8B    jne         00621C94
 00621C8D    mov         eax,ebx
 00621C8F    call        006207C0
 00621C94    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621C9A    mov         byte ptr [eax+8],1;TClassicObject.Exists:Boolean
 00621C9E    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621CA4    call        TGuitarObject.Clear
 00621CA9    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621CAF    call        TDrumsObject.Clear
 00621CB4    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621CBA    call        TTurntableObject.Clear
 00621CBF    cmp         byte ptr [ebx+4AA],0;TWiimoteObject.ThirdParty:Boolean
>00621CC6    je          00621CDB
 00621CC8    cmp         dword ptr [ebx+4B0],1;TWiimoteObject.BladeFXConfidence:Integer
>00621CCF    jge         00621CDB
 00621CD1    mov         dword ptr [ebx+4B0],1;TWiimoteObject.BladeFXConfidence:Integer
 00621CDB    cmp         byte ptr [ebx+4AA],0;TWiimoteObject.ThirdParty:Boolean
>00621CE2    jne         00621CF5
 00621CE4    cmp         dword ptr [ebx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00621CEB    jle         00621CF5
 00621CED    xor         eax,eax
 00621CEF    mov         dword ptr [ebx+4B0],eax;TWiimoteObject.BladeFXConfidence:Integer
 00621CF5    cmp         byte ptr [ebx+4A3],3;TWiimoteObject.Expansion2:byte
>00621CFC    je          00621F37
 00621D02    mov         dword ptr [ebx+4B0],0FFFFFFFF;TWiimoteObject.BladeFXConfidence:Integer
>00621D0C    jmp         00621F37
 00621D11    cmp         byte ptr [ebx+4A3],7;TWiimoteObject.Expansion2:byte
>00621D18    jne         00621EC0
 00621D1E    movzx       eax,byte ptr [ebx+4A2];TWiimoteObject.Expansion:byte
 00621D25    cmp         al,6
>00621D27    je          00621D35
 00621D29    cmp         al,7
>00621D2B    je          00621D35
 00621D2D    cmp         al,9
>00621D2F    jne         00621EC0
 00621D35    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621D3B    call        TBalanceBoardObject.Clear
 00621D40    mov         eax,dword ptr [ebx+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00621D46    cmp         byte ptr [eax+8],0;TMotionPlusObject.Exists:Boolean
>00621D4A    jne         00621D53
 00621D4C    mov         eax,ebx
 00621D4E    call        006207D4
 00621D53    cmp         byte ptr [ebx+4AD],0;TWiimoteObject.ActivatingMotionPlus:Boolean
>00621D5A    jne         00621D93
 00621D5C    cmp         byte ptr [ebx+4A2],6;TWiimoteObject.Expansion:byte
>00621D63    jne         00621D7C
 00621D65    mov         byte ptr [ebp-1],1
 00621D69    mov         byte ptr [ebx+44C],1;TWiimoteObject.NeedExpansionType:Boolean
 00621D70    mov         eax,ebx
 00621D72    call        TWiimoteObject.ActivateRealExpansion
>00621D77    jmp         00621EB0
 00621D7C    mov         byte ptr [ebp-1],1
 00621D80    mov         byte ptr [ebx+44C],1;TWiimoteObject.NeedExpansionType:Boolean
 00621D87    mov         eax,ebx
 00621D89    call        TWiimoteObject.ActivateRealExpansion
>00621D8E    jmp         00621EB0
 00621D93    movzx       eax,byte ptr [ebx+4A2];TWiimoteObject.Expansion:byte
 00621D9A    cmp         al,7
>00621D9C    jne         00621E04
 00621D9E    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621DA4    mov         byte ptr [eax+445],1;TNunchukObject.PassThrough:Boolean
 00621DAB    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621DB1    mov         byte ptr [eax+9],0;TClassicObject.PassThrough:Boolean
 00621DB5    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621DBB    mov         byte ptr [eax+9],0;TGuitarObject.PassThrough:Boolean
 00621DBF    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621DC5    mov         byte ptr [eax+9],0;TDrumsObject.PassThrough:Boolean
 00621DC9    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621DCF    mov         byte ptr [eax+9],0;TTurntableObject.PassThrough:Boolean
 00621DD3    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621DD9    call        TClassicObject.Clear
 00621DDE    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621DE4    call        TGuitarObject.Clear
 00621DE9    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621DEF    call        TDrumsObject.Clear
 00621DF4    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621DFA    call        TTurntableObject.Clear
>00621DFF    jmp         00621EB0
 00621E04    cmp         al,9
>00621E06    jne         00621E44
 00621E08    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621E0E    mov         byte ptr [eax+9],1;TClassicObject.PassThrough:Boolean
 00621E12    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621E18    mov         byte ptr [eax+9],1;TGuitarObject.PassThrough:Boolean
 00621E1C    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621E22    mov         byte ptr [eax+9],1;TDrumsObject.PassThrough:Boolean
 00621E26    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621E2C    mov         byte ptr [eax+9],1;TTurntableObject.PassThrough:Boolean
 00621E30    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621E36    mov         byte ptr [eax+445],0;TNunchukObject.PassThrough:Boolean
 00621E3D    call        TNunchukObject.Clear
>00621E42    jmp         00621EB0
 00621E44    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621E4A    mov         byte ptr [eax+445],0;TNunchukObject.PassThrough:Boolean
 00621E51    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621E57    mov         byte ptr [eax+9],0;TClassicObject.PassThrough:Boolean
 00621E5B    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621E61    mov         byte ptr [eax+9],0;TGuitarObject.PassThrough:Boolean
 00621E65    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621E6B    mov         byte ptr [eax+9],0;TDrumsObject.PassThrough:Boolean
 00621E6F    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621E75    mov         byte ptr [eax+9],0;TTurntableObject.PassThrough:Boolean
 00621E79    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621E7F    call        TNunchukObject.Clear
 00621E84    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621E8A    call        TClassicObject.Clear
 00621E8F    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621E95    call        TGuitarObject.Clear
 00621E9A    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621EA0    call        TDrumsObject.Clear
 00621EA5    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621EAB    call        TTurntableObject.Clear
 00621EB0    mov         eax,dword ptr [ebx+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00621EB6    mov         byte ptr [eax+8],1;TMotionPlusObject.Exists:Boolean
 00621EBA    mov         byte ptr [eax+9],1;TMotionPlusObject.Active:Boolean
>00621EBE    jmp         00621F37
 00621EC0    cmp         byte ptr [ebx+4A2],6;TWiimoteObject.Expansion:byte
>00621EC7    jne         00621F26
 00621EC9    cmp         byte ptr [ebx+4A3],4;TWiimoteObject.Expansion2:byte
>00621ED0    jne         00621F26
 00621ED2    mov         eax,dword ptr [ebx+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 00621ED8    mov         byte ptr [eax+8],1;TBalanceBoardObject.Exists:Boolean
 00621EDC    mov         eax,dword ptr [ebx+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00621EE2    call        TNunchukObject.Clear
 00621EE7    mov         eax,dword ptr [ebx+4B8];TWiimoteObject.Classic:TClassicObject
 00621EED    call        TClassicObject.Clear
 00621EF2    mov         eax,dword ptr [ebx+4BC];TWiimoteObject.Guitar:TGuitarObject
 00621EF8    call        TGuitarObject.Clear
 00621EFD    mov         eax,dword ptr [ebx+4C0];TWiimoteObject.Drums:TDrumsObject
 00621F03    call        TDrumsObject.Clear
 00621F08    mov         eax,dword ptr [ebx+4C4];TWiimoteObject.Turntable:TTurntableObject
 00621F0E    call        TTurntableObject.Clear
 00621F13    mov         byte ptr [ebx+452],34;TWiimoteObject.DesiredChannel:byte
 00621F1A    mov         dword ptr [ebx+4B0],0FFFFFFFF;TWiimoteObject.BladeFXConfidence:Integer
>00621F24    jmp         00621F37
 00621F26    mov         eax,ebx
 00621F28    call        006207F8
 00621F2D    mov         dword ptr [ebx+4B0],0FFFFFFFF;TWiimoteObject.BladeFXConfidence:Integer
 00621F37    cmp         byte ptr [ebp-1],0
>00621F3B    jne         00621F90
 00621F3D    cmp         byte ptr [ebx+4A2],6;TWiimoteObject.Expansion:byte
>00621F44    jne         00621F4F
 00621F46    mov         eax,ebx
 00621F48    call        TWiimoteObject.RequestBalanceBoardCalibration
>00621F4D    jmp         00621F56
 00621F4F    mov         eax,ebx
 00621F51    call        TWiimoteObject.RequestExpansionCalibration
 00621F56    cmp         byte ptr [ebp-1],0
>00621F5A    jne         00621F90
 00621F5C    cmp         byte ptr [ebx+4A2],0;TWiimoteObject.Expansion:byte
>00621F63    jne         00621F87
 00621F65    cmp         byte ptr [ebx+44B],0;TWiimoteObject.NeedCalibration:Boolean
>00621F6C    je          00621F77
 00621F6E    mov         eax,ebx
 00621F70    call        TWiimoteObject.RequestWiimoteCalibration
>00621F75    jmp         00621F87
 00621F77    cmp         byte ptr [ebx+44D],0;TWiimoteObject.NeedMotionPlusType:Boolean
>00621F7E    je          00621F87
 00621F80    mov         eax,ebx
 00621F82    call        TWiimoteObject.RequestMotionPlusType
 00621F87    mov         eax,dword ptr [ebx+4];TWiimoteObject.FManager:TComponent
 00621F8A    inc         dword ptr [eax+114]
 00621F90    pop         esi
 00621F91    pop         ebx
 00621F92    pop         ecx
 00621F93    pop         ebp
 00621F94    ret         4
*}
end;

//00621F98
procedure TWiimoteObject.ReceiveMiiReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00621F98    push        ebp
 00621F99    mov         ebp,esp
 00621F9B    pop         ebp
 00621F9C    ret         4
*}
end;

//00621FA0
procedure TWiimoteObject.ReceiveMotionPlusCalibrationReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00621FA0    push        ebp
 00621FA1    mov         ebp,esp
 00621FA3    mov         byte ptr [eax+44F],0;TWiimoteObject.NeedMotionPlusCalibration:Boolean
 00621FAA    mov         edx,dword ptr [eax+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00621FB0    cmp         byte ptr [edx+8],0;TMotionPlusObject.Exists:Boolean
>00621FB4    je          00621FC3
 00621FB6    mov         eax,edx
 00621FB8    mov         edx,ecx
 00621FBA    mov         cl,1
 00621FBC    call        TMotionPlusObject.Calibrate
>00621FC1    jmp         00621FCA
 00621FC3    mov         eax,edx
 00621FC5    call        TMotionPlusObject.Clear
 00621FCA    pop         ebp
 00621FCB    ret         4
*}
end;

//00621FD0
procedure TWiimoteObject.ReceiveMotionPlusCalibrationReport2(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00621FD0    push        ebp
 00621FD1    mov         ebp,esp
 00621FD3    push        ebx
 00621FD4    mov         ebx,eax
 00621FD6    mov         byte ptr [ebx+44F],0;TWiimoteObject.NeedMotionPlusCalibration:Boolean
 00621FDD    mov         eax,dword ptr [ebx+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00621FE3    cmp         byte ptr [eax+8],0;TMotionPlusObject.Exists:Boolean
>00621FE7    je          00621FF4
 00621FE9    mov         edx,ecx
 00621FEB    mov         cl,1
 00621FED    call        TMotionPlusObject.Calibrate2
>00621FF2    jmp         00621FF9
 00621FF4    call        TMotionPlusObject.Clear
 00621FF9    cmp         byte ptr [ebx+44B],0;TWiimoteObject.NeedCalibration:Boolean
>00622000    je          00622009
 00622002    mov         eax,ebx
 00622004    call        TWiimoteObject.RequestWiimoteCalibration
 00622009    pop         ebx
 0062200A    pop         ebp
 0062200B    ret         4
*}
end;

//00622010
procedure TWiimoteObject.ReceiveMotionPlusTypeReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00622010    push        ebp
 00622011    mov         ebp,esp
 00622013    push        ecx
 00622014    push        ebx
 00622015    push        esi
 00622016    push        edi
 00622017    mov         esi,ecx
 00622019    mov         edi,eax
 0062201B    mov         byte ptr [edi+44D],0;TWiimoteObject.NeedMotionPlusType:Boolean
 00622022    movzx       eax,byte ptr [edi+4A5];TWiimoteObject.MotionPlusType:byte
 00622029    cmp         al,2
>0062202B    je          00622031
 0062202D    cmp         al,6
>0062202F    jne         0062203A
 00622031    cmp         byte ptr [edi+4A6],7;TWiimoteObject.MotionPlusType2:byte
>00622038    je          0062203E
 0062203A    xor         eax,eax
>0062203C    jmp         00622040
 0062203E    mov         al,1
 00622040    mov         byte ptr [ebp-1],al
 00622043    cmp         byte ptr [esi+2],0F7
>00622047    jne         00622060
 00622049    mov         byte ptr [edi+4A5],0;TWiimoteObject.MotionPlusType:byte
 00622050    mov         byte ptr [edi+4A6],0;TWiimoteObject.MotionPlusType2:byte
 00622057    mov         byte ptr [edi+4A7],0;TWiimoteObject.MotionPlusType3:byte
>0062205E    jmp         006220A0
 00622060    cmp         byte ptr [esi+5],55
 00622064    sete        bl
 00622067    mov         edx,ebx
 00622069    movzx       eax,byte ptr [esi+13]
 0062206D    call        0061F8EC
 00622072    add         al,2
 00622074    mov         byte ptr [edi+4A5],al;TWiimoteObject.MotionPlusType:byte
 0062207A    mov         edx,ebx
 0062207C    movzx       eax,byte ptr [esi+14]
 00622080    call        0061F8EC
 00622085    add         al,2
 00622087    mov         byte ptr [edi+4A6],al;TWiimoteObject.MotionPlusType2:byte
 0062208D    mov         edx,ebx
 0062208F    movzx       eax,byte ptr [esi+0F]
 00622093    call        0061F8EC
 00622098    add         al,2
 0062209A    mov         byte ptr [edi+4A7],al;TWiimoteObject.MotionPlusType3:byte
 006220A0    xor         ebx,ebx
 006220A2    cmp         byte ptr [edi+4A5],0;TWiimoteObject.MotionPlusType:byte
>006220A9    jne         006220C8
 006220AB    cmp         byte ptr [ebp-1],0
>006220AF    je          006220B8
 006220B1    mov         eax,edi
 006220B3    call        00623F54
 006220B8    mov         eax,dword ptr [edi+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 006220BE    call        TMotionPlusObject.Clear
>006220C3    jmp         00622185
 006220C8    movzx       eax,byte ptr [edi+4A5];TWiimoteObject.MotionPlusType:byte
 006220CF    cmp         al,2
>006220D1    je          006220D7
 006220D3    cmp         al,6
>006220D5    jne         00622103
 006220D7    cmp         byte ptr [edi+4A6],7;TWiimoteObject.MotionPlusType2:byte
>006220DE    jne         00622103
 006220E0    cmp         byte ptr [ebp-1],0
>006220E4    jne         006220ED
 006220E6    mov         eax,edi
 006220E8    call        006207D4
 006220ED    mov         eax,dword ptr [edi+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 006220F3    mov         byte ptr [eax+8],1;TMotionPlusObject.Exists:Boolean
 006220F7    movzx       ebx,byte ptr [edi+448];TWiimoteObject.FUseMotionPlus:Boolean
>006220FE    jmp         00622185
 00622103    movzx       eax,byte ptr [edi+4A5];TWiimoteObject.MotionPlusType:byte
 0062210A    cmp         al,2
>0062210C    je          00622112
 0062210E    cmp         al,7
>00622110    jne         0062213B
 00622112    cmp         byte ptr [edi+4A6],7;TWiimoteObject.MotionPlusType2:byte
>00622119    jne         0062213B
 0062211B    cmp         byte ptr [ebp-1],0
>0062211F    jne         00622128
 00622121    mov         eax,edi
 00622123    call        006207D4
 00622128    mov         eax,dword ptr [edi+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 0062212E    mov         byte ptr [eax+8],1;TMotionPlusObject.Exists:Boolean
 00622132    movzx       ebx,byte ptr [edi+448];TWiimoteObject.FUseMotionPlus:Boolean
>00622139    jmp         00622185
 0062213B    movzx       eax,byte ptr [edi+4A5];TWiimoteObject.MotionPlusType:byte
 00622142    cmp         al,2
>00622144    je          0062214A
 00622146    cmp         al,9
>00622148    jne         00622173
 0062214A    cmp         byte ptr [edi+4A6],7;TWiimoteObject.MotionPlusType2:byte
>00622151    jne         00622173
 00622153    cmp         byte ptr [ebp-1],0
>00622157    jne         00622160
 00622159    mov         eax,edi
 0062215B    call        006207D4
 00622160    mov         eax,dword ptr [edi+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00622166    mov         byte ptr [eax+8],1;TMotionPlusObject.Exists:Boolean
 0062216A    movzx       ebx,byte ptr [edi+448];TWiimoteObject.FUseMotionPlus:Boolean
>00622171    jmp         00622185
 00622173    mov         eax,edi
 00622175    call        006207F8
 0062217A    mov         eax,dword ptr [edi+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 00622180    call        TMotionPlusObject.Clear
 00622185    test        bl,bl
>00622187    je          006221E3
 00622189    mov         eax,dword ptr [edi+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 0062218F    cmp         byte ptr [eax+444],0;TNunchukObject.Exists:Boolean
>00622196    je          006221A1
 00622198    mov         eax,edi
 0062219A    call        TWiimoteObject.ActivateNunchukPassThrough
>0062219F    jmp         0062220C
 006221A1    mov         eax,dword ptr [edi+4B8];TWiimoteObject.Classic:TClassicObject
 006221A7    cmp         byte ptr [eax+8],0;TClassicObject.Exists:Boolean
>006221AB    jne         006221D1
 006221AD    mov         eax,dword ptr [edi+4BC];TWiimoteObject.Guitar:TGuitarObject
 006221B3    cmp         byte ptr [eax+8],0;TGuitarObject.Exists:Boolean
>006221B7    jne         006221D1
 006221B9    mov         eax,dword ptr [edi+4C0];TWiimoteObject.Drums:TDrumsObject
 006221BF    cmp         byte ptr [eax+8],0;TDrumsObject.Exists:Boolean
>006221C3    jne         006221D1
 006221C5    mov         eax,dword ptr [edi+4C4];TWiimoteObject.Turntable:TTurntableObject
 006221CB    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>006221CF    je          006221DA
 006221D1    mov         eax,edi
 006221D3    call        TWiimoteObject.ActivateClassicPassThrough
>006221D8    jmp         0062220C
 006221DA    mov         eax,edi
 006221DC    call        TWiimoteObject.ActivateMotionPlus
>006221E1    jmp         0062220C
 006221E3    cmp         byte ptr [edi+451],0;TWiimoteObject.NeedIR:Boolean
>006221EA    je          006221F5
 006221EC    mov         eax,edi
 006221EE    call        TWiimoteObject.EnableIR
>006221F3    jmp         0062220C
 006221F5    cmp         byte ptr [edi+450],0;TWiimoteObject.NeedChannel:Boolean
>006221FC    je          0062220C
 006221FE    movzx       edx,byte ptr [edi+452];TWiimoteObject.DesiredChannel:byte
 00622205    mov         eax,edi
 00622207    call        TWiimoteObject.SetChannel
 0062220C    pop         edi
 0062220D    pop         esi
 0062220E    pop         ebx
 0062220F    pop         ecx
 00622210    pop         ebp
 00622211    ret         4
*}
end;

//00622214
procedure TWiimoteObject.ReceiveReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00622214    push        ebp
 00622215    mov         ebp,esp
 00622217    push        ecx
 00622218    push        ebx
 00622219    push        esi
 0062221A    push        edi
 0062221B    mov         dword ptr [ebp-4],ecx
 0062221E    mov         ebx,edx
 00622220    mov         esi,eax
 00622222    mov         eax,ebx
 00622224    call        0061F7C0
 00622229    mov         edi,eax
 0062222B    mov         byte ptr [esi+440],1;TWiimoteObject.ReceivedAnyMessage:Boolean
 00622232    cmp         ebx,30
>00622235    je          00622243
 00622237    cmp         ebx,22
>0062223A    je          00622243
 0062223C    mov         byte ptr [esi+443],1;TWiimoteObject.ReceivedAdvancedMessage:Boolean
 00622243    cmp         ebx,3D
>00622246    je          00622255
 00622248    push        edi
 00622249    mov         ecx,dword ptr [ebp-4]
 0062224C    mov         edx,ebx
 0062224E    mov         eax,esi
 00622250    call        TWiimoteObject.ReceiveButtons
 00622255    cmp         ebx,30
>00622258    jl          00622271
 0062225A    cmp         ebx,3F
>0062225D    jg          00622271
 0062225F    push        edi
 00622260    mov         ecx,dword ptr [ebp-4]
 00622263    mov         edx,ebx
 00622265    mov         eax,esi
 00622267    call        TWiimoteObject.ReceiveDataReport
>0062226C    jmp         006224C5
 00622271    cmp         ebx,22
>00622274    jne         00622288
 00622276    push        edi
 00622277    mov         ecx,dword ptr [ebp-4]
 0062227A    mov         edx,ebx
 0062227C    mov         eax,esi
 0062227E    call        TWiimoteObject.ReceiveWriteConfirmationReport
>00622283    jmp         006224C5
 00622288    cmp         ebx,20
>0062228B    jne         0062229F
 0062228D    push        edi
 0062228E    mov         ecx,dword ptr [ebp-4]
 00622291    mov         edx,ebx
 00622293    mov         eax,esi
 00622295    call        TWiimoteObject.ReceiveStatusReport
>0062229A    jmp         006224C5
 0062229F    cmp         ebx,21
>006222A2    jne         006224C5
 006222A8    mov         eax,dword ptr [ebp-4]
 006222AB    cmp         byte ptr [eax+2],90
>006222AF    jne         006222D5
 006222B1    mov         eax,dword ptr [ebp-4]
 006222B4    cmp         byte ptr [eax+3],0
>006222B8    jne         006222D5
 006222BA    mov         eax,dword ptr [ebp-4]
 006222BD    cmp         byte ptr [eax+4],16
>006222C1    jne         006222D5
 006222C3    push        edi
 006222C4    mov         ecx,dword ptr [ebp-4]
 006222C7    mov         edx,ebx
 006222C9    mov         eax,esi
 006222CB    call        TWiimoteObject.ReceiveWiimoteCalibrationReport
>006222D0    jmp         006224C5
 006222D5    mov         eax,dword ptr [ebp-4]
 006222D8    cmp         byte ptr [eax+2],0F0
>006222DC    jne         00622302
 006222DE    mov         eax,dword ptr [ebp-4]
 006222E1    cmp         byte ptr [eax+3],0A6
>006222E5    jne         00622302
 006222E7    mov         eax,dword ptr [ebp-4]
 006222EA    cmp         byte ptr [eax+4],20
>006222EE    jne         00622302
 006222F0    push        edi
 006222F1    mov         ecx,dword ptr [ebp-4]
 006222F4    mov         edx,ebx
 006222F6    mov         eax,esi
 006222F8    call        TWiimoteObject.ReceiveMotionPlusCalibrationReport
>006222FD    jmp         006224C5
 00622302    mov         eax,dword ptr [ebp-4]
 00622305    cmp         byte ptr [eax+2],0F0
>00622309    jne         0062232F
 0062230B    mov         eax,dword ptr [ebp-4]
 0062230E    cmp         byte ptr [eax+3],0A6
>00622312    jne         0062232F
 00622314    mov         eax,dword ptr [ebp-4]
 00622317    cmp         byte ptr [eax+4],30
>0062231B    jne         0062232F
 0062231D    push        edi
 0062231E    mov         ecx,dword ptr [ebp-4]
 00622321    mov         edx,ebx
 00622323    mov         eax,esi
 00622325    call        TWiimoteObject.ReceiveMotionPlusCalibrationReport2
>0062232A    jmp         006224C5
 0062232F    mov         eax,dword ptr [ebp-4]
 00622332    cmp         byte ptr [eax+2],0F0
>00622336    jne         00622365
 00622338    mov         eax,dword ptr [ebp-4]
 0062233B    cmp         byte ptr [eax+3],0A6
>0062233F    jne         00622365
 00622341    mov         eax,dword ptr [ebp-4]
 00622344    cmp         byte ptr [eax+4],0F0
>00622348    jne         00622365
 0062234A    mov         eax,dword ptr [ebp-4]
 0062234D    cmp         byte ptr [eax+11],0A6
>00622351    jne         00622365
 00622353    push        edi
 00622354    mov         ecx,dword ptr [ebp-4]
 00622357    mov         edx,ebx
 00622359    mov         eax,esi
 0062235B    call        TWiimoteObject.ReceiveMotionPlusTypeReport
>00622360    jmp         006224C5
 00622365    mov         eax,dword ptr [ebp-4]
 00622368    cmp         byte ptr [eax+2],0F7
>0062236C    jne         00622392
 0062236E    mov         eax,dword ptr [ebp-4]
 00622371    cmp         byte ptr [eax+3],0A6
>00622375    jne         00622392
 00622377    mov         eax,dword ptr [ebp-4]
 0062237A    cmp         byte ptr [eax+4],0F0
>0062237E    jne         00622392
 00622380    push        edi
 00622381    mov         ecx,dword ptr [ebp-4]
 00622384    mov         edx,ebx
 00622386    mov         eax,esi
 00622388    call        TWiimoteObject.ReceiveMotionPlusTypeReport
>0062238D    jmp         006224C5
 00622392    mov         eax,dword ptr [ebp-4]
 00622395    cmp         byte ptr [eax+2],0F0
>00622399    jne         006223C8
 0062239B    mov         eax,dword ptr [ebp-4]
 0062239E    cmp         byte ptr [eax+3],0
>006223A2    jne         006223C8
 006223A4    mov         eax,dword ptr [ebp-4]
 006223A7    cmp         byte ptr [eax+4],20
>006223AB    jne         006223C8
 006223AD    cmp         byte ptr [esi+4A2],0;TWiimoteObject.Expansion:byte
>006223B4    je          006223C8
 006223B6    push        edi
 006223B7    mov         ecx,dword ptr [ebp-4]
 006223BA    mov         edx,ebx
 006223BC    mov         eax,esi
 006223BE    call        TWiimoteObject.ReceiveExpansionCalibrationReport
>006223C3    jmp         006224C5
 006223C8    mov         eax,dword ptr [ebp-4]
 006223CB    cmp         byte ptr [eax+2],0F0
>006223CF    jne         006223FE
 006223D1    mov         eax,dword ptr [ebp-4]
 006223D4    cmp         byte ptr [eax+3],0
>006223D8    jne         006223FE
 006223DA    mov         eax,dword ptr [ebp-4]
 006223DD    cmp         byte ptr [eax+4],30
>006223E1    jne         006223FE
 006223E3    cmp         byte ptr [esi+4A2],0;TWiimoteObject.Expansion:byte
>006223EA    je          006223FE
 006223EC    push        edi
 006223ED    mov         ecx,dword ptr [ebp-4]
 006223F0    mov         edx,ebx
 006223F2    mov         eax,esi
 006223F4    call        TWiimoteObject.ReceiveExpansionCalibrationReport2
>006223F9    jmp         006224C5
 006223FE    mov         eax,dword ptr [ebp-4]
 00622401    cmp         byte ptr [eax+2],0F0
>00622405    jne         00622434
 00622407    mov         eax,dword ptr [ebp-4]
 0062240A    cmp         byte ptr [eax+3],0
>0062240E    jne         00622434
 00622410    mov         eax,dword ptr [ebp-4]
 00622413    cmp         byte ptr [eax+4],0F0
>00622417    jne         00622434
 00622419    cmp         byte ptr [esi+4A2],0;TWiimoteObject.Expansion:byte
>00622420    je          00622434
 00622422    push        edi
 00622423    mov         ecx,dword ptr [ebp-4]
 00622426    mov         edx,ebx
 00622428    mov         eax,esi
 0062242A    call        TWiimoteObject.ReceiveExpansionTypeReport
>0062242F    jmp         006224C5
 00622434    mov         eax,dword ptr [ebp-4]
 00622437    cmp         byte ptr [eax+2],0F7
>0062243B    jne         0062244F
 0062243D    mov         eax,dword ptr [ebp-4]
 00622440    cmp         byte ptr [eax+3],0
>00622444    jne         0062244F
 00622446    mov         eax,dword ptr [ebp-4]
 00622449    cmp         byte ptr [eax+4],0F0
>0062244D    je          006224C5
 0062244F    mov         eax,dword ptr [ebp-4]
 00622452    cmp         byte ptr [eax+2],0F0
>00622456    jne         0062248B
 00622458    mov         eax,dword ptr [ebp-4]
 0062245B    cmp         byte ptr [eax+3],0BF
>0062245F    jne         0062248B
 00622461    mov         eax,dword ptr [ebp-4]
 00622464    cmp         byte ptr [eax+4],40
>00622468    jb          0062248B
 0062246A    mov         eax,dword ptr [ebp-4]
 0062246D    cmp         byte ptr [eax+4],0E0
>00622471    ja          0062248B
 00622473    mov         eax,dword ptr [ebp-4]
 00622476    test        byte ptr [eax+4],0F
>0062247A    jne         0062248B
 0062247C    push        edi
 0062247D    mov         ecx,dword ptr [ebp-4]
 00622480    mov         edx,ebx
 00622482    mov         eax,esi
 00622484    call        TWiimoteObject.ReceiveBladeFXOverflowReport
>00622489    jmp         006224C5
 0062248B    mov         eax,dword ptr [ebp-4]
 0062248E    cmp         byte ptr [eax+2],0F0
>00622492    jne         006224AF
 00622494    mov         eax,dword ptr [ebp-4]
 00622497    cmp         byte ptr [eax+3],0
>0062249B    jne         006224AF
 0062249D    mov         eax,dword ptr [ebp-4]
 006224A0    cmp         byte ptr [eax+4],0
>006224A4    jne         006224AF
 006224A6    cmp         byte ptr [esi+4A2],0;TWiimoteObject.Expansion:byte
>006224AD    jne         006224C5
 006224AF    cmp         byte ptr ds:[81D908],0;gvar_0081D908
>006224B6    je          006224C5
 006224B8    push        edi
 006224B9    mov         ecx,dword ptr [ebp-4]
 006224BC    mov         edx,ebx
 006224BE    mov         eax,esi
 006224C0    call        TWiimoteObject.ReceiveMiiReport
 006224C5    lea         eax,[esi+45C];TWiimoteObject.InByte:?
 006224CB    xor         ecx,ecx
 006224CD    mov         edx,16
 006224D2    call        @FillChar
 006224D7    mov         byte ptr [esi+45C],bl;TWiimoteObject.InByte:?
 006224DD    lea         edx,[esi+45D];TWiimoteObject.?f45D:?
 006224E3    mov         eax,dword ptr [ebp-4]
 006224E6    mov         ecx,edi
 006224E8    call        Move
 006224ED    pop         edi
 006224EE    pop         esi
 006224EF    pop         ebx
 006224F0    pop         ecx
 006224F1    pop         ebp
 006224F2    ret         4
*}
end;

//006224F8
procedure TWiimoteObject.ReceiveStatusReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 006224F8    push        ebp
 006224F9    mov         ebp,esp
 006224FB    push        ebx
 006224FC    push        esi
 006224FD    mov         esi,eax
 006224FF    cmp         byte ptr [esi+442],0;TWiimoteObject.ReceivedStatusError:Boolean
>00622506    jne         00622729
 0062250C    mov         byte ptr [esi+441],1;TWiimoteObject.ReceivedStatusMessage:Boolean
 00622513    movzx       eax,byte ptr [ecx+2]
 00622517    xor         al,byte ptr [esi+4A0];TWiimoteObject.State:byte
 0062251D    test        al,2
 0062251F    setne       bl
 00622522    movzx       eax,byte ptr [esi+450];TWiimoteObject.NeedChannel:Boolean
 00622529    or          al,bl
 0062252B    mov         byte ptr [esi+450],al;TWiimoteObject.NeedChannel:Boolean
 00622531    cmp         byte ptr [esi+18],0;TWiimoteObject.Connected:Boolean
>00622535    je          00622562
 00622537    cmp         byte ptr [esi+4AE],0;TWiimoteObject.DeactivatingMotionPlus:Boolean
>0062253E    jne         00622562
 00622540    cmp         byte ptr [esi+4AD],0;TWiimoteObject.ActivatingMotionPlus:Boolean
>00622547    jne         00622562
 00622549    mov         eax,dword ptr [esi+4C8];TWiimoteObject.MotionPlus:TMotionPlusObject
 0062254F    cmp         byte ptr [eax+8],0;TMotionPlusObject.Exists:Boolean
>00622553    jne         00622562
 00622555    movzx       eax,byte ptr [esi+448];TWiimoteObject.FUseMotionPlus:Boolean
 0062255C    mov         byte ptr [esi+44D],al;TWiimoteObject.NeedMotionPlusType:Boolean
 00622562    movzx       eax,byte ptr [ecx+2]
 00622566    mov         byte ptr [esi+4A0],al;TWiimoteObject.State:byte
 0062256C    movzx       eax,byte ptr [ecx+5]
 00622570    mov         byte ptr [esi+4A1],al;TWiimoteObject.Battery:byte
 00622576    test        byte ptr [esi+4A0],2;TWiimoteObject.State:byte
>0062257D    jne         0062264F
 00622583    cmp         byte ptr [esi+4AD],0;TWiimoteObject.ActivatingMotionPlus:Boolean
>0062258A    jne         00622729
 00622590    test        bl,bl
>00622592    je          006225A0
 00622594    call        00600EA0
 00622599    fstp        qword ptr [esi+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 0062259F    wait
 006225A0    cmp         dword ptr [esi+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>006225A7    jg          006226E5
 006225AD    test        bl,bl
>006225AF    je          006225CE
 006225B1    movzx       eax,byte ptr [esi+4A4];TWiimoteObject.Expansion3:byte
 006225B8    push        eax
 006225B9    movzx       ecx,byte ptr [esi+4A3];TWiimoteObject.Expansion2:byte
 006225C0    movzx       edx,byte ptr [esi+4A2];TWiimoteObject.Expansion:byte
 006225C7    mov         eax,esi
 006225C9    call        00623EE0
 006225CE    mov         byte ptr [esi+44C],0;TWiimoteObject.NeedExpansionType:Boolean
 006225D5    mov         byte ptr [esi+4A2],0;TWiimoteObject.Expansion:byte
 006225DC    mov         byte ptr [esi+4A3],0;TWiimoteObject.Expansion2:byte
 006225E3    mov         byte ptr [esi+4A4],0;TWiimoteObject.Expansion3:byte
 006225EA    mov         byte ptr [esi+4AA],0;TWiimoteObject.ThirdParty:Boolean
 006225F1    cmp         dword ptr [esi+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>006225F8    jle         00622602
 006225FA    xor         eax,eax
 006225FC    mov         dword ptr [esi+4B0],eax;TWiimoteObject.BladeFXConfidence:Integer
 00622602    mov         eax,dword ptr [esi+4];TWiimoteObject.FManager:TComponent
 00622605    inc         dword ptr [eax+114]
 0062260B    test        bl,bl
>0062260D    je          006226E5
 00622613    mov         eax,dword ptr [esi+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00622619    call        TNunchukObject.Clear
 0062261E    mov         eax,dword ptr [esi+4B8];TWiimoteObject.Classic:TClassicObject
 00622624    call        TClassicObject.Clear
 00622629    mov         eax,dword ptr [esi+4CC];TWiimoteObject.BalanceBoard:TBalanceBoardObject
 0062262F    call        TBalanceBoardObject.Clear
 00622634    mov         eax,dword ptr [esi+4BC];TWiimoteObject.Guitar:TGuitarObject
 0062263A    call        TGuitarObject.Clear
 0062263F    mov         eax,dword ptr [esi+4C0];TWiimoteObject.Drums:TDrumsObject
 00622645    call        TDrumsObject.Clear
>0062264A    jmp         006226E5
 0062264F    test        bl,bl
>00622651    je          006226E5
 00622657    cmp         dword ptr [esi+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>0062265E    jle         0062269E
 00622660    call        00600EA0
 00622665    fsub        qword ptr [esi+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 0062266B    fcomp       dword ptr ds:[622730];4:Single
 00622671    wait
 00622672    fnstsw      al
 00622674    sahf
>00622675    jae         0062269E
 00622677    xor         eax,eax
 00622679    mov         dword ptr [esi+4E0],eax;TWiimoteObject.BladeFXDisconnectTime:Double
 0062267F    mov         dword ptr [esi+4E4],eax;TWiimoteObject.?f4E4:dword
 00622685    cmp         byte ptr [esi+447],0;TWiimoteObject.FUseExpansion:Boolean
>0062268C    je          006226E5
 0062268E    mov         eax,esi
 00622690    call        TWiimoteObject.EnableNintendoExpansion
 00622695    mov         eax,esi
 00622697    call        TWiimoteObject.RequestExpansionType
>0062269C    jmp         006226E5
 0062269E    xor         eax,eax
 006226A0    mov         dword ptr [esi+4E0],eax;TWiimoteObject.BladeFXDisconnectTime:Double
 006226A6    mov         dword ptr [esi+4E4],eax;TWiimoteObject.?f4E4:dword
 006226AC    mov         byte ptr [esi+4AE],0;TWiimoteObject.DeactivatingMotionPlus:Boolean
 006226B3    mov         byte ptr [esi+4AA],0;TWiimoteObject.ThirdParty:Boolean
 006226BA    xor         eax,eax
 006226BC    mov         dword ptr [esi+4B0],eax;TWiimoteObject.BladeFXConfidence:Integer
 006226C2    mov         byte ptr [esi+4A2],1;TWiimoteObject.Expansion:byte
 006226C9    mov         byte ptr [esi+4A3],1;TWiimoteObject.Expansion2:byte
 006226D0    mov         eax,esi
 006226D2    call        TWiimoteObject.EnableNintendoExpansion
 006226D7    push        14
 006226D9    call        kernel32.Sleep
 006226DE    mov         eax,esi
 006226E0    call        TWiimoteObject.RequestExpansionType
 006226E5    cmp         byte ptr [esi+18],0;TWiimoteObject.Connected:Boolean
>006226E9    je          00622729
 006226EB    test        byte ptr [esi+4A0],2;TWiimoteObject.State:byte
>006226F2    jne         0062271B
 006226F4    movzx       eax,byte ptr [esi+452];TWiimoteObject.DesiredChannel:byte
 006226FB    call        0061F75C
 00622700    mov         edx,eax
 00622702    mov         eax,esi
 00622704    call        TWiimoteObject.SetChannel
 00622709    cmp         byte ptr [esi+44D],0;TWiimoteObject.NeedMotionPlusType:Boolean
>00622710    je          00622729
 00622712    mov         eax,esi
 00622714    call        TWiimoteObject.RequestMotionPlusType
>00622719    jmp         00622729
 0062271B    movzx       edx,byte ptr [esi+452];TWiimoteObject.DesiredChannel:byte
 00622722    mov         eax,esi
 00622724    call        TWiimoteObject.SetChannel
 00622729    pop         esi
 0062272A    pop         ebx
 0062272B    pop         ebp
 0062272C    ret         4
*}
end;

//00622734
procedure TWiimoteObject.ReceiveWiimoteCalibrationReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00622734    push        ebp
 00622735    mov         ebp,esp
 00622737    push        ecx
 00622738    push        ebx
 00622739    mov         byte ptr [eax+44B],0;TWiimoteObject.NeedCalibration:Boolean
 00622740    cmp         byte ptr [eax+4D0],0;TWiimoteObject.UseBuiltInCalibration:Boolean
>00622747    je          006228A2
 0062274D    movzx       edx,byte ptr [ecx+5]
 00622751    mov         ebx,80
 00622756    sub         ebx,edx
 00622758    mov         dword ptr [ebp-4],ebx
 0062275B    fild        dword ptr [ebp-4]
 0062275E    fstp        qword ptr [eax+278];TWiimoteObject.cyx:Double
 00622764    wait
 00622765    mov         edx,dword ptr [eax+278];TWiimoteObject.cyx:Double
 0062276B    mov         dword ptr [eax+290],edx;TWiimoteObject.czx:Double
 00622771    mov         edx,dword ptr [eax+27C];TWiimoteObject.?f27C:dword
 00622777    mov         dword ptr [eax+294],edx;TWiimoteObject.?f294:dword
 0062277D    mov         edx,dword ptr [eax+278];TWiimoteObject.cyx:Double
 00622783    mov         dword ptr [eax+300],edx;TWiimoteObject.RawZeroForceX:Double
 00622789    mov         edx,dword ptr [eax+27C];TWiimoteObject.?f27C:dword
 0062278F    mov         dword ptr [eax+304],edx;TWiimoteObject.?f304:dword
 00622795    movzx       edx,byte ptr [ecx+7]
 00622799    sub         edx,80
 0062279F    mov         dword ptr [ebp-4],edx
 006227A2    fild        dword ptr [ebp-4]
 006227A5    fstp        qword ptr [eax+268];TWiimoteObject.cxy:Double
 006227AB    wait
 006227AC    mov         edx,dword ptr [eax+268];TWiimoteObject.cxy:Double
 006227B2    mov         dword ptr [eax+298],edx;TWiimoteObject.czy:Double
 006227B8    mov         edx,dword ptr [eax+26C];TWiimoteObject.?f26C:dword
 006227BE    mov         dword ptr [eax+29C],edx;TWiimoteObject.?f29C:dword
 006227C4    mov         edx,dword ptr [eax+268];TWiimoteObject.cxy:Double
 006227CA    mov         dword ptr [eax+308],edx;TWiimoteObject.RawZeroForceY:Double
 006227D0    mov         edx,dword ptr [eax+26C];TWiimoteObject.?f26C:dword
 006227D6    mov         dword ptr [eax+30C],edx;TWiimoteObject.?f30C:dword
 006227DC    movzx       edx,byte ptr [ecx+6]
 006227E0    mov         ebx,80
 006227E5    sub         ebx,edx
 006227E7    mov         dword ptr [ebp-4],ebx
 006227EA    fild        dword ptr [ebp-4]
 006227ED    fstp        qword ptr [eax+270];TWiimoteObject.cxz:Double
 006227F3    wait
 006227F4    mov         edx,dword ptr [eax+270];TWiimoteObject.cxz:Double
 006227FA    mov         dword ptr [eax+288],edx;TWiimoteObject.cyz:Double
 00622800    mov         edx,dword ptr [eax+274];TWiimoteObject.?f274:dword
 00622806    mov         dword ptr [eax+28C],edx;TWiimoteObject.?f28C:dword
 0062280C    mov         edx,dword ptr [eax+270];TWiimoteObject.cxz:Double
 00622812    mov         dword ptr [eax+310],edx;TWiimoteObject.RawZeroForceZ:Double
 00622818    mov         edx,dword ptr [eax+274];TWiimoteObject.?f274:dword
 0062281E    mov         dword ptr [eax+314],edx;TWiimoteObject.?f314:dword
 00622824    movzx       edx,byte ptr [ecx+9]
 00622828    movzx       ebx,byte ptr [ecx+5]
 0062282C    sub         edx,ebx
 0062282E    mov         dword ptr [ebp-4],edx
 00622831    fild        dword ptr [ebp-4]
 00622834    fstp        qword ptr [eax+318];TWiimoteObject.RawForcePerGX:Double
 0062283A    wait
 0062283B    fld         qword ptr [eax+300];TWiimoteObject.RawZeroForceX:Double
 00622841    fadd        qword ptr [eax+318];TWiimoteObject.RawForcePerGX:Double
 00622847    fstp        qword ptr [eax+260];TWiimoteObject.cxx:Double
 0062284D    wait
 0062284E    movzx       edx,byte ptr [ecx+0B]
 00622852    movzx       ebx,byte ptr [ecx+7]
 00622856    sub         edx,ebx
 00622858    mov         dword ptr [ebp-4],edx
 0062285B    fild        dword ptr [ebp-4]
 0062285E    fstp        qword ptr [eax+320];TWiimoteObject.RawForcePerGY:Double
 00622864    wait
 00622865    fld         qword ptr [eax+308];TWiimoteObject.RawZeroForceY:Double
 0062286B    fadd        qword ptr [eax+320];TWiimoteObject.RawForcePerGY:Double
 00622871    fstp        qword ptr [eax+280];TWiimoteObject.cyy:Double
 00622877    wait
 00622878    movzx       edx,byte ptr [ecx+0A]
 0062287C    movzx       ecx,byte ptr [ecx+6]
 00622880    sub         edx,ecx
 00622882    mov         dword ptr [ebp-4],edx
 00622885    fild        dword ptr [ebp-4]
 00622888    fstp        qword ptr [eax+328];TWiimoteObject.RawForcePerGZ:Double
 0062288E    wait
 0062288F    fld         qword ptr [eax+310];TWiimoteObject.RawZeroForceZ:Double
 00622895    fadd        qword ptr [eax+328];TWiimoteObject.RawForcePerGZ:Double
 0062289B    fstp        qword ptr [eax+2A0];TWiimoteObject.czz:Double
 006228A1    wait
 006228A2    cmp         byte ptr [eax+44C],0;TWiimoteObject.NeedExpansionType:Boolean
>006228A9    je          006228B2
 006228AB    call        TWiimoteObject.RequestExpansionType
>006228B0    jmp         006228F7
 006228B2    cmp         byte ptr [eax+44E],0;TWiimoteObject.NeedExpansionCalibration:Boolean
>006228B9    je          006228C2
 006228BB    call        TWiimoteObject.RequestExpansionCalibration
>006228C0    jmp         006228F7
 006228C2    cmp         byte ptr [eax+44D],0;TWiimoteObject.NeedMotionPlusType:Boolean
>006228C9    je          006228D2
 006228CB    call        TWiimoteObject.RequestMotionPlusType
>006228D0    jmp         006228F7
 006228D2    cmp         byte ptr [eax+451],0;TWiimoteObject.NeedIR:Boolean
>006228D9    je          006228E2
 006228DB    call        TWiimoteObject.EnableIR
>006228E0    jmp         006228F7
 006228E2    cmp         byte ptr [eax+450],0;TWiimoteObject.NeedChannel:Boolean
>006228E9    je          006228F7
 006228EB    movzx       edx,byte ptr [eax+452];TWiimoteObject.DesiredChannel:byte
 006228F2    call        TWiimoteObject.SetChannel
 006228F7    pop         ebx
 006228F8    pop         ecx
 006228F9    pop         ebp
 006228FA    ret         4
*}
end;

//00622900
procedure TWiimoteObject.ReceiveWriteConfirmationReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 00622900    push        ebp
 00622901    mov         ebp,esp
 00622903    cmp         byte ptr [ecx+2],15
>00622907    jne         00622918
 00622909    cmp         byte ptr [ecx+3],3
>0062290D    jne         00622918
 0062290F    mov         byte ptr [eax+442],1;TWiimoteObject.ReceivedStatusError:Boolean
>00622916    jmp         00622965
 00622918    cmp         byte ptr [ecx+2],16
>0062291C    jne         0062295B
 0062291E    cmp         byte ptr [ecx+3],0
>00622922    jne         0062295B
 00622924    cmp         byte ptr [eax+44C],0;TWiimoteObject.NeedExpansionType:Boolean
>0062292B    je          00622934
 0062292D    call        TWiimoteObject.RequestExpansionType
>00622932    jmp         00622965
 00622934    cmp         byte ptr [eax+451],0;TWiimoteObject.NeedIR:Boolean
>0062293B    je          00622944
 0062293D    call        TWiimoteObject.EnableIR
>00622942    jmp         00622965
 00622944    cmp         byte ptr [eax+450],0;TWiimoteObject.NeedChannel:Boolean
>0062294B    je          00622965
 0062294D    movzx       edx,byte ptr [eax+452];TWiimoteObject.DesiredChannel:byte
 00622954    call        TWiimoteObject.SetChannel
>00622959    jmp         00622965
 0062295B    cmp         byte ptr [ecx+2],16
>0062295F    jne         00622965
 00622961    cmp         byte ptr [ecx+3],7
 00622965    pop         ebp
 00622966    ret         4
*}
end;

//0062296C
procedure TWiimoteObject.RequestBalanceBoardCalibration;
begin
{*
 0062296C    push        ebx
 0062296D    push        esi
 0062296E    add         esp,0FFFFFFE8
 00622971    mov         esi,eax
 00622973    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00622977    je          006229E0
 00622979    mov         ebx,4A40020
 0062297E    and         ebx,0FEFFFFFF
 00622984    mov         eax,esp
 00622986    xor         ecx,ecx
 00622988    mov         edx,16
 0062298D    call        @FillChar
 00622992    mov         byte ptr [esp],17
 00622996    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 0062299D    mov         edx,ebx
 0062299F    shr         edx,18
 006229A2    and         dl,0FF
 006229A5    or          al,dl
 006229A7    mov         byte ptr [esp+1],al
 006229AB    mov         eax,ebx
 006229AD    shr         eax,10
 006229B0    and         al,0FF
 006229B2    mov         byte ptr [esp+2],al
 006229B6    mov         eax,ebx
 006229B8    shr         eax,8
 006229BB    and         al,0FF
 006229BD    mov         byte ptr [esp+3],al
 006229C1    and         bl,0FF
 006229C4    mov         byte ptr [esp+4],bl
 006229C8    mov         byte ptr [esp+5],0
 006229CD    mov         byte ptr [esp+6],20
 006229D2    mov         edx,esp
 006229D4    mov         ecx,16
 006229D9    mov         eax,esi
 006229DB    call        TManagedHidObject.SendReport
 006229E0    add         esp,18
 006229E3    pop         esi
 006229E4    pop         ebx
 006229E5    ret
*}
end;

//006229E8
procedure TWiimoteObject.RequestBladeFxBufferOverflow;
begin
{*
 006229E8    push        ebx
 006229E9    push        esi
 006229EA    add         esp,0FFFFFFE8
 006229ED    mov         esi,eax
 006229EF    call        00600EA0
 006229F4    fstp        qword ptr [esi+4E8];TWiimoteObject.BladeFxOverflowTime:Double
 006229FA    wait
 006229FB    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>006229FF    je          00622A68
 00622A01    mov         ebx,4A4BF40
 00622A06    and         ebx,0FEFFFFFF
 00622A0C    mov         eax,esp
 00622A0E    xor         ecx,ecx
 00622A10    mov         edx,16
 00622A15    call        @FillChar
 00622A1A    mov         byte ptr [esp],17
 00622A1E    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00622A25    mov         edx,ebx
 00622A27    shr         edx,18
 00622A2A    and         dl,0FF
 00622A2D    or          al,dl
 00622A2F    mov         byte ptr [esp+1],al
 00622A33    mov         eax,ebx
 00622A35    shr         eax,10
 00622A38    and         al,0FF
 00622A3A    mov         byte ptr [esp+2],al
 00622A3E    mov         eax,ebx
 00622A40    shr         eax,8
 00622A43    and         al,0FF
 00622A45    mov         byte ptr [esp+3],al
 00622A49    and         bl,0FF
 00622A4C    mov         byte ptr [esp+4],bl
 00622A50    mov         byte ptr [esp+5],0
 00622A55    mov         byte ptr [esp+6],0B0
 00622A5A    mov         edx,esp
 00622A5C    mov         ecx,16
 00622A61    mov         eax,esi
 00622A63    call        TManagedHidObject.SendReport
 00622A68    add         esp,18
 00622A6B    pop         esi
 00622A6C    pop         ebx
 00622A6D    ret
*}
end;

//00622A70
{*function TWiimoteObject.RequestExpansionCalibration:?;
begin
 00622A70    push        ebx
 00622A71    push        esi
 00622A72    add         esp,0FFFFFFE8
 00622A75    mov         esi,eax
 00622A77    mov         byte ptr [esi+44E],1;TWiimoteObject.NeedExpansionCalibration:Boolean
 00622A7E    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00622A82    je          00622AEB
 00622A84    mov         ebx,4A40020
 00622A89    and         ebx,0FEFFFFFF
 00622A8F    mov         eax,esp
 00622A91    xor         ecx,ecx
 00622A93    mov         edx,16
 00622A98    call        @FillChar
 00622A9D    mov         byte ptr [esp],17
 00622AA1    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00622AA8    mov         edx,ebx
 00622AAA    shr         edx,18
 00622AAD    and         dl,0FF
 00622AB0    or          al,dl
 00622AB2    mov         byte ptr [esp+1],al
 00622AB6    mov         eax,ebx
 00622AB8    shr         eax,10
 00622ABB    and         al,0FF
 00622ABD    mov         byte ptr [esp+2],al
 00622AC1    mov         eax,ebx
 00622AC3    shr         eax,8
 00622AC6    and         al,0FF
 00622AC8    mov         byte ptr [esp+3],al
 00622ACC    and         bl,0FF
 00622ACF    mov         byte ptr [esp+4],bl
 00622AD3    mov         byte ptr [esp+5],0
 00622AD8    mov         byte ptr [esp+6],10
 00622ADD    mov         edx,esp
 00622ADF    mov         ecx,16
 00622AE4    mov         eax,esi
 00622AE6    call        TManagedHidObject.SendReport
 00622AEB    add         esp,18
 00622AEE    pop         esi
 00622AEF    pop         ebx
 00622AF0    ret
end;*}

//00622AF4
{*function TWiimoteObject.RequestExpansionType:?;
begin
 00622AF4    push        ebx
 00622AF5    push        esi
 00622AF6    add         esp,0FFFFFFE8
 00622AF9    mov         esi,eax
 00622AFB    mov         byte ptr [esi+44C],1;TWiimoteObject.NeedExpansionType:Boolean
 00622B02    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00622B06    je          00622B6F
 00622B08    mov         ebx,4A400F0
 00622B0D    and         ebx,0FEFFFFFF
 00622B13    mov         eax,esp
 00622B15    xor         ecx,ecx
 00622B17    mov         edx,16
 00622B1C    call        @FillChar
 00622B21    mov         byte ptr [esp],17
 00622B25    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00622B2C    mov         edx,ebx
 00622B2E    shr         edx,18
 00622B31    and         dl,0FF
 00622B34    or          al,dl
 00622B36    mov         byte ptr [esp+1],al
 00622B3A    mov         eax,ebx
 00622B3C    shr         eax,10
 00622B3F    and         al,0FF
 00622B41    mov         byte ptr [esp+2],al
 00622B45    mov         eax,ebx
 00622B47    shr         eax,8
 00622B4A    and         al,0FF
 00622B4C    mov         byte ptr [esp+3],al
 00622B50    and         bl,0FF
 00622B53    mov         byte ptr [esp+4],bl
 00622B57    mov         byte ptr [esp+5],0
 00622B5C    mov         byte ptr [esp+6],10
 00622B61    mov         edx,esp
 00622B63    mov         ecx,16
 00622B68    mov         eax,esi
 00622B6A    call        TManagedHidObject.SendReport
 00622B6F    add         esp,18
 00622B72    pop         esi
 00622B73    pop         ebx
 00622B74    ret
end;*}

//00622B78
procedure TWiimoteObject.RequestMotionPlusCalibration;
begin
{*
 00622B78    push        ebx
 00622B79    push        esi
 00622B7A    add         esp,0FFFFFFE8
 00622B7D    mov         esi,eax
 00622B7F    mov         byte ptr [esi+44F],1;TWiimoteObject.NeedMotionPlusCalibration:Boolean
 00622B86    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00622B8A    je          00622BF3
 00622B8C    mov         ebx,4A6A620
 00622B91    and         ebx,0FEFFFFFF
 00622B97    mov         eax,esp
 00622B99    xor         ecx,ecx
 00622B9B    mov         edx,16
 00622BA0    call        @FillChar
 00622BA5    mov         byte ptr [esp],17
 00622BA9    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00622BB0    mov         edx,ebx
 00622BB2    shr         edx,18
 00622BB5    and         dl,0FF
 00622BB8    or          al,dl
 00622BBA    mov         byte ptr [esp+1],al
 00622BBE    mov         eax,ebx
 00622BC0    shr         eax,10
 00622BC3    and         al,0FF
 00622BC5    mov         byte ptr [esp+2],al
 00622BC9    mov         eax,ebx
 00622BCB    shr         eax,8
 00622BCE    and         al,0FF
 00622BD0    mov         byte ptr [esp+3],al
 00622BD4    and         bl,0FF
 00622BD7    mov         byte ptr [esp+4],bl
 00622BDB    mov         byte ptr [esp+5],0
 00622BE0    mov         byte ptr [esp+6],20
 00622BE5    mov         edx,esp
 00622BE7    mov         ecx,16
 00622BEC    mov         eax,esi
 00622BEE    call        TManagedHidObject.SendReport
 00622BF3    add         esp,18
 00622BF6    pop         esi
 00622BF7    pop         ebx
 00622BF8    ret
*}
end;

//00622BFC
{*function TWiimoteObject.RequestMotionPlusType:?;
begin
 00622BFC    push        ebx
 00622BFD    push        esi
 00622BFE    add         esp,0FFFFFFE8
 00622C01    mov         ebx,eax
 00622C03    movzx       eax,byte ptr [ebx+448];TWiimoteObject.FUseMotionPlus:Boolean
 00622C0A    mov         byte ptr [ebx+44D],al;TWiimoteObject.NeedMotionPlusType:Boolean
 00622C10    cmp         dword ptr [ebx+20],0;TWiimoteObject.Dev:TJvHidDevice
>00622C14    je          00622C7E
 00622C16    mov         esi,4A6A6F0
 00622C1B    and         esi,0FEFFFFFF
 00622C21    mov         eax,esp
 00622C23    xor         ecx,ecx
 00622C25    mov         edx,16
 00622C2A    call        @FillChar
 00622C2F    mov         byte ptr [esp],17
 00622C33    movzx       eax,byte ptr [ebx+48C];TWiimoteObject.FRumble:Boolean
 00622C3A    mov         edx,esi
 00622C3C    shr         edx,18
 00622C3F    and         dl,0FF
 00622C42    or          al,dl
 00622C44    mov         byte ptr [esp+1],al
 00622C48    mov         eax,esi
 00622C4A    shr         eax,10
 00622C4D    and         al,0FF
 00622C4F    mov         byte ptr [esp+2],al
 00622C53    mov         eax,esi
 00622C55    shr         eax,8
 00622C58    and         al,0FF
 00622C5A    mov         byte ptr [esp+3],al
 00622C5E    mov         eax,esi
 00622C60    and         al,0FF
 00622C62    mov         byte ptr [esp+4],al
 00622C66    mov         byte ptr [esp+5],0
 00622C6B    mov         byte ptr [esp+6],10
 00622C70    mov         edx,esp
 00622C72    mov         ecx,16
 00622C77    mov         eax,ebx
 00622C79    call        TManagedHidObject.SendReport
 00622C7E    add         esp,18
 00622C81    pop         esi
 00622C82    pop         ebx
 00622C83    ret
end;*}

//00622C84
procedure TWiimoteObject.RequestStatusReport;
begin
{*
 00622C84    add         esp,0FFFFFFE8
 00622C87    mov         byte ptr [esp],15
 00622C8B    movzx       edx,byte ptr [eax+48C];TWiimoteObject.FRumble:Boolean
 00622C92    mov         byte ptr [esp+1],dl
 00622C96    mov         edx,esp
 00622C98    mov         ecx,16
 00622C9D    call        TManagedHidObject.SendReport
 00622CA2    add         esp,18
 00622CA5    ret
*}
end;

//00622CA8
procedure TWiimoteObject.RequestWiimoteCalibration;
begin
{*
 00622CA8    push        ebx
 00622CA9    push        esi
 00622CAA    add         esp,0FFFFFFE8
 00622CAD    mov         esi,eax
 00622CAF    mov         byte ptr [esi+44B],1;TWiimoteObject.NeedCalibration:Boolean
 00622CB6    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00622CBA    je          00622D23
 00622CBC    mov         ebx,16
 00622CC1    and         ebx,0FEFFFFFF
 00622CC7    mov         eax,esp
 00622CC9    xor         ecx,ecx
 00622CCB    mov         edx,16
 00622CD0    call        @FillChar
 00622CD5    mov         byte ptr [esp],17
 00622CD9    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00622CE0    mov         edx,ebx
 00622CE2    shr         edx,18
 00622CE5    and         dl,0FF
 00622CE8    or          al,dl
 00622CEA    mov         byte ptr [esp+1],al
 00622CEE    mov         eax,ebx
 00622CF0    shr         eax,10
 00622CF3    and         al,0FF
 00622CF5    mov         byte ptr [esp+2],al
 00622CF9    mov         eax,ebx
 00622CFB    shr         eax,8
 00622CFE    and         al,0FF
 00622D00    mov         byte ptr [esp+3],al
 00622D04    and         bl,0FF
 00622D07    mov         byte ptr [esp+4],bl
 00622D0B    mov         byte ptr [esp+5],0
 00622D10    mov         byte ptr [esp+6],0A
 00622D15    mov         edx,esp
 00622D17    mov         ecx,16
 00622D1C    mov         eax,esi
 00622D1E    call        TManagedHidObject.SendReport
 00622D23    add         esp,18
 00622D26    pop         esi
 00622D27    pop         ebx
 00622D28    ret
*}
end;

//00622D2C
function TWiimoteObject.Right:Boolean;
begin
{*
 00622D2C    test        eax,eax
>00622D2E    je          00622D3B
 00622D30    test        word ptr [eax+580],200;TWiimoteObject.Buttons:word
>00622D39    ja          00622D3E
 00622D3B    xor         eax,eax
 00622D3D    ret
 00622D3E    mov         al,1
 00622D40    ret
*}
end;

//00622D44
function TWiimoteObject.RightPrev:Boolean;
begin
{*
 00622D44    test        eax,eax
>00622D46    je          00622D53
 00622D48    test        word ptr [eax+582],200;TWiimoteObject.OldButtons:word
>00622D51    ja          00622D56
 00622D53    xor         eax,eax
 00622D55    ret
 00622D56    mov         al,1
 00622D58    ret
*}
end;

//00622D5C
procedure TWiimoteObject.SensorBarSeparation;
begin
{*
 00622D5C    add         esp,0FFFFFFF8
 00622D5F    mov         dword ptr [esp],0D2F1A9FC
 00622D66    mov         dword ptr [esp+4],3FC8624D
 00622D6E    fld         qword ptr [esp]
 00622D71    pop         ecx
 00622D72    pop         edx
 00622D73    ret
*}
end;

//00622D74
procedure TWiimoteObject.SetChannel(value:Byte);
begin
{*
 00622D74    push        ebx
 00622D75    add         esp,0FFFFFFE8
 00622D78    mov         ebx,eax
 00622D7A    mov         byte ptr [ebx+454],dl;TWiimoteObject.Channel:Integer
 00622D80    mov         eax,esp
 00622D82    xor         ecx,ecx
 00622D84    mov         edx,16
 00622D89    call        @FillChar
 00622D8E    mov         byte ptr [esp],12
 00622D92    movzx       eax,byte ptr [ebx+48C];TWiimoteObject.FRumble:Boolean
 00622D99    movzx       edx,byte ptr [ebx+5D4];TWiimoteObject.ContinuousReporting:Boolean
 00622DA0    add         edx,edx
 00622DA2    add         edx,edx
 00622DA4    or          al,dl
 00622DA6    mov         byte ptr [esp+1],al
 00622DAA    movzx       eax,byte ptr [ebx+454];TWiimoteObject.Channel:Integer
 00622DB1    mov         byte ptr [esp+2],al
 00622DB5    mov         edx,esp
 00622DB7    mov         ecx,16
 00622DBC    mov         eax,ebx
 00622DBE    call        TManagedHidObject.SendReport
 00622DC3    mov         byte ptr [ebx+450],0;TWiimoteObject.NeedChannel:Boolean
 00622DCA    add         esp,18
 00622DCD    pop         ebx
 00622DCE    ret
*}
end;

//00622DD0
{*procedure TWiimoteObject.SetFrequency(NewFrequency:Double; ?:?);
begin
 00622DD0    push        ebp
 00622DD1    mov         ebp,esp
 00622DD3    add         esp,0FFFFFFF8
 00622DD6    push        ebx
 00622DD7    mov         ebx,eax
 00622DD9    mov         eax,dword ptr [ebx+5B0];TWiimoteObject.Frequency:Double
 00622DDF    mov         dword ptr [ebp-8],eax
 00622DE2    mov         eax,dword ptr [ebx+5B4];TWiimoteObject.?f5B4:dword
 00622DE8    mov         dword ptr [ebp-4],eax
 00622DEB    fld         qword ptr [ebp+8]
 00622DEE    fcomp       dword ptr ds:[622EA4];0:Single
 00622DF4    wait
 00622DF5    fnstsw      al
 00622DF7    sahf
>00622DF8    jae         00622E02
 00622DFA    xor         eax,eax
 00622DFC    mov         dword ptr [ebp+8],eax
 00622DFF    mov         dword ptr [ebp+0C],eax
 00622E02    fld         qword ptr [ebp-8]
 00622E05    fcomp       qword ptr [ebp+8]
 00622E08    wait
 00622E09    fnstsw      al
 00622E0B    sahf
>00622E0C    je          00622E9A
 00622E12    mov         eax,dword ptr [ebp+8]
 00622E15    mov         dword ptr [ebx+5B0],eax;TWiimoteObject.Frequency:Double
 00622E1B    mov         eax,dword ptr [ebp+0C]
 00622E1E    mov         dword ptr [ebx+5B4],eax;TWiimoteObject.?f5B4:dword
 00622E24    fld         qword ptr [ebx+5B0];TWiimoteObject.Frequency:Double
 00622E2A    fmul        dword ptr ds:[622EA8];2:Single
 00622E30    add         esp,0FFFFFFF8
 00622E33    fstp        qword ptr [esp]
 00622E36    wait
 00622E37    mov         eax,ebx
 00622E39    call        TWiimoteObject.SetSampleRate
 00622E3E    fld         qword ptr [ebp-8]
 00622E41    fcomp       dword ptr ds:[622EA4];0:Single
 00622E47    wait
 00622E48    fnstsw      al
 00622E4A    sahf
>00622E4B    jbe         00622E65
 00622E4D    fld         qword ptr [ebp+8]
 00622E50    fcomp       dword ptr ds:[622EA4];0:Single
 00622E56    wait
 00622E57    fnstsw      al
 00622E59    sahf
>00622E5A    jne         00622E65
 00622E5C    mov         eax,ebx
 00622E5E    call        TWiimoteObject.DisableSpeaker
>00622E63    jmp         00622E9A
 00622E65    fld         qword ptr [ebp-8]
 00622E68    fcomp       dword ptr ds:[622EA4];0:Single
 00622E6E    wait
 00622E6F    fnstsw      al
 00622E71    sahf
>00622E72    jne         00622E93
 00622E74    fld         qword ptr [ebp+8]
 00622E77    fcomp       dword ptr ds:[622EA4];0:Single
 00622E7D    wait
 00622E7E    fnstsw      al
 00622E80    sahf
>00622E81    jbe         00622E93
 00622E83    mov         byte ptr [ebx+45B],0;TWiimoteObject.Muted:Boolean
 00622E8A    mov         eax,ebx
 00622E8C    call        TWiimoteObject.EnableSpeaker
>00622E91    jmp         00622E9A
 00622E93    mov         eax,ebx
 00622E95    call        TWiimoteObject.UpdateSpeakerThread
 00622E9A    pop         ebx
 00622E9B    pop         ecx
 00622E9C    pop         ecx
 00622E9D    pop         ebp
 00622E9E    ret         8
end;*}

//00622EAC
{*procedure TWiimoteObject.SetLedDrumLevel(Value:Double; ?:?);
begin
 00622EAC    push        ebp
 00622EAD    mov         ebp,esp
 00622EAF    add         esp,0FFFFFFE8
 00622EB2    push        ebx
 00622EB3    push        esi
 00622EB4    mov         esi,eax
 00622EB6    fld         qword ptr [esi+498];TWiimoteObject.FLedDrumLevel:Double
 00622EBC    fcomp       qword ptr [ebp+8]
 00622EBF    wait
 00622EC0    fnstsw      al
 00622EC2    sahf
>00622EC3    je          00623078
 00622EC9    mov         eax,dword ptr [ebp+8]
 00622ECC    mov         dword ptr [esi+498],eax;TWiimoteObject.FLedDrumLevel:Double
 00622ED2    mov         eax,dword ptr [ebp+0C]
 00622ED5    mov         dword ptr [esi+49C],eax;TWiimoteObject.?f49C:dword
 00622EDB    cmp         byte ptr [esi+18],0;TWiimoteObject.Connected:Boolean
>00622EDF    je          00623078
 00622EE5    fld         tbyte ptr ds:[623080];0.8:Extended
 00622EEB    fcomp       qword ptr [esi+498];TWiimoteObject.FLedDrumLevel:Double
 00622EF1    wait
 00622EF2    fnstsw      al
 00622EF4    sahf
>00622EF5    jae         00622EFB
 00622EF7    mov         bl,0F
>00622EF9    jmp         00622F3F
 00622EFB    fld         tbyte ptr ds:[62308C];0.6:Extended
 00622F01    fcomp       qword ptr [esi+498];TWiimoteObject.FLedDrumLevel:Double
 00622F07    wait
 00622F08    fnstsw      al
 00622F0A    sahf
>00622F0B    jae         00622F11
 00622F0D    mov         bl,0E
>00622F0F    jmp         00622F3F
 00622F11    fld         tbyte ptr ds:[623098];0.4:Extended
 00622F17    fcomp       qword ptr [esi+498];TWiimoteObject.FLedDrumLevel:Double
 00622F1D    wait
 00622F1E    fnstsw      al
 00622F20    sahf
>00622F21    jae         00622F27
 00622F23    mov         bl,0C
>00622F25    jmp         00622F3F
 00622F27    fld         tbyte ptr ds:[6230A4];0.2:Extended
 00622F2D    fcomp       qword ptr [esi+498];TWiimoteObject.FLedDrumLevel:Double
 00622F33    wait
 00622F34    fnstsw      al
 00622F36    sahf
>00622F37    jae         00622F3D
 00622F39    mov         bl,8
>00622F3B    jmp         00622F3F
 00622F3D    xor         ebx,ebx
 00622F3F    mov         eax,ebx
 00622F41    and         al,0F
 00622F43    movzx       eax,al
 00622F46    add         eax,0FFFFFFFD
 00622F49    cmp         eax,8
>00622F4C    ja          00622FA6
 00622F4E    jmp         dword ptr [eax*4+622F55]
 00622F4E    dd          00622F82
 00622F4E    dd          00622FA6
 00622F4E    dd          00622F8B
 00622F4E    dd          00622F79
 00622F4E    dd          00622F9D
 00622F4E    dd          00622FA6
 00622F4E    dd          00622FA6
 00622F4E    dd          00622FA6
 00622F4E    dd          00622F94
 00622F79    mov         byte ptr [esi+48E],0B;TWiimoteObject.FPlayerLed:ShortInt
>00622F80    jmp         00622FC7
 00622F82    mov         byte ptr [esi+48E],0C;TWiimoteObject.FPlayerLed:ShortInt
>00622F89    jmp         00622FC7
 00622F8B    mov         byte ptr [esi+48E],0D;TWiimoteObject.FPlayerLed:ShortInt
>00622F92    jmp         00622FC7
 00622F94    mov         byte ptr [esi+48E],0E;TWiimoteObject.FPlayerLed:ShortInt
>00622F9B    jmp         00622FC7
 00622F9D    mov         byte ptr [esi+48E],0F;TWiimoteObject.FPlayerLed:ShortInt
>00622FA4    jmp         00622FC7
 00622FA6    mov         eax,ebx
 00622FA8    and         al,3
 00622FAA    test        bl,4
 00622FAD    setne       dl
 00622FB0    lea         edx,[edx+edx*2]
 00622FB3    add         al,dl
 00622FB5    test        bl,8
 00622FB8    setne       dl
 00622FBB    add         edx,edx
 00622FBD    add         edx,edx
 00622FBF    add         al,dl
 00622FC1    mov         byte ptr [esi+48E],al;TWiimoteObject.FPlayerLed:ShortInt
 00622FC7    test        bl,8
>00622FCA    je          00622FE0
 00622FCC    xor         eax,eax
 00622FCE    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 00622FD4    mov         dword ptr [esi+494],3FF00000;TWiimoteObject.?f494:dword
>00622FDE    jmp         00623039
 00622FE0    test        bl,4
>00622FE3    je          00622FF9
 00622FE5    xor         eax,eax
 00622FE7    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 00622FED    mov         dword ptr [esi+494],3FE80000;TWiimoteObject.?f494:dword
>00622FF7    jmp         00623039
 00622FF9    test        bl,2
>00622FFC    je          00623012
 00622FFE    xor         eax,eax
 00623000    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 00623006    mov         dword ptr [esi+494],3FE00000;TWiimoteObject.?f494:dword
>00623010    jmp         00623039
 00623012    test        bl,1
>00623015    je          0062302B
 00623017    xor         eax,eax
 00623019    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 0062301F    mov         dword ptr [esi+494],3FD00000;TWiimoteObject.?f494:dword
>00623029    jmp         00623039
 0062302B    xor         eax,eax
 0062302D    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 00623033    mov         dword ptr [esi+494],eax;TWiimoteObject.?f494:dword
 00623039    cmp         bl,byte ptr [esi+48D];TWiimoteObject.FLeds:byte
>0062303F    je          00623078
 00623041    mov         byte ptr [esi+48D],bl;TWiimoteObject.FLeds:byte
 00623047    lea         eax,[ebp-16]
 0062304A    xor         ecx,ecx
 0062304C    mov         edx,16
 00623051    call        @FillChar
 00623056    mov         byte ptr [ebp-16],11
 0062305A    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00623061    shl         ebx,4
 00623064    or          al,bl
 00623066    mov         byte ptr [ebp-15],al
 00623069    lea         edx,[ebp-16]
 0062306C    mov         ecx,16
 00623071    mov         eax,esi
 00623073    call        TManagedHidObject.SendReport
 00623078    pop         esi
 00623079    pop         ebx
 0062307A    mov         esp,ebp
 0062307C    pop         ebp
 0062307D    ret         8
end;*}

//006230B0
{*procedure TWiimoteObject.SetLedLevel(Value:Double; ?:?);
begin
 006230B0    push        ebp
 006230B1    mov         ebp,esp
 006230B3    add         esp,0FFFFFFE8
 006230B6    push        ebx
 006230B7    push        esi
 006230B8    mov         esi,eax
 006230BA    fld         qword ptr [esi+490];TWiimoteObject.FLedLevel:Double
 006230C0    fcomp       qword ptr [ebp+8]
 006230C3    wait
 006230C4    fnstsw      al
 006230C6    sahf
>006230C7    je          0062327C
 006230CD    mov         eax,dword ptr [ebp+8]
 006230D0    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 006230D6    mov         eax,dword ptr [ebp+0C]
 006230D9    mov         dword ptr [esi+494],eax;TWiimoteObject.?f494:dword
 006230DF    cmp         byte ptr [esi+18],0;TWiimoteObject.Connected:Boolean
>006230E3    je          0062327C
 006230E9    fld         tbyte ptr ds:[623284];0.8:Extended
 006230EF    fcomp       qword ptr [esi+490];TWiimoteObject.FLedLevel:Double
 006230F5    wait
 006230F6    fnstsw      al
 006230F8    sahf
>006230F9    jae         006230FF
 006230FB    mov         bl,0F
>006230FD    jmp         00623143
 006230FF    fld         tbyte ptr ds:[623290];0.6:Extended
 00623105    fcomp       qword ptr [esi+490];TWiimoteObject.FLedLevel:Double
 0062310B    wait
 0062310C    fnstsw      al
 0062310E    sahf
>0062310F    jae         00623115
 00623111    mov         bl,7
>00623113    jmp         00623143
 00623115    fld         tbyte ptr ds:[62329C];0.4:Extended
 0062311B    fcomp       qword ptr [esi+490];TWiimoteObject.FLedLevel:Double
 00623121    wait
 00623122    fnstsw      al
 00623124    sahf
>00623125    jae         0062312B
 00623127    mov         bl,3
>00623129    jmp         00623143
 0062312B    fld         tbyte ptr ds:[6232A8];0.2:Extended
 00623131    fcomp       qword ptr [esi+490];TWiimoteObject.FLedLevel:Double
 00623137    wait
 00623138    fnstsw      al
 0062313A    sahf
>0062313B    jae         00623141
 0062313D    mov         bl,1
>0062313F    jmp         00623143
 00623141    xor         ebx,ebx
 00623143    mov         eax,ebx
 00623145    and         al,0F
 00623147    movzx       eax,al
 0062314A    add         eax,0FFFFFFFD
 0062314D    cmp         eax,8
>00623150    ja          006231AA
 00623152    jmp         dword ptr [eax*4+623159]
 00623152    dd          00623186
 00623152    dd          006231AA
 00623152    dd          0062318F
 00623152    dd          0062317D
 00623152    dd          006231A1
 00623152    dd          006231AA
 00623152    dd          006231AA
 00623152    dd          006231AA
 00623152    dd          00623198
 0062317D    mov         byte ptr [esi+48E],0B;TWiimoteObject.FPlayerLed:ShortInt
>00623184    jmp         006231CB
 00623186    mov         byte ptr [esi+48E],0C;TWiimoteObject.FPlayerLed:ShortInt
>0062318D    jmp         006231CB
 0062318F    mov         byte ptr [esi+48E],0D;TWiimoteObject.FPlayerLed:ShortInt
>00623196    jmp         006231CB
 00623198    mov         byte ptr [esi+48E],0E;TWiimoteObject.FPlayerLed:ShortInt
>0062319F    jmp         006231CB
 006231A1    mov         byte ptr [esi+48E],0F;TWiimoteObject.FPlayerLed:ShortInt
>006231A8    jmp         006231CB
 006231AA    mov         eax,ebx
 006231AC    and         al,3
 006231AE    test        bl,4
 006231B1    setne       dl
 006231B4    lea         edx,[edx+edx*2]
 006231B7    add         al,dl
 006231B9    test        bl,8
 006231BC    setne       dl
 006231BF    add         edx,edx
 006231C1    add         edx,edx
 006231C3    add         al,dl
 006231C5    mov         byte ptr [esi+48E],al;TWiimoteObject.FPlayerLed:ShortInt
 006231CB    test        bl,1
>006231CE    je          006231E4
 006231D0    xor         eax,eax
 006231D2    mov         dword ptr [esi+498],eax;TWiimoteObject.FLedDrumLevel:Double
 006231D8    mov         dword ptr [esi+49C],3FF00000;TWiimoteObject.?f49C:dword
>006231E2    jmp         0062323D
 006231E4    test        bl,2
>006231E7    je          006231FD
 006231E9    xor         eax,eax
 006231EB    mov         dword ptr [esi+498],eax;TWiimoteObject.FLedDrumLevel:Double
 006231F1    mov         dword ptr [esi+49C],3FE80000;TWiimoteObject.?f49C:dword
>006231FB    jmp         0062323D
 006231FD    test        bl,4
>00623200    je          00623216
 00623202    xor         eax,eax
 00623204    mov         dword ptr [esi+498],eax;TWiimoteObject.FLedDrumLevel:Double
 0062320A    mov         dword ptr [esi+49C],3FE00000;TWiimoteObject.?f49C:dword
>00623214    jmp         0062323D
 00623216    test        bl,8
>00623219    je          0062322F
 0062321B    xor         eax,eax
 0062321D    mov         dword ptr [esi+498],eax;TWiimoteObject.FLedDrumLevel:Double
 00623223    mov         dword ptr [esi+49C],3FD00000;TWiimoteObject.?f49C:dword
>0062322D    jmp         0062323D
 0062322F    xor         eax,eax
 00623231    mov         dword ptr [esi+498],eax;TWiimoteObject.FLedDrumLevel:Double
 00623237    mov         dword ptr [esi+49C],eax;TWiimoteObject.?f49C:dword
 0062323D    cmp         bl,byte ptr [esi+48D];TWiimoteObject.FLeds:byte
>00623243    je          0062327C
 00623245    mov         byte ptr [esi+48D],bl;TWiimoteObject.FLeds:byte
 0062324B    lea         eax,[ebp-16]
 0062324E    xor         ecx,ecx
 00623250    mov         edx,16
 00623255    call        @FillChar
 0062325A    mov         byte ptr [ebp-16],11
 0062325E    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00623265    shl         ebx,4
 00623268    or          al,bl
 0062326A    mov         byte ptr [ebp-15],al
 0062326D    lea         edx,[ebp-16]
 00623270    mov         ecx,16
 00623275    mov         eax,esi
 00623277    call        TManagedHidObject.SendReport
 0062327C    pop         esi
 0062327D    pop         ebx
 0062327E    mov         esp,ebp
 00623280    pop         ebp
 00623281    ret         8
end;*}

//006232B4
procedure TWiimoteObject.SetLeds(NewLeds:Byte);
begin
{*
 006232B4    push        ebx
 006232B5    push        esi
 006232B6    add         esp,0FFFFFFE8
 006232B9    mov         ebx,edx
 006232BB    mov         esi,eax
 006232BD    cmp         bl,byte ptr [esi+48D];TWiimoteObject.FLeds:byte
>006232C3    je          0062346D
 006232C9    mov         byte ptr [esi+48D],bl;TWiimoteObject.FLeds:byte
 006232CF    mov         eax,ebx
 006232D1    and         al,0F
 006232D3    movzx       eax,al
 006232D6    add         eax,0FFFFFFFD
 006232D9    cmp         eax,8
>006232DC    ja          00623336
 006232DE    jmp         dword ptr [eax*4+6232E5]
 006232DE    dd          00623312
 006232DE    dd          00623336
 006232DE    dd          0062331B
 006232DE    dd          00623309
 006232DE    dd          0062332D
 006232DE    dd          00623336
 006232DE    dd          00623336
 006232DE    dd          00623336
 006232DE    dd          00623324
 00623309    mov         byte ptr [esi+48E],0B;TWiimoteObject.FPlayerLed:ShortInt
>00623310    jmp         00623357
 00623312    mov         byte ptr [esi+48E],0C;TWiimoteObject.FPlayerLed:ShortInt
>00623319    jmp         00623357
 0062331B    mov         byte ptr [esi+48E],0D;TWiimoteObject.FPlayerLed:ShortInt
>00623322    jmp         00623357
 00623324    mov         byte ptr [esi+48E],0E;TWiimoteObject.FPlayerLed:ShortInt
>0062332B    jmp         00623357
 0062332D    mov         byte ptr [esi+48E],0F;TWiimoteObject.FPlayerLed:ShortInt
>00623334    jmp         00623357
 00623336    mov         eax,ebx
 00623338    and         al,3
 0062333A    test        bl,4
 0062333D    setne       dl
 00623340    lea         edx,[edx+edx*2]
 00623343    add         al,dl
 00623345    test        bl,8
 00623348    setne       dl
 0062334B    add         edx,edx
 0062334D    add         edx,edx
 0062334F    add         al,dl
 00623351    mov         byte ptr [esi+48E],al;TWiimoteObject.FPlayerLed:ShortInt
 00623357    mov         eax,ebx
 00623359    and         al,1
 0062335B    test        al,al
>0062335D    je          00623373
 0062335F    xor         edx,edx
 00623361    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 00623367    mov         dword ptr [esi+49C],3FF00000;TWiimoteObject.?f49C:dword
>00623371    jmp         006233CC
 00623373    test        bl,2
>00623376    je          0062338C
 00623378    xor         edx,edx
 0062337A    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 00623380    mov         dword ptr [esi+49C],3FE80000;TWiimoteObject.?f49C:dword
>0062338A    jmp         006233CC
 0062338C    test        bl,4
>0062338F    je          006233A5
 00623391    xor         edx,edx
 00623393    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 00623399    mov         dword ptr [esi+49C],3FE00000;TWiimoteObject.?f49C:dword
>006233A3    jmp         006233CC
 006233A5    test        bl,8
>006233A8    je          006233BE
 006233AA    xor         edx,edx
 006233AC    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 006233B2    mov         dword ptr [esi+49C],3FD00000;TWiimoteObject.?f49C:dword
>006233BC    jmp         006233CC
 006233BE    xor         edx,edx
 006233C0    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 006233C6    mov         dword ptr [esi+49C],edx;TWiimoteObject.?f49C:dword
 006233CC    test        bl,8
>006233CF    je          006233E5
 006233D1    xor         eax,eax
 006233D3    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 006233D9    mov         dword ptr [esi+494],3FF00000;TWiimoteObject.?f494:dword
>006233E3    jmp         0062343D
 006233E5    test        bl,4
>006233E8    je          006233FE
 006233EA    xor         eax,eax
 006233EC    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 006233F2    mov         dword ptr [esi+494],3FE80000;TWiimoteObject.?f494:dword
>006233FC    jmp         0062343D
 006233FE    test        bl,2
>00623401    je          00623417
 00623403    xor         eax,eax
 00623405    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 0062340B    mov         dword ptr [esi+494],3FE00000;TWiimoteObject.?f494:dword
>00623415    jmp         0062343D
 00623417    test        al,al
>00623419    je          0062342F
 0062341B    xor         eax,eax
 0062341D    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 00623423    mov         dword ptr [esi+494],3FD00000;TWiimoteObject.?f494:dword
>0062342D    jmp         0062343D
 0062342F    xor         eax,eax
 00623431    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 00623437    mov         dword ptr [esi+494],eax;TWiimoteObject.?f494:dword
 0062343D    mov         eax,esp
 0062343F    xor         ecx,ecx
 00623441    mov         edx,16
 00623446    call        @FillChar
 0062344B    mov         byte ptr [esp],11
 0062344F    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 00623456    shl         ebx,4
 00623459    or          al,bl
 0062345B    mov         byte ptr [esp+1],al
 0062345F    mov         edx,esp
 00623461    mov         ecx,16
 00623466    mov         eax,esi
 00623468    call        TManagedHidObject.SendReport
 0062346D    add         esp,18
 00623470    pop         esi
 00623471    pop         ebx
 00623472    ret
*}
end;

//00623474
procedure TWiimoteObject.SetMode;
begin
{*
 00623474    push        ebx
 00623475    mov         ebx,eax
 00623477    cmp         byte ptr [ebx+447],0;TWiimoteObject.FUseExpansion:Boolean
>0062347E    jne         00623489
 00623480    cmp         byte ptr [ebx+448],0;TWiimoteObject.FUseMotionPlus:Boolean
>00623487    je          006234C8
 00623489    cmp         byte ptr [ebx+446],0;TWiimoteObject.FUseIR:Boolean
>00623490    je          006234AD
 00623492    cmp         byte ptr [ebx+445],0;TWiimoteObject.FUseForce:Boolean
>00623499    je          006234A4
 0062349B    mov         byte ptr [ebx+452],37;TWiimoteObject.DesiredChannel:byte
>006234A2    jmp         00623520
 006234A4    mov         byte ptr [ebx+452],36;TWiimoteObject.DesiredChannel:byte
>006234AB    jmp         00623520
 006234AD    cmp         byte ptr [ebx+445],0;TWiimoteObject.FUseForce:Boolean
>006234B4    je          006234BF
 006234B6    mov         byte ptr [ebx+452],35;TWiimoteObject.DesiredChannel:byte
>006234BD    jmp         00623520
 006234BF    mov         byte ptr [ebx+452],34;TWiimoteObject.DesiredChannel:byte
>006234C6    jmp         00623520
 006234C8    cmp         byte ptr [ebx+446],0;TWiimoteObject.FUseIR:Boolean
>006234CF    je          006234FE
 006234D1    cmp         byte ptr [ebx+44A],0;TWiimoteObject.FUse3F:Boolean
>006234D8    je          006234E3
 006234DA    mov         byte ptr [ebx+452],3E;TWiimoteObject.DesiredChannel:byte
>006234E1    jmp         00623520
 006234E3    cmp         byte ptr [ebx+445],0;TWiimoteObject.FUseForce:Boolean
>006234EA    je          006234F5
 006234EC    mov         byte ptr [ebx+452],33;TWiimoteObject.DesiredChannel:byte
>006234F3    jmp         00623520
 006234F5    mov         byte ptr [ebx+452],33;TWiimoteObject.DesiredChannel:byte
>006234FC    jmp         00623520
 006234FE    cmp         byte ptr [ebx+445],0;TWiimoteObject.FUseForce:Boolean
>00623505    jne         00623510
 00623507    cmp         byte ptr [ebx+449],0;TWiimoteObject.FUseSpeaker:Boolean
>0062350E    je          00623519
 00623510    mov         byte ptr [ebx+452],31;TWiimoteObject.DesiredChannel:byte
>00623517    jmp         00623520
 00623519    mov         byte ptr [ebx+452],30;TWiimoteObject.DesiredChannel:byte
 00623520    mov         byte ptr [ebx+450],1;TWiimoteObject.NeedChannel:Boolean
 00623527    movzx       eax,byte ptr [ebx+446];TWiimoteObject.FUseIR:Boolean
 0062352E    mov         byte ptr [ebx+451],al;TWiimoteObject.NeedIR:Boolean
 00623534    mov         eax,[0078D590];^Application:TApplication
 00623539    mov         eax,dword ptr [eax]
 0062353B    call        TApplication.ProcessMessages
 00623540    push        64
 00623542    call        kernel32.Sleep
 00623547    mov         eax,[0078D590];^Application:TApplication
 0062354C    mov         eax,dword ptr [eax]
 0062354E    call        TApplication.ProcessMessages
 00623553    cmp         byte ptr [ebx+44B],0;TWiimoteObject.NeedCalibration:Boolean
>0062355A    je          00623565
 0062355C    mov         eax,ebx
 0062355E    call        TWiimoteObject.RequestWiimoteCalibration
>00623563    jmp         006235C4
 00623565    cmp         byte ptr [ebx+44C],0;TWiimoteObject.NeedExpansionType:Boolean
>0062356C    je          00623577
 0062356E    mov         eax,ebx
 00623570    call        TWiimoteObject.RequestExpansionType
>00623575    jmp         006235C4
 00623577    cmp         byte ptr [ebx+44E],0;TWiimoteObject.NeedExpansionCalibration:Boolean
>0062357E    je          00623589
 00623580    mov         eax,ebx
 00623582    call        TWiimoteObject.RequestExpansionCalibration
>00623587    jmp         006235C4
 00623589    cmp         byte ptr [ebx+44D],0;TWiimoteObject.NeedMotionPlusType:Boolean
>00623590    je          0062359B
 00623592    mov         eax,ebx
 00623594    call        TWiimoteObject.RequestMotionPlusType
>00623599    jmp         006235C4
 0062359B    cmp         byte ptr [ebx+451],0;TWiimoteObject.NeedIR:Boolean
>006235A2    je          006235AD
 006235A4    mov         eax,ebx
 006235A6    call        TWiimoteObject.EnableIR
>006235AB    jmp         006235C4
 006235AD    cmp         byte ptr [ebx+450],0;TWiimoteObject.NeedChannel:Boolean
>006235B4    je          006235C4
 006235B6    movzx       edx,byte ptr [ebx+452];TWiimoteObject.DesiredChannel:byte
 006235BD    mov         eax,ebx
 006235BF    call        TWiimoteObject.SetChannel
 006235C4    push        64
 006235C6    call        kernel32.Sleep
 006235CB    mov         eax,[0078D590];^Application:TApplication
 006235D0    mov         eax,dword ptr [eax]
 006235D2    call        TApplication.ProcessMessages
 006235D7    pop         ebx
 006235D8    ret
*}
end;

//006235DC
procedure TWiimoteObject.SetMute(MuteOn:Boolean);
begin
{*
 006235DC    push        ebx
 006235DD    push        esi
 006235DE    mov         ebx,edx
 006235E0    mov         esi,eax
 006235E2    cmp         bl,byte ptr [esi+45B];TWiimoteObject.Muted:Boolean
>006235E8    je          00623606
 006235EA    mov         edx,ebx
 006235EC    add         edx,edx
 006235EE    add         edx,edx
 006235F0    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 006235F7    add         dl,al
 006235F9    mov         eax,esi
 006235FB    call        TWiimoteObject.SetReport19
 00623600    mov         byte ptr [esi+45B],bl;TWiimoteObject.Muted:Boolean
 00623606    pop         esi
 00623607    pop         ebx
 00623608    ret
*}
end;

//0062360C
procedure TWiimoteObject.SetNumber(Value:Integer);
begin
{*
 0062360C    mov         dword ptr [eax+488],edx;TWiimoteObject.FNumber:Integer
 00623612    mov         ecx,dword ptr [eax+4];TWiimoteObject.FManager:TComponent
 00623615    cmp         byte ptr [ecx+134],0
>0062361C    je          00623635
 0062361E    cmp         byte ptr [eax+444],0;TWiimoteObject.FUseWiimote:Boolean
>00623625    je          0062362E
 00623627    call        TWiimoteObject.SetPlayerLed
>0062362C    jmp         00623635
 0062362E    xor         edx,edx
 00623630    call        TWiimoteObject.SetPlayerLed
 00623635    ret
*}
end;

//00623638
procedure TWiimoteObject.SetPlayerLed(Value:ShortInt);
begin
{*
 00623638    push        ebx
 00623639    push        esi
 0062363A    add         esp,0FFFFFFE8
 0062363D    mov         esi,eax
 0062363F    cmp         dl,byte ptr [esi+48E];TWiimoteObject.FPlayerLed:ShortInt
>00623645    je          00623911
 0062364B    mov         eax,edx
 0062364D    mov         byte ptr [esi+48E],al;TWiimoteObject.FPlayerLed:ShortInt
 00623653    cmp         byte ptr [esi+18],0;TWiimoteObject.Connected:Boolean
>00623657    je          00623911
 0062365D    movsx       eax,al
 00623660    cmp         eax,2E
>00623663    ja          006237EB
 00623669    jmp         dword ptr [eax*4+623670]
 00623669    dd          0062372C
 00623669    dd          00623733
 00623669    dd          0062373A
 00623669    dd          00623741
 00623669    dd          00623748
 00623669    dd          0062374F
 00623669    dd          00623756
 00623669    dd          0062375D
 00623669    dd          00623764
 00623669    dd          0062376B
 00623669    dd          0062376F
 00623669    dd          00623773
 00623669    dd          00623777
 00623669    dd          0062377B
 00623669    dd          0062377F
 00623669    dd          00623783
 00623669    dd          00623787
 00623669    dd          0062378B
 00623669    dd          0062378F
 00623669    dd          00623793
 00623669    dd          00623797
 00623669    dd          0062379B
 00623669    dd          0062379F
 00623669    dd          006237A3
 00623669    dd          006237A7
 00623669    dd          006237AB
 00623669    dd          006237EB
 00623669    dd          006237EB
 00623669    dd          006237EB
 00623669    dd          006237EB
 00623669    dd          006237AF
 00623669    dd          006237B3
 00623669    dd          006237B7
 00623669    dd          006237BB
 00623669    dd          006237BF
 00623669    dd          006237C3
 00623669    dd          006237C7
 00623669    dd          006237CB
 00623669    dd          006237EB
 00623669    dd          006237EB
 00623669    dd          006237CF
 00623669    dd          006237D3
 00623669    dd          006237D7
 00623669    dd          006237DB
 00623669    dd          006237DF
 00623669    dd          006237E3
 00623669    dd          006237E7
 0062372C    xor         ebx,ebx
>0062372E    jmp         006237ED
 00623733    mov         bl,1
>00623735    jmp         006237ED
 0062373A    mov         bl,2
>0062373C    jmp         006237ED
 00623741    mov         bl,4
>00623743    jmp         006237ED
 00623748    mov         bl,8
>0062374A    jmp         006237ED
 0062374F    mov         bl,9
>00623751    jmp         006237ED
 00623756    mov         bl,0A
>00623758    jmp         006237ED
 0062375D    mov         bl,0C
>0062375F    jmp         006237ED
 00623764    mov         bl,0D
>00623766    jmp         006237ED
 0062376B    mov         bl,0E
>0062376D    jmp         006237ED
 0062376F    mov         bl,0F
>00623771    jmp         006237ED
 00623773    mov         bl,6
>00623775    jmp         006237ED
 00623777    mov         bl,3
>00623779    jmp         006237ED
 0062377B    mov         bl,5
>0062377D    jmp         006237ED
 0062377F    mov         bl,0B
>00623781    jmp         006237ED
 00623783    mov         bl,7
>00623785    jmp         006237ED
 00623787    mov         bl,0B
>00623789    jmp         006237ED
 0062378B    mov         bl,0D
>0062378D    jmp         006237ED
 0062378F    mov         bl,0F
>00623791    jmp         006237ED
 00623793    mov         bl,0F
>00623795    jmp         006237ED
 00623797    mov         bl,2
>00623799    jmp         006237ED
 0062379B    mov         bl,3
>0062379D    jmp         006237ED
 0062379F    mov         bl,2
>006237A1    jmp         006237ED
 006237A3    mov         bl,6
>006237A5    jmp         006237ED
 006237A7    mov         bl,0A
>006237A9    jmp         006237ED
 006237AB    mov         bl,0B
>006237AD    jmp         006237ED
 006237AF    mov         bl,4
>006237B1    jmp         006237ED
 006237B3    mov         bl,5
>006237B5    jmp         006237ED
 006237B7    mov         bl,6
>006237B9    jmp         006237ED
 006237BB    mov         bl,7
>006237BD    jmp         006237ED
 006237BF    mov         bl,0C
>006237C1    jmp         006237ED
 006237C3    mov         bl,0D
>006237C5    jmp         006237ED
 006237C7    mov         bl,0E
>006237C9    jmp         006237ED
 006237CB    mov         bl,0F
>006237CD    jmp         006237ED
 006237CF    mov         bl,8
>006237D1    jmp         006237ED
 006237D3    mov         bl,9
>006237D5    jmp         006237ED
 006237D7    mov         bl,0A
>006237D9    jmp         006237ED
 006237DB    mov         bl,0C
>006237DD    jmp         006237ED
 006237DF    mov         bl,0D
>006237E1    jmp         006237ED
 006237E3    mov         bl,0E
>006237E5    jmp         006237ED
 006237E7    mov         bl,0F
>006237E9    jmp         006237ED
 006237EB    mov         bl,0F
 006237ED    mov         eax,ebx
 006237EF    and         al,1
 006237F1    test        al,al
>006237F3    je          00623809
 006237F5    xor         edx,edx
 006237F7    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 006237FD    mov         dword ptr [esi+49C],3FF00000;TWiimoteObject.?f49C:dword
>00623807    jmp         00623862
 00623809    test        bl,2
>0062380C    je          00623822
 0062380E    xor         edx,edx
 00623810    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 00623816    mov         dword ptr [esi+49C],3FE80000;TWiimoteObject.?f49C:dword
>00623820    jmp         00623862
 00623822    test        bl,4
>00623825    je          0062383B
 00623827    xor         edx,edx
 00623829    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 0062382F    mov         dword ptr [esi+49C],3FE00000;TWiimoteObject.?f49C:dword
>00623839    jmp         00623862
 0062383B    test        bl,8
>0062383E    je          00623854
 00623840    xor         edx,edx
 00623842    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 00623848    mov         dword ptr [esi+49C],3FD00000;TWiimoteObject.?f49C:dword
>00623852    jmp         00623862
 00623854    xor         edx,edx
 00623856    mov         dword ptr [esi+498],edx;TWiimoteObject.FLedDrumLevel:Double
 0062385C    mov         dword ptr [esi+49C],edx;TWiimoteObject.?f49C:dword
 00623862    test        bl,8
>00623865    je          0062387B
 00623867    xor         eax,eax
 00623869    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 0062386F    mov         dword ptr [esi+494],3FF00000;TWiimoteObject.?f494:dword
>00623879    jmp         006238D3
 0062387B    test        bl,4
>0062387E    je          00623894
 00623880    xor         eax,eax
 00623882    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 00623888    mov         dword ptr [esi+494],3FE80000;TWiimoteObject.?f494:dword
>00623892    jmp         006238D3
 00623894    test        bl,2
>00623897    je          006238AD
 00623899    xor         eax,eax
 0062389B    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 006238A1    mov         dword ptr [esi+494],3FE00000;TWiimoteObject.?f494:dword
>006238AB    jmp         006238D3
 006238AD    test        al,al
>006238AF    je          006238C5
 006238B1    xor         eax,eax
 006238B3    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 006238B9    mov         dword ptr [esi+494],3FD00000;TWiimoteObject.?f494:dword
>006238C3    jmp         006238D3
 006238C5    xor         eax,eax
 006238C7    mov         dword ptr [esi+490],eax;TWiimoteObject.FLedLevel:Double
 006238CD    mov         dword ptr [esi+494],eax;TWiimoteObject.?f494:dword
 006238D3    cmp         bl,byte ptr [esi+48D];TWiimoteObject.FLeds:byte
>006238D9    je          00623911
 006238DB    mov         byte ptr [esi+48D],bl;TWiimoteObject.FLeds:byte
 006238E1    mov         eax,esp
 006238E3    xor         ecx,ecx
 006238E5    mov         edx,16
 006238EA    call        @FillChar
 006238EF    mov         byte ptr [esp],11
 006238F3    movzx       eax,byte ptr [esi+48C];TWiimoteObject.FRumble:Boolean
 006238FA    shl         ebx,4
 006238FD    or          al,bl
 006238FF    mov         byte ptr [esp+1],al
 00623903    mov         edx,esp
 00623905    mov         ecx,16
 0062390A    mov         eax,esi
 0062390C    call        TManagedHidObject.SendReport
 00623911    add         esp,18
 00623914    pop         esi
 00623915    pop         ebx
 00623916    ret
*}
end;

//00623918
procedure TWiimoteObject.SetReport11(value:Byte);
begin
{*
 00623918    push        ebx
 00623919    push        esi
 0062391A    add         esp,0FFFFFFE8
 0062391D    mov         ebx,edx
 0062391F    mov         esi,eax
 00623921    cmp         bl,byte ptr [esi+453];TWiimoteObject.OutReport11:Byte
>00623927    je          00623959
 00623929    mov         byte ptr [esi+453],bl;TWiimoteObject.OutReport11:Byte
 0062392F    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00623933    je          00623959
 00623935    mov         eax,esp
 00623937    xor         ecx,ecx
 00623939    mov         edx,16
 0062393E    call        @FillChar
 00623943    mov         byte ptr [esp],11
 00623947    mov         byte ptr [esp+1],bl
 0062394B    mov         edx,esp
 0062394D    mov         ecx,16
 00623952    mov         eax,esi
 00623954    call        TManagedHidObject.SendReport
 00623959    add         esp,18
 0062395C    pop         esi
 0062395D    pop         ebx
 0062395E    ret
*}
end;

//00623960
procedure TWiimoteObject.SetReport13(value:Byte);
begin
{*
 00623960    push        ebx
 00623961    push        esi
 00623962    add         esp,0FFFFFFE8
 00623965    mov         ebx,edx
 00623967    mov         esi,eax
 00623969    cmp         bl,byte ptr [esi+455];TWiimoteObject.OutReport13:Byte
>0062396F    je          006239A1
 00623971    mov         byte ptr [esi+455],bl;TWiimoteObject.OutReport13:Byte
 00623977    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>0062397B    je          006239A1
 0062397D    mov         eax,esp
 0062397F    xor         ecx,ecx
 00623981    mov         edx,16
 00623986    call        @FillChar
 0062398B    mov         byte ptr [esp],13
 0062398F    mov         byte ptr [esp+1],bl
 00623993    mov         edx,esp
 00623995    mov         ecx,16
 0062399A    mov         eax,esi
 0062399C    call        TManagedHidObject.SendReport
 006239A1    add         esp,18
 006239A4    pop         esi
 006239A5    pop         ebx
 006239A6    ret
*}
end;

//006239A8
procedure TWiimoteObject.SetReport14(value:Byte);
begin
{*
 006239A8    push        ebx
 006239A9    push        esi
 006239AA    add         esp,0FFFFFFE8
 006239AD    mov         ebx,edx
 006239AF    mov         esi,eax
 006239B1    cmp         bl,byte ptr [esi+456];TWiimoteObject.OutReport14:Byte
>006239B7    je          006239F5
 006239B9    mov         byte ptr [esi+456],bl;TWiimoteObject.OutReport14:Byte
 006239BF    test        bl,4
 006239C2    seta        al
 006239C5    mov         byte ptr [esi+45A],al;TWiimoteObject.SpeakerEnabled:Boolean
 006239CB    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>006239CF    je          006239F5
 006239D1    mov         eax,esp
 006239D3    xor         ecx,ecx
 006239D5    mov         edx,16
 006239DA    call        @FillChar
 006239DF    mov         byte ptr [esp],14
 006239E3    mov         byte ptr [esp+1],bl
 006239E7    mov         edx,esp
 006239E9    mov         ecx,16
 006239EE    mov         eax,esi
 006239F0    call        TManagedHidObject.SendReport
 006239F5    add         esp,18
 006239F8    pop         esi
 006239F9    pop         ebx
 006239FA    ret
*}
end;

//006239FC
procedure TWiimoteObject.SetReport15(value:Byte);
begin
{*
 006239FC    push        ebx
 006239FD    push        esi
 006239FE    add         esp,0FFFFFFE8
 00623A01    mov         ebx,edx
 00623A03    mov         esi,eax
 00623A05    mov         byte ptr [esi+457],bl;TWiimoteObject.OutReport15:Byte
 00623A0B    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00623A0F    je          00623A35
 00623A11    mov         eax,esp
 00623A13    xor         ecx,ecx
 00623A15    mov         edx,16
 00623A1A    call        @FillChar
 00623A1F    mov         byte ptr [esp],15
 00623A23    mov         byte ptr [esp+1],bl
 00623A27    mov         edx,esp
 00623A29    mov         ecx,16
 00623A2E    mov         eax,esi
 00623A30    call        TManagedHidObject.SendReport
 00623A35    add         esp,18
 00623A38    pop         esi
 00623A39    pop         ebx
 00623A3A    ret
*}
end;

//00623A3C
procedure TWiimoteObject.SetReport19(value:Byte);
begin
{*
 00623A3C    push        ebx
 00623A3D    push        esi
 00623A3E    add         esp,0FFFFFFE8
 00623A41    mov         ebx,edx
 00623A43    mov         esi,eax
 00623A45    cmp         bl,byte ptr [esi+458];TWiimoteObject.OutReport19:Byte
>00623A4B    je          00623A89
 00623A4D    mov         byte ptr [esi+458],bl;TWiimoteObject.OutReport19:Byte
 00623A53    test        bl,4
 00623A56    seta        al
 00623A59    mov         byte ptr [esi+45B],al;TWiimoteObject.Muted:Boolean
 00623A5F    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00623A63    je          00623A89
 00623A65    mov         eax,esp
 00623A67    xor         ecx,ecx
 00623A69    mov         edx,16
 00623A6E    call        @FillChar
 00623A73    mov         byte ptr [esp],19
 00623A77    mov         byte ptr [esp+1],bl
 00623A7B    mov         edx,esp
 00623A7D    mov         ecx,16
 00623A82    mov         eax,esi
 00623A84    call        TManagedHidObject.SendReport
 00623A89    add         esp,18
 00623A8C    pop         esi
 00623A8D    pop         ebx
 00623A8E    ret
*}
end;

//00623A90
procedure TWiimoteObject.SetReport1A(value:Byte);
begin
{*
 00623A90    push        ebx
 00623A91    push        esi
 00623A92    add         esp,0FFFFFFE8
 00623A95    mov         ebx,edx
 00623A97    mov         esi,eax
 00623A99    cmp         bl,byte ptr [esi+459];TWiimoteObject.OutReport1A:Byte
>00623A9F    je          00623AD1
 00623AA1    mov         byte ptr [esi+459],bl;TWiimoteObject.OutReport1A:Byte
 00623AA7    cmp         dword ptr [esi+20],0;TWiimoteObject.Dev:TJvHidDevice
>00623AAB    je          00623AD1
 00623AAD    mov         eax,esp
 00623AAF    xor         ecx,ecx
 00623AB1    mov         edx,16
 00623AB6    call        @FillChar
 00623ABB    mov         byte ptr [esp],1A
 00623ABF    mov         byte ptr [esp+1],bl
 00623AC3    mov         edx,esp
 00623AC5    mov         ecx,16
 00623ACA    mov         eax,esi
 00623ACC    call        TManagedHidObject.SendReport
 00623AD1    add         esp,18
 00623AD4    pop         esi
 00623AD5    pop         ebx
 00623AD6    ret
*}
end;

//00623AD8
procedure TWiimoteObject.SetRumble(value:Boolean);
begin
{*
 00623AD8    push        ebx
 00623AD9    add         esp,0FFFFFFE8
 00623ADC    mov         ebx,eax
 00623ADE    cmp         dl,byte ptr [ebx+48C];TWiimoteObject.FRumble:Boolean
>00623AE4    je          00623B26
 00623AE6    mov         byte ptr [ebx+48C],dl;TWiimoteObject.FRumble:Boolean
 00623AEC    mov         eax,esp
 00623AEE    xor         ecx,ecx
 00623AF0    mov         edx,16
 00623AF5    call        @FillChar
 00623AFA    mov         byte ptr [esp],11
 00623AFE    movzx       eax,byte ptr [ebx+48C];TWiimoteObject.FRumble:Boolean
 00623B05    movzx       edx,byte ptr [ebx+48D];TWiimoteObject.FLeds:byte
 00623B0C    and         dl,0F
 00623B0F    shl         edx,4
 00623B12    add         al,dl
 00623B14    mov         byte ptr [esp+1],al
 00623B18    mov         edx,esp
 00623B1A    mov         ecx,16
 00623B1F    mov         eax,ebx
 00623B21    call        TManagedHidObject.SendReport
 00623B26    add         esp,18
 00623B29    pop         ebx
 00623B2A    ret
*}
end;

//00623B2C
{*procedure TWiimoteObject.SetSampleRate(NewSampleRate:Double; ?:?);
begin
 00623B2C    push        ebp
 00623B2D    mov         ebp,esp
 00623B2F    push        ebx
 00623B30    mov         ebx,eax
 00623B32    fld         qword ptr [ebp+8]
 00623B35    fcomp       dword ptr ds:[623B7C];1:Single
 00623B3B    wait
 00623B3C    fnstsw      al
 00623B3E    sahf
>00623B3F    jae         00623B4D
 00623B41    xor         eax,eax
 00623B43    mov         dword ptr [ebp+8],eax
 00623B46    mov         dword ptr [ebp+0C],3FF00000
 00623B4D    mov         eax,dword ptr [ebp+8]
 00623B50    mov         dword ptr [ebx+5B8],eax;TWiimoteObject.SampleRate:Double
 00623B56    mov         eax,dword ptr [ebp+0C]
 00623B59    mov         dword ptr [ebx+5BC],eax;TWiimoteObject.?f5BC:dword
 00623B5F    push        dword ptr [ebp+0C]
 00623B62    push        dword ptr [ebp+8]
 00623B65    call        0061F6F4
 00623B6A    movzx       edx,ax
 00623B6D    mov         eax,ebx
 00623B6F    call        TWiimoteObject.SetSampleRateWord
 00623B74    pop         ebx
 00623B75    pop         ebp
 00623B76    ret         8
end;*}

//00623B80
procedure TWiimoteObject.SetSampleRateNumber(Number:Integer);
begin
{*
 00623B80    push        ebx
 00623B81    push        esi
 00623B82    push        edi
 00623B83    push        ecx
 00623B84    mov         edi,edx
 00623B86    mov         esi,eax
 00623B88    test        edi,edi
>00623B8A    jge         00623B90
 00623B8C    xor         edi,edi
>00623B8E    jmp         00623B9D
 00623B90    cmp         edi,0FF
>00623B96    jle         00623B9D
 00623B98    mov         edi,0FF
 00623B9D    movzx       eax,byte ptr [esi+5D0];TWiimoteObject.SampleRateNumber:Integer
 00623BA4    movzx       eax,al
 00623BA7    cmp         edi,eax
>00623BA9    je          00623BC0
 00623BAB    mov         ecx,edi
 00623BAD    mov         edx,4A20004
 00623BB2    mov         eax,esi
 00623BB4    call        TWiimoteObject.Poke
 00623BB9    mov         eax,esi
 00623BBB    call        TWiimoteObject.UpdateSpeakerThread
 00623BC0    mov         ebx,edi
 00623BC2    mov         byte ptr [esi+5D0],bl;TWiimoteObject.SampleRateNumber:Integer
 00623BC8    mov         eax,ebx
 00623BCA    call        0061F6A8
 00623BCF    mov         dword ptr [esp],eax
 00623BD2    fild        dword ptr [esp]
 00623BD5    fstp        qword ptr [esi+5C0];TWiimoteObject.RealSampleRate:Double
 00623BDB    wait
 00623BDC    pop         edx
 00623BDD    pop         edi
 00623BDE    pop         esi
 00623BDF    pop         ebx
 00623BE0    ret
*}
end;

//00623BE4
procedure TWiimoteObject.SetSampleRateWord(Number:Integer);
begin
{*
 00623BE4    push        ebx
 00623BE5    push        esi
 00623BE6    push        edi
 00623BE7    mov         ebx,edx
 00623BE9    mov         esi,eax
 00623BEB    test        ebx,ebx
>00623BED    jge         00623BF3
 00623BEF    xor         ebx,ebx
>00623BF1    jmp         00623C00
 00623BF3    cmp         ebx,0FFFF
>00623BF9    jle         00623C00
 00623BFB    mov         ebx,0FFFF
 00623C00    movzx       eax,word ptr [esi+5D2];TWiimoteObject.SampleRateWord:Integer
 00623C07    movzx       eax,ax
 00623C0A    cmp         ebx,eax
>00623C0C    je          00623C47
 00623C0E    mov         ecx,ebx
 00623C10    and         cl,0FF
 00623C13    mov         edx,4A20003
 00623C18    mov         eax,esi
 00623C1A    call        TWiimoteObject.Poke
 00623C1F    mov         ecx,ebx
 00623C21    shr         ecx,8
 00623C24    mov         edx,4A20004
 00623C29    mov         eax,esi
 00623C2B    call        TWiimoteObject.Poke
 00623C30    mov         edi,ebx
 00623C32    mov         word ptr [esi+5D2],di;TWiimoteObject.SampleRateWord:Integer
 00623C39    mov         eax,edi
 00623C3B    call        0061F6BC
 00623C40    fstp        qword ptr [esi+5C0];TWiimoteObject.RealSampleRate:Double
 00623C46    wait
 00623C47    pop         edi
 00623C48    pop         esi
 00623C49    pop         ebx
 00623C4A    ret
*}
end;

//00623C4C
procedure TWiimoteObject.SetSpeaker(SpeakerOn:Boolean);
begin
{*
 00623C4C    cmp         dl,byte ptr [eax+45A];TWiimoteObject.SpeakerEnabled:Boolean
>00623C52    je          00623C64
 00623C54    test        dl,dl
>00623C56    je          00623C5F
 00623C58    call        TWiimoteObject.EnableSpeaker
>00623C5D    jmp         00623C64
 00623C5F    call        TWiimoteObject.DisableSpeaker
 00623C64    ret
*}
end;

//00623C68
{*procedure TWiimoteObject.SetVolume(NewVolume:Double; ?:?);
begin
 00623C68    push        ebp
 00623C69    mov         ebp,esp
 00623C6B    push        ebx
 00623C6C    mov         ebx,eax
 00623C6E    fld         qword ptr [ebp+8]
 00623C71    fcomp       dword ptr ds:[623CE8];0:Single
 00623C77    wait
 00623C78    fnstsw      al
 00623C7A    sahf
>00623C7B    jae         00623C85
 00623C7D    xor         eax,eax
 00623C7F    mov         dword ptr [ebp+8],eax
 00623C82    mov         dword ptr [ebp+0C],eax
 00623C85    fld         qword ptr [ebp+8]
 00623C88    fcomp       dword ptr ds:[623CEC];1:Single
 00623C8E    wait
 00623C8F    fnstsw      al
 00623C91    sahf
>00623C92    jbe         00623CA0
 00623C94    xor         eax,eax
 00623C96    mov         dword ptr [ebp+8],eax
 00623C99    mov         dword ptr [ebp+0C],3FF00000
 00623CA0    fld         qword ptr [ebp+8]
 00623CA3    fcomp       qword ptr [ebx+5A8];TWiimoteObject.Volume:Double
 00623CA9    wait
 00623CAA    fnstsw      al
 00623CAC    sahf
>00623CAD    je          00623CE0
 00623CAF    mov         eax,dword ptr [ebp+8]
 00623CB2    mov         dword ptr [ebx+5A8],eax;TWiimoteObject.Volume:Double
 00623CB8    mov         eax,dword ptr [ebp+0C]
 00623CBB    mov         dword ptr [ebx+5AC],eax;TWiimoteObject.?f5AC:dword
 00623CC1    fld         qword ptr [ebx+5A8];TWiimoteObject.Volume:Double
 00623CC7    fmul        dword ptr ds:[623CF0];255:Single
 00623CCD    call        @ROUND
 00623CD2    mov         ecx,eax
 00623CD4    mov         edx,4A20005
 00623CD9    mov         eax,ebx
 00623CDB    call        TWiimoteObject.Poke
 00623CE0    pop         ebx
 00623CE1    pop         ebp
 00623CE2    ret         8
end;*}

//00623CF4
procedure TWiimoteObject.ShowCalibrating(value:Boolean);
begin
{*
 00623CF4    test        dl,dl
>00623CF6    jne         00623D0E
 00623CF8    cmp         byte ptr [eax+48D],6;TWiimoteObject.FLeds:byte
>00623CFF    jne         00623D0E
 00623D01    movzx       edx,byte ptr [eax+488];TWiimoteObject.FNumber:Integer
 00623D08    call        TWiimoteObject.SetPlayerLed
 00623D0D    ret
 00623D0E    cmp         dl,1
>00623D11    jne         00623D1A
 00623D13    mov         dl,6
 00623D15    call        TWiimoteObject.SetLeds
 00623D1A    ret
*}
end;

//00623D1C
procedure TWiimoteObject.ShowConnecting;
begin
{*
 00623D1C    push        ebx
 00623D1D    add         esp,0FFFFFFE8
 00623D20    mov         ebx,eax
 00623D22    lea         eax,[esp+2]
 00623D26    xor         ecx,ecx
 00623D28    mov         edx,14
 00623D2D    call        @FillChar
 00623D32    mov         byte ptr [esp],11
 00623D36    mov         byte ptr [esp+1],90
 00623D3B    mov         edx,esp
 00623D3D    mov         eax,ebx
 00623D3F    call        TManagedHidObject.SendReportBothWays
 00623D44    add         esp,18
 00623D47    pop         ebx
 00623D48    ret
*}
end;

//00623D4C
procedure TWiimoteObject.StartSpeaker;
begin
{*
 00623D4C    push        ebx
 00623D4D    mov         ebx,eax
 00623D4F    cmp         dword ptr [ebx+5A0],0;TWiimoteObject.SpeakerThread:TThread
>00623D56    jne         00623D98
 00623D58    cmp         byte ptr [ebx+56],0;TWiimoteObject.UseHidWrite:Boolean
>00623D5C    je          00623D90
 00623D5E    push        dword ptr [ebx+5B4];TWiimoteObject.?f5B4:dword
 00623D64    push        dword ptr [ebx+5B0];TWiimoteObject.Frequency:Double
 00623D6A    push        dword ptr [ebx+5C4];TWiimoteObject.?f5C4:dword
 00623D70    push        dword ptr [ebx+5C0];TWiimoteObject.RealSampleRate:Double
 00623D76    mov         eax,dword ptr [ebx+20];TWiimoteObject.Dev:TJvHidDevice
 00623D79    mov         eax,dword ptr [eax+0C];TJvHidDevice.FHidFileHandle:Cardinal
 00623D7C    movzx       edx,byte ptr [ebx+48C];TWiimoteObject.FRumble:Boolean
 00623D83    call        00619E40
 00623D88    mov         dword ptr [ebx+5A0],eax;TWiimoteObject.SpeakerThread:TThread
>00623D8E    jmp         00623D98
 00623D90    xor         eax,eax
 00623D92    mov         dword ptr [ebx+5A0],eax;TWiimoteObject.SpeakerThread:TThread
 00623D98    pop         ebx
 00623D99    ret
*}
end;

//00623D9C
procedure TWiimoteObject.Stop;
begin
{*
 00623D9C    push        ebx
 00623D9D    mov         ebx,eax
 00623D9F    cmp         dword ptr [ebx+20],0;TWiimoteObject.Dev:TJvHidDevice
>00623DA3    je          00623DD1
 00623DA5    mov         eax,[0078D590];^Application:TApplication
 00623DAA    mov         eax,dword ptr [eax]
 00623DAC    call        TApplication.ProcessMessages
 00623DB1    push        0
 00623DB3    push        0
 00623DB5    mov         eax,dword ptr [ebx+20];TWiimoteObject.Dev:TJvHidDevice
 00623DB8    call        005DF390
 00623DBD    cmp         byte ptr [ebx+19],0;TWiimoteObject.Unplugged:Boolean
>00623DC1    jne         00623DCA
 00623DC3    mov         eax,ebx
 00623DC5    call        TWiimoteObject.SwitchOff
 00623DCA    mov         eax,ebx
 00623DCC    call        TManagedHidObject.CheckIn
 00623DD1    pop         ebx
 00623DD2    ret
*}
end;

//00623DD4
procedure TWiimoteObject.StopSpeaker;
begin
{*
 00623DD4    push        ebx
 00623DD5    mov         ebx,eax
 00623DD7    mov         eax,dword ptr [ebx+5A0];TWiimoteObject.SpeakerThread:TThread
 00623DDD    call        TThread.Terminate
 00623DE2    xor         eax,eax
 00623DE4    mov         dword ptr [ebx+5A0],eax;TWiimoteObject.SpeakerThread:TThread
 00623DEA    pop         ebx
 00623DEB    ret
*}
end;

//00623DEC
procedure TWiimoteObject.SwitchOff;
begin
{*
 00623DEC    push        ebx
 00623DED    mov         ebx,eax
 00623DEF    cmp         dword ptr [ebx+20],0;TWiimoteObject.Dev:TJvHidDevice
>00623DF3    je          00623E69
 00623DF5    cmp         byte ptr [ebx+18],0;TWiimoteObject.Connected:Boolean
>00623DF9    je          00623E69
 00623DFB    mov         eax,ebx
 00623DFD    call        TManagedHidObject.CancelMessages
 00623E02    mov         byte ptr [ebx+48C],0;TWiimoteObject.FRumble:Boolean
 00623E09    cmp         byte ptr [ebx+446],0;TWiimoteObject.FUseIR:Boolean
>00623E10    je          00623E19
 00623E12    mov         eax,ebx
 00623E14    call        TWiimoteObject.DisableIR
 00623E19    cmp         byte ptr [ebx+449],0;TWiimoteObject.FUseSpeaker:Boolean
>00623E20    je          00623E30
 00623E22    mov         byte ptr [ebx+45B],0;TWiimoteObject.Muted:Boolean
 00623E29    mov         eax,ebx
 00623E2B    call        TWiimoteObject.DisableSpeaker
 00623E30    cmp         byte ptr [ebx+447],0;TWiimoteObject.FUseExpansion:Boolean
>00623E37    je          00623E40
 00623E39    mov         eax,ebx
 00623E3B    call        TWiimoteObject.DisableExpansion
 00623E40    mov         dl,0FF
 00623E42    mov         eax,ebx
 00623E44    call        TWiimoteObject.SetLeds
 00623E49    xor         edx,edx
 00623E4B    mov         eax,ebx
 00623E4D    call        TWiimoteObject.SetLeds
 00623E52    push        64
 00623E54    call        kernel32.Sleep
 00623E59    mov         dl,30
 00623E5B    mov         eax,ebx
 00623E5D    call        TWiimoteObject.SetChannel
 00623E62    push        64
 00623E64    call        kernel32.Sleep
 00623E69    pop         ebx
 00623E6A    ret
*}
end;

//00623E6C
function TWiimoteObject.TestConnection:Integer;
begin
{*
 00623E6C    push        ebx
 00623E6D    push        esi
 00623E6E    mov         ebx,eax
 00623E70    xor         esi,esi
 00623E72    cmp         byte ptr [ebx+19],0;TWiimoteObject.Unplugged:Boolean
>00623E76    jne         00623EA0
 00623E78    cmp         byte ptr [ebx+54],0;TWiimoteObject.FileWriteFailed:Boolean
>00623E7C    je          00623E85
 00623E7E    mov         eax,ebx
 00623E80    call        TManagedHidObject.SwitchToHidWrite
 00623E85    cmp         byte ptr [ebx+55],0;TWiimoteObject.HidWriteFailed:Boolean
>00623E89    jne         00623EA0
 00623E8B    mov         dl,30
 00623E8D    mov         eax,ebx
 00623E8F    call        TWiimoteObject.SetChannel
 00623E94    mov         eax,ebx
 00623E96    call        TWiimoteObject.RequestStatusReport
 00623E9B    mov         esi,1
 00623EA0    mov         eax,esi
 00623EA2    pop         esi
 00623EA3    pop         ebx
 00623EA4    ret
*}
end;

//00623EA8
function TWiimoteObject.Two:Boolean;
begin
{*
 00623EA8    test        eax,eax
>00623EAA    je          00623EB7
 00623EAC    test        word ptr [eax+580],1;TWiimoteObject.Buttons:word
>00623EB5    ja          00623EBA
 00623EB7    xor         eax,eax
 00623EB9    ret
 00623EBA    mov         al,1
 00623EBC    ret
*}
end;

//00623EC0
function TWiimoteObject.TwoPrev:Boolean;
begin
{*
 00623EC0    test        eax,eax
>00623EC2    je          00623ECF
 00623EC4    test        word ptr [eax+582],1;TWiimoteObject.OldButtons:word
>00623ECD    ja          00623ED2
 00623ECF    xor         eax,eax
 00623ED1    ret
 00623ED2    mov         al,1
 00623ED4    ret
*}
end;

//00623ED8
{*function sub_00623ED8:?;
begin
 00623ED8    ret
end;*}

//00623EDC
{*function sub_00623EDC:?;
begin
 00623EDC    ret
end;*}

//00623EE0
procedure sub_00623EE0(?:TWiimoteObject);
begin
{*
 00623EE0    push        ebp
 00623EE1    mov         ebp,esp
 00623EE3    mov         edx,dword ptr [eax+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00623EE9    cmp         byte ptr [edx+444],0;TNunchukObject.Exists:Boolean
>00623EF0    je          00623EF9
 00623EF2    call        00623F58
>00623EF7    jmp         00623F4A
 00623EF9    mov         edx,dword ptr [eax+4B8];TWiimoteObject.Classic:TClassicObject
 00623EFF    cmp         byte ptr [edx+8],0;TClassicObject.Exists:Boolean
>00623F03    je          00623F0C
 00623F05    call        00623ED8
>00623F0A    jmp         00623F4A
 00623F0C    mov         edx,dword ptr [eax+4BC];TWiimoteObject.Guitar:TGuitarObject
 00623F12    cmp         byte ptr [edx+8],0;TGuitarObject.Exists:Boolean
>00623F16    je          00623F1F
 00623F18    call        00623F50
>00623F1D    jmp         00623F4A
 00623F1F    mov         edx,dword ptr [eax+4C0];TWiimoteObject.Drums:TDrumsObject
 00623F25    cmp         byte ptr [edx+8],0;TDrumsObject.Exists:Boolean
>00623F29    je          00623F32
 00623F2B    call        00623EDC
>00623F30    jmp         00623F4A
 00623F32    mov         edx,dword ptr [eax+4C4];TWiimoteObject.Turntable:TTurntableObject
 00623F38    cmp         byte ptr [edx+8],0;TTurntableObject.Exists:Boolean
>00623F3C    je          00623F45
 00623F3E    call        00623F60
>00623F43    jmp         00623F4A
 00623F45    call        00623F64
 00623F4A    pop         ebp
 00623F4B    ret         4
*}
end;

//00623F50
{*function sub_00623F50:?;
begin
 00623F50    ret
end;*}

//00623F54
procedure sub_00623F54;
begin
{*
 00623F54    ret
*}
end;

//00623F58
{*function sub_00623F58:?;
begin
 00623F58    ret
end;*}

//00623F5C
procedure sub_00623F5C;
begin
{*
 00623F5C    ret
*}
end;

//00623F60
procedure sub_00623F60;
begin
{*
 00623F60    ret
*}
end;

//00623F64
procedure sub_00623F64;
begin
{*
 00623F64    ret
*}
end;

//00623F68
function TWiimoteObject.Up:Boolean;
begin
{*
 00623F68    test        eax,eax
>00623F6A    je          00623F77
 00623F6C    test        word ptr [eax+580],800;TWiimoteObject.Buttons:word
>00623F75    ja          00623F7A
 00623F77    xor         eax,eax
 00623F79    ret
 00623F7A    mov         al,1
 00623F7C    ret
*}
end;

//00623F80
procedure TWiimoteObject.UpdateIR;
begin
{*
 00623F80    push        ebx
 00623F81    add         esp,0FFFFFFD4
 00623F84    mov         ebx,eax
 00623F86    fld         qword ptr [ebx+350];TWiimoteObject.UpX:Double
 00623F8C    fadd        qword ptr [ebx+608];TWiimoteObject.PrevUpX:Double
 00623F92    fcomp       dword ptr ds:[624FE8];0:Single
 00623F98    wait
 00623F99    fnstsw      al
 00623F9B    sahf
>00623F9C    jne         00623FB6
 00623F9E    fld         qword ptr [ebx+358];TWiimoteObject.UpY:Double
 00623FA4    fadd        qword ptr [ebx+610];TWiimoteObject.PrevUpY:Double
 00623FAA    fcomp       dword ptr ds:[624FE8];0:Single
 00623FB0    wait
 00623FB1    fnstsw      al
 00623FB3    sahf
>00623FB4    je          00624017
 00623FB6    fld         qword ptr [ebx+350];TWiimoteObject.UpX:Double
 00623FBC    fadd        qword ptr [ebx+608];TWiimoteObject.PrevUpX:Double
 00623FC2    fdiv        dword ptr ds:[624FEC];2:Single
 00623FC8    add         esp,0FFFFFFF8
 00623FCB    fstp        qword ptr [esp]
 00623FCE    wait
 00623FCF    fld         qword ptr [ebx+358];TWiimoteObject.UpY:Double
 00623FD5    fadd        qword ptr [ebx+610];TWiimoteObject.PrevUpY:Double
 00623FDB    fdiv        dword ptr ds:[624FEC];2:Single
 00623FE1    add         esp,0FFFFFFF8
 00623FE4    fstp        qword ptr [esp]
 00623FE7    wait
 00623FE8    push        0
 00623FEA    push        0
 00623FEC    call        005C4070
 00623FF1    fstp        qword ptr [esp]
 00623FF4    wait
 00623FF5    fld         qword ptr [ebx+350];TWiimoteObject.UpX:Double
 00623FFB    fchs
 00623FFD    fdiv        qword ptr [esp]
 00624000    fstp        qword ptr [ebx+620];TWiimoteObject.SinOfRoll:Double
 00624006    wait
 00624007    fld         qword ptr [ebx+358];TWiimoteObject.UpY:Double
 0062400D    fdiv        qword ptr [esp]
 00624010    fstp        qword ptr [ebx+628];TWiimoteObject.CosOfRoll:Double
 00624016    wait
 00624017    mov         eax,dword ptr [ebx+350];TWiimoteObject.UpX:Double
 0062401D    mov         dword ptr [ebx+608],eax;TWiimoteObject.PrevUpX:Double
 00624023    mov         eax,dword ptr [ebx+354];TWiimoteObject.?f354:TRotMat
 00624029    mov         dword ptr [ebx+60C],eax;TWiimoteObject.?f60C:dword
 0062402F    mov         eax,dword ptr [ebx+358];TWiimoteObject.UpY:Double
 00624035    mov         dword ptr [ebx+610],eax;TWiimoteObject.PrevUpY:Double
 0062403B    mov         eax,dword ptr [ebx+35C];TWiimoteObject.?f35C:TRotMat
 00624041    mov         dword ptr [ebx+614],eax;TWiimoteObject.?f614:dword
 00624047    mov         eax,dword ptr [ebx+360];TWiimoteObject.UpZ:Double
 0062404D    mov         dword ptr [ebx+618],eax;TWiimoteObject.PrevUpZ:Double
 00624053    mov         eax,dword ptr [ebx+364];TWiimoteObject.?f364:TRotMat
 00624059    mov         dword ptr [ebx+61C],eax;TWiimoteObject.?f61C:dword
 0062405F    cmp         byte ptr [ebx+5DE],0;TWiimoteObject.?f5DE:byte
>00624066    je          006240DA
 00624068    fild        dword ptr [ebx+5D5];TWiimoteObject.Dots:?
 0062406E    fsubr       dword ptr ds:[624FF0];511.5:Single
 00624074    fmul        qword ptr [ebx+628];TWiimoteObject.CosOfRoll:Double
 0062407A    fdiv        dword ptr ds:[624FF0];511.5:Single
 00624080    fild        dword ptr [ebx+5D9];TWiimoteObject.?f5D9:Single
 00624086    fsub        dword ptr ds:[624FF4];383.5:Single
 0062408C    fmul        qword ptr [ebx+620];TWiimoteObject.SinOfRoll:Double
 00624092    fdiv        dword ptr ds:[624FF0];511.5:Single
 00624098    fsubp       st(1),st
 0062409A    fstp        qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006240A0    wait
 006240A1    fild        dword ptr [ebx+5D5];TWiimoteObject.Dots:?
 006240A7    fsubr       dword ptr ds:[624FF0];511.5:Single
 006240AD    fmul        qword ptr [ebx+620];TWiimoteObject.SinOfRoll:Double
 006240B3    fdiv        dword ptr ds:[624FF0];511.5:Single
 006240B9    fild        dword ptr [ebx+5D9];TWiimoteObject.?f5D9:Single
 006240BF    fsub        dword ptr ds:[624FF4];383.5:Single
 006240C5    fmul        qword ptr [ebx+628];TWiimoteObject.CosOfRoll:Double
 006240CB    fdiv        dword ptr ds:[624FF0];511.5:Single
 006240D1    faddp       st(1),st
 006240D3    fstp        qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006240D9    wait
 006240DA    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>006240E1    je          00624155
 006240E3    fild        dword ptr [ebx+5E1];TWiimoteObject.?f5E1:Single
 006240E9    fsubr       dword ptr ds:[624FF0];511.5:Single
 006240EF    fmul        qword ptr [ebx+628];TWiimoteObject.CosOfRoll:Double
 006240F5    fdiv        dword ptr ds:[624FF0];511.5:Single
 006240FB    fild        dword ptr [ebx+5E5];TWiimoteObject.?f5E5:Single
 00624101    fsub        dword ptr ds:[624FF4];383.5:Single
 00624107    fmul        qword ptr [ebx+620];TWiimoteObject.SinOfRoll:Double
 0062410D    fdiv        dword ptr ds:[624FF0];511.5:Single
 00624113    fsubp       st(1),st
 00624115    fstp        qword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 0062411B    wait
 0062411C    fild        dword ptr [ebx+5E1];TWiimoteObject.?f5E1:Single
 00624122    fsubr       dword ptr ds:[624FF0];511.5:Single
 00624128    fmul        qword ptr [ebx+620];TWiimoteObject.SinOfRoll:Double
 0062412E    fdiv        dword ptr ds:[624FF0];511.5:Single
 00624134    fild        dword ptr [ebx+5E5];TWiimoteObject.?f5E5:Single
 0062413A    fsub        dword ptr ds:[624FF4];383.5:Single
 00624140    fmul        qword ptr [ebx+628];TWiimoteObject.CosOfRoll:Double
 00624146    fdiv        dword ptr ds:[624FF0];511.5:Single
 0062414C    faddp       st(1),st
 0062414E    fstp        qword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 00624154    wait
 00624155    cmp         byte ptr [ebx+5DE],0;TWiimoteObject.?f5DE:byte
>0062415C    je          0062421A
 00624162    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>00624169    je          0062421A
 0062416F    fld         qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 00624175    fcomp       qword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 0062417B    wait
 0062417C    fnstsw      al
 0062417E    sahf
>0062417F    ja          006241A0
 00624181    mov         dword ptr [ebx+650],1;TWiimoteObject.VarLeftDot:Integer
 0062418B    fld         qword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 00624191    fsub        qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 00624197    fstp        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 0062419D    wait
>0062419E    jmp         006241BD
 006241A0    mov         dword ptr [ebx+650],2;TWiimoteObject.VarLeftDot:Integer
 006241AA    fld         qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006241B0    fsub        qword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 006241B6    fstp        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 006241BC    wait
 006241BD    fld         qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006241C3    fsub        qword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 006241C9    fabs
 006241CB    fstp        qword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 006241D1    wait
 006241D2    push        dword ptr [ebx+6AC];TWiimoteObject.?f6AC:dword
 006241D8    push        dword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 006241DE    push        dword ptr [ebx+6B4];TWiimoteObject.?f6B4:dword
 006241E4    push        dword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 006241EA    push        0
 006241EC    push        0
 006241EE    call        005C4070
 006241F3    fmul        dword ptr ds:[624FF0];511.5:Single
 006241F9    fstp        qword ptr [ebx+6B8];TWiimoteObject.VarDotSep:Double
 006241FF    wait
 00624200    mov         eax,ebx
 00624202    call        TWiimoteObject.SensorBarSeparation
 00624207    fmul        dword ptr ds:[624FF8];1320:Single
 0062420D    fdiv        qword ptr [ebx+6B8];TWiimoteObject.VarDotSep:Double
 00624213    fstp        qword ptr [ebx+6C0];TWiimoteObject.VarIRDistance:Double
 00624219    wait
 0062421A    mov         eax,dword ptr [ebx+650];TWiimoteObject.VarLeftDot:Integer
 00624220    cmp         eax,1
>00624223    jne         00624477
 00624229    movzx       eax,byte ptr [ebx+5DE];TWiimoteObject.?f5DE:byte
 00624230    test        al,al
>00624232    je          006242B0
 00624234    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>0062423B    je          006242B0
 0062423D    mov         eax,dword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 00624243    mov         dword ptr [ebx+658],eax;TWiimoteObject.VarLeftDotX:Double
 00624249    mov         eax,dword ptr [ebx+634];TWiimoteObject.?f634:dword
 0062424F    mov         dword ptr [ebx+65C],eax;TWiimoteObject.?f65C:dword
 00624255    mov         eax,dword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 0062425B    mov         dword ptr [ebx+660],eax;TWiimoteObject.VarLeftDotY:Double
 00624261    mov         eax,dword ptr [ebx+63C];TWiimoteObject.?f63C:dword
 00624267    mov         dword ptr [ebx+664],eax;TWiimoteObject.?f664:dword
 0062426D    mov         byte ptr [ebx+6F8],1;TWiimoteObject.VarLeftDotVis:Boolean
 00624274    mov         eax,dword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 0062427A    mov         dword ptr [ebx+668],eax;TWiimoteObject.VarRightDotX:Double
 00624280    mov         eax,dword ptr [ebx+644];TWiimoteObject.?f644:dword
 00624286    mov         dword ptr [ebx+66C],eax;TWiimoteObject.?f66C:dword
 0062428C    mov         eax,dword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 00624292    mov         dword ptr [ebx+670],eax;TWiimoteObject.VarRightDotY:Double
 00624298    mov         eax,dword ptr [ebx+64C];TWiimoteObject.?f64C:dword
 0062429E    mov         dword ptr [ebx+674],eax;TWiimoteObject.?f674:dword
 006242A4    mov         byte ptr [ebx+6F9],1;TWiimoteObject.VarRightDotVis:Boolean
>006242AB    jmp         00624780
 006242B0    test        al,al
>006242B2    je          00624401
 006242B8    fld         qword ptr [ebx+658];TWiimoteObject.VarLeftDotX:Double
 006242BE    fsub        qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006242C4    add         esp,0FFFFFFF8
 006242C7    fstp        qword ptr [esp]
 006242CA    wait
 006242CB    fld         qword ptr [ebx+660];TWiimoteObject.VarLeftDotY:Double
 006242D1    fsub        qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006242D7    add         esp,0FFFFFFF8
 006242DA    fstp        qword ptr [esp]
 006242DD    wait
 006242DE    push        0
 006242E0    push        0
 006242E2    call        005C4070
 006242E7    fstp        qword ptr [esp+18]
 006242EB    wait
 006242EC    fld         qword ptr [ebx+668];TWiimoteObject.VarRightDotX:Double
 006242F2    fsub        qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006242F8    add         esp,0FFFFFFF8
 006242FB    fstp        qword ptr [esp]
 006242FE    wait
 006242FF    fld         qword ptr [ebx+670];TWiimoteObject.VarRightDotY:Double
 00624305    fsub        qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 0062430B    add         esp,0FFFFFFF8
 0062430E    fstp        qword ptr [esp]
 00624311    wait
 00624312    push        0
 00624314    push        0
 00624316    call        005C4070
 0062431B    fcomp       qword ptr [esp+18]
 0062431F    wait
 00624320    fnstsw      al
 00624322    sahf
>00624323    jb          0062438E
 00624325    mov         eax,dword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 0062432B    mov         dword ptr [ebx+658],eax;TWiimoteObject.VarLeftDotX:Double
 00624331    mov         eax,dword ptr [ebx+634];TWiimoteObject.?f634:dword
 00624337    mov         dword ptr [ebx+65C],eax;TWiimoteObject.?f65C:dword
 0062433D    mov         eax,dword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 00624343    mov         dword ptr [ebx+660],eax;TWiimoteObject.VarLeftDotY:Double
 00624349    mov         eax,dword ptr [ebx+63C];TWiimoteObject.?f63C:dword
 0062434F    mov         dword ptr [ebx+664],eax;TWiimoteObject.?f664:dword
 00624355    fld         qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 0062435B    fadd        qword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 00624361    fstp        qword ptr [ebx+668];TWiimoteObject.VarRightDotX:Double
 00624367    wait
 00624368    fld         qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 0062436E    fadd        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 00624374    fstp        qword ptr [ebx+670];TWiimoteObject.VarRightDotY:Double
 0062437A    wait
 0062437B    mov         byte ptr [ebx+6F8],1;TWiimoteObject.VarLeftDotVis:Boolean
 00624382    mov         byte ptr [ebx+6F9],0;TWiimoteObject.VarRightDotVis:Boolean
>00624389    jmp         00624780
 0062438E    mov         dword ptr [ebx+650],2;TWiimoteObject.VarLeftDot:Integer
 00624398    fld         qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 0062439E    fsub        qword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 006243A4    fstp        qword ptr [ebx+658];TWiimoteObject.VarLeftDotX:Double
 006243AA    wait
 006243AB    fld         qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006243B1    fsub        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 006243B7    fstp        qword ptr [ebx+660];TWiimoteObject.VarLeftDotY:Double
 006243BD    wait
 006243BE    mov         eax,dword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006243C4    mov         dword ptr [ebx+668],eax;TWiimoteObject.VarRightDotX:Double
 006243CA    mov         eax,dword ptr [ebx+634];TWiimoteObject.?f634:dword
 006243D0    mov         dword ptr [ebx+66C],eax;TWiimoteObject.?f66C:dword
 006243D6    mov         eax,dword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006243DC    mov         dword ptr [ebx+670],eax;TWiimoteObject.VarRightDotY:Double
 006243E2    mov         eax,dword ptr [ebx+63C];TWiimoteObject.?f63C:dword
 006243E8    mov         dword ptr [ebx+674],eax;TWiimoteObject.?f674:dword
 006243EE    mov         byte ptr [ebx+6F9],1;TWiimoteObject.VarRightDotVis:Boolean
 006243F5    mov         byte ptr [ebx+6F8],0;TWiimoteObject.VarLeftDotVis:Boolean
>006243FC    jmp         00624780
 00624401    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>00624408    je          00624780
 0062440E    fld         qword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 00624414    fsub        qword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 0062441A    fstp        qword ptr [ebx+658];TWiimoteObject.VarLeftDotX:Double
 00624420    wait
 00624421    fld         qword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 00624427    fsub        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 0062442D    fstp        qword ptr [ebx+660];TWiimoteObject.VarLeftDotY:Double
 00624433    wait
 00624434    mov         eax,dword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 0062443A    mov         dword ptr [ebx+668],eax;TWiimoteObject.VarRightDotX:Double
 00624440    mov         eax,dword ptr [ebx+644];TWiimoteObject.?f644:dword
 00624446    mov         dword ptr [ebx+66C],eax;TWiimoteObject.?f66C:dword
 0062444C    mov         eax,dword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 00624452    mov         dword ptr [ebx+670],eax;TWiimoteObject.VarRightDotY:Double
 00624458    mov         eax,dword ptr [ebx+64C];TWiimoteObject.?f64C:dword
 0062445E    mov         dword ptr [ebx+674],eax;TWiimoteObject.?f674:dword
 00624464    mov         byte ptr [ebx+6F9],1;TWiimoteObject.VarRightDotVis:Boolean
 0062446B    mov         byte ptr [ebx+6F8],0;TWiimoteObject.VarLeftDotVis:Boolean
>00624472    jmp         00624780
 00624477    cmp         eax,2
>0062447A    jne         006246CE
 00624480    movzx       eax,byte ptr [ebx+5DE];TWiimoteObject.?f5DE:byte
 00624487    test        al,al
>00624489    je          00624507
 0062448B    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>00624492    je          00624507
 00624494    mov         eax,dword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 0062449A    mov         dword ptr [ebx+658],eax;TWiimoteObject.VarLeftDotX:Double
 006244A0    mov         eax,dword ptr [ebx+644];TWiimoteObject.?f644:dword
 006244A6    mov         dword ptr [ebx+65C],eax;TWiimoteObject.?f65C:dword
 006244AC    mov         eax,dword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 006244B2    mov         dword ptr [ebx+660],eax;TWiimoteObject.VarLeftDotY:Double
 006244B8    mov         eax,dword ptr [ebx+64C];TWiimoteObject.?f64C:dword
 006244BE    mov         dword ptr [ebx+664],eax;TWiimoteObject.?f664:dword
 006244C4    mov         byte ptr [ebx+6F8],1;TWiimoteObject.VarLeftDotVis:Boolean
 006244CB    mov         eax,dword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006244D1    mov         dword ptr [ebx+668],eax;TWiimoteObject.VarRightDotX:Double
 006244D7    mov         eax,dword ptr [ebx+634];TWiimoteObject.?f634:dword
 006244DD    mov         dword ptr [ebx+66C],eax;TWiimoteObject.?f66C:dword
 006244E3    mov         eax,dword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006244E9    mov         dword ptr [ebx+670],eax;TWiimoteObject.VarRightDotY:Double
 006244EF    mov         eax,dword ptr [ebx+63C];TWiimoteObject.?f63C:dword
 006244F5    mov         dword ptr [ebx+674],eax;TWiimoteObject.?f674:dword
 006244FB    mov         byte ptr [ebx+6F9],1;TWiimoteObject.VarRightDotVis:Boolean
>00624502    jmp         00624780
 00624507    test        al,al
>00624509    je          00624658
 0062450F    fld         qword ptr [ebx+658];TWiimoteObject.VarLeftDotX:Double
 00624515    fsub        qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 0062451B    add         esp,0FFFFFFF8
 0062451E    fstp        qword ptr [esp]
 00624521    wait
 00624522    fld         qword ptr [ebx+660];TWiimoteObject.VarLeftDotY:Double
 00624528    fsub        qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 0062452E    add         esp,0FFFFFFF8
 00624531    fstp        qword ptr [esp]
 00624534    wait
 00624535    push        0
 00624537    push        0
 00624539    call        005C4070
 0062453E    fstp        qword ptr [esp+18]
 00624542    wait
 00624543    fld         qword ptr [ebx+668];TWiimoteObject.VarRightDotX:Double
 00624549    fsub        qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 0062454F    add         esp,0FFFFFFF8
 00624552    fstp        qword ptr [esp]
 00624555    wait
 00624556    fld         qword ptr [ebx+670];TWiimoteObject.VarRightDotY:Double
 0062455C    fsub        qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 00624562    add         esp,0FFFFFFF8
 00624565    fstp        qword ptr [esp]
 00624568    wait
 00624569    push        0
 0062456B    push        0
 0062456D    call        005C4070
 00624572    fcomp       qword ptr [esp+18]
 00624576    wait
 00624577    fnstsw      al
 00624579    sahf
>0062457A    jb          006245EF
 0062457C    mov         dword ptr [ebx+650],1;TWiimoteObject.VarLeftDot:Integer
 00624586    mov         eax,dword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 0062458C    mov         dword ptr [ebx+658],eax;TWiimoteObject.VarLeftDotX:Double
 00624592    mov         eax,dword ptr [ebx+634];TWiimoteObject.?f634:dword
 00624598    mov         dword ptr [ebx+65C],eax;TWiimoteObject.?f65C:dword
 0062459E    mov         eax,dword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006245A4    mov         dword ptr [ebx+660],eax;TWiimoteObject.VarLeftDotY:Double
 006245AA    mov         eax,dword ptr [ebx+63C];TWiimoteObject.?f63C:dword
 006245B0    mov         dword ptr [ebx+664],eax;TWiimoteObject.?f664:dword
 006245B6    fld         qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006245BC    fadd        qword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 006245C2    fstp        qword ptr [ebx+668];TWiimoteObject.VarRightDotX:Double
 006245C8    wait
 006245C9    fld         qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006245CF    fadd        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 006245D5    fstp        qword ptr [ebx+670];TWiimoteObject.VarRightDotY:Double
 006245DB    wait
 006245DC    mov         byte ptr [ebx+6F8],1;TWiimoteObject.VarLeftDotVis:Boolean
 006245E3    mov         byte ptr [ebx+6F9],0;TWiimoteObject.VarRightDotVis:Boolean
>006245EA    jmp         00624780
 006245EF    fld         qword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006245F5    fsub        qword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 006245FB    fstp        qword ptr [ebx+658];TWiimoteObject.VarLeftDotX:Double
 00624601    wait
 00624602    fld         qword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 00624608    fsub        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 0062460E    fstp        qword ptr [ebx+660];TWiimoteObject.VarLeftDotY:Double
 00624614    wait
 00624615    mov         eax,dword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 0062461B    mov         dword ptr [ebx+668],eax;TWiimoteObject.VarRightDotX:Double
 00624621    mov         eax,dword ptr [ebx+634];TWiimoteObject.?f634:dword
 00624627    mov         dword ptr [ebx+66C],eax;TWiimoteObject.?f66C:dword
 0062462D    mov         eax,dword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 00624633    mov         dword ptr [ebx+670],eax;TWiimoteObject.VarRightDotY:Double
 00624639    mov         eax,dword ptr [ebx+63C];TWiimoteObject.?f63C:dword
 0062463F    mov         dword ptr [ebx+674],eax;TWiimoteObject.?f674:dword
 00624645    mov         byte ptr [ebx+6F9],1;TWiimoteObject.VarRightDotVis:Boolean
 0062464C    mov         byte ptr [ebx+6F8],0;TWiimoteObject.VarLeftDotVis:Boolean
>00624653    jmp         00624780
 00624658    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>0062465F    je          00624780
 00624665    fld         qword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 0062466B    fadd        qword ptr [ebx+6A8];TWiimoteObject.VarDotDeltaX:Double
 00624671    fstp        qword ptr [ebx+668];TWiimoteObject.VarRightDotX:Double
 00624677    wait
 00624678    fld         qword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 0062467E    fadd        qword ptr [ebx+6B0];TWiimoteObject.VarDotDeltaY:Double
 00624684    fstp        qword ptr [ebx+670];TWiimoteObject.VarRightDotY:Double
 0062468A    wait
 0062468B    mov         eax,dword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 00624691    mov         dword ptr [ebx+658],eax;TWiimoteObject.VarLeftDotX:Double
 00624697    mov         eax,dword ptr [ebx+644];TWiimoteObject.?f644:dword
 0062469D    mov         dword ptr [ebx+65C],eax;TWiimoteObject.?f65C:dword
 006246A3    mov         eax,dword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 006246A9    mov         dword ptr [ebx+660],eax;TWiimoteObject.VarLeftDotY:Double
 006246AF    mov         eax,dword ptr [ebx+64C];TWiimoteObject.?f64C:dword
 006246B5    mov         dword ptr [ebx+664],eax;TWiimoteObject.?f664:dword
 006246BB    mov         byte ptr [ebx+6F8],1;TWiimoteObject.VarLeftDotVis:Boolean
 006246C2    mov         byte ptr [ebx+6F9],0;TWiimoteObject.VarRightDotVis:Boolean
>006246C9    jmp         00624780
 006246CE    cmp         byte ptr [ebx+5DE],0;TWiimoteObject.?f5DE:byte
>006246D5    je          00624709
 006246D7    mov         eax,dword ptr [ebx+630];TWiimoteObject.VarDot1x:Double
 006246DD    mov         dword ptr [ebx+658],eax;TWiimoteObject.VarLeftDotX:Double
 006246E3    mov         eax,dword ptr [ebx+634];TWiimoteObject.?f634:dword
 006246E9    mov         dword ptr [ebx+65C],eax;TWiimoteObject.?f65C:dword
 006246EF    mov         eax,dword ptr [ebx+638];TWiimoteObject.VarDot1y:Double
 006246F5    mov         dword ptr [ebx+660],eax;TWiimoteObject.VarLeftDotY:Double
 006246FB    mov         eax,dword ptr [ebx+63C];TWiimoteObject.?f63C:dword
 00624701    mov         dword ptr [ebx+664],eax;TWiimoteObject.?f664:dword
>00624707    jmp         00624742
 00624709    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>00624710    je          00624742
 00624712    mov         eax,dword ptr [ebx+640];TWiimoteObject.VarDot2x:Double
 00624718    mov         dword ptr [ebx+658],eax;TWiimoteObject.VarLeftDotX:Double
 0062471E    mov         eax,dword ptr [ebx+644];TWiimoteObject.?f644:dword
 00624724    mov         dword ptr [ebx+65C],eax;TWiimoteObject.?f65C:dword
 0062472A    mov         eax,dword ptr [ebx+648];TWiimoteObject.VarDot2y:Double
 00624730    mov         dword ptr [ebx+660],eax;TWiimoteObject.VarLeftDotY:Double
 00624736    mov         eax,dword ptr [ebx+64C];TWiimoteObject.?f64C:dword
 0062473C    mov         dword ptr [ebx+664],eax;TWiimoteObject.?f664:dword
 00624742    mov         eax,dword ptr [ebx+658];TWiimoteObject.VarLeftDotX:Double
 00624748    mov         dword ptr [ebx+668],eax;TWiimoteObject.VarRightDotX:Double
 0062474E    mov         eax,dword ptr [ebx+65C];TWiimoteObject.?f65C:dword
 00624754    mov         dword ptr [ebx+66C],eax;TWiimoteObject.?f66C:dword
 0062475A    mov         eax,dword ptr [ebx+660];TWiimoteObject.VarLeftDotY:Double
 00624760    mov         dword ptr [ebx+670],eax;TWiimoteObject.VarRightDotY:Double
 00624766    mov         eax,dword ptr [ebx+664];TWiimoteObject.?f664:dword
 0062476C    mov         dword ptr [ebx+674],eax;TWiimoteObject.?f674:dword
 00624772    mov         byte ptr [ebx+6F8],1;TWiimoteObject.VarLeftDotVis:Boolean
 00624779    mov         byte ptr [ebx+6F9],1;TWiimoteObject.VarRightDotVis:Boolean
 00624780    fld         qword ptr [ebx+658];TWiimoteObject.VarLeftDotX:Double
 00624786    fadd        qword ptr [ebx+668];TWiimoteObject.VarRightDotX:Double
 0062478C    fdiv        dword ptr ds:[624FEC];2:Single
 00624792    fstp        qword ptr [ebx+678];TWiimoteObject.VarMiddleDotX:Double
 00624798    wait
 00624799    fld         qword ptr [ebx+660];TWiimoteObject.VarLeftDotY:Double
 0062479F    fadd        qword ptr [ebx+670];TWiimoteObject.VarRightDotY:Double
 006247A5    fdiv        dword ptr ds:[624FEC];2:Single
 006247AB    fstp        qword ptr [ebx+680];TWiimoteObject.VarMiddleDotY:Double
 006247B1    wait
 006247B2    cmp         byte ptr [ebx+5DE],0;TWiimoteObject.?f5DE:byte
>006247B9    jne         006247C8
 006247BB    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>006247C2    jne         006247C8
 006247C4    xor         eax,eax
>006247C6    jmp         006247CA
 006247C8    mov         al,1
 006247CA    mov         byte ptr [ebx+6FA],al;TWiimoteObject.VarMiddleDotVis:Boolean
 006247D0    test        al,al
>006247D2    je          0062492F
 006247D8    fld         dword ptr ds:[624FF0];511.5:Single
 006247DE    fmul        qword ptr [ebx+680];TWiimoteObject.VarMiddleDotY:Double
 006247E4    add         esp,0FFFFFFF4
 006247E7    fstp        tbyte ptr [esp]
 006247EA    wait
 006247EB    push        4009
 006247F0    push        0A5000000
 006247F5    push        0
 006247F7    call        00454A8C
 006247FC    fstp        tbyte ptr [esp+20]
 00624800    wait
 00624801    push        dword ptr [ebx+364];TWiimoteObject.?f364:TRotMat
 00624807    push        dword ptr [ebx+360];TWiimoteObject.UpZ:Double
 0062480D    call        00454A5C
 00624812    fld         tbyte ptr [esp+20]
 00624816    faddp       st(1),st
 00624818    fstp        qword ptr [ebx+6C8];TWiimoteObject.VarTotalPitch:Double
 0062481E    wait
 0062481F    fld         dword ptr ds:[624FFC];-511.5:Single
 00624825    fmul        qword ptr [ebx+678];TWiimoteObject.VarMiddleDotX:Double
 0062482B    add         esp,0FFFFFFF4
 0062482E    fstp        tbyte ptr [esp]
 00624831    wait
 00624832    push        4009
 00624837    push        0A5000000
 0062483C    push        0
 0062483E    call        00454A8C
 00624843    fstp        qword ptr [ebx+6D0];TWiimoteObject.VarDotYaw:Double
 00624849    wait
 0062484A    fld         dword ptr ds:[624FF0];511.5:Single
 00624850    fmul        qword ptr [ebx+678];TWiimoteObject.VarMiddleDotX:Double
 00624856    add         esp,0FFFFFFF4
 00624859    fstp        tbyte ptr [esp]
 0062485C    wait
 0062485D    push        4009
 00624862    push        0A5000000
 00624867    push        0
 00624869    call        00454A8C
 0062486E    fstp        qword ptr [ebx+688];TWiimoteObject.varWiimoteYawNoX:Double
 00624874    wait
 00624875    fld         qword ptr [ebx+6D0];TWiimoteObject.VarDotYaw:Double
 0062487B    add         esp,0FFFFFFF4
 0062487E    fstp        tbyte ptr [esp]
 00624881    wait
 00624882    call        Sin
 00624887    fchs
 00624889    fmul        qword ptr [ebx+6C0];TWiimoteObject.VarIRDistance:Double
 0062488F    fstp        qword ptr [ebx+690];TWiimoteObject.varWiimoteXNoYaw:Double
 00624895    wait
 00624896    mov         eax,dword ptr [ebx+690];TWiimoteObject.varWiimoteXNoYaw:Double
 0062489C    mov         dword ptr [ebx+588],eax;TWiimoteObject.x:Double
 006248A2    mov         eax,dword ptr [ebx+694];TWiimoteObject.?f694:dword
 006248A8    mov         dword ptr [ebx+58C],eax;TWiimoteObject.?f58C:dword
 006248AE    fld         qword ptr [ebx+6C8];TWiimoteObject.VarTotalPitch:Double
 006248B4    add         esp,0FFFFFFF4
 006248B7    fstp        tbyte ptr [esp]
 006248BA    wait
 006248BB    call        Sin
 006248C0    fchs
 006248C2    fmul        qword ptr [ebx+6C0];TWiimoteObject.VarIRDistance:Double
 006248C8    fstp        qword ptr [ebx+698];TWiimoteObject.varWiimoteY:Double
 006248CE    wait
 006248CF    mov         eax,dword ptr [ebx+698];TWiimoteObject.varWiimoteY:Double
 006248D5    mov         dword ptr [ebx+590],eax;TWiimoteObject.y:Double
 006248DB    mov         eax,dword ptr [ebx+69C];TWiimoteObject.?f69C:dword
 006248E1    mov         dword ptr [ebx+594],eax;TWiimoteObject.?f594:dword
 006248E7    fld         qword ptr [ebx+6C0];TWiimoteObject.VarIRDistance:Double
 006248ED    fmul        st,st(0)
 006248EF    fstp        tbyte ptr [esp+20]
 006248F3    wait
 006248F4    fld         qword ptr [ebx+698];TWiimoteObject.varWiimoteY:Double
 006248FA    fmul        st,st(0)
 006248FC    fld         tbyte ptr [esp+20]
 00624900    fsubrp      st(1),st
 00624902    add         esp,0FFFFFFF4
 00624905    fstp        tbyte ptr [esp]
 00624908    wait
 00624909    call        Sqrt
 0062490E    fchs
 00624910    fstp        qword ptr [ebx+6A0];TWiimoteObject.varWiimoteZ:Double
 00624916    wait
 00624917    mov         eax,dword ptr [ebx+6A0];TWiimoteObject.varWiimoteZ:Double
 0062491D    mov         dword ptr [ebx+598],eax;TWiimoteObject.z:Double
 00624923    mov         eax,dword ptr [ebx+6A4];TWiimoteObject.?f6A4:dword
 00624929    mov         dword ptr [ebx+59C],eax;TWiimoteObject.?f59C:dword
 0062492F    fld         qword ptr ds:[78BD98]
 00624935    fmul        qword ptr [ebx+678];TWiimoteObject.VarMiddleDotX:Double
 0062493B    fdiv        dword ptr ds:[624FEC];2:Single
 00624941    fadd        dword ptr ds:[625000];0.5:Single
 00624947    fstp        qword ptr [esp+8]
 0062494B    wait
 0062494C    fld         qword ptr ds:[78BDA0]
 00624952    fmul        qword ptr [ebx+680];TWiimoteObject.VarMiddleDotY:Double
 00624958    fmul        dword ptr ds:[625004];1023:Single
 0062495E    fdiv        dword ptr ds:[625008];767:Single
 00624964    fdiv        dword ptr ds:[624FEC];2:Single
 0062496A    fadd        dword ptr ds:[625000];0.5:Single
 00624970    fstp        qword ptr [esp+10]
 00624974    wait
 00624975    fld         qword ptr [esp+8]
 00624979    fsub        qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 0062497F    fabs
 00624981    fstp        qword ptr [esp]
 00624984    wait
 00624985    mov         eax,dword ptr [esp]
 00624988    mov         dword ptr [ebx+6F0],eax;TWiimoteObject.varLen:Double
 0062498E    mov         eax,dword ptr [esp+4]
 00624992    mov         dword ptr [ebx+6F4],eax;TWiimoteObject.?f6F4:dword
 00624998    fld         tbyte ptr ds:[62500C];0.04:Extended
 0062499E    fcomp       qword ptr [esp]
 006249A1    wait
 006249A2    fnstsw      al
 006249A4    sahf
>006249A5    ja          006249BC
 006249A7    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 006249AD    mov         edx,1
 006249B2    call        0068BF2C
>006249B7    jmp         00624BDC
 006249BC    fld         tbyte ptr ds:[625018];0.03:Extended
 006249C2    fcomp       qword ptr [esp]
 006249C5    wait
 006249C6    fnstsw      al
 006249C8    sahf
>006249C9    ja          006249E0
 006249CB    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 006249D1    mov         edx,2
 006249D6    call        0068BF2C
>006249DB    jmp         00624BDC
 006249E0    fld         tbyte ptr ds:[625024];0.02:Extended
 006249E6    fcomp       qword ptr [esp]
 006249E9    wait
 006249EA    fnstsw      al
 006249EC    sahf
>006249ED    ja          00624A04
 006249EF    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 006249F5    mov         edx,3
 006249FA    call        0068BF2C
>006249FF    jmp         00624BDC
 00624A04    fld         tbyte ptr ds:[625030];0.01:Extended
 00624A0A    fcomp       qword ptr [esp]
 00624A0D    wait
 00624A0E    fnstsw      al
 00624A10    sahf
>00624A11    ja          00624A28
 00624A13    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624A19    mov         edx,4
 00624A1E    call        0068BF2C
>00624A23    jmp         00624BDC
 00624A28    fld         tbyte ptr ds:[62503C];0.009:Extended
 00624A2E    fcomp       qword ptr [esp]
 00624A31    wait
 00624A32    fnstsw      al
 00624A34    sahf
>00624A35    ja          00624A4C
 00624A37    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624A3D    mov         edx,5
 00624A42    call        0068BF2C
>00624A47    jmp         00624BDC
 00624A4C    fld         tbyte ptr ds:[625048];0.008:Extended
 00624A52    fcomp       qword ptr [esp]
 00624A55    wait
 00624A56    fnstsw      al
 00624A58    sahf
>00624A59    ja          00624A70
 00624A5B    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624A61    mov         edx,6
 00624A66    call        0068BF2C
>00624A6B    jmp         00624BDC
 00624A70    fld         tbyte ptr ds:[625054];0.007:Extended
 00624A76    fcomp       qword ptr [esp]
 00624A79    wait
 00624A7A    fnstsw      al
 00624A7C    sahf
>00624A7D    ja          00624A94
 00624A7F    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624A85    mov         edx,7
 00624A8A    call        0068BF2C
>00624A8F    jmp         00624BDC
 00624A94    fld         tbyte ptr ds:[625060];0.0068:Extended
 00624A9A    fcomp       qword ptr [esp]
 00624A9D    wait
 00624A9E    fnstsw      al
 00624AA0    sahf
>00624AA1    ja          00624AB8
 00624AA3    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624AA9    mov         edx,8
 00624AAE    call        0068BF2C
>00624AB3    jmp         00624BDC
 00624AB8    fld         tbyte ptr ds:[62506C];0.0065:Extended
 00624ABE    fcomp       qword ptr [esp]
 00624AC1    wait
 00624AC2    fnstsw      al
 00624AC4    sahf
>00624AC5    ja          00624ADC
 00624AC7    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624ACD    mov         edx,9
 00624AD2    call        0068BF2C
>00624AD7    jmp         00624BDC
 00624ADC    fld         tbyte ptr ds:[625078];0.006:Extended
 00624AE2    fcomp       qword ptr [esp]
 00624AE5    wait
 00624AE6    fnstsw      al
 00624AE8    sahf
>00624AE9    ja          00624B00
 00624AEB    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624AF1    mov         edx,0A
 00624AF6    call        0068BF2C
>00624AFB    jmp         00624BDC
 00624B00    fld         tbyte ptr ds:[625084];0.0059:Extended
 00624B06    fcomp       qword ptr [esp]
 00624B09    wait
 00624B0A    fnstsw      al
 00624B0C    sahf
>00624B0D    ja          00624B24
 00624B0F    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624B15    mov         edx,0B
 00624B1A    call        0068BF2C
>00624B1F    jmp         00624BDC
 00624B24    fld         tbyte ptr ds:[625090];0.0058:Extended
 00624B2A    fcomp       qword ptr [esp]
 00624B2D    wait
 00624B2E    fnstsw      al
 00624B30    sahf
>00624B31    ja          00624B48
 00624B33    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624B39    mov         edx,0C
 00624B3E    call        0068BF2C
>00624B43    jmp         00624BDC
 00624B48    fld         tbyte ptr ds:[62509C];0.0055:Extended
 00624B4E    fcomp       qword ptr [esp]
 00624B51    wait
 00624B52    fnstsw      al
 00624B54    sahf
>00624B55    ja          00624B69
 00624B57    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624B5D    mov         edx,0D
 00624B62    call        0068BF2C
>00624B67    jmp         00624BDC
 00624B69    fld         tbyte ptr ds:[6250A8];0.005:Extended
 00624B6F    fcomp       qword ptr [esp]
 00624B72    wait
 00624B73    fnstsw      al
 00624B75    sahf
>00624B76    ja          00624B8A
 00624B78    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624B7E    mov         edx,0F
 00624B83    call        0068BF2C
>00624B88    jmp         00624BDC
 00624B8A    fld         tbyte ptr ds:[6250B4];0.004:Extended
 00624B90    fcomp       qword ptr [esp]
 00624B93    wait
 00624B94    fnstsw      al
 00624B96    sahf
>00624B97    ja          00624BAB
 00624B99    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624B9F    mov         edx,14
 00624BA4    call        0068BF2C
>00624BA9    jmp         00624BDC
 00624BAB    fld         tbyte ptr ds:[6250C0];0.003:Extended
 00624BB1    fcomp       qword ptr [esp]
 00624BB4    wait
 00624BB5    fnstsw      al
 00624BB7    sahf
>00624BB8    ja          00624BCC
 00624BBA    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624BC0    mov         edx,19
 00624BC5    call        0068BF2C
>00624BCA    jmp         00624BDC
 00624BCC    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624BD2    mov         edx,1E
 00624BD7    call        0068BF2C
 00624BDC    fld         qword ptr [esp+10]
 00624BE0    fsub        qword ptr [ebx+6E8];TWiimoteObject.varIRy:Double
 00624BE6    fabs
 00624BE8    fstp        qword ptr [esp]
 00624BEB    wait
 00624BEC    fld         tbyte ptr ds:[62500C];0.04:Extended
 00624BF2    fcomp       qword ptr [esp]
 00624BF5    wait
 00624BF6    fnstsw      al
 00624BF8    sahf
>00624BF9    ja          00624C10
 00624BFB    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624C01    mov         edx,1
 00624C06    call        0068BF2C
>00624C0B    jmp         00624E30
 00624C10    fld         tbyte ptr ds:[625018];0.03:Extended
 00624C16    fcomp       qword ptr [esp]
 00624C19    wait
 00624C1A    fnstsw      al
 00624C1C    sahf
>00624C1D    ja          00624C34
 00624C1F    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624C25    mov         edx,2
 00624C2A    call        0068BF2C
>00624C2F    jmp         00624E30
 00624C34    fld         tbyte ptr ds:[625024];0.02:Extended
 00624C3A    fcomp       qword ptr [esp]
 00624C3D    wait
 00624C3E    fnstsw      al
 00624C40    sahf
>00624C41    ja          00624C58
 00624C43    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624C49    mov         edx,3
 00624C4E    call        0068BF2C
>00624C53    jmp         00624E30
 00624C58    fld         tbyte ptr ds:[625030];0.01:Extended
 00624C5E    fcomp       qword ptr [esp]
 00624C61    wait
 00624C62    fnstsw      al
 00624C64    sahf
>00624C65    ja          00624C7C
 00624C67    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624C6D    mov         edx,4
 00624C72    call        0068BF2C
>00624C77    jmp         00624E30
 00624C7C    fld         tbyte ptr ds:[62503C];0.009:Extended
 00624C82    fcomp       qword ptr [esp]
 00624C85    wait
 00624C86    fnstsw      al
 00624C88    sahf
>00624C89    ja          00624CA0
 00624C8B    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624C91    mov         edx,5
 00624C96    call        0068BF2C
>00624C9B    jmp         00624E30
 00624CA0    fld         tbyte ptr ds:[625048];0.008:Extended
 00624CA6    fcomp       qword ptr [esp]
 00624CA9    wait
 00624CAA    fnstsw      al
 00624CAC    sahf
>00624CAD    ja          00624CC4
 00624CAF    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624CB5    mov         edx,6
 00624CBA    call        0068BF2C
>00624CBF    jmp         00624E30
 00624CC4    fld         tbyte ptr ds:[625054];0.007:Extended
 00624CCA    fcomp       qword ptr [esp]
 00624CCD    wait
 00624CCE    fnstsw      al
 00624CD0    sahf
>00624CD1    ja          00624CE8
 00624CD3    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624CD9    mov         edx,7
 00624CDE    call        0068BF2C
>00624CE3    jmp         00624E30
 00624CE8    fld         tbyte ptr ds:[625060];0.0068:Extended
 00624CEE    fcomp       qword ptr [esp]
 00624CF1    wait
 00624CF2    fnstsw      al
 00624CF4    sahf
>00624CF5    ja          00624D0C
 00624CF7    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624CFD    mov         edx,8
 00624D02    call        0068BF2C
>00624D07    jmp         00624E30
 00624D0C    fld         tbyte ptr ds:[62506C];0.0065:Extended
 00624D12    fcomp       qword ptr [esp]
 00624D15    wait
 00624D16    fnstsw      al
 00624D18    sahf
>00624D19    ja          00624D30
 00624D1B    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624D21    mov         edx,9
 00624D26    call        0068BF2C
>00624D2B    jmp         00624E30
 00624D30    fld         tbyte ptr ds:[625078];0.006:Extended
 00624D36    fcomp       qword ptr [esp]
 00624D39    wait
 00624D3A    fnstsw      al
 00624D3C    sahf
>00624D3D    ja          00624D54
 00624D3F    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624D45    mov         edx,0A
 00624D4A    call        0068BF2C
>00624D4F    jmp         00624E30
 00624D54    fld         tbyte ptr ds:[625084];0.0059:Extended
 00624D5A    fcomp       qword ptr [esp]
 00624D5D    wait
 00624D5E    fnstsw      al
 00624D60    sahf
>00624D61    ja          00624D78
 00624D63    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624D69    mov         edx,0B
 00624D6E    call        0068BF2C
>00624D73    jmp         00624E30
 00624D78    fld         tbyte ptr ds:[625090];0.0058:Extended
 00624D7E    fcomp       qword ptr [esp]
 00624D81    wait
 00624D82    fnstsw      al
 00624D84    sahf
>00624D85    ja          00624D9C
 00624D87    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624D8D    mov         edx,0C
 00624D92    call        0068BF2C
>00624D97    jmp         00624E30
 00624D9C    fld         tbyte ptr ds:[62509C];0.0055:Extended
 00624DA2    fcomp       qword ptr [esp]
 00624DA5    wait
 00624DA6    fnstsw      al
 00624DA8    sahf
>00624DA9    ja          00624DBD
 00624DAB    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624DB1    mov         edx,0D
 00624DB6    call        0068BF2C
>00624DBB    jmp         00624E30
 00624DBD    fld         tbyte ptr ds:[6250A8];0.005:Extended
 00624DC3    fcomp       qword ptr [esp]
 00624DC6    wait
 00624DC7    fnstsw      al
 00624DC9    sahf
>00624DCA    ja          00624DDE
 00624DCC    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624DD2    mov         edx,0F
 00624DD7    call        0068BF2C
>00624DDC    jmp         00624E30
 00624DDE    fld         tbyte ptr ds:[6250B4];0.004:Extended
 00624DE4    fcomp       qword ptr [esp]
 00624DE7    wait
 00624DE8    fnstsw      al
 00624DEA    sahf
>00624DEB    ja          00624DFF
 00624DED    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624DF3    mov         edx,14
 00624DF8    call        0068BF2C
>00624DFD    jmp         00624E30
 00624DFF    fld         tbyte ptr ds:[6250C0];0.003:Extended
 00624E05    fcomp       qword ptr [esp]
 00624E08    wait
 00624E09    fnstsw      al
 00624E0B    sahf
>00624E0C    ja          00624E20
 00624E0E    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624E14    mov         edx,19
 00624E19    call        0068BF2C
>00624E1E    jmp         00624E30
 00624E20    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624E26    mov         edx,1E
 00624E2B    call        0068BF2C
 00624E30    push        dword ptr [esp+0C]
 00624E34    push        dword ptr [esp+0C]
 00624E38    mov         edx,dword ptr ds:[78CB88];^gvar_0078BDC0
 00624E3E    mov         edx,dword ptr [edx]
 00624E40    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624E46    call        0068BF5C
 00624E4B    push        dword ptr [esp+14]
 00624E4F    push        dword ptr [esp+14]
 00624E53    mov         edx,dword ptr ds:[78CB88];^gvar_0078BDC0
 00624E59    mov         edx,dword ptr [edx]
 00624E5B    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624E61    call        0068BF5C
 00624E66    lea         eax,[ebx+708];TWiimoteObject.IRXSmoother:TSmoother
 00624E6C    call        0068B968
 00624E71    fstp        qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 00624E77    wait
 00624E78    lea         eax,[ebx+810];TWiimoteObject.IRYSmoother:TSmoother
 00624E7E    call        0068B968
 00624E83    fstp        qword ptr [ebx+6E8];TWiimoteObject.varIRy:Double
 00624E89    wait
 00624E8A    cmp         byte ptr [ebx+5DE],0;TWiimoteObject.?f5DE:byte
>00624E91    jne         00624EA0
 00624E93    cmp         byte ptr [ebx+5EA],0;TWiimoteObject.?f5EA:byte
>00624E9A    jne         00624EA0
 00624E9C    xor         eax,eax
>00624E9E    jmp         00624EA2
 00624EA0    mov         al,1
 00624EA2    mov         byte ptr [ebx+6FB],al;TWiimoteObject.VarIRvis:Boolean
 00624EA8    fld         qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 00624EAE    fcomp       dword ptr ds:[624FE8];0:Single
 00624EB4    wait
 00624EB5    fnstsw      al
 00624EB7    sahf
>00624EB8    jb          00624EF0
 00624EBA    fld         qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 00624EC0    fcomp       dword ptr ds:[6250CC];1:Single
 00624EC6    wait
 00624EC7    fnstsw      al
 00624EC9    sahf
>00624ECA    ja          00624EF0
 00624ECC    fld         qword ptr [ebx+6E8];TWiimoteObject.varIRy:Double
 00624ED2    fcomp       dword ptr ds:[624FE8];0:Single
 00624ED8    wait
 00624ED9    fnstsw      al
 00624EDB    sahf
>00624EDC    jb          00624EF0
 00624EDE    fld         qword ptr [ebx+6E8];TWiimoteObject.varIRy:Double
 00624EE4    fcomp       dword ptr ds:[6250CC];1:Single
 00624EEA    wait
 00624EEB    fnstsw      al
 00624EED    sahf
>00624EEE    jbe         00624EF4
 00624EF0    xor         eax,eax
>00624EF2    jmp         00624EF6
 00624EF4    mov         al,1
 00624EF6    mov         byte ptr [ebx+6FC],al;TWiimoteObject.VarIROnScreen:Boolean
 00624EFC    fld         qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 00624F02    fcomp       dword ptr ds:[624FE8];0:Single
 00624F08    wait
 00624F09    fnstsw      al
 00624F0B    sahf
>00624F0C    jb          00624F2D
 00624F0E    fld         qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 00624F14    fcomp       dword ptr ds:[6250D0];0.25:Single
 00624F1A    wait
 00624F1B    fnstsw      al
 00624F1D    sahf
>00624F1E    jae         00624F29
 00624F20    cmp         byte ptr [ebx+6FB],0;TWiimoteObject.VarIRvis:Boolean
>00624F27    je          00624F2D
 00624F29    xor         eax,eax
>00624F2B    jmp         00624F2F
 00624F2D    mov         al,1
 00624F2F    mov         byte ptr [ebx+6FD],al;TWiimoteObject.varIRTooFarLeft:Boolean
 00624F35    fld         qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 00624F3B    fcomp       dword ptr ds:[6250CC];1:Single
 00624F41    wait
 00624F42    fnstsw      al
 00624F44    sahf
>00624F45    ja          00624F66
 00624F47    fld         qword ptr [ebx+6E0];TWiimoteObject.varIRx:Double
 00624F4D    fcomp       dword ptr ds:[6250D4];0.75:Single
 00624F53    wait
 00624F54    fnstsw      al
 00624F56    sahf
>00624F57    jbe         00624F62
 00624F59    cmp         byte ptr [ebx+6FB],0;TWiimoteObject.VarIRvis:Boolean
>00624F60    je          00624F66
 00624F62    xor         eax,eax
>00624F64    jmp         00624F68
 00624F66    mov         al,1
 00624F68    mov         byte ptr [ebx+6FE],al;TWiimoteObject.varIRTooFarRight:Boolean
 00624F6E    fld         qword ptr [ebx+6D8];TWiimoteObject.varIRPitchY:Double
 00624F74    fcomp       dword ptr ds:[624FE8];0:Single
 00624F7A    wait
 00624F7B    fnstsw      al
 00624F7D    sahf
>00624F7E    jb          00624F9F
 00624F80    fld         tbyte ptr ds:[6250D8];0.1:Extended
 00624F86    fcomp       qword ptr [ebx+6E8];TWiimoteObject.varIRy:Double
 00624F8C    wait
 00624F8D    fnstsw      al
 00624F8F    sahf
>00624F90    jbe         00624F9B
 00624F92    cmp         byte ptr [ebx+6FB],0;TWiimoteObject.VarIRvis:Boolean
>00624F99    je          00624F9F
 00624F9B    xor         eax,eax
>00624F9D    jmp         00624FA1
 00624F9F    mov         al,1
 00624FA1    mov         byte ptr [ebx+6FF],al;TWiimoteObject.varIRTooFarUp:Boolean
 00624FA7    fld         qword ptr [ebx+6D8];TWiimoteObject.varIRPitchY:Double
 00624FAD    fcomp       dword ptr ds:[6250CC];1:Single
 00624FB3    wait
 00624FB4    fnstsw      al
 00624FB6    sahf
>00624FB7    ja          00624FD8
 00624FB9    fld         tbyte ptr ds:[6250E4];0.9:Extended
 00624FBF    fcomp       qword ptr [ebx+6E8];TWiimoteObject.varIRy:Double
 00624FC5    wait
 00624FC6    fnstsw      al
 00624FC8    sahf
>00624FC9    jae         00624FD4
 00624FCB    cmp         byte ptr [ebx+6FB],0;TWiimoteObject.VarIRvis:Boolean
>00624FD2    je          00624FD8
 00624FD4    xor         eax,eax
>00624FD6    jmp         00624FDA
 00624FD8    mov         al,1
 00624FDA    mov         byte ptr [ebx+700],al;TWiimoteObject.varIRTooFarDown:Boolean
 00624FE0    add         esp,2C
 00624FE3    pop         ebx
 00624FE4    ret
*}
end;

//006250F0
procedure TWiimoteObject.UpdateSpeakerThread;
begin
{*
 006250F0    push        ebx
 006250F1    mov         ebx,eax
 006250F3    mov         eax,ebx
 006250F5    call        TWiimoteObject.StopSpeaker
 006250FA    mov         eax,ebx
 006250FC    call        TWiimoteObject.StartSpeaker
 00625101    pop         ebx
 00625102    ret
*}
end;

//00625104
function TWiimoteObject.UpPrev:Boolean;
begin
{*
 00625104    test        eax,eax
>00625106    je          00625113
 00625108    test        word ptr [eax+582],800;TWiimoteObject.OldButtons:word
>00625111    ja          00625116
 00625113    xor         eax,eax
 00625115    ret
 00625116    mov         al,1
 00625118    ret
*}
end;

//0062511C
function TWiimoteObject.WirelessNunchuk:Boolean;
begin
{*
 0062511C    cmp         byte ptr [eax+4AA],0;TWiimoteObject.ThirdParty:Boolean
>00625123    je          0062512E
 00625125    cmp         byte ptr [eax+4A2],2;TWiimoteObject.Expansion:byte
>0062512C    je          00625131
 0062512E    xor         eax,eax
 00625130    ret
 00625131    mov         al,1
 00625133    ret
*}
end;

//00625134
function TNunchukObject.C:Boolean;
begin
{*
 00625134    test        eax,eax
>00625136    jne         0062513B
 00625138    xor         eax,eax
 0062513A    ret
 0062513B    mov         edx,dword ptr [eax+440];TNunchukObject.Wiimote:TWiimoteObject
 00625141    mov         ecx,dword ptr [edx+4B8];TWiimoteObject.Classic:TClassicObject
 00625147    cmp         byte ptr [ecx+8],0;TClassicObject.Exists:Boolean
>0062514B    je          0062515F
 0062514D    cmp         dword ptr [edx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625154    jle         0062515F
 00625156    mov         eax,ecx
 00625158    call        TClassicObject.B
>0062515D    jmp         00625166
 0062515F    movzx       eax,byte ptr [eax+458];TNunchukObject.ButtonC:Boolean
 00625166    ret
*}
end;

//00625168
procedure TNunchukObject.Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00625168    push        ebx
 00625169    push        esi
 0062516A    push        edi
 0062516B    add         esp,0FFFFFFE4
 0062516E    mov         ebx,ecx
 00625170    mov         esi,edx
 00625172    mov         edi,eax
 00625174    mov         byte ptr [edi+444],1;TNunchukObject.Exists:Boolean
 0062517B    mov         dword ptr [edi+2D8],9999999A;TNunchukObject.tolerance:Double
 00625185    mov         dword ptr [edi+2DC],3FA99999;TNunchukObject.?f2DC:dword
 0062518F    mov         byte ptr [edi+446],1;TNunchukObject.Calibrated:Boolean
 00625196    mov         edx,ebx
 00625198    movzx       eax,byte ptr [esi+5]
 0062519C    call        0061F8EC
 006251A1    movzx       eax,al
 006251A4    mov         dword ptr [esp+18],eax
 006251A8    fild        dword ptr [esp+18]
 006251AC    fstp        qword ptr [edi+2A8];TNunchukObject.cx1:Double
 006251B2    wait
 006251B3    mov         edx,ebx
 006251B5    movzx       eax,byte ptr [esi+6]
 006251B9    call        0061F8EC
 006251BE    movzx       eax,al
 006251C1    mov         dword ptr [esp+18],eax
 006251C5    fild        dword ptr [esp+18]
 006251C9    fstp        qword ptr [edi+2C8];TNunchukObject.cz1:Double
 006251CF    wait
 006251D0    mov         edx,ebx
 006251D2    movzx       eax,byte ptr [esi+7]
 006251D6    call        0061F8EC
 006251DB    movzx       eax,al
 006251DE    mov         dword ptr [esp+18],eax
 006251E2    fild        dword ptr [esp+18]
 006251E6    fstp        qword ptr [edi+2B8];TNunchukObject.cy1:Double
 006251EC    wait
 006251ED    mov         edx,ebx
 006251EF    movzx       eax,byte ptr [esi+9]
 006251F3    call        0061F8EC
 006251F8    movzx       eax,al
 006251FB    mov         dword ptr [esp+18],eax
 006251FF    fild        dword ptr [esp+18]
 00625203    fstp        qword ptr [edi+2B0];TNunchukObject.cx2:Double
 00625209    wait
 0062520A    mov         edx,ebx
 0062520C    movzx       eax,byte ptr [esi+0A]
 00625210    call        0061F8EC
 00625215    movzx       eax,al
 00625218    mov         dword ptr [esp+18],eax
 0062521C    fild        dword ptr [esp+18]
 00625220    fstp        qword ptr [edi+2D0];TNunchukObject.cz2:Double
 00625226    wait
 00625227    mov         edx,ebx
 00625229    movzx       eax,byte ptr [esi+0B]
 0062522D    call        0061F8EC
 00625232    movzx       eax,al
 00625235    mov         dword ptr [esp+18],eax
 00625239    fild        dword ptr [esp+18]
 0062523D    fstp        qword ptr [edi+2C0];TNunchukObject.cy2:Double
 00625243    wait
 00625244    mov         eax,dword ptr [edi+2A8];TNunchukObject.cx1:Double
 0062524A    mov         dword ptr [esp],eax
 0062524D    mov         eax,dword ptr [edi+2AC];TNunchukObject.?f2AC:dword
 00625253    mov         dword ptr [esp+4],eax
 00625257    fld         dword ptr ds:[62547C];127:Single
 0062525D    fsub        qword ptr [esp]
 00625260    fstp        qword ptr [edi+278];TNunchukObject.cyx:Double
 00625266    wait
 00625267    mov         eax,dword ptr [edi+278];TNunchukObject.cyx:Double
 0062526D    mov         dword ptr [edi+290],eax;TNunchukObject.czx:Double
 00625273    mov         eax,dword ptr [edi+27C];TNunchukObject.?f27C:dword
 00625279    mov         dword ptr [edi+294],eax;TNunchukObject.?f294:dword
 0062527F    mov         eax,dword ptr [edi+278];TNunchukObject.cyx:Double
 00625285    mov         dword ptr [edi+300],eax;TNunchukObject.RawZeroForceX:Double
 0062528B    mov         eax,dword ptr [edi+27C];TNunchukObject.?f27C:dword
 00625291    mov         dword ptr [edi+304],eax;TNunchukObject.?f304:dword
 00625297    mov         eax,dword ptr [edi+2C8];TNunchukObject.cz1:Double
 0062529D    mov         dword ptr [esp+10],eax
 006252A1    mov         eax,dword ptr [edi+2CC];TNunchukObject.?f2CC:dword
 006252A7    mov         dword ptr [esp+14],eax
 006252AB    fld         dword ptr ds:[62547C];127:Single
 006252B1    fsub        qword ptr [esp+10]
 006252B5    fstp        qword ptr [edi+270];TNunchukObject.cxz:Double
 006252BB    wait
 006252BC    mov         eax,dword ptr [edi+270];TNunchukObject.cxz:Double
 006252C2    mov         dword ptr [edi+288],eax;TNunchukObject.cyz:Double
 006252C8    mov         eax,dword ptr [edi+274];TNunchukObject.?f274:dword
 006252CE    mov         dword ptr [edi+28C],eax;TNunchukObject.?f28C:dword
 006252D4    mov         eax,dword ptr [edi+270];TNunchukObject.cxz:Double
 006252DA    mov         dword ptr [edi+310],eax;TNunchukObject.RawZeroForceZ:Double
 006252E0    mov         eax,dword ptr [edi+274];TNunchukObject.?f274:dword
 006252E6    mov         dword ptr [edi+314],eax;TNunchukObject.?f314:dword
 006252EC    mov         eax,dword ptr [edi+2B8];TNunchukObject.cy1:Double
 006252F2    mov         dword ptr [esp+8],eax
 006252F6    mov         eax,dword ptr [edi+2BC];TNunchukObject.?f2BC:dword
 006252FC    mov         dword ptr [esp+0C],eax
 00625300    fld         qword ptr [esp+8]
 00625304    fsub        dword ptr ds:[625480];130:Single
 0062530A    fstp        qword ptr [edi+268];TNunchukObject.cxy:Double
 00625310    wait
 00625311    mov         eax,dword ptr [edi+268];TNunchukObject.cxy:Double
 00625317    mov         dword ptr [edi+298],eax;TNunchukObject.czy:Double
 0062531D    mov         eax,dword ptr [edi+26C];TNunchukObject.?f26C:dword
 00625323    mov         dword ptr [edi+29C],eax;TNunchukObject.?f29C:dword
 00625329    mov         eax,dword ptr [edi+268];TNunchukObject.cxy:Double
 0062532F    mov         dword ptr [edi+308],eax;TNunchukObject.RawZeroForceY:Double
 00625335    mov         eax,dword ptr [edi+26C];TNunchukObject.?f26C:dword
 0062533B    mov         dword ptr [edi+30C],eax;TNunchukObject.?f30C:dword
 00625341    fld         qword ptr [edi+2B0];TNunchukObject.cx2:Double
 00625347    fsub        qword ptr [edi+2A8];TNunchukObject.cx1:Double
 0062534D    fstp        qword ptr [edi+318];TNunchukObject.RawForcePerGX:Double
 00625353    wait
 00625354    fld         qword ptr [edi+2D0];TNunchukObject.cz2:Double
 0062535A    fsub        qword ptr [edi+2C8];TNunchukObject.cz1:Double
 00625360    fstp        qword ptr [edi+328];TNunchukObject.RawForcePerGZ:Double
 00625366    wait
 00625367    fld         qword ptr [edi+2C0];TNunchukObject.cy2:Double
 0062536D    fsub        qword ptr [edi+2B8];TNunchukObject.cy1:Double
 00625373    fstp        qword ptr [edi+320];TNunchukObject.RawForcePerGY:Double
 00625379    wait
 0062537A    fld         qword ptr [edi+300];TNunchukObject.RawZeroForceX:Double
 00625380    fadd        qword ptr [edi+318];TNunchukObject.RawForcePerGX:Double
 00625386    fstp        qword ptr [edi+260];TNunchukObject.cxx:Double
 0062538C    wait
 0062538D    fld         qword ptr [edi+310];TNunchukObject.RawZeroForceZ:Double
 00625393    fadd        qword ptr [edi+328];TNunchukObject.RawForcePerGZ:Double
 00625399    fstp        qword ptr [edi+2A0];TNunchukObject.czz:Double
 0062539F    wait
 006253A0    fld         qword ptr [edi+308];TNunchukObject.RawZeroForceY:Double
 006253A6    fadd        qword ptr [edi+320];TNunchukObject.RawForcePerGY:Double
 006253AC    fstp        qword ptr [edi+280];TNunchukObject.cyy:Double
 006253B2    wait
 006253B3    mov         edx,ebx
 006253B5    movzx       eax,byte ptr [esi+0D]
 006253B9    call        0061F8EC
 006253BE    movzx       eax,al
 006253C1    mov         word ptr [edi+450],ax;TNunchukObject.JoyMaxX:SmallInt
 006253C8    mov         edx,ebx
 006253CA    movzx       eax,byte ptr [esi+0E]
 006253CE    call        0061F8EC
 006253D3    movzx       eax,al
 006253D6    mov         word ptr [edi+454],ax;TNunchukObject.JoyMinX:SmallInt
 006253DD    mov         edx,ebx
 006253DF    movzx       eax,byte ptr [esi+0F]
 006253E3    call        0061F8EC
 006253E8    movzx       eax,al
 006253EB    mov         word ptr [edi+44C],ax;TNunchukObject.JoyZeroX:SmallInt
 006253F2    mov         edx,ebx
 006253F4    movzx       eax,byte ptr [esi+10]
 006253F8    call        0061F8EC
 006253FD    movzx       eax,al
 00625400    mov         word ptr [edi+452],ax;TNunchukObject.JoyMaxY:SmallInt
 00625407    mov         edx,ebx
 00625409    movzx       eax,byte ptr [esi+11]
 0062540D    call        0061F8EC
 00625412    movzx       eax,al
 00625415    mov         word ptr [edi+456],ax;TNunchukObject.JoyMinY:SmallInt
 0062541C    mov         edx,ebx
 0062541E    movzx       eax,byte ptr [esi+12]
 00625422    call        0061F8EC
 00625427    movzx       eax,al
 0062542A    mov         word ptr [edi+44E],ax;TNunchukObject.JoyZeroY:SmallInt
 00625431    movzx       eax,word ptr [edi+44C];TNunchukObject.JoyZeroX:SmallInt
 00625438    cmp         ax,word ptr [edi+450];TNunchukObject.JoyMaxX:SmallInt
>0062543F    jge         0062546A
 00625441    cmp         ax,word ptr [edi+454];TNunchukObject.JoyMinX:SmallInt
>00625448    jle         0062546A
 0062544A    movzx       eax,word ptr [edi+452];TNunchukObject.JoyMaxY:SmallInt
 00625451    cmp         ax,word ptr [edi+44E];TNunchukObject.JoyZeroY:SmallInt
>00625458    jle         0062546A
 0062545A    movzx       eax,word ptr [edi+456];TNunchukObject.JoyMinY:SmallInt
 00625461    cmp         ax,word ptr [edi+44E];TNunchukObject.JoyZeroY:SmallInt
>00625468    jl          00625473
 0062546A    xor         edx,edx
 0062546C    mov         eax,edi
 0062546E    call        TNunchukObject.SetCalibrated
 00625473    add         esp,1C
 00625476    pop         edi
 00625477    pop         esi
 00625478    pop         ebx
 00625479    ret
*}
end;

//00625484
function TNunchukObject.Classic:Boolean;
begin
{*
 00625484    push        ebx
 00625485    push        esi
 00625486    mov         ebx,eax
 00625488    test        ebx,ebx
>0062548A    jne         00625491
 0062548C    xor         eax,eax
 0062548E    pop         esi
 0062548F    pop         ebx
 00625490    ret
 00625491    mov         esi,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625497    cmp         dword ptr [esi+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>0062549E    jle         006254CF
 006254A0    fld         qword ptr [esi+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 006254A6    fcomp       dword ptr ds:[6254D8];0:Single
 006254AC    wait
 006254AD    fnstsw      al
 006254AF    sahf
>006254B0    jbe         006254CF
 006254B2    call        00600EA0
 006254B7    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 006254BD    fsub        qword ptr [eax+4E0];TWiimoteObject.BladeFXDisconnectTime:Double
 006254C3    fcomp       dword ptr ds:[6254DC];4:Single
 006254C9    wait
 006254CA    fnstsw      al
 006254CC    sahf
>006254CD    jbe         006254D3
 006254CF    xor         eax,eax
>006254D1    jmp         006254D5
 006254D3    mov         al,1
 006254D5    pop         esi
 006254D6    pop         ebx
 006254D7    ret
*}
end;

//006254E0
procedure TNunchukObject.Clear;
begin
{*
 006254E0    mov         byte ptr [eax+444],0;TNunchukObject.Exists:Boolean
 006254E7    mov         byte ptr [eax+446],0;TNunchukObject.Calibrated:Boolean
 006254EE    ret
*}
end;

//006254F0
function TNunchukObject.CPrev:Boolean;
begin
{*
 006254F0    test        eax,eax
>006254F2    jne         006254F7
 006254F4    xor         eax,eax
 006254F6    ret
 006254F7    mov         edx,dword ptr [eax+440];TNunchukObject.Wiimote:TWiimoteObject
 006254FD    mov         ecx,dword ptr [edx+4B8];TWiimoteObject.Classic:TClassicObject
 00625503    cmp         byte ptr [ecx+8],0;TClassicObject.Exists:Boolean
>00625507    je          0062551B
 00625509    cmp         dword ptr [edx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625510    jle         0062551B
 00625512    mov         eax,ecx
 00625514    call        TClassicObject.BPrev
>00625519    jmp         00625522
 0062551B    movzx       eax,byte ptr [eax+45A];TNunchukObject.ButtonCPrev:Boolean
 00625522    ret
*}
end;

//00625524
constructor TNunchukObject.Create(Wiimote:TObject);
begin
{*
 00625524    push        ebx
 00625525    push        esi
 00625526    push        edi
 00625527    test        dl,dl
>00625529    je          00625533
 0062552B    add         esp,0FFFFFFF0
 0062552E    call        @ClassCreate
 00625533    mov         esi,ecx
 00625535    mov         ebx,edx
 00625537    mov         edi,eax
 00625539    push        0
 0062553B    xor         ecx,ecx
 0062553D    xor         edx,edx
 0062553F    mov         eax,edi
 00625541    call        00648E90
 00625546    mov         dword ptr [edi+440],esi;TNunchukObject.Wiimote:TWiimoteObject
 0062554C    mov         eax,edi
 0062554E    call        TNunchukObject.Clear
 00625553    mov         eax,edi
 00625555    test        bl,bl
>00625557    je          00625568
 00625559    call        @AfterConstruction
 0062555E    pop         dword ptr fs:[0]
 00625565    add         esp,0C
 00625568    mov         eax,edi
 0062556A    pop         edi
 0062556B    pop         esi
 0062556C    pop         ebx
 0062556D    ret
*}
end;

//00625570
function TNunchukObject.Down:Boolean;
begin
{*
 00625570    push        ebx
 00625571    push        esi
 00625572    mov         ebx,eax
 00625574    test        ebx,ebx
>00625576    jne         0062557D
 00625578    xor         eax,eax
 0062557A    pop         esi
 0062557B    pop         ebx
 0062557C    ret
 0062557D    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625583    mov         esi,dword ptr [eax+4B8];TWiimoteObject.Classic:TClassicObject
 00625589    cmp         byte ptr [esi+8],0;TClassicObject.Exists:Boolean
>0062558D    je          006255B0
 0062558F    cmp         dword ptr [eax+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625596    jle         006255B0
 00625598    mov         eax,esi
 0062559A    call        TClassicObject.LeftStickY
 0062559F    fld         tbyte ptr ds:[62560C];0.3:Extended
 006255A5    fcompp
 006255A7    wait
 006255A8    fnstsw      al
 006255AA    sahf
 006255AB    setb        al
>006255AE    jmp         00625608
 006255B0    cmp         byte ptr [ebx+430],0;TNunchukObject.LookingAtWatch:Boolean
>006255B7    je          006255D1
 006255B9    mov         eax,ebx
 006255BB    call        TNunchukObject.StickX
 006255C0    fld         tbyte ptr ds:[62560C];0.3:Extended
 006255C6    fcompp
 006255C8    wait
 006255C9    fnstsw      al
 006255CB    sahf
 006255CC    setb        al
>006255CF    jmp         00625608
 006255D1    cmp         byte ptr [ebx+431],0;TNunchukObject.LookingAtWatchRH:Boolean
>006255D8    je          006255F2
 006255DA    mov         eax,ebx
 006255DC    call        TNunchukObject.StickX
 006255E1    fld         tbyte ptr ds:[625618];-0.3:Extended
 006255E7    fcompp
 006255E9    wait
 006255EA    fnstsw      al
 006255EC    sahf
 006255ED    seta        al
>006255F0    jmp         00625608
 006255F2    mov         eax,ebx
 006255F4    call        TNunchukObject.StickY
 006255F9    fld         tbyte ptr ds:[62560C];0.3:Extended
 006255FF    fcompp
 00625601    wait
 00625602    fnstsw      al
 00625604    sahf
 00625605    setb        al
 00625608    pop         esi
 00625609    pop         ebx
 0062560A    ret
*}
end;

//00625624
function TNunchukObject.FX:Boolean;
begin
{*
 00625624    push        ebx
 00625625    push        esi
 00625626    mov         ebx,eax
 00625628    mov         esi,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 0062562E    cmp         dword ptr [esi+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625635    jle         00625646
 00625637    mov         eax,dword ptr [esi+4B8];TWiimoteObject.Classic:TClassicObject
 0062563D    call        TClassicObject.Plus
 00625642    test        al,al
>00625644    jne         0062564B
 00625646    xor         eax,eax
 00625648    pop         esi
 00625649    pop         ebx
 0062564A    ret
 0062564B    mov         al,1
 0062564D    pop         esi
 0062564E    pop         ebx
 0062564F    ret
*}
end;

//00625650
function TNunchukObject.Left:Boolean;
begin
{*
 00625650    push        ebx
 00625651    push        esi
 00625652    mov         ebx,eax
 00625654    test        ebx,ebx
>00625656    jne         0062565D
 00625658    xor         eax,eax
 0062565A    pop         esi
 0062565B    pop         ebx
 0062565C    ret
 0062565D    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625663    mov         esi,dword ptr [eax+4B8];TWiimoteObject.Classic:TClassicObject
 00625669    cmp         byte ptr [esi+8],0;TClassicObject.Exists:Boolean
>0062566D    je          00625690
 0062566F    cmp         dword ptr [eax+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625676    jle         00625690
 00625678    mov         eax,esi
 0062567A    call        TClassicObject.LeftStickX
 0062567F    fld         tbyte ptr ds:[6256EC];-0.3:Extended
 00625685    fcompp
 00625687    wait
 00625688    fnstsw      al
 0062568A    sahf
 0062568B    seta        al
>0062568E    jmp         006256E8
 00625690    cmp         byte ptr [ebx+430],0;TNunchukObject.LookingAtWatch:Boolean
>00625697    je          006256B1
 00625699    mov         eax,ebx
 0062569B    call        TNunchukObject.StickY
 006256A0    fld         tbyte ptr ds:[6256F8];0.3:Extended
 006256A6    fcompp
 006256A8    wait
 006256A9    fnstsw      al
 006256AB    sahf
 006256AC    setb        al
>006256AF    jmp         006256E8
 006256B1    cmp         byte ptr [ebx+431],0;TNunchukObject.LookingAtWatchRH:Boolean
>006256B8    je          006256D2
 006256BA    mov         eax,ebx
 006256BC    call        TNunchukObject.StickY
 006256C1    fld         tbyte ptr ds:[6256EC];-0.3:Extended
 006256C7    fcompp
 006256C9    wait
 006256CA    fnstsw      al
 006256CC    sahf
 006256CD    seta        al
>006256D0    jmp         006256E8
 006256D2    mov         eax,ebx
 006256D4    call        TNunchukObject.StickX
 006256D9    fld         tbyte ptr ds:[6256EC];-0.3:Extended
 006256DF    fcompp
 006256E1    wait
 006256E2    fnstsw      al
 006256E4    sahf
 006256E5    seta        al
 006256E8    pop         esi
 006256E9    pop         ebx
 006256EA    ret
*}
end;

//00625704
procedure TNunchukObject.ReceiveExpansionData(ExpBytes:TExpBytes);
begin
{*
 00625704    push        ebx
 00625705    push        esi
 00625706    add         esp,0FFFFFFC8
 00625709    mov         esi,edx
 0062570B    mov         ebx,eax
 0062570D    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625713    call        TWiimoteObject.PerformNullUpdates
 00625718    cmp         byte ptr [ebx+445],0;TNunchukObject.PassThrough:Boolean
>0062571F    je          00625739
 00625721    test        byte ptr [esi+5],2
>00625725    jne         00625933
 0062572B    mov         edx,esi
 0062572D    mov         eax,ebx
 0062572F    call        TNunchukObject.ReceivePassThroughData
>00625734    jmp         00625933
 00625739    inc         dword ptr [ebx+45C];TNunchukObject.ReportCount:Integer
 0062573F    movzx       eax,byte ptr [ebx+458];TNunchukObject.ButtonC:Boolean
 00625746    mov         byte ptr [ebx+45A],al;TNunchukObject.ButtonCPrev:Boolean
 0062574C    movzx       eax,byte ptr [ebx+459];TNunchukObject.ButtonZ:Boolean
 00625753    mov         byte ptr [ebx+45B],al;TNunchukObject.ButtonZPrev:Boolean
 00625759    movzx       eax,byte ptr [esi]
 0062575C    mov         word ptr [ebx+448],ax;TNunchukObject.JoyX:SmallInt
 00625763    movzx       eax,byte ptr [esi+1]
 00625767    mov         word ptr [ebx+44A],ax;TNunchukObject.JoyY:SmallInt
 0062576E    cmp         byte ptr [ebx+446],0;TNunchukObject.Calibrated:Boolean
>00625775    jne         00625807
 0062577B    cmp         word ptr [ebx+44C],0;TNunchukObject.JoyZeroX:SmallInt
>00625783    jne         006257AB
 00625785    cmp         word ptr [ebx+44E],0;TNunchukObject.JoyZeroY:SmallInt
>0062578D    jne         006257AB
 0062578F    movzx       eax,word ptr [ebx+448];TNunchukObject.JoyX:SmallInt
 00625796    mov         word ptr [ebx+44C],ax;TNunchukObject.JoyZeroX:SmallInt
 0062579D    movzx       eax,word ptr [ebx+44A];TNunchukObject.JoyY:SmallInt
 006257A4    mov         word ptr [ebx+44E],ax;TNunchukObject.JoyZeroY:SmallInt
 006257AB    movzx       eax,word ptr [ebx+448];TNunchukObject.JoyX:SmallInt
 006257B2    cmp         ax,word ptr [ebx+454];TNunchukObject.JoyMinX:SmallInt
>006257B9    jge         006257C2
 006257BB    mov         word ptr [ebx+454],ax;TNunchukObject.JoyMinX:SmallInt
 006257C2    movzx       eax,word ptr [ebx+448];TNunchukObject.JoyX:SmallInt
 006257C9    cmp         ax,word ptr [ebx+450];TNunchukObject.JoyMaxX:SmallInt
>006257D0    jle         006257D9
 006257D2    mov         word ptr [ebx+450],ax;TNunchukObject.JoyMaxX:SmallInt
 006257D9    movzx       eax,word ptr [ebx+44A];TNunchukObject.JoyY:SmallInt
 006257E0    cmp         ax,word ptr [ebx+456];TNunchukObject.JoyMinY:SmallInt
>006257E7    jge         006257F0
 006257E9    mov         word ptr [ebx+456],ax;TNunchukObject.JoyMinY:SmallInt
 006257F0    movzx       eax,word ptr [ebx+44A];TNunchukObject.JoyY:SmallInt
 006257F7    cmp         ax,word ptr [ebx+452];TNunchukObject.JoyMaxY:SmallInt
>006257FE    jle         00625807
 00625800    mov         word ptr [ebx+452],ax;TNunchukObject.JoyMaxY:SmallInt
 00625807    movzx       edx,byte ptr [esi+2]
 0062580B    mov         dword ptr [esp+30],edx
 0062580F    fild        dword ptr [esp+30]
 00625813    movzx       eax,byte ptr [esi+5]
 00625817    mov         edx,eax
 00625819    shr         edx,2
 0062581C    and         edx,3
 0062581F    mov         dword ptr [esp+34],edx
 00625823    fild        dword ptr [esp+34]
 00625827    fdiv        dword ptr ds:[62593C];4:Single
 0062582D    faddp       st(1),st
 0062582F    fstp        qword ptr [esp]
 00625832    wait
 00625833    movzx       edx,byte ptr [esi+3]
 00625837    mov         dword ptr [esp+30],edx
 0062583B    fild        dword ptr [esp+30]
 0062583F    mov         edx,eax
 00625841    shr         edx,4
 00625844    and         edx,3
 00625847    mov         dword ptr [esp+34],edx
 0062584B    fild        dword ptr [esp+34]
 0062584F    fdiv        dword ptr ds:[62593C];4:Single
 00625855    faddp       st(1),st
 00625857    fstp        qword ptr [esp+10]
 0062585B    wait
 0062585C    movzx       edx,byte ptr [esi+4]
 00625860    mov         dword ptr [esp+30],edx
 00625864    fild        dword ptr [esp+30]
 00625868    shr         eax,6
 0062586B    and         eax,3
 0062586E    mov         dword ptr [esp+34],eax
 00625872    fild        dword ptr [esp+34]
 00625876    fdiv        dword ptr ds:[62593C];4:Single
 0062587C    faddp       st(1),st
 0062587E    fstp        qword ptr [esp+8]
 00625882    wait
 00625883    mov         eax,dword ptr [esp]
 00625886    mov         dword ptr [ebx+2E8],eax;TNunchukObject.rx:Double
 0062588C    mov         eax,dword ptr [esp+4]
 00625890    mov         dword ptr [ebx+2EC],eax;TNunchukObject.?f2EC:dword
 00625896    mov         eax,dword ptr [esp+10]
 0062589A    mov         dword ptr [ebx+2F8],eax;TNunchukObject.rz:Double
 006258A0    mov         eax,dword ptr [esp+14]
 006258A4    mov         dword ptr [ebx+2FC],eax;TNunchukObject.?f2FC:dword
 006258AA    mov         eax,dword ptr [esp+8]
 006258AE    mov         dword ptr [ebx+2F0],eax;TNunchukObject.ry:Double
 006258B4    mov         eax,dword ptr [esp+0C]
 006258B8    mov         dword ptr [ebx+2F4],eax;TNunchukObject.?f2F4:dword
 006258BE    fld         dword ptr ds:[625940];127:Single
 006258C4    fsub        qword ptr [esp]
 006258C7    fstp        qword ptr [esp+18]
 006258CB    wait
 006258CC    fld         dword ptr ds:[625940];127:Single
 006258D2    fsub        qword ptr [esp+10]
 006258D6    fstp        qword ptr [esp+28]
 006258DA    wait
 006258DB    fld         qword ptr [esp+8]
 006258DF    fsub        dword ptr ds:[625944];130:Single
 006258E5    fstp        qword ptr [esp+20]
 006258E9    wait
 006258EA    push        dword ptr [esp+1C]
 006258EE    push        dword ptr [esp+1C]
 006258F2    push        dword ptr [esp+2C]
 006258F6    push        dword ptr [esp+2C]
 006258FA    push        dword ptr [esp+3C]
 006258FE    push        dword ptr [esp+3C]
 00625902    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625908    push        dword ptr [eax+0C];TWiimoteObject.?fC:dword
 0062590B    push        dword ptr [eax+8];TWiimoteObject.ReportTime:Double
 0062590E    mov         eax,ebx
 00625910    call        TAccelerometerObject.UpdateForces
 00625915    test        byte ptr [esi+5],1
 00625919    seta        al
 0062591C    xor         al,1
 0062591E    mov         byte ptr [ebx+459],al;TNunchukObject.ButtonZ:Boolean
 00625924    test        byte ptr [esi+5],2
 00625928    seta        al
 0062592B    xor         al,1
 0062592D    mov         byte ptr [ebx+458],al;TNunchukObject.ButtonC:Boolean
 00625933    add         esp,38
 00625936    pop         esi
 00625937    pop         ebx
 00625938    ret
*}
end;

//00625948
procedure TNunchukObject.ReceivePassThroughData(ExpBytes:TExpBytes);
begin
{*
 00625948    push        ebx
 00625949    push        esi
 0062594A    add         esp,0FFFFFFC8
 0062594D    mov         esi,edx
 0062594F    mov         ebx,eax
 00625951    mov         edx,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625957    movzx       eax,byte ptr [edx+4AC];TWiimoteObject.MotionPlusHasExpansion:Boolean
 0062595E    test        byte ptr [esi+4],1
 00625962    setne       cl
 00625965    mov         byte ptr [edx+4AC],cl;TWiimoteObject.MotionPlusHasExpansion:Boolean
 0062596B    test        al,al
>0062596D    je          0062598B
 0062596F    mov         edx,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625975    cmp         byte ptr [edx+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>0062597C    jne         0062598B
 0062597E    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625984    call        00623F5C
>00625989    jmp         006259A5
 0062598B    mov         edx,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625991    cmp         byte ptr [edx+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>00625998    je          006259A5
 0062599A    test        al,al
>0062599C    jne         006259A5
 0062599E    mov         eax,edx
 006259A0    call        006207EC
 006259A5    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 006259AB    cmp         byte ptr [eax+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>006259B2    je          00625B67
 006259B8    inc         dword ptr [ebx+45C];TNunchukObject.ReportCount:Integer
 006259BE    movzx       eax,byte ptr [ebx+458];TNunchukObject.ButtonC:Boolean
 006259C5    mov         byte ptr [ebx+45A],al;TNunchukObject.ButtonCPrev:Boolean
 006259CB    movzx       eax,byte ptr [ebx+459];TNunchukObject.ButtonZ:Boolean
 006259D2    mov         byte ptr [ebx+45B],al;TNunchukObject.ButtonZPrev:Boolean
 006259D8    movzx       eax,byte ptr [esi]
 006259DB    mov         word ptr [ebx+448],ax;TNunchukObject.JoyX:SmallInt
 006259E2    movzx       eax,byte ptr [esi+1]
 006259E6    mov         word ptr [ebx+44A],ax;TNunchukObject.JoyY:SmallInt
 006259ED    cmp         word ptr [ebx+44C],0;TNunchukObject.JoyZeroX:SmallInt
>006259F5    jne         00625A35
 006259F7    cmp         word ptr [ebx+44E],0;TNunchukObject.JoyZeroY:SmallInt
>006259FF    jne         00625A35
 00625A01    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625A07    mov         eax,dword ptr [eax+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00625A0D    movzx       eax,word ptr [eax+448];TNunchukObject.JoyX:SmallInt
 00625A14    mov         word ptr [ebx+44C],ax;TNunchukObject.JoyZeroX:SmallInt
 00625A1B    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625A21    mov         eax,dword ptr [eax+4B4];TWiimoteObject.Nunchuk:TNunchukObject
 00625A27    movzx       eax,word ptr [eax+44A];TNunchukObject.JoyY:SmallInt
 00625A2E    mov         word ptr [ebx+44E],ax;TNunchukObject.JoyZeroY:SmallInt
 00625A35    movzx       edx,byte ptr [esi+2]
 00625A39    mov         dword ptr [esp+30],edx
 00625A3D    fild        dword ptr [esp+30]
 00625A41    movzx       eax,byte ptr [esi+5]
 00625A45    mov         edx,eax
 00625A47    shr         edx,4
 00625A4A    and         edx,1
 00625A4D    mov         dword ptr [esp+34],edx
 00625A51    fild        dword ptr [esp+34]
 00625A55    fdiv        dword ptr ds:[625B70];2:Single
 00625A5B    faddp       st(1),st
 00625A5D    fstp        qword ptr [esp]
 00625A60    wait
 00625A61    movzx       edx,byte ptr [esi+3]
 00625A65    mov         dword ptr [esp+30],edx
 00625A69    fild        dword ptr [esp+30]
 00625A6D    mov         edx,eax
 00625A6F    shr         edx,5
 00625A72    and         edx,1
 00625A75    mov         dword ptr [esp+34],edx
 00625A79    fild        dword ptr [esp+34]
 00625A7D    fdiv        dword ptr ds:[625B70];2:Single
 00625A83    faddp       st(1),st
 00625A85    fstp        qword ptr [esp+10]
 00625A89    wait
 00625A8A    movzx       edx,byte ptr [esi+4]
 00625A8E    and         dl,0FE
 00625A91    movzx       edx,dl
 00625A94    mov         dword ptr [esp+30],edx
 00625A98    fild        dword ptr [esp+30]
 00625A9C    shr         eax,6
 00625A9F    and         eax,3
 00625AA2    mov         dword ptr [esp+34],eax
 00625AA6    fild        dword ptr [esp+34]
 00625AAA    fdiv        dword ptr ds:[625B70];2:Single
 00625AB0    faddp       st(1),st
 00625AB2    fstp        qword ptr [esp+8]
 00625AB6    wait
 00625AB7    mov         eax,dword ptr [esp]
 00625ABA    mov         dword ptr [ebx+2E8],eax;TNunchukObject.rx:Double
 00625AC0    mov         eax,dword ptr [esp+4]
 00625AC4    mov         dword ptr [ebx+2EC],eax;TNunchukObject.?f2EC:dword
 00625ACA    mov         eax,dword ptr [esp+10]
 00625ACE    mov         dword ptr [ebx+2F8],eax;TNunchukObject.rz:Double
 00625AD4    mov         eax,dword ptr [esp+14]
 00625AD8    mov         dword ptr [ebx+2FC],eax;TNunchukObject.?f2FC:dword
 00625ADE    mov         eax,dword ptr [esp+8]
 00625AE2    mov         dword ptr [ebx+2F0],eax;TNunchukObject.ry:Double
 00625AE8    mov         eax,dword ptr [esp+0C]
 00625AEC    mov         dword ptr [ebx+2F4],eax;TNunchukObject.?f2F4:dword
 00625AF2    fld         dword ptr ds:[625B74];127:Single
 00625AF8    fsub        qword ptr [esp]
 00625AFB    fstp        qword ptr [esp+18]
 00625AFF    wait
 00625B00    fld         dword ptr ds:[625B74];127:Single
 00625B06    fsub        qword ptr [esp+10]
 00625B0A    fstp        qword ptr [esp+28]
 00625B0E    wait
 00625B0F    fld         qword ptr [esp+8]
 00625B13    fsub        dword ptr ds:[625B78];130:Single
 00625B19    fstp        qword ptr [esp+20]
 00625B1D    wait
 00625B1E    push        dword ptr [esp+1C]
 00625B22    push        dword ptr [esp+1C]
 00625B26    push        dword ptr [esp+2C]
 00625B2A    push        dword ptr [esp+2C]
 00625B2E    push        dword ptr [esp+3C]
 00625B32    push        dword ptr [esp+3C]
 00625B36    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625B3C    push        dword ptr [eax+0C];TWiimoteObject.?fC:dword
 00625B3F    push        dword ptr [eax+8];TWiimoteObject.ReportTime:Double
 00625B42    mov         eax,ebx
 00625B44    call        TAccelerometerObject.UpdateForces
 00625B49    test        byte ptr [esi+5],4
 00625B4D    seta        al
 00625B50    xor         al,1
 00625B52    mov         byte ptr [ebx+459],al;TNunchukObject.ButtonZ:Boolean
 00625B58    test        byte ptr [esi+5],8
 00625B5C    seta        al
 00625B5F    xor         al,1
 00625B61    mov         byte ptr [ebx+458],al;TNunchukObject.ButtonC:Boolean
 00625B67    add         esp,38
 00625B6A    pop         esi
 00625B6B    pop         ebx
 00625B6C    ret
*}
end;

//00625B7C
function TNunchukObject.Right:Boolean;
begin
{*
 00625B7C    push        ebx
 00625B7D    push        esi
 00625B7E    mov         ebx,eax
 00625B80    test        ebx,ebx
>00625B82    jne         00625B89
 00625B84    xor         eax,eax
 00625B86    pop         esi
 00625B87    pop         ebx
 00625B88    ret
 00625B89    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00625B8F    mov         esi,dword ptr [eax+4B8];TWiimoteObject.Classic:TClassicObject
 00625B95    cmp         byte ptr [esi+8],0;TClassicObject.Exists:Boolean
>00625B99    je          00625BBC
 00625B9B    cmp         dword ptr [eax+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625BA2    jle         00625BBC
 00625BA4    mov         eax,esi
 00625BA6    call        TClassicObject.LeftStickX
 00625BAB    fld         tbyte ptr ds:[625C18];0.3:Extended
 00625BB1    fcompp
 00625BB3    wait
 00625BB4    fnstsw      al
 00625BB6    sahf
 00625BB7    setb        al
>00625BBA    jmp         00625C14
 00625BBC    cmp         byte ptr [ebx+430],0;TNunchukObject.LookingAtWatch:Boolean
>00625BC3    je          00625BDD
 00625BC5    mov         eax,ebx
 00625BC7    call        TNunchukObject.StickY
 00625BCC    fld         tbyte ptr ds:[625C24];-0.3:Extended
 00625BD2    fcompp
 00625BD4    wait
 00625BD5    fnstsw      al
 00625BD7    sahf
 00625BD8    seta        al
>00625BDB    jmp         00625C14
 00625BDD    cmp         byte ptr [ebx+431],0;TNunchukObject.LookingAtWatchRH:Boolean
>00625BE4    je          00625BFE
 00625BE6    mov         eax,ebx
 00625BE8    call        TNunchukObject.StickY
 00625BED    fld         tbyte ptr ds:[625C18];0.3:Extended
 00625BF3    fcompp
 00625BF5    wait
 00625BF6    fnstsw      al
 00625BF8    sahf
 00625BF9    setb        al
>00625BFC    jmp         00625C14
 00625BFE    mov         eax,ebx
 00625C00    call        TNunchukObject.StickX
 00625C05    fld         tbyte ptr ds:[625C18];0.3:Extended
 00625C0B    fcompp
 00625C0D    wait
 00625C0E    fnstsw      al
 00625C10    sahf
 00625C11    setb        al
 00625C14    pop         esi
 00625C15    pop         ebx
 00625C16    ret
*}
end;

//00625C30
procedure TNunchukObject.SetCalibrated(c:Boolean);
begin
{*
 00625C30    cmp         dl,byte ptr [eax+446];TNunchukObject.Calibrated:Boolean
>00625C36    je          00625C78
 00625C38    test        dl,dl
>00625C3A    jne         00625C72
 00625C3C    mov         word ptr [eax+44C],0;TNunchukObject.JoyZeroX:SmallInt
 00625C45    mov         word ptr [eax+44E],0;TNunchukObject.JoyZeroY:SmallInt
 00625C4E    mov         word ptr [eax+454],40;TNunchukObject.JoyMinX:SmallInt
 00625C57    mov         word ptr [eax+450],0C0;TNunchukObject.JoyMaxX:SmallInt
 00625C60    mov         word ptr [eax+456],40;TNunchukObject.JoyMinY:SmallInt
 00625C69    mov         word ptr [eax+452],0C0;TNunchukObject.JoyMaxY:SmallInt
 00625C72    mov         byte ptr [eax+446],dl;TNunchukObject.Calibrated:Boolean
 00625C78    ret
*}
end;

//00625C7C
function TNunchukObject.Stick3DX:Double;
begin
{*
 00625C7C    push        ebx
 00625C7D    add         esp,0FFFFFFEC
 00625C80    mov         ebx,eax
 00625C82    mov         eax,ebx
 00625C84    call        TNunchukObject.StickX
 00625C89    fmul        qword ptr [ebx+370];TNunchukObject.RotMat:TRotMat
 00625C8F    fstp        tbyte ptr [esp+8]
 00625C93    wait
 00625C94    mov         eax,ebx
 00625C96    call        TNunchukObject.StickY
 00625C9B    fmul        qword ptr [ebx+3A0];TNunchukObject.RotMat:TRotMat
 00625CA1    fld         tbyte ptr [esp+8]
 00625CA5    fsubrp      st(1),st
 00625CA7    fstp        qword ptr [esp]
 00625CAA    wait
 00625CAB    fld         qword ptr [esp]
 00625CAE    add         esp,14
 00625CB1    pop         ebx
 00625CB2    ret
*}
end;

//00625CB4
procedure TNunchukObject.Stick3DY;
begin
{*
 00625CB4    push        ebx
 00625CB5    add         esp,0FFFFFFEC
 00625CB8    mov         ebx,eax
 00625CBA    mov         eax,ebx
 00625CBC    call        TNunchukObject.StickX
 00625CC1    fmul        qword ptr [ebx+378];TNunchukObject.RotMat:TRotMat
 00625CC7    fstp        tbyte ptr [esp+8]
 00625CCB    wait
 00625CCC    mov         eax,ebx
 00625CCE    call        TNunchukObject.StickY
 00625CD3    fmul        qword ptr [ebx+3A8];TNunchukObject.RotMat:TRotMat
 00625CD9    fld         tbyte ptr [esp+8]
 00625CDD    fsubrp      st(1),st
 00625CDF    fstp        qword ptr [esp]
 00625CE2    wait
 00625CE3    fld         qword ptr [esp]
 00625CE6    add         esp,14
 00625CE9    pop         ebx
 00625CEA    ret
*}
end;

//00625CEC
procedure TNunchukObject.Stick3DZ;
begin
{*
 00625CEC    push        ebx
 00625CED    add         esp,0FFFFFFEC
 00625CF0    mov         ebx,eax
 00625CF2    mov         eax,ebx
 00625CF4    call        TNunchukObject.StickX
 00625CF9    fmul        qword ptr [ebx+380];TNunchukObject.RotMat:TRotMat
 00625CFF    fstp        tbyte ptr [esp+8]
 00625D03    wait
 00625D04    mov         eax,ebx
 00625D06    call        TNunchukObject.StickY
 00625D0B    fmul        qword ptr [ebx+3B0];TNunchukObject.RotMat:TRotMat
 00625D11    fld         tbyte ptr [esp+8]
 00625D15    fsubrp      st(1),st
 00625D17    fstp        qword ptr [esp]
 00625D1A    wait
 00625D1B    fld         qword ptr [esp]
 00625D1E    add         esp,14
 00625D21    pop         ebx
 00625D22    ret
*}
end;

//00625D24
function TNunchukObject.StickX:Double;
begin
{*
 00625D24    push        ebx
 00625D25    add         esp,0FFFFFFF0
 00625D28    test        eax,eax
>00625D2A    jne         00625D3A
 00625D2C    xor         eax,eax
 00625D2E    mov         dword ptr [esp],eax
 00625D31    mov         dword ptr [esp+4],eax
>00625D35    jmp         00625DF8
 00625D3A    mov         edx,dword ptr [eax+440];TNunchukObject.Wiimote:TWiimoteObject
 00625D40    mov         ecx,dword ptr [edx+4B8];TWiimoteObject.Classic:TClassicObject
 00625D46    cmp         byte ptr [ecx+8],0;TClassicObject.Exists:Boolean
>00625D4A    je          00625D65
 00625D4C    cmp         dword ptr [edx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625D53    jle         00625D65
 00625D55    mov         eax,ecx
 00625D57    call        TClassicObject.LeftStickX
 00625D5C    fstp        qword ptr [esp]
 00625D5F    wait
>00625D60    jmp         00625DF8
 00625D65    movzx       edx,word ptr [eax+44C];TNunchukObject.JoyZeroX:SmallInt
 00625D6C    test        dx,dx
>00625D6F    je          00625D91
 00625D71    movsx       ecx,word ptr [eax+450];TNunchukObject.JoyMaxX:SmallInt
 00625D78    movsx       ebx,dx
 00625D7B    sub         ecx,ebx
 00625D7D    test        ecx,ecx
>00625D7F    jle         00625D91
 00625D81    movsx       ecx,dx
 00625D84    movsx       ebx,word ptr [eax+454];TNunchukObject.JoyMinX:SmallInt
 00625D8B    sub         ecx,ebx
 00625D8D    test        ecx,ecx
>00625D8F    jg          00625D9C
 00625D91    xor         eax,eax
 00625D93    mov         dword ptr [esp],eax
 00625D96    mov         dword ptr [esp+4],eax
>00625D9A    jmp         00625DF8
 00625D9C    movzx       ecx,word ptr [eax+448];TNunchukObject.JoyX:SmallInt
 00625DA3    cmp         dx,cx
>00625DA6    jge         00625DD1
 00625DA8    movsx       ecx,cx
 00625DAB    movsx       ebx,dx
 00625DAE    sub         ecx,ebx
 00625DB0    mov         dword ptr [esp+8],ecx
 00625DB4    fild        dword ptr [esp+8]
 00625DB8    movsx       edx,word ptr [eax+450];TNunchukObject.JoyMaxX:SmallInt
 00625DBF    sub         edx,ebx
 00625DC1    mov         dword ptr [esp+0C],edx
 00625DC5    fild        dword ptr [esp+0C]
 00625DC9    fdivp       st(1),st
 00625DCB    fstp        qword ptr [esp]
 00625DCE    wait
>00625DCF    jmp         00625DF8
 00625DD1    movsx       ecx,cx
 00625DD4    movsx       ebx,dx
 00625DD7    sub         ecx,ebx
 00625DD9    mov         dword ptr [esp+8],ecx
 00625DDD    fild        dword ptr [esp+8]
 00625DE1    movsx       eax,word ptr [eax+454];TNunchukObject.JoyMinX:SmallInt
 00625DE8    sub         ebx,eax
 00625DEA    mov         dword ptr [esp+0C],ebx
 00625DEE    fild        dword ptr [esp+0C]
 00625DF2    fdivp       st(1),st
 00625DF4    fstp        qword ptr [esp]
 00625DF7    wait
 00625DF8    fld         qword ptr [esp]
 00625DFB    add         esp,10
 00625DFE    pop         ebx
 00625DFF    ret
*}
end;

//00625E00
function TNunchukObject.StickY:Double;
begin
{*
 00625E00    push        ebx
 00625E01    add         esp,0FFFFFFF0
 00625E04    test        eax,eax
>00625E06    jne         00625E16
 00625E08    xor         eax,eax
 00625E0A    mov         dword ptr [esp],eax
 00625E0D    mov         dword ptr [esp+4],eax
>00625E11    jmp         00625ED4
 00625E16    mov         edx,dword ptr [eax+440];TNunchukObject.Wiimote:TWiimoteObject
 00625E1C    mov         ecx,dword ptr [edx+4B8];TWiimoteObject.Classic:TClassicObject
 00625E22    cmp         byte ptr [ecx+8],0;TClassicObject.Exists:Boolean
>00625E26    je          00625E41
 00625E28    cmp         dword ptr [edx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00625E2F    jle         00625E41
 00625E31    mov         eax,ecx
 00625E33    call        TClassicObject.LeftStickY
 00625E38    fstp        qword ptr [esp]
 00625E3B    wait
>00625E3C    jmp         00625ED4
 00625E41    movzx       edx,word ptr [eax+44E];TNunchukObject.JoyZeroY:SmallInt
 00625E48    test        dx,dx
>00625E4B    je          00625E69
 00625E4D    movsx       ecx,word ptr [eax+452];TNunchukObject.JoyMaxY:SmallInt
 00625E54    movsx       ebx,dx
 00625E57    sub         ecx,ebx
>00625E59    je          00625E69
 00625E5B    movsx       ecx,dx
 00625E5E    movsx       ebx,word ptr [eax+456];TNunchukObject.JoyMinY:SmallInt
 00625E65    sub         ecx,ebx
>00625E67    jne         00625E74
 00625E69    xor         eax,eax
 00625E6B    mov         dword ptr [esp],eax
 00625E6E    mov         dword ptr [esp+4],eax
>00625E72    jmp         00625ED4
 00625E74    movzx       ecx,word ptr [eax+44A];TNunchukObject.JoyY:SmallInt
 00625E7B    cmp         dx,cx
>00625E7E    jge         00625EAB
 00625E80    movsx       ebx,dx
 00625E83    mov         edx,ebx
 00625E85    movsx       ecx,cx
 00625E88    sub         edx,ecx
 00625E8A    mov         dword ptr [esp+8],edx
 00625E8E    fild        dword ptr [esp+8]
 00625E92    movsx       edx,word ptr [eax+452];TNunchukObject.JoyMaxY:SmallInt
 00625E99    sub         edx,ebx
 00625E9B    mov         dword ptr [esp+0C],edx
 00625E9F    fild        dword ptr [esp+0C]
 00625EA3    fdivp       st(1),st
 00625EA5    fstp        qword ptr [esp]
 00625EA8    wait
>00625EA9    jmp         00625ED4
 00625EAB    movsx       ebx,dx
 00625EAE    mov         edx,ebx
 00625EB0    movsx       ecx,cx
 00625EB3    sub         edx,ecx
 00625EB5    mov         dword ptr [esp+8],edx
 00625EB9    fild        dword ptr [esp+8]
 00625EBD    movsx       eax,word ptr [eax+456];TNunchukObject.JoyMinY:SmallInt
 00625EC4    sub         ebx,eax
 00625EC6    mov         dword ptr [esp+0C],ebx
 00625ECA    fild        dword ptr [esp+0C]
 00625ECE    fdivp       st(1),st
 00625ED0    fstp        qword ptr [esp]
 00625ED3    wait
 00625ED4    fld         qword ptr [esp]
 00625ED7    add         esp,10
 00625EDA    pop         ebx
 00625EDB    ret
*}
end;

//00625EDC
procedure TNunchukObject.SwingVertically;
begin
{*
 00625EDC    push        ebx
 00625EDD    add         esp,0FFFFFFAC
 00625EE0    mov         ebx,eax
 00625EE2    mov         edx,0F
 00625EE7    mov         eax,dword ptr [ebx+408];TNunchukObject.RelAccAverager:TAverager
 00625EED    call        TAverager.GetAvg
 00625EF2    fcomp       dword ptr ds:[62604C];10:Single
 00625EF8    wait
 00625EF9    fnstsw      al
 00625EFB    sahf
>00625EFC    jbe         00626044
 00625F02    mov         edx,0F
 00625F07    mov         eax,dword ptr [ebx+40C];TNunchukObject.RelAccXAverager:TAverager
 00625F0D    call        TAverager.GetAvg
 00625F12    fstp        qword ptr [esp]
 00625F15    wait
 00625F16    mov         edx,0F
 00625F1B    mov         eax,dword ptr [ebx+410];TNunchukObject.RelAccYAverager:TAverager
 00625F21    call        TAverager.GetAvg
 00625F26    fstp        qword ptr [esp+8]
 00625F2A    wait
 00625F2B    mov         edx,0F
 00625F30    mov         eax,dword ptr [ebx+414];TNunchukObject.RelAccZAverager:TAverager
 00625F36    call        TAverager.GetAvg
 00625F3B    fstp        qword ptr [esp+10]
 00625F3F    wait
 00625F40    fld         qword ptr [esp+8]
 00625F44    fabs
 00625F46    fcomp       dword ptr ds:[626050];9:Single
 00625F4C    wait
 00625F4D    fnstsw      al
 00625F4F    sahf
>00625F50    jbe         00626040
 00625F56    fld         qword ptr [esp+8]
 00625F5A    fabs
 00625F5C    fstp        tbyte ptr [esp+18]
 00625F60    wait
 00625F61    fld         qword ptr [esp+10]
 00625F65    fabs
 00625F67    fld         tbyte ptr ds:[626054];1.6:Extended
 00625F6D    fmulp       st(1),st
 00625F6F    fld         tbyte ptr [esp+18]
 00625F73    fcompp
 00625F75    wait
 00625F76    fnstsw      al
 00625F78    sahf
>00625F79    jbe         00626038
 00625F7F    mov         edx,19
 00625F84    mov         eax,dword ptr [ebx+414];TNunchukObject.RelAccZAverager:TAverager
 00625F8A    call        TAverager.GetAvg
 00625F8F    fabs
 00625F91    fld         tbyte ptr ds:[626054];1.6:Extended
 00625F97    fmulp       st(1),st
 00625F99    fstp        tbyte ptr [esp+24]
 00625F9D    wait
 00625F9E    fld         qword ptr [esp+8]
 00625FA2    fabs
 00625FA4    fld         tbyte ptr [esp+24]
 00625FA8    fcompp
 00625FAA    wait
 00625FAB    fnstsw      al
 00625FAD    sahf
>00625FAE    jae         00626038
 00625FB4    mov         edx,5
 00625FB9    mov         eax,dword ptr [ebx+414];TNunchukObject.RelAccZAverager:TAverager
 00625FBF    call        TAverager.GetAvg
 00625FC4    fabs
 00625FC6    fld         tbyte ptr ds:[626060];1.4:Extended
 00625FCC    fmulp       st(1),st
 00625FCE    fstp        tbyte ptr [esp+30]
 00625FD2    wait
 00625FD3    fld         qword ptr [esp+8]
 00625FD7    fabs
 00625FD9    fld         tbyte ptr [esp+30]
 00625FDD    fcompp
 00625FDF    wait
 00625FE0    fnstsw      al
 00625FE2    sahf
>00625FE3    jae         00626038
 00625FE5    mov         edx,23
 00625FEA    mov         eax,dword ptr [ebx+414];TNunchukObject.RelAccZAverager:TAverager
 00625FF0    call        TAverager.GetAvg
 00625FF5    fabs
 00625FF7    fld         tbyte ptr ds:[626060];1.4:Extended
 00625FFD    fmulp       st(1),st
 00625FFF    fstp        tbyte ptr [esp+3C]
 00626003    wait
 00626004    fld         qword ptr [esp+8]
 00626008    fabs
 0062600A    fld         tbyte ptr [esp+3C]
 0062600E    fcompp
 00626010    wait
 00626011    fnstsw      al
 00626013    sahf
>00626014    jae         00626038
 00626016    fld         qword ptr [esp+8]
 0062601A    fabs
 0062601C    fstp        tbyte ptr [esp+48]
 00626020    wait
 00626021    fld         qword ptr [esp]
 00626024    fabs
 00626026    fmul        dword ptr ds:[62606C];2:Single
 0062602C    fld         tbyte ptr [esp+48]
 00626030    fcompp
 00626032    wait
 00626033    fnstsw      al
 00626035    sahf
>00626036    ja          0062603C
 00626038    xor         eax,eax
>0062603A    jmp         00626046
 0062603C    mov         al,1
>0062603E    jmp         00626046
 00626040    xor         eax,eax
>00626042    jmp         00626046
 00626044    xor         eax,eax
 00626046    add         esp,54
 00626049    pop         ebx
 0062604A    ret
*}
end;

//00626070
function TNunchukObject.Up:Boolean;
begin
{*
 00626070    push        ebx
 00626071    push        esi
 00626072    mov         ebx,eax
 00626074    test        ebx,ebx
>00626076    jne         0062607D
 00626078    xor         eax,eax
 0062607A    pop         esi
 0062607B    pop         ebx
 0062607C    ret
 0062607D    mov         eax,dword ptr [ebx+440];TNunchukObject.Wiimote:TWiimoteObject
 00626083    mov         esi,dword ptr [eax+4B8];TWiimoteObject.Classic:TClassicObject
 00626089    cmp         byte ptr [esi+8],0;TClassicObject.Exists:Boolean
>0062608D    je          006260B0
 0062608F    cmp         dword ptr [eax+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00626096    jle         006260B0
 00626098    mov         eax,esi
 0062609A    call        TClassicObject.LeftStickY
 0062609F    fld         tbyte ptr ds:[62610C];-0.3:Extended
 006260A5    fcompp
 006260A7    wait
 006260A8    fnstsw      al
 006260AA    sahf
 006260AB    seta        al
>006260AE    jmp         00626108
 006260B0    cmp         byte ptr [ebx+430],0;TNunchukObject.LookingAtWatch:Boolean
>006260B7    je          006260D1
 006260B9    mov         eax,ebx
 006260BB    call        TNunchukObject.StickX
 006260C0    fld         tbyte ptr ds:[62610C];-0.3:Extended
 006260C6    fcompp
 006260C8    wait
 006260C9    fnstsw      al
 006260CB    sahf
 006260CC    seta        al
>006260CF    jmp         00626108
 006260D1    cmp         byte ptr [ebx+431],0;TNunchukObject.LookingAtWatchRH:Boolean
>006260D8    je          006260F2
 006260DA    mov         eax,ebx
 006260DC    call        TNunchukObject.StickX
 006260E1    fld         tbyte ptr ds:[626118];0.3:Extended
 006260E7    fcompp
 006260E9    wait
 006260EA    fnstsw      al
 006260EC    sahf
 006260ED    setb        al
>006260F0    jmp         00626108
 006260F2    mov         eax,ebx
 006260F4    call        TNunchukObject.StickY
 006260F9    fld         tbyte ptr ds:[62610C];-0.3:Extended
 006260FF    fcompp
 00626101    wait
 00626102    fnstsw      al
 00626104    sahf
 00626105    seta        al
 00626108    pop         esi
 00626109    pop         ebx
 0062610A    ret
*}
end;

//00626124
function TNunchukObject.Z:Boolean;
begin
{*
 00626124    test        eax,eax
>00626126    jne         0062612B
 00626128    xor         eax,eax
 0062612A    ret
 0062612B    mov         edx,dword ptr [eax+440];TNunchukObject.Wiimote:TWiimoteObject
 00626131    mov         ecx,dword ptr [edx+4B8];TWiimoteObject.Classic:TClassicObject
 00626137    cmp         byte ptr [ecx+8],0;TClassicObject.Exists:Boolean
>0062613B    je          0062614F
 0062613D    cmp         dword ptr [edx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00626144    jle         0062614F
 00626146    mov         eax,ecx
 00626148    call        TClassicObject.A
>0062614D    jmp         00626156
 0062614F    movzx       eax,byte ptr [eax+459];TNunchukObject.ButtonZ:Boolean
 00626156    ret
*}
end;

//00626158
function TNunchukObject.ZPrev:Boolean;
begin
{*
 00626158    test        eax,eax
>0062615A    jne         0062615F
 0062615C    xor         eax,eax
 0062615E    ret
 0062615F    mov         edx,dword ptr [eax+440];TNunchukObject.Wiimote:TWiimoteObject
 00626165    mov         ecx,dword ptr [edx+4B8];TWiimoteObject.Classic:TClassicObject
 0062616B    cmp         byte ptr [ecx+8],0;TClassicObject.Exists:Boolean
>0062616F    je          00626183
 00626171    cmp         dword ptr [edx+4B0],0;TWiimoteObject.BladeFXConfidence:Integer
>00626178    jle         00626183
 0062617A    mov         eax,ecx
 0062617C    call        TClassicObject.APrev
>00626181    jmp         0062618A
 00626183    movzx       eax,byte ptr [eax+45B];TNunchukObject.ButtonZPrev:Boolean
 0062618A    ret
*}
end;

//0062618C
function TClassicObject.A:Boolean;
begin
{*
 0062618C    test        eax,eax
>0062618E    je          00626196
 00626190    test        byte ptr [eax+38],10;TClassicObject.Buttons:word
>00626194    jne         00626199
 00626196    xor         eax,eax
 00626198    ret
 00626199    mov         al,1
 0062619B    ret
*}
end;

//0062619C
function TClassicObject.APrev:Boolean;
begin
{*
 0062619C    test        eax,eax
>0062619E    je          006261A6
 006261A0    test        byte ptr [eax+3A],10;TClassicObject.OldButtons:word
>006261A4    jne         006261A9
 006261A6    xor         eax,eax
 006261A8    ret
 006261A9    mov         al,1
 006261AB    ret
*}
end;

//006261AC
function TClassicObject.B:Boolean;
begin
{*
 006261AC    test        eax,eax
>006261AE    je          006261B6
 006261B0    test        byte ptr [eax+38],40;TClassicObject.Buttons:word
>006261B4    jne         006261B9
 006261B6    xor         eax,eax
 006261B8    ret
 006261B9    mov         al,1
 006261BB    ret
*}
end;

//006261BC
function TClassicObject.BPrev:Boolean;
begin
{*
 006261BC    test        eax,eax
>006261BE    je          006261C6
 006261C0    test        byte ptr [eax+3A],40;TClassicObject.OldButtons:word
>006261C4    jne         006261C9
 006261C6    xor         eax,eax
 006261C8    ret
 006261C9    mov         al,1
 006261CB    ret
*}
end;

//006261CC
procedure TClassicObject.Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 006261CC    push        ebx
 006261CD    push        esi
 006261CE    push        edi
 006261CF    mov         ebx,ecx
 006261D1    mov         esi,edx
 006261D3    mov         edi,eax
 006261D5    mov         byte ptr [edi+8],1;TClassicObject.Exists:Boolean
 006261D9    mov         edx,ebx
 006261DB    movzx       eax,byte ptr [esi+5]
 006261DF    call        0061F8EC
 006261E4    movzx       eax,al
 006261E7    mov         word ptr [edi+1C],ax;TClassicObject.Joy1MaxX:SmallInt
 006261EB    mov         edx,ebx
 006261ED    movzx       eax,byte ptr [esi+6]
 006261F1    call        0061F8EC
 006261F6    movzx       eax,al
 006261F9    mov         word ptr [edi+18],ax;TClassicObject.Joy1MinX:SmallInt
 006261FD    mov         edx,ebx
 006261FF    movzx       eax,byte ptr [esi+7]
 00626203    call        0061F8EC
 00626208    movzx       eax,al
 0062620B    mov         word ptr [edi+14],ax;TClassicObject.Joy1ZeroX:SmallInt
 0062620F    mov         edx,ebx
 00626211    movzx       eax,byte ptr [esi+8]
 00626215    call        0061F8EC
 0062621A    movzx       eax,al
 0062621D    mov         word ptr [edi+1E],ax;TClassicObject.Joy1MaxY:SmallInt
 00626221    mov         edx,ebx
 00626223    movzx       eax,byte ptr [esi+9]
 00626227    call        0061F8EC
 0062622C    movzx       eax,al
 0062622F    mov         word ptr [edi+1A],ax;TClassicObject.Joy1MinY:SmallInt
 00626233    mov         edx,ebx
 00626235    movzx       eax,byte ptr [esi+0A]
 00626239    call        0061F8EC
 0062623E    movzx       eax,al
 00626241    mov         word ptr [edi+16],ax;TClassicObject.Joy1ZeroY:SmallInt
 00626245    mov         edx,ebx
 00626247    movzx       eax,byte ptr [esi+0B]
 0062624B    call        0061F8EC
 00626250    movzx       eax,al
 00626253    mov         word ptr [edi+2C],ax;TClassicObject.Joy2MaxX:SmallInt
 00626257    mov         edx,ebx
 00626259    movzx       eax,byte ptr [esi+0C]
 0062625D    call        0061F8EC
 00626262    movzx       eax,al
 00626265    mov         word ptr [edi+28],ax;TClassicObject.Joy2MinX:SmallInt
 00626269    mov         edx,ebx
 0062626B    movzx       eax,byte ptr [esi+0D]
 0062626F    call        0061F8EC
 00626274    movzx       eax,al
 00626277    mov         word ptr [edi+24],ax;TClassicObject.Joy2ZeroX:SmallInt
 0062627B    mov         edx,ebx
 0062627D    movzx       eax,byte ptr [esi+0E]
 00626281    call        0061F8EC
 00626286    movzx       eax,al
 00626289    mov         word ptr [edi+2E],ax;TClassicObject.Joy2MaxY:SmallInt
 0062628D    mov         edx,ebx
 0062628F    movzx       eax,byte ptr [esi+0F]
 00626293    call        0061F8EC
 00626298    movzx       eax,al
 0062629B    mov         word ptr [edi+2A],ax;TClassicObject.Joy2MinY:SmallInt
 0062629F    mov         edx,ebx
 006262A1    movzx       eax,byte ptr [esi+10]
 006262A5    call        0061F8EC
 006262AA    movzx       eax,al
 006262AD    mov         word ptr [edi+26],ax;TClassicObject.Joy2ZeroY:SmallInt
 006262B1    pop         edi
 006262B2    pop         esi
 006262B3    pop         ebx
 006262B4    ret
*}
end;

//006262B8
procedure TClassicObject.Clear;
begin
{*
 006262B8    mov         byte ptr [eax+8],0;TClassicObject.Exists:Boolean
 006262BC    mov         word ptr [eax+38],0;TClassicObject.Buttons:word
 006262C2    movzx       edx,word ptr [eax+14];TClassicObject.Joy1ZeroX:SmallInt
 006262C6    mov         word ptr [eax+10],dx;TClassicObject.Joy1X:SmallInt
 006262CA    movzx       edx,word ptr [eax+16];TClassicObject.Joy1ZeroY:SmallInt
 006262CE    mov         word ptr [eax+12],dx;TClassicObject.Joy1Y:SmallInt
 006262D2    movzx       edx,word ptr [eax+24];TClassicObject.Joy2ZeroX:SmallInt
 006262D6    mov         word ptr [eax+20],dx;TClassicObject.Joy2X:SmallInt
 006262DA    movzx       edx,word ptr [eax+26];TClassicObject.Joy2ZeroY:SmallInt
 006262DE    mov         word ptr [eax+22],dx;TClassicObject.Joy2Y:SmallInt
 006262E2    mov         word ptr [eax+30],0;TClassicObject.FL:SmallInt
 006262E8    mov         word ptr [eax+32],0;TClassicObject.FR:SmallInt
 006262EE    ret
*}
end;

//006262F0
constructor TClassicObject.Create(Wiimote:TObject);
begin
{*
 006262F0    push        ebx
 006262F1    push        esi
 006262F2    test        dl,dl
>006262F4    je          006262FE
 006262F6    add         esp,0FFFFFFF0
 006262F9    call        @ClassCreate
 006262FE    mov         ebx,edx
 00626300    mov         esi,eax
 00626302    mov         dword ptr [esi+4],ecx;TClassicObject.Wiimote:TWiimoteObject
 00626305    mov         eax,esi
 00626307    call        TClassicObject.Clear
 0062630C    mov         eax,esi
 0062630E    test        bl,bl
>00626310    je          00626321
 00626312    call        @AfterConstruction
 00626317    pop         dword ptr fs:[0]
 0062631E    add         esp,0C
 00626321    mov         eax,esi
 00626323    pop         esi
 00626324    pop         ebx
 00626325    ret
*}
end;

//00626328
function TClassicObject.Down:Boolean;
begin
{*
 00626328    test        eax,eax
>0062632A    je          00626332
 0062632C    test        byte ptr [eax+39],40;TClassicObject.?f39:byte
>00626330    jne         00626335
 00626332    xor         eax,eax
 00626334    ret
 00626335    mov         al,1
 00626337    ret
*}
end;

//00626338
function TClassicObject.DownPrev:Boolean;
begin
{*
 00626338    test        eax,eax
>0062633A    je          00626342
 0062633C    test        byte ptr [eax+3B],40;TClassicObject.?f3B:byte
>00626340    jne         00626345
 00626342    xor         eax,eax
 00626344    ret
 00626345    mov         al,1
 00626347    ret
*}
end;

//00626348
function TClassicObject.DPadX:Integer;
begin
{*
 00626348    push        ebx
 00626349    mov         ebx,eax
 0062634B    mov         eax,ebx
 0062634D    call        TClassicObject.Right
 00626352    and         eax,7F
 00626355    push        eax
 00626356    mov         eax,ebx
 00626358    call        TClassicObject.Left
 0062635D    and         eax,7F
 00626360    mov         edx,eax
 00626362    pop         eax
 00626363    sub         eax,edx
 00626365    pop         ebx
 00626366    ret
*}
end;

//00626368
function TClassicObject.DPadY:Integer;
begin
{*
 00626368    push        ebx
 00626369    mov         ebx,eax
 0062636B    mov         eax,ebx
 0062636D    call        TClassicObject.Down
 00626372    and         eax,7F
 00626375    push        eax
 00626376    mov         eax,ebx
 00626378    call        TClassicObject.Up
 0062637D    and         eax,7F
 00626380    mov         edx,eax
 00626382    pop         eax
 00626383    sub         eax,edx
 00626385    pop         ebx
 00626386    ret
*}
end;

//00626388
function TClassicObject.HOME:Boolean;
begin
{*
 00626388    test        eax,eax
>0062638A    je          00626392
 0062638C    test        byte ptr [eax+39],8;TClassicObject.?f39:byte
>00626390    jne         00626395
 00626392    xor         eax,eax
 00626394    ret
 00626395    mov         al,1
 00626397    ret
*}
end;

//00626398
function TClassicObject.HOMEPrev:Boolean;
begin
{*
 00626398    test        eax,eax
>0062639A    je          006263A2
 0062639C    test        byte ptr [eax+3B],8;TClassicObject.?f3B:byte
>006263A0    jne         006263A5
 006263A2    xor         eax,eax
 006263A4    ret
 006263A5    mov         al,1
 006263A7    ret
*}
end;

//006263A8
function TClassicObject.L:Double;
begin
{*
 006263A8    add         esp,0FFFFFFF8
 006263AB    fild        word ptr [eax+30];TClassicObject.FL:SmallInt
 006263AE    fdiv        dword ptr ds:[6263C0];31:Single
 006263B4    fstp        qword ptr [esp]
 006263B7    wait
 006263B8    fld         qword ptr [esp]
 006263BB    pop         ecx
 006263BC    pop         edx
 006263BD    ret
*}
end;

//006263C4
function TClassicObject.Left:Boolean;
begin
{*
 006263C4    test        eax,eax
>006263C6    je          006263CE
 006263C8    test        byte ptr [eax+38],2;TClassicObject.Buttons:word
>006263CC    jne         006263D1
 006263CE    xor         eax,eax
 006263D0    ret
 006263D1    mov         al,1
 006263D3    ret
*}
end;

//006263D4
function TClassicObject.LeftPrev:Boolean;
begin
{*
 006263D4    test        eax,eax
>006263D6    je          006263DE
 006263D8    test        byte ptr [eax+3A],2;TClassicObject.OldButtons:word
>006263DC    jne         006263E1
 006263DE    xor         eax,eax
 006263E0    ret
 006263E1    mov         al,1
 006263E3    ret
*}
end;

//006263E4
function TClassicObject.LeftStickX:Double;
begin
{*
 006263E4    push        esi
 006263E5    push        edi
 006263E6    add         esp,0FFFFFFF0
 006263E9    test        eax,eax
>006263EB    jne         006263F8
 006263ED    xor         eax,eax
 006263EF    mov         dword ptr [esp],eax
 006263F2    mov         dword ptr [esp+4],eax
>006263F6    jmp         0062646D
 006263F8    movzx       ecx,word ptr [eax+14];TClassicObject.Joy1ZeroX:SmallInt
 006263FC    movzx       edi,word ptr [eax+1C];TClassicObject.Joy1MaxX:SmallInt
 00626400    cmp         cx,di
>00626403    jne         00626410
 00626405    xor         eax,eax
 00626407    mov         dword ptr [esp],eax
 0062640A    mov         dword ptr [esp+4],eax
>0062640E    jmp         0062646D
 00626410    movsx       edx,cx
 00626413    movsx       ecx,word ptr [eax+10];TClassicObject.Joy1X:SmallInt
 00626417    mov         esi,ecx
 00626419    add         esi,esi
 0062641B    add         esi,esi
 0062641D    cmp         edx,esi
>0062641F    jge         00626440
 00626421    sub         esi,edx
 00626423    mov         dword ptr [esp+8],esi
 00626427    fild        dword ptr [esp+8]
 0062642B    movsx       ecx,di
 0062642E    sub         ecx,edx
 00626430    mov         dword ptr [esp+0C],ecx
 00626434    fild        dword ptr [esp+0C]
 00626438    fdivp       st(1),st
 0062643A    fstp        qword ptr [esp]
 0062643D    wait
>0062643E    jmp         0062646D
 00626440    cmp         edx,esi
>00626442    jle         00626464
 00626444    sub         esi,edx
 00626446    mov         dword ptr [esp+8],esi
 0062644A    fild        dword ptr [esp+8]
 0062644E    movsx       eax,word ptr [eax+18];TClassicObject.Joy1MinX:SmallInt
 00626452    sub         edx,eax
 00626454    mov         dword ptr [esp+0C],edx
 00626458    fild        dword ptr [esp+0C]
 0062645C    fdivp       st(1),st
 0062645E    fstp        qword ptr [esp]
 00626461    wait
>00626462    jmp         0062646D
 00626464    xor         eax,eax
 00626466    mov         dword ptr [esp],eax
 00626469    mov         dword ptr [esp+4],eax
 0062646D    fld         qword ptr [esp]
 00626470    add         esp,10
 00626473    pop         edi
 00626474    pop         esi
 00626475    ret
*}
end;

//00626478
function TClassicObject.LeftStickY:Double;
begin
{*
 00626478    push        esi
 00626479    push        edi
 0062647A    add         esp,0FFFFFFF0
 0062647D    test        eax,eax
>0062647F    jne         0062648C
 00626481    xor         eax,eax
 00626483    mov         dword ptr [esp],eax
 00626486    mov         dword ptr [esp+4],eax
>0062648A    jmp         00626505
 0062648C    movzx       ecx,word ptr [eax+16];TClassicObject.Joy1ZeroY:SmallInt
 00626490    movzx       edi,word ptr [eax+1E];TClassicObject.Joy1MaxY:SmallInt
 00626494    cmp         cx,di
>00626497    jne         006264A4
 00626499    xor         eax,eax
 0062649B    mov         dword ptr [esp],eax
 0062649E    mov         dword ptr [esp+4],eax
>006264A2    jmp         00626505
 006264A4    movsx       edx,cx
 006264A7    movsx       ecx,word ptr [eax+12];TClassicObject.Joy1Y:SmallInt
 006264AB    mov         esi,ecx
 006264AD    add         esi,esi
 006264AF    add         esi,esi
 006264B1    cmp         edx,esi
>006264B3    jge         006264D6
 006264B5    sub         esi,edx
 006264B7    neg         esi
 006264B9    mov         dword ptr [esp+8],esi
 006264BD    fild        dword ptr [esp+8]
 006264C1    movsx       ecx,di
 006264C4    sub         ecx,edx
 006264C6    mov         dword ptr [esp+0C],ecx
 006264CA    fild        dword ptr [esp+0C]
 006264CE    fdivp       st(1),st
 006264D0    fstp        qword ptr [esp]
 006264D3    wait
>006264D4    jmp         00626505
 006264D6    cmp         edx,esi
>006264D8    jle         006264FC
 006264DA    sub         esi,edx
 006264DC    neg         esi
 006264DE    mov         dword ptr [esp+8],esi
 006264E2    fild        dword ptr [esp+8]
 006264E6    movsx       eax,word ptr [eax+1A];TClassicObject.Joy1MinY:SmallInt
 006264EA    sub         edx,eax
 006264EC    mov         dword ptr [esp+0C],edx
 006264F0    fild        dword ptr [esp+0C]
 006264F4    fdivp       st(1),st
 006264F6    fstp        qword ptr [esp]
 006264F9    wait
>006264FA    jmp         00626505
 006264FC    xor         eax,eax
 006264FE    mov         dword ptr [esp],eax
 00626501    mov         dword ptr [esp+4],eax
 00626505    fld         qword ptr [esp]
 00626508    add         esp,10
 0062650B    pop         edi
 0062650C    pop         esi
 0062650D    ret
*}
end;

//00626510
function TClassicObject.LFull:Boolean;
begin
{*
 00626510    test        eax,eax
>00626512    je          0062651A
 00626514    test        byte ptr [eax+39],20;TClassicObject.?f39:byte
>00626518    jne         0062651D
 0062651A    xor         eax,eax
 0062651C    ret
 0062651D    mov         al,1
 0062651F    ret
*}
end;

//00626520
function TClassicObject.LFullPrev:Boolean;
begin
{*
 00626520    test        eax,eax
>00626522    je          0062652A
 00626524    test        byte ptr [eax+3B],20;TClassicObject.?f3B:byte
>00626528    jne         0062652D
 0062652A    xor         eax,eax
 0062652C    ret
 0062652D    mov         al,1
 0062652F    ret
*}
end;

//00626530
procedure TClassicObject.LPrev;
begin
{*
 00626530    add         esp,0FFFFFFF8
 00626533    fild        word ptr [eax+34];TClassicObject.OldFL:SmallInt
 00626536    fdiv        dword ptr ds:[626548];31:Single
 0062653C    fstp        qword ptr [esp]
 0062653F    wait
 00626540    fld         qword ptr [esp]
 00626543    pop         ecx
 00626544    pop         edx
 00626545    ret
*}
end;

//0062654C
function TClassicObject.Minus:Boolean;
begin
{*
 0062654C    test        eax,eax
>0062654E    je          00626556
 00626550    test        byte ptr [eax+39],10;TClassicObject.?f39:byte
>00626554    jne         00626559
 00626556    xor         eax,eax
 00626558    ret
 00626559    mov         al,1
 0062655B    ret
*}
end;

//0062655C
function TClassicObject.MinusPrev:Boolean;
begin
{*
 0062655C    test        eax,eax
>0062655E    je          00626566
 00626560    test        byte ptr [eax+3B],10;TClassicObject.?f3B:byte
>00626564    jne         00626569
 00626566    xor         eax,eax
 00626568    ret
 00626569    mov         al,1
 0062656B    ret
*}
end;

//0062656C
function TClassicObject.Plus:Boolean;
begin
{*
 0062656C    test        eax,eax
>0062656E    je          0062657C
 00626570    cmp         byte ptr [eax+8],0;TClassicObject.Exists:Boolean
>00626574    je          0062657C
 00626576    test        byte ptr [eax+39],4;TClassicObject.?f39:byte
>0062657A    jne         0062657F
 0062657C    xor         eax,eax
 0062657E    ret
 0062657F    mov         al,1
 00626581    ret
*}
end;

//00626584
function TClassicObject.PlusPrev:Boolean;
begin
{*
 00626584    test        eax,eax
>00626586    je          00626594
 00626588    cmp         byte ptr [eax+8],0;TClassicObject.Exists:Boolean
>0062658C    je          00626594
 0062658E    test        byte ptr [eax+3B],4;TClassicObject.?f3B:byte
>00626592    jne         00626597
 00626594    xor         eax,eax
 00626596    ret
 00626597    mov         al,1
 00626599    ret
*}
end;

//0062659C
function TClassicObject.R:Double;
begin
{*
 0062659C    add         esp,0FFFFFFF8
 0062659F    fild        word ptr [eax+32];TClassicObject.FR:SmallInt
 006265A2    fdiv        dword ptr ds:[6265B4];31:Single
 006265A8    fstp        qword ptr [esp]
 006265AB    wait
 006265AC    fld         qword ptr [esp]
 006265AF    pop         ecx
 006265B0    pop         edx
 006265B1    ret
*}
end;

//006265B8
procedure TClassicObject.ReceiveExpansionData(ExpBytes:TExpBytes);
begin
{*
 006265B8    push        ebx
 006265B9    movzx       ecx,word ptr [eax+38];TClassicObject.Buttons:word
 006265BD    mov         word ptr [eax+3A],cx;TClassicObject.OldButtons:word
 006265C1    movzx       ecx,word ptr [eax+30];TClassicObject.FL:SmallInt
 006265C5    mov         word ptr [eax+34],cx;TClassicObject.OldFL:SmallInt
 006265C9    movzx       ecx,word ptr [eax+32];TClassicObject.FR:SmallInt
 006265CD    mov         word ptr [eax+36],cx;TClassicObject.OldFR:SmallInt
 006265D1    movzx       ecx,byte ptr [edx+4]
 006265D5    xor         cl,0FF
 006265D8    movzx       ecx,cl
 006265DB    shl         ecx,8
 006265DE    movzx       ebx,byte ptr [edx+5]
 006265E2    xor         bl,0FF
 006265E5    movzx       ebx,bl
 006265E8    add         cx,bx
 006265EB    mov         word ptr [eax+38],cx;TClassicObject.Buttons:word
 006265EF    movzx       ecx,byte ptr [edx]
 006265F2    and         cl,3F
 006265F5    movzx       ecx,cl
 006265F8    mov         word ptr [eax+10],cx;TClassicObject.Joy1X:SmallInt
 006265FC    movzx       ecx,byte ptr [edx+1]
 00626600    and         cl,3F
 00626603    movzx       ecx,cl
 00626606    mov         word ptr [eax+12],cx;TClassicObject.Joy1Y:SmallInt
 0062660A    movzx       ecx,byte ptr [edx+2]
 0062660E    shr         ecx,7
 00626611    movzx       ebx,byte ptr [edx+1]
 00626615    shr         ebx,6
 00626618    add         ebx,ebx
 0062661A    add         cx,bx
 0062661D    movzx       ebx,byte ptr [edx]
 00626620    shr         ebx,6
 00626623    add         ebx,ebx
 00626625    add         ebx,ebx
 00626627    add         ebx,ebx
 00626629    add         cx,bx
 0062662C    add         ecx,ecx
 0062662E    mov         word ptr [eax+20],cx;TClassicObject.Joy2X:SmallInt
 00626632    movzx       ecx,byte ptr [edx+2]
 00626636    and         cl,1F
 00626639    movzx       ecx,cl
 0062663C    add         ecx,ecx
 0062663E    mov         word ptr [eax+22],cx;TClassicObject.Joy2Y:SmallInt
 00626642    movzx       ecx,byte ptr [edx+3]
 00626646    and         cl,1F
 00626649    movzx       ecx,cl
 0062664C    mov         word ptr [eax+32],cx;TClassicObject.FR:SmallInt
 00626650    movzx       ecx,byte ptr [edx+3]
 00626654    shr         ecx,5
 00626657    movzx       edx,byte ptr [edx+2]
 0062665B    shr         edx,5
 0062665E    and         dx,3
 00626662    add         edx,edx
 00626664    add         edx,edx
 00626666    add         edx,edx
 00626668    add         cx,dx
 0062666B    mov         word ptr [eax+30],cx;TClassicObject.FL:SmallInt
 0062666F    cmp         word ptr [eax+14],0;TClassicObject.Joy1ZeroX:SmallInt
>00626674    jne         006266D5
 00626676    cmp         word ptr [eax+16],0;TClassicObject.Joy1ZeroY:SmallInt
>0062667B    jne         006266D5
 0062667D    movzx       edx,word ptr [eax+10];TClassicObject.Joy1X:SmallInt
 00626681    add         edx,edx
 00626683    add         edx,edx
 00626685    mov         word ptr [eax+14],dx;TClassicObject.Joy1ZeroX:SmallInt
 00626689    movzx       edx,word ptr [eax+12];TClassicObject.Joy1Y:SmallInt
 0062668D    add         edx,edx
 0062668F    add         edx,edx
 00626691    mov         word ptr [eax+16],dx;TClassicObject.Joy1ZeroY:SmallInt
 00626695    movzx       edx,word ptr [eax+10];TClassicObject.Joy1X:SmallInt
 00626699    add         edx,edx
 0062669B    add         edx,edx
 0062669D    add         dx,68
 006266A1    mov         word ptr [eax+1C],dx;TClassicObject.Joy1MaxX:SmallInt
 006266A5    movzx       edx,word ptr [eax+12];TClassicObject.Joy1Y:SmallInt
 006266A9    add         edx,edx
 006266AB    add         edx,edx
 006266AD    add         dx,68
 006266B1    mov         word ptr [eax+1E],dx;TClassicObject.Joy1MaxY:SmallInt
 006266B5    movzx       edx,word ptr [eax+10];TClassicObject.Joy1X:SmallInt
 006266B9    add         edx,edx
 006266BB    add         edx,edx
 006266BD    sub         dx,68
 006266C1    mov         word ptr [eax+18],dx;TClassicObject.Joy1MinX:SmallInt
 006266C5    movzx       edx,word ptr [eax+12];TClassicObject.Joy1Y:SmallInt
 006266C9    add         edx,edx
 006266CB    add         edx,edx
 006266CD    sub         dx,68
 006266D1    mov         word ptr [eax+1A],dx;TClassicObject.Joy1MinY:SmallInt
 006266D5    cmp         word ptr [eax+24],0;TClassicObject.Joy2ZeroX:SmallInt
>006266DA    jne         0062673B
 006266DC    cmp         word ptr [eax+26],0;TClassicObject.Joy2ZeroY:SmallInt
>006266E1    jne         0062673B
 006266E3    movzx       edx,word ptr [eax+20];TClassicObject.Joy2X:SmallInt
 006266E7    add         edx,edx
 006266E9    add         edx,edx
 006266EB    mov         word ptr [eax+24],dx;TClassicObject.Joy2ZeroX:SmallInt
 006266EF    movzx       edx,word ptr [eax+22];TClassicObject.Joy2Y:SmallInt
 006266F3    add         edx,edx
 006266F5    add         edx,edx
 006266F7    mov         word ptr [eax+26],dx;TClassicObject.Joy2ZeroY:SmallInt
 006266FB    movzx       edx,word ptr [eax+20];TClassicObject.Joy2X:SmallInt
 006266FF    add         edx,edx
 00626701    add         edx,edx
 00626703    add         dx,68
 00626707    mov         word ptr [eax+2C],dx;TClassicObject.Joy2MaxX:SmallInt
 0062670B    movzx       edx,word ptr [eax+22];TClassicObject.Joy2Y:SmallInt
 0062670F    add         edx,edx
 00626711    add         edx,edx
 00626713    add         dx,68
 00626717    mov         word ptr [eax+2E],dx;TClassicObject.Joy2MaxY:SmallInt
 0062671B    movzx       edx,word ptr [eax+20];TClassicObject.Joy2X:SmallInt
 0062671F    add         edx,edx
 00626721    add         edx,edx
 00626723    sub         dx,68
 00626727    mov         word ptr [eax+28],dx;TClassicObject.Joy2MinX:SmallInt
 0062672B    movzx       edx,word ptr [eax+22];TClassicObject.Joy2Y:SmallInt
 0062672F    add         edx,edx
 00626731    add         edx,edx
 00626733    sub         dx,68
 00626737    mov         word ptr [eax+2A],dx;TClassicObject.Joy2MinY:SmallInt
 0062673B    pop         ebx
 0062673C    ret
*}
end;

//00626740
procedure TClassicObject.ReceivePassThroughData(ExpBytes:TExpBytes);
begin
{*
 00626740    push        ebx
 00626741    push        esi
 00626742    mov         esi,edx
 00626744    mov         ebx,eax
 00626746    mov         edx,dword ptr [ebx+4];TClassicObject.Wiimote:TWiimoteObject
 00626749    movzx       eax,byte ptr [edx+4AC];TWiimoteObject.MotionPlusHasExpansion:Boolean
 00626750    test        byte ptr [esi+4],1
 00626754    setne       cl
 00626757    mov         byte ptr [edx+4AC],cl;TWiimoteObject.MotionPlusHasExpansion:Boolean
 0062675D    test        al,al
>0062675F    je          00626777
 00626761    mov         edx,dword ptr [ebx+4];TClassicObject.Wiimote:TWiimoteObject
 00626764    cmp         byte ptr [edx+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>0062676B    jne         00626777
 0062676D    mov         eax,dword ptr [ebx+4];TClassicObject.Wiimote:TWiimoteObject
 00626770    call        00623F5C
>00626775    jmp         0062678E
 00626777    mov         edx,dword ptr [ebx+4];TClassicObject.Wiimote:TWiimoteObject
 0062677A    cmp         byte ptr [edx+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>00626781    je          0062678E
 00626783    test        al,al
>00626785    jne         0062678E
 00626787    mov         eax,edx
 00626789    call        006207EC
 0062678E    mov         eax,dword ptr [ebx+4];TClassicObject.Wiimote:TWiimoteObject
 00626791    cmp         byte ptr [eax+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>00626798    je          0062693E
 0062679E    movzx       eax,word ptr [ebx+38];TClassicObject.Buttons:word
 006267A2    mov         word ptr [ebx+3A],ax;TClassicObject.OldButtons:word
 006267A6    movzx       eax,word ptr [ebx+30];TClassicObject.FL:SmallInt
 006267AA    mov         word ptr [ebx+34],ax;TClassicObject.OldFL:SmallInt
 006267AE    movzx       eax,word ptr [ebx+32];TClassicObject.FR:SmallInt
 006267B2    mov         word ptr [ebx+36],ax;TClassicObject.OldFR:SmallInt
 006267B6    movzx       eax,byte ptr [esi+4]
 006267BA    xor         al,0FF
 006267BC    and         al,0FE
 006267BE    movzx       eax,al
 006267C1    shl         eax,8
 006267C4    movzx       edx,byte ptr [esi+5]
 006267C8    xor         dl,0FF
 006267CB    and         dl,0FC
 006267CE    movzx       edx,dl
 006267D1    add         ax,dx
 006267D4    mov         word ptr [ebx+38],ax;TClassicObject.Buttons:word
 006267D8    movzx       edx,byte ptr [esi]
 006267DB    and         dl,1
 006267DE    movzx       edx,dl
 006267E1    or          dx,ax
 006267E4    movzx       eax,byte ptr [esi+1]
 006267E8    and         al,1
 006267EA    movzx       eax,al
 006267ED    add         eax,eax
 006267EF    or          dx,ax
 006267F2    mov         word ptr [ebx+38],dx;TClassicObject.Buttons:word
 006267F6    movzx       eax,byte ptr [esi]
 006267F9    and         al,3E
 006267FB    movzx       eax,al
 006267FE    mov         word ptr [ebx+10],ax;TClassicObject.Joy1X:SmallInt
 00626802    movzx       eax,byte ptr [esi+1]
 00626806    and         al,3E
 00626808    movzx       eax,al
 0062680B    mov         word ptr [ebx+12],ax;TClassicObject.Joy1Y:SmallInt
 0062680F    movzx       eax,byte ptr [esi+2]
 00626813    shr         eax,7
 00626816    movzx       edx,byte ptr [esi+1]
 0062681A    shr         edx,6
 0062681D    add         edx,edx
 0062681F    add         ax,dx
 00626822    movzx       edx,byte ptr [esi]
 00626825    shr         edx,6
 00626828    add         edx,edx
 0062682A    add         edx,edx
 0062682C    add         edx,edx
 0062682E    add         ax,dx
 00626831    add         eax,eax
 00626833    mov         word ptr [ebx+20],ax;TClassicObject.Joy2X:SmallInt
 00626837    movzx       eax,byte ptr [esi+2]
 0062683B    and         al,1F
 0062683D    movzx       eax,al
 00626840    add         eax,eax
 00626842    mov         word ptr [ebx+22],ax;TClassicObject.Joy2Y:SmallInt
 00626846    movzx       eax,byte ptr [esi+3]
 0062684A    and         al,1F
 0062684C    movzx       eax,al
 0062684F    mov         word ptr [ebx+32],ax;TClassicObject.FR:SmallInt
 00626853    movzx       eax,byte ptr [esi+3]
 00626857    shr         eax,5
 0062685A    movzx       edx,byte ptr [esi+2]
 0062685E    shr         edx,5
 00626861    and         dx,3
 00626865    add         edx,edx
 00626867    add         edx,edx
 00626869    add         edx,edx
 0062686B    add         ax,dx
 0062686E    mov         word ptr [ebx+30],ax;TClassicObject.FL:SmallInt
 00626872    cmp         word ptr [ebx+14],0;TClassicObject.Joy1ZeroX:SmallInt
>00626877    jne         006268D8
 00626879    cmp         word ptr [ebx+16],0;TClassicObject.Joy1ZeroY:SmallInt
>0062687E    jne         006268D8
 00626880    movzx       eax,word ptr [ebx+10];TClassicObject.Joy1X:SmallInt
 00626884    add         eax,eax
 00626886    add         eax,eax
 00626888    mov         word ptr [ebx+14],ax;TClassicObject.Joy1ZeroX:SmallInt
 0062688C    movzx       eax,word ptr [ebx+12];TClassicObject.Joy1Y:SmallInt
 00626890    add         eax,eax
 00626892    add         eax,eax
 00626894    mov         word ptr [ebx+16],ax;TClassicObject.Joy1ZeroY:SmallInt
 00626898    movzx       eax,word ptr [ebx+10];TClassicObject.Joy1X:SmallInt
 0062689C    add         eax,eax
 0062689E    add         eax,eax
 006268A0    add         ax,68
 006268A4    mov         word ptr [ebx+1C],ax;TClassicObject.Joy1MaxX:SmallInt
 006268A8    movzx       eax,word ptr [ebx+12];TClassicObject.Joy1Y:SmallInt
 006268AC    add         eax,eax
 006268AE    add         eax,eax
 006268B0    add         ax,68
 006268B4    mov         word ptr [ebx+1E],ax;TClassicObject.Joy1MaxY:SmallInt
 006268B8    movzx       eax,word ptr [ebx+10];TClassicObject.Joy1X:SmallInt
 006268BC    add         eax,eax
 006268BE    add         eax,eax
 006268C0    sub         ax,68
 006268C4    mov         word ptr [ebx+18],ax;TClassicObject.Joy1MinX:SmallInt
 006268C8    movzx       eax,word ptr [ebx+12];TClassicObject.Joy1Y:SmallInt
 006268CC    add         eax,eax
 006268CE    add         eax,eax
 006268D0    sub         ax,68
 006268D4    mov         word ptr [ebx+1A],ax;TClassicObject.Joy1MinY:SmallInt
 006268D8    cmp         word ptr [ebx+24],0;TClassicObject.Joy2ZeroX:SmallInt
>006268DD    jne         0062693E
 006268DF    cmp         word ptr [ebx+26],0;TClassicObject.Joy2ZeroY:SmallInt
>006268E4    jne         0062693E
 006268E6    movzx       eax,word ptr [ebx+20];TClassicObject.Joy2X:SmallInt
 006268EA    add         eax,eax
 006268EC    add         eax,eax
 006268EE    mov         word ptr [ebx+24],ax;TClassicObject.Joy2ZeroX:SmallInt
 006268F2    movzx       eax,word ptr [ebx+22];TClassicObject.Joy2Y:SmallInt
 006268F6    add         eax,eax
 006268F8    add         eax,eax
 006268FA    mov         word ptr [ebx+26],ax;TClassicObject.Joy2ZeroY:SmallInt
 006268FE    movzx       eax,word ptr [ebx+20];TClassicObject.Joy2X:SmallInt
 00626902    add         eax,eax
 00626904    add         eax,eax
 00626906    add         ax,68
 0062690A    mov         word ptr [ebx+2C],ax;TClassicObject.Joy2MaxX:SmallInt
 0062690E    movzx       eax,word ptr [ebx+22];TClassicObject.Joy2Y:SmallInt
 00626912    add         eax,eax
 00626914    add         eax,eax
 00626916    add         ax,68
 0062691A    mov         word ptr [ebx+2E],ax;TClassicObject.Joy2MaxY:SmallInt
 0062691E    movzx       eax,word ptr [ebx+20];TClassicObject.Joy2X:SmallInt
 00626922    add         eax,eax
 00626924    add         eax,eax
 00626926    sub         ax,68
 0062692A    mov         word ptr [ebx+28],ax;TClassicObject.Joy2MinX:SmallInt
 0062692E    movzx       eax,word ptr [ebx+22];TClassicObject.Joy2Y:SmallInt
 00626932    add         eax,eax
 00626934    add         eax,eax
 00626936    sub         ax,68
 0062693A    mov         word ptr [ebx+2A],ax;TClassicObject.Joy2MinY:SmallInt
 0062693E    pop         esi
 0062693F    pop         ebx
 00626940    ret
*}
end;

//00626944
function TClassicObject.RFull:Boolean;
begin
{*
 00626944    test        eax,eax
>00626946    je          0062694E
 00626948    test        byte ptr [eax+39],2;TClassicObject.?f39:byte
>0062694C    jne         00626951
 0062694E    xor         eax,eax
 00626950    ret
 00626951    mov         al,1
 00626953    ret
*}
end;

//00626954
function TClassicObject.RFullPrev:Boolean;
begin
{*
 00626954    test        eax,eax
>00626956    je          0062695E
 00626958    test        byte ptr [eax+3B],2;TClassicObject.?f3B:byte
>0062695C    jne         00626961
 0062695E    xor         eax,eax
 00626960    ret
 00626961    mov         al,1
 00626963    ret
*}
end;

//00626964
function TClassicObject.Right:Boolean;
begin
{*
 00626964    test        eax,eax
>00626966    je          0062696E
 00626968    test        byte ptr [eax+39],80;TClassicObject.?f39:byte
>0062696C    jne         00626971
 0062696E    xor         eax,eax
 00626970    ret
 00626971    mov         al,1
 00626973    ret
*}
end;

//00626974
function TClassicObject.RightPrev:Boolean;
begin
{*
 00626974    test        eax,eax
>00626976    je          0062697E
 00626978    test        byte ptr [eax+3B],80;TClassicObject.?f3B:byte
>0062697C    jne         00626981
 0062697E    xor         eax,eax
 00626980    ret
 00626981    mov         al,1
 00626983    ret
*}
end;

//00626984
function TClassicObject.RightStickX:Double;
begin
{*
 00626984    push        esi
 00626985    push        edi
 00626986    add         esp,0FFFFFFF0
 00626989    test        eax,eax
>0062698B    jne         00626998
 0062698D    xor         eax,eax
 0062698F    mov         dword ptr [esp],eax
 00626992    mov         dword ptr [esp+4],eax
>00626996    jmp         00626A0D
 00626998    movzx       ecx,word ptr [eax+24];TClassicObject.Joy2ZeroX:SmallInt
 0062699C    movzx       edi,word ptr [eax+2C];TClassicObject.Joy2MaxX:SmallInt
 006269A0    cmp         cx,di
>006269A3    jne         006269B0
 006269A5    xor         eax,eax
 006269A7    mov         dword ptr [esp],eax
 006269AA    mov         dword ptr [esp+4],eax
>006269AE    jmp         00626A0D
 006269B0    movsx       edx,cx
 006269B3    movsx       ecx,word ptr [eax+20];TClassicObject.Joy2X:SmallInt
 006269B7    mov         esi,ecx
 006269B9    add         esi,esi
 006269BB    add         esi,esi
 006269BD    cmp         edx,esi
>006269BF    jge         006269E0
 006269C1    sub         esi,edx
 006269C3    mov         dword ptr [esp+8],esi
 006269C7    fild        dword ptr [esp+8]
 006269CB    movsx       ecx,di
 006269CE    sub         ecx,edx
 006269D0    mov         dword ptr [esp+0C],ecx
 006269D4    fild        dword ptr [esp+0C]
 006269D8    fdivp       st(1),st
 006269DA    fstp        qword ptr [esp]
 006269DD    wait
>006269DE    jmp         00626A0D
 006269E0    cmp         edx,esi
>006269E2    jle         00626A04
 006269E4    sub         esi,edx
 006269E6    mov         dword ptr [esp+8],esi
 006269EA    fild        dword ptr [esp+8]
 006269EE    movsx       eax,word ptr [eax+28];TClassicObject.Joy2MinX:SmallInt
 006269F2    sub         edx,eax
 006269F4    mov         dword ptr [esp+0C],edx
 006269F8    fild        dword ptr [esp+0C]
 006269FC    fdivp       st(1),st
 006269FE    fstp        qword ptr [esp]
 00626A01    wait
>00626A02    jmp         00626A0D
 00626A04    xor         eax,eax
 00626A06    mov         dword ptr [esp],eax
 00626A09    mov         dword ptr [esp+4],eax
 00626A0D    fld         qword ptr [esp]
 00626A10    add         esp,10
 00626A13    pop         edi
 00626A14    pop         esi
 00626A15    ret
*}
end;

//00626A18
function TClassicObject.RightStickY:Double;
begin
{*
 00626A18    push        esi
 00626A19    push        edi
 00626A1A    add         esp,0FFFFFFF0
 00626A1D    test        eax,eax
>00626A1F    jne         00626A2C
 00626A21    xor         eax,eax
 00626A23    mov         dword ptr [esp],eax
 00626A26    mov         dword ptr [esp+4],eax
>00626A2A    jmp         00626AA5
 00626A2C    movzx       ecx,word ptr [eax+26];TClassicObject.Joy2ZeroY:SmallInt
 00626A30    movzx       edi,word ptr [eax+2E];TClassicObject.Joy2MaxY:SmallInt
 00626A34    cmp         cx,di
>00626A37    jne         00626A44
 00626A39    xor         eax,eax
 00626A3B    mov         dword ptr [esp],eax
 00626A3E    mov         dword ptr [esp+4],eax
>00626A42    jmp         00626AA5
 00626A44    movsx       edx,cx
 00626A47    movsx       ecx,word ptr [eax+22];TClassicObject.Joy2Y:SmallInt
 00626A4B    mov         esi,ecx
 00626A4D    add         esi,esi
 00626A4F    add         esi,esi
 00626A51    cmp         edx,esi
>00626A53    jge         00626A76
 00626A55    sub         esi,edx
 00626A57    neg         esi
 00626A59    mov         dword ptr [esp+8],esi
 00626A5D    fild        dword ptr [esp+8]
 00626A61    movsx       ecx,di
 00626A64    sub         ecx,edx
 00626A66    mov         dword ptr [esp+0C],ecx
 00626A6A    fild        dword ptr [esp+0C]
 00626A6E    fdivp       st(1),st
 00626A70    fstp        qword ptr [esp]
 00626A73    wait
>00626A74    jmp         00626AA5
 00626A76    cmp         edx,esi
>00626A78    jle         00626A9C
 00626A7A    sub         esi,edx
 00626A7C    neg         esi
 00626A7E    mov         dword ptr [esp+8],esi
 00626A82    fild        dword ptr [esp+8]
 00626A86    movsx       eax,word ptr [eax+2A];TClassicObject.Joy2MinY:SmallInt
 00626A8A    sub         edx,eax
 00626A8C    mov         dword ptr [esp+0C],edx
 00626A90    fild        dword ptr [esp+0C]
 00626A94    fdivp       st(1),st
 00626A96    fstp        qword ptr [esp]
 00626A99    wait
>00626A9A    jmp         00626AA5
 00626A9C    xor         eax,eax
 00626A9E    mov         dword ptr [esp],eax
 00626AA1    mov         dword ptr [esp+4],eax
 00626AA5    fld         qword ptr [esp]
 00626AA8    add         esp,10
 00626AAB    pop         edi
 00626AAC    pop         esi
 00626AAD    ret
*}
end;

//00626AB0
procedure TClassicObject.RPrev;
begin
{*
 00626AB0    add         esp,0FFFFFFF8
 00626AB3    fild        word ptr [eax+36];TClassicObject.OldFR:SmallInt
 00626AB6    fdiv        dword ptr ds:[626AC8];31:Single
 00626ABC    fstp        qword ptr [esp]
 00626ABF    wait
 00626AC0    fld         qword ptr [esp]
 00626AC3    pop         ecx
 00626AC4    pop         edx
 00626AC5    ret
*}
end;

//00626ACC
procedure TClassicObject.SetNumber(Value:Integer);
begin
{*
 00626ACC    push        ebx
 00626ACD    mov         dword ptr [eax+0C],edx;TClassicObject.FNumber:Integer
 00626AD0    mov         ecx,dword ptr [eax+4];TClassicObject.Wiimote:TWiimoteObject
 00626AD3    mov         ebx,dword ptr [ecx+4];TWiimoteObject.FManager:TComponent
 00626AD6    cmp         byte ptr [ebx+134],0
>00626ADD    je          00626AFA
 00626ADF    cmp         byte ptr [ecx+447],0;TWiimoteObject.FUseExpansion:Boolean
>00626AE6    je          00626AF1
 00626AE8    mov         eax,ecx
 00626AEA    call        TWiimoteObject.SetPlayerLed
>00626AEF    jmp         00626AFA
 00626AF1    xor         edx,edx
 00626AF3    mov         eax,ecx
 00626AF5    call        TWiimoteObject.SetPlayerLed
 00626AFA    pop         ebx
 00626AFB    ret
*}
end;

//00626AFC
function TClassicObject.Unused:Boolean;
begin
{*
 00626AFC    test        eax,eax
>00626AFE    je          00626B06
 00626B00    test        byte ptr [eax+39],1;TClassicObject.?f39:byte
>00626B04    jne         00626B09
 00626B06    xor         eax,eax
 00626B08    ret
 00626B09    mov         al,1
 00626B0B    ret
*}
end;

//00626B0C
function TClassicObject.UnusedPrev:Boolean;
begin
{*
 00626B0C    test        eax,eax
>00626B0E    je          00626B16
 00626B10    test        byte ptr [eax+3B],1;TClassicObject.?f3B:byte
>00626B14    jne         00626B19
 00626B16    xor         eax,eax
 00626B18    ret
 00626B19    mov         al,1
 00626B1B    ret
*}
end;

//00626B1C
function TClassicObject.Up:Boolean;
begin
{*
 00626B1C    test        eax,eax
>00626B1E    je          00626B26
 00626B20    test        byte ptr [eax+38],1;TClassicObject.Buttons:word
>00626B24    jne         00626B29
 00626B26    xor         eax,eax
 00626B28    ret
 00626B29    mov         al,1
 00626B2B    ret
*}
end;

//00626B2C
function TClassicObject.UpPrev:Boolean;
begin
{*
 00626B2C    test        eax,eax
>00626B2E    je          00626B36
 00626B30    test        byte ptr [eax+3A],1;TClassicObject.OldButtons:word
>00626B34    jne         00626B39
 00626B36    xor         eax,eax
 00626B38    ret
 00626B39    mov         al,1
 00626B3B    ret
*}
end;

//00626B3C
function TClassicObject.X:Boolean;
begin
{*
 00626B3C    test        eax,eax
>00626B3E    je          00626B46
 00626B40    test        byte ptr [eax+38],8;TClassicObject.Buttons:word
>00626B44    jne         00626B49
 00626B46    xor         eax,eax
 00626B48    ret
 00626B49    mov         al,1
 00626B4B    ret
*}
end;

//00626B4C
function TClassicObject.XPrev:Boolean;
begin
{*
 00626B4C    test        eax,eax
>00626B4E    je          00626B56
 00626B50    test        byte ptr [eax+3A],8;TClassicObject.OldButtons:word
>00626B54    jne         00626B59
 00626B56    xor         eax,eax
 00626B58    ret
 00626B59    mov         al,1
 00626B5B    ret
*}
end;

//00626B5C
function TClassicObject.Y:Boolean;
begin
{*
 00626B5C    test        eax,eax
>00626B5E    je          00626B66
 00626B60    test        byte ptr [eax+38],20;TClassicObject.Buttons:word
>00626B64    jne         00626B69
 00626B66    xor         eax,eax
 00626B68    ret
 00626B69    mov         al,1
 00626B6B    ret
*}
end;

//00626B6C
function TClassicObject.YPrev:Boolean;
begin
{*
 00626B6C    test        eax,eax
>00626B6E    je          00626B76
 00626B70    test        byte ptr [eax+3A],20;TClassicObject.OldButtons:word
>00626B74    jne         00626B79
 00626B76    xor         eax,eax
 00626B78    ret
 00626B79    mov         al,1
 00626B7B    ret
*}
end;

//00626B7C
function TClassicObject.ZL:Boolean;
begin
{*
 00626B7C    test        eax,eax
>00626B7E    je          00626B86
 00626B80    test        byte ptr [eax+38],80;TClassicObject.Buttons:word
>00626B84    jne         00626B89
 00626B86    xor         eax,eax
 00626B88    ret
 00626B89    mov         al,1
 00626B8B    ret
*}
end;

//00626B8C
function TClassicObject.ZLPrev:Boolean;
begin
{*
 00626B8C    test        eax,eax
>00626B8E    je          00626B96
 00626B90    test        byte ptr [eax+3A],80;TClassicObject.OldButtons:word
>00626B94    jne         00626B99
 00626B96    xor         eax,eax
 00626B98    ret
 00626B99    mov         al,1
 00626B9B    ret
*}
end;

//00626B9C
function TClassicObject.ZR:Boolean;
begin
{*
 00626B9C    test        eax,eax
>00626B9E    je          00626BA6
 00626BA0    test        byte ptr [eax+38],4;TClassicObject.Buttons:word
>00626BA4    jne         00626BA9
 00626BA6    xor         eax,eax
 00626BA8    ret
 00626BA9    mov         al,1
 00626BAB    ret
*}
end;

//00626BAC
function TClassicObject.ZRPrev:Boolean;
begin
{*
 00626BAC    test        eax,eax
>00626BAE    je          00626BB6
 00626BB0    test        byte ptr [eax+3A],4;TClassicObject.OldButtons:word
>00626BB4    jne         00626BB9
 00626BB6    xor         eax,eax
 00626BB8    ret
 00626BB9    mov         al,1
 00626BBB    ret
*}
end;

//00626BBC
procedure TBalanceBoardObject.Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00626BBC    push        ebx
 00626BBD    push        esi
 00626BBE    push        edi
 00626BBF    push        ebp
 00626BC0    mov         ebx,ecx
 00626BC2    mov         esi,edx
 00626BC4    mov         ebp,eax
 00626BC6    mov         edx,ebx
 00626BC8    movzx       eax,byte ptr [esi+5]
 00626BCC    call        0061F8EC
 00626BD1    movzx       eax,al
 00626BD4    mov         edi,eax
 00626BD6    shl         edi,8
 00626BD9    mov         edx,ebx
 00626BDB    movzx       eax,byte ptr [esi+6]
 00626BDF    call        0061F8EC
 00626BE4    movzx       eax,al
 00626BE7    add         di,ax
 00626BEA    mov         word ptr [ebp+10],di;TBalanceBoardObject.PreCalib:word
 00626BEE    mov         edx,ebx
 00626BF0    movzx       eax,byte ptr [esi+7]
 00626BF4    call        0061F8EC
 00626BF9    movzx       eax,al
 00626BFC    mov         edi,eax
 00626BFE    shl         edi,8
 00626C01    mov         edx,ebx
 00626C03    movzx       eax,byte ptr [esi+8]
 00626C07    call        0061F8EC
 00626C0C    movzx       eax,al
 00626C0F    add         di,ax
 00626C12    mov         word ptr [ebp+12],di;TBalanceBoardObject.PreCalibZero:word
 00626C16    mov         byte ptr [ebp+8],1;TBalanceBoardObject.Exists:Boolean
 00626C1A    xor         edi,edi
 00626C1C    mov         eax,edi
 00626C1E    add         eax,eax
 00626C20    add         eax,9
 00626C23    movzx       eax,byte ptr [esi+eax]
 00626C27    mov         edx,ebx
 00626C29    call        0061F8EC
 00626C2E    movzx       eax,al
 00626C31    shl         eax,8
 00626C34    push        eax
 00626C35    mov         eax,edi
 00626C37    add         eax,eax
 00626C39    add         eax,0A
 00626C3C    movzx       eax,byte ptr [esi+eax]
 00626C40    mov         edx,ebx
 00626C42    call        0061F8EC
 00626C47    movzx       eax,al
 00626C4A    pop         edx
 00626C4B    add         dx,ax
 00626C4E    mov         word ptr [ebp+edi*2+18],dx
 00626C53    inc         edi
 00626C54    cmp         edi,4
>00626C57    jne         00626C1C
 00626C59    xor         edi,edi
 00626C5B    mov         eax,edi
 00626C5D    add         eax,eax
 00626C5F    add         eax,11
 00626C62    movzx       eax,byte ptr [esi+eax]
 00626C66    mov         edx,ebx
 00626C68    call        0061F8EC
 00626C6D    movzx       eax,al
 00626C70    shl         eax,8
 00626C73    push        eax
 00626C74    mov         eax,edi
 00626C76    add         eax,eax
 00626C78    add         eax,12
 00626C7B    movzx       eax,byte ptr [esi+eax]
 00626C7F    mov         edx,ebx
 00626C81    call        0061F8EC
 00626C86    movzx       eax,al
 00626C89    pop         edx
 00626C8A    add         dx,ax
 00626C8D    mov         word ptr [ebp+edi*2+20],dx
 00626C92    inc         edi
 00626C93    cmp         edi,2
>00626C96    jne         00626C5B
 00626C98    pop         ebp
 00626C99    pop         edi
 00626C9A    pop         esi
 00626C9B    pop         ebx
 00626C9C    ret
*}
end;

//00626CA0
procedure TBalanceBoardObject.Calibrate2(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00626CA0    push        ebx
 00626CA1    push        esi
 00626CA2    push        edi
 00626CA3    push        ebp
 00626CA4    add         esp,0FFFFFFF4
 00626CA7    mov         byte ptr [esp],cl
 00626CAA    mov         edi,edx
 00626CAC    mov         esi,eax
 00626CAE    mov         byte ptr [esi+8],1;TBalanceBoardObject.Exists:Boolean
 00626CB2    xor         ebx,ebx
 00626CB4    mov         ebp,ebx
 00626CB6    add         ebp,ebp
 00626CB8    mov         eax,ebp
 00626CBA    add         eax,5
 00626CBD    movzx       eax,byte ptr [edi+eax]
 00626CC1    movzx       edx,byte ptr [esp]
 00626CC5    call        0061F8EC
 00626CCA    movzx       eax,al
 00626CCD    shl         eax,8
 00626CD0    push        eax
 00626CD1    add         ebp,6
 00626CD4    movzx       eax,byte ptr [edi+ebp]
 00626CD8    movzx       edx,byte ptr [esp+4]
 00626CDD    call        0061F8EC
 00626CE2    movzx       eax,al
 00626CE5    pop         edx
 00626CE6    add         dx,ax
 00626CE9    mov         word ptr [esi+ebx*2+24],dx
 00626CEE    inc         ebx
 00626CEF    cmp         ebx,2
>00626CF2    jne         00626CB4
 00626CF4    xor         ebx,ebx
 00626CF6    mov         ebp,ebx
 00626CF8    add         ebp,ebp
 00626CFA    mov         eax,ebp
 00626CFC    add         eax,9
 00626CFF    movzx       eax,byte ptr [edi+eax]
 00626D03    movzx       edx,byte ptr [esp]
 00626D07    call        0061F8EC
 00626D0C    movzx       eax,al
 00626D0F    shl         eax,8
 00626D12    push        eax
 00626D13    add         ebp,0A
 00626D16    movzx       eax,byte ptr [edi+ebp]
 00626D1A    movzx       edx,byte ptr [esp+4]
 00626D1F    call        0061F8EC
 00626D24    movzx       eax,al
 00626D27    pop         edx
 00626D28    add         dx,ax
 00626D2B    mov         word ptr [esi+ebx*2+28],dx
 00626D30    inc         ebx
 00626D31    cmp         ebx,4
>00626D34    jne         00626CF6
 00626D36    movzx       eax,byte ptr [edi+11]
 00626D3A    movzx       edx,byte ptr [esp]
 00626D3E    call        0061F8EC
 00626D43    movzx       eax,al
 00626D46    mov         ebx,eax
 00626D48    shl         ebx,8
 00626D4B    movzx       eax,byte ptr [edi+12]
 00626D4F    movzx       edx,byte ptr [esp]
 00626D53    call        0061F8EC
 00626D58    movzx       eax,al
 00626D5B    add         bx,ax
 00626D5E    mov         word ptr [esi+14],bx;TBalanceBoardObject.PostCalib1:word
 00626D62    movzx       eax,byte ptr [edi+13]
 00626D66    movzx       edx,byte ptr [esp]
 00626D6A    call        0061F8EC
 00626D6F    movzx       eax,al
 00626D72    mov         ebx,eax
 00626D74    shl         ebx,8
 00626D77    movzx       eax,byte ptr [edi+14]
 00626D7B    movzx       edx,byte ptr [esp]
 00626D7F    call        0061F8EC
 00626D84    movzx       eax,al
 00626D87    add         bx,ax
 00626D8A    mov         word ptr [esi+16],bx;TBalanceBoardObject.PostCalib2:word
 00626D8E    xor         ebx,ebx
 00626D90    xor         eax,eax
 00626D92    mov         dword ptr [esi+ebx*8+30],eax
 00626D96    mov         dword ptr [esi+ebx*8+34],eax
 00626D9A    xor         eax,eax
 00626D9C    mov         dword ptr [esi+ebx*8+50],eax
 00626DA0    mov         dword ptr [esi+ebx*8+54],40310000
 00626DA8    xor         eax,eax
 00626DAA    mov         dword ptr [esi+ebx*8+70],eax
 00626DAE    mov         dword ptr [esi+ebx*8+74],40410000
 00626DB6    mov         dword ptr [esp+4],1
 00626DBE    mov         edx,2
 00626DC3    sub         edx,dword ptr [esp+4]
 00626DC7    test        edx,edx
>00626DC9    jl          00626E16
 00626DCB    inc         edx
 00626DCC    xor         eax,eax
 00626DCE    mov         ecx,eax
 00626DD0    add         ecx,ecx
 00626DD2    add         ecx,ecx
 00626DD4    lea         edi,[esi+ecx*8]
 00626DD7    fld         qword ptr [edi+ebx*8+50]
 00626DDB    mov         edi,eax
 00626DDD    add         edi,edi
 00626DDF    add         edi,edi
 00626DE1    lea         edi,[esi+edi*8]
 00626DE4    fsub        qword ptr [edi+ebx*8+30]
 00626DE8    mov         edi,dword ptr [esp+4]
 00626DEC    add         edi,eax
 00626DEE    lea         edi,[esi+edi*8]
 00626DF1    movzx       edi,word ptr [edi+ebx*2+18]
 00626DF6    lea         ebp,[esi+eax*8]
 00626DF9    movzx       ebp,word ptr [ebp+ebx*2+18]
 00626DFE    sub         edi,ebp
 00626E00    mov         dword ptr [esp+8],edi
 00626E04    fild        dword ptr [esp+8]
 00626E08    fdivp       st(1),st
 00626E0A    lea         ecx,[esi+ecx*8]
 00626E0D    fstp        qword ptr [ecx+ebx*8+30]
 00626E11    wait
 00626E12    inc         eax
 00626E13    dec         edx
>00626E14    jne         00626DCE
 00626E16    inc         dword ptr [esp+4]
 00626E1A    cmp         dword ptr [esp+4],3
>00626E1F    jne         00626DBE
 00626E21    inc         ebx
 00626E22    cmp         ebx,4
>00626E25    jne         00626D90
 00626E2B    add         esp,0C
 00626E2E    pop         ebp
 00626E2F    pop         edi
 00626E30    pop         esi
 00626E31    pop         ebx
 00626E32    ret
*}
end;

//00626E34
procedure TBalanceBoardObject.Clear;
begin
{*
 00626E34    mov         byte ptr [eax+8],0;TBalanceBoardObject.Exists:Boolean
 00626E38    ret
*}
end;

//00626E3C
constructor TBalanceBoardObject.Create(Wiimote:TObject);
begin
{*
 00626E3C    test        dl,dl
>00626E3E    je          00626E48
 00626E40    add         esp,0FFFFFFF0
 00626E43    call        @ClassCreate
 00626E48    mov         dword ptr [eax+4],ecx;TBalanceBoardObject.Wiimote:TWiimoteObject
 00626E4B    test        dl,dl
>00626E4D    je          00626E5E
 00626E4F    call        @AfterConstruction
 00626E54    pop         dword ptr fs:[0]
 00626E5B    add         esp,0C
 00626E5E    ret
*}
end;

//00626E60
function TBalanceBoardObject.JoyX:Double;
begin
{*
 00626E60    push        ebx
 00626E61    add         esp,0FFFFFFF0
 00626E64    mov         ebx,eax
 00626E66    mov         eax,ebx
 00626E68    call        TBalanceBoardObject.Weight
 00626E6D    fstp        qword ptr [esp+8]
 00626E71    wait
 00626E72    fld         qword ptr [esp+8]
 00626E76    fcomp       dword ptr ds:[626EB0];4:Single
 00626E7C    wait
 00626E7D    fnstsw      al
 00626E7F    sahf
>00626E80    jae         00626E8D
 00626E82    xor         eax,eax
 00626E84    mov         dword ptr [esp],eax
 00626E87    mov         dword ptr [esp+4],eax
>00626E8B    jmp         00626EA8
 00626E8D    mov         eax,ebx
 00626E8F    call        TBalanceBoardObject.WeightRight
 00626E94    fdiv        qword ptr [esp+8]
 00626E98    fmul        dword ptr ds:[626EB4];2:Single
 00626E9E    fsub        dword ptr ds:[626EB8];1:Single
 00626EA4    fstp        qword ptr [esp]
 00626EA7    wait
 00626EA8    fld         qword ptr [esp]
 00626EAB    add         esp,10
 00626EAE    pop         ebx
 00626EAF    ret
*}
end;

//00626EBC
function TBalanceBoardObject.JoyY:Double;
begin
{*
 00626EBC    push        ebx
 00626EBD    add         esp,0FFFFFFF0
 00626EC0    mov         ebx,eax
 00626EC2    mov         eax,ebx
 00626EC4    call        TBalanceBoardObject.Weight
 00626EC9    fstp        qword ptr [esp+8]
 00626ECD    wait
 00626ECE    fld         qword ptr [esp+8]
 00626ED2    fcomp       dword ptr ds:[626F0C];4:Single
 00626ED8    wait
 00626ED9    fnstsw      al
 00626EDB    sahf
>00626EDC    jae         00626EE9
 00626EDE    xor         eax,eax
 00626EE0    mov         dword ptr [esp],eax
 00626EE3    mov         dword ptr [esp+4],eax
>00626EE7    jmp         00626F04
 00626EE9    mov         eax,ebx
 00626EEB    call        TBalanceBoardObject.WeightBottom
 00626EF0    fdiv        qword ptr [esp+8]
 00626EF4    fmul        dword ptr ds:[626F10];2:Single
 00626EFA    fsub        dword ptr ds:[626F14];1:Single
 00626F00    fstp        qword ptr [esp]
 00626F03    wait
 00626F04    fld         qword ptr [esp]
 00626F07    add         esp,10
 00626F0A    pop         ebx
 00626F0B    ret
*}
end;

//00626F18
procedure TBalanceBoardObject.ReceiveExpansionData(ExpBytes:TExpBytes);
begin
{*
 00626F18    push        ebx
 00626F19    add         esp,0FFFFFFF8
 00626F1C    movzx       ecx,byte ptr [edx]
 00626F1F    shl         ecx,8
 00626F22    movzx       ebx,byte ptr [edx+1]
 00626F26    or          ecx,ebx
 00626F28    mov         dword ptr [esp],ecx
 00626F2B    fild        dword ptr [esp]
 00626F2E    fstp        qword ptr [eax+90];TBalanceBoardObject.RawTopRight:Double
 00626F34    wait
 00626F35    movzx       ecx,byte ptr [edx+2]
 00626F39    shl         ecx,8
 00626F3C    movzx       ebx,byte ptr [edx+3]
 00626F40    or          ecx,ebx
 00626F42    mov         dword ptr [esp],ecx
 00626F45    fild        dword ptr [esp]
 00626F48    fstp        qword ptr [eax+0A0];TBalanceBoardObject.RawBottomRight:Double
 00626F4E    wait
 00626F4F    movzx       ecx,byte ptr [edx+4]
 00626F53    shl         ecx,8
 00626F56    movzx       ebx,byte ptr [edx+5]
 00626F5A    or          ecx,ebx
 00626F5C    mov         dword ptr [esp],ecx
 00626F5F    fild        dword ptr [esp]
 00626F62    fstp        qword ptr [eax+98];TBalanceBoardObject.RawTopLeft:Double
 00626F68    wait
 00626F69    movzx       ecx,byte ptr [edx+6]
 00626F6D    shl         ecx,8
 00626F70    movzx       ebx,byte ptr [edx+7]
 00626F74    or          ecx,ebx
 00626F76    mov         dword ptr [esp],ecx
 00626F79    fild        dword ptr [esp]
 00626F7C    fstp        qword ptr [eax+0A8];TBalanceBoardObject.RawBottomLeft:Double
 00626F82    wait
 00626F83    movzx       ecx,byte ptr [edx+8]
 00626F87    shl         ecx,8
 00626F8A    movzx       ebx,byte ptr [edx+9]
 00626F8E    add         cx,bx
 00626F91    mov         word ptr [eax+0D0],cx;TBalanceBoardObject.QuestionQuestion:word
 00626F98    movzx       edx,byte ptr [edx+0A]
 00626F9C    mov         byte ptr [eax+0D2],dl;TBalanceBoardObject.EE:byte
 00626FA2    movzx       edx,word ptr [eax+20];TBalanceBoardObject.?f20:word
 00626FA6    mov         dword ptr [esp],edx
 00626FA9    fild        dword ptr [esp]
 00626FAC    fsubr       qword ptr [eax+90];TBalanceBoardObject.RawTopRight:Double
 00626FB2    fmul        qword ptr [eax+30];TBalanceBoardObject.NewtonFormCoefficients:?
 00626FB5    fadd        qword ptr [eax+50];TBalanceBoardObject.?f50:Double
 00626FB8    movzx       edx,word ptr [eax+28];TBalanceBoardObject.?f28:word
 00626FBC    mov         dword ptr [esp+4],edx
 00626FC0    fild        dword ptr [esp+4]
 00626FC4    fsubr       qword ptr [eax+90];TBalanceBoardObject.RawTopRight:Double
 00626FCA    fmulp       st(1),st
 00626FCC    fadd        qword ptr [eax+70];TBalanceBoardObject.?f70:Double
 00626FCF    fstp        qword ptr [eax+0B0];TBalanceBoardObject.WeightTopRight:Double
 00626FD5    wait
 00626FD6    movzx       edx,word ptr [eax+22];TBalanceBoardObject.?f22:word
 00626FDA    mov         dword ptr [esp],edx
 00626FDD    fild        dword ptr [esp]
 00626FE0    fsubr       qword ptr [eax+0A0];TBalanceBoardObject.RawBottomRight:Double
 00626FE6    fmul        qword ptr [eax+38];TBalanceBoardObject.?f38:Double
 00626FE9    fadd        qword ptr [eax+58];TBalanceBoardObject.?f58:Double
 00626FEC    movzx       edx,word ptr [eax+2A];TBalanceBoardObject.?f2A:word
 00626FF0    mov         dword ptr [esp+4],edx
 00626FF4    fild        dword ptr [esp+4]
 00626FF8    fsubr       qword ptr [eax+0A0];TBalanceBoardObject.RawBottomRight:Double
 00626FFE    fmulp       st(1),st
 00627000    fadd        qword ptr [eax+78];TBalanceBoardObject.?f78:Double
 00627003    fstp        qword ptr [eax+0C0];TBalanceBoardObject.WeightBottomRight:Double
 00627009    wait
 0062700A    movzx       edx,word ptr [eax+24];TBalanceBoardObject.?f24:word
 0062700E    mov         dword ptr [esp],edx
 00627011    fild        dword ptr [esp]
 00627014    fsubr       qword ptr [eax+98];TBalanceBoardObject.RawTopLeft:Double
 0062701A    fmul        qword ptr [eax+40];TBalanceBoardObject.?f40:Double
 0062701D    fadd        qword ptr [eax+60];TBalanceBoardObject.?f60:Double
 00627020    movzx       edx,word ptr [eax+2C];TBalanceBoardObject.?f2C:word
 00627024    mov         dword ptr [esp+4],edx
 00627028    fild        dword ptr [esp+4]
 0062702C    fsubr       qword ptr [eax+98];TBalanceBoardObject.RawTopLeft:Double
 00627032    fmulp       st(1),st
 00627034    fadd        qword ptr [eax+80];TBalanceBoardObject.?f80:Double
 0062703A    fstp        qword ptr [eax+0B8];TBalanceBoardObject.WeightTopLeft:Double
 00627040    wait
 00627041    movzx       edx,word ptr [eax+26];TBalanceBoardObject.?f26:word
 00627045    mov         dword ptr [esp],edx
 00627048    fild        dword ptr [esp]
 0062704B    fsubr       qword ptr [eax+0A8];TBalanceBoardObject.RawBottomLeft:Double
 00627051    fmul        qword ptr [eax+48];TBalanceBoardObject.?f48:Double
 00627054    fadd        qword ptr [eax+68];TBalanceBoardObject.?f68:Double
 00627057    movzx       edx,word ptr [eax+2E];TBalanceBoardObject.?f2E:word
 0062705B    mov         dword ptr [esp+4],edx
 0062705F    fild        dword ptr [esp+4]
 00627063    fsubr       qword ptr [eax+0A8];TBalanceBoardObject.RawBottomLeft:Double
 00627069    fmulp       st(1),st
 0062706B    fadd        qword ptr [eax+88];TBalanceBoardObject.?f88:Double
 00627071    fstp        qword ptr [eax+0C8];TBalanceBoardObject.WeightBottomLeft:Double
 00627077    wait
 00627078    pop         ecx
 00627079    pop         edx
 0062707A    pop         ebx
 0062707B    ret
*}
end;

//0062707C
procedure TBalanceBoardObject.SetNumber(Value:Integer);
begin
{*
 0062707C    mov         dword ptr [eax+0C],edx;TBalanceBoardObject.FNumber:Integer
 0062707F    mov         edx,dword ptr [eax+4];TBalanceBoardObject.Wiimote:TWiimoteObject
 00627082    mov         ecx,dword ptr [edx+4];TWiimoteObject.FManager:TComponent
 00627085    cmp         byte ptr [ecx+134],0
>0062708C    je          006270AB
 0062708E    cmp         byte ptr [edx+447],0;TWiimoteObject.FUseExpansion:Boolean
>00627095    je          006270A2
 00627097    mov         eax,edx
 00627099    mov         dl,1
 0062709B    call        TWiimoteObject.SetPlayerLed
>006270A0    jmp         006270AB
 006270A2    mov         eax,edx
 006270A4    xor         edx,edx
 006270A6    call        TWiimoteObject.SetPlayerLed
 006270AB    ret
*}
end;

//006270AC
function TBalanceBoardObject.Weight:Double;
begin
{*
 006270AC    add         esp,0FFFFFFF8
 006270AF    fld         qword ptr [eax+0B0];TBalanceBoardObject.WeightTopRight:Double
 006270B5    fadd        qword ptr [eax+0B8];TBalanceBoardObject.WeightTopLeft:Double
 006270BB    fadd        qword ptr [eax+0C0];TBalanceBoardObject.WeightBottomRight:Double
 006270C1    fadd        qword ptr [eax+0C8];TBalanceBoardObject.WeightBottomLeft:Double
 006270C7    fstp        qword ptr [esp]
 006270CA    wait
 006270CB    fld         qword ptr [esp]
 006270CE    pop         ecx
 006270CF    pop         edx
 006270D0    ret
*}
end;

//006270D4
function TBalanceBoardObject.WeightBottom:Double;
begin
{*
 006270D4    add         esp,0FFFFFFF8
 006270D7    fld         qword ptr [eax+0C0];TBalanceBoardObject.WeightBottomRight:Double
 006270DD    fadd        qword ptr [eax+0C8];TBalanceBoardObject.WeightBottomLeft:Double
 006270E3    fstp        qword ptr [esp]
 006270E6    wait
 006270E7    fld         qword ptr [esp]
 006270EA    pop         ecx
 006270EB    pop         edx
 006270EC    ret
*}
end;

//006270F0
function TBalanceBoardObject.WeightLeft:Double;
begin
{*
 006270F0    add         esp,0FFFFFFF8
 006270F3    fld         qword ptr [eax+0B8];TBalanceBoardObject.WeightTopLeft:Double
 006270F9    fadd        qword ptr [eax+0C8];TBalanceBoardObject.WeightBottomLeft:Double
 006270FF    fstp        qword ptr [esp]
 00627102    wait
 00627103    fld         qword ptr [esp]
 00627106    pop         ecx
 00627107    pop         edx
 00627108    ret
*}
end;

//0062710C
function TBalanceBoardObject.WeightRight:Double;
begin
{*
 0062710C    add         esp,0FFFFFFF8
 0062710F    fld         qword ptr [eax+0B0];TBalanceBoardObject.WeightTopRight:Double
 00627115    fadd        qword ptr [eax+0C0];TBalanceBoardObject.WeightBottomRight:Double
 0062711B    fstp        qword ptr [esp]
 0062711E    wait
 0062711F    fld         qword ptr [esp]
 00627122    pop         ecx
 00627123    pop         edx
 00627124    ret
*}
end;

//00627128
function TBalanceBoardObject.WeightTop:Double;
begin
{*
 00627128    add         esp,0FFFFFFF8
 0062712B    fld         qword ptr [eax+0B8];TBalanceBoardObject.WeightTopLeft:Double
 00627131    fadd        qword ptr [eax+0B0];TBalanceBoardObject.WeightTopRight:Double
 00627137    fstp        qword ptr [esp]
 0062713A    wait
 0062713B    fld         qword ptr [esp]
 0062713E    pop         ecx
 0062713F    pop         edx
 00627140    ret
*}
end;

//00627144
procedure TGuitarObject.Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00627144    mov         byte ptr [eax+8],1;TGuitarObject.Exists:Boolean
 00627148    ret
*}
end;

//0062714C
procedure TGuitarObject.Clear;
begin
{*
 0062714C    mov         byte ptr [eax+8],0;TGuitarObject.Exists:Boolean
 00627150    mov         word ptr [eax+16],0;TGuitarObject.Buttons:word
 00627156    mov         word ptr [eax+10],20;TGuitarObject.Joy1X:SmallInt
 0062715C    mov         word ptr [eax+12],20;TGuitarObject.Joy1Y:SmallInt
 00627162    mov         byte ptr [eax+19],0;TGuitarObject.TF1:Boolean
 00627166    mov         byte ptr [eax+1A],0;TGuitarObject.TF2:Boolean
 0062716A    mov         byte ptr [eax+1B],0;TGuitarObject.TF3:Boolean
 0062716E    mov         byte ptr [eax+1C],0;TGuitarObject.TF4:Boolean
 00627172    mov         byte ptr [eax+1D],0;TGuitarObject.TF5:Boolean
 00627176    mov         byte ptr [eax+18],0;TGuitarObject.FTouch:byte
 0062717A    mov         word ptr [eax+14],0;TGuitarObject.FWhammy:SmallInt
 00627180    ret
*}
end;

//00627184
constructor TGuitarObject.Create(Wiimote:TObject);
begin
{*
 00627184    push        ebx
 00627185    push        esi
 00627186    test        dl,dl
>00627188    je          00627192
 0062718A    add         esp,0FFFFFFF0
 0062718D    call        @ClassCreate
 00627192    mov         ebx,edx
 00627194    mov         esi,eax
 00627196    mov         dword ptr [esi+4],ecx;TGuitarObject.Wiimote:TWiimoteObject
 00627199    mov         eax,esi
 0062719B    call        TGuitarObject.Clear
 006271A0    mov         eax,esi
 006271A2    test        bl,bl
>006271A4    je          006271B5
 006271A6    call        @AfterConstruction
 006271AB    pop         dword ptr fs:[0]
 006271B2    add         esp,0C
 006271B5    mov         eax,esi
 006271B7    pop         esi
 006271B8    pop         ebx
 006271B9    ret
*}
end;

//006271BC
function TGuitarObject.Fret1:Boolean;
begin
{*
 006271BC    test        eax,eax
>006271BE    je          006271C6
 006271C0    test        byte ptr [eax+16],10;TGuitarObject.Buttons:word
>006271C4    jne         006271C9
 006271C6    xor         eax,eax
 006271C8    ret
 006271C9    mov         al,1
 006271CB    ret
*}
end;

//006271CC
function TGuitarObject.Fret2:Boolean;
begin
{*
 006271CC    test        eax,eax
>006271CE    je          006271D6
 006271D0    test        byte ptr [eax+16],40;TGuitarObject.Buttons:word
>006271D4    jne         006271D9
 006271D6    xor         eax,eax
 006271D8    ret
 006271D9    mov         al,1
 006271DB    ret
*}
end;

//006271DC
function TGuitarObject.Fret3:Boolean;
begin
{*
 006271DC    test        eax,eax
>006271DE    je          006271E6
 006271E0    test        byte ptr [eax+16],8;TGuitarObject.Buttons:word
>006271E4    jne         006271E9
 006271E6    xor         eax,eax
 006271E8    ret
 006271E9    mov         al,1
 006271EB    ret
*}
end;

//006271EC
function TGuitarObject.Fret4:Boolean;
begin
{*
 006271EC    test        eax,eax
>006271EE    je          006271F6
 006271F0    test        byte ptr [eax+16],20;TGuitarObject.Buttons:word
>006271F4    jne         006271F9
 006271F6    xor         eax,eax
 006271F8    ret
 006271F9    mov         al,1
 006271FB    ret
*}
end;

//006271FC
function TGuitarObject.Fret5:Boolean;
begin
{*
 006271FC    test        eax,eax
>006271FE    je          00627206
 00627200    test        byte ptr [eax+16],80;TGuitarObject.Buttons:word
>00627204    jne         00627209
 00627206    xor         eax,eax
 00627208    ret
 00627209    mov         al,1
 0062720B    ret
*}
end;

//0062720C
function TGuitarObject.Minus:Boolean;
begin
{*
 0062720C    test        eax,eax
>0062720E    je          00627216
 00627210    test        byte ptr [eax+17],10;TGuitarObject.?f17:byte
>00627214    jne         00627219
 00627216    xor         eax,eax
 00627218    ret
 00627219    mov         al,1
 0062721B    ret
*}
end;

//0062721C
function TGuitarObject.Plus:Boolean;
begin
{*
 0062721C    test        eax,eax
>0062721E    je          00627226
 00627220    test        byte ptr [eax+17],4;TGuitarObject.?f17:byte
>00627224    jne         00627229
 00627226    xor         eax,eax
 00627228    ret
 00627229    mov         al,1
 0062722B    ret
*}
end;

//0062722C
function TGuitarObject.RawTouchBar:Integer;
begin
{*
 0062722C    test        eax,eax
>0062722E    jne         00627233
 00627230    xor         eax,eax
 00627232    ret
 00627233    movzx       eax,byte ptr [eax+18];TGuitarObject.FTouch:byte
 00627237    ret
*}
end;

//00627238
procedure TGuitarObject.ReceiveExpansionData(ExpBytes:TExpBytes);
begin
{*
 00627238    push        ebx
 00627239    movzx       ecx,byte ptr [edx+4]
 0062723D    xor         cl,0FF
 00627240    movzx       ecx,cl
 00627243    shl         ecx,8
 00627246    movzx       ebx,byte ptr [edx+5]
 0062724A    xor         bl,0FF
 0062724D    movzx       ebx,bl
 00627250    add         cx,bx
 00627253    mov         word ptr [eax+16],cx;TGuitarObject.Buttons:word
 00627257    movzx       ecx,byte ptr [edx]
 0062725A    and         cl,3F
 0062725D    movzx       ecx,cl
 00627260    mov         word ptr [eax+10],cx;TGuitarObject.Joy1X:SmallInt
 00627264    movzx       ecx,byte ptr [edx+1]
 00627268    and         cl,3F
 0062726B    movzx       ecx,cl
 0062726E    mov         word ptr [eax+12],cx;TGuitarObject.Joy1Y:SmallInt
 00627272    movzx       ecx,byte ptr [edx]
 00627275    shr         ecx,6
 00627278    movzx       ebx,byte ptr [edx+1]
 0062727C    shr         ebx,6
 0062727F    or          ecx,ebx
 00627281    sete        cl
 00627284    mov         byte ptr [eax+1E],cl;TGuitarObject.IsWorldTour:Boolean
 00627287    movzx       ecx,byte ptr [edx+2]
 0062728B    and         cl,1F
 0062728E    mov         byte ptr [eax+18],cl;TGuitarObject.FTouch:byte
 00627291    mov         byte ptr [eax+19],0;TGuitarObject.TF1:Boolean
 00627295    mov         byte ptr [eax+1A],0;TGuitarObject.TF2:Boolean
 00627299    mov         byte ptr [eax+1B],0;TGuitarObject.TF3:Boolean
 0062729D    mov         byte ptr [eax+1C],0;TGuitarObject.TF4:Boolean
 006272A1    mov         byte ptr [eax+1D],0;TGuitarObject.TF5:Boolean
 006272A5    movzx       ecx,byte ptr [eax+18];TGuitarObject.FTouch:byte
 006272A9    cmp         ecx,1F
>006272AC    ja          00627350
 006272B2    movzx       ecx,byte ptr [ecx+6272C0]
 006272B9    jmp         dword ptr [ecx*4+6272E0]
 006272B9    db          1
 006272B9    db          1
 006272B9    db          1
 006272B9    db          1
 006272B9    db          1
 006272B9    db          1
 006272B9    db          2
 006272B9    db          2
 006272B9    db          2
 006272B9    db          3
 006272B9    db          3
 006272B9    db          3
 006272B9    db          4
 006272B9    db          4
 006272B9    db          4
 006272B9    db          0
 006272B9    db          0
 006272B9    db          6
 006272B9    db          6
 006272B9    db          6
 006272B9    db          7
 006272B9    db          7
 006272B9    db          7
 006272B9    db          8
 006272B9    db          8
 006272B9    db          8
 006272B9    db          9
 006272B9    db          9
 006272B9    db          9
 006272B9    db          10
 006272B9    db          10
 006272B9    db          10
 006272B9    dd          00627350
 006272B9    dd          0062730C
 006272B9    dd          00627312
 006272B9    dd          0062731C
 006272B9    dd          00627322
 006272B9    dd          00627350
 006272B9    dd          0062732C
 006272B9    dd          00627332
 006272B9    dd          0062733C
 006272B9    dd          00627342
 006272B9    dd          0062734C
 0062730C    mov         byte ptr [eax+19],1;TGuitarObject.TF1:Boolean
>00627310    jmp         00627350
 00627312    mov         byte ptr [eax+19],1;TGuitarObject.TF1:Boolean
 00627316    mov         byte ptr [eax+1A],1;TGuitarObject.TF2:Boolean
>0062731A    jmp         00627350
 0062731C    mov         byte ptr [eax+1A],1;TGuitarObject.TF2:Boolean
>00627320    jmp         00627350
 00627322    mov         byte ptr [eax+1A],1;TGuitarObject.TF2:Boolean
 00627326    mov         byte ptr [eax+1B],1;TGuitarObject.TF3:Boolean
>0062732A    jmp         00627350
 0062732C    mov         byte ptr [eax+1B],1;TGuitarObject.TF3:Boolean
>00627330    jmp         00627350
 00627332    mov         byte ptr [eax+1B],1;TGuitarObject.TF3:Boolean
 00627336    mov         byte ptr [eax+1C],1;TGuitarObject.TF4:Boolean
>0062733A    jmp         00627350
 0062733C    mov         byte ptr [eax+1C],1;TGuitarObject.TF4:Boolean
>00627340    jmp         00627350
 00627342    mov         byte ptr [eax+1C],1;TGuitarObject.TF4:Boolean
 00627346    mov         byte ptr [eax+1D],1;TGuitarObject.TF5:Boolean
>0062734A    jmp         00627350
 0062734C    mov         byte ptr [eax+1D],1;TGuitarObject.TF5:Boolean
 00627350    movzx       edx,byte ptr [edx+3]
 00627354    and         dl,1F
 00627357    movzx       edx,dl
 0062735A    mov         word ptr [eax+14],dx;TGuitarObject.FWhammy:SmallInt
 0062735E    pop         ebx
 0062735F    ret
*}
end;

//00627360
procedure TGuitarObject.SetNumber(Value:Integer);
begin
{*
 00627360    push        ebx
 00627361    mov         dword ptr [eax+0C],edx;TGuitarObject.FNumber:Integer
 00627364    mov         ecx,dword ptr [eax+4];TGuitarObject.Wiimote:TWiimoteObject
 00627367    mov         ebx,dword ptr [ecx+4];TWiimoteObject.FManager:TComponent
 0062736A    cmp         byte ptr [ebx+134],0
>00627371    je          0062738E
 00627373    cmp         byte ptr [ecx+447],0;TWiimoteObject.FUseExpansion:Boolean
>0062737A    je          00627385
 0062737C    mov         eax,ecx
 0062737E    call        TWiimoteObject.SetPlayerLed
>00627383    jmp         0062738E
 00627385    xor         edx,edx
 00627387    mov         eax,ecx
 00627389    call        TWiimoteObject.SetPlayerLed
 0062738E    pop         ebx
 0062738F    ret
*}
end;

//00627390
function TGuitarObject.StickX:Double;
begin
{*
 00627390    add         esp,0FFFFFFF4
 00627393    test        eax,eax
>00627395    jne         006273A2
 00627397    xor         eax,eax
 00627399    mov         dword ptr [esp],eax
 0062739C    mov         dword ptr [esp+4],eax
>006273A0    jmp         006273DE
 006273A2    movzx       edx,word ptr [eax+10];TGuitarObject.Joy1X:SmallInt
 006273A6    cmp         dx,20
>006273AA    jl          006273C6
 006273AC    movsx       eax,dx
 006273AF    sub         eax,20
 006273B2    mov         dword ptr [esp+8],eax
 006273B6    fild        dword ptr [esp+8]
 006273BA    fdiv        dword ptr ds:[6273E8];31:Single
 006273C0    fstp        qword ptr [esp]
 006273C3    wait
>006273C4    jmp         006273DE
 006273C6    movsx       eax,dx
 006273C9    sub         eax,20
 006273CC    mov         dword ptr [esp+8],eax
 006273D0    fild        dword ptr [esp+8]
 006273D4    fdiv        dword ptr ds:[6273EC];32:Single
 006273DA    fstp        qword ptr [esp]
 006273DD    wait
 006273DE    fld         qword ptr [esp]
 006273E1    add         esp,0C
 006273E4    ret
*}
end;

//006273F0
function TGuitarObject.StickY:Double;
begin
{*
 006273F0    add         esp,0FFFFFFF4
 006273F3    test        eax,eax
>006273F5    jne         00627402
 006273F7    xor         eax,eax
 006273F9    mov         dword ptr [esp],eax
 006273FC    mov         dword ptr [esp+4],eax
>00627400    jmp         00627442
 00627402    movzx       edx,word ptr [eax+12];TGuitarObject.Joy1Y:SmallInt
 00627406    cmp         dx,20
>0062740A    jl          00627428
 0062740C    movsx       eax,dx
 0062740F    sub         eax,20
 00627412    neg         eax
 00627414    mov         dword ptr [esp+8],eax
 00627418    fild        dword ptr [esp+8]
 0062741C    fdiv        dword ptr ds:[62744C];31:Single
 00627422    fstp        qword ptr [esp]
 00627425    wait
>00627426    jmp         00627442
 00627428    movsx       eax,dx
 0062742B    sub         eax,20
 0062742E    neg         eax
 00627430    mov         dword ptr [esp+8],eax
 00627434    fild        dword ptr [esp+8]
 00627438    fdiv        dword ptr ds:[627450];32:Single
 0062743E    fstp        qword ptr [esp]
 00627441    wait
 00627442    fld         qword ptr [esp]
 00627445    add         esp,0C
 00627448    ret
*}
end;

//00627454
function TGuitarObject.StrumDown:Boolean;
begin
{*
 00627454    test        eax,eax
>00627456    je          0062745E
 00627458    test        byte ptr [eax+17],40;TGuitarObject.?f17:byte
>0062745C    jne         00627461
 0062745E    xor         eax,eax
 00627460    ret
 00627461    mov         al,1
 00627463    ret
*}
end;

//00627464
function TGuitarObject.StrumUp:Boolean;
begin
{*
 00627464    test        eax,eax
>00627466    je          0062746E
 00627468    test        byte ptr [eax+16],1;TGuitarObject.Buttons:word
>0062746C    jne         00627471
 0062746E    xor         eax,eax
 00627470    ret
 00627471    mov         al,1
 00627473    ret
*}
end;

//00627474
function TGuitarObject.TouchBar:Double;
begin
{*
 00627474    add         esp,0FFFFFFF4
 00627477    test        eax,eax
>00627479    jne         00627486
 0062747B    xor         eax,eax
 0062747D    mov         dword ptr [esp],eax
 00627480    mov         dword ptr [esp+4],eax
>00627484    jmp         0062749C
 00627486    movzx       eax,byte ptr [eax+18];TGuitarObject.FTouch:byte
 0062748A    mov         dword ptr [esp+8],eax
 0062748E    fild        dword ptr [esp+8]
 00627492    fdiv        dword ptr ds:[6274A4];31:Single
 00627498    fstp        qword ptr [esp]
 0062749B    wait
 0062749C    fld         qword ptr [esp]
 0062749F    add         esp,0C
 006274A2    ret
*}
end;

//006274A8
function TGuitarObject.TouchFret1:Boolean;
begin
{*
 006274A8    movzx       eax,byte ptr [eax+19];TGuitarObject.TF1:Boolean
 006274AC    ret
*}
end;

//006274B0
function TGuitarObject.TouchFret2:Boolean;
begin
{*
 006274B0    movzx       eax,byte ptr [eax+1A];TGuitarObject.TF2:Boolean
 006274B4    ret
*}
end;

//006274B8
function TGuitarObject.TouchFret3:Boolean;
begin
{*
 006274B8    movzx       eax,byte ptr [eax+1B];TGuitarObject.TF3:Boolean
 006274BC    ret
*}
end;

//006274C0
function TGuitarObject.TouchFret4:Boolean;
begin
{*
 006274C0    movzx       eax,byte ptr [eax+1C];TGuitarObject.TF4:Boolean
 006274C4    ret
*}
end;

//006274C8
function TGuitarObject.TouchFret5:Boolean;
begin
{*
 006274C8    movzx       eax,byte ptr [eax+1D];TGuitarObject.TF5:Boolean
 006274CC    ret
*}
end;

//006274D0
function TGuitarObject.WhammyBar:Double;
begin
{*
 006274D0    add         esp,0FFFFFFF8
 006274D3    test        eax,eax
>006274D5    jne         006274E2
 006274D7    xor         eax,eax
 006274D9    mov         dword ptr [esp],eax
 006274DC    mov         dword ptr [esp+4],eax
>006274E0    jmp         006274EF
 006274E2    fild        word ptr [eax+14];TGuitarObject.FWhammy:SmallInt
 006274E5    fdiv        dword ptr ds:[6274F8];31:Single
 006274EB    fstp        qword ptr [esp]
 006274EE    wait
 006274EF    fld         qword ptr [esp]
 006274F2    pop         ecx
 006274F3    pop         edx
 006274F4    ret
*}
end;

//006274FC
function TDrumsObject.Bass:Boolean;
begin
{*
 006274FC    test        eax,eax
>006274FE    je          00627506
 00627500    test        byte ptr [eax+34],4;TDrumsObject.Buttons:word
>00627504    jne         00627509
 00627506    xor         eax,eax
 00627508    ret
 00627509    mov         al,1
 0062750B    ret
*}
end;

//0062750C
function TDrumsObject.Blue:Boolean;
begin
{*
 0062750C    test        eax,eax
>0062750E    je          00627516
 00627510    test        byte ptr [eax+34],8;TDrumsObject.Buttons:word
>00627514    jne         00627519
 00627516    xor         eax,eax
 00627518    ret
 00627519    mov         al,1
 0062751B    ret
*}
end;

//0062751C
function TDrumsObject.BlueSpeed:Double;
begin
{*
 0062751C    add         esp,0FFFFFFF4
 0062751F    movzx       eax,byte ptr [eax+39];TDrumsObject.FBlueSpeed:byte
 00627523    mov         dword ptr [esp+8],eax
 00627527    fild        dword ptr [esp+8]
 0062752B    fdiv        dword ptr ds:[62753C];7:Single
 00627531    fstp        qword ptr [esp]
 00627534    wait
 00627535    fld         qword ptr [esp]
 00627538    add         esp,0C
 0062753B    ret
*}
end;

//00627540
procedure TDrumsObject.Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00627540    mov         byte ptr [eax+8],1;TDrumsObject.Exists:Boolean
 00627544    ret
*}
end;

//00627548
procedure TDrumsObject.Clear;
begin
{*
 00627548    mov         byte ptr [eax+8],0;TDrumsObject.Exists:Boolean
 0062754C    mov         word ptr [eax+34],0;TDrumsObject.Buttons:word
 00627552    mov         word ptr [eax+10],20;TDrumsObject.Joy1X:SmallInt
 00627558    mov         word ptr [eax+12],20;TDrumsObject.Joy1Y:SmallInt
 0062755E    mov         word ptr [eax+30],0;TDrumsObject.FL:SmallInt
 00627564    mov         word ptr [eax+32],0;TDrumsObject.FR:SmallInt
 0062756A    mov         byte ptr [eax+36],0;TDrumsObject.Which:byte
 0062756E    mov         byte ptr [eax+37],0;TDrumsObject.FSpeed:byte
 00627572    mov         byte ptr [eax+38],0;TDrumsObject.FRedSpeed:byte
 00627576    mov         byte ptr [eax+39],0;TDrumsObject.FBlueSpeed:byte
 0062757A    mov         byte ptr [eax+3A],0;TDrumsObject.FGreenSpeed:byte
 0062757E    mov         byte ptr [eax+3B],0;TDrumsObject.FYellowSpeed:byte
 00627582    mov         byte ptr [eax+3C],0;TDrumsObject.FOrangeSpeed:byte
 00627586    mov         byte ptr [eax+3D],0;TDrumsObject.FPedalSpeed:byte
 0062758A    mov         byte ptr [eax+40],0;TDrumsObject.HasSpeed:Boolean
 0062758E    ret
*}
end;

//00627590
constructor TDrumsObject.Create(Wiimote:TObject);
begin
{*
 00627590    push        ebx
 00627591    push        esi
 00627592    test        dl,dl
>00627594    je          0062759E
 00627596    add         esp,0FFFFFFF0
 00627599    call        @ClassCreate
 0062759E    mov         ebx,edx
 006275A0    mov         esi,eax
 006275A2    mov         dword ptr [esi+4],ecx;TDrumsObject.Wiimote:TWiimoteObject
 006275A5    mov         eax,esi
 006275A7    call        TDrumsObject.Clear
 006275AC    mov         eax,esi
 006275AE    test        bl,bl
>006275B0    je          006275C1
 006275B2    call        @AfterConstruction
 006275B7    pop         dword ptr fs:[0]
 006275BE    add         esp,0C
 006275C1    mov         eax,esi
 006275C3    pop         esi
 006275C4    pop         ebx
 006275C5    ret
*}
end;

//006275C8
function TDrumsObject.Green:Boolean;
begin
{*
 006275C8    test        eax,eax
>006275CA    je          006275D2
 006275CC    test        byte ptr [eax+34],10;TDrumsObject.Buttons:word
>006275D0    jne         006275D5
 006275D2    xor         eax,eax
 006275D4    ret
 006275D5    mov         al,1
 006275D7    ret
*}
end;

//006275D8
function TDrumsObject.GreenSpeed:Double;
begin
{*
 006275D8    add         esp,0FFFFFFF4
 006275DB    movzx       eax,byte ptr [eax+3A];TDrumsObject.FGreenSpeed:byte
 006275DF    mov         dword ptr [esp+8],eax
 006275E3    fild        dword ptr [esp+8]
 006275E7    fdiv        dword ptr ds:[6275F8];7:Single
 006275ED    fstp        qword ptr [esp]
 006275F0    wait
 006275F1    fld         qword ptr [esp]
 006275F4    add         esp,0C
 006275F7    ret
*}
end;

//006275FC
function TDrumsObject.HiHat:Boolean;
begin
{*
 006275FC    test        eax,eax
>006275FE    je          00627606
 00627600    cmp         byte ptr [eax+3F],0;TDrumsObject.HHP:Boolean
>00627604    jne         00627609
 00627606    xor         eax,eax
 00627608    ret
 00627609    mov         al,1
 0062760B    ret
*}
end;

//0062760C
function TDrumsObject.HiHatSpeed:Double;
begin
{*
 0062760C    add         esp,0FFFFFFF4
 0062760F    movzx       eax,byte ptr [eax+3E];TDrumsObject.FHiHatSpeed:byte
 00627613    mov         dword ptr [esp+8],eax
 00627617    fild        dword ptr [esp+8]
 0062761B    fdiv        dword ptr ds:[62762C];7:Single
 00627621    fstp        qword ptr [esp]
 00627624    wait
 00627625    fld         qword ptr [esp]
 00627628    add         esp,0C
 0062762B    ret
*}
end;

//00627630
function TDrumsObject.Minus:Boolean;
begin
{*
 00627630    test        eax,eax
>00627632    je          0062763A
 00627634    test        byte ptr [eax+35],10;TDrumsObject.?f35:byte
>00627638    jne         0062763D
 0062763A    xor         eax,eax
 0062763C    ret
 0062763D    mov         al,1
 0062763F    ret
*}
end;

//00627640
function TDrumsObject.Orange:Boolean;
begin
{*
 00627640    test        eax,eax
>00627642    je          0062764A
 00627644    test        byte ptr [eax+34],80;TDrumsObject.Buttons:word
>00627648    jne         0062764D
 0062764A    xor         eax,eax
 0062764C    ret
 0062764D    mov         al,1
 0062764F    ret
*}
end;

//00627650
function TDrumsObject.OrangeSpeed:Double;
begin
{*
 00627650    add         esp,0FFFFFFF4
 00627653    movzx       eax,byte ptr [eax+3C];TDrumsObject.FOrangeSpeed:byte
 00627657    mov         dword ptr [esp+8],eax
 0062765B    fild        dword ptr [esp+8]
 0062765F    fdiv        dword ptr ds:[627670];7:Single
 00627665    fstp        qword ptr [esp]
 00627668    wait
 00627669    fld         qword ptr [esp]
 0062766C    add         esp,0C
 0062766F    ret
*}
end;

//00627674
function TDrumsObject.PedalSpeed:Double;
begin
{*
 00627674    add         esp,0FFFFFFF4
 00627677    movzx       eax,byte ptr [eax+3D];TDrumsObject.FPedalSpeed:byte
 0062767B    mov         dword ptr [esp+8],eax
 0062767F    fild        dword ptr [esp+8]
 00627683    fdiv        dword ptr ds:[627694];7:Single
 00627689    fstp        qword ptr [esp]
 0062768C    wait
 0062768D    fld         qword ptr [esp]
 00627690    add         esp,0C
 00627693    ret
*}
end;

//00627698
function TDrumsObject.Plus:Boolean;
begin
{*
 00627698    test        eax,eax
>0062769A    je          006276A2
 0062769C    test        byte ptr [eax+35],4;TDrumsObject.?f35:byte
>006276A0    jne         006276A5
 006276A2    xor         eax,eax
 006276A4    ret
 006276A5    mov         al,1
 006276A7    ret
*}
end;

//006276A8
procedure TDrumsObject.ReceiveExpansionData(ExpBytes:TExpBytes);
begin
{*
 006276A8    push        ebp
 006276A9    mov         ebp,esp
 006276AB    push        0
 006276AD    push        0
 006276AF    push        ebx
 006276B0    push        esi
 006276B1    mov         esi,edx
 006276B3    mov         ebx,eax
 006276B5    xor         eax,eax
 006276B7    push        ebp
 006276B8    push        627810
 006276BD    push        dword ptr fs:[eax]
 006276C0    mov         dword ptr fs:[eax],esp
 006276C3    movzx       eax,byte ptr [esi+4]
 006276C7    xor         al,0FF
 006276C9    movzx       eax,al
 006276CC    shl         eax,8
 006276CF    movzx       edx,byte ptr [esi+5]
 006276D3    xor         dl,0FF
 006276D6    movzx       edx,dl
 006276D9    add         ax,dx
 006276DC    mov         word ptr [ebx+34],ax;TDrumsObject.Buttons:word
 006276E0    test        byte ptr [esi+2],80
 006276E4    sete        al
 006276E7    mov         byte ptr [ebx+3F],al;TDrumsObject.HHP:Boolean
 006276EA    movzx       eax,byte ptr [esi]
 006276ED    and         al,3F
 006276EF    movzx       eax,al
 006276F2    mov         word ptr [ebx+10],ax;TDrumsObject.Joy1X:SmallInt
 006276F6    movzx       eax,byte ptr [esi+1]
 006276FA    and         al,3F
 006276FC    movzx       eax,al
 006276FF    mov         word ptr [ebx+12],ax;TDrumsObject.Joy1Y:SmallInt
 00627703    cmp         byte ptr [esi+2],0FF
>00627707    jne         00627713
 00627709    cmp         byte ptr [esi+3],0FF
>0062770D    jne         00627713
 0062770F    xor         eax,eax
>00627711    jmp         00627715
 00627713    mov         al,1
 00627715    mov         byte ptr [ebx+40],al;TDrumsObject.HasSpeed:Boolean
 00627718    mov         byte ptr [ebx+38],0;TDrumsObject.FRedSpeed:byte
 0062771C    mov         byte ptr [ebx+39],0;TDrumsObject.FBlueSpeed:byte
 00627720    mov         byte ptr [ebx+3A],0;TDrumsObject.FGreenSpeed:byte
 00627724    mov         byte ptr [ebx+3B],0;TDrumsObject.FYellowSpeed:byte
 00627728    mov         byte ptr [ebx+3C],0;TDrumsObject.FOrangeSpeed:byte
 0062772C    mov         byte ptr [ebx+3D],0;TDrumsObject.FPedalSpeed:byte
 00627730    cmp         byte ptr [ebx+40],0;TDrumsObject.HasSpeed:Boolean
>00627734    je          006277ED
 0062773A    movzx       eax,byte ptr [esi+2]
 0062773E    shr         eax,1
 00627740    and         al,1F
 00627742    mov         byte ptr [ebx+36],al;TDrumsObject.Which:byte
 00627745    movzx       eax,byte ptr [esi+3]
 00627749    shr         eax,5
 0062774C    push        eax
 0062774D    mov         al,7
 0062774F    pop         edx
 00627750    sub         al,dl
 00627752    mov         byte ptr [ebx+37],al;TDrumsObject.FSpeed:byte
 00627755    movzx       edx,byte ptr [ebx+36];TDrumsObject.Which:byte
 00627759    add         edx,0FFFFFFF2
 0062775C    cmp         edx,0D
>0062775F    ja          006277C2
 00627761    movzx       edx,byte ptr [edx+62776F]
 00627768    jmp         dword ptr [edx*4+62777D]
 00627768    db          5
 00627768    db          4
 00627768    db          0
 00627768    db          3
 00627768    db          6
 00627768    db          0
 00627768    db          0
 00627768    db          0
 00627768    db          0
 00627768    db          0
 00627768    db          0
 00627768    db          2
 00627768    db          0
 00627768    db          1
 00627768    dd          006277C2
 00627768    dd          00627799
 00627768    dd          006277A9
 00627768    dd          006277AE
 00627768    dd          006277B3
 00627768    dd          006277B8
 00627768    dd          006277BD
 00627799    cmp         byte ptr [ebx+3F],0;TDrumsObject.HHP:Boolean
>0062779D    je          006277A4
 0062779F    mov         byte ptr [ebx+3E],al;TDrumsObject.FHiHatSpeed:byte
>006277A2    jmp         006277F5
 006277A4    mov         byte ptr [ebx+3D],al;TDrumsObject.FPedalSpeed:byte
>006277A7    jmp         006277F5
 006277A9    mov         byte ptr [ebx+38],al;TDrumsObject.FRedSpeed:byte
>006277AC    jmp         006277F5
 006277AE    mov         byte ptr [ebx+3B],al;TDrumsObject.FYellowSpeed:byte
>006277B1    jmp         006277F5
 006277B3    mov         byte ptr [ebx+39],al;TDrumsObject.FBlueSpeed:byte
>006277B6    jmp         006277F5
 006277B8    mov         byte ptr [ebx+3C],al;TDrumsObject.FOrangeSpeed:byte
>006277BB    jmp         006277F5
 006277BD    mov         byte ptr [ebx+3A],al;TDrumsObject.FGreenSpeed:byte
>006277C0    jmp         006277F5
 006277C2    lea         ecx,[ebp-8]
 006277C5    movzx       eax,byte ptr [ebx+36];TDrumsObject.Which:byte
 006277C9    mov         edx,2
 006277CE    call        IntToHex
 006277D3    mov         ecx,dword ptr [ebp-8]
 006277D6    lea         eax,[ebp-4]
 006277D9    mov         edx,62782C;'Drums: Unexpected "Which" value: 0x'
 006277DE    call        @UStrCat3
 006277E3    mov         eax,dword ptr [ebp-4]
 006277E6    call        004FA048
>006277EB    jmp         006277F5
 006277ED    mov         byte ptr [ebx+36],0;TDrumsObject.Which:byte
 006277F1    mov         byte ptr [ebx+37],0;TDrumsObject.FSpeed:byte
 006277F5    xor         eax,eax
 006277F7    pop         edx
 006277F8    pop         ecx
 006277F9    pop         ecx
 006277FA    mov         dword ptr fs:[eax],edx
 006277FD    push        627817
 00627802    lea         eax,[ebp-8]
 00627805    mov         edx,2
 0062780A    call        @UStrArrayClr
 0062780F    ret
>00627810    jmp         @HandleFinally
>00627815    jmp         00627802
 00627817    pop         esi
 00627818    pop         ebx
 00627819    pop         ecx
 0062781A    pop         ecx
 0062781B    pop         ebp
 0062781C    ret
*}
end;

//00627874
function TDrumsObject.Red:Boolean;
begin
{*
 00627874    test        eax,eax
>00627876    je          0062787E
 00627878    test        byte ptr [eax+34],40;TDrumsObject.Buttons:word
>0062787C    jne         00627881
 0062787E    xor         eax,eax
 00627880    ret
 00627881    mov         al,1
 00627883    ret
*}
end;

//00627884
function TDrumsObject.RedSpeed:Double;
begin
{*
 00627884    add         esp,0FFFFFFF4
 00627887    movzx       eax,byte ptr [eax+38];TDrumsObject.FRedSpeed:byte
 0062788B    mov         dword ptr [esp+8],eax
 0062788F    fild        dword ptr [esp+8]
 00627893    fdiv        dword ptr ds:[6278A4];7:Single
 00627899    fstp        qword ptr [esp]
 0062789C    wait
 0062789D    fld         qword ptr [esp]
 006278A0    add         esp,0C
 006278A3    ret
*}
end;

//006278A8
procedure TDrumsObject.SetNumber(Value:Integer);
begin
{*
 006278A8    push        ebx
 006278A9    mov         dword ptr [eax+0C],edx;TDrumsObject.FNumber:Integer
 006278AC    mov         ecx,dword ptr [eax+4];TDrumsObject.Wiimote:TWiimoteObject
 006278AF    mov         ebx,dword ptr [ecx+4];TWiimoteObject.FManager:TComponent
 006278B2    cmp         byte ptr [ebx+134],0
>006278B9    je          006278D6
 006278BB    cmp         byte ptr [ecx+447],0;TWiimoteObject.FUseExpansion:Boolean
>006278C2    je          006278CD
 006278C4    mov         eax,ecx
 006278C6    call        TWiimoteObject.SetPlayerLed
>006278CB    jmp         006278D6
 006278CD    xor         edx,edx
 006278CF    mov         eax,ecx
 006278D1    call        TWiimoteObject.SetPlayerLed
 006278D6    pop         ebx
 006278D7    ret
*}
end;

//006278D8
procedure TDrumsObject.Speed;
begin
{*
 006278D8    add         esp,0FFFFFFF4
 006278DB    movzx       eax,byte ptr [eax+37];TDrumsObject.FSpeed:byte
 006278DF    mov         dword ptr [esp+8],eax
 006278E3    fild        dword ptr [esp+8]
 006278E7    fdiv        dword ptr ds:[6278F8];7:Single
 006278ED    fstp        qword ptr [esp]
 006278F0    wait
 006278F1    fld         qword ptr [esp]
 006278F4    add         esp,0C
 006278F7    ret
*}
end;

//006278FC
function TDrumsObject.StickX:Double;
begin
{*
 006278FC    add         esp,0FFFFFFF4
 006278FF    test        eax,eax
>00627901    jne         0062790E
 00627903    xor         eax,eax
 00627905    mov         dword ptr [esp],eax
 00627908    mov         dword ptr [esp+4],eax
>0062790C    jmp         0062794A
 0062790E    movzx       edx,word ptr [eax+10];TDrumsObject.Joy1X:SmallInt
 00627912    cmp         dx,20
>00627916    jl          00627932
 00627918    movsx       eax,dx
 0062791B    sub         eax,20
 0062791E    mov         dword ptr [esp+8],eax
 00627922    fild        dword ptr [esp+8]
 00627926    fdiv        dword ptr ds:[627954];31:Single
 0062792C    fstp        qword ptr [esp]
 0062792F    wait
>00627930    jmp         0062794A
 00627932    movsx       eax,dx
 00627935    sub         eax,20
 00627938    mov         dword ptr [esp+8],eax
 0062793C    fild        dword ptr [esp+8]
 00627940    fdiv        dword ptr ds:[627958];32:Single
 00627946    fstp        qword ptr [esp]
 00627949    wait
 0062794A    fld         qword ptr [esp]
 0062794D    add         esp,0C
 00627950    ret
*}
end;

//0062795C
function TDrumsObject.StickY:Double;
begin
{*
 0062795C    add         esp,0FFFFFFF4
 0062795F    test        eax,eax
>00627961    jne         0062796E
 00627963    xor         eax,eax
 00627965    mov         dword ptr [esp],eax
 00627968    mov         dword ptr [esp+4],eax
>0062796C    jmp         006279AE
 0062796E    movzx       edx,word ptr [eax+12];TDrumsObject.Joy1Y:SmallInt
 00627972    cmp         dx,20
>00627976    jl          00627994
 00627978    movsx       eax,dx
 0062797B    sub         eax,20
 0062797E    neg         eax
 00627980    mov         dword ptr [esp+8],eax
 00627984    fild        dword ptr [esp+8]
 00627988    fdiv        dword ptr ds:[6279B8];31:Single
 0062798E    fstp        qword ptr [esp]
 00627991    wait
>00627992    jmp         006279AE
 00627994    movsx       eax,dx
 00627997    sub         eax,20
 0062799A    neg         eax
 0062799C    mov         dword ptr [esp+8],eax
 006279A0    fild        dword ptr [esp+8]
 006279A4    fdiv        dword ptr ds:[6279BC];32:Single
 006279AA    fstp        qword ptr [esp]
 006279AD    wait
 006279AE    fld         qword ptr [esp]
 006279B1    add         esp,0C
 006279B4    ret
*}
end;

//006279C0
function TDrumsObject.StrumDown:Boolean;
begin
{*
 006279C0    test        eax,eax
>006279C2    je          006279CA
 006279C4    test        byte ptr [eax+35],40;TDrumsObject.?f35:byte
>006279C8    jne         006279CD
 006279CA    xor         eax,eax
 006279CC    ret
 006279CD    mov         al,1
 006279CF    ret
*}
end;

//006279D0
function TDrumsObject.StrumUp:Boolean;
begin
{*
 006279D0    test        eax,eax
>006279D2    je          006279DA
 006279D4    test        byte ptr [eax+34],1;TDrumsObject.Buttons:word
>006279D8    jne         006279DD
 006279DA    xor         eax,eax
 006279DC    ret
 006279DD    mov         al,1
 006279DF    ret
*}
end;

//006279E0
procedure TDrumsObject.WhammyBar;
begin
{*
 006279E0    add         esp,0FFFFFFF8
 006279E3    test        eax,eax
>006279E5    jne         006279F2
 006279E7    xor         eax,eax
 006279E9    mov         dword ptr [esp],eax
 006279EC    mov         dword ptr [esp+4],eax
>006279F0    jmp         006279FF
 006279F2    fild        word ptr [eax+32];TDrumsObject.FR:SmallInt
 006279F5    fdiv        dword ptr ds:[627A08];31:Single
 006279FB    fstp        qword ptr [esp]
 006279FE    wait
 006279FF    fld         qword ptr [esp]
 00627A02    pop         ecx
 00627A03    pop         edx
 00627A04    ret
*}
end;

//00627A0C
function TDrumsObject.Yellow:Boolean;
begin
{*
 00627A0C    test        eax,eax
>00627A0E    je          00627A16
 00627A10    test        byte ptr [eax+34],20;TDrumsObject.Buttons:word
>00627A14    jne         00627A19
 00627A16    xor         eax,eax
 00627A18    ret
 00627A19    mov         al,1
 00627A1B    ret
*}
end;

//00627A1C
function TDrumsObject.YellowSpeed:Double;
begin
{*
 00627A1C    add         esp,0FFFFFFF4
 00627A1F    movzx       eax,byte ptr [eax+3B];TDrumsObject.FYellowSpeed:byte
 00627A23    mov         dword ptr [esp+8],eax
 00627A27    fild        dword ptr [esp+8]
 00627A2B    fdiv        dword ptr ds:[627A3C];7:Single
 00627A31    fstp        qword ptr [esp]
 00627A34    wait
 00627A35    fld         qword ptr [esp]
 00627A38    add         esp,0C
 00627A3B    ret
*}
end;

//00627A40
procedure TMotionPlusObject.Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00627A40    add         edx,5
 00627A43    add         eax,0A;TMotionPlusObject.Calib:?
 00627A46    mov         ecx,10
 00627A4B    xchg        eax,edx
 00627A4C    call        Move
 00627A51    ret
*}
end;

//00627A54
procedure TMotionPlusObject.Calibrate2(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00627A54    push        ebx
 00627A55    mov         ebx,eax
 00627A57    lea         eax,[edx+5]
 00627A5A    lea         edx,[ebx+1A];TMotionPlusObject.?f1A:?
 00627A5D    mov         ecx,10
 00627A62    call        Move
 00627A67    mov         eax,dword ptr [ebx+4];TMotionPlusObject.Wiimote:TWiimoteObject
 00627A6A    call        TAccelerometerObject.ResetGyroCalibration
 00627A6F    pop         ebx
 00627A70    ret
*}
end;

//00627A74
procedure TMotionPlusObject.Clear;
begin
{*
 00627A74    mov         byte ptr [eax+8],0;TMotionPlusObject.Exists:Boolean
 00627A78    mov         edx,dword ptr [eax+4];TMotionPlusObject.Wiimote:TWiimoteObject
 00627A7B    mov         byte ptr [edx+148],0;TWiimoteObject.HasGyros:Boolean
 00627A82    xor         ecx,ecx
 00627A84    mov         dword ptr [edx+3C8],ecx;TWiimoteObject.Yaw:Double
 00627A8A    mov         dword ptr [edx+3CC],ecx;TWiimoteObject.?f3CC:dword
 00627A90    xor         ecx,ecx
 00627A92    mov         dword ptr [edx+168],ecx;TWiimoteObject.YawSpeed:Double
 00627A98    mov         dword ptr [edx+16C],ecx;TWiimoteObject.?f16C:dword
 00627A9E    xor         ecx,ecx
 00627AA0    mov         dword ptr [edx+170],ecx;TWiimoteObject.PitchSpeed:Double
 00627AA6    mov         dword ptr [edx+174],ecx;TWiimoteObject.?f174:dword
 00627AAC    xor         ecx,ecx
 00627AAE    mov         dword ptr [edx+178],ecx;TWiimoteObject.RollSpeed:Double
 00627AB4    mov         dword ptr [edx+17C],ecx;TWiimoteObject.?f17C:dword
 00627ABA    mov         ecx,dword ptr [edx+180];TWiimoteObject.ZeroYawSpeed:Double
 00627AC0    mov         dword ptr [edx+150],ecx;TWiimoteObject.RawGyroYaw:Double
 00627AC6    mov         ecx,dword ptr [edx+184];TWiimoteObject.?f184:dword
 00627ACC    mov         dword ptr [edx+154],ecx;TWiimoteObject.?f154:dword
 00627AD2    mov         ecx,dword ptr [edx+188];TWiimoteObject.ZeroPitchSpeed:Double
 00627AD8    mov         dword ptr [edx+158],ecx;TWiimoteObject.RawGyroPitch:Double
 00627ADE    mov         ecx,dword ptr [edx+18C];TWiimoteObject.?f18C:dword
 00627AE4    mov         dword ptr [edx+15C],ecx;TWiimoteObject.?f15C:dword
 00627AEA    mov         eax,dword ptr [edx+190];TWiimoteObject.ZeroRollSpeed:Double
 00627AF0    mov         dword ptr [edx+160],eax;TWiimoteObject.RawGyroRoll:Double
 00627AF6    mov         eax,dword ptr [edx+194];TWiimoteObject.?f194:dword
 00627AFC    mov         dword ptr [edx+164],eax;TWiimoteObject.?f164:dword
 00627B02    ret
*}
end;

//00627B04
constructor TMotionPlusObject.Create(Wiimote:TObject);
begin
{*
 00627B04    test        dl,dl
>00627B06    je          00627B10
 00627B08    add         esp,0FFFFFFF0
 00627B0B    call        @ClassCreate
 00627B10    mov         dword ptr [eax+4],ecx;TMotionPlusObject.Wiimote:TWiimoteObject
 00627B13    test        dl,dl
>00627B15    je          00627B26
 00627B17    call        @AfterConstruction
 00627B1C    pop         dword ptr fs:[0]
 00627B23    add         esp,0C
 00627B26    ret
*}
end;

//00627B28
procedure TMotionPlusObject.ReceiveExpansionData(ExpBytes:TExpBytes);
begin
{*
 00627B28    push        ebx
 00627B29    push        esi
 00627B2A    push        ecx
 00627B2B    mov         ebx,eax
 00627B2D    cmp         byte ptr [ebx+9],0;TMotionPlusObject.Active:Boolean
>00627B31    je          00627C4E
 00627B37    movzx       eax,byte ptr [edx+5]
 00627B3B    test        al,2
>00627B3D    je          00627C4E
 00627B43    test        al,1
>00627B45    jne         00627C4E
 00627B4B    movzx       eax,byte ptr [edx+3]
 00627B4F    and         al,0FC
 00627B51    movzx       eax,al
 00627B54    shl         eax,6
 00627B57    movzx       ecx,byte ptr [edx]
 00627B5A    or          eax,ecx
 00627B5C    mov         dword ptr [esp],eax
 00627B5F    fild        dword ptr [esp]
 00627B62    fstp        qword ptr [ebx+0B0];TMotionPlusObject.A:Double
 00627B68    wait
 00627B69    movzx       eax,byte ptr [edx+4]
 00627B6D    and         al,0FC
 00627B6F    movzx       eax,al
 00627B72    shl         eax,6
 00627B75    movzx       ecx,byte ptr [edx+1]
 00627B79    or          eax,ecx
 00627B7B    mov         dword ptr [esp],eax
 00627B7E    fild        dword ptr [esp]
 00627B81    fstp        qword ptr [ebx+0B8];TMotionPlusObject.B:Double
 00627B87    wait
 00627B88    movzx       eax,byte ptr [edx+5]
 00627B8C    and         al,0FC
 00627B8E    movzx       eax,al
 00627B91    shl         eax,6
 00627B94    movzx       ecx,byte ptr [edx+2]
 00627B98    or          eax,ecx
 00627B9A    mov         dword ptr [esp],eax
 00627B9D    fild        dword ptr [esp]
 00627BA0    fstp        qword ptr [ebx+0C0];TMotionPlusObject.C:Double
 00627BA6    wait
 00627BA7    test        byte ptr [edx+3],2
 00627BAB    sete        al
 00627BAE    mov         esi,dword ptr [ebx+4];TMotionPlusObject.Wiimote:TWiimoteObject
 00627BB1    mov         byte ptr [esi+218],al;TWiimoteObject.FastYaw:Boolean
 00627BB7    test        byte ptr [edx+3],1
 00627BBB    sete        al
 00627BBE    mov         byte ptr [esi+219],al;TWiimoteObject.FastPitch:Boolean
 00627BC4    test        byte ptr [edx+4],2
 00627BC8    sete        al
 00627BCB    mov         byte ptr [esi+21A],al;TWiimoteObject.FastRoll:Boolean
 00627BD1    movzx       eax,byte ptr [esi+4AC];TWiimoteObject.MotionPlusHasExpansion:Boolean
 00627BD8    test        byte ptr [edx+4],1
 00627BDC    setne       dl
 00627BDF    mov         byte ptr [esi+4AC],dl;TWiimoteObject.MotionPlusHasExpansion:Boolean
 00627BE5    test        al,al
>00627BE7    je          00627BFF
 00627BE9    mov         edx,dword ptr [ebx+4];TMotionPlusObject.Wiimote:TWiimoteObject
 00627BEC    cmp         byte ptr [edx+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>00627BF3    jne         00627BFF
 00627BF5    mov         eax,dword ptr [ebx+4];TMotionPlusObject.Wiimote:TWiimoteObject
 00627BF8    call        00623F5C
>00627BFD    jmp         00627C16
 00627BFF    mov         edx,dword ptr [ebx+4];TMotionPlusObject.Wiimote:TWiimoteObject
 00627C02    cmp         byte ptr [edx+4AC],0;TWiimoteObject.MotionPlusHasExpansion:Boolean
>00627C09    je          00627C16
 00627C0B    test        al,al
>00627C0D    jne         00627C16
 00627C0F    mov         eax,edx
 00627C11    call        006207EC
 00627C16    push        dword ptr [ebx+0B4];TMotionPlusObject.?fB4:dword
 00627C1C    push        dword ptr [ebx+0B0];TMotionPlusObject.A:Double
 00627C22    push        dword ptr [ebx+0C4];TMotionPlusObject.?fC4:dword
 00627C28    push        dword ptr [ebx+0C0];TMotionPlusObject.C:Double
 00627C2E    push        dword ptr [ebx+0BC];TMotionPlusObject.?fBC:dword
 00627C34    push        dword ptr [ebx+0B8];TMotionPlusObject.B:Double
 00627C3A    call        00600EA0
 00627C3F    add         esp,0FFFFFFF8
 00627C42    fstp        qword ptr [esp]
 00627C45    wait
 00627C46    mov         eax,dword ptr [ebx+4];TMotionPlusObject.Wiimote:TWiimoteObject
 00627C49    call        TAccelerometerObject.UpdateGyros
 00627C4E    pop         edx
 00627C4F    pop         esi
 00627C50    pop         ebx
 00627C51    ret
*}
end;

//00627C54
procedure TTurntableObject.Calibrate(Report:PByteArray; AlreadyDecoded:Boolean);
begin
{*
 00627C54    mov         byte ptr [eax+8],1;TTurntableObject.Exists:Boolean
 00627C58    ret
*}
end;

//00627C5C
procedure TTurntableObject.Clear;
begin
{*
 00627C5C    mov         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
 00627C60    mov         word ptr [eax+10],20;TTurntableObject.Joy1X:SmallInt
 00627C66    mov         word ptr [eax+12],20;TTurntableObject.Joy1Y:SmallInt
 00627C6C    mov         word ptr [eax+14],100;TTurntableObject.Buttons:word
 00627C72    mov         byte ptr [eax+17],0;TTurntableObject.ED:byte
 00627C76    mov         byte ptr [eax+16],10;TTurntableObject.CS:byte
 00627C7A    mov         byte ptr [eax+18],0;TTurntableObject.LTT:byte
 00627C7E    mov         byte ptr [eax+19],0;TTurntableObject.RTT:byte
 00627C82    ret
*}
end;

//00627C84
constructor TTurntableObject.Create(Wiimote:TObject);
begin
{*
 00627C84    push        ebx
 00627C85    push        esi
 00627C86    test        dl,dl
>00627C88    je          00627C92
 00627C8A    add         esp,0FFFFFFF0
 00627C8D    call        @ClassCreate
 00627C92    mov         ebx,edx
 00627C94    mov         esi,eax
 00627C96    mov         dword ptr [esi+4],ecx;TTurntableObject.Wiimote:TWiimoteObject
 00627C99    mov         eax,esi
 00627C9B    call        TTurntableObject.Clear
 00627CA0    mov         eax,esi
 00627CA2    test        bl,bl
>00627CA4    je          00627CB5
 00627CA6    call        @AfterConstruction
 00627CAB    pop         dword ptr fs:[0]
 00627CB2    add         esp,0C
 00627CB5    mov         eax,esi
 00627CB7    pop         esi
 00627CB8    pop         ebx
 00627CB9    ret
*}
end;

//00627CBC
function TTurntableObject.CrossFade:Double;
begin
{*
 00627CBC    add         esp,0FFFFFFF4
 00627CBF    movzx       eax,byte ptr [eax+16];TTurntableObject.CS:byte
 00627CC3    mov         dword ptr [esp+8],eax
 00627CC7    fild        dword ptr [esp+8]
 00627CCB    fdiv        dword ptr ds:[627CE8];31:Single
 00627CD1    fmul        dword ptr ds:[627CEC];2:Single
 00627CD7    fsub        dword ptr ds:[627CF0];1:Single
 00627CDD    fstp        qword ptr [esp]
 00627CE0    wait
 00627CE1    fld         qword ptr [esp]
 00627CE4    add         esp,0C
 00627CE7    ret
*}
end;

//00627CF4
function TTurntableObject.EffectDial:Double;
begin
{*
 00627CF4    add         esp,0FFFFFFF4
 00627CF7    movzx       eax,byte ptr [eax+17];TTurntableObject.ED:byte
 00627CFB    mov         dword ptr [esp+8],eax
 00627CFF    fild        dword ptr [esp+8]
 00627D03    fdiv        dword ptr ds:[627D14];31:Single
 00627D09    fstp        qword ptr [esp]
 00627D0C    wait
 00627D0D    fld         qword ptr [esp]
 00627D10    add         esp,0C
 00627D13    ret
*}
end;

//00627D18
function TTurntableObject.Euphoria:Boolean;
begin
{*
 00627D18    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627D1C    je          00627D24
 00627D1E    test        byte ptr [eax+14],10;TTurntableObject.Buttons:word
>00627D22    jne         00627D27
 00627D24    xor         eax,eax
 00627D26    ret
 00627D27    mov         al,1
 00627D29    ret
*}
end;

//00627D2C
function TTurntableObject.LeftBlue:Boolean;
begin
{*
 00627D2C    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627D30    je          00627D38
 00627D32    test        byte ptr [eax+14],80;TTurntableObject.Buttons:word
>00627D36    jne         00627D3B
 00627D38    xor         eax,eax
 00627D3A    ret
 00627D3B    mov         al,1
 00627D3D    ret
*}
end;

//00627D40
function TTurntableObject.LeftGreen:Boolean;
begin
{*
 00627D40    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627D44    je          00627D4C
 00627D46    test        byte ptr [eax+14],8;TTurntableObject.Buttons:word
>00627D4A    jne         00627D4F
 00627D4C    xor         eax,eax
 00627D4E    ret
 00627D4F    mov         al,1
 00627D51    ret
*}
end;

//00627D54
function TTurntableObject.LeftRed:Boolean;
begin
{*
 00627D54    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627D58    je          00627D60
 00627D5A    test        byte ptr [eax+15],20;TTurntableObject.?f15:byte
>00627D5E    jne         00627D63
 00627D60    xor         eax,eax
 00627D62    ret
 00627D63    mov         al,1
 00627D65    ret
*}
end;

//00627D68
function TTurntableObject.Minus:Boolean;
begin
{*
 00627D68    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627D6C    je          00627D74
 00627D6E    test        byte ptr [eax+15],10;TTurntableObject.?f15:byte
>00627D72    jne         00627D77
 00627D74    xor         eax,eax
 00627D76    ret
 00627D77    mov         al,1
 00627D79    ret
*}
end;

//00627D7C
function TTurntableObject.Plus:Boolean;
begin
{*
 00627D7C    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627D80    je          00627D88
 00627D82    test        byte ptr [eax+15],4;TTurntableObject.?f15:byte
>00627D86    jne         00627D8B
 00627D88    xor         eax,eax
 00627D8A    ret
 00627D8B    mov         al,1
 00627D8D    ret
*}
end;

//00627D90
function TTurntableObject.QuestionQuestion:Boolean;
begin
{*
 00627D90    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627D94    je          00627D9C
 00627D96    test        byte ptr [eax+15],1;TTurntableObject.?f15:byte
>00627D9A    jne         00627D9F
 00627D9C    xor         eax,eax
 00627D9E    ret
 00627D9F    mov         al,1
 00627DA1    ret
*}
end;

//00627DA4
function TTurntableObject.RawLeftTurntable:Integer;
begin
{*
 00627DA4    movzx       eax,byte ptr [eax+18];TTurntableObject.LTT:byte
 00627DA8    ret
*}
end;

//00627DAC
function TTurntableObject.RawRightTurntable:Integer;
begin
{*
 00627DAC    movzx       eax,byte ptr [eax+19];TTurntableObject.RTT:byte
 00627DB0    ret
*}
end;

//00627DB4
procedure TTurntableObject.ReceiveExpansionData(ExpBytes:TExpBytes);
begin
{*
 00627DB4    push        ebx
 00627DB5    movzx       ecx,byte ptr [edx+4]
 00627DB9    xor         cl,0FF
 00627DBC    movzx       ecx,cl
 00627DBF    shl         ecx,8
 00627DC2    movzx       ebx,byte ptr [edx+5]
 00627DC6    xor         bl,0FF
 00627DC9    movzx       ebx,bl
 00627DCC    add         cx,bx
 00627DCF    mov         word ptr [eax+14],cx;TTurntableObject.Buttons:word
 00627DD3    movzx       ecx,byte ptr [edx]
 00627DD6    and         cl,3F
 00627DD9    movzx       ecx,cl
 00627DDC    mov         word ptr [eax+10],cx;TTurntableObject.Joy1X:SmallInt
 00627DE0    movzx       edx,byte ptr [edx+1]
 00627DE4    and         dl,3F
 00627DE7    movzx       edx,dl
 00627DEA    mov         word ptr [eax+12],dx;TTurntableObject.Joy1Y:SmallInt
 00627DEE    pop         ebx
 00627DEF    ret
*}
end;

//00627DF0
function TTurntableObject.RightBlue:Boolean;
begin
{*
 00627DF0    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627DF4    je          00627DFC
 00627DF6    test        byte ptr [eax+14],4;TTurntableObject.Buttons:word
>00627DFA    jne         00627DFF
 00627DFC    xor         eax,eax
 00627DFE    ret
 00627DFF    mov         al,1
 00627E01    ret
*}
end;

//00627E04
function TTurntableObject.RightGreen:Boolean;
begin
{*
 00627E04    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627E08    je          00627E10
 00627E0A    test        byte ptr [eax+14],20;TTurntableObject.Buttons:word
>00627E0E    jne         00627E13
 00627E10    xor         eax,eax
 00627E12    ret
 00627E13    mov         al,1
 00627E15    ret
*}
end;

//00627E18
function TTurntableObject.RightRed:Boolean;
begin
{*
 00627E18    cmp         byte ptr [eax+8],0;TTurntableObject.Exists:Boolean
>00627E1C    je          00627E24
 00627E1E    test        byte ptr [eax+15],2;TTurntableObject.?f15:byte
>00627E22    jne         00627E27
 00627E24    xor         eax,eax
 00627E26    ret
 00627E27    mov         al,1
 00627E29    ret
*}
end;

//00627E2C
procedure TTurntableObject.SetNumber(Value:Integer);
begin
{*
 00627E2C    push        ebx
 00627E2D    mov         dword ptr [eax+0C],edx;TTurntableObject.FNumber:Integer
 00627E30    mov         ecx,dword ptr [eax+4];TTurntableObject.Wiimote:TWiimoteObject
 00627E33    mov         ebx,dword ptr [ecx+4];TWiimoteObject.FManager:TComponent
 00627E36    cmp         byte ptr [ebx+134],0
>00627E3D    je          00627E5A
 00627E3F    cmp         byte ptr [ecx+447],0;TWiimoteObject.FUseExpansion:Boolean
>00627E46    je          00627E51
 00627E48    mov         eax,ecx
 00627E4A    call        TWiimoteObject.SetPlayerLed
>00627E4F    jmp         00627E5A
 00627E51    xor         edx,edx
 00627E53    mov         eax,ecx
 00627E55    call        TWiimoteObject.SetPlayerLed
 00627E5A    pop         ebx
 00627E5B    ret
*}
end;

//00627E5C
function TTurntableObject.StickX:Double;
begin
{*
 00627E5C    add         esp,0FFFFFFF4
 00627E5F    test        eax,eax
>00627E61    jne         00627E6E
 00627E63    xor         eax,eax
 00627E65    mov         dword ptr [esp],eax
 00627E68    mov         dword ptr [esp+4],eax
>00627E6C    jmp         00627EAA
 00627E6E    movzx       edx,word ptr [eax+10];TTurntableObject.Joy1X:SmallInt
 00627E72    cmp         dx,20
>00627E76    jl          00627E92
 00627E78    movsx       eax,dx
 00627E7B    sub         eax,20
 00627E7E    mov         dword ptr [esp+8],eax
 00627E82    fild        dword ptr [esp+8]
 00627E86    fdiv        dword ptr ds:[627EB4];31:Single
 00627E8C    fstp        qword ptr [esp]
 00627E8F    wait
>00627E90    jmp         00627EAA
 00627E92    movsx       eax,dx
 00627E95    sub         eax,20
 00627E98    mov         dword ptr [esp+8],eax
 00627E9C    fild        dword ptr [esp+8]
 00627EA0    fdiv        dword ptr ds:[627EB8];32:Single
 00627EA6    fstp        qword ptr [esp]
 00627EA9    wait
 00627EAA    fld         qword ptr [esp]
 00627EAD    add         esp,0C
 00627EB0    ret
*}
end;

//00627EBC
function TTurntableObject.StickY:Double;
begin
{*
 00627EBC    add         esp,0FFFFFFF4
 00627EBF    test        eax,eax
>00627EC1    jne         00627ECE
 00627EC3    xor         eax,eax
 00627EC5    mov         dword ptr [esp],eax
 00627EC8    mov         dword ptr [esp+4],eax
>00627ECC    jmp         00627F0E
 00627ECE    movzx       edx,word ptr [eax+12];TTurntableObject.Joy1Y:SmallInt
 00627ED2    cmp         dx,20
>00627ED6    jl          00627EF4
 00627ED8    movsx       eax,dx
 00627EDB    sub         eax,20
 00627EDE    neg         eax
 00627EE0    mov         dword ptr [esp+8],eax
 00627EE4    fild        dword ptr [esp+8]
 00627EE8    fdiv        dword ptr ds:[627F18];31:Single
 00627EEE    fstp        qword ptr [esp]
 00627EF1    wait
>00627EF2    jmp         00627F0E
 00627EF4    movsx       eax,dx
 00627EF7    sub         eax,20
 00627EFA    neg         eax
 00627EFC    mov         dword ptr [esp+8],eax
 00627F00    fild        dword ptr [esp+8]
 00627F04    fdiv        dword ptr ds:[627F1C];32:Single
 00627F0A    fstp        qword ptr [esp]
 00627F0D    wait
 00627F0E    fld         qword ptr [esp]
 00627F11    add         esp,0C
 00627F14    ret
*}
end;

//00629880
{*function sub_00629880(?:string):?;
begin
 00629880    mov         edx,eax
 00629882    add         edx,0FFFFFFD0
 00629885    sub         dx,0A
>00629889    jb          0062989F
 0062988B    add         edx,0FFFFFFF9
 0062988E    sub         dx,6
>00629892    jb          006298A2
 00629894    add         edx,0FFFFFFE6
 00629897    sub         dx,6
>0062989B    jb          006298A7
>0062989D    jmp         006298AC
 0062989F    sub         al,30
 006298A1    ret
 006298A2    sub         al,41
 006298A4    add         al,0A
 006298A6    ret
 006298A7    sub         al,61
 006298A9    add         al,0A
 006298AB    ret
 006298AC    xor         eax,eax
 006298AE    ret
end;*}

//006298B0
{*function sub_006298B0(?:?):?;
begin
 006298B0    sub         eax,1FF
 006298B5    ret
end;*}

//006298B8
procedure TPS3ControllerObject.ButtonsX;
begin
{*
 006298B8    push        ebx
 006298B9    add         esp,0FFFFFFF0
 006298BC    mov         ebx,eax
 006298BE    mov         eax,ebx
 006298C0    mov         edx,dword ptr [eax]
 006298C2    call        dword ptr [edx+6C];TPS3ControllerObject.CircleAnalog
 006298C5    fstp        qword ptr [esp+8]
 006298C9    wait
 006298CA    mov         eax,ebx
 006298CC    mov         edx,dword ptr [eax]
 006298CE    call        dword ptr [edx+74];TPS3ControllerObject.SquareAnalog
 006298D1    fsubr       qword ptr [esp+8]
 006298D5    fstp        qword ptr [esp]
 006298D8    wait
 006298D9    fld         qword ptr [esp]
 006298DC    add         esp,10
 006298DF    pop         ebx
 006298E0    ret
*}
end;

//006298E4
procedure TPS3ControllerObject.ButtonsY;
begin
{*
 006298E4    push        ebx
 006298E5    add         esp,0FFFFFFF0
 006298E8    mov         ebx,eax
 006298EA    mov         eax,ebx
 006298EC    mov         edx,dword ptr [eax]
 006298EE    call        dword ptr [edx+70];TPS3ControllerObject.CrossAnalog
 006298F1    fstp        qword ptr [esp+8]
 006298F5    wait
 006298F6    mov         eax,ebx
 006298F8    mov         edx,dword ptr [eax]
 006298FA    call        dword ptr [edx+78];TPS3ControllerObject.TriangleAnalog
 006298FD    fsubr       qword ptr [esp+8]
 00629901    fstp        qword ptr [esp]
 00629904    wait
 00629905    fld         qword ptr [esp]
 00629908    add         esp,10
 0062990B    pop         ebx
 0062990C    ret
*}
end;

//00629910
function TPS3ControllerObject.Circle:Boolean;
begin
{*
 00629910    test        byte ptr [eax+4A8],20;TPS3ControllerObject.Buttons:Cardinal
 00629917    setne       al
 0062991A    ret
*}
end;

//0062991C
procedure TPS3ControllerObject.CircleAnalog;
begin
{*
 0062991C    add         esp,0FFFFFFF4
 0062991F    movzx       eax,byte ptr [eax+4F7];TPS3ControllerObject.?f4F7:byte
 00629926    mov         dword ptr [esp+8],eax
 0062992A    fild        dword ptr [esp+8]
 0062992E    fdiv        dword ptr ds:[629940];255:Single
 00629934    fstp        qword ptr [esp]
 00629937    wait
 00629938    fld         qword ptr [esp]
 0062993B    add         esp,0C
 0062993E    ret
*}
end;

//00629944
constructor TSixaxisObject.Create(Manager:TComponent; Dev:Pointer);
begin
{*
 00629944    push        ebp
 00629945    mov         ebp,esp
 00629947    add         esp,0FFFFFFF8
 0062994A    push        ebx
 0062994B    push        esi
 0062994C    push        edi
 0062994D    test        dl,dl
>0062994F    je          00629959
 00629951    add         esp,0FFFFFFF0
 00629954    call        @ClassCreate
 00629959    mov         ebx,ecx
 0062995B    mov         byte ptr [ebp-5],dl
 0062995E    mov         dword ptr [ebp-4],eax
 00629961    mov         eax,dword ptr [ebp+8]
 00629964    push        eax
 00629965    mov         ecx,ebx
 00629967    xor         edx,edx
 00629969    mov         eax,dword ptr [ebp-4]
 0062996C    call        00648FF4
 00629971    xor         edx,edx
 00629973    push        ebp
 00629974    push        62999A
 00629979    push        dword ptr fs:[edx]
 0062997C    mov         dword ptr fs:[edx],esp
 0062997F    cmp         byte ptr [ebx+134],0
>00629986    je          00629990
 00629988    mov         eax,dword ptr [ebp-4]
 0062998B    mov         edx,dword ptr [eax]
 0062998D    call        dword ptr [edx+18];TPS3ControllerObject.ShowConnecting
 00629990    xor         eax,eax
 00629992    pop         edx
 00629993    pop         ecx
 00629994    pop         ecx
 00629995    mov         dword ptr fs:[eax],edx
>00629998    jmp         006299B0
>0062999A    jmp         @HandleOnException
 0062999F    dd          1
 006299A3    dd          00418C04;Exception
 006299A7    dd          006299AB
 006299AB    call        @DoneExcept
 006299B0    mov         eax,dword ptr [ebp-4]
 006299B3    mov         byte ptr [eax+488],0FF;TPS3ControllerObject.FLeds:byte
 006299BA    mov         eax,dword ptr [ebp-4]
 006299BD    mov         byte ptr [eax+489],7F;TPS3ControllerObject.FPlayerLed:ShortInt
 006299C4    mov         eax,dword ptr [ebp-4]
 006299C7    xor         edx,edx
 006299C9    mov         dword ptr [eax+490],edx;TPS3ControllerObject.FLedLevel:Double
 006299CF    mov         dword ptr [eax+494],406FE000;TPS3ControllerObject.?f494:dword
 006299D9    mov         eax,dword ptr [ebp-4]
 006299DC    mov         byte ptr [eax+148],0;TPS3ControllerObject.HasGyros:Boolean
 006299E3    mov         eax,dword ptr [ebp-4]
 006299E6    mov         byte ptr [eax+149],1;TPS3ControllerObject.HasYawGyro:Boolean
 006299ED    mov         eax,dword ptr [ebp-4]
 006299F0    cmp         byte ptr [ebp-5],0
>006299F4    je          00629A05
 006299F6    call        @AfterConstruction
 006299FB    pop         dword ptr fs:[0]
 00629A02    add         esp,0C
 00629A05    mov         eax,dword ptr [ebp-4]
 00629A08    pop         edi
 00629A09    pop         esi
 00629A0A    pop         ebx
 00629A0B    pop         ecx
 00629A0C    pop         ecx
 00629A0D    pop         ebp
 00629A0E    ret         4
*}
end;

//00629A14
constructor sub_00629A14(Manager:TObject; Device:TObject);
begin
{*
 00629A14    push        ebp
 00629A15    mov         ebp,esp
 00629A17    add         esp,0FFFFFFF8
 00629A1A    push        ebx
 00629A1B    push        esi
 00629A1C    push        edi
 00629A1D    test        dl,dl
>00629A1F    je          00629A29
 00629A21    add         esp,0FFFFFFF0
 00629A24    call        @ClassCreate
 00629A29    mov         ebx,ecx
 00629A2B    mov         byte ptr [ebp-5],dl
 00629A2E    mov         dword ptr [ebp-4],eax
 00629A31    mov         eax,dword ptr [ebp+8]
 00629A34    push        eax
 00629A35    mov         ecx,ebx
 00629A37    xor         edx,edx
 00629A39    mov         eax,dword ptr [ebp-4]
 00629A3C    call        006492BC
 00629A41    xor         edx,edx
 00629A43    push        ebp
 00629A44    push        629A6A
 00629A49    push        dword ptr fs:[edx]
 00629A4C    mov         dword ptr fs:[edx],esp
 00629A4F    cmp         byte ptr [ebx+134],0
>00629A56    je          00629A60
 00629A58    mov         eax,dword ptr [ebp-4]
 00629A5B    mov         edx,dword ptr [eax]
 00629A5D    call        dword ptr [edx+18];TPS3ControllerObject.ShowConnecting
 00629A60    xor         eax,eax
 00629A62    pop         edx
 00629A63    pop         ecx
 00629A64    pop         ecx
 00629A65    mov         dword ptr fs:[eax],edx
>00629A68    jmp         00629A80
>00629A6A    jmp         @HandleOnException
 00629A6F    dd          1
 00629A73    dd          00418C04;Exception
 00629A77    dd          00629A7B
 00629A7B    call        @DoneExcept
 00629A80    mov         eax,dword ptr [ebp-4]
 00629A83    mov         byte ptr [eax+488],0FF;TPS3ControllerObject.FLeds:byte
 00629A8A    mov         eax,dword ptr [ebp-4]
 00629A8D    mov         byte ptr [eax+489],7F;TPS3ControllerObject.FPlayerLed:ShortInt
 00629A94    mov         eax,dword ptr [ebp-4]
 00629A97    xor         edx,edx
 00629A99    mov         dword ptr [eax+490],edx;TPS3ControllerObject.FLedLevel:Double
 00629A9F    mov         dword ptr [eax+494],406FE000;TPS3ControllerObject.?f494:dword
 00629AA9    mov         eax,dword ptr [ebp-4]
 00629AAC    mov         byte ptr [eax+148],0;TPS3ControllerObject.HasGyros:Boolean
 00629AB3    mov         eax,dword ptr [ebp-4]
 00629AB6    mov         byte ptr [eax+149],1;TPS3ControllerObject.HasYawGyro:Boolean
 00629ABD    mov         eax,dword ptr [ebp-4]
 00629AC0    cmp         byte ptr [ebp-5],0
>00629AC4    je          00629AD5
 00629AC6    call        @AfterConstruction
 00629ACB    pop         dword ptr fs:[0]
 00629AD2    add         esp,0C
 00629AD5    mov         eax,dword ptr [ebp-4]
 00629AD8    pop         edi
 00629AD9    pop         esi
 00629ADA    pop         ebx
 00629ADB    pop         ecx
 00629ADC    pop         ecx
 00629ADD    pop         ebp
 00629ADE    ret         4
*}
end;

//00629AE4
function TPS3ControllerObject.Cross:Boolean;
begin
{*
 00629AE4    test        byte ptr [eax+4A8],40;TPS3ControllerObject.Buttons:Cardinal
 00629AEB    setne       al
 00629AEE    ret
*}
end;

//00629AF0
procedure TPS3ControllerObject.CrossAnalog;
begin
{*
 00629AF0    add         esp,0FFFFFFF4
 00629AF3    movzx       eax,byte ptr [eax+4F8];TPS3ControllerObject.?f4F8:byte
 00629AFA    mov         dword ptr [esp+8],eax
 00629AFE    fild        dword ptr [esp+8]
 00629B02    fdiv        dword ptr ds:[629B14];255:Single
 00629B08    fstp        qword ptr [esp]
 00629B0B    wait
 00629B0C    fld         qword ptr [esp]
 00629B0F    add         esp,0C
 00629B12    ret
*}
end;

//00629B18
function TPS3ControllerObject.CrossArms:Boolean;
begin
{*
 00629B18    push        ebx
 00629B19    mov         ebx,eax
 00629B1B    fld         qword ptr [ebx+3B8];TPS3ControllerObject.Roll:Double
 00629B21    fabs
 00629B23    fcomp       dword ptr ds:[629B34];130:Single
 00629B29    wait
 00629B2A    fnstsw      al
 00629B2C    sahf
 00629B2D    setae       al
 00629B30    pop         ebx
 00629B31    ret
*}
end;

//00629B38
destructor TPS3ControllerObject.Destroy();
begin
{*
 00629B38    push        ebx
 00629B39    push        esi
 00629B3A    call        @BeforeDestruction
 00629B3F    mov         ebx,edx
 00629B41    mov         esi,eax
 00629B43    mov         eax,esi
 00629B45    call        TPS3ControllerObject.Stop
 00629B4A    mov         edx,ebx
 00629B4C    and         dl,0FC
 00629B4F    mov         eax,esi
 00629B51    call        TAccelerometerObject.Destroy
 00629B56    test        bl,bl
>00629B58    jle         00629B61
 00629B5A    mov         eax,esi
 00629B5C    call        @ClassDestroy
 00629B61    pop         esi
 00629B62    pop         ebx
 00629B63    ret
*}
end;

//00629B64
procedure sub_00629B64;
begin
{*
 00629B64    push        ebp
 00629B65    mov         ebp,esp
 00629B67    pop         ebp
 00629B68    ret         8
*}
end;

//00629B6C
procedure TPS3ControllerObject.DoNullUpdate;
begin
{*
 00629B6C    push        ebx
 00629B6D    mov         ebx,eax
 00629B6F    fld         tbyte ptr ds:[629BE4];0.01:Extended
 00629B75    fadd        qword ptr [ebx+4A0];TPS3ControllerObject.UpdateTime:Double
 00629B7B    fstp        qword ptr [ebx+4A0];TPS3ControllerObject.UpdateTime:Double
 00629B81    wait
 00629B82    push        dword ptr [ebx+24C];TPS3ControllerObject.?f24C:dword
 00629B88    push        dword ptr [ebx+248];TPS3ControllerObject.RawForceX:Double
 00629B8E    push        dword ptr [ebx+254];TPS3ControllerObject.?f254:dword
 00629B94    push        dword ptr [ebx+250];TPS3ControllerObject.RawForceY:Double
 00629B9A    push        dword ptr [ebx+25C];TPS3ControllerObject.?f25C:dword
 00629BA0    push        dword ptr [ebx+258];TPS3ControllerObject.RawForceZ:Double
 00629BA6    push        dword ptr [ebx+4A4];TPS3ControllerObject.?f4A4:dword
 00629BAC    push        dword ptr [ebx+4A0];TPS3ControllerObject.UpdateTime:Double
 00629BB2    mov         eax,ebx
 00629BB4    call        TAccelerometerObject.UpdateForces
 00629BB9    push        dword ptr [ebx+154];TPS3ControllerObject.?f154:dword
 00629BBF    push        dword ptr [ebx+150];TPS3ControllerObject.RawGyroYaw:Double
 00629BC5    push        0
 00629BC7    push        0
 00629BC9    push        0
 00629BCB    push        0
 00629BCD    push        dword ptr [ebx+4A4];TPS3ControllerObject.?f4A4:dword
 00629BD3    push        dword ptr [ebx+4A0];TPS3ControllerObject.UpdateTime:Double
 00629BD9    mov         eax,ebx
 00629BDB    call        TAccelerometerObject.UpdateGyros
 00629BE0    pop         ebx
 00629BE1    ret
*}
end;

//00629BF0
function TPS3ControllerObject.Down:Boolean;
begin
{*
 00629BF0    test        byte ptr [eax+4A9],40;TPS3ControllerObject.?f4A9:byte
 00629BF7    setne       al
 00629BFA    ret
*}
end;

//00629BFC
procedure TPS3ControllerObject.DownAnalog;
begin
{*
 00629BFC    add         esp,0FFFFFFF4
 00629BFF    movzx       eax,byte ptr [eax+4F0];TPS3ControllerObject.?f4F0:byte
 00629C06    mov         dword ptr [esp+8],eax
 00629C0A    fild        dword ptr [esp+8]
 00629C0E    fdiv        dword ptr ds:[629C20];255:Single
 00629C14    fstp        qword ptr [esp]
 00629C17    wait
 00629C18    fld         qword ptr [esp]
 00629C1B    add         esp,0C
 00629C1E    ret
*}
end;

//00629C24
function TPS3ControllerObject.DPad3DX:Double;
begin
{*
 00629C24    push        ebx
 00629C25    add         esp,0FFFFFFEC
 00629C28    mov         ebx,eax
 00629C2A    mov         eax,ebx
 00629C2C    mov         edx,dword ptr [eax]
 00629C2E    call        dword ptr [edx+88];TPS3ControllerObject.DPadX
 00629C34    fmul        qword ptr [ebx+370];TPS3ControllerObject.RotMat:TRotMat
 00629C3A    fstp        tbyte ptr [esp+8]
 00629C3E    wait
 00629C3F    mov         eax,ebx
 00629C41    mov         edx,dword ptr [eax]
 00629C43    call        dword ptr [edx+8C];TPS3ControllerObject.DPadY
 00629C49    fmul        qword ptr [ebx+3A0];TPS3ControllerObject.RotMat:TRotMat
 00629C4F    fld         tbyte ptr [esp+8]
 00629C53    fsubrp      st(1),st
 00629C55    fstp        qword ptr [esp]
 00629C58    wait
 00629C59    fld         qword ptr [esp]
 00629C5C    add         esp,14
 00629C5F    pop         ebx
 00629C60    ret
*}
end;

//00629C64
procedure TPS3ControllerObject.DPad3DY;
begin
{*
 00629C64    push        ebx
 00629C65    add         esp,0FFFFFFEC
 00629C68    mov         ebx,eax
 00629C6A    mov         eax,ebx
 00629C6C    mov         edx,dword ptr [eax]
 00629C6E    call        dword ptr [edx+88];TPS3ControllerObject.DPadX
 00629C74    fmul        qword ptr [ebx+378];TPS3ControllerObject.RotMat:TRotMat
 00629C7A    fstp        tbyte ptr [esp+8]
 00629C7E    wait
 00629C7F    mov         eax,ebx
 00629C81    mov         edx,dword ptr [eax]
 00629C83    call        dword ptr [edx+8C];TPS3ControllerObject.DPadY
 00629C89    fmul        qword ptr [ebx+3A8];TPS3ControllerObject.RotMat:TRotMat
 00629C8F    fld         tbyte ptr [esp+8]
 00629C93    fsubrp      st(1),st
 00629C95    fstp        qword ptr [esp]
 00629C98    wait
 00629C99    fld         qword ptr [esp]
 00629C9C    add         esp,14
 00629C9F    pop         ebx
 00629CA0    ret
*}
end;

//00629CA4
procedure TPS3ControllerObject.DPad3DZ;
begin
{*
 00629CA4    push        ebx
 00629CA5    add         esp,0FFFFFFEC
 00629CA8    mov         ebx,eax
 00629CAA    mov         eax,ebx
 00629CAC    mov         edx,dword ptr [eax]
 00629CAE    call        dword ptr [edx+88];TPS3ControllerObject.DPadX
 00629CB4    fmul        qword ptr [ebx+380];TPS3ControllerObject.RotMat:TRotMat
 00629CBA    fstp        tbyte ptr [esp+8]
 00629CBE    wait
 00629CBF    mov         eax,ebx
 00629CC1    mov         edx,dword ptr [eax]
 00629CC3    call        dword ptr [edx+8C];TPS3ControllerObject.DPadY
 00629CC9    fmul        qword ptr [ebx+3B0];TPS3ControllerObject.RotMat:TRotMat
 00629CCF    fld         tbyte ptr [esp+8]
 00629CD3    fsubrp      st(1),st
 00629CD5    fstp        qword ptr [esp]
 00629CD8    wait
 00629CD9    fld         qword ptr [esp]
 00629CDC    add         esp,14
 00629CDF    pop         ebx
 00629CE0    ret
*}
end;

//00629CE4
procedure TPS3ControllerObject.DPadX;
begin
{*
 00629CE4    push        ebx
 00629CE5    add         esp,0FFFFFFF0
 00629CE8    mov         ebx,eax
 00629CEA    mov         eax,ebx
 00629CEC    mov         edx,dword ptr [eax]
 00629CEE    call        dword ptr [edx+60];TPS3ControllerObject.RightAnalog
 00629CF1    fstp        qword ptr [esp+8]
 00629CF5    wait
 00629CF6    mov         eax,ebx
 00629CF8    mov         edx,dword ptr [eax]
 00629CFA    call        dword ptr [edx+5C];TPS3ControllerObject.LeftAnalog
 00629CFD    fsubr       qword ptr [esp+8]
 00629D01    fstp        qword ptr [esp]
 00629D04    wait
 00629D05    fld         qword ptr [esp]
 00629D08    add         esp,10
 00629D0B    pop         ebx
 00629D0C    ret
*}
end;

//00629D10
procedure TPS3ControllerObject.DPadY;
begin
{*
 00629D10    push        ebx
 00629D11    add         esp,0FFFFFFF0
 00629D14    mov         ebx,eax
 00629D16    mov         eax,ebx
 00629D18    mov         edx,dword ptr [eax]
 00629D1A    call        dword ptr [edx+58];TPS3ControllerObject.DownAnalog
 00629D1D    fstp        qword ptr [esp+8]
 00629D21    wait
 00629D22    mov         eax,ebx
 00629D24    mov         edx,dword ptr [eax]
 00629D26    call        dword ptr [edx+54];TPS3ControllerObject.UpAnalog
 00629D29    fsubr       qword ptr [esp+8]
 00629D2D    fstp        qword ptr [esp]
 00629D30    wait
 00629D31    fld         qword ptr [esp]
 00629D34    add         esp,10
 00629D37    pop         ebx
 00629D38    ret
*}
end;

//00629D3C
function TPS3ControllerObject.GetLed(Number:Byte):Boolean;
begin
{*
 00629D3C    mov         ecx,edx
 00629D3E    mov         edx,1
 00629D43    shl         edx,cl
 00629D45    movzx       eax,byte ptr [eax+456]
 00629D4C    and         edx,eax
 00629D4E    setne       al
 00629D51    ret
*}
end;

//00629D54
function TPS3ControllerObject.GetLedBlock(Number:ShortInt; Block:ShortInt):Byte;
begin
{*
 00629D54    push        ebx
 00629D55    cmp         dl,0FF
>00629D58    jl          00629D5F
 00629D5A    cmp         dl,4
>00629D5D    jle         00629D63
 00629D5F    xor         eax,eax
 00629D61    pop         ebx
 00629D62    ret
 00629D63    movsx       edx,dl
 00629D66    mov         ebx,4
 00629D6B    sub         ebx,edx
 00629D6D    lea         edx,[ebx+ebx*4]
 00629D70    lea         eax,[eax+edx+457]
 00629D77    dec         cl
>00629D79    je          00629D85
 00629D7B    dec         cl
>00629D7D    je          00629D8B
 00629D7F    dec         cl
>00629D81    je          00629D91
>00629D83    jmp         00629D97
 00629D85    movzx       eax,byte ptr [eax+2]
>00629D89    jmp         00629D99
 00629D8B    movzx       eax,byte ptr [eax+3]
>00629D8F    jmp         00629D99
 00629D91    movzx       eax,byte ptr [eax+4]
>00629D95    jmp         00629D99
 00629D97    xor         eax,eax
 00629D99    pop         ebx
 00629D9A    ret
*}
end;

//00629D9C
function TPS3ControllerObject.GetLedDuration(Number:ShortInt):Double;
begin
{*
 00629D9C    add         esp,0FFFFFFF4
 00629D9F    cmp         dl,0FF
>00629DA2    jl          00629DA9
 00629DA4    cmp         dl,4
>00629DA7    jle         00629DB4
 00629DA9    xor         eax,eax
 00629DAB    mov         dword ptr [esp],eax
 00629DAE    mov         dword ptr [esp+4],eax
>00629DB2    jmp         00629DF4
 00629DB4    movsx       edx,dl
 00629DB7    mov         ecx,4
 00629DBC    sub         ecx,edx
 00629DBE    lea         edx,[ecx+ecx*4]
 00629DC1    movzx       eax,byte ptr [eax+edx+457]
 00629DC9    cmp         al,0FF
>00629DCB    jne         00629DDC
 00629DCD    xor         eax,eax
 00629DCF    mov         dword ptr [esp],eax
 00629DD2    mov         dword ptr [esp+4],7FF00000
>00629DDA    jmp         00629DF4
 00629DDC    movzx       eax,al
 00629DDF    lea         eax,[eax+eax*4]
 00629DE2    mov         dword ptr [esp+8],eax
 00629DE6    fild        dword ptr [esp+8]
 00629DEA    fdiv        dword ptr ds:[629DFC];254:Single
 00629DF0    fstp        qword ptr [esp]
 00629DF3    wait
 00629DF4    fld         qword ptr [esp]
 00629DF7    add         esp,0C
 00629DFA    ret
*}
end;

//00629E00
function TPS3ControllerObject.GetLedFrequency(Number:ShortInt):Double;
begin
{*
 00629E00    add         esp,0FFFFFFF4
 00629E03    cmp         dl,0FF
>00629E06    jl          00629E0D
 00629E08    cmp         dl,4
>00629E0B    jle         00629E18
 00629E0D    xor         eax,eax
 00629E0F    mov         dword ptr [esp],eax
 00629E12    mov         dword ptr [esp+4],eax
>00629E16    jmp         00629E51
 00629E18    movsx       edx,dl
 00629E1B    mov         ecx,4
 00629E20    sub         ecx,edx
 00629E22    lea         edx,[ecx+ecx*4]
 00629E25    movzx       eax,byte ptr [eax+edx+458]
 00629E2D    test        al,al
>00629E2F    jne         00629E3C
 00629E31    xor         eax,eax
 00629E33    mov         dword ptr [esp],eax
 00629E36    mov         dword ptr [esp+4],eax
>00629E3A    jmp         00629E51
 00629E3C    movzx       eax,al
 00629E3F    mov         dword ptr [esp+8],eax
 00629E43    fild        dword ptr [esp+8]
 00629E47    fdivr       dword ptr ds:[629E58];128:Single
 00629E4D    fstp        qword ptr [esp]
 00629E50    wait
 00629E51    fld         qword ptr [esp]
 00629E54    add         esp,0C
 00629E57    ret
*}
end;

//00629E5C
{*procedure TPS3ControllerObject.InByteString(?:?);
begin
 00629E5C    push        ebx
 00629E5D    push        esi
 00629E5E    mov         esi,edx
 00629E60    mov         ebx,eax
 00629E62    mov         ecx,esi
 00629E64    lea         eax,[ebx+4E0];TPS3ControllerObject.Report:?
 00629E6A    mov         edx,31
 00629E6F    call        004F90D8
 00629E74    pop         esi
 00629E75    pop         ebx
 00629E76    ret
end;*}

//00629E78
function TPS3ControllerObject.L1:Boolean;
begin
{*
 00629E78    test        byte ptr [eax+4A8],4;TPS3ControllerObject.Buttons:Cardinal
 00629E7F    setne       al
 00629E82    ret
*}
end;

//00629E84
procedure TPS3ControllerObject.L1Analog;
begin
{*
 00629E84    add         esp,0FFFFFFF4
 00629E87    movzx       eax,byte ptr [eax+4F4];TPS3ControllerObject.?f4F4:byte
 00629E8E    mov         dword ptr [esp+8],eax
 00629E92    fild        dword ptr [esp+8]
 00629E96    fdiv        dword ptr ds:[629EA8];255:Single
 00629E9C    fstp        qword ptr [esp]
 00629E9F    wait
 00629EA0    fld         qword ptr [esp]
 00629EA3    add         esp,0C
 00629EA6    ret
*}
end;

//00629EAC
function TPS3ControllerObject.L2:Boolean;
begin
{*
 00629EAC    test        byte ptr [eax+4A8],1;TPS3ControllerObject.Buttons:Cardinal
 00629EB3    setne       al
 00629EB6    ret
*}
end;

//00629EB8
procedure TPS3ControllerObject.L2Analog;
begin
{*
 00629EB8    add         esp,0FFFFFFF4
 00629EBB    movzx       eax,byte ptr [eax+4F2];TPS3ControllerObject.?f4F2:byte
 00629EC2    mov         dword ptr [esp+8],eax
 00629EC6    fild        dword ptr [esp+8]
 00629ECA    fdiv        dword ptr ds:[629EDC];255:Single
 00629ED0    fstp        qword ptr [esp]
 00629ED3    wait
 00629ED4    fld         qword ptr [esp]
 00629ED7    add         esp,0C
 00629EDA    ret
*}
end;

//00629EE0
function TPS3ControllerObject.L3:Boolean;
begin
{*
 00629EE0    test        byte ptr [eax+4A9],2;TPS3ControllerObject.?f4A9:byte
 00629EE7    setne       al
 00629EEA    ret
*}
end;

//00629EEC
function TPS3ControllerObject.Left:Boolean;
begin
{*
 00629EEC    test        byte ptr [eax+4A9],80;TPS3ControllerObject.?f4A9:byte
 00629EF3    setne       al
 00629EF6    ret
*}
end;

//00629EF8
procedure TPS3ControllerObject.LeftAnalog;
begin
{*
 00629EF8    add         esp,0FFFFFFF4
 00629EFB    movzx       eax,byte ptr [eax+4F1];TPS3ControllerObject.?f4F1:byte
 00629F02    mov         dword ptr [esp+8],eax
 00629F06    fild        dword ptr [esp+8]
 00629F0A    fdiv        dword ptr ds:[629F1C];255:Single
 00629F10    fstp        qword ptr [esp]
 00629F13    wait
 00629F14    fld         qword ptr [esp]
 00629F17    add         esp,0C
 00629F1A    ret
*}
end;

//00629F20
function TPS3ControllerObject.LeftStick3DX:Double;
begin
{*
 00629F20    push        ebx
 00629F21    add         esp,0FFFFFFEC
 00629F24    mov         ebx,eax
 00629F26    mov         eax,ebx
 00629F28    call        TPS3ControllerObject.LeftStickX
 00629F2D    fmul        qword ptr [ebx+370];TPS3ControllerObject.RotMat:TRotMat
 00629F33    fstp        tbyte ptr [esp+8]
 00629F37    wait
 00629F38    mov         eax,ebx
 00629F3A    call        TPS3ControllerObject.LeftStickY
 00629F3F    fmul        qword ptr [ebx+3A0];TPS3ControllerObject.RotMat:TRotMat
 00629F45    fld         tbyte ptr [esp+8]
 00629F49    fsubrp      st(1),st
 00629F4B    fstp        qword ptr [esp]
 00629F4E    wait
 00629F4F    fld         qword ptr [esp]
 00629F52    add         esp,14
 00629F55    pop         ebx
 00629F56    ret
*}
end;

//00629F58
procedure TPS3ControllerObject.LeftStick3DY;
begin
{*
 00629F58    push        ebx
 00629F59    add         esp,0FFFFFFEC
 00629F5C    mov         ebx,eax
 00629F5E    mov         eax,ebx
 00629F60    call        TPS3ControllerObject.LeftStickX
 00629F65    fmul        qword ptr [ebx+378];TPS3ControllerObject.RotMat:TRotMat
 00629F6B    fstp        tbyte ptr [esp+8]
 00629F6F    wait
 00629F70    mov         eax,ebx
 00629F72    call        TPS3ControllerObject.LeftStickY
 00629F77    fmul        qword ptr [ebx+3A8];TPS3ControllerObject.RotMat:TRotMat
 00629F7D    fld         tbyte ptr [esp+8]
 00629F81    fsubrp      st(1),st
 00629F83    fstp        qword ptr [esp]
 00629F86    wait
 00629F87    fld         qword ptr [esp]
 00629F8A    add         esp,14
 00629F8D    pop         ebx
 00629F8E    ret
*}
end;

//00629F90
procedure TPS3ControllerObject.LeftStick3DZ;
begin
{*
 00629F90    push        ebx
 00629F91    add         esp,0FFFFFFEC
 00629F94    mov         ebx,eax
 00629F96    mov         eax,ebx
 00629F98    call        TPS3ControllerObject.LeftStickX
 00629F9D    fmul        qword ptr [ebx+380];TPS3ControllerObject.RotMat:TRotMat
 00629FA3    fstp        tbyte ptr [esp+8]
 00629FA7    wait
 00629FA8    mov         eax,ebx
 00629FAA    call        TPS3ControllerObject.LeftStickY
 00629FAF    fmul        qword ptr [ebx+3B0];TPS3ControllerObject.RotMat:TRotMat
 00629FB5    fld         tbyte ptr [esp+8]
 00629FB9    fsubrp      st(1),st
 00629FBB    fstp        qword ptr [esp]
 00629FBE    wait
 00629FBF    fld         qword ptr [esp]
 00629FC2    add         esp,14
 00629FC5    pop         ebx
 00629FC6    ret
*}
end;

//00629FC8
function TPS3ControllerObject.LeftStickX:Double;
begin
{*
 00629FC8    add         esp,0FFFFFFF4
 00629FCB    movzx       eax,byte ptr [eax+4E6];TPS3ControllerObject.?f4E6:byte
 00629FD2    add         eax,eax
 00629FD4    mov         dword ptr [esp+8],eax
 00629FD8    fild        dword ptr [esp+8]
 00629FDC    fdiv        dword ptr ds:[629FF4];255:Single
 00629FE2    fsub        dword ptr ds:[629FF8];1:Single
 00629FE8    fstp        qword ptr [esp]
 00629FEB    wait
 00629FEC    fld         qword ptr [esp]
 00629FEF    add         esp,0C
 00629FF2    ret
*}
end;

//00629FFC
function TPS3ControllerObject.LeftStickY:Double;
begin
{*
 00629FFC    add         esp,0FFFFFFF4
 00629FFF    movzx       eax,byte ptr [eax+4E7];TPS3ControllerObject.?f4E7:byte
 0062A006    add         eax,eax
 0062A008    mov         dword ptr [esp+8],eax
 0062A00C    fild        dword ptr [esp+8]
 0062A010    fdiv        dword ptr ds:[62A028];255:Single
 0062A016    fsub        dword ptr ds:[62A02C];1:Single
 0062A01C    fstp        qword ptr [esp]
 0062A01F    wait
 0062A020    fld         qword ptr [esp]
 0062A023    add         esp,0C
 0062A026    ret
*}
end;

//0062A030
function TPS3ControllerObject.MoveButton:Boolean;
begin
{*
 0062A030    test        byte ptr [eax+4AA],8;TPS3ControllerObject.?f4AA:byte
 0062A037    setne       al
 0062A03A    ret
*}
end;

//0062A03C
{*procedure TPS3ControllerObject.OutByteString(?:?);
begin
 0062A03C    push        ebx
 0062A03D    push        esi
 0062A03E    mov         esi,edx
 0062A040    mov         ebx,eax
 0062A042    mov         ecx,esi
 0062A044    lea         eax,[ebx+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062A04A    mov         edx,31
 0062A04F    call        004F90D8
 0062A054    pop         esi
 0062A055    pop         ebx
 0062A056    ret
end;*}

//0062A058
procedure TPS3ControllerObject.PerformNullUpdates;
begin
{*
 0062A058    push        ebx
 0062A059    push        esi
 0062A05A    add         esp,0FFFFFFF8
 0062A05D    mov         esi,eax
 0062A05F    fld         qword ptr [esi+4A0];TPS3ControllerObject.UpdateTime:Double
 0062A065    fcomp       dword ptr ds:[62A0D4];0:Single
 0062A06B    wait
 0062A06C    fnstsw      al
 0062A06E    sahf
>0062A06F    je          0062A0CE
 0062A071    call        00682F08
 0062A076    fsub        qword ptr [esi+4A0];TPS3ControllerObject.UpdateTime:Double
 0062A07C    fmul        dword ptr ds:[62A0D8];100:Single
 0062A082    fstp        qword ptr [esp]
 0062A085    wait
 0062A086    fld         qword ptr [esp]
 0062A089    fcomp       dword ptr ds:[62A0D8];100:Single
 0062A08F    wait
 0062A090    fnstsw      al
 0062A092    sahf
>0062A093    jbe         0062A0A2
 0062A095    xor         eax,eax
 0062A097    mov         dword ptr [esp],eax
 0062A09A    mov         dword ptr [esp+4],40590000
 0062A0A2    fld         tbyte ptr ds:[62A0DC];1.1:Extended
 0062A0A8    fcomp       qword ptr [esp]
 0062A0AB    wait
 0062A0AC    fnstsw      al
 0062A0AE    sahf
>0062A0AF    jae         0062A0CE
 0062A0B1    push        dword ptr [esp+4]
 0062A0B5    push        dword ptr [esp+4]
 0062A0B9    call        00454B98
 0062A0BE    mov         ebx,eax
 0062A0C0    test        ebx,ebx
>0062A0C2    jle         0062A0CE
 0062A0C4    mov         eax,esi
 0062A0C6    mov         edx,dword ptr [eax]
 0062A0C8    call        dword ptr [edx+24];TPS3ControllerObject.DoNullUpdate
 0062A0CB    dec         ebx
>0062A0CC    jne         0062A0C4
 0062A0CE    pop         ecx
 0062A0CF    pop         edx
 0062A0D0    pop         esi
 0062A0D1    pop         ebx
 0062A0D2    ret
*}
end;

//0062A0E8
function TPS3ControllerObject.PS:Boolean;
begin
{*
 0062A0E8    test        byte ptr [eax+4AA],1;TPS3ControllerObject.?f4AA:byte
 0062A0EF    setne       al
 0062A0F2    ret
*}
end;

//0062A0F4
function TPS3ControllerObject.R1:Boolean;
begin
{*
 0062A0F4    test        byte ptr [eax+4A8],8;TPS3ControllerObject.Buttons:Cardinal
 0062A0FB    setne       al
 0062A0FE    ret
*}
end;

//0062A100
procedure TPS3ControllerObject.R1Analog;
begin
{*
 0062A100    add         esp,0FFFFFFF4
 0062A103    movzx       eax,byte ptr [eax+4F5];TPS3ControllerObject.?f4F5:byte
 0062A10A    mov         dword ptr [esp+8],eax
 0062A10E    fild        dword ptr [esp+8]
 0062A112    fdiv        dword ptr ds:[62A124];255:Single
 0062A118    fstp        qword ptr [esp]
 0062A11B    wait
 0062A11C    fld         qword ptr [esp]
 0062A11F    add         esp,0C
 0062A122    ret
*}
end;

//0062A128
function TPS3ControllerObject.R2:Boolean;
begin
{*
 0062A128    test        byte ptr [eax+4A8],2;TPS3ControllerObject.Buttons:Cardinal
 0062A12F    setne       al
 0062A132    ret
*}
end;

//0062A134
procedure TPS3ControllerObject.R2Analog;
begin
{*
 0062A134    add         esp,0FFFFFFF4
 0062A137    movzx       eax,byte ptr [eax+4F3];TPS3ControllerObject.?f4F3:byte
 0062A13E    mov         dword ptr [esp+8],eax
 0062A142    fild        dword ptr [esp+8]
 0062A146    fdiv        dword ptr ds:[62A158];255:Single
 0062A14C    fstp        qword ptr [esp]
 0062A14F    wait
 0062A150    fld         qword ptr [esp]
 0062A153    add         esp,0C
 0062A156    ret
*}
end;

//0062A15C
function TPS3ControllerObject.R3:Boolean;
begin
{*
 0062A15C    test        byte ptr [eax+4A9],4;TPS3ControllerObject.?f4A9:byte
 0062A163    setne       al
 0062A166    ret
*}
end;

//0062A168
procedure TPS3ControllerObject.ReadSixaxis;
begin
{*
 0062A168    push        ebx
 0062A169    push        esi
 0062A16A    mov         ebx,eax
 0062A16C    cmp         byte ptr [ebx+18],0;TPS3ControllerObject.Connected:Boolean
>0062A170    je          0062A1EB
 0062A172    call        00682F08
 0062A177    fstp        qword ptr [ebx+8];TPS3ControllerObject.ReportTime:Double
 0062A17A    wait
 0062A17B    cmp         byte ptr [ebx+88],0;TPS3ControllerObject.UseMotionInJoy:Boolean
>0062A182    je          0062A197
 0062A184    push        34
 0062A186    lea         ecx,[ebx+4E0];TPS3ControllerObject.Report:?
 0062A18C    xor         edx,edx
 0062A18E    mov         eax,ebx
 0062A190    call        TManagedHidObject.GetFeatureReport
>0062A195    jmp         0062A1A9
 0062A197    lea         edx,[ebx+4E0];TPS3ControllerObject.Report:?
 0062A19D    mov         ecx,31
 0062A1A2    mov         eax,ebx
 0062A1A4    call        TManagedHidObject.ReadReport
 0062A1A9    push        31
 0062A1AB    lea         ecx,[ebx+4E0];TPS3ControllerObject.Report:?
 0062A1B1    mov         edx,1
 0062A1B6    mov         eax,ebx
 0062A1B8    mov         esi,dword ptr [eax]
 0062A1BA    call        dword ptr [esi];TPS3ControllerObject.ReceiveReport
 0062A1BC    mov         eax,ebx
 0062A1BE    mov         edx,dword ptr [eax]
 0062A1C0    call        dword ptr [edx+20];TPS3ControllerObject.PerformNullUpdates
 0062A1C3    movzx       eax,byte ptr [ebx+42C];TPS3ControllerObject.NextWaggleGesture:TWaggleGesture
 0062A1CA    mov         byte ptr [ebx+42D],al;TPS3ControllerObject.WaggleGesture:TWaggleGesture
 0062A1D0    mov         byte ptr [ebx+42C],0;TPS3ControllerObject.NextWaggleGesture:TWaggleGesture
 0062A1D7    movzx       eax,byte ptr [ebx+42E];TPS3ControllerObject.NextPartialGesture:TWaggleGesture
 0062A1DE    mov         byte ptr [ebx+42F],al;TPS3ControllerObject.PartialGesture:TWaggleGesture
 0062A1E4    mov         byte ptr [ebx+42E],0;TPS3ControllerObject.NextPartialGesture:TWaggleGesture
 0062A1EB    pop         esi
 0062A1EC    pop         ebx
 0062A1ED    ret
*}
end;

//0062A1F0
procedure TPS3ControllerObject.ReceiveButtons(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 0062A1F0    push        ebp
 0062A1F1    mov         ebp,esp
 0062A1F3    push        esi
 0062A1F4    mov         edx,dword ptr [eax+4A8];TPS3ControllerObject.Buttons:Cardinal
 0062A1FA    mov         dword ptr [eax+4AC],edx;TPS3ControllerObject.OldButtons:Cardinal
 0062A200    movzx       esi,byte ptr [ecx+3]
 0062A204    movzx       edx,byte ptr [ecx+2]
 0062A208    shl         edx,8
 0062A20B    or          esi,edx
 0062A20D    movzx       edx,byte ptr [ecx+4]
 0062A211    shl         edx,10
 0062A214    or          esi,edx
 0062A216    mov         dword ptr [eax+4A8],esi;TPS3ControllerObject.Buttons:Cardinal
 0062A21C    mov         edx,dword ptr [eax+4AC];TPS3ControllerObject.OldButtons:Cardinal
 0062A222    cmp         esi,edx
>0062A224    je          0062A235
 0062A226    push        dword ptr [eax+0C];TPS3ControllerObject.?fC:dword
 0062A229    push        dword ptr [eax+8];TPS3ControllerObject.ReportTime:Double
 0062A22C    mov         ecx,edx
 0062A22E    mov         edx,esi
 0062A230    call        00629B64
 0062A235    pop         esi
 0062A236    pop         ebp
 0062A237    ret         4
*}
end;

//0062A23C
procedure TPS3ControllerObject.ReceiveDataReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 0062A23C    push        ebp
 0062A23D    mov         ebp,esp
 0062A23F    add         esp,0FFFFFFDC
 0062A242    push        ebx
 0062A243    push        esi
 0062A244    mov         ebx,ecx
 0062A246    mov         esi,eax
 0062A248    lea         edx,[esi+4E0];TPS3ControllerObject.Report:?
 0062A24E    mov         eax,ebx
 0062A250    mov         ecx,dword ptr [ebp+8]
 0062A253    call        Move
 0062A258    call        00682F08
 0062A25D    fstp        qword ptr [esi+4A0];TPS3ControllerObject.UpdateTime:Double
 0062A263    wait
 0062A264    movzx       eax,byte ptr [ebx+29]
 0062A268    shl         eax,8
 0062A26B    movzx       edx,byte ptr [ebx+2A]
 0062A26F    add         eax,edx
 0062A271    call        006298B0
 0062A276    mov         dword ptr [ebp-24],eax
 0062A279    fild        dword ptr [ebp-24]
 0062A27C    fstp        qword ptr [ebp-8]
 0062A27F    wait
 0062A280    movzx       eax,byte ptr [ebx+2D]
 0062A284    shl         eax,8
 0062A287    movzx       edx,byte ptr [ebx+2E]
 0062A28B    add         eax,edx
 0062A28D    call        006298B0
 0062A292    neg         eax
 0062A294    mov         dword ptr [ebp-24],eax
 0062A297    fild        dword ptr [ebp-24]
 0062A29A    fstp        qword ptr [ebp-10]
 0062A29D    wait
 0062A29E    movzx       eax,byte ptr [ebx+2B]
 0062A2A2    shl         eax,8
 0062A2A5    movzx       edx,byte ptr [ebx+2C]
 0062A2A9    add         eax,edx
 0062A2AB    call        006298B0
 0062A2B0    mov         dword ptr [ebp-24],eax
 0062A2B3    fild        dword ptr [ebp-24]
 0062A2B6    fstp        qword ptr [ebp-18]
 0062A2B9    wait
 0062A2BA    movzx       eax,byte ptr [ebx+2F]
 0062A2BE    shl         eax,8
 0062A2C1    movzx       edx,byte ptr [ebx+30]
 0062A2C5    add         eax,edx
 0062A2C7    mov         dword ptr [ebp-24],eax
 0062A2CA    fild        dword ptr [ebp-24]
 0062A2CD    fstp        qword ptr [ebp-20]
 0062A2D0    wait
 0062A2D1    push        dword ptr [ebp-4]
 0062A2D4    push        dword ptr [ebp-8]
 0062A2D7    push        dword ptr [ebp-0C]
 0062A2DA    push        dword ptr [ebp-10]
 0062A2DD    push        dword ptr [ebp-14]
 0062A2E0    push        dword ptr [ebp-18]
 0062A2E3    push        dword ptr [esi+0C];TPS3ControllerObject.?fC:dword
 0062A2E6    push        dword ptr [esi+8];TPS3ControllerObject.ReportTime:Double
 0062A2E9    mov         eax,esi
 0062A2EB    call        TAccelerometerObject.UpdateForces
 0062A2F0    fld         qword ptr [ebp-20]
 0062A2F3    fcomp       dword ptr ds:[62A32C];2:Single
 0062A2F9    wait
 0062A2FA    fnstsw      al
 0062A2FC    sahf
>0062A2FD    ja          0062A308
 0062A2FF    cmp         byte ptr [esi+14B],0;TPS3ControllerObject.GyrosCalibrated:Boolean
>0062A306    je          0062A323
 0062A308    push        dword ptr [ebp-1C]
 0062A30B    push        dword ptr [ebp-20]
 0062A30E    push        0
 0062A310    push        0
 0062A312    push        0
 0062A314    push        0
 0062A316    push        dword ptr [esi+0C];TPS3ControllerObject.?fC:dword
 0062A319    push        dword ptr [esi+8];TPS3ControllerObject.ReportTime:Double
 0062A31C    mov         eax,esi
 0062A31E    call        TAccelerometerObject.UpdateGyros
 0062A323    pop         esi
 0062A324    pop         ebx
 0062A325    mov         esp,ebp
 0062A327    pop         ebp
 0062A328    ret         4
*}
end;

//0062A330
procedure TPS3ControllerObject.ReceiveReport(ReportID:Integer; Report:PByteArray; Size:Integer);
begin
{*
 0062A330    push        ebp
 0062A331    mov         ebp,esp
 0062A333    push        ecx
 0062A334    push        ebx
 0062A335    push        esi
 0062A336    push        edi
 0062A337    mov         dword ptr [ebp-4],ecx
 0062A33A    mov         esi,edx
 0062A33C    mov         ebx,eax
 0062A33E    mov         eax,dword ptr [ebp+8]
 0062A341    push        eax
 0062A342    mov         ecx,dword ptr [ebp-4]
 0062A345    mov         edx,esi
 0062A347    mov         eax,ebx
 0062A349    mov         edi,dword ptr [eax]
 0062A34B    call        dword ptr [edi+38];TPS3ControllerObject.ReceiveButtons
 0062A34E    mov         eax,dword ptr [ebp+8]
 0062A351    push        eax
 0062A352    mov         ecx,dword ptr [ebp-4]
 0062A355    mov         edx,esi
 0062A357    mov         eax,ebx
 0062A359    mov         ebx,dword ptr [eax]
 0062A35B    call        dword ptr [ebx+34];TPS3ControllerObject.ReceiveDataReport
 0062A35E    pop         edi
 0062A35F    pop         esi
 0062A360    pop         ebx
 0062A361    pop         ecx
 0062A362    pop         ebp
 0062A363    ret         4
*}
end;

//0062A368
function TPS3ControllerObject.Right:Boolean;
begin
{*
 0062A368    test        byte ptr [eax+4A9],20;TPS3ControllerObject.?f4A9:byte
 0062A36F    setne       al
 0062A372    ret
*}
end;

//0062A374
procedure TPS3ControllerObject.RightAnalog;
begin
{*
 0062A374    add         esp,0FFFFFFF4
 0062A377    movzx       eax,byte ptr [eax+4EF];TPS3ControllerObject.?f4EF:byte
 0062A37E    mov         dword ptr [esp+8],eax
 0062A382    fild        dword ptr [esp+8]
 0062A386    fdiv        dword ptr ds:[62A398];255:Single
 0062A38C    fstp        qword ptr [esp]
 0062A38F    wait
 0062A390    fld         qword ptr [esp]
 0062A393    add         esp,0C
 0062A396    ret
*}
end;

//0062A39C
function TPS3ControllerObject.RightStick3DX:Double;
begin
{*
 0062A39C    push        ebx
 0062A39D    add         esp,0FFFFFFEC
 0062A3A0    mov         ebx,eax
 0062A3A2    mov         eax,ebx
 0062A3A4    call        TPS3ControllerObject.RightStickX
 0062A3A9    fmul        qword ptr [ebx+370];TPS3ControllerObject.RotMat:TRotMat
 0062A3AF    fstp        tbyte ptr [esp+8]
 0062A3B3    wait
 0062A3B4    mov         eax,ebx
 0062A3B6    call        TPS3ControllerObject.RightStickY
 0062A3BB    fmul        qword ptr [ebx+3A0];TPS3ControllerObject.RotMat:TRotMat
 0062A3C1    fld         tbyte ptr [esp+8]
 0062A3C5    fsubrp      st(1),st
 0062A3C7    fstp        qword ptr [esp]
 0062A3CA    wait
 0062A3CB    fld         qword ptr [esp]
 0062A3CE    add         esp,14
 0062A3D1    pop         ebx
 0062A3D2    ret
*}
end;

//0062A3D4
procedure TPS3ControllerObject.RightStick3DY;
begin
{*
 0062A3D4    push        ebx
 0062A3D5    add         esp,0FFFFFFEC
 0062A3D8    mov         ebx,eax
 0062A3DA    mov         eax,ebx
 0062A3DC    call        TPS3ControllerObject.RightStickX
 0062A3E1    fmul        qword ptr [ebx+378];TPS3ControllerObject.RotMat:TRotMat
 0062A3E7    fstp        tbyte ptr [esp+8]
 0062A3EB    wait
 0062A3EC    mov         eax,ebx
 0062A3EE    call        TPS3ControllerObject.RightStickY
 0062A3F3    fmul        qword ptr [ebx+3A8];TPS3ControllerObject.RotMat:TRotMat
 0062A3F9    fld         tbyte ptr [esp+8]
 0062A3FD    fsubrp      st(1),st
 0062A3FF    fstp        qword ptr [esp]
 0062A402    wait
 0062A403    fld         qword ptr [esp]
 0062A406    add         esp,14
 0062A409    pop         ebx
 0062A40A    ret
*}
end;

//0062A40C
procedure TPS3ControllerObject.RightStick3DZ;
begin
{*
 0062A40C    push        ebx
 0062A40D    add         esp,0FFFFFFEC
 0062A410    mov         ebx,eax
 0062A412    mov         eax,ebx
 0062A414    call        TPS3ControllerObject.RightStickX
 0062A419    fmul        qword ptr [ebx+380];TPS3ControllerObject.RotMat:TRotMat
 0062A41F    fstp        tbyte ptr [esp+8]
 0062A423    wait
 0062A424    mov         eax,ebx
 0062A426    call        TPS3ControllerObject.RightStickY
 0062A42B    fmul        qword ptr [ebx+3B0];TPS3ControllerObject.RotMat:TRotMat
 0062A431    fld         tbyte ptr [esp+8]
 0062A435    fsubrp      st(1),st
 0062A437    fstp        qword ptr [esp]
 0062A43A    wait
 0062A43B    fld         qword ptr [esp]
 0062A43E    add         esp,14
 0062A441    pop         ebx
 0062A442    ret
*}
end;

//0062A444
function TPS3ControllerObject.RightStickX:Double;
begin
{*
 0062A444    add         esp,0FFFFFFF4
 0062A447    movzx       eax,byte ptr [eax+4E8];TPS3ControllerObject.?f4E8:byte
 0062A44E    add         eax,eax
 0062A450    mov         dword ptr [esp+8],eax
 0062A454    fild        dword ptr [esp+8]
 0062A458    fdiv        dword ptr ds:[62A470];255:Single
 0062A45E    fsub        dword ptr ds:[62A474];1:Single
 0062A464    fstp        qword ptr [esp]
 0062A467    wait
 0062A468    fld         qword ptr [esp]
 0062A46B    add         esp,0C
 0062A46E    ret
*}
end;

//0062A478
function TPS3ControllerObject.RightStickY:Double;
begin
{*
 0062A478    add         esp,0FFFFFFF4
 0062A47B    movzx       eax,byte ptr [eax+4E9];TPS3ControllerObject.?f4E9:byte
 0062A482    add         eax,eax
 0062A484    mov         dword ptr [esp+8],eax
 0062A488    fild        dword ptr [esp+8]
 0062A48C    fdiv        dword ptr ds:[62A4A4];255:Single
 0062A492    fsub        dword ptr ds:[62A4A8];1:Single
 0062A498    fstp        qword ptr [esp]
 0062A49B    wait
 0062A49C    fld         qword ptr [esp]
 0062A49F    add         esp,0C
 0062A4A2    ret
*}
end;

//0062A4AC
function TPS3ControllerObject.Select:Boolean;
begin
{*
 0062A4AC    test        byte ptr [eax+4A9],1;TPS3ControllerObject.?f4A9:byte
 0062A4B3    setne       al
 0062A4B6    ret
*}
end;

//0062A4B8
procedure TPS3ControllerObject.SetLed(Number:Byte; SwitchedOn:Boolean);
begin
{*
 0062A4B8    push        ebx
 0062A4B9    push        esi
 0062A4BA    push        ecx
 0062A4BB    mov         esi,eax
 0062A4BD    movzx       eax,byte ptr [esi+456]
 0062A4C4    mov         byte ptr [esp],al
 0062A4C7    test        cl,cl
>0062A4C9    je          0062A4D6
 0062A4CB    mov         ecx,edx
 0062A4CD    mov         bl,1
 0062A4CF    shl         bl,cl
 0062A4D1    or          bl,byte ptr [esp]
>0062A4D4    jmp         0062A4E3
 0062A4D6    mov         ecx,edx
 0062A4D8    mov         al,1
 0062A4DA    shl         al,cl
 0062A4DC    mov         bl,0FF
 0062A4DE    sub         bl,al
 0062A4E0    and         bl,byte ptr [esp]
 0062A4E3    mov         byte ptr [esi+456],bl
 0062A4E9    cmp         bl,byte ptr [esp]
>0062A4EC    je          0062A500
 0062A4EE    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062A4F4    mov         ecx,28
 0062A4F9    mov         eax,esi
 0062A4FB    call        TManagedHidObject.SendReport
 0062A500    movzx       eax,bl
 0062A503    shr         eax,1
 0062A505    and         al,0F
 0062A507    mov         byte ptr [esi+488],al;TPS3ControllerObject.FLeds:byte
 0062A50D    mov         edx,eax
 0062A50F    and         dl,0F
 0062A512    movzx       edx,dl
 0062A515    add         edx,0FFFFFFFD
 0062A518    cmp         edx,8
>0062A51B    ja          0062A575
 0062A51D    jmp         dword ptr [edx*4+62A524]
 0062A51D    dd          0062A551
 0062A51D    dd          0062A575
 0062A51D    dd          0062A55A
 0062A51D    dd          0062A548
 0062A51D    dd          0062A56C
 0062A51D    dd          0062A575
 0062A51D    dd          0062A575
 0062A51D    dd          0062A575
 0062A51D    dd          0062A563
 0062A548    mov         byte ptr [esi+489],0B;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A54F    jmp         0062A595
 0062A551    mov         byte ptr [esi+489],0C;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A558    jmp         0062A595
 0062A55A    mov         byte ptr [esi+489],0D;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A561    jmp         0062A595
 0062A563    mov         byte ptr [esi+489],0E;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A56A    jmp         0062A595
 0062A56C    mov         byte ptr [esi+489],0F;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A573    jmp         0062A595
 0062A575    mov         edx,eax
 0062A577    and         dl,3
 0062A57A    test        al,4
 0062A57C    setne       cl
 0062A57F    lea         ecx,[ecx+ecx*2]
 0062A582    add         dl,cl
 0062A584    test        al,8
 0062A586    setne       cl
 0062A589    add         ecx,ecx
 0062A58B    add         ecx,ecx
 0062A58D    add         dl,cl
 0062A58F    mov         byte ptr [esi+489],dl;TPS3ControllerObject.FPlayerLed:ShortInt
 0062A595    mov         edx,eax
 0062A597    and         dl,8
 0062A59A    test        dl,dl
>0062A59C    je          0062A5B2
 0062A59E    xor         ecx,ecx
 0062A5A0    mov         dword ptr [esi+490],ecx;TPS3ControllerObject.FLedLevel:Double
 0062A5A6    mov         dword ptr [esi+494],3FF00000;TPS3ControllerObject.?f494:dword
>0062A5B0    jmp         0062A608
 0062A5B2    test        al,4
>0062A5B4    je          0062A5CA
 0062A5B6    xor         ecx,ecx
 0062A5B8    mov         dword ptr [esi+490],ecx;TPS3ControllerObject.FLedLevel:Double
 0062A5BE    mov         dword ptr [esi+494],3FE80000;TPS3ControllerObject.?f494:dword
>0062A5C8    jmp         0062A608
 0062A5CA    test        al,2
>0062A5CC    je          0062A5E2
 0062A5CE    xor         ecx,ecx
 0062A5D0    mov         dword ptr [esi+490],ecx;TPS3ControllerObject.FLedLevel:Double
 0062A5D6    mov         dword ptr [esi+494],3FE00000;TPS3ControllerObject.?f494:dword
>0062A5E0    jmp         0062A608
 0062A5E2    test        al,1
>0062A5E4    je          0062A5FA
 0062A5E6    xor         ecx,ecx
 0062A5E8    mov         dword ptr [esi+490],ecx;TPS3ControllerObject.FLedLevel:Double
 0062A5EE    mov         dword ptr [esi+494],3FD00000;TPS3ControllerObject.?f494:dword
>0062A5F8    jmp         0062A608
 0062A5FA    xor         ecx,ecx
 0062A5FC    mov         dword ptr [esi+490],ecx;TPS3ControllerObject.FLedLevel:Double
 0062A602    mov         dword ptr [esi+494],ecx;TPS3ControllerObject.?f494:dword
 0062A608    test        al,1
>0062A60A    je          0062A620
 0062A60C    xor         eax,eax
 0062A60E    mov         dword ptr [esi+498],eax;TPS3ControllerObject.FLedDrumLevel:Double
 0062A614    mov         dword ptr [esi+49C],3FF00000;TPS3ControllerObject.?f49C:dword
>0062A61E    jmp         0062A676
 0062A620    test        al,2
>0062A622    je          0062A638
 0062A624    xor         eax,eax
 0062A626    mov         dword ptr [esi+498],eax;TPS3ControllerObject.FLedDrumLevel:Double
 0062A62C    mov         dword ptr [esi+49C],3FE80000;TPS3ControllerObject.?f49C:dword
>0062A636    jmp         0062A676
 0062A638    test        al,4
>0062A63A    je          0062A650
 0062A63C    xor         eax,eax
 0062A63E    mov         dword ptr [esi+498],eax;TPS3ControllerObject.FLedDrumLevel:Double
 0062A644    mov         dword ptr [esi+49C],3FE00000;TPS3ControllerObject.?f49C:dword
>0062A64E    jmp         0062A676
 0062A650    test        dl,dl
>0062A652    je          0062A668
 0062A654    xor         eax,eax
 0062A656    mov         dword ptr [esi+498],eax;TPS3ControllerObject.FLedDrumLevel:Double
 0062A65C    mov         dword ptr [esi+49C],3FD00000;TPS3ControllerObject.?f49C:dword
>0062A666    jmp         0062A676
 0062A668    xor         eax,eax
 0062A66A    mov         dword ptr [esi+498],eax;TPS3ControllerObject.FLedDrumLevel:Double
 0062A670    mov         dword ptr [esi+49C],eax;TPS3ControllerObject.?f49C:dword
 0062A676    pop         edx
 0062A677    pop         esi
 0062A678    pop         ebx
 0062A679    ret
*}
end;

//0062A67C
{*procedure TPS3ControllerObject.SetLedDrumLevel(Value:Double; ?:?);
begin
 0062A67C    push        ebp
 0062A67D    mov         ebp,esp
 0062A67F    push        esi
 0062A680    mov         esi,eax
 0062A682    fld         qword ptr [esi+498];TPS3ControllerObject.FLedDrumLevel:Double
 0062A688    fcomp       qword ptr [ebp+8]
 0062A68B    wait
 0062A68C    fnstsw      al
 0062A68E    sahf
>0062A68F    je          0062A83B
 0062A695    mov         eax,dword ptr [ebp+8]
 0062A698    mov         dword ptr [esi+498],eax;TPS3ControllerObject.FLedDrumLevel:Double
 0062A69E    mov         eax,dword ptr [ebp+0C]
 0062A6A1    mov         dword ptr [esi+49C],eax;TPS3ControllerObject.?f49C:dword
 0062A6A7    cmp         byte ptr [esi+18],0;TPS3ControllerObject.Connected:Boolean
>0062A6AB    je          0062A83B
 0062A6B1    fld         tbyte ptr ds:[62A840];0.8:Extended
 0062A6B7    fcomp       qword ptr [esi+498];TPS3ControllerObject.FLedDrumLevel:Double
 0062A6BD    wait
 0062A6BE    fnstsw      al
 0062A6C0    sahf
>0062A6C1    jae         0062A6C7
 0062A6C3    mov         al,0F
>0062A6C5    jmp         0062A70B
 0062A6C7    fld         tbyte ptr ds:[62A84C];0.6:Extended
 0062A6CD    fcomp       qword ptr [esi+498];TPS3ControllerObject.FLedDrumLevel:Double
 0062A6D3    wait
 0062A6D4    fnstsw      al
 0062A6D6    sahf
>0062A6D7    jae         0062A6DD
 0062A6D9    mov         al,0E
>0062A6DB    jmp         0062A70B
 0062A6DD    fld         tbyte ptr ds:[62A858];0.4:Extended
 0062A6E3    fcomp       qword ptr [esi+498];TPS3ControllerObject.FLedDrumLevel:Double
 0062A6E9    wait
 0062A6EA    fnstsw      al
 0062A6EC    sahf
>0062A6ED    jae         0062A6F3
 0062A6EF    mov         al,0C
>0062A6F1    jmp         0062A70B
 0062A6F3    fld         tbyte ptr ds:[62A864];0.2:Extended
 0062A6F9    fcomp       qword ptr [esi+498];TPS3ControllerObject.FLedDrumLevel:Double
 0062A6FF    wait
 0062A700    fnstsw      al
 0062A702    sahf
>0062A703    jae         0062A709
 0062A705    mov         al,8
>0062A707    jmp         0062A70B
 0062A709    xor         eax,eax
 0062A70B    mov         edx,eax
 0062A70D    and         dl,0F
 0062A710    movzx       edx,dl
 0062A713    add         edx,0FFFFFFFD
 0062A716    cmp         edx,8
>0062A719    ja          0062A773
 0062A71B    jmp         dword ptr [edx*4+62A722]
 0062A71B    dd          0062A74F
 0062A71B    dd          0062A773
 0062A71B    dd          0062A758
 0062A71B    dd          0062A746
 0062A71B    dd          0062A76A
 0062A71B    dd          0062A773
 0062A71B    dd          0062A773
 0062A71B    dd          0062A773
 0062A71B    dd          0062A761
 0062A746    mov         byte ptr [esi+489],0B;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A74D    jmp         0062A793
 0062A74F    mov         byte ptr [esi+489],0C;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A756    jmp         0062A793
 0062A758    mov         byte ptr [esi+489],0D;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A75F    jmp         0062A793
 0062A761    mov         byte ptr [esi+489],0E;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A768    jmp         0062A793
 0062A76A    mov         byte ptr [esi+489],0F;TPS3ControllerObject.FPlayerLed:ShortInt
>0062A771    jmp         0062A793
 0062A773    mov         edx,eax
 0062A775    and         dl,3
 0062A778    test        al,4
 0062A77A    setne       cl
 0062A77D    lea         ecx,[ecx+ecx*2]
 0062A780    add         dl,cl
 0062A782    test        al,8
 0062A784    setne       cl
 0062A787    add         ecx,ecx
 0062A789    add         ecx,ecx
 0062A78B    add         dl,cl
 0062A78D    mov         byte ptr [esi+489],dl;TPS3ControllerObject.FPlayerLed:ShortInt
 0062A793    test        al,8
>0062A795    je          0062A7AB
 0062A797    xor         edx,edx
 0062A799    mov         dword ptr [esi+490],edx;TPS3ControllerObject.FLedLevel:Double
 0062A79F    mov         dword ptr [esi+494],3FF00000;TPS3ControllerObject.?f494:dword
>0062A7A9    jmp         0062A801
 0062A7AB    test        al,4
>0062A7AD    je          0062A7C3
 0062A7AF    xor         edx,edx
 0062A7B1    mov         dword ptr [esi+490],edx;TPS3ControllerObject.FLedLevel:Double
 0062A7B7    mov         dword ptr [esi+494],3FE80000;TPS3ControllerObject.?f494:dword
>0062A7C1    jmp         0062A801
 0062A7C3    test        al,2
>0062A7C5    je          0062A7DB
 0062A7C7    xor         edx,edx
 0062A7C9    mov         dword ptr [esi+490],edx;TPS3ControllerObject.FLedLevel:Double
 0062A7CF    mov         dword ptr [esi+494],3FE00000;TPS3ControllerObject.?f494:dword
>0062A7D9    jmp         0062A801
 0062A7DB    test        al,1
>0062A7DD    je          0062A7F3
 0062A7DF    xor         edx,edx
 0062A7E1    mov         dword ptr [esi+490],edx;TPS3ControllerObject.FLedLevel:Double
 0062A7E7    mov         dword ptr [esi+494],3FD00000;TPS3ControllerObject.?f494:dword
>0062A7F1    jmp         0062A801
 0062A7F3    xor         edx,edx
 0062A7F5    mov         dword ptr [esi+490],edx;TPS3ControllerObject.FLedLevel:Double
 0062A7FB    mov         dword ptr [esi+494],edx;TPS3ControllerObject.?f494:dword
 0062A801    cmp         al,byte ptr [esi+488];TPS3ControllerObject.FLeds:byte
>0062A807    je          0062A83B
 0062A809    mov         byte ptr [esi+488],al;TPS3ControllerObject.FLeds:byte
 0062A80F    movzx       edx,byte ptr [esi+456]
 0062A816    add         eax,eax
 0062A818    mov         ecx,edx
 0062A81A    and         cl,1
 0062A81D    or          al,cl
 0062A81F    mov         byte ptr [esi+456],al
 0062A825    cmp         al,dl
>0062A827    je          0062A83B
 0062A829    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062A82F    mov         ecx,28
 0062A834    mov         eax,esi
 0062A836    call        TManagedHidObject.SendReport
 0062A83B    pop         esi
 0062A83C    pop         ebp
 0062A83D    ret         8
end;*}

//0062A870
{*procedure TPS3ControllerObject.SetLedDuration(Number:ShortInt; Duration:Double; ?:?);
begin
 0062A870    push        ebp
 0062A871    mov         ebp,esp
 0062A873    push        ecx
 0062A874    push        ebx
 0062A875    push        esi
 0062A876    push        edi
 0062A877    mov         ebx,edx
 0062A879    mov         esi,eax
 0062A87B    movsx       eax,bl
 0062A87E    mov         edx,4
 0062A883    sub         edx,eax
 0062A885    lea         edi,[edx+edx*4]
 0062A888    movzx       eax,byte ptr [esi+edi+457]
 0062A890    mov         byte ptr [ebp-1],al
 0062A893    fld         qword ptr [ebp+8]
 0062A896    fmul        dword ptr ds:[62A8F0];254:Single
 0062A89C    fdiv        dword ptr ds:[62A8F4];5:Single
 0062A8A2    fstp        qword ptr [ebp+8]
 0062A8A5    wait
 0062A8A6    fld         qword ptr [ebp+8]
 0062A8A9    fcomp       dword ptr ds:[62A8F8];255:Single
 0062A8AF    wait
 0062A8B0    fnstsw      al
 0062A8B2    sahf
>0062A8B3    jb          0062A8C1
 0062A8B5    xor         eax,eax
 0062A8B7    mov         dword ptr [ebp+8],eax
 0062A8BA    mov         dword ptr [ebp+0C],406FE000
 0062A8C1    fld         qword ptr [ebp+8]
 0062A8C4    call        @ROUND
 0062A8C9    mov         byte ptr [esi+edi+457],al
 0062A8D0    cmp         al,byte ptr [ebp-1]
>0062A8D3    je          0062A8E7
 0062A8D5    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062A8DB    mov         ecx,28
 0062A8E0    mov         eax,esi
 0062A8E2    call        TManagedHidObject.SendReport
 0062A8E7    pop         edi
 0062A8E8    pop         esi
 0062A8E9    pop         ebx
 0062A8EA    pop         ecx
 0062A8EB    pop         ebp
 0062A8EC    ret         8
end;*}

//0062A8FC
{*procedure TPS3ControllerObject.SetLedFrequency(Number:ShortInt; Frequency:Double; ?:?);
begin
 0062A8FC    push        ebp
 0062A8FD    mov         ebp,esp
 0062A8FF    push        ebx
 0062A900    push        esi
 0062A901    mov         ebx,edx
 0062A903    mov         esi,eax
 0062A905    fld         qword ptr [ebp+8]
 0062A908    fcomp       dword ptr ds:[62A98C];0:Single
 0062A90E    wait
 0062A90F    fnstsw      al
 0062A911    sahf
>0062A912    je          0062A93E
 0062A914    fld         qword ptr [ebp+8]
 0062A917    fabs
 0062A919    fdivr       dword ptr ds:[62A990];128:Single
 0062A91F    fstp        qword ptr [ebp+8]
 0062A922    wait
 0062A923    fld         qword ptr [ebp+8]
 0062A926    fcomp       dword ptr ds:[62A994];255:Single
 0062A92C    wait
 0062A92D    fnstsw      al
 0062A92F    sahf
>0062A930    jb          0062A93E
 0062A932    xor         eax,eax
 0062A934    mov         dword ptr [ebp+8],eax
 0062A937    mov         dword ptr [ebp+0C],406FE000
 0062A93E    fld         qword ptr [ebp+8]
 0062A941    call        @ROUND
 0062A946    movsx       edx,bl
 0062A949    mov         ecx,4
 0062A94E    sub         ecx,edx
 0062A950    lea         edx,[ecx+ecx*4]
 0062A953    movzx       edx,byte ptr [esi+edx+458]
 0062A95B    movsx       ecx,bl
 0062A95E    mov         ebx,4
 0062A963    sub         ebx,ecx
 0062A965    lea         ecx,[ebx+ebx*4]
 0062A968    mov         byte ptr [esi+ecx+458],al
 0062A96F    cmp         al,dl
>0062A971    je          0062A985
 0062A973    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062A979    mov         ecx,28
 0062A97E    mov         eax,esi
 0062A980    call        TManagedHidObject.SendReport
 0062A985    pop         esi
 0062A986    pop         ebx
 0062A987    pop         ebp
 0062A988    ret         8
end;*}

//0062A998
procedure TPS3ControllerObject.SetLedBlock1(Number:ShortInt; Block:Byte);
begin
{*
 0062A998    push        ebx
 0062A999    push        esi
 0062A99A    movsx       ebx,dl
 0062A99D    mov         esi,4
 0062A9A2    sub         esi,ebx
 0062A9A4    lea         esi,[esi+esi*4]
 0062A9A7    movzx       ebx,byte ptr [eax+esi+459]
 0062A9AF    mov         byte ptr [eax+esi+459],cl
 0062A9B6    cmp         cl,bl
>0062A9B8    je          0062A9CA
 0062A9BA    lea         edx,[eax+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062A9C0    mov         ecx,28
 0062A9C5    call        TManagedHidObject.SendReport
 0062A9CA    pop         esi
 0062A9CB    pop         ebx
 0062A9CC    ret
*}
end;

//0062A9D0
procedure TPS3ControllerObject.SetLedBlock2(Number:ShortInt; Block:Byte);
begin
{*
 0062A9D0    push        ebx
 0062A9D1    push        esi
 0062A9D2    movsx       ebx,dl
 0062A9D5    mov         esi,4
 0062A9DA    sub         esi,ebx
 0062A9DC    lea         esi,[esi+esi*4]
 0062A9DF    movzx       ebx,byte ptr [eax+esi+45A]
 0062A9E7    mov         byte ptr [eax+esi+45A],cl
 0062A9EE    cmp         cl,bl
>0062A9F0    je          0062AA02
 0062A9F2    lea         edx,[eax+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062A9F8    mov         ecx,28
 0062A9FD    call        TManagedHidObject.SendReport
 0062AA02    pop         esi
 0062AA03    pop         ebx
 0062AA04    ret
*}
end;

//0062AA08
procedure TPS3ControllerObject.SetLedBlock3(Number:ShortInt; Block:Byte);
begin
{*
 0062AA08    push        ebx
 0062AA09    push        esi
 0062AA0A    movsx       ebx,dl
 0062AA0D    mov         esi,4
 0062AA12    sub         esi,ebx
 0062AA14    lea         esi,[esi+esi*4]
 0062AA17    movzx       ebx,byte ptr [eax+esi+45B]
 0062AA1F    mov         byte ptr [eax+esi+45B],cl
 0062AA26    cmp         cl,bl
>0062AA28    je          0062AA3A
 0062AA2A    lea         edx,[eax+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062AA30    mov         ecx,28
 0062AA35    call        TManagedHidObject.SendReport
 0062AA3A    pop         esi
 0062AA3B    pop         ebx
 0062AA3C    ret
*}
end;

//0062AA40
{*procedure TPS3ControllerObject.SetLedLevel(Value:Double; ?:?);
begin
 0062AA40    push        ebp
 0062AA41    mov         ebp,esp
 0062AA43    push        esi
 0062AA44    mov         esi,eax
 0062AA46    fld         qword ptr [esi+490];TPS3ControllerObject.FLedLevel:Double
 0062AA4C    fcomp       qword ptr [ebp+8]
 0062AA4F    wait
 0062AA50    fnstsw      al
 0062AA52    sahf
>0062AA53    je          0062ABFF
 0062AA59    mov         eax,dword ptr [ebp+8]
 0062AA5C    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062AA62    mov         eax,dword ptr [ebp+0C]
 0062AA65    mov         dword ptr [esi+494],eax;TPS3ControllerObject.?f494:dword
 0062AA6B    cmp         byte ptr [esi+18],0;TPS3ControllerObject.Connected:Boolean
>0062AA6F    je          0062ABFF
 0062AA75    fld         tbyte ptr ds:[62AC04];0.8:Extended
 0062AA7B    fcomp       qword ptr [esi+490];TPS3ControllerObject.FLedLevel:Double
 0062AA81    wait
 0062AA82    fnstsw      al
 0062AA84    sahf
>0062AA85    jae         0062AA8B
 0062AA87    mov         al,0F
>0062AA89    jmp         0062AACF
 0062AA8B    fld         tbyte ptr ds:[62AC10];0.6:Extended
 0062AA91    fcomp       qword ptr [esi+490];TPS3ControllerObject.FLedLevel:Double
 0062AA97    wait
 0062AA98    fnstsw      al
 0062AA9A    sahf
>0062AA9B    jae         0062AAA1
 0062AA9D    mov         al,7
>0062AA9F    jmp         0062AACF
 0062AAA1    fld         tbyte ptr ds:[62AC1C];0.4:Extended
 0062AAA7    fcomp       qword ptr [esi+490];TPS3ControllerObject.FLedLevel:Double
 0062AAAD    wait
 0062AAAE    fnstsw      al
 0062AAB0    sahf
>0062AAB1    jae         0062AAB7
 0062AAB3    mov         al,3
>0062AAB5    jmp         0062AACF
 0062AAB7    fld         tbyte ptr ds:[62AC28];0.2:Extended
 0062AABD    fcomp       qword ptr [esi+490];TPS3ControllerObject.FLedLevel:Double
 0062AAC3    wait
 0062AAC4    fnstsw      al
 0062AAC6    sahf
>0062AAC7    jae         0062AACD
 0062AAC9    mov         al,1
>0062AACB    jmp         0062AACF
 0062AACD    xor         eax,eax
 0062AACF    mov         edx,eax
 0062AAD1    and         dl,0F
 0062AAD4    movzx       edx,dl
 0062AAD7    add         edx,0FFFFFFFD
 0062AADA    cmp         edx,8
>0062AADD    ja          0062AB37
 0062AADF    jmp         dword ptr [edx*4+62AAE6]
 0062AADF    dd          0062AB13
 0062AADF    dd          0062AB37
 0062AADF    dd          0062AB1C
 0062AADF    dd          0062AB0A
 0062AADF    dd          0062AB2E
 0062AADF    dd          0062AB37
 0062AADF    dd          0062AB37
 0062AADF    dd          0062AB37
 0062AADF    dd          0062AB25
 0062AB0A    mov         byte ptr [esi+489],0B;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AB11    jmp         0062AB57
 0062AB13    mov         byte ptr [esi+489],0C;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AB1A    jmp         0062AB57
 0062AB1C    mov         byte ptr [esi+489],0D;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AB23    jmp         0062AB57
 0062AB25    mov         byte ptr [esi+489],0E;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AB2C    jmp         0062AB57
 0062AB2E    mov         byte ptr [esi+489],0F;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AB35    jmp         0062AB57
 0062AB37    mov         edx,eax
 0062AB39    and         dl,3
 0062AB3C    test        al,4
 0062AB3E    setne       cl
 0062AB41    lea         ecx,[ecx+ecx*2]
 0062AB44    add         dl,cl
 0062AB46    test        al,8
 0062AB48    setne       cl
 0062AB4B    add         ecx,ecx
 0062AB4D    add         ecx,ecx
 0062AB4F    add         dl,cl
 0062AB51    mov         byte ptr [esi+489],dl;TPS3ControllerObject.FPlayerLed:ShortInt
 0062AB57    test        al,1
>0062AB59    je          0062AB6F
 0062AB5B    xor         edx,edx
 0062AB5D    mov         dword ptr [esi+498],edx;TPS3ControllerObject.FLedDrumLevel:Double
 0062AB63    mov         dword ptr [esi+49C],3FF00000;TPS3ControllerObject.?f49C:dword
>0062AB6D    jmp         0062ABC5
 0062AB6F    test        al,2
>0062AB71    je          0062AB87
 0062AB73    xor         edx,edx
 0062AB75    mov         dword ptr [esi+498],edx;TPS3ControllerObject.FLedDrumLevel:Double
 0062AB7B    mov         dword ptr [esi+49C],3FE80000;TPS3ControllerObject.?f49C:dword
>0062AB85    jmp         0062ABC5
 0062AB87    test        al,4
>0062AB89    je          0062AB9F
 0062AB8B    xor         edx,edx
 0062AB8D    mov         dword ptr [esi+498],edx;TPS3ControllerObject.FLedDrumLevel:Double
 0062AB93    mov         dword ptr [esi+49C],3FE00000;TPS3ControllerObject.?f49C:dword
>0062AB9D    jmp         0062ABC5
 0062AB9F    test        al,8
>0062ABA1    je          0062ABB7
 0062ABA3    xor         edx,edx
 0062ABA5    mov         dword ptr [esi+498],edx;TPS3ControllerObject.FLedDrumLevel:Double
 0062ABAB    mov         dword ptr [esi+49C],3FD00000;TPS3ControllerObject.?f49C:dword
>0062ABB5    jmp         0062ABC5
 0062ABB7    xor         edx,edx
 0062ABB9    mov         dword ptr [esi+498],edx;TPS3ControllerObject.FLedDrumLevel:Double
 0062ABBF    mov         dword ptr [esi+49C],edx;TPS3ControllerObject.?f49C:dword
 0062ABC5    cmp         al,byte ptr [esi+488];TPS3ControllerObject.FLeds:byte
>0062ABCB    je          0062ABFF
 0062ABCD    mov         byte ptr [esi+488],al;TPS3ControllerObject.FLeds:byte
 0062ABD3    movzx       edx,byte ptr [esi+456]
 0062ABDA    add         eax,eax
 0062ABDC    mov         ecx,edx
 0062ABDE    and         cl,1
 0062ABE1    or          al,cl
 0062ABE3    mov         byte ptr [esi+456],al
 0062ABE9    cmp         al,dl
>0062ABEB    je          0062ABFF
 0062ABED    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062ABF3    mov         ecx,28
 0062ABF8    mov         eax,esi
 0062ABFA    call        TManagedHidObject.SendReport
 0062ABFF    pop         esi
 0062AC00    pop         ebp
 0062AC01    ret         8
end;*}

//0062AC34
procedure TPS3ControllerObject.SetLeds(NewLeds:Byte);
begin
{*
 0062AC34    push        esi
 0062AC35    mov         esi,eax
 0062AC37    cmp         dl,byte ptr [esi+488];TPS3ControllerObject.FLeds:byte
>0062AC3D    je          0062ADE3
 0062AC43    mov         byte ptr [esi+488],dl;TPS3ControllerObject.FLeds:byte
 0062AC49    mov         eax,edx
 0062AC4B    and         al,0F
 0062AC4D    movzx       eax,al
 0062AC50    add         eax,0FFFFFFFD
 0062AC53    cmp         eax,8
>0062AC56    ja          0062ACB0
 0062AC58    jmp         dword ptr [eax*4+62AC5F]
 0062AC58    dd          0062AC8C
 0062AC58    dd          0062ACB0
 0062AC58    dd          0062AC95
 0062AC58    dd          0062AC83
 0062AC58    dd          0062ACA7
 0062AC58    dd          0062ACB0
 0062AC58    dd          0062ACB0
 0062AC58    dd          0062ACB0
 0062AC58    dd          0062AC9E
 0062AC83    mov         byte ptr [esi+489],0B;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AC8A    jmp         0062ACD1
 0062AC8C    mov         byte ptr [esi+489],0C;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AC93    jmp         0062ACD1
 0062AC95    mov         byte ptr [esi+489],0D;TPS3ControllerObject.FPlayerLed:ShortInt
>0062AC9C    jmp         0062ACD1
 0062AC9E    mov         byte ptr [esi+489],0E;TPS3ControllerObject.FPlayerLed:ShortInt
>0062ACA5    jmp         0062ACD1
 0062ACA7    mov         byte ptr [esi+489],0F;TPS3ControllerObject.FPlayerLed:ShortInt
>0062ACAE    jmp         0062ACD1
 0062ACB0    mov         eax,edx
 0062ACB2    and         al,3
 0062ACB4    test        dl,4
 0062ACB7    setne       cl
 0062ACBA    lea         ecx,[ecx+ecx*2]
 0062ACBD    add         al,cl
 0062ACBF    test        dl,8
 0062ACC2    setne       cl
 0062ACC5    add         ecx,ecx
 0062ACC7    add         ecx,ecx
 0062ACC9    add         al,cl
 0062ACCB    mov         byte ptr [esi+489],al;TPS3ControllerObject.FPlayerLed:ShortInt
 0062ACD1    mov         eax,edx
 0062ACD3    and         al,1
 0062ACD5    test        al,al
>0062ACD7    je          0062ACED
 0062ACD9    xor         ecx,ecx
 0062ACDB    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062ACE1    mov         dword ptr [esi+49C],3FF00000;TPS3ControllerObject.?f49C:dword
>0062ACEB    jmp         0062AD46
 0062ACED    test        dl,2
>0062ACF0    je          0062AD06
 0062ACF2    xor         ecx,ecx
 0062ACF4    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062ACFA    mov         dword ptr [esi+49C],3FE80000;TPS3ControllerObject.?f49C:dword
>0062AD04    jmp         0062AD46
 0062AD06    test        dl,4
>0062AD09    je          0062AD1F
 0062AD0B    xor         ecx,ecx
 0062AD0D    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062AD13    mov         dword ptr [esi+49C],3FE00000;TPS3ControllerObject.?f49C:dword
>0062AD1D    jmp         0062AD46
 0062AD1F    test        dl,8
>0062AD22    je          0062AD38
 0062AD24    xor         ecx,ecx
 0062AD26    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062AD2C    mov         dword ptr [esi+49C],3FD00000;TPS3ControllerObject.?f49C:dword
>0062AD36    jmp         0062AD46
 0062AD38    xor         ecx,ecx
 0062AD3A    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062AD40    mov         dword ptr [esi+49C],ecx;TPS3ControllerObject.?f49C:dword
 0062AD46    test        dl,8
>0062AD49    je          0062AD5F
 0062AD4B    xor         eax,eax
 0062AD4D    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062AD53    mov         dword ptr [esi+494],3FF00000;TPS3ControllerObject.?f494:dword
>0062AD5D    jmp         0062ADB7
 0062AD5F    test        dl,4
>0062AD62    je          0062AD78
 0062AD64    xor         eax,eax
 0062AD66    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062AD6C    mov         dword ptr [esi+494],3FE80000;TPS3ControllerObject.?f494:dword
>0062AD76    jmp         0062ADB7
 0062AD78    test        dl,2
>0062AD7B    je          0062AD91
 0062AD7D    xor         eax,eax
 0062AD7F    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062AD85    mov         dword ptr [esi+494],3FE00000;TPS3ControllerObject.?f494:dword
>0062AD8F    jmp         0062ADB7
 0062AD91    test        al,al
>0062AD93    je          0062ADA9
 0062AD95    xor         eax,eax
 0062AD97    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062AD9D    mov         dword ptr [esi+494],3FD00000;TPS3ControllerObject.?f494:dword
>0062ADA7    jmp         0062ADB7
 0062ADA9    xor         eax,eax
 0062ADAB    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062ADB1    mov         dword ptr [esi+494],eax;TPS3ControllerObject.?f494:dword
 0062ADB7    movzx       eax,byte ptr [esi+456]
 0062ADBE    add         edx,edx
 0062ADC0    mov         ecx,eax
 0062ADC2    and         cl,1
 0062ADC5    or          dl,cl
 0062ADC7    mov         byte ptr [esi+456],dl
 0062ADCD    cmp         dl,al
>0062ADCF    je          0062ADE3
 0062ADD1    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062ADD7    mov         ecx,28
 0062ADDC    mov         eax,esi
 0062ADDE    call        TManagedHidObject.SendReport
 0062ADE3    pop         esi
 0062ADE4    ret
*}
end;

//0062ADE8
procedure TPS3ControllerObject.SetMode;
begin
{*
 0062ADE8    push        ebp
 0062ADE9    mov         ebp,esp
 0062ADEB    add         esp,0FFFFFFB8
 0062ADEE    push        ebx
 0062ADEF    push        esi
 0062ADF0    push        edi
 0062ADF1    xor         edx,edx
 0062ADF3    mov         dword ptr [ebp-40],edx
 0062ADF6    mov         dword ptr [ebp-44],edx
 0062ADF9    mov         dword ptr [ebp-48],edx
 0062ADFC    mov         edi,eax
 0062ADFE    xor         eax,eax
 0062AE00    push        ebp
 0062AE01    push        62AFA6
 0062AE06    push        dword ptr fs:[eax]
 0062AE09    mov         dword ptr fs:[eax],esp
 0062AE0C    mov         byte ptr [ebp-6],0F4
 0062AE10    mov         byte ptr [ebp-5],42
 0062AE14    mov         byte ptr [ebp-4],3
 0062AE18    mov         byte ptr [ebp-3],0
 0062AE1C    mov         byte ptr [ebp-2],0
 0062AE20    lea         edx,[ebp-6]
 0062AE23    mov         ecx,4
 0062AE28    mov         eax,edi
 0062AE2A    call        TManagedHidObject.SendFeatureReport
 0062AE2F    mov         dword ptr [edi+230],5E353F7D;TPS3ControllerObject.DegPerGyro:Double
 0062AE39    mov         dword ptr [edi+234],3FE849BA;TPS3ControllerObject.?f234:dword
 0062AE43    lea         eax,[edi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062AE49    xor         ecx,ecx
 0062AE4B    mov         edx,2A
 0062AE50    call        @FillChar
 0062AE55    mov         byte ptr [edi+44C],1;TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062AE5C    cmp         byte ptr [edi+477],0;TPS3ControllerObject.FUseGyro:Boolean
>0062AE63    je          0062AE73
 0062AE65    mov         byte ptr [edi+450],0FF
 0062AE6C    mov         byte ptr [edi+451],72
 0062AE73    xor         ebx,ebx
 0062AE75    lea         eax,[ebx+ebx*4]
 0062AE78    mov         byte ptr [edi+eax+457],0FF
 0062AE80    mov         byte ptr [edi+eax+459],10
 0062AE88    mov         byte ptr [edi+eax+45A],10
 0062AE90    mov         byte ptr [edi+eax+45B],10
 0062AE98    inc         ebx
 0062AE99    cmp         ebx,6
>0062AE9C    jne         0062AE75
 0062AE9E    lea         edx,[edi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062AEA4    mov         ecx,28
 0062AEA9    mov         eax,edi
 0062AEAB    call        TManagedHidObject.SendReport
 0062AEB0    lea         eax,[edi+444];TPS3ControllerObject.FeatureF5:?
 0062AEB6    xor         ecx,ecx
 0062AEB8    mov         edx,8
 0062AEBD    call        @FillChar
 0062AEC2    mov         byte ptr [edi+444],0F5;TPS3ControllerObject.FeatureF5:?
 0062AEC9    push        8
 0062AECB    lea         ecx,[edi+444];TPS3ControllerObject.FeatureF5:?
 0062AED1    mov         dl,0F5
 0062AED3    mov         eax,edi
 0062AED5    call        TManagedHidObject.GetFeatureReport
 0062AEDA    xor         ebx,ebx
 0062AEDC    mov         esi,31
 0062AEE1    lea         eax,[ebp-3B]
 0062AEE4    mov         ecx,0ED
 0062AEE9    mov         edx,35
 0062AEEE    call        @FillChar
 0062AEF3    mov         byte ptr [ebp-3B],bl
 0062AEF6    push        esi
 0062AEF7    mov         edx,ebx
 0062AEF9    lea         ecx,[ebp-3B]
 0062AEFC    mov         eax,edi
 0062AEFE    call        TManagedHidObject.GetFeatureReport
 0062AF03    test        al,al
>0062AF05    je          0062AF42
 0062AF07    push        62AFC0;'Feature '
 0062AF0C    lea         ecx,[ebp-44]
 0062AF0F    mov         edx,2
 0062AF14    mov         eax,ebx
 0062AF16    call        IntToHex
 0062AF1B    push        dword ptr [ebp-44]
 0062AF1E    push        62AFE0;':    '
 0062AF23    lea         ecx,[ebp-48]
 0062AF26    lea         eax,[ebp-3B]
 0062AF29    mov         edx,esi
 0062AF2B    call        004F90D8
 0062AF30    push        dword ptr [ebp-48]
 0062AF33    lea         eax,[ebp-40]
 0062AF36    mov         edx,4
 0062AF3B    call        @UStrCatN
>0062AF40    jmp         0062AF48
 0062AF42    inc         esi
 0062AF43    cmp         esi,33
>0062AF46    jne         0062AEE1
 0062AF48    inc         ebx
 0062AF49    cmp         ebx,100
>0062AF4F    jne         0062AEDC
 0062AF51    lea         eax,[edi+444];TPS3ControllerObject.FeatureF5:?
 0062AF57    xor         ecx,ecx
 0062AF59    mov         edx,8
 0062AF5E    call        @FillChar
 0062AF63    mov         byte ptr [edi+444],0F5;TPS3ControllerObject.FeatureF5:?
 0062AF6A    push        8
 0062AF6C    lea         ecx,[edi+444];TPS3ControllerObject.FeatureF5:?
 0062AF72    mov         dl,0F5
 0062AF74    mov         eax,edi
 0062AF76    call        TManagedHidObject.GetFeatureReport
 0062AF7B    cmp         byte ptr [edi+477],0;TPS3ControllerObject.FUseGyro:Boolean
>0062AF82    je          0062AF8B
 0062AF84    mov         eax,edi
 0062AF86    call        TAccelerometerObject.ResetGyroCalibration
 0062AF8B    xor         eax,eax
 0062AF8D    pop         edx
 0062AF8E    pop         ecx
 0062AF8F    pop         ecx
 0062AF90    mov         dword ptr fs:[eax],edx
 0062AF93    push        62AFAD
 0062AF98    lea         eax,[ebp-48]
 0062AF9B    mov         edx,3
 0062AFA0    call        @UStrArrayClr
 0062AFA5    ret
>0062AFA6    jmp         @HandleFinally
>0062AFAB    jmp         0062AF98
 0062AFAD    pop         edi
 0062AFAE    pop         esi
 0062AFAF    pop         ebx
 0062AFB0    mov         esp,ebp
 0062AFB2    pop         ebp
 0062AFB3    ret
*}
end;

//0062AFEC
procedure TPS3ControllerObject.SetNumber(Value:Integer);
begin
{*
 0062AFEC    push        esi
 0062AFED    mov         esi,eax
 0062AFEF    mov         dword ptr [esi+47C],edx;TPS3ControllerObject.FNumber:Integer
 0062AFF5    mov         eax,dword ptr [esi+4];TPS3ControllerObject.FManager:TComponent
 0062AFF8    cmp         byte ptr [eax+134],0
>0062AFFF    je          0062B01C
 0062B001    cmp         byte ptr [esi+476],0;TPS3ControllerObject.FUseSixaxis:Boolean
>0062B008    je          0062B013
 0062B00A    mov         eax,esi
 0062B00C    mov         ecx,dword ptr [eax]
 0062B00E    call        dword ptr [ecx+44];TPS3ControllerObject.SetPlayerLed
>0062B011    jmp         0062B01C
 0062B013    xor         edx,edx
 0062B015    mov         eax,esi
 0062B017    mov         ecx,dword ptr [eax]
 0062B019    call        dword ptr [ecx+44];TPS3ControllerObject.SetPlayerLed
 0062B01C    pop         esi
 0062B01D    ret
*}
end;

//0062B020
procedure TPS3ControllerObject.SetPlayerLed(Value:ShortInt);
begin
{*
 0062B020    push        esi
 0062B021    mov         esi,eax
 0062B023    cmp         dl,byte ptr [esi+489];TPS3ControllerObject.FPlayerLed:ShortInt
>0062B029    je          0062B2F1
 0062B02F    mov         eax,edx
 0062B031    mov         byte ptr [esi+489],al;TPS3ControllerObject.FPlayerLed:ShortInt
 0062B037    cmp         byte ptr [esi+18],0;TPS3ControllerObject.Connected:Boolean
>0062B03B    je          0062B2F1
 0062B041    movsx       eax,al
 0062B044    cmp         eax,2E
>0062B047    ja          0062B1CF
 0062B04D    jmp         dword ptr [eax*4+62B054]
 0062B04D    dd          0062B110
 0062B04D    dd          0062B117
 0062B04D    dd          0062B11E
 0062B04D    dd          0062B125
 0062B04D    dd          0062B12C
 0062B04D    dd          0062B133
 0062B04D    dd          0062B13A
 0062B04D    dd          0062B141
 0062B04D    dd          0062B148
 0062B04D    dd          0062B14F
 0062B04D    dd          0062B153
 0062B04D    dd          0062B157
 0062B04D    dd          0062B15B
 0062B04D    dd          0062B15F
 0062B04D    dd          0062B163
 0062B04D    dd          0062B167
 0062B04D    dd          0062B16B
 0062B04D    dd          0062B16F
 0062B04D    dd          0062B173
 0062B04D    dd          0062B177
 0062B04D    dd          0062B17B
 0062B04D    dd          0062B17F
 0062B04D    dd          0062B183
 0062B04D    dd          0062B187
 0062B04D    dd          0062B18B
 0062B04D    dd          0062B18F
 0062B04D    dd          0062B1CF
 0062B04D    dd          0062B1CF
 0062B04D    dd          0062B1CF
 0062B04D    dd          0062B1CF
 0062B04D    dd          0062B193
 0062B04D    dd          0062B197
 0062B04D    dd          0062B19B
 0062B04D    dd          0062B19F
 0062B04D    dd          0062B1A3
 0062B04D    dd          0062B1A7
 0062B04D    dd          0062B1AB
 0062B04D    dd          0062B1AF
 0062B04D    dd          0062B1CF
 0062B04D    dd          0062B1CF
 0062B04D    dd          0062B1B3
 0062B04D    dd          0062B1B7
 0062B04D    dd          0062B1BB
 0062B04D    dd          0062B1BF
 0062B04D    dd          0062B1C3
 0062B04D    dd          0062B1C7
 0062B04D    dd          0062B1CB
 0062B110    xor         edx,edx
>0062B112    jmp         0062B1D1
 0062B117    mov         dl,1
>0062B119    jmp         0062B1D1
 0062B11E    mov         dl,2
>0062B120    jmp         0062B1D1
 0062B125    mov         dl,4
>0062B127    jmp         0062B1D1
 0062B12C    mov         dl,8
>0062B12E    jmp         0062B1D1
 0062B133    mov         dl,9
>0062B135    jmp         0062B1D1
 0062B13A    mov         dl,0A
>0062B13C    jmp         0062B1D1
 0062B141    mov         dl,0C
>0062B143    jmp         0062B1D1
 0062B148    mov         dl,0D
>0062B14A    jmp         0062B1D1
 0062B14F    mov         dl,0E
>0062B151    jmp         0062B1D1
 0062B153    mov         dl,0F
>0062B155    jmp         0062B1D1
 0062B157    mov         dl,6
>0062B159    jmp         0062B1D1
 0062B15B    mov         dl,3
>0062B15D    jmp         0062B1D1
 0062B15F    mov         dl,5
>0062B161    jmp         0062B1D1
 0062B163    mov         dl,0B
>0062B165    jmp         0062B1D1
 0062B167    mov         dl,7
>0062B169    jmp         0062B1D1
 0062B16B    mov         dl,0B
>0062B16D    jmp         0062B1D1
 0062B16F    mov         dl,0D
>0062B171    jmp         0062B1D1
 0062B173    mov         dl,0F
>0062B175    jmp         0062B1D1
 0062B177    mov         dl,0F
>0062B179    jmp         0062B1D1
 0062B17B    mov         dl,2
>0062B17D    jmp         0062B1D1
 0062B17F    mov         dl,3
>0062B181    jmp         0062B1D1
 0062B183    mov         dl,2
>0062B185    jmp         0062B1D1
 0062B187    mov         dl,6
>0062B189    jmp         0062B1D1
 0062B18B    mov         dl,0A
>0062B18D    jmp         0062B1D1
 0062B18F    mov         dl,0B
>0062B191    jmp         0062B1D1
 0062B193    mov         dl,4
>0062B195    jmp         0062B1D1
 0062B197    mov         dl,5
>0062B199    jmp         0062B1D1
 0062B19B    mov         dl,6
>0062B19D    jmp         0062B1D1
 0062B19F    mov         dl,7
>0062B1A1    jmp         0062B1D1
 0062B1A3    mov         dl,0C
>0062B1A5    jmp         0062B1D1
 0062B1A7    mov         dl,0D
>0062B1A9    jmp         0062B1D1
 0062B1AB    mov         dl,0E
>0062B1AD    jmp         0062B1D1
 0062B1AF    mov         dl,0F
>0062B1B1    jmp         0062B1D1
 0062B1B3    mov         dl,8
>0062B1B5    jmp         0062B1D1
 0062B1B7    mov         dl,9
>0062B1B9    jmp         0062B1D1
 0062B1BB    mov         dl,0A
>0062B1BD    jmp         0062B1D1
 0062B1BF    mov         dl,0C
>0062B1C1    jmp         0062B1D1
 0062B1C3    mov         dl,0D
>0062B1C5    jmp         0062B1D1
 0062B1C7    mov         dl,0E
>0062B1C9    jmp         0062B1D1
 0062B1CB    mov         dl,0F
>0062B1CD    jmp         0062B1D1
 0062B1CF    mov         dl,0F
 0062B1D1    mov         eax,edx
 0062B1D3    and         al,1
 0062B1D5    test        al,al
>0062B1D7    je          0062B1ED
 0062B1D9    xor         ecx,ecx
 0062B1DB    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062B1E1    mov         dword ptr [esi+49C],3FF00000;TPS3ControllerObject.?f49C:dword
>0062B1EB    jmp         0062B246
 0062B1ED    test        dl,2
>0062B1F0    je          0062B206
 0062B1F2    xor         ecx,ecx
 0062B1F4    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062B1FA    mov         dword ptr [esi+49C],3FE80000;TPS3ControllerObject.?f49C:dword
>0062B204    jmp         0062B246
 0062B206    test        dl,4
>0062B209    je          0062B21F
 0062B20B    xor         ecx,ecx
 0062B20D    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062B213    mov         dword ptr [esi+49C],3FE00000;TPS3ControllerObject.?f49C:dword
>0062B21D    jmp         0062B246
 0062B21F    test        dl,8
>0062B222    je          0062B238
 0062B224    xor         ecx,ecx
 0062B226    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062B22C    mov         dword ptr [esi+49C],3FD00000;TPS3ControllerObject.?f49C:dword
>0062B236    jmp         0062B246
 0062B238    xor         ecx,ecx
 0062B23A    mov         dword ptr [esi+498],ecx;TPS3ControllerObject.FLedDrumLevel:Double
 0062B240    mov         dword ptr [esi+49C],ecx;TPS3ControllerObject.?f49C:dword
 0062B246    test        dl,8
>0062B249    je          0062B25F
 0062B24B    xor         eax,eax
 0062B24D    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062B253    mov         dword ptr [esi+494],3FF00000;TPS3ControllerObject.?f494:dword
>0062B25D    jmp         0062B2B7
 0062B25F    test        dl,4
>0062B262    je          0062B278
 0062B264    xor         eax,eax
 0062B266    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062B26C    mov         dword ptr [esi+494],3FE80000;TPS3ControllerObject.?f494:dword
>0062B276    jmp         0062B2B7
 0062B278    test        dl,2
>0062B27B    je          0062B291
 0062B27D    xor         eax,eax
 0062B27F    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062B285    mov         dword ptr [esi+494],3FE00000;TPS3ControllerObject.?f494:dword
>0062B28F    jmp         0062B2B7
 0062B291    test        al,al
>0062B293    je          0062B2A9
 0062B295    xor         eax,eax
 0062B297    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062B29D    mov         dword ptr [esi+494],3FD00000;TPS3ControllerObject.?f494:dword
>0062B2A7    jmp         0062B2B7
 0062B2A9    xor         eax,eax
 0062B2AB    mov         dword ptr [esi+490],eax;TPS3ControllerObject.FLedLevel:Double
 0062B2B1    mov         dword ptr [esi+494],eax;TPS3ControllerObject.?f494:dword
 0062B2B7    cmp         dl,byte ptr [esi+488];TPS3ControllerObject.FLeds:byte
>0062B2BD    je          0062B2F1
 0062B2BF    mov         byte ptr [esi+488],dl;TPS3ControllerObject.FLeds:byte
 0062B2C5    movzx       eax,byte ptr [esi+456]
 0062B2CC    add         edx,edx
 0062B2CE    mov         ecx,eax
 0062B2D0    and         cl,1
 0062B2D3    or          dl,cl
 0062B2D5    mov         byte ptr [esi+456],dl
 0062B2DB    cmp         dl,al
>0062B2DD    je          0062B2F1
 0062B2DF    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062B2E5    mov         ecx,28
 0062B2EA    mov         eax,esi
 0062B2EC    call        TManagedHidObject.SendReport
 0062B2F1    pop         esi
 0062B2F2    ret
*}
end;

//0062B2F4
{*procedure TPS3ControllerObject.SetRumble(value:Double; ?:?);
begin
 0062B2F4    push        ebp
 0062B2F5    mov         ebp,esp
 0062B2F7    push        ebx
 0062B2F8    mov         ebx,eax
 0062B2FA    fld         qword ptr [ebx+480];TPS3ControllerObject.FRumble:Double
 0062B300    fcomp       qword ptr [ebp+8]
 0062B303    wait
 0062B304    fnstsw      al
 0062B306    sahf
>0062B307    je          0062B351
 0062B309    mov         eax,dword ptr [ebp+8]
 0062B30C    mov         dword ptr [ebx+480],eax;TPS3ControllerObject.FRumble:Double
 0062B312    mov         eax,dword ptr [ebp+0C]
 0062B315    mov         dword ptr [ebx+484],eax;TPS3ControllerObject.?f484:dword
 0062B31B    mov         byte ptr [ebx+450],0FF
 0062B322    fld         qword ptr [ebp+8]
 0062B325    fmul        dword ptr ds:[62B358];255:Single
 0062B32B    call        @ROUND
 0062B330    cmp         eax,0FF
>0062B335    jle         0062B33E
 0062B337    mov         eax,0FF
>0062B33C    jmp         0062B344
 0062B33E    test        eax,eax
>0062B340    jge         0062B344
 0062B342    xor         eax,eax
 0062B344    mov         byte ptr [ebx+451],al
 0062B34A    mov         eax,ebx
 0062B34C    call        TAccelerometerObject.ResetGyroCalibration
 0062B351    pop         ebx
 0062B352    pop         ebp
 0062B353    ret         8
end;*}

//0062B35C
procedure TPS3ControllerObject.ShowCalibrating(value:Boolean);
begin
{*
 0062B35C    push        esi
 0062B35D    mov         esi,eax
 0062B35F    test        dl,dl
>0062B361    jne         0062B37C
 0062B363    cmp         byte ptr [esi+488],6;TPS3ControllerObject.FLeds:byte
>0062B36A    jne         0062B37C
 0062B36C    movzx       edx,byte ptr [esi+47C];TPS3ControllerObject.FNumber:Integer
 0062B373    mov         eax,esi
 0062B375    mov         ecx,dword ptr [eax]
 0062B377    call        dword ptr [ecx+44];TPS3ControllerObject.SetPlayerLed
 0062B37A    pop         esi
 0062B37B    ret
 0062B37C    cmp         dl,1
>0062B37F    jne         0062B38A
 0062B381    mov         dl,6
 0062B383    mov         eax,esi
 0062B385    mov         ecx,dword ptr [eax]
 0062B387    call        dword ptr [ecx+3C];TPS3ControllerObject.SetLeds
 0062B38A    pop         esi
 0062B38B    ret
*}
end;

//0062B38C
procedure TPS3ControllerObject.ShowConnecting;
begin
{*
 0062B38C    push        esi
 0062B38D    mov         esi,eax
 0062B38F    mov         al,9
 0062B391    movzx       edx,byte ptr [esi+456]
 0062B398    mov         ecx,eax
 0062B39A    add         ecx,ecx
 0062B39C    mov         eax,edx
 0062B39E    and         al,1
 0062B3A0    or          cl,al
 0062B3A2    mov         byte ptr [esi+456],cl
 0062B3A8    cmp         cl,dl
>0062B3AA    je          0062B3BE
 0062B3AC    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062B3B2    mov         ecx,28
 0062B3B7    mov         eax,esi
 0062B3B9    call        TManagedHidObject.SendReport
 0062B3BE    pop         esi
 0062B3BF    ret
*}
end;

//0062B3C0
function TPS3ControllerObject.Square:Boolean;
begin
{*
 0062B3C0    test        byte ptr [eax+4A8],80;TPS3ControllerObject.Buttons:Cardinal
 0062B3C7    setne       al
 0062B3CA    ret
*}
end;

//0062B3CC
procedure TPS3ControllerObject.SquareAnalog;
begin
{*
 0062B3CC    add         esp,0FFFFFFF4
 0062B3CF    movzx       eax,byte ptr [eax+4F9];TPS3ControllerObject.?f4F9:byte
 0062B3D6    mov         dword ptr [esp+8],eax
 0062B3DA    fild        dword ptr [esp+8]
 0062B3DE    fdiv        dword ptr ds:[62B3F0];255:Single
 0062B3E4    fstp        qword ptr [esp]
 0062B3E7    wait
 0062B3E8    fld         qword ptr [esp]
 0062B3EB    add         esp,0C
 0062B3EE    ret
*}
end;

//0062B3F4
function TPS3ControllerObject.Start:Boolean;
begin
{*
 0062B3F4    test        byte ptr [eax+4A9],8;TPS3ControllerObject.?f4A9:byte
 0062B3FB    setne       al
 0062B3FE    ret
*}
end;

//0062B400
procedure TPS3ControllerObject.Stop;
begin
{*
 0062B400    push        ebx
 0062B401    mov         ebx,eax
 0062B403    cmp         dword ptr [ebx+20],0;TPS3ControllerObject.Dev:TJvHidDevice
>0062B407    je          0062B421
 0062B409    mov         eax,[0078D590];^Application:TApplication
 0062B40E    mov         eax,dword ptr [eax]
 0062B410    call        TApplication.ProcessMessages
 0062B415    push        0
 0062B417    push        0
 0062B419    mov         eax,dword ptr [ebx+20];TPS3ControllerObject.Dev:TJvHidDevice
 0062B41C    call        005DF390
 0062B421    cmp         byte ptr [ebx+19],0;TPS3ControllerObject.Unplugged:Boolean
>0062B425    jne         0062B42E
 0062B427    mov         eax,ebx
 0062B429    mov         edx,dword ptr [eax]
 0062B42B    call        dword ptr [edx+30];TPS3ControllerObject.SwitchOff
 0062B42E    mov         eax,ebx
 0062B430    call        TManagedHidObject.CheckIn
 0062B435    pop         ebx
 0062B436    ret
*}
end;

//0062B438
procedure TPS3ControllerObject.SwitchOff;
begin
{*
 0062B438    push        esi
 0062B439    mov         esi,eax
 0062B43B    xor         edx,edx
 0062B43D    movzx       eax,byte ptr [esi+456]
 0062B444    add         edx,edx
 0062B446    and         al,1
 0062B448    or          dl,al
 0062B44A    mov         eax,edx
 0062B44C    mov         byte ptr [esi+456],al
 0062B452    mov         byte ptr [esi+44E],0
 0062B459    mov         byte ptr [esi+44F],0
 0062B460    mov         byte ptr [esi+450],0
 0062B467    mov         byte ptr [esi+451],0
 0062B46E    xor         eax,eax
 0062B470    mov         dword ptr [esi+480],eax;TPS3ControllerObject.FRumble:Double
 0062B476    mov         dword ptr [esi+484],eax;TPS3ControllerObject.?f484:dword
 0062B47C    lea         edx,[esi+44C];TPS3ControllerObject.OutputReport:TSixAxisOutputReport
 0062B482    mov         ecx,28
 0062B487    mov         eax,esi
 0062B489    call        TManagedHidObject.SendReport
 0062B48E    pop         esi
 0062B48F    ret
*}
end;

//0062B490
procedure TPS3ControllerObject.TAnalog;
begin
{*
 0062B490    add         esp,0FFFFFFF4
 0062B493    movzx       eax,byte ptr [eax+4E7];TPS3ControllerObject.?f4E7:byte
 0062B49A    mov         dword ptr [esp+8],eax
 0062B49E    fild        dword ptr [esp+8]
 0062B4A2    fdiv        dword ptr ds:[62B4B4];255:Single
 0062B4A8    fstp        qword ptr [esp]
 0062B4AB    wait
 0062B4AC    fld         qword ptr [esp]
 0062B4AF    add         esp,0C
 0062B4B2    ret
*}
end;

//0062B4B8
function TPS3ControllerObject.TButton:Boolean;
begin
{*
 0062B4B8    test        byte ptr [eax+4AA],10;TPS3ControllerObject.?f4AA:byte
 0062B4BF    setne       al
 0062B4C2    ret
*}
end;

//0062B4C4
function TPS3ControllerObject.Triangle:Boolean;
begin
{*
 0062B4C4    test        byte ptr [eax+4A8],10;TPS3ControllerObject.Buttons:Cardinal
 0062B4CB    setne       al
 0062B4CE    ret
*}
end;

//0062B4D0
procedure TPS3ControllerObject.TriangleAnalog;
begin
{*
 0062B4D0    add         esp,0FFFFFFF4
 0062B4D3    movzx       eax,byte ptr [eax+4F6];TPS3ControllerObject.?f4F6:byte
 0062B4DA    mov         dword ptr [esp+8],eax
 0062B4DE    fild        dword ptr [esp+8]
 0062B4E2    fdiv        dword ptr ds:[62B4F4];255:Single
 0062B4E8    fstp        qword ptr [esp]
 0062B4EB    wait
 0062B4EC    fld         qword ptr [esp]
 0062B4EF    add         esp,0C
 0062B4F2    ret
*}
end;

//0062B4F8
function TPS3ControllerObject.Up:Boolean;
begin
{*
 0062B4F8    test        byte ptr [eax+4A9],10;TPS3ControllerObject.?f4A9:byte
 0062B4FF    setne       al
 0062B502    ret
*}
end;

//0062B504
procedure TPS3ControllerObject.UpAnalog;
begin
{*
 0062B504    add         esp,0FFFFFFF4
 0062B507    movzx       eax,byte ptr [eax+4EE];TPS3ControllerObject.?f4EE:byte
 0062B50E    mov         dword ptr [esp+8],eax
 0062B512    fild        dword ptr [esp+8]
 0062B516    fdiv        dword ptr ds:[62B528];255:Single
 0062B51C    fstp        qword ptr [esp]
 0062B51F    wait
 0062B520    fld         qword ptr [esp]
 0062B523    add         esp,0C
 0062B526    ret
*}
end;

//0062B52C
procedure TPS3ControllerObject.UpdateSteering;
begin
{*
 0062B52C    push        ebx
 0062B52D    add         esp,0FFFFFF78
 0062B533    mov         ebx,eax
 0062B535    fld         qword ptr [ebx+348];TPS3ControllerObject.gz:Double
 0062B53B    fabs
 0062B53D    fstp        tbyte ptr [esp+7C]
 0062B541    wait
 0062B542    fld         qword ptr [ebx+340];TPS3ControllerObject.gy:Double
 0062B548    fabs
 0062B54A    fld         tbyte ptr [esp+7C]
 0062B54E    fcompp
 0062B550    wait
 0062B551    fnstsw      al
 0062B553    sahf
>0062B554    jbe         0062B616
 0062B55A    fld         qword ptr [ebx+348];TPS3ControllerObject.gz:Double
 0062B560    fcomp       dword ptr ds:[62B6D4];0:Single
 0062B566    wait
 0062B567    fnstsw      al
 0062B569    sahf
>0062B56A    jbe         0062B5A7
 0062B56C    fld         qword ptr [ebx+338];TPS3ControllerObject.gx:Double
 0062B572    fchs
 0062B574    fdiv        qword ptr [ebx+330];TPS3ControllerObject.lng:Double
 0062B57A    add         esp,0FFFFFFF4
 0062B57D    fstp        tbyte ptr [esp]
 0062B580    wait
 0062B581    call        00454A44
 0062B586    fstp        tbyte ptr [esp]
 0062B589    wait
 0062B58A    fld         tbyte ptr [esp]
 0062B58D    fld         tbyte ptr ds:[62B6D8];57.2957795130823:Extended
 0062B593    fmulp       st(1),st
 0062B595    fstp        tbyte ptr [esp+10]
 0062B599    wait
 0062B59A    fld         tbyte ptr [esp+10]
 0062B59E    fstp        qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B5A4    wait
>0062B5A5    jmp         0062B5E8
 0062B5A7    fld         qword ptr [ebx+338];TPS3ControllerObject.gx:Double
 0062B5AD    fchs
 0062B5AF    fdiv        qword ptr [ebx+330];TPS3ControllerObject.lng:Double
 0062B5B5    add         esp,0FFFFFFF4
 0062B5B8    fstp        tbyte ptr [esp]
 0062B5BB    wait
 0062B5BC    call        00454A44
 0062B5C1    fstp        tbyte ptr [esp+20]
 0062B5C5    wait
 0062B5C6    fld         tbyte ptr [esp+20]
 0062B5CA    fld         tbyte ptr ds:[62B6D8];57.2957795130823:Extended
 0062B5D0    fmulp       st(1),st
 0062B5D2    fstp        tbyte ptr [esp+30]
 0062B5D6    wait
 0062B5D7    fld         tbyte ptr [esp+30]
 0062B5DB    fsubr       dword ptr ds:[62B6E4];180:Single
 0062B5E1    fstp        qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B5E7    wait
 0062B5E8    fld         qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B5EE    fcomp       dword ptr ds:[62B6E4];180:Single
 0062B5F4    wait
 0062B5F5    fnstsw      al
 0062B5F7    sahf
>0062B5F8    jbe         0062B6CB
 0062B5FE    fld         qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B604    fsub        dword ptr ds:[62B6E8];360:Single
 0062B60A    fstp        qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B610    wait
>0062B611    jmp         0062B6CB
 0062B616    fld         qword ptr [ebx+340];TPS3ControllerObject.gy:Double
 0062B61C    fcomp       dword ptr ds:[62B6D4];0:Single
 0062B622    wait
 0062B623    fnstsw      al
 0062B625    sahf
>0062B626    jbe         0062B665
 0062B628    fld         qword ptr [ebx+338];TPS3ControllerObject.gx:Double
 0062B62E    fchs
 0062B630    fdiv        qword ptr [ebx+330];TPS3ControllerObject.lng:Double
 0062B636    add         esp,0FFFFFFF4
 0062B639    fstp        tbyte ptr [esp]
 0062B63C    wait
 0062B63D    call        00454A44
 0062B642    fstp        tbyte ptr [esp+40]
 0062B646    wait
 0062B647    fld         tbyte ptr [esp+40]
 0062B64B    fld         tbyte ptr ds:[62B6D8];57.2957795130823:Extended
 0062B651    fmulp       st(1),st
 0062B653    fstp        tbyte ptr [esp+50]
 0062B657    wait
 0062B658    fld         tbyte ptr [esp+50]
 0062B65C    fstp        qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B662    wait
>0062B663    jmp         0062B6A6
 0062B665    fld         qword ptr [ebx+338];TPS3ControllerObject.gx:Double
 0062B66B    fchs
 0062B66D    fdiv        qword ptr [ebx+330];TPS3ControllerObject.lng:Double
 0062B673    add         esp,0FFFFFFF4
 0062B676    fstp        tbyte ptr [esp]
 0062B679    wait
 0062B67A    call        00454A44
 0062B67F    fstp        tbyte ptr [esp+60]
 0062B683    wait
 0062B684    fld         tbyte ptr [esp+60]
 0062B688    fld         tbyte ptr ds:[62B6D8];57.2957795130823:Extended
 0062B68E    fmulp       st(1),st
 0062B690    fstp        tbyte ptr [esp+70]
 0062B694    wait
 0062B695    fld         tbyte ptr [esp+70]
 0062B699    fsubr       dword ptr ds:[62B6E4];180:Single
 0062B69F    fstp        qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B6A5    wait
 0062B6A6    fld         qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B6AC    fcomp       dword ptr ds:[62B6E4];180:Single
 0062B6B2    wait
 0062B6B3    fnstsw      al
 0062B6B5    sahf
>0062B6B6    jbe         0062B6CB
 0062B6B8    fld         qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B6BE    fsub        dword ptr ds:[62B6E8];360:Single
 0062B6C4    fstp        qword ptr [ebx+3E0];TPS3ControllerObject.SteeringAngle:Double
 0062B6CA    wait
 0062B6CB    add         esp,88
 0062B6D1    pop         ebx
 0062B6D2    ret
*}
end;

//0062B6EC
procedure TSixaxisObject.ReadSixaxis;
begin
{*
 0062B6EC    push        ebx
 0062B6ED    push        esi
 0062B6EE    mov         ebx,eax
 0062B6F0    cmp         byte ptr [ebx+18],0;TSixaxisObject.Connected:Boolean
>0062B6F4    je          0062B719
 0062B6F6    cmp         byte ptr [ebx+19],0;TSixaxisObject.Unplugged:Boolean
>0062B6FA    je          0062B712
 0062B6FC    mov         esi,dword ptr [ebx+4];TSixaxisObject.FManager:TComponent
 0062B6FF    mov         eax,ebx
 0062B701    call        TPS3ControllerObject.Stop
 0062B706    mov         edx,ebx
 0062B708    mov         eax,esi
 0062B70A    call        TWiimoteManager.RemoveSixaxis
 0062B70F    pop         esi
 0062B710    pop         ebx
 0062B711    ret
 0062B712    mov         eax,ebx
 0062B714    call        TPS3ControllerObject.ReadSixaxis
 0062B719    pop         esi
 0062B71A    pop         ebx
 0062B71B    ret
*}
end;

//0062C0E8
procedure sub_0062C0E8;
begin
{*
 0062C0E8    push        ebp
 0062C0E9    mov         ebp,esp
 0062C0EB    mov         ecx,9
 0062C0F0    push        0
 0062C0F2    push        0
 0062C0F4    dec         ecx
>0062C0F5    jne         0062C0F0
 0062C0F7    push        ebx
 0062C0F8    push        esi
 0062C0F9    push        edi
 0062C0FA    xor         eax,eax
 0062C0FC    push        ebp
 0062C0FD    push        62C329
 0062C102    push        dword ptr fs:[eax]
 0062C105    mov         dword ptr fs:[eax],esp
 0062C108    xor         eax,eax
 0062C10A    push        ebp
 0062C10B    push        62C154
 0062C110    push        dword ptr fs:[eax]
 0062C113    mov         dword ptr fs:[eax],esp
 0062C116    lea         edx,[ebp-10]
 0062C119    xor         eax,eax
 0062C11B    call        ParamStr
 0062C120    mov         eax,dword ptr [ebp-10]
 0062C123    lea         edx,[ebp-0C]
 0062C126    call        ExtractFileDir
 0062C12B    lea         eax,[ebp-0C]
 0062C12E    mov         edx,62C344;'\wiimote.ini'
 0062C133    call        @UStrCat
 0062C138    mov         ecx,dword ptr [ebp-0C]
 0062C13B    mov         dl,1
 0062C13D    mov         eax,[004598F4];TIniFile
 0062C142    call        TCustomIniFile.Create;TIniFile.Create
 0062C147    mov         dword ptr [ebp-4],eax
 0062C14A    xor         eax,eax
 0062C14C    pop         edx
 0062C14D    pop         ecx
 0062C14E    pop         ecx
 0062C14F    mov         dword ptr fs:[eax],edx
>0062C152    jmp         0062C168
>0062C154    jmp         @HandleAnyException
 0062C159    call        @DoneExcept
>0062C15E    jmp         0062C30E
 0062C163    call        @DoneExcept
 0062C168    xor         eax,eax
 0062C16A    push        ebp
 0062C16B    push        62C307
 0062C170    push        dword ptr fs:[eax]
 0062C173    mov         dword ptr fs:[eax],esp
 0062C176    mov         eax,[0081ECA0];gvar_0081ECA0
 0062C17B    test        eax,eax
>0062C17D    jle         0062C2F1
 0062C183    mov         dword ptr [ebp-8],eax
 0062C186    mov         esi,1
 0062C18B    mov         ebx,81D938;gvar_0081D938:Integer
 0062C190    push        8D
 0062C192    lea         edx,[ebp-18]
 0062C195    mov         eax,esi
 0062C197    call        IntToStr
 0062C19C    mov         ecx,dword ptr [ebp-18]
 0062C19F    lea         eax,[ebp-14]
 0062C1A2    mov         edx,62C36C;'Sixaxis'
 0062C1A7    call        @UStrCat3
 0062C1AC    mov         edx,dword ptr [ebp-14]
 0062C1AF    mov         ecx,62C388;'MinX'
 0062C1B4    mov         eax,dword ptr [ebp-4]
 0062C1B7    mov         edi,dword ptr [eax]
 0062C1B9    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 0062C1BC    mov         dword ptr [ebx],eax
 0062C1BE    push        73
 0062C1C0    lea         edx,[ebp-20]
 0062C1C3    mov         eax,esi
 0062C1C5    call        IntToStr
 0062C1CA    mov         ecx,dword ptr [ebp-20]
 0062C1CD    lea         eax,[ebp-1C]
 0062C1D0    mov         edx,62C36C;'Sixaxis'
 0062C1D5    call        @UStrCat3
 0062C1DA    mov         edx,dword ptr [ebp-1C]
 0062C1DD    mov         ecx,62C3A0;'MaxX'
 0062C1E2    mov         eax,dword ptr [ebp-4]
 0062C1E5    mov         edi,dword ptr [eax]
 0062C1E7    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 0062C1EA    mov         dword ptr [ebx+4],eax
 0062C1ED    push        8D
 0062C1EF    lea         edx,[ebp-28]
 0062C1F2    mov         eax,esi
 0062C1F4    call        IntToStr
 0062C1F9    mov         ecx,dword ptr [ebp-28]
 0062C1FC    lea         eax,[ebp-24]
 0062C1FF    mov         edx,62C36C;'Sixaxis'
 0062C204    call        @UStrCat3
 0062C209    mov         edx,dword ptr [ebp-24]
 0062C20C    mov         ecx,62C3B8;'MinY'
 0062C211    mov         eax,dword ptr [ebp-4]
 0062C214    mov         edi,dword ptr [eax]
 0062C216    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 0062C219    mov         dword ptr [ebx+8],eax
 0062C21C    push        73
 0062C21E    lea         edx,[ebp-30]
 0062C221    mov         eax,esi
 0062C223    call        IntToStr
 0062C228    mov         ecx,dword ptr [ebp-30]
 0062C22B    lea         eax,[ebp-2C]
 0062C22E    mov         edx,62C36C;'Sixaxis'
 0062C233    call        @UStrCat3
 0062C238    mov         edx,dword ptr [ebp-2C]
 0062C23B    mov         ecx,62C3D0;'MaxY'
 0062C240    mov         eax,dword ptr [ebp-4]
 0062C243    mov         edi,dword ptr [eax]
 0062C245    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 0062C248    mov         dword ptr [ebx+0C],eax
 0062C24B    push        8D
 0062C24D    lea         edx,[ebp-38]
 0062C250    mov         eax,esi
 0062C252    call        IntToStr
 0062C257    mov         ecx,dword ptr [ebp-38]
 0062C25A    lea         eax,[ebp-34]
 0062C25D    mov         edx,62C36C;'Sixaxis'
 0062C262    call        @UStrCat3
 0062C267    mov         edx,dword ptr [ebp-34]
 0062C26A    mov         ecx,62C3E8;'MinZ'
 0062C26F    mov         eax,dword ptr [ebp-4]
 0062C272    mov         edi,dword ptr [eax]
 0062C274    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 0062C277    mov         dword ptr [ebx+10],eax
 0062C27A    push        73
 0062C27C    lea         edx,[ebp-40]
 0062C27F    mov         eax,esi
 0062C281    call        IntToStr
 0062C286    mov         ecx,dword ptr [ebp-40]
 0062C289    lea         eax,[ebp-3C]
 0062C28C    mov         edx,62C36C;'Sixaxis'
 0062C291    call        @UStrCat3
 0062C296    mov         edx,dword ptr [ebp-3C]
 0062C299    mov         ecx,62C400;'MaxZ'
 0062C29E    mov         eax,dword ptr [ebp-4]
 0062C2A1    mov         edi,dword ptr [eax]
 0062C2A3    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 0062C2A6    mov         dword ptr [ebx+14],eax
 0062C2A9    push        3FE849BA
 0062C2AE    push        5E353F7D
 0062C2B3    lea         edx,[ebp-48]
 0062C2B6    mov         eax,esi
 0062C2B8    call        IntToStr
 0062C2BD    mov         ecx,dword ptr [ebp-48]
 0062C2C0    lea         eax,[ebp-44]
 0062C2C3    mov         edx,62C36C;'Sixaxis'
 0062C2C8    call        @UStrCat3
 0062C2CD    mov         edx,dword ptr [ebp-44]
 0062C2D0    mov         ecx,62C418;'DegreesPerRawGyro'
 0062C2D5    mov         eax,dword ptr [ebp-4]
 0062C2D8    mov         edi,dword ptr [eax]
 0062C2DA    call        dword ptr [edi+28];TCustomIniFile.ReadFloat
 0062C2DD    fstp        qword ptr [ebx+30]
 0062C2E0    wait
 0062C2E1    inc         esi
 0062C2E2    add         ebx,110
 0062C2E8    dec         dword ptr [ebp-8]
>0062C2EB    jne         0062C190
 0062C2F1    xor         eax,eax
 0062C2F3    pop         edx
 0062C2F4    pop         ecx
 0062C2F5    pop         ecx
 0062C2F6    mov         dword ptr fs:[eax],edx
 0062C2F9    push        62C30E
 0062C2FE    mov         eax,dword ptr [ebp-4]
 0062C301    call        TObject.Free
 0062C306    ret
>0062C307    jmp         @HandleFinally
>0062C30C    jmp         0062C2FE
 0062C30E    xor         eax,eax
 0062C310    pop         edx
 0062C311    pop         ecx
 0062C312    pop         ecx
 0062C313    mov         dword ptr fs:[eax],edx
 0062C316    push        62C330
 0062C31B    lea         eax,[ebp-48]
 0062C31E    mov         edx,10
 0062C323    call        @UStrArrayClr
 0062C328    ret
>0062C329    jmp         @HandleFinally
>0062C32E    jmp         0062C31B
 0062C330    pop         edi
 0062C331    pop         esi
 0062C332    pop         ebx
 0062C333    mov         esp,ebp
 0062C335    pop         ebp
 0062C336    ret
*}
end;

//0062C43C
{*function sub_0062C43C(?:?):Boolean;
begin
 0062C43C    push        ebp
 0062C43D    mov         ebp,esp
 0062C43F    push        64
 0062C441    mov         edx,dword ptr [ebp+8]
 0062C444    push        edx
 0062C445    push        ecx
 0062C446    push        81
 0062C44B    push        eax
 0062C44C    mov         eax,[0078DA7C];^gvar_0081D904:Pointer
 0062C451    mov         eax,dword ptr [eax]
 0062C453    call        eax
 0062C455    add         esp,14
 0062C458    test        eax,eax
 0062C45A    setge       al
 0062C45D    pop         ebp
 0062C45E    ret         4
end;*}

//0062C464
{*function sub_0062C464(?:?; ?:?; ?:Integer; ?:?):Boolean;
begin
 0062C464    push        ebp
 0062C465    mov         ebp,esp
 0062C467    push        ebx
 0062C468    push        esi
 0062C469    mov         esi,edx
 0062C46B    movzx       edx,byte ptr [ecx]
 0062C46E    push        1388
 0062C473    mov         ebx,dword ptr [ebp+8]
 0062C476    push        ebx
 0062C477    push        ecx
 0062C478    push        esi
 0062C479    movzx       edx,dl
 0062C47C    or          dx,300
 0062C481    movzx       edx,dx
 0062C484    push        edx
 0062C485    push        1
 0062C487    push        0A1
 0062C48C    push        eax
 0062C48D    mov         eax,[0078CE00];^gvar_0081D8F4:Pointer
 0062C492    mov         eax,dword ptr [eax]
 0062C494    call        eax
 0062C496    add         esp,20
 0062C499    test        eax,eax
 0062C49B    setge       al
 0062C49E    pop         esi
 0062C49F    pop         ebx
 0062C4A0    pop         ebp
 0062C4A1    ret         4
end;*}

//0062C4A4
{*function sub_0062C4A4(?:PUsb_dev_handle; ?:Integer; ?:?; ?:?; ?:?):Boolean;
begin
 0062C4A4    push        ebp
 0062C4A5    mov         ebp,esp
 0062C4A7    push        ebx
 0062C4A8    push        1388
 0062C4AD    mov         ebx,dword ptr [ebp+8]
 0062C4B0    push        ebx
 0062C4B1    mov         ebx,dword ptr [ebp+0C]
 0062C4B4    push        ebx
 0062C4B5    push        edx
 0062C4B6    or          ecx,300
 0062C4BC    push        ecx
 0062C4BD    push        9
 0062C4BF    push        21
 0062C4C1    push        eax
 0062C4C2    mov         eax,[0078CE00];^gvar_0081D8F4:Pointer
 0062C4C7    mov         eax,dword ptr [eax]
 0062C4C9    call        eax
 0062C4CB    add         esp,20
 0062C4CE    test        eax,eax
 0062C4D0    setge       al
 0062C4D3    pop         ebx
 0062C4D4    pop         ebp
 0062C4D5    ret         8
end;*}

//0062C4D8
{*function sub_0062C4D8(?:?; ?:?; ?:?; ?:?; ?:?):Boolean;
begin
 0062C4D8    push        ebp
 0062C4D9    mov         ebp,esp
 0062C4DB    push        ebx
 0062C4DC    push        3E8
 0062C4E1    mov         ebx,dword ptr [ebp+8]
 0062C4E4    push        ebx
 0062C4E5    mov         ebx,dword ptr [ebp+0C]
 0062C4E8    push        ebx
 0062C4E9    push        edx
 0062C4EA    or          ecx,200
 0062C4F0    push        ecx
 0062C4F1    push        9
 0062C4F3    push        21
 0062C4F5    push        eax
 0062C4F6    mov         eax,[0078CE00];^gvar_0081D8F4:Pointer
 0062C4FB    mov         eax,dword ptr [eax]
 0062C4FD    call        eax
 0062C4FF    add         esp,20
 0062C502    test        eax,eax
 0062C504    setge       al
 0062C507    pop         ebx
 0062C508    pop         ebp
 0062C509    ret         8
end;*}

//0062C50C
{*function sub_0062C50C(?:?; ?:?; ?:?; ?:?; ?:?):Boolean;
begin
 0062C50C    push        ebp
 0062C50D    mov         ebp,esp
 0062C50F    push        ebx
 0062C510    push        64
 0062C512    mov         ebx,dword ptr [ebp+8]
 0062C515    push        ebx
 0062C516    mov         ebx,dword ptr [ebp+0C]
 0062C519    push        ebx
 0062C51A    push        edx
 0062C51B    or          ecx,100
 0062C521    push        ecx
 0062C522    push        1
 0062C524    push        0A1
 0062C529    push        eax
 0062C52A    mov         eax,[0078CE00];^gvar_0081D8F4:Pointer
 0062C52F    mov         eax,dword ptr [eax]
 0062C531    call        eax
 0062C533    add         esp,20
 0062C536    test        eax,eax
 0062C538    setge       al
 0062C53B    pop         ebx
 0062C53C    pop         ebp
 0062C53D    ret         8
end;*}

//0062C540
{*procedure sub_0062C540(?:?; ?:?; ?:?);
begin
 0062C540    push        ebx
 0062C541    push        esi
 0062C542    push        edi
 0062C543    push        ebp
 0062C544    add         esp,0FFFFFEFC
 0062C54A    mov         edi,ecx
 0062C54C    mov         ebx,edx
 0062C54E    mov         dword ptr [esp],eax
 0062C551    lea         ebp,[esp+4]
 0062C555    mov         eax,dword ptr [esp]
 0062C558    push        eax
 0062C559    mov         eax,[0078DAAC];^gvar_0081D8E0:Pointer
 0062C55E    mov         eax,dword ptr [eax]
 0062C560    call        eax
 0062C562    pop         ecx
 0062C563    mov         esi,eax
 0062C565    test        esi,esi
>0062C567    je          0062C6FD
 0062C56D    push        edi
 0062C56E    push        esi
 0062C56F    mov         eax,[0078CB34];^gvar_0081D8F8:Pointer
 0062C574    mov         eax,dword ptr [eax]
 0062C576    call        eax
 0062C578    add         esp,8
 0062C57B    test        eax,eax
>0062C57D    jge         0062C59C
 0062C57F    push        1
 0062C581    push        esi
 0062C582    mov         eax,[0078D184];^gvar_0081D900:Pointer
 0062C587    mov         eax,dword ptr [eax]
 0062C589    call        eax
 0062C58B    add         esp,8
 0062C58E    push        edi
 0062C58F    push        esi
 0062C590    mov         eax,[0078CB34];^gvar_0081D8F8:Pointer
 0062C595    mov         eax,dword ptr [eax]
 0062C597    call        eax
 0062C599    add         esp,8
 0062C59C    mov         eax,dword ptr [ebx+9]
 0062C59F    lea         eax,[eax+edi*8]
 0062C5A2    mov         eax,dword ptr [eax]
 0062C5A4    movzx       eax,byte ptr [eax+4]
 0062C5A8    dec         eax
 0062C5A9    test        eax,eax
>0062C5AB    jl          0062C5B1
 0062C5AD    inc         eax
 0062C5AE    dec         eax
>0062C5AF    jne         0062C5AE
 0062C5B1    cmp         dword ptr ds:[81ECA0],10;gvar_0081ECA0
>0062C5B8    je          0062C6FD
 0062C5BE    inc         dword ptr ds:[81ECA0];gvar_0081ECA0
 0062C5C4    imul        eax,dword ptr ds:[81ECA0],22;gvar_0081ECA0
 0062C5CB    mov         edx,dword ptr [esp]
 0062C5CE    mov         dword ptr [eax*8+81D800],edx
 0062C5D5    mov         dword ptr [eax*8+81D804],esi
 0062C5DC    mov         dword ptr [eax*8+81D808],ebx
 0062C5E3    mov         dword ptr [eax*8+81D80C],edi
 0062C5EA    xor         ebx,ebx
 0062C5EC    mov         eax,ebp
 0062C5EE    mov         ecx,0AB
 0062C5F3    mov         edx,31
 0062C5F8    call        @FillChar
 0062C5FD    mov         byte ptr [ebp],bl
 0062C600    push        31
 0062C602    mov         ecx,ebp
 0062C604    mov         edx,edi
 0062C606    mov         eax,esi
 0062C608    call        0062C464
 0062C60D    test        al,al
 0062C60F    inc         ebx
 0062C610    cmp         ebx,100
>0062C616    jne         0062C5EC
 0062C618    mov         eax,ebp
 0062C61A    xor         ecx,ecx
 0062C61C    mov         edx,100
 0062C621    call        @FillChar
 0062C626    mov         byte ptr [ebp],0F2
 0062C62A    push        11
 0062C62C    mov         ecx,ebp
 0062C62E    mov         edx,edi
 0062C630    mov         eax,esi
 0062C632    call        0062C464
 0062C637    test        al,al
 0062C639    mov         eax,ebp
 0062C63B    xor         ecx,ecx
 0062C63D    mov         edx,100
 0062C642    call        @FillChar
 0062C647    mov         byte ptr [ebp],0F5
 0062C64B    push        8
 0062C64D    mov         ecx,ebp
 0062C64F    mov         edx,edi
 0062C651    mov         eax,esi
 0062C653    call        0062C464
 0062C658    test        al,al
 0062C65A    mov         eax,ebp
 0062C65C    xor         ecx,ecx
 0062C65E    mov         edx,100
 0062C663    call        @FillChar
 0062C668    mov         byte ptr [ebp],1
 0062C66C    push        31
 0062C66E    mov         ecx,ebp
 0062C670    mov         edx,edi
 0062C672    mov         eax,esi
 0062C674    call        0062C464
 0062C679    test        al,al
 0062C67B    mov         eax,ebp
 0062C67D    xor         ecx,ecx
 0062C67F    mov         edx,100
 0062C684    call        @FillChar
 0062C689    push        ebp
 0062C68A    push        31
 0062C68C    mov         ecx,1
 0062C691    mov         edx,edi
 0062C693    mov         eax,esi
 0062C695    call        0062C50C
 0062C69A    test        al,al
 0062C69C    mov         eax,ebp
 0062C69E    xor         ecx,ecx
 0062C6A0    mov         edx,100
 0062C6A5    call        @FillChar
 0062C6AA    push        31
 0062C6AC    mov         ecx,ebp
 0062C6AE    mov         edx,edi
 0062C6B0    mov         eax,dword ptr [esp+4]
 0062C6B4    call        0062C43C
 0062C6B9    test        al,al
 0062C6BB    mov         ebx,65
 0062C6C0    mov         eax,ebp
 0062C6C2    xor         ecx,ecx
 0062C6C4    mov         edx,100
 0062C6C9    call        @FillChar
 0062C6CE    push        ebp
 0062C6CF    push        2F
 0062C6D1    mov         ecx,1
 0062C6D6    mov         edx,edi
 0062C6D8    mov         eax,esi
 0062C6DA    call        0062C50C
 0062C6DF    test        al,al
 0062C6E1    dec         ebx
>0062C6E2    jne         0062C6C0
 0062C6E4    push        edi
 0062C6E5    push        esi
 0062C6E6    mov         eax,[0078D4B4];^gvar_0081D8FC:Pointer
 0062C6EB    mov         eax,dword ptr [eax]
 0062C6ED    call        eax
 0062C6EF    add         esp,8
 0062C6F2    push        esi
 0062C6F3    mov         eax,[0078CD90];^gvar_0081D8E4:Pointer
 0062C6F8    mov         eax,dword ptr [eax]
 0062C6FA    call        eax
 0062C6FC    pop         ecx
 0062C6FD    add         esp,104
 0062C703    pop         ebp
 0062C704    pop         edi
 0062C705    pop         esi
 0062C706    pop         ebx
 0062C707    ret
end;*}

//0062C708
procedure sub_0062C708;
begin
{*
 0062C708    push        ebx
 0062C709    push        esi
 0062C70A    push        edi
 0062C70B    push        ebp
 0062C70C    add         esp,0FFFFFFE4
 0062C70F    xor         eax,eax
 0062C711    mov         [0081ECA0],eax;gvar_0081ECA0
 0062C716    call        0061992C
 0062C71B    test        al,al
>0062C71D    je          0062C82E
 0062C723    mov         eax,[0078CD14];^gvar_0081D8E8:Pointer
 0062C728    mov         eax,dword ptr [eax]
 0062C72A    call        eax
 0062C72C    test        eax,eax
>0062C72E    jl          0062C82E
 0062C734    mov         eax,[0078D20C];^gvar_0081D8EC:Pointer
 0062C739    mov         eax,dword ptr [eax]
 0062C73B    call        eax
 0062C73D    test        eax,eax
>0062C73F    jl          0062C82E
 0062C745    mov         eax,[0078CDE4];^gvar_0081D8F0:Pointer
 0062C74A    mov         eax,dword ptr [eax]
 0062C74C    call        eax
 0062C74E    mov         [0081ECB0],eax;gvar_0081ECB0
 0062C753    cmp         dword ptr ds:[81ECB0],0;gvar_0081ECB0
>0062C75A    je          0062C82E
 0062C760    mov         eax,[0081ECB0];gvar_0081ECB0
 0062C765    mov         dword ptr [esp],eax
 0062C768    cmp         dword ptr [esp],0
>0062C76C    je          0062C82E
 0062C772    mov         eax,dword ptr [esp]
 0062C775    mov         ebx,dword ptr [eax+208]
 0062C77B    test        ebx,ebx
>0062C77D    je          0062C81C
 0062C783    mov         eax,dword ptr [ebx+21E]
 0062C789    mov         dword ptr [esp+4],eax
 0062C78D    movzx       eax,byte ptr [ebx+21D]
 0062C794    test        eax,eax
>0062C796    jle         0062C812
 0062C798    mov         dword ptr [esp+14],eax
 0062C79C    mov         eax,dword ptr [esp+4]
 0062C7A0    movzx       eax,byte ptr [eax+4]
 0062C7A4    dec         eax
 0062C7A5    test        eax,eax
>0062C7A7    jl          0062C807
 0062C7A9    inc         eax
 0062C7AA    mov         dword ptr [esp+18],eax
 0062C7AE    xor         ebp,ebp
 0062C7B0    mov         eax,dword ptr [esp+4]
 0062C7B4    mov         eax,dword ptr [eax+9]
 0062C7B7    lea         eax,[eax+ebp*8]
 0062C7BA    mov         dword ptr [esp+8],eax
 0062C7BE    mov         eax,dword ptr [esp+8]
 0062C7C2    mov         edi,dword ptr [eax]
 0062C7C4    mov         eax,dword ptr [esp+8]
 0062C7C8    mov         esi,dword ptr [eax+4]
 0062C7CB    dec         esi
 0062C7CC    test        esi,esi
>0062C7CE    jl          0062C800
 0062C7D0    inc         esi
 0062C7D1    cmp         byte ptr [edi+5],3
>0062C7D5    jne         0062C7FA
 0062C7D7    cmp         word ptr [ebx+214],54C
>0062C7E0    jne         0062C7FA
 0062C7E2    cmp         word ptr [ebx+216],268
>0062C7EB    jne         0062C7FA
 0062C7ED    mov         ecx,ebp
 0062C7EF    mov         edx,dword ptr [esp+4]
 0062C7F3    mov         eax,ebx
 0062C7F5    call        0062C540
 0062C7FA    add         edi,15
 0062C7FD    dec         esi
>0062C7FE    jne         0062C7D1
 0062C800    inc         ebp
 0062C801    dec         dword ptr [esp+18]
>0062C805    jne         0062C7B0
 0062C807    add         dword ptr [esp+4],15
 0062C80C    dec         dword ptr [esp+14]
>0062C810    jne         0062C79C
 0062C812    mov         ebx,dword ptr [ebx]
 0062C814    test        ebx,ebx
>0062C816    jne         0062C783
 0062C81C    mov         eax,dword ptr [esp]
 0062C81F    mov         eax,dword ptr [eax]
 0062C821    mov         dword ptr [esp],eax
 0062C824    cmp         dword ptr [esp],0
>0062C828    jne         0062C772
 0062C82E    add         esp,1C
 0062C831    pop         ebp
 0062C832    pop         edi
 0062C833    pop         esi
 0062C834    pop         ebx
 0062C835    ret
*}
end;

//0062C838
{*procedure sub_0062C838(?:?; ?:?; ?:?);
begin
 0062C838    push        ebx
 0062C839    push        esi
 0062C83A    push        edi
 0062C83B    push        ebp
 0062C83C    add         esp,0FFFFFFF0
 0062C83F    mov         dword ptr [esp+8],ecx
 0062C843    mov         dword ptr [esp+4],edx
 0062C847    mov         dword ptr [esp],eax
 0062C84A    mov         ebx,81ECA0;gvar_0081ECA0
 0062C84F    mov         edi,81D910;gvar_0081D910
 0062C854    cmp         dword ptr [ebx],10
>0062C857    je          0062CAEB
 0062C85D    inc         dword ptr [ebx]
 0062C85F    mov         eax,dword ptr [esp]
 0062C862    push        eax
 0062C863    mov         eax,[0078DAAC];^gvar_0081D8E0:Pointer
 0062C868    mov         eax,dword ptr [eax]
 0062C86A    call        eax
 0062C86C    pop         ecx
 0062C86D    mov         esi,eax
 0062C86F    test        esi,esi
>0062C871    je          0062CAEB
 0062C877    imul        eax,dword ptr [ebx],22
 0062C87A    lea         eax,[edi+eax*8-1C]
 0062C87E    xor         ecx,ecx
 0062C880    mov         edx,11
 0062C885    call        @FillChar
 0062C88A    imul        eax,dword ptr [ebx],22
 0062C88D    mov         byte ptr [edi+eax*8-1C],0F2
 0062C892    mov         byte ptr [esp+0C],42
 0062C897    mov         byte ptr [esp+0D],3
 0062C89C    mov         byte ptr [esp+0E],0
 0062C8A1    mov         byte ptr [esp+0F],0
 0062C8A6    lea         eax,[esp+0C]
 0062C8AA    push        eax
 0062C8AB    push        4
 0062C8AD    mov         ecx,0F4
 0062C8B2    mov         edx,dword ptr [esp+10]
 0062C8B6    mov         eax,esi
 0062C8B8    call        0062C4A4
 0062C8BD    test        al,al
 0062C8BF    push        11
 0062C8C1    imul        eax,dword ptr [ebx],22
 0062C8C4    lea         ecx,[edi+eax*8-1C]
 0062C8C8    mov         edx,dword ptr [esp+0C]
 0062C8CC    mov         eax,esi
 0062C8CE    call        0062C464
 0062C8D3    test        al,al
>0062C8D5    je          0062C8EF
 0062C8D7    imul        eax,dword ptr [ebx],22
 0062C8DA    mov         byte ptr [edi+eax*8-0EC],0
 0062C8E2    mov         byte ptr [edi+eax*8-0EB],0
>0062C8EA    jmp         0062C9B6
 0062C8EF    mov         eax,dword ptr [esp]
 0062C8F2    mov         eax,dword ptr [eax+21E]
 0062C8F8    movzx       eax,byte ptr [eax+5]
 0062C8FC    push        eax
 0062C8FD    push        esi
 0062C8FE    mov         eax,[0078D184];^gvar_0081D900:Pointer
 0062C903    mov         eax,dword ptr [eax]
 0062C905    call        eax
 0062C907    add         esp,8
 0062C90A    imul        eax,dword ptr [ebx],22
 0062C90D    mov         byte ptr [edi+eax*8-0EC],1
 0062C915    lea         eax,[edi+eax*8-1C]
 0062C919    xor         ecx,ecx
 0062C91B    mov         edx,11
 0062C920    call        @FillChar
 0062C925    imul        ebp,dword ptr [ebx],22
 0062C928    mov         byte ptr [edi+ebp*8-1C],0F2
 0062C92D    push        11
 0062C92F    lea         ecx,[edi+ebp*8-1C]
 0062C933    mov         edx,dword ptr [esp+0C]
 0062C937    mov         eax,esi
 0062C939    call        0062C464
 0062C93E    test        al,al
>0062C940    je          0062C94F
 0062C942    imul        eax,dword ptr [ebx],22
 0062C945    mov         byte ptr [edi+eax*8-0EB],0
>0062C94D    jmp         0062C9B6
 0062C94F    mov         eax,dword ptr [esp+8]
 0062C953    push        eax
 0062C954    push        esi
 0062C955    mov         eax,[0078CB34];^gvar_0081D8F8:Pointer
 0062C95A    mov         eax,dword ptr [eax]
 0062C95C    call        eax
 0062C95E    add         esp,8
 0062C961    test        eax,eax
 0062C963    sete        al
 0062C966    imul        ebp,dword ptr [ebx],22
 0062C969    mov         byte ptr [edi+ebp*8-0EB],al
 0062C970    push        11
 0062C972    lea         ecx,[edi+ebp*8-1C]
 0062C976    mov         edx,dword ptr [esp+0C]
 0062C97A    mov         eax,esi
 0062C97C    call        0062C464
 0062C981    test        al,al
>0062C983    jne         0062C9B6
 0062C985    imul        eax,dword ptr [ebx],22
 0062C988    cmp         byte ptr [edi+eax*8-0EB],0
>0062C990    je          0062C9A4
 0062C992    mov         eax,dword ptr [esp+8]
 0062C996    push        eax
 0062C997    push        esi
 0062C998    mov         eax,[0078D4B4];^gvar_0081D8FC:Pointer
 0062C99D    mov         eax,dword ptr [eax]
 0062C99F    call        eax
 0062C9A1    add         esp,8
 0062C9A4    push        esi
 0062C9A5    mov         eax,[0078CD90];^gvar_0081D8E4:Pointer
 0062C9AA    mov         eax,dword ptr [eax]
 0062C9AC    call        eax
 0062C9AE    pop         ecx
 0062C9AF    dec         dword ptr [ebx]
>0062C9B1    jmp         0062CAEB
 0062C9B6    imul        eax,dword ptr [ebx],22
 0062C9B9    mov         edx,dword ptr [esp]
 0062C9BC    mov         dword ptr [edi+eax*8-110],edx
 0062C9C3    mov         dword ptr [edi+eax*8-0B8],5E353F7D
 0062C9CE    mov         dword ptr [edi+eax*8-0B4],3FE849BA
 0062C9D9    imul        eax,dword ptr [ebx],29
 0062C9DC    add         eax,81E9E7
 0062C9E1    xor         ecx,ecx
 0062C9E3    mov         edx,29
 0062C9E8    call        @FillChar
 0062C9ED    imul        eax,dword ptr [ebx],29
 0062C9F0    mov         byte ptr [eax+81E9EA],0FF
 0062C9F7    mov         byte ptr [eax+81E9EB],72
 0062C9FE    mov         edx,6
 0062CA03    mov         eax,81EA10;gvar_0081EA10
 0062CA08    imul        ecx,dword ptr [ebx],29
 0062CA0B    mov         byte ptr [eax+ecx-1F],0FF
 0062CA10    imul        ecx,dword ptr [ebx],29
 0062CA13    mov         byte ptr [eax+ecx-1D],10
 0062CA18    imul        ecx,dword ptr [ebx],29
 0062CA1B    mov         byte ptr [eax+ecx-1C],10
 0062CA20    imul        ecx,dword ptr [ebx],29
 0062CA23    mov         byte ptr [eax+ecx-1B],10
 0062CA28    add         eax,5
 0062CA2B    dec         edx
>0062CA2C    jne         0062CA08
 0062CA2E    imul        eax,dword ptr [ebx],29
 0062CA31    add         eax,81E9E7
 0062CA36    push        eax
 0062CA37    push        28
 0062CA39    mov         ecx,1
 0062CA3E    mov         edx,dword ptr [esp+10]
 0062CA42    mov         eax,esi
 0062CA44    call        0062C4D8
 0062CA49    imul        eax,dword ptr [ebx],22
 0062CA4C    mov         edx,dword ptr [esp]
 0062CA4F    mov         dword ptr [edi+eax*8-110],edx
 0062CA56    mov         dword ptr [edi+eax*8-10C],esi
 0062CA5D    mov         edx,dword ptr [esp+4]
 0062CA61    mov         dword ptr [edi+eax*8-108],edx
 0062CA68    mov         edx,dword ptr [esp+8]
 0062CA6C    mov         dword ptr [edi+eax*8-104],edx
 0062CA73    xor         edx,edx
 0062CA75    mov         dword ptr [edi+eax*8-100],edx
 0062CA7C    mov         dword ptr [edi+eax*8-0FC],edx
 0062CA83    xor         edx,edx
 0062CA85    mov         dword ptr [edi+eax*8-0F0],edx
 0062CA8C    xor         edx,edx
 0062CA8E    mov         dword ptr [edi+eax*8-78],edx
 0062CA92    mov         dword ptr [edi+eax*8-74],edx
 0062CA96    xor         edx,edx
 0062CA98    mov         dword ptr [edi+eax*8-80],edx
 0062CA9C    mov         dword ptr [edi+eax*8-7C],edx
 0062CAA0    xor         edx,edx
 0062CAA2    mov         dword ptr [edi+eax*8-0C0],edx
 0062CAA9    mov         dword ptr [edi+eax*8-0BC],edx
 0062CAB0    xor         edx,edx
 0062CAB2    mov         dword ptr [edi+eax*8-0F8],edx
 0062CAB9    mov         dword ptr [edi+eax*8-0F4],edx
 0062CAC0    lea         eax,[edi+eax*8-0B]
 0062CAC4    xor         ecx,ecx
 0062CAC6    mov         edx,8
 0062CACB    call        @FillChar
 0062CAD0    imul        ebp,dword ptr [ebx],22
 0062CAD3    mov         byte ptr [edi+ebp*8-0B],0F5
 0062CAD8    push        8
 0062CADA    lea         ecx,[edi+ebp*8-0B]
 0062CADE    mov         edx,dword ptr [esp+0C]
 0062CAE2    mov         eax,esi
 0062CAE4    call        0062C464
 0062CAE9    test        al,al
 0062CAEB    add         esp,10
 0062CAEE    pop         ebp
 0062CAEF    pop         edi
 0062CAF0    pop         esi
 0062CAF1    pop         ebx
 0062CAF2    ret
end;*}

//0062CAF4
procedure sub_0062CAF4;
begin
{*
 0062CAF4    push        ebx
 0062CAF5    push        esi
 0062CAF6    push        edi
 0062CAF7    push        ebp
 0062CAF8    add         esp,0FFFFFFE4
 0062CAFB    xor         eax,eax
 0062CAFD    mov         [0081ECA0],eax;gvar_0081ECA0
 0062CB02    call        0061992C
 0062CB07    test        al,al
>0062CB09    je          0062CC46
 0062CB0F    mov         eax,[0078CD14];^gvar_0081D8E8:Pointer
 0062CB14    mov         eax,dword ptr [eax]
 0062CB16    call        eax
 0062CB18    test        eax,eax
>0062CB1A    jl          0062CC46
 0062CB20    mov         eax,[0078D20C];^gvar_0081D8EC:Pointer
 0062CB25    mov         eax,dword ptr [eax]
 0062CB27    call        eax
 0062CB29    test        eax,eax
>0062CB2B    jl          0062CC46
 0062CB31    mov         eax,[0078CDE4];^gvar_0081D8F0:Pointer
 0062CB36    mov         eax,dword ptr [eax]
 0062CB38    call        eax
 0062CB3A    mov         [0081ECB0],eax;gvar_0081ECB0
 0062CB3F    cmp         dword ptr ds:[81ECB0],0;gvar_0081ECB0
>0062CB46    je          0062CC46
 0062CB4C    mov         eax,[0081ECB0];gvar_0081ECB0
 0062CB51    mov         dword ptr [esp],eax
 0062CB54    cmp         dword ptr [esp],0
>0062CB58    je          0062CC46
 0062CB5E    mov         eax,dword ptr [esp]
 0062CB61    mov         eax,dword ptr [eax+208]
 0062CB67    mov         dword ptr [esp+4],eax
 0062CB6B    cmp         dword ptr [esp+4],0
>0062CB70    je          0062CC34
 0062CB76    mov         eax,dword ptr [esp+4]
 0062CB7A    cmp         word ptr [eax+214],54C
>0062CB83    jne         0062CC1F
 0062CB89    mov         eax,dword ptr [esp+4]
 0062CB8D    cmp         word ptr [eax+216],268
>0062CB96    jne         0062CC1F
 0062CB9C    mov         eax,dword ptr [esp+4]
 0062CBA0    mov         eax,dword ptr [eax+21E]
 0062CBA6    mov         dword ptr [esp+8],eax
 0062CBAA    mov         eax,dword ptr [esp+4]
 0062CBAE    movzx       eax,byte ptr [eax+21D]
 0062CBB5    test        eax,eax
>0062CBB7    jle         0062CC1F
 0062CBB9    mov         dword ptr [esp+14],eax
 0062CBBD    mov         eax,dword ptr [esp+8]
 0062CBC1    movzx       eax,byte ptr [eax+4]
 0062CBC5    dec         eax
 0062CBC6    test        eax,eax
>0062CBC8    jl          0062CC14
 0062CBCA    inc         eax
 0062CBCB    mov         dword ptr [esp+18],eax
 0062CBCF    xor         edi,edi
 0062CBD1    mov         eax,dword ptr [esp+8]
 0062CBD5    mov         eax,dword ptr [eax+9]
 0062CBD8    lea         eax,[eax+edi*8]
 0062CBDB    mov         dword ptr [esp+0C],eax
 0062CBDF    mov         eax,dword ptr [esp+0C]
 0062CBE3    mov         esi,dword ptr [eax]
 0062CBE5    mov         eax,dword ptr [esp+0C]
 0062CBE9    mov         ebx,dword ptr [eax+4]
 0062CBEC    dec         ebx
 0062CBED    test        ebx,ebx
>0062CBEF    jl          0062CC0D
 0062CBF1    inc         ebx
 0062CBF2    cmp         byte ptr [esi+5],3
>0062CBF6    jne         0062CC07
 0062CBF8    mov         ecx,edi
 0062CBFA    mov         edx,dword ptr [esp+8]
 0062CBFE    mov         eax,dword ptr [esp+4]
 0062CC02    call        0062C838
 0062CC07    add         esi,15
 0062CC0A    dec         ebx
>0062CC0B    jne         0062CBF2
 0062CC0D    inc         edi
 0062CC0E    dec         dword ptr [esp+18]
>0062CC12    jne         0062CBD1
 0062CC14    add         dword ptr [esp+8],15
 0062CC19    dec         dword ptr [esp+14]
>0062CC1D    jne         0062CBBD
 0062CC1F    mov         eax,dword ptr [esp+4]
 0062CC23    mov         eax,dword ptr [eax]
 0062CC25    mov         dword ptr [esp+4],eax
 0062CC29    cmp         dword ptr [esp+4],0
>0062CC2E    jne         0062CB76
 0062CC34    mov         eax,dword ptr [esp]
 0062CC37    mov         eax,dword ptr [eax]
 0062CC39    mov         dword ptr [esp],eax
 0062CC3C    cmp         dword ptr [esp],0
>0062CC40    jne         0062CB5E
 0062CC46    add         esp,1C
 0062CC49    pop         ebp
 0062CC4A    pop         edi
 0062CC4B    pop         esi
 0062CC4C    pop         ebx
 0062CC4D    ret
*}
end;

//0062CC50
procedure sub_0062CC50;
begin
{*
 0062CC50    push        ebp
 0062CC51    mov         ebp,esp
 0062CC53    add         esp,0FFFFFF68
 0062CC59    push        ebx
 0062CC5A    push        esi
 0062CC5B    push        edi
 0062CC5C    mov         eax,[0081ECA0];gvar_0081ECA0
 0062CC61    test        eax,eax
>0062CC63    jle         0062D177
 0062CC69    mov         dword ptr [ebp-1C],eax
 0062CC6C    mov         dword ptr [ebp-74],81D910;gvar_0081D910
 0062CC73    mov         dword ptr [ebp-78],81EA38
 0062CC7A    mov         eax,dword ptr [ebp-74]
 0062CC7D    mov         dword ptr [ebp-20],eax
 0062CC80    xor         eax,eax
 0062CC82    push        ebp
 0062CC83    push        62CCB9
 0062CC88    push        dword ptr fs:[eax]
 0062CC8B    mov         dword ptr fs:[eax],esp
 0062CC8E    mov         eax,dword ptr [ebp-20]
 0062CC91    add         eax,0C0
 0062CC96    push        eax
 0062CC97    push        31
 0062CC99    mov         eax,dword ptr [ebp-20]
 0062CC9C    mov         edx,dword ptr [eax+0C]
 0062CC9F    mov         eax,dword ptr [ebp-20]
 0062CCA2    mov         eax,dword ptr [eax+4]
 0062CCA5    mov         ecx,1
 0062CCAA    call        0062C50C
 0062CCAF    xor         eax,eax
 0062CCB1    pop         edx
 0062CCB2    pop         ecx
 0062CCB3    pop         ecx
 0062CCB4    mov         dword ptr fs:[eax],edx
>0062CCB7    jmp         0062CCC3
>0062CCB9    jmp         @HandleAnyException
 0062CCBE    call        @DoneExcept
 0062CCC3    call        00600EA0
 0062CCC8    fstp        qword ptr [ebp-10]
 0062CCCB    wait
 0062CCCC    fld         qword ptr [ebp-10]
 0062CCCF    mov         eax,dword ptr [ebp-20]
 0062CCD2    fsub        qword ptr [eax+18]
 0062CCD5    fstp        qword ptr [ebp-18]
 0062CCD8    wait
 0062CCD9    fld         qword ptr [ebp-18]
 0062CCDC    fcomp       dword ptr ds:[62D180];0:Single
 0062CCE2    wait
 0062CCE3    fnstsw      al
 0062CCE5    sahf
>0062CCE6    jbe         0062CCF7
 0062CCE8    fld         qword ptr [ebp-18]
 0062CCEB    fcomp       dword ptr ds:[62D184];1000:Single
 0062CCF1    wait
 0062CCF2    fnstsw      al
 0062CCF4    sahf
>0062CCF5    jb          0062CCFF
 0062CCF7    xor         eax,eax
 0062CCF9    mov         dword ptr [ebp-18],eax
 0062CCFC    mov         dword ptr [ebp-14],eax
 0062CCFF    mov         eax,dword ptr [ebp-78]
 0062CD02    cmp         byte ptr [eax],0
>0062CD05    je          0062CD2C
 0062CD07    mov         eax,dword ptr [ebp-78]
 0062CD0A    add         eax,0FFFFFFD8
 0062CD0D    push        eax
 0062CD0E    push        28
 0062CD10    mov         eax,dword ptr [ebp-20]
 0062CD13    mov         edx,dword ptr [eax+0C]
 0062CD16    mov         eax,dword ptr [ebp-20]
 0062CD19    mov         eax,dword ptr [eax+4]
 0062CD1C    mov         ecx,1
 0062CD21    call        0062C4D8
 0062CD26    mov         eax,dword ptr [ebp-78]
 0062CD29    mov         byte ptr [eax],0
 0062CD2C    mov         eax,dword ptr [ebp-20]
 0062CD2F    movzx       eax,byte ptr [eax+0E9]
 0062CD36    shl         eax,8
 0062CD39    mov         edx,dword ptr [ebp-20]
 0062CD3C    movzx       edx,byte ptr [edx+0EA]
 0062CD43    add         eax,edx
 0062CD45    call        006298B0
 0062CD4A    mov         dword ptr [ebp-7C],eax
 0062CD4D    fild        dword ptr [ebp-7C]
 0062CD50    add         esp,0FFFFFFF8
 0062CD53    fstp        qword ptr [esp]
 0062CD56    wait
 0062CD57    mov         eax,dword ptr [ebp-20]
 0062CD5A    fild        dword ptr [eax+28]
 0062CD5D    add         esp,0FFFFFFF8
 0062CD60    fstp        qword ptr [esp]
 0062CD63    wait
 0062CD64    mov         eax,dword ptr [ebp-20]
 0062CD67    fild        dword ptr [eax+2C]
 0062CD6A    add         esp,0FFFFFFF8
 0062CD6D    fstp        qword ptr [esp]
 0062CD70    wait
 0062CD71    push        0BFF00000
 0062CD76    push        0
 0062CD78    push        3FF00000
 0062CD7D    push        0
 0062CD7F    call        00670448
 0062CD84    mov         eax,dword ptr [ebp-20]
 0062CD87    fstp        qword ptr [eax+60]
 0062CD8A    wait
 0062CD8B    mov         eax,dword ptr [ebp-20]
 0062CD8E    movzx       eax,byte ptr [eax+0ED]
 0062CD95    shl         eax,8
 0062CD98    mov         edx,dword ptr [ebp-20]
 0062CD9B    movzx       edx,byte ptr [edx+0EE]
 0062CDA2    add         eax,edx
 0062CDA4    call        006298B0
 0062CDA9    neg         eax
 0062CDAB    mov         dword ptr [ebp-7C],eax
 0062CDAE    fild        dword ptr [ebp-7C]
 0062CDB1    add         esp,0FFFFFFF8
 0062CDB4    fstp        qword ptr [esp]
 0062CDB7    wait
 0062CDB8    mov         eax,dword ptr [ebp-20]
 0062CDBB    fild        dword ptr [eax+30]
 0062CDBE    add         esp,0FFFFFFF8
 0062CDC1    fstp        qword ptr [esp]
 0062CDC4    wait
 0062CDC5    mov         eax,dword ptr [ebp-20]
 0062CDC8    fild        dword ptr [eax+34]
 0062CDCB    add         esp,0FFFFFFF8
 0062CDCE    fstp        qword ptr [esp]
 0062CDD1    wait
 0062CDD2    push        0BFF00000
 0062CDD7    push        0
 0062CDD9    push        3FF00000
 0062CDDE    push        0
 0062CDE0    call        00670448
 0062CDE5    mov         eax,dword ptr [ebp-20]
 0062CDE8    fstp        qword ptr [eax+68]
 0062CDEB    wait
 0062CDEC    mov         eax,dword ptr [ebp-20]
 0062CDEF    movzx       eax,byte ptr [eax+0EB]
 0062CDF6    shl         eax,8
 0062CDF9    mov         edx,dword ptr [ebp-20]
 0062CDFC    movzx       edx,byte ptr [edx+0EC]
 0062CE03    add         eax,edx
 0062CE05    call        006298B0
 0062CE0A    mov         dword ptr [ebp-7C],eax
 0062CE0D    fild        dword ptr [ebp-7C]
 0062CE10    add         esp,0FFFFFFF8
 0062CE13    fstp        qword ptr [esp]
 0062CE16    wait
 0062CE17    mov         eax,dword ptr [ebp-20]
 0062CE1A    fild        dword ptr [eax+38]
 0062CE1D    add         esp,0FFFFFFF8
 0062CE20    fstp        qword ptr [esp]
 0062CE23    wait
 0062CE24    mov         eax,dword ptr [ebp-20]
 0062CE27    fild        dword ptr [eax+3C]
 0062CE2A    add         esp,0FFFFFFF8
 0062CE2D    fstp        qword ptr [esp]
 0062CE30    wait
 0062CE31    push        0BFF00000
 0062CE36    push        0
 0062CE38    push        3FF00000
 0062CE3D    push        0
 0062CE3F    call        00670448
 0062CE44    mov         eax,dword ptr [ebp-20]
 0062CE47    fstp        qword ptr [eax+70]
 0062CE4A    wait
 0062CE4B    mov         eax,dword ptr [ebp-20]
 0062CE4E    fld         qword ptr [eax+60]
 0062CE51    fmul        st,st(0)
 0062CE53    fstp        tbyte ptr [ebp-88]
 0062CE59    wait
 0062CE5A    mov         eax,dword ptr [ebp-20]
 0062CE5D    fld         qword ptr [eax+68]
 0062CE60    fmul        st,st(0)
 0062CE62    fld         tbyte ptr [ebp-88]
 0062CE68    faddp       st(1),st
 0062CE6A    fstp        tbyte ptr [ebp-94]
 0062CE70    wait
 0062CE71    mov         eax,dword ptr [ebp-20]
 0062CE74    fld         qword ptr [eax+70]
 0062CE77    fmul        st,st(0)
 0062CE79    fld         tbyte ptr [ebp-94]
 0062CE7F    faddp       st(1),st
 0062CE81    add         esp,0FFFFFFF4
 0062CE84    fstp        tbyte ptr [esp]
 0062CE87    wait
 0062CE88    call        Sqrt
 0062CE8D    fstp        qword ptr [ebp-8]
 0062CE90    wait
 0062CE91    fld         tbyte ptr ds:[62D188];0.97:Extended
 0062CE97    fcomp       qword ptr [ebp-8]
 0062CE9A    wait
 0062CE9B    fnstsw      al
 0062CE9D    sahf
>0062CE9E    ja          0062CFDE
 0062CEA4    fld         tbyte ptr ds:[62D194];1.03:Extended
 0062CEAA    fcomp       qword ptr [ebp-8]
 0062CEAD    wait
 0062CEAE    fnstsw      al
 0062CEB0    sahf
>0062CEB1    jb          0062CFDE
 0062CEB7    mov         eax,dword ptr [ebp-20]
 0062CEBA    fld         qword ptr [eax+60]
 0062CEBD    fdiv        qword ptr [ebp-8]
 0062CEC0    mov         eax,dword ptr [ebp-20]
 0062CEC3    fstp        qword ptr [eax+78]
 0062CEC6    wait
 0062CEC7    mov         eax,dword ptr [ebp-20]
 0062CECA    fld         qword ptr [eax+68]
 0062CECD    fdiv        qword ptr [ebp-8]
 0062CED0    mov         eax,dword ptr [ebp-20]
 0062CED3    fstp        qword ptr [eax+80]
 0062CED9    wait
 0062CEDA    mov         eax,dword ptr [ebp-20]
 0062CEDD    fld         qword ptr [eax+70]
 0062CEE0    fdiv        qword ptr [ebp-8]
 0062CEE3    mov         eax,dword ptr [ebp-20]
 0062CEE6    fstp        qword ptr [eax+88]
 0062CEEC    wait
 0062CEED    mov         eax,dword ptr [ebp-20]
 0062CEF0    push        dword ptr [eax+7C]
 0062CEF3    push        dword ptr [eax+78]
 0062CEF6    mov         eax,dword ptr [ebp-20]
 0062CEF9    push        dword ptr [eax+84]
 0062CEFF    push        dword ptr [eax+80]
 0062CF05    call        00454A9C
 0062CF0A    fstp        qword ptr [ebp-28]
 0062CF0D    wait
 0062CF0E    fld         tbyte ptr ds:[62D1A0];57.2957795130823:Extended
 0062CF14    fmul        qword ptr [ebp-28]
 0062CF17    fstp        qword ptr [ebp-30]
 0062CF1A    wait
 0062CF1B    fld         qword ptr [ebp-30]
 0062CF1E    fchs
 0062CF20    mov         eax,dword ptr [ebp-20]
 0062CF23    fstp        qword ptr [eax+0A8]
 0062CF29    wait
 0062CF2A    mov         eax,dword ptr [ebp-20]
 0062CF2D    push        dword ptr [eax+8C]
 0062CF33    push        dword ptr [eax+88]
 0062CF39    call        00454A5C
 0062CF3E    fstp        qword ptr [ebp-38]
 0062CF41    wait
 0062CF42    fld         tbyte ptr ds:[62D1A0];57.2957795130823:Extended
 0062CF48    fmul        qword ptr [ebp-38]
 0062CF4B    fstp        qword ptr [ebp-40]
 0062CF4E    wait
 0062CF4F    mov         eax,dword ptr [ebp-20]
 0062CF52    mov         edx,dword ptr [ebp-40]
 0062CF55    mov         dword ptr [eax+0A0],edx
 0062CF5B    mov         edx,dword ptr [ebp-3C]
 0062CF5E    mov         dword ptr [eax+0A4],edx
 0062CF64    fld         qword ptr [ebp-10]
 0062CF67    mov         eax,dword ptr [ebp-20]
 0062CF6A    fsub        qword ptr [eax+10]
 0062CF6D    fld         tbyte ptr ds:[62D1AC];0.2:Extended
 0062CF73    fcompp
 0062CF75    wait
 0062CF76    fnstsw      al
 0062CF78    sahf
>0062CF79    jae         0062CFED
 0062CF7B    mov         eax,dword ptr [ebp-20]
 0062CF7E    cmp         dword ptr [eax+20],64
>0062CF82    jge         0062CFED
 0062CF84    mov         eax,dword ptr [ebp-20]
 0062CF87    mov         byte ptr [eax+26],1
 0062CF8B    mov         eax,dword ptr [ebp-20]
 0062CF8E    movzx       eax,byte ptr [eax+0EF]
 0062CF95    shl         eax,8
 0062CF98    mov         dword ptr [ebp-7C],eax
 0062CF9B    fild        dword ptr [ebp-7C]
 0062CF9E    mov         eax,dword ptr [ebp-20]
 0062CFA1    fadd        qword ptr [eax+48]
 0062CFA4    mov         eax,dword ptr [ebp-20]
 0062CFA7    movzx       eax,byte ptr [eax+0F0]
 0062CFAE    mov         dword ptr [ebp-98],eax
 0062CFB4    fild        dword ptr [ebp-98]
 0062CFBA    faddp       st(1),st
 0062CFBC    mov         eax,dword ptr [ebp-20]
 0062CFBF    fstp        qword ptr [eax+48]
 0062CFC2    wait
 0062CFC3    mov         eax,dword ptr [ebp-20]
 0062CFC6    inc         dword ptr [eax+20]
 0062CFC9    mov         eax,dword ptr [ebp-20]
 0062CFCC    fild        dword ptr [eax+20]
 0062CFCF    mov         eax,dword ptr [ebp-20]
 0062CFD2    fdivr       qword ptr [eax+48]
 0062CFD5    mov         eax,dword ptr [ebp-20]
 0062CFD8    fstp        qword ptr [eax+40]
 0062CFDB    wait
>0062CFDC    jmp         0062CFED
 0062CFDE    mov         eax,dword ptr [ebp-20]
 0062CFE1    mov         edx,dword ptr [ebp-10]
 0062CFE4    mov         dword ptr [eax+10],edx
 0062CFE7    mov         edx,dword ptr [ebp-0C]
 0062CFEA    mov         dword ptr [eax+14],edx
 0062CFED    mov         eax,dword ptr [ebp-20]
 0062CFF0    fld         qword ptr [eax+40]
 0062CFF3    fcomp       dword ptr ds:[62D1B8];2:Single
 0062CFF9    wait
 0062CFFA    fnstsw      al
 0062CFFC    sahf
>0062CFFD    ja          0062D057
 0062CFFF    mov         eax,dword ptr [ebp-20]
 0062D002    movzx       eax,byte ptr [eax+0EF]
 0062D009    shl         eax,8
 0062D00C    mov         edx,dword ptr [ebp-20]
 0062D00F    movzx       edx,byte ptr [edx+0F0]
 0062D016    add         eax,edx
 0062D018    mov         dword ptr [ebp-7C],eax
 0062D01B    fild        dword ptr [ebp-7C]
 0062D01E    mov         eax,dword ptr [ebp-20]
 0062D021    fstp        qword ptr [eax+40]
 0062D024    wait
 0062D025    mov         eax,dword ptr [ebp-20]
 0062D028    xor         edx,edx
 0062D02A    mov         dword ptr [eax+50],edx
 0062D02D    mov         dword ptr [eax+54],edx
 0062D030    mov         eax,dword ptr [ebp-20]
 0062D033    xor         edx,edx
 0062D035    mov         dword ptr [eax+90],edx
 0062D03B    mov         dword ptr [eax+94],edx
 0062D041    mov         eax,dword ptr [ebp-20]
 0062D044    xor         edx,edx
 0062D046    mov         dword ptr [eax+98],edx
 0062D04C    mov         dword ptr [eax+9C],edx
>0062D052    jmp         0062D0D9
 0062D057    mov         eax,dword ptr [ebp-20]
 0062D05A    movzx       eax,byte ptr [eax+0EF]
 0062D061    shl         eax,8
 0062D064    mov         edx,dword ptr [ebp-20]
 0062D067    movzx       edx,byte ptr [edx+0F0]
 0062D06E    add         eax,edx
 0062D070    mov         dword ptr [ebp-7C],eax
 0062D073    fild        dword ptr [ebp-7C]
 0062D076    mov         eax,dword ptr [ebp-20]
 0062D079    fsubr       qword ptr [eax+40]
 0062D07C    mov         eax,dword ptr [ebp-20]
 0062D07F    fstp        qword ptr [eax+50]
 0062D082    wait
 0062D083    mov         eax,dword ptr [ebp-20]
 0062D086    fld         qword ptr [eax+50]
 0062D089    fabs
 0062D08B    fld         tbyte ptr ds:[62D1BC];2.9:Extended
 0062D091    fcompp
 0062D093    wait
 0062D094    fnstsw      al
 0062D096    sahf
>0062D097    jb          0062D0A4
 0062D099    mov         eax,dword ptr [ebp-20]
 0062D09C    xor         edx,edx
 0062D09E    mov         dword ptr [eax+50],edx
 0062D0A1    mov         dword ptr [eax+54],edx
 0062D0A4    mov         eax,dword ptr [ebp-20]
 0062D0A7    fld         qword ptr [eax+50]
 0062D0AA    mov         eax,dword ptr [ebp-20]
 0062D0AD    fmul        qword ptr [eax+58]
 0062D0B0    mov         eax,dword ptr [ebp-20]
 0062D0B3    fstp        qword ptr [eax+90]
 0062D0B9    wait
 0062D0BA    mov         eax,dword ptr [ebp-20]
 0062D0BD    fld         qword ptr [eax+90]
 0062D0C3    fmul        qword ptr [ebp-18]
 0062D0C6    mov         eax,dword ptr [ebp-20]
 0062D0C9    fadd        qword ptr [eax+98]
 0062D0CF    mov         eax,dword ptr [ebp-20]
 0062D0D2    fstp        qword ptr [eax+98]
 0062D0D8    wait
 0062D0D9    fld         qword ptr [ebp-8]
 0062D0DC    fcomp       dword ptr ds:[62D180];0:Single
 0062D0E2    wait
 0062D0E3    fnstsw      al
 0062D0E5    sahf
>0062D0E6    je          0062D154
 0062D0E8    mov         eax,dword ptr [ebp-20]
 0062D0EB    push        dword ptr [eax+64]
 0062D0EE    push        dword ptr [eax+60]
 0062D0F1    mov         eax,dword ptr [ebp-20]
 0062D0F4    push        dword ptr [eax+6C]
 0062D0F7    push        dword ptr [eax+68]
 0062D0FA    call        00454A9C
 0062D0FF    fstp        qword ptr [ebp-48]
 0062D102    wait
 0062D103    fld         tbyte ptr ds:[62D1A0];57.2957795130823:Extended
 0062D109    fmul        qword ptr [ebp-48]
 0062D10C    fstp        qword ptr [ebp-50]
 0062D10F    wait
 0062D110    fld         qword ptr [ebp-50]
 0062D113    fchs
 0062D115    mov         eax,dword ptr [ebp-20]
 0062D118    fstp        qword ptr [eax+0B8]
 0062D11E    wait
 0062D11F    mov         eax,dword ptr [ebp-20]
 0062D122    fld         qword ptr [eax+70]
 0062D125    fdiv        qword ptr [ebp-8]
 0062D128    add         esp,0FFFFFFF4
 0062D12B    fstp        tbyte ptr [esp]
 0062D12E    wait
 0062D12F    call        00454A44
 0062D134    fstp        tbyte ptr [ebp-60]
 0062D137    wait
 0062D138    fld         tbyte ptr [ebp-60]
 0062D13B    fld         tbyte ptr ds:[62D1A0];57.2957795130823:Extended
 0062D141    fmulp       st(1),st
 0062D143    fstp        tbyte ptr [ebp-70]
 0062D146    wait
 0062D147    fld         tbyte ptr [ebp-70]
 0062D14A    mov         eax,dword ptr [ebp-20]
 0062D14D    fstp        qword ptr [eax+0B0]
 0062D153    wait
 0062D154    mov         eax,dword ptr [ebp-20]
 0062D157    mov         edx,dword ptr [ebp-10]
 0062D15A    mov         dword ptr [eax+18],edx
 0062D15D    mov         edx,dword ptr [ebp-0C]
 0062D160    mov         dword ptr [eax+1C],edx
 0062D163    add         dword ptr [ebp-78],29
 0062D167    add         dword ptr [ebp-74],110
 0062D16E    dec         dword ptr [ebp-1C]
>0062D171    jne         0062CC7A
 0062D177    pop         edi
 0062D178    pop         esi
 0062D179    pop         ebx
 0062D17A    mov         esp,ebp
 0062D17C    pop         ebp
 0062D17D    ret
*}
end;

//0062D1C8
procedure sub_0062D1C8;
begin
{*
 0062D1C8    call        0074BF10
 0062D1CD    call        TWiimoteManager.UseAllSixaxes
 0062D1D2    mov         eax,[0081ECAC];gvar_0081ECAC:TModuleSixaxis
 0062D1D7    mov         byte ptr [eax+24],1
 0062D1DB    mov         byte ptr ds:[81ECA4],1;gvar_0081ECA4
 0062D1E2    ret
*}
end;

//0062D1E4
{*function sub_0062D1E4(?:string):?;
begin
 0062D1E4    push        ebp
 0062D1E5    mov         ebp,esp
 0062D1E7    add         esp,0FFFFFFF0
 0062D1EA    push        ebx
 0062D1EB    push        esi
 0062D1EC    push        edi
 0062D1ED    xor         edx,edx
 0062D1EF    mov         dword ptr [ebp-8],edx
 0062D1F2    mov         dword ptr [ebp-4],eax
 0062D1F5    mov         eax,dword ptr [ebp-4]
 0062D1F8    call        @UStrAddRef
 0062D1FD    xor         eax,eax
 0062D1FF    push        ebp
 0062D200    push        62D31D
 0062D205    push        dword ptr fs:[eax]
 0062D208    mov         dword ptr fs:[eax],esp
 0062D20B    xor         esi,esi
 0062D20D    lea         eax,[ebp-8]
 0062D210    mov         edx,dword ptr [ebp-4]
 0062D213    call        @UStrLAsg
 0062D218    lea         eax,[ebp-8]
 0062D21B    mov         edx,62D33C;'DualShock3'
 0062D220    call        004F9BD0
 0062D225    test        al,al
>0062D227    je          0062D22F
 0062D229    mov         byte ptr [ebp-9],1
>0062D22D    jmp         0062D248
 0062D22F    lea         eax,[ebp-8]
 0062D232    mov         edx,62D360;'Sixaxis'
 0062D237    call        004F9BD0
 0062D23C    test        al,al
>0062D23E    je          0062D302
 0062D244    mov         byte ptr [ebp-9],0
 0062D248    lea         eax,[ebp-8]
 0062D24B    call        004F9D00
 0062D250    mov         ebx,eax
 0062D252    lea         eax,[ebp-8]
 0062D255    mov         edx,62D37C;'.'
 0062D25A    call        004F9BD0
 0062D25F    test        al,al
>0062D261    je          0062D302
 0062D267    mov         eax,[0081ECAC];gvar_0081ECAC:TModuleSixaxis
 0062D26C    mov         eax,dword ptr [eax+1C]
 0062D26F    mov         edx,dword ptr [ebp-8]
 0062D272    call        THashTable.Get
 0062D277    mov         edi,eax
 0062D279    test        edi,edi
>0062D27B    jl          0062D302
 0062D281    mov         dl,1
 0062D283    mov         eax,[0062B71C];TSixAxisValue
 0062D288    call        TObject.Create;TSixAxisValue.Create
 0062D28D    mov         esi,eax
 0062D28F    mov         dword ptr [esi+20],edi;TSixAxisValue..............................................Item:I...
 0062D292    test        ebx,ebx
>0062D294    jg          0062D29B
 0062D296    mov         ebx,1
 0062D29B    mov         dword ptr [esi+18],ebx;TSixAxisValue.......................................................
 0062D29E    call        0074BF10
 0062D2A3    mov         dword ptr [ebp-10],eax
 0062D2A6    mov         edx,ebx
 0062D2A8    mov         eax,dword ptr [ebp-10]
 0062D2AB    call        TWiimoteManager.UseSixaxis
 0062D2B0    cmp         edi,6D
>0062D2B3    jge         0062D2C4
 0062D2B5    sub         edi,3F
>0062D2B8    je          0062D2EB
 0062D2BA    add         edi,0FFFFFFD7
 0062D2BD    sub         edi,5
>0062D2C0    jb          0062D2DF
>0062D2C2    jmp         0062D2FB
 0062D2C4    add         edi,0FFFFFF93
 0062D2C7    sub         edi,4
>0062D2CA    jb          0062D2EB
>0062D2CC    je          0062D2DF
 0062D2CE    sub         edi,3
>0062D2D1    jne         0062D2FB
 0062D2D3    mov         edx,ebx
 0062D2D5    mov         eax,dword ptr [ebp-10]
 0062D2D8    call        TWiimoteManager.UseDualShock3
>0062D2DD    jmp         0062D2FB
 0062D2DF    mov         edx,ebx
 0062D2E1    mov         eax,dword ptr [ebp-10]
 0062D2E4    call        TWiimoteManager.UseSixaxisGyro
>0062D2E9    jmp         0062D2FB
 0062D2EB    cmp         byte ptr [ebp-9],0
>0062D2EF    jne         0062D2FB
 0062D2F1    mov         edx,ebx
 0062D2F3    mov         eax,dword ptr [ebp-10]
 0062D2F6    call        TWiimoteManager.UseSixaxisGyro
 0062D2FB    mov         byte ptr ds:[81ECA4],1;gvar_0081ECA4
 0062D302    xor         eax,eax
 0062D304    pop         edx
 0062D305    pop         ecx
 0062D306    pop         ecx
 0062D307    mov         dword ptr fs:[eax],edx
 0062D30A    push        62D324
 0062D30F    lea         eax,[ebp-8]
 0062D312    mov         edx,2
 0062D317    call        @UStrArrayClr
 0062D31C    ret
>0062D31D    jmp         @HandleFinally
>0062D322    jmp         0062D30F
 0062D324    mov         eax,esi
 0062D326    pop         edi
 0062D327    pop         esi
 0062D328    pop         ebx
 0062D329    mov         esp,ebp
 0062D32B    pop         ebp
 0062D32C    ret
end;*}

//0062D380
function TSixAxisValue.CanSet:Boolean;
begin
{*
 0062D380    mov         eax,dword ptr [eax+20];TSixAxisValue...............................................Item:...
 0062D383    sub         eax,2A
>0062D386    je          0062D39A
 0062D388    add         eax,0FFFFFFEA
 0062D38B    sub         eax,8
>0062D38E    jb          0062D39D
 0062D390    add         eax,0FFFFFFD2
 0062D393    sub         eax,7
>0062D396    jb          0062D3A0
>0062D398    jmp         0062D3A3
 0062D39A    mov         al,1
 0062D39C    ret
 0062D39D    mov         al,1
 0062D39F    ret
 0062D3A0    mov         al,1
 0062D3A2    ret
 0062D3A3    xor         eax,eax
 0062D3A5    ret
*}
end;

//0062D3A8
procedure TSixAxisValue.CreateClone;
begin
{*
 0062D3A8    mov         dl,1
 0062D3AA    mov         eax,[0062B71C];TSixAxisValue
 0062D3AF    call        TObject.Create;TSixAxisValue.Create
 0062D3B4    ret
*}
end;

//0062D3B8
procedure TSixAxisValue.FillClone(c:TExpression);
begin
{*
 0062D3B8    push        ebx
 0062D3B9    push        esi
 0062D3BA    mov         esi,edx
 0062D3BC    mov         ebx,eax
 0062D3BE    mov         edx,esi
 0062D3C0    mov         eax,ebx
 0062D3C2    call        TExpression.FillClone
 0062D3C7    mov         eax,esi
 0062D3C9    mov         edx,dword ptr [ebx+20];TSixAxisValue................................................Item...
 0062D3CC    mov         dword ptr [eax+20],edx
 0062D3CF    mov         edx,dword ptr [ebx+18];TSixAxisValue.......................................................
 0062D3D2    mov         dword ptr [eax+18],edx
 0062D3D5    pop         esi
 0062D3D6    pop         ebx
 0062D3D7    ret
*}
end;

//0062D3D8
function TSixAxisValue.GetDataType:TDataType;
begin
{*
 0062D3D8    mov         eax,dword ptr [eax+20];TSixAxisValue.................................................Ite...
 0062D3DB    cmp         eax,40
>0062D3DE    jge         0062D433
 0062D3E0    cmp         eax,18
>0062D3E3    jge         0062D40A
 0062D3E5    sub         eax,1
>0062D3E8    jb          0062D488
>0062D3EE    je          0062D48E
 0062D3F4    dec         eax
>0062D3F5    je          0062D49A
 0062D3FB    dec         eax
 0062D3FC    sub         eax,11
>0062D3FF    jb          0062D488
>0062D405    jmp         0062D4A3
 0062D40A    cmp         eax,2A
>0062D40D    jg          0062D424
>0062D40F    je          0062D49A
 0062D415    add         eax,0FFFFFFE8
 0062D418    sub         eax,3
>0062D41B    jb          0062D491
 0062D41D    sub         eax,0E
>0062D420    je          0062D48E
>0062D422    jmp         0062D4A3
 0062D424    add         eax,0FFFFFFD2
 0062D427    sub         eax,7
>0062D42A    jb          0062D494
 0062D42C    sub         eax,0A
>0062D42F    je          0062D491
>0062D431    jmp         0062D4A3
 0062D433    cmp         eax,76
>0062D436    jge         0062D45D
 0062D438    cmp         eax,68
>0062D43B    jg          0062D451
>0062D43D    je          0062D491
 0062D43F    add         eax,0FFFFFFC0
 0062D442    sub         eax,8
>0062D445    jb          0062D488
 0062D447    add         eax,0FFFFFFE2
 0062D44A    sub         eax,2
>0062D44D    jb          0062D48E
>0062D44F    jmp         0062D4A3
 0062D451    add         eax,0FFFFFF93
 0062D454    sub         eax,3
>0062D457    jb          0062D494
>0062D459    je          0062D497
>0062D45B    jmp         0062D4A3
 0062D45D    cmp         eax,80
>0062D462    jg          0062D475
>0062D464    je          0062D4A0
 0062D466    add         eax,0FFFFFF8A
 0062D469    sub         eax,7
>0062D46C    jb          0062D49D
 0062D46E    sub         eax,2
>0062D471    jb          0062D488
>0062D473    jmp         0062D4A3
 0062D475    sub         eax,81
>0062D47A    je          0062D488
 0062D47C    add         eax,0FFFFFFF7
 0062D47F    sub         eax,83
>0062D484    jb          0062D48B
>0062D486    jmp         0062D4A3
 0062D488    mov         al,3
 0062D48A    ret
 0062D48B    mov         al,3
 0062D48D    ret
 0062D48E    mov         al,2
 0062D490    ret
 0062D491    mov         al,2
 0062D493    ret
 0062D494    mov         al,5
 0062D496    ret
 0062D497    mov         al,6
 0062D499    ret
 0062D49A    mov         al,4
 0062D49C    ret
 0062D49D    mov         al,2
 0062D49F    ret
 0062D4A0    mov         al,7
 0062D4A2    ret
 0062D4A3    xor         eax,eax
 0062D4A5    ret
*}
end;

//0062D4A8
function TSixAxisValue.GetPerUnits1:TUnits;
begin
{*
 0062D4A8    mov         eax,dword ptr [eax+20];TSixAxisValue..................................................It...
 0062D4AB    cmp         eax,39
>0062D4AE    jge         0062D4BF
 0062D4B0    sub         eax,1
>0062D4B3    jb          0062D4D6
 0062D4B5    add         eax,0FFFFFFCF
 0062D4B8    sub         eax,2
>0062D4BB    jb          0062D4DC
>0062D4BD    jmp         0062D4E2
 0062D4BF    add         eax,0FFFFFFC7
 0062D4C2    sub         eax,6
>0062D4C5    jb          0062D4DC
 0062D4C7    add         eax,0FFFFFFF1
 0062D4CA    sub         eax,6
>0062D4CD    jb          0062D4DF
 0062D4CF    sub         eax,15
>0062D4D2    je          0062D4D9
>0062D4D4    jmp         0062D4E2
 0062D4D6    xor         eax,eax
 0062D4D8    ret
 0062D4D9    mov         al,11
 0062D4DB    ret
 0062D4DC    mov         al,11
 0062D4DE    ret
 0062D4DF    mov         al,11
 0062D4E1    ret
 0062D4E2    xor         eax,eax
 0062D4E4    ret
*}
end;

//0062D4E8
function TSixAxisValue.GetPerUnits2:TUnits;
begin
{*
 0062D4E8    mov         eax,dword ptr [eax+20];TSixAxisValue...................................................I...
 0062D4EB    sub         eax,1
>0062D4EE    jb          0062D502
 0062D4F0    add         eax,0FFFFFFCF
 0062D4F3    sub         eax,2
>0062D4F6    jb          0062D505
 0062D4F8    add         eax,0FFFFFFFB
 0062D4FB    sub         eax,6
>0062D4FE    jb          0062D505
>0062D500    jmp         0062D508
 0062D502    xor         eax,eax
 0062D504    ret
 0062D505    mov         al,11
 0062D507    ret
 0062D508    xor         eax,eax
 0062D50A    ret
*}
end;

//0062D50C
procedure TSixAxisValue.GetRotMat(m:TRotMat);
begin
{*
 0062D50C    push        ebx
 0062D50D    push        esi
 0062D50E    push        edi
 0062D50F    add         esp,0FFFFFFF4
 0062D512    mov         dword ptr [esp],edx
 0062D515    mov         ebx,eax
 0062D517    call        0074BF10
 0062D51C    mov         edx,dword ptr [ebx+18];TSixAxisValue.......................................................
 0062D51F    call        TWiimoteManager.GetSixaxis
 0062D524    mov         esi,eax
 0062D526    test        esi,esi
>0062D528    jne         0062D560
 0062D52A    cmp         dword ptr [ebx+20],29;TSixAxisValue....................................................I...
>0062D52E    je          0062D560
 0062D530    xor         ecx,ecx
 0062D532    mov         esi,dword ptr [esp]
 0062D535    xor         eax,eax
 0062D537    mov         edx,esi
 0062D539    cmp         eax,ecx
 0062D53B    sete        bl
 0062D53E    movsx       ebx,bl
 0062D541    mov         dword ptr [esp+8],ebx
 0062D545    fild        dword ptr [esp+8]
 0062D549    fstp        qword ptr [edx]
 0062D54B    wait
 0062D54C    inc         eax
 0062D54D    add         edx,8
 0062D550    cmp         eax,3
>0062D553    jne         0062D539
 0062D555    inc         ecx
 0062D556    add         esi,18
 0062D559    cmp         ecx,3
>0062D55C    jne         0062D535
>0062D55E    jmp         0062D5B0
 0062D560    mov         eax,dword ptr [ebx+20];TSixAxisValue.......................................................
 0062D563    sub         eax,70
>0062D566    jne         0062D5A6
 0062D568    xor         ecx,ecx
 0062D56A    mov         eax,dword ptr [esp]
 0062D56D    mov         dword ptr [esp+4],eax
 0062D571    xor         eax,eax
 0062D573    mov         edx,dword ptr [esp+4]
 0062D577    lea         ebx,[ecx+ecx*2]
 0062D57A    lea         ebx,[esi+ebx*8]
 0062D57D    mov         edi,dword ptr [ebx+eax*8+370]
 0062D584    mov         dword ptr [edx],edi
 0062D586    mov         edi,dword ptr [ebx+eax*8+374]
 0062D58D    mov         dword ptr [edx+4],edi
 0062D590    inc         eax
 0062D591    add         edx,8
 0062D594    cmp         eax,3
>0062D597    jne         0062D577
 0062D599    inc         ecx
 0062D59A    add         dword ptr [esp+4],18
 0062D59F    cmp         ecx,3
>0062D5A2    jne         0062D571
>0062D5A4    jmp         0062D5B0
 0062D5A6    mov         edx,dword ptr [esp]
 0062D5A9    mov         eax,ebx
 0062D5AB    call        TExpression.GetRotMat
 0062D5B0    add         esp,0C
 0062D5B3    pop         edi
 0062D5B4    pop         esi
 0062D5B5    pop         ebx
 0062D5B6    ret
*}
end;

//0062D5B8
{*procedure TSixAxisValue.GetString(?:?);
begin
 0062D5B8    push        ebp
 0062D5B9    mov         ebp,esp
 0062D5BB    xor         ecx,ecx
 0062D5BD    push        ecx
 0062D5BE    push        ecx
 0062D5BF    push        ecx
 0062D5C0    push        ecx
 0062D5C1    push        ecx
 0062D5C2    push        ecx
 0062D5C3    push        ecx
 0062D5C4    push        ebx
 0062D5C5    push        esi
 0062D5C6    mov         dword ptr [ebp-4],edx
 0062D5C9    mov         esi,eax
 0062D5CB    xor         eax,eax
 0062D5CD    push        ebp
 0062D5CE    push        62D6FC
 0062D5D3    push        dword ptr fs:[eax]
 0062D5D6    mov         dword ptr fs:[eax],esp
 0062D5D9    call        0074BF10
 0062D5DE    mov         edx,dword ptr [esi+18];TSixAxisValue.......................................................
 0062D5E1    call        TWiimoteManager.GetSixaxis
 0062D5E6    mov         ebx,eax
 0062D5E8    test        ebx,ebx
>0062D5EA    jne         0062D604
 0062D5EC    mov         eax,esi
 0062D5EE    mov         edx,dword ptr [eax]
 0062D5F0    call        dword ptr [edx+44];TSixAxisValue.GetDataType
 0062D5F3    cmp         al,4
>0062D5F5    jne         0062D604
 0062D5F7    mov         eax,dword ptr [ebp-4]
 0062D5FA    call        @UStrClr
>0062D5FF    jmp         0062D6E1
 0062D604    mov         eax,dword ptr [esi+20];TSixAxisValue.......................................................
 0062D607    sub         eax,2
>0062D60A    je          0062D616
 0062D60C    sub         eax,28
>0062D60F    je          0062D625
>0062D611    jmp         0062D6D7
 0062D616    mov         edx,dword ptr [ebp-4]
 0062D619    mov         eax,ebx
 0062D61B    call        TPS3ControllerObject.InByteString
>0062D620    jmp         0062D6E1
 0062D625    lea         ecx,[ebp-8]
 0062D628    movzx       eax,byte ptr [ebx+446];TSixaxisObject.?f446:byte
 0062D62F    mov         edx,2
 0062D634    call        IntToHex
 0062D639    push        dword ptr [ebp-8]
 0062D63C    push        62D718;':'
 0062D641    lea         ecx,[ebp-0C]
 0062D644    movzx       eax,byte ptr [ebx+447];TSixaxisObject.?f447:byte
 0062D64B    mov         edx,2
 0062D650    call        IntToHex
 0062D655    push        dword ptr [ebp-0C]
 0062D658    push        62D718;':'
 0062D65D    lea         ecx,[ebp-10]
 0062D660    movzx       eax,byte ptr [ebx+448];TSixaxisObject.?f448:byte
 0062D667    mov         edx,2
 0062D66C    call        IntToHex
 0062D671    push        dword ptr [ebp-10]
 0062D674    push        62D718;':'
 0062D679    lea         ecx,[ebp-14]
 0062D67C    movzx       eax,byte ptr [ebx+449];TSixaxisObject.?f449:byte
 0062D683    mov         edx,2
 0062D688    call        IntToHex
 0062D68D    push        dword ptr [ebp-14]
 0062D690    push        62D718;':'
 0062D695    lea         ecx,[ebp-18]
 0062D698    movzx       eax,byte ptr [ebx+44A];TSixaxisObject.?f44A:byte
 0062D69F    mov         edx,2
 0062D6A4    call        IntToHex
 0062D6A9    push        dword ptr [ebp-18]
 0062D6AC    push        62D718;':'
 0062D6B1    lea         ecx,[ebp-1C]
 0062D6B4    movzx       eax,byte ptr [ebx+44B];TSixaxisObject.?f44B:byte
 0062D6BB    mov         edx,2
 0062D6C0    call        IntToHex
 0062D6C5    push        dword ptr [ebp-1C]
 0062D6C8    mov         eax,dword ptr [ebp-4]
 0062D6CB    mov         edx,0B
 0062D6D0    call        @UStrCatN
>0062D6D5    jmp         0062D6E1
 0062D6D7    mov         edx,dword ptr [ebp-4]
 0062D6DA    mov         eax,esi
 0062D6DC    call        TExpression.GetString
 0062D6E1    xor         eax,eax
 0062D6E3    pop         edx
 0062D6E4    pop         ecx
 0062D6E5    pop         ecx
 0062D6E6    mov         dword ptr fs:[eax],edx
 0062D6E9    push        62D703
 0062D6EE    lea         eax,[ebp-1C]
 0062D6F1    mov         edx,6
 0062D6F6    call        @UStrArrayClr
 0062D6FB    ret
>0062D6FC    jmp         @HandleFinally
>0062D701    jmp         0062D6EE
 0062D703    pop         esi
 0062D704    pop         ebx
 0062D705    mov         esp,ebp
 0062D707    pop         ebp
 0062D708    ret
end;*}

//0062D71C
function TSixAxisValue.GetUnits:TUnits;
begin
{*
 0062D71C    mov         eax,dword ptr [eax+20];TSixAxisValue.......................................................
 0062D71F    cmp         eax,48
>0062D722    jge         0062D73E
 0062D724    sub         eax,1
>0062D727    jb          0062D75A
 0062D729    add         eax,0FFFFFFCF
 0062D72C    sub         eax,2
>0062D72F    jb          0062D760
 0062D731    dec         eax
 0062D732    sub         eax,4
>0062D735    jb          0062D75D
 0062D737    sub         eax,6
>0062D73A    jb          0062D760
>0062D73C    jmp         0062D769
 0062D73E    add         eax,0FFFFFFB8
 0062D741    sub         eax,6
>0062D744    jb          0062D763
 0062D746    add         eax,0FFFFFFE5
 0062D749    sub         eax,2
>0062D74C    jb          0062D766
 0062D74E    sub         eax,6
>0062D751    je          0062D766
 0062D753    sub         eax,4
>0062D756    je          0062D75D
>0062D758    jmp         0062D769
 0062D75A    xor         eax,eax
 0062D75C    ret
 0062D75D    mov         al,18
 0062D75F    ret
 0062D760    mov         al,5
 0062D762    ret
 0062D763    mov         al,11
 0062D765    ret
 0062D766    mov         al,18
 0062D768    ret
 0062D769    xor         eax,eax
 0062D76B    ret
*}
end;

//0062D76C
procedure TSixAxisValue.GetValue;
begin
{*
 0062D76C    push        ebx
 0062D76D    push        esi
 0062D76E    push        edi
 0062D76F    add         esp,0FFFFFFF4
 0062D772    mov         ebx,eax
 0062D774    call        0074BF10
 0062D779    mov         edi,eax
 0062D77B    mov         edx,dword ptr [ebx+18];TSixAxisValue.......................................................
 0062D77E    mov         eax,edi
 0062D780    call        TWiimoteManager.GetSixaxis
 0062D785    mov         esi,eax
 0062D787    test        esi,esi
>0062D789    jne         0062D79F
 0062D78B    cmp         dword ptr [ebx+20],29;TSixAxisValue........................................................
>0062D78F    je          0062D79F
 0062D791    xor         eax,eax
 0062D793    mov         dword ptr [esp],eax
 0062D796    mov         dword ptr [esp+4],eax
>0062D79A    jmp         0062F1CB
 0062D79F    mov         eax,dword ptr [ebx+20];TSixAxisValue.......................................................
 0062D7A2    mov         edx,eax
 0062D7A4    cmp         edx,10C
>0062D7AA    ja          0062F1C2
 0062D7B0    jmp         dword ptr [edx*4+62D7B7]
 0062D7B0    dd          0062DBEB
 0062D7B0    dd          0062DEBF
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062DD0F
 0062D7B0    dd          0062DCBE
 0062D7B0    dd          0062DCD9
 0062D7B0    dd          0062DCF4
 0062D7B0    dd          0062DDCC
 0062D7B0    dd          0062DDE7
 0062D7B0    dd          0062DE02
 0062D7B0    dd          0062DE1D
 0062D7B0    dd          0062DE38
 0062D7B0    dd          0062DE53
 0062D7B0    dd          0062DE6E
 0062D7B0    dd          0062DD2A
 0062D7B0    dd          0062DD45
 0062D7B0    dd          0062DD60
 0062D7B0    dd          0062DD7B
 0062D7B0    dd          0062DD96
 0062D7B0    dd          0062DDB1
 0062D7B0    dd          0062DF07
 0062D7B0    dd          0062DF17
 0062D7B0    dd          0062DF27
 0062D7B0    dd          0062DF37
 0062D7B0    dd          0062DF6D
 0062D7B0    dd          0062DF85
 0062D7B0    dd          0062DF9D
 0062D7B0    dd          0062E0D5
 0062D7B0    dd          0062E0E5
 0062D7B0    dd          0062E0F5
 0062D7B0    dd          0062E105
 0062D7B0    dd          0062E115
 0062D7B0    dd          0062E125
 0062D7B0    dd          0062E138
 0062D7B0    dd          0062E148
 0062D7B0    dd          0062E158
 0062D7B0    dd          0062E168
 0062D7B0    dd          0062E178
 0062D7B0    dd          0062E188
 0062D7B0    dd          0062DF47
 0062D7B0    dd          0062DF5A
 0062D7B0    dd          0062DC63
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062DFB5
 0062D7B0    dd          0062DFCD
 0062D7B0    dd          0062DFE5
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062E075
 0062D7B0    dd          0062E05D
 0062D7B0    dd          0062E0A5
 0062D7B0    dd          0062E08D
 0062D7B0    dd          0062E02D
 0062D7B0    dd          0062E03D
 0062D7B0    dd          0062E04D
 0062D7B0    dd          0062DFFD
 0062D7B0    dd          0062E00D
 0062D7B0    dd          0062E01D
 0062D7B0    dd          0062DEEF
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1AB
 0062D7B0    dd          0062E1CD
 0062D7B0    dd          0062E1CD
 0062D7B0    dd          0062E1CD
 0062D7B0    dd          0062E1CD
 0062D7B0    dd          0062E1CD
 0062D7B0    dd          0062E1CD
 0062D7B0    dd          0062E1E4
 0062D7B0    dd          0062E1E4
 0062D7B0    dd          0062E1E4
 0062D7B0    dd          0062E1E4
 0062D7B0    dd          0062E1E4
 0062D7B0    dd          0062E1E4
 0062D7B0    dd          0062E1FB
 0062D7B0    dd          0062E1FB
 0062D7B0    dd          0062E1FB
 0062D7B0    dd          0062E1FB
 0062D7B0    dd          0062E1FB
 0062D7B0    dd          0062E1FB
 0062D7B0    dd          0062E21F
 0062D7B0    dd          0062E21F
 0062D7B0    dd          0062E21F
 0062D7B0    dd          0062E21F
 0062D7B0    dd          0062E21F
 0062D7B0    dd          0062E21F
 0062D7B0    dd          0062E243
 0062D7B0    dd          0062E243
 0062D7B0    dd          0062E243
 0062D7B0    dd          0062E243
 0062D7B0    dd          0062E243
 0062D7B0    dd          0062E243
 0062D7B0    dd          0062DC1B
 0062D7B0    dd          0062DC03
 0062D7B0    dd          0062E297
 0062D7B0    dd          0062E27F
 0062D7B0    dd          0062E267
 0062D7B0    dd          0062DED7
 0062D7B0    dd          0062DC72
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062E2AC
 0062D7B0    dd          0062DC33
 0062D7B0    dd          0062DC4B
 0062D7B0    dd          0062DC8A
 0062D7B0    dd          0062E0BD
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062DE89
 0062D7B0    dd          0062DEA4
 0062D7B0    dd          0062E198
 0062D7B0    dd          0062DCB0
 0062D7B0    dd          0062DCA2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062E2C4
 0062D7B0    dd          0062E35B
 0062D7B0    dd          0062E376
 0062D7B0    dd          0062E391
 0062D7B0    dd          0062E3E2
 0062D7B0    dd          0062E2D4
 0062D7B0    dd          0062E2EF
 0062D7B0    dd          0062E30A
 0062D7B0    dd          0062E325
 0062D7B0    dd          0062E3AC
 0062D7B0    dd          0062E3C7
 0062D7B0    dd          0062E340
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062F1C2
 0062D7B0    dd          0062E3FD
 0062D7B0    dd          0062E655
 0062D7B0    dd          0062E41B
 0062D7B0    dd          0062E673
 0062D7B0    dd          0062E439
 0062D7B0    dd          0062E691
 0062D7B0    dd          0062E457
 0062D7B0    dd          0062E6AF
 0062D7B0    dd          0062E475
 0062D7B0    dd          0062E529
 0062D7B0    dd          0062E745
 0062D7B0    dd          0062E547
 0062D7B0    dd          0062E763
 0062D7B0    dd          0062E565
 0062D7B0    dd          0062E781
 0062D7B0    dd          0062E583
 0062D7B0    dd          0062E79F
 0062D7B0    dd          0062E5A1
 0062D7B0    dd          0062E493
 0062D7B0    dd          0062E6CD
 0062D7B0    dd          0062E4B1
 0062D7B0    dd          0062E6EB
 0062D7B0    dd          0062E4CF
 0062D7B0    dd          0062E709
 0062D7B0    dd          0062E4ED
 0062D7B0    dd          0062E727
 0062D7B0    dd          0062E50B
 0062D7B0    dd          0062E5BF
 0062D7B0    dd          0062E7BD
 0062D7B0    dd          0062E5DD
 0062D7B0    dd          0062E7DB
 0062D7B0    dd          0062E5FB
 0062D7B0    dd          0062E7F9
 0062D7B0    dd          0062E619
 0062D7B0    dd          0062E817
 0062D7B0    dd          0062E637
 0062D7B0    dd          0062E835
 0062D7B0    dd          0062EDD5
 0062D7B0    dd          0062E853
 0062D7B0    dd          0062EDF3
 0062D7B0    dd          0062E871
 0062D7B0    dd          0062EE11
 0062D7B0    dd          0062E88F
 0062D7B0    dd          0062EE2F
 0062D7B0    dd          0062E8AD
 0062D7B0    dd          0062E8CB
 0062D7B0    dd          0062E8E9
 0062D7B0    dd          0062EE4D
 0062D7B0    dd          0062E907
 0062D7B0    dd          0062EE6B
 0062D7B0    dd          0062E925
 0062D7B0    dd          0062EE89
 0062D7B0    dd          0062E943
 0062D7B0    dd          0062EEA7
 0062D7B0    dd          0062E961
 0062D7B0    dd          0062E97F
 0062D7B0    dd          0062F1A7
 0062D7B0    dd          0062F18C
 0062D7B0    dd          0062E99D
 0062D7B0    dd          0062EEC5
 0062D7B0    dd          0062E9BB
 0062D7B0    dd          0062EEE3
 0062D7B0    dd          0062E9D9
 0062D7B0    dd          0062EF01
 0062D7B0    dd          0062E9F7
 0062D7B0    dd          0062EF1F
 0062D7B0    dd          0062EA15
 0062D7B0    dd          0062EA33
 0062D7B0    dd          0062EA51
 0062D7B0    dd          0062EF3D
 0062D7B0    dd          0062EA6F
 0062D7B0    dd          0062EF5B
 0062D7B0    dd          0062EA8D
 0062D7B0    dd          0062EF79
 0062D7B0    dd          0062EAAB
 0062D7B0    dd          0062EF97
 0062D7B0    dd          0062EAC9
 0062D7B0    dd          0062EAE7
 0062D7B0    dd          0062EB05
 0062D7B0    dd          0062EFB5
 0062D7B0    dd          0062EB23
 0062D7B0    dd          0062EFD3
 0062D7B0    dd          0062EB41
 0062D7B0    dd          0062EFF1
 0062D7B0    dd          0062EB5F
 0062D7B0    dd          0062F00F
 0062D7B0    dd          0062EB7D
 0062D7B0    dd          0062EB9B
 0062D7B0    dd          0062EBB9
 0062D7B0    dd          0062F02D
 0062D7B0    dd          0062EBD7
 0062D7B0    dd          0062F04B
 0062D7B0    dd          0062EBF5
 0062D7B0    dd          0062F069
 0062D7B0    dd          0062EC13
 0062D7B0    dd          0062F087
 0062D7B0    dd          0062EC31
 0062D7B0    dd          0062EC4F
 0062D7B0    dd          0062EC6D
 0062D7B0    dd          0062F0A5
 0062D7B0    dd          0062EC8B
 0062D7B0    dd          0062F0C3
 0062D7B0    dd          0062ECA9
 0062D7B0    dd          0062F0E1
 0062D7B0    dd          0062ECC7
 0062D7B0    dd          0062F0FF
 0062D7B0    dd          0062ECE5
 0062D7B0    dd          0062ED03
 0062D7B0    dd          0062ED21
 0062D7B0    dd          0062F11D
 0062D7B0    dd          0062ED3F
 0062D7B0    dd          0062F13B
 0062D7B0    dd          0062ED5D
 0062D7B0    dd          0062F156
 0062D7B0    dd          0062ED7B
 0062D7B0    dd          0062F171
 0062D7B0    dd          0062ED99
 0062D7B0    dd          0062EDB7
 0062DBEB    movzx       eax,byte ptr [esi+18];TSixaxisObject.Connected:Boolean
 0062DBEF    movsx       eax,al
 0062DBF2    mov         dword ptr [esp+8],eax
 0062DBF6    fild        dword ptr [esp+8]
 0062DBFA    fstp        qword ptr [esp]
 0062DBFD    wait
>0062DBFE    jmp         0062F1CB
 0062DC03    movsx       eax,byte ptr [esi+489];TSixaxisObject.FPlayerLed:ShortInt
 0062DC0A    mov         dword ptr [esp+8],eax
 0062DC0E    fild        dword ptr [esp+8]
 0062DC12    fstp        qword ptr [esp]
 0062DC15    wait
>0062DC16    jmp         0062F1CB
 0062DC1B    movzx       eax,byte ptr [esi+488];TSixaxisObject.FLeds:byte
 0062DC22    mov         dword ptr [esp+8],eax
 0062DC26    fild        dword ptr [esp+8]
 0062DC2A    fstp        qword ptr [esp]
 0062DC2D    wait
>0062DC2E    jmp         0062F1CB
 0062DC33    mov         eax,dword ptr [esi+490];TSixaxisObject.FLedLevel:Double
 0062DC39    mov         dword ptr [esp],eax
 0062DC3C    mov         eax,dword ptr [esi+494];TSixaxisObject.?f494:dword
 0062DC42    mov         dword ptr [esp+4],eax
>0062DC46    jmp         0062F1CB
 0062DC4B    mov         eax,dword ptr [esi+498];TSixaxisObject.FLedDrumLevel:Double
 0062DC51    mov         dword ptr [esp],eax
 0062DC54    mov         eax,dword ptr [esi+49C];TSixaxisObject.?f49C:dword
 0062DC5A    mov         dword ptr [esp+4],eax
>0062DC5E    jmp         0062F1CB
 0062DC63    mov         eax,dword ptr [edi+60]
 0062DC66    fild        dword ptr [eax+8]
 0062DC69    fstp        qword ptr [esp]
 0062DC6C    wait
>0062DC6D    jmp         0062F1CB
 0062DC72    mov         eax,dword ptr [esi+230];TSixaxisObject.DegPerGyro:Double
 0062DC78    mov         dword ptr [esp],eax
 0062DC7B    mov         eax,dword ptr [esi+234];TSixaxisObject.?f234:dword
 0062DC81    mov         dword ptr [esp+4],eax
>0062DC85    jmp         0062F1CB
 0062DC8A    mov         eax,dword ptr [esi+480];TSixaxisObject.FRumble:Double
 0062DC90    mov         dword ptr [esp],eax
 0062DC93    mov         eax,dword ptr [esi+484];TSixaxisObject.?f484:dword
 0062DC99    mov         dword ptr [esp+4],eax
>0062DC9D    jmp         0062F1CB
 0062DCA2    xor         eax,eax
 0062DCA4    mov         dword ptr [esp],eax
 0062DCA7    mov         dword ptr [esp+4],eax
>0062DCAB    jmp         0062F1CB
 0062DCB0    xor         eax,eax
 0062DCB2    mov         dword ptr [esp],eax
 0062DCB5    mov         dword ptr [esp+4],eax
>0062DCB9    jmp         0062F1CB
 0062DCBE    mov         eax,esi
 0062DCC0    call        TPS3ControllerObject.Triangle
 0062DCC5    movsx       eax,al
 0062DCC8    mov         dword ptr [esp+8],eax
 0062DCCC    fild        dword ptr [esp+8]
 0062DCD0    fstp        qword ptr [esp]
 0062DCD3    wait
>0062DCD4    jmp         0062F1CB
 0062DCD9    mov         eax,esi
 0062DCDB    call        TPS3ControllerObject.Circle
 0062DCE0    movsx       eax,al
 0062DCE3    mov         dword ptr [esp+8],eax
 0062DCE7    fild        dword ptr [esp+8]
 0062DCEB    fstp        qword ptr [esp]
 0062DCEE    wait
>0062DCEF    jmp         0062F1CB
 0062DCF4    mov         eax,esi
 0062DCF6    call        TPS3ControllerObject.Cross
 0062DCFB    movsx       eax,al
 0062DCFE    mov         dword ptr [esp+8],eax
 0062DD02    fild        dword ptr [esp+8]
 0062DD06    fstp        qword ptr [esp]
 0062DD09    wait
>0062DD0A    jmp         0062F1CB
 0062DD0F    mov         eax,esi
 0062DD11    call        TPS3ControllerObject.Square
 0062DD16    movsx       eax,al
 0062DD19    mov         dword ptr [esp+8],eax
 0062DD1D    fild        dword ptr [esp+8]
 0062DD21    fstp        qword ptr [esp]
 0062DD24    wait
>0062DD25    jmp         0062F1CB
 0062DD2A    mov         eax,esi
 0062DD2C    call        TPS3ControllerObject.L1
 0062DD31    movsx       eax,al
 0062DD34    mov         dword ptr [esp+8],eax
 0062DD38    fild        dword ptr [esp+8]
 0062DD3C    fstp        qword ptr [esp]
 0062DD3F    wait
>0062DD40    jmp         0062F1CB
 0062DD45    mov         eax,esi
 0062DD47    call        TPS3ControllerObject.L2
 0062DD4C    movsx       eax,al
 0062DD4F    mov         dword ptr [esp+8],eax
 0062DD53    fild        dword ptr [esp+8]
 0062DD57    fstp        qword ptr [esp]
 0062DD5A    wait
>0062DD5B    jmp         0062F1CB
 0062DD60    mov         eax,esi
 0062DD62    call        TPS3ControllerObject.L3
 0062DD67    movsx       eax,al
 0062DD6A    mov         dword ptr [esp+8],eax
 0062DD6E    fild        dword ptr [esp+8]
 0062DD72    fstp        qword ptr [esp]
 0062DD75    wait
>0062DD76    jmp         0062F1CB
 0062DD7B    mov         eax,esi
 0062DD7D    call        TPS3ControllerObject.R1
 0062DD82    movsx       eax,al
 0062DD85    mov         dword ptr [esp+8],eax
 0062DD89    fild        dword ptr [esp+8]
 0062DD8D    fstp        qword ptr [esp]
 0062DD90    wait
>0062DD91    jmp         0062F1CB
 0062DD96    mov         eax,esi
 0062DD98    call        TPS3ControllerObject.R2
 0062DD9D    movsx       eax,al
 0062DDA0    mov         dword ptr [esp+8],eax
 0062DDA4    fild        dword ptr [esp+8]
 0062DDA8    fstp        qword ptr [esp]
 0062DDAB    wait
>0062DDAC    jmp         0062F1CB
 0062DDB1    mov         eax,esi
 0062DDB3    call        TPS3ControllerObject.R3
 0062DDB8    movsx       eax,al
 0062DDBB    mov         dword ptr [esp+8],eax
 0062DDBF    fild        dword ptr [esp+8]
 0062DDC3    fstp        qword ptr [esp]
 0062DDC6    wait
>0062DDC7    jmp         0062F1CB
 0062DDCC    mov         eax,esi
 0062DDCE    call        TPS3ControllerObject.Select
 0062DDD3    movsx       eax,al
 0062DDD6    mov         dword ptr [esp+8],eax
 0062DDDA    fild        dword ptr [esp+8]
 0062DDDE    fstp        qword ptr [esp]
 0062DDE1    wait
>0062DDE2    jmp         0062F1CB
 0062DDE7    mov         eax,esi
 0062DDE9    call        TPS3ControllerObject.Start
 0062DDEE    movsx       eax,al
 0062DDF1    mov         dword ptr [esp+8],eax
 0062DDF5    fild        dword ptr [esp+8]
 0062DDF9    fstp        qword ptr [esp]
 0062DDFC    wait
>0062DDFD    jmp         0062F1CB
 0062DE02    mov         eax,esi
 0062DE04    call        TPS3ControllerObject.Up
 0062DE09    movsx       eax,al
 0062DE0C    mov         dword ptr [esp+8],eax
 0062DE10    fild        dword ptr [esp+8]
 0062DE14    fstp        qword ptr [esp]
 0062DE17    wait
>0062DE18    jmp         0062F1CB
 0062DE1D    mov         eax,esi
 0062DE1F    call        TPS3ControllerObject.Down
 0062DE24    movsx       eax,al
 0062DE27    mov         dword ptr [esp+8],eax
 0062DE2B    fild        dword ptr [esp+8]
 0062DE2F    fstp        qword ptr [esp]
 0062DE32    wait
>0062DE33    jmp         0062F1CB
 0062DE38    mov         eax,esi
 0062DE3A    call        TPS3ControllerObject.Left
 0062DE3F    movsx       eax,al
 0062DE42    mov         dword ptr [esp+8],eax
 0062DE46    fild        dword ptr [esp+8]
 0062DE4A    fstp        qword ptr [esp]
 0062DE4D    wait
>0062DE4E    jmp         0062F1CB
 0062DE53    mov         eax,esi
 0062DE55    call        TPS3ControllerObject.Right
 0062DE5A    movsx       eax,al
 0062DE5D    mov         dword ptr [esp+8],eax
 0062DE61    fild        dword ptr [esp+8]
 0062DE65    fstp        qword ptr [esp]
 0062DE68    wait
>0062DE69    jmp         0062F1CB
 0062DE6E    mov         eax,esi
 0062DE70    call        TPS3ControllerObject.PS
 0062DE75    movsx       eax,al
 0062DE78    mov         dword ptr [esp+8],eax
 0062DE7C    fild        dword ptr [esp+8]
 0062DE80    fstp        qword ptr [esp]
 0062DE83    wait
>0062DE84    jmp         0062F1CB
 0062DE89    mov         eax,esi
 0062DE8B    call        TPS3ControllerObject.TButton
 0062DE90    movsx       eax,al
 0062DE93    mov         dword ptr [esp+8],eax
 0062DE97    fild        dword ptr [esp+8]
 0062DE9B    fstp        qword ptr [esp]
 0062DE9E    wait
>0062DE9F    jmp         0062F1CB
 0062DEA4    mov         eax,esi
 0062DEA6    call        TPS3ControllerObject.MoveButton
 0062DEAB    movsx       eax,al
 0062DEAE    mov         dword ptr [esp+8],eax
 0062DEB2    fild        dword ptr [esp+8]
 0062DEB6    fstp        qword ptr [esp]
 0062DEB9    wait
>0062DEBA    jmp         0062F1CB
 0062DEBF    movzx       eax,byte ptr [esi+451]
 0062DEC6    mov         dword ptr [esp+8],eax
 0062DECA    fild        dword ptr [esp+8]
 0062DECE    fstp        qword ptr [esp]
 0062DED1    wait
>0062DED2    jmp         0062F1CB
 0062DED7    mov         eax,dword ptr [esi+180];TSixaxisObject.ZeroYawSpeed:Double
 0062DEDD    mov         dword ptr [esp],eax
 0062DEE0    mov         eax,dword ptr [esi+184];TSixaxisObject.?f184:dword
 0062DEE6    mov         dword ptr [esp+4],eax
>0062DEEA    jmp         0062F1CB
 0062DEEF    mov         eax,dword ptr [esi+150];TSixaxisObject.RawGyroYaw:Double
 0062DEF5    mov         dword ptr [esp],eax
 0062DEF8    mov         eax,dword ptr [esi+154];TSixaxisObject.?f154:dword
 0062DEFE    mov         dword ptr [esp+4],eax
>0062DF02    jmp         0062F1CB
 0062DF07    mov         eax,esi
 0062DF09    call        TPS3ControllerObject.LeftStickX
 0062DF0E    fstp        qword ptr [esp]
 0062DF11    wait
>0062DF12    jmp         0062F1CB
 0062DF17    mov         eax,esi
 0062DF19    call        TPS3ControllerObject.LeftStickY
 0062DF1E    fstp        qword ptr [esp]
 0062DF21    wait
>0062DF22    jmp         0062F1CB
 0062DF27    mov         eax,esi
 0062DF29    call        TPS3ControllerObject.RightStickX
 0062DF2E    fstp        qword ptr [esp]
 0062DF31    wait
>0062DF32    jmp         0062F1CB
 0062DF37    mov         eax,esi
 0062DF39    call        TPS3ControllerObject.RightStickY
 0062DF3E    fstp        qword ptr [esp]
 0062DF41    wait
>0062DF42    jmp         0062F1CB
 0062DF47    mov         eax,esi
 0062DF49    mov         edx,dword ptr [eax]
 0062DF4B    call        dword ptr [edx+88];TPS3ControllerObject.DPadX
 0062DF51    fstp        qword ptr [esp]
 0062DF54    wait
>0062DF55    jmp         0062F1CB
 0062DF5A    mov         eax,esi
 0062DF5C    mov         edx,dword ptr [eax]
 0062DF5E    call        dword ptr [edx+8C];TPS3ControllerObject.DPadY
 0062DF64    fstp        qword ptr [esp]
 0062DF67    wait
>0062DF68    jmp         0062F1CB
 0062DF6D    mov         eax,dword ptr [esi+248];TSixaxisObject.RawForceX:Double
 0062DF73    mov         dword ptr [esp],eax
 0062DF76    mov         eax,dword ptr [esi+24C];TSixaxisObject.?f24C:dword
 0062DF7C    mov         dword ptr [esp+4],eax
>0062DF80    jmp         0062F1CB
 0062DF85    mov         eax,dword ptr [esi+250];TSixaxisObject.RawForceY:Double
 0062DF8B    mov         dword ptr [esp],eax
 0062DF8E    mov         eax,dword ptr [esi+254];TSixaxisObject.?f254:dword
 0062DF94    mov         dword ptr [esp+4],eax
>0062DF98    jmp         0062F1CB
 0062DF9D    mov         eax,dword ptr [esi+258];TSixaxisObject.RawForceZ:Double
 0062DFA3    mov         dword ptr [esp],eax
 0062DFA6    mov         eax,dword ptr [esi+25C];TSixaxisObject.?f25C:dword
 0062DFAC    mov         dword ptr [esp+4],eax
>0062DFB0    jmp         0062F1CB
 0062DFB5    mov         eax,dword ptr [esi+338];TSixaxisObject.gx:Double
 0062DFBB    mov         dword ptr [esp],eax
 0062DFBE    mov         eax,dword ptr [esi+33C];TSixaxisObject.?f33C:dword
 0062DFC4    mov         dword ptr [esp+4],eax
>0062DFC8    jmp         0062F1CB
 0062DFCD    mov         eax,dword ptr [esi+340];TSixaxisObject.gy:Double
 0062DFD3    mov         dword ptr [esp],eax
 0062DFD6    mov         eax,dword ptr [esi+344];TSixaxisObject.?f344:dword
 0062DFDC    mov         dword ptr [esp+4],eax
>0062DFE0    jmp         0062F1CB
 0062DFE5    mov         eax,dword ptr [esi+348];TSixaxisObject.gz:Double
 0062DFEB    mov         dword ptr [esp],eax
 0062DFEE    mov         eax,dword ptr [esi+34C];TSixaxisObject.?f34C:dword
 0062DFF4    mov         dword ptr [esp+4],eax
>0062DFF8    jmp         0062F1CB
 0062DFFD    mov         eax,esi
 0062DFFF    call        TAccelerometerObject.RawAccX
 0062E004    fstp        qword ptr [esp]
 0062E007    wait
>0062E008    jmp         0062F1CB
 0062E00D    mov         eax,esi
 0062E00F    call        TAccelerometerObject.RawAccY
 0062E014    fstp        qword ptr [esp]
 0062E017    wait
>0062E018    jmp         0062F1CB
 0062E01D    mov         eax,esi
 0062E01F    call        TAccelerometerObject.RawAccZ
 0062E024    fstp        qword ptr [esp]
 0062E027    wait
>0062E028    jmp         0062F1CB
 0062E02D    mov         eax,esi
 0062E02F    call        TAccelerometerObject.RelAccX
 0062E034    fstp        qword ptr [esp]
 0062E037    wait
>0062E038    jmp         0062F1CB
 0062E03D    mov         eax,esi
 0062E03F    call        TAccelerometerObject.RelAccY
 0062E044    fstp        qword ptr [esp]
 0062E047    wait
>0062E048    jmp         0062F1CB
 0062E04D    mov         eax,esi
 0062E04F    call        TAccelerometerObject.RelAccZ
 0062E054    fstp        qword ptr [esp]
 0062E057    wait
>0062E058    jmp         0062F1CB
 0062E05D    mov         eax,dword ptr [esi+3C0];TSixaxisObject.Pitch:Double
 0062E063    mov         dword ptr [esp],eax
 0062E066    mov         eax,dword ptr [esi+3C4];TSixaxisObject.?f3C4:dword
 0062E06C    mov         dword ptr [esp+4],eax
>0062E070    jmp         0062F1CB
 0062E075    mov         eax,dword ptr [esi+3B8];TSixaxisObject.Roll:Double
 0062E07B    mov         dword ptr [esp],eax
 0062E07E    mov         eax,dword ptr [esi+3BC];TSixaxisObject.?f3BC:dword
 0062E084    mov         dword ptr [esp+4],eax
>0062E088    jmp         0062F1CB
 0062E08D    mov         eax,dword ptr [esi+3D8];TSixaxisObject.SmoothPitch:Double
 0062E093    mov         dword ptr [esp],eax
 0062E096    mov         eax,dword ptr [esi+3DC];TSixaxisObject.?f3DC:dword
 0062E09C    mov         dword ptr [esp+4],eax
>0062E0A0    jmp         0062F1CB
 0062E0A5    mov         eax,dword ptr [esi+3D0];TSixaxisObject.SmoothRoll:Double
 0062E0AB    mov         dword ptr [esp],eax
 0062E0AE    mov         eax,dword ptr [esi+3D4];TSixaxisObject.?f3D4:dword
 0062E0B4    mov         dword ptr [esp+4],eax
>0062E0B8    jmp         0062F1CB
 0062E0BD    mov         eax,dword ptr [esi+3E0];TSixaxisObject.SteeringAngle:Double
 0062E0C3    mov         dword ptr [esp],eax
 0062E0C6    mov         eax,dword ptr [esi+3E4];TSixaxisObject.?f3E4:dword
 0062E0CC    mov         dword ptr [esp+4],eax
>0062E0D0    jmp         0062F1CB
 0062E0D5    mov         eax,esi
 0062E0D7    mov         edx,dword ptr [eax]
 0062E0D9    call        dword ptr [edx+54];TPS3ControllerObject.UpAnalog
 0062E0DC    fstp        qword ptr [esp]
 0062E0DF    wait
>0062E0E0    jmp         0062F1CB
 0062E0E5    mov         eax,esi
 0062E0E7    mov         edx,dword ptr [eax]
 0062E0E9    call        dword ptr [edx+60];TPS3ControllerObject.RightAnalog
 0062E0EC    fstp        qword ptr [esp]
 0062E0EF    wait
>0062E0F0    jmp         0062F1CB
 0062E0F5    mov         eax,esi
 0062E0F7    mov         edx,dword ptr [eax]
 0062E0F9    call        dword ptr [edx+58];TPS3ControllerObject.DownAnalog
 0062E0FC    fstp        qword ptr [esp]
 0062E0FF    wait
>0062E100    jmp         0062F1CB
 0062E105    mov         eax,esi
 0062E107    mov         edx,dword ptr [eax]
 0062E109    call        dword ptr [edx+5C];TPS3ControllerObject.LeftAnalog
 0062E10C    fstp        qword ptr [esp]
 0062E10F    wait
>0062E110    jmp         0062F1CB
 0062E115    mov         eax,esi
 0062E117    mov         edx,dword ptr [eax]
 0062E119    call        dword ptr [edx+68];TPS3ControllerObject.L2Analog
 0062E11C    fstp        qword ptr [esp]
 0062E11F    wait
>0062E120    jmp         0062F1CB
 0062E125    mov         eax,esi
 0062E127    mov         edx,dword ptr [eax]
 0062E129    call        dword ptr [edx+80];TPS3ControllerObject.R2Analog
 0062E12F    fstp        qword ptr [esp]
 0062E132    wait
>0062E133    jmp         0062F1CB
 0062E138    mov         eax,esi
 0062E13A    mov         edx,dword ptr [eax]
 0062E13C    call        dword ptr [edx+64];TPS3ControllerObject.L1Analog
 0062E13F    fstp        qword ptr [esp]
 0062E142    wait
>0062E143    jmp         0062F1CB
 0062E148    mov         eax,esi
 0062E14A    mov         edx,dword ptr [eax]
 0062E14C    call        dword ptr [edx+7C];TPS3ControllerObject.R1Analog
 0062E14F    fstp        qword ptr [esp]
 0062E152    wait
>0062E153    jmp         0062F1CB
 0062E158    mov         eax,esi
 0062E15A    mov         edx,dword ptr [eax]
 0062E15C    call        dword ptr [edx+78];TPS3ControllerObject.TriangleAnalog
 0062E15F    fstp        qword ptr [esp]
 0062E162    wait
>0062E163    jmp         0062F1CB
 0062E168    mov         eax,esi
 0062E16A    mov         edx,dword ptr [eax]
 0062E16C    call        dword ptr [edx+6C];TPS3ControllerObject.CircleAnalog
 0062E16F    fstp        qword ptr [esp]
 0062E172    wait
>0062E173    jmp         0062F1CB
 0062E178    mov         eax,esi
 0062E17A    mov         edx,dword ptr [eax]
 0062E17C    call        dword ptr [edx+70];TPS3ControllerObject.CrossAnalog
 0062E17F    fstp        qword ptr [esp]
 0062E182    wait
>0062E183    jmp         0062F1CB
 0062E188    mov         eax,esi
 0062E18A    mov         edx,dword ptr [eax]
 0062E18C    call        dword ptr [edx+74];TPS3ControllerObject.SquareAnalog
 0062E18F    fstp        qword ptr [esp]
 0062E192    wait
>0062E193    jmp         0062F1CB
 0062E198    mov         eax,esi
 0062E19A    mov         edx,dword ptr [eax]
 0062E19C    call        dword ptr [edx+84];TPS3ControllerObject.TAnalog
 0062E1A2    fstp        qword ptr [esp]
 0062E1A5    wait
>0062E1A6    jmp         0062F1CB
 0062E1AB    sub         eax,40
 0062E1AE    mov         ebx,eax
 0062E1B0    mov         edx,ebx
 0062E1B2    mov         eax,esi
 0062E1B4    call        TPS3ControllerObject.GetLed
 0062E1B9    movsx       eax,al
 0062E1BC    mov         dword ptr [esp+8],eax
 0062E1C0    fild        dword ptr [esp+8]
 0062E1C4    fstp        qword ptr [esp]
 0062E1C7    wait
>0062E1C8    jmp         0062F1CB
 0062E1CD    sub         eax,49
 0062E1D0    mov         ebx,eax
 0062E1D2    mov         edx,ebx
 0062E1D4    mov         eax,esi
 0062E1D6    call        TPS3ControllerObject.GetLedDuration
 0062E1DB    fstp        qword ptr [esp]
 0062E1DE    wait
>0062E1DF    jmp         0062F1CB
 0062E1E4    sub         eax,4F
 0062E1E7    mov         ebx,eax
 0062E1E9    mov         edx,ebx
 0062E1EB    mov         eax,esi
 0062E1ED    call        TPS3ControllerObject.GetLedFrequency
 0062E1F2    fstp        qword ptr [esp]
 0062E1F5    wait
>0062E1F6    jmp         0062F1CB
 0062E1FB    sub         eax,55
 0062E1FE    mov         ebx,eax
 0062E200    mov         edx,ebx
 0062E202    mov         cl,1
 0062E204    mov         eax,esi
 0062E206    call        TPS3ControllerObject.GetLedBlock
 0062E20B    movzx       eax,al
 0062E20E    mov         dword ptr [esp+8],eax
 0062E212    fild        dword ptr [esp+8]
 0062E216    fstp        qword ptr [esp]
 0062E219    wait
>0062E21A    jmp         0062F1CB
 0062E21F    sub         eax,5B
 0062E222    mov         ebx,eax
 0062E224    mov         edx,ebx
 0062E226    mov         cl,2
 0062E228    mov         eax,esi
 0062E22A    call        TPS3ControllerObject.GetLedBlock
 0062E22F    movzx       eax,al
 0062E232    mov         dword ptr [esp+8],eax
 0062E236    fild        dword ptr [esp+8]
 0062E23A    fstp        qword ptr [esp]
 0062E23D    wait
>0062E23E    jmp         0062F1CB
 0062E243    sub         eax,61
 0062E246    mov         ebx,eax
 0062E248    mov         edx,ebx
 0062E24A    mov         cl,3
 0062E24C    mov         eax,esi
 0062E24E    call        TPS3ControllerObject.GetLedBlock
 0062E253    movzx       eax,al
 0062E256    mov         dword ptr [esp+8],eax
 0062E25A    fild        dword ptr [esp+8]
 0062E25E    fstp        qword ptr [esp]
 0062E261    wait
>0062E262    jmp         0062F1CB
 0062E267    mov         eax,dword ptr [esi+3C8];TSixaxisObject.Yaw:Double
 0062E26D    mov         dword ptr [esp],eax
 0062E270    mov         eax,dword ptr [esi+3CC];TSixaxisObject.?f3CC:dword
 0062E276    mov         dword ptr [esp+4],eax
>0062E27A    jmp         0062F1CB
 0062E27F    mov         eax,dword ptr [esi+168];TSixaxisObject.YawSpeed:Double
 0062E285    mov         dword ptr [esp],eax
 0062E288    mov         eax,dword ptr [esi+16C];TSixaxisObject.?f16C:dword
 0062E28E    mov         dword ptr [esp+4],eax
>0062E292    jmp         0062F1CB
 0062E297    fld         qword ptr [esi+150];TSixaxisObject.RawGyroYaw:Double
 0062E29D    fsub        qword ptr [esi+180];TSixaxisObject.ZeroYawSpeed:Double
 0062E2A3    fstp        qword ptr [esp]
 0062E2A6    wait
>0062E2A7    jmp         0062F1CB
 0062E2AC    mov         eax,dword ptr [esi+1B0];TSixaxisObject.TotalGyroYaw:Double
 0062E2B2    mov         dword ptr [esp],eax
 0062E2B5    mov         eax,dword ptr [esi+1B4];TSixaxisObject.?f1B4:dword
 0062E2BB    mov         dword ptr [esp+4],eax
>0062E2BF    jmp         0062F1CB
 0062E2C4    mov         eax,esi
 0062E2C6    call        TAccelerometerObject.Shakiness
 0062E2CB    fstp        qword ptr [esp]
 0062E2CE    wait
>0062E2CF    jmp         0062F1CB
 0062E2D4    mov         eax,esi
 0062E2D6    call        TAccelerometerObject.SwingHorizontally
 0062E2DB    movsx       eax,al
 0062E2DE    mov         dword ptr [esp+8],eax
 0062E2E2    fild        dword ptr [esp+8]
 0062E2E6    fstp        qword ptr [esp]
 0062E2E9    wait
>0062E2EA    jmp         0062F1CB
 0062E2EF    mov         eax,esi
 0062E2F1    mov         edx,dword ptr [eax]
 0062E2F3    call        dword ptr [edx+0C];TAccelerometerObject.SwingVertically
 0062E2F6    movsx       eax,al
 0062E2F9    mov         dword ptr [esp+8],eax
 0062E2FD    fild        dword ptr [esp+8]
 0062E301    fstp        qword ptr [esp]
 0062E304    wait
>0062E305    jmp         0062F1CB
 0062E30A    mov         eax,esi
 0062E30C    call        TAccelerometerObject.Stabbing
 0062E311    movsx       eax,al
 0062E314    mov         dword ptr [esp+8],eax
 0062E318    fild        dword ptr [esp+8]
 0062E31C    fstp        qword ptr [esp]
 0062E31F    wait
>0062E320    jmp         0062F1CB
 0062E325    mov         eax,esi
 0062E327    call        TAccelerometerObject.DrumBeat
 0062E32C    movsx       eax,al
 0062E32F    mov         dword ptr [esp+8],eax
 0062E333    fild        dword ptr [esp+8]
 0062E337    fstp        qword ptr [esp]
 0062E33A    wait
>0062E33B    jmp         0062F1CB
 0062E340    mov         eax,esi
 0062E342    mov         edx,dword ptr [eax]
 0062E344    call        dword ptr [edx+10];TPS3ControllerObject.CrossArms
 0062E347    movsx       eax,al
 0062E34A    mov         dword ptr [esp+8],eax
 0062E34E    fild        dword ptr [esp+8]
 0062E352    fstp        qword ptr [esp]
 0062E355    wait
>0062E356    jmp         0062F1CB
 0062E35B    mov         eax,esi
 0062E35D    call        TAccelerometerObject.OnTable
 0062E362    movsx       eax,al
 0062E365    mov         dword ptr [esp+8],eax
 0062E369    fild        dword ptr [esp+8]
 0062E36D    fstp        qword ptr [esp]
 0062E370    wait
>0062E371    jmp         0062F1CB
 0062E376    movzx       eax,byte ptr [esi+430];TSixaxisObject.LookingAtWatch:Boolean
 0062E37D    movsx       eax,al
 0062E380    mov         dword ptr [esp+8],eax
 0062E384    fild        dword ptr [esp+8]
 0062E388    fstp        qword ptr [esp]
 0062E38B    wait
>0062E38C    jmp         0062F1CB
 0062E391    movzx       eax,byte ptr [esi+431];TSixaxisObject.LookingAtWatchRH:Boolean
 0062E398    movsx       eax,al
 0062E39B    mov         dword ptr [esp+8],eax
 0062E39F    fild        dword ptr [esp+8]
 0062E3A3    fstp        qword ptr [esp]
 0062E3A6    wait
>0062E3A7    jmp         0062F1CB
 0062E3AC    movzx       eax,byte ptr [esi+432];TSixaxisObject.LookingAtLeftPalm:Boolean
 0062E3B3    movsx       eax,al
 0062E3B6    mov         dword ptr [esp+8],eax
 0062E3BA    fild        dword ptr [esp+8]
 0062E3BE    fstp        qword ptr [esp]
 0062E3C1    wait
>0062E3C2    jmp         0062F1CB
 0062E3C7    movzx       eax,byte ptr [esi+433];TSixaxisObject.LookingAtRightPalm:Boolean
 0062E3CE    movsx       eax,al
 0062E3D1    mov         dword ptr [esp+8],eax
 0062E3D5    fild        dword ptr [esp+8]
 0062E3D9    fstp        qword ptr [esp]
 0062E3DC    wait
>0062E3DD    jmp         0062F1CB
 0062E3E2    movzx       eax,byte ptr [esi+434];TSixaxisObject.UpsideDownOnShoulder:Boolean
 0062E3E9    movsx       eax,al
 0062E3EC    mov         dword ptr [esp+8],eax
 0062E3F0    fild        dword ptr [esp+8]
 0062E3F4    fstp        qword ptr [esp]
 0062E3F7    wait
>0062E3F8    jmp         0062F1CB
 0062E3FD    cmp         byte ptr [esi+42F],1;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E404    sete        al
 0062E407    movsx       eax,al
 0062E40A    mov         dword ptr [esp+8],eax
 0062E40E    fild        dword ptr [esp+8]
 0062E412    fstp        qword ptr [esp]
 0062E415    wait
>0062E416    jmp         0062F1CB
 0062E41B    cmp         byte ptr [esi+42F],2;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E422    sete        al
 0062E425    movsx       eax,al
 0062E428    mov         dword ptr [esp+8],eax
 0062E42C    fild        dword ptr [esp+8]
 0062E430    fstp        qword ptr [esp]
 0062E433    wait
>0062E434    jmp         0062F1CB
 0062E439    cmp         byte ptr [esi+42F],3;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E440    sete        al
 0062E443    movsx       eax,al
 0062E446    mov         dword ptr [esp+8],eax
 0062E44A    fild        dword ptr [esp+8]
 0062E44E    fstp        qword ptr [esp]
 0062E451    wait
>0062E452    jmp         0062F1CB
 0062E457    cmp         byte ptr [esi+42F],4;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E45E    sete        al
 0062E461    movsx       eax,al
 0062E464    mov         dword ptr [esp+8],eax
 0062E468    fild        dword ptr [esp+8]
 0062E46C    fstp        qword ptr [esp]
 0062E46F    wait
>0062E470    jmp         0062F1CB
 0062E475    cmp         byte ptr [esi+42F],5;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E47C    sete        al
 0062E47F    movsx       eax,al
 0062E482    mov         dword ptr [esp+8],eax
 0062E486    fild        dword ptr [esp+8]
 0062E48A    fstp        qword ptr [esp]
 0062E48D    wait
>0062E48E    jmp         0062F1CB
 0062E493    cmp         byte ptr [esi+42F],23;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E49A    sete        al
 0062E49D    movsx       eax,al
 0062E4A0    mov         dword ptr [esp+8],eax
 0062E4A4    fild        dword ptr [esp+8]
 0062E4A8    fstp        qword ptr [esp]
 0062E4AB    wait
>0062E4AC    jmp         0062F1CB
 0062E4B1    cmp         byte ptr [esi+42F],24;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E4B8    sete        al
 0062E4BB    movsx       eax,al
 0062E4BE    mov         dword ptr [esp+8],eax
 0062E4C2    fild        dword ptr [esp+8]
 0062E4C6    fstp        qword ptr [esp]
 0062E4C9    wait
>0062E4CA    jmp         0062F1CB
 0062E4CF    cmp         byte ptr [esi+42F],25;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E4D6    sete        al
 0062E4D9    movsx       eax,al
 0062E4DC    mov         dword ptr [esp+8],eax
 0062E4E0    fild        dword ptr [esp+8]
 0062E4E4    fstp        qword ptr [esp]
 0062E4E7    wait
>0062E4E8    jmp         0062F1CB
 0062E4ED    cmp         byte ptr [esi+42F],26;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E4F4    sete        al
 0062E4F7    movsx       eax,al
 0062E4FA    mov         dword ptr [esp+8],eax
 0062E4FE    fild        dword ptr [esp+8]
 0062E502    fstp        qword ptr [esp]
 0062E505    wait
>0062E506    jmp         0062F1CB
 0062E50B    cmp         byte ptr [esi+42F],27;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E512    sete        al
 0062E515    movsx       eax,al
 0062E518    mov         dword ptr [esp+8],eax
 0062E51C    fild        dword ptr [esp+8]
 0062E520    fstp        qword ptr [esp]
 0062E523    wait
>0062E524    jmp         0062F1CB
 0062E529    cmp         byte ptr [esi+42F],12;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E530    sete        al
 0062E533    movsx       eax,al
 0062E536    mov         dword ptr [esp+8],eax
 0062E53A    fild        dword ptr [esp+8]
 0062E53E    fstp        qword ptr [esp]
 0062E541    wait
>0062E542    jmp         0062F1CB
 0062E547    cmp         byte ptr [esi+42F],13;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E54E    sete        al
 0062E551    movsx       eax,al
 0062E554    mov         dword ptr [esp+8],eax
 0062E558    fild        dword ptr [esp+8]
 0062E55C    fstp        qword ptr [esp]
 0062E55F    wait
>0062E560    jmp         0062F1CB
 0062E565    cmp         byte ptr [esi+42F],14;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E56C    sete        al
 0062E56F    movsx       eax,al
 0062E572    mov         dword ptr [esp+8],eax
 0062E576    fild        dword ptr [esp+8]
 0062E57A    fstp        qword ptr [esp]
 0062E57D    wait
>0062E57E    jmp         0062F1CB
 0062E583    cmp         byte ptr [esi+42F],15;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E58A    sete        al
 0062E58D    movsx       eax,al
 0062E590    mov         dword ptr [esp+8],eax
 0062E594    fild        dword ptr [esp+8]
 0062E598    fstp        qword ptr [esp]
 0062E59B    wait
>0062E59C    jmp         0062F1CB
 0062E5A1    cmp         byte ptr [esi+42F],16;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E5A8    sete        al
 0062E5AB    movsx       eax,al
 0062E5AE    mov         dword ptr [esp+8],eax
 0062E5B2    fild        dword ptr [esp+8]
 0062E5B6    fstp        qword ptr [esp]
 0062E5B9    wait
>0062E5BA    jmp         0062F1CB
 0062E5BF    cmp         byte ptr [esi+42F],34;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E5C6    sete        al
 0062E5C9    movsx       eax,al
 0062E5CC    mov         dword ptr [esp+8],eax
 0062E5D0    fild        dword ptr [esp+8]
 0062E5D4    fstp        qword ptr [esp]
 0062E5D7    wait
>0062E5D8    jmp         0062F1CB
 0062E5DD    cmp         byte ptr [esi+42F],35;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E5E4    sete        al
 0062E5E7    movsx       eax,al
 0062E5EA    mov         dword ptr [esp+8],eax
 0062E5EE    fild        dword ptr [esp+8]
 0062E5F2    fstp        qword ptr [esp]
 0062E5F5    wait
>0062E5F6    jmp         0062F1CB
 0062E5FB    cmp         byte ptr [esi+42F],36;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E602    sete        al
 0062E605    movsx       eax,al
 0062E608    mov         dword ptr [esp+8],eax
 0062E60C    fild        dword ptr [esp+8]
 0062E610    fstp        qword ptr [esp]
 0062E613    wait
>0062E614    jmp         0062F1CB
 0062E619    cmp         byte ptr [esi+42F],37;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E620    sete        al
 0062E623    movsx       eax,al
 0062E626    mov         dword ptr [esp+8],eax
 0062E62A    fild        dword ptr [esp+8]
 0062E62E    fstp        qword ptr [esp]
 0062E631    wait
>0062E632    jmp         0062F1CB
 0062E637    cmp         byte ptr [esi+42F],38;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E63E    sete        al
 0062E641    movsx       eax,al
 0062E644    mov         dword ptr [esp+8],eax
 0062E648    fild        dword ptr [esp+8]
 0062E64C    fstp        qword ptr [esp]
 0062E64F    wait
>0062E650    jmp         0062F1CB
 0062E655    cmp         byte ptr [esi+42D],1;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E65C    sete        al
 0062E65F    movsx       eax,al
 0062E662    mov         dword ptr [esp+8],eax
 0062E666    fild        dword ptr [esp+8]
 0062E66A    fstp        qword ptr [esp]
 0062E66D    wait
>0062E66E    jmp         0062F1CB
 0062E673    cmp         byte ptr [esi+42D],2;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E67A    sete        al
 0062E67D    movsx       eax,al
 0062E680    mov         dword ptr [esp+8],eax
 0062E684    fild        dword ptr [esp+8]
 0062E688    fstp        qword ptr [esp]
 0062E68B    wait
>0062E68C    jmp         0062F1CB
 0062E691    cmp         byte ptr [esi+42D],3;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E698    sete        al
 0062E69B    movsx       eax,al
 0062E69E    mov         dword ptr [esp+8],eax
 0062E6A2    fild        dword ptr [esp+8]
 0062E6A6    fstp        qword ptr [esp]
 0062E6A9    wait
>0062E6AA    jmp         0062F1CB
 0062E6AF    cmp         byte ptr [esi+42D],4;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E6B6    sete        al
 0062E6B9    movsx       eax,al
 0062E6BC    mov         dword ptr [esp+8],eax
 0062E6C0    fild        dword ptr [esp+8]
 0062E6C4    fstp        qword ptr [esp]
 0062E6C7    wait
>0062E6C8    jmp         0062F1CB
 0062E6CD    cmp         byte ptr [esi+42D],23;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E6D4    sete        al
 0062E6D7    movsx       eax,al
 0062E6DA    mov         dword ptr [esp+8],eax
 0062E6DE    fild        dword ptr [esp+8]
 0062E6E2    fstp        qword ptr [esp]
 0062E6E5    wait
>0062E6E6    jmp         0062F1CB
 0062E6EB    cmp         byte ptr [esi+42D],24;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E6F2    sete        al
 0062E6F5    movsx       eax,al
 0062E6F8    mov         dword ptr [esp+8],eax
 0062E6FC    fild        dword ptr [esp+8]
 0062E700    fstp        qword ptr [esp]
 0062E703    wait
>0062E704    jmp         0062F1CB
 0062E709    cmp         byte ptr [esi+42D],25;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E710    sete        al
 0062E713    movsx       eax,al
 0062E716    mov         dword ptr [esp+8],eax
 0062E71A    fild        dword ptr [esp+8]
 0062E71E    fstp        qword ptr [esp]
 0062E721    wait
>0062E722    jmp         0062F1CB
 0062E727    cmp         byte ptr [esi+42D],26;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E72E    sete        al
 0062E731    movsx       eax,al
 0062E734    mov         dword ptr [esp+8],eax
 0062E738    fild        dword ptr [esp+8]
 0062E73C    fstp        qword ptr [esp]
 0062E73F    wait
>0062E740    jmp         0062F1CB
 0062E745    cmp         byte ptr [esi+42D],12;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E74C    sete        al
 0062E74F    movsx       eax,al
 0062E752    mov         dword ptr [esp+8],eax
 0062E756    fild        dword ptr [esp+8]
 0062E75A    fstp        qword ptr [esp]
 0062E75D    wait
>0062E75E    jmp         0062F1CB
 0062E763    cmp         byte ptr [esi+42D],13;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E76A    sete        al
 0062E76D    movsx       eax,al
 0062E770    mov         dword ptr [esp+8],eax
 0062E774    fild        dword ptr [esp+8]
 0062E778    fstp        qword ptr [esp]
 0062E77B    wait
>0062E77C    jmp         0062F1CB
 0062E781    cmp         byte ptr [esi+42D],14;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E788    sete        al
 0062E78B    movsx       eax,al
 0062E78E    mov         dword ptr [esp+8],eax
 0062E792    fild        dword ptr [esp+8]
 0062E796    fstp        qword ptr [esp]
 0062E799    wait
>0062E79A    jmp         0062F1CB
 0062E79F    cmp         byte ptr [esi+42D],15;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E7A6    sete        al
 0062E7A9    movsx       eax,al
 0062E7AC    mov         dword ptr [esp+8],eax
 0062E7B0    fild        dword ptr [esp+8]
 0062E7B4    fstp        qword ptr [esp]
 0062E7B7    wait
>0062E7B8    jmp         0062F1CB
 0062E7BD    cmp         byte ptr [esi+42D],34;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E7C4    sete        al
 0062E7C7    movsx       eax,al
 0062E7CA    mov         dword ptr [esp+8],eax
 0062E7CE    fild        dword ptr [esp+8]
 0062E7D2    fstp        qword ptr [esp]
 0062E7D5    wait
>0062E7D6    jmp         0062F1CB
 0062E7DB    cmp         byte ptr [esi+42D],35;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E7E2    sete        al
 0062E7E5    movsx       eax,al
 0062E7E8    mov         dword ptr [esp+8],eax
 0062E7EC    fild        dword ptr [esp+8]
 0062E7F0    fstp        qword ptr [esp]
 0062E7F3    wait
>0062E7F4    jmp         0062F1CB
 0062E7F9    cmp         byte ptr [esi+42D],36;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E800    sete        al
 0062E803    movsx       eax,al
 0062E806    mov         dword ptr [esp+8],eax
 0062E80A    fild        dword ptr [esp+8]
 0062E80E    fstp        qword ptr [esp]
 0062E811    wait
>0062E812    jmp         0062F1CB
 0062E817    cmp         byte ptr [esi+42D],37;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062E81E    sete        al
 0062E821    movsx       eax,al
 0062E824    mov         dword ptr [esp+8],eax
 0062E828    fild        dword ptr [esp+8]
 0062E82C    fstp        qword ptr [esp]
 0062E82F    wait
>0062E830    jmp         0062F1CB
 0062E835    cmp         byte ptr [esi+42F],6;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E83C    sete        al
 0062E83F    movsx       eax,al
 0062E842    mov         dword ptr [esp+8],eax
 0062E846    fild        dword ptr [esp+8]
 0062E84A    fstp        qword ptr [esp]
 0062E84D    wait
>0062E84E    jmp         0062F1CB
 0062E853    cmp         byte ptr [esi+42F],7;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E85A    sete        al
 0062E85D    movsx       eax,al
 0062E860    mov         dword ptr [esp+8],eax
 0062E864    fild        dword ptr [esp+8]
 0062E868    fstp        qword ptr [esp]
 0062E86B    wait
>0062E86C    jmp         0062F1CB
 0062E871    cmp         byte ptr [esi+42F],8;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E878    sete        al
 0062E87B    movsx       eax,al
 0062E87E    mov         dword ptr [esp+8],eax
 0062E882    fild        dword ptr [esp+8]
 0062E886    fstp        qword ptr [esp]
 0062E889    wait
>0062E88A    jmp         0062F1CB
 0062E88F    cmp         byte ptr [esi+42F],0A;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E896    sete        al
 0062E899    movsx       eax,al
 0062E89C    mov         dword ptr [esp+8],eax
 0062E8A0    fild        dword ptr [esp+8]
 0062E8A4    fstp        qword ptr [esp]
 0062E8A7    wait
>0062E8A8    jmp         0062F1CB
 0062E8AD    cmp         byte ptr [esi+42F],0B;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E8B4    sete        al
 0062E8B7    movsx       eax,al
 0062E8BA    mov         dword ptr [esp+8],eax
 0062E8BE    fild        dword ptr [esp+8]
 0062E8C2    fstp        qword ptr [esp]
 0062E8C5    wait
>0062E8C6    jmp         0062F1CB
 0062E8CB    cmp         byte ptr [esi+42F],9;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E8D2    sete        al
 0062E8D5    movsx       eax,al
 0062E8D8    mov         dword ptr [esp+8],eax
 0062E8DC    fild        dword ptr [esp+8]
 0062E8E0    fstp        qword ptr [esp]
 0062E8E3    wait
>0062E8E4    jmp         0062F1CB
 0062E8E9    cmp         byte ptr [esi+42F],0C;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E8F0    sete        al
 0062E8F3    movsx       eax,al
 0062E8F6    mov         dword ptr [esp+8],eax
 0062E8FA    fild        dword ptr [esp+8]
 0062E8FE    fstp        qword ptr [esp]
 0062E901    wait
>0062E902    jmp         0062F1CB
 0062E907    cmp         byte ptr [esi+42F],0D;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E90E    sete        al
 0062E911    movsx       eax,al
 0062E914    mov         dword ptr [esp+8],eax
 0062E918    fild        dword ptr [esp+8]
 0062E91C    fstp        qword ptr [esp]
 0062E91F    wait
>0062E920    jmp         0062F1CB
 0062E925    cmp         byte ptr [esi+42F],0E;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E92C    sete        al
 0062E92F    movsx       eax,al
 0062E932    mov         dword ptr [esp+8],eax
 0062E936    fild        dword ptr [esp+8]
 0062E93A    fstp        qword ptr [esp]
 0062E93D    wait
>0062E93E    jmp         0062F1CB
 0062E943    cmp         byte ptr [esi+42F],10;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E94A    sete        al
 0062E94D    movsx       eax,al
 0062E950    mov         dword ptr [esp+8],eax
 0062E954    fild        dword ptr [esp+8]
 0062E958    fstp        qword ptr [esp]
 0062E95B    wait
>0062E95C    jmp         0062F1CB
 0062E961    cmp         byte ptr [esi+42F],11;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E968    sete        al
 0062E96B    movsx       eax,al
 0062E96E    mov         dword ptr [esp+8],eax
 0062E972    fild        dword ptr [esp+8]
 0062E976    fstp        qword ptr [esp]
 0062E979    wait
>0062E97A    jmp         0062F1CB
 0062E97F    cmp         byte ptr [esi+42F],0F;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E986    sete        al
 0062E989    movsx       eax,al
 0062E98C    mov         dword ptr [esp+8],eax
 0062E990    fild        dword ptr [esp+8]
 0062E994    fstp        qword ptr [esp]
 0062E997    wait
>0062E998    jmp         0062F1CB
 0062E99D    cmp         byte ptr [esi+42F],17;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E9A4    sete        al
 0062E9A7    movsx       eax,al
 0062E9AA    mov         dword ptr [esp+8],eax
 0062E9AE    fild        dword ptr [esp+8]
 0062E9B2    fstp        qword ptr [esp]
 0062E9B5    wait
>0062E9B6    jmp         0062F1CB
 0062E9BB    cmp         byte ptr [esi+42F],18;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E9C2    sete        al
 0062E9C5    movsx       eax,al
 0062E9C8    mov         dword ptr [esp+8],eax
 0062E9CC    fild        dword ptr [esp+8]
 0062E9D0    fstp        qword ptr [esp]
 0062E9D3    wait
>0062E9D4    jmp         0062F1CB
 0062E9D9    cmp         byte ptr [esi+42F],19;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E9E0    sete        al
 0062E9E3    movsx       eax,al
 0062E9E6    mov         dword ptr [esp+8],eax
 0062E9EA    fild        dword ptr [esp+8]
 0062E9EE    fstp        qword ptr [esp]
 0062E9F1    wait
>0062E9F2    jmp         0062F1CB
 0062E9F7    cmp         byte ptr [esi+42F],1B;TSixaxisObject.PartialGesture:TWaggleGesture
 0062E9FE    sete        al
 0062EA01    movsx       eax,al
 0062EA04    mov         dword ptr [esp+8],eax
 0062EA08    fild        dword ptr [esp+8]
 0062EA0C    fstp        qword ptr [esp]
 0062EA0F    wait
>0062EA10    jmp         0062F1CB
 0062EA15    cmp         byte ptr [esi+42F],1C;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EA1C    sete        al
 0062EA1F    movsx       eax,al
 0062EA22    mov         dword ptr [esp+8],eax
 0062EA26    fild        dword ptr [esp+8]
 0062EA2A    fstp        qword ptr [esp]
 0062EA2D    wait
>0062EA2E    jmp         0062F1CB
 0062EA33    cmp         byte ptr [esi+42F],1A;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EA3A    sete        al
 0062EA3D    movsx       eax,al
 0062EA40    mov         dword ptr [esp+8],eax
 0062EA44    fild        dword ptr [esp+8]
 0062EA48    fstp        qword ptr [esp]
 0062EA4B    wait
>0062EA4C    jmp         0062F1CB
 0062EA51    cmp         byte ptr [esi+42F],1D;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EA58    sete        al
 0062EA5B    movsx       eax,al
 0062EA5E    mov         dword ptr [esp+8],eax
 0062EA62    fild        dword ptr [esp+8]
 0062EA66    fstp        qword ptr [esp]
 0062EA69    wait
>0062EA6A    jmp         0062F1CB
 0062EA6F    cmp         byte ptr [esi+42F],1E;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EA76    sete        al
 0062EA79    movsx       eax,al
 0062EA7C    mov         dword ptr [esp+8],eax
 0062EA80    fild        dword ptr [esp+8]
 0062EA84    fstp        qword ptr [esp]
 0062EA87    wait
>0062EA88    jmp         0062F1CB
 0062EA8D    cmp         byte ptr [esi+42F],1F;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EA94    sete        al
 0062EA97    movsx       eax,al
 0062EA9A    mov         dword ptr [esp+8],eax
 0062EA9E    fild        dword ptr [esp+8]
 0062EAA2    fstp        qword ptr [esp]
 0062EAA5    wait
>0062EAA6    jmp         0062F1CB
 0062EAAB    cmp         byte ptr [esi+42F],21;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EAB2    sete        al
 0062EAB5    movsx       eax,al
 0062EAB8    mov         dword ptr [esp+8],eax
 0062EABC    fild        dword ptr [esp+8]
 0062EAC0    fstp        qword ptr [esp]
 0062EAC3    wait
>0062EAC4    jmp         0062F1CB
 0062EAC9    cmp         byte ptr [esi+42F],22;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EAD0    sete        al
 0062EAD3    movsx       eax,al
 0062EAD6    mov         dword ptr [esp+8],eax
 0062EADA    fild        dword ptr [esp+8]
 0062EADE    fstp        qword ptr [esp]
 0062EAE1    wait
>0062EAE2    jmp         0062F1CB
 0062EAE7    cmp         byte ptr [esi+42F],20;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EAEE    sete        al
 0062EAF1    movsx       eax,al
 0062EAF4    mov         dword ptr [esp+8],eax
 0062EAF8    fild        dword ptr [esp+8]
 0062EAFC    fstp        qword ptr [esp]
 0062EAFF    wait
>0062EB00    jmp         0062F1CB
 0062EB05    cmp         byte ptr [esi+42F],28;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EB0C    sete        al
 0062EB0F    movsx       eax,al
 0062EB12    mov         dword ptr [esp+8],eax
 0062EB16    fild        dword ptr [esp+8]
 0062EB1A    fstp        qword ptr [esp]
 0062EB1D    wait
>0062EB1E    jmp         0062F1CB
 0062EB23    cmp         byte ptr [esi+42F],29;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EB2A    sete        al
 0062EB2D    movsx       eax,al
 0062EB30    mov         dword ptr [esp+8],eax
 0062EB34    fild        dword ptr [esp+8]
 0062EB38    fstp        qword ptr [esp]
 0062EB3B    wait
>0062EB3C    jmp         0062F1CB
 0062EB41    cmp         byte ptr [esi+42F],2A;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EB48    sete        al
 0062EB4B    movsx       eax,al
 0062EB4E    mov         dword ptr [esp+8],eax
 0062EB52    fild        dword ptr [esp+8]
 0062EB56    fstp        qword ptr [esp]
 0062EB59    wait
>0062EB5A    jmp         0062F1CB
 0062EB5F    cmp         byte ptr [esi+42F],2C;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EB66    sete        al
 0062EB69    movsx       eax,al
 0062EB6C    mov         dword ptr [esp+8],eax
 0062EB70    fild        dword ptr [esp+8]
 0062EB74    fstp        qword ptr [esp]
 0062EB77    wait
>0062EB78    jmp         0062F1CB
 0062EB7D    cmp         byte ptr [esi+42F],2D;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EB84    sete        al
 0062EB87    movsx       eax,al
 0062EB8A    mov         dword ptr [esp+8],eax
 0062EB8E    fild        dword ptr [esp+8]
 0062EB92    fstp        qword ptr [esp]
 0062EB95    wait
>0062EB96    jmp         0062F1CB
 0062EB9B    cmp         byte ptr [esi+42F],2B;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EBA2    sete        al
 0062EBA5    movsx       eax,al
 0062EBA8    mov         dword ptr [esp+8],eax
 0062EBAC    fild        dword ptr [esp+8]
 0062EBB0    fstp        qword ptr [esp]
 0062EBB3    wait
>0062EBB4    jmp         0062F1CB
 0062EBB9    cmp         byte ptr [esi+42F],2E;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EBC0    sete        al
 0062EBC3    movsx       eax,al
 0062EBC6    mov         dword ptr [esp+8],eax
 0062EBCA    fild        dword ptr [esp+8]
 0062EBCE    fstp        qword ptr [esp]
 0062EBD1    wait
>0062EBD2    jmp         0062F1CB
 0062EBD7    cmp         byte ptr [esi+42F],2F;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EBDE    sete        al
 0062EBE1    movsx       eax,al
 0062EBE4    mov         dword ptr [esp+8],eax
 0062EBE8    fild        dword ptr [esp+8]
 0062EBEC    fstp        qword ptr [esp]
 0062EBEF    wait
>0062EBF0    jmp         0062F1CB
 0062EBF5    cmp         byte ptr [esi+42F],30;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EBFC    sete        al
 0062EBFF    movsx       eax,al
 0062EC02    mov         dword ptr [esp+8],eax
 0062EC06    fild        dword ptr [esp+8]
 0062EC0A    fstp        qword ptr [esp]
 0062EC0D    wait
>0062EC0E    jmp         0062F1CB
 0062EC13    cmp         byte ptr [esi+42F],32;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EC1A    sete        al
 0062EC1D    movsx       eax,al
 0062EC20    mov         dword ptr [esp+8],eax
 0062EC24    fild        dword ptr [esp+8]
 0062EC28    fstp        qword ptr [esp]
 0062EC2B    wait
>0062EC2C    jmp         0062F1CB
 0062EC31    cmp         byte ptr [esi+42F],33;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EC38    sete        al
 0062EC3B    movsx       eax,al
 0062EC3E    mov         dword ptr [esp+8],eax
 0062EC42    fild        dword ptr [esp+8]
 0062EC46    fstp        qword ptr [esp]
 0062EC49    wait
>0062EC4A    jmp         0062F1CB
 0062EC4F    cmp         byte ptr [esi+42F],31;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EC56    sete        al
 0062EC59    movsx       eax,al
 0062EC5C    mov         dword ptr [esp+8],eax
 0062EC60    fild        dword ptr [esp+8]
 0062EC64    fstp        qword ptr [esp]
 0062EC67    wait
>0062EC68    jmp         0062F1CB
 0062EC6D    cmp         byte ptr [esi+42F],39;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EC74    sete        al
 0062EC77    movsx       eax,al
 0062EC7A    mov         dword ptr [esp+8],eax
 0062EC7E    fild        dword ptr [esp+8]
 0062EC82    fstp        qword ptr [esp]
 0062EC85    wait
>0062EC86    jmp         0062F1CB
 0062EC8B    cmp         byte ptr [esi+42F],3A;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EC92    sete        al
 0062EC95    movsx       eax,al
 0062EC98    mov         dword ptr [esp+8],eax
 0062EC9C    fild        dword ptr [esp+8]
 0062ECA0    fstp        qword ptr [esp]
 0062ECA3    wait
>0062ECA4    jmp         0062F1CB
 0062ECA9    cmp         byte ptr [esi+42F],3B;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ECB0    sete        al
 0062ECB3    movsx       eax,al
 0062ECB6    mov         dword ptr [esp+8],eax
 0062ECBA    fild        dword ptr [esp+8]
 0062ECBE    fstp        qword ptr [esp]
 0062ECC1    wait
>0062ECC2    jmp         0062F1CB
 0062ECC7    cmp         byte ptr [esi+42F],3D;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ECCE    sete        al
 0062ECD1    movsx       eax,al
 0062ECD4    mov         dword ptr [esp+8],eax
 0062ECD8    fild        dword ptr [esp+8]
 0062ECDC    fstp        qword ptr [esp]
 0062ECDF    wait
>0062ECE0    jmp         0062F1CB
 0062ECE5    cmp         byte ptr [esi+42F],3E;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ECEC    sete        al
 0062ECEF    movsx       eax,al
 0062ECF2    mov         dword ptr [esp+8],eax
 0062ECF6    fild        dword ptr [esp+8]
 0062ECFA    fstp        qword ptr [esp]
 0062ECFD    wait
>0062ECFE    jmp         0062F1CB
 0062ED03    cmp         byte ptr [esi+42F],3C;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ED0A    sete        al
 0062ED0D    movsx       eax,al
 0062ED10    mov         dword ptr [esp+8],eax
 0062ED14    fild        dword ptr [esp+8]
 0062ED18    fstp        qword ptr [esp]
 0062ED1B    wait
>0062ED1C    jmp         0062F1CB
 0062ED21    cmp         byte ptr [esi+42F],3F;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ED28    sete        al
 0062ED2B    movsx       eax,al
 0062ED2E    mov         dword ptr [esp+8],eax
 0062ED32    fild        dword ptr [esp+8]
 0062ED36    fstp        qword ptr [esp]
 0062ED39    wait
>0062ED3A    jmp         0062F1CB
 0062ED3F    cmp         byte ptr [esi+42F],40;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ED46    sete        al
 0062ED49    movsx       eax,al
 0062ED4C    mov         dword ptr [esp+8],eax
 0062ED50    fild        dword ptr [esp+8]
 0062ED54    fstp        qword ptr [esp]
 0062ED57    wait
>0062ED58    jmp         0062F1CB
 0062ED5D    cmp         byte ptr [esi+42F],41;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ED64    sete        al
 0062ED67    movsx       eax,al
 0062ED6A    mov         dword ptr [esp+8],eax
 0062ED6E    fild        dword ptr [esp+8]
 0062ED72    fstp        qword ptr [esp]
 0062ED75    wait
>0062ED76    jmp         0062F1CB
 0062ED7B    cmp         byte ptr [esi+42F],43;TSixaxisObject.PartialGesture:TWaggleGesture
 0062ED82    sete        al
 0062ED85    movsx       eax,al
 0062ED88    mov         dword ptr [esp+8],eax
 0062ED8C    fild        dword ptr [esp+8]
 0062ED90    fstp        qword ptr [esp]
 0062ED93    wait
>0062ED94    jmp         0062F1CB
 0062ED99    cmp         byte ptr [esi+42F],44;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EDA0    sete        al
 0062EDA3    movsx       eax,al
 0062EDA6    mov         dword ptr [esp+8],eax
 0062EDAA    fild        dword ptr [esp+8]
 0062EDAE    fstp        qword ptr [esp]
 0062EDB1    wait
>0062EDB2    jmp         0062F1CB
 0062EDB7    cmp         byte ptr [esi+42F],42;TSixaxisObject.PartialGesture:TWaggleGesture
 0062EDBE    sete        al
 0062EDC1    movsx       eax,al
 0062EDC4    mov         dword ptr [esp+8],eax
 0062EDC8    fild        dword ptr [esp+8]
 0062EDCC    fstp        qword ptr [esp]
 0062EDCF    wait
>0062EDD0    jmp         0062F1CB
 0062EDD5    cmp         byte ptr [esi+42D],6;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EDDC    sete        al
 0062EDDF    movsx       eax,al
 0062EDE2    mov         dword ptr [esp+8],eax
 0062EDE6    fild        dword ptr [esp+8]
 0062EDEA    fstp        qword ptr [esp]
 0062EDED    wait
>0062EDEE    jmp         0062F1CB
 0062EDF3    cmp         byte ptr [esi+42D],7;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EDFA    sete        al
 0062EDFD    movsx       eax,al
 0062EE00    mov         dword ptr [esp+8],eax
 0062EE04    fild        dword ptr [esp+8]
 0062EE08    fstp        qword ptr [esp]
 0062EE0B    wait
>0062EE0C    jmp         0062F1CB
 0062EE11    cmp         byte ptr [esi+42D],8;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EE18    sete        al
 0062EE1B    movsx       eax,al
 0062EE1E    mov         dword ptr [esp+8],eax
 0062EE22    fild        dword ptr [esp+8]
 0062EE26    fstp        qword ptr [esp]
 0062EE29    wait
>0062EE2A    jmp         0062F1CB
 0062EE2F    cmp         byte ptr [esi+42D],0A;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EE36    sete        al
 0062EE39    movsx       eax,al
 0062EE3C    mov         dword ptr [esp+8],eax
 0062EE40    fild        dword ptr [esp+8]
 0062EE44    fstp        qword ptr [esp]
 0062EE47    wait
>0062EE48    jmp         0062F1CB
 0062EE4D    cmp         byte ptr [esi+42D],0C;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EE54    sete        al
 0062EE57    movsx       eax,al
 0062EE5A    mov         dword ptr [esp+8],eax
 0062EE5E    fild        dword ptr [esp+8]
 0062EE62    fstp        qword ptr [esp]
 0062EE65    wait
>0062EE66    jmp         0062F1CB
 0062EE6B    cmp         byte ptr [esi+42D],0D;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EE72    sete        al
 0062EE75    movsx       eax,al
 0062EE78    mov         dword ptr [esp+8],eax
 0062EE7C    fild        dword ptr [esp+8]
 0062EE80    fstp        qword ptr [esp]
 0062EE83    wait
>0062EE84    jmp         0062F1CB
 0062EE89    cmp         byte ptr [esi+42D],0E;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EE90    sete        al
 0062EE93    movsx       eax,al
 0062EE96    mov         dword ptr [esp+8],eax
 0062EE9A    fild        dword ptr [esp+8]
 0062EE9E    fstp        qword ptr [esp]
 0062EEA1    wait
>0062EEA2    jmp         0062F1CB
 0062EEA7    cmp         byte ptr [esi+42D],10;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EEAE    sete        al
 0062EEB1    movsx       eax,al
 0062EEB4    mov         dword ptr [esp+8],eax
 0062EEB8    fild        dword ptr [esp+8]
 0062EEBC    fstp        qword ptr [esp]
 0062EEBF    wait
>0062EEC0    jmp         0062F1CB
 0062EEC5    cmp         byte ptr [esi+42D],17;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EECC    sete        al
 0062EECF    movsx       eax,al
 0062EED2    mov         dword ptr [esp+8],eax
 0062EED6    fild        dword ptr [esp+8]
 0062EEDA    fstp        qword ptr [esp]
 0062EEDD    wait
>0062EEDE    jmp         0062F1CB
 0062EEE3    cmp         byte ptr [esi+42D],18;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EEEA    sete        al
 0062EEED    movsx       eax,al
 0062EEF0    mov         dword ptr [esp+8],eax
 0062EEF4    fild        dword ptr [esp+8]
 0062EEF8    fstp        qword ptr [esp]
 0062EEFB    wait
>0062EEFC    jmp         0062F1CB
 0062EF01    cmp         byte ptr [esi+42D],19;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EF08    sete        al
 0062EF0B    movsx       eax,al
 0062EF0E    mov         dword ptr [esp+8],eax
 0062EF12    fild        dword ptr [esp+8]
 0062EF16    fstp        qword ptr [esp]
 0062EF19    wait
>0062EF1A    jmp         0062F1CB
 0062EF1F    cmp         byte ptr [esi+42D],1B;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EF26    sete        al
 0062EF29    movsx       eax,al
 0062EF2C    mov         dword ptr [esp+8],eax
 0062EF30    fild        dword ptr [esp+8]
 0062EF34    fstp        qword ptr [esp]
 0062EF37    wait
>0062EF38    jmp         0062F1CB
 0062EF3D    cmp         byte ptr [esi+42D],1D;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EF44    sete        al
 0062EF47    movsx       eax,al
 0062EF4A    mov         dword ptr [esp+8],eax
 0062EF4E    fild        dword ptr [esp+8]
 0062EF52    fstp        qword ptr [esp]
 0062EF55    wait
>0062EF56    jmp         0062F1CB
 0062EF5B    cmp         byte ptr [esi+42D],1E;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EF62    sete        al
 0062EF65    movsx       eax,al
 0062EF68    mov         dword ptr [esp+8],eax
 0062EF6C    fild        dword ptr [esp+8]
 0062EF70    fstp        qword ptr [esp]
 0062EF73    wait
>0062EF74    jmp         0062F1CB
 0062EF79    cmp         byte ptr [esi+42D],1F;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EF80    sete        al
 0062EF83    movsx       eax,al
 0062EF86    mov         dword ptr [esp+8],eax
 0062EF8A    fild        dword ptr [esp+8]
 0062EF8E    fstp        qword ptr [esp]
 0062EF91    wait
>0062EF92    jmp         0062F1CB
 0062EF97    cmp         byte ptr [esi+42D],21;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EF9E    sete        al
 0062EFA1    movsx       eax,al
 0062EFA4    mov         dword ptr [esp+8],eax
 0062EFA8    fild        dword ptr [esp+8]
 0062EFAC    fstp        qword ptr [esp]
 0062EFAF    wait
>0062EFB0    jmp         0062F1CB
 0062EFB5    cmp         byte ptr [esi+42D],28;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EFBC    sete        al
 0062EFBF    movsx       eax,al
 0062EFC2    mov         dword ptr [esp+8],eax
 0062EFC6    fild        dword ptr [esp+8]
 0062EFCA    fstp        qword ptr [esp]
 0062EFCD    wait
>0062EFCE    jmp         0062F1CB
 0062EFD3    cmp         byte ptr [esi+42D],29;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EFDA    sete        al
 0062EFDD    movsx       eax,al
 0062EFE0    mov         dword ptr [esp+8],eax
 0062EFE4    fild        dword ptr [esp+8]
 0062EFE8    fstp        qword ptr [esp]
 0062EFEB    wait
>0062EFEC    jmp         0062F1CB
 0062EFF1    cmp         byte ptr [esi+42D],2A;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062EFF8    sete        al
 0062EFFB    movsx       eax,al
 0062EFFE    mov         dword ptr [esp+8],eax
 0062F002    fild        dword ptr [esp+8]
 0062F006    fstp        qword ptr [esp]
 0062F009    wait
>0062F00A    jmp         0062F1CB
 0062F00F    cmp         byte ptr [esi+42D],2C;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F016    sete        al
 0062F019    movsx       eax,al
 0062F01C    mov         dword ptr [esp+8],eax
 0062F020    fild        dword ptr [esp+8]
 0062F024    fstp        qword ptr [esp]
 0062F027    wait
>0062F028    jmp         0062F1CB
 0062F02D    cmp         byte ptr [esi+42D],2E;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F034    sete        al
 0062F037    movsx       eax,al
 0062F03A    mov         dword ptr [esp+8],eax
 0062F03E    fild        dword ptr [esp+8]
 0062F042    fstp        qword ptr [esp]
 0062F045    wait
>0062F046    jmp         0062F1CB
 0062F04B    cmp         byte ptr [esi+42D],2F;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F052    sete        al
 0062F055    movsx       eax,al
 0062F058    mov         dword ptr [esp+8],eax
 0062F05C    fild        dword ptr [esp+8]
 0062F060    fstp        qword ptr [esp]
 0062F063    wait
>0062F064    jmp         0062F1CB
 0062F069    cmp         byte ptr [esi+42D],30;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F070    sete        al
 0062F073    movsx       eax,al
 0062F076    mov         dword ptr [esp+8],eax
 0062F07A    fild        dword ptr [esp+8]
 0062F07E    fstp        qword ptr [esp]
 0062F081    wait
>0062F082    jmp         0062F1CB
 0062F087    cmp         byte ptr [esi+42D],32;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F08E    sete        al
 0062F091    movsx       eax,al
 0062F094    mov         dword ptr [esp+8],eax
 0062F098    fild        dword ptr [esp+8]
 0062F09C    fstp        qword ptr [esp]
 0062F09F    wait
>0062F0A0    jmp         0062F1CB
 0062F0A5    cmp         byte ptr [esi+42D],39;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F0AC    sete        al
 0062F0AF    movsx       eax,al
 0062F0B2    mov         dword ptr [esp+8],eax
 0062F0B6    fild        dword ptr [esp+8]
 0062F0BA    fstp        qword ptr [esp]
 0062F0BD    wait
>0062F0BE    jmp         0062F1CB
 0062F0C3    cmp         byte ptr [esi+42D],3A;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F0CA    sete        al
 0062F0CD    movsx       eax,al
 0062F0D0    mov         dword ptr [esp+8],eax
 0062F0D4    fild        dword ptr [esp+8]
 0062F0D8    fstp        qword ptr [esp]
 0062F0DB    wait
>0062F0DC    jmp         0062F1CB
 0062F0E1    cmp         byte ptr [esi+42D],3B;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F0E8    sete        al
 0062F0EB    movsx       eax,al
 0062F0EE    mov         dword ptr [esp+8],eax
 0062F0F2    fild        dword ptr [esp+8]
 0062F0F6    fstp        qword ptr [esp]
 0062F0F9    wait
>0062F0FA    jmp         0062F1CB
 0062F0FF    cmp         byte ptr [esi+42D],3D;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F106    sete        al
 0062F109    movsx       eax,al
 0062F10C    mov         dword ptr [esp+8],eax
 0062F110    fild        dword ptr [esp+8]
 0062F114    fstp        qword ptr [esp]
 0062F117    wait
>0062F118    jmp         0062F1CB
 0062F11D    cmp         byte ptr [esi+42D],3F;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F124    sete        al
 0062F127    movsx       eax,al
 0062F12A    mov         dword ptr [esp+8],eax
 0062F12E    fild        dword ptr [esp+8]
 0062F132    fstp        qword ptr [esp]
 0062F135    wait
>0062F136    jmp         0062F1CB
 0062F13B    cmp         byte ptr [esi+42D],40;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F142    sete        al
 0062F145    movsx       eax,al
 0062F148    mov         dword ptr [esp+8],eax
 0062F14C    fild        dword ptr [esp+8]
 0062F150    fstp        qword ptr [esp]
 0062F153    wait
>0062F154    jmp         0062F1CB
 0062F156    cmp         byte ptr [esi+42D],41;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F15D    sete        al
 0062F160    movsx       eax,al
 0062F163    mov         dword ptr [esp+8],eax
 0062F167    fild        dword ptr [esp+8]
 0062F16B    fstp        qword ptr [esp]
 0062F16E    wait
>0062F16F    jmp         0062F1CB
 0062F171    cmp         byte ptr [esi+42D],43;TSixaxisObject.WaggleGesture:TWaggleGesture
 0062F178    sete        al
 0062F17B    movsx       eax,al
 0062F17E    mov         dword ptr [esp+8],eax
 0062F182    fild        dword ptr [esp+8]
 0062F186    fstp        qword ptr [esp]
 0062F189    wait
>0062F18A    jmp         0062F1CB
 0062F18C    cmp         byte ptr [esi+42F],46;TSixaxisObject.PartialGesture:TWaggleGesture
 0062F193    sete        al
 0062F196    movsx       eax,al
 0062F199    mov         dword ptr [esp+8],eax
 0062F19D    fild        dword ptr [esp+8]
 0062F1A1    fstp        qword ptr [esp]
 0062F1A4    wait
>0062F1A5    jmp         0062F1CB
 0062F1A7    cmp         byte ptr [esi+42F],45;TSixaxisObject.PartialGesture:TWaggleGesture
 0062F1AE    sete        al
 0062F1B1    movsx       eax,al
 0062F1B4    mov         dword ptr [esp+8],eax
 0062F1B8    fild        dword ptr [esp+8]
 0062F1BC    fstp        qword ptr [esp]
 0062F1BF    wait
>0062F1C0    jmp         0062F1CB
 0062F1C2    xor         eax,eax
 0062F1C4    mov         dword ptr [esp],eax
 0062F1C7    mov         dword ptr [esp+4],eax
 0062F1CB    fld         qword ptr [esp]
 0062F1CE    add         esp,0C
 0062F1D1    pop         edi
 0062F1D2    pop         esi
 0062F1D3    pop         ebx
 0062F1D4    ret
*}
end;

//0062F1D8
procedure TSixAxisValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0062F1D8    push        ebp
 0062F1D9    mov         ebp,esp
 0062F1DB    push        ecx
 0062F1DC    push        ebx
 0062F1DD    push        esi
 0062F1DE    push        edi
 0062F1DF    mov         dword ptr [ebp-4],ecx
 0062F1E2    mov         edi,edx
 0062F1E4    mov         esi,eax
 0062F1E6    call        0074BF10
 0062F1EB    mov         edx,dword ptr [esi+18];TSixAxisValue.......................................................
 0062F1EE    call        TWiimoteManager.GetSixaxis
 0062F1F3    mov         ebx,eax
 0062F1F5    test        ebx,ebx
>0062F1F7    jne         0062F21F
 0062F1F9    cmp         dword ptr [esi+20],29;TSixAxisValue........................................................
>0062F1FD    je          0062F21F
 0062F1FF    xor         eax,eax
 0062F201    mov         dword ptr [edi],eax
 0062F203    mov         dword ptr [edi+4],eax
 0062F206    mov         eax,dword ptr [ebp-4]
 0062F209    xor         edx,edx
 0062F20B    mov         dword ptr [eax],edx
 0062F20D    mov         dword ptr [eax+4],edx
 0062F210    mov         eax,dword ptr [ebp+8]
 0062F213    xor         edx,edx
 0062F215    mov         dword ptr [eax],edx
 0062F217    mov         dword ptr [eax+4],edx
>0062F21A    jmp         0062F441
 0062F21F    mov         eax,dword ptr [esi+20];TSixAxisValue.......................................................
 0062F222    cmp         eax,33
>0062F225    jg          0062F254
>0062F227    je          0062F2B7
 0062F22D    add         eax,0FFFFFFD2
 0062F230    cmp         eax,4
>0062F233    ja          0062F431
 0062F239    jmp         dword ptr [eax*4+62F240]
 0062F239    dd          0062F279
 0062F239    dd          0062F309
 0062F239    dd          0062F347
 0062F239    dd          0062F396
 0062F239    dd          0062F2E0
 0062F254    sub         eax,34
>0062F257    je          0062F3E2
 0062F25D    sub         eax,39
>0062F260    je          0062F36D
 0062F266    dec         eax
>0062F267    je          0062F3BC
 0062F26D    dec         eax
>0062F26E    je          0062F40B
>0062F274    jmp         0062F431
 0062F279    mov         eax,dword ptr [ebx+338];TSixaxisObject.gx:Double
 0062F27F    mov         dword ptr [edi],eax
 0062F281    mov         eax,dword ptr [ebx+33C];TSixaxisObject.?f33C:dword
 0062F287    mov         dword ptr [edi+4],eax
 0062F28A    mov         eax,dword ptr [ebp-4]
 0062F28D    mov         edx,dword ptr [ebx+340];TSixaxisObject.gy:Double
 0062F293    mov         dword ptr [eax],edx
 0062F295    mov         edx,dword ptr [ebx+344];TSixaxisObject.?f344:dword
 0062F29B    mov         dword ptr [eax+4],edx
 0062F29E    mov         eax,dword ptr [ebp+8]
 0062F2A1    mov         edx,dword ptr [ebx+348];TSixaxisObject.gz:Double
 0062F2A7    mov         dword ptr [eax],edx
 0062F2A9    mov         edx,dword ptr [ebx+34C];TSixaxisObject.?f34C:dword
 0062F2AF    mov         dword ptr [eax+4],edx
>0062F2B2    jmp         0062F441
 0062F2B7    mov         eax,ebx
 0062F2B9    call        TAccelerometerObject.RawAccX
 0062F2BE    fstp        qword ptr [edi]
 0062F2C0    wait
 0062F2C1    mov         eax,ebx
 0062F2C3    call        TAccelerometerObject.RawAccY
 0062F2C8    mov         eax,dword ptr [ebp-4]
 0062F2CB    fstp        qword ptr [eax]
 0062F2CD    wait
 0062F2CE    mov         eax,ebx
 0062F2D0    call        TAccelerometerObject.RawAccZ
 0062F2D5    mov         eax,dword ptr [ebp+8]
 0062F2D8    fstp        qword ptr [eax]
 0062F2DA    wait
>0062F2DB    jmp         0062F441
 0062F2E0    mov         eax,ebx
 0062F2E2    call        TAccelerometerObject.RelAccX
 0062F2E7    fstp        qword ptr [edi]
 0062F2E9    wait
 0062F2EA    mov         eax,ebx
 0062F2EC    call        TAccelerometerObject.RelAccY
 0062F2F1    mov         eax,dword ptr [ebp-4]
 0062F2F4    fstp        qword ptr [eax]
 0062F2F6    wait
 0062F2F7    mov         eax,ebx
 0062F2F9    call        TAccelerometerObject.RelAccZ
 0062F2FE    mov         eax,dword ptr [ebp+8]
 0062F301    fstp        qword ptr [eax]
 0062F303    wait
>0062F304    jmp         0062F441
 0062F309    mov         eax,dword ptr [ebx+248];TSixaxisObject.RawForceX:Double
 0062F30F    mov         dword ptr [edi],eax
 0062F311    mov         eax,dword ptr [ebx+24C];TSixaxisObject.?f24C:dword
 0062F317    mov         dword ptr [edi+4],eax
 0062F31A    mov         eax,dword ptr [ebp-4]
 0062F31D    mov         edx,dword ptr [ebx+250];TSixaxisObject.RawForceY:Double
 0062F323    mov         dword ptr [eax],edx
 0062F325    mov         edx,dword ptr [ebx+254];TSixaxisObject.?f254:dword
 0062F32B    mov         dword ptr [eax+4],edx
 0062F32E    mov         eax,dword ptr [ebp+8]
 0062F331    mov         edx,dword ptr [ebx+258];TSixaxisObject.RawForceZ:Double
 0062F337    mov         dword ptr [eax],edx
 0062F339    mov         edx,dword ptr [ebx+25C];TSixaxisObject.?f25C:dword
 0062F33F    mov         dword ptr [eax+4],edx
>0062F342    jmp         0062F441
 0062F347    mov         eax,ebx
 0062F349    call        TPS3ControllerObject.LeftStickX
 0062F34E    fstp        qword ptr [edi]
 0062F350    wait
 0062F351    mov         eax,ebx
 0062F353    call        TPS3ControllerObject.LeftStickY
 0062F358    mov         eax,dword ptr [ebp-4]
 0062F35B    fstp        qword ptr [eax]
 0062F35D    wait
 0062F35E    mov         eax,dword ptr [ebp+8]
 0062F361    xor         edx,edx
 0062F363    mov         dword ptr [eax],edx
 0062F365    mov         dword ptr [eax+4],edx
>0062F368    jmp         0062F441
 0062F36D    mov         eax,ebx
 0062F36F    call        TPS3ControllerObject.LeftStick3DX
 0062F374    fstp        qword ptr [edi]
 0062F376    wait
 0062F377    mov         eax,ebx
 0062F379    call        TPS3ControllerObject.LeftStick3DY
 0062F37E    mov         eax,dword ptr [ebp-4]
 0062F381    fstp        qword ptr [eax]
 0062F383    wait
 0062F384    mov         eax,ebx
 0062F386    call        TPS3ControllerObject.LeftStick3DZ
 0062F38B    mov         eax,dword ptr [ebp+8]
 0062F38E    fstp        qword ptr [eax]
 0062F390    wait
>0062F391    jmp         0062F441
 0062F396    mov         eax,ebx
 0062F398    call        TPS3ControllerObject.RightStickX
 0062F39D    fstp        qword ptr [edi]
 0062F39F    wait
 0062F3A0    mov         eax,ebx
 0062F3A2    call        TPS3ControllerObject.RightStickY
 0062F3A7    mov         eax,dword ptr [ebp-4]
 0062F3AA    fstp        qword ptr [eax]
 0062F3AC    wait
 0062F3AD    mov         eax,dword ptr [ebp+8]
 0062F3B0    xor         edx,edx
 0062F3B2    mov         dword ptr [eax],edx
 0062F3B4    mov         dword ptr [eax+4],edx
>0062F3B7    jmp         0062F441
 0062F3BC    mov         eax,ebx
 0062F3BE    call        TPS3ControllerObject.RightStick3DX
 0062F3C3    fstp        qword ptr [edi]
 0062F3C5    wait
 0062F3C6    mov         eax,ebx
 0062F3C8    call        TPS3ControllerObject.RightStick3DY
 0062F3CD    mov         eax,dword ptr [ebp-4]
 0062F3D0    fstp        qword ptr [eax]
 0062F3D2    wait
 0062F3D3    mov         eax,ebx
 0062F3D5    call        TPS3ControllerObject.RightStick3DZ
 0062F3DA    mov         eax,dword ptr [ebp+8]
 0062F3DD    fstp        qword ptr [eax]
 0062F3DF    wait
>0062F3E0    jmp         0062F441
 0062F3E2    mov         eax,ebx
 0062F3E4    mov         edx,dword ptr [eax]
 0062F3E6    call        dword ptr [edx+88];TPS3ControllerObject.DPadX
 0062F3EC    fstp        qword ptr [edi]
 0062F3EE    wait
 0062F3EF    mov         eax,ebx
 0062F3F1    mov         edx,dword ptr [eax]
 0062F3F3    call        dword ptr [edx+8C];TPS3ControllerObject.DPadY
 0062F3F9    mov         eax,dword ptr [ebp-4]
 0062F3FC    fstp        qword ptr [eax]
 0062F3FE    wait
 0062F3FF    mov         eax,dword ptr [ebp+8]
 0062F402    xor         edx,edx
 0062F404    mov         dword ptr [eax],edx
 0062F406    mov         dword ptr [eax+4],edx
>0062F409    jmp         0062F441
 0062F40B    mov         eax,ebx
 0062F40D    call        TPS3ControllerObject.DPad3DX
 0062F412    fstp        qword ptr [edi]
 0062F414    wait
 0062F415    mov         eax,ebx
 0062F417    call        TPS3ControllerObject.DPad3DY
 0062F41C    mov         eax,dword ptr [ebp-4]
 0062F41F    fstp        qword ptr [eax]
 0062F421    wait
 0062F422    mov         eax,ebx
 0062F424    call        TPS3ControllerObject.DPad3DZ
 0062F429    mov         eax,dword ptr [ebp+8]
 0062F42C    fstp        qword ptr [eax]
 0062F42E    wait
>0062F42F    jmp         0062F441
 0062F431    mov         eax,dword ptr [ebp+8]
 0062F434    push        eax
 0062F435    mov         ecx,dword ptr [ebp-4]
 0062F438    mov         edx,edi
 0062F43A    mov         eax,esi
 0062F43C    call        TExpression.GetVector
 0062F441    pop         edi
 0062F442    pop         esi
 0062F443    pop         ebx
 0062F444    pop         ecx
 0062F445    pop         ebp
 0062F446    ret         4
*}
end;

//0062F44C
function TSixAxisValue.Module:TObject;
begin
{*
 0062F44C    mov         eax,[0081ECAC];gvar_0081ECAC:TModuleSixaxis
 0062F451    ret
*}
end;

//0062F454
function TSixAxisValue.SetString(NewValue:string):Boolean;
begin
{*
 0062F454    push        ebp
 0062F455    mov         ebp,esp
 0062F457    add         esp,0FFFFFFF0
 0062F45A    push        ebx
 0062F45B    push        esi
 0062F45C    mov         dword ptr [ebp-4],edx
 0062F45F    mov         esi,eax
 0062F461    mov         eax,dword ptr [ebp-4]
 0062F464    call        @UStrAddRef
 0062F469    xor         eax,eax
 0062F46B    push        ebp
 0062F46C    push        62F61C
 0062F471    push        dword ptr fs:[eax]
 0062F474    mov         dword ptr fs:[eax],esp
 0062F477    mov         byte ptr [ebp-5],0
 0062F47B    call        0074BF10
 0062F480    mov         edx,dword ptr [esi+18];TSixAxisValue.......................................................
 0062F483    call        TWiimoteManager.GetSixaxis
 0062F488    mov         ebx,eax
 0062F48A    test        ebx,ebx
>0062F48C    jne         0062F498
 0062F48E    cmp         dword ptr [esi+20],29;TSixAxisValue........................................................
>0062F492    jne         0062F606
 0062F498    cmp         dword ptr [esi+20],2A;TSixAxisValue........................................................
>0062F49C    jne         0062F606
 0062F4A2    cmp         dword ptr [ebp-4],0
>0062F4A6    je          0062F4B7
 0062F4A8    mov         eax,dword ptr [ebp-4]
 0062F4AB    mov         edx,62F63C;'00:00:00:00:00:00'
 0062F4B0    call        @UStrEqual
>0062F4B5    jne         0062F4CB
 0062F4B7    lea         eax,[ebp-0D]
 0062F4BA    xor         ecx,ecx
 0062F4BC    mov         edx,8
 0062F4C1    call        @FillChar
>0062F4C6    jmp         0062F5B3
 0062F4CB    mov         eax,dword ptr [ebp-4]
 0062F4CE    test        eax,eax
>0062F4D0    je          0062F4D7
 0062F4D2    sub         eax,4
 0062F4D5    mov         eax,dword ptr [eax]
 0062F4D7    cmp         eax,11
>0062F4DA    jne         0062F606
 0062F4E0    mov         byte ptr [ebp-0D],1
 0062F4E4    mov         byte ptr [ebp-0C],0
 0062F4E8    mov         eax,dword ptr [ebp-4]
 0062F4EB    movzx       eax,word ptr [eax]
 0062F4EE    call        00629880
 0062F4F3    shl         eax,4
 0062F4F6    push        eax
 0062F4F7    mov         eax,dword ptr [ebp-4]
 0062F4FA    movzx       eax,word ptr [eax+2]
 0062F4FE    call        00629880
 0062F503    pop         edx
 0062F504    add         dl,al
 0062F506    mov         byte ptr [ebp-0B],dl
 0062F509    mov         eax,dword ptr [ebp-4]
 0062F50C    movzx       eax,word ptr [eax+6]
 0062F510    call        00629880
 0062F515    shl         eax,4
 0062F518    push        eax
 0062F519    mov         eax,dword ptr [ebp-4]
 0062F51C    movzx       eax,word ptr [eax+8]
 0062F520    call        00629880
 0062F525    pop         edx
 0062F526    add         dl,al
 0062F528    mov         byte ptr [ebp-0A],dl
 0062F52B    mov         eax,dword ptr [ebp-4]
 0062F52E    movzx       eax,word ptr [eax+0C]
 0062F532    call        00629880
 0062F537    shl         eax,4
 0062F53A    push        eax
 0062F53B    mov         eax,dword ptr [ebp-4]
 0062F53E    movzx       eax,word ptr [eax+0E]
 0062F542    call        00629880
 0062F547    pop         edx
 0062F548    add         dl,al
 0062F54A    mov         byte ptr [ebp-9],dl
 0062F54D    mov         eax,dword ptr [ebp-4]
 0062F550    movzx       eax,word ptr [eax+12]
 0062F554    call        00629880
 0062F559    shl         eax,4
 0062F55C    push        eax
 0062F55D    mov         eax,dword ptr [ebp-4]
 0062F560    movzx       eax,word ptr [eax+14]
 0062F564    call        00629880
 0062F569    pop         edx
 0062F56A    add         dl,al
 0062F56C    mov         byte ptr [ebp-8],dl
 0062F56F    mov         eax,dword ptr [ebp-4]
 0062F572    movzx       eax,word ptr [eax+18]
 0062F576    call        00629880
 0062F57B    shl         eax,4
 0062F57E    push        eax
 0062F57F    mov         eax,dword ptr [ebp-4]
 0062F582    movzx       eax,word ptr [eax+1A]
 0062F586    call        00629880
 0062F58B    pop         edx
 0062F58C    add         dl,al
 0062F58E    mov         byte ptr [ebp-7],dl
 0062F591    mov         eax,dword ptr [ebp-4]
 0062F594    movzx       eax,word ptr [eax+1E]
 0062F598    call        00629880
 0062F59D    shl         eax,4
 0062F5A0    push        eax
 0062F5A1    mov         eax,dword ptr [ebp-4]
 0062F5A4    movzx       eax,word ptr [eax+20]
 0062F5A8    call        00629880
 0062F5AD    pop         edx
 0062F5AE    add         dl,al
 0062F5B0    mov         byte ptr [ebp-6],dl
 0062F5B3    lea         eax,[ebp-0D]
 0062F5B6    mov         eax,dword ptr [eax]
 0062F5B8    lea         edx,[ebx+444];TSixaxisObject.FeatureF5:?
 0062F5BE    cmp         eax,dword ptr [edx]
>0062F5C0    jne         0062F5D1
 0062F5C2    lea         eax,[ebp-9]
 0062F5C5    mov         eax,dword ptr [eax]
 0062F5C7    lea         edx,[ebx+448];TSixaxisObject.?f448:byte
 0062F5CD    cmp         eax,dword ptr [edx]
>0062F5CF    je          0062F606
 0062F5D1    lea         eax,[ebp-0D]
 0062F5D4    mov         eax,dword ptr [eax]
 0062F5D6    movzx       edx,byte ptr [ebx+444];TSixaxisObject.FeatureF5:?
 0062F5DD    mov         dword ptr [edx],eax
 0062F5DF    lea         eax,[ebp-9]
 0062F5E2    mov         eax,dword ptr [eax]
 0062F5E4    movzx       edx,byte ptr [ebx+448];TSixaxisObject.?f448:byte
 0062F5EB    mov         dword ptr [edx],eax
 0062F5ED    lea         eax,[ebx+444];TSixaxisObject.FeatureF5:?
 0062F5F3    push        eax
 0062F5F4    push        8
 0062F5F6    mov         ecx,0F5
 0062F5FB    mov         edx,dword ptr [ebx+70];TSixaxisObject.itfnum:Integer
 0062F5FE    mov         eax,dword ptr [ebx+68];TSixaxisObject.devh:PUsb_dev_handle
 0062F601    call        0062C4A4
 0062F606    xor         eax,eax
 0062F608    pop         edx
 0062F609    pop         ecx
 0062F60A    pop         ecx
 0062F60B    mov         dword ptr fs:[eax],edx
 0062F60E    push        62F623
 0062F613    lea         eax,[ebp-4]
 0062F616    call        @UStrClr
 0062F61B    ret
>0062F61C    jmp         @HandleFinally
>0062F621    jmp         0062F613
 0062F623    movzx       eax,byte ptr [ebp-5]
 0062F627    pop         esi
 0062F628    pop         ebx
 0062F629    mov         esp,ebp
 0062F62B    pop         ebp
 0062F62C    ret
*}
end;

//0062F660
{*function TSixAxisValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0062F660    push        ebp
 0062F661    mov         ebp,esp
 0062F663    push        ebx
 0062F664    push        esi
 0062F665    mov         ebx,eax
 0062F667    call        0074BF10
 0062F66C    mov         edx,dword ptr [ebx+18];TSixAxisValue.......................................................
 0062F66F    call        TWiimoteManager.GetSixaxis
 0062F674    mov         esi,eax
 0062F676    test        esi,esi
>0062F678    jne         0062F687
 0062F67A    cmp         dword ptr [ebx+20],29;TSixAxisValue........................................................
>0062F67E    je          0062F687
 0062F680    xor         eax,eax
>0062F682    jmp         0062FAAB
 0062F687    mov         eax,dword ptr [ebx+20];TSixAxisValue.......................................................
 0062F68A    mov         edx,eax
 0062F68C    cmp         edx,6C
>0062F68F    jg          0062F73B
>0062F695    je          0062FA56
 0062F69B    cmp         edx,5A
>0062F69E    jge         0062F6E0
 0062F6A0    cmp         edx,48
>0062F6A3    jge         0062F6BD
 0062F6A5    dec         edx
>0062F6A6    je          0062F7EF
 0062F6AC    add         edx,0FFFFFFC1
 0062F6AF    sub         edx,8
>0062F6B2    jb          0062F89F
>0062F6B8    jmp         0062FAA9
 0062F6BD    add         edx,0FFFFFFB8
 0062F6C0    sub         edx,6
>0062F6C3    jb          0062F934
 0062F6C9    sub         edx,6
>0062F6CC    jb          0062F919
 0062F6D2    sub         edx,6
>0062F6D5    jb          0062F94F
>0062F6DB    jmp         0062FAA9
 0062F6E0    add         edx,0FFFFFFA6
 0062F6E3    cmp         edx,11
>0062F6E6    ja          0062FAA9
 0062F6EC    jmp         dword ptr [edx*4+62F6F3]
 0062F6EC    dd          0062F9A2
 0062F6EC    dd          0062F9A2
 0062F6EC    dd          0062F9A2
 0062F6EC    dd          0062F9A2
 0062F6EC    dd          0062F9A2
 0062F6EC    dd          0062F9A2
 0062F6EC    dd          0062F9F5
 0062F6EC    dd          0062F9F5
 0062F6EC    dd          0062F9F5
 0062F6EC    dd          0062F9F5
 0062F6EC    dd          0062F9F5
 0062F6EC    dd          0062F9F5
 0062F6EC    dd          0062F8C1
 0062F6EC    dd          0062F901
 0062F6EC    dd          0062FAA9
 0062F6EC    dd          0062FAA9
 0062F6EC    dd          0062FA45
 0062F6EC    dd          0062FA6C
 0062F73B    add         edx,0FFFFFF8E
 0062F73E    cmp         edx,0A
>0062F741    ja          0062FAA9
 0062F747    jmp         dword ptr [edx*4+62F74E]
 0062F747    dd          0062F8D9
 0062F747    dd          0062F8ED
 0062F747    dd          0062F88B
 0062F747    dd          0062FA93
 0062F747    dd          0062F77A
 0062F747    dd          0062F7C8
 0062F747    dd          0062F7A1
 0062F747    dd          0062F816
 0062F747    dd          0062F7EF
 0062F747    dd          0062F83D
 0062F747    dd          0062F864
 0062F77A    fld         qword ptr [ebp+8]
 0062F77D    call        @ROUND
 0062F782    mov         byte ptr [esi+44D],al
 0062F788    lea         edx,[esi+44C];TSixaxisObject.OutputReport:TSixAxisOutputReport
 0062F78E    mov         ecx,28
 0062F793    mov         eax,esi
 0062F795    call        TManagedHidObject.SendReport
 0062F79A    mov         al,1
>0062F79C    jmp         0062FAAB
 0062F7A1    fld         qword ptr [ebp+8]
 0062F7A4    call        @ROUND
 0062F7A9    mov         byte ptr [esi+44F],al
 0062F7AF    lea         edx,[esi+44C];TSixaxisObject.OutputReport:TSixAxisOutputReport
 0062F7B5    mov         ecx,28
 0062F7BA    mov         eax,esi
 0062F7BC    call        TManagedHidObject.SendReport
 0062F7C1    mov         al,1
>0062F7C3    jmp         0062FAAB
 0062F7C8    fld         qword ptr [ebp+8]
 0062F7CB    call        @ROUND
 0062F7D0    mov         byte ptr [esi+44E],al
 0062F7D6    lea         edx,[esi+44C];TSixaxisObject.OutputReport:TSixAxisOutputReport
 0062F7DC    mov         ecx,28
 0062F7E1    mov         eax,esi
 0062F7E3    call        TManagedHidObject.SendReport
 0062F7E8    mov         al,1
>0062F7EA    jmp         0062FAAB
 0062F7EF    fld         qword ptr [ebp+8]
 0062F7F2    call        @ROUND
 0062F7F7    mov         byte ptr [esi+451],al
 0062F7FD    lea         edx,[esi+44C];TSixaxisObject.OutputReport:TSixAxisOutputReport
 0062F803    mov         ecx,28
 0062F808    mov         eax,esi
 0062F80A    call        TManagedHidObject.SendReport
 0062F80F    mov         al,1
>0062F811    jmp         0062FAAB
 0062F816    fld         qword ptr [ebp+8]
 0062F819    call        @ROUND
 0062F81E    mov         byte ptr [esi+450],al
 0062F824    lea         edx,[esi+44C];TSixaxisObject.OutputReport:TSixAxisOutputReport
 0062F82A    mov         ecx,28
 0062F82F    mov         eax,esi
 0062F831    call        TManagedHidObject.SendReport
 0062F836    mov         al,1
>0062F838    jmp         0062FAAB
 0062F83D    fld         qword ptr [ebp+8]
 0062F840    call        @ROUND
 0062F845    mov         dword ptr [esi+452],eax
 0062F84B    lea         edx,[esi+44C];TSixaxisObject.OutputReport:TSixAxisOutputReport
 0062F851    mov         ecx,28
 0062F856    mov         eax,esi
 0062F858    call        TManagedHidObject.SendReport
 0062F85D    mov         al,1
>0062F85F    jmp         0062FAAB
 0062F864    fld         qword ptr [ebp+8]
 0062F867    call        @ROUND
 0062F86C    mov         byte ptr [esi+456],al
 0062F872    lea         edx,[esi+44C];TSixaxisObject.OutputReport:TSixAxisOutputReport
 0062F878    mov         ecx,28
 0062F87D    mov         eax,esi
 0062F87F    call        TManagedHidObject.SendReport
 0062F884    mov         al,1
>0062F886    jmp         0062FAAB
 0062F88B    push        dword ptr [ebp+0C]
 0062F88E    push        dword ptr [ebp+8]
 0062F891    mov         eax,esi
 0062F893    mov         edx,dword ptr [eax]
 0062F895    call        dword ptr [edx+28];TPS3ControllerObject.SetRumble
 0062F898    mov         al,1
>0062F89A    jmp         0062FAAB
 0062F89F    sub         eax,40
 0062F8A2    mov         ebx,eax
 0062F8A4    push        dword ptr [ebp+0C]
 0062F8A7    push        dword ptr [ebp+8]
 0062F8AA    call        00686060
 0062F8AF    mov         ecx,eax
 0062F8B1    mov         edx,ebx
 0062F8B3    mov         eax,esi
 0062F8B5    call        TPS3ControllerObject.SetLed
 0062F8BA    mov         al,1
>0062F8BC    jmp         0062FAAB
 0062F8C1    fld         qword ptr [ebp+8]
 0062F8C4    call        @ROUND
 0062F8C9    mov         edx,eax
 0062F8CB    mov         eax,esi
 0062F8CD    mov         ecx,dword ptr [eax]
 0062F8CF    call        dword ptr [ecx+3C];TPS3ControllerObject.SetLeds
 0062F8D2    mov         al,1
>0062F8D4    jmp         0062FAAB
 0062F8D9    push        dword ptr [ebp+0C]
 0062F8DC    push        dword ptr [ebp+8]
 0062F8DF    mov         eax,esi
 0062F8E1    mov         edx,dword ptr [eax]
 0062F8E3    call        dword ptr [edx+48];TPS3ControllerObject.SetLedLevel
 0062F8E6    mov         al,1
>0062F8E8    jmp         0062FAAB
 0062F8ED    push        dword ptr [ebp+0C]
 0062F8F0    push        dword ptr [ebp+8]
 0062F8F3    mov         eax,esi
 0062F8F5    mov         edx,dword ptr [eax]
 0062F8F7    call        dword ptr [edx+4C];TPS3ControllerObject.SetLedDrumLevel
 0062F8FA    mov         al,1
>0062F8FC    jmp         0062FAAB
 0062F901    fld         qword ptr [ebp+8]
 0062F904    call        @ROUND
 0062F909    mov         edx,eax
 0062F90B    mov         eax,esi
 0062F90D    mov         ecx,dword ptr [eax]
 0062F90F    call        dword ptr [ecx+44];TPS3ControllerObject.SetPlayerLed
 0062F912    mov         al,1
>0062F914    jmp         0062FAAB
 0062F919    push        dword ptr [ebp+0C]
 0062F91C    push        dword ptr [ebp+8]
 0062F91F    movzx       edx,byte ptr [ebx+20];TSixAxisValue........................................................
 0062F923    sub         dl,4F
 0062F926    mov         eax,esi
 0062F928    call        TPS3ControllerObject.SetLedFrequency
 0062F92D    mov         al,1
>0062F92F    jmp         0062FAAB
 0062F934    push        dword ptr [ebp+0C]
 0062F937    push        dword ptr [ebp+8]
 0062F93A    movzx       edx,byte ptr [ebx+20];TSixAxisValue........................................................
 0062F93E    sub         dl,49
 0062F941    mov         eax,esi
 0062F943    call        TPS3ControllerObject.SetLedDuration
 0062F948    mov         al,1
>0062F94A    jmp         0062FAAB
 0062F94F    sub         eax,55
 0062F952    mov         ebx,eax
 0062F954    fld         qword ptr [ebp+8]
 0062F957    fcomp       dword ptr ds:[62FAB4];255:Single
 0062F95D    wait
 0062F95E    fnstsw      al
 0062F960    sahf
>0062F961    jbe         0062F971
 0062F963    xor         eax,eax
 0062F965    mov         dword ptr [ebp+8],eax
 0062F968    mov         dword ptr [ebp+0C],406FE000
>0062F96F    jmp         0062F988
 0062F971    fld         qword ptr [ebp+8]
 0062F974    fcomp       dword ptr ds:[62FAB8];0:Single
 0062F97A    wait
 0062F97B    fnstsw      al
 0062F97D    sahf
>0062F97E    jae         0062F988
 0062F980    xor         eax,eax
 0062F982    mov         dword ptr [ebp+8],eax
 0062F985    mov         dword ptr [ebp+0C],eax
 0062F988    fld         qword ptr [ebp+8]
 0062F98B    call        @ROUND
 0062F990    mov         ecx,eax
 0062F992    mov         edx,ebx
 0062F994    mov         eax,esi
 0062F996    call        TPS3ControllerObject.SetLedBlock1
 0062F99B    mov         al,1
>0062F99D    jmp         0062FAAB
 0062F9A2    sub         eax,5B
 0062F9A5    mov         ebx,eax
 0062F9A7    fld         qword ptr [ebp+8]
 0062F9AA    fcomp       dword ptr ds:[62FAB4];255:Single
 0062F9B0    wait
 0062F9B1    fnstsw      al
 0062F9B3    sahf
>0062F9B4    jbe         0062F9C4
 0062F9B6    xor         eax,eax
 0062F9B8    mov         dword ptr [ebp+8],eax
 0062F9BB    mov         dword ptr [ebp+0C],406FE000
>0062F9C2    jmp         0062F9DB
 0062F9C4    fld         qword ptr [ebp+8]
 0062F9C7    fcomp       dword ptr ds:[62FAB8];0:Single
 0062F9CD    wait
 0062F9CE    fnstsw      al
 0062F9D0    sahf
>0062F9D1    jae         0062F9DB
 0062F9D3    xor         eax,eax
 0062F9D5    mov         dword ptr [ebp+8],eax
 0062F9D8    mov         dword ptr [ebp+0C],eax
 0062F9DB    fld         qword ptr [ebp+8]
 0062F9DE    call        @ROUND
 0062F9E3    mov         ecx,eax
 0062F9E5    mov         edx,ebx
 0062F9E7    mov         eax,esi
 0062F9E9    call        TPS3ControllerObject.SetLedBlock2
 0062F9EE    mov         al,1
>0062F9F0    jmp         0062FAAB
 0062F9F5    sub         eax,61
 0062F9F8    mov         ebx,eax
 0062F9FA    fld         qword ptr [ebp+8]
 0062F9FD    fcomp       dword ptr ds:[62FAB4];255:Single
 0062FA03    wait
 0062FA04    fnstsw      al
 0062FA06    sahf
>0062FA07    jbe         0062FA17
 0062FA09    xor         eax,eax
 0062FA0B    mov         dword ptr [ebp+8],eax
 0062FA0E    mov         dword ptr [ebp+0C],406FE000
>0062FA15    jmp         0062FA2E
 0062FA17    fld         qword ptr [ebp+8]
 0062FA1A    fcomp       dword ptr ds:[62FAB8];0:Single
 0062FA20    wait
 0062FA21    fnstsw      al
 0062FA23    sahf
>0062FA24    jae         0062FA2E
 0062FA26    xor         eax,eax
 0062FA28    mov         dword ptr [ebp+8],eax
 0062FA2B    mov         dword ptr [ebp+0C],eax
 0062FA2E    fld         qword ptr [ebp+8]
 0062FA31    call        @ROUND
 0062FA36    mov         ecx,eax
 0062FA38    mov         edx,ebx
 0062FA3A    mov         eax,esi
 0062FA3C    call        TPS3ControllerObject.SetLedBlock3
 0062FA41    mov         al,1
>0062FA43    jmp         0062FAAB
 0062FA45    push        dword ptr [ebp+0C]
 0062FA48    push        dword ptr [ebp+8]
 0062FA4B    mov         eax,esi
 0062FA4D    call        TAccelerometerObject.SetYaw
 0062FA52    mov         al,1
>0062FA54    jmp         0062FAAB
 0062FA56    mov         eax,dword ptr [ebp+8]
 0062FA59    mov         dword ptr [esi+230],eax;TSixaxisObject.DegPerGyro:Double
 0062FA5F    mov         eax,dword ptr [ebp+0C]
 0062FA62    mov         dword ptr [esi+234],eax;TSixaxisObject.?f234:dword
 0062FA68    mov         al,1
>0062FA6A    jmp         0062FAAB
 0062FA6C    mov         dword ptr [esi+14C],12C;TSixaxisObject.GyroSetCount:Integer
 0062FA76    mov         byte ptr [esi+14B],1;TSixaxisObject.GyrosCalibrated:Boolean
 0062FA7D    mov         eax,dword ptr [ebp+8]
 0062FA80    mov         dword ptr [esi+180],eax;TSixaxisObject.ZeroYawSpeed:Double
 0062FA86    mov         eax,dword ptr [ebp+0C]
 0062FA89    mov         dword ptr [esi+184],eax;TSixaxisObject.?f184:dword
 0062FA8F    mov         al,1
>0062FA91    jmp         0062FAAB
 0062FA93    mov         eax,dword ptr [ebp+8]
 0062FA96    mov         dword ptr [esi+3E0],eax;TSixaxisObject.SteeringAngle:Double
 0062FA9C    mov         eax,dword ptr [ebp+0C]
 0062FA9F    mov         dword ptr [esi+3E4],eax;TSixaxisObject.?f3E4:dword
 0062FAA5    mov         al,1
>0062FAA7    jmp         0062FAAB
 0062FAA9    xor         eax,eax
 0062FAAB    pop         esi
 0062FAAC    pop         ebx
 0062FAAD    pop         ebp
 0062FAAE    ret         8
end;*}

//0062FABC
{*procedure TSixAxisValue.ToString(?:?);
begin
 0062FABC    push        ebp
 0062FABD    mov         ebp,esp
 0062FABF    push        0
 0062FAC1    push        0
 0062FAC3    push        0
 0062FAC5    push        ebx
 0062FAC6    push        esi
 0062FAC7    push        edi
 0062FAC8    mov         esi,edx
 0062FACA    mov         ebx,eax
 0062FACC    xor         eax,eax
 0062FACE    push        ebp
 0062FACF    push        62FB59
 0062FAD4    push        dword ptr fs:[eax]
 0062FAD7    mov         dword ptr fs:[eax],esp
 0062FADA    mov         edi,dword ptr [ebx+18];TSixAxisValue.......................................................
 0062FADD    test        edi,edi
>0062FADF    jle         0062FB1C
 0062FAE1    push        62FB74;'SixAxis'
 0062FAE6    lea         edx,[ebp-4]
 0062FAE9    mov         eax,edi
 0062FAEB    call        IntToStr
 0062FAF0    push        dword ptr [ebp-4]
 0062FAF3    push        62FB90;'.'
 0062FAF8    lea         ecx,[ebp-8]
 0062FAFB    mov         eax,[0081ECAC];gvar_0081ECAC:TModuleSixaxis
 0062FB00    mov         eax,dword ptr [eax+1C]
 0062FB03    mov         edx,dword ptr [ebx+20];TSixAxisValue.......................................................
 0062FB06    call        THashTable.Get
 0062FB0B    push        dword ptr [ebp-8]
 0062FB0E    mov         eax,esi
 0062FB10    mov         edx,4
 0062FB15    call        @UStrCatN
>0062FB1A    jmp         0062FB3E
 0062FB1C    lea         ecx,[ebp-0C]
 0062FB1F    mov         eax,[0081ECAC];gvar_0081ECAC:TModuleSixaxis
 0062FB24    mov         eax,dword ptr [eax+1C]
 0062FB27    mov         edx,dword ptr [ebx+20];TSixAxisValue.......................................................
 0062FB2A    call        THashTable.Get
 0062FB2F    mov         ecx,dword ptr [ebp-0C]
 0062FB32    mov         eax,esi
 0062FB34    mov         edx,62FBA0;'SixAxis.'
 0062FB39    call        @UStrCat3
 0062FB3E    xor         eax,eax
 0062FB40    pop         edx
 0062FB41    pop         ecx
 0062FB42    pop         ecx
 0062FB43    mov         dword ptr fs:[eax],edx
 0062FB46    push        62FB60
 0062FB4B    lea         eax,[ebp-0C]
 0062FB4E    mov         edx,3
 0062FB53    call        @UStrArrayClr
 0062FB58    ret
>0062FB59    jmp         @HandleFinally
>0062FB5E    jmp         0062FB4B
 0062FB60    pop         edi
 0062FB61    pop         esi
 0062FB62    pop         ebx
 0062FB63    mov         esp,ebp
 0062FB65    pop         ebp
 0062FB66    ret
end;*}

//0062FBB4
procedure sub_0062FBB4;
begin
{*
 0062FBB4    mov         byte ptr ds:[81ECA4],0;gvar_0081ECA4
 0062FBBB    call        0074BF10
 0062FBC0    call        TWiimoteManager.StartCompileTime
 0062FBC5    ret
*}
end;

//0062FBC8
procedure sub_0062FBC8;
begin
{*
 0062FBC8    ret
*}
end;

//0062FBCC
procedure sub_0062FBCC;
begin
{*
 0062FBCC    cmp         byte ptr ds:[81ECA4],0;gvar_0081ECA4
>0062FBD3    je          0062FBEF
 0062FBD5    call        0062CAF4
 0062FBDA    cmp         dword ptr ds:[81ECA0],0;gvar_0081ECA0
>0062FBE1    jle         0062FBEF
 0062FBE3    mov         byte ptr ds:[81ECA5],1;gvar_0081ECA5
 0062FBEA    call        0062C0E8
 0062FBEF    ret
*}
end;

//0062FBF0
procedure sub_0062FBF0;
begin
{*
 0062FBF0    push        ebx
 0062FBF1    push        esi
 0062FBF2    movzx       eax,byte ptr ds:[81ECA4];gvar_0081ECA4
 0062FBF9    and         al,byte ptr ds:[81ECA5];gvar_0081ECA5
>0062FBFF    je          0062FC37
 0062FC01    mov         esi,dword ptr ds:[81ECA0];gvar_0081ECA0
 0062FC07    test        esi,esi
>0062FC09    jle         0062FC29
 0062FC0B    mov         ebx,81D910;gvar_0081D910
 0062FC10    mov         eax,ebx
 0062FC12    mov         eax,dword ptr [eax+4]
 0062FC15    push        eax
 0062FC16    mov         eax,[0078CD90];^gvar_0081D8E4:Pointer
 0062FC1B    mov         eax,dword ptr [eax]
 0062FC1D    call        eax
 0062FC1F    pop         ecx
 0062FC20    add         ebx,110
 0062FC26    dec         esi
>0062FC27    jne         0062FC10
 0062FC29    xor         eax,eax
 0062FC2B    mov         [0081ECA0],eax;gvar_0081ECA0
 0062FC30    mov         byte ptr ds:[81ECA5],0;gvar_0081ECA5
 0062FC37    pop         esi
 0062FC38    pop         ebx
 0062FC39    ret
*}
end;

//0062FC3C
{*function sub_0062FC3C:?;
begin
 0062FC3C    call        0062CC50
 0062FC41    mov         al,1
 0062FC43    ret
end;*}

//0062FC44
procedure TModuleSixaxis.AddFields;
begin
{*
 0062FC44    push        ebx
 0062FC45    mov         ebx,eax
 0062FC47    mov         ecx,76
 0062FC4C    mov         edx,631014;'RawFeatureSelect'
 0062FC51    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FC54    call        THashTable.Add
 0062FC59    mov         ecx,77
 0062FC5E    mov         edx,631044;'RawSmallDuration'
 0062FC63    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FC66    call        THashTable.Add
 0062FC6B    mov         ecx,78
 0062FC70    mov         edx,631074;'RawSmallVoltage'
 0062FC75    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FC78    call        THashTable.Add
 0062FC7D    mov         ecx,79
 0062FC82    mov         edx,6310A0;'RawBigDuration'
 0062FC87    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FC8A    call        THashTable.Add
 0062FC8F    mov         ecx,7A
 0062FC94    mov         edx,6310CC;'RawBigVoltage'
 0062FC99    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FC9C    call        THashTable.Add
 0062FCA1    mov         ecx,7B
 0062FCA6    mov         edx,6310F4;'RawNoClue'
 0062FCAB    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FCAE    call        THashTable.Add
 0062FCB3    mov         ecx,7C
 0062FCB8    mov         edx,631114;'RawLeds'
 0062FCBD    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FCC0    call        THashTable.Add
 0062FCC5    xor         ecx,ecx
 0062FCC7    mov         edx,631130;'Exists'
 0062FCCC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FCCF    call        THashTable.Add
 0062FCD4    mov         ecx,1
 0062FCD9    mov         edx,63114C;'Test'
 0062FCDE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FCE1    call        THashTable.Add
 0062FCE6    mov         ecx,2
 0062FCEB    mov         edx,631164;'InByteString'
 0062FCF0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FCF3    call        THashTable.Add
 0062FCF8    mov         ecx,2
 0062FCFD    mov         edx,63118C;'ReportStr'
 0062FD02    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD05    call        THashTable.Add
 0062FD0A    mov         ecx,4
 0062FD0F    mov         edx,6311AC;'Triangle'
 0062FD14    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD17    call        THashTable.Add
 0062FD1C    mov         ecx,5
 0062FD21    mov         edx,6311CC;'Circle'
 0062FD26    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD29    call        THashTable.Add
 0062FD2E    mov         ecx,6
 0062FD33    mov         edx,6311E8;'Cross'
 0062FD38    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD3B    call        THashTable.Add
 0062FD40    mov         ecx,3
 0062FD45    mov         edx,631200;'Square'
 0062FD4A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD4D    call        THashTable.Add
 0062FD52    mov         ecx,0E
 0062FD57    mov         edx,63121C;'L1'
 0062FD5C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD5F    call        THashTable.Add
 0062FD64    mov         ecx,0F
 0062FD69    mov         edx,631230;'L2'
 0062FD6E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD71    call        THashTable.Add
 0062FD76    mov         ecx,10
 0062FD7B    mov         edx,631244;'L3'
 0062FD80    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD83    call        THashTable.Add
 0062FD88    mov         ecx,11
 0062FD8D    mov         edx,631258;'R1'
 0062FD92    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FD95    call        THashTable.Add
 0062FD9A    mov         ecx,12
 0062FD9F    mov         edx,63126C;'R2'
 0062FDA4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FDA7    call        THashTable.Add
 0062FDAC    mov         ecx,13
 0062FDB1    mov         edx,631280;'R3'
 0062FDB6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FDB9    call        THashTable.Add
 0062FDBE    mov         ecx,0D
 0062FDC3    mov         edx,631294;'PS'
 0062FDC8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FDCB    call        THashTable.Add
 0062FDD0    mov         ecx,7
 0062FDD5    mov         edx,6312A8;'Select'
 0062FDDA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FDDD    call        THashTable.Add
 0062FDE2    mov         ecx,8
 0062FDE7    mov         edx,6312C4;'Start'
 0062FDEC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FDEF    call        THashTable.Add
 0062FDF4    mov         ecx,9
 0062FDF9    mov         edx,6312DC;'Up'
 0062FDFE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE01    call        THashTable.Add
 0062FE06    mov         ecx,0A
 0062FE0B    mov         edx,6312F0;'Down'
 0062FE10    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE13    call        THashTable.Add
 0062FE18    mov         ecx,0B
 0062FE1D    mov         edx,631308;'Left'
 0062FE22    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE25    call        THashTable.Add
 0062FE2A    mov         ecx,0C
 0062FE2F    mov         edx,631320;'Right'
 0062FE34    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE37    call        THashTable.Add
 0062FE3C    mov         ecx,14
 0062FE41    mov         edx,631338;'LeftStickX'
 0062FE46    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE49    call        THashTable.Add
 0062FE4E    mov         ecx,15
 0062FE53    mov         edx,63135C;'LeftStickY'
 0062FE58    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE5B    call        THashTable.Add
 0062FE60    mov         ecx,30
 0062FE65    mov         edx,631380;'LeftStick'
 0062FE6A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE6D    call        THashTable.Add
 0062FE72    mov         ecx,6D
 0062FE77    mov         edx,6313A0;'LeftStick3D'
 0062FE7C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE7F    call        THashTable.Add
 0062FE84    mov         ecx,14
 0062FE89    mov         edx,6313C4;'Joy1x'
 0062FE8E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FE91    call        THashTable.Add
 0062FE96    mov         ecx,15
 0062FE9B    mov         edx,6313DC;'Joy1y'
 0062FEA0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FEA3    call        THashTable.Add
 0062FEA8    mov         ecx,30
 0062FEAD    mov         edx,6313F4;'Joy1'
 0062FEB2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FEB5    call        THashTable.Add
 0062FEBA    mov         ecx,6D
 0062FEBF    mov         edx,63140C;'Joy1Vector'
 0062FEC4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FEC7    call        THashTable.Add
 0062FECC    mov         ecx,16
 0062FED1    mov         edx,631430;'RightStickX'
 0062FED6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FED9    call        THashTable.Add
 0062FEDE    mov         ecx,17
 0062FEE3    mov         edx,631454;'RightStickY'
 0062FEE8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FEEB    call        THashTable.Add
 0062FEF0    mov         ecx,31
 0062FEF5    mov         edx,631478;'RightStick'
 0062FEFA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FEFD    call        THashTable.Add
 0062FF02    mov         ecx,6E
 0062FF07    mov         edx,63149C;'RightStick3D'
 0062FF0C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF0F    call        THashTable.Add
 0062FF14    mov         ecx,16
 0062FF19    mov         edx,6314C4;'Joy2x'
 0062FF1E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF21    call        THashTable.Add
 0062FF26    mov         ecx,17
 0062FF2B    mov         edx,6314DC;'Joy2y'
 0062FF30    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF33    call        THashTable.Add
 0062FF38    mov         ecx,31
 0062FF3D    mov         edx,6314F4;'Joy2'
 0062FF42    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF45    call        THashTable.Add
 0062FF4A    mov         ecx,6E
 0062FF4F    mov         edx,63150C;'Joy2Vector'
 0062FF54    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF57    call        THashTable.Add
 0062FF5C    mov         ecx,27
 0062FF61    mov         edx,631530;'DPadX'
 0062FF66    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF69    call        THashTable.Add
 0062FF6E    mov         ecx,28
 0062FF73    mov         edx,631548;'DPadY'
 0062FF78    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF7B    call        THashTable.Add
 0062FF80    mov         ecx,34
 0062FF85    mov         edx,631560;'DPad'
 0062FF8A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF8D    call        THashTable.Add
 0062FF92    mov         ecx,6F
 0062FF97    mov         edx,631578;'DPad3D'
 0062FF9C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FF9F    call        THashTable.Add
 0062FFA4    mov         ecx,6F
 0062FFA9    mov         edx,631594;'DPadVector'
 0062FFAE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FFB1    call        THashTable.Add
 0062FFB6    mov         ecx,18
 0062FFBB    mov         edx,6315B8;'RawForceX'
 0062FFC0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FFC3    call        THashTable.Add
 0062FFC8    mov         ecx,19
 0062FFCD    mov         edx,6315D8;'RawForceY'
 0062FFD2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FFD5    call        THashTable.Add
 0062FFDA    mov         ecx,1A
 0062FFDF    mov         edx,6315F8;'RawForceZ'
 0062FFE4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FFE7    call        THashTable.Add
 0062FFEC    mov         ecx,2F
 0062FFF1    mov         edx,631618;'RawForce'
 0062FFF6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0062FFF9    call        THashTable.Add
 0062FFFE    mov         ecx,2B
 00630003    mov         edx,631638;'gx'
 00630008    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063000B    call        THashTable.Add
 00630010    mov         ecx,2C
 00630015    mov         edx,63164C;'gy'
 0063001A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063001D    call        THashTable.Add
 00630022    mov         ecx,2D
 00630027    mov         edx,631660;'gz'
 0063002C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063002F    call        THashTable.Add
 00630034    mov         ecx,2E
 00630039    mov         edx,631674;'g'
 0063003E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630041    call        THashTable.Add
 00630046    mov         ecx,1B
 0063004B    mov         edx,631684;'UpAnalog'
 00630050    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630053    call        THashTable.Add
 00630058    mov         ecx,1D
 0063005D    mov         edx,6316A4;'DownAnalog'
 00630062    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630065    call        THashTable.Add
 0063006A    mov         ecx,1E
 0063006F    mov         edx,6316C8;'LeftAnalog'
 00630074    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630077    call        THashTable.Add
 0063007C    mov         ecx,1C
 00630081    mov         edx,6316EC;'RightAnalog'
 00630086    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630089    call        THashTable.Add
 0063008E    mov         ecx,21
 00630093    mov         edx,631710;'L1Analog'
 00630098    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063009B    call        THashTable.Add
 006300A0    mov         ecx,1F
 006300A5    mov         edx,631730;'L2Analog'
 006300AA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006300AD    call        THashTable.Add
 006300B2    mov         ecx,22
 006300B7    mov         edx,631750;'R1Analog'
 006300BC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006300BF    call        THashTable.Add
 006300C4    mov         ecx,20
 006300C9    mov         edx,631770;'R2Analog'
 006300CE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006300D1    call        THashTable.Add
 006300D6    mov         ecx,23
 006300DB    mov         edx,631790;'TriangleAnalog'
 006300E0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006300E3    call        THashTable.Add
 006300E8    mov         ecx,24
 006300ED    mov         edx,6317BC;'CircleAnalog'
 006300F2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006300F5    call        THashTable.Add
 006300FA    mov         ecx,25
 006300FF    mov         edx,6317E4;'CrossAnalog'
 00630104    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630107    call        THashTable.Add
 0063010C    mov         ecx,26
 00630111    mov         edx,631808;'SquareAnalog'
 00630116    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630119    call        THashTable.Add
 0063011E    mov         ecx,29
 00630123    mov         edx,631830;'Count'
 00630128    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063012B    call        THashTable.Add
 00630130    mov         ecx,2A
 00630135    mov         edx,631848;'BluetoothMAC'
 0063013A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063013D    call        THashTable.Add
 00630142    mov         ecx,2A
 00630147    mov         edx,631870;'MAC'
 0063014C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063014F    call        THashTable.Add
 00630154    mov         ecx,36
 00630159    mov         edx,631884;'Pitch'
 0063015E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630161    call        THashTable.Add
 00630166    mov         ecx,35
 0063016B    mov         edx,63189C;'Roll'
 00630170    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630173    call        THashTable.Add
 00630178    mov         ecx,38
 0063017D    mov         edx,6318B4;'SmoothPitch'
 00630182    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630185    call        THashTable.Add
 0063018A    mov         ecx,37
 0063018F    mov         edx,6318D8;'SmoothRoll'
 00630194    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630197    call        THashTable.Add
 0063019C    mov         ecx,39
 006301A1    mov         edx,6318FC;'RelAccX'
 006301A6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006301A9    call        THashTable.Add
 006301AE    mov         ecx,3A
 006301B3    mov         edx,631918;'RelAccY'
 006301B8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006301BB    call        THashTable.Add
 006301C0    mov         ecx,3B
 006301C5    mov         edx,631934;'RelAccZ'
 006301CA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006301CD    call        THashTable.Add
 006301D2    mov         ecx,32
 006301D7    mov         edx,631950;'RelAcc'
 006301DC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006301DF    call        THashTable.Add
 006301E4    mov         ecx,3C
 006301E9    mov         edx,63196C;'RawAccX'
 006301EE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006301F1    call        THashTable.Add
 006301F6    mov         ecx,3D
 006301FB    mov         edx,631988;'RawAccY'
 00630200    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630203    call        THashTable.Add
 00630208    mov         ecx,3E
 0063020D    mov         edx,6319A4;'RawAccZ'
 00630212    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630215    call        THashTable.Add
 0063021A    mov         ecx,33
 0063021F    mov         edx,6319C0;'RawAcc'
 00630224    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630227    call        THashTable.Add
 0063022C    mov         ecx,3F
 00630231    mov         edx,6319DC;'RawGyro'
 00630236    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630239    call        THashTable.Add
 0063023E    mov         ecx,74
 00630243    mov         edx,6319F8;'Rumble'
 00630248    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063024B    call        THashTable.Add
 00630250    mov         ecx,74
 00630255    mov         edx,631A14;'Vibration1'
 0063025A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063025D    call        THashTable.Add
 00630262    mov         ecx,40
 00630267    mov         edx,631A38;'Led0'
 0063026C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063026F    call        THashTable.Add
 00630274    mov         ecx,41
 00630279    mov         edx,631A50;'Led1'
 0063027E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630281    call        THashTable.Add
 00630286    mov         ecx,42
 0063028B    mov         edx,631A68;'Led2'
 00630290    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630293    call        THashTable.Add
 00630298    mov         ecx,43
 0063029D    mov         edx,631A80;'Led3'
 006302A2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006302A5    call        THashTable.Add
 006302AA    mov         ecx,44
 006302AF    mov         edx,631A98;'Led4'
 006302B4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006302B7    call        THashTable.Add
 006302BC    mov         ecx,45
 006302C1    mov         edx,631AB0;'Led5'
 006302C6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006302C9    call        THashTable.Add
 006302CE    mov         ecx,46
 006302D3    mov         edx,631AC8;'Led6'
 006302D8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006302DB    call        THashTable.Add
 006302E0    mov         ecx,47
 006302E5    mov         edx,631AE0;'Led7'
 006302EA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006302ED    call        THashTable.Add
 006302F2    mov         ecx,48
 006302F7    mov         edx,631AF8;'LedMinus1Duration'
 006302FC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006302FF    call        THashTable.Add
 00630304    mov         ecx,49
 00630309    mov         edx,631B28;'Led0Duration'
 0063030E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630311    call        THashTable.Add
 00630316    mov         ecx,4A
 0063031B    mov         edx,631B50;'Led1Duration'
 00630320    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630323    call        THashTable.Add
 00630328    mov         ecx,4B
 0063032D    mov         edx,631B78;'Led2Duration'
 00630332    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630335    call        THashTable.Add
 0063033A    mov         ecx,4C
 0063033F    mov         edx,631BA0;'Led3Duration'
 00630344    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630347    call        THashTable.Add
 0063034C    mov         ecx,4D
 00630351    mov         edx,631BC8;'Led4Duration'
 00630356    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630359    call        THashTable.Add
 0063035E    mov         ecx,4E
 00630363    mov         edx,631BF0;'LedMinus1Frequency'
 00630368    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063036B    call        THashTable.Add
 00630370    mov         ecx,4F
 00630375    mov         edx,631C24;'Led0Frequency'
 0063037A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063037D    call        THashTable.Add
 00630382    mov         ecx,50
 00630387    mov         edx,631C4C;'Led1Frequency'
 0063038C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063038F    call        THashTable.Add
 00630394    mov         ecx,51
 00630399    mov         edx,631C74;'Led2Frequency'
 0063039E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006303A1    call        THashTable.Add
 006303A6    mov         ecx,52
 006303AB    mov         edx,631C9C;'Led3Frequency'
 006303B0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006303B3    call        THashTable.Add
 006303B8    mov         ecx,53
 006303BD    mov         edx,631CC4;'Led4Frequency'
 006303C2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006303C5    call        THashTable.Add
 006303CA    mov         ecx,54
 006303CF    mov         edx,631CEC;'LedMinus1Block1'
 006303D4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006303D7    call        THashTable.Add
 006303DC    mov         ecx,55
 006303E1    mov         edx,631D18;'Led0Block1'
 006303E6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006303E9    call        THashTable.Add
 006303EE    mov         ecx,56
 006303F3    mov         edx,631D3C;'Led1Block1'
 006303F8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006303FB    call        THashTable.Add
 00630400    mov         ecx,57
 00630405    mov         edx,631D60;'Led2Block1'
 0063040A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063040D    call        THashTable.Add
 00630412    mov         ecx,58
 00630417    mov         edx,631D84;'Led3Block1'
 0063041C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063041F    call        THashTable.Add
 00630424    mov         ecx,59
 00630429    mov         edx,631DA8;'Led4Block1'
 0063042E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630431    call        THashTable.Add
 00630436    mov         ecx,5A
 0063043B    mov         edx,631DCC;'LedMinus1Block2'
 00630440    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630443    call        THashTable.Add
 00630448    mov         ecx,5B
 0063044D    mov         edx,631DF8;'Led0Block2'
 00630452    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630455    call        THashTable.Add
 0063045A    mov         ecx,5C
 0063045F    mov         edx,631E1C;'Led1Block2'
 00630464    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630467    call        THashTable.Add
 0063046C    mov         ecx,5D
 00630471    mov         edx,631E40;'Led2Block2'
 00630476    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630479    call        THashTable.Add
 0063047E    mov         ecx,5E
 00630483    mov         edx,631E64;'Led3Block2'
 00630488    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063048B    call        THashTable.Add
 00630490    mov         ecx,5F
 00630495    mov         edx,631E88;'Led4Block2'
 0063049A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063049D    call        THashTable.Add
 006304A2    mov         ecx,60
 006304A7    mov         edx,631EAC;'LedMinus1Block3'
 006304AC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006304AF    call        THashTable.Add
 006304B4    mov         ecx,61
 006304B9    mov         edx,631ED8;'Led0Block3'
 006304BE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006304C1    call        THashTable.Add
 006304C6    mov         ecx,62
 006304CB    mov         edx,631EFC;'Led1Block3'
 006304D0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006304D3    call        THashTable.Add
 006304D8    mov         ecx,63
 006304DD    mov         edx,631F20;'Led2Block3'
 006304E2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006304E5    call        THashTable.Add
 006304EA    mov         ecx,64
 006304EF    mov         edx,631F44;'Led3Block3'
 006304F4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006304F7    call        THashTable.Add
 006304FC    mov         ecx,65
 00630501    mov         edx,631F68;'Led4Block3'
 00630506    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630509    call        THashTable.Add
 0063050E    mov         ecx,66
 00630513    mov         edx,631F8C;'Leds'
 00630518    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063051B    call        THashTable.Add
 00630520    mov         ecx,67
 00630525    mov         edx,631FA4;'LedPlayer'
 0063052A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063052D    call        THashTable.Add
 00630532    mov         ecx,72
 00630537    mov         edx,631FC4;'LedLevel'
 0063053C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063053F    call        THashTable.Add
 00630544    mov         ecx,73
 00630549    mov         edx,631FE4;'LedBackwardLevel'
 0063054E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630551    call        THashTable.Add
 00630556    mov         ecx,3F
 0063055B    mov         edx,632014;'RawGyroYaw'
 00630560    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630563    call        THashTable.Add
 00630568    mov         ecx,3F
 0063056D    mov         edx,6319DC;'RawGyro'
 00630572    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630575    call        THashTable.Add
 0063057A    mov         ecx,6B
 0063057F    mov         edx,632038;'RawGyroZeroYaw'
 00630584    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630587    call        THashTable.Add
 0063058C    mov         ecx,6B
 00630591    mov         edx,632064;'RawGyroZero'
 00630596    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630599    call        THashTable.Add
 0063059E    mov         ecx,68
 006305A3    mov         edx,632088;'RawYawSpeed'
 006305A8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006305AB    call        THashTable.Add
 006305B0    mov         ecx,6C
 006305B5    mov         edx,6320AC;'DegreesPerRawGyro'
 006305BA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006305BD    call        THashTable.Add
 006305C2    mov         ecx,69
 006305C7    mov         edx,6320DC;'YawSpeed'
 006305CC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006305CF    call        THashTable.Add
 006305D4    mov         ecx,71
 006305D9    mov         edx,6320FC;'GyroYaw'
 006305DE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006305E1    call        THashTable.Add
 006305E6    mov         ecx,6A
 006305EB    mov         edx,632118;'Yaw'
 006305F0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006305F3    call        THashTable.Add
 006305F8    mov         ecx,75
 006305FD    mov         edx,63212C;'SteeringAngle'
 00630602    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630605    call        THashTable.Add
 0063060A    mov         ecx,89
 0063060F    mov         edx,632154;'Shakiness'
 00630614    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630617    call        THashTable.Add
 0063061C    mov         ecx,8E
 00630621    mov         edx,632174;'SwingHorizontal'
 00630626    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630629    call        THashTable.Add
 0063062E    mov         ecx,8F
 00630633    mov         edx,6321A0;'SwingVertical'
 00630638    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063063B    call        THashTable.Add
 00630640    mov         ecx,90
 00630645    mov         edx,6321C8;'Stabbing'
 0063064A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063064D    call        THashTable.Add
 00630652    mov         ecx,91
 00630657    mov         edx,6321E8;'DrumBeat'
 0063065C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063065F    call        THashTable.Add
 00630664    mov         ecx,94
 00630669    mov         edx,632208;'CrossArms'
 0063066E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630671    call        THashTable.Add
 00630676    mov         ecx,8A
 0063067B    mov         edx,632228;'OnTable'
 00630680    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630683    call        THashTable.Add
 00630688    mov         ecx,8B
 0063068D    mov         edx,632244;'LookingAtWatch'
 00630692    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630695    call        THashTable.Add
 0063069A    mov         ecx,8C
 0063069F    mov         edx,632270;'LookingAtRightWatch'
 006306A4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006306A7    call        THashTable.Add
 006306AC    mov         ecx,92
 006306B1    mov         edx,6322A4;'LookingAtLeftPalm'
 006306B6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006306B9    call        THashTable.Add
 006306BE    mov         ecx,93
 006306C3    mov         edx,6322D4;'LookingAtRightPalm'
 006306C8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006306CB    call        THashTable.Add
 006306D0    mov         ecx,8D
 006306D5    mov         edx,632308;'UpsidedownOnShoulder'
 006306DA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006306DD    call        THashTable.Add
 006306E2    mov         ecx,97
 006306E7    mov         edx,632340;'SwingDown'
 006306EC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006306EF    call        THashTable.Add
 006306F4    mov         ecx,98
 006306F9    mov         edx,632360;'SwingDownStop'
 006306FE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630701    call        THashTable.Add
 00630706    mov         ecx,99
 0063070B    mov         edx,632388;'SwingDownUp'
 00630710    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630713    call        THashTable.Add
 00630718    mov         ecx,9A
 0063071D    mov         edx,6323AC;'SwingDownUpStop'
 00630722    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630725    call        THashTable.Add
 0063072A    mov         ecx,9B
 0063072F    mov         edx,6323D8;'SwingDownUpDown'
 00630734    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630737    call        THashTable.Add
 0063073C    mov         ecx,9C
 00630741    mov         edx,632404;'SwingDownUpDownStop'
 00630746    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630749    call        THashTable.Add
 0063074E    mov         ecx,9D
 00630753    mov         edx,632438;'SwingDownUpDownUp'
 00630758    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063075B    call        THashTable.Add
 00630760    mov         ecx,9E
 00630765    mov         edx,632468;'SwingDownUpDownUpStop'
 0063076A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063076D    call        THashTable.Add
 00630772    mov         ecx,9F
 00630777    mov         edx,6324A0;'SwingDownUpDownUpDown'
 0063077C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063077F    call        THashTable.Add
 00630784    mov         ecx,0A9
 00630789    mov         edx,6324D8;'SwingLeft'
 0063078E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630791    call        THashTable.Add
 00630796    mov         ecx,0AA
 0063079B    mov         edx,6324F8;'SwingLeftStop'
 006307A0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006307A3    call        THashTable.Add
 006307A8    mov         ecx,0AB
 006307AD    mov         edx,632520;'SwingLeftRight'
 006307B2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006307B5    call        THashTable.Add
 006307BA    mov         ecx,0AC
 006307BF    mov         edx,63254C;'SwingLeftRightStop'
 006307C4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006307C7    call        THashTable.Add
 006307CC    mov         ecx,0AD
 006307D1    mov         edx,632580;'SwingLeftRightLeft'
 006307D6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006307D9    call        THashTable.Add
 006307DE    mov         ecx,0AE
 006307E3    mov         edx,6325B4;'SwingLeftRightLeftStop'
 006307E8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006307EB    call        THashTable.Add
 006307F0    mov         ecx,0AF
 006307F5    mov         edx,6325F0;'SwingLeftRightLeftRight'
 006307FA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006307FD    call        THashTable.Add
 00630802    mov         ecx,0B0
 00630807    mov         edx,63262C;'SwingLeftRightLeftRightStop'
 0063080C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063080F    call        THashTable.Add
 00630814    mov         ecx,0B1
 00630819    mov         edx,632670;'SwingLeftRightLeftRightLeft'
 0063081E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630821    call        THashTable.Add
 00630826    mov         ecx,0B2
 0063082B    mov         edx,6326B4;'SwingRight'
 00630830    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630833    call        THashTable.Add
 00630838    mov         ecx,0B3
 0063083D    mov         edx,6326D8;'SwingRightStop'
 00630842    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630845    call        THashTable.Add
 0063084A    mov         ecx,0B4
 0063084F    mov         edx,632704;'SwingRightLeft'
 00630854    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630857    call        THashTable.Add
 0063085C    mov         ecx,0B5
 00630861    mov         edx,632730;'SwingRightLeftStop'
 00630866    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630869    call        THashTable.Add
 0063086E    mov         ecx,0B6
 00630873    mov         edx,632764;'SwingRightLeftRight'
 00630878    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063087B    call        THashTable.Add
 00630880    mov         ecx,0B7
 00630885    mov         edx,632798;'SwingRightLeftRightStop'
 0063088A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063088D    call        THashTable.Add
 00630892    mov         ecx,0B8
 00630897    mov         edx,6327D4;'SwingRightLeftRightLeft'
 0063089C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063089F    call        THashTable.Add
 006308A4    mov         ecx,0B9
 006308A9    mov         edx,632810;'SwingRightLeftRightLeftStop'
 006308AE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006308B1    call        THashTable.Add
 006308B6    mov         ecx,0BA
 006308BB    mov         edx,632854;'SwingRightLeftRightLeftRight'
 006308C0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006308C3    call        THashTable.Add
 006308C8    mov         ecx,0A0
 006308CD    mov         edx,63289C;'SwingUp'
 006308D2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006308D5    call        THashTable.Add
 006308DA    mov         ecx,0A1
 006308DF    mov         edx,6328B8;'SwingUpStop'
 006308E4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006308E7    call        THashTable.Add
 006308EC    mov         ecx,0A2
 006308F1    mov         edx,6328DC;'SwingUpDown'
 006308F6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006308F9    call        THashTable.Add
 006308FE    mov         ecx,0A3
 00630903    mov         edx,632900;'SwingUpDownStop'
 00630908    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063090B    call        THashTable.Add
 00630910    mov         ecx,0A4
 00630915    mov         edx,63292C;'SwingUpDownUp'
 0063091A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063091D    call        THashTable.Add
 00630922    mov         ecx,0A5
 00630927    mov         edx,632954;'SwingUpDownUpStop'
 0063092C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063092F    call        THashTable.Add
 00630934    mov         ecx,0A6
 00630939    mov         edx,632984;'SwingUpDownUpDown'
 0063093E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630941    call        THashTable.Add
 00630946    mov         ecx,0A7
 0063094B    mov         edx,6329B4;'SwingUpDownUpDownStop'
 00630950    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630953    call        THashTable.Add
 00630958    mov         ecx,0A8
 0063095D    mov         edx,6329EC;'SwingUpDownUpDownUp'
 00630962    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630965    call        THashTable.Add
 0063096A    mov         ecx,0BB
 0063096F    mov         edx,632A20;'CurveDownRight'
 00630974    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630977    call        THashTable.Add
 0063097C    mov         ecx,0BC
 00630981    mov         edx,632A4C;'CurveDownRightStop'
 00630986    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630989    call        THashTable.Add
 0063098E    mov         ecx,0BD
 00630993    mov         edx,632A80;'CurveDownRightUp'
 00630998    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 0063099B    call        THashTable.Add
 006309A0    mov         ecx,0BE
 006309A5    mov         edx,632AB0;'CurveDownRightUpStop'
 006309AA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006309AD    call        THashTable.Add
 006309B2    mov         ecx,0BF
 006309B7    mov         edx,632AE8;'SwishAndFlick'
 006309BC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006309BF    call        THashTable.Add
 006309C4    mov         ecx,0BF
 006309C9    mov         edx,632B10;'CurveDownRightUpDown'
 006309CE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006309D1    call        THashTable.Add
 006309D6    mov         ecx,0C0
 006309DB    mov         edx,632B48;'SwishAndFlickStop'
 006309E0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006309E3    call        THashTable.Add
 006309E8    mov         ecx,0C0
 006309ED    mov         edx,632B78;'CurveDownRightUpDownStop'
 006309F2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 006309F5    call        THashTable.Add
 006309FA    mov         ecx,0C1
 006309FF    mov         edx,632BB8;'CurveDownRightUpDownRight'
 00630A04    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A07    call        THashTable.Add
 00630A0C    mov         ecx,0C2
 00630A11    mov         edx,632BF8;'CurveDownRightUpDownRightStop'
 00630A16    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A19    call        THashTable.Add
 00630A1E    mov         ecx,0C3
 00630A23    mov         edx,632C40;'CurvyW'
 00630A28    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A2B    call        THashTable.Add
 00630A30    mov         ecx,0C3
 00630A35    mov         edx,632C5C;'CurlyW'
 00630A3A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A3D    call        THashTable.Add
 00630A42    mov         ecx,0C3
 00630A47    mov         edx,632C78;'CurveDownRightUpDownRightUp'
 00630A4C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A4F    call        THashTable.Add
 00630A54    mov         ecx,0C4
 00630A59    mov         edx,632CBC;'SwishAndFlickAndUp'
 00630A5E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A61    call        THashTable.Add
 00630A66    mov         ecx,0C4
 00630A6B    mov         edx,632CF0;'CurveDownRightUpDownUp'
 00630A70    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A73    call        THashTable.Add
 00630A78    mov         ecx,0C5
 00630A7D    mov         edx,632D2C;'CurveDownLeft'
 00630A82    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A85    call        THashTable.Add
 00630A8A    mov         ecx,0C6
 00630A8F    mov         edx,632D54;'CurveDownLeftStop'
 00630A94    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630A97    call        THashTable.Add
 00630A9C    mov         ecx,0C7
 00630AA1    mov         edx,632D84;'CurveDownLeftUp'
 00630AA6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630AA9    call        THashTable.Add
 00630AAE    mov         ecx,0C8
 00630AB3    mov         edx,632DB0;'CurveDownLeftUpStop'
 00630AB8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630ABB    call        THashTable.Add
 00630AC0    mov         ecx,0C9
 00630AC5    mov         edx,632DE4;'CurveDownLeftUpDown'
 00630ACA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630ACD    call        THashTable.Add
 00630AD2    mov         ecx,0CA
 00630AD7    mov         edx,632E18;'CurveDownLeftUpDownStop'
 00630ADC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630ADF    call        THashTable.Add
 00630AE4    mov         ecx,0CB
 00630AE9    mov         edx,632E54;'CurveDownLeftUpDownLeft'
 00630AEE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630AF1    call        THashTable.Add
 00630AF6    mov         ecx,0CC
 00630AFB    mov         edx,632E90;'CurveDownLeftUpDownLeftStop'
 00630B00    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B03    call        THashTable.Add
 00630B08    mov         ecx,0CD
 00630B0D    mov         edx,632ED4;'CurveDownLeftUpDownLeftUp'
 00630B12    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B15    call        THashTable.Add
 00630B1A    mov         ecx,0CE
 00630B1F    mov         edx,632F14;'CurveDownLeftUpDownUp'
 00630B24    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B27    call        THashTable.Add
 00630B2C    mov         ecx,0D1
 00630B31    mov         edx,632F4C;'CurveUpRight'
 00630B36    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B39    call        THashTable.Add
 00630B3E    mov         ecx,0D2
 00630B43    mov         edx,632F74;'CurveUpRightStop'
 00630B48    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B4B    call        THashTable.Add
 00630B50    mov         ecx,0D3
 00630B55    mov         edx,632FA4;'CurveUpRightDown'
 00630B5A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B5D    call        THashTable.Add
 00630B62    mov         ecx,0D4
 00630B67    mov         edx,632FD4;'CurveUpRightDownStop'
 00630B6C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B6F    call        THashTable.Add
 00630B74    mov         ecx,0D5
 00630B79    mov         edx,63300C;'CurveUpRightDownUp'
 00630B7E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B81    call        THashTable.Add
 00630B86    mov         ecx,0D6
 00630B8B    mov         edx,633040;'CurveUpRightDownUpStop'
 00630B90    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630B93    call        THashTable.Add
 00630B98    mov         ecx,0D7
 00630B9D    mov         edx,63307C;'CurveUpRightDownUpRight'
 00630BA2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630BA5    call        THashTable.Add
 00630BAA    mov         ecx,0D8
 00630BAF    mov         edx,6330B8;'CurveUpRightDownUpRightStop'
 00630BB4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630BB7    call        THashTable.Add
 00630BBC    mov         ecx,0D9
 00630BC1    mov         edx,6330FC;'CurvyM'
 00630BC6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630BC9    call        THashTable.Add
 00630BCE    mov         ecx,0D9
 00630BD3    mov         edx,633118;'CurlyM'
 00630BD8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630BDB    call        THashTable.Add
 00630BE0    mov         ecx,0D9
 00630BE5    mov         edx,633134;'CurveUpRightDownUpRightDown'
 00630BEA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630BED    call        THashTable.Add
 00630BF2    mov         ecx,0DA
 00630BF7    mov         edx,633178;'CurveUpRightDownUpDown'
 00630BFC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630BFF    call        THashTable.Add
 00630C04    mov         ecx,0DB
 00630C09    mov         edx,6331B4;'CurveUpLeft'
 00630C0E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C11    call        THashTable.Add
 00630C16    mov         ecx,0DC
 00630C1B    mov         edx,6331D8;'CurveUpLeftStop'
 00630C20    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C23    call        THashTable.Add
 00630C28    mov         ecx,0DD
 00630C2D    mov         edx,633204;'CurveUpLeftDown'
 00630C32    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C35    call        THashTable.Add
 00630C3A    mov         ecx,0DE
 00630C3F    mov         edx,633230;'CurveUpLeftDownStop'
 00630C44    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C47    call        THashTable.Add
 00630C4C    mov         ecx,0DF
 00630C51    mov         edx,633264;'CurveUpLeftDownUp'
 00630C56    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C59    call        THashTable.Add
 00630C5E    mov         ecx,0E0
 00630C63    mov         edx,633294;'CurveUpLeftDownUpStop'
 00630C68    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C6B    call        THashTable.Add
 00630C70    mov         ecx,0E1
 00630C75    mov         edx,6332CC;'CurveUpLeftDownUpLeft'
 00630C7A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C7D    call        THashTable.Add
 00630C82    mov         ecx,0E2
 00630C87    mov         edx,633304;'CurveUpLeftDownUpLeftStop'
 00630C8C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630C8F    call        THashTable.Add
 00630C94    mov         ecx,0E3
 00630C99    mov         edx,633344;'CurveUpLeftDownUpLeftDown'
 00630C9E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630CA1    call        THashTable.Add
 00630CA6    mov         ecx,0E4
 00630CAB    mov         edx,633384;'CurveUpLeftDownUpDown'
 00630CB0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630CB3    call        THashTable.Add
 00630CB8    mov         ecx,0E5
 00630CBD    mov         edx,6333BC;'CurveLeftUp'
 00630CC2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630CC5    call        THashTable.Add
 00630CCA    mov         ecx,0E6
 00630CCF    mov         edx,6333E0;'CurveLeftUpStop'
 00630CD4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630CD7    call        THashTable.Add
 00630CDC    mov         ecx,0E7
 00630CE1    mov         edx,63340C;'CurveLeftUpRight'
 00630CE6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630CE9    call        THashTable.Add
 00630CEE    mov         ecx,0E8
 00630CF3    mov         edx,63343C;'CurveLeftUpRightStop'
 00630CF8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630CFB    call        THashTable.Add
 00630D00    mov         ecx,0E9
 00630D05    mov         edx,633474;'CurveLeftUpRightLeft'
 00630D0A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D0D    call        THashTable.Add
 00630D12    mov         ecx,0EA
 00630D17    mov         edx,6334AC;'CurveLeftUpRightLeftStop'
 00630D1C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D1F    call        THashTable.Add
 00630D24    mov         ecx,0EB
 00630D29    mov         edx,6334EC;'CurveLeftUpRightLeftUp'
 00630D2E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D31    call        THashTable.Add
 00630D36    mov         ecx,0EC
 00630D3B    mov         edx,633528;'CurveLeftUpRightLeftUpStop'
 00630D40    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D43    call        THashTable.Add
 00630D48    mov         ecx,0ED
 00630D4D    mov         edx,63356C;'CurveLeftUpRightLeftUpRight'
 00630D52    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D55    call        THashTable.Add
 00630D5A    mov         ecx,0EE
 00630D5F    mov         edx,6335B0;'CurveLeftUpRightLeftRight'
 00630D64    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D67    call        THashTable.Add
 00630D6C    mov         ecx,0EF
 00630D71    mov         edx,6335F0;'CurveLeftDown'
 00630D76    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D79    call        THashTable.Add
 00630D7E    mov         ecx,0F0
 00630D83    mov         edx,633618;'CurveLeftDownStop'
 00630D88    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D8B    call        THashTable.Add
 00630D90    mov         ecx,0F1
 00630D95    mov         edx,633648;'CurveLeftDownRight'
 00630D9A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630D9D    call        THashTable.Add
 00630DA2    mov         ecx,0F2
 00630DA7    mov         edx,63367C;'CurveLeftDownRightStop'
 00630DAC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630DAF    call        THashTable.Add
 00630DB4    mov         ecx,0F3
 00630DB9    mov         edx,6336B8;'CurveLeftDownRightLeft'
 00630DBE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630DC1    call        THashTable.Add
 00630DC6    mov         ecx,0F4
 00630DCB    mov         edx,6336F4;'CurveLeftDownRightLeftStop'
 00630DD0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630DD3    call        THashTable.Add
 00630DD8    mov         ecx,0F5
 00630DDD    mov         edx,633738;'CurveLeftDownRightLeftDown'
 00630DE2    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630DE5    call        THashTable.Add
 00630DEA    mov         ecx,0F6
 00630DEF    mov         edx,63377C;'CurveLeftDownRightLeftDownStop'
 00630DF4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630DF7    call        THashTable.Add
 00630DFC    mov         ecx,0F7
 00630E01    mov         edx,6337C8;'CurvyE'
 00630E06    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E09    call        THashTable.Add
 00630E0E    mov         ecx,0F7
 00630E13    mov         edx,6337E4;'CurlyE'
 00630E18    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E1B    call        THashTable.Add
 00630E20    mov         ecx,0F7
 00630E25    mov         edx,633800;'CurveLeftDownRightLeftDownRight'
 00630E2A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E2D    call        THashTable.Add
 00630E32    mov         ecx,0F8
 00630E37    mov         edx,63384C;'CurveLeftDownRightLeftRight'
 00630E3C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E3F    call        THashTable.Add
 00630E44    mov         ecx,0F9
 00630E49    mov         edx,633890;'CurveRightUp'
 00630E4E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E51    call        THashTable.Add
 00630E56    mov         ecx,0FA
 00630E5B    mov         edx,6338B8;'CurveRightUpStop'
 00630E60    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E63    call        THashTable.Add
 00630E68    mov         ecx,0FB
 00630E6D    mov         edx,6338E8;'CurveRightUpLeft'
 00630E72    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E75    call        THashTable.Add
 00630E7A    mov         ecx,0FC
 00630E7F    mov         edx,633918;'CurveRightUpLeftStop'
 00630E84    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E87    call        THashTable.Add
 00630E8C    mov         ecx,0FD
 00630E91    mov         edx,633950;'CurveRightUpLeftRight'
 00630E96    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630E99    call        THashTable.Add
 00630E9E    mov         ecx,0FE
 00630EA3    mov         edx,633988;'CurveRightUpLeftRightStop'
 00630EA8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630EAB    call        THashTable.Add
 00630EB0    mov         ecx,0FF
 00630EB5    mov         edx,6339C8;'CurveRightUpLeftRightUp'
 00630EBA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630EBD    call        THashTable.Add
 00630EC2    mov         ecx,100
 00630EC7    mov         edx,633A04;'CurveRightUpLeftRightUpStop'
 00630ECC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630ECF    call        THashTable.Add
 00630ED4    mov         ecx,101
 00630ED9    mov         edx,633A48;'CurveRightUpLeftRightUpLeft'
 00630EDE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630EE1    call        THashTable.Add
 00630EE6    mov         ecx,102
 00630EEB    mov         edx,633A8C;'CurveRightUpLeftRightLeft'
 00630EF0    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630EF3    call        THashTable.Add
 00630EF8    mov         ecx,103
 00630EFD    mov         edx,633ACC;'CurveRightDown'
 00630F02    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F05    call        THashTable.Add
 00630F0A    mov         ecx,104
 00630F0F    mov         edx,633AF8;'CurveRightDownStop'
 00630F14    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F17    call        THashTable.Add
 00630F1C    mov         ecx,105
 00630F21    mov         edx,633B2C;'CurveRightDownLeft'
 00630F26    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F29    call        THashTable.Add
 00630F2E    mov         ecx,106
 00630F33    mov         edx,633B60;'CurveRightDownLeftStop'
 00630F38    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F3B    call        THashTable.Add
 00630F40    mov         ecx,107
 00630F45    mov         edx,633B9C;'CurveRightDownLeftRight'
 00630F4A    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F4D    call        THashTable.Add
 00630F52    mov         ecx,108
 00630F57    mov         edx,633BD8;'CurveRightDownLeftRightStop'
 00630F5C    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F5F    call        THashTable.Add
 00630F64    mov         ecx,109
 00630F69    mov         edx,633C1C;'CurveRightDownLeftRightDown'
 00630F6E    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F71    call        THashTable.Add
 00630F76    mov         ecx,10A
 00630F7B    mov         edx,633C60;'CurveRightDownLeftRightDownStop'
 00630F80    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F83    call        THashTable.Add
 00630F88    mov         ecx,10B
 00630F8D    mov         edx,633CAC;'Curvy3'
 00630F92    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630F95    call        THashTable.Add
 00630F9A    mov         ecx,10B
 00630F9F    mov         edx,633CC8;'Curly3'
 00630FA4    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630FA7    call        THashTable.Add
 00630FAC    mov         ecx,10B
 00630FB1    mov         edx,633CE4;'CurveRightDownLeftRightDownLeft'
 00630FB6    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630FB9    call        THashTable.Add
 00630FBE    mov         ecx,10C
 00630FC3    mov         edx,633D30;'CurveRightDownLeftRightLeft'
 00630FC8    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630FCB    call        THashTable.Add
 00630FD0    mov         ecx,0CF
 00630FD5    mov         edx,633D74;'CircleAnticlockwise'
 00630FDA    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630FDD    call        THashTable.Add
 00630FE2    mov         ecx,0CF
 00630FE7    mov         edx,633DA8;'CircleCounterClockwise'
 00630FEC    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00630FEF    call        THashTable.Add
 00630FF4    mov         ecx,0D0
 00630FF9    mov         edx,633DE4;'CircleClockwise'
 00630FFE    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00631001    call        THashTable.Add
 00631006    pop         ebx
 00631007    ret
*}
end;

//00633E04
procedure TModuleSixaxis.ClearRead;
begin
{*
 00633E04    call        TPieModule.ClearRead
 00633E09    ret
*}
end;

//00633E0C
constructor TModuleSixaxis.Create;
begin
{*
 00633E0C    push        ebx
 00633E0D    push        esi
 00633E0E    test        dl,dl
>00633E10    je          00633E1A
 00633E12    add         esp,0FFFFFFF0
 00633E15    call        @ClassCreate
 00633E1A    mov         ebx,edx
 00633E1C    mov         esi,eax
 00633E1E    push        633E60;'Sixaxes'
 00633E23    push        633E7C;'DualShock3'
 00633E28    push        0
 00633E2A    push        0
 00633E2C    mov         ecx,633EA0;'Sixaxis'
 00633E31    xor         edx,edx
 00633E33    mov         eax,esi
 00633E35    call        005E4830
 00633E3A    mov         eax,esi
 00633E3C    test        bl,bl
>00633E3E    je          00633E4F
 00633E40    call        @AfterConstruction
 00633E45    pop         dword ptr fs:[0]
 00633E4C    add         esp,0C
 00633E4F    mov         eax,esi
 00633E51    pop         esi
 00633E52    pop         ebx
 00633E53    ret
*}
end;

//00633EB0
function TModuleSixaxis.CreateValue(Identifier:string):TExpression;
begin
{*
 00633EB0    push        ebp
 00633EB1    mov         ebp,esp
 00633EB3    push        ecx
 00633EB4    push        ebx
 00633EB5    mov         dword ptr [ebp-4],edx
 00633EB8    mov         ebx,eax
 00633EBA    mov         eax,dword ptr [ebp-4]
 00633EBD    call        @UStrAddRef
 00633EC2    xor         eax,eax
 00633EC4    push        ebp
 00633EC5    push        633EF4
 00633ECA    push        dword ptr fs:[eax]
 00633ECD    mov         dword ptr fs:[eax],esp
 00633ED0    mov         byte ptr [ebx+24],1;TModuleSixaxis.Used:Boolean
 00633ED4    mov         eax,dword ptr [ebp-4]
 00633ED7    call        0062D1E4
 00633EDC    mov         ebx,eax
 00633EDE    xor         eax,eax
 00633EE0    pop         edx
 00633EE1    pop         ecx
 00633EE2    pop         ecx
 00633EE3    mov         dword ptr fs:[eax],edx
 00633EE6    push        633EFB
 00633EEB    lea         eax,[ebp-4]
 00633EEE    call        @UStrClr
 00633EF3    ret
>00633EF4    jmp         @HandleFinally
>00633EF9    jmp         00633EEB
 00633EFB    mov         eax,ebx
 00633EFD    pop         ebx
 00633EFE    pop         ecx
 00633EFF    pop         ebp
 00633F00    ret
*}
end;

//00633F04
function TModuleSixaxis.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 00633F04    push        ebp
 00633F05    mov         ebp,esp
 00633F07    push        ecx
 00633F08    push        ebx
 00633F09    mov         dword ptr [ebp-4],edx
 00633F0C    mov         ebx,eax
 00633F0E    mov         eax,dword ptr [ebp-4]
 00633F11    call        @UStrAddRef
 00633F16    xor         eax,eax
 00633F18    push        ebp
 00633F19    push        633F50
 00633F1E    push        dword ptr fs:[eax]
 00633F21    mov         dword ptr fs:[eax],esp
 00633F24    mov         edx,dword ptr [ebp-4]
 00633F27    mov         eax,dword ptr [ebx+1C];TModuleSixaxis.Fields:THashTable
 00633F2A    call        THashTable.Get
 00633F2F    sub         eax,1
>00633F32    jae         00633F38
 00633F34    xor         ebx,ebx
>00633F36    jmp         00633F3A
 00633F38    mov         bl,9
 00633F3A    xor         eax,eax
 00633F3C    pop         edx
 00633F3D    pop         ecx
 00633F3E    pop         ecx
 00633F3F    mov         dword ptr fs:[eax],edx
 00633F42    push        633F57
 00633F47    lea         eax,[ebp-4]
 00633F4A    call        @UStrClr
 00633F4F    ret
>00633F50    jmp         @HandleFinally
>00633F55    jmp         00633F47
 00633F57    mov         eax,ebx
 00633F59    pop         ebx
 00633F5A    pop         ecx
 00633F5B    pop         ebp
 00633F5C    ret
*}
end;

//00633F60
function TModuleSixaxis.GetGoodFields:TStringList;
begin
{*
 00633F60    push        ebx
 00633F61    mov         dl,1
 00633F63    mov         eax,[0043C7BC];TStringList
 00633F68    call        TStringList.Create;TStringList.Create
 00633F6D    mov         ebx,eax
 00633F6F    mov         edx,634178;'Circle'
 00633F74    mov         eax,ebx
 00633F76    mov         ecx,dword ptr [eax]
 00633F78    call        dword ptr [ecx+38];TStringList.Add
 00633F7B    mov         edx,634194;'Cross'
 00633F80    mov         eax,ebx
 00633F82    mov         ecx,dword ptr [eax]
 00633F84    call        dword ptr [ecx+38];TStringList.Add
 00633F87    mov         edx,6341AC;'Square'
 00633F8C    mov         eax,ebx
 00633F8E    mov         ecx,dword ptr [eax]
 00633F90    call        dword ptr [ecx+38];TStringList.Add
 00633F93    mov         edx,6341C8;'Triangle'
 00633F98    mov         eax,ebx
 00633F9A    mov         ecx,dword ptr [eax]
 00633F9C    call        dword ptr [ecx+38];TStringList.Add
 00633F9F    mov         edx,6341E8;'Select'
 00633FA4    mov         eax,ebx
 00633FA6    mov         ecx,dword ptr [eax]
 00633FA8    call        dword ptr [ecx+38];TStringList.Add
 00633FAB    mov         edx,634204;'Start'
 00633FB0    mov         eax,ebx
 00633FB2    mov         ecx,dword ptr [eax]
 00633FB4    call        dword ptr [ecx+38];TStringList.Add
 00633FB7    mov         edx,63421C;'PS'
 00633FBC    mov         eax,ebx
 00633FBE    mov         ecx,dword ptr [eax]
 00633FC0    call        dword ptr [ecx+38];TStringList.Add
 00633FC3    mov         edx,634230;'L1'
 00633FC8    mov         eax,ebx
 00633FCA    mov         ecx,dword ptr [eax]
 00633FCC    call        dword ptr [ecx+38];TStringList.Add
 00633FCF    mov         edx,634244;'L2'
 00633FD4    mov         eax,ebx
 00633FD6    mov         ecx,dword ptr [eax]
 00633FD8    call        dword ptr [ecx+38];TStringList.Add
 00633FDB    mov         edx,634258;'L3'
 00633FE0    mov         eax,ebx
 00633FE2    mov         ecx,dword ptr [eax]
 00633FE4    call        dword ptr [ecx+38];TStringList.Add
 00633FE7    mov         edx,63426C;'R1'
 00633FEC    mov         eax,ebx
 00633FEE    mov         ecx,dword ptr [eax]
 00633FF0    call        dword ptr [ecx+38];TStringList.Add
 00633FF3    mov         edx,634280;'R2'
 00633FF8    mov         eax,ebx
 00633FFA    mov         ecx,dword ptr [eax]
 00633FFC    call        dword ptr [ecx+38];TStringList.Add
 00633FFF    mov         edx,634294;'R3'
 00634004    mov         eax,ebx
 00634006    mov         ecx,dword ptr [eax]
 00634008    call        dword ptr [ecx+38];TStringList.Add
 0063400B    mov         edx,6342A8;'Up'
 00634010    mov         eax,ebx
 00634012    mov         ecx,dword ptr [eax]
 00634014    call        dword ptr [ecx+38];TStringList.Add
 00634017    mov         edx,6342BC;'Down'
 0063401C    mov         eax,ebx
 0063401E    mov         ecx,dword ptr [eax]
 00634020    call        dword ptr [ecx+38];TStringList.Add
 00634023    mov         edx,6342D4;'Left'
 00634028    mov         eax,ebx
 0063402A    mov         ecx,dword ptr [eax]
 0063402C    call        dword ptr [ecx+38];TStringList.Add
 0063402F    mov         edx,6342EC;'Right'
 00634034    mov         eax,ebx
 00634036    mov         ecx,dword ptr [eax]
 00634038    call        dword ptr [ecx+38];TStringList.Add
 0063403B    mov         edx,634304;'Joy1x'
 00634040    mov         eax,ebx
 00634042    mov         ecx,dword ptr [eax]
 00634044    call        dword ptr [ecx+38];TStringList.Add
 00634047    mov         edx,63431C;'Joy1y'
 0063404C    mov         eax,ebx
 0063404E    mov         ecx,dword ptr [eax]
 00634050    call        dword ptr [ecx+38];TStringList.Add
 00634053    mov         edx,634334;'Joy2x'
 00634058    mov         eax,ebx
 0063405A    mov         ecx,dword ptr [eax]
 0063405C    call        dword ptr [ecx+38];TStringList.Add
 0063405F    mov         edx,63434C;'Joy2y'
 00634064    mov         eax,ebx
 00634066    mov         ecx,dword ptr [eax]
 00634068    call        dword ptr [ecx+38];TStringList.Add
 0063406B    mov         edx,634364;'DPadx'
 00634070    mov         eax,ebx
 00634072    mov         ecx,dword ptr [eax]
 00634074    call        dword ptr [ecx+38];TStringList.Add
 00634077    mov         edx,63437C;'DPady'
 0063407C    mov         eax,ebx
 0063407E    mov         ecx,dword ptr [eax]
 00634080    call        dword ptr [ecx+38];TStringList.Add
 00634083    mov         edx,634394;'Pitch'
 00634088    mov         eax,ebx
 0063408A    mov         ecx,dword ptr [eax]
 0063408C    call        dword ptr [ecx+38];TStringList.Add
 0063408F    mov         edx,6343AC;'Roll'
 00634094    mov         eax,ebx
 00634096    mov         ecx,dword ptr [eax]
 00634098    call        dword ptr [ecx+38];TStringList.Add
 0063409B    mov         edx,6343C4;'SmoothPitch'
 006340A0    mov         eax,ebx
 006340A2    mov         ecx,dword ptr [eax]
 006340A4    call        dword ptr [ecx+38];TStringList.Add
 006340A7    mov         edx,6343E8;'SmoothRoll'
 006340AC    mov         eax,ebx
 006340AE    mov         ecx,dword ptr [eax]
 006340B0    call        dword ptr [ecx+38];TStringList.Add
 006340B3    mov         edx,63440C;'gx'
 006340B8    mov         eax,ebx
 006340BA    mov         ecx,dword ptr [eax]
 006340BC    call        dword ptr [ecx+38];TStringList.Add
 006340BF    mov         edx,634420;'gy'
 006340C4    mov         eax,ebx
 006340C6    mov         ecx,dword ptr [eax]
 006340C8    call        dword ptr [ecx+38];TStringList.Add
 006340CB    mov         edx,634434;'gz'
 006340D0    mov         eax,ebx
 006340D2    mov         ecx,dword ptr [eax]
 006340D4    call        dword ptr [ecx+38];TStringList.Add
 006340D7    mov         edx,634448;'UpAnalog'
 006340DC    mov         eax,ebx
 006340DE    mov         ecx,dword ptr [eax]
 006340E0    call        dword ptr [ecx+38];TStringList.Add
 006340E3    mov         edx,634468;'DownAnalog'
 006340E8    mov         eax,ebx
 006340EA    mov         ecx,dword ptr [eax]
 006340EC    call        dword ptr [ecx+38];TStringList.Add
 006340EF    mov         edx,63448C;'LeftAnalog'
 006340F4    mov         eax,ebx
 006340F6    mov         ecx,dword ptr [eax]
 006340F8    call        dword ptr [ecx+38];TStringList.Add
 006340FB    mov         edx,6344B0;'RightAnalog'
 00634100    mov         eax,ebx
 00634102    mov         ecx,dword ptr [eax]
 00634104    call        dword ptr [ecx+38];TStringList.Add
 00634107    mov         edx,6344D4;'CircleAnalog'
 0063410C    mov         eax,ebx
 0063410E    mov         ecx,dword ptr [eax]
 00634110    call        dword ptr [ecx+38];TStringList.Add
 00634113    mov         edx,6344FC;'CrossAnalog'
 00634118    mov         eax,ebx
 0063411A    mov         ecx,dword ptr [eax]
 0063411C    call        dword ptr [ecx+38];TStringList.Add
 0063411F    mov         edx,634520;'SquareAnalog'
 00634124    mov         eax,ebx
 00634126    mov         ecx,dword ptr [eax]
 00634128    call        dword ptr [ecx+38];TStringList.Add
 0063412B    mov         edx,634548;'TriangleAnalog'
 00634130    mov         eax,ebx
 00634132    mov         ecx,dword ptr [eax]
 00634134    call        dword ptr [ecx+38];TStringList.Add
 00634137    mov         edx,634574;'L1Analog'
 0063413C    mov         eax,ebx
 0063413E    mov         ecx,dword ptr [eax]
 00634140    call        dword ptr [ecx+38];TStringList.Add
 00634143    mov         edx,634594;'L2Analog'
 00634148    mov         eax,ebx
 0063414A    mov         ecx,dword ptr [eax]
 0063414C    call        dword ptr [ecx+38];TStringList.Add
 0063414F    mov         edx,6345B4;'R1Analog'
 00634154    mov         eax,ebx
 00634156    mov         ecx,dword ptr [eax]
 00634158    call        dword ptr [ecx+38];TStringList.Add
 0063415B    mov         edx,6345D4;'R2Analog'
 00634160    mov         eax,ebx
 00634162    mov         ecx,dword ptr [eax]
 00634164    call        dword ptr [ecx+38];TStringList.Add
 00634167    mov         eax,ebx
 00634169    pop         ebx
 0063416A    ret
*}
end;

//006345E8
procedure TModuleSixaxis.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006345E8    push        ebp
 006345E9    mov         ebp,esp
 006345EB    mov         byte ptr [edx],1
 006345EE    mov         dword ptr [ecx],1
 006345F4    mov         eax,dword ptr [ebp+8]
 006345F7    mov         dword ptr [eax],14
 006345FD    pop         ebp
 006345FE    ret         4
*}
end;

//00634604
procedure TModuleSixaxis.MonitorFrame;
begin
{*
 00634604    push        ebp
 00634605    mov         ebp,esp
 00634607    mov         ecx,3C
 0063460C    push        0
 0063460E    push        0
 00634610    dec         ecx
>00634611    jne         0063460C
 00634613    push        ebx
 00634614    push        esi
 00634615    push        edi
 00634616    mov         esi,eax
 00634618    xor         eax,eax
 0063461A    push        ebp
 0063461B    push        63597A
 00634620    push        dword ptr fs:[eax]
 00634623    mov         dword ptr fs:[eax],esp
 00634626    cmp         byte ptr [esi+28],0;TModuleSixaxis.Monitoring:Boolean
>0063462A    je          00635947
 00634630    mov         eax,esi
 00634632    mov         edx,dword ptr [eax]
 00634634    call        dword ptr [edx+3C];TModuleSixaxis.Read
 00634637    test        al,al
>00634639    je          00635947
 0063463F    call        0074BF10
 00634644    mov         dword ptr [ebp-8],eax
 00634647    mov         eax,dword ptr [ebp-8]
 0063464A    mov         eax,dword ptr [eax+60]
 0063464D    mov         eax,dword ptr [eax+8]
 00634650    test        eax,eax
>00634652    jle         00635940
 00634658    mov         dword ptr [ebp-0C],eax
 0063465B    mov         edi,1
 00634660    mov         edx,edi
 00634662    mov         eax,dword ptr [ebp-8]
 00634665    call        TWiimoteManager.GetSixaxis
 0063466A    mov         ebx,eax
 0063466C    test        ebx,ebx
>0063466E    je          00635936
 00634674    cmp         edi,1
>00634677    jne         00634688
 00634679    lea         eax,[ebp-4]
 0063467C    mov         edx,635994;'Sixaxis.'
 00634681    call        @UStrLAsg
>00634686    jmp         006346AC
 00634688    push        6359B4;'Sixaxis'
 0063468D    lea         edx,[ebp-10]
 00634690    mov         eax,edi
 00634692    call        IntToStr
 00634697    push        dword ptr [ebp-10]
 0063469A    push        6359D0;'.'
 0063469F    lea         eax,[ebp-4]
 006346A2    mov         edx,3
 006346A7    call        @UStrCatN
 006346AC    mov         eax,ebx
 006346AE    call        TPS3ControllerObject.Up
 006346B3    test        al,al
>006346B5    je          006346D1
 006346B7    lea         eax,[ebp-14]
 006346BA    mov         ecx,6359E0;'Up'
 006346BF    mov         edx,dword ptr [ebp-4]
 006346C2    call        @UStrCat3
 006346C7    mov         edx,dword ptr [ebp-14]
 006346CA    mov         eax,esi
 006346CC    call        005E4F20
 006346D1    mov         eax,ebx
 006346D3    call        TPS3ControllerObject.Down
 006346D8    test        al,al
>006346DA    je          006346F6
 006346DC    lea         eax,[ebp-18]
 006346DF    mov         ecx,6359F4;'Down'
 006346E4    mov         edx,dword ptr [ebp-4]
 006346E7    call        @UStrCat3
 006346EC    mov         edx,dword ptr [ebp-18]
 006346EF    mov         eax,esi
 006346F1    call        005E4F20
 006346F6    mov         eax,ebx
 006346F8    call        TPS3ControllerObject.Left
 006346FD    test        al,al
>006346FF    je          0063471B
 00634701    lea         eax,[ebp-1C]
 00634704    mov         ecx,635A0C;'Left'
 00634709    mov         edx,dword ptr [ebp-4]
 0063470C    call        @UStrCat3
 00634711    mov         edx,dword ptr [ebp-1C]
 00634714    mov         eax,esi
 00634716    call        005E4F20
 0063471B    mov         eax,ebx
 0063471D    call        TPS3ControllerObject.Right
 00634722    test        al,al
>00634724    je          00634740
 00634726    lea         eax,[ebp-20]
 00634729    mov         ecx,635A24;'Right'
 0063472E    mov         edx,dword ptr [ebp-4]
 00634731    call        @UStrCat3
 00634736    mov         edx,dword ptr [ebp-20]
 00634739    mov         eax,esi
 0063473B    call        005E4F20
 00634740    mov         eax,ebx
 00634742    call        TPS3ControllerObject.L1
 00634747    test        al,al
>00634749    je          00634765
 0063474B    lea         eax,[ebp-24]
 0063474E    mov         ecx,635A3C;'L1'
 00634753    mov         edx,dword ptr [ebp-4]
 00634756    call        @UStrCat3
 0063475B    mov         edx,dword ptr [ebp-24]
 0063475E    mov         eax,esi
 00634760    call        005E4F20
 00634765    mov         eax,ebx
 00634767    call        TPS3ControllerObject.L2
 0063476C    test        al,al
>0063476E    je          0063478A
 00634770    lea         eax,[ebp-28]
 00634773    mov         ecx,635A50;'L2'
 00634778    mov         edx,dword ptr [ebp-4]
 0063477B    call        @UStrCat3
 00634780    mov         edx,dword ptr [ebp-28]
 00634783    mov         eax,esi
 00634785    call        005E4F20
 0063478A    mov         eax,ebx
 0063478C    call        TPS3ControllerObject.L3
 00634791    test        al,al
>00634793    je          006347AF
 00634795    lea         eax,[ebp-2C]
 00634798    mov         ecx,635A64;'L3'
 0063479D    mov         edx,dword ptr [ebp-4]
 006347A0    call        @UStrCat3
 006347A5    mov         edx,dword ptr [ebp-2C]
 006347A8    mov         eax,esi
 006347AA    call        005E4F20
 006347AF    mov         eax,ebx
 006347B1    call        TPS3ControllerObject.Select
 006347B6    test        al,al
>006347B8    je          006347D4
 006347BA    lea         eax,[ebp-30]
 006347BD    mov         ecx,635A78;'Select'
 006347C2    mov         edx,dword ptr [ebp-4]
 006347C5    call        @UStrCat3
 006347CA    mov         edx,dword ptr [ebp-30]
 006347CD    mov         eax,esi
 006347CF    call        005E4F20
 006347D4    mov         eax,ebx
 006347D6    call        TPS3ControllerObject.PS
 006347DB    test        al,al
>006347DD    je          006347F9
 006347DF    lea         eax,[ebp-34]
 006347E2    mov         ecx,635A94;'PS'
 006347E7    mov         edx,dword ptr [ebp-4]
 006347EA    call        @UStrCat3
 006347EF    mov         edx,dword ptr [ebp-34]
 006347F2    mov         eax,esi
 006347F4    call        005E4F20
 006347F9    mov         eax,ebx
 006347FB    call        TPS3ControllerObject.Start
 00634800    test        al,al
>00634802    je          0063481E
 00634804    lea         eax,[ebp-38]
 00634807    mov         ecx,635AA8;'Start'
 0063480C    mov         edx,dword ptr [ebp-4]
 0063480F    call        @UStrCat3
 00634814    mov         edx,dword ptr [ebp-38]
 00634817    mov         eax,esi
 00634819    call        005E4F20
 0063481E    mov         eax,ebx
 00634820    call        TPS3ControllerObject.R1
 00634825    test        al,al
>00634827    je          00634843
 00634829    lea         eax,[ebp-3C]
 0063482C    mov         ecx,635AC0;'R1'
 00634831    mov         edx,dword ptr [ebp-4]
 00634834    call        @UStrCat3
 00634839    mov         edx,dword ptr [ebp-3C]
 0063483C    mov         eax,esi
 0063483E    call        005E4F20
 00634843    mov         eax,ebx
 00634845    call        TPS3ControllerObject.R2
 0063484A    test        al,al
>0063484C    je          00634868
 0063484E    lea         eax,[ebp-40]
 00634851    mov         ecx,635AD4;'R2'
 00634856    mov         edx,dword ptr [ebp-4]
 00634859    call        @UStrCat3
 0063485E    mov         edx,dword ptr [ebp-40]
 00634861    mov         eax,esi
 00634863    call        005E4F20
 00634868    mov         eax,ebx
 0063486A    call        TPS3ControllerObject.R3
 0063486F    test        al,al
>00634871    je          0063488D
 00634873    lea         eax,[ebp-44]
 00634876    mov         ecx,635AE8;'R3'
 0063487B    mov         edx,dword ptr [ebp-4]
 0063487E    call        @UStrCat3
 00634883    mov         edx,dword ptr [ebp-44]
 00634886    mov         eax,esi
 00634888    call        005E4F20
 0063488D    mov         eax,ebx
 0063488F    call        TPS3ControllerObject.Circle
 00634894    test        al,al
>00634896    je          006348B2
 00634898    lea         eax,[ebp-48]
 0063489B    mov         ecx,635AFC;'Circle'
 006348A0    mov         edx,dword ptr [ebp-4]
 006348A3    call        @UStrCat3
 006348A8    mov         edx,dword ptr [ebp-48]
 006348AB    mov         eax,esi
 006348AD    call        005E4F20
 006348B2    mov         eax,ebx
 006348B4    call        TPS3ControllerObject.Cross
 006348B9    test        al,al
>006348BB    je          006348D7
 006348BD    lea         eax,[ebp-4C]
 006348C0    mov         ecx,635B18;'Cross'
 006348C5    mov         edx,dword ptr [ebp-4]
 006348C8    call        @UStrCat3
 006348CD    mov         edx,dword ptr [ebp-4C]
 006348D0    mov         eax,esi
 006348D2    call        005E4F20
 006348D7    mov         eax,ebx
 006348D9    call        TPS3ControllerObject.Square
 006348DE    test        al,al
>006348E0    je          006348FC
 006348E2    lea         eax,[ebp-50]
 006348E5    mov         ecx,635B30;'Square'
 006348EA    mov         edx,dword ptr [ebp-4]
 006348ED    call        @UStrCat3
 006348F2    mov         edx,dword ptr [ebp-50]
 006348F5    mov         eax,esi
 006348F7    call        005E4F20
 006348FC    mov         eax,ebx
 006348FE    call        TPS3ControllerObject.Triangle
 00634903    test        al,al
>00634905    je          00634921
 00634907    lea         eax,[ebp-54]
 0063490A    mov         ecx,635B4C;'Triangle'
 0063490F    mov         edx,dword ptr [ebp-4]
 00634912    call        @UStrCat3
 00634917    mov         edx,dword ptr [ebp-54]
 0063491A    mov         eax,esi
 0063491C    call        005E4F20
 00634921    cmp         byte ptr [ebx+41E],0;TSixaxisObject.GestureState:TGestureState
>00634928    je          00634934
 0063492A    mov         edx,dword ptr [ebp-4]
 0063492D    mov         eax,esi
 0063492F    call        005E5190
 00634934    movzx       eax,byte ptr [ebx+42D];TSixaxisObject.WaggleGesture:TWaggleGesture
 0063493B    cmp         eax,46
>0063493E    ja          0063543F
 00634944    jmp         dword ptr [eax*4+63494B]
 00634944    dd          0063545F
 00634944    dd          00634A6C
 00634944    dd          00634A8B
 00634944    dd          00634AAA
 00634944    dd          00634AC9
 00634944    dd          00634AE8
 00634944    dd          00634D0E
 00634944    dd          00634D33
 00634944    dd          00634D58
 00634944    dd          00634D7D
 00634944    dd          00634DA2
 00634944    dd          00634DC7
 00634944    dd          00634DEC
 00634944    dd          00634E11
 00634944    dd          00634E36
 00634944    dd          00634E5B
 00634944    dd          00634E80
 00634944    dd          00634EA5
 00634944    dd          00634B07
 00634944    dd          00634B26
 00634944    dd          00634B45
 00634944    dd          00634B64
 00634944    dd          00634B83
 00634944    dd          00634ECA
 00634944    dd          00634EEF
 00634944    dd          00634F14
 00634944    dd          00634F39
 00634944    dd          00634F5E
 00634944    dd          00634F83
 00634944    dd          00634FA8
 00634944    dd          00634FCD
 00634944    dd          00634FF2
 00634944    dd          00635017
 00634944    dd          0063503C
 00634944    dd          00635061
 00634944    dd          00634BA2
 00634944    dd          00634BC1
 00634944    dd          00634BE6
 00634944    dd          00634C0B
 00634944    dd          00634C30
 00634944    dd          00635086
 00634944    dd          006350AB
 00634944    dd          006350D0
 00634944    dd          006350F5
 00634944    dd          0063511A
 00634944    dd          0063513F
 00634944    dd          00635164
 00634944    dd          00635189
 00634944    dd          006351AE
 00634944    dd          006351D3
 00634944    dd          006351F8
 00634944    dd          0063521D
 00634944    dd          00634C55
 00634944    dd          00634C7A
 00634944    dd          00634C9F
 00634944    dd          00634CC4
 00634944    dd          00634CE9
 00634944    dd          00635242
 00634944    dd          00635267
 00634944    dd          0063528C
 00634944    dd          006352B1
 00634944    dd          006352D6
 00634944    dd          006352FB
 00634944    dd          00635320
 00634944    dd          00635345
 00634944    dd          0063536A
 00634944    dd          0063538F
 00634944    dd          006353B4
 00634944    dd          006353D9
 00634944    dd          006353FB
 00634944    dd          0063541D
>00634A67    jmp         0063545F
 00634A6C    lea         eax,[ebp-58]
 00634A6F    mov         ecx,635B6C;'SwingDownStop'
 00634A74    mov         edx,dword ptr [ebp-4]
 00634A77    call        @UStrCat3
 00634A7C    mov         edx,dword ptr [ebp-58]
 00634A7F    mov         eax,esi
 00634A81    call        005E51D8
>00634A86    jmp         0063545F
 00634A8B    lea         eax,[ebp-5C]
 00634A8E    mov         ecx,635B94;'SwingDownUpStop'
 00634A93    mov         edx,dword ptr [ebp-4]
 00634A96    call        @UStrCat3
 00634A9B    mov         edx,dword ptr [ebp-5C]
 00634A9E    mov         eax,esi
 00634AA0    call        005E51D8
>00634AA5    jmp         0063545F
 00634AAA    lea         eax,[ebp-60]
 00634AAD    mov         ecx,635BC0;'SwingDownUpDownStop'
 00634AB2    mov         edx,dword ptr [ebp-4]
 00634AB5    call        @UStrCat3
 00634ABA    mov         edx,dword ptr [ebp-60]
 00634ABD    mov         eax,esi
 00634ABF    call        005E51D8
>00634AC4    jmp         0063545F
 00634AC9    lea         eax,[ebp-64]
 00634ACC    mov         ecx,635BF4;'SwingDownUpDownUpStop'
 00634AD1    mov         edx,dword ptr [ebp-4]
 00634AD4    call        @UStrCat3
 00634AD9    mov         edx,dword ptr [ebp-64]
 00634ADC    mov         eax,esi
 00634ADE    call        005E51D8
>00634AE3    jmp         0063545F
 00634AE8    lea         eax,[ebp-68]
 00634AEB    mov         ecx,635C2C;'SwingDownUpDownUpDownStop'
 00634AF0    mov         edx,dword ptr [ebp-4]
 00634AF3    call        @UStrCat3
 00634AF8    mov         edx,dword ptr [ebp-68]
 00634AFB    mov         eax,esi
 00634AFD    call        005E51D8
>00634B02    jmp         0063545F
 00634B07    lea         eax,[ebp-6C]
 00634B0A    mov         ecx,635C6C;'SwingUpStop'
 00634B0F    mov         edx,dword ptr [ebp-4]
 00634B12    call        @UStrCat3
 00634B17    mov         edx,dword ptr [ebp-6C]
 00634B1A    mov         eax,esi
 00634B1C    call        005E51D8
>00634B21    jmp         0063545F
 00634B26    lea         eax,[ebp-70]
 00634B29    mov         ecx,635C90;'SwingUpDownStop'
 00634B2E    mov         edx,dword ptr [ebp-4]
 00634B31    call        @UStrCat3
 00634B36    mov         edx,dword ptr [ebp-70]
 00634B39    mov         eax,esi
 00634B3B    call        005E51D8
>00634B40    jmp         0063545F
 00634B45    lea         eax,[ebp-74]
 00634B48    mov         ecx,635CBC;'SwingUpDownUpStop'
 00634B4D    mov         edx,dword ptr [ebp-4]
 00634B50    call        @UStrCat3
 00634B55    mov         edx,dword ptr [ebp-74]
 00634B58    mov         eax,esi
 00634B5A    call        005E51D8
>00634B5F    jmp         0063545F
 00634B64    lea         eax,[ebp-78]
 00634B67    mov         ecx,635CEC;'SwingUpDownUpDownStop'
 00634B6C    mov         edx,dword ptr [ebp-4]
 00634B6F    call        @UStrCat3
 00634B74    mov         edx,dword ptr [ebp-78]
 00634B77    mov         eax,esi
 00634B79    call        005E51D8
>00634B7E    jmp         0063545F
 00634B83    lea         eax,[ebp-7C]
 00634B86    mov         ecx,635D24;'SwingUpDownUpDownUpStop'
 00634B8B    mov         edx,dword ptr [ebp-4]
 00634B8E    call        @UStrCat3
 00634B93    mov         edx,dword ptr [ebp-7C]
 00634B96    mov         eax,esi
 00634B98    call        005E51D8
>00634B9D    jmp         0063545F
 00634BA2    lea         eax,[ebp-80]
 00634BA5    mov         ecx,635D60;'SwingLeftStop'
 00634BAA    mov         edx,dword ptr [ebp-4]
 00634BAD    call        @UStrCat3
 00634BB2    mov         edx,dword ptr [ebp-80]
 00634BB5    mov         eax,esi
 00634BB7    call        005E51D8
>00634BBC    jmp         0063545F
 00634BC1    lea         eax,[ebp-84]
 00634BC7    mov         ecx,635D88;'SwingLeftRightStop'
 00634BCC    mov         edx,dword ptr [ebp-4]
 00634BCF    call        @UStrCat3
 00634BD4    mov         edx,dword ptr [ebp-84]
 00634BDA    mov         eax,esi
 00634BDC    call        005E51D8
>00634BE1    jmp         0063545F
 00634BE6    lea         eax,[ebp-88]
 00634BEC    mov         ecx,635DBC;'SwingLeftRightLeftStop'
 00634BF1    mov         edx,dword ptr [ebp-4]
 00634BF4    call        @UStrCat3
 00634BF9    mov         edx,dword ptr [ebp-88]
 00634BFF    mov         eax,esi
 00634C01    call        005E51D8
>00634C06    jmp         0063545F
 00634C0B    lea         eax,[ebp-8C]
 00634C11    mov         ecx,635DF8;'SwingLeftRightLeftRightStop'
 00634C16    mov         edx,dword ptr [ebp-4]
 00634C19    call        @UStrCat3
 00634C1E    mov         edx,dword ptr [ebp-8C]
 00634C24    mov         eax,esi
 00634C26    call        005E51D8
>00634C2B    jmp         0063545F
 00634C30    lea         eax,[ebp-90]
 00634C36    mov         ecx,635E3C;'SwingLeftRightLeftRightLeftStop'
 00634C3B    mov         edx,dword ptr [ebp-4]
 00634C3E    call        @UStrCat3
 00634C43    mov         edx,dword ptr [ebp-90]
 00634C49    mov         eax,esi
 00634C4B    call        005E51D8
>00634C50    jmp         0063545F
 00634C55    lea         eax,[ebp-94]
 00634C5B    mov         ecx,635E88;'SwingRightStop'
 00634C60    mov         edx,dword ptr [ebp-4]
 00634C63    call        @UStrCat3
 00634C68    mov         edx,dword ptr [ebp-94]
 00634C6E    mov         eax,esi
 00634C70    call        005E51D8
>00634C75    jmp         0063545F
 00634C7A    lea         eax,[ebp-98]
 00634C80    mov         ecx,635EB4;'SwingRightLeftStop'
 00634C85    mov         edx,dword ptr [ebp-4]
 00634C88    call        @UStrCat3
 00634C8D    mov         edx,dword ptr [ebp-98]
 00634C93    mov         eax,esi
 00634C95    call        005E51D8
>00634C9A    jmp         0063545F
 00634C9F    lea         eax,[ebp-9C]
 00634CA5    mov         ecx,635EE8;'SwingRightLeftRightStop'
 00634CAA    mov         edx,dword ptr [ebp-4]
 00634CAD    call        @UStrCat3
 00634CB2    mov         edx,dword ptr [ebp-9C]
 00634CB8    mov         eax,esi
 00634CBA    call        005E51D8
>00634CBF    jmp         0063545F
 00634CC4    lea         eax,[ebp-0A0]
 00634CCA    mov         ecx,635F24;'SwingRightLeftRightLeftStop'
 00634CCF    mov         edx,dword ptr [ebp-4]
 00634CD2    call        @UStrCat3
 00634CD7    mov         edx,dword ptr [ebp-0A0]
 00634CDD    mov         eax,esi
 00634CDF    call        005E51D8
>00634CE4    jmp         0063545F
 00634CE9    lea         eax,[ebp-0A4]
 00634CEF    mov         ecx,635F68;'SwingRightLeftRightLeftRightStop'
 00634CF4    mov         edx,dword ptr [ebp-4]
 00634CF7    call        @UStrCat3
 00634CFC    mov         edx,dword ptr [ebp-0A4]
 00634D02    mov         eax,esi
 00634D04    call        005E51D8
>00634D09    jmp         0063545F
 00634D0E    lea         eax,[ebp-0A8]
 00634D14    mov         ecx,635FB8;'CurveDownRight'
 00634D19    mov         edx,dword ptr [ebp-4]
 00634D1C    call        @UStrCat3
 00634D21    mov         edx,dword ptr [ebp-0A8]
 00634D27    mov         eax,esi
 00634D29    call        005E51D8
>00634D2E    jmp         0063545F
 00634D33    lea         eax,[ebp-0AC]
 00634D39    mov         ecx,635FE4;'CurveDownRightUp'
 00634D3E    mov         edx,dword ptr [ebp-4]
 00634D41    call        @UStrCat3
 00634D46    mov         edx,dword ptr [ebp-0AC]
 00634D4C    mov         eax,esi
 00634D4E    call        005E51D8
>00634D53    jmp         0063545F
 00634D58    lea         eax,[ebp-0B0]
 00634D5E    mov         ecx,636014;'CurveDownRightUpDown'
 00634D63    mov         edx,dword ptr [ebp-4]
 00634D66    call        @UStrCat3
 00634D6B    mov         edx,dword ptr [ebp-0B0]
 00634D71    mov         eax,esi
 00634D73    call        005E51D8
>00634D78    jmp         0063545F
 00634D7D    lea         eax,[ebp-0B4]
 00634D83    mov         ecx,63604C;'CurveDownRightUpDownUp'
 00634D88    mov         edx,dword ptr [ebp-4]
 00634D8B    call        @UStrCat3
 00634D90    mov         edx,dword ptr [ebp-0B4]
 00634D96    mov         eax,esi
 00634D98    call        005E51D8
>00634D9D    jmp         0063545F
 00634DA2    lea         eax,[ebp-0B8]
 00634DA8    mov         ecx,636088;'CurveDownRightUpDownRight'
 00634DAD    mov         edx,dword ptr [ebp-4]
 00634DB0    call        @UStrCat3
 00634DB5    mov         edx,dword ptr [ebp-0B8]
 00634DBB    mov         eax,esi
 00634DBD    call        005E51D8
>00634DC2    jmp         0063545F
 00634DC7    lea         eax,[ebp-0BC]
 00634DCD    mov         ecx,6360C8;'CurveDownRightUpDownRightUp'
 00634DD2    mov         edx,dword ptr [ebp-4]
 00634DD5    call        @UStrCat3
 00634DDA    mov         edx,dword ptr [ebp-0BC]
 00634DE0    mov         eax,esi
 00634DE2    call        005E51D8
>00634DE7    jmp         0063545F
 00634DEC    lea         eax,[ebp-0C0]
 00634DF2    mov         ecx,63610C;'CurveDownLeft'
 00634DF7    mov         edx,dword ptr [ebp-4]
 00634DFA    call        @UStrCat3
 00634DFF    mov         edx,dword ptr [ebp-0C0]
 00634E05    mov         eax,esi
 00634E07    call        005E51D8
>00634E0C    jmp         0063545F
 00634E11    lea         eax,[ebp-0C4]
 00634E17    mov         ecx,636134;'CurveDownLeftUp'
 00634E1C    mov         edx,dword ptr [ebp-4]
 00634E1F    call        @UStrCat3
 00634E24    mov         edx,dword ptr [ebp-0C4]
 00634E2A    mov         eax,esi
 00634E2C    call        005E51D8
>00634E31    jmp         0063545F
 00634E36    lea         eax,[ebp-0C8]
 00634E3C    mov         ecx,636160;'CurveDownLeftUpDown'
 00634E41    mov         edx,dword ptr [ebp-4]
 00634E44    call        @UStrCat3
 00634E49    mov         edx,dword ptr [ebp-0C8]
 00634E4F    mov         eax,esi
 00634E51    call        005E51D8
>00634E56    jmp         0063545F
 00634E5B    lea         eax,[ebp-0CC]
 00634E61    mov         ecx,636194;'CurveDownLeftUpDownUp'
 00634E66    mov         edx,dword ptr [ebp-4]
 00634E69    call        @UStrCat3
 00634E6E    mov         edx,dword ptr [ebp-0CC]
 00634E74    mov         eax,esi
 00634E76    call        005E51D8
>00634E7B    jmp         0063545F
 00634E80    lea         eax,[ebp-0D0]
 00634E86    mov         ecx,6361CC;'CurveDownLeftUpDownLeft'
 00634E8B    mov         edx,dword ptr [ebp-4]
 00634E8E    call        @UStrCat3
 00634E93    mov         edx,dword ptr [ebp-0D0]
 00634E99    mov         eax,esi
 00634E9B    call        005E51D8
>00634EA0    jmp         0063545F
 00634EA5    lea         eax,[ebp-0D4]
 00634EAB    mov         ecx,636208;'CurveDownLeftUpDownLeftUp'
 00634EB0    mov         edx,dword ptr [ebp-4]
 00634EB3    call        @UStrCat3
 00634EB8    mov         edx,dword ptr [ebp-0D4]
 00634EBE    mov         eax,esi
 00634EC0    call        005E51D8
>00634EC5    jmp         0063545F
 00634ECA    lea         eax,[ebp-0D8]
 00634ED0    mov         ecx,636248;'CurveUpRight'
 00634ED5    mov         edx,dword ptr [ebp-4]
 00634ED8    call        @UStrCat3
 00634EDD    mov         edx,dword ptr [ebp-0D8]
 00634EE3    mov         eax,esi
 00634EE5    call        005E51D8
>00634EEA    jmp         0063545F
 00634EEF    lea         eax,[ebp-0DC]
 00634EF5    mov         ecx,636270;'CurveUpRightDown'
 00634EFA    mov         edx,dword ptr [ebp-4]
 00634EFD    call        @UStrCat3
 00634F02    mov         edx,dword ptr [ebp-0DC]
 00634F08    mov         eax,esi
 00634F0A    call        005E51D8
>00634F0F    jmp         0063545F
 00634F14    lea         eax,[ebp-0E0]
 00634F1A    mov         ecx,6362A0;'CurveUpRightDownUp'
 00634F1F    mov         edx,dword ptr [ebp-4]
 00634F22    call        @UStrCat3
 00634F27    mov         edx,dword ptr [ebp-0E0]
 00634F2D    mov         eax,esi
 00634F2F    call        005E51D8
>00634F34    jmp         0063545F
 00634F39    lea         eax,[ebp-0E4]
 00634F3F    mov         ecx,6362D4;'CurveUpRightDownUpDown'
 00634F44    mov         edx,dword ptr [ebp-4]
 00634F47    call        @UStrCat3
 00634F4C    mov         edx,dword ptr [ebp-0E4]
 00634F52    mov         eax,esi
 00634F54    call        005E51D8
>00634F59    jmp         0063545F
 00634F5E    lea         eax,[ebp-0E8]
 00634F64    mov         ecx,636310;'CurveUpRightDownUpRight'
 00634F69    mov         edx,dword ptr [ebp-4]
 00634F6C    call        @UStrCat3
 00634F71    mov         edx,dword ptr [ebp-0E8]
 00634F77    mov         eax,esi
 00634F79    call        005E51D8
>00634F7E    jmp         0063545F
 00634F83    lea         eax,[ebp-0EC]
 00634F89    mov         ecx,63634C;'CurveUpRightDownUpRightDown'
 00634F8E    mov         edx,dword ptr [ebp-4]
 00634F91    call        @UStrCat3
 00634F96    mov         edx,dword ptr [ebp-0EC]
 00634F9C    mov         eax,esi
 00634F9E    call        005E51D8
>00634FA3    jmp         0063545F
 00634FA8    lea         eax,[ebp-0F0]
 00634FAE    mov         ecx,636390;'CurveUpLeft'
 00634FB3    mov         edx,dword ptr [ebp-4]
 00634FB6    call        @UStrCat3
 00634FBB    mov         edx,dword ptr [ebp-0F0]
 00634FC1    mov         eax,esi
 00634FC3    call        005E51D8
>00634FC8    jmp         0063545F
 00634FCD    lea         eax,[ebp-0F4]
 00634FD3    mov         ecx,6363B4;'CurveUpLeftDown'
 00634FD8    mov         edx,dword ptr [ebp-4]
 00634FDB    call        @UStrCat3
 00634FE0    mov         edx,dword ptr [ebp-0F4]
 00634FE6    mov         eax,esi
 00634FE8    call        005E51D8
>00634FED    jmp         0063545F
 00634FF2    lea         eax,[ebp-0F8]
 00634FF8    mov         ecx,6363E0;'CurveUpLeftDownUp'
 00634FFD    mov         edx,dword ptr [ebp-4]
 00635000    call        @UStrCat3
 00635005    mov         edx,dword ptr [ebp-0F8]
 0063500B    mov         eax,esi
 0063500D    call        005E51D8
>00635012    jmp         0063545F
 00635017    lea         eax,[ebp-0FC]
 0063501D    mov         ecx,636410;'CurveUpLeftDownUpDown'
 00635022    mov         edx,dword ptr [ebp-4]
 00635025    call        @UStrCat3
 0063502A    mov         edx,dword ptr [ebp-0FC]
 00635030    mov         eax,esi
 00635032    call        005E51D8
>00635037    jmp         0063545F
 0063503C    lea         eax,[ebp-100]
 00635042    mov         ecx,636448;'CurveUpLeftDownUpLeft'
 00635047    mov         edx,dword ptr [ebp-4]
 0063504A    call        @UStrCat3
 0063504F    mov         edx,dword ptr [ebp-100]
 00635055    mov         eax,esi
 00635057    call        005E51D8
>0063505C    jmp         0063545F
 00635061    lea         eax,[ebp-104]
 00635067    mov         ecx,636480;'CurveUpLeftDownUpLeftDown'
 0063506C    mov         edx,dword ptr [ebp-4]
 0063506F    call        @UStrCat3
 00635074    mov         edx,dword ptr [ebp-104]
 0063507A    mov         eax,esi
 0063507C    call        005E51D8
>00635081    jmp         0063545F
 00635086    lea         eax,[ebp-108]
 0063508C    mov         ecx,6364C0;'CurveLeftUp'
 00635091    mov         edx,dword ptr [ebp-4]
 00635094    call        @UStrCat3
 00635099    mov         edx,dword ptr [ebp-108]
 0063509F    mov         eax,esi
 006350A1    call        005E51D8
>006350A6    jmp         0063545F
 006350AB    lea         eax,[ebp-10C]
 006350B1    mov         ecx,6364E4;'CurveLeftUpRight'
 006350B6    mov         edx,dword ptr [ebp-4]
 006350B9    call        @UStrCat3
 006350BE    mov         edx,dword ptr [ebp-10C]
 006350C4    mov         eax,esi
 006350C6    call        005E51D8
>006350CB    jmp         0063545F
 006350D0    lea         eax,[ebp-110]
 006350D6    mov         ecx,636514;'CurveLeftUpRightLeft'
 006350DB    mov         edx,dword ptr [ebp-4]
 006350DE    call        @UStrCat3
 006350E3    mov         edx,dword ptr [ebp-110]
 006350E9    mov         eax,esi
 006350EB    call        005E51D8
>006350F0    jmp         0063545F
 006350F5    lea         eax,[ebp-114]
 006350FB    mov         ecx,63654C;'CurveLeftUpRightLeftRight'
 00635100    mov         edx,dword ptr [ebp-4]
 00635103    call        @UStrCat3
 00635108    mov         edx,dword ptr [ebp-114]
 0063510E    mov         eax,esi
 00635110    call        005E51D8
>00635115    jmp         0063545F
 0063511A    lea         eax,[ebp-118]
 00635120    mov         ecx,63658C;'CurveLeftUpRightLeftUp'
 00635125    mov         edx,dword ptr [ebp-4]
 00635128    call        @UStrCat3
 0063512D    mov         edx,dword ptr [ebp-118]
 00635133    mov         eax,esi
 00635135    call        005E51D8
>0063513A    jmp         0063545F
 0063513F    lea         eax,[ebp-11C]
 00635145    mov         ecx,6365C8;'CurveLeftUpRightLeftUpRight'
 0063514A    mov         edx,dword ptr [ebp-4]
 0063514D    call        @UStrCat3
 00635152    mov         edx,dword ptr [ebp-11C]
 00635158    mov         eax,esi
 0063515A    call        005E51D8
>0063515F    jmp         0063545F
 00635164    lea         eax,[ebp-120]
 0063516A    mov         ecx,63660C;'CurveLeftDown'
 0063516F    mov         edx,dword ptr [ebp-4]
 00635172    call        @UStrCat3
 00635177    mov         edx,dword ptr [ebp-120]
 0063517D    mov         eax,esi
 0063517F    call        005E51D8
>00635184    jmp         0063545F
 00635189    lea         eax,[ebp-124]
 0063518F    mov         ecx,636634;'CurveLeftDownRight'
 00635194    mov         edx,dword ptr [ebp-4]
 00635197    call        @UStrCat3
 0063519C    mov         edx,dword ptr [ebp-124]
 006351A2    mov         eax,esi
 006351A4    call        005E51D8
>006351A9    jmp         0063545F
 006351AE    lea         eax,[ebp-128]
 006351B4    mov         ecx,636668;'CurveLeftDownRightLeft'
 006351B9    mov         edx,dword ptr [ebp-4]
 006351BC    call        @UStrCat3
 006351C1    mov         edx,dword ptr [ebp-128]
 006351C7    mov         eax,esi
 006351C9    call        005E51D8
>006351CE    jmp         0063545F
 006351D3    lea         eax,[ebp-12C]
 006351D9    mov         ecx,6366A4;'CurveLeftDownRightLeftRight'
 006351DE    mov         edx,dword ptr [ebp-4]
 006351E1    call        @UStrCat3
 006351E6    mov         edx,dword ptr [ebp-12C]
 006351EC    mov         eax,esi
 006351EE    call        005E51D8
>006351F3    jmp         0063545F
 006351F8    lea         eax,[ebp-130]
 006351FE    mov         ecx,6366E8;'CurveLeftDownRightLeftDown'
 00635203    mov         edx,dword ptr [ebp-4]
 00635206    call        @UStrCat3
 0063520B    mov         edx,dword ptr [ebp-130]
 00635211    mov         eax,esi
 00635213    call        005E51D8
>00635218    jmp         0063545F
 0063521D    lea         eax,[ebp-134]
 00635223    mov         ecx,63672C;'CurveLeftDownRightLeftDownRight'
 00635228    mov         edx,dword ptr [ebp-4]
 0063522B    call        @UStrCat3
 00635230    mov         edx,dword ptr [ebp-134]
 00635236    mov         eax,esi
 00635238    call        005E51D8
>0063523D    jmp         0063545F
 00635242    lea         eax,[ebp-138]
 00635248    mov         ecx,636778;'CurveRightUp'
 0063524D    mov         edx,dword ptr [ebp-4]
 00635250    call        @UStrCat3
 00635255    mov         edx,dword ptr [ebp-138]
 0063525B    mov         eax,esi
 0063525D    call        005E51D8
>00635262    jmp         0063545F
 00635267    lea         eax,[ebp-13C]
 0063526D    mov         ecx,6367A0;'CurveRightUpLeft'
 00635272    mov         edx,dword ptr [ebp-4]
 00635275    call        @UStrCat3
 0063527A    mov         edx,dword ptr [ebp-13C]
 00635280    mov         eax,esi
 00635282    call        005E51D8
>00635287    jmp         0063545F
 0063528C    lea         eax,[ebp-140]
 00635292    mov         ecx,6367D0;'CurveRightUpLeftRight'
 00635297    mov         edx,dword ptr [ebp-4]
 0063529A    call        @UStrCat3
 0063529F    mov         edx,dword ptr [ebp-140]
 006352A5    mov         eax,esi
 006352A7    call        005E51D8
>006352AC    jmp         0063545F
 006352B1    lea         eax,[ebp-144]
 006352B7    mov         ecx,636808;'CurveRightUpLeftRightLeft'
 006352BC    mov         edx,dword ptr [ebp-4]
 006352BF    call        @UStrCat3
 006352C4    mov         edx,dword ptr [ebp-144]
 006352CA    mov         eax,esi
 006352CC    call        005E51D8
>006352D1    jmp         0063545F
 006352D6    lea         eax,[ebp-148]
 006352DC    mov         ecx,636848;'CurveRightUpLeftRightUp'
 006352E1    mov         edx,dword ptr [ebp-4]
 006352E4    call        @UStrCat3
 006352E9    mov         edx,dword ptr [ebp-148]
 006352EF    mov         eax,esi
 006352F1    call        005E51D8
>006352F6    jmp         0063545F
 006352FB    lea         eax,[ebp-14C]
 00635301    mov         ecx,636884;'CurveRightUpLeftRightUpLeft'
 00635306    mov         edx,dword ptr [ebp-4]
 00635309    call        @UStrCat3
 0063530E    mov         edx,dword ptr [ebp-14C]
 00635314    mov         eax,esi
 00635316    call        005E51D8
>0063531B    jmp         0063545F
 00635320    lea         eax,[ebp-150]
 00635326    mov         ecx,6368C8;'CurveRightDown'
 0063532B    mov         edx,dword ptr [ebp-4]
 0063532E    call        @UStrCat3
 00635333    mov         edx,dword ptr [ebp-150]
 00635339    mov         eax,esi
 0063533B    call        005E51D8
>00635340    jmp         0063545F
 00635345    lea         eax,[ebp-154]
 0063534B    mov         ecx,6368F4;'CurveRightDownLeft'
 00635350    mov         edx,dword ptr [ebp-4]
 00635353    call        @UStrCat3
 00635358    mov         edx,dword ptr [ebp-154]
 0063535E    mov         eax,esi
 00635360    call        005E51D8
>00635365    jmp         0063545F
 0063536A    lea         eax,[ebp-158]
 00635370    mov         ecx,636928;'CurveRightDownLeftRight'
 00635375    mov         edx,dword ptr [ebp-4]
 00635378    call        @UStrCat3
 0063537D    mov         edx,dword ptr [ebp-158]
 00635383    mov         eax,esi
 00635385    call        005E51D8
>0063538A    jmp         0063545F
 0063538F    lea         eax,[ebp-15C]
 00635395    mov         ecx,636964;'CurveRightDownLeftRightLeft'
 0063539A    mov         edx,dword ptr [ebp-4]
 0063539D    call        @UStrCat3
 006353A2    mov         edx,dword ptr [ebp-15C]
 006353A8    mov         eax,esi
 006353AA    call        005E51D8
>006353AF    jmp         0063545F
 006353B4    lea         eax,[ebp-160]
 006353BA    mov         ecx,6369A8;'CurveRightDownLeftRightDown'
 006353BF    mov         edx,dword ptr [ebp-4]
 006353C2    call        @UStrCat3
 006353C7    mov         edx,dword ptr [ebp-160]
 006353CD    mov         eax,esi
 006353CF    call        005E51D8
>006353D4    jmp         0063545F
 006353D9    lea         eax,[ebp-164]
 006353DF    mov         ecx,6369EC;'CurveRightDownLeftRightDownLeft'
 006353E4    mov         edx,dword ptr [ebp-4]
 006353E7    call        @UStrCat3
 006353EC    mov         edx,dword ptr [ebp-164]
 006353F2    mov         eax,esi
 006353F4    call        005E51D8
>006353F9    jmp         0063545F
 006353FB    lea         eax,[ebp-168]
 00635401    mov         ecx,636A38;'CircleAnticlockwise'
 00635406    mov         edx,dword ptr [ebp-4]
 00635409    call        @UStrCat3
 0063540E    mov         edx,dword ptr [ebp-168]
 00635414    mov         eax,esi
 00635416    call        005E51D8
>0063541B    jmp         0063545F
 0063541D    lea         eax,[ebp-16C]
 00635423    mov         ecx,636A6C;'CircleClockwise'
 00635428    mov         edx,dword ptr [ebp-4]
 0063542B    call        @UStrCat3
 00635430    mov         edx,dword ptr [ebp-16C]
 00635436    mov         eax,esi
 00635438    call        005E51D8
>0063543D    jmp         0063545F
 0063543F    lea         eax,[ebp-170]
 00635445    mov         ecx,636A98;'ERROR'
 0063544A    mov         edx,dword ptr [ebp-4]
 0063544D    call        @UStrCat3
 00635452    mov         edx,dword ptr [ebp-170]
 00635458    mov         eax,esi
 0063545A    call        005E51D8
 0063545F    movzx       eax,byte ptr [ebx+42F];TSixaxisObject.PartialGesture:TWaggleGesture
 00635466    add         eax,0FFFFFFFB
 00635469    cmp         eax,41
>0063546C    ja          0063583E
 00635472    movzx       eax,byte ptr [eax+635480]
 00635479    jmp         dword ptr [eax*4+6354C2]
 00635479    db          3
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          8
 00635479    db          0
 00635479    db          7
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          10
 00635479    db          0
 00635479    db          9
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          4
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          12
 00635479    db          0
 00635479    db          11
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          14
 00635479    db          0
 00635479    db          13
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          5
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          16
 00635479    db          0
 00635479    db          15
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          18
 00635479    db          0
 00635479    db          17
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          6
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          20
 00635479    db          0
 00635479    db          19
 00635479    db          0
 00635479    db          0
 00635479    db          0
 00635479    db          22
 00635479    db          0
 00635479    db          21
 00635479    db          1
 00635479    db          2
 00635479    dd          0063583E
 00635479    dd          0063551E
 00635479    dd          00635543
 00635479    dd          00635568
 00635479    dd          0063558D
 00635479    dd          006355B2
 00635479    dd          006355D7
 00635479    dd          006355FC
 00635479    dd          00635621
 00635479    dd          00635646
 00635479    dd          0063566B
 00635479    dd          00635690
 00635479    dd          006356B5
 00635479    dd          006356DA
 00635479    dd          006356FF
 00635479    dd          00635724
 00635479    dd          00635749
 00635479    dd          0063576E
 00635479    dd          00635793
 00635479    dd          006357B8
 00635479    dd          006357DA
 00635479    dd          006357FC
 00635479    dd          0063581E
 0063551E    lea         eax,[ebp-174]
 00635524    mov         ecx,636A38;'CircleAnticlockwise'
 00635529    mov         edx,dword ptr [ebp-4]
 0063552C    call        @UStrCat3
 00635531    mov         edx,dword ptr [ebp-174]
 00635537    mov         eax,esi
 00635539    call        005E51D8
>0063553E    jmp         0063583E
 00635543    lea         eax,[ebp-178]
 00635549    mov         ecx,636A6C;'CircleClockwise'
 0063554E    mov         edx,dword ptr [ebp-4]
 00635551    call        @UStrCat3
 00635556    mov         edx,dword ptr [ebp-178]
 0063555C    mov         eax,esi
 0063555E    call        005E51D8
>00635563    jmp         0063583E
 00635568    lea         eax,[ebp-17C]
 0063556E    mov         ecx,636AB0;'SwingDownUpDownUpDown'
 00635573    mov         edx,dword ptr [ebp-4]
 00635576    call        @UStrCat3
 0063557B    mov         edx,dword ptr [ebp-17C]
 00635581    mov         eax,esi
 00635583    call        005E51D8
>00635588    jmp         0063583E
 0063558D    lea         eax,[ebp-180]
 00635593    mov         ecx,636AE8;'SwingUpDownUpDownUp'
 00635598    mov         edx,dword ptr [ebp-4]
 0063559B    call        @UStrCat3
 006355A0    mov         edx,dword ptr [ebp-180]
 006355A6    mov         eax,esi
 006355A8    call        005E51D8
>006355AD    jmp         0063583E
 006355B2    lea         eax,[ebp-184]
 006355B8    mov         ecx,636B1C;'SwingLeftRightLeftRightLeft'
 006355BD    mov         edx,dword ptr [ebp-4]
 006355C0    call        @UStrCat3
 006355C5    mov         edx,dword ptr [ebp-184]
 006355CB    mov         eax,esi
 006355CD    call        005E51D8
>006355D2    jmp         0063583E
 006355D7    lea         eax,[ebp-188]
 006355DD    mov         ecx,636B60;'SwingRightLeftRightLeftRight'
 006355E2    mov         edx,dword ptr [ebp-4]
 006355E5    call        @UStrCat3
 006355EA    mov         edx,dword ptr [ebp-188]
 006355F0    mov         eax,esi
 006355F2    call        005E51D8
>006355F7    jmp         0063583E
 006355FC    lea         eax,[ebp-18C]
 00635602    mov         ecx,6360C8;'CurveDownRightUpDownRightUp'
 00635607    mov         edx,dword ptr [ebp-4]
 0063560A    call        @UStrCat3
 0063560F    mov         edx,dword ptr [ebp-18C]
 00635615    mov         eax,esi
 00635617    call        005E51D8
>0063561C    jmp         0063583E
 00635621    lea         eax,[ebp-190]
 00635627    mov         ecx,63604C;'CurveDownRightUpDownUp'
 0063562C    mov         edx,dword ptr [ebp-4]
 0063562F    call        @UStrCat3
 00635634    mov         edx,dword ptr [ebp-190]
 0063563A    mov         eax,esi
 0063563C    call        005E51D8
>00635641    jmp         0063583E
 00635646    lea         eax,[ebp-194]
 0063564C    mov         ecx,636208;'CurveDownLeftUpDownLeftUp'
 00635651    mov         edx,dword ptr [ebp-4]
 00635654    call        @UStrCat3
 00635659    mov         edx,dword ptr [ebp-194]
 0063565F    mov         eax,esi
 00635661    call        005E51D8
>00635666    jmp         0063583E
 0063566B    lea         eax,[ebp-198]
 00635671    mov         ecx,636194;'CurveDownLeftUpDownUp'
 00635676    mov         edx,dword ptr [ebp-4]
 00635679    call        @UStrCat3
 0063567E    mov         edx,dword ptr [ebp-198]
 00635684    mov         eax,esi
 00635686    call        005E51D8
>0063568B    jmp         0063583E
 00635690    lea         eax,[ebp-19C]
 00635696    mov         ecx,63634C;'CurveUpRightDownUpRightDown'
 0063569B    mov         edx,dword ptr [ebp-4]
 0063569E    call        @UStrCat3
 006356A3    mov         edx,dword ptr [ebp-19C]
 006356A9    mov         eax,esi
 006356AB    call        005E51D8
>006356B0    jmp         0063583E
 006356B5    lea         eax,[ebp-1A0]
 006356BB    mov         ecx,6362D4;'CurveUpRightDownUpDown'
 006356C0    mov         edx,dword ptr [ebp-4]
 006356C3    call        @UStrCat3
 006356C8    mov         edx,dword ptr [ebp-1A0]
 006356CE    mov         eax,esi
 006356D0    call        005E51D8
>006356D5    jmp         0063583E
 006356DA    lea         eax,[ebp-1A4]
 006356E0    mov         ecx,636480;'CurveUpLeftDownUpLeftDown'
 006356E5    mov         edx,dword ptr [ebp-4]
 006356E8    call        @UStrCat3
 006356ED    mov         edx,dword ptr [ebp-1A4]
 006356F3    mov         eax,esi
 006356F5    call        005E51D8
>006356FA    jmp         0063583E
 006356FF    lea         eax,[ebp-1A8]
 00635705    mov         ecx,636410;'CurveUpLeftDownUpDown'
 0063570A    mov         edx,dword ptr [ebp-4]
 0063570D    call        @UStrCat3
 00635712    mov         edx,dword ptr [ebp-1A8]
 00635718    mov         eax,esi
 0063571A    call        005E51D8
>0063571F    jmp         0063583E
 00635724    lea         eax,[ebp-1AC]
 0063572A    mov         ecx,6365C8;'CurveLeftUpRightLeftUpRight'
 0063572F    mov         edx,dword ptr [ebp-4]
 00635732    call        @UStrCat3
 00635737    mov         edx,dword ptr [ebp-1AC]
 0063573D    mov         eax,esi
 0063573F    call        005E51D8
>00635744    jmp         0063583E
 00635749    lea         eax,[ebp-1B0]
 0063574F    mov         ecx,63654C;'CurveLeftUpRightLeftRight'
 00635754    mov         edx,dword ptr [ebp-4]
 00635757    call        @UStrCat3
 0063575C    mov         edx,dword ptr [ebp-1B0]
 00635762    mov         eax,esi
 00635764    call        005E51D8
>00635769    jmp         0063583E
 0063576E    lea         eax,[ebp-1B4]
 00635774    mov         ecx,63672C;'CurveLeftDownRightLeftDownRight'
 00635779    mov         edx,dword ptr [ebp-4]
 0063577C    call        @UStrCat3
 00635781    mov         edx,dword ptr [ebp-1B4]
 00635787    mov         eax,esi
 00635789    call        005E51D8
>0063578E    jmp         0063583E
 00635793    lea         eax,[ebp-1B8]
 00635799    mov         ecx,6366A4;'CurveLeftDownRightLeftRight'
 0063579E    mov         edx,dword ptr [ebp-4]
 006357A1    call        @UStrCat3
 006357A6    mov         edx,dword ptr [ebp-1B8]
 006357AC    mov         eax,esi
 006357AE    call        005E51D8
>006357B3    jmp         0063583E
 006357B8    lea         eax,[ebp-1BC]
 006357BE    mov         ecx,636884;'CurveRightUpLeftRightUpLeft'
 006357C3    mov         edx,dword ptr [ebp-4]
 006357C6    call        @UStrCat3
 006357CB    mov         edx,dword ptr [ebp-1BC]
 006357D1    mov         eax,esi
 006357D3    call        005E51D8
>006357D8    jmp         0063583E
 006357DA    lea         eax,[ebp-1C0]
 006357E0    mov         ecx,636808;'CurveRightUpLeftRightLeft'
 006357E5    mov         edx,dword ptr [ebp-4]
 006357E8    call        @UStrCat3
 006357ED    mov         edx,dword ptr [ebp-1C0]
 006357F3    mov         eax,esi
 006357F5    call        005E51D8
>006357FA    jmp         0063583E
 006357FC    lea         eax,[ebp-1C4]
 00635802    mov         ecx,6369EC;'CurveRightDownLeftRightDownLeft'
 00635807    mov         edx,dword ptr [ebp-4]
 0063580A    call        @UStrCat3
 0063580F    mov         edx,dword ptr [ebp-1C4]
 00635815    mov         eax,esi
 00635817    call        005E51D8
>0063581C    jmp         0063583E
 0063581E    lea         eax,[ebp-1C8]
 00635824    mov         ecx,636964;'CurveRightDownLeftRightLeft'
 00635829    mov         edx,dword ptr [ebp-4]
 0063582C    call        @UStrCat3
 00635831    mov         edx,dword ptr [ebp-1C8]
 00635837    mov         eax,esi
 00635839    call        005E51D8
 0063583E    mov         eax,ebx
 00635840    call        TAccelerometerObject.Stabbing
 00635845    test        al,al
>00635847    je          00635869
 00635849    lea         eax,[ebp-1CC]
 0063584F    mov         ecx,636BA8;'Stabbing'
 00635854    mov         edx,dword ptr [ebp-4]
 00635857    call        @UStrCat3
 0063585C    mov         edx,dword ptr [ebp-1CC]
 00635862    mov         eax,esi
 00635864    call        005E5004
 00635869    cmp         byte ptr [ebx+434],0;TSixaxisObject.UpsideDownOnShoulder:Boolean
>00635870    je          00635892
 00635872    lea         eax,[ebp-1D0]
 00635878    mov         ecx,636BC8;'UpsideDownOnShoulder'
 0063587D    mov         edx,dword ptr [ebp-4]
 00635880    call        @UStrCat3
 00635885    mov         edx,dword ptr [ebp-1D0]
 0063588B    mov         eax,esi
 0063588D    call        005E5050
 00635892    cmp         byte ptr [ebx+431],0;TSixaxisObject.LookingAtWatchRH:Boolean
>00635899    je          006358BB
 0063589B    lea         eax,[ebp-1D4]
 006358A1    mov         ecx,636C00;'LookingAtRightWatch'
 006358A6    mov         edx,dword ptr [ebp-4]
 006358A9    call        @UStrCat3
 006358AE    mov         edx,dword ptr [ebp-1D4]
 006358B4    mov         eax,esi
 006358B6    call        005E5050
 006358BB    cmp         byte ptr [ebx+433],0;TSixaxisObject.LookingAtRightPalm:Boolean
>006358C2    je          006358E4
 006358C4    lea         eax,[ebp-1D8]
 006358CA    mov         ecx,636C34;'LookingAtRightPalm'
 006358CF    mov         edx,dword ptr [ebp-4]
 006358D2    call        @UStrCat3
 006358D7    mov         edx,dword ptr [ebp-1D8]
 006358DD    mov         eax,esi
 006358DF    call        005E5050
 006358E4    cmp         byte ptr [ebx+430],0;TSixaxisObject.LookingAtWatch:Boolean
>006358EB    je          0063590D
 006358ED    lea         eax,[ebp-1DC]
 006358F3    mov         ecx,636C68;'LookingAtWatch'
 006358F8    mov         edx,dword ptr [ebp-4]
 006358FB    call        @UStrCat3
 00635900    mov         edx,dword ptr [ebp-1DC]
 00635906    mov         eax,esi
 00635908    call        005E5050
 0063590D    cmp         byte ptr [ebx+432],0;TSixaxisObject.LookingAtLeftPalm:Boolean
>00635914    je          00635936
 00635916    lea         eax,[ebp-1E0]
 0063591C    mov         ecx,636C94;'LookingAtLeftPalm'
 00635921    mov         edx,dword ptr [ebp-4]
 00635924    call        @UStrCat3
 00635929    mov         edx,dword ptr [ebp-1E0]
 0063592F    mov         eax,esi
 00635931    call        005E5050
 00635936    inc         edi
 00635937    dec         dword ptr [ebp-0C]
>0063593A    jne         00634660
 00635940    mov         eax,esi
 00635942    call        005E509C
 00635947    xor         eax,eax
 00635949    pop         edx
 0063594A    pop         ecx
 0063594B    pop         ecx
 0063594C    mov         dword ptr fs:[eax],edx
 0063594F    push        635981
 00635954    lea         eax,[ebp-1E0]
 0063595A    mov         edx,64
 0063595F    call        @UStrArrayClr
 00635964    lea         eax,[ebp-50]
 00635967    mov         edx,11
 0063596C    call        @UStrArrayClr
 00635971    lea         eax,[ebp-4]
 00635974    call        @UStrClr
 00635979    ret
>0063597A    jmp         @HandleFinally
>0063597F    jmp         00635954
 00635981    pop         edi
 00635982    pop         esi
 00635983    pop         ebx
 00635984    mov         esp,ebp
 00635986    pop         ebp
 00635987    ret
*}
end;

//00636CB8
procedure TModuleSixaxis.PrepareForGUI;
begin
{*
 00636CB8    ret
*}
end;

//00636CBC
procedure TModuleSixaxis.PrepareForMonitoring;
begin
{*
 00636CBC    ret
*}
end;

//00636CC0
function TModuleSixaxis.Read:Boolean;
begin
{*
 00636CC0    push        ebx
 00636CC1    mov         bl,1
 00636CC3    call        0074BF10
 00636CC8    call        TWiimoteManager.ReadSixaxes
 00636CCD    mov         eax,ebx
 00636CCF    pop         ebx
 00636CD0    ret
*}
end;

//00636CD4
procedure TModuleSixaxis.StartCompiletime;
begin
{*
 00636CD4    call        TPieModule.StartCompiletime
 00636CD9    call        0062FBB4
 00636CDE    ret
*}
end;

//00636CE0
procedure TModuleSixaxis.StartGUI;
begin
{*
 00636CE0    call        0074BF10
 00636CE5    call        TWiimoteManager.StartGUI
 00636CEA    ret
*}
end;

//00636CEC
procedure TModuleSixaxis.StartMonitoring;
begin
{*
 00636CEC    push        ebx
 00636CED    mov         ebx,eax
 00636CEF    mov         byte ptr [ebx+28],1;TModuleSixaxis.Monitoring:Boolean
 00636CF3    mov         eax,dword ptr [ebx+30];TModuleSixaxis.OldButtonsDown:TStringList
 00636CF6    mov         edx,dword ptr [eax]
 00636CF8    call        dword ptr [edx+44];TStringList.Clear
 00636CFB    mov         eax,dword ptr [ebx+2C];TModuleSixaxis.ButtonsDown:TStringList
 00636CFE    mov         edx,dword ptr [eax]
 00636D00    call        dword ptr [edx+44];TStringList.Clear
 00636D03    pop         ebx
 00636D04    ret
*}
end;

//00636D08
procedure TModuleSixaxis.StartRuntime;
begin
{*
 00636D08    push        ebx
 00636D09    mov         ebx,eax
 00636D0B    mov         eax,ebx
 00636D0D    call        TPieModule.StartRuntime
 00636D12    cmp         byte ptr [ebx+24],0;TModuleSixaxis.Used:Boolean
>00636D16    je          00636D22
 00636D18    call        0074BF10
 00636D1D    call        TWiimoteManager.StartRuntime
 00636D22    call        0074BF10
 00636D27    mov         eax,dword ptr [eax+60]
 00636D2A    cmp         dword ptr [eax+8],0
 00636D2E    setg        byte ptr ds:[81ECA5];gvar_0081ECA5
 00636D35    pop         ebx
 00636D36    ret
*}
end;

//00636D38
procedure TModuleSixaxis.StopCompiletime;
begin
{*
 00636D38    push        ebx
 00636D39    mov         ebx,eax
 00636D3B    call        0062FBC8
 00636D40    mov         eax,ebx
 00636D42    call        TPieModule.StopCompiletime
 00636D47    pop         ebx
 00636D48    ret
*}
end;

//00636D4C
procedure TModuleSixaxis.StopGUI;
begin
{*
 00636D4C    mov         edx,dword ptr [eax]
 00636D4E    call        dword ptr [edx+34];TModuleSixaxis.StopRuntime
 00636D51    ret
*}
end;

//00636D54
procedure TModuleSixaxis.StopMonitoring;
begin
{*
 00636D54    mov         byte ptr [eax+28],0;TModuleSixaxis.Monitoring:Boolean
 00636D58    ret
*}
end;

//00636D5C
procedure TModuleSixaxis.StopRuntime;
begin
{*
 00636D5C    push        ebx
 00636D5D    mov         ebx,eax
 00636D5F    cmp         byte ptr [ebx+24],0;TModuleSixaxis.Used:Boolean
>00636D63    je          00636D6F
 00636D65    call        0074BF10
 00636D6A    call        TWiimoteManager.StopRuntime
 00636D6F    mov         eax,ebx
 00636D71    call        TPieModule.StopRuntime
 00636D76    pop         ebx
 00636D77    ret
*}
end;

Initialization
//00781D98
{*
 00781D98    sub         dword ptr ds:[81ECA8],1
>00781D9F    jae         00781DBC
 00781DA1    mov         dl,1
 00781DA3    mov         eax,[0062BBC0];TModuleSixaxis
 00781DA8    call        TModuleSixaxis.Create;TModuleSixaxis.Create
 00781DAD    mov         [0081ECAC],eax;gvar_0081ECAC:TModuleSixaxis
 00781DB2    mov         eax,[0081ECAC];gvar_0081ECAC:TModuleSixaxis
 00781DB7    call        005E31AC
 00781DBC    ret
*}
Finalization
end.