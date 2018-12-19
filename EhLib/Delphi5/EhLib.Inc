{*******************************************************}
{                                                       }
{                       EhLib v2.0                      }
{     Conditional defines that affect compilation       }
{                                                       }
{   Copyright (c) 1998, 2001 by Dmitry V. Bolshakov     }
{                                                       }
{*******************************************************}

{$IFDEF VER100} { Borland Delphi 3.0 }
  {$MESSAGE ERROR 'This version of EhLib don't support Delphi 3' }
{$ENDIF}

{$IFDEF VER110}         { C++Builder 3.0 }
  {$MESSAGE ERROR 'This version of EhLib don't support C++Builder 3' }
{$ENDIF}

{$IFDEF VER120}         { Borland Delphi 4.0 }
//  {$DEFINE EH_LIB_35}
//  {$DEFINE EH_LIB_4}
{$ENDIF}

{$IFDEF VER125}         { CPP Builder 4.0 }
//  {$DEFINE EH_LIB_35}
//  {$DEFINE EH_LIB_4}
{$ENDIF}

{$IFDEF VER130}         { Borland Delphi 5.0 or CPP Builder 5.0 }
//  {$DEFINE EH_LIB_35}
//  {$DEFINE EH_LIB_4}
  {$DEFINE EH_LIB_5}
{$ENDIF}

{$IFDEF VER150}         { Borland Delphi 7.0 }
//  {$DEFINE EH_LIB_35}
//  {$DEFINE EH_LIB_4}
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
{$ENDIF}


//{$define eval}
