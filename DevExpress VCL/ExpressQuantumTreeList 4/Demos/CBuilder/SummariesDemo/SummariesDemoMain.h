//---------------------------------------------------------------------------

#ifndef SummariesDemoMainH
#define SummariesDemoMainH
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
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxLookAndFeels.hpp"
#include "DemoBasicMain.h"
#include "cxCalc.hpp"
#include "cxDBEditRepository.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDBTL.hpp"
#include "cxEditRepositoryItems.hpp"
#include "cxImageComboBox.hpp"
#include "cxInplaceContainer.hpp"
#include "cxMaskEdit.hpp"
#include "cxSpinEdit.hpp"
#include "cxTimeEdit.hpp"
#include "cxTL.hpp"
#include "cxTLData.hpp"
#include "cxCalendar.hpp"
//---------------------------------------------------------------------------
class TSummariesDemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
  TMenuItem *miFlat;
  TMenuItem *miUltraFlat;
  TMenuItem *miStandard;
  TMenuItem *miNativeStyle;
  TcxDBTreeList *tlOrders;
  TcxDBTreeListColumn *tlOrdersCustomer;
  TcxDBTreeListColumn *tlOrdersCar;
  TcxDBTreeListColumn *tlOrdersPurchaseDate;
  TcxDBTreeListColumn *tlOrdersTime;
  TcxDBTreeListColumn *tlOrdersPaymentType;
  TcxDBTreeListColumn *tlOrdersPaymentAmount;
  TcxDBTreeListColumn *tlOrdersQuantity;
  TcxEditRepository *cxEditRepository;
  TcxEditRepositoryLookupComboBoxItem *eriCarLookup;
  TcxEditRepositoryPopupItem *eriCarInfoPopup;
  TMenuItem *miSummaries;
  TMenuItem *miIgnoreNullValues;
  TMenuItem *miOnlyVisaPaymentType;
  TMenuItem *miCustomizeSummaries;
  TMenuItem *miSelectedRecordsOnly;
  TMenuItem *miMultiselect;
  void __fastcall FormShow(TObject *Sender);
  void __fastcall LookAndFeelChange(TObject *Sender);
  void __fastcall miCustomizeSummariesClick(TObject *Sender);
  void __fastcall miIgnoreNullValuesClick(TObject *Sender);
  void __fastcall miMultiselectClick(TObject *Sender);
  void __fastcall miOnlyVisaPaymentTypeClick(TObject *Sender);
  void __fastcall miSelectedRecordsOnlyClick(TObject *Sender);
  void __fastcall tlOrdersAfterSummary(TcxDataSummary *ASender);
  void __fastcall tlOrdersSummary(TcxDataSummaryItems *ASender,
          TcxSummaryEventArguments &Arguments,
          TcxSummaryEventOutArguments &OutArguments);
  void __fastcall tlOrdersSelectionChanged(TObject *Sender);
private:
  bool FCalcForVisaOnly;
  bool FCalcSelectedOnly;
  String GetSQLCondition();
  String SummaryKindToStr(TcxSummaryKind AKind);
public:		// User declarations
  __fastcall TSummariesDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSummariesDemoMainForm *SummariesDemoMainForm;
//---------------------------------------------------------------------------
#endif
