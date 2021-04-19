//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IniFiles;

interface

uses
  SysUtils, Classes, IniFiles;

type
  EIniFileException = class(Exception)
  end;
  TCustomIniFile = class(TObject)
  published
    procedure WriteTime(Section:string; Name:string; Value:TDateTime);//0045A310
    procedure ReadSection(Section:string; Strings:TStrings);//00458D8C
    procedure ReadSections(Strings:TStrings);//00458D94
    procedure WriteDate(Section:string; Name:string; Value:TDateTime);//0045A1E0
    procedure WriteDateTime(Section:string; Name:string; Value:TDateTime);//0045A244
    procedure WriteFloat(Section:string; Name:string; Value:Double);//0045A2A8
    procedure ReadSections(Section:string; Strings:TStrings);//0045A8F8
    procedure DeleteKey(Section:string; Ident:string);//00458DAC
    procedure UpdateFile;//00458DB4
    function ValueExists(Section:string; Ident:string):Boolean;//0045A3B0
    procedure ReadSubSections(Section:string; Strings:TStrings; Recurse:Boolean);//0045A904
    procedure ReadSectionValues(Section:string; Strings:TStrings);//00458D9C
    procedure EraseSection(Section:string);//00458DA4
    procedure WriteBinaryStream(Section:string; Name:string; Value:TStream);//0045A5A0
    procedure WriteString(Section:string; Ident:string; Value:string);//00458D84
    function ReadInteger(Section:string; Ident:string; Default:Integer):Integer;//00459D50
    procedure WriteInteger(Section:string; Ident:string; Value:Integer);//00459E2C
    constructor Create;//00459CA8
    function SectionExists(Section:string):Boolean;//00459CE4
    procedure ReadString(Section:string; Ident:string; Default:string);//00458D7C
    function ReadBool(Section:string; Ident:string; Default:Boolean):Boolean;//00459E88
    function ReadDateTime(Section:string; Name:string; Default:TDateTime):TDateTime;//00459F80
    function ReadFloat(Section:string; Name:string; Default:Double):Double;//0045A04C
    function ReadTime(Section:string; Name:string; Default:TDateTime):TDateTime;//0045A114
    procedure WriteBool(Section:string; Ident:string; Value:Boolean);//0045A394
    function ReadBinaryStream(Section:string; Name:string; Value:TStream):Integer;//0045A420
    function ReadDate(Section:string; Name:string; Default:TDateTime):TDateTime;//00459EB4
  public
    ..FFileName:string;//f4
    procedure InternalReadSections(const Section:UnicodeString; Strings:TStrings; SubSectionNamesOnly:Boolean; Recurse:Boolean); virtual;//v0//0045A718
    procedure ReadString; virtual; abstract;//v4//00404A58
    procedure WriteString; virtual; abstract;//v8//00404A58
    function ReadInteger(Section:string; Ident:string; Default:Integer):Integer; virtual;//vC//00459D50
    procedure WriteInteger(Section:string; Ident:string; Value:Integer); virtual;//v10//00459E2C
    function ReadBool(Section:string; Ident:string; Default:Boolean):Boolean; virtual;//v14//00459E88
    procedure WriteBool(Section:string; Ident:string; Value:Boolean); virtual;//v18//0045A394
    function ReadBinaryStream(Section:string; Name:string; Value:TStream):Integer; virtual;//v1C//0045A420
    function ReadDate(Section:string; Name:string; Default:TDateTime):TDateTime; virtual;//v20//00459EB4
    function ReadDateTime(Section:string; Name:string; Default:TDateTime):TDateTime; virtual;//v24//00459F80
    function ReadFloat(Section:string; Name:string; Default:Double):Double; virtual;//v28//0045A04C
    function ReadTime(Section:string; Name:string; Default:TDateTime):TDateTime; virtual;//v2C//0045A114
    procedure WriteBinaryStream(Section:string; Name:string; Value:TStream); virtual;//v30//0045A5A0
    procedure WriteDate(Section:string; Name:string; Value:TDateTime); virtual;//v34//0045A1E0
    procedure WriteDateTime(Section:string; Name:string; Value:TDateTime); virtual;//v38//0045A244
    procedure WriteFloat(Section:string; Name:string; Value:Double); virtual;//v3C//0045A2A8
    procedure WriteTime(Section:string; Name:string; Value:TDateTime); virtual;//v40//0045A310
    procedure ReadSection; virtual; abstract;//v44//00404A58
    procedure ReadSections; virtual; abstract;//v48//00404A58
    procedure ReadSections(Section:string; Strings:TStrings); virtual;//v4C//0045A8F8
    procedure ReadSubSections(Section:string; Strings:TStrings; Recurse:Boolean); virtual;//v50//0045A904
    procedure ReadSectionValues; virtual; abstract;//v54//00404A58
    procedure EraseSection; virtual; abstract;//v58//00404A58
    procedure DeleteKey; virtual; abstract;//v5C//00404A58
    procedure UpdateFile; virtual; abstract;//v60//00404A58
    function ValueExists(Section:string; Ident:string):Boolean; virtual;//v64//0045A3B0
  end;
  THashItem = THashItem = record//size=C
f4:string;//f4
end;
Next:PHashItem;//f0
Key:string;//f4
Value:Integer;//f8
end;;
  :TStringHash.:1 = array of PHashItem;
//elSize = 4;
  TStringHash = class(TObject)
  published
    procedure Remove(Key:string);//0045AAE8
    function Modify(Key:string; Value:Integer):Boolean;//0045AAC0
    function ValueOf(Key:string):Integer;//0045AB08
    procedure Clear;//0045A978
    constructor Create;//0045A9C8
    destructor Destroy();//0045AA18
    procedure Add(Key:string; Value:Integer);//0045A918
  public
    Buckets::1;//f4
    destructor Destroy(); virtual;//0045AA18
    function HashOf(const Key:UnicodeString):Cardinal; virtual;//v0//0045AA8C
    function Find(const Key:UnicodeString):PPHashItem;//0045AA44
  end;
  THashedStringList = class(TStringList)
  published
    function IndexOfName(Name:string):Integer;//0045ABE8
    function IndexOf(S:string):Integer;//0045AB78
    destructor Destroy();//0045AB40
  public
    FValueHash:TStringHash;//f58
    FNameHash:TStringHash;//f5C
    FValueHashValid:Boolean;//f60
    FNameHashValid:Boolean;//f61
    destructor Destroy(); virtual;//0045AB40
    function IndexOf(S:string):Integer; virtual;//v54//0045AB78
    function IndexOfName(Name:string):Integer; virtual;//v58//0045ABE8
    procedure Changed; virtual;//v90//0045AB2C
    procedure UpdateNameHash;//0045AC58
    procedure UpdateValueHash;//0045AD80
  end;
  TMemIniFile = class(TCustomIniFile)
  published
    function ReadString(Section:string; Ident:string; Default:string):string;//0045B44C
    procedure ReadSectionValues(Section:string; Strings:TStrings);//0045B3D8
    procedure ReadSections(Strings:TStrings);//0045B3C4
    procedure Rename(FileName:string; Reload:Boolean);//0045B4F4
    procedure WriteString(Section:string; Ident:string; Value:string);//0045B7A4
    procedure UpdateFile;//0045B744
    procedure SetStrings(List:TStrings);//0045B580
    procedure ReadSection(Section:string; Strings:TStrings);//0045B2F8
    destructor Destroy();//0045AEE4
    constructor Create(Encoding:TEncoding);//0045AE8C
    constructor Create;//0045AE54
    procedure Clear;//0045AF90
    procedure GetStrings(List:TStrings);//0045B044
    procedure EraseSection(Section:string);//0045B00C
    procedure DeleteKey(Section:string; Ident:string);//0045AFC8
  public
    FSections:TStringList;//f8
    FEncoding:TEncoding;//fC
    destructor Destroy(); virtual;//0045AEE4
    function ReadString(Section:string; Ident:string; Default:string):string; virtual;//v4//0045B44C
    procedure WriteString(Section:string; Ident:string; Value:string); virtual;//v8//0045B7A4
    procedure ReadSection(Section:string; Strings:TStrings); virtual;//v44//0045B2F8
    procedure ReadSections(Strings:TStrings); virtual;//v48//0045B3C4
    procedure ReadSectionValues(Section:string; Strings:TStrings); virtual;//v54//0045B3D8
    procedure EraseSection(Section:string); virtual;//v58//0045B00C
    procedure DeleteKey(Section:string; Ident:string); virtual;//v5C//0045AFC8
    procedure UpdateFile; virtual;//v60//0045B744
    function AddSection(const Section:UnicodeString):TStrings;//0045AF20
    function GetCaseSensitive:Boolean;//0045B03C
    procedure LoadValues;//0045B194
    procedure SetCaseSensitive(Value:Boolean);//0045B518
  end;
  TIniFile = class(TCustomIniFile)
  published
    procedure EraseSection(Section:string);//0045BD9C
    procedure ReadSectionValues(Section:string; Strings:TStrings);//0045BC48
    procedure UpdateFile;//0045BE20
    procedure DeleteKey(Section:string; Ident:string);//0045BDF0
    procedure ReadSections(Strings:TStrings);//0045B960
    function ReadString(Section:string; Ident:string; Default:string):string;//0045B894
    destructor Destroy();//0045B868
    procedure ReadSection(Section:string; Strings:TStrings);//0045BBA0
    procedure WriteString(Section:string; Ident:string; Value:string);//0045B8F4
  public
    destructor Destroy(); virtual;//0045B868
    function ReadString(Section:string; Ident:string; Default:string):string; virtual;//v4//0045B894
    procedure WriteString(Section:string; Ident:string; Value:string); virtual;//v8//0045B8F4
    procedure ReadSection(Section:string; Strings:TStrings); virtual;//v44//0045BBA0
    procedure ReadSections(Strings:TStrings); virtual;//v48//0045B960
    procedure ReadSectionValues(Section:string; Strings:TStrings); virtual;//v54//0045BC48
    procedure EraseSection(Section:string); virtual;//v58//0045BD9C
    procedure DeleteKey(Section:string; Ident:string); virtual;//v5C//0045BDF0
    procedure UpdateFile; virtual;//v60//0045BE20
  end;
    procedure InternalReadSections(const Section:UnicodeString; Strings:TStrings; SubSectionNamesOnly:Boolean; Recurse:Boolean);//0045A718
    function HashOf(const Key:UnicodeString):Cardinal;//0045AA8C
    procedure Changed;//0045AB2C
    procedure ReadStringData;//0045BAE0

implementation

//00458D7C
procedure TCustomIniFile.ReadString(Section:string; Ident:string; Default:string);
begin
{*
>00458D7C    jmp         @AbstractError
*}
end;

//00458D84
procedure TCustomIniFile.WriteString(Section:string; Ident:string; Value:string);
begin
{*
>00458D84    jmp         @AbstractError
*}
end;

//00458D8C
procedure TCustomIniFile.ReadSection(Section:string; Strings:TStrings);
begin
{*
>00458D8C    jmp         @AbstractError
*}
end;

//00458D94
procedure TCustomIniFile.ReadSections(Strings:TStrings);
begin
{*
>00458D94    jmp         @AbstractError
*}
end;

//00458D9C
procedure TCustomIniFile.ReadSectionValues(Section:string; Strings:TStrings);
begin
{*
>00458D9C    jmp         @AbstractError
*}
end;

//00458DA4
procedure TCustomIniFile.EraseSection(Section:string);
begin
{*
>00458DA4    jmp         @AbstractError
*}
end;

//00458DAC
procedure TCustomIniFile.DeleteKey(Section:string; Ident:string);
begin
{*
>00458DAC    jmp         @AbstractError
*}
end;

//00458DB4
procedure TCustomIniFile.UpdateFile;
begin
{*
>00458DB4    jmp         @AbstractError
*}
end;

//00459CA8
constructor TCustomIniFile.Create;
begin
{*
 00459CA8    push        ebx
 00459CA9    push        esi
 00459CAA    push        edi
 00459CAB    test        dl,dl
>00459CAD    je          00459CB7
 00459CAF    add         esp,0FFFFFFF0
 00459CB2    call        @ClassCreate
 00459CB7    mov         esi,ecx
 00459CB9    mov         ebx,edx
 00459CBB    mov         edi,eax
 00459CBD    lea         eax,[edi+4]
 00459CC0    mov         edx,esi
 00459CC2    call        @UStrAsg
 00459CC7    mov         eax,edi
 00459CC9    test        bl,bl
>00459CCB    je          00459CDC
 00459CCD    call        @AfterConstruction
 00459CD2    pop         dword ptr fs:[0]
 00459CD9    add         esp,0C
 00459CDC    mov         eax,edi
 00459CDE    pop         edi
 00459CDF    pop         esi
 00459CE0    pop         ebx
 00459CE1    ret
*}
end;

//00459CE4
function TCustomIniFile.SectionExists(Section:string):Boolean;
begin
{*
 00459CE4    push        ebp
 00459CE5    mov         ebp,esp
 00459CE7    add         esp,0FFFFFFF8
 00459CEA    push        ebx
 00459CEB    push        esi
 00459CEC    mov         esi,edx
 00459CEE    mov         ebx,eax
 00459CF0    mov         dl,1
 00459CF2    mov         eax,[0043C7BC];TStringList
 00459CF7    call        TStringList.Create
 00459CFC    mov         dword ptr [ebp-8],eax
 00459CFF    xor         eax,eax
 00459D01    push        ebp
 00459D02    push        459D3D
 00459D07    push        dword ptr fs:[eax]
 00459D0A    mov         dword ptr fs:[eax],esp
 00459D0D    mov         ecx,dword ptr [ebp-8]
 00459D10    mov         edx,esi
 00459D12    mov         eax,ebx
 00459D14    mov         ebx,dword ptr [eax]
 00459D16    call        dword ptr [ebx+44]
 00459D19    mov         eax,dword ptr [ebp-8]
 00459D1C    mov         edx,dword ptr [eax]
 00459D1E    call        dword ptr [edx+14]
 00459D21    test        eax,eax
 00459D23    setg        byte ptr [ebp-1]
 00459D27    xor         eax,eax
 00459D29    pop         edx
 00459D2A    pop         ecx
 00459D2B    pop         ecx
 00459D2C    mov         dword ptr fs:[eax],edx
 00459D2F    push        459D44
 00459D34    mov         eax,dword ptr [ebp-8]
 00459D37    call        TObject.Free
 00459D3C    ret
>00459D3D    jmp         @HandleFinally
>00459D42    jmp         00459D34
 00459D44    movzx       eax,byte ptr [ebp-1]
 00459D48    pop         esi
 00459D49    pop         ebx
 00459D4A    pop         ecx
 00459D4B    pop         ecx
 00459D4C    pop         ebp
 00459D4D    ret
*}
end;

//00459D50
function TCustomIniFile.ReadInteger(Section:string; Ident:string; Default:Integer):Integer;
begin
{*
 00459D50    push        ebp
 00459D51    mov         ebp,esp
 00459D53    push        0
 00459D55    push        0
 00459D57    push        0
 00459D59    push        ebx
 00459D5A    push        esi
 00459D5B    mov         dword ptr [ebp-8],ecx
 00459D5E    mov         esi,edx
 00459D60    mov         ebx,eax
 00459D62    xor         eax,eax
 00459D64    push        ebp
 00459D65    push        459E09
 00459D6A    push        dword ptr fs:[eax]
 00459D6D    mov         dword ptr fs:[eax],esp
 00459D70    push        0
 00459D72    lea         eax,[ebp-4]
 00459D75    push        eax
 00459D76    mov         ecx,dword ptr [ebp-8]
 00459D79    mov         edx,esi
 00459D7B    mov         eax,ebx
 00459D7D    mov         ebx,dword ptr [eax]
 00459D7F    call        dword ptr [ebx+4]
 00459D82    mov         eax,dword ptr [ebp-4]
 00459D85    test        eax,eax
>00459D87    je          00459D8E
 00459D89    sub         eax,4
 00459D8C    mov         eax,dword ptr [eax]
 00459D8E    cmp         eax,2
>00459D91    jle         00459D9F
 00459D93    mov         eax,dword ptr [ebp-4]
 00459D96    cmp         word ptr [eax],30
 00459D9A    sete        al
>00459D9D    jmp         00459DA1
 00459D9F    xor         eax,eax
 00459DA1    test        al,al
>00459DA3    je          00459DDE
 00459DA5    mov         eax,dword ptr [ebp-4]
 00459DA8    movzx       eax,word ptr [eax+2]
 00459DAC    cmp         ax,58
>00459DB0    je          00459DB8
 00459DB2    cmp         ax,78
>00459DB6    jne         00459DDE
 00459DB8    lea         eax,[ebp-0C]
 00459DBB    push        eax
 00459DBC    mov         ecx,7FFFFFFF
 00459DC1    mov         edx,3
 00459DC6    mov         eax,dword ptr [ebp-4]
 00459DC9    call        @UStrCopy
 00459DCE    mov         ecx,dword ptr [ebp-0C]
 00459DD1    lea         eax,[ebp-4]
 00459DD4    mov         edx,459E28;'$'
 00459DD9    call        @UStrCat3
 00459DDE    mov         edx,dword ptr [ebp+8]
 00459DE1    mov         eax,dword ptr [ebp-4]
 00459DE4    call        StrToIntDef
 00459DE9    mov         ebx,eax
 00459DEB    xor         eax,eax
 00459DED    pop         edx
 00459DEE    pop         ecx
 00459DEF    pop         ecx
 00459DF0    mov         dword ptr fs:[eax],edx
 00459DF3    push        459E10
 00459DF8    lea         eax,[ebp-0C]
 00459DFB    call        @UStrClr
 00459E00    lea         eax,[ebp-4]
 00459E03    call        @UStrClr
 00459E08    ret
>00459E09    jmp         @HandleFinally
>00459E0E    jmp         00459DF8
 00459E10    mov         eax,ebx
 00459E12    pop         esi
 00459E13    pop         ebx
 00459E14    mov         esp,ebp
 00459E16    pop         ebp
 00459E17    ret         4
*}
end;

//00459E2C
procedure TCustomIniFile.WriteInteger(Section:string; Ident:string; Value:Integer);
begin
{*
 00459E2C    push        ebp
 00459E2D    mov         ebp,esp
 00459E2F    push        0
 00459E31    push        ebx
 00459E32    push        esi
 00459E33    push        edi
 00459E34    mov         edi,ecx
 00459E36    mov         esi,edx
 00459E38    mov         ebx,eax
 00459E3A    xor         eax,eax
 00459E3C    push        ebp
 00459E3D    push        459E78
 00459E42    push        dword ptr fs:[eax]
 00459E45    mov         dword ptr fs:[eax],esp
 00459E48    lea         edx,[ebp-4]
 00459E4B    mov         eax,dword ptr [ebp+8]
 00459E4E    call        IntToStr
 00459E53    mov         eax,dword ptr [ebp-4]
 00459E56    push        eax
 00459E57    mov         ecx,edi
 00459E59    mov         edx,esi
 00459E5B    mov         eax,ebx
 00459E5D    mov         ebx,dword ptr [eax]
 00459E5F    call        dword ptr [ebx+8]
 00459E62    xor         eax,eax
 00459E64    pop         edx
 00459E65    pop         ecx
 00459E66    pop         ecx
 00459E67    mov         dword ptr fs:[eax],edx
 00459E6A    push        459E7F
 00459E6F    lea         eax,[ebp-4]
 00459E72    call        @UStrClr
 00459E77    ret
>00459E78    jmp         @HandleFinally
>00459E7D    jmp         00459E6F
 00459E7F    pop         edi
 00459E80    pop         esi
 00459E81    pop         ebx
 00459E82    pop         ecx
 00459E83    pop         ebp
 00459E84    ret         4
*}
end;

//00459E88
function TCustomIniFile.ReadBool(Section:string; Ident:string; Default:Boolean):Boolean;
begin
{*
 00459E88    push        ebp
 00459E89    mov         ebp,esp
 00459E8B    push        ecx
 00459E8C    push        ebx
 00459E8D    push        esi
 00459E8E    mov         dword ptr [ebp-4],ecx
 00459E91    mov         esi,edx
 00459E93    mov         ebx,eax
 00459E95    movzx       eax,byte ptr [ebp+8]
 00459E99    push        eax
 00459E9A    mov         ecx,dword ptr [ebp-4]
 00459E9D    mov         edx,esi
 00459E9F    mov         eax,ebx
 00459EA1    mov         ebx,dword ptr [eax]
 00459EA3    call        dword ptr [ebx+0C]
 00459EA6    test        eax,eax
 00459EA8    setne       al
 00459EAB    pop         esi
 00459EAC    pop         ebx
 00459EAD    pop         ecx
 00459EAE    pop         ebp
 00459EAF    ret         4
*}
end;

