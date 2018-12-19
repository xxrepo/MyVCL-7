unit SummariesDemoEditSummary;

interface

{$I ..\cxVer.inc}

uses
  Windows, Messages, SysUtils
  {$IFDEF DELPHI6}
  , Variants
  {$ENDIF}
  , Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCustomData, cxCalendar, ExtCtrls, cxCheckBox,
  cxButtons, cxImageComboBox, DB, cxLookAndFeelPainters, cxListBox, cxDBTL,
  cxGraphics, Menus;

type
  TSummariesDemoEditSummaryForm = class(TForm)
    Panel2: TPanel;
    gbSummaries: TGroupBox;
    Panel4: TPanel;
    lbColumns: TcxListBox;
    gbSummaryFooter: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    cbCalculatedField: TcxComboBox;
    cbSummaryKind: TcxImageComboBox;
    Panel1: TPanel;
    btnExit: TcxButton;
    procedure cbCalculatedFieldPropertiesChange(Sender: TObject);
    procedure lbColumnsClick(Sender: TObject);
    procedure cbSummaryKindPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
    FLockColumnSummary: Boolean;
    FTreeList: TcxDBTreeList;
    procedure PopulateVisibleColumnsList;
    procedure PopulateFieldList(ADataSet: TDataSet);
    procedure UpdateCalcField(AColumn: TcxDBTreeListColumn);
    procedure UpdateSummaryKinds(AKind: TcxSummaryKind; AField: TField = nil);
    procedure SetTreeList(const Value: TcxDBTreeList);
  public
    property TreeList: TcxDBTreeList read FTreeList write SetTreeList;
  end;

var
  SummariesDemoEditSummaryForm: TSummariesDemoEditSummaryForm;

implementation

uses SummariesDemoMain, SummariesDemoData, cxDBLookupComboBox;

{$R *.dfm}
procedure TSummariesDemoEditSummaryForm.cbCalculatedFieldPropertiesChange(
  Sender: TObject);
var
  AColumn: TcxDBTreeListColumn;
  AField: TField;
begin
  if FLockColumnSummary then Exit;
  if cbCalculatedField.ItemIndex <> -1 then
  begin
    AField :=
      TField(cbCalculatedField.Properties.Items.Objects[cbCalculatedField.ItemIndex]);
    AColumn :=
      TcxDBTreeListColumn(lbColumns.Items.Objects[lbColumns.ItemIndex]);
    AColumn.SummaryFooter.FieldName := AField.FieldName;
    UpdateSummaryKinds(skNone, AField);
    cbSummaryKindPropertiesChange(nil);
  end;
end;

procedure TSummariesDemoEditSummaryForm.cbSummaryKindPropertiesChange(
  Sender: TObject);
var
  AColumn: TcxDBTreeListColumn;
begin
  if FLockColumnSummary then Exit;
  if (cbSummaryKind.ItemIndex <> -1) and (lbColumns.ItemIndex <> -1) then
  begin
    AColumn :=
      TcxDBTreeListColumn(lbColumns.Items.Objects[lbColumns.ItemIndex]);
    AColumn.SummaryFooter.Kind := TcxSummaryKind(cbSummaryKind.EditValue);
    AColumn.Options.Footer := TcxSummaryKind(cbSummaryKind.EditValue) <> skNone;
  end;
end;

procedure TSummariesDemoEditSummaryForm.lbColumnsClick(Sender: TObject);
var
  AColumn: TcxDBTreeListColumn;
  ADataSet: TDataSet;
  AField: TField;
  AKind: TcxSummaryKind;
begin
  AColumn :=
    TcxDBTreeListColumn(lbColumns.Items.Objects[lbColumns.ItemIndex]);
  UpdateCalcField(AColumn);
  ADataSet := FTreeList.DataController.DataSet;
  AField := ADataSet.FindField(AColumn.SummaryFooter.FieldName);
  if not Assigned(AField) then
    AField := AColumn.DataBinding.Field;
  AKind := AColumn.SummaryFooter.Kind;
  UpdateSummaryKinds(AKind, AField);
end;

