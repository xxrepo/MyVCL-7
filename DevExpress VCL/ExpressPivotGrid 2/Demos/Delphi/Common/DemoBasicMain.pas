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
    miAbout: TMenuItem;
    SaveDialog: TSaveDialog;
    lbDescrip: TLabel;
    lfController: TcxLookAndFeelController;
    miTotalsPosition: TMenuItem;
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
    miColumnTotalsPosition: TMenuItem;
    miRowTotalsPosition: TMenuItem;
    miColumnTotalsPositionFar: TMenuItem;
    miColumnTotalsPositionNear: TMenuItem;
    miRowTotalsPositionFar: TMenuItem;
    miRowTotalsPositionNear: TMenuItem;
    miSelection: TMenuItem;
    miMultiSelect: TMenuItem;
    miHideFocusRect: TMenuItem;
    miHideSelection: TMenuItem;
    miIncludeCells: TMenuItem;
    miCrossCells: TMenuItem;
    miGrandTotalsCells: TMenuItem;
    miTotalsCells: TMenuItem;
    procedure miExportToClick(Sender: TObject);
    procedure miTotalsLocationClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miTotalsVisibilityClick(Sender: TObject);
    procedure miElementsVisibilityClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure miHideFocusRectClick(Sender: TObject);
    procedure miHideSelectionClick(Sender: TObject);
    procedure IncludeCellsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure AddLookAndFeelMenu; virtual;
    function GetDefaultLookAndFeelKind: TcxLookAndFeelKind; virtual;
    function GetPivotGrid: TcxCustomPivotGrid; virtual;
    function IsNativeDefaultStyle: Boolean; virtual;
    procedure SetDefaultLookAndFeel; virtual;
    procedure SyncElementsVisibilityWithMenu;
    procedure SyncTotalVisibilityWithMenu;
    procedure SyncMenuWithElementsVisibility;
    procedure SyncMenuWithOptionsSelection;
    procedure SyncMenuWithTotalVisibility;
  public
    constructor Create(AOwner: TComponent); override;

    property PivotGrid: TcxCustomPivotGrid read GetPivotGrid;
  end;

implementation

uses
  AboutDemoForm, DemoUtils;

{$R *.dfm}

constructor TfrmDemoBaisicMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Application.Title := Caption;
  PivotGrid.ApplyBestFit;
  SyncMenuWithTotalVisibility;
  SyncMenuWithElementsVisibility;
  SyncMenuWithOptionsSelection;
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

procedure TfrmDemoBaisicMain.SyncMenuWithOptionsSelection;
begin
  with PivotGrid.OptionsSelection do
  begin
    miMultiSelect.Checked := MultiSelect;
    miCrossCells.Checked := osiCrossCells in IncludeCells;
    miGrandTotalsCells.Checked := osiGrandTotalCells in IncludeCells;
    miTotalsCells.Checked := osiTotalCells in IncludeCells;
    miHideFocusRect.Checked := HideFocusRect;
    miHideSelection.Checked := HideSelection;
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
  case TMenuItem(Sender).Tag of
    0, 1:
      PivotGrid.OptionsView.ColumnTotalsLocation := TcxPivotGridTotalsLocation(TMenuItem(Sender).Tag);
    2, 3:
      PivotGrid.OptionsView.RowTotalsLocation := TcxPivotGridTotalsLocation(TMenuItem(Sender).Tag - 2);
  end;
  miColumnTotalsPositionFar.Checked := PivotGrid.OptionsView.ColumnTotalsLocation = tlFar;
  miColumnTotalsPositionNear.Checked := PivotGrid.OptionsView.ColumnTotalsLocation = tlNear;
  miRowTotalsPositionFar.Checked := PivotGrid.OptionsView.RowTotalsLocation = tlFar;
  miRowTotalsPositionNear.Checked := PivotGrid.OptionsView.RowTotalsLocation = tlNear;
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

procedure TfrmDemoBaisicMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmDemoBaisicMain.miMultiSelectClick(Sender: TObject);
begin
  PivotGrid.OptionsSelection.MultiSelect := not PivotGrid.OptionsSelection.MultiSelect;
  TMenuItem(Sender).Checked := PivotGrid.OptionsSelection.MultiSelect;
end;

procedure TfrmDemoBaisicMain.miHideFocusRectClick(Sender: TObject);
begin
  PivotGrid.OptionsSelection.HideFocusRect := not PivotGrid.OptionsSelection.HideFocusRect;
  TMenuItem(Sender).Checked := PivotGrid.OptionsSelection.HideFocusRect;
end;

procedure TfrmDemoBaisicMain.miHideSelectionClick(Sender: TObject);
begin
  PivotGrid.OptionsSelection.HideSelection := not PivotGrid.OptionsSelection.HideSelection;
  TMenuItem(Sender).Checked := PivotGrid.OptionsSelection.HideSelection;
end;

procedure TfrmDemoBaisicMain.IncludeCellsClick(Sender: TObject);
var
  AIncludeCells: TcxPivotGridOptionsSelectionIncludes;
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  AIncludeCells := [];
  if miCrossCells.Checked then
    AIncludeCells := AIncludeCells + [osiCrossCells];
  if miGrandTotalsCells.Checked then
    AIncludeCells := AIncludeCells + [osiGrandTotalCells];
  if miTotalsCells.Checked then
    AIncludeCells := AIncludeCells + [osiTotalCells];
  PivotGrid.OptionsSelection.IncludeCells := AIncludeCells;
end;

procedure TfrmDemoBaisicMain.FormCreate(Sender: TObject);
begin
  SetDefaultLookAndFeel;
  AddLookAndFeelMenu;
end;

procedure TfrmDemoBaisicMain.AddLookAndFeelMenu;
begin
  mmMain.Items.Insert(mmMain.Items.IndexOf(miAbout), CreateLookAndFeelMenuItems(mmMain.Items, lfController));
end;

function TfrmDemoBaisicMain.GetDefaultLookAndFeelKind: TcxLookAndFeelKind;
begin
  Result := lfOffice11;
end;

function TfrmDemoBaisicMain.IsNativeDefaultStyle: Boolean;
begin
  Result := False;
end;

procedure TfrmDemoBaisicMain.SetDefaultLookAndFeel;
begin
  lfController.NativeStyle := IsNativeDefaultStyle;
  lfController.Kind := GetDefaultLookAndFeelKind;
end;

end.