//00459EB4
function TCustomIniFile.ReadDate(Section:string; Name:string; Default:TDateTime):TDateTime;
begin
{*
 00459EB4    push        ebp
 00459EB5    mov         ebp,esp
 00459EB7    add         esp,0FFFFFFE8
 00459EBA    push        ebx
 00459EBB    push        esi
 00459EBC    push        edi
 00459EBD    xor         ebx,ebx
 00459EBF    mov         dword ptr [ebp-4],ebx
 00459EC2    mov         dword ptr [ebp-8],ecx
 00459EC5    mov         esi,edx
 00459EC7    mov         ebx,eax
 00459EC9    xor         eax,eax
 00459ECB    push        ebp
 00459ECC    push        459F6C
 00459ED1    push        dword ptr fs:[eax]
 00459ED4    mov         dword ptr fs:[eax],esp
 00459ED7    push        0
 00459ED9    lea         eax,[ebp-4]
 00459EDC    push        eax
 00459EDD    mov         ecx,dword ptr [ebp-8]
 00459EE0    mov         edx,esi
 00459EE2    mov         eax,ebx
 00459EE4    mov         ebx,dword ptr [eax]
 00459EE6    call        dword ptr [ebx+4]
 00459EE9    mov         eax,dword ptr [ebp+8]
 00459EEC    mov         dword ptr [ebp-10],eax
 00459EEF    mov         eax,dword ptr [ebp+0C]
 00459EF2    mov         dword ptr [ebp-0C],eax
 00459EF5    cmp         dword ptr [ebp-4],0
>00459EF9    je          00459F56
 00459EFB    xor         eax,eax
 00459EFD    push        ebp
 00459EFE    push        459F31
 00459F03    push        dword ptr fs:[eax]
 00459F06    mov         dword ptr fs:[eax],esp
 00459F09    mov         edx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 00459F0F    mov         eax,dword ptr [ebp-4]
 00459F12    call        StrToDate
 00459F17    fstp        qword ptr [ebp-18]
 00459F1A    wait
 00459F1B    mov         eax,dword ptr [ebp-18]
 00459F1E    mov         dword ptr [ebp-10],eax
 00459F21    mov         eax,dword ptr [ebp-14]
 00459F24    mov         dword ptr [ebp-0C],eax
 00459F27    xor         eax,eax
 00459F29    pop         edx
 00459F2A    pop         ecx
 00459F2B    pop         ecx
 00459F2C    mov         dword ptr fs:[eax],edx
>00459F2F    jmp         00459F56
>00459F31    jmp         @HandleOnException
 00459F36    dd          2
 00459F3A    dd          0041A0BC;EConvertError
 00459F3E    dd          00459F51
 00459F42    dd          00000000
 00459F46    dd          00459F4C
>00459F4A    jmp         00459F51
 00459F4C    call        @RaiseAgain
 00459F51    call        @DoneExcept
 00459F56    xor         eax,eax
 00459F58    pop         edx
 00459F59    pop         ecx
 00459F5A    pop         ecx
 00459F5B    mov         dword ptr fs:[eax],edx
 00459F5E    push        459F73
 00459F63    lea         eax,[ebp-4]
 00459F66    call        @UStrClr
 00459F6B    ret
>00459F6C    jmp         @HandleFinally
>00459F71    jmp         00459F63
 00459F73    fld         qword ptr [ebp-10]
 00459F76    pop         edi
 00459F77    pop         esi
 00459F78    pop         ebx
 00459F79    mov         esp,ebp
 00459F7B    pop         ebp
 00459F7C    ret         8
*}
end;

//00459F80
function TCustomIniFile.ReadDateTime(Section:string; Name:string; Default:TDateTime):TDateTime;
begin
{*
 00459F80    push        ebp
 00459F81    mov         ebp,esp
 00459F83    add         esp,0FFFFFFE8
 00459F86    push        ebx
 00459F87    push        esi
 00459F88    push        edi
 00459F89    xor         ebx,ebx
 00459F8B    mov         dword ptr [ebp-4],ebx
 00459F8E    mov         dword ptr [ebp-8],ecx
 00459F91    mov         esi,edx
 00459F93    mov         ebx,eax
 00459F95    xor         eax,eax
 00459F97    push        ebp
 00459F98    push        45A038
 00459F9D    push        dword ptr fs:[eax]
 00459FA0    mov         dword ptr fs:[eax],esp
 00459FA3    push        0
 00459FA5    lea         eax,[ebp-4]
 00459FA8    push        eax
 00459FA9    mov         ecx,dword ptr [ebp-8]
 00459FAC    mov         edx,esi
 00459FAE    mov         eax,ebx
 00459FB0    mov         ebx,dword ptr [eax]
 00459FB2    call        dword ptr [ebx+4]
 00459FB5    mov         eax,dword ptr [ebp+8]
 00459FB8    mov         dword ptr [ebp-10],eax
 00459FBB    mov         eax,dword ptr [ebp+0C]
 00459FBE    mov         dword ptr [ebp-0C],eax
 00459FC1    cmp         dword ptr [ebp-4],0
>00459FC5    je          0045A022
 00459FC7    xor         eax,eax
 00459FC9    push        ebp
 00459FCA    push        459FFD
 00459FCF    push        dword ptr fs:[eax]
 00459FD2    mov         dword ptr fs:[eax],esp
 00459FD5    mov         edx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 00459FDB    mov         eax,dword ptr [ebp-4]
 00459FDE    call        StrToTime
 00459FE3    fstp        qword ptr [ebp-18]
 00459FE6    wait
 00459FE7    mov         eax,dword ptr [ebp-18]
 00459FEA    mov         dword ptr [ebp-10],eax
 00459FED    mov         eax,dword ptr [ebp-14]
 00459FF0    mov         dword ptr [ebp-0C],eax
 00459FF3    xor         eax,eax
 00459FF5    pop         edx
 00459FF6    pop         ecx
 00459FF7    pop         ecx
 00459FF8    mov         dword ptr fs:[eax],edx
>00459FFB    jmp         0045A022
>00459FFD    jmp         @HandleOnException
 0045A002    dd          2
 0045A006    dd          0041A0BC;EConvertError
 0045A00A    dd          0045A01D
 0045A00E    dd          00000000
 0045A012    dd          0045A018
>0045A016    jmp         0045A01D
 0045A018    call        @RaiseAgain
 0045A01D    call        @DoneExcept
 0045A022    xor         eax,eax
 0045A024    pop         edx
 0045A025    pop         ecx
 0045A026    pop         ecx
 0045A027    mov         dword ptr fs:[eax],edx
 0045A02A    push        45A03F
 0045A02F    lea         eax,[ebp-4]
 0045A032    call        @UStrClr
 0045A037    ret
>0045A038    jmp         @HandleFinally
>0045A03D    jmp         0045A02F
 0045A03F    fld         qword ptr [ebp-10]
 0045A042    pop         edi
 0045A043    pop         esi
 0045A044    pop         ebx
 0045A045    mov         esp,ebp
 0045A047    pop         ebp
 0045A048    ret         8
*}
end;

//0045A04C
function TCustomIniFile.ReadFloat(Section:string; Name:string; Default:Double):Double;
begin
{*
 0045A04C    push        ebp
 0045A04D    mov         ebp,esp
 0045A04F    add         esp,0FFFFFFE0
 0045A052    push        ebx
 0045A053    push        esi
 0045A054    push        edi
 0045A055    xor         ebx,ebx
 0045A057    mov         dword ptr [ebp-4],ebx
 0045A05A    mov         dword ptr [ebp-8],ecx
 0045A05D    mov         esi,edx
 0045A05F    mov         ebx,eax
 0045A061    xor         eax,eax
 0045A063    push        ebp
 0045A064    push        45A0FF
 0045A069    push        dword ptr fs:[eax]
 0045A06C    mov         dword ptr fs:[eax],esp
 0045A06F    push        0
 0045A071    lea         eax,[ebp-4]
 0045A074    push        eax
 0045A075    mov         ecx,dword ptr [ebp-8]
 0045A078    mov         edx,esi
 0045A07A    mov         eax,ebx
 0045A07C    mov         ebx,dword ptr [eax]
 0045A07E    call        dword ptr [ebx+4]
 0045A081    mov         eax,dword ptr [ebp+8]
 0045A084    mov         dword ptr [ebp-10],eax
 0045A087    mov         eax,dword ptr [ebp+0C]
 0045A08A    mov         dword ptr [ebp-0C],eax
 0045A08D    cmp         dword ptr [ebp-4],0
>0045A091    je          0045A0E9
 0045A093    xor         eax,eax
 0045A095    push        ebp
 0045A096    push        45A0C4
 0045A09B    push        dword ptr fs:[eax]
 0045A09E    mov         dword ptr fs:[eax],esp
 0045A0A1    mov         edx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 0045A0A7    mov         eax,dword ptr [ebp-4]
 0045A0AA    call        StrToFloat
 0045A0AF    fstp        tbyte ptr [ebp-20]
 0045A0B2    wait
 0045A0B3    fld         tbyte ptr [ebp-20]
 0045A0B6    fstp        qword ptr [ebp-10]
 0045A0B9    wait
 0045A0BA    xor         eax,eax
 0045A0BC    pop         edx
 0045A0BD    pop         ecx
 0045A0BE    pop         ecx
 0045A0BF    mov         dword ptr fs:[eax],edx
>0045A0C2    jmp         0045A0E9
>0045A0C4    jmp         @HandleOnException
 0045A0C9    dd          2
 0045A0CD    dd          0041A0BC;EConvertError
 0045A0D1    dd          0045A0E4
 0045A0D5    dd          00000000
 0045A0D9    dd          0045A0DF
>0045A0DD    jmp         0045A0E4
 0045A0DF    call        @RaiseAgain
 0045A0E4    call        @DoneExcept
 0045A0E9    xor         eax,eax
 0045A0EB    pop         edx
 0045A0EC    pop         ecx
 0045A0ED    pop         ecx
 0045A0EE    mov         dword ptr fs:[eax],edx
 0045A0F1    push        45A106
 0045A0F6    lea         eax,[ebp-4]
 0045A0F9    call        @UStrClr
 0045A0FE    ret
>0045A0FF    jmp         @HandleFinally
>0045A104    jmp         0045A0F6
 0045A106    fld         qword ptr [ebp-10]
 0045A109    pop         edi
 0045A10A    pop         esi
 0045A10B    pop         ebx
 0045A10C    mov         esp,ebp
 0045A10E    pop         ebp
 0045A10F    ret         8
*}
end;

//0045A114
function TCustomIniFile.ReadTime(Section:string; Name:string; Default:TDateTime):TDateTime;
begin
{*
 0045A114    push        ebp
 0045A115    mov         ebp,esp
 0045A117    add         esp,0FFFFFFE8
 0045A11A    push        ebx
 0045A11B    push        esi
 0045A11C    push        edi
 0045A11D    xor         ebx,ebx
 0045A11F    mov         dword ptr [ebp-4],ebx
 0045A122    mov         dword ptr [ebp-8],ecx
 0045A125    mov         esi,edx
 0045A127    mov         ebx,eax
 0045A129    xor         eax,eax
 0045A12B    push        ebp
 0045A12C    push        45A1CC
 0045A131    push        dword ptr fs:[eax]
 0045A134    mov         dword ptr fs:[eax],esp
 0045A137    push        0
 0045A139    lea         eax,[ebp-4]
 0045A13C    push        eax
 0045A13D    mov         ecx,dword ptr [ebp-8]
 0045A140    mov         edx,esi
 0045A142    mov         eax,ebx
 0045A144    mov         ebx,dword ptr [eax]
 0045A146    call        dword ptr [ebx+4]
 0045A149    mov         eax,dword ptr [ebp+8]
 0045A14C    mov         dword ptr [ebp-10],eax
 0045A14F    mov         eax,dword ptr [ebp+0C]
 0045A152    mov         dword ptr [ebp-0C],eax
 0045A155    cmp         dword ptr [ebp-4],0
>0045A159    je          0045A1B6
 0045A15B    xor         eax,eax
 0045A15D    push        ebp
 0045A15E    push        45A191
 0045A163    push        dword ptr fs:[eax]
 0045A166    mov         dword ptr fs:[eax],esp
 0045A169    mov         edx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 0045A16F    mov         eax,dword ptr [ebp-4]
 0045A172    call        StrToDateTime
 0045A177    fstp        qword ptr [ebp-18]
 0045A17A    wait
 0045A17B    mov         eax,dword ptr [ebp-18]
 0045A17E    mov         dword ptr [ebp-10],eax
 0045A181    mov         eax,dword ptr [ebp-14]
 0045A184    mov         dword ptr [ebp-0C],eax
 0045A187    xor         eax,eax
 0045A189    pop         edx
 0045A18A    pop         ecx
 0045A18B    pop         ecx
 0045A18C    mov         dword ptr fs:[eax],edx
>0045A18F    jmp         0045A1B6
>0045A191    jmp         @HandleOnException
 0045A196    dd          2
 0045A19A    dd          0041A0BC;EConvertError
 0045A19E    dd          0045A1B1
 0045A1A2    dd          00000000
 0045A1A6    dd          0045A1AC
>0045A1AA    jmp         0045A1B1
 0045A1AC    call        @RaiseAgain
 0045A1B1    call        @DoneExcept
 0045A1B6    xor         eax,eax
 0045A1B8    pop         edx
 0045A1B9    pop         ecx
 0045A1BA    pop         ecx
 0045A1BB    mov         dword ptr fs:[eax],edx
 0045A1BE    push        45A1D3
 0045A1C3    lea         eax,[ebp-4]
 0045A1C6    call        @UStrClr
 0045A1CB    ret
>0045A1CC    jmp         @HandleFinally
>0045A1D1    jmp         0045A1C3
 0045A1D3    fld         qword ptr [ebp-10]
 0045A1D6    pop         edi
 0045A1D7    pop         esi
 0045A1D8    pop         ebx
 0045A1D9    mov         esp,ebp
 0045A1DB    pop         ebp
 0045A1DC    ret         8
*}
end;

//0045A1E0
procedure TCustomIniFile.WriteDate(Section:string; Name:string; Value:TDateTime);
begin
{*
 0045A1E0    push        ebp
 0045A1E1    mov         ebp,esp
 0045A1E3    push        0
 0045A1E5    push        ebx
 0045A1E6    push        esi
 0045A1E7    push        edi
 0045A1E8    mov         edi,ecx
 0045A1EA    mov         esi,edx
 0045A1EC    mov         ebx,eax
 0045A1EE    xor         eax,eax
 0045A1F0    push        ebp
 0045A1F1    push        45A234
 0045A1F6    push        dword ptr fs:[eax]
 0045A1F9    mov         dword ptr fs:[eax],esp
 0045A1FC    push        dword ptr [ebp+0C]
 0045A1FF    push        dword ptr [ebp+8]
 0045A202    lea         edx,[ebp-4]
 0045A205    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0045A20A    call        DateToStr
 0045A20F    mov         eax,dword ptr [ebp-4]
 0045A212    push        eax
 0045A213    mov         ecx,edi
 0045A215    mov         edx,esi
 0045A217    mov         eax,ebx
 0045A219    mov         ebx,dword ptr [eax]
 0045A21B    call        dword ptr [ebx+8]
 0045A21E    xor         eax,eax
 0045A220    pop         edx
 0045A221    pop         ecx
 0045A222    pop         ecx
 0045A223    mov         dword ptr fs:[eax],edx
 0045A226    push        45A23B
 0045A22B    lea         eax,[ebp-4]
 0045A22E    call        @UStrClr
 0045A233    ret
>0045A234    jmp         @HandleFinally
>0045A239    jmp         0045A22B
 0045A23B    pop         edi
 0045A23C    pop         esi
 0045A23D    pop         ebx
 0045A23E    pop         ecx
 0045A23F    pop         ebp
 0045A240    ret         8
*}
end;

//0045A244
procedure TCustomIniFile.WriteDateTime(Section:string; Name:string; Value:TDateTime);
begin
{*
 0045A244    push        ebp
 0045A245    mov         ebp,esp
 0045A247    push        0
 0045A249    push        ebx
 0045A24A    push        esi
 0045A24B    push        edi
 0045A24C    mov         edi,ecx
 0045A24E    mov         esi,edx
 0045A250    mov         ebx,eax
 0045A252    xor         eax,eax
 0045A254    push        ebp
 0045A255    push        45A298
 0045A25A    push        dword ptr fs:[eax]
 0045A25D    mov         dword ptr fs:[eax],esp
 0045A260    push        dword ptr [ebp+0C]
 0045A263    push        dword ptr [ebp+8]
 0045A266    lea         edx,[ebp-4]
 0045A269    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0045A26E    call        DateTimeToStr
 0045A273    mov         eax,dword ptr [ebp-4]
 0045A276    push        eax
 0045A277    mov         ecx,edi
 0045A279    mov         edx,esi
 0045A27B    mov         eax,ebx
 0045A27D    mov         ebx,dword ptr [eax]
 0045A27F    call        dword ptr [ebx+8]
 0045A282    xor         eax,eax
 0045A284    pop         edx
 0045A285    pop         ecx
 0045A286    pop         ecx
 0045A287    mov         dword ptr fs:[eax],edx
 0045A28A    push        45A29F
 0045A28F    lea         eax,[ebp-4]
 0045A292    call        @UStrClr
 0045A297    ret
>0045A298    jmp         @HandleFinally
>0045A29D    jmp         0045A28F
 0045A29F    pop         edi
 0045A2A0    pop         esi
 0045A2A1    pop         ebx
 0045A2A2    pop         ecx
 0045A2A3    pop         ebp
 0045A2A4    ret         8
*}
end;

//0045A2A8
procedure TCustomIniFile.WriteFloat(Section:string; Name:string; Value:Double);
begin
{*
 0045A2A8    push        ebp
 0045A2A9    mov         ebp,esp
 0045A2AB    push        0
 0045A2AD    push        ebx
 0045A2AE    push        esi
 0045A2AF    push        edi
 0045A2B0    mov         edi,ecx
 0045A2B2    mov         esi,edx
 0045A2B4    mov         ebx,eax
 0045A2B6    xor         eax,eax
 0045A2B8    push        ebp
 0045A2B9    push        45A300
 0045A2BE    push        dword ptr fs:[eax]
 0045A2C1    mov         dword ptr fs:[eax],esp
 0045A2C4    fld         qword ptr [ebp+8]
 0045A2C7    add         esp,0FFFFFFF4
 0045A2CA    fstp        tbyte ptr [esp]
 0045A2CD    wait
 0045A2CE    lea         edx,[ebp-4]
 0045A2D1    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0045A2D6    call        FloatToStr
 0045A2DB    mov         eax,dword ptr [ebp-4]
 0045A2DE    push        eax
 0045A2DF    mov         ecx,edi
 0045A2E1    mov         edx,esi
 0045A2E3    mov         eax,ebx
 0045A2E5    mov         ebx,dword ptr [eax]
 0045A2E7    call        dword ptr [ebx+8]
 0045A2EA    xor         eax,eax
 0045A2EC    pop         edx
 0045A2ED    pop         ecx
 0045A2EE    pop         ecx
 0045A2EF    mov         dword ptr fs:[eax],edx
 0045A2F2    push        45A307
 0045A2F7    lea         eax,[ebp-4]
 0045A2FA    call        @UStrClr
 0045A2FF    ret
>0045A300    jmp         @HandleFinally
>0045A305    jmp         0045A2F7
 0045A307    pop         edi
 0045A308    pop         esi
 0045A309    pop         ebx
 0045A30A    pop         ecx
 0045A30B    pop         ebp
 0045A30C    ret         8
*}
end;

//0045A310
procedure TCustomIniFile.WriteTime(Section:string; Name:string; Value:TDateTime);
begin
{*
 0045A310    push        ebp
 0045A311    mov         ebp,esp
 0045A313    push        0
 0045A315    push        ebx
 0045A316    push        esi
 0045A317    push        edi
 0045A318    mov         edi,ecx
 0045A31A    mov         esi,edx
 0045A31C    mov         ebx,eax
 0045A31E    xor         eax,eax
 0045A320    push        ebp
 0045A321    push        45A364
 0045A326    push        dword ptr fs:[eax]
 0045A329    mov         dword ptr fs:[eax],esp
 0045A32C    push        dword ptr [ebp+0C]
 0045A32F    push        dword ptr [ebp+8]
 0045A332    lea         edx,[ebp-4]
 0045A335    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0045A33A    call        TimeToStr
 0045A33F    mov         eax,dword ptr [ebp-4]
 0045A342    push        eax
 0045A343    mov         ecx,edi
 0045A345    mov         edx,esi
 0045A347    mov         eax,ebx
 0045A349    mov         ebx,dword ptr [eax]
 0045A34B    call        dword ptr [ebx+8]
 0045A34E    xor         eax,eax
 0045A350    pop         edx
 0045A351    pop         ecx
 0045A352    pop         ecx
 0045A353    mov         dword ptr fs:[eax],edx
 0045A356    push        45A36B
 0045A35B    lea         eax,[ebp-4]
 0045A35E    call        @UStrClr
 0045A363    ret
>0045A364    jmp         @HandleFinally
>0045A369    jmp         0045A35B
 0045A36B    pop         edi
 0045A36C    pop         esi
 0045A36D    pop         ebx
 0045A36E    pop         ecx
 0045A36F    pop         ebp
 0045A370    ret         8
*}
end;

