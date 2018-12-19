//---------------------------------------------------------------------------

#ifndef CellLevelMultiselectDemoMainH
#define CellLevelMultiselectDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxButtons.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include "cxGridCardView.hpp"
#include "cxGridDBCardView.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxMaskEdit.hpp"
#include "cxSpinEdit.hpp"
#include "cxTextEdit.hpp"
#include <ExtCtrls.hpp>
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TCellLevelMultiselectDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescrip;
  TStatusBar *sbMain;
  TPanel *Panel1;
  TLabel *Label1;
  TLabel *Label2;
  TLabel *Label3;
  TLabel *Label4;
  TLabel *lblSelectedRows;
  TLabel *lblSelectedColumns;
  TLabel *lblSelectedCells;
  TLabel *lblSelectedSummary;
  TcxGrid *Grid;
  TcxGridTableView *TableView;
  TcxGridLevel *Level;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  TcxStyleRepository *cxStyleRepository1;
  TcxStyle *styleSelected;
  TcxStyle *styleNormal;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall TableViewSelectionChanged(
          TcxCustomGridTableView *Sender);
  void __fastcall TableViewCustomDrawColumnHeader(TcxGridTableView *Sender,
          TcxCanvas *ACanvas, TcxGridColumnHeaderViewInfo *AViewInfo,
          bool &ADone);
  void __fastcall TableViewCustomDrawIndicatorCell(
          TcxGridTableView *Sender, TcxCanvas *ACanvas,
          TcxCustomGridIndicatorItemViewInfo *AViewInfo, bool &ADone);
  void __fastcall TableViewMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
private:  // User declarations
  static const RecordCount = 500;
  static const ColumnCount = 256;
  TcxGridColumn *FAnchorLinkedAreaLastColumn;
  void CreateSpreadSheet();
  void CreateColumns();
  void CreateRows();
  String GetColumnCaption(int Index);
  int GetSummOfSelection();
  void InternalDrawItem(TcxCanvas *ACanvas, TRect ABounds,
    TcxBorders ABorders, String AText, bool AIsSelected);
  int SelectedColumnCount();
  int SelectedRowCount();
  void SetColumnsSelected(TcxGridColumn *AFromColumn, TcxGridColumn *AToColumn,
    bool ASelected);
public:   // User declarations
  __fastcall TCellLevelMultiselectDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCellLevelMultiselectDemoMainForm *CellLevelMultiselectDemoMainForm;
//---------------------------------------------------------------------------
#endif
