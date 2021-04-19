//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit151;

interface

uses
  SysUtils, Classes;

    procedure sub_0073F10C;//0073F10C
    procedure sub_0073F110(?:UnicodeString);//0073F110
    //function sub_0073F1EC:?;//0073F1EC
    //function sub_0073F228:?;//0073F228
    //function sub_0073F264:?;//0073F264
    //function sub_0073F2A4:?;//0073F2A4
    procedure sub_0073F2F0;//0073F2F0
    //function sub_0073F2F4:?;//0073F2F4
    //procedure sub_0073F338(?:?);//0073F338
    procedure sub_0073F404(?:UnicodeString);//0073F404
    procedure sub_0073F6E8;//0073F6E8
    //function sub_0073F6F4(?:UnicodeString):?;//0073F6F4
    //procedure sub_0073F77C(?:?; ?:?);//0073F77C
    //procedure sub_0073F880(?:?; ?:?);//0073F880
    //procedure sub_007406B0(?:?);//007406B0
    procedure sub_00740A80;//00740A80
    procedure sub_00740F70;//00740F70
    procedure sub_007411C0;//007411C0
    procedure sub_0074174C;//0074174C
    procedure sub_00741B5C;//00741B5C
    procedure sub_00741DAC(?:UnicodeString);//00741DAC
    //procedure sub_00741FA8(?:?; ?:UnicodeString);//00741FA8
    //procedure sub_0074202C(?:?);//0074202C
    //function sub_007420CC:?;//007420CC
    //function sub_00742120:?;//00742120
    //procedure sub_007421AC(?:UnicodeString; ?:?);//007421AC
    //procedure sub_0074226C(?:?);//0074226C
    //procedure sub_0074230C(?:?);//0074230C
    //procedure sub_007423A4(?:?);//007423A4
    //procedure sub_00742488(?:?; ?:?);//00742488
    //procedure sub_00742544(?:?; ?:?);//00742544
    //procedure sub_00742644(?:?);//00742644
    //procedure sub_00742704(?:?);//00742704
    //procedure sub_00742810(?:?);//00742810
    //procedure sub_007428C0(?:?);//007428C0
    //procedure sub_00742970(?:?);//00742970
    procedure sub_00742D0C(?:UnicodeString);//00742D0C
    //procedure sub_00742DF4(?:?; ?:UnicodeString);//00742DF4
    procedure sub_007430B4;//007430B4
    procedure sub_007436FC(?:UnicodeString);//007436FC

implementation

//0073F10C
procedure sub_0073F10C;
begin
{*
 0073F10C    ret
*}
end;

//0073F110
procedure sub_0073F110(?:UnicodeString);
begin
{*
 0073F110    push        ebp
 0073F111    mov         ebp,esp
 0073F113    add         esp,0FFFFFFF8
 0073F116    push        ebx
 0073F117    xor         edx,edx
 0073F119    mov         dword ptr [ebp-8],edx
 0073F11C    mov         dword ptr [ebp-4],eax
 0073F11F    mov         eax,dword ptr [ebp-4]
 0073F122    call        @UStrAddRef
 0073F127    xor         eax,eax
 0073F129    push        ebp
 0073F12A    push        73F1CF
 0073F12F    push        dword ptr fs:[eax]
 0073F132    mov         dword ptr fs:[eax],esp
 0073F135    mov         edx,dword ptr [ebp-4]
 0073F138    mov         eax,73F1E8;'
'
 0073F13D    call        Pos
 0073F142    mov         ebx,eax
 0073F144    test        ebx,ebx
>0073F146    jle         0073F199
 0073F148    lea         eax,[ebp-8]
 0073F14B    push        eax
 0073F14C    mov         ecx,ebx
 0073F14E    dec         ecx
 0073F14F    mov         edx,1
 0073F154    mov         eax,dword ptr [ebp-4]
 0073F157    call        @UStrCopy
 0073F15C    mov         edx,dword ptr [ebp-8]
 0073F15F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073F164    mov         eax,dword ptr [eax]
 0073F166    mov         eax,dword ptr [eax+394]
 0073F16C    mov         eax,dword ptr [eax+2A4]
 0073F172    mov         ecx,dword ptr [eax]
 0073F174    call        dword ptr [ecx+38]
 0073F177    lea         eax,[ebp-4]
 0073F17A    mov         ecx,ebx
 0073F17C    mov         edx,1
 0073F181    call        @UStrDelete
 0073F186    mov         edx,dword ptr [ebp-4]
 0073F189    mov         eax,73F1E8;'
'
 0073F18E    call        Pos
 0073F193    mov         ebx,eax
 0073F195    test        ebx,ebx
>0073F197    jg          0073F148
 0073F199    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073F19E    mov         eax,dword ptr [eax]
 0073F1A0    mov         eax,dword ptr [eax+394]
 0073F1A6    mov         eax,dword ptr [eax+2A4]
 0073F1AC    mov         edx,dword ptr [ebp-4]
 0073F1AF    mov         ecx,dword ptr [eax]
 0073F1B1    call        dword ptr [ecx+38]
 0073F1B4    xor         eax,eax
 0073F1B6    pop         edx
 0073F1B7    pop         ecx
 0073F1B8    pop         ecx
 0073F1B9    mov         dword ptr fs:[eax],edx
 0073F1BC    push        73F1D6
 0073F1C1    lea         eax,[ebp-8]
 0073F1C4    mov         edx,2
 0073F1C9    call        @UStrArrayClr
 0073F1CE    ret
>0073F1CF    jmp         @HandleFinally
>0073F1D4    jmp         0073F1C1
 0073F1D6    pop         ebx
 0073F1D7    pop         ecx
 0073F1D8    pop         ecx
 0073F1D9    pop         ebp
 0073F1DA    ret
*}
end;

//0073F1EC
{*function sub_0073F1EC:?;
begin
 0073F1EC    push        ecx
 0073F1ED    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F1F2    call        @EofFile
 0073F1F7    call        @_IOTest
 0073F1FC    test        al,al
>0073F1FE    je          0073F204
 0073F200    xor         eax,eax
 0073F202    pop         edx
 0073F203    ret
 0073F204    xor         eax,eax
 0073F206    mov         dword ptr [esp],eax
 0073F209    push        0
 0073F20B    lea         edx,[esp+4]
 0073F20F    mov         ecx,4
 0073F214    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F219    call        @BlockRead
 0073F21E    call        @_IOTest
 0073F223    mov         eax,dword ptr [esp]
 0073F226    pop         edx
 0073F227    ret
end;*}

//0073F228
{*function sub_0073F228:?;
begin
 0073F228    push        ecx
 0073F229    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F22E    call        @EofFile
 0073F233    call        @_IOTest
 0073F238    test        al,al
>0073F23A    je          0073F240
 0073F23C    xor         eax,eax
 0073F23E    pop         edx
 0073F23F    ret
 0073F240    mov         byte ptr [esp],0
 0073F244    push        0
 0073F246    lea         edx,[esp+4]
 0073F24A    mov         ecx,1
 0073F24F    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F254    call        @BlockRead
 0073F259    call        @_IOTest
 0073F25E    movzx       eax,byte ptr [esp]
 0073F262    pop         edx
 0073F263    ret
end;*}

//0073F264
{*function sub_0073F264:?;
begin
 0073F264    push        ecx
 0073F265    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F26A    call        @EofFile
 0073F26F    call        @_IOTest
 0073F274    test        al,al
>0073F276    je          0073F27C
 0073F278    xor         eax,eax
 0073F27A    pop         edx
 0073F27B    ret
 0073F27C    mov         word ptr [esp],0
 0073F282    push        0
 0073F284    lea         edx,[esp+4]
 0073F288    mov         ecx,2
 0073F28D    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F292    call        @BlockRead
 0073F297    call        @_IOTest
 0073F29C    movzx       eax,word ptr [esp]
 0073F2A0    pop         edx
 0073F2A1    ret
end;*}

//0073F2A4
{*function sub_0073F2A4:?;
begin
 0073F2A4    push        ecx
 0073F2A5    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F2AA    call        @EofFile
 0073F2AF    call        @_IOTest
 0073F2B4    test        al,al
>0073F2B6    je          0073F2BC
 0073F2B8    xor         eax,eax
 0073F2BA    pop         edx
 0073F2BB    ret
 0073F2BC    mov         word ptr [esp],0
 0073F2C2    push        0
 0073F2C4    lea         edx,[esp+4]
 0073F2C8    mov         ecx,2
 0073F2CD    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F2D2    call        @BlockRead
 0073F2D7    call        @_IOTest
 0073F2DC    movzx       eax,word ptr [esp]
 0073F2E0    and         ax,0FF
 0073F2E4    movzx       edx,word ptr [esp]
 0073F2E8    shr         edx,8
 0073F2EB    or          ax,dx
 0073F2EE    pop         edx
 0073F2EF    ret
end;*}

//0073F2F0
procedure sub_0073F2F0;
begin
{*
 0073F2F0    bswap       eax
 0073F2F2    ret
*}
end;

//0073F2F4
{*function sub_0073F2F4:?;
begin
 0073F2F4    push        ecx
 0073F2F5    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F2FA    call        @EofFile
 0073F2FF    call        @_IOTest
 0073F304    test        al,al
>0073F306    je          0073F30C
 0073F308    xor         eax,eax
 0073F30A    pop         edx
 0073F30B    ret
 0073F30C    xor         eax,eax
 0073F30E    mov         dword ptr [esp],eax
 0073F311    push        0
 0073F313    lea         edx,[esp+4]
 0073F317    mov         ecx,4
 0073F31C    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F321    call        @BlockRead
 0073F326    call        @_IOTest
 0073F32B    mov         eax,dword ptr [esp]
 0073F32E    call        0073F2F0
 0073F333    pop         edx
 0073F334    ret
end;*}

//0073F338
{*procedure sub_0073F338(?:?);
begin
 0073F338    push        ebp
 0073F339    mov         ebp,esp
 0073F33B    add         esp,0FFFFFFF8
 0073F33E    push        ebx
 0073F33F    push        esi
 0073F340    xor         edx,edx
 0073F342    mov         dword ptr [ebp-4],edx
 0073F345    mov         esi,eax
 0073F347    xor         eax,eax
 0073F349    push        ebp
 0073F34A    push        73F3F5
 0073F34F    push        dword ptr fs:[eax]
 0073F352    mov         dword ptr fs:[eax],esp
 0073F355    lea         eax,[ebp-4]
 0073F358    call        @WStrClr
 0073F35D    call        0073F1EC
 0073F362    mov         ebx,eax
 0073F364    dec         ebx
 0073F365    test        ebx,ebx
>0073F367    jge         0073F372
 0073F369    mov         eax,esi
 0073F36B    call        @WStrClr
>0073F370    jmp         0073F3DF
 0073F372    lea         eax,[ebp-4]
 0073F375    mov         edx,ebx
 0073F377    call        @WStrSetLength
 0073F37C    test        ebx,ebx
>0073F37E    jle         0073F3A1
 0073F380    push        0
 0073F382    mov         eax,dword ptr [ebp-4]
 0073F385    call        @WStrToPWChar
 0073F38A    mov         edx,eax
 0073F38C    mov         ecx,ebx
 0073F38E    add         ecx,ecx
 0073F390    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F395    call        @BlockRead
 0073F39A    call        @_IOTest
>0073F39F    jmp         0073F3A9
 0073F3A1    lea         eax,[ebp-4]
 0073F3A4    call        @WStrClr
 0073F3A9    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F3AE    call        @EofFile
 0073F3B3    call        @_IOTest
 0073F3B8    test        al,al
>0073F3BA    jne         0073F3D5
 0073F3BC    push        0
 0073F3BE    lea         edx,[ebp-8]
 0073F3C1    mov         ecx,2
 0073F3C6    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0073F3CB    call        @BlockRead
 0073F3D0    call        @_IOTest
 0073F3D5    mov         eax,esi
 0073F3D7    mov         edx,dword ptr [ebp-4]
 0073F3DA    call        @WStrAsg
 0073F3DF    xor         eax,eax
 0073F3E1    pop         edx
 0073F3E2    pop         ecx
 0073F3E3    pop         ecx
 0073F3E4    mov         dword ptr fs:[eax],edx
 0073F3E7    push        73F3FC
 0073F3EC    lea         eax,[ebp-4]
 0073F3EF    call        @WStrClr
 0073F3F4    ret
>0073F3F5    jmp         @HandleFinally
>0073F3FA    jmp         0073F3EC
 0073F3FC    pop         esi
 0073F3FD    pop         ebx
 0073F3FE    pop         ecx
 0073F3FF    pop         ecx
 0073F400    pop         ebp
 0073F401    ret
end;*}

//0073F404
procedure sub_0073F404(?:UnicodeString);
begin
{*
 0073F404    push        ebp
 0073F405    mov         ebp,esp
 0073F407    mov         ecx,9
 0073F40C    push        0
 0073F40E    push        0
 0073F410    dec         ecx
>0073F411    jne         0073F40C
 0073F413    push        ebx
 0073F414    push        esi
 0073F415    mov         ebx,eax
 0073F417    xor         eax,eax
 0073F419    push        ebp
 0073F41A    push        73F62F
 0073F41F    push        dword ptr fs:[eax]
 0073F422    mov         dword ptr fs:[eax],esp
 0073F425    lea         eax,[ebp-4]
 0073F428    call        0073F338
 0073F42D    lea         eax,[ebp-30]
 0073F430    mov         ecx,dword ptr [ebp-4]
 0073F433    mov         edx,73F640;'// '
 0073F438    call        @WStrCat3
 0073F43D    mov         edx,dword ptr [ebp-30]
 0073F440    lea         eax,[ebp-2C]
 0073F443    call        @UStrFromWStr
 0073F448    mov         ecx,dword ptr [ebp-2C]
 0073F44B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073F450    mov         eax,dword ptr [eax]
 0073F452    mov         eax,dword ptr [eax+394]
 0073F458    mov         eax,dword ptr [eax+2A4]
 0073F45E    xor         edx,edx
 0073F460    mov         esi,dword ptr [eax]
 0073F462    call        dword ptr [esi+60]
 0073F465    lea         eax,[ebp-34]
 0073F468    mov         ecx,ebx
 0073F46A    mov         edx,73F654;'// Imported from Game Commander '
 0073F46F    call        @UStrCat3
 0073F474    mov         ecx,dword ptr [ebp-34]
 0073F477    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073F47C    mov         eax,dword ptr [eax]
 0073F47E    mov         eax,dword ptr [eax+394]
 0073F484    mov         eax,dword ptr [eax+2A4]
 0073F48A    mov         edx,1
 0073F48F    mov         ebx,dword ptr [eax]
 0073F491    call        dword ptr [ebx+60]
 0073F494    lea         eax,[ebp-8]
 0073F497    call        0073F338
 0073F49C    lea         eax,[ebp-3C]
 0073F49F    mov         edx,dword ptr [ebp-8]
 0073F4A2    call        @UStrFromWStr
 0073F4A7    mov         eax,dword ptr [ebp-3C]
 0073F4AA    lea         edx,[ebp-38]
 0073F4AD    call        Trim
 0073F4B2    cmp         dword ptr [ebp-38],0
>0073F4B6    je          0073F505
 0073F4B8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073F4BD    mov         eax,dword ptr [eax]
 0073F4BF    mov         eax,dword ptr [eax+394]
 0073F4C5    mov         eax,dword ptr [eax+2A4]
 0073F4CB    mov         edx,73F6A4;'/*'
 0073F4D0    mov         ecx,dword ptr [eax]
 0073F4D2    call        dword ptr [ecx+38]
 0073F4D5    lea         eax,[ebp-40]
 0073F4D8    mov         edx,dword ptr [ebp-8]
 0073F4DB    call        @UStrFromWStr
 0073F4E0    mov         eax,dword ptr [ebp-40]
 0073F4E3    call        0073F110
 0073F4E8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073F4ED    mov         eax,dword ptr [eax]
 0073F4EF    mov         eax,dword ptr [eax+394]
 0073F4F5    mov         eax,dword ptr [eax+2A4]
 0073F4FB    mov         edx,73F6B8;'*/'
 0073F500    mov         ecx,dword ptr [eax]
 0073F502    call        dword ptr [ecx+38]
 0073F505    call        0073F1EC
 0073F50A    mov         dword ptr [ebp-14],eax
 0073F50D    lea         eax,[ebp-14]
 0073F510    call        0073F10C
 0073F515    call        0073F1EC
 0073F51A    mov         dword ptr [ebp-18],eax
 0073F51D    lea         eax,[ebp-18]
 0073F520    call        0073F10C
 0073F525    call        0073F1EC
 0073F52A    mov         dword ptr [ebp-1C],eax
 0073F52D    lea         eax,[ebp-1C]
 0073F530    call        0073F10C
 0073F535    call        0073F1EC
 0073F53A    mov         dword ptr [ebp-20],eax
 0073F53D    lea         eax,[ebp-20]
 0073F540    call        0073F10C
 0073F545    call        0073F1EC
 0073F54A    mov         dword ptr [ebp-24],eax
 0073F54D    lea         eax,[ebp-24]
 0073F550    call        0073F10C
 0073F555    call        0073F1EC
 0073F55A    mov         dword ptr [ebp-28],eax
 0073F55D    lea         eax,[ebp-28]
 0073F560    call        0073F10C
 0073F565    cmp         dword ptr [ebp-28],2
>0073F569    jne         0073F5C1
 0073F56B    lea         eax,[ebp-0C]
 0073F56E    call        0073F338
 0073F573    mov         eax,dword ptr [ebp-0C]
 0073F576    xor         edx,edx
 0073F578    call        @WStrEqual
>0073F57D    je          0073F5D7
 0073F57F    push        73F6C4
 0073F584    push        dword ptr [ebp-0C]
 0073F587    push        73F6E4
 0073F58C    lea         eax,[ebp-48]
 0073F58F    mov         edx,3
 0073F594    call        @WStrCatN
 0073F599    mov         edx,dword ptr [ebp-48]
 0073F59C    lea         eax,[ebp-44]
 0073F59F    call        @UStrFromWStr
 0073F5A4    mov         edx,dword ptr [ebp-44]
 0073F5A7    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073F5AC    mov         eax,dword ptr [eax]
 0073F5AE    mov         eax,dword ptr [eax+394]
 0073F5B4    mov         eax,dword ptr [eax+2A4]
 0073F5BA    mov         ecx,dword ptr [eax]
 0073F5BC    call        dword ptr [ecx+38]
>0073F5BF    jmp         0073F5D7
 0073F5C1    cmp         dword ptr [ebp-28],0
>0073F5C5    jne         0073F5D7
 0073F5C7    call        0073F1EC
 0073F5CC    mov         dword ptr [ebp-10],eax
 0073F5CF    lea         eax,[ebp-10]
 0073F5D2    call        0073F10C
 0073F5D7    mov         ebx,4
 0073F5DC    call        0073F1EC
 0073F5E1    mov         dword ptr [ebp-10],eax
 0073F5E4    lea         eax,[ebp-10]
 0073F5E7    call        0073F10C
 0073F5EC    dec         ebx
>0073F5ED    jne         0073F5DC
 0073F5EF    xor         eax,eax
 0073F5F1    pop         edx
 0073F5F2    pop         ecx
 0073F5F3    pop         ecx
 0073F5F4    mov         dword ptr fs:[eax],edx
 0073F5F7    push        73F636
 0073F5FC    lea         eax,[ebp-48]
 0073F5FF    call        @WStrClr
 0073F604    lea         eax,[ebp-44]
 0073F607    mov         edx,5
 0073F60C    call        @UStrArrayClr
 0073F611    lea         eax,[ebp-30]
 0073F614    call        @WStrClr
 0073F619    lea         eax,[ebp-2C]
 0073F61C    call        @UStrClr
 0073F621    lea         eax,[ebp-0C]
 0073F624    mov         edx,3
 0073F629    call        @WStrArrayClr
 0073F62E    ret
>0073F62F    jmp         @HandleFinally
>0073F634    jmp         0073F5FC
 0073F636    pop         esi
 0073F637    pop         ebx
 0073F638    mov         esp,ebp
 0073F63A    pop         ebp
 0073F63B    ret
*}
end;

//0073F6E8
procedure sub_0073F6E8;
begin
{*
 0073F6E8    mov         eax,822C94;gvar_00822C94:UnicodeString
 0073F6ED    call        @UStrClr
 0073F6F2    ret
*}
end;

//0073F6F4
{*function sub_0073F6F4(?:UnicodeString):?;
begin
 0073F6F4    push        ebp
 0073F6F5    mov         ebp,esp
 0073F6F7    push        ecx
 0073F6F8    mov         dword ptr [ebp-4],eax
 0073F6FB    mov         eax,dword ptr [ebp-4]
 0073F6FE    call        @UStrAddRef
 0073F703    xor         eax,eax
 0073F705    push        ebp
 0073F706    push        73F74E
 0073F70B    push        dword ptr fs:[eax]
 0073F70E    mov         dword ptr fs:[eax],esp
 0073F711    push        dword ptr ds:[822C94];gvar_00822C94:UnicodeString
 0073F717    push        73F764;'"'
 0073F71C    push        dword ptr [ebp-4]
 0073F71F    push        73F774;'", '
 0073F724    mov         eax,822C94;gvar_00822C94:UnicodeString
 0073F729    mov         edx,4
 0073F72E    call        @UStrCatN
 0073F733    call        0073F6E8
 0073F738    xor         eax,eax
 0073F73A    pop         edx
 0073F73B    pop         ecx
 0073F73C    pop         ecx
 0073F73D    mov         dword ptr fs:[eax],edx
 0073F740    push        73F755
 0073F745    lea         eax,[ebp-4]
 0073F748    call        @UStrClr
 0073F74D    ret
>0073F74E    jmp         @HandleFinally
>0073F753    jmp         0073F745
 0073F755    pop         ecx
 0073F756    pop         ebp
 0073F757    ret
end;*}

