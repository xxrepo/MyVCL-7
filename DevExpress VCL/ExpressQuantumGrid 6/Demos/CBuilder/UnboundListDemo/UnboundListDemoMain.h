//---------------------------------------------------------------------------

#ifndef UnboundListDemoMainH
#define UnboundListDemoMainH
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
#include "UnboundListDemoClasses.h"
#include "cxDataStorage.hpp"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TUnboundListDemoMainForm : public TForm
{
__published:	// IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *sbMain;
  TcxGrid *cxGrid;
  TcxGridTableView *tvCustomers;
  TcxGridLevel *lvCustomers;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miAbout;
  TcxStyleRepository *StyleRepository;
  TcxStyle *cxStyle1;
  TcxStyle *cxStyle2;
  TcxStyle *cxStyle3;
  TcxStyle *cxStyle4;
  TcxStyle *cxStyle5;
  TcxStyle *cxStyle6;
  TcxStyle *cxStyle7;
  TcxStyle *cxStyle8;
  TcxStyle *cxStyle9;
  TcxStyle *cxStyle10;
  TcxStyle *cxStyle11;
  TcxStyle *cxStyle12;
  TcxStyle *cxStyle13;
  TcxStyle *cxStyle14;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
  TcxGridPopupMenu *cxGridPopupMenu;
        TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
        void __fastcall miExitClick(TObject *Sender);
private:	// User declarations
  TCustomerList* CustomerList;
  TCustomerDataSource* CustomerDataSource;
  void __fastcall GenerateColumns();
  void __fastcall LoadData();
  void __fastcall CustomizeGrid();
  void __fastcall SaveData();
public:		// User declarations
  __fastcall TUnboundListDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TUnboundListDemoMainForm *UnboundListDemoMainForm;
//---------------------------------------------------------------------------
#endif
