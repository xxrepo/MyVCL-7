unit SummariesDemoMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF DELPHI6}Variants, {$ENDIF}Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookAndFeels, ActnList, ImgList, Menus, ComCtrls,
  StdCtrls, DemoBasicMain, cxContainer, cxEdit, cxTextEdit, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCalendar,
  cxCurrencyEdit, cxDBLookupComboBox, cxDBEditRepository,
  cxEditRepositoryItems, cxImage, cxMemo,
  cxLookAndFeelPainters, cxButtons, cxDropDownEdit, cxTimeEdit,
  cxImageComboBox, cxCalc, cxSpinEdit, cxCustomData, Grids, DBGrids,
  cxGraphics;

type
  TSummariesDemoMainForm = class(TDemoBasicMainForm)
    miGridLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    tlOrders: TcxDBTreeList;
    tlOrdersPurchaseDate: TcxDBTreeListColumn;
    tlOrdersTime: TcxDBTreeListColumn;
    tlOrdersPaymentType: TcxDBTreeListColumn;
    tlOrdersPaymentAmount: TcxDBTreeListColumn;
    tlOrdersQuantity: TcxDBTreeListColumn;
    tlOrdersCustomer: TcxDBTreeListColumn;
    tlOrdersCar: TcxDBTreeListColumn;
    cxEditRepository: TcxEditRepository;
    eriCarLookup: TcxEditRepositoryLookupComboBoxItem;
    eriCarInfoPopup: TcxEditRepositoryPopupItem;
    N1: TMenuItem;
    miSummaries: TMenuItem;
    miIgnoreNullValues: TMenuItem;
    miOnlyVisaPaymentType: TMenuItem;
    miCustomizeSummaries: TMenuItem;
    miSelectedRecordsOnly: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miMultiselect: TMenuItem;
    Office111: TMenuItem;
    procedure LookAndFeelChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miCustomizeSummariesClick(Sender: TObject);
    procedure miIgnoreNullValuesClick(Sender: TObject);
    procedure miMultiselectClick(Sender: TObject);
    procedure miOnlyVisaPaymentTypeClick(Sender: TObject);
    procedure miSelectedRecordsOnlyClick(Sender: TObject);
    procedure tlOrdersAfterSummary(ASender: TcxDataSummary);
    procedure tlOrdersSummary(ASender: TcxDataSummaryItems;
      Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure tlOrdersSelectionChanged(Sender: TObject);
  private
    FCalcForVisaOnly: Boolean;
    FCalcSelectedOnly: Boolean;
  end;

var
  SummariesDemoMainForm: TSummariesDemoMainForm;

implementation

uses SummariesDemoData, ShellAPI, SummariesDemoEditSummary, DB, cxDBData;

{$R *.dfm}

procedure TSummariesDemoMainForm.LookAndFeelChange(Sender: TObject);
begin
  if TMenuItem(Sender).Tag > 3 then
  begin
    cxLookAndFeelController.NativeStyle :=
      not cxLookAndFeelController.NativeStyle;
    TMenuItem(Sender).Checked := cxLookAndFeelController.NativeStyle;
  end
  else
  begin
    TMenuItem(Sender).Checked := True;
    cxLookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).Tag);
    cxLookAndFeelController.NativeStyle := False;
    miNativeStyle.Checked := False;
  end;
end;