//0073F77C
{*procedure sub_0073F77C(?:?; ?:?);
begin
 0073F77C    push        ebp
 0073F77D    mov         ebp,esp
 0073F77F    push        0
 0073F781    push        0
 0073F783    push        0
 0073F785    xor         eax,eax
 0073F787    push        ebp
 0073F788    push        73F83A
 0073F78D    push        dword ptr fs:[eax]
 0073F790    mov         dword ptr fs:[eax],esp
 0073F793    cmp         dword ptr [ebp+0C],0
>0073F797    jne         0073F7A1
 0073F799    cmp         dword ptr [ebp+8],20
>0073F79D    jb          0073F7F7
>0073F79F    jmp         0073F7A3
>0073F7A1    jl          0073F7F7
 0073F7A3    cmp         dword ptr [ebp+0C],0
>0073F7A7    jne         0073F7B1
 0073F7A9    cmp         dword ptr [ebp+8],7F
>0073F7AD    ja          0073F7F7
>0073F7AF    jmp         0073F7B3
>0073F7B1    jg          0073F7F7
 0073F7B3    push        dword ptr ds:[822C94];gvar_00822C94:UnicodeString
 0073F7B9    push        73F854;'"'
 0073F7BE    mov         eax,dword ptr [ebp+8]
 0073F7C1    mov         edx,eax
 0073F7C3    lea         eax,[ebp-4]
 0073F7C6    call        @UStrFromWChar
 0073F7CB    push        dword ptr [ebp-4]
 0073F7CE    push        73F864;'" '
 0073F7D3    mov         eax,dword ptr [ebp+8]
 0073F7D6    lea         edx,[ebp-8]
 0073F7D9    call        IntToStr
 0073F7DE    push        dword ptr [ebp-8]
 0073F7E1    push        73F878;', '
 0073F7E6    mov         eax,822C94;gvar_00822C94:UnicodeString
 0073F7EB    mov         edx,6
 0073F7F0    call        @UStrCatN
>0073F7F5    jmp         0073F81F
 0073F7F7    push        dword ptr ds:[822C94];gvar_00822C94:UnicodeString
 0073F7FD    mov         eax,dword ptr [ebp+8]
 0073F800    lea         edx,[ebp-0C]
 0073F803    call        IntToStr
 0073F808    push        dword ptr [ebp-0C]
 0073F80B    push        73F878;', '
 0073F810    mov         eax,822C94;gvar_00822C94:UnicodeString
 0073F815    mov         edx,3
 0073F81A    call        @UStrCatN
 0073F81F    xor         eax,eax
 0073F821    pop         edx
 0073F822    pop         ecx
 0073F823    pop         ecx
 0073F824    mov         dword ptr fs:[eax],edx
 0073F827    push        73F841
 0073F82C    lea         eax,[ebp-0C]
 0073F82F    mov         edx,3
 0073F834    call        @UStrArrayClr
 0073F839    ret
>0073F83A    jmp         @HandleFinally
>0073F83F    jmp         0073F82C
 0073F841    mov         esp,ebp
 0073F843    pop         ebp
 0073F844    ret         8
end;*}

//0073F880
{*procedure sub_0073F880(?:?; ?:?);
begin
 0073F880    push        ebp
 0073F881    mov         ebp,esp
 0073F883    push        0
 0073F885    push        0
 0073F887    push        0
 0073F889    push        ebx
 0073F88A    push        esi
 0073F88B    mov         esi,edx
 0073F88D    mov         ebx,eax
 0073F88F    xor         eax,eax
 0073F891    push        ebp
 0073F892    push        73FF40
 0073F897    push        dword ptr fs:[eax]
 0073F89A    mov         dword ptr fs:[eax],esp
 0073F89D    mov         eax,ebx
 0073F89F    cmp         eax,0DE
>0073F8A4    ja          0073FF0C
 0073F8AA    movzx       eax,byte ptr [eax+73F8B8]
 0073F8B1    jmp         dword ptr [eax*4+73F997]
 0073F8B1    db          0
 0073F8B1    db          53
 0073F8B1    db          54
 0073F8B1    db          0
 0073F8B1    db          55
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          12
 0073F8B1    db          13
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          14
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          15
 0073F8B1    db          16
 0073F8B1    db          17
 0073F8B1    db          18
 0073F8B1    db          19
 0073F8B1    db          20
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          21
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          22
 0073F8B1    db          23
 0073F8B1    db          24
 0073F8B1    db          25
 0073F8B1    db          26
 0073F8B1    db          27
 0073F8B1    db          28
 0073F8B1    db          30
 0073F8B1    db          29
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          45
 0073F8B1    db          31
 0073F8B1    db          32
 0073F8B1    db          0
 0073F8B1    db          1
 0073F8B1    db          2
 0073F8B1    db          3
 0073F8B1    db          4
 0073F8B1    db          5
 0073F8B1    db          6
 0073F8B1    db          7
 0073F8B1    db          8
 0073F8B1    db          9
 0073F8B1    db          10
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          11
 0073F8B1    db          33
 0073F8B1    db          34
 0073F8B1    db          35
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          42
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          43
 0073F8B1    db          50
 0073F8B1    db          46
 0073F8B1    db          0
 0073F8B1    db          47
 0073F8B1    db          48
 0073F8B1    db          49
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          44
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          51
 0073F8B1    db          52
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          36
 0073F8B1    db          37
 0073F8B1    db          38
 0073F8B1    db          39
 0073F8B1    db          40
 0073F8B1    db          41
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          56
 0073F8B1    db          57
 0073F8B1    db          58
 0073F8B1    db          59
 0073F8B1    db          60
 0073F8B1    db          61
 0073F8B1    db          62
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          0
 0073F8B1    db          63
 0073F8B1    db          64
 0073F8B1    db          65
 0073F8B1    db          66
 0073F8B1    dd          0073FF0C
 0073F8B1    dd          0073FAA3
 0073F8B1    dd          0073FAB4
 0073F8B1    dd          0073FAC5
 0073F8B1    dd          0073FAD6
 0073F8B1    dd          0073FAE7
 0073F8B1    dd          0073FAF8
 0073F8B1    dd          0073FB09
 0073F8B1    dd          0073FB1A
 0073F8B1    dd          0073FB2B
 0073F8B1    dd          0073FB3C
 0073F8B1    dd          0073FB4D
 0073F8B1    dd          0073FB5B
 0073F8B1    dd          0073FB6C
 0073F8B1    dd          0073FB7D
 0073F8B1    dd          0073FB8E
 0073F8B1    dd          0073FB9F
 0073F8B1    dd          0073FBB0
 0073F8B1    dd          0073FBC1
 0073F8B1    dd          0073FBD2
 0073F8B1    dd          0073FBE3
 0073F8B1    dd          0073FBF4
 0073F8B1    dd          0073FC05
 0073F8B1    dd          0073FC16
 0073F8B1    dd          0073FC27
 0073F8B1    dd          0073FC38
 0073F8B1    dd          0073FC49
 0073F8B1    dd          0073FC5A
 0073F8B1    dd          0073FC6B
 0073F8B1    dd          0073FC7C
 0073F8B1    dd          0073FC8D
 0073F8B1    dd          0073FC9E
 0073F8B1    dd          0073FCAF
 0073F8B1    dd          0073FCC0
 0073F8B1    dd          0073FCD1
 0073F8B1    dd          0073FCE2
 0073F8B1    dd          0073FCF3
 0073F8B1    dd          0073FD04
 0073F8B1    dd          0073FD15
 0073F8B1    dd          0073FD26
 0073F8B1    dd          0073FD37
 0073F8B1    dd          0073FD48
 0073F8B1    dd          0073FD59
 0073F8B1    dd          0073FD6A
 0073F8B1    dd          0073FD8C
 0073F8B1    dd          0073FDAE
 0073F8B1    dd          0073FDBF
 0073F8B1    dd          0073FDD0
 0073F8B1    dd          0073FDE1
 0073F8B1    dd          0073FDF2
 0073F8B1    dd          0073FE03
 0073F8B1    dd          0073FE14
 0073F8B1    dd          0073FE25
 0073F8B1    dd          0073FE36
 0073F8B1    dd          0073FE47
 0073F8B1    dd          0073FE58
 0073F8B1    dd          0073FE69
 0073F8B1    dd          0073FE7A
 0073F8B1    dd          0073FE8B
 0073F8B1    dd          0073FE9C
 0073F8B1    dd          0073FEAA
 0073F8B1    dd          0073FEB8
 0073F8B1    dd          0073FEC6
 0073F8B1    dd          0073FED4
 0073F8B1    dd          0073FEE2
 0073F8B1    dd          0073FEF0
 0073F8B1    dd          0073FEFE
 0073FAA3    mov         eax,esi
 0073FAA5    mov         edx,73FF5C;'Zero'
 0073FAAA    call        @UStrAsg
>0073FAAF    jmp         0073FF25
 0073FAB4    mov         eax,esi
 0073FAB6    mov         edx,73FF74;'One'
 0073FABB    call        @UStrAsg
>0073FAC0    jmp         0073FF25
 0073FAC5    mov         eax,esi
 0073FAC7    mov         edx,73FF88;'Two'
 0073FACC    call        @UStrAsg
>0073FAD1    jmp         0073FF25
 0073FAD6    mov         eax,esi
 0073FAD8    mov         edx,73FF9C;'Three'
 0073FADD    call        @UStrAsg
>0073FAE2    jmp         0073FF25
 0073FAE7    mov         eax,esi
 0073FAE9    mov         edx,73FFB4;'Four'
 0073FAEE    call        @UStrAsg
>0073FAF3    jmp         0073FF25
 0073FAF8    mov         eax,esi
 0073FAFA    mov         edx,73FFCC;'Five'
 0073FAFF    call        @UStrAsg
>0073FB04    jmp         0073FF25
 0073FB09    mov         eax,esi
 0073FB0B    mov         edx,73FFE4;'Six'
 0073FB10    call        @UStrAsg
>0073FB15    jmp         0073FF25
 0073FB1A    mov         eax,esi
 0073FB1C    mov         edx,73FFF8;'Seven'
 0073FB21    call        @UStrAsg
>0073FB26    jmp         0073FF25
 0073FB2B    mov         eax,esi
 0073FB2D    mov         edx,740010;'Eight'
 0073FB32    call        @UStrAsg
>0073FB37    jmp         0073FF25
 0073FB3C    mov         eax,esi
 0073FB3E    mov         edx,740028;'Nine'
 0073FB43    call        @UStrAsg
>0073FB48    jmp         0073FF25
 0073FB4D    mov         eax,esi
 0073FB4F    mov         edx,ebx
 0073FB51    call        @UStrFromWChar
>0073FB56    jmp         0073FF25
 0073FB5B    mov         eax,esi
 0073FB5D    mov         edx,740040;'Backspace'
 0073FB62    call        @UStrAsg
>0073FB67    jmp         0073FF25
 0073FB6C    mov         eax,esi
 0073FB6E    mov         edx,740060;'Tab'
 0073FB73    call        @UStrAsg
>0073FB78    jmp         0073FF25
 0073FB7D    mov         eax,esi
 0073FB7F    mov         edx,740074;'Enter'
 0073FB84    call        @UStrAsg
>0073FB89    jmp         0073FF25
 0073FB8E    mov         eax,esi
 0073FB90    mov         edx,74008C;'Shift'
 0073FB95    call        @UStrAsg
>0073FB9A    jmp         0073FF25
 0073FB9F    mov         eax,esi
 0073FBA1    mov         edx,7400A4;'Ctrl'
 0073FBA6    call        @UStrAsg
>0073FBAB    jmp         0073FF25
 0073FBB0    mov         eax,esi
 0073FBB2    mov         edx,7400BC;'Alt'
 0073FBB7    call        @UStrAsg
>0073FBBC    jmp         0073FF25
 0073FBC1    mov         eax,esi
 0073FBC3    mov         edx,7400D0;'Pause'
 0073FBC8    call        @UStrAsg
>0073FBCD    jmp         0073FF25
 0073FBD2    mov         eax,esi
 0073FBD4    mov         edx,7400E8;'CapsLock'
 0073FBD9    call        @UStrAsg
>0073FBDE    jmp         0073FF25
 0073FBE3    mov         eax,esi
 0073FBE5    mov         edx,740108;'Kana'
 0073FBEA    call        @UStrAsg
>0073FBEF    jmp         0073FF25
 0073FBF4    mov         eax,esi
 0073FBF6    mov         edx,740120;'Escape'
 0073FBFB    call        @UStrAsg
>0073FC00    jmp         0073FF25
 0073FC05    mov         eax,esi
 0073FC07    mov         edx,74013C;'Space'
 0073FC0C    call        @UStrAsg
>0073FC11    jmp         0073FF25
 0073FC16    mov         eax,esi
 0073FC18    mov         edx,740154;'PageUp'
 0073FC1D    call        @UStrAsg
>0073FC22    jmp         0073FF25
 0073FC27    mov         eax,esi
 0073FC29    mov         edx,740170;'PageDown'
 0073FC2E    call        @UStrAsg
>0073FC33    jmp         0073FF25
 0073FC38    mov         eax,esi
 0073FC3A    mov         edx,740190;'End'
 0073FC3F    call        @UStrAsg
>0073FC44    jmp         0073FF25
 0073FC49    mov         eax,esi
 0073FC4B    mov         edx,7401A4;'Home'
 0073FC50    call        @UStrAsg
>0073FC55    jmp         0073FF25
 0073FC5A    mov         eax,esi
 0073FC5C    mov         edx,7401BC;'Left'
 0073FC61    call        @UStrAsg
>0073FC66    jmp         0073FF25
 0073FC6B    mov         eax,esi
 0073FC6D    mov         edx,7401D4;'Up'
 0073FC72    call        @UStrAsg
>0073FC77    jmp         0073FF25
 0073FC7C    mov         eax,esi
 0073FC7E    mov         edx,7401E8;'Down'
 0073FC83    call        @UStrAsg
>0073FC88    jmp         0073FF25
 0073FC8D    mov         eax,esi
 0073FC8F    mov         edx,740200;'Right'
 0073FC94    call        @UStrAsg
>0073FC99    jmp         0073FF25
 0073FC9E    mov         eax,esi
 0073FCA0    mov         edx,740218;'Insert'
 0073FCA5    call        @UStrAsg
>0073FCAA    jmp         0073FF25
 0073FCAF    mov         eax,esi
 0073FCB1    mov         edx,740234;'Delete'
 0073FCB6    call        @UStrAsg
>0073FCBB    jmp         0073FF25
 0073FCC0    mov         eax,esi
 0073FCC2    mov         edx,740250;'LeftWin'
 0073FCC7    call        @UStrAsg
>0073FCCC    jmp         0073FF25
 0073FCD1    mov         eax,esi
 0073FCD3    mov         edx,74026C;'RightWin'
 0073FCD8    call        @UStrAsg
>0073FCDD    jmp         0073FF25
 0073FCE2    mov         eax,esi
 0073FCE4    mov         edx,74028C;'AppMenu'
 0073FCE9    call        @UStrAsg
>0073FCEE    jmp         0073FF25
 0073FCF3    mov         eax,esi
 0073FCF5    mov         edx,7402A8;'LeftShift'
 0073FCFA    call        @UStrAsg
>0073FCFF    jmp         0073FF25
 0073FD04    mov         eax,esi
 0073FD06    mov         edx,7402C8;'RightShift'
 0073FD0B    call        @UStrAsg
>0073FD10    jmp         0073FF25
 0073FD15    mov         eax,esi
 0073FD17    mov         edx,7402EC;'LeftCtrl'
 0073FD1C    call        @UStrAsg
>0073FD21    jmp         0073FF25
 0073FD26    mov         eax,esi
 0073FD28    mov         edx,74030C;'RightCtrl'
 0073FD2D    call        @UStrAsg
>0073FD32    jmp         0073FF25
 0073FD37    mov         eax,esi
 0073FD39    mov         edx,74032C;'LeftAlt'
 0073FD3E    call        @UStrAsg
>0073FD43    jmp         0073FF25
 0073FD48    mov         eax,esi
 0073FD4A    mov         edx,740348;'RightAlt'
 0073FD4F    call        @UStrAsg
>0073FD54    jmp         0073FF25
 0073FD59    mov         eax,esi
 0073FD5B    mov         edx,740368;'Numpad0'
 0073FD60    call        @UStrAsg
>0073FD65    jmp         0073FF25
 0073FD6A    lea         edx,[ebp-4]
 0073FD6D    lea         eax,[ebx+1]
 0073FD70    sub         eax,61
 0073FD73    call        IntToStr
 0073FD78    mov         ecx,dword ptr [ebp-4]
 0073FD7B    mov         eax,esi
 0073FD7D    mov         edx,740384;'NumPad'
 0073FD82    call        @UStrCat3
>0073FD87    jmp         0073FF25
 0073FD8C    lea         edx,[ebp-8]
 0073FD8F    lea         eax,[ebx+1]
 0073FD92    sub         eax,70
 0073FD95    call        IntToStr
 0073FD9A    mov         ecx,dword ptr [ebp-8]
 0073FD9D    mov         eax,esi
 0073FD9F    mov         edx,7403A0;'F'
 0073FDA4    call        @UStrCat3
>0073FDA9    jmp         0073FF25
 0073FDAE    mov         eax,esi
 0073FDB0    mov         edx,7403B0;'PrintScreen'
 0073FDB5    call        @UStrAsg
>0073FDBA    jmp         0073FF25
 0073FDBF    mov         eax,esi
 0073FDC1    mov         edx,7403D4;'NumPadPlus'
 0073FDC6    call        @UStrAsg
>0073FDCB    jmp         0073FF25
 0073FDD0    mov         eax,esi
 0073FDD2    mov         edx,7403F8;'NumPadMinus'
 0073FDD7    call        @UStrAsg
>0073FDDC    jmp         0073FF25
 0073FDE1    mov         eax,esi
 0073FDE3    mov         edx,74041C;'NumPadDot'
 0073FDE8    call        @UStrAsg
>0073FDED    jmp         0073FF25
 0073FDF2    mov         eax,esi
 0073FDF4    mov         edx,74043C;'NumPadSlash'
 0073FDF9    call        @UStrAsg
>0073FDFE    jmp         0073FF25
 0073FE03    mov         eax,esi
 0073FE05    mov         edx,740460;'NumPadStar'
 0073FE0A    call        @UStrAsg
>0073FE0F    jmp         0073FF25
 0073FE14    mov         eax,esi
 0073FE16    mov         edx,740484;'NumLock'
 0073FE1B    call        @UStrAsg
>0073FE20    jmp         0073FF25
 0073FE25    mov         eax,esi
 0073FE27    mov         edx,7404A0;'ScrollLock'
 0073FE2C    call        @UStrAsg
>0073FE31    jmp         0073FF25
 0073FE36    mov         eax,esi
 0073FE38    mov         edx,7404C4;'Mouse.LeftButton'
 0073FE3D    call        @UStrAsg
>0073FE42    jmp         0073FF25
 0073FE47    mov         eax,esi
 0073FE49    mov         edx,7404F4;'Mouse.RightButton'
 0073FE4E    call        @UStrAsg
>0073FE53    jmp         0073FF25
 0073FE58    mov         eax,esi
 0073FE5A    mov         edx,740524;'Mouse.MiddleButton'
 0073FE5F    call        @UStrAsg
>0073FE64    jmp         0073FF25
 0073FE69    mov         eax,esi
 0073FE6B    mov         edx,740558;'Semicolon'
 0073FE70    call        @UStrAsg
>0073FE75    jmp         0073FF25
 0073FE7A    mov         eax,esi
 0073FE7C    mov         edx,740578;'Equals'
 0073FE81    call        @UStrAsg
>0073FE86    jmp         0073FF25
 0073FE8B    mov         eax,esi
 0073FE8D    mov         edx,740594;'Comma'
 0073FE92    call        @UStrAsg
>0073FE97    jmp         0073FF25
 0073FE9C    mov         eax,esi
 0073FE9E    mov         edx,7405AC;'Minus'
 0073FEA3    call        @UStrAsg
>0073FEA8    jmp         0073FF25
 0073FEAA    mov         eax,esi
 0073FEAC    mov         edx,7405C4;'Dot'
 0073FEB1    call        @UStrAsg
>0073FEB6    jmp         0073FF25
 0073FEB8    mov         eax,esi
 0073FEBA    mov         edx,7405D8;'Slash'
 0073FEBF    call        @UStrAsg
>0073FEC4    jmp         0073FF25
 0073FEC6    mov         eax,esi
 0073FEC8    mov         edx,7405F0;'Console'
 0073FECD    call        @UStrAsg
>0073FED2    jmp         0073FF25
 0073FED4    mov         eax,esi
 0073FED6    mov         edx,74060C;'LBracket'
 0073FEDB    call        @UStrAsg
>0073FEE0    jmp         0073FF25
 0073FEE2    mov         eax,esi
 0073FEE4    mov         edx,74062C;'Backslash'
 0073FEE9    call        @UStrAsg
>0073FEEE    jmp         0073FF25
 0073FEF0    mov         eax,esi
 0073FEF2    mov         edx,74064C;'RBracket'
 0073FEF7    call        @UStrAsg
>0073FEFC    jmp         0073FF25
 0073FEFE    mov         eax,esi
 0073FF00    mov         edx,74066C;'Apostrophe'
 0073FF05    call        @UStrAsg
>0073FF0A    jmp         0073FF25
 0073FF0C    lea         edx,[ebp-0C]
 0073FF0F    mov         eax,ebx
 0073FF11    call        IntToStr
 0073FF16    mov         ecx,dword ptr [ebp-0C]
 0073FF19    mov         eax,esi
 0073FF1B    mov         edx,740690;'key.VirtualKey'
 0073FF20    call        @UStrCat3
 0073FF25    xor         eax,eax
 0073FF27    pop         edx
 0073FF28    pop         ecx
 0073FF29    pop         ecx
 0073FF2A    mov         dword ptr fs:[eax],edx
 0073FF2D    push        73FF47
 0073FF32    lea         eax,[ebp-0C]
 0073FF35    mov         edx,3
 0073FF3A    call        @UStrArrayClr
 0073FF3F    ret
>0073FF40    jmp         @HandleFinally
>0073FF45    jmp         0073FF32
 0073FF47    pop         esi
 0073FF48    pop         ebx
 0073FF49    mov         esp,ebp
 0073FF4B    pop         ebp
 0073FF4C    ret
end;*}

