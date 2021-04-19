//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit3;

interface

uses
  SysUtils, Classes;

type
  TMessage = TMessage = record//size=10
Msg:Cardinal;//f0
WParam:Integer;//f4
LParam:Integer;//f8
Result:Integer;//fC
WParamLo:Word;//f4
WParamHi:Word;//f6
LParamLo:Word;//f8
LParamHi:Word;//fA
ResultLo:Word;//fC
ResultHi:Word;//fE
end;;
  TWMKey = TWMKey = record//size=10
Msg:Cardinal;//f0
CharCode:Word;//f4
Unused:Word;//f6
KeyData:Integer;//f8
Result:Integer;//fC
end;;
  TWMMenuChar = TWMMenuChar = record//size=10
Msg:Cardinal;//f0
User:Char;//f4
MenuFlag:Word;//f6
Menu:HMENU;//f8
Result:Integer;//fC
end;;
  TExceptType = (etDivByZero, etRangeError, etIntOverflow, etInvalidOp, etZeroDivide, etOverflow, etUnderflow, etInvalidCast, etAccessViolation, etPrivilege, etControlC, etStackOverflow, etVariantError, etAssertionFailed, etExternalException, etIntfCastError, etSafeCallException, etMonitorLockException, etNoMonitorSupportException, etNotImplemented);
  TExceptRec = TExceptRec = record//size=8
f4:string;//f4
end;
EClass:TExceptType;//f0
EIdent:string;//f4
end;;
    function SendTextMessage(Handle:HWND; Msg:UINT; WParam:WPARAM; LParam:UnicodeString):LRESULT;//0040E7D0
    function SendStructMessage(Handle:HWND; Msg:UINT; WParam:WPARAM; const LParam:void ):LRESULT;//0040E82C
    function SendGetStructMessage(Handle:HWND; Msg:UINT; WParam:WPARAM; var LParam:void ; Unused:Boolean):LRESULT;//0040E844
    function SendGetIntMessage(Handle:HWND; Msg:UINT; var WParam:Integer; var LParam:Integer):LRESULT;//0040E85C
    function CheckPSAPILoaded:Boolean;//0040EBE4
    function GetMappedFileName(hProcess:THandle; lpv:Pointer; lpFilename:PWideChar; nSize:DWORD):DWORD;//0040F0C4
    function CheckLetter:Boolean;//0040F30C
    function CheckLetterOrDigit:Boolean;//0040F318
    function CheckSeparator:Boolean;//0040F328
    function IsLatin1:Boolean;//0040F334
    function IsLetter:Boolean;//0040F340
    function IsLetterOrDigit:Boolean;//0040F3CC
    function IsAscii:Boolean;//0040F434
    function IsDigit:Boolean;//0040F440
    function GetUnicodeCategory:TUnicodeCategory;//0040F4AC
    procedure bin_data;//0040F50C
    procedure Initialize;//00418448
    function IsWhiteSpace:Boolean;//0041849C

implementation

//0040E7D0
function SendTextMessage(Handle:HWND; Msg:UINT; WParam:WPARAM; LParam:UnicodeString):LRESULT;
begin
{*
 0040E7D0    push        ebp
 0040E7D1    mov         ebp,esp
 0040E7D3    push        ebx
 0040E7D4    push        esi
 0040E7D5    push        edi
 0040E7D6    mov         edi,ecx
 0040E7D8    mov         esi,edx
 0040E7DA    mov         ebx,eax
 0040E7DC    mov         eax,dword ptr [ebp+8]
 0040E7DF    call        @UStrAddRef
 0040E7E4    xor         eax,eax
 0040E7E6    push        ebp
 0040E7E7    push        40E81B
 0040E7EC    push        dword ptr fs:[eax]
 0040E7EF    mov         dword ptr fs:[eax],esp
 0040E7F2    mov         eax,dword ptr [ebp+8]
 0040E7F5    call        @UStrToPWChar
 0040E7FA    push        eax
 0040E7FB    push        edi
 0040E7FC    push        esi
 0040E7FD    push        ebx
 0040E7FE    call        user32.SendMessageW
 0040E803    mov         ebx,eax
 0040E805    xor         eax,eax
 0040E807    pop         edx
 0040E808    pop         ecx
 0040E809    pop         ecx
 0040E80A    mov         dword ptr fs:[eax],edx
 0040E80D    push        40E822
 0040E812    lea         eax,[ebp+8]
 0040E815    call        @UStrClr
 0040E81A    ret
>0040E81B    jmp         @HandleFinally
>0040E820    jmp         0040E812
 0040E822    mov         eax,ebx
 0040E824    pop         edi
 0040E825    pop         esi
 0040E826    pop         ebx
 0040E827    pop         ebp
 0040E828    ret         4
*}
end;

//0040E82C
function SendStructMessage(Handle:HWND; Msg:UINT; WParam:WPARAM; const LParam:void ):LRESULT;
begin
{*
 0040E82C    push        ebp
 0040E82D    mov         ebp,esp
 0040E82F    push        ebx
 0040E830    mov         ebx,dword ptr [ebp+8]
 0040E833    push        ebx
 0040E834    push        ecx
 0040E835    push        edx
 0040E836    push        eax
 0040E837    call        user32.SendMessageW
 0040E83C    pop         ebx
 0040E83D    pop         ebp
 0040E83E    ret         4
*}
end;

//0040E844
function SendGetStructMessage(Handle:HWND; Msg:UINT; WParam:WPARAM; var LParam:void ; Unused:Boolean):LRESULT;
begin
{*
 0040E844    push        ebp
 0040E845    mov         ebp,esp
 0040E847    push        ebx
 0040E848    mov         ebx,dword ptr [ebp+0C]
 0040E84B    push        ebx
 0040E84C    push        ecx
 0040E84D    push        edx
 0040E84E    push        eax
 0040E84F    call        user32.SendMessageW
 0040E854    pop         ebx
 0040E855    pop         ebp
 0040E856    ret         8
*}
end;

//0040E85C
function SendGetIntMessage(Handle:HWND; Msg:UINT; var WParam:Integer; var LParam:Integer):LRESULT;
begin
{*
 0040E85C    push        ebp
 0040E85D    mov         ebp,esp
 0040E85F    push        ebx
 0040E860    mov         ebx,dword ptr [ebp+8]
 0040E863    push        ebx
 0040E864    push        ecx
 0040E865    push        edx
 0040E866    push        eax
 0040E867    call        user32.SendMessageW
 0040E86C    pop         ebx
 0040E86D    pop         ebp
 0040E86E    ret         4
*}
end;

//0040EBE4
function CheckPSAPILoaded:Boolean;
begin
{*
 0040EBE4    push        ebx
 0040EBE5    mov         ebx,790C48
 0040EBEA    cmp         dword ptr [ebx],0
>0040EBED    jne         0040EDAA
 0040EBF3    push        40EDB0
 0040EBF8    call        kernel32.LoadLibraryW
 0040EBFD    mov         dword ptr [ebx],eax
 0040EBFF    cmp         dword ptr [ebx],20
>0040EC02    jae         0040EC0C
 0040EC04    xor         eax,eax
 0040EC06    mov         dword ptr [ebx],eax
 0040EC08    xor         eax,eax
 0040EC0A    pop         ebx
 0040EC0B    ret
 0040EC0C    push        40EDC4
 0040EC11    mov         eax,dword ptr [ebx]
 0040EC13    push        eax
 0040EC14    call        GetProcAddress
 0040EC19    mov         [00790C4C],eax
 0040EC1E    push        40EDE0
 0040EC23    mov         eax,dword ptr [ebx]
 0040EC25    push        eax
 0040EC26    call        GetProcAddress
 0040EC2B    mov         [00790C50],eax
 0040EC30    push        40EE08
 0040EC35    mov         eax,dword ptr [ebx]
 0040EC37    push        eax
 0040EC38    call        GetProcAddress
 0040EC3D    mov         [00790C54],eax
 0040EC42    push        40EE30
 0040EC47    mov         eax,dword ptr [ebx]
 0040EC49    push        eax
 0040EC4A    call        GetProcAddress
 0040EC4F    mov         [00790C58],eax
 0040EC54    push        40EE5C
 0040EC59    mov         eax,dword ptr [ebx]
 0040EC5B    push        eax
 0040EC5C    call        GetProcAddress
 0040EC61    mov         [00790C5C],eax
 0040EC66    push        40EE84
 0040EC6B    mov         eax,dword ptr [ebx]
 0040EC6D    push        eax
 0040EC6E    call        GetProcAddress
 0040EC73    mov         [00790C60],eax
 0040EC78    push        40EE08
 0040EC7D    mov         eax,dword ptr [ebx]
 0040EC7F    push        eax
 0040EC80    call        GetProcAddress
 0040EC85    mov         [00790C64],eax
 0040EC8A    push        40EE30
 0040EC8F    mov         eax,dword ptr [ebx]
 0040EC91    push        eax
 0040EC92    call        GetProcAddress
 0040EC97    mov         [00790C68],eax
 0040EC9C    push        40EEB0
 0040ECA1    mov         eax,dword ptr [ebx]
 0040ECA3    push        eax
 0040ECA4    call        GetProcAddress
 0040ECA9    mov         [00790C6C],eax
 0040ECAE    push        40EEDC
 0040ECB3    mov         eax,dword ptr [ebx]
 0040ECB5    push        eax
 0040ECB6    call        GetProcAddress
 0040ECBB    mov         [00790C70],eax
 0040ECC0    push        40EEFC
 0040ECC5    mov         eax,dword ptr [ebx]
 0040ECC7    push        eax
 0040ECC8    call        GetProcAddress
 0040ECCD    mov         [00790C74],eax
 0040ECD2    push        40EF1C
 0040ECD7    mov         eax,dword ptr [ebx]
 0040ECD9    push        eax
 0040ECDA    call        GetProcAddress
 0040ECDF    mov         [00790C78],eax
 0040ECE4    push        40EF54
 0040ECE9    mov         eax,dword ptr [ebx]
 0040ECEB    push        eax
 0040ECEC    call        GetProcAddress
 0040ECF1    mov         [00790C7C],eax
 0040ECF6    push        40EF7C
 0040ECFB    mov         eax,dword ptr [ebx]
 0040ECFD    push        eax
 0040ECFE    call        GetProcAddress
 0040ED03    mov         [00790C80],eax
 0040ED08    push        40EFB0
 0040ED0D    mov         eax,dword ptr [ebx]
 0040ED0F    push        eax
 0040ED10    call        GetProcAddress
 0040ED15    mov         [00790C84],eax
 0040ED1A    push        40EFE4
 0040ED1F    mov         eax,dword ptr [ebx]
 0040ED21    push        eax
 0040ED22    call        GetProcAddress
 0040ED27    mov         [00790C88],eax
 0040ED2C    push        40F00C
 0040ED31    mov         eax,dword ptr [ebx]
 0040ED33    push        eax
 0040ED34    call        GetProcAddress
 0040ED39    mov         [00790C8C],eax
 0040ED3E    push        40F040
 0040ED43    mov         eax,dword ptr [ebx]
 0040ED45    push        eax
 0040ED46    call        GetProcAddress
 0040ED4B    mov         [00790C90],eax
 0040ED50    push        40EF54
 0040ED55    mov         eax,dword ptr [ebx]
 0040ED57    push        eax
 0040ED58    call        GetProcAddress
 0040ED5D    mov         [00790C94],eax
 0040ED62    push        40EF7C
 0040ED67    mov         eax,dword ptr [ebx]
 0040ED69    push        eax
 0040ED6A    call        GetProcAddress
 0040ED6F    mov         [00790C98],eax
 0040ED74    push        40EFB0
 0040ED79    mov         eax,dword ptr [ebx]
 0040ED7B    push        eax
 0040ED7C    call        GetProcAddress
 0040ED81    mov         [00790C9C],eax
 0040ED86    push        40F074
 0040ED8B    mov         eax,dword ptr [ebx]
 0040ED8D    push        eax
 0040ED8E    call        GetProcAddress
 0040ED93    mov         [00790CA0],eax
 0040ED98    push        40F098
 0040ED9D    mov         eax,dword ptr [ebx]
 0040ED9F    push        eax
 0040EDA0    call        GetProcAddress
 0040EDA5    mov         [00790CA4],eax
 0040EDAA    mov         al,1
 0040EDAC    pop         ebx
 0040EDAD    ret
*}
end;

//0040F0C4
function GetMappedFileName(hProcess:THandle; lpv:Pointer; lpFilename:PWideChar; nSize:DWORD):DWORD;
begin
{*
 0040F0C4    push        ebp
 0040F0C5    mov         ebp,esp
 0040F0C7    push        ebx
 0040F0C8    push        esi
 0040F0C9    push        edi
 0040F0CA    mov         edi,ecx
 0040F0CC    mov         esi,edx
 0040F0CE    mov         ebx,eax
 0040F0D0    call        CheckPSAPILoaded
 0040F0D5    test        al,al
>0040F0D7    je          0040F0E8
 0040F0D9    mov         eax,dword ptr [ebp+8]
 0040F0DC    push        eax
 0040F0DD    push        edi
 0040F0DE    push        esi
 0040F0DF    push        ebx
 0040F0E0    call        dword ptr ds:[790C7C]
>0040F0E6    jmp         0040F0EA
 0040F0E8    xor         eax,eax
 0040F0EA    pop         edi
 0040F0EB    pop         esi
 0040F0EC    pop         ebx
 0040F0ED    pop         ebp
 0040F0EE    ret         4
*}
end;

//0040F30C
function TCharacter.CheckLetter:Boolean;
begin
{*
 0040F30C    add         al,0FB
 0040F30E    sub         al,5
>0040F310    jae         0040F315
 0040F312    mov         al,1
 0040F314    ret
 0040F315    xor         eax,eax
 0040F317    ret
*}
end;

//0040F318
function TCharacter.CheckLetterOrDigit:Boolean;
begin
{*
 0040F318    add         al,0FB
 0040F31A    sub         al,5
>0040F31C    jb          0040F322
 0040F31E    sub         al,3
>0040F320    jne         0040F325
 0040F322    mov         al,1
 0040F324    ret
 0040F325    xor         eax,eax
 0040F327    ret
*}
end;

//0040F328
function TCharacter.CheckSeparator:Boolean;
begin
{*
 0040F328    add         al,0E5
 0040F32A    sub         al,3
>0040F32C    jae         0040F331
 0040F32E    mov         al,1
 0040F330    ret
 0040F331    xor         eax,eax
 0040F333    ret
*}
end;

//0040F334
function TCharacter.IsLatin1:Boolean;
begin
{*
 0040F334    movzx       eax,ax
 0040F337    cmp         eax,0FF
 0040F33C    setle       al
 0040F33F    ret
*}
end;

//0040F340
function TCharacter.IsLetter:Boolean;
begin
{*
 0040F340    push        ebx
 0040F341    mov         ebx,eax
 0040F343    mov         eax,ebx
 0040F345    call        TCharacter.IsLatin1
 0040F34A    test        al,al
>0040F34C    jne         0040F397
 0040F34E    cmp         dword ptr ds:[790CB4],0
>0040F355    jne         0040F35C
 0040F357    call        TCharacter.Initialize
 0040F35C    movzx       eax,bx
 0040F35F    mov         edx,eax
 0040F361    shr         edx,8
 0040F364    mov         ecx,dword ptr ds:[790CAC]
 0040F36A    movzx       edx,word ptr [ecx+edx*2]
 0040F36E    mov         ecx,eax
 0040F370    shr         ecx,4
 0040F373    and         ecx,0F
 0040F376    add         edx,ecx
 0040F378    mov         ecx,dword ptr ds:[790CB0]
 0040F37E    movzx       edx,word ptr [ecx+edx*2]
 0040F382    and         eax,0F
 0040F385    add         edx,eax
 0040F387    mov         eax,[00790CB4]
 0040F38C    movzx       eax,byte ptr [eax+edx]
 0040F390    call        TCharacter.CheckLetter
 0040F395    pop         ebx
 0040F396    ret
 0040F397    mov         eax,ebx
 0040F399    call        TCharacter.IsAscii
 0040F39E    test        al,al
>0040F3A0    jne         0040F3B3
 0040F3A2    movzx       eax,bl
 0040F3A5    movzx       eax,byte ptr [eax+784A58]
 0040F3AC    call        TCharacter.CheckLetter
>0040F3B1    jmp         0040F3C9
 0040F3B3    or          bx,20
 0040F3B7    cmp         bx,61
>0040F3BB    jb          0040F3C3
 0040F3BD    cmp         bx,7A
>0040F3C1    jbe         0040F3C7
 0040F3C3    xor         eax,eax
>0040F3C5    jmp         0040F3C9
 0040F3C7    mov         al,1
 0040F3C9    pop         ebx
 0040F3CA    ret
*}
end;

//0040F3CC
function TCharacter.IsLetterOrDigit:Boolean;
begin
{*
 0040F3CC    push        ebx
 0040F3CD    mov         ebx,eax
 0040F3CF    mov         eax,ebx
 0040F3D1    call        TCharacter.IsLatin1
 0040F3D6    test        al,al
>0040F3D8    je          0040F3EB
 0040F3DA    movzx       eax,bl
 0040F3DD    movzx       eax,byte ptr [eax+784A58]
 0040F3E4    call        TCharacter.CheckLetterOrDigit
 0040F3E9    pop         ebx
 0040F3EA    ret
 0040F3EB    cmp         dword ptr ds:[790CB4],0
>0040F3F2    jne         0040F3F9
 0040F3F4    call        TCharacter.Initialize
 0040F3F9    movzx       eax,bx
 0040F3FC    mov         edx,eax
 0040F3FE    shr         edx,8
 0040F401    mov         ecx,dword ptr ds:[790CAC]
 0040F407    movzx       edx,word ptr [ecx+edx*2]
 0040F40B    mov         ecx,eax
 0040F40D    shr         ecx,4
 0040F410    and         ecx,0F
 0040F413    add         edx,ecx
 0040F415    mov         ecx,dword ptr ds:[790CB0]
 0040F41B    movzx       edx,word ptr [ecx+edx*2]
 0040F41F    and         eax,0F
 0040F422    add         edx,eax
 0040F424    mov         eax,[00790CB4]
 0040F429    movzx       eax,byte ptr [eax+edx]
 0040F42D    call        TCharacter.CheckLetterOrDigit
 0040F432    pop         ebx
 0040F433    ret
*}
end;

//0040F434
function TCharacter.IsAscii:Boolean;
begin
{*
 0040F434    movzx       eax,ax
 0040F437    cmp         eax,7F
 0040F43A    setle       al
 0040F43D    ret
*}
end;

//0040F440
function TCharacter.IsDigit:Boolean;
begin
{*
 0040F440    push        ebx
 0040F441    mov         ebx,eax
 0040F443    mov         eax,ebx
 0040F445    call        TCharacter.IsLatin1
 0040F44A    test        al,al
>0040F44C    jne         0040F497
 0040F44E    cmp         dword ptr ds:[790CB4],0
>0040F455    jne         0040F45C
 0040F457    call        TCharacter.Initialize
 0040F45C    movzx       eax,bx
 0040F45F    mov         edx,eax
 0040F461    shr         edx,8
 0040F464    mov         ecx,dword ptr ds:[790CAC]
 0040F46A    movzx       edx,word ptr [ecx+edx*2]
 0040F46E    mov         ecx,eax
 0040F470    shr         ecx,4
 0040F473    and         ecx,0F
 0040F476    add         edx,ecx
 0040F478    mov         ecx,dword ptr ds:[790CB0]
 0040F47E    movzx       edx,word ptr [ecx+edx*2]
 0040F482    and         eax,0F
 0040F485    add         edx,eax
 0040F487    mov         eax,[00790CB4]
 0040F48C    movzx       eax,byte ptr [eax+edx]
 0040F490    cmp         al,0D
 0040F492    sete        al
 0040F495    pop         ebx
 0040F496    ret
 0040F497    cmp         bx,30
>0040F49B    jb          0040F4A3
 0040F49D    cmp         bx,39
>0040F4A1    jbe         0040F4A7
 0040F4A3    xor         eax,eax
>0040F4A5    jmp         0040F4A9
 0040F4A7    mov         al,1
 0040F4A9    pop         ebx
 0040F4AA    ret
*}
end;

//0040F4AC
function TCharacter.GetUnicodeCategory:TUnicodeCategory;
begin
{*
 0040F4AC    push        ebx
 0040F4AD    mov         ebx,eax
 0040F4AF    mov         eax,ebx
 0040F4B1    call        TCharacter.IsLatin1
 0040F4B6    test        al,al
>0040F4B8    je          0040F4C6
 0040F4BA    movzx       eax,bl
 0040F4BD    movzx       eax,byte ptr [eax+784A58]
 0040F4C4    pop         ebx
 0040F4C5    ret
 0040F4C6    cmp         dword ptr ds:[790CB4],0
>0040F4CD    jne         0040F4D4
 0040F4CF    call        TCharacter.Initialize
 0040F4D4    movzx       eax,bx
 0040F4D7    mov         edx,eax
 0040F4D9    shr         edx,8
 0040F4DC    mov         ecx,dword ptr ds:[790CAC]
 0040F4E2    movzx       edx,word ptr [ecx+edx*2]
 0040F4E6    mov         ecx,eax
 0040F4E8    shr         ecx,4
 0040F4EB    and         ecx,0F
 0040F4EE    add         edx,ecx
 0040F4F0    mov         ecx,dword ptr ds:[790CB0]
 0040F4F6    movzx       edx,word ptr [ecx+edx*2]
 0040F4FA    and         eax,0F
 0040F4FD    add         edx,eax
 0040F4FF    mov         eax,[00790CB4]
 0040F504    movzx       eax,byte ptr [eax+edx]
 0040F508    pop         ebx
 0040F509    ret
*}
end;

//0040F50C
procedure bin_data;
begin
{*
 0040F50C    sbb         byte ptr [eax],al
 0040F50E    add         byte ptr [eax],al
 0040F510    sbb         byte ptr [edx],ah
 0040F512    add         byte ptr [eax],al
 0040F514    cwde
 0040F515    add         byte ptr cs:[eax],al
 0040F518    cwde
 0040F519    dec         eax
 0040F51A    add         byte ptr [eax],al
 0040F51C    cwde
 0040F51D    push        0
 0040F51F    add         byte ptr [eax],bh
>0040F521    jo          0040F523
 0040F523    add         byte ptr [eax],al
 0040F525    add         byte ptr [eax],dl
 0040F527    add         byte ptr [eax],ah
 0040F529    add         byte ptr [eax],dh
 0040F52B    add         byte ptr [eax],al
 0040F52E    push        eax
 0040F52F    add         byte ptr [eax],ah
>0040F532    jo          0040F534
 0040F534    add         byte ptr [eax],90
 0040F537    add         byte ptr [eax-3FFF5000],ah
 0040F53D    add         al,dl
 0040F53F    add         al,ah
 0040F541    add         al,dh
 0040F543    add         byte ptr [eax],al
 0040F545    add         dword ptr [eax],edx
 0040F547    add         dword ptr [eax],esp
 0040F549    add         dword ptr [eax],esi
 0040F54B    add         dword ptr [eax+1],eax
 0040F54E    adc         byte ptr [ecx],al
 0040F550    push        eax
 0040F551    add         dword ptr [eax+1],esp
>0040F554    jo          0040F557
 0040F556    add         byte ptr [ecx],90
 0040F559    add         dword ptr [eax-3FFE4FFF],esp
 0040F55F    add         eax,edx
 0040F561    add         eax,esp
 0040F563    add         eax,esi
 0040F565    add         dword ptr [eax],eax
 0040F567    add         dl,byte ptr [eax]
 0040F569    add         ah,byte ptr [eax]
 0040F56B    add         dh,byte ptr [eax]
 0040F56D    add         al,byte ptr [eax+2]
 0040F570    push        eax
 0040F571    add         ah,byte ptr [eax+2]
>0040F574    jo          0040F578
 0040F576    add         byte ptr [edx],10
 0040F579    add         dl,byte ptr [eax-4FFD5FFE]
 0040F57F    add         al,al
 0040F581    add         dl,al
 0040F583    add         ah,al
 0040F585    add         dh,al
 0040F587    add         al,byte ptr [eax]
 0040F589    add         esi,dword ptr [eax+2]
 0040F58C    adc         byte ptr [ecx],al
 0040F58E    adc         byte ptr [ecx],al
 0040F590    adc         byte ptr [ecx],al
 0040F592    adc         byte ptr [ecx],al
 0040F594    adc         byte ptr [ecx],al
 0040F596    adc         byte ptr [ecx],al
 0040F598    adc         byte ptr [ecx],al
 0040F59A    adc         byte ptr [ecx],al
 0040F59C    adc         byte ptr [ecx],al
 0040F59E    adc         byte ptr [ecx],al
 0040F5A0    adc         byte ptr [ecx],al
 0040F5A2    adc         byte ptr [ecx],al
 0040F5A4    adc         byte ptr [ecx],al
 0040F5A6    adc         byte ptr [ecx],al
 0040F5A8    adc         byte ptr [ecx],al
 0040F5AA    adc         byte ptr [ecx],al
 0040F5AC    adc         byte ptr [ecx],al
 0040F5AE    adc         byte ptr [ecx],al
 0040F5B0    adc         byte ptr [ecx],al
 0040F5B2    adc         byte ptr [ecx],al
 0040F5B4    adc         byte ptr [ecx],al
 0040F5B6    adc         byte ptr [ecx],al
 0040F5B8    adc         byte ptr [ecx],al
 0040F5BA    adc         byte ptr [ecx],al
 0040F5BC    adc         byte ptr [ecx],al
 0040F5BE    adc         byte ptr [ebx],al
 0040F5C0    adc         byte ptr [ecx],al
 0040F5C2    adc         byte ptr [ecx],al
 0040F5C4    adc         byte ptr [ecx],al
 0040F5C6    adc         byte ptr [ecx],al
 0040F5C8    adc         byte ptr [ecx],al
 0040F5CA    adc         byte ptr [ecx],al
 0040F5CC    adc         byte ptr [ecx],al
 0040F5CE    adc         byte ptr [ecx],al
 0040F5D0    adc         byte ptr [ecx],al
 0040F5D2    adc         byte ptr [ecx],al
 0040F5D4    adc         byte ptr [ecx],al
 0040F5D6    adc         byte ptr [ecx],al
 0040F5D8    adc         byte ptr [ecx],al
 0040F5DA    adc         byte ptr [ecx],al
 0040F5DC    adc         byte ptr [ecx],al
 0040F5DE    adc         byte ptr [ecx],al
 0040F5E0    adc         byte ptr [ecx],al
 0040F5E2    adc         byte ptr [ecx],al
 0040F5E4    adc         byte ptr [ecx],al
 0040F5E6    adc         byte ptr [ecx],al
 0040F5E8    adc         byte ptr [ecx],al
 0040F5EA    adc         byte ptr [ecx],al
 0040F5EC    adc         byte ptr [ecx],al
 0040F5EE    adc         byte ptr [ecx],al
 0040F5F0    adc         byte ptr [ecx],al
 0040F5F2    adc         byte ptr [ecx],al
 0040F5F4    adc         byte ptr [ecx],al
 0040F5F6    adc         byte ptr [ecx],al
 0040F5F8    adc         byte ptr [ecx],al
 0040F5FA    adc         byte ptr [ecx],al
 0040F5FC    adc         byte ptr [ecx],al
 0040F5FE    adc         byte ptr [ecx],al
 0040F600    adc         byte ptr [ecx],al
 0040F602    adc         byte ptr [ecx],al
 0040F604    adc         byte ptr [ecx],al
 0040F606    adc         byte ptr [ecx],al
 0040F608    adc         byte ptr [ecx],al
 0040F60A    adc         byte ptr [ecx],al
 0040F60C    adc         byte ptr [ecx],al
 0040F60E    adc         byte ptr [ecx],al
 0040F610    adc         byte ptr [ecx],al
 0040F612    adc         byte ptr [ecx],al
 0040F614    adc         byte ptr [ecx],al
 0040F616    adc         byte ptr [ecx],al
 0040F618    adc         byte ptr [ecx],al
 0040F61A    adc         byte ptr [ecx],al
 0040F61C    adc         byte ptr [ecx],al
 0040F61E    adc         byte ptr [ecx],al
 0040F620    adc         byte ptr [ecx],al
 0040F622    adc         byte ptr [ecx],al
 0040F624    adc         byte ptr [ecx],al
 0040F626    adc         byte ptr [ecx],al
 0040F628    adc         byte ptr [ecx],al
 0040F62A    adc         byte ptr [ecx],al
 0040F62C    adc         byte ptr [ecx],al
 0040F62E    adc         byte ptr [ecx],al
 0040F630    adc         byte ptr [ecx],al
 0040F632    adc         byte ptr [ecx],al
 0040F634    adc         byte ptr [ecx],al
 0040F636    adc         byte ptr [ecx],al
 0040F638    adc         byte ptr [ecx],al
 0040F63A    adc         byte ptr [ecx],al
 0040F63C    adc         byte ptr [ecx],al
 0040F63E    adc         byte ptr [ecx],al
 0040F640    adc         byte ptr [ecx],al
 0040F642    adc         byte ptr [ecx],al
 0040F644    adc         byte ptr [ecx],al
 0040F646    adc         byte ptr [ecx],al
 0040F648    adc         byte ptr [ecx],al
 0040F64A    adc         byte ptr [ecx],al
 0040F64C    adc         byte ptr [ecx],al
 0040F64E    adc         byte ptr [ecx],al
 0040F650    adc         byte ptr [ecx],al
 0040F652    adc         byte ptr [ecx],al
 0040F654    adc         byte ptr [ecx],al
 0040F656    adc         byte ptr [ecx],al
 0040F658    adc         byte ptr [ecx],al
 0040F65A    adc         byte ptr [ecx],al
 0040F65C    adc         byte ptr [ecx],al
 0040F65E    adc         byte ptr [ecx],al
 0040F660    adc         byte ptr [ecx],al
 0040F662    and         byte ptr [ebx],al
 0040F664    xor         byte ptr [ebx],al
 0040F666    adc         byte ptr [ecx],al
 0040F668    adc         byte ptr [ecx],al
 0040F66A    adc         byte ptr [ecx],al
 0040F66C    inc         eax
 0040F66D    add         edx,dword ptr [eax]
 0040F66F    add         dword ptr [eax+3],edx
 0040F672    pushad
 0040F673    add         esi,dword ptr [eax+3]
 0040F676    add         byte ptr [ebx],90
 0040F679    add         esp,dword ptr [eax+10011003]
 0040F67F    add         dword ptr [eax],edx
 0040F681    add         dword ptr [eax],edx
 0040F683    add         dword ptr [eax],edx
 0040F685    add         dword ptr [eax],edx
 0040F687    add         dword ptr [eax],edx
 0040F689    add         dword ptr [eax],edx
 0040F68B    add         dword ptr [eax],edx
 0040F68D    add         dword ptr [eax],edx
 0040F68F    add         dword ptr [eax],edx
 0040F691    add         dword ptr [eax],edx
 0040F693    add         dword ptr [eax],edx
 0040F695    add         dword ptr [eax],edx
 0040F697    add         dword ptr [eax],edx
 0040F699    add         dword ptr [eax],edx
 0040F69B    add         dword ptr [eax],edx
 0040F69D    add         dword ptr [eax],edx
 0040F69F    add         dword ptr [eax],edx
 0040F6A1    add         dword ptr [eax],edx
 0040F6A3    add         dword ptr [eax],edx
 0040F6A5    add         dword ptr [eax],edx
 0040F6A7    add         dword ptr [eax],edx
 0040F6A9    add         dword ptr [eax],edx
 0040F6AB    add         dword ptr [eax],edx
 0040F6AD    add         dword ptr [eax],edx
 0040F6AF    add         dword ptr [eax],edx
 0040F6B1    add         dword ptr [eax],edx
 0040F6B3    add         dword ptr [eax],edx
 0040F6B5    add         dword ptr [eax],edx
 0040F6B7    add         dword ptr [eax],edx
 0040F6B9    add         dword ptr [eax],edx
 0040F6BB    add         dword ptr [eax],edx
 0040F6BD    add         dword ptr [eax],edx
 0040F6BF    add         dword ptr [eax],edx
 0040F6C1    add         dword ptr [eax],edx
 0040F6C3    add         dword ptr [eax],edx
 0040F6C5    add         dword ptr [eax],edx
 0040F6C7    add         dword ptr [eax],edx
 0040F6C9    add         dword ptr [eax],edx
 0040F6CB    add         dword ptr [eax],edx
 0040F6CD    add         dword ptr [eax],edx
 0040F6CF    add         dword ptr [eax],edx
 0040F6D1    add         dword ptr [eax-3FFC3FFD],esi
 0040F6D7    add         eax,eax
 0040F6D9    add         eax,eax
 0040F6DB    add         eax,eax
 0040F6DD    add         eax,eax
 0040F6DF    add         eax,eax
 0040F6E1    add         eax,eax
 0040F6E3    add         edx,eax
 0040F6E5    add         edx,eax
 0040F6E7    add         edx,eax
 0040F6E9    add         edx,eax
 0040F6EB    add         edx,eax
 0040F6ED    add         edx,eax
 0040F6EF    add         edx,eax
 0040F6F1    add         edx,eax
 0040F6F3    add         edx,eax
 0040F6F5    add         edx,eax
 0040F6F7    add         edx,eax
 0040F6F9    add         edx,eax
 0040F6FB    add         edx,eax
 0040F6FD    add         edx,eax
 0040F6FF    add         edx,eax
 0040F701    add         edx,eax
 0040F703    add         edx,eax
 0040F705    add         edx,eax
 0040F707    add         edx,eax
 0040F709    add         edx,eax
 0040F70B    add         edx,eax
 0040F70D    add         edx,eax
 0040F70F    add         edx,eax
 0040F711    add         edx,eax
 0040F713    add         edx,eax
 0040F715    add         edx,dword ptr [eax]
 0040F717    add         eax,esp
 0040F719    add         esi,eax
 0040F71B    add         edx,dword ptr [eax]
 0040F71D    add         dword ptr [eax],eax
 0040F71F    add         al,10
 0040F721    add         al,20
 0040F723    add         al,30
 0040F725    add         al,40
 0040F727    add         al,50
 0040F729    add         al,60
 0040F72B    add         al,70
 0040F72D    add         al,80
 0040F72F    add         al,80
 0040F731    add         al,80
 0040F733    add         al,90
 0040F735    add         al,0A0
 0040F737    add         al,0B0
 0040F739    add         al,0C0
 0040F73B    add         al,0D0
 0040F73D    add         al,80
 0040F73F    add         al,0E0
 0040F741    add         al,80
 0040F743    add         al,0F0
 0040F745    add         al,80
 0040F747    add         al,80
 0040F749    add         al,80
 0040F74B    add         al,80
 0040F74D    add         al,80
 0040F74F    add         al,80
 0040F751    add         al,80
 0040F753    add         al,80
 0040F755    add         al,80
 0040F757    add         al,80
 0040F759    add         al,80
 0040F75B    add         al,80
 0040F75D    add         al,80
 0040F75F    add         al,80
 0040F761    add         al,80
 0040F763    add         al,10
 0040F765    add         dword ptr [eax],edx
 0040F767    add         dword ptr [eax],edx
 0040F769    add         dword ptr [eax],eax
 0040F76B    add         eax,4800510
 0040F770    add         byte ptr [eax+eax*4],4
 0040F774    add         byte ptr [eax+eax*4],4
 0040F778    add         byte ptr [eax+eax*4],4
 0040F77C    add         byte ptr [eax+eax*4],4
 0040F780    add         byte ptr [eax+eax*4],4
 0040F784    adc         byte ptr [ecx],al
 0040F786    adc         byte ptr [ecx],al
 0040F788    adc         byte ptr [ecx],al
 0040F78A    adc         byte ptr [ecx],al
 0040F78C    and         byte ptr ds:[4800480],al
 0040F792    add         byte ptr [eax+eax*4],4
 0040F796    add         byte ptr [eax+eax*4],4
 0040F79A    add         byte ptr [eax+eax*4],4
 0040F79E    add         byte ptr [eax+eax*4],4
 0040F7A2    add         byte ptr [eax+eax*4],4
 0040F7A6    add         byte ptr [eax+eax*4],4
 0040F7AA    add         byte ptr [eax+eax*4],4
 0040F7AE    add         byte ptr [eax+eax*4],4
 0040F7B2    add         byte ptr [eax+eax*4],4
 0040F7B6    add         byte ptr [eax+eax*4],4
 0040F7BA    add         byte ptr [eax+eax*4],4
 0040F7BE    add         byte ptr [eax+eax*4],4
 0040F7C2    add         byte ptr [eax+eax*4],4
 0040F7C6    add         byte ptr [eax+eax*4],4
 0040F7CA    add         byte ptr [eax+eax*4],4
 0040F7CE    add         byte ptr [eax+eax*4],4
 0040F7D2    add         byte ptr [eax+eax*4],4
 0040F7D6    add         byte ptr [eax+eax*4],4
 0040F7DA    add         byte ptr [eax+eax*4],4
 0040F7DE    add         byte ptr [eax+eax*4],4
 0040F7E2    add         byte ptr [eax+eax*4],4
 0040F7E6    add         byte ptr [eax+eax*4],4
 0040F7EA    add         byte ptr [eax+eax*4],4
 0040F7EE    add         byte ptr [eax+eax*4],4
 0040F7F2    add         byte ptr [eax+eax*4],4
 0040F7F6    add         byte ptr [eax+eax*4],4
 0040F7FA    add         byte ptr [eax+eax*4],4
 0040F7FE    add         byte ptr [eax+eax*4],4
 0040F802    add         byte ptr [eax+eax*4],4
 0040F806    add         byte ptr [eax+eax*4],4
 0040F80A    add         byte ptr [eax+eax*4],4
 0040F80E    add         byte ptr [eax+eax*4],4
 0040F812    add         byte ptr [eax+eax*4],4
 0040F816    add         byte ptr [eax+eax*4],4
 0040F81A    add         byte ptr [eax+eax*4],4
 0040F81E    add         byte ptr [eax+eax*4],4
 0040F822    add         byte ptr [eax+eax*4],4
 0040F826    add         byte ptr [eax+eax*4],4
 0040F82A    add         byte ptr [eax+eax*4],4
 0040F82E    add         byte ptr [eax+eax*4],4
 0040F832    add         byte ptr [eax+eax*4],4
 0040F836    add         byte ptr [eax+eax*4],4
 0040F83A    add         byte ptr [eax+eax*4],4
 0040F83E    add         byte ptr [eax+eax*4],4
 0040F842    add         byte ptr [eax+eax*4],4
 0040F846    add         byte ptr [eax+eax*4],4
 0040F84A    add         byte ptr [eax+eax*4],4
 0040F84E    add         byte ptr [eax+eax*4],4
 0040F852    add         byte ptr [eax+eax*4],4
 0040F856    add         byte ptr [eax+eax*4],4
 0040F85A    add         byte ptr [eax+eax*4],4
 0040F85E    add         byte ptr [eax+eax*4],4
 0040F862    add         byte ptr [eax+eax*4],4
 0040F866    add         byte ptr [eax+eax*4],4
 0040F86A    add         byte ptr [eax+eax*4],4
 0040F86E    add         byte ptr [eax+eax*4],4
 0040F872    add         byte ptr [eax+eax*4],4
 0040F876    add         byte ptr [eax+eax*4],4
 0040F87A    add         byte ptr [eax+eax*4],4
 0040F87E    add         byte ptr [eax+eax*4],4
 0040F882    add         byte ptr [eax+eax*4],4
 0040F886    add         byte ptr [eax+eax*4],4
 0040F88A    add         byte ptr [eax+eax*4],4
 0040F88E    add         byte ptr [eax+eax*4],4
 0040F892    add         byte ptr [eax+eax*4],4
 0040F896    add         byte ptr [eax+eax*4],4
 0040F89A    add         byte ptr [eax+eax*4],4
 0040F89E    add         byte ptr [eax+eax*4],4
 0040F8A2    add         byte ptr [eax+eax*4],4
 0040F8A6    add         byte ptr [eax+eax*4],4
 0040F8AA    add         byte ptr [eax+eax*4],4
 0040F8AE    add         byte ptr [eax+eax*4],4
 0040F8B2    add         byte ptr [eax+eax*4],4
 0040F8B6    add         byte ptr [eax+eax*4],4
 0040F8BA    add         byte ptr [eax+eax*4],4
 0040F8BE    add         byte ptr [eax+eax*4],4
 0040F8C2    add         byte ptr [eax+esi],5
 0040F8C6    inc         eax
 0040F8C7    add         eax,5600550
>0040F8CC    jo          0040F8D3
 0040F8CE    add         byte ptr ds:[5A00590],80
 0040F8D5    add         al,80
 0040F8D7    add         al,80
 0040F8D9    add         al,80
 0040F8DB    add         al,80
 0040F8DD    add         al,80
 0040F8DF    add         al,80
 0040F8E1    add         al,80
 0040F8E3    add         al,80
 0040F8E5    add         al,80
 0040F8E7    add         al,80
 0040F8E9    add         al,80
 0040F8EB    add         al,80
 0040F8ED    add         al,80
 0040F8EF    add         al,80
 0040F8F1    add         al,80
 0040F8F3    add         al,80
 0040F8F5    add         al,80
 0040F8F7    add         al,80
 0040F8F9    add         al,80
 0040F8FB    add         al,80
 0040F8FD    add         al,80
 0040F8FF    add         al,80
 0040F901    add         al,80
 0040F903    add         al,0B0
 0040F905    add         eax,5D005C0
 0040F90A    add         byte ptr [eax+eax*4],4
 0040F90E    add         byte ptr [eax+eax*4],4
 0040F912    add         byte ptr [eax+eax*4],4
 0040F916    add         byte ptr [eax+eax*4],4
 0040F91A    add         byte ptr [eax+eax*4],4
 0040F91E    add         byte ptr [eax+eax*4],4
 0040F922    add         byte ptr [eax+edx],1
 0040F926    adc         byte ptr [ecx],al
 0040F928    adc         byte ptr [ecx],al
 0040F92A    adc         byte ptr [ecx],al
 0040F92C    adc         byte ptr [ecx],al
 0040F92E    adc         byte ptr [ecx],al
 0040F930    adc         byte ptr [ecx],al
 0040F932    adc         byte ptr [ecx],al
 0040F934    adc         byte ptr [ecx],al
 0040F936    adc         byte ptr [ecx],al
 0040F938    adc         byte ptr [ecx],al
 0040F93A    adc         byte ptr [ecx],al
 0040F93C    adc         byte ptr [ecx],al
 0040F93E    adc         byte ptr [ecx],al
 0040F940    adc         byte ptr [ecx],al
 0040F942    adc         byte ptr [ecx],al
 0040F944    adc         byte ptr [ecx],al
 0040F946    adc         byte ptr [ecx],al
 0040F948    adc         byte ptr [ecx],al
 0040F94A    adc         byte ptr [ecx],al
 0040F94C    adc         byte ptr [ecx],al
 0040F94E    adc         byte ptr [ecx],al
 0040F950    adc         byte ptr [ecx],al
 0040F952    adc         byte ptr [ecx],al
 0040F954    adc         byte ptr [ecx],al
 0040F956    adc         byte ptr [ecx],al
 0040F958    adc         byte ptr [ecx],al
 0040F95A    adc         byte ptr [ecx],al
 0040F95C    adc         byte ptr [ecx],al
 0040F95E    adc         byte ptr [ecx],al
 0040F960    adc         byte ptr [ecx],al
 0040F962    adc         byte ptr [ecx],al
 0040F964    adc         byte ptr [ecx],al
 0040F966    adc         byte ptr [ecx],al
 0040F968    adc         byte ptr [ecx],al
 0040F96A    adc         byte ptr [ecx],al
 0040F96C    adc         byte ptr [ecx],al
 0040F96E    adc         byte ptr [ecx],al
 0040F970    adc         byte ptr [ecx],al
 0040F972    adc         byte ptr [ecx],al
 0040F974    adc         byte ptr [ecx],al
 0040F976    adc         byte ptr [ecx],al
 0040F978    adc         byte ptr [ecx],al
 0040F97A    adc         byte ptr [ecx],al
 0040F97C    adc         byte ptr [ecx],al
 0040F97E    adc         byte ptr [ecx],al
 0040F980    adc         byte ptr [ecx],al
 0040F982    adc         byte ptr [ecx],al
 0040F984    adc         byte ptr [ecx],al
 0040F986    adc         byte ptr [ecx],al
 0040F988    adc         byte ptr [ecx],al
 0040F98A    adc         byte ptr [ecx],al
 0040F98C    adc         byte ptr [ecx],al
 0040F98E    adc         byte ptr [ecx],al
 0040F990    adc         byte ptr [ecx],al
 0040F992    adc         byte ptr [ecx],al
 0040F994    adc         byte ptr [ecx],al
 0040F996    adc         byte ptr [ecx],al
 0040F998    adc         byte ptr [ecx],al
 0040F99A    adc         byte ptr [ecx],al
 0040F99C    adc         byte ptr [ecx],al
 0040F99E    adc         byte ptr [ecx],al
 0040F9A0    adc         byte ptr [ecx],al
 0040F9A2    adc         byte ptr [ecx],al
 0040F9A4    adc         byte ptr [ecx],al
 0040F9A6    adc         byte ptr [ecx],al
 0040F9A8    adc         byte ptr [ecx],al
 0040F9AA    adc         byte ptr [ecx],al
 0040F9AC    adc         byte ptr [ecx],al
 0040F9AE    adc         byte ptr [ecx],al
 0040F9B0    adc         byte ptr [ecx],al
 0040F9B2    adc         byte ptr [ecx],al
 0040F9B4    adc         byte ptr [ecx],al
 0040F9B6    adc         byte ptr [ecx],al
 0040F9B8    adc         byte ptr [ecx],al
 0040F9BA    adc         byte ptr [ecx],al
 0040F9BC    adc         byte ptr [ecx],al
 0040F9BE    adc         byte ptr [ecx],al
 0040F9C0    adc         byte ptr [ecx],al
 0040F9C2    adc         byte ptr [ecx],al
 0040F9C4    adc         byte ptr [ecx],al
 0040F9C6    adc         byte ptr [ecx],al
 0040F9C8    adc         byte ptr [ecx],al
 0040F9CA    adc         byte ptr [ecx],al
 0040F9CC    adc         byte ptr [ecx],al
 0040F9CE    adc         byte ptr [ecx],al
 0040F9D0    adc         byte ptr [ecx],al
 0040F9D2    adc         byte ptr [ecx],al
 0040F9D4    adc         byte ptr [ecx],al
 0040F9D6    adc         byte ptr [ecx],al
 0040F9D8    adc         byte ptr [ecx],al
 0040F9DA    adc         byte ptr [ecx],al
 0040F9DC    adc         byte ptr [ecx],al
 0040F9DE    adc         byte ptr [ecx],al
 0040F9E0    adc         byte ptr [ecx],al
 0040F9E2    adc         byte ptr [ecx],al
 0040F9E4    adc         byte ptr [ecx],al
 0040F9E6    adc         byte ptr [ecx],al
 0040F9E8    adc         byte ptr [ecx],al
 0040F9EA    adc         byte ptr [ecx],al
 0040F9EC    adc         byte ptr [ecx],al
 0040F9EE    adc         byte ptr [ecx],al
 0040F9F0    adc         byte ptr [ecx],al
 0040F9F2    adc         byte ptr [ecx],al
 0040F9F4    adc         byte ptr [ecx],al
 0040F9F6    adc         byte ptr [ecx],al
 0040F9F8    adc         byte ptr [ecx],al
 0040F9FA    adc         byte ptr [ecx],al
 0040F9FC    adc         byte ptr [ecx],al
 0040F9FE    adc         byte ptr [ecx],al
 0040FA00    adc         byte ptr [ecx],al
 0040FA02    adc         byte ptr [ecx],al
 0040FA04    adc         byte ptr [ecx],al
 0040FA06    adc         byte ptr [ecx],al
 0040FA08    adc         byte ptr [ecx],al
 0040FA0A    adc         byte ptr [ecx],al
 0040FA0C    adc         byte ptr [ecx],al
 0040FA0E    adc         byte ptr [ecx],al
 0040FA10    adc         byte ptr [ecx],al
 0040FA12    adc         byte ptr [ecx],al
 0040FA14    adc         byte ptr [ecx],al
 0040FA16    adc         byte ptr [ecx],al
 0040FA18    adc         byte ptr [ecx],al
 0040FA1A    adc         byte ptr [ecx],al
 0040FA1C    adc         byte ptr [ecx],al
 0040FA1E    adc         byte ptr [ecx],al
 0040FA20    adc         byte ptr [ecx],al
 0040FA22    adc         byte ptr [ecx],al
 0040FA24    adc         byte ptr [ecx],al
 0040FA26    adc         byte ptr [ecx],al
 0040FA28    adc         byte ptr [ecx],al
 0040FA2A    adc         byte ptr [ecx],al
 0040FA2C    adc         byte ptr [ecx],al
 0040FA2E    adc         byte ptr [ecx],al
 0040FA30    adc         byte ptr [ecx],al
 0040FA32    adc         byte ptr [ecx],al
 0040FA34    adc         byte ptr [ecx],al
 0040FA36    adc         byte ptr [ecx],al
 0040FA38    adc         byte ptr [ecx],al
 0040FA3A    adc         byte ptr [ecx],al
 0040FA3C    adc         byte ptr [ecx],al
 0040FA3E    adc         byte ptr [ecx],al
 0040FA40    adc         byte ptr [ecx],al
 0040FA42    adc         byte ptr [ecx],al
 0040FA44    adc         byte ptr [ecx],al
 0040FA46    adc         byte ptr [ecx],al
 0040FA48    adc         byte ptr [ecx],al
 0040FA4A    adc         byte ptr [ecx],al
 0040FA4C    adc         byte ptr [ecx],al
 0040FA4E    adc         byte ptr [ecx],al
 0040FA50    adc         byte ptr [ecx],al
 0040FA52    adc         byte ptr [ecx],al
 0040FA54    adc         byte ptr [ecx],al
 0040FA56    adc         byte ptr [ecx],al
 0040FA58    adc         byte ptr [ecx],al
 0040FA5A    adc         byte ptr [ecx],al
 0040FA5C    adc         byte ptr [ecx],al
 0040FA5E    adc         byte ptr [ecx],al
 0040FA60    adc         byte ptr [ecx],al
 0040FA62    adc         byte ptr [ecx],al
 0040FA64    adc         byte ptr [ecx],al
 0040FA66    adc         byte ptr [ecx],al
 0040FA68    adc         byte ptr [ecx],al
 0040FA6A    adc         byte ptr [ecx],al
 0040FA6C    adc         byte ptr [ecx],al
 0040FA6E    adc         byte ptr [ecx],al
 0040FA70    loopne      0040FA77
 0040FA72    adc         byte ptr [ecx],al
 0040FA74    adc         byte ptr [ecx],al
 0040FA76    adc         byte ptr [ecx],al
 0040FA78    adc         byte ptr [ecx],al
 0040FA7A    adc         byte ptr [ecx],al
 0040FA7C    adc         byte ptr [ecx],al
 0040FA7E    adc         byte ptr [ecx],al
 0040FA80    adc         byte ptr [ecx],al
 0040FA82    adc         byte ptr [ecx],al
 0040FA84    adc         byte ptr [ecx],al
 0040FA86    adc         byte ptr [ecx],al
 0040FA88    adc         byte ptr [ecx],al
 0040FA8A    adc         byte ptr [ecx],al
 0040FA8C    adc         byte ptr [ecx],al
 0040FA8E    adc         byte ptr [ecx],al
 0040FA90    adc         byte ptr [ecx],al
 0040FA92    lock add    eax,4800480
 0040FA98    add         byte ptr [eax+eax*4],4
 0040FA9C    add         byte ptr [eax+eax*4],4
 0040FAA0    add         byte ptr [eax+eax*4],4
 0040FAA4    add         byte ptr [eax+eax*4],4
 0040FAA8    add         byte ptr [eax+eax*4],4
 0040FAAC    add         byte ptr [eax+eax*4],4
 0040FAB0    add         byte ptr [eax+eax*4],4
 0040FAB4    add         byte ptr [eax+eax*4],4
 0040FAB8    add         byte ptr [eax+eax*4],4
 0040FABC    add         byte ptr [eax+eax*4],4
 0040FAC0    add         byte ptr [eax+eax*4],4
 0040FAC4    add         byte ptr [eax+eax*4],4
 0040FAC8    add         byte ptr [eax+eax*4],4
 0040FACC    add         byte ptr [eax+eax*4],4
 0040FAD0    add         byte ptr [eax+eax*4],4
 0040FAD4    add         byte ptr [eax+eax*4],4
 0040FAD8    add         byte ptr [eax+eax*4],4
 0040FADC    add         byte ptr [eax+eax*4],4
 0040FAE0    add         byte ptr [eax+eax*4],4
 0040FAE4    add         byte ptr [eax+eax*4],4
 0040FAE8    add         byte ptr [eax+eax*4],4
 0040FAEC    add         byte ptr [eax+eax*4],4
 0040FAF0    add         byte ptr [eax+eax*4],4
 0040FAF4    add         byte ptr [eax+eax*4],4
 0040FAF8    add         byte ptr [eax+eax*4],4
 0040FAFC    add         byte ptr [eax+eax*4],4
 0040FB00    add         byte ptr [eax+eax*4],4
 0040FB04    add         byte ptr [eax+eax*4],4
 0040FB08    add         byte ptr [eax+eax*4],4
 0040FB0C    add         byte ptr [eax+eax*4],4
 0040FB10    add         byte ptr [eax+eax*4],4
 0040FB14    adc         byte ptr [ecx],al
 0040FB16    adc         byte ptr [ecx],al
 0040FB18    add         byte ptr [esi],al
 0040FB1A    add         byte ptr [eax+eax*4],4
 0040FB1E    add         byte ptr [eax+eax*4],4
 0040FB22    add         byte ptr [eax+eax*4],4
 0040FB26    add         byte ptr [eax+eax*4],4
 0040FB2A    add         byte ptr [eax+eax*4],4
 0040FB2E    add         byte ptr [eax+eax*4],4
 0040FB32    add         byte ptr [eax+eax*4],4
 0040FB36    add         byte ptr [eax+eax*4],4
 0040FB3A    add         byte ptr [eax+eax*4],4
 0040FB3E    add         byte ptr [eax+eax*4],4
 0040FB42    add         byte ptr [eax+eax*4],4
 0040FB46    add         byte ptr [eax+eax*4],4
 0040FB4A    add         byte ptr [eax+eax*4],4
 0040FB4E    add         byte ptr [eax+eax*4],4
 0040FB52    add         byte ptr [eax+eax*4],4
 0040FB56    add         byte ptr [eax+eax*4],4
 0040FB5A    add         byte ptr [eax+eax*4],4
 0040FB5E    add         byte ptr [eax+eax*4],4
 0040FB62    add         byte ptr [eax+eax*4],4
 0040FB66    add         byte ptr [eax+eax*4],4
 0040FB6A    add         byte ptr [eax+eax*4],4
 0040FB6E    add         byte ptr [eax+eax*4],4
 0040FB72    add         byte ptr [eax+eax*4],4
 0040FB76    add         byte ptr [eax+eax*4],4
 0040FB7A    add         byte ptr [eax+eax*4],4
 0040FB7E    add         byte ptr [eax+eax*4],4
 0040FB82    add         byte ptr [eax+eax*4],4
 0040FB86    add         byte ptr [eax+eax*4],4
 0040FB8A    add         byte ptr [eax+eax*4],4
 0040FB8E    add         byte ptr [eax+eax*4],4
 0040FB92    add         byte ptr [eax+eax*4],4
 0040FB96    add         byte ptr [eax+eax*4],4
 0040FB9A    add         byte ptr [eax+eax*4],4
 0040FB9E    add         byte ptr [eax+eax*4],4
 0040FBA2    add         byte ptr [eax+eax*4],4
 0040FBA6    add         byte ptr [eax+eax*4],4
 0040FBAA    add         byte ptr [eax+eax*4],4
 0040FBAE    add         byte ptr [eax+eax*4],4
 0040FBB2    add         byte ptr [eax+eax*4],4
 0040FBB6    add         byte ptr [eax+eax*4],4
 0040FBBA    add         byte ptr [eax+eax*4],4
 0040FBBE    add         byte ptr [eax+eax*4],4
 0040FBC2    add         byte ptr [eax+eax*4],4
 0040FBC6    add         byte ptr [eax+eax*4],4
 0040FBCA    add         byte ptr [eax+eax*4],4
 0040FBCE    add         byte ptr [eax+eax*4],4
 0040FBD2    add         byte ptr [eax+eax*4],4
 0040FBD6    add         byte ptr [eax+eax*4],4
 0040FBDA    add         byte ptr [eax+eax*4],4
 0040FBDE    add         byte ptr [eax+eax*4],4
 0040FBE2    add         byte ptr [eax+eax*4],4
 0040FBE6    add         byte ptr [eax+eax*4],4
 0040FBEA    add         byte ptr [eax+eax*4],4
 0040FBEE    add         byte ptr [eax+eax*4],4
 0040FBF2    add         byte ptr [eax+eax*4],4
 0040FBF6    add         byte ptr [eax+eax*4],4
 0040FBFA    add         byte ptr [eax+eax*4],4
 0040FBFE    add         byte ptr [eax+eax*4],4
 0040FC02    add         byte ptr [eax+eax*4],4
 0040FC06    add         byte ptr [eax+eax*4],4
 0040FC0A    add         byte ptr [eax+eax*4],4
 0040FC0E    add         byte ptr [eax+eax*4],4
 0040FC12    add         byte ptr [eax+eax*4],4
 0040FC16    add         byte ptr [eax+eax*4],4
 0040FC1A    add         byte ptr [eax+eax*4],4
 0040FC1E    add         byte ptr [eax+eax*4],4
 0040FC22    add         byte ptr [eax+eax*4],4
 0040FC26    add         byte ptr [eax+eax*4],4
 0040FC2A    add         byte ptr [eax+eax*4],4
 0040FC2E    add         byte ptr [eax+eax*4],4
 0040FC32    add         byte ptr [eax+eax*4],4
 0040FC36    add         byte ptr [eax+eax*4],4
 0040FC3A    add         byte ptr [eax+eax*4],4
 0040FC3E    add         byte ptr [eax+eax*4],4
 0040FC42    add         byte ptr [eax+eax*4],4
 0040FC46    add         byte ptr [eax+eax*4],4
 0040FC4A    add         byte ptr [eax+eax*4],4
 0040FC4E    add         byte ptr [eax+eax*4],4
 0040FC52    add         byte ptr [eax+eax*4],4
 0040FC56    add         byte ptr [eax+eax*4],4
 0040FC5A    add         byte ptr [eax+eax*4],4
 0040FC5E    add         byte ptr [eax+eax*4],4
 0040FC62    add         byte ptr [eax+eax*4],4
 0040FC66    add         byte ptr [eax+eax*4],4
 0040FC6A    add         byte ptr [eax+eax*4],4
 0040FC6E    add         byte ptr [eax+eax*4],4
 0040FC72    add         byte ptr [eax+eax*4],4
 0040FC76    add         byte ptr [eax+eax*4],4
 0040FC7A    add         byte ptr [eax+eax*4],4
 0040FC7E    add         byte ptr [eax+eax*4],4
 0040FC82    add         byte ptr [eax+eax*4],4
 0040FC86    add         byte ptr [eax+eax*4],4
 0040FC8A    add         byte ptr [eax+eax*4],4
 0040FC8E    add         byte ptr [eax+eax*4],4
 0040FC92    add         byte ptr [eax+eax*4],4
 0040FC96    add         byte ptr [eax+eax*4],4
 0040FC9A    add         byte ptr [eax+eax*4],4
 0040FC9E    add         byte ptr [eax+eax*4],4
 0040FCA2    add         byte ptr [eax+eax*4],4
 0040FCA6    add         byte ptr [eax+eax*4],4
 0040FCAA    add         byte ptr [eax+eax*4],4
 0040FCAE    add         byte ptr [eax+eax*4],4
 0040FCB2    add         byte ptr [eax+eax*4],4
 0040FCB6    add         byte ptr [eax+eax*4],4
 0040FCBA    add         byte ptr [eax+eax*4],4
 0040FCBE    add         byte ptr [eax+eax*4],4
 0040FCC2    add         byte ptr [eax+eax*4],4
 0040FCC6    add         byte ptr [eax+eax*4],4
 0040FCCA    add         byte ptr [eax+eax*4],4
 0040FCCE    add         byte ptr [eax+eax*4],4
 0040FCD2    add         byte ptr [eax+eax*4],4
 0040FCD6    add         byte ptr [eax+eax*4],4
 0040FCDA    add         byte ptr [eax+eax*4],4
 0040FCDE    add         byte ptr [eax+eax*4],4
 0040FCE2    add         byte ptr [eax+eax*4],4
 0040FCE6    add         byte ptr [eax+eax*4],4
 0040FCEA    add         byte ptr [eax+eax*4],4
 0040FCEE    add         byte ptr [eax+eax*4],4
 0040FCF2    add         byte ptr [eax+eax*4],4
 0040FCF6    add         byte ptr [eax+eax*4],4
 0040FCFA    add         byte ptr [eax+eax*4],4
 0040FCFE    add         byte ptr [eax+eax*4],4
 0040FD02    add         byte ptr [eax+eax*4],4
 0040FD06    add         byte ptr [eax+eax*4],4
 0040FD0A    add         byte ptr [eax+eax*4],4
 0040FD0E    add         byte ptr [eax+eax*4],4
 0040FD12    add         byte ptr [eax+eax*4],4
 0040FD16    add         byte ptr [eax+eax*4],4
 0040FD1A    add         byte ptr [eax+eax*4],4
 0040FD1E    add         byte ptr [eax+eax*4],4
 0040FD22    add         byte ptr [eax+eax*4],4
 0040FD26    add         byte ptr [eax+eax*4],4
 0040FD2A    add         byte ptr [eax+eax*4],4
 0040FD2E    add         byte ptr [eax+eax*4],4
 0040FD32    add         byte ptr [eax+eax*4],4
 0040FD36    add         byte ptr [eax+eax*4],4
 0040FD3A    add         byte ptr [eax+eax*4],4
 0040FD3E    add         byte ptr [eax+eax*4],4
 0040FD42    add         byte ptr [eax+eax*4],4
 0040FD46    add         byte ptr [eax+eax*4],4
 0040FD4A    add         byte ptr [eax+eax*4],4
 0040FD4E    add         byte ptr [eax+eax*4],4
 0040FD52    add         byte ptr [eax+eax*4],4
 0040FD56    add         byte ptr [eax+eax*4],4
 0040FD5A    add         byte ptr [eax+eax*4],4
 0040FD5E    add         byte ptr [eax+eax*4],4
 0040FD62    add         byte ptr [eax+eax*4],4
 0040FD66    add         byte ptr [eax+eax*4],4
 0040FD6A    add         byte ptr [eax+eax*4],4
 0040FD6E    add         byte ptr [eax+eax*4],4
 0040FD72    add         byte ptr [eax+eax*4],4
 0040FD76    add         byte ptr [eax+eax*4],4
 0040FD7A    add         byte ptr [eax+eax*4],4
 0040FD7E    add         byte ptr [eax+eax*4],4
 0040FD82    add         byte ptr [eax+eax*4],4
 0040FD86    add         byte ptr [eax+eax*4],4
 0040FD8A    add         byte ptr [eax+eax*4],4
 0040FD8E    add         byte ptr [eax+eax*4],4
 0040FD92    add         byte ptr [eax+eax*4],4
 0040FD96    add         byte ptr [eax+eax*4],4
 0040FD9A    add         byte ptr [eax+eax*4],4
 0040FD9E    add         byte ptr [eax+eax*4],4
 0040FDA2    add         byte ptr [eax+eax*4],4
 0040FDA6    add         byte ptr [eax+eax*4],4
 0040FDAA    add         byte ptr [eax+eax*4],4
 0040FDAE    add         byte ptr [eax+eax*4],4
 0040FDB2    add         byte ptr [eax+eax*4],4
 0040FDB6    add         byte ptr [eax+eax*4],4
 0040FDBA    add         byte ptr [eax+eax*4],4
 0040FDBE    add         byte ptr [eax+eax*4],4
 0040FDC2    add         byte ptr [eax+eax*4],4
 0040FDC6    add         byte ptr [eax+eax*4],4
 0040FDCA    add         byte ptr [eax+eax*4],4
 0040FDCE    add         byte ptr [eax+eax*4],4
 0040FDD2    add         byte ptr [eax+eax*4],4
 0040FDD6    add         byte ptr [eax+eax*4],4
 0040FDDA    add         byte ptr [eax+eax*4],4
 0040FDDE    add         byte ptr [eax+eax*4],4
 0040FDE2    add         byte ptr [eax+eax*4],4
 0040FDE6    add         byte ptr [eax+eax*4],4
 0040FDEA    add         byte ptr [eax+eax*4],4
 0040FDEE    add         byte ptr [eax+eax*4],4
 0040FDF2    add         byte ptr [eax+eax*4],4
 0040FDF6    add         byte ptr [eax+eax*4],4
 0040FDFA    add         byte ptr [eax+eax*4],4
 0040FDFE    add         byte ptr [eax+eax*4],4
 0040FE02    add         byte ptr [eax+eax*4],4
 0040FE06    add         byte ptr [eax+eax*4],4
 0040FE0A    add         byte ptr [eax+eax*4],4
 0040FE0E    add         byte ptr [eax+eax*4],4
 0040FE12    add         byte ptr [eax+eax*4],4
 0040FE16    add         byte ptr [eax+eax*4],4
 0040FE1A    add         byte ptr [eax+eax*4],4
 0040FE1E    add         byte ptr [eax+eax*4],4
 0040FE22    add         byte ptr [eax+eax*4],4
 0040FE26    add         byte ptr [eax+eax*4],4
 0040FE2A    add         byte ptr [eax+eax*4],4
 0040FE2E    add         byte ptr [eax+eax*4],4
 0040FE32    add         byte ptr [eax+eax*4],4
 0040FE36    add         byte ptr [eax+eax*4],4
 0040FE3A    add         byte ptr [eax+eax*4],4
 0040FE3E    add         byte ptr [eax+eax*4],4
 0040FE42    add         byte ptr [eax+eax*4],4
 0040FE46    add         byte ptr [eax+eax*4],4
 0040FE4A    add         byte ptr [eax+eax*4],4
 0040FE4E    add         byte ptr [eax+eax*4],4
 0040FE52    add         byte ptr [eax+eax*4],4
 0040FE56    add         byte ptr [eax+eax*4],4
 0040FE5A    add         byte ptr [eax+eax*4],4
 0040FE5E    add         byte ptr [eax+eax*4],4
 0040FE62    add         byte ptr [eax+eax*4],4
 0040FE66    add         byte ptr [eax+eax*4],4
 0040FE6A    add         byte ptr [eax+eax*4],4
 0040FE6E    add         byte ptr [eax+eax*4],4
 0040FE72    add         byte ptr [eax+eax*4],4
 0040FE76    add         byte ptr [eax+eax*4],4
 0040FE7A    add         byte ptr [eax+eax*4],4
 0040FE7E    add         byte ptr [eax+eax*4],4
 0040FE82    add         byte ptr [eax+eax*4],4
 0040FE86    add         byte ptr [eax+eax*4],4
 0040FE8A    add         byte ptr [eax+eax*4],4
 0040FE8E    add         byte ptr [eax+eax*4],4
 0040FE92    add         byte ptr [eax+eax*4],4
 0040FE96    add         byte ptr [eax+eax*4],4
 0040FE9A    add         byte ptr [eax+eax*4],4
 0040FE9E    add         byte ptr [eax+eax*4],4
 0040FEA2    add         byte ptr [eax+eax*4],4
 0040FEA6    add         byte ptr [eax+eax*4],4
 0040FEAA    add         byte ptr [eax+eax*4],4
 0040FEAE    add         byte ptr [eax+eax*4],4
 0040FEB2    add         byte ptr [eax+eax*4],4
 0040FEB6    add         byte ptr [eax+eax*4],4
 0040FEBA    add         byte ptr [eax+eax*4],4
 0040FEBE    add         byte ptr [eax+eax*4],4
 0040FEC2    add         byte ptr [eax+eax*4],4
 0040FEC6    add         byte ptr [eax+eax*4],4
 0040FECA    add         byte ptr [eax+eax*4],4
 0040FECE    add         byte ptr [eax+eax*4],4
 0040FED2    add         byte ptr [eax+eax*4],4
 0040FED6    add         byte ptr [eax+eax*4],4
 0040FEDA    add         byte ptr [eax+eax*4],4
 0040FEDE    add         byte ptr [eax+eax*4],4
 0040FEE2    add         byte ptr [eax+eax*4],4
 0040FEE6    add         byte ptr [eax+eax*4],4
 0040FEEA    add         byte ptr [eax+eax*4],4
 0040FEEE    add         byte ptr [eax+eax*4],4
 0040FEF2    add         byte ptr [eax+eax*4],4
 0040FEF6    add         byte ptr [eax+eax*4],4
 0040FEFA    add         byte ptr [eax+eax*4],4
 0040FEFE    add         byte ptr [eax+eax*4],4
 0040FF02    add         byte ptr [eax+eax*4],4
 0040FF06    add         byte ptr [eax+eax*4],4
 0040FF0A    add         byte ptr [eax+eax*4],4
 0040FF0E    add         byte ptr [eax+eax*4],4
 0040FF12    add         byte ptr [eax+eax*4],4
 0040FF16    add         byte ptr [eax+eax*4],4
 0040FF1A    add         byte ptr [eax+eax*4],4
 0040FF1E    add         byte ptr [eax+eax*4],4
 0040FF22    add         byte ptr [eax+eax*4],4
 0040FF26    add         byte ptr [eax+eax*4],4
 0040FF2A    add         byte ptr [eax+eax*4],4
 0040FF2E    add         byte ptr [eax+eax*4],4
 0040FF32    add         byte ptr [eax+eax*4],4
 0040FF36    add         byte ptr [eax+eax*4],4
 0040FF3A    add         byte ptr [eax+eax*4],4
 0040FF3E    add         byte ptr [eax+eax*4],4
 0040FF42    add         byte ptr [eax+eax*4],4
 0040FF46    add         byte ptr [eax+eax*4],4
 0040FF4A    add         byte ptr [eax+eax*4],4
 0040FF4E    add         byte ptr [eax+eax*4],4
 0040FF52    add         byte ptr [eax+eax*4],4
 0040FF56    add         byte ptr [eax+eax*4],4
 0040FF5A    add         byte ptr [eax+eax*4],4
 0040FF5E    add         byte ptr [eax+eax*4],4
 0040FF62    add         byte ptr [eax+eax*4],4
 0040FF66    add         byte ptr [eax+eax*4],4
 0040FF6A    add         byte ptr [eax+eax*4],4
 0040FF6E    add         byte ptr [eax+eax*4],4
 0040FF72    add         byte ptr [eax+eax*4],4
 0040FF76    add         byte ptr [eax+eax*4],4
 0040FF7A    add         byte ptr [eax+eax*4],4
 0040FF7E    add         byte ptr [eax+eax*4],4
 0040FF82    add         byte ptr [eax+eax*4],4
 0040FF86    add         byte ptr [eax+eax*4],4
 0040FF8A    add         byte ptr [eax+eax*4],4
 0040FF8E    add         byte ptr [eax+eax*4],4
 0040FF92    add         byte ptr [eax+eax*4],4
 0040FF96    add         byte ptr [eax+eax*4],4
 0040FF9A    add         byte ptr [eax+eax*4],4
 0040FF9E    add         byte ptr [eax+eax*4],4
 0040FFA2    add         byte ptr [eax+eax*4],4
 0040FFA6    add         byte ptr [eax+eax*4],4
 0040FFAA    add         byte ptr [eax+eax*4],4
 0040FFAE    add         byte ptr [eax+eax*4],4
 0040FFB2    add         byte ptr [eax+eax*4],4
 0040FFB6    add         byte ptr [eax+eax*4],4
 0040FFBA    add         byte ptr [eax+eax*4],4
 0040FFBE    add         byte ptr [eax+eax*4],4
 0040FFC2    add         byte ptr [eax+eax*4],4
 0040FFC6    add         byte ptr [eax+eax*4],4
 0040FFCA    add         byte ptr [eax+eax*4],4
 0040FFCE    add         byte ptr [eax+eax*4],4
 0040FFD2    add         byte ptr [eax+eax*4],4
 0040FFD6    add         byte ptr [eax+eax*4],4
 0040FFDA    add         byte ptr [eax+eax*4],4
 0040FFDE    add         byte ptr [eax+eax*4],4
 0040FFE2    add         byte ptr [eax+eax*4],4
 0040FFE6    add         byte ptr [eax+eax*4],4
 0040FFEA    add         byte ptr [eax+eax*4],4
 0040FFEE    add         byte ptr [eax+eax*4],4
 0040FFF2    add         byte ptr [eax+eax*4],4
 0040FFF6    add         byte ptr [eax+eax*4],4
 0040FFFA    add         byte ptr [eax+eax*4],4
 0040FFFE    add         byte ptr [eax+eax*4],4
 00410002    add         byte ptr [eax+eax*4],4
 00410006    add         byte ptr [eax+eax*4],4
 0041000A    add         byte ptr [eax+eax*4],4
 0041000E    add         byte ptr [eax+eax*4],4
 00410012    add         byte ptr [eax+eax*4],4
 00410016    add         byte ptr [eax+eax*4],4
 0041001A    add         byte ptr [eax+eax*4],4
 0041001E    add         byte ptr [eax+eax*4],4
 00410022    add         byte ptr [eax+eax*4],4
 00410026    add         byte ptr [eax+eax*4],4
 0041002A    add         byte ptr [eax+eax*4],4
 0041002E    add         byte ptr [eax+eax*4],4
 00410032    add         byte ptr [eax+eax*4],4
 00410036    add         byte ptr [eax+eax*4],4
 0041003A    add         byte ptr [eax+eax*4],4
 0041003E    add         byte ptr [eax+eax*4],4
 00410042    add         byte ptr [eax+eax*4],4
 00410046    add         byte ptr [eax+eax*4],4
 0041004A    add         byte ptr [eax+eax*4],4
 0041004E    add         byte ptr [eax+eax*4],4
 00410052    add         byte ptr [eax+eax*4],4
 00410056    add         byte ptr [eax+eax*4],4
 0041005A    add         byte ptr [eax+eax*4],4
 0041005E    add         byte ptr [eax+eax*4],4
 00410062    add         byte ptr [eax+eax*4],4
 00410066    add         byte ptr [eax+eax*4],4
 0041006A    add         byte ptr [eax+eax*4],4
 0041006E    add         byte ptr [eax+eax*4],4
 00410072    add         byte ptr [eax+eax*4],4
 00410076    add         byte ptr [eax+eax*4],4
 0041007A    add         byte ptr [eax+eax*4],4
 0041007E    add         byte ptr [eax+eax*4],4
 00410082    add         byte ptr [eax+eax*4],4
 00410086    add         byte ptr [eax+eax*4],4
 0041008A    add         byte ptr [eax+eax*4],4
 0041008E    add         byte ptr [eax+eax*4],4
 00410092    add         byte ptr [eax+eax*4],4
 00410096    add         byte ptr [eax+eax*4],4
 0041009A    add         byte ptr [eax+eax*4],4
 0041009E    add         byte ptr [eax+eax*4],4
 004100A2    add         byte ptr [eax+eax*4],4
 004100A6    add         byte ptr [eax+eax*4],4
 004100AA    add         byte ptr [eax+eax*4],4
 004100AE    add         byte ptr [eax+eax*4],4
 004100B2    add         byte ptr [eax+eax*4],4
 004100B6    add         byte ptr [eax+eax*4],4
 004100BA    add         byte ptr [eax+eax*4],4
 004100BE    add         byte ptr [eax+eax*4],4
 004100C2    add         byte ptr [eax+eax*4],4
 004100C6    add         byte ptr [eax+eax*4],4
 004100CA    add         byte ptr [eax+eax*4],4
 004100CE    add         byte ptr [eax+eax*4],4
 004100D2    add         byte ptr [eax+eax*4],4
 004100D6    add         byte ptr [eax+eax*4],4
 004100DA    add         byte ptr [eax+eax*4],4
 004100DE    add         byte ptr [eax+eax*4],4
 004100E2    add         byte ptr [eax+eax*4],4
 004100E6    add         byte ptr [eax+eax*4],4
 004100EA    add         byte ptr [eax+eax*4],4
 004100EE    add         byte ptr [eax+eax*4],4
 004100F2    add         byte ptr [eax+eax*4],4
 004100F6    add         byte ptr [eax+eax*4],4
 004100FA    add         byte ptr [eax+eax*4],4
 004100FE    add         byte ptr [eax+eax*4],4
 00410102    add         byte ptr [eax+eax*4],4
 00410106    add         byte ptr [eax+eax*4],4
 0041010A    add         byte ptr [eax+eax*4],4
 0041010E    add         byte ptr [eax+eax*4],4
 00410112    add         byte ptr [eax+eax*4],4
 00410116    add         byte ptr [eax+eax*4],4
 0041011A    add         byte ptr [eax+eax*4],4
 0041011E    add         byte ptr [eax+eax*4],4
 00410122    add         byte ptr [eax+eax*4],4
 00410126    add         byte ptr [eax+eax*4],4
 0041012A    add         byte ptr [eax+eax*4],4
 0041012E    add         byte ptr [eax+eax*4],4
 00410132    add         byte ptr [eax+eax*4],4
 00410136    add         byte ptr [eax+eax*4],4
 0041013A    add         byte ptr [eax+eax*4],4
 0041013E    add         byte ptr [eax+eax*4],4
 00410142    add         byte ptr [eax+eax*4],4
 00410146    add         byte ptr [eax+eax*4],4
 0041014A    add         byte ptr [eax+eax*4],4
 0041014E    add         byte ptr [eax+eax*4],4
 00410152    add         byte ptr [eax+eax*4],4
 00410156    add         byte ptr [eax+eax*4],4
 0041015A    add         byte ptr [eax+eax*4],4
 0041015E    add         byte ptr [eax+eax*4],4
 00410162    add         byte ptr [eax+eax*4],4
 00410166    add         byte ptr [eax+eax*4],4
 0041016A    add         byte ptr [eax+eax*4],4
 0041016E    add         byte ptr [eax+eax*4],4
 00410172    add         byte ptr [eax+eax*4],4
 00410176    add         byte ptr [eax+eax*4],4
 0041017A    add         byte ptr [eax+eax*4],4
 0041017E    add         byte ptr [eax+eax*4],4
 00410182    add         byte ptr [eax+eax*4],4
 00410186    add         byte ptr [eax+eax*4],4
 0041018A    add         byte ptr [eax+eax*4],4
 0041018E    add         byte ptr [eax+eax*4],4
 00410192    add         byte ptr [eax+eax*4],4
 00410196    add         byte ptr [eax+eax*4],4
 0041019A    add         byte ptr [eax+eax*4],4
 0041019E    add         byte ptr [eax+eax*4],4
 004101A2    add         byte ptr [eax+eax*4],4
 004101A6    add         byte ptr [eax+eax*4],4
 004101AA    add         byte ptr [eax+eax*4],4
 004101AE    add         byte ptr [eax+eax*4],4
 004101B2    add         byte ptr [eax+eax*4],4
 004101B6    add         byte ptr [eax+eax*4],4
 004101BA    add         byte ptr [eax+eax*4],4
 004101BE    add         byte ptr [eax+eax*4],4
 004101C2    add         byte ptr [eax+eax*4],4
 004101C6    add         byte ptr [eax+eax*4],4
 004101CA    add         byte ptr [eax+eax*4],4
 004101CE    add         byte ptr [eax+eax*4],4
 004101D2    add         byte ptr [eax+eax*4],4
 004101D6    add         byte ptr [eax+eax*4],4
 004101DA    add         byte ptr [eax+eax*4],4
 004101DE    add         byte ptr [eax+eax*4],4
 004101E2    add         byte ptr [eax+eax*4],4
 004101E6    add         byte ptr [eax+eax*4],4
 004101EA    add         byte ptr [eax+eax*4],4
 004101EE    add         byte ptr [eax+eax*4],4
 004101F2    add         byte ptr [eax+eax*4],4
 004101F6    add         byte ptr [eax+eax*4],4
 004101FA    add         byte ptr [eax+eax*4],4
 004101FE    add         byte ptr [eax+eax*4],4
 00410202    add         byte ptr [eax+eax*4],4
 00410206    add         byte ptr [eax+eax*4],4
 0041020A    add         byte ptr [eax+eax*4],4
 0041020E    add         byte ptr [eax+eax*4],4
 00410212    add         byte ptr [eax+eax*4],4
 00410216    add         byte ptr [eax+eax*4],4
 0041021A    add         byte ptr [eax+eax*4],4
 0041021E    add         byte ptr [eax+eax*4],4
 00410222    add         byte ptr [eax+eax*4],4
 00410226    add         byte ptr [eax+eax*4],4
 0041022A    add         byte ptr [eax+eax*4],4
 0041022E    add         byte ptr [eax+eax*4],4
 00410232    add         byte ptr [eax+eax*4],4
 00410236    add         byte ptr [eax+eax*4],4
 0041023A    add         byte ptr [eax+eax*4],4
 0041023E    add         byte ptr [eax+eax*4],4
 00410242    add         byte ptr [eax+eax*4],4
 00410246    add         byte ptr [eax+eax*4],4
 0041024A    add         byte ptr [eax+eax*4],4
 0041024E    add         byte ptr [eax+eax*4],4
 00410252    add         byte ptr [eax+eax*4],4
 00410256    add         byte ptr [eax+eax*4],4
 0041025A    add         byte ptr [eax+eax*4],4
 0041025E    add         byte ptr [eax+eax*4],4
 00410262    add         byte ptr [eax+eax*4],4
 00410266    add         byte ptr [eax+eax*4],4
 0041026A    add         byte ptr [eax+eax*4],4
 0041026E    add         byte ptr [eax+eax*4],4
 00410272    add         byte ptr [eax+eax*4],4
 00410276    add         byte ptr [eax+eax*4],4
 0041027A    add         byte ptr [eax+eax*4],4
 0041027E    add         byte ptr [eax+eax*4],4
 00410282    add         byte ptr [eax+eax*4],4
 00410286    add         byte ptr [eax+eax*4],4
 0041028A    add         byte ptr [eax+eax*4],4
 0041028E    add         byte ptr [eax+eax*4],4
 00410292    add         byte ptr [eax+eax*4],4
 00410296    add         byte ptr [eax+eax*4],4
 0041029A    add         byte ptr [eax+eax*4],4
 0041029E    add         byte ptr [eax+eax*4],4
 004102A2    add         byte ptr [eax+eax*4],4
 004102A6    add         byte ptr [eax+eax*4],4
 004102AA    add         byte ptr [eax+eax*4],4
 004102AE    add         byte ptr [eax+eax*4],4
 004102B2    add         byte ptr [eax+eax*4],4
 004102B6    add         byte ptr [eax+eax*4],4
 004102BA    add         byte ptr [eax+eax*4],4
 004102BE    add         byte ptr [eax+eax*4],4
 004102C2    add         byte ptr [eax+eax*4],4
 004102C6    add         byte ptr [eax+eax*4],4
 004102CA    add         byte ptr [eax+eax*4],4
 004102CE    add         byte ptr [eax+eax*4],4
 004102D2    add         byte ptr [eax+eax*4],4
 004102D6    add         byte ptr [eax+eax*4],4
 004102DA    add         byte ptr [eax+eax*4],4
 004102DE    add         byte ptr [eax+eax*4],4
 004102E2    add         byte ptr [eax+eax*4],4
 004102E6    add         byte ptr [eax+eax*4],4
 004102EA    add         byte ptr [eax+eax*4],4
 004102EE    add         byte ptr [eax+eax*4],4
 004102F2    add         byte ptr [eax+eax*4],4
 004102F6    add         byte ptr [eax+eax*4],4
 004102FA    add         byte ptr [eax+eax*4],4
 004102FE    add         byte ptr [eax+eax*4],4
 00410302    add         byte ptr [eax+eax*4],4
 00410306    add         byte ptr [eax+eax*4],4
 0041030A    add         byte ptr [eax+eax*4],4
 0041030E    add         byte ptr [eax+eax*4],4
 00410312    add         byte ptr [eax+eax*4],4
 00410316    add         byte ptr [eax+eax*4],4
 0041031A    add         byte ptr [eax+eax*4],4
 0041031E    add         byte ptr [eax+eax*4],4
 00410322    add         byte ptr [eax+eax*4],4
 00410326    add         byte ptr [eax+eax*4],4
 0041032A    add         byte ptr [eax+eax*4],4
 0041032E    add         byte ptr [eax+eax*4],4
 00410332    add         byte ptr [eax+eax*4],4
 00410336    add         byte ptr [eax+eax*4],4
 0041033A    add         byte ptr [eax+eax*4],4
 0041033E    add         byte ptr [eax+eax*4],4
 00410342    add         byte ptr [eax+eax*4],4
 00410346    add         byte ptr [eax+eax*4],4
 0041034A    add         byte ptr [eax+eax*4],4
 0041034E    add         byte ptr [eax+eax*4],4
 00410352    add         byte ptr [eax+eax*4],4
 00410356    add         byte ptr [eax+eax*4],4
 0041035A    add         byte ptr [eax+eax*4],4
 0041035E    add         byte ptr [eax+eax*4],4
 00410362    add         byte ptr [eax+eax*4],4
 00410366    add         byte ptr [eax+eax*4],4
 0041036A    add         byte ptr [eax+eax*4],4
 0041036E    add         byte ptr [eax+eax*4],4
 00410372    add         byte ptr [eax+eax*4],4
 00410376    add         byte ptr [eax+eax*4],4
 0041037A    add         byte ptr [eax+eax*4],4
 0041037E    add         byte ptr [eax+eax*4],4
 00410382    add         byte ptr [eax+eax*4],4
 00410386    add         byte ptr [eax+eax*4],4
 0041038A    add         byte ptr [eax+eax*4],4
 0041038E    add         byte ptr [eax+eax*4],4
 00410392    add         byte ptr [eax+eax*4],4
 00410396    add         byte ptr [eax+eax*4],4
 0041039A    add         byte ptr [eax+eax*4],4
 0041039E    add         byte ptr [eax+eax*4],4
 004103A2    add         byte ptr [eax+eax*4],4
 004103A6    add         byte ptr [eax+eax*4],4
 004103AA    add         byte ptr [eax+eax*4],4
 004103AE    add         byte ptr [eax+eax*4],4
 004103B2    add         byte ptr [eax+eax*4],4
 004103B6    add         byte ptr [eax+eax*4],4
 004103BA    add         byte ptr [eax+eax*4],4
 004103BE    add         byte ptr [eax+eax*4],4
 004103C2    add         byte ptr [eax+eax*4],4
 004103C6    add         byte ptr [eax+eax*4],4
 004103CA    add         byte ptr [eax+eax*4],4
 004103CE    add         byte ptr [eax+eax*4],4
 004103D2    add         byte ptr [eax+eax*4],4
 004103D6    add         byte ptr [eax+eax*4],4
 004103DA    add         byte ptr [eax+eax*4],4
 004103DE    add         byte ptr [eax+eax*4],4
 004103E2    add         byte ptr [eax+eax*4],4
 004103E6    add         byte ptr [eax+eax*4],4
 004103EA    add         byte ptr [eax+eax*4],4
 004103EE    add         byte ptr [eax+eax*4],4
 004103F2    add         byte ptr [eax+eax*4],4
 004103F6    add         byte ptr [eax+eax*4],4
 004103FA    add         byte ptr [eax+eax*4],4
 004103FE    add         byte ptr [eax+eax*4],4
 00410402    add         byte ptr [eax+eax*4],4
 00410406    add         byte ptr [eax+eax*4],4
 0041040A    add         byte ptr [eax+eax*4],4
 0041040E    add         byte ptr [eax+eax*4],4
 00410412    add         byte ptr [eax+eax*4],4
 00410416    add         byte ptr [eax+eax*4],4
 0041041A    add         byte ptr [eax+eax*4],4
 0041041E    add         byte ptr [eax+eax*4],4
 00410422    add         byte ptr [eax+eax*4],4
 00410426    add         byte ptr [eax+eax*4],4
 0041042A    add         byte ptr [eax+eax*4],4
 0041042E    add         byte ptr [eax+eax*4],4
 00410432    add         byte ptr [eax+eax*4],4
 00410436    add         byte ptr [eax+eax*4],4
 0041043A    add         byte ptr [eax+eax*4],4
 0041043E    add         byte ptr [eax+eax*4],4
 00410442    add         byte ptr [eax+eax*4],4
 00410446    add         byte ptr [eax+eax*4],4
 0041044A    add         byte ptr [eax+eax*4],4
 0041044E    add         byte ptr [eax+eax*4],4
 00410452    add         byte ptr [eax+eax*4],4
 00410456    add         byte ptr [eax+eax*4],4
 0041045A    add         byte ptr [eax+eax*4],4
 0041045E    add         byte ptr [eax+eax*4],4
 00410462    add         byte ptr [eax+eax*4],4
 00410466    add         byte ptr [eax+eax*4],4
 0041046A    add         byte ptr [eax+eax*4],4
 0041046E    add         byte ptr [eax+eax*4],4
 00410472    add         byte ptr [eax+eax*4],4
 00410476    add         byte ptr [eax+eax*4],4
 0041047A    add         byte ptr [eax+eax*4],4
 0041047E    add         byte ptr [eax+eax*4],4
 00410482    add         byte ptr [eax+eax*4],4
 00410486    add         byte ptr [eax+eax*4],4
 0041048A    add         byte ptr [eax+eax*4],4
 0041048E    add         byte ptr [eax+eax*4],4
 00410492    add         byte ptr [eax+eax*4],4
 00410496    add         byte ptr [eax+eax*4],4
 0041049A    add         byte ptr [eax+eax*4],4
 0041049E    add         byte ptr [eax+eax*4],4
 004104A2    add         byte ptr [eax+eax*4],4
 004104A6    add         byte ptr [eax+eax*4],4
 004104AA    add         byte ptr [eax+eax*4],4
 004104AE    add         byte ptr [eax+eax*4],4
 004104B2    add         byte ptr [eax+eax*4],4
 004104B6    add         byte ptr [eax+eax*4],4
 004104BA    add         byte ptr [eax+eax*4],4
 004104BE    add         byte ptr [eax+eax*4],4
 004104C2    add         byte ptr [eax+eax*4],4
 004104C6    add         byte ptr [eax+eax*4],4
 004104CA    add         byte ptr [eax+eax*4],4
 004104CE    add         byte ptr [eax+eax*4],4
 004104D2    add         byte ptr [eax+eax*4],4
 004104D6    add         byte ptr [eax+eax*4],4
 004104DA    add         byte ptr [eax+eax*4],4
 004104DE    add         byte ptr [eax+eax*4],4
 004104E2    add         byte ptr [eax+eax*4],4
 004104E6    add         byte ptr [eax+eax*4],4
 004104EA    add         byte ptr [eax+eax*4],4
 004104EE    add         byte ptr [eax+eax*4],4
 004104F2    add         byte ptr [eax+eax*4],4
 004104F6    add         byte ptr [eax+eax*4],4
 004104FA    add         byte ptr [eax+eax*4],4
 004104FE    add         byte ptr [eax+eax*4],4
 00410502    add         byte ptr [eax+eax*4],4
 00410506    add         byte ptr [eax+eax*4],4
 0041050A    add         byte ptr [eax+eax*4],4
 0041050E    add         byte ptr [eax+eax*4],4
 00410512    add         byte ptr [eax+eax*4],4
 00410516    add         byte ptr [eax+eax*4],4
 0041051A    add         byte ptr [eax+eax*4],4
 0041051E    add         byte ptr [eax+eax*4],4
 00410522    add         byte ptr [eax+eax*4],4
 00410526    add         byte ptr [eax+eax*4],4
 0041052A    add         byte ptr [eax+eax*4],4
 0041052E    add         byte ptr [eax+eax*4],4
 00410532    add         byte ptr [eax+eax*4],4
 00410536    add         byte ptr [eax+eax*4],4
 0041053A    add         byte ptr [eax+eax*4],4
 0041053E    add         byte ptr [eax+eax*4],4
 00410542    add         byte ptr [eax+eax*4],4
 00410546    add         byte ptr [eax+eax*4],4
 0041054A    add         byte ptr [eax+eax*4],4
 0041054E    add         byte ptr [eax+eax*4],4
 00410552    add         byte ptr [eax+eax*4],4
 00410556    add         byte ptr [eax+eax*4],4
 0041055A    add         byte ptr [eax+eax*4],4
 0041055E    add         byte ptr [eax+eax*4],4
 00410562    add         byte ptr [eax+eax*4],4
 00410566    add         byte ptr [eax+eax*4],4
 0041056A    add         byte ptr [eax+eax*4],4
 0041056E    add         byte ptr [eax+eax*4],4
 00410572    add         byte ptr [eax+eax*4],4
 00410576    add         byte ptr [eax+eax*4],4
 0041057A    add         byte ptr [eax+eax*4],4
 0041057E    add         byte ptr [eax+eax*4],4
 00410582    add         byte ptr [eax+eax*4],4
 00410586    add         byte ptr [eax+eax*4],4
 0041058A    add         byte ptr [eax+eax*4],4
 0041058E    add         byte ptr [eax+eax*4],4
 00410592    add         byte ptr [eax+eax*4],4
 00410596    add         byte ptr [eax+eax*4],4
 0041059A    add         byte ptr [eax+eax*4],4
 0041059E    add         byte ptr [eax+eax*4],4
 004105A2    add         byte ptr [eax+eax*4],4
 004105A6    add         byte ptr [eax+eax*4],4
 004105AA    add         byte ptr [eax+eax*4],4
 004105AE    add         byte ptr [eax+eax*4],4
 004105B2    add         byte ptr [eax+eax*4],4
 004105B6    add         byte ptr [eax+eax*4],4
 004105BA    add         byte ptr [eax+eax*4],4
 004105BE    add         byte ptr [eax+eax*4],4
 004105C2    add         byte ptr [eax+eax*4],4
 004105C6    add         byte ptr [eax+eax*4],4
 004105CA    add         byte ptr [eax+eax*4],4
 004105CE    add         byte ptr [eax+eax*4],4
 004105D2    add         byte ptr [eax+eax*4],4
 004105D6    add         byte ptr [eax+eax*4],4
 004105DA    add         byte ptr [eax+eax*4],4
 004105DE    add         byte ptr [eax+eax*4],4
 004105E2    add         byte ptr [eax+eax*4],4
 004105E6    add         byte ptr [eax+eax*4],4
 004105EA    add         byte ptr [eax+eax*4],4
 004105EE    add         byte ptr [eax+eax*4],4
 004105F2    add         byte ptr [eax+eax*4],4
 004105F6    add         byte ptr [eax+eax*4],4
 004105FA    add         byte ptr [eax+eax*4],4
 004105FE    add         byte ptr [eax+eax*4],4
 00410602    add         byte ptr [eax+eax*4],4
 00410606    add         byte ptr [eax+eax*4],4
 0041060A    add         byte ptr [eax+eax*4],4
 0041060E    add         byte ptr [eax+eax*4],4
 00410612    add         byte ptr [eax+eax*4],4
 00410616    add         byte ptr [eax+eax*4],4
 0041061A    add         byte ptr [eax+eax*4],4
 0041061E    add         byte ptr [eax+eax*4],4
 00410622    add         byte ptr [eax+eax*4],4
 00410626    add         byte ptr [eax+eax*4],4
 0041062A    add         byte ptr [eax+eax*4],4
 0041062E    add         byte ptr [eax+eax*4],4
 00410632    add         byte ptr [eax+eax*4],4
 00410636    add         byte ptr [eax+eax*4],4
 0041063A    add         byte ptr [eax+eax*4],4
 0041063E    add         byte ptr [eax+eax*4],4
 00410642    add         byte ptr [eax+eax*4],4
 00410646    add         byte ptr [eax+eax*4],4
 0041064A    add         byte ptr [eax+eax*4],4
 0041064E    add         byte ptr [eax+eax*4],4
 00410652    add         byte ptr [eax+eax*4],4
 00410656    add         byte ptr [eax+eax*4],4
 0041065A    add         byte ptr [eax+eax*4],4
 0041065E    add         byte ptr [eax+eax*4],4
 00410662    add         byte ptr [eax+eax*4],4
 00410666    add         byte ptr [eax+eax*4],4
 0041066A    add         byte ptr [eax+eax*4],4
 0041066E    add         byte ptr [eax+eax*4],4
 00410672    add         byte ptr [eax+eax*4],4
 00410676    add         byte ptr [eax+eax*4],4
 0041067A    add         byte ptr [eax+eax*4],4
 0041067E    add         byte ptr [eax+eax*4],4
 00410682    add         byte ptr [eax+eax*4],4
 00410686    add         byte ptr [eax+eax*4],4
 0041068A    add         byte ptr [eax+eax*4],4
 0041068E    add         byte ptr [eax+eax*4],4
 00410692    add         byte ptr [eax+eax*4],4
 00410696    add         byte ptr [eax+eax*4],4
 0041069A    add         byte ptr [eax+eax*4],4
 0041069E    add         byte ptr [eax+eax*4],4
 004106A2    add         byte ptr [eax+eax*4],4
 004106A6    add         byte ptr [eax+eax*4],4
 004106AA    add         byte ptr [eax+eax*4],4
 004106AE    add         byte ptr [eax+eax*4],4
 004106B2    add         byte ptr [eax+eax*4],4
 004106B6    add         byte ptr [eax+eax*4],4
 004106BA    add         byte ptr [eax+eax*4],4
 004106BE    add         byte ptr [eax+eax*4],4
 004106C2    add         byte ptr [eax+eax*4],4
 004106C6    add         byte ptr [eax+eax*4],4
 004106CA    add         byte ptr [eax+eax*4],4
 004106CE    add         byte ptr [eax+eax*4],4
 004106D2    add         byte ptr [eax+eax*4],4
 004106D6    add         byte ptr [eax+eax*4],4
 004106DA    add         byte ptr [eax+eax*4],4
 004106DE    add         byte ptr [eax+eax*4],4
 004106E2    add         byte ptr [eax+eax*4],4
 004106E6    add         byte ptr [eax+eax*4],4
 004106EA    add         byte ptr [eax+eax*4],4
 004106EE    add         byte ptr [eax+eax*4],4
 004106F2    add         byte ptr [eax+eax*4],4
 004106F6    add         byte ptr [eax+eax*4],4
 004106FA    add         byte ptr [eax+eax*4],4
 004106FE    add         byte ptr [eax+eax*4],4
 00410702    add         byte ptr [eax+eax*4],4
 00410706    add         byte ptr [eax+eax*4],4
 0041070A    add         byte ptr [eax+eax*4],4
 0041070E    add         byte ptr [eax+eax*4],4
 00410712    add         byte ptr [eax+eax*4],4
 00410716    add         byte ptr [eax+eax*4],4
 0041071A    add         byte ptr [eax+eax*4],4
 0041071E    add         byte ptr [eax+eax*4],4
 00410722    add         byte ptr [eax+eax*4],4
 00410726    add         byte ptr [eax+eax*4],4
 0041072A    add         byte ptr [eax+eax*4],4
 0041072E    add         byte ptr [eax+eax*4],4
 00410732    add         byte ptr [eax+eax*4],4
 00410736    add         byte ptr [eax+eax*4],4
 0041073A    add         byte ptr [eax+eax*4],4
 0041073E    add         byte ptr [eax+eax*4],4
 00410742    add         byte ptr [eax+eax*4],4
 00410746    add         byte ptr [eax+eax*4],4
 0041074A    add         byte ptr [eax+eax*4],4
 0041074E    add         byte ptr [eax+eax*4],4
 00410752    add         byte ptr [eax+eax*4],4
 00410756    add         byte ptr [eax+eax*4],4
 0041075A    add         byte ptr [eax+eax*4],4
 0041075E    add         byte ptr [eax+eax*4],4
 00410762    add         byte ptr [eax+eax*4],4
 00410766    add         byte ptr [eax+eax*4],4
 0041076A    add         byte ptr [eax+eax*4],4
 0041076E    add         byte ptr [eax+eax*4],4
 00410772    add         byte ptr [eax+eax*4],4
 00410776    add         byte ptr [eax+eax*4],4
 0041077A    add         byte ptr [eax+eax*4],4
 0041077E    add         byte ptr [eax+eax*4],4
 00410782    add         byte ptr [eax+eax*4],4
 00410786    add         byte ptr [eax+eax*4],4
 0041078A    add         byte ptr [eax+eax*4],4
 0041078E    add         byte ptr [eax+eax*4],4
 00410792    add         byte ptr [eax+eax*4],4
 00410796    add         byte ptr [eax+eax*4],4
 0041079A    add         byte ptr [eax+eax*4],4
 0041079E    add         byte ptr [eax+eax*4],4
 004107A2    add         byte ptr [eax+eax*4],4
 004107A6    add         byte ptr [eax+eax*4],4
 004107AA    add         byte ptr [eax+eax*4],4
 004107AE    add         byte ptr [eax+eax*4],4
 004107B2    add         byte ptr [eax+eax*4],4
 004107B6    add         byte ptr [eax+eax*4],4
 004107BA    add         byte ptr [eax+eax*4],4
 004107BE    add         byte ptr [eax+eax*4],4
 004107C2    add         byte ptr [eax+eax*4],4
 004107C6    add         byte ptr [eax+eax*4],4
 004107CA    add         byte ptr [eax+eax*4],4
 004107CE    add         byte ptr [eax+eax*4],4
 004107D2    add         byte ptr [eax+eax*4],4
 004107D6    add         byte ptr [eax+eax*4],4
 004107DA    add         byte ptr [eax+eax*4],4
 004107DE    add         byte ptr [eax+eax*4],4
 004107E2    add         byte ptr [eax+eax*4],4
 004107E6    add         byte ptr [eax+eax*4],4
 004107EA    add         byte ptr [eax+eax*4],4
 004107EE    add         byte ptr [eax+eax*4],4
 004107F2    add         byte ptr [eax+eax*4],4
 004107F6    add         byte ptr [eax+eax*4],4
 004107FA    add         byte ptr [eax+eax*4],4
 004107FE    add         byte ptr [eax+eax*4],4
 00410802    add         byte ptr [eax+eax*4],4
 00410806    add         byte ptr [eax+eax*4],4
 0041080A    add         byte ptr [eax+eax*4],4
 0041080E    add         byte ptr [eax+eax*4],4
 00410812    add         byte ptr [eax+eax*4],4
 00410816    add         byte ptr [eax+eax*4],4
 0041081A    add         byte ptr [eax+eax*4],4
 0041081E    add         byte ptr [eax+eax*4],4
 00410822    add         byte ptr [eax+eax*4],4
 00410826    add         byte ptr [eax+eax*4],4
 0041082A    add         byte ptr [eax+eax*4],4
 0041082E    add         byte ptr [eax+eax*4],4
 00410832    add         byte ptr [eax+eax*4],4
 00410836    add         byte ptr [eax+eax*4],4
 0041083A    add         byte ptr [eax+eax*4],4
 0041083E    add         byte ptr [eax+eax*4],4
 00410842    add         byte ptr [eax+eax*4],4
 00410846    add         byte ptr [eax+eax*4],4
 0041084A    add         byte ptr [eax+eax*4],4
 0041084E    add         byte ptr [eax+eax*4],4
 00410852    add         byte ptr [eax+eax*4],4
 00410856    add         byte ptr [eax+eax*4],4
 0041085A    add         byte ptr [eax+eax*4],4
 0041085E    add         byte ptr [eax+eax*4],4
 00410862    add         byte ptr [eax+eax*4],4
 00410866    add         byte ptr [eax+eax*4],4
 0041086A    add         byte ptr [eax+eax*4],4
 0041086E    add         byte ptr [eax+eax*4],4
 00410872    add         byte ptr [eax+eax*4],4
 00410876    add         byte ptr [eax+eax*4],4
 0041087A    add         byte ptr [eax+eax*4],4
 0041087E    add         byte ptr [eax+eax*4],4
 00410882    add         byte ptr [eax+eax*4],4
 00410886    add         byte ptr [eax+eax*4],4
 0041088A    add         byte ptr [eax+eax*4],4
 0041088E    add         byte ptr [eax+eax*4],4
 00410892    add         byte ptr [eax+eax*4],4
 00410896    add         byte ptr [eax+eax*4],4
 0041089A    add         byte ptr [eax+eax*4],4
 0041089E    add         byte ptr [eax+eax*4],4
 004108A2    add         byte ptr [eax+eax*4],4
 004108A6    add         byte ptr [eax+eax*4],4
 004108AA    add         byte ptr [eax+eax*4],4
 004108AE    add         byte ptr [eax+eax*4],4
 004108B2    add         byte ptr [eax+eax*4],4
 004108B6    add         byte ptr [eax+eax*4],4
 004108BA    add         byte ptr [eax+eax*4],4
 004108BE    add         byte ptr [eax+eax*4],4
 004108C2    add         byte ptr [eax+eax*4],4
 004108C6    add         byte ptr [eax+eax*4],4
 004108CA    add         byte ptr [eax+eax*4],4
 004108CE    add         byte ptr [eax+eax*4],4
 004108D2    add         byte ptr [eax+eax*4],4
 004108D6    add         byte ptr [eax+eax*4],4
 004108DA    add         byte ptr [eax+eax*4],4
 004108DE    add         byte ptr [eax+eax*4],4
 004108E2    add         byte ptr [eax+eax*4],4
 004108E6    add         byte ptr [eax+eax*4],4
 004108EA    add         byte ptr [eax+eax*4],4
 004108EE    add         byte ptr [eax+eax*4],4
 004108F2    add         byte ptr [eax+eax*4],4
 004108F6    add         byte ptr [eax+eax*4],4
 004108FA    add         byte ptr [eax+eax*4],4
 004108FE    add         byte ptr [eax+eax*4],4
 00410902    add         byte ptr [eax+eax*4],4
 00410906    add         byte ptr [eax+eax*4],4
 0041090A    add         byte ptr [eax+eax*4],4
 0041090E    add         byte ptr [eax+eax*4],4
 00410912    add         byte ptr [eax+eax*4],4
 00410916    add         byte ptr [eax+eax*4],4
 0041091A    add         byte ptr [eax+eax*4],4
 0041091E    add         byte ptr [eax+eax*4],4
 00410922    add         byte ptr [eax+eax*4],4
 00410926    add         byte ptr [eax+eax*4],4
 0041092A    add         byte ptr [eax+eax*4],4
 0041092E    add         byte ptr [eax+eax*4],4
 00410932    add         byte ptr [eax+eax*4],4
 00410936    add         byte ptr [eax+eax*4],4
 0041093A    add         byte ptr [eax+eax*4],4
 0041093E    add         byte ptr [eax+eax*4],4
 00410942    add         byte ptr [eax+eax*4],4
 00410946    add         byte ptr [eax+eax*4],4
 0041094A    add         byte ptr [eax+eax*4],4
 0041094E    add         byte ptr [eax+eax*4],4
 00410952    add         byte ptr [eax+eax*4],4
 00410956    add         byte ptr [eax+eax*4],4
 0041095A    add         byte ptr [eax+eax*4],4
 0041095E    add         byte ptr [eax+eax*4],4
 00410962    add         byte ptr [eax+eax*4],4
 00410966    add         byte ptr [eax+eax*4],4
 0041096A    add         byte ptr [eax+eax*4],4
 0041096E    add         byte ptr [eax+eax*4],4
 00410972    add         byte ptr [eax+eax*4],4
 00410976    add         byte ptr [eax+eax*4],4
 0041097A    add         byte ptr [eax+eax*4],4
 0041097E    add         byte ptr [eax+eax*4],4
 00410982    add         byte ptr [eax+eax*4],4
 00410986    add         byte ptr [eax+eax*4],4
 0041098A    add         byte ptr [eax+eax*4],4
 0041098E    add         byte ptr [eax+eax*4],4
 00410992    add         byte ptr [eax+eax*4],4
 00410996    add         byte ptr [eax+eax*4],4
 0041099A    add         byte ptr [eax+eax*4],4
 0041099E    add         byte ptr [eax+eax*4],4
 004109A2    add         byte ptr [eax+eax*4],4
 004109A6    add         byte ptr [eax+eax*4],4
 004109AA    add         byte ptr [eax+eax*4],4
 004109AE    add         byte ptr [eax+eax*4],4
 004109B2    add         byte ptr [eax+eax*4],4
 004109B6    add         byte ptr [eax+eax*4],4
 004109BA    add         byte ptr [eax+eax*4],4
 004109BE    add         byte ptr [eax+eax*4],4
 004109C2    add         byte ptr [eax+eax*4],4
 004109C6    add         byte ptr [eax+eax*4],4
 004109CA    add         byte ptr [eax+eax*4],4
 004109CE    add         byte ptr [eax+eax*4],4
 004109D2    add         byte ptr [eax+eax*4],4
 004109D6    add         byte ptr [eax+eax*4],4
 004109DA    add         byte ptr [eax+eax*4],4
 004109DE    add         byte ptr [eax+eax*4],4
 004109E2    add         byte ptr [eax+eax*4],4
 004109E6    add         byte ptr [eax+eax*4],4
 004109EA    add         byte ptr [eax+eax*4],4
 004109EE    add         byte ptr [eax+eax*4],4
 004109F2    add         byte ptr [eax+eax*4],4
 004109F6    add         byte ptr [eax+eax*4],4
 004109FA    add         byte ptr [eax+eax*4],4
 004109FE    add         byte ptr [eax+eax*4],4
 00410A02    add         byte ptr [eax+eax*4],4
 00410A06    add         byte ptr [eax+eax*4],4
 00410A0A    add         byte ptr [eax+eax*4],4
 00410A0E    add         byte ptr [eax+eax*4],4
 00410A12    add         byte ptr [eax+eax*4],4
 00410A16    add         byte ptr [eax+eax*4],4
 00410A1A    add         byte ptr [eax+eax*4],4
 00410A1E    add         byte ptr [eax+eax*4],4
 00410A22    add         byte ptr [eax+eax*4],4
 00410A26    add         byte ptr [eax+eax*4],4
 00410A2A    add         byte ptr [eax+eax*4],4
 00410A2E    add         byte ptr [eax+eax*4],4
 00410A32    add         byte ptr [eax+eax*4],4
 00410A36    add         byte ptr [eax+eax*4],4
 00410A3A    add         byte ptr [eax+eax*4],4
 00410A3E    add         byte ptr [eax+eax*4],4
 00410A42    add         byte ptr [eax+eax*4],4
 00410A46    add         byte ptr [eax+eax*4],4
 00410A4A    add         byte ptr [eax+eax*4],4
 00410A4E    add         byte ptr [eax+eax*4],4
 00410A52    add         byte ptr [eax+eax*4],4
 00410A56    add         byte ptr [eax+eax*4],4
 00410A5A    add         byte ptr [eax+eax*4],4
 00410A5E    add         byte ptr [eax+eax*4],4
 00410A62    add         byte ptr [eax+eax*4],4
 00410A66    add         byte ptr [eax+eax*4],4
 00410A6A    add         byte ptr [eax+eax*4],4
 00410A6E    add         byte ptr [eax+eax*4],4
 00410A72    add         byte ptr [eax+eax*4],4
 00410A76    add         byte ptr [eax+eax*4],4
 00410A7A    add         byte ptr [eax+eax*4],4
 00410A7E    add         byte ptr [eax+eax*4],4
 00410A82    add         byte ptr [eax+eax*4],4
 00410A86    add         byte ptr [eax+eax*4],4
 00410A8A    add         byte ptr [eax+eax*4],4
 00410A8E    add         byte ptr [eax+eax*4],4
 00410A92    add         byte ptr [eax+eax*4],4
 00410A96    add         byte ptr [eax+eax*4],4
 00410A9A    add         byte ptr [eax+eax*4],4
 00410A9E    add         byte ptr [eax+eax*4],4
 00410AA2    add         byte ptr [eax+eax*4],4
 00410AA6    add         byte ptr [eax+eax*4],4
 00410AAA    add         byte ptr [eax+eax*4],4
 00410AAE    add         byte ptr [eax+eax*4],4
 00410AB2    add         byte ptr [eax+eax*4],4
 00410AB6    add         byte ptr [eax+eax*4],4
 00410ABA    add         byte ptr [eax+eax*4],4
 00410ABE    add         byte ptr [eax+eax*4],4
 00410AC2    add         byte ptr [eax+eax*4],4
 00410AC6    add         byte ptr [eax+eax*4],4
 00410ACA    add         byte ptr [eax+eax*4],4
 00410ACE    add         byte ptr [eax+eax*4],4
 00410AD2    add         byte ptr [eax+eax*4],4
 00410AD6    add         byte ptr [eax+eax*4],4
 00410ADA    add         byte ptr [eax+eax*4],4
 00410ADE    add         byte ptr [eax+eax*4],4
 00410AE2    add         byte ptr [eax+eax*4],4
 00410AE6    add         byte ptr [eax+eax*4],4
 00410AEA    add         byte ptr [eax+eax*4],4
 00410AEE    add         byte ptr [eax+eax*4],4
 00410AF2    add         byte ptr [eax+eax*4],4
 00410AF6    add         byte ptr [eax+eax*4],4
 00410AFA    add         byte ptr [eax+eax*4],4
 00410AFE    add         byte ptr [eax+eax*4],4
 00410B02    add         byte ptr [eax+eax*4],4
 00410B06    add         byte ptr [eax+eax*4],4
 00410B0A    add         byte ptr [eax+eax*4],4
 00410B0E    add         byte ptr [eax+eax*4],4
 00410B12    add         byte ptr [eax+eax*4],4
 00410B16    add         byte ptr [eax+eax*4],4
 00410B1A    add         byte ptr [eax+eax*4],4
 00410B1E    add         byte ptr [eax+eax*4],4
 00410B22    add         byte ptr [eax+eax*4],4
 00410B26    add         byte ptr [eax+eax*4],4
 00410B2A    add         byte ptr [eax+eax*4],4
 00410B2E    add         byte ptr [eax+eax*4],4
 00410B32    add         byte ptr [eax+eax*4],4
 00410B36    add         byte ptr [eax+eax*4],4
 00410B3A    add         byte ptr [eax+eax*4],4
 00410B3E    add         byte ptr [eax+eax*4],4
 00410B42    add         byte ptr [eax+eax*4],4
 00410B46    add         byte ptr [eax+eax*4],4
 00410B4A    add         byte ptr [eax+eax*4],4
 00410B4E    add         byte ptr [eax+eax*4],4
 00410B52    add         byte ptr [eax+eax*4],4
 00410B56    add         byte ptr [eax+eax*4],4
 00410B5A    add         byte ptr [eax+eax*4],4
 00410B5E    add         byte ptr [eax+eax*4],4
 00410B62    add         byte ptr [eax+eax*4],4
 00410B66    add         byte ptr [eax+eax*4],4
 00410B6A    add         byte ptr [eax+eax*4],4
 00410B6E    add         byte ptr [eax+eax*4],4
 00410B72    add         byte ptr [eax+eax*4],4
 00410B76    add         byte ptr [eax+eax*4],4
 00410B7A    add         byte ptr [eax+eax*4],4
 00410B7E    add         byte ptr [eax+eax*4],4
 00410B82    add         byte ptr [eax+eax*4],4
 00410B86    add         byte ptr [eax+eax*4],4
 00410B8A    add         byte ptr [eax+eax*4],4
 00410B8E    add         byte ptr [eax+eax*4],4
 00410B92    add         byte ptr [eax+eax*4],4
 00410B96    add         byte ptr [eax+eax*4],4
 00410B9A    add         byte ptr [eax+eax*4],4
 00410B9E    add         byte ptr [eax+eax*4],4
 00410BA2    add         byte ptr [eax+eax*4],4
 00410BA6    add         byte ptr [eax+eax*4],4
 00410BAA    add         byte ptr [eax+eax*4],4
 00410BAE    add         byte ptr [eax+eax*4],4
 00410BB2    add         byte ptr [eax+eax*4],4
 00410BB6    add         byte ptr [eax+eax*4],4
 00410BBA    add         byte ptr [eax+eax*4],4
 00410BBE    add         byte ptr [eax+eax*4],4
 00410BC2    add         byte ptr [eax+eax*4],4
 00410BC6    add         byte ptr [eax+eax*4],4
 00410BCA    add         byte ptr [eax+eax*4],4
 00410BCE    add         byte ptr [eax+eax*4],4
 00410BD2    add         byte ptr [eax+eax*4],4
 00410BD6    add         byte ptr [eax+eax*4],4
 00410BDA    add         byte ptr [eax+eax*4],4
 00410BDE    add         byte ptr [eax+eax*4],4
 00410BE2    add         byte ptr [eax+eax*4],4
 00410BE6    add         byte ptr [eax+eax*4],4
 00410BEA    add         byte ptr [eax+eax*4],4
 00410BEE    add         byte ptr [eax+eax*4],4
 00410BF2    add         byte ptr [eax+eax*4],4
 00410BF6    add         byte ptr [eax+eax*4],4
 00410BFA    add         byte ptr [eax+eax*4],4
 00410BFE    add         byte ptr [eax+eax*4],4
 00410C02    add         byte ptr [eax+eax*4],4
 00410C06    add         byte ptr [eax+eax*4],4
 00410C0A    add         byte ptr [eax+eax*4],4
 00410C0E    add         byte ptr [eax+eax*4],4
 00410C12    add         byte ptr [eax+eax*4],4
 00410C16    add         byte ptr [eax+eax*4],4
 00410C1A    add         byte ptr [eax+eax*4],4
 00410C1E    add         byte ptr [eax+eax*4],4
 00410C22    add         byte ptr [eax+eax*4],4
 00410C26    add         byte ptr [eax+eax*4],4
 00410C2A    add         byte ptr [eax+eax*4],4
 00410C2E    add         byte ptr [eax+eax*4],4
 00410C32    add         byte ptr [eax+eax*4],4
 00410C36    add         byte ptr [eax+eax*4],4
 00410C3A    add         byte ptr [eax+eax*4],4
 00410C3E    add         byte ptr [eax+eax*4],4
 00410C42    add         byte ptr [eax+eax*4],4
 00410C46    add         byte ptr [eax+eax*4],4
 00410C4A    add         byte ptr [eax+eax*4],4
 00410C4E    add         byte ptr [eax+eax*4],4
 00410C52    add         byte ptr [eax+eax*4],4
 00410C56    add         byte ptr [eax+eax*4],4
 00410C5A    add         byte ptr [eax+eax*4],4
 00410C5E    add         byte ptr [eax+eax*4],4
 00410C62    add         byte ptr [eax+eax*4],4
 00410C66    add         byte ptr [eax+eax*4],4
 00410C6A    add         byte ptr [eax+eax*4],4
 00410C6E    add         byte ptr [eax+eax*4],4
 00410C72    add         byte ptr [eax+eax*4],4
 00410C76    add         byte ptr [eax+eax*4],4
 00410C7A    add         byte ptr [eax+eax*4],4
 00410C7E    add         byte ptr [eax+eax*4],4
 00410C82    add         byte ptr [eax+eax*4],4
 00410C86    add         byte ptr [eax+eax*4],4
 00410C8A    add         byte ptr [eax+eax*4],4
 00410C8E    add         byte ptr [eax+eax*4],4
 00410C92    add         byte ptr [eax+eax*4],4
 00410C96    add         byte ptr [eax+eax*4],4
 00410C9A    add         byte ptr [eax+eax*4],4
 00410C9E    add         byte ptr [eax+eax*4],4
 00410CA2    add         byte ptr [eax+eax*4],4
 00410CA6    add         byte ptr [eax+eax*4],4
 00410CAA    add         byte ptr [eax+eax*4],4
 00410CAE    add         byte ptr [eax+eax*4],4
 00410CB2    add         byte ptr [eax+eax*4],4
 00410CB6    add         byte ptr [eax+eax*4],4
 00410CBA    add         byte ptr [eax+eax*4],4
 00410CBE    add         byte ptr [eax+eax*4],4
 00410CC2    add         byte ptr [eax+eax*4],4
 00410CC6    add         byte ptr [eax+eax*4],4
 00410CCA    add         byte ptr [eax+eax*4],4
 00410CCE    add         byte ptr [eax+eax*4],4
 00410CD2    add         byte ptr [eax+eax*4],4
 00410CD6    add         byte ptr [eax+eax*4],4
 00410CDA    add         byte ptr [eax+eax*4],4
 00410CDE    add         byte ptr [eax+eax*4],4
 00410CE2    add         byte ptr [eax+eax*4],4
 00410CE6    add         byte ptr [eax+eax*4],4
 00410CEA    add         byte ptr [eax+eax*4],4
 00410CEE    add         byte ptr [eax+eax*4],4
 00410CF2    add         byte ptr [eax+eax*4],4
 00410CF6    add         byte ptr [eax+eax*4],4
 00410CFA    add         byte ptr [eax+eax*4],4
 00410CFE    add         byte ptr [eax+eax*4],4
 00410D02    add         byte ptr [eax+eax*4],4
 00410D06    add         byte ptr [eax+eax*4],4
 00410D0A    add         byte ptr [eax+eax*4],4
 00410D0E    add         byte ptr [eax+eax*4],4
 00410D12    add         byte ptr [eax+eax*4],4
 00410D16    add         byte ptr [eax+eax*4],4
 00410D1A    add         byte ptr [eax+eax*4],4
 00410D1E    add         byte ptr [eax+eax*4],4
 00410D22    add         byte ptr [eax+eax*4],4
 00410D26    add         byte ptr [eax+eax*4],4
 00410D2A    add         byte ptr [eax+eax*4],4
 00410D2E    add         byte ptr [eax+eax*4],4
 00410D32    add         byte ptr [eax+eax*4],4
 00410D36    add         byte ptr [eax+eax*4],4
 00410D3A    add         byte ptr [eax+eax*4],4
 00410D3E    add         byte ptr [eax+eax*4],4
 00410D42    add         byte ptr [eax+eax*4],4
 00410D46    add         byte ptr [eax+eax*4],4
 00410D4A    add         byte ptr [eax+eax*4],4
 00410D4E    add         byte ptr [eax+eax*4],4
 00410D52    add         byte ptr [eax+eax*4],4
 00410D56    add         byte ptr [eax+eax*4],4
 00410D5A    add         byte ptr [eax+eax*4],4
 00410D5E    add         byte ptr [eax+eax*4],4
 00410D62    add         byte ptr [eax+eax*4],4
 00410D66    add         byte ptr [eax+eax*4],4
 00410D6A    add         byte ptr [eax+eax*4],4
 00410D6E    add         byte ptr [eax+eax*4],4
 00410D72    add         byte ptr [eax+eax*4],4
 00410D76    add         byte ptr [eax+eax*4],4
 00410D7A    add         byte ptr [eax+eax*4],4
 00410D7E    add         byte ptr [eax+eax*4],4
 00410D82    add         byte ptr [eax+eax*4],4
 00410D86    add         byte ptr [eax+eax*4],4
 00410D8A    add         byte ptr [eax+eax*4],4
 00410D8E    add         byte ptr [eax+eax*4],4
 00410D92    add         byte ptr [eax+eax*4],4
 00410D96    add         byte ptr [eax+eax*4],4
 00410D9A    add         byte ptr [eax+eax*4],4
 00410D9E    add         byte ptr [eax+eax*4],4
 00410DA2    add         byte ptr [eax+eax*4],4
 00410DA6    add         byte ptr [eax+eax*4],4
 00410DAA    add         byte ptr [eax+eax*4],4
 00410DAE    add         byte ptr [eax+eax*4],4
 00410DB2    add         byte ptr [eax+eax*4],4
 00410DB6    add         byte ptr [eax+eax*4],4
 00410DBA    add         byte ptr [eax+eax*4],4
 00410DBE    add         byte ptr [eax+eax*4],4
 00410DC2    add         byte ptr [eax+eax*4],4
 00410DC6    add         byte ptr [eax+eax*4],4
 00410DCA    add         byte ptr [eax+eax*4],4
 00410DCE    add         byte ptr [eax+eax*4],4
 00410DD2    add         byte ptr [eax+eax*4],4
 00410DD6    add         byte ptr [eax+eax*4],4
 00410DDA    add         byte ptr [eax+eax*4],4
 00410DDE    add         byte ptr [eax+eax*4],4
 00410DE2    add         byte ptr [eax+eax*4],4
 00410DE6    add         byte ptr [eax+eax*4],4
 00410DEA    add         byte ptr [eax+eax*4],4
 00410DEE    add         byte ptr [eax+eax*4],4
 00410DF2    add         byte ptr [eax+eax*4],4
 00410DF6    add         byte ptr [eax+eax*4],4
 00410DFA    add         byte ptr [eax+eax*4],4
 00410DFE    add         byte ptr [eax+eax*4],4
 00410E02    add         byte ptr [eax+eax*4],4
 00410E06    add         byte ptr [eax+eax*4],4
 00410E0A    add         byte ptr [eax+eax*4],4
 00410E0E    add         byte ptr [eax+eax*4],4
 00410E12    add         byte ptr [eax+eax*4],4
 00410E16    add         byte ptr [eax+eax*4],4
 00410E1A    add         byte ptr [eax+eax*4],4
 00410E1E    add         byte ptr [eax+eax*4],4
 00410E22    add         byte ptr [eax+eax*4],4
 00410E26    add         byte ptr [eax+eax*4],4
 00410E2A    add         byte ptr [eax+eax*4],4
 00410E2E    add         byte ptr [eax+eax*4],4
 00410E32    add         byte ptr [eax+eax*4],4
 00410E36    add         byte ptr [eax+eax*4],4
 00410E3A    add         byte ptr [eax+eax*4],4
 00410E3E    add         byte ptr [eax+eax*4],4
 00410E42    add         byte ptr [eax+eax*4],4
 00410E46    add         byte ptr [eax+eax*4],4
 00410E4A    add         byte ptr [eax+eax*4],4
 00410E4E    add         byte ptr [eax+eax*4],4
 00410E52    add         byte ptr [eax+eax*4],4
 00410E56    add         byte ptr [eax+eax*4],4
 00410E5A    add         byte ptr [eax+eax*4],4
 00410E5E    add         byte ptr [eax+eax*4],4
 00410E62    add         byte ptr [eax+eax*4],4
 00410E66    add         byte ptr [eax+eax*4],4
 00410E6A    add         byte ptr [eax+eax*4],4
 00410E6E    add         byte ptr [eax+eax*4],4
 00410E72    add         byte ptr [eax+eax*4],4
 00410E76    add         byte ptr [eax+eax*4],4
 00410E7A    add         byte ptr [eax+eax*4],4
 00410E7E    add         byte ptr [eax+eax*4],4
 00410E82    add         byte ptr [eax+eax*4],4
 00410E86    add         byte ptr [eax+eax*4],4
 00410E8A    add         byte ptr [eax+eax*4],4
 00410E8E    add         byte ptr [eax+eax*4],4
 00410E92    add         byte ptr [eax+eax*4],4
 00410E96    add         byte ptr [eax+eax*4],4
 00410E9A    add         byte ptr [eax+eax*4],4
 00410E9E    add         byte ptr [eax+eax*4],4
 00410EA2    add         byte ptr [eax+eax*4],4
 00410EA6    add         byte ptr [eax+eax*4],4
 00410EAA    add         byte ptr [eax+eax*4],4
 00410EAE    add         byte ptr [eax+eax*4],4
 00410EB2    add         byte ptr [eax+eax*4],4
 00410EB6    add         byte ptr [eax+eax*4],4
 00410EBA    add         byte ptr [eax+eax*4],4
 00410EBE    add         byte ptr [eax+eax*4],4
 00410EC2    add         byte ptr [eax+eax*4],4
 00410EC6    add         byte ptr [eax+eax*4],4
 00410ECA    add         byte ptr [eax+eax*4],4
 00410ECE    add         byte ptr [eax+eax*4],4
 00410ED2    add         byte ptr [eax+eax*4],4
 00410ED6    add         byte ptr [eax+eax*4],4
 00410EDA    add         byte ptr [eax+eax*4],4
 00410EDE    add         byte ptr [eax+eax*4],4
 00410EE2    add         byte ptr [eax+eax*4],4
 00410EE6    add         byte ptr [eax+eax*4],4
 00410EEA    add         byte ptr [eax+eax*4],4
 00410EEE    add         byte ptr [eax+eax*4],4
 00410EF2    add         byte ptr [eax+eax*4],4
 00410EF6    add         byte ptr [eax+eax*4],4
 00410EFA    add         byte ptr [eax+eax*4],4
 00410EFE    add         byte ptr [eax+eax*4],4
 00410F02    add         byte ptr [eax+eax*4],4
 00410F06    add         byte ptr [eax+eax*4],4
 00410F0A    add         byte ptr [eax+eax*4],4
 00410F0E    add         byte ptr [eax+eax*4],4
 00410F12    add         byte ptr [eax+eax*4],4
 00410F16    add         byte ptr [eax+eax*4],4
 00410F1A    add         byte ptr [eax+eax*4],4
 00410F1E    add         byte ptr [eax+eax*4],4
 00410F22    add         byte ptr [eax+eax*4],4
 00410F26    add         byte ptr [eax+eax*4],4
 00410F2A    add         byte ptr [eax+eax*4],4
 00410F2E    add         byte ptr [eax+eax*4],4
 00410F32    add         byte ptr [eax+eax*4],4
 00410F36    add         byte ptr [eax+eax*4],4
 00410F3A    add         byte ptr [eax+eax*4],4
 00410F3E    add         byte ptr [eax+eax*4],4
 00410F42    add         byte ptr [eax+eax*4],4
 00410F46    add         byte ptr [eax+eax*4],4
 00410F4A    add         byte ptr [eax+eax*4],4
 00410F4E    add         byte ptr [eax+eax*4],4
 00410F52    add         byte ptr [eax+eax*4],4
 00410F56    add         byte ptr [eax+eax*4],4
 00410F5A    add         byte ptr [eax+eax*4],4
 00410F5E    add         byte ptr [eax+eax*4],4
 00410F62    add         byte ptr [eax+eax*4],4
 00410F66    add         byte ptr [eax+eax*4],4
 00410F6A    add         byte ptr [eax+eax*4],4
 00410F6E    add         byte ptr [eax+eax*4],4
 00410F72    add         byte ptr [eax+eax*4],4
 00410F76    add         byte ptr [eax+eax*4],4
 00410F7A    add         byte ptr [eax+eax*4],4
 00410F7E    add         byte ptr [eax+eax*4],4
 00410F82    add         byte ptr [eax+eax*4],4
 00410F86    add         byte ptr [eax+eax*4],4
 00410F8A    add         byte ptr [eax+eax*4],4
 00410F8E    add         byte ptr [eax+eax*4],4
 00410F92    add         byte ptr [eax+eax*4],4
 00410F96    add         byte ptr [eax+eax*4],4
 00410F9A    add         byte ptr [eax+eax*4],4
 00410F9E    add         byte ptr [eax+eax*4],4
 00410FA2    add         byte ptr [eax+eax*4],4
 00410FA6    add         byte ptr [eax+eax*4],4
 00410FAA    add         byte ptr [eax+eax*4],4
 00410FAE    add         byte ptr [eax+eax*4],4
 00410FB2    add         byte ptr [eax+eax*4],4
 00410FB6    add         byte ptr [eax+eax*4],4
 00410FBA    add         byte ptr [eax+eax*4],4
 00410FBE    add         byte ptr [eax+eax*4],4
 00410FC2    add         byte ptr [eax+eax*4],4
 00410FC6    add         byte ptr [eax+eax*4],4
 00410FCA    add         byte ptr [eax+eax*4],4
 00410FCE    add         byte ptr [eax+eax*4],4
 00410FD2    add         byte ptr [eax+eax*4],4
 00410FD6    add         byte ptr [eax+eax*4],4
 00410FDA    add         byte ptr [eax+eax*4],4
 00410FDE    add         byte ptr [eax+eax*4],4
 00410FE2    add         byte ptr [eax+eax*4],4
 00410FE6    add         byte ptr [eax+eax*4],4
 00410FEA    add         byte ptr [eax+eax*4],4
 00410FEE    add         byte ptr [eax+eax*4],4
 00410FF2    add         byte ptr [eax+eax*4],4
 00410FF6    add         byte ptr [eax+eax*4],4
 00410FFA    add         byte ptr [eax+eax*4],4
 00410FFE    add         byte ptr [eax+eax*4],4
 00411002    add         byte ptr [eax+eax*4],4
 00411006    add         byte ptr [eax+eax*4],4
 0041100A    add         byte ptr [eax+eax*4],4
 0041100E    add         byte ptr [eax+eax*4],4
 00411012    add         byte ptr [eax+eax*4],4
 00411016    add         byte ptr [eax+eax*4],4
 0041101A    add         byte ptr [eax+eax*4],4
 0041101E    add         byte ptr [eax+eax*4],4
 00411022    add         byte ptr [eax+eax*4],4
 00411026    add         byte ptr [eax+eax*4],4
 0041102A    add         byte ptr [eax+eax*4],4
 0041102E    add         byte ptr [eax+eax*4],4
 00411032    add         byte ptr [eax+eax*4],4
 00411036    add         byte ptr [eax+eax*4],4
 0041103A    add         byte ptr [eax+eax*4],4
 0041103E    add         byte ptr [eax+eax*4],4
 00411042    add         byte ptr [eax+eax*4],4
 00411046    add         byte ptr [eax+eax*4],4
 0041104A    add         byte ptr [eax+eax*4],4
 0041104E    add         byte ptr [eax+eax*4],4
 00411052    add         byte ptr [eax+eax*4],4
 00411056    add         byte ptr [eax+eax*4],4
 0041105A    add         byte ptr [eax+eax*4],4
 0041105E    add         byte ptr [eax+eax*4],4
 00411062    add         byte ptr [eax+eax*4],4
 00411066    add         byte ptr [eax+eax*4],4
 0041106A    add         byte ptr [eax+eax*4],4
 0041106E    add         byte ptr [eax+eax*4],4
 00411072    add         byte ptr [eax+eax*4],4
 00411076    add         byte ptr [eax+eax*4],4
 0041107A    add         byte ptr [eax+eax*4],4
 0041107E    add         byte ptr [eax+eax*4],4
 00411082    add         byte ptr [eax+eax*4],4
 00411086    add         byte ptr [eax+eax*4],4
 0041108A    add         byte ptr [eax+eax*4],4
 0041108E    add         byte ptr [eax+eax*4],4
 00411092    add         byte ptr [eax+eax*4],4
 00411096    add         byte ptr [eax+eax*4],4
 0041109A    add         byte ptr [eax+eax*4],4
 0041109E    add         byte ptr [eax+eax*4],4
 004110A2    add         byte ptr [eax+eax*4],4
 004110A6    add         byte ptr [eax+eax*4],4
 004110AA    add         byte ptr [eax+eax*4],4
 004110AE    add         byte ptr [eax+eax*4],4
 004110B2    add         byte ptr [eax+eax*4],4
 004110B6    add         byte ptr [eax+eax*4],4
 004110BA    add         byte ptr [eax+eax*4],4
 004110BE    add         byte ptr [eax+eax*4],4
 004110C2    add         byte ptr [eax+eax*4],4
 004110C6    add         byte ptr [eax+eax*4],4
 004110CA    add         byte ptr [eax+eax*4],4
 004110CE    add         byte ptr [eax+eax*4],4
 004110D2    add         byte ptr [eax+eax*4],4
 004110D6    add         byte ptr [eax+eax*4],4
 004110DA    add         byte ptr [eax+eax*4],4
 004110DE    add         byte ptr [eax+eax*4],4
 004110E2    add         byte ptr [eax+eax*4],4
 004110E6    add         byte ptr [eax+eax*4],4
 004110EA    add         byte ptr [eax+eax*4],4
 004110EE    add         byte ptr [eax+eax*4],4
 004110F2    add         byte ptr [eax+eax*4],4
 004110F6    add         byte ptr [eax+eax*4],4
 004110FA    add         byte ptr [eax+eax*4],4
 004110FE    add         byte ptr [eax+eax*4],4
 00411102    add         byte ptr [eax+eax*4],4
 00411106    add         byte ptr [eax+eax*4],4
 0041110A    add         byte ptr [eax+eax*4],4
 0041110E    add         byte ptr [eax+eax*4],4
 00411112    add         byte ptr [eax+eax*4],4
 00411116    add         byte ptr [eax+eax*4],4
 0041111A    add         byte ptr [eax+eax*4],4
 0041111E    add         byte ptr [eax+eax*4],4
 00411122    add         byte ptr [eax+edx],6
 00411126    and         byte ptr [esi],al
 00411128    add         byte ptr [eax+eax*4],4
 0041112C    add         byte ptr [eax+eax*4],4
 00411130    add         byte ptr [eax+eax*4],4
 00411134    add         byte ptr [eax+eax*4],4
 00411138    add         byte ptr [eax+eax*4],4
 0041113C    add         byte ptr [eax+eax*4],4
 00411140    add         byte ptr [eax+eax*4],4
 00411144    add         byte ptr [eax+eax*4],4
 00411148    add         byte ptr [eax+eax*4],4
 0041114C    add         byte ptr [eax+eax*4],4
 00411150    add         byte ptr [eax+eax*4],4
 00411154    add         byte ptr [eax+eax*4],4
 00411158    add         byte ptr [eax+eax*4],4
 0041115C    add         byte ptr [eax+eax*4],4
 00411160    add         byte ptr [eax+eax*4],4
 00411164    add         byte ptr [eax+eax*4],4
 00411168    add         byte ptr [eax+eax*4],4
 0041116C    add         byte ptr [eax+eax*4],4
 00411170    add         byte ptr [eax+eax*4],4
 00411174    add         byte ptr [eax+eax*4],4
 00411178    add         byte ptr [eax+eax*4],4
 0041117C    add         byte ptr [eax+eax*4],4
 00411180    add         byte ptr [eax+eax*4],4
 00411184    add         byte ptr [eax+eax*4],4
 00411188    add         byte ptr [eax+eax*4],4
 0041118C    add         byte ptr [eax+eax*4],4
 00411190    add         byte ptr [eax+eax*4],4
 00411194    add         byte ptr [eax+eax*4],4
 00411198    add         byte ptr [eax+eax*4],4
 0041119C    add         byte ptr [eax+eax*4],4
 004111A0    add         byte ptr [eax+eax*4],4
 004111A4    add         byte ptr [eax+eax*4],4
 004111A8    add         byte ptr [eax+eax*4],4
 004111AC    add         byte ptr [eax+eax*4],4
 004111B0    add         byte ptr [eax+eax*4],4
 004111B4    add         byte ptr [eax+eax*4],4
 004111B8    add         byte ptr [eax+eax*4],4
 004111BC    add         byte ptr [eax+eax*4],4
 004111C0    add         byte ptr [eax+eax*4],4
 004111C4    add         byte ptr [eax+eax*4],4
 004111C8    add         byte ptr [eax+eax*4],4
 004111CC    add         byte ptr [eax+eax*4],4
 004111D0    add         byte ptr [eax+eax*4],4
 004111D4    add         byte ptr [eax+eax*4],4
 004111D8    add         byte ptr [eax+eax*4],4
 004111DC    add         byte ptr [eax+eax*4],4
 004111E0    add         byte ptr [eax+eax*4],4
 004111E4    add         byte ptr [eax+eax*4],4
 004111E8    add         byte ptr [eax+eax*4],4
 004111EC    add         byte ptr [eax+eax*4],4
 004111F0    add         byte ptr [eax+eax*4],4
 004111F4    add         byte ptr [eax+eax*4],4
 004111F8    add         byte ptr [eax+eax*4],4
 004111FC    add         byte ptr [eax+eax*4],4
 00411200    add         byte ptr [eax+eax*4],4
 00411204    add         byte ptr [eax+eax*4],4
 00411208    add         byte ptr [eax+eax*4],4
 0041120C    add         byte ptr [eax+eax*4],4
 00411210    add         byte ptr [eax+eax*4],4
 00411214    add         byte ptr [eax+eax*4],4
 00411218    add         byte ptr [eax+eax*4],4
 0041121C    add         byte ptr [eax+eax*4],4
 00411220    add         byte ptr [eax+eax*4],4
 00411224    add         byte ptr [eax+eax*4],4
 00411228    add         byte ptr [eax+eax*4],4
 0041122C    add         byte ptr [eax+eax*4],4
 00411230    add         byte ptr [eax+eax*4],4
 00411234    add         byte ptr [eax+eax*4],4
 00411238    add         byte ptr [eax+eax*4],4
 0041123C    add         byte ptr [eax+eax*4],4
 00411240    add         byte ptr [eax+eax*4],4
 00411244    add         byte ptr [eax+eax*4],4
 00411248    add         byte ptr [eax+eax*4],4
 0041124C    add         byte ptr [eax+eax*4],4
 00411250    add         byte ptr [eax+eax*4],4
 00411254    add         byte ptr [eax+eax*4],4
 00411258    add         byte ptr [eax+eax*4],4
 0041125C    add         byte ptr [eax+eax*4],4
 00411260    add         byte ptr [eax+eax*4],4
 00411264    add         byte ptr [eax+eax*4],4
 00411268    add         byte ptr [eax+eax*4],4
 0041126C    add         byte ptr [eax+eax*4],4
 00411270    add         byte ptr [eax+eax*4],4
 00411274    add         byte ptr [eax+eax*4],4
 00411278    add         byte ptr [eax+eax*4],4
 0041127C    add         byte ptr [eax+eax*4],4
 00411280    add         byte ptr [eax+eax*4],4
 00411284    add         byte ptr [eax+eax*4],4
 00411288    add         byte ptr [eax+eax*4],4
 0041128C    add         byte ptr [eax+eax*4],4
 00411290    add         byte ptr [eax+eax*4],4
 00411294    add         byte ptr [eax+eax*4],4
 00411298    add         byte ptr [eax+eax*4],4
 0041129C    add         byte ptr [eax+eax*4],4
 004112A0    add         byte ptr [eax+eax*4],4
 004112A4    add         byte ptr [eax+eax*4],4
 004112A8    add         byte ptr [eax+eax*4],4
 004112AC    add         byte ptr [eax+eax*4],4
 004112B0    add         byte ptr [eax+eax*4],4
 004112B4    add         byte ptr [eax+eax*4],4
 004112B8    add         byte ptr [eax+eax*4],4
 004112BC    add         byte ptr [eax+eax*4],4
 004112C0    add         byte ptr [eax+eax*4],4
 004112C4    add         byte ptr [eax+eax*4],4
 004112C8    add         byte ptr [eax+eax*4],4
 004112CC    add         byte ptr [eax+eax*4],4
 004112D0    add         byte ptr [eax+eax*4],4
 004112D4    add         byte ptr [eax+eax*4],4
 004112D8    add         byte ptr [eax+eax*4],4
 004112DC    add         byte ptr [eax+eax*4],4
 004112E0    add         byte ptr [eax+eax*4],4
 004112E4    add         byte ptr [eax+eax*4],4
 004112E8    add         byte ptr [eax+eax*4],4
 004112EC    add         byte ptr [eax+eax*4],4
 004112F0    add         byte ptr [eax+eax*4],4
 004112F4    add         byte ptr [eax+eax*4],4
 004112F8    add         byte ptr [eax+eax*4],4
 004112FC    add         byte ptr [eax+eax*4],4
 00411300    add         byte ptr [eax+eax*4],4
 00411304    add         byte ptr [eax+eax*4],4
 00411308    add         byte ptr [eax+eax*4],4
 0041130C    add         byte ptr [eax+eax*4],4
 00411310    add         byte ptr [eax+eax*4],4
 00411314    add         byte ptr [eax+eax*4],4
 00411318    add         byte ptr [eax+eax*4],4
 0041131C    add         byte ptr [eax+eax*4],4
 00411320    add         byte ptr [eax+eax*4],4
 00411324    rol         byte ptr [ebx],1
 00411326    rol         byte ptr [ebx],1
 00411328    rol         byte ptr [ebx],1
 0041132A    rol         byte ptr [ebx],1
 0041132C    rol         byte ptr [ebx],1
 0041132E    rol         byte ptr [ebx],1
 00411330    rol         byte ptr [ebx],1
 00411332    rol         byte ptr [ebx],1
 00411334    rol         byte ptr [ebx],1
 00411336    rol         byte ptr [ebx],1
 00411338    rol         byte ptr [ebx],1
 0041133A    rol         byte ptr [ebx],1
 0041133C    rol         byte ptr [ebx],1
 0041133E    rol         byte ptr [ebx],1
 00411340    rol         byte ptr [ebx],1
 00411342    rol         byte ptr [ebx],1
 00411344    rol         byte ptr [ebx],1
 00411346    rol         byte ptr [ebx],1
 00411348    rol         byte ptr [ebx],1
 0041134A    rol         byte ptr [ebx],1
 0041134C    rol         byte ptr [ebx],1
 0041134E    rol         byte ptr [ebx],1
 00411350    rol         byte ptr [ebx],1
 00411352    rol         byte ptr [ebx],1
 00411354    rol         byte ptr [ebx],1
 00411356    rol         byte ptr [ebx],1
 00411358    rol         byte ptr [ebx],1
 0041135A    rol         byte ptr [ebx],1
 0041135C    rol         byte ptr [ebx],1
 0041135E    rol         byte ptr [ebx],1
 00411360    rol         byte ptr [ebx],1
 00411362    rol         byte ptr [ebx],1
 00411364    rol         byte ptr [ebx],1
 00411366    rol         byte ptr [ebx],1
 00411368    rol         byte ptr [ebx],1
 0041136A    rol         byte ptr [ebx],1
 0041136C    rol         byte ptr [ebx],1
 0041136E    rol         byte ptr [ebx],1
 00411370    rol         byte ptr [ebx],1
 00411372    rol         byte ptr [ebx],1
 00411374    rol         byte ptr [ebx],1
 00411376    rol         byte ptr [ebx],1
 00411378    rol         byte ptr [ebx],1
 0041137A    rol         byte ptr [ebx],1
 0041137C    rol         byte ptr [ebx],1
 0041137E    rol         byte ptr [ebx],1
 00411380    rol         byte ptr [ebx],1
 00411382    rol         byte ptr [ebx],1
 00411384    rol         byte ptr [ebx],1
 00411386    rol         byte ptr [ebx],1
 00411388    rol         byte ptr [ebx],1
 0041138A    rol         byte ptr [ebx],1
 0041138C    rol         byte ptr [ebx],1
 0041138E    rol         byte ptr [ebx],1
 00411390    rol         byte ptr [ebx],1
 00411392    rol         byte ptr [ebx],1
 00411394    rol         byte ptr [ebx],1
 00411396    rol         byte ptr [ebx],1
 00411398    rol         byte ptr [ebx],1
 0041139A    rol         byte ptr [ebx],1
 0041139C    rol         byte ptr [ebx],1
 0041139E    rol         byte ptr [ebx],1
 004113A0    rol         byte ptr [ebx],1
 004113A2    rol         byte ptr [ebx],1
 004113A4    rol         byte ptr [ebx],1
 004113A6    rol         byte ptr [ebx],1
 004113A8    rol         byte ptr [ebx],1
 004113AA    rol         byte ptr [ebx],1
 004113AC    rol         byte ptr [ebx],1
 004113AE    rol         byte ptr [ebx],1
 004113B0    rol         byte ptr [ebx],1
 004113B2    rol         byte ptr [ebx],1
 004113B4    rol         byte ptr [ebx],1
 004113B6    rol         byte ptr [ebx],1
 004113B8    rol         byte ptr [ebx],1
 004113BA    rol         byte ptr [ebx],1
 004113BC    rol         byte ptr [ebx],1
 004113BE    rol         byte ptr [ebx],1
 004113C0    rol         byte ptr [ebx],1
 004113C2    rol         byte ptr [ebx],1
 004113C4    rol         byte ptr [ebx],1
 004113C6    rol         byte ptr [ebx],1
 004113C8    rol         byte ptr [ebx],1
 004113CA    rol         byte ptr [ebx],1
 004113CC    rol         byte ptr [ebx],1
 004113CE    rol         byte ptr [ebx],1
 004113D0    rol         byte ptr [ebx],1
 004113D2    rol         byte ptr [ebx],1
 004113D4    rol         byte ptr [ebx],1
 004113D6    rol         byte ptr [ebx],1
 004113D8    rol         byte ptr [ebx],1
 004113DA    rol         byte ptr [ebx],1
 004113DC    rol         byte ptr [ebx],1
 004113DE    rol         byte ptr [ebx],1
 004113E0    rol         byte ptr [ebx],1
 004113E2    rol         byte ptr [ebx],1
 004113E4    rol         byte ptr [ebx],1
 004113E6    rol         byte ptr [ebx],1
 004113E8    rol         byte ptr [ebx],1
 004113EA    rol         byte ptr [ebx],1
 004113EC    rol         byte ptr [ebx],1
 004113EE    rol         byte ptr [ebx],1
 004113F0    rol         byte ptr [ebx],1
 004113F2    rol         byte ptr [ebx],1
 004113F4    rol         byte ptr [ebx],1
 004113F6    rol         byte ptr [ebx],1
 004113F8    rol         byte ptr [ebx],1
 004113FA    rol         byte ptr [ebx],1
 004113FC    rol         byte ptr [ebx],1
 004113FE    rol         byte ptr [ebx],1
 00411400    rol         byte ptr [ebx],1
 00411402    rol         byte ptr [ebx],1
 00411404    rol         byte ptr [ebx],1
 00411406    rol         byte ptr [ebx],1
 00411408    rol         byte ptr [ebx],1
 0041140A    rol         byte ptr [ebx],1
 0041140C    rol         byte ptr [ebx],1
 0041140E    rol         byte ptr [ebx],1
 00411410    rol         byte ptr [ebx],1
 00411412    rol         byte ptr [ebx],1
 00411414    rol         byte ptr [ebx],1
 00411416    rol         byte ptr [ebx],1
 00411418    rol         byte ptr [ebx],1
 0041141A    rol         byte ptr [ebx],1
 0041141C    rol         byte ptr [ebx],1
 0041141E    rol         byte ptr [ebx],1
 00411420    rol         byte ptr [ebx],1
 00411422    rol         byte ptr [ebx],1
 00411424    rol         byte ptr [ebx],1
 00411426    rol         byte ptr [ebx],1
 00411428    rol         byte ptr [ebx],1
 0041142A    rol         byte ptr [ebx],1
 0041142C    rol         byte ptr [ebx],1
 0041142E    rol         byte ptr [ebx],1
 00411430    rol         byte ptr [ebx],1
 00411432    rol         byte ptr [ebx],1
 00411434    rol         byte ptr [ebx],1
 00411436    rol         byte ptr [ebx],1
 00411438    rol         byte ptr [ebx],1
 0041143A    rol         byte ptr [ebx],1
 0041143C    rol         byte ptr [ebx],1
 0041143E    rol         byte ptr [ebx],1
 00411440    rol         byte ptr [ebx],1
 00411442    rol         byte ptr [ebx],1
 00411444    rol         byte ptr [ebx],1
 00411446    rol         byte ptr [ebx],1
 00411448    rol         byte ptr [ebx],1
 0041144A    rol         byte ptr [ebx],1
 0041144C    rol         byte ptr [ebx],1
 0041144E    rol         byte ptr [ebx],1
 00411450    rol         byte ptr [ebx],1
 00411452    rol         byte ptr [ebx],1
 00411454    rol         byte ptr [ebx],1
 00411456    rol         byte ptr [ebx],1
 00411458    rol         byte ptr [ebx],1
 0041145A    rol         byte ptr [ebx],1
 0041145C    rol         byte ptr [ebx],1
 0041145E    rol         byte ptr [ebx],1
 00411460    rol         byte ptr [ebx],1
 00411462    rol         byte ptr [ebx],1
 00411464    rol         byte ptr [ebx],1
 00411466    rol         byte ptr [ebx],1
 00411468    rol         byte ptr [ebx],1
 0041146A    rol         byte ptr [ebx],1
 0041146C    rol         byte ptr [ebx],1
 0041146E    rol         byte ptr [ebx],1
 00411470    rol         byte ptr [ebx],1
 00411472    rol         byte ptr [ebx],1
 00411474    rol         byte ptr [ebx],1
 00411476    rol         byte ptr [ebx],1
 00411478    rol         byte ptr [ebx],1
 0041147A    rol         byte ptr [ebx],1
 0041147C    rol         byte ptr [ebx],1
 0041147E    rol         byte ptr [ebx],1
 00411480    rol         byte ptr [ebx],1
 00411482    rol         byte ptr [ebx],1
 00411484    rol         byte ptr [ebx],1
 00411486    rol         byte ptr [ebx],1
 00411488    rol         byte ptr [ebx],1
 0041148A    rol         byte ptr [ebx],1
 0041148C    rol         byte ptr [ebx],1
 0041148E    rol         byte ptr [ebx],1
 00411490    rol         byte ptr [ebx],1
 00411492    rol         byte ptr [ebx],1
 00411494    rol         byte ptr [ebx],1
 00411496    rol         byte ptr [ebx],1
 00411498    rol         byte ptr [ebx],1
 0041149A    rol         byte ptr [ebx],1
 0041149C    rol         byte ptr [ebx],1
 0041149E    rol         byte ptr [ebx],1
 004114A0    rol         byte ptr [ebx],1
 004114A2    rol         byte ptr [ebx],1
 004114A4    rol         byte ptr [ebx],1
 004114A6    rol         byte ptr [ebx],1
 004114A8    rol         byte ptr [ebx],1
 004114AA    rol         byte ptr [ebx],1
 004114AC    rol         byte ptr [ebx],1
 004114AE    rol         byte ptr [ebx],1
 004114B0    rol         byte ptr [ebx],1
 004114B2    rol         byte ptr [ebx],1
 004114B4    rol         byte ptr [ebx],1
 004114B6    rol         byte ptr [ebx],1
 004114B8    rol         byte ptr [ebx],1
 004114BA    rol         byte ptr [ebx],1
 004114BC    rol         byte ptr [ebx],1
 004114BE    rol         byte ptr [ebx],1
 004114C0    rol         byte ptr [ebx],1
 004114C2    rol         byte ptr [ebx],1
 004114C4    rol         byte ptr [ebx],1
 004114C6    rol         byte ptr [ebx],1
 004114C8    rol         byte ptr [ebx],1
 004114CA    rol         byte ptr [ebx],1
 004114CC    rol         byte ptr [ebx],1
 004114CE    rol         byte ptr [ebx],1
 004114D0    rol         byte ptr [ebx],1
 004114D2    rol         byte ptr [ebx],1
 004114D4    rol         byte ptr [ebx],1
 004114D6    rol         byte ptr [ebx],1
 004114D8    rol         byte ptr [ebx],1
 004114DA    rol         byte ptr [ebx],1
 004114DC    rol         byte ptr [ebx],1
 004114DE    rol         byte ptr [ebx],1
 004114E0    rol         byte ptr [ebx],1
 004114E2    rol         byte ptr [ebx],1
 004114E4    rol         byte ptr [ebx],1
 004114E6    rol         byte ptr [ebx],1
 004114E8    rol         byte ptr [ebx],1
 004114EA    rol         byte ptr [ebx],1
 004114EC    rol         byte ptr [ebx],1
 004114EE    rol         byte ptr [ebx],1
 004114F0    rol         byte ptr [ebx],1
 004114F2    rol         byte ptr [ebx],1
 004114F4    rol         byte ptr [ebx],1
 004114F6    rol         byte ptr [ebx],1
 004114F8    rol         byte ptr [ebx],1
 004114FA    rol         byte ptr [ebx],1
 004114FC    rol         byte ptr [ebx],1
 004114FE    rol         byte ptr [ebx],1
 00411500    rol         byte ptr [ebx],1
 00411502    rol         byte ptr [ebx],1
 00411504    rol         byte ptr [ebx],1
 00411506    rol         byte ptr [ebx],1
 00411508    rol         byte ptr [ebx],1
 0041150A    rol         byte ptr [ebx],1
 0041150C    rol         byte ptr [ebx],1
 0041150E    rol         byte ptr [ebx],1
 00411510    rol         byte ptr [ebx],1
 00411512    rol         byte ptr [ebx],1
 00411514    rol         byte ptr [ebx],1
 00411516    rol         byte ptr [ebx],1
 00411518    rol         byte ptr [ebx],1
 0041151A    rol         byte ptr [ebx],1
 0041151C    rol         byte ptr [ebx],1
 0041151E    rol         byte ptr [ebx],1
 00411520    rol         byte ptr [ebx],1
 00411522    xor         byte ptr [esi],al
 00411524    rol         byte ptr [ebx],1
 00411526    rol         byte ptr [ebx],1
 00411528    rol         byte ptr [ebx],1
 0041152A    rol         byte ptr [ebx],1
 0041152C    rol         byte ptr [ebx],1
 0041152E    rol         byte ptr [ebx],1
 00411530    rol         byte ptr [ebx],1
 00411532    rol         byte ptr [ebx],1
 00411534    rol         byte ptr [ebx],1
 00411536    rol         byte ptr [ebx],1
 00411538    rol         byte ptr [ebx],1
 0041153A    rol         byte ptr [ebx],1
 0041153C    rol         byte ptr [ebx],1
 0041153E    rol         byte ptr [ebx],1
 00411540    rol         byte ptr [ebx],1
 00411542    rol         byte ptr [ebx],1
 00411544    rol         byte ptr [ebx],1
 00411546    rol         byte ptr [ebx],1
 00411548    rol         byte ptr [ebx],1
 0041154A    rol         byte ptr [ebx],1
 0041154C    rol         byte ptr [ebx],1
 0041154E    rol         byte ptr [ebx],1
 00411550    rol         byte ptr [ebx],1
 00411552    rol         byte ptr [ebx],1
 00411554    rol         byte ptr [ebx],1
 00411556    rol         byte ptr [ebx],1
 00411558    rol         byte ptr [ebx],1
 0041155A    rol         byte ptr [ebx],1
 0041155C    rol         byte ptr [ebx],1
 0041155E    rol         byte ptr [ebx],1
 00411560    rol         byte ptr [ebx],1
 00411562    rol         byte ptr [ebx],1
 00411564    rol         byte ptr [ebx],1
 00411566    rol         byte ptr [ebx],1
 00411568    rol         byte ptr [ebx],1
 0041156A    rol         byte ptr [ebx],1
 0041156C    rol         byte ptr [ebx],1
 0041156E    rol         byte ptr [ebx],1
 00411570    rol         byte ptr [ebx],1
 00411572    rol         byte ptr [ebx],1
 00411574    rol         byte ptr [ebx],1
 00411576    rol         byte ptr [ebx],1
 00411578    rol         byte ptr [ebx],1
 0041157A    rol         byte ptr [ebx],1
 0041157C    rol         byte ptr [ebx],1
 0041157E    rol         byte ptr [ebx],1
 00411580    rol         byte ptr [ebx],1
 00411582    rol         byte ptr [ebx],1
 00411584    rol         byte ptr [ebx],1
 00411586    rol         byte ptr [ebx],1
 00411588    rol         byte ptr [ebx],1
 0041158A    rol         byte ptr [ebx],1
 0041158C    rol         byte ptr [ebx],1
 0041158E    rol         byte ptr [ebx],1
 00411590    rol         byte ptr [ebx],1
 00411592    rol         byte ptr [ebx],1
 00411594    rol         byte ptr [ebx],1
 00411596    rol         byte ptr [ebx],1
 00411598    rol         byte ptr [ebx],1
 0041159A    rol         byte ptr [ebx],1
 0041159C    rol         byte ptr [ebx],1
 0041159E    rol         byte ptr [ebx],1
 004115A0    rol         byte ptr [ebx],1
 004115A2    rol         byte ptr [ebx],1
 004115A4    rol         byte ptr [ebx],1
 004115A6    rol         byte ptr [ebx],1
 004115A8    rol         byte ptr [ebx],1
 004115AA    rol         byte ptr [ebx],1
 004115AC    rol         byte ptr [ebx],1
 004115AE    rol         byte ptr [ebx],1
 004115B0    rol         byte ptr [ebx],1
 004115B2    rol         byte ptr [ebx],1
 004115B4    rol         byte ptr [ebx],1
 004115B6    rol         byte ptr [ebx],1
 004115B8    rol         byte ptr [ebx],1
 004115BA    rol         byte ptr [ebx],1
 004115BC    rol         byte ptr [ebx],1
 004115BE    rol         byte ptr [ebx],1
 004115C0    rol         byte ptr [ebx],1
 004115C2    rol         byte ptr [ebx],1
 004115C4    rol         byte ptr [ebx],1
 004115C6    rol         byte ptr [ebx],1
 004115C8    rol         byte ptr [ebx],1
 004115CA    rol         byte ptr [ebx],1
 004115CC    rol         byte ptr [ebx],1
 004115CE    rol         byte ptr [ebx],1
 004115D0    rol         byte ptr [ebx],1
 004115D2    rol         byte ptr [ebx],1
 004115D4    rol         byte ptr [ebx],1
 004115D6    rol         byte ptr [ebx],1
 004115D8    rol         byte ptr [ebx],1
 004115DA    rol         byte ptr [ebx],1
 004115DC    rol         byte ptr [ebx],1
 004115DE    rol         byte ptr [ebx],1
 004115E0    rol         byte ptr [ebx],1
 004115E2    rol         byte ptr [ebx],1
 004115E4    rol         byte ptr [ebx],1
 004115E6    rol         byte ptr [ebx],1
 004115E8    rol         byte ptr [ebx],1
 004115EA    rol         byte ptr [ebx],1
 004115EC    rol         byte ptr [ebx],1
 004115EE    rol         byte ptr [ebx],1
 004115F0    rol         byte ptr [ebx],1
 004115F2    rol         byte ptr [ebx],1
 004115F4    rol         byte ptr [ebx],1
 004115F6    rol         byte ptr [ebx],1
 004115F8    rol         byte ptr [ebx],1
 004115FA    rol         byte ptr [ebx],1
 004115FC    rol         byte ptr [ebx],1
 004115FE    rol         byte ptr [ebx],1
 00411600    rol         byte ptr [ebx],1
 00411602    rol         byte ptr [ebx],1
 00411604    rol         byte ptr [ebx],1
 00411606    rol         byte ptr [ebx],1
 00411608    rol         byte ptr [ebx],1
 0041160A    rol         byte ptr [ebx],1
 0041160C    rol         byte ptr [ebx],1
 0041160E    rol         byte ptr [ebx],1
 00411610    rol         byte ptr [ebx],1
 00411612    rol         byte ptr [ebx],1
 00411614    rol         byte ptr [ebx],1
 00411616    rol         byte ptr [ebx],1
 00411618    rol         byte ptr [ebx],1
 0041161A    rol         byte ptr [ebx],1
 0041161C    rol         byte ptr [ebx],1
 0041161E    rol         byte ptr [ebx],1
 00411620    rol         byte ptr [ebx],1
 00411622    rol         byte ptr [ebx],1
 00411624    rol         byte ptr [ebx],1
 00411626    rol         byte ptr [ebx],1
 00411628    rol         byte ptr [ebx],1
 0041162A    rol         byte ptr [ebx],1
 0041162C    rol         byte ptr [ebx],1
 0041162E    rol         byte ptr [ebx],1
 00411630    rol         byte ptr [ebx],1
 00411632    rol         byte ptr [ebx],1
 00411634    rol         byte ptr [ebx],1
 00411636    rol         byte ptr [ebx],1
 00411638    rol         byte ptr [ebx],1
 0041163A    rol         byte ptr [ebx],1
 0041163C    rol         byte ptr [ebx],1
 0041163E    rol         byte ptr [ebx],1
 00411640    rol         byte ptr [ebx],1
 00411642    rol         byte ptr [ebx],1
 00411644    rol         byte ptr [ebx],1
 00411646    rol         byte ptr [ebx],1
 00411648    rol         byte ptr [ebx],1
 0041164A    rol         byte ptr [ebx],1
 0041164C    rol         byte ptr [ebx],1
 0041164E    rol         byte ptr [ebx],1
 00411650    rol         byte ptr [ebx],1
 00411652    rol         byte ptr [ebx],1
 00411654    rol         byte ptr [ebx],1
 00411656    rol         byte ptr [ebx],1
 00411658    rol         byte ptr [ebx],1
 0041165A    rol         byte ptr [ebx],1
 0041165C    rol         byte ptr [ebx],1
 0041165E    rol         byte ptr [ebx],1
 00411660    rol         byte ptr [ebx],1
 00411662    rol         byte ptr [ebx],1
 00411664    rol         byte ptr [ebx],1
 00411666    rol         byte ptr [ebx],1
 00411668    rol         byte ptr [ebx],1
 0041166A    rol         byte ptr [ebx],1
 0041166C    rol         byte ptr [ebx],1
 0041166E    rol         byte ptr [ebx],1
 00411670    rol         byte ptr [ebx],1
 00411672    rol         byte ptr [ebx],1
 00411674    rol         byte ptr [ebx],1
 00411676    rol         byte ptr [ebx],1
 00411678    rol         byte ptr [ebx],1
 0041167A    rol         byte ptr [ebx],1
 0041167C    rol         byte ptr [ebx],1
 0041167E    rol         byte ptr [ebx],1
 00411680    rol         byte ptr [ebx],1
 00411682    rol         byte ptr [ebx],1
 00411684    rol         byte ptr [ebx],1
 00411686    rol         byte ptr [ebx],1
 00411688    rol         byte ptr [ebx],1
 0041168A    rol         byte ptr [ebx],1
 0041168C    rol         byte ptr [ebx],1
 0041168E    rol         byte ptr [ebx],1
 00411690    rol         byte ptr [ebx],1
 00411692    rol         byte ptr [ebx],1
 00411694    rol         byte ptr [ebx],1
 00411696    rol         byte ptr [ebx],1
 00411698    rol         byte ptr [ebx],1
 0041169A    rol         byte ptr [ebx],1
 0041169C    rol         byte ptr [ebx],1
 0041169E    rol         byte ptr [ebx],1
 004116A0    rol         byte ptr [ebx],1
 004116A2    rol         byte ptr [ebx],1
 004116A4    rol         byte ptr [ebx],1
 004116A6    rol         byte ptr [ebx],1
 004116A8    rol         byte ptr [ebx],1
 004116AA    rol         byte ptr [ebx],1
 004116AC    rol         byte ptr [ebx],1
 004116AE    rol         byte ptr [ebx],1
 004116B0    rol         byte ptr [ebx],1
 004116B2    rol         byte ptr [ebx],1
 004116B4    rol         byte ptr [ebx],1
 004116B6    rol         byte ptr [ebx],1
 004116B8    rol         byte ptr [ebx],1
 004116BA    rol         byte ptr [ebx],1
 004116BC    rol         byte ptr [ebx],1
 004116BE    rol         byte ptr [ebx],1
 004116C0    rol         byte ptr [ebx],1
 004116C2    rol         byte ptr [ebx],1
 004116C4    rol         byte ptr [ebx],1
 004116C6    rol         byte ptr [ebx],1
 004116C8    rol         byte ptr [ebx],1
 004116CA    rol         byte ptr [ebx],1
 004116CC    rol         byte ptr [ebx],1
 004116CE    rol         byte ptr [ebx],1
 004116D0    rol         byte ptr [ebx],1
 004116D2    rol         byte ptr [ebx],1
 004116D4    rol         byte ptr [ebx],1
 004116D6    rol         byte ptr [ebx],1
 004116D8    rol         byte ptr [ebx],1
 004116DA    rol         byte ptr [ebx],1
 004116DC    rol         byte ptr [ebx],1
 004116DE    rol         byte ptr [ebx],1
 004116E0    rol         byte ptr [ebx],1
 004116E2    rol         byte ptr [ebx],1
 004116E4    rol         byte ptr [ebx],1
 004116E6    rol         byte ptr [ebx],1
 004116E8    rol         byte ptr [ebx],1
 004116EA    rol         byte ptr [ebx],1
 004116EC    rol         byte ptr [ebx],1
 004116EE    rol         byte ptr [ebx],1
 004116F0    rol         byte ptr [ebx],1
 004116F2    rol         byte ptr [ebx],1
 004116F4    rol         byte ptr [ebx],1
 004116F6    rol         byte ptr [ebx],1
 004116F8    rol         byte ptr [ebx],1
 004116FA    rol         byte ptr [ebx],1
 004116FC    rol         byte ptr [ebx],1
 004116FE    rol         byte ptr [ebx],1
 00411700    rol         byte ptr [ebx],1
 00411702    rol         byte ptr [ebx],1
 00411704    rol         byte ptr [ebx],1
 00411706    rol         byte ptr [ebx],1
 00411708    rol         byte ptr [ebx],1
 0041170A    rol         byte ptr [ebx],1
 0041170C    rol         byte ptr [ebx],1
 0041170E    rol         byte ptr [ebx],1
 00411710    rol         byte ptr [ebx],1
 00411712    rol         byte ptr [ebx],1
 00411714    rol         byte ptr [ebx],1
 00411716    rol         byte ptr [ebx],1
 00411718    rol         byte ptr [ebx],1
 0041171A    rol         byte ptr [ebx],1
 0041171C    rol         byte ptr [ebx],1
 0041171E    rol         byte ptr [ebx],1
 00411720    rol         byte ptr [ebx],1
 00411722    xor         byte ptr [esi],al
 00411724    add         byte ptr [eax],al
 00411726    add         byte ptr [eax],al
 00411728    adc         byte ptr [eax],al
 0041172A    and         byte ptr [eax],al
 0041172C    xor         byte ptr [eax],al
 0041172E    inc         eax
 0041172F    add         byte ptr [eax],dl
 00411732    pushad
 00411733    add         byte ptr [eax],al
 00411735    add         byte ptr [eax],al
 00411737    add         byte ptr [eax],dh
 0041173A    add         byte ptr [eax],31
 0041173D    add         byte ptr [eax-5FFFAF00],dl
 00411743    add         byte ptr [eax-4FFF5000],dh
 00411749    add         al,al
 0041174B    add         byte ptr [edi-4FFF5000],bh
 00411751    add         al,dl
 00411753    add         al,ah
 00411755    add         al,dh
 00411757    add         byte ptr [eax],al
 00411759    add         dword ptr [eax],edx
 0041175B    add         dword ptr [eax],esp
 0041175D    add         dword ptr [ebx+3000B000],edi
 00411763    add         dword ptr [eax-4FFF5000],esi
 00411769    add         byte ptr [eax+1],al
 0041176C    push        eax
 0041176D    add         dword ptr [ecx],edx
 00411770    push        ecx
 00411771    add         byte ptr [ecx],dl
 00411774    push        ecx
 00411775    add         byte ptr [eax+1],ah
 00411778    push        ecx
 00411779    add         byte ptr [eax+1],dh
 0041177C    add         byte ptr [ecx],90
 0041177F    add         dword ptr [eax-3FFE4FFF],esp
 00411785    add         eax,eax
 00411787    add         eax,eax
 00411789    add         eax,eax
 0041178B    add         eax,eax
 0041178D    add         eax,eax
 0041178F    add         eax,eax
 00411791    add         eax,edx
 00411793    add         eax,esp
 00411795    add         eax,esi
 00411797    add         dword ptr [eax],eax
 00411799    add         dl,byte ptr [ecx]
 0041179C    adc         byte ptr [edx],al
 0041179E    and         byte ptr [edx],al
 004117A0    mov         al,0
 004117A2    xor         byte ptr [edx],al
 004117A4    xor         dword ptr [eax],eax
 004117A6    xor         dword ptr [eax],eax
 004117A8    xor         dword ptr [eax],eax
 004117AA    push        ecx
 004117AB    add         byte ptr [ecx],dl
 004117AE    push        ecx
 004117AF    add         byte ptr [eax+4000B000],dh
 004117B5    add         dh,byte ptr [eax-4FFF5000]
 004117BB    add         byte ptr [eax+2],dl
 004117BE    mov         al,0
 004117C0    mov         al,0
 004117C2    mov         al,0
 004117C4    mov         al,0
 004117C6    mov         al,0
 004117C8    pushad
 004117C9    add         dh,byte ptr [eax+2]
 004117CC    xor         dword ptr [eax],eax
 004117CE    add         byte ptr [edx],90
 004117D1    add         dl,byte ptr [ecx]
 004117D4    mov         al,[C002B002]
 004117D9    add         eax,eax
 004117DB    add         dl,al
 004117DD    add         ah,al
 004117DF    add         dh,al
 004117E1    add         al,byte ptr [eax]
 004117E3    add         edx,dword ptr [eax]
 004117E5    add         esp,dword ptr [eax]
 004117E7    add         ebx,edi
 004117E9    add         ah,al
 004117EB    add         dh,byte ptr [eax]
 004117ED    add         eax,dword ptr [eax+3]
 004117F0    push        eax
 004117F1    add         esp,dword ptr [eax+3]
 004117F4    loopne      004117F8
 004117F6    loopne      004117FA
 004117F8    loopne      004117FC
 004117FA    loopne      004117FE
 004117FC    loopne      00411800
>004117FE    jo          00411803
 00411800    add         byte ptr [ebx],90
 00411803    add         esp,dword ptr [eax-1FFCA0FD]
 00411809    add         al,al
 0041180B    add         dword ptr [eax-1FFD1FFD],esi
 00411811    add         ah,al
 00411813    add         ah,al
 00411815    add         ah,al
 00411817    add         dh,byte ptr ds:[0D003C003]
 0041181D    add         esp,eax
 0041181F    add         ah,al
 00411821    add         esi,eax
 00411823    add         esp,eax
 00411825    add         al,byte ptr [eax]
 00411827    add         al,10
 00411829    add         al,20
 0041182B    add         al,30
 0041182D    add         al,2F
 0041182F    add         al,2F
 00411831    add         al,2F
 00411833    add         al,2F
 00411835    add         al,2F
 00411837    add         al,2F
 00411839    add         al,2F
 0041183B    add         al,2F
 0041183D    add         al,2F
 0041183F    add         al,2F
 00411841    add         al,2F
 00411843    add         al,40
 00411845    add         al,0E0
 00411847    add         ah,al
 00411849    add         dl,byte ptr [eax+4]
 0041184C    pushad
 0041184D    add         al,70
 0041184F    add         al,80
 00411851    add         al,90
 00411853    add         al,0A0
 00411855    add         al,0B0
 00411857    add         al,0C0
 00411859    add         al,0D0
 0041185B    add         al,0E0
 0041185D    add         al,0F0
 0041185F    add         al,0
 00411861    add         eax,5200510
 00411866    mov         al,4
 00411868    rol         byte ptr [eax+esi],5
 0041186C    inc         eax
 0041186D    add         eax,3CA0550
 00411872    pushad
 00411873    add         eax,5800570
 00411878    rol         byte ptr [eax+edx*4],5
 0041187C    mov         al,[0005B005]
 00411881    add         eax,4A005C0
 00411886    mov         al,4
 00411888    rol         byte ptr [eax+edx*8],5
 0041188C    loopne      00411893
 0041188E    lock add    eax,6000500
 00411894    adc         byte ptr [esi],al
 00411896    and         byte ptr [esi],al
 00411898    xor         byte ptr [esi],al
 0041189A    inc         eax
 0041189B    push        es
 0041189C    push        eax
 0041189D    push        es
 0041189E    pushad
 0041189F    push        es
 004118A0    retf        7003
 004118A3    push        es
 004118A4    add         byte ptr [esi],81
 004118A7    add         eax,69004C0
 004118AC    mov         al,[0006B006]
 004118B1    add         eax,6D006C0
 004118B6    add         dword ptr ds:[6E004C0],70006F0
 004118C0    add         byte ptr ds:[6D00710],al
 004118C6    add         dword ptr ds:[72004C0],7400730
 004118D0    add         byte ptr ds:[7600750],al
>004118D6    jo          004118DF
 004118D8    loopne      004118DC
 004118DA    add         byte ptr [edi],90
 004118DD    pop         es
 004118DE    mov         al,[B0042F07]
 004118E3    pop         es
 004118E4    fild        word ptr [edx]
 004118E6    loopne      004118EA
 004118E8    loopne      004118EC
 004118EA    rol         byte ptr [edi],0D0
 004118ED    pop         es
 004118EE    loopne      004118F7
 004118F0    das
 004118F1    add         al,2F
 004118F3    add         al,0F0
 004118F5    pop         es
 004118F6    add         byte ptr [eax],cl
 004118F8    adc         byte ptr [eax],cl
 004118FA    and         byte ptr [eax],cl
 004118FC    xor         byte ptr [eax],cl
 004118FE    inc         eax
 004118FF    or          byte ptr [edi],ch
 00411901    add         al,2F
 00411903    add         al,50
 00411905    or          byte ptr [eax+8],ah
>00411908    jo          00411912
 0041190A    or          byte ptr [eax],0C1
 0041190D    add         al,0E0
 0041190F    add         ch,dh
 00411911    add         dl,byte ptr [eax-4FF75FF8]
 00411917    or          al,al
 00411919    add         eax,eax
 0041191B    or          al,dl
 0041191D    or          al,ah
 0041191F    or          byte ptr [edi],ch
 00411921    add         al,2F
 00411923    add         al,0E0
 00411925    add         ah,al
 00411927    add         dh,al
 00411929    or          byte ptr [eax],al
 0041192B    or          dword ptr [eax],edx
 0041192D    or          dword ptr [eax],esp
 0041192F    or          dword ptr [eax],esi
 00411931    or          dword ptr [eax+9],eax
 00411934    push        eax
 00411935    or          dword ptr [eax+9],esp
 00411938    xor         dword ptr [eax],eax
 0041193A    xor         dword ptr [eax],eax
>0041193C    jo          00411947
 0041193E    loopne      00411942
 00411940    loopne      00411944
 00411942    or          byte ptr [ecx],0E0
 00411945    add         ah,al
 00411947    add         ah,al
 00411949    add         ah,al
 0041194B    add         ah,al
 0041194D    add         ah,al
 0041194F    add         ah,al
 00411951    add         ah,al
 00411953    add         ah,al
 00411955    add         ah,al
 00411957    add         ah,al
 00411959    add         ah,al
 0041195B    add         ah,al
 0041195D    add         ah,al
 0041195F    add         ah,al
 00411961    add         ah,al
 00411963    add         ah,al
 00411965    add         ah,al
 00411967    add         ah,al
 00411969    add         ah,al
 0041196B    add         dl,byte ptr [eax-1FF65FF7]
 00411971    add         ah,al
 00411973    add         dl,byte ptr [eax-1FFD1FF7]
 00411979    add         bl,byte ptr [eax+7B09B009]
 0041197F    pop         es
 00411980    loopne      00411984
 00411982    loopne      00411986
 00411984    loopne      00411988
 00411986    mov         al,9
 00411988    loopne      0041198C
 0041198A    loopne      0041198E
 0041198C    loopne      00411990
 0041198E    ror         byte ptr [ecx],0D0
 00411991    or          eax,esp
 00411993    or          eax,esp
 00411995    add         dh,al
 00411997    or          eax,esp
 00411999    add         ah,al
 0041199B    add         ah,al
 0041199D    add         ah,al
 0041199F    add         ah,al
 004119A1    add         al,byte ptr [eax]
 004119A3    or          dl,byte ptr [eax]
 004119A5    or          ah,al
 004119A7    add         ah,al
 004119A9    add         ah,al
 004119AB    add         ah,al
 004119AD    add         ah,al
 004119AF    add         ah,al
 004119B1    add         ah,al
 004119B3    add         ah,al
 004119B5    add         ah,al
 004119B7    add         ah,al
 004119B9    add         ah,al
 004119BB    add         ah,al
 004119BD    add         ah,al
 004119BF    add         ah,al
 004119C1    add         ah,al
 004119C3    add         ah,al
 004119C5    add         ah,al
 004119C7    add         ah,al
 004119C9    add         ah,al
 004119CB    add         ah,al
 004119CD    add         ah,al
 004119CF    add         ah,byte ptr [eax]
 004119D1    or          ah,al
 004119D3    add         dh,byte ptr [eax]
 004119D5    or          al,byte ptr [eax+0A]
 004119D8    loopne      004119DC
 004119DA    loopne      004119DE
 004119DC    loopne      004119E0
 004119DE    loopne      004119E2
 004119E0    push        eax
 004119E1    or          ah,byte ptr [eax+0A]
 004119E4    mov         esp,0E00A7004
 004119E9    add         al,byte ptr [eax-6FFD1FF6]
 004119EF    or          bh,byte ptr [esp+eax+2E00AA0]
 004119F6    loopne      004119FA
 004119F8    loopne      004119FC
 004119FA    mov         al,0A
 004119FC    ror         byte ptr [edx],0D0
 004119FF    or          ah,al
 00411A01    or          dh,al
 00411A03    or          al,byte ptr [eax]
 00411A05    or          esp,eax
 00411A07    or          ah,al
 00411A09    add         ah,al
 00411A0B    add         dl,byte ptr [eax]
 00411A0D    or          esp,eax
 00411A0F    add         ah,al
 00411A11    add         ah,byte ptr [eax]
 00411A13    or          esp,eax
 00411A15    add         ah,al
 00411A17    add         dh,byte ptr [eax]
 00411A19    or          esp,eax
 00411A1B    add         ah,al
 00411A1D    add         ah,al
 00411A1F    add         ah,al
 00411A21    add         al,byte ptr [eax+0B]
 00411A24    loopne      00411A28
 00411A26    out         dl,al
 00411A27    add         dl,byte ptr [eax+0B]
 00411A2A    pushad
 00411A2B    or          esi,dword ptr [eax+0B]
 00411A2E    loopne      00411A32
 00411A30    in          eax,dl
 00411A31    add         al,byte ptr [eax]
 00411A33    or          ah,al
 00411A35    add         ah,al
 00411A37    add         ch,bh
 00411A39    add         al,byte ptr [eax-5FF46FF5]
 00411A3F    or          esi,dword ptr [eax-1FF44FF5]
 00411A45    add         al,al
 00411A47    or          esp,eax
 00411A49    add         ah,al
 00411A4B    add         ah,al
 00411A4D    add         dl,al
 00411A4F    or          esp,eax
 00411A51    or          esi,eax
 00411A53    or          esp,eax
 00411A55    or          ah,al
 00411A57    or          al,byte ptr [eax]
 00411A59    or          al,2F
 00411A5B    add         al,2F
 00411A5D    add         al,2F
 00411A5F    add         al,2F
 00411A61    add         al,2F
 00411A63    add         al,10
 00411A65    or          al,0E0
 00411A67    add         ah,al
 00411A69    add         ah,byte ptr [eax]
 00411A6B    or          al,30
 00411A6D    or          al,10
 00411A6F    or          dword ptr [eax+0C],eax
 00411A72    push        eax
 00411A73    or          al,41
 00411A75    add         al,0E0
 00411A77    add         ah,byte ptr [eax+0C]
 00411A7A    loopne      00411A86
 00411A7C    das
 00411A7D    add         al,2F
 00411A7F    add         al,2F
 00411A81    add         al,2F
 00411A83    add         al,0E0
 00411A85    add         ah,al
 00411A87    add         dh,byte ptr [eax+0C]
 00411A8A    or          byte ptr [eax+edx*4],0C
 00411A8E    rol         byte ptr [ebx],1
 00411A90    loopne      00411A94
 00411A92    mov         al,[2F042F0C]
 00411A97    add         al,2F
 00411A99    add         al,2F
 00411A9B    add         al,2F
 00411A9D    add         al,0B0
 00411A9F    or          al,0C0
 00411AA1    or          al,0D0
 00411AA3    or          al,51
 00411AA5    add         byte ptr [ecx],dl
 00411AA8    loopne      00411AB6
>00411AAA    jo          00411AAD
>00411AAC    jo          00411AAF
>00411AAE    jo          00411AB1
 00411AB0    lock or     al,0
 00411AB3    or          eax,1650051
>00411AB8    jo          00411ABB
>00411ABA    jo          00411ABD
 00411ABC    rol         byte ptr [ecx],0C0
 00411ABF    add         dword ptr [eax],edx
 00411AC1    or          eax,0B00433
 00411AC6    mov         al,0
 00411AC8    mov         al,0
 00411ACA    mov         al,0
 00411ACC    mov         al,0
 00411ACE    mov         al,0
 00411AD0    mov         al,0
 00411AD2    mov         al,0
 00411AD4    mov         al,0
 00411AD6    and         byte ptr ds:[0B000B0],cl
 00411ADC    mov         al,0
 00411ADE    mov         al,0
 00411AE0    mov         al,0
 00411AE2    mov         al,0
 00411AE4    xor         byte ptr ds:[0D300D40],cl
 00411AEA    xor         byte ptr ds:[0D500D40],cl
 00411AF0    xor         byte ptr ds:[0D700D60],cl
>00411AF6    jo          00411B05
>00411AF8    jo          00411B07
 00411AFA    or          byte ptr ds:[0DA00D90],0B0
 00411B01    or          eax,0DD00DC0
 00411B06    loopne      00411B15
 00411B08    lock or     eax,0E100E00
 00411B0E    and         byte ptr [esi],cl
 00411B10    xor         byte ptr [esi],cl
 00411B12    inc         eax
 00411B13    push        cs
 00411B14    push        eax
 00411B15    push        cs
 00411B16    pushad
 00411B17    push        cs
>00411B18    jo          00411B28
 00411B1A    or          byte ptr [esi],2F
 00411B1D    add         al,90
 00411B1F    push        cs
 00411B20    mov         al,[C00EB00E]
 00411B25    push        cs
 00411B26    ror         byte ptr [esi],1
 00411B28    loopne      00411B38
 00411B2A    lock push   cs
 00411B2C    add         byte ptr [edi],cl
 00411B2E    ???
 00411B2F    or          dword ptr [eax],edx
 00411B31    ???
 00411B32    adc         byte ptr [edi],cl
 00411B34    and         byte ptr [edi],cl
 00411B36    xor         byte ptr [edi],cl
 00411B38    inc         eax
 00411B39    cmpxchg     byte ptr [ebx],cl
 00411B3C    push        eax
 00411B3D    punpcklbw   mm1,mmword ptr [edi]
 00411B40    mov         al,0B
>00411B42    jo          00411B53
 00411B44    or          byte ptr [edi],74
 00411B47    pcmpeqb     mm1,mmword ptr [edi]
>00411B4A    je          00411B5B
>00411B4C    je          00411B5D
>00411B4E    je          00411B5F
>00411B50    je          00411B61
>00411B52    je          00411B63
>00411B54    je          00411B65
>00411B56    je          00411B67
>00411B58    je          00411B69
>00411B5A    je          00411B6B
>00411B5C    je          00411B6D
>00411B5E    je          00411B6F
>00411B60    je          00411B71
>00411B62    je          00411B73
 00411B64    nop
 00411B65    cmpxchg     byte ptr [ebx],cl
 00411B68    mov         al,[B00BB00F]
 00411B6D    or          esi,dword ptr [eax-4FF44FF5]
 00411B73    cmpxchg     byte ptr [ebx],cl
 00411B76    imul        ecx,dword ptr [edi],0FC00F74
 00411B7C    mov         al,0B
 00411B7E    push        2F0FD00F
 00411B83    add         al,0B0
 00411B85    or          esi,dword ptr [eax+2F0FE00B]
 00411B8B    add         al,0F0
 00411B8D    ???
 00411B8E    das
 00411B8F    add         al,0D9
 00411B91    or          ecx,ebx
 00411B93    or          ecx,ebx
 00411B95    or          dword ptr [eax],eax
 00411B97    adc         byte ptr [eax-4FF44FF5],dh
 00411B9D    or          esi,dword ptr [eax-26EFEFF5]
 00411BA3    or          dword ptr [eax-4FF44FF5],esi
 00411BA9    or          esi,dword ptr [eax-4FF44FF5]
 00411BAF    or          esi,dword ptr [eax-4FF44FF5]
 00411BB5    or          esi,dword ptr [eax+470BB00B]
 00411BBB    cmovge      ecx,dword ptr [edi]
 00411BBE    mov         al,0B
 00411BC0    mov         al,0B
 00411BC2    ins         byte ptr [edi],dl
 00411BC3    cmpxchg     byte ptr [ebx],cl
 00411BC6    mov         al,0B
 00411BC8    mov         al,0B
 00411BCA    mov         al,0B
 00411BCC    mov         al,0B
 00411BCE    mov         al,0B
 00411BD0    dec         edi
 00411BD1    cmpxchg     byte ptr [ebx],cl
 00411BD4    mov         al,0B
 00411BD6    mov         al,0B
 00411BD8    mov         al,0B
 00411BDA    mov         al,0B
 00411BDC    and         byte ptr [eax],dl
 00411BDE    mov         al,0B
 00411BE0    xor         byte ptr [eax],dl
 00411BE2    mov         al,0B
 00411BE4    inc         eax
 00411BE5    adc         byte ptr [eax-4FEFAFF5],dh
 00411BEB    or          esp,dword ptr [eax+10]
>00411BEE    jo          00411C00
 00411BF0    adc         byte ptr [eax],90
 00411BF3    adc         cl,bl
 00411BF5    or          dword ptr [eax-4FF44FF0],esp
 00411BFB    adc         al,al
 00411BFD    adc         byte ptr [edi+ecx-30],dh
 00411C01    adc         byte ptr [edi+ecx-50],dh
 00411C05    or          esi,dword ptr [eax-4FF44FF5]
 00411C0B    or          esi,dword ptr [eax-4FF44FF5]
 00411C11    or          esi,dword ptr [eax-4FF44FF5]
 00411C17    or          esi,dword ptr [eax-4FF44FF5]
 00411C1D    or          esi,dword ptr [eax-4FF44FF5]
 00411C23    or          esi,dword ptr [edi+ecx+74]
 00411C27    pcmpeqb     mm1,mmword ptr [edi]
>00411C2A    je          00411C3B
>00411C2C    je          00411C3D
>00411C2E    je          00411C3F
>00411C30    je          00411C41
>00411C32    je          00411C43
 00411C34    loopne      00411C46
 00411C36    lock adc    byte ptr [edi+ecx+74],dh
 00411C3B    pcmpeqb     mm1,mmword ptr [edi]
 00411C3E    add         byte ptr [ecx],dl
>00411C40    je          00411C51
 00411C42    adc         byte ptr [ecx],dl
 00411C44    mov         al,0B
 00411C46    mov         al,0B
 00411C48    mov         al,0B
>00411C4A    je          00411C5B
 00411C4C    and         byte ptr [ecx],dl
 00411C4E    lock or     dword ptr [edi],ebp
 00411C51    add         al,2F
 00411C53    add         al,2F
 00411C55    add         al,2F
 00411C57    add         al,2F
 00411C59    add         al,2F
 00411C5B    add         al,2F
 00411C5D    add         al,2F
 00411C5F    add         al,2F
 00411C61    add         al,2F
 00411C63    add         al,31
 00411C65    add         byte ptr [ecx],dh
 00411C67    add         bl,dh
 00411C69    add         dword ptr [ecx],edx
 00411C6C    push        ecx
 00411C6D    add         byte ptr [ecx+40113002],bl
 00411C73    adc         dword ptr [eax-4FFF5000],esi
 00411C79    add         byte ptr [eax-4FFF5000],dh
 00411C7F    add         byte ptr [eax+11],dl
 00411C82    pushad
 00411C83    adc         dword ptr [ecx],edx
 00411C86    push        ecx
 00411C87    add         byte ptr [eax+11],dh
 00411C8A    loopne      00411C8E
 00411C8C    loopne      00411C90
 00411C8E    loopne      00411C92
 00411C90    adc         byte ptr [ecx],2F
 00411C93    add         al,0E0
 00411C95    add         dl,byte ptr [eax-3DFB3DEF]
 00411C9B    add         al,0C2
 00411C9D    add         al,0C2
 00411C9F    add         al,0C0
 00411CA1    add         eax,eax
 00411CA3    add         dword ptr [eax-3FEE4FEF],esp
 00411CA9    adc         dword ptr ds:[2F042F04],ebp
 00411CAF    add         al,2F
 00411CB1    add         al,2F
 00411CB3    add         al,0B0
 00411CB5    or          ecx,dword ptr [esi+10]
 00411CB8    mov         al,0B
 00411CBA    mov         al,0B
 00411CBC    mov         al,0B
 00411CBE    mov         al,0B
 00411CC0    mov         al,0B
 00411CC2    rcl         byte ptr [ecx],1
 00411CC4    mov         al,0B
 00411CC6    mov         al,0B
 00411CC8    mov         al,0B
 00411CCA    mov         al,0B
 00411CCC    mov         al,0B
 00411CCE    mov         al,0B
 00411CD0    mov         al,0B
 00411CD2    mov         al,0B
 00411CD4    mov         al,0B
 00411CD6    mov         al,0B
 00411CD8    mov         al,0B
 00411CDA    mov         al,0B
 00411CDC    mov         al,0B
 00411CDE    loopne      00411CF1
 00411CE0    das
 00411CE1    add         al,0F0
 00411CE3    adc         dword ptr [eax],eax
 00411CE5    adc         dl,byte ptr [eax]
 00411CE7    adc         ah,byte ptr [eax]
 00411CE9    adc         dh,byte ptr [eax]
 00411CEB    adc         bl,bh
 00411CED    add         ah,al
 00411CEF    add         ah,al
 00411CF1    add         ah,al
 00411CF3    add         ah,al
 00411CF5    add         al,byte ptr [eax+12]
 00411CF8    adc         byte ptr [edx],cl
 00411CFA    loopne      00411CFE
 00411CFC    loopne      00411D00
 00411CFE    loopne      00411D02
 00411D00    loopne      00411D04
 00411D02    push        eax
 00411D03    adc         bl,bl
 00411D05    add         ah,al
 00411D07    add         ch,ch
 00411D09    add         bl,bh
 00411D0B    add         ah,al
 00411D0D    add         ah,al
 00411D0F    add         ah,al
 00411D11    add         ah,al
 00411D13    add         ch,ah
 00411D15    add         ah,byte ptr [eax+12]
 00411D18    loopne      00411D1C
 00411D1A    and         byte ptr [ebx],cl
 00411D1C    mov         al,0B
 00411D1E    mov         al,0B
 00411D20    rcl         byte ptr [ecx],1
 00411D22    loopne      00411D26
 00411D24    mov         al,0B
 00411D26    pop         ebp
 00411D27    adc         byte ptr [edx],al
 00411D29    adc         byte ptr [eax+700BB00B],dh
 00411D2F    adc         dh,byte ptr [eax+20BB00B]
 00411D35    adc         byte ptr [eax+700BB00B],dh
 00411D3B    adc         dh,byte ptr [eax-4FF44FF5]
 00411D41    or          ebx,dword ptr [ebp+10]
 00411D44    loopne      00411D48
 00411D46    loopne      00411D4A
 00411D48    loopne      00411D4C
 00411D4A    loopne      00411D4E
 00411D4C    loopne      00411D50
 00411D4E    loopne      00411D52
 00411D50    loopne      00411D54
 00411D52    loopne      00411D56
 00411D54    loopne      00411D58
 00411D56    loopne      00411D5A
 00411D58    loopne      00411D5C
 00411D5A    inc         eax
 00411D5B    or          esi,dword ptr [eax-4FF44FF5]
 00411D61    or          esi,dword ptr [eax-1FFD1FF5]
 00411D67    add         ah,al
 00411D69    add         ah,al
 00411D6B    add         ah,al
 00411D6D    add         ah,al
 00411D6F    add         ah,al
 00411D71    add         ah,al
 00411D73    add         ah,al
 00411D75    add         ah,al
 00411D77    add         ah,al
 00411D79    add         ah,al
 00411D7B    add         ch,bh
 00411D7D    add         ch,byte ptr [edi]
 00411D7F    add         al,2F
 00411D81    add         al,2F
 00411D83    add         al,0E0
 00411D85    add         al,byte ptr [eax-1FFD1FEE]
 00411D8B    add         ah,al
 00411D8D    add         ah,al
 00411D8F    add         ah,al
 00411D91    add         ah,al
 00411D93    add         ah,al
 00411D95    add         ah,al
 00411D97    add         ah,al
 00411D99    add         ah,al
 00411D9B    add         ah,al
 00411D9D    add         ah,al
 00411D9F    add         ah,al
 00411DA1    add         ah,al
 00411DA3    add         ah,al
 00411DA5    add         ah,al
 00411DA7    add         ah,al
 00411DA9    add         ah,al
 00411DAB    add         ah,al
 00411DAD    add         ah,al
 00411DAF    add         ah,al
 00411DB1    add         ah,al
 00411DB3    add         ch,dh
 00411DB5    add         dh,byte ptr [eax-4FF44FF5]
 00411DBB    or          esp,eax
 00411DBD    ???
 00411DBE    loopne      00411DC2
 00411DC0    loopne      00411DC4
 00411DC2    mov         al,[E012900C]
 00411DC7    add         ah,byte ptr [eax-4FFBD0EE]
 00411DCD    add         byte ptr [eax-3FED5000],dh
 00411DD3    adc         dh,byte ptr [eax-1FED3000]
 00411DD9    add         ah,al
 00411DDB    add         ah,al
 00411DDD    add         ah,al
 00411DDF    add         ah,al
 00411DE1    adc         dh,al
 00411DE3    adc         ch,byte ptr [edi+10130001]
 00411DE9    adc         ebp,dword ptr [esi-4FFF5000]
 00411DEF    add         byte ptr [eax+30132000],dh
 00411DF5    adc         ebp,dword ptr [edi]
 00411DF7    add         al,2F
 00411DF9    add         al,2F
 00411DFB    add         al,2F
 00411DFD    add         al,2F
 00411DFF    add         al,2F
 00411E01    add         al,15
 00411E03    pop         es
 00411E04    inc         eax
 00411E05    adc         esp,eax
 00411E07    add         dl,byte ptr [eax+13]
 00411E0A    pushad
 00411E0B    adc         esp,eax
 00411E0D    add         ah,al
 00411E0F    add         ah,al
 00411E11    add         dh,byte ptr [eax+13]
 00411E14    adc         byte ptr [ebx],0E0
 00411E17    add         ah,al
 00411E19    add         dl,byte ptr [eax-1FEC5FED]
 00411E1F    or          al,al
 00411E21    add         dword ptr [eax-1FFC2FED],esi
 00411E27    add         al,al
 00411E29    adc         esp,eax
 00411E2B    add         dh,byte ptr [ebx+eax]
 00411E2E    rcl         byte ptr [ebx],1
 00411E30    loopne      00411E34
 00411E32    out         dl,al
 00411E33    add         al,byte ptr [eax+4]
 00411E36    loopne      00411E3A
 00411E38    loopne      00411E3C
 00411E3A    loopne      00411E4F
 00411E3C    lock adc    eax,dword ptr [eax]
 00411E3F    adc         al,2F
 00411E41    add         al,2F
 00411E43    add         al,0E0
 00411E45    add         ah,al
 00411E47    add         dl,byte ptr [eax]
 00411E49    adc         al,20
 00411E4B    adc         al,30
 00411E4D    adc         al,40
 00411E4F    adc         al,0E0
 00411E51    add         dl,byte ptr [eax+14]
 00411E54    loopne      00411E58
 00411E56    loopne      00411E5A
 00411E58    loopne      00411E5C
 00411E5A    pushad
 00411E5B    adc         al,0BF
 00411E5D    add         esi,dword ptr [eax+14]
 00411E60    das
 00411E61    add         al,2F
 00411E63    add         al,2F
 00411E65    add         al,2F
 00411E67    add         al,2F
 00411E69    add         al,2F
 00411E6B    add         al,2F
 00411E6D    add         al,2F
 00411E6F    add         al,2F
 00411E71    add         al,2F
 00411E73    add         al,2F
 00411E75    add         al,2F
 00411E77    add         al,2F
 00411E79    add         al,2F
 00411E7B    add         al,0E0
 00411E7D    add         ah,al
 00411E7F    add         al,byte ptr [eax-1FF51FEC]
 00411E85    add         ah,al
 00411E87    add         ah,al
 00411E89    add         ah,al
 00411E8B    add         ah,al
 00411E8D    add         ah,al
 00411E8F    add         ah,al
 00411E91    add         ah,al
 00411E93    add         ah,al
 00411E95    add         ah,al
 00411E97    add         dl,byte ptr [eax-5FFD1FEC]
 00411E9D    adc         al,0E0
 00411E9F    add         ah,al
 00411EA1    add         ch,bh
 00411EA3    add         dh,byte ptr [eax-4FEB4FEC]
 00411EA9    adc         al,0B0
 00411EAB    adc         al,0B0
 00411EAD    adc         al,0B0
 00411EAF    adc         al,0B0
 00411EB1    adc         al,0B0
 00411EB3    adc         al,0B0
 00411EB5    adc         al,0B0
 00411EB7    adc         al,0B0
 00411EB9    adc         al,0B0
 00411EBB    adc         al,0B0
 00411EBD    adc         al,0B0
 00411EBF    adc         al,0B0
 00411EC1    adc         al,0B0
 00411EC3    adc         al,0C0
 00411EC5    adc         al,0C0
 00411EC7    adc         al,0C0
 00411EC9    adc         al,0C0
 00411ECB    adc         al,0C0
 00411ECD    adc         al,0C0
 00411ECF    adc         al,0C0
 00411ED1    adc         al,0C0
 00411ED3    adc         al,0C0
 00411ED5    adc         al,0C0
 00411ED7    adc         al,0C0
 00411ED9    adc         al,0C0
 00411EDB    adc         al,0C0
 00411EDD    adc         al,0C0
 00411EDF    adc         al,0C0
 00411EE1    adc         al,0C0
 00411EE3    adc         al,0E0
 00411EE5    add         ah,al
 00411EE7    add         ch,ch
 00411EE9    add         ah,al
 00411EEB    add         ah,al
 00411EED    add         ah,al
 00411EEF    add         ch,ch
 00411EF1    add         ah,al
 00411EF3    add         ah,al
 00411EF5    add         ah,al
 00411EF7    add         ah,al
 00411EF9    add         ah,al
 00411EFB    add         ah,al
 00411EFD    add         bl,byte ptr [esi]
 00411EFF    or          ebp,dword ptr [edi]
 00411F01    add         al,2F
 00411F03    add         al,0D0
 00411F05    adc         al,0E0
 00411F07    adc         al,0F0
 00411F09    adc         al,0
 00411F0B    adc         eax,2E01510
 00411F10    loopne      00411F14
 00411F12    loopne      00411F16
 00411F14    loopne      00411F18
 00411F16    loopne      00411F1A
 00411F18    loopne      00411F1C
 00411F1A    mov         eax,0DD042F06
 00411F1F    add         ah,al
 00411F21    add         ah,al
 00411F23    add         ah,al
 00411F25    add         ah,al
 00411F27    add         ah,al
 00411F29    add         bh,byte ptr ds:[0E0042F0A]
 00411F2F    add         ah,al
 00411F31    add         ah,al
 00411F33    add         ah,al
 00411F35    add         bl,dh
 00411F37    add         ah,al
 00411F39    add         ah,al
 00411F3B    add         ah,byte ptr [eax]
 00411F3D    or          ebp,dword ptr [edi]
 00411F3F    add         al,2F
 00411F41    add         al,20
 00411F43    adc         eax,153001C0
 00411F48    adc         byte ptr ds:[15501540],cl
 00411F4E    pushad
 00411F4F    adc         eax,15801570
 00411F54    loopne      00411F58
 00411F56    loopne      00411F5A
 00411F58    loopne      00411F5C
 00411F5A    loopne      00411F5E
 00411F5C    loopne      00411F60
 00411F5E    loopne      00411F62
 00411F60    loopne      00411F64
 00411F62    nop
 00411F63    adc         eax,2015A0
 00411F68    xor         byte ptr [eax],al
 00411F6A    inc         eax
 00411F6B    add         byte ptr [eax],dl
 00411F6E    mov         al,15
 00411F70    rcl         byte ptr ds:[2E00B13],0D0
 00411F77    adc         eax,2EC02E0
 00411F7C    loopne      00411F93
 00411F7E    lock adc    eax,16101600
 00411F84    mov         ebp,7B02E004
 00411F89    pop         es
 00411F8A    xchg        al,byte ptr ds:[2ED02ED]
 00411F90    das
 00411F91    add         al,2F
 00411F93    add         al,0E0
 00411F95    add         ah,al
 00411F97    add         ah,al
 00411F99    add         ah,al
 00411F9B    add         ah,al
 00411F9D    add         ah,al
 00411F9F    add         ah,al
 00411FA1    add         dh,al
 00411FA3    add         ah,byte ptr [eax]
 00411FA5    push        ss
 00411FA6    ???
 00411FA7    or          ecx,ebx
 00411FA9    or          ecx,ebp
 00411FAB    or          dword ptr [eax],edx
 00411FAD    ???
 00411FAE    adc         byte ptr [edi],cl
 00411FB0    adc         byte ptr [edi],cl
 00411FB2    xor         byte ptr [esi],dl
 00411FB4    inc         eax
 00411FB5    push        ss
 00411FB6    lock adc    dword ptr [edi],ebp
 00411FB9    add         al,2F
 00411FBB    add         al,2F
 00411FBD    add         al,0B0
 00411FBF    or          esi,dword ptr [eax+2F16500B]
 00411FC5    add         al,2F
 00411FC7    add         al,2F
 00411FC9    add         al,2F
 00411FCB    add         al,2F
 00411FCD    add         al,2F
 00411FCF    add         al,2F
 00411FD1    add         al,2F
 00411FD3    add         al,0E0
 00411FD5    add         ch,dh
 00411FD7    add         ah,al
 00411FD9    add         ah,al
 00411FDB    add         ah,al
 00411FDD    add         dh,byte ptr [eax+2F042F05]
 00411FE3    add         al,0E0
 00411FE5    add         ch,ah
 00411FE7    add         ah,byte ptr [eax+16]
 00411FEA    loopne      00411FEE
>00411FEC    jo          00412004
 00411FEE    das
 00411FEF    add         al,2F
 00411FF1    add         al,2F
 00411FF3    add         al,0E0
 00411FF5    add         al,byte ptr [eax-1FFD1FEA]
 00411FFB    add         dl,byte ptr [eax+2F16A016]
 00412001    add         al,2F
 00412003    add         al,31
 00412005    add         byte ptr [ecx],dh
 00412007    add         byte ptr [edx+eax],al
 0041200A    push        ecx
 0041200B    add         byte ptr [ecx],dl
 0041200E    loopne      00412012
 00412010    loopne      00412014
 00412012    loopne      00412016
 00412014    loopne      00412018
 00412016    in          eax,dl
 00412017    add         ah,al
 00412019    or          ch,byte ptr [edi]
 0041201B    add         al,2F
 0041201D    add         al,2F
 0041201F    add         al,2F
 00412021    add         al,2F
 00412023    add         al,2F
 00412025    add         al,2F
 00412027    add         al,2F
 00412029    add         al,2F
 0041202B    add         al,2F
 0041202D    add         al,2F
 0041202F    add         al,2F
 00412031    add         al,2F
 00412033    add         al,2F
 00412035    add         al,2F
 00412037    add         al,2F
 00412039    add         al,2F
 0041203B    add         al,2F
 0041203D    add         al,2F
 0041203F    add         al,2F
 00412041    add         al,2F
 00412043    add         al,0B0
 00412045    push        ss
 00412046    loopne      0041204A
 00412048    loopne      0041204C
 0041204A    rcl         byte ptr [esi],0E0
 0041204D    add         dl,al
 0041204F    push        ss
 00412050    das
 00412051    add         al,2F
 00412053    add         al,2F
 00412055    add         al,2F
 00412057    add         al,2F
 00412059    add         al,2F
 0041205B    add         al,2F
 0041205D    add         al,2F
 0041205F    add         al,2F
 00412061    add         al,2F
 00412063    add         al,0E0
 00412065    add         ah,al
 00412067    push        ss
 00412068    loopne      0041206C
 0041206A    lock push   ss
 0041206C    das
 0041206D    add         al,2F
 0041206F    add         al,2F
 00412071    add         al,2F
 00412073    add         al,2F
 00412075    add         al,2F
 00412077    add         al,2F
 00412079    add         al,2F
 0041207B    add         al,2F
 0041207D    add         al,2F
 0041207F    add         al,2F
 00412081    add         al,2F
 00412083    add         al,0
 00412085    pop         ss
>00412086    jp          0041208D
 00412088    loopne      0041208C
 0041208A    adc         byte ptr [edi],dl
 0041208C    and         byte ptr [edi],dl
 0041208E    add         al,0E0
 00412091    add         dh,byte ptr [eax]
 00412093    pop         ss
 00412094    das
 00412095    add         al,2F
 00412097    add         al,2F
 00412099    add         al,2F
 0041209B    add         al,2F
 0041209D    add         al,2F
 0041209F    add         al,2F
 004120A1    add         al,2F
 004120A3    add         al,0E0
 004120A5    add         ah,al
 004120A7    add         ah,al
 004120A9    add         al,byte ptr [eax+17]
 004120AC    loopne      004120B0
 004120AE    push        eax
 004120AF    pop         ss
 004120B0    loopne      004120B4
 004120B2    pushad
 004120B3    pop         ss
 004120B4    das
 004120B5    add         al,2F
 004120B7    add         al,2F
 004120B9    add         al,2F
 004120BB    add         al,2F
 004120BD    add         al,2F
 004120BF    add         al,2F
 004120C1    add         al,2F
 004120C3    add         al,0E0
 004120C5    add         ah,al
 004120C7    add         ah,al
 004120C9    add         ah,al
 004120CB    add         bl,byte ptr [edi]
 004120CD    or          ebp,dword ptr [edi]
 004120CF    add         al,2F
 004120D1    add         al,2F
 004120D3    add         al,2F
 004120D5    add         al,2F
 004120D7    add         al,2F
 004120D9    add         al,2F
 004120DB    add         al,2F
 004120DD    add         al,2F
 004120DF    add         al,2F
 004120E1    add         al,2F
 004120E3    add         al,2F
 004120E5    add         al,2F
 004120E7    add         al,2F
 004120E9    add         al,2F
 004120EB    add         al,2F
 004120ED    add         al,2F
 004120EF    add         al,0D9
 004120F1    or          esi,ebx
 004120F3    or          dword ptr [edi],ebp
 004120F5    add         al,2F
 004120F7    add         al,2F
 004120F9    add         al,2F
 004120FB    add         al,2F
 004120FD    add         al,2F
 004120FF    add         al,2F
 00412101    add         al,2F
 00412103    add         al,2F
 00412105    add         al,2F
 00412107    add         al,2F
 00412109    add         al,2F
 0041210B    add         al,2F
 0041210D    add         al,2F
 0041210F    add         al,2F
 00412111    add         al,2F
 00412113    add         al,41
 00412115    add         al,0E0
 00412117    add         ah,al
 00412119    add         dh,byte ptr [eax+17]
 0041211C    sub         eax,2F042F04
 00412121    add         al,2F
 00412123    add         al,0E0
 00412125    add         ah,al
 00412127    add         ah,al
 00412129    add         ah,al
 0041212B    add         ah,al
 0041212D    add         ah,al
 0041212F    add         ch,ah
 00412131    add         ch,byte ptr [edi]
 00412133    add         al,2F
 00412135    add         al,2F
 00412137    add         al,2F
 00412139    add         al,2F
 0041213B    add         al,2F
 0041213D    add         al,2F
 0041213F    add         al,2F
 00412141    add         al,2F
 00412143    add         al,10
 00412145    ???
 00412146    adc         byte ptr [edi],cl
 00412148    adc         byte ptr [edi],cl
 0041214A    adc         byte ptr [edi],cl
 0041214C    adc         byte ptr [edi],cl
 0041214E    adc         byte ptr [edi],cl
 00412150    pop         esi
 00412151    or          ch,byte ptr [ebx]
 00412153    add         al,2F
 00412155    add         al,2F
 00412157    add         al,2F
 00412159    add         al,2F
 0041215B    add         al,2F
 0041215D    add         al,2F
 0041215F    add         al,2F
 00412161    add         al,2F
 00412163    add         al,0E0
 00412165    add         ah,al
 00412167    add         ch,ah
 00412169    add         ch,byte ptr [edi]
 0041216B    add         al,2F
 0041216D    add         al,2F
 0041216F    add         al,2F
 00412171    add         al,2F
 00412173    add         al,2F
 00412175    add         al,2F
 00412177    add         al,2F
 00412179    add         al,2F
 0041217B    add         al,2F
 0041217D    add         al,2F
 0041217F    add         al,2F
 00412181    add         al,2F
 00412183    add         al,0B0
 00412185    or          esi,dword ptr [eax-4FF44FF5]
 0041218B    or          esi,dword ptr [eax-4FF44FF5]
 00412191    or          esi,dword ptr [eax-4FF44FF5]
 00412197    or          esi,dword ptr [eax-4FF44FF5]
 0041219D    or          esi,dword ptr [eax-1FF44FF5]
 004121A3    adc         dword ptr [eax+780BB00B],esi
 004121A9    adc         byte ptr [eax-4FF44FF5],dh
 004121AF    or          eax,dword ptr [eax-5FE86FE9]
 004121B5    pop         ss
 004121B6    mov         al,0B
 004121B8    mov         al,17
 004121BA    mov         al,0B
 004121BC    mov         al,0B
 004121BE    rcl         byte ptr [edi],2F
 004121C1    add         al,2F
 004121C3    add         al,0B0
 004121C5    or          esi,dword ptr [eax-4FF44FF5]
 004121CB    or          edx,eax
 004121CD    pop         ss
 004121CE    das
 004121CF    add         al,2F
 004121D1    add         al,2F
 004121D3    add         al,2F
 004121D5    add         al,2F
 004121D7    add         al,2F
 004121D9    add         al,2F
 004121DB    add         al,2F
 004121DD    add         al,2F
 004121DF    add         al,2F
 004121E1    add         al,2F
 004121E3    add         al,0B0
 004121E5    or          esi,dword ptr [eax-4FF44FF5]
 004121EB    or          esi,dword ptr [eax-26F01FF5]
 004121F1    or          eax,esp
 004121F3    pop         ss
 004121F4    das
 004121F5    add         al,2F
 004121F7    add         al,2F
 004121F9    add         al,2F
 004121FB    add         al,2F
 004121FD    add         al,2F
 004121FF    add         al,2F
 00412201    add         al,2F
 00412203    add         al,31
 00412205    add         al,dh
 00412207    pop         ss
 00412208    push        ecx
 00412209    add         byte ptr [eax],al
 0041220B    sbb         byte ptr [eax],dl
 0041220D    sbb         byte ptr [eax],ah
 0041220F    sbb         byte ptr [eax],dh
 00412211    or          eax,20A0031
 00412216    xor         byte ptr [eax],bl
 00412218    inc         eax
 00412219    sbb         byte ptr [eax+18],dl
 0041221C    and         dword ptr [eax],ebx
 0041221E    xor         dword ptr [eax],eax
 00412220    lock pop    ss
 00412222    push        ecx
 00412223    add         byte ptr [eax+18],ah
>00412226    jo          00412240
 00412228    push        ecx
 00412229    add         byte ptr [eax-5FE76FE8],al
 0041222F    sbb         byte ptr [eax+6003118],dh
 00412235    add         dl,byte ptr [ecx]
 00412238    xor         dword ptr [eax],eax
 0041223A    lock pop    ss
 0041223C    push        ecx
 0041223D    add         byte ptr [eax],al
 0041223F    sbb         byte ptr [eax],dl
 00412241    sbb         byte ptr [ecx],dl
 00412244    xor         byte ptr ds:[20A0031],cl
 0041224A    mov         al,18
 0041224C    xor         dword ptr [eax],eax
 0041224E    push        es
 0041224F    add         dl,byte ptr [ecx]
 00412252    xor         dword ptr [eax],eax
 00412254    lock pop    ss
 00412256    push        ecx
 00412257    add         al,al
 00412259    sbb         byte ptr [ecx],dh
 0041225B    add         al,dl
 0041225D    sbb         al,ah
 0041225F    sbb         byte ptr [edx],al
 00412261    sbb         al,dh
 00412263    sbb         byte ptr [ecx],dl
 00412266    add         byte ptr [ecx],bl
 00412268    xor         dword ptr [eax],eax
 0041226A    int         3
 0041226B    sbb         ah,bl
 0041226D    sbb         dh,bh
 0041226F    pop         ss
 00412270    adc         byte ptr [ecx],bl
 00412272    push        ecx
 00412273    add         ah,bh
 00412275    sbb         byte ptr [ecx],dh
 00412277    add         al,cl
 00412279    sbb         byte ptr [ecx],dl
 0041227C    and         byte ptr [ecx],bl
 0041227E    xor         byte ptr [ecx],bl
 00412280    sbb         dword ptr cs:[esi],ebp
 00412283    sbb         dword ptr [eax-0FF44FF5],esi
 00412289    adc         dword ptr [eax-4FF44FF5],esi
 0041228F    or          esi,dword ptr [eax-4FF44FF5]
 00412295    or          edx,eax
 00412297    adc         dword ptr [edi],ebp
 00412299    add         al,2F
 0041229B    add         al,2F
 0041229D    add         al,2F
 0041229F    add         al,2F
 004122A1    add         al,2F
 004122A3    add         al,40
 004122A5    sbb         dword ptr [eax+50105D0B],esi
 004122AB    sbb         dword ptr [eax+19],esp
>004122AE    jo          004122C9
 004122B0    das
 004122B1    add         al,80
 004122B3    sbb         dword ptr [eax+2F19A019],edx
 004122B9    add         al,2F
 004122BB    add         al,2F
 004122BD    add         al,2F
 004122BF    add         al,2F
 004122C1    add         al,2F
 004122C3    add         al,0A0
 004122C5    sbb         dword ptr [eax-4FF44FF5],esi
 004122CB    sbb         eax,eax
 004122CD    sbb         dword ptr [edi],ebp
 004122CF    add         al,2F
 004122D1    add         al,2F
 004122D3    add         al,2F
 004122D5    add         al,2F
 004122D7    add         al,2F
 004122D9    add         al,2F
 004122DB    add         al,2F
 004122DD    add         al,2F
 004122DF    add         al,2F
 004122E1    add         al,2F
 004122E3    add         al,0E0
 004122E5    add         ah,al
 004122E7    add         ah,al
 004122E9    add         ah,al
 004122EB    add         ah,al
 004122ED    add         ah,al
 004122EF    add         ah,al
 004122F1    add         ah,al
 004122F3    add         ah,al
 004122F5    add         ah,al
 004122F7    add         ah,al
 004122F9    add         ah,al
 004122FB    add         ah,al
 004122FD    add         dl,byte ptr [eax+2F042F11]
 00412303    add         al,0E0
 00412305    add         ah,al
 00412307    add         ah,al
 00412309    add         al,byte ptr [eax]
 0041230B    or          ch,byte ptr [edi]
 0041230D    add         al,2F
 0041230F    add         al,2F
 00412311    add         al,2F
 00412313    add         al,2F
 00412315    add         al,2F
 00412317    add         al,2F
 00412319    add         al,2F
 0041231B    add         al,2F
 0041231D    add         al,2F
 0041231F    add         al,2F
 00412321    add         al,2F
 00412323    add         al,0E0
 00412325    add         ch,ch
 00412327    add         ch,byte ptr [edi]
 00412329    add         al,2F
 0041232B    add         al,2F
 0041232D    add         al,2F
 0041232F    add         al,2F
 00412331    add         al,2F
 00412333    add         al,2F
 00412335    add         al,2F
 00412337    add         al,2F
 00412339    add         al,2F
 0041233B    add         al,2F
 0041233D    add         al,2F
 0041233F    add         al,2F
 00412341    add         al,2F
 00412343    add         al,0D0
 00412345    sbb         dword ptr [edi],ebp
 00412347    add         al,0E0
 00412349    sbb         eax,esp
 0041234B    sbb         eax,esp
 0041234D    sbb         eax,esp
 0041234F    sbb         eax,esp
 00412351    sbb         eax,esp
 00412353    sbb         dword ptr [edi],ebp
 00412355    add         al,2F
 00412357    add         al,2F
 00412359    add         al,2F
 0041235B    add         al,2F
 0041235D    add         al,2F
 0041235F    add         al,2F
 00412361    add         al,2F
 00412363    add         al,0C0
 00412365    add         eax,eax
 00412367    add         eax,eax
 00412369    add         eax,eax
 0041236B    add         eax,eax
 0041236D    add         eax,eax
 0041236F    add         eax,eax
 00412371    add         eax,eax
 00412373    add         eax,eax
 00412375    add         eax,eax
 00412377    add         eax,eax
 00412379    add         eax,eax
 0041237B    add         eax,eax
 0041237D    add         eax,eax
 0041237F    add         eax,eax
 00412381    add         dword ptr [edi],ebp
 00412383    add         al,0C0
 00412385    adc         al,0C0
 00412387    adc         al,0C0
 00412389    adc         al,0C0
 0041238B    adc         al,0C0
 0041238D    adc         al,0C0
 0041238F    adc         al,0C0
 00412391    adc         al,0C0
 00412393    adc         al,0C0
 00412395    adc         al,0C0
 00412397    adc         al,0C0
 00412399    adc         al,0C0
 0041239B    adc         al,0C0
 0041239D    adc         al,0C0
 0041239F    adc         al,0C0
 004123A1    adc         al,0F0
 004123A3    sbb         dword ptr [eax],eax
 004123A5    add         byte ptr [eax],al
 004123A7    add         byte ptr [eax],al
 004123A9    add         byte ptr [eax],al
 004123AB    add         byte ptr [eax],al
 004123AD    add         byte ptr [eax],al
 004123AF    add         byte ptr [eax],al
 004123B1    add         byte ptr [eax],al
 004123B3    add         byte ptr ds:[17151515],bl
 004123B9    adc         eax,12161515
 004123BE    adc         eax,15111519
 004123C3    adc         eax,0D0D0D0D
 004123C8    or          eax,0D0D0D0D
 004123CD    or          eax,19191515
 004123D2    sbb         dword ptr ds:[9090915],edx
 004123D8    or          dword ptr [ecx],ecx
 004123DA    or          dword ptr [ecx],ecx
 004123DC    or          dword ptr [ecx],ecx
 004123DE    or          dword ptr [ecx],ecx
 004123E0    or          dword ptr [ecx],ecx
 004123E2    or          dword ptr [ecx],ecx
 004123E4    or          dword ptr [ecx],ecx
 004123E6    or          dword ptr [ecx],ecx
 004123E8    or          dword ptr [ecx],ecx
 004123EA    or          dword ptr [ecx],ecx
 004123EC    or          dword ptr [ecx],ecx
 004123EE    or          dword ptr [esi],edx
 004123F0    adc         eax,18101812
 004123F5    add         eax,5050505
 004123FA    add         eax,5050505
 004123FF    add         eax,5050505
 00412404    add         eax,5050505
 00412409    add         eax,5050505
 0041240E    add         eax,19121916
 00412413    add         byte ptr ds:[17171715],bl
 00412419    pop         ss
 0041241A    sbb         bl,byte ptr [edx]
 0041241C    sbb         byte ptr [edx],bl
 0041241E    add         eax,1A011914
 00412423    sbb         byte ptr [edx],bl
 00412425    sbb         dword ptr [edi],ecx
 00412427    ???
 00412428    sbb         byte ptr ds:[0F18151A],al
 0041242E    add         eax,0F0F0F13
 00412433    adc         eax,9090909
 00412438    or          dword ptr [ecx],ecx
 0041243A    or          dword ptr [ecx],ebx
 0041243C    or          dword ptr [ecx],ecx
 0041243E    or          dword ptr [ecx],ecx
 00412440    or          dword ptr [ecx],ecx
 00412442    or          dword ptr ds:[5050505],eax
 00412448    add         eax,5190505
 0041244D    add         eax,5050505
 00412452    add         eax,9050905
 00412457    add         eax,5090509
 0041245C    or          dword ptr ds:[5090509],eax
 00412462    or          dword ptr ds:[5090509],eax
 00412468    or          dword ptr ds:[9050509],eax
 0041246E    add         eax,5090509
 00412473    or          dword ptr [ecx],ecx
 00412475    add         eax,5090509
 0041247A    or          dword ptr ds:[9050909],eax
 00412480    add         eax,5050509
 00412485    or          dword ptr [ecx],ecx
 00412487    add         eax,9090509
 0041248C    add         eax,5090909
 00412491    add         eax,9090909
 00412496    add         eax,9050909
 0041249B    or          dword ptr [ecx],ecx
 0041249D    add         eax,9090505
 004124A2    add         eax,9050909
 004124A7    add         eax,9090509
 004124AC    add         eax,9050509
 004124B1    add         eax,9050909
 004124B6    or          dword ptr [ecx],ecx
 004124B8    add         eax,9090509
 004124BD    add         eax,5090705
 004124C2    add         eax,7070705
 004124C7    pop         es
 004124C8    or          dword ptr [eax],ecx
 004124CA    add         eax,9050809
 004124CF    or          byte ptr ds:[5090509],al
 004124D5    or          dword ptr [eax],ecx
 004124D7    add         eax,9090509
 004124DC    or          dword ptr ds:[5090509],eax
 004124E2    or          dword ptr ds:[5090509],eax
 004124E8    add         eax,5050505
 004124ED    add         eax,9050909
 004124F2    or          dword ptr ds:[9050905],eax
 004124F8    or          dword ptr [ecx],ecx
 004124FA    or          dword ptr ds:[5090509],eax
 00412500    or          dword ptr ds:[5050509],eax
 00412506    add         eax,5050705
 0041250B    add         eax,5050505
 00412510    add         eax,6050505
 00412515    push        es
 00412516    push        es
 00412517    push        es
 00412518    push        es
 00412519    push        es
 0041251A    push        es
 0041251B    push        es
 0041251C    push        es
 0041251D    push        es
 0041251E    push        es
 0041251F    push        es
 00412520    push        es
 00412521    push        es
 00412522    push        es
 00412523    push        es
 00412524    push        es
 00412525    push        es
 00412526    sbb         byte ptr [eax],bl
 00412528    sbb         byte ptr [eax],bl
 0041252A    push        es
 0041252B    push        es
 0041252C    push        es
 0041252D    push        es
 0041252E    push        es
 0041252F    push        es
 00412530    push        es
 00412531    push        es
 00412532    push        es
 00412533    push        es
 00412534    push        es
 00412535    push        es
 00412536    sbb         byte ptr [eax],bl
 00412538    sbb         byte ptr [eax],bl
 0041253A    sbb         byte ptr [eax],bl
 0041253C    sbb         byte ptr [eax],bl
 0041253E    sbb         byte ptr [eax],bl
 00412540    sbb         byte ptr [eax],bl
 00412542    sbb         byte ptr [eax],bl
 00412544    push        es
 00412545    push        es
 00412546    push        es
 00412547    push        es
 00412548    push        es
 00412549    sbb         byte ptr [eax],bl
 0041254B    sbb         byte ptr [eax],bl
 0041254D    sbb         byte ptr [eax],bl
 0041254F    sbb         byte ptr [esi],al
 00412551    sbb         byte ptr [esi],al
 00412553    sbb         byte ptr [eax],bl
 00412555    sbb         byte ptr [eax],bl
 00412557    sbb         byte ptr [eax],bl
 00412559    sbb         byte ptr [eax],bl
 0041255B    sbb         byte ptr [eax],bl
 0041255D    sbb         byte ptr [eax],bl
 0041255F    sbb         byte ptr [eax],bl
 00412561    sbb         byte ptr [eax],bl
 00412563    sbb         byte ptr [esp+ecx],cl
 00412566    or          al,0C
 00412568    or          al,0C
 0041256A    or          al,0C
 0041256C    or          al,0C
 0041256E    or          al,0C
 00412570    or          al,0C
 00412572    or          al,0C
 00412574    or          dword ptr ds:[18060509],eax
 0041257A    or          dword ptr ds:[5060202],eax
 00412580    add         eax,2021505
 00412585    add         al,byte ptr [edx]
 00412587    add         bl,byte ptr [eax]
 00412589    sbb         byte ptr [ecx],cl
 0041258B    adc         eax,2090909
 00412590    or          dword ptr [edx],eax
 00412592    or          dword ptr [ecx],ecx
 00412594    add         eax,9090909
 00412599    or          dword ptr [ecx],ecx
 0041259B    or          dword ptr [ecx],ecx
 0041259D    or          dword ptr [ecx],ecx
 0041259F    or          dword ptr [ecx],ecx
 004125A1    or          dword ptr [ecx],ecx
 004125A3    or          dword ptr [ecx],ecx
 004125A5    or          dword ptr [edx],eax
 004125A7    or          dword ptr [ecx],ecx
 004125A9    or          dword ptr [ecx],ecx
 004125AB    or          dword ptr [ecx],ecx
 004125AD    or          dword ptr [ecx],ecx
 004125AF    or          dword ptr ds:[5050505],eax
 004125B5    add         eax,5050505
 004125BA    add         eax,5050505
 004125BF    add         eax,9050505
 004125C4    add         eax,9090905
 004125C9    add         eax,5090505
 004125CE    or          dword ptr ds:[5090509],eax
 004125D4    add         eax,9050505
 004125D9    add         eax,9050919
 004125DE    or          dword ptr ds:[9090905],eax
 004125E4    or          dword ptr ds:[0C0C0C1A],eax
 004125EA    or          al,0C
 004125EC    or          ecx,dword ptr [ebx]
 004125EE    or          dword ptr ds:[5090509],eax
 004125F4    or          dword ptr [ecx],ecx
 004125F6    add         eax,5090509
 004125FB    or          dword ptr ds:[5090509],eax
 00412601    or          dword ptr ds:[9050905],eax
 00412607    add         eax,2020509
 0041260C    add         al,byte ptr [edx]
 0041260E    add         al,byte ptr [edx]
 00412610    add         al,byte ptr [edx]
 00412612    add         al,byte ptr [edx]
 00412614    add         cl,byte ptr [ecx]
 00412616    or          dword ptr [ecx],ecx
 00412618    or          dword ptr [ecx],ecx
 0041261A    or          dword ptr [ecx],ecx
 0041261C    or          dword ptr [ecx],ecx
 0041261E    or          dword ptr [ecx],ecx
 00412620    or          dword ptr [ecx],ecx
 00412622    or          dword ptr [ecx],ecx
 00412624    or          dword ptr [ecx],ecx
 00412626    or          dword ptr [ecx],ecx
 00412628    or          dword ptr [ecx],ecx
 0041262A    or          dword ptr [edx],eax
 0041262C    add         al,byte ptr [esi]
 0041262E    adc         eax,15151515
 00412633    adc         eax,5050502
 00412638    add         eax,5050505
 0041263D    add         eax,5050505
 00412642    add         eax,5050505
 00412647    add         eax,5050505
 0041264C    add         dl,byte ptr ds:[2020211]
 00412652    add         al,byte ptr [edx]
 00412654    add         cl,byte ptr [esp+ecx]
 00412657    or          al,0C
 00412659    or          al,0C
 0041265B    or          al,0C
 0041265D    or          al,0C
 0041265F    or          al,0C
 00412661    or          al,0C
 00412663    or          al,0C
 00412665    or          al,0C
 00412667    or          al,0C
 00412669    or          al,0C
 0041266B    or          al,0C
 0041266D    or          al,0C
 0041266F    or          al,0C
 00412671    or          al,11
 00412673    or          al,15
 00412675    or          al,0C
 00412677    adc         eax,0C150C0C
 0041267C    add         al,byte ptr [edx]
 0041267E    add         al,byte ptr [edx]
 00412680    add         al,byte ptr [edx]
 00412682    add         al,byte ptr [edx]
 00412684    pop         es
 00412685    pop         es
 00412686    pop         es
 00412687    pop         es
 00412688    pop         es
 00412689    pop         es
 0041268A    pop         es
 0041268B    pop         es
 0041268C    pop         es
 0041268D    pop         es
 0041268E    pop         es
 0041268F    pop         es
 00412690    pop         es
 00412691    pop         es
 00412692    pop         es
 00412693    pop         es
 00412694    pop         es
 00412695    pop         es
 00412696    pop         es
 00412697    pop         es
 00412698    pop         es
 00412699    pop         es
 0041269A    pop         es
 0041269B    pop         es
 0041269C    pop         es
 0041269D    pop         es
 0041269E    pop         es
 0041269F    add         al,byte ptr [edx]
 004126A1    add         al,byte ptr [edx]
 004126A3    add         al,byte ptr [edi]
 004126A5    pop         es
 004126A6    pop         es
 004126A7    adc         eax,2020215
 004126AC    add         al,byte ptr [edx]
 004126AE    add         al,byte ptr [edx]
 004126B0    add         al,byte ptr [edx]
 004126B2    add         al,byte ptr [edx]
 004126B4    add         dword ptr [ecx],eax
 004126B6    add         dword ptr [ecx],eax
 004126B8    add         al,byte ptr [edx]
 004126BA    sbb         dword ptr [ecx],ebx
 004126BC    sbb         dword ptr ds:[15151715],edx
 004126C2    sbb         bl,byte ptr [edx]
 004126C4    or          al,0C
 004126C6    or          al,0C
 004126C8    or          al,0C
 004126CA    or          al,0C
 004126CC    or          al,0C
 004126CE    or          al,15
 004126D0    add         al,byte ptr [edx]
 004126D2    adc         eax,7070615
 004126D7    pop         es
 004126D8    pop         es
 004126D9    pop         es
 004126DA    pop         es
 004126DB    pop         es
 004126DC    pop         es
 004126DD    pop         es
 004126DE    pop         es
 004126DF    or          al,0C
 004126E1    or          al,0C
 004126E3    or          al,0C
 004126E5    or          al,0C
 004126E7    or          al,0C
 004126E9    or          al,0C
 004126EB    or          al,0C
 004126ED    or          al,0C
 004126EF    or          al,0C
 004126F1    or          al,0C
 004126F3    add         cl,byte ptr ds:[0D0D0D0D]
 004126F9    or          eax,0D0D0D0D
 004126FE    adc         eax,7151515
 00412703    pop         es
 00412704    or          al,7
 00412706    pop         es
 00412707    pop         es
 00412708    pop         es
 00412709    pop         es
 0041270A    pop         es
 0041270B    pop         es
 0041270C    pop         es
 0041270D    pop         es
 0041270E    pop         es
 0041270F    pop         es
 00412710    pop         es
 00412711    pop         es
 00412712    pop         es
 00412713    pop         es
 00412714    pop         es
 00412715    pop         es
 00412716    pop         es
 00412717    pop         es
 00412718    adc         eax,0C0C0C07
 0041271D    or          al,0C
 0041271F    or          al,0C
 00412721    add         dword ptr [ebx],ecx
 00412723    or          al,0C
 00412725    or          al,0C
 00412727    or          al,0C
 00412729    push        es
 0041272A    push        es
 0041272B    or          al,0C
 0041272D    sbb         cl,byte ptr [esp+ecx]
 00412730    or          al,0C
 00412732    pop         es
 00412733    pop         es
 00412734    or          eax,0D0D0D0D
 00412739    or          eax,0D0D0D0D
 0041273E    pop         es
 0041273F    pop         es
 00412740    pop         es
 00412741    sbb         bl,byte ptr [edx]
 00412743    pop         es
 00412744    adc         eax,15151515
 00412749    adc         eax,15151515
 0041274E    adc         eax,2151515
 00412753    add         dword ptr [esp+ecx],ecx
 00412756    or          al,0C
 00412758    or          al,0C
 0041275A    or          al,0C
 0041275C    or          al,0C
 0041275E    or          al,2
 00412760    add         al,byte ptr [edi]
 00412762    pop         es
 00412763    pop         es
 00412764    or          al,7
 00412766    add         al,byte ptr [edx]
 00412768    add         al,byte ptr [edx]
 0041276A    add         al,byte ptr [edx]
 0041276C    add         al,byte ptr [edx]
 0041276E    add         al,byte ptr [edx]
 00412770    add         al,byte ptr [edx]
 00412772    add         al,byte ptr [edx]
 00412774    or          eax,0D0D0D0D
 00412779    or          eax,0D0D0D0D
 0041277E    pop         es
 0041277F    pop         es
 00412780    pop         es
 00412781    pop         es
 00412782    pop         es
 00412783    pop         es
 00412784    pop         es
 00412785    pop         es
 00412786    pop         es
 00412787    pop         es
 00412788    pop         es
 00412789    pop         es
 0041278A    pop         es
 0041278B    pop         es
 0041278C    pop         es
 0041278D    pop         es
 0041278E    pop         es
 0041278F    or          al,0C
 00412791    or          al,0C
 00412793    or          al,0C
 00412795    or          al,0C
 00412797    or          al,6
 00412799    push        es
 0041279A    sbb         dl,byte ptr ds:[2061515]
 004127A0    add         al,byte ptr [edx]
 004127A2    add         al,byte ptr [edx]
 004127A4    pop         es
 004127A5    pop         es
 004127A6    pop         es
 004127A7    pop         es
 004127A8    pop         es
 004127A9    pop         es
 004127AA    or          al,0C
 004127AC    or          al,0C
 004127AE    push        es
 004127AF    or          al,0C
 004127B1    or          al,0C
 004127B3    or          al,0C
 004127B5    or          al,0C
 004127B7    or          al,6
 004127B9    or          al,0C
 004127BB    or          al,6
 004127BD    or          al,0C
 004127BF    or          al,0C
 004127C1    or          al,2
 004127C3    add         dl,byte ptr ds:[15151515]
 004127C9    adc         eax,15151515
 004127CE    adc         eax,15151515
 004127D3    add         al,byte ptr [edx]
 004127D5    add         al,byte ptr [edx]
 004127D7    add         al,byte ptr [edx]
 004127D9    add         al,byte ptr [edx]
 004127DB    add         al,byte ptr [edx]
 004127DD    add         al,byte ptr [edx]
 004127DF    add         al,byte ptr [edx]
 004127E1    add         al,byte ptr [edx]
 004127E3    add         cl,byte ptr [esp+ecx]
 004127E6    or          al,0A
 004127E8    pop         es
 004127E9    pop         es
 004127EA    pop         es
 004127EB    pop         es
 004127EC    pop         es
 004127ED    pop         es
 004127EE    pop         es
 004127EF    pop         es
 004127F0    pop         es
 004127F1    pop         es
 004127F2    pop         es
 004127F3    pop         es
 004127F4    pop         es
 004127F5    pop         es
 004127F6    pop         es
 004127F7    pop         es
 004127F8    pop         es
 004127F9    pop         es
 004127FA    pop         es
 004127FB    pop         es
 004127FC    pop         es
 004127FD    pop         es
 004127FE    add         al,byte ptr [edx]
 00412800    or          al,7
 00412802    or          cl,byte ptr [edx]
 00412804    or          cl,byte ptr [esp+ecx]
 00412807    or          al,0C
 00412809    or          al,0C
 0041280B    or          al,0C
 0041280D    or          cl,byte ptr [edx]
 0041280F    or          cl,byte ptr [edx]
 00412811    or          al,0A
 00412813    add         al,byte ptr [edi]
 00412815    or          al,0C
 00412817    or          al,0C
 00412819    or          al,2
 0041281B    add         al,byte ptr [edi]
 0041281D    pop         es
 0041281E    pop         es
 0041281F    pop         es
 00412820    pop         es
 00412821    pop         es
 00412822    pop         es
 00412823    pop         es
 00412824    pop         es
 00412825    pop         es
 00412826    or          al,0C
 00412828    adc         eax,0D0D0D15
 0041282D    or          eax,0D0D0D0D
 00412832    or          eax,706150D
 00412837    add         al,byte ptr [edx]
 00412839    add         al,byte ptr [edx]
 0041283B    add         al,byte ptr [edx]
 0041283D    pop         es
 0041283E    pop         es
 0041283F    pop         es
 00412840    pop         es
 00412841    pop         es
 00412842    pop         es
 00412843    pop         es
 00412844    add         cl,byte ptr [edx+ecx]
 00412847    or          al,byte ptr [edx]
 00412849    pop         es
 0041284A    pop         es
 0041284B    pop         es
 0041284C    pop         es
 0041284D    pop         es
 0041284E    pop         es
 0041284F    pop         es
 00412850    pop         es
 00412851    add         al,byte ptr [edx]
 00412853    pop         es
 00412854    pop         es
 00412855    add         al,byte ptr [edx]
 00412857    pop         es
 00412858    pop         es
 00412859    pop         es
 0041285A    pop         es
 0041285B    pop         es
 0041285C    pop         es
 0041285D    pop         es
 0041285E    pop         es
 0041285F    pop         es
 00412860    pop         es
 00412861    pop         es
 00412862    pop         es
 00412863    pop         es
 00412864    pop         es
 00412865    pop         es
 00412866    pop         es
 00412867    pop         es
 00412868    pop         es
 00412869    pop         es
 0041286A    pop         es
 0041286B    pop         es
 0041286C    pop         es
 0041286D    add         al,byte ptr [edi]
 0041286F    pop         es
 00412870    pop         es
 00412871    pop         es
 00412872    pop         es
 00412873    pop         es
 00412874    pop         es
 00412875    add         al,byte ptr [edi]
 00412877    add         al,byte ptr [edx]
 00412879    add         al,byte ptr [edi]
 0041287B    pop         es
 0041287C    pop         es
 0041287D    pop         es
 0041287E    add         al,byte ptr [edx]
 00412880    or          al,7
 00412882    or          cl,byte ptr [edx]
 00412884    or          cl,byte ptr [esp+ecx]
 00412887    or          al,0C
 00412889    add         al,byte ptr [edx]
 0041288B    or          cl,byte ptr [edx]
 0041288D    add         al,byte ptr [edx]
 0041288F    or          cl,byte ptr [edx]
 00412891    or          al,7
 00412893    add         al,byte ptr [edx]
 00412895    add         al,byte ptr [edx]
 00412897    add         al,byte ptr [edx]
 00412899    add         al,byte ptr [edx]
 0041289B    or          al,byte ptr [edx]
 0041289D    add         al,byte ptr [edx]
 0041289F    add         al,byte ptr [edi]
 004128A1    pop         es
 004128A2    add         al,byte ptr [edi]
 004128A4    pop         es
 004128A5    pop         es
 004128A6    or          al,0C
 004128A8    add         al,byte ptr [edx]
 004128AA    or          eax,0D0D0D0D
 004128AF    or          eax,0D0D0D0D
 004128B4    pop         es
 004128B5    pop         es
 004128B6    pop         ss
 004128B7    pop         ss
 004128B8    ???
 004128B9    ???
 004128BA    ???
 004128BB    ???
 004128BC    ???
 004128BD    ???
 004128BE    sbb         dl,byte ptr [edi]
 004128C0    add         al,byte ptr [edx]
 004128C2    add         al,byte ptr [edx]
 004128C4    add         cl,byte ptr [esp+ecx]
 004128C7    or          al,byte ptr [edx]
 004128C9    pop         es
 004128CA    pop         es
 004128CB    pop         es
 004128CC    pop         es
 004128CD    pop         es
 004128CE    pop         es
 004128CF    add         al,byte ptr [edx]
 004128D1    add         al,byte ptr [edx]
 004128D3    pop         es
 004128D4    pop         es
 004128D5    add         al,byte ptr [edi]
 004128D7    pop         es
 004128D8    add         al,byte ptr [edi]
 004128DA    pop         es
 004128DB    add         al,byte ptr [edi]
 004128DD    pop         es
 004128DE    add         al,byte ptr [edx]
 004128E0    or          al,2
 004128E2    or          cl,byte ptr [edx]
 004128E4    or          cl,byte ptr [esp+ecx]
 004128E7    add         al,byte ptr [edx]
 004128E9    add         al,byte ptr [edx]
 004128EB    or          al,0C
 004128ED    add         al,byte ptr [edx]
 004128EF    or          al,0C
 004128F1    or          al,2
 004128F3    add         al,byte ptr [edx]
 004128F5    or          al,2
 004128F7    add         al,byte ptr [edx]
 004128F9    add         al,byte ptr [edx]
 004128FB    add         al,byte ptr [edx]
 004128FD    pop         es
 004128FE    pop         es
 004128FF    pop         es
 00412900    pop         es
 00412901    add         al,byte ptr [edi]
 00412903    add         cl,byte ptr [esp+ecx]
 00412906    pop         es
 00412907    pop         es
 00412908    pop         es
 00412909    or          al,2
 0041290B    add         al,byte ptr [edx]
 0041290D    add         al,byte ptr [edx]
 0041290F    add         al,byte ptr [edx]
 00412911    add         al,byte ptr [edx]
 00412913    add         al,byte ptr [edx]
 00412915    or          al,0C
 00412917    or          al,byte ptr [edx]
 00412919    pop         es
 0041291A    pop         es
 0041291B    pop         es
 0041291C    pop         es
 0041291D    pop         es
 0041291E    pop         es
 0041291F    pop         es
 00412920    pop         es
 00412921    pop         es
 00412922    add         al,byte ptr [edi]
 00412924    pop         es
 00412925    pop         es
 00412926    add         al,byte ptr [edi]
 00412928    pop         es
 00412929    pop         es
 0041292A    pop         es
 0041292B    pop         es
 0041292C    pop         es
 0041292D    pop         es
 0041292E    pop         es
 0041292F    pop         es
 00412930    pop         es
 00412931    pop         es
 00412932    pop         es
 00412933    pop         es
 00412934    pop         es
 00412935    add         al,byte ptr [edi]
 00412937    pop         es
 00412938    add         al,byte ptr [edi]
 0041293A    pop         es
 0041293B    pop         es
 0041293C    pop         es
 0041293D    pop         es
 0041293E    add         al,byte ptr [edx]
 00412940    or          al,7
 00412942    or          cl,byte ptr [edx]
 00412944    or          cl,byte ptr [esp+ecx]
 00412947    or          al,0C
 00412949    or          al,2
 0041294B    or          al,0C
 0041294D    or          al,byte ptr [edx]
 0041294F    or          cl,byte ptr [edx]
 00412951    or          al,2
 00412953    add         al,byte ptr [edi]
 00412955    add         al,byte ptr [edx]
 00412957    add         al,byte ptr [edx]
 00412959    add         al,byte ptr [edx]
 0041295B    add         al,byte ptr [edx]
 0041295D    add         al,byte ptr [edx]
 0041295F    add         al,byte ptr [edx]
 00412961    add         al,byte ptr [edx]
 00412963    add         al,byte ptr [edx]
 00412965    pop         ss
 00412966    add         al,byte ptr [edx]
 00412968    add         al,byte ptr [edx]
 0041296A    add         al,byte ptr [edx]
 0041296C    add         al,byte ptr [edx]
 0041296E    add         al,byte ptr [edx]
 00412970    add         al,byte ptr [edx]
 00412972    add         al,byte ptr [edx]
 00412974    pop         es
 00412975    add         al,byte ptr [edi]
 00412977    pop         es
 00412978    add         al,byte ptr [edi]
 0041297A    pop         es
 0041297B    pop         es
 0041297C    pop         es
 0041297D    pop         es
 0041297E    add         al,byte ptr [edx]
 00412980    or          al,7
 00412982    or          cl,byte ptr [edx+ecx]
 00412985    or          al,0C
 00412987    or          al,0C
 00412989    add         al,byte ptr [edx]
 0041298B    or          cl,byte ptr [edx]
 0041298D    add         al,byte ptr [edx]
 0041298F    or          cl,byte ptr [edx]
 00412991    or          al,2
 00412993    add         al,byte ptr [edx]
 00412995    add         al,byte ptr [edx]
 00412997    add         al,byte ptr [edx]
 00412999    add         cl,byte ptr [edx+ecx]
 0041299C    add         al,byte ptr [edx]
 0041299E    add         al,byte ptr [edx]
 004129A0    pop         es
 004129A1    pop         es
 004129A2    add         al,byte ptr [edi]
 004129A4    sbb         al,byte ptr [edi]
 004129A6    add         al,byte ptr [edx]
 004129A8    add         al,byte ptr [edx]
 004129AA    add         al,byte ptr [edx]
 004129AC    add         al,byte ptr [edx]
 004129AE    add         al,byte ptr [edx]
 004129B0    add         al,byte ptr [edx]
 004129B2    add         al,byte ptr [edx]
 004129B4    add         al,byte ptr [edx]
 004129B6    or          al,7
 004129B8    add         al,byte ptr [edi]
 004129BA    pop         es
 004129BB    pop         es
 004129BC    pop         es
 004129BD    pop         es
 004129BE    pop         es
 004129BF    add         al,byte ptr [edx]
 004129C1    add         al,byte ptr [edi]
 004129C3    pop         es
 004129C4    pop         es
 004129C5    add         al,byte ptr [edi]
 004129C7    pop         es
 004129C8    pop         es
 004129C9    pop         es
 004129CA    add         al,byte ptr [edx]
 004129CC    add         al,byte ptr [edi]
 004129CE    pop         es
 004129CF    add         al,byte ptr [edi]
 004129D1    add         al,byte ptr [edi]
 004129D3    pop         es
 004129D4    add         al,byte ptr [edx]
 004129D6    add         al,byte ptr [edi]
 004129D8    pop         es
 004129D9    add         al,byte ptr [edx]
 004129DB    add         al,byte ptr [edi]
 004129DD    pop         es
 004129DE    pop         es
 004129DF    add         al,byte ptr [edx]
 004129E1    add         al,byte ptr [edi]
 004129E3    pop         es
 004129E4    pop         es
 004129E5    pop         es
 004129E6    pop         es
 004129E7    pop         es
 004129E8    pop         es
 004129E9    pop         es
 004129EA    pop         es
 004129EB    pop         es
 004129EC    pop         es
 004129ED    pop         es
 004129EE    add         al,byte ptr [edx]
 004129F0    add         al,byte ptr [edx]
 004129F2    or          cl,byte ptr [edx]
 004129F4    or          al,0A
 004129F6    or          al,byte ptr [edx]
 004129F8    add         al,byte ptr [edx]
 004129FA    or          cl,byte ptr [edx]
 004129FC    or          al,byte ptr [edx]
 004129FE    or          cl,byte ptr [edx]
 00412A00    or          cl,byte ptr [edx+eax]
 00412A03    add         al,byte ptr [edi]
 00412A05    add         al,byte ptr [edx]
 00412A07    add         al,byte ptr [edx]
 00412A09    add         al,byte ptr [edx]
 00412A0B    or          al,byte ptr [edx]
 00412A0D    add         al,byte ptr [edx]
 00412A0F    add         al,byte ptr [edx]
 00412A11    add         al,byte ptr [edx]
 00412A13    add         cl,byte ptr [edi]
 00412A15    ???
 00412A16    ???
 00412A17    sbb         bl,byte ptr [edx]
 00412A19    sbb         bl,byte ptr [edx]
 00412A1B    sbb         bl,byte ptr [edx]
 00412A1D    pop         ss
 00412A1E    sbb         al,byte ptr [edx]
 00412A20    add         al,byte ptr [edx]
 00412A22    add         al,byte ptr [edx]
 00412A24    add         cl,byte ptr [edx]
 00412A26    or          cl,byte ptr [edx]
 00412A28    add         al,byte ptr [edi]
 00412A2A    pop         es
 00412A2B    pop         es
 00412A2C    pop         es
 00412A2D    pop         es
 00412A2E    pop         es
 00412A2F    pop         es
 00412A30    pop         es
 00412A31    add         al,byte ptr [edi]
 00412A33    pop         es
 00412A34    pop         es
 00412A35    pop         es
 00412A36    pop         es
 00412A37    pop         es
 00412A38    add         al,byte ptr [edi]
 00412A3A    pop         es
 00412A3B    pop         es
 00412A3C    pop         es
 00412A3D    pop         es
 00412A3E    add         al,byte ptr [edx]
 00412A40    add         al,byte ptr [edi]
 00412A42    or          al,0C
 00412A44    or          al,0A
 00412A46    or          cl,byte ptr [edx]
 00412A48    or          al,byte ptr [edx]
 00412A4A    or          al,0C
 00412A4C    or          al,2
 00412A4E    or          al,0C
 00412A50    or          al,0C
 00412A52    add         al,byte ptr [edx]
 00412A54    add         al,byte ptr [edx]
 00412A56    add         al,byte ptr [edx]
 00412A58    add         cl,byte ptr [esp+ecx]
 00412A5B    add         al,byte ptr [edi]
 00412A5D    pop         es
 00412A5E    add         al,byte ptr [edx]
 00412A60    add         al,byte ptr [edx]
 00412A62    add         al,byte ptr [edx]
 00412A64    add         al,byte ptr [edx]
 00412A66    add         al,byte ptr [edx]
 00412A68    add         al,byte ptr [edx]
 00412A6A    add         al,byte ptr [edx]
 00412A6C    ???
 00412A6D    ???
 00412A6E    ???
 00412A6F    ???
 00412A70    ???
 00412A71    ???
 00412A72    ???
 00412A73    sbb         al,byte ptr [edx]
 00412A75    add         cl,byte ptr [edx]
 00412A77    or          al,byte ptr [edx]
 00412A79    pop         es
 00412A7A    pop         es
 00412A7B    pop         es
 00412A7C    pop         es
 00412A7D    pop         es
 00412A7E    pop         es
 00412A7F    pop         es
 00412A80    pop         es
 00412A81    add         al,byte ptr [edi]
 00412A83    pop         es
 00412A84    pop         es
 00412A85    pop         es
 00412A86    pop         es
 00412A87    pop         es
 00412A88    add         al,byte ptr [edi]
 00412A8A    pop         es
 00412A8B    pop         es
 00412A8C    pop         es
 00412A8D    pop         es
 00412A8E    add         al,byte ptr [edx]
 00412A90    or          al,7
 00412A92    or          cl,byte ptr [edx+ecx]
 00412A95    or          cl,byte ptr [edx]
 00412A97    or          cl,byte ptr [edx]
 00412A99    add         cl,byte ptr [edx+ecx]
 00412A9C    or          al,byte ptr [edx]
 00412A9E    or          cl,byte ptr [edx]
 00412AA0    or          al,0C
 00412AA2    add         al,byte ptr [edx]
 00412AA4    add         al,byte ptr [edx]
 00412AA6    add         al,byte ptr [edx]
 00412AA8    add         cl,byte ptr [edx]
 00412AAA    or          al,byte ptr [edx]
 00412AAC    add         al,byte ptr [edx]
 00412AAE    add         al,byte ptr [edx]
 00412AB0    add         al,byte ptr [edx]
 00412AB2    pop         es
 00412AB3    add         al,byte ptr [edx]
 00412AB5    sbb         bl,byte ptr [edx]
 00412AB7    add         al,byte ptr [edx]
 00412AB9    add         al,byte ptr [edx]
 00412ABB    add         al,byte ptr [edx]
 00412ABD    add         al,byte ptr [edx]
 00412ABF    add         al,byte ptr [edx]
 00412AC1    add         al,byte ptr [edx]
 00412AC3    add         al,byte ptr [edi]
 00412AC5    pop         es
 00412AC6    pop         es
 00412AC7    pop         es
 00412AC8    pop         es
 00412AC9    pop         es
 00412ACA    pop         es
 00412ACB    pop         es
 00412ACC    pop         es
 00412ACD    pop         es
 00412ACE    add         al,byte ptr [edx]
 00412AD0    add         al,byte ptr [edi]
 00412AD2    or          cl,byte ptr [edx]
 00412AD4    or          cl,byte ptr [esp+ecx]
 00412AD7    or          al,0C
 00412AD9    add         cl,byte ptr [edx]
 00412ADB    or          cl,byte ptr [edx]
 00412ADD    add         cl,byte ptr [edx]
 00412ADF    or          cl,byte ptr [edx]
 00412AE1    or          al,2
 00412AE3    add         al,byte ptr [edx]
 00412AE5    add         al,byte ptr [edx]
 00412AE7    add         al,byte ptr [edx]
 00412AE9    add         al,byte ptr [edx]
 00412AEB    or          al,byte ptr [edx]
 00412AED    add         al,byte ptr [edx]
 00412AEF    add         al,byte ptr [edx]
 00412AF1    add         al,byte ptr [edx]
 00412AF3    add         cl,byte ptr [edi]
 00412AF5    ???
 00412AF6    ???
 00412AF7    ???
 00412AF8    ???
 00412AF9    lar         eax,dword ptr [edx]
 00412AFC    add         bl,byte ptr [edx]
 00412AFE    pop         es
 00412AFF    pop         es
 00412B00    pop         es
 00412B01    pop         es
 00412B02    pop         es
 00412B03    pop         es
 00412B04    add         al,byte ptr [edx]
 00412B06    or          cl,byte ptr [edx]
 00412B08    add         al,byte ptr [edi]
 00412B0A    pop         es
 00412B0B    pop         es
 00412B0C    pop         es
 00412B0D    pop         es
 00412B0E    pop         es
 00412B0F    pop         es
 00412B10    pop         es
 00412B11    pop         es
 00412B12    pop         es
 00412B13    pop         es
 00412B14    pop         es
 00412B15    pop         es
 00412B16    pop         es
 00412B17    pop         es
 00412B18    pop         es
 00412B19    pop         es
 00412B1A    pop         es
 00412B1B    add         al,byte ptr [edx]
 00412B1D    add         al,byte ptr [edi]
 00412B1F    pop         es
 00412B20    pop         es
 00412B21    pop         es
 00412B22    pop         es
 00412B23    pop         es
 00412B24    pop         es
 00412B25    pop         es
 00412B26    add         al,byte ptr [edi]
 00412B28    pop         es
 00412B29    pop         es
 00412B2A    pop         es
 00412B2B    pop         es
 00412B2C    pop         es
 00412B2D    pop         es
 00412B2E    pop         es
 00412B2F    pop         es
 00412B30    add         al,byte ptr [edi]
 00412B32    add         al,byte ptr [edx]
 00412B34    pop         es
 00412B35    pop         es
 00412B36    pop         es
 00412B37    pop         es
 00412B38    pop         es
 00412B39    pop         es
 00412B3A    pop         es
 00412B3B    add         al,byte ptr [edx]
 00412B3D    add         cl,byte ptr [edx+eax]
 00412B40    add         al,byte ptr [edx]
 00412B42    add         cl,byte ptr [edx]
 00412B44    or          cl,byte ptr [edx]
 00412B46    or          al,0C
 00412B48    or          al,2
 00412B4A    or          al,2
 00412B4C    or          cl,byte ptr [edx]
 00412B4E    or          cl,byte ptr [edx]
 00412B50    or          cl,byte ptr [edx]
 00412B52    or          cl,byte ptr [edx]
 00412B54    add         al,byte ptr [edx]
 00412B56    or          cl,byte ptr [edx]
 00412B58    adc         eax,2020202
 00412B5D    add         al,byte ptr [edx]
 00412B5F    add         al,byte ptr [edx]
 00412B61    add         al,byte ptr [edx]
 00412B63    add         al,byte ptr [edi]
 00412B65    or          al,7
 00412B67    pop         es
 00412B68    or          al,0C
 00412B6A    or          al,0C
 00412B6C    or          al,0C
 00412B6E    or          al,2
 00412B70    add         al,byte ptr [edx]
 00412B72    add         dl,byte ptr [edi]
 00412B74    pop         es
 00412B75    pop         es
 00412B76    pop         es
 00412B77    pop         es
 00412B78    pop         es
 00412B79    pop         es
 00412B7A    push        es
 00412B7B    or          al,0C
 00412B7D    or          al,0C
 00412B7F    or          al,0C
 00412B81    or          al,0C
 00412B83    adc         eax,0D0D0D0D
 00412B88    or          eax,0D0D0D0D
 00412B8D    or          eax,2021515
 00412B92    add         al,byte ptr [edx]
 00412B94    add         al,byte ptr [edi]
 00412B96    pop         es
 00412B97    add         al,byte ptr [edi]
 00412B99    add         al,byte ptr [edx]
 00412B9B    pop         es
 00412B9C    pop         es
 00412B9D    add         al,byte ptr [edi]
 00412B9F    add         al,byte ptr [edx]
 00412BA1    pop         es
 00412BA2    add         al,byte ptr [edx]
 00412BA4    add         al,byte ptr [edx]
 00412BA6    add         al,byte ptr [edx]
 00412BA8    pop         es
 00412BA9    pop         es
 00412BAA    pop         es
 00412BAB    pop         es
 00412BAC    add         al,byte ptr [edi]
 00412BAE    pop         es
 00412BAF    pop         es
 00412BB0    pop         es
 00412BB1    pop         es
 00412BB2    pop         es
 00412BB3    pop         es
 00412BB4    add         al,byte ptr [edi]
 00412BB6    pop         es
 00412BB7    pop         es
 00412BB8    add         al,byte ptr [edi]
 00412BBA    add         al,byte ptr [edi]
 00412BBC    add         al,byte ptr [edx]
 00412BBE    pop         es
 00412BBF    pop         es
 00412BC0    add         al,byte ptr [edi]
 00412BC2    pop         es
 00412BC3    pop         es
 00412BC4    pop         es
 00412BC5    or          al,7
 00412BC7    pop         es
 00412BC8    or          al,0C
 00412BCA    or          al,0C
 00412BCC    or          al,0C
 00412BCE    add         cl,byte ptr [esp+ecx]
 00412BD1    pop         es
 00412BD2    add         al,byte ptr [edx]
 00412BD4    pop         es
 00412BD5    pop         es
 00412BD6    pop         es
 00412BD7    pop         es
 00412BD8    pop         es
 00412BD9    add         al,byte ptr [esi]
 00412BDB    add         cl,byte ptr [esp+ecx]
 00412BDE    or          al,0C
 00412BE0    or          al,0C
 00412BE2    add         al,byte ptr [edx]
 00412BE4    or          eax,0D0D0D0D
 00412BE9    or          eax,0D0D0D0D
 00412BEE    add         al,byte ptr [edx]
 00412BF0    pop         es
 00412BF1    pop         es
 00412BF2    add         al,byte ptr [edx]
 00412BF4    pop         es
 00412BF5    sbb         bl,byte ptr [edx]
 00412BF7    sbb         dl,byte ptr ds:[15151515]
 00412BFD    adc         eax,15151515
 00412C02    adc         eax,15151515
 00412C07    sbb         bl,byte ptr [edx]
 00412C09    sbb         bl,byte ptr [edx]
 00412C0B    sbb         cl,byte ptr [esp+ecx]
 00412C0E    sbb         bl,byte ptr [edx]
 00412C10    sbb         bl,byte ptr [edx]
 00412C12    sbb         bl,byte ptr [edx]
 00412C14    or          eax,0D0D0D0D
 00412C19    or          eax,0D0D0D0D
 00412C1E    ???
 00412C1F    ???
 00412C20    ???
 00412C21    ???
 00412C22    ???
 00412C23    ???
 00412C24    ???
 00412C25    ???
 00412C26    ???
 00412C27    ???
 00412C28    sbb         cl,byte ptr [edx+ebx]
 00412C2B    or          al,1A
 00412C2D    or          al,16
 00412C2F    adc         dl,byte ptr [esi]
 00412C31    adc         cl,byte ptr [edx]
 00412C33    or          al,byte ptr [edx]
 00412C35    or          al,0C
 00412C37    or          al,0C
 00412C39    or          al,0C
 00412C3B    or          al,0C
 00412C3D    or          al,0C
 00412C3F    or          al,0C
 00412C41    or          al,0C
 00412C43    or          cl,byte ptr [esp+ecx]
 00412C46    or          al,0C
 00412C48    or          al,15
 00412C4A    or          al,0C
 00412C4C    pop         es
 00412C4D    pop         es
 00412C4E    pop         es
 00412C4F    pop         es
 00412C50    add         al,byte ptr [edx]
 00412C52    add         al,byte ptr [edx]
 00412C54    or          al,0C
 00412C56    or          al,0C
 00412C58    or          al,0C
 00412C5A    or          al,0C
 00412C5C    add         cl,byte ptr [esp+ecx]
 00412C5F    or          al,0C
 00412C61    or          al,0C
 00412C63    or          al,0C
 00412C65    or          al,0C
 00412C67    or          al,0C
 00412C69    or          al,0C
 00412C6B    or          al,0C
 00412C6D    or          al,0C
 00412C6F    or          al,0C
 00412C71    add         bl,byte ptr [edx]
 00412C73    sbb         bl,byte ptr [edx]
 00412C75    sbb         bl,byte ptr [edx]
 00412C77    sbb         bl,byte ptr [edx]
 00412C79    sbb         cl,byte ptr [edx+ebx]
 00412C7C    sbb         bl,byte ptr [edx]
 00412C7E    sbb         bl,byte ptr [edx]
 00412C80    sbb         al,byte ptr [edx]
 00412C82    sbb         bl,byte ptr [edx]
 00412C84    adc         eax,15151515
 00412C89    sbb         bl,byte ptr [edx]
 00412C8B    sbb         bl,byte ptr [edx]
 00412C8D    add         al,byte ptr [edx]
 00412C8F    add         al,byte ptr [edx]
 00412C91    add         al,byte ptr [edx]
 00412C93    add         al,byte ptr [edi]
 00412C95    pop         es
 00412C96    pop         es
 00412C97    pop         es
 00412C98    pop         es
 00412C99    pop         es
 00412C9A    pop         es
 00412C9B    pop         es
 00412C9C    pop         es
 00412C9D    pop         es
 00412C9E    pop         es
 00412C9F    or          cl,byte ptr [edx]
 00412CA1    or          al,0C
 00412CA3    or          al,0C
 00412CA5    or          cl,byte ptr [esp+ecx]
 00412CA8    or          al,0C
 00412CAA    or          al,0C
 00412CAC    or          cl,byte ptr [esp+ecx]
 00412CAF    or          cl,byte ptr [edx]
 00412CB1    or          al,0C
 00412CB3    pop         es
 00412CB4    or          eax,0D0D0D0D
 00412CB9    or          eax,0D0D0D0D
 00412CBE    adc         eax,15151515
 00412CC3    adc         eax,7070707
 00412CC8    pop         es
 00412CC9    pop         es
 00412CCA    or          cl,byte ptr [edx]
 00412CCC    or          al,0C
 00412CCE    pop         es
 00412CCF    pop         es
 00412CD0    pop         es
 00412CD1    pop         es
 00412CD2    or          al,0C
 00412CD4    or          al,7
 00412CD6    or          cl,byte ptr [edx]
 00412CD8    or          al,byte ptr [edi]
 00412CDA    pop         es
 00412CDB    or          cl,byte ptr [edx]
 00412CDD    or          cl,byte ptr [edx]
 00412CDF    or          cl,byte ptr [edx]
 00412CE1    or          al,byte ptr [edi]
 00412CE3    pop         es
 00412CE4    pop         es
 00412CE5    or          al,0C
 00412CE7    or          al,0C
 00412CE9    pop         es
 00412CEA    pop         es
 00412CEB    pop         es
 00412CEC    pop         es
 00412CED    pop         es
 00412CEE    pop         es
 00412CEF    pop         es
 00412CF0    pop         es
 00412CF1    pop         es
 00412CF2    pop         es
 00412CF3    pop         es
 00412CF4    pop         es
 00412CF5    pop         es
 00412CF6    or          al,0A
 00412CF8    or          cl,byte ptr [esp+ecx]
 00412CFB    or          cl,byte ptr [edx]
 00412CFD    or          cl,byte ptr [edx]
 00412CFF    or          cl,byte ptr [edx]
 00412D01    or          al,7
 00412D03    or          cl,byte ptr ds:[0D0D0D0D]
 00412D09    or          eax,0D0D0D0D
 00412D0E    or          cl,byte ptr [edx]
 00412D10    or          cl,byte ptr [edx+ebx]
 00412D13    sbb         cl,byte ptr [ecx]
 00412D15    or          dword ptr [ecx],ecx
 00412D17    or          dword ptr [ecx],ecx
 00412D19    or          dword ptr [edx],eax
 00412D1B    add         al,byte ptr [edx]
 00412D1D    add         al,byte ptr [edx]
 00412D1F    add         al,byte ptr [edx]
 00412D21    add         al,byte ptr [edx]
 00412D23    add         al,byte ptr [edi]
 00412D25    pop         es
 00412D26    pop         es
 00412D27    pop         es
 00412D28    pop         es
 00412D29    pop         es
 00412D2A    pop         es
 00412D2B    pop         es
 00412D2C    pop         es
 00412D2D    pop         es
 00412D2E    pop         es
 00412D2F    adc         eax,2020206
 00412D34    pop         es
 00412D35    pop         es
 00412D36    pop         es
 00412D37    pop         es
 00412D38    pop         es
 00412D39    pop         es
 00412D3A    pop         es
 00412D3B    pop         es
 00412D3C    pop         es
 00412D3D    add         al,byte ptr [edi]
 00412D3F    pop         es
 00412D40    pop         es
 00412D41    pop         es
 00412D42    add         al,byte ptr [edx]
 00412D44    pop         es
 00412D45    pop         es
 00412D46    pop         es
 00412D47    pop         es
 00412D48    pop         es
 00412D49    pop         es
 00412D4A    pop         es
 00412D4B    add         al,byte ptr [edi]
 00412D4D    add         al,byte ptr [edi]
 00412D4F    pop         es
 00412D50    pop         es
 00412D51    pop         es
 00412D52    add         al,byte ptr [edx]
 00412D54    pop         es
 00412D55    add         al,byte ptr [edi]
 00412D57    pop         es
 00412D58    pop         es
 00412D59    pop         es
 00412D5A    add         al,byte ptr [edx]
 00412D5C    pop         es
 00412D5D    pop         es
 00412D5E    pop         es
 00412D5F    pop         es
 00412D60    pop         es
 00412D61    pop         es
 00412D62    pop         es
 00412D63    pop         es
 00412D64    pop         es
 00412D65    pop         es
 00412D66    pop         es
 00412D67    pop         es
 00412D68    pop         es
 00412D69    pop         es
 00412D6A    pop         es
 00412D6B    pop         es
 00412D6C    pop         es
 00412D6D    pop         es
 00412D6E    pop         es
 00412D6F    add         al,byte ptr [edx]
 00412D71    add         al,byte ptr [edx]
 00412D73    or          al,1A
 00412D75    adc         eax,15151515
 00412D7A    adc         eax,0F0F1515
 00412D7F    ???
 00412D80    ???
 00412D81    ???
 00412D82    ???
 00412D83    ???
 00412D84    ???
 00412D85    ???
 00412D86    ???
 00412D87    ???
 00412D88    ???
 00412D89    ???
 00412D8A    ???
 00412D8B    ???
 00412D8C    ???
 00412D8D    ???
 00412D8E    ???
 00412D8F    ???
 00412D90    lar         eax,dword ptr [edx]
 00412D93    add         bl,byte ptr [edx]
 00412D95    sbb         bl,byte ptr [edx]
 00412D97    sbb         bl,byte ptr [edx]
 00412D99    sbb         bl,byte ptr [edx]
 00412D9B    sbb         bl,byte ptr [edx]
 00412D9D    sbb         al,byte ptr [edx]
 00412D9F    add         al,byte ptr [edx]
 00412DA1    add         al,byte ptr [edx]
 00412DA3    add         al,byte ptr [edi]
 00412DA5    pop         es
 00412DA6    pop         es
 00412DA7    pop         es
 00412DA8    pop         es
 00412DA9    add         al,byte ptr [edx]
 00412DAB    add         al,byte ptr [edx]
 00412DAD    add         al,byte ptr [edx]
 00412DAF    add         al,byte ptr [edx]
 00412DB1    add         al,byte ptr [edx]
 00412DB3    add         dl,byte ptr [ecx]
 00412DB5    pop         es
 00412DB6    pop         es
 00412DB7    pop         es
 00412DB8    pop         es
 00412DB9    pop         es
 00412DBA    pop         es
 00412DBB    pop         es
 00412DBC    pop         es
 00412DBD    pop         es
 00412DBE    pop         es
 00412DBF    pop         es
 00412DC0    pop         es
 00412DC1    pop         es
 00412DC2    pop         es
 00412DC3    pop         es
 00412DC4    pop         es
 00412DC5    pop         es
 00412DC6    pop         es
 00412DC7    pop         es
 00412DC8    pop         es
 00412DC9    pop         es
 00412DCA    pop         es
 00412DCB    pop         es
 00412DCC    pop         es
 00412DCD    pop         es
 00412DCE    pop         es
 00412DCF    pop         es
 00412DD0    pop         es
 00412DD1    adc         eax,71D0715
 00412DD6    pop         es
 00412DD7    pop         es
 00412DD8    pop         es
 00412DD9    pop         es
 00412DDA    pop         es
 00412DDB    pop         es
 00412DDC    pop         es
 00412DDD    pop         es
 00412DDE    pop         es
 00412DDF    pop         es
 00412DE0    pop         es
 00412DE1    pop         es
 00412DE2    pop         es
 00412DE3    pop         es
 00412DE4    pop         es
 00412DE5    pop         es
 00412DE6    pop         es
 00412DE7    pop         es
 00412DE8    pop         es
 00412DE9    pop         es
 00412DEA    pop         es
 00412DEB    pop         es
 00412DEC    pop         es
 00412DED    pop         es
 00412DEE    pop         es
 00412DEF    push        ss
 00412DF0    adc         al,byte ptr [edx]
 00412DF2    add         al,byte ptr [edx]
 00412DF4    pop         es
 00412DF5    pop         es
 00412DF6    pop         es
 00412DF7    pop         es
 00412DF8    pop         es
 00412DF9    pop         es
 00412DFA    pop         es
 00412DFB    pop         es
 00412DFC    pop         es
 00412DFD    pop         es
 00412DFE    pop         es
 00412DFF    adc         eax,0E0E1515
 00412E04    push        cs
 00412E05    add         al,byte ptr [edx]
 00412E07    add         al,byte ptr [edx]
 00412E09    add         al,byte ptr [edx]
 00412E0B    add         al,byte ptr [edx]
 00412E0D    add         al,byte ptr [edx]
 00412E0F    add         al,byte ptr [edx]
 00412E11    add         al,byte ptr [edx]
 00412E13    add         al,byte ptr [edi]
 00412E15    pop         es
 00412E16    or          al,0C
 00412E18    or          al,2
 00412E1A    add         al,byte ptr [edx]
 00412E1C    add         al,byte ptr [edx]
 00412E1E    add         al,byte ptr [edx]
 00412E20    add         al,byte ptr [edx]
 00412E22    add         al,byte ptr [edx]
 00412E24    pop         es
 00412E25    pop         es
 00412E26    or          al,0C
 00412E28    or          al,15
 00412E2A    adc         eax,2020202
 00412E2F    add         al,byte ptr [edx]
 00412E31    add         al,byte ptr [edx]
 00412E33    add         al,byte ptr [edi]
 00412E35    pop         es
 00412E36    or          al,0C
 00412E38    add         al,byte ptr [edx]
 00412E3A    add         al,byte ptr [edx]
 00412E3C    add         al,byte ptr [edx]
 00412E3E    add         al,byte ptr [edx]
 00412E40    add         al,byte ptr [edx]
 00412E42    add         al,byte ptr [edx]
 00412E44    pop         es
 00412E45    add         cl,byte ptr [esp+ecx]
 00412E48    add         al,byte ptr [edx]
 00412E4A    add         al,byte ptr [edx]
 00412E4C    add         al,byte ptr [edx]
 00412E4E    add         al,byte ptr [edx]
 00412E50    add         al,byte ptr [edx]
 00412E52    add         al,byte ptr [edx]
 00412E54    pop         es
 00412E55    pop         es
 00412E56    pop         es
 00412E57    pop         es
 00412E58    add         dword ptr [ecx],eax
 00412E5A    or          cl,byte ptr [esp+ecx]
 00412E5D    or          al,0C
 00412E5F    or          al,0C
 00412E61    or          al,0A
 00412E63    or          cl,byte ptr [edx]
 00412E65    or          cl,byte ptr [edx]
 00412E67    or          cl,byte ptr [edx]
 00412E69    or          cl,byte ptr [edx+ecx]
 00412E6C    or          cl,byte ptr [esp+ecx]
 00412E6F    or          al,0C
 00412E71    or          al,0C
 00412E73    or          al,0C
 00412E75    or          al,0C
 00412E77    or          al,15
 00412E79    adc         eax,15150615
 00412E7E    adc         eax,20C0717
 00412E83    add         cl,byte ptr ds:[0D0D0D0D]
 00412E89    or          eax,0D0D0D0D
 00412E8E    add         al,byte ptr [edx]
 00412E90    add         al,byte ptr [edx]
 00412E92    add         al,byte ptr [edx]
 00412E94    ???
 00412E95    ???
 00412E96    ???
 00412E97    ???
 00412E98    ???
 00412E99    ???
 00412E9A    ???
 00412E9B    ???
 00412E9C    ???
 00412E9D    lar         eax,dword ptr [edx]
 00412EA0    add         al,byte ptr [edx]
 00412EA2    add         al,byte ptr [edx]
 00412EA4    adc         eax,15151515
 00412EA9    adc         eax,15151511
 00412EAE    adc         eax,1D0C0C0C
 00412EB3    add         al,byte ptr [edi]
 00412EB5    pop         es
 00412EB6    pop         es
 00412EB7    push        es
 00412EB8    pop         es
 00412EB9    pop         es
 00412EBA    pop         es
 00412EBB    pop         es
 00412EBC    pop         es
 00412EBD    pop         es
 00412EBE    pop         es
 00412EBF    pop         es
 00412EC0    pop         es
 00412EC1    pop         es
 00412EC2    pop         es
 00412EC3    pop         es
 00412EC4    pop         es
 00412EC5    pop         es
 00412EC6    pop         es
 00412EC7    pop         es
 00412EC8    pop         es
 00412EC9    pop         es
 00412ECA    pop         es
 00412ECB    pop         es
 00412ECC    add         al,byte ptr [edx]
 00412ECE    add         al,byte ptr [edx]
 00412ED0    add         al,byte ptr [edx]
 00412ED2    add         al,byte ptr [edx]
 00412ED4    pop         es
 00412ED5    pop         es
 00412ED6    pop         es
 00412ED7    pop         es
 00412ED8    pop         es
 00412ED9    pop         es
 00412EDA    pop         es
 00412EDB    pop         es
 00412EDC    pop         es
 00412EDD    or          al,7
 00412EDF    add         al,byte ptr [edx]
 00412EE1    add         al,byte ptr [edx]
 00412EE3    add         al,byte ptr [edi]
 00412EE5    pop         es
 00412EE6    pop         es
 00412EE7    pop         es
 00412EE8    pop         es
 00412EE9    pop         es
 00412EEA    add         al,byte ptr [edx]
 00412EEC    add         al,byte ptr [edx]
 00412EEE    add         al,byte ptr [edx]
 00412EF0    add         al,byte ptr [edx]
 00412EF2    add         al,byte ptr [edx]
 00412EF4    or          al,0C
 00412EF6    or          al,0A
 00412EF8    or          cl,byte ptr [edx]
 00412EFA    or          cl,byte ptr [esp+ecx]
 00412EFD    or          cl,byte ptr [edx]
 00412EFF    or          al,byte ptr [edx]
 00412F01    add         al,byte ptr [edx]
 00412F03    add         cl,byte ptr [edx]
 00412F05    or          cl,byte ptr [edx+ecx]
 00412F08    or          cl,byte ptr [edx]
 00412F0A    or          cl,byte ptr [edx]
 00412F0C    or          cl,byte ptr [esp+ecx]
 00412F0F    or          al,2
 00412F11    add         al,byte ptr [edx]
 00412F13    add         bl,byte ptr [edx]
 00412F15    add         al,byte ptr [edx]
 00412F17    add         dl,byte ptr ds:[0D0D0D15]
 00412F1D    or          eax,0D0D0D0D
 00412F22    or          eax,0A0A0A0D
 00412F27    or          cl,byte ptr [edx]
 00412F29    or          cl,byte ptr [edx]
 00412F2B    or          cl,byte ptr [edx]
 00412F2D    or          cl,byte ptr [edx]
 00412F2F    or          cl,byte ptr [edx]
 00412F31    or          cl,byte ptr [edx]
 00412F33    or          cl,byte ptr [edx]
 00412F35    pop         es
 00412F36    pop         es
 00412F37    pop         es
 00412F38    pop         es
 00412F39    pop         es
 00412F3A    pop         es
 00412F3B    pop         es
 00412F3C    or          cl,byte ptr [edx]
 00412F3E    add         al,byte ptr [edx]
 00412F40    add         al,byte ptr [edx]
 00412F42    add         al,byte ptr [edx]
 00412F44    or          eax,0D0D0D0D
 00412F49    or          eax,0D0D0D0D
 00412F4E    or          eax,15020202
 00412F53    adc         eax,1A1A1A1A
 00412F58    sbb         bl,byte ptr [edx]
 00412F5A    sbb         bl,byte ptr [edx]
 00412F5C    sbb         bl,byte ptr [edx]
 00412F5E    sbb         bl,byte ptr [edx]
 00412F60    sbb         bl,byte ptr [edx]
 00412F62    sbb         bl,byte ptr [edx]
 00412F64    pop         es
 00412F65    pop         es
 00412F66    pop         es
 00412F67    pop         es
 00412F68    pop         es
 00412F69    pop         es
 00412F6A    pop         es
 00412F6B    or          al,0C
 00412F6D    or          cl,byte ptr [edx]
 00412F6F    or          al,byte ptr [edx]
 00412F71    add         dl,byte ptr ds:[7070715]
 00412F77    pop         es
 00412F78    pop         es
 00412F79    or          cl,byte ptr [edx+ecx]
 00412F7C    or          al,0C
 00412F7E    or          al,0C
 00412F80    or          al,0C
 00412F82    or          al,2
 00412F84    or          al,0A
 00412F86    or          al,0A
 00412F88    or          cl,byte ptr [esp+ecx]
 00412F8B    or          al,0C
 00412F8D    or          al,0C
 00412F8F    or          al,0C
 00412F91    or          cl,byte ptr [edx]
 00412F93    or          cl,byte ptr [edx]
 00412F95    or          cl,byte ptr [edx]
 00412F97    or          al,0C
 00412F99    or          al,0C
 00412F9B    or          al,0C
 00412F9D    or          al,0C
 00412F9F    or          al,0C
 00412FA1    add         al,byte ptr [edx]
 00412FA3    or          al,15
 00412FA5    adc         eax,15151515
 00412FAA    adc         eax,15151506
 00412FAF    adc         eax,2021515
 00412FB4    or          al,0C
 00412FB6    or          al,0C
 00412FB8    or          al,byte ptr [edi]
 00412FBA    pop         es
 00412FBB    pop         es
 00412FBC    pop         es
 00412FBD    pop         es
 00412FBE    pop         es
 00412FBF    pop         es
 00412FC0    pop         es
 00412FC1    pop         es
 00412FC2    pop         es
 00412FC3    pop         es
 00412FC4    pop         es
 00412FC5    pop         es
 00412FC6    pop         es
 00412FC7    pop         es
 00412FC8    or          al,0A
 00412FCA    or          al,0C
 00412FCC    or          al,0C
 00412FCE    or          al,0A
 00412FD0    or          al,0A
 00412FD2    or          cl,byte ptr [edx]
 00412FD4    or          cl,byte ptr [edx]
 00412FD6    or          al,0A
 00412FD8    or          al,byte ptr [edi]
 00412FDA    pop         es
 00412FDB    pop         es
 00412FDC    pop         es
 00412FDD    pop         es
 00412FDE    pop         es
 00412FDF    pop         es
 00412FE0    add         al,byte ptr [edx]
 00412FE2    add         al,byte ptr [edx]
 00412FE4    adc         eax,1A1A1A1A
 00412FE9    sbb         bl,byte ptr [edx]
 00412FEB    sbb         bl,byte ptr [edx]
 00412FED    sbb         bl,byte ptr [edx]
 00412FEF    or          al,0C
 00412FF1    or          al,0C
 00412FF3    or          al,0C
 00412FF5    or          al,0C
 00412FF7    or          al,1A
 00412FF9    sbb         bl,byte ptr [edx]
 00412FFB    sbb         bl,byte ptr [edx]
 00412FFD    sbb         bl,byte ptr [edx]
 00412FFF    sbb         bl,byte ptr [edx]
 00413001    add         al,byte ptr [edx]
 00413003    add         al,byte ptr [edi]
 00413005    or          cl,byte ptr [esp+ecx]
 00413008    or          al,0C
 0041300A    or          cl,byte ptr [edx]
 0041300C    or          al,0C
 0041300E    or          al,byte ptr [edx]
 00413010    add         al,byte ptr [edx]
 00413012    pop         es
 00413013    pop         es
 00413014    pop         es
 00413015    pop         es
 00413016    pop         es
 00413017    pop         es
 00413018    or          cl,byte ptr [edx]
 0041301A    or          cl,byte ptr [edx]
 0041301C    or          cl,byte ptr [edx]
 0041301E    or          cl,byte ptr [edx]
 00413020    or          al,0C
 00413022    or          al,0C
 00413024    or          al,0C
 00413026    or          al,0C
 00413028    or          cl,byte ptr [edx]
 0041302A    or          al,0C
 0041302C    add         al,byte ptr [edx]
 0041302E    add         dl,byte ptr ds:[15151515]
 00413034    or          eax,0D0D0D0D
 00413039    or          eax,0D0D0D0D
 0041303E    add         al,byte ptr [edx]
 00413040    add         al,byte ptr [edi]
 00413042    pop         es
 00413043    pop         es
 00413044    pop         es
 00413045    pop         es
 00413046    pop         es
 00413047    pop         es
 00413048    pop         es
 00413049    pop         es
 0041304A    pop         es
 0041304B    pop         es
 0041304C    push        es
 0041304D    push        es
 0041304E    push        es
 0041304F    push        es
 00413050    push        es
 00413051    push        es
 00413052    adc         eax,0C0C0C15
 00413057    adc         eax,0C0C0C0C
 0041305C    or          al,0C
 0041305E    or          al,0C
 00413060    or          al,0C
 00413062    or          al,0C
 00413064    or          al,0A
 00413066    or          al,0C
 00413068    or          al,0C
 0041306A    or          al,0C
 0041306C    or          al,7
 0041306E    pop         es
 0041306F    pop         es
 00413070    pop         es
 00413071    or          al,7
 00413073    pop         es
 00413074    pop         es
 00413075    pop         es
 00413076    or          al,byte ptr [edx]
 00413078    add         al,byte ptr [edx]
 0041307A    add         al,byte ptr [edx]
 0041307C    add         al,byte ptr [edx]
 0041307E    add         al,byte ptr [edx]
 00413080    add         al,byte ptr [edx]
 00413082    add         al,byte ptr [edx]
 00413084    add         eax,5050505
 00413089    add         eax,5050505
 0041308E    add         eax,6060605
 00413093    push        es
 00413094    push        es
 00413095    push        es
 00413096    add         eax,5050505
 0041309B    add         eax,5050505
 004130A0    add         eax,5050505
 004130A5    add         eax,5050505
 004130AA    add         eax,5050605
 004130AF    add         eax,5050505
 004130B4    or          al,0C
 004130B6    or          al,0C
 004130B8    or          al,0C
 004130BA    or          al,2
 004130BC    add         al,byte ptr [edx]
 004130BE    add         al,byte ptr [edx]
 004130C0    add         al,byte ptr [edx]
 004130C2    add         al,byte ptr [edx]
 004130C4    or          dword ptr ds:[5090509],eax
 004130CA    add         eax,5050505
 004130CF    add         eax,5090505
 004130D4    add         eax,5050505
 004130D9    add         eax,9090505
 004130DE    or          dword ptr [ecx],ecx
 004130E0    or          dword ptr [ecx],ecx
 004130E2    or          dword ptr [ecx],ecx
 004130E4    add         eax,5050505
 004130E9    add         eax,9090202
 004130EE    or          dword ptr [ecx],ecx
 004130F0    or          dword ptr [ecx],ecx
 004130F2    add         al,byte ptr [edx]
 004130F4    add         eax,5050505
 004130F9    add         eax,9020505
 004130FE    add         cl,byte ptr [ecx]
 00413100    add         cl,byte ptr [ecx]
 00413102    add         cl,byte ptr [ecx]
 00413104    add         eax,5050505
 00413109    add         eax,5050505
 0041310E    add         eax,2050505
 00413113    add         al,byte ptr ds:[5050505]
 00413119    add         eax,8080505
 0041311E    or          byte ptr [eax],cl
 00413120    or          byte ptr [eax],cl
 00413122    or          byte ptr [eax],cl
 00413124    add         eax,5050505
 00413129    add         al,byte ptr ds:[9090905]
 0041312F    or          dword ptr [eax],ecx
 00413131    sbb         byte ptr ds:[5181818],al
 00413137    add         eax,5050205
 0041313C    or          dword ptr [ecx],ecx
 0041313E    or          dword ptr [ecx],ecx
 00413140    or          byte ptr [eax],bl
 00413142    sbb         byte ptr [eax],bl
 00413144    add         eax,2050505
 00413149    add         al,byte ptr ds:[9090905]
 0041314F    or          dword ptr [edx],eax
 00413151    sbb         byte ptr [eax],bl
 00413153    sbb         byte ptr ds:[5050505],al
 00413159    add         eax,9090505
 0041315E    or          dword ptr [ecx],ecx
 00413160    or          dword ptr [eax],ebx
 00413162    sbb         byte ptr [eax],bl
 00413164    add         al,byte ptr [edx]
 00413166    add         eax,5020505
 0041316B    add         eax,9090909
 00413170    or          byte ptr [eax],bl
 00413172    sbb         byte ptr [edx],al
 00413174    sbb         eax,1D1D1D1D
 00413179    sbb         eax,1D1D1D1D
 0041317E    sbb         eax,1010101
 00413183    add         dword ptr [ecx],edx
 00413185    adc         dword ptr [ecx],edx
 00413187    adc         dword ptr [ecx],edx
 00413189    adc         dword ptr ds:[16131415],edx
 0041318F    adc         al,14
 00413191    adc         edx,dword ptr [esi]
 00413193    adc         al,15
 00413195    adc         eax,15151515
 0041319A    adc         eax,11C1B15
 0041319F    add         dword ptr [ecx],eax
 004131A1    add         dword ptr [ecx],eax
 004131A3    sbb         eax,15151515
 004131A8    adc         eax,15151515
 004131AD    adc         al,13
 004131AF    adc         eax,10151515
 004131B4    adc         byte ptr ds:[16191515],dl
 004131BA    adc         dl,byte ptr ds:[15151515]
 004131C0    adc         eax,15151515
 004131C5    adc         eax,15101519
 004131CA    adc         eax,15151515
 004131CF    adc         eax,1D151515
 004131D4    add         dword ptr [ecx],eax
 004131D6    add         dword ptr [ecx],eax
 004131D8    add         dword ptr [edx],eax
 004131DA    add         al,byte ptr [edx]
 004131DC    add         al,byte ptr [edx]
 004131DE    add         dword ptr [ecx],eax
 004131E0    add         dword ptr [ecx],eax
 004131E2    add         dword ptr [ecx],eax
 004131E4    clts
 004131E6    add         al,byte ptr [edx]
 004131E8    ???
 004131E9    ???
 004131EA    ???
 004131EB    ???
 004131EC    ???
 004131ED    ???
 004131EE    sbb         dword ptr [ecx],ebx
 004131F0    sbb         dword ptr [esi],edx
 004131F2    adc         al,byte ptr [esi]
 004131F4    ???
 004131F5    ???
 004131F6    ???
 004131F7    ???
 004131F8    ???
 004131F9    ???
 004131FA    ???
 004131FB    ???
 004131FC    ???
 004131FD    ???
 004131FE    sbb         dword ptr [ecx],ebx
 00413200    sbb         dword ptr [esi],edx
 00413202    adc         al,byte ptr [edx]
 00413204    push        es
 00413205    push        es
 00413206    push        es
 00413207    push        es
 00413208    push        es
 00413209    add         al,byte ptr [edx]
 0041320B    add         al,byte ptr [edx]
 0041320D    add         al,byte ptr [edx]
 0041320F    add         al,byte ptr [edx]
 00413211    add         al,byte ptr [edx]
 00413213    add         dl,byte ptr [edi]
 00413215    pop         ss
 00413216    pop         ss
 00413217    pop         ss
 00413218    pop         ss
 00413219    pop         ss
 0041321A    pop         ss
 0041321B    pop         ss
 0041321C    pop         ss
 0041321D    pop         ss
 0041321E    pop         ss
 0041321F    pop         ss
 00413220    pop         ss
 00413221    pop         ss
 00413222    pop         ss
 00413223    pop         ss
 00413224    pop         ss
 00413225    pop         ss
 00413226    pop         ss
 00413227    pop         ss
 00413228    pop         ss
 00413229    pop         ss
 0041322A    pop         ss
 0041322B    pop         ss
 0041322C    pop         ss
 0041322D    add         al,byte ptr [edx]
 0041322F    add         al,byte ptr [edx]
 00413231    add         al,byte ptr [edx]
 00413233    add         cl,byte ptr [esp+ecx]
 00413236    or          al,0C
 00413238    or          al,0C
 0041323A    or          al,0C
 0041323C    or          al,0C
 0041323E    or          al,0C
 00413240    or          al,0B
 00413242    or          ecx,dword ptr [ebx]
 00413244    or          ecx,dword ptr [ebx+ecx]
 00413247    or          ecx,dword ptr [ebx]
 00413249    or          al,0C
 0041324B    or          al,0C
 0041324D    or          al,0C
 0041324F    or          al,0C
 00413251    or          al,0C
 00413253    or          al,0C
 00413255    add         al,byte ptr [edx]
 00413257    add         al,byte ptr [edx]
 00413259    add         al,byte ptr [edx]
 0041325B    add         al,byte ptr [edx]
 0041325D    add         al,byte ptr [edx]
 0041325F    add         al,byte ptr [edx]
 00413261    add         al,byte ptr [edx]
 00413263    add         bl,byte ptr [edx]
 00413265    sbb         cl,byte ptr [ecx]
 00413267    sbb         bl,byte ptr [edx]
 00413269    sbb         bl,byte ptr [edx]
 0041326B    or          dword ptr [edx],ebx
 0041326D    sbb         al,byte ptr ds:[5090909]
 00413273    add         eax,5090909
 00413278    sbb         cl,byte ptr [ecx]
 0041327A    sbb         bl,byte ptr [edx]
 0041327C    sbb         cl,byte ptr [ecx]
 0041327E    or          dword ptr [ecx],ecx
 00413280    or          dword ptr [ecx],ecx
 00413282    sbb         bl,byte ptr [edx]
 00413284    sbb         bl,byte ptr [edx]
 00413286    sbb         bl,byte ptr [edx]
 00413288    or          dword ptr [edx],ebx
 0041328A    or          dword ptr [edx],ebx
 0041328C    or          dword ptr [edx],ebx
 0041328E    or          dword ptr [ecx],ecx
 00413290    or          dword ptr [ecx],ecx
 00413292    sbb         al,byte ptr ds:[9090909]
 00413298    add         eax,7070707
 0041329D    add         eax,5051A1A
 004132A2    or          dword ptr [ecx],ecx
 004132A4    sbb         dword ptr [ecx],ebx
 004132A6    sbb         dword ptr [ecx],ebx
 004132A8    sbb         dword ptr [ecx],ecx
 004132AA    add         eax,1A050505
 004132AF    sbb         dword ptr [edx],ebx
 004132B1    sbb         al,byte ptr ds:[0E0E0E1A]
 004132B7    push        cs
 004132B8    push        cs
 004132B9    push        cs
 004132BA    push        cs
 004132BB    push        cs
 004132BC    push        cs
 004132BD    push        cs
 004132BE    push        cs
 004132BF    push        cs
 004132C0    push        cs
 004132C1    push        cs
 004132C2    push        cs
 004132C3    push        cs
 004132C4    push        cs
 004132C5    push        cs
 004132C6    push        cs
 004132C7    or          dword ptr ds:[0E0E0E0E],eax
 004132CD    lar         eax,dword ptr [edx]
 004132D0    add         al,byte ptr [edx]
 004132D2    add         al,byte ptr [edx]
 004132D4    sbb         dword ptr [ecx],ebx
 004132D6    sbb         dword ptr [ecx],ebx
 004132D8    sbb         dword ptr [edx],ebx
 004132DA    sbb         bl,byte ptr [edx]
 004132DC    sbb         bl,byte ptr [edx]
 004132DE    sbb         dword ptr [ecx],ebx
 004132E0    sbb         bl,byte ptr [edx]
 004132E2    sbb         bl,byte ptr [edx]
 004132E4    sbb         dword ptr [edx],ebx
 004132E6    sbb         bl,byte ptr [ecx]
 004132E8    sbb         bl,byte ptr [edx]
 004132EA    sbb         dword ptr [edx],ebx
 004132EC    sbb         bl,byte ptr [edx]
 004132EE    sbb         bl,byte ptr [edx]
 004132F0    sbb         bl,byte ptr [edx]
 004132F2    sbb         dword ptr [edx],ebx
 004132F4    sbb         bl,byte ptr [edx]
 004132F6    sbb         bl,byte ptr [edx]
 004132F8    sbb         bl,byte ptr [edx]
 004132FA    sbb         bl,byte ptr [edx]
 004132FC    sbb         bl,byte ptr [edx]
 004132FE    sbb         bl,byte ptr [edx]
 00413300    sbb         bl,byte ptr [edx]
 00413302    sbb         dword ptr [ecx],ebx
 00413304    sbb         bl,byte ptr [edx]
 00413306    sbb         dword ptr [edx],ebx
 00413308    sbb         dword ptr [edx],ebx
 0041330A    sbb         bl,byte ptr [edx]
 0041330C    sbb         bl,byte ptr [edx]
 0041330E    sbb         bl,byte ptr [edx]
 00413310    sbb         bl,byte ptr [edx]
 00413312    sbb         bl,byte ptr [edx]
 00413314    sbb         bl,byte ptr [edx]
 00413316    sbb         bl,byte ptr [edx]
 00413318    sbb         dword ptr [ecx],ebx
 0041331A    sbb         dword ptr [ecx],ebx
 0041331C    sbb         dword ptr [ecx],ebx
 0041331E    sbb         dword ptr [ecx],ebx
 00413320    sbb         dword ptr [ecx],ebx
 00413322    sbb         dword ptr [ecx],ebx
 00413324    sbb         dword ptr [ecx],ebx
 00413326    sbb         dword ptr [ecx],ebx
 00413328    sbb         dword ptr [ecx],ebx
 0041332A    sbb         dword ptr [ecx],ebx
 0041332C    sbb         dword ptr [ecx],ebx
 0041332E    sbb         dword ptr [ecx],ebx
 00413330    sbb         dword ptr [ecx],ebx
 00413332    sbb         dword ptr [ecx],ebx
 00413334    sbb         bl,byte ptr [edx]
 00413336    sbb         bl,byte ptr [edx]
 00413338    sbb         bl,byte ptr [edx]
 0041333A    sbb         bl,byte ptr [edx]
 0041333C    sbb         dword ptr [ecx],ebx
 0041333E    sbb         dword ptr [ecx],ebx
 00413340    sbb         bl,byte ptr [edx]
 00413342    sbb         bl,byte ptr [edx]
 00413344    sbb         dword ptr [ecx],ebx
 00413346    sbb         bl,byte ptr [edx]
 00413348    sbb         bl,byte ptr [edx]
 0041334A    sbb         bl,byte ptr [edx]
 0041334C    sbb         dl,byte ptr [esi]
 0041334E    adc         bl,byte ptr [edx]
 00413350    sbb         bl,byte ptr [edx]
 00413352    sbb         bl,byte ptr [edx]
 00413354    sbb         bl,byte ptr [edx]
 00413356    sbb         bl,byte ptr [edx]
 00413358    sbb         bl,byte ptr [edx]
 0041335A    sbb         bl,byte ptr [edx]
 0041335C    sbb         bl,byte ptr [edx]
 0041335E    sbb         bl,byte ptr [edx]
 00413360    sbb         dword ptr [edx],ebx
 00413362    sbb         bl,byte ptr [edx]
 00413364    sbb         dword ptr [ecx],ebx
 00413366    sbb         dword ptr [ecx],ebx
 00413368    sbb         bl,byte ptr [edx]
 0041336A    sbb         bl,byte ptr [edx]
 0041336C    sbb         bl,byte ptr [edx]
 0041336E    sbb         bl,byte ptr [edx]
 00413370    sbb         bl,byte ptr [edx]
 00413372    sbb         bl,byte ptr [edx]
 00413374    sbb         dword ptr [ecx],ebx
 00413376    sbb         bl,byte ptr [edx]
 00413378    sbb         bl,byte ptr [edx]
 0041337A    sbb         bl,byte ptr [edx]
 0041337C    sbb         al,byte ptr [edx]
 0041337E    add         al,byte ptr [edx]
 00413380    add         al,byte ptr [edx]
 00413382    add         al,byte ptr [edx]
 00413384    sbb         bl,byte ptr [edx]
 00413386    sbb         bl,byte ptr [edx]
 00413388    sbb         bl,byte ptr [edx]
 0041338A    sbb         al,byte ptr [edx]
 0041338C    add         al,byte ptr [edx]
 0041338E    add         al,byte ptr [edx]
 00413390    add         al,byte ptr [edx]
 00413392    add         al,byte ptr [edx]
 00413394    sbb         bl,byte ptr [edx]
 00413396    sbb         bl,byte ptr [edx]
 00413398    sbb         bl,byte ptr [edx]
 0041339A    sbb         bl,byte ptr [edx]
 0041339C    sbb         bl,byte ptr [edx]
 0041339E    sbb         al,byte ptr [edx]
 004133A0    add         al,byte ptr [edx]
 004133A2    add         al,byte ptr [edx]
 004133A4    ???
 004133A5    ???
 004133A6    ???
 004133A7    ???
 004133A8    ???
 004133A9    ???
 004133AA    ???
 004133AB    ???
 004133AC    ???
 004133AD    ???
 004133AE    ???
 004133AF    ???
 004133B0    sbb         bl,byte ptr [edx]
 004133B2    sbb         bl,byte ptr [edx]
 004133B4    sbb         bl,byte ptr [edx]
 004133B6    sbb         bl,byte ptr [edx]
 004133B8    sbb         bl,byte ptr [edx]
 004133BA    sbb         bl,byte ptr [edx]
 004133BC    sbb         bl,byte ptr [edx]
 004133BE    ???
 004133BF    ???
 004133C0    ???
 004133C1    ???
 004133C2    ???
 004133C3    ???
 004133C4    sbb         bl,byte ptr [edx]
 004133C6    sbb         bl,byte ptr [edx]
 004133C8    sbb         bl,byte ptr [edx]
 004133CA    sbb         bl,byte ptr [edx]
 004133CC    sbb         bl,byte ptr [edx]
 004133CE    sbb         bl,byte ptr [edx]
 004133D0    sbb         bl,byte ptr [edx]
 004133D2    add         bl,byte ptr [edx]
 004133D4    sbb         bl,byte ptr [edx]
 004133D6    add         bl,byte ptr [edx]
 004133D8    add         al,byte ptr [edx]
 004133DA    add         al,byte ptr [edx]
 004133DC    sbb         bl,byte ptr [edx]
 004133DE    sbb         bl,byte ptr [edx]
 004133E0    sbb         bl,byte ptr [edx]
 004133E2    sbb         bl,byte ptr [edx]
 004133E4    add         bl,byte ptr [edx]
 004133E6    sbb         bl,byte ptr [edx]
 004133E8    sbb         al,byte ptr [edx]
 004133EA    sbb         bl,byte ptr [edx]
 004133EC    sbb         bl,byte ptr [edx]
 004133EE    add         al,byte ptr [edx]
 004133F0    sbb         bl,byte ptr [edx]
 004133F2    sbb         bl,byte ptr [edx]
 004133F4    sbb         bl,byte ptr [edx]
 004133F6    sbb         bl,byte ptr [edx]
 004133F8    sbb         bl,byte ptr [edx]
 004133FA    sbb         bl,byte ptr [edx]
 004133FC    add         bl,byte ptr [edx]
 004133FE    sbb         bl,byte ptr [edx]
 00413400    sbb         bl,byte ptr [edx]
 00413402    sbb         bl,byte ptr [edx]
 00413404    sbb         bl,byte ptr [edx]
 00413406    sbb         bl,byte ptr [edx]
 00413408    sbb         bl,byte ptr [edx]
 0041340A    sbb         bl,byte ptr [edx]
 0041340C    sbb         bl,byte ptr [edx]
 0041340E    sbb         bl,byte ptr [edx]
 00413410    add         bl,byte ptr [edx]
 00413412    add         bl,byte ptr [edx]
 00413414    sbb         bl,byte ptr [edx]
 00413416    sbb         al,byte ptr [edx]
 00413418    add         al,byte ptr [edx]
 0041341A    sbb         bl,byte ptr [edx]
 0041341C    sbb         bl,byte ptr [edx]
 0041341E    sbb         bl,byte ptr [edx]
 00413420    sbb         bl,byte ptr [edx]
 00413422    sbb         al,byte ptr [edx]
 00413424    add         bl,byte ptr [edx]
 00413426    sbb         bl,byte ptr [edx]
 00413428    sbb         bl,byte ptr [edx]
 0041342A    sbb         bl,byte ptr [edx]
 0041342C    push        ss
 0041342D    adc         dl,byte ptr [esi]
 0041342F    adc         dl,byte ptr [esi]
 00413431    adc         dl,byte ptr [esi]
 00413433    adc         dl,byte ptr [esi]
 00413435    adc         dl,byte ptr [esi]
 00413437    adc         dl,byte ptr [esi]
 00413439    adc         cl,byte ptr [edi]
 0041343B    ???
 0041343C    ???
 0041343D    ???
 0041343E    ???
 0041343F    ???
 00413440    ???
 00413441    ???
 00413442    ???
 00413443    ???
 00413444    ???
 00413445    ???
 00413446    ???
 00413447    ???
 00413448    sbb         al,byte ptr [edx]
 0041344A    add         al,byte ptr [edx]
 0041344C    sbb         bl,byte ptr [edx]
 0041344E    sbb         bl,byte ptr [edx]
 00413450    sbb         bl,byte ptr [edx]
 00413452    sbb         bl,byte ptr [edx]
 00413454    add         bl,byte ptr [edx]
 00413456    sbb         bl,byte ptr [edx]
 00413458    sbb         bl,byte ptr [edx]
 0041345A    sbb         bl,byte ptr [edx]
 0041345C    sbb         bl,byte ptr [edx]
 0041345E    sbb         bl,byte ptr [edx]
 00413460    sbb         bl,byte ptr [edx]
 00413462    sbb         al,byte ptr [edx]
 00413464    sbb         dword ptr [ecx],ebx
 00413466    sbb         dword ptr [ecx],ebx
 00413468    sbb         dword ptr [esi],edx
 0041346A    adc         bl,byte ptr [ecx]
 0041346C    sbb         dword ptr [ecx],ebx
 0041346E    sbb         dword ptr [edx],eax
 00413470    sbb         dword ptr [edx],eax
 00413472    add         al,byte ptr [edx]
 00413474    sbb         dword ptr [ecx],ebx
 00413476    sbb         dword ptr [ecx],ebx
 00413478    sbb         dword ptr [ecx],ebx
 0041347A    push        ss
 0041347B    adc         dl,byte ptr [esi]
 0041347D    adc         dl,byte ptr [esi]
 0041347F    adc         dl,byte ptr [esi]
 00413481    adc         dl,byte ptr [esi]
 00413483    adc         bl,byte ptr [ecx]
 00413485    sbb         dword ptr [ecx],ebx
 00413487    push        ss
 00413488    adc         dl,byte ptr [esi]
 0041348A    adc         dl,byte ptr [esi]
 0041348C    adc         dl,byte ptr [esi]
 0041348E    adc         dl,byte ptr [esi]
 00413490    adc         dl,byte ptr [esi]
 00413492    adc         dl,byte ptr [esi]
 00413494    adc         dl,byte ptr [esi]
 00413496    adc         dl,byte ptr [esi]
 00413498    adc         dl,byte ptr [esi]
 0041349A    adc         dl,byte ptr [esi]
 0041349C    adc         bl,byte ptr [ecx]
 0041349E    sbb         dword ptr [ecx],ebx
 004134A0    sbb         dword ptr [ecx],ebx
 004134A2    sbb         dword ptr [ecx],ebx
 004134A4    sbb         dword ptr [ecx],ebx
 004134A6    sbb         dword ptr [ecx],ebx
 004134A8    sbb         dword ptr [ecx],ebx
 004134AA    sbb         dword ptr [ecx],ebx
 004134AC    push        ss
 004134AD    adc         dl,byte ptr [esi]
 004134AF    adc         bl,byte ptr [ecx]
 004134B1    sbb         dword ptr [ecx],ebx
 004134B3    sbb         dword ptr [ecx],ebx
 004134B5    sbb         dword ptr [ecx],ebx
 004134B7    sbb         dword ptr [ecx],ebx
 004134B9    sbb         dword ptr [ecx],ebx
 004134BB    sbb         dword ptr [ecx],ebx
 004134BD    sbb         dword ptr [ecx],ebx
 004134BF    sbb         dword ptr [esi],edx
 004134C1    adc         bl,byte ptr [ecx]
 004134C3    sbb         dword ptr [ecx],ebx
 004134C5    sbb         dword ptr [ecx],ebx
 004134C7    sbb         dword ptr [ecx],ebx
 004134C9    sbb         bl,byte ptr [edx]
 004134CB    sbb         dword ptr [ecx],ebx
 004134CD    sbb         dword ptr [ecx],ebx
 004134CF    sbb         dword ptr [ecx],ebx
 004134D1    add         al,byte ptr [edx]
 004134D3    add         cl,byte ptr [ecx]
 004134D5    add         eax,5090909
 004134DA    add         eax,5090509
 004134DF    or          dword ptr ds:[9090909],eax
 004134E5    add         eax,9050509
 004134EA    add         eax,5050505
 004134EF    add         eax,9090605
 004134F4    or          dword ptr ds:[1A050509],eax
 004134FA    sbb         bl,byte ptr [edx]
 004134FC    sbb         bl,byte ptr [edx]
 004134FE    sbb         cl,byte ptr [ecx]
 00413500    add         eax,0C0C0509
 00413505    or          al,2
 00413507    add         al,byte ptr [edx]
 00413509    add         al,byte ptr [edx]
 0041350B    add         al,byte ptr [edx]
 0041350D    adc         eax,0F151515
 00413512    adc         eax,5050515
 00413517    add         eax,2020505
 0041351C    add         al,byte ptr [edx]
 0041351E    add         al,byte ptr [edx]
 00413520    add         al,byte ptr [edx]
 00413522    add         al,byte ptr [edx]
 00413524    pop         es
 00413525    pop         es
 00413526    pop         es
 00413527    pop         es
 00413528    pop         es
 00413529    pop         es
 0041352A    add         al,byte ptr [edx]
 0041352C    add         al,byte ptr [edx]
 0041352E    add         al,byte ptr [edx]
 00413530    add         al,byte ptr [edx]
 00413532    add         al,byte ptr [esi]
 00413534    pop         es
 00413535    pop         es
 00413536    pop         es
 00413537    pop         es
 00413538    pop         es
 00413539    pop         es
 0041353A    pop         es
 0041353B    add         al,byte ptr [edx]
 0041353D    add         al,byte ptr [edx]
 0041353F    add         al,byte ptr [edx]
 00413541    add         al,byte ptr [edx]
 00413543    add         dl,byte ptr ds:[14131415]
 00413549    adc         edx,dword ptr ds:[13141515]
 0041354F    adc         eax,15151314
 00413554    adc         eax,15151515
 00413559    adc         eax,15151115
 0041355E    adc         dword ptr ds:[15151314],edx
 00413564    adc         al,13
 00413566    push        ss
 00413567    adc         dl,byte ptr [esi]
 00413569    adc         dl,byte ptr [esi]
 0041356B    adc         dl,byte ptr [esi]
 0041356D    adc         dl,byte ptr ds:[15151515]
 00413573    push        es
 00413574    sbb         bl,byte ptr [edx]
 00413576    sbb         bl,byte ptr [edx]
 00413578    add         al,byte ptr [edx]
 0041357A    add         al,byte ptr [edx]
 0041357C    add         al,byte ptr [edx]
 0041357E    add         al,byte ptr [edx]
 00413580    add         al,byte ptr [edx]
 00413582    add         al,byte ptr [edx]
 00413584    sbb         bl,byte ptr [edx]
 00413586    sbb         bl,byte ptr [edx]
 00413588    sbb         bl,byte ptr [edx]
 0041358A    add         al,byte ptr [edx]
 0041358C    add         al,byte ptr [edx]
 0041358E    add         al,byte ptr [edx]
 00413590    add         al,byte ptr [edx]
 00413592    add         al,byte ptr [edx]
 00413594    sbb         bl,byte ptr [edx]
 00413596    sbb         bl,byte ptr [edx]
 00413598    sbb         bl,byte ptr [edx]
 0041359A    sbb         bl,byte ptr [edx]
 0041359C    sbb         bl,byte ptr [edx]
 0041359E    sbb         bl,byte ptr [edx]
 004135A0    add         al,byte ptr [edx]
 004135A2    add         al,byte ptr [edx]
 004135A4    sbb         eax,1A151515
 004135A9    push        es
 004135AA    pop         es
 004135AB    push        cs
 004135AC    push        ss
 004135AD    adc         dl,byte ptr [esi]
 004135AF    adc         dl,byte ptr [esi]
 004135B1    adc         dl,byte ptr [esi]
 004135B3    adc         dl,byte ptr [esi]
 004135B5    adc         bl,byte ptr [edx]
 004135B7    sbb         dl,byte ptr [esi]
 004135B9    adc         dl,byte ptr [esi]
 004135BB    adc         dl,byte ptr [esi]
 004135BD    adc         dl,byte ptr [esi]
 004135BF    adc         dl,byte ptr [ecx]
 004135C1    push        ss
 004135C2    adc         dl,byte ptr [edx]
 004135C4    sbb         cl,byte ptr [esi]
 004135C6    push        cs
 004135C7    push        cs
 004135C8    push        cs
 004135C9    push        cs
 004135CA    push        cs
 004135CB    push        cs
 004135CC    push        cs
 004135CD    push        cs
 004135CE    or          al,0C
 004135D0    or          al,0C
 004135D2    or          al,0C
 004135D4    adc         dword ptr [esi],eax
 004135D6    push        es
 004135D7    push        es
 004135D8    push        es
 004135D9    push        es
 004135DA    sbb         bl,byte ptr [edx]
 004135DC    push        cs
 004135DD    push        cs
 004135DE    push        cs
 004135DF    push        es
 004135E0    pop         es
 004135E1    adc         eax,7071A1A
 004135E6    pop         es
 004135E7    pop         es
 004135E8    pop         es
 004135E9    pop         es
 004135EA    pop         es
 004135EB    add         al,byte ptr [edx]
 004135ED    or          al,0C
 004135EF    sbb         byte ptr [eax],bl
 004135F1    push        es
 004135F2    push        es
 004135F3    pop         es
 004135F4    pop         es
 004135F5    pop         es
 004135F6    pop         es
 004135F7    pop         es
 004135F8    pop         es
 004135F9    pop         es
 004135FA    pop         es
 004135FB    pop         es
 004135FC    pop         es
 004135FD    pop         es
 004135FE    pop         es
 004135FF    adc         eax,7060606
 00413604    sbb         bl,byte ptr [edx]
 00413606    ???
 00413607    ???
 00413608    ???
 00413609    ???
 0041360A    sbb         bl,byte ptr [edx]
 0041360C    sbb         bl,byte ptr [edx]
 0041360E    sbb         bl,byte ptr [edx]
 00413610    sbb         bl,byte ptr [edx]
 00413612    sbb         bl,byte ptr [edx]
 00413614    sbb         cl,byte ptr [edi]
 00413616    ???
 00413617    ???
 00413618    ???
 00413619    ???
 0041361A    ???
 0041361B    ???
 0041361C    ???
 0041361D    ???
 0041361E    ???
 0041361F    ???
 00413620    ???
 00413621    ???
 00413622    ???
 00413623    sysret
 00413625    pop         es
 00413626    pop         es
 00413627    pop         es
 00413628    pop         es
 00413629    push        es
 0041362A    pop         es
 0041362B    pop         es
 0041362C    pop         es
 0041362D    pop         es
 0041362E    pop         es
 0041362F    pop         es
 00413630    pop         es
 00413631    pop         es
 00413632    pop         es
 00413633    pop         es
 00413634    pop         es
 00413635    pop         es
 00413636    pop         es
 00413637    pop         es
 00413638    pop         es
 00413639    pop         es
 0041363A    pop         es
 0041363B    pop         es
 0041363C    pop         es
 0041363D    pop         es
 0041363E    pop         es
 0041363F    pop         es
 00413640    push        es
 00413641    adc         eax,0D0D1515
 00413646    or          eax,0D0D0D0D
 0041364B    or          eax,7070D0D
 00413650    add         al,byte ptr [edx]
 00413652    add         al,byte ptr [edx]
 00413654    add         al,byte ptr [edx]
 00413656    or          dword ptr ds:[5090509],eax
 0041365C    or          dword ptr ds:[5090509],eax
 00413662    pop         es
 00413663    or          al,0B
 00413665    or          ecx,dword ptr [ebx]
 00413667    adc         eax,2020202
 0041366C    add         al,byte ptr [edx]
 0041366E    add         al,byte ptr [edx]
 00413670    or          al,0C
 00413672    adc         eax,9050906
 00413677    add         eax,5090509
 0041367C    add         al,byte ptr [edx]
 0041367E    add         al,byte ptr [edx]
 00413680    add         al,byte ptr [edx]
 00413682    add         al,byte ptr [edx]
 00413684    pop         es
 00413685    pop         es
 00413686    pop         es
 00413687    pop         es
 00413688    pop         es
 00413689    pop         es
 0041368A    push        cs
 0041368B    push        cs
 0041368C    push        cs
 0041368D    push        cs
 0041368E    push        cs
 0041368F    push        cs
 00413690    push        cs
 00413691    push        cs
 00413692    push        cs
 00413693    push        cs
 00413694    or          al,0C
 00413696    adc         eax,15151515
 0041369B    adc         eax,2020202
 004136A0    add         al,byte ptr [edx]
 004136A2    add         al,byte ptr [edx]
 004136A4    sbb         byte ptr [eax],bl
 004136A6    sbb         byte ptr [eax],bl
 004136A8    sbb         byte ptr [eax],bl
 004136AA    sbb         byte ptr [esi],al
 004136AC    push        es
 004136AD    push        es
 004136AE    push        es
 004136AF    push        es
 004136B0    push        es
 004136B1    push        es
 004136B2    push        es
 004136B3    push        es
 004136B4    sbb         byte ptr [eax],bl
 004136B6    or          dword ptr ds:[5090509],eax
 004136BC    or          dword ptr ds:[5090509],eax
 004136C2    or          dword ptr ds:[5050506],eax
 004136C8    add         eax,5050505
 004136CD    or          dword ptr ds:[9090509],eax
 004136D3    add         eax,5090509
 004136D8    or          dword ptr ds:[18060509],eax
 004136DE    sbb         byte ptr [ecx],cl
 004136E0    add         eax,7020202
 004136E5    pop         es
 004136E6    or          al,7
 004136E8    pop         es
 004136E9    pop         es
 004136EA    or          al,7
 004136EC    pop         es
 004136ED    pop         es
 004136EE    pop         es
 004136EF    or          al,7
 004136F1    pop         es
 004136F2    pop         es
 004136F3    pop         es
 004136F4    pop         es
 004136F5    pop         es
 004136F6    pop         es
 004136F7    or          cl,byte ptr [edx]
 004136F9    or          al,0C
 004136FB    or          bl,byte ptr [edx]
 004136FD    sbb         bl,byte ptr [edx]
 004136FF    sbb         al,byte ptr [edx]
 00413701    add         al,byte ptr [edx]
 00413703    add         cl,byte ptr [edi]
 00413705    ???
 00413706    ???
 00413707    ???
 00413708    ???
 00413709    ???
 0041370A    sbb         bl,byte ptr [edx]
 0041370C    pop         ss
 0041370D    sbb         al,byte ptr [edx]
 0041370F    add         al,byte ptr [edx]
 00413711    add         al,byte ptr [edx]
 00413713    add         al,byte ptr [edi]
 00413715    pop         es
 00413716    pop         es
 00413717    pop         es
 00413718    adc         eax,2151515
 0041371D    add         al,byte ptr [edx]
 0041371F    add         al,byte ptr [edx]
 00413721    add         al,byte ptr [edx]
 00413723    add         cl,byte ptr [edx]
 00413725    or          al,byte ptr [edi]
 00413727    pop         es
 00413728    pop         es
 00413729    pop         es
 0041372A    pop         es
 0041372B    pop         es
 0041372C    pop         es
 0041372D    pop         es
 0041372E    pop         es
 0041372F    pop         es
 00413730    pop         es
 00413731    pop         es
 00413732    pop         es
 00413733    pop         es
 00413734    pop         es
 00413735    pop         es
 00413736    pop         es
 00413737    pop         es
 00413738    or          cl,byte ptr [edx]
 0041373A    or          cl,byte ptr [edx]
 0041373C    or          cl,byte ptr [edx]
 0041373E    or          cl,byte ptr [edx]
 00413740    or          cl,byte ptr [edx]
 00413742    or          cl,byte ptr [edx]
 00413744    or          cl,byte ptr [edx]
 00413746    or          cl,byte ptr [edx]
 00413748    or          al,2
 0041374A    add         al,byte ptr [edx]
 0041374C    add         al,byte ptr [edx]
 0041374E    add         al,byte ptr [edx]
 00413750    add         al,byte ptr [edx]
 00413752    adc         eax,70C0C15
 00413757    pop         es
 00413758    pop         es
 00413759    pop         es
 0041375A    pop         es
 0041375B    pop         es
 0041375C    adc         eax,2071515
 00413761    add         al,byte ptr [edx]
 00413763    add         al,byte ptr [edi]
 00413765    pop         es
 00413766    pop         es
 00413767    pop         es
 00413768    pop         es
 00413769    pop         es
 0041376A    or          al,0C
 0041376C    or          al,0C
 0041376E    or          al,0C
 00413770    or          al,0C
 00413772    adc         eax,0A0C0C15
 00413777    or          al,byte ptr [edx]
 00413779    add         al,byte ptr [edx]
 0041377B    add         al,byte ptr [edx]
 0041377D    add         al,byte ptr [edx]
 0041377F    add         al,byte ptr [edx]
 00413781    add         al,byte ptr [edx]
 00413783    adc         eax,0C070707
 00413788    or          cl,byte ptr [edx]
 0041378A    or          al,0C
 0041378C    or          al,0C
 0041378E    or          cl,byte ptr [edx]
 00413790    or          al,0A
 00413792    or          cl,byte ptr [edx]
 00413794    or          dl,byte ptr ds:[15151515]
 0041379A    adc         eax,15151515
 0041379F    adc         eax,6021515
 004137A4    or          eax,0D0D0D0D
 004137A9    or          eax,0D0D0D0D
 004137AE    add         al,byte ptr [edx]
 004137B0    add         al,byte ptr [edx]
 004137B2    adc         eax,7070715
 004137B7    pop         es
 004137B8    pop         es
 004137B9    pop         es
 004137BA    pop         es
 004137BB    pop         es
 004137BC    pop         es
 004137BD    or          al,0C
 004137BF    or          al,0C
 004137C1    or          al,0C
 004137C3    or          cl,byte ptr [edx]
 004137C5    or          al,0C
 004137C7    or          cl,byte ptr [edx]
 004137C9    or          al,0C
 004137CB    add         al,byte ptr [edx]
 004137CD    add         al,byte ptr [edx]
 004137CF    add         al,byte ptr [edx]
 004137D1    add         al,byte ptr [edx]
 004137D3    add         al,byte ptr [edi]
 004137D5    pop         es
 004137D6    pop         es
 004137D7    or          al,7
 004137D9    pop         es
 004137DA    pop         es
 004137DB    pop         es
 004137DC    pop         es
 004137DD    pop         es
 004137DE    pop         es
 004137DF    pop         es
 004137E0    or          al,0A
 004137E2    add         al,byte ptr [edx]
 004137E4    or          eax,0D0D0D0D
 004137E9    or          eax,0D0D0D0D
 004137EE    add         al,byte ptr [edx]
 004137F0    adc         eax,6151515
 004137F5    pop         es
 004137F6    pop         es
 004137F7    pop         es
 004137F8    pop         es
 004137F9    pop         es
 004137FA    pop         es
 004137FB    sbb         bl,byte ptr [edx]
 004137FD    sbb         al,byte ptr [edi]
 004137FF    or          al,byte ptr [edx]
 00413801    add         al,byte ptr [edx]
 00413803    add         cl,byte ptr [edi+eax]
 00413806    or          al,0C
 00413808    or          al,7
 0041380A    pop         es
 0041380B    or          al,0C
 0041380D    pop         es
 0041380E    pop         es
 0041380F    pop         es
 00413810    pop         es
 00413811    pop         es
 00413812    or          al,0C
 00413814    add         al,byte ptr [edx]
 00413816    add         al,byte ptr [edx]
 00413818    add         al,byte ptr [edx]
 0041381A    add         al,byte ptr [edx]
 0041381C    add         al,byte ptr [edx]
 0041381E    add         al,byte ptr [edi]
 00413820    pop         es
 00413821    push        es
 00413822    adc         eax,7070715
 00413827    or          cl,byte ptr [edx]
 00413829    or          al,0A
 0041382B    or          cl,byte ptr [edx+ecx]
 0041382E    or          dl,byte ptr ds:[2020C0A]
 00413834    pop         es
 00413835    pop         es
 00413836    pop         es
 00413837    pop         es
 00413838    add         al,byte ptr [edx]
 0041383A    add         al,byte ptr [edx]
 0041383C    add         al,byte ptr [edx]
 0041383E    add         al,byte ptr [edx]
 00413840    add         al,byte ptr [edx]
 00413842    add         al,byte ptr [edx]
 00413844    pop         es
 00413845    pop         es
 00413846    pop         es
 00413847    pop         es
 00413848    pop         es
 00413849    pop         es
 0041384A    pop         es
 0041384B    add         al,byte ptr [edx]
 0041384D    add         al,byte ptr [edx]
 0041384F    pop         es
 00413850    pop         es
 00413851    pop         es
 00413852    pop         es
 00413853    pop         es
 00413854    add         al,4
 00413856    add         al,4
 00413858    add         al,4
 0041385A    add         al,4
 0041385C    add         al,4
 0041385E    add         al,4
 00413860    add         al,4
 00413862    add         al,4
 00413864    add         eax,dword ptr [ebx]
 00413866    add         eax,dword ptr [ebx]
 00413868    add         eax,dword ptr [ebx]
 0041386A    add         eax,dword ptr [ebx]
 0041386C    add         eax,dword ptr [ebx]
 0041386E    add         eax,dword ptr [ebx]
 00413870    add         eax,dword ptr [ebx]
 00413872    add         eax,dword ptr [ebx]
 00413874    add         eax,5050505
 00413879    add         eax,2020205
 0041387E    add         al,byte ptr [edx]
 00413880    add         al,byte ptr [edx]
 00413882    add         al,byte ptr [edx]
 00413884    add         al,byte ptr [edx]
 00413886    add         al,byte ptr ds:[5050505]
 0041388C    add         al,byte ptr [edx]
 0041388E    add         al,byte ptr [edx]
 00413890    add         al,byte ptr [edi]
 00413892    or          al,7
 00413894    pop         es
 00413895    pop         es
 00413896    pop         es
 00413897    pop         es
 00413898    pop         es
 00413899    pop         es
 0041389A    pop         es
 0041389B    pop         es
 0041389C    pop         es
 0041389D    sbb         dword ptr [edi],eax
 0041389F    pop         es
 004138A0    pop         es
 004138A1    pop         es
 004138A2    pop         es
 004138A3    pop         es
 004138A4    pop         es
 004138A5    pop         es
 004138A6    pop         es
 004138A7    pop         es
 004138A8    pop         es
 004138A9    pop         es
 004138AA    pop         es
 004138AB    add         al,byte ptr [edi]
 004138AD    pop         es
 004138AE    pop         es
 004138AF    pop         es
 004138B0    pop         es
 004138B1    add         al,byte ptr [edi]
 004138B3    add         al,byte ptr [edi]
 004138B5    pop         es
 004138B6    add         al,byte ptr [edi]
 004138B8    pop         es
 004138B9    add         al,byte ptr [edi]
 004138BB    pop         es
 004138BC    pop         es
 004138BD    pop         es
 004138BE    pop         es
 004138BF    pop         es
 004138C0    pop         es
 004138C1    pop         es
 004138C2    pop         es
 004138C3    pop         es
 004138C4    pop         es
 004138C5    pop         es
 004138C6    pop         es
 004138C7    pop         es
 004138C8    pop         es
 004138C9    pop         es
 004138CA    pop         es
 004138CB    pop         es
 004138CC    pop         es
 004138CD    pop         es
 004138CE    pop         es
 004138CF    pop         es
 004138D0    pop         ss
 004138D1    sbb         al,byte ptr [edx]
 004138D3    add         dl,byte ptr ds:[15151515]
 004138D9    adc         eax,15121615
 004138DE    add         al,byte ptr [edx]
 004138E0    add         al,byte ptr [edx]
 004138E2    add         al,byte ptr [edx]
 004138E4    adc         eax,10101111
 004138E9    push        ss
 004138EA    adc         dl,byte ptr [esi]
 004138EC    adc         dl,byte ptr [esi]
 004138EE    adc         dl,byte ptr [esi]
 004138F0    adc         dl,byte ptr [esi]
 004138F2    adc         dl,byte ptr [esi]
 004138F4    adc         dl,byte ptr [esi]
 004138F6    adc         dl,byte ptr [esi]
 004138F8    adc         dl,byte ptr ds:[15121615]
 004138FE    adc         eax,10101515
 00413903    adc         byte ptr ds:[15021515],dl
 00413909    adc         eax,16111515
 0041390E    adc         dl,byte ptr [esi]
 00413910    adc         dl,byte ptr [esi]
 00413912    adc         dl,byte ptr ds:[11191515]
 00413918    sbb         dword ptr [ecx],ebx
 0041391A    sbb         dword ptr [edx],eax
 0041391C    adc         eax,2151517
 00413921    add         al,byte ptr [edx]
 00413923    add         al,byte ptr [edi]
 00413925    pop         es
 00413926    pop         es
 00413927    pop         es
 00413928    pop         es
 00413929    add         al,byte ptr [edi]
 0041392B    pop         es
 0041392C    pop         es
 0041392D    pop         es
 0041392E    pop         es
 0041392F    pop         es
 00413930    pop         es
 00413931    pop         es
 00413932    pop         es
 00413933    pop         es
 00413934    pop         es
 00413935    pop         es
 00413936    pop         es
 00413937    pop         es
 00413938    pop         es
 00413939    pop         es
 0041393A    pop         es
 0041393B    pop         es
 0041393C    pop         es
 0041393D    pop         es
 0041393E    pop         es
 0041393F    pop         es
 00413940    pop         es
 00413941    add         al,byte ptr [edx]
 00413943    add         dword ptr [edx],eax
 00413945    adc         eax,15171515
 0041394A    adc         eax,15121615
 0041394F    sbb         dword ptr ds:[5151511],edx
 00413955    add         eax,5050505
 0041395A    add         eax,5050505
 0041395F    push        ss
 00413960    sbb         dword ptr [edx],edx
 00413962    sbb         dword ptr [esi],edx
 00413964    adc         dl,byte ptr ds:[15151216]
 0041396A    pop         es
 0041396B    pop         es
 0041396C    pop         es
 0041396D    pop         es
 0041396E    pop         es
 0041396F    pop         es
 00413970    pop         es
 00413971    pop         es
 00413972    pop         es
 00413973    pop         es
 00413974    pop         es
 00413975    pop         es
 00413976    pop         es
 00413977    pop         es
 00413978    pop         es
 00413979    pop         es
 0041397A    pop         es
 0041397B    pop         es
 0041397C    pop         es
 0041397D    pop         es
 0041397E    pop         es
 0041397F    pop         es
 00413980    pop         es
 00413981    pop         es
 00413982    push        es
 00413983    push        es
 00413984    add         al,byte ptr [edx]
 00413986    pop         es
 00413987    pop         es
 00413988    pop         es
 00413989    pop         es
 0041398A    pop         es
 0041398B    pop         es
 0041398C    add         al,byte ptr [edx]
 0041398E    pop         es
 0041398F    pop         es
 00413990    pop         es
 00413991    pop         es
 00413992    pop         es
 00413993    pop         es
 00413994    add         al,byte ptr [edx]
 00413996    pop         es
 00413997    pop         es
 00413998    pop         es
 00413999    pop         es
 0041399A    pop         es
 0041399B    pop         es
 0041399C    add         al,byte ptr [edx]
 0041399E    pop         es
 0041399F    pop         es
 004139A0    pop         es
 004139A1    add         al,byte ptr [edx]
 004139A3    add         dl,byte ptr [edi]
 004139A5    pop         ss
 004139A6    sbb         dword ptr [eax],ebx
 004139A8    sbb         dl,byte ptr [edi]
 004139AA    pop         ss
 004139AB    add         bl,byte ptr [edx]
 004139AD    sbb         dword ptr [ecx],ebx
 004139AF    sbb         dword ptr [ecx],ebx
 004139B1    sbb         bl,byte ptr [edx]
 004139B3    add         al,byte ptr [edx]
 004139B5    add         al,byte ptr [edx]
 004139B7    add         al,byte ptr [edx]
 004139B9    add         al,byte ptr [edx]
 004139BB    add         al,byte ptr [edx]
 004139BD    add         dword ptr [ecx],eax
 004139BF    add         dword ptr [edx],ebx
 004139C1    sbb         al,byte ptr [edx]
 004139C3    add         dl,byte ptr ds:[2021A15]
 004139C9    add         al,byte ptr [edx]
 004139CB    ???
 004139CC    ???
 004139CD    ???
 004139CE    ???
 004139CF    ???
 004139D0    ???
 004139D1    ???
 004139D2    ???
 004139D3    femms
 004139D5    push        cs
 004139D6    push        cs
 004139D7    push        cs
 004139D8    push        cs
 004139D9    ???
 004139DA    ???
 004139DB    ???
 004139DC    ???
 004139DD    sbb         bl,byte ptr [edx]
 004139DF    sbb         bl,byte ptr [edx]
 004139E1    sbb         bl,byte ptr [edx]
 004139E3    sbb         bl,byte ptr [edx]
 004139E5    sbb         bl,byte ptr [edx]
 004139E7    sbb         bl,byte ptr [edx]
 004139E9    sbb         bl,byte ptr [edx]
 004139EB    sbb         bl,byte ptr [edx]
 004139ED    sbb         cl,byte ptr [edi]
 004139EF    add         al,byte ptr [edx]
 004139F1    add         al,byte ptr [edx]
 004139F3    add         bl,byte ptr [edx]
 004139F5    sbb         bl,byte ptr [edx]
 004139F7    sbb         bl,byte ptr [edx]
 004139F9    sbb         bl,byte ptr [edx]
 004139FB    sbb         bl,byte ptr [edx]
 004139FD    sbb         bl,byte ptr [edx]
 004139FF    sbb         bl,byte ptr [edx]
 00413A01    or          al,2
 00413A03    add         cl,byte ptr [edi]
 00413A05    ???
 00413A06    ???
 00413A07    lar         eax,dword ptr [edx]
 00413A0A    add         al,byte ptr [edx]
 00413A0C    add         al,byte ptr [edx]
 00413A0E    add         al,byte ptr [edx]
 00413A10    add         al,byte ptr [edx]
 00413A12    add         al,byte ptr [edx]
 00413A14    pop         es
 00413A15    push        cs
 00413A16    pop         es
 00413A17    pop         es
 00413A18    pop         es
 00413A19    pop         es
 00413A1A    pop         es
 00413A1B    pop         es
 00413A1C    pop         es
 00413A1D    pop         es
 00413A1E    push        cs
 00413A1F    add         al,byte ptr [edx]
 00413A21    add         al,byte ptr [edx]
 00413A23    add         al,byte ptr [edi]
 00413A25    pop         es
 00413A26    pop         es
 00413A27    pop         es
 00413A28    pop         es
 00413A29    pop         es
 00413A2A    pop         es
 00413A2B    pop         es
 00413A2C    pop         es
 00413A2D    pop         es
 00413A2E    pop         es
 00413A2F    pop         es
 00413A30    pop         es
 00413A31    pop         es
 00413A32    add         dl,byte ptr ds:[7070707]
 00413A38    add         al,byte ptr [edx]
 00413A3A    add         al,byte ptr [edx]
 00413A3C    pop         es
 00413A3D    pop         es
 00413A3E    pop         es
 00413A3F    pop         es
 00413A40    pop         es
 00413A41    pop         es
 00413A42    pop         es
 00413A43    pop         es
 00413A44    adc         eax,0E0E0E0E
 00413A49    push        cs
 00413A4A    add         al,byte ptr [edx]
 00413A4C    add         al,byte ptr [edx]
 00413A4E    add         al,byte ptr [edx]
 00413A50    add         al,byte ptr [edx]
 00413A52    add         al,byte ptr [edx]
 00413A54    pop         es
 00413A55    pop         es
 00413A56    pop         es
 00413A57    pop         es
 00413A58    pop         es
 00413A59    pop         es
 00413A5A    add         al,byte ptr [edx]
 00413A5C    pop         es
 00413A5D    add         al,byte ptr [edi]
 00413A5F    pop         es
 00413A60    pop         es
 00413A61    pop         es
 00413A62    pop         es
 00413A63    pop         es
 00413A64    pop         es
 00413A65    pop         es
 00413A66    pop         es
 00413A67    pop         es
 00413A68    pop         es
 00413A69    pop         es
 00413A6A    add         al,byte ptr [edi]
 00413A6C    pop         es
 00413A6D    add         al,byte ptr [edx]
 00413A6F    add         al,byte ptr [edi]
 00413A71    add         al,byte ptr [edx]
 00413A73    pop         es
 00413A74    pop         es
 00413A75    pop         es
 00413A76    pop         es
 00413A77    pop         es
 00413A78    pop         es
 00413A79    pop         es
 00413A7A    add         dl,byte ptr ds:[0F0F0F0F]
 00413A80    ???
 00413A81    ???
 00413A82    ???
 00413A83    sysret
 00413A85    pop         es
 00413A86    pop         es
 00413A87    pop         es
 00413A88    pop         es
 00413A89    pop         es
 00413A8A    ???
 00413A8B    ???
 00413A8C    ???
 00413A8D    ???
 00413A8E    ???
 00413A8F    lar         eax,dword ptr [edx]
 00413A92    add         dl,byte ptr ds:[7070707]
 00413A98    pop         es
 00413A99    pop         es
 00413A9A    pop         es
 00413A9B    pop         es
 00413A9C    pop         es
 00413A9D    pop         es
 00413A9E    add         al,byte ptr [edx]
 00413AA0    add         al,byte ptr [edx]
 00413AA2    add         dl,byte ptr ds:[0C0C0C07]
 00413AA8    add         cl,byte ptr [esp+ecx]
 00413AAB    add         al,byte ptr [edx]
 00413AAD    add         al,byte ptr [edx]
 00413AAF    add         cl,byte ptr [esp+ecx]
 00413AB2    or          al,0C
 00413AB4    pop         es
 00413AB5    pop         es
 00413AB6    pop         es
 00413AB7    pop         es
 00413AB8    add         al,byte ptr [edx]
 00413ABA    add         al,byte ptr [edx]
 00413ABC    or          al,0C
 00413ABE    or          al,2
 00413AC0    add         al,byte ptr [edx]
 00413AC2    add         cl,byte ptr [edi+ecx]
 00413AC5    ???
 00413AC6    ???
 00413AC7    ???
 00413AC8    ???
 00413AC9    ???
 00413ACA    ???
 00413ACB    lar         eax,dword ptr [edx]
 00413ACE    add         al,byte ptr [edx]
 00413AD0    add         al,byte ptr [edx]
 00413AD2    add         al,byte ptr [edx]
 00413AD4    pop         es
 00413AD5    pop         es
 00413AD6    pop         es
 00413AD7    pop         es
 00413AD8    pop         es
 00413AD9    pop         es
 00413ADA    pop         es
 00413ADB    pop         es
 00413ADC    pop         es
 00413ADD    pop         es
 00413ADE    pop         es
 00413ADF    pop         es
 00413AE0    pop         es
 00413AE1    ???
 00413AE2    ???
 00413AE3    adc         eax,7070707
 00413AE8    pop         es
 00413AE9    pop         es
 00413AEA    add         al,byte ptr [edx]
 00413AEC    add         dl,byte ptr ds:[15151515]
 00413AF2    adc         eax,7070715
 00413AF7    pop         es
 00413AF8    pop         es
 00413AF9    pop         es
 00413AFA    add         al,byte ptr [edx]
 00413AFC    ???
 00413AFD    ???
 00413AFE    ???
 00413AFF    ???
 00413B00    ???
 00413B01    ???
 00413B02    ???
 00413B03    sysret
 00413B05    pop         es
 00413B06    pop         es
 00413B07    add         al,byte ptr [edx]
 00413B09    add         al,byte ptr [edx]
 00413B0B    add         cl,byte ptr [edi]
 00413B0D    ???
 00413B0E    ???
 00413B0F    ???
 00413B10    ???
 00413B11    ???
 00413B12    ???
 00413B13    ???
 00413B14    or          cl,byte ptr [edx]
 00413B16    or          cl,byte ptr [esp+ecx]
 00413B19    or          al,0C
 00413B1B    or          cl,byte ptr [edx]
 00413B1D    or          al,0C
 00413B1F    adc         eax,15150115
 00413B24    sbb         bl,byte ptr [edx]
 00413B26    sbb         bl,byte ptr [edx]
 00413B28    sbb         cl,byte ptr [edx]
 00413B2A    or          cl,byte ptr [esp+ecx]
 00413B2D    or          al,1A
 00413B2F    sbb         bl,byte ptr [edx]
 00413B31    or          cl,byte ptr [edx]
 00413B33    or          cl,byte ptr [edx]
 00413B35    or          cl,byte ptr [edx]
 00413B37    add         dword ptr [ecx],eax
 00413B39    add         dword ptr [ecx],eax
 00413B3B    add         dword ptr [ecx],eax
 00413B3D    add         dword ptr [ecx],eax
 00413B3F    or          al,0C
 00413B41    or          al,0C
 00413B43    or          al,0C
 00413B45    or          al,0C
 00413B47    sbb         bl,byte ptr [edx]
 00413B49    or          al,0C
 00413B4B    or          al,0C
 00413B4D    or          al,0C
 00413B4F    or          al,1A
 00413B51    sbb         bl,byte ptr [edx]
 00413B53    sbb         bl,byte ptr [edx]
 00413B55    sbb         bl,byte ptr [edx]
 00413B57    sbb         bl,byte ptr [edx]
 00413B59    sbb         bl,byte ptr [edx]
 00413B5B    sbb         bl,byte ptr [edx]
 00413B5D    sbb         cl,byte ptr [esp+ecx]
 00413B60    or          al,0C
 00413B62    sbb         bl,byte ptr [edx]
 00413B64    sbb         bl,byte ptr [edx]
 00413B66    sbb         bl,byte ptr [edx]
 00413B68    sbb         bl,byte ptr [edx]
 00413B6A    sbb         bl,byte ptr [edx]
 00413B6C    sbb         bl,byte ptr [edx]
 00413B6E    sbb         bl,byte ptr [edx]
 00413B70    sbb         bl,byte ptr [edx]
 00413B72    add         al,byte ptr [edx]
 00413B74    sbb         bl,byte ptr [edx]
 00413B76    or          al,0C
 00413B78    or          al,1A
 00413B7A    add         al,byte ptr [edx]
 00413B7C    add         al,byte ptr [edx]
 00413B7E    add         al,byte ptr [edx]
 00413B80    add         al,byte ptr [edx]
 00413B82    add         al,byte ptr [edx]
 00413B84    ???
 00413B85    lar         eax,dword ptr [edx]
 00413B88    add         al,byte ptr [edx]
 00413B8A    add         al,byte ptr [edx]
 00413B8C    add         al,byte ptr [edx]
 00413B8E    add         al,byte ptr [edx]
 00413B90    add         al,byte ptr [edx]
 00413B92    add         al,byte ptr [edx]
 00413B94    or          dword ptr [ecx],ecx
 00413B96    or          dword ptr [ecx],ecx
 00413B98    or          dword ptr [ecx],ecx
 00413B9A    or          dword ptr [ecx],ecx
 00413B9C    or          dword ptr [ecx],ecx
 00413B9E    add         eax,5050505
 00413BA3    add         eax,5050505
 00413BA8    or          dword ptr [ecx],ecx
 00413BAA    or          dword ptr [ecx],ecx
 00413BAC    or          dword ptr [ecx],ecx
 00413BAE    or          dword ptr [ecx],ecx
 00413BB0    or          dword ptr [ecx],ecx
 00413BB2    or          dword ptr [ecx],ecx
 00413BB4    or          dword ptr [ecx],ecx
 00413BB6    or          dword ptr [ecx],ecx
 00413BB8    or          dword ptr [ecx],ecx
 00413BBA    or          dword ptr [ecx],ecx
 00413BBC    or          dword ptr [ecx],ecx
 00413BBE    or          dword ptr [ecx],ecx
 00413BC0    or          dword ptr [ecx],ecx
 00413BC2    add         eax,5050505
 00413BC7    add         eax,5050205
 00413BCC    add         eax,5050505
 00413BD1    add         eax,5050505
 00413BD6    add         eax,5050505
 00413BDB    add         eax,5050505
 00413BE0    or          dword ptr [edx],eax
 00413BE2    or          dword ptr [ecx],ecx
 00413BE4    add         al,byte ptr [edx]
 00413BE6    or          dword ptr [edx],eax
 00413BE8    add         cl,byte ptr [ecx]
 00413BEA    or          dword ptr [edx],eax
 00413BEC    add         cl,byte ptr [ecx]
 00413BEE    or          dword ptr [ecx],ecx
 00413BF0    or          dword ptr [edx],eax
 00413BF2    or          dword ptr [ecx],ecx
 00413BF4    or          dword ptr [ecx],ecx
 00413BF6    or          dword ptr [ecx],ecx
 00413BF8    or          dword ptr [ecx],ecx
 00413BFA    add         eax,2050505
 00413BFF    add         eax,5050502
 00413C04    add         eax,9050505
 00413C09    or          dword ptr [edx],eax
 00413C0B    or          dword ptr [ecx],ecx
 00413C0D    or          dword ptr [ecx],ecx
 00413C0F    add         al,byte ptr [edx]
 00413C11    or          dword ptr [ecx],ecx
 00413C13    or          dword ptr [ecx],ecx
 00413C15    or          dword ptr [ecx],ecx
 00413C17    or          dword ptr [ecx],ecx
 00413C19    add         cl,byte ptr [ecx]
 00413C1B    or          dword ptr [ecx],ecx
 00413C1D    or          dword ptr [ecx],ecx
 00413C1F    or          dword ptr [ecx],ecx
 00413C21    add         al,byte ptr ds:[5050505]
 00413C27    add         eax,5050505
 00413C2C    or          dword ptr [ecx],ecx
 00413C2E    add         cl,byte ptr [ecx]
 00413C30    or          dword ptr [ecx],ecx
 00413C32    or          dword ptr [edx],eax
 00413C34    or          dword ptr [ecx],ecx
 00413C36    or          dword ptr [ecx],ecx
 00413C38    or          dword ptr [edx],eax
 00413C3A    or          dword ptr [edx],eax
 00413C3C    add         al,byte ptr [edx]
 00413C3E    or          dword ptr [ecx],ecx
 00413C40    or          dword ptr [ecx],ecx
 00413C42    or          dword ptr [ecx],ecx
 00413C44    or          dword ptr [edx],eax
 00413C46    add         eax,5050505
 00413C4B    add         eax,5050505
 00413C50    add         eax,5050505
 00413C55    add         eax,5050505
 00413C5A    add         eax,5050505
 00413C5F    add         eax,9090909
 00413C64    add         eax,5050505
 00413C69    add         eax,9090202
 00413C6E    or          dword ptr [ecx],ecx
 00413C70    or          dword ptr [ecx],ecx
 00413C72    or          dword ptr [ecx],ecx
 00413C74    or          dword ptr [ecx],ebx
 00413C76    add         eax,5050505
 00413C7B    add         eax,5050505
 00413C80    add         eax,5050505
 00413C85    add         eax,5050505
 00413C8A    add         eax,5050505
 00413C8F    sbb         dword ptr ds:[9050505],eax
 00413C95    or          dword ptr [ecx],ecx
 00413C97    or          dword ptr [ecx],ecx
 00413C99    or          dword ptr [ecx],ecx
 00413C9B    or          dword ptr [ecx],ecx
 00413C9D    or          dword ptr [ecx],ecx
 00413C9F    sbb         dword ptr ds:[5050505],eax
 00413CA5    add         eax,19050505
 00413CAA    add         eax,5050505
 00413CAF    add         eax,9090909
 00413CB4    or          dword ptr [ecx],ecx
 00413CB6    or          dword ptr [ecx],ecx
 00413CB8    or          dword ptr [ecx],ecx
 00413CBA    or          dword ptr [ecx],ecx
 00413CBC    or          dword ptr [ecx],ecx
 00413CBE    or          dword ptr [ecx],ecx
 00413CC0    or          dword ptr [ecx],ecx
 00413CC2    or          dword ptr [ecx],ebx
 00413CC4    add         eax,5190505
 00413CC9    add         eax,5050505
 00413CCE    or          dword ptr ds:[0D0D0202],eax
 00413CD4    or          eax,0D0D0D0D
 00413CD9    or          eax,0D0D0D0D
 00413CDE    or          eax,0D0D0D0D
 00413CE3    or          eax,0F0F0F0F
 00413CE8    ???
 00413CE9    ???
 00413CEA    ???
 00413CEB    ???
 00413CEC    ???
 00413CED    ???
 00413CEE    lar         eax,dword ptr [edx]
 00413CF1    add         al,byte ptr [edx]
 00413CF3    add         al,byte ptr [edx]
 00413CF5    sbb         al,byte ptr [edx]
 00413CF7    add         al,byte ptr [edx]
 00413CF9    add         al,byte ptr [edx]
 00413CFB    add         al,byte ptr [edx]
 00413CFD    add         al,byte ptr [edx]
 00413CFF    add         al,byte ptr [edx]
 00413D01    sbb         al,byte ptr [edx]
 00413D03    sbb         al,byte ptr [edx]
 00413D05    add         bl,byte ptr [edx]
 00413D07    add         al,byte ptr [edx]
 00413D09    add         bl,byte ptr [edx]
 00413D0B    add         al,byte ptr [edx]
 00413D0D    add         bl,byte ptr [edx]
 00413D0F    sbb         bl,byte ptr [edx]
 00413D11    sbb         bl,byte ptr [edx]
 00413D13    add         al,byte ptr [edx]
 00413D15    add         al,byte ptr [edx]
 00413D17    add         al,byte ptr [edx]
 00413D19    add         al,byte ptr [edx]
 00413D1B    sbb         al,byte ptr [edx]
 00413D1D    add         al,byte ptr [edx]
 00413D1F    add         al,byte ptr [edx]
 00413D21    add         al,byte ptr [edx]
 00413D23    sbb         al,byte ptr [edx]
 00413D25    add         al,byte ptr [edx]
 00413D27    add         al,byte ptr [edx]
 00413D29    add         al,byte ptr [edx]
 00413D2B    add         al,byte ptr [edx]
 00413D2D    sbb         al,byte ptr [edx]
 00413D2F    sbb         bl,byte ptr [edx]
 00413D31    add         al,byte ptr [edx]
 00413D33    sbb         al,byte ptr [edx]
 00413D35    add         al,byte ptr [edx]
 00413D37    add         al,byte ptr [edx]
 00413D39    add         al,byte ptr [edx]
 00413D3B    add         al,byte ptr [edx]
 00413D3D    add         bl,byte ptr [edx]
 00413D3F    sbb         bl,byte ptr [edx]
 00413D41    sbb         al,byte ptr [edx]
 00413D43    add         bl,byte ptr [edx]
 00413D45    add         al,byte ptr [edx]
 00413D47    add         al,byte ptr [edx]
 00413D49    add         al,byte ptr [edx]
 00413D4B    add         al,byte ptr [edx]
 00413D4D    add         al,byte ptr [edx]
 00413D4F    add         al,byte ptr [edx]
 00413D51    add         al,byte ptr [edx]
 00413D53    add         bl,byte ptr [edx]
 00413D55    sbb         al,byte ptr [edx]
 00413D57    add         al,byte ptr [edx]
 00413D59    add         al,byte ptr [edx]
 00413D5B    add         al,byte ptr [edx]
 00413D5D    add         al,byte ptr [edx]
 00413D5F    add         al,byte ptr [edx]
 00413D61    add         al,byte ptr [edx]
 00413D63    add         bl,byte ptr [edx]
 00413D65    sbb         bl,byte ptr [edx]
 00413D67    sbb         bl,byte ptr [edx]
 00413D69    sbb         bl,byte ptr [edx]
 00413D6B    sbb         bl,byte ptr [edx]
 00413D6D    add         al,byte ptr [edx]
 00413D6F    add         al,byte ptr [edx]
 00413D71    add         al,byte ptr [edx]
 00413D73    add         al,byte ptr [edx]
 00413D75    add         dword ptr [edx],eax
 00413D77    add         al,byte ptr [edx]
 00413D79    add         al,byte ptr [edx]
 00413D7B    add         al,byte ptr [edx]
 00413D7D    add         al,byte ptr [edx]
 00413D7F    add         al,byte ptr [edx]
 00413D81    add         al,byte ptr [edx]
 00413D83    add         al,byte ptr [ecx]
 00413D85    add         dword ptr [ecx],eax
 00413D87    add         dword ptr [ecx],eax
 00413D89    add         dword ptr [ecx],eax
 00413D8B    add         dword ptr [ecx],eax
 00413D8D    add         dword ptr [ecx],eax
 00413D8F    add         dword ptr [ecx],eax
 00413D91    add         dword ptr [ecx],eax
 00413D93    add         dword ptr [ebx],eax
 00413D95    add         eax,dword ptr [ebx]
 00413D97    add         eax,dword ptr [ebx]
 00413D99    add         eax,dword ptr [ebx]
 00413D9B    add         eax,dword ptr [ebx]
 00413D9D    add         eax,dword ptr [ebx]
 00413D9F    add         eax,dword ptr [ebx]
 00413DA1    add         eax,dword ptr [edx]
 00413DA3    add         al,byte ptr [eax]
 00413DA5    add         byte ptr [eax],dl
 00413DA7    add         byte ptr [eax],dl
 00413DA9    add         byte ptr [eax],dl
 00413DAB    add         byte ptr [eax],dl
 00413DAD    add         byte ptr [eax],dl
 00413DAF    add         byte ptr [eax],ah
 00413DB1    add         byte ptr [eax],dh
 00413DB3    add         byte ptr [eax],dl
 00413DB5    add         byte ptr [eax],al
 00413DB8    push        eax
 00413DB9    add         byte ptr [eax],ah
>00413DBC    jo          00413DBE
 00413DBE    add         byte ptr [eax],90
 00413DC1    add         byte ptr [eax+1000B000],ah
 00413DC7    add         byte ptr [eax],dl
 00413DC9    add         al,al
 00413DCB    add         byte ptr [eax],dl
 00413DCD    add         byte ptr [eax],dl
 00413DCF    add         al,dl
 00413DD1    add         al,ah
 00413DD3    add         al,dh
 00413DD5    add         byte ptr [eax],al
 00413DD7    add         dword ptr [eax],edx
 00413DD9    add         dword ptr [eax],esp
 00413DDB    add         dword ptr [eax],esi
 00413DDD    add         dword ptr [eax],edx
 00413DDF    add         byte ptr [eax],dl
 00413DE1    add         byte ptr [eax],dl
 00413DE3    add         byte ptr [eax+1],al
 00413DE6    push        eax
 00413DE7    add         dword ptr [eax],edx
 00413DE9    add         byte ptr [eax],dl
 00413DEB    add         byte ptr [eax+1],ah
 00413DEE    adc         byte ptr [eax],al
 00413DF0    adc         byte ptr [eax],al
>00413DF2    jo          00413DF5
 00413DF4    adc         byte ptr [eax],al
 00413DF6    adc         byte ptr [eax],al
 00413DF8    adc         byte ptr [eax],al
 00413DFA    adc         byte ptr [eax],al
 00413DFC    add         byte ptr [ecx],10
 00413DFF    add         byte ptr [eax],dl
 00413E01    add         byte ptr [eax],dl
 00413E03    add         byte ptr [eax-4FFE5FFF],dl
 00413E09    add         dword ptr [eax],edx
 00413E0B    add         byte ptr [eax],dl
 00413E0D    add         byte ptr [eax],dl
 00413E0F    add         byte ptr [eax],dl
 00413E11    add         byte ptr [eax],dl
 00413E13    add         byte ptr [eax],dl
 00413E15    add         byte ptr [eax],dl
 00413E17    add         byte ptr [eax],dl
 00413E19    add         byte ptr [eax],dl
 00413E1B    add         byte ptr [eax],dl
 00413E1D    add         byte ptr [eax],dl
 00413E1F    add         byte ptr [eax],dl
 00413E21    add         byte ptr [eax],dl
 00413E23    add         byte ptr [eax],dl
 00413E25    add         byte ptr [eax],dl
 00413E27    add         byte ptr [eax],dl
 00413E29    add         byte ptr [eax],dl
 00413E2B    add         byte ptr [eax],dl
 00413E2D    add         byte ptr [eax],dl
 00413E2F    add         byte ptr [eax],dl
 00413E31    add         byte ptr [eax],dl
 00413E33    add         byte ptr [eax],dl
 00413E35    add         byte ptr [eax],dl
 00413E37    add         byte ptr [eax],dl
 00413E39    add         byte ptr [eax],dl
 00413E3B    add         byte ptr [eax],dl
 00413E3D    add         byte ptr [eax],dl
 00413E3F    add         byte ptr [eax],dl
 00413E41    add         byte ptr [eax],dl
 00413E43    add         byte ptr [eax],dl
 00413E45    add         byte ptr [eax],dl
 00413E47    add         byte ptr [eax],dl
 00413E49    add         byte ptr [eax],dl
 00413E4B    add         byte ptr [eax],dl
 00413E4D    add         byte ptr [eax],dl
 00413E4F    add         byte ptr [eax],dl
 00413E51    add         byte ptr [eax],dl
 00413E53    add         byte ptr [eax],dl
 00413E55    add         byte ptr [eax],dl
 00413E57    add         byte ptr [eax],dl
 00413E59    add         byte ptr [eax],dl
 00413E5B    add         byte ptr [eax],dl
 00413E5D    add         byte ptr [eax],dl
 00413E5F    add         byte ptr [eax],dl
 00413E61    add         byte ptr [eax],dl
 00413E63    add         byte ptr [eax],dl
 00413E65    add         byte ptr [eax],dl
 00413E67    add         byte ptr [eax],dl
 00413E69    add         byte ptr [eax],dl
 00413E6B    add         byte ptr [eax],dl
 00413E6D    add         byte ptr [eax],dl
 00413E6F    add         byte ptr [eax],dl
 00413E71    add         byte ptr [eax],dl
 00413E73    add         byte ptr [eax],dl
 00413E75    add         byte ptr [eax],dl
 00413E77    add         byte ptr [eax],dl
 00413E79    add         byte ptr [eax],dl
 00413E7B    add         byte ptr [eax],dl
 00413E7D    add         byte ptr [eax],dl
 00413E7F    add         byte ptr [eax],dl
 00413E81    add         byte ptr [eax],dl
 00413E83    add         byte ptr [eax],dl
 00413E85    add         byte ptr [eax],dl
 00413E87    add         byte ptr [eax],dl
 00413E89    add         byte ptr [eax],dl
 00413E8B    add         byte ptr [eax],dl
 00413E8D    add         byte ptr [eax],dl
 00413E8F    add         byte ptr [eax],dl
 00413E91    add         byte ptr [eax],dl
 00413E93    add         byte ptr [eax],dl
 00413E95    add         byte ptr [eax],dl
 00413E97    add         byte ptr [eax],dl
 00413E99    add         byte ptr [eax],dl
 00413E9B    add         byte ptr [eax],dl
 00413E9D    add         byte ptr [eax],dl
 00413E9F    add         byte ptr [eax],dl
 00413EA1    add         byte ptr [eax],dl
 00413EA3    add         byte ptr [eax],dl
 00413EA5    add         byte ptr [eax],dl
 00413EA7    add         byte ptr [eax],dl
 00413EA9    add         byte ptr [eax],dl
 00413EAB    add         byte ptr [eax],dl
 00413EAD    add         byte ptr [eax],dl
 00413EAF    add         byte ptr [eax],dl
 00413EB1    add         byte ptr [eax],dl
 00413EB3    add         byte ptr [eax],dl
 00413EB5    add         byte ptr [eax],dl
 00413EB7    add         byte ptr [eax],dl
 00413EB9    add         byte ptr [eax],dl
 00413EBB    add         byte ptr [eax],dl
 00413EBD    add         byte ptr [eax],dl
 00413EBF    add         byte ptr [eax],dl
 00413EC1    add         byte ptr [eax],dl
 00413EC3    add         byte ptr [eax],dl
 00413EC5    add         byte ptr [eax],dl
 00413EC7    add         byte ptr [eax],dl
 00413EC9    add         byte ptr [eax],dl
 00413ECB    add         byte ptr [eax],dl
 00413ECD    add         byte ptr [eax],dl
 00413ECF    add         byte ptr [eax],dl
 00413ED1    add         byte ptr [eax],dl
 00413ED3    add         byte ptr [eax],dl
 00413ED5    add         byte ptr [eax],dl
 00413ED7    add         byte ptr [eax],dl
 00413ED9    add         byte ptr [eax],dl
 00413EDB    add         byte ptr [eax],dl
 00413EDD    add         byte ptr [eax],dl
 00413EDF    add         byte ptr [eax],dl
 00413EE1    add         byte ptr [eax],dl
 00413EE3    add         byte ptr [eax],dl
 00413EE5    add         byte ptr [eax],dl
 00413EE7    add         byte ptr [eax],dl
 00413EE9    add         byte ptr [eax],dl
 00413EEB    add         byte ptr [eax],dl
 00413EED    add         byte ptr [eax],dl
 00413EEF    add         al,al
 00413EF1    add         dword ptr [eax],edx
 00413EF3    add         al,dl
 00413EF5    add         eax,esp
 00413EF7    add         eax,esi
 00413EF9    add         dword ptr [eax],eax
 00413EFB    add         dl,byte ptr [eax]
 00413EFD    add         byte ptr [eax],dl
 00413EFF    add         byte ptr [eax],dl
 00413F01    add         byte ptr [eax],dl
 00413F03    add         byte ptr [eax],dl
 00413F05    add         byte ptr [eax],dl
 00413F07    add         byte ptr [eax],dl
 00413F09    add         byte ptr [eax],dl
 00413F0B    add         byte ptr [eax],dl
 00413F0D    add         byte ptr [eax],dl
 00413F0F    add         byte ptr [eax],dl
 00413F11    add         byte ptr [eax],dl
 00413F13    add         byte ptr [eax],dl
 00413F15    add         byte ptr [eax],dl
 00413F17    add         byte ptr [eax],dl
 00413F19    add         byte ptr [eax],dl
 00413F1B    add         byte ptr [eax],dl
 00413F1D    add         byte ptr [eax],dl
 00413F1F    add         byte ptr [eax],dl
 00413F21    add         byte ptr [eax],dl
 00413F23    add         byte ptr [eax],dl
 00413F25    add         byte ptr [eax],dl
 00413F27    add         byte ptr [eax],dl
 00413F29    add         byte ptr [eax],dl
 00413F2B    add         byte ptr [eax],dl
 00413F2D    add         byte ptr [eax],dl
 00413F2F    add         byte ptr [eax],dl
 00413F31    add         byte ptr [eax],dl
 00413F33    add         byte ptr [eax],dl
 00413F35    add         byte ptr [eax],dl
 00413F37    add         byte ptr [eax],dl
 00413F39    add         byte ptr [eax],dl
 00413F3B    add         byte ptr [eax],dl
 00413F3D    add         byte ptr [eax],dl
 00413F3F    add         byte ptr [eax],dl
 00413F41    add         byte ptr [eax],dl
 00413F43    add         byte ptr [eax],dl
 00413F45    add         byte ptr [eax],dl
 00413F47    add         byte ptr [eax],dl
 00413F49    add         byte ptr [eax],dl
 00413F4B    add         byte ptr [eax],dl
 00413F4D    add         byte ptr [eax],dl
 00413F4F    add         byte ptr [eax],dl
 00413F51    add         byte ptr [eax],dl
 00413F53    add         byte ptr [eax],dl
 00413F55    add         byte ptr [eax],dl
 00413F57    add         byte ptr [eax],dl
 00413F59    add         byte ptr [eax],dl
 00413F5B    add         byte ptr [eax],dl
 00413F5D    add         byte ptr [eax],dl
 00413F5F    add         byte ptr [eax],dl
 00413F61    add         byte ptr [eax],dl
 00413F63    add         byte ptr [eax],dl
 00413F65    add         byte ptr [eax],dl
 00413F67    add         byte ptr [eax],dl
 00413F69    add         byte ptr [eax],dl
 00413F6B    add         byte ptr [eax],dl
 00413F6D    add         byte ptr [eax],dl
 00413F6F    add         byte ptr [eax],dl
 00413F71    add         byte ptr [eax],dl
 00413F73    add         byte ptr [eax],dl
 00413F75    add         byte ptr [eax],dl
 00413F77    add         byte ptr [eax],dl
 00413F79    add         byte ptr [eax],dl
 00413F7B    add         byte ptr [eax],dl
 00413F7D    add         byte ptr [eax],dl
 00413F7F    add         byte ptr [eax],dl
 00413F81    add         byte ptr [eax],dl
 00413F83    add         byte ptr [eax],dl
 00413F85    add         byte ptr [eax],dl
 00413F87    add         byte ptr [eax],dl
 00413F89    add         byte ptr [eax],dl
 00413F8B    add         byte ptr [eax],dl
 00413F8D    add         byte ptr [eax],dl
 00413F8F    add         byte ptr [eax],dl
 00413F91    add         byte ptr [eax],dl
 00413F93    add         byte ptr [eax],dl
 00413F95    add         byte ptr [eax],dl
 00413F97    add         byte ptr [eax],dl
 00413F99    add         byte ptr [eax],dl
 00413F9B    add         byte ptr [eax],dl
 00413F9D    add         byte ptr [eax],dl
 00413F9F    add         byte ptr [eax],dl
 00413FA1    add         al,dh
 00413FA3    add         byte ptr [eax],dl
 00413FA5    add         byte ptr [eax],dl
 00413FA7    add         dl,byte ptr [eax]
 00413FA9    add         byte ptr [eax],ah
 00413FAB    add         dh,byte ptr [eax]
 00413FAD    add         dl,byte ptr [eax]
 00413FAF    add         byte ptr [eax],dl
 00413FB1    add         byte ptr [eax],dl
 00413FB3    add         byte ptr [eax+2],al
 00413FB6    push        eax
 00413FB7    add         ah,byte ptr [eax+2]
>00413FBA    jo          00413FBE
 00413FBC    adc         byte ptr [eax],al
 00413FBE    adc         byte ptr [eax],al
 00413FC0    add         byte ptr [edx],10
 00413FC3    add         byte ptr [eax],dl
 00413FC5    add         byte ptr [eax],dl
 00413FC7    add         byte ptr [eax],dl
 00413FC9    add         byte ptr [eax],dl
 00413FCB    add         byte ptr [eax],dl
 00413FCD    add         byte ptr [eax],dl
 00413FCF    add         byte ptr [eax],dl
 00413FD1    add         byte ptr [eax],dl
 00413FD3    add         byte ptr [eax],dl
 00413FD5    add         byte ptr [eax],dl
 00413FD7    add         byte ptr [eax],dl
 00413FD9    add         byte ptr [eax],dl
 00413FDB    add         byte ptr [eax],dl
 00413FDD    add         byte ptr [eax],dl
 00413FDF    add         byte ptr [eax],dl
 00413FE1    add         byte ptr [eax],dl
 00413FE3    add         byte ptr [eax],dl
 00413FE5    add         byte ptr [eax],dl
 00413FE7    add         byte ptr [eax],dl
 00413FE9    add         byte ptr [eax],dl
 00413FEB    add         byte ptr [eax+10001002],dl
 00413FF1    add         byte ptr [eax],dl
 00413FF3    add         byte ptr [eax],dl
 00413FF5    add         byte ptr [eax],dl
 00413FF7    add         byte ptr [eax],dl
 00413FF9    add         byte ptr [eax],dl
 00413FFB    add         byte ptr [eax],dl
 00413FFD    add         byte ptr [eax],dl
 00413FFF    add         byte ptr [eax],dl
 00414001    add         byte ptr [eax],dl
 00414003    add         byte ptr [eax],dl
 00414005    add         byte ptr [eax],dl
 00414007    add         byte ptr [eax],dl
 00414009    add         byte ptr [eax],dl
 0041400B    add         byte ptr [eax],dl
 0041400D    add         byte ptr [eax],dl
 0041400F    add         byte ptr [eax],dl
 00414011    add         byte ptr [eax],dl
 00414013    add         byte ptr [eax],dl
 00414015    add         byte ptr [eax],dl
 00414017    add         byte ptr [eax],dl
 00414019    add         byte ptr [eax],dl
 0041401B    add         byte ptr [eax],dl
 0041401D    add         byte ptr [eax],dl
 0041401F    add         byte ptr [eax],dl
 00414021    add         byte ptr [eax],dl
 00414023    add         byte ptr [eax],dl
 00414025    add         byte ptr [eax],dl
 00414027    add         byte ptr [eax],dl
 00414029    add         byte ptr [eax],dl
 0041402B    add         byte ptr [eax],dl
 0041402D    add         byte ptr [eax],dl
 0041402F    add         byte ptr [eax],dl
 00414031    add         byte ptr [eax],dl
 00414033    add         byte ptr [eax],dl
 00414035    add         byte ptr [eax],dl
 00414037    add         byte ptr [eax],dl
 00414039    add         byte ptr [eax],dl
 0041403B    add         byte ptr [eax],dl
 0041403D    add         byte ptr [eax],dl
 0041403F    add         byte ptr [eax],dl
 00414041    add         byte ptr [eax],dl
 00414043    add         byte ptr [eax],dl
 00414045    add         byte ptr [eax],dl
 00414047    add         byte ptr [eax],dl
 00414049    add         byte ptr [eax],dl
 0041404B    add         byte ptr [eax],dl
 0041404D    add         byte ptr [eax],dl
 0041404F    add         byte ptr [eax],dl
 00414051    add         byte ptr [eax],dl
 00414053    add         byte ptr [eax],dl
 00414055    add         byte ptr [eax],dl
 00414057    add         byte ptr [eax],dl
 00414059    add         byte ptr [eax],dl
 0041405B    add         byte ptr [eax],dl
 0041405D    add         byte ptr [eax],dl
 0041405F    add         byte ptr [eax],dl
 00414061    add         byte ptr [eax],dl
 00414063    add         byte ptr [eax],dl
 00414065    add         byte ptr [eax],dl
 00414067    add         byte ptr [eax],dl
 00414069    add         byte ptr [eax],dl
 0041406B    add         byte ptr [eax],dl
 0041406D    add         byte ptr [eax],dl
 0041406F    add         byte ptr [eax],dl
 00414071    add         byte ptr [eax],dl
 00414073    add         byte ptr [eax],dl
 00414075    add         byte ptr [eax],dl
 00414077    add         byte ptr [eax],dl
 00414079    add         byte ptr [eax],dl
 0041407B    add         byte ptr [eax],dl
 0041407D    add         byte ptr [eax],dl
 0041407F    add         byte ptr [eax],dl
 00414081    add         byte ptr [eax],dl
 00414083    add         byte ptr [eax],dl
 00414085    add         byte ptr [eax],dl
 00414087    add         byte ptr [eax],dl
 00414089    add         byte ptr [eax],dl
 0041408B    add         byte ptr [eax],dl
 0041408D    add         byte ptr [eax],dl
 0041408F    add         byte ptr [eax],dl
 00414091    add         byte ptr [eax],dl
 00414093    add         byte ptr [eax],dl
 00414095    add         byte ptr [eax],dl
 00414097    add         byte ptr [eax],dl
 00414099    add         byte ptr [eax],dl
 0041409B    add         byte ptr [eax],dl
 0041409D    add         byte ptr [eax],dl
 0041409F    add         byte ptr [eax],dl
 004140A1    add         byte ptr [eax],dl
 004140A3    add         byte ptr [eax],dl
 004140A5    add         byte ptr [eax],dl
 004140A7    add         byte ptr [eax],dl
 004140A9    add         byte ptr [eax],dl
 004140AB    add         byte ptr [eax],dl
 004140AD    add         byte ptr [eax],dl
 004140AF    add         byte ptr [eax],dl
 004140B1    add         byte ptr [eax],dl
 004140B3    add         byte ptr [eax],dl
 004140B5    add         byte ptr [eax],dl
 004140B7    add         byte ptr [eax],dl
 004140B9    add         byte ptr [eax],dl
 004140BB    add         byte ptr [eax],dl
 004140BD    add         byte ptr [eax],dl
 004140BF    add         byte ptr [eax],dl
 004140C1    add         byte ptr [eax],dl
 004140C3    add         byte ptr [eax],dl
 004140C5    add         byte ptr [eax],dl
 004140C7    add         byte ptr [eax],dl
 004140C9    add         byte ptr [eax],dl
 004140CB    add         byte ptr [eax],dl
 004140CD    add         byte ptr [eax],dl
 004140CF    add         byte ptr [eax],dl
 004140D1    add         byte ptr [eax],dl
 004140D3    add         byte ptr [eax],dl
 004140D5    add         byte ptr [eax],dl
 004140D7    add         byte ptr [eax],dl
 004140D9    add         byte ptr [eax],dl
 004140DB    add         byte ptr [eax],dl
 004140DD    add         byte ptr [eax],dl
 004140DF    add         byte ptr [eax],dl
 004140E1    add         byte ptr [eax],dl
 004140E3    add         byte ptr [eax],dl
 004140E5    add         byte ptr [eax],dl
 004140E7    add         byte ptr [eax],dl
 004140E9    add         byte ptr [eax],dl
 004140EB    add         byte ptr [eax],dl
 004140ED    add         byte ptr [eax],dl
 004140EF    add         byte ptr [eax],dl
 004140F1    add         byte ptr [eax],dl
 004140F3    add         byte ptr [eax],dl
 004140F5    add         byte ptr [eax],dl
 004140F7    add         byte ptr [eax],dl
 004140F9    add         byte ptr [eax],dl
 004140FB    add         byte ptr [eax],dl
 004140FD    add         byte ptr [eax],dl
 004140FF    add         byte ptr [eax],dl
 00414101    add         byte ptr [eax],dl
 00414103    add         byte ptr [eax],dl
 00414105    add         byte ptr [eax],dl
 00414107    add         byte ptr [eax],dl
 00414109    add         byte ptr [eax],dl
 0041410B    add         byte ptr [eax],dl
 0041410D    add         byte ptr [eax],dl
 0041410F    add         byte ptr [eax],dl
 00414111    add         byte ptr [eax],dl
 00414113    add         byte ptr [eax],dl
 00414115    add         byte ptr [eax],dl
 00414117    add         byte ptr [eax],dl
 00414119    add         byte ptr [eax],dl
 0041411B    add         byte ptr [eax],dl
 0041411D    add         byte ptr [eax],dl
 0041411F    add         byte ptr [eax],dl
 00414121    add         byte ptr [eax],dl
 00414123    add         byte ptr [eax],dl
 00414125    add         byte ptr [eax],dl
 00414127    add         byte ptr [eax],dl
 00414129    add         byte ptr [eax],dl
 0041412B    add         byte ptr [eax],dl
 0041412D    add         byte ptr [eax],dl
 0041412F    add         byte ptr [eax],dl
 00414131    add         byte ptr [eax],dl
 00414133    add         byte ptr [eax],dl
 00414135    add         byte ptr [eax],dl
 00414137    add         byte ptr [eax],dl
 00414139    add         byte ptr [eax],dl
 0041413B    add         byte ptr [eax],dl
 0041413D    add         byte ptr [eax],dl
 0041413F    add         byte ptr [eax],dl
 00414141    add         byte ptr [eax],dl
 00414143    add         byte ptr [eax],dl
 00414145    add         byte ptr [eax],dl
 00414147    add         byte ptr [eax],dl
 00414149    add         byte ptr [eax+10001002],ah
 0041414F    add         byte ptr [eax],dl
 00414151    add         byte ptr [eax+10001002],dh
 00414157    add         byte ptr [eax],dl
 00414159    add         byte ptr [eax],dl
 0041415B    add         byte ptr [eax],dl
 0041415D    add         byte ptr [eax],dl
 0041415F    add         byte ptr [eax],dl
 00414161    add         byte ptr [eax],dl
 00414163    add         byte ptr [eax],dl
 00414165    add         byte ptr [eax],dl
 00414167    add         byte ptr [eax],dl
 00414169    add         byte ptr [eax],dl
 0041416B    add         byte ptr [eax],dl
 0041416D    add         byte ptr [eax],dl
 0041416F    add         byte ptr [eax],dl
 00414171    add         byte ptr [eax],dl
 00414173    add         byte ptr [eax],dl
 00414175    add         byte ptr [eax],dl
 00414177    add         byte ptr [eax],dl
 00414179    add         byte ptr [eax],dl
 0041417B    add         byte ptr [eax],dl
 0041417D    add         byte ptr [eax],dl
 0041417F    add         byte ptr [eax],dl
 00414181    add         byte ptr [eax],dl
 00414183    add         byte ptr [eax],dl
 00414185    add         al,al
 00414187    add         dl,byte ptr [eax]
 00414189    add         byte ptr [eax],dl
 0041418B    add         byte ptr [eax],dl
 0041418D    add         byte ptr [eax],dl
 0041418F    add         byte ptr [eax],dl
 00414191    add         byte ptr [eax],dl
 00414193    add         byte ptr [eax],dl
 00414195    add         byte ptr [eax],dl
 00414197    add         byte ptr [eax],dl
 00414199    add         byte ptr [eax],dl
 0041419B    add         byte ptr [eax],dl
 0041419D    add         byte ptr [eax],dl
 0041419F    add         byte ptr [eax],dl
 004141A1    add         byte ptr [eax],dl
 004141A3    add         byte ptr [eax],dl
 004141A5    add         byte ptr [eax],dl
 004141A7    add         byte ptr [eax],dl
 004141A9    add         byte ptr [eax],dl
 004141AB    add         byte ptr [eax],dl
 004141AD    add         byte ptr [eax],dl
 004141AF    add         byte ptr [eax],dl
 004141B1    add         byte ptr [eax],dl
 004141B3    add         byte ptr [eax],dl
 004141B5    add         byte ptr [eax],dl
 004141B7    add         byte ptr [eax],dl
 004141B9    add         byte ptr [eax],dl
 004141BB    add         byte ptr [eax],dl
 004141BD    add         byte ptr [eax],dl
 004141BF    add         byte ptr [eax],dl
 004141C1    add         byte ptr [eax],dl
 004141C3    add         byte ptr [eax],dl
 004141C5    add         byte ptr [eax],dl
 004141C7    add         byte ptr [eax],dl
 004141C9    add         byte ptr [eax],dl
 004141CB    add         byte ptr [eax],dl
 004141CD    add         byte ptr [eax],dl
 004141CF    add         byte ptr [eax],dl
 004141D1    add         byte ptr [eax],dl
 004141D3    add         byte ptr [eax],dl
 004141D5    add         byte ptr [eax],dl
 004141D7    add         byte ptr [eax],dl
 004141D9    add         byte ptr [eax],dl
 004141DB    add         byte ptr [eax],dl
 004141DD    add         byte ptr [eax],dl
 004141DF    add         byte ptr [eax],dl
 004141E1    add         byte ptr [eax],dl
 004141E3    add         byte ptr [eax],dl
 004141E5    add         byte ptr [eax],dl
 004141E7    add         byte ptr [eax],dl
 004141E9    add         byte ptr [eax],dl
 004141EB    add         byte ptr [eax],dl
 004141ED    add         byte ptr [eax],dl
 004141EF    add         byte ptr [eax],dl
 004141F1    add         byte ptr [eax],dl
 004141F3    add         byte ptr [eax],dl
 004141F5    add         byte ptr [eax],dl
 004141F7    add         byte ptr [eax],dl
 004141F9    add         byte ptr [eax],dl
 004141FB    add         byte ptr [eax],dl
 004141FD    add         byte ptr [eax],dl
 004141FF    add         byte ptr [eax],dl
 00414201    add         byte ptr [eax],dl
 00414203    add         byte ptr [eax],dl
 00414205    add         byte ptr [eax],dl
 00414207    add         byte ptr [eax],dl
 00414209    add         byte ptr [eax],dl
 0041420B    add         byte ptr [eax],dl
 0041420D    add         byte ptr [eax],dl
 0041420F    add         byte ptr [eax],dl
 00414211    add         byte ptr [eax],dl
 00414213    add         byte ptr [eax],dl
 00414215    add         byte ptr [eax],dl
 00414217    add         byte ptr [eax],dl
 00414219    add         byte ptr [eax],dl
 0041421B    add         byte ptr [eax],dl
 0041421D    add         byte ptr [eax],dl
 0041421F    add         byte ptr [eax],dl
 00414221    add         byte ptr [eax],dl
 00414223    add         byte ptr [eax],dl
 00414225    add         byte ptr [eax],dl
 00414227    add         byte ptr [eax],dl
 00414229    add         byte ptr [eax],dl
 0041422B    add         byte ptr [eax],dl
 0041422D    add         byte ptr [eax],dl
 0041422F    add         byte ptr [eax],dl
 00414231    add         byte ptr [eax],dl
 00414233    add         byte ptr [eax],dl
 00414235    add         byte ptr [eax],dl
 00414237    add         byte ptr [eax],dl
 00414239    add         byte ptr [eax],dl
 0041423B    add         byte ptr [eax],dl
 0041423D    add         byte ptr [eax],dl
 0041423F    add         byte ptr [eax],dl
 00414241    add         byte ptr [eax],dl
 00414243    add         byte ptr [eax],dl
 00414245    add         byte ptr [eax],dl
 00414247    add         byte ptr [eax],dl
 00414249    add         byte ptr [eax],dl
 0041424B    add         byte ptr [eax],dl
 0041424D    add         byte ptr [eax],dl
 0041424F    add         byte ptr [eax],dl
 00414251    add         byte ptr [eax],dl
 00414253    add         byte ptr [eax],dl
 00414255    add         byte ptr [eax],dl
 00414257    add         byte ptr [eax],dl
 00414259    add         byte ptr [eax],dl
 0041425B    add         byte ptr [eax],dl
 0041425D    add         byte ptr [eax],dl
 0041425F    add         byte ptr [eax],dl
 00414261    add         byte ptr [eax],dl
 00414263    add         byte ptr [eax],dl
 00414265    add         byte ptr [eax],dl
 00414267    add         byte ptr [eax],dl
 00414269    add         byte ptr [eax],dl
 0041426B    add         byte ptr [eax],dl
 0041426D    add         byte ptr [eax],dl
 0041426F    add         byte ptr [eax],dl
 00414271    add         byte ptr [eax],dl
 00414273    add         byte ptr [eax],dl
 00414275    add         byte ptr [eax],dl
 00414277    add         byte ptr [eax],dl
 00414279    add         byte ptr [eax],dl
 0041427B    add         byte ptr [eax],dl
 0041427D    add         byte ptr [eax],dl
 0041427F    add         byte ptr [eax],dl
 00414281    add         byte ptr [eax],dl
 00414283    add         byte ptr [eax],dl
 00414285    add         byte ptr [eax],dl
 00414287    add         byte ptr [eax],dl
 00414289    add         byte ptr [eax],dl
 0041428B    add         byte ptr [eax],dl
 0041428D    add         byte ptr [eax],dl
 0041428F    add         byte ptr [eax],dl
 00414291    add         byte ptr [eax],dl
 00414293    add         byte ptr [eax],dl
 00414295    add         byte ptr [eax],dl
 00414297    add         byte ptr [eax],dl
 00414299    add         byte ptr [eax],dl
 0041429B    add         byte ptr [eax],dl
 0041429D    add         byte ptr [eax],dl
 0041429F    add         byte ptr [eax],dl
 004142A1    add         byte ptr [eax],dl
 004142A3    add         byte ptr [eax],dl
 004142A5    add         byte ptr [eax],dl
 004142A7    add         byte ptr [eax],dl
 004142A9    add         byte ptr [eax],dl
 004142AB    add         byte ptr [eax],dl
 004142AD    add         byte ptr [eax],dl
 004142AF    add         byte ptr [eax],dl
 004142B1    add         byte ptr [eax],dl
 004142B3    add         byte ptr [eax],dl
 004142B5    add         byte ptr [eax],dl
 004142B7    add         byte ptr [eax],dl
 004142B9    add         byte ptr [eax],dl
 004142BB    add         byte ptr [eax],dl
 004142BD    add         byte ptr [eax],dl
 004142BF    add         byte ptr [eax],dl
 004142C1    add         byte ptr [eax],dl
 004142C3    add         byte ptr [eax],dl
 004142C5    add         byte ptr [eax],dl
 004142C7    add         byte ptr [eax],dl
 004142C9    add         byte ptr [eax],dl
 004142CB    add         byte ptr [eax],dl
 004142CD    add         byte ptr [eax],dl
 004142CF    add         byte ptr [eax],dl
 004142D1    add         byte ptr [eax],dl
 004142D3    add         byte ptr [eax],dl
 004142D5    add         byte ptr [eax],dl
 004142D7    add         byte ptr [eax],dl
 004142D9    add         byte ptr [eax],dl
 004142DB    add         byte ptr [eax],dl
 004142DD    add         byte ptr [eax],dl
 004142DF    add         byte ptr [eax],dl
 004142E1    add         byte ptr [eax],dl
 004142E3    add         byte ptr [eax],dl
 004142E5    add         byte ptr [eax],dl
 004142E7    add         byte ptr [eax],dl
 004142E9    add         byte ptr [eax],dl
 004142EB    add         byte ptr [eax],dl
 004142ED    add         byte ptr [eax],dl
 004142EF    add         byte ptr [eax],dl
 004142F1    add         byte ptr [eax],dl
 004142F3    add         byte ptr [eax],dl
 004142F5    add         byte ptr [eax],dl
 004142F7    add         byte ptr [eax],dl
 004142F9    add         byte ptr [eax],dl
 004142FB    add         byte ptr [eax],dl
 004142FD    add         byte ptr [eax],dl
 004142FF    add         byte ptr [eax],dl
 00414301    add         byte ptr [eax],dl
 00414303    add         byte ptr [eax],dl
 00414305    add         byte ptr [eax],dl
 00414307    add         byte ptr [eax],dl
 00414309    add         byte ptr [eax],dl
 0041430B    add         byte ptr [eax],dl
 0041430D    add         byte ptr [eax],dl
 0041430F    add         byte ptr [eax],dl
 00414311    add         byte ptr [eax],dl
 00414313    add         byte ptr [eax],dl
 00414315    add         byte ptr [eax],dl
 00414317    add         byte ptr [eax],dl
 00414319    add         byte ptr [eax],dl
 0041431B    add         byte ptr [eax],dl
 0041431D    add         byte ptr [eax],dl
 0041431F    add         byte ptr [eax],dl
 00414321    add         byte ptr [eax],dl
 00414323    add         byte ptr [eax],dl
 00414325    add         byte ptr [eax],dl
 00414327    add         byte ptr [eax],dl
 00414329    add         byte ptr [eax],dl
 0041432B    add         byte ptr [eax],dl
 0041432D    add         byte ptr [eax],dl
 0041432F    add         byte ptr [eax],dl
 00414331    add         byte ptr [eax],dl
 00414333    add         byte ptr [eax],dl
 00414335    add         byte ptr [eax],dl
 00414337    add         byte ptr [eax],dl
 00414339    add         byte ptr [eax],dl
 0041433B    add         byte ptr [eax],dl
 0041433D    add         byte ptr [eax],dl
 0041433F    add         byte ptr [eax],dl
 00414341    add         byte ptr [eax],dl
 00414343    add         byte ptr [eax],dl
 00414345    add         byte ptr [eax],dl
 00414347    add         byte ptr [eax],dl
 00414349    add         byte ptr [eax],dl
 0041434B    add         byte ptr [eax],dl
 0041434D    add         byte ptr [eax],dl
 0041434F    add         byte ptr [eax],dl
 00414351    add         byte ptr [eax],dl
 00414353    add         byte ptr [eax],dl
 00414355    add         byte ptr [eax],dl
 00414357    add         byte ptr [eax],dl
 00414359    add         byte ptr [eax],dl
 0041435B    add         byte ptr [eax],dl
 0041435D    add         byte ptr [eax],dl
 0041435F    add         byte ptr [eax],dl
 00414361    add         byte ptr [eax],dl
 00414363    add         byte ptr [eax],dl
 00414365    add         byte ptr [eax],dl
 00414367    add         byte ptr [eax],dl
 00414369    add         byte ptr [eax],dl
 0041436B    add         byte ptr [eax],dl
 0041436D    add         byte ptr [eax],dl
 0041436F    add         byte ptr [eax],dl
 00414371    add         byte ptr [eax],dl
 00414373    add         byte ptr [eax],dl
 00414375    add         byte ptr [eax],dl
 00414377    add         byte ptr [eax],dl
 00414379    add         byte ptr [eax],dl
 0041437B    add         byte ptr [eax],dl
 0041437D    add         byte ptr [eax],dl
 0041437F    add         byte ptr [eax],dl
 00414381    add         byte ptr [eax],dl
 00414383    add         byte ptr [eax],dl
 00414385    add         byte ptr [eax],dl
 00414387    add         byte ptr [eax],dl
 00414389    add         byte ptr [eax],dl
 0041438B    add         byte ptr [eax],dl
 0041438D    add         byte ptr [eax],dl
 0041438F    add         byte ptr [eax],dl
 00414391    add         byte ptr [eax],dl
 00414393    add         byte ptr [eax],dl
 00414395    add         byte ptr [eax],dl
 00414397    add         byte ptr [eax],dl
 00414399    add         byte ptr [eax],dl
 0041439B    add         byte ptr [eax],dl
 0041439D    add         byte ptr [eax],dl
 0041439F    add         byte ptr [eax],dl
 004143A1    add         byte ptr [eax],dl
 004143A3    add         byte ptr [eax],dl
 004143A5    add         byte ptr [eax],dl
 004143A7    add         byte ptr [eax],dl
 004143A9    add         byte ptr [eax],dl
 004143AB    add         byte ptr [eax],dl
 004143AD    add         byte ptr [eax],dl
 004143AF    add         byte ptr [eax],dl
 004143B1    add         byte ptr [eax],dl
 004143B3    add         byte ptr [eax],dl
 004143B5    add         byte ptr [eax],dl
 004143B7    add         byte ptr [eax],dl
 004143B9    add         byte ptr [eax],dl
 004143BB    add         byte ptr [eax],dl
 004143BD    add         byte ptr [eax],dl
 004143BF    add         byte ptr [eax],dl
 004143C1    add         byte ptr [eax],dl
 004143C3    add         byte ptr [eax],dl
 004143C5    add         byte ptr [eax],dl
 004143C7    add         byte ptr [eax],dl
 004143C9    add         byte ptr [eax],dl
 004143CB    add         byte ptr [eax],dl
 004143CD    add         byte ptr [eax],dl
 004143CF    add         byte ptr [eax],dl
 004143D1    add         byte ptr [eax],dl
 004143D3    add         byte ptr [eax],dl
 004143D5    add         byte ptr [eax],dl
 004143D7    add         byte ptr [eax],dl
 004143D9    add         byte ptr [eax],dl
 004143DB    add         byte ptr [eax],dl
 004143DD    add         byte ptr [eax],dl
 004143DF    add         byte ptr [eax],dl
 004143E1    add         byte ptr [eax],dl
 004143E3    add         byte ptr [eax],dl
 004143E5    add         byte ptr [eax],dl
 004143E7    add         byte ptr [eax],dl
 004143E9    add         byte ptr [eax],dl
 004143EB    add         byte ptr [eax],dl
 004143ED    add         byte ptr [eax],dl
 004143EF    add         byte ptr [eax],dl
 004143F1    add         byte ptr [eax],dl
 004143F3    add         byte ptr [eax],dl
 004143F5    add         byte ptr [eax],dl
 004143F7    add         byte ptr [eax],dl
 004143F9    add         byte ptr [eax],dl
 004143FB    add         byte ptr [eax],dl
 004143FD    add         byte ptr [eax],dl
 004143FF    add         byte ptr [eax],dl
 00414401    add         byte ptr [eax],dl
 00414403    add         byte ptr [eax],dl
 00414405    add         byte ptr [eax],dl
 00414407    add         byte ptr [eax],dl
 00414409    add         byte ptr [eax],dl
 0041440B    add         byte ptr [eax],dl
 0041440D    add         byte ptr [eax],dl
 0041440F    add         byte ptr [eax],dl
 00414411    add         byte ptr [eax],dl
 00414413    add         byte ptr [eax],dl
 00414415    add         byte ptr [eax],dl
 00414417    add         byte ptr [eax],dl
 00414419    add         byte ptr [eax],dl
 0041441B    add         byte ptr [eax],dl
 0041441D    add         byte ptr [eax],dl
 0041441F    add         byte ptr [eax],dl
 00414421    add         byte ptr [eax],dl
 00414423    add         byte ptr [eax],dl
 00414425    add         byte ptr [eax],dl
 00414427    add         byte ptr [eax],dl
 00414429    add         byte ptr [eax],dl
 0041442B    add         byte ptr [eax],dl
 0041442D    add         byte ptr [eax],dl
 0041442F    add         byte ptr [eax],dl
 00414431    add         byte ptr [eax],dl
 00414433    add         byte ptr [eax],dl
 00414435    add         byte ptr [eax],dl
 00414437    add         byte ptr [eax],dl
 00414439    add         byte ptr [eax],dl
 0041443B    add         byte ptr [eax],dl
 0041443D    add         byte ptr [eax],dl
 0041443F    add         byte ptr [eax],dl
 00414441    add         byte ptr [eax],dl
 00414443    add         byte ptr [eax],dl
 00414445    add         byte ptr [eax],dl
 00414447    add         byte ptr [eax],dl
 00414449    add         byte ptr [eax],dl
 0041444B    add         byte ptr [eax],dl
 0041444D    add         byte ptr [eax],dl
 0041444F    add         byte ptr [eax],dl
 00414451    add         byte ptr [eax],dl
 00414453    add         byte ptr [eax],dl
 00414455    add         byte ptr [eax],dl
 00414457    add         byte ptr [eax],dl
 00414459    add         byte ptr [eax],dl
 0041445B    add         byte ptr [eax],dl
 0041445D    add         byte ptr [eax],dl
 0041445F    add         byte ptr [eax],dl
 00414461    add         byte ptr [eax],dl
 00414463    add         byte ptr [eax],dl
 00414465    add         byte ptr [eax],dl
 00414467    add         byte ptr [eax],dl
 00414469    add         byte ptr [eax],dl
 0041446B    add         byte ptr [eax],dl
 0041446D    add         byte ptr [eax],dl
 0041446F    add         byte ptr [eax],dl
 00414471    add         byte ptr [eax],dl
 00414473    add         byte ptr [eax],dl
 00414475    add         byte ptr [eax],dl
 00414477    add         byte ptr [eax],dl
 00414479    add         byte ptr [eax],dl
 0041447B    add         byte ptr [eax],dl
 0041447D    add         byte ptr [eax],dl
 0041447F    add         byte ptr [eax],dl
 00414481    add         byte ptr [eax],dl
 00414483    add         byte ptr [eax],dl
 00414485    add         byte ptr [eax],dl
 00414487    add         byte ptr [eax],dl
 00414489    add         byte ptr [eax],dl
 0041448B    add         byte ptr [eax],dl
 0041448D    add         byte ptr [eax],dl
 0041448F    add         byte ptr [eax],dl
 00414491    add         byte ptr [eax],dl
 00414493    add         byte ptr [eax],dl
 00414495    add         byte ptr [eax],dl
 00414497    add         byte ptr [eax],dl
 00414499    add         byte ptr [eax],dl
 0041449B    add         byte ptr [eax],dl
 0041449D    add         byte ptr [eax],dl
 0041449F    add         byte ptr [eax],dl
 004144A1    add         byte ptr [eax],dl
 004144A3    add         byte ptr [eax],dl
 004144A5    add         byte ptr [eax],dl
 004144A7    add         byte ptr [eax],dl
 004144A9    add         byte ptr [eax],dl
 004144AB    add         byte ptr [eax],dl
 004144AD    add         byte ptr [eax],dl
 004144AF    add         byte ptr [eax],dl
 004144B1    add         byte ptr [eax],dl
 004144B3    add         byte ptr [eax],dl
 004144B5    add         byte ptr [eax],dl
 004144B7    add         byte ptr [eax],dl
 004144B9    add         byte ptr [eax],dl
 004144BB    add         byte ptr [eax],dl
 004144BD    add         byte ptr [eax],dl
 004144BF    add         byte ptr [eax],dl
 004144C1    add         byte ptr [eax],dl
 004144C3    add         byte ptr [eax],dl
 004144C5    add         byte ptr [eax],dl
 004144C7    add         byte ptr [eax],dl
 004144C9    add         byte ptr [eax],dl
 004144CB    add         byte ptr [eax],dl
 004144CD    add         byte ptr [eax],dl
 004144CF    add         byte ptr [eax],dl
 004144D1    add         byte ptr [eax],dl
 004144D3    add         byte ptr [eax],dl
 004144D5    add         byte ptr [eax],dl
 004144D7    add         byte ptr [eax],dl
 004144D9    add         byte ptr [eax],dl
 004144DB    add         byte ptr [eax],dl
 004144DD    add         byte ptr [eax],dl
 004144DF    add         byte ptr [eax],dl
 004144E1    add         byte ptr [eax],dl
 004144E3    add         byte ptr [eax],dl
 004144E5    add         byte ptr [eax],dl
 004144E7    add         byte ptr [eax],dl
 004144E9    add         byte ptr [eax],dl
 004144EB    add         byte ptr [eax],dl
 004144ED    add         byte ptr [eax],dl
 004144EF    add         byte ptr [eax],dl
 004144F1    add         byte ptr [eax],dl
 004144F3    add         byte ptr [eax],dl
 004144F5    add         byte ptr [eax],dl
 004144F7    add         byte ptr [eax],dl
 004144F9    add         byte ptr [eax],dl
 004144FB    add         byte ptr [eax],dl
 004144FD    add         byte ptr [eax],dl
 004144FF    add         byte ptr [eax],dl
 00414501    add         byte ptr [eax],dl
 00414503    add         byte ptr [eax],dl
 00414505    add         byte ptr [eax],dl
 00414507    add         byte ptr [eax],dl
 00414509    add         byte ptr [eax],dl
 0041450B    add         byte ptr [eax],dl
 0041450D    add         byte ptr [eax],dl
 0041450F    add         byte ptr [eax],dl
 00414511    add         byte ptr [eax],dl
 00414513    add         byte ptr [eax],dl
 00414515    add         byte ptr [eax],dl
 00414517    add         byte ptr [eax],dl
 00414519    add         byte ptr [eax],dl
 0041451B    add         byte ptr [eax],dl
 0041451D    add         byte ptr [eax],dl
 0041451F    add         byte ptr [eax],dl
 00414521    add         byte ptr [eax],dl
 00414523    add         byte ptr [eax],dl
 00414525    add         byte ptr [eax],dl
 00414527    add         byte ptr [eax],dl
 00414529    add         byte ptr [eax],dl
 0041452B    add         byte ptr [eax],dl
 0041452D    add         byte ptr [eax],dl
 0041452F    add         byte ptr [eax],dl
 00414531    add         byte ptr [eax],dl
 00414533    add         byte ptr [eax],dl
 00414535    add         byte ptr [eax],dl
 00414537    add         byte ptr [eax],dl
 00414539    add         byte ptr [eax],dl
 0041453B    add         byte ptr [eax],dl
 0041453D    add         byte ptr [eax],dl
 0041453F    add         byte ptr [eax],dl
 00414541    add         byte ptr [eax],dl
 00414543    add         byte ptr [eax],dl
 00414545    add         byte ptr [eax],dl
 00414547    add         byte ptr [eax],dl
 00414549    add         byte ptr [eax],dl
 0041454B    add         byte ptr [eax],dl
 0041454D    add         byte ptr [eax],dl
 0041454F    add         byte ptr [eax],dl
 00414551    add         byte ptr [eax],dl
 00414553    add         byte ptr [eax],dl
 00414555    add         byte ptr [eax],dl
 00414557    add         byte ptr [eax],dl
 00414559    add         byte ptr [eax],dl
 0041455B    add         byte ptr [eax],dl
 0041455D    add         byte ptr [eax],dl
 0041455F    add         byte ptr [eax],dl
 00414561    add         byte ptr [eax],dl
 00414563    add         byte ptr [eax],dl
 00414565    add         byte ptr [eax],dl
 00414567    add         byte ptr [eax],dl
 00414569    add         byte ptr [eax],dl
 0041456B    add         byte ptr [eax],dl
 0041456D    add         byte ptr [eax],dl
 0041456F    add         byte ptr [eax],dl
 00414571    add         byte ptr [eax],dl
 00414573    add         byte ptr [eax],dl
 00414575    add         byte ptr [eax],dl
 00414577    add         byte ptr [eax],dl
 00414579    add         byte ptr [eax],dl
 0041457B    add         byte ptr [eax],dl
 0041457D    add         byte ptr [eax],dl
 0041457F    add         byte ptr [eax],dl
 00414581    add         byte ptr [eax],dl
 00414583    add         byte ptr [eax],dl
 00414585    add         byte ptr [eax],dl
 00414587    add         byte ptr [eax],dl
 00414589    add         byte ptr [eax],dl
 0041458B    add         byte ptr [eax],dl
 0041458D    add         byte ptr [eax],dl
 0041458F    add         byte ptr [eax],dl
 00414591    add         byte ptr [eax],dl
 00414593    add         byte ptr [eax],dl
 00414595    add         byte ptr [eax],dl
 00414597    add         byte ptr [eax],dl
 00414599    add         byte ptr [eax],dl
 0041459B    add         byte ptr [eax],dl
 0041459D    add         byte ptr [eax],dl
 0041459F    add         byte ptr [eax],dl
 004145A1    add         byte ptr [eax],dl
 004145A3    add         byte ptr [eax],dl
 004145A5    add         byte ptr [eax],dl
 004145A7    add         byte ptr [eax],dl
 004145A9    add         byte ptr [eax],dl
 004145AB    add         byte ptr [eax],dl
 004145AD    add         byte ptr [eax],dl
 004145AF    add         byte ptr [eax],dl
 004145B1    add         byte ptr [eax],dl
 004145B3    add         byte ptr [eax],dl
 004145B5    add         byte ptr [eax],dl
 004145B7    add         byte ptr [eax],dl
 004145B9    add         byte ptr [eax],dl
 004145BB    add         byte ptr [eax],dl
 004145BD    add         byte ptr [eax],dl
 004145BF    add         byte ptr [eax],dl
 004145C1    add         byte ptr [eax],dl
 004145C3    add         byte ptr [eax],dl
 004145C5    add         byte ptr [eax],dl
 004145C7    add         byte ptr [eax],dl
 004145C9    add         byte ptr [eax],dl
 004145CB    add         byte ptr [eax],dl
 004145CD    add         byte ptr [eax],dl
 004145CF    add         byte ptr [eax],dl
 004145D1    add         byte ptr [eax],dl
 004145D3    add         byte ptr [eax],dl
 004145D5    add         byte ptr [eax],dl
 004145D7    add         byte ptr [eax],dl
 004145D9    add         byte ptr [eax],dl
 004145DB    add         byte ptr [eax],dl
 004145DD    add         byte ptr [eax],dl
 004145DF    add         byte ptr [eax],dl
 004145E1    add         byte ptr [eax],dl
 004145E3    add         byte ptr [eax],dl
 004145E5    add         byte ptr [eax],dl
 004145E7    add         byte ptr [eax],dl
 004145E9    add         byte ptr [eax],dl
 004145EB    add         byte ptr [eax],dl
 004145ED    add         byte ptr [eax],dl
 004145EF    add         byte ptr [eax],dl
 004145F1    add         byte ptr [eax],dl
 004145F3    add         byte ptr [eax],dl
 004145F5    add         byte ptr [eax],dl
 004145F7    add         byte ptr [eax],dl
 004145F9    add         byte ptr [eax],dl
 004145FB    add         byte ptr [eax],dl
 004145FD    add         byte ptr [eax],dl
 004145FF    add         byte ptr [eax],dl
 00414601    add         byte ptr [eax],dl
 00414603    add         byte ptr [eax],dl
 00414605    add         byte ptr [eax],dl
 00414607    add         byte ptr [eax],dl
 00414609    add         byte ptr [eax],dl
 0041460B    add         byte ptr [eax],dl
 0041460D    add         byte ptr [eax],dl
 0041460F    add         byte ptr [eax],dl
 00414611    add         byte ptr [eax],dl
 00414613    add         byte ptr [eax],dl
 00414615    add         byte ptr [eax],dl
 00414617    add         byte ptr [eax],dl
 00414619    add         byte ptr [eax],dl
 0041461B    add         byte ptr [eax],dl
 0041461D    add         byte ptr [eax],dl
 0041461F    add         byte ptr [eax],dl
 00414621    add         byte ptr [eax],dl
 00414623    add         byte ptr [eax],dl
 00414625    add         byte ptr [eax],dl
 00414627    add         byte ptr [eax],dl
 00414629    add         byte ptr [eax],dl
 0041462B    add         byte ptr [eax],dl
 0041462D    add         byte ptr [eax],dl
 0041462F    add         byte ptr [eax],dl
 00414631    add         byte ptr [eax],dl
 00414633    add         byte ptr [eax],dl
 00414635    add         byte ptr [eax],dl
 00414637    add         byte ptr [eax],dl
 00414639    add         byte ptr [eax],dl
 0041463B    add         byte ptr [eax],dl
 0041463D    add         byte ptr [eax],dl
 0041463F    add         byte ptr [eax],dl
 00414641    add         byte ptr [eax],dl
 00414643    add         byte ptr [eax],dl
 00414645    add         byte ptr [eax],dl
 00414647    add         byte ptr [eax],dl
 00414649    add         byte ptr [eax],dl
 0041464B    add         byte ptr [eax],dl
 0041464D    add         byte ptr [eax],dl
 0041464F    add         byte ptr [eax],dl
 00414651    add         byte ptr [eax],dl
 00414653    add         byte ptr [eax],dl
 00414655    add         byte ptr [eax],dl
 00414657    add         byte ptr [eax],dl
 00414659    add         byte ptr [eax],dl
 0041465B    add         byte ptr [eax],dl
 0041465D    add         byte ptr [eax],dl
 0041465F    add         byte ptr [eax],dl
 00414661    add         byte ptr [eax],dl
 00414663    add         byte ptr [eax],dl
 00414665    add         byte ptr [eax],dl
 00414667    add         byte ptr [eax],dl
 00414669    add         byte ptr [eax],dl
 0041466B    add         byte ptr [eax],dl
 0041466D    add         byte ptr [eax],dl
 0041466F    add         byte ptr [eax],dl
 00414671    add         byte ptr [eax],dl
 00414673    add         byte ptr [eax],dl
 00414675    add         byte ptr [eax],dl
 00414677    add         byte ptr [eax],dl
 00414679    add         byte ptr [eax],dl
 0041467B    add         byte ptr [eax],dl
 0041467D    add         byte ptr [eax],dl
 0041467F    add         byte ptr [eax],dl
 00414681    add         byte ptr [eax],dl
 00414683    add         byte ptr [eax],dl
 00414685    add         byte ptr [eax],dl
 00414687    add         byte ptr [eax],dl
 00414689    add         byte ptr [eax],dl
 0041468B    add         byte ptr [eax],dl
 0041468D    add         byte ptr [eax],dl
 0041468F    add         byte ptr [eax],dl
 00414691    add         byte ptr [eax],dl
 00414693    add         byte ptr [eax],dl
 00414695    add         byte ptr [eax],dl
 00414697    add         byte ptr [eax],dl
 00414699    add         byte ptr [eax],dl
 0041469B    add         byte ptr [eax],dl
 0041469D    add         byte ptr [eax],dl
 0041469F    add         byte ptr [eax],dl
 004146A1    add         byte ptr [eax],dl
 004146A3    add         byte ptr [eax],dl
 004146A5    add         byte ptr [eax],dl
 004146A7    add         byte ptr [eax],dl
 004146A9    add         byte ptr [eax],dl
 004146AB    add         byte ptr [eax],dl
 004146AD    add         byte ptr [eax],dl
 004146AF    add         byte ptr [eax],dl
 004146B1    add         byte ptr [eax],dl
 004146B3    add         byte ptr [eax],dl
 004146B5    add         byte ptr [eax],dl
 004146B7    add         byte ptr [eax],dl
 004146B9    add         byte ptr [eax],dl
 004146BB    add         byte ptr [eax],dl
 004146BD    add         byte ptr [eax],dl
 004146BF    add         byte ptr [eax],dl
 004146C1    add         byte ptr [eax],dl
 004146C3    add         byte ptr [eax],dl
 004146C5    add         byte ptr [eax],dl
 004146C7    add         byte ptr [eax],dl
 004146C9    add         byte ptr [eax],dl
 004146CB    add         byte ptr [eax],dl
 004146CD    add         byte ptr [eax],dl
 004146CF    add         byte ptr [eax],dl
 004146D1    add         byte ptr [eax],dl
 004146D3    add         byte ptr [eax],dl
 004146D5    add         byte ptr [eax],dl
 004146D7    add         byte ptr [eax],dl
 004146D9    add         byte ptr [eax],dl
 004146DB    add         byte ptr [eax],dl
 004146DD    add         byte ptr [eax],dl
 004146DF    add         byte ptr [eax],dl
 004146E1    add         byte ptr [eax],dl
 004146E3    add         byte ptr [eax],dl
 004146E5    add         byte ptr [eax],dl
 004146E7    add         byte ptr [eax],dl
 004146E9    add         byte ptr [eax],dl
 004146EB    add         byte ptr [eax],dl
 004146ED    add         byte ptr [eax],dl
 004146EF    add         byte ptr [eax],dl
 004146F1    add         byte ptr [eax],dl
 004146F3    add         byte ptr [eax],dl
 004146F5    add         byte ptr [eax],dl
 004146F7    add         byte ptr [eax],dl
 004146F9    add         byte ptr [eax],dl
 004146FB    add         byte ptr [eax],dl
 004146FD    add         byte ptr [eax],dl
 004146FF    add         byte ptr [eax],dl
 00414701    add         byte ptr [eax],dl
 00414703    add         byte ptr [eax],dl
 00414705    add         byte ptr [eax],dl
 00414707    add         byte ptr [eax],dl
 00414709    add         byte ptr [eax],dl
 0041470B    add         byte ptr [eax],dl
 0041470D    add         byte ptr [eax],dl
 0041470F    add         byte ptr [eax],dl
 00414711    add         byte ptr [eax],dl
 00414713    add         byte ptr [eax],dl
 00414715    add         byte ptr [eax],dl
 00414717    add         byte ptr [eax],dl
 00414719    add         byte ptr [eax],dl
 0041471B    add         byte ptr [eax],dl
 0041471D    add         byte ptr [eax],dl
 0041471F    add         byte ptr [eax],dl
 00414721    add         byte ptr [eax],dl
 00414723    add         byte ptr [eax],dl
 00414725    add         byte ptr [eax],dl
 00414727    add         byte ptr [eax],dl
 00414729    add         byte ptr [eax],dl
 0041472B    add         byte ptr [eax],dl
 0041472D    add         byte ptr [eax],dl
 0041472F    add         byte ptr [eax],dl
 00414731    add         byte ptr [eax],dl
 00414733    add         byte ptr [eax],dl
 00414735    add         byte ptr [eax],dl
 00414737    add         byte ptr [eax],dl
 00414739    add         byte ptr [eax],dl
 0041473B    add         byte ptr [eax],dl
 0041473D    add         byte ptr [eax],dl
 0041473F    add         byte ptr [eax],dl
 00414741    add         byte ptr [eax],dl
 00414743    add         byte ptr [eax],dl
 00414745    add         byte ptr [eax],dl
 00414747    add         byte ptr [eax],dl
 00414749    add         byte ptr [eax],dl
 0041474B    add         byte ptr [eax],dl
 0041474D    add         byte ptr [eax],dl
 0041474F    add         byte ptr [eax],dl
 00414751    add         byte ptr [eax],dl
 00414753    add         byte ptr [eax],dl
 00414755    add         byte ptr [eax],dl
 00414757    add         byte ptr [eax],dl
 00414759    add         byte ptr [eax],dl
 0041475B    add         byte ptr [eax],dl
 0041475D    add         byte ptr [eax],dl
 0041475F    add         byte ptr [eax],dl
 00414761    add         byte ptr [eax],dl
 00414763    add         byte ptr [eax],dl
 00414765    add         byte ptr [eax],dl
 00414767    add         byte ptr [eax],dl
 00414769    add         byte ptr [eax],dl
 0041476B    add         byte ptr [eax],dl
 0041476D    add         byte ptr [eax],dl
 0041476F    add         byte ptr [eax],dl
 00414771    add         byte ptr [eax],dl
 00414773    add         byte ptr [eax],dl
 00414775    add         byte ptr [eax],dl
 00414777    add         byte ptr [eax],dl
 00414779    add         byte ptr [eax],dl
 0041477B    add         byte ptr [eax],dl
 0041477D    add         byte ptr [eax],dl
 0041477F    add         byte ptr [eax],dl
 00414781    add         byte ptr [eax],dl
 00414783    add         byte ptr [eax],dl
 00414785    add         byte ptr [eax],dl
 00414787    add         byte ptr [eax],dl
 00414789    add         byte ptr [eax],dl
 0041478B    add         byte ptr [eax],dl
 0041478D    add         byte ptr [eax],dl
 0041478F    add         byte ptr [eax],dl
 00414791    add         byte ptr [eax],dl
 00414793    add         byte ptr [eax],dl
 00414795    add         byte ptr [eax],dl
 00414797    add         byte ptr [eax],dl
 00414799    add         byte ptr [eax],dl
 0041479B    add         byte ptr [eax],dl
 0041479D    add         byte ptr [eax],dl
 0041479F    add         byte ptr [eax],dl
 004147A1    add         byte ptr [eax],dl
 004147A3    add         byte ptr [eax],dl
 004147A5    add         byte ptr [eax],dl
 004147A7    add         byte ptr [eax],dl
 004147A9    add         byte ptr [eax],dl
 004147AB    add         byte ptr [eax],dl
 004147AD    add         byte ptr [eax],dl
 004147AF    add         byte ptr [eax],dl
 004147B1    add         byte ptr [eax],dl
 004147B3    add         byte ptr [eax],dl
 004147B5    add         byte ptr [eax],dl
 004147B7    add         byte ptr [eax],dl
 004147B9    add         byte ptr [eax],dl
 004147BB    add         byte ptr [eax],dl
 004147BD    add         byte ptr [eax],dl
 004147BF    add         byte ptr [eax],dl
 004147C1    add         byte ptr [eax],dl
 004147C3    add         byte ptr [eax],dl
 004147C5    add         byte ptr [eax],dl
 004147C7    add         byte ptr [eax],dl
 004147C9    add         byte ptr [eax],dl
 004147CB    add         byte ptr [eax],dl
 004147CD    add         byte ptr [eax],dl
 004147CF    add         byte ptr [eax],dl
 004147D1    add         byte ptr [eax],dl
 004147D3    add         byte ptr [eax],dl
 004147D5    add         byte ptr [eax],dl
 004147D7    add         byte ptr [eax],dl
 004147D9    add         byte ptr [eax],dl
 004147DB    add         byte ptr [eax],dl
 004147DD    add         byte ptr [eax],dl
 004147DF    add         byte ptr [eax],dl
 004147E1    add         byte ptr [eax],dl
 004147E3    add         byte ptr [eax],dl
 004147E5    add         byte ptr [eax],dl
 004147E7    add         byte ptr [eax],dl
 004147E9    add         byte ptr [eax],dl
 004147EB    add         byte ptr [eax],dl
 004147ED    add         byte ptr [eax],dl
 004147EF    add         byte ptr [eax],dl
 004147F1    add         byte ptr [eax],dl
 004147F3    add         byte ptr [eax],dl
 004147F5    add         byte ptr [eax],dl
 004147F7    add         byte ptr [eax],dl
 004147F9    add         byte ptr [eax],dl
 004147FB    add         byte ptr [eax],dl
 004147FD    add         byte ptr [eax],dl
 004147FF    add         byte ptr [eax],dl
 00414801    add         byte ptr [eax],dl
 00414803    add         byte ptr [eax],dl
 00414805    add         byte ptr [eax],dl
 00414807    add         byte ptr [eax],dl
 00414809    add         byte ptr [eax],dl
 0041480B    add         byte ptr [eax],dl
 0041480D    add         byte ptr [eax],dl
 0041480F    add         byte ptr [eax],dl
 00414811    add         byte ptr [eax],dl
 00414813    add         byte ptr [eax],dl
 00414815    add         byte ptr [eax],dl
 00414817    add         byte ptr [eax],dl
 00414819    add         byte ptr [eax],dl
 0041481B    add         byte ptr [eax],dl
 0041481D    add         byte ptr [eax],dl
 0041481F    add         byte ptr [eax],dl
 00414821    add         byte ptr [eax],dl
 00414823    add         byte ptr [eax],dl
 00414825    add         byte ptr [eax],dl
 00414827    add         byte ptr [eax],dl
 00414829    add         byte ptr [eax],dl
 0041482B    add         byte ptr [eax],dl
 0041482D    add         byte ptr [eax],dl
 0041482F    add         byte ptr [eax],dl
 00414831    add         byte ptr [eax],dl
 00414833    add         byte ptr [eax],dl
 00414835    add         byte ptr [eax],dl
 00414837    add         byte ptr [eax],dl
 00414839    add         byte ptr [eax],dl
 0041483B    add         byte ptr [eax],dl
 0041483D    add         byte ptr [eax],dl
 0041483F    add         byte ptr [eax],dl
 00414841    add         byte ptr [eax],dl
 00414843    add         byte ptr [eax],dl
 00414845    add         byte ptr [eax],dl
 00414847    add         byte ptr [eax],dl
 00414849    add         byte ptr [eax],dl
 0041484B    add         byte ptr [eax],dl
 0041484D    add         byte ptr [eax],dl
 0041484F    add         byte ptr [eax],dl
 00414851    add         byte ptr [eax],dl
 00414853    add         byte ptr [eax],dl
 00414855    add         byte ptr [eax],dl
 00414857    add         byte ptr [eax],dl
 00414859    add         byte ptr [eax],dl
 0041485B    add         byte ptr [eax],dl
 0041485D    add         byte ptr [eax],dl
 0041485F    add         byte ptr [eax],dl
 00414861    add         byte ptr [eax],dl
 00414863    add         byte ptr [eax],dl
 00414865    add         byte ptr [eax],dl
 00414867    add         byte ptr [eax],dl
 00414869    add         byte ptr [eax],dl
 0041486B    add         byte ptr [eax],dl
 0041486D    add         byte ptr [eax],dl
 0041486F    add         byte ptr [eax],dl
 00414871    add         byte ptr [eax],dl
 00414873    add         byte ptr [eax],dl
 00414875    add         byte ptr [eax],dl
 00414877    add         byte ptr [eax],dl
 00414879    add         byte ptr [eax],dl
 0041487B    add         byte ptr [eax],dl
 0041487D    add         byte ptr [eax],dl
 0041487F    add         byte ptr [eax],dl
 00414881    add         byte ptr [eax],dl
 00414883    add         byte ptr [eax],dl
 00414885    add         byte ptr [eax],dl
 00414887    add         byte ptr [eax],dl
 00414889    add         byte ptr [eax],dl
 0041488B    add         byte ptr [eax],dl
 0041488D    add         byte ptr [eax],dl
 0041488F    add         byte ptr [eax],dl
 00414891    add         byte ptr [eax],dl
 00414893    add         byte ptr [eax],dl
 00414895    add         byte ptr [eax],dl
 00414897    add         byte ptr [eax],dl
 00414899    add         byte ptr [eax],dl
 0041489B    add         byte ptr [eax],dl
 0041489D    add         byte ptr [eax],dl
 0041489F    add         byte ptr [eax],dl
 004148A1    add         byte ptr [eax],dl
 004148A3    add         byte ptr [eax],dl
 004148A5    add         byte ptr [eax],dl
 004148A7    add         byte ptr [eax],dl
 004148A9    add         byte ptr [eax],dl
 004148AB    add         byte ptr [eax],dl
 004148AD    add         byte ptr [eax],dl
 004148AF    add         byte ptr [eax],dl
 004148B1    add         byte ptr [eax],dl
 004148B3    add         byte ptr [eax],dl
 004148B5    add         byte ptr [eax],dl
 004148B7    add         byte ptr [eax],dl
 004148B9    add         byte ptr [eax],dl
 004148BB    add         byte ptr [eax],dl
 004148BD    add         byte ptr [eax],dl
 004148BF    add         byte ptr [eax],dl
 004148C1    add         byte ptr [eax],dl
 004148C3    add         byte ptr [eax],dl
 004148C5    add         byte ptr [eax],dl
 004148C7    add         byte ptr [eax],dl
 004148C9    add         byte ptr [eax],dl
 004148CB    add         byte ptr [eax],dl
 004148CD    add         byte ptr [eax],dl
 004148CF    add         byte ptr [eax],dl
 004148D1    add         byte ptr [eax],dl
 004148D3    add         byte ptr [eax],dl
 004148D5    add         byte ptr [eax],dl
 004148D7    add         byte ptr [eax],dl
 004148D9    add         byte ptr [eax],dl
 004148DB    add         byte ptr [eax],dl
 004148DD    add         byte ptr [eax],dl
 004148DF    add         byte ptr [eax],dl
 004148E1    add         byte ptr [eax],dl
 004148E3    add         byte ptr [eax],dl
 004148E5    add         byte ptr [eax],dl
 004148E7    add         byte ptr [eax],dl
 004148E9    add         byte ptr [eax],dl
 004148EB    add         byte ptr [eax],dl
 004148ED    add         byte ptr [eax],dl
 004148EF    add         byte ptr [eax],dl
 004148F1    add         byte ptr [eax],dl
 004148F3    add         byte ptr [eax],dl
 004148F5    add         byte ptr [eax],dl
 004148F7    add         byte ptr [eax],dl
 004148F9    add         byte ptr [eax],dl
 004148FB    add         byte ptr [eax],dl
 004148FD    add         byte ptr [eax],dl
 004148FF    add         byte ptr [eax],dl
 00414901    add         byte ptr [eax],dl
 00414903    add         byte ptr [eax],dl
 00414905    add         byte ptr [eax],dl
 00414907    add         byte ptr [eax],dl
 00414909    add         byte ptr [eax],dl
 0041490B    add         byte ptr [eax],dl
 0041490D    add         byte ptr [eax],dl
 0041490F    add         byte ptr [eax],dl
 00414911    add         byte ptr [eax],dl
 00414913    add         byte ptr [eax],dl
 00414915    add         byte ptr [eax],dl
 00414917    add         byte ptr [eax],dl
 00414919    add         byte ptr [eax],dl
 0041491B    add         byte ptr [eax],dl
 0041491D    add         byte ptr [eax],dl
 0041491F    add         byte ptr [eax],dl
 00414921    add         byte ptr [eax],dl
 00414923    add         byte ptr [eax],dl
 00414925    add         byte ptr [eax],dl
 00414927    add         byte ptr [eax],dl
 00414929    add         byte ptr [eax],dl
 0041492B    add         byte ptr [eax],dl
 0041492D    add         byte ptr [eax],dl
 0041492F    add         byte ptr [eax],dl
 00414931    add         byte ptr [eax],dl
 00414933    add         byte ptr [eax],dl
 00414935    add         byte ptr [eax],dl
 00414937    add         byte ptr [eax],dl
 00414939    add         byte ptr [eax],dl
 0041493B    add         byte ptr [eax],dl
 0041493D    add         byte ptr [eax],dl
 0041493F    add         byte ptr [eax],dl
 00414941    add         byte ptr [eax],dl
 00414943    add         byte ptr [eax],dl
 00414945    add         byte ptr [eax],dl
 00414947    add         byte ptr [eax],dl
 00414949    add         byte ptr [eax],dl
 0041494B    add         byte ptr [eax],dl
 0041494D    add         byte ptr [eax],dl
 0041494F    add         byte ptr [eax],dl
 00414951    add         byte ptr [eax],dl
 00414953    add         byte ptr [eax],dl
 00414955    add         byte ptr [eax],dl
 00414957    add         byte ptr [eax],dl
 00414959    add         byte ptr [eax],dl
 0041495B    add         byte ptr [eax],dl
 0041495D    add         byte ptr [eax],dl
 0041495F    add         byte ptr [eax],dl
 00414961    add         byte ptr [eax],dl
 00414963    add         byte ptr [eax],dl
 00414965    add         byte ptr [eax],dl
 00414967    add         byte ptr [eax],dl
 00414969    add         byte ptr [eax],dl
 0041496B    add         byte ptr [eax],dl
 0041496D    add         byte ptr [eax],dl
 0041496F    add         byte ptr [eax],dl
 00414971    add         byte ptr [eax],dl
 00414973    add         byte ptr [eax],dl
 00414975    add         byte ptr [eax],dl
 00414977    add         byte ptr [eax],dl
 00414979    add         byte ptr [eax],dl
 0041497B    add         byte ptr [eax],dl
 0041497D    add         byte ptr [eax],dl
 0041497F    add         byte ptr [eax],dl
 00414981    add         byte ptr [eax],dl
 00414983    add         byte ptr [eax],dl
 00414985    add         byte ptr [eax],dl
 00414987    add         byte ptr [eax],dl
 00414989    add         byte ptr [eax],dl
 0041498B    add         byte ptr [eax],dl
 0041498D    add         byte ptr [eax],dl
 0041498F    add         byte ptr [eax],dl
 00414991    add         byte ptr [eax],dl
 00414993    add         byte ptr [eax],dl
 00414995    add         byte ptr [eax],dl
 00414997    add         byte ptr [eax],dl
 00414999    add         byte ptr [eax],dl
 0041499B    add         byte ptr [eax],dl
 0041499D    add         byte ptr [eax],dl
 0041499F    add         byte ptr [eax],dl
 004149A1    add         byte ptr [eax],dl
 004149A3    add         byte ptr [eax],dl
 004149A5    add         byte ptr [eax],dl
 004149A7    add         byte ptr [eax],dl
 004149A9    add         byte ptr [eax],dl
 004149AB    add         byte ptr [eax],dl
 004149AD    add         byte ptr [eax],dl
 004149AF    add         byte ptr [eax],dl
 004149B1    add         byte ptr [eax],dl
 004149B3    add         byte ptr [eax],dl
 004149B5    add         byte ptr [eax],dl
 004149B7    add         byte ptr [eax],dl
 004149B9    add         byte ptr [eax],dl
 004149BB    add         byte ptr [eax],dl
 004149BD    add         byte ptr [eax],dl
 004149BF    add         byte ptr [eax],dl
 004149C1    add         byte ptr [eax],dl
 004149C3    add         byte ptr [eax],dl
 004149C5    add         byte ptr [eax],dl
 004149C7    add         byte ptr [eax],dl
 004149C9    add         byte ptr [eax],dl
 004149CB    add         byte ptr [eax],dl
 004149CD    add         byte ptr [eax],dl
 004149CF    add         byte ptr [eax],dl
 004149D1    add         byte ptr [eax],dl
 004149D3    add         byte ptr [eax],dl
 004149D5    add         byte ptr [eax],dl
 004149D7    add         byte ptr [eax],dl
 004149D9    add         byte ptr [eax],dl
 004149DB    add         byte ptr [eax],dl
 004149DD    add         byte ptr [eax],dl
 004149DF    add         byte ptr [eax],dl
 004149E1    add         byte ptr [eax],dl
 004149E3    add         byte ptr [eax],dl
 004149E5    add         byte ptr [eax],dl
 004149E7    add         byte ptr [eax],dl
 004149E9    add         byte ptr [eax],dl
 004149EB    add         byte ptr [eax],dl
 004149ED    add         byte ptr [eax],dl
 004149EF    add         byte ptr [eax],dl
 004149F1    add         byte ptr [eax],dl
 004149F3    add         byte ptr [eax],dl
 004149F5    add         byte ptr [eax],dl
 004149F7    add         byte ptr [eax],dl
 004149F9    add         byte ptr [eax],dl
 004149FB    add         byte ptr [eax],dl
 004149FD    add         byte ptr [eax],dl
 004149FF    add         byte ptr [eax],dl
 00414A01    add         byte ptr [eax],dl
 00414A03    add         byte ptr [eax],dl
 00414A05    add         byte ptr [eax],dl
 00414A07    add         byte ptr [eax],dl
 00414A09    add         byte ptr [eax],dl
 00414A0B    add         byte ptr [eax],dl
 00414A0D    add         byte ptr [eax],dl
 00414A0F    add         byte ptr [eax],dl
 00414A11    add         byte ptr [eax],dl
 00414A13    add         byte ptr [eax],dl
 00414A15    add         byte ptr [eax],dl
 00414A17    add         byte ptr [eax],dl
 00414A19    add         byte ptr [eax],dl
 00414A1B    add         byte ptr [eax],dl
 00414A1D    add         byte ptr [eax],dl
 00414A1F    add         byte ptr [eax],dl
 00414A21    add         byte ptr [eax],dl
 00414A23    add         byte ptr [eax],dl
 00414A25    add         byte ptr [eax],dl
 00414A27    add         byte ptr [eax],dl
 00414A29    add         byte ptr [eax],dl
 00414A2B    add         byte ptr [eax],dl
 00414A2D    add         byte ptr [eax],dl
 00414A2F    add         byte ptr [eax],dl
 00414A31    add         byte ptr [eax],dl
 00414A33    add         byte ptr [eax],dl
 00414A35    add         byte ptr [eax],dl
 00414A37    add         byte ptr [eax],dl
 00414A39    add         byte ptr [eax],dl
 00414A3B    add         byte ptr [eax],dl
 00414A3D    add         byte ptr [eax],dl
 00414A3F    add         byte ptr [eax],dl
 00414A41    add         byte ptr [eax],dl
 00414A43    add         byte ptr [eax],dl
 00414A45    add         byte ptr [eax],dl
 00414A47    add         byte ptr [eax],dl
 00414A49    add         byte ptr [eax],dl
 00414A4B    add         byte ptr [eax],dl
 00414A4D    add         byte ptr [eax],dl
 00414A4F    add         byte ptr [eax],dl
 00414A51    add         byte ptr [eax],dl
 00414A53    add         byte ptr [eax],dl
 00414A55    add         byte ptr [eax],dl
 00414A57    add         byte ptr [eax],dl
 00414A59    add         byte ptr [eax],dl
 00414A5B    add         byte ptr [eax],dl
 00414A5D    add         byte ptr [eax],dl
 00414A5F    add         byte ptr [eax],dl
 00414A61    add         byte ptr [eax],dl
 00414A63    add         byte ptr [eax],dl
 00414A65    add         byte ptr [eax],dl
 00414A67    add         byte ptr [eax],dl
 00414A69    add         byte ptr [eax],dl
 00414A6B    add         byte ptr [eax],dl
 00414A6D    add         byte ptr [eax],dl
 00414A6F    add         byte ptr [eax],dl
 00414A71    add         byte ptr [eax],dl
 00414A73    add         byte ptr [eax],dl
 00414A75    add         byte ptr [eax],dl
 00414A77    add         byte ptr [eax],dl
 00414A79    add         byte ptr [eax],dl
 00414A7B    add         byte ptr [eax],dl
 00414A7D    add         byte ptr [eax],dl
 00414A7F    add         byte ptr [eax],dl
 00414A81    add         byte ptr [eax],dl
 00414A83    add         byte ptr [eax],dl
 00414A85    add         byte ptr [eax],dl
 00414A87    add         byte ptr [eax],dl
 00414A89    add         byte ptr [eax],dl
 00414A8B    add         byte ptr [eax],dl
 00414A8D    add         byte ptr [eax],dl
 00414A8F    add         byte ptr [eax],dl
 00414A91    add         byte ptr [eax],dl
 00414A93    add         byte ptr [eax],dl
 00414A95    add         byte ptr [eax],dl
 00414A97    add         byte ptr [eax],dl
 00414A99    add         byte ptr [eax],dl
 00414A9B    add         byte ptr [eax],dl
 00414A9D    add         byte ptr [eax],dl
 00414A9F    add         byte ptr [eax],dl
 00414AA1    add         byte ptr [eax],dl
 00414AA3    add         byte ptr [eax],dl
 00414AA5    add         byte ptr [eax],dl
 00414AA7    add         byte ptr [eax],dl
 00414AA9    add         byte ptr [eax],dl
 00414AAB    add         byte ptr [eax],dl
 00414AAD    add         byte ptr [eax],dl
 00414AAF    add         byte ptr [eax],dl
 00414AB1    add         byte ptr [eax],dl
 00414AB3    add         byte ptr [eax],dl
 00414AB5    add         byte ptr [eax],dl
 00414AB7    add         byte ptr [eax],dl
 00414AB9    add         byte ptr [eax],dl
 00414ABB    add         byte ptr [eax],dl
 00414ABD    add         byte ptr [eax],dl
 00414ABF    add         byte ptr [eax],dl
 00414AC1    add         byte ptr [eax],dl
 00414AC3    add         byte ptr [eax],dl
 00414AC5    add         byte ptr [eax],dl
 00414AC7    add         byte ptr [eax],dl
 00414AC9    add         byte ptr [eax],dl
 00414ACB    add         byte ptr [eax],dl
 00414ACD    add         byte ptr [eax],dl
 00414ACF    add         byte ptr [eax],dl
 00414AD1    add         byte ptr [eax],dl
 00414AD3    add         byte ptr [eax],dl
 00414AD5    add         byte ptr [eax],dl
 00414AD7    add         byte ptr [eax],dl
 00414AD9    add         byte ptr [eax],dl
 00414ADB    add         byte ptr [eax],dl
 00414ADD    add         byte ptr [eax],dl
 00414ADF    add         byte ptr [eax],dl
 00414AE1    add         byte ptr [eax],dl
 00414AE3    add         byte ptr [eax],dl
 00414AE5    add         byte ptr [eax],dl
 00414AE7    add         byte ptr [eax],dl
 00414AE9    add         byte ptr [eax],dl
 00414AEB    add         byte ptr [eax],dl
 00414AED    add         byte ptr [eax],dl
 00414AEF    add         byte ptr [eax],dl
 00414AF1    add         byte ptr [eax],dl
 00414AF3    add         byte ptr [eax],dl
 00414AF5    add         byte ptr [eax],dl
 00414AF7    add         byte ptr [eax],dl
 00414AF9    add         byte ptr [eax],dl
 00414AFB    add         byte ptr [eax],dl
 00414AFD    add         byte ptr [eax],dl
 00414AFF    add         byte ptr [eax],dl
 00414B01    add         byte ptr [eax],dl
 00414B03    add         byte ptr [eax],dl
 00414B05    add         byte ptr [eax],dl
 00414B07    add         byte ptr [eax],dl
 00414B09    add         byte ptr [eax],dl
 00414B0B    add         byte ptr [eax],dl
 00414B0D    add         byte ptr [eax],dl
 00414B0F    add         byte ptr [eax],dl
 00414B11    add         byte ptr [eax],dl
 00414B13    add         byte ptr [eax],dl
 00414B15    add         byte ptr [eax],dl
 00414B17    add         byte ptr [eax],dl
 00414B19    add         byte ptr [eax],dl
 00414B1B    add         byte ptr [eax],dl
 00414B1D    add         byte ptr [eax],dl
 00414B1F    add         byte ptr [eax],dl
 00414B21    add         byte ptr [eax],dl
 00414B23    add         byte ptr [eax],dl
 00414B25    add         byte ptr [eax],dl
 00414B27    add         byte ptr [eax],dl
 00414B29    add         byte ptr [eax],dl
 00414B2B    add         byte ptr [eax],dl
 00414B2D    add         byte ptr [eax],dl
 00414B2F    add         byte ptr [eax],dl
 00414B31    add         byte ptr [eax],dl
 00414B33    add         byte ptr [eax],dl
 00414B35    add         byte ptr [eax],dl
 00414B37    add         byte ptr [eax],dl
 00414B39    add         byte ptr [eax],dl
 00414B3B    add         byte ptr [eax],dl
 00414B3D    add         byte ptr [eax],dl
 00414B3F    add         byte ptr [eax],dl
 00414B41    add         byte ptr [eax],dl
 00414B43    add         byte ptr [eax],dl
 00414B45    add         byte ptr [eax],dl
 00414B47    add         byte ptr [eax],dl
 00414B49    add         byte ptr [eax],dl
 00414B4B    add         byte ptr [eax],dl
 00414B4D    add         byte ptr [eax],dl
 00414B4F    add         byte ptr [eax],dl
 00414B51    add         byte ptr [eax],dl
 00414B53    add         byte ptr [eax],dl
 00414B55    add         byte ptr [eax],dl
 00414B57    add         byte ptr [eax],dl
 00414B59    add         byte ptr [eax],dl
 00414B5B    add         byte ptr [eax],dl
 00414B5D    add         byte ptr [eax],dl
 00414B5F    add         byte ptr [eax],dl
 00414B61    add         byte ptr [eax],dl
 00414B63    add         byte ptr [eax],dl
 00414B65    add         byte ptr [eax],dl
 00414B67    add         byte ptr [eax],dl
 00414B69    add         byte ptr [eax],dl
 00414B6B    add         byte ptr [eax],dl
 00414B6D    add         byte ptr [eax],dl
 00414B6F    add         byte ptr [eax],dl
 00414B71    add         byte ptr [eax],dl
 00414B73    add         byte ptr [eax],dl
 00414B75    add         byte ptr [eax],dl
 00414B77    add         byte ptr [eax],dl
 00414B79    add         byte ptr [eax],dl
 00414B7B    add         byte ptr [eax],dl
 00414B7D    add         byte ptr [eax],dl
 00414B7F    add         byte ptr [eax],dl
 00414B81    add         byte ptr [eax],dl
 00414B83    add         byte ptr [eax],dl
 00414B85    add         byte ptr [eax],dl
 00414B87    add         byte ptr [eax],dl
 00414B89    add         byte ptr [eax],dl
 00414B8B    add         byte ptr [eax],dl
 00414B8D    add         byte ptr [eax],dl
 00414B8F    add         byte ptr [eax],dl
 00414B91    add         byte ptr [eax],dl
 00414B93    add         byte ptr [eax],dl
 00414B95    add         byte ptr [eax],dl
 00414B97    add         byte ptr [eax],dl
 00414B99    add         byte ptr [eax],dl
 00414B9B    add         byte ptr [eax],dl
 00414B9D    add         byte ptr [eax],dl
 00414B9F    add         byte ptr [eax],dl
 00414BA1    add         byte ptr [eax],dl
 00414BA3    add         byte ptr [eax],dl
 00414BA5    add         byte ptr [eax],dl
 00414BA7    add         byte ptr [eax],dl
 00414BA9    add         byte ptr [eax],dl
 00414BAB    add         byte ptr [eax],dl
 00414BAD    add         byte ptr [eax],dl
 00414BAF    add         byte ptr [eax],dl
 00414BB1    add         byte ptr [eax],dl
 00414BB3    add         byte ptr [eax],dl
 00414BB5    add         byte ptr [eax],dl
 00414BB7    add         byte ptr [eax],dl
 00414BB9    add         byte ptr [eax],dl
 00414BBB    add         byte ptr [eax],dl
 00414BBD    add         byte ptr [eax],dl
 00414BBF    add         byte ptr [eax],dl
 00414BC1    add         byte ptr [eax],dl
 00414BC3    add         byte ptr [eax],dl
 00414BC5    add         byte ptr [eax],dl
 00414BC7    add         byte ptr [eax],dl
 00414BC9    add         byte ptr [eax],dl
 00414BCB    add         byte ptr [eax],dl
 00414BCD    add         byte ptr [eax],dl
 00414BCF    add         byte ptr [eax],dl
 00414BD1    add         byte ptr [eax],dl
 00414BD3    add         byte ptr [eax],dl
 00414BD5    add         byte ptr [eax],dl
 00414BD7    add         byte ptr [eax],dl
 00414BD9    add         byte ptr [eax],dl
 00414BDB    add         byte ptr [eax],dl
 00414BDD    add         byte ptr [eax],dl
 00414BDF    add         byte ptr [eax],dl
 00414BE1    add         byte ptr [eax],dl
 00414BE3    add         byte ptr [eax],dl
 00414BE5    add         byte ptr [eax],dl
 00414BE7    add         byte ptr [eax],dl
 00414BE9    add         byte ptr [eax],dl
 00414BEB    add         byte ptr [eax],dl
 00414BED    add         byte ptr [eax],dl
 00414BEF    add         byte ptr [eax],dl
 00414BF1    add         byte ptr [eax],dl
 00414BF3    add         byte ptr [eax],dl
 00414BF5    add         byte ptr [eax],dl
 00414BF7    add         byte ptr [eax],dl
 00414BF9    add         byte ptr [eax],dl
 00414BFB    add         byte ptr [eax],dl
 00414BFD    add         byte ptr [eax],dl
 00414BFF    add         byte ptr [eax],dl
 00414C01    add         byte ptr [eax],dl
 00414C03    add         byte ptr [eax],dl
 00414C05    add         byte ptr [eax],dl
 00414C07    add         byte ptr [eax],dl
 00414C09    add         byte ptr [eax],dl
 00414C0B    add         byte ptr [eax],dl
 00414C0D    add         byte ptr [eax],dl
 00414C0F    add         byte ptr [eax],dl
 00414C11    add         byte ptr [eax],dl
 00414C13    add         byte ptr [eax],dl
 00414C15    add         byte ptr [eax],dl
 00414C17    add         byte ptr [eax],dl
 00414C19    add         byte ptr [eax],dl
 00414C1B    add         byte ptr [eax],dl
 00414C1D    add         byte ptr [eax],dl
 00414C1F    add         byte ptr [eax],dl
 00414C21    add         byte ptr [eax],dl
 00414C23    add         byte ptr [eax],dl
 00414C25    add         byte ptr [eax],dl
 00414C27    add         byte ptr [eax],dl
 00414C29    add         byte ptr [eax],dl
 00414C2B    add         byte ptr [eax],dl
 00414C2D    add         byte ptr [eax],dl
 00414C2F    add         byte ptr [eax],dl
 00414C31    add         byte ptr [eax],dl
 00414C33    add         byte ptr [eax],dl
 00414C35    add         byte ptr [eax],dl
 00414C37    add         byte ptr [eax],dl
 00414C39    add         byte ptr [eax],dl
 00414C3B    add         byte ptr [eax],dl
 00414C3D    add         byte ptr [eax],dl
 00414C3F    add         byte ptr [eax],dl
 00414C41    add         byte ptr [eax],dl
 00414C43    add         byte ptr [eax],dl
 00414C45    add         byte ptr [eax],dl
 00414C47    add         byte ptr [eax],dl
 00414C49    add         byte ptr [eax],dl
 00414C4B    add         byte ptr [eax],dl
 00414C4D    add         byte ptr [eax],dl
 00414C4F    add         byte ptr [eax],dl
 00414C51    add         byte ptr [eax],dl
 00414C53    add         byte ptr [eax],dl
 00414C55    add         byte ptr [eax],dl
 00414C57    add         byte ptr [eax],dl
 00414C59    add         byte ptr [eax],dl
 00414C5B    add         byte ptr [eax],dl
 00414C5D    add         byte ptr [eax],dl
 00414C5F    add         byte ptr [eax],dl
 00414C61    add         byte ptr [eax],dl
 00414C63    add         byte ptr [eax],dl
 00414C65    add         byte ptr [eax],dl
 00414C67    add         byte ptr [eax],dl
 00414C69    add         byte ptr [eax],dl
 00414C6B    add         byte ptr [eax],dl
 00414C6D    add         byte ptr [eax],dl
 00414C6F    add         byte ptr [eax],dl
 00414C71    add         byte ptr [eax],dl
 00414C73    add         byte ptr [eax],dl
 00414C75    add         byte ptr [eax],dl
 00414C77    add         byte ptr [eax],dl
 00414C79    add         byte ptr [eax],dl
 00414C7B    add         byte ptr [eax],dl
 00414C7D    add         byte ptr [eax],dl
 00414C7F    add         byte ptr [eax],dl
 00414C81    add         byte ptr [eax],dl
 00414C83    add         byte ptr [eax],dl
 00414C85    add         byte ptr [eax],dl
 00414C87    add         byte ptr [eax],dl
 00414C89    add         byte ptr [eax],dl
 00414C8B    add         byte ptr [eax],dl
 00414C8D    add         byte ptr [eax],dl
 00414C8F    add         byte ptr [eax],dl
 00414C91    add         byte ptr [eax],dl
 00414C93    add         byte ptr [eax],dl
 00414C95    add         byte ptr [eax],dl
 00414C97    add         byte ptr [eax],dl
 00414C99    add         byte ptr [eax],dl
 00414C9B    add         byte ptr [eax],dl
 00414C9D    add         byte ptr [eax],dl
 00414C9F    add         byte ptr [eax],dl
 00414CA1    add         byte ptr [eax],dl
 00414CA3    add         byte ptr [eax],dl
 00414CA5    add         byte ptr [eax],dl
 00414CA7    add         byte ptr [eax],dl
 00414CA9    add         byte ptr [eax],dl
 00414CAB    add         byte ptr [eax],dl
 00414CAD    add         byte ptr [eax],dl
 00414CAF    add         byte ptr [eax],dl
 00414CB1    add         byte ptr [eax],dl
 00414CB3    add         byte ptr [eax],dl
 00414CB5    add         byte ptr [eax],dl
 00414CB7    add         byte ptr [eax],dl
 00414CB9    add         byte ptr [eax],dl
 00414CBB    add         byte ptr [eax],dl
 00414CBD    add         byte ptr [eax],dl
 00414CBF    add         byte ptr [eax],dl
 00414CC1    add         byte ptr [eax],dl
 00414CC3    add         byte ptr [eax],dl
 00414CC5    add         byte ptr [eax],dl
 00414CC7    add         byte ptr [eax],dl
 00414CC9    add         byte ptr [eax],dl
 00414CCB    add         byte ptr [eax],dl
 00414CCD    add         byte ptr [eax],dl
 00414CCF    add         byte ptr [eax],dl
 00414CD1    add         byte ptr [eax],dl
 00414CD3    add         byte ptr [eax],dl
 00414CD5    add         byte ptr [eax],dl
 00414CD7    add         byte ptr [eax],dl
 00414CD9    add         byte ptr [eax],dl
 00414CDB    add         byte ptr [eax],dl
 00414CDD    add         byte ptr [eax],dl
 00414CDF    add         byte ptr [eax],dl
 00414CE1    add         byte ptr [eax],dl
 00414CE3    add         byte ptr [eax],dl
 00414CE5    add         byte ptr [eax],dl
 00414CE7    add         byte ptr [eax],dl
 00414CE9    add         byte ptr [eax],dl
 00414CEB    add         byte ptr [eax],dl
 00414CED    add         byte ptr [eax],dl
 00414CEF    add         byte ptr [eax],dl
 00414CF1    add         byte ptr [eax],dl
 00414CF3    add         byte ptr [eax],dl
 00414CF5    add         byte ptr [eax],dl
 00414CF7    add         byte ptr [eax],dl
 00414CF9    add         byte ptr [eax],dl
 00414CFB    add         byte ptr [eax],dl
 00414CFD    add         byte ptr [eax],dl
 00414CFF    add         byte ptr [eax],dl
 00414D01    add         byte ptr [eax],dl
 00414D03    add         byte ptr [eax],dl
 00414D05    add         byte ptr [eax],dl
 00414D07    add         byte ptr [eax],dl
 00414D09    add         byte ptr [eax],dl
 00414D0B    add         byte ptr [eax],dl
 00414D0D    add         byte ptr [eax],dl
 00414D0F    add         byte ptr [eax],dl
 00414D11    add         byte ptr [eax],dl
 00414D13    add         byte ptr [eax],dl
 00414D15    add         byte ptr [eax],dl
 00414D17    add         byte ptr [eax],dl
 00414D19    add         byte ptr [eax],dl
 00414D1B    add         byte ptr [eax],dl
 00414D1D    add         byte ptr [eax],dl
 00414D1F    add         byte ptr [eax],dl
 00414D21    add         byte ptr [eax],dl
 00414D23    add         byte ptr [eax],dl
 00414D25    add         byte ptr [eax],dl
 00414D27    add         byte ptr [eax],dl
 00414D29    add         byte ptr [eax],dl
 00414D2B    add         byte ptr [eax],dl
 00414D2D    add         byte ptr [eax],dl
 00414D2F    add         byte ptr [eax],dl
 00414D31    add         byte ptr [eax],dl
 00414D33    add         byte ptr [eax],dl
 00414D35    add         byte ptr [eax],dl
 00414D37    add         byte ptr [eax],dl
 00414D39    add         byte ptr [eax],dl
 00414D3B    add         byte ptr [eax],dl
 00414D3D    add         byte ptr [eax],dl
 00414D3F    add         byte ptr [eax],dl
 00414D41    add         byte ptr [eax],dl
 00414D43    add         byte ptr [eax],dl
 00414D45    add         byte ptr [eax],dl
 00414D47    add         byte ptr [eax],dl
 00414D49    add         byte ptr [eax],dl
 00414D4B    add         byte ptr [eax],dl
 00414D4D    add         byte ptr [eax],dl
 00414D4F    add         byte ptr [eax],dl
 00414D51    add         byte ptr [eax],dl
 00414D53    add         byte ptr [eax],dl
 00414D55    add         byte ptr [eax],dl
 00414D57    add         byte ptr [eax],dl
 00414D59    add         byte ptr [eax],dl
 00414D5B    add         byte ptr [eax],dl
 00414D5D    add         byte ptr [eax],dl
 00414D5F    add         byte ptr [eax],dl
 00414D61    add         byte ptr [eax],dl
 00414D63    add         byte ptr [eax],dl
 00414D65    add         byte ptr [eax],dl
 00414D67    add         byte ptr [eax],dl
 00414D69    add         byte ptr [eax],dl
 00414D6B    add         byte ptr [eax],dl
 00414D6D    add         byte ptr [eax],dl
 00414D6F    add         byte ptr [eax],dl
 00414D71    add         byte ptr [eax],dl
 00414D73    add         byte ptr [eax],dl
 00414D75    add         byte ptr [eax],dl
 00414D77    add         byte ptr [eax],dl
 00414D79    add         byte ptr [eax],dl
 00414D7B    add         byte ptr [eax],dl
 00414D7D    add         byte ptr [eax],dl
 00414D7F    add         byte ptr [eax],dl
 00414D81    add         byte ptr [eax],dl
 00414D83    add         byte ptr [eax],dl
 00414D85    add         byte ptr [eax],dl
 00414D87    add         byte ptr [eax],dl
 00414D89    add         byte ptr [eax],dl
 00414D8B    add         byte ptr [eax],dl
 00414D8D    add         byte ptr [eax],dl
 00414D8F    add         byte ptr [eax],dl
 00414D91    add         byte ptr [eax],dl
 00414D93    add         byte ptr [eax],dl
 00414D95    add         byte ptr [eax],dl
 00414D97    add         byte ptr [eax],dl
 00414D99    add         byte ptr [eax],dl
 00414D9B    add         byte ptr [eax],dl
 00414D9D    add         byte ptr [eax],dl
 00414D9F    add         byte ptr [eax],dl
 00414DA1    add         byte ptr [eax],dl
 00414DA3    add         byte ptr [eax],dl
 00414DA5    add         byte ptr [eax],dl
 00414DA7    add         byte ptr [eax],dl
 00414DA9    add         byte ptr [eax],dl
 00414DAB    add         byte ptr [eax],dl
 00414DAD    add         byte ptr [eax],dl
 00414DAF    add         byte ptr [eax],dl
 00414DB1    add         byte ptr [eax],dl
 00414DB3    add         byte ptr [eax],dl
 00414DB5    add         byte ptr [eax],dl
 00414DB7    add         byte ptr [eax],dl
 00414DB9    add         byte ptr [eax],dl
 00414DBB    add         byte ptr [eax],dl
 00414DBD    add         byte ptr [eax],dl
 00414DBF    add         byte ptr [eax],dl
 00414DC1    add         byte ptr [eax],dl
 00414DC3    add         byte ptr [eax],dl
 00414DC5    add         byte ptr [eax],dl
 00414DC7    add         byte ptr [eax],dl
 00414DC9    add         byte ptr [eax],dl
 00414DCB    add         byte ptr [eax],dl
 00414DCD    add         byte ptr [eax],dl
 00414DCF    add         byte ptr [eax],dl
 00414DD1    add         byte ptr [eax],dl
 00414DD3    add         byte ptr [eax],dl
 00414DD5    add         byte ptr [eax],dl
 00414DD7    add         byte ptr [eax],dl
 00414DD9    add         byte ptr [eax],dl
 00414DDB    add         byte ptr [eax],dl
 00414DDD    add         byte ptr [eax],dl
 00414DDF    add         byte ptr [eax],dl
 00414DE1    add         byte ptr [eax],dl
 00414DE3    add         byte ptr [eax],dl
 00414DE5    add         byte ptr [eax],dl
 00414DE7    add         byte ptr [eax],dl
 00414DE9    add         byte ptr [eax],dl
 00414DEB    add         byte ptr [eax],dl
 00414DED    add         byte ptr [eax],dl
 00414DEF    add         byte ptr [eax],dl
 00414DF1    add         byte ptr [eax],dl
 00414DF3    add         byte ptr [eax],dl
 00414DF5    add         byte ptr [eax],dl
 00414DF7    add         byte ptr [eax],dl
 00414DF9    add         byte ptr [eax],dl
 00414DFB    add         byte ptr [eax],dl
 00414DFD    add         byte ptr [eax],dl
 00414DFF    add         byte ptr [eax],dl
 00414E01    add         byte ptr [eax],dl
 00414E03    add         byte ptr [eax],dl
 00414E05    add         byte ptr [eax],dl
 00414E07    add         byte ptr [eax],dl
 00414E09    add         byte ptr [eax],dl
 00414E0B    add         byte ptr [eax],dl
 00414E0D    add         byte ptr [eax],dl
 00414E0F    add         byte ptr [eax],dl
 00414E11    add         byte ptr [eax],dl
 00414E13    add         byte ptr [eax],dl
 00414E15    add         byte ptr [eax],dl
 00414E17    add         byte ptr [eax],dl
 00414E19    add         byte ptr [eax],dl
 00414E1B    add         byte ptr [eax],dl
 00414E1D    add         byte ptr [eax],dl
 00414E1F    add         byte ptr [eax],dl
 00414E21    add         byte ptr [eax],dl
 00414E23    add         byte ptr [eax],dl
 00414E25    add         byte ptr [eax],dl
 00414E27    add         byte ptr [eax],dl
 00414E29    add         byte ptr [eax],dl
 00414E2B    add         byte ptr [eax],dl
 00414E2D    add         byte ptr [eax],dl
 00414E2F    add         byte ptr [eax],dl
 00414E31    add         byte ptr [eax],dl
 00414E33    add         byte ptr [eax],dl
 00414E35    add         byte ptr [eax],dl
 00414E37    add         byte ptr [eax],dl
 00414E39    add         byte ptr [eax],dl
 00414E3B    add         byte ptr [eax],dl
 00414E3D    add         byte ptr [eax],dl
 00414E3F    add         byte ptr [eax],dl
 00414E41    add         byte ptr [eax],dl
 00414E43    add         byte ptr [eax],dl
 00414E45    add         byte ptr [eax],dl
 00414E47    add         byte ptr [eax],dl
 00414E49    add         byte ptr [eax],dl
 00414E4B    add         byte ptr [eax],dl
 00414E4D    add         byte ptr [eax],dl
 00414E4F    add         byte ptr [eax],dl
 00414E51    add         byte ptr [eax],dl
 00414E53    add         byte ptr [eax],dl
 00414E55    add         byte ptr [eax],dl
 00414E57    add         byte ptr [eax],dl
 00414E59    add         byte ptr [eax],dl
 00414E5B    add         byte ptr [eax],dl
 00414E5D    add         byte ptr [eax],dl
 00414E5F    add         byte ptr [eax],dl
 00414E61    add         byte ptr [eax],dl
 00414E63    add         byte ptr [eax],dl
 00414E65    add         byte ptr [eax],dl
 00414E67    add         byte ptr [eax],dl
 00414E69    add         byte ptr [eax],dl
 00414E6B    add         byte ptr [eax],dl
 00414E6D    add         byte ptr [eax],dl
 00414E6F    add         byte ptr [eax],dl
 00414E71    add         byte ptr [eax],dl
 00414E73    add         byte ptr [eax],dl
 00414E75    add         byte ptr [eax],dl
 00414E77    add         byte ptr [eax],dl
 00414E79    add         byte ptr [eax],dl
 00414E7B    add         byte ptr [eax],dl
 00414E7D    add         byte ptr [eax],dl
 00414E7F    add         byte ptr [eax],dl
 00414E81    add         byte ptr [eax],dl
 00414E83    add         byte ptr [eax],dl
 00414E85    add         byte ptr [eax],dl
 00414E87    add         byte ptr [eax],dl
 00414E89    add         byte ptr [eax],dl
 00414E8B    add         byte ptr [eax],dl
 00414E8D    add         byte ptr [eax],dl
 00414E8F    add         byte ptr [eax],dl
 00414E91    add         byte ptr [eax],dl
 00414E93    add         byte ptr [eax],dl
 00414E95    add         byte ptr [eax],dl
 00414E97    add         byte ptr [eax],dl
 00414E99    add         byte ptr [eax],dl
 00414E9B    add         byte ptr [eax],dl
 00414E9D    add         byte ptr [eax],dl
 00414E9F    add         byte ptr [eax],dl
 00414EA1    add         byte ptr [eax],dl
 00414EA3    add         byte ptr [eax],dl
 00414EA5    add         byte ptr [eax],dl
 00414EA7    add         byte ptr [eax],dl
 00414EA9    add         byte ptr [eax],dl
 00414EAB    add         byte ptr [eax],dl
 00414EAD    add         byte ptr [eax],dl
 00414EAF    add         byte ptr [eax],dl
 00414EB1    add         byte ptr [eax],dl
 00414EB3    add         byte ptr [eax],dl
 00414EB5    add         byte ptr [eax],dl
 00414EB7    add         byte ptr [eax],dl
 00414EB9    add         byte ptr [eax],dl
 00414EBB    add         byte ptr [eax],dl
 00414EBD    add         byte ptr [eax],dl
 00414EBF    add         byte ptr [eax],dl
 00414EC1    add         byte ptr [eax],dl
 00414EC3    add         byte ptr [eax],dl
 00414EC5    add         byte ptr [eax],dl
 00414EC7    add         byte ptr [eax],dl
 00414EC9    add         byte ptr [eax],dl
 00414ECB    add         byte ptr [eax],dl
 00414ECD    add         byte ptr [eax],dl
 00414ECF    add         byte ptr [eax],dl
 00414ED1    add         byte ptr [eax],dl
 00414ED3    add         byte ptr [eax],dl
 00414ED5    add         byte ptr [eax],dl
 00414ED7    add         byte ptr [eax],dl
 00414ED9    add         byte ptr [eax],dl
 00414EDB    add         byte ptr [eax],dl
 00414EDD    add         byte ptr [eax],dl
 00414EDF    add         byte ptr [eax],dl
 00414EE1    add         byte ptr [eax],dl
 00414EE3    add         byte ptr [eax],dl
 00414EE5    add         byte ptr [eax],dl
 00414EE7    add         byte ptr [eax],dl
 00414EE9    add         byte ptr [eax],dl
 00414EEB    add         byte ptr [eax],dl
 00414EED    add         byte ptr [eax],dl
 00414EEF    add         byte ptr [eax],dl
 00414EF1    add         byte ptr [eax],dl
 00414EF3    add         byte ptr [eax],dl
 00414EF5    add         byte ptr [eax],dl
 00414EF7    add         byte ptr [eax],dl
 00414EF9    add         byte ptr [eax],dl
 00414EFB    add         byte ptr [eax],dl
 00414EFD    add         byte ptr [eax],dl
 00414EFF    add         byte ptr [eax],dl
 00414F01    add         byte ptr [eax],dl
 00414F03    add         byte ptr [eax],dl
 00414F05    add         byte ptr [eax],dl
 00414F07    add         byte ptr [eax],dl
 00414F09    add         byte ptr [eax],dl
 00414F0B    add         byte ptr [eax],dl
 00414F0D    add         byte ptr [eax],dl
 00414F0F    add         byte ptr [eax],dl
 00414F11    add         byte ptr [eax],dl
 00414F13    add         byte ptr [eax],dl
 00414F15    add         byte ptr [eax],dl
 00414F17    add         byte ptr [eax],dl
 00414F19    add         byte ptr [eax],dl
 00414F1B    add         byte ptr [eax],dl
 00414F1D    add         byte ptr [eax],dl
 00414F1F    add         byte ptr [eax],dl
 00414F21    add         byte ptr [eax],dl
 00414F23    add         byte ptr [eax],dl
 00414F25    add         byte ptr [eax],dl
 00414F27    add         byte ptr [eax],dl
 00414F29    add         byte ptr [eax],dl
 00414F2B    add         byte ptr [eax],dl
 00414F2D    add         byte ptr [eax],dl
 00414F2F    add         byte ptr [eax],dl
 00414F31    add         byte ptr [eax],dl
 00414F33    add         byte ptr [eax],dl
 00414F35    add         byte ptr [eax],dl
 00414F37    add         byte ptr [eax],dl
 00414F39    add         byte ptr [eax],dl
 00414F3B    add         byte ptr [eax],dl
 00414F3D    add         byte ptr [eax],dl
 00414F3F    add         byte ptr [eax],dl
 00414F41    add         byte ptr [eax],dl
 00414F43    add         byte ptr [eax],dl
 00414F45    add         byte ptr [eax],dl
 00414F47    add         byte ptr [eax],dl
 00414F49    add         byte ptr [eax],dl
 00414F4B    add         byte ptr [eax],dl
 00414F4D    add         byte ptr [eax],dl
 00414F4F    add         byte ptr [eax],dl
 00414F51    add         byte ptr [eax],dl
 00414F53    add         byte ptr [eax],dl
 00414F55    add         byte ptr [eax],dl
 00414F57    add         byte ptr [eax],dl
 00414F59    add         byte ptr [eax],dl
 00414F5B    add         byte ptr [eax],dl
 00414F5D    add         byte ptr [eax],dl
 00414F5F    add         byte ptr [eax],dl
 00414F61    add         byte ptr [eax],dl
 00414F63    add         byte ptr [eax],dl
 00414F65    add         byte ptr [eax],dl
 00414F67    add         byte ptr [eax],dl
 00414F69    add         byte ptr [eax],dl
 00414F6B    add         byte ptr [eax],dl
 00414F6D    add         byte ptr [eax],dl
 00414F6F    add         byte ptr [eax],dl
 00414F71    add         byte ptr [eax],dl
 00414F73    add         byte ptr [eax],dl
 00414F75    add         byte ptr [eax],dl
 00414F77    add         byte ptr [eax],dl
 00414F79    add         byte ptr [eax],dl
 00414F7B    add         byte ptr [eax],dl
 00414F7D    add         byte ptr [eax],dl
 00414F7F    add         byte ptr [eax],dl
 00414F81    add         byte ptr [eax],dl
 00414F83    add         byte ptr [eax],dl
 00414F85    add         byte ptr [eax],dl
 00414F87    add         byte ptr [eax],dl
 00414F89    add         byte ptr [eax],dl
 00414F8B    add         byte ptr [eax],dl
 00414F8D    add         byte ptr [eax],dl
 00414F8F    add         byte ptr [eax],dl
 00414F91    add         byte ptr [eax],dl
 00414F93    add         byte ptr [eax],dl
 00414F95    add         byte ptr [eax],dl
 00414F97    add         byte ptr [eax],dl
 00414F99    add         byte ptr [eax],dl
 00414F9B    add         byte ptr [eax],dl
 00414F9D    add         byte ptr [eax],dl
 00414F9F    add         byte ptr [eax],dl
 00414FA1    add         byte ptr [eax],dl
 00414FA3    add         byte ptr [eax],dl
 00414FA5    add         byte ptr [eax],dl
 00414FA7    add         byte ptr [eax],dl
 00414FA9    add         byte ptr [eax],dl
 00414FAB    add         byte ptr [eax],dl
 00414FAD    add         byte ptr [eax],dl
 00414FAF    add         byte ptr [eax],dl
 00414FB1    add         byte ptr [eax],dl
 00414FB3    add         byte ptr [eax],dl
 00414FB5    add         byte ptr [eax],dl
 00414FB7    add         byte ptr [eax],dl
 00414FB9    add         byte ptr [eax],dl
 00414FBB    add         byte ptr [eax],dl
 00414FBD    add         byte ptr [eax],dl
 00414FBF    add         byte ptr [eax],dl
 00414FC1    add         byte ptr [eax],dl
 00414FC3    add         byte ptr [eax],dl
 00414FC5    add         byte ptr [eax],dl
 00414FC7    add         byte ptr [eax],dl
 00414FC9    add         byte ptr [eax],dl
 00414FCB    add         byte ptr [eax],dl
 00414FCD    add         byte ptr [eax],dl
 00414FCF    add         byte ptr [eax],dl
 00414FD1    add         byte ptr [eax],dl
 00414FD3    add         byte ptr [eax],dl
 00414FD5    add         byte ptr [eax],dl
 00414FD7    add         byte ptr [eax],dl
 00414FD9    add         byte ptr [eax],dl
 00414FDB    add         byte ptr [eax],dl
 00414FDD    add         byte ptr [eax],dl
 00414FDF    add         byte ptr [eax],dl
 00414FE1    add         byte ptr [eax],dl
 00414FE3    add         byte ptr [eax],dl
 00414FE5    add         byte ptr [eax],dl
 00414FE7    add         byte ptr [eax],dl
 00414FE9    add         byte ptr [eax],dl
 00414FEB    add         byte ptr [eax],dl
 00414FED    add         byte ptr [eax],dl
 00414FEF    add         byte ptr [eax],dl
 00414FF1    add         byte ptr [eax],dl
 00414FF3    add         byte ptr [eax],dl
 00414FF5    add         byte ptr [eax],dl
 00414FF7    add         byte ptr [eax],dl
 00414FF9    add         byte ptr [eax],dl
 00414FFB    add         byte ptr [eax],dl
 00414FFD    add         byte ptr [eax],dl
 00414FFF    add         byte ptr [eax],dl
 00415001    add         byte ptr [eax],dl
 00415003    add         byte ptr [eax],dl
 00415005    add         byte ptr [eax],dl
 00415007    add         byte ptr [eax],dl
 00415009    add         byte ptr [eax],dl
 0041500B    add         byte ptr [eax],dl
 0041500D    add         byte ptr [eax],dl
 0041500F    add         byte ptr [eax],dl
 00415011    add         byte ptr [eax],dl
 00415013    add         byte ptr [eax],dl
 00415015    add         byte ptr [eax],dl
 00415017    add         byte ptr [eax],dl
 00415019    add         byte ptr [eax],dl
 0041501B    add         byte ptr [eax],dl
 0041501D    add         byte ptr [eax],dl
 0041501F    add         byte ptr [eax],dl
 00415021    add         byte ptr [eax],dl
 00415023    add         byte ptr [eax],dl
 00415025    add         byte ptr [eax],dl
 00415027    add         byte ptr [eax],dl
 00415029    add         byte ptr [eax],dl
 0041502B    add         byte ptr [eax],dl
 0041502D    add         byte ptr [eax],dl
 0041502F    add         byte ptr [eax],dl
 00415031    add         byte ptr [eax],dl
 00415033    add         byte ptr [eax],dl
 00415035    add         byte ptr [eax],dl
 00415037    add         byte ptr [eax],dl
 00415039    add         byte ptr [eax],dl
 0041503B    add         byte ptr [eax],dl
 0041503D    add         byte ptr [eax],dl
 0041503F    add         byte ptr [eax],dl
 00415041    add         byte ptr [eax],dl
 00415043    add         byte ptr [eax],dl
 00415045    add         byte ptr [eax],dl
 00415047    add         byte ptr [eax],dl
 00415049    add         byte ptr [eax],dl
 0041504B    add         byte ptr [eax],dl
 0041504D    add         byte ptr [eax],dl
 0041504F    add         byte ptr [eax],dl
 00415051    add         byte ptr [eax],dl
 00415053    add         byte ptr [eax],dl
 00415055    add         byte ptr [eax],dl
 00415057    add         byte ptr [eax],dl
 00415059    add         byte ptr [eax],dl
 0041505B    add         byte ptr [eax],dl
 0041505D    add         byte ptr [eax],dl
 0041505F    add         byte ptr [eax],dl
 00415061    add         byte ptr [eax],dl
 00415063    add         byte ptr [eax],dl
 00415065    add         byte ptr [eax],dl
 00415067    add         byte ptr [eax],dl
 00415069    add         byte ptr [eax],dl
 0041506B    add         byte ptr [eax],dl
 0041506D    add         byte ptr [eax],dl
 0041506F    add         byte ptr [eax],dl
 00415071    add         byte ptr [eax],dl
 00415073    add         byte ptr [eax],dl
 00415075    add         byte ptr [eax],dl
 00415077    add         byte ptr [eax],dl
 00415079    add         byte ptr [eax],dl
 0041507B    add         byte ptr [eax],dl
 0041507D    add         byte ptr [eax],dl
 0041507F    add         byte ptr [eax],dl
 00415081    add         byte ptr [eax],dl
 00415083    add         byte ptr [eax],dl
 00415085    add         byte ptr [eax],dl
 00415087    add         byte ptr [eax],dl
 00415089    add         byte ptr [eax],dl
 0041508B    add         byte ptr [eax],dl
 0041508D    add         byte ptr [eax],dl
 0041508F    add         byte ptr [eax],dl
 00415091    add         byte ptr [eax],dl
 00415093    add         byte ptr [eax],dl
 00415095    add         byte ptr [eax],dl
 00415097    add         byte ptr [eax],dl
 00415099    add         byte ptr [eax],dl
 0041509B    add         byte ptr [eax],dl
 0041509D    add         byte ptr [eax],dl
 0041509F    add         byte ptr [eax],dl
 004150A1    add         byte ptr [eax],dl
 004150A3    add         byte ptr [eax],dl
 004150A5    add         byte ptr [eax],dl
 004150A7    add         byte ptr [eax],dl
 004150A9    add         byte ptr [eax],dl
 004150AB    add         byte ptr [eax],dl
 004150AD    add         byte ptr [eax],dl
 004150AF    add         byte ptr [eax],dl
 004150B1    add         byte ptr [eax],dl
 004150B3    add         byte ptr [eax],dl
 004150B5    add         byte ptr [eax],dl
 004150B7    add         byte ptr [eax],dl
 004150B9    add         byte ptr [eax],dl
 004150BB    add         byte ptr [eax],dl
 004150BD    add         byte ptr [eax],dl
 004150BF    add         byte ptr [eax],dl
 004150C1    add         byte ptr [eax],dl
 004150C3    add         byte ptr [eax],dl
 004150C5    add         byte ptr [eax],dl
 004150C7    add         byte ptr [eax],dl
 004150C9    add         byte ptr [eax],dl
 004150CB    add         byte ptr [eax],dl
 004150CD    add         byte ptr [eax],dl
 004150CF    add         byte ptr [eax],dl
 004150D1    add         byte ptr [eax],dl
 004150D3    add         byte ptr [eax],dl
 004150D5    add         byte ptr [eax],dl
 004150D7    add         byte ptr [eax],dl
 004150D9    add         byte ptr [eax],dl
 004150DB    add         byte ptr [eax],dl
 004150DD    add         byte ptr [eax],dl
 004150DF    add         byte ptr [eax],dl
 004150E1    add         byte ptr [eax],dl
 004150E3    add         byte ptr [eax],dl
 004150E5    add         byte ptr [eax],dl
 004150E7    add         byte ptr [eax],dl
 004150E9    add         byte ptr [eax],dl
 004150EB    add         byte ptr [eax],dl
 004150ED    add         byte ptr [eax],dl
 004150EF    add         byte ptr [eax],dl
 004150F1    add         byte ptr [eax],dl
 004150F3    add         byte ptr [eax],dl
 004150F5    add         byte ptr [eax],dl
 004150F7    add         byte ptr [eax],dl
 004150F9    add         byte ptr [eax],dl
 004150FB    add         byte ptr [eax],dl
 004150FD    add         byte ptr [eax],dl
 004150FF    add         byte ptr [eax],dl
 00415101    add         byte ptr [eax],dl
 00415103    add         byte ptr [eax],dl
 00415105    add         byte ptr [eax],dl
 00415107    add         byte ptr [eax],dl
 00415109    add         byte ptr [eax],dl
 0041510B    add         byte ptr [eax],dl
 0041510D    add         byte ptr [eax],dl
 0041510F    add         byte ptr [eax],dl
 00415111    add         byte ptr [eax],dl
 00415113    add         byte ptr [eax],dl
 00415115    add         byte ptr [eax],dl
 00415117    add         byte ptr [eax],dl
 00415119    add         byte ptr [eax],dl
 0041511B    add         byte ptr [eax],dl
 0041511D    add         byte ptr [eax],dl
 0041511F    add         byte ptr [eax],dl
 00415121    add         byte ptr [eax],dl
 00415123    add         byte ptr [eax],dl
 00415125    add         byte ptr [eax],dl
 00415127    add         byte ptr [eax],dl
 00415129    add         byte ptr [eax],dl
 0041512B    add         byte ptr [eax],dl
 0041512D    add         byte ptr [eax],dl
 0041512F    add         byte ptr [eax],dl
 00415131    add         byte ptr [eax],dl
 00415133    add         byte ptr [eax],dl
 00415135    add         byte ptr [eax],dl
 00415137    add         byte ptr [eax],dl
 00415139    add         byte ptr [eax],dl
 0041513B    add         byte ptr [eax],dl
 0041513D    add         byte ptr [eax],dl
 0041513F    add         byte ptr [eax],dl
 00415141    add         byte ptr [eax],dl
 00415143    add         byte ptr [eax],dl
 00415145    add         byte ptr [eax],dl
 00415147    add         byte ptr [eax],dl
 00415149    add         byte ptr [eax],dl
 0041514B    add         byte ptr [eax],dl
 0041514D    add         byte ptr [eax],dl
 0041514F    add         byte ptr [eax],dl
 00415151    add         byte ptr [eax],dl
 00415153    add         byte ptr [eax],dl
 00415155    add         byte ptr [eax],dl
 00415157    add         byte ptr [eax],dl
 00415159    add         byte ptr [eax],dl
 0041515B    add         byte ptr [eax],dl
 0041515D    add         byte ptr [eax],dl
 0041515F    add         byte ptr [eax],dl
 00415161    add         byte ptr [eax],dl
 00415163    add         byte ptr [eax],dl
 00415165    add         byte ptr [eax],dl
 00415167    add         byte ptr [eax],dl
 00415169    add         byte ptr [eax],dl
 0041516B    add         byte ptr [eax],dl
 0041516D    add         byte ptr [eax],dl
 0041516F    add         byte ptr [eax],dl
 00415171    add         byte ptr [eax],dl
 00415173    add         byte ptr [eax],dl
 00415175    add         byte ptr [eax],dl
 00415177    add         byte ptr [eax],dl
 00415179    add         byte ptr [eax],dl
 0041517B    add         byte ptr [eax],dl
 0041517D    add         byte ptr [eax],dl
 0041517F    add         byte ptr [eax],dl
 00415181    add         byte ptr [eax],dl
 00415183    add         byte ptr [eax],dl
 00415185    add         byte ptr [eax],dl
 00415187    add         byte ptr [eax],dl
 00415189    add         byte ptr [eax],dl
 0041518B    add         byte ptr [eax],dl
 0041518D    add         byte ptr [eax],dl
 0041518F    add         byte ptr [eax],dl
 00415191    add         byte ptr [eax],dl
 00415193    add         byte ptr [eax],dl
 00415195    add         byte ptr [eax],dl
 00415197    add         byte ptr [eax],dl
 00415199    add         byte ptr [eax],dl
 0041519B    add         byte ptr [eax],dl
 0041519D    add         byte ptr [eax],dl
 0041519F    add         byte ptr [eax],dl
 004151A1    add         byte ptr [eax],dl
 004151A3    add         byte ptr [eax],dl
 004151A5    add         byte ptr [eax],dl
 004151A7    add         byte ptr [eax],dl
 004151A9    add         byte ptr [eax],dl
 004151AB    add         byte ptr [eax],dl
 004151AD    add         byte ptr [eax],dl
 004151AF    add         byte ptr [eax],dl
 004151B1    add         byte ptr [eax],dl
 004151B3    add         byte ptr [eax],dl
 004151B5    add         byte ptr [eax],dl
 004151B7    add         byte ptr [eax],dl
 004151B9    add         byte ptr [eax],dl
 004151BB    add         byte ptr [eax],dl
 004151BD    add         byte ptr [eax],dl
 004151BF    add         byte ptr [eax],dl
 004151C1    add         byte ptr [eax],dl
 004151C3    add         byte ptr [eax],dl
 004151C5    add         byte ptr [eax],dl
 004151C7    add         byte ptr [eax],dl
 004151C9    add         byte ptr [eax],dl
 004151CB    add         byte ptr [eax],dl
 004151CD    add         byte ptr [eax],dl
 004151CF    add         byte ptr [eax],dl
 004151D1    add         byte ptr [eax],dl
 004151D3    add         byte ptr [eax],dl
 004151D5    add         byte ptr [eax],dl
 004151D7    add         byte ptr [eax],dl
 004151D9    add         byte ptr [eax],dl
 004151DB    add         byte ptr [eax],dl
 004151DD    add         byte ptr [eax],dl
 004151DF    add         byte ptr [eax],dl
 004151E1    add         byte ptr [eax],dl
 004151E3    add         byte ptr [eax],dl
 004151E5    add         byte ptr [eax],dl
 004151E7    add         byte ptr [eax],dl
 004151E9    add         byte ptr [eax],dl
 004151EB    add         byte ptr [eax],dl
 004151ED    add         byte ptr [eax],dl
 004151EF    add         byte ptr [eax],dl
 004151F1    add         byte ptr [eax],dl
 004151F3    add         byte ptr [eax],dl
 004151F5    add         byte ptr [eax],dl
 004151F7    add         byte ptr [eax],dl
 004151F9    add         byte ptr [eax],dl
 004151FB    add         byte ptr [eax],dl
 004151FD    add         byte ptr [eax],dl
 004151FF    add         byte ptr [eax],dl
 00415201    add         byte ptr [eax],dl
 00415203    add         byte ptr [eax],dl
 00415205    add         byte ptr [eax],dl
 00415207    add         byte ptr [eax],dl
 00415209    add         byte ptr [eax],dl
 0041520B    add         byte ptr [eax],dl
 0041520D    add         byte ptr [eax],dl
 0041520F    add         byte ptr [eax],dl
 00415211    add         byte ptr [eax],dl
 00415213    add         byte ptr [eax],dl
 00415215    add         byte ptr [eax],dl
 00415217    add         byte ptr [eax],dl
 00415219    add         byte ptr [eax],dl
 0041521B    add         byte ptr [eax],dl
 0041521D    add         byte ptr [eax],dl
 0041521F    add         byte ptr [eax],dl
 00415221    add         byte ptr [eax],dl
 00415223    add         byte ptr [eax],dl
 00415225    add         byte ptr [eax],dl
 00415227    add         byte ptr [eax],dl
 00415229    add         byte ptr [eax],dl
 0041522B    add         byte ptr [eax],dl
 0041522D    add         byte ptr [eax],dl
 0041522F    add         byte ptr [eax],dl
 00415231    add         byte ptr [eax],dl
 00415233    add         byte ptr [eax],dl
 00415235    add         byte ptr [eax],dl
 00415237    add         byte ptr [eax],dl
 00415239    add         byte ptr [eax],dl
 0041523B    add         byte ptr [eax],dl
 0041523D    add         byte ptr [eax],dl
 0041523F    add         byte ptr [eax],dl
 00415241    add         byte ptr [eax],dl
 00415243    add         byte ptr [eax],dl
 00415245    add         byte ptr [eax],dl
 00415247    add         byte ptr [eax],dl
 00415249    add         byte ptr [eax],dl
 0041524B    add         byte ptr [eax],dl
 0041524D    add         byte ptr [eax],dl
 0041524F    add         byte ptr [eax],dl
 00415251    add         byte ptr [eax],dl
 00415253    add         byte ptr [eax],dl
 00415255    add         byte ptr [eax],dl
 00415257    add         byte ptr [eax],dl
 00415259    add         byte ptr [eax],dl
 0041525B    add         byte ptr [eax],dl
 0041525D    add         byte ptr [eax],dl
 0041525F    add         byte ptr [eax],dl
 00415261    add         byte ptr [eax],dl
 00415263    add         byte ptr [eax],dl
 00415265    add         byte ptr [eax],dl
 00415267    add         byte ptr [eax],dl
 00415269    add         byte ptr [eax],dl
 0041526B    add         byte ptr [eax],dl
 0041526D    add         byte ptr [eax],dl
 0041526F    add         byte ptr [eax],dl
 00415271    add         byte ptr [eax],dl
 00415273    add         byte ptr [eax],dl
 00415275    add         byte ptr [eax],dl
 00415277    add         byte ptr [eax],dl
 00415279    add         byte ptr [eax],dl
 0041527B    add         byte ptr [eax],dl
 0041527D    add         byte ptr [eax],dl
 0041527F    add         byte ptr [eax],dl
 00415281    add         byte ptr [eax],dl
 00415283    add         byte ptr [eax],dl
 00415285    add         byte ptr [eax],dl
 00415287    add         byte ptr [eax],dl
 00415289    add         byte ptr [eax],dl
 0041528B    add         byte ptr [eax],dl
 0041528D    add         byte ptr [eax],dl
 0041528F    add         byte ptr [eax],dl
 00415291    add         byte ptr [eax],dl
 00415293    add         byte ptr [eax],dl
 00415295    add         byte ptr [eax],dl
 00415297    add         byte ptr [eax],dl
 00415299    add         byte ptr [eax],dl
 0041529B    add         byte ptr [eax],dl
 0041529D    add         byte ptr [eax],dl
 0041529F    add         byte ptr [eax],dl
 004152A1    add         byte ptr [eax],dl
 004152A3    add         byte ptr [eax],dl
 004152A5    add         byte ptr [eax],dl
 004152A7    add         byte ptr [eax],dl
 004152A9    add         byte ptr [eax],dl
 004152AB    add         byte ptr [eax],dl
 004152AD    add         byte ptr [eax],dl
 004152AF    add         byte ptr [eax],dl
 004152B1    add         byte ptr [eax],dl
 004152B3    add         byte ptr [eax],dl
 004152B5    add         byte ptr [eax],dl
 004152B7    add         byte ptr [eax],dl
 004152B9    add         byte ptr [eax],dl
 004152BB    add         byte ptr [eax],dl
 004152BD    add         byte ptr [eax],dl
 004152BF    add         byte ptr [eax],dl
 004152C1    add         byte ptr [eax],dl
 004152C3    add         byte ptr [eax],dl
 004152C5    add         byte ptr [eax],dl
 004152C7    add         byte ptr [eax],dl
 004152C9    add         byte ptr [eax],dl
 004152CB    add         byte ptr [eax],dl
 004152CD    add         byte ptr [eax],dl
 004152CF    add         byte ptr [eax],dl
 004152D1    add         byte ptr [eax],dl
 004152D3    add         byte ptr [eax],dl
 004152D5    add         byte ptr [eax],dl
 004152D7    add         byte ptr [eax],dl
 004152D9    add         byte ptr [eax],dl
 004152DB    add         byte ptr [eax],dl
 004152DD    add         byte ptr [eax],dl
 004152DF    add         byte ptr [eax],dl
 004152E1    add         byte ptr [eax],dl
 004152E3    add         byte ptr [eax],dl
 004152E5    add         byte ptr [eax],dl
 004152E7    add         byte ptr [eax],dl
 004152E9    add         byte ptr [eax],dl
 004152EB    add         byte ptr [eax],dl
 004152ED    add         byte ptr [eax],dl
 004152EF    add         byte ptr [eax],dl
 004152F1    add         byte ptr [eax],dl
 004152F3    add         byte ptr [eax],dl
 004152F5    add         byte ptr [eax],dl
 004152F7    add         byte ptr [eax],dl
 004152F9    add         byte ptr [eax],dl
 004152FB    add         byte ptr [eax],dl
 004152FD    add         byte ptr [eax],dl
 004152FF    add         byte ptr [eax],dl
 00415301    add         byte ptr [eax],dl
 00415303    add         byte ptr [eax],dl
 00415305    add         byte ptr [eax],dl
 00415307    add         byte ptr [eax],dl
 00415309    add         byte ptr [eax],dl
 0041530B    add         byte ptr [eax],dl
 0041530D    add         byte ptr [eax],dl
 0041530F    add         byte ptr [eax],dl
 00415311    add         byte ptr [eax],dl
 00415313    add         byte ptr [eax],dl
 00415315    add         byte ptr [eax],dl
 00415317    add         byte ptr [eax],dl
 00415319    add         byte ptr [eax],dl
 0041531B    add         byte ptr [eax],dl
 0041531D    add         byte ptr [eax],dl
 0041531F    add         byte ptr [eax],dl
 00415321    add         byte ptr [eax],dl
 00415323    add         byte ptr [eax],dl
 00415325    add         byte ptr [eax],dl
 00415327    add         byte ptr [eax],dl
 00415329    add         byte ptr [eax],dl
 0041532B    add         byte ptr [eax],dl
 0041532D    add         byte ptr [eax],dl
 0041532F    add         byte ptr [eax],dl
 00415331    add         byte ptr [eax],dl
 00415333    add         byte ptr [eax],dl
 00415335    add         byte ptr [eax],dl
 00415337    add         byte ptr [eax],dl
 00415339    add         byte ptr [eax],dl
 0041533B    add         byte ptr [eax],dl
 0041533D    add         byte ptr [eax],dl
 0041533F    add         byte ptr [eax],dl
 00415341    add         byte ptr [eax],dl
 00415343    add         byte ptr [eax],dl
 00415345    add         byte ptr [eax],dl
 00415347    add         byte ptr [eax],dl
 00415349    add         byte ptr [eax],dl
 0041534B    add         byte ptr [eax],dl
 0041534D    add         byte ptr [eax],dl
 0041534F    add         byte ptr [eax],dl
 00415351    add         byte ptr [eax],dl
 00415353    add         byte ptr [eax],dl
 00415355    add         byte ptr [eax],dl
 00415357    add         byte ptr [eax],dl
 00415359    add         byte ptr [eax],dl
 0041535B    add         byte ptr [eax],dl
 0041535D    add         byte ptr [eax],dl
 0041535F    add         byte ptr [eax],dl
 00415361    add         byte ptr [eax],dl
 00415363    add         byte ptr [eax],dl
 00415365    add         byte ptr [eax],dl
 00415367    add         byte ptr [eax],dl
 00415369    add         byte ptr [eax],dl
 0041536B    add         byte ptr [eax],dl
 0041536D    add         byte ptr [eax],dl
 0041536F    add         byte ptr [eax],dl
 00415371    add         byte ptr [eax],dl
 00415373    add         byte ptr [eax],dl
 00415375    add         byte ptr [eax],dl
 00415377    add         byte ptr [eax],dl
 00415379    add         byte ptr [eax],dl
 0041537B    add         byte ptr [eax],dl
 0041537D    add         byte ptr [eax],dl
 0041537F    add         byte ptr [eax],dl
 00415381    add         byte ptr [eax],dl
 00415383    add         byte ptr [eax],dl
 00415385    add         byte ptr [eax],dl
 00415387    add         byte ptr [eax],dl
 00415389    add         byte ptr [eax],dl
 0041538B    add         byte ptr [eax],dl
 0041538D    add         byte ptr [eax],dl
 0041538F    add         byte ptr [eax],dl
 00415391    add         byte ptr [eax],dl
 00415393    add         byte ptr [eax],dl
 00415395    add         byte ptr [eax],dl
 00415397    add         byte ptr [eax],dl
 00415399    add         byte ptr [eax],dl
 0041539B    add         byte ptr [eax],dl
 0041539D    add         byte ptr [eax],dl
 0041539F    add         byte ptr [eax],dl
 004153A1    add         byte ptr [eax],dl
 004153A3    add         byte ptr [eax],dl
 004153A5    add         byte ptr [eax],dl
 004153A7    add         byte ptr [eax],dl
 004153A9    add         byte ptr [eax],dl
 004153AB    add         byte ptr [eax],dl
 004153AD    add         byte ptr [eax],dl
 004153AF    add         byte ptr [eax],dl
 004153B1    add         byte ptr [eax],dl
 004153B3    add         byte ptr [eax],dl
 004153B5    add         byte ptr [eax],dl
 004153B7    add         byte ptr [eax],dl
 004153B9    add         byte ptr [eax],dl
 004153BB    add         byte ptr [eax],dl
 004153BD    add         byte ptr [eax],dl
 004153BF    add         byte ptr [eax],dl
 004153C1    add         byte ptr [eax],dl
 004153C3    add         byte ptr [eax],dl
 004153C5    add         byte ptr [eax],dl
 004153C7    add         byte ptr [eax],dl
 004153C9    add         byte ptr [eax],dl
 004153CB    add         byte ptr [eax],dl
 004153CD    add         byte ptr [eax],dl
 004153CF    add         byte ptr [eax],dl
 004153D1    add         byte ptr [eax],dl
 004153D3    add         byte ptr [eax],dl
 004153D5    add         byte ptr [eax],dl
 004153D7    add         byte ptr [eax],dl
 004153D9    add         byte ptr [eax],dl
 004153DB    add         byte ptr [eax],dl
 004153DD    add         byte ptr [eax],dl
 004153DF    add         byte ptr [eax],dl
 004153E1    add         byte ptr [eax],dl
 004153E3    add         byte ptr [eax],dl
 004153E5    add         byte ptr [eax],dl
 004153E7    add         byte ptr [eax],dl
 004153E9    add         byte ptr [eax],dl
 004153EB    add         byte ptr [eax],dl
 004153ED    add         byte ptr [eax],dl
 004153EF    add         byte ptr [eax],dl
 004153F1    add         byte ptr [eax],dl
 004153F3    add         byte ptr [eax],dl
 004153F5    add         byte ptr [eax],dl
 004153F7    add         byte ptr [eax],dl
 004153F9    add         byte ptr [eax],dl
 004153FB    add         byte ptr [eax],dl
 004153FD    add         byte ptr [eax],dl
 004153FF    add         byte ptr [eax],dl
 00415401    add         byte ptr [eax],dl
 00415403    add         byte ptr [eax],dl
 00415405    add         byte ptr [eax],dl
 00415407    add         byte ptr [eax],dl
 00415409    add         byte ptr [eax],dl
 0041540B    add         byte ptr [eax],dl
 0041540D    add         byte ptr [eax],dl
 0041540F    add         byte ptr [eax],dl
 00415411    add         byte ptr [eax],dl
 00415413    add         byte ptr [eax],dl
 00415415    add         byte ptr [eax],dl
 00415417    add         byte ptr [eax],dl
 00415419    add         byte ptr [eax],dl
 0041541B    add         byte ptr [eax],dl
 0041541D    add         byte ptr [eax],dl
 0041541F    add         byte ptr [eax],dl
 00415421    add         byte ptr [eax],dl
 00415423    add         byte ptr [eax],dl
 00415425    add         byte ptr [eax],dl
 00415427    add         byte ptr [eax],dl
 00415429    add         byte ptr [eax],dl
 0041542B    add         byte ptr [eax],dl
 0041542D    add         byte ptr [eax],dl
 0041542F    add         byte ptr [eax],dl
 00415431    add         byte ptr [eax],dl
 00415433    add         byte ptr [eax],dl
 00415435    add         byte ptr [eax],dl
 00415437    add         byte ptr [eax],dl
 00415439    add         byte ptr [eax],dl
 0041543B    add         byte ptr [eax],dl
 0041543D    add         byte ptr [eax],dl
 0041543F    add         byte ptr [eax],dl
 00415441    add         byte ptr [eax],dl
 00415443    add         byte ptr [eax],dl
 00415445    add         byte ptr [eax],dl
 00415447    add         byte ptr [eax],dl
 00415449    add         byte ptr [eax],dl
 0041544B    add         byte ptr [eax],dl
 0041544D    add         byte ptr [eax],dl
 0041544F    add         byte ptr [eax],dl
 00415451    add         byte ptr [eax],dl
 00415453    add         byte ptr [eax],dl
 00415455    add         byte ptr [eax],dl
 00415457    add         byte ptr [eax],dl
 00415459    add         byte ptr [eax],dl
 0041545B    add         byte ptr [eax],dl
 0041545D    add         byte ptr [eax],dl
 0041545F    add         byte ptr [eax],dl
 00415461    add         byte ptr [eax],dl
 00415463    add         byte ptr [eax],dl
 00415465    add         byte ptr [eax],dl
 00415467    add         byte ptr [eax],dl
 00415469    add         byte ptr [eax],dl
 0041546B    add         byte ptr [eax],dl
 0041546D    add         byte ptr [eax],dl
 0041546F    add         byte ptr [eax],dl
 00415471    add         byte ptr [eax],dl
 00415473    add         byte ptr [eax],dl
 00415475    add         byte ptr [eax],dl
 00415477    add         byte ptr [eax],dl
 00415479    add         byte ptr [eax],dl
 0041547B    add         byte ptr [eax],dl
 0041547D    add         byte ptr [eax],dl
 0041547F    add         byte ptr [eax],dl
 00415481    add         byte ptr [eax],dl
 00415483    add         byte ptr [eax],dl
 00415485    add         byte ptr [eax],dl
 00415487    add         byte ptr [eax],dl
 00415489    add         byte ptr [eax],dl
 0041548B    add         byte ptr [eax],dl
 0041548D    add         byte ptr [eax],dl
 0041548F    add         byte ptr [eax],dl
 00415491    add         byte ptr [eax],dl
 00415493    add         byte ptr [eax],dl
 00415495    add         byte ptr [eax],dl
 00415497    add         byte ptr [eax],dl
 00415499    add         byte ptr [eax],dl
 0041549B    add         byte ptr [eax],dl
 0041549D    add         byte ptr [eax],dl
 0041549F    add         byte ptr [eax],dl
 004154A1    add         byte ptr [eax],dl
 004154A3    add         byte ptr [eax],dl
 004154A5    add         byte ptr [eax],dl
 004154A7    add         byte ptr [eax],dl
 004154A9    add         byte ptr [eax],dl
 004154AB    add         byte ptr [eax],dl
 004154AD    add         byte ptr [eax],dl
 004154AF    add         byte ptr [eax],dl
 004154B1    add         byte ptr [eax],dl
 004154B3    add         byte ptr [eax],dl
 004154B5    add         byte ptr [eax],dl
 004154B7    add         byte ptr [eax],dl
 004154B9    add         byte ptr [eax],dl
 004154BB    add         byte ptr [eax],dl
 004154BD    add         byte ptr [eax],dl
 004154BF    add         byte ptr [eax],dl
 004154C1    add         byte ptr [eax],dl
 004154C3    add         byte ptr [eax],dl
 004154C5    add         byte ptr [eax],dl
 004154C7    add         byte ptr [eax],dl
 004154C9    add         byte ptr [eax],dl
 004154CB    add         byte ptr [eax],dl
 004154CD    add         byte ptr [eax],dl
 004154CF    add         byte ptr [eax],dl
 004154D1    add         byte ptr [eax],dl
 004154D3    add         byte ptr [eax],dl
 004154D5    add         byte ptr [eax],dl
 004154D7    add         byte ptr [eax],dl
 004154D9    add         byte ptr [eax],dl
 004154DB    add         byte ptr [eax],dl
 004154DD    add         byte ptr [eax],dl
 004154DF    add         byte ptr [eax],dl
 004154E1    add         byte ptr [eax],dl
 004154E3    add         byte ptr [eax],dl
 004154E5    add         byte ptr [eax],dl
 004154E7    add         byte ptr [eax],dl
 004154E9    add         byte ptr [eax],dl
 004154EB    add         byte ptr [eax],dl
 004154ED    add         byte ptr [eax],dl
 004154EF    add         byte ptr [eax],dl
 004154F1    add         byte ptr [eax],dl
 004154F3    add         byte ptr [eax],dl
 004154F5    add         byte ptr [eax],dl
 004154F7    add         byte ptr [eax],dl
 004154F9    add         byte ptr [eax],dl
 004154FB    add         byte ptr [eax],dl
 004154FD    add         byte ptr [eax],dl
 004154FF    add         byte ptr [eax],dl
 00415501    add         byte ptr [eax],dl
 00415503    add         byte ptr [eax],dl
 00415505    add         byte ptr [eax],dl
 00415507    add         byte ptr [eax],dl
 00415509    add         byte ptr [eax],dl
 0041550B    add         byte ptr [eax],dl
 0041550D    add         byte ptr [eax],dl
 0041550F    add         byte ptr [eax],dl
 00415511    add         byte ptr [eax],dl
 00415513    add         byte ptr [eax],dl
 00415515    add         byte ptr [eax],dl
 00415517    add         byte ptr [eax],dl
 00415519    add         byte ptr [eax],dl
 0041551B    add         byte ptr [eax],dl
 0041551D    add         byte ptr [eax],dl
 0041551F    add         byte ptr [eax],dl
 00415521    add         byte ptr [eax],dl
 00415523    add         byte ptr [eax],dl
 00415525    add         byte ptr [eax],dl
 00415527    add         byte ptr [eax],dl
 00415529    add         byte ptr [eax],dl
 0041552B    add         byte ptr [eax],dl
 0041552D    add         byte ptr [eax],dl
 0041552F    add         byte ptr [eax],dl
 00415531    add         byte ptr [eax],dl
 00415533    add         byte ptr [eax],dl
 00415535    add         byte ptr [eax],dl
 00415537    add         byte ptr [eax],dl
 00415539    add         byte ptr [eax],dl
 0041553B    add         byte ptr [eax],dl
 0041553D    add         byte ptr [eax],dl
 0041553F    add         byte ptr [eax],dl
 00415541    add         byte ptr [eax],dl
 00415543    add         byte ptr [eax],dl
 00415545    add         byte ptr [eax],dl
 00415547    add         byte ptr [eax],dl
 00415549    add         byte ptr [eax],dl
 0041554B    add         byte ptr [eax],dl
 0041554D    add         byte ptr [eax],dl
 0041554F    add         byte ptr [eax],dl
 00415551    add         byte ptr [eax],dl
 00415553    add         byte ptr [eax],dl
 00415555    add         byte ptr [eax],dl
 00415557    add         byte ptr [eax],dl
 00415559    add         byte ptr [eax],dl
 0041555B    add         byte ptr [eax],dl
 0041555D    add         byte ptr [eax],dl
 0041555F    add         byte ptr [eax],dl
 00415561    add         byte ptr [eax],dl
 00415563    add         byte ptr [eax],dl
 00415565    add         byte ptr [eax],dl
 00415567    add         byte ptr [eax],dl
 00415569    add         byte ptr [eax],dl
 0041556B    add         byte ptr [eax],dl
 0041556D    add         byte ptr [eax],dl
 0041556F    add         byte ptr [eax],dl
 00415571    add         byte ptr [eax],dl
 00415573    add         byte ptr [eax],dl
 00415575    add         byte ptr [eax],dl
 00415577    add         byte ptr [eax],dl
 00415579    add         byte ptr [eax],dl
 0041557B    add         byte ptr [eax],dl
 0041557D    add         byte ptr [eax],dl
 0041557F    add         byte ptr [eax],dl
 00415581    add         byte ptr [eax],dl
 00415583    add         byte ptr [eax],dl
 00415585    add         byte ptr [eax],dl
 00415587    add         byte ptr [eax],dl
 00415589    add         byte ptr [eax],dl
 0041558B    add         byte ptr [eax],dl
 0041558D    add         byte ptr [eax],dl
 0041558F    add         byte ptr [eax],dl
 00415591    add         byte ptr [eax],dl
 00415593    add         byte ptr [eax],dl
 00415595    add         byte ptr [eax],dl
 00415597    add         byte ptr [eax],dl
 00415599    add         byte ptr [eax],dl
 0041559B    add         byte ptr [eax],dl
 0041559D    add         byte ptr [eax],dl
 0041559F    add         byte ptr [eax],dl
 004155A1    add         byte ptr [eax],dl
 004155A3    add         byte ptr [eax],dl
 004155A5    add         byte ptr [eax],dl
 004155A7    add         byte ptr [eax],dl
 004155A9    add         byte ptr [eax],dl
 004155AB    add         byte ptr [eax],dl
 004155AD    add         byte ptr [eax],dl
 004155AF    add         byte ptr [eax],dl
 004155B1    add         byte ptr [eax],dl
 004155B3    add         byte ptr [eax],dl
 004155B5    add         byte ptr [eax],dl
 004155B7    add         byte ptr [eax],dl
 004155B9    add         byte ptr [eax],dl
 004155BB    add         byte ptr [eax],dl
 004155BD    add         byte ptr [eax],dl
 004155BF    add         byte ptr [eax],dl
 004155C1    add         byte ptr [eax],dl
 004155C3    add         byte ptr [eax],dl
 004155C5    add         byte ptr [eax],dl
 004155C7    add         byte ptr [eax],dl
 004155C9    add         byte ptr [eax],dl
 004155CB    add         byte ptr [eax],dl
 004155CD    add         byte ptr [eax],dl
 004155CF    add         byte ptr [eax],dl
 004155D1    add         byte ptr [eax],dl
 004155D3    add         byte ptr [eax],dl
 004155D5    add         byte ptr [eax],dl
 004155D7    add         byte ptr [eax],dl
 004155D9    add         byte ptr [eax],dl
 004155DB    add         byte ptr [eax],dl
 004155DD    add         byte ptr [eax],dl
 004155DF    add         byte ptr [eax],dl
 004155E1    add         byte ptr [eax],dl
 004155E3    add         byte ptr [eax],dl
 004155E5    add         byte ptr [eax],dl
 004155E7    add         byte ptr [eax],dl
 004155E9    add         byte ptr [eax],dl
 004155EB    add         byte ptr [eax],dl
 004155ED    add         byte ptr [eax],dl
 004155EF    add         byte ptr [eax],dl
 004155F1    add         byte ptr [eax],dl
 004155F3    add         byte ptr [eax],dl
 004155F5    add         byte ptr [eax],dl
 004155F7    add         byte ptr [eax],dl
 004155F9    add         byte ptr [eax],dl
 004155FB    add         byte ptr [eax],dl
 004155FD    add         byte ptr [eax],dl
 004155FF    add         byte ptr [eax],dl
 00415601    add         byte ptr [eax],dl
 00415603    add         byte ptr [eax],dl
 00415605    add         byte ptr [eax],dl
 00415607    add         byte ptr [eax],dl
 00415609    add         byte ptr [eax],dl
 0041560B    add         byte ptr [eax],dl
 0041560D    add         byte ptr [eax],dl
 0041560F    add         byte ptr [eax],dl
 00415611    add         byte ptr [eax],dl
 00415613    add         byte ptr [eax],dl
 00415615    add         byte ptr [eax],dl
 00415617    add         byte ptr [eax],dl
 00415619    add         byte ptr [eax],dl
 0041561B    add         byte ptr [eax],dl
 0041561D    add         byte ptr [eax],dl
 0041561F    add         byte ptr [eax],dl
 00415621    add         byte ptr [eax],dl
 00415623    add         byte ptr [eax],dl
 00415625    add         byte ptr [eax],dl
 00415627    add         byte ptr [eax],dl
 00415629    add         byte ptr [eax],dl
 0041562B    add         byte ptr [eax],dl
 0041562D    add         byte ptr [eax],dl
 0041562F    add         byte ptr [eax],dl
 00415631    add         byte ptr [eax],dl
 00415633    add         byte ptr [eax],dl
 00415635    add         byte ptr [eax],dl
 00415637    add         byte ptr [eax],dl
 00415639    add         byte ptr [eax],dl
 0041563B    add         byte ptr [eax],dl
 0041563D    add         byte ptr [eax],dl
 0041563F    add         byte ptr [eax],dl
 00415641    add         byte ptr [eax],dl
 00415643    add         byte ptr [eax],dl
 00415645    add         byte ptr [eax],dl
 00415647    add         byte ptr [eax],dl
 00415649    add         byte ptr [eax],dl
 0041564B    add         byte ptr [eax],dl
 0041564D    add         byte ptr [eax],dl
 0041564F    add         byte ptr [eax],dl
 00415651    add         byte ptr [eax],dl
 00415653    add         byte ptr [eax],dl
 00415655    add         byte ptr [eax],dl
 00415657    add         byte ptr [eax],dl
 00415659    add         byte ptr [eax],dl
 0041565B    add         byte ptr [eax],dl
 0041565D    add         byte ptr [eax],dl
 0041565F    add         byte ptr [eax],dl
 00415661    add         byte ptr [eax],dl
 00415663    add         byte ptr [eax],dl
 00415665    add         byte ptr [eax],dl
 00415667    add         byte ptr [eax],dl
 00415669    add         byte ptr [eax],dl
 0041566B    add         byte ptr [eax],dl
 0041566D    add         byte ptr [eax],dl
 0041566F    add         byte ptr [eax],dl
 00415671    add         byte ptr [eax],dl
 00415673    add         byte ptr [eax],dl
 00415675    add         byte ptr [eax],dl
 00415677    add         byte ptr [eax],dl
 00415679    add         byte ptr [eax],dl
 0041567B    add         byte ptr [eax],dl
 0041567D    add         byte ptr [eax],dl
 0041567F    add         byte ptr [eax],dl
 00415681    add         byte ptr [eax],dl
 00415683    add         byte ptr [eax],dl
 00415685    add         byte ptr [eax],dl
 00415687    add         byte ptr [eax],dl
 00415689    add         byte ptr [eax],dl
 0041568B    add         byte ptr [eax],dl
 0041568D    add         byte ptr [eax],dl
 0041568F    add         byte ptr [eax],dl
 00415691    add         byte ptr [eax],dl
 00415693    add         byte ptr [eax],dl
 00415695    add         byte ptr [eax],dl
 00415697    add         byte ptr [eax],dl
 00415699    add         byte ptr [eax],dl
 0041569B    add         byte ptr [eax],dl
 0041569D    add         byte ptr [eax],dl
 0041569F    add         byte ptr [eax],dl
 004156A1    add         byte ptr [eax],dl
 004156A3    add         byte ptr [eax],dl
 004156A5    add         byte ptr [eax],dl
 004156A7    add         byte ptr [eax],dl
 004156A9    add         byte ptr [eax],dl
 004156AB    add         byte ptr [eax],dl
 004156AD    add         byte ptr [eax],dl
 004156AF    add         byte ptr [eax],dl
 004156B1    add         byte ptr [eax],dl
 004156B3    add         byte ptr [eax],dl
 004156B5    add         byte ptr [eax],dl
 004156B7    add         byte ptr [eax],dl
 004156B9    add         byte ptr [eax],dl
 004156BB    add         byte ptr [eax],dl
 004156BD    add         byte ptr [eax],dl
 004156BF    add         byte ptr [eax],dl
 004156C1    add         byte ptr [eax],dl
 004156C3    add         byte ptr [eax],dl
 004156C5    add         byte ptr [eax],dl
 004156C7    add         byte ptr [eax],dl
 004156C9    add         byte ptr [eax],dl
 004156CB    add         byte ptr [eax],dl
 004156CD    add         byte ptr [eax],dl
 004156CF    add         byte ptr [eax],dl
 004156D1    add         byte ptr [eax],dl
 004156D3    add         byte ptr [eax],dl
 004156D5    add         byte ptr [eax],dl
 004156D7    add         byte ptr [eax],dl
 004156D9    add         byte ptr [eax],dl
 004156DB    add         byte ptr [eax],dl
 004156DD    add         byte ptr [eax],dl
 004156DF    add         byte ptr [eax],dl
 004156E1    add         byte ptr [eax],dl
 004156E3    add         byte ptr [eax],dl
 004156E5    add         byte ptr [eax],dl
 004156E7    add         byte ptr [eax],dl
 004156E9    add         byte ptr [eax],dl
 004156EB    add         byte ptr [eax],dl
 004156ED    add         byte ptr [eax],dl
 004156EF    add         byte ptr [eax],dl
 004156F1    add         byte ptr [eax],dl
 004156F3    add         byte ptr [eax],dl
 004156F5    add         byte ptr [eax],dl
 004156F7    add         byte ptr [eax],dl
 004156F9    add         byte ptr [eax],dl
 004156FB    add         byte ptr [eax],dl
 004156FD    add         byte ptr [eax],dl
 004156FF    add         byte ptr [eax],dl
 00415701    add         byte ptr [eax],dl
 00415703    add         byte ptr [eax],dl
 00415705    add         byte ptr [eax],dl
 00415707    add         byte ptr [eax],dl
 00415709    add         byte ptr [eax],dl
 0041570B    add         byte ptr [eax],dl
 0041570D    add         byte ptr [eax],dl
 0041570F    add         byte ptr [eax],dl
 00415711    add         byte ptr [eax],dl
 00415713    add         byte ptr [eax],dl
 00415715    add         byte ptr [eax],dl
 00415717    add         byte ptr [eax],dl
 00415719    add         byte ptr [eax],dl
 0041571B    add         byte ptr [eax],dl
 0041571D    add         byte ptr [eax],dl
 0041571F    add         byte ptr [eax],dl
 00415721    add         byte ptr [eax],dl
 00415723    add         byte ptr [eax],dl
 00415725    add         byte ptr [eax],dl
 00415727    add         byte ptr [eax],dl
 00415729    add         byte ptr [eax],dl
 0041572B    add         byte ptr [eax],dl
 0041572D    add         byte ptr [eax],dl
 0041572F    add         byte ptr [eax],dl
 00415731    add         byte ptr [eax],dl
 00415733    add         byte ptr [eax],dl
 00415735    add         byte ptr [eax],dl
 00415737    add         byte ptr [eax],dl
 00415739    add         byte ptr [eax],dl
 0041573B    add         byte ptr [eax],dl
 0041573D    add         byte ptr [eax],dl
 0041573F    add         byte ptr [eax],dl
 00415741    add         byte ptr [eax],dl
 00415743    add         byte ptr [eax],dl
 00415745    add         byte ptr [eax],dl
 00415747    add         byte ptr [eax],dl
 00415749    add         byte ptr [eax],dl
 0041574B    add         byte ptr [eax],dl
 0041574D    add         byte ptr [eax],dl
 0041574F    add         byte ptr [eax],dl
 00415751    add         byte ptr [eax],dl
 00415753    add         byte ptr [eax],dl
 00415755    add         byte ptr [eax],dl
 00415757    add         byte ptr [eax],dl
 00415759    add         byte ptr [eax],dl
 0041575B    add         byte ptr [eax],dl
 0041575D    add         byte ptr [eax],dl
 0041575F    add         byte ptr [eax],dl
 00415761    add         byte ptr [eax],dl
 00415763    add         byte ptr [eax],dl
 00415765    add         byte ptr [eax],dl
 00415767    add         byte ptr [eax],dl
 00415769    add         byte ptr [eax],dl
 0041576B    add         byte ptr [eax],dl
 0041576D    add         byte ptr [eax],dl
 0041576F    add         byte ptr [eax],dl
 00415771    add         byte ptr [eax],dl
 00415773    add         byte ptr [eax],dl
 00415775    add         byte ptr [eax],dl
 00415777    add         byte ptr [eax],dl
 00415779    add         byte ptr [eax],dl
 0041577B    add         byte ptr [eax],dl
 0041577D    add         byte ptr [eax],dl
 0041577F    add         byte ptr [eax],dl
 00415781    add         byte ptr [eax],dl
 00415783    add         byte ptr [eax],dl
 00415785    add         byte ptr [eax],dl
 00415787    add         byte ptr [eax],dl
 00415789    add         byte ptr [eax],dl
 0041578B    add         byte ptr [eax],dl
 0041578D    add         byte ptr [eax],dl
 0041578F    add         byte ptr [eax],dl
 00415791    add         byte ptr [eax],dl
 00415793    add         byte ptr [eax],dl
 00415795    add         byte ptr [eax],dl
 00415797    add         byte ptr [eax],dl
 00415799    add         byte ptr [eax],dl
 0041579B    add         byte ptr [eax],dl
 0041579D    add         byte ptr [eax],dl
 0041579F    add         byte ptr [eax],dl
 004157A1    add         byte ptr [eax],dl
 004157A3    add         byte ptr [eax],dl
 004157A5    add         byte ptr [eax],dl
 004157A7    add         byte ptr [eax],dl
 004157A9    add         byte ptr [eax],dl
 004157AB    add         byte ptr [eax],dl
 004157AD    add         byte ptr [eax],dl
 004157AF    add         byte ptr [eax],dl
 004157B1    add         byte ptr [eax],dl
 004157B3    add         byte ptr [eax],dl
 004157B5    add         byte ptr [eax],dl
 004157B7    add         byte ptr [eax],dl
 004157B9    add         byte ptr [eax],dl
 004157BB    add         byte ptr [eax],dl
 004157BD    add         byte ptr [eax],dl
 004157BF    add         byte ptr [eax],dl
 004157C1    add         byte ptr [eax],dl
 004157C3    add         byte ptr [eax],dl
 004157C5    add         byte ptr [eax],dl
 004157C7    add         byte ptr [eax],dl
 004157C9    add         byte ptr [eax],dl
 004157CB    add         byte ptr [eax],dl
 004157CD    add         byte ptr [eax],dl
 004157CF    add         byte ptr [eax],dl
 004157D1    add         byte ptr [eax],dl
 004157D3    add         byte ptr [eax],dl
 004157D5    add         byte ptr [eax],dl
 004157D7    add         byte ptr [eax],dl
 004157D9    add         byte ptr [eax],dl
 004157DB    add         byte ptr [eax],dl
 004157DD    add         byte ptr [eax],dl
 004157DF    add         byte ptr [eax],dl
 004157E1    add         byte ptr [eax],dl
 004157E3    add         byte ptr [eax],dl
 004157E5    add         byte ptr [eax],dl
 004157E7    add         byte ptr [eax],dl
 004157E9    add         byte ptr [eax],dl
 004157EB    add         byte ptr [eax],dl
 004157ED    add         byte ptr [eax],dl
 004157EF    add         byte ptr [eax],dl
 004157F1    add         byte ptr [eax],dl
 004157F3    add         byte ptr [eax],dl
 004157F5    add         byte ptr [eax],dl
 004157F7    add         byte ptr [eax],dl
 004157F9    add         byte ptr [eax],dl
 004157FB    add         byte ptr [eax],dl
 004157FD    add         byte ptr [eax],dl
 004157FF    add         byte ptr [eax],dl
 00415801    add         byte ptr [eax],dl
 00415803    add         byte ptr [eax],dl
 00415805    add         byte ptr [eax],dl
 00415807    add         byte ptr [eax],dl
 00415809    add         byte ptr [eax],dl
 0041580B    add         byte ptr [eax],dl
 0041580D    add         byte ptr [eax],dl
 0041580F    add         byte ptr [eax],dl
 00415811    add         byte ptr [eax],dl
 00415813    add         byte ptr [eax],dl
 00415815    add         byte ptr [eax],dl
 00415817    add         byte ptr [eax],dl
 00415819    add         byte ptr [eax],dl
 0041581B    add         byte ptr [eax],dl
 0041581D    add         byte ptr [eax],dl
 0041581F    add         byte ptr [eax],dl
 00415821    add         byte ptr [eax],dl
 00415823    add         byte ptr [eax],dl
 00415825    add         byte ptr [eax],dl
 00415827    add         byte ptr [eax],dl
 00415829    add         byte ptr [eax],dl
 0041582B    add         byte ptr [eax],dl
 0041582D    add         byte ptr [eax],dl
 0041582F    add         byte ptr [eax],dl
 00415831    add         byte ptr [eax],dl
 00415833    add         byte ptr [eax],dl
 00415835    add         byte ptr [eax],dl
 00415837    add         byte ptr [eax],dl
 00415839    add         byte ptr [eax],dl
 0041583B    add         byte ptr [eax],dl
 0041583D    add         byte ptr [eax],dl
 0041583F    add         byte ptr [eax],dl
 00415841    add         byte ptr [eax],dl
 00415843    add         byte ptr [eax],dl
 00415845    add         byte ptr [eax],dl
 00415847    add         byte ptr [eax],dl
 00415849    add         byte ptr [eax],dl
 0041584B    add         byte ptr [eax],dl
 0041584D    add         byte ptr [eax],dl
 0041584F    add         byte ptr [eax],dl
 00415851    add         byte ptr [eax],dl
 00415853    add         byte ptr [eax],dl
 00415855    add         byte ptr [eax],dl
 00415857    add         byte ptr [eax],dl
 00415859    add         byte ptr [eax],dl
 0041585B    add         byte ptr [eax],dl
 0041585D    add         byte ptr [eax],dl
 0041585F    add         byte ptr [eax],dl
 00415861    add         byte ptr [eax],dl
 00415863    add         byte ptr [eax],dl
 00415865    add         byte ptr [eax],dl
 00415867    add         byte ptr [eax],dl
 00415869    add         byte ptr [eax],dl
 0041586B    add         byte ptr [eax],dl
 0041586D    add         byte ptr [eax],dl
 0041586F    add         byte ptr [eax],dl
 00415871    add         byte ptr [eax],dl
 00415873    add         byte ptr [eax],dl
 00415875    add         byte ptr [eax],dl
 00415877    add         byte ptr [eax],dl
 00415879    add         byte ptr [eax],dl
 0041587B    add         byte ptr [eax],dl
 0041587D    add         byte ptr [eax],dl
 0041587F    add         byte ptr [eax],dl
 00415881    add         byte ptr [eax],dl
 00415883    add         byte ptr [eax],dl
 00415885    add         byte ptr [eax],dl
 00415887    add         byte ptr [eax],dl
 00415889    add         byte ptr [eax],dl
 0041588B    add         byte ptr [eax],dl
 0041588D    add         byte ptr [eax],dl
 0041588F    add         byte ptr [eax],dl
 00415891    add         byte ptr [eax],dl
 00415893    add         byte ptr [eax],dl
 00415895    add         byte ptr [eax],dl
 00415897    add         byte ptr [eax],dl
 00415899    add         byte ptr [eax],dl
 0041589B    add         byte ptr [eax],dl
 0041589D    add         byte ptr [eax],dl
 0041589F    add         byte ptr [eax],dl
 004158A1    add         byte ptr [eax],dl
 004158A3    add         byte ptr [eax],dl
 004158A5    add         byte ptr [eax],dl
 004158A7    add         byte ptr [eax],dl
 004158A9    add         byte ptr [eax],dl
 004158AB    add         byte ptr [eax],dl
 004158AD    add         byte ptr [eax],dl
 004158AF    add         byte ptr [eax],dl
 004158B1    add         byte ptr [eax],dl
 004158B3    add         byte ptr [eax],dl
 004158B5    add         byte ptr [eax],dl
 004158B7    add         byte ptr [eax],dl
 004158B9    add         byte ptr [eax],dl
 004158BB    add         byte ptr [eax],dl
 004158BD    add         byte ptr [eax],dl
 004158BF    add         byte ptr [eax],dl
 004158C1    add         byte ptr [eax],dl
 004158C3    add         byte ptr [eax],dl
 004158C5    add         byte ptr [eax],dl
 004158C7    add         byte ptr [eax],dl
 004158C9    add         byte ptr [eax],dl
 004158CB    add         byte ptr [eax],dl
 004158CD    add         byte ptr [eax],dl
 004158CF    add         byte ptr [eax],dl
 004158D1    add         byte ptr [eax],dl
 004158D3    add         byte ptr [eax],dl
 004158D5    add         byte ptr [eax],dl
 004158D7    add         byte ptr [eax],dl
 004158D9    add         byte ptr [eax],dl
 004158DB    add         byte ptr [eax],dl
 004158DD    add         byte ptr [eax],dl
 004158DF    add         byte ptr [eax],dl
 004158E1    add         byte ptr [eax],dl
 004158E3    add         byte ptr [eax],dl
 004158E5    add         byte ptr [eax],dl
 004158E7    add         byte ptr [eax],dl
 004158E9    add         byte ptr [eax],dl
 004158EB    add         byte ptr [eax],dl
 004158ED    add         byte ptr [eax],dl
 004158EF    add         byte ptr [eax],dl
 004158F1    add         byte ptr [eax],dl
 004158F3    add         byte ptr [eax],dl
 004158F5    add         byte ptr [eax],dl
 004158F7    add         byte ptr [eax],dl
 004158F9    add         byte ptr [eax],dl
 004158FB    add         byte ptr [eax],dl
 004158FD    add         byte ptr [eax],dl
 004158FF    add         byte ptr [eax],dl
 00415901    add         byte ptr [eax],dl
 00415903    add         byte ptr [eax],dl
 00415905    add         byte ptr [eax],dl
 00415907    add         byte ptr [eax],dl
 00415909    add         byte ptr [eax],dl
 0041590B    add         byte ptr [eax],dl
 0041590D    add         byte ptr [eax],dl
 0041590F    add         byte ptr [eax],dl
 00415911    add         byte ptr [eax],dl
 00415913    add         byte ptr [eax],dl
 00415915    add         byte ptr [eax],dl
 00415917    add         byte ptr [eax],dl
 00415919    add         byte ptr [eax],dl
 0041591B    add         byte ptr [eax],dl
 0041591D    add         byte ptr [eax],dl
 0041591F    add         byte ptr [eax],dl
 00415921    add         byte ptr [eax],dl
 00415923    add         byte ptr [eax],dl
 00415925    add         byte ptr [eax],dl
 00415927    add         byte ptr [eax],dl
 00415929    add         byte ptr [eax],dl
 0041592B    add         byte ptr [eax],dl
 0041592D    add         byte ptr [eax],dl
 0041592F    add         byte ptr [eax],dl
 00415931    add         byte ptr [eax],dl
 00415933    add         byte ptr [eax],dl
 00415935    add         byte ptr [eax],dl
 00415937    add         byte ptr [eax],dl
 00415939    add         byte ptr [eax],dl
 0041593B    add         byte ptr [eax],dl
 0041593D    add         byte ptr [eax],dl
 0041593F    add         byte ptr [eax],dl
 00415941    add         byte ptr [eax],dl
 00415943    add         byte ptr [eax],dl
 00415945    add         byte ptr [eax],dl
 00415947    add         byte ptr [eax],dl
 00415949    add         byte ptr [eax],dl
 0041594B    add         byte ptr [eax],dl
 0041594D    add         byte ptr [eax],dl
 0041594F    add         byte ptr [eax],dl
 00415951    add         byte ptr [eax],dl
 00415953    add         byte ptr [eax],dl
 00415955    add         byte ptr [eax],dl
 00415957    add         byte ptr [eax],dl
 00415959    add         byte ptr [eax],dl
 0041595B    add         byte ptr [eax],dl
 0041595D    add         byte ptr [eax],dl
 0041595F    add         byte ptr [eax],dl
 00415961    add         byte ptr [eax],dl
 00415963    add         byte ptr [eax],dl
 00415965    add         byte ptr [eax],dl
 00415967    add         byte ptr [eax],dl
 00415969    add         byte ptr [eax],dl
 0041596B    add         byte ptr [eax],dl
 0041596D    add         byte ptr [eax],dl
 0041596F    add         byte ptr [eax],dl
 00415971    add         byte ptr [eax],dl
 00415973    add         byte ptr [eax],dl
 00415975    add         byte ptr [eax],dl
 00415977    add         byte ptr [eax],dl
 00415979    add         byte ptr [eax],dl
 0041597B    add         byte ptr [eax],dl
 0041597D    add         byte ptr [eax],dl
 0041597F    add         byte ptr [eax],dl
 00415981    add         byte ptr [eax],dl
 00415983    add         byte ptr [eax],dl
 00415985    add         byte ptr [eax],dl
 00415987    add         byte ptr [eax],dl
 00415989    add         byte ptr [eax],dl
 0041598B    add         byte ptr [eax],dl
 0041598D    add         byte ptr [eax],dl
 0041598F    add         byte ptr [eax],dl
 00415991    add         byte ptr [eax],dl
 00415993    add         byte ptr [eax],dl
 00415995    add         byte ptr [eax],dl
 00415997    add         byte ptr [eax],dl
 00415999    add         byte ptr [eax],dl
 0041599B    add         byte ptr [eax],dl
 0041599D    add         byte ptr [eax],dl
 0041599F    add         byte ptr [eax],dl
 004159A1    add         byte ptr [eax],dl
 004159A3    add         byte ptr [eax],dl
 004159A5    add         byte ptr [eax],dl
 004159A7    add         byte ptr [eax],dl
 004159A9    add         byte ptr [eax],dl
 004159AB    add         byte ptr [eax],dl
 004159AD    add         byte ptr [eax],dl
 004159AF    add         byte ptr [eax],dl
 004159B1    add         byte ptr [eax],dl
 004159B3    add         byte ptr [eax],dl
 004159B5    add         byte ptr [eax],dl
 004159B7    add         byte ptr [eax],dl
 004159B9    add         byte ptr [eax],dl
 004159BB    add         byte ptr [eax],dl
 004159BD    add         byte ptr [eax],dl
 004159BF    add         byte ptr [eax],dl
 004159C1    add         byte ptr [eax],dl
 004159C3    add         byte ptr [eax],dl
 004159C5    add         byte ptr [eax],dl
 004159C7    add         byte ptr [eax],dl
 004159C9    add         byte ptr [eax],dl
 004159CB    add         byte ptr [eax],dl
 004159CD    add         byte ptr [eax],dl
 004159CF    add         byte ptr [eax],dl
 004159D1    add         byte ptr [eax],dl
 004159D3    add         byte ptr [eax],dl
 004159D5    add         byte ptr [eax],dl
 004159D7    add         byte ptr [eax],dl
 004159D9    add         byte ptr [eax],dl
 004159DB    add         byte ptr [eax],dl
 004159DD    add         byte ptr [eax],dl
 004159DF    add         byte ptr [eax],dl
 004159E1    add         byte ptr [eax],dl
 004159E3    add         byte ptr [eax],dl
 004159E5    add         byte ptr [eax],dl
 004159E7    add         byte ptr [eax],dl
 004159E9    add         byte ptr [eax],dl
 004159EB    add         byte ptr [eax],dl
 004159ED    add         byte ptr [eax],dl
 004159EF    add         byte ptr [eax],dl
 004159F1    add         byte ptr [eax],dl
 004159F3    add         byte ptr [eax],dl
 004159F5    add         byte ptr [eax],dl
 004159F7    add         byte ptr [eax],dl
 004159F9    add         byte ptr [eax],dl
 004159FB    add         byte ptr [eax],dl
 004159FD    add         byte ptr [eax],dl
 004159FF    add         byte ptr [eax],dl
 00415A01    add         byte ptr [eax],dl
 00415A03    add         byte ptr [eax],dl
 00415A05    add         byte ptr [eax],dl
 00415A07    add         byte ptr [eax],dl
 00415A09    add         byte ptr [eax],dl
 00415A0B    add         byte ptr [eax],dl
 00415A0D    add         byte ptr [eax],dl
 00415A0F    add         byte ptr [eax],dl
 00415A11    add         byte ptr [eax],dl
 00415A13    add         byte ptr [eax],dl
 00415A15    add         byte ptr [eax],dl
 00415A17    add         byte ptr [eax],dl
 00415A19    add         byte ptr [eax],dl
 00415A1B    add         byte ptr [eax],dl
 00415A1D    add         byte ptr [eax],dl
 00415A1F    add         byte ptr [eax],dl
 00415A21    add         byte ptr [eax],dl
 00415A23    add         byte ptr [eax],dl
 00415A25    add         byte ptr [eax],dl
 00415A27    add         byte ptr [eax],dl
 00415A29    add         byte ptr [eax],dl
 00415A2B    add         byte ptr [eax],dl
 00415A2D    add         byte ptr [eax],dl
 00415A2F    add         byte ptr [eax],dl
 00415A31    add         byte ptr [eax],dl
 00415A33    add         byte ptr [eax],dl
 00415A35    add         byte ptr [eax],dl
 00415A37    add         byte ptr [eax],dl
 00415A39    add         byte ptr [eax],dl
 00415A3B    add         byte ptr [eax],dl
 00415A3D    add         byte ptr [eax],dl
 00415A3F    add         byte ptr [eax],dl
 00415A41    add         byte ptr [eax],dl
 00415A43    add         byte ptr [eax],dl
 00415A45    add         byte ptr [eax],dl
 00415A47    add         byte ptr [eax],dl
 00415A49    add         byte ptr [eax],dl
 00415A4B    add         byte ptr [eax],dl
 00415A4D    add         byte ptr [eax],dl
 00415A4F    add         byte ptr [eax],dl
 00415A51    add         byte ptr [eax],dl
 00415A53    add         byte ptr [eax],dl
 00415A55    add         byte ptr [eax],dl
 00415A57    add         byte ptr [eax],dl
 00415A59    add         byte ptr [eax],dl
 00415A5B    add         byte ptr [eax],dl
 00415A5D    add         byte ptr [eax],dl
 00415A5F    add         byte ptr [eax],dl
 00415A61    add         byte ptr [eax],dl
 00415A63    add         byte ptr [eax],dl
 00415A65    add         byte ptr [eax],dl
 00415A67    add         byte ptr [eax],dl
 00415A69    add         byte ptr [eax],dl
 00415A6B    add         byte ptr [eax],dl
 00415A6D    add         byte ptr [eax],dl
 00415A6F    add         byte ptr [eax],dl
 00415A71    add         byte ptr [eax],dl
 00415A73    add         byte ptr [eax],dl
 00415A75    add         byte ptr [eax],dl
 00415A77    add         byte ptr [eax],dl
 00415A79    add         byte ptr [eax],dl
 00415A7B    add         byte ptr [eax],dl
 00415A7D    add         byte ptr [eax],dl
 00415A7F    add         byte ptr [eax],dl
 00415A81    add         byte ptr [eax],dl
 00415A83    add         byte ptr [eax],dl
 00415A85    add         byte ptr [eax],dl
 00415A87    add         byte ptr [eax],dl
 00415A89    add         byte ptr [eax],dl
 00415A8B    add         byte ptr [eax],dl
 00415A8D    add         byte ptr [eax],dl
 00415A8F    add         byte ptr [eax],dl
 00415A91    add         byte ptr [eax],dl
 00415A93    add         byte ptr [eax],dl
 00415A95    add         byte ptr [eax],dl
 00415A97    add         byte ptr [eax],dl
 00415A99    add         byte ptr [eax],dl
 00415A9B    add         byte ptr [eax],dl
 00415A9D    add         byte ptr [eax],dl
 00415A9F    add         byte ptr [eax],dl
 00415AA1    add         byte ptr [eax],dl
 00415AA3    add         byte ptr [eax],dl
 00415AA5    add         byte ptr [eax],dl
 00415AA7    add         byte ptr [eax],dl
 00415AA9    add         byte ptr [eax],dl
 00415AAB    add         byte ptr [eax],dl
 00415AAD    add         byte ptr [eax],dl
 00415AAF    add         byte ptr [eax],dl
 00415AB1    add         byte ptr [eax],dl
 00415AB3    add         byte ptr [eax],dl
 00415AB5    add         byte ptr [eax],dl
 00415AB7    add         byte ptr [eax],dl
 00415AB9    add         byte ptr [eax],dl
 00415ABB    add         byte ptr [eax],dl
 00415ABD    add         byte ptr [eax],dl
 00415ABF    add         byte ptr [eax],dl
 00415AC1    add         byte ptr [eax],dl
 00415AC3    add         byte ptr [eax],dl
 00415AC5    add         byte ptr [eax],dl
 00415AC7    add         byte ptr [eax],dl
 00415AC9    add         byte ptr [eax],dl
 00415ACB    add         byte ptr [eax],dl
 00415ACD    add         byte ptr [eax],dl
 00415ACF    add         byte ptr [eax],dl
 00415AD1    add         byte ptr [eax],dl
 00415AD3    add         byte ptr [eax],dl
 00415AD5    add         byte ptr [eax],dl
 00415AD7    add         byte ptr [eax],dl
 00415AD9    add         byte ptr [eax],dl
 00415ADB    add         byte ptr [eax],dl
 00415ADD    add         byte ptr [eax],dl
 00415ADF    add         byte ptr [eax],dl
 00415AE1    add         byte ptr [eax],dl
 00415AE3    add         byte ptr [eax],dl
 00415AE5    add         byte ptr [eax],dl
 00415AE7    add         byte ptr [eax],dl
 00415AE9    add         byte ptr [eax],dl
 00415AEB    add         byte ptr [eax],dl
 00415AED    add         byte ptr [eax],dl
 00415AEF    add         byte ptr [eax],dl
 00415AF1    add         byte ptr [eax],dl
 00415AF3    add         byte ptr [eax],dl
 00415AF5    add         byte ptr [eax],dl
 00415AF7    add         byte ptr [eax],dl
 00415AF9    add         byte ptr [eax],dl
 00415AFB    add         byte ptr [eax],dl
 00415AFD    add         byte ptr [eax],dl
 00415AFF    add         byte ptr [eax],dl
 00415B01    add         byte ptr [eax],dl
 00415B03    add         byte ptr [eax],dl
 00415B05    add         byte ptr [eax],dl
 00415B07    add         byte ptr [eax],dl
 00415B09    add         byte ptr [eax],dl
 00415B0B    add         byte ptr [eax],dl
 00415B0D    add         byte ptr [eax],dl
 00415B0F    add         byte ptr [eax],dl
 00415B11    add         byte ptr [eax],dl
 00415B13    add         byte ptr [eax],dl
 00415B15    add         byte ptr [eax],dl
 00415B17    add         byte ptr [eax],dl
 00415B19    add         byte ptr [eax],dl
 00415B1B    add         byte ptr [eax],dl
 00415B1D    add         byte ptr [eax],dl
 00415B1F    add         byte ptr [eax],dl
 00415B21    add         byte ptr [eax],dl
 00415B23    add         byte ptr [eax],dl
 00415B25    add         byte ptr [eax],dl
 00415B27    add         byte ptr [eax],dl
 00415B29    add         byte ptr [eax],dl
 00415B2B    add         byte ptr [eax],dl
 00415B2D    add         byte ptr [eax],dl
 00415B2F    add         byte ptr [eax],dl
 00415B31    add         byte ptr [eax],dl
 00415B33    add         byte ptr [eax],dl
 00415B35    add         byte ptr [eax],dl
 00415B37    add         byte ptr [eax],dl
 00415B39    add         byte ptr [eax],dl
 00415B3B    add         byte ptr [eax],dl
 00415B3D    add         byte ptr [eax],dl
 00415B3F    add         byte ptr [eax],dl
 00415B41    add         byte ptr [eax],dl
 00415B43    add         byte ptr [eax],dl
 00415B45    add         byte ptr [eax],dl
 00415B47    add         byte ptr [eax],dl
 00415B49    add         byte ptr [eax],dl
 00415B4B    add         byte ptr [eax],dl
 00415B4D    add         byte ptr [eax],dl
 00415B4F    add         byte ptr [eax],dl
 00415B51    add         byte ptr [eax],dl
 00415B53    add         byte ptr [eax],dl
 00415B55    add         byte ptr [eax],dl
 00415B57    add         byte ptr [eax],dl
 00415B59    add         byte ptr [eax],dl
 00415B5B    add         byte ptr [eax],dl
 00415B5D    add         byte ptr [eax],dl
 00415B5F    add         byte ptr [eax],dl
 00415B61    add         byte ptr [eax],dl
 00415B63    add         byte ptr [eax],dl
 00415B65    add         byte ptr [eax],dl
 00415B67    add         byte ptr [eax],dl
 00415B69    add         byte ptr [eax],dl
 00415B6B    add         byte ptr [eax],dl
 00415B6D    add         byte ptr [eax],dl
 00415B6F    add         byte ptr [eax],dl
 00415B71    add         byte ptr [eax],dl
 00415B73    add         byte ptr [eax],dl
 00415B75    add         byte ptr [eax],dl
 00415B77    add         byte ptr [eax],dl
 00415B79    add         byte ptr [eax],dl
 00415B7B    add         byte ptr [eax],dl
 00415B7D    add         byte ptr [eax],dl
 00415B7F    add         byte ptr [eax],dl
 00415B81    add         byte ptr [eax],dl
 00415B83    add         byte ptr [eax],dl
 00415B85    add         byte ptr [eax],dl
 00415B87    add         byte ptr [eax],dl
 00415B89    add         byte ptr [eax],dl
 00415B8B    add         byte ptr [eax],dl
 00415B8D    add         byte ptr [eax],dl
 00415B8F    add         byte ptr [eax],dl
 00415B91    add         byte ptr [eax],dl
 00415B93    add         byte ptr [eax],dl
 00415B95    add         byte ptr [eax],dl
 00415B97    add         byte ptr [eax],dl
 00415B99    add         byte ptr [eax],dl
 00415B9B    add         byte ptr [eax],dl
 00415B9D    add         byte ptr [eax],dl
 00415B9F    add         byte ptr [eax],dl
 00415BA1    add         byte ptr [eax],dl
 00415BA3    add         byte ptr [eax],dl
 00415BA5    add         byte ptr [eax],dl
 00415BA7    add         byte ptr [eax],dl
 00415BA9    add         byte ptr [eax],dl
 00415BAB    add         byte ptr [eax],dl
 00415BAD    add         byte ptr [eax],dl
 00415BAF    add         byte ptr [eax],dl
 00415BB1    add         byte ptr [eax],dl
 00415BB3    add         byte ptr [eax],dl
 00415BB5    add         byte ptr [eax],dl
 00415BB7    add         byte ptr [eax],dl
 00415BB9    add         byte ptr [eax],dl
 00415BBB    add         byte ptr [eax],dl
 00415BBD    add         byte ptr [eax],dl
 00415BBF    add         byte ptr [eax],dl
 00415BC1    add         byte ptr [eax],dl
 00415BC3    add         byte ptr [eax],dl
 00415BC5    add         byte ptr [eax],dl
 00415BC7    add         byte ptr [eax],dl
 00415BC9    add         byte ptr [eax],dl
 00415BCB    add         byte ptr [eax],dl
 00415BCD    add         byte ptr [eax],dl
 00415BCF    add         byte ptr [eax],dl
 00415BD1    add         byte ptr [eax],dl
 00415BD3    add         byte ptr [eax],dl
 00415BD5    add         byte ptr [eax],dl
 00415BD7    add         byte ptr [eax],dl
 00415BD9    add         byte ptr [eax],dl
 00415BDB    add         byte ptr [eax],dl
 00415BDD    add         byte ptr [eax],dl
 00415BDF    add         byte ptr [eax],dl
 00415BE1    add         byte ptr [eax],dl
 00415BE3    add         byte ptr [eax],dl
 00415BE5    add         byte ptr [eax],dl
 00415BE7    add         byte ptr [eax],dl
 00415BE9    add         byte ptr [eax],dl
 00415BEB    add         byte ptr [eax],dl
 00415BED    add         byte ptr [eax],dl
 00415BEF    add         byte ptr [eax],dl
 00415BF1    add         byte ptr [eax],dl
 00415BF3    add         byte ptr [eax],dl
 00415BF5    add         byte ptr [eax],dl
 00415BF7    add         byte ptr [eax],dl
 00415BF9    add         byte ptr [eax],dl
 00415BFB    add         byte ptr [eax],dl
 00415BFD    add         byte ptr [eax],dl
 00415BFF    add         byte ptr [eax],dl
 00415C01    add         byte ptr [eax],dl
 00415C03    add         byte ptr [eax],dl
 00415C05    add         byte ptr [eax],dl
 00415C07    add         byte ptr [eax],dl
 00415C09    add         byte ptr [eax],dl
 00415C0B    add         byte ptr [eax],dl
 00415C0D    add         byte ptr [eax],dl
 00415C0F    add         byte ptr [eax],dl
 00415C11    add         byte ptr [eax],dl
 00415C13    add         byte ptr [eax],dl
 00415C15    add         byte ptr [eax],dl
 00415C17    add         byte ptr [eax],dl
 00415C19    add         byte ptr [eax],dl
 00415C1B    add         byte ptr [eax],dl
 00415C1D    add         byte ptr [eax],dl
 00415C1F    add         byte ptr [eax],dl
 00415C21    add         byte ptr [eax],dl
 00415C23    add         byte ptr [eax],dl
 00415C25    add         byte ptr [eax],dl
 00415C27    add         byte ptr [eax],dl
 00415C29    add         byte ptr [eax],dl
 00415C2B    add         byte ptr [eax],dl
 00415C2D    add         byte ptr [eax],dl
 00415C2F    add         byte ptr [eax],dl
 00415C31    add         byte ptr [eax],dl
 00415C33    add         byte ptr [eax],dl
 00415C35    add         byte ptr [eax],dl
 00415C37    add         byte ptr [eax],dl
 00415C39    add         byte ptr [eax],dl
 00415C3B    add         byte ptr [eax],dl
 00415C3D    add         byte ptr [eax],dl
 00415C3F    add         byte ptr [eax],dl
 00415C41    add         byte ptr [eax],dl
 00415C43    add         byte ptr [eax],dl
 00415C45    add         byte ptr [eax],dl
 00415C47    add         byte ptr [eax],dl
 00415C49    add         byte ptr [eax],dl
 00415C4B    add         byte ptr [eax],dl
 00415C4D    add         byte ptr [eax],dl
 00415C4F    add         byte ptr [eax],dl
 00415C51    add         byte ptr [eax],dl
 00415C53    add         byte ptr [eax],dl
 00415C55    add         byte ptr [eax],dl
 00415C57    add         byte ptr [eax],dl
 00415C59    add         byte ptr [eax],dl
 00415C5B    add         byte ptr [eax],dl
 00415C5D    add         byte ptr [eax],dl
 00415C5F    add         byte ptr [eax],dl
 00415C61    add         byte ptr [eax],dl
 00415C63    add         byte ptr [eax],dl
 00415C65    add         byte ptr [eax],dl
 00415C67    add         byte ptr [eax],dl
 00415C69    add         byte ptr [eax],dl
 00415C6B    add         byte ptr [eax],dl
 00415C6D    add         byte ptr [eax],dl
 00415C6F    add         byte ptr [eax],dl
 00415C71    add         byte ptr [eax],dl
 00415C73    add         byte ptr [eax],dl
 00415C75    add         byte ptr [eax],dl
 00415C77    add         byte ptr [eax],dl
 00415C79    add         byte ptr [eax],dl
 00415C7B    add         byte ptr [eax],dl
 00415C7D    add         byte ptr [eax],dl
 00415C7F    add         byte ptr [eax],dl
 00415C81    add         byte ptr [eax],dl
 00415C83    add         byte ptr [eax],dl
 00415C85    add         byte ptr [eax],dl
 00415C87    add         byte ptr [eax],dl
 00415C89    add         byte ptr [eax],dl
 00415C8B    add         byte ptr [eax],dl
 00415C8D    add         byte ptr [eax],dl
 00415C8F    add         byte ptr [eax],dl
 00415C91    add         byte ptr [eax],dl
 00415C93    add         byte ptr [eax],dl
 00415C95    add         byte ptr [eax],dl
 00415C97    add         byte ptr [eax],dl
 00415C99    add         byte ptr [eax],dl
 00415C9B    add         byte ptr [eax],dl
 00415C9D    add         byte ptr [eax],dl
 00415C9F    add         byte ptr [eax],dl
 00415CA1    add         byte ptr [eax],dl
 00415CA3    add         byte ptr [eax],dl
 00415CA5    add         byte ptr [eax],dl
 00415CA7    add         byte ptr [eax],dl
 00415CA9    add         byte ptr [eax],dl
 00415CAB    add         byte ptr [eax],dl
 00415CAD    add         byte ptr [eax],dl
 00415CAF    add         byte ptr [eax],dl
 00415CB1    add         byte ptr [eax],dl
 00415CB3    add         byte ptr [eax],dl
 00415CB5    add         byte ptr [eax],dl
 00415CB7    add         byte ptr [eax],dl
 00415CB9    add         byte ptr [eax],dl
 00415CBB    add         byte ptr [eax],dl
 00415CBD    add         byte ptr [eax],dl
 00415CBF    add         byte ptr [eax],dl
 00415CC1    add         byte ptr [eax],dl
 00415CC3    add         byte ptr [eax],dl
 00415CC5    add         byte ptr [eax],dl
 00415CC7    add         byte ptr [eax],dl
 00415CC9    add         byte ptr [eax],dl
 00415CCB    add         byte ptr [eax],dl
 00415CCD    add         byte ptr [eax],dl
 00415CCF    add         byte ptr [eax],dl
 00415CD1    add         byte ptr [eax],dl
 00415CD3    add         byte ptr [eax],dl
 00415CD5    add         byte ptr [eax],dl
 00415CD7    add         byte ptr [eax],dl
 00415CD9    add         byte ptr [eax],dl
 00415CDB    add         byte ptr [eax],dl
 00415CDD    add         byte ptr [eax],dl
 00415CDF    add         byte ptr [eax],dl
 00415CE1    add         byte ptr [eax],dl
 00415CE3    add         byte ptr [eax],dl
 00415CE5    add         byte ptr [eax],dl
 00415CE7    add         byte ptr [eax],dl
 00415CE9    add         byte ptr [eax],dl
 00415CEB    add         byte ptr [eax],dl
 00415CED    add         byte ptr [eax],dl
 00415CEF    add         byte ptr [eax],dl
 00415CF1    add         byte ptr [eax],dl
 00415CF3    add         byte ptr [eax],dl
 00415CF5    add         byte ptr [eax],dl
 00415CF7    add         byte ptr [eax],dl
 00415CF9    add         byte ptr [eax],dl
 00415CFB    add         byte ptr [eax],dl
 00415CFD    add         byte ptr [eax],dl
 00415CFF    add         byte ptr [eax],dl
 00415D01    add         byte ptr [eax],dl
 00415D03    add         byte ptr [eax],dl
 00415D05    add         byte ptr [eax],dl
 00415D07    add         byte ptr [eax],dl
 00415D09    add         byte ptr [eax],dl
 00415D0B    add         byte ptr [eax],dl
 00415D0D    add         byte ptr [eax],dl
 00415D0F    add         byte ptr [eax],dl
 00415D11    add         byte ptr [eax],dl
 00415D13    add         byte ptr [eax],dl
 00415D15    add         byte ptr [eax],dl
 00415D17    add         byte ptr [eax],dl
 00415D19    add         byte ptr [eax],dl
 00415D1B    add         byte ptr [eax],dl
 00415D1D    add         byte ptr [eax],dl
 00415D1F    add         byte ptr [eax],dl
 00415D21    add         byte ptr [eax],dl
 00415D23    add         byte ptr [eax],dl
 00415D25    add         byte ptr [eax],dl
 00415D27    add         byte ptr [eax],dl
 00415D29    add         byte ptr [eax],dl
 00415D2B    add         byte ptr [eax],dl
 00415D2D    add         byte ptr [eax],dl
 00415D2F    add         byte ptr [eax],dl
 00415D31    add         byte ptr [eax],dl
 00415D33    add         byte ptr [eax],dl
 00415D35    add         byte ptr [eax],dl
 00415D37    add         byte ptr [eax],dl
 00415D39    add         byte ptr [eax],dl
 00415D3B    add         byte ptr [eax],dl
 00415D3D    add         byte ptr [eax],dl
 00415D3F    add         byte ptr [eax],dl
 00415D41    add         byte ptr [eax],dl
 00415D43    add         byte ptr [eax],dl
 00415D45    add         byte ptr [eax],dl
 00415D47    add         byte ptr [eax],dl
 00415D49    add         byte ptr [eax],dl
 00415D4B    add         byte ptr [eax],dl
 00415D4D    add         byte ptr [eax],dl
 00415D4F    add         byte ptr [eax],dl
 00415D51    add         byte ptr [eax],dl
 00415D53    add         byte ptr [eax],dl
 00415D55    add         byte ptr [eax],dl
 00415D57    add         byte ptr [eax],dl
 00415D59    add         byte ptr [eax],dl
 00415D5B    add         byte ptr [eax],dl
 00415D5D    add         byte ptr [eax],dl
 00415D5F    add         byte ptr [eax],dl
 00415D61    add         byte ptr [eax],dl
 00415D63    add         byte ptr [eax],dl
 00415D65    add         byte ptr [eax],dl
 00415D67    add         byte ptr [eax],dl
 00415D69    add         byte ptr [eax],dl
 00415D6B    add         byte ptr [eax],dl
 00415D6D    add         byte ptr [eax],dl
 00415D6F    add         byte ptr [eax],dl
 00415D71    add         byte ptr [eax],dl
 00415D73    add         byte ptr [eax],dl
 00415D75    add         byte ptr [eax],dl
 00415D77    add         byte ptr [eax],dl
 00415D79    add         byte ptr [eax],dl
 00415D7B    add         byte ptr [eax],dl
 00415D7D    add         byte ptr [eax],dl
 00415D7F    add         byte ptr [eax],dl
 00415D81    add         byte ptr [eax],dl
 00415D83    add         byte ptr [eax],dl
 00415D85    add         byte ptr [eax],dl
 00415D87    add         byte ptr [eax],dl
 00415D89    add         byte ptr [eax],dl
 00415D8B    add         byte ptr [eax],dl
 00415D8D    add         byte ptr [eax],dl
 00415D8F    add         byte ptr [eax],dl
 00415D91    add         byte ptr [eax],dl
 00415D93    add         byte ptr [eax],dl
 00415D95    add         byte ptr [eax],dl
 00415D97    add         byte ptr [eax],dl
 00415D99    add         byte ptr [eax],dl
 00415D9B    add         byte ptr [eax],dl
 00415D9D    add         byte ptr [eax],dl
 00415D9F    add         byte ptr [eax],dl
 00415DA1    add         byte ptr [eax],dl
 00415DA3    add         byte ptr [eax],dl
 00415DA5    add         byte ptr [eax],dl
 00415DA7    add         byte ptr [eax],dl
 00415DA9    add         byte ptr [eax],dl
 00415DAB    add         byte ptr [eax],dl
 00415DAD    add         byte ptr [eax],dl
 00415DAF    add         byte ptr [eax],dl
 00415DB1    add         byte ptr [eax],dl
 00415DB3    add         byte ptr [eax],dl
 00415DB5    add         byte ptr [eax],dl
 00415DB7    add         byte ptr [eax],dl
 00415DB9    add         byte ptr [eax],dl
 00415DBB    add         byte ptr [eax],dl
 00415DBD    add         byte ptr [eax],dl
 00415DBF    add         byte ptr [eax],dl
 00415DC1    add         byte ptr [eax],dl
 00415DC3    add         byte ptr [eax],dl
 00415DC5    add         byte ptr [eax],dl
 00415DC7    add         byte ptr [eax],dl
 00415DC9    add         byte ptr [eax],dl
 00415DCB    add         byte ptr [eax],dl
 00415DCD    add         byte ptr [eax],dl
 00415DCF    add         byte ptr [eax],dl
 00415DD1    add         byte ptr [eax],dl
 00415DD3    add         byte ptr [eax],dl
 00415DD5    add         byte ptr [eax],dl
 00415DD7    add         byte ptr [eax],dl
 00415DD9    add         byte ptr [eax],dl
 00415DDB    add         byte ptr [eax],dl
 00415DDD    add         byte ptr [eax],dl
 00415DDF    add         byte ptr [eax],dl
 00415DE1    add         byte ptr [eax],dl
 00415DE3    add         byte ptr [eax],dl
 00415DE5    add         byte ptr [eax],dl
 00415DE7    add         byte ptr [eax],dl
 00415DE9    add         byte ptr [eax],dl
 00415DEB    add         byte ptr [eax],dl
 00415DED    add         byte ptr [eax],dl
 00415DEF    add         byte ptr [eax],dl
 00415DF1    add         byte ptr [eax],dl
 00415DF3    add         byte ptr [eax],dl
 00415DF5    add         byte ptr [eax],dl
 00415DF7    add         byte ptr [eax],dl
 00415DF9    add         byte ptr [eax],dl
 00415DFB    add         byte ptr [eax],dl
 00415DFD    add         byte ptr [eax],dl
 00415DFF    add         byte ptr [eax],dl
 00415E01    add         byte ptr [eax],dl
 00415E03    add         byte ptr [eax],dl
 00415E05    add         byte ptr [eax],dl
 00415E07    add         byte ptr [eax],dl
 00415E09    add         byte ptr [eax],dl
 00415E0B    add         byte ptr [eax],dl
 00415E0D    add         byte ptr [eax],dl
 00415E0F    add         byte ptr [eax],dl
 00415E11    add         byte ptr [eax],dl
 00415E13    add         byte ptr [eax],dl
 00415E15    add         byte ptr [eax],dl
 00415E17    add         byte ptr [eax],dl
 00415E19    add         byte ptr [eax],dl
 00415E1B    add         byte ptr [eax],dl
 00415E1D    add         byte ptr [eax],dl
 00415E1F    add         byte ptr [eax],dl
 00415E21    add         byte ptr [eax],dl
 00415E23    add         byte ptr [eax],dl
 00415E25    add         byte ptr [eax],dl
 00415E27    add         byte ptr [eax],dl
 00415E29    add         byte ptr [eax],dl
 00415E2B    add         byte ptr [eax],dl
 00415E2D    add         byte ptr [eax],dl
 00415E2F    add         byte ptr [eax],dl
 00415E31    add         byte ptr [eax],dl
 00415E33    add         byte ptr [eax],dl
 00415E35    add         byte ptr [eax],dl
 00415E37    add         byte ptr [eax],dl
 00415E39    add         byte ptr [eax],dl
 00415E3B    add         byte ptr [eax],dl
 00415E3D    add         byte ptr [eax],dl
 00415E3F    add         byte ptr [eax],dl
 00415E41    add         byte ptr [eax],dl
 00415E43    add         byte ptr [eax],dl
 00415E45    add         byte ptr [eax],dl
 00415E47    add         byte ptr [eax],dl
 00415E49    add         byte ptr [eax],dl
 00415E4B    add         byte ptr [eax],dl
 00415E4D    add         byte ptr [eax],dl
 00415E4F    add         byte ptr [eax],dl
 00415E51    add         byte ptr [eax],dl
 00415E53    add         byte ptr [eax],dl
 00415E55    add         byte ptr [eax],dl
 00415E57    add         byte ptr [eax],dl
 00415E59    add         byte ptr [eax],dl
 00415E5B    add         byte ptr [eax],dl
 00415E5D    add         byte ptr [eax],dl
 00415E5F    add         byte ptr [eax],dl
 00415E61    add         byte ptr [eax],dl
 00415E63    add         byte ptr [eax],dl
 00415E65    add         byte ptr [eax],dl
 00415E67    add         byte ptr [eax],dl
 00415E69    add         byte ptr [eax],dl
 00415E6B    add         byte ptr [eax],dl
 00415E6D    add         byte ptr [eax],dl
 00415E6F    add         byte ptr [eax],dl
 00415E71    add         byte ptr [eax],dl
 00415E73    add         byte ptr [eax],dl
 00415E75    add         byte ptr [eax],dl
 00415E77    add         byte ptr [eax],dl
 00415E79    add         byte ptr [eax],dl
 00415E7B    add         byte ptr [eax],dl
 00415E7D    add         byte ptr [eax],dl
 00415E7F    add         byte ptr [eax],dl
 00415E81    add         byte ptr [eax],dl
 00415E83    add         byte ptr [eax],dl
 00415E85    add         byte ptr [eax],dl
 00415E87    add         byte ptr [eax],dl
 00415E89    add         byte ptr [eax],dl
 00415E8B    add         byte ptr [eax],dl
 00415E8D    add         byte ptr [eax],dl
 00415E8F    add         byte ptr [eax],dl
 00415E91    add         byte ptr [eax],dl
 00415E93    add         byte ptr [eax],dl
 00415E95    add         byte ptr [eax],dl
 00415E97    add         byte ptr [eax],dl
 00415E99    add         byte ptr [eax],dl
 00415E9B    add         byte ptr [eax],dl
 00415E9D    add         byte ptr [eax],dl
 00415E9F    add         byte ptr [eax],dl
 00415EA1    add         byte ptr [eax],dl
 00415EA3    add         byte ptr [eax],dl
 00415EA5    add         byte ptr [eax],dl
 00415EA7    add         byte ptr [eax],dl
 00415EA9    add         byte ptr [eax],dl
 00415EAB    add         byte ptr [eax],dl
 00415EAD    add         byte ptr [eax],dl
 00415EAF    add         byte ptr [eax],dl
 00415EB1    add         byte ptr [eax],dl
 00415EB3    add         byte ptr [eax],dl
 00415EB5    add         byte ptr [eax],dl
 00415EB7    add         byte ptr [eax],dl
 00415EB9    add         byte ptr [eax],dl
 00415EBB    add         byte ptr [eax],dl
 00415EBD    add         byte ptr [eax],dl
 00415EBF    add         byte ptr [eax],dl
 00415EC1    add         byte ptr [eax],dl
 00415EC3    add         byte ptr [eax],dl
 00415EC5    add         byte ptr [eax],dl
 00415EC7    add         byte ptr [eax],dl
 00415EC9    add         byte ptr [eax],dl
 00415ECB    add         byte ptr [eax],dl
 00415ECD    add         byte ptr [eax],dl
 00415ECF    add         byte ptr [eax],dl
 00415ED1    add         byte ptr [eax],dl
 00415ED3    add         byte ptr [eax],dl
 00415ED5    add         byte ptr [eax],dl
 00415ED7    add         byte ptr [eax],dl
 00415ED9    add         byte ptr [eax],dl
 00415EDB    add         byte ptr [eax],dl
 00415EDD    add         byte ptr [eax],dl
 00415EDF    add         byte ptr [eax],dl
 00415EE1    add         byte ptr [eax],dl
 00415EE3    add         byte ptr [eax],dl
 00415EE5    add         byte ptr [eax],dl
 00415EE7    add         byte ptr [eax],dl
 00415EE9    add         byte ptr [eax],dl
 00415EEB    add         byte ptr [eax],dl
 00415EED    add         byte ptr [eax],dl
 00415EEF    add         byte ptr [eax],dl
 00415EF1    add         byte ptr [eax],dl
 00415EF3    add         byte ptr [eax],dl
 00415EF5    add         byte ptr [eax],dl
 00415EF7    add         byte ptr [eax],dl
 00415EF9    add         byte ptr [eax],dl
 00415EFB    add         byte ptr [eax],dl
 00415EFD    add         byte ptr [eax],dl
 00415EFF    add         byte ptr [eax],dl
 00415F01    add         byte ptr [eax],dl
 00415F03    add         byte ptr [eax],dl
 00415F05    add         byte ptr [eax],dl
 00415F07    add         byte ptr [eax],dl
 00415F09    add         byte ptr [eax],dl
 00415F0B    add         byte ptr [eax],dl
 00415F0D    add         byte ptr [eax],dl
 00415F0F    add         byte ptr [eax],dl
 00415F11    add         byte ptr [eax],dl
 00415F13    add         byte ptr [eax],dl
 00415F15    add         byte ptr [eax],dl
 00415F17    add         byte ptr [eax],dl
 00415F19    add         byte ptr [eax],dl
 00415F1B    add         byte ptr [eax],dl
 00415F1D    add         byte ptr [eax],dl
 00415F1F    add         byte ptr [eax],dl
 00415F21    add         byte ptr [eax],dl
 00415F23    add         byte ptr [eax],dl
 00415F25    add         byte ptr [eax],dl
 00415F27    add         byte ptr [eax],dl
 00415F29    add         byte ptr [eax],dl
 00415F2B    add         byte ptr [eax],dl
 00415F2D    add         byte ptr [eax],dl
 00415F2F    add         byte ptr [eax],dl
 00415F31    add         byte ptr [eax],dl
 00415F33    add         byte ptr [eax],dl
 00415F35    add         byte ptr [eax],dl
 00415F37    add         byte ptr [eax],dl
 00415F39    add         byte ptr [eax],dl
 00415F3B    add         byte ptr [eax],dl
 00415F3D    add         byte ptr [eax],dl
 00415F3F    add         byte ptr [eax],dl
 00415F41    add         byte ptr [eax],dl
 00415F43    add         byte ptr [eax],dl
 00415F45    add         byte ptr [eax],dl
 00415F47    add         byte ptr [eax],dl
 00415F49    add         byte ptr [eax],dl
 00415F4B    add         byte ptr [eax],dl
 00415F4D    add         byte ptr [eax],dl
 00415F4F    add         byte ptr [eax],dl
 00415F51    add         byte ptr [eax],dl
 00415F53    add         byte ptr [eax],dl
 00415F55    add         byte ptr [eax],dl
 00415F57    add         byte ptr [eax],dl
 00415F59    add         byte ptr [eax],dl
 00415F5B    add         byte ptr [eax],dl
 00415F5D    add         byte ptr [eax],dl
 00415F5F    add         byte ptr [eax],dl
 00415F61    add         byte ptr [eax],dl
 00415F63    add         byte ptr [eax],dl
 00415F65    add         byte ptr [eax],dl
 00415F67    add         byte ptr [eax],dl
 00415F69    add         byte ptr [eax],dl
 00415F6B    add         byte ptr [eax],dl
 00415F6D    add         byte ptr [eax],dl
 00415F6F    add         byte ptr [eax],dl
 00415F71    add         byte ptr [eax],dl
 00415F73    add         byte ptr [eax],dl
 00415F75    add         byte ptr [eax],dl
 00415F77    add         byte ptr [eax],dl
 00415F79    add         byte ptr [eax],dl
 00415F7B    add         byte ptr [eax],dl
 00415F7D    add         byte ptr [eax],dl
 00415F7F    add         byte ptr [eax],dl
 00415F81    add         byte ptr [eax],dl
 00415F83    add         byte ptr [eax],dl
 00415F85    add         byte ptr [eax],dl
 00415F87    add         byte ptr [eax],dl
 00415F89    add         byte ptr [eax],dl
 00415F8B    add         byte ptr [eax],dl
 00415F8D    add         byte ptr [eax],dl
 00415F8F    add         byte ptr [eax],dl
 00415F91    add         byte ptr [eax],dl
 00415F93    add         byte ptr [eax],dl
 00415F95    add         byte ptr [eax],dl
 00415F97    add         byte ptr [eax],dl
 00415F99    add         byte ptr [eax],dl
 00415F9B    add         byte ptr [eax],dl
 00415F9D    add         byte ptr [eax],dl
 00415F9F    add         byte ptr [eax],dl
 00415FA1    add         byte ptr [eax],dl
 00415FA3    add         byte ptr [eax],al
 00415FA5    add         byte ptr [eax],al
 00415FA7    add         byte ptr [eax],al
 00415FA9    add         byte ptr [eax],dl
 00415FAB    add         byte ptr [eax],al
 00415FAD    add         byte ptr [eax],al
 00415FAF    add         byte ptr [eax],al
 00415FB1    add         byte ptr [eax],al
 00415FB3    add         byte ptr [eax],al
 00415FB5    add         byte ptr [eax],al
 00415FB7    add         byte ptr [eax],al
 00415FB9    add         byte ptr [eax],ah
 00415FBB    add         byte ptr [eax],al
 00415FBD    add         byte ptr [eax],al
 00415FBF    add         byte ptr [eax],al
 00415FC1    add         byte ptr [eax],al
 00415FC3    add         byte ptr [eax],al
 00415FC5    add         byte ptr [eax],al
 00415FC7    add         byte ptr [eax],al
 00415FC9    add         byte ptr [eax],al
 00415FCB    add         byte ptr [eax],al
 00415FCD    add         byte ptr [eax],al
 00415FCF    add         byte ptr [eax],al
 00415FD1    add         byte ptr [eax],al
 00415FD3    add         byte ptr [eax],al
 00415FD5    add         byte ptr [eax],al
 00415FD7    add         byte ptr [eax],al
 00415FD9    add         byte ptr [eax],al
 00415FDB    add         byte ptr [eax],al
 00415FDD    add         byte ptr [eax],al
 00415FDF    add         byte ptr [eax],al
 00415FE1    add         byte ptr [eax],al
 00415FE3    add         byte ptr [eax],al
 00415FE5    add         byte ptr [eax],al
 00415FE7    add         byte ptr [eax],al
 00415FE9    add         byte ptr [eax],al
 00415FEB    add         byte ptr [eax],al
 00415FED    add         byte ptr [eax],al
 00415FEF    add         byte ptr [eax],dl
 00415FF1    add         byte ptr [eax],al
 00415FF3    add         byte ptr [eax],al
 00415FF5    add         byte ptr [eax],al
 00415FF7    add         byte ptr [eax],al
 00415FF9    add         byte ptr [eax],al
 00415FFB    add         byte ptr [eax],al
 00415FFD    add         byte ptr [eax],al
 00415FFF    add         byte ptr [eax],al
 00416001    add         byte ptr [eax],dl
 00416003    add         byte ptr [eax],al
 00416005    add         byte ptr [eax],al
 00416007    add         byte ptr [eax],al
 00416009    add         byte ptr [eax],al
 0041600B    add         byte ptr [eax],al
 0041600D    add         byte ptr [eax],al
 0041600F    add         byte ptr [eax],al
 00416011    add         byte ptr [eax],al
 00416013    add         byte ptr [eax],al
 00416015    add         byte ptr [eax],al
 00416017    add         byte ptr [eax],al
 00416019    add         byte ptr [eax],al
 0041601B    add         byte ptr [eax],dl
 0041601D    add         byte ptr [eax],al
 0041601F    add         byte ptr [eax],al
 00416021    add         byte ptr [eax],al
 00416023    add         byte ptr [eax],al
 00416025    add         byte ptr [eax],al
 00416027    add         byte ptr [eax],al
 00416029    add         byte ptr [eax],al
 0041602B    add         byte ptr [eax],al
 0041602D    add         byte ptr [eax],al
 0041602F    add         byte ptr [edx],cl
 00416031    add         byte ptr [eax],al
 00416033    add         byte ptr [eax],al
 00416035    add         byte ptr [eax],al
 00416037    add         byte ptr [eax],al
 00416039    add         byte ptr [eax],al
 0041603B    add         byte ptr [eax],al
 0041603D    add         byte ptr [eax],al
 0041603F    add         byte ptr [edx],cl
 00416041    add         byte ptr [eax],dh
 00416043    add         byte ptr [eax],al
 00416045    add         byte ptr [eax],al
 00416047    add         byte ptr [eax],al
 00416049    add         byte ptr [eax],al
 0041604B    add         byte ptr [eax],al
 0041604D    add         byte ptr [eax],al
 0041604F    add         byte ptr [edx],cl
 00416051    add         byte ptr [eax],al
 00416053    add         byte ptr [eax],al
 00416055    add         byte ptr [eax],al
 00416057    add         byte ptr [eax],al
 00416059    add         byte ptr [eax],al
 0041605B    add         byte ptr [eax],al
 0041605D    add         byte ptr [eax],al
 0041605F    add         byte ptr [edx],cl
 00416061    add         byte ptr [eax],al
 00416063    add         byte ptr [eax],al
 00416065    add         byte ptr [eax],al
 00416067    add         byte ptr [eax],al
 00416069    add         byte ptr [eax],al
 0041606B    add         byte ptr [eax],al
 0041606D    add         byte ptr [eax],al
 0041606F    add         byte ptr [edx],cl
 00416071    add         byte ptr [eax],al
 00416073    add         byte ptr [eax],al
 00416075    add         byte ptr [eax],al
 00416077    add         byte ptr [eax],al
 00416079    add         byte ptr [eax],al
 0041607B    add         byte ptr [eax],al
 0041607D    add         byte ptr [eax],al
 0041607F    add         byte ptr [edx],cl
 00416081    add         byte ptr [eax],al
 00416084    add         byte ptr [eax],al
 00416086    add         byte ptr [eax],al
 00416088    add         byte ptr [eax],al
 0041608A    add         byte ptr [eax],al
 0041608C    add         byte ptr [eax],al
 0041608E    add         byte ptr [eax],al
 00416090    or          al,byte ptr [eax]
 00416092    push        eax
 00416093    add         byte ptr [eax],al
 00416095    add         byte ptr [eax],al
 00416097    add         byte ptr [eax],al
 00416099    add         byte ptr [eax],al
 0041609B    add         byte ptr [eax],al
 0041609D    add         byte ptr [eax],al
 0041609F    add         byte ptr [edx],cl
 004160A1    add         byte ptr [eax],al
 004160A3    add         byte ptr [eax],al
 004160A5    add         byte ptr [eax],al
 004160A7    add         byte ptr [eax],al
 004160A9    add         byte ptr [eax],al
 004160AB    add         byte ptr [eax],al
 004160AD    add         byte ptr [eax],al
 004160AF    add         byte ptr [edx],cl
 004160B1    add         byte ptr [eax],ah
 004160B4    add         byte ptr [eax],al
 004160B6    add         byte ptr [eax],al
 004160B8    add         byte ptr [eax],al
 004160BA    add         byte ptr [eax],al
 004160BC    add         byte ptr [eax],al
 004160BE    add         byte ptr [eax],al
 004160C0    add         byte ptr [eax],al
 004160C2    add         byte ptr [eax],al
 004160C4    add         byte ptr [eax],al
 004160C6    add         byte ptr [eax],al
 004160C8    add         byte ptr [eax],al
 004160CA    add         byte ptr [eax],al
 004160CC    add         byte ptr [eax],al
 004160CE    adc         byte ptr [eax],al
 004160D0    add         byte ptr [eax],al
 004160D2    add         byte ptr [eax],al
 004160D4    add         byte ptr [eax],al
 004160D6    add         byte ptr [eax],al
 004160D8    add         byte ptr [eax],al
 004160DA    add         byte ptr [eax],al
 004160DC    add         byte ptr [eax],al
 004160DE    adc         byte ptr [eax],al
 004160E0    add         byte ptr [eax],al
 004160E2    add         byte ptr [eax],al
 004160E4    add         byte ptr [eax],al
 004160E6    add         byte ptr [eax],al
>004160E8    jo          004160EA
 004160EA    add         byte ptr [eax],0
 004160ED    add         byte ptr [eax],al
 004160EF    add         byte ptr [eax],al
 004160F1    add         byte ptr [eax],al
 004160F3    add         byte ptr [eax],al
 004160F5    add         byte ptr [eax],al
 004160F7    add         byte ptr [eax],al
 004160F9    add         byte ptr [eax],al
 004160FB    add         byte ptr [eax],al
 004160FD    add         byte ptr [eax],al
 004160FF    add         byte ptr [eax],al
 00416101    add         byte ptr [eax],al
 00416103    add         byte ptr [eax],al
 00416105    add         byte ptr [eax],al
 00416107    add         byte ptr [eax],al
 00416109    add         byte ptr [eax],al
 0041610B    add         byte ptr [eax],dl
 0041610D    add         byte ptr [eax],al
 0041610F    add         byte ptr [eax],al
 00416111    add         byte ptr [eax],al
 00416113    add         byte ptr [eax],al
 00416115    add         byte ptr [eax],dl
 00416117    add         byte ptr [eax],al
 00416119    add         byte ptr [eax],al
 0041611B    add         byte ptr [eax],al
 0041611D    add         byte ptr [eax],al
 0041611F    add         byte ptr [eax],al
 00416121    add         byte ptr [eax],al
 00416123    add         byte ptr [eax],al
 00416125    add         byte ptr [eax],al
 00416127    add         byte ptr [eax],al
 00416129    add         byte ptr [eax],al
 0041612B    add         byte ptr [eax],al
 0041612D    add         byte ptr [eax],al
 0041612F    add         byte ptr [eax+0A000],dl
 00416135    add         byte ptr [eax],al
 00416137    add         byte ptr [eax],al
 00416139    add         byte ptr [eax],al
 0041613B    add         byte ptr [eax],al
 0041613D    add         byte ptr [eax],al
 0041613F    add         byte ptr [eax],al
 00416141    add         byte ptr [eax],al
 00416143    add         byte ptr [eax],al
 00416145    add         byte ptr [eax],al
 00416147    add         byte ptr [eax],al
 00416149    add         byte ptr [eax],al
 0041614B    add         byte ptr [eax],al
 0041614D    add         byte ptr [eax],al
 0041614F    add         byte ptr [eax],al
 00416151    add         byte ptr [eax],al
 00416153    add         byte ptr [eax],al
 00416155    add         byte ptr [eax],al
 00416157    add         byte ptr [eax],al
 00416159    add         byte ptr [eax],al
 0041615B    add         byte ptr [eax],al
 0041615D    add         byte ptr [eax],al
 0041615F    add         byte ptr [eax+0C000],dh
 00416165    add         byte ptr [eax],al
 00416167    add         byte ptr [eax],al
 00416169    add         byte ptr [eax],al
 0041616B    add         byte ptr [eax],al
 0041616D    add         byte ptr [eax],al
 0041616F    add         byte ptr [eax],al
 00416171    add         byte ptr [eax],al
 00416173    add         byte ptr [eax],al
 00416175    add         byte ptr [eax],al
 00416177    add         byte ptr [eax],al
 00416179    add         byte ptr [eax],al
 0041617B    add         byte ptr [eax],al
 0041617D    add         byte ptr [eax],al
 0041617F    add         byte ptr [eax],dl
 00416181    add         byte ptr [eax],dl
 00416183    add         byte ptr [eax],al
 00416185    add         byte ptr [eax],dl
 00416187    add         byte ptr [eax],al
 00416189    add         byte ptr [eax],al
 0041618B    add         byte ptr [eax],al
 0041618D    add         byte ptr [eax],al
 0041618F    add         byte ptr [eax],al
 00416191    add         byte ptr [eax],al
 00416193    add         byte ptr [eax],al
 00416195    add         byte ptr [eax],al
 00416197    add         byte ptr [eax],al
 00416199    add         byte ptr [eax],al
 0041619B    add         byte ptr [eax],al
 0041619D    add         byte ptr [eax],al
 0041619F    add         byte ptr [eax],al
 004161A1    add         byte ptr [eax],al
 004161A3    add         byte ptr [eax],al
 004161A5    add         byte ptr [eax],al
 004161A7    add         byte ptr [eax],al
 004161A9    add         byte ptr [eax],al
 004161AB    add         byte ptr [edx],cl
 004161AD    add         byte ptr [eax],al
 004161AF    add         byte ptr [eax],al
 004161B1    add         byte ptr [eax],al
 004161B3    add         byte ptr [eax],al
 004161B5    add         byte ptr [eax],al
 004161B7    add         byte ptr [eax],al
 004161B9    add         byte ptr [eax],al
 004161BB    add         byte ptr [eax],al
 004161BD    add         al,dl
 004161BF    add         byte ptr [eax],al
 004161C1    add         byte ptr [eax],al
 004161C3    add         byte ptr [eax],al
 004161C5    add         byte ptr [eax],al
 004161C7    add         byte ptr [eax],al
 004161C9    add         byte ptr [eax],al
 004161CB    add         byte ptr [eax],al
 004161CD    add         byte ptr [eax],al
 004161CF    add         byte ptr [eax],al
 004161D1    add         byte ptr [eax],al
 004161D3    add         byte ptr [eax],dl
 004161D5    add         byte ptr [eax],dl
 004161D7    add         byte ptr [eax],al
 004161D9    add         byte ptr [eax],al
 004161DB    add         byte ptr [eax],al
 004161DD    add         byte ptr [eax],al
 004161DF    add         byte ptr [eax],al
 004161E1    add         byte ptr [eax],al
 004161E3    add         byte ptr [eax],al
 004161E5    add         byte ptr [eax],al
 004161E7    add         byte ptr [eax],al
 004161E9    add         byte ptr [eax],al
 004161EB    add         byte ptr [eax],al
 004161ED    add         byte ptr [eax],dl
 004161EF    add         byte ptr [eax],al
 004161F1    add         byte ptr [eax],al
 004161F3    add         byte ptr [eax],al
 004161F5    add         byte ptr [eax],al
 004161F7    add         byte ptr [eax],al
 004161F9    add         byte ptr [eax],dl
 004161FB    add         byte ptr [eax],al
 004161FD    add         byte ptr [eax],al
 004161FF    add         byte ptr [eax],al
 00416201    add         byte ptr [eax],al
 00416203    add         byte ptr [eax],al
 00416205    add         byte ptr [eax],al
 00416207    add         byte ptr [eax],al
 00416209    add         byte ptr [eax],al
 0041620B    add         byte ptr [eax],dl
 0041620D    add         byte ptr [eax],dl
 0041620F    add         byte ptr [eax],al
 00416211    add         byte ptr [eax],al
 00416213    add         byte ptr [eax],al
 00416215    add         byte ptr [eax],al
 00416217    add         byte ptr [eax],al
 00416219    add         byte ptr [eax],al
 0041621B    add         byte ptr [eax],al
 0041621D    add         byte ptr [eax],al
 0041621F    add         byte ptr [eax],al
 00416221    add         byte ptr [eax],al
 00416223    add         byte ptr [eax],al
 00416225    add         byte ptr [eax],al
 00416227    add         byte ptr [eax],al
 00416229    add         byte ptr [eax],al
 0041622B    add         byte ptr [eax],al
 0041622D    add         byte ptr [eax],al
 0041622F    add         byte ptr [eax],al
 00416231    add         al,ah
 00416233    add         byte ptr [eax],dl
 00416235    add         byte ptr [eax],al
 00416237    add         byte ptr [eax],al
 00416239    add         byte ptr [eax],al
 0041623B    add         byte ptr [eax],al
 0041623D    add         byte ptr [eax],al
 0041623F    add         byte ptr [eax],al
 00416241    add         byte ptr [eax],al
 00416243    add         byte ptr [eax],al
 00416245    add         byte ptr [eax],al
 00416247    add         byte ptr [eax],al
 00416249    add         byte ptr [eax],al
 0041624B    add         byte ptr [eax],al
 0041624D    add         al,dh
 0041624F    add         byte ptr [eax],al
 00416251    add         dword ptr [eax],eax
 00416253    add         dword ptr [eax],edx
 00416255    add         dword ptr [eax],eax
 00416257    add         byte ptr [eax],al
 00416259    add         byte ptr [eax],al
 0041625B    add         byte ptr [eax],al
 0041625D    add         byte ptr [eax],al
 0041625F    add         byte ptr [eax],al
 00416261    add         byte ptr [eax],al
 00416263    add         byte ptr [eax],al
 00416265    add         byte ptr [eax],al
 00416267    add         byte ptr [eax],al
 00416269    add         byte ptr [eax],al
 0041626B    add         byte ptr [eax],al
 0041626D    add         byte ptr [eax],al
 0041626F    add         byte ptr [eax],ah
 00416271    add         dword ptr [eax],esi
 00416273    add         dword ptr [ecx+eax],ebp
 00416276    inc         eax
 00416277    add         dword ptr [eax],eax
 00416279    add         byte ptr [eax],al
 0041627B    add         byte ptr [eax],al
 0041627D    add         byte ptr [eax],al
 0041627F    add         byte ptr [eax+1],dl
 00416282    pushad
 00416283    add         dword ptr [eax],eax
 00416285    add         byte ptr [eax],al
 00416287    add         byte ptr [eax],al
 00416289    add         byte ptr [eax],al
 0041628B    add         byte ptr [eax],al
 0041628D    add         byte ptr [eax],al
 0041628F    add         byte ptr [eax],al
 00416291    add         byte ptr [ebx-7FFE9000],dl
 00416297    add         dword ptr [eax],eax
 00416299    add         byte ptr [eax],al
 0041629B    add         byte ptr [eax],al
 0041629D    add         byte ptr [eax],al
 0041629F    add         byte ptr [eax],al
 004162A1    add         byte ptr [eax],al
 004162A3    add         byte ptr [eax],al
 004162A5    add         byte ptr [eax],al
 004162A7    add         byte ptr [eax],al
 004162A9    add         byte ptr [eax],al
 004162AB    add         byte ptr [eax],al
 004162AD    add         byte ptr [eax],al
 004162AF    add         byte ptr [eax],al
 004162B1    add         byte ptr [eax],al
 004162B3    add         byte ptr [eax],al
 004162B5    add         byte ptr [eax],al
 004162B7    add         byte ptr [eax],al
 004162B9    add         byte ptr [eax],al
 004162BB    add         byte ptr [eax],al
 004162BD    add         byte ptr [eax],al
 004162BF    add         byte ptr [eax],al
 004162C1    add         byte ptr [eax+1A001],dl
 004162C7    add         byte ptr [eax+1C001],dh
 004162CD    add         byte ptr [eax],al
 004162CF    add         byte ptr [eax],al
 004162D1    add         byte ptr [eax],al
 004162D3    add         byte ptr [eax],al
 004162D5    add         byte ptr [eax],al
 004162D7    add         byte ptr [eax],al
 004162D9    add         byte ptr [eax],al
 004162DB    add         byte ptr [eax],al
 004162DD    add         byte ptr [eax],al
 004162DF    add         byte ptr [eax],al
 004162E1    add         byte ptr [eax],al
 004162E3    add         byte ptr [eax],al
 004162E5    add         byte ptr [eax],al
 004162E7    add         byte ptr [eax],al
 004162E9    add         byte ptr [eax],al
 004162EB    add         byte ptr [eax],al
 004162ED    add         byte ptr [eax],al
 004162EF    add         byte ptr [eax],al
 004162F1    add         byte ptr [eax],al
 004162F3    add         byte ptr [eax],al
 004162F5    add         al,dl
 004162F7    add         dword ptr [eax],eax
 004162F9    add         byte ptr [eax],al
 004162FB    add         byte ptr [eax],al
 004162FD    add         byte ptr [eax],al
 004162FF    add         byte ptr [eax],al
 00416301    add         byte ptr [eax],al
 00416303    add         byte ptr [eax],al
 00416305    add         byte ptr [eax],al
 00416307    add         byte ptr [edx+1],bh
 0041630A    add         byte ptr [eax],al
 0041630C    add         byte ptr [eax],al
 0041630E    loopne      00416311
 00416310    add         byte ptr [eax],al
 00416312    add         byte ptr [eax],al
>00416314    jp          00416317
 00416316    add         byte ptr [eax],al
 00416318    add         byte ptr [eax],al
 0041631A    lock add    dword ptr [eax],eax
 0041631D    add         byte ptr [eax],al
 0041631F    add         byte ptr [eax],al
 00416321    add         byte ptr [eax],al
 00416323    add         byte ptr [eax],al
 00416325    add         byte ptr [eax],al
 00416327    add         byte ptr [eax],dl
 00416329    add         byte ptr [eax],al
 0041632B    add         byte ptr [eax],al
 0041632D    add         byte ptr [eax],al
 0041632F    add         byte ptr [eax],al
 00416331    add         byte ptr [eax],al
 00416333    add         byte ptr [eax],al
 00416335    add         byte ptr [eax],al
 00416337    add         byte ptr [eax],al
 00416339    add         byte ptr [eax],al
 0041633B    add         byte ptr [eax],al
 0041633D    add         byte ptr [eax],al
 0041633F    add         byte ptr [eax],al
 00416341    add         al,byte ptr [eax]
 00416343    add         byte ptr [eax],al
 00416345    add         byte ptr [eax],al
 00416347    add         byte ptr [eax],al
 00416349    add         byte ptr [eax],dl
 0041634B    add         al,byte ptr [eax]
 0041634D    add         byte ptr [eax],al
 0041634F    add         byte ptr [eax],al
 00416351    add         byte ptr [eax],al
 00416353    add         byte ptr [eax],al
 00416355    add         byte ptr [eax],al
 00416357    add         byte ptr [eax],al
 00416359    add         byte ptr [eax],al
 0041635B    add         byte ptr [eax],al
 0041635D    add         byte ptr [eax],dl
 0041635F    add         byte ptr [eax],al
 00416361    add         byte ptr [eax],al
 00416363    add         byte ptr [eax],dl
 00416365    add         byte ptr [eax],al
 00416367    add         byte ptr [eax],al
 00416369    add         byte ptr [eax],al
 0041636B    add         byte ptr [eax],al
 0041636D    add         byte ptr [eax],al
 0041636F    add         byte ptr [eax],al
 00416371    add         byte ptr [eax],al
 00416373    add         byte ptr [eax],al
 00416375    add         byte ptr [eax],al
 00416377    add         byte ptr [eax],al
 00416379    add         byte ptr [eax],al
 0041637B    add         byte ptr [eax],al
 0041637D    add         byte ptr [eax],dl
 0041637F    add         byte ptr [eax],al
 00416381    add         byte ptr [eax],al
 00416383    add         byte ptr [eax],al
 00416385    add         byte ptr [eax],al
 00416387    add         byte ptr [eax],al
 00416389    add         byte ptr [eax],al
 0041638B    add         byte ptr [eax],al
 0041638D    add         byte ptr [eax],dl
 0041638F    add         byte ptr [eax],al
 00416391    add         byte ptr [eax],al
 00416393    add         byte ptr [eax],al
 00416395    add         byte ptr [eax],al
 00416397    add         byte ptr [eax],al
 00416399    add         byte ptr [eax],al
 0041639B    add         byte ptr [eax],al
 0041639D    add         byte ptr [eax],al
 0041639F    add         byte ptr [eax],al
 004163A1    add         byte ptr [eax],al
 004163A3    add         byte ptr [eax],al
 004163A5    add         byte ptr [eax],al
 004163A7    add         byte ptr [eax],al
 004163A9    add         byte ptr [eax],al
 004163AB    add         byte ptr [eax],al
 004163AD    add         byte ptr [eax],al
 004163AF    add         byte ptr [eax],al
 004163B1    add         byte ptr [eax],al
 004163B3    add         byte ptr [eax],al
 004163B5    add         byte ptr [eax],al
 004163B7    add         byte ptr [eax],al
 004163B9    add         byte ptr [eax],al
 004163BB    add         byte ptr [eax],al
 004163BD    add         byte ptr [eax],al
 004163BF    add         byte ptr [eax],al
 004163C1    add         byte ptr [eax],dl
 004163C3    add         byte ptr [edx+30022000],dl
 004163C9    add         al,byte ptr [eax+2]
 004163CC    push        eax
 004163CD    add         ah,byte ptr [eax+2]
>004163D0    jo          004163D4
 004163D2    add         byte ptr [edx],90
 004163D5    add         al,byte ptr [eax]
 004163D7    add         byte ptr [eax],al
 004163D9    add         byte ptr [eax],al
 004163DB    add         byte ptr [eax],al
 004163DD    add         byte ptr [eax],al
 004163DF    add         byte ptr [eax],al
 004163E1    add         byte ptr [eax],al
 004163E3    add         byte ptr [eax],al
 004163E5    add         byte ptr [eax],al
 004163E7    add         byte ptr [eax-4FFFFFFE],ah
 004163ED    add         al,byte ptr [eax]
 004163EF    add         byte ptr [eax],al
 004163F1    add         byte ptr [eax],al
 004163F3    add         byte ptr [eax],al
 004163F5    add         byte ptr [eax],al
 004163F7    add         byte ptr [eax],al
 004163F9    add         byte ptr [eax],al
 004163FB    add         byte ptr [eax],al
 004163FD    add         al,al
 004163FF    add         al,byte ptr [eax]
 00416401    add         byte ptr [eax],al
 00416403    add         byte ptr [eax],al
 00416405    add         byte ptr [eax],al
 00416407    add         byte ptr [eax],al
 00416409    add         byte ptr [eax],al
 0041640B    add         byte ptr [eax],al
 0041640D    add         byte ptr [eax],al
 0041640F    add         byte ptr [eax],al
 00416411    add         byte ptr [eax],al
 00416413    add         byte ptr [eax],al
 00416415    add         byte ptr [eax],al
 00416417    add         byte ptr [eax],dl
 00416419    add         byte ptr [eax],al
 0041641B    add         byte ptr [eax],al
 0041641D    add         byte ptr [eax],al
 0041641F    add         byte ptr [eax],al
 00416421    add         byte ptr [eax],al
 00416423    add         byte ptr [eax],al
 00416425    add         byte ptr [eax],al
 00416427    add         byte ptr [eax],al
 00416429    add         byte ptr [eax],al
 0041642B    add         byte ptr [eax],al
 0041642D    add         al,dl
 0041642F    add         al,byte ptr [eax]
 00416431    add         byte ptr [eax],al
 00416433    add         byte ptr [eax],al
 00416435    add         byte ptr [eax],al
 00416437    add         byte ptr [eax],al
 00416439    add         byte ptr [eax],al
 0041643B    add         byte ptr [eax],al
 0041643D    add         byte ptr [eax],al
 0041643F    add         byte ptr [eax],al
 00416441    add         byte ptr [eax],al
 00416443    add         byte ptr [eax],al
 00416445    add         al,ah
 00416447    add         al,byte ptr [eax]
 00416449    add         byte ptr [eax],al
 0041644B    add         byte ptr [eax],al
 0041644D    add         byte ptr [eax],al
 0041644F    add         byte ptr [eax],al
 00416451    add         byte ptr [eax],al
 00416453    add         byte ptr [eax],al
 00416455    add         byte ptr [eax],al
 00416457    add         byte ptr [eax],al
 00416459    add         byte ptr [eax],al
 0041645B    add         byte ptr [eax],al
 0041645D    add         byte ptr [eax],al
 0041645F    add         byte ptr [eax],al
 00416461    add         byte ptr [eax],al
 00416463    add         byte ptr [eax],al
 00416465    add         byte ptr [eax],al
 00416467    add         byte ptr [eax],al
 00416469    add         byte ptr [eax],al
 0041646B    add         al,dh
 0041646D    add         al,byte ptr [eax]
 0041646F    add         byte ptr [eax],al
 00416471    add         byte ptr [eax],al
 00416473    add         eax,dword ptr [eax]
 00416475    add         byte ptr [eax],al
 00416477    add         byte ptr [eax],al
 00416479    add         byte ptr [eax],al
 0041647B    add         byte ptr [eax],al
 0041647D    add         byte ptr [eax],al
 0041647F    add         byte ptr [eax],al
 00416481    add         byte ptr [eax],al
 00416483    add         byte ptr [eax],al
 00416485    add         byte ptr [eax],al
 00416487    add         byte ptr [eax],al
 00416489    add         byte ptr [eax],al
 0041648B    add         byte ptr [eax],al
 0041648D    add         byte ptr [eax],dl
 0041648F    add         eax,dword ptr [eax]
 00416491    add         byte ptr [eax],dl
 00416493    add         eax,dword ptr [eax]
 00416495    add         byte ptr [eax],al
 00416497    add         byte ptr [eax],al
 00416499    add         byte ptr [eax],al
 0041649B    add         byte ptr [eax],al
 0041649D    add         byte ptr [eax],al
 0041649F    add         byte ptr [eax],al
 004164A1    add         byte ptr [eax],al
 004164A3    add         byte ptr [eax],al
 004164A5    add         byte ptr [eax],al
 004164A7    add         byte ptr [eax],al
 004164A9    add         byte ptr [eax],al
 004164AB    add         byte ptr [eax],al
 004164AD    add         byte ptr [eax],al
 004164AF    add         byte ptr [ecx+32000],bl
 004164B5    add         byte ptr [eax],al
 004164B7    add         byte ptr [eax],al
 004164B9    add         byte ptr [eax],al
 004164BB    add         byte ptr [eax],al
 004164BD    add         byte ptr [eax],al
 004164BF    add         byte ptr [eax],al
 004164C1    add         byte ptr [eax],al
 004164C3    add         byte ptr [eax],dh
 004164C5    add         eax,dword ptr [eax+3]
 004164C8    push        eax
 004164C9    add         esp,dword ptr [eax+3]
>004164CC    jo          004164D1
 004164CE    add         byte ptr [ebx],90
 004164D1    add         eax,dword ptr [eax]
 004164D3    add         byte ptr [eax],al
 004164D5    add         byte ptr [eax],al
 004164D7    add         byte ptr [eax],al
 004164D9    add         byte ptr [eax],al
 004164DB    add         byte ptr [eax],al
 004164DD    add         byte ptr [eax],al
 004164DF    add         byte ptr [eax],al
 004164E1    add         byte ptr [eax],al
 004164E3    add         byte ptr [eax],al
 004164E5    add         byte ptr [eax],al
 004164E7    add         byte ptr [eax],al
 004164E9    add         byte ptr [eax],al
 004164EB    add         byte ptr [eax],al
 004164ED    add         byte ptr [eax],al
 004164EF    add         byte ptr [ecx+3A000],bl
 004164F5    add         byte ptr [eax],al
 004164F7    add         byte ptr [eax],al
 004164F9    add         byte ptr [eax],al
 004164FB    add         byte ptr [eax],al
 004164FD    add         byte ptr [eax],al
 004164FF    add         byte ptr [eax],al
 00416501    add         byte ptr [eax],al
 00416503    add         byte ptr [eax],al
 00416505    add         byte ptr [eax],al
 00416507    add         byte ptr [eax],al
 00416509    add         byte ptr [eax],al
 0041650B    add         byte ptr [eax],al
 0041650D    add         byte ptr [eax],al
 0041650F    add         byte ptr [eax],al
 00416511    add         byte ptr [eax],al
 00416513    add         byte ptr [eax],al
 00416515    add         byte ptr [eax],al
 00416517    add         byte ptr [eax],al
 00416519    add         byte ptr [eax],al
 0041651B    add         byte ptr [edx],al
 0041651D    add         byte ptr [eax-4DFC3FFD],dh
 00416523    add         edx,eax
 00416525    add         eax,dword ptr [eax]
 00416527    add         byte ptr [eax],al
 00416529    add         byte ptr [eax],al
 0041652B    add         byte ptr [eax],al
 0041652D    add         byte ptr [eax],al
 0041652F    add         byte ptr [eax],al
 00416531    add         byte ptr [eax],al
 00416533    add         byte ptr [eax],al
 00416535    add         byte ptr [eax],al
 00416537    add         byte ptr [eax],al
 00416539    add         byte ptr [eax],al
 0041653B    add         byte ptr [eax],al
 0041653D    add         byte ptr [eax],al
 0041653F    add         byte ptr [eax],al
 00416541    add         byte ptr [eax],al
 00416543    add         byte ptr [eax],al
 00416545    add         byte ptr [eax],al
 00416547    add         byte ptr [eax],al
 00416549    add         al,dh
 0041654B    mov         edi,0
 00416550    add         byte ptr [eax],al
 00416552    lock mov    edi,0
 00416558    add         byte ptr [eax],al
 0041655A    lock mov    edi,0
 00416560    add         byte ptr [eax],al
 00416562    lock mov    edi,0
 00416568    add         byte ptr [eax],al
 0041656A    lock mov    edi,0
 00416570    add         byte ptr [eax],al
 00416572    lock mov    edi,0
 00416578    add         byte ptr [eax],al
 0041657A    lock mov    edi,0
 00416580    add         byte ptr [eax],al
 00416582    lock mov    edi,0
 00416588    add         byte ptr [eax],al
 0041658A    lock mov    edi,0
 00416590    add         byte ptr [eax],al
 00416592    lock mov    edi,0
 00416598    add         byte ptr [eax],al
 0041659A    lock mov    edi,0
 004165A0    add         byte ptr [eax],al
 004165A2    lock mov    edi,0
 004165A8    add         byte ptr [eax],al
 004165AA    lock mov    edi,0
 004165B0    add         byte ptr [eax],al
 004165B2    lock mov    edi,0
 004165B8    add         byte ptr [eax],al
 004165BA    lock mov    edi,0
 004165C0    add         byte ptr [eax],al
 004165C2    lock mov    edi,0
 004165C8    add         byte ptr [eax],al
 004165CA    add         byte ptr [eax],al
 004165CC    add         byte ptr [eax],al
 004165CE    add         byte ptr [eax],al
 004165D0    add         byte ptr [eax],al
 004165D2    lock aas
 004165D4    add         byte ptr [eax],al
 004165D6    add         byte ptr [eax],al
 004165D8    add         byte ptr [eax],al
 004165DA    add         byte ptr [eax],al
 004165DD    add         byte ptr [eax],al
 004165DF    add         byte ptr [eax],al
 004165E1    add         byte ptr [eax],cl
 004165E3    inc         eax
 004165E4    add         byte ptr [eax],al
 004165E6    add         byte ptr [eax],al
 004165E8    add         byte ptr [eax],al
 004165EA    adc         byte ptr [eax],al
 004165ED    add         byte ptr [eax],al
 004165EF    add         byte ptr [eax],al
 004165F1    add         byte ptr [eax+eax*2],dl
 004165F4    add         byte ptr [eax],al
 004165F6    add         byte ptr [eax],al
 004165F8    add         byte ptr [eax],al
 004165FA    sbb         byte ptr [eax],al
 004165FD    add         byte ptr [eax],al
 004165FF    add         byte ptr [eax],al
 00416601    add         byte ptr [eax+eax*2],bl
 00416604    add         byte ptr [eax],al
 00416606    add         byte ptr [eax],al
 00416608    add         byte ptr [eax],al
 0041660A    and         byte ptr [eax],al
 0041660D    add         byte ptr [eax],al
 0041660F    add         byte ptr [eax],al
 00416611    add         byte ptr [edx],ah
 00416613    inc         eax
 00416614    add         byte ptr [eax],al
 00416616    add         byte ptr [eax],al
 00416618    add         byte ptr [eax],al
 0041661A    lock mov    edi,0
 00416620    add         byte ptr [eax],al
 00416622    lock mov    edi,0
 00416628    add         byte ptr [eax],al
 0041662A    lock mov    edi,0
 00416630    add         byte ptr [eax],al
 00416632    lock mov    edi,0
 00416638    add         byte ptr [eax],al
 0041663A    lock mov    edi,0
 00416640    add         byte ptr [eax],al
 00416642    lock mov    edi,0
 00416648    add         byte ptr [eax],al
 0041664A    lock mov    edi,0
 00416650    add         byte ptr [eax],al
 00416652    lock mov    edi,0
 00416658    add         byte ptr [eax],al
 0041665A    add         byte ptr [eax],al
 0041665D    add         byte ptr [eax],al
 0041665F    add         byte ptr [eax],al
 00416661    add         byte ptr [eax],cl
 00416663    inc         eax
 00416664    add         byte ptr [eax],al
 00416666    add         byte ptr [eax],al
 00416668    add         byte ptr [eax],al
 0041666A    lock mov    edi,0
 00416670    add         byte ptr [eax],al
 00416672    lock mov    edi,0
 00416678    add         byte ptr [eax],al
 0041667A    lock mov    edi,0
 00416680    add         byte ptr [eax],al
 00416682    lock mov    edi,0
 00416688    add         byte ptr [eax],al
 0041668A    lock mov    edi,0
 00416690    add         byte ptr [eax],al
 00416692    lock aas
 00416694    add         byte ptr [eax],al
 00416696    add         byte ptr [eax],al
 00416698    add         byte ptr [eax],al
 0041669A    lock mov    edi,0
 004166A0    add         byte ptr [eax],al
 004166A2    lock mov    edi,0
 004166A8    add         byte ptr [eax],al
 004166AA    sar         byte ptr [edi],1
 004166AC    add         byte ptr [eax],al
 004166AE    add         byte ptr [eax],al
 004166B0    add         byte ptr [eax],al
 004166B2    loopne      004166F3
 004166B4    add         byte ptr [eax],al
 004166B6    add         byte ptr [eax],al
 004166B8    add         byte ptr [eax],al
 004166BA    call        004166FE
 004166BF    add         byte ptr [eax],al
 004166C1    add         al,dh
 004166C3    mov         edi,0
 004166C8    add         byte ptr [eax],al
 004166CA    lock mov    edi,0
 004166D0    add         byte ptr [eax],al
 004166D2    lock mov    edi,0
 004166D8    add         byte ptr [eax],al
 004166DA    lock mov    edi,0
 004166E0    add         byte ptr [eax],al
 004166E2    lock mov    edi,0
 004166E8    add         byte ptr [eax],al
 004166EA    mov         al,3F
 004166EC    add         byte ptr [eax],al
 004166EE    add         byte ptr [eax],al
 004166F0    add         byte ptr [eax],al
 004166F2    sar         byte ptr [edi],0
 004166F5    add         byte ptr [eax],al
 004166F7    add         byte ptr [eax],al
 004166F9    add         al,cl
 004166FB    aas
 004166FC    add         byte ptr [eax],al
 004166FE    add         byte ptr [eax],al
 00416700    add         byte ptr [eax],al
 00416702    sar         byte ptr [edi],1
 00416704    add         byte ptr [eax],al
 00416706    add         byte ptr [eax],al
 00416708    add         byte ptr [eax],al
 0041670A    call        0041674E
 0041670F    add         byte ptr [eax],al
 00416711    add         byte ptr [eax],dh
 00416713    inc         eax
 00416714    add         byte ptr [eax],al
 00416716    add         byte ptr [eax],al
 00416718    add         byte ptr [eax],al
 0041671A    lock mov    edi,0
 00416720    add         byte ptr [eax],al
 00416722    lock mov    edi,0
 00416728    add         byte ptr [eax],al
 0041672A    lock mov    edi,0
 00416730    add         byte ptr [eax],al
 00416732    lock mov    edi,0
 00416738    add         byte ptr [eax],al
 0041673A    lock mov    edi,0
 00416740    add         byte ptr [eax],al
 00416742    lock mov    edi,0
 00416748    add         byte ptr [eax],al
 0041674A    and         al,40
 0041674C    add         byte ptr [eax],al
 0041674E    add         byte ptr [eax],al
 00416750    add         byte ptr [eax],al
 00416752    pop         ecx
 00416753    inc         eax
 00416754    add         byte ptr [eax],al
 00416756    add         byte ptr [eax],al
 00416758    add         byte ptr [eax-71],al
 0041675B    inc         eax
 0041675C    add         byte ptr [eax],al
 0041675E    add         byte ptr [eax],al
 00416760    add         byte ptr [eax],al
 00416762    lock mov    edi,0
 00416768    add         byte ptr [eax],al
 0041676A    lock mov    edi,0
 00416770    add         byte ptr [eax],al
 00416772    lock mov    edi,0
 00416778    add         byte ptr [eax],al
 0041677A    lock mov    edi,0
 00416780    add         byte ptr [eax],al
 00416782    lock mov    edi,0
 00416788    add         byte ptr [eax],al
 0041678A    lock mov    edi,0
 00416790    add         byte ptr [eax],al
 00416792    lock mov    edi,0
 00416798    add         byte ptr [eax],al
 0041679A    lock mov    edi,0
 004167A0    add         byte ptr [eax],al
 004167A2    lock mov    edi,0
 004167A8    add         byte ptr [eax],al
 004167AA    lock mov    edi,0
 004167B0    add         byte ptr [eax],al
 004167B2    lock mov    edi,0
 004167B8    add         byte ptr [eax],al
 004167BA    lock mov    edi,0
 004167C0    add         byte ptr [eax],al
 004167C2    lock mov    edi,0
 004167C8    add         byte ptr [eax],al
 004167CA    lock mov    edi,0
 004167D0    add         byte ptr [eax],al
 004167D2    lock mov    edi,0
 004167D8    add         byte ptr [eax],al
 004167DA    lock mov    edi,0
 004167E0    add         byte ptr [eax],al
 004167E2    lock mov    edi,0
 004167E8    add         byte ptr [eax],al
 004167EA    lock mov    edi,0
 004167F0    add         byte ptr [eax],al
 004167F2    lock mov    edi,0
 004167F8    add         byte ptr [eax],al
 004167FA    lock mov    edi,0
 00416800    add         byte ptr [eax],al
 00416802    lock mov    edi,0
 00416808    add         byte ptr [eax],al
 0041680A    add         byte ptr [eax],al
 0041680C    add         byte ptr [eax],al
 0041680E    add         byte ptr [eax],al
 00416810    add         byte ptr [eax],al
 00416812    lock aas
 00416814    add         byte ptr [eax],al
 00416816    add         byte ptr [eax],al
 00416818    add         byte ptr [eax],al
 0041681A    add         byte ptr [eax],al
 0041681D    add         byte ptr [eax],al
 0041681F    add         byte ptr [eax],al
 00416821    add         byte ptr [eax],cl
 00416823    inc         eax
 00416824    add         byte ptr [eax],al
 00416826    add         byte ptr [eax],al
 00416828    add         byte ptr [eax],al
 0041682A    lock aas
 0041682C    add         byte ptr [eax],al
 0041682E    add         byte ptr [eax],al
 00416830    add         byte ptr [eax],al
 00416832    add         byte ptr [eax],al
 00416835    add         byte ptr [eax],al
 00416837    add         byte ptr [eax],al
 00416839    add         byte ptr [eax],cl
 0041683B    inc         eax
 0041683C    add         byte ptr [eax],al
 0041683E    add         byte ptr [eax],al
 00416840    add         byte ptr [eax],al
 00416842    lock mov    edi,0
 00416848    add         byte ptr [eax],al
 0041684A    and         al,40
 0041684C    add         byte ptr [eax],al
 0041684E    add         byte ptr [eax],al
 00416850    add         byte ptr [eax],al
 00416852    pop         ecx
 00416853    inc         eax
 00416854    add         byte ptr [eax],al
 00416856    add         byte ptr [eax],al
 00416858    add         byte ptr [eax-71],al
 0041685B    inc         eax
 0041685C    add         byte ptr [eax],al
 0041685E    add         byte ptr [eax],al
 00416860    add         byte ptr [eax],al
 00416862    sar         byte ptr [edi],1
 00416864    add         byte ptr [eax],al
 00416866    add         byte ptr [eax],al
 00416868    add         byte ptr [eax],al
 0041686A    loopne      004168AB
 0041686C    add         byte ptr [eax],al
 0041686E    add         byte ptr [eax],al
 00416870    add         byte ptr [eax],al
 00416872    call        004168B6
 00416877    add         byte ptr [eax],al
 00416879    add         al,dh
 0041687B    mov         edi,0
 00416880    add         byte ptr [eax],al
 00416882    lock mov    edi,0
 00416888    add         byte ptr [eax],al
 0041688A    lock mov    edi,0
 00416890    add         byte ptr [eax],al
 00416892    lock mov    edi,0
 00416898    add         byte ptr [eax],al
 0041689A    lock mov    edi,0
 004168A0    add         byte ptr [eax],al
 004168A2    lock mov    edi,0
 004168A8    add         byte ptr [eax],al
 004168AA    lock mov    edi,0
 004168B0    add         byte ptr [eax],al
 004168B2    lock mov    edi,0
 004168B8    add         byte ptr [eax],al
 004168BA    lock mov    edi,0
 004168C0    add         byte ptr [eax],al
 004168C2    lock mov    edi,0
 004168C8    add         byte ptr [eax],al
 004168CA    add         byte ptr [eax],al
 004168CC    add         byte ptr [eax],al
 004168CE    add         byte ptr [eax],al
 004168D0    add         byte ptr [eax],al
 004168D2    lock aas
 004168D4    add         byte ptr [eax],al
 004168D6    add         byte ptr [eax],al
 004168D8    add         byte ptr [eax],al
 004168DA    add         byte ptr [eax],al
 004168DD    add         byte ptr [eax],al
 004168DF    add         byte ptr [eax],al
 004168E1    add         byte ptr [eax],cl
 004168E3    inc         eax
 004168E4    add         byte ptr [eax],al
 004168E6    add         byte ptr [eax],al
 004168E8    add         byte ptr [eax],al
 004168EA    adc         byte ptr [eax],al
 004168ED    add         byte ptr [eax],al
 004168EF    add         byte ptr [eax],al
 004168F1    add         byte ptr [eax+eax*2],dl
 004168F4    add         byte ptr [eax],al
 004168F6    add         byte ptr [eax],al
 004168F8    add         byte ptr [eax],al
 004168FA    sbb         byte ptr [eax],al
 004168FD    add         byte ptr [eax],al
 004168FF    add         byte ptr [eax],al
 00416901    add         byte ptr [eax+eax*2],bl
 00416904    add         byte ptr [eax],al
 00416906    add         byte ptr [eax],al
 00416908    add         byte ptr [eax],al
 0041690A    and         byte ptr [eax],al
 0041690D    add         byte ptr [eax],al
 0041690F    add         byte ptr [eax],al
 00416911    add         byte ptr [edx],ah
 00416913    inc         eax
 00416914    add         byte ptr [eax],al
 00416916    add         byte ptr [eax],al
 00416918    add         byte ptr [eax],al
 0041691A    loopne      0041695B
 0041691C    add         byte ptr [eax],al
 0041691E    add         byte ptr [eax],al
 00416920    add         byte ptr [eax],al
 00416922    clc
 00416923    aas
 00416924    add         byte ptr [eax],al
 00416926    add         byte ptr [eax],al
 00416928    add         byte ptr [eax],al
 0041692A    add         al,40
 0041692C    add         byte ptr [eax],al
 0041692E    add         byte ptr [eax],al
 00416930    add         byte ptr [eax],al
 00416932    or          al,40
 00416934    add         byte ptr [eax],al
 00416936    add         byte ptr [eax],al
 00416938    add         byte ptr [eax],al
 0041693A    adc         al,byte ptr [eax]
 0041693D    add         byte ptr [eax],al
 0041693F    add         byte ptr [eax],al
 00416941    add         byte ptr [esi],dl
 00416943    inc         eax
 00416944    add         byte ptr [eax],al
 00416946    add         byte ptr [eax],al
 00416948    add         byte ptr [eax],al
 0041694A    sbb         al,byte ptr [eax]
 0041694D    add         byte ptr [eax],al
 0041694F    add         byte ptr [eax],al
 00416951    add         byte ptr [esi],bl
 00416953    inc         eax
 00416954    add         byte ptr [eax],al
 00416956    add         byte ptr [eax],al
 00416958    add         byte ptr [eax],al
 0041695A    and         dword ptr [eax],eax
 0041695D    add         byte ptr [eax],al
 0041695F    add         byte ptr [eax],al
 00416961    add         al,ah
 00416963    mov         edi,0
 00416968    add         byte ptr [eax],al
 0041696A    lock mov    edi,0
 00416970    add         byte ptr [eax],al
 00416972    lock mov    edi,0
 00416978    add         byte ptr [eax],al
 0041697A    lock mov    edi,0
 00416980    add         byte ptr [eax],al
 00416982    lock mov    edi,0
 00416988    add         byte ptr [eax],al
 0041698A    lock mov    edi,0
 00416990    add         byte ptr [eax],al
 00416992    lock mov    edi,0
 00416998    add         byte ptr [eax],al
 0041699A    lock mov    edi,0
 004169A0    add         byte ptr [eax],al
 004169A2    lock mov    edi,0
 004169A8    add         byte ptr [eax],al
 004169AA    lock mov    edi,0
 004169B0    add         byte ptr [eax],al
 004169B2    lock mov    edi,0
 004169B8    add         byte ptr [eax],al
 004169BA    lock mov    edi,0
 004169C0    add         byte ptr [eax],al
 004169C2    lock mov    edi,0
 004169C8    add         byte ptr [eax],al
 004169CA    lock mov    edi,0
 004169D0    add         byte ptr [eax],al
 004169D2    lock mov    edi,0
 004169D8    add         byte ptr [eax],al
 004169DA    lock mov    edi,0
 004169E0    add         byte ptr [eax],al
 004169E2    lock mov    edi,0
 004169E8    add         byte ptr [eax],al
 004169EA    lock mov    edi,0
 004169F0    add         byte ptr [eax],al
 004169F2    lock mov    edi,0
 004169F8    add         byte ptr [eax],al
 004169FA    lock mov    edi,0
 00416A00    add         byte ptr [eax],al
 00416A02    lock mov    edi,0
 00416A08    add         byte ptr [eax],al
 00416A0A    lock mov    edi,0
 00416A10    add         byte ptr [eax],al
 00416A12    lock aas
 00416A14    add         byte ptr [eax],al
 00416A16    add         byte ptr [eax],al
 00416A18    add         byte ptr [eax],al
 00416A1A    add         byte ptr [eax],al
 00416A1D    add         byte ptr [eax],al
 00416A1F    add         byte ptr [eax],al
 00416A21    add         byte ptr [eax],cl
 00416A23    inc         eax
 00416A24    add         byte ptr [eax],al
 00416A26    add         byte ptr [eax],al
 00416A28    add         byte ptr [eax],al
 00416A2A    adc         byte ptr [eax],al
 00416A2D    add         byte ptr [eax],al
 00416A2F    add         byte ptr [eax],al
 00416A31    add         byte ptr [eax+eax*2],dl
 00416A34    add         byte ptr [eax],al
 00416A36    add         byte ptr [eax],al
 00416A38    add         byte ptr [eax],al
 00416A3A    sbb         byte ptr [eax],al
 00416A3D    add         byte ptr [eax],al
 00416A3F    add         byte ptr [eax],al
 00416A41    add         byte ptr [eax+eax*2],bl
 00416A44    add         byte ptr [eax],al
 00416A46    add         byte ptr [eax],al
 00416A48    add         byte ptr [eax],al
 00416A4A    and         byte ptr [eax],al
 00416A4D    add         byte ptr [eax],al
 00416A4F    add         byte ptr [eax],al
 00416A51    add         byte ptr [edx],ah
 00416A53    inc         eax
 00416A54    add         byte ptr [eax],al
 00416A56    add         byte ptr [eax],al
 00416A58    add         byte ptr [eax],al
 00416A5A    and         al,40
 00416A5C    add         byte ptr [eax],al
 00416A5E    add         byte ptr [eax],al
 00416A60    add         byte ptr [eax],al
 00416A62    xor         al,40
 00416A64    add         byte ptr [eax],al
 00416A66    add         byte ptr [eax],al
 00416A68    add         byte ptr [eax],al
 00416A6A    inc         eax
 00416A6C    add         byte ptr [eax],al
 00416A6E    add         byte ptr [eax],al
 00416A70    add         byte ptr [eax],al
 00416A72    inc         esp
 00416A73    inc         eax
 00416A74    add         byte ptr [eax],al
 00416A76    add         byte ptr [eax],al
 00416A78    add         byte ptr [eax],al
 00416A7A    dec         ecx
 00416A7B    inc         eax
 00416A7C    add         byte ptr [eax],al
 00416A7E    add         byte ptr [eax],al
 00416A80    add         byte ptr [eax],al
 00416A82    dec         esi
 00416A83    inc         eax
 00416A84    add         byte ptr [eax],al
 00416A86    add         byte ptr [eax],al
 00416A88    add         byte ptr [eax+4051],al
 00416A8E    add         byte ptr [eax],al
 00416A90    add         byte ptr [eax],al
 00416A92    push        esp
 00416A93    inc         eax
 00416A94    add         byte ptr [eax],al
 00416A96    add         byte ptr [eax],al
 00416A98    add         byte ptr [eax+4056],al
 00416A9E    add         byte ptr [eax],al
 00416AA0    add         byte ptr [eax],al
 00416AA2    pop         ecx
 00416AA3    inc         eax
 00416AA4    add         byte ptr [eax],al
 00416AA6    add         byte ptr [eax],al
 00416AA8    add         byte ptr [eax+40C3],cl
 00416AAE    add         byte ptr [eax],al
 00416AB0    add         byte ptr [eax],al
 00416AB2    lock mov    edi,0
 00416AB8    add         byte ptr [eax],al
 00416ABA    lock mov    edi,0
 00416AC0    add         byte ptr [eax],al
 00416AC2    lock mov    edi,0
 00416AC8    add         byte ptr [eax],al
 00416ACA    lock mov    edi,0
 00416AD0    add         byte ptr [eax],al
 00416AD2    lock mov    edi,0
 00416AD8    add         byte ptr [eax],al
 00416ADA    lock mov    edi,0
 00416AE0    add         byte ptr [eax],al
 00416AE2    lock mov    edi,0
 00416AE8    add         byte ptr [eax],al
 00416AEA    lock mov    edi,0
 00416AF0    add         byte ptr [eax],al
 00416AF2    lock mov    edi,0
 00416AF8    add         byte ptr [eax],al
 00416AFA    lock mov    edi,0
 00416B00    add         byte ptr [eax],al
 00416B02    lock mov    edi,0
 00416B08    add         byte ptr [eax],al
 00416B0A    lock mov    edi,0
 00416B10    add         byte ptr [eax],al
 00416B12    lock mov    edi,0
 00416B18    add         byte ptr [eax],al
 00416B1A    lock mov    edi,0
 00416B20    add         byte ptr [eax],al
 00416B22    lock mov    edi,0
 00416B28    add         byte ptr [eax],al
 00416B2A    lock mov    edi,0
 00416B30    add         byte ptr [eax],al
 00416B32    lock mov    edi,0
 00416B38    add         byte ptr [eax],al
 00416B3A    xor         dword ptr [eax],eax
 00416B3D    add         byte ptr [eax],al
 00416B3F    add         byte ptr [eax],al
 00416B41    add         byte ptr [edx],dh
 00416B43    inc         eax
 00416B44    add         byte ptr [eax],al
 00416B46    add         byte ptr [eax],al
 00416B48    add         byte ptr [eax],al
 00416B4A    xor         eax,dword ptr [eax]
 00416B4D    add         byte ptr [eax],al
 00416B4F    add         byte ptr [eax],al
 00416B51    add         al,dh
 00416B53    mov         edi,0
 00416B58    add         byte ptr [eax],al
 00416B5A    lock mov    edi,0
 00416B60    add         byte ptr [eax],al
 00416B62    lock mov    edi,0
 00416B68    add         byte ptr [eax],al
 00416B6A    lock mov    edi,0
 00416B70    add         byte ptr [eax],al
 00416B72    lock mov    edi,0
 00416B78    add         byte ptr [eax],al
 00416B7A    lock mov    edi,0
 00416B80    add         byte ptr [eax],al
 00416B82    lock mov    edi,0
 00416B88    add         byte ptr [eax],al
 00416B8A    lock mov    edi,0
 00416B90    add         byte ptr [eax],al
 00416B92    lock mov    edi,0
 00416B98    add         byte ptr [eax],al
 00416B9A    lock mov    edi,0
 00416BA0    add         byte ptr [eax],al
 00416BA2    lock mov    edi,0
 00416BA8    add         byte ptr [eax],al
 00416BAA    lock mov    edi,0
 00416BB0    add         byte ptr [eax],al
 00416BB2    lock mov    edi,0
 00416BB8    add         byte ptr [eax],al
 00416BBA    lock mov    edi,0
 00416BC0    add         byte ptr [eax],al
 00416BC2    lock mov    edi,0
 00416BC8    add         byte ptr [eax],al
 00416BCA    add         byte ptr [eax],al
 00416BCC    add         byte ptr [eax],al
 00416BCE    add         byte ptr [eax],al
 00416BD0    add         byte ptr [eax],al
 00416BD2    lock aas
 00416BD4    add         byte ptr [eax],al
 00416BD6    add         byte ptr [eax],al
 00416BD8    add         byte ptr [eax],al
 00416BDA    add         byte ptr [eax],al
 00416BDD    add         byte ptr [eax],al
 00416BDF    add         byte ptr [eax],al
 00416BE1    add         byte ptr [eax],cl
 00416BE3    inc         eax
 00416BE4    add         byte ptr [eax],al
 00416BE6    add         byte ptr [eax],al
 00416BE8    add         byte ptr [eax],al
 00416BEA    adc         byte ptr [eax],al
 00416BED    add         byte ptr [eax],al
 00416BEF    add         byte ptr [eax],al
 00416BF1    add         byte ptr [eax+eax*2],dl
 00416BF4    add         byte ptr [eax],al
 00416BF6    add         byte ptr [eax],al
 00416BF8    add         byte ptr [eax],al
 00416BFA    sbb         byte ptr [eax],al
 00416BFD    add         byte ptr [eax],al
 00416BFF    add         byte ptr [eax],al
 00416C01    add         byte ptr [eax+eax*2],bl
 00416C04    add         byte ptr [eax],al
 00416C06    add         byte ptr [eax],al
 00416C08    add         byte ptr [eax],al
 00416C0A    and         byte ptr [eax],al
 00416C0D    add         byte ptr [eax],al
 00416C0F    add         byte ptr [eax],al
 00416C11    add         byte ptr [edx],ah
 00416C13    inc         eax
 00416C14    add         byte ptr [eax],al
 00416C16    add         byte ptr [eax],al
 00416C18    add         byte ptr [eax],al
 00416C1A    lock aas
 00416C1C    add         byte ptr [eax],al
 00416C1E    add         byte ptr [eax],al
 00416C20    add         byte ptr [eax],al
 00416C22    lock mov    edi,0
 00416C28    add         byte ptr [eax],al
 00416C2A    lock mov    edi,0
 00416C30    add         byte ptr [eax],al
 00416C32    lock mov    edi,0
 00416C38    add         byte ptr [eax],al
 00416C3A    lock mov    edi,0
 00416C40    add         byte ptr [eax],al
 00416C42    lock mov    edi,0
 00416C48    add         byte ptr [eax],al
 00416C4A    add         byte ptr [eax],al
 00416C4C    add         byte ptr [eax],al
 00416C4E    add         byte ptr [eax],al
 00416C50    add         byte ptr [eax],al
 00416C52    lock mov    edi,0
 00416C58    add         byte ptr [eax],al
 00416C5A    lock mov    edi,0
 00416C60    add         byte ptr [eax],al
 00416C62    lock mov    edi,0
 00416C68    add         byte ptr [eax],al
 00416C6A    adc         byte ptr [eax],al
 00416C6D    add         byte ptr [eax],al
 00416C6F    add         byte ptr [eax],al
 00416C71    add         byte ptr [eax+eax*2],dl
 00416C74    add         byte ptr [eax],al
 00416C76    add         byte ptr [eax],al
 00416C78    add         byte ptr [eax],al
 00416C7A    sbb         byte ptr [eax],al
 00416C7D    add         byte ptr [eax],al
 00416C7F    add         byte ptr [eax],al
 00416C81    add         byte ptr [eax+eax*2],bl
 00416C84    add         byte ptr [eax],al
 00416C86    add         byte ptr [eax],al
 00416C88    add         byte ptr [eax],al
 00416C8A    and         byte ptr [eax],al
 00416C8D    add         byte ptr [eax],al
 00416C8F    add         byte ptr [eax],al
 00416C91    add         byte ptr [edx],ah
 00416C93    inc         eax
 00416C94    add         byte ptr [eax],al
 00416C96    add         byte ptr [eax],al
 00416C98    add         byte ptr [eax],al
 00416C9A    lock mov    edi,0
 00416CA0    add         byte ptr [eax],al
 00416CA2    lock mov    edi,0
 00416CA8    add         byte ptr [eax],al
 00416CAA    lock mov    edi,0
 00416CB0    add         byte ptr [eax],al
 00416CB2    lock mov    edi,0
 00416CB8    add         byte ptr [eax],al
 00416CBA    lock mov    edi,0
 00416CC0    add         byte ptr [eax],al
 00416CC2    lock mov    edi,5F809918
 00416CC8    and         ecx,dword ptr [ecx-3E]
 00416CCB    aas
 00416CCC    mov         bl,0D1
 00416CCE    cmp         dword ptr [edi],edi
 00416CD0    lds         esi,fword ptr [ecx-44]
 00416CD3    aas
 00416CD4    call        B999:99999999
 00416CDB    aas
 00416CDC    inc         esi
 00416CDD    pop         ebp
 00416CDE    imul        ebp,edi,53
 00416CE1    push        ebp
 00416CE2    ???
 00416CE3    aas
 00416CE4    pop         ebp
 00416CE5    push        ecx
 00416CE6    dec         edx
 00416CE7    or          byte ptr [esi+55],dl
 00416CEA    in          eax,3F
 00416CEC    call        C999:99999999
 00416CF3    aas
 00416CF4    call        D999:99999999
 00416CFB    aas
 00416CFC    xor         esi,dword ptr [ebx]
 00416CFE    xor         esi,dword ptr [ebx]
 00416D00    xor         esi,dword ptr [ebx]
 00416D02    jecxz       00416D43
 00416D04    call        E999:99999999
 00416D0B    aas
>00416D0C    je          00416D53
 00416D0E    sub         dword ptr [ecx],esp
 00416D10    pop         eax
 00416D11    push        ebp
 00416D12    lds         edi,fword ptr [edi]
 00416D14    mov         [A9F7B5AE],eax
 00416D19    stos        byte ptr [edi]
 00416D1A    jmp         0000:0000003F
 00416D21    add         al,al
 00416D23    aas
 00416D24    add         byte ptr [eax],al
 00416D26    add         byte ptr [eax],al
 00416D28    add         byte ptr [eax],al
 00416D2A    fdivr       dword ptr [edi]
 00416D2C    add         byte ptr [eax],al
 00416D2E    add         byte ptr [eax],al
 00416D30    add         byte ptr [eax],al
 00416D32    in          al,3F
 00416D34    add         byte ptr [eax],al
 00416D36    add         byte ptr [eax],al
 00416D38    add         byte ptr [eax],al
 00416D3A    in          al,dl
 00416D3B    aas
 00416D3C    add         byte ptr [eax],al
 00416D3E    add         byte ptr [eax],al
 00416D40    add         byte ptr [eax],al
 00416D42    lock aas
 00416D44    add         byte ptr [eax],al
 00416D46    add         byte ptr [eax],al
 00416D48    add         byte ptr [eax],al
 00416D4A    lock aas
 00416D4C    add         byte ptr [eax],al
 00416D4E    add         byte ptr [eax],al
 00416D50    add         byte ptr [eax],al
 00416D52    add         byte ptr [eax],al
 00416D55    add         byte ptr [eax],al
 00416D57    add         byte ptr [eax],al
 00416D59    add         byte ptr [eax],cl
 00416D5B    inc         eax
 00416D5C    add         byte ptr [eax],al
 00416D5E    add         byte ptr [eax],al
 00416D60    add         byte ptr [eax],al
 00416D62    adc         byte ptr [eax],al
 00416D65    add         byte ptr [eax],al
 00416D67    add         byte ptr [eax],al
 00416D69    add         byte ptr [eax+eax*2],dl
 00416D6C    add         byte ptr [eax],al
 00416D6E    add         byte ptr [eax],al
 00416D70    add         byte ptr [eax],al
 00416D72    sbb         byte ptr [eax],al
 00416D75    add         byte ptr [eax],al
 00416D77    add         byte ptr [eax],al
 00416D79    add         byte ptr [eax+eax*2],bl
 00416D7C    add         byte ptr [eax],al
 00416D7E    add         byte ptr [eax],al
 00416D80    add         byte ptr [eax],al
 00416D82    and         byte ptr [eax],al
 00416D85    add         byte ptr [eax],al
 00416D87    add         byte ptr [eax],al
 00416D89    add         byte ptr [edx],ah
 00416D8B    inc         eax
 00416D8C    add         byte ptr [eax],al
 00416D8E    add         byte ptr [eax],al
 00416D90    add         byte ptr [eax],al
 00416D92    and         al,40
 00416D94    add         byte ptr [eax],al
 00416D96    add         byte ptr [eax],al
 00416D98    add         byte ptr [eax],al
 00416D9A    inc         eax
 00416D9C    add         byte ptr [eax],al
 00416D9E    add         byte ptr [eax],al
 00416DA0    add         byte ptr [eax],al
 00416DA2    sub         byte ptr [eax],al
 00416DA5    add         byte ptr [eax],al
 00416DA7    add         byte ptr [eax],al
 00416DA9    add         byte ptr [ecx+40],cl
 00416DAC    add         byte ptr [eax],al
 00416DAE    add         byte ptr [eax],al
 00416DB0    add         byte ptr [eax],al
 00416DB2    pop         ecx
 00416DB3    inc         eax
 00416DB4    add         byte ptr [eax],al
 00416DB6    add         byte ptr [eax],al
 00416DB8    add         byte ptr [eax+7F],al
 00416DBB    inc         eax
 00416DBC    add         byte ptr [eax],al
 00416DBE    add         byte ptr [eax],al
 00416DC0    add         byte ptr [eax-71],al
 00416DC3    inc         eax
 00416DC4    add         byte ptr [eax],al
 00416DC6    add         byte ptr [eax],al
 00416DC8    add         byte ptr [eax-71],al
 00416DCB    inc         eax
 00416DCC    add         byte ptr [eax],al
 00416DCE    add         byte ptr [eax],al
 00416DD0    add         byte ptr [eax+40B3],cl
 00416DD6    add         byte ptr [eax],al
 00416DD8    add         byte ptr [eax+40C3],cl
 00416DDE    add         byte ptr [eax],al
 00416DE0    add         byte ptr [eax],al
 00416DE2    lock mov    edi,0
 00416DE8    add         byte ptr [eax],al
 00416DEA    lock mov    edi,0
 00416DF0    add         byte ptr [eax],al
 00416DF2    sbb         byte ptr [eax],al
 00416DF5    add         byte ptr [eax],al
 00416DF7    add         byte ptr [eax],al
 00416DF9    add         byte ptr [ecx+40],cl
 00416DFC    add         byte ptr [eax],al
 00416DFE    add         byte ptr [eax],al
 00416E00    add         byte ptr [edx-18],ch
 00416E03    inc         eax
 00416E04    add         byte ptr [eax],al
 00416E06    add         byte ptr [eax],al
 00416E08    add         byte ptr [edx-8],ch
 00416E0B    inc         eax
 00416E0C    add         byte ptr [eax],al
 00416E0E    add         byte ptr [eax],al
 00416E10    add         byte ptr [eax],al
 00416E12    add         byte ptr [eax],al
 00416E14    add         byte ptr [eax],al
 00416E16    add         byte ptr [eax],al
 00416E18    add         byte ptr [eax],al
 00416E1A    lock mov    edi,0
 00416E20    add         byte ptr [eax],al
 00416E22    lock mov    edi,0
 00416E28    add         byte ptr [eax],al
 00416E2A    lock mov    edi,0
 00416E30    add         byte ptr [eax],al
 00416E32    lock mov    edi,0
 00416E38    add         byte ptr [eax],al
 00416E3A    lock mov    edi,0
 00416E40    add         byte ptr [eax],al
 00416E42    lock mov    edi,0
 00416E48    add         byte ptr [eax],al
 00416E4A    lock aas
 00416E4C    add         byte ptr [eax],al
 00416E4E    add         byte ptr [eax],al
 00416E50    add         byte ptr [eax],al
 00416E52    add         byte ptr [eax],al
 00416E55    add         byte ptr [eax],al
 00416E57    add         byte ptr [eax],al
 00416E59    add         byte ptr [eax],cl
 00416E5B    inc         eax
 00416E5C    add         byte ptr [eax],al
 00416E5E    add         byte ptr [eax],al
 00416E60    add         byte ptr [eax],al
 00416E62    adc         byte ptr [eax],al
 00416E65    add         byte ptr [eax],al
 00416E67    add         byte ptr [eax],al
 00416E69    add         byte ptr [eax+eax*2],dl
 00416E6C    add         byte ptr [eax],al
 00416E6E    add         byte ptr [eax],al
 00416E70    add         byte ptr [eax],al
 00416E72    sbb         byte ptr [eax],al
 00416E75    add         byte ptr [eax],al
 00416E77    add         byte ptr [eax],al
 00416E79    add         byte ptr [eax+eax*2],bl
 00416E7C    add         byte ptr [eax],al
 00416E7E    add         byte ptr [eax],al
 00416E80    add         byte ptr [eax],al
 00416E82    and         byte ptr [eax],al
 00416E85    add         byte ptr [eax],al
 00416E87    add         byte ptr [eax],al
 00416E89    add         byte ptr [edx],ah
 00416E8B    inc         eax
 00416E8C    add         byte ptr [eax],al
 00416E8E    add         byte ptr [eax],al
 00416E90    add         byte ptr [eax],al
 00416E92    and         al,40
 00416E94    add         byte ptr [eax],al
 00416E96    add         byte ptr [eax],al
 00416E98    add         byte ptr [eax],al
 00416E9A    inc         eax
 00416E9C    add         byte ptr [eax],al
 00416E9E    add         byte ptr [eax],al
 00416EA0    add         byte ptr [eax],al
 00416EA2    sub         byte ptr [eax],al
 00416EA5    add         byte ptr [eax],al
 00416EA7    add         byte ptr [eax],al
 00416EA9    add         byte ptr [edx],ch
 00416EAB    inc         eax
 00416EAC    add         byte ptr [eax],al
 00416EAE    add         byte ptr [eax],al
 00416EB0    add         byte ptr [eax],al
 00416EB2    sub         al,40
 00416EB4    add         byte ptr [eax],al
 00416EB6    add         byte ptr [eax],al
 00416EB8    add         byte ptr [eax],al
 00416EBA    inc         eax
 00416EBC    add         byte ptr [eax],al
 00416EBE    add         byte ptr [eax],al
 00416EC0    add         byte ptr [eax],al
 00416EC2    xor         byte ptr [eax],al
 00416EC5    add         byte ptr [eax],al
 00416EC7    add         byte ptr [eax],al
 00416EC9    add         byte ptr [ecx],dh
 00416ECB    inc         eax
 00416ECC    add         byte ptr [eax],al
 00416ECE    add         byte ptr [eax],al
 00416ED0    add         byte ptr [eax],al
 00416ED2    xor         al,byte ptr [eax]
 00416ED5    add         byte ptr [eax],al
 00416ED7    add         byte ptr [eax],al
 00416ED9    add         byte ptr [ebx],dh
 00416EDB    inc         eax
 00416EDC    add         byte ptr [eax],al
 00416EDE    add         byte ptr [eax],al
 00416EE0    add         byte ptr [eax],al
 00416EE2    xor         al,40
 00416EE4    add         byte ptr [eax],al
 00416EE6    add         byte ptr [eax],al
 00416EE8    add         byte ptr [eax],al
 00416EEA    lock aas
 00416EEC    add         byte ptr [eax],al
 00416EEE    add         byte ptr [eax],al
 00416EF0    add         byte ptr [eax],al
 00416EF2    add         byte ptr [eax],al
 00416EF5    add         byte ptr [eax],al
 00416EF7    add         byte ptr [eax],al
 00416EF9    add         byte ptr [eax],cl
 00416EFB    inc         eax
 00416EFC    add         byte ptr [eax],al
 00416EFE    add         byte ptr [eax],al
 00416F00    add         byte ptr [eax],al
 00416F02    adc         byte ptr [eax],al
 00416F05    add         byte ptr [eax],al
 00416F07    add         byte ptr [eax],al
 00416F09    add         byte ptr [eax+eax*2],dl
 00416F0C    add         byte ptr [eax],al
 00416F0E    add         byte ptr [eax],al
 00416F10    add         byte ptr [eax],al
 00416F12    sbb         byte ptr [eax],al
 00416F15    add         byte ptr [eax],al
 00416F17    add         byte ptr [eax],al
 00416F19    add         byte ptr [eax+eax*2],bl
 00416F1C    add         byte ptr [eax],al
 00416F1E    add         byte ptr [eax],al
 00416F20    add         byte ptr [eax],al
 00416F22    and         byte ptr [eax],al
 00416F25    add         byte ptr [eax],al
 00416F27    add         byte ptr [eax],al
 00416F29    add         byte ptr [edx],ah
 00416F2B    inc         eax
 00416F2C    add         byte ptr [eax],al
 00416F2E    add         byte ptr [eax],al
 00416F30    add         byte ptr [eax],al
 00416F32    and         al,40
 00416F34    add         byte ptr [eax],al
 00416F36    add         byte ptr [eax],al
 00416F38    add         byte ptr [eax],al
 00416F3A    inc         eax
 00416F3C    add         byte ptr [eax],al
 00416F3E    add         byte ptr [eax],al
 00416F40    add         byte ptr [eax],al
 00416F42    sub         byte ptr [eax],al
 00416F45    add         byte ptr [eax],al
 00416F47    add         byte ptr [eax],al
 00416F49    add         byte ptr [edx],ah
 00416F4B    inc         eax
 00416F4C    add         byte ptr [eax],al
 00416F4E    add         byte ptr [eax],al
 00416F50    add         byte ptr [eax],al
 00416F52    and         al,40
 00416F54    add         byte ptr [eax],al
 00416F56    add         byte ptr [eax],al
 00416F58    add         byte ptr [eax],al
 00416F5A    inc         eax
 00416F5C    add         byte ptr [eax],al
 00416F5E    add         byte ptr [eax],al
 00416F60    add         byte ptr [eax],al
 00416F62    sub         byte ptr [eax],al
 00416F65    add         byte ptr [eax],al
 00416F67    add         byte ptr [eax],al
 00416F69    add         byte ptr [edx],ch
 00416F6B    inc         eax
 00416F6C    add         byte ptr [eax],al
 00416F6E    add         byte ptr [eax],al
 00416F70    add         byte ptr [eax],al
 00416F72    sub         al,40
 00416F74    add         byte ptr [eax],al
 00416F76    add         byte ptr [eax],al
 00416F78    add         byte ptr [eax],al
 00416F7A    inc         eax
 00416F7C    add         byte ptr [eax],al
 00416F7E    add         byte ptr [eax],al
 00416F80    add         byte ptr [eax],al
 00416F82    xor         byte ptr [eax],al
 00416F85    add         byte ptr [eax],al
 00416F87    add         byte ptr [eax],al
 00416F89    add         byte ptr [ecx],dh
 00416F8B    inc         eax
 00416F8C    add         byte ptr [eax],al
 00416F8E    add         byte ptr [eax],al
 00416F90    add         byte ptr [eax],al
 00416F92    xor         al,byte ptr [eax]
 00416F95    add         byte ptr [eax],al
 00416F97    add         byte ptr [eax],al
 00416F99    add         byte ptr [ebx],dh
 00416F9B    inc         eax
 00416F9C    add         byte ptr [eax],al
 00416F9E    add         byte ptr [eax],al
 00416FA0    add         byte ptr [eax],al
 00416FA2    xor         al,40
 00416FA4    add         byte ptr [eax],al
 00416FA6    add         byte ptr [eax],al
 00416FA8    add         byte ptr [eax],al
 00416FAA    lock mov    edi,0
 00416FB0    add         byte ptr [eax],al
 00416FB2    lock mov    edi,0
 00416FB8    add         byte ptr [eax],al
 00416FBA    lock mov    edi,0
 00416FC0    add         byte ptr [eax],al
 00416FC2    lock mov    edi,0
 00416FC8    add         byte ptr [eax],al
 00416FCA    lock mov    edi,0
 00416FD0    add         byte ptr [eax],al
 00416FD2    lock mov    edi,0
 00416FD8    add         byte ptr [eax],al
 00416FDA    lock mov    edi,0
 00416FE0    add         byte ptr [eax],al
 00416FE2    lock mov    edi,0
 00416FE8    add         byte ptr [eax],al
 00416FEA    lock mov    edi,0
 00416FF0    add         byte ptr [eax],al
 00416FF2    lock mov    edi,0
 00416FF8    add         byte ptr [eax],al
 00416FFA    lock mov    edi,0
 00417000    add         byte ptr [eax],al
 00417002    lock mov    edi,0
 00417008    add         byte ptr [eax],al
 0041700A    lock mov    edi,0
 00417010    add         byte ptr [eax],al
 00417012    lock mov    edi,0
 00417018    add         byte ptr [eax],al
 0041701A    add         byte ptr [eax],al
 0041701C    add         byte ptr [eax],al
 0041701E    add         byte ptr [eax],al
 00417020    add         byte ptr [eax],al
 00417022    inc         eax
 00417024    add         byte ptr [eax],al
 00417026    add         byte ptr [eax],al
 00417028    add         byte ptr [eax],al
 0041702A    sub         byte ptr [eax],al
 0041702D    add         byte ptr [eax],al
 0041702F    add         byte ptr [eax],al
 00417031    add         byte ptr [edx],ch
 00417033    inc         eax
 00417034    add         byte ptr [eax],al
 00417036    add         byte ptr [eax],al
 00417038    add         byte ptr [eax],al
 0041703A    sub         al,40
 0041703C    add         byte ptr [eax],al
 0041703E    add         byte ptr [eax],al
 00417040    add         byte ptr [eax],al
 00417042    inc         eax
 00417044    add         byte ptr [eax],al
 00417046    add         byte ptr [eax],al
 00417048    add         byte ptr [eax],al
 0041704A    xor         byte ptr [eax],al
 0041704D    add         byte ptr [eax],al
 0041704F    add         byte ptr [eax],al
 00417051    add         byte ptr [ecx],dh
 00417053    inc         eax
 00417054    add         byte ptr [eax],al
 00417056    add         byte ptr [eax],al
 00417058    add         byte ptr [eax],al
 0041705A    xor         al,byte ptr [eax]
 0041705D    add         byte ptr [eax],al
 0041705F    add         byte ptr [eax],al
 00417061    add         byte ptr [ebx],dh
 00417063    inc         eax
 00417064    add         byte ptr [eax],al
 00417066    add         byte ptr [eax],al
 00417068    add         byte ptr [eax],al
 0041706A    xor         al,40
 0041706C    add         byte ptr [eax],al
 0041706E    add         byte ptr [eax],al
 00417070    add         byte ptr [eax],al
 00417072    lock aas
 00417074    add         byte ptr [eax],al
 00417076    add         byte ptr [eax],al
 00417078    add         byte ptr [eax],al
 0041707A    add         byte ptr [eax],al
 0041707D    add         byte ptr [eax],al
 0041707F    add         byte ptr [eax],al
 00417081    add         byte ptr [eax],cl
 00417083    inc         eax
 00417084    add         byte ptr [eax],al
 00417086    add         byte ptr [eax],al
 00417088    add         byte ptr [eax],al
 0041708A    adc         byte ptr [eax],al
 0041708D    add         byte ptr [eax],al
 0041708F    add         byte ptr [eax],al
 00417091    add         byte ptr [eax+eax*2],dl
 00417094    add         byte ptr [eax],al
 00417096    add         byte ptr [eax],al
 00417098    add         byte ptr [eax],al
 0041709A    sbb         byte ptr [eax],al
 0041709D    add         byte ptr [eax],al
 0041709F    add         byte ptr [eax],al
 004170A1    add         byte ptr [eax+eax*2],bl
 004170A4    add         byte ptr [eax],al
 004170A6    add         byte ptr [eax],al
 004170A8    add         byte ptr [eax],al
 004170AA    and         byte ptr [eax],al
 004170AD    add         byte ptr [eax],al
 004170AF    add         byte ptr [eax],al
 004170B1    add         byte ptr [edx],ah
 004170B3    inc         eax
 004170B4    add         byte ptr [eax],al
 004170B6    add         byte ptr [eax],al
 004170B8    add         byte ptr [eax],al
 004170BA    and         al,40
 004170BC    add         byte ptr [eax],al
 004170BE    add         byte ptr [eax],al
 004170C0    add         byte ptr [eax],al
 004170C2    add         byte ptr [eax],al
 004170C4    add         byte ptr [eax],al
 004170C6    add         byte ptr [eax],al
 004170C8    add         byte ptr [eax],al
 004170CA    lock aas
 004170CC    add         byte ptr [eax],al
 004170CE    add         byte ptr [eax],al
 004170D0    add         byte ptr [eax],al
 004170D2    add         byte ptr [eax],al
 004170D5    add         byte ptr [eax],al
 004170D7    add         byte ptr [eax],al
 004170D9    add         byte ptr [eax],cl
 004170DB    inc         eax
 004170DC    add         byte ptr [eax],al
 004170DE    add         byte ptr [eax],al
 004170E0    add         byte ptr [eax],al
 004170E2    adc         byte ptr [eax],al
 004170E5    add         byte ptr [eax],al
 004170E7    add         byte ptr [eax],al
 004170E9    add         byte ptr [eax+eax*2],dl
 004170EC    add         byte ptr [eax],al
 004170EE    add         byte ptr [eax],al
 004170F0    add         byte ptr [eax],al
 004170F2    sbb         byte ptr [eax],al
 004170F5    add         byte ptr [eax],al
 004170F7    add         byte ptr [eax],al
 004170F9    add         byte ptr [eax+eax*2],bl
 004170FC    add         byte ptr [eax],al
 004170FE    add         byte ptr [eax],al
 00417100    add         byte ptr [eax],al
 00417102    and         byte ptr [eax],al
 00417105    add         byte ptr [eax],al
 00417107    add         byte ptr [eax],al
 00417109    add         byte ptr [edx],ah
 0041710B    inc         eax
 0041710C    add         byte ptr [eax],al
 0041710E    add         byte ptr [eax],al
 00417110    add         byte ptr [eax],al
 00417112    and         al,40
 00417114    add         byte ptr [eax],al
 00417116    add         byte ptr [eax],al
 00417118    add         byte ptr [eax],al
 0041711A    lock aas
 0041711C    add         byte ptr [eax],al
 0041711E    add         byte ptr [eax],al
 00417120    add         byte ptr [eax],al
 00417122    add         byte ptr [eax],al
 00417125    add         byte ptr [eax],al
 00417127    add         byte ptr [eax],al
 00417129    add         byte ptr [eax],cl
 0041712B    inc         eax
 0041712C    add         byte ptr [eax],al
 0041712E    add         byte ptr [eax],al
 00417130    add         byte ptr [eax],al
 00417132    adc         byte ptr [eax],al
 00417135    add         byte ptr [eax],al
 00417137    add         byte ptr [eax],al
 00417139    add         byte ptr [eax+eax*2],dl
 0041713C    add         byte ptr [eax],al
 0041713E    add         byte ptr [eax],al
 00417140    add         byte ptr [eax],al
 00417142    sbb         byte ptr [eax],al
 00417145    add         byte ptr [eax],al
 00417147    add         byte ptr [eax],al
 00417149    add         byte ptr [eax+eax*2],bl
 0041714C    add         byte ptr [eax],al
 0041714E    add         byte ptr [eax],al
 00417150    add         byte ptr [eax],al
 00417152    and         byte ptr [eax],al
 00417155    add         byte ptr [eax],al
 00417157    add         byte ptr [eax],al
 00417159    add         byte ptr [edx],ah
 0041715B    inc         eax
 0041715C    add         byte ptr [eax],al
 0041715E    add         byte ptr [eax],al
 00417160    add         byte ptr [eax],al
 00417162    and         al,40
 00417164    add         byte ptr [eax],al
 00417166    add         byte ptr [eax],al
 00417168    add         byte ptr [eax],al
 0041716A    lock mov    edi,0
 00417170    add         byte ptr [eax],al
 00417172    lock mov    edi,0
 00417178    add         byte ptr [eax],al
 0041717A    lock mov    edi,0
 00417180    add         byte ptr [eax],al
 00417182    lock mov    edi,0
 00417188    add         byte ptr [eax],al
 0041718A    lock mov    edi,0
 00417190    add         byte ptr [eax],al
 00417192    lock mov    edi,0
 00417198    add         byte ptr [eax],al
 0041719A    lock mov    edi,0
 004171A0    add         byte ptr [eax],al
 004171A2    lock mov    edi,0
 004171A8    add         byte ptr [eax],al
 004171AA    lock mov    edi,0
 004171B0    add         byte ptr [eax],al
 004171B2    lock mov    edi,0
 004171B8    add         byte ptr [eax],al
 004171BA    lock mov    edi,0
 004171C0    add         byte ptr [eax],al
 004171C2    lock mov    edi,0
 004171C8    add         byte ptr [eax],al
 004171CA    lock mov    edi,0
 004171D0    add         byte ptr [eax],al
 004171D2    lock mov    edi,0
 004171D8    add         byte ptr [eax],al
 004171DA    lock mov    edi,0
 004171E0    add         byte ptr [eax],al
 004171E2    lock mov    edi,0
 004171E8    add         byte ptr [eax],al
 004171EA    lock mov    edi,0
 004171F0    add         byte ptr [eax],al
 004171F2    lock mov    edi,0
 004171F8    add         byte ptr [eax],al
 004171FA    lock mov    edi,0
 00417200    add         byte ptr [eax],al
 00417202    lock mov    edi,0
 00417208    add         byte ptr [eax],al
 0041720A    lock mov    edi,0
 00417210    add         byte ptr [eax],al
 00417212    lock mov    edi,0
 00417218    add         byte ptr [eax],al
 0041721A    lock mov    edi,0
 00417220    add         byte ptr [eax],al
 00417222    lock mov    edi,0
 00417228    add         byte ptr [eax],al
 0041722A    lock mov    edi,0
 00417230    add         byte ptr [eax],al
 00417232    loopne      00417273
 00417234    add         byte ptr [eax],al
 00417236    add         byte ptr [eax],al
 00417238    add         byte ptr [eax],al
 0041723A    lock mov    edi,0
 00417240    add         byte ptr [eax],al
 00417242    lock mov    edi,0
 00417248    add         byte ptr [eax],al
 0041724A    lock mov    edi,0
 00417250    add         byte ptr [eax],al
 00417252    lock mov    edi,0
 00417258    add         byte ptr [eax],al
 0041725A    lock mov    edi,0
 00417260    add         byte ptr [eax],al
 00417262    lock mov    edi,0
 00417268    add         byte ptr [eax],al
 0041726A    lock mov    edi,0
 00417270    add         byte ptr [eax],al
 00417272    lock mov    edi,0
 00417278    add         byte ptr [eax],al
 0041727A    lock mov    edi,0
 00417280    add         byte ptr [eax],al
 00417282    add         byte ptr [eax],al
 00417284    add         byte ptr [eax],al
 00417286    add         byte ptr [eax],al
 00417288    add         byte ptr [eax],al
 0041728A    lock mov    edi,0
 00417290    add         byte ptr [eax],al
 00417292    lock mov    edi,0
 00417298    add         byte ptr [eax],al
 0041729A    lock mov    edi,0
 004172A0    add         byte ptr [eax],al
 004172A2    lock mov    edi,0
 004172A8    add         byte ptr [eax],al
 004172AA    lock mov    edi,0
 004172B0    add         byte ptr [eax],al
 004172B2    lock mov    edi,0
 004172B8    add         byte ptr [eax],al
 004172BA    lock mov    edi,0
 004172C0    add         byte ptr [eax],al
 004172C2    lock mov    edi,0
 004172C8    add         byte ptr [eax],al
 004172CA    lock mov    edi,0
 004172D0    add         byte ptr [eax],al
 004172D2    lock aas
 004172D4    add         byte ptr [eax],al
 004172D6    add         byte ptr [eax],al
 004172D8    add         byte ptr [eax],al
 004172DA    add         byte ptr [eax],al
 004172DD    add         byte ptr [eax],al
 004172DF    add         byte ptr [eax],al
 004172E1    add         byte ptr [eax],cl
 004172E3    inc         eax
 004172E4    add         byte ptr [eax],al
 004172E6    add         byte ptr [eax],al
 004172E8    add         byte ptr [eax],al
 004172EA    adc         byte ptr [eax],al
 004172ED    add         byte ptr [eax],al
 004172EF    add         byte ptr [eax],al
 004172F1    add         byte ptr [eax+eax*2],dl
 004172F4    add         byte ptr [eax],al
 004172F6    add         byte ptr [eax],al
 004172F8    add         byte ptr [eax],al
 004172FA    sbb         byte ptr [eax],al
 004172FD    add         byte ptr [eax],al
 004172FF    add         byte ptr [eax],al
 00417301    add         byte ptr [eax+eax*2],bl
 00417304    add         byte ptr [eax],al
 00417306    add         byte ptr [eax],al
 00417308    add         byte ptr [eax],al
 0041730A    and         byte ptr [eax],al
 0041730D    add         byte ptr [eax],al
 0041730F    add         byte ptr [eax],al
 00417311    add         byte ptr [edx],ah
 00417313    inc         eax
 00417314    add         byte ptr [eax],al
 00417316    add         byte ptr [eax],al
 00417318    add         byte ptr [eax],al
 0041731A    lock mov    edi,0
 00417320    add         byte ptr [eax],al
 00417322    lock mov    edi,0
 00417328    add         byte ptr [eax],al
 0041732A    lock mov    edi,0
 00417330    add         byte ptr [eax],al
 00417332    lock mov    edi,0
 00417338    add         byte ptr [eax],al
 0041733A    lock mov    edi,0
 00417340    add         byte ptr [eax],al
 00417342    lock mov    edi,0
 00417348    add         byte ptr [eax],al
 0041734A    lock mov    edi,0
 00417350    add         byte ptr [eax],al
 00417352    lock mov    edi,0
 00417358    add         byte ptr [eax],al
 0041735A    lock mov    edi,0
 00417360    add         byte ptr [eax],al
 00417362    lock mov    edi,0
 00417368    add         byte ptr [eax],al
 0041736A    lock mov    edi,0
 00417370    add         byte ptr [eax],al
 00417372    lock mov    edi,0
 00417378    add         byte ptr [eax],al
 0041737A    lock mov    edi,0
 00417380    add         byte ptr [eax],al
 00417382    lock mov    edi,0
 00417388    add         byte ptr [eax],al
 0041738A    and         al,40
 0041738C    add         byte ptr [eax],al
 0041738E    add         byte ptr [eax],al
 00417390    add         byte ptr [eax],al
 00417392    xor         al,40
 00417394    add         byte ptr [eax],al
 00417396    add         byte ptr [eax],al
 00417398    add         byte ptr [eax],al
 0041739A    inc         eax
 0041739C    add         byte ptr [eax],al
 0041739E    add         byte ptr [eax],al
 004173A0    add         byte ptr [eax],al
 004173A2    lock mov    edi,0
 004173A8    add         byte ptr [eax],al
 004173AA    lock mov    edi,0
 004173B0    add         byte ptr [eax],al
 004173B2    lock mov    edi,0
 004173B8    add         byte ptr [eax],al
 004173BA    lock mov    edi,0
 004173C0    add         byte ptr [eax],al
 004173C2    lock mov    edi,0
 004173C8    add         byte ptr [eax],al
 004173CA    lock mov    edi,0
 004173D0    add         byte ptr [eax],al
 004173D2    lock mov    edi,0
 004173D8    add         byte ptr [eax],al
 004173DA    lock aas
 004173DC    add         byte ptr [eax],al
 004173DE    add         byte ptr [eax],al
 004173E0    add         byte ptr [eax],al
 004173E2    add         byte ptr [eax],al
 004173E5    add         byte ptr [eax],al
 004173E7    add         byte ptr [eax],al
 004173E9    add         byte ptr [eax],cl
 004173EB    inc         eax
 004173EC    add         byte ptr [eax],al
 004173EE    add         byte ptr [eax],al
 004173F0    add         byte ptr [eax],al
 004173F2    adc         byte ptr [eax],al
 004173F5    add         byte ptr [eax],al
 004173F7    add         byte ptr [eax],al
 004173F9    add         al,dh
 004173FB    mov         edi,0
 00417400    add         byte ptr [eax],al
 00417402    lock mov    edi,0
 00417408    add         byte ptr [eax],al
 0041740A    lock mov    edi,0
 00417410    add         byte ptr [eax],al
 00417412    lock mov    edi,0
 00417418    add         byte ptr [eax],al
 0041741A    lock mov    edi,0
 00417420    add         byte ptr [eax],al
 00417422    lock mov    edi,0
 00417428    add         byte ptr [eax],al
 0041742A    lock mov    edi,0
 00417430    add         byte ptr [eax],al
 00417432    lock mov    edi,0
 00417438    add         byte ptr [eax],al
 0041743A    lock mov    edi,0
 00417440    add         byte ptr [eax],al
 00417442    lock mov    edi,0
 00417448    add         byte ptr [eax],al
 0041744A    lock mov    edi,0
 00417450    add         byte ptr [eax],al
 00417452    xor         eax,40
 00417457    add         byte ptr [eax],al
 00417459    add         byte ptr [esi],dh
 0041745B    inc         eax
 0041745C    add         byte ptr [eax],al
 0041745E    add         byte ptr [eax],al
 00417460    add         byte ptr [eax],al
 00417462    aaa
 00417463    inc         eax
 00417464    add         byte ptr [eax],al
 00417466    add         byte ptr [eax],al
 00417468    add         byte ptr [eax],al
 0041746A    cmp         byte ptr [eax],al
 0041746D    add         byte ptr [eax],al
 0041746F    add         byte ptr [eax],al
 00417471    add         byte ptr [ecx],bh
 00417473    inc         eax
 00417474    add         byte ptr [eax],al
 00417476    add         byte ptr [eax],al
 00417478    add         byte ptr [eax],al
 0041747A    cmp         al,byte ptr [eax]
 0041747D    add         byte ptr [eax],al
 0041747F    add         byte ptr [eax],al
 00417481    add         byte ptr [ebx],bh
 00417483    inc         eax
 00417484    add         byte ptr [eax],al
 00417486    add         byte ptr [eax],al
 00417488    add         byte ptr [eax],al
 0041748A    cmp         al,40
 0041748C    add         byte ptr [eax],al
 0041748E    add         byte ptr [eax],al
 00417490    add         byte ptr [eax],al
 00417492    cmp         eax,40
 00417497    add         byte ptr [eax],al
 00417499    add         byte ptr [esi],bh
 0041749B    inc         eax
 0041749C    add         byte ptr [eax],al
 0041749E    add         byte ptr [eax],al
 004174A0    add         byte ptr [eax],al
 004174A2    aas
 004174A3    inc         eax
 004174A4    add         byte ptr [eax],al
 004174A6    add         byte ptr [eax],al
 004174A8    add         byte ptr [eax],al
 004174AA    inc         eax
 004174AB    inc         eax
 004174AC    add         byte ptr [eax],al
 004174AE    add         byte ptr [eax],al
 004174B0    add         byte ptr [eax+4040],al
 004174B6    add         byte ptr [eax],al
 004174B8    add         byte ptr [eax],al
 004174BA    inc         ecx
 004174BB    inc         eax
 004174BC    add         byte ptr [eax],al
 004174BE    add         byte ptr [eax],al
 004174C0    add         byte ptr [eax+4041],al
 004174C6    add         byte ptr [eax],al
 004174C8    add         byte ptr [eax],al
 004174CA    lock mov    edi,0
 004174D0    add         byte ptr [eax],al
 004174D2    inc         edx
 004174D3    inc         eax
 004174D4    add         byte ptr [eax],al
 004174D6    add         byte ptr [eax],al
 004174D8    add         byte ptr [eax+4042],al
 004174DE    add         byte ptr [eax],al
 004174E0    add         byte ptr [eax],al
 004174E2    inc         ebx
 004174E3    inc         eax
 004174E4    add         byte ptr [eax],al
 004174E6    add         byte ptr [eax],al
 004174E8    add         byte ptr [eax+4043],al
 004174EE    add         byte ptr [eax],al
 004174F0    add         byte ptr [eax],al
 004174F2    inc         esp
 004174F3    inc         eax
 004174F4    add         byte ptr [eax],al
 004174F6    add         byte ptr [eax],al
 004174F8    add         byte ptr [eax+4044],al
 004174FE    add         byte ptr [eax],al
 00417500    add         byte ptr [eax],al
 00417502    inc         ebp
 00417503    inc         eax
 00417504    add         byte ptr [eax],al
 00417506    add         byte ptr [eax],al
 00417508    add         byte ptr [eax+4045],al
 0041750E    add         byte ptr [eax],al
 00417510    add         byte ptr [eax],al
 00417512    inc         esi
 00417513    inc         eax
 00417514    add         byte ptr [eax],al
 00417516    add         byte ptr [eax],al
 00417518    add         byte ptr [eax+4046],al
 0041751E    add         byte ptr [eax],al
 00417520    add         byte ptr [eax],al
 00417522    inc         edi
 00417523    inc         eax
 00417524    add         byte ptr [eax],al
 00417526    add         byte ptr [eax],al
 00417528    add         byte ptr [eax+4047],al
 0041752E    add         byte ptr [eax],al
 00417530    add         byte ptr [eax],al
 00417532    dec         eax
 00417533    inc         eax
 00417534    add         byte ptr [eax],al
 00417536    add         byte ptr [eax],al
 00417538    add         byte ptr [eax+4048],al
 0041753E    add         byte ptr [eax],al
 00417540    add         byte ptr [eax],al
 00417542    dec         ecx
 00417543    inc         eax
 00417544    add         byte ptr [eax],al
 00417546    add         byte ptr [eax],al
 00417548    add         byte ptr [eax],al
 0041754A    lock mov    edi,0
 00417550    add         byte ptr [eax],al
 00417552    lock mov    edi,0
 00417558    add         byte ptr [eax],al
 0041755A    lock mov    edi,0
 00417560    add         byte ptr [eax],al
 00417562    lock mov    edi,0
 00417568    add         byte ptr [eax],al
 0041756A    lock mov    edi,0
 00417570    add         byte ptr [eax],al
 00417572    lock mov    edi,0
 00417578    add         byte ptr [eax],al
 0041757A    lock aas
 0041757C    add         byte ptr [eax],al
 0041757E    add         byte ptr [eax],al
 00417580    add         byte ptr [eax],al
 00417582    add         byte ptr [eax],al
 00417585    add         byte ptr [eax],al
 00417587    add         byte ptr [eax],al
 00417589    add         byte ptr [eax],cl
 0041758B    inc         eax
 0041758C    add         byte ptr [eax],al
 0041758E    add         byte ptr [eax],al
 00417590    add         byte ptr [eax],al
 00417592    adc         byte ptr [eax],al
 00417595    add         byte ptr [eax],al
 00417597    add         byte ptr [eax],al
 00417599    add         byte ptr [eax+eax*2],dl
 0041759C    add         byte ptr [eax],al
 0041759E    add         byte ptr [eax],al
 004175A0    add         byte ptr [eax],al
 004175A2    sbb         byte ptr [eax],al
 004175A5    add         byte ptr [eax],al
 004175A7    add         byte ptr [eax],al
 004175A9    add         byte ptr [eax+eax*2],bl
 004175AC    add         byte ptr [eax],al
 004175AE    add         byte ptr [eax],al
 004175B0    add         byte ptr [eax],al
 004175B2    and         byte ptr [eax],al
 004175B5    add         byte ptr [eax],al
 004175B7    add         byte ptr [eax],al
 004175B9    add         byte ptr [edx],ah
 004175BB    inc         eax
 004175BC    add         byte ptr [eax],al
 004175BE    add         byte ptr [eax],al
 004175C0    add         byte ptr [eax],al
 004175C2    add         byte ptr [eax],al
 004175C4    add         byte ptr [eax],al
 004175C6    add         byte ptr [eax],al
 004175C8    add         byte ptr [eax],al
 004175CA    sar         byte ptr [edi],1
 004175CC    add         byte ptr [eax],al
 004175CE    add         byte ptr [eax],al
 004175D0    add         byte ptr [eax],al
 004175D2    loopne      00417613
 004175D4    add         byte ptr [eax],al
 004175D6    add         byte ptr [eax],al
 004175D8    add         byte ptr [eax],al
 004175DA    call        0041761E
 004175DF    add         byte ptr [eax],al
 004175E1    add         byte ptr [eax+3F],dh
 004175E7    add         byte ptr [eax],al
 004175E9    add         al,al
 004175EB    aas
 004175EC    add         byte ptr [eax],al
 004175EE    add         byte ptr [eax],al
 004175F0    add         byte ptr [eax],al
 004175F2    enter       3F,0
 004175F6    add         byte ptr [eax],al
 004175F8    add         byte ptr [eax],al
 004175FA    lock mov    edi,0
 00417600    add         byte ptr [eax],al
 00417602    lock mov    edi,0
 00417608    add         byte ptr [eax],al
 0041760A    lock mov    edi,0
 00417610    add         byte ptr [eax],al
 00417612    lock mov    edi,0
 00417618    add         byte ptr [eax],al
 0041761A    lock mov    edi,0
 00417620    add         byte ptr [eax],al
 00417622    lock mov    edi,0
 00417628    add         byte ptr [eax],al
 0041762A    lock mov    edi,0
 00417630    add         byte ptr [eax],al
 00417632    lock mov    edi,0
 00417638    add         byte ptr [eax],al
 0041763A    lock mov    edi,0
 00417640    add         byte ptr [eax],al
 00417642    lock mov    edi,0
 00417648    add         byte ptr [eax],al
 0041764A    and         al,40
 0041764C    add         byte ptr [eax],al
 0041764E    add         byte ptr [eax],al
 00417650    add         byte ptr [eax],al
 00417652    xor         al,40
 00417654    add         byte ptr [eax],al
 00417656    add         byte ptr [eax],al
 00417658    add         byte ptr [eax],al
 0041765A    inc         eax
 0041765C    add         byte ptr [eax],al
 0041765E    add         byte ptr [eax],al
 00417660    add         byte ptr [eax],al
 00417662    inc         esp
 00417663    inc         eax
 00417664    add         byte ptr [eax],al
 00417666    add         byte ptr [eax],al
 00417668    add         byte ptr [eax],al
 0041766A    dec         ecx
 0041766B    inc         eax
 0041766C    add         byte ptr [eax],al
 0041766E    add         byte ptr [eax],al
 00417670    add         byte ptr [eax],al
 00417672    dec         esi
 00417673    inc         eax
 00417674    add         byte ptr [eax],al
 00417676    add         byte ptr [eax],al
 00417678    add         byte ptr [eax+4051],al
 0041767E    add         byte ptr [eax],al
 00417680    add         byte ptr [eax],al
 00417682    push        esp
 00417683    inc         eax
 00417684    add         byte ptr [eax],al
 00417686    add         byte ptr [eax],al
 00417688    add         byte ptr [eax+4056],al
 0041768E    add         byte ptr [eax],al
 00417690    add         byte ptr [eax],al
 00417692    pop         ecx
 00417693    inc         eax
 00417694    add         byte ptr [eax],al
 00417696    add         byte ptr [eax],al
 00417698    add         byte ptr [eax],al
 0041769A    imul        eax,dword ptr [eax],0
 004176A1    sal         byte ptr [edx+40],0
 004176A5    add         byte ptr [eax],al
 004176A7    add         byte ptr [eax],al
 004176A9    add         byte ptr [ecx+40],bh
 004176AC    add         byte ptr [eax],al
 004176AE    add         byte ptr [eax],al
 004176B0    add         byte ptr [eax+7F],al
 004176B3    inc         eax
 004176B4    add         byte ptr [eax],al
 004176B6    add         byte ptr [eax],al
 004176B8    add         al,al
 004176BA    mov         al,40
 004176BC    add         byte ptr [eax],al
 004176BE    add         byte ptr [eax],al
 004176C0    add         al,ah
 004176C2    test        dword ptr [eax],eax
 004176C5    add         byte ptr [eax],al
 004176C7    add         byte ptr [eax],al
 004176C9    add         byte ptr [ecx+40],cl
 004176CF    add         byte ptr [eax],al
 004176D1    and         byte ptr [eax+eax*2+0],cl
 004176D8    add         byte ptr [eax-71],al
 004176DB    inc         eax
 004176DC    add         byte ptr [eax],al
 004176DE    add         byte ptr [eax],al
 004176E0    add         byte ptr [eax-61],al
 004176E3    inc         eax
 004176E4    add         byte ptr [eax],al
 004176E6    add         byte ptr [eax],al
 004176E8    add         byte ptr [eax-59],dh
 004176EB    inc         eax
 004176EC    add         byte ptr [eax],al
 004176EE    add         byte ptr [eax],al
 004176F0    add         byte ptr [eax-51],al
 004176F3    inc         eax
 004176F4    add         byte ptr [eax],al
 004176F6    add         byte ptr [eax],al
 004176F8    add         byte ptr [eax+40B3],cl
 004176FE    add         byte ptr [eax],al
 00417700    add         byte ptr [eax-49],dh
 00417703    inc         eax
 00417704    add         byte ptr [eax],al
 00417706    add         byte ptr [eax],al
 00417708    add         byte ptr [eax-45],bl
 0041770B    inc         eax
 0041770C    add         byte ptr [eax],al
 0041770E    add         byte ptr [eax],al
 00417710    add         byte ptr [eax-41],al
 00417713    inc         eax
 00417714    add         byte ptr [eax],al
 00417716    add         byte ptr [eax],al
 00417718    add         byte ptr [ecx+eax*8+40],dl
 0041771F    add         byte ptr [eax],al
 00417721    mov         bl,al
 00417723    inc         eax
 00417724    add         byte ptr [eax],al
 00417726    add         byte ptr [eax],al
 00417728    add         byte ptr [eax+40D3],cl
 0041772E    add         byte ptr [eax],al
 00417730    add         byte ptr [ebp+ebx*8+40],cl
 00417734    add         byte ptr [eax],al
 00417736    add         byte ptr [eax],al
 00417738    add         byte ptr [eax+40E3],cl
 0041773E    add         byte ptr [eax],al
 00417740    add         byte ptr [edx-18],ch
 00417743    inc         eax
 00417744    add         byte ptr [eax],al
 00417746    add         byte ptr [eax],al
 00417748    add         byte ptr [ebp+ebp*8+40],cl
 0041774C    add         byte ptr [eax],al
 0041774E    add         byte ptr [eax],al
 00417750    add         byte ptr [edi],dl
 00417752    ???
 00417753    inc         eax
 00417754    add         byte ptr [eax],al
 00417756    add         byte ptr [eax],al
 00417758    add         byte ptr [eax+40F3],cl
 0041775E    add         byte ptr [eax],al
 00417760    add         cl,bh
 00417762    cmc
 00417763    inc         eax
 00417764    add         byte ptr [eax],al
 00417766    add         byte ptr [eax],al
 00417768    add         byte ptr [eax],al
 0041776A    lock mov    edi,0
 00417770    add         byte ptr [eax],al
 00417772    lock mov    edi,0
 00417778    add         byte ptr [eax],al
 0041777A    lock mov    edi,0
 00417780    add         byte ptr [eax],al
 00417782    lock mov    edi,0
 00417788    add         byte ptr [eax],al
 0041778A    lock mov    edi,0
 00417790    add         byte ptr [eax],al
 00417792    lock mov    edi,0
 00417798    add         byte ptr [eax],al
 0041779A    lock mov    edi,0
 004177A0    add         byte ptr [eax],al
 004177A2    lock mov    edi,0
 004177A8    add         byte ptr [eax],al
 004177AA    lock mov    edi,0
 004177B0    add         byte ptr [eax],al
 004177B2    lock mov    edi,0
 004177B8    add         byte ptr [eax],al
 004177BA    lock mov    edi,0
 004177C0    add         byte ptr [eax],al
 004177C2    lock mov    edi,0
 004177C8    add         byte ptr [eax],al
 004177CA    sar         byte ptr [edi],1
 004177CC    add         byte ptr [eax],al
 004177CE    add         byte ptr [eax],al
 004177D0    add         byte ptr [eax],al
 004177D2    loopne      00417813
 004177D4    add         byte ptr [eax],al
 004177D6    add         byte ptr [eax],al
 004177D8    add         byte ptr [eax],al
 004177DA    lock aas
 004177DC    add         byte ptr [eax],al
 004177DE    add         byte ptr [eax],al
 004177E0    add         byte ptr [eax],al
 004177E2    adc         al,40
 004177E4    add         byte ptr [eax],al
 004177E6    add         byte ptr [eax],al
 004177E8    add         byte ptr [eax],al
 004177EA    dec         ecx
 004177EB    inc         eax
 004177EC    add         byte ptr [eax],al
 004177EE    add         byte ptr [eax],al
 004177F0    add         byte ptr [eax+7F],al
 004177F3    inc         eax
 004177F4    add         byte ptr [eax],al
 004177F6    add         byte ptr [eax],al
 004177F8    add         byte ptr [eax+40B3],cl
 004177FE    add         byte ptr [eax],al
 00417800    add         byte ptr [edx-18],ch
 00417803    inc         eax
 00417804    add         byte ptr [eax],al
 00417806    add         byte ptr [eax],al
 00417808    add         byte ptr [eax],al
 0041780A    adc         al,40
 0041780C    add         byte ptr [eax],al
 0041780E    add         byte ptr [eax],al
 00417810    add         byte ptr [eax],al
 00417812    and         al,40
 00417814    add         byte ptr [eax],al
 00417816    add         byte ptr [eax],al
 00417818    add         byte ptr [eax],al
 0041781A    dec         ecx
 0041781B    inc         eax
 0041781C    add         byte ptr [eax],al
 0041781E    add         byte ptr [eax],al
 00417820    add         byte ptr [eax],al
 00417822    pop         ecx
 00417823    inc         eax
 00417824    add         byte ptr [eax],al
 00417826    add         byte ptr [eax],al
 00417828    add         byte ptr [eax+7F],al
 0041782B    inc         eax
 0041782C    add         byte ptr [eax],al
 0041782E    add         byte ptr [eax],al
 00417830    add         byte ptr [eax-71],al
 00417833    inc         eax
 00417834    add         byte ptr [eax],al
 00417836    add         byte ptr [eax],al
 00417838    add         byte ptr [eax+40B3],cl
 0041783E    add         byte ptr [eax],al
 00417840    add         byte ptr [eax],al
 00417842    adc         al,40
 00417844    add         byte ptr [eax],al
 00417846    add         byte ptr [eax],al
 00417848    add         byte ptr [eax],al
 0041784A    and         al,40
 0041784C    add         byte ptr [eax],al
 0041784E    add         byte ptr [eax],al
 00417850    add         byte ptr [eax],al
 00417852    dec         ecx
 00417853    inc         eax
 00417854    add         byte ptr [eax],al
 00417856    add         byte ptr [eax],al
 00417858    add         byte ptr [eax],al
 0041785A    pop         ecx
 0041785B    inc         eax
 0041785C    add         byte ptr [eax],al
 0041785E    add         byte ptr [eax],al
 00417860    add         byte ptr [eax+7F],al
 00417863    inc         eax
 00417864    add         byte ptr [eax],al
 00417866    add         byte ptr [eax],al
 00417868    add         byte ptr [eax-71],al
 0041786B    inc         eax
 0041786C    add         byte ptr [eax],al
 0041786E    add         byte ptr [eax],al
 00417870    add         byte ptr [eax+40C3],cl
 00417876    add         byte ptr [eax],al
 00417878    add         byte ptr [edx-18],ch
 0041787B    inc         eax
 0041787C    add         byte ptr [eax],al
 0041787E    add         byte ptr [eax],al
 00417880    add         byte ptr [eax],al
 00417882    and         al,40
 00417884    add         byte ptr [eax],al
 00417886    add         byte ptr [eax],al
 00417888    add         byte ptr [eax],al
 0041788A    lock aas
 0041788C    add         byte ptr [eax],al
 0041788E    add         byte ptr [eax],al
 00417890    add         byte ptr [eax],al
 00417892    lock aas
 00417894    add         byte ptr [eax],al
 00417896    add         byte ptr [eax],al
 00417898    add         byte ptr [eax],al
 0041789A    lock aas
 0041789C    add         byte ptr [eax],al
 0041789E    add         byte ptr [eax],al
 004178A0    add         byte ptr [eax],al
 004178A2    add         byte ptr [eax],al
 004178A5    add         byte ptr [eax],al
 004178A7    add         byte ptr [eax],al
 004178A9    add         byte ptr [eax],al
 004178AB    inc         eax
 004178AC    add         byte ptr [eax],al
 004178AE    add         byte ptr [eax],al
 004178B0    add         byte ptr [eax],al
 004178B2    add         byte ptr [eax],al
 004178B5    add         byte ptr [eax],al
 004178B7    add         byte ptr [eax],al
 004178B9    add         byte ptr [eax],al
 004178BB    inc         eax
 004178BC    add         byte ptr [eax],al
 004178BE    add         byte ptr [eax],al
 004178C0    add         byte ptr [eax],al
 004178C2    adc         al,40
 004178C4    add         byte ptr [eax],al
 004178C6    add         byte ptr [eax],al
 004178C8    add         byte ptr [eax],al
 004178CA    and         al,40
 004178CC    add         byte ptr [eax],al
 004178CE    add         byte ptr [eax],al
 004178D0    add         byte ptr [eax],al
 004178D2    and         al,40
 004178D4    add         byte ptr [eax],al
 004178D6    add         byte ptr [eax],al
 004178D8    add         byte ptr [eax],al
 004178DA    and         al,40
 004178DC    add         byte ptr [eax],al
 004178DE    add         byte ptr [eax],al
 004178E0    add         byte ptr [eax],al
 004178E2    and         al,40
 004178E4    add         byte ptr [eax],al
 004178E6    add         byte ptr [eax],al
 004178E8    add         byte ptr [eax],al
 004178EA    and         al,40
 004178EC    add         byte ptr [eax],al
 004178EE    add         byte ptr [eax],al
 004178F0    add         byte ptr [eax],al
 004178F2    inc         eax
 004178F4    add         byte ptr [eax],al
 004178F6    add         byte ptr [eax],al
 004178F8    add         byte ptr [eax],al
 004178FA    dec         ecx
 004178FB    inc         eax
 004178FC    add         byte ptr [eax],al
 004178FE    add         byte ptr [eax],al
 00417900    add         byte ptr [eax],al
 00417902    dec         ecx
 00417903    inc         eax
 00417904    add         byte ptr [eax],al
 00417906    add         byte ptr [eax],al
 00417908    add         byte ptr [eax],al
 0041790A    dec         ecx
 0041790B    inc         eax
 0041790C    add         byte ptr [eax],al
 0041790E    add         byte ptr [eax],al
 00417910    add         byte ptr [eax],al
 00417912    dec         ecx
 00417913    inc         eax
 00417914    add         byte ptr [eax],al
 00417916    add         byte ptr [eax],al
 00417918    add         byte ptr [eax],al
 0041791A    pop         ecx
 0041791B    inc         eax
 0041791C    add         byte ptr [eax],al
 0041791E    add         byte ptr [eax],al
 00417920    add         al,al
>00417922    jb          00417964
 00417924    add         byte ptr [eax],al
 00417926    add         byte ptr [eax],al
 00417928    add         byte ptr [eax+7F],al
 0041792B    inc         eax
 0041792C    add         byte ptr [eax],al
 0041792E    add         byte ptr [eax],al
 00417930    add         byte ptr [eax+7F],al
 00417933    inc         eax
 00417934    add         byte ptr [eax],al
 00417936    add         byte ptr [eax],al
 00417938    add         byte ptr [eax+7F],al
 0041793B    inc         eax
 0041793C    add         byte ptr [eax],al
 0041793E    add         byte ptr [eax],al
 00417940    add         byte ptr [eax+7F],al
 00417943    inc         eax
 00417944    add         byte ptr [eax],al
 00417946    add         byte ptr [eax],al
 00417948    add         byte ptr [eax+7F],al
 0041794B    inc         eax
 0041794C    add         byte ptr [eax],al
 0041794E    add         byte ptr [eax],al
 00417950    add         byte ptr [eax-71],al
 00417953    inc         eax
 00417954    add         byte ptr [eax],al
 00417956    add         byte ptr [eax],al
 00417958    add         byte ptr [eax+40B3],cl
 0041795E    add         byte ptr [eax],al
 00417960    add         byte ptr [eax],al
 00417962    adc         al,40
 00417964    add         byte ptr [eax],al
 00417966    add         byte ptr [eax],al
 00417968    add         byte ptr [eax],al
 0041796A    dec         ecx
 0041796B    inc         eax
 0041796C    add         byte ptr [eax],al
 0041796E    add         byte ptr [eax],al
 00417970    add         byte ptr [eax],al
 00417972    loopne      004179B3
 00417974    add         byte ptr [eax],al
 00417976    add         byte ptr [eax],al
 00417978    add         byte ptr [eax],al
 0041797A    loopne      004179BB
 0041797C    pop         ebp
 0041797D    push        ecx
 0041797E    dec         edx
 0041797F    or          byte ptr [esi+55],dl
 00417982    in          eax,3F
 00417984    add         byte ptr [eax],al
 00417986    add         byte ptr [eax],al
 00417988    add         byte ptr [eax],al
 0041798A    call        004179CE
 0041798F    add         byte ptr [eax],al
 00417991    add         al,dh
 00417993    mov         edi,0
 00417998    add         byte ptr [eax],al
 0041799A    lock mov    edi,0
 004179A0    add         byte ptr [eax],al
 004179A2    lock mov    edi,0
 004179A8    add         byte ptr [eax],al
 004179AA    lock mov    edi,0
 004179B0    add         byte ptr [eax],al
 004179B2    lock mov    edi,0
 004179B8    add         byte ptr [eax],al
 004179BA    lock mov    edi,0
 004179C0    add         byte ptr [eax],al
 004179C2    lock mov    edi,0
 004179C8    add         byte ptr [eax],al
 004179CA    lock mov    edi,0
 004179D0    add         byte ptr [eax],al
 004179D2    lock mov    edi,0
 004179D8    add         byte ptr [eax],al
 004179DA    lock mov    edi,0
 004179E0    add         byte ptr [eax],al
 004179E2    lock mov    edi,0
 004179E8    add         byte ptr [eax],al
 004179EA    lock mov    edi,0
 004179F0    add         byte ptr [eax],al
 004179F2    lock mov    edi,0
 004179F8    add         byte ptr [eax],al
 004179FA    lock mov    edi,0
 00417A00    add         byte ptr [eax],al
 00417A02    lock mov    edi,0
 00417A08    add         byte ptr [eax],al
 00417A0A    lock mov    edi,0
 00417A10    add         byte ptr [eax],al
 00417A12    lock mov    edi,0
 00417A18    add         byte ptr [eax],al
 00417A1A    add         byte ptr [eax],al
 00417A1C    add         byte ptr [eax],al
 00417A1E    add         byte ptr [eax],al
 00417A20    add         byte ptr [eax],al
 00417A22    lock mov    edi,0
 00417A28    add         byte ptr [eax],al
 00417A2A    lock mov    edi,0
 00417A30    add         byte ptr [eax],al
 00417A32    lock mov    edi,0
 00417A38    add         byte ptr [eax],al
 00417A3A    lock mov    edi,0
 00417A40    add         byte ptr [eax],al
 00417A42    lock mov    edi,0
 00417A48    add         byte ptr [eax],al
 00417A4A    lock aas
 00417A4C    add         byte ptr [eax],al
 00417A4E    add         byte ptr [eax],al
 00417A50    add         byte ptr [eax],al
 00417A52    adc         al,40
 00417A54    add         byte ptr [eax],al
 00417A56    add         byte ptr [eax],al
 00417A58    add         byte ptr [eax],al
 00417A5A    and         al,40
 00417A5C    add         byte ptr [eax],al
 00417A5E    add         byte ptr [eax],al
 00417A60    add         byte ptr [eax],al
 00417A62    dec         ecx
 00417A63    inc         eax
 00417A64    add         byte ptr [eax],al
 00417A66    add         byte ptr [eax],al
 00417A68    add         byte ptr [eax],al
 00417A6A    lock mov    edi,0
 00417A70    add         byte ptr [eax],al
 00417A72    lock mov    edi,0
 00417A78    add         byte ptr [eax],al
 00417A7A    lock mov    edi,0
 00417A80    add         byte ptr [eax],al
 00417A82    lock mov    edi,0
 00417A88    add         byte ptr [eax],al
 00417A8A    lock mov    edi,0
 00417A90    add         byte ptr [eax],al
 00417A92    lock mov    edi,0
 00417A98    add         byte ptr [eax],al
 00417A9A    lock mov    edi,0
 00417AA0    add         byte ptr [eax],al
 00417AA2    lock mov    edi,0
 00417AA8    add         byte ptr [eax],al
 00417AAA    lock mov    edi,0
 00417AB0    add         byte ptr [eax],al
 00417AB2    lock mov    edi,0
 00417AB8    add         byte ptr [eax],al
 00417ABA    lock mov    edi,0
 00417AC0    add         byte ptr [eax],al
 00417AC2    lock mov    edi,0
 00417AC8    add         byte ptr [eax],al
 00417ACA    lock mov    edi,0
 00417AD0    add         byte ptr [eax+4056],al
 00417AD6    add         byte ptr [eax],al
 00417AD8    add         byte ptr [eax],al
 00417ADA    lock mov    edi,0
 00417AE0    add         byte ptr [eax],al
 00417AE2    lock mov    edi,0
 00417AE8    add         byte ptr [eax],al
 00417AEA    lock mov    edi,0
 00417AF0    add         byte ptr [eax],al
 00417AF2    lock mov    edi,0
 00417AF8    add         byte ptr [eax],al
 00417AFA    lock mov    edi,0
 00417B00    add         byte ptr [eax],al
 00417B02    lock mov    edi,0
 00417B08    add         byte ptr [eax],al
 00417B0A    lock mov    edi,0
 00417B10    add         byte ptr [eax],al
 00417B12    lock mov    edi,0
 00417B18    add         byte ptr [eax],ah
 00417B1A    mov         word ptr [eax],es
 00417B1D    add         byte ptr [eax],al
 00417B1F    add         byte ptr [eax],al
 00417B21    add         al,dh
 00417B23    mov         edi,0
 00417B28    add         byte ptr [eax],al
 00417B2A    lock mov    edi,0
 00417B30    add         byte ptr [eax],al
 00417B32    lock mov    edi,0
 00417B38    add         byte ptr [eax],al
 00417B3A    lock mov    edi,0
 00417B40    add         byte ptr [eax],al
 00417B42    lock mov    edi,0
 00417B48    add         byte ptr [eax],al
 00417B4A    lock mov    edi,0
 00417B50    add         byte ptr [eax],al
 00417B52    lock aas
 00417B54    add         byte ptr [eax],al
 00417B56    add         byte ptr [eax],al
 00417B58    add         byte ptr [eax],al
 00417B5A    add         byte ptr [eax],al
 00417B5D    add         byte ptr [eax],al
 00417B5F    add         byte ptr [eax],al
 00417B61    add         byte ptr [eax+eax*2],ah
 00417B64    add         byte ptr [eax],al
 00417B66    add         byte ptr [eax],al
 00417B68    add         byte ptr [eax],al
 00417B6A    xor         al,40
 00417B6C    add         byte ptr [eax],al
 00417B6E    add         byte ptr [eax],al
 00417B70    add         byte ptr [eax],al
 00417B72    pop         ecx
 00417B73    inc         eax
 00417B74    add         byte ptr [eax],al
 00417B76    add         byte ptr [eax],al
 00417B78    add         byte ptr [eax],al
 00417B7A    lock mov    edi,0
 00417B80    add         byte ptr [eax],al
 00417B82    lock mov    edi,0
 00417B88    add         byte ptr [eax],al
 00417B8A    lock mov    edi,0
 00417B90    add         byte ptr [eax],al
 00417B92    lock mov    edi,0
 00417B98    add         byte ptr [eax],al
 00417B9A    lock mov    edi,0
 00417BA0    add         byte ptr [eax],al
 00417BA2    lock mov    edi,0
 00417BA8    add         byte ptr [eax],al
 00417BAA    lock mov    edi,0
 00417BB0    add         byte ptr [eax],al
 00417BB2    lock mov    edi,0
 00417BB8    add         byte ptr [eax],al
 00417BBA    lock mov    edi,0
 00417BC0    add         byte ptr [eax],al
 00417BC2    lock mov    edi,0
 00417BC8    add         byte ptr [eax],al
 00417BCA    lock mov    edi,0
 00417BD0    add         byte ptr [eax],al
 00417BD2    lock mov    edi,0
 00417BD8    add         byte ptr [eax],al
 00417BDA    lock mov    edi,0
 00417BE0    add         byte ptr [eax],al
 00417BE2    lock mov    edi,0
 00417BE8    add         byte ptr [eax],al
 00417BEA    lock mov    edi,0
 00417BF0    add         byte ptr [eax],al
 00417BF2    lock mov    edi,0
 00417BF8    add         byte ptr [eax],al
 00417BFA    lock mov    edi,0
 00417C00    add         byte ptr [eax],al
 00417C02    lock mov    edi,0
 00417C08    add         byte ptr [eax],al
 00417C0A    lock aas
 00417C0C    add         byte ptr [eax],al
 00417C0E    add         byte ptr [eax],al
 00417C10    add         byte ptr [eax],al
 00417C12    add         byte ptr [eax],al
 00417C15    add         byte ptr [eax],al
 00417C17    add         byte ptr [eax],al
 00417C19    add         byte ptr [eax],cl
 00417C1B    inc         eax
 00417C1C    add         byte ptr [eax],al
 00417C1E    add         byte ptr [eax],al
 00417C20    add         byte ptr [eax],al
 00417C22    and         al,40
 00417C24    add         byte ptr [eax],al
 00417C26    add         byte ptr [eax],al
 00417C28    add         byte ptr [eax],al
 00417C2A    xor         al,40
 00417C2C    add         byte ptr [eax],al
 00417C2E    add         byte ptr [eax],al
 00417C30    add         byte ptr [eax],al
 00417C32    pop         ecx
 00417C33    inc         eax
 00417C34    add         byte ptr [eax],al
 00417C36    add         byte ptr [eax],al
 00417C38    add         byte ptr [eax-71],al
 00417C3B    inc         eax
 00417C3C    add         byte ptr [eax],al
 00417C3E    add         byte ptr [eax],al
 00417C40    add         byte ptr [eax+40C3],cl
 00417C46    add         byte ptr [eax],al
 00417C48    add         byte ptr [eax],al
 00417C4A    lock mov    edi,0
 00417C50    add         byte ptr [eax],al
 00417C52    lock mov    edi,0
 00417C58    add         byte ptr [eax],al
 00417C5A    lock mov    edi,0
 00417C60    add         byte ptr [eax],al
 00417C62    lock mov    edi,0
 00417C68    add         byte ptr [eax],al
 00417C6A    lock mov    edi,0
 00417C70    add         byte ptr [eax],al
 00417C72    lock mov    edi,0
 00417C78    add         byte ptr [eax],al
 00417C7A    lock aas
 00417C7C    add         byte ptr [eax],al
 00417C7E    add         byte ptr [eax],al
 00417C80    add         byte ptr [eax],al
 00417C82    and         al,40
 00417C84    add         byte ptr [eax],al
 00417C86    add         byte ptr [eax],al
 00417C88    add         byte ptr [eax],al
 00417C8A    xor         al,40
 00417C8C    add         byte ptr [eax],al
 00417C8E    add         byte ptr [eax],al
 00417C90    add         byte ptr [eax],al
 00417C92    pop         ecx
 00417C93    inc         eax
 00417C94    add         byte ptr [eax],al
 00417C96    add         byte ptr [eax],al
 00417C98    add         byte ptr [eax],al
 00417C9A    add         byte ptr [eax],al
 00417C9D    add         byte ptr [eax],al
 00417C9F    add         byte ptr [eax],al
 00417CA1    add         byte ptr [eax],cl
 00417CA3    inc         eax
 00417CA4    add         byte ptr [eax],al
 00417CA6    add         byte ptr [eax],al
 00417CA8    add         byte ptr [eax],al
 00417CAA    lock mov    edi,0
 00417CB0    add         byte ptr [eax],al
 00417CB2    lock mov    edi,0
 00417CB8    add         byte ptr [eax],al
 00417CBA    lock mov    edi,0
 00417CC0    add         byte ptr [eax],al
 00417CC2    lock mov    edi,0
 00417CC8    add         byte ptr [eax],al
 00417CCA    lock aas
 00417CCC    add         byte ptr [eax],al
 00417CCE    add         byte ptr [eax],al
 00417CD0    add         byte ptr [eax],al
 00417CD2    add         byte ptr [eax],al
 00417CD5    add         byte ptr [eax],al
 00417CD7    add         byte ptr [eax],al
 00417CD9    add         byte ptr [eax],cl
 00417CDB    inc         eax
 00417CDC    add         byte ptr [eax],al
 00417CDE    add         byte ptr [eax],al
 00417CE0    add         byte ptr [eax],al
 00417CE2    adc         byte ptr [eax],al
 00417CE5    add         byte ptr [eax],al
 00417CE7    add         byte ptr [eax],al
 00417CE9    add         byte ptr [eax+eax*2],ah
 00417CEC    add         byte ptr [eax],al
 00417CEE    add         byte ptr [eax],al
 00417CF0    add         byte ptr [eax],al
 00417CF2    xor         al,40
 00417CF4    add         byte ptr [eax],al
 00417CF6    add         byte ptr [eax],al
 00417CF8    add         byte ptr [eax],al
 00417CFA    pop         ecx
 00417CFB    inc         eax
 00417CFC    add         byte ptr [eax],al
 00417CFE    add         byte ptr [eax],al
 00417D00    add         byte ptr [eax-71],al
 00417D03    inc         eax
 00417D04    add         byte ptr [eax],al
 00417D06    add         byte ptr [eax],al
 00417D08    add         byte ptr [eax],al
 00417D0A    lock mov    edi,0
 00417D10    add         byte ptr [eax],al
 00417D12    lock mov    edi,0
 00417D18    add         byte ptr [eax],al
 00417D1A    lock mov    edi,0
 00417D20    add         byte ptr [eax],al
 00417D22    lock mov    edi,0
 00417D28    add         byte ptr [eax],al
 00417D2A    lock mov    edi,0
 00417D30    add         byte ptr [eax],al
 00417D32    lock mov    edi,0
 00417D38    add         byte ptr [eax],al
 00417D3A    lock mov    edi,0
 00417D40    add         byte ptr [eax],al
 00417D42    lock mov    edi,0
 00417D48    add         byte ptr [eax],al
 00417D4A    lock mov    edi,0
 00417D50    add         byte ptr [eax],al
 00417D52    lock mov    edi,0
 00417D58    add         byte ptr [eax],al
 00417D5A    lock mov    edi,0
 00417D60    add         byte ptr [eax],al
 00417D62    lock mov    edi,0
 00417D68    add         byte ptr [eax],al
 00417D6A    lock mov    edi,0
 00417D70    add         byte ptr [eax],al
 00417D72    lock mov    edi,0
 00417D78    add         byte ptr [eax],al
 00417D7A    lock mov    edi,0
 00417D80    add         byte ptr [eax],al
 00417D82    lock mov    edi,0
 00417D88    add         byte ptr [eax],al
 00417D8A    lock mov    edi,0
 00417D90    add         byte ptr [eax],al
 00417D92    lock mov    edi,0
 00417D98    add         byte ptr [eax],al
 00417D9A    lock mov    edi,0
 00417DA0    add         byte ptr [eax],al
 00417DA2    lock mov    edi,0
 00417DA8    add         byte ptr [eax],al
 00417DAA    lock mov    edi,0
 00417DB0    add         byte ptr [eax],al
 00417DB2    lock aas
 00417DB4    add         byte ptr [eax],al
 00417DB6    add         byte ptr [eax],al
 00417DB8    add         byte ptr [eax],al
 00417DBA    dec         ecx
 00417DBB    inc         eax
 00417DBC    add         byte ptr [eax],al
 00417DBE    add         byte ptr [eax],al
 00417DC0    add         byte ptr [eax],al
 00417DC2    lock mov    edi,0
 00417DC8    add         byte ptr [eax],al
 00417DCA    lock mov    edi,0
 00417DD0    add         byte ptr [eax],al
 00417DD2    lock mov    edi,0
 00417DD8    add         byte ptr [eax],al
 00417DDA    lock mov    edi,0
 00417DE0    add         byte ptr [eax],al
 00417DE2    lock mov    edi,0
 00417DE8    add         byte ptr [eax],al
 00417DEA    lock mov    edi,0
 00417DF0    add         byte ptr [eax],al
 00417DF2    lock mov    edi,0
 00417DF8    add         byte ptr [eax],al
 00417DFA    lock mov    edi,0
 00417E00    add         byte ptr [eax],al
 00417E02    lock mov    edi,0
 00417E08    add         byte ptr [eax],al
 00417E0A    lock aas
 00417E0C    add         byte ptr [eax],al
 00417E0E    add         byte ptr [eax],al
 00417E10    add         byte ptr [eax],al
 00417E12    add         byte ptr [eax],al
 00417E15    add         byte ptr [eax],al
 00417E17    add         byte ptr [eax],al
 00417E19    add         byte ptr [eax],cl
 00417E1B    inc         eax
 00417E1C    add         byte ptr [eax],al
 00417E1E    add         byte ptr [eax],al
 00417E20    add         byte ptr [eax],al
 00417E22    adc         byte ptr [eax],al
 00417E25    add         byte ptr [eax],al
 00417E27    add         byte ptr [eax],al
 00417E29    add         byte ptr [eax+eax*2],ah
 00417E2C    add         byte ptr [eax],al
 00417E2E    add         byte ptr [eax],al
 00417E30    add         byte ptr [eax],al
 00417E32    xor         al,40
 00417E34    add         byte ptr [eax],al
 00417E36    add         byte ptr [eax],al
 00417E38    add         byte ptr [eax],al
 00417E3A    pop         ecx
 00417E3B    inc         eax
 00417E3C    add         byte ptr [eax],al
 00417E3E    add         byte ptr [eax],al
 00417E40    add         byte ptr [eax-71],al
 00417E43    inc         eax
 00417E44    add         byte ptr [eax],al
 00417E46    add         byte ptr [eax],al
 00417E48    add         byte ptr [eax],al
 00417E4A    push        esp
 00417E4B    inc         eax
 00417E4C    add         byte ptr [eax],al
 00417E4E    add         byte ptr [eax],al
 00417E50    add         byte ptr [eax+4056],al
 00417E56    add         byte ptr [eax],al
 00417E58    add         byte ptr [eax],al
 00417E5A    pop         ecx
 00417E5B    inc         eax
 00417E5C    add         byte ptr [eax],al
 00417E5E    add         byte ptr [eax],al
 00417E60    add         byte ptr [eax],al
 00417E62    imul        eax,dword ptr [eax],0
 00417E69    sal         byte ptr [edx+40],0
 00417E6D    add         byte ptr [eax],al
 00417E6F    add         byte ptr [eax],al
 00417E71    add         byte ptr [ecx+40],bh
 00417E74    add         byte ptr [eax],al
 00417E76    add         byte ptr [eax],al
 00417E78    add         byte ptr [eax+7F],al
 00417E7B    inc         eax
 00417E7C    add         byte ptr [eax],al
 00417E7E    add         byte ptr [eax],al
 00417E80    add         al,al
 00417E82    mov         al,40
 00417E84    add         byte ptr [eax],al
 00417E86    add         byte ptr [eax],al
 00417E88    add         al,ah
 00417E8A    test        dword ptr [eax],eax
 00417E8D    add         byte ptr [eax],al
 00417E8F    add         byte ptr [eax],al
 00417E91    add         byte ptr [ecx+40],cl
 00417E97    add         byte ptr [eax],al
 00417E99    and         byte ptr [eax+eax*2+0],cl
 00417EA0    add         byte ptr [eax],al
 00417EA2    loopne      00417EE3
 00417EA4    add         byte ptr [eax],al
 00417EA6    add         byte ptr [eax],al
 00417EA8    add         byte ptr [eax],al
 00417EAA    sar         byte ptr [edi],1
 00417EAC    inc         esi
 00417EAD    pop         ebp
 00417EAE    imul        ebp,edi,53
 00417EB1    push        ebp
 00417EB2    ???
 00417EB3    aas
 00417EB4    pop         ebp
 00417EB5    push        ecx
 00417EB6    dec         edx
 00417EB7    or          byte ptr [esi+55],dl
 00417EBA    in          eax,3F
 00417EBC    add         byte ptr [eax],al
 00417EBE    add         byte ptr [eax],al
 00417EC0    add         byte ptr [eax],al
 00417EC2    lock mov    edi,0
 00417EC8    add         byte ptr [eax],al
 00417ECA    add         byte ptr [eax],al
 00417ECD    add         byte ptr [eax],al
 00417ECF    add         byte ptr [eax],al
 00417ED1    add         byte ptr [eax],cl
 00417ED3    inc         eax
 00417ED4    add         byte ptr [eax],al
 00417ED6    add         byte ptr [eax],al
 00417ED8    add         byte ptr [eax],al
 00417EDA    adc         byte ptr [eax],al
 00417EDD    add         byte ptr [eax],al
 00417EDF    add         byte ptr [eax],al
 00417EE1    add         byte ptr [eax+eax*2],dl
 00417EE4    add         byte ptr [eax],al
 00417EE6    add         byte ptr [eax],al
 00417EE8    add         byte ptr [eax],al
 00417EEA    sbb         byte ptr [eax],al
 00417EED    add         byte ptr [eax],al
 00417EEF    add         byte ptr [eax],al
 00417EF1    add         byte ptr [eax+eax*2],bl
 00417EF4    add         byte ptr [eax],al
 00417EF6    add         byte ptr [eax],al
 00417EF8    add         byte ptr [eax],al
 00417EFA    and         byte ptr [eax],al
 00417EFD    add         byte ptr [eax],al
 00417EFF    add         byte ptr [eax],al
 00417F01    add         byte ptr [edx],ah
 00417F03    inc         eax
 00417F04    add         byte ptr [eax],al
 00417F06    add         byte ptr [eax],al
 00417F08    add         byte ptr [eax],al
 00417F0A    or          byte ptr [eax],al
 00417F0D    add         byte ptr [eax],al
 00417F0F    add         byte ptr [eax],al
 00417F11    add         byte ptr [eax],dl
 00417F13    inc         eax
 00417F14    add         byte ptr [eax],al
 00417F16    add         byte ptr [eax],al
 00417F18    add         byte ptr [eax],al
 00417F1A    adc         al,40
 00417F1C    add         byte ptr [eax],al
 00417F1E    add         byte ptr [eax],al
 00417F20    add         byte ptr [eax],al
 00417F22    sbb         byte ptr [eax],al
 00417F25    add         byte ptr [eax],al
 00417F27    add         byte ptr [eax],al
 00417F29    add         byte ptr [eax+eax*2],bl
 00417F2C    add         byte ptr [eax],al
 00417F2E    add         byte ptr [eax],al
 00417F30    add         byte ptr [eax],al
 00417F32    and         byte ptr [eax],al
 00417F35    add         byte ptr [eax],al
 00417F37    add         byte ptr [eax],al
 00417F39    add         byte ptr [edx],ah
 00417F3B    inc         eax
 00417F3C    add         byte ptr [eax],al
 00417F3E    add         byte ptr [eax],al
 00417F40    add         byte ptr [eax],al
 00417F42    adc         byte ptr [eax],al
 00417F45    add         byte ptr [eax],al
 00417F47    add         byte ptr [eax],al
 00417F49    add         byte ptr [eax+eax*2],dl
 00417F4C    add         byte ptr [eax],al
 00417F4E    add         byte ptr [eax],al
 00417F50    add         byte ptr [eax],al
 00417F52    sbb         byte ptr [eax],al
 00417F55    add         byte ptr [eax],al
 00417F57    add         byte ptr [eax],al
 00417F59    add         byte ptr [eax+eax*2],bl
 00417F5C    add         byte ptr [eax],al
 00417F5E    add         byte ptr [eax],al
 00417F60    add         byte ptr [eax],al
 00417F62    and         byte ptr [eax],al
 00417F65    add         byte ptr [eax],al
 00417F67    add         byte ptr [eax],al
 00417F69    add         byte ptr [edx],ah
 00417F6B    inc         eax
 00417F6C    add         byte ptr [eax],al
 00417F6E    add         byte ptr [eax],al
 00417F70    add         byte ptr [eax],al
 00417F72    lock aas
 00417F74    add         byte ptr [eax],al
 00417F76    add         byte ptr [eax],al
 00417F78    add         byte ptr [eax],al
 00417F7A    add         byte ptr [eax],al
 00417F7D    add         byte ptr [eax],al
 00417F7F    add         byte ptr [eax],al
 00417F81    add         byte ptr [eax],cl
 00417F83    inc         eax
 00417F84    add         byte ptr [eax],al
 00417F86    add         byte ptr [eax],al
 00417F88    add         byte ptr [eax],al
 00417F8A    adc         byte ptr [eax],al
 00417F8D    add         byte ptr [eax],al
 00417F8F    add         byte ptr [eax],al
 00417F91    add         byte ptr [eax+eax*2],dl
 00417F94    add         byte ptr [eax],al
 00417F96    add         byte ptr [eax],al
 00417F98    add         byte ptr [eax],al
 00417F9A    sbb         byte ptr [eax],al
 00417F9D    add         byte ptr [eax],al
 00417F9F    add         byte ptr [eax],al
 00417FA1    add         byte ptr [eax+eax*2],bl
 00417FA4    add         byte ptr [eax],al
 00417FA6    add         byte ptr [eax],al
 00417FA8    add         byte ptr [eax],al
 00417FAA    and         byte ptr [eax],al
 00417FAD    add         byte ptr [eax],al
 00417FAF    add         byte ptr [eax],al
 00417FB1    add         byte ptr [edx],ah
 00417FB3    inc         eax
 00417FB4    add         byte ptr [eax],al
 00417FB6    add         byte ptr [eax],al
 00417FB8    add         byte ptr [eax],al
 00417FBA    lock aas
 00417FBC    add         byte ptr [eax],al
 00417FBE    add         byte ptr [eax],al
 00417FC0    add         byte ptr [eax],al
 00417FC2    add         byte ptr [eax],al
 00417FC5    add         byte ptr [eax],al
 00417FC7    add         byte ptr [eax],al
 00417FC9    add         byte ptr [eax],cl
 00417FCB    inc         eax
 00417FCC    add         byte ptr [eax],al
 00417FCE    add         byte ptr [eax],al
 00417FD0    add         byte ptr [eax],al
 00417FD2    adc         byte ptr [eax],al
 00417FD5    add         byte ptr [eax],al
 00417FD7    add         byte ptr [eax],al
 00417FD9    add         byte ptr [eax+eax*2],dl
 00417FDC    add         byte ptr [eax],al
 00417FDE    add         byte ptr [eax],al
 00417FE0    add         byte ptr [eax],al
 00417FE2    add         byte ptr [eax],al
 00417FE5    add         byte ptr [eax],al
 00417FE7    add         byte ptr [eax],al
 00417FE9    add         byte ptr [eax],cl
 00417FEB    inc         eax
 00417FEC    add         byte ptr [eax],al
 00417FEE    add         byte ptr [eax],al
 00417FF0    add         byte ptr [eax],al
 00417FF2    or          byte ptr [eax],al
 00417FF5    add         byte ptr [eax],al
 00417FF7    add         byte ptr [eax],al
 00417FF9    add         byte ptr [eax],dl
 00417FFB    inc         eax
 00417FFC    add         byte ptr [eax],al
 00417FFE    add         byte ptr [eax],al
 00418000    add         byte ptr [eax],al
 00418002    adc         al,40
 00418004    add         byte ptr [eax],al
 00418006    add         byte ptr [eax],al
 00418008    add         byte ptr [eax],al
 0041800A    sbb         byte ptr [eax],al
 0041800D    add         byte ptr [eax],al
 0041800F    add         byte ptr [eax],al
 00418011    add         byte ptr [eax+eax*2],bl
 00418014    add         byte ptr [eax],al
 00418016    add         byte ptr [eax],al
 00418018    add         byte ptr [eax],al
 0041801A    and         byte ptr [eax],al
 0041801D    add         byte ptr [eax],al
 0041801F    add         byte ptr [eax],al
 00418021    add         byte ptr [edx],ah
 00418023    inc         eax
 00418024    add         byte ptr [eax],al
 00418026    add         byte ptr [eax],al
 00418028    add         byte ptr [eax],al
 0041802A    lock aas
 0041802C    add         byte ptr [eax],al
 0041802E    add         byte ptr [eax],al
 00418030    add         byte ptr [eax],al
 00418032    add         byte ptr [eax],al
 00418035    add         byte ptr [eax],al
 00418037    add         byte ptr [eax],al
 00418039    add         byte ptr [eax],cl
 0041803B    inc         eax
 0041803C    add         byte ptr [eax],al
 0041803E    add         byte ptr [eax],al
 00418040    add         byte ptr [eax],al
 00418042    or          byte ptr [eax],al
 00418045    add         byte ptr [eax],al
 00418047    add         byte ptr [eax],al
 00418049    add         byte ptr [eax],dl
 0041804B    inc         eax
 0041804C    add         byte ptr [eax],al
 0041804E    add         byte ptr [eax],al
 00418050    add         byte ptr [eax],al
 00418052    adc         al,40
 00418054    add         byte ptr [eax],al
 00418056    add         byte ptr [eax],al
 00418058    add         byte ptr [eax],al
 0041805A    lock mov    edi,0
 00418060    add         byte ptr [eax],al
 00418062    lock mov    edi,0
 00418068    add         byte ptr [eax],al
 0041806A    lock aas
 0041806C    add         byte ptr [eax],al
 0041806E    add         byte ptr [eax],al
 00418070    add         byte ptr [eax],al
 00418072    add         byte ptr [eax],al
 00418075    add         byte ptr [eax],al
 00418077    add         byte ptr [eax],al
 00418079    add         byte ptr [eax],cl
 0041807B    inc         eax
 0041807C    add         byte ptr [eax],al
 0041807E    add         byte ptr [eax],al
 00418080    add         byte ptr [eax],al
 00418082    or          byte ptr [eax],al
 00418085    add         byte ptr [eax],al
 00418087    add         byte ptr [eax],al
 00418089    add         byte ptr [eax],dl
 0041808B    inc         eax
 0041808C    add         byte ptr [eax],al
 0041808E    add         byte ptr [eax],al
 00418090    add         byte ptr [eax],al
 00418092    adc         al,40
 00418094    add         byte ptr [eax],al
 00418096    add         byte ptr [eax],al
 00418098    add         byte ptr [eax],al
 0041809A    or          byte ptr [eax],al
 0041809D    add         byte ptr [eax],al
 0041809F    add         byte ptr [eax],al
 004180A1    add         byte ptr [eax],cl
 004180A3    inc         eax
 004180A4    add         byte ptr [eax],al
 004180A6    add         byte ptr [eax],al
 004180A8    add         byte ptr [eax],al
 004180AA    adc         byte ptr [eax],al
 004180AD    add         byte ptr [eax],al
 004180AF    add         byte ptr [eax],al
 004180B1    add         byte ptr [eax],dl
 004180B3    inc         eax
 004180B4    add         byte ptr [eax],al
 004180B6    add         byte ptr [eax],al
 004180B8    add         byte ptr [eax],al
 004180BA    adc         byte ptr [eax],al
 004180BD    add         byte ptr [eax],al
 004180BF    add         byte ptr [eax],al
 004180C1    add         byte ptr [eax],dl
 004180C3    inc         eax
 004180C4    add         byte ptr [eax],al
 004180C6    add         byte ptr [eax],al
 004180C8    add         byte ptr [eax],al
 004180CA    sbb         byte ptr [eax],al
 004180CD    add         byte ptr [eax],al
 004180CF    add         byte ptr [eax],al
 004180D1    add         byte ptr [eax+eax*2],bl
 004180D4    add         byte ptr [eax],al
 004180D6    add         byte ptr [eax],al
 004180D8    add         byte ptr [eax],al
 004180DA    sbb         al,40
 004180DC    add         byte ptr [eax],al
 004180DE    add         byte ptr [eax],al
 004180E0    add         byte ptr [eax],al
 004180E2    sbb         al,40
 004180E4    add         byte ptr [eax],al
 004180E6    add         byte ptr [eax],al
 004180E8    add         byte ptr [eax],al
 004180EA    and         byte ptr [eax],al
 004180ED    add         byte ptr [eax],al
 004180EF    add         byte ptr [eax],al
 004180F1    add         byte ptr [eax],ah
 004180F3    inc         eax
 004180F4    add         byte ptr [eax],al
 004180F6    add         byte ptr [eax],al
 004180F8    add         byte ptr [eax],al
 004180FA    and         al,byte ptr [eax]
 004180FD    add         byte ptr [eax],al
 004180FF    add         byte ptr [eax],al
 00418101    add         byte ptr [edx],ah
 00418103    inc         eax
 00418104    add         byte ptr [eax],al
 00418106    add         byte ptr [eax],al
 00418108    add         byte ptr [eax],al
 0041810A    and         al,byte ptr [eax]
 0041810D    add         byte ptr [eax],al
 0041810F    add         byte ptr [eax],al
 00418111    add         byte ptr [edx],ah
 00418113    inc         eax
 00418114    add         byte ptr [eax],al
 00418116    add         byte ptr [eax],al
 00418118    add         byte ptr [eax],al
 0041811A    add         byte ptr [eax],al
 0041811D    add         byte ptr [eax],al
 0041811F    add         byte ptr [eax],al
 00418121    add         byte ptr [eax],cl
 00418123    inc         eax
 00418124    add         byte ptr [eax],al
 00418126    add         byte ptr [eax],al
 00418128    add         byte ptr [eax],al
 0041812A    adc         byte ptr [eax],al
 0041812D    add         byte ptr [eax],al
 0041812F    add         byte ptr [eax],al
 00418131    add         byte ptr [eax+eax*2],dl
 00418134    add         byte ptr [eax],al
 00418136    add         byte ptr [eax],al
 00418138    add         byte ptr [eax],al
 0041813A    sbb         byte ptr [eax],al
 0041813D    add         byte ptr [eax],al
 0041813F    add         byte ptr [eax],al
 00418141    add         al,dh
 00418143    aas
 00418144    add         byte ptr [eax],al
 00418146    add         byte ptr [eax],al
 00418148    add         byte ptr [eax],al
 0041814A    add         byte ptr [eax],al
 0041814D    add         byte ptr [eax],al
 0041814F    add         byte ptr [eax],al
 00418151    add         byte ptr [eax],cl
 00418153    inc         eax
 00418154    add         byte ptr [eax],al
 00418156    add         byte ptr [eax],al
 00418158    add         byte ptr [eax],al
 0041815A    adc         byte ptr [eax],al
 0041815D    add         byte ptr [eax],al
 0041815F    add         byte ptr [eax],al
 00418161    add         byte ptr [eax],dl
 00418163    inc         eax
 00418164    add         byte ptr [eax],al
 00418166    add         byte ptr [eax],al
 00418168    add         byte ptr [eax],al
 0041816A    adc         al,40
 0041816C    add         byte ptr [eax],al
 0041816E    add         byte ptr [eax],al
 00418170    add         byte ptr [eax],al
 00418172    adc         al,40
 00418174    add         byte ptr [eax],al
 00418176    add         byte ptr [eax],al
 00418178    add         byte ptr [eax],al
 0041817A    lock mov    edi,0
 00418180    add         byte ptr [eax],al
 00418182    lock mov    edi,0
 00418188    add         byte ptr [eax],al
 0041818A    lock aas
 0041818C    add         byte ptr [eax],al
 0041818E    add         byte ptr [eax],al
 00418190    add         byte ptr [eax],al
 00418192    add         byte ptr [eax+46],al
 00418195    pop         ebp
 00418196    imul        ebp,edi,53
 00418199    push        ebp
 0041819A    ???
 0041819B    aas
 0041819C    pop         ebp
 0041819D    push        ecx
 0041819E    dec         edx
 0041819F    or          byte ptr [esi+55],dl
 004181A2    in          eax,3F
 004181A4    mov         [A9F7B5AE],eax
 004181A9    stos        byte ptr [edi]
 004181AA    jmp         53EF:6B5D463F
 004181B1    push        ebp
 004181B2    ???
 004181B3    aas
 004181B4    pop         ebp
 004181B5    push        ecx
 004181B6    dec         edx
 004181B7    or          byte ptr [esi+55],dl
 004181BA    in          eax,3F
 004181BC    add         byte ptr [eax],al
 004181BE    add         byte ptr [eax],al
 004181C0    add         byte ptr [eax],al
 004181C2    sar         byte ptr [edi],0
 004181C5    add         byte ptr [eax],al
 004181C7    add         byte ptr [eax],al
 004181C9    add         al,dl
 004181CB    aas
>004181CC    je          00418213
 004181CE    sub         dword ptr [ecx],esp
 004181D0    pop         eax
 004181D1    push        ebp
 004181D2    lds         edi,fword ptr [edi]
 004181D4    add         byte ptr [eax],al
 004181D6    add         byte ptr [eax],al
 004181D8    add         byte ptr [eax],al
 004181DA    sar         byte ptr [edi],1
 004181DC    add         byte ptr [eax],al
 004181DE    add         byte ptr [eax],al
 004181E0    add         byte ptr [eax],al
 004181E2    lock mov    edi,0
 004181E8    add         byte ptr [eax],al
 004181EA    lock mov    edi,0
 004181F0    add         byte ptr [eax],al
 004181F2    lock mov    edi,0
 004181F8    add         byte ptr [eax],al
 004181FA    lock mov    edi,0
 00418200    add         byte ptr [eax],al
 00418202    lock mov    edi,0
 00418208    add         byte ptr [eax],al
 0041820A    lock mov    edi,0
 00418210    add         byte ptr [eax],al
 00418212    lock mov    edi,0
 00418218    add         byte ptr [eax],al
 0041821A    lock mov    edi,0
 00418220    add         byte ptr [eax],al
 00418222    lock mov    edi,0
 00418228    add         byte ptr [eax],al
 0041822A    lock mov    edi,0
 00418230    add         byte ptr [eax],al
 00418232    lock mov    edi,0
 00418238    add         byte ptr [eax],al
 0041823A    lock mov    edi,0
 00418240    add         byte ptr [eax],al
 00418242    lock mov    edi,0
 00418248    add         byte ptr [eax],al
 0041824A    push        esp
 0041824B    inc         eax
 0041824C    add         byte ptr [eax],al
 0041824E    add         byte ptr [eax],al
 00418250    add         byte ptr [eax+4056],al
 00418256    add         byte ptr [eax],al
 00418258    add         byte ptr [eax],al
 0041825A    lock mov    edi,0
 00418260    add         byte ptr [eax],al
 00418262    lock mov    edi,0
 00418268    add         byte ptr [eax],al
 0041826A    lock mov    edi,0
 00418270    add         byte ptr [eax],al
 00418272    lock mov    edi,0
 00418278    add         byte ptr [eax],al
 0041827A    lock mov    edi,0
 00418280    add         byte ptr [eax],al
 00418282    lock mov    edi,0
 00418288    add         byte ptr [eax],al
 0041828A    lock mov    edi,0
 00418290    add         byte ptr [eax],al
 00418292    lock mov    edi,0
 00418298    add         byte ptr [eax],al
 0041829A    lock mov    edi,0
 004182A0    add         byte ptr [eax],al
 004182A2    lock mov    edi,0
 004182A8    add         byte ptr [eax],al
 004182AA    lock mov    edi,0
 004182B0    add         byte ptr [eax],al
 004182B2    lock mov    edi,0
 004182B8    add         byte ptr [eax],al
 004182BA    lock mov    edi,0
 004182C0    add         byte ptr [eax],al
 004182C2    lock mov    edi,0
 004182C8    add         byte ptr [eax],al
 004182CA    add         byte ptr [eax],al
 004182CD    add         byte ptr [eax],al
 004182CF    add         byte ptr [eax],al
 004182D1    add         byte ptr [eax],cl
 004182D3    inc         eax
 004182D4    add         byte ptr [eax],al
 004182D6    add         byte ptr [eax],al
 004182D8    add         byte ptr [eax],al
 004182DA    adc         byte ptr [eax],al
 004182DD    add         byte ptr [eax],al
 004182DF    add         byte ptr [eax],al
 004182E1    add         byte ptr [eax+eax*2],dl
 004182E4    add         byte ptr [eax],al
 004182E6    add         byte ptr [eax],al
 004182E8    add         byte ptr [eax],al
 004182EA    sbb         byte ptr [eax],al
 004182ED    add         byte ptr [eax],al
 004182EF    add         byte ptr [eax],al
 004182F1    add         byte ptr [eax+eax*2],bl
 004182F4    add         byte ptr [eax],al
 004182F6    add         byte ptr [eax],al
 004182F8    add         byte ptr [eax],al
 004182FA    and         byte ptr [eax],al
 004182FD    add         byte ptr [eax],al
 004182FF    add         byte ptr [eax],al
 00418301    add         byte ptr [edx],ah
 00418303    inc         eax
 00418304    add         byte ptr [eax],al
 00418306    add         byte ptr [eax],al
 00418308    add         byte ptr [eax],al
 0041830A    add         byte ptr [eax],al
 0041830C    add         byte ptr [eax],al
 0041830E    add         byte ptr [eax],al
 00418310    add         byte ptr [eax],al
 00418312    lock aas
 00418314    add         byte ptr [eax],al
 00418316    add         byte ptr [eax],al
 00418318    add         byte ptr [eax],al
 0041831A    add         byte ptr [eax],al
 0041831D    add         byte ptr [eax],al
 0041831F    add         byte ptr [eax],al
 00418321    add         byte ptr [eax],cl
 00418323    inc         eax
 00418324    add         byte ptr [eax],al
 00418326    add         byte ptr [eax],al
 00418328    add         byte ptr [eax],al
 0041832A    adc         byte ptr [eax],al
 0041832D    add         byte ptr [eax],al
 0041832F    add         byte ptr [eax],al
 00418331    add         byte ptr [eax+eax*2],dl
 00418334    add         byte ptr [eax],al
 00418336    add         byte ptr [eax],al
 00418338    add         byte ptr [eax],al
 0041833A    sbb         byte ptr [eax],al
 0041833D    add         byte ptr [eax],al
 0041833F    add         byte ptr [eax],al
 00418341    add         byte ptr [eax+eax*2],bl
 00418344    add         byte ptr [eax],al
 00418346    add         byte ptr [eax],al
 00418348    add         byte ptr [eax],al
 0041834A    and         byte ptr [eax],al
 0041834D    add         byte ptr [eax],al
 0041834F    add         byte ptr [eax],al
 00418351    add         byte ptr [edx],ah
 00418353    inc         eax
 00418354    add         byte ptr [eax],al
 00418356    add         byte ptr [eax],al
 00418358    add         byte ptr [eax],al
 0041835A    add         byte ptr [eax],al
 0041835C    add         byte ptr [eax],al
 0041835E    add         byte ptr [eax],al
 00418360    add         byte ptr [eax],al
 00418362    lock aas
 00418364    add         byte ptr [eax],al
 00418366    add         byte ptr [eax],al
 00418368    add         byte ptr [eax],al
 0041836A    add         byte ptr [eax],al
 0041836D    add         byte ptr [eax],al
 0041836F    add         byte ptr [eax],al
 00418371    add         byte ptr [eax],cl
 00418373    inc         eax
 00418374    add         byte ptr [eax],al
 00418376    add         byte ptr [eax],al
 00418378    add         byte ptr [eax],al
 0041837A    adc         byte ptr [eax],al
 0041837D    add         byte ptr [eax],al
 0041837F    add         byte ptr [eax],al
 00418381    add         byte ptr [eax+eax*2],dl
 00418384    add         byte ptr [eax],al
 00418386    add         byte ptr [eax],al
 00418388    add         byte ptr [eax],al
 0041838A    sbb         byte ptr [eax],al
 0041838D    add         byte ptr [eax],al
 0041838F    add         byte ptr [eax],al
 00418391    add         byte ptr [eax+eax*2],bl
 00418394    add         byte ptr [eax],al
 00418396    add         byte ptr [eax],al
 00418398    add         byte ptr [eax],al
 0041839A    and         byte ptr [eax],al
 0041839D    add         byte ptr [eax],al
 0041839F    add         byte ptr [eax],al
 004183A1    add         byte ptr [edx],ah
 004183A3    inc         eax
 004183A4    add         byte ptr [eax],al
 004183A6    add         byte ptr [eax],al
 004183A8    add         byte ptr [eax],al
 004183AA    add         byte ptr [eax],al
 004183AC    add         byte ptr [eax],al
 004183AE    add         byte ptr [eax],al
 004183B0    add         byte ptr [eax],al
 004183B2    lock aas
 004183B4    add         byte ptr [eax],al
 004183B6    add         byte ptr [eax],al
 004183B8    add         byte ptr [eax],al
 004183BA    add         byte ptr [eax],al
 004183BD    add         byte ptr [eax],al
 004183BF    add         byte ptr [eax],al
 004183C1    add         byte ptr [eax],cl
 004183C3    inc         eax
 004183C4    add         byte ptr [eax],al
 004183C6    add         byte ptr [eax],al
 004183C8    add         byte ptr [eax],al
 004183CA    add         byte ptr [eax],al
 004183CC    add         byte ptr [eax],al
 004183CE    add         byte ptr [eax],al
 004183D0    add         byte ptr [eax],al
 004183D2    add         byte ptr [eax],al
 004183D4    add         byte ptr [eax],al
 004183D6    add         byte ptr [eax],al
 004183D8    add         byte ptr [eax],al
 004183DA    lock aas
 004183DC    add         byte ptr [eax],al
 004183DE    add         byte ptr [eax],al
 004183E0    add         byte ptr [eax],al
 004183E2    add         byte ptr [eax],al
 004183E5    add         byte ptr [eax],al
 004183E7    add         byte ptr [eax],al
 004183E9    add         byte ptr [eax],cl
 004183EB    inc         eax
 004183EC    add         byte ptr [eax],al
 004183EE    add         byte ptr [eax],al
 004183F0    add         byte ptr [eax],al
 004183F2    adc         byte ptr [eax],al
 004183F5    add         byte ptr [eax],al
 004183F7    add         byte ptr [eax],al
 004183F9    add         byte ptr [eax+eax*2],dl
 004183FC    add         byte ptr [eax],al
 004183FE    add         byte ptr [eax],al
 00418400    add         byte ptr [eax],al
 00418402    sbb         byte ptr [eax],al
 00418405    add         byte ptr [eax],al
 00418407    add         byte ptr [eax],al
 00418409    add         byte ptr [eax+eax*2],bl
 0041840C    add         byte ptr [eax],al
 0041840E    add         byte ptr [eax],al
 00418410    add         byte ptr [eax],al
 00418412    and         byte ptr [eax],al
 00418415    add         byte ptr [eax],al
 00418417    add         byte ptr [eax],al
 00418419    add         byte ptr [edx],ah
 0041841B    inc         eax
 0041841C    add         byte ptr [eax],al
 0041841E    add         byte ptr [eax],al
 00418420    add         byte ptr [eax],al
 00418422    lock mov    edi,0
 00418428    add         byte ptr [eax],al
 0041842A    lock mov    edi,0
 00418430    add         byte ptr [eax],al
 00418432    lock mov    edi,0
 00418438    add         byte ptr [eax],al
 0041843A    lock mov    edi,0
 00418440    add         byte ptr [eax],al
 00418442    lock mov    edi,408DC3
*}
end;

//00418448
procedure TCharacter.Initialize;
begin
{*
 00418448    push        ebx
 00418449    mov         ecx,790CA8
 0041844E    mov         eax,40F50C;bin_data
 00418453    mov         dword ptr [ecx],eax
 00418455    mov         eax,dword ptr [ecx]
 00418457    mov         edx,dword ptr [ecx]
 00418459    mov         ebx,edx
 0041845B    add         ebx,dword ptr [eax]
 0041845D    mov         dword ptr ds:[790CAC],ebx
 00418463    mov         ebx,edx
 00418465    add         ebx,dword ptr [eax+4]
 00418468    mov         dword ptr ds:[790CB0],ebx
 0041846E    mov         ebx,edx
 00418470    add         ebx,dword ptr [eax+8]
 00418473    mov         dword ptr ds:[790CB4],ebx
 00418479    mov         ebx,edx
 0041847B    add         ebx,dword ptr [eax+0C]
 0041847E    mov         dword ptr ds:[790CB8],ebx
 00418484    mov         ebx,edx
 00418486    add         ebx,dword ptr [eax+10]
 00418489    mov         dword ptr ds:[790CBC],ebx
 0041848F    add         edx,dword ptr [eax+14]
 00418492    mov         dword ptr ds:[790CC0],edx
 00418498    pop         ebx
 00418499    ret
*}
end;

//0041849C
function TCharacter.IsWhiteSpace:Boolean;
begin
{*
 0041849C    push        ebx
 0041849D    mov         ebx,eax
 0041849F    mov         eax,ebx
 004184A1    call        TCharacter.IsLatin1
 004184A6    test        al,al
>004184A8    je          004184D2
 004184AA    cmp         bx,20
>004184AE    je          004184CE
 004184B0    cmp         bx,9
>004184B4    jb          004184BC
 004184B6    cmp         bx,0D
>004184BA    jbe         004184CE
 004184BC    cmp         bx,0A0
>004184C1    je          004184CE
 004184C3    cmp         bx,85
>004184C8    je          004184CE
 004184CA    xor         eax,eax
>004184CC    jmp         00418519
 004184CE    mov         al,1
 004184D0    pop         ebx
 004184D1    ret
 004184D2    cmp         dword ptr ds:[790CB4],0
>004184D9    jne         004184E0
 004184DB    call        TCharacter.Initialize
 004184E0    movzx       eax,bx
 004184E3    mov         edx,eax
 004184E5    shr         edx,8
 004184E8    mov         ecx,dword ptr ds:[790CAC]
 004184EE    movzx       edx,word ptr [ecx+edx*2]
 004184F2    mov         ecx,eax
 004184F4    shr         ecx,4
 004184F7    and         ecx,0F
 004184FA    add         edx,ecx
 004184FC    mov         ecx,dword ptr ds:[790CB0]
 00418502    movzx       edx,word ptr [ecx+edx*2]
 00418506    and         eax,0F
 00418509    add         edx,eax
 0041850B    mov         eax,[00790CB4]
 00418510    movzx       eax,byte ptr [eax+edx]
 00418514    call        TCharacter.CheckSeparator
 00418519    pop         ebx
 0041851A    ret
*}
end;

Initialization
//007800C4
{*
 007800C4    sub         dword ptr ds:[790CC4],1
>007800CB    jae         007800E1
 007800CD    mov         eax,418714
 007800D2    call        @InitResStringImports
 007800D7    mov         eax,418844
 007800DC    call        @InitImports
 007800E1    ret
*}
Finalization
//004186CC
{*
 004186CC    push        ebp
 004186CD    mov         ebp,esp
 004186CF    xor         eax,eax
 004186D1    push        ebp
 004186D2    push        418708
 004186D7    push        dword ptr fs:[eax]
 004186DA    mov         dword ptr fs:[eax],esp
 004186DD    inc         dword ptr ds:[790CC4]
>004186E3    jne         004186FA
 004186E5    mov         eax,784BA8;gvar_00784BA8:array[25] of ?
 004186EA    mov         ecx,19
 004186EF    mov         edx,dword ptr ds:[418680];TExceptRec
 004186F5    call        @FinalizeArray
 004186FA    xor         eax,eax
 004186FC    pop         edx
 004186FD    pop         ecx
 004186FE    pop         ecx
 004186FF    mov         dword ptr fs:[eax],edx
 00418702    push        41870F
 00418707    ret
>00418708    jmp         @HandleFinally
>0041870D    jmp         00418707
 0041870F    pop         ebp
 00418710    ret
*}
end.