//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JclStrings;

interface

uses
  SysUtils, Classes;

type
  EJclStringError = class(EJclError)
  end;
    procedure sub_00538B58;//00538B58
    procedure sub_00538B98;//00538B98
    //procedure sub_00538C20(?:?; ?:?);//00538C20
    //procedure sub_00538C70(?:UString; ?:?; ?:?);//00538C70
    //procedure sub_00538D0C(?:UString; ?:?; ?:?);//00538D0C
    //procedure sub_00538D98(?:UString; ?:?; ?:?);//00538D98
    //procedure sub_00538E34(?:?; ?:UString; ?:TComponentName; ?:?);//00538E34
    //procedure sub_00539110(?:?; ?:?);//00539110
    procedure sub_0053912C;//0053912C
    procedure sub_00539138(?:UnicodeString);//00539138
    //function sub_00539170(?:UString; ?:string; ?:?):?;//00539170
    //function sub_005391FC(?:?; ?:?):?;//005391FC
    //procedure sub_00539298(?:?; ?:?; ?:?);//00539298
    //procedure sub_005392D8(?:?; ?:?; ?:?);//005392D8
    //function sub_00539304(?:?):Boolean;//00539304
    //function sub_00539314(?:?):Boolean;//00539314
    //function sub_0053933C(?:?):Boolean;//0053933C
    //function sub_0053934C(?:?):Boolean;//0053934C
    //function sub_0053935C(?:?):?;//0053935C
    //procedure sub_005393EC(?:?; ?:UString; ?:TStringList; ?:?);//005393EC

implementation

//00538B58
procedure sub_00538B58;
begin
{*
 00538B58    push        ebx
 00538B59    push        esi
 00538B5A    push        edi
 00538B5B    push        ecx
 00538B5C    mov         esi,esp
 00538B5E    lea         edi,[esp+2]
 00538B62    mov         word ptr [esi],0
 00538B67    mov         ebx,7F54A8;gvar_007F54A8
 00538B6C    mov         word ptr [edi],0
 00538B71    push        edi
 00538B72    push        1
 00538B74    push        esi
 00538B75    push        1
 00538B77    push        400
 00538B7C    call        kernel32.GetStringTypeExW
 00538B81    movzx       eax,word ptr [edi]
 00538B84    mov         word ptr [ebx],ax
 00538B87    inc         word ptr [esi]
 00538B8A    add         ebx,2
 00538B8D    cmp         word ptr [esi],0
>00538B91    jne         00538B6C
 00538B93    pop         edx
 00538B94    pop         edi
 00538B95    pop         esi
 00538B96    pop         ebx
 00538B97    ret
*}
end;

//00538B98
procedure sub_00538B98;
begin
{*
 00538B98    push        ebx
 00538B99    push        esi
 00538B9A    push        ecx
 00538B9B    cmp         byte ptr ds:[788BBC],0;gvar_00788BBC
>00538BA2    jne         00538C1B
 00538BA4    xor         esi,esi
 00538BA6    mov         ebx,7954A8;gvar_007954A8
 00538BAB    mov         word ptr [esp+2],si
 00538BB0    mov         word ptr [esp],si
 00538BB4    push        1
 00538BB6    lea         eax,[esp+6]
 00538BBA    push        eax
 00538BBB    call        user32.CharLowerBuffW
 00538BC0    push        1
 00538BC2    lea         eax,[esp+4]
 00538BC6    push        eax
 00538BC7    call        user32.CharUpperBuffW
 00538BCC    mov         eax,esi
 00538BCE    call        0053934C
 00538BD3    test        al,al
>00538BD5    je          00538BDE
 00538BD7    movzx       eax,word ptr [esp+2]
>00538BDC    jmp         00538BF1
 00538BDE    mov         eax,esi
 00538BE0    call        0053933C
 00538BE5    test        al,al
>00538BE7    je          00538BEF
 00538BE9    movzx       eax,word ptr [esp]
>00538BED    jmp         00538BF1
 00538BEF    mov         eax,esi
 00538BF1    movzx       edx,word ptr [esp+2]
 00538BF6    mov         word ptr [ebx],dx
 00538BF9    movzx       edx,word ptr [esp]
 00538BFD    mov         word ptr [ebx+20000],dx
 00538C04    mov         word ptr [ebx+40000],ax
 00538C0B    inc         esi
 00538C0C    add         ebx,2
 00538C0F    test        si,si
>00538C12    jne         00538BAB
 00538C14    mov         byte ptr ds:[788BBC],1;gvar_00788BBC
 00538C1B    pop         edx
 00538C1C    pop         esi
 00538C1D    pop         ebx
 00538C1E    ret
*}
end;