//007406B0
{*procedure sub_007406B0(?:?);
begin
 007406B0    push        ebp
 007406B1    mov         ebp,esp
 007406B3    mov         ecx,5
 007406B8    push        0
 007406BA    push        0
 007406BC    dec         ecx
>007406BD    jne         007406B8
 007406BF    push        ebx
 007406C0    push        esi
 007406C1    push        edi
 007406C2    xor         edx,edx
 007406C4    push        ebp
 007406C5    push        740925
 007406CA    push        dword ptr fs:[edx]
 007406CD    mov         dword ptr fs:[edx],esp
 007406D0    cmp         eax,0FF
>007406D5    jle         007406E6
 007406D7    mov         eax,740940;'Invalid Keycount!'
 007406DC    call        0073F6F4
>007406E1    jmp         007408F5
 007406E6    mov         edi,eax
 007406E8    test        edi,edi
>007406EA    jle         007408F5
 007406F0    call        0073F1EC
 007406F5    mov         ebx,eax
 007406F7    call        0073F1EC
 007406FC    mov         esi,eax
 007406FE    cmp         ebx,1
>00740701    jne         007407E8
 00740707    call        0073F1EC
 0074070C    mov         dword ptr [ebp-8],eax
 0074070F    lea         eax,[ebp-8]
 00740712    call        0073F10C
 00740717    call        0073F1EC
 0074071C    mov         ebx,eax
 0074071E    cmp         dword ptr ds:[822C90],0;gvar_00822C90:UnicodeString
>00740725    je          00740736
 00740727    mov         eax,822C90;gvar_00822C90:UnicodeString
 0074072C    mov         edx,740970;', '
 00740731    call        @UStrCat
 00740736    mov         eax,ebx
 00740738    and         eax,1
 0074073B    test        eax,eax
>0074073D    je          00740770
 0074073F    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 00740745    push        740984;'Press('
 0074074A    lea         edx,[ebp-0C]
 0074074D    mov         eax,esi
 0074074F    call        0073F880
 00740754    push        dword ptr [ebp-0C]
 00740757    push        7409A0;')'
 0074075C    mov         eax,822C90;gvar_00822C90:UnicodeString
 00740761    mov         edx,4
 00740766    call        @UStrCatN
>0074076B    jmp         007408EE
 00740770    test        eax,eax
>00740772    jne         007407A5
 00740774    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 0074077A    push        7409B0;'Release('
 0074077F    lea         edx,[ebp-10]
 00740782    mov         eax,esi
 00740784    call        0073F880
 00740789    push        dword ptr [ebp-10]
 0074078C    push        7409A0;')'
 00740791    mov         eax,822C90;gvar_00822C90:UnicodeString
 00740796    mov         edx,4
 0074079B    call        @UStrCatN
>007407A0    jmp         007408EE
 007407A5    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 007407AB    push        7409D0;'DoSomethingWith'
 007407B0    lea         edx,[ebp-14]
 007407B3    mov         eax,ebx
 007407B5    call        IntToStr
 007407BA    push        dword ptr [ebp-14]
 007407BD    push        7409FC;'('
 007407C2    lea         edx,[ebp-18]
 007407C5    mov         eax,esi
 007407C7    call        0073F880
 007407CC    push        dword ptr [ebp-18]
 007407CF    push        7409A0;')'
 007407D4    mov         eax,822C90;gvar_00822C90:UnicodeString
 007407D9    mov         edx,6
 007407DE    call        @UStrCatN
>007407E3    jmp         007408EE
 007407E8    cmp         ebx,2
>007407EB    jne         007408B0
 007407F1    cmp         esi,0FFFFFFFE
>007407F4    je          007408EE
 007407FA    cmp         esi,0FFFFFFFF
>007407FD    je          007408EE
 00740803    cmp         esi,3E8
>00740809    jl          0074086A
 0074080B    cmp         dword ptr ds:[822C90],0;gvar_00822C90:UnicodeString
>00740812    je          00740823
 00740814    mov         eax,822C90;gvar_00822C90:UnicodeString
 00740819    mov         edx,740970;', '
 0074081E    call        @UStrCat
 00740823    mov         dword ptr [ebp-1C],esi
 00740826    fild        dword ptr [ebp-1C]
 00740829    fdiv        dword ptr ds:[740A00];1000:Single
 0074082F    add         esp,0FFFFFFF4
 00740832    fstp        tbyte ptr [esp]
 00740835    wait
 00740836    lea         edx,[ebp-4]
 00740839    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0074083E    call        FloatToStr
 00740843    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 00740849    push        740A10;'Wait('
 0074084E    push        dword ptr [ebp-4]
 00740851    push        740A28;' seconds)'
 00740856    mov         eax,822C90;gvar_00822C90:UnicodeString
 0074085B    mov         edx,4
 00740860    call        @UStrCatN
>00740865    jmp         007408EE
 0074086A    cmp         dword ptr ds:[822C90],0;gvar_00822C90:UnicodeString
>00740871    je          00740882
 00740873    mov         eax,822C90;gvar_00822C90:UnicodeString
 00740878    mov         edx,740970;', '
 0074087D    call        @UStrCat
 00740882    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 00740888    push        740A10;'Wait('
 0074088D    lea         edx,[ebp-20]
 00740890    mov         eax,esi
 00740892    call        IntToStr
 00740897    push        dword ptr [ebp-20]
 0074089A    push        740A48;' ms)'
 0074089F    mov         eax,822C90;gvar_00822C90:UnicodeString
 007408A4    mov         edx,4
 007408A9    call        @UStrCatN
>007408AE    jmp         007408EE
 007408B0    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 007408B6    push        740A60;' /* '
 007408BB    lea         edx,[ebp-24]
 007408BE    mov         eax,ebx
 007408C0    call        IntToStr
 007408C5    push        dword ptr [ebp-24]
 007408C8    push        740970;', '
 007408CD    lea         edx,[ebp-28]
 007408D0    mov         eax,esi
 007408D2    call        IntToStr
 007408D7    push        dword ptr [ebp-28]
 007408DA    push        740A78;' */'
 007408DF    mov         eax,822C90;gvar_00822C90:UnicodeString
 007408E4    mov         edx,6
 007408E9    call        @UStrCatN
 007408EE    dec         edi
>007408EF    jne         007406F0
 007408F5    xor         eax,eax
 007408F7    pop         edx
 007408F8    pop         ecx
 007408F9    pop         ecx
 007408FA    mov         dword ptr fs:[eax],edx
 007408FD    push        74092C
 00740902    lea         eax,[ebp-28]
 00740905    mov         edx,3
 0074090A    call        @UStrArrayClr
 0074090F    lea         eax,[ebp-18]
 00740912    mov         edx,4
 00740917    call        @UStrArrayClr
 0074091C    lea         eax,[ebp-4]
 0074091F    call        @UStrClr
 00740924    ret
>00740925    jmp         @HandleFinally
>0074092A    jmp         00740902
 0074092C    pop         edi
 0074092D    pop         esi
 0074092E    pop         ebx
 0074092F    mov         esp,ebp
 00740931    pop         ebp
 00740932    ret
end;*}

//00740A80
procedure sub_00740A80;
begin
{*
 00740A80    push        ebp
 00740A81    mov         ebp,esp
 00740A83    add         esp,0FFFFFF98
 00740A86    push        ebx
 00740A87    push        esi
 00740A88    push        edi
 00740A89    xor         eax,eax
 00740A8B    mov         dword ptr [ebp-68],eax
 00740A8E    mov         dword ptr [ebp-60],eax
 00740A91    mov         dword ptr [ebp-64],eax
 00740A94    mov         dword ptr [ebp-58],eax
 00740A97    mov         dword ptr [ebp-5C],eax
 00740A9A    xor         eax,eax
 00740A9C    push        ebp
 00740A9D    push        740E9E
 00740AA2    push        dword ptr fs:[eax]
 00740AA5    mov         dword ptr fs:[eax],esp
 00740AA8    call        0073F1EC
 00740AAD    mov         ebx,eax
 00740AAF    call        0073F1EC
 00740AB4    mov         esi,eax
 00740AB6    mov         eax,ebx
 00740AB8    cdq
 00740AB9    push        edx
 00740ABA    push        eax
 00740ABB    call        0073F77C
 00740AC0    mov         eax,esi
 00740AC2    cdq
 00740AC3    push        edx
 00740AC4    push        eax
 00740AC5    call        0073F77C
 00740ACA    mov         eax,740EB8;'Ten, Flag'
 00740ACF    call        0073F6F4
 00740AD4    cmp         ebx,0A
>00740AD7    jne         00740E83
 00740ADD    call        0073F1EC
 00740AE2    mov         ebx,eax
 00740AE4    mov         eax,ebx
 00740AE6    cdq
 00740AE7    push        edx
 00740AE8    push        eax
 00740AE9    call        0073F77C
 00740AEE    mov         eax,740ED8;'Bytes'
 00740AF3    call        0073F6F4
 00740AF8    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740AFD    call        @FilePos
 00740B02    call        @_IOTest
 00740B07    mov         dword ptr [ebp-8],eax
 00740B0A    mov         eax,dword ptr [ebp-8]
 00740B0D    add         eax,ebx
 00740B0F    mov         dword ptr [ebp-4],eax
 00740B12    xor         eax,eax
 00740B14    push        ebp
 00740B15    push        740E7C
 00740B1A    push        dword ptr fs:[eax]
 00740B1D    mov         dword ptr fs:[eax],esp
 00740B20    call        0073F1EC
 00740B25    mov         esi,eax
 00740B27    call        0073F1EC
 00740B2C    mov         edi,eax
 00740B2E    mov         eax,esi
 00740B30    cdq
 00740B31    push        edx
 00740B32    push        eax
 00740B33    call        0073F77C
 00740B38    mov         eax,edi
 00740B3A    cdq
 00740B3B    push        edx
 00740B3C    push        eax
 00740B3D    call        0073F77C
 00740B42    mov         eax,740EF0;'Six, Two'
 00740B47    call        0073F6F4
 00740B4C    cmp         ebx,10
>00740B4F    je          00740B54
 00740B51    dec         esi
>00740B52    jne         00740B8B
 00740B54    mov         eax,740F10;'Strange format'
 00740B59    call        0073F6F4
 00740B5E    mov         edx,dword ptr [ebp-8]
 00740B61    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740B66    call        @Seek
 00740B6B    call        @_IOTest
 00740B70    mov         eax,ebx
 00740B72    test        eax,eax
>00740B74    jns         00740B79
 00740B76    add         eax,0F
 00740B79    sar         eax,4
 00740B7C    call        007406B0
 00740B81    call        @TryFinallyExit
>00740B86    jmp         00740E83
 00740B8B    cmp         ebx,8
>00740B8E    jne         00740BC7
 00740B90    mov         eax,740F10;'Strange format'
 00740B95    call        0073F6F4
 00740B9A    mov         edx,dword ptr [ebp-8]
 00740B9D    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740BA2    call        @Seek
 00740BA7    call        @_IOTest
 00740BAC    mov         eax,ebx
 00740BAE    test        eax,eax
>00740BB0    jns         00740BB5
 00740BB2    add         eax,7
 00740BB5    sar         eax,3
 00740BB8    call        007406B0
 00740BBD    call        @TryFinallyExit
>00740BC2    jmp         00740E83
 00740BC7    call        0073F1EC
 00740BCC    mov         dword ptr [ebp-0C],eax
 00740BCF    mov         eax,dword ptr [ebp-0C]
 00740BD2    cdq
 00740BD3    push        edx
 00740BD4    push        eax
 00740BD5    call        0073F77C
 00740BDA    call        0073F6E8
 00740BDF    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740BE4    call        @FilePos
 00740BE9    call        @_IOTest
 00740BEE    mov         dword ptr [ebp-8],eax
 00740BF1    mov         eax,dword ptr [ebp-0C]
 00740BF4    and         eax,80000001
>00740BF9    jns         00740C00
 00740BFB    dec         eax
 00740BFC    or          eax,0FFFFFFFE
 00740BFF    inc         eax
 00740C00    test        eax,eax
>00740C02    je          00740C10
 00740C04    cmp         dword ptr [ebp-0C],3
>00740C08    jl          00740C10
 00740C0A    cmp         dword ptr [ebp-0C],21
>00740C0E    jle         00740C22
 00740C10    mov         eax,dword ptr [ebp-0C]
 00740C13    call        007406B0
 00740C18    call        @TryFinallyExit
>00740C1D    jmp         00740E83
 00740C22    mov         esi,dword ptr [ebp-0C]
 00740C25    sar         esi,1
>00740C27    jns         00740C2C
 00740C29    adc         esi,0
 00740C2C    test        esi,esi
>00740C2E    jle         00740CDB
 00740C34    lea         ebx,[ebp-54]
 00740C37    call        0073F1EC
 00740C3C    mov         edi,eax
 00740C3E    call        0073F1EC
 00740C43    mov         dword ptr [ebp-10],eax
 00740C46    dec         edi
>00740C47    je          00740C6D
 00740C49    mov         edx,dword ptr [ebp-8]
 00740C4C    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740C51    call        @Seek
 00740C56    call        @_IOTest
 00740C5B    mov         eax,dword ptr [ebp-0C]
 00740C5E    call        007406B0
 00740C63    call        @TryFinallyExit
>00740C68    jmp         00740E83
 00740C6D    call        0073F1EC
 00740C72    mov         edi,eax
 00740C74    call        0073F1EC
 00740C79    mov         dword ptr [ebp-14],eax
 00740C7C    test        edi,edi
>00740C7E    je          00740CA2
 00740C80    lea         edx,[ebp-5C]
 00740C83    mov         eax,edi
 00740C85    call        IntToStr
 00740C8A    mov         ecx,dword ptr [ebp-5C]
 00740C8D    lea         eax,[ebp-58]
 00740C90    mov         edx,740F3C;'Zero = '
 00740C95    call        @UStrCat3
 00740C9A    mov         eax,dword ptr [ebp-58]
 00740C9D    call        0073F6F4
 00740CA2    test        byte ptr [ebp-14],1
>00740CA6    jne         00740CCC
 00740CA8    mov         edx,dword ptr [ebp-8]
 00740CAB    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740CB0    call        @Seek
 00740CB5    call        @_IOTest
 00740CBA    mov         eax,dword ptr [ebp-0C]
 00740CBD    call        007406B0
 00740CC2    call        @TryFinallyExit
>00740CC7    jmp         00740E83
 00740CCC    mov         eax,dword ptr [ebp-10]
 00740CCF    mov         dword ptr [ebx],eax
 00740CD1    add         ebx,4
 00740CD4    dec         esi
>00740CD5    jne         00740C37
 00740CDB    call        0073F1EC
 00740CE0    mov         edi,eax
 00740CE2    call        0073F1EC
 00740CE7    mov         dword ptr [ebp-10],eax
 00740CEA    cmp         edi,2
>00740CED    jne         00740CF5
 00740CEF    cmp         dword ptr [ebp-10],0FFFFFFFE
>00740CF3    je          00740D19
 00740CF5    mov         edx,dword ptr [ebp-8]
 00740CF8    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740CFD    call        @Seek
 00740D02    call        @_IOTest
 00740D07    mov         eax,dword ptr [ebp-0C]
 00740D0A    call        007406B0
 00740D0F    call        @TryFinallyExit
>00740D14    jmp         00740E83
 00740D19    mov         ebx,dword ptr [ebp-0C]
 00740D1C    sar         ebx,1
>00740D1E    jns         00740D23
 00740D20    adc         ebx,0
 00740D23    cmp         ebx,1
>00740D26    jl          00740DFC
 00740D2C    lea         esi,[ebp+ebx*4-58]
 00740D30    call        0073F1EC
 00740D35    mov         edi,eax
 00740D37    call        0073F1EC
 00740D3C    mov         dword ptr [ebp-10],eax
 00740D3F    dec         edi
>00740D40    je          00740D66
 00740D42    mov         edx,dword ptr [ebp-8]
 00740D45    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740D4A    call        @Seek
 00740D4F    call        @_IOTest
 00740D54    mov         eax,dword ptr [ebp-0C]
 00740D57    call        007406B0
 00740D5C    call        @TryFinallyExit
>00740D61    jmp         00740E83
 00740D66    call        0073F1EC
 00740D6B    mov         edi,eax
 00740D6D    call        0073F1EC
 00740D72    mov         dword ptr [ebp-14],eax
 00740D75    test        edi,edi
>00740D77    je          00740D9B
 00740D79    lea         edx,[ebp-64]
 00740D7C    mov         eax,edi
 00740D7E    call        IntToStr
 00740D83    mov         ecx,dword ptr [ebp-64]
 00740D86    lea         eax,[ebp-60]
 00740D89    mov         edx,740F3C;'Zero = '
 00740D8E    call        @UStrCat3
 00740D93    mov         eax,dword ptr [ebp-60]
 00740D96    call        0073F6F4
 00740D9B    test        byte ptr [ebp-14],1
>00740D9F    je          00740DC5
 00740DA1    mov         edx,dword ptr [ebp-8]
 00740DA4    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740DA9    call        @Seek
 00740DAE    call        @_IOTest
 00740DB3    mov         eax,dword ptr [ebp-0C]
 00740DB6    call        007406B0
 00740DBB    call        @TryFinallyExit
>00740DC0    jmp         00740E83
 00740DC5    mov         eax,dword ptr [esi]
 00740DC7    cmp         eax,dword ptr [ebp-10]
>00740DCA    je          00740DF0
 00740DCC    mov         edx,dword ptr [ebp-8]
 00740DCF    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740DD4    call        @Seek
 00740DD9    call        @_IOTest
 00740DDE    mov         eax,dword ptr [ebp-0C]
 00740DE1    call        007406B0
 00740DE6    call        @TryFinallyExit
>00740DEB    jmp         00740E83
 00740DF0    dec         ebx
 00740DF1    sub         esi,4
 00740DF4    test        ebx,ebx
>00740DF6    jne         00740D30
 00740DFC    cmp         dword ptr ds:[822C90],0;gvar_00822C90:UnicodeString
>00740E03    je          00740E14
 00740E05    mov         eax,822C90;gvar_00822C90:UnicodeString
 00740E0A    mov         edx,740F58;', '
 00740E0F    call        @UStrCat
 00740E14    mov         esi,dword ptr [ebp-0C]
 00740E17    sar         esi,1
>00740E19    jns         00740E1E
 00740E1B    adc         esi,0
 00740E1E    test        esi,esi
>00740E20    jle         00740E5C
 00740E22    mov         ebx,1
 00740E27    lea         edi,[ebp-54]
 00740E2A    cmp         ebx,1
>00740E2D    je          00740E3E
 00740E2F    mov         eax,822C90;gvar_00822C90:UnicodeString
 00740E34    mov         edx,740F6C;'+'
 00740E39    call        @UStrCat
 00740E3E    lea         edx,[ebp-68]
 00740E41    mov         eax,dword ptr [edi]
 00740E43    call        0073F880
 00740E48    mov         edx,dword ptr [ebp-68]
 00740E4B    mov         eax,822C90;gvar_00822C90:UnicodeString
 00740E50    call        @UStrCat
 00740E55    inc         ebx
 00740E56    add         edi,4
 00740E59    dec         esi
>00740E5A    jne         00740E2A
 00740E5C    xor         eax,eax
 00740E5E    pop         edx
 00740E5F    pop         ecx
 00740E60    pop         ecx
 00740E61    mov         dword ptr fs:[eax],edx
 00740E64    push        740E83
 00740E69    mov         edx,dword ptr [ebp-4]
 00740E6C    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740E71    call        @Seek
 00740E76    call        @_IOTest
 00740E7B    ret
>00740E7C    jmp         @HandleFinally
>00740E81    jmp         00740E69
 00740E83    xor         eax,eax
 00740E85    pop         edx
 00740E86    pop         ecx
 00740E87    pop         ecx
 00740E88    mov         dword ptr fs:[eax],edx
 00740E8B    push        740EA5
 00740E90    lea         eax,[ebp-68]
 00740E93    mov         edx,5
 00740E98    call        @UStrArrayClr
 00740E9D    ret
>00740E9E    jmp         @HandleFinally
>00740EA3    jmp         00740E90
 00740EA5    pop         edi
 00740EA6    pop         esi
 00740EA7    pop         ebx
 00740EA8    mov         esp,ebp
 00740EAA    pop         ebp
 00740EAB    ret
*}
end;

