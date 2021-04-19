//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieFastrak;

interface

uses
  SysUtils, Classes;

type
  TFastrakValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//006DBE60
    procedure FillClone(c:TExpression);//006DBE00
    function GetUnits:TUnits;//006DBECC
    function GetPerUnits2:TUnits;//006DBE50
    function GetPerUnits1:TUnits;//006DBE40
    procedure CreateClone;//006DBDF0
    function CanSet:Boolean;//006DBDEC
    function GetDataType:TDataType;//006DBE28
    procedure SetValue(NewValue:Double);//006DC10C
    procedure GetValue;//006DBF10
    //procedure ToString(?:?);//006DC124
  public
    ComPort:Integer;//f20
    Item:Integer;//f24
    //procedure ToString(?:?); virtual;//006DC124
    procedure GetValue; virtual;//v2C//006DBF10
    //procedure GetString(?:?); virtual;//v38//006DBE60
    function GetDataType:TDataType; virtual;//v44//006DBE28
    function GetUnits:TUnits; virtual;//v48//006DBECC
    function GetPerUnits1:TUnits; virtual;//v4C//006DBE40
    function GetPerUnits2:TUnits; virtual;//v50//006DBE50
    procedure SetValue(NewValue:Double); virtual;//v58//006DC10C
    function CanSet:Boolean; virtual;//v68//006DBDEC
    procedure CreateClone; virtual;//v80//006DBDF0
    procedure FillClone(c:TExpression); virtual;//v84//006DBE00
  end;
    procedure sub_006DBA78;//006DBA78
    //function sub_006DBBB0(?:?):?;//006DBBB0
    procedure sub_006DC2D8;//006DC2D8
    procedure sub_006DC308;//006DC308
    //function sub_006DC30C(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//006DC30C
    procedure sub_006DC6DC;//006DC6DC
    procedure sub_006DC96C;//006DC96C
    //function sub_006DC9D0(?:?):?;//006DC9D0
    //function sub_006DCB40:?;//006DCB40
    //function sub_006DCC28(?:UnicodeString):?;//006DCC28
    //procedure sub_006DCC78(?:Integer; ?:?);//006DCC78
    //function sub_006DCC90:?;//006DCC90
    //function sub_006DCD04:?;//006DCD04
    //function sub_006DCDD4(?:?):?;//006DCDD4

implementation

//006DBA78
procedure sub_006DBA78;
begin
{*
 006DBA78    push        ebx
 006DBA79    mov         ebx,820100;gvar_00820100:THashTable
 006DBA7E    xor         ecx,ecx
 006DBA80    mov         edx,6DBB14;'Exists'
 006DBA85    mov         eax,dword ptr [ebx]
 006DBA87    call        THashTable.Add
 006DBA8C    mov         ecx,1
 006DBA91    mov         edx,6DBB30;'x'
 006DBA96    mov         eax,dword ptr [ebx]
 006DBA98    call        THashTable.Add
 006DBA9D    mov         ecx,2
 006DBAA2    mov         edx,6DBB40;'y'
 006DBAA7    mov         eax,dword ptr [ebx]
 006DBAA9    call        THashTable.Add
 006DBAAE    mov         ecx,3
 006DBAB3    mov         edx,6DBB50;'z'
 006DBAB8    mov         eax,dword ptr [ebx]
 006DBABA    call        THashTable.Add
 006DBABF    mov         ecx,5
 006DBAC4    mov         edx,6DBB60;'pitch'
 006DBAC9    mov         eax,dword ptr [ebx]
 006DBACB    call        THashTable.Add
 006DBAD0    mov         ecx,4
 006DBAD5    mov         edx,6DBB78;'yaw'
 006DBADA    mov         eax,dword ptr [ebx]
 006DBADC    call        THashTable.Add
 006DBAE1    mov         ecx,6
 006DBAE6    mov         edx,6DBB8C;'roll'
 006DBAEB    mov         eax,dword ptr [ebx]
 006DBAED    call        THashTable.Add
 006DBAF2    mov         ecx,7
 006DBAF7    mov         edx,6DBBA4;'error'
 006DBAFC    mov         eax,dword ptr [ebx]
 006DBAFE    call        THashTable.Add
 006DBB03    pop         ebx
 006DBB04    ret
*}
end;

//006DBBB0
{*function sub_006DBBB0(?:?):?;
begin
 006DBBB0    push        ebp
 006DBBB1    mov         ebp,esp
 006DBBB3    add         esp,0FFFFFFF4
 006DBBB6    push        ebx
 006DBBB7    push        esi
 006DBBB8    push        edi
 006DBBB9    xor         edx,edx
 006DBBBB    mov         dword ptr [ebp-8],edx
 006DBBBE    mov         dword ptr [ebp-4],eax
 006DBBC1    mov         eax,dword ptr [ebp-4]
 006DBBC4    call        @UStrAddRef
 006DBBC9    xor         eax,eax
 006DBBCB    push        ebp
 006DBBCC    push        6DBD10
 006DBBD1    push        dword ptr fs:[eax]
 006DBBD4    mov         dword ptr fs:[eax],esp
 006DBBD7    xor         esi,esi
 006DBBD9    lea         eax,[ebp-8]
 006DBBDC    mov         edx,dword ptr [ebp-4]
 006DBBDF    call        @UStrLAsg
 006DBBE4    lea         eax,[ebp-8]
 006DBBE7    mov         edx,6DBD2C;'Fastrak'
 006DBBEC    call        004F9BD0
 006DBBF1    test        al,al
>006DBBF3    jne         006DBC4E
 006DBBF5    lea         eax,[ebp-8]
 006DBBF8    mov         edx,6DBD48;'Isotrak'
 006DBBFD    call        004F9BD0
 006DBC02    test        al,al
>006DBC04    jne         006DBC4E
 006DBC06    lea         eax,[ebp-8]
 006DBC09    mov         edx,6DBD64;'Polhemus'
 006DBC0E    call        004F9BD0
 006DBC13    test        al,al
>006DBC15    jne         006DBC4E
 006DBC17    lea         eax,[ebp-8]
 006DBC1A    mov         edx,6DBD84;'Liberty'
 006DBC1F    call        004F9BD0
 006DBC24    test        al,al
>006DBC26    jne         006DBC4E
 006DBC28    lea         eax,[ebp-8]
 006DBC2B    mov         edx,6DBDA0;'Latus'
 006DBC30    call        004F9BD0
 006DBC35    test        al,al
>006DBC37    jne         006DBC4E
 006DBC39    lea         eax,[ebp-8]
 006DBC3C    mov         edx,6DBDB8;'Patriot'
 006DBC41    call        004F9BD0
 006DBC46    test        al,al
>006DBC48    je          006DBCF5
 006DBC4E    lea         eax,[ebp-8]
 006DBC51    call        004F9D00
 006DBC56    mov         ebx,eax
 006DBC58    cmp         ebx,10
>006DBC5B    jle         006DBC69
 006DBC5D    cmp         ebx,3E7
>006DBC63    jne         006DBCF5
 006DBC69    lea         eax,[ebp-8]
 006DBC6C    mov         edx,6DBDD4;'.'
 006DBC71    call        004F9BD0
 006DBC76    test        al,al
>006DBC78    je          006DBCF5
 006DBC7A    lea         eax,[ebp-8]
 006DBC7D    mov         edx,6DBDE4;'com'
 006DBC82    call        004F9BD0
 006DBC87    test        al,al
>006DBC89    je          006DBCB1
 006DBC8B    lea         eax,[ebp-8]
 006DBC8E    call        004F9D00
 006DBC93    mov         edi,eax
 006DBC95    test        edi,edi
>006DBC97    jl          006DBCF5
 006DBC99    cmp         edi,8
>006DBC9C    jg          006DBCF5
 006DBC9E    lea         eax,[ebp-8]
 006DBCA1    mov         edx,6DBDD4;'.'
 006DBCA6    call        004F9BD0
 006DBCAB    test        al,al
>006DBCAD    je          006DBCF5
>006DBCAF    jmp         006DBCB3
 006DBCB1    xor         edi,edi
 006DBCB3    mov         eax,dword ptr [ebp-8]
 006DBCB6    call        006DCC28
 006DBCBB    mov         dword ptr [ebp-0C],eax
 006DBCBE    cmp         dword ptr [ebp-0C],0
>006DBCC2    jl          006DBCF5
 006DBCC4    mov         dl,1
 006DBCC6    mov         eax,[006DB6C0];TFastrakValue
 006DBCCB    call        TObject.Create;TFastrakValue.Create
 006DBCD0    mov         esi,eax
 006DBCD2    mov         eax,dword ptr [ebp-0C]
 006DBCD5    mov         dword ptr [esi+24],eax;TFastrakValue.Item:Integer
 006DBCD8    test        ebx,ebx
>006DBCDA    jg          006DBCE1
 006DBCDC    mov         ebx,1
 006DBCE1    mov         dword ptr [esi+18],ebx;TFastrakValue.......................................................
 006DBCE4    mov         dword ptr [esi+20],edi;TFastrakValue.ComPort:Integer
 006DBCE7    mov         byte ptr [edi+82010C],1;gvar_0082010C
 006DBCEE    mov         byte ptr ds:[820104],1;gvar_00820104
 006DBCF5    xor         eax,eax
 006DBCF7    pop         edx
 006DBCF8    pop         ecx
 006DBCF9    pop         ecx
 006DBCFA    mov         dword ptr fs:[eax],edx
 006DBCFD    push        6DBD17
 006DBD02    lea         eax,[ebp-8]
 006DBD05    mov         edx,2
 006DBD0A    call        @UStrArrayClr
 006DBD0F    ret
>006DBD10    jmp         @HandleFinally
>006DBD15    jmp         006DBD02
 006DBD17    mov         eax,esi
 006DBD19    pop         edi
 006DBD1A    pop         esi
 006DBD1B    pop         ebx
 006DBD1C    mov         esp,ebp
 006DBD1E    pop         ebp
 006DBD1F    ret
end;*}

