//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieZ800;

interface

uses
  SysUtils, Classes;

type
  TEMADeviceData = TEMADeviceData = record//size=28
AccX:Single;//f0
AccY:Single;//f4
AccZ:Single;//f8
AngX:Single;//fC
AngY:Single;//f10
AngZ:Single;//f14
North:Single;//f18
Yaw:Single;//f1C
Pitch:Single;//f20
Roll:Single;//f24
end;;
  TZ800Value = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//006D66E8
    function GetUnits:TUnits;//006D6A90
    procedure FillClone(c:TExpression);//006D6548
    procedure GetRotMat(m:TRotMat);//006D6954
    //procedure GetString(?:?);//006D6978
    function GetPerUnits2:TUnits;//006D6750
    //function SetValue(NewValue:Double; ?:?):Boolean;//006D853C
    function CanSet:Boolean;//006D6534
    function GetDataType:TDataType;//006D6568
    procedure CreateClone;//006D6538
    procedure GetValue;//006D6B54
    //procedure ToString(?:?);//006D911C
  public
    ......................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006D911C
    procedure GetValue; virtual;//v2C//006D6B54
    //procedure GetString(?:?); virtual;//v38//006D6978
    procedure GetRotMat(m:TRotMat); virtual;//v40//006D6954
    function GetDataType:TDataType; virtual;//v44//006D6568
    function GetUnits:TUnits; virtual;//v48//006D6A90
    function GetPerUnits1:TUnits; virtual;//v4C//006D66E8
    function GetPerUnits2:TUnits; virtual;//v50//006D6750
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006D853C
    function CanSet:Boolean; virtual;//v68//006D6534
    procedure CreateClone; virtual;//v80//006D6538
    procedure FillClone(c:TExpression); virtual;//v84//006D6548
  end;
  Z800Thread = class(TThread)
  public
    PollResult:HRESULT;//f40
    RawData:TEMADeviceData;//f44
    xv:Single;//f6C
    yv:Single;//f70
    zv:Single;//f74
    x:Single;//f78
    y:Single;//f7C
    z:Single;//f80
    t:Double;//f88
    f8C:dword;//f8C
    LastKeepAliveTime:Double;//f90
    f94:dword;//f94
    TimeoutLength:Double;//f98
    procedure Execute; virtual;//v4//006D9BE4
  end;
    procedure sub_006D2918;//006D2918
    procedure sub_006D63E4;//006D63E4
    procedure sub_006D63F4;//006D63F4
    //function sub_006D63F8(?:?):?;//006D63F8
    procedure sub_006D67AC;//006D67AC
    procedure sub_006D6880;//006D6880
    procedure sub_006D918C;//006D918C
    procedure sub_006D970C;//006D970C
    //function sub_006D976C:?;//006D976C
    //function sub_006D9770(?:UnicodeString):?;//006D9770
    //procedure sub_006D97C0(?:Integer; ?:?);//006D97C0
    //function sub_006D97D8:?;//006D97D8
    //function sub_006D9850:?;//006D9850
    //function sub_006D9B18(?:?):?;//006D9B18
    procedure Execute;//006D9BE4

implementation