//00538C20
{*procedure sub_00538C20(?:?; ?:?);
begin
 00538C20    push        ebx
 00538C21    push        esi
 00538C22    push        edi
 00538C23    push        ecx
 00538C24    mov         esi,edx
 00538C26    mov         edi,eax
 00538C28    mov         eax,dword ptr [edi]
 00538C2A    mov         dword ptr [esp],eax
 00538C2D    mov         eax,dword ptr [esp]
 00538C30    test        eax,eax
>00538C32    je          00538C39
 00538C34    sub         eax,4
 00538C37    mov         eax,dword ptr [eax]
 00538C39    mov         ebx,eax
 00538C3B    test        ebx,ebx
>00538C3D    jle         00538C69
 00538C3F    mov         eax,edi
 00538C41    call        UniqueString
 00538C46    mov         eax,dword ptr [edi]
 00538C48    call        @UStrToPWChar
 00538C4D    mov         edx,ebx
 00538C4F    test        edx,edx
>00538C51    jle         00538C69
 00538C53    movzx       ecx,word ptr [eax]
 00538C56    add         ecx,esi
 00538C58    movzx       ecx,word ptr [ecx*2+7954A8];gvar_007954A8
 00538C60    mov         word ptr [eax],cx
 00538C63    add         eax,2
 00538C66    dec         edx
>00538C67    jne         00538C53
 00538C69    pop         edx
 00538C6A    pop         edi
 00538C6B    pop         esi
 00538C6C    pop         ebx
 00538C6D    ret
end;*}

//00538C70
{*procedure sub_00538C70(?:UString; ?:?; ?:?);
begin
 00538C70    push        ebp
 00538C71    mov         ebp,esp
 00538C73    add         esp,0FFFFFFF4
 00538C76    push        ebx
 00538C77    push        esi
 00538C78    push        edi
 00538C79    xor         ebx,ebx
 00538C7B    mov         dword ptr [ebp-0C],ebx
 00538C7E    mov         dword ptr [ebp-8],ecx
 00538C81    mov         ebx,edx
 00538C83    mov         dword ptr [ebp-4],eax
 00538C86    xor         eax,eax
 00538C88    push        ebp
 00538C89    push        538CFE
 00538C8E    push        dword ptr fs:[eax]
 00538C91    mov         dword ptr fs:[eax],esp
 00538C94    mov         eax,dword ptr [ebp-4]
 00538C97    test        eax,eax
>00538C99    je          00538CA0
 00538C9B    sub         eax,4
 00538C9E    mov         eax,dword ptr [eax]
 00538CA0    mov         esi,eax
 00538CA2    lea         eax,[ebp-0C]
 00538CA5    push        eax
 00538CA6    mov         ecx,esi
 00538CA8    mov         edx,1
 00538CAD    mov         eax,ebx
 00538CAF    call        @UStrCopy
 00538CB4    mov         eax,dword ptr [ebp-0C]
 00538CB7    mov         edx,dword ptr [ebp-4]
 00538CBA    call        @UStrEqual
>00538CBF    jne         00538CDE
 00538CC1    mov         edi,ebx
 00538CC3    test        edi,edi
>00538CC5    je          00538CCC
 00538CC7    sub         edi,4
 00538CCA    mov         edi,dword ptr [edi]
 00538CCC    mov         eax,dword ptr [ebp-8]
 00538CCF    push        eax
 00538CD0    lea         edx,[esi+1]
 00538CD3    mov         ecx,edi
 00538CD5    mov         eax,ebx
 00538CD7    call        @UStrCopy
>00538CDC    jmp         00538CE8
 00538CDE    mov         eax,dword ptr [ebp-8]
 00538CE1    mov         edx,ebx
 00538CE3    call        @UStrAsg
 00538CE8    xor         eax,eax
 00538CEA    pop         edx
 00538CEB    pop         ecx
 00538CEC    pop         ecx
 00538CED    mov         dword ptr fs:[eax],edx
 00538CF0    push        538D05
 00538CF5    lea         eax,[ebp-0C]
 00538CF8    call        @UStrClr
 00538CFD    ret
>00538CFE    jmp         @HandleFinally
>00538D03    jmp         00538CF5
 00538D05    pop         edi
 00538D06    pop         esi
 00538D07    pop         ebx
 00538D08    mov         esp,ebp
 00538D0A    pop         ebp
 00538D0B    ret
end;*}

