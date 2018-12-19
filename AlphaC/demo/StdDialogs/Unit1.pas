unit Unit1;
{$I sDefs.inc}

interface

uses
  Windows, StdCtrls, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, sSkinManager, sSkinProvider, Buttons, ComCtrls, imglist, CheckLst,
  sGroupBox, ExtCtrls, sPanel, XPMan;

type
  TForm1 = class(TForm)
    sBitBtn1: TButton;
    sSkinManager1: TsSkinManager;
    FontDialog1: TFontDialog;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    SaveDialog1: TSaveDialog;
    SavePictureDialog1: TSavePictureDialog;
    PrintDialog1: TPrintDialog;
    FindDialog1: TFindDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ReplaceDialog1: TReplaceDialog;
    ColorDialog1: TColorDialog;
    sBitBtn2: TButton;
    sBitBtn3: TButton;
    sBitBtn4: TButton;
    sBitBtn5: TButton;
    sBitBtn6: TButton;
    sBitBtn7: TButton;
    sBitBtn8: TButton;
    sBitBtn9: TButton;
    sBitBtn10: TButton;
    sCheckBox1: TCheckBox;
    sGroupBox1: TGroupBox;
    sBitBtn17: TButton;
    sEdit1: TEdit;
    sBitBtn18: TButton;
    sBitBtn20: TButton;
    GroupBox1: TGroupBox;
    sRadioButton1: TRadioButton;
    sRadioButton2: TRadioButton;
    sRadioButton3: TRadioButton;
    sRadioButton4: TRadioButton;
    sRadioButton5: TRadioButton;
    sRadioGroup1: TRadioGroup;
    Label1: TLabel;
    sSkinProvider1: TsSkinProvider;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure sBitBtn7Click(Sender: TObject);
    procedure sBitBtn8Click(Sender: TObject);
    procedure sBitBtn9Click(Sender: TObject);
    procedure sBitBtn10Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sBitBtn17Click(Sender: TObject);
    procedure sBitBtn20Click(Sender: TObject);
    procedure sBitBtn18Click(Sender: TObject);
    procedure sBitBtn19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses sDialogs;

{$R *.dfm}

procedure TForm1.sBitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then ShowMessage(OpenDialog1.FileName);
end;

procedure TForm1.sBitBtn2Click(Sender: TObject);
begin
  SaveDialog1.Execute;
end;

procedure TForm1.sBitBtn3Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
end;

procedure TForm1.sBitBtn4Click(Sender: TObject);
begin
  SavePictureDialog1.Execute;
end;

procedure TForm1.sBitBtn5Click(Sender: TObject);
begin
  FontDialog1.Execute;
end;

procedure TForm1.sBitBtn6Click(Sender: TObject);
begin
  ColorDialog1.Execute;
end;

procedure TForm1.sBitBtn7Click(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TForm1.sBitBtn8Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TForm1.sBitBtn9Click(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TForm1.sBitBtn10Click(Sender: TObject);
begin
  ReplaceDialog1.Execute;
end;

procedure TForm1.sCheckBox1Click(Sender: TObject);
begin
  sSkinManager1.Active := sCheckBox1.Checked;
end;

procedure TForm1.sBitBtn17Click(Sender: TObject);
begin
  Application.MessageBox(PChar(sEdit1.Text), PChar('Test msg caption'), 0)
end;

procedure TForm1.sBitBtn20Click(Sender: TObject);
var
  DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons;
begin
  Dlgtype := mtWarning;
  if sRadioButton2.Checked then Dlgtype := mtError else
  if sRadioButton3.Checked then Dlgtype := mtInformation else
  if sRadioButton4.Checked then Dlgtype := mtConfirmation else
  if sRadioButton5.Checked then Dlgtype := mtCustom;

  case sRadioGroup1.ItemIndex of
    0 : Buttons := [mbYes];
    1 : Buttons := [mbOk, mbCancel];
    2 : Buttons := [mbAbort, mbRetry, mbIgnore];
    3 : Buttons := [mbYes, mbNo, mbCancel];
    4 : Buttons := [mbYes, mbNo];
    5 : Buttons := [mbRetry, mbCancel];
  end;
  sMessageDlg(sEdit1.Text, DlgType, Buttons, 0);
end;

procedure TForm1.sBitBtn18Click(Sender: TObject);
begin
  sShowMessage(sEdit1.Text);
end;

procedure TForm1.sBitBtn19Click(Sender: TObject);
var
  s : string;
begin
  s := sEdit1.Text;
  InputQuery('Test query caption', 'Please enter new text :', s);
  sEdit1.Text := s;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  sRadioGroup1.ItemIndex := 1;
end;

end.