//0045A394
procedure TCustomIniFile.WriteBool(Section:string; Ident:string; Value:Boolean);
begin
{*
 0045A394    push        ebp
 0045A395    mov         ebp,esp
 0045A397    push        ebx
 0045A398    movzx       ebx,byte ptr [ebp+8]
 0045A39C    mov         ebx,dword ptr [ebx*4+7855A8];^'0'
 0045A3A3    push        ebx
 0045A3A4    mov         ebx,dword ptr [eax]
 0045A3A6    call        dword ptr [ebx+8]
 0045A3A9    pop         ebx
 0045A3AA    pop         ebp
 0045A3AB    ret         4
*}
end;

//0045A3B0
function TCustomIniFile.ValueExists(Section:string; Ident:string):Boolean;
begin
{*
 0045A3B0    push        ebp
 0045A3B1    mov         ebp,esp
 0045A3B3    add         esp,0FFFFFFF4
 0045A3B6    push        ebx
 0045A3B7    push        esi
 0045A3B8    mov         dword ptr [ebp-4],ecx
 0045A3BB    mov         esi,edx
 0045A3BD    mov         ebx,eax
 0045A3BF    mov         dl,1
 0045A3C1    mov         eax,[0043C7BC];TStringList
 0045A3C6    call        TStringList.Create
 0045A3CB    mov         dword ptr [ebp-0C],eax
 0045A3CE    xor         eax,eax
 0045A3D0    push        ebp
 0045A3D1    push        45A40E
 0045A3D6    push        dword ptr fs:[eax]
 0045A3D9    mov         dword ptr fs:[eax],esp
 0045A3DC    mov         ecx,dword ptr [ebp-0C]
 0045A3DF    mov         edx,esi
 0045A3E1    mov         eax,ebx
 0045A3E3    mov         ebx,dword ptr [eax]
 0045A3E5    call        dword ptr [ebx+44]
 0045A3E8    mov         edx,dword ptr [ebp-4]
 0045A3EB    mov         eax,dword ptr [ebp-0C]
 0045A3EE    mov         ecx,dword ptr [eax]
 0045A3F0    call        dword ptr [ecx+54]
 0045A3F3    inc         eax
 0045A3F4    setg        byte ptr [ebp-5]
 0045A3F8    xor         eax,eax
 0045A3FA    pop         edx
 0045A3FB    pop         ecx
 0045A3FC    pop         ecx
 0045A3FD    mov         dword ptr fs:[eax],edx
 0045A400    push        45A415
 0045A405    mov         eax,dword ptr [ebp-0C]
 0045A408    call        TObject.Free
 0045A40D    ret
>0045A40E    jmp         @HandleFinally
>0045A413    jmp         0045A405
 0045A415    movzx       eax,byte ptr [ebp-5]
 0045A419    pop         esi
 0045A41A    pop         ebx
 0045A41B    mov         esp,ebp
 0045A41D    pop         ebp
 0045A41E    ret
*}
end;

//0045A420
function TCustomIniFile.ReadBinaryStream(Section:string; Name:string; Value:TStream):Integer;
begin
{*
 0045A420    push        ebp
 0045A421    mov         ebp,esp
 0045A423    add         esp,0FFFFFFEC
 0045A426    push        ebx
 0045A427    push        esi
 0045A428    push        edi
 0045A429    xor         ebx,ebx
 0045A42B    mov         dword ptr [ebp-4],ebx
 0045A42E    mov         dword ptr [ebp-8],ecx
 0045A431    mov         esi,edx
 0045A433    mov         ebx,eax
 0045A435    xor         eax,eax
 0045A437    push        ebp
 0045A438    push        45A58D
 0045A43D    push        dword ptr fs:[eax]
 0045A440    mov         dword ptr fs:[eax],esp
 0045A443    push        0
 0045A445    lea         eax,[ebp-4]
 0045A448    push        eax
 0045A449    mov         ecx,dword ptr [ebp-8]
 0045A44C    mov         edx,esi
 0045A44E    mov         eax,ebx
 0045A450    mov         ebx,dword ptr [eax]
 0045A452    call        dword ptr [ebx+4]
 0045A455    cmp         dword ptr [ebp-4],0
>0045A459    je          0045A572
 0045A45F    mov         eax,dword ptr [ebp+8]
 0045A462    mov         edx,dword ptr ds:[43DAFC];TMemoryStream
 0045A468    call        @IsClass
 0045A46D    test        al,al
>0045A46F    je          0045A479
 0045A471    mov         eax,dword ptr [ebp+8]
 0045A474    mov         dword ptr [ebp-10],eax
>0045A477    jmp         0045A488
 0045A479    mov         dl,1
 0045A47B    mov         eax,[0043DAFC];TMemoryStream
 0045A480    call        TObject.Create
 0045A485    mov         dword ptr [ebp-10],eax
 0045A488    xor         edx,edx
 0045A48A    push        ebp
 0045A48B    push        45A56B
 0045A490    push        dword ptr fs:[edx]
 0045A493    mov         dword ptr fs:[edx],esp
 0045A496    mov         eax,dword ptr [ebp-10]
 0045A499    call        TStream.GetPosition
 0045A49E    mov         esi,eax
 0045A4A0    mov         edi,dword ptr [ebp-4]
 0045A4A3    mov         ebx,edi
 0045A4A5    test        ebx,ebx
>0045A4A7    je          0045A4AE
 0045A4A9    sub         ebx,4
 0045A4AC    mov         ebx,dword ptr [ebx]
 0045A4AE    mov         eax,dword ptr [ebp-10]
 0045A4B1    mov         edx,dword ptr [eax]
 0045A4B3    call        dword ptr [edx]
 0045A4B5    mov         edx,eax
 0045A4B7    sar         ebx,1
>0045A4B9    jns         0045A4BE
 0045A4BB    adc         ebx,0
 0045A4BE    add         edx,ebx
 0045A4C0    mov         eax,dword ptr [ebp-10]
 0045A4C3    mov         ecx,dword ptr [eax]
 0045A4C5    call        dword ptr [ecx+4]
 0045A4C8    mov         ebx,edi
 0045A4CA    test        ebx,ebx
>0045A4CC    je          0045A4D3
 0045A4CE    sub         ebx,4
 0045A4D1    mov         ebx,dword ptr [ebx]
 0045A4D3    mov         eax,dword ptr [ebp-10]
 0045A4D6    call        TStream.GetPosition
 0045A4DB    push        edx
 0045A4DC    push        eax
 0045A4DD    mov         eax,dword ptr [ebp-10]
 0045A4E0    mov         eax,dword ptr [eax+4]
 0045A4E3    cdq
 0045A4E4    add         eax,dword ptr [esp]
 0045A4E7    adc         edx,dword ptr [esp+4]
 0045A4EB    add         esp,8
 0045A4EE    mov         dword ptr [ebp-14],eax
 0045A4F1    mov         eax,dword ptr [ebp-4]
 0045A4F4    call        @UStrToPWChar
 0045A4F9    mov         ecx,ebx
 0045A4FB    sar         ecx,1
>0045A4FD    jns         0045A502
 0045A4FF    adc         ecx,0
 0045A502    mov         edx,dword ptr [ebp-14]
 0045A505    call        HexToBin
 0045A50A    mov         eax,esi
 0045A50C    cdq
 0045A50D    push        edx
 0045A50E    push        eax
 0045A50F    mov         eax,dword ptr [ebp-10]
 0045A512    call        TStream.SetPosition
 0045A517    mov         eax,dword ptr [ebp+8]
 0045A51A    cmp         eax,dword ptr [ebp-10]
>0045A51D    je          0045A541
 0045A51F    mov         ecx,edi
 0045A521    test        ecx,ecx
>0045A523    je          0045A52A
 0045A525    sub         ecx,4
 0045A528    mov         ecx,dword ptr [ecx]
 0045A52A    mov         eax,ecx
 0045A52C    sar         eax,1
>0045A52E    jns         0045A533
 0045A530    adc         eax,0
 0045A533    cdq
 0045A534    push        edx
 0045A535    push        eax
 0045A536    mov         edx,dword ptr [ebp-10]
 0045A539    mov         eax,dword ptr [ebp+8]
 0045A53C    call        TStream.CopyFrom
 0045A541    mov         eax,dword ptr [ebp-10]
 0045A544    mov         edx,dword ptr [eax]
 0045A546    call        dword ptr [edx]
 0045A548    sub         eax,esi
 0045A54A    mov         dword ptr [ebp-0C],eax
 0045A54D    xor         eax,eax
 0045A54F    pop         edx
 0045A550    pop         ecx
 0045A551    pop         ecx
 0045A552    mov         dword ptr fs:[eax],edx
 0045A555    push        45A577
 0045A55A    mov         eax,dword ptr [ebp+8]
 0045A55D    cmp         eax,dword ptr [ebp-10]
>0045A560    je          0045A56A
 0045A562    mov         eax,dword ptr [ebp-10]
 0045A565    call        TObject.Free
 0045A56A    ret
>0045A56B    jmp         @HandleFinally
>0045A570    jmp         0045A55A
 0045A572    xor         eax,eax
 0045A574    mov         dword ptr [ebp-0C],eax
 0045A577    xor         eax,eax
 0045A579    pop         edx
 0045A57A    pop         ecx
 0045A57B    pop         ecx
 0045A57C    mov         dword ptr fs:[eax],edx
 0045A57F    push        45A594
 0045A584    lea         eax,[ebp-4]
 0045A587    call        @UStrClr
 0045A58C    ret
>0045A58D    jmp         @HandleFinally
>0045A592    jmp         0045A584
 0045A594    mov         eax,dword ptr [ebp-0C]
 0045A597    pop         edi
 0045A598    pop         esi
 0045A599    pop         ebx
 0045A59A    mov         esp,ebp
 0045A59C    pop         ebp
 0045A59D    ret         4
*}
end;

//0045A5A0
procedure TCustomIniFile.WriteBinaryStream(Section:string; Name:string; Value:TStream);
begin
{*
 0045A5A0    push        ebp
 0045A5A1    mov         ebp,esp
 0045A5A3    add         esp,0FFFFFFEC
 0045A5A6    push        ebx
 0045A5A7    push        esi
 0045A5A8    xor         ebx,ebx
 0045A5AA    mov         dword ptr [ebp-4],ebx
 0045A5AD    mov         dword ptr [ebp-10],ecx
 0045A5B0    mov         dword ptr [ebp-0C],edx
 0045A5B3    mov         dword ptr [ebp-8],eax
 0045A5B6    xor         eax,eax
 0045A5B8    push        ebp
 0045A5B9    push        45A707
 0045A5BE    push        dword ptr fs:[eax]
 0045A5C1    mov         dword ptr fs:[eax],esp
 0045A5C4    push        0
 0045A5C6    push        2
 0045A5C8    mov         eax,dword ptr [ebp+8]
 0045A5CB    mov         edx,dword ptr [eax]
 0045A5CD    call        dword ptr [edx]
 0045A5CF    push        edx
 0045A5D0    push        eax
 0045A5D1    mov         eax,dword ptr [ebp+8]
 0045A5D4    call        TStream.GetPosition
 0045A5D9    sub         dword ptr [esp],eax
 0045A5DC    sbb         dword ptr [esp+4],edx
 0045A5E0    pop         eax
 0045A5E1    pop         edx
 0045A5E2    call        @_llmul
 0045A5E7    mov         edx,eax
 0045A5E9    lea         eax,[ebp-4]
 0045A5EC    call        @UStrSetLength
 0045A5F1    mov         eax,dword ptr [ebp-4]
 0045A5F4    test        eax,eax
>0045A5F6    je          0045A5FD
 0045A5F8    sub         eax,4
 0045A5FB    mov         eax,dword ptr [eax]
 0045A5FD    test        eax,eax
>0045A5FF    jle         0045A6DF
 0045A605    mov         eax,dword ptr [ebp+8]
 0045A608    mov         edx,dword ptr ds:[43DAFC];TMemoryStream
 0045A60E    call        @IsClass
 0045A613    test        al,al
>0045A615    je          0045A61F
 0045A617    mov         eax,dword ptr [ebp+8]
 0045A61A    mov         dword ptr [ebp-14],eax
>0045A61D    jmp         0045A62E
 0045A61F    mov         dl,1
 0045A621    mov         eax,[0043DAFC];TMemoryStream
 0045A626    call        TObject.Create
 0045A62B    mov         dword ptr [ebp-14],eax
 0045A62E    xor         eax,eax
 0045A630    push        ebp
 0045A631    push        45A6D8
 0045A636    push        dword ptr fs:[eax]
 0045A639    mov         dword ptr fs:[eax],esp
 0045A63C    mov         eax,dword ptr [ebp-14]
 0045A63F    cmp         eax,dword ptr [ebp+8]
>0045A642    je          0045A677
 0045A644    mov         eax,dword ptr [ebp+8]
 0045A647    mov         edx,dword ptr [eax]
 0045A649    call        dword ptr [edx]
 0045A64B    push        edx
 0045A64C    push        eax
 0045A64D    mov         eax,dword ptr [ebp+8]
 0045A650    call        TStream.GetPosition
 0045A655    sub         dword ptr [esp],eax
 0045A658    sbb         dword ptr [esp+4],edx
 0045A65C    pop         eax
 0045A65D    pop         edx
 0045A65E    push        edx
 0045A65F    push        eax
 0045A660    mov         edx,dword ptr [ebp+8]
 0045A663    mov         eax,dword ptr [ebp-14]
 0045A666    call        TStream.CopyFrom
 0045A66B    push        0
 0045A66D    push        0
 0045A66F    mov         eax,dword ptr [ebp-14]
 0045A672    call        TStream.SetPosition
 0045A677    mov         eax,dword ptr [ebp-14]
 0045A67A    call        TStream.GetPosition
 0045A67F    push        edx
 0045A680    push        eax
 0045A681    mov         eax,dword ptr [ebp-14]
 0045A684    mov         eax,dword ptr [eax+4]
 0045A687    cdq
 0045A688    add         eax,dword ptr [esp]
 0045A68B    adc         edx,dword ptr [esp+4]
 0045A68F    add         esp,8
 0045A692    mov         ebx,eax
 0045A694    mov         eax,dword ptr [ebp-14]
 0045A697    mov         edx,dword ptr [eax]
 0045A699    call        dword ptr [edx]
 0045A69B    mov         esi,eax
 0045A69D    mov         eax,dword ptr [ebp-14]
 0045A6A0    call        TStream.GetPosition
 0045A6A5    sub         esi,eax
 0045A6A7    mov         eax,dword ptr [ebp-4]
 0045A6AA    call        @UStrToPWChar
 0045A6AF    mov         edx,eax
 0045A6B1    mov         eax,ebx
 0045A6B3    mov         ecx,esi
 0045A6B5    call        BinToHex
 0045A6BA    xor         eax,eax
 0045A6BC    pop         edx
 0045A6BD    pop         ecx
 0045A6BE    pop         ecx
 0045A6BF    mov         dword ptr fs:[eax],edx
 0045A6C2    push        45A6DF
 0045A6C7    mov         eax,dword ptr [ebp+8]
 0045A6CA    cmp         eax,dword ptr [ebp-14]
>0045A6CD    je          0045A6D7
 0045A6CF    mov         eax,dword ptr [ebp-14]
 0045A6D2    call        TObject.Free
 0045A6D7    ret
>0045A6D8    jmp         @HandleFinally
>0045A6DD    jmp         0045A6C7
 0045A6DF    mov         eax,dword ptr [ebp-4]
 0045A6E2    push        eax
 0045A6E3    mov         ecx,dword ptr [ebp-10]
 0045A6E6    mov         edx,dword ptr [ebp-0C]
 0045A6E9    mov         eax,dword ptr [ebp-8]
 0045A6EC    mov         ebx,dword ptr [eax]
 0045A6EE    call        dword ptr [ebx+8]
 0045A6F1    xor         eax,eax
 0045A6F3    pop         edx
 0045A6F4    pop         ecx
 0045A6F5    pop         ecx
 0045A6F6    mov         dword ptr fs:[eax],edx
 0045A6F9    push        45A70E
 0045A6FE    lea         eax,[ebp-4]
 0045A701    call        @UStrClr
 0045A706    ret
>0045A707    jmp         @HandleFinally
>0045A70C    jmp         0045A6FE
 0045A70E    pop         esi
 0045A70F    pop         ebx
 0045A710    mov         esp,ebp
 0045A712    pop         ebp
 0045A713    ret         4
*}
end;