//00538D0C
{*procedure sub_00538D0C(?:UString; ?:?; ?:?);
begin
 00538D0C    push        ebp
 00538D0D    mov         ebp,esp
 00538D0F    add         esp,0FFFFFFF8
 00538D12    push        ebx
 00538D13    push        esi
 00538D14    push        edi
 00538D15    xor         ebx,ebx
 00538D17    mov         dword ptr [ebp-8],ebx
 00538D1A    mov         dword ptr [ebp-4],ecx
 00538D1D    mov         esi,edx
 00538D1F    mov         ebx,eax
 00538D21    xor         eax,eax
 00538D23    push        ebp
 00538D24    push        538D88
 00538D29    push        dword ptr fs:[eax]
 00538D2C    mov         dword ptr fs:[eax],esp
 00538D2F    mov         eax,ebx
 00538D31    test        eax,eax
>00538D33    je          00538D3A
 00538D35    sub         eax,4
 00538D38    mov         eax,dword ptr [eax]
 00538D3A    mov         edi,eax
 00538D3C    lea         eax,[ebp-8]
 00538D3F    push        eax
 00538D40    mov         ecx,edi
 00538D42    mov         edx,1
 00538D47    mov         eax,esi
 00538D49    call        @UStrCopy
 00538D4E    mov         eax,dword ptr [ebp-8]
 00538D51    mov         edx,ebx
 00538D53    call        @UStrEqual
>00538D58    jne         00538D66
 00538D5A    mov         eax,dword ptr [ebp-4]
 00538D5D    mov         edx,esi
 00538D5F    call        @UStrAsg
>00538D64    jmp         00538D72
 00538D66    mov         eax,dword ptr [ebp-4]
 00538D69    mov         ecx,esi
 00538D6B    mov         edx,ebx
 00538D6D    call        @UStrCat3
 00538D72    xor         eax,eax
 00538D74    pop         edx
 00538D75    pop         ecx
 00538D76    pop         ecx
 00538D77    mov         dword ptr fs:[eax],edx
 00538D7A    push        538D8F
 00538D7F    lea         eax,[ebp-8]
 00538D82    call        @UStrClr
 00538D87    ret
>00538D88    jmp         @HandleFinally
>00538D8D    jmp         00538D7F
 00538D8F    pop         edi
 00538D90    pop         esi
 00538D91    pop         ebx
 00538D92    pop         ecx
 00538D93    pop         ecx
 00538D94    pop         ebp
 00538D95    ret
end;*}

//00538D98
{*procedure sub_00538D98(?:UString; ?:?; ?:?);
begin
 00538D98    push        ebp
 00538D99    mov         ebp,esp
 00538D9B    add         esp,0FFFFFFF4
 00538D9E    push        ebx
 00538D9F    push        esi
 00538DA0    push        edi
 00538DA1    xor         ebx,ebx
 00538DA3    mov         dword ptr [ebp-0C],ebx
 00538DA6    mov         dword ptr [ebp-8],ecx
 00538DA9    mov         esi,edx
 00538DAB    mov         dword ptr [ebp-4],eax
 00538DAE    xor         eax,eax
 00538DB0    push        ebp
 00538DB1    push        538E23
 00538DB6    push        dword ptr fs:[eax]
 00538DB9    mov         dword ptr fs:[eax],esp
 00538DBC    mov         eax,dword ptr [ebp-4]
 00538DBF    test        eax,eax
>00538DC1    je          00538DC8
 00538DC3    sub         eax,4
 00538DC6    mov         eax,dword ptr [eax]
 00538DC8    mov         edi,eax
 00538DCA    mov         ebx,esi
 00538DCC    test        ebx,ebx
>00538DCE    je          00538DD5
 00538DD0    sub         ebx,4
 00538DD3    mov         ebx,dword ptr [ebx]
 00538DD5    lea         eax,[ebp-0C]
 00538DD8    push        eax
 00538DD9    mov         edx,ebx
 00538DDB    sub         edx,edi
 00538DDD    inc         edx
 00538DDE    mov         ecx,edi
 00538DE0    mov         eax,esi
 00538DE2    call        @UStrCopy
 00538DE7    mov         eax,dword ptr [ebp-0C]
 00538DEA    mov         edx,dword ptr [ebp-4]
 00538DED    call        @UStrEqual
>00538DF2    jne         00538E00
 00538DF4    mov         eax,dword ptr [ebp-8]
 00538DF7    mov         edx,esi
 00538DF9    call        @UStrAsg
>00538DFE    jmp         00538E0D
 00538E00    mov         eax,dword ptr [ebp-8]
 00538E03    mov         ecx,dword ptr [ebp-4]
 00538E06    mov         edx,esi
 00538E08    call        @UStrCat3
 00538E0D    xor         eax,eax
 00538E0F    pop         edx
 00538E10    pop         ecx
 00538E11    pop         ecx
 00538E12    mov         dword ptr fs:[eax],edx
 00538E15    push        538E2A
 00538E1A    lea         eax,[ebp-0C]
 00538E1D    call        @UStrClr
 00538E22    ret
>00538E23    jmp         @HandleFinally
>00538E28    jmp         00538E1A
 00538E2A    pop         edi
 00538E2B    pop         esi
 00538E2C    pop         ebx
 00538E2D    mov         esp,ebp
 00538E2F    pop         ebp
 00538E30    ret
end;*}

