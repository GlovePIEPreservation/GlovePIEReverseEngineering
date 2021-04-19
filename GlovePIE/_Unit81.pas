//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit81;

interface

uses
  SysUtils, Classes;

    //procedure sub_00574774(?:?; ?:?);//00574774
    //function sub_00574788(?:UString; ?:UnicodeString):?;//00574788
    procedure sub_005747EC(?:UnicodeString; ?:UnicodeString);//005747EC
    //procedure sub_00574838(?:UnicodeString; ?:?);//00574838
    procedure sub_00574888;//00574888
    //procedure sub_005748A0(?:?);//005748A0
    //function sub_00574DA4(?:?; ?:?):?;//00574DA4
    //function sub_00574E4C(?:UnicodeString; ?:UnicodeString):?;//00574E4C
    //function sub_00574EF4(?:?):?;//00574EF4
    //procedure sub_00574F74(?:?; ?:?);//00574F74
    //procedure sub_00574FC4(?:?; ?:UnicodeString);//00574FC4
    //procedure sub_00575044(?:?; ?:?);//00575044
    //procedure sub_00575218(?:?; ?:UnicodeString);//00575218
    //procedure sub_00575428(?:UString; ?:?);//00575428
    //procedure sub_00575518(?:UString; ?:?);//00575518
    //procedure sub_00575608(?:UnicodeString; ?:?);//00575608
    //procedure sub_00575954(?:UnicodeString; ?:?);//00575954
    procedure sub_00575A60(?:UnicodeString; ?:UnicodeString);//00575A60
    //procedure sub_00575C90(?:UnicodeString; ?:?);//00575C90
    //procedure sub_00575EC0(?:?; ?:?);//00575EC0
    //procedure sub_00576000(?:UString; ?:?);//00576000
    //procedure sub_005762B4(?:UString; ?:?);//005762B4
    procedure sub_00576720(?:TComponent);//00576720
    procedure sub_00576830(?:TComponent);//00576830
    //procedure sub_005768F0(?:?);//005768F0

implementation

//00574774
{*procedure sub_00574774(?:?; ?:?);
begin
 00574774    push        ebx
 00574775    push        esi
 00574776    mov         esi,edx
 00574778    mov         ebx,eax
 0057477A    mov         edx,esi
 0057477C    mov         eax,ebx
 0057477E    call        ParamStr
 00574783    pop         esi
 00574784    pop         ebx
 00574785    ret
end;*}

//00574788
{*function sub_00574788(?:UString; ?:UnicodeString):?;
begin
 00574788    push        ebp
 00574789    mov         ebp,esp
 0057478B    add         esp,0FFFFFFF8
 0057478E    push        ebx
 0057478F    mov         dword ptr [ebp-8],edx
 00574792    mov         dword ptr [ebp-4],eax
 00574795    mov         eax,dword ptr [ebp-4]
 00574798    call        @UStrAddRef
 0057479D    mov         eax,dword ptr [ebp-8]
 005747A0    call        @UStrAddRef
 005747A5    xor         eax,eax
 005747A7    push        ebp
 005747A8    push        5747DB
 005747AD    push        dword ptr fs:[eax]
 005747B0    mov         dword ptr fs:[eax],esp
 005747B3    mov         edx,dword ptr [ebp-8]
 005747B6    mov         eax,dword ptr [ebp-4]
 005747B9    call        Pos
 005747BE    mov         ebx,eax
 005747C0    xor         eax,eax
 005747C2    pop         edx
 005747C3    pop         ecx
 005747C4    pop         ecx
 005747C5    mov         dword ptr fs:[eax],edx
 005747C8    push        5747E2
 005747CD    lea         eax,[ebp-8]
 005747D0    mov         edx,2
 005747D5    call        @UStrArrayClr
 005747DA    ret
>005747DB    jmp         @HandleFinally
>005747E0    jmp         005747CD
 005747E2    mov         eax,ebx
 005747E4    pop         ebx
 005747E5    pop         ecx
 005747E6    pop         ecx
 005747E7    pop         ebp
 005747E8    ret
end;*}

//005747EC
procedure sub_005747EC(?:UnicodeString; ?:UnicodeString);
begin
{*
 005747EC    push        ebp
 005747ED    mov         ebp,esp
 005747EF    push        ecx
 005747F0    push        ebx
 005747F1    mov         ebx,edx
 005747F3    mov         dword ptr [ebp-4],eax
 005747F6    mov         eax,dword ptr [ebp-4]
 005747F9    call        @UStrAddRef
 005747FE    xor         eax,eax
 00574800    push        ebp
 00574801    push        57482C
 00574806    push        dword ptr fs:[eax]
 00574809    mov         dword ptr fs:[eax],esp
 0057480C    mov         edx,ebx
 0057480E    mov         eax,dword ptr [ebp-4]
 00574811    call        Trim
 00574816    xor         eax,eax
 00574818    pop         edx
 00574819    pop         ecx
 0057481A    pop         ecx
 0057481B    mov         dword ptr fs:[eax],edx
 0057481E    push        574833
 00574823    lea         eax,[ebp-4]
 00574826    call        @UStrClr
 0057482B    ret
>0057482C    jmp         @HandleFinally
>00574831    jmp         00574823
 00574833    pop         ebx
 00574834    pop         ecx
 00574835    pop         ebp
 00574836    ret
*}
end;

//00574838
{*procedure sub_00574838(?:UnicodeString; ?:?);
begin
 00574838    push        ebp
 00574839    mov         ebp,esp
 0057483B    push        ecx
 0057483C    push        ebx
 0057483D    mov         ebx,edx
 0057483F    mov         dword ptr [ebp-4],eax
 00574842    mov         eax,dword ptr [ebp-4]
 00574845    call        @UStrAddRef
 0057484A    xor         eax,eax
 0057484C    push        ebp
 0057484D    push        57487D
 00574852    push        dword ptr fs:[eax]
 00574855    mov         dword ptr fs:[eax],esp
 00574858    mov         eax,ebx
 0057485A    mov         edx,dword ptr [ebp-4]
 0057485D    mov         ecx,0FDE9
 00574862    call        @LStrFromUStr
 00574867    xor         eax,eax
 00574869    pop         edx
 0057486A    pop         ecx
 0057486B    pop         ecx
 0057486C    mov         dword ptr fs:[eax],edx
 0057486F    push        574884
 00574874    lea         eax,[ebp-4]
 00574877    call        @UStrClr
 0057487C    ret
>0057487D    jmp         @HandleFinally
>00574882    jmp         00574874
 00574884    pop         ebx
 00574885    pop         ecx
 00574886    pop         ebp
 00574887    ret
end;*}

//00574888
procedure sub_00574888;
begin
{*
 00574888    mov         eax,[00815528];gvar_00815528:TStringList
 0057488D    mov         edx,dword ptr [eax]
 0057488F    call        dword ptr [edx+44]
 00574892    mov         eax,[0081552C];gvar_0081552C:TStringList
 00574897    mov         edx,dword ptr [eax]
 00574899    call        dword ptr [edx+44]
 0057489C    ret
*}
end;

//005748A0
{*procedure sub_005748A0(?:?);
begin
 005748A0    push        ebp
 005748A1    mov         ebp,esp
 005748A3    mov         ecx,7
 005748A8    push        0
 005748AA    push        0
 005748AC    dec         ecx
>005748AD    jne         005748A8
 005748AF    push        ecx
 005748B0    push        ebx
 005748B1    push        esi
 005748B2    push        edi
 005748B3    mov         dword ptr [ebp-4],eax
 005748B6    mov         eax,dword ptr [ebp-4]
 005748B9    call        @UStrAddRef
 005748BE    xor         eax,eax
 005748C0    push        ebp
 005748C1    push        574C6B
 005748C6    push        dword ptr fs:[eax]
 005748C9    mov         dword ptr fs:[eax],esp
 005748CC    mov         eax,815558;gvar_00815558:UnicodeString
 005748D1    mov         edx,dword ptr [ebp-4]
 005748D4    call        @UStrAsg
 005748D9    mov         byte ptr ds:[81555F],0;gvar_0081555F
 005748E0    mov         eax,[00815530];gvar_00815530:TStringList
 005748E5    mov         edx,dword ptr [eax]
 005748E7    call        dword ptr [edx+44]
 005748EA    mov         eax,[00815534];gvar_00815534:TStringList
 005748EF    mov         edx,dword ptr [eax]
 005748F1    call        dword ptr [edx+44]
 005748F4    mov         eax,[00815538];gvar_00815538:TStringList
 005748F9    mov         edx,dword ptr [eax]
 005748FB    call        dword ptr [edx+44]
 005748FE    mov         eax,[0081553C];gvar_0081553C:TStringList
 00574903    mov         edx,dword ptr [eax]
 00574905    call        dword ptr [edx+44]
 00574908    mov         eax,[00815550];gvar_00815550:TStringList
 0057490D    mov         edx,dword ptr [eax]
 0057490F    call        dword ptr [edx+44]
 00574912    mov         eax,[00815554];gvar_00815554:TStringList
 00574917    mov         edx,dword ptr [eax]
 00574919    call        dword ptr [edx+44]
 0057491C    mov         eax,[00815540];gvar_00815540:TStringList
 00574921    mov         edx,dword ptr [eax]
 00574923    call        dword ptr [edx+44]
 00574926    mov         eax,[00815544];gvar_00815544:TStringList
 0057492B    mov         edx,dword ptr [eax]
 0057492D    call        dword ptr [edx+44]
 00574930    mov         eax,[00815548];gvar_00815548:TStringList
 00574935    mov         edx,dword ptr [eax]
 00574937    call        dword ptr [edx+44]
 0057493A    mov         eax,[0081554C];gvar_0081554C:TStringList
 0057493F    mov         edx,dword ptr [eax]
 00574941    call        dword ptr [edx+44]
 00574944    cmp         dword ptr [ebp-4],0
>00574948    je          00574C43
 0057494E    xor         eax,eax
 00574950    push        ebp
 00574951    push        574975
 00574956    push        dword ptr fs:[eax]
 00574959    mov         dword ptr fs:[eax],esp
 0057495C    mov         dl,1
 0057495E    mov         eax,[0043C7BC];TStringList
 00574963    call        TStringList.Create;TStringList.Create
 00574968    mov         dword ptr [ebp-14],eax
 0057496B    xor         eax,eax
 0057496D    pop         edx
 0057496E    pop         ecx
 0057496F    pop         ecx
 00574970    mov         dword ptr fs:[eax],edx
>00574973    jmp         00574993
>00574975    jmp         @HandleAnyException
 0057497A    mov         eax,815558;gvar_00815558:UnicodeString
 0057497F    call        @UStrClr
 00574984    call        @DoneExcept
>00574989    jmp         00574C43
 0057498E    call        @DoneExcept
 00574993    lea         edx,[ebp-28]
 00574996    xor         eax,eax
 00574998    call        00574774
 0057499D    mov         eax,dword ptr [ebp-28]
 005749A0    lea         edx,[ebp-24]
 005749A3    call        ExtractFileDir
 005749A8    push        dword ptr [ebp-24]
 005749AB    push        574C88;'\'
 005749B0    push        dword ptr [ebp-4]
 005749B3    push        574C98;'.inilng'
 005749B8    lea         eax,[ebp-20]
 005749BB    mov         edx,4
 005749C0    call        @UStrCatN
 005749C5    mov         edx,dword ptr [ebp-20]
 005749C8    mov         eax,dword ptr [ebp-14]
 005749CB    mov         ecx,dword ptr [eax]
 005749CD    call        dword ptr [ecx+68];TStrings.LoadFromFile
 005749D0    mov         eax,dword ptr [ebp-14]
 005749D3    mov         edx,dword ptr [eax]
 005749D5    call        dword ptr [edx+14];TStringList.GetCount
 005749D8    dec         eax
 005749D9    test        eax,eax
>005749DB    jl          00574C3B
 005749E1    inc         eax
 005749E2    mov         dword ptr [ebp-1C],eax
 005749E5    mov         dword ptr [ebp-18],0
 005749EC    lea         ecx,[ebp-8]
 005749EF    mov         edx,dword ptr [ebp-18]
 005749F2    mov         eax,dword ptr [ebp-14]
 005749F5    mov         ebx,dword ptr [eax]
 005749F7    call        dword ptr [ebx+0C];TStringList.Get
 005749FA    mov         edx,dword ptr [ebp-8]
 005749FD    mov         eax,574CB4;';'
 00574A02    call        00574788
 00574A07    mov         ebx,eax
 00574A09    test        ebx,ebx
>00574A0B    jle         00574A21
 00574A0D    lea         eax,[ebp-8]
 00574A10    push        eax
 00574A11    mov         ecx,ebx
 00574A13    dec         ecx
 00574A14    mov         edx,1
 00574A19    mov         eax,dword ptr [ebp-8]
 00574A1C    call        @UStrCopy
 00574A21    lea         edx,[ebp-2C]
 00574A24    mov         eax,dword ptr [ebp-8]
 00574A27    call        005747EC
 00574A2C    mov         edx,dword ptr [ebp-2C]
 00574A2F    lea         eax,[ebp-8]
 00574A32    call        @UStrLAsg
 00574A37    mov         esi,dword ptr [ebp-8]
 00574A3A    mov         eax,esi
 00574A3C    test        eax,eax
>00574A3E    je          00574A45
 00574A40    sub         eax,4
 00574A43    mov         eax,dword ptr [eax]
 00574A45    test        eax,eax
>00574A47    jle         00574A55
 00574A49    mov         eax,dword ptr [ebp-8]
 00574A4C    cmp         word ptr [eax],5B
 00574A50    sete        al
>00574A53    jmp         00574A57
 00574A55    xor         eax,eax
 00574A57    test        al,al
>00574A59    je          00574A74
 00574A5B    mov         eax,esi
 00574A5D    test        eax,eax
>00574A5F    je          00574A66
 00574A61    sub         eax,4
 00574A64    mov         eax,dword ptr [eax]
 00574A66    mov         edx,dword ptr [ebp-8]
 00574A69    cmp         word ptr [edx+eax*2-2],5D
 00574A6F    sete        al
>00574A72    jmp         00574A76
 00574A74    xor         eax,eax
 00574A76    test        al,al
>00574A78    je          00574AAB
 00574A7A    mov         ebx,esi
 00574A7C    test        ebx,ebx
>00574A7E    je          00574A85
 00574A80    sub         ebx,4
 00574A83    mov         ebx,dword ptr [ebx]
 00574A85    lea         eax,[ebp-8]
 00574A88    push        eax
 00574A89    mov         ecx,ebx
 00574A8B    sub         ecx,2
 00574A8E    mov         edx,2
 00574A93    mov         eax,dword ptr [ebp-8]
 00574A96    call        @UStrCopy
 00574A9B    lea         edx,[ebp-10]
 00574A9E    mov         eax,dword ptr [ebp-8]
 00574AA1    call        LowerCase
>00574AA6    jmp         00574C2F
 00574AAB    mov         edx,dword ptr [ebp-8]
 00574AAE    mov         eax,574CC4;'='
 00574AB3    call        00574788
 00574AB8    mov         ebx,eax
 00574ABA    test        ebx,ebx
>00574ABC    jle         00574C2F
 00574AC2    test        esi,esi
>00574AC4    je          00574ACB
 00574AC6    sub         esi,4
 00574AC9    mov         esi,dword ptr [esi]
 00574ACB    lea         eax,[ebp-30]
 00574ACE    push        eax
 00574ACF    lea         edx,[ebx+1]
 00574AD2    mov         ecx,esi
 00574AD4    mov         eax,dword ptr [ebp-8]
 00574AD7    call        @UStrCopy
 00574ADC    mov         eax,dword ptr [ebp-30]
 00574ADF    lea         edx,[ebp-0C]
 00574AE2    call        Trim
 00574AE7    lea         eax,[ebp-38]
 00574AEA    push        eax
 00574AEB    mov         ecx,ebx
 00574AED    dec         ecx
 00574AEE    mov         edx,1
 00574AF3    mov         eax,dword ptr [ebp-8]
 00574AF6    call        @UStrCopy
 00574AFB    mov         eax,dword ptr [ebp-38]
 00574AFE    lea         edx,[ebp-34]
 00574B01    call        Trim
 00574B06    mov         edx,dword ptr [ebp-34]
 00574B09    lea         eax,[ebp-8]
 00574B0C    call        @UStrLAsg
 00574B11    mov         eax,dword ptr [ebp-10]
 00574B14    mov         edx,574CD4;'language'
 00574B19    call        @UStrEqual
>00574B1E    jne         00574B57
 00574B20    lea         edx,[ebp-3C]
 00574B23    mov         eax,dword ptr [ebp-8]
 00574B26    call        LowerCase
 00574B2B    mov         eax,dword ptr [ebp-3C]
 00574B2E    mov         edx,574CF4;'decimal'
 00574B33    call        @UStrEqual
>00574B38    jne         00574C2F
 00574B3E    mov         eax,dword ptr [ebp-0C]
 00574B41    mov         edx,574D10;','
 00574B46    call        @UStrEqual
 00574B4B    sete        byte ptr ds:[81555F];gvar_0081555F
>00574B52    jmp         00574C2F
 00574B57    mov         eax,dword ptr [ebp-10]
 00574B5A    mov         edx,574D20;'menu'
 00574B5F    call        @UStrEqual
>00574B64    jne         00574B85
 00574B66    mov         edx,dword ptr [ebp-8]
 00574B69    mov         eax,[00815530];gvar_00815530:TStringList
 00574B6E    mov         ecx,dword ptr [eax]
 00574B70    call        dword ptr [ecx+38]
 00574B73    mov         edx,dword ptr [ebp-0C]
 00574B76    mov         eax,[00815534];gvar_00815534:TStringList
 00574B7B    mov         ecx,dword ptr [eax]
 00574B7D    call        dword ptr [ecx+38]
>00574B80    jmp         00574C2F
 00574B85    mov         eax,dword ptr [ebp-10]
 00574B88    mov         edx,574D38;'tooltip'
 00574B8D    call        @UStrEqual
>00574B92    jne         00574BB0
 00574B94    mov         edx,dword ptr [ebp-8]
 00574B97    mov         eax,[00815538];gvar_00815538:TStringList
 00574B9C    mov         ecx,dword ptr [eax]
 00574B9E    call        dword ptr [ecx+38]
 00574BA1    mov         edx,dword ptr [ebp-0C]
 00574BA4    mov         eax,[0081553C];gvar_0081553C:TStringList
 00574BA9    mov         ecx,dword ptr [eax]
 00574BAB    call        dword ptr [ecx+38]
>00574BAE    jmp         00574C2F
 00574BB0    mov         eax,dword ptr [ebp-10]
 00574BB3    mov         edx,574D54;'message'
 00574BB8    call        @UStrEqual
>00574BBD    jne         00574BDB
 00574BBF    mov         edx,dword ptr [ebp-8]
 00574BC2    mov         eax,[00815550];gvar_00815550:TStringList
 00574BC7    mov         ecx,dword ptr [eax]
 00574BC9    call        dword ptr [ecx+38]
 00574BCC    mov         edx,dword ptr [ebp-0C]
 00574BCF    mov         eax,[00815554];gvar_00815554:TStringList
 00574BD4    mov         ecx,dword ptr [eax]
 00574BD6    call        dword ptr [ecx+38]
>00574BD9    jmp         00574C2F
 00574BDB    mov         eax,dword ptr [ebp-10]
 00574BDE    mov         edx,574D70;'keyword'
 00574BE3    call        @UStrEqual
>00574BE8    jne         00574C06
 00574BEA    mov         edx,dword ptr [ebp-8]
 00574BED    mov         eax,[00815540];gvar_00815540:TStringList
 00574BF2    mov         ecx,dword ptr [eax]
 00574BF4    call        dword ptr [ecx+38]
 00574BF7    mov         edx,dword ptr [ebp-0C]
 00574BFA    mov         eax,[00815544];gvar_00815544:TStringList
 00574BFF    mov         ecx,dword ptr [eax]
 00574C01    call        dword ptr [ecx+38]
>00574C04    jmp         00574C2F
 00574C06    mov         eax,dword ptr [ebp-10]
 00574C09    mov         edx,574D8C;'identifier'
 00574C0E    call        @UStrEqual
>00574C13    jne         00574C2F
 00574C15    mov         edx,dword ptr [ebp-8]
 00574C18    mov         eax,[00815548];gvar_00815548:TStringList
 00574C1D    mov         ecx,dword ptr [eax]
 00574C1F    call        dword ptr [ecx+38]
 00574C22    mov         edx,dword ptr [ebp-0C]
 00574C25    mov         eax,[0081554C];gvar_0081554C:TStringList
 00574C2A    mov         ecx,dword ptr [eax]
 00574C2C    call        dword ptr [ecx+38]
 00574C2F    inc         dword ptr [ebp-18]
 00574C32    dec         dword ptr [ebp-1C]
>00574C35    jne         005749EC
 00574C3B    mov         eax,dword ptr [ebp-14]
 00574C3E    call        TObject.Free
 00574C43    xor         eax,eax
 00574C45    pop         edx
 00574C46    pop         ecx
 00574C47    pop         ecx
 00574C48    mov         dword ptr fs:[eax],edx
 00574C4B    push        574C72
 00574C50    lea         eax,[ebp-3C]
 00574C53    mov         edx,8
 00574C58    call        @UStrArrayClr
 00574C5D    lea         eax,[ebp-10]
 00574C60    mov         edx,4
 00574C65    call        @UStrArrayClr
 00574C6A    ret
>00574C6B    jmp         @HandleFinally
>00574C70    jmp         00574C50
 00574C72    pop         edi
 00574C73    pop         esi
 00574C74    pop         ebx
 00574C75    mov         esp,ebp
 00574C77    pop         ebp
 00574C78    ret
end;*}