//006D2918
procedure sub_006D2918;
begin
{*
 006D2918    push        ebp
 006D2919    mov         ebp,esp
 006D291B    mov         ecx,31
 006D2920    push        0
 006D2922    push        0
 006D2924    dec         ecx
>006D2925    jne         006D2920
 006D2927    push        ecx
 006D2928    push        ebx
 006D2929    push        esi
 006D292A    push        edi
 006D292B    xor         eax,eax
 006D292D    push        ebp
 006D292E    push        6D4E60
 006D2933    push        dword ptr fs:[eax]
 006D2936    mov         dword ptr fs:[eax],esp
 006D2939    mov         ecx,13
 006D293E    mov         edx,6D4E7C;'x'
 006D2943    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2948    call        THashTable.Add
 006D294D    mov         ecx,14
 006D2952    mov         edx,6D4E8C;'y'
 006D2957    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D295C    call        THashTable.Add
 006D2961    mov         ecx,15
 006D2966    mov         edx,6D4E9C;'z'
 006D296B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2970    call        THashTable.Add
 006D2975    mov         ecx,0D
 006D297A    mov         edx,6D4EAC;'pitch'
 006D297F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2984    call        THashTable.Add
 006D2989    mov         ecx,0C
 006D298E    mov         edx,6D4EC4;'yaw'
 006D2993    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2998    call        THashTable.Add
 006D299D    mov         ecx,0E
 006D29A2    mov         edx,6D4ED8;'roll'
 006D29A7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D29AC    call        THashTable.Add
 006D29B1    mov         ecx,10
 006D29B6    mov         edx,6D4EF0;'XVelocity'
 006D29BB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D29C0    call        THashTable.Add
 006D29C5    mov         ecx,11
 006D29CA    mov         edx,6D4F10;'YVelocity'
 006D29CF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D29D4    call        THashTable.Add
 006D29D9    mov         ecx,12
 006D29DE    mov         edx,6D4F30;'ZVelocity'
 006D29E3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D29E8    call        THashTable.Add
 006D29ED    mov         ecx,10
 006D29F2    mov         edx,6D4F50;'xv'
 006D29F7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D29FC    call        THashTable.Add
 006D2A01    mov         ecx,11
 006D2A06    mov         edx,6D4F64;'yv'
 006D2A0B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A10    call        THashTable.Add
 006D2A15    mov         ecx,12
 006D2A1A    mov         edx,6D4F78;'zv'
 006D2A1F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A24    call        THashTable.Add
 006D2A29    mov         ecx,10
 006D2A2E    mov         edx,6D4F8C;'VelocityX'
 006D2A33    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A38    call        THashTable.Add
 006D2A3D    mov         ecx,11
 006D2A42    mov         edx,6D4FAC;'VelocityY'
 006D2A47    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A4C    call        THashTable.Add
 006D2A51    mov         ecx,12
 006D2A56    mov         edx,6D4FCC;'VelocityZ'
 006D2A5B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A60    call        THashTable.Add
 006D2A65    mov         ecx,5
 006D2A6A    mov         edx,6D4FEC;'XAcceleration'
 006D2A6F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A74    call        THashTable.Add
 006D2A79    mov         ecx,6
 006D2A7E    mov         edx,6D5014;'YAcceleration'
 006D2A83    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A88    call        THashTable.Add
 006D2A8D    mov         ecx,7
 006D2A92    mov         edx,6D503C;'ZAcceleration'
 006D2A97    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2A9C    call        THashTable.Add
 006D2AA1    mov         ecx,5
 006D2AA6    mov         edx,6D5064;'AccelerationX'
 006D2AAB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2AB0    call        THashTable.Add
 006D2AB5    mov         ecx,6
 006D2ABA    mov         edx,6D508C;'AccelerationY'
 006D2ABF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2AC4    call        THashTable.Add
 006D2AC9    mov         ecx,7
 006D2ACE    mov         edx,6D50B4;'AccelerationZ'
 006D2AD3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2AD8    call        THashTable.Add
 006D2ADD    mov         ecx,5
 006D2AE2    mov         edx,6D50DC;'AccX'
 006D2AE7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2AEC    call        THashTable.Add
 006D2AF1    mov         ecx,6
 006D2AF6    mov         edx,6D50F4;'AccY'
 006D2AFB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B00    call        THashTable.Add
 006D2B05    mov         ecx,7
 006D2B0A    mov         edx,6D510C;'AccZ'
 006D2B0F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B14    call        THashTable.Add
 006D2B19    mov         ecx,5
 006D2B1E    mov         edx,6D5124;'xacc'
 006D2B23    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B28    call        THashTable.Add
 006D2B2D    mov         ecx,6
 006D2B32    mov         edx,6D513C;'yacc'
 006D2B37    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B3C    call        THashTable.Add
 006D2B41    mov         ecx,7
 006D2B46    mov         edx,6D5154;'zacc'
 006D2B4B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B50    call        THashTable.Add
 006D2B55    mov         ecx,13
 006D2B5A    mov         edx,6D516C;'RelativeX'
 006D2B5F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B64    call        THashTable.Add
 006D2B69    mov         ecx,14
 006D2B6E    mov         edx,6D518C;'RelativeY'
 006D2B73    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B78    call        THashTable.Add
 006D2B7D    mov         ecx,15
 006D2B82    mov         edx,6D51AC;'RelativeZ'
 006D2B87    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2B8C    call        THashTable.Add
 006D2B91    mov         ecx,13
 006D2B96    mov         edx,6D51CC;'RelX'
 006D2B9B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2BA0    call        THashTable.Add
 006D2BA5    mov         ecx,14
 006D2BAA    mov         edx,6D51E4;'RelY'
 006D2BAF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2BB4    call        THashTable.Add
 006D2BB9    mov         ecx,15
 006D2BBE    mov         edx,6D51FC;'RelZ'
 006D2BC3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2BC8    call        THashTable.Add
 006D2BCD    mov         ecx,13
 006D2BD2    mov         edx,6D5214;'XRelative'
 006D2BD7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2BDC    call        THashTable.Add
 006D2BE1    mov         ecx,14
 006D2BE6    mov         edx,6D5234;'YRelative'
 006D2BEB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2BF0    call        THashTable.Add
 006D2BF5    mov         ecx,15
 006D2BFA    mov         edx,6D5254;'ZRelative'
 006D2BFF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C04    call        THashTable.Add
 006D2C09    mov         ecx,13
 006D2C0E    mov         edx,6D5274;'Relative.X'
 006D2C13    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C18    call        THashTable.Add
 006D2C1D    mov         ecx,14
 006D2C22    mov         edx,6D5298;'Relative.Y'
 006D2C27    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C2C    call        THashTable.Add
 006D2C31    mov         ecx,15
 006D2C36    mov         edx,6D52BC;'Relative.Z'
 006D2C3B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C40    call        THashTable.Add
 006D2C45    mov         ecx,13
 006D2C4A    mov         edx,6D52E0;'RelativePos.X'
 006D2C4F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C54    call        THashTable.Add
 006D2C59    mov         ecx,14
 006D2C5E    mov         edx,6D5308;'RelativePos.Y'
 006D2C63    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C68    call        THashTable.Add
 006D2C6D    mov         ecx,15
 006D2C72    mov         edx,6D5330;'RelativePos.Z'
 006D2C77    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C7C    call        THashTable.Add
 006D2C81    mov         ecx,13
 006D2C86    mov         edx,6D5358;'RelativePosX'
 006D2C8B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2C90    call        THashTable.Add
 006D2C95    mov         ecx,14
 006D2C9A    mov         edx,6D5380;'RelativePosY'
 006D2C9F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2CA4    call        THashTable.Add
 006D2CA9    mov         ecx,15
 006D2CAE    mov         edx,6D53A8;'RelativePosZ'
 006D2CB3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2CB8    call        THashTable.Add
 006D2CBD    mov         ecx,13
 006D2CC2    mov         edx,6D53D0;'UnfilteredX'
 006D2CC7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2CCC    call        THashTable.Add
 006D2CD1    mov         ecx,14
 006D2CD6    mov         edx,6D53F4;'UnfilteredY'
 006D2CDB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2CE0    call        THashTable.Add
 006D2CE5    mov         ecx,15
 006D2CEA    mov         edx,6D5418;'UnfilteredZ'
 006D2CEF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2CF4    call        THashTable.Add
 006D2CF9    mov         ecx,8
 006D2CFE    mov         edx,6D543C;'PitchVelocity'
 006D2D03    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D08    call        THashTable.Add
 006D2D0D    mov         ecx,9
 006D2D12    mov         edx,6D5464;'YawVelocity'
 006D2D17    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D1C    call        THashTable.Add
 006D2D21    mov         ecx,0A
 006D2D26    mov         edx,6D5488;'RollVelocity'
 006D2D2B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D30    call        THashTable.Add
 006D2D35    mov         ecx,8
 006D2D3A    mov         edx,6D54B0;'PitchV'
 006D2D3F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D44    call        THashTable.Add
 006D2D49    mov         ecx,9
 006D2D4E    mov         edx,6D54CC;'YawV'
 006D2D53    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D58    call        THashTable.Add
 006D2D5D    mov         ecx,0A
 006D2D62    mov         edx,6D54E4;'RollV'
 006D2D67    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D6C    call        THashTable.Add
 006D2D71    mov         ecx,8
 006D2D76    mov         edx,6D54FC;'VPitch'
 006D2D7B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D80    call        THashTable.Add
 006D2D85    mov         ecx,9
 006D2D8A    mov         edx,6D5518;'VYaw'
 006D2D8F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2D94    call        THashTable.Add
 006D2D99    mov         ecx,0A
 006D2D9E    mov         edx,6D5530;'VRoll'
 006D2DA3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2DA8    call        THashTable.Add
 006D2DAD    mov         ecx,8
 006D2DB2    mov         edx,6D5548;'XRotationVelocity'
 006D2DB7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2DBC    call        THashTable.Add
 006D2DC1    mov         ecx,9
 006D2DC6    mov         edx,6D5578;'YRotationVelocity'
 006D2DCB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2DD0    call        THashTable.Add
 006D2DD5    mov         ecx,0A
 006D2DDA    mov         edx,6D55A8;'ZRotationVelocity'
 006D2DDF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2DE4    call        THashTable.Add
 006D2DE9    mov         ecx,8
 006D2DEE    mov         edx,6D55D8;'XAngularVelocity'
 006D2DF3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2DF8    call        THashTable.Add
 006D2DFD    mov         ecx,9
 006D2E02    mov         edx,6D5608;'YAngularVelocity'
 006D2E07    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E0C    call        THashTable.Add
 006D2E11    mov         ecx,0A
 006D2E16    mov         edx,6D5638;'ZAngularVelocity'
 006D2E1B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E20    call        THashTable.Add
 006D2E25    mov         ecx,8
 006D2E2A    mov         edx,6D5668;'AngularVelocityX'
 006D2E2F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E34    call        THashTable.Add
 006D2E39    mov         ecx,9
 006D2E3E    mov         edx,6D5698;'AngularVelocityY'
 006D2E43    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E48    call        THashTable.Add
 006D2E4D    mov         ecx,0A
 006D2E52    mov         edx,6D56C8;'AngularVelocityZ'
 006D2E57    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E5C    call        THashTable.Add
 006D2E61    mov         ecx,8
 006D2E66    mov         edx,6D56F8;'AngularVelocityPitch'
 006D2E6B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E70    call        THashTable.Add
 006D2E75    mov         ecx,9
 006D2E7A    mov         edx,6D5730;'AngularVelocityYaw'
 006D2E7F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E84    call        THashTable.Add
 006D2E89    mov         ecx,0A
 006D2E8E    mov         edx,6D5764;'AngularVelocityRoll'
 006D2E93    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2E98    call        THashTable.Add
 006D2E9D    mov         ecx,8
 006D2EA2    mov         edx,6D5798;'VRX'
 006D2EA7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2EAC    call        THashTable.Add
 006D2EB1    mov         ecx,9
 006D2EB6    mov         edx,6D57AC;'VRY'
 006D2EBB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2EC0    call        THashTable.Add
 006D2EC5    mov         ecx,0A
 006D2ECA    mov         edx,6D57C0;'VRZ'
 006D2ECF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2ED4    call        THashTable.Add
 006D2ED9    mov         ecx,8
 006D2EDE    mov         edx,6D57D4;'RXV'
 006D2EE3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2EE8    call        THashTable.Add
 006D2EED    mov         ecx,9
 006D2EF2    mov         edx,6D57E8;'RYV'
 006D2EF7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2EFC    call        THashTable.Add
 006D2F01    mov         ecx,0A
 006D2F06    mov         edx,6D57FC;'RZV'
 006D2F0B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F10    call        THashTable.Add
 006D2F15    mov         ecx,1
 006D2F1A    mov         edx,6D5810;'Exists'
 006D2F1F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F24    call        THashTable.Add
 006D2F29    mov         ecx,2
 006D2F2E    mov         edx,6D582C;'HasNoTracker'
 006D2F33    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F38    call        THashTable.Add
 006D2F3D    mov         ecx,3
 006D2F42    mov         edx,6D5854;'NotConnected'
 006D2F47    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F4C    call        THashTable.Add
 006D2F51    mov         ecx,4
 006D2F56    mov         edx,6D587C;'InvalidHandle'
 006D2F5B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F60    call        THashTable.Add
 006D2F65    mov         ecx,0F
 006D2F6A    mov         edx,6D58A4;'ReadError'
 006D2F6F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F74    call        THashTable.Add
 006D2F79    mov         ecx,8
 006D2F7E    mov         edx,6D58C4;'AngX'
 006D2F83    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F88    call        THashTable.Add
 006D2F8D    mov         ecx,9
 006D2F92    mov         edx,6D58DC;'AngY'
 006D2F97    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2F9C    call        THashTable.Add
 006D2FA1    mov         ecx,0A
 006D2FA6    mov         edx,6D58F4;'AngZ'
 006D2FAB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2FB0    call        THashTable.Add
 006D2FB5    mov         ecx,0B
 006D2FBA    mov         edx,6D590C;'CompassHeading'
 006D2FBF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2FC4    call        THashTable.Add
 006D2FC9    mov         ecx,0B
 006D2FCE    mov         edx,6D5938;'North'
 006D2FD3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2FD8    call        THashTable.Add
 006D2FDD    mov         ecx,16
 006D2FE2    mov         edx,6D5950;'SampleRate'
 006D2FE7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D2FEC    call        THashTable.Add
 006D2FF1    mov         ecx,17
 006D2FF6    mov         edx,6D5974;'Type'
 006D2FFB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3000    call        THashTable.Add
 006D3005    mov         ecx,18
 006D300A    mov         edx,6D598C;'Capabilities'
 006D300F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3014    call        THashTable.Add
 006D3019    mov         ecx,19
 006D301E    mov         edx,6D59B4;'FirmwareVersion'
 006D3023    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3028    call        THashTable.Add
 006D302D    mov         ecx,1A
 006D3032    mov         edx,6D59E0;^338:Single
 006D3037    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D303C    call        THashTable.Add
 006D3041    mov         ecx,1B
 006D3046    mov         edx,6D5A10;'ScreenX'
 006D304B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3050    call        THashTable.Add
 006D3055    mov         ecx,1C
 006D305A    mov         edx,6D5A2C;'ScreenY'
 006D305F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3064    call        THashTable.Add
 006D3069    mov         ecx,1D
 006D306E    mov         edx,6D5A48;'VendorID'
 006D3073    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3078    call        THashTable.Add
 006D307D    mov         ecx,1E
 006D3082    mov         edx,6D5A68;'ProductId'
 006D3087    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D308C    call        THashTable.Add
 006D3091    mov         ecx,1F
 006D3096    mov         edx,6D5A88;'Path'
 006D309B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D30A0    call        THashTable.Add
 006D30A5    mov         ecx,42
 006D30AA    mov         edx,6D5AA0;'ExternalMonitor'
 006D30AF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D30B4    call        THashTable.Add
 006D30B9    mov         ecx,42
 006D30BE    mov         edx,6D5ACC;'ExternalMonitorEnabled'
 006D30C3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D30C8    call        THashTable.Add
 006D30CD    mov         ecx,20
 006D30D2    mov         edx,6D5B08;'KeepAlive'
 006D30D7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D30DC    call        THashTable.Add
 006D30E1    mov         ecx,21
 006D30E6    mov         edx,6D5B28;'AcTimeOut'
 006D30EB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D30F0    call        THashTable.Add
 006D30F5    mov         ecx,22
 006D30FA    mov         edx,6D5B48;'UsbTimeOut'
 006D30FF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3104    call        THashTable.Add
 006D3109    mov         ecx,23
 006D310E    mov         edx,6D5B6C;'MouseTrackingSpeedX'
 006D3113    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3118    call        THashTable.Add
 006D311D    mov         ecx,24
 006D3122    mov         edx,6D5BA0;'MouseTrackingSpeedY'
 006D3127    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D312C    call        THashTable.Add
 006D3131    mov         ecx,25
 006D3136    mov         edx,6D5BD4;'MouseTrackingXDir'
 006D313B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3140    call        THashTable.Add
 006D3145    mov         ecx,26
 006D314A    mov         edx,6D5C04;'MouseTrackingYDir'
 006D314F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3154    call        THashTable.Add
 006D3159    mov         ecx,27
 006D315E    mov         edx,6D5C34;'LeftPosX'
 006D3163    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3168    call        THashTable.Add
 006D316D    mov         ecx,28
 006D3172    mov         edx,6D5C54;'LeftPosY'
 006D3177    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D317C    call        THashTable.Add
 006D3181    mov         ecx,29
 006D3186    mov         edx,6D5C74;'RightPosX'
 006D318B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3190    call        THashTable.Add
 006D3195    mov         ecx,2A
 006D319A    mov         edx,6D5C94;'RightPosY'
 006D319F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D31A4    call        THashTable.Add
 006D31A9    mov         ecx,2B
 006D31AE    mov         edx,6D5CB4;'MouseMode'
 006D31B3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D31B8    call        THashTable.Add
 006D31BD    mov         ecx,2C
 006D31C2    mov         edx,6D5CD4;'LeftPixelClock'
 006D31C7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D31CC    call        THashTable.Add
 006D31D1    mov         ecx,2D
 006D31D6    mov         edx,6D5D00;'LeftPhase'
 006D31DB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D31E0    call        THashTable.Add
 006D31E5    mov         ecx,2E
 006D31EA    mov         edx,6D5D20;'RightPixelClock'
 006D31EF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D31F4    call        THashTable.Add
 006D31F9    mov         ecx,2F
 006D31FE    mov         edx,6D5D4C;'RightPhase'
 006D3203    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3208    call        THashTable.Add
 006D320D    mov         ecx,30
 006D3212    mov         edx,6D5D70;'LeftRedGain'
 006D3217    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D321C    call        THashTable.Add
 006D3221    mov         ecx,31
 006D3226    mov         edx,6D5D94;'LeftRedOffset'
 006D322B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3230    call        THashTable.Add
 006D3235    mov         ecx,32
 006D323A    mov         edx,6D5DBC;'LeftGreenGain'
 006D323F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3244    call        THashTable.Add
 006D3249    mov         ecx,33
 006D324E    mov         edx,6D5DE4;'LeftGreenOffset'
 006D3253    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3258    call        THashTable.Add
 006D325D    mov         ecx,34
 006D3262    mov         edx,6D5E10;'LeftBlueGain'
 006D3267    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D326C    call        THashTable.Add
 006D3271    mov         ecx,35
 006D3276    mov         edx,6D5E38;'LeftBlueOffset'
 006D327B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3280    call        THashTable.Add
 006D3285    mov         ecx,36
 006D328A    mov         edx,6D5E64;'RightRedGain'
 006D328F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3294    call        THashTable.Add
 006D3299    mov         ecx,37
 006D329E    mov         edx,6D5E8C;'RightRedOffset'
 006D32A3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D32A8    call        THashTable.Add
 006D32AD    mov         ecx,38
 006D32B2    mov         edx,6D5EB8;'RightGreenGain'
 006D32B7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D32BC    call        THashTable.Add
 006D32C1    mov         ecx,39
 006D32C6    mov         edx,6D5EE4;'RightGreenOffset'
 006D32CB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D32D0    call        THashTable.Add
 006D32D5    mov         ecx,3A
 006D32DA    mov         edx,6D5F14;'RightBlueGain'
 006D32DF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D32E4    call        THashTable.Add
 006D32E9    mov         ecx,3B
 006D32EE    mov         edx,6D5F3C;'RightBlueOffset'
 006D32F3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D32F8    call        THashTable.Add
 006D32FD    mov         ecx,3C
 006D3302    mov         edx,6D5F68;'LeftBrightnessRampHigh'
 006D3307    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D330C    call        THashTable.Add
 006D3311    mov         ecx,3D
 006D3316    mov         edx,6D5FA4;'LeftBrightnessRampMedium'
 006D331B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3320    call        THashTable.Add
 006D3325    mov         ecx,3E
 006D332A    mov         edx,6D5FE4;'LeftBrightnessRampLow'
 006D332F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3334    call        THashTable.Add
 006D3339    mov         ecx,3F
 006D333E    mov         edx,6D601C;'RightBrightnessRampHigh'
 006D3343    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3348    call        THashTable.Add
 006D334D    mov         ecx,40
 006D3352    mov         edx,6D6058;'RightBrightnessRampMedium'
 006D3357    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D335C    call        THashTable.Add
 006D3361    mov         ecx,41
 006D3366    mov         edx,6D6098;'RightBrightnessRampLow'
 006D336B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3370    call        THashTable.Add
 006D3375    mov         ecx,43
 006D337A    mov         edx,6D60D4;'VsyncStereo'
 006D337F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3384    call        THashTable.Add
 006D3389    mov         ecx,43
 006D338E    mov         edx,6D60F8;'StereoVision'
 006D3393    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3398    call        THashTable.Add
 006D339D    mov         ecx,44
 006D33A2    mov         edx,6D6120;'ResetMouseTracking'
 006D33A7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D33AC    call        THashTable.Add
 006D33B1    mov         ecx,45
 006D33B6    mov         edx,6D6154;'CycleBrightnessLevel'
 006D33BB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D33C0    call        THashTable.Add
 006D33C5    mov         ecx,46
 006D33CA    mov         edx,6D618C;'SwapEyes'
 006D33CF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D33D4    call        THashTable.Add
 006D33D9    mov         ecx,47
 006D33DE    mov         edx,6D61AC;'ResetEEPROM'
 006D33E3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D33E8    call        THashTable.Add
 006D33ED    mov         ecx,48
 006D33F2    mov         edx,6D61D0;'RestoreFactorySettings'
 006D33F7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D33FC    call        THashTable.Add
 006D3401    mov         ecx,49
 006D3406    mov         edx,6D620C;'RestoreGainOffsetFactorySettings'
 006D340B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3410    call        THashTable.Add
 006D3415    mov         ecx,4A
 006D341A    mov         edx,6D625C;'RotMat'
 006D341F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3424    call        THashTable.Add
 006D3429    mov         ecx,4B
 006D342E    mov         edx,6D6278;'CompassRotMat'
 006D3433    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3438    call        THashTable.Add
 006D343D    xor         eax,eax
 006D343F    mov         dword ptr [ebp-4],eax
 006D3442    mov         edi,dword ptr ds:[78D7F0];^gvar_00789F18:array[3] of ?
 006D3448    xor         eax,eax
 006D344A    mov         dword ptr [ebp-8],eax
 006D344D    mov         esi,dword ptr ds:[78D6B0];^gvar_00789F24:array[3] of ?
 006D3453    xor         eax,eax
 006D3455    mov         dword ptr [ebp-0C],eax
 006D3458    mov         ebx,dword ptr ds:[78D444];^gvar_00789F30:array[3] of ?
 006D345E    cmp         dword ptr [ebp-4],1
>006D3462    jne         006D3474
 006D3464    cmp         dword ptr [ebp-8],1
>006D3468    jne         006D3474
 006D346A    cmp         dword ptr [ebp-0C],1
>006D346E    je          006D4E12
 006D3474    push        6D62A0;'NoseAngleFrom'
 006D3479    push        dword ptr [edi]
 006D347B    push        dword ptr [esi]
 006D347D    push        dword ptr [ebx]
 006D347F    lea         eax,[ebp-10]
 006D3482    mov         edx,4
 006D3487    call        @UStrCatN
 006D348C    mov         edx,dword ptr [ebp-10]
 006D348F    mov         ecx,dword ptr [ebp-4]
 006D3492    add         ecx,50
 006D3495    mov         eax,dword ptr [ebp-8]
 006D3498    lea         eax,[eax+eax*2]
 006D349B    add         ecx,eax
 006D349D    mov         eax,dword ptr [ebp-0C]
 006D34A0    lea         eax,[eax+eax*8]
 006D34A3    add         ecx,eax
 006D34A5    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D34AA    call        THashTable.Add
 006D34AF    push        6D62C8;'ChinAngleFrom'
 006D34B4    push        dword ptr [edi]
 006D34B6    push        dword ptr [esi]
 006D34B8    push        dword ptr [ebx]
 006D34BA    lea         eax,[ebp-14]
 006D34BD    mov         edx,4
 006D34C2    call        @UStrCatN
 006D34C7    mov         edx,dword ptr [ebp-14]
 006D34CA    mov         ecx,dword ptr [ebp-4]
 006D34CD    add         ecx,6E
 006D34D0    mov         eax,dword ptr [ebp-8]
 006D34D3    lea         eax,[eax+eax*2]
 006D34D6    add         ecx,eax
 006D34D8    mov         eax,dword ptr [ebp-0C]
 006D34DB    lea         eax,[eax+eax*8]
 006D34DE    add         ecx,eax
 006D34E0    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D34E5    call        THashTable.Add
 006D34EA    push        6D62F0;'RightEarAngleFrom'
 006D34EF    push        dword ptr [edi]
 006D34F1    push        dword ptr [esi]
 006D34F3    push        dword ptr [ebx]
 006D34F5    lea         eax,[ebp-18]
 006D34F8    mov         edx,4
 006D34FD    call        @UStrCatN
 006D3502    mov         edx,dword ptr [ebp-18]
 006D3505    mov         ecx,dword ptr [ebp-4]
 006D3508    add         ecx,8C
 006D350E    mov         eax,dword ptr [ebp-8]
 006D3511    lea         eax,[eax+eax*2]
 006D3514    add         ecx,eax
 006D3516    mov         eax,dword ptr [ebp-0C]
 006D3519    lea         eax,[eax+eax*8]
 006D351C    add         ecx,eax
 006D351E    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3523    call        THashTable.Add
 006D3528    push        6D6320;'LeftEarAngleFrom'
 006D352D    push        dword ptr [edi]
 006D352F    push        dword ptr [esi]
 006D3531    push        dword ptr [ebx]
 006D3533    lea         eax,[ebp-1C]
 006D3536    mov         edx,4
 006D353B    call        @UStrCatN
 006D3540    mov         edx,dword ptr [ebp-1C]
 006D3543    mov         ecx,dword ptr [ebp-4]
 006D3546    add         ecx,0AA
 006D354C    mov         eax,dword ptr [ebp-8]
 006D354F    lea         eax,[eax+eax*2]
 006D3552    add         ecx,eax
 006D3554    mov         eax,dword ptr [ebp-0C]
 006D3557    lea         eax,[eax+eax*8]
 006D355A    add         ecx,eax
 006D355C    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3561    call        THashTable.Add
 006D3566    push        6D62A0;'NoseAngleFrom'
 006D356B    push        dword ptr [esi]
 006D356D    push        dword ptr [edi]
 006D356F    push        dword ptr [ebx]
 006D3571    lea         eax,[ebp-20]
 006D3574    mov         edx,4
 006D3579    call        @UStrCatN
 006D357E    mov         edx,dword ptr [ebp-20]
 006D3581    mov         ecx,dword ptr [ebp-4]
 006D3584    add         ecx,50
 006D3587    mov         eax,dword ptr [ebp-8]
 006D358A    lea         eax,[eax+eax*2]
 006D358D    add         ecx,eax
 006D358F    mov         eax,dword ptr [ebp-0C]
 006D3592    lea         eax,[eax+eax*8]
 006D3595    add         ecx,eax
 006D3597    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D359C    call        THashTable.Add
 006D35A1    push        6D62C8;'ChinAngleFrom'
 006D35A6    push        dword ptr [esi]
 006D35A8    push        dword ptr [edi]
 006D35AA    push        dword ptr [ebx]
 006D35AC    lea         eax,[ebp-24]
 006D35AF    mov         edx,4
 006D35B4    call        @UStrCatN
 006D35B9    mov         edx,dword ptr [ebp-24]
 006D35BC    mov         ecx,dword ptr [ebp-4]
 006D35BF    add         ecx,6E
 006D35C2    mov         eax,dword ptr [ebp-8]
 006D35C5    lea         eax,[eax+eax*2]
 006D35C8    add         ecx,eax
 006D35CA    mov         eax,dword ptr [ebp-0C]
 006D35CD    lea         eax,[eax+eax*8]
 006D35D0    add         ecx,eax
 006D35D2    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D35D7    call        THashTable.Add
 006D35DC    push        6D62F0;'RightEarAngleFrom'
 006D35E1    push        dword ptr [esi]
 006D35E3    push        dword ptr [edi]
 006D35E5    push        dword ptr [ebx]
 006D35E7    lea         eax,[ebp-28]
 006D35EA    mov         edx,4
 006D35EF    call        @UStrCatN
 006D35F4    mov         edx,dword ptr [ebp-28]
 006D35F7    mov         ecx,dword ptr [ebp-4]
 006D35FA    add         ecx,8C
 006D3600    mov         eax,dword ptr [ebp-8]
 006D3603    lea         eax,[eax+eax*2]
 006D3606    add         ecx,eax
 006D3608    mov         eax,dword ptr [ebp-0C]
 006D360B    lea         eax,[eax+eax*8]
 006D360E    add         ecx,eax
 006D3610    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3615    call        THashTable.Add
 006D361A    push        6D6320;'LeftEarAngleFrom'
 006D361F    push        dword ptr [esi]
 006D3621    push        dword ptr [edi]
 006D3623    push        dword ptr [ebx]
 006D3625    lea         eax,[ebp-2C]
 006D3628    mov         edx,4
 006D362D    call        @UStrCatN
 006D3632    mov         edx,dword ptr [ebp-2C]
 006D3635    mov         ecx,dword ptr [ebp-4]
 006D3638    add         ecx,0AA
 006D363E    mov         eax,dword ptr [ebp-8]
 006D3641    lea         eax,[eax+eax*2]
 006D3644    add         ecx,eax
 006D3646    mov         eax,dword ptr [ebp-0C]
 006D3649    lea         eax,[eax+eax*8]
 006D364C    add         ecx,eax
 006D364E    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3653    call        THashTable.Add
 006D3658    push        6D62A0;'NoseAngleFrom'
 006D365D    push        dword ptr [esi]
 006D365F    push        dword ptr [ebx]
 006D3661    push        dword ptr [edi]
 006D3663    lea         eax,[ebp-30]
 006D3666    mov         edx,4
 006D366B    call        @UStrCatN
 006D3670    mov         edx,dword ptr [ebp-30]
 006D3673    mov         ecx,dword ptr [ebp-4]
 006D3676    add         ecx,50
 006D3679    mov         eax,dword ptr [ebp-8]
 006D367C    lea         eax,[eax+eax*2]
 006D367F    add         ecx,eax
 006D3681    mov         eax,dword ptr [ebp-0C]
 006D3684    lea         eax,[eax+eax*8]
 006D3687    add         ecx,eax
 006D3689    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D368E    call        THashTable.Add
 006D3693    push        6D62C8;'ChinAngleFrom'
 006D3698    push        dword ptr [esi]
 006D369A    push        dword ptr [ebx]
 006D369C    push        dword ptr [edi]
 006D369E    lea         eax,[ebp-34]
 006D36A1    mov         edx,4
 006D36A6    call        @UStrCatN
 006D36AB    mov         edx,dword ptr [ebp-34]
 006D36AE    mov         ecx,dword ptr [ebp-4]
 006D36B1    add         ecx,6E
 006D36B4    mov         eax,dword ptr [ebp-8]
 006D36B7    lea         eax,[eax+eax*2]
 006D36BA    add         ecx,eax
 006D36BC    mov         eax,dword ptr [ebp-0C]
 006D36BF    lea         eax,[eax+eax*8]
 006D36C2    add         ecx,eax
 006D36C4    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D36C9    call        THashTable.Add
 006D36CE    push        6D62F0;'RightEarAngleFrom'
 006D36D3    push        dword ptr [esi]
 006D36D5    push        dword ptr [ebx]
 006D36D7    push        dword ptr [edi]
 006D36D9    lea         eax,[ebp-38]
 006D36DC    mov         edx,4
 006D36E1    call        @UStrCatN
 006D36E6    mov         edx,dword ptr [ebp-38]
 006D36E9    mov         ecx,dword ptr [ebp-4]
 006D36EC    add         ecx,8C
 006D36F2    mov         eax,dword ptr [ebp-8]
 006D36F5    lea         eax,[eax+eax*2]
 006D36F8    add         ecx,eax
 006D36FA    mov         eax,dword ptr [ebp-0C]
 006D36FD    lea         eax,[eax+eax*8]
 006D3700    add         ecx,eax
 006D3702    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3707    call        THashTable.Add
 006D370C    push        6D6320;'LeftEarAngleFrom'
 006D3711    push        dword ptr [esi]
 006D3713    push        dword ptr [ebx]
 006D3715    push        dword ptr [edi]
 006D3717    lea         eax,[ebp-3C]
 006D371A    mov         edx,4
 006D371F    call        @UStrCatN
 006D3724    mov         edx,dword ptr [ebp-3C]
 006D3727    mov         ecx,dword ptr [ebp-4]
 006D372A    add         ecx,0AA
 006D3730    mov         eax,dword ptr [ebp-8]
 006D3733    lea         eax,[eax+eax*2]
 006D3736    add         ecx,eax
 006D3738    mov         eax,dword ptr [ebp-0C]
 006D373B    lea         eax,[eax+eax*8]
 006D373E    add         ecx,eax
 006D3740    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3745    call        THashTable.Add
 006D374A    push        6D62A0;'NoseAngleFrom'
 006D374F    push        dword ptr [ebx]
 006D3751    push        dword ptr [esi]
 006D3753    push        dword ptr [edi]
 006D3755    lea         eax,[ebp-40]
 006D3758    mov         edx,4
 006D375D    call        @UStrCatN
 006D3762    mov         edx,dword ptr [ebp-40]
 006D3765    mov         ecx,dword ptr [ebp-4]
 006D3768    add         ecx,50
 006D376B    mov         eax,dword ptr [ebp-8]
 006D376E    lea         eax,[eax+eax*2]
 006D3771    add         ecx,eax
 006D3773    mov         eax,dword ptr [ebp-0C]
 006D3776    lea         eax,[eax+eax*8]
 006D3779    add         ecx,eax
 006D377B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3780    call        THashTable.Add
 006D3785    push        6D62C8;'ChinAngleFrom'
 006D378A    push        dword ptr [ebx]
 006D378C    push        dword ptr [esi]
 006D378E    push        dword ptr [edi]
 006D3790    lea         eax,[ebp-44]
 006D3793    mov         edx,4
 006D3798    call        @UStrCatN
 006D379D    mov         edx,dword ptr [ebp-44]
 006D37A0    mov         ecx,dword ptr [ebp-4]
 006D37A3    add         ecx,6E
 006D37A6    mov         eax,dword ptr [ebp-8]
 006D37A9    lea         eax,[eax+eax*2]
 006D37AC    add         ecx,eax
 006D37AE    mov         eax,dword ptr [ebp-0C]
 006D37B1    lea         eax,[eax+eax*8]
 006D37B4    add         ecx,eax
 006D37B6    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D37BB    call        THashTable.Add
 006D37C0    push        6D62F0;'RightEarAngleFrom'
 006D37C5    push        dword ptr [ebx]
 006D37C7    push        dword ptr [esi]
 006D37C9    push        dword ptr [edi]
 006D37CB    lea         eax,[ebp-48]
 006D37CE    mov         edx,4
 006D37D3    call        @UStrCatN
 006D37D8    mov         edx,dword ptr [ebp-48]
 006D37DB    mov         ecx,dword ptr [ebp-4]
 006D37DE    add         ecx,8C
 006D37E4    mov         eax,dword ptr [ebp-8]
 006D37E7    lea         eax,[eax+eax*2]
 006D37EA    add         ecx,eax
 006D37EC    mov         eax,dword ptr [ebp-0C]
 006D37EF    lea         eax,[eax+eax*8]
 006D37F2    add         ecx,eax
 006D37F4    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D37F9    call        THashTable.Add
 006D37FE    push        6D6320;'LeftEarAngleFrom'
 006D3803    push        dword ptr [ebx]
 006D3805    push        dword ptr [esi]
 006D3807    push        dword ptr [edi]
 006D3809    lea         eax,[ebp-4C]
 006D380C    mov         edx,4
 006D3811    call        @UStrCatN
 006D3816    mov         edx,dword ptr [ebp-4C]
 006D3819    mov         ecx,dword ptr [ebp-4]
 006D381C    add         ecx,0AA
 006D3822    mov         eax,dword ptr [ebp-8]
 006D3825    lea         eax,[eax+eax*2]
 006D3828    add         ecx,eax
 006D382A    mov         eax,dword ptr [ebp-0C]
 006D382D    lea         eax,[eax+eax*8]
 006D3830    add         ecx,eax
 006D3832    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3837    call        THashTable.Add
 006D383C    push        6D62A0;'NoseAngleFrom'
 006D3841    push        dword ptr [ebx]
 006D3843    push        dword ptr [edi]
 006D3845    push        dword ptr [esi]
 006D3847    lea         eax,[ebp-50]
 006D384A    mov         edx,4
 006D384F    call        @UStrCatN
 006D3854    mov         edx,dword ptr [ebp-50]
 006D3857    mov         ecx,dword ptr [ebp-4]
 006D385A    add         ecx,50
 006D385D    mov         eax,dword ptr [ebp-8]
 006D3860    lea         eax,[eax+eax*2]
 006D3863    add         ecx,eax
 006D3865    mov         eax,dword ptr [ebp-0C]
 006D3868    lea         eax,[eax+eax*8]
 006D386B    add         ecx,eax
 006D386D    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3872    call        THashTable.Add
 006D3877    push        6D62C8;'ChinAngleFrom'
 006D387C    push        dword ptr [ebx]
 006D387E    push        dword ptr [edi]
 006D3880    push        dword ptr [esi]
 006D3882    lea         eax,[ebp-54]
 006D3885    mov         edx,4
 006D388A    call        @UStrCatN
 006D388F    mov         edx,dword ptr [ebp-54]
 006D3892    mov         ecx,dword ptr [ebp-4]
 006D3895    add         ecx,6E
 006D3898    mov         eax,dword ptr [ebp-8]
 006D389B    lea         eax,[eax+eax*2]
 006D389E    add         ecx,eax
 006D38A0    mov         eax,dword ptr [ebp-0C]
 006D38A3    lea         eax,[eax+eax*8]
 006D38A6    add         ecx,eax
 006D38A8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D38AD    call        THashTable.Add
 006D38B2    push        6D62F0;'RightEarAngleFrom'
 006D38B7    push        dword ptr [ebx]
 006D38B9    push        dword ptr [edi]
 006D38BB    push        dword ptr [esi]
 006D38BD    lea         eax,[ebp-58]
 006D38C0    mov         edx,4
 006D38C5    call        @UStrCatN
 006D38CA    mov         edx,dword ptr [ebp-58]
 006D38CD    mov         ecx,dword ptr [ebp-4]
 006D38D0    add         ecx,8C
 006D38D6    mov         eax,dword ptr [ebp-8]
 006D38D9    lea         eax,[eax+eax*2]
 006D38DC    add         ecx,eax
 006D38DE    mov         eax,dword ptr [ebp-0C]
 006D38E1    lea         eax,[eax+eax*8]
 006D38E4    add         ecx,eax
 006D38E6    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D38EB    call        THashTable.Add
 006D38F0    push        6D6320;'LeftEarAngleFrom'
 006D38F5    push        dword ptr [ebx]
 006D38F7    push        dword ptr [edi]
 006D38F9    push        dword ptr [esi]
 006D38FB    lea         eax,[ebp-5C]
 006D38FE    mov         edx,4
 006D3903    call        @UStrCatN
 006D3908    mov         edx,dword ptr [ebp-5C]
 006D390B    mov         ecx,dword ptr [ebp-4]
 006D390E    add         ecx,0AA
 006D3914    mov         eax,dword ptr [ebp-8]
 006D3917    lea         eax,[eax+eax*2]
 006D391A    add         ecx,eax
 006D391C    mov         eax,dword ptr [ebp-0C]
 006D391F    lea         eax,[eax+eax*8]
 006D3922    add         ecx,eax
 006D3924    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3929    call        THashTable.Add
 006D392E    push        6D62A0;'NoseAngleFrom'
 006D3933    push        dword ptr [edi]
 006D3935    push        dword ptr [ebx]
 006D3937    push        dword ptr [esi]
 006D3939    lea         eax,[ebp-60]
 006D393C    mov         edx,4
 006D3941    call        @UStrCatN
 006D3946    mov         edx,dword ptr [ebp-60]
 006D3949    mov         ecx,dword ptr [ebp-4]
 006D394C    add         ecx,50
 006D394F    mov         eax,dword ptr [ebp-8]
 006D3952    lea         eax,[eax+eax*2]
 006D3955    add         ecx,eax
 006D3957    mov         eax,dword ptr [ebp-0C]
 006D395A    lea         eax,[eax+eax*8]
 006D395D    add         ecx,eax
 006D395F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3964    call        THashTable.Add
 006D3969    push        6D62C8;'ChinAngleFrom'
 006D396E    push        dword ptr [edi]
 006D3970    push        dword ptr [ebx]
 006D3972    push        dword ptr [esi]
 006D3974    lea         eax,[ebp-64]
 006D3977    mov         edx,4
 006D397C    call        @UStrCatN
 006D3981    mov         edx,dword ptr [ebp-64]
 006D3984    mov         ecx,dword ptr [ebp-4]
 006D3987    add         ecx,6E
 006D398A    mov         eax,dword ptr [ebp-8]
 006D398D    lea         eax,[eax+eax*2]
 006D3990    add         ecx,eax
 006D3992    mov         eax,dword ptr [ebp-0C]
 006D3995    lea         eax,[eax+eax*8]
 006D3998    add         ecx,eax
 006D399A    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D399F    call        THashTable.Add
 006D39A4    push        6D62F0;'RightEarAngleFrom'
 006D39A9    push        dword ptr [edi]
 006D39AB    push        dword ptr [ebx]
 006D39AD    push        dword ptr [esi]
 006D39AF    lea         eax,[ebp-68]
 006D39B2    mov         edx,4
 006D39B7    call        @UStrCatN
 006D39BC    mov         edx,dword ptr [ebp-68]
 006D39BF    mov         ecx,dword ptr [ebp-4]
 006D39C2    add         ecx,8C
 006D39C8    mov         eax,dword ptr [ebp-8]
 006D39CB    lea         eax,[eax+eax*2]
 006D39CE    add         ecx,eax
 006D39D0    mov         eax,dword ptr [ebp-0C]
 006D39D3    lea         eax,[eax+eax*8]
 006D39D6    add         ecx,eax
 006D39D8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D39DD    call        THashTable.Add
 006D39E2    push        6D6320;'LeftEarAngleFrom'
 006D39E7    push        dword ptr [edi]
 006D39E9    push        dword ptr [ebx]
 006D39EB    push        dword ptr [esi]
 006D39ED    lea         eax,[ebp-6C]
 006D39F0    mov         edx,4
 006D39F5    call        @UStrCatN
 006D39FA    mov         edx,dword ptr [ebp-6C]
 006D39FD    mov         ecx,dword ptr [ebp-4]
 006D3A00    add         ecx,0AA
 006D3A06    mov         eax,dword ptr [ebp-8]
 006D3A09    lea         eax,[eax+eax*2]
 006D3A0C    add         ecx,eax
 006D3A0E    mov         eax,dword ptr [ebp-0C]
 006D3A11    lea         eax,[eax+eax*8]
 006D3A14    add         ecx,eax
 006D3A16    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3A1B    call        THashTable.Add
 006D3A20    push        6D6350;'Nose'
 006D3A25    push        dword ptr [edi]
 006D3A27    push        dword ptr [esi]
 006D3A29    push        dword ptr [ebx]
 006D3A2B    push        6D6368;'Strict'
 006D3A30    lea         eax,[ebp-70]
 006D3A33    mov         edx,5
 006D3A38    call        @UStrCatN
 006D3A3D    mov         edx,dword ptr [ebp-70]
 006D3A40    mov         ecx,dword ptr [ebp-4]
 006D3A43    add         ecx,140
 006D3A49    mov         eax,dword ptr [ebp-8]
 006D3A4C    lea         eax,[eax+eax*2]
 006D3A4F    add         ecx,eax
 006D3A51    mov         eax,dword ptr [ebp-0C]
 006D3A54    lea         eax,[eax+eax*8]
 006D3A57    add         ecx,eax
 006D3A59    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3A5E    call        THashTable.Add
 006D3A63    push        6D6384;'Chin'
 006D3A68    push        dword ptr [edi]
 006D3A6A    push        dword ptr [esi]
 006D3A6C    push        dword ptr [ebx]
 006D3A6E    push        6D6368;'Strict'
 006D3A73    lea         eax,[ebp-74]
 006D3A76    mov         edx,5
 006D3A7B    call        @UStrCatN
 006D3A80    mov         edx,dword ptr [ebp-74]
 006D3A83    mov         ecx,dword ptr [ebp-4]
 006D3A86    add         ecx,15E
 006D3A8C    mov         eax,dword ptr [ebp-8]
 006D3A8F    lea         eax,[eax+eax*2]
 006D3A92    add         ecx,eax
 006D3A94    mov         eax,dword ptr [ebp-0C]
 006D3A97    lea         eax,[eax+eax*8]
 006D3A9A    add         ecx,eax
 006D3A9C    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3AA1    call        THashTable.Add
 006D3AA6    push        6D639C;'RightEar'
 006D3AAB    push        dword ptr [edi]
 006D3AAD    push        dword ptr [esi]
 006D3AAF    push        dword ptr [ebx]
 006D3AB1    push        6D6368;'Strict'
 006D3AB6    lea         eax,[ebp-78]
 006D3AB9    mov         edx,5
 006D3ABE    call        @UStrCatN
 006D3AC3    mov         edx,dword ptr [ebp-78]
 006D3AC6    mov         ecx,dword ptr [ebp-4]
 006D3AC9    add         ecx,17C
 006D3ACF    mov         eax,dword ptr [ebp-8]
 006D3AD2    lea         eax,[eax+eax*2]
 006D3AD5    add         ecx,eax
 006D3AD7    mov         eax,dword ptr [ebp-0C]
 006D3ADA    lea         eax,[eax+eax*8]
 006D3ADD    add         ecx,eax
 006D3ADF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3AE4    call        THashTable.Add
 006D3AE9    push        6D63BC;'LeftEar'
 006D3AEE    push        dword ptr [edi]
 006D3AF0    push        dword ptr [esi]
 006D3AF2    push        dword ptr [ebx]
 006D3AF4    push        6D6368;'Strict'
 006D3AF9    lea         eax,[ebp-7C]
 006D3AFC    mov         edx,5
 006D3B01    call        @UStrCatN
 006D3B06    mov         edx,dword ptr [ebp-7C]
 006D3B09    mov         ecx,dword ptr [ebp-4]
 006D3B0C    add         ecx,19A
 006D3B12    mov         eax,dword ptr [ebp-8]
 006D3B15    lea         eax,[eax+eax*2]
 006D3B18    add         ecx,eax
 006D3B1A    mov         eax,dword ptr [ebp-0C]
 006D3B1D    lea         eax,[eax+eax*8]
 006D3B20    add         ecx,eax
 006D3B22    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3B27    call        THashTable.Add
 006D3B2C    push        6D6350;'Nose'
 006D3B31    push        dword ptr [esi]
 006D3B33    push        dword ptr [edi]
 006D3B35    push        dword ptr [ebx]
 006D3B37    push        6D6368;'Strict'
 006D3B3C    lea         eax,[ebp-80]
 006D3B3F    mov         edx,5
 006D3B44    call        @UStrCatN
 006D3B49    mov         edx,dword ptr [ebp-80]
 006D3B4C    mov         ecx,dword ptr [ebp-4]
 006D3B4F    add         ecx,140
 006D3B55    mov         eax,dword ptr [ebp-8]
 006D3B58    lea         eax,[eax+eax*2]
 006D3B5B    add         ecx,eax
 006D3B5D    mov         eax,dword ptr [ebp-0C]
 006D3B60    lea         eax,[eax+eax*8]
 006D3B63    add         ecx,eax
 006D3B65    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3B6A    call        THashTable.Add
 006D3B6F    push        6D6384;'Chin'
 006D3B74    push        dword ptr [esi]
 006D3B76    push        dword ptr [edi]
 006D3B78    push        dword ptr [ebx]
 006D3B7A    push        6D6368;'Strict'
 006D3B7F    lea         eax,[ebp-84]
 006D3B85    mov         edx,5
 006D3B8A    call        @UStrCatN
 006D3B8F    mov         edx,dword ptr [ebp-84]
 006D3B95    mov         ecx,dword ptr [ebp-4]
 006D3B98    add         ecx,15E
 006D3B9E    mov         eax,dword ptr [ebp-8]
 006D3BA1    lea         eax,[eax+eax*2]
 006D3BA4    add         ecx,eax
 006D3BA6    mov         eax,dword ptr [ebp-0C]
 006D3BA9    lea         eax,[eax+eax*8]
 006D3BAC    add         ecx,eax
 006D3BAE    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3BB3    call        THashTable.Add
 006D3BB8    push        6D639C;'RightEar'
 006D3BBD    push        dword ptr [esi]
 006D3BBF    push        dword ptr [edi]
 006D3BC1    push        dword ptr [ebx]
 006D3BC3    push        6D6368;'Strict'
 006D3BC8    lea         eax,[ebp-88]
 006D3BCE    mov         edx,5
 006D3BD3    call        @UStrCatN
 006D3BD8    mov         edx,dword ptr [ebp-88]
 006D3BDE    mov         ecx,dword ptr [ebp-4]
 006D3BE1    add         ecx,17C
 006D3BE7    mov         eax,dword ptr [ebp-8]
 006D3BEA    lea         eax,[eax+eax*2]
 006D3BED    add         ecx,eax
 006D3BEF    mov         eax,dword ptr [ebp-0C]
 006D3BF2    lea         eax,[eax+eax*8]
 006D3BF5    add         ecx,eax
 006D3BF7    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3BFC    call        THashTable.Add
 006D3C01    push        6D63BC;'LeftEar'
 006D3C06    push        dword ptr [esi]
 006D3C08    push        dword ptr [edi]
 006D3C0A    push        dword ptr [ebx]
 006D3C0C    push        6D6368;'Strict'
 006D3C11    lea         eax,[ebp-8C]
 006D3C17    mov         edx,5
 006D3C1C    call        @UStrCatN
 006D3C21    mov         edx,dword ptr [ebp-8C]
 006D3C27    mov         ecx,dword ptr [ebp-4]
 006D3C2A    add         ecx,19A
 006D3C30    mov         eax,dword ptr [ebp-8]
 006D3C33    lea         eax,[eax+eax*2]
 006D3C36    add         ecx,eax
 006D3C38    mov         eax,dword ptr [ebp-0C]
 006D3C3B    lea         eax,[eax+eax*8]
 006D3C3E    add         ecx,eax
 006D3C40    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3C45    call        THashTable.Add
 006D3C4A    push        6D6350;'Nose'
 006D3C4F    push        dword ptr [esi]
 006D3C51    push        dword ptr [ebx]
 006D3C53    push        dword ptr [edi]
 006D3C55    push        6D6368;'Strict'
 006D3C5A    lea         eax,[ebp-90]
 006D3C60    mov         edx,5
 006D3C65    call        @UStrCatN
 006D3C6A    mov         edx,dword ptr [ebp-90]
 006D3C70    mov         ecx,dword ptr [ebp-4]
 006D3C73    add         ecx,140
 006D3C79    mov         eax,dword ptr [ebp-8]
 006D3C7C    lea         eax,[eax+eax*2]
 006D3C7F    add         ecx,eax
 006D3C81    mov         eax,dword ptr [ebp-0C]
 006D3C84    lea         eax,[eax+eax*8]
 006D3C87    add         ecx,eax
 006D3C89    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3C8E    call        THashTable.Add
 006D3C93    push        6D6384;'Chin'
 006D3C98    push        dword ptr [esi]
 006D3C9A    push        dword ptr [ebx]
 006D3C9C    push        dword ptr [edi]
 006D3C9E    push        6D6368;'Strict'
 006D3CA3    lea         eax,[ebp-94]
 006D3CA9    mov         edx,5
 006D3CAE    call        @UStrCatN
 006D3CB3    mov         edx,dword ptr [ebp-94]
 006D3CB9    mov         ecx,dword ptr [ebp-4]
 006D3CBC    add         ecx,15E
 006D3CC2    mov         eax,dword ptr [ebp-8]
 006D3CC5    lea         eax,[eax+eax*2]
 006D3CC8    add         ecx,eax
 006D3CCA    mov         eax,dword ptr [ebp-0C]
 006D3CCD    lea         eax,[eax+eax*8]
 006D3CD0    add         ecx,eax
 006D3CD2    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3CD7    call        THashTable.Add
 006D3CDC    push        6D639C;'RightEar'
 006D3CE1    push        dword ptr [esi]
 006D3CE3    push        dword ptr [ebx]
 006D3CE5    push        dword ptr [edi]
 006D3CE7    push        6D6368;'Strict'
 006D3CEC    lea         eax,[ebp-98]
 006D3CF2    mov         edx,5
 006D3CF7    call        @UStrCatN
 006D3CFC    mov         edx,dword ptr [ebp-98]
 006D3D02    mov         ecx,dword ptr [ebp-4]
 006D3D05    add         ecx,17C
 006D3D0B    mov         eax,dword ptr [ebp-8]
 006D3D0E    lea         eax,[eax+eax*2]
 006D3D11    add         ecx,eax
 006D3D13    mov         eax,dword ptr [ebp-0C]
 006D3D16    lea         eax,[eax+eax*8]
 006D3D19    add         ecx,eax
 006D3D1B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3D20    call        THashTable.Add
 006D3D25    push        6D63BC;'LeftEar'
 006D3D2A    push        dword ptr [esi]
 006D3D2C    push        dword ptr [ebx]
 006D3D2E    push        dword ptr [edi]
 006D3D30    push        6D6368;'Strict'
 006D3D35    lea         eax,[ebp-9C]
 006D3D3B    mov         edx,5
 006D3D40    call        @UStrCatN
 006D3D45    mov         edx,dword ptr [ebp-9C]
 006D3D4B    mov         ecx,dword ptr [ebp-4]
 006D3D4E    add         ecx,19A
 006D3D54    mov         eax,dword ptr [ebp-8]
 006D3D57    lea         eax,[eax+eax*2]
 006D3D5A    add         ecx,eax
 006D3D5C    mov         eax,dword ptr [ebp-0C]
 006D3D5F    lea         eax,[eax+eax*8]
 006D3D62    add         ecx,eax
 006D3D64    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3D69    call        THashTable.Add
 006D3D6E    push        6D6350;'Nose'
 006D3D73    push        dword ptr [ebx]
 006D3D75    push        dword ptr [esi]
 006D3D77    push        dword ptr [edi]
 006D3D79    push        6D6368;'Strict'
 006D3D7E    lea         eax,[ebp-0A0]
 006D3D84    mov         edx,5
 006D3D89    call        @UStrCatN
 006D3D8E    mov         edx,dword ptr [ebp-0A0]
 006D3D94    mov         ecx,dword ptr [ebp-4]
 006D3D97    add         ecx,140
 006D3D9D    mov         eax,dword ptr [ebp-8]
 006D3DA0    lea         eax,[eax+eax*2]
 006D3DA3    add         ecx,eax
 006D3DA5    mov         eax,dword ptr [ebp-0C]
 006D3DA8    lea         eax,[eax+eax*8]
 006D3DAB    add         ecx,eax
 006D3DAD    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3DB2    call        THashTable.Add
 006D3DB7    push        6D6384;'Chin'
 006D3DBC    push        dword ptr [ebx]
 006D3DBE    push        dword ptr [esi]
 006D3DC0    push        dword ptr [edi]
 006D3DC2    push        6D6368;'Strict'
 006D3DC7    lea         eax,[ebp-0A4]
 006D3DCD    mov         edx,5
 006D3DD2    call        @UStrCatN
 006D3DD7    mov         edx,dword ptr [ebp-0A4]
 006D3DDD    mov         ecx,dword ptr [ebp-4]
 006D3DE0    add         ecx,15E
 006D3DE6    mov         eax,dword ptr [ebp-8]
 006D3DE9    lea         eax,[eax+eax*2]
 006D3DEC    add         ecx,eax
 006D3DEE    mov         eax,dword ptr [ebp-0C]
 006D3DF1    lea         eax,[eax+eax*8]
 006D3DF4    add         ecx,eax
 006D3DF6    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3DFB    call        THashTable.Add
 006D3E00    push        6D639C;'RightEar'
 006D3E05    push        dword ptr [ebx]
 006D3E07    push        dword ptr [esi]
 006D3E09    push        dword ptr [edi]
 006D3E0B    push        6D6368;'Strict'
 006D3E10    lea         eax,[ebp-0A8]
 006D3E16    mov         edx,5
 006D3E1B    call        @UStrCatN
 006D3E20    mov         edx,dword ptr [ebp-0A8]
 006D3E26    mov         ecx,dword ptr [ebp-4]
 006D3E29    add         ecx,17C
 006D3E2F    mov         eax,dword ptr [ebp-8]
 006D3E32    lea         eax,[eax+eax*2]
 006D3E35    add         ecx,eax
 006D3E37    mov         eax,dword ptr [ebp-0C]
 006D3E3A    lea         eax,[eax+eax*8]
 006D3E3D    add         ecx,eax
 006D3E3F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3E44    call        THashTable.Add
 006D3E49    push        6D63BC;'LeftEar'
 006D3E4E    push        dword ptr [ebx]
 006D3E50    push        dword ptr [esi]
 006D3E52    push        dword ptr [edi]
 006D3E54    push        6D6368;'Strict'
 006D3E59    lea         eax,[ebp-0AC]
 006D3E5F    mov         edx,5
 006D3E64    call        @UStrCatN
 006D3E69    mov         edx,dword ptr [ebp-0AC]
 006D3E6F    mov         ecx,dword ptr [ebp-4]
 006D3E72    add         ecx,19A
 006D3E78    mov         eax,dword ptr [ebp-8]
 006D3E7B    lea         eax,[eax+eax*2]
 006D3E7E    add         ecx,eax
 006D3E80    mov         eax,dword ptr [ebp-0C]
 006D3E83    lea         eax,[eax+eax*8]
 006D3E86    add         ecx,eax
 006D3E88    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3E8D    call        THashTable.Add
 006D3E92    push        6D6350;'Nose'
 006D3E97    push        dword ptr [ebx]
 006D3E99    push        dword ptr [edi]
 006D3E9B    push        dword ptr [esi]
 006D3E9D    push        6D6368;'Strict'
 006D3EA2    lea         eax,[ebp-0B0]
 006D3EA8    mov         edx,5
 006D3EAD    call        @UStrCatN
 006D3EB2    mov         edx,dword ptr [ebp-0B0]
 006D3EB8    mov         ecx,dword ptr [ebp-4]
 006D3EBB    add         ecx,140
 006D3EC1    mov         eax,dword ptr [ebp-8]
 006D3EC4    lea         eax,[eax+eax*2]
 006D3EC7    add         ecx,eax
 006D3EC9    mov         eax,dword ptr [ebp-0C]
 006D3ECC    lea         eax,[eax+eax*8]
 006D3ECF    add         ecx,eax
 006D3ED1    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3ED6    call        THashTable.Add
 006D3EDB    push        6D6384;'Chin'
 006D3EE0    push        dword ptr [ebx]
 006D3EE2    push        dword ptr [edi]
 006D3EE4    push        dword ptr [esi]
 006D3EE6    push        6D6368;'Strict'
 006D3EEB    lea         eax,[ebp-0B4]
 006D3EF1    mov         edx,5
 006D3EF6    call        @UStrCatN
 006D3EFB    mov         edx,dword ptr [ebp-0B4]
 006D3F01    mov         ecx,dword ptr [ebp-4]
 006D3F04    add         ecx,15E
 006D3F0A    mov         eax,dword ptr [ebp-8]
 006D3F0D    lea         eax,[eax+eax*2]
 006D3F10    add         ecx,eax
 006D3F12    mov         eax,dword ptr [ebp-0C]
 006D3F15    lea         eax,[eax+eax*8]
 006D3F18    add         ecx,eax
 006D3F1A    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3F1F    call        THashTable.Add
 006D3F24    push        6D639C;'RightEar'
 006D3F29    push        dword ptr [ebx]
 006D3F2B    push        dword ptr [edi]
 006D3F2D    push        dword ptr [esi]
 006D3F2F    push        6D6368;'Strict'
 006D3F34    lea         eax,[ebp-0B8]
 006D3F3A    mov         edx,5
 006D3F3F    call        @UStrCatN
 006D3F44    mov         edx,dword ptr [ebp-0B8]
 006D3F4A    mov         ecx,dword ptr [ebp-4]
 006D3F4D    add         ecx,17C
 006D3F53    mov         eax,dword ptr [ebp-8]
 006D3F56    lea         eax,[eax+eax*2]
 006D3F59    add         ecx,eax
 006D3F5B    mov         eax,dword ptr [ebp-0C]
 006D3F5E    lea         eax,[eax+eax*8]
 006D3F61    add         ecx,eax
 006D3F63    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3F68    call        THashTable.Add
 006D3F6D    push        6D63BC;'LeftEar'
 006D3F72    push        dword ptr [ebx]
 006D3F74    push        dword ptr [edi]
 006D3F76    push        dword ptr [esi]
 006D3F78    push        6D6368;'Strict'
 006D3F7D    lea         eax,[ebp-0BC]
 006D3F83    mov         edx,5
 006D3F88    call        @UStrCatN
 006D3F8D    mov         edx,dword ptr [ebp-0BC]
 006D3F93    mov         ecx,dword ptr [ebp-4]
 006D3F96    add         ecx,19A
 006D3F9C    mov         eax,dword ptr [ebp-8]
 006D3F9F    lea         eax,[eax+eax*2]
 006D3FA2    add         ecx,eax
 006D3FA4    mov         eax,dword ptr [ebp-0C]
 006D3FA7    lea         eax,[eax+eax*8]
 006D3FAA    add         ecx,eax
 006D3FAC    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3FB1    call        THashTable.Add
 006D3FB6    push        6D6350;'Nose'
 006D3FBB    push        dword ptr [edi]
 006D3FBD    push        dword ptr [ebx]
 006D3FBF    push        dword ptr [esi]
 006D3FC1    push        6D6368;'Strict'
 006D3FC6    lea         eax,[ebp-0C0]
 006D3FCC    mov         edx,5
 006D3FD1    call        @UStrCatN
 006D3FD6    mov         edx,dword ptr [ebp-0C0]
 006D3FDC    mov         ecx,dword ptr [ebp-4]
 006D3FDF    add         ecx,140
 006D3FE5    mov         eax,dword ptr [ebp-8]
 006D3FE8    lea         eax,[eax+eax*2]
 006D3FEB    add         ecx,eax
 006D3FED    mov         eax,dword ptr [ebp-0C]
 006D3FF0    lea         eax,[eax+eax*8]
 006D3FF3    add         ecx,eax
 006D3FF5    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D3FFA    call        THashTable.Add
 006D3FFF    push        6D6384;'Chin'
 006D4004    push        dword ptr [edi]
 006D4006    push        dword ptr [ebx]
 006D4008    push        dword ptr [esi]
 006D400A    push        6D6368;'Strict'
 006D400F    lea         eax,[ebp-0C4]
 006D4015    mov         edx,5
 006D401A    call        @UStrCatN
 006D401F    mov         edx,dword ptr [ebp-0C4]
 006D4025    mov         ecx,dword ptr [ebp-4]
 006D4028    add         ecx,15E
 006D402E    mov         eax,dword ptr [ebp-8]
 006D4031    lea         eax,[eax+eax*2]
 006D4034    add         ecx,eax
 006D4036    mov         eax,dword ptr [ebp-0C]
 006D4039    lea         eax,[eax+eax*8]
 006D403C    add         ecx,eax
 006D403E    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4043    call        THashTable.Add
 006D4048    push        6D639C;'RightEar'
 006D404D    push        dword ptr [edi]
 006D404F    push        dword ptr [ebx]
 006D4051    push        dword ptr [esi]
 006D4053    push        6D6368;'Strict'
 006D4058    lea         eax,[ebp-0C8]
 006D405E    mov         edx,5
 006D4063    call        @UStrCatN
 006D4068    mov         edx,dword ptr [ebp-0C8]
 006D406E    mov         ecx,dword ptr [ebp-4]
 006D4071    add         ecx,17C
 006D4077    mov         eax,dword ptr [ebp-8]
 006D407A    lea         eax,[eax+eax*2]
 006D407D    add         ecx,eax
 006D407F    mov         eax,dword ptr [ebp-0C]
 006D4082    lea         eax,[eax+eax*8]
 006D4085    add         ecx,eax
 006D4087    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D408C    call        THashTable.Add
 006D4091    push        6D63BC;'LeftEar'
 006D4096    push        dword ptr [edi]
 006D4098    push        dword ptr [ebx]
 006D409A    push        dword ptr [esi]
 006D409C    push        6D6368;'Strict'
 006D40A1    lea         eax,[ebp-0CC]
 006D40A7    mov         edx,5
 006D40AC    call        @UStrCatN
 006D40B1    mov         edx,dword ptr [ebp-0CC]
 006D40B7    mov         ecx,dword ptr [ebp-4]
 006D40BA    add         ecx,19A
 006D40C0    mov         eax,dword ptr [ebp-8]
 006D40C3    lea         eax,[eax+eax*2]
 006D40C6    add         ecx,eax
 006D40C8    mov         eax,dword ptr [ebp-0C]
 006D40CB    lea         eax,[eax+eax*8]
 006D40CE    add         ecx,eax
 006D40D0    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D40D5    call        THashTable.Add
 006D40DA    push        6D6350;'Nose'
 006D40DF    push        dword ptr [edi]
 006D40E1    push        dword ptr [esi]
 006D40E3    push        dword ptr [ebx]
 006D40E5    push        6D63D8;'Vague'
 006D40EA    lea         eax,[ebp-0D0]
 006D40F0    mov         edx,5
 006D40F5    call        @UStrCatN
 006D40FA    mov         edx,dword ptr [ebp-0D0]
 006D4100    mov         ecx,dword ptr [ebp-4]
 006D4103    add         ecx,1B8
 006D4109    mov         eax,dword ptr [ebp-8]
 006D410C    lea         eax,[eax+eax*2]
 006D410F    add         ecx,eax
 006D4111    mov         eax,dword ptr [ebp-0C]
 006D4114    lea         eax,[eax+eax*8]
 006D4117    add         ecx,eax
 006D4119    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D411E    call        THashTable.Add
 006D4123    push        6D6384;'Chin'
 006D4128    push        dword ptr [edi]
 006D412A    push        dword ptr [esi]
 006D412C    push        dword ptr [ebx]
 006D412E    push        6D63D8;'Vague'
 006D4133    lea         eax,[ebp-0D4]
 006D4139    mov         edx,5
 006D413E    call        @UStrCatN
 006D4143    mov         edx,dword ptr [ebp-0D4]
 006D4149    mov         ecx,dword ptr [ebp-4]
 006D414C    add         ecx,1D6
 006D4152    mov         eax,dword ptr [ebp-8]
 006D4155    lea         eax,[eax+eax*2]
 006D4158    add         ecx,eax
 006D415A    mov         eax,dword ptr [ebp-0C]
 006D415D    lea         eax,[eax+eax*8]
 006D4160    add         ecx,eax
 006D4162    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4167    call        THashTable.Add
 006D416C    push        6D639C;'RightEar'
 006D4171    push        dword ptr [edi]
 006D4173    push        dword ptr [esi]
 006D4175    push        dword ptr [ebx]
 006D4177    push        6D63D8;'Vague'
 006D417C    lea         eax,[ebp-0D8]
 006D4182    mov         edx,5
 006D4187    call        @UStrCatN
 006D418C    mov         edx,dword ptr [ebp-0D8]
 006D4192    mov         ecx,dword ptr [ebp-4]
 006D4195    add         ecx,1F4
 006D419B    mov         eax,dword ptr [ebp-8]
 006D419E    lea         eax,[eax+eax*2]
 006D41A1    add         ecx,eax
 006D41A3    mov         eax,dword ptr [ebp-0C]
 006D41A6    lea         eax,[eax+eax*8]
 006D41A9    add         ecx,eax
 006D41AB    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D41B0    call        THashTable.Add
 006D41B5    push        6D63BC;'LeftEar'
 006D41BA    push        dword ptr [edi]
 006D41BC    push        dword ptr [esi]
 006D41BE    push        dword ptr [ebx]
 006D41C0    push        6D63D8;'Vague'
 006D41C5    lea         eax,[ebp-0DC]
 006D41CB    mov         edx,5
 006D41D0    call        @UStrCatN
 006D41D5    mov         edx,dword ptr [ebp-0DC]
 006D41DB    mov         ecx,dword ptr [ebp-4]
 006D41DE    add         ecx,212
 006D41E4    mov         eax,dword ptr [ebp-8]
 006D41E7    lea         eax,[eax+eax*2]
 006D41EA    add         ecx,eax
 006D41EC    mov         eax,dword ptr [ebp-0C]
 006D41EF    lea         eax,[eax+eax*8]
 006D41F2    add         ecx,eax
 006D41F4    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D41F9    call        THashTable.Add
 006D41FE    push        6D6350;'Nose'
 006D4203    push        dword ptr [esi]
 006D4205    push        dword ptr [edi]
 006D4207    push        dword ptr [ebx]
 006D4209    push        6D63D8;'Vague'
 006D420E    lea         eax,[ebp-0E0]
 006D4214    mov         edx,5
 006D4219    call        @UStrCatN
 006D421E    mov         edx,dword ptr [ebp-0E0]
 006D4224    mov         ecx,dword ptr [ebp-4]
 006D4227    add         ecx,1B8
 006D422D    mov         eax,dword ptr [ebp-8]
 006D4230    lea         eax,[eax+eax*2]
 006D4233    add         ecx,eax
 006D4235    mov         eax,dword ptr [ebp-0C]
 006D4238    lea         eax,[eax+eax*8]
 006D423B    add         ecx,eax
 006D423D    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4242    call        THashTable.Add
 006D4247    push        6D6384;'Chin'
 006D424C    push        dword ptr [esi]
 006D424E    push        dword ptr [edi]
 006D4250    push        dword ptr [ebx]
 006D4252    push        6D63D8;'Vague'
 006D4257    lea         eax,[ebp-0E4]
 006D425D    mov         edx,5
 006D4262    call        @UStrCatN
 006D4267    mov         edx,dword ptr [ebp-0E4]
 006D426D    mov         ecx,dword ptr [ebp-4]
 006D4270    add         ecx,1D6
 006D4276    mov         eax,dword ptr [ebp-8]
 006D4279    lea         eax,[eax+eax*2]
 006D427C    add         ecx,eax
 006D427E    mov         eax,dword ptr [ebp-0C]
 006D4281    lea         eax,[eax+eax*8]
 006D4284    add         ecx,eax
 006D4286    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D428B    call        THashTable.Add
 006D4290    push        6D639C;'RightEar'
 006D4295    push        dword ptr [esi]
 006D4297    push        dword ptr [edi]
 006D4299    push        dword ptr [ebx]
 006D429B    push        6D63D8;'Vague'
 006D42A0    lea         eax,[ebp-0E8]
 006D42A6    mov         edx,5
 006D42AB    call        @UStrCatN
 006D42B0    mov         edx,dword ptr [ebp-0E8]
 006D42B6    mov         ecx,dword ptr [ebp-4]
 006D42B9    add         ecx,1F4
 006D42BF    mov         eax,dword ptr [ebp-8]
 006D42C2    lea         eax,[eax+eax*2]
 006D42C5    add         ecx,eax
 006D42C7    mov         eax,dword ptr [ebp-0C]
 006D42CA    lea         eax,[eax+eax*8]
 006D42CD    add         ecx,eax
 006D42CF    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D42D4    call        THashTable.Add
 006D42D9    push        6D63BC;'LeftEar'
 006D42DE    push        dword ptr [esi]
 006D42E0    push        dword ptr [edi]
 006D42E2    push        dword ptr [ebx]
 006D42E4    push        6D63D8;'Vague'
 006D42E9    lea         eax,[ebp-0EC]
 006D42EF    mov         edx,5
 006D42F4    call        @UStrCatN
 006D42F9    mov         edx,dword ptr [ebp-0EC]
 006D42FF    mov         ecx,dword ptr [ebp-4]
 006D4302    add         ecx,212
 006D4308    mov         eax,dword ptr [ebp-8]
 006D430B    lea         eax,[eax+eax*2]
 006D430E    add         ecx,eax
 006D4310    mov         eax,dword ptr [ebp-0C]
 006D4313    lea         eax,[eax+eax*8]
 006D4316    add         ecx,eax
 006D4318    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D431D    call        THashTable.Add
 006D4322    push        6D6350;'Nose'
 006D4327    push        dword ptr [esi]
 006D4329    push        dword ptr [ebx]
 006D432B    push        dword ptr [edi]
 006D432D    push        6D63D8;'Vague'
 006D4332    lea         eax,[ebp-0F0]
 006D4338    mov         edx,5
 006D433D    call        @UStrCatN
 006D4342    mov         edx,dword ptr [ebp-0F0]
 006D4348    mov         ecx,dword ptr [ebp-4]
 006D434B    add         ecx,1B8
 006D4351    mov         eax,dword ptr [ebp-8]
 006D4354    lea         eax,[eax+eax*2]
 006D4357    add         ecx,eax
 006D4359    mov         eax,dword ptr [ebp-0C]
 006D435C    lea         eax,[eax+eax*8]
 006D435F    add         ecx,eax
 006D4361    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4366    call        THashTable.Add
 006D436B    push        6D6384;'Chin'
 006D4370    push        dword ptr [esi]
 006D4372    push        dword ptr [ebx]
 006D4374    push        dword ptr [edi]
 006D4376    push        6D63D8;'Vague'
 006D437B    lea         eax,[ebp-0F4]
 006D4381    mov         edx,5
 006D4386    call        @UStrCatN
 006D438B    mov         edx,dword ptr [ebp-0F4]
 006D4391    mov         ecx,dword ptr [ebp-4]
 006D4394    add         ecx,1D6
 006D439A    mov         eax,dword ptr [ebp-8]
 006D439D    lea         eax,[eax+eax*2]
 006D43A0    add         ecx,eax
 006D43A2    mov         eax,dword ptr [ebp-0C]
 006D43A5    lea         eax,[eax+eax*8]
 006D43A8    add         ecx,eax
 006D43AA    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D43AF    call        THashTable.Add
 006D43B4    push        6D639C;'RightEar'
 006D43B9    push        dword ptr [esi]
 006D43BB    push        dword ptr [ebx]
 006D43BD    push        dword ptr [edi]
 006D43BF    push        6D63D8;'Vague'
 006D43C4    lea         eax,[ebp-0F8]
 006D43CA    mov         edx,5
 006D43CF    call        @UStrCatN
 006D43D4    mov         edx,dword ptr [ebp-0F8]
 006D43DA    mov         ecx,dword ptr [ebp-4]
 006D43DD    add         ecx,1F4
 006D43E3    mov         eax,dword ptr [ebp-8]
 006D43E6    lea         eax,[eax+eax*2]
 006D43E9    add         ecx,eax
 006D43EB    mov         eax,dword ptr [ebp-0C]
 006D43EE    lea         eax,[eax+eax*8]
 006D43F1    add         ecx,eax
 006D43F3    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D43F8    call        THashTable.Add
 006D43FD    push        6D63BC;'LeftEar'
 006D4402    push        dword ptr [esi]
 006D4404    push        dword ptr [ebx]
 006D4406    push        dword ptr [edi]
 006D4408    push        6D63D8;'Vague'
 006D440D    lea         eax,[ebp-0FC]
 006D4413    mov         edx,5
 006D4418    call        @UStrCatN
 006D441D    mov         edx,dword ptr [ebp-0FC]
 006D4423    mov         ecx,dword ptr [ebp-4]
 006D4426    add         ecx,212
 006D442C    mov         eax,dword ptr [ebp-8]
 006D442F    lea         eax,[eax+eax*2]
 006D4432    add         ecx,eax
 006D4434    mov         eax,dword ptr [ebp-0C]
 006D4437    lea         eax,[eax+eax*8]
 006D443A    add         ecx,eax
 006D443C    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4441    call        THashTable.Add
 006D4446    push        6D6350;'Nose'
 006D444B    push        dword ptr [ebx]
 006D444D    push        dword ptr [esi]
 006D444F    push        dword ptr [edi]
 006D4451    push        6D63D8;'Vague'
 006D4456    lea         eax,[ebp-100]
 006D445C    mov         edx,5
 006D4461    call        @UStrCatN
 006D4466    mov         edx,dword ptr [ebp-100]
 006D446C    mov         ecx,dword ptr [ebp-4]
 006D446F    add         ecx,1B8
 006D4475    mov         eax,dword ptr [ebp-8]
 006D4478    lea         eax,[eax+eax*2]
 006D447B    add         ecx,eax
 006D447D    mov         eax,dword ptr [ebp-0C]
 006D4480    lea         eax,[eax+eax*8]
 006D4483    add         ecx,eax
 006D4485    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D448A    call        THashTable.Add
 006D448F    push        6D6384;'Chin'
 006D4494    push        dword ptr [ebx]
 006D4496    push        dword ptr [esi]
 006D4498    push        dword ptr [edi]
 006D449A    push        6D63D8;'Vague'
 006D449F    lea         eax,[ebp-104]
 006D44A5    mov         edx,5
 006D44AA    call        @UStrCatN
 006D44AF    mov         edx,dword ptr [ebp-104]
 006D44B5    mov         ecx,dword ptr [ebp-4]
 006D44B8    add         ecx,1D6
 006D44BE    mov         eax,dword ptr [ebp-8]
 006D44C1    lea         eax,[eax+eax*2]
 006D44C4    add         ecx,eax
 006D44C6    mov         eax,dword ptr [ebp-0C]
 006D44C9    lea         eax,[eax+eax*8]
 006D44CC    add         ecx,eax
 006D44CE    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D44D3    call        THashTable.Add
 006D44D8    push        6D639C;'RightEar'
 006D44DD    push        dword ptr [ebx]
 006D44DF    push        dword ptr [esi]
 006D44E1    push        dword ptr [edi]
 006D44E3    push        6D63D8;'Vague'
 006D44E8    lea         eax,[ebp-108]
 006D44EE    mov         edx,5
 006D44F3    call        @UStrCatN
 006D44F8    mov         edx,dword ptr [ebp-108]
 006D44FE    mov         ecx,dword ptr [ebp-4]
 006D4501    add         ecx,1F4
 006D4507    mov         eax,dword ptr [ebp-8]
 006D450A    lea         eax,[eax+eax*2]
 006D450D    add         ecx,eax
 006D450F    mov         eax,dword ptr [ebp-0C]
 006D4512    lea         eax,[eax+eax*8]
 006D4515    add         ecx,eax
 006D4517    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D451C    call        THashTable.Add
 006D4521    push        6D63BC;'LeftEar'
 006D4526    push        dword ptr [ebx]
 006D4528    push        dword ptr [esi]
 006D452A    push        dword ptr [edi]
 006D452C    push        6D63D8;'Vague'
 006D4531    lea         eax,[ebp-10C]
 006D4537    mov         edx,5
 006D453C    call        @UStrCatN
 006D4541    mov         edx,dword ptr [ebp-10C]
 006D4547    mov         ecx,dword ptr [ebp-4]
 006D454A    add         ecx,212
 006D4550    mov         eax,dword ptr [ebp-8]
 006D4553    lea         eax,[eax+eax*2]
 006D4556    add         ecx,eax
 006D4558    mov         eax,dword ptr [ebp-0C]
 006D455B    lea         eax,[eax+eax*8]
 006D455E    add         ecx,eax
 006D4560    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4565    call        THashTable.Add
 006D456A    push        6D6350;'Nose'
 006D456F    push        dword ptr [ebx]
 006D4571    push        dword ptr [edi]
 006D4573    push        dword ptr [esi]
 006D4575    push        6D63D8;'Vague'
 006D457A    lea         eax,[ebp-110]
 006D4580    mov         edx,5
 006D4585    call        @UStrCatN
 006D458A    mov         edx,dword ptr [ebp-110]
 006D4590    mov         ecx,dword ptr [ebp-4]
 006D4593    add         ecx,1B8
 006D4599    mov         eax,dword ptr [ebp-8]
 006D459C    lea         eax,[eax+eax*2]
 006D459F    add         ecx,eax
 006D45A1    mov         eax,dword ptr [ebp-0C]
 006D45A4    lea         eax,[eax+eax*8]
 006D45A7    add         ecx,eax
 006D45A9    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D45AE    call        THashTable.Add
 006D45B3    push        6D6384;'Chin'
 006D45B8    push        dword ptr [ebx]
 006D45BA    push        dword ptr [edi]
 006D45BC    push        dword ptr [esi]
 006D45BE    push        6D63D8;'Vague'
 006D45C3    lea         eax,[ebp-114]
 006D45C9    mov         edx,5
 006D45CE    call        @UStrCatN
 006D45D3    mov         edx,dword ptr [ebp-114]
 006D45D9    mov         ecx,dword ptr [ebp-4]
 006D45DC    add         ecx,1D6
 006D45E2    mov         eax,dword ptr [ebp-8]
 006D45E5    lea         eax,[eax+eax*2]
 006D45E8    add         ecx,eax
 006D45EA    mov         eax,dword ptr [ebp-0C]
 006D45ED    lea         eax,[eax+eax*8]
 006D45F0    add         ecx,eax
 006D45F2    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D45F7    call        THashTable.Add
 006D45FC    push        6D639C;'RightEar'
 006D4601    push        dword ptr [ebx]
 006D4603    push        dword ptr [edi]
 006D4605    push        dword ptr [esi]
 006D4607    push        6D63D8;'Vague'
 006D460C    lea         eax,[ebp-118]
 006D4612    mov         edx,5
 006D4617    call        @UStrCatN
 006D461C    mov         edx,dword ptr [ebp-118]
 006D4622    mov         ecx,dword ptr [ebp-4]
 006D4625    add         ecx,1F4
 006D462B    mov         eax,dword ptr [ebp-8]
 006D462E    lea         eax,[eax+eax*2]
 006D4631    add         ecx,eax
 006D4633    mov         eax,dword ptr [ebp-0C]
 006D4636    lea         eax,[eax+eax*8]
 006D4639    add         ecx,eax
 006D463B    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4640    call        THashTable.Add
 006D4645    push        6D63BC;'LeftEar'
 006D464A    push        dword ptr [ebx]
 006D464C    push        dword ptr [edi]
 006D464E    push        dword ptr [esi]
 006D4650    push        6D63D8;'Vague'
 006D4655    lea         eax,[ebp-11C]
 006D465B    mov         edx,5
 006D4660    call        @UStrCatN
 006D4665    mov         edx,dword ptr [ebp-11C]
 006D466B    mov         ecx,dword ptr [ebp-4]
 006D466E    add         ecx,212
 006D4674    mov         eax,dword ptr [ebp-8]
 006D4677    lea         eax,[eax+eax*2]
 006D467A    add         ecx,eax
 006D467C    mov         eax,dword ptr [ebp-0C]
 006D467F    lea         eax,[eax+eax*8]
 006D4682    add         ecx,eax
 006D4684    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4689    call        THashTable.Add
 006D468E    push        6D6350;'Nose'
 006D4693    push        dword ptr [edi]
 006D4695    push        dword ptr [ebx]
 006D4697    push        dword ptr [esi]
 006D4699    push        6D63D8;'Vague'
 006D469E    lea         eax,[ebp-120]
 006D46A4    mov         edx,5
 006D46A9    call        @UStrCatN
 006D46AE    mov         edx,dword ptr [ebp-120]
 006D46B4    mov         ecx,dword ptr [ebp-4]
 006D46B7    add         ecx,1B8
 006D46BD    mov         eax,dword ptr [ebp-8]
 006D46C0    lea         eax,[eax+eax*2]
 006D46C3    add         ecx,eax
 006D46C5    mov         eax,dword ptr [ebp-0C]
 006D46C8    lea         eax,[eax+eax*8]
 006D46CB    add         ecx,eax
 006D46CD    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D46D2    call        THashTable.Add
 006D46D7    push        6D6384;'Chin'
 006D46DC    push        dword ptr [edi]
 006D46DE    push        dword ptr [ebx]
 006D46E0    push        dword ptr [esi]
 006D46E2    push        6D63D8;'Vague'
 006D46E7    lea         eax,[ebp-124]
 006D46ED    mov         edx,5
 006D46F2    call        @UStrCatN
 006D46F7    mov         edx,dword ptr [ebp-124]
 006D46FD    mov         ecx,dword ptr [ebp-4]
 006D4700    add         ecx,1D6
 006D4706    mov         eax,dword ptr [ebp-8]
 006D4709    lea         eax,[eax+eax*2]
 006D470C    add         ecx,eax
 006D470E    mov         eax,dword ptr [ebp-0C]
 006D4711    lea         eax,[eax+eax*8]
 006D4714    add         ecx,eax
 006D4716    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D471B    call        THashTable.Add
 006D4720    push        6D639C;'RightEar'
 006D4725    push        dword ptr [edi]
 006D4727    push        dword ptr [ebx]
 006D4729    push        dword ptr [esi]
 006D472B    push        6D63D8;'Vague'
 006D4730    lea         eax,[ebp-128]
 006D4736    mov         edx,5
 006D473B    call        @UStrCatN
 006D4740    mov         edx,dword ptr [ebp-128]
 006D4746    mov         ecx,dword ptr [ebp-4]
 006D4749    add         ecx,1F4
 006D474F    mov         eax,dword ptr [ebp-8]
 006D4752    lea         eax,[eax+eax*2]
 006D4755    add         ecx,eax
 006D4757    mov         eax,dword ptr [ebp-0C]
 006D475A    lea         eax,[eax+eax*8]
 006D475D    add         ecx,eax
 006D475F    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4764    call        THashTable.Add
 006D4769    push        6D63BC;'LeftEar'
 006D476E    push        dword ptr [edi]
 006D4770    push        dword ptr [ebx]
 006D4772    push        dword ptr [esi]
 006D4774    push        6D63D8;'Vague'
 006D4779    lea         eax,[ebp-12C]
 006D477F    mov         edx,5
 006D4784    call        @UStrCatN
 006D4789    mov         edx,dword ptr [ebp-12C]
 006D478F    mov         ecx,dword ptr [ebp-4]
 006D4792    add         ecx,212
 006D4798    mov         eax,dword ptr [ebp-8]
 006D479B    lea         eax,[eax+eax*2]
 006D479E    add         ecx,eax
 006D47A0    mov         eax,dword ptr [ebp-0C]
 006D47A3    lea         eax,[eax+eax*8]
 006D47A6    add         ecx,eax
 006D47A8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D47AD    call        THashTable.Add
 006D47B2    push        6D6350;'Nose'
 006D47B7    push        dword ptr [edi]
 006D47B9    push        dword ptr [esi]
 006D47BB    push        dword ptr [ebx]
 006D47BD    lea         eax,[ebp-130]
 006D47C3    mov         edx,4
 006D47C8    call        @UStrCatN
 006D47CD    mov         edx,dword ptr [ebp-130]
 006D47D3    mov         ecx,dword ptr [ebp-4]
 006D47D6    add         ecx,0C8
 006D47DC    mov         eax,dword ptr [ebp-8]
 006D47DF    lea         eax,[eax+eax*2]
 006D47E2    add         ecx,eax
 006D47E4    mov         eax,dword ptr [ebp-0C]
 006D47E7    lea         eax,[eax+eax*8]
 006D47EA    add         ecx,eax
 006D47EC    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D47F1    call        THashTable.Add
 006D47F6    push        6D6384;'Chin'
 006D47FB    push        dword ptr [edi]
 006D47FD    push        dword ptr [esi]
 006D47FF    push        dword ptr [ebx]
 006D4801    lea         eax,[ebp-134]
 006D4807    mov         edx,4
 006D480C    call        @UStrCatN
 006D4811    mov         edx,dword ptr [ebp-134]
 006D4817    mov         ecx,dword ptr [ebp-4]
 006D481A    add         ecx,0E6
 006D4820    mov         eax,dword ptr [ebp-8]
 006D4823    lea         eax,[eax+eax*2]
 006D4826    add         ecx,eax
 006D4828    mov         eax,dword ptr [ebp-0C]
 006D482B    lea         eax,[eax+eax*8]
 006D482E    add         ecx,eax
 006D4830    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4835    call        THashTable.Add
 006D483A    push        6D639C;'RightEar'
 006D483F    push        dword ptr [edi]
 006D4841    push        dword ptr [esi]
 006D4843    push        dword ptr [ebx]
 006D4845    lea         eax,[ebp-138]
 006D484B    mov         edx,4
 006D4850    call        @UStrCatN
 006D4855    mov         edx,dword ptr [ebp-138]
 006D485B    mov         ecx,dword ptr [ebp-4]
 006D485E    add         ecx,104
 006D4864    mov         eax,dword ptr [ebp-8]
 006D4867    lea         eax,[eax+eax*2]
 006D486A    add         ecx,eax
 006D486C    mov         eax,dword ptr [ebp-0C]
 006D486F    lea         eax,[eax+eax*8]
 006D4872    add         ecx,eax
 006D4874    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4879    call        THashTable.Add
 006D487E    push        6D63BC;'LeftEar'
 006D4883    push        dword ptr [edi]
 006D4885    push        dword ptr [esi]
 006D4887    push        dword ptr [ebx]
 006D4889    lea         eax,[ebp-13C]
 006D488F    mov         edx,4
 006D4894    call        @UStrCatN
 006D4899    mov         edx,dword ptr [ebp-13C]
 006D489F    mov         ecx,dword ptr [ebp-4]
 006D48A2    add         ecx,122
 006D48A8    mov         eax,dword ptr [ebp-8]
 006D48AB    lea         eax,[eax+eax*2]
 006D48AE    add         ecx,eax
 006D48B0    mov         eax,dword ptr [ebp-0C]
 006D48B3    lea         eax,[eax+eax*8]
 006D48B6    add         ecx,eax
 006D48B8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D48BD    call        THashTable.Add
 006D48C2    push        6D6350;'Nose'
 006D48C7    push        dword ptr [esi]
 006D48C9    push        dword ptr [edi]
 006D48CB    push        dword ptr [ebx]
 006D48CD    lea         eax,[ebp-140]
 006D48D3    mov         edx,4
 006D48D8    call        @UStrCatN
 006D48DD    mov         edx,dword ptr [ebp-140]
 006D48E3    mov         ecx,dword ptr [ebp-4]
 006D48E6    add         ecx,0C8
 006D48EC    mov         eax,dword ptr [ebp-8]
 006D48EF    lea         eax,[eax+eax*2]
 006D48F2    add         ecx,eax
 006D48F4    mov         eax,dword ptr [ebp-0C]
 006D48F7    lea         eax,[eax+eax*8]
 006D48FA    add         ecx,eax
 006D48FC    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4901    call        THashTable.Add
 006D4906    push        6D6384;'Chin'
 006D490B    push        dword ptr [esi]
 006D490D    push        dword ptr [edi]
 006D490F    push        dword ptr [ebx]
 006D4911    lea         eax,[ebp-144]
 006D4917    mov         edx,4
 006D491C    call        @UStrCatN
 006D4921    mov         edx,dword ptr [ebp-144]
 006D4927    mov         ecx,dword ptr [ebp-4]
 006D492A    add         ecx,0E6
 006D4930    mov         eax,dword ptr [ebp-8]
 006D4933    lea         eax,[eax+eax*2]
 006D4936    add         ecx,eax
 006D4938    mov         eax,dword ptr [ebp-0C]
 006D493B    lea         eax,[eax+eax*8]
 006D493E    add         ecx,eax
 006D4940    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4945    call        THashTable.Add
 006D494A    push        6D639C;'RightEar'
 006D494F    push        dword ptr [esi]
 006D4951    push        dword ptr [edi]
 006D4953    push        dword ptr [ebx]
 006D4955    lea         eax,[ebp-148]
 006D495B    mov         edx,4
 006D4960    call        @UStrCatN
 006D4965    mov         edx,dword ptr [ebp-148]
 006D496B    mov         ecx,dword ptr [ebp-4]
 006D496E    add         ecx,104
 006D4974    mov         eax,dword ptr [ebp-8]
 006D4977    lea         eax,[eax+eax*2]
 006D497A    add         ecx,eax
 006D497C    mov         eax,dword ptr [ebp-0C]
 006D497F    lea         eax,[eax+eax*8]
 006D4982    add         ecx,eax
 006D4984    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4989    call        THashTable.Add
 006D498E    push        6D63BC;'LeftEar'
 006D4993    push        dword ptr [esi]
 006D4995    push        dword ptr [edi]
 006D4997    push        dword ptr [ebx]
 006D4999    lea         eax,[ebp-14C]
 006D499F    mov         edx,4
 006D49A4    call        @UStrCatN
 006D49A9    mov         edx,dword ptr [ebp-14C]
 006D49AF    mov         ecx,dword ptr [ebp-4]
 006D49B2    add         ecx,122
 006D49B8    mov         eax,dword ptr [ebp-8]
 006D49BB    lea         eax,[eax+eax*2]
 006D49BE    add         ecx,eax
 006D49C0    mov         eax,dword ptr [ebp-0C]
 006D49C3    lea         eax,[eax+eax*8]
 006D49C6    add         ecx,eax
 006D49C8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D49CD    call        THashTable.Add
 006D49D2    push        6D6350;'Nose'
 006D49D7    push        dword ptr [esi]
 006D49D9    push        dword ptr [ebx]
 006D49DB    push        dword ptr [edi]
 006D49DD    lea         eax,[ebp-150]
 006D49E3    mov         edx,4
 006D49E8    call        @UStrCatN
 006D49ED    mov         edx,dword ptr [ebp-150]
 006D49F3    mov         ecx,dword ptr [ebp-4]
 006D49F6    add         ecx,0C8
 006D49FC    mov         eax,dword ptr [ebp-8]
 006D49FF    lea         eax,[eax+eax*2]
 006D4A02    add         ecx,eax
 006D4A04    mov         eax,dword ptr [ebp-0C]
 006D4A07    lea         eax,[eax+eax*8]
 006D4A0A    add         ecx,eax
 006D4A0C    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4A11    call        THashTable.Add
 006D4A16    push        6D6384;'Chin'
 006D4A1B    push        dword ptr [esi]
 006D4A1D    push        dword ptr [ebx]
 006D4A1F    push        dword ptr [edi]
 006D4A21    lea         eax,[ebp-154]
 006D4A27    mov         edx,4
 006D4A2C    call        @UStrCatN
 006D4A31    mov         edx,dword ptr [ebp-154]
 006D4A37    mov         ecx,dword ptr [ebp-4]
 006D4A3A    add         ecx,0E6
 006D4A40    mov         eax,dword ptr [ebp-8]
 006D4A43    lea         eax,[eax+eax*2]
 006D4A46    add         ecx,eax
 006D4A48    mov         eax,dword ptr [ebp-0C]
 006D4A4B    lea         eax,[eax+eax*8]
 006D4A4E    add         ecx,eax
 006D4A50    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4A55    call        THashTable.Add
 006D4A5A    push        6D639C;'RightEar'
 006D4A5F    push        dword ptr [esi]
 006D4A61    push        dword ptr [ebx]
 006D4A63    push        dword ptr [edi]
 006D4A65    lea         eax,[ebp-158]
 006D4A6B    mov         edx,4
 006D4A70    call        @UStrCatN
 006D4A75    mov         edx,dword ptr [ebp-158]
 006D4A7B    mov         ecx,dword ptr [ebp-4]
 006D4A7E    add         ecx,104
 006D4A84    mov         eax,dword ptr [ebp-8]
 006D4A87    lea         eax,[eax+eax*2]
 006D4A8A    add         ecx,eax
 006D4A8C    mov         eax,dword ptr [ebp-0C]
 006D4A8F    lea         eax,[eax+eax*8]
 006D4A92    add         ecx,eax
 006D4A94    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4A99    call        THashTable.Add
 006D4A9E    push        6D63BC;'LeftEar'
 006D4AA3    push        dword ptr [esi]
 006D4AA5    push        dword ptr [ebx]
 006D4AA7    push        dword ptr [edi]
 006D4AA9    lea         eax,[ebp-15C]
 006D4AAF    mov         edx,4
 006D4AB4    call        @UStrCatN
 006D4AB9    mov         edx,dword ptr [ebp-15C]
 006D4ABF    mov         ecx,dword ptr [ebp-4]
 006D4AC2    add         ecx,122
 006D4AC8    mov         eax,dword ptr [ebp-8]
 006D4ACB    lea         eax,[eax+eax*2]
 006D4ACE    add         ecx,eax
 006D4AD0    mov         eax,dword ptr [ebp-0C]
 006D4AD3    lea         eax,[eax+eax*8]
 006D4AD6    add         ecx,eax
 006D4AD8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4ADD    call        THashTable.Add
 006D4AE2    push        6D6350;'Nose'
 006D4AE7    push        dword ptr [ebx]
 006D4AE9    push        dword ptr [esi]
 006D4AEB    push        dword ptr [edi]
 006D4AED    lea         eax,[ebp-160]
 006D4AF3    mov         edx,4
 006D4AF8    call        @UStrCatN
 006D4AFD    mov         edx,dword ptr [ebp-160]
 006D4B03    mov         ecx,dword ptr [ebp-4]
 006D4B06    add         ecx,0C8
 006D4B0C    mov         eax,dword ptr [ebp-8]
 006D4B0F    lea         eax,[eax+eax*2]
 006D4B12    add         ecx,eax
 006D4B14    mov         eax,dword ptr [ebp-0C]
 006D4B17    lea         eax,[eax+eax*8]
 006D4B1A    add         ecx,eax
 006D4B1C    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4B21    call        THashTable.Add
 006D4B26    push        6D6384;'Chin'
 006D4B2B    push        dword ptr [ebx]
 006D4B2D    push        dword ptr [esi]
 006D4B2F    push        dword ptr [edi]
 006D4B31    lea         eax,[ebp-164]
 006D4B37    mov         edx,4
 006D4B3C    call        @UStrCatN
 006D4B41    mov         edx,dword ptr [ebp-164]
 006D4B47    mov         ecx,dword ptr [ebp-4]
 006D4B4A    add         ecx,0E6
 006D4B50    mov         eax,dword ptr [ebp-8]
 006D4B53    lea         eax,[eax+eax*2]
 006D4B56    add         ecx,eax
 006D4B58    mov         eax,dword ptr [ebp-0C]
 006D4B5B    lea         eax,[eax+eax*8]
 006D4B5E    add         ecx,eax
 006D4B60    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4B65    call        THashTable.Add
 006D4B6A    push        6D639C;'RightEar'
 006D4B6F    push        dword ptr [ebx]
 006D4B71    push        dword ptr [esi]
 006D4B73    push        dword ptr [edi]
 006D4B75    lea         eax,[ebp-168]
 006D4B7B    mov         edx,4
 006D4B80    call        @UStrCatN
 006D4B85    mov         edx,dword ptr [ebp-168]
 006D4B8B    mov         ecx,dword ptr [ebp-4]
 006D4B8E    add         ecx,104
 006D4B94    mov         eax,dword ptr [ebp-8]
 006D4B97    lea         eax,[eax+eax*2]
 006D4B9A    add         ecx,eax
 006D4B9C    mov         eax,dword ptr [ebp-0C]
 006D4B9F    lea         eax,[eax+eax*8]
 006D4BA2    add         ecx,eax
 006D4BA4    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4BA9    call        THashTable.Add
 006D4BAE    push        6D63BC;'LeftEar'
 006D4BB3    push        dword ptr [ebx]
 006D4BB5    push        dword ptr [esi]
 006D4BB7    push        dword ptr [edi]
 006D4BB9    lea         eax,[ebp-16C]
 006D4BBF    mov         edx,4
 006D4BC4    call        @UStrCatN
 006D4BC9    mov         edx,dword ptr [ebp-16C]
 006D4BCF    mov         ecx,dword ptr [ebp-4]
 006D4BD2    add         ecx,122
 006D4BD8    mov         eax,dword ptr [ebp-8]
 006D4BDB    lea         eax,[eax+eax*2]
 006D4BDE    add         ecx,eax
 006D4BE0    mov         eax,dword ptr [ebp-0C]
 006D4BE3    lea         eax,[eax+eax*8]
 006D4BE6    add         ecx,eax
 006D4BE8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4BED    call        THashTable.Add
 006D4BF2    push        6D6350;'Nose'
 006D4BF7    push        dword ptr [ebx]
 006D4BF9    push        dword ptr [edi]
 006D4BFB    push        dword ptr [esi]
 006D4BFD    lea         eax,[ebp-170]
 006D4C03    mov         edx,4
 006D4C08    call        @UStrCatN
 006D4C0D    mov         edx,dword ptr [ebp-170]
 006D4C13    mov         ecx,dword ptr [ebp-4]
 006D4C16    add         ecx,0C8
 006D4C1C    mov         eax,dword ptr [ebp-8]
 006D4C1F    lea         eax,[eax+eax*2]
 006D4C22    add         ecx,eax
 006D4C24    mov         eax,dword ptr [ebp-0C]
 006D4C27    lea         eax,[eax+eax*8]
 006D4C2A    add         ecx,eax
 006D4C2C    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4C31    call        THashTable.Add
 006D4C36    push        6D6384;'Chin'
 006D4C3B    push        dword ptr [ebx]
 006D4C3D    push        dword ptr [edi]
 006D4C3F    push        dword ptr [esi]
 006D4C41    lea         eax,[ebp-174]
 006D4C47    mov         edx,4
 006D4C4C    call        @UStrCatN
 006D4C51    mov         edx,dword ptr [ebp-174]
 006D4C57    mov         ecx,dword ptr [ebp-4]
 006D4C5A    add         ecx,0E6
 006D4C60    mov         eax,dword ptr [ebp-8]
 006D4C63    lea         eax,[eax+eax*2]
 006D4C66    add         ecx,eax
 006D4C68    mov         eax,dword ptr [ebp-0C]
 006D4C6B    lea         eax,[eax+eax*8]
 006D4C6E    add         ecx,eax
 006D4C70    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4C75    call        THashTable.Add
 006D4C7A    push        6D639C;'RightEar'
 006D4C7F    push        dword ptr [ebx]
 006D4C81    push        dword ptr [edi]
 006D4C83    push        dword ptr [esi]
 006D4C85    lea         eax,[ebp-178]
 006D4C8B    mov         edx,4
 006D4C90    call        @UStrCatN
 006D4C95    mov         edx,dword ptr [ebp-178]
 006D4C9B    mov         ecx,dword ptr [ebp-4]
 006D4C9E    add         ecx,104
 006D4CA4    mov         eax,dword ptr [ebp-8]
 006D4CA7    lea         eax,[eax+eax*2]
 006D4CAA    add         ecx,eax
 006D4CAC    mov         eax,dword ptr [ebp-0C]
 006D4CAF    lea         eax,[eax+eax*8]
 006D4CB2    add         ecx,eax
 006D4CB4    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4CB9    call        THashTable.Add
 006D4CBE    push        6D63BC;'LeftEar'
 006D4CC3    push        dword ptr [ebx]
 006D4CC5    push        dword ptr [edi]
 006D4CC7    push        dword ptr [esi]
 006D4CC9    lea         eax,[ebp-17C]
 006D4CCF    mov         edx,4
 006D4CD4    call        @UStrCatN
 006D4CD9    mov         edx,dword ptr [ebp-17C]
 006D4CDF    mov         ecx,dword ptr [ebp-4]
 006D4CE2    add         ecx,122
 006D4CE8    mov         eax,dword ptr [ebp-8]
 006D4CEB    lea         eax,[eax+eax*2]
 006D4CEE    add         ecx,eax
 006D4CF0    mov         eax,dword ptr [ebp-0C]
 006D4CF3    lea         eax,[eax+eax*8]
 006D4CF6    add         ecx,eax
 006D4CF8    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4CFD    call        THashTable.Add
 006D4D02    push        6D6350;'Nose'
 006D4D07    push        dword ptr [edi]
 006D4D09    push        dword ptr [ebx]
 006D4D0B    push        dword ptr [esi]
 006D4D0D    lea         eax,[ebp-180]
 006D4D13    mov         edx,4
 006D4D18    call        @UStrCatN
 006D4D1D    mov         edx,dword ptr [ebp-180]
 006D4D23    mov         ecx,dword ptr [ebp-4]
 006D4D26    add         ecx,0C8
 006D4D2C    mov         eax,dword ptr [ebp-8]
 006D4D2F    lea         eax,[eax+eax*2]
 006D4D32    add         ecx,eax
 006D4D34    mov         eax,dword ptr [ebp-0C]
 006D4D37    lea         eax,[eax+eax*8]
 006D4D3A    add         ecx,eax
 006D4D3C    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4D41    call        THashTable.Add
 006D4D46    push        6D6384;'Chin'
 006D4D4B    push        dword ptr [edi]
 006D4D4D    push        dword ptr [ebx]
 006D4D4F    push        dword ptr [esi]
 006D4D51    lea         eax,[ebp-184]
 006D4D57    mov         edx,4
 006D4D5C    call        @UStrCatN
 006D4D61    mov         edx,dword ptr [ebp-184]
 006D4D67    mov         ecx,dword ptr [ebp-4]
 006D4D6A    add         ecx,0E6
 006D4D70    mov         eax,dword ptr [ebp-8]
 006D4D73    lea         eax,[eax+eax*2]
 006D4D76    add         ecx,eax
 006D4D78    mov         eax,dword ptr [ebp-0C]
 006D4D7B    lea         eax,[eax+eax*8]
 006D4D7E    add         ecx,eax
 006D4D80    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4D85    call        THashTable.Add
 006D4D8A    push        6D639C;'RightEar'
 006D4D8F    push        dword ptr [edi]
 006D4D91    push        dword ptr [ebx]
 006D4D93    push        dword ptr [esi]
 006D4D95    lea         eax,[ebp-188]
 006D4D9B    mov         edx,4
 006D4DA0    call        @UStrCatN
 006D4DA5    mov         edx,dword ptr [ebp-188]
 006D4DAB    mov         ecx,dword ptr [ebp-4]
 006D4DAE    add         ecx,104
 006D4DB4    mov         eax,dword ptr [ebp-8]
 006D4DB7    lea         eax,[eax+eax*2]
 006D4DBA    add         ecx,eax
 006D4DBC    mov         eax,dword ptr [ebp-0C]
 006D4DBF    lea         eax,[eax+eax*8]
 006D4DC2    add         ecx,eax
 006D4DC4    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4DC9    call        THashTable.Add
 006D4DCE    push        6D63BC;'LeftEar'
 006D4DD3    push        dword ptr [edi]
 006D4DD5    push        dword ptr [ebx]
 006D4DD7    push        dword ptr [esi]
 006D4DD9    lea         eax,[ebp-18C]
 006D4DDF    mov         edx,4
 006D4DE4    call        @UStrCatN
 006D4DE9    mov         edx,dword ptr [ebp-18C]
 006D4DEF    mov         ecx,dword ptr [ebp-4]
 006D4DF2    add         ecx,122
 006D4DF8    mov         eax,dword ptr [ebp-8]
 006D4DFB    lea         eax,[eax+eax*2]
 006D4DFE    add         ecx,eax
 006D4E00    mov         eax,dword ptr [ebp-0C]
 006D4E03    lea         eax,[eax+eax*8]
 006D4E06    add         ecx,eax
 006D4E08    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D4E0D    call        THashTable.Add
 006D4E12    inc         dword ptr [ebp-0C]
 006D4E15    add         ebx,4
 006D4E18    cmp         dword ptr [ebp-0C],3
>006D4E1C    jne         006D345E
 006D4E22    inc         dword ptr [ebp-8]
 006D4E25    add         esi,4
 006D4E28    cmp         dword ptr [ebp-8],3
>006D4E2C    jne         006D3453
 006D4E32    inc         dword ptr [ebp-4]
 006D4E35    add         edi,4
 006D4E38    cmp         dword ptr [ebp-4],3
>006D4E3C    jne         006D3448
 006D4E42    xor         eax,eax
 006D4E44    pop         edx
 006D4E45    pop         ecx
 006D4E46    pop         ecx
 006D4E47    mov         dword ptr fs:[eax],edx
 006D4E4A    push        6D4E67
 006D4E4F    lea         eax,[ebp-18C]
 006D4E55    mov         edx,60
 006D4E5A    call        @UStrArrayClr
 006D4E5F    ret
>006D4E60    jmp         @HandleFinally
>006D4E65    jmp         006D4E4F
 006D4E67    pop         edi
 006D4E68    pop         esi
 006D4E69    pop         ebx
 006D4E6A    mov         esp,ebp
 006D4E6C    pop         ebp
 006D4E6D    ret
*}
end;