//00538E34
{*procedure sub_00538E34(?:?; ?:UString; ?:TComponentName; ?:?);
begin
 00538E34    push        ebp
 00538E35    mov         ebp,esp
 00538E37    add         esp,0FFFFFFD0
 00538E3A    push        ebx
 00538E3B    push        esi
 00538E3C    push        edi
 00538E3D    xor         ebx,ebx
 00538E3F    mov         dword ptr [ebp-4],ebx
 00538E42    mov         dword ptr [ebp-8],ebx
 00538E45    mov         dword ptr [ebp-10],ecx
 00538E48    mov         ebx,edx
 00538E4A    mov         dword ptr [ebp-0C],eax
 00538E4D    xor         eax,eax
 00538E4F    push        ebp
 00538E50    push        5390A2
 00538E55    push        dword ptr fs:[eax]
 00538E58    mov         dword ptr fs:[eax],esp
 00538E5B    test        ebx,ebx
>00538E5D    jne         00538E8E
 00538E5F    mov         eax,dword ptr [ebp-0C]
 00538E62    cmp         dword ptr [eax],0
>00538E65    jne         00538E77
 00538E67    mov         eax,dword ptr [ebp-0C]
 00538E6A    mov         edx,dword ptr [ebp-10]
 00538E6D    call        @UStrAsg
>00538E72    jmp         00539087
 00538E77    mov         ecx,dword ptr ds:[78DB40];^SResString465:TResStringRec
 00538E7D    mov         dl,1
 00538E7F    mov         eax,[005388F0];EJclStringError
 00538E84    call        Exception.CreateRes;EJclStringError.Create
 00538E89    call        @RaiseExcept
 00538E8E    mov         eax,dword ptr [ebp-0C]
 00538E91    cmp         dword ptr [eax],0
>00538E94    je          00539087
 00538E9A    test        byte ptr [ebp+8],2
 00538E9E    setne       al
 00538EA1    mov         byte ptr [ebp-2B],al
 00538EA4    cmp         byte ptr [ebp-2B],0
>00538EA8    je          00538EB6
 00538EAA    lea         edx,[ebp-4]
 00538EAD    mov         eax,ebx
 00538EAF    call        00539110
>00538EB4    jmp         00538EC0
 00538EB6    lea         eax,[ebp-4]
 00538EB9    mov         edx,ebx
 00538EBB    call        @UStrLAsg
 00538EC0    mov         eax,ebx
 00538EC2    test        eax,eax
>00538EC4    je          00538ECB
 00538EC6    sub         eax,4
 00538EC9    mov         eax,dword ptr [eax]
 00538ECB    mov         dword ptr [ebp-1C],eax
 00538ECE    mov         eax,dword ptr [ebp-10]
 00538ED1    test        eax,eax
>00538ED3    je          00538EDA
 00538ED5    sub         eax,4
 00538ED8    mov         eax,dword ptr [eax]
 00538EDA    mov         dword ptr [ebp-20],eax
 00538EDD    mov         eax,dword ptr [ebp-0C]
 00538EE0    mov         eax,dword ptr [eax]
 00538EE2    mov         dword ptr [ebp-30],eax
 00538EE5    mov         eax,dword ptr [ebp-30]
 00538EE8    test        eax,eax
>00538EEA    je          00538EF1
 00538EEC    sub         eax,4
 00538EEF    mov         eax,dword ptr [eax]
 00538EF1    mov         dword ptr [ebp-28],eax
 00538EF4    mov         eax,dword ptr [ebp-28]
 00538EF7    mov         dword ptr [ebp-24],eax
 00538EFA    lea         eax,[ebp-8]
 00538EFD    mov         edx,dword ptr [ebp-24]
 00538F00    call        @UStrSetLength
 00538F05    mov         eax,dword ptr [ebp-8]
 00538F08    call        @UStrToPWChar
 00538F0D    mov         esi,eax
 00538F0F    mov         eax,dword ptr [ebp-0C]
 00538F12    mov         eax,dword ptr [eax]
 00538F14    call        @UStrToPWChar
 00538F19    mov         ebx,eax
 00538F1B    mov         eax,dword ptr [ebp-4]
 00538F1E    movzx       eax,word ptr [eax]
 00538F21    mov         word ptr [ebp-2A],ax
 00538F25    cmp         byte ptr [ebp-2B],0
>00538F29    je          00538F5B
>00538F2B    jmp         00538F39
 00538F2D    movzx       eax,word ptr [ebx]
 00538F30    mov         word ptr [esi],ax
 00538F33    add         esi,2
 00538F36    add         ebx,2
 00538F39    movzx       eax,word ptr [ebx]
 00538F3C    call        0053935C
 00538F41    cmp         ax,word ptr [ebp-2A]
>00538F45    je          00538F6A
 00538F47    cmp         word ptr [ebx],0
>00538F4B    jne         00538F2D
>00538F4D    jmp         00538F6A
 00538F4F    movzx       eax,word ptr [ebx]
 00538F52    mov         word ptr [esi],ax
 00538F55    add         esi,2
 00538F58    add         ebx,2
 00538F5B    movzx       eax,word ptr [ebx]
 00538F5E    cmp         ax,word ptr [ebp-2A]
>00538F62    je          00538F6A
 00538F64    cmp         word ptr [ebx],0
>00538F68    jne         00538F4F
 00538F6A    cmp         word ptr [ebx],0
>00538F6E    je          00539071
 00538F74    lea         eax,[ebx+2]
 00538F77    mov         dword ptr [ebp-14],eax
 00538F7A    mov         eax,dword ptr [ebp-4]
 00538F7D    call        @UStrToPWChar
 00538F82    mov         edi,eax
 00538F84    add         edi,2
 00538F87    cmp         byte ptr [ebp-2B],0
>00538F8B    je          00538FB5
>00538F8D    jmp         00538F96
 00538F8F    add         dword ptr [ebp-14],2
 00538F93    add         edi,2
 00538F96    mov         eax,dword ptr [ebp-14]
 00538F99    movzx       eax,word ptr [eax]
 00538F9C    call        0053935C
 00538FA1    cmp         ax,word ptr [edi]
>00538FA4    jne         00538FC6
 00538FA6    cmp         word ptr [edi],0
>00538FAA    jne         00538F8F
>00538FAC    jmp         00538FC6
 00538FAE    add         dword ptr [ebp-14],2
 00538FB2    add         edi,2
 00538FB5    movzx       eax,word ptr [edi]
 00538FB8    mov         edx,dword ptr [ebp-14]
 00538FBB    cmp         ax,word ptr [edx]
>00538FBE    jne         00538FC6
 00538FC0    cmp         word ptr [edi],0
>00538FC4    jne         00538FAE
 00538FC6    cmp         word ptr [edi],0
>00538FCA    jne         00539060
 00538FD0    mov         eax,dword ptr [ebp-20]
 00538FD3    sub         eax,dword ptr [ebp-1C]
 00538FD6    add         dword ptr [ebp-28],eax
 00538FD9    cmp         dword ptr [ebp-20],0
>00538FDD    jle         00539032
 00538FDF    mov         eax,dword ptr [ebp-28]
 00538FE2    cmp         eax,dword ptr [ebp-24]
>00538FE5    jle         0053901E
 00538FE7    mov         eax,dword ptr [ebp-28]
 00538FEA    add         eax,eax
 00538FEC    mov         dword ptr [ebp-24],eax
 00538FEF    mov         eax,dword ptr [ebp-8]
 00538FF2    call        @UStrToPWChar
 00538FF7    sub         esi,eax
 00538FF9    sar         esi,1
>00538FFB    jns         00539000
 00538FFD    adc         esi,0
 00539000    inc         esi
 00539001    mov         dword ptr [ebp-18],esi
 00539004    lea         eax,[ebp-8]
 00539007    mov         edx,dword ptr [ebp-24]
 0053900A    call        @UStrSetLength
 0053900F    lea         eax,[ebp-8]
 00539012    call        @UniqueStringU
 00539017    mov         edx,dword ptr [ebp-18]
 0053901A    lea         esi,[eax+edx*2-2]
 0053901E    mov         eax,dword ptr [ebp-10]
 00539021    call        @UStrToPWChar
 00539026    mov         ecx,dword ptr [ebp-20]
 00539029    add         ecx,ecx
 0053902B    mov         edx,esi
 0053902D    call        Move
 00539032    mov         eax,dword ptr [ebp-1C]
 00539035    add         eax,eax
 00539037    add         ebx,eax
 00539039    mov         eax,dword ptr [ebp-20]
 0053903C    add         eax,eax
 0053903E    add         esi,eax
 00539040    test        byte ptr [ebp+8],1
>00539044    jne         00538F25
>0053904A    jmp         00539058
 0053904C    movzx       eax,word ptr [ebx]
 0053904F    mov         word ptr [esi],ax
 00539052    add         esi,2
 00539055    add         ebx,2
 00539058    cmp         word ptr [ebx],0
>0053905C    jne         0053904C
>0053905E    jmp         00539071
 00539060    movzx       eax,word ptr [ebx]
 00539063    mov         word ptr [esi],ax
 00539066    add         esi,2
 00539069    add         ebx,2
>0053906C    jmp         00538F25
 00539071    lea         eax,[ebp-8]
 00539074    mov         edx,dword ptr [ebp-28]
 00539077    call        @UStrSetLength
 0053907C    mov         eax,dword ptr [ebp-0C]
 0053907F    mov         edx,dword ptr [ebp-8]
 00539082    call        @UStrAsg
 00539087    xor         eax,eax
 00539089    pop         edx
 0053908A    pop         ecx
 0053908B    pop         ecx
 0053908C    mov         dword ptr fs:[eax],edx
 0053908F    push        5390A9
 00539094    lea         eax,[ebp-8]
 00539097    mov         edx,2
 0053909C    call        @UStrArrayClr
 005390A1    ret
>005390A2    jmp         @HandleFinally
>005390A7    jmp         00539094
 005390A9    pop         edi
 005390AA    pop         esi
 005390AB    pop         ebx
 005390AC    mov         esp,ebp
 005390AE    pop         ebp
 005390AF    ret         4
end;*}

