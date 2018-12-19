//---------------------------------------------------------------------------

#ifndef ViewCardDemoMainH
#define ViewCardDemoMainH
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
class TViewCardDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescrip;
  TStatusBar *sbMain;
  TcxGrid *cxGrid;
  TcxGridDBCardView *cvPersons;
  TcxGridDBCardViewRow *cvPersonsFullname;
  TcxGridDBCardViewRow *cvPersonsID;
  TcxGridDBCardViewRow *cvPersonsFIRSTNAME;
  TcxGridDBCardViewRow *cvPersonsSECONDNAME;
  TcxGridDBCardViewRow *cvPersonsGENDER;
  TcxGridDBCardViewRow *cvPersonsBIRTHNAME;
  TcxGridDBCardViewRow *cvPersonsDATEOFBIRTH;
  TcxGridDBCardViewRow *cvPersonsBIRTHCOUNTRY;
  TcxGridDBCardViewRow *cvPersonsLOCATIONOFBIRTH;
  TcxGridDBCardViewRow *cvPersonsNICKNAME;
  TcxGridDBCardViewRow *cvPersonsHOMEPAGE;
  TcxGridDBCardViewRow *cvPersonsBIOGRAPHY;
  TcxGridLevel *lvPersons;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miShowEmptyRows;
  TMenuItem *miFiltering;
  TMenuItem *miExpandingCollapsing;
  TMenuItem *N1;
  TMenuItem *miRowsCustomization;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall miShowEmptyRowsClick(TObject *Sender);
  void __fastcall miFilteringClick(TObject *Sender);
  void __fastcall miExpandingCollapsingClick(TObject *Sender);
  void __fastcall miRowsCustomizationClick(TObject *Sender);
private:  // User declarations
public:   // User declarations
  __fastcall TViewCardDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TViewCardDemoMainForm *ViewCardDemoMainForm;
//---------------------------------------------------------------------------
#endif