//006D63E4
procedure sub_006D63E4;
begin
{*
 006D63E4    mov         byte ptr ds:[81F6E4],0;gvar_0081F6E4
 006D63EB    mov         byte ptr ds:[81F6E5],0;gvar_0081F6E5
 006D63F2    ret
*}
end;

//006D63F4
procedure sub_006D63F4;
begin
{*
 006D63F4    ret
*}
end;

//006D63F8
{*function sub_006D63F8(?:?):?;
begin
 006D63F8    push        ebp
 006D63F9    mov         ebp,esp
 006D63FB    add         esp,0FFFFFFF4
 006D63FE    push        ebx
 006D63FF    push        esi
 006D6400    push        edi
 006D6401    xor         edx,edx
 006D6403    mov         dword ptr [ebp-8],edx
 006D6406    mov         dword ptr [ebp-4],eax
 006D6409    mov         eax,dword ptr [ebp-4]
 006D640C    call        @UStrAddRef
 006D6411    xor         eax,eax
 006D6413    push        ebp
 006D6414    push        6D64DF
 006D6419    push        dword ptr fs:[eax]
 006D641C    mov         dword ptr fs:[eax],esp
 006D641F    xor         esi,esi
 006D6421    lea         eax,[ebp-8]
 006D6424    mov         edx,dword ptr [ebp-4]
 006D6427    call        @UStrLAsg
 006D642C    lea         eax,[ebp-8]
 006D642F    mov         edx,6D64FC;'Nvidia'
 006D6434    call        004F9BD0
 006D6439    test        al,al
>006D643B    je          006D6443
 006D643D    mov         byte ptr [ebp-9],1
>006D6441    jmp         006D6458
 006D6443    lea         eax,[ebp-8]
 006D6446    mov         edx,6D6518;'Z800'
 006D644B    call        004F9BD0
 006D6450    test        al,al
>006D6452    je          006D64C4
 006D6454    mov         byte ptr [ebp-9],0
 006D6458    lea         eax,[ebp-8]
 006D645B    call        004F9D00
 006D6460    mov         edi,eax
 006D6462    lea         eax,[ebp-8]
 006D6465    mov         edx,6D6530;'.'
 006D646A    call        004F9BD0
 006D646F    test        al,al
>006D6471    je          006D64C4
 006D6473    mov         eax,dword ptr [ebp-8]
 006D6476    call        006D9770
 006D647B    mov         ebx,eax
 006D647D    test        ebx,ebx
>006D647F    jl          006D64C4
 006D6481    cmp         byte ptr [ebp-9],0
>006D6485    je          006D648F
 006D6487    cmp         ebx,1F4
>006D648D    jl          006D64C4
 006D648F    mov         dl,1
 006D6491    mov         eax,[006D23EC];TZ800Value
 006D6496    call        TObject.Create;TZ800Value.Create
 006D649B    mov         esi,eax
 006D649D    mov         dword ptr [esi+20],ebx;TZ800Value........................Item:Integer
 006D64A0    test        edi,edi
>006D64A2    jg          006D64A9
 006D64A4    mov         edi,1
 006D64A9    mov         dword ptr [esi+18],edi;TZ800Value..........................................................
 006D64AC    cmp         ebx,1F4
>006D64B2    jl          006D64BD
 006D64B4    mov         byte ptr ds:[81F6E5],1;gvar_0081F6E5
>006D64BB    jmp         006D64C4
 006D64BD    mov         byte ptr ds:[81F6E4],1;gvar_0081F6E4
 006D64C4    xor         eax,eax
 006D64C6    pop         edx
 006D64C7    pop         ecx
 006D64C8    pop         ecx
 006D64C9    mov         dword ptr fs:[eax],edx
 006D64CC    push        6D64E6
 006D64D1    lea         eax,[ebp-8]
 006D64D4    mov         edx,2
 006D64D9    call        @UStrArrayClr
 006D64DE    ret
>006D64DF    jmp         @HandleFinally
>006D64E4    jmp         006D64D1
 006D64E6    mov         eax,esi
 006D64E8    pop         edi
 006D64E9    pop         esi
 006D64EA    pop         ebx
 006D64EB    mov         esp,ebp
 006D64ED    pop         ebp
 006D64EE    ret
end;*}