//00539110
{*procedure sub_00539110(?:?; ?:?);
begin
 00539110    push        ebx
 00539111    push        esi
 00539112    mov         ebx,edx
 00539114    mov         esi,eax
 00539116    mov         eax,ebx
 00539118    mov         edx,esi
 0053911A    call        @UStrAsg
 0053911F    mov         eax,ebx
 00539121    call        0053912C
 00539126    pop         esi
 00539127    pop         ebx
 00539128    ret
end;*}

//0053912C
procedure sub_0053912C;
begin
{*
 0053912C    mov         edx,10000
 00539131    call        00538C20
 00539136    ret
*}
end;

//00539138
procedure sub_00539138(?:UnicodeString);
begin
{*
 00539138    push        ebx
 00539139    push        ecx
 0053913A    mov         edx,dword ptr [eax]
 0053913C    mov         dword ptr [esp],edx
 0053913F    mov         edx,dword ptr [esp]
 00539142    test        edx,edx
>00539144    je          0053914B
 00539146    sub         edx,4
 00539149    mov         edx,dword ptr [edx]
 0053914B    mov         ecx,edx
 0053914D    dec         ecx
 0053914E    test        ecx,ecx
>00539150    jl          0053916A
 00539152    inc         ecx
 00539153    xor         edx,edx
 00539155    mov         ebx,dword ptr [eax]
 00539157    cmp         word ptr [ebx+edx*2],0
>0053915C    jne         00539166
 0053915E    call        @UStrSetLength
 00539163    pop         edx
 00539164    pop         ebx
 00539165    ret
 00539166    inc         edx
 00539167    dec         ecx
>00539168    jne         00539155
 0053916A    pop         edx
 0053916B    pop         ebx
 0053916C    ret
*}
end;