//006DBDEC
function TFastrakValue.CanSet:Boolean;
begin
{*
 006DBDEC    xor         eax,eax
 006DBDEE    ret
*}
end;

//006DBDF0
procedure TFastrakValue.CreateClone;
begin
{*
 006DBDF0    mov         dl,1
 006DBDF2    mov         eax,[006DB6C0];TFastrakValue
 006DBDF7    call        TObject.Create;TFastrakValue.Create
 006DBDFC    ret
*}
end;

//006DBE00
procedure TFastrakValue.FillClone(c:TExpression);
begin
{*
 006DBE00    push        ebx
 006DBE01    push        esi
 006DBE02    mov         esi,edx
 006DBE04    mov         ebx,eax
 006DBE06    mov         edx,esi
 006DBE08    mov         eax,ebx
 006DBE0A    call        TExpression.FillClone
 006DBE0F    mov         eax,esi
 006DBE11    mov         edx,dword ptr [ebx+24];TFastrakValue.Item:Integer
 006DBE14    mov         dword ptr [eax+24],edx
 006DBE17    mov         edx,dword ptr [ebx+18];TFastrakValue.......................................................
 006DBE1A    mov         dword ptr [eax+18],edx
 006DBE1D    mov         edx,dword ptr [ebx+20];TFastrakValue.ComPort:Integer
 006DBE20    mov         dword ptr [eax+20],edx
 006DBE23    pop         esi
 006DBE24    pop         ebx
 006DBE25    ret
*}
end;

//006DBE28
function TFastrakValue.GetDataType:TDataType;
begin
{*
 006DBE28    mov         eax,dword ptr [eax+24];TFastrakValue.Item:Integer
 006DBE2B    sub         eax,1
>006DBE2E    jb          006DBE37
 006DBE30    sub         eax,6
>006DBE33    je          006DBE3A
>006DBE35    jmp         006DBE3D
 006DBE37    mov         al,3
 006DBE39    ret
 006DBE3A    mov         al,4
 006DBE3C    ret
 006DBE3D    xor         eax,eax
 006DBE3F    ret
*}
end;

//006DBE40
function TFastrakValue.GetPerUnits1:TUnits;
begin
{*
 006DBE40    mov         eax,dword ptr [eax+24];TFastrakValue.Item:Integer
 006DBE43    sub         eax,1
>006DBE46    jae         006DBE4B
 006DBE48    xor         eax,eax
 006DBE4A    ret
 006DBE4B    xor         eax,eax
 006DBE4D    ret
*}
end;

//006DBE50
function TFastrakValue.GetPerUnits2:TUnits;
begin
{*
 006DBE50    mov         eax,dword ptr [eax+24];TFastrakValue.Item:Integer
 006DBE53    sub         eax,1
>006DBE56    jae         006DBE5B
 006DBE58    xor         eax,eax
 006DBE5A    ret
 006DBE5B    xor         eax,eax
 006DBE5D    ret
*}
end;

//006DBE60
{*procedure TFastrakValue.GetString(?:?);
begin
 006DBE60    push        ebx
 006DBE61    push        esi
 006DBE62    push        edi
 006DBE63    push        ebp
 006DBE64    mov         edi,edx
 006DBE66    mov         ebx,eax
 006DBE68    mov         esi,dword ptr [ebx+18];TFastrakValue.......................................................
 006DBE6B    test        esi,esi
>006DBE6D    jle         006DBE74
 006DBE6F    cmp         esi,10
>006DBE72    jl          006DBE7D
 006DBE74    mov         eax,edi
 006DBE76    call        @UStrClr
>006DBE7B    jmp         006DBEC4
 006DBE7D    mov         eax,dword ptr [ebx+24];TFastrakValue.Item:Integer
 006DBE80    sub         eax,7
>006DBE83    jne         006DBEBB
 006DBE85    mov         ebp,dword ptr [ebx+20];TFastrakValue.ComPort:Integer
 006DBE88    cmp         dword ptr [ebp*4+820118],0FFFFFFFF;gvar_00820118
>006DBE90    jne         006DBE9B
 006DBE92    mov         eax,edi
 006DBE94    call        @UStrClr
>006DBE99    jmp         006DBEC4
 006DBE9B    mov         eax,edi
 006DBE9D    mov         edx,esi
 006DBE9F    add         edx,edx
 006DBEA1    add         edx,edx
 006DBEA3    mov         ecx,ebp
 006DBEA5    shl         ecx,6
 006DBEA8    lea         ecx,[ecx*8+8202EC];gvar_008202EC
 006DBEAF    movzx       edx,word ptr [ecx+edx*8-8]
 006DBEB4    call        @UStrFromWChar
>006DBEB9    jmp         006DBEC4
 006DBEBB    mov         edx,edi
 006DBEBD    mov         eax,ebx
 006DBEBF    call        TExpression.GetString
 006DBEC4    pop         ebp
 006DBEC5    pop         edi
 006DBEC6    pop         esi
 006DBEC7    pop         ebx
 006DBEC8    ret
end;*}

//006DBECC
function TFastrakValue.GetUnits:TUnits;
begin
{*
 006DBECC    mov         eax,dword ptr [eax+24];TFastrakValue.Item:Integer
 006DBECF    cmp         eax,6
>006DBED2    ja          006DBF0C
 006DBED4    jmp         dword ptr [eax*4+6DBEDB]
 006DBED4    dd          006DBEF7
 006DBED4    dd          006DBEFA
 006DBED4    dd          006DBEFD
 006DBED4    dd          006DBF00
 006DBED4    dd          006DBF03
 006DBED4    dd          006DBF06
 006DBED4    dd          006DBF09
 006DBEF7    xor         eax,eax
 006DBEF9    ret
 006DBEFA    mov         al,7
 006DBEFC    ret
 006DBEFD    mov         al,7
 006DBEFF    ret
 006DBF00    mov         al,7
 006DBF02    ret
 006DBF03    mov         al,18
 006DBF05    ret
 006DBF06    mov         al,18
 006DBF08    ret
 006DBF09    mov         al,18
 006DBF0B    ret
 006DBF0C    xor         eax,eax
 006DBF0E    ret
*}
end;

