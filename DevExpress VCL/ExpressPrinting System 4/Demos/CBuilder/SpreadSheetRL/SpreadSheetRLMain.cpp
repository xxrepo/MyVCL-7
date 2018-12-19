//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdlib.h>
#pragma hdrstop

#include "SpreadSheetRLMain.h"
#include "string.h"
#include "SpreadSheetRLModify.h"
#include "dxPScxSSLnk.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxSSheet"
#pragma link "dxPSBaseGridLnk"
#pragma link "dxPSCore"
#pragma link "dxPScxSSLnk"
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
#pragma link "cxGraphics"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "cxDrawTextUtils"
#pragma link "dxPScxEditorProducers"
#pragma link "dxPScxExtEditorProducers"
#pragma link "dxPScxPageControlProducer"
#pragma link "dxPSPDFExport"
#pragma link "dxPSPDFExportCore"
#pragma link "dxPSPrVwStd"
#pragma link "DemoBasicMain"
#pragma resource "*.dfm"
TSpreadSheetRLForm *SpreadSheetRLForm;
//---------------------------------------------------------------------------
__fastcall TSpreadSheetRLForm::TSpreadSheetRLForm(TComponent* Owner)
  : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSpreadSheetRLForm::SetCellText(int ACol, int ARow, String AText)
{
  TcxSSCellObject *CellObject;
  // get a cell object for the request col and row
  CellObject = cxSpreadBook->ActiveSheet->GetCellObject(ACol, ARow);
  try {
//    edtCellEdit->Text = CellObject->Text;
    CellObject->SetCellText(AText, true);
  }
  __finally {
    delete CellObject;                                      // and free it
  }
}

void __fastcall TSpreadSheetRLForm::SetCellDate(int ACol, int ARow, TDateTime ADate)
{
  TcxSSCellObject *ObjectCell;
  // get a cell object for the request col and row
  ObjectCell = cxSpreadBook->ActiveSheet->GetCellObject(ACol, ARow);
    try {
      ObjectCell->DateTime = ADate;
    }
    __finally {
      delete ObjectCell;                                    // free it
    }
}

void __fastcall TSpreadSheetRLForm::SetCellFont(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                        TFontStyles AStyle, int ASize)
{
  TcxSSCellObject *ObjectCell;
  for(int i = ALeftCol; i <= ARightCol; i++)                // for each column specified
    for(int j = ATopRow; j <= ABottomRow; j++) {            // form each row specified
      ObjectCell = cxSpreadBook->ActiveSheet->GetCellObject(i, j); // get the cell
      try {
        ObjectCell->Style->Font->Style = AStyle;            // set the font style
        ObjectCell->Style->Font->Size = ASize;              // and size
      }
      __finally {
        delete ObjectCell;                                  // free it
      }
    }
}

void __fastcall TSpreadSheetRLForm::SetCellPattern(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                           Word ABackground, Word AForeground, TcxSSFillStyle AFillStyle)
{
  TcxSSCellObject *ObjectCell;
  for(int i = ALeftCol; i <= ARightCol; i++)                // for each column specified
    for(int j = ATopRow; j <= ABottomRow; j++) {            // form each row specified
      ObjectCell = cxSpreadBook->ActiveSheet->GetCellObject(i, j);  // get the cell
      try {
        ObjectCell->Style->Brush->BackgroundColor = ABackground;    // set the specified background
        ObjectCell->Style->Brush->ForegroundColor = AForeground;    //               and foreground colour
        ObjectCell->Style->Brush->Style = AFillStyle;               //               and fill style
      }
      __finally {
        delete ObjectCell;
      }
   }
}

void __fastcall TSpreadSheetRLForm::SetCellFormat(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow, Word
                          AFormat)
{
  TcxSSCellObject *ObjectCell;
  for(int i = ALeftCol; i <= ARightCol; i++)                // for each column specified
    for(int j = ATopRow; j <= ABottomRow; j++) {            // form each row specified
      ObjectCell = cxSpreadBook->ActiveSheet->GetCellObject(i, j); // get the cell
      try {
        ObjectCell->Style->Format = AFormat;                // set the specified cell format
      }
      __finally {
        delete ObjectCell;
      }
   }
}

