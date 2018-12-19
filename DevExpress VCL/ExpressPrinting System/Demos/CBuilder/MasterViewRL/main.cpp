//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxMasterView"
#pragma link "dxMasterViewColumns"
#pragma link "CSPIN"
#pragma link "cspin"
#pragma link "dxPSCore"
#pragma link "dxPSdxMVLnk"
#pragma link "dxBkgnd"
#pragma link "dxPrnDev"
#pragma link "dxPrnPg"
#pragma link "dxPSCompsProvider"
#pragma link "dxPSEdgePatterns"
#pragma link "dxPSEngn"
#pragma link "dxPSFillPatterns"
#pragma link "dxPSGlbl"
#pragma link "dxPSUtl"
#pragma link "dxWrap"
#pragma resource "*.dfm"

TfmMain *fmMain;
TdxMasterViewLevel *CurrentLevel;
TdxMasterViewColumn *CurrentColumn;
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::btncustomizeClick(TObject *Sender)
{
  MasterView->Customizing = !MasterView->Customizing;
}
//---------------------------------------------------------------------------
//Calc fields for tbEvents
void __fastcall TfmMain::tbEventsCalcFields(TDataSet *DataSet)
{
  tbEventsPriority->AsInteger = fmodl(tbEvents->RecNo, 3);

  if (tbEvents->FieldByName("Ticket_price")->AsFloat < 10)
    if (tbEvents->FieldByName("Ticket_price")->AsFloat > 0)
      tbEvents->FieldByName("Low_Price")->AsString = "Y";
    else
      tbEvents->FieldByName("Low_Price")->AsString = "Null";
  else
    tbEvents->FieldByName("Low_Price")->AsString = "N";
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::FormCreate(TObject *Sender)
{
  //Set the MasterView options
  chbAutoColumnWidth->Checked = MasterView->OptionsView.Contains(movAutoColumnWidth);
  chbMultiSelect->Checked = MasterView->OptionsBehavior.Contains(mobMultiSelect);
  chbUseIndent->Checked = MasterView->OptionsBehavior.Contains(mobUseIndent);
  chbAnimation->Checked = MasterView->OptionsView.Contains(movAnimation);
  chbDrawEndEllipsis->Checked = MasterView->OptionsView.Contains(movDrawEndEllipsis);;
  chbHideFocusRect->Checked = MasterView->OptionsView.Contains(movHideFocusRect);
  chbHideSelection->Checked = MasterView->OptionsView.Contains(movHideSelection);
  chbKeepColumnWidths->Checked = MasterView->OptionsView.Contains(movKeepColumnWidths);
  chbTransparentDragAndDrop->Checked = MasterView->OptionsView.Contains(movTransparentDragAndDrop);
  chbUseBitmap->Checked = MasterView->OptionsView.Contains(movUseBitmap);
  chbUseBitmapToDrawPreview->Checked = MasterView->OptionsView.Contains(movUseBitmapToDrawPreview);

  //Set the current level
  cmbLevels->ItemIndex = 0;
  cmbLevelsChange(cmbLevels);

  //Set field names for cmbFieldname and fill cmbColumns
  FillColumnsCombos(CurrentLevel);

  //Set the current column
  cmbColumnsChange(cmbColumns);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::btnFullCollapseClick(TObject *Sender)
{
  MasterView->FullCollapse();
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::btnFullExpandClick(TObject *Sender)
{
  MasterView->FullExpand();
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::chbDblClkExpandingClick(TObject *Sender)
{
    switch (((TCheckBox*)Sender)->Tag) {
      case 0 : if (((TCheckBox*)Sender)->Checked)
                 CurrentLevel->OptionsBehavior = (CurrentLevel->OptionsBehavior + TdxMasterViewLevelOptionsBehavior()) << lobDblClkExpanding;
               else
                 CurrentLevel->OptionsBehavior = (CurrentLevel->OptionsBehavior + TdxMasterViewLevelOptionsBehavior()) >> lobDblClkExpanding; break;
      case 1 : if (((TCheckBox*)Sender)->Checked)
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) << locColumnMoving;
               else
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locColumnMoving; break;
      case 2 : if (((TCheckBox*)Sender)->Checked)
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locColumnHiding;
               else
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locColumnHiding; break;
      case 3 : if (((TCheckBox*)Sender)->Checked)
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) << locColumnHorSizing;
               else
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locColumnHorSizing; break;
      case 4 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) << locColumnVerSizing;
               else
                  CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locColumnVerSizing; break;
      case 5 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) << locColumnSorting;
               else
                  CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locColumnSorting;  break;
      case 6 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) << locColumnGrouping;
               else
                  CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locColumnGrouping; break;
      case 7 : if (((TCheckBox*)Sender)->Checked)
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) << locHideColumnOnGrouping;
               else
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locHideColumnOnGrouping; break;
      case 8 : if (((TCheckBox*)Sender)->Checked)
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) << locShowColumnOnUngrouping;
               else
                 CurrentLevel->OptionsCustomize = (CurrentLevel->OptionsCustomize + TdxMasterViewLevelOptionsCustomize()) >> locShowColumnOnUngrouping; break;
      case 9 : if (((TCheckBox*)Sender)->Checked)
                 CurrentLevel->OptionsDB = (CurrentLevel->OptionsDB + TdxMasterViewLevelOptionsDB()) << lodSmartLoad;
                else
                 CurrentLevel->OptionsDB = (CurrentLevel->OptionsDB + TdxMasterViewLevelOptionsDB()) >> lodSmartLoad; break;
      case 10 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsDB = (CurrentLevel->OptionsDB + TdxMasterViewLevelOptionsDB()) << lodSmartRefresh;
                else
                  CurrentLevel->OptionsDB = (CurrentLevel->OptionsDB + TdxMasterViewLevelOptionsDB()) >> lodSmartRefresh; break;
      case 11 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsDB = (CurrentLevel->OptionsDB + TdxMasterViewLevelOptionsDB()) << lodSmartReload;
                else
                  CurrentLevel->OptionsDB = (CurrentLevel->OptionsDB + TdxMasterViewLevelOptionsDB()) >> lodSmartReload; break;
      case 12 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovCaption;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovCaption; break;
      case 13 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovFooter;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovFooter; break;
      case 14 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovGrid;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovGrid; break;
      case 15 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovGridWithPreview;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovGridWithPreview; break;
      case 16 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovGroupByBox;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovGroupByBox; break;
      case 17 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovHeader;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovHeader; break;
      case 18 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovOccupyRestSpace;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovOccupyRestSpace; break;
      case 19 : if (((TCheckBox*)Sender)->Checked)
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) << lovPreview;
                else
                  CurrentLevel->OptionsView = (CurrentLevel->OptionsView + TdxMasterViewLevelOptionsView()) >> lovPreview;
  };
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::chbMultiSelectClick(TObject *Sender)
{
    switch (((TCheckBox*)Sender)->Tag) {
      case 0 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsBehavior = (MasterView->OptionsBehavior + TdxMasterViewOptionsBehavior()) << mobMultiSelect;
        else
          MasterView->OptionsBehavior = (MasterView->OptionsBehavior + TdxMasterViewOptionsBehavior()) >> mobMultiSelect; break;
      case 1 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsBehavior = (MasterView->OptionsBehavior + TdxMasterViewOptionsBehavior()) << mobUseIndent;
        else
          MasterView->OptionsBehavior = (MasterView->OptionsBehavior + TdxMasterViewOptionsBehavior()) >> mobUseIndent; break;
      case 2 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movAnimation;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movAnimation; break;
      case 3 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movAutoColumnWidth;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movAutoColumnWidth; break;
      case 4 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movDrawEndEllipsis;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movDrawEndEllipsis; break;
      case 5 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movHideFocusRect;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movHideFocusRect; break;
      case 6 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movHideSelection;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movHideSelection; break;
      case 7 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movKeepColumnWidths;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movKeepColumnWidths; break;
      case 8 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movTransparentDragAndDrop;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movTransparentDragAndDrop; break;
      case 9 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movUseBitmap;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movUseBitmap; break;
     case 10 : if (((TCheckBox*)Sender)->Checked)
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) << movUseBitmapToDrawPreview;
        else
          MasterView->OptionsView = (MasterView->OptionsView + TdxMasterViewOptionsView()) >> movUseBitmapToDrawPreview;
  };
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbLevelsChange(TObject *Sender)
{
 switch (((TComboBox*)Sender)->ItemIndex) {
    case 0 : CurrentLevel = MasterViewLevel1; break;
    case 1 : CurrentLevel = MasterViewLevel2;
  };

  //Set field names for cmbFieldname and fill cmbColumns
  FillColumnsCombos(CurrentLevel);
  cmbColumnsChange(cmbColumns);

  //Set options values for new level
  UpdateLevelOptions();
}
//---------------------------------------------------------------------------