//00574DA4
{*function sub_00574DA4(?:?; ?:?):?;
begin
 00574DA4    push        ebp
 00574DA5    mov         ebp,esp
 00574DA7    add         esp,0FFFFFFF4
 00574DAA    push        ebx
 00574DAB    push        esi
 00574DAC    push        edi
 00574DAD    xor         ecx,ecx
 00574DAF    mov         dword ptr [ebp-0C],ecx
 00574DB2    mov         dword ptr [ebp-8],edx
 00574DB5    mov         dword ptr [ebp-4],eax
 00574DB8    mov         eax,dword ptr [ebp-4]
 00574DBB    call        @UStrAddRef
 00574DC0    mov         eax,dword ptr [ebp-8]
 00574DC3    call        @UStrAddRef
 00574DC8    xor         eax,eax
 00574DCA    push        ebp
 00574DCB    push        574E39
 00574DD0    push        dword ptr fs:[eax]
 00574DD3    mov         dword ptr fs:[eax],esp
 00574DD6    mov         ebx,dword ptr [ebp-4]
 00574DD9    test        ebx,ebx
>00574DDB    je          00574DE2
 00574DDD    sub         ebx,4
 00574DE0    mov         ebx,dword ptr [ebx]
 00574DE2    mov         eax,dword ptr [ebp-8]
 00574DE5    mov         esi,eax
 00574DE7    test        esi,esi
>00574DE9    je          00574DF0
 00574DEB    sub         esi,4
 00574DEE    mov         esi,dword ptr [esi]
 00574DF0    mov         edi,eax
 00574DF2    test        edi,edi
>00574DF4    je          00574DFB
 00574DF6    sub         edi,4
 00574DF9    mov         edi,dword ptr [edi]
 00574DFB    lea         eax,[ebp-0C]
 00574DFE    push        eax
 00574DFF    mov         edx,ebx
 00574E01    sub         edx,esi
 00574E03    inc         edx
 00574E04    mov         ecx,edi
 00574E06    mov         eax,dword ptr [ebp-4]
 00574E09    call        @UStrCopy
 00574E0E    mov         eax,dword ptr [ebp-0C]
 00574E11    mov         edx,dword ptr [ebp-8]
 00574E14    call        @UStrEqual
 00574E19    sete        al
 00574E1C    mov         ebx,eax
 00574E1E    xor         eax,eax
 00574E20    pop         edx
 00574E21    pop         ecx
 00574E22    pop         ecx
 00574E23    mov         dword ptr fs:[eax],edx
 00574E26    push        574E40
 00574E2B    lea         eax,[ebp-0C]
 00574E2E    mov         edx,3
 00574E33    call        @UStrArrayClr
 00574E38    ret
>00574E39    jmp         @HandleFinally
>00574E3E    jmp         00574E2B
 00574E40    mov         eax,ebx
 00574E42    pop         edi
 00574E43    pop         esi
 00574E44    pop         ebx
 00574E45    mov         esp,ebp
 00574E47    pop         ebp
 00574E48    ret
end;*}

//00574E4C
{*function sub_00574E4C(?:UnicodeString; ?:UnicodeString):?;
begin
 00574E4C    push        ebp
 00574E4D    mov         ebp,esp
 00574E4F    push        0
 00574E51    push        0
 00574E53    push        0
 00574E55    push        ebx
 00574E56    push        esi
 00574E57    mov         ebx,edx
 00574E59    mov         esi,eax
 00574E5B    xor         eax,eax
 00574E5D    push        ebp
 00574E5E    push        574EE4
 00574E63    push        dword ptr fs:[eax]
 00574E66    mov         dword ptr fs:[eax],esp
 00574E69    lea         edx,[ebp-4]
 00574E6C    mov         eax,ebx
 00574E6E    call        UpperCase
 00574E73    mov         eax,dword ptr [ebp-4]
 00574E76    push        eax
 00574E77    lea         edx,[ebp-8]
 00574E7A    mov         eax,dword ptr [esi]
 00574E7C    call        UpperCase
 00574E81    mov         eax,dword ptr [ebp-8]
 00574E84    pop         edx
 00574E85    call        00574DA4
 00574E8A    test        al,al
>00574E8C    je          00574EC7
 00574E8E    mov         eax,dword ptr [esi]
 00574E90    mov         dword ptr [ebp-0C],eax
 00574E93    mov         eax,dword ptr [ebp-0C]
 00574E96    test        eax,eax
>00574E98    je          00574E9F
 00574E9A    sub         eax,4
 00574E9D    mov         eax,dword ptr [eax]
 00574E9F    mov         ecx,ebx
 00574EA1    mov         edx,ecx
 00574EA3    test        edx,edx
>00574EA5    je          00574EAC
 00574EA7    sub         edx,4
 00574EAA    mov         edx,dword ptr [edx]
 00574EAC    test        ecx,ecx
>00574EAE    je          00574EB5
 00574EB0    sub         ecx,4
 00574EB3    mov         ecx,dword ptr [ecx]
 00574EB5    mov         ebx,esi
 00574EB7    sub         eax,edx
 00574EB9    inc         eax
 00574EBA    mov         edx,eax
 00574EBC    mov         eax,ebx
 00574EBE    call        @UStrDelete
 00574EC3    mov         bl,1
>00574EC5    jmp         00574EC9
 00574EC7    xor         ebx,ebx
 00574EC9    xor         eax,eax
 00574ECB    pop         edx
 00574ECC    pop         ecx
 00574ECD    pop         ecx
 00574ECE    mov         dword ptr fs:[eax],edx
 00574ED1    push        574EEB
 00574ED6    lea         eax,[ebp-8]
 00574ED9    mov         edx,2
 00574EDE    call        @UStrArrayClr
 00574EE3    ret
>00574EE4    jmp         @HandleFinally
>00574EE9    jmp         00574ED6
 00574EEB    mov         eax,ebx
 00574EED    pop         esi
 00574EEE    pop         ebx
 00574EEF    mov         esp,ebp
 00574EF1    pop         ebp
 00574EF2    ret
end;*}

//00574EF4
{*function sub_00574EF4(?:?):?;
begin
 00574EF4    push        ebp
 00574EF5    mov         ebp,esp
 00574EF7    push        0
 00574EF9    push        0
 00574EFB    push        0
 00574EFD    push        ebx
 00574EFE    mov         ebx,eax
 00574F00    xor         eax,eax
 00574F02    push        ebp
 00574F03    push        574F66
 00574F08    push        dword ptr fs:[eax]
 00574F0B    mov         dword ptr fs:[eax],esp
 00574F0E    lea         eax,[ebp-0C]
 00574F11    mov         edx,ebx
 00574F13    call        @WStrFromWChar
 00574F18    mov         eax,dword ptr [ebp-0C]
 00574F1B    lea         edx,[ebp-8]
 00574F1E    call        WideUpperCase
 00574F23    mov         edx,dword ptr [ebp-8]
 00574F26    lea         eax,[ebp-4]
 00574F29    call        @UStrFromWStr
 00574F2E    mov         eax,dword ptr [ebp-4]
 00574F31    test        eax,eax
>00574F33    je          00574F3A
 00574F35    sub         eax,4
 00574F38    mov         eax,dword ptr [eax]
 00574F3A    dec         eax
>00574F3B    jne         00574F43
 00574F3D    mov         eax,dword ptr [ebp-4]
 00574F40    movzx       ebx,word ptr [eax]
 00574F43    xor         eax,eax
 00574F45    pop         edx
 00574F46    pop         ecx
 00574F47    pop         ecx
 00574F48    mov         dword ptr fs:[eax],edx
 00574F4B    push        574F6D
 00574F50    lea         eax,[ebp-0C]
 00574F53    mov         edx,2
 00574F58    call        @WStrArrayClr
 00574F5D    lea         eax,[ebp-4]
 00574F60    call        @UStrClr
 00574F65    ret
>00574F66    jmp         @HandleFinally
>00574F6B    jmp         00574F50
 00574F6D    mov         eax,ebx
 00574F6F    pop         ebx
 00574F70    mov         esp,ebp
 00574F72    pop         ebp
 00574F73    ret
end;*}

//00574F74
{*procedure sub_00574F74(?:?; ?:?);
begin
 00574F74    push        ebx
 00574F75    push        esi
 00574F76    mov         esi,edx
 00574F78    mov         ebx,eax
 00574F7A    mov         eax,ebx
 00574F7C    mov         edx,dword ptr ds:[47A16C];TControl
 00574F82    call        @IsClass
 00574F87    test        al,al
>00574F89    je          00574F9B
 00574F8B    mov         eax,esi
 00574F8D    mov         edx,dword ptr [ebx+80]
 00574F93    call        @UStrAsg
 00574F98    pop         esi
 00574F99    pop         ebx
 00574F9A    ret
 00574F9B    mov         eax,ebx
 00574F9D    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00574FA3    call        @IsClass
 00574FA8    test        al,al
>00574FAA    je          00574FB8
 00574FAC    mov         eax,esi
 00574FAE    mov         edx,dword ptr [ebx+58]
 00574FB1    call        @UStrAsg
>00574FB6    jmp         00574FBF
 00574FB8    mov         eax,esi
 00574FBA    call        @UStrClr
 00574FBF    pop         esi
 00574FC0    pop         ebx
 00574FC1    ret
end;*}

