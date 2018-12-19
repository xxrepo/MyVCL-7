unit DemoBasicMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeels, StdCtrls, Menus, cxCustomPivotGrid, cxExportPivotGridLink;

type
  TfrmDemoBaisicMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExport: TMenuItem;
    miExportToExcel: TMenuItem;
    miExportToText: TMenuItem;
    miExportToHtml: TMenuItem;
    miExportToXml: TMenuItem;
    Separator1: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miLookFeel: TMenuItem;
    Kind1: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miOffice11: TMenuItem;
    miNativeStyle: TMenuItem;
    miAbout: TMenuItem;
    SaveDialog: TSaveDialog;
    lbDescrip: TLabel;
    lfController: TcxLookAndFeelController;
    miTotalsPosition: TMenuItem;
    miTotalsLocationFar: TMenuItem;
    miTotalsLocationNear: TMenuItem;
    miShowTotalsForSingleValues: TMenuItem;
    miShowRowTotals: TMenuItem;
    miShowColumnTotals: TMenuItem;
    miShowColumnGrandTotals: TMenuItem;
    miShowRowGrandTotals: TMenuItem;
    miTotalsVisibility: TMenuItem;
    miShowGrandTotalsForSingleValues: TMenuItem;
    N2: TMenuItem;
    miElementsVisibility: TMenuItem;
    miShowFilterFields: TMenuItem;
    miShowColumnFields: TMenuItem;
    miShowDataFields: TMenuItem;
    miShowRowFields: TMenuItem;
    miShowFilterSeparator: TMenuItem;
    N1: TMenuItem;
    procedure miExportToClick(Sender: TObject);
    procedure miTotalsLocationClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miTotalsVisibilityClick(Sender: TObject);
    procedure miElementsVisibilityClick(Sender: TObject);
    procedure miLookAndFeelClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetPivotGrid: TcxCustomPivotGrid; virtual;
    procedure SyncElementsVisibilityWithMenu;
    procedure SyncTotalVisibilityWithMenu;
    procedure SyncMenuWithElementsVisibility;
    procedure SyncMenuWithTotalVisibility;
  public
    constructor Create(AOwner: TComponent); override;

    property PivotGrid: TcxCustomPivotGrid read GetPivotGrid;
  end;

implementation

uses
  AboutDemoForm;

{$R *.dfm}

constructor TfrmDemoBaisicMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Application.Title := Caption;
  PivotGrid.ApplyBestFit;
  SyncMenuWithTotalVisibility;
  SyncMenuWithElementsVisibility;
end;

function TfrmDemoBaisicMain.GetPivotGrid: TcxCustomPivotGrid;
begin
  Result := nil;
end;

procedure TfrmDemoBaisicMain.SyncElementsVisibilityWithMenu;
begin
  with PivotGrid.OptionsView do
  begin
    ColumnFields := miShowColumnFields.Checked;
    DataFields := miShowDataFields.Checked;
    FilterFields := miShowFilterFields.Checked;
    FilterSeparator := miShowFilterSeparator.Checked;
    RowFields := miShowRowFields.Checked;
  end;
end;

procedure TfrmDemoBaisicMain.SyncTotalVisibilityWithMenu;
begin
  with PivotGrid.OptionsView do
  begin
    ColumnTotals := miShowColumnTotals.Checked;
    RowTotals := miShowRowTotals.Checked;
    ColumnGrandTotals := miShowColumnGrandTotals.Checked;
    RowGrandTotals := miShowRowGrandTotals.Checked;
    TotalsForSingleValues := miShowTotalsForSingleValues.Checked;
    GrandTotalsForSingleValues := miShowGrandTotalsForSingleValues.Checked;
  end;
end;

procedure TfrmDemoBaisicMain.SyncMenuWithElementsVisibility;
begin
  with PivotGrid.OptionsView do
  begin
    miShowColumnFields.Checked := ColumnFields;
    miShowDataFields.Checked := DataFields;
    miShowFilterFields.Checked := FilterFields;
    miShowFilterSeparator.Checked := FilterSeparator;
    miShowRowFields.Checked := RowFields;
  end;
end;

procedure TfrmDemoBaisicMain.SyncMenuWithTotalVisibility;
begin
  with PivotGrid.OptionsView do
  begin
    miShowColumnTotals.Checked := ColumnTotals;
    miShowRowTotals.Checked := RowTotals;
    miShowColumnGrandTotals.Checked := ColumnGrandTotals;
    miShowRowGrandTotals.Checked := RowGrandTotals;
    miShowTotalsForSingleValues.Checked := TotalsForSingleValues;
    miShowGrandTotalsForSingleValues.Checked := GrandTotalsForSingleValues;
  end;
end;

procedure TfrmDemoBaisicMain.miExportToClick(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    case TMenuItem(Sender).Tag of
      1:
        cxExportPivotGridToExcel(SaveDialog.FileName, PivotGrid);
      2:
        cxExportPivotGridToText(SaveDialog.FileName, PivotGrid);
      3:
        cxExportPivotGridToHTML(SaveDialog.FileName, PivotGrid);
      4:
        cxExportPivotGridToXML(SaveDialog.FileName, PivotGrid);
    end;
  end;
end;

procedure TfrmDemoBaisicMain.miTotalsLocationClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True; 
  PivotGrid.OptionsView.TotalsLocation := TcxPivotGridTotalsLocation(TMenuItem(Sender).Tag);
  miTotalsLocationFar.Checked := PivotGrid.OptionsView.TotalsLocation = tlFar;
  miTotalsLocationNear.Checked := PivotGrid.OptionsView.TotalsLocation = tlNear;
end;

procedure TfrmDemoBaisicMain.miExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmDemoBaisicMain.miTotalsVisibilityClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  SyncTotalVisibilityWithMenu;
end;

procedure TfrmDemoBaisicMain.miElementsVisibilityClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  SyncElementsVisibilityWithMenu;
end;

procedure TfrmDemoBaisicMain.miLookAndFeelClick(Sender: TObject);
begin
  if TMenuItem(Sender).Tag > 3 then
    lfController.NativeStyle := not lfController.NativeStyle
  else
  begin
    TMenuItem(Sender).Checked := True;
    lfController.NativeStyle := False; 
    lfController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).Tag);
  end;
  miNativeStyle.Checked := lfController.NativeStyle;
end;

procedure TfrmDemoBaisicMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

end.