// Update options for the CurrentLevel
void __fastcall TfmMain::UpdateLevelOptions()
{
  if (CurrentLevel != NULL) {
    chbDblClkExpanding->Checked = CurrentLevel->OptionsBehavior.Contains(lobDblClkExpanding);
    chbColumnMoving->Checked = CurrentLevel->OptionsCustomize.Contains(locColumnMoving);
    chbColumnHiding->Checked = CurrentLevel->OptionsCustomize.Contains(locColumnHiding);
    chbColumnHorSizing->Checked = CurrentLevel->OptionsCustomize.Contains(locColumnHorSizing);
    chbColumnVerSizing->Checked = CurrentLevel->OptionsCustomize.Contains(locColumnVerSizing);
    chbColumnSorting->Checked = CurrentLevel->OptionsCustomize.Contains(locColumnSorting);
    chbColumnGrouping->Checked = CurrentLevel->OptionsCustomize.Contains(locColumnGrouping);
    chbHideColumnOnGrouping->Checked = CurrentLevel->OptionsCustomize.Contains(locHideColumnOnGrouping);
    chbShowColumnOnUngrouping->Checked = CurrentLevel->OptionsCustomize.Contains(locShowColumnOnUngrouping);

    chbSmartLoad->Checked = CurrentLevel->OptionsDB.Contains(lodSmartLoad);
    chbSmartRefresh->Checked = CurrentLevel->OptionsDB.Contains(lodSmartRefresh);
    chbSmartReload->Checked = CurrentLevel->OptionsDB.Contains(lodSmartReload);

    chbCaption->Checked = CurrentLevel->OptionsView.Contains(lovCaption);
    chbFooter->Checked = CurrentLevel->OptionsView.Contains(lovFooter);
    chbGrid->Checked = CurrentLevel->OptionsView.Contains(lovGrid);
    chbGridWithPreview->Checked = CurrentLevel->OptionsView.Contains(lovGridWithPreview);
    chbGroupByBox->Checked = CurrentLevel->OptionsView.Contains(lovGroupByBox);
    chbHeader->Checked = CurrentLevel->OptionsView.Contains(lovHeader);
    chbOccupyRestSpace->Checked = CurrentLevel->OptionsView.Contains(lovOccupyRestSpace);
    chbPreview->Checked = CurrentLevel->OptionsView.Contains(lovPreview);
  };
};
//---------------------------------------------------------------------------