//00740F70
procedure sub_00740F70;
begin
{*
 00740F70    push        ebp
 00740F71    mov         ebp,esp
 00740F73    xor         ecx,ecx
 00740F75    push        ecx
 00740F76    push        ecx
 00740F77    push        ecx
 00740F78    push        ecx
 00740F79    push        ecx
 00740F7A    push        ecx
 00740F7B    push        ecx
 00740F7C    push        ecx
 00740F7D    push        ebx
 00740F7E    push        esi
 00740F7F    push        edi
 00740F80    xor         eax,eax
 00740F82    push        ebp
 00740F83    push        74111C
 00740F88    push        dword ptr fs:[eax]
 00740F8B    mov         dword ptr fs:[eax],esp
 00740F8E    call        0073F1EC
 00740F93    mov         ebx,eax
 00740F95    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00740F9A    call        @FilePos
 00740F9F    call        @_IOTest
 00740FA4    add         ebx,eax
 00740FA6    mov         dword ptr [ebp-8],ebx
 00740FA9    xor         edx,edx
 00740FAB    push        ebp
 00740FAC    push        7410AC
 00740FB1    push        dword ptr fs:[edx]
 00740FB4    mov         dword ptr fs:[edx],esp
 00740FB7    call        0073F1EC
 00740FBC    lea         eax,[ebp-0C]
 00740FBF    call        0073F338
 00740FC4    mov         edx,dword ptr [ebp-0C]
 00740FC7    mov         eax,822C8C;gvar_00822C8C:UnicodeString
 00740FCC    call        @UStrFromWStr
 00740FD1    lea         eax,[ebp-4]
 00740FD4    call        0073F338
 00740FD9    mov         eax,dword ptr [ebp-4]
 00740FDC    xor         edx,edx
 00740FDE    call        @WStrEqual
>00740FE3    je          00741012
 00740FE5    push        741130
 00740FEA    push        dword ptr [ebp-4]
 00740FED    push        74115C
 00740FF2    lea         eax,[ebp-14]
 00740FF5    mov         edx,3
 00740FFA    call        @WStrCatN
 00740FFF    mov         edx,dword ptr [ebp-14]
 00741002    lea         eax,[ebp-10]
 00741005    call        @UStrFromWStr
 0074100A    mov         eax,dword ptr [ebp-10]
 0074100D    call        0073F6F4
 00741012    call        0073F1EC
 00741017    mov         ebx,eax
 00741019    test        ebx,ebx
>0074101B    je          00741059
 0074101D    lea         edx,[ebp-1C]
 00741020    mov         eax,ebx
 00741022    call        IntToStr
 00741027    mov         ecx,dword ptr [ebp-1C]
 0074102A    lea         eax,[ebp-18]
 0074102D    mov         edx,74116C;'TrainingBytes = '
 00741032    call        @UStrCat3
 00741037    mov         eax,dword ptr [ebp-18]
 0074103A    call        0073F6F4
 0074103F    test        ebx,ebx
>00741041    jle         00741059
 00741043    call        0073F228
 00741048    movzx       ecx,al
 0074104B    mov         eax,ecx
 0074104D    xor         edx,edx
 0074104F    push        edx
 00741050    push        eax
 00741051    call        0073F77C
 00741056    dec         ebx
>00741057    jne         00741043
 00741059    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074105E    call        @FilePos
 00741063    call        @_IOTest
 00741068    mov         edx,dword ptr [ebp-8]
 0074106B    sub         edx,eax
>0074106D    je          007410A2
 0074106F    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00741074    call        @FilePos
 00741079    call        @_IOTest
 0074107E    push        eax
 0074107F    mov         eax,dword ptr [ebp-8]
 00741082    pop         edx
 00741083    sub         eax,edx
 00741085    lea         edx,[ebp-20]
 00741088    call        IntToStr
 0074108D    lea         eax,[ebp-20]
 00741090    mov         edx,74119C;' bytes remaining'
 00741095    call        @UStrCat
 0074109A    mov         eax,dword ptr [ebp-20]
 0074109D    call        0073F6F4
 007410A2    xor         eax,eax
 007410A4    pop         edx
 007410A5    pop         ecx
 007410A6    pop         ecx
 007410A7    mov         dword ptr fs:[eax],edx
>007410AA    jmp         007410CA
>007410AC    jmp         @HandleOnException
 007410B1    dd          1
 007410B5    dd          00418C04;Exception
 007410B9    dd          007410BD
 007410BD    mov         eax,dword ptr [eax+4];Exception.FMessage:string
 007410C0    call        0073F6F4
 007410C5    call        @DoneExcept
 007410CA    mov         edx,dword ptr [ebp-8]
 007410CD    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007410D2    call        @Seek
 007410D7    call        @_IOTest
 007410DC    call        0073F6E8
 007410E1    xor         eax,eax
 007410E3    pop         edx
 007410E4    pop         ecx
 007410E5    pop         ecx
 007410E6    mov         dword ptr fs:[eax],edx
 007410E9    push        741123
 007410EE    lea         eax,[ebp-20]
 007410F1    mov         edx,3
 007410F6    call        @UStrArrayClr
 007410FB    lea         eax,[ebp-14]
 007410FE    call        @WStrClr
 00741103    lea         eax,[ebp-10]
 00741106    call        @UStrClr
 0074110B    lea         eax,[ebp-0C]
 0074110E    call        @WStrClr
 00741113    lea         eax,[ebp-4]
 00741116    call        @WStrClr
 0074111B    ret
>0074111C    jmp         @HandleFinally
>00741121    jmp         007410EE
 00741123    pop         edi
 00741124    pop         esi
 00741125    pop         ebx
 00741126    mov         esp,ebp
 00741128    pop         ebp
 00741129    ret
*}
end;

//007411C0
procedure sub_007411C0;
begin
{*
 007411C0    push        ebp
 007411C1    mov         ebp,esp
 007411C3    mov         ecx,0A
 007411C8    push        0
 007411CA    push        0
 007411CC    dec         ecx
>007411CD    jne         007411C8
 007411CF    push        ecx
 007411D0    push        ebx
 007411D1    push        esi
 007411D2    push        edi
 007411D3    lea         esi,[ebp-14]
 007411D6    xor         eax,eax
 007411D8    push        ebp
 007411D9    push        741595
 007411DE    push        dword ptr fs:[eax]
 007411E1    mov         dword ptr fs:[eax],esp
 007411E4    lea         eax,[ebp-4]
 007411E7    call        0073F338
 007411EC    lea         eax,[ebp-8]
 007411EF    call        0073F338
 007411F4    call        0073F1EC
 007411F9    mov         dword ptr [ebp-10],eax
 007411FC    call        0073F1EC
 00741201    mov         dword ptr [esi],eax
 00741203    mov         eax,dword ptr [esi]
 00741205    xor         edx,edx
 00741207    push        edx
 00741208    push        eax
 00741209    lea         eax,[ebp-1C]
 0074120C    call        IntToStr
 00741211    mov         ecx,dword ptr [ebp-1C]
 00741214    lea         eax,[ebp-18]
 00741217    mov         edx,7415B0;'Command Unknown 1 = '
 0074121C    call        @UStrCat3
 00741221    mov         eax,dword ptr [ebp-18]
 00741224    call        0073F6F4
 00741229    call        0073F1EC
 0074122E    mov         edi,eax
 00741230    call        0073F1EC
 00741235    mov         dword ptr [esi],eax
 00741237    mov         eax,dword ptr [esi]
 00741239    xor         edx,edx
 0074123B    push        edx
 0074123C    push        eax
 0074123D    lea         eax,[ebp-24]
 00741240    call        IntToStr
 00741245    mov         ecx,dword ptr [ebp-24]
 00741248    lea         eax,[ebp-20]
 0074124B    mov         edx,7415E8;'Command Unknown 2 = '
 00741250    call        @UStrCat3
 00741255    mov         eax,dword ptr [ebp-20]
 00741258    call        0073F6F4
 0074125D    call        0073F1EC
 00741262    mov         dword ptr [esi],eax
 00741264    mov         eax,dword ptr [esi]
 00741266    xor         edx,edx
 00741268    push        edx
 00741269    push        eax
 0074126A    lea         eax,[ebp-2C]
 0074126D    call        IntToStr
 00741272    mov         ecx,dword ptr [ebp-2C]
 00741275    lea         eax,[ebp-28]
 00741278    mov         edx,741620;'Command Unknown 3 = '
 0074127D    call        @UStrCat3
 00741282    mov         eax,dword ptr [ebp-28]
 00741285    call        0073F6F4
 0074128A    call        00740F70
 0074128F    lea         eax,[ebp-0C]
 00741292    mov         edx,dword ptr ds:[822C8C];gvar_00822C8C:UnicodeString
 00741298    call        @UStrLAsg
 0074129D    call        0073F1EC
 007412A2    mov         dword ptr [esi],eax
 007412A4    cmp         dword ptr [esi],0
>007412A7    jne         007412B5
 007412A9    mov         eax,741658;'z'
 007412AE    call        0073F6F4
>007412B3    jmp         007412C0
 007412B5    mov         eax,dword ptr [esi]
 007412B7    xor         edx,edx
 007412B9    push        edx
 007412BA    push        eax
 007412BB    call        0073F77C
 007412C0    call        0073F1EC
 007412C5    mov         dword ptr [esi],eax
 007412C7    cmp         dword ptr [esi],0
>007412CA    jne         007412D8
 007412CC    mov         eax,741658;'z'
 007412D1    call        0073F6F4
>007412D6    jmp         007412E3
 007412D8    mov         eax,dword ptr [esi]
 007412DA    xor         edx,edx
 007412DC    push        edx
 007412DD    push        eax
 007412DE    call        0073F77C
 007412E3    cmp         edi,110
>007412E9    jne         007412F2
 007412EB    call        00740F70
>007412F0    jmp         00741315
 007412F2    call        0073F1EC
 007412F7    mov         dword ptr [esi],eax
 007412F9    cmp         dword ptr [esi],0
>007412FC    jne         0074130A
 007412FE    mov         eax,741658;'z'
 00741303    call        0073F6F4
>00741308    jmp         00741315
 0074130A    mov         eax,dword ptr [esi]
 0074130C    xor         edx,edx
 0074130E    push        edx
 0074130F    push        eax
 00741310    call        0073F77C
 00741315    call        0073F1EC
 0074131A    mov         dword ptr [esi],eax
 0074131C    cmp         dword ptr [esi],0
>0074131F    jne         0074132D
 00741321    mov         eax,741658;'z'
 00741326    call        0073F6F4
>0074132B    jmp         00741338
 0074132D    mov         eax,dword ptr [esi]
 0074132F    xor         edx,edx
 00741331    push        edx
 00741332    push        eax
 00741333    call        0073F77C
 00741338    call        0073F6E8
 0074133D    call        0073F1EC
 00741342    mov         ebx,eax
 00741344    lea         edx,[ebp-34]
 00741347    mov         eax,ebx
 00741349    call        IntToStr
 0074134E    mov         ecx,dword ptr [ebp-34]
 00741351    lea         eax,[ebp-30]
 00741354    mov         edx,741668;'Actions = '
 00741359    call        @UStrCat3
 0074135E    mov         eax,dword ptr [ebp-30]
 00741361    call        0073F6F4
 00741366    mov         eax,822C90;gvar_00822C90:UnicodeString
 0074136B    call        @UStrClr
 00741370    test        ebx,ebx
>00741372    jle         0074137C
 00741374    call        00740A80
 00741379    dec         ebx
>0074137A    jne         00741374
 0074137C    mov         ebx,2
 00741381    call        0073F1EC
 00741386    mov         dword ptr [esi],eax
 00741388    mov         eax,esi
 0074138A    call        0073F10C
 0074138F    cmp         dword ptr [esi],0
>00741392    jne         007413A0
 00741394    mov         eax,74168C;'Z'
 00741399    call        0073F6F4
>0074139E    jmp         007413AB
 007413A0    mov         eax,dword ptr [esi]
 007413A2    xor         edx,edx
 007413A4    push        edx
 007413A5    push        eax
 007413A6    call        0073F77C
 007413AB    dec         ebx
>007413AC    jne         00741381
 007413AE    cmp         dword ptr [ebp-10],0
>007413B2    jne         007413C5
 007413B4    mov         eax,78C984
 007413B9    mov         edx,74169C;'//'
 007413BE    call        @UStrAsg
>007413C3    jmp         007413CF
 007413C5    mov         eax,78C984
 007413CA    call        @UStrClr
 007413CF    push        dword ptr ds:[78C984]
 007413D5    push        7416B0;'// '
 007413DA    lea         eax,[ebp-3C]
 007413DD    mov         edx,dword ptr [ebp-4]
 007413E0    call        @UStrFromWStr
 007413E5    push        dword ptr [ebp-3C]
 007413E8    lea         eax,[ebp-38]
 007413EB    mov         edx,3
 007413F0    call        @UStrCatN
 007413F5    mov         edx,dword ptr [ebp-38]
 007413F8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007413FD    mov         eax,dword ptr [eax]
 007413FF    mov         eax,dword ptr [eax+394]
 00741405    mov         eax,dword ptr [eax+2A4]
 0074140B    mov         ecx,dword ptr [eax]
 0074140D    call        dword ptr [ecx+38]
 00741410    mov         eax,dword ptr [ebp-8]
 00741413    xor         edx,edx
 00741415    call        @WStrEqual
>0074141A    je          0074145D
 0074141C    push        dword ptr ds:[78C984]
 00741422    push        7416B0;'// '
 00741427    lea         eax,[ebp-44]
 0074142A    mov         edx,dword ptr [ebp-8]
 0074142D    call        @UStrFromWStr
 00741432    push        dword ptr [ebp-44]
 00741435    lea         eax,[ebp-40]
 00741438    mov         edx,3
 0074143D    call        @UStrCatN
 00741442    mov         edx,dword ptr [ebp-40]
 00741445    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0074144A    mov         eax,dword ptr [eax]
 0074144C    mov         eax,dword ptr [eax+394]
 00741452    mov         eax,dword ptr [eax+2A4]
 00741458    mov         ecx,dword ptr [eax]
 0074145A    call        dword ptr [ecx+38]
 0074145D    test        edi,edi
>0074145F    je          007414A1
 00741461    push        dword ptr ds:[78C984]
 00741467    push        7416C4;'// autofire '
 0074146C    lea         edx,[ebp-4C]
 0074146F    mov         eax,edi
 00741471    call        IntToStr
 00741476    push        dword ptr [ebp-4C]
 00741479    lea         eax,[ebp-48]
 0074147C    mov         edx,3
 00741481    call        @UStrCatN
 00741486    mov         edx,dword ptr [ebp-48]
 00741489    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0074148E    mov         eax,dword ptr [eax]
 00741490    mov         eax,dword ptr [eax+394]
 00741496    mov         eax,dword ptr [eax+2A4]
 0074149C    mov         ecx,dword ptr [eax]
 0074149E    call        dword ptr [ecx+38]
 007414A1    cmp         dword ptr ds:[822C90],0;gvar_00822C90:UnicodeString
>007414A8    je          007414ED
 007414AA    push        dword ptr ds:[78C984]
 007414B0    push        7416EC;'said("'
 007414B5    push        dword ptr [ebp-0C]
 007414B8    push        741708;'") => '
 007414BD    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 007414C3    lea         eax,[ebp-50]
 007414C6    mov         edx,5
 007414CB    call        @UStrCatN
 007414D0    mov         edx,dword ptr [ebp-50]
 007414D3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007414D8    mov         eax,dword ptr [eax]
 007414DA    mov         eax,dword ptr [eax+394]
 007414E0    mov         eax,dword ptr [eax+2A4]
 007414E6    mov         ecx,dword ptr [eax]
 007414E8    call        dword ptr [ecx+38]
>007414EB    jmp         0074152E
 007414ED    cmp         dword ptr [ebp-0C],0
>007414F1    je          0074152E
 007414F3    push        dword ptr ds:[78C984]
 007414F9    push        7416EC;'said("'
 007414FE    push        dword ptr [ebp-0C]
 00741501    push        741724;'") => var.DoNothing'
 00741506    lea         eax,[ebp-54]
 00741509    mov         edx,4
 0074150E    call        @UStrCatN
 00741513    mov         edx,dword ptr [ebp-54]
 00741516    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0074151B    mov         eax,dword ptr [eax]
 0074151D    mov         eax,dword ptr [eax+394]
 00741523    mov         eax,dword ptr [eax+2A4]
 00741529    mov         ecx,dword ptr [eax]
 0074152B    call        dword ptr [ecx+38]
 0074152E    mov         ebx,7
 00741533    call        0073F1EC
 00741538    mov         dword ptr [esi],eax
 0074153A    mov         eax,esi
 0074153C    call        0073F10C
 00741541    cmp         dword ptr [esi],0
>00741544    jne         00741552
 00741546    mov         eax,741658;'z'
 0074154B    call        0073F6F4
>00741550    jmp         0074155D
 00741552    mov         eax,dword ptr [esi]
 00741554    xor         edx,edx
 00741556    push        edx
 00741557    push        eax
 00741558    call        0073F77C
 0074155D    dec         ebx
>0074155E    jne         00741533
 00741560    call        0073F6E8
 00741565    xor         eax,eax
 00741567    pop         edx
 00741568    pop         ecx
 00741569    pop         ecx
 0074156A    mov         dword ptr fs:[eax],edx
 0074156D    push        74159C
 00741572    lea         eax,[ebp-54]
 00741575    mov         edx,10
 0074157A    call        @UStrArrayClr
 0074157F    lea         eax,[ebp-0C]
 00741582    call        @UStrClr
 00741587    lea         eax,[ebp-8]
 0074158A    mov         edx,2
 0074158F    call        @WStrArrayClr
 00741594    ret
>00741595    jmp         @HandleFinally
>0074159A    jmp         00741572
 0074159C    pop         edi
 0074159D    pop         esi
 0074159E    pop         ebx
 0074159F    mov         esp,ebp
 007415A1    pop         ebp
 007415A2    ret
*}
end;

