unit RibbonNotepadDemoOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels, ExtCtrls;

type
  TRibbonDemoStyle = (rdsOffice2007, rdsOffice2010, rdsScenic);

  TScreenTipOptions = record
    ShowScreenTips: Boolean;
    ShowDescripitons: Boolean;
  end;

  { TRibbonDemoOptionsForm }

  TRibbonDemoOptionsForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    gbPanel: TBevel;
    cbColorScheme: TComboBox;
    cbRibbonStyle: TComboBox;
    cbScreenTipStyle: TComboBox;
    lblColorScheme: TLabel;
    lblRibbonStyle: TLabel;
    lblScreenTipStyle: TLabel;
  public
    procedure LoadOptions(const AColorSchemeName: string;
      const AScreenTipOptions: TScreenTipOptions; AStyle: TRibbonDemoStyle);
    procedure SaveOptions(out AColorSchemeName: string;
      out AScreenTipOptions: TScreenTipOptions; out AStyle: TRibbonDemoStyle);
  end;

function ExecuteRibbonDemoOptions(var AColorSchemeName: string;
  var AScreenTipOptions: TScreenTipOptions; var AStyle: TRibbonDemoStyle): Boolean;
implementation

{$R *.dfm}

function ExecuteRibbonDemoOptions(var AColorSchemeName: string;
  var AScreenTipOptions: TScreenTipOptions; var AStyle: TRibbonDemoStyle): Boolean;
begin
  with TRibbonDemoOptionsForm.Create(nil) do
  try
    LoadOptions(AColorSchemeName, AScreenTipOptions, AStyle);
    Result := ShowModal = mrOk;
    if Result then
      SaveOptions(AColorSchemeName, AScreenTipOptions, AStyle);
  finally
    Free;
  end;
end;

{ TRibbonDemoOptionsForm }

procedure TRibbonDemoOptionsForm.LoadOptions(const AColorSchemeName: string;
  const AScreenTipOptions: TScreenTipOptions; AStyle: TRibbonDemoStyle);
begin
  cbRibbonStyle.ItemIndex := Ord(AStyle);
  cbColorScheme.ItemIndex := cbColorScheme.Items.IndexOf(AColorSchemeName);
  if AScreenTipOptions.ShowScreenTips then
    cbScreenTipStyle.ItemIndex := Ord(not AScreenTipOptions.ShowDescripitons)
  else
    cbScreenTipStyle.ItemIndex := 2;
end;

procedure TRibbonDemoOptionsForm.SaveOptions(out AColorSchemeName: string;
  out AScreenTipOptions: TScreenTipOptions; out AStyle: TRibbonDemoStyle);
begin
  AColorSchemeName := cbColorScheme.Text;
  AStyle := TRibbonDemoStyle(cbRibbonStyle.ItemIndex);
  AScreenTipOptions.ShowScreenTips := cbScreenTipStyle.ItemIndex <> 2;
  AScreenTipOptions.ShowDescripitons := cbScreenTipStyle.ItemIndex = 0;
end;

end.
