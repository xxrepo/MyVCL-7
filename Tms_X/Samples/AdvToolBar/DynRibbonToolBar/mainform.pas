{*************************************************************************}
{ TMS ToolBars component demo                                             }
{ for Delphi & C++Builder                                                 }
{                                                                         }
{ written by TMS Software                                                 }
{           copyright © 2011                                              }
{           Email : info@tmssoftware.com                                  }
{           Web : http://www.tmssoftware.com                              }
{                                                                         }
{ The source code is given as is. The author is not responsible           }
{ for any possible damage done due to the use of this code.               }
{ The component can be freely used in any application. The complete       }
{ source code remains property of the author and may not be distributed,  }
{ published, given or sold in any form as such. No parts of the source    }
{ code can be included in any other component or application without      }
{ written authorization of the author.                                    }
{*************************************************************************}
unit mainform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvToolBar, StdActns, ActnList, AdvGlowButton,
  ImgList, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvToolBarStylers, AdvGDIP,
  uToolBarFrame, uRibbonFrame;

type
  TForm5 = class(TAdvToolBarForm)
    ribbonframe: Tribbonframe;
    toolbarframe: TToolBarFrame;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Memo1: TMemo;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    Action1: TAction;
    Action2: TAction;
    AdvOfficeStatusBar1: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}


procedure TForm5.Action1Execute(Sender: TObject);
begin
  SwitchFromDockPanelToRibbon(toolbarframe.AdvDockPanel1, ribbonframe.AdvToolBarPager1);
end;

procedure TForm5.Action2Execute(Sender: TObject);
begin
  SwitchFromRibbonToDockPanel(ribbonframe.AdvToolBarPager1, toolbarframe.AdvDockPanel1);
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  InitDockPanelAndRibbon(toolbarframe.AdvDockPanel1, ribbonframe.AdvToolBarPager1);
  Memo1.Align := alClient;
end;

end.
