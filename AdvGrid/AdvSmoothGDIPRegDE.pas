{********************************************************************}
{ TAdvSmoothGDIPRegDE                                                }
{ for Delphi & C++Builder                                            }
{                                                                    }
{ written                                                            }
{   TMS Software                                                     }
{   copyright � 2009                                                 }
{   Email : info@tmssoftware.com                                     }
{   Web : http://www.tmssoftware.com                                 }
{                                                                    }
{ The source code is given as is. The author is not responsible      }
{ for any possible damage done due to the use of this code.          }
{ The component can be freely used in any application. The source    }
{ code remains property of the writer and may not be distributed     }
{ freely as such.                                                    }
{********************************************************************}

unit AdvSmoothGDIPRegDE;

interface
{$I TMSDEFS.INC}
uses
  Classes, AdvSmoothGDIPDE,
  {$IFDEF DELPHI6_LVL}
    DesignIntf, DesignEditors,
  {$ELSE}
    DsgnIntf,
  {$ENDIF}
  {$IFDEF TMSPACKGDIP}
    AdvGDIP
  {$ELSE}
    AdvSmoothGDIP
  {$ENDIF}
  ;



procedure Register;

implementation


procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TAdvGDIPPicture), TComponent, '', TGDIPPictureProperty);
  RegisterPropertyEditor(TypeInfo(TAdvGDIPPicture), TPersistent, '', TGDIPPictureProperty);
end;


end.

