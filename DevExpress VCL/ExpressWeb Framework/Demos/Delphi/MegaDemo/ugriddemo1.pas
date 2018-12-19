unit ugriddemo1;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule, cxWebControls,
  cxWebStdCtrls, DB, DBTables, cxWebGrids, cxWebDataNavigator,
  cxDataStorage, cxWebDataCtrls, cxWebData, cxWebExtData, cxWebMenus,
  cxWebDBGrid, ADODB;
                                                   
type
  TGridDemo1 = class(TcxWebPageModule)
    cxWebStyleController1: TcxWebStyleController;
    cxWebLabel2: TcxWebLabel;
    dsGridDataSource: TcxWebDBDataSource;
    cxWebDBDataNavigator1: TcxWebDBDataNavigator;
    StandartGroupPanel: TcxWebStyleItem;
    StandartHeader: TcxWebStyleItem;
    StandartIndicator: TcxWebStyleItem;
    StandartStatusPanel: TcxWebStyleItem;
    StandartGroupNodes: TcxWebStyleItem;
    StandartColumn: TcxWebStyleItem;
    StandartNavigator: TcxWebStyleItem;
    AutumnGroupPanel: TcxWebStyleItem;
    AutumnHeader: TcxWebStyleItem;
    AutumnIndicator: TcxWebStyleItem;
    AutumnStatusPanel: TcxWebStyleItem;
    AutumnGroupNodes: TcxWebStyleItem;
    AutumnColumn: TcxWebStyleItem;
    AutumnNavigator: TcxWebStyleItem;
    cbLoadAllRecords: TcxWebCheckBox;
    SkyGroupPanel: TcxWebStyleItem;
    SkyHeader: TcxWebStyleItem;
    SkyIndicator: TcxWebStyleItem;
    SkyStatusPanel: TcxWebStyleItem;
    SkyGroupNodes: TcxWebStyleItem;
    SkyColumn: TcxWebStyleItem;
    SkyNavigator: TcxWebStyleItem;
    SkyHover: TcxWebStyleItem;
    cxWebDBGrid1: TcxWebDBGrid;
    cName: TcxWebDBColumn;
    cCapital: TcxWebDBColumn;
    cContinent: TcxWebDBColumn;
    cArea: TcxWebDBColumn;
    cPopulation: TcxWebDBColumn;
    cxWebPanel1: TcxWebPanel;
    cbIndicatorType: TcxWebComboBox;
    cxWebLabel3: TcxWebLabel;
    cxWebLabel4: TcxWebLabel;
    cbStyles: TcxWebComboBox;
    cxWebLabel9: TcxWebLabel;
    cbNavigatorStyle: TcxWebComboBox;
    cxWebPanel2: TcxWebPanel;
    cbAutoWidth: TcxWebCheckBox;
    cbShowGroupPanel: TcxWebCheckBox;
    cbShowGrid: TcxWebCheckBox;
    cbShowHeader: TcxWebCheckBox;
    cbShowGroupedColumns: TcxWebCheckBox;
    cbShowStatusPanel: TcxWebCheckBox;
    cxWebPanel3: TcxWebPanel;
    cbColumnVisible: TcxWebCheckBox;
    cbColumnReadOnly: TcxWebCheckBox;
    cxWebLabel10: TcxWebLabel;
    cbColumn: TcxWebComboBox;
    cxWebLabel11: TcxWebLabel;
    cxWebLabel12: TcxWebLabel;
    cxWebLabel13: TcxWebLabel;
    eColumnTitle: TcxWebEdit;
    eColumnIndex: TcxWebEdit;
    eColumnWidth: TcxWebEdit;
    bApply: TcxWebButton;
    cxWebLabel14: TcxWebLabel;
    cbColumnViewType: TcxWebComboBox;
    cxWebLabel15: TcxWebLabel;
    cbColumnAlign: TcxWebComboBox;
    cxWebLabel16: TcxWebLabel;
    cbColumnVAlign: TcxWebComboBox;
    bCancel: TcxWebButton;
    scCommon: TcxWebStyleController;
    stHeader1: TcxWebStyleItem;
    stHeader2: TcxWebStyleItem;
    stPanel: TcxWebStyleItem;
    stButtonDef: TcxWebStyleItem;
    stButtonHover: TcxWebStyleItem;
    stEditorDef: TcxWebStyleItem;
    stEditorHover: TcxWebStyleItem;
    stLabelDef: TcxWebStyleItem;
    stLabelHover: TcxWebStyleItem;
    stTips: TcxWebStyleItem;
    stLine1: TcxWebStyleItem;
    stLine2: TcxWebStyleItem;
    SkyColumnHover: TcxWebStyleItem;
    SkyStatusPanelHover: TcxWebStyleItem;
    SkyGroupPanelHover: TcxWebStyleItem;
    AutumnAltColumn: TcxWebStyleItem;
    cbReadOnly: TcxWebCheckBox;
    ADOTable1: TADOTable;
    procedure cbShowGroupPanelClick(Sender: TObject);
    procedure cbShowHeaderClick(Sender: TObject);
    procedure cbShowGridClick(Sender: TObject);
    procedure cbShowStatusPanelClick(Sender: TObject);
    procedure cbIndicatorTypeChange(Sender: TObject);
    procedure cbStylesChange(Sender: TObject);
    procedure cbLoadAllRecordsClick(Sender: TObject);
    procedure cbNavigatorStyleChange(Sender: TObject);
    procedure cbColumnChange(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
    procedure cbAutoWidthClick(Sender: TObject);
    procedure cbShowGroupedColumnsClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure cbReadOnlyClick(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebPageModuleDeactivate(Sender: TObject);
  private
    { Private properties }
  public
    { Public properties }
  end;

function GridDemo1: TGridDemo1;

implementation

{$R *.DFM}{*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, cxWebGraphics, uMainPage, ActiveX;

function GridDemo1: TGridDemo1;
begin
  Result := TGridDemo1(WebContext.FindModuleClass(TGridDemo1));
end;


procedure TGridDemo1.cbShowGroupPanelClick(Sender: TObject);
begin
  cxWebDBGrid1.ShowGroupPanel := cbShowGroupPanel.Checked;
end;

procedure TGridDemo1.cbShowHeaderClick(Sender: TObject);
begin
  cxWebDBGrid1.ShowHeader := cbShowHeader.Checked;
end;

procedure TGridDemo1.cbShowGridClick(Sender: TObject);
begin
  cxWebDBGrid1.ShowGrid := cbShowGrid.Checked;
end;

procedure TGridDemo1.cbShowStatusPanelClick(Sender: TObject);
begin
  cxWebDBGrid1.ShowStatusPanel := cbShowStatusPanel.Checked;
end;

procedure TGridDemo1.cbIndicatorTypeChange(Sender: TObject);
begin
  case cbIndicatorType.ItemIndex of
    0:  cxWebDBGrid1.ShowIndicator := false;
    1:  begin
          cxWebDBGrid1.ShowIndicator := true;
          cxWebDBGrid1.IndicatorType := itCursor;
        end;
    2:  begin
          cxWebDBGrid1.ShowIndicator := true;
          cxWebDBGrid1.IndicatorType := itDataOp;
        end;
  end;
end;

procedure TGridDemo1.cbStylesChange(Sender: TObject);
var
  I: Integer;
  StylePrefix: string;
begin
  case cbStyles.ItemIndex of
    1:  begin
          StylePrefix := 'Standart';
          cxWebDBGrid1.SelectedColor := clWebPeru;
        end;
    2:  begin
          cxWebDBGrid1.SelectedColor := clWebSaddleBrown;
          StylePrefix := 'Autumn';
        end;
    3:  begin
          cxWebDBGrid1.SelectedColor := clWebIndianred;
          StylePrefix := 'Sky';
        end;
    else
      begin
        cxWebDBGrid1.SelectedColor := clWebHighlight;
        StylePrefix := '';
      end;
  end;

  cxWebDBGrid1.GroupPanelStyles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'GroupPanel');
  cxWebDBGrid1.GroupPanelStyles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'GroupPanelHover');
  cxWebDBGrid1.StatusPanelStyles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'StatusPanel');
  cxWebDBGrid1.StatusPanelStyles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'StatusPanelHover');
  cxWebDBGrid1.GroupNodesStyles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'GroupNodes');
  cxWebDBGrid1.HeaderStyles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'Header');
  cxWebDBGrid1.HeaderStyles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'HeaderHover');
  cxWebDBGrid1.IndicatorStyles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'Indicator');
  for I := 0 to cxWebDBGrid1.ColumnCount - 1 do
  begin
    cxWebDBGrid1.Columns[I].Styles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'Column');
    cxWebDBGrid1.Columns[I].Styles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'ColumnHover');
    cxWebDBGrid1.Columns[I].AlternatingStyles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'AltColumn');
    cxWebDBGrid1.Columns[I].AlternatingStyles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'AltColumnHover');
  end;
  cxWebDBDataNavigator1.Styles.Default := cxWebStyleController1.ItemByName(StylePrefix + 'Navigator');

  cxWebDBGrid1.HeaderStyles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'Hover');
  cxWebDBGrid1.IndicatorStyles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'Hover');
  cxWebDBDataNavigator1.Styles.Hover := cxWebStyleController1.ItemByName(StylePrefix + 'Hover');