//0045A718
procedure TCustomIniFile.InternalReadSections(const Section:UnicodeString; Strings:TStrings; SubSectionNamesOnly:Boolean; Recurse:Boolean);
begin
{*
 0045A718    push        ebp
 0045A719    mov         ebp,esp
 0045A71B    add         esp,0FFFFFFD8
 0045A71E    push        ebx
 0045A71F    push        esi
 0045A720    xor         ebx,ebx
 0045A722    mov         dword ptr [ebp-28],ebx
 0045A725    mov         dword ptr [ebp-24],ebx
 0045A728    mov         dword ptr [ebp-4],ebx
 0045A72B    mov         dword ptr [ebp-8],ebx
 0045A72E    mov         dword ptr [ebp-10],ecx
 0045A731    mov         dword ptr [ebp-0C],edx
 0045A734    mov         ebx,eax
 0045A736    xor         eax,eax
 0045A738    push        ebp
 0045A739    push        45A8E9
 0045A73E    push        dword ptr fs:[eax]
 0045A741    mov         dword ptr fs:[eax],esp
 0045A744    mov         dl,1
 0045A746    mov         eax,[0043C7BC];TStringList
 0045A74B    call        TStringList.Create
 0045A750    mov         dword ptr [ebp-1C],eax
 0045A753    xor         edx,edx
 0045A755    push        ebp
 0045A756    push        45A8BA
 0045A75B    push        dword ptr fs:[edx]
 0045A75E    mov         dword ptr fs:[edx],esp
 0045A761    mov         edx,dword ptr [ebp-1C]
 0045A764    mov         eax,ebx
 0045A766    mov         ecx,dword ptr [eax]
 0045A768    call        dword ptr [ecx+48]
 0045A76B    mov         eax,dword ptr [ebp-0C]
 0045A76E    test        eax,eax
>0045A770    je          0045A777
 0045A772    sub         eax,4
 0045A775    mov         eax,dword ptr [eax]
 0045A777    mov         ebx,eax
 0045A779    test        ebx,ebx
 0045A77B    setg        al
 0045A77E    and         eax,7F
 0045A781    lea         edx,[ebx+1]
 0045A784    add         eax,edx
 0045A786    mov         dword ptr [ebp-14],eax
 0045A789    mov         eax,dword ptr [ebp-10]
 0045A78C    call        TStrings.BeginUpdate
 0045A791    xor         edx,edx
 0045A793    push        ebp
 0045A794    push        45A89D
 0045A799    push        dword ptr fs:[edx]
 0045A79C    mov         dword ptr fs:[edx],esp
 0045A79F    mov         eax,dword ptr [ebp-1C]
 0045A7A2    mov         edx,dword ptr [eax]
 0045A7A4    call        dword ptr [edx+14]
 0045A7A7    dec         eax
 0045A7A8    test        eax,eax
>0045A7AA    jl          0045A887
 0045A7B0    inc         eax
 0045A7B1    mov         dword ptr [ebp-20],eax
 0045A7B4    mov         dword ptr [ebp-18],0
 0045A7BB    lea         ecx,[ebp-4]
 0045A7BE    mov         edx,dword ptr [ebp-18]
 0045A7C1    mov         eax,dword ptr [ebp-1C]
 0045A7C4    mov         esi,dword ptr [eax]
 0045A7C6    call        dword ptr [esi+0C]
 0045A7C9    mov         eax,dword ptr [ebp-4]
 0045A7CC    test        eax,eax
>0045A7CE    je          0045A7D5
 0045A7D0    sub         eax,4
 0045A7D3    mov         eax,dword ptr [eax]
 0045A7D5    mov         esi,eax
 0045A7D7    test        ebx,ebx
>0045A7D9    je          0045A833
 0045A7DB    cmp         byte ptr [ebp+0C],0
>0045A7DF    je          0045A807
 0045A7E1    cmp         ebx,esi
>0045A7E3    jge         0045A807
 0045A7E5    lea         eax,[ebp-24]
 0045A7E8    push        eax
 0045A7E9    mov         ecx,ebx
 0045A7EB    mov         edx,1
 0045A7F0    mov         eax,dword ptr [ebp-4]
 0045A7F3    call        @UStrCopy
 0045A7F8    mov         edx,dword ptr [ebp-24]
 0045A7FB    mov         eax,dword ptr [ebp-0C]
 0045A7FE    call        SameText
 0045A803    test        al,al
>0045A805    jne         0045A833
 0045A807    cmp         byte ptr [ebp+0C],0
>0045A80B    jne         0045A87B
 0045A80D    cmp         ebx,esi
>0045A80F    jg          0045A87B
 0045A811    lea         eax,[ebp-28]
 0045A814    push        eax
 0045A815    mov         ecx,ebx
 0045A817    mov         edx,1
 0045A81C    mov         eax,dword ptr [ebp-4]
 0045A81F    call        @UStrCopy
 0045A824    mov         edx,dword ptr [ebp-28]
 0045A827    mov         eax,dword ptr [ebp-0C]
 0045A82A    call        SameText
 0045A82F    test        al,al
>0045A831    je          0045A87B
 0045A833    lea         eax,[ebp-8]
 0045A836    push        eax
 0045A837    lea         ecx,[esi+1]
 0045A83A    sub         ecx,dword ptr [ebp-14]
 0045A83D    mov         edx,dword ptr [ebp-14]
 0045A840    mov         eax,dword ptr [ebp-4]
 0045A843    call        @UStrCopy
 0045A848    cmp         byte ptr [ebp+8],0
>0045A84C    jne         0045A85F
 0045A84E    mov         edx,dword ptr [ebp-8]
 0045A851    mov         eax,[007855A4];^'\'
 0045A856    call        Pos
 0045A85B    test        eax,eax
>0045A85D    jne         0045A87B
 0045A85F    cmp         byte ptr [ebp+0C],0
>0045A863    je          0045A870
 0045A865    lea         eax,[ebp-4]
 0045A868    mov         edx,dword ptr [ebp-8]
 0045A86B    call        @UStrLAsg
 0045A870    mov         edx,dword ptr [ebp-4]
 0045A873    mov         eax,dword ptr [ebp-10]
 0045A876    mov         ecx,dword ptr [eax]
 0045A878    call        dword ptr [ecx+38]
 0045A87B    inc         dword ptr [ebp-18]
 0045A87E    dec         dword ptr [ebp-20]
>0045A881    jne         0045A7BB
 0045A887    xor         eax,eax
 0045A889    pop         edx
 0045A88A    pop         ecx
 0045A88B    pop         ecx
 0045A88C    mov         dword ptr fs:[eax],edx
 0045A88F    push        45A8A4
 0045A894    mov         eax,dword ptr [ebp-10]
 0045A897    call        TStrings.EndUpdate
 0045A89C    ret
>0045A89D    jmp         @HandleFinally
>0045A8A2    jmp         0045A894
 0045A8A4    xor         eax,eax
 0045A8A6    pop         edx
 0045A8A7    pop         ecx
 0045A8A8    pop         ecx
 0045A8A9    mov         dword ptr fs:[eax],edx
 0045A8AC    push        45A8C1
 0045A8B1    mov         eax,dword ptr [ebp-1C]
 0045A8B4    call        TObject.Free
 0045A8B9    ret
>0045A8BA    jmp         @HandleFinally
>0045A8BF    jmp         0045A8B1
 0045A8C1    xor         eax,eax
 0045A8C3    pop         edx
 0045A8C4    pop         ecx
 0045A8C5    pop         ecx
 0045A8C6    mov         dword ptr fs:[eax],edx
 0045A8C9    push        45A8F0
 0045A8CE    lea         eax,[ebp-28]
 0045A8D1    mov         edx,2
 0045A8D6    call        @UStrArrayClr
 0045A8DB    lea         eax,[ebp-8]
 0045A8DE    mov         edx,2
 0045A8E3    call        @UStrArrayClr
 0045A8E8    ret
>0045A8E9    jmp         @HandleFinally
>0045A8EE    jmp         0045A8CE
 0045A8F0    pop         esi
 0045A8F1    pop         ebx
 0045A8F2    mov         esp,ebp
 0045A8F4    pop         ebp
 0045A8F5    ret         8
*}
end;

//0045A8F8
procedure TCustomIniFile.ReadSections(Section:string; Strings:TStrings);
begin
{*
 0045A8F8    push        ebx
 0045A8F9    push        0
 0045A8FB    push        1
 0045A8FD    mov         ebx,dword ptr [eax]
 0045A8FF    call        dword ptr [ebx]
 0045A901    pop         ebx
 0045A902    ret
*}
end;

//0045A904
procedure TCustomIniFile.ReadSubSections(Section:string; Strings:TStrings; Recurse:Boolean);
begin
{*
 0045A904    push        ebp
 0045A905    mov         ebp,esp
 0045A907    push        ebx
 0045A908    push        1
 0045A90A    movzx       ebx,byte ptr [ebp+8]
 0045A90E    push        ebx
 0045A90F    mov         ebx,dword ptr [eax]
 0045A911    call        dword ptr [ebx]
 0045A913    pop         ebx
 0045A914    pop         ebp
 0045A915    ret         4
*}
end;

//0045A918
procedure TStringHash.Add(Key:string; Value:Integer);
begin
{*
 0045A918    push        ebx
 0045A919    push        esi
 0045A91A    push        edi
 0045A91B    push        ebp
 0045A91C    push        ecx
 0045A91D    mov         dword ptr [esp],ecx
 0045A920    mov         ebp,edx
 0045A922    mov         ebx,eax
 0045A924    mov         edx,ebp
 0045A926    mov         eax,ebx
 0045A928    mov         ecx,dword ptr [eax]
 0045A92A    call        dword ptr [ecx]
 0045A92C    push        eax
 0045A92D    mov         eax,dword ptr [ebx+4]
 0045A930    call        @DynArrayLength
 0045A935    mov         edx,eax
 0045A937    pop         eax
 0045A938    mov         ecx,edx
 0045A93A    xor         edx,edx
 0045A93C    div         eax,ecx
 0045A93E    mov         edi,edx
 0045A940    mov         edx,dword ptr ds:[458DD4];THashItem
 0045A946    mov         eax,0C
 0045A94B    call        @New
 0045A950    mov         esi,eax
 0045A952    lea         eax,[esi+4]
 0045A955    mov         edx,ebp
 0045A957    call        @UStrAsg
 0045A95C    mov         eax,dword ptr [esp]
 0045A95F    mov         dword ptr [esi+8],eax
 0045A962    mov         eax,dword ptr [ebx+4]
 0045A965    mov         eax,dword ptr [eax+edi*4]
 0045A968    mov         dword ptr [esi],eax
 0045A96A    mov         eax,dword ptr [ebx+4]
 0045A96D    mov         dword ptr [eax+edi*4],esi
 0045A970    pop         edx
 0045A971    pop         ebp
 0045A972    pop         edi
 0045A973    pop         esi
 0045A974    pop         ebx
 0045A975    ret
*}
end;

//0045A978
procedure TStringHash.Clear;
begin
{*
 0045A978    push        ebx
 0045A979    push        esi
 0045A97A    push        edi
 0045A97B    push        ebp
 0045A97C    push        ecx
 0045A97D    mov         ebp,eax
 0045A97F    mov         eax,dword ptr [ebp+4]
 0045A982    call        @DynArrayLength
 0045A987    dec         eax
 0045A988    test        eax,eax
>0045A98A    jl          0045A9BF
 0045A98C    inc         eax
 0045A98D    mov         dword ptr [esp],eax
 0045A990    xor         edi,edi
 0045A992    mov         eax,dword ptr [ebp+4]
 0045A995    mov         ebx,dword ptr [eax+edi*4]
 0045A998    test        ebx,ebx
>0045A99A    je          0045A9B1
 0045A99C    mov         esi,dword ptr [ebx]
 0045A99E    mov         edx,dword ptr ds:[458DD4];THashItem
 0045A9A4    mov         eax,ebx
 0045A9A6    call        @Dispose
 0045A9AB    mov         ebx,esi
 0045A9AD    test        ebx,ebx
>0045A9AF    jne         0045A99C
 0045A9B1    mov         eax,dword ptr [ebp+4]
 0045A9B4    xor         edx,edx
 0045A9B6    mov         dword ptr [eax+edi*4],edx
 0045A9B9    inc         edi
 0045A9BA    dec         dword ptr [esp]
>0045A9BD    jne         0045A992
 0045A9BF    pop         edx
 0045A9C0    pop         ebp
 0045A9C1    pop         edi
 0045A9C2    pop         esi
 0045A9C3    pop         ebx
 0045A9C4    ret
*}
end;

//0045A9C8
constructor TStringHash.Create;
begin
{*
 0045A9C8    push        ebx
 0045A9C9    push        esi
 0045A9CA    push        edi
 0045A9CB    test        dl,dl
>0045A9CD    je          0045A9D7
 0045A9CF    add         esp,0FFFFFFF0
 0045A9D2    call        @ClassCreate
 0045A9D7    mov         esi,ecx
 0045A9D9    mov         ebx,edx
 0045A9DB    mov         edi,eax
 0045A9DD    xor         edx,edx
 0045A9DF    mov         eax,edi
 0045A9E1    call        TObject.Create
 0045A9E6    push        esi
 0045A9E7    lea         eax,[edi+4]
 0045A9EA    mov         ecx,1
 0045A9EF    mov         edx,dword ptr ds:[458E2C];:TStringHash.:1
 0045A9F5    call        @DynArraySetLength
 0045A9FA    add         esp,4
 0045A9FD    mov         eax,edi
 0045A9FF    test        bl,bl
>0045AA01    je          0045AA12
 0045AA03    call        @AfterConstruction
 0045AA08    pop         dword ptr fs:[0]
 0045AA0F    add         esp,0C
 0045AA12    mov         eax,edi
 0045AA14    pop         edi
 0045AA15    pop         esi
 0045AA16    pop         ebx
 0045AA17    ret
*}
end;

//0045AA18
destructor TStringHash.Destroy();
begin
{*
 0045AA18    push        ebx
 0045AA19    push        esi
 0045AA1A    call        @BeforeDestruction
 0045AA1F    mov         ebx,edx
 0045AA21    mov         esi,eax
 0045AA23    mov         eax,esi
 0045AA25    call        TStringHash.Clear
 0045AA2A    mov         edx,ebx
 0045AA2C    and         dl,0FC
 0045AA2F    mov         eax,esi
 0045AA31    call        TObject.Destroy
 0045AA36    test        bl,bl
>0045AA38    jle         0045AA41
 0045AA3A    mov         eax,esi
 0045AA3C    call        @ClassDestroy
 0045AA41    pop         esi
 0045AA42    pop         ebx
 0045AA43    ret
*}
end;

//0045AA44
function TStringHash.Find(const Key:UnicodeString):PPHashItem;
begin
{*
 0045AA44    push        ebx
 0045AA45    push        esi
 0045AA46    push        edi
 0045AA47    mov         edi,edx
 0045AA49    mov         ebx,eax
 0045AA4B    mov         edx,edi
 0045AA4D    mov         eax,ebx
 0045AA4F    mov         ecx,dword ptr [eax]
 0045AA51    call        dword ptr [ecx]
 0045AA53    push        eax
 0045AA54    mov         eax,dword ptr [ebx+4]
 0045AA57    call        @DynArrayLength
 0045AA5C    mov         edx,eax
 0045AA5E    pop         eax
 0045AA5F    mov         ecx,edx
 0045AA61    xor         edx,edx
 0045AA63    div         eax,ecx
 0045AA65    mov         eax,edx
 0045AA67    mov         edx,dword ptr [ebx+4]
 0045AA6A    lea         eax,[edx+eax*4]
 0045AA6D    mov         ebx,eax
>0045AA6F    jmp         0045AA7F
 0045AA71    mov         eax,dword ptr [esi+4]
 0045AA74    mov         edx,edi
 0045AA76    call        @UStrEqual
>0045AA7B    je          0045AA85
 0045AA7D    mov         ebx,esi
 0045AA7F    mov         esi,dword ptr [ebx]
 0045AA81    test        esi,esi
>0045AA83    jne         0045AA71
 0045AA85    mov         eax,ebx
 0045AA87    pop         edi
 0045AA88    pop         esi
 0045AA89    pop         ebx
 0045AA8A    ret
*}
end;

//0045AA8C
function TStringHash.HashOf(const Key:UnicodeString):Cardinal;
begin
{*
 0045AA8C    push        ebx
 0045AA8D    push        esi
 0045AA8E    xor         eax,eax
 0045AA90    mov         ecx,edx
 0045AA92    test        ecx,ecx
>0045AA94    je          0045AA9B
 0045AA96    sub         ecx,4
 0045AA99    mov         ecx,dword ptr [ecx]
 0045AA9B    test        ecx,ecx
>0045AA9D    jle         0045AABC
 0045AA9F    mov         ebx,1
 0045AAA4    mov         esi,eax
 0045AAA6    add         esi,esi
 0045AAA8    add         esi,esi
 0045AAAA    shr         eax,1E
 0045AAAD    or          esi,eax
 0045AAAF    movzx       eax,word ptr [edx+ebx*2-2]
 0045AAB4    xor         esi,eax
 0045AAB6    mov         eax,esi
 0045AAB8    inc         ebx
 0045AAB9    dec         ecx
>0045AABA    jne         0045AAA4
 0045AABC    pop         esi
 0045AABD    pop         ebx
 0045AABE    ret
*}
end;

//0045AAC0
function TStringHash.Modify(Key:string; Value:Integer):Boolean;
begin
{*
 0045AAC0    push        ebx
 0045AAC1    push        esi
 0045AAC2    push        edi
 0045AAC3    mov         edi,ecx
 0045AAC5    mov         esi,edx
 0045AAC7    mov         ebx,eax
 0045AAC9    mov         edx,esi
 0045AACB    mov         eax,ebx
 0045AACD    call        TStringHash.Find
 0045AAD2    mov         eax,dword ptr [eax]
 0045AAD4    test        eax,eax
>0045AAD6    je          0045AADF
 0045AAD8    mov         dl,1
 0045AADA    mov         dword ptr [eax+8],edi
>0045AADD    jmp         0045AAE1
 0045AADF    xor         edx,edx
 0045AAE1    mov         eax,edx
 0045AAE3    pop         edi
 0045AAE4    pop         esi
 0045AAE5    pop         ebx
 0045AAE6    ret
*}
end;

//0045AAE8
procedure TStringHash.Remove(Key:string);
begin
{*
 0045AAE8    call        TStringHash.Find
 0045AAED    mov         edx,eax
 0045AAEF    mov         eax,dword ptr [edx]
 0045AAF1    test        eax,eax
>0045AAF3    je          0045AB04
 0045AAF5    mov         ecx,dword ptr [eax]
 0045AAF7    mov         dword ptr [edx],ecx
 0045AAF9    mov         edx,dword ptr ds:[458DD4];THashItem
 0045AAFF    call        @Dispose
 0045AB04    ret
*}
end;

//0045AB08
function TStringHash.ValueOf(Key:string):Integer;
begin
{*
 0045AB08    push        ebx
 0045AB09    push        esi
 0045AB0A    mov         esi,edx
 0045AB0C    mov         ebx,eax
 0045AB0E    mov         edx,esi
 0045AB10    mov         eax,ebx
 0045AB12    call        TStringHash.Find
 0045AB17    mov         eax,dword ptr [eax]
 0045AB19    test        eax,eax
>0045AB1B    je          0045AB23
 0045AB1D    mov         eax,dword ptr [eax+8]
 0045AB20    pop         esi
 0045AB21    pop         ebx
 0045AB22    ret
 0045AB23    or          eax,0FFFFFFFF
 0045AB26    pop         esi
 0045AB27    pop         ebx
 0045AB28    ret
*}
end;

//0045AB2C
procedure THashedStringList.Changed;
begin
{*
 0045AB2C    push        ebx
 0045AB2D    mov         ebx,eax
 0045AB2F    mov         eax,ebx
 0045AB31    call        TStringList.Changed
 0045AB36    mov         byte ptr [ebx+60],0
 0045AB3A    mov         byte ptr [ebx+61],0
 0045AB3E    pop         ebx
 0045AB3F    ret
*}
end;

//0045AB40
destructor THashedStringList.Destroy();
begin
{*
 0045AB40    push        ebx
 0045AB41    push        esi
 0045AB42    call        @BeforeDestruction
 0045AB47    mov         ebx,edx
 0045AB49    mov         esi,eax
 0045AB4B    mov         eax,dword ptr [esi+58]
 0045AB4E    call        TObject.Free
 0045AB53    mov         eax,dword ptr [esi+5C]
 0045AB56    call        TObject.Free
 0045AB5B    mov         edx,ebx
 0045AB5D    and         dl,0FC
 0045AB60    mov         eax,esi
 0045AB62    call        TStringList.Destroy
 0045AB67    test        bl,bl
>0045AB69    jle         0045AB72
 0045AB6B    mov         eax,esi
 0045AB6D    call        @ClassDestroy
 0045AB72    pop         esi
 0045AB73    pop         ebx
 0045AB74    ret
*}
end;

//0045AB78
function THashedStringList.IndexOf(S:string):Integer;
begin
{*
 0045AB78    push        ebp
 0045AB79    mov         ebp,esp
 0045AB7B    push        0
 0045AB7D    push        ebx
 0045AB7E    push        esi
 0045AB7F    mov         esi,edx
 0045AB81    mov         ebx,eax
 0045AB83    xor         eax,eax
 0045AB85    push        ebp
 0045AB86    push        45ABD9
 0045AB8B    push        dword ptr fs:[eax]
 0045AB8E    mov         dword ptr fs:[eax],esp
 0045AB91    mov         eax,ebx
 0045AB93    call        THashedStringList.UpdateValueHash
 0045AB98    cmp         byte ptr [ebx+3A],0
>0045AB9C    jne         0045ABB7
 0045AB9E    lea         edx,[ebp-4]
 0045ABA1    mov         eax,esi
 0045ABA3    call        AnsiUpperCase
 0045ABA8    mov         edx,dword ptr [ebp-4]
 0045ABAB    mov         eax,dword ptr [ebx+58]
 0045ABAE    call        TStringHash.ValueOf
 0045ABB3    mov         ebx,eax
>0045ABB5    jmp         0045ABC3
 0045ABB7    mov         edx,esi
 0045ABB9    mov         eax,dword ptr [ebx+58]
 0045ABBC    call        TStringHash.ValueOf
 0045ABC1    mov         ebx,eax
 0045ABC3    xor         eax,eax
 0045ABC5    pop         edx
 0045ABC6    pop         ecx
 0045ABC7    pop         ecx
 0045ABC8    mov         dword ptr fs:[eax],edx
 0045ABCB    push        45ABE0
 0045ABD0    lea         eax,[ebp-4]
 0045ABD3    call        @UStrClr
 0045ABD8    ret
>0045ABD9    jmp         @HandleFinally
>0045ABDE    jmp         0045ABD0
 0045ABE0    mov         eax,ebx
 0045ABE2    pop         esi
 0045ABE3    pop         ebx
 0045ABE4    pop         ecx
 0045ABE5    pop         ebp
 0045ABE6    ret
*}
end;

//0045ABE8
function THashedStringList.IndexOfName(Name:string):Integer;
begin
{*
 0045ABE8    push        ebp
 0045ABE9    mov         ebp,esp
 0045ABEB    push        0
 0045ABED    push        ebx
 0045ABEE    push        esi
 0045ABEF    mov         esi,edx
 0045ABF1    mov         ebx,eax
 0045ABF3    xor         eax,eax
 0045ABF5    push        ebp
 0045ABF6    push        45AC49
 0045ABFB    push        dword ptr fs:[eax]
 0045ABFE    mov         dword ptr fs:[eax],esp
 0045AC01    mov         eax,ebx
 0045AC03    call        THashedStringList.UpdateNameHash
 0045AC08    cmp         byte ptr [ebx+3A],0
>0045AC0C    jne         0045AC27
 0045AC0E    lea         edx,[ebp-4]
 0045AC11    mov         eax,esi
 0045AC13    call        AnsiUpperCase
 0045AC18    mov         edx,dword ptr [ebp-4]
 0045AC1B    mov         eax,dword ptr [ebx+5C]
 0045AC1E    call        TStringHash.ValueOf
 0045AC23    mov         ebx,eax
>0045AC25    jmp         0045AC33
 0045AC27    mov         edx,esi
 0045AC29    mov         eax,dword ptr [ebx+5C]
 0045AC2C    call        TStringHash.ValueOf
 0045AC31    mov         ebx,eax
 0045AC33    xor         eax,eax
 0045AC35    pop         edx
 0045AC36    pop         ecx
 0045AC37    pop         ecx
 0045AC38    mov         dword ptr fs:[eax],edx
 0045AC3B    push        45AC50
 0045AC40    lea         eax,[ebp-4]
 0045AC43    call        @UStrClr
 0045AC48    ret
>0045AC49    jmp         @HandleFinally
>0045AC4E    jmp         0045AC40
 0045AC50    mov         eax,ebx
 0045AC52    pop         esi
 0045AC53    pop         ebx
 0045AC54    pop         ecx
 0045AC55    pop         ebp
 0045AC56    ret
*}
end;