//0074174C
procedure sub_0074174C;
begin
{*
 0074174C    push        ebp
 0074174D    mov         ebp,esp
 0074174F    mov         ecx,6
 00741754    push        0
 00741756    push        0
 00741758    dec         ecx
>00741759    jne         00741754
 0074175B    push        ecx
 0074175C    push        ebx
 0074175D    push        esi
 0074175E    push        edi
 0074175F    mov         edi,dword ptr ds:[78D61C];^gvar_00822CA0:TEditorForm
 00741765    xor         eax,eax
 00741767    push        ebp
 00741768    push        741994
 0074176D    push        dword ptr fs:[eax]
 00741770    mov         dword ptr fs:[eax],esp
 00741773    lea         eax,[ebp-4]
 00741776    call        0073F338
 0074177B    lea         eax,[ebp-8]
 0074177E    call        0073F338
 00741783    mov         eax,dword ptr [edi]
 00741785    mov         eax,dword ptr [eax+394]
 0074178B    mov         eax,dword ptr [eax+2A4]
 00741791    xor         edx,edx
 00741793    mov         ecx,dword ptr [eax]
 00741795    call        dword ptr [ecx+38]
 00741798    push        7419A8
 0074179D    push        dword ptr [ebp-4]
 007417A0    push        7419C4
 007417A5    lea         eax,[ebp-10]
 007417A8    mov         edx,3
 007417AD    call        @WStrCatN
 007417B2    mov         edx,dword ptr [ebp-10]
 007417B5    lea         eax,[ebp-0C]
 007417B8    call        @UStrFromWStr
 007417BD    mov         edx,dword ptr [ebp-0C]
 007417C0    mov         eax,dword ptr [edi]
 007417C2    mov         eax,dword ptr [eax+394]
 007417C8    mov         eax,dword ptr [eax+2A4]
 007417CE    mov         ecx,dword ptr [eax]
 007417D0    call        dword ptr [ecx+38]
 007417D3    lea         eax,[ebp-18]
 007417D6    mov         edx,dword ptr [ebp-8]
 007417D9    call        @UStrFromWStr
 007417DE    mov         eax,dword ptr [ebp-18]
 007417E1    lea         edx,[ebp-14]
 007417E4    call        Trim
 007417E9    cmp         dword ptr [ebp-14],0
>007417ED    je          00741802
 007417EF    lea         eax,[ebp-1C]
 007417F2    mov         edx,dword ptr [ebp-8]
 007417F5    call        @UStrFromWStr
 007417FA    mov         eax,dword ptr [ebp-1C]
 007417FD    call        0073F110
 00741802    mov         eax,dword ptr [edi]
 00741804    mov         eax,dword ptr [eax+394]
 0074180A    mov         eax,dword ptr [eax+2A4]
 00741810    mov         edx,7419E8;'*****************************/'
 00741815    mov         ecx,dword ptr [eax]
 00741817    call        dword ptr [ecx+38]
 0074181A    call        0073F1EC
 0074181F    test        eax,eax
>00741821    jne         00741855
 00741823    mov         eax,dword ptr [edi]
 00741825    mov         eax,dword ptr [eax+394]
 0074182B    mov         eax,dword ptr [eax+2A4]
 00741831    mov         edx,741A34;'//Uncomment this section to activate these commands:'
 00741836    mov         ecx,dword ptr [eax]
 00741838    call        dword ptr [ecx+38]
 0074183B    mov         eax,dword ptr [edi]
 0074183D    mov         eax,dword ptr [eax+394]
 00741843    mov         eax,dword ptr [eax+2A4]
 00741849    mov         edx,741AAC;'/*'
 0074184E    mov         ecx,dword ptr [eax]
 00741850    call        dword ptr [ecx+38]
>00741853    jmp         0074186D
 00741855    mov         eax,dword ptr [edi]
 00741857    mov         eax,dword ptr [eax+394]
 0074185D    mov         eax,dword ptr [eax+2A4]
 00741863    mov         edx,741AC0;'//*'
 00741868    mov         ecx,dword ptr [eax]
 0074186A    call        dword ptr [ecx+38]
 0074186D    call        0073F1EC
 00741872    mov         ebx,eax
 00741874    push        741AD4;'// '
 00741879    mov         eax,ebx
 0074187B    xor         edx,edx
 0074187D    push        edx
 0074187E    push        eax
 0074187F    lea         eax,[ebp-24]
 00741882    call        IntToStr
 00741887    push        dword ptr [ebp-24]
 0074188A    push        741AE8;' commands'
 0074188F    lea         eax,[ebp-20]
 00741892    mov         edx,3
 00741897    call        @UStrCatN
 0074189C    mov         edx,dword ptr [ebp-20]
 0074189F    mov         eax,dword ptr [edi]
 007418A1    mov         eax,dword ptr [eax+394]
 007418A7    mov         eax,dword ptr [eax+2A4]
 007418AD    mov         ecx,dword ptr [eax]
 007418AF    call        dword ptr [ecx+38]
 007418B2    call        0073F1EC
 007418B7    mov         esi,eax
 007418B9    test        esi,esi
>007418BB    je          007418F1
 007418BD    mov         eax,esi
 007418BF    xor         edx,edx
 007418C1    push        edx
 007418C2    push        eax
 007418C3    lea         eax,[ebp-2C]
 007418C6    call        IntToStr
 007418CB    mov         ecx,dword ptr [ebp-2C]
 007418CE    lea         eax,[ebp-28]
 007418D1    mov         edx,741B08;'//Zero = '
 007418D6    call        @UStrCat3
 007418DB    mov         edx,dword ptr [ebp-28]
 007418DE    mov         eax,dword ptr [edi]
 007418E0    mov         eax,dword ptr [eax+394]
 007418E6    mov         eax,dword ptr [eax+2A4]
 007418EC    mov         ecx,dword ptr [eax]
 007418EE    call        dword ptr [ecx+38]
 007418F1    mov         esi,ebx
 007418F3    test        esi,esi
>007418F5    jle         00741944
 007418F7    call        0073F1EC
 007418FC    mov         ebx,eax
 007418FE    cmp         ebx,0ED66
>00741904    jne         0074190D
 00741906    call        007411C0
>0074190B    jmp         00741941
 0074190D    mov         eax,ebx
 0074190F    xor         edx,edx
 00741911    push        edx
 00741912    push        eax
 00741913    lea         eax,[ebp-34]
 00741916    call        IntToStr
 0074191B    mov         ecx,dword ptr [ebp-34]
 0074191E    lea         eax,[ebp-30]
 00741921    mov         edx,741B28;'// left over '
 00741926    call        @UStrCat3
 0074192B    mov         edx,dword ptr [ebp-30]
 0074192E    mov         eax,dword ptr [edi]
 00741930    mov         eax,dword ptr [eax+394]
 00741936    mov         eax,dword ptr [eax+2A4]
 0074193C    mov         ecx,dword ptr [eax]
 0074193E    call        dword ptr [ecx+38]
 00741941    dec         esi
>00741942    jne         007418F7
 00741944    mov         eax,dword ptr [edi]
 00741946    mov         eax,dword ptr [eax+394]
 0074194C    mov         eax,dword ptr [eax+2A4]
 00741952    mov         edx,741B50;'/* */'
 00741957    mov         ecx,dword ptr [eax]
 00741959    call        dword ptr [ecx+38]
 0074195C    xor         eax,eax
 0074195E    pop         edx
 0074195F    pop         ecx
 00741960    pop         ecx
 00741961    mov         dword ptr fs:[eax],edx
 00741964    push        74199B
 00741969    lea         eax,[ebp-34]
 0074196C    mov         edx,9
 00741971    call        @UStrArrayClr
 00741976    lea         eax,[ebp-10]
 00741979    call        @WStrClr
 0074197E    lea         eax,[ebp-0C]
 00741981    call        @UStrClr
 00741986    lea         eax,[ebp-8]
 00741989    mov         edx,2
 0074198E    call        @WStrArrayClr
 00741993    ret
>00741994    jmp         @HandleFinally
>00741999    jmp         00741969
 0074199B    pop         edi
 0074199C    pop         esi
 0074199D    pop         ebx
 0074199E    mov         esp,ebp
 007419A0    pop         ebp
 007419A1    ret
*}
end;

//00741B5C
procedure sub_00741B5C;
begin
{*
 00741B5C    push        ebp
 00741B5D    mov         ebp,esp
 00741B5F    mov         ecx,4
 00741B64    push        0
 00741B66    push        0
 00741B68    dec         ecx
>00741B69    jne         00741B64
 00741B6B    push        ecx
 00741B6C    push        ebx
 00741B6D    push        esi
 00741B6E    lea         esi,[ebp-0C]
 00741B71    xor         eax,eax
 00741B73    push        ebp
 00741B74    push        741D00
 00741B79    push        dword ptr fs:[eax]
 00741B7C    mov         dword ptr fs:[eax],esp
 00741B7F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00741B84    mov         eax,dword ptr [eax]
 00741B86    mov         eax,dword ptr [eax+394]
 00741B8C    mov         eax,dword ptr [eax+2A4]
 00741B92    xor         edx,edx
 00741B94    mov         ecx,dword ptr [eax]
 00741B96    call        dword ptr [ecx+38]
 00741B99    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00741B9E    mov         eax,dword ptr [eax]
 00741BA0    mov         eax,dword ptr [eax+394]
 00741BA6    mov         eax,dword ptr [eax+2A4]
 00741BAC    xor         edx,edx
 00741BAE    mov         ecx,dword ptr [eax]
 00741BB0    call        dword ptr [ecx+38]
 00741BB3    lea         eax,[ebp-4]
 00741BB6    call        0073F338
 00741BBB    lea         eax,[ebp-8]
 00741BBE    call        0073F338
 00741BC3    mov         eax,dword ptr [ebp-8]
 00741BC6    xor         edx,edx
 00741BC8    call        @WStrEqual
>00741BCD    je          00741C0F
 00741BCF    push        741D14
 00741BD4    push        dword ptr [ebp-8]
 00741BD7    push        741D38
 00741BDC    lea         eax,[ebp-14]
 00741BDF    mov         edx,3
 00741BE4    call        @WStrCatN
 00741BE9    mov         edx,dword ptr [ebp-14]
 00741BEC    lea         eax,[ebp-10]
 00741BEF    call        @UStrFromWStr
 00741BF4    mov         edx,dword ptr [ebp-10]
 00741BF7    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00741BFC    mov         eax,dword ptr [eax]
 00741BFE    mov         eax,dword ptr [eax+394]
 00741C04    mov         eax,dword ptr [eax+2A4]
 00741C0A    mov         ecx,dword ptr [eax]
 00741C0C    call        dword ptr [ecx+38]
 00741C0F    mov         ebx,6
 00741C14    call        0073F1EC
 00741C19    mov         dword ptr [esi],eax
 00741C1B    dec         ebx
>00741C1C    jne         00741C14
 00741C1E    call        0073F1EC
 00741C23    mov         ebx,eax
 00741C25    push        741D48;'Pie.SeqGap = '
 00741C2A    mov         eax,ebx
 00741C2C    xor         edx,edx
 00741C2E    push        edx
 00741C2F    push        eax
 00741C30    lea         eax,[ebp-1C]
 00741C33    call        IntToStr
 00741C38    push        dword ptr [ebp-1C]
 00741C3B    push        741D70;'ms'
 00741C40    lea         eax,[ebp-18]
 00741C43    mov         edx,3
 00741C48    call        @UStrCatN
 00741C4D    mov         edx,dword ptr [ebp-18]
 00741C50    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00741C55    mov         eax,dword ptr [eax]
 00741C57    mov         eax,dword ptr [eax+394]
 00741C5D    mov         eax,dword ptr [eax+2A4]
 00741C63    mov         ecx,dword ptr [eax]
 00741C65    call        dword ptr [ecx+38]
 00741C68    call        0073F1EC
 00741C6D    mov         ebx,eax
 00741C6F    push        741D84;'Pie.SeqDuration = '
 00741C74    mov         eax,ebx
 00741C76    xor         edx,edx
 00741C78    push        edx
 00741C79    push        eax
 00741C7A    lea         eax,[ebp-24]
 00741C7D    call        IntToStr
 00741C82    push        dword ptr [ebp-24]
 00741C85    push        741D70;'ms'
 00741C8A    lea         eax,[ebp-20]
 00741C8D    mov         edx,3
 00741C92    call        @UStrCatN
 00741C97    mov         edx,dword ptr [ebp-20]
 00741C9A    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00741C9F    mov         eax,dword ptr [eax]
 00741CA1    mov         eax,dword ptr [eax+394]
 00741CA7    mov         eax,dword ptr [eax+2A4]
 00741CAD    mov         ecx,dword ptr [eax]
 00741CAF    call        dword ptr [ecx+38]
 00741CB2    mov         ebx,2
 00741CB7    call        0073F1EC
 00741CBC    mov         dword ptr [esi],eax
 00741CBE    mov         eax,esi
 00741CC0    call        0073F10C
 00741CC5    dec         ebx
>00741CC6    jne         00741CB7
 00741CC8    xor         eax,eax
 00741CCA    pop         edx
 00741CCB    pop         ecx
 00741CCC    pop         ecx
 00741CCD    mov         dword ptr fs:[eax],edx
 00741CD0    push        741D07
 00741CD5    lea         eax,[ebp-24]
 00741CD8    mov         edx,4
 00741CDD    call        @UStrArrayClr
 00741CE2    lea         eax,[ebp-14]
 00741CE5    call        @WStrClr
 00741CEA    lea         eax,[ebp-10]
 00741CED    call        @UStrClr
 00741CF2    lea         eax,[ebp-8]
 00741CF5    mov         edx,2
 00741CFA    call        @WStrArrayClr
 00741CFF    ret
>00741D00    jmp         @HandleFinally
>00741D05    jmp         00741CD5
 00741D07    pop         esi
 00741D08    pop         ebx
 00741D09    mov         esp,ebp
 00741D0B    pop         ebp
 00741D0C    ret
*}
end;

//00741DAC
procedure sub_00741DAC(?:UnicodeString);
begin
{*
 00741DAC    push        ebp
 00741DAD    mov         ebp,esp
 00741DAF    add         esp,0FFFFFFDC
 00741DB2    push        ebx
 00741DB3    push        esi
 00741DB4    push        edi
 00741DB5    xor         edx,edx
 00741DB7    mov         dword ptr [ebp-1C],edx
 00741DBA    mov         dword ptr [ebp-20],edx
 00741DBD    mov         dword ptr [ebp-24],edx
 00741DC0    mov         dword ptr [ebp-8],edx
 00741DC3    mov         dword ptr [ebp-4],eax
 00741DC6    mov         eax,dword ptr [ebp-4]
 00741DC9    call        @UStrAddRef
 00741DCE    xor         eax,eax
 00741DD0    push        ebp
 00741DD1    push        741F8A
 00741DD6    push        dword ptr fs:[eax]
 00741DD9    mov         dword ptr fs:[eax],esp
 00741DDC    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00741DE1    mov         eax,dword ptr [eax]
 00741DE3    mov         eax,dword ptr [eax+394]
 00741DE9    mov         eax,dword ptr [eax+2A4]
 00741DEF    mov         edx,dword ptr [eax]
 00741DF1    call        dword ptr [edx+44]
 00741DF4    mov         edx,dword ptr [ebp-4]
 00741DF7    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00741DFC    call        @Assign
 00741E01    mov         edx,1
 00741E06    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00741E0B    call        @ResetFile
 00741E10    call        @_IOTest
 00741E15    xor         edx,edx
 00741E17    push        ebp
 00741E18    push        741F35
 00741E1D    push        dword ptr fs:[edx]
 00741E20    mov         dword ptr fs:[edx],esp
 00741E23    lea         eax,[ebp-8]
 00741E26    call        0073F338
 00741E2B    call        0073F1EC
 00741E30    mov         dword ptr [ebp-0C],eax
 00741E33    call        0073F1EC
 00741E38    mov         dword ptr [ebp-10],eax
 00741E3B    lea         eax,[ebp-10]
 00741E3E    call        0073F10C
 00741E43    lea         eax,[ebp-0C]
 00741E46    call        0073F10C
 00741E4B    call        0073F1EC
 00741E50    mov         dword ptr [ebp-14],eax
 00741E53    cmp         dword ptr [ebp-14],0ED33
>00741E5A    jne         00741E9A
 00741E5C    mov         eax,dword ptr [ebp-0C]
 00741E5F    xor         edx,edx
 00741E61    push        edx
 00741E62    push        eax
 00741E63    lea         eax,[ebp-20]
 00741E66    call        IntToStr
 00741E6B    push        dword ptr [ebp-20]
 00741E6E    push        741FA4;'.'
 00741E73    mov         eax,dword ptr [ebp-10]
 00741E76    xor         edx,edx
 00741E78    push        edx
 00741E79    push        eax
 00741E7A    lea         eax,[ebp-24]
 00741E7D    call        IntToStr
 00741E82    push        dword ptr [ebp-24]
 00741E85    lea         eax,[ebp-1C]
 00741E88    mov         edx,3
 00741E8D    call        @UStrCatN
 00741E92    mov         eax,dword ptr [ebp-1C]
 00741E95    call        0073F404
 00741E9A    call        0073F1EC
 00741E9F    mov         dword ptr [ebp-14],eax
 00741EA2    cmp         dword ptr [ebp-14],0FF
>00741EA9    jae         00741ECB
 00741EAB    call        0073F1EC
 00741EB0    mov         dword ptr [ebp-18],eax
 00741EB3    call        0073F1EC
 00741EB8    mov         dword ptr [ebp-18],eax
 00741EBB    lea         eax,[ebp-18]
 00741EBE    call        0073F10C
 00741EC3    call        0073F1EC
 00741EC8    mov         dword ptr [ebp-14],eax
 00741ECB    cmp         dword ptr [ebp-14],0ED99
>00741ED2    jne         00741EE1
 00741ED4    call        00741B5C
 00741ED9    call        0073F1EC
 00741EDE    mov         dword ptr [ebp-14],eax
 00741EE1    cmp         dword ptr [ebp-14],0ED44
>00741EE8    jne         00741EF7
 00741EEA    call        0074174C
 00741EEF    call        0073F1EC
 00741EF4    mov         dword ptr [ebp-14],eax
 00741EF7    cmp         dword ptr [ebp-14],0ED99
>00741EFE    jne         00741F0D
 00741F00    call        00741B5C
 00741F05    call        0073F1EC
 00741F0A    mov         dword ptr [ebp-14],eax
 00741F0D    cmp         dword ptr [ebp-14],0ED44
>00741F14    jne         00741F2B
 00741F16    call        0074174C
 00741F1B    call        0073F1EC
 00741F20    mov         dword ptr [ebp-14],eax
 00741F23    lea         eax,[ebp-14]
 00741F26    call        0073F10C
 00741F2B    xor         eax,eax
 00741F2D    pop         edx
 00741F2E    pop         ecx
 00741F2F    pop         ecx
 00741F30    mov         dword ptr fs:[eax],edx
>00741F33    jmp         00741F50
>00741F35    jmp         @HandleOnException
 00741F3A    dd          1
 00741F3E    dd          00418C04;Exception
 00741F42    dd          00741F46
 00741F46    call        004FA644
 00741F4B    call        @DoneExcept
 00741F50    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00741F55    call        @Close
 00741F5A    call        @_IOTest
 00741F5F    xor         eax,eax
 00741F61    pop         edx
 00741F62    pop         ecx
 00741F63    pop         ecx
 00741F64    mov         dword ptr fs:[eax],edx
 00741F67    push        741F91
 00741F6C    lea         eax,[ebp-24]
 00741F6F    mov         edx,3
 00741F74    call        @UStrArrayClr
 00741F79    lea         eax,[ebp-8]
 00741F7C    call        @WStrClr
 00741F81    lea         eax,[ebp-4]
 00741F84    call        @UStrClr
 00741F89    ret
>00741F8A    jmp         @HandleFinally
>00741F8F    jmp         00741F6C
 00741F91    pop         edi
 00741F92    pop         esi
 00741F93    pop         ebx
 00741F94    mov         esp,ebp
 00741F96    pop         ebp
 00741F97    ret
*}
end;

//00741FA8
{*procedure sub_00741FA8(?:?; ?:UnicodeString);
begin
 00741FA8    push        ebp
 00741FA9    mov         ebp,esp
 00741FAB    add         esp,0FFFFFFF8
 00741FAE    push        ebx
 00741FAF    xor         ecx,ecx
 00741FB1    mov         dword ptr [ebp-8],ecx
 00741FB4    mov         dword ptr [ebp-4],edx
 00741FB7    mov         ebx,eax
 00741FB9    mov         eax,dword ptr [ebp-4]
 00741FBC    call        @UStrAddRef
 00741FC1    xor         eax,eax
 00741FC3    push        ebp
 00741FC4    push        742020
 00741FC9    push        dword ptr fs:[eax]
 00741FCC    mov         dword ptr fs:[eax],esp
 00741FCF    lea         ecx,[ebp-8]
 00741FD2    mov         edx,ebx
 00741FD4    add         edx,edx
 00741FD6    mov         ax,20
 00741FDA    call        StringOfChar
 00741FDF    lea         eax,[ebp-8]
 00741FE2    mov         edx,dword ptr [ebp-4]
 00741FE5    call        @UStrCat
 00741FEA    mov         edx,dword ptr [ebp-8]
 00741FED    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00741FF2    mov         eax,dword ptr [eax]
 00741FF4    mov         eax,dword ptr [eax+394]
 00741FFA    mov         eax,dword ptr [eax+2A4]
 00742000    mov         ecx,dword ptr [eax]
 00742002    call        dword ptr [ecx+38]
 00742005    xor         eax,eax
 00742007    pop         edx
 00742008    pop         ecx
 00742009    pop         ecx
 0074200A    mov         dword ptr fs:[eax],edx
 0074200D    push        742027
 00742012    lea         eax,[ebp-8]
 00742015    mov         edx,2
 0074201A    call        @UStrArrayClr
 0074201F    ret
>00742020    jmp         @HandleFinally
>00742025    jmp         00742012
 00742027    pop         ebx
 00742028    pop         ecx
 00742029    pop         ecx
 0074202A    pop         ebp
 0074202B    ret
end;*}

