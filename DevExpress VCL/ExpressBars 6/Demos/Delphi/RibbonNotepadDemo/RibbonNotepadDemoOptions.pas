unit RibbonNotepadDemoOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  TScreenTipOptions = record
    ShowScreenTips: Boolean;
    ShowDescripitons: Boolean;
  end;

  TRibbonDemoOptionsForm = class(TForm)
    cbColorScheme: TComboBox;
    cbScreenTipStyle: TComboBox;
    lblColorScheme: TLabel;
    lblScreenTipStyle: TLabel;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    function GetOptions(var AColorSchemeName: string; var AScreenTipOptions: TScreenTipOptions): Boolean;
  end;

var
  RibbonDemoOptionsForm: TRibbonDemoOptionsForm;

implementation

{$R *.dfm}

function TRibbonDemoOptionsForm.GetOptions(var AColorSchemeName: string; var AScreenTipOptions: TScreenTipOptions): Boolean;
begin
  cbColorScheme.ItemIndex := cbColorScheme.Items.IndexOf(AColorSchemeName);
  if AScreenTipOptions.ShowScreenTips then
    if AScreenTipOptions.ShowDescripitons then
      cbScreenTipStyle.ItemIndex := 0
    else
      cbScreenTipStyle.ItemIndex := 1
  else
    cbScreenTipStyle.ItemIndex := 2;

  Result := ShowModal = mrOk;

  if Result then
  begin
    AColorSchemeName := cbColorScheme.Text;
    AScreenTipOptions.ShowScreenTips := cbScreenTipStyle.ItemIndex <> 2;
    AScreenTipOptions.ShowDescripitons := cbScreenTipStyle.ItemIndex = 0;
  end;
end;

end.
