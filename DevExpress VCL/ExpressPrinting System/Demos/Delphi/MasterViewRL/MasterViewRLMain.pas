unit MasterViewRLMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, dxMasterViewColumns, dxMasterView, ExtCtrls,
  StdCtrls, ComCtrls, Spin, ExtDlgs, dxPSCore, dxPSdxMVLnk, dxPSGlbl,
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, ImgList,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns;

type
  TMasterViewRLMainForm = class(TForm)
    pnlButtom: TPanel;
    tbEvents: TTable;
    dsEvents: TDataSource;
    tbVenues: TTable;
    dsVenues: TDataSource;
    MasterViewLevel1: TdxMasterViewLevel;
    Level1EventNo: TdxMasterViewColumn;
    Level1VenueNo: TdxMasterViewColumn;
    Level1Event_Name: TdxMasterViewColumn;
    Level1Event_Date: TdxMasterViewColumn;
    Level1Event_Time: TdxMasterViewColumn;
    Level1Event_Description: TdxMasterViewColumn;
    Level1Ticket_price: TdxMasterViewColumn;
    Level1Event_Photo: TdxMasterViewGraphicColumn;
    MasterViewLevel2: TdxMasterViewLevel;
    Level2VenueNo: TdxMasterViewColumn;
    Level2Venue: TdxMasterViewColumn;
    Level2Capacity: TdxMasterViewColumn;
    Level2Remarks: TdxMasterViewColumn;
    Level2Venue_Map: TdxMasterViewGraphicColumn;
    tbEventsEventNo: TAutoIncField;
    tbEventsVenueNo: TIntegerField;
    tbEventsEvent_Name: TStringField;
    tbEventsEvent_Date: TDateField;
    tbEventsEvent_Time: TTimeField;
    tbEventsEvent_Description: TMemoField;
    tbEventsTicket_price: TCurrencyField;
    tbEventsEvent_Photo: TGraphicField;
    tbEventsPriority: TSmallintField;
    tbEventsLow_Price: TStringField;
    Level1Low_Price: TdxMasterViewCheckColumn;
    Level1Priority: TdxMasterViewImageColumn;
    ImageList: TImageList;
    odpOpenGlyph: TOpenPictureDialog;
    MasterView: TdxMasterView;
    Panel1: TPanel;
    PageControl: TPageControl;
    tsMasterView: TTabSheet;
    btncustomize: TButton;
    chbMultiSelect: TCheckBox;
    chbUseIndent: TCheckBox;
    chbDrawEndEllipsis: TCheckBox;
    chbHideFocusRect: TCheckBox;
    chbHideSelection: TCheckBox;
    chbKeepColumnWidths: TCheckBox;
    chbTransparentDragAndDrop: TCheckBox;
    chbAutocolumnWidth: TCheckBox;
    chbUseBitmap: TCheckBox;
    chbUseBitmapToDrawPreview: TCheckBox;
    chbAnimation: TCheckBox;
    btnFullCollapse: TButton;
    btnFullExpand: TButton;
    tsLevel1: TTabSheet;
    chbColumnMoving: TCheckBox;
    chbColumnHiding: TCheckBox;
    chbColumnHorSizing: TCheckBox;
    chbColumnVerSizing: TCheckBox;
    chbColumnSorting: TCheckBox;
    chbColumnGrouping: TCheckBox;
    chbHideColumnOnGrouping: TCheckBox;
    chbShowColumnOnUngrouping: TCheckBox;
    chbDblClkExpanding: TCheckBox;
    chbSmartLoad: TCheckBox;
    chbSmartRefresh: TCheckBox;
    chbSmartReload: TCheckBox;
    chbCaption: TCheckBox;
    chbFooter: TCheckBox;
    chbGrid: TCheckBox;
    chbGridWithPreview: TCheckBox;
    chbGroupByBox: TCheckBox;
    chbHeader: TCheckBox;
    chbOccupyRestSpace: TCheckBox;
    chbPreview: TCheckBox;
    tsStandartColumn: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cmbAlignment: TComboBox;
    edCaption: TEdit;
    cmbFieldName: TComboBox;
    cmbHeaderAlignment: TComboBox;
    btnGlyph: TButton;
    cmbGlyphAlignment: TComboBox;
    GroupBox1: TGroupBox;
    chbGrouping: TCheckBox;
    chbHidden: TCheckBox;
    chbHorSizing: TCheckBox;
    chbMoving: TCheckBox;
    chbSorting: TCheckBox;
    chbVerSizing: TCheckBox;
    chbMultiLine: TCheckBox;
    sedColIndex: TSpinEdit;
    Label1: TLabel;
    cmbLevels: TComboBox;
    Label2: TLabel;
    cmbColumns: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    sedMaxRowCount: TSpinEdit;
    sedMinRowCount: TSpinEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    sedMaxWidth: TSpinEdit;
    sedMinWidth: TSpinEdit;
    sedRowCount: TSpinEdit;
    sedRowIndex: TSpinEdit;
    chbVisible: TCheckBox;
    tsGraphicColumn: TTabSheet;
    chbBlendedSelection: TCheckBox;
    chbCustomGraphic: TCheckBox;
    chbStretch: TCheckBox;
    tsImageColumn: TTabSheet;
    chbShowDescription: TCheckBox;
    tsCheckColumn: TTabSheet;
    chbBorder3D: TCheckBox;
    Label15: TLabel;
    edDisplayChecked: TEdit;
    Label16: TLabel;
    edDisplayNull: TEdit;
    Label17: TLabel;
    edDisplayUnchecked: TEdit;
    Label18: TLabel;
    cmbShowNullFieldStyle: TComboBox;
    Label19: TLabel;
    edValueChecked: TEdit;
    Label20: TLabel;
    edValueUnchecked: TEdit;
    tsSummary: TTabSheet;
    cmbSummaryFieldName: TComboBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    cmbSummaryType: TComboBox;
    Label24: TLabel;
    cmbFooterAlignment: TComboBox;
    edSummaryFormat: TEdit;
    HeaderStyle: TdxMasterViewStyle;
    Bevel1: TBevel;
    Label25: TLabel;
    Bevel2: TBevel;
    Label26: TLabel;
    Bevel3: TBevel;
    Label27: TLabel;
    Bevel4: TBevel;
    Label28: TLabel;
    Bevel5: TBevel;
    Label29: TLabel;
    Bevel6: TBevel;
    Label30: TLabel;
    Label31: TLabel;
    cmbTransparency: TComboBox;
    Label32: TLabel;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxMasterViewReportLink;
    btnPreview: TButton;
    btnPrint: TButton;
    procedure btncustomizeClick(Sender: TObject);
    procedure tbEventsCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnFullCollapseClick(Sender: TObject);
    procedure btnFullExpandClick(Sender: TObject);
    procedure chbDblClkExpandingClick(Sender: TObject);
    procedure chbMultiSelectClick(Sender: TObject);
    procedure cmbLevelsChange(Sender: TObject);
    procedure cmbColumnsChange(Sender: TObject);
    procedure btnGlyphClick(Sender: TObject);
    procedure chbGroupingClick(Sender: TObject);
    procedure cmbAlignmentChange(Sender: TObject);
    procedure edCaptionChange(Sender: TObject);
    procedure sedColIndexChange(Sender: TObject);
    procedure cmbFieldNameChange(Sender: TObject);
    procedure cmbHeaderAlignmentChange(Sender: TObject);
    procedure cmbGlyphAlignmentChange(Sender: TObject);
    procedure chbMultiLineClick(Sender: TObject);
    procedure sedMaxRowCountChange(Sender: TObject);
    procedure sedMinRowCountChange(Sender: TObject);
    procedure sedMaxWidthChange(Sender: TObject);
    procedure sedMinWidthChange(Sender: TObject);
    procedure sedRowCountChange(Sender: TObject);
    procedure sedRowIndexChange(Sender: TObject);
    procedure chbVisibleClick(Sender: TObject);
    procedure chbBlendedSelectionClick(Sender: TObject);
    procedure chbShowDescriptionClick(Sender: TObject);
    procedure chbBorder3DClick(Sender: TObject);
    procedure edDisplayCheckedChange(Sender: TObject);
    procedure edDisplayNullChange(Sender: TObject);
    procedure edDisplayUncheckedChange(Sender: TObject);
    procedure cmbShowNullFieldStyleChange(Sender: TObject);
    procedure edValueCheckedChange(Sender: TObject);
    procedure edValueUncheckedChange(Sender: TObject);
    procedure cmbSummaryFieldNameChange(Sender: TObject);
    procedure edSummaryFormatChange(Sender: TObject);
    procedure cmbSummaryTypeChange(Sender: TObject);
    procedure cmbFooterAlignmentChange(Sender: TObject);
    procedure cmbTransparencyChange(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    procedure UpdateLevelOptions;
    procedure UpdateColumnOptions;
    procedure FillColumnsCombos(Level: TdxMasterViewLevel);
  public
    { Public declarations }
  end;

var
  MasterViewRLMainForm: TMasterViewRLMainForm;
  CurrentLevel: TdxMasterViewLevel;
  CurrentColumn: TdxMasterviewColumn;

implementation
{$IFNDEF VER80}
 {$IFNDEF VER90}
  {$IFNDEF VER93}
    {$DEFINE DELPHI3} { Delphi 3.0 }
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

{$R *.DFM}

procedure TMasterViewRLMainForm.btncustomizeClick(Sender: TObject);
begin
  MasterView.Customizing := not MasterView.Customizing;
end;

//Calc fields for tbEvents
procedure TMasterViewRLMainForm.tbEventsCalcFields(DataSet: TDataSet);
begin
  tbEventsPriority.AsInteger := tbEvents.RecNo mod 3;

  if tbEvents.FieldByName('Ticket_price').AsFloat < 10 then
    if tbEvents.FieldByName('Ticket_price').AsFloat > 0 then
      tbEvents.FieldByName('Low_Price').AsString := 'Y'
    else
      tbEvents.FieldByName('Low_Price').AsString := 'Null'
  else
    tbEvents.FieldByName('Low_Price').AsString := 'N';
end;

procedure TMasterViewRLMainForm.FormCreate(Sender: TObject);
begin
  //Set the MasterView options
  chbAutoColumnWidth.Checked := movAutoColumnWidth in MasterView.OptionsView;
  chbMultiSelect.Checked := mobMultiSelect in MasterView.OptionsBehavior;
  chbUseIndent.Checked := mobUseIndent in MasterView.OptionsBehavior;
  chbAnimation.Checked := movAnimation in MasterView.OptionsView;
  chbDrawEndEllipsis.Checked := movDrawEndEllipsis in MasterView.OptionsView;
  chbHideFocusRect.Checked := movHideFocusRect in MasterView.OptionsView;
  chbHideSelection.Checked := movHideSelection in MasterView.OptionsView;
  chbKeepColumnWidths.Checked := movKeepColumnWidths in MasterView.OptionsView;
  chbTransparentDragAndDrop.Checked := movTransparentDragAndDrop in MasterView.OptionsView;
  chbUseBitmap.Checked := movUseBitmap in MasterView.OptionsView;
  chbUseBitmapToDrawPreview.Checked := movUseBitmapToDrawPreview in MasterView.OptionsView;

  //Set the current level
  cmbLevels.ItemIndex := 0;
  cmbLevelsChange(cmbLevels);

  //Set field names for cmbFieldname and fill cmbColumns
  FillColumnsCombos(CurrentLevel);

  //Set the current column
  cmbColumnsChange(cmbColumns);
end;

procedure TMasterViewRLMainForm.btnFullCollapseClick(Sender: TObject);
begin
  MasterView.FullCollapse;
end;

procedure TMasterViewRLMainForm.btnFullExpandClick(Sender: TObject);
begin
  MasterView.FullExpand;
end;

procedure TMasterViewRLMainForm.chbDblClkExpandingClick(Sender: TObject);
begin
  with CurrentLevel, TCheckBox(Sender) do begin
    case TCheckBox(Sender).Tag of
    0 : if Checked then
          OptionsBehavior := OptionsBehavior + [lobDblClkExpanding]
        else
          OptionsBehavior := OptionsBehavior - [lobDblClkExpanding];
    1 : if Checked then
          OptionsCustomize := OptionsCustomize + [locColumnMoving]
        else
          OptionsCustomize := OptionsCustomize - [locColumnMoving];
    2 : if Checked then
          OptionsCustomize := OptionsCustomize + [locColumnHiding]
        else
          OptionsCustomize := OptionsCustomize - [locColumnHiding];
    3 : if Checked then
          OptionsCustomize := OptionsCustomize + [locColumnHorSizing]
        else
          OptionsCustomize := OptionsCustomize - [locColumnHorSizing];
    4 : if Checked then
          OptionsCustomize := OptionsCustomize + [locColumnVerSizing]
        else
          OptionsCustomize := OptionsCustomize - [locColumnVerSizing];
    5 : if Checked then
          OptionsCustomize := OptionsCustomize + [locColumnSorting]
        else
          OptionsCustomize := OptionsCustomize - [locColumnSorting];
    6 : if Checked then
          OptionsCustomize := OptionsCustomize + [locColumnGrouping]
        else
          OptionsCustomize := OptionsCustomize - [locColumnGrouping];
    7 : if Checked then
          OptionsCustomize := OptionsCustomize + [locHideColumnOnGrouping]
        else
          OptionsCustomize := OptionsCustomize - [locHideColumnOnGrouping];
    8 : if Checked then
          OptionsCustomize := OptionsCustomize + [locShowColumnOnUngrouping]
        else
          OptionsCustomize := OptionsCustomize - [locShowColumnOnUngrouping];
    9 : if Checked then
          OptionsDB := OptionsDB + [lodSmartLoad]
        else
          OptionsDB := OptionsDB - [lodSmartLoad];
    10 : if Checked then
          OptionsDB := OptionsDB + [lodSmartRefresh]
        else
          OptionsDB := OptionsDB - [lodSmartRefresh];
    11 : if Checked then
          OptionsDB := OptionsDB + [lodSmartReload]
        else
          OptionsDB := OptionsDB - [lodSmartReload];
    12 : if Checked then
          OptionsView := OptionsView + [lovCaption]
        else
          OptionsView := OptionsView - [lovCaption];
    13 : if Checked then
          OptionsView := OptionsView + [lovFooter]
        else
          OptionsView := OptionsView - [lovFooter];
    14 : if Checked then
          OptionsView := OptionsView + [lovGrid]
        else
          OptionsView := OptionsView - [lovGrid];
    15 : if Checked then
          OptionsView := OptionsView + [lovGridWithPreview]
        else
          OptionsView := OptionsView - [lovGridWithPreview];
    16 : if Checked then
          OptionsView := OptionsView + [lovGroupByBox]
        else
          OptionsView := OptionsView - [lovGroupByBox];
    17 : if Checked then
          OptionsView := OptionsView + [lovHeader]
        else
          OptionsView := OptionsView - [lovHeader];
    18 : if Checked then
          OptionsView := OptionsView + [lovOccupyRestSpace]
        else
          OptionsView := OptionsView - [lovOccupyRestSpace];
    19 : if Checked then
          OptionsView := OptionsView + [lovPreview]
        else
          OptionsView := OptionsView - [lovPreview];

    end;
  end;
end;

procedure TMasterViewRLMainForm.chbMultiSelectClick(Sender: TObject);
begin
  with MasterView, TCheckBox(Sender) do begin
    case TCheckBox(Sender).Tag of
    0 : if Checked then
          OptionsBehavior := OptionsBehavior + [mobMultiSelect]
        else
          OptionsBehavior := OptionsBehavior - [mobMultiSelect];
    1 : if Checked then
          OptionsBehavior := OptionsBehavior + [mobUseIndent]
        else
          OptionsBehavior := OptionsBehavior - [mobUseIndent];
    2 : if Checked then
          OptionsView := OptionsView + [movAnimation]
        else
          OptionsView := OptionsView - [movAnimation];
    3 : if Checked then
          OptionsView := OptionsView + [movAutoColumnWidth]
        else
          OptionsView := OptionsView - [movAutoColumnWidth];
    4 : if Checked then
          OptionsView := OptionsView + [movDrawEndEllipsis]
        else
          OptionsView := OptionsView - [movDrawEndEllipsis];
    5 : if Checked then
          OptionsView := OptionsView + [movHideFocusRect]
        else
          OptionsView := OptionsView - [movHideFocusRect];
    6 : if Checked then
          OptionsView := OptionsView + [movHideSelection]
        else
          OptionsView := OptionsView - [movHideSelection];
    7 : if Checked then
          OptionsView := OptionsView + [movKeepColumnWidths]
        else
          OptionsView := OptionsView - [movKeepColumnWidths];
    8 : if Checked then
          OptionsView := OptionsView + [movTransparentDragAndDrop]
        else
          OptionsView := OptionsView - [movTransparentDragAndDrop];
    9 : if Checked then
          OptionsView := OptionsView + [movUseBitmap]
        else
          OptionsView := OptionsView - [movUseBitmap];
   10 : if Checked then
          OptionsView := OptionsView + [movUseBitmapToDrawPreview]
        else
          OptionsView := OptionsView - [movUseBitmapToDrawPreview];
    end;
  end;
end;

procedure TMasterViewRLMainForm.cmbLevelsChange(Sender: TObject);
begin
  case TComboBox(Sender).ItemIndex of
    0 : CurrentLevel := MasterviewLevel1;
    1 : CurrentLevel := MasterviewLevel2;
  end;

  //Set field names for cmbFieldname and fill cmbColumns
  FillColumnsCombos(CurrentLevel);
  cmbColumnsChange(cmbColumns);

  //Set options values for new level
  UpdateLevelOptions;
end;

// Update options for the CurrentLevel
procedure TMasterViewRLMainForm.UpdateLevelOptions;
begin
  if CurrentLevel <> nil then begin
    chbDblClkExpanding.Checked := lobDblClkExpanding in CurrentLevel.OptionsBehavior;
    chbColumnMoving.Checked := locColumnMoving in CurrentLevel.OptionsCustomize;
    chbColumnHiding.Checked := locColumnHiding in CurrentLevel.OptionsCustomize;
    chbColumnHorSizing.Checked := locColumnHorSizing in CurrentLevel.OptionsCustomize;
    chbColumnVerSizing.Checked := locColumnVerSizing in CurrentLevel.OptionsCustomize;
    chbColumnSorting.Checked := locColumnSorting in CurrentLevel.OptionsCustomize;
    chbColumnGrouping.Checked := locColumnGrouping in CurrentLevel.OptionsCustomize;
    chbHideColumnOnGrouping.Checked := locHideColumnOnGrouping in CurrentLevel.OptionsCustomize;
    chbShowColumnOnUngrouping.Checked := locShowColumnOnUngrouping in CurrentLevel.OptionsCustomize;

    chbSmartLoad.Checked := lodSmartLoad in CurrentLevel.OptionsDB;
    chbSmartRefresh.Checked := lodSmartRefresh in CurrentLevel.OptionsDB;
    chbSmartReload.Checked := lodSmartReload in CurrentLevel.OptionsDB;

    chbCaption.Checked := lovCaption in CurrentLevel.OptionsView;
    chbFooter.Checked := lovFooter in CurrentLevel.OptionsView;
    chbGrid.Checked := lovGrid in CurrentLevel.OptionsView;
    chbGridWithPreview.Checked := lovGridWithPreview in CurrentLevel.OptionsView;
    chbGroupByBox.Checked := lovGroupByBox in CurrentLevel.OptionsView;
    chbHeader.Checked := lovHeader in CurrentLevel.OptionsView;
    chbOccupyRestSpace.Checked := lovOccupyRestSpace in CurrentLevel.OptionsView;
    chbPreview.Checked := lovPreview in CurrentLevel.OptionsView;
  end;
end;

//Set the current column
procedure TMasterViewRLMainForm.cmbColumnsChange(Sender: TObject);
var
  Index: Integer;
  ComboBox: TComboBox;
begin
  ComboBox := TCombobox(Sender);
  Index := Combobox.ItemIndex;
  if CurrentColumn <> nil then
    CurrentColumn.HeaderStyle := nil;
  //Set current column
  CurrentColumn := Combobox.Items.Objects[Index] as TdxMasterViewColumn;
  //Highlight the current column
  CurrentColumn.HeaderStyle := HeaderStyle;
  UpdateColumnOptions;
end;


//Set control's values for column tab
procedure TMasterViewRLMainForm.UpdateColumnOptions;
begin
  if CurrentColumn <> nil then begin
    cmbAlignment.ItemIndex := Integer(TAlignment(CurrentColumn.Alignment));
    edCaption.Text := CurrentColumn.Caption;
    sedColIndex.Value := CurrentColumn.ColIndex;
    cmbFieldName.ItemIndex := cmbFieldName.Items.IndexOf(CurrentColumn.FieldName);
    cmbHeaderAlignment.ItemIndex := Integer(TAlignment(CurrentColumn.HeaderAlignment));
    cmbGlyphAlignment.ItemIndex := Integer(TAlignment(CurrentColumn.HeaderGlyphAlignment));
    chbMultiLine.Checked := CurrentColumn.MultiLine;
    sedMaxRowCount.Value := CurrentColumn.MaxRowCount;
    sedMinRowCount.Value := CurrentColumn.MinRowCount;
    sedMaxWidth.Value := CurrentColumn.MaxWidth;
    sedMinWidth.Value := CurrentColumn.MinWidth;
    sedRowCount.Value := CurrentColumn.RowCount;
    sedRowIndex.Value := CurrentColumn.RowIndex;
    chbVisible.Checked := CurrentColumn.Visible;

    //Set column options
    chbGrouping.Checked := coGrouping in CurrentColumn.Options;
    chbHidden.Checked := coHidden in CurrentColumn.Options;
    chbHorSizing.Checked := coHorSizing in CurrentColumn.Options;
    chbMoving.Checked := coMoving in CurrentColumn.Options;
    chbSorting.Checked := coSorting in CurrentColumn.Options;
    chbVerSizing.Checked := coVerSizing in CurrentColumn.Options;

    //Set summary options
    cmbSummaryFieldName.ItemIndex := cmbSummaryFieldName.Items.IndexOf(CurrentColumn.SummaryFieldName);
    edSummaryFormat.Text := CurrentColumn.SummaryFormat;
    cmbSummaryType.ItemIndex :=  Integer(CurrentColumn.SummaryType);
    cmbFooterAlignment.ItemIndex := Integer(CurrentColumn.FooterAlignment);

    //Set graphic column options
    if CurrentColumn is TdxMasterViewGraphicColumn then
    begin
      chbBlendedSelection.Enabled := true;
      chbCustomGraphic.Enabled := true;
      chbStretch.Enabled := true;
      cmbTransparency.Enabled := true;
      with TdxMasterViewGraphicColumn(CurrentColumn) do begin
        chbBlendedSelection.Checked := BlendedSelection;
        chbCustomGraphic.Checked := CustomGraphic;
        chbStretch.Checked := Stretch;
        cmbTransparency.ItemIndex := Integer(Transparency);
      end
    end
    else
    begin
      chbBlendedSelection.Enabled := false;
      chbCustomGraphic.Enabled := false;
      chbStretch.Enabled := false;
      cmbTransparency.Enabled := false;
    end;

    //Set image cilumn option
    if CurrentColumn is TdxMasterViewImageColumn then
    begin
      chbShowDescription.Enabled := true;
      chbShowDescription.Checked := TdxMasterViewImageColumn(CurrentColumn).ShowDescription;
    end
    else
      chbShowDescription.Enabled := false;

    //Set check column options
    if CurrentColumn is TdxMasterViewCheckColumn then
    begin
      chbBorder3D.Enabled := true;
      edDisplayChecked.Enabled := true;
      edDisplayNull.Enabled := true;
      edDisplayUnchecked.Enabled := true;
      cmbShowNullFieldStyle.Enabled := true;
      edValueChecked.Enabled := true;
      edValueUnchecked.Enabled := true;
      with TdxMasterViewCheckColumn(CurrentColumn) do begin
        chbBorder3D.checked := Border3D;
        edDisplayChecked.Text := DisplayChecked;
        edDisplayNull.Text := DisplayNull;
        edDisplayUnchecked.Text := DisplayUnchecked;
        cmbShowNullFieldStyle.ItemIndex := Integer(ShowNullFieldStyle);
        edValueChecked.Text := ValueChecked;
        edValueUnchecked.Text := ValueUnchecked;
      end
    end
    else
    begin
      chbBorder3D.Enabled := false;
      edDisplayChecked.Enabled := false;
      edDisplayNull.Enabled := false;
      edDisplayUnchecked.Enabled := false;
      cmbShowNullFieldStyle.Enabled := false;
      edValueChecked.Enabled := false;
      edValueUnchecked.Enabled := false;
    end;
  end;
end;

procedure TMasterViewRLMainForm.btnGlyphClick(Sender: TObject);
var
  B: TBitmap;
begin
  if odpOpenGlyph.Execute then begin
    B := TBitMap.Create;
    try
      B.LoadFromFile(odpOpenGlyph.FileName);
      if CurrentColumn <> nil then
        CurrentColumn.HeaderGlyph := B;
    finally
      B.Free;
    end;
  end;
end;

procedure TMasterViewRLMainForm.chbGroupingClick(Sender: TObject);
begin
  with CurrentColumn, TCheckBox(Sender) do begin
    case TCheckBox(Sender).Tag of
    0 : if Checked then
          Options := Options + [coGrouping]
        else
          Options := Options - [coGrouping];
    1 : if Checked then
          Options := Options + [coHidden]
        else
          Options := Options - [coHidden];
    2 : if Checked then
          Options := Options + [coHorSizing]
        else
          Options := Options - [coHorSizing];
    3 : if Checked then
          Options := Options + [coMoving]
        else
          Options := Options - [coMoving];
    4 : if Checked then
          Options := Options + [coSorting]
        else
          Options := Options - [coSorting];
    5 : if Checked then
          Options := Options + [coVerSizing]
        else
          Options := Options - [coVerSizing];
    end;
  end;
end;

procedure TMasterViewRLMainForm.cmbAlignmentChange(Sender: TObject);
begin
  CurrentColumn.Alignment := TAlignment(TComboBox(Sender).ItemIndex)
end;

procedure TMasterViewRLMainForm.edCaptionChange(Sender: TObject);
begin
  CurrentColumn.Caption := TEdit(Sender).Text;
end;

procedure TMasterViewRLMainForm.sedColIndexChange(Sender: TObject);
begin
  CurrentColumn.ColIndex := TSpinEdit(Sender).Value;
end;

procedure TMasterViewRLMainForm.cmbFieldNameChange(Sender: TObject);
begin
  CurrentColumn.FieldName := TComboBox(Sender).Text;
end;

procedure TMasterViewRLMainForm.cmbHeaderAlignmentChange(Sender: TObject);
begin
  CurrentColumn.HeaderAlignment := TAlignment(TComboBox(Sender).ItemIndex)
end;

procedure TMasterViewRLMainForm.cmbGlyphAlignmentChange(Sender: TObject);
begin
  CurrentColumn.HeaderGlyphAlignment := TAlignment(TComboBox(Sender).ItemIndex)
end;

procedure TMasterViewRLMainForm.chbMultiLineClick(Sender: TObject);
begin
  CurrentColumn.MultiLine := TCheckBox(Sender).Checked;
end;

procedure TMasterViewRLMainForm.sedMaxRowCountChange(Sender: TObject);
begin
  CurrentColumn.MaxRowCount := TSpinEdit(Sender).Value;
end;

procedure TMasterViewRLMainForm.sedMinRowCountChange(Sender: TObject);
begin
  CurrentColumn.MinRowCount := TSpinEdit(Sender).Value;
end;

procedure TMasterViewRLMainForm.sedMaxWidthChange(Sender: TObject);
begin
  CurrentColumn.MaxWidth := TSpinEdit(Sender).Value;
end;

procedure TMasterViewRLMainForm.sedMinWidthChange(Sender: TObject);
begin
  CurrentColumn.MinWidth := TSpinEdit(Sender).Value;
end;

procedure TMasterViewRLMainForm.sedRowCountChange(Sender: TObject);
begin
  CurrentColumn.RowCount := TSpinEdit(Sender).Value;
end;

procedure TMasterViewRLMainForm.sedRowIndexChange(Sender: TObject);
begin
  CurrentColumn.RowIndex := TSpinEdit(Sender).Value;
end;

procedure TMasterViewRLMainForm.FillColumnsCombos(Level: TdxMasterViewLevel);
var
  i: Integer;
begin
  if Level <> nil then
  begin
    //Fill the cmbColumns
    cmbColumns.Clear;
    for i := 0 to Level.ColumnCount - 1 do
      cmbColumns.Items.AddObject(Level.Columns[i].Name,Level.Columns[i]);
    cmbColumns.ItemIndex := 0;

    //Set field names for cmbFieldname and cmbSummaryFieldName
    {$IFDEF  NOT DELPHI3}
      cmbFieldName.Items := Level.DataSet.FieldList;
      cmbSummaryFieldName.Items := Level.DataSet.FieldList;
    {$ELSE}
      cmbFieldName.Items.Clear;
      cmbSummaryFieldName.Items.Clear;
      for i := 0 to Level.DataSet.FieldCount - 1 do
        cmbFieldName.Items.AddObject(Level.DataSet.Fields[i].FieldName,Level.DataSet.Fields[i]);
      cmbSummaryFieldName.Items := cmbFieldName.Items;
    {$ENDIF}
  end;
end;

procedure TMasterViewRLMainForm.chbVisibleClick(Sender: TObject);
begin
  CurrentColumn.Visible := TCheckBox(Sender).Checked;
end;

//Graphic column options OnClick
procedure TMasterViewRLMainForm.chbBlendedSelectionClick(Sender: TObject);
begin
  with CurrentColumn as TdxMasterViewGraphicColumn, TCheckBox(Sender) do begin
    case TCheckBox(Sender).Tag of
      0 : BlendedSelection := Checked;
      1 : CustomGraphic := Checked;
      3 : Stretch := Checked;
    end;
  end
end;

procedure TMasterViewRLMainForm.chbShowDescriptionClick(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewImageColumn).ShowDescription := TCheckBox(Sender).Checked;
end;

procedure TMasterViewRLMainForm.chbBorder3DClick(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewCheckColumn).Border3D := TCheckBox(Sender).Checked;
end;

procedure TMasterViewRLMainForm.edDisplayCheckedChange(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewCheckColumn).DisplayChecked := TEdit(Sender).Text;
end;

procedure TMasterViewRLMainForm.edDisplayNullChange(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewCheckColumn).DisplayNull := TEdit(Sender).Text;
end;

procedure TMasterViewRLMainForm.edDisplayUncheckedChange(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewCheckColumn).DisplayUnchecked := TEdit(Sender).Text;
end;

procedure TMasterViewRLMainForm.cmbShowNullFieldStyleChange(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewCheckColumn).ShowNullFieldStyle := TdxMVShowNullFieldStyle(TComboBox(Sender).ItemIndex);
end;

procedure TMasterViewRLMainForm.edValueCheckedChange(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewCheckColumn).ValueChecked := TEdit(Sender).Text;
end;

procedure TMasterViewRLMainForm.edValueUncheckedChange(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewCheckColumn).ValueUnchecked := TEdit(Sender).Text;
end;

procedure TMasterViewRLMainForm.cmbSummaryFieldNameChange(Sender: TObject);
begin
  CurrentColumn.SummaryFieldName := TComboBox(Sender).Text;
end;

procedure TMasterViewRLMainForm.edSummaryFormatChange(Sender: TObject);
begin
  CurrentColumn.SummaryFormat := TEdit(Sender).Text;
end;

procedure TMasterViewRLMainForm.cmbSummaryTypeChange(Sender: TObject);
begin
  CurrentColumn.SummaryType := TdxMasterViewSummaryType(TComboBox(Sender).ItemIndex);
end;

procedure TMasterViewRLMainForm.cmbFooterAlignmentChange(Sender: TObject);
begin
  CurrentColumn.FooterAlignment := TAlignment(TComboBox(Sender).ItemIndex);
end;

procedure TMasterViewRLMainForm.cmbTransparencyChange(Sender: TObject);
begin
  (CurrentColumn as TdxMasterViewGraphicColumn).Transparency := TdxMasterViewTransparency(cmbTransparency.ItemIndex);
end;

procedure TMasterViewRLMainForm.btnPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
end;

procedure TMasterViewRLMainForm.btnPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True, nil, nil);
end;

end.