//0045AC58
procedure THashedStringList.UpdateNameHash;
begin
{*
 0045AC58    push        ebp
 0045AC59    mov         ebp,esp
 0045AC5B    xor         ecx,ecx
 0045AC5D    push        ecx
 0045AC5E    push        ecx
 0045AC5F    push        ecx
 0045AC60    push        ecx
 0045AC61    push        ecx
 0045AC62    push        ecx
 0045AC63    push        ebx
 0045AC64    push        esi
 0045AC65    mov         ebx,eax
 0045AC67    xor         eax,eax
 0045AC69    push        ebp
 0045AC6A    push        45AD72
 0045AC6F    push        dword ptr fs:[eax]
 0045AC72    mov         dword ptr fs:[eax],esp
 0045AC75    cmp         byte ptr [ebx+61],0
>0045AC79    jne         0045AD4F
 0045AC7F    mov         eax,dword ptr [ebx+5C]
 0045AC82    test        eax,eax
>0045AC84    jne         0045AC9C
 0045AC86    mov         ecx,100
 0045AC8B    mov         dl,1
 0045AC8D    mov         eax,[00458E60];TStringHash
 0045AC92    call        TStringHash.Create
 0045AC97    mov         dword ptr [ebx+5C],eax
>0045AC9A    jmp         0045ACA1
 0045AC9C    call        TStringHash.Clear
 0045ACA1    mov         eax,ebx
 0045ACA3    mov         edx,dword ptr [eax]
 0045ACA5    call        dword ptr [edx+14]
 0045ACA8    dec         eax
 0045ACA9    test        eax,eax
>0045ACAB    jl          0045AD4B
 0045ACB1    inc         eax
 0045ACB2    mov         dword ptr [ebp-0C],eax
 0045ACB5    mov         dword ptr [ebp-8],0
 0045ACBC    lea         ecx,[ebp-4]
 0045ACBF    mov         edx,dword ptr [ebp-8]
 0045ACC2    mov         eax,ebx
 0045ACC4    mov         esi,dword ptr [eax]
 0045ACC6    call        dword ptr [esi+0C]
 0045ACC9    mov         eax,ebx
 0045ACCB    call        TStrings.GetNameValueSeparator
 0045ACD0    mov         edx,eax
 0045ACD2    lea         eax,[ebp-10]
 0045ACD5    call        @UStrFromWChar
 0045ACDA    mov         eax,dword ptr [ebp-10]
 0045ACDD    mov         edx,dword ptr [ebp-4]
 0045ACE0    call        AnsiPos
 0045ACE5    mov         esi,eax
 0045ACE7    test        esi,esi
>0045ACE9    je          0045AD3F
 0045ACEB    cmp         byte ptr [ebx+3A],0
>0045ACEF    jne         0045AD1D
 0045ACF1    lea         eax,[ebp-18]
 0045ACF4    push        eax
 0045ACF5    mov         ecx,esi
 0045ACF7    dec         ecx
 0045ACF8    mov         edx,1
 0045ACFD    mov         eax,dword ptr [ebp-4]
 0045AD00    call        @UStrCopy
 0045AD05    mov         eax,dword ptr [ebp-18]
 0045AD08    lea         edx,[ebp-14]
 0045AD0B    call        AnsiUpperCase
 0045AD10    mov         edx,dword ptr [ebp-14]
 0045AD13    lea         eax,[ebp-4]
 0045AD16    call        @UStrLAsg
>0045AD1B    jmp         0045AD31
 0045AD1D    lea         eax,[ebp-4]
 0045AD20    push        eax
 0045AD21    mov         ecx,esi
 0045AD23    dec         ecx
 0045AD24    mov         edx,1
 0045AD29    mov         eax,dword ptr [ebp-4]
 0045AD2C    call        @UStrCopy
 0045AD31    mov         ecx,dword ptr [ebp-8]
 0045AD34    mov         edx,dword ptr [ebp-4]
 0045AD37    mov         eax,dword ptr [ebx+5C]
 0045AD3A    call        TStringHash.Add
 0045AD3F    inc         dword ptr [ebp-8]
 0045AD42    dec         dword ptr [ebp-0C]
>0045AD45    jne         0045ACBC
 0045AD4B    mov         byte ptr [ebx+61],1
 0045AD4F    xor         eax,eax
 0045AD51    pop         edx
 0045AD52    pop         ecx
 0045AD53    pop         ecx
 0045AD54    mov         dword ptr fs:[eax],edx
 0045AD57    push        45AD79
 0045AD5C    lea         eax,[ebp-18]
 0045AD5F    mov         edx,3
 0045AD64    call        @UStrArrayClr
 0045AD69    lea         eax,[ebp-4]
 0045AD6C    call        @UStrClr
 0045AD71    ret
>0045AD72    jmp         @HandleFinally
>0045AD77    jmp         0045AD5C
 0045AD79    pop         esi
 0045AD7A    pop         ebx
 0045AD7B    mov         esp,ebp
 0045AD7D    pop         ebp
 0045AD7E    ret
*}
end;

//0045AD80
procedure THashedStringList.UpdateValueHash;
begin
{*
 0045AD80    push        ebp
 0045AD81    mov         ebp,esp
 0045AD83    xor         ecx,ecx
 0045AD85    push        ecx
 0045AD86    push        ecx
 0045AD87    push        ecx
 0045AD88    push        ecx
 0045AD89    push        ebx
 0045AD8A    push        esi
 0045AD8B    push        edi
 0045AD8C    mov         ebx,eax
 0045AD8E    xor         eax,eax
 0045AD90    push        ebp
 0045AD91    push        45AE44
 0045AD96    push        dword ptr fs:[eax]
 0045AD99    mov         dword ptr fs:[eax],esp
 0045AD9C    cmp         byte ptr [ebx+60],0
>0045ADA0    jne         0045AE29
 0045ADA6    mov         eax,dword ptr [ebx+58]
 0045ADA9    test        eax,eax
>0045ADAB    jne         0045ADC3
 0045ADAD    mov         ecx,100
 0045ADB2    mov         dl,1
 0045ADB4    mov         eax,[00458E60];TStringHash
 0045ADB9    call        TStringHash.Create
 0045ADBE    mov         dword ptr [ebx+58],eax
>0045ADC1    jmp         0045ADC8
 0045ADC3    call        TStringHash.Clear
 0045ADC8    mov         eax,ebx
 0045ADCA    mov         edx,dword ptr [eax]
 0045ADCC    call        dword ptr [edx+14]
 0045ADCF    dec         eax
 0045ADD0    test        eax,eax
>0045ADD2    jl          0045AE25
 0045ADD4    inc         eax
 0045ADD5    mov         dword ptr [ebp-4],eax
 0045ADD8    xor         esi,esi
 0045ADDA    cmp         byte ptr [ebx+3A],0
>0045ADDE    jne         0045AE06
 0045ADE0    lea         ecx,[ebp-0C]
 0045ADE3    mov         edx,esi
 0045ADE5    mov         eax,ebx
 0045ADE7    mov         edi,dword ptr [eax]
 0045ADE9    call        dword ptr [edi+0C]
 0045ADEC    mov         eax,dword ptr [ebp-0C]
 0045ADEF    lea         edx,[ebp-8]
 0045ADF2    call        AnsiUpperCase
 0045ADF7    mov         edx,dword ptr [ebp-8]
 0045ADFA    mov         ecx,esi
 0045ADFC    mov         eax,dword ptr [ebx+58]
 0045ADFF    call        TStringHash.Add
>0045AE04    jmp         0045AE1F
 0045AE06    lea         ecx,[ebp-10]
 0045AE09    mov         edx,esi
 0045AE0B    mov         eax,ebx
 0045AE0D    mov         edi,dword ptr [eax]
 0045AE0F    call        dword ptr [edi+0C]
 0045AE12    mov         edx,dword ptr [ebp-10]
 0045AE15    mov         ecx,esi
 0045AE17    mov         eax,dword ptr [ebx+58]
 0045AE1A    call        TStringHash.Add
 0045AE1F    inc         esi
 0045AE20    dec         dword ptr [ebp-4]
>0045AE23    jne         0045ADDA
 0045AE25    mov         byte ptr [ebx+60],1
 0045AE29    xor         eax,eax
 0045AE2B    pop         edx
 0045AE2C    pop         ecx
 0045AE2D    pop         ecx
 0045AE2E    mov         dword ptr fs:[eax],edx
 0045AE31    push        45AE4B
 0045AE36    lea         eax,[ebp-10]
 0045AE39    mov         edx,3
 0045AE3E    call        @UStrArrayClr
 0045AE43    ret
>0045AE44    jmp         @HandleFinally
>0045AE49    jmp         0045AE36
 0045AE4B    pop         edi
 0045AE4C    pop         esi
 0045AE4D    pop         ebx
 0045AE4E    mov         esp,ebp
 0045AE50    pop         ebp
 0045AE51    ret
*}
end;

//0045AE54
constructor TMemIniFile.Create;
begin
{*
 0045AE54    push        ebx
 0045AE55    push        esi
 0045AE56    test        dl,dl
>0045AE58    je          0045AE62
 0045AE5A    add         esp,0FFFFFFF0
 0045AE5D    call        @ClassCreate
 0045AE62    mov         ebx,edx
 0045AE64    mov         esi,eax
 0045AE66    push        0
 0045AE68    xor         edx,edx
 0045AE6A    mov         eax,esi
 0045AE6C    call        TMemIniFile.Create
 0045AE71    mov         eax,esi
 0045AE73    test        bl,bl
>0045AE75    je          0045AE86
 0045AE77    call        @AfterConstruction
 0045AE7C    pop         dword ptr fs:[0]
 0045AE83    add         esp,0C
 0045AE86    mov         eax,esi
 0045AE88    pop         esi
 0045AE89    pop         ebx
 0045AE8A    ret
*}
end;

//0045AE8C
constructor TMemIniFile.Create(Encoding:TEncoding);
begin
{*
 0045AE8C    push        ebp
 0045AE8D    mov         ebp,esp
 0045AE8F    push        ebx
 0045AE90    push        esi
 0045AE91    test        dl,dl
>0045AE93    je          0045AE9D
 0045AE95    add         esp,0FFFFFFF0
 0045AE98    call        @ClassCreate
 0045AE9D    mov         ebx,edx
 0045AE9F    mov         esi,eax
 0045AEA1    xor         edx,edx
 0045AEA3    mov         eax,esi
 0045AEA5    call        TCustomIniFile.Create
 0045AEAA    mov         eax,dword ptr [ebp+8]
 0045AEAD    mov         dword ptr [esi+0C],eax
 0045AEB0    mov         dl,1
 0045AEB2    mov         eax,[004590C8];THashedStringList
 0045AEB7    call        TStringList.Create
 0045AEBC    mov         dword ptr [esi+8],eax
 0045AEBF    mov         eax,esi
 0045AEC1    call        TMemIniFile.LoadValues
 0045AEC6    mov         eax,esi
 0045AEC8    test        bl,bl
>0045AECA    je          0045AEDB
 0045AECC    call        @AfterConstruction
 0045AED1    pop         dword ptr fs:[0]
 0045AED8    add         esp,0C
 0045AEDB    mov         eax,esi
 0045AEDD    pop         esi
 0045AEDE    pop         ebx
 0045AEDF    pop         ebp
 0045AEE0    ret         4
*}
end;

//0045AEE4
destructor TMemIniFile.Destroy();
begin
{*
 0045AEE4    push        ebx
 0045AEE5    push        esi
 0045AEE6    call        @BeforeDestruction
 0045AEEB    mov         ebx,edx
 0045AEED    mov         esi,eax
 0045AEEF    cmp         dword ptr [esi+8],0
>0045AEF3    je          0045AEFC
 0045AEF5    mov         eax,esi
 0045AEF7    call        TMemIniFile.Clear
 0045AEFC    mov         eax,dword ptr [esi+8]
 0045AEFF    call        TObject.Free
 0045AF04    mov         edx,ebx
 0045AF06    and         dl,0FC
 0045AF09    mov         eax,esi
 0045AF0B    call        TObject.Destroy
 0045AF10    test        bl,bl
>0045AF12    jle         0045AF1B
 0045AF14    mov         eax,esi
 0045AF16    call        @ClassDestroy
 0045AF1B    pop         esi
 0045AF1C    pop         ebx
 0045AF1D    ret
*}
end;

//0045AF20
function TMemIniFile.AddSection(const Section:UnicodeString):TStrings;
begin
{*
 0045AF20    push        ebp
 0045AF21    mov         ebp,esp
 0045AF23    push        ecx
 0045AF24    push        ebx
 0045AF25    push        esi
 0045AF26    push        edi
 0045AF27    mov         esi,edx
 0045AF29    mov         ebx,eax
 0045AF2B    mov         dl,1
 0045AF2D    mov         eax,[004590C8];THashedStringList
 0045AF32    call        TStringList.Create
 0045AF37    mov         dword ptr [ebp-4],eax
 0045AF3A    xor         eax,eax
 0045AF3C    push        ebp
 0045AF3D    push        45AF70
 0045AF42    push        dword ptr fs:[eax]
 0045AF45    mov         dword ptr fs:[eax],esp
 0045AF48    mov         eax,ebx
 0045AF4A    call        TMemIniFile.GetCaseSensitive
 0045AF4F    mov         edx,eax
 0045AF51    mov         eax,dword ptr [ebp-4]
 0045AF54    call        TStringList.SetCaseSensitive
 0045AF59    mov         eax,dword ptr [ebx+8]
 0045AF5C    mov         ecx,dword ptr [ebp-4]
 0045AF5F    mov         edx,esi
 0045AF61    mov         ebx,dword ptr [eax]
 0045AF63    call        dword ptr [ebx+3C]
 0045AF66    xor         eax,eax
 0045AF68    pop         edx
 0045AF69    pop         ecx
 0045AF6A    pop         ecx
 0045AF6B    mov         dword ptr fs:[eax],edx
>0045AF6E    jmp         0045AF87
>0045AF70    jmp         @HandleAnyException
 0045AF75    mov         eax,dword ptr [ebp-4]
 0045AF78    call        TObject.Free
 0045AF7D    call        @RaiseAgain
 0045AF82    call        @DoneExcept
 0045AF87    mov         eax,dword ptr [ebp-4]
 0045AF8A    pop         edi
 0045AF8B    pop         esi
 0045AF8C    pop         ebx
 0045AF8D    pop         ecx
 0045AF8E    pop         ebp
 0045AF8F    ret
*}
end;

//0045AF90
procedure TMemIniFile.Clear;
begin
{*
 0045AF90    push        ebx
 0045AF91    push        esi
 0045AF92    push        edi
 0045AF93    mov         edi,eax
 0045AF95    mov         eax,dword ptr [edi+8]
 0045AF98    mov         edx,dword ptr [eax]
 0045AF9A    call        dword ptr [edx+14]
 0045AF9D    mov         ebx,eax
 0045AF9F    dec         ebx
 0045AFA0    test        ebx,ebx
>0045AFA2    jl          0045AFBA
 0045AFA4    inc         ebx
 0045AFA5    xor         esi,esi
 0045AFA7    mov         eax,dword ptr [edi+8]
 0045AFAA    mov         edx,esi
 0045AFAC    mov         ecx,dword ptr [eax]
 0045AFAE    call        dword ptr [ecx+18]
 0045AFB1    call        TObject.Free
 0045AFB6    inc         esi
 0045AFB7    dec         ebx
>0045AFB8    jne         0045AFA7
 0045AFBA    mov         eax,dword ptr [edi+8]
 0045AFBD    mov         edx,dword ptr [eax]
 0045AFBF    call        dword ptr [edx+44]
 0045AFC2    pop         edi
 0045AFC3    pop         esi
 0045AFC4    pop         ebx
 0045AFC5    ret
*}
end;

//0045AFC8
procedure TMemIniFile.DeleteKey(Section:string; Ident:string);
begin
{*
 0045AFC8    push        ebx
 0045AFC9    push        esi
 0045AFCA    push        edi
 0045AFCB    push        ecx
 0045AFCC    mov         dword ptr [esp],ecx
 0045AFCF    mov         ebx,eax
 0045AFD1    mov         eax,dword ptr [ebx+8]
 0045AFD4    mov         ecx,dword ptr [eax]
 0045AFD6    call        dword ptr [ecx+54]
 0045AFD9    mov         esi,eax
 0045AFDB    test        esi,esi
>0045AFDD    jl          0045B004
 0045AFDF    mov         edx,esi
 0045AFE1    mov         eax,dword ptr [ebx+8]
 0045AFE4    mov         ecx,dword ptr [eax]
 0045AFE6    call        dword ptr [ecx+18]
 0045AFE9    mov         edi,eax
 0045AFEB    mov         edx,dword ptr [esp]
 0045AFEE    mov         eax,edi
 0045AFF0    mov         ecx,dword ptr [eax]
 0045AFF2    call        dword ptr [ecx+58]
 0045AFF5    mov         esi,eax
 0045AFF7    test        esi,esi
>0045AFF9    jl          0045B004
 0045AFFB    mov         edx,esi
 0045AFFD    mov         eax,edi
 0045AFFF    mov         ecx,dword ptr [eax]
 0045B001    call        dword ptr [ecx+48]
 0045B004    pop         edx
 0045B005    pop         edi
 0045B006    pop         esi
 0045B007    pop         ebx
 0045B008    ret
*}
end;

//0045B00C
procedure TMemIniFile.EraseSection(Section:string);
begin
{*
 0045B00C    push        ebx
 0045B00D    push        esi
 0045B00E    mov         ebx,eax
 0045B010    mov         eax,dword ptr [ebx+8]
 0045B013    mov         ecx,dword ptr [eax]
 0045B015    call        dword ptr [ecx+54]
 0045B018    mov         esi,eax
 0045B01A    test        esi,esi
>0045B01C    jl          0045B037
 0045B01E    mov         edx,esi
 0045B020    mov         eax,dword ptr [ebx+8]
 0045B023    mov         ecx,dword ptr [eax]
 0045B025    call        dword ptr [ecx+18]
 0045B028    call        TObject.Free
 0045B02D    mov         edx,esi
 0045B02F    mov         eax,dword ptr [ebx+8]
 0045B032    mov         ecx,dword ptr [eax]
 0045B034    call        dword ptr [ecx+48]
 0045B037    pop         esi
 0045B038    pop         ebx
 0045B039    ret
*}
end;

//0045B03C
function TMemIniFile.GetCaseSensitive:Boolean;
begin
{*
 0045B03C    mov         eax,dword ptr [eax+8]
 0045B03F    movzx       eax,byte ptr [eax+3A]
 0045B043    ret
*}
end;

