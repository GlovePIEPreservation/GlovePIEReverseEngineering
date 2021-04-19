//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit72;

interface

uses
  SysUtils, Classes;

    //procedure sub_0054CABC(?:UnicodeString; ?:?);//0054CABC

implementation

//0054CABC
{*procedure sub_0054CABC(?:UnicodeString; ?:?);
begin
 0054CABC    push        ebx
 0054CABD    push        esi
 0054CABE    push        edi
 0054CABF    push        ebp
 0054CAC0    add         esp,0FFFFFFF4
 0054CAC3    mov         dword ptr [esp],edx
 0054CAC6    mov         esi,eax
 0054CAC8    mov         eax,esi
 0054CACA    call        @LStrLen
 0054CACF    add         eax,2
 0054CAD2    mov         ecx,3
 0054CAD7    cdq
 0054CAD8    idiv        eax,ecx
 0054CADA    mov         edx,eax
 0054CADC    add         edx,edx
 0054CADE    add         edx,edx
 0054CAE0    mov         eax,dword ptr [esp]
 0054CAE3    xor         ecx,ecx
 0054CAE5    call        @LStrSetLength
 0054CAEA    mov         eax,esi
 0054CAEC    call        @LStrLen
 0054CAF1    add         eax,2
 0054CAF4    mov         ecx,3
 0054CAF9    cdq
 0054CAFA    idiv        eax,ecx
 0054CAFC    mov         edi,eax
 0054CAFE    test        edi,edi
>0054CB00    jle         0054CBFE
 0054CB06    mov         ebx,1
 0054CB0B    mov         eax,esi
 0054CB0D    call        @LStrLen
 0054CB12    lea         edx,[ebx+ebx*2]
 0054CB15    cmp         eax,edx
>0054CB17    jge         0054CB3E
 0054CB19    mov         eax,esi
 0054CB1B    call        @LStrLen
 0054CB20    mov         ecx,eax
 0054CB22    mov         eax,ebx
 0054CB24    dec         eax
 0054CB25    lea         eax,[eax+eax*2]
 0054CB28    sub         ecx,eax
 0054CB2A    lea         edx,[esp+4]
 0054CB2E    mov         eax,ebx
 0054CB30    dec         eax
 0054CB31    lea         eax,[eax+eax*2]
 0054CB34    lea         eax,[esi+eax]
 0054CB37    call        Move
>0054CB3C    jmp         0054CB55
 0054CB3E    lea         edx,[esp+4]
 0054CB42    mov         eax,ebx
 0054CB44    dec         eax
 0054CB45    lea         eax,[eax+eax*2]
 0054CB48    lea         eax,[esi+eax]
 0054CB4B    mov         ecx,3
 0054CB50    call        Move
 0054CB55    movzx       eax,byte ptr [esp+4]
 0054CB5A    mov         edx,eax
 0054CB5C    and         dl,0FC
 0054CB5F    movzx       edx,dl
 0054CB62    shr         edx,2
 0054CB65    mov         ecx,dword ptr ds:[788ED0];^'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567...
 0054CB6B    movzx       edx,byte ptr [ecx+edx]
 0054CB6F    mov         byte ptr [esp+7],dl
 0054CB73    and         al,3
 0054CB75    movzx       ebp,al
 0054CB78    shl         ebp,4
 0054CB7B    movzx       edx,byte ptr [esp+5]
 0054CB80    mov         eax,edx
 0054CB82    and         al,0F0
 0054CB84    movzx       eax,al
 0054CB87    shr         eax,4
 0054CB8A    or          ebp,eax
 0054CB8C    mov         eax,[00788ED0];^'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
 0054CB91    movzx       eax,byte ptr [eax+ebp]
 0054CB95    mov         byte ptr [esp+8],al
 0054CB99    and         dl,0F
 0054CB9C    movzx       ebp,dl
 0054CB9F    add         ebp,ebp
 0054CBA1    add         ebp,ebp
 0054CBA3    movzx       eax,byte ptr [esp+6]
 0054CBA8    mov         edx,eax
 0054CBAA    and         dl,0C0
 0054CBAD    movzx       edx,dl
 0054CBB0    shr         edx,6
 0054CBB3    or          ebp,edx
 0054CBB5    mov         edx,dword ptr ds:[788ED0];^'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567...
 0054CBBB    movzx       edx,byte ptr [edx+ebp]
 0054CBBF    mov         byte ptr [esp+9],dl
 0054CBC3    and         al,3F
 0054CBC5    movzx       eax,al
 0054CBC8    mov         edx,dword ptr ds:[788ED0];^'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567...
 0054CBCE    movzx       eax,byte ptr [edx+eax]
 0054CBD2    mov         byte ptr [esp+0A],al
 0054CBD6    mov         eax,dword ptr [esp]
 0054CBD9    call        @UniqueStringA
 0054CBDE    mov         edx,ebx
 0054CBE0    dec         edx
 0054CBE1    add         edx,edx
 0054CBE3    add         edx,edx
 0054CBE5    lea         edx,[eax+edx]
 0054CBE8    lea         eax,[esp+7]
 0054CBEC    mov         ecx,4
 0054CBF1    call        Move
 0054CBF6    inc         ebx
 0054CBF7    dec         edi
>0054CBF8    jne         0054CB0B
 0054CBFE    mov         eax,esi
 0054CC00    call        @LStrLen
 0054CC05    mov         ecx,3
 0054CC0A    cdq
 0054CC0B    idiv        eax,ecx
 0054CC0D    dec         edx
>0054CC0E    jne         0054CC44
 0054CC10    mov         eax,dword ptr [esp]
 0054CC13    mov         eax,dword ptr [eax]
 0054CC15    call        @LStrLen
 0054CC1A    mov         ebx,eax
 0054CC1C    mov         eax,dword ptr [esp]
 0054CC1F    call        @UniqueStringA
 0054CC24    mov         byte ptr [eax+ebx-2],3D
 0054CC29    mov         eax,dword ptr [esp]
 0054CC2C    mov         eax,dword ptr [eax]
 0054CC2E    call        @LStrLen
 0054CC33    mov         ebx,eax
 0054CC35    mov         eax,dword ptr [esp]
 0054CC38    call        @UniqueStringA
 0054CC3D    mov         byte ptr [eax+ebx-1],3D
>0054CC42    jmp         0054CC71
 0054CC44    mov         eax,esi
 0054CC46    call        @LStrLen
 0054CC4B    mov         ecx,3
 0054CC50    cdq
 0054CC51    idiv        eax,ecx
 0054CC53    cmp         edx,2
>0054CC56    jne         0054CC71
 0054CC58    mov         eax,dword ptr [esp]
 0054CC5B    mov         eax,dword ptr [eax]
 0054CC5D    call        @LStrLen
 0054CC62    mov         ebx,eax
 0054CC64    mov         eax,dword ptr [esp]
 0054CC67    call        @UniqueStringA
 0054CC6C    mov         byte ptr [eax+ebx-1],3D
 0054CC71    add         esp,0C
 0054CC74    pop         ebp
 0054CC75    pop         edi
 0054CC76    pop         esi
 0054CC77    pop         ebx
 0054CC78    ret
end;*}