//006D6534
function TZ800Value.CanSet:Boolean;
begin
{*
 006D6534    xor         eax,eax
 006D6536    ret
*}
end;

//006D6538
procedure TZ800Value.CreateClone;
begin
{*
 006D6538    mov         dl,1
 006D653A    mov         eax,[006D23EC];TZ800Value
 006D653F    call        TObject.Create;TZ800Value.Create
 006D6544    ret
*}
end;

//006D6548
procedure TZ800Value.FillClone(c:TExpression);
begin
{*
 006D6548    push        ebx
 006D6549    push        esi
 006D654A    mov         esi,edx
 006D654C    mov         ebx,eax
 006D654E    mov         edx,esi
 006D6550    mov         eax,ebx
 006D6552    call        TExpression.FillClone
 006D6557    mov         eax,esi
 006D6559    mov         edx,dword ptr [ebx+20];TZ800Value.........................Item:Integer
 006D655C    mov         dword ptr [eax+20],edx
 006D655F    mov         edx,dword ptr [ebx+18];TZ800Value..........................................................
 006D6562    mov         dword ptr [eax+18],edx
 006D6565    pop         esi
 006D6566    pop         ebx
 006D6567    ret
*}
end;

//006D6568
function TZ800Value.GetDataType:TDataType;
begin
{*
 006D6568    mov         eax,dword ptr [eax+20];TZ800Value..........................Item:Integer
 006D656B    cmp         eax,2B
>006D656E    jg          006D6636
>006D6574    je          006D66C1
 006D657A    cmp         eax,2A
>006D657D    ja          006D66E2
 006D6583    jmp         dword ptr [eax*4+6D658A]
 006D6583    dd          006D66AC
 006D6583    dd          006D66AF
 006D6583    dd          006D66B2
 006D6583    dd          006D66B2
 006D6583    dd          006D66B2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66B5
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66B8
 006D6583    dd          006D66BB
 006D6583    dd          006D66BB
 006D6583    dd          006D66E2
 006D6583    dd          006D66BB
 006D6583    dd          006D66BB
 006D6583    dd          006D66BE
 006D6583    dd          006D66BE
 006D6583    dd          006D66B8
 006D6583    dd          006D66C1
 006D6583    dd          006D66E2
 006D6583    dd          006D66E2
 006D6583    dd          006D66C4
 006D6583    dd          006D66C4
 006D6583    dd          006D66C4
 006D6583    dd          006D66C4
 006D6583    dd          006D66C7
 006D6583    dd          006D66C7
 006D6583    dd          006D66C7
 006D6583    dd          006D66C7
 006D6636    cmp         eax,4A
>006D6639    jge         006D666A
 006D663B    cmp         eax,42
>006D663E    jg          006D665D
>006D6640    je          006D66D3
 006D6646    add         eax,0FFFFFFD4
 006D6649    sub         eax,4
>006D664C    jb          006D66CA
 006D664E    sub         eax,0C
>006D6651    jb          006D66CD
 006D6653    sub         eax,6
>006D6656    jb          006D66D0
>006D6658    jmp         006D66E2
 006D665D    sub         eax,43
>006D6660    je          006D66D6
 006D6662    dec         eax
 006D6663    sub         eax,6
>006D6666    jb          006D66D9
>006D6668    jmp         006D66E2
 006D666A    cmp         eax,8C
>006D666F    jge         006D668B
 006D6671    add         eax,0FFFFFFB6
 006D6674    sub         eax,2
>006D6677    jb          006D66A9
 006D6679    add         eax,0FFFFFFFC
 006D667C    sub         eax,1B
>006D667F    jb          006D66DC
 006D6681    add         eax,0FFFFFFFD
 006D6684    sub         eax,1B
>006D6687    jb          006D66DC
>006D6689    jmp         006D66E2
 006D668B    add         eax,0FFFFFF74
 006D6690    sub         eax,1B
>006D6693    jb          006D66DC
 006D6695    add         eax,0FFFFFFFD
 006D6698    sub         eax,1B
>006D669B    jb          006D66DC
 006D669D    add         eax,0FFFFFFFD
 006D66A0    sub         eax,165
>006D66A5    jb          006D66DF
>006D66A7    jmp         006D66E2
 006D66A9    mov         al,6
 006D66AB    ret
 006D66AC    xor         eax,eax
 006D66AE    ret
 006D66AF    mov         al,3
 006D66B1    ret
 006D66B2    mov         al,3
 006D66B4    ret
 006D66B5    mov         al,2
 006D66B7    ret
 006D66B8    mov         al,4
 006D66BA    ret
 006D66BB    mov         al,2
 006D66BD    ret
 006D66BE    mov         al,2
 006D66C0    ret
 006D66C1    mov         al,3
 006D66C3    ret
 006D66C4    mov         al,2
 006D66C6    ret
 006D66C7    mov         al,2
 006D66C9    ret
 006D66CA    mov         al,2
 006D66CC    ret
 006D66CD    mov         al,2
 006D66CF    ret
 006D66D0    mov         al,2
 006D66D2    ret
 006D66D3    mov         al,3
 006D66D5    ret
 006D66D6    mov         al,3
 006D66D8    ret
 006D66D9    mov         al,3
 006D66DB    ret
 006D66DC    mov         al,1
 006D66DE    ret
 006D66DF    mov         al,3
 006D66E1    ret
 006D66E2    xor         eax,eax
 006D66E4    ret
*}
end;

//006D66E8
function TZ800Value.GetPerUnits1:TUnits;
begin
{*
 006D66E8    mov         eax,dword ptr [eax+20];TZ800Value...........................Item:Integer
 006D66EB    add         eax,0FFFFFFFB
 006D66EE    cmp         eax,15
>006D66F1    ja          006D674C
 006D66F3    movzx       eax,byte ptr [eax+6D6701]
 006D66FA    jmp         dword ptr [eax*4+6D6717]
 006D66FA    db          4
 006D66FA    db          4
 006D66FA    db          4
 006D66FA    db          5
 006D66FA    db          5
 006D66FA    db          5
 006D66FA    db          1
 006D66FA    db          1
 006D66FA    db          1
 006D66FA    db          1
 006D66FA    db          0
 006D66FA    db          3
 006D66FA    db          3
 006D66FA    db          3
 006D66FA    db          2
 006D66FA    db          2
 006D66FA    db          2
 006D66FA    db          6
 006D66FA    db          0
 006D66FA    db          0
 006D66FA    db          0
 006D66FA    db          7
 006D66FA    dd          006D674C
 006D66FA    dd          006D6737
 006D66FA    dd          006D673A
 006D66FA    dd          006D673D
 006D66FA    dd          006D6740
 006D66FA    dd          006D6743
 006D66FA    dd          006D6746
 006D66FA    dd          006D6749
 006D6737    xor         eax,eax
 006D6739    ret
 006D673A    xor         eax,eax
 006D673C    ret
 006D673D    mov         al,11
 006D673F    ret
 006D6740    mov         al,11
 006D6742    ret
 006D6743    mov         al,11
 006D6745    ret
 006D6746    mov         al,11
 006D6748    ret
 006D6749    mov         al,11
 006D674B    ret
 006D674C    xor         eax,eax
 006D674E    ret
*}
end;

//006D6750
function TZ800Value.GetPerUnits2:TUnits;
begin
{*
 006D6750    mov         eax,dword ptr [eax+20];TZ800Value............................Item:Integer
 006D6753    add         eax,0FFFFFFFB
 006D6756    cmp         eax,11
>006D6759    ja          006D67A9
 006D675B    movzx       eax,byte ptr [eax+6D6769]
 006D6762    jmp         dword ptr [eax*4+6D677B]
 006D6762    db          5
 006D6762    db          5
 006D6762    db          5
 006D6762    db          4
 006D6762    db          4
 006D6762    db          4
 006D6762    db          1
 006D6762    db          1
 006D6762    db          1
 006D6762    db          1
 006D6762    db          0
 006D6762    db          3
 006D6762    db          3
 006D6762    db          3
 006D6762    db          2
 006D6762    db          2
 006D6762    db          2
 006D6762    db          6
 006D6762    dd          006D67A9
 006D6762    dd          006D6797
 006D6762    dd          006D679A
 006D6762    dd          006D679D
 006D6762    dd          006D67A0
 006D6762    dd          006D67A3
 006D6762    dd          006D67A6
 006D6797    xor         eax,eax
 006D6799    ret
 006D679A    xor         eax,eax
 006D679C    ret
 006D679D    xor         eax,eax
 006D679F    ret
 006D67A0    xor         eax,eax
 006D67A2    ret
 006D67A3    mov         al,11
 006D67A5    ret
 006D67A6    xor         eax,eax
 006D67A8    ret
 006D67A9    xor         eax,eax
 006D67AB    ret
*}
end;

//006D67AC
procedure sub_006D67AC;
begin
{*
 006D67AC    add         esp,0FFFFFFE8
 006D67AF    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D67B6    je          006D6830
 006D67B8    mov         edx,dword ptr ds:[78C280];0x0 gvar_0078C280:Z800Thread
 006D67BE    fld         dword ptr [edx+60]
 006D67C1    fchs
 006D67C3    fmul        dword ptr ds:[6D6870];180:Single
 006D67C9    fld         tbyte ptr ds:[6D6874];3.14159265358979:Extended
 006D67CF    fdivp       st(1),st
 006D67D1    fstp        qword ptr [esp]
 006D67D4    wait
 006D67D5    mov         edx,dword ptr ds:[78C280];0x0 gvar_0078C280:Z800Thread
 006D67DB    fld         dword ptr [edx+64]
 006D67DE    fchs
 006D67E0    fmul        dword ptr ds:[6D6870];180:Single
 006D67E6    fld         tbyte ptr ds:[6D6874];3.14159265358979:Extended
 006D67EC    fdivp       st(1),st
 006D67EE    fstp        qword ptr [esp+8]
 006D67F2    wait
 006D67F3    mov         edx,dword ptr ds:[78C280];0x0 gvar_0078C280:Z800Thread
 006D67F9    fld         dword ptr [edx+68]
 006D67FC    fchs
 006D67FE    fmul        dword ptr ds:[6D6870];180:Single
 006D6804    fld         tbyte ptr ds:[6D6874];3.14159265358979:Extended
 006D680A    fdivp       st(1),st
 006D680C    fstp        qword ptr [esp+10]
 006D6810    wait
 006D6811    push        dword ptr [esp+4]
 006D6815    push        dword ptr [esp+4]
 006D6819    push        dword ptr [esp+14]
 006D681D    push        dword ptr [esp+14]
 006D6821    push        dword ptr [esp+24]
 006D6825    push        dword ptr [esp+24]
 006D6829    call        005C3A28
>006D682E    jmp         006D686A
 006D6830    xor         edx,edx
 006D6832    mov         dword ptr [esp],edx
 006D6835    mov         dword ptr [esp+4],edx
 006D6839    xor         edx,edx
 006D683B    mov         dword ptr [esp+8],edx
 006D683F    mov         dword ptr [esp+0C],edx
 006D6843    xor         edx,edx
 006D6845    mov         dword ptr [esp+10],edx
 006D6849    mov         dword ptr [esp+14],edx
 006D684D    push        dword ptr [esp+4]
 006D6851    push        dword ptr [esp+4]
 006D6855    push        dword ptr [esp+14]
 006D6859    push        dword ptr [esp+14]
 006D685D    push        dword ptr [esp+24]
 006D6861    push        dword ptr [esp+24]
 006D6865    call        005C3A28
 006D686A    add         esp,18
 006D686D    ret
*}
end;

//006D6880
procedure sub_006D6880;
begin
{*
 006D6880    add         esp,0FFFFFFE8
 006D6883    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D688A    je          006D6904
 006D688C    mov         edx,dword ptr ds:[78C280];0x0 gvar_0078C280:Z800Thread
 006D6892    fld         dword ptr [edx+5C]
 006D6895    fchs
 006D6897    fmul        dword ptr ds:[6D6944];180:Single
 006D689D    fld         tbyte ptr ds:[6D6948];3.14159265358979:Extended
 006D68A3    fdivp       st(1),st
 006D68A5    fstp        qword ptr [esp]
 006D68A8    wait
 006D68A9    mov         edx,dword ptr ds:[78C280];0x0 gvar_0078C280:Z800Thread
 006D68AF    fld         dword ptr [edx+64]
 006D68B2    fchs
 006D68B4    fmul        dword ptr ds:[6D6944];180:Single
 006D68BA    fld         tbyte ptr ds:[6D6948];3.14159265358979:Extended
 006D68C0    fdivp       st(1),st
 006D68C2    fstp        qword ptr [esp+8]
 006D68C6    wait
 006D68C7    mov         edx,dword ptr ds:[78C280];0x0 gvar_0078C280:Z800Thread
 006D68CD    fld         dword ptr [edx+68]
 006D68D0    fchs
 006D68D2    fmul        dword ptr ds:[6D6944];180:Single
 006D68D8    fld         tbyte ptr ds:[6D6948];3.14159265358979:Extended
 006D68DE    fdivp       st(1),st
 006D68E0    fstp        qword ptr [esp+10]
 006D68E4    wait
 006D68E5    push        dword ptr [esp+4]
 006D68E9    push        dword ptr [esp+4]
 006D68ED    push        dword ptr [esp+14]
 006D68F1    push        dword ptr [esp+14]
 006D68F5    push        dword ptr [esp+24]
 006D68F9    push        dword ptr [esp+24]
 006D68FD    call        005C3A28
>006D6902    jmp         006D693E
 006D6904    xor         edx,edx
 006D6906    mov         dword ptr [esp],edx
 006D6909    mov         dword ptr [esp+4],edx
 006D690D    xor         edx,edx
 006D690F    mov         dword ptr [esp+8],edx
 006D6913    mov         dword ptr [esp+0C],edx
 006D6917    xor         edx,edx
 006D6919    mov         dword ptr [esp+10],edx
 006D691D    mov         dword ptr [esp+14],edx
 006D6921    push        dword ptr [esp+4]
 006D6925    push        dword ptr [esp+4]
 006D6929    push        dword ptr [esp+14]
 006D692D    push        dword ptr [esp+14]
 006D6931    push        dword ptr [esp+24]
 006D6935    push        dword ptr [esp+24]
 006D6939    call        005C3A28
 006D693E    add         esp,18
 006D6941    ret
*}
end;

//006D6954
procedure TZ800Value.GetRotMat(m:TRotMat);
begin
{*
 006D6954    mov         ecx,dword ptr [eax+20];TZ800Value.............................Item:Integer
 006D6957    sub         ecx,4A
>006D695A    je          006D6961
 006D695C    dec         ecx
>006D695D    je          006D6969
>006D695F    jmp         006D6971
 006D6961    mov         eax,edx
 006D6963    call        006D67AC
 006D6968    ret
 006D6969    mov         eax,edx
 006D696B    call        006D6880
 006D6970    ret
 006D6971    call        TExpression.GetRotMat
 006D6976    ret
*}
end;

//006D6978
{*procedure TZ800Value.GetString(?:?);
begin
 006D6978    push        ebx
 006D6979    push        esi
 006D697A    mov         esi,edx
 006D697C    mov         ebx,eax
 006D697E    mov         eax,dword ptr [ebx+20];TZ800Value..............................Item:Integer
 006D6981    sub         eax,17
>006D6984    je          006D69B8
 006D6986    sub         eax,8
>006D6989    jne         006D6A28
 006D698F    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6996    jne         006D69A4
 006D6998    mov         eax,esi
 006D699A    call        @UStrClr
>006D699F    jmp         006D6A31
 006D69A4    mov         eax,esi
 006D69A6    mov         edx,81F750;gvar_0081F750:PWideChar
 006D69AB    mov         ecx,104
 006D69B0    call        @UStrFromWArray
 006D69B5    pop         esi
 006D69B6    pop         ebx
 006D69B7    ret
 006D69B8    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D69BF    jne         006D69CA
 006D69C1    mov         eax,esi
 006D69C3    call        @UStrClr
>006D69C8    jmp         006D6A31
 006D69CA    mov         ebx,dword ptr ds:[81F728];gvar_0081F728
 006D69D0    mov         eax,ebx
 006D69D2    sub         eax,1
>006D69D5    jb          006D69E1
>006D69D7    je          006D69EF
 006D69D9    dec         eax
>006D69DA    je          006D69FD
 006D69DC    dec         eax
>006D69DD    je          006D6A0B
>006D69DF    jmp         006D6A19
 006D69E1    mov         eax,esi
 006D69E3    mov         edx,6D6A40;'all'
 006D69E8    call        @UStrAsg
>006D69ED    jmp         006D6A31
 006D69EF    mov         eax,esi
 006D69F1    mov         edx,6D6A54;'Z800'
 006D69F6    call        @UStrAsg
>006D69FB    jmp         006D6A31
 006D69FD    mov         eax,esi
 006D69FF    mov         edx,6D6A6C;'Z800B'
 006D6A04    call        @UStrAsg
>006D6A09    jmp         006D6A31
 006D6A0B    mov         eax,esi
 006D6A0D    mov         edx,6D6A84;'X800'
 006D6A12    call        @UStrAsg
>006D6A17    jmp         006D6A31
 006D6A19    mov         eax,ebx
 006D6A1B    movsx       eax,al
 006D6A1E    mov         edx,esi
 006D6A20    call        IntToStr
 006D6A25    pop         esi
 006D6A26    pop         ebx
 006D6A27    ret
 006D6A28    mov         edx,esi
 006D6A2A    mov         eax,ebx
 006D6A2C    call        TExpression.GetString
 006D6A31    pop         esi
 006D6A32    pop         ebx
 006D6A33    ret
end;*}

//006D6A90
function TZ800Value.GetUnits:TUnits;
begin
{*
 006D6A90    mov         eax,dword ptr [eax+20];TZ800Value...............................Item:Integer
 006D6A93    cmp         eax,1A
>006D6A96    jg          006D6AF9
>006D6A98    je          006D6B44
 006D6A9E    add         eax,0FFFFFFFB
 006D6AA1    cmp         eax,11
>006D6AA4    ja          006D6B50
 006D6AAA    jmp         dword ptr [eax*4+6D6AB1]
 006D6AAA    dd          006D6B3E
 006D6AAA    dd          006D6B3E
 006D6AAA    dd          006D6B3E
 006D6AAA    dd          006D6B35
 006D6AAA    dd          006D6B35
 006D6AAA    dd          006D6B35
 006D6AAA    dd          006D6B32
 006D6AAA    dd          006D6B32
 006D6AAA    dd          006D6B32
 006D6AAA    dd          006D6B32
 006D6AAA    dd          006D6B50
 006D6AAA    dd          006D6B3B
 006D6AAA    dd          006D6B3B
 006D6AAA    dd          006D6B3B
 006D6AAA    dd          006D6B38
 006D6AAA    dd          006D6B38
 006D6AAA    dd          006D6B38
 006D6AAA    dd          006D6B41
 006D6AF9    cmp         eax,6E
>006D6AFC    jge         006D6B18
 006D6AFE    add         eax,0FFFFFFE5
 006D6B01    sub         eax,2
>006D6B04    jb          006D6B47
 006D6B06    add         eax,0FFFFFFFC
 006D6B09    sub         eax,2
>006D6B0C    jb          006D6B4A
 006D6B0E    add         eax,0FFFFFFD3
 006D6B11    sub         eax,1B
>006D6B14    jb          006D6B4D
>006D6B16    jmp         006D6B50
 006D6B18    add         eax,0FFFFFF92
 006D6B1B    sub         eax,1B
>006D6B1E    jb          006D6B4D
 006D6B20    add         eax,0FFFFFFFD
 006D6B23    sub         eax,1B
>006D6B26    jb          006D6B4D
 006D6B28    add         eax,0FFFFFFFD
 006D6B2B    sub         eax,1B
>006D6B2E    jb          006D6B4D
>006D6B30    jmp         006D6B50
 006D6B32    mov         al,18
 006D6B34    ret
 006D6B35    mov         al,18
 006D6B37    ret
 006D6B38    mov         al,5
 006D6B3A    ret
 006D6B3B    mov         al,5
 006D6B3D    ret
 006D6B3E    mov         al,5
 006D6B40    ret
 006D6B41    xor         eax,eax
 006D6B43    ret
 006D6B44    xor         eax,eax
 006D6B46    ret
 006D6B47    mov         al,0C
 006D6B49    ret
 006D6B4A    mov         al,11
 006D6B4C    ret
 006D6B4D    mov         al,18
 006D6B4F    ret
 006D6B50    xor         eax,eax
 006D6B52    ret
*}
end;