//0074202C
{*procedure sub_0074202C(?:?);
begin
 0074202C    push        ebp
 0074202D    mov         ebp,esp
 0074202F    add         esp,0FFFFFFF8
 00742032    push        ebx
 00742033    push        esi
 00742034    xor         edx,edx
 00742036    mov         dword ptr [ebp-4],edx
 00742039    mov         esi,eax
 0074203B    xor         eax,eax
 0074203D    push        ebp
 0074203E    push        7420BF
 00742043    push        dword ptr fs:[eax]
 00742046    mov         dword ptr fs:[eax],esp
 00742049    call        0073F2A4
 0074204E    call        0073F2F4
 00742053    mov         ebx,eax
 00742055    lea         eax,[ebp-4]
 00742058    mov         edx,ebx
 0074205A    call        @UStrSetLength
 0074205F    test        ebx,ebx
>00742061    jbe         0074209F
 00742063    lea         eax,[ebp-4]
 00742066    call        @UniqueStringU
 0074206B    lea         edx,[ebx+1]
 0074206E    xor         ecx,ecx
 00742070    call        @FillChar
 00742075    lea         eax,[ebp-8]
 00742078    push        eax
 00742079    lea         eax,[ebp-4]
 0074207C    call        @UniqueStringU
 00742081    mov         edx,eax
 00742083    mov         ecx,ebx
 00742085    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074208A    call        @BlockRead
 0074208F    call        @_IOTest
 00742094    lea         eax,[ebp-4]
 00742097    mov         edx,dword ptr [ebp-8]
 0074209A    call        @UStrSetLength
 0074209F    mov         eax,esi
 007420A1    mov         edx,dword ptr [ebp-4]
 007420A4    call        @UStrAsg
 007420A9    xor         eax,eax
 007420AB    pop         edx
 007420AC    pop         ecx
 007420AD    pop         ecx
 007420AE    mov         dword ptr fs:[eax],edx
 007420B1    push        7420C6
 007420B6    lea         eax,[ebp-4]
 007420B9    call        @UStrClr
 007420BE    ret
>007420BF    jmp         @HandleFinally
>007420C4    jmp         007420B6
 007420C6    pop         esi
 007420C7    pop         ebx
 007420C8    pop         ecx
 007420C9    pop         ecx
 007420CA    pop         ebp
 007420CB    ret
end;*}

//007420CC
{*function sub_007420CC:?;
begin
 007420CC    push        ebx
 007420CD    push        esi
 007420CE    call        0073F2A4
 007420D3    call        0073F2F4
 007420D8    mov         ebx,eax
 007420DA    xor         esi,esi
 007420DC    cmp         ebx,2
>007420DF    jne         007420EB
 007420E1    call        0073F2A4
 007420E6    movzx       esi,ax
>007420E9    jmp         0074211B
 007420EB    cmp         ebx,4
>007420EE    jne         007420F9
 007420F0    call        0073F2F4
 007420F5    mov         esi,eax
>007420F7    jmp         0074211B
 007420F9    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007420FE    call        @FilePos
 00742103    call        @_IOTest
 00742108    mov         edx,eax
 0074210A    add         edx,ebx
 0074210C    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742111    call        @Seek
 00742116    call        @_IOTest
 0074211B    mov         eax,esi
 0074211D    pop         esi
 0074211E    pop         ebx
 0074211F    ret
end;*}

//00742120
{*function sub_00742120:?;
begin
 00742120    push        ebp
 00742121    mov         ebp,esp
 00742123    push        ebx
 00742124    push        esi
 00742125    xor         eax,eax
 00742127    push        ebp
 00742128    push        74219F
 0074212D    push        dword ptr fs:[eax]
 00742130    mov         dword ptr fs:[eax],esp
 00742133    call        0073F2A4
 00742138    call        0073F2F4
 0074213D    mov         ebx,eax
 0074213F    xor         esi,esi
 00742141    cmp         ebx,1
>00742144    jne         00742150
 00742146    call        0073F228
 0074214B    movzx       esi,al
>0074214E    jmp         0074218F
 00742150    cmp         ebx,2
>00742153    jne         0074215F
 00742155    call        0073F2A4
 0074215A    movzx       esi,ax
>0074215D    jmp         0074218F
 0074215F    cmp         ebx,4
>00742162    jne         0074216D
 00742164    call        0073F2F4
 00742169    mov         esi,eax
>0074216B    jmp         0074218F
 0074216D    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742172    call        @FilePos
 00742177    call        @_IOTest
 0074217C    mov         edx,eax
 0074217E    add         edx,ebx
 00742180    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742185    call        @Seek
 0074218A    call        @_IOTest
 0074218F    mov         ebx,esi
 00742191    xor         eax,eax
 00742193    pop         edx
 00742194    pop         ecx
 00742195    pop         ecx
 00742196    mov         dword ptr fs:[eax],edx
 00742199    push        7421A6
 0074219E    ret
>0074219F    jmp         @HandleFinally
>007421A4    jmp         0074219E
 007421A6    mov         eax,ebx
 007421A8    pop         esi
 007421A9    pop         ebx
 007421AA    pop         ebp
 007421AB    ret
end;*}

//007421AC
{*procedure sub_007421AC(?:UnicodeString; ?:?);
begin
 007421AC    push        ebp
 007421AD    mov         ebp,esp
 007421AF    add         esp,0FFFFFFF8
 007421B2    push        ebx
 007421B3    push        esi
 007421B4    push        edi
 007421B5    xor         ecx,ecx
 007421B7    mov         dword ptr [ebp-8],ecx
 007421BA    mov         ebx,edx
 007421BC    mov         dword ptr [ebp-4],eax
 007421BF    mov         eax,dword ptr [ebp-4]
 007421C2    call        @UStrAddRef
 007421C7    xor         eax,eax
 007421C9    push        ebp
 007421CA    push        74224E
 007421CF    push        dword ptr fs:[eax]
 007421D2    mov         dword ptr fs:[eax],esp
 007421D5    mov         eax,ebx
 007421D7    call        @UStrClr
 007421DC    mov         eax,dword ptr [ebp-4]
 007421DF    test        eax,eax
>007421E1    je          007421E8
 007421E3    sub         eax,4
 007421E6    mov         eax,dword ptr [eax]
 007421E8    mov         esi,eax
 007421EA    test        esi,esi
>007421EC    jle         00742222
 007421EE    mov         edi,1
 007421F3    push        dword ptr [ebx]
 007421F5    push        742268;' '
 007421FA    mov         eax,dword ptr [ebp-4]
 007421FD    movzx       eax,word ptr [eax+edi*2-2]
 00742202    lea         ecx,[ebp-8]
 00742205    mov         edx,2
 0074220A    call        IntToHex
 0074220F    push        dword ptr [ebp-8]
 00742212    mov         eax,ebx
 00742214    mov         edx,3
 00742219    call        @UStrCatN
 0074221E    inc         edi
 0074221F    dec         esi
>00742220    jne         007421F3
 00742222    mov         eax,ebx
 00742224    mov         ecx,1
 00742229    mov         edx,1
 0074222E    call        @UStrDelete
 00742233    xor         eax,eax
 00742235    pop         edx
 00742236    pop         ecx
 00742237    pop         ecx
 00742238    mov         dword ptr fs:[eax],edx
 0074223B    push        742255
 00742240    lea         eax,[ebp-8]
 00742243    mov         edx,2
 00742248    call        @UStrArrayClr
 0074224D    ret
>0074224E    jmp         @HandleFinally
>00742253    jmp         00742240
 00742255    pop         edi
 00742256    pop         esi
 00742257    pop         ebx
 00742258    pop         ecx
 00742259    pop         ecx
 0074225A    pop         ebp
 0074225B    ret
end;*}

//0074226C
{*procedure sub_0074226C(?:?);
begin
 0074226C    push        ebp
 0074226D    mov         ebp,esp
 0074226F    push        0
 00742271    push        0
 00742273    push        ebx
 00742274    mov         ebx,eax
 00742276    xor         eax,eax
 00742278    push        ebp
 00742279    push        7422CB
 0074227E    push        dword ptr fs:[eax]
 00742281    mov         dword ptr fs:[eax],esp
 00742284    push        7422E4;'//Header: "'
 00742289    lea         eax,[ebp-8]
 0074228C    call        0074202C
 00742291    push        dword ptr [ebp-8]
 00742294    push        742308;'"'
 00742299    lea         eax,[ebp-4]
 0074229C    mov         edx,3
 007422A1    call        @UStrCatN
 007422A6    mov         edx,dword ptr [ebp-4]
 007422A9    mov         eax,ebx
 007422AB    call        00741FA8
 007422B0    xor         eax,eax
 007422B2    pop         edx
 007422B3    pop         ecx
 007422B4    pop         ecx
 007422B5    mov         dword ptr fs:[eax],edx
 007422B8    push        7422D2
 007422BD    lea         eax,[ebp-8]
 007422C0    mov         edx,2
 007422C5    call        @UStrArrayClr
 007422CA    ret
>007422CB    jmp         @HandleFinally
>007422D0    jmp         007422BD
 007422D2    pop         ebx
 007422D3    pop         ecx
 007422D4    pop         ecx
 007422D5    pop         ebp
 007422D6    ret
end;*}

//0074230C
{*procedure sub_0074230C(?:?);
begin
 0074230C    push        ebp
 0074230D    mov         ebp,esp
 0074230F    push        0
 00742311    push        0
 00742313    push        0
 00742315    push        ebx
 00742316    mov         ebx,eax
 00742318    xor         eax,eax
 0074231A    push        ebp
 0074231B    push        74236E
 00742320    push        dword ptr fs:[eax]
 00742323    mov         dword ptr fs:[eax],esp
 00742326    lea         eax,[ebp-0C]
 00742329    call        0074202C
 0074232E    mov         eax,dword ptr [ebp-0C]
 00742331    lea         edx,[ebp-8]
 00742334    call        007421AC
 00742339    mov         ecx,dword ptr [ebp-8]
 0074233C    lea         eax,[ebp-4]
 0074233F    mov         edx,742388;'//Reserved: '
 00742344    call        @UStrCat3
 00742349    mov         edx,dword ptr [ebp-4]
 0074234C    mov         eax,ebx
 0074234E    call        00741FA8
 00742353    xor         eax,eax
 00742355    pop         edx
 00742356    pop         ecx
 00742357    pop         ecx
 00742358    mov         dword ptr fs:[eax],edx
 0074235B    push        742375
 00742360    lea         eax,[ebp-0C]
 00742363    mov         edx,3
 00742368    call        @UStrArrayClr
 0074236D    ret
>0074236E    jmp         @HandleFinally
>00742373    jmp         00742360
 00742375    pop         ebx
 00742376    mov         esp,ebp
 00742378    pop         ebp
 00742379    ret
end;*}

//007423A4
{*procedure sub_007423A4(?:?);
begin
 007423A4    push        ebp
 007423A5    mov         ebp,esp
 007423A7    push        0
 007423A9    push        0
 007423AB    push        0
 007423AD    push        ebx
 007423AE    mov         ebx,eax
 007423B0    xor         eax,eax
 007423B2    push        ebp
 007423B3    push        74241A
 007423B8    push        dword ptr fs:[eax]
 007423BB    mov         dword ptr fs:[eax],esp
 007423BE    push        742434;'//Title: "'
 007423C3    lea         eax,[ebp-8]
 007423C6    call        0074202C
 007423CB    push        dword ptr [ebp-8]
 007423CE    push        742458;'", has '
 007423D3    call        007420CC
 007423D8    lea         edx,[ebp-0C]
 007423DB    call        IntToStr
 007423E0    push        dword ptr [ebp-0C]
 007423E3    push        742474;' elements'
 007423E8    lea         eax,[ebp-4]
 007423EB    mov         edx,5
 007423F0    call        @UStrCatN
 007423F5    mov         edx,dword ptr [ebp-4]
 007423F8    mov         eax,ebx
 007423FA    call        00741FA8
 007423FF    xor         eax,eax
 00742401    pop         edx
 00742402    pop         ecx
 00742403    pop         ecx
 00742404    mov         dword ptr fs:[eax],edx
 00742407    push        742421
 0074240C    lea         eax,[ebp-0C]
 0074240F    mov         edx,3
 00742414    call        @UStrArrayClr
 00742419    ret
>0074241A    jmp         @HandleFinally
>0074241F    jmp         0074240C
 00742421    pop         ebx
 00742422    mov         esp,ebp
 00742424    pop         ebp
 00742425    ret
end;*}

//00742488
{*procedure sub_00742488(?:?; ?:?);
begin
 00742488    push        ebp
 00742489    mov         ebp,esp
 0074248B    push        0
 0074248D    push        0
 0074248F    push        ebx
 00742490    push        esi
 00742491    mov         ebx,edx
 00742493    mov         esi,eax
 00742495    xor         eax,eax
 00742497    push        ebp
 00742498    push        7424FB
 0074249D    push        dword ptr fs:[eax]
 007424A0    mov         dword ptr fs:[eax],esp
 007424A3    push        742514;'//'
 007424A8    lea         edx,[ebp-8]
 007424AB    mov         eax,ebx
 007424AD    call        IntToStr
 007424B2    push        dword ptr [ebp-8]
 007424B5    push        742528;' Commands...'
 007424BA    lea         eax,[ebp-4]
 007424BD    mov         edx,3
 007424C2    call        @UStrCatN
 007424C7    mov         edx,dword ptr [ebp-4]
 007424CA    mov         eax,esi
 007424CC    call        00741FA8
 007424D1    test        ebx,ebx
>007424D3    jle         007424E0
 007424D5    lea         eax,[esi+1]
 007424D8    call        00742970
 007424DD    dec         ebx
>007424DE    jne         007424D5
 007424E0    xor         eax,eax
 007424E2    pop         edx
 007424E3    pop         ecx
 007424E4    pop         ecx
 007424E5    mov         dword ptr fs:[eax],edx
 007424E8    push        742502
 007424ED    lea         eax,[ebp-8]
 007424F0    mov         edx,2
 007424F5    call        @UStrArrayClr
 007424FA    ret
>007424FB    jmp         @HandleFinally
>00742500    jmp         007424ED
 00742502    pop         esi
 00742503    pop         ebx
 00742504    pop         ecx
 00742505    pop         ecx
 00742506    pop         ebp
 00742507    ret
end;*}

//00742544
{*procedure sub_00742544(?:?; ?:?);
begin
 00742544    push        ebp
 00742545    mov         ebp,esp
 00742547    xor         ecx,ecx
 00742549    push        ecx
 0074254A    push        ecx
 0074254B    push        ecx
 0074254C    push        ecx
 0074254D    push        ebx
 0074254E    push        esi
 0074254F    push        edi
 00742550    mov         edi,edx
 00742552    mov         esi,eax
 00742554    xor         eax,eax
 00742556    push        ebp
 00742557    push        7425EA
 0074255C    push        dword ptr fs:[eax]
 0074255F    mov         dword ptr fs:[eax],esp
 00742562    lea         eax,[ebp-4]
 00742565    call        0074202C
 0074256A    call        007420CC
 0074256F    mov         ebx,eax
 00742571    push        742604;'// Command '
 00742576    lea         edx,[ebp-0C]
 00742579    mov         eax,ebx
 0074257B    call        IntToStr
 00742580    push        dword ptr [ebp-0C]
 00742583    push        742628;': "'
 00742588    push        dword ptr [ebp-4]
 0074258B    push        74263C;'", '
 00742590    call        00742120
 00742595    xor         edx,edx
 00742597    push        edx
 00742598    push        eax
 00742599    lea         eax,[ebp-10]
 0074259C    call        IntToStr
 007425A1    push        dword ptr [ebp-10]
 007425A4    lea         eax,[ebp-8]
 007425A7    mov         edx,6
 007425AC    call        @UStrCatN
 007425B1    mov         edx,dword ptr [ebp-8]
 007425B4    mov         eax,esi
 007425B6    call        00741FA8
 007425BB    mov         ebx,edi
 007425BD    sub         ebx,3
 007425C0    test        ebx,ebx
>007425C2    jle         007425CF
 007425C4    lea         eax,[esi+1]
 007425C7    call        00742970
 007425CC    dec         ebx
>007425CD    jne         007425C4
 007425CF    xor         eax,eax
 007425D1    pop         edx
 007425D2    pop         ecx
 007425D3    pop         ecx
 007425D4    mov         dword ptr fs:[eax],edx
 007425D7    push        7425F1
 007425DC    lea         eax,[ebp-10]
 007425DF    mov         edx,4
 007425E4    call        @UStrArrayClr
 007425E9    ret
>007425EA    jmp         @HandleFinally
>007425EF    jmp         007425DC
 007425F1    pop         edi
 007425F2    pop         esi
 007425F3    pop         ebx
 007425F4    mov         esp,ebp
 007425F6    pop         ebp
 007425F7    ret
end;*}

//00742644
{*procedure sub_00742644(?:?);
begin
 00742644    push        ebp
 00742645    mov         ebp,esp
 00742647    push        0
 00742649    push        0
 0074264B    push        0
 0074264D    push        ebx
 0074264E    mov         ebx,eax
 00742650    xor         eax,eax
 00742652    push        ebp
 00742653    push        7426B0
 00742658    push        dword ptr fs:[eax]
 0074265B    mov         dword ptr fs:[eax],esp
 0074265E    push        7426C8;'//Kind 6: 10 bytes: "'
 00742663    lea         eax,[ebp-0C]
 00742666    call        0074202C
 0074266B    mov         eax,dword ptr [ebp-0C]
 0074266E    lea         edx,[ebp-8]
 00742671    call        007421AC
 00742676    push        dword ptr [ebp-8]
 00742679    push        742700;'"'
 0074267E    lea         eax,[ebp-4]
 00742681    mov         edx,3
 00742686    call        @UStrCatN
 0074268B    mov         edx,dword ptr [ebp-4]
 0074268E    mov         eax,ebx
 00742690    call        00741FA8
 00742695    xor         eax,eax
 00742697    pop         edx
 00742698    pop         ecx
 00742699    pop         ecx
 0074269A    mov         dword ptr fs:[eax],edx
 0074269D    push        7426B7
 007426A2    lea         eax,[ebp-0C]
 007426A5    mov         edx,3
 007426AA    call        @UStrArrayClr
 007426AF    ret
>007426B0    jmp         @HandleFinally
>007426B5    jmp         007426A2
 007426B7    pop         ebx
 007426B8    mov         esp,ebp
 007426BA    pop         ebp
 007426BB    ret
end;*}

//00742704
{*procedure sub_00742704(?:?);
begin
 00742704    push        ebp
 00742705    mov         ebp,esp
 00742707    xor         ecx,ecx
 00742709    push        ecx
 0074270A    push        ecx
 0074270B    push        ecx
 0074270C    push        ecx
 0074270D    push        ecx
 0074270E    push        ecx
 0074270F    push        ebx
 00742710    mov         ebx,eax
 00742712    xor         eax,eax
 00742714    push        ebp
 00742715    push        7427A2
 0074271A    push        dword ptr fs:[eax]
 0074271D    mov         dword ptr fs:[eax],esp
 00742720    push        7427BC;'//Kind 11: "'
 00742725    lea         eax,[ebp-0C]
 00742728    call        0074202C
 0074272D    mov         eax,dword ptr [ebp-0C]
 00742730    lea         edx,[ebp-8]
 00742733    call        007421AC
 00742738    push        dword ptr [ebp-8]
 0074273B    push        7427E4;'", '
 00742740    call        007420CC
 00742745    lea         edx,[ebp-10]
 00742748    call        IntToStr
 0074274D    push        dword ptr [ebp-10]
 00742750    push        7427F8;', "'
 00742755    lea         eax,[ebp-18]
 00742758    call        0074202C
 0074275D    mov         eax,dword ptr [ebp-18]
 00742760    lea         edx,[ebp-14]
 00742763    call        007421AC
 00742768    push        dword ptr [ebp-14]
 0074276B    push        74280C;'"'
 00742770    lea         eax,[ebp-4]
 00742773    mov         edx,7
 00742778    call        @UStrCatN
 0074277D    mov         edx,dword ptr [ebp-4]
 00742780    mov         eax,ebx
 00742782    call        00741FA8
 00742787    xor         eax,eax
 00742789    pop         edx
 0074278A    pop         ecx
 0074278B    pop         ecx
 0074278C    mov         dword ptr fs:[eax],edx
 0074278F    push        7427A9
 00742794    lea         eax,[ebp-18]
 00742797    mov         edx,6
 0074279C    call        @UStrArrayClr
 007427A1    ret
>007427A2    jmp         @HandleFinally
>007427A7    jmp         00742794
 007427A9    pop         ebx
 007427AA    mov         esp,ebp
 007427AC    pop         ebp
 007427AD    ret
end;*}

//00742810
{*procedure sub_00742810(?:?);
begin
 00742810    push        ebp
 00742811    mov         ebp,esp
 00742813    push        0
 00742815    push        0
 00742817    push        0
 00742819    push        ebx
 0074281A    mov         ebx,eax
 0074281C    xor         eax,eax
 0074281E    push        ebp
 0074281F    push        74287C
 00742824    push        dword ptr fs:[eax]
 00742827    mov         dword ptr fs:[eax],esp
 0074282A    push        742894;'//Kind 12: "'
 0074282F    lea         eax,[ebp-0C]
 00742832    call        0074202C
 00742837    mov         eax,dword ptr [ebp-0C]
 0074283A    lea         edx,[ebp-8]
 0074283D    call        007421AC
 00742842    push        dword ptr [ebp-8]
 00742845    push        7428BC;'"'
 0074284A    lea         eax,[ebp-4]
 0074284D    mov         edx,3
 00742852    call        @UStrCatN
 00742857    mov         edx,dword ptr [ebp-4]
 0074285A    mov         eax,ebx
 0074285C    call        00741FA8
 00742861    xor         eax,eax
 00742863    pop         edx
 00742864    pop         ecx
 00742865    pop         ecx
 00742866    mov         dword ptr fs:[eax],edx
 00742869    push        742883
 0074286E    lea         eax,[ebp-0C]
 00742871    mov         edx,3
 00742876    call        @UStrArrayClr
 0074287B    ret
>0074287C    jmp         @HandleFinally
>00742881    jmp         0074286E
 00742883    pop         ebx
 00742884    mov         esp,ebp
 00742886    pop         ebp
 00742887    ret
end;*}