//00574FC4
{*procedure sub_00574FC4(?:?; ?:UnicodeString);
begin
 00574FC4    push        ebp
 00574FC5    mov         ebp,esp
 00574FC7    push        ecx
 00574FC8    push        ebx
 00574FC9    mov         dword ptr [ebp-4],edx
 00574FCC    mov         ebx,eax
 00574FCE    mov         eax,dword ptr [ebp-4]
 00574FD1    call        @UStrAddRef
 00574FD6    xor         eax,eax
 00574FD8    push        ebp
 00574FD9    push        575037
 00574FDE    push        dword ptr fs:[eax]
 00574FE1    mov         dword ptr fs:[eax],esp
 00574FE4    mov         eax,ebx
 00574FE6    mov         edx,dword ptr ds:[47A16C];TControl
 00574FEC    call        @IsClass
 00574FF1    test        al,al
>00574FF3    je          00575005
 00574FF5    lea         eax,[ebx+80]
 00574FFB    mov         edx,dword ptr [ebp-4]
 00574FFE    call        @UStrAsg
>00575003    jmp         00575021
 00575005    mov         eax,ebx
 00575007    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 0057500D    call        @IsClass
 00575012    test        al,al
>00575014    je          00575021
 00575016    lea         eax,[ebx+58]
 00575019    mov         edx,dword ptr [ebp-4]
 0057501C    call        @UStrAsg
 00575021    xor         eax,eax
 00575023    pop         edx
 00575024    pop         ecx
 00575025    pop         ecx
 00575026    mov         dword ptr fs:[eax],edx
 00575029    push        57503E
 0057502E    lea         eax,[ebp-4]
 00575031    call        @UStrClr
 00575036    ret
>00575037    jmp         @HandleFinally
>0057503C    jmp         0057502E
 0057503E    pop         ebx
 0057503F    pop         ecx
 00575040    pop         ebp
 00575041    ret
end;*}

//00575044
{*procedure sub_00575044(?:?; ?:?);
begin
 00575044    push        ebx
 00575045    push        esi
 00575046    mov         esi,edx
 00575048    mov         ebx,eax
 0057504A    mov         eax,ebx
 0057504C    mov         edx,dword ptr ds:[4E0C38];TForm
 00575052    call        @IsClass
 00575057    test        al,al
>00575059    je          00575067
 0057505B    mov         edx,esi
 0057505D    mov         eax,ebx
 0057505F    call        TControl.GetText
 00575064    pop         esi
 00575065    pop         ebx
 00575066    ret
 00575067    mov         eax,ebx
 00575069    mov         edx,dword ptr ds:[49F488];TMenuItem
 0057506F    call        @IsClass
 00575074    test        al,al
>00575076    je          00575087
 00575078    mov         eax,esi
 0057507A    mov         edx,dword ptr [ebx+34]
 0057507D    call        @UStrAsg
>00575082    jmp         00575213
 00575087    mov         eax,ebx
 00575089    mov         edx,dword ptr ds:[4ADEF4];TLabel
 0057508F    call        @IsClass
 00575094    test        al,al
>00575096    je          005750A6
 00575098    mov         edx,esi
 0057509A    mov         eax,ebx
 0057509C    call        TControl.GetText
>005750A1    jmp         00575213
 005750A6    mov         eax,ebx
 005750A8    mov         edx,dword ptr ds:[4B3A00];TButton
 005750AE    call        @IsClass
 005750B3    test        al,al
>005750B5    je          005750C5
 005750B7    mov         edx,esi
 005750B9    mov         eax,ebx
 005750BB    call        TControl.GetText
>005750C0    jmp         00575213
 005750C5    mov         eax,ebx
 005750C7    mov         edx,dword ptr ds:[4F3DB0];TBitBtn
 005750CD    call        @IsClass
 005750D2    test        al,al
>005750D4    je          005750E4
 005750D6    mov         edx,esi
 005750D8    mov         eax,ebx
 005750DA    call        TControl.GetText
>005750DF    jmp         00575213
 005750E4    mov         eax,ebx
 005750E6    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 005750EC    call        @IsClass
 005750F1    test        al,al
>005750F3    je          00575103
 005750F5    mov         edx,esi
 005750F7    mov         eax,ebx
 005750F9    call        TControl.GetText
>005750FE    jmp         00575213
 00575103    mov         eax,ebx
 00575105    mov         edx,dword ptr ds:[4B4888];TCheckBox
 0057510B    call        @IsClass
 00575110    test        al,al
>00575112    je          00575122
 00575114    mov         edx,esi
 00575116    mov         eax,ebx
 00575118    call        TControl.GetText
>0057511D    jmp         00575213
 00575122    mov         eax,ebx
 00575124    mov         edx,dword ptr ds:[4B5254];TRadioButton
 0057512A    call        @IsClass
 0057512F    test        al,al
>00575131    je          00575141
 00575133    mov         edx,esi
 00575135    mov         eax,ebx
 00575137    call        TControl.GetText
>0057513C    jmp         00575213
 00575141    mov         eax,ebx
 00575143    mov         edx,dword ptr ds:[4AD030];TGroupBox
 00575149    call        @IsClass
 0057514E    test        al,al
>00575150    je          00575160
 00575152    mov         edx,esi
 00575154    mov         eax,ebx
 00575156    call        TControl.GetText
>0057515B    jmp         00575213
 00575160    mov         eax,ebx
 00575162    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00575168    call        @IsClass
 0057516D    test        al,al
>0057516F    je          0057517F
 00575171    mov         edx,esi
 00575173    mov         eax,ebx
 00575175    call        TControl.GetText
>0057517A    jmp         00575213
 0057517F    mov         eax,ebx
 00575181    mov         edx,dword ptr ds:[4C5EA0];TRadioGroup
 00575187    call        @IsClass
 0057518C    test        al,al
>0057518E    je          0057519B
 00575190    mov         edx,esi
 00575192    mov         eax,ebx
 00575194    call        TControl.GetText
>00575199    jmp         00575213
 0057519B    mov         eax,ebx
 0057519D    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 005751A3    call        @IsClass
 005751A8    test        al,al
>005751AA    je          005751B7
 005751AC    mov         edx,esi
 005751AE    mov         eax,ebx
 005751B0    call        TControl.GetText
>005751B5    jmp         00575213
 005751B7    mov         eax,ebx
 005751B9    mov         edx,dword ptr ds:[4CA0EC];TTabSheet
 005751BF    call        @IsClass
 005751C4    test        al,al
>005751C6    je          005751D3
 005751C8    mov         edx,esi
 005751CA    mov         eax,ebx
 005751CC    call        TControl.GetText
>005751D1    jmp         00575213
 005751D3    mov         eax,ebx
 005751D5    mov         edx,dword ptr ds:[4C4DA0];TPanel
 005751DB    call        @IsClass
 005751E0    test        al,al
>005751E2    je          005751EF
 005751E4    mov         edx,esi
 005751E6    mov         eax,ebx
 005751E8    call        TControl.GetText
>005751ED    jmp         00575213
 005751EF    mov         eax,ebx
 005751F1    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 005751F7    call        @IsClass
 005751FC    test        al,al
>005751FE    je          0057520C
 00575200    mov         eax,esi
 00575202    mov         edx,dword ptr [ebx+4C]
 00575205    call        @UStrAsg
>0057520A    jmp         00575213
 0057520C    mov         eax,esi
 0057520E    call        @UStrClr
 00575213    pop         esi
 00575214    pop         ebx
 00575215    ret
end;*}

//00575218
{*procedure sub_00575218(?:?; ?:UnicodeString);
begin
 00575218    push        ebp
 00575219    mov         ebp,esp
 0057521B    push        ecx
 0057521C    push        ebx
 0057521D    mov         dword ptr [ebp-4],edx
 00575220    mov         ebx,eax
 00575222    mov         eax,dword ptr [ebp-4]
 00575225    call        @UStrAddRef
 0057522A    xor         eax,eax
 0057522C    push        ebp
 0057522D    push        57541D
 00575232    push        dword ptr fs:[eax]
 00575235    mov         dword ptr fs:[eax],esp
 00575238    mov         eax,ebx
 0057523A    mov         edx,dword ptr ds:[4E0C38];TForm
 00575240    call        @IsClass
 00575245    test        al,al
>00575247    je          00575258
 00575249    mov         edx,dword ptr [ebp-4]
 0057524C    mov         eax,ebx
 0057524E    call        TControl.SetText
>00575253    jmp         00575407
 00575258    mov         eax,ebx
 0057525A    mov         edx,dword ptr ds:[49F488];TMenuItem
 00575260    call        @IsClass
 00575265    test        al,al
>00575267    je          00575278
 00575269    mov         edx,dword ptr [ebp-4]
 0057526C    mov         eax,ebx
 0057526E    call        TMenuItem.SetCaption
>00575273    jmp         00575407
 00575278    mov         eax,ebx
 0057527A    mov         edx,dword ptr ds:[4ADEF4];TLabel
 00575280    call        @IsClass
 00575285    test        al,al
>00575287    je          00575298
 00575289    mov         edx,dword ptr [ebp-4]
 0057528C    mov         eax,ebx
 0057528E    call        TControl.SetText
>00575293    jmp         00575407
 00575298    mov         eax,ebx
 0057529A    mov         edx,dword ptr ds:[4B3A00];TButton
 005752A0    call        @IsClass
 005752A5    test        al,al
>005752A7    je          005752B8
 005752A9    mov         edx,dword ptr [ebp-4]
 005752AC    mov         eax,ebx
 005752AE    call        TControl.SetText
>005752B3    jmp         00575407
 005752B8    mov         eax,ebx
 005752BA    mov         edx,dword ptr ds:[4F3DB0];TBitBtn
 005752C0    call        @IsClass
 005752C5    test        al,al
>005752C7    je          005752D8
 005752C9    mov         edx,dword ptr [ebp-4]
 005752CC    mov         eax,ebx
 005752CE    call        TControl.SetText
>005752D3    jmp         00575407
 005752D8    mov         eax,ebx
 005752DA    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 005752E0    call        @IsClass
 005752E5    test        al,al
>005752E7    je          005752F8
 005752E9    mov         edx,dword ptr [ebp-4]
 005752EC    mov         eax,ebx
 005752EE    call        TControl.SetText
>005752F3    jmp         00575407
 005752F8    mov         eax,ebx
 005752FA    mov         edx,dword ptr ds:[4B4888];TCheckBox
 00575300    call        @IsClass
 00575305    test        al,al
>00575307    je          00575318
 00575309    mov         edx,dword ptr [ebp-4]
 0057530C    mov         eax,ebx
 0057530E    call        TControl.SetText
>00575313    jmp         00575407
 00575318    mov         eax,ebx
 0057531A    mov         edx,dword ptr ds:[4B5254];TRadioButton
 00575320    call        @IsClass
 00575325    test        al,al
>00575327    je          00575338
 00575329    mov         edx,dword ptr [ebp-4]
 0057532C    mov         eax,ebx
 0057532E    call        TControl.SetText
>00575333    jmp         00575407
 00575338    mov         eax,ebx
 0057533A    mov         edx,dword ptr ds:[4AD030];TGroupBox
 00575340    call        @IsClass
 00575345    test        al,al
>00575347    je          00575358
 00575349    mov         edx,dword ptr [ebp-4]
 0057534C    mov         eax,ebx
 0057534E    call        TControl.SetText
>00575353    jmp         00575407
 00575358    mov         eax,ebx
 0057535A    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00575360    call        @IsClass
 00575365    test        al,al
>00575367    je          00575378
 00575369    mov         edx,dword ptr [ebp-4]
 0057536C    mov         eax,ebx
 0057536E    call        TControl.SetText
>00575373    jmp         00575407
 00575378    mov         eax,ebx
 0057537A    mov         edx,dword ptr ds:[4C5EA0];TRadioGroup
 00575380    call        @IsClass
 00575385    test        al,al
>00575387    je          00575395
 00575389    mov         edx,dword ptr [ebp-4]
 0057538C    mov         eax,ebx
 0057538E    call        TControl.SetText
>00575393    jmp         00575407
 00575395    mov         eax,ebx
 00575397    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 0057539D    call        @IsClass
 005753A2    test        al,al
>005753A4    je          005753B2
 005753A6    mov         edx,dword ptr [ebp-4]
 005753A9    mov         eax,ebx
 005753AB    call        TControl.SetText
>005753B0    jmp         00575407
 005753B2    mov         eax,ebx
 005753B4    mov         edx,dword ptr ds:[4CA0EC];TTabSheet
 005753BA    call        @IsClass
 005753BF    test        al,al
>005753C1    je          005753CF
 005753C3    mov         edx,dword ptr [ebp-4]
 005753C6    mov         eax,ebx
 005753C8    call        TControl.SetText
>005753CD    jmp         00575407
 005753CF    mov         eax,ebx
 005753D1    mov         edx,dword ptr ds:[4C4DA0];TPanel
 005753D7    call        @IsClass
 005753DC    test        al,al
>005753DE    je          005753EC
 005753E0    mov         edx,dword ptr [ebp-4]
 005753E3    mov         eax,ebx
 005753E5    call        TControl.SetText
>005753EA    jmp         00575407
 005753EC    mov         eax,ebx
 005753EE    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 005753F4    call        @IsClass
 005753F9    test        al,al
>005753FB    je          00575407
 005753FD    mov         edx,dword ptr [ebp-4]
 00575400    mov         eax,ebx
 00575402    call        00574600
 00575407    xor         eax,eax
 00575409    pop         edx
 0057540A    pop         ecx
 0057540B    pop         ecx
 0057540C    mov         dword ptr fs:[eax],edx
 0057540F    push        575424
 00575414    lea         eax,[ebp-4]
 00575417    call        @UStrClr
 0057541C    ret
>0057541D    jmp         @HandleFinally
>00575422    jmp         00575414
 00575424    pop         ebx
 00575425    pop         ecx
 00575426    pop         ebp
 00575427    ret
end;*}

//00575428
{*procedure sub_00575428(?:UString; ?:?);
begin
 00575428    push        ebp
 00575429    mov         ebp,esp
 0057542B    xor         ecx,ecx
 0057542D    push        ecx
 0057542E    push        ecx
 0057542F    push        ecx
 00575430    push        ecx
 00575431    push        ecx
 00575432    push        ecx
 00575433    push        ebx
 00575434    push        esi
 00575435    push        edi
 00575436    mov         esi,edx
 00575438    mov         dword ptr [ebp-4],eax
 0057543B    mov         eax,dword ptr [ebp-4]
 0057543E    call        @UStrAddRef
 00575443    xor         eax,eax
 00575445    push        ebp
 00575446    push        575508
 0057544B    push        dword ptr fs:[eax]
 0057544E    mov         dword ptr fs:[eax],esp
 00575451    cmp         dword ptr ds:[815540],0;gvar_00815540:TStringList
>00575458    je          00575474
 0057545A    cmp         dword ptr ds:[815544],0;gvar_00815544:TStringList
>00575461    je          00575474
 00575463    lea         edx,[ebp-8]
 00575466    mov         eax,dword ptr [ebp-4]
 00575469    call        Trim
 0057546E    cmp         dword ptr [ebp-8],0
>00575472    jne         00575480
 00575474    mov         eax,esi
 00575476    mov         edx,dword ptr [ebp-4]
 00575479    call        @UStrAsg
>0057547E    jmp         005754ED
 00575480    lea         edx,[ebp-0C]
 00575483    mov         eax,dword ptr [ebp-4]
 00575486    call        005747EC
 0057548B    mov         edx,dword ptr [ebp-0C]
 0057548E    lea         eax,[ebp-4]
 00575491    call        @UStrLAsg
 00575496    mov         edx,dword ptr [ebp-4]
 00575499    mov         eax,[00815540];gvar_00815540:TStringList
 0057549E    mov         ecx,dword ptr [eax]
 005754A0    call        dword ptr [ecx+54]
 005754A3    mov         ebx,eax
 005754A5    test        ebx,ebx
>005754A7    jl          005754E3
 005754A9    lea         ecx,[ebp-14]
 005754AC    mov         edx,ebx
 005754AE    mov         eax,[00815544];gvar_00815544:TStringList
 005754B3    mov         edi,dword ptr [eax]
 005754B5    call        dword ptr [edi+0C]
 005754B8    mov         eax,dword ptr [ebp-14]
 005754BB    lea         edx,[ebp-10]
 005754BE    call        005747EC
 005754C3    cmp         dword ptr [ebp-10],0
>005754C7    je          005754E3
 005754C9    lea         ecx,[ebp-18]
 005754CC    mov         edx,ebx
 005754CE    mov         eax,[00815544];gvar_00815544:TStringList
 005754D3    mov         ebx,dword ptr [eax]
 005754D5    call        dword ptr [ebx+0C]
 005754D8    mov         eax,dword ptr [ebp-18]
 005754DB    lea         edx,[ebp-4]
 005754DE    call        005747EC
 005754E3    mov         eax,esi
 005754E5    mov         edx,dword ptr [ebp-4]
 005754E8    call        @UStrAsg
 005754ED    xor         eax,eax
 005754EF    pop         edx
 005754F0    pop         ecx
 005754F1    pop         ecx
 005754F2    mov         dword ptr fs:[eax],edx
 005754F5    push        57550F
 005754FA    lea         eax,[ebp-18]
 005754FD    mov         edx,6
 00575502    call        @UStrArrayClr
 00575507    ret
>00575508    jmp         @HandleFinally
>0057550D    jmp         005754FA
 0057550F    pop         edi
 00575510    pop         esi
 00575511    pop         ebx
 00575512    mov         esp,ebp
 00575514    pop         ebp
 00575515    ret
end;*}