//006D6B54
procedure TZ800Value.GetValue;
begin
{*
 006D6B54    push        ebx
 006D6B55    add         esp,0FFFFFF74
 006D6B5B    mov         edx,dword ptr [eax+20];TZ800Value................................Item:Integer
 006D6B5E    mov         ecx,edx
 006D6B60    cmp         ecx,2A
>006D6B63    jg          006D6C27
>006D6B69    je          006D7672
 006D6B6F    cmp         ecx,29
>006D6B72    ja          006D84ED
 006D6B78    jmp         dword ptr [ecx*4+6D6B7F]
 006D6B78    dd          006D6DE1
 006D6B78    dd          006D6DEF
 006D6B78    dd          006D6E07
 006D6B78    dd          006D6E73
 006D6B78    dd          006D6E3D
 006D6B78    dd          006D6ED7
 006D6B78    dd          006D6EFF
 006D6B78    dd          006D6F29
 006D6B78    dd          006D6F53
 006D6B78    dd          006D6F89
 006D6B78    dd          006D6FC1
 006D6B78    dd          006D70A7
 006D6B78    dd          006D6FF9
 006D6B78    dd          006D7031
 006D6B78    dd          006D7069
 006D6B78    dd          006D6EA9
 006D6B78    dd          006D70FF
 006D6B78    dd          006D7127
 006D6B78    dd          006D714F
 006D6B78    dd          006D7177
 006D6B78    dd          006D719F
 006D6B78    dd          006D71C7
 006D6B78    dd          006D71F2
 006D6B78    dd          006D7248
 006D6B78    dd          006D727E
 006D6B78    dd          006D72B3
 006D6B78    dd          006D72D9
 006D6B78    dd          006D72FF
 006D6B78    dd          006D7325
 006D6B78    dd          006D734B
 006D6B78    dd          006D7371
 006D6B78    dd          006D84E2
 006D6B78    dd          006D7397
 006D6B78    dd          006D748A
 006D6B78    dd          006D7446
 006D6B78    dd          006D74CE
 006D6B78    dd          006D750A
 006D6B78    dd          006D7546
 006D6B78    dd          006D7582
 006D6B78    dd          006D75BE
 006D6B78    dd          006D75FA
 006D6B78    dd          006D7636
 006D6C27    cmp         ecx,3F
>006D6C2A    jg          006D6C95
>006D6C2C    je          006D7B22
 006D6C32    add         ecx,0FFFFFFD5
 006D6C35    cmp         ecx,13
>006D6C38    ja          006D84ED
 006D6C3E    jmp         dword ptr [ecx*4+6D6C45]
 006D6C3E    dd          006D73AC
 006D6C3E    dd          006D76AE
 006D6C3E    dd          006D76EA
 006D6C3E    dd          006D7726
 006D6C3E    dd          006D7762
 006D6C3E    dd          006D779E
 006D6C3E    dd          006D77DA
 006D6C3E    dd          006D7816
 006D6C3E    dd          006D7852
 006D6C3E    dd          006D788E
 006D6C3E    dd          006D78CA
 006D6C3E    dd          006D7906
 006D6C3E    dd          006D7942
 006D6C3E    dd          006D797E
 006D6C3E    dd          006D79BA
 006D6C3E    dd          006D79F6
 006D6C3E    dd          006D7A32
 006D6C3E    dd          006D7A6E
 006D6C3E    dd          006D7AAA
 006D6C3E    dd          006D7AE6
 006D6C95    cmp         ecx,104
>006D6C9B    jge         006D6D31
 006D6CA1    cmp         ecx,6E
>006D6CA4    jge         006D6CE0
 006D6CA6    cmp         ecx,42
>006D6CA9    jg          006D6CC6
>006D6CAB    je          006D740A
 006D6CB1    sub         ecx,40
>006D6CB4    je          006D7B5E
 006D6CBA    dec         ecx
>006D6CBB    je          006D7B9A
>006D6CC1    jmp         006D84ED
 006D6CC6    sub         ecx,43
>006D6CC9    je          006D73DB
 006D6CCF    add         ecx,0FFFFFFF3
 006D6CD2    sub         ecx,1B
>006D6CD5    jb          006D7BD6
>006D6CDB    jmp         006D84ED
 006D6CE0    cmp         ecx,0AA
>006D6CE6    jge         006D6D05
 006D6CE8    add         ecx,0FFFFFF92
 006D6CEB    sub         ecx,1B
>006D6CEE    jb          006D7C60
 006D6CF4    add         ecx,0FFFFFFFD
 006D6CF7    sub         ecx,1B
>006D6CFA    jb          006D7CD8
>006D6D00    jmp         006D84ED
 006D6D05    add         ecx,0FFFFFF56
 006D6D0B    sub         ecx,1B
>006D6D0E    jb          006D7D65
 006D6D14    add         ecx,0FFFFFFFD
 006D6D17    sub         ecx,1B
>006D6D1A    jb          006D7DE0
 006D6D20    add         ecx,0FFFFFFFD
 006D6D23    sub         ecx,1B
>006D6D26    jb          006D7E7F
>006D6D2C    jmp         006D84ED
 006D6D31    cmp         ecx,19A
>006D6D37    jge         006D6D8D
 006D6D39    cmp         ecx,140
>006D6D3F    jge         006D6D61
 006D6D41    add         ecx,0FFFFFEFC
 006D6D47    sub         ecx,1B
>006D6D4A    jb          006D7F0C
 006D6D50    add         ecx,0FFFFFFFD
 006D6D53    sub         ecx,1B
>006D6D56    jb          006D7FAB
>006D6D5C    jmp         006D84ED
 006D6D61    add         ecx,0FFFFFEC0
 006D6D67    sub         ecx,1B
>006D6D6A    jb          006D8290
 006D6D70    add         ecx,0FFFFFFFD
 006D6D73    sub         ecx,1B
>006D6D76    jb          006D832F
 006D6D7C    add         ecx,0FFFFFFFD
 006D6D7F    sub         ecx,1B
>006D6D82    jb          006D83BC
>006D6D88    jmp         006D84ED
 006D6D8D    cmp         ecx,1D6
>006D6D93    jge         006D6DB5
 006D6D95    add         ecx,0FFFFFE66
 006D6D9B    sub         ecx,1B
>006D6D9E    jb          006D845B
 006D6DA4    add         ecx,0FFFFFFFD
 006D6DA7    sub         ecx,1B
>006D6DAA    jb          006D8038
>006D6DB0    jmp         006D84ED
 006D6DB5    add         ecx,0FFFFFE2A
 006D6DBB    sub         ecx,1B
>006D6DBE    jb          006D80D7
 006D6DC4    add         ecx,0FFFFFFFD
 006D6DC7    sub         ecx,1B
>006D6DCA    jb          006D8164
 006D6DD0    add         ecx,0FFFFFFFD
 006D6DD3    sub         ecx,1B
>006D6DD6    jb          006D8203
>006D6DDC    jmp         006D84ED
 006D6DE1    xor         eax,eax
 006D6DE3    mov         dword ptr [esp],eax
 006D6DE6    mov         dword ptr [esp+4],eax
>006D6DEA    jmp         006D84F6
 006D6DEF    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
 006D6DF6    setne       al
 006D6DF9    call        00686074
 006D6DFE    fstp        qword ptr [esp]
 006D6E01    wait
>006D6E02    jmp         006D84F6
 006D6E07    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6E0E    jne         006D6E20
 006D6E10    mov         al,1
 006D6E12    call        00686074
 006D6E17    fstp        qword ptr [esp]
 006D6E1A    wait
>006D6E1B    jmp         006D84F6
 006D6E20    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6E25    cmp         dword ptr [eax+40],8000000E
 006D6E2C    sete        al
 006D6E2F    call        00686074
 006D6E34    fstp        qword ptr [esp]
 006D6E37    wait
>006D6E38    jmp         006D84F6
 006D6E3D    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6E44    jne         006D6E56
 006D6E46    mov         al,1
 006D6E48    call        00686074
 006D6E4D    fstp        qword ptr [esp]
 006D6E50    wait
>006D6E51    jmp         006D84F6
 006D6E56    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6E5B    cmp         dword ptr [eax+40],80000002
 006D6E62    sete        al
 006D6E65    call        00686074
 006D6E6A    fstp        qword ptr [esp]
 006D6E6D    wait
>006D6E6E    jmp         006D84F6
 006D6E73    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6E7A    jne         006D6E8C
 006D6E7C    mov         al,1
 006D6E7E    call        00686074
 006D6E83    fstp        qword ptr [esp]
 006D6E86    wait
>006D6E87    jmp         006D84F6
 006D6E8C    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6E91    cmp         dword ptr [eax+40],8000000F
 006D6E98    sete        al
 006D6E9B    call        00686074
 006D6EA0    fstp        qword ptr [esp]
 006D6EA3    wait
>006D6EA4    jmp         006D84F6
 006D6EA9    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6EB0    jne         006D6EC6
 006D6EB2    mov         dword ptr [esp],1E00000
 006D6EB9    mov         dword ptr [esp+4],41E00000
>006D6EC1    jmp         006D84F6
 006D6EC6    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6ECB    fild        dword ptr [eax+40]
 006D6ECE    fstp        qword ptr [esp]
 006D6ED1    wait
>006D6ED2    jmp         006D84F6
 006D6ED7    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6EDE    jne         006D6EEE
 006D6EE0    xor         eax,eax
 006D6EE2    mov         dword ptr [esp],eax
 006D6EE5    mov         dword ptr [esp+4],eax
>006D6EE9    jmp         006D84F6
 006D6EEE    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6EF3    fld         dword ptr [eax+48]
 006D6EF6    fstp        qword ptr [esp]
 006D6EF9    wait
>006D6EFA    jmp         006D84F6
 006D6EFF    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6F06    jne         006D6F16
 006D6F08    xor         eax,eax
 006D6F0A    mov         dword ptr [esp],eax
 006D6F0D    mov         dword ptr [esp+4],eax
>006D6F11    jmp         006D84F6
 006D6F16    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6F1B    fld         dword ptr [eax+4C]
 006D6F1E    fchs
 006D6F20    fstp        qword ptr [esp]
 006D6F23    wait
>006D6F24    jmp         006D84F6
 006D6F29    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6F30    jne         006D6F40
 006D6F32    xor         eax,eax
 006D6F34    mov         dword ptr [esp],eax
 006D6F37    mov         dword ptr [esp+4],eax
>006D6F3B    jmp         006D84F6
 006D6F40    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6F45    fld         dword ptr [eax+44]
 006D6F48    fchs
 006D6F4A    fstp        qword ptr [esp]
 006D6F4D    wait
>006D6F4E    jmp         006D84F6
 006D6F53    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6F5A    jne         006D6F6A
 006D6F5C    xor         eax,eax
 006D6F5E    mov         dword ptr [esp],eax
 006D6F61    mov         dword ptr [esp+4],eax
>006D6F65    jmp         006D84F6
 006D6F6A    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6F6F    fld         dword ptr [eax+54]
 006D6F72    fmul        dword ptr ds:[6D8504];180:Single
 006D6F78    fld         tbyte ptr ds:[6D8508];3.14159265358979:Extended
 006D6F7E    fdivp       st(1),st
 006D6F80    fstp        qword ptr [esp]
 006D6F83    wait
>006D6F84    jmp         006D84F6
 006D6F89    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6F90    jne         006D6FA0
 006D6F92    xor         eax,eax
 006D6F94    mov         dword ptr [esp],eax
 006D6F97    mov         dword ptr [esp+4],eax
>006D6F9B    jmp         006D84F6
 006D6FA0    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6FA5    fld         dword ptr [eax+58]
 006D6FA8    fchs
 006D6FAA    fmul        dword ptr ds:[6D8504];180:Single
 006D6FB0    fld         tbyte ptr ds:[6D8508];3.14159265358979:Extended
 006D6FB6    fdivp       st(1),st
 006D6FB8    fstp        qword ptr [esp]
 006D6FBB    wait
>006D6FBC    jmp         006D84F6
 006D6FC1    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D6FC8    jne         006D6FD8
 006D6FCA    xor         eax,eax
 006D6FCC    mov         dword ptr [esp],eax
 006D6FCF    mov         dword ptr [esp+4],eax
>006D6FD3    jmp         006D84F6
 006D6FD8    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D6FDD    fld         dword ptr [eax+50]
 006D6FE0    fchs
 006D6FE2    fmul        dword ptr ds:[6D8504];180:Single
 006D6FE8    fld         tbyte ptr ds:[6D8508];3.14159265358979:Extended
 006D6FEE    fdivp       st(1),st
 006D6FF0    fstp        qword ptr [esp]
 006D6FF3    wait
>006D6FF4    jmp         006D84F6
 006D6FF9    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7000    jne         006D7010
 006D7002    xor         eax,eax
 006D7004    mov         dword ptr [esp],eax
 006D7007    mov         dword ptr [esp+4],eax
>006D700B    jmp         006D84F6
 006D7010    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D7015    fld         dword ptr [eax+60]
 006D7018    fchs
 006D701A    fmul        dword ptr ds:[6D8504];180:Single
 006D7020    fld         tbyte ptr ds:[6D8508];3.14159265358979:Extended
 006D7026    fdivp       st(1),st
 006D7028    fstp        qword ptr [esp]
 006D702B    wait
>006D702C    jmp         006D84F6
 006D7031    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7038    jne         006D7048
 006D703A    xor         eax,eax
 006D703C    mov         dword ptr [esp],eax
 006D703F    mov         dword ptr [esp+4],eax
>006D7043    jmp         006D84F6
 006D7048    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D704D    fld         dword ptr [eax+64]
 006D7050    fchs
 006D7052    fmul        dword ptr ds:[6D8504];180:Single
 006D7058    fld         tbyte ptr ds:[6D8508];3.14159265358979:Extended
 006D705E    fdivp       st(1),st
 006D7060    fstp        qword ptr [esp]
 006D7063    wait
>006D7064    jmp         006D84F6
 006D7069    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7070    jne         006D7080
 006D7072    xor         eax,eax
 006D7074    mov         dword ptr [esp],eax
 006D7077    mov         dword ptr [esp+4],eax
>006D707B    jmp         006D84F6
 006D7080    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D7085    fld         dword ptr [eax+68]
 006D7088    fchs
 006D708A    fmul        dword ptr ds:[6D8504];180:Single
 006D7090    fld         tbyte ptr ds:[6D8508];3.14159265358979:Extended
 006D7096    fdivp       st(1),st
 006D7098    fmul        dword ptr ds:[6D8514];-1:Single
 006D709E    fstp        qword ptr [esp]
 006D70A1    wait
>006D70A2    jmp         006D84F6
 006D70A7    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D70AE    jne         006D70BE
 006D70B0    xor         eax,eax
 006D70B2    mov         dword ptr [esp],eax
 006D70B5    mov         dword ptr [esp+4],eax
>006D70B9    jmp         006D84F6
 006D70BE    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D70C3    fld         dword ptr [eax+5C]
 006D70C6    fchs
 006D70C8    fmul        dword ptr ds:[6D8504];180:Single
 006D70CE    fld         tbyte ptr ds:[6D8508];3.14159265358979:Extended
 006D70D4    fdivp       st(1),st
 006D70D6    fstp        qword ptr [esp]
 006D70D9    wait
 006D70DA    fld         qword ptr [esp]
 006D70DD    fcomp       dword ptr ds:[6D8518];0:Single
 006D70E3    wait
 006D70E4    fnstsw      al
 006D70E6    sahf
>006D70E7    jae         006D84F6
 006D70ED    fld         qword ptr [esp]
 006D70F0    fadd        dword ptr ds:[6D851C];360:Single
 006D70F6    fstp        qword ptr [esp]
 006D70F9    wait
>006D70FA    jmp         006D84F6
 006D70FF    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7106    jne         006D7116
 006D7108    xor         eax,eax
 006D710A    mov         dword ptr [esp],eax
 006D710D    mov         dword ptr [esp+4],eax
>006D7111    jmp         006D84F6
 006D7116    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D711B    fld         dword ptr [eax+6C]
 006D711E    fstp        qword ptr [esp]
 006D7121    wait
>006D7122    jmp         006D84F6
 006D7127    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D712E    jne         006D713E
 006D7130    xor         eax,eax
 006D7132    mov         dword ptr [esp],eax
 006D7135    mov         dword ptr [esp+4],eax
>006D7139    jmp         006D84F6
 006D713E    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D7143    fld         dword ptr [eax+70]
 006D7146    fstp        qword ptr [esp]
 006D7149    wait
>006D714A    jmp         006D84F6
 006D714F    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7156    jne         006D7166
 006D7158    xor         eax,eax
 006D715A    mov         dword ptr [esp],eax
 006D715D    mov         dword ptr [esp+4],eax
>006D7161    jmp         006D84F6
 006D7166    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D716B    fld         dword ptr [eax+74]
 006D716E    fstp        qword ptr [esp]
 006D7171    wait
>006D7172    jmp         006D84F6
 006D7177    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D717E    jne         006D718E
 006D7180    xor         eax,eax
 006D7182    mov         dword ptr [esp],eax
 006D7185    mov         dword ptr [esp+4],eax
>006D7189    jmp         006D84F6
 006D718E    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D7193    fld         dword ptr [eax+78]
 006D7196    fstp        qword ptr [esp]
 006D7199    wait
>006D719A    jmp         006D84F6
 006D719F    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D71A6    jne         006D71B6
 006D71A8    xor         eax,eax
 006D71AA    mov         dword ptr [esp],eax
 006D71AD    mov         dword ptr [esp+4],eax
>006D71B1    jmp         006D84F6
 006D71B6    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D71BB    fld         dword ptr [eax+7C]
 006D71BE    fstp        qword ptr [esp]
 006D71C1    wait
>006D71C2    jmp         006D84F6
 006D71C7    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D71CE    jne         006D71DE
 006D71D0    xor         eax,eax
 006D71D2    mov         dword ptr [esp],eax
 006D71D5    mov         dword ptr [esp+4],eax
>006D71D9    jmp         006D84F6
 006D71DE    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D71E3    fld         dword ptr [eax+80]
 006D71E9    fstp        qword ptr [esp]
 006D71EC    wait
>006D71ED    jmp         006D84F6
 006D71F2    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D71F9    jne         006D7209
 006D71FB    xor         eax,eax
 006D71FD    mov         dword ptr [esp],eax
 006D7200    mov         dword ptr [esp+4],eax
>006D7204    jmp         006D84F6
 006D7209    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D720E    fld         qword ptr [eax+88]
 006D7214    fcomp       dword ptr ds:[6D8518];0:Single
 006D721A    wait
 006D721B    fnstsw      al
 006D721D    sahf
>006D721E    jne         006D722E
 006D7220    xor         eax,eax
 006D7222    mov         dword ptr [esp],eax
 006D7225    mov         dword ptr [esp+4],eax
>006D7229    jmp         006D84F6
 006D722E    fld         dword ptr ds:[6D8520];1:Single
 006D7234    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D7239    fdiv        qword ptr [eax+88]
 006D723F    fstp        qword ptr [esp]
 006D7242    wait
>006D7243    jmp         006D84F6
 006D7248    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D724F    jne         006D725F
 006D7251    xor         eax,eax
 006D7253    mov         dword ptr [esp],eax
 006D7256    mov         dword ptr [esp+4],eax
>006D725A    jmp         006D84F6
 006D725F    mov         eax,[0081F728];gvar_0081F728
 006D7264    movsx       eax,al
 006D7267    mov         dword ptr [esp+88],eax
 006D726E    fild        dword ptr [esp+88]
 006D7275    fstp        qword ptr [esp]
 006D7278    wait
>006D7279    jmp         006D84F6
 006D727E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7285    jne         006D7295
 006D7287    xor         eax,eax
 006D7289    mov         dword ptr [esp],eax
 006D728C    mov         dword ptr [esp+4],eax
>006D7290    jmp         006D84F6
 006D7295    movzx       eax,word ptr ds:[81F72C];gvar_0081F72C
 006D729C    mov         dword ptr [esp+88],eax
 006D72A3    fild        dword ptr [esp+88]
 006D72AA    fstp        qword ptr [esp]
 006D72AD    wait
>006D72AE    jmp         006D84F6
 006D72B3    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D72BA    jne         006D72CA
 006D72BC    xor         eax,eax
 006D72BE    mov         dword ptr [esp],eax
 006D72C1    mov         dword ptr [esp+4],eax
>006D72C5    jmp         006D84F6
 006D72CA    fild        dword ptr ds:[81F730];gvar_0081F730:Single
 006D72D0    fstp        qword ptr [esp]
 006D72D3    wait
>006D72D4    jmp         006D84F6
 006D72D9    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D72E0    jne         006D72F0
 006D72E2    xor         eax,eax
 006D72E4    mov         dword ptr [esp],eax
 006D72E7    mov         dword ptr [esp+4],eax
>006D72EB    jmp         006D84F6
 006D72F0    fild        dword ptr ds:[81F734];gvar_0081F734:Single
 006D72F6    fstp        qword ptr [esp]
 006D72F9    wait
>006D72FA    jmp         006D84F6
 006D72FF    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7306    jne         006D7316
 006D7308    xor         eax,eax
 006D730A    mov         dword ptr [esp],eax
 006D730D    mov         dword ptr [esp+4],eax
>006D7311    jmp         006D84F6
 006D7316    fild        dword ptr ds:[81F738];gvar_0081F738:Single
 006D731C    fstp        qword ptr [esp]
 006D731F    wait
>006D7320    jmp         006D84F6
 006D7325    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D732C    jne         006D733C
 006D732E    xor         eax,eax
 006D7330    mov         dword ptr [esp],eax
 006D7333    mov         dword ptr [esp+4],eax
>006D7337    jmp         006D84F6
 006D733C    fild        dword ptr ds:[81F73C];gvar_0081F73C:Single
 006D7342    fstp        qword ptr [esp]
 006D7345    wait
>006D7346    jmp         006D84F6
 006D734B    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7352    jne         006D7362
 006D7354    xor         eax,eax
 006D7356    mov         dword ptr [esp],eax
 006D7359    mov         dword ptr [esp+4],eax
>006D735D    jmp         006D84F6
 006D7362    fild        qword ptr ds:[81F740];gvar_0081F740:Double
 006D7368    fstp        qword ptr [esp]
 006D736B    wait
>006D736C    jmp         006D84F6
 006D7371    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7378    jne         006D7388
 006D737A    xor         eax,eax
 006D737C    mov         dword ptr [esp],eax
 006D737F    mov         dword ptr [esp+4],eax
>006D7383    jmp         006D84F6
 006D7388    fild        qword ptr ds:[81F748];gvar_0081F748:Double
 006D738E    fstp        qword ptr [esp]
 006D7391    wait
>006D7392    jmp         006D84F6
 006D7397    movzx       eax,byte ptr ds:[78C27C];0x0 gvar_0078C27C:Boolean
 006D739E    call        00686074
 006D73A3    fstp        qword ptr [esp]
 006D73A6    wait
>006D73A7    jmp         006D84F6
 006D73AC    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D73B3    jne         006D73C3
 006D73B5    xor         eax,eax
 006D73B7    mov         dword ptr [esp],eax
 006D73BA    mov         dword ptr [esp+4],eax
>006D73BE    jmp         006D84F6
 006D73C3    cmp         dword ptr ds:[78C274],1;gvar_0078C274
 006D73CA    sete        al
 006D73CD    call        00686074
 006D73D2    fstp        qword ptr [esp]
 006D73D5    wait
>006D73D6    jmp         006D84F6
 006D73DB    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D73E2    jne         006D73F2
 006D73E4    xor         eax,eax
 006D73E6    mov         dword ptr [esp],eax
 006D73E9    mov         dword ptr [esp+4],eax
>006D73ED    jmp         006D84F6
 006D73F2    cmp         dword ptr ds:[78C278],1;gvar_0078C278
 006D73F9    sete        al
 006D73FC    call        00686074
 006D7401    fstp        qword ptr [esp]
 006D7404    wait
>006D7405    jmp         006D84F6
 006D740A    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7411    jne         006D7421
 006D7413    xor         eax,eax
 006D7415    mov         dword ptr [esp],eax
 006D7418    mov         dword ptr [esp+4],eax
>006D741C    jmp         006D84F6
 006D7421    lea         eax,[esp+8]
 006D7425    push        eax
 006D7426    push        0A
 006D7428    push        0
 006D742A    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D742F    push        eax
 006D7430    call        dword ptr ds:[81F700]
 006D7436    add         esp,10
 006D7439    fild        dword ptr [esp+8]
 006D743D    fstp        qword ptr [esp]
 006D7440    wait
>006D7441    jmp         006D84F6
 006D7446    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D744D    jne         006D745D
 006D744F    xor         eax,eax
 006D7451    mov         dword ptr [esp],eax
 006D7454    mov         dword ptr [esp+4],eax
>006D7458    jmp         006D84F6
 006D745D    lea         eax,[esp+8]
 006D7461    push        eax
 006D7462    push        3
 006D7464    push        0
 006D7466    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D746B    push        eax
 006D746C    call        dword ptr ds:[81F700]
 006D7472    add         esp,10
 006D7475    fild        dword ptr [esp+8]
 006D7479    fld         tbyte ptr ds:[6D8524];0.9:Extended
 006D747F    fmulp       st(1),st
 006D7481    fstp        qword ptr [esp]
 006D7484    wait
>006D7485    jmp         006D84F6
 006D748A    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7491    jne         006D74A1
 006D7493    xor         eax,eax
 006D7495    mov         dword ptr [esp],eax
 006D7498    mov         dword ptr [esp+4],eax
>006D749C    jmp         006D84F6
 006D74A1    lea         eax,[esp+8]
 006D74A5    push        eax
 006D74A6    push        0
 006D74A8    push        0
 006D74AA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D74AF    push        eax
 006D74B0    call        dword ptr ds:[81F700]
 006D74B6    add         esp,10
 006D74B9    fild        dword ptr [esp+8]
 006D74BD    fld         tbyte ptr ds:[6D8524];0.9:Extended
 006D74C3    fmulp       st(1),st
 006D74C5    fstp        qword ptr [esp]
 006D74C8    wait
>006D74C9    jmp         006D84F6
 006D74CE    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D74D5    jne         006D74E5
 006D74D7    xor         eax,eax
 006D74D9    mov         dword ptr [esp],eax
 006D74DC    mov         dword ptr [esp+4],eax
>006D74E0    jmp         006D84F6
 006D74E5    lea         eax,[esp+8]
 006D74E9    push        eax
 006D74EA    push        10
 006D74EC    push        0
 006D74EE    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D74F3    push        eax
 006D74F4    call        dword ptr ds:[81F700]
 006D74FA    add         esp,10
 006D74FD    fild        dword ptr [esp+8]
 006D7501    fstp        qword ptr [esp]
 006D7504    wait
>006D7505    jmp         006D84F6
 006D750A    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7511    jne         006D7521
 006D7513    xor         eax,eax
 006D7515    mov         dword ptr [esp],eax
 006D7518    mov         dword ptr [esp+4],eax
>006D751C    jmp         006D84F6
 006D7521    lea         eax,[esp+8]
 006D7525    push        eax
 006D7526    push        11
 006D7528    push        0
 006D752A    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D752F    push        eax
 006D7530    call        dword ptr ds:[81F700]
 006D7536    add         esp,10
 006D7539    fild        dword ptr [esp+8]
 006D753D    fstp        qword ptr [esp]
 006D7540    wait
>006D7541    jmp         006D84F6
 006D7546    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D754D    jne         006D755D
 006D754F    xor         eax,eax
 006D7551    mov         dword ptr [esp],eax
 006D7554    mov         dword ptr [esp+4],eax
>006D7558    jmp         006D84F6
 006D755D    lea         eax,[esp+8]
 006D7561    push        eax
 006D7562    push        12
 006D7564    push        0
 006D7566    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D756B    push        eax
 006D756C    call        dword ptr ds:[81F700]
 006D7572    add         esp,10
 006D7575    fild        dword ptr [esp+8]
 006D7579    fstp        qword ptr [esp]
 006D757C    wait
>006D757D    jmp         006D84F6
 006D7582    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7589    jne         006D7599
 006D758B    xor         eax,eax
 006D758D    mov         dword ptr [esp],eax
 006D7590    mov         dword ptr [esp+4],eax
>006D7594    jmp         006D84F6
 006D7599    lea         eax,[esp+8]
 006D759D    push        eax
 006D759E    push        13
 006D75A0    push        0
 006D75A2    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D75A7    push        eax
 006D75A8    call        dword ptr ds:[81F700]
 006D75AE    add         esp,10
 006D75B1    fild        dword ptr [esp+8]
 006D75B5    fstp        qword ptr [esp]
 006D75B8    wait
>006D75B9    jmp         006D84F6
 006D75BE    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D75C5    jne         006D75D5
 006D75C7    xor         eax,eax
 006D75C9    mov         dword ptr [esp],eax
 006D75CC    mov         dword ptr [esp+4],eax
>006D75D0    jmp         006D84F6
 006D75D5    lea         eax,[esp+8]
 006D75D9    push        eax
 006D75DA    push        0B
 006D75DC    push        2
 006D75DE    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D75E3    push        eax
 006D75E4    call        dword ptr ds:[81F700]
 006D75EA    add         esp,10
 006D75ED    fild        dword ptr [esp+8]
 006D75F1    fstp        qword ptr [esp]
 006D75F4    wait
>006D75F5    jmp         006D84F6
 006D75FA    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7601    jne         006D7611
 006D7603    xor         eax,eax
 006D7605    mov         dword ptr [esp],eax
 006D7608    mov         dword ptr [esp+4],eax
>006D760C    jmp         006D84F6
 006D7611    lea         eax,[esp+8]
 006D7615    push        eax
 006D7616    push        0C
 006D7618    push        2
 006D761A    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D761F    push        eax
 006D7620    call        dword ptr ds:[81F700]
 006D7626    add         esp,10
 006D7629    fild        dword ptr [esp+8]
 006D762D    fstp        qword ptr [esp]
 006D7630    wait
>006D7631    jmp         006D84F6
 006D7636    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D763D    jne         006D764D
 006D763F    xor         eax,eax
 006D7641    mov         dword ptr [esp],eax
 006D7644    mov         dword ptr [esp+4],eax
>006D7648    jmp         006D84F6
 006D764D    lea         eax,[esp+8]
 006D7651    push        eax
 006D7652    push        0B
 006D7654    push        3
 006D7656    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D765B    push        eax
 006D765C    call        dword ptr ds:[81F700]
 006D7662    add         esp,10
 006D7665    fild        dword ptr [esp+8]
 006D7669    fstp        qword ptr [esp]
 006D766C    wait
>006D766D    jmp         006D84F6
 006D7672    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7679    jne         006D7689
 006D767B    xor         eax,eax
 006D767D    mov         dword ptr [esp],eax
 006D7680    mov         dword ptr [esp+4],eax
>006D7684    jmp         006D84F6
 006D7689    lea         eax,[esp+8]
 006D768D    push        eax
 006D768E    push        0C
 006D7690    push        3
 006D7692    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7697    push        eax
 006D7698    call        dword ptr ds:[81F700]
 006D769E    add         esp,10
 006D76A1    fild        dword ptr [esp+8]
 006D76A5    fstp        qword ptr [esp]
 006D76A8    wait
>006D76A9    jmp         006D84F6
 006D76AE    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D76B5    jne         006D76C5
 006D76B7    xor         eax,eax
 006D76B9    mov         dword ptr [esp],eax
 006D76BC    mov         dword ptr [esp+4],eax
>006D76C0    jmp         006D84F6
 006D76C5    lea         eax,[esp+8]
 006D76C9    push        eax
 006D76CA    push        2
 006D76CC    push        2
 006D76CE    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D76D3    push        eax
 006D76D4    call        dword ptr ds:[81F700]
 006D76DA    add         esp,10
 006D76DD    fild        dword ptr [esp+8]
 006D76E1    fstp        qword ptr [esp]
 006D76E4    wait
>006D76E5    jmp         006D84F6
 006D76EA    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D76F1    jne         006D7701
 006D76F3    xor         eax,eax
 006D76F5    mov         dword ptr [esp],eax
 006D76F8    mov         dword ptr [esp+4],eax
>006D76FC    jmp         006D84F6
 006D7701    lea         eax,[esp+8]
 006D7705    push        eax
 006D7706    push        1
 006D7708    push        2
 006D770A    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D770F    push        eax
 006D7710    call        dword ptr ds:[81F700]
 006D7716    add         esp,10
 006D7719    fild        dword ptr [esp+8]
 006D771D    fstp        qword ptr [esp]
 006D7720    wait
>006D7721    jmp         006D84F6
 006D7726    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D772D    jne         006D773D
 006D772F    xor         eax,eax
 006D7731    mov         dword ptr [esp],eax
 006D7734    mov         dword ptr [esp+4],eax
>006D7738    jmp         006D84F6
 006D773D    lea         eax,[esp+8]
 006D7741    push        eax
 006D7742    push        2
 006D7744    push        3
 006D7746    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D774B    push        eax
 006D774C    call        dword ptr ds:[81F700]
 006D7752    add         esp,10
 006D7755    fild        dword ptr [esp+8]
 006D7759    fstp        qword ptr [esp]
 006D775C    wait
>006D775D    jmp         006D84F6
 006D7762    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7769    jne         006D7779
 006D776B    xor         eax,eax
 006D776D    mov         dword ptr [esp],eax
 006D7770    mov         dword ptr [esp+4],eax
>006D7774    jmp         006D84F6
 006D7779    lea         eax,[esp+8]
 006D777D    push        eax
 006D777E    push        1
 006D7780    push        3
 006D7782    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7787    push        eax
 006D7788    call        dword ptr ds:[81F700]
 006D778E    add         esp,10
 006D7791    fild        dword ptr [esp+8]
 006D7795    fstp        qword ptr [esp]
 006D7798    wait
>006D7799    jmp         006D84F6
 006D779E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D77A5    jne         006D77B5
 006D77A7    xor         eax,eax
 006D77A9    mov         dword ptr [esp],eax
 006D77AC    mov         dword ptr [esp+4],eax
>006D77B0    jmp         006D84F6
 006D77B5    lea         eax,[esp+8]
 006D77B9    push        eax
 006D77BA    push        4
 006D77BC    push        2
 006D77BE    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D77C3    push        eax
 006D77C4    call        dword ptr ds:[81F700]
 006D77CA    add         esp,10
 006D77CD    fild        dword ptr [esp+8]
 006D77D1    fstp        qword ptr [esp]
 006D77D4    wait
>006D77D5    jmp         006D84F6
 006D77DA    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D77E1    jne         006D77F1
 006D77E3    xor         eax,eax
 006D77E5    mov         dword ptr [esp],eax
 006D77E8    mov         dword ptr [esp+4],eax
>006D77EC    jmp         006D84F6
 006D77F1    lea         eax,[esp+8]
 006D77F5    push        eax
 006D77F6    push        7
 006D77F8    push        2
 006D77FA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D77FF    push        eax
 006D7800    call        dword ptr ds:[81F700]
 006D7806    add         esp,10
 006D7809    fild        dword ptr [esp+8]
 006D780D    fstp        qword ptr [esp]
 006D7810    wait
>006D7811    jmp         006D84F6
 006D7816    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D781D    jne         006D782D
 006D781F    xor         eax,eax
 006D7821    mov         dword ptr [esp],eax
 006D7824    mov         dword ptr [esp+4],eax
>006D7828    jmp         006D84F6
 006D782D    lea         eax,[esp+8]
 006D7831    push        eax
 006D7832    push        5
 006D7834    push        2
 006D7836    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D783B    push        eax
 006D783C    call        dword ptr ds:[81F700]
 006D7842    add         esp,10
 006D7845    fild        dword ptr [esp+8]
 006D7849    fstp        qword ptr [esp]
 006D784C    wait
>006D784D    jmp         006D84F6
 006D7852    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7859    jne         006D7869
 006D785B    xor         eax,eax
 006D785D    mov         dword ptr [esp],eax
 006D7860    mov         dword ptr [esp+4],eax
>006D7864    jmp         006D84F6
 006D7869    lea         eax,[esp+8]
 006D786D    push        eax
 006D786E    push        8
 006D7870    push        2
 006D7872    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7877    push        eax
 006D7878    call        dword ptr ds:[81F700]
 006D787E    add         esp,10
 006D7881    fild        dword ptr [esp+8]
 006D7885    fstp        qword ptr [esp]
 006D7888    wait
>006D7889    jmp         006D84F6
 006D788E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7895    jne         006D78A5
 006D7897    xor         eax,eax
 006D7899    mov         dword ptr [esp],eax
 006D789C    mov         dword ptr [esp+4],eax
>006D78A0    jmp         006D84F6
 006D78A5    lea         eax,[esp+8]
 006D78A9    push        eax
 006D78AA    push        6
 006D78AC    push        2
 006D78AE    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D78B3    push        eax
 006D78B4    call        dword ptr ds:[81F700]
 006D78BA    add         esp,10
 006D78BD    fild        dword ptr [esp+8]
 006D78C1    fstp        qword ptr [esp]
 006D78C4    wait
>006D78C5    jmp         006D84F6
 006D78CA    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D78D1    jne         006D78E1
 006D78D3    xor         eax,eax
 006D78D5    mov         dword ptr [esp],eax
 006D78D8    mov         dword ptr [esp+4],eax
>006D78DC    jmp         006D84F6
 006D78E1    lea         eax,[esp+8]
 006D78E5    push        eax
 006D78E6    push        9
 006D78E8    push        2
 006D78EA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D78EF    push        eax
 006D78F0    call        dword ptr ds:[81F700]
 006D78F6    add         esp,10
 006D78F9    fild        dword ptr [esp+8]
 006D78FD    fstp        qword ptr [esp]
 006D7900    wait
>006D7901    jmp         006D84F6
 006D7906    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D790D    jne         006D791D
 006D790F    xor         eax,eax
 006D7911    mov         dword ptr [esp],eax
 006D7914    mov         dword ptr [esp+4],eax
>006D7918    jmp         006D84F6
 006D791D    lea         eax,[esp+8]
 006D7921    push        eax
 006D7922    push        4
 006D7924    push        3
 006D7926    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D792B    push        eax
 006D792C    call        dword ptr ds:[81F700]
 006D7932    add         esp,10
 006D7935    fild        dword ptr [esp+8]
 006D7939    fstp        qword ptr [esp]
 006D793C    wait
>006D793D    jmp         006D84F6
 006D7942    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7949    jne         006D7959
 006D794B    xor         eax,eax
 006D794D    mov         dword ptr [esp],eax
 006D7950    mov         dword ptr [esp+4],eax
>006D7954    jmp         006D84F6
 006D7959    lea         eax,[esp+8]
 006D795D    push        eax
 006D795E    push        7
 006D7960    push        3
 006D7962    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7967    push        eax
 006D7968    call        dword ptr ds:[81F700]
 006D796E    add         esp,10
 006D7971    fild        dword ptr [esp+8]
 006D7975    fstp        qword ptr [esp]
 006D7978    wait
>006D7979    jmp         006D84F6
 006D797E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7985    jne         006D7995
 006D7987    xor         eax,eax
 006D7989    mov         dword ptr [esp],eax
 006D798C    mov         dword ptr [esp+4],eax
>006D7990    jmp         006D84F6
 006D7995    lea         eax,[esp+8]
 006D7999    push        eax
 006D799A    push        5
 006D799C    push        3
 006D799E    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D79A3    push        eax
 006D79A4    call        dword ptr ds:[81F700]
 006D79AA    add         esp,10
 006D79AD    fild        dword ptr [esp+8]
 006D79B1    fstp        qword ptr [esp]
 006D79B4    wait
>006D79B5    jmp         006D84F6
 006D79BA    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D79C1    jne         006D79D1
 006D79C3    xor         eax,eax
 006D79C5    mov         dword ptr [esp],eax
 006D79C8    mov         dword ptr [esp+4],eax
>006D79CC    jmp         006D84F6
 006D79D1    lea         eax,[esp+8]
 006D79D5    push        eax
 006D79D6    push        8
 006D79D8    push        3
 006D79DA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D79DF    push        eax
 006D79E0    call        dword ptr ds:[81F700]
 006D79E6    add         esp,10
 006D79E9    fild        dword ptr [esp+8]
 006D79ED    fstp        qword ptr [esp]
 006D79F0    wait
>006D79F1    jmp         006D84F6
 006D79F6    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D79FD    jne         006D7A0D
 006D79FF    xor         eax,eax
 006D7A01    mov         dword ptr [esp],eax
 006D7A04    mov         dword ptr [esp+4],eax
>006D7A08    jmp         006D84F6
 006D7A0D    lea         eax,[esp+8]
 006D7A11    push        eax
 006D7A12    push        6
 006D7A14    push        3
 006D7A16    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7A1B    push        eax
 006D7A1C    call        dword ptr ds:[81F700]
 006D7A22    add         esp,10
 006D7A25    fild        dword ptr [esp+8]
 006D7A29    fstp        qword ptr [esp]
 006D7A2C    wait
>006D7A2D    jmp         006D84F6
 006D7A32    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7A39    jne         006D7A49
 006D7A3B    xor         eax,eax
 006D7A3D    mov         dword ptr [esp],eax
 006D7A40    mov         dword ptr [esp+4],eax
>006D7A44    jmp         006D84F6
 006D7A49    lea         eax,[esp+8]
 006D7A4D    push        eax
 006D7A4E    push        9
 006D7A50    push        3
 006D7A52    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7A57    push        eax
 006D7A58    call        dword ptr ds:[81F700]
 006D7A5E    add         esp,10
 006D7A61    fild        dword ptr [esp+8]
 006D7A65    fstp        qword ptr [esp]
 006D7A68    wait
>006D7A69    jmp         006D84F6
 006D7A6E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7A75    jne         006D7A85
 006D7A77    xor         eax,eax
 006D7A79    mov         dword ptr [esp],eax
 006D7A7C    mov         dword ptr [esp+4],eax
>006D7A80    jmp         006D84F6
 006D7A85    lea         eax,[esp+8]
 006D7A89    push        eax
 006D7A8A    push        0D
 006D7A8C    push        2
 006D7A8E    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7A93    push        eax
 006D7A94    call        dword ptr ds:[81F700]
 006D7A9A    add         esp,10
 006D7A9D    fild        dword ptr [esp+8]
 006D7AA1    fstp        qword ptr [esp]
 006D7AA4    wait
>006D7AA5    jmp         006D84F6
 006D7AAA    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7AB1    jne         006D7AC1
 006D7AB3    xor         eax,eax
 006D7AB5    mov         dword ptr [esp],eax
 006D7AB8    mov         dword ptr [esp+4],eax
>006D7ABC    jmp         006D84F6
 006D7AC1    lea         eax,[esp+8]
 006D7AC5    push        eax
 006D7AC6    push        0E
 006D7AC8    push        2
 006D7ACA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7ACF    push        eax
 006D7AD0    call        dword ptr ds:[81F700]
 006D7AD6    add         esp,10
 006D7AD9    fild        dword ptr [esp+8]
 006D7ADD    fstp        qword ptr [esp]
 006D7AE0    wait
>006D7AE1    jmp         006D84F6
 006D7AE6    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7AED    jne         006D7AFD
 006D7AEF    xor         eax,eax
 006D7AF1    mov         dword ptr [esp],eax
 006D7AF4    mov         dword ptr [esp+4],eax
>006D7AF8    jmp         006D84F6
 006D7AFD    lea         eax,[esp+8]
 006D7B01    push        eax
 006D7B02    push        0F
 006D7B04    push        2
 006D7B06    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7B0B    push        eax
 006D7B0C    call        dword ptr ds:[81F700]
 006D7B12    add         esp,10
 006D7B15    fild        dword ptr [esp+8]
 006D7B19    fstp        qword ptr [esp]
 006D7B1C    wait
>006D7B1D    jmp         006D84F6
 006D7B22    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7B29    jne         006D7B39
 006D7B2B    xor         eax,eax
 006D7B2D    mov         dword ptr [esp],eax
 006D7B30    mov         dword ptr [esp+4],eax
>006D7B34    jmp         006D84F6
 006D7B39    lea         eax,[esp+8]
 006D7B3D    push        eax
 006D7B3E    push        0D
 006D7B40    push        3
 006D7B42    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7B47    push        eax
 006D7B48    call        dword ptr ds:[81F700]
 006D7B4E    add         esp,10
 006D7B51    fild        dword ptr [esp+8]
 006D7B55    fstp        qword ptr [esp]
 006D7B58    wait
>006D7B59    jmp         006D84F6
 006D7B5E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7B65    jne         006D7B75
 006D7B67    xor         eax,eax
 006D7B69    mov         dword ptr [esp],eax
 006D7B6C    mov         dword ptr [esp+4],eax
>006D7B70    jmp         006D84F6
 006D7B75    lea         eax,[esp+8]
 006D7B79    push        eax
 006D7B7A    push        0E
 006D7B7C    push        3
 006D7B7E    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7B83    push        eax
 006D7B84    call        dword ptr ds:[81F700]
 006D7B8A    add         esp,10
 006D7B8D    fild        dword ptr [esp+8]
 006D7B91    fstp        qword ptr [esp]
 006D7B94    wait
>006D7B95    jmp         006D84F6
 006D7B9A    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D7BA1    jne         006D7BB1
 006D7BA3    xor         eax,eax
 006D7BA5    mov         dword ptr [esp],eax
 006D7BA8    mov         dword ptr [esp+4],eax
>006D7BAC    jmp         006D84F6
 006D7BB1    lea         eax,[esp+8]
 006D7BB5    push        eax
 006D7BB6    push        0F
 006D7BB8    push        3
 006D7BBA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D7BBF    push        eax
 006D7BC0    call        dword ptr ds:[81F700]
 006D7BC6    add         esp,10
 006D7BC9    fild        dword ptr [esp+8]
 006D7BCD    fstp        qword ptr [esp]
 006D7BD0    wait
>006D7BD1    jmp         006D84F6
 006D7BD6    mov         ebx,edx
 006D7BD8    sub         ebx,50
 006D7BDB    lea         edx,[esp+58]
 006D7BDF    mov         eax,ebx
 006D7BE1    call        005C37C4
 006D7BE6    lea         eax,[esp+10]
 006D7BEA    call        006D67AC
 006D7BEF    mov         eax,dword ptr [esp+40]
 006D7BF3    mov         dword ptr [esp+70],eax
 006D7BF7    mov         eax,dword ptr [esp+44]
 006D7BFB    mov         dword ptr [esp+74],eax
 006D7BFF    mov         eax,dword ptr [esp+48]
 006D7C03    mov         dword ptr [esp+78],eax
 006D7C07    mov         eax,dword ptr [esp+4C]
 006D7C0B    mov         dword ptr [esp+7C],eax
 006D7C0F    mov         eax,dword ptr [esp+50]
 006D7C13    mov         dword ptr [esp+80],eax
 006D7C1A    mov         eax,dword ptr [esp+54]
 006D7C1E    mov         dword ptr [esp+84],eax
 006D7C25    cmp         ebx,0D
>006D7C28    jne         006D7C4A
 006D7C2A    lea         eax,[esp+70]
 006D7C2E    call        005C390C
 006D7C33    mov         dword ptr [esp+88],eax
 006D7C3A    fild        dword ptr [esp+88]
 006D7C41    fstp        qword ptr [esp]
 006D7C44    wait
>006D7C45    jmp         006D84F6
 006D7C4A    lea         edx,[esp+58]
 006D7C4E    lea         eax,[esp+70]
 006D7C52    call        005C3880
 006D7C57    fstp        qword ptr [esp]
 006D7C5A    wait
>006D7C5B    jmp         006D84F6
 006D7C60    mov         ebx,edx
 006D7C62    sub         ebx,6E
 006D7C65    lea         edx,[esp+58]
 006D7C69    mov         eax,ebx
 006D7C6B    call        005C37C4
 006D7C70    lea         eax,[esp+10]
 006D7C74    call        006D67AC
 006D7C79    fld         qword ptr [esp+28]
 006D7C7D    fchs
 006D7C7F    fstp        qword ptr [esp+70]
 006D7C83    wait
 006D7C84    fld         qword ptr [esp+30]
 006D7C88    fchs
 006D7C8A    fstp        qword ptr [esp+78]
 006D7C8E    wait
 006D7C8F    fld         qword ptr [esp+38]
 006D7C93    fchs
 006D7C95    fstp        qword ptr [esp+80]
 006D7C9C    wait
 006D7C9D    cmp         ebx,0D
>006D7CA0    jne         006D7CC2
 006D7CA2    lea         eax,[esp+70]
 006D7CA6    call        005C390C
 006D7CAB    mov         dword ptr [esp+88],eax
 006D7CB2    fild        dword ptr [esp+88]
 006D7CB9    fstp        qword ptr [esp]
 006D7CBC    wait
>006D7CBD    jmp         006D84F6
 006D7CC2    lea         edx,[esp+58]
 006D7CC6    lea         eax,[esp+70]
 006D7CCA    call        005C3880
 006D7CCF    fstp        qword ptr [esp]
 006D7CD2    wait
>006D7CD3    jmp         006D84F6
 006D7CD8    mov         ebx,edx
 006D7CDA    sub         ebx,8C
 006D7CE0    lea         edx,[esp+58]
 006D7CE4    mov         eax,ebx
 006D7CE6    call        005C37C4
 006D7CEB    lea         eax,[esp+10]
 006D7CEF    call        006D67AC
 006D7CF4    mov         eax,dword ptr [esp+10]
 006D7CF8    mov         dword ptr [esp+70],eax
 006D7CFC    mov         eax,dword ptr [esp+14]
 006D7D00    mov         dword ptr [esp+74],eax
 006D7D04    mov         eax,dword ptr [esp+18]
 006D7D08    mov         dword ptr [esp+78],eax
 006D7D0C    mov         eax,dword ptr [esp+1C]
 006D7D10    mov         dword ptr [esp+7C],eax
 006D7D14    mov         eax,dword ptr [esp+20]
 006D7D18    mov         dword ptr [esp+80],eax
 006D7D1F    mov         eax,dword ptr [esp+24]
 006D7D23    mov         dword ptr [esp+84],eax
 006D7D2A    cmp         ebx,0D
>006D7D2D    jne         006D7D4F
 006D7D2F    lea         eax,[esp+70]
 006D7D33    call        005C390C
 006D7D38    mov         dword ptr [esp+88],eax
 006D7D3F    fild        dword ptr [esp+88]
 006D7D46    fstp        qword ptr [esp]
 006D7D49    wait
>006D7D4A    jmp         006D84F6
 006D7D4F    lea         edx,[esp+58]
 006D7D53    lea         eax,[esp+70]
 006D7D57    call        005C3880
 006D7D5C    fstp        qword ptr [esp]
 006D7D5F    wait
>006D7D60    jmp         006D84F6
 006D7D65    mov         ebx,edx
 006D7D67    sub         ebx,0AA
 006D7D6D    lea         edx,[esp+58]
 006D7D71    mov         eax,ebx
 006D7D73    call        005C37C4
 006D7D78    lea         eax,[esp+10]
 006D7D7C    call        006D67AC
 006D7D81    fld         qword ptr [esp+10]
 006D7D85    fchs
 006D7D87    fstp        qword ptr [esp+70]
 006D7D8B    wait
 006D7D8C    fld         qword ptr [esp+18]
 006D7D90    fchs
 006D7D92    fstp        qword ptr [esp+78]
 006D7D96    wait
 006D7D97    fld         qword ptr [esp+20]
 006D7D9B    fchs
 006D7D9D    fstp        qword ptr [esp+80]
 006D7DA4    wait
 006D7DA5    cmp         ebx,0D
>006D7DA8    jne         006D7DCA
 006D7DAA    lea         eax,[esp+70]
 006D7DAE    call        005C390C
 006D7DB3    mov         dword ptr [esp+88],eax
 006D7DBA    fild        dword ptr [esp+88]
 006D7DC1    fstp        qword ptr [esp]
 006D7DC4    wait
>006D7DC5    jmp         006D84F6
 006D7DCA    lea         edx,[esp+58]
 006D7DCE    lea         eax,[esp+70]
 006D7DD2    call        005C3880
 006D7DD7    fstp        qword ptr [esp]
 006D7DDA    wait
>006D7DDB    jmp         006D84F6
 006D7DE0    mov         ebx,edx
 006D7DE2    sub         ebx,0C8
 006D7DE8    lea         edx,[esp+58]
 006D7DEC    mov         eax,ebx
 006D7DEE    call        005C37C4
 006D7DF3    lea         eax,[esp+10]
 006D7DF7    call        006D67AC
 006D7DFC    mov         eax,dword ptr [esp+40]
 006D7E00    mov         dword ptr [esp+70],eax
 006D7E04    mov         eax,dword ptr [esp+44]
 006D7E08    mov         dword ptr [esp+74],eax
 006D7E0C    mov         eax,dword ptr [esp+48]
 006D7E10    mov         dword ptr [esp+78],eax
 006D7E14    mov         eax,dword ptr [esp+4C]
 006D7E18    mov         dword ptr [esp+7C],eax
 006D7E1C    mov         eax,dword ptr [esp+50]
 006D7E20    mov         dword ptr [esp+80],eax
 006D7E27    mov         eax,dword ptr [esp+54]
 006D7E2B    mov         dword ptr [esp+84],eax
 006D7E32    cmp         ebx,0D
>006D7E35    jne         006D7E57
 006D7E37    lea         eax,[esp+70]
 006D7E3B    call        005C390C
 006D7E40    mov         dword ptr [esp+88],eax
 006D7E47    fild        dword ptr [esp+88]
 006D7E4E    fstp        qword ptr [esp]
 006D7E51    wait
>006D7E52    jmp         006D84F6
 006D7E57    lea         edx,[esp+58]
 006D7E5B    lea         eax,[esp+70]
 006D7E5F    call        005C3880
 006D7E64    fcomp       dword ptr ds:[6D8530];45:Single
 006D7E6A    wait
 006D7E6B    fnstsw      al
 006D7E6D    sahf
 006D7E6E    setb        al
 006D7E71    call        00686074
 006D7E76    fstp        qword ptr [esp]
 006D7E79    wait
>006D7E7A    jmp         006D84F6
 006D7E7F    mov         ebx,edx
 006D7E81    sub         ebx,0E6
 006D7E87    lea         edx,[esp+58]
 006D7E8B    mov         eax,ebx
 006D7E8D    call        005C37C4
 006D7E92    lea         eax,[esp+10]
 006D7E96    call        006D67AC
 006D7E9B    fld         qword ptr [esp+28]
 006D7E9F    fchs
 006D7EA1    fstp        qword ptr [esp+70]
 006D7EA5    wait
 006D7EA6    fld         qword ptr [esp+30]
 006D7EAA    fchs
 006D7EAC    fstp        qword ptr [esp+78]
 006D7EB0    wait
 006D7EB1    fld         qword ptr [esp+38]
 006D7EB5    fchs
 006D7EB7    fstp        qword ptr [esp+80]
 006D7EBE    wait
 006D7EBF    cmp         ebx,0D
>006D7EC2    jne         006D7EE4
 006D7EC4    lea         eax,[esp+70]
 006D7EC8    call        005C390C
 006D7ECD    mov         dword ptr [esp+88],eax
 006D7ED4    fild        dword ptr [esp+88]
 006D7EDB    fstp        qword ptr [esp]
 006D7EDE    wait
>006D7EDF    jmp         006D84F6
 006D7EE4    lea         edx,[esp+58]
 006D7EE8    lea         eax,[esp+70]
 006D7EEC    call        005C3880
 006D7EF1    fcomp       dword ptr ds:[6D8530];45:Single
 006D7EF7    wait
 006D7EF8    fnstsw      al
 006D7EFA    sahf
 006D7EFB    setb        al
 006D7EFE    call        00686074
 006D7F03    fstp        qword ptr [esp]
 006D7F06    wait
>006D7F07    jmp         006D84F6
 006D7F0C    mov         ebx,edx
 006D7F0E    sub         ebx,104
 006D7F14    lea         edx,[esp+58]
 006D7F18    mov         eax,ebx
 006D7F1A    call        005C37C4
 006D7F1F    lea         eax,[esp+10]
 006D7F23    call        006D67AC
 006D7F28    mov         eax,dword ptr [esp+10]
 006D7F2C    mov         dword ptr [esp+70],eax
 006D7F30    mov         eax,dword ptr [esp+14]
 006D7F34    mov         dword ptr [esp+74],eax
 006D7F38    mov         eax,dword ptr [esp+18]
 006D7F3C    mov         dword ptr [esp+78],eax
 006D7F40    mov         eax,dword ptr [esp+1C]
 006D7F44    mov         dword ptr [esp+7C],eax
 006D7F48    mov         eax,dword ptr [esp+20]
 006D7F4C    mov         dword ptr [esp+80],eax
 006D7F53    mov         eax,dword ptr [esp+24]
 006D7F57    mov         dword ptr [esp+84],eax
 006D7F5E    cmp         ebx,0D
>006D7F61    jne         006D7F83
 006D7F63    lea         eax,[esp+70]
 006D7F67    call        005C390C
 006D7F6C    mov         dword ptr [esp+88],eax
 006D7F73    fild        dword ptr [esp+88]
 006D7F7A    fstp        qword ptr [esp]
 006D7F7D    wait
>006D7F7E    jmp         006D84F6
 006D7F83    lea         edx,[esp+58]
 006D7F87    lea         eax,[esp+70]
 006D7F8B    call        005C3880
 006D7F90    fcomp       dword ptr ds:[6D8530];45:Single
 006D7F96    wait
 006D7F97    fnstsw      al
 006D7F99    sahf
 006D7F9A    setb        al
 006D7F9D    call        00686074
 006D7FA2    fstp        qword ptr [esp]
 006D7FA5    wait
>006D7FA6    jmp         006D84F6
 006D7FAB    mov         ebx,edx
 006D7FAD    sub         ebx,122
 006D7FB3    lea         edx,[esp+58]
 006D7FB7    mov         eax,ebx
 006D7FB9    call        005C37C4
 006D7FBE    lea         eax,[esp+10]
 006D7FC2    call        006D67AC
 006D7FC7    fld         qword ptr [esp+10]
 006D7FCB    fchs
 006D7FCD    fstp        qword ptr [esp+70]
 006D7FD1    wait
 006D7FD2    fld         qword ptr [esp+18]
 006D7FD6    fchs
 006D7FD8    fstp        qword ptr [esp+78]
 006D7FDC    wait
 006D7FDD    fld         qword ptr [esp+20]
 006D7FE1    fchs
 006D7FE3    fstp        qword ptr [esp+80]
 006D7FEA    wait
 006D7FEB    cmp         ebx,0D
>006D7FEE    jne         006D8010
 006D7FF0    lea         eax,[esp+70]
 006D7FF4    call        005C390C
 006D7FF9    mov         dword ptr [esp+88],eax
 006D8000    fild        dword ptr [esp+88]
 006D8007    fstp        qword ptr [esp]
 006D800A    wait
>006D800B    jmp         006D84F6
 006D8010    lea         edx,[esp+58]
 006D8014    lea         eax,[esp+70]
 006D8018    call        005C3880
 006D801D    fcomp       dword ptr ds:[6D8530];45:Single
 006D8023    wait
 006D8024    fnstsw      al
 006D8026    sahf
 006D8027    setb        al
 006D802A    call        00686074
 006D802F    fstp        qword ptr [esp]
 006D8032    wait
>006D8033    jmp         006D84F6
 006D8038    mov         ebx,edx
 006D803A    sub         ebx,1B8
 006D8040    lea         edx,[esp+58]
 006D8044    mov         eax,ebx
 006D8046    call        005C37C4
 006D804B    lea         eax,[esp+10]
 006D804F    call        006D67AC
 006D8054    mov         eax,dword ptr [esp+40]
 006D8058    mov         dword ptr [esp+70],eax
 006D805C    mov         eax,dword ptr [esp+44]
 006D8060    mov         dword ptr [esp+74],eax
 006D8064    mov         eax,dword ptr [esp+48]
 006D8068    mov         dword ptr [esp+78],eax
 006D806C    mov         eax,dword ptr [esp+4C]
 006D8070    mov         dword ptr [esp+7C],eax
 006D8074    mov         eax,dword ptr [esp+50]
 006D8078    mov         dword ptr [esp+80],eax
 006D807F    mov         eax,dword ptr [esp+54]
 006D8083    mov         dword ptr [esp+84],eax
 006D808A    cmp         ebx,0D
>006D808D    jne         006D80AF
 006D808F    lea         eax,[esp+70]
 006D8093    call        005C390C
 006D8098    mov         dword ptr [esp+88],eax
 006D809F    fild        dword ptr [esp+88]
 006D80A6    fstp        qword ptr [esp]
 006D80A9    wait
>006D80AA    jmp         006D84F6
 006D80AF    lea         edx,[esp+58]
 006D80B3    lea         eax,[esp+70]
 006D80B7    call        005C3880
 006D80BC    fcomp       dword ptr ds:[6D8534];90:Single
 006D80C2    wait
 006D80C3    fnstsw      al
 006D80C5    sahf
 006D80C6    setb        al
 006D80C9    call        00686074
 006D80CE    fstp        qword ptr [esp]
 006D80D1    wait
>006D80D2    jmp         006D84F6
 006D80D7    mov         ebx,edx
 006D80D9    sub         ebx,1D6
 006D80DF    lea         edx,[esp+58]
 006D80E3    mov         eax,ebx
 006D80E5    call        005C37C4
 006D80EA    lea         eax,[esp+10]
 006D80EE    call        006D67AC
 006D80F3    fld         qword ptr [esp+28]
 006D80F7    fchs
 006D80F9    fstp        qword ptr [esp+70]
 006D80FD    wait
 006D80FE    fld         qword ptr [esp+30]
 006D8102    fchs
 006D8104    fstp        qword ptr [esp+78]
 006D8108    wait
 006D8109    fld         qword ptr [esp+38]
 006D810D    fchs
 006D810F    fstp        qword ptr [esp+80]
 006D8116    wait
 006D8117    cmp         ebx,0D
>006D811A    jne         006D813C
 006D811C    lea         eax,[esp+70]
 006D8120    call        005C390C
 006D8125    mov         dword ptr [esp+88],eax
 006D812C    fild        dword ptr [esp+88]
 006D8133    fstp        qword ptr [esp]
 006D8136    wait
>006D8137    jmp         006D84F6
 006D813C    lea         edx,[esp+58]
 006D8140    lea         eax,[esp+70]
 006D8144    call        005C3880
 006D8149    fcomp       dword ptr ds:[6D8534];90:Single
 006D814F    wait
 006D8150    fnstsw      al
 006D8152    sahf
 006D8153    setb        al
 006D8156    call        00686074
 006D815B    fstp        qword ptr [esp]
 006D815E    wait
>006D815F    jmp         006D84F6
 006D8164    mov         ebx,edx
 006D8166    sub         ebx,1F4
 006D816C    lea         edx,[esp+58]
 006D8170    mov         eax,ebx
 006D8172    call        005C37C4
 006D8177    lea         eax,[esp+10]
 006D817B    call        006D67AC
 006D8180    mov         eax,dword ptr [esp+10]
 006D8184    mov         dword ptr [esp+70],eax
 006D8188    mov         eax,dword ptr [esp+14]
 006D818C    mov         dword ptr [esp+74],eax
 006D8190    mov         eax,dword ptr [esp+18]
 006D8194    mov         dword ptr [esp+78],eax
 006D8198    mov         eax,dword ptr [esp+1C]
 006D819C    mov         dword ptr [esp+7C],eax
 006D81A0    mov         eax,dword ptr [esp+20]
 006D81A4    mov         dword ptr [esp+80],eax
 006D81AB    mov         eax,dword ptr [esp+24]
 006D81AF    mov         dword ptr [esp+84],eax
 006D81B6    cmp         ebx,0D
>006D81B9    jne         006D81DB
 006D81BB    lea         eax,[esp+70]
 006D81BF    call        005C390C
 006D81C4    mov         dword ptr [esp+88],eax
 006D81CB    fild        dword ptr [esp+88]
 006D81D2    fstp        qword ptr [esp]
 006D81D5    wait
>006D81D6    jmp         006D84F6
 006D81DB    lea         edx,[esp+58]
 006D81DF    lea         eax,[esp+70]
 006D81E3    call        005C3880
 006D81E8    fcomp       dword ptr ds:[6D8534];90:Single
 006D81EE    wait
 006D81EF    fnstsw      al
 006D81F1    sahf
 006D81F2    setb        al
 006D81F5    call        00686074
 006D81FA    fstp        qword ptr [esp]
 006D81FD    wait
>006D81FE    jmp         006D84F6
 006D8203    mov         ebx,edx
 006D8205    sub         ebx,212
 006D820B    lea         edx,[esp+58]
 006D820F    mov         eax,ebx
 006D8211    call        005C37C4
 006D8216    lea         eax,[esp+10]
 006D821A    call        006D67AC
 006D821F    fld         qword ptr [esp+10]
 006D8223    fchs
 006D8225    fstp        qword ptr [esp+70]
 006D8229    wait
 006D822A    fld         qword ptr [esp+18]
 006D822E    fchs
 006D8230    fstp        qword ptr [esp+78]
 006D8234    wait
 006D8235    fld         qword ptr [esp+20]
 006D8239    fchs
 006D823B    fstp        qword ptr [esp+80]
 006D8242    wait
 006D8243    cmp         ebx,0D
>006D8246    jne         006D8268
 006D8248    lea         eax,[esp+70]
 006D824C    call        005C390C
 006D8251    mov         dword ptr [esp+88],eax
 006D8258    fild        dword ptr [esp+88]
 006D825F    fstp        qword ptr [esp]
 006D8262    wait
>006D8263    jmp         006D84F6
 006D8268    lea         edx,[esp+58]
 006D826C    lea         eax,[esp+70]
 006D8270    call        005C3880
 006D8275    fcomp       dword ptr ds:[6D8534];90:Single
 006D827B    wait
 006D827C    fnstsw      al
 006D827E    sahf
 006D827F    setb        al
 006D8282    call        00686074
 006D8287    fstp        qword ptr [esp]
 006D828A    wait
>006D828B    jmp         006D84F6
 006D8290    mov         ebx,edx
 006D8292    sub         ebx,140
 006D8298    lea         edx,[esp+58]
 006D829C    mov         eax,ebx
 006D829E    call        005C37C4
 006D82A3    lea         eax,[esp+10]
 006D82A7    call        006D67AC
 006D82AC    mov         eax,dword ptr [esp+40]
 006D82B0    mov         dword ptr [esp+70],eax
 006D82B4    mov         eax,dword ptr [esp+44]
 006D82B8    mov         dword ptr [esp+74],eax
 006D82BC    mov         eax,dword ptr [esp+48]
 006D82C0    mov         dword ptr [esp+78],eax
 006D82C4    mov         eax,dword ptr [esp+4C]
 006D82C8    mov         dword ptr [esp+7C],eax
 006D82CC    mov         eax,dword ptr [esp+50]
 006D82D0    mov         dword ptr [esp+80],eax
 006D82D7    mov         eax,dword ptr [esp+54]
 006D82DB    mov         dword ptr [esp+84],eax
 006D82E2    cmp         ebx,0D
>006D82E5    jne         006D8307
 006D82E7    lea         eax,[esp+70]
 006D82EB    call        005C390C
 006D82F0    mov         dword ptr [esp+88],eax
 006D82F7    fild        dword ptr [esp+88]
 006D82FE    fstp        qword ptr [esp]
 006D8301    wait
>006D8302    jmp         006D84F6
 006D8307    lea         edx,[esp+58]
 006D830B    lea         eax,[esp+70]
 006D830F    call        005C3880
 006D8314    fcomp       dword ptr ds:[6D8538];22.5:Single
 006D831A    wait
 006D831B    fnstsw      al
 006D831D    sahf
 006D831E    setb        al
 006D8321    call        00686074
 006D8326    fstp        qword ptr [esp]
 006D8329    wait
>006D832A    jmp         006D84F6
 006D832F    mov         ebx,edx
 006D8331    sub         ebx,15E
 006D8337    lea         edx,[esp+58]
 006D833B    mov         eax,ebx
 006D833D    call        005C37C4
 006D8342    lea         eax,[esp+10]
 006D8346    call        006D67AC
 006D834B    fld         qword ptr [esp+28]
 006D834F    fchs
 006D8351    fstp        qword ptr [esp+70]
 006D8355    wait
 006D8356    fld         qword ptr [esp+30]
 006D835A    fchs
 006D835C    fstp        qword ptr [esp+78]
 006D8360    wait
 006D8361    fld         qword ptr [esp+38]
 006D8365    fchs
 006D8367    fstp        qword ptr [esp+80]
 006D836E    wait
 006D836F    cmp         ebx,0D
>006D8372    jne         006D8394
 006D8374    lea         eax,[esp+70]
 006D8378    call        005C390C
 006D837D    mov         dword ptr [esp+88],eax
 006D8384    fild        dword ptr [esp+88]
 006D838B    fstp        qword ptr [esp]
 006D838E    wait
>006D838F    jmp         006D84F6
 006D8394    lea         edx,[esp+58]
 006D8398    lea         eax,[esp+70]
 006D839C    call        005C3880
 006D83A1    fcomp       dword ptr ds:[6D8538];22.5:Single
 006D83A7    wait
 006D83A8    fnstsw      al
 006D83AA    sahf
 006D83AB    setb        al
 006D83AE    call        00686074
 006D83B3    fstp        qword ptr [esp]
 006D83B6    wait
>006D83B7    jmp         006D84F6
 006D83BC    mov         ebx,edx
 006D83BE    sub         ebx,17C
 006D83C4    lea         edx,[esp+58]
 006D83C8    mov         eax,ebx
 006D83CA    call        005C37C4
 006D83CF    lea         eax,[esp+10]
 006D83D3    call        006D67AC
 006D83D8    mov         eax,dword ptr [esp+10]
 006D83DC    mov         dword ptr [esp+70],eax
 006D83E0    mov         eax,dword ptr [esp+14]
 006D83E4    mov         dword ptr [esp+74],eax
 006D83E8    mov         eax,dword ptr [esp+18]
 006D83EC    mov         dword ptr [esp+78],eax
 006D83F0    mov         eax,dword ptr [esp+1C]
 006D83F4    mov         dword ptr [esp+7C],eax
 006D83F8    mov         eax,dword ptr [esp+20]
 006D83FC    mov         dword ptr [esp+80],eax
 006D8403    mov         eax,dword ptr [esp+24]
 006D8407    mov         dword ptr [esp+84],eax
 006D840E    cmp         ebx,0D
>006D8411    jne         006D8433
 006D8413    lea         eax,[esp+70]
 006D8417    call        005C390C
 006D841C    mov         dword ptr [esp+88],eax
 006D8423    fild        dword ptr [esp+88]
 006D842A    fstp        qword ptr [esp]
 006D842D    wait
>006D842E    jmp         006D84F6
 006D8433    lea         edx,[esp+58]
 006D8437    lea         eax,[esp+70]
 006D843B    call        005C3880
 006D8440    fcomp       dword ptr ds:[6D8538];22.5:Single
 006D8446    wait
 006D8447    fnstsw      al
 006D8449    sahf
 006D844A    setb        al
 006D844D    call        00686074
 006D8452    fstp        qword ptr [esp]
 006D8455    wait
>006D8456    jmp         006D84F6
 006D845B    mov         ebx,edx
 006D845D    sub         ebx,19A
 006D8463    lea         edx,[esp+58]
 006D8467    mov         eax,ebx
 006D8469    call        005C37C4
 006D846E    lea         eax,[esp+10]
 006D8472    call        006D67AC
 006D8477    fld         qword ptr [esp+10]
 006D847B    fchs
 006D847D    fstp        qword ptr [esp+70]
 006D8481    wait
 006D8482    fld         qword ptr [esp+18]
 006D8486    fchs
 006D8488    fstp        qword ptr [esp+78]
 006D848C    wait
 006D848D    fld         qword ptr [esp+20]
 006D8491    fchs
 006D8493    fstp        qword ptr [esp+80]
 006D849A    wait
 006D849B    cmp         ebx,0D
>006D849E    jne         006D84BD
 006D84A0    lea         eax,[esp+70]
 006D84A4    call        005C390C
 006D84A9    mov         dword ptr [esp+88],eax
 006D84B0    fild        dword ptr [esp+88]
 006D84B7    fstp        qword ptr [esp]
 006D84BA    wait
>006D84BB    jmp         006D84F6
 006D84BD    lea         edx,[esp+58]
 006D84C1    lea         eax,[esp+70]
 006D84C5    call        005C3880
 006D84CA    fcomp       dword ptr ds:[6D8538];22.5:Single
 006D84D0    wait
 006D84D1    fnstsw      al
 006D84D3    sahf
 006D84D4    setb        al
 006D84D7    call        00686074
 006D84DC    fstp        qword ptr [esp]
 006D84DF    wait
>006D84E0    jmp         006D84F6
 006D84E2    xor         eax,eax
 006D84E4    mov         dword ptr [esp],eax
 006D84E7    mov         dword ptr [esp+4],eax
>006D84EB    jmp         006D84F6
 006D84ED    xor         eax,eax
 006D84EF    mov         dword ptr [esp],eax
 006D84F2    mov         dword ptr [esp+4],eax
 006D84F6    fld         qword ptr [esp]
 006D84F9    add         esp,8C
 006D84FF    pop         ebx
 006D8500    ret
*}
end;

