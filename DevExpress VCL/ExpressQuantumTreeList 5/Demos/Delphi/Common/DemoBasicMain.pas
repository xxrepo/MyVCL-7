unit DemoBasicMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookAndFeels, ActnList, ImgList, Menus, ComCtrls,
  StdCtrls, cxTL, cxTLExportLink;

type
  TDemoBasicMainForm = class(TForm)
    ilMain: TImageList;
    alMain: TActionList;
    actHelp: TAction;
    actProducts: TAction;
    actDownloads: TAction;
    actForum: TAction;
    actDXOnTheWeb: TAction;
    actAbout: TAction;
    actExit: TAction;
    sbMain: TStatusBar;
    lscrip: TLabel;
    actShowDemoDescription: TAction;
    cxLookAndFeelController: TcxLookAndFeelController;
    actRateDemo: TAction;
    actSupport: TAction;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miSeparator2: TMenuItem;
    miShowDemoDescription: TMenuItem;
    miHelp: TMenuItem;
    miGridHelp: TMenuItem;
    miRate: TMenuItem;
    miSeparator3: TMenuItem;
    miDeveloperExpressontheweb: TMenuItem;
    miProducts: TMenuItem;
    miDownloads: TMenuItem;
    miSupport: TMenuItem;
    miForum: TMenuItem;
    miSeparator4: TMenuItem;
    miAbout: TMenuItem;
    Exportto1: TMenuItem;
    excel1: TMenuItem;
    html1: TMenuItem;
    text1: TMenuItem;
    xml1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure actDXOnTheWebExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actShowDemoDescriptionExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actRateDemoExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure ExportToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetTreeList: TcxCustomTreeList;
  protected
    procedure AddLookAndFeelMenu; virtual;
    function GetDefaultLookAndFeelKind: TcxLookAndFeelKind; virtual;
    function IsNativeDefaultStyle: Boolean; virtual;
    procedure SetDefaultLookAndFeel; virtual;
  end;

var
  DemoBasicMainForm: TDemoBasicMainForm;

implementation

uses
  AboutDemoForm, DemoRating, DemoUtils;

{$R *.dfm}

procedure TDemoBasicMainForm.actDXOnTheWebExecute(
  Sender: TObject);
begin
  ShowWebPage(TdxWebPageType(TComponent(Sender).Tag));
end;

procedure TDemoBasicMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TDemoBasicMainForm.actShowDemoDescriptionExecute(
  Sender: TObject);
begin
  lscrip.Visible := not lscrip.Visible;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
end;

procedure TDemoBasicMainForm.actHelpExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TDemoBasicMainForm.actRateDemoExecute(Sender: TObject);
begin
  with TDemoRatingForm.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TDemoBasicMainForm.actAboutExecute(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TDemoBasicMainForm.ExportToClick(Sender: TObject);
var
  ATreeList: TcxCustomTreeList;
begin
  ATreeList := GetTreeList;
  if (ATreeList <> nil) and SaveDialog1.Execute then
    case TMenuItem(Sender).Tag of
      0:
        cxExportTLToExcel(SaveDialog1.FileName, ATreeList);
      1:
        cxExportTLToText(SaveDialog1.FileName, ATreeList);
      2:
        cxExportTLToHTML(SaveDialog1.FileName, ATreeList);
      3:
        cxExportTLToXML(SaveDialog1.FileName, ATreeList);
    end;
end;

procedure TDemoBasicMainForm.AddLookAndFeelMenu;
begin
  miOptions.Insert(miOptions.IndexOf(miSeparator2), CreateLookAndFeelMenuItems(miOptions, cxLookAndFeelController));
end;

function TDemoBasicMainForm.GetDefaultLookAndFeelKind: TcxLookAndFeelKind;
begin
  Result := lfUltraFlat;
end;

function TDemoBasicMainForm.IsNativeDefaultStyle: Boolean;
begin
  Result := True;
end;

procedure TDemoBasicMainForm.SetDefaultLookAndFeel;
begin
  cxLookAndFeelController.NativeStyle := IsNativeDefaultStyle;
  cxLookAndFeelController.Kind := GetDefaultLookAndFeelKind;
end;

function TDemoBasicMainForm.GetTreeList: TcxCustomTreeList;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ControlCount - 1 do
    if Controls[I] is TcxCustomTreeList then
    begin
      Result := TcxCustomTreeList(Controls[I]);
      Break;
    end;
end;

procedure TDemoBasicMainForm.FormCreate(Sender: TObject);
begin
  SetDefaultLookAndFeel;
  AddLookAndFeelMenu;
end;

end.