//00575518
{*procedure sub_00575518(?:UString; ?:?);
begin
 00575518    push        ebp
 00575519    mov         ebp,esp
 0057551B    xor         ecx,ecx
 0057551D    push        ecx
 0057551E    push        ecx
 0057551F    push        ecx
 00575520    push        ecx
 00575521    push        ecx
 00575522    push        ecx
 00575523    push        ebx
 00575524    push        esi
 00575525    push        edi
 00575526    mov         esi,edx
 00575528    mov         dword ptr [ebp-4],eax
 0057552B    mov         eax,dword ptr [ebp-4]
 0057552E    call        @UStrAddRef
 00575533    xor         eax,eax
 00575535    push        ebp
 00575536    push        5755F8
 0057553B    push        dword ptr fs:[eax]
 0057553E    mov         dword ptr fs:[eax],esp
 00575541    cmp         dword ptr ds:[815540],0;gvar_00815540:TStringList
>00575548    je          00575564
 0057554A    cmp         dword ptr ds:[815544],0;gvar_00815544:TStringList
>00575551    je          00575564
 00575553    lea         edx,[ebp-8]
 00575556    mov         eax,dword ptr [ebp-4]
 00575559    call        Trim
 0057555E    cmp         dword ptr [ebp-8],0
>00575562    jne         00575570
 00575564    mov         eax,esi
 00575566    mov         edx,dword ptr [ebp-4]
 00575569    call        @UStrAsg
>0057556E    jmp         005755DD
 00575570    lea         edx,[ebp-0C]
 00575573    mov         eax,dword ptr [ebp-4]
 00575576    call        005747EC
 0057557B    mov         edx,dword ptr [ebp-0C]
 0057557E    lea         eax,[ebp-4]
 00575581    call        @UStrLAsg
 00575586    mov         edx,dword ptr [ebp-4]
 00575589    mov         eax,[00815544];gvar_00815544:TStringList
 0057558E    mov         ecx,dword ptr [eax]
 00575590    call        dword ptr [ecx+54]
 00575593    mov         ebx,eax
 00575595    test        ebx,ebx
>00575597    jl          005755D3
 00575599    lea         ecx,[ebp-14]
 0057559C    mov         edx,ebx
 0057559E    mov         eax,[00815540];gvar_00815540:TStringList
 005755A3    mov         edi,dword ptr [eax]
 005755A5    call        dword ptr [edi+0C]
 005755A8    mov         eax,dword ptr [ebp-14]
 005755AB    lea         edx,[ebp-10]
 005755AE    call        005747EC
 005755B3    cmp         dword ptr [ebp-10],0
>005755B7    je          005755D3
 005755B9    lea         ecx,[ebp-18]
 005755BC    mov         edx,ebx
 005755BE    mov         eax,[00815540];gvar_00815540:TStringList
 005755C3    mov         ebx,dword ptr [eax]
 005755C5    call        dword ptr [ebx+0C]
 005755C8    mov         eax,dword ptr [ebp-18]
 005755CB    lea         edx,[ebp-4]
 005755CE    call        005747EC
 005755D3    mov         eax,esi
 005755D5    mov         edx,dword ptr [ebp-4]
 005755D8    call        @UStrAsg
 005755DD    xor         eax,eax
 005755DF    pop         edx
 005755E0    pop         ecx
 005755E1    pop         ecx
 005755E2    mov         dword ptr fs:[eax],edx
 005755E5    push        5755FF
 005755EA    lea         eax,[ebp-18]
 005755ED    mov         edx,6
 005755F2    call        @UStrArrayClr
 005755F7    ret
>005755F8    jmp         @HandleFinally
>005755FD    jmp         005755EA
 005755FF    pop         edi
 00575600    pop         esi
 00575601    pop         ebx
 00575602    mov         esp,ebp
 00575604    pop         ebp
 00575605    ret
end;*}

//00575608
{*procedure sub_00575608(?:UnicodeString; ?:?);
begin
 00575608    push        ebx
 00575609    push        esi
 0057560A    push        edi
 0057560B    push        ebp
 0057560C    add         esp,0FFFFFFBC
 0057560F    mov         ebp,edx
 00575611    mov         ebx,eax
 00575613    mov         esi,dword ptr [ebx]
 00575615    mov         eax,esi
 00575617    mov         dword ptr [esp+40],eax
 0057561B    mov         eax,dword ptr [esp+40]
 0057561F    test        eax,eax
>00575621    je          00575628
 00575623    sub         eax,4
 00575626    mov         eax,dword ptr [eax]
 00575628    dec         eax
>00575629    jg          0057562F
 0057562B    mov         al,1
>0057562D    jmp         0057563E
 0057562F    mov         eax,dword ptr [ebx]
 00575631    mov         edx,5758F8;'P5'
 00575636    call        @UStrEqual
 0057563B    sete        al
 0057563E    test        al,al
>00575640    je          00575646
 00575642    mov         al,1
>00575644    jmp         00575655
 00575646    mov         eax,dword ptr [ebx]
 00575648    mov         edx,57590C;'p5'
 0057564D    call        @UStrEqual
 00575652    sete        al
 00575655    test        al,al
>00575657    je          00575665
 00575659    mov         eax,ebp
 0057565B    call        @UStrClr
>00575660    jmp         005758E1
 00575665    mov         eax,esi
 00575667    mov         dword ptr [esp+40],eax
 0057566B    mov         eax,dword ptr [esp+40]
 0057566F    test        eax,eax
>00575671    je          00575678
 00575673    sub         eax,4
 00575676    mov         eax,dword ptr [eax]
 00575678    mov         esi,eax
 0057567A    xor         edi,edi
>0057567C    jmp         00575680
 0057567E    inc         edi
 0057567F    dec         esi
 00575680    test        esi,esi
>00575682    jle         00575699
 00575684    mov         edx,575914
 00575689    mov         eax,dword ptr [ebx]
 0057568B    movzx       eax,word ptr [eax+esi*2-2]
 00575690    call        CharInSet
 00575695    test        al,al
>00575697    jne         0057567E
 00575699    mov         edx,dword ptr [ebx]
 0057569B    mov         eax,edx
 0057569D    mov         dword ptr [esp+40],eax
 005756A1    mov         eax,dword ptr [esp+40]
 005756A5    test        eax,eax
>005756A7    je          005756AE
 005756A9    sub         eax,4
 005756AC    mov         eax,dword ptr [eax]
 005756AE    cmp         eax,edi
>005756B0    jne         005756B6
 005756B2    mov         al,1
>005756B4    jmp         00575709
 005756B6    mov         dword ptr [esp],edx
 005756B9    mov         eax,dword ptr [esp]
 005756BC    test        eax,eax
>005756BE    je          005756C5
 005756C0    sub         eax,4
 005756C3    mov         eax,dword ptr [eax]
 005756C5    lea         ecx,[edi+1]
 005756C8    cmp         eax,ecx
>005756CA    jne         00575707
 005756CC    mov         eax,dword ptr [ebx]
 005756CE    movzx       eax,word ptr [eax]
 005756D1    mov         word ptr [esp+4],ax
 005756D6    movzx       eax,word ptr [esp+4]
 005756DB    mov         word ptr [esp+6],ax
 005756E0    movzx       eax,word ptr [esp+4]
 005756E5    add         eax,0FFFFFF9F
 005756E8    sub         ax,1A
>005756EC    jae         005756FC
 005756EE    movzx       eax,word ptr [esp+4]
 005756F3    and         ax,0FFDF
 005756F7    mov         word ptr [esp+6],ax
 005756FC    cmp         word ptr [esp+6],46
 00575702    sete        al
>00575705    jmp         00575709
 00575707    xor         eax,eax
 00575709    test        al,al
>0057570B    je          00575719
 0057570D    mov         eax,ebp
 0057570F    call        @UStrClr
>00575714    jmp         005758E1
 00575719    cmp         edi,2
>0057571C    jl          0057577D
 0057571E    mov         dword ptr [esp+8],edx
 00575722    mov         eax,dword ptr [esp+8]
 00575726    test        eax,eax
>00575728    je          0057572F
 0057572A    sub         eax,4
 0057572D    mov         eax,dword ptr [eax]
 0057572F    sub         eax,edi
 00575731    dec         eax
>00575732    jl          0057577D
 00575734    mov         dword ptr [esp+0C],edx
 00575738    mov         esi,dword ptr [esp+0C]
 0057573C    test        esi,esi
>0057573E    je          00575745
 00575740    sub         esi,4
 00575743    mov         esi,dword ptr [esi]
 00575745    push        ebp
 00575746    mov         edx,esi
 00575748    sub         edx,edi
 0057574A    inc         edx
 0057574B    mov         eax,dword ptr [ebx]
 0057574D    mov         ecx,edi
 0057574F    call        @UStrCopy
 00575754    mov         eax,dword ptr [ebx]
 00575756    mov         dword ptr [esp+10],eax
 0057575A    mov         esi,dword ptr [esp+10]
 0057575E    test        esi,esi
>00575760    je          00575767
 00575762    sub         esi,4
 00575765    mov         esi,dword ptr [esi]
 00575767    push        ebx
 00575768    mov         ecx,esi
 0057576A    sub         ecx,edi
 0057576C    mov         eax,dword ptr [ebx]
 0057576E    mov         edx,1
 00575773    call        @UStrCopy
>00575778    jmp         005758E1
 0057577D    mov         eax,dword ptr [ebx]
 0057577F    mov         edx,eax
 00575781    mov         dword ptr [esp+40],edx
 00575785    mov         edx,dword ptr [esp+40]
 00575789    test        edx,edx
>0057578B    je          00575792
 0057578D    sub         edx,4
 00575790    mov         edx,dword ptr [edx]
 00575792    cmp         edx,3
>00575795    jl          005757E1
 00575797    mov         dword ptr [esp+14],eax
 0057579B    mov         edx,dword ptr [esp+14]
 0057579F    test        edx,edx
>005757A1    je          005757A8
 005757A3    sub         edx,4
 005757A6    mov         edx,dword ptr [edx]
 005757A8    mov         ecx,dword ptr [ebx]
 005757AA    movzx       edx,word ptr [ecx+edx*2-4]
 005757AF    mov         word ptr [esp+18],dx
 005757B4    mov         edx,575914
 005757B9    mov         dword ptr [esp+1C],edx
 005757BD    mov         edx,dword ptr [esp+1C]
 005757C1    movzx       ecx,word ptr [esp+18]
 005757C6    cmp         cx,0FF
>005757CB    ja          005757D3
 005757CD    movzx       ecx,cx
 005757D0    bt          dword ptr [edx],ecx
 005757D3    setb        dl
 005757D6    mov         byte ptr [esp+20],dl
 005757DA    movzx       edx,byte ptr [esp+20]
>005757DF    jmp         005757E3
 005757E1    xor         edx,edx
 005757E3    test        dl,dl
>005757E5    je          0057588E
 005757EB    mov         dword ptr [esp+24],eax
 005757EF    mov         edx,dword ptr [esp+24]
 005757F3    test        edx,edx
>005757F5    je          005757FC
 005757F7    sub         edx,4
 005757FA    mov         edx,dword ptr [edx]
 005757FC    mov         ecx,dword ptr [ebx]
 005757FE    movzx       edx,word ptr [ecx+edx*2-2]
 00575803    mov         word ptr [esp+28],dx
 00575808    mov         edx,575934
 0057580D    mov         dword ptr [esp+2C],edx
 00575811    mov         edx,dword ptr [esp+2C]
 00575815    movzx       ecx,word ptr [esp+28]
 0057581A    cmp         cx,0FF
>0057581F    ja          00575827
 00575821    movzx       ecx,cx
 00575824    bt          dword ptr [edx],ecx
 00575827    setb        dl
 0057582A    mov         byte ptr [esp+30],dl
 0057582E    cmp         byte ptr [esp+30],0
>00575833    je          0057588E
 00575835    mov         dword ptr [esp+34],eax
 00575839    mov         esi,dword ptr [esp+34]
 0057583D    test        esi,esi
>0057583F    je          00575846
 00575841    sub         esi,4
 00575844    mov         esi,dword ptr [esi]
 00575846    push        ebp
 00575847    mov         edx,esi
 00575849    dec         edx
 0057584A    mov         eax,dword ptr [ebx]
 0057584C    mov         ecx,2
 00575851    call        @UStrCopy
 00575856    mov         eax,dword ptr [ebx]
 00575858    mov         dword ptr [esp+38],eax
 0057585C    mov         eax,dword ptr [esp+38]
 00575860    mov         dword ptr [esp+3C],eax
 00575864    cmp         dword ptr [esp+3C],0
>00575869    je          00575878
 0057586B    mov         eax,dword ptr [esp+3C]
 0057586F    sub         eax,4
 00575872    mov         eax,dword ptr [eax]
 00575874    mov         dword ptr [esp+3C],eax
 00575878    push        ebx
 00575879    mov         ecx,dword ptr [esp+40]
 0057587D    sub         ecx,2
 00575880    mov         eax,dword ptr [ebx]
 00575882    mov         edx,1
 00575887    call        @UStrCopy
>0057588C    jmp         005758E1
 0057588E    test        edi,edi
>00575890    jne         0057589B
 00575892    mov         eax,ebp
 00575894    call        @UStrClr
>00575899    jmp         005758E1
 0057589B    mov         eax,dword ptr [ebx]
 0057589D    mov         dword ptr [esp+40],eax
 005758A1    mov         esi,dword ptr [esp+40]
 005758A5    test        esi,esi
>005758A7    je          005758AE
 005758A9    sub         esi,4
 005758AC    mov         esi,dword ptr [esi]
 005758AE    push        ebp
 005758AF    mov         edx,esi
 005758B1    sub         edx,edi
 005758B3    inc         edx
 005758B4    mov         eax,dword ptr [ebx]
 005758B6    mov         ecx,edi
 005758B8    call        @UStrCopy
 005758BD    mov         eax,dword ptr [ebx]
 005758BF    mov         dword ptr [esp+40],eax
 005758C3    mov         esi,dword ptr [esp+40]
 005758C7    test        esi,esi
>005758C9    je          005758D0
 005758CB    sub         esi,4
 005758CE    mov         esi,dword ptr [esi]
 005758D0    push        ebx
 005758D1    mov         ecx,esi
 005758D3    sub         ecx,edi
 005758D5    mov         eax,dword ptr [ebx]
 005758D7    mov         edx,1
 005758DC    call        @UStrCopy
 005758E1    add         esp,44
 005758E4    pop         ebp
 005758E5    pop         edi
 005758E6    pop         esi
 005758E7    pop         ebx
 005758E8    ret
end;*}

