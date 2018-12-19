//---------------------------------------------------------------------------

#ifndef EQGrid4RLMainH
#define EQGrid4RLMainH
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
#include "dxPSCore.hpp"
#include "dxPScxGrid6Lnk.hpp"
#include <ToolWin.hpp>
#include "dxBkgnd.hpp"
#include "dxPrnDev.hpp"
#include "dxPrnPg.hpp"
#include "dxPSCompsProvider.hpp"
#include "dxPSEdgePatterns.hpp"
#include "dxPSEngn.hpp"
#include "dxPSFillPatterns.hpp"
#include "dxPSGlbl.hpp"
#include "dxPSUtl.hpp"
#include "dxWrap.hpp"
#include "cxGridCustomView.hpp"
//---------------------------------------------------------------------------
class TEQGrid4RLMainForm : public TForm
{
__published:	// IDE-managed Components
        TLabel *lbDescrip;
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
        TToolBar *ToolBar1;
        TToolButton *tbtnPageSetup;
        TToolButton *tbtnPreview;
        TToolButton *tbtnPrint;
        TToolButton *tbtnDesigner;
        TToolButton *ToolButton1;
        TToolButton *tbtnFullCollapse;
        TToolButton *tbtnFullExpand;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miPageSetup;
        TMenuItem *miPrintPreview;
        TMenuItem *Print1;
        TMenuItem *N2;
        TMenuItem *miExit;
        TMenuItem *miOptions;
        TMenuItem *miFullCollapsing;
        TMenuItem *miFullExpand;
        TMenuItem *N3;
        TMenuItem *miPirntingOptions;
        TMenuItem *N1;
        TMenuItem *miGridLookFeel;
        TMenuItem *miKind;
        TMenuItem *miFlat;
        TMenuItem *miStandard;
        TMenuItem *miUltraFlat;
        TMenuItem *miNativeStyle;
        TMenuItem *miSeparator2;
        TMenuItem *miShowDemoDescription;
        TMenuItem *miHelp;
        TMenuItem *miProducts;
        TMenuItem *miDownloads;
        TMenuItem *miForum;
        TMenuItem *miDeveloperExpressontheweb;
        TImageList *ilMain;
        TActionList *sty;
        TAction *actDownloads;
        TAction *actForum;
        TAction *actDXOnTheWeb;
        TAction *actProducts;
        TAction *actExit;
        TAction *actShowDemoDescription;
        TAction *actGridNativeStyle;
        TAction *actPageSetup;
        TAction *actPreview;
        TAction *actPrint;
        TAction *actDesigner;
        TAction *actFullExpand;
        TAction *actFullCollapse;
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
        TdxComponentPrinter *dxComponentPrinter;
        TdxGridReportLink *dxComponentPrinterLink;
  void __fastcall actLookAndFeelKindUltraFlatExecute(TObject *Sender);
  void __fastcall actLookAndFeelKindFlatExecute(TObject *Sender);
  void __fastcall actLookAndFeelKindStandardExecute(TObject *Sender);
  void __fastcall miNativeStyleClick(TObject *Sender);
  void __fastcall actShowDemoDescriptionExecute(TObject *Sender);
  void __fastcall actGridNativeStyleExecute(TObject *Sender);
  void __fastcall actDownloadsExecute(TObject *Sender);
  void __fastcall actForumExecute(TObject *Sender);
  void __fastcall actDXOnTheWebExecute(TObject *Sender);
  void __fastcall actProductsExecute(TObject *Sender);
  void __fastcall AlwaysEnabled(TObject *Sender);
  void __fastcall actExitExecute(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall actPageSetupExecute(TObject *Sender);
  void __fastcall actPreviewExecute(TObject *Sender);
  void __fastcall actPrintExecute(TObject *Sender);
  void __fastcall actDesignerExecute(TObject *Sender);
  void __fastcall actFullExpandExecute(TObject *Sender);
  void __fastcall actFullCollapseExecute(TObject *Sender);
private:	// User declarations
  void __fastcall CustomizeColumns();
  void __fastcall LoadData();
  void __fastcall InitRecord(String const Str, int AInt, TStringList* AValues);
public:		// User declarations
  __fastcall TEQGrid4RLMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEQGrid4RLMainForm *EQGrid4RLMainForm;
//---------------------------------------------------------------------------
#endif
 