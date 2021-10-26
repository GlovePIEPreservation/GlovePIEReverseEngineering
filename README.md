# GlovePIE Reverse Engineering

Welcome to the main repository of the GlovePIE decompilation effort! 
GlovePIE is a programmable input emulator written by Carl Kenner. However, the original website has stopped
functioning and the program no longer receives updates. You can download my preservation of the original binaries
at my repository here: [Ravbug/GlovePIE](https://github.com/ravbug/GlovePIE)

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
Embarcadero RAD Studio (the current way to use Delphi) and [IDR](https://github.com/Ravbug/GlovePIEReverseEngineering/releases/tag/IDR) (The Pascal-Delphi decompiler), clone this repository, and take a crack at it!
