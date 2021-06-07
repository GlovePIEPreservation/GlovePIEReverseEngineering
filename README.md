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

## The next step:
- Get it to compile

## How to contribute
All contributions are welcome. To get started, download the free Community edition of 
Embarcadero RAD Studio (the current way to use Delphi) and [IDR](https://github.com/Ravbug/GlovePIEReverseEngineering/releases/tag/IDR) (The Pascal-Delphi decompiler), clone this repository, and take a crack at it!