//00539170
{*function sub_00539170(?:UString; ?:string; ?:?):?;
begin
 00539170    push        ebp
 00539171    mov         ebp,esp
 00539173    add         esp,0FFFFFFF8
 00539176    push        ebx
 00539177    push        esi
 00539178    push        edi
 00539179    xor         ebx,ebx
 0053917B    mov         dword ptr [ebp-8],ebx
 0053917E    mov         dword ptr [ebp-4],ecx
 00539181    mov         esi,edx
 00539183    mov         edi,eax
 00539185    xor         eax,eax
 00539187    push        ebp
 00539188    push        5391EC
 0053918D    push        dword ptr fs:[eax]
 00539190    mov         dword ptr fs:[eax],esp
 00539193    test        edi,edi
>00539195    je          005391D4
 00539197    test        esi,esi
>00539199    je          005391D4
 0053919B    mov         ebx,esi
 0053919D    test        ebx,ebx
>0053919F    je          005391A6
 005391A1    sub         ebx,4
 005391A4    mov         ebx,dword ptr [ebx]
 005391A6    lea         eax,[ebp-8]
 005391A9    push        eax
 005391AA    mov         ecx,ebx
 005391AC    sub         ecx,dword ptr [ebp-4]
 005391AF    inc         ecx
 005391B0    mov         edx,dword ptr [ebp-4]
 005391B3    mov         eax,esi
 005391B5    call        @UStrCopy
 005391BA    mov         edx,dword ptr [ebp-8]
 005391BD    mov         eax,edi
 005391BF    call        005391FC
 005391C4    test        eax,eax
>005391C6    jne         005391CC
 005391C8    xor         ebx,ebx
>005391CA    jmp         005391D6
 005391CC    mov         ebx,dword ptr [ebp-4]
 005391CF    add         ebx,eax
 005391D1    dec         ebx
>005391D2    jmp         005391D6
 005391D4    xor         ebx,ebx
 005391D6    xor         eax,eax
 005391D8    pop         edx
 005391D9    pop         ecx
 005391DA    pop         ecx
 005391DB    mov         dword ptr fs:[eax],edx
 005391DE    push        5391F3
 005391E3    lea         eax,[ebp-8]
 005391E6    call        @UStrClr
 005391EB    ret
>005391EC    jmp         @HandleFinally
>005391F1    jmp         005391E3
 005391F3    mov         eax,ebx
 005391F5    pop         edi
 005391F6    pop         esi
 005391F7    pop         ebx
 005391F8    pop         ecx
 005391F9    pop         ecx
 005391FA    pop         ebp
 005391FB    ret
end;*}

//005391FC
{*function sub_005391FC(?:?; ?:?):?;
begin
 005391FC    push        ebp
 005391FD    mov         ebp,esp
 005391FF    push        0
 00539201    push        0
 00539203    push        ebx
 00539204    push        esi
 00539205    mov         esi,edx
 00539207    mov         ebx,eax
 00539209    xor         eax,eax
 0053920B    push        ebp
 0053920C    push        539255
 00539211    push        dword ptr fs:[eax]
 00539214    mov         dword ptr fs:[eax],esp
 00539217    lea         edx,[ebp-4]
 0053921A    mov         eax,esi
 0053921C    call        00539110
 00539221    mov         eax,dword ptr [ebp-4]
 00539224    push        eax
 00539225    lea         edx,[ebp-8]
 00539228    mov         eax,ebx
 0053922A    call        00539110
 0053922F    mov         eax,dword ptr [ebp-8]
 00539232    pop         edx
 00539233    call        Pos
 00539238    mov         ebx,eax
 0053923A    xor         eax,eax
 0053923C    pop         edx
 0053923D    pop         ecx
 0053923E    pop         ecx
 0053923F    mov         dword ptr fs:[eax],edx
 00539242    push        53925C
 00539247    lea         eax,[ebp-8]
 0053924A    mov         edx,2
 0053924F    call        @UStrArrayClr
 00539254    ret
>00539255    jmp         @HandleFinally
>0053925A    jmp         00539247
 0053925C    mov         eax,ebx
 0053925E    pop         esi
 0053925F    pop         ebx
 00539260    pop         ecx
 00539261    pop         ecx
 00539262    pop         ebp
 00539263    ret
end;*}