//00575954
{*procedure sub_00575954(?:UnicodeString; ?:?);
begin
 00575954    push        ebp
 00575955    mov         ebp,esp
 00575957    add         esp,0FFFFFFF4
 0057595A    push        ebx
 0057595B    push        esi
 0057595C    push        edi
 0057595D    xor         ecx,ecx
 0057595F    mov         dword ptr [ebp-8],ecx
 00575962    mov         dword ptr [ebp-4],edx
 00575965    mov         ebx,eax
 00575967    xor         eax,eax
 00575969    push        ebp
 0057596A    push        575A1C
 0057596F    push        dword ptr fs:[eax]
 00575972    mov         dword ptr fs:[eax],esp
 00575975    cmp         dword ptr [ebx],0
>00575978    je          00575993
 0057597A    lea         edx,[ebp-8]
 0057597D    mov         eax,dword ptr [ebx]
 0057597F    call        UpperCase
 00575984    mov         eax,dword ptr [ebp-8]
 00575987    mov         edx,575A38;'5DT'
 0057598C    call        @UStrEqual
>00575991    jne         0057599D
 00575993    mov         eax,dword ptr [ebp-4]
 00575996    call        @UStrClr
>0057599B    jmp         00575A06
 0057599D    mov         esi,1
 005759A2    xor         edi,edi
>005759A4    jmp         005759A8
 005759A6    inc         edi
 005759A7    inc         esi
 005759A8    mov         eax,dword ptr [ebx]
 005759AA    call        @UStrLen
 005759AF    cmp         esi,eax
>005759B1    jg          005759C8
 005759B3    mov         edx,575A40
 005759B8    mov         eax,dword ptr [ebx]
 005759BA    movzx       eax,word ptr [eax+esi*2-2]
 005759BF    call        CharInSet
 005759C4    test        al,al
>005759C6    jne         005759A6
 005759C8    test        edi,edi
>005759CA    jne         005759D6
 005759CC    mov         eax,dword ptr [ebp-4]
 005759CF    call        @UStrClr
>005759D4    jmp         00575A06
 005759D6    mov         eax,dword ptr [ebp-4]
 005759D9    push        eax
 005759DA    mov         eax,dword ptr [ebx]
 005759DC    mov         ecx,edi
 005759DE    mov         edx,1
 005759E3    call        @UStrCopy
 005759E8    mov         eax,dword ptr [ebx]
 005759EA    mov         dword ptr [ebp-0C],eax
 005759ED    mov         esi,dword ptr [ebp-0C]
 005759F0    test        esi,esi
>005759F2    je          005759F9
 005759F4    sub         esi,4
 005759F7    mov         esi,dword ptr [esi]
 005759F9    push        ebx
 005759FA    lea         edx,[edi+1]
 005759FD    mov         eax,dword ptr [ebx]
 005759FF    mov         ecx,esi
 00575A01    call        @UStrCopy
 00575A06    xor         eax,eax
 00575A08    pop         edx
 00575A09    pop         ecx
 00575A0A    pop         ecx
 00575A0B    mov         dword ptr fs:[eax],edx
 00575A0E    push        575A23
 00575A13    lea         eax,[ebp-8]
 00575A16    call        @UStrClr
 00575A1B    ret
>00575A1C    jmp         @HandleFinally
>00575A21    jmp         00575A13
 00575A23    pop         edi
 00575A24    pop         esi
 00575A25    pop         ebx
 00575A26    mov         esp,ebp
 00575A28    pop         ebp
 00575A29    ret
end;*}

//00575A60
procedure sub_00575A60(?:UnicodeString; ?:UnicodeString);
begin
{*
 00575A60    push        ebp
 00575A61    mov         ebp,esp
 00575A63    mov         ecx,8
 00575A68    push        0
 00575A6A    push        0
 00575A6C    dec         ecx
>00575A6D    jne         00575A68
 00575A6F    push        ecx
 00575A70    push        ebx
 00575A71    push        esi
 00575A72    mov         dword ptr [ebp-10],edx
 00575A75    mov         dword ptr [ebp-4],eax
 00575A78    mov         eax,dword ptr [ebp-4]
 00575A7B    call        @UStrAddRef
 00575A80    xor         eax,eax
 00575A82    push        ebp
 00575A83    push        575C71
 00575A88    push        dword ptr fs:[eax]
 00575A8B    mov         dword ptr fs:[eax],esp
 00575A8E    cmp         dword ptr ds:[815548],0;gvar_00815548:TStringList
>00575A95    je          00575AB1
 00575A97    cmp         dword ptr ds:[81554C],0;gvar_0081554C:TStringList
>00575A9E    je          00575AB1
 00575AA0    lea         edx,[ebp-14]
 00575AA3    mov         eax,dword ptr [ebp-4]
 00575AA6    call        Trim
 00575AAB    cmp         dword ptr [ebp-14],0
>00575AAF    jne         00575AC1
 00575AB1    mov         eax,dword ptr [ebp-10]
 00575AB4    mov         edx,dword ptr [ebp-4]
 00575AB7    call        @UStrAsg
>00575ABC    jmp         00575C49
 00575AC1    lea         edx,[ebp-18]
 00575AC4    mov         eax,dword ptr [ebp-4]
 00575AC7    call        005747EC
 00575ACC    mov         edx,dword ptr [ebp-18]
 00575ACF    lea         eax,[ebp-4]
 00575AD2    call        @UStrLAsg
 00575AD7    mov         edx,dword ptr [ebp-4]
 00575ADA    mov         eax,575C8C;'.'
 00575ADF    call        Pos
 00575AE4    test        eax,eax
>00575AE6    jle         00575B5B
 00575AE8    mov         edx,dword ptr [ebp-4]
 00575AEB    mov         eax,575C8C;'.'
 00575AF0    call        Pos
 00575AF5    mov         ebx,eax
 00575AF7    mov         esi,dword ptr [ebp-4]
 00575AFA    test        esi,esi
>00575AFC    je          00575B03
 00575AFE    sub         esi,4
 00575B01    mov         esi,dword ptr [esi]
 00575B03    lea         eax,[ebp-20]
 00575B06    push        eax
 00575B07    mov         ecx,ebx
 00575B09    dec         ecx
 00575B0A    mov         edx,1
 00575B0F    mov         eax,dword ptr [ebp-4]
 00575B12    call        @UStrCopy
 00575B17    mov         eax,dword ptr [ebp-20]
 00575B1A    lea         edx,[ebp-1C]
 00575B1D    call        00575A60
 00575B22    push        dword ptr [ebp-1C]
 00575B25    push        575C8C;'.'
 00575B2A    lea         eax,[ebp-28]
 00575B2D    push        eax
 00575B2E    lea         edx,[ebx+1]
 00575B31    mov         ecx,esi
 00575B33    mov         eax,dword ptr [ebp-4]
 00575B36    call        @UStrCopy
 00575B3B    mov         eax,dword ptr [ebp-28]
 00575B3E    lea         edx,[ebp-24]
 00575B41    call        00575A60
 00575B46    push        dword ptr [ebp-24]
 00575B49    mov         eax,dword ptr [ebp-10]
 00575B4C    mov         edx,3
 00575B51    call        @UStrCatN
>00575B56    jmp         00575C49
 00575B5B    mov         edx,dword ptr [ebp-4]
 00575B5E    mov         eax,[00815548];gvar_00815548:TStringList
 00575B63    mov         ecx,dword ptr [eax]
 00575B65    call        dword ptr [ecx+54]
 00575B68    mov         ebx,eax
 00575B6A    test        ebx,ebx
>00575B6C    jl          00575BAD
 00575B6E    lea         ecx,[ebp-30]
 00575B71    mov         edx,ebx
 00575B73    mov         eax,[0081554C];gvar_0081554C:TStringList
 00575B78    mov         esi,dword ptr [eax]
 00575B7A    call        dword ptr [esi+0C]
 00575B7D    mov         eax,dword ptr [ebp-30]
 00575B80    lea         edx,[ebp-2C]
 00575B83    call        005747EC
 00575B88    cmp         dword ptr [ebp-2C],0
>00575B8C    je          00575BAD
 00575B8E    lea         ecx,[ebp-34]
 00575B91    mov         edx,ebx
 00575B93    mov         eax,[0081554C];gvar_0081554C:TStringList
 00575B98    mov         ebx,dword ptr [eax]
 00575B9A    call        dword ptr [ebx+0C]
 00575B9D    mov         eax,dword ptr [ebp-34]
 00575BA0    lea         edx,[ebp-4]
 00575BA3    call        005747EC
>00575BA8    jmp         00575C3E
 00575BAD    lea         edx,[ebp-8]
 00575BB0    lea         eax,[ebp-4]
 00575BB3    call        00575608
 00575BB8    lea         edx,[ebp-0C]
 00575BBB    lea         eax,[ebp-4]
 00575BBE    call        00575954
 00575BC3    mov         edx,dword ptr [ebp-4]
 00575BC6    mov         eax,[00815548];gvar_00815548:TStringList
 00575BCB    mov         ecx,dword ptr [eax]
 00575BCD    call        dword ptr [ecx+54]
 00575BD0    mov         ebx,eax
 00575BD2    test        ebx,ebx
>00575BD4    jl          00575C28
 00575BD6    lea         ecx,[ebp-3C]
 00575BD9    mov         edx,ebx
 00575BDB    mov         eax,[0081554C];gvar_0081554C:TStringList
 00575BE0    mov         esi,dword ptr [eax]
 00575BE2    call        dword ptr [esi+0C]
 00575BE5    mov         eax,dword ptr [ebp-3C]
 00575BE8    lea         edx,[ebp-38]
 00575BEB    call        005747EC
 00575BF0    cmp         dword ptr [ebp-38],0
>00575BF4    je          00575C28
 00575BF6    push        dword ptr [ebp-0C]
 00575BF9    lea         ecx,[ebp-44]
 00575BFC    mov         edx,ebx
 00575BFE    mov         eax,[0081554C];gvar_0081554C:TStringList
 00575C03    mov         ebx,dword ptr [eax]
 00575C05    call        dword ptr [ebx+0C]
 00575C08    mov         eax,dword ptr [ebp-44]
 00575C0B    lea         edx,[ebp-40]
 00575C0E    call        005747EC
 00575C13    push        dword ptr [ebp-40]
 00575C16    push        dword ptr [ebp-8]
 00575C19    lea         eax,[ebp-4]
 00575C1C    mov         edx,3
 00575C21    call        @UStrCatN
>00575C26    jmp         00575C3E
 00575C28    push        dword ptr [ebp-0C]
 00575C2B    push        dword ptr [ebp-4]
 00575C2E    push        dword ptr [ebp-8]
 00575C31    lea         eax,[ebp-4]
 00575C34    mov         edx,3
 00575C39    call        @UStrCatN
 00575C3E    mov         eax,dword ptr [ebp-10]
 00575C41    mov         edx,dword ptr [ebp-4]
 00575C44    call        @UStrAsg
 00575C49    xor         eax,eax
 00575C4B    pop         edx
 00575C4C    pop         ecx
 00575C4D    pop         ecx
 00575C4E    mov         dword ptr fs:[eax],edx
 00575C51    push        575C78
 00575C56    lea         eax,[ebp-44]
 00575C59    mov         edx,0D
 00575C5E    call        @UStrArrayClr
 00575C63    lea         eax,[ebp-0C]
 00575C66    mov         edx,3
 00575C6B    call        @UStrArrayClr
 00575C70    ret
>00575C71    jmp         @HandleFinally
>00575C76    jmp         00575C56
 00575C78    pop         esi
 00575C79    pop         ebx
 00575C7A    mov         esp,ebp
 00575C7C    pop         ebp
 00575C7D    ret
*}
end;

//00575C90
{*procedure sub_00575C90(?:UnicodeString; ?:?);
begin
 00575C90    push        ebp
 00575C91    mov         ebp,esp
 00575C93    mov         ecx,8
 00575C98    push        0
 00575C9A    push        0
 00575C9C    dec         ecx
>00575C9D    jne         00575C98
 00575C9F    push        ecx
 00575CA0    push        ebx
 00575CA1    push        esi
 00575CA2    mov         dword ptr [ebp-10],edx
 00575CA5    mov         dword ptr [ebp-4],eax
 00575CA8    mov         eax,dword ptr [ebp-4]
 00575CAB    call        @UStrAddRef
 00575CB0    xor         eax,eax
 00575CB2    push        ebp
 00575CB3    push        575EA1
 00575CB8    push        dword ptr fs:[eax]
 00575CBB    mov         dword ptr fs:[eax],esp
 00575CBE    cmp         dword ptr ds:[815548],0;gvar_00815548:TStringList
>00575CC5    je          00575CE1
 00575CC7    cmp         dword ptr ds:[81554C],0;gvar_0081554C:TStringList
>00575CCE    je          00575CE1
 00575CD0    lea         edx,[ebp-14]
 00575CD3    mov         eax,dword ptr [ebp-4]
 00575CD6    call        Trim
 00575CDB    cmp         dword ptr [ebp-14],0
>00575CDF    jne         00575CF1
 00575CE1    mov         eax,dword ptr [ebp-10]
 00575CE4    mov         edx,dword ptr [ebp-4]
 00575CE7    call        @UStrAsg
>00575CEC    jmp         00575E79
 00575CF1    lea         edx,[ebp-18]
 00575CF4    mov         eax,dword ptr [ebp-4]
 00575CF7    call        005747EC
 00575CFC    mov         edx,dword ptr [ebp-18]
 00575CFF    lea         eax,[ebp-4]
 00575D02    call        @UStrLAsg
 00575D07    mov         edx,dword ptr [ebp-4]
 00575D0A    mov         eax,575EBC;'.'
 00575D0F    call        Pos
 00575D14    test        eax,eax
>00575D16    jle         00575D8B
 00575D18    mov         edx,dword ptr [ebp-4]
 00575D1B    mov         eax,575EBC;'.'
 00575D20    call        Pos
 00575D25    mov         ebx,eax
 00575D27    mov         esi,dword ptr [ebp-4]
 00575D2A    test        esi,esi
>00575D2C    je          00575D33
 00575D2E    sub         esi,4
 00575D31    mov         esi,dword ptr [esi]
 00575D33    lea         eax,[ebp-20]
 00575D36    push        eax
 00575D37    mov         ecx,ebx
 00575D39    dec         ecx
 00575D3A    mov         edx,1
 00575D3F    mov         eax,dword ptr [ebp-4]
 00575D42    call        @UStrCopy
 00575D47    mov         eax,dword ptr [ebp-20]
 00575D4A    lea         edx,[ebp-1C]
 00575D4D    call        00575C90
 00575D52    push        dword ptr [ebp-1C]
 00575D55    push        575EBC;'.'
 00575D5A    lea         eax,[ebp-28]
 00575D5D    push        eax
 00575D5E    lea         edx,[ebx+1]
 00575D61    mov         ecx,esi
 00575D63    mov         eax,dword ptr [ebp-4]
 00575D66    call        @UStrCopy
 00575D6B    mov         eax,dword ptr [ebp-28]
 00575D6E    lea         edx,[ebp-24]
 00575D71    call        00575C90
 00575D76    push        dword ptr [ebp-24]
 00575D79    mov         eax,dword ptr [ebp-10]
 00575D7C    mov         edx,3
 00575D81    call        @UStrCatN
>00575D86    jmp         00575E79
 00575D8B    mov         edx,dword ptr [ebp-4]
 00575D8E    mov         eax,[0081554C];gvar_0081554C:TStringList
 00575D93    mov         ecx,dword ptr [eax]
 00575D95    call        dword ptr [ecx+54]
 00575D98    mov         ebx,eax
 00575D9A    test        ebx,ebx
>00575D9C    jl          00575DDD
 00575D9E    lea         ecx,[ebp-30]
 00575DA1    mov         edx,ebx
 00575DA3    mov         eax,[00815548];gvar_00815548:TStringList
 00575DA8    mov         esi,dword ptr [eax]
 00575DAA    call        dword ptr [esi+0C]
 00575DAD    mov         eax,dword ptr [ebp-30]
 00575DB0    lea         edx,[ebp-2C]
 00575DB3    call        005747EC
 00575DB8    cmp         dword ptr [ebp-2C],0
>00575DBC    je          00575DDD
 00575DBE    lea         ecx,[ebp-34]
 00575DC1    mov         edx,ebx
 00575DC3    mov         eax,[00815548];gvar_00815548:TStringList
 00575DC8    mov         ebx,dword ptr [eax]
 00575DCA    call        dword ptr [ebx+0C]
 00575DCD    mov         eax,dword ptr [ebp-34]
 00575DD0    lea         edx,[ebp-4]
 00575DD3    call        005747EC
>00575DD8    jmp         00575E6E
 00575DDD    lea         edx,[ebp-0C]
 00575DE0    lea         eax,[ebp-4]
 00575DE3    call        00575608
 00575DE8    lea         edx,[ebp-8]
 00575DEB    lea         eax,[ebp-4]
 00575DEE    call        00575954
 00575DF3    mov         edx,dword ptr [ebp-4]
 00575DF6    mov         eax,[0081554C];gvar_0081554C:TStringList
 00575DFB    mov         ecx,dword ptr [eax]
 00575DFD    call        dword ptr [ecx+54]
 00575E00    mov         ebx,eax
 00575E02    test        ebx,ebx
>00575E04    jl          00575E58
 00575E06    lea         ecx,[ebp-3C]
 00575E09    mov         edx,ebx
 00575E0B    mov         eax,[00815548];gvar_00815548:TStringList
 00575E10    mov         esi,dword ptr [eax]
 00575E12    call        dword ptr [esi+0C]
 00575E15    mov         eax,dword ptr [ebp-3C]
 00575E18    lea         edx,[ebp-38]
 00575E1B    call        005747EC
 00575E20    cmp         dword ptr [ebp-38],0
>00575E24    je          00575E58
 00575E26    push        dword ptr [ebp-8]
 00575E29    lea         ecx,[ebp-44]
 00575E2C    mov         edx,ebx
 00575E2E    mov         eax,[00815548];gvar_00815548:TStringList
 00575E33    mov         ebx,dword ptr [eax]
 00575E35    call        dword ptr [ebx+0C]
 00575E38    mov         eax,dword ptr [ebp-44]
 00575E3B    lea         edx,[ebp-40]
 00575E3E    call        005747EC
 00575E43    push        dword ptr [ebp-40]
 00575E46    push        dword ptr [ebp-0C]
 00575E49    lea         eax,[ebp-4]
 00575E4C    mov         edx,3
 00575E51    call        @UStrCatN
>00575E56    jmp         00575E6E
 00575E58    push        dword ptr [ebp-8]
 00575E5B    push        dword ptr [ebp-4]
 00575E5E    push        dword ptr [ebp-0C]
 00575E61    lea         eax,[ebp-4]
 00575E64    mov         edx,3
 00575E69    call        @UStrCatN
 00575E6E    mov         eax,dword ptr [ebp-10]
 00575E71    mov         edx,dword ptr [ebp-4]
 00575E74    call        @UStrAsg
 00575E79    xor         eax,eax
 00575E7B    pop         edx
 00575E7C    pop         ecx
 00575E7D    pop         ecx
 00575E7E    mov         dword ptr fs:[eax],edx
 00575E81    push        575EA8
 00575E86    lea         eax,[ebp-44]
 00575E89    mov         edx,0D
 00575E8E    call        @UStrArrayClr
 00575E93    lea         eax,[ebp-0C]
 00575E96    mov         edx,3
 00575E9B    call        @UStrArrayClr
 00575EA0    ret
>00575EA1    jmp         @HandleFinally
>00575EA6    jmp         00575E86
 00575EA8    pop         esi
 00575EA9    pop         ebx
 00575EAA    mov         esp,ebp
 00575EAC    pop         ebp
 00575EAD    ret
end;*}