//006D853C
{*function TZ800Value.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006D853C    push        ebp
 006D853D    mov         ebp,esp
 006D853F    push        ebx
 006D8540    push        esi
 006D8541    mov         esi,eax
 006D8543    mov         bl,1
 006D8545    fld         qword ptr [ebp+8]
 006D8548    fcomp       qword ptr [esi+8];TZ800Value.PreviousValue:Double
 006D854B    wait
 006D854C    fnstsw      al
 006D854E    sahf
>006D854F    jne         006D855B
 006D8551    cmp         byte ptr [esi+10],0;TZ800Value.Iffy:Boolean
>006D8555    jne         006D855B
 006D8557    xor         eax,eax
>006D8559    jmp         006D855D
 006D855B    mov         al,1
 006D855D    mov         edx,dword ptr [esi+20];TZ800Value.................................Item:Integer
 006D8560    add         edx,0FFFFFFF0
 006D8563    cmp         edx,39
>006D8566    ja          006D90F8
 006D856C    jmp         dword ptr [edx*4+6D8573]
 006D856C    dd          006D865B
 006D856C    dd          006D867C
 006D856C    dd          006D869D
 006D856C    dd          006D86BE
 006D856C    dd          006D86DF
 006D856C    dd          006D8700
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D90F8
 006D856C    dd          006D8724
 006D856C    dd          006D87B7
 006D856C    dd          006D8778
 006D856C    dd          006D87F6
 006D856C    dd          006D882F
 006D856C    dd          006D8868
 006D856C    dd          006D88A1
 006D856C    dd          006D88DA
 006D856C    dd          006D8913
 006D856C    dd          006D894C
 006D856C    dd          006D8985
 006D856C    dd          006D8EA4
 006D856C    dd          006D8A30
 006D856C    dd          006D89BE
 006D856C    dd          006D8A69
 006D856C    dd          006D89F7
 006D856C    dd          006D8BF8
 006D856C    dd          006D8C31
 006D856C    dd          006D8C6A
 006D856C    dd          006D8CA3
 006D856C    dd          006D8CDC
 006D856C    dd          006D8D15
 006D856C    dd          006D8D4E
 006D856C    dd          006D8D87
 006D856C    dd          006D8DC0
 006D856C    dd          006D8DF9
 006D856C    dd          006D8E32
 006D856C    dd          006D8E6B
 006D856C    dd          006D8AA2
 006D856C    dd          006D8ADB
 006D856C    dd          006D8B14
 006D856C    dd          006D8B4D
 006D856C    dd          006D8B86
 006D856C    dd          006D8BBF
 006D856C    dd          006D8739
 006D856C    dd          006D8F26
 006D856C    dd          006D8FA8
 006D856C    dd          006D9022
 006D856C    dd          006D905F
 006D856C    dd          006D8FE5
 006D856C    dd          006D9095
 006D856C    dd          006D90C4
 006D865B    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8662    jne         006D866B
 006D8664    xor         ebx,ebx
>006D8666    jmp         006D90FA
 006D866B    fld         qword ptr [ebp+8]
 006D866E    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D8673    fstp        dword ptr [eax+6C]
 006D8676    wait
>006D8677    jmp         006D90FA
 006D867C    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8683    jne         006D868C
 006D8685    xor         ebx,ebx
>006D8687    jmp         006D90FA
 006D868C    fld         qword ptr [ebp+8]
 006D868F    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D8694    fstp        dword ptr [eax+70]
 006D8697    wait
>006D8698    jmp         006D90FA
 006D869D    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D86A4    jne         006D86AD
 006D86A6    xor         ebx,ebx
>006D86A8    jmp         006D90FA
 006D86AD    fld         qword ptr [ebp+8]
 006D86B0    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D86B5    fstp        dword ptr [eax+74]
 006D86B8    wait
>006D86B9    jmp         006D90FA
 006D86BE    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D86C5    jne         006D86CE
 006D86C7    xor         ebx,ebx
>006D86C9    jmp         006D90FA
 006D86CE    fld         qword ptr [ebp+8]
 006D86D1    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D86D6    fstp        dword ptr [eax+78]
 006D86D9    wait
>006D86DA    jmp         006D90FA
 006D86DF    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D86E6    jne         006D86EF
 006D86E8    xor         ebx,ebx
>006D86EA    jmp         006D90FA
 006D86EF    fld         qword ptr [ebp+8]
 006D86F2    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D86F7    fstp        dword ptr [eax+7C]
 006D86FA    wait
>006D86FB    jmp         006D90FA
 006D8700    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8707    jne         006D8710
 006D8709    xor         ebx,ebx
>006D870B    jmp         006D90FA
 006D8710    fld         qword ptr [ebp+8]
 006D8713    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D8718    fstp        dword ptr [eax+80]
 006D871E    wait
>006D871F    jmp         006D90FA
 006D8724    push        dword ptr [ebp+0C]
 006D8727    push        dword ptr [ebp+8]
 006D872A    call        00686060
 006D872F    mov         [0078C27C],al;gvar_0078C27C:Boolean
>006D8734    jmp         006D90FA
 006D8739    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8740    jne         006D8749
 006D8742    xor         ebx,ebx
>006D8744    jmp         006D90FA
 006D8749    test        al,al
>006D874B    je          006D90FA
 006D8751    push        dword ptr [ebp+0C]
 006D8754    push        dword ptr [ebp+8]
 006D8757    call        00686060
 006D875C    and         eax,7F
 006D875F    push        eax
 006D8760    push        0A
 006D8762    push        0
 006D8764    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8769    push        eax
 006D876A    call        dword ptr ds:[81F704]
 006D8770    add         esp,10
>006D8773    jmp         006D90FA
 006D8778    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D877F    jne         006D8788
 006D8781    xor         ebx,ebx
>006D8783    jmp         006D90FA
 006D8788    test        al,al
>006D878A    je          006D90FA
 006D8790    fld         tbyte ptr ds:[6D9110];0.9:Extended
 006D8796    fdivr       qword ptr [ebp+8]
 006D8799    call        @ROUND
 006D879E    push        eax
 006D879F    push        3
 006D87A1    push        0
 006D87A3    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D87A8    push        eax
 006D87A9    call        dword ptr ds:[81F704]
 006D87AF    add         esp,10
>006D87B2    jmp         006D90FA
 006D87B7    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D87BE    jne         006D87C7
 006D87C0    xor         ebx,ebx
>006D87C2    jmp         006D90FA
 006D87C7    test        al,al
>006D87C9    je          006D90FA
 006D87CF    fld         tbyte ptr ds:[6D9110];0.9:Extended
 006D87D5    fdivr       qword ptr [ebp+8]
 006D87D8    call        @ROUND
 006D87DD    push        eax
 006D87DE    push        0
 006D87E0    push        0
 006D87E2    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D87E7    push        eax
 006D87E8    call        dword ptr ds:[81F704]
 006D87EE    add         esp,10
>006D87F1    jmp         006D90FA
 006D87F6    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D87FD    jne         006D8806
 006D87FF    xor         ebx,ebx
>006D8801    jmp         006D90FA
 006D8806    test        al,al
>006D8808    je          006D90FA
 006D880E    fld         qword ptr [ebp+8]
 006D8811    call        @ROUND
 006D8816    push        eax
 006D8817    push        10
 006D8819    push        0
 006D881B    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8820    push        eax
 006D8821    call        dword ptr ds:[81F704]
 006D8827    add         esp,10
>006D882A    jmp         006D90FA
 006D882F    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8836    jne         006D883F
 006D8838    xor         ebx,ebx
>006D883A    jmp         006D90FA
 006D883F    test        al,al
>006D8841    je          006D90FA
 006D8847    fld         qword ptr [ebp+8]
 006D884A    call        @ROUND
 006D884F    push        eax
 006D8850    push        11
 006D8852    push        0
 006D8854    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8859    push        eax
 006D885A    call        dword ptr ds:[81F704]
 006D8860    add         esp,10
>006D8863    jmp         006D90FA
 006D8868    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D886F    jne         006D8878
 006D8871    xor         ebx,ebx
>006D8873    jmp         006D90FA
 006D8878    test        al,al
>006D887A    je          006D90FA
 006D8880    fld         qword ptr [ebp+8]
 006D8883    call        @ROUND
 006D8888    push        eax
 006D8889    push        12
 006D888B    push        0
 006D888D    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8892    push        eax
 006D8893    call        dword ptr ds:[81F704]
 006D8899    add         esp,10
>006D889C    jmp         006D90FA
 006D88A1    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D88A8    jne         006D88B1
 006D88AA    xor         ebx,ebx
>006D88AC    jmp         006D90FA
 006D88B1    test        al,al
>006D88B3    je          006D90FA
 006D88B9    fld         qword ptr [ebp+8]
 006D88BC    call        @ROUND
 006D88C1    push        eax
 006D88C2    push        13
 006D88C4    push        0
 006D88C6    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D88CB    push        eax
 006D88CC    call        dword ptr ds:[81F704]
 006D88D2    add         esp,10
>006D88D5    jmp         006D90FA
 006D88DA    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D88E1    jne         006D88EA
 006D88E3    xor         ebx,ebx
>006D88E5    jmp         006D90FA
 006D88EA    test        al,al
>006D88EC    je          006D90FA
 006D88F2    fld         qword ptr [ebp+8]
 006D88F5    call        @ROUND
 006D88FA    push        eax
 006D88FB    push        0B
 006D88FD    push        2
 006D88FF    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8904    push        eax
 006D8905    call        dword ptr ds:[81F704]
 006D890B    add         esp,10
>006D890E    jmp         006D90FA
 006D8913    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D891A    jne         006D8923
 006D891C    xor         ebx,ebx
>006D891E    jmp         006D90FA
 006D8923    test        al,al
>006D8925    je          006D90FA
 006D892B    fld         qword ptr [ebp+8]
 006D892E    call        @ROUND
 006D8933    push        eax
 006D8934    push        0C
 006D8936    push        2
 006D8938    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D893D    push        eax
 006D893E    call        dword ptr ds:[81F704]
 006D8944    add         esp,10
>006D8947    jmp         006D90FA
 006D894C    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8953    jne         006D895C
 006D8955    xor         ebx,ebx
>006D8957    jmp         006D90FA
 006D895C    test        al,al
>006D895E    je          006D90FA
 006D8964    fld         qword ptr [ebp+8]
 006D8967    call        @ROUND
 006D896C    push        eax
 006D896D    push        0B
 006D896F    push        3
 006D8971    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8976    push        eax
 006D8977    call        dword ptr ds:[81F704]
 006D897D    add         esp,10
>006D8980    jmp         006D90FA
 006D8985    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D898C    jne         006D8995
 006D898E    xor         ebx,ebx
>006D8990    jmp         006D90FA
 006D8995    test        al,al
>006D8997    je          006D90FA
 006D899D    fld         qword ptr [ebp+8]
 006D89A0    call        @ROUND
 006D89A5    push        eax
 006D89A6    push        0C
 006D89A8    push        3
 006D89AA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D89AF    push        eax
 006D89B0    call        dword ptr ds:[81F704]
 006D89B6    add         esp,10
>006D89B9    jmp         006D90FA
 006D89BE    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D89C5    jne         006D89CE
 006D89C7    xor         ebx,ebx
>006D89C9    jmp         006D90FA
 006D89CE    test        al,al
>006D89D0    je          006D90FA
 006D89D6    fld         qword ptr [ebp+8]
 006D89D9    call        @ROUND
 006D89DE    push        eax
 006D89DF    push        1
 006D89E1    push        3
 006D89E3    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D89E8    push        eax
 006D89E9    call        dword ptr ds:[81F704]
 006D89EF    add         esp,10
>006D89F2    jmp         006D90FA
 006D89F7    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D89FE    jne         006D8A07
 006D8A00    xor         ebx,ebx
>006D8A02    jmp         006D90FA
 006D8A07    test        al,al
>006D8A09    je          006D90FA
 006D8A0F    fld         qword ptr [ebp+8]
 006D8A12    call        @ROUND
 006D8A17    push        eax
 006D8A18    push        1
 006D8A1A    push        3
 006D8A1C    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8A21    push        eax
 006D8A22    call        dword ptr ds:[81F704]
 006D8A28    add         esp,10
>006D8A2B    jmp         006D90FA
 006D8A30    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8A37    jne         006D8A40
 006D8A39    xor         ebx,ebx
>006D8A3B    jmp         006D90FA
 006D8A40    test        al,al
>006D8A42    je          006D90FA
 006D8A48    fld         qword ptr [ebp+8]
 006D8A4B    call        @ROUND
 006D8A50    push        eax
 006D8A51    push        2
 006D8A53    push        3
 006D8A55    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8A5A    push        eax
 006D8A5B    call        dword ptr ds:[81F704]
 006D8A61    add         esp,10
>006D8A64    jmp         006D90FA
 006D8A69    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8A70    jne         006D8A79
 006D8A72    xor         ebx,ebx
>006D8A74    jmp         006D90FA
 006D8A79    test        al,al
>006D8A7B    je          006D90FA
 006D8A81    fld         qword ptr [ebp+8]
 006D8A84    call        @ROUND
 006D8A89    push        eax
 006D8A8A    push        2
 006D8A8C    push        3
 006D8A8E    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8A93    push        eax
 006D8A94    call        dword ptr ds:[81F704]
 006D8A9A    add         esp,10
>006D8A9D    jmp         006D90FA
 006D8AA2    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8AA9    jne         006D8AB2
 006D8AAB    xor         ebx,ebx
>006D8AAD    jmp         006D90FA
 006D8AB2    test        al,al
>006D8AB4    je          006D90FA
 006D8ABA    fld         qword ptr [ebp+8]
 006D8ABD    call        @ROUND
 006D8AC2    push        eax
 006D8AC3    push        0D
 006D8AC5    push        2
 006D8AC7    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8ACC    push        eax
 006D8ACD    call        dword ptr ds:[81F704]
 006D8AD3    add         esp,10
>006D8AD6    jmp         006D90FA
 006D8ADB    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8AE2    jne         006D8AEB
 006D8AE4    xor         ebx,ebx
>006D8AE6    jmp         006D90FA
 006D8AEB    test        al,al
>006D8AED    je          006D90FA
 006D8AF3    fld         qword ptr [ebp+8]
 006D8AF6    call        @ROUND
 006D8AFB    push        eax
 006D8AFC    push        0E
 006D8AFE    push        2
 006D8B00    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8B05    push        eax
 006D8B06    call        dword ptr ds:[81F704]
 006D8B0C    add         esp,10
>006D8B0F    jmp         006D90FA
 006D8B14    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8B1B    jne         006D8B24
 006D8B1D    xor         ebx,ebx
>006D8B1F    jmp         006D90FA
 006D8B24    test        al,al
>006D8B26    je          006D90FA
 006D8B2C    fld         qword ptr [ebp+8]
 006D8B2F    call        @ROUND
 006D8B34    push        eax
 006D8B35    push        0F
 006D8B37    push        2
 006D8B39    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8B3E    push        eax
 006D8B3F    call        dword ptr ds:[81F704]
 006D8B45    add         esp,10
>006D8B48    jmp         006D90FA
 006D8B4D    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8B54    jne         006D8B5D
 006D8B56    xor         ebx,ebx
>006D8B58    jmp         006D90FA
 006D8B5D    test        al,al
>006D8B5F    je          006D90FA
 006D8B65    fld         qword ptr [ebp+8]
 006D8B68    call        @ROUND
 006D8B6D    push        eax
 006D8B6E    push        0D
 006D8B70    push        3
 006D8B72    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8B77    push        eax
 006D8B78    call        dword ptr ds:[81F704]
 006D8B7E    add         esp,10
>006D8B81    jmp         006D90FA
 006D8B86    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8B8D    jne         006D8B96
 006D8B8F    xor         ebx,ebx
>006D8B91    jmp         006D90FA
 006D8B96    test        al,al
>006D8B98    je          006D90FA
 006D8B9E    fld         qword ptr [ebp+8]
 006D8BA1    call        @ROUND
 006D8BA6    push        eax
 006D8BA7    push        0E
 006D8BA9    push        3
 006D8BAB    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8BB0    push        eax
 006D8BB1    call        dword ptr ds:[81F704]
 006D8BB7    add         esp,10
>006D8BBA    jmp         006D90FA
 006D8BBF    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8BC6    jne         006D8BCF
 006D8BC8    xor         ebx,ebx
>006D8BCA    jmp         006D90FA
 006D8BCF    test        al,al
>006D8BD1    je          006D90FA
 006D8BD7    fld         qword ptr [ebp+8]
 006D8BDA    call        @ROUND
 006D8BDF    push        eax
 006D8BE0    push        0F
 006D8BE2    push        3
 006D8BE4    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8BE9    push        eax
 006D8BEA    call        dword ptr ds:[81F704]
 006D8BF0    add         esp,10
>006D8BF3    jmp         006D90FA
 006D8BF8    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8BFF    jne         006D8C08
 006D8C01    xor         ebx,ebx
>006D8C03    jmp         006D90FA
 006D8C08    test        al,al
>006D8C0A    je          006D90FA
 006D8C10    fld         qword ptr [ebp+8]
 006D8C13    call        @ROUND
 006D8C18    push        eax
 006D8C19    push        4
 006D8C1B    push        2
 006D8C1D    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8C22    push        eax
 006D8C23    call        dword ptr ds:[81F704]
 006D8C29    add         esp,10
>006D8C2C    jmp         006D90FA
 006D8C31    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8C38    jne         006D8C41
 006D8C3A    xor         ebx,ebx
>006D8C3C    jmp         006D90FA
 006D8C41    test        al,al
>006D8C43    je          006D90FA
 006D8C49    fld         qword ptr [ebp+8]
 006D8C4C    call        @ROUND
 006D8C51    push        eax
 006D8C52    push        7
 006D8C54    push        2
 006D8C56    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8C5B    push        eax
 006D8C5C    call        dword ptr ds:[81F704]
 006D8C62    add         esp,10
>006D8C65    jmp         006D90FA
 006D8C6A    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8C71    jne         006D8C7A
 006D8C73    xor         ebx,ebx
>006D8C75    jmp         006D90FA
 006D8C7A    test        al,al
>006D8C7C    je          006D90FA
 006D8C82    fld         qword ptr [ebp+8]
 006D8C85    call        @ROUND
 006D8C8A    push        eax
 006D8C8B    push        5
 006D8C8D    push        2
 006D8C8F    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8C94    push        eax
 006D8C95    call        dword ptr ds:[81F704]
 006D8C9B    add         esp,10
>006D8C9E    jmp         006D90FA
 006D8CA3    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8CAA    jne         006D8CB3
 006D8CAC    xor         ebx,ebx
>006D8CAE    jmp         006D90FA
 006D8CB3    test        al,al
>006D8CB5    je          006D90FA
 006D8CBB    fld         qword ptr [ebp+8]
 006D8CBE    call        @ROUND
 006D8CC3    push        eax
 006D8CC4    push        8
 006D8CC6    push        2
 006D8CC8    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8CCD    push        eax
 006D8CCE    call        dword ptr ds:[81F704]
 006D8CD4    add         esp,10
>006D8CD7    jmp         006D90FA
 006D8CDC    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8CE3    jne         006D8CEC
 006D8CE5    xor         ebx,ebx
>006D8CE7    jmp         006D90FA
 006D8CEC    test        al,al
>006D8CEE    je          006D90FA
 006D8CF4    fld         qword ptr [ebp+8]
 006D8CF7    call        @ROUND
 006D8CFC    push        eax
 006D8CFD    push        6
 006D8CFF    push        2
 006D8D01    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8D06    push        eax
 006D8D07    call        dword ptr ds:[81F704]
 006D8D0D    add         esp,10
>006D8D10    jmp         006D90FA
 006D8D15    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8D1C    jne         006D8D25
 006D8D1E    xor         ebx,ebx
>006D8D20    jmp         006D90FA
 006D8D25    test        al,al
>006D8D27    je          006D90FA
 006D8D2D    fld         qword ptr [ebp+8]
 006D8D30    call        @ROUND
 006D8D35    push        eax
 006D8D36    push        9
 006D8D38    push        2
 006D8D3A    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8D3F    push        eax
 006D8D40    call        dword ptr ds:[81F704]
 006D8D46    add         esp,10
>006D8D49    jmp         006D90FA
 006D8D4E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8D55    jne         006D8D5E
 006D8D57    xor         ebx,ebx
>006D8D59    jmp         006D90FA
 006D8D5E    test        al,al
>006D8D60    je          006D90FA
 006D8D66    fld         qword ptr [ebp+8]
 006D8D69    call        @ROUND
 006D8D6E    push        eax
 006D8D6F    push        4
 006D8D71    push        3
 006D8D73    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8D78    push        eax
 006D8D79    call        dword ptr ds:[81F704]
 006D8D7F    add         esp,10
>006D8D82    jmp         006D90FA
 006D8D87    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8D8E    jne         006D8D97
 006D8D90    xor         ebx,ebx
>006D8D92    jmp         006D90FA
 006D8D97    test        al,al
>006D8D99    je          006D90FA
 006D8D9F    fld         qword ptr [ebp+8]
 006D8DA2    call        @ROUND
 006D8DA7    push        eax
 006D8DA8    push        7
 006D8DAA    push        3
 006D8DAC    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8DB1    push        eax
 006D8DB2    call        dword ptr ds:[81F704]
 006D8DB8    add         esp,10
>006D8DBB    jmp         006D90FA
 006D8DC0    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8DC7    jne         006D8DD0
 006D8DC9    xor         ebx,ebx
>006D8DCB    jmp         006D90FA
 006D8DD0    test        al,al
>006D8DD2    je          006D90FA
 006D8DD8    fld         qword ptr [ebp+8]
 006D8DDB    call        @ROUND
 006D8DE0    push        eax
 006D8DE1    push        5
 006D8DE3    push        3
 006D8DE5    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8DEA    push        eax
 006D8DEB    call        dword ptr ds:[81F704]
 006D8DF1    add         esp,10
>006D8DF4    jmp         006D90FA
 006D8DF9    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8E00    jne         006D8E09
 006D8E02    xor         ebx,ebx
>006D8E04    jmp         006D90FA
 006D8E09    test        al,al
>006D8E0B    je          006D90FA
 006D8E11    fld         qword ptr [ebp+8]
 006D8E14    call        @ROUND
 006D8E19    push        eax
 006D8E1A    push        8
 006D8E1C    push        3
 006D8E1E    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8E23    push        eax
 006D8E24    call        dword ptr ds:[81F704]
 006D8E2A    add         esp,10
>006D8E2D    jmp         006D90FA
 006D8E32    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8E39    jne         006D8E42
 006D8E3B    xor         ebx,ebx
>006D8E3D    jmp         006D90FA
 006D8E42    test        al,al
>006D8E44    je          006D90FA
 006D8E4A    fld         qword ptr [ebp+8]
 006D8E4D    call        @ROUND
 006D8E52    push        eax
 006D8E53    push        6
 006D8E55    push        3
 006D8E57    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8E5C    push        eax
 006D8E5D    call        dword ptr ds:[81F704]
 006D8E63    add         esp,10
>006D8E66    jmp         006D90FA
 006D8E6B    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8E72    jne         006D8E7B
 006D8E74    xor         ebx,ebx
>006D8E76    jmp         006D90FA
 006D8E7B    test        al,al
>006D8E7D    je          006D90FA
 006D8E83    fld         qword ptr [ebp+8]
 006D8E86    call        @ROUND
 006D8E8B    push        eax
 006D8E8C    push        9
 006D8E8E    push        3
 006D8E90    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8E95    push        eax
 006D8E96    call        dword ptr ds:[81F704]
 006D8E9C    add         esp,10
>006D8E9F    jmp         006D90FA
 006D8EA4    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8EAB    jne         006D8EB4
 006D8EAD    xor         ebx,ebx
>006D8EAF    jmp         006D90FA
 006D8EB4    cmp         dword ptr ds:[78C274],0;gvar_0078C274
>006D8EBB    je          006D8EDA
 006D8EBD    push        dword ptr [ebp+0C]
 006D8EC0    push        dword ptr [ebp+8]
 006D8EC3    call        00686060
 006D8EC8    cmp         dword ptr ds:[78C274],1;gvar_0078C274
 006D8ECF    sete        dl
 006D8ED2    cmp         al,dl
>006D8ED4    je          006D90FA
 006D8EDA    push        dword ptr [ebp+0C]
 006D8EDD    push        dword ptr [ebp+8]
 006D8EE0    call        00686060
 006D8EE5    neg         al
 006D8EE7    sbb         eax,eax
 006D8EE9    push        eax
 006D8EEA    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8EEF    push        eax
 006D8EF0    call        dword ptr ds:[81F708]
 006D8EF6    add         esp,8
 006D8EF9    push        dword ptr [ebp+0C]
 006D8EFC    push        dword ptr [ebp+8]
 006D8EFF    call        00686060
 006D8F04    test        al,al
>006D8F06    je          006D8F17
 006D8F08    mov         dword ptr ds:[78C274],1;gvar_0078C274
>006D8F12    jmp         006D90FA
 006D8F17    mov         dword ptr ds:[78C274],0FFFFFFFF;gvar_0078C274
>006D8F21    jmp         006D90FA
 006D8F26    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8F2D    jne         006D8F36
 006D8F2F    xor         ebx,ebx
>006D8F31    jmp         006D90FA
 006D8F36    cmp         dword ptr ds:[78C278],0;gvar_0078C278
>006D8F3D    je          006D8F5C
 006D8F3F    push        dword ptr [ebp+0C]
 006D8F42    push        dword ptr [ebp+8]
 006D8F45    call        00686060
 006D8F4A    cmp         dword ptr ds:[78C278],1;gvar_0078C278
 006D8F51    sete        dl
 006D8F54    cmp         al,dl
>006D8F56    je          006D90FA
 006D8F5C    push        dword ptr [ebp+0C]
 006D8F5F    push        dword ptr [ebp+8]
 006D8F62    call        00686060
 006D8F67    neg         al
 006D8F69    sbb         eax,eax
 006D8F6B    push        eax
 006D8F6C    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8F71    push        eax
 006D8F72    call        dword ptr ds:[81F70C]
 006D8F78    add         esp,8
 006D8F7B    push        dword ptr [ebp+0C]
 006D8F7E    push        dword ptr [ebp+8]
 006D8F81    call        00686060
 006D8F86    test        al,al
>006D8F88    je          006D8F99
 006D8F8A    mov         dword ptr ds:[78C278],1;gvar_0078C278
>006D8F94    jmp         006D90FA
 006D8F99    mov         dword ptr ds:[78C278],0FFFFFFFF;gvar_0078C278
>006D8FA3    jmp         006D90FA
 006D8FA8    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8FAF    jne         006D8FB8
 006D8FB1    xor         ebx,ebx
>006D8FB3    jmp         006D90FA
 006D8FB8    test        al,al
>006D8FBA    je          006D90FA
 006D8FC0    push        dword ptr [ebp+0C]
 006D8FC3    push        dword ptr [ebp+8]
 006D8FC6    call        00686060
 006D8FCB    test        al,al
>006D8FCD    je          006D90FA
 006D8FD3    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D8FD8    push        eax
 006D8FD9    call        dword ptr ds:[81F710]
 006D8FDF    pop         ecx
>006D8FE0    jmp         006D90FA
 006D8FE5    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D8FEC    jne         006D8FF5
 006D8FEE    xor         ebx,ebx
>006D8FF0    jmp         006D90FA
 006D8FF5    test        al,al
>006D8FF7    je          006D90FA
 006D8FFD    push        dword ptr [ebp+0C]
 006D9000    push        dword ptr [ebp+8]
 006D9003    call        00686060
 006D9008    test        al,al
>006D900A    je          006D90FA
 006D9010    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D9015    push        eax
 006D9016    call        dword ptr ds:[81F718]
 006D901C    pop         ecx
>006D901D    jmp         006D90FA
 006D9022    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D9029    jne         006D9032
 006D902B    xor         ebx,ebx
>006D902D    jmp         006D90FA
 006D9032    test        al,al
>006D9034    je          006D90FA
 006D903A    push        dword ptr [ebp+0C]
 006D903D    push        dword ptr [ebp+8]
 006D9040    call        00686060
 006D9045    test        al,al
>006D9047    je          006D90FA
 006D904D    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D9052    push        eax
 006D9053    call        dword ptr ds:[81F720]
 006D9059    pop         ecx
>006D905A    jmp         006D90FA
 006D905F    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D9066    jne         006D906F
 006D9068    xor         ebx,ebx
>006D906A    jmp         006D90FA
 006D906F    test        al,al
>006D9071    je          006D90FA
 006D9077    push        dword ptr [ebp+0C]
 006D907A    push        dword ptr [ebp+8]
 006D907D    call        00686060
 006D9082    test        al,al
>006D9084    je          006D90FA
 006D9086    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D908B    push        eax
 006D908C    call        dword ptr ds:[81F724]
 006D9092    pop         ecx
>006D9093    jmp         006D90FA
 006D9095    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D909C    jne         006D90A2
 006D909E    xor         ebx,ebx
>006D90A0    jmp         006D90FA
 006D90A2    test        al,al
>006D90A4    je          006D90FA
 006D90A6    push        dword ptr [ebp+0C]
 006D90A9    push        dword ptr [ebp+8]
 006D90AC    call        00686060
 006D90B1    test        al,al
>006D90B3    je          006D90FA
 006D90B5    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D90BA    push        eax
 006D90BB    call        dword ptr ds:[81F714]
 006D90C1    pop         ecx
>006D90C2    jmp         006D90FA
 006D90C4    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D90CB    jne         006D90D1
 006D90CD    xor         ebx,ebx
>006D90CF    jmp         006D90FA
 006D90D1    test        al,al
>006D90D3    je          006D90FA
 006D90D5    push        dword ptr [ebp+0C]
 006D90D8    push        dword ptr [ebp+8]
 006D90DB    call        00686060
 006D90E0    test        al,al
>006D90E2    je          006D90FA
 006D90E4    push        2
 006D90E6    call        dword ptr ds:[81F71C]
 006D90EC    pop         ecx
 006D90ED    push        3
 006D90EF    call        dword ptr ds:[81F71C]
 006D90F5    pop         ecx
>006D90F6    jmp         006D90FA
 006D90F8    xor         ebx,ebx
 006D90FA    mov         eax,dword ptr [ebp+8]
 006D90FD    mov         dword ptr [esi+8],eax;TZ800Value.PreviousValue:Double
 006D9100    mov         eax,dword ptr [ebp+0C]
 006D9103    mov         dword ptr [esi+0C],eax;TZ800Value.?fC:dword
 006D9106    mov         eax,ebx
 006D9108    pop         esi
 006D9109    pop         ebx
 006D910A    pop         ebp
 006D910B    ret         8
end;*}

