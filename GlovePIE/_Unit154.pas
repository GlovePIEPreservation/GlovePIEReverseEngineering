//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit154;

interface

uses
  SysUtils, Classes;

    procedure sub_007668F0;//007668F0

implementation

//007668F0
procedure sub_007668F0;
begin
{*
 007668F0    push        ebx
 007668F1    mov         ebx,822CD8;gvar_00822CD8:THashTable
 007668F6    xor         ecx,ecx
 007668F8    mov         edx,766F78;'Exists'
 007668FD    mov         eax,dword ptr [ebx]
 007668FF    call        THashTable.Add
 00766904    xor         ecx,ecx
 00766906    mov         edx,766F94;'connected'
 0076690B    mov         eax,dword ptr [ebx]
 0076690D    call        THashTable.Add
 00766912    xor         ecx,ecx
 00766914    mov         edx,766FB4;'PluggedIn'
 00766919    mov         eax,dword ptr [ebx]
 0076691B    call        THashTable.Add
 00766920    xor         ecx,ecx
 00766922    mov         edx,766FD4;'valid'
 00766927    mov         eax,dword ptr [ebx]
 00766929    call        THashTable.Add
 0076692E    xor         ecx,ecx
 00766930    mov         edx,766FEC;'IsValid'
 00766935    mov         eax,dword ptr [ebx]
 00766937    call        THashTable.Add
 0076693C    mov         ecx,1
 00766941    mov         edx,767008;'LeftHand'
 00766946    mov         eax,dword ptr [ebx]
 00766948    call        THashTable.Add
 0076694D    mov         ecx,1
 00766952    mov         edx,767028;'LeftHanded'
 00766957    mov         eax,dword ptr [ebx]
 00766959    call        THashTable.Add
 0076695E    mov         ecx,2
 00766963    mov         edx,76704C;'Type'
 00766968    mov         eax,dword ptr [ebx]
 0076696A    call        THashTable.Add
 0076696F    mov         ecx,2
 00766974    mov         edx,767064;'TypeNumber'
 00766979    mov         eax,dword ptr [ebx]
 0076697B    call        THashTable.Add
 00766980    mov         ecx,3
 00766985    mov         edx,767088;'TypeName'
 0076698A    mov         eax,dword ptr [ebx]
 0076698C    call        THashTable.Add
 00766991    mov         ecx,4
 00766996    mov         edx,7670A8;'AbsoluteThumb'
 0076699B    mov         eax,dword ptr [ebx]
 0076699D    call        THashTable.Add
 007669A2    mov         ecx,5
 007669A7    mov         edx,7670D0;'AbsoluteIndex'
 007669AC    mov         eax,dword ptr [ebx]
 007669AE    call        THashTable.Add
 007669B3    mov         ecx,6
 007669B8    mov         edx,7670F8;'AbsoluteMiddle'
 007669BD    mov         eax,dword ptr [ebx]
 007669BF    call        THashTable.Add
 007669C4    mov         ecx,7
 007669C9    mov         edx,767124;'AbsoluteRing'
 007669CE    mov         eax,dword ptr [ebx]
 007669D0    call        THashTable.Add
 007669D5    mov         ecx,8
 007669DA    mov         edx,76714C;'AbsolutePinky'
 007669DF    mov         eax,dword ptr [ebx]
 007669E1    call        THashTable.Add
 007669E6    mov         ecx,4
 007669EB    mov         edx,767174;'AThumb'
 007669F0    mov         eax,dword ptr [ebx]
 007669F2    call        THashTable.Add
 007669F7    mov         ecx,5
 007669FC    mov         edx,767190;'AIndex'
 00766A01    mov         eax,dword ptr [ebx]
 00766A03    call        THashTable.Add
 00766A08    mov         ecx,6
 00766A0D    mov         edx,7671AC;'AMiddle'
 00766A12    mov         eax,dword ptr [ebx]
 00766A14    call        THashTable.Add
 00766A19    mov         ecx,7
 00766A1E    mov         edx,7671C8;'ARing'
 00766A23    mov         eax,dword ptr [ebx]
 00766A25    call        THashTable.Add
 00766A2A    mov         ecx,8
 00766A2F    mov         edx,7671E0;'APinky'
 00766A34    mov         eax,dword ptr [ebx]
 00766A36    call        THashTable.Add
 00766A3B    mov         ecx,4
 00766A40    mov         edx,7671FC;'AbsoluteFinger0'
 00766A45    mov         eax,dword ptr [ebx]
 00766A47    call        THashTable.Add
 00766A4C    mov         ecx,5
 00766A51    mov         edx,767228;'AbsoluteFinger1'
 00766A56    mov         eax,dword ptr [ebx]
 00766A58    call        THashTable.Add
 00766A5D    mov         ecx,6
 00766A62    mov         edx,767254;'AbsoluteFinger2'
 00766A67    mov         eax,dword ptr [ebx]
 00766A69    call        THashTable.Add
 00766A6E    mov         ecx,7
 00766A73    mov         edx,767280;'AbsoluteFinger3'
 00766A78    mov         eax,dword ptr [ebx]
 00766A7A    call        THashTable.Add
 00766A7F    mov         ecx,8
 00766A84    mov         edx,7672AC;'AbsoluteFinger4'
 00766A89    mov         eax,dword ptr [ebx]
 00766A8B    call        THashTable.Add
 00766A90    mov         ecx,4
 00766A95    mov         edx,7672D8;'AFinger0'
 00766A9A    mov         eax,dword ptr [ebx]
 00766A9C    call        THashTable.Add
 00766AA1    mov         ecx,5
 00766AA6    mov         edx,7672F8;'AFinger1'
 00766AAB    mov         eax,dword ptr [ebx]
 00766AAD    call        THashTable.Add
 00766AB2    mov         ecx,6
 00766AB7    mov         edx,767318;'AFinger2'
 00766ABC    mov         eax,dword ptr [ebx]
 00766ABE    call        THashTable.Add
 00766AC3    mov         ecx,7
 00766AC8    mov         edx,767338;'AFinger3'
 00766ACD    mov         eax,dword ptr [ebx]
 00766ACF    call        THashTable.Add
 00766AD4    mov         ecx,8
 00766AD9    mov         edx,767358;'AFinger4'
 00766ADE    mov         eax,dword ptr [ebx]
 00766AE0    call        THashTable.Add
 00766AE5    mov         ecx,9
 00766AEA    mov         edx,767378;'AbsoluteThumbMedial'
 00766AEF    mov         eax,dword ptr [ebx]
 00766AF1    call        THashTable.Add
 00766AF6    mov         ecx,0B
 00766AFB    mov         edx,7673AC;'AbsoluteIndexProximal'
 00766B00    mov         eax,dword ptr [ebx]
 00766B02    call        THashTable.Add
 00766B07    mov         ecx,0D
 00766B0C    mov         edx,7673E4;'AbsoluteMiddleProximal'
 00766B11    mov         eax,dword ptr [ebx]
 00766B13    call        THashTable.Add
 00766B18    mov         ecx,0F
 00766B1D    mov         edx,767420;'AbsoluteRingProximal'
 00766B22    mov         eax,dword ptr [ebx]
 00766B24    call        THashTable.Add
 00766B29    mov         ecx,11
 00766B2E    mov         edx,767458;'AbsolutePinkyProximal'
 00766B33    mov         eax,dword ptr [ebx]
 00766B35    call        THashTable.Add
 00766B3A    mov         ecx,0A
 00766B3F    mov         edx,767490;'AbsoluteThumbDistal'
 00766B44    mov         eax,dword ptr [ebx]
 00766B46    call        THashTable.Add
 00766B4B    mov         ecx,0C
 00766B50    mov         edx,7674C4;'AbsoluteIndexMedial'
 00766B55    mov         eax,dword ptr [ebx]
 00766B57    call        THashTable.Add
 00766B5C    mov         ecx,0E
 00766B61    mov         edx,7674F8;'AbsoluteMiddleMedial'
 00766B66    mov         eax,dword ptr [ebx]
 00766B68    call        THashTable.Add
 00766B6D    mov         ecx,10
 00766B72    mov         edx,767530;'AbsoluteRingMedial'
 00766B77    mov         eax,dword ptr [ebx]
 00766B79    call        THashTable.Add
 00766B7E    mov         ecx,12
 00766B83    mov         edx,767564;'AbsolutePinkyMedial'
 00766B88    mov         eax,dword ptr [ebx]
 00766B8A    call        THashTable.Add
 00766B8F    mov         ecx,13
 00766B94    mov         edx,767598;'AbsoluteGapThumbIndex'
 00766B99    mov         eax,dword ptr [ebx]
 00766B9B    call        THashTable.Add
 00766BA0    mov         ecx,14
 00766BA5    mov         edx,7675D0;'AbsoluteGapIndexMiddle'
 00766BAA    mov         eax,dword ptr [ebx]
 00766BAC    call        THashTable.Add
 00766BB1    mov         ecx,15
 00766BB6    mov         edx,76760C;'AbsoluteGapMiddleRing'
 00766BBB    mov         eax,dword ptr [ebx]
 00766BBD    call        THashTable.Add
 00766BC2    mov         ecx,16
 00766BC7    mov         edx,767644;'AbsoluteGapRingPinky'
 00766BCC    mov         eax,dword ptr [ebx]
 00766BCE    call        THashTable.Add
 00766BD3    mov         ecx,19
 00766BD8    mov         edx,76767C;'AbsoluteGapThumbPalm'
 00766BDD    mov         eax,dword ptr [ebx]
 00766BDF    call        THashTable.Add
 00766BE4    mov         ecx,1A
 00766BE9    mov         edx,7676B4;'AbsoluteWristBend'
 00766BEE    mov         eax,dword ptr [ebx]
 00766BF0    call        THashTable.Add
 00766BF5    mov         ecx,4
 00766BFA    mov         edx,7676E4;'AbsThumb'
 00766BFF    mov         eax,dword ptr [ebx]
 00766C01    call        THashTable.Add
 00766C06    mov         ecx,5
 00766C0B    mov         edx,767704;'AbsIndex'
 00766C10    mov         eax,dword ptr [ebx]
 00766C12    call        THashTable.Add
 00766C17    mov         ecx,6
 00766C1C    mov         edx,767724;'AbsMiddle'
 00766C21    mov         eax,dword ptr [ebx]
 00766C23    call        THashTable.Add
 00766C28    mov         ecx,7
 00766C2D    mov         edx,767744;'AbsRing'
 00766C32    mov         eax,dword ptr [ebx]
 00766C34    call        THashTable.Add
 00766C39    mov         ecx,8
 00766C3E    mov         edx,767760;'AbsPinky'
 00766C43    mov         eax,dword ptr [ebx]
 00766C45    call        THashTable.Add
 00766C4A    mov         ecx,9
 00766C4F    mov         edx,767780;'AbsThumbMedial'
 00766C54    mov         eax,dword ptr [ebx]
 00766C56    call        THashTable.Add
 00766C5B    mov         ecx,0B
 00766C60    mov         edx,7677AC;'AbsIndexProximal'
 00766C65    mov         eax,dword ptr [ebx]
 00766C67    call        THashTable.Add
 00766C6C    mov         ecx,0D
 00766C71    mov         edx,7677DC;'AbsMiddleProximal'
 00766C76    mov         eax,dword ptr [ebx]
 00766C78    call        THashTable.Add
 00766C7D    mov         ecx,0F
 00766C82    mov         edx,76780C;'AbsRingProximal'
 00766C87    mov         eax,dword ptr [ebx]
 00766C89    call        THashTable.Add
 00766C8E    mov         ecx,11
 00766C93    mov         edx,767838;'AbsPinkyProximal'
 00766C98    mov         eax,dword ptr [ebx]
 00766C9A    call        THashTable.Add
 00766C9F    mov         ecx,0A
 00766CA4    mov         edx,767868;'AbsThumbDistal'
 00766CA9    mov         eax,dword ptr [ebx]
 00766CAB    call        THashTable.Add
 00766CB0    mov         ecx,0C
 00766CB5    mov         edx,767894;'AbsIndexMedial'
 00766CBA    mov         eax,dword ptr [ebx]
 00766CBC    call        THashTable.Add
 00766CC1    mov         ecx,0E
 00766CC6    mov         edx,7678C0;'AbsMiddleMedial'
 00766CCB    mov         eax,dword ptr [ebx]
 00766CCD    call        THashTable.Add
 00766CD2    mov         ecx,10
 00766CD7    mov         edx,7678EC;'AbsRingMedial'
 00766CDC    mov         eax,dword ptr [ebx]
 00766CDE    call        THashTable.Add
 00766CE3    mov         ecx,12
 00766CE8    mov         edx,767914;'AbsPinkyMedial'
 00766CED    mov         eax,dword ptr [ebx]
 00766CEF    call        THashTable.Add
 00766CF4    mov         ecx,13
 00766CF9    mov         edx,767940;'AbsGapThumbIndex'
 00766CFE    mov         eax,dword ptr [ebx]
 00766D00    call        THashTable.Add
 00766D05    mov         ecx,14
 00766D0A    mov         edx,767970;'AbsGapIndexMiddle'
 00766D0F    mov         eax,dword ptr [ebx]
 00766D11    call        THashTable.Add
 00766D16    mov         ecx,15
 00766D1B    mov         edx,7679A0;'AbsGapMiddleRing'
 00766D20    mov         eax,dword ptr [ebx]
 00766D22    call        THashTable.Add
 00766D27    mov         ecx,16
 00766D2C    mov         edx,7679D0;'AbsGapRingPinky'
 00766D31    mov         eax,dword ptr [ebx]
 00766D33    call        THashTable.Add
 00766D38    mov         ecx,19
 00766D3D    mov         edx,7679FC;'AbsGapThumbPalm'
 00766D42    mov         eax,dword ptr [ebx]
 00766D44    call        THashTable.Add
 00766D49    mov         ecx,1A
 00766D4E    mov         edx,767A28;'AbsWristBend'
 00766D53    mov         eax,dword ptr [ebx]
 00766D55    call        THashTable.Add
 00766D5A    mov         ecx,17
 00766D5F    mov         edx,767A50;'RawPitch'
 00766D64    mov         eax,dword ptr [ebx]
 00766D66    call        THashTable.Add
 00766D6B    mov         ecx,18
 00766D70    mov         edx,767A70;'RawRoll'
 00766D75    mov         eax,dword ptr [ebx]
 00766D77    call        THashTable.Add
 00766D7C    mov         ecx,1B
 00766D81    mov         edx,767A8C;'Gesture'
 00766D86    mov         eax,dword ptr [ebx]
 00766D88    call        THashTable.Add
 00766D8D    mov         ecx,1C
 00766D92    mov         edx,767AA8;'NewData'
 00766D97    mov         eax,dword ptr [ebx]
 00766D99    call        THashTable.Add
 00766D9E    mov         ecx,1D
 00766DA3    mov         edx,767AC4;'maxl'
 00766DA8    mov         eax,dword ptr [ebx]
 00766DAA    call        THashTable.Add
 00766DAF    mov         ecx,1E
 00766DB4    mov         edx,767ADC;'minn'
 00766DB9    mov         eax,dword ptr [ebx]
 00766DBB    call        THashTable.Add
 00766DC0    mov         ecx,1F
 00766DC5    mov         edx,767AF4;'calibrating'
 00766DCA    mov         eax,dword ptr [ebx]
 00766DCC    call        THashTable.Add
 00766DD1    mov         ecx,1F
 00766DD6    mov         edx,767B18;'autocalibration'
 00766DDB    mov         eax,dword ptr [ebx]
 00766DDD    call        THashTable.Add
 00766DE2    mov         ecx,20
 00766DE7    mov         edx,767B44;'thumb'
 00766DEC    mov         eax,dword ptr [ebx]
 00766DEE    call        THashTable.Add
 00766DF3    mov         ecx,21
 00766DF8    mov         edx,767B5C;'index'
 00766DFD    mov         eax,dword ptr [ebx]
 00766DFF    call        THashTable.Add
 00766E04    mov         ecx,22
 00766E09    mov         edx,767B74;'middle'
 00766E0E    mov         eax,dword ptr [ebx]
 00766E10    call        THashTable.Add
 00766E15    mov         ecx,23
 00766E1A    mov         edx,767B90;'ring'
 00766E1F    mov         eax,dword ptr [ebx]
 00766E21    call        THashTable.Add
 00766E26    mov         ecx,24
 00766E2B    mov         edx,767BA8;'pinky'
 00766E30    mov         eax,dword ptr [ebx]
 00766E32    call        THashTable.Add
 00766E37    mov         ecx,25
 00766E3C    mov         edx,767BC0;'thumbnear'
 00766E41    mov         eax,dword ptr [ebx]
 00766E43    call        THashTable.Add
 00766E48    mov         ecx,26
 00766E4D    mov         edx,767BE0;'indexnear'
 00766E52    mov         eax,dword ptr [ebx]
 00766E54    call        THashTable.Add
 00766E59    mov         ecx,27
 00766E5E    mov         edx,767C00;'middlenear'
 00766E63    mov         eax,dword ptr [ebx]
 00766E65    call        THashTable.Add
 00766E6A    mov         ecx,28
 00766E6F    mov         edx,767C24;'ringnear'
 00766E74    mov         eax,dword ptr [ebx]
 00766E76    call        THashTable.Add
 00766E7B    mov         ecx,29
 00766E80    mov         edx,767C44;'pinkynear'
 00766E85    mov         eax,dword ptr [ebx]
 00766E87    call        THashTable.Add
 00766E8C    mov         ecx,2A
 00766E91    mov         edx,767C64;'thumbfar'
 00766E96    mov         eax,dword ptr [ebx]
 00766E98    call        THashTable.Add
 00766E9D    mov         ecx,2B
 00766EA2    mov         edx,767C84;'indexfar'
 00766EA7    mov         eax,dword ptr [ebx]
 00766EA9    call        THashTable.Add
 00766EAE    mov         ecx,2C
 00766EB3    mov         edx,767CA4;'middlefar'
 00766EB8    mov         eax,dword ptr [ebx]
 00766EBA    call        THashTable.Add
 00766EBF    mov         ecx,2D
 00766EC4    mov         edx,767CC4;'ringfar'
 00766EC9    mov         eax,dword ptr [ebx]
 00766ECB    call        THashTable.Add
 00766ED0    mov         ecx,2E
 00766ED5    mov         edx,767CE0;'pinkyfar'
 00766EDA    mov         eax,dword ptr [ebx]
 00766EDC    call        THashTable.Add
 00766EE1    mov         ecx,2F
 00766EE6    mov         edx,767D00;'GapThumbIndex'
 00766EEB    mov         eax,dword ptr [ebx]
 00766EED    call        THashTable.Add
 00766EF2    mov         ecx,30
 00766EF7    mov         edx,767D28;'GapIndexMiddle'
 00766EFC    mov         eax,dword ptr [ebx]
 00766EFE    call        THashTable.Add
 00766F03    mov         ecx,31
 00766F08    mov         edx,767D54;'GapMiddleRing'
 00766F0D    mov         eax,dword ptr [ebx]
 00766F0F    call        THashTable.Add
 00766F14    mov         ecx,32
 00766F19    mov         edx,767D7C;'GapRingPinky'
 00766F1E    mov         eax,dword ptr [ebx]
 00766F20    call        THashTable.Add
 00766F25    mov         ecx,33
 00766F2A    mov         edx,767DA4;'GapThumbPalm'
 00766F2F    mov         eax,dword ptr [ebx]
 00766F31    call        THashTable.Add
 00766F36    mov         ecx,34
 00766F3B    mov         edx,767DCC;'WristBend'
 00766F40    mov         eax,dword ptr [ebx]
 00766F42    call        THashTable.Add
 00766F47    mov         ecx,35
 00766F4C    mov         edx,767DEC;'ScaledPitch'
 00766F51    mov         eax,dword ptr [ebx]
 00766F53    call        THashTable.Add
 00766F58    mov         ecx,36
 00766F5D    mov         edx,767E10;'ScaledRoll'
 00766F62    mov         eax,dword ptr [ebx]
 00766F64    call        THashTable.Add
 00766F69    pop         ebx
 00766F6A    ret
*}
end;

Initialization
//00782F10
{*
 00782F10    sub         dword ptr ds:[822CDC],1
>00782F17    jae         00782F39
 00782F19    mov         eax,782F48;'Initializing PieFiveDT'
 00782F1E    call        004FA5FC
 00782F23    mov         dl,1
 00782F25    mov         eax,[0067D4A4];THashTable
 00782F2A    call        THashTable.Create;THashTable.Create
 00782F2F    mov         [00822CD8],eax;gvar_00822CD8:THashTable
 00782F34    call        007668F0
 00782F39    ret
*}
Finalization
end.