//00575EC0
{*procedure sub_00575EC0(?:?; ?:?);
begin
 00575EC0    push        ebp
 00575EC1    mov         ebp,esp
 00575EC3    mov         ecx,5
 00575EC8    push        0
 00575ECA    push        0
 00575ECC    dec         ecx
>00575ECD    jne         00575EC8
 00575ECF    push        ebx
 00575ED0    push        esi
 00575ED1    push        edi
 00575ED2    mov         dword ptr [ebp-8],edx
 00575ED5    mov         dword ptr [ebp-4],eax
 00575ED8    mov         eax,dword ptr [ebp-4]
 00575EDB    call        @UStrAddRef
 00575EE0    xor         eax,eax
 00575EE2    push        ebp
 00575EE3    push        575FF2
 00575EE8    push        dword ptr fs:[eax]
 00575EEB    mov         dword ptr fs:[eax],esp
 00575EEE    cmp         dword ptr [ebp-4],0
>00575EF2    je          00575F06
 00575EF4    cmp         dword ptr ds:[815538],0;gvar_00815538:TStringList
>00575EFB    je          00575F06
 00575EFD    cmp         dword ptr ds:[81553C],0;gvar_0081553C:TStringList
>00575F04    jne         00575F16
 00575F06    mov         eax,dword ptr [ebp-8]
 00575F09    mov         edx,dword ptr [ebp-4]
 00575F0C    call        @UStrAsg
>00575F11    jmp         00575FCF
 00575F16    mov         dl,1
 00575F18    mov         eax,[0043C7BC];TStringList
 00575F1D    call        TStringList.Create;TStringList.Create
 00575F22    mov         esi,eax
 00575F24    lea         edx,[ebp-14]
 00575F27    mov         eax,dword ptr [ebp-4]
 00575F2A    call        005747EC
 00575F2F    mov         edx,dword ptr [ebp-14]
 00575F32    mov         eax,esi
 00575F34    mov         ecx,dword ptr [eax]
 00575F36    call        dword ptr [ecx+2C];TStrings.SetTextStr
 00575F39    mov         eax,esi
 00575F3B    mov         edx,dword ptr [eax]
 00575F3D    call        dword ptr [edx+14];TStringList.GetCount
 00575F40    dec         eax
 00575F41    test        eax,eax
>00575F43    jle         00575FBE
 00575F45    mov         dword ptr [ebp-10],eax
 00575F48    mov         dword ptr [ebp-0C],1
 00575F4F    lea         ecx,[ebp-18]
 00575F52    mov         edx,dword ptr [ebp-0C]
 00575F55    mov         eax,esi
 00575F57    mov         ebx,dword ptr [eax]
 00575F59    call        dword ptr [ebx+0C];TStringList.Get
 00575F5C    mov         edx,dword ptr [ebp-18]
 00575F5F    mov         eax,[00815538];gvar_00815538:TStringList
 00575F64    mov         ecx,dword ptr [eax]
 00575F66    call        dword ptr [ecx+54]
 00575F69    mov         ebx,eax
 00575F6B    test        ebx,ebx
>00575F6D    jl          00575FB6
 00575F6F    lea         ecx,[ebp-20]
 00575F72    mov         edx,ebx
 00575F74    mov         eax,[0081553C];gvar_0081553C:TStringList
 00575F79    mov         edi,dword ptr [eax]
 00575F7B    call        dword ptr [edi+0C]
 00575F7E    mov         eax,dword ptr [ebp-20]
 00575F81    lea         edx,[ebp-1C]
 00575F84    call        005747EC
 00575F89    cmp         dword ptr [ebp-1C],0
>00575F8D    je          00575FB6
 00575F8F    lea         ecx,[ebp-28]
 00575F92    mov         edx,ebx
 00575F94    mov         eax,[0081553C];gvar_0081553C:TStringList
 00575F99    mov         ebx,dword ptr [eax]
 00575F9B    call        dword ptr [ebx+0C]
 00575F9E    mov         eax,dword ptr [ebp-28]
 00575FA1    lea         edx,[ebp-24]
 00575FA4    call        005747EC
 00575FA9    mov         ecx,dword ptr [ebp-24]
 00575FAC    mov         edx,dword ptr [ebp-0C]
 00575FAF    mov         eax,esi
 00575FB1    mov         ebx,dword ptr [eax]
 00575FB3    call        dword ptr [ebx+20];TStringList.Put
 00575FB6    inc         dword ptr [ebp-0C]
 00575FB9    dec         dword ptr [ebp-10]
>00575FBC    jne         00575F4F
 00575FBE    mov         edx,dword ptr [ebp-8]
 00575FC1    mov         eax,esi
 00575FC3    mov         ecx,dword ptr [eax]
 00575FC5    call        dword ptr [ecx+1C];TStrings.GetTextStr
 00575FC8    mov         eax,esi
 00575FCA    call        TObject.Free
 00575FCF    xor         eax,eax
 00575FD1    pop         edx
 00575FD2    pop         ecx
 00575FD3    pop         ecx
 00575FD4    mov         dword ptr fs:[eax],edx
 00575FD7    push        575FF9
 00575FDC    lea         eax,[ebp-28]
 00575FDF    mov         edx,6
 00575FE4    call        @UStrArrayClr
 00575FE9    lea         eax,[ebp-4]
 00575FEC    call        @UStrClr
 00575FF1    ret
>00575FF2    jmp         @HandleFinally
>00575FF7    jmp         00575FDC
 00575FF9    pop         edi
 00575FFA    pop         esi
 00575FFB    pop         ebx
 00575FFC    mov         esp,ebp
 00575FFE    pop         ebp
 00575FFF    ret
end;*}

//00576000
{*procedure sub_00576000(?:UString; ?:?);
begin
 00576000    push        ebp
 00576001    mov         ebp,esp
 00576003    mov         ecx,7
 00576008    push        0
 0057600A    push        0
 0057600C    dec         ecx
>0057600D    jne         00576008
 0057600F    push        ecx
 00576010    push        ebx
 00576011    push        esi
 00576012    push        edi
 00576013    mov         dword ptr [ebp-8],edx
 00576016    mov         dword ptr [ebp-4],eax
 00576019    mov         eax,dword ptr [ebp-4]
 0057601C    call        @UStrAddRef
 00576021    xor         eax,eax
 00576023    push        ebp
 00576024    push        576271
 00576029    push        dword ptr fs:[eax]
 0057602C    mov         dword ptr fs:[eax],esp
 0057602F    cmp         dword ptr [ebp-4],0
>00576033    je          00576047
 00576035    cmp         dword ptr ds:[815550],0;gvar_00815550:TStringList
>0057603C    je          00576047
 0057603E    cmp         dword ptr ds:[815554],0;gvar_00815554:TStringList
>00576045    jne         00576057
 00576047    mov         eax,dword ptr [ebp-8]
 0057604A    mov         edx,dword ptr [ebp-4]
 0057604D    call        @UStrAsg
>00576052    jmp         00576241
 00576057    mov         eax,dword ptr [ebp-4]
 0057605A    test        eax,eax
>0057605C    je          00576063
 0057605E    sub         eax,4
 00576061    mov         eax,dword ptr [eax]
 00576063    mov         edx,dword ptr [ebp-4]
 00576066    movzx       eax,word ptr [edx+eax*2-2]
 0057606B    sub         ax,0A
>0057606F    je          00576077
 00576071    sub         ax,3
>00576075    jne         0057607D
 00576077    mov         byte ptr [ebp-0D],1
>0057607B    jmp         00576081
 0057607D    mov         byte ptr [ebp-0D],0
 00576081    mov         dl,1
 00576083    mov         eax,[0043C7BC];TStringList
 00576088    call        TStringList.Create;TStringList.Create
 0057608D    mov         esi,eax
 0057608F    lea         edx,[ebp-18]
 00576092    mov         eax,dword ptr [ebp-4]
 00576095    call        005747EC
 0057609A    mov         edx,dword ptr [ebp-18]
 0057609D    mov         eax,esi
 0057609F    mov         ecx,dword ptr [eax]
 005760A1    call        dword ptr [ecx+2C];TStrings.SetTextStr
 005760A4    mov         eax,esi
 005760A6    mov         edx,dword ptr [eax]
 005760A8    call        dword ptr [edx+14];TStringList.GetCount
 005760AB    dec         eax
 005760AC    test        eax,eax
>005760AE    jle         00576129
 005760B0    mov         dword ptr [ebp-14],eax
 005760B3    mov         dword ptr [ebp-0C],1
 005760BA    lea         ecx,[ebp-1C]
 005760BD    mov         edx,dword ptr [ebp-0C]
 005760C0    mov         eax,esi
 005760C2    mov         ebx,dword ptr [eax]
 005760C4    call        dword ptr [ebx+0C];TStringList.Get
 005760C7    mov         edx,dword ptr [ebp-1C]
 005760CA    mov         eax,[00815550];gvar_00815550:TStringList
 005760CF    mov         ecx,dword ptr [eax]
 005760D1    call        dword ptr [ecx+54]
 005760D4    mov         ebx,eax
 005760D6    test        ebx,ebx
>005760D8    jl          00576121
 005760DA    lea         ecx,[ebp-24]
 005760DD    mov         edx,ebx
 005760DF    mov         eax,[00815554];gvar_00815554:TStringList
 005760E4    mov         edi,dword ptr [eax]
 005760E6    call        dword ptr [edi+0C]
 005760E9    mov         eax,dword ptr [ebp-24]
 005760EC    lea         edx,[ebp-20]
 005760EF    call        005747EC
 005760F4    cmp         dword ptr [ebp-20],0
>005760F8    je          00576121
 005760FA    lea         ecx,[ebp-2C]
 005760FD    mov         edx,ebx
 005760FF    mov         eax,[00815554];gvar_00815554:TStringList
 00576104    mov         ebx,dword ptr [eax]
 00576106    call        dword ptr [ebx+0C]
 00576109    mov         eax,dword ptr [ebp-2C]
 0057610C    lea         edx,[ebp-28]
 0057610F    call        005747EC
 00576114    mov         ecx,dword ptr [ebp-28]
 00576117    mov         edx,dword ptr [ebp-0C]
 0057611A    mov         eax,esi
 0057611C    mov         ebx,dword ptr [eax]
 0057611E    call        dword ptr [ebx+20];TStringList.Put
 00576121    inc         dword ptr [ebp-0C]
 00576124    dec         dword ptr [ebp-14]
>00576127    jne         005760BA
 00576129    mov         edx,dword ptr [ebp-8]
 0057612C    mov         eax,esi
 0057612E    mov         ecx,dword ptr [eax]
 00576130    call        dword ptr [ecx+1C];TStrings.GetTextStr
 00576133    cmp         byte ptr [ebp-0D],0
>00576137    jne         0057623A
 0057613D    mov         eax,dword ptr [ebp-8]
 00576140    mov         eax,dword ptr [eax]
 00576142    mov         dword ptr [ebp-30],eax
 00576145    mov         ebx,dword ptr [ebp-30]
 00576148    test        ebx,ebx
>0057614A    je          00576151
 0057614C    sub         ebx,4
 0057614F    mov         ebx,dword ptr [ebx]
 00576151    lea         eax,[ebp-34]
 00576154    push        eax
 00576155    mov         edx,ebx
 00576157    dec         edx
 00576158    mov         eax,dword ptr [ebp-8]
 0057615B    mov         eax,dword ptr [eax]
 0057615D    mov         ecx,2
 00576162    call        @UStrCopy
 00576167    mov         eax,dword ptr [ebp-34]
 0057616A    mov         edx,57628C;'
'
 0057616F    call        @UStrEqual
>00576174    jne         0057619F
 00576176    mov         eax,dword ptr [ebp-8]
 00576179    mov         eax,dword ptr [eax]
 0057617B    mov         dword ptr [ebp-30],eax
 0057617E    mov         eax,dword ptr [ebp-30]
 00576181    test        eax,eax
>00576183    je          0057618A
 00576185    sub         eax,4
 00576188    mov         eax,dword ptr [eax]
 0057618A    mov         edx,eax
 0057618C    dec         edx
 0057618D    mov         eax,dword ptr [ebp-8]
 00576190    mov         ecx,2
 00576195    call        @UStrDelete
>0057619A    jmp         0057623A
 0057619F    mov         eax,dword ptr [ebp-8]
 005761A2    mov         eax,dword ptr [eax]
 005761A4    mov         dword ptr [ebp-30],eax
 005761A7    mov         ebx,dword ptr [ebp-30]
 005761AA    test        ebx,ebx
>005761AC    je          005761B3
 005761AE    sub         ebx,4
 005761B1    mov         ebx,dword ptr [ebx]
 005761B3    lea         eax,[ebp-38]
 005761B6    push        eax
 005761B7    mov         eax,dword ptr [ebp-8]
 005761BA    mov         eax,dword ptr [eax]
 005761BC    mov         ecx,1
 005761C1    mov         edx,ebx
 005761C3    call        @UStrCopy
 005761C8    mov         eax,dword ptr [ebp-38]
 005761CB    mov         edx,5762A0;''
 005761D0    call        @UStrEqual
>005761D5    jne         005761DB
 005761D7    mov         al,1
>005761D9    jmp         00576214
 005761DB    mov         eax,dword ptr [ebp-8]
 005761DE    mov         eax,dword ptr [eax]
 005761E0    mov         dword ptr [ebp-30],eax
 005761E3    mov         ebx,dword ptr [ebp-30]
 005761E6    test        ebx,ebx
>005761E8    je          005761EF
 005761EA    sub         ebx,4
 005761ED    mov         ebx,dword ptr [ebx]
 005761EF    lea         eax,[ebp-3C]
 005761F2    push        eax
 005761F3    mov         eax,dword ptr [ebp-8]
 005761F6    mov         eax,dword ptr [eax]
 005761F8    mov         ecx,1
 005761FD    mov         edx,ebx
 005761FF    call        @UStrCopy
 00576204    mov         eax,dword ptr [ebp-3C]
 00576207    mov         edx,5762B0;'
'
 0057620C    call        @UStrEqual
 00576211    sete        al
 00576214    test        al,al
>00576216    je          0057623A
 00576218    mov         eax,dword ptr [ebp-8]
 0057621B    mov         eax,dword ptr [eax]
 0057621D    mov         dword ptr [ebp-30],eax
 00576220    mov         eax,dword ptr [ebp-30]
 00576223    test        eax,eax
>00576225    je          0057622C
 00576227    sub         eax,4
 0057622A    mov         eax,dword ptr [eax]
 0057622C    mov         edx,dword ptr [ebp-8]
 0057622F    mov         ecx,1
 00576234    xchg        eax,edx
 00576235    call        @UStrDelete
 0057623A    mov         eax,esi
 0057623C    call        TObject.Free
 00576241    xor         eax,eax
 00576243    pop         edx
 00576244    pop         ecx
 00576245    pop         ecx
 00576246    mov         dword ptr fs:[eax],edx
 00576249    push        576278
 0057624E    lea         eax,[ebp-3C]
 00576251    mov         edx,3
 00576256    call        @UStrArrayClr
 0057625B    lea         eax,[ebp-2C]
 0057625E    mov         edx,6
 00576263    call        @UStrArrayClr
 00576268    lea         eax,[ebp-4]
 0057626B    call        @UStrClr
 00576270    ret
>00576271    jmp         @HandleFinally
>00576276    jmp         0057624E
 00576278    pop         edi
 00576279    pop         esi
 0057627A    pop         ebx
 0057627B    mov         esp,ebp
 0057627D    pop         ebp
 0057627E    ret
end;*}