//0045B044
procedure TMemIniFile.GetStrings(List:TStrings);
begin
{*
 0045B044    push        ebp
 0045B045    mov         ebp,esp
 0045B047    add         esp,0FFFFFFE0
 0045B04A    push        ebx
 0045B04B    push        esi
 0045B04C    push        edi
 0045B04D    xor         ecx,ecx
 0045B04F    mov         dword ptr [ebp-20],ecx
 0045B052    mov         dword ptr [ebp-18],ecx
 0045B055    mov         dword ptr [ebp-1C],ecx
 0045B058    mov         dword ptr [ebp-8],edx
 0045B05B    mov         dword ptr [ebp-4],eax
 0045B05E    xor         eax,eax
 0045B060    push        ebp
 0045B061    push        45B164
 0045B066    push        dword ptr fs:[eax]
 0045B069    mov         dword ptr fs:[eax],esp
 0045B06C    mov         eax,dword ptr [ebp-8]
 0045B06F    call        TStrings.BeginUpdate
 0045B074    xor         eax,eax
 0045B076    push        ebp
 0045B077    push        45B142
 0045B07C    push        dword ptr fs:[eax]
 0045B07F    mov         dword ptr fs:[eax],esp
 0045B082    mov         eax,dword ptr [ebp-4]
 0045B085    mov         eax,dword ptr [eax+8]
 0045B088    mov         edx,dword ptr [eax]
 0045B08A    call        dword ptr [edx+14]
 0045B08D    dec         eax
 0045B08E    test        eax,eax
>0045B090    jl          0045B12C
 0045B096    inc         eax
 0045B097    mov         dword ptr [ebp-14],eax
 0045B09A    mov         dword ptr [ebp-0C],0
 0045B0A1    push        45B180;'['
 0045B0A6    lea         ecx,[ebp-1C]
 0045B0A9    mov         eax,dword ptr [ebp-4]
 0045B0AC    mov         eax,dword ptr [eax+8]
 0045B0AF    mov         edx,dword ptr [ebp-0C]
 0045B0B2    mov         ebx,dword ptr [eax]
 0045B0B4    call        dword ptr [ebx+0C]
 0045B0B7    push        dword ptr [ebp-1C]
 0045B0BA    push        45B190;']'
 0045B0BF    lea         eax,[ebp-18]
 0045B0C2    mov         edx,3
 0045B0C7    call        @UStrCatN
 0045B0CC    mov         edx,dword ptr [ebp-18]
 0045B0CF    mov         eax,dword ptr [ebp-8]
 0045B0D2    mov         ecx,dword ptr [eax]
 0045B0D4    call        dword ptr [ecx+38]
 0045B0D7    mov         eax,dword ptr [ebp-4]
 0045B0DA    mov         eax,dword ptr [eax+8]
 0045B0DD    mov         edx,dword ptr [ebp-0C]
 0045B0E0    mov         ecx,dword ptr [eax]
 0045B0E2    call        dword ptr [ecx+18]
 0045B0E5    mov         dword ptr [ebp-10],eax
 0045B0E8    mov         eax,dword ptr [ebp-10]
 0045B0EB    mov         edx,dword ptr [eax]
 0045B0ED    call        dword ptr [edx+14]
 0045B0F0    mov         ebx,eax
 0045B0F2    dec         ebx
 0045B0F3    test        ebx,ebx
>0045B0F5    jl          0045B116
 0045B0F7    inc         ebx
 0045B0F8    xor         esi,esi
 0045B0FA    lea         ecx,[ebp-20]
 0045B0FD    mov         edx,esi
 0045B0FF    mov         eax,dword ptr [ebp-10]
 0045B102    mov         edi,dword ptr [eax]
 0045B104    call        dword ptr [edi+0C]
 0045B107    mov         edx,dword ptr [ebp-20]
 0045B10A    mov         eax,dword ptr [ebp-8]
 0045B10D    mov         ecx,dword ptr [eax]
 0045B10F    call        dword ptr [ecx+38]
 0045B112    inc         esi
 0045B113    dec         ebx
>0045B114    jne         0045B0FA
 0045B116    xor         edx,edx
 0045B118    mov         eax,dword ptr [ebp-8]
 0045B11B    mov         ecx,dword ptr [eax]
 0045B11D    call        dword ptr [ecx+38]
 0045B120    inc         dword ptr [ebp-0C]
 0045B123    dec         dword ptr [ebp-14]
>0045B126    jne         0045B0A1
 0045B12C    xor         eax,eax
 0045B12E    pop         edx
 0045B12F    pop         ecx
 0045B130    pop         ecx
 0045B131    mov         dword ptr fs:[eax],edx
 0045B134    push        45B149
 0045B139    mov         eax,dword ptr [ebp-8]
 0045B13C    call        TStrings.EndUpdate
 0045B141    ret
>0045B142    jmp         @HandleFinally
>0045B147    jmp         0045B139
 0045B149    xor         eax,eax
 0045B14B    pop         edx
 0045B14C    pop         ecx
 0045B14D    pop         ecx
 0045B14E    mov         dword ptr fs:[eax],edx
 0045B151    push        45B16B
 0045B156    lea         eax,[ebp-20]
 0045B159    mov         edx,3
 0045B15E    call        @UStrArrayClr
 0045B163    ret
>0045B164    jmp         @HandleFinally
>0045B169    jmp         0045B156
 0045B16B    pop         edi
 0045B16C    pop         esi
 0045B16D    pop         ebx
 0045B16E    mov         esp,ebp
 0045B170    pop         ebp
 0045B171    ret
*}
end;

//0045B194
procedure TMemIniFile.LoadValues;
begin
{*
 0045B194    push        ebp
 0045B195    mov         ebp,esp
 0045B197    add         esp,0FFFFFFF0
 0045B19A    push        ebx
 0045B19B    push        esi
 0045B19C    xor         edx,edx
 0045B19E    mov         dword ptr [ebp-10],edx
 0045B1A1    mov         dword ptr [ebp-4],edx
 0045B1A4    mov         ebx,eax
 0045B1A6    xor         eax,eax
 0045B1A8    push        ebp
 0045B1A9    push        45B2E9
 0045B1AE    push        dword ptr fs:[eax]
 0045B1B1    mov         dword ptr fs:[eax],esp
 0045B1B4    cmp         dword ptr [ebx+4],0
>0045B1B8    je          0045B2BE
 0045B1BE    mov         eax,dword ptr [ebx+4]
 0045B1C1    mov         dl,1
 0045B1C3    call        FileExists
 0045B1C8    test        al,al
>0045B1CA    je          0045B2BE
 0045B1D0    push        20
 0045B1D2    mov         ecx,dword ptr [ebx+4]
 0045B1D5    mov         dl,1
 0045B1D7    mov         eax,[0043D6D0];TFileStream
 0045B1DC    call        TFileStream.Create
 0045B1E1    mov         dword ptr [ebp-0C],eax
 0045B1E4    xor         eax,eax
 0045B1E6    push        ebp
 0045B1E7    push        45B2B7
 0045B1EC    push        dword ptr fs:[eax]
 0045B1EF    mov         dword ptr fs:[eax],esp
 0045B1F2    mov         eax,dword ptr [ebp-0C]
 0045B1F5    mov         edx,dword ptr [eax]
 0045B1F7    call        dword ptr [edx]
 0045B1F9    mov         esi,eax
 0045B1FB    mov         eax,dword ptr [ebp-0C]
 0045B1FE    call        TStream.GetPosition
 0045B203    sub         esi,eax
 0045B205    push        esi
 0045B206    lea         eax,[ebp-4]
 0045B209    mov         ecx,1
 0045B20E    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0045B214    call        @DynArraySetLength
 0045B219    add         esp,4
 0045B21C    mov         edx,dword ptr [ebp-4]
 0045B21F    mov         ecx,esi
 0045B221    mov         eax,dword ptr [ebp-0C]
 0045B224    mov         esi,dword ptr [eax]
 0045B226    call        dword ptr [esi+0C]
 0045B229    lea         edx,[ebx+0C]
 0045B22C    mov         eax,dword ptr [ebp-4]
 0045B22F    call        TEncoding.GetBufferEncoding
 0045B234    mov         esi,eax
 0045B236    mov         dl,1
 0045B238    mov         eax,[0043C7BC];TStringList
 0045B23D    call        TStringList.Create
 0045B242    mov         dword ptr [ebp-8],eax
 0045B245    xor         eax,eax
 0045B247    push        ebp
 0045B248    push        45B29A
 0045B24D    push        dword ptr fs:[eax]
 0045B250    mov         dword ptr fs:[eax],esp
 0045B253    mov         eax,dword ptr [ebp-4]
 0045B256    call        @DynArrayLength
 0045B25B    sub         eax,esi
 0045B25D    push        eax
 0045B25E    lea         eax,[ebp-10]
 0045B261    push        eax
 0045B262    mov         eax,dword ptr [ebx+0C]
 0045B265    mov         ecx,esi
 0045B267    mov         edx,dword ptr [ebp-4]
 0045B26A    call        TEncoding.GetString
 0045B26F    mov         edx,dword ptr [ebp-10]
 0045B272    mov         eax,dword ptr [ebp-8]
 0045B275    mov         ecx,dword ptr [eax]
 0045B277    call        dword ptr [ecx+2C]
 0045B27A    mov         edx,dword ptr [ebp-8]
 0045B27D    mov         eax,ebx
 0045B27F    call        TMemIniFile.SetStrings
 0045B284    xor         eax,eax
 0045B286    pop         edx
 0045B287    pop         ecx
 0045B288    pop         ecx
 0045B289    mov         dword ptr fs:[eax],edx
 0045B28C    push        45B2A1
 0045B291    mov         eax,dword ptr [ebp-8]
 0045B294    call        TObject.Free
 0045B299    ret
>0045B29A    jmp         @HandleFinally
>0045B29F    jmp         0045B291
 0045B2A1    xor         eax,eax
 0045B2A3    pop         edx
 0045B2A4    pop         ecx
 0045B2A5    pop         ecx
 0045B2A6    mov         dword ptr fs:[eax],edx
 0045B2A9    push        45B2C5
 0045B2AE    mov         eax,dword ptr [ebp-0C]
 0045B2B1    call        TObject.Free
 0045B2B6    ret
>0045B2B7    jmp         @HandleFinally
>0045B2BC    jmp         0045B2AE
 0045B2BE    mov         eax,ebx
 0045B2C0    call        TMemIniFile.Clear
 0045B2C5    xor         eax,eax
 0045B2C7    pop         edx
 0045B2C8    pop         ecx
 0045B2C9    pop         ecx
 0045B2CA    mov         dword ptr fs:[eax],edx
 0045B2CD    push        45B2F0
 0045B2D2    lea         eax,[ebp-10]
 0045B2D5    call        @UStrClr
 0045B2DA    lea         eax,[ebp-4]
 0045B2DD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0045B2E3    call        @DynArrayClear
 0045B2E8    ret
>0045B2E9    jmp         @HandleFinally
>0045B2EE    jmp         0045B2D2
 0045B2F0    pop         esi
 0045B2F1    pop         ebx
 0045B2F2    mov         esp,ebp
 0045B2F4    pop         ebp
 0045B2F5    ret
*}
end;

//0045B2F8
procedure TMemIniFile.ReadSection(Section:string; Strings:TStrings);
begin
{*
 0045B2F8    push        ebp
 0045B2F9    mov         ebp,esp
 0045B2FB    add         esp,0FFFFFFF4
 0045B2FE    push        ebx
 0045B2FF    push        esi
 0045B300    xor         ebx,ebx
 0045B302    mov         dword ptr [ebp-0C],ebx
 0045B305    mov         dword ptr [ebp-4],ecx
 0045B308    mov         esi,edx
 0045B30A    mov         ebx,eax
 0045B30C    xor         eax,eax
 0045B30E    push        ebp
 0045B30F    push        45B3B6
 0045B314    push        dword ptr fs:[eax]
 0045B317    mov         dword ptr fs:[eax],esp
 0045B31A    mov         eax,dword ptr [ebp-4]
 0045B31D    call        TStrings.BeginUpdate
 0045B322    xor         eax,eax
 0045B324    push        ebp
 0045B325    push        45B399
 0045B32A    push        dword ptr fs:[eax]
 0045B32D    mov         dword ptr fs:[eax],esp
 0045B330    mov         eax,dword ptr [ebp-4]
 0045B333    mov         edx,dword ptr [eax]
 0045B335    call        dword ptr [edx+44]
 0045B338    mov         eax,dword ptr [ebx+8]
 0045B33B    mov         edx,esi
 0045B33D    mov         ecx,dword ptr [eax]
 0045B33F    call        dword ptr [ecx+54]
 0045B342    mov         esi,eax
 0045B344    test        esi,esi
>0045B346    jl          0045B383
 0045B348    mov         eax,dword ptr [ebx+8]
 0045B34B    mov         edx,esi
 0045B34D    mov         ecx,dword ptr [eax]
 0045B34F    call        dword ptr [ecx+18]
 0045B352    mov         dword ptr [ebp-8],eax
 0045B355    mov         eax,dword ptr [ebp-8]
 0045B358    mov         edx,dword ptr [eax]
 0045B35A    call        dword ptr [edx+14]
 0045B35D    mov         ebx,eax
 0045B35F    dec         ebx
 0045B360    test        ebx,ebx
>0045B362    jl          0045B383
 0045B364    inc         ebx
 0045B365    xor         esi,esi
 0045B367    lea         ecx,[ebp-0C]
 0045B36A    mov         edx,esi
 0045B36C    mov         eax,dword ptr [ebp-8]
 0045B36F    call        TStrings.GetName
 0045B374    mov         edx,dword ptr [ebp-0C]
 0045B377    mov         eax,dword ptr [ebp-4]
 0045B37A    mov         ecx,dword ptr [eax]
 0045B37C    call        dword ptr [ecx+38]
 0045B37F    inc         esi
 0045B380    dec         ebx
>0045B381    jne         0045B367
 0045B383    xor         eax,eax
 0045B385    pop         edx
 0045B386    pop         ecx
 0045B387    pop         ecx
 0045B388    mov         dword ptr fs:[eax],edx
 0045B38B    push        45B3A0
 0045B390    mov         eax,dword ptr [ebp-4]
 0045B393    call        TStrings.EndUpdate
 0045B398    ret
>0045B399    jmp         @HandleFinally
>0045B39E    jmp         0045B390
 0045B3A0    xor         eax,eax
 0045B3A2    pop         edx
 0045B3A3    pop         ecx
 0045B3A4    pop         ecx
 0045B3A5    mov         dword ptr fs:[eax],edx
 0045B3A8    push        45B3BD
 0045B3AD    lea         eax,[ebp-0C]
 0045B3B0    call        @UStrClr
 0045B3B5    ret
>0045B3B6    jmp         @HandleFinally
>0045B3BB    jmp         0045B3AD
 0045B3BD    pop         esi
 0045B3BE    pop         ebx
 0045B3BF    mov         esp,ebp
 0045B3C1    pop         ebp
 0045B3C2    ret
*}
end;

//0045B3C4
procedure TMemIniFile.ReadSections(Strings:TStrings);
begin
{*
 0045B3C4    push        esi
 0045B3C5    push        edi
 0045B3C6    mov         edi,edx
 0045B3C8    mov         esi,eax
 0045B3CA    mov         edx,dword ptr [esi+8]
 0045B3CD    mov         eax,edi
 0045B3CF    mov         ecx,dword ptr [eax]
 0045B3D1    call        dword ptr [ecx+8]
 0045B3D4    pop         edi
 0045B3D5    pop         esi
 0045B3D6    ret
*}
end;

//0045B3D8
procedure TMemIniFile.ReadSectionValues(Section:string; Strings:TStrings);
begin
{*
 0045B3D8    push        ebp
 0045B3D9    mov         ebp,esp
 0045B3DB    push        ecx
 0045B3DC    push        ebx
 0045B3DD    push        esi
 0045B3DE    push        edi
 0045B3DF    mov         dword ptr [ebp-4],ecx
 0045B3E2    mov         ebx,edx
 0045B3E4    mov         esi,eax
 0045B3E6    mov         eax,dword ptr [ebp-4]
 0045B3E9    call        TStrings.BeginUpdate
 0045B3EE    xor         eax,eax
 0045B3F0    push        ebp
 0045B3F1    push        45B43E
 0045B3F6    push        dword ptr fs:[eax]
 0045B3F9    mov         dword ptr fs:[eax],esp
 0045B3FC    mov         eax,dword ptr [ebp-4]
 0045B3FF    mov         edx,dword ptr [eax]
 0045B401    call        dword ptr [edx+44]
 0045B404    mov         eax,dword ptr [esi+8]
 0045B407    mov         edx,ebx
 0045B409    mov         ecx,dword ptr [eax]
 0045B40B    call        dword ptr [ecx+54]
 0045B40E    mov         edi,eax
 0045B410    test        edi,edi
>0045B412    jl          0045B428
 0045B414    mov         eax,dword ptr [esi+8]
 0045B417    mov         edx,edi
 0045B419    mov         ecx,dword ptr [eax]
 0045B41B    call        dword ptr [ecx+18]
 0045B41E    mov         edx,eax
 0045B420    mov         eax,dword ptr [ebp-4]
 0045B423    mov         ecx,dword ptr [eax]
 0045B425    call        dword ptr [ecx+8]
 0045B428    xor         eax,eax
 0045B42A    pop         edx
 0045B42B    pop         ecx
 0045B42C    pop         ecx
 0045B42D    mov         dword ptr fs:[eax],edx
 0045B430    push        45B445
 0045B435    mov         eax,dword ptr [ebp-4]
 0045B438    call        TStrings.EndUpdate
 0045B43D    ret
>0045B43E    jmp         @HandleFinally
>0045B443    jmp         0045B435
 0045B445    pop         edi
 0045B446    pop         esi
 0045B447    pop         ebx
 0045B448    pop         ecx
 0045B449    pop         ebp
 0045B44A    ret
*}
end;

//0045B44C
function TMemIniFile.ReadString(Section:string; Ident:string; Default:string):string;
begin
{*
 0045B44C    push        ebp
 0045B44D    mov         ebp,esp
 0045B44F    add         esp,0FFFFFFF8
 0045B452    push        ebx
 0045B453    push        esi
 0045B454    xor         ebx,ebx
 0045B456    mov         dword ptr [ebp-4],ebx
 0045B459    mov         dword ptr [ebp-8],ecx
 0045B45C    mov         esi,eax
 0045B45E    xor         eax,eax
 0045B460    push        ebp
 0045B461    push        45B4E5
 0045B466    push        dword ptr fs:[eax]
 0045B469    mov         dword ptr fs:[eax],esp
 0045B46C    mov         eax,dword ptr [esi+8]
 0045B46F    mov         ecx,dword ptr [eax]
 0045B471    call        dword ptr [ecx+54]
 0045B474    mov         ebx,eax
 0045B476    test        ebx,ebx
>0045B478    jl          0045B4C4
 0045B47A    mov         edx,ebx
 0045B47C    mov         eax,dword ptr [esi+8]
 0045B47F    mov         ecx,dword ptr [eax]
 0045B481    call        dword ptr [ecx+18]
 0045B484    mov         esi,eax
 0045B486    mov         edx,dword ptr [ebp-8]
 0045B489    mov         eax,esi
 0045B48B    mov         ecx,dword ptr [eax]
 0045B48D    call        dword ptr [ecx+58]
 0045B490    mov         ebx,eax
 0045B492    test        ebx,ebx
>0045B494    jl          0045B4C4
 0045B496    lea         ecx,[ebp-4]
 0045B499    mov         edx,ebx
 0045B49B    mov         eax,esi
 0045B49D    mov         ebx,dword ptr [eax]
 0045B49F    call        dword ptr [ebx+0C]
 0045B4A2    mov         ebx,dword ptr [ebp-8]
 0045B4A5    test        ebx,ebx
>0045B4A7    je          0045B4AE
 0045B4A9    sub         ebx,4
 0045B4AC    mov         ebx,dword ptr [ebx]
 0045B4AE    mov         eax,dword ptr [ebp+8]
 0045B4B1    push        eax
 0045B4B2    lea         edx,[ebx+2]
 0045B4B5    mov         ecx,7FFFFFFF
 0045B4BA    mov         eax,dword ptr [ebp-4]
 0045B4BD    call        @UStrCopy
>0045B4C2    jmp         0045B4CF
 0045B4C4    mov         eax,dword ptr [ebp+8]
 0045B4C7    mov         edx,dword ptr [ebp+0C]
 0045B4CA    call        @UStrAsg
 0045B4CF    xor         eax,eax
 0045B4D1    pop         edx
 0045B4D2    pop         ecx
 0045B4D3    pop         ecx
 0045B4D4    mov         dword ptr fs:[eax],edx
 0045B4D7    push        45B4EC
 0045B4DC    lea         eax,[ebp-4]
 0045B4DF    call        @UStrClr
 0045B4E4    ret
>0045B4E5    jmp         @HandleFinally
>0045B4EA    jmp         0045B4DC
 0045B4EC    pop         esi
 0045B4ED    pop         ebx
 0045B4EE    pop         ecx
 0045B4EF    pop         ecx
 0045B4F0    pop         ebp
 0045B4F1    ret         8
*}
end;

//0045B4F4
procedure TMemIniFile.Rename(FileName:string; Reload:Boolean);
begin
{*
 0045B4F4    push        ebx
 0045B4F5    push        esi
 0045B4F6    push        edi
 0045B4F7    mov         ebx,ecx
 0045B4F9    mov         esi,edx
 0045B4FB    mov         edi,eax
 0045B4FD    lea         eax,[edi+4]
 0045B500    mov         edx,esi
 0045B502    call        @UStrAsg
 0045B507    test        bl,bl
>0045B509    je          0045B512
 0045B50B    mov         eax,edi
 0045B50D    call        TMemIniFile.LoadValues
 0045B512    pop         edi
 0045B513    pop         esi
 0045B514    pop         ebx
 0045B515    ret
*}
end;