end;

procedure TGridDemo1.cbLoadAllRecordsClick(Sender: TObject);
begin
  dsGridDataSource.LoadAllRecords := cbLoadAllRecords.Checked;
end;

procedure TGridDemo1.cbNavigatorStyleChange(Sender: TObject);
const
  Standard: array[0..13] of Boolean = (True, True, True, True, True, True, True,
      True, True, True, True, True, True, True);
  Navigation: array[0..13] of Boolean = (True, True, True, False, False, True, True,
      True, False, False, False, False, False, False);
  DelphiNavigator: array[0..13] of Boolean = (True, False, True, False, False, True,
      False, True, True, True, True, True, True, True);
var
  I: Integer;
begin
  for I := 0 to cxWebDBDataNavigator1.ButtonCount - 1 do
  begin
    case cbNavigatorStyle.ItemIndex of
      0: cxWebDBDataNavigator1.Buttons[I].Visible := Standard[I];
      1: cxWebDBDataNavigator1.Buttons[I].Visible := Navigation[I];
      2: cxWebDBDataNavigator1.Buttons[I].Visible := DelphiNavigator[I];
    end;
  end;
  cxWebDBDataNavigator1.Width := 0; // stay minwidth
end;

procedure TGridDemo1.cbColumnChange(Sender: TObject);
var
  Column: TcxWebColumn;
