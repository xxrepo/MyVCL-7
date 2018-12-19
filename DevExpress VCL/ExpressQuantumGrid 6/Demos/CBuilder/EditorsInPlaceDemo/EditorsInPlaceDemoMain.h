//---------------------------------------------------------------------------

#ifndef EditorsInPlaceDemoMainH
#define EditorsInPlaceDemoMainH
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
#include "cxGridCardView.hpp"
#include "cxGridDBCardView.hpp"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TEditorsInPlaceDemoMainForm : public TForm
{
__published:	// IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *sbMain;
  TcxGrid *Grid;
  TcxGridDBCardView *cvCustomers;
  TcxGridDBCardViewRow *cvCustomersCompany;
  TcxGridDBCardViewRow *cvCustomersState;
  TcxGridDBCardViewRow *cvCustomersCity;
  TcxGridDBCardViewRow *cvCustomersPrefix;
  TcxGridDBCardViewRow *cvCustomersFirstName;
  TcxGridDBCardViewRow *cvCustomersLastName;
  TcxGridDBCardViewRow *cvCustomersCustomer;
  TcxGridDBCardViewRow *cvCustomersZipCode;
  TcxGridDBCardViewRow *cvCustomersAddress;
  TcxGridDBCardViewRow *cvCustomersFaxPhone;
  TcxGridDBCardViewRow *cvCustomersDescription;
  TcxGridDBCardView *cvOrders;
  TcxGridDBCardViewRow *cvOrdersCustomerID;
  TcxGridDBCardViewRow *cvOrdersProductID;
  TcxGridDBCardViewRow *cvOrdersPurchaseDate;
  TcxGridDBCardViewRow *cvOrdersTime;
  TcxGridDBCardViewRow *cvOrdersPaymentType;
  TcxGridDBCardViewRow *cvOrdersQuantity;
  TcxGridDBCardViewRow *cvOrdersPaymentAmount;
  TcxGridDBCardViewRow *cvOrdersDescription;
  TcxGridDBCardView *cvCars;
  TcxGridDBCardViewRow *cvCarsCategory;
  TcxGridDBCardViewRow *cvCarsCar;
  TcxGridDBCardViewRow *cvCarsPicture;
  TcxGridDBCardViewRow *cvCarsInfo;
  TcxGridDBCardViewRow *cvCarsHyperlink;
  TcxGridLevel *lvCustomers;
  TcxGridLevel *lvOrders;
  TcxGridLevel *lvCars;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miShowEditButtons;
  TMenuItem *miEditButtonsNever;
  TMenuItem *miEditButtonsForFocusedRecord;
  TMenuItem *miEditButtonsAlways;
  TMenuItem *N2;
  TMenuItem *miLookAndFeel;
  TMenuItem *miKind;
  TMenuItem *miFlat;
  TMenuItem *miStandard;
  TMenuItem *miUltraFlat;
  TMenuItem *miNativeStyle;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall cvCustomersStatePropertiesButtonClick(TObject *Sender);
  void __fastcall cvCustomersCityPropertiesButtonClick(TObject *Sender,
      int AButtonIndex);
  void __fastcall GridFocusedViewChanged(TcxCustomGrid *Sender,
      TcxCustomGridView *APrevFocusedView, TcxCustomGridView *AFocusedView);
  void __fastcall miEditButtonsClick(TObject *Sender);
  void __fastcall cvCarsCustomDrawCell(TcxCustomGridTableView *Sender,
      TcxCanvas *ACanvas, TcxGridTableDataCellViewInfo *AViewInfo,
      bool &ADone);
  void __fastcall miNativeStyleClick(TObject *Sender);
  void __fastcall miLookAndFeelClick(TObject *Sender);
private:	// User declarations
  void UpdateOptions();
public:		// User declarations
  __fastcall TEditorsInPlaceDemoMainForm(TComponent* Owner);
};

//---------------------------------------------------------------------------
extern PACKAGE TEditorsInPlaceDemoMainForm *EditorsInPlaceDemoMainForm;
//---------------------------------------------------------------------------

class TcxPopupEditPropertiesAccess : public TcxPopupEditProperties
{
public:
  __property ImmediatePopup;
};
//---------------------------------------------------------------------------
#endif
