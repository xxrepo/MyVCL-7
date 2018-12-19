//---------------------------------------------------------------------------

#ifndef UnboundDesignDefinedDemoMainH
#define UnboundDesignDefinedDemoMainH
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
//---------------------------------------------------------------------------
class TUnboundDesignDefinedDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescrip;
  TStatusBar *sbMain;
  TcxGrid *cxGrid;
  TcxGridBandedTableView *bvCars;
  TcxGridBandedColumn *clnTradeMark;
  TcxGridBandedColumn *clnCar;
  TcxGridBandedColumn *clnPrice;
  TcxGridBandedColumn *clnPicture;
  TcxGridBandedColumn *clnHP;
  TcxGridBandedColumn *clnLiter;
  TcxGridBandedColumn *clnCyl;
  TcxGridBandedColumn *clnTransmissSpeedCount;
  TcxGridBandedColumn *clnTransmissAutomatic;
  TcxGridBandedColumn *clnHyperlink;
  TcxGridLevel *lvCars;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  TcxStyleRepository *cxStyleRepository1;
  TcxStyle *styCar;
  TcxStyle *styGroup;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
private:  // User declarations
public:   // User declarations
  __fastcall TUnboundDesignDefinedDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TUnboundDesignDefinedDemoMainForm *UnboundDesignDefinedDemoMainForm;
//---------------------------------------------------------------------------
#endif