//00539298
{*procedure sub_00539298(?:?; ?:?; ?:?);
begin
 00539298    push        ebx
 00539299    push        esi
 0053929A    push        edi
 0053929B    mov         edi,ecx
 0053929D    mov         esi,edx
 0053929F    mov         ebx,eax
 005392A1    push        edi
 005392A2    mov         ecx,esi
 005392A4    mov         edx,1
 005392A9    mov         eax,ebx
 005392AB    call        @UStrCopy
 005392B0    pop         edi
 005392B1    pop         esi
 005392B2    pop         ebx
 005392B3    ret
end;*}

//005392D8
{*procedure sub_005392D8(?:?; ?:?; ?:?);
begin
 005392D8    push        ebx
 005392D9    push        esi
 005392DA    push        edi
 005392DB    push        ebp
 005392DC    mov         ebp,ecx
 005392DE    mov         edi,edx
 005392E0    mov         esi,eax
 005392E2    mov         ebx,esi
 005392E4    test        ebx,ebx
>005392E6    je          005392ED
 005392E8    sub         ebx,4
 005392EB    mov         ebx,dword ptr [ebx]
 005392ED    push        ebp
 005392EE    mov         ecx,ebx
 005392F0    sub         ecx,edi
 005392F2    inc         ecx
 005392F3    mov         edx,edi
 005392F5    mov         eax,esi
 005392F7    call        @UStrCopy
 005392FC    pop         ebp
 005392FD    pop         edi
 005392FE    pop         esi
 005392FF    pop         ebx
 00539300    ret
end;*}

//00539304
{*function sub_00539304(?:?):Boolean;
begin
 00539304    movzx       eax,ax
 00539307    test        byte ptr [eax*2+7F54A8],4;gvar_007F54A8
 0053930F    setne       al
 00539312    ret
end;*}

//00539314
{*function sub_00539314(?:?):Boolean;
begin
 00539314    mov         edx,eax
 00539316    add         edx,0FFFFFFBF
 00539319    sub         dx,6
>0053931D    jb          00539328
 0053931F    add         edx,0FFFFFFE6
 00539322    sub         dx,6
>00539326    jae         0053932B
 00539328    mov         al,1
 0053932A    ret
 0053932B    movzx       eax,ax
 0053932E    test        byte ptr [eax*2+7F54A8],4;gvar_007F54A8
 00539336    setne       al
 00539339    ret
end;*}

//0053933C
{*function sub_0053933C(?:?):Boolean;
begin
 0053933C    movzx       eax,ax
 0053933F    test        byte ptr [eax*2+7F54A8],2;gvar_007F54A8
 00539347    setne       al
 0053934A    ret
end;*}

//0053934C
{*function sub_0053934C(?:?):Boolean;
begin
 0053934C    movzx       eax,ax
 0053934F    test        byte ptr [eax*2+7F54A8],1;gvar_007F54A8
 00539357    setne       al
 0053935A    ret
end;*}

//0053935C
{*function sub_0053935C(?:?):?;
begin
 0053935C    movzx       eax,ax
 0053935F    movzx       eax,word ptr [eax*2+7B54A8];gvar_007B54A8
 00539367    ret
end;*}