//0045B518
procedure TMemIniFile.SetCaseSensitive(Value:Boolean);
begin
{*
 0045B518    push        ebx
 0045B519    push        esi
 0045B51A    push        edi
 0045B51B    push        ebp
 0045B51C    push        ecx
 0045B51D    mov         byte ptr [esp],dl
 0045B520    mov         esi,eax
 0045B522    mov         eax,dword ptr [esi+8]
 0045B525    movzx       edx,byte ptr [eax+3A]
 0045B529    cmp         dl,byte ptr [esp]
>0045B52C    je          0045B579
 0045B52E    movzx       edx,byte ptr [esp]
 0045B532    call        TStringList.SetCaseSensitive
 0045B537    mov         eax,dword ptr [esi+8]
 0045B53A    mov         edx,dword ptr [eax]
 0045B53C    call        dword ptr [edx+14]
 0045B53F    mov         edi,eax
 0045B541    dec         edi
 0045B542    test        edi,edi
>0045B544    jl          0045B56E
 0045B546    inc         edi
 0045B547    xor         ebp,ebp
 0045B549    mov         edx,ebp
 0045B54B    mov         eax,dword ptr [esi+8]
 0045B54E    mov         ecx,dword ptr [eax]
 0045B550    call        dword ptr [ecx+18]
 0045B553    mov         ebx,eax
 0045B555    movzx       edx,byte ptr [esp]
 0045B559    mov         eax,ebx
 0045B55B    call        TStringList.SetCaseSensitive
 0045B560    mov         eax,ebx
 0045B562    mov         edx,dword ptr [eax]
 0045B564    call        dword ptr [edx+90]
 0045B56A    inc         ebp
 0045B56B    dec         edi
>0045B56C    jne         0045B549
 0045B56E    mov         eax,dword ptr [esi+8]
 0045B571    mov         edx,dword ptr [eax]
 0045B573    call        dword ptr [edx+90]
 0045B579    pop         edx
 0045B57A    pop         ebp
 0045B57B    pop         edi
 0045B57C    pop         esi
 0045B57D    pop         ebx
 0045B57E    ret
*}
end;

//0045B580
procedure TMemIniFile.SetStrings(List:TStrings);
begin
{*
 0045B580    push        ebp
 0045B581    mov         ebp,esp
 0045B583    mov         ecx,6
 0045B588    push        0
 0045B58A    push        0
 0045B58C    dec         ecx
>0045B58D    jne         0045B588
 0045B58F    push        ebx
 0045B590    push        esi
 0045B591    mov         dword ptr [ebp-0C],edx
 0045B594    mov         dword ptr [ebp-8],eax
 0045B597    xor         eax,eax
 0045B599    push        ebp
 0045B59A    push        45B725
 0045B59F    push        dword ptr fs:[eax]
 0045B5A2    mov         dword ptr fs:[eax],esp
 0045B5A5    mov         eax,dword ptr [ebp-8]
 0045B5A8    call        TMemIniFile.Clear
 0045B5AD    xor         eax,eax
 0045B5AF    mov         dword ptr [ebp-14],eax
 0045B5B2    mov         eax,dword ptr [ebp-0C]
 0045B5B5    mov         edx,dword ptr [eax]
 0045B5B7    call        dword ptr [edx+14]
 0045B5BA    mov         ebx,eax
 0045B5BC    dec         ebx
 0045B5BD    test        ebx,ebx
>0045B5BF    jl          0045B702
 0045B5C5    inc         ebx
 0045B5C6    mov         dword ptr [ebp-10],0
 0045B5CD    lea         ecx,[ebp-18]
 0045B5D0    mov         edx,dword ptr [ebp-10]
 0045B5D3    mov         eax,dword ptr [ebp-0C]
 0045B5D6    mov         esi,dword ptr [eax]
 0045B5D8    call        dword ptr [esi+0C]
 0045B5DB    mov         eax,dword ptr [ebp-18]
 0045B5DE    lea         edx,[ebp-4]
 0045B5E1    call        Trim
 0045B5E6    cmp         dword ptr [ebp-4],0
>0045B5EA    je          0045B6F8
 0045B5F0    mov         eax,dword ptr [ebp-4]
 0045B5F3    cmp         word ptr [eax],3B
>0045B5F7    je          0045B6F8
 0045B5FD    mov         eax,dword ptr [ebp-4]
 0045B600    cmp         word ptr [eax],5B
>0045B604    jne         0045B620
 0045B606    mov         eax,dword ptr [ebp-4]
 0045B609    test        eax,eax
>0045B60B    je          0045B612
 0045B60D    sub         eax,4
 0045B610    mov         eax,dword ptr [eax]
 0045B612    mov         edx,dword ptr [ebp-4]
 0045B615    cmp         word ptr [edx+eax*2-2],5D
 0045B61B    sete        al
>0045B61E    jmp         0045B622
 0045B620    xor         eax,eax
 0045B622    test        al,al
>0045B624    je          0045B66D
 0045B626    lea         eax,[ebp-4]
 0045B629    mov         ecx,1
 0045B62E    mov         edx,1
 0045B633    call        @UStrDelete
 0045B638    mov         eax,dword ptr [ebp-4]
 0045B63B    test        eax,eax
>0045B63D    je          0045B644
 0045B63F    sub         eax,4
 0045B642    mov         eax,dword ptr [eax]
 0045B644    mov         edx,eax
 0045B646    dec         edx
 0045B647    lea         eax,[ebp-4]
 0045B64A    call        @UStrSetLength
 0045B64F    lea         edx,[ebp-1C]
 0045B652    mov         eax,dword ptr [ebp-4]
 0045B655    call        Trim
 0045B65A    mov         edx,dword ptr [ebp-1C]
 0045B65D    mov         eax,dword ptr [ebp-8]
 0045B660    call        TMemIniFile.AddSection
 0045B665    mov         dword ptr [ebp-14],eax
>0045B668    jmp         0045B6F8
 0045B66D    cmp         dword ptr [ebp-14],0
>0045B671    je          0045B6F8
 0045B677    mov         edx,dword ptr [ebp-4]
 0045B67A    mov         eax,45B740;'='
 0045B67F    call        Pos
 0045B684    mov         esi,eax
 0045B686    test        esi,esi
>0045B688    jle         0045B6ED
 0045B68A    lea         eax,[ebp-28]
 0045B68D    push        eax
 0045B68E    mov         ecx,esi
 0045B690    dec         ecx
 0045B691    mov         edx,1
 0045B696    mov         eax,dword ptr [ebp-4]
 0045B699    call        @UStrCopy
 0045B69E    mov         eax,dword ptr [ebp-28]
 0045B6A1    lea         edx,[ebp-24]
 0045B6A4    call        Trim
 0045B6A9    push        dword ptr [ebp-24]
 0045B6AC    push        45B740;'='
 0045B6B1    lea         eax,[ebp-30]
 0045B6B4    push        eax
 0045B6B5    lea         edx,[esi+1]
 0045B6B8    mov         ecx,7FFFFFFF
 0045B6BD    mov         eax,dword ptr [ebp-4]
 0045B6C0    call        @UStrCopy
 0045B6C5    mov         eax,dword ptr [ebp-30]
 0045B6C8    lea         edx,[ebp-2C]
 0045B6CB    call        Trim
 0045B6D0    push        dword ptr [ebp-2C]
 0045B6D3    lea         eax,[ebp-20]
 0045B6D6    mov         edx,3
 0045B6DB    call        @UStrCatN
 0045B6E0    mov         edx,dword ptr [ebp-20]
 0045B6E3    mov         eax,dword ptr [ebp-14]
 0045B6E6    mov         ecx,dword ptr [eax]
 0045B6E8    call        dword ptr [ecx+38]
>0045B6EB    jmp         0045B6F8
 0045B6ED    mov         edx,dword ptr [ebp-4]
 0045B6F0    mov         eax,dword ptr [ebp-14]
 0045B6F3    mov         ecx,dword ptr [eax]
 0045B6F5    call        dword ptr [ecx+38]
 0045B6F8    inc         dword ptr [ebp-10]
 0045B6FB    dec         ebx
>0045B6FC    jne         0045B5CD
 0045B702    xor         eax,eax
 0045B704    pop         edx
 0045B705    pop         ecx
 0045B706    pop         ecx
 0045B707    mov         dword ptr fs:[eax],edx
 0045B70A    push        45B72C
 0045B70F    lea         eax,[ebp-30]
 0045B712    mov         edx,7
 0045B717    call        @UStrArrayClr
 0045B71C    lea         eax,[ebp-4]
 0045B71F    call        @UStrClr
 0045B724    ret
>0045B725    jmp         @HandleFinally
>0045B72A    jmp         0045B70F
 0045B72C    pop         esi
 0045B72D    pop         ebx
 0045B72E    mov         esp,ebp
 0045B730    pop         ebp
 0045B731    ret
*}
end;

//0045B744
procedure TMemIniFile.UpdateFile;
begin
{*
 0045B744    push        ebp
 0045B745    mov         ebp,esp
 0045B747    push        ecx
 0045B748    push        ebx
 0045B749    mov         ebx,eax
 0045B74B    mov         dl,1
 0045B74D    mov         eax,[0043C7BC];TStringList
 0045B752    call        TStringList.Create
 0045B757    mov         dword ptr [ebp-4],eax
 0045B75A    xor         eax,eax
 0045B75C    push        ebp
 0045B75D    push        45B799
 0045B762    push        dword ptr fs:[eax]
 0045B765    mov         dword ptr fs:[eax],esp
 0045B768    mov         edx,dword ptr [ebp-4]
 0045B76B    mov         eax,ebx
 0045B76D    call        TMemIniFile.GetStrings
 0045B772    mov         ecx,dword ptr [ebx+0C]
 0045B775    mov         edx,dword ptr [ebx+4]
 0045B778    mov         eax,dword ptr [ebp-4]
 0045B77B    mov         ebx,dword ptr [eax]
 0045B77D    call        dword ptr [ebx+80]
 0045B783    xor         eax,eax
 0045B785    pop         edx
 0045B786    pop         ecx
 0045B787    pop         ecx
 0045B788    mov         dword ptr fs:[eax],edx
 0045B78B    push        45B7A0
 0045B790    mov         eax,dword ptr [ebp-4]
 0045B793    call        TObject.Free
 0045B798    ret
>0045B799    jmp         @HandleFinally
>0045B79E    jmp         0045B790
 0045B7A0    pop         ebx
 0045B7A1    pop         ecx
 0045B7A2    pop         ebp
 0045B7A3    ret
*}
end;

//0045B7A4
procedure TMemIniFile.WriteString(Section:string; Ident:string; Value:string);
begin
{*
 0045B7A4    push        ebp
 0045B7A5    mov         ebp,esp
 0045B7A7    add         esp,0FFFFFFF8
 0045B7AA    push        ebx
 0045B7AB    push        esi
 0045B7AC    push        edi
 0045B7AD    xor         ebx,ebx
 0045B7AF    mov         dword ptr [ebp-4],ebx
 0045B7B2    mov         edi,ecx
 0045B7B4    mov         dword ptr [ebp-8],edx
 0045B7B7    mov         esi,eax
 0045B7B9    xor         eax,eax
 0045B7BB    push        ebp
 0045B7BC    push        45B845
 0045B7C1    push        dword ptr fs:[eax]
 0045B7C4    mov         dword ptr fs:[eax],esp
 0045B7C7    mov         eax,dword ptr [esi+8]
 0045B7CA    mov         edx,dword ptr [ebp-8]
 0045B7CD    mov         ecx,dword ptr [eax]
 0045B7CF    call        dword ptr [ecx+54]
 0045B7D2    mov         ebx,eax
 0045B7D4    test        ebx,ebx
>0045B7D6    jl          0045B7E6
 0045B7D8    mov         eax,dword ptr [esi+8]
 0045B7DB    mov         edx,ebx
 0045B7DD    mov         ecx,dword ptr [eax]
 0045B7DF    call        dword ptr [ecx+18]
 0045B7E2    mov         esi,eax
>0045B7E4    jmp         0045B7F2
 0045B7E6    mov         edx,dword ptr [ebp-8]
 0045B7E9    mov         eax,esi
 0045B7EB    call        TMemIniFile.AddSection
 0045B7F0    mov         esi,eax
 0045B7F2    push        edi
 0045B7F3    push        45B864;'='
 0045B7F8    push        dword ptr [ebp+8]
 0045B7FB    lea         eax,[ebp-4]
 0045B7FE    mov         edx,3
 0045B803    call        @UStrCatN
 0045B808    mov         edx,edi
 0045B80A    mov         eax,esi
 0045B80C    mov         ecx,dword ptr [eax]
 0045B80E    call        dword ptr [ecx+58]
 0045B811    mov         ebx,eax
 0045B813    test        ebx,ebx
>0045B815    jl          0045B825
 0045B817    mov         ecx,dword ptr [ebp-4]
 0045B81A    mov         edx,ebx
 0045B81C    mov         eax,esi
 0045B81E    mov         ebx,dword ptr [eax]
 0045B820    call        dword ptr [ebx+20]
>0045B823    jmp         0045B82F
 0045B825    mov         edx,dword ptr [ebp-4]
 0045B828    mov         eax,esi
 0045B82A    mov         ecx,dword ptr [eax]
 0045B82C    call        dword ptr [ecx+38]
 0045B82F    xor         eax,eax
 0045B831    pop         edx
 0045B832    pop         ecx
 0045B833    pop         ecx
 0045B834    mov         dword ptr fs:[eax],edx
 0045B837    push        45B84C
 0045B83C    lea         eax,[ebp-4]
 0045B83F    call        @UStrClr
 0045B844    ret
>0045B845    jmp         @HandleFinally
>0045B84A    jmp         0045B83C
 0045B84C    pop         edi
 0045B84D    pop         esi
 0045B84E    pop         ebx
 0045B84F    pop         ecx
 0045B850    pop         ecx
 0045B851    pop         ebp
 0045B852    ret         4
*}
end;

//0045B868
destructor TIniFile.Destroy();
begin
{*
 0045B868    push        ebx
 0045B869    push        esi
 0045B86A    call        @BeforeDestruction
 0045B86F    mov         ebx,edx
 0045B871    mov         esi,eax
 0045B873    mov         eax,esi
 0045B875    mov         edx,dword ptr [eax]
 0045B877    call        dword ptr [edx+60]
 0045B87A    mov         edx,ebx
 0045B87C    and         dl,0FC
 0045B87F    mov         eax,esi
 0045B881    call        TObject.Destroy
 0045B886    test        bl,bl
>0045B888    jle         0045B891
 0045B88A    mov         eax,esi
 0045B88C    call        @ClassDestroy
 0045B891    pop         esi
 0045B892    pop         ebx
 0045B893    ret
*}
end;

//0045B894
function TIniFile.ReadString(Section:string; Ident:string; Default:string):string;
begin
{*
 0045B894    push        ebp
 0045B895    mov         ebp,esp
 0045B897    add         esp,0FFFFF004
 0045B89D    push        eax
 0045B89E    push        ebx
 0045B89F    push        esi
 0045B8A0    push        edi
 0045B8A1    mov         edi,ecx
 0045B8A3    mov         esi,edx
 0045B8A5    mov         ebx,eax
 0045B8A7    mov         eax,dword ptr [ebx+4]
 0045B8AA    call        @UStrToPWChar
 0045B8AF    push        eax
 0045B8B0    push        800
 0045B8B5    lea         eax,[ebp-1000]
 0045B8BB    push        eax
 0045B8BC    mov         eax,dword ptr [ebp+0C]
 0045B8BF    call        @UStrToPWChar
 0045B8C4    push        eax
 0045B8C5    mov         eax,edi
 0045B8C7    call        @UStrToPWChar
 0045B8CC    push        eax
 0045B8CD    mov         eax,esi
 0045B8CF    call        @UStrToPWChar
 0045B8D4    push        eax
 0045B8D5    call        kernel32.GetPrivateProfileStringW
 0045B8DA    mov         ecx,eax
 0045B8DC    lea         edx,[ebp-1000]
 0045B8E2    mov         eax,dword ptr [ebp+8]
 0045B8E5    call        @UStrFromPWCharLen
 0045B8EA    pop         edi
 0045B8EB    pop         esi
 0045B8EC    pop         ebx
 0045B8ED    mov         esp,ebp
 0045B8EF    pop         ebp
 0045B8F0    ret         8
*}
end;

//0045B8F4
procedure TIniFile.WriteString(Section:string; Ident:string; Value:string);
begin
{*
 0045B8F4    push        ebp
 0045B8F5    mov         ebp,esp
 0045B8F7    add         esp,0FFFFFFF8
 0045B8FA    push        ebx
 0045B8FB    push        esi
 0045B8FC    push        edi
 0045B8FD    mov         edi,ecx
 0045B8FF    mov         esi,edx
 0045B901    mov         ebx,eax
 0045B903    mov         eax,dword ptr [ebx+4]
 0045B906    call        @UStrToPWChar
 0045B90B    push        eax
 0045B90C    mov         eax,dword ptr [ebp+8]
 0045B90F    call        @UStrToPWChar
 0045B914    push        eax
 0045B915    mov         eax,edi
 0045B917    call        @UStrToPWChar
 0045B91C    push        eax
 0045B91D    mov         eax,esi
 0045B91F    call        @UStrToPWChar
 0045B924    push        eax
 0045B925    call        kernel32.WritePrivateProfileStringW
 0045B92A    test        eax,eax
>0045B92C    jne         0045B955
 0045B92E    mov         eax,dword ptr [ebx+4]
 0045B931    mov         dword ptr [ebp-8],eax
 0045B934    mov         byte ptr [ebp-4],11
 0045B938    lea         eax,[ebp-8]
 0045B93B    push        eax
 0045B93C    push        0
 0045B93E    mov         ecx,dword ptr ds:[78D7C4];^SResString122:TResStringRec
 0045B944    mov         dl,1
 0045B946    mov         eax,[004581FC];EIniFileException
 0045B94B    call        Exception.CreateResFmt
 0045B950    call        @RaiseExcept
 0045B955    pop         edi
 0045B956    pop         esi
 0045B957    pop         ebx
 0045B958    pop         ecx
 0045B959    pop         ecx
 0045B95A    pop         ebp
 0045B95B    ret         4
*}
end;