void __fastcall TSpreadSheetRLForm::SetCellAlignment(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                             TcxHorzTextAlign AHorzAlign, TcxVertTextAlign AVertAlign)
{
  TcxSSCellObject *ObjectCell;
  for(int i = ALeftCol; i <= ARightCol; i++)                // for each column specified
    for(int j = ATopRow; j <= ABottomRow; j++) {            // form each row specified
      ObjectCell = cxSpreadBook->ActiveSheet->GetCellObject(i, j); // get the cell
      try {
        ObjectCell->Style->HorzTextAlign = AHorzAlign;      // set the specified horizontal text alignment
        ObjectCell->Style->VertTextAlign = AVertAlign;      // and vertical alignment
      }
      __finally {
        delete ObjectCell;
      }
   }
}

void __fastcall TSpreadSheetRLForm::SetCellBorders(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                           int AEdge, TcxSSEdgeLineStyle AStyle)
{
  TcxSSCellObject *ObjectCell;
  for(int i = ALeftCol; i <= ARightCol; i++)                // for each column specified
    for(int j = ATopRow; j <= ABottomRow; j++) {            // form each row specified
      ObjectCell = cxSpreadBook->ActiveSheet->GetCellObject(i, j); // get the cell
      try {
        switch (AEdge) {
          case 0: ObjectCell->Style->Borders->Left->Style = AStyle;
          case 1: ObjectCell->Style->Borders->Top->Style = AStyle;
          case 2: ObjectCell->Style->Borders->Right->Style = AStyle;
          case 3: ObjectCell->Style->Borders->Bottom->Style = AStyle;
        }
      }
      __finally {
        delete ObjectCell;
      }
   }
}