//006DBF10
procedure TFastrakValue.GetValue;
begin
{*
 006DBF10    add         esp,0FFFFFFF4
 006DBF13    mov         edx,dword ptr [eax+18];TFastrakValue.......................................................
 006DBF16    test        edx,edx
>006DBF18    jle         006DBF1F
 006DBF1A    cmp         edx,10
>006DBF1D    jl          006DBF2D
 006DBF1F    xor         eax,eax
 006DBF21    mov         dword ptr [esp],eax
 006DBF24    mov         dword ptr [esp+4],eax
>006DBF28    jmp         006DC103
 006DBF2D    mov         ecx,dword ptr [eax+24];TFastrakValue.Item:Integer
 006DBF30    cmp         ecx,7
>006DBF33    ja          006DC0FA
 006DBF39    jmp         dword ptr [ecx*4+6DBF40]
 006DBF39    dd          006DBF60
 006DBF39    dd          006DBF8D
 006DBF39    dd          006DBFC5
 006DBF39    dd          006DBFFD
 006DBF39    dd          006DC037
 006DBF39    dd          006DC06F
 006DBF39    dd          006DC0A1
 006DBF39    dd          006DC0D3
 006DBF60    mov         eax,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DBF63    cmp         dword ptr [eax*4+820118],0FFFFFFFF;gvar_00820118
>006DBF6B    jne         006DBF7D
 006DBF6D    xor         eax,eax
 006DBF6F    call        00686074
 006DBF74    fstp        qword ptr [esp]
 006DBF77    wait
>006DBF78    jmp         006DC103
 006DBF7D    mov         al,1
 006DBF7F    call        00686074
 006DBF84    fstp        qword ptr [esp]
 006DBF87    wait
>006DBF88    jmp         006DC103
 006DBF8D    mov         ecx,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DBF90    cmp         dword ptr [ecx*4+820118],0FFFFFFFF;gvar_00820118
>006DBF98    jne         006DBFA8
 006DBF9A    xor         eax,eax
 006DBF9C    mov         dword ptr [esp],eax
 006DBF9F    mov         dword ptr [esp+4],eax
>006DBFA3    jmp         006DC103
 006DBFA8    add         edx,edx
 006DBFAA    add         edx,edx
 006DBFAC    mov         eax,ecx
 006DBFAE    shl         eax,6
 006DBFB1    lea         eax,[eax*8+8202EC];gvar_008202EC
 006DBFB8    fld         dword ptr [eax+edx*8-1C]
 006DBFBC    fstp        qword ptr [esp]
 006DBFBF    wait
>006DBFC0    jmp         006DC103
 006DBFC5    mov         ecx,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DBFC8    cmp         dword ptr [ecx*4+820118],0FFFFFFFF;gvar_00820118
>006DBFD0    jne         006DBFE0
 006DBFD2    xor         eax,eax
 006DBFD4    mov         dword ptr [esp],eax
 006DBFD7    mov         dword ptr [esp+4],eax
>006DBFDB    jmp         006DC103
 006DBFE0    add         edx,edx
 006DBFE2    add         edx,edx
 006DBFE4    mov         eax,ecx
 006DBFE6    shl         eax,6
 006DBFE9    lea         eax,[eax*8+8202EC];gvar_008202EC
 006DBFF0    fld         dword ptr [eax+edx*8-18]
 006DBFF4    fstp        qword ptr [esp]
 006DBFF7    wait
>006DBFF8    jmp         006DC103
 006DBFFD    mov         ecx,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DC000    cmp         dword ptr [ecx*4+820118],0FFFFFFFF;gvar_00820118
>006DC008    jne         006DC018
 006DC00A    xor         eax,eax
 006DC00C    mov         dword ptr [esp],eax
 006DC00F    mov         dword ptr [esp+4],eax
>006DC013    jmp         006DC103
 006DC018    add         edx,edx
 006DC01A    add         edx,edx
 006DC01C    mov         eax,ecx
 006DC01E    shl         eax,6
 006DC021    lea         eax,[eax*8+8202EC];gvar_008202EC
 006DC028    fld         dword ptr [eax+edx*8-20]
 006DC02C    fchs
 006DC02E    fstp        qword ptr [esp]
 006DC031    wait
>006DC032    jmp         006DC103
 006DC037    mov         ecx,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DC03A    cmp         dword ptr [ecx*4+820118],0FFFFFFFF;gvar_00820118
>006DC042    jne         006DC052
 006DC044    xor         eax,eax
 006DC046    mov         dword ptr [esp],eax
 006DC049    mov         dword ptr [esp+4],eax
>006DC04D    jmp         006DC103
 006DC052    add         edx,edx
 006DC054    add         edx,edx
 006DC056    mov         eax,ecx
 006DC058    shl         eax,6
 006DC05B    lea         eax,[eax*8+8202EC];gvar_008202EC
 006DC062    fld         dword ptr [eax+edx*8-14]
 006DC066    fstp        qword ptr [esp]
 006DC069    wait
>006DC06A    jmp         006DC103
 006DC06F    mov         ecx,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DC072    cmp         dword ptr [ecx*4+820118],0FFFFFFFF;gvar_00820118
>006DC07A    jne         006DC087
 006DC07C    xor         eax,eax
 006DC07E    mov         dword ptr [esp],eax
 006DC081    mov         dword ptr [esp+4],eax
>006DC085    jmp         006DC103
 006DC087    add         edx,edx
 006DC089    add         edx,edx
 006DC08B    mov         eax,ecx
 006DC08D    shl         eax,6
 006DC090    lea         eax,[eax*8+8202EC];gvar_008202EC
 006DC097    fld         dword ptr [eax+edx*8-10]
 006DC09B    fstp        qword ptr [esp]
 006DC09E    wait
>006DC09F    jmp         006DC103
 006DC0A1    mov         ecx,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DC0A4    cmp         dword ptr [ecx*4+820118],0FFFFFFFF;gvar_00820118
>006DC0AC    jne         006DC0B9
 006DC0AE    xor         eax,eax
 006DC0B0    mov         dword ptr [esp],eax
 006DC0B3    mov         dword ptr [esp+4],eax
>006DC0B7    jmp         006DC103
 006DC0B9    add         edx,edx
 006DC0BB    add         edx,edx
 006DC0BD    mov         eax,ecx
 006DC0BF    shl         eax,6
 006DC0C2    lea         eax,[eax*8+8202EC];gvar_008202EC
 006DC0C9    fld         dword ptr [eax+edx*8-0C]
 006DC0CD    fstp        qword ptr [esp]
 006DC0D0    wait
>006DC0D1    jmp         006DC103
 006DC0D3    add         edx,edx
 006DC0D5    add         edx,edx
 006DC0D7    mov         eax,dword ptr [eax+20];TFastrakValue.ComPort:Integer
 006DC0DA    shl         eax,6
 006DC0DD    lea         eax,[eax*8+8202EC];gvar_008202EC
 006DC0E4    movzx       eax,word ptr [eax+edx*8-8]
 006DC0E9    movzx       eax,ax
 006DC0EC    mov         dword ptr [esp+8],eax
 006DC0F0    fild        dword ptr [esp+8]
 006DC0F4    fstp        qword ptr [esp]
 006DC0F7    wait
>006DC0F8    jmp         006DC103
 006DC0FA    xor         eax,eax
 006DC0FC    mov         dword ptr [esp],eax
 006DC0FF    mov         dword ptr [esp+4],eax
 006DC103    fld         qword ptr [esp]
 006DC106    add         esp,0C
 006DC109    ret
*}
end;

//006DC10C
procedure TFastrakValue.SetValue(NewValue:Double);
begin
{*
 006DC10C    push        ebp
 006DC10D    mov         ebp,esp
 006DC10F    mov         eax,dword ptr [eax+24];TFastrakValue.Item:Integer
 006DC112    sub         eax,1
>006DC115    jae         006DC11B
 006DC117    xor         eax,eax
>006DC119    jmp         006DC11D
 006DC11B    xor         eax,eax
 006DC11D    pop         ebp
 006DC11E    ret         8
*}
end;

//006DC124
{*procedure TFastrakValue.ToString(?:?);
begin
 006DC124    push        ebp
 006DC125    mov         ebp,esp
 006DC127    xor         ecx,ecx
 006DC129    push        ecx
 006DC12A    push        ecx
 006DC12B    push        ecx
 006DC12C    push        ecx
 006DC12D    push        ecx
 006DC12E    push        ecx
 006DC12F    push        ecx
 006DC130    push        ecx
 006DC131    push        ebx
 006DC132    push        esi
 006DC133    push        edi
 006DC134    mov         esi,edx
 006DC136    mov         ebx,eax
 006DC138    xor         eax,eax
 006DC13A    push        ebp
 006DC13B    push        6DC242
 006DC140    push        dword ptr fs:[eax]
 006DC143    mov         dword ptr fs:[eax],esp
 006DC146    mov         edi,dword ptr [ebx+18];TFastrakValue.......................................................
 006DC149    test        edi,edi
>006DC14B    jle         006DC1D3
 006DC151    cmp         dword ptr [ebx+20],0;TFastrakValue.ComPort:Integer
>006DC155    jle         006DC1A0
 006DC157    push        6DC25C;'Fastrak'
 006DC15C    lea         edx,[ebp-4]
 006DC15F    mov         eax,edi
 006DC161    call        IntToStr
 006DC166    push        dword ptr [ebp-4]
 006DC169    push        6DC278;'.Com'
 006DC16E    lea         edx,[ebp-8]
 006DC171    mov         eax,dword ptr [ebx+20];TFastrakValue.ComPort:Integer
 006DC174    call        IntToStr
 006DC179    push        dword ptr [ebp-8]
 006DC17C    push        6DC290;'.'
 006DC181    lea         edx,[ebp-0C]
 006DC184    mov         eax,dword ptr [ebx+24];TFastrakValue.Item:Integer
 006DC187    call        006DCC78
 006DC18C    push        dword ptr [ebp-0C]
 006DC18F    mov         eax,esi
 006DC191    mov         edx,6
 006DC196    call        @UStrCatN
>006DC19B    jmp         006DC227
 006DC1A0    push        6DC25C;'Fastrak'
 006DC1A5    lea         edx,[ebp-10]
 006DC1A8    mov         eax,edi
 006DC1AA    call        IntToStr
 006DC1AF    push        dword ptr [ebp-10]
 006DC1B2    push        6DC290;'.'
 006DC1B7    lea         edx,[ebp-14]
 006DC1BA    mov         eax,dword ptr [ebx+24];TFastrakValue.Item:Integer
 006DC1BD    call        006DCC78
 006DC1C2    push        dword ptr [ebp-14]
 006DC1C5    mov         eax,esi
 006DC1C7    mov         edx,4
 006DC1CC    call        @UStrCatN
>006DC1D1    jmp         006DC227
 006DC1D3    mov         edi,dword ptr [ebx+20];TFastrakValue.ComPort:Integer
 006DC1D6    test        edi,edi
>006DC1D8    jle         006DC20D
 006DC1DA    push        6DC2A0;'Fastrak.Com'
 006DC1DF    lea         edx,[ebp-18]
 006DC1E2    mov         eax,edi
 006DC1E4    call        IntToStr
 006DC1E9    push        dword ptr [ebp-18]
 006DC1EC    push        6DC290;'.'
 006DC1F1    lea         edx,[ebp-1C]
 006DC1F4    mov         eax,dword ptr [ebx+24];TFastrakValue.Item:Integer
 006DC1F7    call        006DCC78
 006DC1FC    push        dword ptr [ebp-1C]
 006DC1FF    mov         eax,esi
 006DC201    mov         edx,4
 006DC206    call        @UStrCatN
>006DC20B    jmp         006DC227
 006DC20D    lea         edx,[ebp-20]
 006DC210    mov         eax,dword ptr [ebx+24];TFastrakValue.Item:Integer
 006DC213    call        006DCC78
 006DC218    mov         ecx,dword ptr [ebp-20]
 006DC21B    mov         eax,esi
 006DC21D    mov         edx,6DC2C4;'Fastrak.'
 006DC222    call        @UStrCat3
 006DC227    xor         eax,eax
 006DC229    pop         edx
 006DC22A    pop         ecx
 006DC22B    pop         ecx
 006DC22C    mov         dword ptr fs:[eax],edx
 006DC22F    push        6DC249
 006DC234    lea         eax,[ebp-20]
 006DC237    mov         edx,8
 006DC23C    call        @UStrArrayClr
 006DC241    ret
>006DC242    jmp         @HandleFinally
>006DC247    jmp         006DC234
 006DC249    pop         edi
 006DC24A    pop         esi
 006DC24B    pop         ebx
 006DC24C    mov         esp,ebp
 006DC24E    pop         ebp
 006DC24F    ret
end;*}

