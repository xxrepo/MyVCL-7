//---------------------------------------------------------------------------
#ifndef StocksMainH
#define StocksMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxSSheet.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <DB.hpp>
//---------------------------------------------------------------------------
class TStocksMainForm : public TForm
{
__published:	// IDE-managed Components
  TcxSpreadSheetBook *cxSpreadBook;
  TToolBar *ToolBar1;
  TToolBar *ToolBar3;
  TToolButton *ToolButton7;
  TToolButton *ToolButton11;
  TToolButton *ToolButton8;
  TToolButton *ToolButton9;
  TToolButton *ToolButton10;
  TSaveDialog *SaveDialog;
  TQuery *Query;
  TImageList *imgStandart;
  TActionList *alMain;
  TAction *actDeleteCells;
  TAction *actSaveSpeadSheet;
  TAction *actInsertCells;
  TAction *actExit;
  TAction *actCut;
  TAction *actCopy;
  TAction *actPaste;
  TAction *actFormatCells;
  TAction *actHideCells;
  TAction *actShowCells;
  TAction *actHideCol;
  TAction *actShowCol;
  TAction *actHideRow;
  TAction *actShowRow;
  TAction *actApplyFormatting;
  TAction *actLoadData;
  TPopupMenu *pmSheetPopup;
  TMenuItem *pmiCut;
  TMenuItem *pmiCopy;
  TMenuItem *pmiPaste;
  TMenuItem *N6;
  TMenuItem *actMerge1;
  TMenuItem *actSplitCells1;
  TMenuItem *MenuItem1;
  TMenuItem *pmiDelete;
  TMenuItem *pmiInsert;
  TMenuItem *MenuItem2;
  TMenuItem *pmiCols;
  TMenuItem *pmiColsHide;
  TMenuItem *pmiColsShow;
  TMenuItem *pmiRows;
  TMenuItem *pmiRowsHide;
  TMenuItem *pmiRowsShow;
  TMenuItem *MenuItem3;
  TMenuItem *MenuItem4;
  TMenuItem *pmiFormatCells;
  TMainMenu *mnuMain;
  TMenuItem *mnuFile;
  TMenuItem *miSaveSpreadSheet;
  TMenuItem *LoadData1;
  TMenuItem *MenuItem6;
  TMenuItem *miExit;
  TMenuItem *mnuEdit;
  TMenuItem *miCut;
  TMenuItem *miCopy;
  TMenuItem *miPaste;
  TMenuItem *N7;
  TMenuItem *miCells;
  TMenuItem *miFormat;
  TMenuItem *miHide;
  TMenuItem *miShow;
  TMenuItem *miDeletecells;
  TMenuItem *Insertcells1;
  TMenuItem *miColumns;
  TMenuItem *MenuItem7;
  TMenuItem *MenuItem8;
  TMenuItem *miRows;
  TMenuItem *Hide3;
  TMenuItem *Show3;
  TMenuItem *mnuConfig;
  TMenuItem *ApplyFormatting1;
  TPanel *pnCells;
  TEdit *edtCellEdit;
  TPanel *pnCellText;
  TPanel *pnCellsRect;
  TPanel *Panel3;
  TButton *Button1;
  TButton *Button2;
  TButton *Button4;
  TButton *Button3;
  TAction *actMergeCells;
  TAction *actSplitCells;
  void __fastcall AlwaysEnabled(TObject *Sender);
  void __fastcall actLoadDataExecute(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall cxSpreadBookSetSelection(TObject *Sender,
          TcxSSBookSheet *ASheet);
  void __fastcall actApplyFormattingExecute(TObject *Sender);
  void __fastcall actApplyFormattingUpdate(TObject *Sender);
  void __fastcall cxSpreadBookSheetPopupMenu(TObject *Sender, int X,
          int Y);
  void __fastcall edtCellEditChange(TObject *Sender);
  void __fastcall edtCellEditExit(TObject *Sender);
  void __fastcall edtCellEditKeyPress(TObject *Sender, char &Key);
  void __fastcall actCutExecute(TObject *Sender);
  void __fastcall actCopyExecute(TObject *Sender);
  void __fastcall actPasteExecute(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall actSaveSpeadSheetUpdate(TObject *Sender);
  void __fastcall actCellsExecute(TObject *Sender);
  void __fastcall actFormatCellsExecute(TObject *Sender);
  void __fastcall actHideCellsExecute(TObject *Sender);
  void __fastcall actShowCellsExecute(TObject *Sender);
  void __fastcall actHideColExecute(TObject *Sender);
  void __fastcall actShowColExecute(TObject *Sender);
  void __fastcall actHideRowExecute(TObject *Sender);
  void __fastcall actShowRowExecute(TObject *Sender);
  void __fastcall actExitExecute(TObject *Sender);
  void __fastcall actSaveSpeadSheetExecute(TObject *Sender);
  void __fastcall actMergeCellsExecute(TObject *Sender);
  void __fastcall actSplitCellsExecute(TObject *Sender);
private:	// User declarations
  bool FIsUpdate;
  int FCurRow;
  bool FIsApplyFormatting;
  bool FIsSaveSpreadSheet;
  String __fastcall GetCellText(TRect SelectionRect, bool R1C1);
  void __fastcall SetCellText(int ACol, int ARow, String AText);
  void __fastcall SetCellDate(int ACol, int ARow, TDateTime ADate);
  void __fastcall SetCellFont(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                          TFontStyles AStyle, int ASize);
  void __fastcall SetCellPattern(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                             Word ABackground, Word AForeground, TcxSSFillStyle AFillStyle);
  void __fastcall SetCellFormat(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow, Word
                            AFormat);
  void __fastcall SetCellAlignment(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                               TcxHorzTextAlign AHorzAlign, TcxVertTextAlign AVertAlign);
  void __fastcall SetCellBorders(int ALeftCol, int ATopRow, int ARightCol, int ABottomRow,
                             int AEdge, TcxSSEdgeLineStyle AStyle);
public:		// User declarations
  __fastcall TStocksMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStocksMainForm *StocksMainForm;
//---------------------------------------------------------------------------
#endif
     