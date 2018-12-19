//---------------------------------------------------------------------------

#ifndef SummariesDemoEditSummaryH
#define SummariesDemoEditSummaryH
//---------------------------------------------------------------------------
#include "..\cxDemosBCB.inc"
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtons.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDropDownEdit.hpp"
#include "cxEdit.hpp"
#include "cxImageComboBox.hpp"
#include "cxListBox.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include "cxDBTL.hpp"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TSummariesDemoEditSummaryForm : public TForm
{
__published:	// IDE-managed Components
  TPanel *Panel2;
  TGroupBox *gbSummaryFooter;
  TLabel *Label1;
  TLabel *Label3;
  TcxComboBox *cbCalculatedField;
  TcxImageComboBox *cbSummaryKind;
  TPanel *Panel1;
  TcxButton *btnExit;
  TGroupBox *gbSummaries;
  TPanel *Panel4;
  TcxListBox *lbColumns;
  void __fastcall cbCalculatedFieldPropertiesChange(TObject *Sender);
  void __fastcall lbColumnsClick(TObject *Sender);
  void __fastcall cbSummaryKindPropertiesChange(TObject *Sender);
  void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall btnExitClick(TObject *Sender);
private:
  bool FLockColumnSummary;
  TcxDBTreeList *FTreeList;
  void __fastcall AddSummaryKind(TcxSummaryKind AKind);
  void __fastcall SetItemProperties(TcxImageComboBoxItem *AItem,
    String ADescription, int AImageIndex, int AValue);
  void __fastcall PopulateVisibleColumnsList();
  void __fastcall PopulateFieldList(TDataSet *ADataSet);
  void __fastcall UpdateCalcField(TcxDBTreeListColumn *AColumn);
  void __fastcall UpdateSummaryKinds(TcxSummaryKind AKind, TField *AField);
  void __fastcall SetTreeList(TcxDBTreeList *Value);
public:
  __property TcxDBTreeList *TreeList = {read=FTreeList, write=SetTreeList};
  __fastcall TSummariesDemoEditSummaryForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
#if BCB6
typedef Set<TFieldType, ftUnknown, ftFMTBcd> TcxFieldTypes;
#else
typedef Set<TFieldType, ftUnknown, ftDataSet> TcxFieldTypes;
#endif
//---------------------------------------------------------------------------
extern PACKAGE TSummariesDemoEditSummaryForm *SummariesDemoEditSummaryForm;
//---------------------------------------------------------------------------
#endif
