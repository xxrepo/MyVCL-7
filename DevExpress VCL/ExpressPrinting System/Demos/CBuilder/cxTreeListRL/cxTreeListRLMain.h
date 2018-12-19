//---------------------------------------------------------------------------

#ifndef cxTreeListRLMainH
#define cxTreeListRLMainH
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
#include "cxEditRepositoryItems.hpp"
#include "dxPSCore.hpp"
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
#include "dxPScxCommon.hpp"
#include "cxInplaceContainer.hpp"
#include "cxTextEdit.hpp"
#include "cxTL.hpp"
#include "dxPScxTL5Lnk.hpp"
//---------------------------------------------------------------------------
class TcxTreeListRLMainForm : public TForm
{
__published:	// IDE-managed Components
        TStatusBar *sbMain;
        TdxComponentPrinter *dxComponentPrinter;
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
	TMenuItem *miLookFeel;
	TMenuItem *miKind;
	TMenuItem *miFlat;
	TMenuItem *miStandard;
	TMenuItem *miUltraFlat;
	TMenuItem *miNativeStyle;
	TMenuItem *miSeparator2;
	TMenuItem *miShowDemoDescription;
	TMenuItem *miHelp;
	TMenuItem *miDeveloperExpressontheweb;
	TActionList *sty;
	TAction *actDXOnTheWeb;
	TAction *actExit;
	TAction *actShowDemoDescription;
	TAction *actNativeStyle;
	TAction *actPageSetup;
	TAction *actPreview;
	TAction *actPrint;
	TAction *actDesigner;
	TAction *actFullExpand;
	TAction *actFullCollapse;
	TImageList *ilMain;
	TcxTreeList *tlPlanets;
	TcxTreeListColumn *clName;
	TcxTreeListColumn *clOrbitNumb;
	TcxTreeListColumn *clOrbits;
	TcxTreeListColumn *clDistance;
	TcxTreeListColumn *clPeriod;
	TcxTreeListColumn *clDiscoverer;
	TcxTreeListColumn *clDate;
	TcxTreeListColumn *clRadius;
	TcxTreeListColumn *clImageIndex;
	TImageList *ilPlanets;
	TcxEditRepository *edrepMain;
	TcxEditRepositoryTextItem *edrepCenterText;
	TcxEditRepositoryTextItem *edrepRightText;
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
	TcxStyle *stlGroupNode;
	TcxStyle *stlFixedBand;
	TcxTreeListStyleSheet *TreeListStyleSheetDevExpress;
	TcxTreeListReportLink *dxComponentPrinterLink1;
	TLabel *lbDescrip;
	TToolBar *ToolBar1;
	TToolButton *tbtnPageSetup;
	TToolButton *tbtnPreview;
	TToolButton *tbtnPrint;
	TToolButton *tbtnDesigner;
	TToolButton *ToolButton1;
	TToolButton *tbtnFullCollapse;
	TToolButton *tbtnFullExpand;
  void __fastcall miUltraFlatClick(TObject *Sender);
  void __fastcall miFlatClick(TObject *Sender);
  void __fastcall miStandardClick(TObject *Sender);
  void __fastcall miNativeStyleClick(TObject *Sender);
  void __fastcall actShowDemoDescriptionExecute(TObject *Sender);
  void __fastcall actNativeStyleExecute(TObject *Sender);
  void __fastcall actDXOnTheWebExecute(TObject *Sender);
  void __fastcall AlwaysEnabled(TObject *Sender);
  void __fastcall actExitExecute(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall actPageSetupExecute(TObject *Sender);
  void __fastcall actPreviewExecute(TObject *Sender);
  void __fastcall actPrintExecute(TObject *Sender);
  void __fastcall actDesignerExecute(TObject *Sender);
  void __fastcall actFullExpandExecute(TObject *Sender);
  void __fastcall actFullCollapseExecute(TObject *Sender);
private:	// User declarations
  static String FileName;
  static const int HeaderLineCount = 2;
  static const int ParentKeyField = 2;
  static const int KeyField = 0;
  static const int ImageField = 8;
  static const int DistanceColIndex = 3;
  static const int PeriodColIndex = 4;
  static const int RadiusColIndex = 7;
  static const int ImageIndexColIndex = 8;
  TStringList *FRecords;
  TStringList *FValues;
  TcxTreeListNode* __fastcall AddNode(TcxTreeListNode *AParentNode, String ARecord);
  void __fastcall AddNodes(TcxTreeListNode *AParentNode, String AParentKeyValue);
  String __fastcall GetFieldValue(String ARecord, int AFieldIndex);
  void __fastcall CustomizeColumns();
  void __fastcall LoadData();
public:		// User declarations
  __fastcall TcxTreeListRLMainForm(TComponent* Owner);
};

String TcxTreeListRLMainForm::FileName = "nineplanets.txt";

//---------------------------------------------------------------------------
extern PACKAGE TcxTreeListRLMainForm *cxTreeListRLMainForm;
//---------------------------------------------------------------------------
#endif