//007428C0
{*procedure sub_007428C0(?:?);
begin
 007428C0    push        ebp
 007428C1    mov         ebp,esp
 007428C3    push        0
 007428C5    push        0
 007428C7    push        0
 007428C9    push        ebx
 007428CA    mov         ebx,eax
 007428CC    xor         eax,eax
 007428CE    push        ebp
 007428CF    push        74292C
 007428D4    push        dword ptr fs:[eax]
 007428D7    mov         dword ptr fs:[eax],esp
 007428DA    push        742944;'//Kind 14: "'
 007428DF    lea         eax,[ebp-0C]
 007428E2    call        0074202C
 007428E7    mov         eax,dword ptr [ebp-0C]
 007428EA    lea         edx,[ebp-8]
 007428ED    call        007421AC
 007428F2    push        dword ptr [ebp-8]
 007428F5    push        74296C;'"'
 007428FA    lea         eax,[ebp-4]
 007428FD    mov         edx,3
 00742902    call        @UStrCatN
 00742907    mov         edx,dword ptr [ebp-4]
 0074290A    mov         eax,ebx
 0074290C    call        00741FA8
 00742911    xor         eax,eax
 00742913    pop         edx
 00742914    pop         ecx
 00742915    pop         ecx
 00742916    mov         dword ptr fs:[eax],edx
 00742919    push        742933
 0074291E    lea         eax,[ebp-0C]
 00742921    mov         edx,3
 00742926    call        @UStrArrayClr
 0074292B    ret
>0074292C    jmp         @HandleFinally
>00742931    jmp         0074291E
 00742933    pop         ebx
 00742934    mov         esp,ebp
 00742936    pop         ebp
 00742937    ret
end;*}

//00742970
{*procedure sub_00742970(?:?);
begin
 00742970    push        ebp
 00742971    mov         ebp,esp
 00742973    mov         ecx,7
 00742978    push        0
 0074297A    push        0
 0074297C    dec         ecx
>0074297D    jne         00742978
 0074297F    push        ebx
 00742980    push        esi
 00742981    push        edi
 00742982    mov         esi,eax
 00742984    xor         eax,eax
 00742986    push        ebp
 00742987    push        742C66
 0074298C    push        dword ptr fs:[eax]
 0074298F    mov         dword ptr fs:[eax],esp
 00742992    call        0073F2A4
 00742997    mov         edi,eax
 00742999    call        0073F2F4
 0074299E    mov         ebx,eax
 007429A0    cmp         di,1
>007429A4    jne         00742AFC
 007429AA    call        0073F2F4
 007429AF    mov         dword ptr [ebp-8],eax
 007429B2    call        0073F2F4
 007429B7    mov         dword ptr [ebp-0C],eax
 007429BA    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007429BF    call        @FilePos
 007429C4    call        @_IOTest
 007429C9    mov         edi,eax
 007429CB    mov         eax,dword ptr [ebp-8]
 007429CE    cmp         eax,0E
>007429D1    ja          00742A89
 007429D7    jmp         dword ptr [eax*4+7429DE]
 007429D7    dd          00742A89
 007429D7    dd          00742A1A
 007429D7    dd          00742A27
 007429D7    dd          00742A34
 007429D7    dd          00742A41
 007429D7    dd          00742A51
 007429D7    dd          00742A61
 007429D7    dd          00742A89
 007429D7    dd          00742A89
 007429D7    dd          00742A89
 007429D7    dd          00742A89
 007429D7    dd          00742A6B
 007429D7    dd          00742A75
 007429D7    dd          00742A89
 007429D7    dd          00742A7F
 00742A1A    lea         eax,[esi+1]
 00742A1D    call        0074226C
>00742A22    jmp         00742AE5
 00742A27    lea         eax,[esi+1]
 00742A2A    call        0074230C
>00742A2F    jmp         00742AE5
 00742A34    lea         eax,[esi+1]
 00742A37    call        007423A4
>00742A3C    jmp         00742AE5
 00742A41    lea         eax,[esi+1]
 00742A44    mov         edx,dword ptr [ebp-0C]
 00742A47    call        00742488
>00742A4C    jmp         00742AE5
 00742A51    lea         eax,[esi+1]
 00742A54    mov         edx,dword ptr [ebp-0C]
 00742A57    call        00742544
>00742A5C    jmp         00742AE5
 00742A61    lea         eax,[esi+1]
 00742A64    call        00742644
>00742A69    jmp         00742AE5
 00742A6B    lea         eax,[esi+1]
 00742A6E    call        00742704
>00742A73    jmp         00742AE5
 00742A75    lea         eax,[esi+1]
 00742A78    call        00742810
>00742A7D    jmp         00742AE5
 00742A7F    lea         eax,[esi+1]
 00742A82    call        007428C0
>00742A87    jmp         00742AE5
 00742A89    push        742C80;'Kind = '
 00742A8E    mov         eax,dword ptr [ebp-8]
 00742A91    xor         edx,edx
 00742A93    push        edx
 00742A94    push        eax
 00742A95    lea         eax,[ebp-20]
 00742A98    call        IntToStr
 00742A9D    push        dword ptr [ebp-20]
 00742AA0    push        742C9C;'; SubBlocks = '
 00742AA5    mov         eax,dword ptr [ebp-0C]
 00742AA8    xor         edx,edx
 00742AAA    push        edx
 00742AAB    push        eax
 00742AAC    lea         eax,[ebp-24]
 00742AAF    call        IntToStr
 00742AB4    push        dword ptr [ebp-24]
 00742AB7    lea         eax,[ebp-1C]
 00742ABA    mov         edx,4
 00742ABF    call        @UStrCatN
 00742AC4    mov         edx,dword ptr [ebp-1C]
 00742AC7    mov         eax,esi
 00742AC9    call        00741FA8
 00742ACE    mov         eax,dword ptr [ebp-0C]
 00742AD1    test        eax,eax
>00742AD3    jbe         00742AE5
 00742AD5    mov         dword ptr [ebp-18],eax
 00742AD8    lea         eax,[esi+1]
 00742ADB    call        00742970
 00742AE0    dec         dword ptr [ebp-18]
>00742AE3    jne         00742AD8
 00742AE5    lea         edx,[ebx+edi]
 00742AE8    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742AED    call        @Seek
 00742AF2    call        @_IOTest
>00742AF7    jmp         00742C37
 00742AFC    mov         eax,ebx
 00742AFE    xor         edx,edx
 00742B00    push        edx
 00742B01    push        eax
 00742B02    lea         eax,[ebp-28]
 00742B05    call        IntToStr
 00742B0A    lea         eax,[ebp-28]
 00742B0D    mov         edx,742CC8;' bytes of data'
 00742B12    call        @UStrCat
 00742B17    mov         edx,dword ptr [ebp-28]
 00742B1A    mov         eax,esi
 00742B1C    call        00741FA8
 00742B21    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742B26    call        @FilePos
 00742B2B    call        @_IOTest
 00742B30    mov         edi,eax
 00742B32    lea         eax,[ebp-4]
 00742B35    mov         edx,ebx
 00742B37    call        @UStrSetLength
 00742B3C    test        ebx,ebx
>00742B3E    jbe         00742B7C
 00742B40    lea         eax,[ebp-4]
 00742B43    call        @UniqueStringU
 00742B48    lea         edx,[ebx+1]
 00742B4B    xor         ecx,ecx
 00742B4D    call        @FillChar
 00742B52    lea         eax,[ebp-14]
 00742B55    push        eax
 00742B56    lea         eax,[ebp-4]
 00742B59    call        @UniqueStringU
 00742B5E    mov         edx,eax
 00742B60    mov         ecx,ebx
 00742B62    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742B67    call        @BlockRead
 00742B6C    call        @_IOTest
 00742B71    lea         eax,[ebp-4]
 00742B74    mov         edx,dword ptr [ebp-14]
 00742B77    call        @UStrSetLength
 00742B7C    cmp         dword ptr [ebp-4],0
>00742B80    je          00742BBB
 00742B82    mov         eax,dword ptr [ebp-4]
 00742B85    cmp         word ptr [eax],20
>00742B89    jb          00742BBB
 00742B8B    mov         eax,dword ptr [ebp-4]
 00742B8E    cmp         word ptr [eax],7F
>00742B92    jae         00742BBB
 00742B94    push        742CF4;'"'
 00742B99    push        dword ptr [ebp-4]
 00742B9C    push        742CF4;'"'
 00742BA1    lea         eax,[ebp-2C]
 00742BA4    mov         edx,3
 00742BA9    call        @UStrCatN
 00742BAE    mov         edx,dword ptr [ebp-2C]
 00742BB1    lea         eax,[esi+1]
 00742BB4    call        00741FA8
>00742BB9    jmp         00742C25
 00742BBB    cmp         ebx,4
>00742BBE    jne         00742BF5
 00742BC0    mov         edx,edi
 00742BC2    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742BC7    call        @Seek
 00742BCC    call        @_IOTest
 00742BD1    call        0073F2F4
 00742BD6    mov         dword ptr [ebp-10],eax
 00742BD9    mov         eax,dword ptr [ebp-10]
 00742BDC    xor         edx,edx
 00742BDE    push        edx
 00742BDF    push        eax
 00742BE0    lea         eax,[ebp-30]
 00742BE3    call        IntToStr
 00742BE8    mov         edx,dword ptr [ebp-30]
 00742BEB    lea         eax,[esi+1]
 00742BEE    call        00741FA8
>00742BF3    jmp         00742C25
 00742BF5    push        742CF4;'"'
 00742BFA    lea         edx,[ebp-38]
 00742BFD    mov         eax,dword ptr [ebp-4]
 00742C00    call        007421AC
 00742C05    push        dword ptr [ebp-38]
 00742C08    push        742CF4;'"'
 00742C0D    lea         eax,[ebp-34]
 00742C10    mov         edx,3
 00742C15    call        @UStrCatN
 00742C1A    mov         edx,dword ptr [ebp-34]
 00742C1D    lea         eax,[esi+1]
 00742C20    call        00741FA8
 00742C25    lea         edx,[ebx+edi]
 00742C28    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742C2D    call        @Seek
 00742C32    call        @_IOTest
 00742C37    mov         edx,742D04;'End'
 00742C3C    mov         eax,esi
 00742C3E    call        00741FA8
 00742C43    xor         eax,eax
 00742C45    pop         edx
 00742C46    pop         ecx
 00742C47    pop         ecx
 00742C48    mov         dword ptr fs:[eax],edx
 00742C4B    push        742C6D
 00742C50    lea         eax,[ebp-38]
 00742C53    mov         edx,8
 00742C58    call        @UStrArrayClr
 00742C5D    lea         eax,[ebp-4]
 00742C60    call        @UStrClr
 00742C65    ret
>00742C66    jmp         @HandleFinally
>00742C6B    jmp         00742C50
 00742C6D    pop         edi
 00742C6E    pop         esi
 00742C6F    pop         ebx
 00742C70    mov         esp,ebp
 00742C72    pop         ebp
 00742C73    ret
end;*}

//00742D0C
procedure sub_00742D0C(?:UnicodeString);
begin
{*
 00742D0C    push        ebp
 00742D0D    mov         ebp,esp
 00742D0F    add         esp,0FFFFFFF4
 00742D12    push        ebx
 00742D13    push        esi
 00742D14    push        edi
 00742D15    mov         dword ptr [ebp-4],eax
 00742D18    mov         eax,dword ptr [ebp-4]
 00742D1B    call        @UStrAddRef
 00742D20    xor         eax,eax
 00742D22    push        ebp
 00742D23    push        742DE4
 00742D28    push        dword ptr fs:[eax]
 00742D2B    mov         dword ptr fs:[eax],esp
 00742D2E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00742D33    mov         eax,dword ptr [eax]
 00742D35    mov         eax,dword ptr [eax+394]
 00742D3B    mov         eax,dword ptr [eax+2A4]
 00742D41    mov         edx,dword ptr [eax]
 00742D43    call        dword ptr [edx+44]
 00742D46    mov         edx,dword ptr [ebp-4]
 00742D49    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742D4E    call        @Assign
 00742D53    mov         edx,1
 00742D58    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742D5D    call        @ResetFile
 00742D62    call        @_IOTest
 00742D67    xor         edx,edx
 00742D69    push        ebp
 00742D6A    push        742DA4
 00742D6F    push        dword ptr fs:[edx]
 00742D72    mov         dword ptr fs:[edx],esp
 00742D75    push        0
 00742D77    lea         edx,[ebp-0A]
 00742D7A    mov         ecx,3
 00742D7F    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742D84    call        @BlockRead
 00742D89    call        @_IOTest
 00742D8E    call        0073F2A4
 00742D93    xor         eax,eax
 00742D95    call        00742970
 00742D9A    xor         eax,eax
 00742D9C    pop         edx
 00742D9D    pop         ecx
 00742D9E    pop         ecx
 00742D9F    mov         dword ptr fs:[eax],edx
>00742DA2    jmp         00742DBF
>00742DA4    jmp         @HandleOnException
 00742DA9    dd          1
 00742DAD    dd          00418C04;Exception
 00742DB1    dd          00742DB5
 00742DB5    call        004FA644
 00742DBA    call        @DoneExcept
 00742DBF    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742DC4    call        @Close
 00742DC9    call        @_IOTest
 00742DCE    xor         eax,eax
 00742DD0    pop         edx
 00742DD1    pop         ecx
 00742DD2    pop         ecx
 00742DD3    mov         dword ptr fs:[eax],edx
 00742DD6    push        742DEB
 00742DDB    lea         eax,[ebp-4]
 00742DDE    call        @UStrClr
 00742DE3    ret
>00742DE4    jmp         @HandleFinally
>00742DE9    jmp         00742DDB
 00742DEB    pop         edi
 00742DEC    pop         esi
 00742DED    pop         ebx
 00742DEE    mov         esp,ebp
 00742DF0    pop         ebp
 00742DF1    ret
*}
end;

//00742DF4
{*procedure sub_00742DF4(?:?; ?:UnicodeString);
begin
 00742DF4    push        ebp
 00742DF5    mov         ebp,esp
 00742DF7    xor         ecx,ecx
 00742DF9    push        ecx
 00742DFA    push        ecx
 00742DFB    push        ecx
 00742DFC    push        ecx
 00742DFD    push        ecx
 00742DFE    push        ecx
 00742DFF    push        ecx
 00742E00    push        ebx
 00742E01    push        esi
 00742E02    push        edi
 00742E03    mov         dword ptr [ebp-4],edx
 00742E06    mov         ebx,eax
 00742E08    mov         eax,dword ptr [ebp-4]
 00742E0B    call        @UStrAddRef
 00742E10    mov         edi,822C90;gvar_00822C90:UnicodeString
 00742E15    xor         eax,eax
 00742E17    push        ebp
 00742E18    push        742FD7
 00742E1D    push        dword ptr fs:[eax]
 00742E20    mov         dword ptr fs:[eax],esp
 00742E23    mov         eax,edi
 00742E25    call        @UStrClr
 00742E2A    mov         esi,ebx
 00742E2C    dec         esi
 00742E2D    test        esi,esi
>00742E2F    jl          00742F03
 00742E35    inc         esi
 00742E36    call        0073F264
 00742E3B    mov         ebx,eax
 00742E3D    cmp         bx,0FFFFFFFF
>00742E41    jne         00742E4A
 00742E43    call        0073F264
 00742E48    mov         ebx,eax
 00742E4A    cmp         bx,0FFFFFFFF
>00742E4E    je          00742E55
 00742E50    and         bx,0FF
 00742E55    call        0073F264
 00742E5A    mov         word ptr [ebp-6],ax
 00742E5E    call        0073F1EC
 00742E63    mov         dword ptr [ebp-0C],eax
 00742E66    cmp         word ptr [ebp-6],2
>00742E6B    je          00742E74
 00742E6D    cmp         word ptr [ebp-6],3
>00742E72    jne         00742EB2
 00742E74    test        bx,bx
>00742E77    jle         00742EB2
 00742E79    cmp         dword ptr [edi],0
>00742E7C    je          00742E8A
 00742E7E    mov         eax,edi
 00742E80    mov         edx,742FF4;', '
 00742E85    call        @UStrCat
 00742E8A    push        dword ptr [edi]
 00742E8C    push        743008;'Press('
 00742E91    lea         edx,[ebp-10]
 00742E94    movsx       eax,bx
 00742E97    call        0073F880
 00742E9C    push        dword ptr [ebp-10]
 00742E9F    push        743024;')'
 00742EA4    mov         eax,edi
 00742EA6    mov         edx,4
 00742EAB    call        @UStrCatN
>00742EB0    jmp         00742EFC
 00742EB2    cmp         word ptr [ebp-6],1
>00742EB7    je          00742EC0
 00742EB9    cmp         word ptr [ebp-6],8
>00742EBE    jne         00742EFC
 00742EC0    test        bx,bx
>00742EC3    jle         00742EFC
 00742EC5    cmp         dword ptr [edi],0
>00742EC8    je          00742ED6
 00742ECA    mov         eax,edi
 00742ECC    mov         edx,742FF4;', '
 00742ED1    call        @UStrCat
 00742ED6    push        dword ptr [edi]
 00742ED8    push        743034;'Release('
 00742EDD    lea         edx,[ebp-14]
 00742EE0    movsx       eax,bx
 00742EE3    call        0073F880
 00742EE8    push        dword ptr [ebp-14]
 00742EEB    push        743024;')'
 00742EF0    mov         eax,edi
 00742EF2    mov         edx,4
 00742EF7    call        @UStrCatN
 00742EFC    dec         esi
>00742EFD    jne         00742E36
 00742F03    cmp         dword ptr [edi],0
>00742F06    je          00742F47
 00742F08    cmp         dword ptr [ebp-4],0
>00742F0C    je          00742F47
 00742F0E    push        743054;'said("'
 00742F13    push        dword ptr [ebp-4]
 00742F16    push        743070;'") => '
 00742F1B    push        dword ptr [edi]
 00742F1D    lea         eax,[ebp-18]
 00742F20    mov         edx,4
 00742F25    call        @UStrCatN
 00742F2A    mov         edx,dword ptr [ebp-18]
 00742F2D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00742F32    mov         eax,dword ptr [eax]
 00742F34    mov         eax,dword ptr [eax+394]
 00742F3A    mov         eax,dword ptr [eax+2A4]
 00742F40    mov         ecx,dword ptr [eax]
 00742F42    call        dword ptr [ecx+38]
>00742F45    jmp         00742F82
 00742F47    cmp         dword ptr [ebp-4],0
>00742F4B    je          00742F82
 00742F4D    push        743054;'said("'
 00742F52    push        dword ptr [ebp-4]
 00742F55    push        74308C;'") => var.DoNothing'
 00742F5A    lea         eax,[ebp-1C]
 00742F5D    mov         edx,3
 00742F62    call        @UStrCatN
 00742F67    mov         edx,dword ptr [ebp-1C]
 00742F6A    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00742F6F    mov         eax,dword ptr [eax]
 00742F71    mov         eax,dword ptr [eax+394]
 00742F77    mov         eax,dword ptr [eax+2A4]
 00742F7D    mov         ecx,dword ptr [eax]
 00742F7F    call        dword ptr [ecx+38]
 00742F82    push        0
 00742F84    lea         edx,[ebp-6]
 00742F87    mov         ecx,2
 00742F8C    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742F91    call        @BlockRead
 00742F96    call        @_IOTest
 00742F9B    push        0
 00742F9D    lea         edx,[ebp-0C]
 00742FA0    mov         ecx,4
 00742FA5    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00742FAA    call        @BlockRead
 00742FAF    call        @_IOTest
 00742FB4    xor         eax,eax
 00742FB6    pop         edx
 00742FB7    pop         ecx
 00742FB8    pop         ecx
 00742FB9    mov         dword ptr fs:[eax],edx
 00742FBC    push        742FDE
 00742FC1    lea         eax,[ebp-1C]
 00742FC4    mov         edx,4
 00742FC9    call        @UStrArrayClr
 00742FCE    lea         eax,[ebp-4]
 00742FD1    call        @UStrClr
 00742FD6    ret
>00742FD7    jmp         @HandleFinally
>00742FDC    jmp         00742FC1
 00742FDE    pop         edi
 00742FDF    pop         esi
 00742FE0    pop         ebx
 00742FE1    mov         esp,ebp
 00742FE3    pop         ebp
 00742FE4    ret
end;*}

