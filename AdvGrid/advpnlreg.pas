{*************************************************************************}
{ TAdvPanel, TAdvPanelGroup, TAdvPanelStyler component                    }
{ for Delphi & C++Builder                                                 }
{ version 1.6                                                             }
{                                                                         }
{ written                                                                 }
{   TMS Software                                                          }
{   copyright � 2000-2005                                                 }
{ Email : info@tmssoftware.com                                            }
{ Web : http://www.tmssoftware.com                                        }
{                                                                         }
{ The source code is given as is. The author is not responsible           }
{ for any possible damage done due to the use of this code.               }
{ The component can be freely used in any application. The source         }
{ code remains property of the writer and may not be distributed          }
{ freely as such.                                                         }
{*************************************************************************}

unit advpnlreg;

{$I TMSDEFS.INC}
interface

uses
  AdvPanel, Classes;

{$IFDEF TMSDOTNET}
{$R TAdvPanel.bmp}
{$R TAdvPanelGroup.bmp}
{$R TAdvPanelStyler.bmp}
{$ENDIF}

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TMS', [TAdvPanel, TAdvPanelGroup, TAdvPanelStyler]);
end;

end.

