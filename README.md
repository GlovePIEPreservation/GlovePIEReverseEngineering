# GlovePIE Reverse Engineering

Welcome to the main repository of the GlovePIE decompilation effort! 
GlovePIE is a programmable input emulator written by Carl Kenner. However, the original website has stopped
functioning and the program no longer receives updates. You can download a preservation of the original binaries
at my repository here: [GlovePIEPreservation/GlovePIE](https://github.com/GlovePIEPreservation/GlovePIE)

It is my goal to generate source code that is as close to the original as possible, so that GlovePIE does not eventually
stop working due to Windows updates. 

## What we know:
1. It's written in Pascal
2. It uses Embarcadero Delphi as its IDE and main platform SDK
   - The original GlovePIE was for windows only, but Delphi is multiplatform. Can we bring GlovePIE to other platforms?
3. It uses these third party libraries:
   - [Jedi Code Library v2.2 build 3845](https://sourceforge.net/projects/jcl/files/JCL%20Releases/JCL%202.2%20Build%203845/)
   - [Jedi Video Component Library](https://github.com/project-jedi/jvcl)
   - [TNT Controls/TMS unicode component pack](https://github.com/rofl0r/TntUnicode)
   - [moops-client](https://github.com/silasary/moops-client/tree/master/mwEdit)
   - [Indy Networking](https://github.com/skelter/Indy)

## The next steps:
1. Get it to compile
2. Replace inline assembly with pascal code

## How to contribute
All contributions are welcome. To get started, download the free Community edition of 
Embarcadero RAD Studio (the current way to use Delphi) and [IDR](https://github.com/GlovePIEPreservation/GlovePIEReverseEngineering/releases/tag/IDR) (The Pascal-Delphi decompiler), clone this repository, and take a crack at it!
<details>
   <summary>Direct links to the Delphi downloads on Embarcadero's website, in case the signup form is broken</summary>
   
RAD Studio 11 Alexandria:
Webinstaller: https://altd.embarcadero.com/download/radstudio/11.0/RADStudio_11_esd_1006491.exe
ISO: https://altd.embarcadero.com/download/radstudio/11.0/radstudio_11_106491a.iso

RAD Studio 10.4.2 Sydney:
Webinstaller: http://altd.embarcadero.com/download/radstudio/10.4/RADStudio-1042-esd-4203.exe
ISO: https://altd.embarcadero.com/download/radstudio/10.4/RADStudio-1042-4203.iso

RAD Studio 10.4 Sydney:

Webinstaller: https://altd.embarcadero.com/download/radstudio/10.4/RADStudio-10-4-1-esd-1461.exe
ISO: https://altd.embarcadero.com/download/radstudio/10.4/radstudio_10_4_99797b.iso
Update packs: https://cc.embarcadero.com/reg/delphi

RAD Studio 10.3.3 Rio:
Web installer: https://altd.embarcadero.com/download/radstudio/10.3/radstudio_10_3_3_esd7899_nt.exe
ISO: https://altd.embarcadero.com/download/radstudio/10.3/delphicbuilder10_3_3_7899_nt.iso

RAD Studio 10.3.2 Rio:
Web installer: https://altd.embarcadero.com/download/radstudio/10.3/radstudio_10_3_2_esd_96593b.exe
ISO: https://altd.embarcadero.com//download/radstudio/10.3/delphicbuilder10_3_2_496593b.iso

RAD Studio 10.3 Rio:
Web installer: https://altd.embarcadero.com/download/radstudio/10.3/radstudio10_3_0_esd_94364.exe
ISO: http://altd.embarcadero.com/download/radstudio/10.3/delphicbuilder10_3_0_94364.is

RAD Studio 10.2.3 Tokyo:
Web installer: https://altd.embarcadero.com/download/radstudio/10.2/radstudio10_2_3_esd__93231.exe
ISO: https://altd.embarcadero.com/download/radstudio/10.2/delphicbuilder10_2_3_2631.iso

RAD Studio 10.2.2 Tokyo:
Web installer: https://altd.embarcadero.com/download/radstudio/10.2/radstudio10_2_2_esd_2004.exe|
ISO: https://altd.embarcadero.com/download/radstudio/10.2/delphicbuilder10_2_2_2004.iso

RAD Studio 10.2 Tokyo:
Web installer: https://altd.embarcadero.com/download/radstudio/10.2/radstudio10_2_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/10.2/delphicbuilder10_2.iso

RAD Studio 10.1 Berlin Update 1:
Web installer: https://altd.embarcadero.com/download/radstudio/10.1/radstudio10_1_upd2_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/10.1/delphicbuilder10_1_upd1.iso

Delphi 10 Seattle Update 1:
Web installer: https://altd.embarcadero.com/download/radstudio/10/delphi10_upd1_w_esd.exe
ISO: http://altd.embarcadero.com/download/radstudio/10/delphicbuilder10___upd1.iso

Delphi 10 Seattle:
Web installer: https://altd.embarcadero.com/download/radstudio/10/delphi10_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/10/delphicbuilder10.iso

RAD Studio XE8 with update subscription:
Web installer: https://altd.embarcadero.com/download/radstudio/xe8/delphi_xe8_upd1_subscription.exe
ISO: https://altd.embarcadero.com/download/radstudio/xe8/delphicbuilder_xe8_upd1_subscription.iso

RAD Studio XE7 Update 1:
Web installer: https://altd.embarcadero.com/download/radstudio/xe7/delphi_xe7_upd1_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/xe7/delphicbuilder_xe7_upd1_win.iso

RAD Studio XE6 Update 1:
Web installer: https://altd.embarcadero.com/download/radstudio/xe6/delphi_xe6_upd1_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/xe6/delphicbuilder_xe6_upd1_win.iso

RAD Studio XE 6:
Web installer: https://altd.embarcadero.com/download/radstudio/xe6/delphi_xe6_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/xe6/delphicbuilder_xe6_win.iso

RAD Studio XE5 with updates:
Web installer: https://altd.embarcadero.com/download/radstudio/xe5/delphi_xe5_upd2_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/xe5/delphicbuilder_xe5_upd2_win.iso

RAD Studio XE4:
Web installer: https://altd.embarcadero.com/download/radstudio/xe4/delphi_xe4_upd1_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/xe4/delphicbuilder_xe4_upd1_win.iso

RAD Studio XE2:
Web installer: https://altd.embarcadero.com/download/radstudio/xe2/delphi_xe2_4429_win_esd.exe
ISO: https://altd.embarcadero.com/download/radstudio/xe2/delphicbuilder_xe2_4429_win_dl.iso

RAD Studio XE:
Web installer: https://altd.embarcadero.com/download/RADStudioXE/delphi_xe_3953b_win_esd.zip
ISO: https://altd.embarcadero.com/download/RADStudioXE/delphicbuilder_xe_3953B_win.iso

RAD Studio 2010:
Web installer: https://altd.embarcadero.com/download/RADStudio2010/delphi_2010_3615_win_esd.zip
ISO: https://altd.embarcadero.com/download/RADStudio2010/delphicbuilder_2010_3615_win.iso

RAD Studio 2009:
Web installer: https://altd.embarcadero.com/download/RADStudio2009/RADStudio2009_ESD_June2009.zip
ISO: https://altd.embarcadero.com/download/Delphi_C++Builder2009/Delphi_C++Builder2009_ISO_June2009.iso

Delphi 7:
ISO: https://altd.embarcadero.com/download/delphi/d7/english/ent/delphi_7_ent_en.iso

RAD Studio 2007:
Web installer: https://altd.codegear.com/download/radstudio2007/CodeGearRADStudio2007setup.exe
ISO: https://altd.codegear.com/download/radstudio2007/CodeGearRADStudio2007_Dec2007.iso

   Via https://www.barnsten.com/rad-studio-installation-links-iso-and-webinstallers/
</details>