//006DC2D8
procedure sub_006DC2D8;
begin
{*
 006DC2D8    mov         byte ptr ds:[820104],0;gvar_00820104
 006DC2DF    mov         ecx,9
 006DC2E4    mov         eax,82010C;gvar_0082010C
 006DC2E9    mov         edx,820118;gvar_00820118
 006DC2EE    mov         byte ptr [eax],0
 006DC2F1    mov         dword ptr [edx],0FFFFFFFF
 006DC2F7    add         edx,4
 006DC2FA    inc         eax
 006DC2FB    dec         ecx
>006DC2FC    jne         006DC2EE
 006DC2FE    xor         eax,eax
 006DC300    mov         [00821510],eax;gvar_00821510
 006DC305    ret
*}
end;

//006DC308
procedure sub_006DC308;
begin
{*
 006DC308    ret
*}
end;

//006DC30C
{*function sub_006DC30C(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 006DC30C    push        ebp
 006DC30D    mov         ebp,esp
 006DC30F    push        ecx
 006DC310    mov         ecx,0A
 006DC315    push        0
 006DC317    push        0
 006DC319    dec         ecx
>006DC31A    jne         006DC315
 006DC31C    push        ecx
 006DC31D    xchg        ecx,dword ptr [ebp-4]
 006DC320    push        ebx
 006DC321    push        esi
 006DC322    mov         dword ptr [ebp-8],ecx
 006DC325    mov         esi,edx
 006DC327    mov         dword ptr [ebp-4],eax
 006DC32A    mov         eax,dword ptr [ebp-4]
 006DC32D    call        @UStrAddRef
 006DC332    xor         eax,eax
 006DC334    push        ebp
 006DC335    push        6DC6B7
 006DC33A    push        dword ptr fs:[eax]
 006DC33D    mov         dword ptr fs:[eax],esp
 006DC340    mov         byte ptr [ebp-9],0
 006DC344    mov         eax,dword ptr [ebp-4]
 006DC347    test        eax,eax
>006DC349    je          006DC350
 006DC34B    sub         eax,4
 006DC34E    mov         eax,dword ptr [eax]
 006DC350    cmp         eax,2D
>006DC353    jl          006DC694
 006DC359    mov         eax,dword ptr [ebp-4]
 006DC35C    movzx       eax,word ptr [eax]
 006DC35F    cmp         ax,30
>006DC363    je          006DC36F
 006DC365    cmp         ax,31
>006DC369    jne         006DC694
 006DC36F    mov         edx,dword ptr [ebp-4]
 006DC372    mov         eax,6DC6D8;'.'
 006DC377    call        Pos
 006DC37C    mov         ebx,eax
 006DC37E    test        ebx,ebx
>006DC380    jne         006DC386
 006DC382    mov         al,1
>006DC384    jmp         006DC39A
 006DC386    mov         eax,dword ptr [ebp-4]
 006DC389    test        eax,eax
>006DC38B    je          006DC392
 006DC38D    sub         eax,4
 006DC390    mov         eax,dword ptr [eax]
 006DC392    lea         edx,[ebx+0F]
 006DC395    cmp         eax,edx
 006DC397    setle       al
 006DC39A    test        al,al
>006DC39C    jne         006DC694
 006DC3A2    lea         eax,[ebp-10]
 006DC3A5    push        eax
 006DC3A6    mov         ecx,2
 006DC3AB    mov         edx,1
 006DC3B0    mov         eax,dword ptr [ebp-4]
 006DC3B3    call        @UStrCopy
 006DC3B8    mov         eax,dword ptr [ebp-10]
 006DC3BB    xor         edx,edx
 006DC3BD    call        StrToIntDef
 006DC3C2    mov         dword ptr [esi],eax
 006DC3C4    cmp         dword ptr [esi],10
>006DC3C7    jg          006DC694
 006DC3CD    mov         eax,dword ptr [ebp-4]
 006DC3D0    cmp         word ptr [eax+ebx*2+0C],2E
>006DC3D6    jne         006DC512
 006DC3DC    mov         eax,dword ptr [ebp-4]
 006DC3DF    movzx       eax,word ptr [eax+4]
 006DC3E3    mov         edx,dword ptr [ebp-8]
 006DC3E6    mov         word ptr [edx],ax
 006DC3E9    mov         eax,dword ptr [ebp+1C]
 006DC3EC    fld         dword ptr [eax]
 006DC3EE    add         esp,0FFFFFFF4
 006DC3F1    fstp        tbyte ptr [esp]
 006DC3F4    wait
 006DC3F5    lea         eax,[ebp-14]
 006DC3F8    push        eax
 006DC3F9    mov         ecx,7
 006DC3FE    mov         edx,4
 006DC403    mov         eax,dword ptr [ebp-4]
 006DC406    call        @UStrCopy
 006DC40B    mov         eax,dword ptr [ebp-14]
 006DC40E    call        004F8DB8
 006DC413    mov         eax,dword ptr [ebp+1C]
 006DC416    fstp        dword ptr [eax]
 006DC418    wait
 006DC419    mov         eax,dword ptr [ebp+18]
 006DC41C    fld         dword ptr [eax]
 006DC41E    add         esp,0FFFFFFF4
 006DC421    fstp        tbyte ptr [esp]
 006DC424    wait
 006DC425    lea         eax,[ebp-18]
 006DC428    push        eax
 006DC429    mov         ecx,7
 006DC42E    mov         edx,0B
 006DC433    mov         eax,dword ptr [ebp-4]
 006DC436    call        @UStrCopy
 006DC43B    mov         eax,dword ptr [ebp-18]
 006DC43E    call        004F8DB8
 006DC443    mov         eax,dword ptr [ebp+18]
 006DC446    fstp        dword ptr [eax]
 006DC448    wait
 006DC449    mov         eax,dword ptr [ebp+14]
 006DC44C    fld         dword ptr [eax]
 006DC44E    add         esp,0FFFFFFF4
 006DC451    fstp        tbyte ptr [esp]
 006DC454    wait
 006DC455    lea         eax,[ebp-1C]
 006DC458    push        eax
 006DC459    mov         ecx,7
 006DC45E    mov         edx,12
 006DC463    mov         eax,dword ptr [ebp-4]
 006DC466    call        @UStrCopy
 006DC46B    mov         eax,dword ptr [ebp-1C]
 006DC46E    call        004F8DB8
 006DC473    mov         eax,dword ptr [ebp+14]
 006DC476    fstp        dword ptr [eax]
 006DC478    wait
 006DC479    mov         eax,dword ptr [ebp+10]
 006DC47C    fld         dword ptr [eax]
 006DC47E    add         esp,0FFFFFFF4
 006DC481    fstp        tbyte ptr [esp]
 006DC484    wait
 006DC485    lea         eax,[ebp-20]
 006DC488    push        eax
 006DC489    mov         ecx,7
 006DC48E    mov         edx,19
 006DC493    mov         eax,dword ptr [ebp-4]
 006DC496    call        @UStrCopy
 006DC49B    mov         eax,dword ptr [ebp-20]
 006DC49E    call        004F8DB8
 006DC4A3    mov         eax,dword ptr [ebp+10]
 006DC4A6    fstp        dword ptr [eax]
 006DC4A8    wait
 006DC4A9    mov         eax,dword ptr [ebp+0C]
 006DC4AC    fld         dword ptr [eax]
 006DC4AE    add         esp,0FFFFFFF4
 006DC4B1    fstp        tbyte ptr [esp]
 006DC4B4    wait
 006DC4B5    lea         eax,[ebp-24]
 006DC4B8    push        eax
 006DC4B9    mov         ecx,7
 006DC4BE    mov         edx,20
 006DC4C3    mov         eax,dword ptr [ebp-4]
 006DC4C6    call        @UStrCopy
 006DC4CB    mov         eax,dword ptr [ebp-24]
 006DC4CE    call        004F8DB8
 006DC4D3    mov         eax,dword ptr [ebp+0C]
 006DC4D6    fstp        dword ptr [eax]
 006DC4D8    wait
 006DC4D9    mov         eax,dword ptr [ebp+8]
 006DC4DC    fld         dword ptr [eax]
 006DC4DE    add         esp,0FFFFFFF4
 006DC4E1    fstp        tbyte ptr [esp]
 006DC4E4    wait
 006DC4E5    lea         eax,[ebp-28]
 006DC4E8    push        eax
 006DC4E9    mov         ecx,7
 006DC4EE    mov         edx,27
 006DC4F3    mov         eax,dword ptr [ebp-4]
 006DC4F6    call        @UStrCopy
 006DC4FB    mov         eax,dword ptr [ebp-28]
 006DC4FE    call        004F8DB8
 006DC503    mov         eax,dword ptr [ebp+8]
 006DC506    fstp        dword ptr [eax]
 006DC508    wait
 006DC509    mov         byte ptr [ebp-9],1
>006DC50D    jmp         006DC694
 006DC512    mov         eax,dword ptr [ebp-4]
 006DC515    cmp         word ptr [eax+ebx*2+10],2E
>006DC51B    jne         006DC694
 006DC521    mov         eax,dword ptr [ebp-4]
 006DC524    movzx       eax,word ptr [eax+4]
 006DC528    mov         edx,dword ptr [ebp-8]
 006DC52B    mov         word ptr [edx],ax
 006DC52E    sub         ebx,4
 006DC531    mov         eax,dword ptr [ebp+1C]
 006DC534    fld         dword ptr [eax]
 006DC536    add         esp,0FFFFFFF4
 006DC539    fstp        tbyte ptr [esp]
 006DC53C    wait
 006DC53D    lea         eax,[ebp-30]
 006DC540    push        eax
 006DC541    mov         ecx,9
 006DC546    mov         edx,ebx
 006DC548    mov         eax,dword ptr [ebp-4]
 006DC54B    call        @UStrCopy
 006DC550    mov         eax,dword ptr [ebp-30]
 006DC553    lea         edx,[ebp-2C]
 006DC556    call        Trim
 006DC55B    mov         eax,dword ptr [ebp-2C]
 006DC55E    call        004F8DB8
 006DC563    mov         eax,dword ptr [ebp+1C]
 006DC566    fstp        dword ptr [eax]
 006DC568    wait
 006DC569    add         ebx,9
 006DC56C    mov         eax,dword ptr [ebp+18]
 006DC56F    fld         dword ptr [eax]
 006DC571    add         esp,0FFFFFFF4
 006DC574    fstp        tbyte ptr [esp]
 006DC577    wait
 006DC578    lea         eax,[ebp-38]
 006DC57B    push        eax
 006DC57C    mov         ecx,9
 006DC581    mov         edx,ebx
 006DC583    mov         eax,dword ptr [ebp-4]
 006DC586    call        @UStrCopy
 006DC58B    mov         eax,dword ptr [ebp-38]
 006DC58E    lea         edx,[ebp-34]
 006DC591    call        Trim
 006DC596    mov         eax,dword ptr [ebp-34]
 006DC599    call        004F8DB8
 006DC59E    mov         eax,dword ptr [ebp+18]
 006DC5A1    fstp        dword ptr [eax]
 006DC5A3    wait
 006DC5A4    add         ebx,9
 006DC5A7    mov         eax,dword ptr [ebp+14]
 006DC5AA    fld         dword ptr [eax]
 006DC5AC    add         esp,0FFFFFFF4
 006DC5AF    fstp        tbyte ptr [esp]
 006DC5B2    wait
 006DC5B3    lea         eax,[ebp-40]
 006DC5B6    push        eax
 006DC5B7    mov         ecx,9
 006DC5BC    mov         edx,ebx
 006DC5BE    mov         eax,dword ptr [ebp-4]
 006DC5C1    call        @UStrCopy
 006DC5C6    mov         eax,dword ptr [ebp-40]
 006DC5C9    lea         edx,[ebp-3C]
 006DC5CC    call        Trim
 006DC5D1    mov         eax,dword ptr [ebp-3C]
 006DC5D4    call        004F8DB8
 006DC5D9    mov         eax,dword ptr [ebp+14]
 006DC5DC    fstp        dword ptr [eax]
 006DC5DE    wait
 006DC5DF    add         ebx,9
 006DC5E2    mov         eax,dword ptr [ebp+10]
 006DC5E5    fld         dword ptr [eax]
 006DC5E7    add         esp,0FFFFFFF4
 006DC5EA    fstp        tbyte ptr [esp]
 006DC5ED    wait
 006DC5EE    lea         eax,[ebp-48]
 006DC5F1    push        eax
 006DC5F2    mov         ecx,9
 006DC5F7    mov         edx,ebx
 006DC5F9    mov         eax,dword ptr [ebp-4]
 006DC5FC    call        @UStrCopy
 006DC601    mov         eax,dword ptr [ebp-48]
 006DC604    lea         edx,[ebp-44]
 006DC607    call        Trim
 006DC60C    mov         eax,dword ptr [ebp-44]
 006DC60F    call        004F8DB8
 006DC614    mov         eax,dword ptr [ebp+10]
 006DC617    fstp        dword ptr [eax]
 006DC619    wait
 006DC61A    add         ebx,9
 006DC61D    mov         eax,dword ptr [ebp+0C]
 006DC620    fld         dword ptr [eax]
 006DC622    add         esp,0FFFFFFF4
 006DC625    fstp        tbyte ptr [esp]
 006DC628    wait
 006DC629    lea         eax,[ebp-50]
 006DC62C    push        eax
 006DC62D    mov         ecx,9
 006DC632    mov         edx,ebx
 006DC634    mov         eax,dword ptr [ebp-4]
 006DC637    call        @UStrCopy
 006DC63C    mov         eax,dword ptr [ebp-50]
 006DC63F    lea         edx,[ebp-4C]
 006DC642    call        Trim
 006DC647    mov         eax,dword ptr [ebp-4C]
 006DC64A    call        004F8DB8
 006DC64F    mov         eax,dword ptr [ebp+0C]
 006DC652    fstp        dword ptr [eax]
 006DC654    wait
 006DC655    add         ebx,9
 006DC658    mov         eax,dword ptr [ebp+8]
 006DC65B    fld         dword ptr [eax]
 006DC65D    add         esp,0FFFFFFF4
 006DC660    fstp        tbyte ptr [esp]
 006DC663    wait
 006DC664    lea         eax,[ebp-58]
 006DC667    push        eax
 006DC668    mov         ecx,9
 006DC66D    mov         edx,ebx
 006DC66F    mov         eax,dword ptr [ebp-4]
 006DC672    call        @UStrCopy
 006DC677    mov         eax,dword ptr [ebp-58]
 006DC67A    lea         edx,[ebp-54]
 006DC67D    call        Trim
 006DC682    mov         eax,dword ptr [ebp-54]
 006DC685    call        004F8DB8
 006DC68A    mov         eax,dword ptr [ebp+8]
 006DC68D    fstp        dword ptr [eax]
 006DC68F    wait
 006DC690    mov         byte ptr [ebp-9],1
 006DC694    xor         eax,eax
 006DC696    pop         edx
 006DC697    pop         ecx
 006DC698    pop         ecx
 006DC699    mov         dword ptr fs:[eax],edx
 006DC69C    push        6DC6BE
 006DC6A1    lea         eax,[ebp-58]
 006DC6A4    mov         edx,13
 006DC6A9    call        @UStrArrayClr
 006DC6AE    lea         eax,[ebp-4]
 006DC6B1    call        @UStrClr
 006DC6B6    ret
>006DC6B7    jmp         @HandleFinally
>006DC6BC    jmp         006DC6A1
 006DC6BE    movzx       eax,byte ptr [ebp-9]
 006DC6C2    pop         esi
 006DC6C3    pop         ebx
 006DC6C4    mov         esp,ebp
 006DC6C6    pop         ebp
 006DC6C7    ret         18
end;*}

//006DC6DC
procedure sub_006DC6DC;
begin
{*
 006DC6DC    push        ebp
 006DC6DD    mov         ebp,esp
 006DC6DF    add         esp,0FFFFFFBC
 006DC6E2    push        ebx
 006DC6E3    push        esi
 006DC6E4    push        edi
 006DC6E5    xor         eax,eax
 006DC6E7    mov         dword ptr [ebp-44],eax
 006DC6EA    mov         dword ptr [ebp-4],eax
 006DC6ED    xor         eax,eax
 006DC6EF    push        ebp
 006DC6F0    push        6DC902
 006DC6F5    push        dword ptr fs:[eax]
 006DC6F8    mov         dword ptr fs:[eax],esp
 006DC6FB    mov         byte ptr ds:[820105],0;gvar_00820105
 006DC702    cmp         byte ptr ds:[820104],0;gvar_00820104
>006DC709    je          006DC8E4
 006DC70F    mov         dword ptr [ebp-8],1
 006DC716    mov         dword ptr [ebp-10],82010D
 006DC71D    mov         ebx,82011C;gvar_0082011C:Integer
 006DC722    mov         esi,820158;gvar_00820158
 006DC727    mov         edi,82024C;gvar_0082024C
 006DC72C    mov         eax,dword ptr [ebp-10]
 006DC72F    cmp         byte ptr [eax],0
>006DC732    jne         006DC74E
 006DC734    cmp         byte ptr ds:[82010C],0;gvar_0082010C
>006DC73B    je          006DC8CB
 006DC741    cmp         dword ptr ds:[820118],0FFFFFFFF;gvar_00820118
>006DC748    jne         006DC8CB
 006DC74E    push        6DC91C;'COM'
 006DC753    lea         edx,[ebp-44]
 006DC756    mov         eax,dword ptr [ebp-8]
 006DC759    call        IntToStr
 006DC75E    push        dword ptr [ebp-44]
 006DC761    push        6DC930;':'
 006DC766    lea         eax,[ebp-4]
 006DC769    mov         edx,3
 006DC76E    call        @UStrCatN
 006DC773    push        0
 006DC775    push        0
 006DC777    push        3
 006DC779    push        0
 006DC77B    push        0
 006DC77D    push        0C0000000
 006DC782    mov         eax,dword ptr [ebp-4]
 006DC785    call        @UStrToPWChar
 006DC78A    push        eax
 006DC78B    call        kernel32.CreateFileW
 006DC790    mov         dword ptr [ebx],eax
 006DC792    cmp         dword ptr [ebx],0FFFFFFFF
>006DC795    je          006DC8CB
 006DC79B    mov         dword ptr [esi],1C
 006DC7A1    push        esi
 006DC7A2    mov         eax,dword ptr [ebx]
 006DC7A4    push        eax
 006DC7A5    call        kernel32.GetCommState
 006DC7AA    test        eax,eax
>006DC7AC    jne         006DC7C1
 006DC7AE    mov         eax,dword ptr [ebx]
 006DC7B0    push        eax
 006DC7B1    call        kernel32.CloseHandle
 006DC7B6    mov         dword ptr [ebx],0FFFFFFFF
>006DC7BC    jmp         006DC8CB
 006DC7C1    push        edi
 006DC7C2    mov         eax,dword ptr [ebx]
 006DC7C4    push        eax
 006DC7C5    call        kernel32.GetCommTimeouts
 006DC7CA    test        eax,eax
>006DC7CC    jne         006DC7E1
 006DC7CE    mov         eax,dword ptr [ebx]
 006DC7D0    push        eax
 006DC7D1    call        kernel32.CloseHandle
 006DC7D6    mov         dword ptr [ebx],0FFFFFFFF
>006DC7DC    jmp         006DC8CB
 006DC7E1    push        esi
 006DC7E2    push        edi
 006DC7E3    mov         esi,edi
 006DC7E5    lea         edi,[ebp-40]
 006DC7E8    movs        dword ptr [edi],dword ptr [esi]
 006DC7E9    movs        dword ptr [edi],dword ptr [esi]
 006DC7EA    movs        dword ptr [edi],dword ptr [esi]
 006DC7EB    movs        dword ptr [edi],dword ptr [esi]
 006DC7EC    movs        dword ptr [edi],dword ptr [esi]
 006DC7ED    pop         edi
 006DC7EE    pop         esi
 006DC7EF    push        esi
 006DC7F0    push        edi
 006DC7F1    lea         edi,[ebp-2C]
 006DC7F4    mov         ecx,7
 006DC7F9    rep movs    dword ptr [edi],dword ptr [esi]
 006DC7FB    pop         edi
 006DC7FC    pop         esi
 006DC7FD    mov         dword ptr [ebp-28],1C200
 006DC804    mov         byte ptr [ebp-1A],8
 006DC808    mov         byte ptr [ebp-19],0
 006DC80C    mov         byte ptr [ebp-18],0
 006DC810    mov         eax,dword ptr [ebp-24]
 006DC813    or          eax,1
 006DC816    or          eax,2
 006DC819    mov         dword ptr [ebp-24],eax
 006DC81C    lea         eax,[ebp-2C]
 006DC81F    push        eax
 006DC820    mov         eax,dword ptr [ebx]
 006DC822    push        eax
 006DC823    call        kernel32.SetCommState
 006DC828    test        eax,eax
>006DC82A    jne         006DC83F
 006DC82C    mov         eax,dword ptr [ebx]
 006DC82E    push        eax
 006DC82F    call        kernel32.CloseHandle
 006DC834    mov         dword ptr [ebx],0FFFFFFFF
>006DC83A    jmp         006DC8CB
 006DC83F    mov         dword ptr [ebp-40],0FFFFFFFF
 006DC846    xor         eax,eax
 006DC848    mov         dword ptr [ebp-3C],eax
 006DC84B    xor         eax,eax
 006DC84D    mov         dword ptr [ebp-38],eax
 006DC850    lea         eax,[ebp-40]
 006DC853    push        eax
 006DC854    mov         eax,dword ptr [ebx]
 006DC856    push        eax
 006DC857    call        kernel32.SetCommTimeouts
 006DC85C    test        eax,eax
>006DC85E    jne         006DC879
 006DC860    push        esi
 006DC861    mov         eax,dword ptr [ebx]
 006DC863    push        eax
 006DC864    call        kernel32.SetCommState
 006DC869    mov         eax,dword ptr [ebx]
 006DC86B    push        eax
 006DC86C    call        kernel32.CloseHandle
 006DC871    mov         dword ptr [ebx],0FFFFFFFF
>006DC877    jmp         006DC8CB
 006DC879    mov         byte ptr ds:[820105],1;gvar_00820105
 006DC880    cmp         dword ptr ds:[820118],0FFFFFFFF;gvar_00820118
>006DC887    jne         006DC898
 006DC889    mov         eax,dword ptr [ebx]
 006DC88B    mov         [00820118],eax;gvar_00820118
 006DC890    mov         eax,dword ptr [ebp-8]
 006DC893    mov         [00821510],eax;gvar_00821510
 006DC898    lea         eax,[ebp-4]
 006DC89B    mov         edx,6DC940;'FUB*B1B2B3B4C'
 006DC8A0    call        @UStrLAsg
 006DC8A5    lea         eax,[ebp-4]
 006DC8A8    call        @UniqueStringU
 006DC8AD    mov         edx,eax
 006DC8AF    mov         eax,dword ptr [ebp-4]
 006DC8B2    test        eax,eax
>006DC8B4    je          006DC8BB
 006DC8B6    sub         eax,4
 006DC8B9    mov         eax,dword ptr [eax]
 006DC8BB    push        0
 006DC8BD    lea         ecx,[ebp-0C]
 006DC8C0    push        ecx
 006DC8C1    push        eax
 006DC8C2    push        edx
 006DC8C3    mov         eax,dword ptr [ebx]
 006DC8C5    push        eax
 006DC8C6    call        kernel32.WriteFile
 006DC8CB    inc         dword ptr [ebp-8]
 006DC8CE    add         edi,14
 006DC8D1    add         esi,1C
 006DC8D4    add         ebx,4
 006DC8D7    inc         dword ptr [ebp-10]
 006DC8DA    cmp         dword ptr [ebp-8],9
>006DC8DE    jne         006DC72C
 006DC8E4    xor         eax,eax
 006DC8E6    pop         edx
 006DC8E7    pop         ecx
 006DC8E8    pop         ecx
 006DC8E9    mov         dword ptr fs:[eax],edx
 006DC8EC    push        6DC909
 006DC8F1    lea         eax,[ebp-44]
 006DC8F4    call        @UStrClr
 006DC8F9    lea         eax,[ebp-4]
 006DC8FC    call        @UStrClr
 006DC901    ret
>006DC902    jmp         @HandleFinally
>006DC907    jmp         006DC8F1
 006DC909    pop         edi
 006DC90A    pop         esi
 006DC90B    pop         ebx
 006DC90C    mov         esp,ebp
 006DC90E    pop         ebp
 006DC90F    ret
*}
end;

//006DC96C
procedure sub_006DC96C;
begin
{*
 006DC96C    push        ebx
 006DC96D    push        esi
 006DC96E    push        edi
 006DC96F    push        ebp
 006DC970    movzx       eax,byte ptr ds:[820104];gvar_00820104
 006DC977    and         al,byte ptr ds:[820105];gvar_00820105
>006DC97D    je          006DC9CB
 006DC97F    mov         ebp,8
 006DC984    mov         ebx,82011C;gvar_0082011C:Integer
 006DC989    mov         esi,820158;gvar_00820158
 006DC98E    mov         edi,82024C;gvar_0082024C
 006DC993    mov         eax,dword ptr [ebx]
 006DC995    cmp         eax,0FFFFFFFF
>006DC998    je          006DC9B8
 006DC99A    push        esi
 006DC99B    push        eax
 006DC99C    call        kernel32.SetCommState
 006DC9A1    push        edi
 006DC9A2    mov         eax,dword ptr [ebx]
 006DC9A4    push        eax
 006DC9A5    call        kernel32.SetCommTimeouts
 006DC9AA    mov         eax,dword ptr [ebx]
 006DC9AC    push        eax
 006DC9AD    call        kernel32.CloseHandle
 006DC9B2    mov         dword ptr [ebx],0FFFFFFFF
 006DC9B8    add         edi,14
 006DC9BB    add         esi,1C
 006DC9BE    add         ebx,4
 006DC9C1    dec         ebp
>006DC9C2    jne         006DC993
 006DC9C4    mov         byte ptr ds:[820105],0;gvar_00820105
 006DC9CB    pop         ebp
 006DC9CC    pop         edi
 006DC9CD    pop         esi
 006DC9CE    pop         ebx
 006DC9CF    ret
*}
end;

//006DC9D0
{*function sub_006DC9D0(?:?):?;
begin
 006DC9D0    push        ebp
 006DC9D1    mov         ebp,esp
 006DC9D3    add         esp,0FFFFFFD4
 006DC9D6    push        ebx
 006DC9D7    push        esi
 006DC9D8    push        edi
 006DC9D9    xor         edx,edx
 006DC9DB    mov         dword ptr [ebp-4],edx
 006DC9DE    mov         ebx,eax
 006DC9E0    mov         edi,8214EC;gvar_008214EC:UnicodeString
 006DC9E5    xor         eax,eax
 006DC9E7    push        ebp
 006DC9E8    push        6DCB0C
 006DC9ED    push        dword ptr fs:[eax]
 006DC9F0    mov         dword ptr fs:[eax],esp
>006DC9F3    jmp         006DCA07
 006DC9F5    lea         eax,[edi+ebx*4]
 006DC9F8    mov         ecx,1
 006DC9FD    mov         edx,1
 006DCA02    call        @UStrDelete
 006DCA07    mov         eax,dword ptr [edi+ebx*4]
 006DCA0A    call        @UStrLen
 006DCA0F    test        eax,eax
>006DCA11    jle         006DCA25
 006DCA13    mov         eax,dword ptr [edi+ebx*4]
 006DCA16    movzx       esi,word ptr [eax]
 006DCA19    cmp         si,0D
>006DCA1D    je          006DC9F5
 006DCA1F    cmp         si,0A
>006DCA23    je          006DC9F5
 006DCA25    mov         edx,dword ptr [edi+ebx*4]
 006DCA28    mov         eax,6DCB2C;''
 006DCA2D    call        Pos
 006DCA32    mov         esi,eax
 006DCA34    test        esi,esi
>006DCA36    jne         006DCA47
 006DCA38    mov         edx,dword ptr [edi+ebx*4]
 006DCA3B    mov         eax,6DCB3C;'
'
 006DCA40    call        Pos
 006DCA45    mov         esi,eax
 006DCA47    test        esi,esi
>006DCA49    jne         006DCA54
 006DCA4B    mov         byte ptr [ebp-5],0
>006DCA4F    jmp         006DCAF6
 006DCA54    mov         byte ptr [ebp-5],1
 006DCA58    lea         eax,[ebp-4]
 006DCA5B    push        eax
 006DCA5C    mov         ecx,esi
 006DCA5E    dec         ecx
 006DCA5F    mov         eax,dword ptr [edi+ebx*4]
 006DCA62    mov         edx,1
 006DCA67    call        @UStrCopy
 006DCA6C    lea         eax,[edi+ebx*4]
 006DCA6F    mov         ecx,esi
 006DCA71    mov         edx,1
 006DCA76    call        @UStrDelete
 006DCA7B    mov         word ptr [ebp-14],21
 006DCA81    xor         eax,eax
 006DCA83    mov         dword ptr [ebp-2C],eax
 006DCA86    xor         eax,eax
 006DCA88    mov         dword ptr [ebp-28],eax
 006DCA8B    xor         eax,eax
 006DCA8D    mov         dword ptr [ebp-24],eax
 006DCA90    xor         eax,eax
 006DCA92    mov         dword ptr [ebp-20],eax
 006DCA95    xor         eax,eax
 006DCA97    mov         dword ptr [ebp-1C],eax
 006DCA9A    xor         eax,eax
 006DCA9C    mov         dword ptr [ebp-18],eax
 006DCA9F    lea         eax,[ebp-2C]
 006DCAA2    push        eax
 006DCAA3    lea         eax,[ebp-28]
 006DCAA6    push        eax
 006DCAA7    lea         eax,[ebp-24]
 006DCAAA    push        eax
 006DCAAB    lea         eax,[ebp-20]
 006DCAAE    push        eax
 006DCAAF    lea         eax,[ebp-1C]
 006DCAB2    push        eax
 006DCAB3    lea         eax,[ebp-18]
 006DCAB6    push        eax
 006DCAB7    lea         ecx,[ebp-14]
 006DCABA    lea         edx,[ebp-0C]
 006DCABD    mov         eax,dword ptr [ebp-4]
 006DCAC0    call        006DC30C
 006DCAC5    test        al,al
>006DCAC7    je          006DCAF6
 006DCAC9    cmp         dword ptr [ebp-0C],1
>006DCACD    jl          006DCAF6
 006DCACF    cmp         dword ptr [ebp-0C],0C
>006DCAD3    jg          006DCAF6
 006DCAD5    mov         eax,dword ptr [ebp-0C]
 006DCAD8    add         eax,eax
 006DCADA    add         eax,eax
 006DCADC    mov         edx,ebx
 006DCADE    shl         edx,6
 006DCAE1    lea         edx,[edx*8+8202EC];gvar_008202EC
 006DCAE8    lea         edi,[edx+eax*8-20]
 006DCAEC    lea         esi,[ebp-2C]
 006DCAEF    mov         ecx,8
 006DCAF4    rep movs    dword ptr [edi],dword ptr [esi]
 006DCAF6    xor         eax,eax
 006DCAF8    pop         edx
 006DCAF9    pop         ecx
 006DCAFA    pop         ecx
 006DCAFB    mov         dword ptr fs:[eax],edx
 006DCAFE    push        6DCB13
 006DCB03    lea         eax,[ebp-4]
 006DCB06    call        @UStrClr
 006DCB0B    ret
>006DCB0C    jmp         @HandleFinally
>006DCB11    jmp         006DCB03
 006DCB13    movzx       eax,byte ptr [ebp-5]
 006DCB17    pop         edi
 006DCB18    pop         esi
 006DCB19    pop         ebx
 006DCB1A    mov         esp,ebp
 006DCB1C    pop         ebp
 006DCB1D    ret
end;*}

//006DCB40
{*function sub_006DCB40:?;
begin
 006DCB40    push        ebp
 006DCB41    mov         ebp,esp
 006DCB43    add         esp,0FFFFFFEC
 006DCB46    push        ebx
 006DCB47    push        esi
 006DCB48    push        edi
 006DCB49    xor         eax,eax
 006DCB4B    mov         dword ptr [ebp-14],eax
 006DCB4E    mov         dword ptr [ebp-4],eax
 006DCB51    xor         eax,eax
 006DCB53    push        ebp
 006DCB54    push        6DCC17
 006DCB59    push        dword ptr fs:[eax]
 006DCB5C    mov         dword ptr fs:[eax],esp
 006DCB5F    movzx       eax,byte ptr ds:[820104];gvar_00820104
 006DCB66    and         al,byte ptr ds:[820105];gvar_00820105
>006DCB6C    je          006DCBF7
 006DCB72    xor         edi,edi
 006DCB74    mov         dword ptr [ebp-10],82010C;gvar_0082010C
 006DCB7B    mov         ebx,820118;gvar_00820118
 006DCB80    mov         esi,8214EC;gvar_008214EC:UnicodeString
 006DCB85    mov         eax,dword ptr [ebp-10]
 006DCB88    cmp         byte ptr [eax],0
>006DCB8B    je          006DCBE8
 006DCB8D    cmp         dword ptr [ebx],0FFFFFFFF
>006DCB90    je          006DCBE8
 006DCB92    lea         eax,[ebp-4]
 006DCB95    call        @UStrClr
 006DCB9A    push        0
 006DCB9C    lea         eax,[ebp-0C]
 006DCB9F    push        eax
 006DCBA0    push        1
 006DCBA2    lea         eax,[ebp-6]
 006DCBA5    push        eax
 006DCBA6    mov         eax,dword ptr [ebx]
 006DCBA8    push        eax
 006DCBA9    call        kernel32.ReadFile
 006DCBAE    test        eax,eax
>006DCBB0    jne         006DCBB6
 006DCBB2    xor         ebx,ebx
>006DCBB4    jmp         006DCBF9
 006DCBB6    lea         eax,[ebp-14]
 006DCBB9    movzx       edx,word ptr [ebp-6]
 006DCBBD    call        @UStrFromWChar
 006DCBC2    mov         edx,dword ptr [ebp-14]
 006DCBC5    lea         eax,[ebp-4]
 006DCBC8    call        @UStrCat
 006DCBCD    cmp         dword ptr [ebp-0C],0
>006DCBD1    jne         006DCB9A
 006DCBD3    mov         eax,esi
 006DCBD5    mov         edx,dword ptr [ebp-4]
 006DCBD8    call        @UStrCat
 006DCBDD    mov         eax,edi
 006DCBDF    call        006DC9D0
 006DCBE4    test        al,al
>006DCBE6    jne         006DCBDD
 006DCBE8    inc         edi
 006DCBE9    add         esi,4
 006DCBEC    add         ebx,4
 006DCBEF    inc         dword ptr [ebp-10]
 006DCBF2    cmp         edi,9
>006DCBF5    jne         006DCB85
 006DCBF7    mov         bl,1
 006DCBF9    xor         eax,eax
 006DCBFB    pop         edx
 006DCBFC    pop         ecx
 006DCBFD    pop         ecx
 006DCBFE    mov         dword ptr fs:[eax],edx
 006DCC01    push        6DCC1E
 006DCC06    lea         eax,[ebp-14]
 006DCC09    call        @UStrClr
 006DCC0E    lea         eax,[ebp-4]
 006DCC11    call        @UStrClr
 006DCC16    ret
>006DCC17    jmp         @HandleFinally
>006DCC1C    jmp         006DCC06
 006DCC1E    mov         eax,ebx
 006DCC20    pop         edi
 006DCC21    pop         esi
 006DCC22    pop         ebx
 006DCC23    mov         esp,ebp
 006DCC25    pop         ebp
 006DCC26    ret
end;*}

//006DCC28
{*function sub_006DCC28(?:UnicodeString):?;
begin
 006DCC28    push        ebp
 006DCC29    mov         ebp,esp
 006DCC2B    push        ecx
 006DCC2C    push        ebx
 006DCC2D    mov         dword ptr [ebp-4],eax
 006DCC30    mov         eax,dword ptr [ebp-4]
 006DCC33    call        @UStrAddRef
 006DCC38    xor         eax,eax
 006DCC3A    push        ebp
 006DCC3B    push        6DCC6B
 006DCC40    push        dword ptr fs:[eax]
 006DCC43    mov         dword ptr fs:[eax],esp
 006DCC46    mov         edx,dword ptr [ebp-4]
 006DCC49    mov         eax,[00820100];gvar_00820100:THashTable
 006DCC4E    call        THashTable.Get
 006DCC53    mov         ebx,eax
 006DCC55    xor         eax,eax
 006DCC57    pop         edx
 006DCC58    pop         ecx
 006DCC59    pop         ecx
 006DCC5A    mov         dword ptr fs:[eax],edx
 006DCC5D    push        6DCC72
 006DCC62    lea         eax,[ebp-4]
 006DCC65    call        @UStrClr
 006DCC6A    ret
>006DCC6B    jmp         @HandleFinally
>006DCC70    jmp         006DCC62
 006DCC72    mov         eax,ebx
 006DCC74    pop         ebx
 006DCC75    pop         ecx
 006DCC76    pop         ebp
 006DCC77    ret
end;*}

//006DCC78
{*procedure sub_006DCC78(?:Integer; ?:?);
begin
 006DCC78    push        ebx
 006DCC79    push        esi
 006DCC7A    mov         esi,edx
 006DCC7C    mov         ebx,eax
 006DCC7E    mov         ecx,esi
 006DCC80    mov         edx,ebx
 006DCC82    mov         eax,[00820100];gvar_00820100:THashTable
 006DCC87    call        THashTable.Get
 006DCC8C    pop         esi
 006DCC8D    pop         ebx
 006DCC8E    ret
end;*}

//006DCC90
{*function sub_006DCC90:?;
begin
 006DCC90    push        ebp
 006DCC91    mov         ebp,esp
 006DCC93    push        0
 006DCC95    push        ebx
 006DCC96    push        esi
 006DCC97    xor         eax,eax
 006DCC99    push        ebp
 006DCC9A    push        6DCCF4
 006DCC9F    push        dword ptr fs:[eax]
 006DCCA2    mov         dword ptr fs:[eax],esp
 006DCCA5    mov         dl,1
 006DCCA7    mov         eax,[0043C7BC];TStringList
 006DCCAC    call        TStringList.Create;TStringList.Create
 006DCCB1    mov         esi,eax
 006DCCB3    mov         dl,1
 006DCCB5    mov         eax,esi
 006DCCB7    call        TStringList.SetSorted
 006DCCBC    xor         ebx,ebx
 006DCCBE    lea         edx,[ebp-4]
 006DCCC1    mov         eax,ebx
 006DCCC3    call        006DCC78
 006DCCC8    cmp         dword ptr [ebp-4],0
>006DCCCC    je          006DCCD8
 006DCCCE    mov         edx,dword ptr [ebp-4]
 006DCCD1    mov         eax,esi
 006DCCD3    mov         ecx,dword ptr [eax]
 006DCCD5    call        dword ptr [ecx+38];TStringList.Add
 006DCCD8    inc         ebx
 006DCCD9    cmp         ebx,8
>006DCCDC    jne         006DCCBE
 006DCCDE    xor         eax,eax
 006DCCE0    pop         edx
 006DCCE1    pop         ecx
 006DCCE2    pop         ecx
 006DCCE3    mov         dword ptr fs:[eax],edx
 006DCCE6    push        6DCCFB
 006DCCEB    lea         eax,[ebp-4]
 006DCCEE    call        @UStrClr
 006DCCF3    ret
>006DCCF4    jmp         @HandleFinally
>006DCCF9    jmp         006DCCEB
 006DCCFB    mov         eax,esi
 006DCCFD    pop         esi
 006DCCFE    pop         ebx
 006DCCFF    pop         ecx
 006DCD00    pop         ebp
 006DCD01    ret
end;*}

//006DCD04
{*function sub_006DCD04:?;
begin
 006DCD04    push        ebx
 006DCD05    mov         dl,1
 006DCD07    mov         eax,[0043C7BC];TStringList
 006DCD0C    call        TStringList.Create;TStringList.Create
 006DCD11    mov         ebx,eax
 006DCD13    mov         edx,6DCD6C;'x'
 006DCD18    mov         eax,ebx
 006DCD1A    mov         ecx,dword ptr [eax]
 006DCD1C    call        dword ptr [ecx+38];TStringList.Add
 006DCD1F    mov         edx,6DCD7C;'y'
 006DCD24    mov         eax,ebx
 006DCD26    mov         ecx,dword ptr [eax]
 006DCD28    call        dword ptr [ecx+38];TStringList.Add
 006DCD2B    mov         edx,6DCD8C;'z'
 006DCD30    mov         eax,ebx
 006DCD32    mov         ecx,dword ptr [eax]
 006DCD34    call        dword ptr [ecx+38];TStringList.Add
 006DCD37    mov         edx,6DCD9C;'yaw'
 006DCD3C    mov         eax,ebx
 006DCD3E    mov         ecx,dword ptr [eax]
 006DCD40    call        dword ptr [ecx+38];TStringList.Add
 006DCD43    mov         edx,6DCDB0;'pitch'
 006DCD48    mov         eax,ebx
 006DCD4A    mov         ecx,dword ptr [eax]
 006DCD4C    call        dword ptr [ecx+38];TStringList.Add
 006DCD4F    mov         edx,6DCDC8;'roll'
 006DCD54    mov         eax,ebx
 006DCD56    mov         ecx,dword ptr [eax]
 006DCD58    call        dword ptr [ecx+38];TStringList.Add
 006DCD5B    mov         eax,ebx
 006DCD5D    pop         ebx
 006DCD5E    ret
end;*}

//006DCDD4
{*function sub_006DCDD4(?:?):?;
begin
 006DCDD4    push        ebp
 006DCDD5    mov         ebp,esp
 006DCDD7    push        ecx
 006DCDD8    push        ebx
 006DCDD9    mov         dword ptr [ebp-4],eax
 006DCDDC    mov         eax,dword ptr [ebp-4]
 006DCDDF    call        @UStrAddRef
 006DCDE4    xor         eax,eax
 006DCDE6    push        ebp
 006DCDE7    push        6DCE91
 006DCDEC    push        dword ptr fs:[eax]
 006DCDEF    mov         dword ptr fs:[eax],esp
 006DCDF2    lea         eax,[ebp-4]
 006DCDF5    mov         edx,6DCEAC;'Fastrak'
 006DCDFA    call        004F9BD0
 006DCDFF    test        al,al
>006DCE01    jne         006DCE5C
 006DCE03    lea         eax,[ebp-4]
 006DCE06    mov         edx,6DCEC8;'IsoTrak'
 006DCE0B    call        004F9BD0
 006DCE10    test        al,al
>006DCE12    jne         006DCE5C
 006DCE14    lea         eax,[ebp-4]
 006DCE17    mov         edx,6DCEE4;'Polhemus'
 006DCE1C    call        004F9BD0
 006DCE21    test        al,al
>006DCE23    jne         006DCE5C
 006DCE25    lea         eax,[ebp-4]
 006DCE28    mov         edx,6DCF04;'Liberty'
 006DCE2D    call        004F9BD0
 006DCE32    test        al,al
>006DCE34    jne         006DCE5C
 006DCE36    lea         eax,[ebp-4]
 006DCE39    mov         edx,6DCF20;'Latus'
 006DCE3E    call        004F9BD0
 006DCE43    test        al,al
>006DCE45    jne         006DCE5C
 006DCE47    lea         eax,[ebp-4]
 006DCE4A    mov         edx,6DCF38;'Patriot'
 006DCE4F    call        004F9BD0
 006DCE54    test        al,al
>006DCE56    jne         006DCE5C
 006DCE58    xor         ebx,ebx
>006DCE5A    jmp         006DCE7B
 006DCE5C    lea         eax,[ebp-4]
 006DCE5F    call        004F9D00
 006DCE64    lea         eax,[ebp-4]
 006DCE67    mov         edx,6DCF54;'.'
 006DCE6C    call        004F9BD0
 006DCE71    test        al,al
>006DCE73    jne         006DCE79
 006DCE75    xor         ebx,ebx
>006DCE77    jmp         006DCE7B
 006DCE79    mov         bl,1
 006DCE7B    xor         eax,eax
 006DCE7D    pop         edx
 006DCE7E    pop         ecx
 006DCE7F    pop         ecx
 006DCE80    mov         dword ptr fs:[eax],edx
 006DCE83    push        6DCE98
 006DCE88    lea         eax,[ebp-4]
 006DCE8B    call        @UStrClr
 006DCE90    ret
>006DCE91    jmp         @HandleFinally
>006DCE96    jmp         006DCE88
 006DCE98    mov         eax,ebx
 006DCE9A    pop         ebx
 006DCE9B    pop         ecx
 006DCE9C    pop         ebp
 006DCE9D    ret
end;*}

Initialization
//00782998
{*
 00782998    push        ebp
 00782999    mov         ebp,esp
 0078299B    xor         eax,eax
 0078299D    push        ebp
 0078299E    push        7829E0
 007829A3    push        dword ptr fs:[eax]
 007829A6    mov         dword ptr fs:[eax],esp
 007829A9    sub         dword ptr ds:[820108],1
>007829B0    jae         007829D2
 007829B2    mov         eax,7829F8;'Initializing PieFastrak'
 007829B7    call        004FA5FC
 007829BC    mov         dl,1
 007829BE    mov         eax,[0067D4A4];THashTable
 007829C3    call        THashTable.Create;THashTable.Create
 007829C8    mov         [00820100],eax;gvar_00820100:THashTable
 007829CD    call        006DBA78
 007829D2    xor         eax,eax
 007829D4    pop         edx
 007829D5    pop         ecx
 007829D6    pop         ecx
 007829D7    mov         dword ptr fs:[eax],edx
 007829DA    push        7829E7
 007829DF    ret
>007829E0    jmp         @HandleFinally
>007829E5    jmp         007829DF
 007829E7    pop         ebp
 007829E8    ret
*}
Finalization
//006DCF58
{*
 006DCF58    push        ebp
 006DCF59    mov         ebp,esp
 006DCF5B    xor         eax,eax
 006DCF5D    push        ebp
 006DCF5E    push        6DCFB5
 006DCF63    push        dword ptr fs:[eax]
 006DCF66    mov         dword ptr fs:[eax],esp
 006DCF69    inc         dword ptr ds:[820108]
>006DCF6F    jne         006DCFA7
 006DCF71    mov         eax,6DCFCC;'Finalizing PieFastrak'
 006DCF76    call        004FA5FC
 006DCF7B    mov         eax,[00820100];gvar_00820100:THashTable
 006DCF80    xor         edx,edx
 006DCF82    mov         dword ptr ds:[820100],edx;gvar_00820100:THashTable
 006DCF88    call        TObject.Free
 006DCF8D    call        006DC96C
 006DCF92    mov         eax,8214EC;gvar_008214EC:UnicodeString
 006DCF97    mov         ecx,9
 006DCF9C    mov         edx,dword ptr ds:[40128C];string
 006DCFA2    call        @FinalizeArray
 006DCFA7    xor         eax,eax
 006DCFA9    pop         edx
 006DCFAA    pop         ecx
 006DCFAB    pop         ecx
 006DCFAC    mov         dword ptr fs:[eax],edx
 006DCFAF    push        6DCFBC
 006DCFB4    ret
>006DCFB5    jmp         @HandleFinally
>006DCFBA    jmp         006DCFB4
 006DCFBC    pop         ebp
 006DCFBD    ret
*}
end.