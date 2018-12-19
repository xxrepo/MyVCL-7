//---------------------------------------------------------------------------

#ifndef ColumnsSimpleDemoMainH
#define ColumnsSimpleDemoMainH
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
#include "cxLookAndFeels.hpp"
#include "cxBlobEdit.hpp"
#include "cxButtonEdit.hpp"
#include "cxCalc.hpp"
#include "cxCheckBox.hpp"
#include "cxDataStorage.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDropDownEdit.hpp"
#include "cxImageComboBox.hpp"
#include "cxMaskEdit.hpp"
#include "cxMRUEdit.hpp"
#include "cxSpinEdit.hpp"
#include "cxTimeEdit.hpp"
//---------------------------------------------------------------------------
class TColumnsSimpleDemoMainForm : public TForm
{
__published:	// IDE-managed Components
        TLabel *lbDescription;
        TcxGrid *Grid;
        TcxGridDBTableView *tvCustomers;
        TcxGridDBColumn *tvCustomersCompany;
        TcxGridDBColumn *tvCustomersState;
        TcxGridDBColumn *tvCustomersCity;
        TcxGridDBColumn *tvCustomersPrefix;
        TcxGridDBColumn *tvCustomersFirstName;
        TcxGridDBColumn *tvCustomersLastName;
        TcxGridDBColumn *tvCustomersCustomer;
        TcxGridDBColumn *tvCustomersZipCode;
        TcxGridDBColumn *tvCustomersAddress;
        TcxGridDBColumn *tvCustomersFaxPhone;
        TcxGridDBTableView *tvOrders;
        TcxGridDBColumn *tvOrdersProductID;
        TcxGridDBColumn *tvOrdersCarInfo;
        TcxGridDBColumn *tvOrdersPurchaseDate;
        TcxGridDBColumn *tvOrdersTime;
        TcxGridDBColumn *tvOrdersPaymentType;
        TcxGridDBColumn *tvOrdersQuantity;
        TcxGridDBColumn *tvOrdersPaymentAmount;
        TcxGridDBColumn *tvOrdersDescription;
        TcxGridLevel *lvCustomers;
        TcxGridLevel *lvOrders;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miExit;
        TMenuItem *miOptions;
        TMenuItem *miShowEditButtons;
        TMenuItem *miEditButtonsNever;
        TMenuItem *miEditButtonsForFocusedRecord;
        TMenuItem *miEditButtonsAlways;
        TMenuItem *miOptionsSelection;
        TMenuItem *miCellSelect;
        TMenuItem *miHideFocusRect;
        TMenuItem *miHideSelection;
        TMenuItem *miInvertSelect;
        TMenuItem *miMultiSelect;
        TMenuItem *N1;
        TMenuItem *miLookFeel;
        TMenuItem *miKind;
        TMenuItem *miFlat;
        TMenuItem *miStandard;
        TMenuItem *miUltraFlat;
        TMenuItem *miOffice11;
        TMenuItem *miNativeStyle;
        TMenuItem *miAbout;
        TcxLookAndFeelController *LookAndFeelController;
        void __fastcall miAboutClick(TObject *Sender);
        void __fastcall miExitClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall miEditButtonsClick(TObject *Sender);
        void __fastcall miCellSelectClick(TObject *Sender);
        void __fastcall miHideFocusRectClick(TObject *Sender);
        void __fastcall miHideSelectionClick(TObject *Sender);
        void __fastcall miInvertSelectClick(TObject *Sender);
        void __fastcall miMultiSelectClick(TObject *Sender);
        void __fastcall tvCustomersStatePropertiesButtonClick(TObject *Sender);
        void __fastcall tvCustomersCityPropertiesButtonClick(TObject *Sender,
                int AButtonIndex);
        void __fastcall tvOrdersCarInfoPropertiesInitPopup(TObject *Sender);
        void __fastcall tvOrdersCarInfoPropertiesCloseUp(TObject *Sender);
        void __fastcall GridFocusedViewChanged(TcxCustomGrid *Sender,
                TcxCustomGridView *APrevFocusedView,
                TcxCustomGridView *AFocusedView);
        void __fastcall miLookAndFeelKindClick(TObject *Sender);
        void __fastcall miNativeStyleClick(TObject *Sender);
        void __fastcall tvCustomersCompanyGetCellHint(
          TcxCustomGridTableItem *Sender, TcxCustomGridRecord *ARecord,
          TcxGridTableDataCellViewInfo *ACellViewInfo,
          const TPoint &AMousePos, TCaption &AHintText,
          bool &AIsHintMultiLine, TRect &AHintTextRect);
private:	// User declarations
        TcxGridTableView* GetView();
        void __fastcall UpdateMenu();
public:		// User declarations
        __fastcall TColumnsSimpleDemoMainForm(TComponent* Owner);
        __property TcxGridTableView* View = {read=GetView};
};
//---------------------------------------------------------------------------
extern PACKAGE TColumnsSimpleDemoMainForm *ColumnsSimpleDemoMainForm;
//---------------------------------------------------------------------------
#endif
