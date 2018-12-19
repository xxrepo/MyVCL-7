//---------------------------------------------------------------------------

#ifndef UnboundSimpleDemoMainH
#define UnboundSimpleDemoMainH
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
#include "cxEditRepositoryItems.hpp"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TUnboundSimpleDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *sbMain;
  TcxGrid *cxGrid;
  TcxGridTableView *tvPlanets;
  TcxGridColumn *tvPlanetsNAME;
  TcxGridColumn *tvPlanetsNO;
  TcxGridColumn *tvPlanetsORBITS;
  TcxGridColumn *tvPlanetsDISTANCE;
  TcxGridColumn *tvPlanetsPERIOD;
  TcxGridColumn *tvPlanetsDISCOVERER;
  TcxGridColumn *tvPlanetsDATE;
  TcxGridColumn *tvPlanetsRADIUS;
  TcxGridLevel *lvPlanets;
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
  TcxGridTableViewStyleSheet *tvssDevExpress;
  TcxEditRepository *edrepMain;
  TcxEditRepositoryTextItem *edrepCenterText;
  TcxEditRepositoryTextItem *edrepRightText;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:  // User declarations
  void __fastcall CustomizeColumns();
  void __fastcall LoadData();
  void __fastcall SetFilter();
  void __fastcall InitRecord(String const Str, int AInt, TStringList* AValues);
public:   // User declarations
  __fastcall TUnboundSimpleDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TUnboundSimpleDemoMainForm *UnboundSimpleDemoMainForm;
//---------------------------------------------------------------------------
#endif