//0045B960
procedure TIniFile.ReadSections(Strings:TStrings);
begin
{*
 0045B960    push        ebp
 0045B961    mov         ebp,esp
 0045B963    add         esp,0FFFFFFEC
 0045B966    push        ebx
 0045B967    push        esi
 0045B968    xor         ecx,ecx
 0045B96A    mov         dword ptr [ebp-14],ecx
 0045B96D    mov         dword ptr [ebp-4],ecx
 0045B970    mov         dword ptr [ebp-8],edx
 0045B973    mov         esi,eax
 0045B975    xor         eax,eax
 0045B977    push        ebp
 0045B978    push        45BAD3
 0045B97D    push        dword ptr fs:[eax]
 0045B980    mov         dword ptr fs:[eax],esp
 0045B983    xor         eax,eax
 0045B985    mov         dword ptr [ebp-0C],eax
 0045B988    xor         eax,eax
 0045B98A    mov         dword ptr [ebp-10],eax
 0045B98D    xor         eax,eax
 0045B98F    push        ebp
 0045B990    push        45BAA8
 0045B995    push        dword ptr fs:[eax]
 0045B998    mov         dword ptr fs:[eax],esp
 0045B99B    mov         eax,8000
 0045B9A0    call        @GetMem
 0045B9A5    mov         dword ptr [ebp-10],eax
 0045B9A8    mov         eax,dword ptr [ebp-8]
 0045B9AB    call        TStrings.BeginUpdate
 0045B9B0    xor         eax,eax
 0045B9B2    push        ebp
 0045B9B3    push        45BA8B
 0045B9B8    push        dword ptr fs:[eax]
 0045B9BB    mov         dword ptr fs:[eax],esp
 0045B9BE    mov         eax,dword ptr [ebp-8]
 0045B9C1    mov         edx,dword ptr [eax]
 0045B9C3    call        dword ptr [edx+44]
 0045B9C6    mov         eax,dword ptr [esi+4]
 0045B9C9    call        @UStrToPWChar
 0045B9CE    push        eax
 0045B9CF    push        4000
 0045B9D4    mov         eax,dword ptr [ebp-10]
 0045B9D7    push        eax
 0045B9D8    push        0
 0045B9DA    push        0
 0045B9DC    push        0
 0045B9DE    call        kernel32.GetPrivateProfileStringW
 0045B9E3    mov         ebx,eax
 0045B9E5    cmp         ebx,3FFE
>0045B9EB    jne         0045BA45
 0045B9ED    lea         edx,[ebp-4]
 0045B9F0    mov         eax,dword ptr [esi+4]
 0045B9F3    call        TFile.ReadAllBytes
 0045B9F8    lea         edx,[ebp-0C]
 0045B9FB    mov         eax,dword ptr [ebp-4]
 0045B9FE    call        TEncoding.GetBufferEncoding
 0045BA03    mov         edx,dword ptr [ebp-4]
 0045BA06    mov         eax,dword ptr [ebp-0C]
 0045BA09    call        TEncoding.GetCharCount
 0045BA0E    mov         ebx,eax
 0045BA10    mov         edx,1
 0045BA15    mov         eax,dword ptr [ebp-0C]
 0045BA18    mov         ecx,dword ptr [eax]
 0045BA1A    call        dword ptr [ecx+1C]
 0045BA1D    mov         edx,eax
 0045BA1F    imul        edx,ebx
 0045BA22    lea         eax,[ebp-10]
 0045BA25    call        @ReallocMem
 0045BA2A    mov         eax,dword ptr [esi+4]
 0045BA2D    call        @UStrToPWChar
 0045BA32    push        eax
 0045BA33    push        ebx
 0045BA34    mov         eax,dword ptr [ebp-10]
 0045BA37    push        eax
 0045BA38    push        0
 0045BA3A    push        0
 0045BA3C    push        0
 0045BA3E    call        kernel32.GetPrivateProfileStringW
 0045BA43    mov         ebx,eax
 0045BA45    test        ebx,ebx
>0045BA47    je          0045BA75
 0045BA49    mov         ebx,dword ptr [ebp-10]
>0045BA4C    jmp         0045BA6F
 0045BA4E    lea         eax,[ebp-14]
 0045BA51    mov         edx,ebx
 0045BA53    call        @UStrFromPWChar
 0045BA58    mov         edx,dword ptr [ebp-14]
 0045BA5B    mov         eax,dword ptr [ebp-8]
 0045BA5E    mov         ecx,dword ptr [eax]
 0045BA60    call        dword ptr [ecx+38]
 0045BA63    mov         eax,ebx
 0045BA65    call        StrLen
 0045BA6A    inc         eax
 0045BA6B    add         eax,eax
 0045BA6D    add         ebx,eax
 0045BA6F    cmp         word ptr [ebx],0
>0045BA73    jne         0045BA4E
 0045BA75    xor         eax,eax
 0045BA77    pop         edx
 0045BA78    pop         ecx
 0045BA79    pop         ecx
 0045BA7A    mov         dword ptr fs:[eax],edx
 0045BA7D    push        45BA92
 0045BA82    mov         eax,dword ptr [ebp-8]
 0045BA85    call        TStrings.EndUpdate
 0045BA8A    ret
>0045BA8B    jmp         @HandleFinally
>0045BA90    jmp         0045BA82
 0045BA92    xor         eax,eax
 0045BA94    pop         edx
 0045BA95    pop         ecx
 0045BA96    pop         ecx
 0045BA97    mov         dword ptr fs:[eax],edx
 0045BA9A    push        45BAAF
 0045BA9F    mov         eax,dword ptr [ebp-10]
 0045BAA2    call        @FreeMem
 0045BAA7    ret
>0045BAA8    jmp         @HandleFinally
>0045BAAD    jmp         0045BA9F
 0045BAAF    xor         eax,eax
 0045BAB1    pop         edx
 0045BAB2    pop         ecx
 0045BAB3    pop         ecx
 0045BAB4    mov         dword ptr fs:[eax],edx
 0045BAB7    push        45BADA
 0045BABC    lea         eax,[ebp-14]
 0045BABF    call        @UStrClr
 0045BAC4    lea         eax,[ebp-4]
 0045BAC7    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0045BACD    call        @DynArrayClear
 0045BAD2    ret
>0045BAD3    jmp         @HandleFinally
>0045BAD8    jmp         0045BABC
 0045BADA    pop         esi
 0045BADB    pop         ebx
 0045BADC    mov         esp,ebp
 0045BADE    pop         ebp
 0045BADF    ret
*}
end;

//0045BAE0
procedure ReadStringData;
begin
{*
 0045BAE0    push        ebp
 0045BAE1    mov         ebp,esp
 0045BAE3    push        0
 0045BAE5    push        ebx
 0045BAE6    mov         ebx,dword ptr [ebp+8]
 0045BAE9    add         ebx,0FFFFFFF0
 0045BAEC    xor         eax,eax
 0045BAEE    push        ebp
 0045BAEF    push        45BB93
 0045BAF4    push        dword ptr fs:[eax]
 0045BAF7    mov         dword ptr fs:[eax],esp
 0045BAFA    mov         eax,dword ptr [ebp+8]
 0045BAFD    mov         eax,dword ptr [eax-4]
 0045BB00    call        TStrings.BeginUpdate
 0045BB05    xor         eax,eax
 0045BB07    push        ebp
 0045BB08    push        45BB76
 0045BB0D    push        dword ptr fs:[eax]
 0045BB10    mov         dword ptr fs:[eax],esp
 0045BB13    mov         eax,dword ptr [ebp+8]
 0045BB16    mov         eax,dword ptr [eax-4]
 0045BB19    mov         edx,dword ptr [eax]
 0045BB1B    call        dword ptr [edx+44]
 0045BB1E    mov         eax,dword ptr [ebp+8]
 0045BB21    cmp         dword ptr [eax-8],0
>0045BB25    je          0045BB5D
 0045BB27    mov         eax,dword ptr [ebp+8]
 0045BB2A    mov         eax,dword ptr [eax-0C]
 0045BB2D    mov         dword ptr [ebx],eax
>0045BB2F    jmp         0045BB55
 0045BB31    lea         eax,[ebp-4]
 0045BB34    mov         edx,dword ptr [ebx]
 0045BB36    call        @UStrFromPWChar
 0045BB3B    mov         edx,dword ptr [ebp-4]
 0045BB3E    mov         eax,dword ptr [ebp+8]
 0045BB41    mov         eax,dword ptr [eax-4]
 0045BB44    mov         ecx,dword ptr [eax]
 0045BB46    call        dword ptr [ecx+38]
 0045BB49    mov         eax,dword ptr [ebx]
 0045BB4B    call        StrLen
 0045BB50    inc         eax
 0045BB51    add         eax,eax
 0045BB53    add         dword ptr [ebx],eax
 0045BB55    mov         eax,dword ptr [ebx]
 0045BB57    cmp         word ptr [eax],0
>0045BB5B    jne         0045BB31
 0045BB5D    xor         eax,eax
 0045BB5F    pop         edx
 0045BB60    pop         ecx
 0045BB61    pop         ecx
 0045BB62    mov         dword ptr fs:[eax],edx
 0045BB65    push        45BB7D
 0045BB6A    mov         eax,dword ptr [ebp+8]
 0045BB6D    mov         eax,dword ptr [eax-4]
 0045BB70    call        TStrings.EndUpdate
 0045BB75    ret
>0045BB76    jmp         @HandleFinally
>0045BB7B    jmp         0045BB6A
 0045BB7D    xor         eax,eax
 0045BB7F    pop         edx
 0045BB80    pop         ecx
 0045BB81    pop         ecx
 0045BB82    mov         dword ptr fs:[eax],edx
 0045BB85    push        45BB9A
 0045BB8A    lea         eax,[ebp-4]
 0045BB8D    call        @UStrClr
 0045BB92    ret
>0045BB93    jmp         @HandleFinally
>0045BB98    jmp         0045BB8A
 0045BB9A    pop         ebx
 0045BB9B    pop         ecx
 0045BB9C    pop         ebp
 0045BB9D    ret
*}
end;

//0045BBA0
procedure TIniFile.ReadSection(Section:string; Strings:TStrings);
begin
{*
 0045BBA0    push        ebp
 0045BBA1    mov         ebp,esp
 0045BBA3    add         esp,0FFFFFFE4
 0045BBA6    mov         dword ptr [ebp-4],ecx
 0045BBA9    mov         dword ptr [ebp-18],edx
 0045BBAC    mov         dword ptr [ebp-14],eax
 0045BBAF    mov         dword ptr [ebp-1C],400
 0045BBB6    mov         eax,dword ptr [ebp-1C]
 0045BBB9    add         eax,eax
 0045BBBB    call        @GetMem
 0045BBC0    mov         dword ptr [ebp-0C],eax
 0045BBC3    xor         eax,eax
 0045BBC5    push        ebp
 0045BBC6    push        45BC2C
 0045BBCB    push        dword ptr fs:[eax]
 0045BBCE    mov         dword ptr fs:[eax],esp
 0045BBD1    mov         eax,dword ptr [ebp-14]
 0045BBD4    mov         eax,dword ptr [eax+4]
 0045BBD7    call        @UStrToPWChar
 0045BBDC    push        eax
 0045BBDD    mov         eax,dword ptr [ebp-1C]
 0045BBE0    push        eax
 0045BBE1    mov         eax,dword ptr [ebp-0C]
 0045BBE4    push        eax
 0045BBE5    push        0
 0045BBE7    push        0
 0045BBE9    mov         eax,dword ptr [ebp-18]
 0045BBEC    call        @UStrToPWChar
 0045BBF1    push        eax
 0045BBF2    call        kernel32.GetPrivateProfileStringW
 0045BBF7    mov         dword ptr [ebp-8],eax
 0045BBFA    mov         eax,dword ptr [ebp-1C]
 0045BBFD    sub         eax,2
 0045BC00    cmp         eax,dword ptr [ebp-8]
>0045BC03    jle         0045BC13
 0045BC05    push        ebp
 0045BC06    call        ReadStringData
 0045BC0B    pop         ecx
 0045BC0C    call        @TryFinallyExit
>0045BC11    jmp         0045BC42
 0045BC13    xor         eax,eax
 0045BC15    pop         edx
 0045BC16    pop         ecx
 0045BC17    pop         ecx
 0045BC18    mov         dword ptr fs:[eax],edx
 0045BC1B    push        45BC33
 0045BC20    mov         edx,dword ptr [ebp-1C]
 0045BC23    mov         eax,dword ptr [ebp-0C]
 0045BC26    call        @FreeMem
 0045BC2B    ret
>0045BC2C    jmp         @HandleFinally
>0045BC31    jmp         0045BC20
 0045BC33    mov         eax,dword ptr [ebp-1C]
 0045BC36    add         eax,eax
 0045BC38    add         eax,eax
 0045BC3A    mov         dword ptr [ebp-1C],eax
>0045BC3D    jmp         0045BBB6
 0045BC42    mov         esp,ebp
 0045BC44    pop         ebp
 0045BC45    ret
*}
end;

//0045BC48
procedure TIniFile.ReadSectionValues(Section:string; Strings:TStrings);
begin
{*
 0045BC48    push        ebp
 0045BC49    mov         ebp,esp
 0045BC4B    add         esp,0FFFFFFE0
 0045BC4E    push        ebx
 0045BC4F    push        esi
 0045BC50    push        edi
 0045BC51    xor         ebx,ebx
 0045BC53    mov         dword ptr [ebp-14],ebx
 0045BC56    mov         dword ptr [ebp-18],ebx
 0045BC59    mov         dword ptr [ebp-1C],ebx
 0045BC5C    mov         dword ptr [ebp-20],ebx
 0045BC5F    mov         dword ptr [ebp-0C],ecx
 0045BC62    mov         dword ptr [ebp-8],edx
 0045BC65    mov         dword ptr [ebp-4],eax
 0045BC68    xor         eax,eax
 0045BC6A    push        ebp
 0045BC6B    push        45BD7B
 0045BC70    push        dword ptr fs:[eax]
 0045BC73    mov         dword ptr fs:[eax],esp
 0045BC76    mov         dl,1
 0045BC78    mov         eax,[0043C7BC];TStringList
 0045BC7D    call        TStringList.Create
 0045BC82    mov         dword ptr [ebp-10],eax
 0045BC85    xor         eax,eax
 0045BC87    push        ebp
 0045BC88    push        45BD59
 0045BC8D    push        dword ptr fs:[eax]
 0045BC90    mov         dword ptr fs:[eax],esp
 0045BC93    mov         ecx,dword ptr [ebp-10]
 0045BC96    mov         edx,dword ptr [ebp-8]
 0045BC99    mov         eax,dword ptr [ebp-4]
 0045BC9C    mov         ebx,dword ptr [eax]
 0045BC9E    call        dword ptr [ebx+44]
 0045BCA1    mov         eax,dword ptr [ebp-0C]
 0045BCA4    call        TStrings.BeginUpdate
 0045BCA9    xor         eax,eax
 0045BCAB    push        ebp
 0045BCAC    push        45BD3C
 0045BCB1    push        dword ptr fs:[eax]
 0045BCB4    mov         dword ptr fs:[eax],esp
 0045BCB7    mov         eax,dword ptr [ebp-0C]
 0045BCBA    mov         edx,dword ptr [eax]
 0045BCBC    call        dword ptr [edx+44]
 0045BCBF    mov         eax,dword ptr [ebp-10]
 0045BCC2    mov         edx,dword ptr [eax]
 0045BCC4    call        dword ptr [edx+14]
 0045BCC7    mov         esi,eax
 0045BCC9    dec         esi
 0045BCCA    test        esi,esi
>0045BCCC    jl          0045BD26
 0045BCCE    inc         esi
 0045BCCF    xor         ebx,ebx
 0045BCD1    lea         ecx,[ebp-18]
 0045BCD4    mov         edx,ebx
 0045BCD6    mov         eax,dword ptr [ebp-10]
 0045BCD9    mov         edi,dword ptr [eax]
 0045BCDB    call        dword ptr [edi+0C]
 0045BCDE    push        dword ptr [ebp-18]
 0045BCE1    push        45BD98;'='
 0045BCE6    push        0
 0045BCE8    lea         eax,[ebp-1C]
 0045BCEB    push        eax
 0045BCEC    lea         ecx,[ebp-20]
 0045BCEF    mov         edx,ebx
 0045BCF1    mov         eax,dword ptr [ebp-10]
 0045BCF4    mov         edi,dword ptr [eax]
 0045BCF6    call        dword ptr [edi+0C]
 0045BCF9    mov         ecx,dword ptr [ebp-20]
 0045BCFC    mov         edx,dword ptr [ebp-8]
 0045BCFF    mov         eax,dword ptr [ebp-4]
 0045BD02    mov         edi,dword ptr [eax]
 0045BD04    call        dword ptr [edi+4]
 0045BD07    push        dword ptr [ebp-1C]
 0045BD0A    lea         eax,[ebp-14]
 0045BD0D    mov         edx,3
 0045BD12    call        @UStrCatN
 0045BD17    mov         edx,dword ptr [ebp-14]
 0045BD1A    mov         eax,dword ptr [ebp-0C]
 0045BD1D    mov         ecx,dword ptr [eax]
 0045BD1F    call        dword ptr [ecx+38]
 0045BD22    inc         ebx
 0045BD23    dec         esi
>0045BD24    jne         0045BCD1
 0045BD26    xor         eax,eax
 0045BD28    pop         edx
 0045BD29    pop         ecx
 0045BD2A    pop         ecx
 0045BD2B    mov         dword ptr fs:[eax],edx
 0045BD2E    push        45BD43
 0045BD33    mov         eax,dword ptr [ebp-0C]
 0045BD36    call        TStrings.EndUpdate
 0045BD3B    ret
>0045BD3C    jmp         @HandleFinally
>0045BD41    jmp         0045BD33
 0045BD43    xor         eax,eax
 0045BD45    pop         edx
 0045BD46    pop         ecx
 0045BD47    pop         ecx
 0045BD48    mov         dword ptr fs:[eax],edx
 0045BD4B    push        45BD60
 0045BD50    mov         eax,dword ptr [ebp-10]
 0045BD53    call        TObject.Free
 0045BD58    ret
>0045BD59    jmp         @HandleFinally
>0045BD5E    jmp         0045BD50
 0045BD60    xor         eax,eax
 0045BD62    pop         edx
 0045BD63    pop         ecx
 0045BD64    pop         ecx
 0045BD65    mov         dword ptr fs:[eax],edx
 0045BD68    push        45BD82
 0045BD6D    lea         eax,[ebp-20]
 0045BD70    mov         edx,4
 0045BD75    call        @UStrArrayClr
 0045BD7A    ret
>0045BD7B    jmp         @HandleFinally
>0045BD80    jmp         0045BD6D
 0045BD82    pop         edi
 0045BD83    pop         esi
 0045BD84    pop         ebx
 0045BD85    mov         esp,ebp
 0045BD87    pop         ebp
 0045BD88    ret
*}
end;

//0045BD9C
procedure TIniFile.EraseSection(Section:string);
begin
{*
 0045BD9C    push        ebx
 0045BD9D    push        esi
 0045BD9E    add         esp,0FFFFFFF8
 0045BDA1    mov         esi,edx
 0045BDA3    mov         ebx,eax
 0045BDA5    mov         eax,dword ptr [ebx+4]
 0045BDA8    call        @UStrToPWChar
 0045BDAD    push        eax
 0045BDAE    push        0
 0045BDB0    push        0
 0045BDB2    mov         eax,esi
 0045BDB4    call        @UStrToPWChar
 0045BDB9    push        eax
 0045BDBA    call        kernel32.WritePrivateProfileStringW
 0045BDBF    test        eax,eax
>0045BDC1    jne         0045BDE8
 0045BDC3    mov         eax,dword ptr [ebx+4]
 0045BDC6    mov         dword ptr [esp],eax
 0045BDC9    mov         byte ptr [esp+4],11
 0045BDCE    push        esp
 0045BDCF    push        0
 0045BDD1    mov         ecx,dword ptr ds:[78D7C4];^SResString122:TResStringRec
 0045BDD7    mov         dl,1
 0045BDD9    mov         eax,[004581FC];EIniFileException
 0045BDDE    call        Exception.CreateResFmt
 0045BDE3    call        @RaiseExcept
 0045BDE8    pop         ecx
 0045BDE9    pop         edx
 0045BDEA    pop         esi
 0045BDEB    pop         ebx
 0045BDEC    ret
*}
end;

//0045BDF0
procedure TIniFile.DeleteKey(Section:string; Ident:string);
begin
{*
 0045BDF0    push        ebx
 0045BDF1    push        esi
 0045BDF2    push        edi
 0045BDF3    mov         edi,ecx
 0045BDF5    mov         esi,edx
 0045BDF7    mov         ebx,eax
 0045BDF9    mov         eax,dword ptr [ebx+4]
 0045BDFC    call        @UStrToPWChar
 0045BE01    push        eax
 0045BE02    push        0
 0045BE04    mov         eax,edi
 0045BE06    call        @UStrToPWChar
 0045BE0B    push        eax
 0045BE0C    mov         eax,esi
 0045BE0E    call        @UStrToPWChar
 0045BE13    push        eax
 0045BE14    call        kernel32.WritePrivateProfileStringW
 0045BE19    pop         edi
 0045BE1A    pop         esi
 0045BE1B    pop         ebx
 0045BE1C    ret
*}
end;

//0045BE20
procedure TIniFile.UpdateFile;
begin
{*
 0045BE20    push        ebx
 0045BE21    mov         ebx,eax
 0045BE23    mov         eax,dword ptr [ebx+4]
 0045BE26    call        @UStrToPWChar
 0045BE2B    push        eax
 0045BE2C    push        0
 0045BE2E    push        0
 0045BE30    push        0
 0045BE32    call        kernel32.WritePrivateProfileStringW
 0045BE37    pop         ebx
 0045BE38    ret
*}
end;

Initialization
Finalization
//0045BE3C
{*
 0045BE3C    push        ebp
 0045BE3D    mov         ebp,esp
 0045BE3F    xor         eax,eax
 0045BE41    push        ebp
 0045BE42    push        45BE82
 0045BE47    push        dword ptr fs:[eax]
 0045BE4A    mov         dword ptr fs:[eax],esp
 0045BE4D    inc         dword ptr ds:[793044]
>0045BE53    jne         0045BE74
 0045BE55    mov         eax,7855A4;^'\'
 0045BE5A    call        @UStrClr
 0045BE5F    mov         eax,7855A8;^'0'
 0045BE64    mov         ecx,2
 0045BE69    mov         edx,dword ptr ds:[40128C];string
 0045BE6F    call        @FinalizeArray
 0045BE74    xor         eax,eax
 0045BE76    pop         edx
 0045BE77    pop         ecx
 0045BE78    pop         ecx
 0045BE79    mov         dword ptr fs:[eax],edx
 0045BE7C    push        45BE89
 0045BE81    ret
>0045BE82    jmp         @HandleFinally
>0045BE87    jmp         0045BE81
 0045BE89    pop         ebp
 0045BE8A    ret
*}
end.