Initialization
Finalization
//0054CC9C
{*
 0054CC9C    push        ebp
 0054CC9D    mov         ebp,esp
 0054CC9F    xor         eax,eax
 0054CCA1    push        ebp
 0054CCA2    push        54CCE1
 0054CCA7    push        dword ptr fs:[eax]
 0054CCAA    mov         dword ptr fs:[eax],esp
 0054CCAD    inc         dword ptr ds:[8154EC]
>0054CCB3    jne         0054CCD3
 0054CCB5    mov         eax,788ED0;^'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
 0054CCBA    call        @LStrClr
 0054CCBF    mov         eax,788ED4;^'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$-_@.&+-!*"'(),;/#?:'
 0054CCC4    call        @LStrClr
 0054CCC9    mov         eax,788ED8;^'0123456789ABCDEF'
 0054CCCE    call        @LStrClr
 0054CCD3    xor         eax,eax
 0054CCD5    pop         edx
 0054CCD6    pop         ecx
 0054CCD7    pop         ecx
 0054CCD8    mov         dword ptr fs:[eax],edx
 0054CCDB    push        54CCE8
 0054CCE0    ret
>0054CCE1    jmp         @HandleFinally
>0054CCE6    jmp         0054CCE0
 0054CCE8    pop         ebp
 0054CCE9    ret
*}
end.