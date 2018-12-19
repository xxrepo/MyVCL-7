{**************************************************************************}
{ TAdvDropDown DESIGN TIME EDITOR                                          }
{ for Delphi & C++Builder                                                  }
{                                                                          }
{ written by TMS Software                                                  }
{            copyright � 2009                                              }
{            Email : info@tmssoftware.com                                  }
{            Web : http://www.tmssoftware.com                              }
{                                                                          }
{ The source code is given as is. The author is not responsible            }
{ for any possible damage done due to the use of this code.                }
{ The component can be freely used in any application. The complete        }
{ source code remains property of the author and may not be distributed,   }
{ published, given or sold in any form as such. No parts of the source     }
{ code can be included in any other component or application without       }
{ written authorization of the author.                                     }
{**************************************************************************}

unit AdvDropDownDE;

interface

{$I TMSDEFS.INC}

uses
  Classes, AdvDropDown,
  {$IFDEF DELPHI6_LVL}
  DesignIntf, DesignEditors
  {$ELSE}
  DsgnIntf
  {$ENDIF}
  ;

type
  TAdvDropDownEditor = class(TDefaultEditor)
  public
    function GetVerb(index:integer):string; override;
    function GetVerbCount:integer; override;
    procedure ExecuteVerb(Index:integer); override;
  end;


implementation

uses
  SysUtils, Forms, AdvDropDownStyles, Dialogs, Controls, AdvStyleIF;

procedure TAdvDropDownEditor.ExecuteVerb(Index: integer);
var
  psf: TAdvDropDownStyleForm;
  style: TTMSStyle;
begin
  inherited;

  if (Index = 0) then
  begin
    if (Component is TAdvCustomDropDown) then
    begin
      style := (Component as TAdvCustomDropDown).GetComponentStyle;

      psf := TAdvDropDownStyleForm.Create(Application);
      case style of
        tsOffice2003Blue: psf.RadioGroup1.ItemIndex := 0;
        tsOffice2003Silver: psf.RadioGroup1.ItemIndex := 2;
        tsOffice2003Olive: psf.RadioGroup1.ItemIndex := 1;
        tsOffice2003Classic: psf.RadioGroup1.ItemIndex := 3;
        tsOffice2007Luna: psf.RadioGroup1.ItemIndex := 4;
        tsOffice2007Obsidian: psf.RadioGroup1.ItemIndex := 5;
        tsWindowsXP: psf.RadioGroup1.ItemIndex := 7;
        tsWhidbey: psf.RadioGroup1.ItemIndex := 0;
        tsCustom: psf.RadioGroup1.ItemIndex := 0;
        tsOffice2007Silver: psf.RadioGroup1.ItemIndex := 6;
        tsWindowsVista: psf.RadioGroup1.ItemIndex := 8;
        tsWindows7: psf.RadioGroup1.ItemIndex := 9;
        tsTerminal: psf.RadioGroup1.ItemIndex := 10;
      end;

    if psf.ShowModal = mrOK then
    begin
      case psf.RadioGroup1.ItemIndex of
      1: style := tsOffice2003Olive;
      2: style := tsOffice2003Silver;
      3: style := tsOffice2003Classic;
      4: style := tsOffice2007Luna;
      5: style := tsOffice2007Obsidian;
      6: style := tsOffice2007Silver;
      7: style := tsWindowsXP;
      8: style := tsWindowsVista;
      9: style := tsWindows7;
      10: style := tsTerminal;
      end;
         (Component as TAdvCustomDropDown).SetComponentStyle(style);
         Designer.Modified;
    end;

    psf.Free;
    end;
  end;
end;

function TAdvDropDownEditor.GetVerb(index: integer): string;
begin
  if index = 0 then
    Result := 'Styles';
end;

function TAdvDropDownEditor.GetVerbCount: integer;
begin
  Result := 1;
end;



end.







