//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit26;

interface

uses
  SysUtils, Classes;

    procedure sub_004AAA70;//004AAA70

implementation

//004AAA70
procedure sub_004AAA70;
begin
{*
 004AAA70    push        ebx
 004AAA71    push        esi
 004AAA72    push        4AABD4;'comctl32.dll'
 004AAA77    call        kernel32.GetModuleHandleW
 004AAA7C    mov         ebx,eax
 004AAA7E    test        ebx,ebx
>004AAA80    je          004AABCE
 004AAA86    push        4AABF0;'InitializeFlatSB'
 004AAA8B    push        ebx
 004AAA8C    call        GetProcAddress
 004AAA91    mov         [00793270],eax;gvar_00793270:Pointer
 004AAA96    push        4AAC14;'UninitializeFlatSB'
 004AAA9B    push        ebx
 004AAA9C    call        GetProcAddress
 004AAAA1    mov         [00793274],eax;gvar_00793274:Pointer
 004AAAA6    push        4AAC3C;'FlatSB_GetScrollProp'
 004AAAAB    push        ebx
 004AAAAC    call        GetProcAddress
 004AAAB1    mov         [00793268],eax;gvar_00793268:Pointer
 004AAAB6    push        4AAC68;'FlatSB_SetScrollProp'
 004AAABB    push        ebx
 004AAABC    call        GetProcAddress
 004AAAC1    mov         [0079326C],eax;gvar_0079326C:Pointer
 004AAAC6    push        4AAC94;'FlatSB_EnableScrollBar'
 004AAACB    push        ebx
 004AAACC    call        GetProcAddress
 004AAAD1    mov         esi,eax
 004AAAD3    mov         dword ptr ds:[793244],esi;gvar_00793244:Pointer
 004AAAD9    test        esi,esi
>004AAADB    jne         004AAAE7
 004AAADD    mov         eax,40DDF0;user32.EnableScrollBar:LongBool
 004AAAE2    mov         [00793244],eax;gvar_00793244:Pointer
 004AAAE7    push        4AACC4;'FlatSB_ShowScrollBar'
 004AAAEC    push        ebx
 004AAAED    call        GetProcAddress
 004AAAF2    mov         esi,eax
 004AAAF4    mov         dword ptr ds:[793248],esi;gvar_00793248:Pointer
 004AAAFA    test        esi,esi
>004AAAFC    jne         004AAB08
 004AAAFE    mov         eax,40E308;user32.ShowScrollBar:LongBool
 004AAB03    mov         [00793248],eax;gvar_00793248:Pointer
 004AAB08    push        4AACF0;'FlatSB_GetScrollRange'
 004AAB0D    push        ebx
 004AAB0E    call        GetProcAddress
 004AAB13    mov         esi,eax
 004AAB15    mov         dword ptr ds:[79324C],esi;gvar_0079324C:Pointer
 004AAB1B    test        esi,esi
>004AAB1D    jne         004AAB29
 004AAB1F    mov         eax,40DFB8;user32.GetScrollRange:LongBool
 004AAB24    mov         [0079324C],eax;gvar_0079324C:Pointer
 004AAB29    push        4AAD1C;'FlatSB_GetScrollInfo'
 004AAB2E    push        ebx
 004AAB2F    call        GetProcAddress
 004AAB34    mov         esi,eax
 004AAB36    mov         dword ptr ds:[793250],esi;gvar_00793250:Pointer
 004AAB3C    test        esi,esi
>004AAB3E    jne         004AAB4A
 004AAB40    mov         eax,40DFA8;user32.GetScrollInfo:LongBool
 004AAB45    mov         [00793250],eax;gvar_00793250:Pointer
 004AAB4A    push        4AAD48;'FlatSB_GetScrollPos'
 004AAB4F    push        ebx
 004AAB50    call        GetProcAddress
 004AAB55    mov         esi,eax
 004AAB57    mov         dword ptr ds:[793254],esi;gvar_00793254:Pointer
 004AAB5D    test        esi,esi
>004AAB5F    jne         004AAB6B
 004AAB61    mov         eax,40DFB0;user32.GetScrollPos:Integer
 004AAB66    mov         [00793254],eax;gvar_00793254:Pointer
 004AAB6B    push        4AAD70;'FlatSB_SetScrollPos'
 004AAB70    push        ebx
 004AAB71    call        GetProcAddress
 004AAB76    mov         esi,eax
 004AAB78    mov         dword ptr ds:[793258],esi;gvar_00793258:Pointer
 004AAB7E    test        esi,esi
>004AAB80    jne         004AAB8C
 004AAB82    mov         eax,40E2A0;user32.SetScrollPos:Integer
 004AAB87    mov         [00793258],eax;gvar_00793258:Pointer
 004AAB8C    push        4AAD98;'FlatSB_SetScrollInfo'
 004AAB91    push        ebx
 004AAB92    call        GetProcAddress
 004AAB97    mov         esi,eax
 004AAB99    mov         dword ptr ds:[79325C],esi;gvar_0079325C:Pointer
 004AAB9F    test        esi,esi
>004AABA1    jne         004AABAD
 004AABA3    mov         eax,40E298;user32.SetScrollInfo:Integer
 004AABA8    mov         [0079325C],eax;gvar_0079325C:Pointer
 004AABAD    push        4AADC4;'FlatSB_SetScrollRange'
 004AABB2    push        ebx
 004AABB3    call        GetProcAddress
 004AABB8    mov         esi,eax
 004AABBA    mov         dword ptr ds:[793260],esi;gvar_00793260:Pointer
 004AABC0    test        esi,esi
>004AABC2    jne         004AABCE
 004AABC4    mov         eax,40E2A8;user32.SetScrollRange:LongBool
 004AABC9    mov         [00793260],eax;gvar_00793260:Pointer
 004AABCE    pop         esi
 004AABCF    pop         ebx
 004AABD0    ret
*}
end;

Initialization
//00780A30
{*
 00780A30    sub         dword ptr ds:[793264],1
>00780A37    jae         00780A3E
 00780A39    call        004AAA70
 00780A3E    ret
*}
Finalization
end.