//007430B4
procedure sub_007430B4;
begin
{*
 007430B4    push        ebp
 007430B5    mov         ebp,esp
 007430B7    mov         ecx,18
 007430BC    push        0
 007430BE    push        0
 007430C0    dec         ecx
>007430C1    jne         007430BC
 007430C3    push        ebx
 007430C4    push        esi
 007430C5    push        edi
 007430C6    xor         eax,eax
 007430C8    push        ebp
 007430C9    push        74366F
 007430CE    push        dword ptr fs:[eax]
 007430D1    mov         dword ptr fs:[eax],esp
 007430D4    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007430D9    call        @FilePos
 007430DE    call        @_IOTest
 007430E3    mov         dword ptr [ebp-1C],eax
 007430E6    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007430EB    call        @EofFile
 007430F0    call        @_IOTest
 007430F5    test        al,al
>007430F7    jne         00743651
 007430FD    push        0
 007430FF    lea         edx,[ebp-58]
 00743102    mov         ecx,28
 00743107    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074310C    call        @BlockRead
 00743111    call        @_IOTest
 00743116    push        0
 00743118    lea         edx,[ebp-2]
 0074311B    mov         ecx,2
 00743120    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743125    call        @BlockRead
 0074312A    call        @_IOTest
 0074312F    xor         eax,eax
 00743131    push        ebp
 00743132    push        74364A
 00743137    push        dword ptr fs:[eax]
 0074313A    mov         dword ptr fs:[eax],esp
 0074313D    push        0
 0074313F    lea         edx,[ebp-4]
 00743142    mov         ecx,2
 00743147    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074314C    call        @BlockRead
 00743151    call        @_IOTest
 00743156    push        0
 00743158    lea         edx,[ebp-6]
 0074315B    mov         ecx,2
 00743160    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743165    call        @BlockRead
 0074316A    call        @_IOTest
 0074316F    push        0
 00743171    lea         edx,[ebp-6A]
 00743174    mov         ecx,12
 00743179    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074317E    call        @BlockRead
 00743183    call        @_IOTest
 00743188    push        0
 0074318A    lea         edx,[ebp-7]
 0074318D    mov         ecx,1
 00743192    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743197    call        @BlockRead
 0074319C    call        @_IOTest
 007431A1    push        0
 007431A3    lea         edx,[ebp-0C]
 007431A6    mov         ecx,4
 007431AB    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007431B0    call        @BlockRead
 007431B5    call        @_IOTest
 007431BA    push        0
 007431BC    lea         edx,[ebp-10]
 007431BF    mov         ecx,4
 007431C4    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007431C9    call        @BlockRead
 007431CE    call        @_IOTest
 007431D3    push        0
 007431D5    lea         edx,[ebp-14]
 007431D8    mov         ecx,4
 007431DD    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007431E2    call        @BlockRead
 007431E7    call        @_IOTest
 007431EC    push        0
 007431EE    lea         edx,[ebp-22]
 007431F1    mov         ecx,2
 007431F6    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007431FB    call        @BlockRead
 00743200    call        @_IOTest
 00743205    push        0
 00743207    lea         edx,[ebp-24]
 0074320A    mov         ecx,2
 0074320F    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743214    call        @BlockRead
 00743219    call        @_IOTest
 0074321E    push        0
 00743220    lea         edx,[ebp-28]
 00743223    mov         ecx,4
 00743228    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074322D    call        @BlockRead
 00743232    call        @_IOTest
 00743237    mov         eax,822C90;gvar_00822C90:UnicodeString
 0074323C    call        @UStrClr
 00743241    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743246    call        @FilePos
 0074324B    call        @_IOTest
 00743250    mov         dword ptr [ebp-20],eax
 00743253    mov         eax,dword ptr [ebp-10]
 00743256    sub         eax,2
 00743259    mov         dword ptr [ebp-18],eax
 0074325C    mov         eax,dword ptr [ebp-18]
 0074325F    and         eax,80000001
>00743264    jns         0074326B
 00743266    dec         eax
 00743267    or          eax,0FFFFFFFE
 0074326A    inc         eax
 0074326B    test        eax,eax
>0074326D    je          0074327B
 0074326F    cmp         dword ptr [ebp-18],21
>00743273    jg          0074327B
 00743275    cmp         dword ptr [ebp-18],3
>00743279    jge         007432A6
 0074327B    lea         eax,[ebp-90]
 00743281    lea         edx,[ebp-58]
 00743284    mov         ecx,28
 00743289    call        @UStrFromArray
 0074328E    mov         edx,dword ptr [ebp-90]
 00743294    mov         eax,dword ptr [ebp-18]
 00743297    call        00742DF4
 0074329C    call        @TryFinallyExit
>007432A1    jmp         00743651
 007432A6    mov         esi,dword ptr [ebp-18]
 007432A9    sar         esi,1
>007432AB    jns         007432B0
 007432AD    adc         esi,0
 007432B0    test        esi,esi
>007432B2    jle         0074337B
 007432B8    lea         edi,[ebp-8A]
 007432BE    call        0073F264
 007432C3    mov         ebx,eax
 007432C5    cmp         bx,0FFFFFFFF
>007432C9    jne         00743308
 007432CB    mov         edx,dword ptr [ebp-20]
 007432CE    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007432D3    call        @Seek
 007432D8    call        @_IOTest
 007432DD    lea         eax,[ebp-94]
 007432E3    lea         edx,[ebp-58]
 007432E6    mov         ecx,28
 007432EB    call        @UStrFromArray
 007432F0    mov         edx,dword ptr [ebp-94]
 007432F6    mov         eax,dword ptr [ebp-18]
 007432F9    call        00742DF4
 007432FE    call        @TryFinallyExit
>00743303    jmp         00743651
 00743308    and         bx,0FF
 0074330D    call        0073F264
 00743312    mov         word ptr [ebp-2A],ax
 00743316    call        0073F1EC
 0074331B    mov         dword ptr [ebp-30],eax
 0074331E    cmp         word ptr [ebp-2A],1
>00743323    je          00743331
 00743325    cmp         word ptr [ebp-2A],8
>0074332A    je          00743331
 0074332C    test        bx,bx
>0074332F    jg          0074336E
 00743331    mov         edx,dword ptr [ebp-20]
 00743334    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743339    call        @Seek
 0074333E    call        @_IOTest
 00743343    lea         eax,[ebp-98]
 00743349    lea         edx,[ebp-58]
 0074334C    mov         ecx,28
 00743351    call        @UStrFromArray
 00743356    mov         edx,dword ptr [ebp-98]
 0074335C    mov         eax,dword ptr [ebp-18]
 0074335F    call        00742DF4
 00743364    call        @TryFinallyExit
>00743369    jmp         00743651
 0074336E    mov         word ptr [edi],bx
 00743371    add         edi,2
 00743374    dec         esi
>00743375    jne         007432BE
 0074337B    call        0073F264
 00743380    mov         ebx,eax
 00743382    cmp         bx,0FFFFFFFF
>00743386    je          007433C5
 00743388    mov         edx,dword ptr [ebp-20]
 0074338B    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743390    call        @Seek
 00743395    call        @_IOTest
 0074339A    lea         eax,[ebp-9C]
 007433A0    lea         edx,[ebp-58]
 007433A3    mov         ecx,28
 007433A8    call        @UStrFromArray
 007433AD    mov         edx,dword ptr [ebp-9C]
 007433B3    mov         eax,dword ptr [ebp-18]
 007433B6    call        00742DF4
 007433BB    call        @TryFinallyExit
>007433C0    jmp         00743651
 007433C5    call        0073F264
 007433CA    call        0073F264
 007433CF    mov         word ptr [ebp-2A],ax
 007433D3    call        0073F1EC
 007433D8    mov         dword ptr [ebp-30],eax
 007433DB    mov         esi,dword ptr [ebp-18]
 007433DE    sar         esi,1
>007433E0    jns         007433E5
 007433E2    adc         esi,0
 007433E5    cmp         esi,1
>007433E8    jl          007434B6
 007433EE    lea         edi,[ebp+esi*2-8C]
 007433F5    call        0073F264
 007433FA    mov         ebx,eax
 007433FC    cmp         bx,0FFFFFFFF
>00743400    jne         0074343F
 00743402    mov         edx,dword ptr [ebp-20]
 00743405    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074340A    call        @Seek
 0074340F    call        @_IOTest
 00743414    lea         eax,[ebp-0A0]
 0074341A    lea         edx,[ebp-58]
 0074341D    mov         ecx,28
 00743422    call        @UStrFromArray
 00743427    mov         edx,dword ptr [ebp-0A0]
 0074342D    mov         eax,dword ptr [ebp-18]
 00743430    call        00742DF4
 00743435    call        @TryFinallyExit
>0074343A    jmp         00743651
 0074343F    and         bx,0FF
 00743444    call        0073F264
 00743449    mov         word ptr [ebp-2A],ax
 0074344D    call        0073F1EC
 00743452    mov         dword ptr [ebp-30],eax
 00743455    cmp         word ptr [ebp-2A],2
>0074345A    je          0074346D
 0074345C    cmp         word ptr [ebp-2A],3
>00743461    je          0074346D
 00743463    test        bx,bx
>00743466    jle         0074346D
 00743468    cmp         bx,word ptr [edi]
>0074346B    je          007434AA
 0074346D    mov         edx,dword ptr [ebp-20]
 00743470    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743475    call        @Seek
 0074347A    call        @_IOTest
 0074347F    lea         eax,[ebp-0A4]
 00743485    lea         edx,[ebp-58]
 00743488    mov         ecx,28
 0074348D    call        @UStrFromArray
 00743492    mov         edx,dword ptr [ebp-0A4]
 00743498    mov         eax,dword ptr [ebp-18]
 0074349B    call        00742DF4
 007434A0    call        @TryFinallyExit
>007434A5    jmp         00743651
 007434AA    dec         esi
 007434AB    sub         edi,2
 007434AE    test        esi,esi
>007434B0    jne         007433F5
 007434B6    mov         esi,dword ptr [ebp-18]
 007434B9    sar         esi,1
>007434BB    jns         007434C0
 007434BD    adc         esi,0
 007434C0    test        esi,esi
>007434C2    jle         00743506
 007434C4    lea         ebx,[ebp-8A]
 007434CA    cmp         dword ptr ds:[822C90],0;gvar_00822C90:UnicodeString
>007434D1    je          007434E2
 007434D3    mov         eax,822C90;gvar_00822C90:UnicodeString
 007434D8    mov         edx,74368C;'+'
 007434DD    call        @UStrCat
 007434E2    lea         edx,[ebp-0A8]
 007434E8    movsx       eax,word ptr [ebx]
 007434EB    call        0073F880
 007434F0    mov         edx,dword ptr [ebp-0A8]
 007434F6    mov         eax,822C90;gvar_00822C90:UnicodeString
 007434FB    call        @UStrCat
 00743500    add         ebx,2
 00743503    dec         esi
>00743504    jne         007434CA
 00743506    cmp         dword ptr ds:[822C90],0;gvar_00822C90:UnicodeString
>0074350D    je          00743584
 0074350F    lea         eax,[ebp-0AC]
 00743515    lea         edx,[ebp-58]
 00743518    mov         ecx,28
 0074351D    call        @UStrFromArray
 00743522    cmp         dword ptr [ebp-0AC],0
>00743529    je          00743584
 0074352B    push        74369C;'said("'
 00743530    lea         eax,[ebp-0B4]
 00743536    lea         edx,[ebp-58]
 00743539    mov         ecx,28
 0074353E    call        @UStrFromArray
 00743543    push        dword ptr [ebp-0B4]
 00743549    push        7436B8;'") => '
 0074354E    push        dword ptr ds:[822C90];gvar_00822C90:UnicodeString
 00743554    lea         eax,[ebp-0B0]
 0074355A    mov         edx,4
 0074355F    call        @UStrCatN
 00743564    mov         edx,dword ptr [ebp-0B0]
 0074356A    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0074356F    mov         eax,dword ptr [eax]
 00743571    mov         eax,dword ptr [eax+394]
 00743577    mov         eax,dword ptr [eax+2A4]
 0074357D    mov         ecx,dword ptr [eax]
 0074357F    call        dword ptr [ecx+38]
>00743582    jmp         007435F1
 00743584    lea         eax,[ebp-0B8]
 0074358A    lea         edx,[ebp-58]
 0074358D    mov         ecx,28
 00743592    call        @UStrFromArray
 00743597    cmp         dword ptr [ebp-0B8],0
>0074359E    je          007435F1
 007435A0    push        74369C;'said("'
 007435A5    lea         eax,[ebp-0C0]
 007435AB    lea         edx,[ebp-58]
 007435AE    mov         ecx,28
 007435B3    call        @UStrFromArray
 007435B8    push        dword ptr [ebp-0C0]
 007435BE    push        7436D4;'") => var.DoNothing'
 007435C3    lea         eax,[ebp-0BC]
 007435C9    mov         edx,3
 007435CE    call        @UStrCatN
 007435D3    mov         edx,dword ptr [ebp-0BC]
 007435D9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007435DE    mov         eax,dword ptr [eax]
 007435E0    mov         eax,dword ptr [eax+394]
 007435E6    mov         eax,dword ptr [eax+2A4]
 007435EC    mov         ecx,dword ptr [eax]
 007435EE    call        dword ptr [ecx+38]
 007435F1    push        0
 007435F3    lea         edx,[ebp-2A]
 007435F6    mov         ecx,2
 007435FB    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743600    call        @BlockRead
 00743605    call        @_IOTest
 0074360A    push        0
 0074360C    lea         edx,[ebp-30]
 0074360F    mov         ecx,4
 00743614    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743619    call        @BlockRead
 0074361E    call        @_IOTest
 00743623    xor         eax,eax
 00743625    pop         edx
 00743626    pop         ecx
 00743627    pop         ecx
 00743628    mov         dword ptr fs:[eax],edx
 0074362B    push        743651
 00743630    movzx       edx,word ptr [ebp-2]
 00743634    add         edx,dword ptr [ebp-1C]
 00743637    add         edx,6
 0074363A    mov         eax,822A3C;gvar_00822A3C:TFileRec
 0074363F    call        @Seek
 00743644    call        @_IOTest
 00743649    ret
>0074364A    jmp         @HandleFinally
>0074364F    jmp         00743630
 00743651    xor         eax,eax
 00743653    pop         edx
 00743654    pop         ecx
 00743655    pop         ecx
 00743656    mov         dword ptr fs:[eax],edx
 00743659    push        743676
 0074365E    lea         eax,[ebp-0C0]
 00743664    mov         edx,0D
 00743669    call        @UStrArrayClr
 0074366E    ret
>0074366F    jmp         @HandleFinally
>00743674    jmp         0074365E
 00743676    pop         edi
 00743677    pop         esi
 00743678    pop         ebx
 00743679    mov         esp,ebp
 0074367B    pop         ebp
 0074367C    ret
*}
end;

//007436FC
procedure sub_007436FC(?:UnicodeString);
begin
{*
 007436FC    push        ebp
 007436FD    mov         ebp,esp
 007436FF    add         esp,0FFFFFFB4
 00743702    push        ebx
 00743703    push        esi
 00743704    push        edi
 00743705    xor         edx,edx
 00743707    mov         dword ptr [ebp-48],edx
 0074370A    mov         dword ptr [ebp-4C],edx
 0074370D    mov         dword ptr [ebp-40],edx
 00743710    mov         dword ptr [ebp-44],edx
 00743713    mov         dword ptr [ebp-4],eax
 00743716    mov         eax,dword ptr [ebp-4]
 00743719    call        @UStrAddRef
 0074371E    xor         eax,eax
 00743720    push        ebp
 00743721    push        7438DD
 00743726    push        dword ptr fs:[eax]
 00743729    mov         dword ptr fs:[eax],esp
 0074372C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00743731    mov         eax,dword ptr [eax]
 00743733    mov         eax,dword ptr [eax+394]
 00743739    mov         eax,dword ptr [eax+2A4]
 0074373F    mov         edx,dword ptr [eax]
 00743741    call        dword ptr [edx+44]
 00743744    lea         edx,[ebp-44]
 00743747    mov         eax,dword ptr [ebp-4]
 0074374A    call        ExtractFileName
 0074374F    mov         ecx,dword ptr [ebp-44]
 00743752    lea         eax,[ebp-40]
 00743755    mov         edx,7438F8;'// '
 0074375A    call        @UStrCat3
 0074375F    mov         ecx,dword ptr [ebp-40]
 00743762    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00743767    mov         eax,dword ptr [eax]
 00743769    mov         eax,dword ptr [eax+394]
 0074376F    mov         eax,dword ptr [eax+2A4]
 00743775    xor         edx,edx
 00743777    mov         ebx,dword ptr [eax]
 00743779    call        dword ptr [ebx+60]
 0074377C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00743781    mov         eax,dword ptr [eax]
 00743783    mov         eax,dword ptr [eax+394]
 00743789    mov         eax,dword ptr [eax+2A4]
 0074378F    mov         ecx,74390C;'// Imported from Game Commander 1.0'
 00743794    mov         edx,1
 00743799    mov         ebx,dword ptr [eax]
 0074379B    call        dword ptr [ebx+60]
 0074379E    mov         edx,dword ptr [ebp-4]
 007437A1    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007437A6    call        @Assign
 007437AB    mov         edx,1
 007437B0    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007437B5    call        @ResetFile
 007437BA    call        @_IOTest
 007437BF    xor         edx,edx
 007437C1    push        ebp
 007437C2    push        743890
 007437C7    push        dword ptr fs:[edx]
 007437CA    mov         dword ptr fs:[edx],esp
 007437CD    push        0
 007437CF    lea         edx,[ebp-8]
 007437D2    mov         ecx,2
 007437D7    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007437DC    call        @BlockRead
 007437E1    call        @_IOTest
 007437E6    mov         edx,24
 007437EB    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007437F0    call        @Seek
 007437F5    call        @_IOTest
 007437FA    push        0
 007437FC    lea         edx,[ebp-3C]
 007437FF    mov         ecx,1A
 00743804    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743809    call        @BlockRead
 0074380E    call        @_IOTest
 00743813    push        743960;'// Module = "'
 00743818    lea         eax,[ebp-4C]
 0074381B    lea         edx,[ebp-3C]
 0074381E    mov         ecx,1A
 00743823    call        @UStrFromWArray
 00743828    push        dword ptr [ebp-4C]
 0074382B    push        743988;'"'
 00743830    lea         eax,[ebp-48]
 00743833    mov         edx,3
 00743838    call        @UStrCatN
 0074383D    mov         edx,dword ptr [ebp-48]
 00743840    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00743845    mov         eax,dword ptr [eax]
 00743847    mov         eax,dword ptr [eax+394]
 0074384D    mov         eax,dword ptr [eax+2A4]
 00743853    mov         ecx,dword ptr [eax]
 00743855    call        dword ptr [ecx+38]
 00743858    mov         edx,404
 0074385D    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743862    call        @Seek
 00743867    call        @_IOTest
>0074386C    jmp         00743873
 0074386E    call        007430B4
 00743873    mov         eax,822A3C;gvar_00822A3C:TFileRec
 00743878    call        @EofFile
 0074387D    call        @_IOTest
 00743882    test        al,al
>00743884    je          0074386E
 00743886    xor         eax,eax
 00743888    pop         edx
 00743889    pop         ecx
 0074388A    pop         ecx
 0074388B    mov         dword ptr fs:[eax],edx
>0074388E    jmp         007438AB
>00743890    jmp         @HandleOnException
 00743895    dd          1
 00743899    dd          00418C04;Exception
 0074389D    dd          007438A1
 007438A1    call        004FA644
 007438A6    call        @DoneExcept
 007438AB    mov         eax,822A3C;gvar_00822A3C:TFileRec
 007438B0    call        @Close
 007438B5    call        @_IOTest
 007438BA    xor         eax,eax
 007438BC    pop         edx
 007438BD    pop         ecx
 007438BE    pop         ecx
 007438BF    mov         dword ptr fs:[eax],edx
 007438C2    push        7438E4
 007438C7    lea         eax,[ebp-4C]
 007438CA    mov         edx,4
 007438CF    call        @UStrArrayClr
 007438D4    lea         eax,[ebp-4]
 007438D7    call        @UStrClr
 007438DC    ret
>007438DD    jmp         @HandleFinally
>007438E2    jmp         007438C7
 007438E4    pop         edi
 007438E5    pop         esi
 007438E6    pop         ebx
 007438E7    mov         esp,ebp
 007438E9    pop         ebp
 007438EA    ret
*}
end;

Initialization
Finalization
//0074398C
{*
 0074398C    push        ebp
 0074398D    mov         ebp,esp
 0074398F    xor         eax,eax
 00743991    push        ebp
 00743992    push        7439DB
 00743997    push        dword ptr fs:[eax]
 0074399A    mov         dword ptr fs:[eax],esp
 0074399D    inc         dword ptr ds:[822A38]
>007439A3    jne         007439CD
 007439A5    mov         eax,78C984
 007439AA    call        @UStrClr
 007439AF    mov         eax,822C8C;gvar_00822C8C:UnicodeString
 007439B4    call        @UStrClr
 007439B9    mov         eax,822C90;gvar_00822C90:UnicodeString
 007439BE    call        @UStrClr
 007439C3    mov         eax,822C94;gvar_00822C94:UnicodeString
 007439C8    call        @UStrClr
 007439CD    xor         eax,eax
 007439CF    pop         edx
 007439D0    pop         ecx
 007439D1    pop         ecx
 007439D2    mov         dword ptr fs:[eax],edx
 007439D5    push        7439E2
 007439DA    ret
>007439DB    jmp         @HandleFinally
>007439E0    jmp         007439DA
 007439E2    pop         ebp
 007439E3    ret
*}
end.