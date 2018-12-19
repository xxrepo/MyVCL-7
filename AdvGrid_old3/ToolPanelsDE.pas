{***********************************************************************}
{ TToolPanels component                                                 }
{ for Delphi & C++Builder                                               }
{ version 1.0                                                           }
{                                                                       }
{ written by TMS Software                                               }
{            copyright © 2003                                           }
{            Email: info@tmssoftware.com                                }
{            Web: http://www.tmssoftware.com                            }
{                                                                       }
{ The source code is given as is. The author is not responsible         }
{ for any possible damage done due to the use of this code.             }
{ The component can be freely used in any application. The complete     }
{ source code remains property of the author and may not be distributed,}
{ published, given or sold in any form as such. No parts of the source  }
{ code can be included in any other component or application without    }
{ written authorization of the author.                                  }
{***********************************************************************}

unit ToolPanelsDE;

interface

{$I TMSDEFS.INC}
uses
  Classes, ToolPanels, Windows, Forms, TypInfo, Dialogs, ExtCtrls, Controls
{$IFDEF DELPHI6_LVL}
  , DesignIntf, DesignEditors, ContNrs
{$ELSE}
  , DsgnIntf
{$ENDIF}
  ;

type
  TAdvToolPanelTabEditor = class(TDefaultEditor)
  protected
  public
    function GetVerb(Index: Integer):string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

  TAdvToolPanelEditor = class(TDefaultEditor)
  protected
  public
    function GetVerb(Index: Integer):string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

implementation

{ TToolPanelTabEditor }

procedure TAdvToolPanelTabEditor.ExecuteVerb(Index: integer);
begin
  inherited;
  case Index of
  0:
    begin
      TCustomPanel(Component).ControlStyle := TCustomPanel(Component).ControlStyle + [csAcceptsControls];
      Designer.CreateComponent(TAdvToolPanel,Component,23,0,100,100);

      with TAdvToolPanelTab(Component) do
        UpdatePanels(ControlCount - 1);

      (Component as TCustomPanel).Invalidate;
      TCustomPanel(Component).ControlStyle := TCustomPanel(Component).ControlStyle - [csAcceptsControls];
    end;
  1: TAdvToolPanelTab(Component).PrevPanel;
  2: TAdvToolPanelTab(Component).NextPanel;
  end;
end;

function TAdvToolPanelTabEditor.GetVerb(Index: Integer): string;
begin
  case Index of
  0: Result := 'New panel';
  1: Result := 'Previous panel';
  2: Result := 'Next panel';
  end;
end;

function TAdvToolPanelTabEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

{ TToolPanelEditor }

procedure TAdvToolPanelEditor.ExecuteVerb(Index: integer);
begin
  inherited;
  case Index of
  0:
    begin

      TCustomPanel(Component).Parent.ControlStyle := TCustomPanel(Component).Parent.ControlStyle + [csAcceptsControls];
      Designer.CreateComponent(TAdvToolPanel,TCustomPanel(Component).Parent,23,0,100,100);

      with TAdvToolPanelTab(TCustomPanel(Component).Parent) do
        UpdatePanels(ControlCount - 1);

      (TCustomPanel(Component).Parent as TCustomPanel).Invalidate;
      TCustomPanel(Component).Parent.ControlStyle := TCustomPanel(Component).Parent.ControlStyle - [csAcceptsControls];
    end;
  1: TAdvToolPanelTab(TCustomPanel(Component).Parent).PrevPanel;
  2: TAdvToolPanelTab(TCustomPanel(Component).Parent).NextPanel;
  end;
end;

function TAdvToolPanelEditor.GetVerb(Index: Integer): string;
begin
  case Index of
  0: Result := 'New panel';
  1: Result := 'Previous panel';
  2: Result := 'Next panel';
  end;
end;

function TAdvToolPanelEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;



end.
