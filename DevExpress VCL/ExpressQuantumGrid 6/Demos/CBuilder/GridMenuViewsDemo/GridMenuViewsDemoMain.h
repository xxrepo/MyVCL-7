//---------------------------------------------------------------------------

#ifndef GridMenuViewsDemoMainH
#define GridMenuViewsDemoMainH
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
#include "cxGridCustomPopupMenu.hpp"
#include "cxGridPopupMenu.hpp"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TGridMenuViewsDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *sbMain;
  TcxGrid *Grid;
  TcxGridDBTableView *tvOrders;
  TcxGridDBColumn *tvOrdersCustomerID;
  TcxGridDBColumn *tvOrdersProductID;
  TcxGridDBColumn *tvOrdersPurchaseDate;
  TcxGridDBColumn *tvOrdersPurchaseMonth;
  TcxGridDBColumn *tvOrdersPaymentType;
  TcxGridDBColumn *tvOrdersPaymentAmount;
  TcxGridDBColumn *tvOrdersDescription;
  TcxGridDBColumn *tvOrdersQuantity;
  TcxGridLevel *lvOrders;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *CustomizePopupmenus1;
  TMenuItem *miUseBuiltInPopupMenu;
  TMenuItem *miAddCopyToClipboard;
  TMenuItem *miUseUserPopupMenu;
  TMenuItem *miAbout;
  TcxGridPopupMenu *GridPopupMenu;
  TPopupMenu *PopupMenu;
  TMenuItem *miInsert;
  TMenuItem *miDelete;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall miCopyToClipboardClick(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall GridMenuPopup(TComponent *ASenderMenu,
      TcxCustomGridHitTest *AHitTest, int X, int Y);
  void __fastcall miDeleteClick(TObject *Sender);
  void __fastcall miInsertClick(TObject *Sender);
  void __fastcall miUseBuiltInPopupMenuClick(TObject *Sender);
  void __fastcall miUseCopyClipboardItemClick(TObject *Sender);
  void __fastcall miUseCustomPopupMenuClick(TObject *Sender);
private:  // User declarations
  int GetSummaryItemIndexByColumn(TcxDataSummaryItems *ASummaryItems,
    TcxGridColumn *AColumn);
  Variant GetFooterSummaryValue(TcxGridFooterCellHitTest *AHitTest);
  Variant GetGroupFooterSummaryValue(TcxGridGroupFooterCellHitTest *AHitTest);
public:   // User declarations
  TMenuItem *FMenuItem;
  void InsertMenuItem();
  __fastcall TGridMenuViewsDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGridMenuViewsDemoMainForm *GridMenuViewsDemoMainForm;
//---------------------------------------------------------------------------
#endif
