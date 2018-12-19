//---------------------------------------------------------------------------

#ifndef FilterControlDemoMainH
#define FilterControlDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtons.hpp"
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDBData.hpp"
#include "cxDBEditRepository.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxFilterControl.hpp"
#include "cxDBFilterControl.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomPopupMenu.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridPopupMenu.hpp"
#include "cxGridTableView.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxLookAndFeels.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <DBGrids.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
enum TcxLocate {ltNone, ltLeft, ltTop};

class TFilterControlDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TSplitter *Splitter;
  TStatusBar *sbMain;
  TPageControl *PageControl;
  TTabSheet *tsGrid4DisplayStyle;
  TcxGrid *Grid;
  TcxGridDBTableView *tvOrders;
  TcxGridDBColumn *tvOrdersCustomerID;
  TcxGridDBColumn *tvOrdersProductID;
  TcxGridDBColumn *tvOrdersPurchaseDate;
  TcxGridDBColumn *tvOrdersTime;
  TcxGridDBColumn *tvOrdersPaymentAmount;
  TcxGridDBColumn *tvOrdersPaymentType;
  TcxGridDBColumn *tvOrdersQuantity;
  TcxGridLevel *lvOrders;
  TTabSheet *tsStandardDisplayStyle;
  TLabel *Label1;
  TDBGrid *DBGrid;
  TPanel *pnlFilterDialog;
  TcxFilterControl *cxFilterControl;
  TPanel *pnlButtons;
  TcxButton *btnLoad;
  TcxButton *btnSaveAs;
  TcxButton *btnApply;
  TcxButton *btnOK;
  TcxButton *btnCancel;
  TcxDBFilterControl *cxDBFilterControl;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miFilterControl;
  TMenuItem *miFilterControlPosition;
  TMenuItem *miFiltConrolNone;
  TMenuItem *miFiltConrolLeft;
  TMenuItem *miFiltConrolTop;
  TMenuItem *N2;
  TMenuItem *miFillterControlModal;
  TMenuItem *N1;
  TMenuItem *miLookAndFeel;
  TMenuItem *miKind;
  TMenuItem *miFlat;
  TMenuItem *miStandard;
  TMenuItem *miUltraFlat;
  TMenuItem *miNativeStyle;
  TMenuItem *miAbout;
  TcxGridPopupMenu *cxGridPopupMenu1;
  TOpenDialog *OpenDialog;
  TSaveDialog *SaveDialog;
  TcxLookAndFeelController *LookAndFeelController;
  TPopupMenu *PopupMenu;
  TMenuItem *miShowFilterPanel;
  TMenuItem *miFilterPnlNever;
  TMenuItem *miFilterPnlNeverNonEmpty;
  TMenuItem *miFilterPnlAlways;
  TMenuItem *miShowFilterBtn;
  TcxEditRepository *cxEditRepository;
  TcxEditRepositoryLookupComboBoxItem *CustomersEditorItem;
  TcxEditRepositoryLookupComboBoxItem *CarsEditorItem;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall cxFilterControlApplyFilter(TObject *Sender);
  void __fastcall cxDBFilterControlApplyFilter(TObject *Sender);
  void __fastcall btnLoadClick(TObject *Sender);
  void __fastcall btnSaveAsClick(TObject *Sender);
  void __fastcall btnApplyClick(TObject *Sender);
  void __fastcall PageControlChange(TObject *Sender);
  void __fastcall miFiltConrolPosClick(TObject *Sender);
  void __fastcall miFillterControlModalClick(TObject *Sender);
  void __fastcall tvOrdersFilterControlDialogShow(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall tvOrdersDataControllerFilterChanged(TObject *Sender);
  void __fastcall miShowFilterPnlClick(TObject *Sender);
  void __fastcall miShowFilterBtnClick(TObject *Sender);
  void __fastcall miNativeStyleClick(TObject *Sender);
  void __fastcall miLookAndFeelKindClick(TObject *Sender);
private:  // User declarations
   TcxCustomFilterControl* FFilterControl;
   TcxLocate FFilterControlAlign;
   TCloseEvent FCloseEvent;
   void __fastcall Relocate(TcxLocate ALocate);
  void __fastcall ShowButtons(bool AShow);
public:   // User declarations
  __fastcall TFilterControlDemoMainForm(TComponent* Owner);
   void __fastcall FilterDialogClose(System::TObject* Sender, TCloseAction &Action);
};
//---------------------------------------------------------------------------
extern PACKAGE TFilterControlDemoMainForm *FilterControlDemoMainForm;
//---------------------------------------------------------------------------
#endif
 