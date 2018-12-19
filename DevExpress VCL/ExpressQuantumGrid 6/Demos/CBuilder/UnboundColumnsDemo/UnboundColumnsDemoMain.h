//---------------------------------------------------------------------------

#ifndef UnboundColumnsDemoMainH
#define UnboundColumnsDemoMainH
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
#include "cxGridBandedTableView.hpp"
#include "cxGridDBBandedTableView.hpp"
//---------------------------------------------------------------------------
class TUnboundColumnsDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescrip;
  TStatusBar *sbMain;
  TcxGrid *Grid;
  TcxGridDBBandedTableView *BandedTableView;
  TcxGridDBBandedColumn *BandedTableViewFIRSTNAME;
  TcxGridDBBandedColumn *BandedTableViewLASTNAME;
  TcxGridDBBandedColumn *BandedTableViewCOMPANYNAME;
  TcxGridDBBandedColumn *BandedTableViewPURCHASEDATE;
  TcxGridDBBandedColumn *BandedTableViewPAYMENTAMOUNT;
  TcxGridDBBandedColumn *BandedTableViewCOPIES;
  TcxGridDBBandedColumn *BandedTableViewSelected;
  TcxGridDBBandedColumn *BandedTableViewSupportRequests;
  TcxGridDBBandedColumn *BandedTableViewLastSupportRequest;
  TcxGridDBBandedColumn *BandedTableViewComments;
  TcxGridLevel *Level;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  TcxStyleRepository *cxStyleRepository1;
  TcxStyle *styChecked;
  TcxStyle *cxStyle1;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall BandedTableViewStylesGetContentStyle(
          TcxCustomGridTableView *Sender, TcxCustomGridRecord *ARecord,
          TcxCustomGridTableItem *AItem, TcxStyle *&AStyle);
private:  // User declarations
  void GenerateUnboundData();
public:   // User declarations
  __fastcall TUnboundColumnsDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TUnboundColumnsDemoMainForm *UnboundColumnsDemoMainForm;
//---------------------------------------------------------------------------
#endif
