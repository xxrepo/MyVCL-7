unit PrintCapabilities_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 05.07.2004 12:59:56 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\DEV\CP\Demos\Installation\PS3\WINDOWSSHELLEXTENSION\PrintCapabilities.tlb (1)
// LIBID: {B2ABABB9-DBCE-4758-BDFE-7F899E9A241A}
// LCID: 0
// Helpfile: 
// HelpString: PrintCapabilities Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\STDOLE2.TLB)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$IFDEF DELPHI6}
  {$WARN SYMBOL_PLATFORM OFF}
  {$VARPROPSETTER ON}
{$ENDIF}
{$WRITEABLECONST ON}
interface

uses Windows, ActiveX, Classes,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Graphics, StdVCL;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PrintCapabilitiesMajorVersion = 1;
  PrintCapabilitiesMinorVersion = 0;

  LIBID_PrintCapabilities: TGUID = '{B2ABABB9-DBCE-4758-BDFE-7F899E9A241A}';


implementation

uses ComObj;

end.