//005393EC
{*procedure sub_005393EC(?:?; ?:UString; ?:TStringList; ?:?);
begin
 005393EC    push        ebp
 005393ED    mov         ebp,esp
 005393EF    add         esp,0FFFFFFF0
 005393F2    push        ebx
 005393F3    push        esi
 005393F4    push        edi
 005393F5    xor         ebx,ebx
 005393F7    mov         dword ptr [ebp-0C],ebx
 005393FA    mov         dword ptr [ebp-10],ecx
 005393FD    mov         dword ptr [ebp-8],edx
 00539400    mov         dword ptr [ebp-4],eax
 00539403    mov         ebx,dword ptr [ebp+8]
 00539406    mov         eax,dword ptr [ebp-4]
 00539409    call        @UStrAddRef
 0053940E    mov         eax,dword ptr [ebp-8]
 00539411    call        @UStrAddRef
 00539416    xor         eax,eax
 00539418    push        ebp
 00539419    push        5394F0
 0053941E    push        dword ptr fs:[eax]
 00539421    mov         dword ptr fs:[eax],esp
 00539424    mov         eax,dword ptr [ebp-10]
 00539427    call        TStrings.BeginUpdate
 0053942C    xor         edx,edx
 0053942E    push        ebp
 0053942F    push        5394CE
 00539434    push        dword ptr fs:[edx]
 00539437    mov         dword ptr fs:[edx],esp
 0053943A    mov         eax,dword ptr [ebp-10]
 0053943D    mov         edx,dword ptr [eax]
 0053943F    call        dword ptr [edx+44]
 00539442    mov         eax,dword ptr [ebp-8]
 00539445    test        eax,eax
>00539447    je          0053944E
 00539449    sub         eax,4
 0053944C    mov         eax,dword ptr [eax]
 0053944E    mov         esi,eax
 00539450    mov         edx,dword ptr [ebp-4]
 00539453    mov         eax,dword ptr [ebp-8]
 00539456    call        Pos
 0053945B    mov         edi,eax
 0053945D    test        edi,edi
>0053945F    jle         005394A7
 00539461    lea         ecx,[ebp-0C]
 00539464    mov         edx,edi
 00539466    dec         edx
 00539467    mov         eax,dword ptr [ebp-4]
 0053946A    call        00539298
 0053946F    cmp         dword ptr [ebp-0C],0
 00539473    setne       al
 00539476    or          al,bl
>00539478    je          00539485
 0053947A    mov         edx,dword ptr [ebp-0C]
 0053947D    mov         eax,dword ptr [ebp-10]
 00539480    mov         ecx,dword ptr [eax]
 00539482    call        dword ptr [ecx+38]
 00539485    lea         ecx,[esi+edi]
 00539488    dec         ecx
 00539489    lea         eax,[ebp-4]
 0053948C    mov         edx,1
 00539491    call        @UStrDelete
 00539496    mov         edx,dword ptr [ebp-4]
 00539499    mov         eax,dword ptr [ebp-8]
 0053949C    call        Pos
 005394A1    mov         edi,eax
 005394A3    test        edi,edi
>005394A5    jg          00539461
 005394A7    cmp         dword ptr [ebp-4],0
>005394AB    je          005394B8
 005394AD    mov         edx,dword ptr [ebp-4]
 005394B0    mov         eax,dword ptr [ebp-10]
 005394B3    mov         ecx,dword ptr [eax]
 005394B5    call        dword ptr [ecx+38]
 005394B8    xor         eax,eax
 005394BA    pop         edx
 005394BB    pop         ecx
 005394BC    pop         ecx
 005394BD    mov         dword ptr fs:[eax],edx
 005394C0    push        5394D5
 005394C5    mov         eax,dword ptr [ebp-10]
 005394C8    call        TStrings.EndUpdate
 005394CD    ret
>005394CE    jmp         @HandleFinally
>005394D3    jmp         005394C5
 005394D5    xor         eax,eax
 005394D7    pop         edx
 005394D8    pop         ecx
 005394D9    pop         ecx
 005394DA    mov         dword ptr fs:[eax],edx
 005394DD    push        5394F7
 005394E2    lea         eax,[ebp-0C]
 005394E5    mov         edx,3
 005394EA    call        @UStrArrayClr
 005394EF    ret
>005394F0    jmp         @HandleFinally
>005394F5    jmp         005394E2
 005394F7    pop         edi
 005394F8    pop         esi
 005394F9    pop         ebx
 005394FA    mov         esp,ebp
 005394FC    pop         ebp
 005394FD    ret         4
end;*}

Initialization
//007810A4
{*
 007810A4    sub         dword ptr ds:[8154A8],1
>007810AB    jae         007810C6
 007810AD    call        00538B58
 007810B2    call        00538B98
 007810B7    mov         edx,788BC0;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 007810BC    mov         eax,[00790C38];gvar_00790C38
 007810C1    call        0053F424
 007810C6    ret
*}
Finalization
//00539530
{*
 00539530    push        ebp
 00539531    mov         ebp,esp
 00539533    xor         eax,eax
 00539535    push        ebp
 00539536    push        539586
 0053953B    push        dword ptr fs:[eax]
 0053953E    mov         dword ptr fs:[eax],esp
 00539541    inc         dword ptr ds:[8154A8]
>00539547    jne         00539578
 00539549    mov         eax,[00790C38];gvar_00790C38
 0053954E    call        0053F440
 00539553    mov         eax,788BC0;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00539558    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053955E    call        @FinalizeRecord
 00539563    mov         eax,788BD8;^'false'
 00539568    mov         ecx,2
 0053956D    mov         edx,dword ptr ds:[40128C];string
 00539573    call        @FinalizeArray
 00539578    xor         eax,eax
 0053957A    pop         edx
 0053957B    pop         ecx
 0053957C    pop         ecx
 0053957D    mov         dword ptr fs:[eax],edx
 00539580    push        53958D
 00539585    ret
>00539586    jmp         @HandleFinally
>0053958B    jmp         00539585
 0053958D    pop         ebp
 0053958E    ret
*}
end.