//005762B4
{*procedure sub_005762B4(?:UString; ?:?);
begin
 005762B4    push        ebp
 005762B5    mov         ebp,esp
 005762B7    mov         ecx,7
 005762BC    push        0
 005762BE    push        0
 005762C0    dec         ecx
>005762C1    jne         005762BC
 005762C3    push        ecx
 005762C4    push        ebx
 005762C5    push        esi
 005762C6    push        edi
 005762C7    mov         dword ptr [ebp-0C],edx
 005762CA    mov         dword ptr [ebp-4],eax
 005762CD    mov         eax,dword ptr [ebp-4]
 005762D0    call        @UStrAddRef
 005762D5    xor         eax,eax
 005762D7    push        ebp
 005762D8    push        576632
 005762DD    push        dword ptr fs:[eax]
 005762E0    mov         dword ptr fs:[eax],esp
 005762E3    cmp         dword ptr ds:[815530],0;gvar_00815530:TStringList
>005762EA    je          00576320
 005762EC    cmp         dword ptr ds:[815534],0;gvar_00815534:TStringList
>005762F3    je          00576320
 005762F5    lea         edx,[ebp-18]
 005762F8    mov         eax,dword ptr [ebp-4]
 005762FB    call        005747EC
 00576300    mov         eax,dword ptr [ebp-18]
 00576303    mov         edx,57664C;'-'
 00576308    call        @UStrEqual
>0057630D    je          00576320
 0057630F    lea         edx,[ebp-1C]
 00576312    mov         eax,dword ptr [ebp-4]
 00576315    call        005747EC
 0057631A    cmp         dword ptr [ebp-1C],0
>0057631E    jne         00576330
 00576320    mov         eax,dword ptr [ebp-0C]
 00576323    mov         edx,dword ptr [ebp-4]
 00576326    call        @UStrAsg
>0057632B    jmp         0057660A
 00576330    lea         edx,[ebp-20]
 00576333    mov         eax,dword ptr [ebp-4]
 00576336    call        005747EC
 0057633B    mov         edx,dword ptr [ebp-20]
 0057633E    lea         eax,[ebp-4]
 00576341    call        @UStrLAsg
 00576346    lea         eax,[ebp-4]
 00576349    mov         edx,57665C;'                        Shift+P+I+E'
 0057634E    call        00574E4C
 00576353    mov         byte ptr [ebp-14],al
 00576356    lea         eax,[ebp-4]
 00576359    mov         edx,5766B0;'...'
 0057635E    call        00574E4C
 00576363    mov         byte ptr [ebp-13],al
 00576366    lea         eax,[ebp-4]
 00576369    mov         edx,5766C4;':'
 0057636E    call        00574E4C
 00576373    mov         byte ptr [ebp-12],al
 00576376    xor         ebx,ebx
 00576378    mov         dword ptr [ebp-10],1
>0057637F    jmp         0057640C
 00576384    mov         eax,dword ptr [ebp-4]
 00576387    mov         edx,dword ptr [ebp-10]
 0057638A    movzx       esi,word ptr [eax+edx*2-2]
 0057638F    cmp         si,26
>00576393    jne         005763B4
 00576395    mov         eax,dword ptr [ebp-4]
 00576398    mov         edx,dword ptr [ebp-10]
 0057639B    cmp         word ptr [eax+edx*2],26
>005763A0    jne         005763B4
 005763A2    lea         eax,[ebp-4]
 005763A5    mov         ecx,1
 005763AA    mov         edx,dword ptr [ebp-10]
 005763AD    call        @UStrDelete
>005763B2    jmp         00576409
 005763B4    cmp         si,26
>005763B8    jne         00576409
 005763BA    lea         eax,[ebp-4]
 005763BD    mov         ecx,1
 005763C2    mov         edx,dword ptr [ebp-10]
 005763C5    call        @UStrDelete
 005763CA    xor         eax,eax
 005763CC    push        ebp
 005763CD    push        5763F4
 005763D2    push        dword ptr fs:[eax]
 005763D5    mov         dword ptr fs:[eax],esp
 005763D8    mov         eax,dword ptr [ebp-4]
 005763DB    mov         edx,dword ptr [ebp-10]
 005763DE    movzx       eax,word ptr [eax+edx*2-2]
 005763E3    call        00574EF4
 005763E8    mov         ebx,eax
 005763EA    xor         eax,eax
 005763EC    pop         edx
 005763ED    pop         ecx
 005763EE    pop         ecx
 005763EF    mov         dword ptr fs:[eax],edx
>005763F2    jmp         00576409
>005763F4    jmp         @HandleAnyException
 005763F9    mov         eax,dword ptr [ebp-4]
 005763FC    mov         edx,dword ptr [ebp-10]
 005763FF    movzx       ebx,word ptr [eax+edx*2-2]
 00576404    call        @DoneExcept
 00576409    inc         dword ptr [ebp-10]
 0057640C    mov         eax,dword ptr [ebp-4]
 0057640F    call        @UStrLen
 00576414    dec         eax
 00576415    cmp         eax,dword ptr [ebp-10]
>00576418    jge         00576384
 0057641E    push        5766D4;' ('
 00576423    lea         eax,[ebp-28]
 00576426    mov         edx,ebx
 00576428    call        @UStrFromWChar
 0057642D    push        dword ptr [ebp-28]
 00576430    push        5766E8;')'
 00576435    lea         eax,[ebp-24]
 00576438    mov         edx,3
 0057643D    call        @UStrCatN
 00576442    mov         edx,dword ptr [ebp-24]
 00576445    lea         eax,[ebp-4]
 00576448    call        00574E4C
 0057644D    lea         eax,[ebp-4]
 00576450    mov         edx,5766F8;'!'
 00576455    call        00574E4C
 0057645A    mov         byte ptr [ebp-11],al
 0057645D    lea         edx,[ebp-2C]
 00576460    mov         eax,dword ptr [ebp-4]
 00576463    call        005747EC
 00576468    mov         edx,dword ptr [ebp-2C]
 0057646B    lea         eax,[ebp-4]
 0057646E    call        @UStrLAsg
 00576473    mov         edx,dword ptr [ebp-4]
 00576476    mov         eax,[00815530];gvar_00815530:TStringList
 0057647B    mov         ecx,dword ptr [eax]
 0057647D    call        dword ptr [ecx+54]
 00576480    mov         esi,eax
 00576482    test        esi,esi
>00576484    jl          005764A2
 00576486    lea         ecx,[ebp-30]
 00576489    mov         edx,esi
 0057648B    mov         eax,[00815534];gvar_00815534:TStringList
 00576490    mov         edi,dword ptr [eax]
 00576492    call        dword ptr [edi+0C]
 00576495    mov         eax,dword ptr [ebp-30]
 00576498    lea         edx,[ebp-8]
 0057649B    call        005747EC
>005764A0    jmp         005764AA
 005764A2    lea         eax,[ebp-8]
 005764A5    call        @UStrClr
 005764AA    test        esi,esi
>005764AC    jl          005764C1
 005764AE    cmp         dword ptr [ebp-8],0
>005764B2    je          005764C1
 005764B4    lea         eax,[ebp-4]
 005764B7    mov         edx,dword ptr [ebp-8]
 005764BA    call        @UStrLAsg
>005764BF    jmp         00576527
 005764C1    cmp         byte ptr [ebp-12],0
>005764C5    je          00576527
 005764C7    lea         eax,[ebp-34]
 005764CA    mov         ecx,5766C4;':'
 005764CF    mov         edx,dword ptr [ebp-4]
 005764D2    call        @UStrCat3
 005764D7    mov         edx,dword ptr [ebp-34]
 005764DA    mov         eax,[00815530];gvar_00815530:TStringList
 005764DF    mov         ecx,dword ptr [eax]
 005764E1    call        dword ptr [ecx+54]
 005764E4    mov         esi,eax
 005764E6    test        esi,esi
>005764E8    jl          00576506
 005764EA    lea         ecx,[ebp-38]
 005764ED    mov         edx,esi
 005764EF    mov         eax,[00815534];gvar_00815534:TStringList
 005764F4    mov         edi,dword ptr [eax]
 005764F6    call        dword ptr [edi+0C]
 005764F9    mov         eax,dword ptr [ebp-38]
 005764FC    lea         edx,[ebp-8]
 005764FF    call        005747EC
>00576504    jmp         0057650E
 00576506    lea         eax,[ebp-8]
 00576509    call        @UStrClr
 0057650E    test        esi,esi
>00576510    jl          00576527
 00576512    cmp         dword ptr [ebp-8],0
>00576516    je          00576527
 00576518    mov         byte ptr [ebp-12],0
 0057651C    lea         eax,[ebp-4]
 0057651F    mov         edx,dword ptr [ebp-8]
 00576522    call        @UStrLAsg
 00576527    mov         dword ptr [ebp-10],1
>0057652E    jmp         0057657A
 00576530    mov         eax,dword ptr [ebp-4]
 00576533    mov         edx,dword ptr [ebp-10]
 00576536    movzx       esi,word ptr [eax+edx*2-2]
 0057653B    cmp         si,26
>0057653F    jne         00576556
 00576541    lea         edx,[ebp-4]
 00576544    mov         ecx,dword ptr [ebp-10]
 00576547    mov         eax,576708;'&'
 0057654C    call        @UStrInsert
 00576551    inc         dword ptr [ebp-10]
>00576554    jmp         00576577
 00576556    mov         eax,esi
 00576558    call        00574EF4
 0057655D    cmp         bx,ax
>00576560    jne         00576577
 00576562    lea         edx,[ebp-4]
 00576565    mov         ecx,dword ptr [ebp-10]
 00576568    mov         eax,576708;'&'
 0057656D    call        @UStrInsert
 00576572    xor         ebx,ebx
 00576574    inc         dword ptr [ebp-10]
 00576577    inc         dword ptr [ebp-10]
 0057657A    mov         eax,dword ptr [ebp-4]
 0057657D    call        @UStrLen
 00576582    cmp         eax,dword ptr [ebp-10]
>00576585    jge         00576530
 00576587    cmp         byte ptr [ebp-11],0
>0057658B    je          0057659A
 0057658D    lea         eax,[ebp-4]
 00576590    mov         edx,5766F8;'!'
 00576595    call        @UStrCat
 0057659A    test        bx,bx
>0057659D    je          005765C6
 0057659F    push        dword ptr [ebp-4]
 005765A2    push        576718;' (&'
 005765A7    lea         eax,[ebp-3C]
 005765AA    mov         edx,ebx
 005765AC    call        @UStrFromWChar
 005765B1    push        dword ptr [ebp-3C]
 005765B4    push        5766E8;')'
 005765B9    lea         eax,[ebp-4]
 005765BC    mov         edx,4
 005765C1    call        @UStrCatN
 005765C6    cmp         byte ptr [ebp-12],0
>005765CA    je          005765D9
 005765CC    lea         eax,[ebp-4]
 005765CF    mov         edx,5766C4;':'
 005765D4    call        @UStrCat
 005765D9    cmp         byte ptr [ebp-13],0
>005765DD    je          005765EC
 005765DF    lea         eax,[ebp-4]
 005765E2    mov         edx,5766B0;'...'
 005765E7    call        @UStrCat
 005765EC    cmp         byte ptr [ebp-14],0
>005765F0    je          005765FF
 005765F2    lea         eax,[ebp-4]
 005765F5    mov         edx,57665C;'                        Shift+P+I+E'
 005765FA    call        @UStrCat
 005765FF    mov         eax,dword ptr [ebp-0C]
 00576602    mov         edx,dword ptr [ebp-4]
 00576605    call        @UStrAsg
 0057660A    xor         eax,eax
 0057660C    pop         edx
 0057660D    pop         ecx
 0057660E    pop         ecx
 0057660F    mov         dword ptr fs:[eax],edx
 00576612    push        576639
 00576617    lea         eax,[ebp-3C]
 0057661A    mov         edx,0A
 0057661F    call        @UStrArrayClr
 00576624    lea         eax,[ebp-8]
 00576627    mov         edx,2
 0057662C    call        @UStrArrayClr
 00576631    ret
>00576632    jmp         @HandleFinally
>00576637    jmp         00576617
 00576639    pop         edi
 0057663A    pop         esi
 0057663B    pop         ebx
 0057663C    mov         esp,ebp
 0057663E    pop         ebp
 0057663F    ret
end;*}