procedure TSummariesDemoEditSummaryForm.UpdateCalcField(
  AColumn: TcxDBTreeListColumn);
var
  AIndex: Integer;
  AFieldName: string;
begin
  if AColumn.SummaryFooter.FieldName <> '' then
    AFieldName := AColumn.SummaryFooter.FieldName
  else
    AFieldName := AColumn.DataBinding.FieldName;
  FLockColumnSummary := True;
  try
    AIndex :=
      cbCalculatedField.Properties.Items.IndexOf(AFieldName);
    cbCalculatedField.ItemIndex := AIndex;
  finally
    FLockColumnSummary := False;
  end;
end;

procedure TSummariesDemoEditSummaryForm.UpdateSummaryKinds(AKind: TcxSummaryKind;
  AField: TField = nil);
const
  ImgIndNone = -1;
  ImgIndCnt = 4;
  ImgIndMAX = 5;
  ImgIndMIN = 6;
  ImgIndSUM = 7;
  ImgIndAVG = 8;

  procedure AddSummaryKind(AKind: TcxSummaryKind);
  var
    AItem: TcxImageComboboxItem;
    procedure SetItemProperties(ADescription: string; AImageIndex: Integer;
      AValue: Integer);
    begin
      AItem.Description := ADescription;
      AItem.ImageIndex := AImageIndex;
      AItem.Value := AValue;
    end;
  begin
    AItem := TcxImageComboboxItem(cbSummaryKind.Properties.Items.Add);
    case AKind of
      skNone:
        SetItemProperties('None', ImgIndNone, 0);
      skSum:
        SetItemProperties('Sum', ImgIndSUM, 1);
      skMin:
        SetItemProperties('Min', ImgIndMIN, 2);
      skMax:
        SetItemProperties('Max', ImgIndMAX, 3);
      skCount:
        SetItemProperties('Count', ImgIndCNT, 4);
      skAverage:
        SetItemProperties('Average', ImgIndAVG, 5);
    end;
  end;
const
  NumberFieldTypes =
  [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftDate, ftTime,
      ftDateTime, ftAutoInc];
  TimeFieldTypes = [ftDate, ftTime, ftDateTime];
begin
  FLockColumnSummary := True;
  try
    cbSummaryKind.Properties.Items.Clear;
    if Assigned(AField) then
    begin
      AddSummaryKind(skNone);
      AddSummaryKind(skCount);
      if AField.DataType in NumberFieldTypes then
      begin
        AddSummaryKind(skMax);
        AddSummaryKind(skMin);
        if not (AField.DataType in TimeFieldTypes) then
        begin
          AddSummaryKind(skSum);
          AddSummaryKind(skAverage);
        end;
      end;
    end;
    cbSummaryKind.EditValue := AKind;
  finally
    FLockColumnSummary := False;
  end;
end;

procedure TSummariesDemoEditSummaryForm.PopulateVisibleColumnsList;
var
  I: Integer;
begin
  lbColumns.Items.Clear;
  for I := 0 to FTreeList.VisibleColumnCount - 1 do
  begin
    lbColumns.Items.
      AddObject(FTreeList.VisibleColumns[I].Caption.Text,
      FTreeList.VisibleColumns[I]);
  end;
  if lbColumns.Count > 0 then
    lbColumns.ItemIndex := 0;
end;

procedure TSummariesDemoEditSummaryForm.SetTreeList(
  const Value: TcxDBTreeList);
begin
  FTreeList := Value;
  PopulateFieldList(FTreeList.DataController.DataSet);
  PopulateVisibleColumnsList;
  lbColumnsClick(lbColumns);
end;

procedure TSummariesDemoEditSummaryForm.PopulateFieldList(ADataSet: TDataSet);
begin
  ADataSet.GetFieldNames(cbCalculatedField.Properties.Items);
end;

procedure TSummariesDemoEditSummaryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSummariesDemoEditSummaryForm.FormDestroy(Sender: TObject);
begin
  SummariesDemoEditSummaryForm := nil;
end;

procedure TSummariesDemoEditSummaryForm.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
