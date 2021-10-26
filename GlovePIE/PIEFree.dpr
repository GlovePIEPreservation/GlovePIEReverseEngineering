//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
program PIEFree;

uses
  SysUtils,
  Classes,
  PieAny in 'PieAny.pas',
  PieBDRemote in 'PieBDRemote.pas',
  PieBluetooth in 'PieBluetooth.pas',
  PieCursors in 'PieCursors.pas',
  PieExpression in 'PieExpression.pas',
  PieFalcon in 'PieFalcon.pas',
  PieFastrak in 'PieFastrak.pas',
  PieFunction in 'PieFunction.pas',
  PieHatTrack in 'PieHatTrack.pas',
  PieIntersense in 'PieIntersense.pas',
  PieJoystick in 'PieJoystick.pas',
  PieKinectSDK2 in 'PieKinectSDK2.pas',
  PieLightstone in 'PieLightstone.pas',
  PieMidi in 'PieMidi.pas',
  PieModule in 'PieModule.pas',
  PieMouse in 'PieMouse.pas',
  PieNDS in 'PieNDS.pas',
  PieNeurosky in 'PieNeurosky.pas',
  PieOSC in 'PieOSC.pas',
  PieP5 in 'PieP5.pas',
  PiePie in 'PiePie.pas',
  PiePinch in 'PiePinch.pas',
  PiePPJoy in 'PiePPJoy.pas',
  PiePPT in 'PiePPT.pas',
  PieRemote in 'PieRemote.pas',
  PieRower in 'PieRower.pas',
  PieSixense in 'PieSixense.pas',
  PieSR in 'PieSR.pas',
  PieStatement in 'PieStatement.pas',
  PieVariables in 'PieVariables.pas',
  PieWiimote in 'PieWiimote.pas',
  PieXInput in 'PieXInput.pas',
  PieZ800 in 'PieZ800.pas',
  Themes in 'Themes.pas',
  uTextDrawer in 'uTextDrawer.pas';

{$R *.res}

//007830BC
begin
{*
 007830BC    push        ebp
 007830BD    mov         ebp,esp
 007830BF    add         esp,0FFFFFFF0
 007830C2    push        ebx
 007830C3    push        esi
 007830C4    push        edi
 007830C5    mov         eax,774D64
 007830CA    call        @InitExe
 007830CF    mov         ebx,dword ptr ds:[78D590];^Application:TApplication
 007830D5    xor         edx,edx
 007830D7    push        ebp
 007830D8    push        783237
 007830DD    push        dword ptr fs:[edx]
 007830E0    mov         dword ptr fs:[edx],esp
 007830E3    mov         eax,[0078DAA8];^gvar_00790D9A
 007830E8    mov         word ptr [eax],2E
 007830ED    mov         eax,[0078D894];^gvar_00790D98
 007830F2    mov         word ptr [eax],2C
 007830F7    mov         eax,783268;'Starting main'
 007830FC    call        004FA5FC
 00783101    mov         eax,dword ptr [ebx]
 00783103    call        TApplication.Initialize
 00783108    mov         eax,783290;'GUI'
 0078310D    call        004F9160
 00783112    mov         eax,7832A0;'Application object initialized'
 00783117    call        004FA5FC
 0078311C    mov         eax,dword ptr [ebx]
 0078311E    mov         dl,1
 00783120    call        TApplication.SetMainFormOnTaskBar
 00783125    mov         eax,dword ptr [ebx]
 00783127    mov         edx,7832EC;'GlovePIE Free'
 0078312C    call        TApplication.SetTitle
 00783131    mov         eax,783314;'Creating main window'
 00783136    call        004FA5FC
 0078313B    mov         ecx,dword ptr ds:[78D61C];^gvar_00822CA0:TEditorForm
 00783141    mov         eax,dword ptr [ebx]
 00783143    mov         edx,dword ptr ds:[7460AC];TEditorForm
 00783149    call        TApplication.CreateForm
 0078314E    mov         ecx,dword ptr ds:[78D998];^gvar_00822D6C:TForm1
 00783154    mov         eax,dword ptr [ebx]
 00783156    mov         edx,dword ptr ds:[76B4E0];TForm1
 0078315C    call        TApplication.CreateForm
 00783161    mov         eax,78334C;'Creating debug window'
 00783166    call        004FA5FC
 0078316B    mov         ecx,dword ptr ds:[78D690];^gvar_00793344:TDebugWindow
 00783171    mov         eax,dword ptr [ebx]
 00783173    mov         edx,dword ptr ds:[4F8368];TDebugWindow
 00783179    call        TApplication.CreateForm
 0078317E    mov         eax,[0078CBB8];^gvar_007868D0
 00783183    mov         byte ptr [eax],1
 00783186    mov         ecx,dword ptr ds:[78CBA8];^gvar_008161E8:TCursorForm
 0078318C    mov         eax,dword ptr [ebx]
 0078318E    mov         edx,dword ptr ds:[5E5828];TCursorForm
 00783194    call        TApplication.CreateForm
 00783199    mov         ecx,dword ptr ds:[78D618];^gvar_00822C98:TWiimoteForm
 0078319F    mov         eax,dword ptr [ebx]
 007831A1    mov         edx,dword ptr ds:[7439E4];TWiimoteForm
 007831A7    call        TApplication.CreateForm
 007831AC    mov         ecx,dword ptr ds:[78D6D8];^gvar_00822C9C:TSixaxisForm
 007831B2    mov         eax,dword ptr [ebx]
 007831B4    mov         edx,dword ptr ds:[744EE8];TSixaxisForm
 007831BA    call        TApplication.CreateForm
 007831BF    mov         ecx,dword ptr ds:[78CBA4];^gvar_0081F5B8:TInvForm
 007831C5    mov         eax,dword ptr [ebx]
 007831C7    mov         edx,dword ptr ds:[6C542C];TInvForm
 007831CD    call        TApplication.CreateForm
 007831D2    mov         eax,783384;'Assigning exception handler'
 007831D7    call        004FA5FC
 007831DC    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007831E1    mov         eax,dword ptr [eax]
 007831E3    mov         edx,dword ptr [ebx]
 007831E5    mov         dword ptr [edx+0F4],eax;TApplication.?fF4:dword
 007831EB    mov         dword ptr [edx+0F0],75E4B8;TApplication.FOnException:TExceptionEvent TEditorForm.Excepti...
 007831F5    mov         eax,7833C8;'Creating debug remote control window'
 007831FA    call        004FA5FC
 007831FF    mov         ecx,dword ptr ds:[78CD40];^gvar_008229FC:TDebugRemoteForm
 00783205    mov         eax,dword ptr [ebx]
 00783207    mov         edx,dword ptr ds:[71D8C8];TDebugRemoteForm
 0078320D    call        TApplication.CreateForm
 00783212    mov         eax,783420;'Running application'
 00783217    call        004FA5FC
 0078321C    mov         eax,dword ptr [ebx]
 0078321E    call        TApplication.Run
 00783223    mov         eax,783454;'Application finished'
 00783228    call        004FA5FC
 0078322D    xor         eax,eax
 0078322F    pop         edx
 00783230    pop         ecx
 00783231    pop         ecx
 00783232    mov         dword ptr fs:[eax],edx
>00783235    jmp         00783252
>00783237    jmp         @HandleOnException
 0078323C    dd          1
 00783240    dd          00418C04;Exception
 00783244    dd          00783248
 00783248    call        004FA644
 0078324D    call        @DoneExcept
 00783252    pop         edi
 00783253    pop         esi
 00783254    pop         ebx
 00783255    call        @Halt0
*}
end.