begin
  Column := cxWebDBGrid1.ColumnByName(cbColumn.Text);
  if Column <> nil then
  begin
    eColumnTitle.Text := Column.Title;
    eColumnIndex.Text := IntToStr(Column.Index);
    eColumnWidth.Text := IntToStr(Column.Width);
    cbColumnVisible.Checked := Column.Visible;
    cbColumnReadOnly.Checked := Column.ReadOnly;
    cbColumnViewType.ItemIndex := Integer(Column.ViewType);
    cbColumnAlign.ItemIndex := Integer(Column.Alignment);
    cbColumnVAlign.ItemIndex := Integer(Column.VAlignment);    
  end;
end;

procedure TGridDemo1.bApplyClick(Sender: TObject);
var
  Column: TcxWebColumn;
begin
  Column := cxWebDBGrid1.ColumnByName(cbColumn.Text);
  if Column <> nil then
  begin
    Column.Title := eColumnTitle.Text;
    try
      Column.Index := StrToInt(eColumnIndex.Text);
    except
      on EConvertError do
      else raise;
    end;
    eColumnIndex.Text := IntToStr(Column.Index);
    try
      Column.Width := StrToInt(eColumnWidth.Text)
    except
      on EConvertError do
      else raise;
    end;
    eColumnWidth.Text := IntToStr(Column.Width);
    Column.Visible := cbColumnVisible.Checked;
    cbColumnVisible.Checked := Column.Visible;
    Column.ReadOnly := cbColumnReadOnly.Checked;
    cbColumnReadOnly.Checked := Column.ReadOnly;
    Column.ViewType := TcxWebColumnViewType(cbColumnViewType.ItemIndex);
    Column.Alignment := TcxWebHorzAlignment(cbColumnAlign.ItemIndex);
    Column.VAlignment := TcxWebVertAlignment(cbColumnVAlign.ItemIndex);
  end;
end;

procedure TGridDemo1.cbAutoWidthClick(Sender: TObject);
begin
  cxWebDBGrid1.AutoWidth := cbAutoWidth.Checked;
end;

procedure TGridDemo1.cbShowGroupedColumnsClick(Sender: TObject);
begin
  cxWebDBGrid1.ShowGroupedColumns := cbShowGroupedColumns.Checked;
end;

procedure TGridDemo1.bCancelClick(Sender: TObject);
var
  Column: TcxWebColumn;
begin
  Column := cxWebDBGrid1.ColumnByName(cbColumn.Text);
  if Column <> nil then
  begin
    eColumnTitle.Text := Column.Title;
    eColumnIndex.Text := IntToStr(Column.Index);
    eColumnWidth.Text := IntToStr(Column.Width);
    cbColumnVisible.Checked := Column.Visible;
    cbColumnReadOnly.Checked := Column.ReadOnly;
    cbColumnViewType.ItemIndex := Integer(Column.ViewType);
    cbColumnAlign.ItemIndex := Integer(Column.Alignment);
    cbColumnVAlign.ItemIndex := Integer(Column.VAlignment);
  end;
end;

procedure TGridDemo1.cbReadOnlyClick(Sender: TObject);
begin
  cxWebDBGrid1.ReadOnly := cbReadOnly.Checked;
end;

procedure TGridDemo1.cxWebPageModuleActivate(Sender: TObject);
begin
  ADOTable1.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  ADOTable1.Open;
end;

procedure TGridDemo1.cxWebPageModuleDeactivate(Sender: TObject);
begin
  ADOTable1.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TGridDemo1, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