//Set the current column
void __fastcall TfmMain::cmbColumnsChange(TObject *Sender)
{
  TComboBox *ComboBox = ((TComboBox*)Sender);
  int Index = ComboBox->ItemIndex;
  if (CurrentColumn != NULL)
    CurrentColumn->HeaderStyle = NULL;
  //Set current column
  CurrentColumn = ((TdxMasterViewColumn*)ComboBox->Items->Objects[Index]);
  //Highlight the current column
  CurrentColumn->HeaderStyle = HeaderStyle;
  UpdateColumnOptions();
}
//---------------------------------------------------------------------------

//Set control's values for column tab
void __fastcall TfmMain::UpdateColumnOptions()
{
  if (CurrentColumn != NULL) {
    cmbAlignment->ItemIndex = Integer(TAlignment(CurrentColumn->Alignment));
    edCaption->Text = CurrentColumn->Caption;
    sedColIndex->Value = CurrentColumn->ColIndex;
    cmbFieldName->ItemIndex = cmbFieldName->Items->IndexOf(CurrentColumn->FieldName);
    cmbHeaderAlignment->ItemIndex = Integer(TAlignment(CurrentColumn->HeaderAlignment));
    cmbGlyphAlignment->ItemIndex = Integer(TAlignment(CurrentColumn->HeaderGlyphAlignment));
    chbMultiLine->Checked = CurrentColumn->MultiLine;
    sedMaxRowCount->Value = CurrentColumn->MaxRowCount;
    sedMinRowCount->Value = CurrentColumn->MinRowCount;
    sedMaxWidth->Value = CurrentColumn->MaxWidth;
    sedMinWidth->Value = CurrentColumn->MinWidth;
    sedRowCount->Value = CurrentColumn->RowCount;
    sedRowIndex->Value = CurrentColumn->RowIndex;
    chbVisible->Checked = CurrentColumn->Visible;

    //Set column options
    chbGrouping->Checked = CurrentColumn->Options.Contains(coGrouping);
    chbHidden->Checked = CurrentColumn->Options.Contains(coHidden);
    chbHorSizing->Checked = CurrentColumn->Options.Contains(coHorSizing);
    chbMoving->Checked = CurrentColumn->Options.Contains(coMoving);
    chbSorting->Checked = CurrentColumn->Options.Contains(coSorting);
    chbVerSizing->Checked = CurrentColumn->Options.Contains(coVerSizing);

    //Set summary options
    cmbSummaryFieldName->ItemIndex = cmbSummaryFieldName->Items->IndexOf(CurrentColumn->SummaryFieldName);
    edSummaryFormat->Text = CurrentColumn->SummaryFormat;
    cmbSummaryType->ItemIndex =  Integer(CurrentColumn->SummaryType);
    cmbFooterAlignment->ItemIndex = Integer(CurrentColumn->FooterAlignment);

    //Set graphic column options
    if (dynamic_cast <TdxMasterViewGraphicColumn*> (CurrentColumn)) {
      chbBlendedSelection->Enabled = true;
      chbCustomGraphic->Enabled = true;
      chbStretch->Enabled = true;
      cmbTransparency->Enabled = true;
      TdxMasterViewGraphicColumn *gcol = ((TdxMasterViewGraphicColumn*)CurrentColumn);
        chbBlendedSelection->Checked = gcol->BlendedSelection;
        chbCustomGraphic->Checked = gcol->CustomGraphic;
        chbStretch->Checked = gcol->Stretch;
        cmbTransparency->ItemIndex = Integer(gcol->Transparency);
    }
    else
    {
      chbBlendedSelection->Enabled = false;
      chbCustomGraphic->Enabled = false;
      chbStretch->Enabled = false;
      cmbTransparency->Enabled = false;
    };

    //Set image cilumn option
    if (dynamic_cast <TdxMasterViewImageColumn*> (CurrentColumn)) {
      chbShowDescription->Enabled = true;
      chbShowDescription->Checked = ((TdxMasterViewImageColumn*)CurrentColumn)->ShowDescription;
    }
    else
      chbShowDescription->Enabled = false;

    //Set check column options
    if (dynamic_cast <TdxMasterViewCheckColumn*> (CurrentColumn)) {
      chbBorder3D->Enabled = true;
      edDisplayChecked->Enabled = true;
      edDisplayNull->Enabled = true;
      edDisplayUnchecked->Enabled = true;
      cmbShowNullFieldStyle->Enabled = true;
      edValueChecked->Enabled = true;
      edValueUnchecked->Enabled = true;
      TdxMasterViewCheckColumn *chcol = ((TdxMasterViewCheckColumn*)CurrentColumn);
        chbBorder3D->Checked = chcol->Border3D;
        edDisplayChecked->Text = chcol->DisplayChecked;
        edDisplayNull->Text = chcol->DisplayNull;
        edDisplayUnchecked->Text = chcol->DisplayUnchecked;
        cmbShowNullFieldStyle->ItemIndex = Integer(chcol->ShowNullFieldStyle);
        edValueChecked->Text = chcol->ValueChecked;
        edValueUnchecked->Text = chcol->ValueUnchecked;
    }
    else
    {
      chbBorder3D->Enabled = false;
      edDisplayChecked->Enabled = false;
      edDisplayNull->Enabled = false;
      edDisplayUnchecked->Enabled = false;
      cmbShowNullFieldStyle->Enabled = false;
      edValueChecked->Enabled = false;
      edValueUnchecked->Enabled = false;
    };
  };
};
//---------------------------------------------------------------------------
void __fastcall TfmMain::btnGlyphClick(TObject *Sender)
{
  if (odpOpenGlyph->Execute()) {
    Graphics::TBitmap *B = new Graphics::TBitmap();
    try
    {
      B->LoadFromFile(odpOpenGlyph->FileName);
      if (CurrentColumn != NULL)
        CurrentColumn->HeaderGlyph = B;
    }
    __finally
    {
      B->Free();
    };
  }
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::chbGroupingClick(TObject *Sender)
{
    switch (((TCheckBox*)Sender)->Tag) {
      case 0 : if (((TCheckBox*)Sender)->Checked)
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) << coGrouping;
        else
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) >> coGrouping; break;
      case 1 : if (((TCheckBox*)Sender)->Checked)
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) << coHidden;
        else
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) >> coHidden; break;
      case 2 : if (((TCheckBox*)Sender)->Checked)
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) << coHorSizing;
        else
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) >> coHorSizing; break;
      case 3 : if (((TCheckBox*)Sender)->Checked)
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) << coMoving;
        else
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) >> coMoving; break;
      case 4 : if (((TCheckBox*)Sender)->Checked)
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) << coSorting;
        else
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) >> coSorting; break;
      case 5 : if (((TCheckBox*)Sender)->Checked)
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) << coVerSizing;
        else
          CurrentColumn->Options = (CurrentColumn->Options + TdxMasterViewColumnOptions()) >> coVerSizing; break;
    };
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbAlignmentChange(TObject *Sender)
{
  CurrentColumn->Alignment = (TAlignment)((TComboBox*)Sender)->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::edCaptionChange(TObject *Sender)
{
  CurrentColumn->Caption = ((TEdit*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::sedColIndexChange(TObject *Sender)
{
  CurrentColumn->ColIndex = ((TCSpinEdit*)Sender)->Value;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbFieldNameChange(TObject *Sender)
{
  CurrentColumn->FieldName = ((TComboBox*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbHeaderAlignmentChange(TObject *Sender)
{
  CurrentColumn->HeaderAlignment = (TAlignment)(((TComboBox*)Sender)->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbGlyphAlignmentChange(TObject *Sender)
{
  CurrentColumn->HeaderGlyphAlignment = (TAlignment)((TComboBox*)Sender)->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::chbMultiLineClick(TObject *Sender)
{
  CurrentColumn->MultiLine = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::sedMaxRowCountChange(TObject *Sender)
{
  CurrentColumn->MaxRowCount = ((TCSpinEdit*)Sender)->Value;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::sedMinRowCountChange(TObject *Sender)
{
  CurrentColumn->MinRowCount = ((TCSpinEdit*)Sender)->Value;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::sedMaxWidthChange(TObject *Sender)
{
  CurrentColumn->MaxWidth = ((TCSpinEdit*)Sender)->Value;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::sedMinWidthChange(TObject *Sender)
{
  CurrentColumn->MinWidth = ((TCSpinEdit*)Sender)->Value;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::sedRowCountChange(TObject *Sender)
{
  CurrentColumn->RowCount = ((TCSpinEdit*)Sender)->Value;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::sedRowIndexChange(TObject *Sender)
{
  CurrentColumn->RowIndex = ((TCSpinEdit*)Sender)->Value;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::FillColumnsCombos(TdxMasterViewLevel *Level)
{
  if (Level != NULL) {
    //Fill the cmbColumns
    cmbColumns->Clear();
    for (int i = 0; i < Level->ColumnCount; i++)
      cmbColumns->Items->AddObject(Level->Columns[i]->Name,Level->Columns[i]);
    cmbColumns->ItemIndex = 0;

    //Set field names for cmbFieldname and cmbSummaryFieldName
    cmbFieldName->Items->Clear();
    cmbSummaryFieldName->Items->Clear();
    for (int  i = 0; i < Level->DataSet->FieldCount; i++)
    #if __BORLANDC__  > 0x530
      cmbFieldName->Items->AddObject(Level->DataSet->Fields->Fields[i]->FieldName,Level->DataSet->Fields->Fields[i]);
    #else
      cmbFieldName->Items->AddObject(Level->DataSet->Fields[i]->FieldName,Level->DataSet->Fields[i]);
    #endif
    cmbSummaryFieldName->Items = cmbFieldName->Items;
  };
};
//---------------------------------------------------------------------------

void __fastcall TfmMain::chbVisibleClick(TObject *Sender)
{
  CurrentColumn->Visible = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------
//Graphic column options OnClick
void __fastcall TfmMain::chbBlendedSelectionClick(TObject *Sender)
{
  TdxMasterViewGraphicColumn& grcol = dynamic_cast<TdxMasterViewGraphicColumn&>(*CurrentColumn);
    switch (((TCheckBox*)Sender)->Tag ){
      case 0 : grcol.BlendedSelection = ((TCheckBox*)Sender)->Checked; break;
      case 1 : grcol.CustomGraphic = ((TCheckBox*)Sender)->Checked; break;
      case 2 : grcol.Stretch = ((TCheckBox*)Sender)->Checked; break;
    };
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::chbShowDescriptionClick(TObject *Sender)
{
  TdxMasterViewImageColumn& imcol = dynamic_cast<TdxMasterViewImageColumn&>(*CurrentColumn);
  imcol.ShowDescription = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::chbBorder3DClick(TObject *Sender)
{
  TdxMasterViewCheckColumn& chcol = dynamic_cast<TdxMasterViewCheckColumn&>(*CurrentColumn);
  chcol.Border3D = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::edDisplayCheckedChange(TObject *Sender)
{
  TdxMasterViewCheckColumn& chcol = dynamic_cast<TdxMasterViewCheckColumn&>(*CurrentColumn);
  chcol.DisplayChecked = ((TEdit*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::edDisplayNullChange(TObject *Sender)
{
  TdxMasterViewCheckColumn& chcol = dynamic_cast<TdxMasterViewCheckColumn&>(*CurrentColumn);
  chcol.DisplayNull = ((TEdit*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::edDisplayUncheckedChange(TObject *Sender)
{
  TdxMasterViewCheckColumn& chcol = dynamic_cast<TdxMasterViewCheckColumn&>(*CurrentColumn);
  chcol.DisplayUnchecked = ((TEdit*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbShowNullFieldStyleChange(TObject *Sender)
{
  TdxMasterViewCheckColumn& chcol = dynamic_cast<TdxMasterViewCheckColumn&>(*CurrentColumn);
  chcol.ShowNullFieldStyle = TdxMVShowNullFieldStyle(((TComboBox*)Sender)->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::edValueCheckedChange(TObject *Sender)
{
  TdxMasterViewCheckColumn& chcol = dynamic_cast<TdxMasterViewCheckColumn&>(*CurrentColumn);
  chcol.ValueChecked = ((TEdit*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::edValueUncheckedChange(TObject *Sender)
{
  TdxMasterViewCheckColumn& chcol = dynamic_cast<TdxMasterViewCheckColumn&>(*CurrentColumn);
  chcol.ValueUnchecked = ((TEdit*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbSummaryFieldNameChange(TObject *Sender)
{
  CurrentColumn->SummaryFieldName = ((TComboBox*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::edSummaryFormatChange(TObject *Sender)
{
  CurrentColumn->SummaryFormat = ((TEdit*)Sender)->Text;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbSummaryTypeChange(TObject *Sender)
{
  CurrentColumn->SummaryType = TdxMasterViewSummaryType(((TComboBox*)Sender)->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbFooterAlignmentChange(TObject *Sender)
{
  CurrentColumn->FooterAlignment = TAlignment(((TComboBox*)Sender)->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cmbTransparencyChange(TObject *Sender)
{
  TdxMasterViewGraphicColumn& grcol = dynamic_cast<TdxMasterViewGraphicColumn&>(*CurrentColumn);
  grcol.Transparency = TdxMasterViewTransparency(cmbTransparency->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::btnPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->Preview(True, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::btnPrintClick(TObject *Sender)
{
  dxComponentPrinter1->Print(True, NULL, NULL);
}
//---------------------------------------------------------------------------