//006D911C
{*procedure TZ800Value.ToString(?:?);
begin
 006D911C    push        ebp
 006D911D    mov         ebp,esp
 006D911F    push        0
 006D9121    push        ebx
 006D9122    push        esi
 006D9123    mov         esi,edx
 006D9125    mov         ebx,eax
 006D9127    xor         eax,eax
 006D9129    push        ebp
 006D912A    push        6D9165
 006D912F    push        dword ptr fs:[eax]
 006D9132    mov         dword ptr fs:[eax],esp
 006D9135    lea         edx,[ebp-4]
 006D9138    mov         eax,dword ptr [ebx+20];TZ800Value..................................Item:Integer
 006D913B    call        006D97C0
 006D9140    mov         ecx,dword ptr [ebp-4]
 006D9143    mov         eax,esi
 006D9145    mov         edx,6D9180;'Z800.'
 006D914A    call        @UStrCat3
 006D914F    xor         eax,eax
 006D9151    pop         edx
 006D9152    pop         ecx
 006D9153    pop         ecx
 006D9154    mov         dword ptr fs:[eax],edx
 006D9157    push        6D916C
 006D915C    lea         eax,[ebp-4]
 006D915F    call        @UStrClr
 006D9164    ret
>006D9165    jmp         @HandleFinally
>006D916A    jmp         006D915C
 006D916C    pop         esi
 006D916D    pop         ebx
 006D916E    pop         ecx
 006D916F    pop         ebp
 006D9170    ret
end;*}