//00576720
procedure sub_00576720(?:TComponent);
begin
{*
 00576720    push        ebp
 00576721    mov         ebp,esp
 00576723    xor         ecx,ecx
 00576725    push        ecx
 00576726    push        ecx
 00576727    push        ecx
 00576728    push        ecx
 00576729    push        ebx
 0057672A    push        esi
 0057672B    push        edi
 0057672C    mov         esi,eax
 0057672E    xor         eax,eax
 00576730    push        ebp
 00576731    push        576821
 00576736    push        dword ptr fs:[eax]
 00576739    mov         dword ptr fs:[eax],esp
 0057673C    test        esi,esi
>0057673E    je          00576806
 00576744    cmp         dword ptr ds:[815528],0;gvar_00815528:TStringList
>0057674B    je          00576806
 00576751    cmp         dword ptr ds:[815530],0;gvar_00815530:TStringList
>00576758    je          00576806
 0057675E    cmp         dword ptr ds:[815534],0;gvar_00815534:TStringList
>00576765    je          00576806
 0057676B    lea         edx,[ebp-4]
 0057676E    mov         eax,esi
 00576770    call        00575044
 00576775    cmp         dword ptr [ebp-4],0
>00576779    je          005767E3
 0057677B    lea         edx,[ebp-8]
 0057677E    mov         eax,esi
 00576780    call        00574F74
 00576785    mov         ecx,esi
 00576787    mov         edx,dword ptr [ebp-4]
 0057678A    mov         eax,[00815528];gvar_00815528:TStringList
 0057678F    mov         ebx,dword ptr [eax]
 00576791    call        dword ptr [ebx+3C]
 00576794    mov         ecx,esi
 00576796    mov         edx,dword ptr [ebp-8]
 00576799    mov         eax,[0081552C];gvar_0081552C:TStringList
 0057679E    mov         ebx,dword ptr [eax]
 005767A0    call        dword ptr [ebx+3C]
 005767A3    lea         edx,[ebp-0C]
 005767A6    mov         eax,dword ptr [ebp-4]
 005767A9    call        005762B4
 005767AE    mov         edx,dword ptr [ebp-0C]
 005767B1    lea         eax,[ebp-4]
 005767B4    call        @UStrLAsg
 005767B9    mov         edx,dword ptr [ebp-4]
 005767BC    mov         eax,esi
 005767BE    call        00575218
 005767C3    lea         edx,[ebp-10]
 005767C6    mov         eax,dword ptr [ebp-8]
 005767C9    call        00575EC0
 005767CE    mov         edx,dword ptr [ebp-10]
 005767D1    lea         eax,[ebp-8]
 005767D4    call        @UStrLAsg
 005767D9    mov         edx,dword ptr [ebp-8]
 005767DC    mov         eax,esi
 005767DE    call        00574FC4
 005767E3    mov         eax,esi
 005767E5    call        TComponent.GetComponentCount
 005767EA    mov         ebx,eax
 005767EC    dec         ebx
 005767ED    test        ebx,ebx
>005767EF    jl          00576806
 005767F1    inc         ebx
 005767F2    xor         edi,edi
 005767F4    mov         edx,edi
 005767F6    mov         eax,esi
 005767F8    call        TComponent.GetComponent
 005767FD    call        00576720
 00576802    inc         edi
 00576803    dec         ebx
>00576804    jne         005767F4
 00576806    xor         eax,eax
 00576808    pop         edx
 00576809    pop         ecx
 0057680A    pop         ecx
 0057680B    mov         dword ptr fs:[eax],edx
 0057680E    push        576828
 00576813    lea         eax,[ebp-10]
 00576816    mov         edx,4
 0057681B    call        @UStrArrayClr
 00576820    ret
>00576821    jmp         @HandleFinally
>00576826    jmp         00576813
 00576828    pop         edi
 00576829    pop         esi
 0057682A    pop         ebx
 0057682B    mov         esp,ebp
 0057682D    pop         ebp
 0057682E    ret
*}
end;

//00576830
procedure sub_00576830(?:TComponent);
begin
{*
 00576830    push        ebp
 00576831    mov         ebp,esp
 00576833    push        0
 00576835    push        0
 00576837    push        0
 00576839    push        ebx
 0057683A    push        esi
 0057683B    mov         dword ptr [ebp-0C],eax
 0057683E    xor         eax,eax
 00576840    push        ebp
 00576841    push        5768E2
 00576846    push        dword ptr fs:[eax]
 00576849    mov         dword ptr fs:[eax],esp
 0057684C    cmp         dword ptr [ebp-0C],0
>00576850    je          005768C7
 00576852    cmp         dword ptr ds:[815528],0;gvar_00815528:TStringList
>00576859    je          005768C7
 0057685B    mov         edx,dword ptr [ebp-0C]
 0057685E    mov         eax,[00815528];gvar_00815528:TStringList
 00576863    mov         ecx,dword ptr [eax]
 00576865    call        dword ptr [ecx+5C]
 00576868    mov         ebx,eax
 0057686A    test        ebx,ebx
>0057686C    jl          005768A2
 0057686E    lea         ecx,[ebp-4]
 00576871    mov         edx,ebx
 00576873    mov         eax,[00815528];gvar_00815528:TStringList
 00576878    mov         esi,dword ptr [eax]
 0057687A    call        dword ptr [esi+0C]
 0057687D    lea         ecx,[ebp-8]
 00576880    mov         edx,ebx
 00576882    mov         eax,[0081552C];gvar_0081552C:TStringList
 00576887    mov         ebx,dword ptr [eax]
 00576889    call        dword ptr [ebx+0C]
 0057688C    mov         edx,dword ptr [ebp-4]
 0057688F    mov         eax,dword ptr [ebp-0C]
 00576892    call        00575218
 00576897    mov         edx,dword ptr [ebp-8]
 0057689A    mov         eax,dword ptr [ebp-0C]
 0057689D    call        00574FC4
 005768A2    mov         eax,dword ptr [ebp-0C]
 005768A5    call        TComponent.GetComponentCount
 005768AA    mov         esi,eax
 005768AC    dec         esi
 005768AD    test        esi,esi
>005768AF    jl          005768C7
 005768B1    inc         esi
 005768B2    xor         ebx,ebx
 005768B4    mov         edx,ebx
 005768B6    mov         eax,dword ptr [ebp-0C]
 005768B9    call        TComponent.GetComponent
 005768BE    call        00576830
 005768C3    inc         ebx
 005768C4    dec         esi
>005768C5    jne         005768B4
 005768C7    xor         eax,eax
 005768C9    pop         edx
 005768CA    pop         ecx
 005768CB    pop         ecx
 005768CC    mov         dword ptr fs:[eax],edx
 005768CF    push        5768E9
 005768D4    lea         eax,[ebp-8]
 005768D7    mov         edx,2
 005768DC    call        @UStrArrayClr
 005768E1    ret
>005768E2    jmp         @HandleFinally
>005768E7    jmp         005768D4
 005768E9    pop         esi
 005768EA    pop         ebx
 005768EB    mov         esp,ebp
 005768ED    pop         ebp
 005768EE    ret
*}
end;

//005768F0
{*procedure sub_005768F0(?:?);
begin
 005768F0    push        ebp
 005768F1    mov         ebp,esp
 005768F3    push        0
 005768F5    push        0
 005768F7    push        0
 005768F9    push        ebx
 005768FA    push        esi
 005768FB    push        edi
 005768FC    mov         ebx,eax
 005768FE    xor         eax,eax
 00576900    push        ebp
 00576901    push        576994
 00576906    push        dword ptr fs:[eax]
 00576909    mov         dword ptr fs:[eax],esp
 0057690C    test        ebx,ebx
>0057690E    je          00576979
 00576910    cmp         dword ptr ds:[815548],0;gvar_00815548:TStringList
>00576917    je          00576979
 00576919    cmp         dword ptr ds:[81554C],0;gvar_0081554C:TStringList
>00576920    je          00576979
 00576922    xor         edx,edx
 00576924    mov         eax,ebx
 00576926    call        TStringList.SetSorted
 0057692B    mov         eax,ebx
 0057692D    mov         edx,dword ptr [eax]
 0057692F    call        dword ptr [edx+14]
 00576932    dec         eax
 00576933    test        eax,eax
>00576935    jl          00576966
 00576937    inc         eax
 00576938    mov         dword ptr [ebp-4],eax
 0057693B    xor         esi,esi
 0057693D    lea         ecx,[ebp-0C]
 00576940    mov         edx,esi
 00576942    mov         eax,ebx
 00576944    mov         edi,dword ptr [eax]
 00576946    call        dword ptr [edi+0C]
 00576949    mov         eax,dword ptr [ebp-0C]
 0057694C    lea         edx,[ebp-8]
 0057694F    call        00575A60
 00576954    mov         ecx,dword ptr [ebp-8]
 00576957    mov         edx,esi
 00576959    mov         eax,ebx
 0057695B    mov         edi,dword ptr [eax]
 0057695D    call        dword ptr [edi+20]
 00576960    inc         esi
 00576961    dec         dword ptr [ebp-4]
>00576964    jne         0057693D
 00576966    mov         dl,1
 00576968    mov         eax,ebx
 0057696A    call        TStringList.SetSorted
 0057696F    mov         eax,ebx
 00576971    mov         edx,dword ptr [eax]
 00576973    call        dword ptr [edx+0A0]
 00576979    xor         eax,eax
 0057697B    pop         edx
 0057697C    pop         ecx
 0057697D    pop         ecx
 0057697E    mov         dword ptr fs:[eax],edx
 00576981    push        57699B
 00576986    lea         eax,[ebp-0C]
 00576989    mov         edx,2
 0057698E    call        @UStrArrayClr
 00576993    ret
>00576994    jmp         @HandleFinally
>00576999    jmp         00576986
 0057699B    pop         edi
 0057699C    pop         esi
 0057699D    pop         ebx
 0057699E    mov         esp,ebp
 005769A0    pop         ebp
 005769A1    ret
end;*}

Initialization
//0078133C
{*
 0078133C    push        ebp
 0078133D    mov         ebp,esp
 0078133F    xor         eax,eax
 00781341    push        ebp
 00781342    push        781451
 00781347    push        dword ptr fs:[eax]
 0078134A    mov         dword ptr fs:[eax],esp
 0078134D    sub         dword ptr ds:[815560],1
>00781354    jae         00781443
 0078135A    mov         eax,[0078DAA8];^gvar_00790D9A
 0078135F    movzx       eax,word ptr [eax]
 00781362    mov         [0081555C],ax;gvar_0081555C
 00781368    cmp         word ptr ds:[81555C],2C;gvar_0081555C
 00781370    sete        byte ptr ds:[81555E];gvar_0081555E
 00781377    mov         dl,1
 00781379    mov         eax,[0043C7BC];TStringList
 0078137E    call        TStringList.Create;TStringList.Create
 00781383    mov         [00815528],eax;gvar_00815528:TStringList
 00781388    mov         dl,1
 0078138A    mov         eax,[0043C7BC];TStringList
 0078138F    call        TStringList.Create;TStringList.Create
 00781394    mov         [0081552C],eax;gvar_0081552C:TStringList
 00781399    mov         dl,1
 0078139B    mov         eax,[0043C7BC];TStringList
 007813A0    call        TStringList.Create;TStringList.Create
 007813A5    mov         [00815530],eax;gvar_00815530:TStringList
 007813AA    mov         dl,1
 007813AC    mov         eax,[0043C7BC];TStringList
 007813B1    call        TStringList.Create;TStringList.Create
 007813B6    mov         [00815534],eax;gvar_00815534:TStringList
 007813BB    mov         dl,1
 007813BD    mov         eax,[0043C7BC];TStringList
 007813C2    call        TStringList.Create;TStringList.Create
 007813C7    mov         [00815538],eax;gvar_00815538:TStringList
 007813CC    mov         dl,1
 007813CE    mov         eax,[0043C7BC];TStringList
 007813D3    call        TStringList.Create;TStringList.Create
 007813D8    mov         [0081553C],eax;gvar_0081553C:TStringList
 007813DD    mov         dl,1
 007813DF    mov         eax,[0043C7BC];TStringList
 007813E4    call        TStringList.Create;TStringList.Create
 007813E9    mov         [00815540],eax;gvar_00815540:TStringList
 007813EE    mov         dl,1
 007813F0    mov         eax,[0043C7BC];TStringList
 007813F5    call        TStringList.Create;TStringList.Create
 007813FA    mov         [00815544],eax;gvar_00815544:TStringList
 007813FF    mov         dl,1
 00781401    mov         eax,[0043C7BC];TStringList
 00781406    call        TStringList.Create;TStringList.Create
 0078140B    mov         [00815548],eax;gvar_00815548:TStringList
 00781410    mov         dl,1
 00781412    mov         eax,[0043C7BC];TStringList
 00781417    call        TStringList.Create;TStringList.Create
 0078141C    mov         [0081554C],eax;gvar_0081554C:TStringList
 00781421    mov         dl,1
 00781423    mov         eax,[0043C7BC];TStringList
 00781428    call        TStringList.Create;TStringList.Create
 0078142D    mov         [00815550],eax;gvar_00815550:TStringList
 00781432    mov         dl,1
 00781434    mov         eax,[0043C7BC];TStringList
 00781439    call        TStringList.Create;TStringList.Create
 0078143E    mov         [00815554],eax;gvar_00815554:TStringList
 00781443    xor         eax,eax
 00781445    pop         edx
 00781446    pop         ecx
 00781447    pop         ecx
 00781448    mov         dword ptr fs:[eax],edx
 0078144B    push        781458
 00781450    ret
>00781451    jmp         @HandleFinally
>00781456    jmp         00781450
 00781458    pop         ebp
 00781459    ret
*}
Finalization
//005769A4
{*
 005769A4    push        ebp
 005769A5    mov         ebp,esp
 005769A7    xor         eax,eax
 005769A9    push        ebp
 005769AA    push        576A51
 005769AF    push        dword ptr fs:[eax]
 005769B2    mov         dword ptr fs:[eax],esp
 005769B5    inc         dword ptr ds:[815560]
>005769BB    jne         00576A43
 005769C1    mov         eax,[00815528];gvar_00815528:TStringList
 005769C6    call        TObject.Free
 005769CB    mov         eax,[0081552C];gvar_0081552C:TStringList
 005769D0    call        TObject.Free
 005769D5    mov         eax,[00815530];gvar_00815530:TStringList
 005769DA    call        TObject.Free
 005769DF    mov         eax,[00815534];gvar_00815534:TStringList
 005769E4    call        TObject.Free
 005769E9    mov         eax,[00815538];gvar_00815538:TStringList
 005769EE    call        TObject.Free
 005769F3    mov         eax,[0081553C];gvar_0081553C:TStringList
 005769F8    call        TObject.Free
 005769FD    mov         eax,[00815540];gvar_00815540:TStringList
 00576A02    call        TObject.Free
 00576A07    mov         eax,[00815544];gvar_00815544:TStringList
 00576A0C    call        TObject.Free
 00576A11    mov         eax,[00815548];gvar_00815548:TStringList
 00576A16    call        TObject.Free
 00576A1B    mov         eax,[0081554C];gvar_0081554C:TStringList
 00576A20    call        TObject.Free
 00576A25    mov         eax,[00815550];gvar_00815550:TStringList
 00576A2A    call        TObject.Free
 00576A2F    mov         eax,[00815554];gvar_00815554:TStringList
 00576A34    call        TObject.Free
 00576A39    mov         eax,815558;gvar_00815558:UnicodeString
 00576A3E    call        @UStrClr
 00576A43    xor         eax,eax
 00576A45    pop         edx
 00576A46    pop         ecx
 00576A47    pop         ecx
 00576A48    mov         dword ptr fs:[eax],edx
 00576A4B    push        576A58
 00576A50    ret
>00576A51    jmp         @HandleFinally
>00576A56    jmp         00576A50
 00576A58    pop         ebp
 00576A59    ret
*}
end.