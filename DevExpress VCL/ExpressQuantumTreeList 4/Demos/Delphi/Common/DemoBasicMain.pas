unit DemoBasicMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils{$IFDEF DELPHI6}, Variants{$ENDIF}, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookAndFeels, ActnList, ImgList, Menus, ComCtrls,
  StdCtrls;

type
  TDemoBasicMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miHelp: TMenuItem;
    miDeveloperExpressontheweb: TMenuItem;
    miForum: TMenuItem;
    miDownloads: TMenuItem;
    miSeparator4: TMenuItem;
    miGridHelp: TMenuItem;
    miProducts: TMenuItem;
    miSeparator3: TMenuItem;
    ilMain: TImageList;
    alMain: TActionList;
    actHelp: TAction;
    actProducts: TAction;
    actDownloads: TAction;
    actForum: TAction;
    actDXOnTheWeb: TAction;
    actAbout: TAction;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    actExit: TAction;
    sbMain: TStatusBar;
    lscrip: TLabel;
    actShowDemoDescription: TAction;
    miShowDemoDescription: TMenuItem;
    cxLookAndFeelController: TcxLookAndFeelController;
    miRate: TMenuItem;
    actRateDemo: TAction;
    memAboutText: TMemo;
    actSupport: TAction;
    miSupport: TMenuItem;
    procedure actProductsExecute(Sender: TObject);
    procedure actDownloadsExecute(Sender: TObject);
    procedure actForumExecute(Sender: TObject);
    procedure actDXOnTheWebExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actShowDemoDescriptionExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actRateDemoExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actSupportExecute(Sender: TObject);
  protected
    procedure AdjustAboutText(AAboutText: TStrings); virtual;
    procedure ShowAbout(AModal, AOnTop: Boolean); virtual;
  end;

var
  DemoBasicMainForm: TDemoBasicMainForm;

implementation

uses DemoBasicAbout, ShellAPI, DemoRating;

{$R *.dfm}

procedure TDemoBasicMainForm.actProductsExecute(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com/products'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TDemoBasicMainForm.actDownloadsExecute(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com/downloads'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TDemoBasicMainForm.actForumExecute(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('https://www.devexpress.com/ClientCenter'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TDemoBasicMainForm.actDXOnTheWebExecute(
  Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), nil, nil, SW_SHOWMAXIMIZED);
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

procedure TDemoBasicMainForm.AdjustAboutText(AAboutText: TStrings);
begin
  AAboutText.Assign(memAboutText.Lines);
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

procedure TDemoBasicMainForm.ShowAbout(AModal, AOnTop: Boolean);
begin
  if not Assigned(DemoBasicAboutForm) then
    DemoBasicAboutForm := TDemoBasicAboutForm.Create(Application);
  with DemoBasicAboutForm do
  begin
    AdjustAboutText(reDemoInfo.Lines);
    lmoName.Caption := ChangeFileExt(ExtractFileName(Application.ExeName),'');
    if AOnTop then
      FormStyle := fsStayOnTop
    else
      FormStyle := fsNormal;
    if AModal then
      ShowModal
    else
      Show;
  end;
end;

procedure TDemoBasicMainForm.actAboutExecute(Sender: TObject);
begin
  ShowAbout(True, False);
end;

procedure TDemoBasicMainForm.actSupportExecute(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com/Support/Center'), nil, nil, SW_SHOWMAXIMIZED);
end;

end.