procedure TSummariesDemoMainForm.FormShow(Sender: TObject);
begin
  FCalcForVisaOnly := False;
  FCalcSelectedOnly := False;
  miCustomizeSummariesClick(nil);
{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TSummariesDemoMainForm.miCustomizeSummariesClick(
  Sender: TObject);
begin
  if not Assigned(SummariesDemoEditSummaryForm) then
  begin
    SummariesDemoEditSummaryForm := TSummariesDemoEditSummaryForm.Create(Application);
    SummariesDemoEditSummaryForm.TreeList := tlOrders;
  end;
  SummariesDemoEditSummaryForm.Show;
end;

procedure TSummariesDemoMainForm.miIgnoreNullValuesClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  tlOrders.OptionsData.SummaryNullIgnore := TMenuItem(Sender).Checked;
end;

procedure TSummariesDemoMainForm.miMultiselectClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  tlOrders.OptionsSelection.MultiSelect := TMenuItem(Sender).Checked;
end;

procedure TSummariesDemoMainForm.miOnlyVisaPaymentTypeClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  tlOrders.DataController.Summary.BeginUpdate;
  try
    FCalcForVisaOnly := TMenuItem(Sender).Checked;
  finally
    tlOrders.DataController.Summary.EndUpdate;
  end;
end;

procedure TSummariesDemoMainForm.miSelectedRecordsOnlyClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  tlOrders.DataController.Summary.BeginUpdate;
  miOnlyVisaPaymentType.Enabled := not TMenuItem(Sender).Checked;
  miIgnoreNullValues.Enabled := not TMenuItem(Sender).Checked;
  FCalcForVisaOnly := miOnlyVisaPaymentType.Enabled and
    miOnlyVisaPaymentType.Checked;
  try
    FCalcSelectedOnly := TMenuItem(Sender).Checked;
  finally
    tlOrders.DataController.Summary.EndUpdate;
  end;
end;

procedure TSummariesDemoMainForm.tlOrdersAfterSummary(
  ASender: TcxDataSummary);

  function SummaryKindToStr(AKind: TcxSummaryKind): string;
  begin
    case AKind of
      skSum:
        Result := 'SUM';
      skMin:
        Result := 'MIN';
      skMax:
        Result := 'MAX';
      skCount:
        Result := 'Count';
      skAverage:
        Result := 'AVG';
    else
      Result := ''
    end;
  end;

  function GetSQLCondition: string;
  var
    I: Integer;
  begin
    Result := ' (';
    for I := 0 to tlOrders.SelectionCount - 1 do
    begin
      Result := Result +
        VarToStr(TcxTreeListDataNode(tlOrders.Selections[I]).KeyValue) + ', ';
    end;
    Delete(Result, Length(Result) - 1, 2);
    Result := Result + ')';
  end;
               
Const
  ACalculatedTableName = 'Orders';
  ABackSeparator = '''';
  AFrontSeparator = '''';

var
  I: Integer;
  AKeyFieldName, AFieldName, ASQL: string;
  ASummaryItems: TcxDataFooterSummaryItems;
  ASummaryItem: TcxDBDataSummaryItem;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  if not FCalcSelectedOnly then Exit;
  AKeyFieldName := tlOrders.DataController.KeyField;
  ASummaryItems := ASender.FooterSummaryItems;
  ASQL := 'Select ';
  for I := 0 to ASummaryItems.Count - 1 do
  begin
    ASummaryItem := TcxDBDataSummaryItem(ASummaryItems[I]);
    AFieldName := ASummaryItem.FieldName;
    if AFieldName = '' then
      AFieldName :=
        (ASummaryItem.ItemLink as TcxDBTreeListColumn).DataBinding.FieldName;
    AFieldName := ABackSeparator + ACalculatedTableName + AFrontSeparator +
       '.'+ ABackSeparator + AFieldName + AFrontSeparator;
    ASQL := ASQL + SummaryKindToStr(ASummaryItem.Kind) + '(' + AFieldName + '), ';
  end;
  Delete(ASQL, Length(ASQL) - 1, 2);
  ASQL := ASQL + ' From ' + ACalculatedTableName;
  with SummariesDemoDataDM do
  begin
    qryOrdersSummary.Close;
    qryOrdersSummary.SQL.Clear;
    qryOrdersSummary.SQL.Add(ASQL);
    if tlOrders.SelectionCount > 0 then
    begin
      qryOrdersSummary.SQL.Add('where ' + AKeyFieldName + ' in ');
      qryOrdersSummary.SQL.Add(GetSQLCondition);
    end;
    qryOrdersSummary.Open;
    for I := 0 to ASummaryItems.Count - 1 do
      ASender.FooterSummaryValues[I] := qryOrdersSummary.Fields[I].Value;
    qryOrdersSummary.Close;
  end;
  tlOrders.Invalidate;
//}
end;

procedure TSummariesDemoMainForm.tlOrdersSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  if not FCalcForVisaOnly then Exit;
  if ASender.DataController.Values[Arguments.RecordIndex, tlOrdersPaymentType.ItemIndex] <> 'Visa' then
    OutArguments.Done := True;

//}
end;

procedure TSummariesDemoMainForm.tlOrdersSelectionChanged(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  tlOrders.DataController.Summary.Calculate;

//}
end;

end.
