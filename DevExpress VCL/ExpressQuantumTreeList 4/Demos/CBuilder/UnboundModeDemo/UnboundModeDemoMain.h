//---------------------------------------------------------------------------

#ifndef UnboundModeDemoMainH
#define UnboundModeDemoMainH
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
#include "cxEditRepositoryItems.hpp"
#include "cxInplaceContainer.hpp"
#include "cxTextEdit.hpp"
#include "cxTL.hpp"
//---------------------------------------------------------------------------
class TUnboundModeDemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
  TMenuItem *miFlat;
  TMenuItem *miUltraFlat;
  TMenuItem *miStandard;
  TMenuItem *miNativeStyle;
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
  TcxEditRepository *edrepMain;
  TcxEditRepositoryTextItem *edrepCenterText;
  TcxEditRepositoryTextItem *edrepRightText;
  void __fastcall FormShow(TObject *Sender);
  void __fastcall LookAndFeelChange(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
        void __fastcall tlPlanetsDragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept);
private:
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
  __fastcall TUnboundModeDemoMainForm(TComponent* Owner);
};

String TUnboundModeDemoMainForm::FileName = "nineplanets.txt";

//---------------------------------------------------------------------------
extern PACKAGE TUnboundModeDemoMainForm *UnboundModeDemoMainForm;
//---------------------------------------------------------------------------
#endif
