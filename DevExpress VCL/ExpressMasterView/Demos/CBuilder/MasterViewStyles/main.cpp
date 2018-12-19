//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxMasterView"
#pragma resource "*.dfm"
TfmMain *fmMain;
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
//set color for style
void __fastcall TfmMain::btnColorClick(TObject *Sender)
{
  if (CurrentStyle != NULL) {
    ColorDialog->Color = CurrentStyle->Color;
    if (ColorDialog->Execute()) {
      CurrentStyle->Color = ColorDialog->Color;
      StyleControlsUpdate();
    };
  }  
}
//---------------------------------------------------------------------------
//set font for style
void __fastcall TfmMain::btnFontClick(TObject *Sender)
{
  if (CurrentStyle != NULL) {
    FontDialog->Font = CurrentStyle->Font;
    if (FontDialog->Execute()) {
      CurrentStyle->Font = FontDialog->Font;
      StyleControlsUpdate();
    };
  }  
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::FormCreate(TObject *Sender)
{
  //fill the cmbStyle
  for (int i = 0; i < MasterView->StyleCount; i++) {
    TdxMasterViewStyle *S = MasterView->Styles[i];
    cmbStyles->Items->AddObject(S->Name, S);
  };
  cmbStyles->ItemIndex = 0;
  cmbStylesChange(NULL);
  //assign cmbStyles with
  AssignStyles();

  //Set the current level
  cmbLevels->ItemIndex = 0;
  cmbLevelsChange(cmbLevels);
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cmbStylesChange(TObject *Sender)
{
  if (cmbStyles->Items->Count > 0)
    CurrentStyle = (TdxMasterViewStyle*)cmbStyles->Items->Objects[cmbStyles->ItemIndex];
  else
    CurrentStyle = NULL;
  StyleControlsUpdate();
}
//---------------------------------------------------------------------------
//update visual controls tied to the current style
void __fastcall TfmMain::StyleControlsUpdate()
{
  plColor->Color = clBtnFace;
  plAnotherColor->Color = clBtnFace;
  plColor->Caption = "";
  plAnotherColor->Caption = "";

  if (CurrentStyle != NULL) {
    //set another color, if it was assigned
    if (CurrentStyle->AssignedValues.Contains(svAnotherColor))
      plAnotherColor->Color = CurrentStyle->AnotherColor;
    //set a color, if it was assigned
    if (CurrentStyle->AssignedValues.Contains(svColor))
      plColor->Color = CurrentStyle->Color;
    //set a font, if it was assigned
    if (CurrentStyle->AssignedValues.Contains(svFont)) {
      plColor->Font = CurrentStyle->Font;
      plColor->Caption = "Font";
      plAnotherColor->Font = CurrentStyle->Font;
      plAnotherColor->Caption = "Font";
    };
  }
  else
    cmbStyles->Items->Clear();
};
//---------------------------------------------------------------------------
void __fastcall TfmMain::btnAnotherColorClick(TObject *Sender)
{
  if (CurrentStyle != NULL) {
    ColorDialog->Color = CurrentStyle->AnotherColor;
    if (ColorDialog->Execute())
    {
      CurrentStyle->AnotherColor = ColorDialog->Color;
      StyleControlsUpdate();
    };
  }  
}
//---------------------------------------------------------------------------
//create a new style
void __fastcall TfmMain::btnNewClick(TObject *Sender)
{
  CurrentStyle = new TdxMasterViewStyle(MasterView);
  CurrentStyle->Name = "Style"+IntToStr(cmbStyles->Items->Count + 1);
  cmbStyles->Items->AddObject(CurrentStyle->Name,CurrentStyle);
  cmbStyles->ItemIndex = cmbStyles->Items->Count - 1;
  cmbStylesChange(NULL);

  int LevelItemIndex, ColumnItemIndex;
  if (cmbLevelStyle->Items->Strings[cmbLevelStyle->ItemIndex] != "None")
    LevelItemIndex = cmbLevelStyle->ItemIndex;
  else
    LevelItemIndex = cmbLevelStyle->ItemIndex + 1;
  if (cmbColumnStyle->Items->Strings[cmbColumnStyle->ItemIndex] != "None")
    ColumnItemIndex = cmbColumnStyle->ItemIndex;
  else
   ColumnItemIndex = cmbColumnStyle->ItemIndex + 1;
  AssignStyles();
  cmbLevelStyle->ItemIndex = LevelItemIndex;
  cmbColumnStyle->ItemIndex = ColumnItemIndex;
}
//---------------------------------------------------------------------------
//delete the current style
void __fastcall TfmMain::btnDeleteClick(TObject *Sender)
{
  cmbStyles->Items->Delete(cmbStyles->ItemIndex);
  CurrentStyle->Free();
  CurrentStyle = NULL;
  cmbStyles->ItemIndex = cmbStyles->Items->Count - 1;
  cmbStylesChange(cmbStyles);

  int LevelItemIndex, ColumnItemIndex;
  if (cmbLevelStyle->Items->Strings[cmbLevelStyle->ItemIndex] != "None")
    LevelItemIndex = cmbLevelStyle->ItemIndex;
  else
    LevelItemIndex = cmbLevelStyle->ItemIndex - 1;
  if (cmbColumnStyle->Items->Strings[cmbColumnStyle->ItemIndex] != "None")
    ColumnItemIndex = cmbColumnStyle->ItemIndex;
  else
    ColumnItemIndex = cmbColumnStyle->ItemIndex - 1;
  AssignStyles();
  cmbLevelStyle->ItemIndex = LevelItemIndex;
  cmbColumnStyle->ItemIndex = ColumnItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cmbLevelsChange(TObject *Sender)
{
  switch (((TComboBox*)Sender)->ItemIndex) {
    case 0 : CurrentLevel = Level1; break;
    case 1 : CurrentLevel = Level2; break;
  };

  //fill cmbColumns
  FillColumnsCombos(CurrentLevel);
  cmbColumnsChange(cmbColumns);

  //set the cmbLevelElements value
  cmbLevelElements->ItemIndex = 0;
  cmbLevelElementsChange(cmbLevelElements);
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
  };
};

void __fastcall TfmMain::cmbColumnsChange(TObject *Sender)
{
  TComboBox *ComboBox = (TComboBox*)Sender;
  int Index = ComboBox->ItemIndex;
  //Set current column
  CurrentColumn = &dynamic_cast<TdxMasterViewColumn&>(*ComboBox->Items->Objects[Index]);
  //set the cmbColumnElements value
  cmbColumnElements->ItemIndex = 0;
  cmbColumnElementsChange(cmbColumnElements);

}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cmbLevelElementsChange(TObject *Sender)
{
    switch (cmbLevelElements->ItemIndex) {
      case 0 : if (CurrentLevel->CaptionStyle != NULL)
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf(CurrentLevel->CaptionStyle->Name);
        else
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf("None"); break;
      case 1 : if (CurrentLevel->ContentStyle != NULL)
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf(CurrentLevel->ContentStyle->Name);
        else
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf("None"); break;
      case 2 : if (CurrentLevel->FooterStyle != NULL)
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf(CurrentLevel->FooterStyle->Name);
        else
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf("None"); break;
      case 3 : if (CurrentLevel->GroupByBoxStyle != NULL)
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf(CurrentLevel->GroupByBoxStyle->Name);
        else
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf("None"); break;
      case 4 : if (CurrentLevel->GroupStyle != NULL)
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf(CurrentLevel->GroupStyle->Name);
        else
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf("None"); break;
      case 5 : if (CurrentLevel->HeaderStyle != NULL)
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf(CurrentLevel->HeaderStyle->Name);
        else
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf("None"); break;
      case 6 : if (CurrentLevel->PreviewStyle != NULL)
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf(CurrentLevel->PreviewStyle->Name);
        else
          cmbLevelStyle->ItemIndex = cmbLevelStyle->Items->IndexOf("None"); break;
    };
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cmbColumnElementsChange(TObject *Sender)
{
  switch (cmbColumnElements->ItemIndex) {
    case 0 : if (CurrentColumn->ContentStyle != NULL)
          cmbColumnStyle->ItemIndex = cmbColumnStyle->Items->IndexOf(CurrentColumn->ContentStyle->Name);
        else
          cmbColumnStyle->ItemIndex = cmbColumnStyle->Items->IndexOf("None"); break;
    case 1 : if (CurrentColumn->FooterStyle != NULL)
          cmbColumnStyle->ItemIndex = cmbColumnStyle->Items->IndexOf(CurrentColumn->FooterStyle->Name);
        else
          cmbColumnStyle->ItemIndex = cmbColumnStyle->Items->IndexOf("None"); break;
    case 2 : if (CurrentColumn->HeaderStyle != NULL)
          cmbColumnStyle->ItemIndex = cmbColumnStyle->Items->IndexOf(CurrentColumn->HeaderStyle->Name);
        else
          cmbColumnStyle->ItemIndex = cmbColumnStyle->Items->IndexOf("None"); break;
  };
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cmbLevelStyleChange(TObject *Sender)
{
   switch (cmbLevelElements->ItemIndex) {
     case 0 : CurrentLevel->CaptionStyle = (TdxMasterViewStyle*)cmbLevelStyle->Items->Objects[cmbLevelStyle->ItemIndex]; break;
     case 1 : CurrentLevel->ContentStyle = (TdxMasterViewStyle*)cmbLevelStyle->Items->Objects[cmbLevelStyle->ItemIndex]; break;
     case 2 : CurrentLevel->FooterStyle = (TdxMasterViewStyle*)cmbLevelStyle->Items->Objects[cmbLevelStyle->ItemIndex]; break;
     case 3 : CurrentLevel->GroupByBoxStyle = (TdxMasterViewStyle*)cmbLevelStyle->Items->Objects[cmbLevelStyle->ItemIndex]; break;
     case 4 : CurrentLevel->GroupStyle = (TdxMasterViewStyle*)cmbLevelStyle->Items->Objects[cmbLevelStyle->ItemIndex]; break;
     case 5 : CurrentLevel->HeaderStyle = (TdxMasterViewStyle*)cmbLevelStyle->Items->Objects[cmbLevelStyle->ItemIndex]; break;
     case 6 : CurrentLevel->PreviewStyle = (TdxMasterViewStyle*)cmbLevelStyle->Items->Objects[cmbLevelStyle->ItemIndex]; break;
   };
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cmbColumnStyleChange(TObject *Sender)
{
  switch (cmbColumnElements->ItemIndex) {
    case 0 : CurrentColumn->ContentStyle = (TdxMasterViewStyle*)cmbColumnStyle->Items->Objects[cmbColumnStyle->ItemIndex]; break;
    case 1 : CurrentColumn->FooterStyle = (TdxMasterViewStyle*)cmbColumnStyle->Items->Objects[cmbColumnStyle->ItemIndex]; break;
    case 2 : CurrentColumn->HeaderStyle = (TdxMasterViewStyle*)cmbColumnStyle->Items->Objects[cmbColumnStyle->ItemIndex]; break;
  };
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::btnCustomizeClick(TObject *Sender)
{
  MasterView->Customizing = !(MasterView->Customizing);
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::AssignStyles()
{
  cmbLevelStyle->Items->Assign(cmbStyles->Items);
  cmbLevelStyle->Items->Add("None");
  cmbColumnStyle->Items->Assign(cmbStyles->Items);
  cmbColumnStyle->Items->Add("None");
};
//---------------------------------------------------------------------------
