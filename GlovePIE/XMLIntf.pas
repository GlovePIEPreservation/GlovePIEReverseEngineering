//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XMLIntf;

interface

uses
  SysUtils, Classes;

type
  TNodeType = (ntReserved, ntElement, ntAttribute, ntText, ntCData, ntEntityRef, ntEntity, ntProcessingInstr, ntComment, ntDocument, ntDocType, ntDocFragment, ntNotation);
  EXMLDocError = class(Exception)
  end;
  TXMLDocOption = (doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl, doAutoSave);
  TXMLDocOptions = set of TXMLDocOption;
  TParseOption = (poResolveExternals, poValidateOnParse, poPreserveWhiteSpace, poAsyncLoad);
  TParseOptions = set of TParseOption;
  TXMLEncodingType = (xetUnknown, xetUCS_4BE, xetUCS_4LE, xetUCS_4Order2134, xetUCS_4Order3412, xetUTF_16BE, xetUTF_16LE, xetUTF_8, xetUCS_4Like, xetUTF_16BELike, xetUTF_16LELike, xetUTF_8Like, xetEBCDICLike);

implementation

Initialization
Finalization
//0058ACA0
{*
 0058ACA0    push        ebp
 0058ACA1    mov         ebp,esp
 0058ACA3    xor         eax,eax
 0058ACA5    push        ebp
 0058ACA6    push        58ACDC
 0058ACAB    push        dword ptr fs:[eax]
 0058ACAE    mov         dword ptr fs:[eax],esp
 0058ACB1    inc         dword ptr ds:[81557C]
>0058ACB7    jne         0058ACCE
 0058ACB9    mov         eax,789A00
 0058ACBE    mov         ecx,0D
 0058ACC3    mov         edx,dword ptr ds:[40128C];string
 0058ACC9    call        @FinalizeArray
 0058ACCE    xor         eax,eax
 0058ACD0    pop         edx
 0058ACD1    pop         ecx
 0058ACD2    pop         ecx
 0058ACD3    mov         dword ptr fs:[eax],edx
 0058ACD6    push        58ACE3
 0058ACDB    ret
>0058ACDC    jmp         @HandleFinally
>0058ACE1    jmp         0058ACDB
 0058ACE3    pop         ebp
 0058ACE4    ret
*}
end.