//006D918C
procedure sub_006D918C;
begin
{*
 006D918C    push        ebx
 006D918D    mov         ebx,78C26C;gvar_0078C26C:HMODULE
 006D9192    cmp         byte ptr ds:[81F6E4],0;gvar_0081F6E4
>006D9199    je          006D9397
 006D919F    push        6D939C;'EMADevice_DLL.DLL'
 006D91A4    call        kernel32.LoadLibraryW
 006D91A9    mov         dword ptr [ebx],eax
 006D91AB    cmp         dword ptr [ebx],0
>006D91AE    jne         006D91DE
 006D91B0    mov         eax,6D93CC;'EMADevice_DLL.DLL not found! Please put it in PIE''s directory.'
 006D91B5    call        004FA048
 006D91BA    push        6D944C;'EMADevice.DLL'
 006D91BF    call        kernel32.LoadLibraryW
 006D91C4    mov         dword ptr [ebx],eax
 006D91C6    cmp         dword ptr [ebx],0
>006D91C9    jne         006D91DE
 006D91CB    mov         eax,6D9474;'Tried another name, but EMADevice.DLL not found either!'
 006D91D0    call        004FA048
 006D91D5    mov         byte ptr ds:[81F6E4],0;gvar_0081F6E4
 006D91DC    pop         ebx
 006D91DD    ret
 006D91DE    push        6D94E4;'Open'
 006D91E3    mov         eax,dword ptr [ebx]
 006D91E5    push        eax
 006D91E6    call        GetProcAddress
 006D91EB    mov         [0081F6EC],eax;gvar_0081F6EC:Pointer
 006D91F0    push        6D94F0;'Close'
 006D91F5    mov         eax,dword ptr [ebx]
 006D91F7    push        eax
 006D91F8    call        GetProcAddress
 006D91FD    mov         [0081F6F0],eax;gvar_0081F6F0:Pointer
 006D9202    push        6D94FC;'PollHeadTrackerRawData'
 006D9207    mov         eax,dword ptr [ebx]
 006D9209    push        eax
 006D920A    call        GetProcAddress
 006D920F    mov         [0081F6F4],eax;gvar_0081F6F4:Pointer
 006D9214    push        6D952C;'GetDeviceInfo'
 006D9219    mov         eax,dword ptr [ebx]
 006D921B    push        eax
 006D921C    call        GetProcAddress
 006D9221    mov         [0081F6F8],eax;gvar_0081F6F8:Pointer
 006D9226    push        6D9548;'GetProperty'
 006D922B    mov         eax,dword ptr [ebx]
 006D922D    push        eax
 006D922E    call        GetProcAddress
 006D9233    mov         [0081F700],eax;gvar_0081F700:Pointer
 006D9238    push        6D9560;'SetProperty'
 006D923D    mov         eax,dword ptr [ebx]
 006D923F    push        eax
 006D9240    call        GetProcAddress
 006D9245    mov         [0081F704],eax;gvar_0081F704:Pointer
 006D924A    push        6D9578;'EnableMouseTracking'
 006D924F    mov         eax,dword ptr [ebx]
 006D9251    push        eax
 006D9252    call        GetProcAddress
 006D9257    mov         [0081F708],eax;gvar_0081F708:Pointer
 006D925C    push        6D95A0;'KeepAlive'
 006D9261    mov         eax,dword ptr [ebx]
 006D9263    push        eax
 006D9264    call        GetProcAddress
 006D9269    mov         [0081F6FC],eax;gvar_0081F6FC:Pointer
 006D926E    push        6D95B4;'EnableStereoVision'
 006D9273    mov         eax,dword ptr [ebx]
 006D9275    push        eax
 006D9276    call        GetProcAddress
 006D927B    mov         [0081F70C],eax;gvar_0081F70C:Pointer
 006D9280    push        6D95DC;'ResetMouseTracking'
 006D9285    mov         eax,dword ptr [ebx]
 006D9287    push        eax
 006D9288    call        GetProcAddress
 006D928D    mov         [0081F710],eax;gvar_0081F710:Pointer
 006D9292    push        6D9604;'RestoreFactorySettings'
 006D9297    mov         eax,dword ptr [ebx]
 006D9299    push        eax
 006D929A    call        GetProcAddress
 006D929F    mov         [0081F714],eax;gvar_0081F714:Pointer
 006D92A4    push        6D9634;'ResetEEPROM'
 006D92A9    mov         eax,dword ptr [ebx]
 006D92AB    push        eax
 006D92AC    call        GetProcAddress
 006D92B1    mov         [0081F718],eax;gvar_0081F718:Pointer
 006D92B6    push        6D964C;'RestoreGainOffsetFactorySetting'
 006D92BB    mov         eax,dword ptr [ebx]
 006D92BD    push        eax
 006D92BE    call        GetProcAddress
 006D92C3    mov         [0081F71C],eax;gvar_0081F71C:Pointer
 006D92C8    cmp         dword ptr ds:[81F6EC],0;gvar_0081F6EC:Pointer
>006D92CF    je          006D933D
 006D92D1    cmp         dword ptr ds:[81F6F0],0;gvar_0081F6F0:Pointer
>006D92D8    je          006D933D
 006D92DA    cmp         dword ptr ds:[81F6F4],0;gvar_0081F6F4:Pointer
>006D92E1    je          006D933D
 006D92E3    cmp         dword ptr ds:[81F6F8],0;gvar_0081F6F8:Pointer
>006D92EA    je          006D933D
 006D92EC    cmp         dword ptr ds:[81F708],0;gvar_0081F708:Pointer
>006D92F3    je          006D933D
 006D92F5    cmp         dword ptr ds:[81F704],0;gvar_0081F704:Pointer
>006D92FC    je          006D933D
 006D92FE    cmp         dword ptr ds:[81F700],0;gvar_0081F700:Pointer
>006D9305    je          006D933D
 006D9307    cmp         dword ptr ds:[81F6FC],0;gvar_0081F6FC:Pointer
>006D930E    je          006D933D
 006D9310    cmp         dword ptr ds:[81F70C],0;gvar_0081F70C:Pointer
>006D9317    je          006D933D
 006D9319    cmp         dword ptr ds:[81F710],0;gvar_0081F710:Pointer
>006D9320    je          006D933D
 006D9322    cmp         dword ptr ds:[81F714],0;gvar_0081F714:Pointer
>006D9329    je          006D933D
 006D932B    cmp         dword ptr ds:[81F718],0;gvar_0081F718:Pointer
>006D9332    je          006D933D
 006D9334    cmp         dword ptr ds:[81F71C],0;gvar_0081F71C:Pointer
>006D933B    jne         006D9350
 006D933D    mov         eax,6D9698;'The Z800''s DLL file doesn''t contain the needed functions.'
 006D9342    call        004FA048
 006D9347    mov         byte ptr ds:[81F6E4],0;gvar_0081F6E4
 006D934E    pop         ebx
 006D934F    ret
 006D9350    push        0
 006D9352    call        dword ptr ds:[81F6EC]
 006D9358    pop         ecx
 006D9359    mov         [0078C270],eax;gvar_0078C270:Pointer
 006D935E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D9365    je          006D9397
 006D9367    xor         ecx,ecx
 006D9369    mov         dl,1
 006D936B    mov         eax,[006D27C0];Z800Thread
 006D9370    call        TThread.Create;Z800Thread.Create
 006D9375    mov         [0078C280],eax;gvar_0078C280:Z800Thread
 006D937A    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D937F    mov         byte ptr [eax+0F],1;Z800Thread.FFreeOnTerminate:Boolean
 006D9383    push        81F728;gvar_0081F728
 006D9388    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D938D    push        eax
 006D938E    call        dword ptr ds:[81F6F8]
 006D9394    add         esp,8
 006D9397    pop         ebx
 006D9398    ret
*}
end;

//006D970C
procedure sub_006D970C;
begin
{*
 006D970C    cmp         byte ptr ds:[81F6E4],0;gvar_0081F6E4
>006D9713    jne         006D971E
 006D9715    cmp         byte ptr ds:[81F6E5],0;gvar_0081F6E5
>006D971C    je          006D9769
 006D971E    cmp         dword ptr ds:[78C270],0;gvar_0078C270:Pointer
>006D9725    je          006D974E
 006D9727    cmp         dword ptr ds:[81F6F0],0;gvar_0081F6F0:Pointer
>006D972E    je          006D974E
 006D9730    mov         eax,[0078C280];0x0 gvar_0078C280:Z800Thread
 006D9735    call        TThread.Terminate
 006D973A    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D973F    push        eax
 006D9740    call        dword ptr ds:[81F6F0]
 006D9746    pop         ecx
 006D9747    xor         eax,eax
 006D9749    mov         [0078C270],eax;gvar_0078C270:Pointer
 006D974E    cmp         dword ptr ds:[78C26C],0;gvar_0078C26C:HMODULE
>006D9755    je          006D9769
 006D9757    mov         eax,[0078C26C];0x0 gvar_0078C26C:HMODULE
 006D975C    push        eax
 006D975D    call        kernel32.FreeLibrary
 006D9762    xor         eax,eax
 006D9764    mov         [0078C26C],eax;gvar_0078C26C:HMODULE
 006D9769    ret
*}
end;

//006D976C
{*function sub_006D976C:?;
begin
 006D976C    mov         al,1
 006D976E    ret
end;*}

//006D9770
{*function sub_006D9770(?:UnicodeString):?;
begin
 006D9770    push        ebp
 006D9771    mov         ebp,esp
 006D9773    push        ecx
 006D9774    push        ebx
 006D9775    mov         dword ptr [ebp-4],eax
 006D9778    mov         eax,dword ptr [ebp-4]
 006D977B    call        @UStrAddRef
 006D9780    xor         eax,eax
 006D9782    push        ebp
 006D9783    push        6D97B3
 006D9788    push        dword ptr fs:[eax]
 006D978B    mov         dword ptr fs:[eax],esp
 006D978E    mov         edx,dword ptr [ebp-4]
 006D9791    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D9796    call        THashTable.Get
 006D979B    mov         ebx,eax
 006D979D    xor         eax,eax
 006D979F    pop         edx
 006D97A0    pop         ecx
 006D97A1    pop         ecx
 006D97A2    mov         dword ptr fs:[eax],edx
 006D97A5    push        6D97BA
 006D97AA    lea         eax,[ebp-4]
 006D97AD    call        @UStrClr
 006D97B2    ret
>006D97B3    jmp         @HandleFinally
>006D97B8    jmp         006D97AA
 006D97BA    mov         eax,ebx
 006D97BC    pop         ebx
 006D97BD    pop         ecx
 006D97BE    pop         ebp
 006D97BF    ret
end;*}

//006D97C0
{*procedure sub_006D97C0(?:Integer; ?:?);
begin
 006D97C0    push        ebx
 006D97C1    push        esi
 006D97C2    mov         esi,edx
 006D97C4    mov         ebx,eax
 006D97C6    mov         ecx,esi
 006D97C8    mov         edx,ebx
 006D97CA    mov         eax,[0081F6E0];gvar_0081F6E0:THashTable
 006D97CF    call        THashTable.Get
 006D97D4    pop         esi
 006D97D5    pop         ebx
 006D97D6    ret
end;*}

//006D97D8
{*function sub_006D97D8:?;
begin
 006D97D8    push        ebp
 006D97D9    mov         ebp,esp
 006D97DB    push        0
 006D97DD    push        ebx
 006D97DE    push        esi
 006D97DF    xor         eax,eax
 006D97E1    push        ebp
 006D97E2    push        6D983F
 006D97E7    push        dword ptr fs:[eax]
 006D97EA    mov         dword ptr fs:[eax],esp
 006D97ED    mov         dl,1
 006D97EF    mov         eax,[0043C7BC];TStringList
 006D97F4    call        TStringList.Create;TStringList.Create
 006D97F9    mov         esi,eax
 006D97FB    mov         dl,1
 006D97FD    mov         eax,esi
 006D97FF    call        TStringList.SetSorted
 006D9804    xor         ebx,ebx
 006D9806    lea         edx,[ebp-4]
 006D9809    mov         eax,ebx
 006D980B    call        006D97C0
 006D9810    cmp         dword ptr [ebp-4],0
>006D9814    je          006D9820
 006D9816    mov         edx,dword ptr [ebp-4]
 006D9819    mov         eax,esi
 006D981B    mov         ecx,dword ptr [eax]
 006D981D    call        dword ptr [ecx+38];TStringList.Add
 006D9820    inc         ebx
 006D9821    cmp         ebx,22D
>006D9827    jne         006D9806
 006D9829    xor         eax,eax
 006D982B    pop         edx
 006D982C    pop         ecx
 006D982D    pop         ecx
 006D982E    mov         dword ptr fs:[eax],edx
 006D9831    push        6D9846
 006D9836    lea         eax,[ebp-4]
 006D9839    call        @UStrClr
 006D983E    ret
>006D983F    jmp         @HandleFinally
>006D9844    jmp         006D9836
 006D9846    mov         eax,esi
 006D9848    pop         esi
 006D9849    pop         ebx
 006D984A    pop         ecx
 006D984B    pop         ebp
 006D984C    ret
end;*}

//006D9850
{*function sub_006D9850:?;
begin
 006D9850    push        ebx
 006D9851    mov         dl,1
 006D9853    mov         eax,[0043C7BC];TStringList
 006D9858    call        TStringList.Create;TStringList.Create
 006D985D    mov         ebx,eax
 006D985F    xor         edx,edx
 006D9861    mov         eax,ebx
 006D9863    call        TStringList.SetSorted
 006D9868    mov         edx,6D9938;'Yaw'
 006D986D    mov         eax,ebx
 006D986F    mov         ecx,dword ptr [eax]
 006D9871    call        dword ptr [ecx+38];TStringList.Add
 006D9874    mov         edx,6D994C;'Pitch'
 006D9879    mov         eax,ebx
 006D987B    mov         ecx,dword ptr [eax]
 006D987D    call        dword ptr [ecx+38];TStringList.Add
 006D9880    mov         edx,6D9964;'Roll'
 006D9885    mov         eax,ebx
 006D9887    mov         ecx,dword ptr [eax]
 006D9889    call        dword ptr [ecx+38];TStringList.Add
 006D988C    mov         edx,6D997C;'CompassHeading'
 006D9891    mov         eax,ebx
 006D9893    mov         ecx,dword ptr [eax]
 006D9895    call        dword ptr [ecx+38];TStringList.Add
 006D9898    mov         edx,6D99A8;'XAcceleration'
 006D989D    mov         eax,ebx
 006D989F    mov         ecx,dword ptr [eax]
 006D98A1    call        dword ptr [ecx+38];TStringList.Add
 006D98A4    mov         edx,6D99D0;'YAcceleration'
 006D98A9    mov         eax,ebx
 006D98AB    mov         ecx,dword ptr [eax]
 006D98AD    call        dword ptr [ecx+38];TStringList.Add
 006D98B0    mov         edx,6D99F8;'ZAcceleration'
 006D98B5    mov         eax,ebx
 006D98B7    mov         ecx,dword ptr [eax]
 006D98B9    call        dword ptr [ecx+38];TStringList.Add
 006D98BC    mov         edx,6D9A20;'YawVelocity'
 006D98C1    mov         eax,ebx
 006D98C3    mov         ecx,dword ptr [eax]
 006D98C5    call        dword ptr [ecx+38];TStringList.Add
 006D98C8    mov         edx,6D9A44;'PitchVelocity'
 006D98CD    mov         eax,ebx
 006D98CF    mov         ecx,dword ptr [eax]
 006D98D1    call        dword ptr [ecx+38];TStringList.Add
 006D98D4    mov         edx,6D9A6C;'RollVelocity'
 006D98D9    mov         eax,ebx
 006D98DB    mov         ecx,dword ptr [eax]
 006D98DD    call        dword ptr [ecx+38];TStringList.Add
 006D98E0    mov         edx,6D9A94;'XVelocity'
 006D98E5    mov         eax,ebx
 006D98E7    mov         ecx,dword ptr [eax]
 006D98E9    call        dword ptr [ecx+38];TStringList.Add
 006D98EC    mov         edx,6D9AB4;'YVelocity'
 006D98F1    mov         eax,ebx
 006D98F3    mov         ecx,dword ptr [eax]
 006D98F5    call        dword ptr [ecx+38];TStringList.Add
 006D98F8    mov         edx,6D9AD4;'ZVelocity'
 006D98FD    mov         eax,ebx
 006D98FF    mov         ecx,dword ptr [eax]
 006D9901    call        dword ptr [ecx+38];TStringList.Add
 006D9904    mov         edx,6D9AF4;'x'
 006D9909    mov         eax,ebx
 006D990B    mov         ecx,dword ptr [eax]
 006D990D    call        dword ptr [ecx+38];TStringList.Add
 006D9910    mov         edx,6D9B04;'y'
 006D9915    mov         eax,ebx
 006D9917    mov         ecx,dword ptr [eax]
 006D9919    call        dword ptr [ecx+38];TStringList.Add
 006D991C    mov         edx,6D9B14;'z'
 006D9921    mov         eax,ebx
 006D9923    mov         ecx,dword ptr [eax]
 006D9925    call        dword ptr [ecx+38];TStringList.Add
 006D9928    mov         eax,ebx
 006D992A    pop         ebx
 006D992B    ret
end;*}

//006D9B18
{*function sub_006D9B18(?:?):?;
begin
 006D9B18    push        ebp
 006D9B19    mov         ebp,esp
 006D9B1B    push        ecx
 006D9B1C    push        ebx
 006D9B1D    mov         dword ptr [ebp-4],eax
 006D9B20    mov         eax,dword ptr [ebp-4]
 006D9B23    call        @UStrAddRef
 006D9B28    xor         eax,eax
 006D9B2A    push        ebp
 006D9B2B    push        6D9B91
 006D9B30    push        dword ptr fs:[eax]
 006D9B33    mov         dword ptr fs:[eax],esp
 006D9B36    lea         eax,[ebp-4]
 006D9B39    mov         edx,6D9BAC;'Z800'
 006D9B3E    call        004F9BD0
 006D9B43    test        al,al
>006D9B45    jne         006D9B5C
 006D9B47    lea         eax,[ebp-4]
 006D9B4A    mov         edx,6D9BC4;'Nvidia'
 006D9B4F    call        004F9BD0
 006D9B54    test        al,al
>006D9B56    jne         006D9B5C
 006D9B58    xor         ebx,ebx
>006D9B5A    jmp         006D9B7B
 006D9B5C    lea         eax,[ebp-4]
 006D9B5F    call        004F9D00
 006D9B64    lea         eax,[ebp-4]
 006D9B67    mov         edx,6D9BE0;'.'
 006D9B6C    call        004F9BD0
 006D9B71    test        al,al
>006D9B73    jne         006D9B79
 006D9B75    xor         ebx,ebx
>006D9B77    jmp         006D9B7B
 006D9B79    mov         bl,1
 006D9B7B    xor         eax,eax
 006D9B7D    pop         edx
 006D9B7E    pop         ecx
 006D9B7F    pop         ecx
 006D9B80    mov         dword ptr fs:[eax],edx
 006D9B83    push        6D9B98
 006D9B88    lea         eax,[ebp-4]
 006D9B8B    call        @UStrClr
 006D9B90    ret
>006D9B91    jmp         @HandleFinally
>006D9B96    jmp         006D9B88
 006D9B98    mov         eax,ebx
 006D9B9A    pop         ebx
 006D9B9B    pop         ecx
 006D9B9C    pop         ebp
 006D9B9D    ret
end;*}

//006D9BE4
procedure Z800Thread.Execute;
begin
{*
 006D9BE4    push        ebp
 006D9BE5    mov         ebp,esp
 006D9BE7    add         esp,0FFFFFFE4
 006D9BEA    push        ebx
 006D9BEB    push        esi
 006D9BEC    push        edi
 006D9BED    mov         dword ptr [ebp-4],eax
 006D9BF0    mov         eax,6D9EB4;'Z800'
 006D9BF5    call        004F9160
 006D9BFA    xor         eax,eax
 006D9BFC    push        ebp
 006D9BFD    push        6D9E96
 006D9C02    push        dword ptr fs:[eax]
 006D9C05    mov         dword ptr fs:[eax],esp
 006D9C08    xor         eax,eax
 006D9C0A    mov         dword ptr [ebp-18],eax
 006D9C0D    mov         dword ptr [ebp-14],eax
 006D9C10    mov         eax,dword ptr [ebp-4]
 006D9C13    xor         edx,edx
 006D9C15    mov         dword ptr [eax+88],edx;Z800Thread.t:Double
 006D9C1B    mov         dword ptr [eax+8C],edx;Z800Thread.?f8C:dword
 006D9C21    mov         eax,dword ptr [ebp-4]
 006D9C24    xor         edx,edx
 006D9C26    mov         dword ptr [eax+90],edx;Z800Thread.LastKeepAliveTime:Double
 006D9C2C    mov         dword ptr [eax+94],edx;Z800Thread.?f94:dword
 006D9C32    mov         eax,dword ptr [ebp-4]
 006D9C35    xor         edx,edx
 006D9C37    mov         dword ptr [eax+6C],edx;Z800Thread.xv:Single
 006D9C3A    mov         eax,dword ptr [ebp-4]
 006D9C3D    xor         edx,edx
 006D9C3F    mov         dword ptr [eax+70],edx;Z800Thread.yv:Single
 006D9C42    mov         eax,dword ptr [ebp-4]
 006D9C45    xor         edx,edx
 006D9C47    mov         dword ptr [eax+74],edx;Z800Thread.zv:Single
 006D9C4A    mov         eax,dword ptr [ebp-4]
 006D9C4D    xor         edx,edx
 006D9C4F    mov         dword ptr [eax+78],edx;Z800Thread.x:Single
 006D9C52    mov         eax,dword ptr [ebp-4]
 006D9C55    xor         edx,edx
 006D9C57    mov         dword ptr [eax+7C],edx;Z800Thread.y:Single
 006D9C5A    mov         eax,dword ptr [ebp-4]
 006D9C5D    xor         edx,edx
 006D9C5F    mov         dword ptr [eax+80],edx;Z800Thread.z:Single
 006D9C65    lea         eax,[ebp-1C]
 006D9C68    push        eax
 006D9C69    push        3
 006D9C6B    push        0
 006D9C6D    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D9C72    push        eax
 006D9C73    call        dword ptr ds:[81F700]
 006D9C79    add         esp,10
 006D9C7C    fild        dword ptr [ebp-1C]
 006D9C7F    fld         tbyte ptr ds:[6D9EBC];0.9:Extended
 006D9C85    fmulp       st(1),st
 006D9C87    mov         eax,dword ptr [ebp-4]
 006D9C8A    fstp        qword ptr [eax+98];Z800Thread.TimeoutLength:Double
 006D9C90    wait
 006D9C91    mov         eax,dword ptr [ebp-4]
 006D9C94    fld         qword ptr [eax+98];Z800Thread.TimeoutLength:Double
 006D9C9A    fsub        dword ptr ds:[6D9EC8];8.5:Single
 006D9CA0    mov         eax,dword ptr [ebp-4]
 006D9CA3    fstp        qword ptr [eax+98];Z800Thread.TimeoutLength:Double
 006D9CA9    wait
>006D9CAA    jmp         006D9E7F
 006D9CAF    xor         eax,eax
 006D9CB1    push        ebp
 006D9CB2    push        6D9E75
 006D9CB7    push        dword ptr fs:[eax]
 006D9CBA    mov         dword ptr fs:[eax],esp
 006D9CBD    mov         eax,dword ptr [ebp-4]
 006D9CC0    add         eax,44;Z800Thread.RawData:TEMADeviceData
 006D9CC3    push        eax
 006D9CC4    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D9CC9    push        eax
 006D9CCA    call        dword ptr ds:[81F6F4]
 006D9CD0    add         esp,8
 006D9CD3    mov         edx,dword ptr [ebp-4]
 006D9CD6    mov         dword ptr [edx+40],eax;Z800Thread.PollResult:HRESULT
 006D9CD9    call        00682F08
 006D9CDE    fstp        qword ptr [ebp-10]
 006D9CE1    wait
 006D9CE2    fld         qword ptr [ebp-18]
 006D9CE5    fcomp       dword ptr ds:[6D9ECC];0:Single
 006D9CEB    wait
 006D9CEC    fnstsw      al
 006D9CEE    sahf
>006D9CEF    jne         006D9CFD
 006D9CF1    mov         eax,dword ptr [ebp-10]
 006D9CF4    mov         dword ptr [ebp-18],eax
 006D9CF7    mov         eax,dword ptr [ebp-0C]
 006D9CFA    mov         dword ptr [ebp-14],eax
 006D9CFD    mov         eax,dword ptr [ebp-4]
 006D9D00    cmp         dword ptr [eax+40],0;Z800Thread.PollResult:HRESULT
>006D9D04    jne         006D9DEE
 006D9D0A    fld         qword ptr [ebp-10]
 006D9D0D    fsub        qword ptr [ebp-18]
 006D9D10    mov         eax,dword ptr [ebp-4]
 006D9D13    fstp        qword ptr [eax+88];Z800Thread.t:Double
 006D9D19    wait
 006D9D1A    mov         eax,dword ptr [ebp-4]
 006D9D1D    fld         qword ptr [eax+88];Z800Thread.t:Double
 006D9D23    fcomp       dword ptr ds:[6D9ECC];0:Single
 006D9D29    wait
 006D9D2A    fnstsw      al
 006D9D2C    sahf
>006D9D2D    jae         006D9D40
 006D9D2F    mov         eax,dword ptr [ebp-4]
 006D9D32    xor         edx,edx
 006D9D34    mov         dword ptr [eax+88],edx;Z800Thread.t:Double
 006D9D3A    mov         dword ptr [eax+8C],edx;Z800Thread.?f8C:dword
 006D9D40    mov         eax,dword ptr [ebp-4]
 006D9D43    fld         dword ptr [eax+48]
 006D9D46    mov         eax,dword ptr [ebp-4]
 006D9D49    fmul        qword ptr [eax+88];Z800Thread.t:Double
 006D9D4F    mov         eax,dword ptr [ebp-4]
 006D9D52    fadd        dword ptr [eax+6C];Z800Thread.xv:Single
 006D9D55    mov         eax,dword ptr [ebp-4]
 006D9D58    fstp        dword ptr [eax+6C];Z800Thread.xv:Single
 006D9D5B    wait
 006D9D5C    mov         eax,dword ptr [ebp-4]
 006D9D5F    fld         dword ptr [eax+4C]
 006D9D62    mov         eax,dword ptr [ebp-4]
 006D9D65    fmul        qword ptr [eax+88];Z800Thread.t:Double
 006D9D6B    mov         eax,dword ptr [ebp-4]
 006D9D6E    fsubr       dword ptr [eax+70];Z800Thread.yv:Single
 006D9D71    mov         eax,dword ptr [ebp-4]
 006D9D74    fstp        dword ptr [eax+70];Z800Thread.yv:Single
 006D9D77    wait
 006D9D78    mov         eax,dword ptr [ebp-4]
 006D9D7B    fld         dword ptr [eax+44];Z800Thread.RawData:TEMADeviceData
 006D9D7E    mov         eax,dword ptr [ebp-4]
 006D9D81    fmul        qword ptr [eax+88];Z800Thread.t:Double
 006D9D87    mov         eax,dword ptr [ebp-4]
 006D9D8A    fsubr       dword ptr [eax+74];Z800Thread.zv:Single
 006D9D8D    mov         eax,dword ptr [ebp-4]
 006D9D90    fstp        dword ptr [eax+74];Z800Thread.zv:Single
 006D9D93    wait
 006D9D94    mov         eax,dword ptr [ebp-4]
 006D9D97    fld         dword ptr [eax+6C];Z800Thread.xv:Single
 006D9D9A    mov         eax,dword ptr [ebp-4]
 006D9D9D    fmul        qword ptr [eax+88];Z800Thread.t:Double
 006D9DA3    mov         eax,dword ptr [ebp-4]
 006D9DA6    fadd        dword ptr [eax+78];Z800Thread.x:Single
 006D9DA9    mov         eax,dword ptr [ebp-4]
 006D9DAC    fstp        dword ptr [eax+78];Z800Thread.x:Single
 006D9DAF    wait
 006D9DB0    mov         eax,dword ptr [ebp-4]
 006D9DB3    fld         dword ptr [eax+70];Z800Thread.yv:Single
 006D9DB6    mov         eax,dword ptr [ebp-4]
 006D9DB9    fmul        qword ptr [eax+88];Z800Thread.t:Double
 006D9DBF    mov         eax,dword ptr [ebp-4]
 006D9DC2    fadd        dword ptr [eax+7C];Z800Thread.y:Single
 006D9DC5    mov         eax,dword ptr [ebp-4]
 006D9DC8    fstp        dword ptr [eax+7C];Z800Thread.y:Single
 006D9DCB    wait
 006D9DCC    mov         eax,dword ptr [ebp-4]
 006D9DCF    fld         dword ptr [eax+74];Z800Thread.zv:Single
 006D9DD2    mov         eax,dword ptr [ebp-4]
 006D9DD5    fmul        qword ptr [eax+88];Z800Thread.t:Double
 006D9DDB    mov         eax,dword ptr [ebp-4]
 006D9DDE    fadd        dword ptr [eax+80];Z800Thread.z:Single
 006D9DE4    mov         eax,dword ptr [ebp-4]
 006D9DE7    fstp        dword ptr [eax+80];Z800Thread.z:Single
 006D9DED    wait
 006D9DEE    mov         eax,dword ptr [ebp-4]
 006D9DF1    cmp         byte ptr [eax+0D],0;Z800Thread.FTerminated:Boolean
>006D9DF5    jne         006D9E6B
 006D9DF7    cmp         byte ptr ds:[78C27C],0;gvar_0078C27C:Boolean
>006D9DFE    je          006D9E55
 006D9E00    fld         qword ptr [ebp-10]
 006D9E03    mov         eax,dword ptr [ebp-4]
 006D9E06    fsub        qword ptr [eax+90];Z800Thread.LastKeepAliveTime:Double
 006D9E0C    fcomp       dword ptr ds:[6D9ECC];0:Single
 006D9E12    wait
 006D9E13    fnstsw      al
 006D9E15    sahf
>006D9E16    jb          006D9E33
 006D9E18    fld         qword ptr [ebp-10]
 006D9E1B    mov         eax,dword ptr [ebp-4]
 006D9E1E    fsub        qword ptr [eax+90];Z800Thread.LastKeepAliveTime:Double
 006D9E24    mov         eax,dword ptr [ebp-4]
 006D9E27    fcomp       qword ptr [eax+98];Z800Thread.TimeoutLength:Double
 006D9E2D    wait
 006D9E2E    fnstsw      al
 006D9E30    sahf
>006D9E31    jbe         006D9E55
 006D9E33    mov         eax,[0078C270];0x0 gvar_0078C270:Pointer
 006D9E38    push        eax
 006D9E39    call        dword ptr ds:[81F6FC]
 006D9E3F    pop         ecx
 006D9E40    mov         eax,dword ptr [ebp-4]
 006D9E43    mov         edx,dword ptr [ebp-10]
 006D9E46    mov         dword ptr [eax+90],edx;Z800Thread.LastKeepAliveTime:Double
 006D9E4C    mov         edx,dword ptr [ebp-0C]
 006D9E4F    mov         dword ptr [eax+94],edx;Z800Thread.?f94:dword
 006D9E55    mov         eax,0A
 006D9E5A    call        TThread.Sleep
 006D9E5F    mov         eax,dword ptr [ebp-10]
 006D9E62    mov         dword ptr [ebp-18],eax
 006D9E65    mov         eax,dword ptr [ebp-0C]
 006D9E68    mov         dword ptr [ebp-14],eax
 006D9E6B    xor         eax,eax
 006D9E6D    pop         edx
 006D9E6E    pop         ecx
 006D9E6F    pop         ecx
 006D9E70    mov         dword ptr fs:[eax],edx
>006D9E73    jmp         006D9E7F
>006D9E75    jmp         @HandleAnyException
 006D9E7A    call        @DoneExcept
 006D9E7F    mov         eax,dword ptr [ebp-4]
 006D9E82    cmp         byte ptr [eax+0D],0;Z800Thread.FTerminated:Boolean
>006D9E86    je          006D9CAF
 006D9E8C    xor         eax,eax
 006D9E8E    pop         edx
 006D9E8F    pop         ecx
 006D9E90    pop         ecx
 006D9E91    mov         dword ptr fs:[eax],edx
>006D9E94    jmp         006D9EA0
>006D9E96    jmp         @HandleAnyException
 006D9E9B    call        @DoneExcept
 006D9EA0    pop         edi
 006D9EA1    pop         esi
 006D9EA2    pop         ebx
 006D9EA3    mov         esp,ebp
 006D9EA5    pop         ebp
 006D9EA6    ret
*}
end;

Initialization
//007828C4
{*
 007828C4    sub         dword ptr ds:[81F6E8],1
>007828CB    jae         007828ED
 007828CD    mov         eax,7828FC;'Initializing PieZ800'
 007828D2    call        004FA5FC
 007828D7    mov         dl,1
 007828D9    mov         eax,[0067D4A4];THashTable
 007828DE    call        THashTable.Create;THashTable.Create
 007828E3    mov         [0081F6E0],eax;gvar_0081F6E0:THashTable
 007828E8    call        006D2918
 007828ED    ret
*}
Finalization
end.