void __fastcall TSpreadSheetRLForm::AlwaysEnabled(TObject *Sender)
{
  ((TCustomAction*)Sender)->Enabled = true;
}
//---------------------------------------------------------------------------
void __fastcall TSpreadSheetRLForm::actLoadDataExecute(TObject *Sender)
{
  TCursor CurCursor;
  CurCursor = Screen->Cursor;                               // preserve the current one
  Screen->Cursor = crHourGlass;                             // wait cursor
  try {
    cxSpreadBook->BeginUpdate();                            // turn off updates
    cxSpreadBook->ActivePage = 0;                           // ensure we are looking at the right page
    FCurRow = 3;                                            // set the starting current row
    Query->Open();                                          // open the data
    while (!Query->Eof) {
        SetCellText(0, FCurRow,                             // set the company name
                         Query->FieldByName("CO_NAME")->AsString);
        SetCellText(1,FCurRow,                              // the number of shares
                          Query->FieldByName("SHARES")->AsString);
        SetCellDate(2,FCurRow,                              // the purchase date
                      Query->FieldByName("PUR_DATE")->AsDateTime);
        SetCellText(3,FCurRow,                              // the purchase price
                       Query->FieldByName("PUR_PRICE")->AsString);
        SetCellText(4,FCurRow,                              // calculate the purchase cost = number of shares * purchase price
              Format("=B%d*D%d/100",
              ARRAYOFCONST((FCurRow + 1, FCurRow + 1))));   // [FCurRow+1,FCurRow+1]));
        SetCellText(5,FCurRow,                              // the current price
                       Query->FieldByName("CUR_PRICE")->AsString);
        SetCellText(6,FCurRow,                              // calculate the current valuation = number of shares * current price
              Format("=B%d*F%d/100", ARRAYOFCONST((FCurRow + 1, FCurRow + 1))));
        SetCellText(7,FCurRow,                              // calculate the gain/loss = current valuation - purchase cost
                  Format("=G%d-E%d",ARRAYOFCONST((FCurRow + 1, FCurRow + 1))));
        SetCellText(8,FCurRow,                              // calculate the %age gain/loss
                  Format("=H%d/E%d",ARRAYOFCONST((FCurRow+1,FCurRow+1))));
        Query->Next();                                      // and the next record
        FCurRow++;                                          // and bump the row number
      }
      FCurRow++;
      SetCellText(4, FCurRow,                               // set the formula for the total purchase cost
                       Format("=SUM(E3:E%d)",ARRAYOFCONST((FCurRow - 1))));
      SetCellText(6, FCurRow,                               // total current valuation
                       Format("=SUM(G3:G%d)", ARRAYOFCONST((FCurRow - 1))));
      SetCellText(7, FCurRow,                               // total gain/loss
                       Format("=SUM(H3:H%d)",ARRAYOFCONST((FCurRow - 1))));
      SetCellText(8, FCurRow,                               // and overall percentage
                  Format("=H%d/E%d", ARRAYOFCONST((FCurRow + 1, FCurRow + 1))));
      Query->First();                                       // back to the first record
      cxSpreadBook->ActivePage = 1;                         // and move to the second page
      // and repeat the process to setup the data
      FCurRow = 3;
      while(!Query->Eof){
        SetCellText(0,FCurRow,                              // company name
                         Query->FieldByName("CO_NAME")->AsString);
        SetCellText(1,FCurRow,                              // current price
                       Query->FieldByName("CUR_PRICE")->AsString);
        SetCellText(2,FCurRow,                              // year high
                        Query->FieldByName("YRL_HIGH")->AsString);
        SetCellText(3,FCurRow,                              // year low
                         Query->FieldByName("YRL_LOW")->AsString);
        SetCellText(4,FCurRow,                              // average of Hi/Lo prices
              Format("=(C%d+D%d)/2", ARRAYOFCONST((FCurRow + 1, FCurRow + 1))));
        Query->Next();
        FCurRow++;
      }
      FCurRow++;
      Query->Close();
      FIsApplyFormatting = true;                            // enable the formatting button
    }
  __finally {
    cxSpreadBook->EndUpdate();                              // turn update back on
    cxSpreadBook->Recalc();                                 // auto recalc on
    cxSpreadBook->ActivePage = 0;                           // back to first page
    Screen->Cursor = CurCursor;                             // and back to default cursor
  }
}
//---------------------------------------------------------------------------
void __fastcall TSpreadSheetRLForm::FormShow(TObject *Sender)
{
    cxSpreadBook->BeginUpdate();                            // turn off updates
    try {
      cxSpreadBook->AutoRecalc = false;                     // turn off automatic recalculation
      cxSpreadBook->ActiveSheet->Caption = "Current";       // set the page caption for the first page
      cxSpreadBook->AddSheetPage("HiLo");                   // and a second page and set it's caption
      cxSpreadBook->ActivePage = 0;                         // turn our attention to the first page
      SetCellText(0, 0,"Current Stockholding Valuations");  // set a title in the first column, first row cell
      SetCellText(0, 2,"Company");                          // Col A        - Set column titles
      SetCellText(1, 2,"Holding");                          // B
      SetCellText(2, 2,"Purchased");                        // C
      SetCellText(3, 2,"Price");                            // D
      SetCellText(4, 2,"Cost");                             // E  = B * D
      SetCellText(5, 2,"Value");                            // F
      SetCellText(6, 2,"Worth");                            // G  = B * F
      SetCellText(7, 2,"Gain");                             // H  = G - E
      SetCellText(8, 2,"%age Gain");                        // I  = H / E
      cxSpreadBook->ActivePage          = 1;                            // over now to the second page
      SetCellText(0, 0, "High, Low and Current Stock Prices");  // and repeat the process
      SetCellText(0,2,"Company");                           // Col A
      SetCellText(1,2,"Price");                             //     B
      SetCellText(2,2,"High");                              //     C
      SetCellText(3,2,"Low");                               //     D
      SetCellText(4,2,"Average");                           //     E
      cxSpreadBook->AutoRecalc = true;                      // autorecalc back on
      cxSpreadBook->ActivePage = 0;                         // and back to the first page
      cxSpreadBookSetSelection(NULL, cxSpreadBook->ActiveSheet);     // call to set the current cell and cell contents display
    }
    __finally {
      cxSpreadBook->EndUpdate();
    }
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::cxSpreadBookSetSelection(TObject *Sender,
      TcxSSBookSheet *ASheet)
{
  TcxSSCellObject *CellObject;
  CellObject = cxSpreadBook->ActiveSheet->GetCellObject(ASheet->SelectionRect.Left, ASheet->SelectionRect.Top);
  try {
    FIsUpdate = true;
    edtCellEdit->Text = CellObject->Text;
    pnCellsRect->Caption = GetCellText(ASheet->SelectionRect, cxSpreadBook->R1C1ReferenceStyle);
  }
  __finally {
    delete CellObject;
    FIsUpdate = false;
  }
}
//---------------------------------------------------------------------------
String __fastcall TSpreadSheetRLForm::GetCellText(TRect SelectionRect, bool R1C1)
{
  return cxSpreadBook->CellsNameByRef(cxSpreadBook->ActivePage, SelectionRect, R1C1);
}

void __fastcall TSpreadSheetRLForm::actApplyFormattingExecute(TObject *Sender)
{
  TcxSSHeader *CHeader, *RHeader;
  TCursor CurCursor = Screen->Cursor;                       // preserve the current cursor
  Screen->Cursor = crHourGlass;                             // wait cursor
  FIsSaveSpreadSheet = false;
  cxSpreadBook->BeginUpdate();
  try {
    cxSpreadBook->ActivePage = 0;                           // ensure we are looking at the first page
    // Firstly by setting the column widths
    CHeader = cxSpreadBook->ActiveSheet->Cols;
    CHeader->Size[0] = 140;
    for(int i = 1; i <= 8; i++)
      CHeader->Size[i] =  80;
    // and then the Row heights for the title and column descriptors
    RHeader = cxSpreadBook->ActiveSheet->Rows;
    RHeader->Size[0] =  30;
    RHeader->Size[2] =  30;
    // and how about some cell formatting
    // setting the title and column header fonts

    SetCellFont(0, 0, 0, 0, TFontStyles() << fsBold << fsUnderline, 12);
    // and now adding some cell shading
    // for the sheet title
    SetCellPattern(0, 0, 8, 1, 16, 1, fsSolid);
   // for the column headers
    SetCellPattern(0, 2, 8, 2, 23, 1, fsSolid);
    // and the company names
    SetCellPattern(0, 2, 0, FCurRow - 2, 23, 1, fsSolid);
    // and now some number formatting
    SetCellFormat(1,3,1,FCurRow-1, 3);                      // Holding Column #,##0
    SetCellFormat(2,3,2,FCurRow-1,15);                      //  Date Purchased d-mmm-yy
    SetCellFormat(3,3,6,FCurRow-1, 4);                      //  Price/Cost/Value & Worth Column #,##0.00
    SetCellFormat(7,3,7,FCurRow-1, 8);                      //  Gain/(Loss) value (#,##0.00_);[Red](#,##0.00)
    SetCellFormat(8,3,8,FCurRow-1,10);                      //  Gain/(Loss) percentage 0.00%
    // and now for the totals
    SetCellFormat(4,FCurRow,4,FCurRow, 8);                  //  Total Purchase Cost ($#,##0.00_);[Red]($#,##0.00)
    SetCellFormat(6,FCurRow,7,FCurRow, 8);                  //  Total Current Valuation ($#,##0.00_);[Red]($#,##0.00)
    SetCellFormat(8,FCurRow,8,FCurRow,10);                  //  Total Gain/(Loss) percentage 0.00%
    // now lets align all the data
    SetCellAlignment(1,3,8,FCurRow, haRIGHT, vaCENTER);     // Right Align all the numeric fields
    // and how about some borders for the totals
    SetCellBorders(4, FCurRow, 4, FCurRow, 1, lsThin);      // thin single line at the top of the cell
    SetCellBorders(6, FCurRow, 6, FCurRow, 1, lsThin);
    SetCellBorders(7, FCurRow, 7, FCurRow, 1, lsThin);
    SetCellBorders(4, FCurRow, 4, FCurRow, 3, lsDouble);    // double line at the bottom of the cell
    SetCellBorders(6, FCurRow, 6, FCurRow, 3, lsDouble);    // double line at the bottom of the cell
    SetCellBorders(7, FCurRow, 7, FCurRow, 3, lsDouble);    // double line at the bottom of the cell

    // and now a similar process for the Hi/Lo valuations page
    cxSpreadBook->ActivePage = 1;                           // ensure we are looking at the second page
    // Firstly by setting the column widths
    CHeader = cxSpreadBook->ActiveSheet->Cols;
    CHeader->Size[0] = 140;
    for(int i = 1; i<=4; i++) CHeader->Size[i] =  80;
    // and then the Row heights for the title and column descriptors
    RHeader = cxSpreadBook->ActiveSheet->Rows;
    RHeader->Size[0] =  30;
    RHeader->Size[2] =  30;
    // and how about some cell formatting
    // setting the title and column header fonts
    SetCellFont(0, 0, 0, 0, TFontStyles() << fsBold << fsUnderline, 12);
    // and now adding some cell shading
    // for the sheet title
    SetCellPattern(0, 0, 4, 1, 16, 1, fsSolid);
    // for the column headers
    SetCellPattern(0, 2, 4, 2, 23, 1, fsSolid);
    // and the company names
    SetCellPattern(0, 2, 0, FCurRow - 2, 23, 1, fsSolid);
    // and now some number formatting
    SetCellFormat(1, 3, 4, FCurRow - 1, 4);                 //  Current, Hi, Lo and Average #,##0.00
      // now lets align all the data
    SetCellAlignment(1, 3, 4, FCurRow, haRIGHT, vaCENTER);  // Right Align all the numeric fields

    FIsSaveSpreadSheet = true;                              // enable the save spreadsheet button
  }
  __finally {
    cxSpreadBook->ActivePage = 0;                           // and back to the first page
    cxSpreadBook->EndUpdate();
    Screen->Cursor = CurCursor;                             // and reset cursor
  }
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actApplyFormattingUpdate(TObject *Sender)
{
  ((TCustomAction*)Sender)->Enabled = FIsApplyFormatting;
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::cxSpreadBookSheetPopupMenu(
      TObject *Sender, int X, int Y)
{
  pmSheetPopup->Popup(X, Y);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::edtCellEditChange(TObject *Sender)
{
  if (FIsUpdate) return;
  TcxSSCellObject *CellObject = cxSpreadBook->ActiveSheet->GetCellObject(cxSpreadBook->ActiveSheet->SelectionRect.Left,
    cxSpreadBook->ActiveSheet->SelectionRect.Top);
  try {
    CellObject->SetCellText(((TEdit*)Sender)->Text, false);
  }
  __finally {
    delete CellObject;
  }
  cxSpreadBook->UpdateControl();
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::edtCellEditExit(TObject *Sender)
{
  TcxSSCellObject *CellObject = cxSpreadBook->ActiveSheet->GetCellObject(cxSpreadBook->ActiveSheet->SelectionRect.Left,
    cxSpreadBook->ActiveSheet->SelectionRect.Top);
  try {
    CellObject->Text = CellObject->Text;
  }
  __finally {
    delete CellObject;
  }
  cxSpreadBook->UpdateControl();
  cxSpreadBook->SetFocus();
  cxSpreadBookSetSelection(this, cxSpreadBook->ActiveSheet);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::edtCellEditKeyPress(TObject *Sender,
      char &Key)
{
  if (Key == 13)
  {
     _WINUSER_::SetFocus(cxSpreadBook->Handle);
     edtCellEditExit(Sender);
  }
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actCutExecute(TObject *Sender)
{
  TRect rec;
  rec = cxSpreadBook->SelectionRect;
  cxSpreadBook->ActiveSheet->Copy(rec, true);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actCopyExecute(TObject *Sender)
{
  TRect rec;
  rec = cxSpreadBook->ActiveSheet->SelectionRect;
  cxSpreadBook->ActiveSheet->Copy(rec, false);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actPasteExecute(TObject *Sender)
{
  TRect rec;
  rec = cxSpreadBook->SelectionRect;
  cxSpreadBook->ActiveSheet->Paste(Point(rec.left, rec.top));
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::FormCreate(TObject *Sender)
{
  TDemoBasicMainForm::FormCreate(Sender);
  FIsApplyFormatting = false;
  FIsSaveSpreadSheet = false;
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actSaveSpeadSheetUpdate(TObject *Sender)
{
  ((TCustomAction*)Sender)->Enabled = FIsSaveSpreadSheet;
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actCellsExecute(TObject *Sender)
{
  TSpreadSheetRLModifyForm *Modify;
  Modify = new TSpreadSheetRLModifyForm(this);
     try {
      div_t sHeight, mHeight, sWidth, mWidth;

      sHeight = div(cxSpreadBook->Height, 2);
      mHeight = div(cxSpreadBook->Height, 2);
      Modify->Top = (cxSpreadBook->Top + sHeight.quot) + mHeight.quot;

      sWidth = div(cxSpreadBook->Width, 2);
      mWidth = div(Modify->Width, 2);
      Modify->Left = (cxSpreadBook->Left + sWidth.quot) + mWidth.quot;
      TcxSSModifyType ModifyType = mtDelete;
      if (((TComponent*)Sender)->Tag)
        ModifyType = mtInsert;
       if (Modify->Execute(ModifyType))
         if (ModifyType == mtInsert)
           cxSpreadBook->ActiveSheet->InsertCells(cxSpreadBook->ActiveSheet->SelectionRect, Modify->Modify);
          else
            cxSpreadBook->ActiveSheet->DeleteCells(cxSpreadBook->ActiveSheet->SelectionRect, Modify->Modify);
     }
     __finally {
       Modify->Free();
     }
}
//---------------------------------------------------------------------------


void __fastcall TSpreadSheetRLForm::actFormatCellsExecute(TObject *Sender)
{
  if (FIsUpdate) return;
  cxSpreadBook->ActiveSheet->FormatCells(cxSpreadBook->ActiveSheet->SelectionRect);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actHideCellsExecute(TObject *Sender)
{
  if (FIsUpdate) return;
  cxSpreadBook->ActiveSheet->SetVisibleState(cxSpreadBook->ActiveSheet->SelectionRect, true, true, false);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actShowCellsExecute(TObject *Sender)
{
  if (FIsUpdate) return;
  cxSpreadBook->ActiveSheet->SetVisibleState(cxSpreadBook->ActiveSheet->SelectionRect, true, true, true);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actHideColExecute(TObject *Sender)
{
  if (FIsUpdate) return;
  cxSpreadBook->ActiveSheet->SetVisibleState(cxSpreadBook->ActiveSheet->SelectionRect, true, false, false);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actShowColExecute(TObject *Sender)
{
  if (FIsUpdate) return;
  cxSpreadBook->ActiveSheet->SetVisibleState(cxSpreadBook->ActiveSheet->SelectionRect, true, false, false);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actHideRowExecute(TObject *Sender)
{
  if (FIsUpdate) return;
  cxSpreadBook->ActiveSheet->SetVisibleState(cxSpreadBook->ActiveSheet->SelectionRect, false, true, false);
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actShowRowExecute(TObject *Sender)
{
  if (FIsUpdate) return;
  cxSpreadBook->ActiveSheet->SetVisibleState(cxSpreadBook->ActiveSheet->SelectionRect, false, true, true);
}
//---------------------------------------------------------------------------


void __fastcall TSpreadSheetRLForm::actSaveSpeadSheetExecute(TObject *Sender)
{
  String AFileName;
  if (SaveDialog->Execute())
  {
    AFileName = ChangeFileExt(SaveDialog->FileName, ".xls");
    cxSpreadBook->SaveToFile(AFileName);
    ActiveMDIChild->Caption = ExtractFileName(AFileName);
  }
}
//---------------------------------------------------------------------------



void __fastcall TSpreadSheetRLForm::actSetPrintAreaExecute(
      TObject *Sender)
{
  String sdxInvalidPrintArea;
  sdxInvalidPrintArea = "You've selected a single cell for print area.\r\rIf this is correct, click OK.\r";
  sdxInvalidPrintArea += "If you selected single cell by mistake, click Cancel, select the cell you want to include, and then click Set Print Area again.";
  TRect R = cxSpreadBook->ActiveSheet->SelectionRect;
  if ((R.Right != R.Left) || (R.Bottom != R.Top) || (MessageDlg(sdxInvalidPrintArea, mtWarning, TMsgDlgButtons() << mbOK << mbCancel, 0) == mrOk))
    ((TCustomdxSpreadSheetReportLink*)dxComponentPrinter->ReportLink[0])->PrintArea = R;
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::actClearPrintAreaExecute(
      TObject *Sender)
{
  ((TCustomdxSpreadSheetReportLink*)dxComponentPrinter->ReportLink[0])->ClearPrintArea();
}
//---------------------------------------------------------------------------

void __fastcall TSpreadSheetRLForm::cxSpreadBookActiveSheetChanging(
      TcxCustomSpreadSheetBook *Sender, const int ActiveSheet,
      bool &CanSelect)
{
  if (CanSelect)
   ((TCustomdxSpreadSheetReportLink*)dxComponentPrinter->ReportLink[0])->ClearPrintArea();
}
//---------------------------------------------------------------------------

