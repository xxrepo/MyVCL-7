//---------------------------------------------------------------------------

#ifndef FeaturesDemoMainH
#define FeaturesDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <cxControls.hpp>
#include <cxSSheet.hpp>
#include "FeatureChild.h"
#include <StdActns.hpp>

//---------------------------------------------------------------------------
typedef TcxSpreadSheetBook* cxSpreadSheetBook;
typedef TcxSSBookSheet* cxSpreadSheet;

enum TStyleValue {svAlign, svFontName, svSize, svBold, svItalic, svUnderline, svStrikeOut};
typedef Set<TStyleValue, svAlign, svStrikeOut> TStyleValues;

class TFeaturesMainForm : public TForm
{
__published:	// IDE-managed Components
  TControlBar *ControlBar1;
  TToolBar *tbsFormatting;
  TComboBox *cbxFont;
  TComboBox *cbxSize;
  TToolButton *ToolButton9;
  TToolButton *tbLeftAlign;
  TToolButton *tbCenterAlign;
  TToolButton *tbRightAlign;
  TToolButton *ToolButton10;
  TToolButton *tbBold;
  TToolButton *tbItalic;
  TToolButton *tbUnderline;
  TToolButton *tbStrikeOut;
  TToolButton *ToolButton11;
  TToolButton *tbMerge;
  TToolButton *tgSplit;
  TToolButton *ToolButton16;
  TToolButton *tbSummary;
  TToolButton *tbSortAscending;
  TToolButton *tbSortDescending;
  TToolButton *ToolButton18;
  TToolButton *tbBorderStyle;
  TToolBar *tbsStandart;
  TToolButton *tbsNew;
  TToolButton *tbsOpen;
  TToolButton *tbsSave;
  TToolButton *ToolButton7;
  TToolButton *tbsCut;
  TToolButton *tbsCopy;
  TToolButton *tbsPaste;
  TPanel *pnCells;
  TEdit *edtCellEdit;
  TPanel *pnCellText;
  TPanel *pnCellsRect;
  TOpenDialog *OpenDialog;
  TImageList *imgFormatting;
  TImageList *imgBordersImages;
  TImageList *imgStandart;
  TPopupMenu *pmSheetPopup;
  TMenuItem *pmiCut;
  TMenuItem *pmiCopy;
  TMenuItem *pmiPaste;
  TMenuItem *N9;
  TMenuItem *pmiDelete;
  TMenuItem *pmiInsert;
  TMenuItem *N10;
  TMenuItem *pmiFormatCells;
  TMenuItem *pmiCols;
  TMenuItem *pmiColsHide;
  TMenuItem *pmiColsShow;
  TMenuItem *pmiRows;
  TMenuItem *pmiRowsHide;
  TMenuItem *pmiRowsShow;
  TPopupMenu *pmBorders;
  TMenuItem *N11;
  TMenuItem *N21;
  TMenuItem *N31;
  TMenuItem *N41;
  TMenuItem *N51;
  TMenuItem *N61;
  TMenuItem *N71;
  TMenuItem *N81;
  TMenuItem *N91;
  TMenuItem *N101;
  TMenuItem *N111;
  TMenuItem *N121;
  TMainMenu *mnuMain;
  TMenuItem *mnuFile;
  TMenuItem *miNew;
  TMenuItem *N2;
  TMenuItem *miOpenSpreadSheet;
  TMenuItem *miSaveSpreadSheet;
  TMenuItem *N1;
  TMenuItem *miExit;
  TMenuItem *mnuEdit;
  TMenuItem *miAutomaticcalculation;
  TMenuItem *miRecalcformulas;
  TMenuItem *N3;
  TMenuItem *miCut;
  TMenuItem *miCopy;
  TMenuItem *miPaste;
  TMenuItem *N7;
  TMenuItem *miCells;
  TMenuItem *miFormat;
  TMenuItem *miHide;
  TMenuItem *miShow;
  TMenuItem *miColumns;
  TMenuItem *Hide2;
  TMenuItem *Show2;
  TMenuItem *miRows;
  TMenuItem *Hide3;
  TMenuItem *Show3;
  TMenuItem *miDeletecells;
  TMenuItem *Insertcells1;
  TMenuItem *mnuInsert;
  TMenuItem *miCells1;
  TMenuItem *miRow;
  TMenuItem *miColumn;
  TMenuItem *N12;
  TMenuItem *miSheet;
  TMenuItem *mnuConfig;
  TMenuItem *miBeveledLookandFeel;
  TMenuItem *miBufferedpaint;
  TMenuItem *N4;
  TMenuItem *miShowcaptions;
  TMenuItem *miShowgrid;
  TMenuItem *miShowheaders;
  TMenuItem *miShowformulas;
  TMenuItem *N5;
  TMenuItem *miR1C1Referencestyle;
  TMenuItem *mnuWindow;
  TPopupMenu *pmSummary;
  TMenuItem *Sum1;
  TMenuItem *Average1;
  TMenuItem *Count1;
  TMenuItem *Max1;
  TMenuItem *Min1;
  TActionList *alMain;
  TAction *actNew;
  TAction *actOpenSpreadSheet;
  TAction *actSaveSpeadSheet;
  TAction *actExit;
  TAction *actAutomaticCalc;
  TAction *actRecalcFormulas;
  TAction *actCut;
  TAction *actCopy;
  TAction *actPaste;
  TAction *actBeveledLookandFeel;
  TAction *actBufferedpaint;
  TAction *actShowcaptions;
  TAction *actShowgrid;
  TAction *actShowheaders;
  TAction *actShowformulas;
  TAction *actR1C1Referencestyle;
  TAction *actCells;
  TAction *actRow;
  TAction *actColumn;
  TAction *actSheet;
  TWindowClose *actWindowClose;
  TWindowCascade *actWindowCascade;
  TWindowTileHorizontal *actWindowTileHorizontal;
  TWindowTileVertical *actWindowTileVertical;
  TWindowMinimizeAll *actWindowMinimizeAll;
  TWindowArrange *actWindowArrange;
  TMenuItem *Arrange1;
  TMenuItem *Cascade1;
  TMenuItem *Close1;
  TMenuItem *MinimizeAll1;
  TMenuItem *TileHorizontally1;
  TMenuItem *TileVertically1;
  TAction *actCellLeftAlign;
  TAction *actCellRightAlign;
  TAction *actCellCenterAlign;
  TAction *actBold;
  TAction *actItalic;
  TAction *actUnderline;
  TAction *actStrikeOut;
  TAction *actMergeCells;
  TAction *actSplitCells;
  TAction *actSortAscending;
  TAction *actSortDescending;
  TAction *actSum;
  TAction *actFont;
  TAction *actFontSize;
  TAction *actAverage;
  TAction *actCount;
  TAction *actMax;
  TAction *actMin;
  TAction *actFormatCells;
  TAction *actHideCells;
  TAction *actShowCells;
  TAction *actHideCol;
  TAction *actShowCol;
  TAction *actHideRow;
  TAction *actShowRow;
  TAction *actDeleteCells;
  TAction *actInsertCells;
  TSaveDialog *SaveDialog;
  TMenuItem *Show1;
  TMenuItem *Hide1;
  TMenuItem *actMerge1;
  TMenuItem *actSplitCells1;
  TMenuItem *N6;
  TAction *actSaveAs;
  TMenuItem *SaveSpreadSheetAs1;
  TPopupMenu *pmRedo;
  TPopupMenu *pmUndo;
  TImageList *imgHistory;
  TToolBar *tbHistory;
  TToolButton *tbUndo;
  TToolButton *tbRedo;
  TAction *actUndo;
  TAction *actRedo;
  void __fastcall actNewExecute(TObject *Sender);
  void __fastcall actCloseWorkBookExecute(TObject *Sender);
  void __fastcall actExitExecute(TObject *Sender);
  void __fastcall SaveSpreadSheet1Click(TObject *Sender);
  void __fastcall actAutomaticCalcExecute(TObject *Sender);
  void __fastcall actRecalcFormulasExecute(TObject *Sender);
  void __fastcall actCopyExecute(TObject *Sender);
  void __fastcall AlwaysEnabled(TObject *Sender);
  void __fastcall actCutExecute(TObject *Sender);
  void __fastcall actPasteExecute(TObject *Sender);
  void __fastcall edtCellEditChange(TObject *Sender);
  void __fastcall edtCellEditExit(TObject *Sender);
  void __fastcall cbxSizeKeyPress(TObject *Sender, char &Key);
  void __fastcall actBeveledLookandFeelExecute(TObject *Sender);
  void __fastcall actBufferedpaintExecute(TObject *Sender);
  void __fastcall actShowcaptionsExecute(TObject *Sender);
  void __fastcall actShowgridExecute(TObject *Sender);
  void __fastcall actShowheadersExecute(TObject *Sender);
  void __fastcall actShowformulasExecute(TObject *Sender);
  void __fastcall actR1C1ReferencestyleExecute(TObject *Sender);
  void __fastcall actCellLeftAlignExecute(TObject *Sender);
  void __fastcall actCellRightAlignExecute(TObject *Sender);
  void __fastcall actBoldExecute(TObject *Sender);
  void __fastcall actFontSizeExecute(TObject *Sender);
  void __fastcall actCellCenterAlignExecute(TObject *Sender);
  void __fastcall actMergeCellsExecute(TObject *Sender);
  void __fastcall actSplitCellsExecute(TObject *Sender);
  void __fastcall actSummaryExecute(TObject *Sender);
  void __fastcall actCellsExecute(TObject *Sender);
  void __fastcall actRowExecute(TObject *Sender);
  void __fastcall actColumnExecute(TObject *Sender);
  void __fastcall actSheetExecute(TObject *Sender);
  void __fastcall actFontExecute(TObject *Sender);
  void __fastcall actSortAscendingExecute(TObject *Sender);
  void __fastcall actStrikeOutExecute(TObject *Sender);
  void __fastcall actUnderlineExecute(TObject *Sender);
  void __fastcall actItalicExecute(TObject *Sender);
  void __fastcall actShowRowExecute(TObject *Sender);
  void __fastcall actHideRowExecute(TObject *Sender);
  void __fastcall actHideColExecute(TObject *Sender);
  void __fastcall actShowColExecute(TObject *Sender);
  void __fastcall actFormatCellsExecute(TObject *Sender);
  void __fastcall actHideCellsExecute(TObject *Sender);
  void __fastcall actShowCellsExecute(TObject *Sender);
  void __fastcall actOpenSpreadSheetExecute(TObject *Sender);
  void __fastcall actSaveSpeadSheetExecute(TObject *Sender);
  void __fastcall edtCellEditKeyPress(TObject *Sender, char &Key);
  void __fastcall MeasureItem(TObject *Sender, TCanvas *ACanvas,
          int &Width, int &Height);
  void __fastcall DrawItem(TObject *Sender, TCanvas *ACanvas, TRect &ARect,
          bool Selected);
  void __fastcall BordersClick(TObject *Sender);
  void __fastcall actSaveAsExecute(TObject *Sender);
  void __fastcall tbBorderStyleClick(TObject *Sender);
  void __fastcall cbxFontKeyPress(TObject *Sender, char &Key);
  void __fastcall pmUndoPopup(TObject *Sender);
  void __fastcall URMeasureItem(TObject *Sender, TCanvas *ACanvas,
          int &Width, int &Height);
  void __fastcall URDrawItem(TObject *Sender, TCanvas *ACanvas,
          const TRect &ARect, bool Selected);
  void __fastcall UndoItemClick(TObject *Sender);
  void __fastcall RedoItemClick(TObject *Sender);
  void __fastcall actHistory(TObject *Sender);
  void __fastcall actRedoUpdate(TObject *Sender);
  void __fastcall actUndoExecute(TObject *Sender);
  void __fastcall actRedoExecute(TObject *Sender);
  void __fastcall pmRedoPopup(TObject *Sender);
  void __fastcall IsEditorMode(TObject *Sender);
private:	// User declarations
  int FSummaryItemHeight;
  bool FIsUpdate;
  String __fastcall GetCellText(TRect SelectionRect, bool R1C1);
  void __fastcall SetCellsStyle(TStyleValues AValuesSet, TcxHorzTextAlign AAlign,
  int AFontSize, String AFontName, TFontStyles AStyles);
  void __fastcall SetValue(TStyleValues AValueSet, TFontStyles AStyles, TStyleValue AFlag, TFontStyle ANeedStyle,
    TFontStyles *ASetStyles);
  void __fastcall CalculateSummary(int AType);
  void __fastcall CheckMenuItem(TObject *Sender)  {
    TCustomAction *Action = static_cast<TCustomAction*>(Sender);
    Action->Checked = !Action->Checked; }
  void __fastcall SetHorzStyle(TRect ARect, int ARow, TcxSSEdgeLineStyle AStyle);
  void __fastcall SetVertStyle(TRect ARect, int ACol, TcxSSEdgeLineStyle AStyle);
  void __fastcall DrawActionsCount(TPopupMenu *APopupMenu, TCanvas *ACanvas, TMenuItem *ASender, const TRect ARect, const String AInfoStr);
  void __fastcall DrawUndoRedoItem(TPopupMenu *APopupMenu, TMenuItem *ASender, TCanvas *ACanvas, const TRect ARect, bool Selected, const String AInfoStr);
protected:
  cxSpreadSheetBook __fastcall GetSpreadSheet() { return (((TFeatureChildForm*)ActiveMDIChild)->cxSpreadSheetBook);};
  cxSpreadSheet  __fastcall GetActiveSpreadSheet() {return ( ((TFeatureChildForm*)ActiveMDIChild)->cxSpreadSheetBook->ActiveSheet);};
  void __fastcall SetStates();
  void __fastcall cxSpreadBookSetSelection(TObject *Sender, TcxSSBookSheet *ASheet);
  __property bool IsUpdate = {read = FIsUpdate, write = FIsUpdate };
public:		// User declarations
  void __fastcall NewSheet(String SheetName);
  __fastcall TFeaturesMainForm(TComponent* Owner);
  __property cxSpreadSheetBook SheetBook = {read = GetSpreadSheet};
  __property cxSpreadSheet ActiveSpreadSheet = {read = GetActiveSpreadSheet};
};
//---------------------------------------------------------------------------
extern PACKAGE TFeaturesMainForm *FeaturesMainForm;
//---------------------------------------------------------------------------
#endif
   